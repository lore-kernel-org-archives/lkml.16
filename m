Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46837372
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 01:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751507616; cv=none; b=BVDw7uwR+kFu36ElbKDTfkLrCdBwxQHZOERclQl4exjP29l5lD2DTmc+R5oSOB8mftyIsGAUKtspLbVAXs6I/BlZEbTQgABkapYgwZJBbrx44JYwys44zm3PiofUXQugd+yl0fL5zpAMyKwlAMy3hkKExFggJaD6xHxSYSlOa8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751507616; c=relaxed/simple;
	bh=yJ+U7oGcF61QTjGZ97rEFlXbvX/Glgbaedvp4h74bE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tsAPV/cvmmsNgiBGy60ukTXCRhnmp4S9VMmUDnsOOPHXzZb+huQBVpDpa+s4P5Y7UUiiD3EH+Vor5SToXHNue2ucgYSKOVFQg0mcU/Y3MFT39qOsAxlFNvRr86yXYvczQBy08aiS/rur/g+x2EWKPcsrpnKcwqthMrOJiGrnxoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yk80RK1S; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yk80RK1S"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b31d8dd18cbso9141123a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 18:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751507613; x=1752112413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm8Gpzeema4ttu+gBieWjUgVngRGliuxzJUQN6YXW84=;
        b=Yk80RK1SirrQCzbUJqGOxrK6esYxyhUfn+TPu4OAPoNcY6ggk6OYNFfpZhrJ48Jcgx
         mzwdWUSGYRvQ5ExU9W0J/ykhI/tnRcO+DF/LZd/QYmoJpLVI1El2S3AzkIbqCPznY/Ei
         WHERwhX7iTHCxsG+HdQWt76Gk7caYFdekfCorLhw61EbAo3P0CdKEbUGo8rCWG1SBnXZ
         HqNV6EZltyKZu9pC5jARk9DrTSCPkrHpiePg6ppb/zQZpgKErQ1nIngig5iE7fYcmuc7
         NiWg12dpU4z0v6LgSHXUPlcO+6NebkCEaTiEWQZSbwMFinRvhYbX1Eu+7/qs0jRCX1NB
         DOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751507613; x=1752112413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fm8Gpzeema4ttu+gBieWjUgVngRGliuxzJUQN6YXW84=;
        b=d7KL64KP2my7dAjwPazJqjRMmsQ4xyYMSeuptAiq+garStVZ7trwEiSeLlCggIqUye
         NBS1Brrp71bmjJpXrgjJj3HuBQ9FX4G36kaeNJR+j1Zg5tkkez8PyWxLSJcmEZLfAF45
         VxmqFzBafmqR+l5pjQRP5UD01Ulz9ukSX5rdGOvqYh/Bn8LbuMfN7vKgrD2rlbX/tXTg
         ogDdJLT9FxEm6Yxu6/rcTWZEqgndyWZFx5GuIUDHVmbwGB64uc1Wq4khu2Bh/HmdXqup
         Q4+9OxRsKAjMlVj/8N5N8/pxY1UDku/AL/9tDf2ISos9KH6W4HLnULgb56Tr0gdtmm84
         u9fA==
X-Gm-Message-State: AOJu0YwAQSQy7TURvr3+4xNXfs1EFF/Kk7GOyzgFvRiUheBosaZ8JnG5
	TCMKxuar6iXVufKpF80ggraLkVHWk1aBPl5ck7IdQusuB/stKlMBkFF/3JfqJUhSm8nbmGenYM3
	XQMPznAcObCdF5VMmKij2hY7LLJn0TH7eSe9trQUk
X-Gm-Gg: ASbGnct3ZgbrcgKTB1sLvJcIeoJiw4R+BmZLS4Zue0Io5A/XirQfVXo7SDadFi37Nlf
	Kx/vf2xBtQRvX1UYa8Jlz85zXX1ktgWkPqlttrG/r/ja6fCDhHWFTXCM1S5xauTG01zx9ZPuhh2
	XH/vzRDlEkpycj9ydlvNKZ/QR1w/9ayNnb09w2y4mkKdLlM2AdIBCAFy1BQ/78m2fI+FfCLvlb9
	nU1MScS6/Qurqg=
X-Google-Smtp-Source: AGHT+IHow209Uc3fjWQzn9aKUfsgLPs3aCHPapfLAKy6OIlxWSVPSS3hVjolrnQY1XrprecCfBKN3L9kCL+0sf6Y+gA=
X-Received: by 2002:a17:90b:5408:b0:312:959:dc3c with SMTP id
 98e67ed59e1d1-31a90b2ade1mr7656256a91.10.1751507612991; Wed, 02 Jul 2025
 18:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701083922.97928-1-aleksandr.mikhalitsyn@canonical.com> <20250701083922.97928-9-aleksandr.mikhalitsyn@canonical.com>
