Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93121246799
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009491; cv=none; b=ajq62ffHPtbnQY0NjNjsf+cqIYpKqalt6hV0wgeNd+wXyMSUzTCPC6NkVqhnlJ+O3sb9HEhumk4CEc9Nc88Mc7tiAB9TEEvNlnU0Y6JJSLRIkfdV9j61BxKi1GBo5gayfh0tSLUUwNj2B35Z3EYztherfjAxYXd60K2Xqz65lYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009491; c=relaxed/simple;
	bh=L0SAAefyveDoX/FjdHc/xGaLZ37kY++Yjt697RpzkAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fuMN9XHqNOaCfo3NYze/2BdmjWQuT7M7vVzJUCNySfapCLhK0ksldSPMDA4UwDA0Ga4Tgi7W6oqE4Y9WBYuY9YETmAGyeUXsIzDoXyXAxZEXkuFeLeIT3qpoTyKQlx2DKUulwZKxHUUihEuX4C9VGnPDpTT87tyldfmEP9bTF3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=goqljN5c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="goqljN5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746009487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pi8G66LgJAq886SVmCWw3P+Bv6HYWhRZ3tZsp9fmenI=;
	b=goqljN5chgv8YXRRnggUje7FaCV4cLtDjUSFMwRcbGUGvuB1d/Gqo4VywO+3c2Grbfk8q6
	nJOUTTR7nQqmXL3WMFPbqpEp2bIYZmoxmYOFKTcu4YWU3HS30x0mnec6Lvgme9xYNLKwwC
	Ig8wcF/BqNMsQfKTPm0Pi4Cu+QTbdtI=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-UAyPLrVSNwGoO5wcLT9JGA-1; Wed, 30 Apr 2025 06:38:06 -0400
X-MC-Unique: UAyPLrVSNwGoO5wcLT9JGA-1
X-Mimecast-MFC-AGG-ID: UAyPLrVSNwGoO5wcLT9JGA_1746009486
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e72b0980138so5895207276.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009486; x=1746614286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pi8G66LgJAq886SVmCWw3P+Bv6HYWhRZ3tZsp9fmenI=;
        b=So4eEalipO69xDvOXjy3JemDa4hYnLdvdUzpiMbRvhSnVaZehZXcC3kH3TjUSiokhL
         YhFh/4epckfyN5EHQ3W9drQ+x4e25gzLtRGbmUnZtG2n7niZSE6qaXNKjRP3Lg9U3ovo
         MvPOeoTkKhPydYYr8hZct+FYrhaUKhi35RcYeWl14FAGqtsSIebod2L09u/lu6k3grFN
         CqG+L1bQxLtt+ueX5/qJvJMaEQS4frBVKh3zp7diD64Vir1oJqRRktJsHpP9jhZOl0S2
         z46Ngq2xDtnUiL9RG3EAmPo6ecSEwPtW5zjlcfcQW0eydbnHaNyvhZcaGjERCKDaTdXp
         utNw==
X-Forwarded-Encrypted: i=1; AJvYcCV4bvlnJ2w5lEMrbfGKs5CWWhZZXIXliA5mTDdBbmUebSBCVYecV/HgKd/0Ue1lKUfXbruqhnT+JiKbREU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzliAcdsD7lA7VSBhiQbZbakwtt029CuZv2T0VWf+iJ9GT9JkZa
	aI6lJdkl6g9RC6NVd6+77fuISliB8VFyW0GkAKC4wAYZl+XQU/j7m+7jZ8zhK5jyHIAL+t+FxaJ
	bPbZyqh3kgJDIuTE+Mqvih2+R7/BIvBuypmEo/UUupizFGJitR8L/kbJD5wt/xvu7r2XW4sMooA
	ovF5FWLrEQ/hQ4JzaKXBZliKwGFp0ITXtfBx8q
