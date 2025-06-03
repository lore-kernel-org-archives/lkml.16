Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359691ABED9
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748976849; cv=none; b=jgtV9qf4rmHQDBc1EC7lb1z3l26l7dnqiIGUtKeX0zZhWnumU1NJU/xQINo/IM3CafJ0bHTTT762Z7KwK01XN0Uyc5Fd62yUExcuvdC1zPMITFsZqg8lgLWCqbd6kw3g5c5IMM4Z6t6aJsLGPwq1UpZv2zcYG8woZSSZTYQtprk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748976849; c=relaxed/simple;
	bh=pZ3ZwaLZ209JBKAyGGZ+1AMTMKq5tyl1JysOTnUaYwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M56AKt944GOYdN5X0RxNdrXlxznO3IBfA4jBkHACLawhFdrHbcYzQtM52zn17+s5HlKAoj3k4UEvjFby5l8TN6Db6kF7f1fsErTCG1FU5MruiP3TC6r1klzeeB0Z/MgKS5OzPpjf4xR3wvY1e651uHBiNrZ6vLr7ytT1T85AaOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=L9JAeVXj; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="L9JAeVXj"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-86d01686196so134300539f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1748976846; x=1749581646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rFTVfpNUc7fS3zkyfU8Pw6SPmbXFsjp6P3bnLkggN8g=;
        b=L9JAeVXjn72EkRZnHXAuccZJ5KzvNJa0OEYbAG055vEeAeUtX77MbnTE8MYIzPany0
         VQXKC+mHJBlB+amJkyEp9+SkUs3gqRvjU3Bx+z6BBB6oe0eyq8LBhqLrio0xAg8uCLKv
         vpqywKUB7BTzLLPknXhL/A76OA7CrJa1gxG7JCnV8STLy8Kp53PM7vW4xYLbRSsmLvde
         hH2Bv5UEMf3+5N93Lk5QhyZgtxyPMcQJfDx5ZiO2IfAXDEhpVfxAEHhweGhTQOPyDZ1f
         xCBCburqaGgmBaW/5GmJ1z6Qrg4SC+QF8xJuEGczZSK7Yc7wGZH9YlpHmSI7QV5mMd/d
         kUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748976846; x=1749581646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rFTVfpNUc7fS3zkyfU8Pw6SPmbXFsjp6P3bnLkggN8g=;
        b=uaMFUkPXL1dO1E32gn1gubnsWX805H18HRkw7pJ/qH0xcIr/qzW82Fh1OHsCU3aMgB
         fZ6MKqGmJEAf9L2JDklexrhBwUw5LMdKzBcvrTay1Nt++pAMjauKA+dO993xdEN0fOAv
         Xw/Faq5ceqdf8KfUa3GGqNcGIFfWb2tfvUIeM/6RCXsGZZKHsKD4xE6p5rqboiAZNvLa
         GAxt0DueF9j+wPZIWbImHD3uq3xTeCy4uGKWmVjThwLyM4hDui4/COz2cadJLglqoLoH
         McjAeK+/IK5bSkD49SPGsg3HCXu0D9xX0+8S7aasMPnGR3Tgsd7SJB11g9+kmPa6P0IS
         htAg==
X-Forwarded-Encrypted: i=1; AJvYcCWqcH60cpM4774ih1lu4AfC2Zfi1m1Duw/8Zu6P2xlb4e+4iXd9bafL4odrYXLBVH4f8l7SRwYn8raJKUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBPZvTpzj5xRRija0Ou0FWX090sJbMJ+gT6spTmHHBjlNGDQl6
	m+LCYdhECiCrAyqJCCNH5FF1iYQa3VmYWH8jDUJq0+zS/zR0rb0r1egvYxkng9zyxlpSmeZvKEd
	XZJlb
X-Gm-Gg: ASbGncsLMVU24SzI6ybpGXqwZd3F5AxD+z08VGebpXC3QNiGN6Z8s5+xcjPQOda994M
	JBtHFFBYhKjyTfmapmlI87Ys8j8ouVI6sf9u5M7bZBMRB5EAQ4Vz5jMOiIpVCkxGqc+mxmC1nhp
	KpRCdQw2fobedB0AcfG9iYQLNEvVGymcZlHtNSNYAh/3tfy9nOEa5QfP8jKqMGt78q4KkQD7F/J
	ipnaLKgS7Grut/FuyEEECjqvc7Iljv77LTtLQC9kMdS94/G+y9ebsjxzL+1+tCOppAu7scMf/bH
	qtw1CBNp0kIntd4DjDo+qSLF7BxOlZraaiwDOsch4khS7O1Bmj6F1Ouc+g==
X-Google-Smtp-Source: AGHT+IECn8DqhyeKaBwsMXGxtsp+ph0sLr9nbHhU6saT5C/qpcNRBwPNip1vQ6sSIT5fDLxqL4eJJA==
X-Received: by 2002:a05:6602:3787:b0:862:ba37:eb0e with SMTP id ca18e2360f4ac-8731c603be5mr9234739f.12.1748976846303;
        Tue, 03 Jun 2025 11:54:06 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdda4ddf96sm2257313173.95.2025.06.03.11.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 11:54:05 -0700 (PDT)
Message-ID: <e37d8707-8770-4f20-a04a-b77359c5bc32@kernel.dk>
Date: Tue, 3 Jun 2025 12:54:05 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] block: flip iter directions in
 blk_rq_integrity_map_user()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250603184752.1185676-1-csander@purestorage.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250603184752.1185676-1-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/25 12:47 PM, Caleb Sander Mateos wrote:
> blk_rq_integrity_map_user() creates the ubuf iter with ITER_DEST for
> write-direction operations and ITER_SOURCE for read-direction ones.
> This is backwards; writes use the user buffer as a source for metadata
> and reads use it as a destination. Switch to the rq_data_dir() helper,
> which maps writes to ITER_SOURCE (WRITE) and reads to ITER_DEST(READ).

Was going to ask "how did this ever work without splats", but looks like
a fairly recent change AND it's for integrity which isn't widely used.
But it does show a gap in testing for sure.

-- 
Jens Axboe
