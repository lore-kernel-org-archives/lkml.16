Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F063284B26
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330194; cv=none; b=VEQVq6h8yfWSA/6U8xHno2at2bAeiSHyOy1LARDfTqekxZMNz53rLbmqhF0uKMXzZDF6DxO0I8DJS2WJq0SR8DSL0HdYEC+4GegDZ91Ws9bxS6dAosfWH1pUqE6CL7iTp3/Voc8JdXU26HqgsPmo7vqKO8ujxedf7sVV/Q15ORc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330194; c=relaxed/simple;
	bh=5UhTPLXTy54HSw4bbuMVr6NHCHxgfaB24c/UygOGD5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHdEDju54i7fk7k5kf5kvDH6E7rb5dJKGF79rdOnEsW5/5vr8QizxGTANr3hGlus+X1hozJZsagrmm2smsheNdflEuDo4/SX1VIvMd4I3OhPSsUQIWogHRV/+28G6utET9hiDZrFAAYA2T8T6v30Gogys5NSO0ZEMKJqfiw7CLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F12AWa1h; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F12AWa1h"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2242ac37caeso119045ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745330191; x=1745934991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UhTPLXTy54HSw4bbuMVr6NHCHxgfaB24c/UygOGD5o=;
        b=F12AWa1haXcsCudCgDYHjn2nNfZXI3lbEma09OMg5nCnR7GzJuX8RBzTsy+aLZxnlP
         G3KDr+MgQbOHQschhs2yKHUMROZvYMDuvkA2dOkccaWcJNess9Hp4TfbIqXjoGqli4kI
         +U9yYc2mKurzkivWGlJqXif6GYJ28rvsIfCD8cvv2EBltZDLmnDViJWWOYnCPSJ5BWuB
         strzglMGQBpP7YIbUEyB4vnYUBvjCuH11iIdAWWRCHUyZW75wzZPWGy2NSd8M+g+HmdR
         NoRgXS6T12hgTXSfSz24ARES3ZTJvZXG0GmbkKSy5ko8M/v0HdSGZMmYcx/neG7gmt9c
         YyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745330191; x=1745934991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UhTPLXTy54HSw4bbuMVr6NHCHxgfaB24c/UygOGD5o=;
        b=UsNmR9jgrGNPR9eAqXIV7JXQ2FeCb1hhP2nOKBZu/u+cAGPueSCr8VOy3OOL9O9Nm+
         txKuOeakqSHvJ3yjWbOhA7gpiwb+ezhxvIRxAjMmZwag6WcEwusJ81eQHNx5O134fZJI
         1y6DlUdy8zAfbfHlWWFU7zCSVkM3JM2gbor/2QH0rYNT7B+PkBUmjFR88bHGS+/TWeZs
         kyPZ/b9GHgZJBD3OQoIVXfbvwvrsM2HM+7mpbkMJZ7R9p3za+icS/fKpzOAKlUTVfOKA
         VBLJ5kwSxKS28eV98uGtt1LtpeL3BSSID8nvl2glq5YxrNBb5qv7t6XOlvVom4nlbINY
         TAkw==
X-Forwarded-Encrypted: i=1; AJvYcCVN1Zqr9AK1WECfpX5mY28BPC7eWhlgAb1dazuiPw4UR+dNib+d3J+MF2mLPqWQCJTWPjs+OuSrvTCOSX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvvmXWFBGx7QNhXax/2kbAuIotfSJpTv//HOHMN1wWnTkYvTXz
	7JIepmnDuQWx4/q53jA2JYPyDfgL6Yv7SLxDBUZYA+03G6ymF1N469uLEmftb+w8LH3X0rrC2TX
	SAnv7vy61PtCKndbqyajrGL2dnLZzHw0dYH4o
X-Gm-Gg: ASbGncuDYOTfdEG6gn8DnOIYkB4d4rlJs0ypPpqz8jZKnpkZ3r04rx7R1gYwOUc90Bl
	tCYOclDMxeseE+5JZ+Odsqnc7QSXYzeenUxmnbFJp1fQwIuEMVCfxpZTOr4lLGscwGbExk5lYD+
	adcnA/aQu2G8JK1r0a0ScqJUs=
X-Google-Smtp-Source: AGHT+IH/hAru3MKmJ60Z25FXBslSMx5hLypeOWFuJfnaTmWFJ711/aVQCwonng9BnnPokRail3ZgA21iLnH/6NJDRM0=
X-Received: by 2002:a17:902:ce0a:b0:220:ce33:6385 with SMTP id
 d9443c01a7336-22c54797b1bmr9643675ad.9.1745330190914; Tue, 22 Apr 2025
 06:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417231540.2780723-1-almasrymina@google.com>
 <20250417231540.2780723-3-almasrymina@google.com> <484ecaad-56de-4c0d-b7fa-a3337557b0bf@gmail.com>
In-Reply-To: <484ecaad-56de-4c0d-b7fa-a3337557b0bf@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 22 Apr 2025 06:56:17 -0700
X-Gm-Features: ATxdqUFU-Nv8GeoWu8ltonWAw6xNaP21dKReuqOOxLDIWBd4SeZRRiQwqzNABOY
Message-ID: <CAHS8izPw9maOMqLALTLc22eOKnutyLK9azOs4FzO1pfaY8xE6g@mail.gmail.com>
Subject: Re: [PATCH net-next v9 2/9] net: add get_netmem/put_netmem support
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, io-uring@vger.kernel.org, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	sdf@fomichev.me, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Victor Nogueira <victor@mojatatu.com>, Pedro Tammela <pctammela@mojatatu.com>, 
	Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 1:43=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> On 4/18/25 00:15, Mina Almasry wrote:
> > Currently net_iovs support only pp ref counts, and do not support a
> > page ref equivalent.
>
> Makes me wonder why it's needed. In theory, nobody should ever be
> taking page references without going through struct ubuf_info
> handling first, all in kernel users of these pages should always
> be paired with ubuf_info, as it's user memory, it's not stable,
> and without ubuf_info the user is allowed to overwrite it.
>

The concern about the stability of the from-userspace data is already
called out in the MSG_ZEROCOPY documentation that we're piggybacking
devmem TX onto:

https://www.kernel.org/doc/html/v4.15/networking/msg_zerocopy.html

Basically the userspace passes the memory to the kernel and waits for
a notification for when it's safe to reuse/overwrite the data. I don't
know that it's a security concern. Basically if the userspace modifies
the data before it gets the notification from the kernel, then it will
mess up its own TX. The notification is sent by the kernel to the
userspace when the skb is freed I believe, at that point it's safe to
reuse the buffer as the kernel no longer needs it for TX.

For devmem we do need to pin the binding until all TX users are done
with it, so get_netmem will increase the refcount on the binding to
keep it alive until the net stack is done with it.

> Maybe there are some gray area cases like packet inspection or
> tracing? However in this case, after the ubuf_info is dropped, the
> user can overwrite the memory with its secrets. Definitely iffy
> in security terms.
>

You can look at all the callers of skb_frag_ref to see all the code
paths that grab a page ref on the frag today. There is also an
inspection by me in the v5 changelog.


--=20
Thanks,
Mina