X-Gm-Gg: ASbGncvnwPKoZDyi31itlVJCK7X07XFMUgg6z020iHAueF4C4TXY6PEs919iP29E14S
	122Aj1ZHqtRuTCfINWsae7ZqNKM5AC2zswxHd4ly718i3iSL87oPzguZshcb7etwjiiD6TQA=
X-Received: by 2002:a05:6902:70f:b0:e73:1a8c:b85c with SMTP id 3f1490d57ef6-e7404cf1cd6mr2499383276.27.1746009485715;
        Wed, 30 Apr 2025 03:38:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe4hS/4tTJe3wQp1DO4q16a9js38tPsRexlXFhwlVepkoC+asFZ9MA+8cxL1MgjRQ/gYtfO9kGzahI7xKCWA8=
X-Received: by 2002:a05:6902:70f:b0:e73:1a8c:b85c with SMTP id
 3f1490d57ef6-e7404cf1cd6mr2499358276.27.1746009485276; Wed, 30 Apr 2025
 03:38:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-vsock-linger-v3-0-ddbe73b53457@rbox.co>
 <20250430-vsock-linger-v3-3-ddbe73b53457@rbox.co> <oo5tmbu7okyqojwxt4xked4jvq6jqydrddowspz3p66nsjzajt@36mxuduci4am>
 <fa71ef5e-7603-4241-bfd3-7aa7b5ea8945@rbox.co>
