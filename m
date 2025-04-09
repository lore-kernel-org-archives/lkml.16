Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D86425D8EC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195397; cv=none; b=VCOH6QB3YsPq93vOj0fe5btvFrsIiUO1NcekVahWbPaoFlz/7r+LZNIfrKm9oyHL2+uwyDJ8oTIgD/6d2o4nd2BJXJsceuGh05O5YtKeQ/HsyQQr3aX3KQ60TtJ3/foPEBuR4NqIAoXL38OVUSToT9ZWsXgyWRloT2RslHygYGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195397; c=relaxed/simple;
	bh=A/FlqmaIzcO4c8nAuBHIloGWE3rDWwPZOR27kQ1vVdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3uuvG6gWNNLJt2g6o7fmgp8rAyfT9BZfjt4LDjZPdw18UTwXPfwu6pFponne4W1xtzFuUxbU36f9AA85GDhO6fetDJm1DaFkCUfVDxPRF/J4jdSg512fyXbvOMJcPb3izsTpseuI6ousB1ZABTNuWPqjUAng32zKJyUAcA5u0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=faOg85dN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="faOg85dN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744195395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EnfObN/lFf683o8WuLfplJQb1/cYuQGkU+V1Bcc+zTA=;
	b=faOg85dNB73UyyYuViZ5JaBU2Z5/JC4V1aLvF2hI6jgsxqbeAjWF/q6bDFwSJkETQoJ9eJ
	44pRSgJPynh7bAAHYYr0RhX7muoQwgWQfEfWAEd+Db83RD6WyBuKFLjR4IoZg/Z+zlKsnN
	C1gT7BPCJlQHkpdeRroEXwAkqUgEuwA=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-UOC1KOW8PlyWlHMHxkuBjA-1; Wed, 09 Apr 2025 06:43:14 -0400
X-MC-Unique: UOC1KOW8PlyWlHMHxkuBjA-1
X-Mimecast-MFC-AGG-ID: UOC1KOW8PlyWlHMHxkuBjA_1744195393
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e63533f0a65so801745276.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 03:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744195393; x=1744800193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnfObN/lFf683o8WuLfplJQb1/cYuQGkU+V1Bcc+zTA=;
        b=lqDhl9A0FPAhuwDYHwkI/hhmDO4fBj7dqUtkD+lGcA0L1f/pb53r7RGF3qBWVW8i/s
         MiCbHlsFXY5Gp341uSH9y2CykCyg8d8DxNu16VSNvDcWbwJjqD3HtOqb/8mMu+wDHTvY
         /aKE9szamIyfq+ukO6QR/tfRSRGGG+eKWE78rODrBPXeNviVulwpoqtqhEVwzP4oeYly
         joeCZi2+loIv3EJOdGxbUR+oUxrDN/kXqVEofTNoH/VfHFxnVxoVlG5DbrbZNjbkEJcS
         JooreB7RQVnw5tkI9NTDbULIW2jnvteklfJBHabXpsCeOIC+iLOzh80CargZ9GFO8vUX
         gRig==
X-Forwarded-Encrypted: i=1; AJvYcCXH1KFsntL2wEV4ZEq7rZX5KlpK9+Su+FtL0zHN22zkoZf81DPoxchHjW286q95sOqzim97WqTK4cxhIHI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3fyb4Xt8iiavJ6TwEXA26k/kVlfx6ib+JzYpzQwLxrkUoN0hd
	MFLCuPuGEyk45/4QvXcryxtxWdhyCvW/WMZBTAdDh43Z1aowvEK3ADEy67f4pnGTa0RvumXzVSu
	Z0PSxGkTJ3L7qNffgIee1aXZJh1RsrNfKSdHgDKJHc2d9QecsL1GCnxleOLeuuKY4zBMvl5N/6c
	RsGbKyWgeGDvaIvyl4wJSTRtFBAb72bU9nuxBE
