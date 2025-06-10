Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8AB21B191
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544569; cv=none; b=XVGtcmizAtDe2oyMzL49EWk7Vh0QKIs1XZwlNslADxe/B8uo9XgylTxSfnOh3fne/9rBNDh26ZUddLyulBcquRcGNuWPgL5xsNSCcchLubF3x7E95rkcX5u8knR1Es2bqAajvCYlsaVtwjmtAfZnpScAF3IF9C5WYSnTf/8pYbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544569; c=relaxed/simple;
	bh=VefeL8UvNo27hF0y5cq0ZWoxdT+CX5fteuza6wXt5O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FcwvJVzwGXxr2X6eadaSNSSA6bKXgjx7Q1oHhXcQzJ2gdVRtTGEAk6q70n9j5dJ19T/xVmCvPml/U1dyro1LqH086R4TywU0U546akHCTiPZKLcFXAENMzBrLfGERVatFmtKqCdLw6oWetUQE7hoyna89xSzr3GjtQjeCzS9z9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ibrQTmMt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ibrQTmMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749544566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VefeL8UvNo27hF0y5cq0ZWoxdT+CX5fteuza6wXt5O0=;
	b=ibrQTmMtk3M5foxu/Ky9PvDjH8b29cynno3Dmgf9buC3r3RDQi/7A3QwWZNPs5yj3ThyZn
	ELyJMbD+FTN6//MIvhESL8O403XsWdlRHXjCNTEDvhdmbgO0d12feOAT8X4jYZM4zdnWs+
	SBIsygS/W+hsHsoK72XJl5WVfQMNuQA=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-VHuk0o00OtCShY9UgtJeDg-1; Tue, 10 Jun 2025 04:36:05 -0400
X-MC-Unique: VHuk0o00OtCShY9UgtJeDg-1
X-Mimecast-MFC-AGG-ID: VHuk0o00OtCShY9UgtJeDg_1749544564
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31215090074so7242779a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544564; x=1750149364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VefeL8UvNo27hF0y5cq0ZWoxdT+CX5fteuza6wXt5O0=;
        b=PyXSsZeXl1x03WixA+lzjCIcAg9Et08rAcsDPhWfg8yim+yKcAhZpK9xmTJG3lzMxy
         J0f7ZesTKPrwp2QKFUkMDxq3NMo9HHMH2dyolL9ZyCpnHoPUHskaAqf0EZQX9f3L4mcw
         XRPG+DlDwBpXjslyIAOD0j0XrLMAd1Nvy4abUWzRWEZHdg7qpKIvU4Xvl5sG05R3wNtm
         zH3WPav/RE4bIL+unr+gS38ZTYOwn+aw7wQVI9/jC7oJTM+/3FXS8Ej6HQhEny7NXKY7
         OdoZbR+et2ICJc2k1xenoE1iCevoEZ8GyW+3RrJvV2hReDDfGHn++Uzl6z5UlTRQocHD
         9+UA==
X-Forwarded-Encrypted: i=1; AJvYcCXFuB3qNKQn6ogbzMvDt3NXjNyHGVZ1qNc2dAjr8m07SChv72N4bhDAw77SS7UVM9JqzPTBkz76eey4X70=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA9f2YLK80wa4zKrfChe3wW48hgO0p7Ht4oy6vAbVL1cp62XJL
	fVrtcutE2jY4xYmmMykCtVcsV0VoJOMVoP+t7Lh9vvCjMYP65GbZrLYXAl/c7Gth32Tnxcg2Nbi
	W/UX3OmJU7DZfiPB4eoO5ed5v1usxSwOs8DCS5PiRs9ux4pxxgEIRPVXsWjvaByuV04ms5fg4a/
	6Gtdz0Kj5Mmx6RIbnWv6E98mIcjJa+9mMPysN/GDRq
X-Gm-Gg: ASbGncvOl00zbbHN0oANDatBbIY7Nxt+ns+4bSBqe//kASPry4e+XzSSgJM0iAhoBNq
	TX61iuVy2fv8RiIJOn82CN5RLF8oepXj/K2jNYzlWeaFz7U/Rvd+LWE9Sm/T3+5dBb1Bq6IOFU2
	cHybLo
