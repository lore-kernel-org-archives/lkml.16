Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C371E491B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747120166; cv=none; b=YYq8Y1xGG3tvdTpmfLAoNC+b+HX3CHWh/KhZ+QCpV1yhx4twO8O2vE4oSYRlc5fLbgyK4MQe+jxFa7xZP7VJ8tgvdltYKOVCTyzcveyk3GPCL2eRaFNjL7kIXIBFmQw5nuWYD6lzQfS4dYXGlnHTTgtfh4AIHeScMb1F4uloeYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747120166; c=relaxed/simple;
	bh=twHcmA7LUXTu4ZuLwMdsdfHh+CfPFxHnUVLG+BwD4io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOtqhV50kgk7sipxM16oto16CEHitXD5VSJuLdDvSn8DqIWGmAMuJdPXutliyBbaKU6QVPjTJyUufOJXzv+7eAau5A4eWu7OlEVO+na2wuseJj2kuXJZTJP+QxQqGPWhT8Qz5srdis+Ey70HxeCkYeWaMSrsWL69JQnl6U7RnKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iIAA6+dt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iIAA6+dt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747120163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ictuYZNb6FVZjqSx9xqiqhjaQBRlicpN74huBXSGg4Q=;
	b=iIAA6+dtgI91+4KslGqU3XdH1l5rELUcfoeLdmudYbEqETKRfybthB9rWhjU8PG9HSIEoA
	H1Q0ZpGB2smzLea2cZAwKgYSTnHT7RTqD8HcU2fNTs1A3LWQUb+4YaeW0NGcQRxm01fMMv
	Hx0g46yF2UXgUpDQtr5MJ3SMhJsaQgY=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-vPT9oiIaO9GSwoIEeULQ7w-1; Tue, 13 May 2025 03:09:21 -0400
X-MC-Unique: vPT9oiIaO9GSwoIEeULQ7w-1
X-Mimecast-MFC-AGG-ID: vPT9oiIaO9GSwoIEeULQ7w_1747120160
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22e76805fecso77129115ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 00:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747120160; x=1747724960;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ictuYZNb6FVZjqSx9xqiqhjaQBRlicpN74huBXSGg4Q=;
        b=VNVe2jtc93J2VzdQGNy81OfoCoUL6fnK5ynbpinX3lcb5p5qfMMUgR2sO3E6ZWzxNg
         gLdw0IixQ7apbyy1R4xqhYKg0V0OuIPX5kpAkIQ0j9rRXVeBDLdIuHf3l5FIf4tGFDT9
         Uxm/VeVpC6PxEk2eORUImZGGUEy5//sJHAB0GAGgPp4FOe02u02h1k9EVPVj6XE4/L49
         PAxRyb3Yx7ynunzOzBumvYcCo4LNnot4H7YP4eAvJue2G0w3xn4+1QenkTmze7Ay16kZ
         pcMqdSJNZIBfrAxEsOpgOxztYEQ0hqzjhlX9iWiXlsGA45VnjOpKz75vEsEyfKxWc/bA
         4w6w==
X-Forwarded-Encrypted: i=1; AJvYcCVgwElBamQBeU3NiP6PR5nKSFhGCrF3NCtdhBTZmJfxN9O/KSbrHhhsTLfER1GW68rgpuZEvFeh1fFqc6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEApmQqnWqC6mETlQX/LDYzfjS9o9lAkhwsmh2cJsNMKGyKJDv
	w2fzFzInqde5IpNIsA7K91iynaf7/GGydBetVd6wCqmZn7DJK1EmWQ04kMf+3EJyefl5pVumQhV
	z4qcDZX9/OJcQla5sY+nbsAxkrPO5L5exJxX25QcmzYeCnvuqrKwE69BsfSPkZLKgRC1qWQ==
X-Gm-Gg: ASbGncvpcEcG0Gi77Ve8wdaOLefpCnjvriAhBTvtYMm19wC6d+02e93AUZwScHa79wB
	L1HOp6FSMTsi1yHX5Ba0RUdKY6/tnGDuV8nyC8ymMHCWHV8y7vgbCAhs5eHz5o5Dxw8V93SYtWx
	lgf/lr2ukezST+LHuEJs4Qm/Q+46+sagGvJfa3PheW/kk7kZ3mjEv6UgUrjtmVLxasI9LCleAXp
	ntgvm1Kc/FSk6luzGaVgjuBvSM+NFfedCGC4r6Tjm0xgsQo5tptY+OTNN6QzKOFT+sF+I1yJr8=
