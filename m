Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244232192EB
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 22:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747346746; cv=none; b=Y1jkpSRTxjW4+ykSu2jLrHR8v/3xMjHf38RhqKp7bcogXUuCRob0RGXDGw/oFH1OJYMpA7wah43bV5554SbNr/bfW7/1zuMyANE09iCckve3BMlRZr+X9pUKuxYmdyGKsx8lHM2jSqE5tstMflF8laJlDPevtAM7OQVENehkwHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747346746; c=relaxed/simple;
	bh=R04t5OP7VoRR7an/K/mH1NZqJb80IHwLckbbrUiaTWY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VZmmG+0DRc0eATjsUdRCq6cDMljLdJsc+5W0X+uzGoMWMZYJ2vMG3tIjTuKqLgsCxYVo7oMyCQaPDPtklnSEo0fzKaYYegQZXsCazVA+ocvKpq0pBTqEiIPwtikPjeTyH6NI+1hiu+OBXGxVKaIbAEV2sdMvEPssfpPt+WLvDpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xru8s1gV; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xru8s1gV"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30ab5d34fdbso1573723a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747346743; x=1747951543; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oi7sS9/hL2apZcsFxNVWjiM0xG6d7sH4nOsxyAerdW0=;
        b=Xru8s1gV9rTttrOCEX454kSAt6Z/XcJLtgwZZVSRIho1K0AdR3xDFulZlIfeL9NAUO
         nsCEaHUXj3pBGi/UBNg9JD1tMvpXrxK5THx+A8iniTuqQfFAaE8lPWGPwmoBeQQsmlcg
         RFYo+X7oThXS0X3zjX4Zha6JPli4exBIAQMoZbRR6zArhr2KjTF7ROpFu5UBocz6GmMv
         TpU1uOuE/bFmdpteQphfquHLDQ4JFL2UK0Q/ujWx/7odLtbHffW7d2+o+ZBtuPTZLMXF
         h7h8G1TFobXE+gsxiVVkIfrEH23lgAPRIj7LviOvMFzxVjWuV0u/rWiRcl1Iu2V5XH3N
         y5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747346743; x=1747951543;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oi7sS9/hL2apZcsFxNVWjiM0xG6d7sH4nOsxyAerdW0=;
        b=cwGrPsO71LLOOhNYaawqTcvW0cVoq7E7ZG2rhEG6dnUEN9x5b+CYttLh3Yg0mXxd+l
         alEY8GoTYMfvRlQnoM2yQj0XAp/cAvCMMokBoA6LP08FznErKTdt2HTliskIYYyjDul0
         b4asrtHTHi4orlMRHGTXS3u/Eo7nYllyNYaAxZfkQ3WfuOHPpYOaOZE9Kn9buMLHnVmk
         vkkUxFJrNfoFEx1MbB0ZKMmwyxSH9P4EqQS6JWSrOYyJ407/1qKHPjXU0wYx5gJN5qBj
         oxSch3tt6mV27i5NTp+UeADEc6KhKGUTEMgUGJY1e+7M8Pk5P73dbW5lnWLIBFhlO3H6
         tn+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLsr5JM4A/I+6KPUXPNmiDsaAHkcieKqT/2cWrsHP739nEZo0klzugyoABna9E0UWIaM/cQ9K5IaJDRo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw0aoIMAjkIYv2jUWEz4EiSELJbpWUrvv468B2FqlurYsta2uG
	YgHLf+OKlLWX5RQhRnVjLqElpPaMqpgiSID0v8h4t9J02UdbUdRQ3cnCcF208ErXlAaRHAzQevZ
	ogIMHaw==