X-Gm-Gg: ASbGncspCYpjwXDskXfbi6O7LOz/iKVK6JcTuqJyMT4buUcNR77BUtiWysSx2IcJbbq
	yQ86QiJiOv+86FQYkznaA8y7y+MJFHeO9cNLmadljxlABgm9w5OpWrN+HvDljPIEEIaA=
X-Received: by 2002:a05:6902:2487:b0:e61:142a:82b1 with SMTP id 3f1490d57ef6-e6e5da76d6dmr11417302276.16.1744195393473;
        Wed, 09 Apr 2025 03:43:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9XLCSiAWV0l0Xyy3erc/2RwiuGpJfzHLbxLJRgI2MfphnLTk5GZMmDYdIvEsBTniIkRBZyC9Yc3m0F9mrx/U=
X-Received: by 2002:a05:6902:2487:b0:e61:142a:82b1 with SMTP id
 3f1490d57ef6-e6e5da76d6dmr11417256276.16.1744195393057; Wed, 09 Apr 2025
 03:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403100943.120738-1-sgarzare@redhat.com> <20250403100943.120738-5-sgarzare@redhat.com>
 <20250408110012.GFZ_UBvOcEfEcIM4mI@fat_crate.local> <eqtiiphs6rtjo7nirkw7zcicew75wnl4ydenrt5vl6jdpqdgj6@2brjlyjbqhoq>
 <20250408112820.GBZ_UIVPp-LuIiVrIV@fat_crate.local> <o2u7p3wb64lcc4sziunr274hyubkgmspzdjcvihbpzkw6mkvpo@sjq3vi4y2qfl>
 <20250409102120.GCZ_ZKIJw9WkXpTz4u@fat_crate.local>
In-Reply-To: <20250409102120.GCZ_ZKIJw9WkXpTz4u@fat_crate.local>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 9 Apr 2025 12:43:01 +0200
X-Gm-Features: ATxdqUEEmadHBgiIuGJgxnDt-QGQF_QGugtY5XSP7f88rY67_2s-xBx1Kyl3594
Message-ID: <CAGxU2F7r_fWgr2YRmCvh2iQ1vPg30f-+W6FXyuidbakZkwhw2w@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] x86/sev: register tpm-svsm platform device
To: Borislav Petkov <bp@alien8.de>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-coco@lists.linux.dev, linux-integrity@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Joerg Roedel <jroedel@suse.de>, Dionna Glaze <dionnaglaze@google.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 12:21, Borislav Petkov <bp@alien8.de> wrote:
>
> On Tue, Apr 08, 2025 at 01:54:07PM +0200, Stefano Garzarella wrote:
> > I see, so IIUC I can just apply the following change to this patch and avoid
> > to export snp_svsm_vtpm_probe() at all, right?
> >
> > diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> > index acbd9bc526b1..fa83e6c7f990 100644
> > --- a/arch/x86/coco/sev/core.c
> > +++ b/arch/x86/coco/sev/core.c
> > @@ -2702,8 +2702,10 @@ static int __init snp_init_platform_device(void)
> >         if (platform_device_register(&sev_guest_device))
> >                 return -ENODEV;
> > -       if (platform_device_register(&tpm_svsm_device))
> > -               return -ENODEV;
> > +       if (snp_svsm_vtpm_probe()) {
> > +               if (platform_device_register(&tpm_svsm_device))
> > +                       return -ENODEV;
> > +       }
> >         pr_info("SNP guest platform device initialized.\n");
> >         return 0;
>
> No, this should go in tpm_svsm_probe().

Sorry, maybe I missed something.

tpm_svsm.c registers the driver with module_platform_driver_probe().

Someone (the platform I guess) has to register the device by calling
platform_device_register(), as we already do for example for
sev_guest.

If we move platform_device_register() to tpm_svsm_probe() how will the
probe be invoked?

Thanks,
Stefano