X-Received: by 2002:a05:6214:224a:b0:6e8:f770:5045 with SMTP id 6a1803df08f44-6f6e4801da4mr283868136d6.28.1747120149024;
        Tue, 13 May 2025 00:09:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHE6qp6nrOSTcG+29z71S/WIjLeU7OplRtOWMeb0fjKhF4V91wQ9LbTTAnYfdMSFrrXtZqgw==
X-Received: by 2002:a05:622a:2290:b0:494:7835:1013 with SMTP id d75a77b69052e-49478351232mr90416531cf.36.1747120132570;
        Tue, 13 May 2025 00:08:52 -0700 (PDT)
Received: from redhat.com ([5.28.174.83])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49458d378b7sm56066541cf.14.2025.05.13.00.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 00:08:51 -0700 (PDT)
Date: Tue, 13 May 2025 03:08:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, michael.christie@oracle.com,
	sgarzare@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: Re: [PATCH v9 4/4] vhost: Add a KConfig knob to enable IOCTL
 VHOST_FORK_FROM_OWNER
Message-ID: <20250513030744-mutt-send-email-mst@kernel.org>
References: <20250421024457.112163-1-lulu@redhat.com>
 <20250421024457.112163-5-lulu@redhat.com>
 <CACGkMEt-ewTqeHDMq847WDEGiW+x-TEPG6GTDDUbayVmuiVvzg@mail.gmail.com>
 <CACGkMEte6Lobr+tFM9ZmrDWYOpMtN6Xy=rzvTy=YxSPkHaVdPA@mail.gmail.com>
 <CACGkMEstbCKdHahYE6cXXu1kvFxiVGoBw3sr4aGs4=MiDE4azg@mail.gmail.com>
 <20250429065044-mutt-send-email-mst@kernel.org>
 <CACGkMEteBReoezvqp0za98z7W3k_gHOeSpALBxRMhjvj_oXcOw@mail.gmail.com>
 <20250430052424-mutt-send-email-mst@kernel.org>
 <CACGkMEub28qBCe4Mw13Q5r-VX4771tBZ1zG=YVuty0VBi2UeWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEub28qBCe4Mw13Q5r-VX4771tBZ1zG=YVuty0VBi2UeWg@mail.gmail.com>

On Tue, May 13, 2025 at 12:08:51PM +0800, Jason Wang wrote:
> On Wed, Apr 30, 2025 at 5:27 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Apr 30, 2025 at 11:34:49AM +0800, Jason Wang wrote:
> > > On Tue, Apr 29, 2025 at 6:56 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Tue, Apr 29, 2025 at 11:39:37AM +0800, Jason Wang wrote:
> > > > > On Mon, Apr 21, 2025 at 11:46 AM Jason Wang <jasowang@redhat.com> wrote:
> > > > > >
> > > > > > On Mon, Apr 21, 2025 at 11:45 AM Jason Wang <jasowang@redhat.com> wrote:
> > > > > > >
> > > > > > > On Mon, Apr 21, 2025 at 10:45 AM Cindy Lu <lulu@redhat.com> wrote:
> > > > > > > >
> > > > > > > > Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL`,
> > > > > > > > to control the availability of the `VHOST_FORK_FROM_OWNER` ioctl.
> > > > > > > > When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the ioctl
> > > > > > > > is disabled, and any attempt to use it will result in failure.
> > > > > > >
> > > > > > > I think we need to describe why the default value was chosen to be false.
> > > > > > >
> > > > > > > What's more, should we document the implications here?
> > > > > > >
> > > > > > > inherit_owner was set to false: this means "legacy" userspace may
> > > > > >
> > > > > > I meant "true" actually.
> > > > >
> > > > > MIchael, I'd expect inherit_owner to be false. Otherwise legacy
> > > > > applications need to be modified in order to get the behaviour
> > > > > recovered which is an impossible taks.
> > > > >
> > > > > Any idea on this?
> > > > >
> > > > > Thanks
> >
> > So, let's say we had a modparam? Enough for this customer?
> > WDYT?
> 
> Just to make sure I understand the proposal.
> 
> Did you mean a module parameter like "inherit_owner_by_default"? I
> think it would be fine if we make it false by default.
> 
> Thanks

I think we should keep it true by default, changing the default
risks regressing what we already fixes. The specific customer can
flip the modparam and be happy.

> >
> > --
> > MST
> >

