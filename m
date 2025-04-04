Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440E11DE4D6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773785; cv=none; b=dKlwWT4zTdzOklflptXpTq7MsIWZBa4BewaoXz9DO9VuiVDm3RrRQKIODtZIwbh/Pz5hhdfFpeO9FY91+UxUH9NiZZWjsoxq5RtxNlm3usFrL122m2jzHqBWmFJLQCn+mvnEOH9HkUAk1iyVgkHsdYS8YuDwHp03S9Z7d95BBpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773785; c=relaxed/simple;
	bh=BFtRrOiMb4YodHyDzwtpl7EL/TOyP1jSsqhzyFxYG9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ar9xq84mN+HIH7izoiwOX2Q8UaT9AvvAKm73DKc60PCig3LoA/MJX1uVtA60d6bSK3LUamMkU9v6oDOVpDuDRAJw0kZd48d5o/bnYbyscyEQ2GXAx9/xMxZ7sLego6it3ORmX+xduWqvmhtOqX3Vrc1+uErMob10UY+YwljQCs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso3741460a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 06:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743773781; x=1744378581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AymxfdBPdivTlBBSjvnlepuzTGycHmeguhnsChkicb0=;
        b=k3a+nfIKtMymgh6Lb38rAJPIEMWhfjAKzLOnBsW7FfUSjpH0kfi7GS6qBuyyP3Ncnb
         qJV8ORm5NBnp3rokYE7q7NfntfyrGO6t70MmV2azBDKwmCw4pYAZyu0AIGnxsPV0y/0X
         tmCCQkAQeW0SVSljS8DhWNFJhrx+p381xPjbmQSKPKjy2AG/HJvljdMSuivAcSeFJaw/
         Dpkqlcm31N0pfoYRULv9UrdYBD3AY4zqz6a4n3BVX7rjjM7EkXedlb6jvlWwsjPFOLje
         ocYyduhhfzFEpxhA0lv+nMC2VjiyHvyAZYmNKN+nETTw3fDocRMt9Bqtdl/IVnUZ4ZjR
         0ivA==
X-Forwarded-Encrypted: i=1; AJvYcCWAl9dySLk46JYusY/jc/Osj4/Pj0D1evH2maxbtHFtzWGvxk4zfSIeKBdb7CIV2OZ+mRfYiuOURcanDcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YznCrTQiV3rVr5fBq93JEDA47S06SOlRqZ5x3UtkBQD5k6NvkEZ
	5rVMa5UwR5Pr+9HaewU2hRtWswwH1Y2PmNadnia/3oJph68Qc375
X-Gm-Gg: ASbGnctveZqxxWn4pp/L2pyo3E3IZ8a1SiTRplGfRSSHzvOTd8Ta2DZTZhhpBnuQCsh
	gYuxOCutsESELEwfxrFIVqgVpiL5FIDqh9C1PehkruBgdKwhtzu6BWm1ddoS5SMxI1zipa8vXfY
	tjIzUO1SkxcAQXAb8/29d9Nkgr/NTp/Moqh6x5277nOfzYhRcBT7SyQwE4J6PaYBPt4KD+9P/zX
	L6B0EhVvxhXFBmBAZMiireN6WUDZoLnzOXb+PLYF7Hl2e6d7N8L/u8GEHPAUEN9x/vUDF5BKumF
	QvfxA52RzsAWdJ926peLoOaaIy9eOlgjPRriQ+A+Ca3EMxQ=
X-Google-Smtp-Source: AGHT+IEe1DcXvjfKi97dlkXleUL4qZHR/l5/Fg9N/S5IGWNfRlWsNbeszuME1HhRdGxUwtCnLnDDew==
X-Received: by 2002:a05:6402:2108:b0:5e5:e78a:c4d7 with SMTP id 4fb4d7f45d1cf-5f0b3b9a0e9mr2469636a12.12.1743773781185;
        Fri, 04 Apr 2025 06:36:21 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f08780sm2398706a12.39.2025.04.04.06.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 06:36:20 -0700 (PDT)
Date: Fri, 4 Apr 2025 06:36:18 -0700
From: Breno Leitao <leitao@debian.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de, kernel-team@meta.com,
	vincenzo.frascino@arm.com, anders.roxell@linaro.org,
	ndecarli@meta.com, rmikey@meta.com
Subject: Re: [PATCH RFC] arm64: vdso: Use __arch_counter_get_cntvct()
Message-ID: <Z+/gUiv5gCuc7JfK@gmail.com>
References: <20250402-arm-vdso-v1-1-2e7a12d75107@debian.org>
 <87a58yz0cm.wl-maz@kernel.org>
 <878qoiyzic.wl-maz@kernel.org>
 <Z+57uXX3u0zeTGeP@gmail.com>
 <871pu9yvlb.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871pu9yvlb.wl-maz@kernel.org>

Hello Marc,

On Thu, Apr 03, 2025 at 06:59:44PM +0100, Marc Zyngier wrote:
> On Thu, 03 Apr 2025 13:14:49 +0100,
> Breno Leitao <leitao@debian.org> wrote:
> > 
> > Since you created *all* this noise regarding instruction ordering, can
> > I pick your brain in the same topic? :-P
> > 
> > If my machine has Speculation Barrier (sb)[1] support, is it a good
> > replacement for `isb` ? Do you happen to know?
> 
> Probably not. SB prevent speculation past it, while ISB is here to
> enforce ordering. We're pretty happy to let the CPU speculate the
> counter, as long as it does it the order we have defined.

I understand `isb` kills any speculation very badly today, given it
flushes the pipeline completely. That might be reason that replacing
`isb` by `sb` makes the operation 20%.

iThis is what the `isb` manual[1] says:

 > An ISB flushes the pipeline and ensures that the effects of any
 > completed context-changing operation before the ISB are visible to
 > any instruction after the ISB

[1] https://developer.arm.com/documentation/100941/0101/Barriers

> On some implementation, this can be have a similar effect (drain the
> fetch queue, restart). But the intent clearly isn't the same, and some
> implementations may do things differently.

Let me back-up to `isb` purpose in such case (before reading CNTVCT_EL0).

From my understand, it severs two propositions:

1) Make sure that the code after the `mrs CNTVCT_EL0` is not executed
   out-of-order before the read
 
2) Code that comes before the the CNTVCT_EL0 read retires before the
   read.

If I understand what `sb` does, it only protects against 1) but not 2).
Is this the right way to understand it?

Thanks for you time,
--breno
