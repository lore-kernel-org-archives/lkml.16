Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16B2219E8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018567; cv=none; b=gX6tIuKgT/79P/nUMj7qgkYyiOvyv9ecSfdLkqRx9LjmBMWVqswYO1tlP+cSGEhTy9c6x07j3DaEWI9JNG90Un+UlTdZ62Z7wnOKt2zrZaQurikS2MG/ANHRsm1l7Mfg20IV/AdT0CW2St6+SO+CZsrzMAfgV4/FcF2gjQp2x20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018567; c=relaxed/simple;
	bh=uND1zTsLbRfA156loyQQTWvczGvRZ/u+6QtGYINO3Bs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eoGjtihK20FQSvA/QQ5NzOhoc+UilOulYCszJPZtUq2oq1py8HzYRWF/aWgKv/xI5OJE5SPE8bgSFsvY71gXr2SMF+roWnwJfmm3lsg004AwQNqEns0EJxcMkeSbgTnfqIa0tM1FKEfJnxJpI4ixT6MK0l7O3STLTprtLK8p8ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O5ShLMq4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O5ShLMq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JruzEJIRQhce3mYeDqfrw5tsAk7gf7uEqexFvMHB+aQ=;
	b=O5ShLMq4HPEffalbUXwzmCGCgjnVxyG5IuN6BMZ/mXFMwf+5778af7XqH3zg4FKmkztt6n
	23g1ToNMAQ73y3PxEgBsa7PJL2ElA1mCLqjDAJpoy17NhJuj0ftls25hjjC4E6iyj38fbl
	7Siw/SOHVv2IgovztFMojoxEhF/x27I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-H7ggYGKiNMaC2aLU74nwiA-1; Fri, 27 Jun 2025 06:02:43 -0400
X-MC-Unique: H7ggYGKiNMaC2aLU74nwiA-1
X-Mimecast-MFC-AGG-ID: H7ggYGKiNMaC2aLU74nwiA_1751018562
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450df53d461so14570765e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751018562; x=1751623362;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JruzEJIRQhce3mYeDqfrw5tsAk7gf7uEqexFvMHB+aQ=;
        b=Hr023rD/1pkzT+0texnKKIJQOj61/Dt7O+NLUDDRLxl+5jm6ekFvKTLXaD3MiQdzJv
         C5d+XfMtbA1iPJ/Qdx8PUPXsNXzeegbsEfxk9L/s2pXD5e82GN2kOKIt5mEuZa9LBYNC
         p4949NNIqof24GIC3QO1rSJZLcYqkOhgXc77UWjKxboBUkUMyFQXblGpOTDyCpFo/7Ns
         kL3va/aDC2EyDRDIz/vttFdzZBz0vBSBweKl/3+mKX47olANf6PACTm1rmamRvLK2e1a
         Xeix9p2+mRwGEaj2oHqCSqdKUqqClRTXso7ty7L65Y13fMQEbCe6QG02+GYxrALK2CNu
         Z/ag==
X-Forwarded-Encrypted: i=1; AJvYcCUeC8kgDZUAEToBC0bWJCG68BErgcFUhqwp5FafXwjHuLV7pqa8hZk3/gUIsp/3KhrFLf3XaJpt/XLMOkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTihzLk7URqCh4leMYl0IrZjB5KEiGLrz2lDjfmewdKUnkaa8z
	nxl5/N6N4HZ4ub13yrukA1DpC56+t4Sl9R7P31u4bnRd+UOCRAwPNalfBdLX5pIm/UYu/tVk7cQ
	miRhHJtFnirLUF/OmZQuCZcwvyhfAzttBnYH6z3M8yIlZFWQCyrCF6yHvKvCqcrLNRQ==
X-Gm-Gg: ASbGncvigQ0BTBJDovUSVlbCGegz0ViPdlNHhcdhdJ2sAm6xK3Yc1CCwvQxZHWUVy56
	SAQKL+0XRABEd7ZbSaFlOEDo2RHnbgEjgqKCG/V7PU407K4t5En28ZLaIqoV1dU+z1h4CngW+pe
	rW8NPg/+wGCSDTuhj4oc/32NsSwQ5vC4pmuGUxD/2trpQ/LM8LTAvTNJ+ka3hsIl6o/qdYEFVre
	Vzfg/skClJphVv95QzJMldt7bASR0IayaL9thgVBuURHzvl2LxB+X9BdnVOlH4bbFmFaVt9RsRx
	qOd32KKwxXyYN55rcjIfoRGrAoCaz8ZdRnZhWlJjyyEWxXyKoPWLOnPTkNUWgM8TOB94RkBy91j
	wk98S
X-Received: by 2002:a05:600c:1388:b0:453:6146:1182 with SMTP id 5b1f17b1804b1-4538ee81e72mr24527065e9.32.1751018561958;
        Fri, 27 Jun 2025 03:02:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwb9GAheZs7CdFHttEfxVdyFchwFX9maJhmXPPUtAcTAKpVIiwYykxGlnMkLxlaLZoZwT/uQ==
X-Received: by 2002:a05:600c:1388:b0:453:6146:1182 with SMTP id 5b1f17b1804b1-4538ee81e72mr24526645e9.32.1751018561487;
        Fri, 27 Jun 2025 03:02:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe0efsm45121195e9.24.2025.06.27.03.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:02:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Weiss <luca.weiss@fairphone.com>, Hans de Goede
 <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] fbdev/simplefb: Add support for interconnect paths
In-Reply-To: <DAX814DZF6AT.31N8TZWL5LMDT@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-5-f69b86cd3d7d@fairphone.com>
 <87ldpdd3dn.fsf@minerva.mail-host-address-is-not-set>
 <DAX814DZF6AT.31N8TZWL5LMDT@fairphone.com>
Date: Fri, 27 Jun 2025 12:02:38 +0200
Message-ID: <87qzz5biyp.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Luca Weiss" <luca.weiss@fairphone.com> writes:

> On Fri Jun 27, 2025 at 9:56 AM CEST, Javier Martinez Canillas wrote:

[...]

>> These two functions contain the same logic that you are using in the
>> simpledrm driver. I wonder if could be made helpers so that the code
>> isn't duplicated in both drivers.
>
> I believe most resource handling code (clocks, regulators,
> power-domains, plus now interconnect) should be pretty generic between
> the two.
>

Yeah.

>>
>> But in any case it could be a follow-up of your series I think.
>
> To be fair, I don't think I'll work on this, I've got plenty of Qualcomm
> SoC-specific bits to work on :)
>

That's OK :) It was just a drive by comment, but as said I don't think
that this code duplication should be a blocker for this patch series.
-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