In-Reply-To: <fa71ef5e-7603-4241-bfd3-7aa7b5ea8945@rbox.co>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 30 Apr 2025 12:37:54 +0200
X-Gm-Features: ATxdqUFYdEhpc2hMG3McWkKruB0g8l88EcvME9mfW0rN5K7PplMaQvDwSrnYRHE
Message-ID: <CAGxU2F62CTUKVjuG9Fjo29E6uopVzOK8zgr+HwooqMr4V_RvLQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/4] vsock: Move lingering logic to af_vsock core
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Apr 2025 at 12:33, Michal Luczaj <mhal@rbox.co> wrote:
>
> On 4/30/25 11:36, Stefano Garzarella wrote:
> > On Wed, Apr 30, 2025 at 11:10:29AM +0200, Michal Luczaj wrote:
> >> Lingering should be transport-independent in the long run. In preparation
> >> for supporting other transports, as well the linger on shutdown(), move
> >> code to core.
> >>
> >> Guard against an unimplemented vsock_transport::unsent_bytes() callback.
> >>
> >> Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
> >> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> >> ---
> >> include/net/af_vsock.h                  |  1 +
> >> net/vmw_vsock/af_vsock.c                | 25 +++++++++++++++++++++++++
> >> net/vmw_vsock/virtio_transport_common.c | 23 +----------------------
> >> 3 files changed, 27 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> >> index 9e85424c834353d016a527070dd62e15ff3bfce1..bd8b88d70423051dd05fc445fe37971af631ba03 100644
> >> --- a/include/net/af_vsock.h
> >> +++ b/include/net/af_vsock.h
> >> @@ -221,6 +221,7 @@ void vsock_for_each_connected_socket(struct vsock_transport *transport,
> >>                                   void (*fn)(struct sock *sk));
> >> int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk);
> >> bool vsock_find_cid(unsigned int cid);
> >> +void vsock_linger(struct sock *sk, long timeout);
> >>
> >> /**** TAP ****/
> >>
> >> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> >> index fc6afbc8d6806a4d98c66abc3af4bd139c583b08..946b37de679a0e68b84cd982a3af2a959c60ee57 100644
> >> --- a/net/vmw_vsock/af_vsock.c
> >> +++ b/net/vmw_vsock/af_vsock.c
> >> @@ -1013,6 +1013,31 @@ static int vsock_getname(struct socket *sock,
> >>      return err;
> >> }
> >>
> >> +void vsock_linger(struct sock *sk, long timeout)
> >> +{
> >> +    DEFINE_WAIT_FUNC(wait, woken_wake_function);
> >> +    ssize_t (*unsent)(struct vsock_sock *vsk);
> >> +    struct vsock_sock *vsk = vsock_sk(sk);
> >> +
> >> +    if (!timeout)
> >> +            return;
> >> +
> >> +    /* unsent_bytes() may be unimplemented. */
> >> +    unsent = vsk->transport->unsent_bytes;
> >> +    if (!unsent)
> >> +            return;
> >> +
> >> +    add_wait_queue(sk_sleep(sk), &wait);
> >> +
> >> +    do {
> >> +            if (sk_wait_event(sk, &timeout, unsent(vsk) == 0, &wait))
> >> +                    break;
> >> +    } while (!signal_pending(current) && timeout);
> >> +
> >> +    remove_wait_queue(sk_sleep(sk), &wait);
> >> +}
> >> +EXPORT_SYMBOL_GPL(vsock_linger);
> >> +
> >> static int vsock_shutdown(struct socket *sock, int mode)
> >> {
> >>      int err;
> >> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> >> index 4425802c5d718f65aaea425ea35886ad64e2fe6e..9230b8358ef2ac1f6e72a5961bae39f9093c8884 100644
> >> --- a/net/vmw_vsock/virtio_transport_common.c
> >> +++ b/net/vmw_vsock/virtio_transport_common.c
> >> @@ -1192,27 +1192,6 @@ static void virtio_transport_remove_sock(struct vsock_sock *vsk)
> >>      vsock_remove_sock(vsk);
> >> }
> >>
> >> -static void virtio_transport_wait_close(struct sock *sk, long timeout)
> >> -{
> >> -    DEFINE_WAIT_FUNC(wait, woken_wake_function);
> >> -    ssize_t (*unsent)(struct vsock_sock *vsk);
> >> -    struct vsock_sock *vsk = vsock_sk(sk);
> >> -
> >> -    if (!timeout)
> >> -            return;
> >> -
> >> -    unsent = vsk->transport->unsent_bytes;
> >> -
> >> -    add_wait_queue(sk_sleep(sk), &wait);
> >> -
> >> -    do {
> >> -            if (sk_wait_event(sk, &timeout, unsent(vsk) == 0, &wait))
> >> -                    break;
> >> -    } while (!signal_pending(current) && timeout);
> >> -
> >> -    remove_wait_queue(sk_sleep(sk), &wait);
> >> -}
> >> -
> >> static void virtio_transport_cancel_close_work(struct vsock_sock *vsk,
> >>                                             bool cancel_timeout)
> >> {
> >> @@ -1283,7 +1262,7 @@ static bool virtio_transport_close(struct vsock_sock *vsk)
> >>              (void)virtio_transport_shutdown(vsk, SHUTDOWN_MASK);
> >>
> >>      if (sock_flag(sk, SOCK_LINGER) && !(current->flags & PF_EXITING))
> >> -            virtio_transport_wait_close(sk, sk->sk_lingertime);
> >> +            vsock_linger(sk, sk->sk_lingertime);
> >
> > Ah, I'd also move the check in that function, I mean:
> >
> > void vsock_linger(struct sock *sk) {
> >       ...
> >       if (!sock_flag(sk, SOCK_LINGER) || (current->flags & PF_EXITING))
> >               return;
> >
> >       ...
> > }
>
> One note: if we ever use vsock_linger() in vsock_shutdown(), the PF_EXITING
> condition would be unnecessary checked for that caller, right?

Right, for shutdown it should always be false, so maybe better to keep
the check in the caller.

Thanks,
Stefano

>
> > Or, if we move the call to vsock_linger() in __vsock_release(), we can
> > do the check there.
> >
> > Thanks,
> > Stefano
> >
> >>
> >>      if (sock_flag(sk, SOCK_DONE)) {
> >>              return true;
> >>
> >> --
> >> 2.49.0
> >>
> >>
>

