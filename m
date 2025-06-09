Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A676182BD
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 01:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749433848; cv=none; b=qYcSJTMNFVHEltZZv8NMQqiscZvg0/nBp9q4J8uUIeAXTUCoP2uWgbazIx+tOJHnajYUvTMGE9qilZ/qxIPiqTq5roIVXRSlEAfsfxRBC649yjgA0FbkZUucfvVYsCRG45bI1kN8Wu+x3Hwti5ztQr4mghFHkZ/sbeuSJYY1Qhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749433848; c=relaxed/simple;
	bh=rTcppCIZ/D5M7oo+6qtZJGHgazXjvpGituGxD9zReBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mOt3LiRRHZFo9BFOhT/guy9S4UydI8hi1uXaK05JHUoyrL3FZKP2wv1JWfBZ+/44fBT0HWnZKgeaZuTiQliWqGmgHMrxcTVqzhnhB5N9HZB29KGncFsM523t0RqFDAvuZd+a9XlApWnKCFNRSpjTp4m0rTCICRmthbRk78log/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Brg36/+/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Brg36/+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749433844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2FjPWKEc2bS/5hBRFVg6S0OJbWFLjXguqy/hbBcildo=;
	b=Brg36/+/AZ5CtD4hhFrZ0JiIUOT5m2pJm2z0r+KQwpNivMnH2lvgglV4g+LLgg6D0pvK34
	gfxnZAPrAAnM2ClS4wNQn7s/nrSIpNyVr8O3jyiFAn1NDugUJYMTKdogO689GmxL79HYXi
	YKzR097F+gEeRmCL+j0XyPPULnN28MY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-YowOrWgqMAGJplsVBwHESA-1; Sun, 08 Jun 2025 21:50:42 -0400
X-MC-Unique: YowOrWgqMAGJplsVBwHESA-1
X-Mimecast-MFC-AGG-ID: YowOrWgqMAGJplsVBwHESA_1749433841
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30a39fa0765so5754189a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 18:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749433841; x=1750038641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FjPWKEc2bS/5hBRFVg6S0OJbWFLjXguqy/hbBcildo=;
        b=XWHKX4te8WIrMLYtD6rHWAS5Bro8M4VJbzTHayr9tN7aArgm9irbBon03Q1CIhA6SQ
         4f6vUGNhu3AU7/7uKKNQZ+HzbQEAcXezYX5JwvSp3aTbYjVoTi28aaKESuyFBMbA2ZKA
         q2oMAuOjrV30ffxRJqHn6d7mg9/FhMEQfQnJFloMs5WL5Px4cyH790crtBdWiq4EItJ0
         RJxTX1siGmkUHY/fU3zpKE8QKtFTSGzofBivr7xILT7f/YCNehB1MyTspvHL5ZX5iUjD
         qhetlS2ixwDVel5C1G1bI9Jj5mVqiqIwi9nXDNMybYZj+ticOJSBikK9L+/3guwiCCGT
         LM6g==
X-Forwarded-Encrypted: i=1; AJvYcCX0wwGyCJSdnQKI4fMKBO/FyVC9too41hpdW9GGxJQ5ibqgXxG1Zu4kHgaJ9ZD5gzSDRqg2PrQh/k7vgcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEJmGG4/OPafee9KakEibT+ypo/JMVNIt2E0wv0q/AwSEsFhcZ
	g39qoagqtqm3mkbEemmEM9SuMQN1d2bGwuxmquIu3WgF3UdzG1a0auMXn1CppJTrmvc6FB7QEz+
	9MhNjqHDLIexsbA9HriFYqC8o8dIvhfn2jAGyjaOv5/Dmwn0veaC2nV2NbvZsxxSmbQ+mwchv2u
	vTWASzVl1sY2nKUgCZx+Qh1vtwieTHDbISBGr7Th2u
X-Gm-Gg: ASbGncvoReCX3oDAiG6OwubM0cpKFKFr/64IqBxWqy9fEEeIHrbN7ODwkCSHBI2dpSs
	rvsSfoVtkUfY2QS/7/G6ugZKzbBERSm+rltZJmpAnNdysD7L0mNHn19T/Ya+PMfrmobC/qnrL+1
	MBosn/
X-Received: by 2002:a17:90b:3851:b0:313:1ea2:a577 with SMTP id 98e67ed59e1d1-313470736cbmr15285249a91.29.1749433841518;
        Sun, 08 Jun 2025 18:50:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6pp2fQYQ2n+yTpzYsGHW/c2XvZSyIUZCd8baZop0tHCWiQwNqQ1C9mHhJ56k+4d9YTAyBn2udsehNABU/EPI=
X-Received: by 2002:a17:90b:3851:b0:313:1ea2:a577 with SMTP id
 98e67ed59e1d1-313470736cbmr15285210a91.29.1749433841138; Sun, 08 Jun 2025
 18:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606115012.1331551-1-eperezma@redhat.com> <20250606115012.1331551-2-eperezma@redhat.com>
 <CACGkMEsw2taXgW11na2CFK6W03c=x=wMn3iwNZPypgPkeSU06Q@mail.gmail.com>
In-Reply-To: <CACGkMEsw2taXgW11na2CFK6W03c=x=wMn3iwNZPypgPkeSU06Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 9 Jun 2025 09:50:29 +0800
X-Gm-Features: AX0GCFuNQJJ-DIs0eRhXcctHrWWyy18SfCITsj_ozn0KtbMD5uFOzvN8tqxvLiY
Message-ID: <CACGkMEvinV7Zd+xddnxcerFbw_c+RZypkeD5HaN8=g6+peZvMQ@mail.gmail.com>
Subject: Re: [RFC 1/6] vduse: add v1 API definition
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: Yongji Xie <xieyongji@bytedance.com>, Cindy Lu <lulu@redhat.com>, 
	linux-kernel@vger.kernel.org, Stefano Garzarella <sgarzare@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Maxime Coquelin <mcoqueli@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 9:41=E2=80=AFAM Jason Wang <jasowang@redhat.com> wro=
te:
>
> On Fri, Jun 6, 2025 at 7:50=E2=80=AFPM Eugenio P=C3=A9rez <eperezma@redha=
t.com> wrote:
> >
> > This allows to define all functions checking the API version set by the
> > userland device.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> It might be worth clarifying how it works.
>
> For example,
>
> 1) would VDUSE behave differently or if it's just some new ioctls
> 2) If VDUSE behave differently, do we need a ioctl to set the API
> version for backward compatibility?

Speak too fast, there's a VDUSE_SET_API_VERSION actually.

I think we need to think if it complicates the migration compatibility or n=
ot.

> 3) If it means a brunch of new ioctls, could userspace just probe the
> new ioctls instead?
>
> Thanks

Thanks

>
> > ---
> >  include/uapi/linux/vduse.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/include/uapi/linux/vduse.h b/include/uapi/linux/vduse.h
> > index 68a627d04afa..9a56d0416bfe 100644
> > --- a/include/uapi/linux/vduse.h
> > +++ b/include/uapi/linux/vduse.h
> > @@ -10,6 +10,10 @@
> >
> >  #define VDUSE_API_VERSION      0
> >
> > +/* VQ groups and ASID support */
> > +
> > +#define VDUSE_API_VERSION_1    1
> > +
> >  /*
> >   * Get the version of VDUSE API that kernel supported (VDUSE_API_VERSI=
ON).
> >   * This is used for future extension.
> > --
> > 2.49.0
> >

