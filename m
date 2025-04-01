Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C751C174A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 21:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743541326; cv=none; b=M4WxrosXQNctZSJTpy68XSQWAtU3dyZNqlU3xYOruQ7nYGzUanrUM6KfD1HF+q0s98lVxmupC86MKFs3gKL388WeINIpmFz9ICWOaLMIltHenLDG6n3jrjKeBxJqVNq7z4CHMrC+Qa/CfAhnHbyCxRxidOGglWQkjsZx4SbIFrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743541326; c=relaxed/simple;
	bh=QpMJiwUoBFdoSP7DPzpzrR/BgmlNDb/On0b7vW+Ks+s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KhaoVGlMDS+b/XHjQjGG0zKes7Pe3HcQeqEY8hFuqihlHwbiKaZh3t58AeR4/efLMilHTZprgW9RM/EjMtw/Edd9OpTPqxGVCY6rykENDtzq0qsjwVWEDoYwM/bASeNJQfG0RwvrZ3FTw2kUERsGeGq2UUi/MrtP8HK4Pu6yLs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJgcwbt4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJgcwbt4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so42244275e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 14:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743541323; x=1744146123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjmWrNFJq5FsQ91RyEXZTPg7iV8Tf7Wr4X3A+p/WTNI=;
        b=TJgcwbt4EzGMxQVT6tCP5tDCsamoeNxv0Z0aD4Rg4tPMAlTr2TV1Gyrci4HVbKf3AN
         feUJoKyyU6ExDtGv2E9rkOXfLHUOn57HkOOuCDkpL5B4tI37sudr5eR28f9AX9J/9Ckj
         dRNBDHiasz/jyvwgqEsH5E3fwPXvqZJyebBxnftPMg68pFMEcUeoK/um0vw86BM6AI8b
         1bN0bESYmIHJLFBn7wYBhJnCDbD2qXQeqB+gS0gAn8E1Hi4KuV3/DvFaCAxSpRC8YM+p
         fAFChxKodnuz8Oj4DPM9odBzFKzJ5DDD5O6daly0TyzRsWftT68UlBvvCiR1GeBhE18m
         FlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743541323; x=1744146123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjmWrNFJq5FsQ91RyEXZTPg7iV8Tf7Wr4X3A+p/WTNI=;
        b=RFseaHhN0/aoI9dywmeJyUruaWSJ4hMJdC22UbnDocbtFmlUXpjvEH3NU6vEadcSiI
         VN5UQvdevtRDO2rap3VtSY9+6b1Cpxwpg7nNQV8fOZ9n3zPhV6nDgt142vSR9UOvvAb2
         0lKqYXpKFolOm5X29ZLah9orDZpQiqWWSUnOnB5cbsUWw1puTemuVpSfwYGPIRE/0KGi
         f3b5TZTiZMtFmMn5YZSzLH3Ft7OwoNZzXuiwGPRvcXvRfArvdkzCGN91OQ5/NVwNE3tY
         +QWu559akw/ltSACKty7UBW0G99eYPYWuVaBFx2rB0jMCaHcp6zOGkE9kvyhpaix96Gi
         h2fg==
X-Forwarded-Encrypted: i=1; AJvYcCXdPdVrS/Jhm8RNdqGv50o/mxQARG5vJWJ2DUx9Ugqol3bKP4jn9Nmc2ChorQaglui1pwyBSnRrCl/9aFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgbHEEAfHW5ICXSMnVMf8FSvbbu34qsu/wtws1lssGP4clFGKQ
	DDlHeFZN2dhuqhcVdKyAJavCuU47gRSnX6aJ39G4hYAZAgI1HJ50aOpFlg==
X-Gm-Gg: ASbGncsnTQhWcb7L78avqT+XNw2EhhaB4XHuVOSzRGqxvm5qYgWmZj2T344SGjus6o9
	MpSZoaYm79vXjCcFkFyxPXtTbcDjb7Mg859zPYbXIRFGc0Rf8n1iODXyIdsnOTFq6cD8wgf9h7K
	nqfV6tZXxnjhROW5TrbyzTkPfyt235xMkWTGGOASyL9thbM0SXKaN9LlTFdukWRt/GhcFNPqN/2
	An7jb0BibuwHTLxO7VBEhG1MZ1YfBvX0JZjH8s6QZ1BgQJorAR5rvVgqarudMuFREdV1eQJ0fTn
	42+FGUn1k9h/avZOPeMgCWmaam9KLzmfHApcD8wqGeLefW545dN/lOWYCoHnoe0tY2UN9FgoPQl
	X/9s+Uqs=
X-Google-Smtp-Source: AGHT+IH9YPMWiON4QM+xaQnB5yqCP10tZKboZ8LNviXyPWzJfgh/M6Q58FlmTI0dL5JuYBp5qZxPFg==
X-Received: by 2002:a05:6000:4023:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39c29767c83mr14733f8f.30.1743541323342;
        Tue, 01 Apr 2025 14:02:03 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c1845e66esm9181665f8f.18.2025.04.01.14.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 14:02:02 -0700 (PDT)
Date: Tue, 1 Apr 2025 22:02:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Xu Lu <luxu.kernel@bytedance.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, alex@ghiti.fr, lihangjing@bytedance.com,
 xieyongji@bytedance.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [External] Re: [PATCH] iommu: riscv: Split 8-byte accesses on
 32 bit I/O bus platform
Message-ID: <20250401220201.1fa3ec76@pumpkin>
In-Reply-To: <20250401154412.GI186258@ziepe.ca>
References: <20250325144252.27403-1-luxu.kernel@bytedance.com>
	<9F043708-3BB6-46CF-BEC3-2636E9A388B7@jrtc27.com>
	<CAPYmKFtAWNz7nCDDD7rjGeV2fRBgy5Kt6KR60pEyXAM=bb7r4g@mail.gmail.com>
	<20250401154412.GI186258@ziepe.ca>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Apr 2025 12:44:12 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Wed, Mar 26, 2025 at 11:26:07AM +0800, Xu Lu wrote:
> > Hi Jessica,
> >   
> > > Is such a platform conformant to the specification?  
> > 
> > We have talked about this before [1]. I think the IOMMU spec does not
> > mandate the implementation of 8-byte access functionality. The related
> > sentences are listed below:
> > 
> > "The 8-byte IOMMU registers are defined in such a way that software
> > can perform two individual 4-byte accesses, or hardware can perform
> > two independent 4-byte transactions resulting from an 8-byte access,
> > to the high and low halves of the register, in that order, as long as
> > the register semantics, with regard to side-effects, are respected
> > between the two software accesses, or two hardware transactions,
> > respectively."  
> 
> I think the commit message should explain an anyalsis that the code is
> safe against the mentioned side effects due to ordering.
> 
> And a comment should explain this:
> 
> +#define riscv_iommu_writeq(iommu, addr, val) \
> +       ((addr == RISCV_IOMMU_REG_IOHPMCYCLES) ? \
> +        lo_hi_writeq_relaxed((val), (iommu)->reg + (addr)) : \
> +        hi_lo_writeq_relaxed((val), (iommu)->reg + (addr)))
> 
> As the naive reading of the above spec paragraph doesn't seem like
> there are exceptions or why one register has to be the opposite order.
> 
> Also missing () around addr

It is also double-evaluating (addr).

I hope there is a lock, interleaved accesses from multiple cpu
may not work.

	David

> 
> Jason
> 

