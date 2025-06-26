Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A1E2F22
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944727; cv=none; b=u4UV1MabPr0ub2k72L7qjNi2jGyNHNGQCn/iwSVBlKmwYGDiBPrtQzpzbV5r44VDvseFC3PGV0H8dtOo3gZd/4C2txR2oh4pTnOpCW9fn+aebUEhD4/o7Rtwetm63pfz6LZUsfYY+L9UPdB4iNEURMSBlHk5MLpb1rU/cawNNvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944727; c=relaxed/simple;
	bh=AfPxERY5O1ODqtvE3jrBiWR4Wa3xTlBYcpIwRa/i1C4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T5nnRdAQSWJGXO4vsnKMDy5Bct60hzWxKrp5lCpnu/S9my7DtPIC1E7BKb2VvvDge5DxgffhnGBawAKfEHh2boYaWnJ8cfqWQ1Rg0odFUosQjMho7IA8Pq/GTze3exYfVCLyc6DDNMQ4MJg0o/1+gyW06q2i0g5b0r2VRry1Pk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jxj//Zy2; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jxj//Zy2"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7377139d8b1so881310b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750944724; x=1751549524; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ASrLckt86/ZNTRacVaov3vQ/UvbDNoBDf4mXFSO7YmE=;
        b=Jxj//Zy2L8P8zaFQyuha0cB3KsUq7TjdRSCHbEY0gLkT+DHS14bH/JGhkoLAZZB/up
         2ftKZGxjJ5+MOT9HKlIzGc8ePcUa50dSRGswvTKeyJvrW37iaIwfdkBRTeYKFARHYtKV
         +j8yobDr6cgmht2V18XXUgXL2Jy40bjg/CDcTzwb3uVi9EHBLs5CAizsYBLMRJh7/t8g
         BLH8AzKIWzOo0uw1VTbzlG6LCdZmH5nEbwk1ZqJm18gc0XTVPDZb62Nmu4THNPrUjpEC
         gxWzLK7PDacoZTlo/NTabay/I8oE1uoBmngXJC74lfPK4YpThvp4pExPoIFL/BIyOO4F
         BK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944724; x=1751549524;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASrLckt86/ZNTRacVaov3vQ/UvbDNoBDf4mXFSO7YmE=;
        b=IWUFNDZwSiJtdfOZCZGUtnt8ZbnJHZB9E9eGSRLsvGWhUzmNFY4Dtmjk6hJu2aRc1f
         t6v9NjgP3Y5qLx0OZE3zDSSymTK/BX8pDUbDF/rC3HdE5+PQkY6jr44xJx4k7+hXZCxU
         Ne3AVzKvoGGEK+T34vn6hJ2ha5GjJU9D9ikaUxlCO4G4sLqZ2vFXJqJdcmwjM1sH9oJh
         CuQQ09fCrk4YhcAOaRQLsizaKlJNveyElnyFPHZeeOuKtNO2AUG+/ty2FdVwV7V5sUuY
         Ek2clVyGRIuVTC3witjZv/tEU5EbgTueO9PUTLz4McCjlU93kDvrTq+Tv7qTWpdjAGLX
         2nAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLpi3gu/bVyr6hbYXNhAc5cVEMRKODCts//ume7HaowN0CX5rli6oDsCPiALT2jXa9rLQHrER1aGqWTDg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8qwRhR95ZrVilXjOGRBCWpN8mn7HukFw2oR22+q4X1UOg8Cue
	kXTpDsR8IndOhBVFfp2MIhdezgiOsOvS7tXc+lGI2ZvghFllFvOoQkjOM2h7G1HC+6LWjk69z9G
	wPIFc3g==
X-Google-Smtp-Source: AGHT+IF9h4ysHLrlN9OOLpZXfLNb/gEg++gGgYd5FNTn15a550cl+YtJM7IYux7wvWO6MykGLBZMOCCwD08=
X-Received: from pfvf9.prod.google.com ([2002:a05:6a00:1ac9:b0:746:2e5d:3e6a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c887:b0:218:9b3e:e8bd
 with SMTP id adf61e73a8af0-2207f206609mr9914651637.10.1750944724309; Thu, 26
 Jun 2025 06:32:04 -0700 (PDT)
Date: Thu, 26 Jun 2025 06:32:01 -0700
In-Reply-To: <20250626090439.GBaF0NJ34n065_4vb-@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <175079732220.406.9335430223954818839.tip-bot2@tip-bot2> <20250626090439.GBaF0NJ34n065_4vb-@fat_crate.local>
Message-ID: <aF1L0fbNL6xE0C8d@google.com>
Subject: Re: [tip: x86/urgent] x86/traps: Initialize DR7 by writing its
 architectural reset value
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org, 
	linux-tip-commits@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin (Intel)" <hpa@zytor.com>, Sohil Mehta <sohil.mehta@intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, stable@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 26, 2025, Borislav Petkov wrote:
> On Tue, Jun 24, 2025 at 08:35:22PM -0000, tip-bot2 for Xin Li (Intel) wrote:
> > The following commit has been merged into the x86/urgent branch of tip:
> > 
> > Commit-ID:     fa7d0f83c5c4223a01598876352473cb3d3bd4d7
> > Gitweb:        https://git.kernel.org/tip/fa7d0f83c5c4223a01598876352473cb3d3bd4d7
> > Author:        Xin Li (Intel) <xin@zytor.com>
> > AuthorDate:    Fri, 20 Jun 2025 16:15:04 -07:00
> > Committer:     Dave Hansen <dave.hansen@linux.intel.com>
> > CommitterDate: Tue, 24 Jun 2025 13:15:52 -07:00
> > 
> > x86/traps: Initialize DR7 by writing its architectural reset value
> > 
> > Initialize DR7 by writing its architectural reset value to always set
> > bit 10, which is reserved to '1', when "clearing" DR7 so as not to
> > trigger unanticipated behavior if said bit is ever unreserved, e.g. as
> > a feature enabling flag with inverted polarity.
> 
> OMG, who wrote that "text"? 

I'm pretty sure I can take credit for the latter half.  You're welcome :-)
