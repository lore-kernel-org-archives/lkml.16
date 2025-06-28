Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE331DB548
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751096661; cv=none; b=n23MJdELK0HXAfW1GfzRkGNEKIQh8eFElshgIdXT1haqOmaZUQ/KxaQY1MtKhtOOSJ1XK9b+D+r1PJKW2POH1MLbwpOLSUEtGPJqd4NighjSBEl4K+gYem4fnhwIVcVYrggKOYGEQ+6BBqd/5pEAF3zLq482SywzCVwWfyBXwUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751096661; c=relaxed/simple;
	bh=0vRi26Q3QuRDz6cK9hW52u+2U8nyDX744tJFxuHLVD0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dEN5nYQyq00iC4+jxIp4FzyUKK1aqu7bapskACdo1vYQF6D86JwaE/bOIPSp+dInp/M6VqLxJ2r1k8giFJCClJ95D61UgzYJaT8cl1CIr/RzTCW1dnJygifG9kb41ClJVvMhYnkAcOowCMCWfTIV9c3M7DT5hapkrSLJoCu1LbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dt1IH20A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dt1IH20A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751096658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ydIOn4cObg5jMynOcPUQSKhCiIT10hi8OVkhpABvLHw=;
	b=Dt1IH20AAfsxMrFVqgBm34ppWsqgG5FvlhThQKwE7img+Xo/4etB2E5NE8Qloq+vJdZtAt
	mOua6nk5en6rNM8A6XtcvCEx06WcrzU0T/UUnQQoaMqknlTHY7hMjr+bstajyiYR6DlAsH
	iG8VLYY8BqObnLWGydtOSs2hqMcoDys=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-aaJryC1KNCqlMoDZSg3mYw-1; Sat, 28 Jun 2025 03:44:16 -0400
X-MC-Unique: aaJryC1KNCqlMoDZSg3mYw-1
X-Mimecast-MFC-AGG-ID: aaJryC1KNCqlMoDZSg3mYw_1751096656
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45311704d22so3079865e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 00:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751096655; x=1751701455;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydIOn4cObg5jMynOcPUQSKhCiIT10hi8OVkhpABvLHw=;
        b=Wb9x7VTv3bGbo1yPUoutO/s3qtUVlxetQSxOJLzloh1S0UgHQ0DO8tuXVndkcO0wW2
         JEq0Bxl2PykezACNCbYu1a20Tnhd37shjY6VathsiFPac93D6x576Dm8vuakwWU+g8MN
         Z/oAYRIdZoNnzTKNA3xhVKECqdx48Q9kHpYL5YjJveI3ng8MYBZhhzGnbvx0EbscCMEQ
         SPETR3lgP7Ic7uW3+3NC50LUkc+M1GJ/kaclVpuIA1bhxRJS2l066QvAZqPM1LAlAqhq
         at5JxhPZI1YqgEokKaim013Db0h9uXNFa8dhy/s+C6aanCXMNOwj4L7ZAWr1uYFlSOp2
         Gd4w==
X-Gm-Message-State: AOJu0YwMnZ3G2OzKyhwflVjSruPlAINlUXUx2K8QnVDHT30FbU42DtET
	fQfQrghRuNycpnu2kANG7z11gHc1EtsvfLqlh/wC8y6a/tRQt3E0JYESQ4q5dwFq+U0btzjWrEZ
	hqZOxuSbwUGK9tf2yu3a7rV9AP6esOrDFh1NXz7sf0AkqnP3ioJ4RriuzljArh2a1hHiBWM32/2
	qhnMAuapDw4/36EnHdKYVxRS6GHFIl2wBzLeWKyK378pwzyRKsBg==
X-Gm-Gg: ASbGnctXpzknjc79cgx41Po5JHZgNnOP/zkHUdvh4bxrdCvRwYgUooUAc2eHPIwR7tn
	d15OW/wQBdB5bCGEpRQm5oW6RT3r/FCsWw0GgXhcV9ERhnqNOsYlRGalw3udR4bwKnp0GgeZcqm
	Upkz4K/MA/8R0Ij6kDcuoYH2m+Tm6Mo/tpgPz3hQOOXG6s1tYIqSOMbEu8NlZQFm2PAloJ38qZM
	BvDnzykhcIFTs6KMpkp58UXjcc/xyfKUakunv/PmI1rK6KnR3nWNoYRcl/3tkivuYmNcOR1iryA
	8SmRpAJyBHVnc5h8SA3ntZwi1TtRf2o9pI0El6vC7qIKw+LAF1oHYhW67CU8dwiFENMX3VLgcHp
	M22sj
X-Received: by 2002:a05:600c:5493:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-4538ee3b945mr61735975e9.13.1751096654998;
        Sat, 28 Jun 2025 00:44:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA3QiP5gV2eDPP2/C7TDuUzC2dzUVwImKjDjLFfIECYmunirpIeECcO6UhqJs+LjySXky4Nw==
X-Received: by 2002:a05:600c:5493:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-4538ee3b945mr61735675e9.13.1751096654451;
        Sat, 28 Jun 2025 00:44:14 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e6214fsm4673306f8f.98.2025.06.28.00.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 00:44:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, dri-devel@lists.freedesktop.org, Borislav Petkov
 <bp@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simona
 Vetter <simona.vetter@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add missing sysfb files to firmware
 framebuffers entry
In-Reply-To: <20250627113328.2703491-1-javierm@redhat.com>
References: <20250627113328.2703491-1-javierm@redhat.com>
Date: Sat, 28 Jun 2025 09:44:12 +0200
Message-ID: <871pr4b99v.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Javier Martinez Canillas <javierm@redhat.com> writes:

> The commit d391c5827107 ("drivers/firmware: move x86 Generic System
> Framebuffers support") moved the sysfb*.c source files from arch/x86
> to drivers/firmware, because the logic wasn't x86 specific and could
> be used by other architectures.
>
> But the drivers/firmware path is not listed in MAINTAINERS, which led
> to the files being orphaned and scripts/get_maintainer.pl not listing
> a mailing list to Cc anymore.
>
> Now that we have an entry for all the firmware-provided framebuffer code,
> add the missing sysfb files to make sure correct folks and list is Cc'ed.
>
> Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
> Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Closes: https://lore.kernel.org/lkml/aF53djlieUNF_-aV@smile.fi.intel.com/
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

