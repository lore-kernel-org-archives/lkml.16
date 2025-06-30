Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0550D1D63DD
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 18:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751309888; cv=none; b=N+Ky6YE2M3uo2u1V8FYeKlW/I9dxegt6x60oAK3VaMXhNDrna8b7dGWFrV+0tQzHxpTNhVGcXj8uUfPMyx239GkdtW4O7/07bIOlMYBP4De3QHVrKHXKjTOqigA8jlyQP8sDLHNAMmagedscf6W+ZjImhqiFJo+W3/xLDmjrC0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751309888; c=relaxed/simple;
	bh=TZiHnx5DHZRPZ8KegtBxOajJhgILmh3ZAFEMmgWmHsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bw6Qz1aipV1x9sLC+gdGiE4HkJW+bHYSXDtybhQO1MhSFUFQblxjN/a39Tm3ttVaHBAu+JktH7+smivVWi9/t8IF+UFK7JIGRzxyNTKsGFikh7OQZlOS/GSA8RKh/0x4OiIPNq3cR/TNwpG7CfpkCqMPpQOeEkriSYJeM6ReoM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QoK9Sg1d; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QoK9Sg1d"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-236470b2dceso19661475ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751309885; x=1751914685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faYx6HWB5dve4xDPBWFV8si/a4Y1nrpnWe89ZEp52tc=;
        b=QoK9Sg1dlXX207Dw7W5qx60TudfnIjAOH9rjvt6sKfDao45DOL5k47nBQ4lg4BM5vX
         TmMxHec1+cG1Vkxn/xfghUjUi3e4EQhEmVynjoYZ0kNulBVHoRHsw8x2H6WU9XfRS5PB
         XoauiFCzDRkMCNmKD9HTdllnIM+dXWnkWe8YqdrZlYXae4miP4wZoNjQK+0yVlEpEz6y
         /C+ZhjFY+rBXnTE13PixK6nyRyrbmKW5dfDBi99NrhkZ0iIo7GNANG5brwM+o5SWF6r3
         E5+2pvq8XjnEd0BpGCSDc8/OYlSBHpK0a4m6EUu64Gsf2wGpRopdXNVFNJFaJtnftDFk
         X61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751309885; x=1751914685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faYx6HWB5dve4xDPBWFV8si/a4Y1nrpnWe89ZEp52tc=;
        b=qmqfFicGMK7+akWndy4ZWryW2463FW8an3K44NFwemEAV5BeN2tsoYIWMao9328V0x
         J+EBwgTnN3nI06JBdxSZa3g9OQXmO7csnsyeUBCDesc7s5GD42VRwLYfRxjCmYO6qaHB
         gVAnNIEdtICb7+5xxjZfmsIta1gZdmri2Ka58UZ+3t6IsyaQvDG65DSixo2r6eTh9CjT
         C9c4bUYezE5AJi9WwGlmOMSy8cYiiotjVkB1CualCrpYdklZAzyI77jrIVdSV/JgillY
         5SwWBFUoIm2ZeZ1I92dWqNFD9Ohbuq56faC9eW67wnWuChPMZLCt6uqRjV20mTE6P/ZH
         kdSg==
X-Gm-Message-State: AOJu0YxJO4x2L/m4EGgBBIEdmwQe3UzY+z8EmVbhQpJAMlgXvvgPzQIF
	8VjPXZR7+uoa/xhDKRw87cPWo2G6PIzU3sfT9MA3BJjNXR9VKdbhblOXLnoNBom4u7XDjBervWL
	aSDmrIvhPGXazP9vurNwSA00YC/a7RufVoT9KxopUymrVq/J0NbglAr0bRDA=
X-Gm-Gg: ASbGncuB+4hV99FmK1SEoD3Cygc9Fu8MhUuUImPm/wK+nUos1ngyZ/WHyyKMJJbQVi0
	SXe/wgnGnB3gclnPbxm/MrFECgHfuE9nQ0TG/G8eFt4lAZHUD0MVfhIaW0IiHpsBYOdQdPkvbPI
	2d49s/pBa/E69Gi7oEcIVtUpegIoFCOZbslDmQUwqvgQS4hAOtaM1DT9HtproDqT99ifqNPuKR+
	Q==
X-Google-Smtp-Source: AGHT+IEAcjcyKWLX8IGw8wTUppJZH4i7riBtc0RQCt/3/8ykZlolN/mjYOEf8ClvOWFxxd7su6ESR0M7s/2qrfOsepo=
X-Received: by 2002:a17:90b:2f88:b0:311:ba32:164f with SMTP id
 98e67ed59e1d1-318c9223bc9mr22173186a91.8.1751309885135; Mon, 30 Jun 2025
 11:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629214449.14462-1-aleksandr.mikhalitsyn@canonical.com> <20250629214449.14462-2-aleksandr.mikhalitsyn@canonical.com>