X-Google-Smtp-Source: AGHT+IFsAyQHkBD9JIcdxXmgn3lyYCeVd2u7vwK18dv1Rs4/Dq4Q7I3Qiz7gFrycKUxrAq6vHuxsB5iwTcg=
X-Received: from pjbqc9.prod.google.com ([2002:a17:90b:2889:b0:2f9:e05f:187f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dd1:b0:2ff:784b:ffe
 with SMTP id 98e67ed59e1d1-30e7d522171mr1418806a91.11.1747346743464; Thu, 15
 May 2025 15:05:43 -0700 (PDT)
Date: Thu, 15 May 2025 15:05:41 -0700
In-Reply-To: <20250515120804.32131-1-sarunkod@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com> <20250515120804.32131-1-sarunkod@amd.com>
Message-ID: <aCZlNYlhSKXRFvnc@google.com>
Subject: Re: [PATCH 00/67] KVM: iommu: Overhaul device posted IRQs support
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: baolu.lu@linux.intel.com, dmatlack@google.com, dwmw2@infradead.org, 
	iommu@lists.linux.dev, joao.m.martins@oracle.com, joro@8bytes.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, mlevitsk@redhat.com, 
	pbonzini@redhat.com, vasant.hegde@amd.com, suravee.suthikulpanit@amd.com, 
	naveen.rao@amd.com
Content-Type: text/plain; charset="us-ascii"

On Thu, May 15, 2025, Sairaj Kodilkar wrote:
> Hi Sean,
> 
> We ran few tests with following setup

A few!!?!?  This is awesome!  Thank you, I greatly appreciate the testing!

> * Turin system with 2P, 192 cores each (SMT enabled, Total 768)
> * 4 NVMEs of size 1.7 attached to a single IOMMU
> * Total RAM 247 GiB
> * Qemu version : 9.1.93
> * Guest kernel : 6.14-rc7
> * FIO random reads with 4K blocksize and libai
> 
> With above setup we measured the Guest nvme interrupts, IOPS, GALOG interrupts
> and GALOG entries for 60 seconds with and without your changes.
> 
> Here are the results,
> 
>                           VCPUS = 32, Jobs per NVME = 8
> ==============================================================================================
>                              w/o Sean's patches           w/ Sean's patches     Percent change
> ----------------------------------------------------------------------------------------------
> Guest Nvme interrupts               123,922,860                 124,559,110              0.51%
> IOPS (in kilo)                            4,795                       4,796              0.04%
> GALOG Interrupts                         40,245                         164            -99.59%
> GALOG entries                            42,040                         169            -99.60%
> ----------------------------------------------------------------------------------------------
> 
> 
>                 VCPUS = 64, Jobs per NVME = 16
> ==============================================================================================
>                              w/o Sean's patches           w/ Sean's patches     Percent change
> ----------------------------------------------------------------------------------------------
> Guest Nvme interrupts               99,483,339                   99,800,056             0.32% 
> IOPS (in kilo)                           4,791                        4,798             0.15% 
> GALOG Interrupts                        47,599                       11,634           -75.56% 
> GALOG entries                           48,899                       11,923           -75.62%
> ----------------------------------------------------------------------------------------------
> 
> 
>                 VCPUS = 192, Jobs per NVME = 48
> ==============================================================================================
>                              w/o Sean's patches          w/ Sean's patches      Percent change
> ----------------------------------------------------------------------------------------------
> Guest Nvme interrupts               76,750,310                  78,066,512               1.71%
> IOPS (in kilo)                           4,751                       4,749              -0.04%
> GALOG Interrupts                        56,621                      54,732              -3.34%
> GALOG entries                           59,579                      56,215              -5.65%
> ----------------------------------------------------------------------------------------------
>  
> 
> The results show that patches have significant impact on the number of posted
> interrupts at lower vCPU count (32 and 64) while providing similar IOPS and
> Guest NVME interrupt rate (i.e. patches do not regress).
> 
> Along with the performance evaluation, we did sanity tests such with AVIC,
> x2AVIC and kernel selftest.  All tests look good.
> 
> For AVIC related patches:
> Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
> 
> Regards
> Sairaj Kodilkar
> 
