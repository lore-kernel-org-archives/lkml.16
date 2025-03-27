Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980BB4A21
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077769; cv=none; b=V/crPjNXYw6VBNdO2E8I/LKhe9oxlGLPeGV2k3vDJ1vu/nj37ntX4Mfo/TZJNGfjt1pFWZGlSZ9OyrLu7lVmm14ycl7oQd1YoSnUn6oZ5V1UFwQUiMWbfUmrekTLOjtYS+JgmXddgcksPgN19BcSqmtTmY7kS+Nx3fQkHE5EjEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077769; c=relaxed/simple;
	bh=Ese7lpLsAbAKoeVLvFWvwJokH3y8UYfakGfsCmwdif8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihXGsBB6yp/Y3Vh+OZ3ErmR1SuShKwMtV9aUy8tx2Tbnu4BTO2Ah9nVGOp2SKhgX6Wk2FdgM99LtlMTnjMiTuEta69oKPupc6a1HraavUI1rCSFyVYVecTWeMkpAz4LGjZPCMSXCWhtHUrqOP5A944pY2cVHkf2WDylGc9TmGVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRj7TwXp; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRj7TwXp"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5499c8fa0f3so971788e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 05:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743077766; x=1743682566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=riIyAnp1BqzCauiLRUDX9IVtOvAZ7JXvsQQRo+JNfy8=;
        b=lRj7TwXpok5FK5/SSrt+w+9guPF+JiXzZ/+bxhR4LFlS+CvzNcMHuk4qLCTyomkds3
         yvWl7DaTMzIWCDvBKKkvqpw6q8iINlR5KY/HjEy4BHkn+QKk14KVUJiKyqF/WEp3IaxT
         Mf2AEvSUlokL67suPbOjusKlAlb2nM9hGkK094WWztRx3POSGHkQ1Pusg49Q0t7gyq6y
         UAELWFsxsa6H8gjOestmwIAPGeHmTtqOEnDBjtHLVxMiIuicN/pouFd00/dLcYueXhkW
         4CJyIZXC0TY4r7TbSonJOXO679SCMe/e8BV4mJ6ttzw9BC+QTMEsTGyUVfYouJwXBJ2d
         Peaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743077766; x=1743682566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riIyAnp1BqzCauiLRUDX9IVtOvAZ7JXvsQQRo+JNfy8=;
        b=wJ4HAqPYEjvzzCCrCpRA7WZEBjZN7Chptexzn4QEjlr74bG+te8GBl3SIfTgknI3k9
         5F+D+wystj39BrhAoMUoOlPSHVVfohqFy32sVe2yiDEqSlPqEcEqF6DYQAGPOb0xylG7
         qYfoZb5uP6WVUXpeNfXLMEprYdWhqQ4xVVMqOmTtOzjN6necD3WBUi8MfNE7KBqgQxw4
         sWtqSU07+reOtUa158VnI3WfuVj7biwqiKXlFB2LLgmvFaYc2pQXskhR37SVNicLHUg7
         LACqT3zTBgTzgMWG2JRhU0pL6JgqwXAafbn9DORVAf6hrjrnbWYDqVfza5aeXFFCh+ic
         7WeA==
X-Forwarded-Encrypted: i=1; AJvYcCVFGcbHAP4Lwrn4rCalpV8YAPILW6jmpv0WU2lGTHp7KX38VB+e03V2Meugs3snV90HdODqnbXeVBHi5Y0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxpiLFZnkE1iGUsYmD50JvaG68bpTigj+b/X7pITKwFTbF0lRa
	eXV5oCqBhjsfUTGnQH8355f6nQ3ZXDHyCBEs2kS4PggSJn1ie3ld
X-Gm-Gg: ASbGncu/yXfQT37/I2Z6v9uZpG4sHb/x1dK2ipHWrhu3g8wQhr/fTmIifusqfqkViHG
	FvkPc+Dv63QqZTrRiwalN9DNqrPMbSOkiL/d82KeA5mZoOipomdNZAZ6i+vvuwtKZPMakhetMoL
	fubEKUWsuPAzBbcBf8EcD9oQR3O7mHIn/qYHovVD1lVnObcRPvanmhCrYfb6xnxAUUUhtyCGLUX
	W6KmX50cgY+jEj4q87o5cS7T43LB+taKvzy4hxRwVi5DVylZHzEAFey/3RJcyP2UBSFMJzywTKk
	hjSfmd5jlYDqtcFFJtB4XrvhF+WIi7NWM159kMgIvAfctEM6nZXTH/48lKabolR0Uq2Lhd48sq2
	7HE2iKPrxYA==
X-Google-Smtp-Source: AGHT+IF6Q/FlvS/W+sjXPXjml1B00qK8pAid4lpx6MIvDMx1ASAjlsu76O0mMJzHYcFbUWuElE70Eg==
X-Received: by 2002:a05:6512:3b25:b0:549:89ec:f6a9 with SMTP id 2adb3069b0e04-54b011cd797mr1152580e87.9.1743077765307;
        Thu, 27 Mar 2025 05:16:05 -0700 (PDT)
Received: from pc636 (host-90-233-221-122.mobileonline.telia.com. [90.233.221.122])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6508142sm2049380e87.172.2025.03.27.05.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:16:04 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 27 Mar 2025 13:16:01 +0100
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/11] Perf improvements for hugetlb and vmalloc on
 arm64
Message-ID: <Z-VBgcl9LJGlEzy2@pc636>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-1-ryan.roberts@arm.com>

On Tue, Mar 04, 2025 at 03:04:30PM +0000, Ryan Roberts wrote:
> Hi All,
> 
> This is v3 of a series to improve performance for hugetlb and vmalloc on arm64.
> Although some of these patches are core-mm, advice from Andrew was to go via the
> arm64 tree. Hopefully I can get some ACKs from mm folks.
> 
> The 2 key performance improvements are 1) enabling the use of contpte-mapped
> blocks in the vmalloc space when appropriate (which reduces TLB pressure). There
> were already hooks for this (used by powerpc) but they required some tidying and
> extending for arm64. And 2) batching up barriers when modifying the vmalloc
> address space for upto 30% reduction in time taken in vmalloc().
> 
> vmalloc() performance was measured using the test_vmalloc.ko module. Tested on
> Apple M2 and Ampere Altra. Each test had loop count set to 500000 and the whole
> test was repeated 10 times.
> 
I will have a look and review just give me some time :)

--
Uladzislau Rezki
