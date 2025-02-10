Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9279D1A08A8
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173728; cv=none; b=sIFYt4uc9SqcujJe2FMu7pUxREyrZYdhpx9WGAEEOq6Y2uAWuCjS7gvVmBRcyeLzqvaviLMPJq+mEGndo2ot42JKKNdu1KqJ93QX0jTcCVclN3iTbytSwEMXhQbBjCQVHzpbbbzKpLO+QIV9/82qaXJaOyoVkgi+qkRTFUv6q40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173728; c=relaxed/simple;
	bh=JXjBA1xpDPpDczZQ3BE9qCN/9LPdj7wvx/8iGWhQr1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKNakXAikFza3Q8o/hNIQi6kKzOdnmVTyPzT2lWMhi7IqZjAc8WBvw4SRTFVsSLGqvWzjM13YfrpI99OWmw4TEiDbDFEAthLIMJqiYKYgOYfN19tLas0NXF/lIH+S1YV7eKLOU9rJ5r1rp6Gc0ov0A3+Nk2r0Gaox85nncK2d7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N8j+/cgu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N8j+/cgu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43934d6b155so7813235e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 23:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739173725; x=1739778525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JXjBA1xpDPpDczZQ3BE9qCN/9LPdj7wvx/8iGWhQr1M=;
        b=N8j+/cguqWVQcc7gp3PW52c8UzI2/8D0k4vJN8iQLT+j7sllrFGwbmXaO941DW6LQe
         1VfJt6/E5QZaQHt23VlU7tTaLRy27Jmd2h01sFmjG3wNmB4CpLz1gfj9Wnx3KtqlCi0A
         IAj3pX/bRVRQXIcQ0YGl5ZE22PcJO/B/WqrNq5nahBSsgAZ0ML+Q/KXSeMciQ6xVVLrb
         FVQ6xNyPy806UnNorxpKLbrjU2E1NWXVECLVJZYKtUmpMZxOric/oiIGG+38BoKSAfkk
         Ehlu9z0XbMwR6Ji5J0Lu3EY0dojKcaXL4VPT2+Nonsu7i5QbVZpVxyfpaBwLpNi/poO0
         pEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173725; x=1739778525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXjBA1xpDPpDczZQ3BE9qCN/9LPdj7wvx/8iGWhQr1M=;
        b=xG56d7G0duOZFY8u2h2i77Yswf6ey5GvmKM9+wA0C+pL0U/TOayomLPwd0vjwZW+bF
         3PcFUyEtWqGQRNKXlpJBHwRzV63UV0LRg3nE1nc5qYBalXBcPtGmYo6tUbg1RcQdwMpO
         /XDWANC0WOlMN1Gxs/KpWklHQPRnBZwGcBoJ67RurPUJbH+tV7kXr1fz7MB/K2ASl9Bz
         w9mDaNo1KX6x6pHO7j4E+hqJxwM2f4I/gvtrhcmpmME10N+jCYG93bQliZul9o5Dgwbm
         WPr21wGBJIshkrEZuFl2JprBzErYg/+JdbEI+2Ku38YQmooA6fzby/Pyl2ZgC/dcle53
         ANXg==
X-Forwarded-Encrypted: i=1; AJvYcCWxGf5Y8qm3/zQoviYp+0bPWjZjuUr1RFBWPlSam3M1jipA/9byC6UsGhzP0zjJV2aZuMZZW9yIKG2RVig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7d5zyKpRjElR491ZFEDBbTFq1DO5GRUEjqUxyKiJctuIw8pSy
	pnEAxhnMVgBV7dO8GdAoz/2/+VQ11cwq7eK/k+KDq5wNbqvmxw+GNnYZtZGSimtniJJBthG4Ezt
	d
X-Gm-Gg: ASbGncvSsaFvzQR7zeiV+HjfYt+DDQcio8sNU/sgb4gk13vHVJUiJF5vgz2t86YyF/b
	h53HW+LVyyMb5NJmFkYmzl5HBc8BJHPSFFbEf4PEdnJmdLh4EBJnWt+gPzwpbTT2bxDPcjT690X
	90Zt8qqq/Ywsci1tvb6ggAB1Lc4QGX8EsTZtsTjSqea5RC2nhJQSmg2vwj77cYuywjMWmh9TSiQ
	ex3V4gmQHz5SsJ69klr4YUnDy2W2BiAvkzMtSH7me194vFIoSmVEOLkPD9IgoVQkTMDtqujJSNb
	S0ZhtJ5lW32DFmuNDvT6hKiO
X-Google-Smtp-Source: AGHT+IHMwiCNyEXmnA6ZyUF8TtVzh6U1lMSqhTyKSU8emm2NylmNX2Cd24NUT4HkxU2TmNGE5wBubQ==
X-Received: by 2002:a05:600c:4444:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-43912d2288cmr130920945e9.9.1739173724861;
        Sun, 09 Feb 2025 23:48:44 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc88989b5sm9301026f8f.65.2025.02.09.23.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 23:48:44 -0800 (PST)
Message-ID: <87210c38-2e6d-4f14-8a4f-ea02288604fa@linaro.org>
Date: Mon, 10 Feb 2025 07:48:42 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad
 Input Page Program
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-2-linchengming884@gmail.com>
 <1c1da131-a7b1-4c2e-9866-d7833a134033@linaro.org>
 <CAAyq3Sb4WZtjq6-jYqHYympSxLgf=Oifcf2BmV+pVLJGc8=oYg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAAyq3Sb4WZtjq6-jYqHYympSxLgf=Oifcf2BmV+pVLJGc8=oYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/10/25 3:27 AM, Cheng Ming Lin wrote:
>> Also, if you touch all these flashes, will you please update them and
>> get rid of the stray flash info fields? I'm thinking of name, size, and
>> no_sfdp_flags.
> No problem. Would removing these stray flash info fields from the
> Macronix flash warrant a separate patch series, or should it be included
> with the current changes?

separate patch please, because removing those fields may introduce
regressions if SFDP data is not sane. You'll need to do the usual
mandatory tests when removing these fields too. But it's worth it,
you'll have cleaner code paths. Thanks!
