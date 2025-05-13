Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A75113A3F2
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 23:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747177350; cv=none; b=AocfaIaI6YNMpqMgRDtoXE/U46JH2Y2ZdsFDRaBSXp/28dJQ45M26l1cmThDXLyUXLej44VOSNNuvoTpLeRL51VtURjLqQT4+kKVrHCPt2NmGF7OHef6Yy/bSggxqwdYQ+MG4ApcWrFfd3jf3DxeRmBqZtKVPfdBSF1kttbl+J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747177350; c=relaxed/simple;
	bh=HS7KCuy2/DnDAg76S1NIlhpz08WXNQ2yVcHahXfjjFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L06BGe1v2PSkIwv3gNUklSWpDyotaJn0UVcFEjpxQCRFZj85QsKmkELnLp2vytZ1Z0fmTpAvDd6xKxKEVA0ZH799hDlFKtDMVDszwkMd+/hNIxtDCR2wLswUJ18CXnmlPqdi7l83gN4SWz4eyHEnel41+A4lJQKXOhzcmXObxh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rlma7ZWj; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rlma7ZWj"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22fa414c478so35168635ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747177348; x=1747782148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wnr8wsbyPnSV+cgyVcx0RwvMFrEee6Q7UKMt4FP/PNg=;
        b=Rlma7ZWjP0zpz/Pg6SKPA59kiy+YqJIfM9qReKfCrYhpch9SrZ3Hqn1GMMyiUTwUtW
         7VnC+wDpGQ2cjGrEPrlPHc5mBPdvLCQLXJ4y6QErrqeXrvUX2aVi+f7bs8ULANUpONrz
         qwJ2l5VEkUwMMMul9ln7dmsXuHGFQ8vFMiMJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747177348; x=1747782148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnr8wsbyPnSV+cgyVcx0RwvMFrEee6Q7UKMt4FP/PNg=;
        b=P6/tQzdNMBTwrORmskgcluN8H6WABYIsEtVJq8I8+OmRqHuGHUS7VfRwqvbXIal8AY
         deYJhvmEdgz885nVqwgoBgTFcEaxjuhUZOrByT7By2XtFmCSDom9J3vdENZwwtujSHve
         WjUaYD/+M6IeuzwBLfR+Oj9abdR4HSd77NDZoBiFS4f/E+DBvLsWNjBTkQVvELR4t7lu
         OqjiocOIF2eCenxA0pxUPWGe3yyu9Zbflfuwn3X8Omu9Ymm1w0+HyZIy+HdmW6XJ5PhF
         8F8lWWCL/KAq1R4b7RJwLVwfN6+J2eZlj9ltRQgZ57LlN42QulXIbaE0psXF5IBAFZBM
         6UnA==
X-Forwarded-Encrypted: i=1; AJvYcCXojlR2VZ9HDVSt/metaFby6cYeqMeLCoQPQk+eARmnkG15+KNEC3H/swSYdV1PiRHbnG6HWkm8amCR/18=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgYVuU+FLhESiRlvcIJ1CFYC2WAk2HXr+bcgY8OfTfqmkwHWT2
	AcNfhizpPiGKGml+OATCipjYQ0zNLk0fhuHE+DW1f6wkng0brhN9kvfugSQSwQ==
X-Gm-Gg: ASbGnctO6XfEprWoFr1EZHtRU1D9jh5yFt0nuqczQViKMSs9/Dke5iUByuxVNDRiEQi
	LMjmz+fKf1/5DVUexXMZiQwJPMbNXpGKDXmvlLzTAwCdUI0R8syCthNZOdXEtnBHboq1tGAgZQ7
	pIZySDpU9KPf3yKa+qfaR4mQg1pd6WfrQv4HuGR845FC1z1HW7tyl9X0CXXxVSmnw0nY0Y71Iq/
	GJDNxX7UFpYjYEdS//IqxIQJbe7+7byVdiff2X7jX0kg5upG0I/jRj5pIGxz3maDeuCG/3yaWIJ
	9LWTkRHdvplV46eaVVeP+2zxoTsbddfZIUHVT5U4xgp/RM6P42iwg6312xHNcV0lP1F3rONIORs
	GiLlYx5LBUC411A==
X-Google-Smtp-Source: AGHT+IEMEOp04bLsMsppNMCgUTlcEAMu+sUV4QOyJ8uMBJY3bmV1urZIU6x5yerSpa/zqeR/DvrwzQ==
X-Received: by 2002:a17:903:1207:b0:224:b60:3cd3 with SMTP id d9443c01a7336-2319813ec9cmr17250985ad.19.1747177348251;
        Tue, 13 May 2025 16:02:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:b0a6:1dea:5306:7727])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22fc8271f77sm86309865ad.126.2025.05.13.16.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 16:02:27 -0700 (PDT)
Date: Tue, 13 May 2025 16:02:26 -0700
From: Brian Norris <briannorris@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, chintanpandya@google.com,
	Marc Zyngier <maz@kernel.org>,
	Maulik Shah <quic_mkshah@quicinc.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] genirq/PM: Fix IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND if depth
 > 1
Message-ID: <aCPPgiamOQSSHH-m@google.com>
References: <20250512173250.1.If5c00cf9f08732f4af5f104ae59b8785c7f69536@changeid>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512173250.1.If5c00cf9f08732f4af5f104ae59b8785c7f69536@changeid>

On Mon, May 12, 2025 at 05:32:52PM -0700, Doug Anderson wrote:
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -272,7 +272,7 @@ int irq_startup(struct irq_desc *desc, bool resend, bool force)
>  	const struct cpumask *aff = irq_data_get_affinity_mask(d);
>  	int ret = 0;
>  
> -	desc->depth = 0;
> +	desc->depth--;

I'm certainly no expert here, but I'm treading on the same code and ran
into a problem with this line too. It seems wise to make this a
decrement, and not an unconditional 0. But I'm not sure that we should
then proceed to unmask an interrupt that might have depth==1 in the
general case. I think we should defer the unmask until we actually reach
0.

In fact, that's one aspect of the very problem I'm dealing with here:

Subject: [PATCH 0/2] genirq: Retain disable-depth across irq_{shutdown,startup}()
https://lore.kernel.org/all/20250513224402.864767-1-briannorris@chromium.org/

It seems to me (again, not an expert) that maybe you need to solve your
problems by dodging the disable-depth entirely. But I'm not sure the
best way to do that.

>  
>  	if (irqd_is_started(d)) {
>  		irq_enable(desc);

Brian