In-Reply-To: <20250701083922.97928-9-aleksandr.mikhalitsyn@canonical.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 2 Jul 2025 18:53:21 -0700
X-Gm-Features: Ac12FXxAbYbkEnnb8aswFlGVfvCrj3uf2ybZZJVnzb4KilKyyYVbRlTwcj812SM
Message-ID: <CAAVpQUDFzPBJmCeawhaHL5Twjxk8obLZW9UPH0HfD_5BYpjh_w@mail.gmail.com>
Subject: Re: [PATCH net-next v2 4/6] af_unix: stash pidfs dentry when needed
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, 
	Lennart Poettering <mzxreary@0pointer.de>, Luca Boccassi <bluca@debian.org>, 
	David Rheinsberg <david@readahead.eu>, Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 1:41=E2=80=AFAM Alexander Mikhalitsyn
<aleksandr.mikhalitsyn@canonical.com> wrote:
>
> We need to ensure that pidfs dentry is allocated when we meet any
> struct pid for the first time. This will allows us to open pidfd
> even after the task it corresponds to is reaped.
>
> Basically, we need to identify all places where we fill skb/scm_cookie
> with struct pid reference for the first time and call pidfs_register_pid(=
).
>
> Tricky thing here is that we have a few places where this happends
> depending on what userspace is doing:
> - [__scm_replace_pid()] explicitly sending an SCM_CREDENTIALS message
>                         and specified pid in a numeric format
> - [unix_maybe_add_creds()] enabled SO_PASSCRED/SO_PASSPIDFD but
>                            didn't send SCM_CREDENTIALS explicitly
> - [scm_send()] force_creds is true. Netlink case.
>
> Cc: linux-kernel@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Cc: Lennart Poettering <mzxreary@0pointer.de>
> Cc: Luca Boccassi <bluca@debian.org>
> Cc: David Rheinsberg <david@readahead.eu>
> Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com=
>
> ---
> v2:
>         - renamed __skb_set_pid() -> unix_set_pid_to_skb() [ as Kuniyuki =
suggested ]
>         - get rid of extra helper (__scm_set_cred()) I've introduced befo=
re [ as Kuniyuki suggested ]
>         - s/__inline__/inline/ for functions I touched [ as Kuniyuki sugg=
ested ]
>         - get rid of chunk in unix_destruct_scm() with NULLifying UNIXCB(=
skb).pid [ as Kuniyuki suggested ]
>         - added proper error handling in scm_send() for scm_set_cred() re=
turn value [ found by me during rework ]
> ---
>  include/net/scm.h  | 32 ++++++++++++++++++++++++--------
>  net/core/scm.c     |  6 ++++++
>  net/unix/af_unix.c | 33 +++++++++++++++++++++++++++++----
>  3 files changed, 59 insertions(+), 12 deletions(-)
>
> diff --git a/include/net/scm.h b/include/net/scm.h
> index 84c4707e78a5..597a40779269 100644
> --- a/include/net/scm.h
> +++ b/include/net/scm.h
> @@ -8,6 +8,7 @@
>  #include <linux/file.h>
>  #include <linux/security.h>
>  #include <linux/pid.h>
> +#include <linux/pidfs.h>
>  #include <linux/nsproxy.h>
>  #include <linux/sched/signal.h>
>  #include <net/compat.h>
> @@ -66,19 +67,28 @@ static __inline__ void unix_get_peersec_dgram(struct =
socket *sock, struct scm_co
>  { }
>  #endif /* CONFIG_SECURITY_NETWORK */
>
> -static __inline__ void scm_set_cred(struct scm_cookie *scm,
> -                                   struct pid *pid, kuid_t uid, kgid_t g=
id)
> +static inline int scm_set_cred(struct scm_cookie *scm,
> +                              struct pid *pid, bool pidfs_register,
> +                              kuid_t uid, kgid_t gid)
>  {
> -       scm->pid  =3D get_pid(pid);
> +       if (pidfs_register) {
> +               int err =3D pidfs_register_pid(pid);
> +               if (err)
> +                       return err;
> +       }
> +
> +       scm->pid =3D get_pid(pid);
> +
>         scm->creds.pid =3D pid_vnr(pid);
>         scm->creds.uid =3D uid;
>         scm->creds.gid =3D gid;
> +       return 0;
>  }
>
>  static __inline__ void scm_destroy_cred(struct scm_cookie *scm)
>  {
>         put_pid(scm->pid);
> -       scm->pid  =3D NULL;
> +       scm->pid =3D NULL;

Could you split these double-space changes to another
patch to make review easier ?


>  }
>
>  static __inline__ void scm_destroy(struct scm_cookie *scm)
> @@ -88,14 +98,20 @@ static __inline__ void scm_destroy(struct scm_cookie =
*scm)
>                 __scm_destroy(scm);
>  }
>
> -static __inline__ int scm_send(struct socket *sock, struct msghdr *msg,
> -                              struct scm_cookie *scm, bool forcecreds)
> +static inline int scm_send(struct socket *sock, struct msghdr *msg,
> +                          struct scm_cookie *scm, bool forcecreds)
>  {
>         memset(scm, 0, sizeof(*scm));
>         scm->creds.uid =3D INVALID_UID;
>         scm->creds.gid =3D INVALID_GID;
> -       if (forcecreds)
> -               scm_set_cred(scm, task_tgid(current), current_uid(), curr=
ent_gid());
> +
> +       if (forcecreds) {
> +               int err =3D scm_set_cred(scm, task_tgid(current), true,
> +                                      current_uid(), current_gid());

Do we need to pass true here ?

Given this series affects scm_pidfd_recv(), we don't need to
touch netlink path that is not allowed to call scm_recv_unix() ?

Then, all callers pass false to scm_set_cred() and
pidfs_register_pid() there will be unnecessary.


> +               if (err)
> +                       return err;
> +       }
> +
>         unix_get_peersec_dgram(sock, scm);
>         if (msg->msg_controllen <=3D 0)
>                 return 0;
> diff --git a/net/core/scm.c b/net/core/scm.c
> index 68441c024dd8..50dfec6f8a2b 100644
> --- a/net/core/scm.c
> +++ b/net/core/scm.c
> @@ -147,9 +147,15 @@ EXPORT_SYMBOL(__scm_destroy);
>
>  static inline int __scm_replace_pid(struct scm_cookie *scm, struct pid *=
pid)
>  {
> +       int err;
> +
>         /* drop all previous references */
>         scm_destroy_cred(scm);
>
> +       err =3D pidfs_register_pid(pid);
> +       if (err)
> +               return err;
> +
>         scm->pid =3D pid;
>         scm->creds.pid =3D pid_vnr(pid);
>         return 0;
> diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> index df2174d9904d..18c677683ddc 100644
> --- a/net/unix/af_unix.c
> +++ b/net/unix/af_unix.c
> @@ -1924,12 +1924,27 @@ static void unix_peek_fds(struct scm_cookie *scm,=
 struct sk_buff *skb)
>         scm->fp =3D scm_fp_dup(UNIXCB(skb).fp);
>  }
>
> +static int unix_set_pid_to_skb(struct sk_buff *skb, struct pid *pid, boo=
l pidfs_register)
> +{
> +       if (pidfs_register) {
> +               int err;
> +
> +               err =3D pidfs_register_pid(pid);
> +               if (err)
> +                       return err;
> +       }
> +
> +       UNIXCB(skb).pid =3D get_pid(pid);
> +       return 0;
> +}
> +
>  static void unix_destruct_scm(struct sk_buff *skb)
>  {
>         struct scm_cookie scm;
>
>         memset(&scm, 0, sizeof(scm));
> -       scm.pid  =3D UNIXCB(skb).pid;
> +       scm.pid =3D UNIXCB(skb).pid;
> +
>         if (UNIXCB(skb).fp)
>                 unix_detach_fds(&scm, skb);
>
> @@ -1943,7 +1958,10 @@ static int unix_scm_to_skb(struct scm_cookie *scm,=
 struct sk_buff *skb, bool sen
>  {
>         int err =3D 0;
>
> -       UNIXCB(skb).pid =3D get_pid(scm->pid);
> +       err =3D unix_set_pid_to_skb(skb, scm->pid, false);
> +       if (unlikely(err))

This does not fail too.

Perhaps keep get_pid() here and move pidfs_register_pid()
to unix_maybe_add_creds(), that will look simpler.


> +               return err;
> +
>         UNIXCB(skb).uid =3D scm->creds.uid;
>         UNIXCB(skb).gid =3D scm->creds.gid;
>         UNIXCB(skb).fp =3D NULL;
> @@ -1957,7 +1975,8 @@ static int unix_scm_to_skb(struct scm_cookie *scm, =
struct sk_buff *skb, bool sen
>
>  static void unix_skb_to_scm(struct sk_buff *skb, struct scm_cookie *scm)
>  {
> -       scm_set_cred(scm, UNIXCB(skb).pid, UNIXCB(skb).uid, UNIXCB(skb).g=
id);
> +       /* scm_set_cred() can't fail when pidfs_register =3D=3D false */
> +       scm_set_cred(scm, UNIXCB(skb).pid, false, UNIXCB(skb).uid, UNIXCB=
(skb).gid);
>         unix_set_secdata(scm, skb);
>  }
>
> @@ -1971,6 +1990,7 @@ static void unix_skb_to_scm(struct sk_buff *skb, st=
ruct scm_cookie *scm)
>   * We include credentials if source or destination socket
>   * asserted SOCK_PASSCRED.
>   *
> + * Context: May sleep.
>   * Return: On success zero, on error a negative error code is returned.
>   */
>  static int unix_maybe_add_creds(struct sk_buff *skb, const struct sock *=
sk,
> @@ -1980,7 +2000,12 @@ static int unix_maybe_add_creds(struct sk_buff *sk=
b, const struct sock *sk,
>                 return 0;
>
>         if (unix_may_passcred(sk) || unix_may_passcred(other)) {

I forgot to mention that this part will conflict with net-next.

I guess Christian will take this series via vfs tree ?


> -               UNIXCB(skb).pid =3D get_pid(task_tgid(current));
> +               int err;
> +
> +               err =3D unix_set_pid_to_skb(skb, task_tgid(current), true=
);
> +               if (unlikely(err))
> +                       return err;
> +
>                 current_uid_gid(&UNIXCB(skb).uid, &UNIXCB(skb).gid);
>         }
>
> --
> 2.43.0
>
