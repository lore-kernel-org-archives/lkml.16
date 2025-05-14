Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096611AA1E0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747191195; cv=none; b=rBA00Z6NoRPF8oJBFaPfELPlez3We2l1xBqcAv6dva1hfW3z7gzGCVhJmJiEkmh6sGxX6/ncG+xyZQUQ7lpsFlavdKIgOts5fEcm1j5136Bn/x1kxOM0KWjyQuufZpUJ1/EKc19IV28kgw8CG2LtbMIiQORKZ9oxPu1bK+fxCTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747191195; c=relaxed/simple;
	bh=xYePPpPHItj0zqjq4MOZdgAxeW4nYpts1pf20lbhHIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjwUUDUva59it6bLQmSfvLHF+Fa2RecWocPxFpr5hr8NqZNSGZK3TTjuR32KuZDKitvZToGCJlXnfANW5DOYJz7VWkr3/ldIHNK2mjFH3m3ybpxG+4/AFJK9V01a19g7+yznM38ceWCHJbgdfErP5LXX8IkhDbbJBP1/4MVFFqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XHK7Xw6/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XHK7Xw6/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747191193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xYePPpPHItj0zqjq4MOZdgAxeW4nYpts1pf20lbhHIE=;
	b=XHK7Xw6/KyGZIIRlF8oRnebwRfNRNj2+O81f6HDlTuNoXTQZBK7DDBCL0VxEhfjusssYaC
	9ieBiUjTdh7sWIesUUf0fpn8yAEevriPsP695A0Gp+wiS0sIO1MF+tFs4x/IVppx29MAFv
	PN5Q9YQ5uK2kGkmM6873Lo5K7zN2e3Q=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-ZddIkBRIM6mdX8USUKTL2A-1; Tue, 13 May 2025 22:53:11 -0400
X-MC-Unique: ZddIkBRIM6mdX8USUKTL2A-1
X-Mimecast-MFC-AGG-ID: ZddIkBRIM6mdX8USUKTL2A_1747191190
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b1ffd144867so2381077a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747191190; x=1747795990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYePPpPHItj0zqjq4MOZdgAxeW4nYpts1pf20lbhHIE=;
        b=qLDnAv4487S5OSMTTfGltAVL5YuQ5OLGmTcGTzajrYxZdZxQMniQrnl/cNarYOBuB0
         tL5ClfCBVHA3QDAgE+j4POzlJzQCOIXaxjoPJ3V4jZZgcpaBeprx5rYIfBdrJJDKShtI
         MJxloSEypC/cQOxAWSfufm9aRb1yqtTj2utzIBxI6vtykIItkiHnS+lbHir4TRcWS1rF
         5rjGf/HWcAKFfs8osxh0tbaxfTD6zMrVb+cLAAsnsLqanD/rV+kASeaTmTrGfYFLa2eJ
         iYkrveWU72caKN4F/oWekA7qSXkgzgNcINRiA4z0NsNCn8Gya6tkA/vucBwkp2UOV5U2
         Wtrg==
X-Forwarded-Encrypted: i=1; AJvYcCUXNSgbWooTIbPjsRW3XuLyIq49DKTiVTgcPUbD5C71DbEKgTmhlQOTI7jkz+0gZjefp/g5f5esg/LuFCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOSlp1E5h789USPdG4wWLkkIB5qmG5ceixffW6X9v+ExtZePuw
	T4Xg0Ee8GPHoRzyO22luptqQbKbyrdSb5J+gw9RNnqEUTGPbNg+jG4tjqT01NXi09yOWpjTvz22
	z9mfccakwnRm+0rHseL3sith71WzPTPQ/fX7ovxvdgz13fSBerUhNrKSUV9mJsSM2mg/da7cJGj
	PmwdTbJymu0obVuVx4qRqysiuksrt0IINrUOAX
