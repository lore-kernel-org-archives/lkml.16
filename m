Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666701A5B95
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747289180; cv=none; b=ZxdWtor3mNAoLUV2jr34QbLd5vHRaRV5DxpvKEvOdvbmwu3J6vk+PduY2XEHjlizK4kJthxW3qSbxkcacTlYmw1UQn5VH+A+iiPly2mjoMkFlVK6MuSiSce4EMQ617BxLERkGYk0fYzOLbDhKb+tZjsqG+OHkXv3vbIxDYjwuz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747289180; c=relaxed/simple;
	bh=KgjVcgr/14LclEpcLsxeXxOySrceHDQLswBb2FensOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0u7AdJyHRqAR7y61HftGJb3DxUT53zkhDDr/x0yX3w1YbPYgUnCbsyS9VmQm6j3bp1V20c9ZEJ7IdgErhmr7+T43i77P9aC6IyLJFTWyYM3emKqW6/rOip0z32y/B7JPe0NxPJOSCxqPPcK3kLWLJ2Dt+RhYtSCSOUJqp3WqZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CiuQP/5r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CiuQP/5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747289177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KgjVcgr/14LclEpcLsxeXxOySrceHDQLswBb2FensOs=;
	b=CiuQP/5rj0Xq4u/c2uBBd54Y7tCEXOerKGd5Fii5z0fnV9bQFH3oM4OxGIqMstksOzV0Ox
	pjFMTVWuoqPoSU6gB5wN/bBqZgSmIcAk8SM5K6UTYfklFYy8ZthztaYTC/7xryU1rEojHK
	1AjEoaCXuhKwOudmQASqF4gqXQw+M1Q=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-QdfkqsG9NyWWEyANq0HZrA-1; Thu, 15 May 2025 02:06:15 -0400
X-MC-Unique: QdfkqsG9NyWWEyANq0HZrA-1
X-Mimecast-MFC-AGG-ID: QdfkqsG9NyWWEyANq0HZrA_1747289175
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-52c63f61c53so156591e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747289175; x=1747893975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgjVcgr/14LclEpcLsxeXxOySrceHDQLswBb2FensOs=;
        b=tOfdi+Y/t04Bm76MWR70yx6q01OE8nExsT4kgFjYGtec3styPx8xTYmQNFbrn1BCjM
         IQUYcnnXZIWosKGKBF9d+U/+ZQGkeKX4BiNdAeqZAvaAocgabC44mzz4gMBt/hf+DShI
         DZ7CPHR49eGXOW57q4pMdilIPD5REu3SlQhgEsjagNNI5GAetYSEAXbHcoqbsS2fuv8H
         BGwNP8ufDP7EZkhBUI3a4WxfwRJUhxc++gzTIgu92+ZA02BM1syzMFhDmIyDZLJ3wLSj
         M2JE3+mFcZbMc4eNzNo48r9MUTelrUlaWn2wInDHjXKxRrYxYXWW3aRv1eeNhq60VmyG
         csFA==
X-Forwarded-Encrypted: i=1; AJvYcCVUnNq8aq/76Ec15FBYryaKZ1PAIxFzZbSKOa2iM1qL8B5zEnyM78Ge7ltVUyzceUOiq0aCp9kvn/sNaYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6hhpAXP8ckPjat+zYteM/TY8JRTrUBPDlXwoI4wl5gsYJkMgU
	vS4FrQZg3PPWTTOUJFlnQ9yyen/L7GM9keyUu+/GiczesZ/EPy4GykGuHgurqLXDhNtXC4MdGkt
	0VYS3zBjHiYakhVhfd7VT24ew/AhpkjeI/ZkAD7zGzsOIRFtG41NDgSM1pgP7JeXzvWvlhp51yU
	xDZ1+hD0jbbzvWQyyH+t8yj1puDuDuSH6P1gyX
X-Gm-Gg: ASbGncveW84PMPpRGyZA1i0W85c1H4dXv3ZHrwV8/X/u4c3BKcT5GaLJrLdnn9XnJbm
	au7aGzWICCwYdWvl/0C39wPIhsocGS53VdYdn9qpegBgWuOQxCsC1yboVbbMKjO2J+GdmpA==
X-Received: by 2002:a05:6102:3e26:b0:4d7:11d1:c24e with SMTP id ada2fe7eead31-4df7ddd4266mr6046455137.21.1747289174763;
        Wed, 14 May 2025 23:06:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIP+CRMt7SY3lS0FZeE06/dgVCIbatM2gkAuNCY5+ReAryTvEEPpoJydTxKcT2SH/Us6iz+8kk5C0x0X/14DY=
