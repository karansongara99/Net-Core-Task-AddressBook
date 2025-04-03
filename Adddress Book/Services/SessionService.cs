namespace CrudOperationEntityFrameWork.Services
{
    public class SessionService
    {
        private readonly IHttpContextAccessor httpContextAccessor;

        public SessionService(IHttpContextAccessor httpContextAccessor)
        {
            this.httpContextAccessor = httpContextAccessor;
        }

        public int GetUserId()
        {
            return httpContextAccessor.HttpContext.Session.GetInt32(Constants.Constants.USERID_SESSION_KEY) ?? -1;
        }

        public string GetUserName()
        {
            return httpContextAccessor.HttpContext.Session.GetString(Constants.Constants.USERNAME_SESSION_KEY);
        }
    }
}