In-Reply-To: <20250629214449.14462-2-aleksandr.mikhalitsyn@canonical.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 30 Jun 2025 11:57:52 -0700
X-Gm-Features: Ac12FXw7A4SVhNMJuauAUOYKSoANG8Z2rhgG2M1ftidVrx3qT2zTFy6SN-2Ltqo
Message-ID: <CAAVpQUC1Z=eUcX9RqE7PLRvUPVHeuc8X7dnk1Vr_6w0_t+V84A@mail.gmail.com>
Subject: Re: [RESEND PATCH net-next 1/6] af_unix: rework unix_maybe_add_creds()
 to allow sleep
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, 
	Lennart Poettering <mzxreary@0pointer.de>, Luca Boccassi <bluca@debian.org>, 
	David Rheinsberg <david@readahead.eu>, Kuniyuki Iwashima <kuniyu@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 2:45=E2=80=AFPM Alexander Mikhalitsyn
<aleksandr.mikhalitsyn@canonical.com> wrote:
>
> As a preparation for the next patches we need to allow sleeping
> in unix_maybe_add_creds() and also return err. Currently, we can't do
> that as unix_maybe_add_creds() is being called under unix_state_lock().
> There is no need for this, really. So let's move call sites of
> this helper a bit and do necessary function signature changes.
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
>  net/unix/af_unix.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> index 129388c309b0..6072d89ce2e7 100644
> --- a/net/unix/af_unix.c
> +++ b/net/unix/af_unix.c
> @@ -1955,21 +1955,26 @@ static int unix_scm_to_skb(struct scm_cookie *scm=
, struct sk_buff *skb, bool sen
>         return err;
>  }
>
> -/*
> +/* unix_maybe_add_creds() adds current task uid/gid and struct pid to sk=
b if needed.

This is not a correct kdoc format.
https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-d=
ocumentation

> + *
>   * Some apps rely on write() giving SCM_CREDENTIALS
>   * We include credentials if source or destination socket
>   * asserted SOCK_PASSCRED.
> + *
> + * Context: May sleep.

This should be added later when this function starts to sleep.


>   */
> -static void unix_maybe_add_creds(struct sk_buff *skb, const struct sock =
*sk,
> -                                const struct sock *other)
> +static int unix_maybe_add_creds(struct sk_buff *skb, const struct sock *=
sk,
> +                               const struct sock *other)
>  {
>         if (UNIXCB(skb).pid)
> -               return;
> +               return 0;
>
>         if (unix_may_passcred(sk) || unix_may_passcred(other)) {
>                 UNIXCB(skb).pid =3D get_pid(task_tgid(current));
>                 current_uid_gid(&UNIXCB(skb).uid, &UNIXCB(skb).gid);
>         }
> +
> +       return 0;
>  }
>
>  static bool unix_skb_scm_eq(struct sk_buff *skb,
> @@ -2104,6 +2109,10 @@ static int unix_dgram_sendmsg(struct socket *sock,=
 struct msghdr *msg,
>                 goto out_sock_put;
>         }
>
> +       err =3D unix_maybe_add_creds(skb, sk, other);
> +       if (err)
> +               goto out_sock_put;
> +
>  restart:
>         sk_locked =3D 0;
>         unix_state_lock(other);
> @@ -2212,7 +2221,6 @@ static int unix_dgram_sendmsg(struct socket *sock, =
struct msghdr *msg,
>         if (sock_flag(other, SOCK_RCVTSTAMP))
>                 __net_timestamp(skb);
>
> -       unix_maybe_add_creds(skb, sk, other);
>         scm_stat_add(other, skb);
>         skb_queue_tail(&other->sk_receive_queue, skb);
>         unix_state_unlock(other);
> @@ -2256,6 +2264,10 @@ static int queue_oob(struct sock *sk, struct msghd=
r *msg, struct sock *other,
>         if (err < 0)
>                 goto out;
>
> +       err =3D unix_maybe_add_creds(skb, sk, other);
> +       if (err)
> +               goto out;
> +
>         skb_put(skb, 1);
>         err =3D skb_copy_datagram_from_iter(skb, 0, &msg->msg_iter, 1);
>
> @@ -2275,7 +2287,6 @@ static int queue_oob(struct sock *sk, struct msghdr=
 *msg, struct sock *other,
>                 goto out_unlock;
>         }
>
> -       unix_maybe_add_creds(skb, sk, other);
>         scm_stat_add(other, skb);
>
>         spin_lock(&other->sk_receive_queue.lock);
> @@ -2369,6 +2380,10 @@ static int unix_stream_sendmsg(struct socket *sock=
, struct msghdr *msg,
>
>                 fds_sent =3D true;
>
> +               err =3D unix_maybe_add_creds(skb, sk, other);
> +               if (err)
> +                       goto out_free;
> +
>                 if (unlikely(msg->msg_flags & MSG_SPLICE_PAGES)) {
>                         skb->ip_summed =3D CHECKSUM_UNNECESSARY;
>                         err =3D skb_splice_from_iter(skb, &msg->msg_iter,=
 size,
> @@ -2399,7 +2414,6 @@ static int unix_stream_sendmsg(struct socket *sock,=
 struct msghdr *msg,
>                         goto out_free;
>                 }
>
> -               unix_maybe_add_creds(skb, sk, other);
>                 scm_stat_add(other, skb);
>                 skb_queue_tail(&other->sk_receive_queue, skb);
>                 unix_state_unlock(other);
> --
> 2.43.0
>