X-Received: by 2002:a05:6102:3e26:b0:4d7:11d1:c24e with SMTP id
 ada2fe7eead31-4df7ddd4266mr6046447137.21.1747289174433; Wed, 14 May 2025
 23:06:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421024457.112163-1-lulu@redhat.com> <20250421024457.112163-5-lulu@redhat.com>
 <CACGkMEt-ewTqeHDMq847WDEGiW+x-TEPG6GTDDUbayVmuiVvzg@mail.gmail.com>
 <CACGkMEte6Lobr+tFM9ZmrDWYOpMtN6Xy=rzvTy=YxSPkHaVdPA@mail.gmail.com>
 <CACGkMEstbCKdHahYE6cXXu1kvFxiVGoBw3sr4aGs4=MiDE4azg@mail.gmail.com>
 <20250429065044-mutt-send-email-mst@kernel.org> <CACGkMEteBReoezvqp0za98z7W3k_gHOeSpALBxRMhjvj_oXcOw@mail.gmail.com>
 <20250430052424-mutt-send-email-mst@kernel.org> <CACGkMEub28qBCe4Mw13Q5r-VX4771tBZ1zG=YVuty0VBi2UeWg@mail.gmail.com>
 <20250513030744-mutt-send-email-mst@kernel.org> <CACGkMEtm75uu0SyEdhRjUGfbhGF4o=X1VT7t7_SK+uge=CzkFQ@mail.gmail.com>
In-Reply-To: <CACGkMEtm75uu0SyEdhRjUGfbhGF4o=X1VT7t7_SK+uge=CzkFQ@mail.gmail.com>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 15 May 2025 14:05:37 +0800
X-Gm-Features: AX0GCFsXKSChOXDfZIrQa40yvOWdPl0wYiICvr05EheIP_f5Oktdl93IFH2XEdk
Message-ID: <CACLfguVGmQ3FzhheCfe55m+SG-kvNXsJ-YopkiBAyLCvkp81dw@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] vhost: Add a KConfig knob to enable IOCTL VHOST_FORK_FROM_OWNER
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the comments; I will prepare a new patch version.

Thanks,
Cindy


On Wed, May 14, 2025 at 10:53=E2=80=AFAM Jason Wang <jasowang@redhat.com> w=
rote:
>
> On Tue, May 13, 2025 at 3:09=E2=80=AFPM Michael S. Tsirkin <mst@redhat.co=
m> wrote:
> >
> > On Tue, May 13, 2025 at 12:08:51PM +0800, Jason Wang wrote:
> > > On Wed, Apr 30, 2025 at 5:27=E2=80=AFPM Michael S. Tsirkin <mst@redha=
t.com> wrote:
> > > >
> > > > On Wed, Apr 30, 2025 at 11:34:49AM +0800, Jason Wang wrote:
> > > > > On Tue, Apr 29, 2025 at 6:56=E2=80=AFPM Michael S. Tsirkin <mst@r=
edhat.com> wrote:
> > > > > >
> > > > > > On Tue, Apr 29, 2025 at 11:39:37AM +0800, Jason Wang wrote:
> > > > > > > On Mon, Apr 21, 2025 at 11:46=E2=80=AFAM Jason Wang <jasowang=
@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Mon, Apr 21, 2025 at 11:45=E2=80=AFAM Jason Wang <jasowa=
ng@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Mon, Apr 21, 2025 at 10:45=E2=80=AFAM Cindy Lu <lulu@r=
edhat.com> wrote:
> > > > > > > > > >
> > > > > > > > > > Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_O=
WNER_IOCTL`,
> > > > > > > > > > to control the availability of the `VHOST_FORK_FROM_OWN=
ER` ioctl.
> > > > > > > > > > When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, =
the ioctl
> > > > > > > > > > is disabled, and any attempt to use it will result in f=
ailure.
> > > > > > > > >
> > > > > > > > > I think we need to describe why the default value was cho=
sen to be false.
> > > > > > > > >
> > > > > > > > > What's more, should we document the implications here?
> > > > > > > > >
> > > > > > > > > inherit_owner was set to false: this means "legacy" users=
pace may
> > > > > > > >
> > > > > > > > I meant "true" actually.
> > > > > > >
> > > > > > > MIchael, I'd expect inherit_owner to be false. Otherwise lega=
cy
> > > > > > > applications need to be modified in order to get the behaviou=
r
> > > > > > > recovered which is an impossible taks.
> > > > > > >
> > > > > > > Any idea on this?
> > > > > > >
> > > > > > > Thanks
> > > >
> > > > So, let's say we had a modparam? Enough for this customer?
> > > > WDYT?
> > >
> > > Just to make sure I understand the proposal.
> > >
> > > Did you mean a module parameter like "inherit_owner_by_default"? I
> > > think it would be fine if we make it false by default.
> > >
> > > Thanks
> >
> > I think we should keep it true by default, changing the default
> > risks regressing what we already fixes.
>
> I think it's not a regression since it comes since the day vhost is
> introduced. To my understanding the real regression is the user space
> noticeable behaviour changes introduced by vhost thread.
>
> > The specific customer can
> > flip the modparam and be happy.
>
> If you stick to the false as default, I'm fine.
>
> Thanks
>
> >
> > > >
> > > > --
> > > > MST
> > > >
> >
>