X-Gm-Gg: ASbGncvcfbWqUwsufdCWbmfTeQ2EjmXDjgexHxv9fo7Lu42lC0s/YVagAwcwiUb89o5
	MmZY1dCI9kwsKT6Dyepo+LcPPpw+GS75ndFO2/umWE20hjYupbQIybmmS9UuypZBW3GYK
X-Received: by 2002:a05:6a20:914e:b0:1f5:591b:4f7a with SMTP id adf61e73a8af0-215ff1b7394mr2148412637.38.1747191190495;
        Tue, 13 May 2025 19:53:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2O008aj4wY4jbfsuG0wQx0LXJQV1rEC9uHaXpFHGz1hfmWDBVT1BMyztM8wnp7Gb2O/DG75zfCtDsXFNVRAs=
X-Received: by 2002:a05:6a20:914e:b0:1f5:591b:4f7a with SMTP id
 adf61e73a8af0-215ff1b7394mr2148385637.38.1747191190148; Tue, 13 May 2025
 19:53:10 -0700 (PDT)
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
 <20250513030744-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250513030744-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 14 May 2025 10:52:58 +0800
X-Gm-Features: AX0GCFtQFTgm4lfPZmx2Tv2n376ohKx-feV8h7AANGb3bjp34mVypcbh1YB90e0
Message-ID: <CACGkMEtm75uu0SyEdhRjUGfbhGF4o=X1VT7t7_SK+uge=CzkFQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] vhost: Add a KConfig knob to enable IOCTL VHOST_FORK_FROM_OWNER
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 3:09=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, May 13, 2025 at 12:08:51PM +0800, Jason Wang wrote:
> > On Wed, Apr 30, 2025 at 5:27=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Wed, Apr 30, 2025 at 11:34:49AM +0800, Jason Wang wrote:
> > > > On Tue, Apr 29, 2025 at 6:56=E2=80=AFPM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > >
> > > > > On Tue, Apr 29, 2025 at 11:39:37AM +0800, Jason Wang wrote:
> > > > > > On Mon, Apr 21, 2025 at 11:46=E2=80=AFAM Jason Wang <jasowang@r=
edhat.com> wrote:
> > > > > > >
> > > > > > > On Mon, Apr 21, 2025 at 11:45=E2=80=AFAM Jason Wang <jasowang=
@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Mon, Apr 21, 2025 at 10:45=E2=80=AFAM Cindy Lu <lulu@red=
hat.com> wrote:
> > > > > > > > >
> > > > > > > > > Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWN=
ER_IOCTL`,
> > > > > > > > > to control the availability of the `VHOST_FORK_FROM_OWNER=
` ioctl.
> > > > > > > > > When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, th=
e ioctl
> > > > > > > > > is disabled, and any attempt to use it will result in fai=
lure.
> > > > > > > >
> > > > > > > > I think we need to describe why the default value was chose=
n to be false.
> > > > > > > >
> > > > > > > > What's more, should we document the implications here?
> > > > > > > >
> > > > > > > > inherit_owner was set to false: this means "legacy" userspa=
ce may
> > > > > > >
> > > > > > > I meant "true" actually.
> > > > > >
> > > > > > MIchael, I'd expect inherit_owner to be false. Otherwise legacy
> > > > > > applications need to be modified in order to get the behaviour
> > > > > > recovered which is an impossible taks.
> > > > > >
> > > > > > Any idea on this?
> > > > > >
> > > > > > Thanks
> > >
> > > So, let's say we had a modparam? Enough for this customer?
> > > WDYT?
> >
> > Just to make sure I understand the proposal.
> >
> > Did you mean a module parameter like "inherit_owner_by_default"? I
> > think it would be fine if we make it false by default.
> >
> > Thanks
>
> I think we should keep it true by default, changing the default
> risks regressing what we already fixes.

I think it's not a regression since it comes since the day vhost is
introduced. To my understanding the real regression is the user space
noticeable behaviour changes introduced by vhost thread.

> The specific customer can
> flip the modparam and be happy.

If you stick to the false as default, I'm fine.

Thanks

>
> > >
> > > --
> > > MST
> > >
>