X-Received: by 2002:a17:90b:3c52:b0:311:ffe8:20e2 with SMTP id 98e67ed59e1d1-313472d4297mr23372950a91.4.1749544563413;
        Tue, 10 Jun 2025 01:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyRjmPW82hemp2fvewBDHQY7oy/7+OpxoQVKnjOKQ7RWf7UJnCJb7ETeE1WE5gEIg7PUb6KZi6iotqVC+KBWI=
X-Received: by 2002:a17:90b:3c52:b0:311:ffe8:20e2 with SMTP id
 98e67ed59e1d1-313472d4297mr23372919a91.4.1749544562994; Tue, 10 Jun 2025
 01:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606115012.1331551-1-eperezma@redhat.com> <20250606115012.1331551-2-eperezma@redhat.com>
 <CACGkMEsw2taXgW11na2CFK6W03c=x=wMn3iwNZPypgPkeSU06Q@mail.gmail.com>
 <CACGkMEvinV7Zd+xddnxcerFbw_c+RZypkeD5HaN8=g6+peZvMQ@mail.gmail.com> <CAJaqyWeetDsdoDzVrN-n0+jr97MBPeHdTxeM3ttmNUeLK702VA@mail.gmail.com>
In-Reply-To: <CAJaqyWeetDsdoDzVrN-n0+jr97MBPeHdTxeM3ttmNUeLK702VA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 10 Jun 2025 16:35:52 +0800
X-Gm-Features: AX0GCFuawXYYWuy28X2V_BYwSq7bE1Tmlxm4lE_BVF2reMyJ9g-qSAngee-y6Wk
Message-ID: <CACGkMEvbxZsmPPHgfst89FCbZamBPLt8V=K-eepa4s3muFuM4A@mail.gmail.com>
Subject: Re: [RFC 1/6] vduse: add v1 API definition
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Yongji Xie <xieyongji@bytedance.com>, Cindy Lu <lulu@redhat.com>, 
	linux-kernel@vger.kernel.org, Stefano Garzarella <sgarzare@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Maxime Coquelin <mcoqueli@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 2:11=E2=80=AFPM Eugenio Perez Martin <eperezma@redha=
t.com> wrote:
>
> On Mon, Jun 9, 2025 at 3:50=E2=80=AFAM Jason Wang <jasowang@redhat.com> w=
rote:
> >
> > On Mon, Jun 9, 2025 at 9:41=E2=80=AFAM Jason Wang <jasowang@redhat.com>=
 wrote:
> > >
> > > On Fri, Jun 6, 2025 at 7:50=E2=80=AFPM Eugenio P=C3=A9rez <eperezma@r=
edhat.com> wrote:
> > > >
> > > > This allows to define all functions checking the API version set by=
 the
> > > > userland device.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >
> > > It might be worth clarifying how it works.
> > >
> > > For example,
> > >
> > > 1) would VDUSE behave differently or if it's just some new ioctls
>
> I'd like to test more in-depth, but a device can just bump the version
> ID and then implement the replies to the vduse messages. No need to
> implement new ioctls. If the VDUSE device sets 0 in either number of
> ASID or vq groups, the kernel assumes 1.

Right, this is the way we use now and I think maybe we can document
this somewhere.

>
> But you have a very good point here, I think it is wise to evaluate
> the shortcut of these messages in the VDUSE kernel module. If a VDUSE
> device only has one vq group and one ASID, it can always return group
> 0 and asid 0 for everything, and fail every try to ser asid !=3D 0.

Yes, and vhost-vDPA needs to guard against the misconfiguration.

> This
> way, the update is transparent for the VDUSE device, and future
> devices do not need to implement the reply of these. What do you
> think?

This should work.

>
> > > 2) If VDUSE behave differently, do we need a ioctl to set the API
> > > version for backward compatibility?
> >
> > Speak too fast, there's a VDUSE_SET_API_VERSION actually.
> >
> > I think we need to think if it complicates the migration compatibility =
or not.
> >
>
> Do you mean migration as "increase the VDUSE version number", not "VM
> live migration from vduse version 0 to vduse version 1", isn't it? The
> second should not have any problem but I haven't tested it.

I mean if we bump the version, we can't migrate from version 1 to
version 0. Or we can offload this to the management (do we need to
extend the vdpa tool for this)?

Thanks

