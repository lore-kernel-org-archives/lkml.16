Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1135818DB0E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738956281; cv=none; b=qdLfkiE3pqAmZl79EoyLNGSQU8jMr7Sw/W+T/lPwDdXPdjQfmPl6jXso5CCmOzVgdKPpvN5HZKKvGTOuo/DY+nwxPjP+x52OB2Z4WM1YVObclPTgtZeUoAoHHmYRqPmDcv0om0VSfNG+IAGmabBLFMbGXoH1Yq5Fj/Tdw0ODEZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738956281; c=relaxed/simple;
	bh=vxU+tYVnh6kMXN1kCB92NtopAdH3cQ9eveg0cFzyLtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1e2UpZm1EUFDbmVvQzm/WtyZ4pC2Eo9qN6FmkUMFP9FJ8CJ2NS1LSG8rLxxM7UAkuFPmLu71LOJw5gM7oRysGITW4vtsBmwRsZbnPMPjyeadyaTEu9zCJ/jkMFw63osDsK32hXTTQeHANBIjbVv3z1ML1TUDkagy1R6GUpby0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=sghWfaAk; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="sghWfaAk"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 356D84010B
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738956277;
	bh=vxU+tYVnh6kMXN1kCB92NtopAdH3cQ9eveg0cFzyLtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=sghWfaAkeYmtcePg+KTr9ukfvOSg5WANiPg9hZUaM3qhnTYuQ6mGce4gkWojSy13K
	 22TEEi3vRPpJL/89/l+H0LpvhdVbkvN67bdgjKGCqfzfOxCOAfzIAJyNw+ID+1sbfl
	 RjjBPHIKdmP6KNHrJi2CFZvXKfUQs3oMceFgKXy6S2lr4iIcdM3hmkovqnXk9626lJ
	 4e6WecWg267A7dToqm1V7I0YA4bRpAf+gdLjdwukKoNppJhC0jQ4y2zzlu6CRLW0Vq
	 h/7TuTIEnxzbXHuO1dyPOgEeMz4fDa8u8/9Lft/aOmo4cYP+MCfJFHQ0GI1uJO0gBl
	 XUpqmttJ+CMbQ==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ab7907bb87eso101947366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 11:24:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738956277; x=1739561077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxU+tYVnh6kMXN1kCB92NtopAdH3cQ9eveg0cFzyLtc=;
        b=kX293quo0L92X2RDQoOigRDZUaNqimTrjmgq5ZfjffGQEdm18JNgcWWPoYY0XtfByP
         gD3Kff/BvszKMcTDMX+A5Coroh4JI+uImn1byljcCY0Al03mNlj+a0c9ZJolOL7Ofu2D
         AbCF4H0HTdTuuS+CpcfFqcA8ZhyIJWX5XOlus9etFvOLvaR8jl85OsEj9yP266+XclH1
         M0BPHegftRPTjwN6QzMaIymwxGDol9j0+Aprac+MxkEYO0flTeS1wKuJoQQ/IzTK1AxG
         5IjwoRhtKqmOt3/buMFTIC8QiSucVSZX0dg0hWvAsW8UST1QFzfXC1YiByrQxzWkLa4X
         8F2w==
X-Forwarded-Encrypted: i=1; AJvYcCXTd1UuDy1eVuoT9zboV1n/E9ULy0LiUby82PSy8vZildjQlc3B/wpK87cMDa8P+lZhb/aXGyBhhjA2vCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY+QQfImNTInWzRZThrfnssLWvaLenMr3zBeSFd7PbowFfWxMP
	DMQt8NMNCaKvArmDg9QymNpBLYETSh5zNzmHtKb4YNeQSbECcryuzSs5EezGRQ8CNzTMrz849jH
	99oTxJoHDf1wNDaCJ3fA0+L6LW7AHH179z2vf+/le/oAIDWOtXQOsCm7lHDNp1wcKb7ke/lgbZ5
	rtXyTt8ZkakYyyH+Eppsei+6VhtPlv6caZxzomv2nZ0PlkDbfAhNn9
X-Gm-Gg: ASbGncsHd12t5Qu4twyZ/R2IDvwrdd+hYOb+3dbu9nvcm8rX8cJxVBVWXoeo/vMOcWq
	ZsaLQhdfKhXKW97O9NKomWuRtj3ed6QHOmDe6BNWDz1jNagdP3BBIK1qrVL8H
X-Received: by 2002:a17:906:6a29:b0:aa6:a572:49fd with SMTP id a640c23a62f3a-ab789ca2972mr420381866b.54.1738956276692;
        Fri, 07 Feb 2025 11:24:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW39V6vxQtVQ8dceJH6mGloMgI0XHnyBDpBS0JjWTn/3cHP5RLfgBQFsUPSHSqaPzI8YS3WFgZCGADlt7dVJo=
X-Received: by 2002:a17:906:6a29:b0:aa6:a572:49fd with SMTP id
 a640c23a62f3a-ab789ca2972mr420379566b.54.1738956276318; Fri, 07 Feb 2025
 11:24:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHTA-uaH9w2LqQdxY4b=7q9WQsuA6ntg=QRKrsf=mPfNBmM5pw@mail.gmail.com>
 <20250207155456.GA3665725@ziepe.ca> <CAHTA-uasZ+ZkdzaSzz-QH=brD3PDb+wGfvE-k377SW7BCEi6hg@mail.gmail.com>
 <20250207190152.GA3665794@ziepe.ca>
In-Reply-To: <20250207190152.GA3665794@ziepe.ca>
From: Mitchell Augustin <mitchell.augustin@canonical.com>
Date: Fri, 7 Feb 2025 13:24:24 -0600
X-Gm-Features: AWEUYZlr2pi0PkFPhk6g8C39Y1EN3TzUeAopLgpyoqvD13zRSg5s6jJmYOdIuQ4
Message-ID: <CAHTA-uZMZ6qQZf_n55gNaTjQQ0j8nXdt1Yi_+8+-YUNhxcrs_A@mail.gmail.com>
Subject: Re: modprobe mlx5_core on OCI bare-metal instance causes
 unrecoverable hang and I/O error
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com, 
	andrew+netdev@lunn.ch, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Talat Batheesh <talatb@nvidia.com>, 
	Feras Daoud <ferasda@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

*facepalm*

Thanks, I can't believe that wasn't my first thought as soon as I
learned these instances were using iSCSI. That's almost certainly what
is happening on this OCI instance, since the host adapter for its
iSCSI transport is a ConnectX card.

The fact that I was able to see similar behavior once on a machine
booted from a local disk (in the A100 test I mentioned) is still
confusing though. I'll update this thread if I can figure out a
reliable way to reproduce that behavior.


On Fri, Feb 7, 2025 at 1:01=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Fri, Feb 07, 2025 at 10:02:46AM -0600, Mitchell Augustin wrote:
> > > Is it using iscsi/srp/nfs/etc for any filesystems?
> >
> > Yes, dev sda is using iSCSI:
>
> If you remove the driver that is providing transport for your
> filesystem the system will hang like you showed.
>
> It can be done, but the process sequencing the load/unload has to be
> entirely contained to a tmpfs so it doesn't become blocked on IO that
> cannot complete.
>
> Jason



--=20
Mitchell Augustin
Software Engineer - Ubuntu Partner Engineering
