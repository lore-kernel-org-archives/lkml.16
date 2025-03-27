Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9719827455
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743057813; cv=none; b=QicAczCHWqGuYu2F7mit8Cchlcwb0RfmRfyd3lCmeb7aJM24CPnRZjMM2xf8K5S3rn3WyTNxaK89GqrVrGzy+nK+TgmlW9Z1k0ZCGYQXeKdQYefi4zpX6n7pyT682Sfpp3LlAIw/fjvg5ddxa0KwsBkfSO4sb/1LwKit7/DSNl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743057813; c=relaxed/simple;
	bh=n66ybPgUp9VVv9SCPEE/AWLxGlIns+SPIQDz3xX2DrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCnG+iEOXRbrkUnymXFKdHYM4PlkR2XPcarUxGxT7KDHXGLRUS9PTzTIV4Wnm7mkLnKovIFzZpgUj3TFJq/5Z5VLa0sk7VjCXq9eHv4+ToY8P5ahFb0QIRRR8OtXNiMfUa2MZFfZvIz+CpYCHUBFW5+kUeYNQEyWtxU3NB4wV7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Fv0oQY6M; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Fv0oQY6M"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394944f161so842505e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 23:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743057810; x=1743662610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OYQRSLDDu+9ncKrO0EiMnXhUcVzXwRWAsy/yjivhkeY=;
        b=Fv0oQY6MfOYO0BM4jEWedguN1GIXw7kOXy/uUE+YULsGq4yUBRc1/RDWzXW+km8yGl
         v1rA5kw8bz1euS75OoREt9N+LOMFZUJq4yld0CdBcySWwxfofyRbEM/oR4J1xsFsUc6M
         3TCgJnrzImNkuy3ENBoMdiW5VU8h6hDGxcjUKdIZp0zYPNyK6e/P5AP5cJdURQfaF2KK
         4/P68NnXdXZu7SMLNpTPVZfE7T1p4VJDLJqdY1S+fvkuUUA8zkAFvwQ4EU95XFZ8lXgV
         SKmQengc5MvikqoAa7kwL/PGQ3LMMAfUhVTUDHMrdrrorlljSIai+q8cmAcUB6EQHsu2
         pXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743057810; x=1743662610;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OYQRSLDDu+9ncKrO0EiMnXhUcVzXwRWAsy/yjivhkeY=;
        b=ddEBNGjYecbmCCXueMDm4je4hVdEVvIQo0JxdPSDSpejidYiToHClh9KhXXsBUrKux
         FpoTjCTJ62mH1NEwPpplf9HTHuPDA+6J1c22k+aiY2q/qpDZwah9dQ9nt/bC5xldQBoe
         FdRixd2kjS+aUcWMf+DYi96YZldQIFW4q+VCih6lRW/93nuJQ9UZoF8HVG437Ga/Bp7u
         E/eJsuUtUo6+np0nG8qzTnXq5TQAuF3F/bUK3lAirR73ITTY1UIoALQ6YHaCwOoc8MBh
         0UotU40hOq/eBo7smnC0FUsjk67hQhzGDnhjqU/an8qPXSkmdMySPgPl6vbZHNHJ4gCd
         SPzg==
X-Forwarded-Encrypted: i=1; AJvYcCXL/WhWdkRSG07vnVwJV3EGrL8ftqqreo8b+AaV3ibTXptNHiOtaoecUMielLgIYk4+F5vDWvDUTro7H7M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsc9GeXcvLCu5GtnTS2yN0qyiA+QJbKLdRhlHlrtkB0YpaT6Hf
	fRNXX3sTR0lYB7Sj17dq7D8FDufwqKgGYnU7yyRW486/gCaZkO8fu++MiaM0k7o=
X-Gm-Gg: ASbGncvNDaYwa1IjpS0Zezk1R9uaNoSoqymldN3V4rk3/ux/6r26k19g2XJTt1qHV1v
	alxinmmKjOv+v8YMNtIKmtRNInt9JixRRfPF/pEKoUd9TtsRXQPXM7MJbZxcMuWsoI0qc8m6Kfx
	EGU95mToHXxGL5Ccm3R8r0VBljgeKxgdrWALhzaipDL6nmOHXyu8hDwBy9r8XKSdQcjDXE9iKbz
	beoJeYWkFKMvBOqIeYP3iDFYkyZ9VL7U1Znmp11HVyKDv76YA35tD0x1w8wKTuQQQI8npPCFx8t
	j71bEwc8XSTEV16epacnoarng6QPkrjRVfziokBYVqWwIs4r5U52QcCLNGatdQ==
X-Google-Smtp-Source: AGHT+IG7uoZZ4cy3JAa+yLXGMZkwdOi8KblqHkzfjjsnlqCUlO76I+Ifh2Yz3Zl2jw/WLzCs0lckWA==
X-Received: by 2002:a5d:47c3:0:b0:382:4e71:1a12 with SMTP id ffacd0b85a97d-39ad2ada142mr343227f8f.1.1743057809776;
        Wed, 26 Mar 2025 23:43:29 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4d5f5sm121269285ad.79.2025.03.26.23.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 23:43:29 -0700 (PDT)
Message-ID: <faef812f-0adc-4a46-951a-5453927c2819@suse.com>
Date: Thu, 27 Mar 2025 14:43:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: fixing global bitmap allocating failure for
 discontig type
To: joseph.qi@linux.alibaba.com
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 gautham.ananthakrishna@oracle.com
References: <20250327062209.19201-1-heming.zhao@suse.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <20250327062209.19201-1-heming.zhao@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello list,

I wrote this patch based on Gautham's patch code logic. Because I lack a
test script to verify this patch, this patch only passes compilation.

btw, another topic (unrelated to this bug) is that ocfs2-test fails to run
on the latest Linux distributions (e.g., openSUSE Tumbleweed). I am focusing
on fixing this problem, but it requires some time. I have created a personal
repository [1]. Once I finish the verification process for ocfs2-test, I will
submit a PR to the upstream GitHub repository [2] (the suse-py3 branch).

[1]: https://build.opensuse.org/package/show/home:hmzhao:branches:network:ha-clustering:Factory/ocfs2-test
[2]: https://github.com/markfasheh/ocfs2-test

- Heming

On 3/27/25 14:22, Heming Zhao wrote:
> The commit 4eb7b93e0310 ("ocfs2: improve write IO performance when
> fragmentation is high") introduced a regression. In the discontiguous
> extent allocation case, ocfs2_cluster_group_search() is comparing with
> the wrong target length, which causes allocation failure.
> 
> Call stack:
> ocfs2_mkdir()
>   ocfs2_reserve_new_inode()
>    ocfs2_reserve_suballoc_bits()
>     ocfs2_block_group_alloc()
>      ocfs2_block_group_alloc_discontig()
>       __ocfs2_claim_clusters()
>        ocfs2_claim_suballoc_bits()
>         ocfs2_search_chain()
>          ocfs2_cluster_group_search()
> 
> Reported-by: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
> Fixes: 4eb7b93e0310 ("ocfs2: improve write IO performance when fragmentation is high")
> Signed-off-by: Heming Zhao <heming.zhao@suse.com>
> ---
>   fs/ocfs2/suballoc.c | 14 +++++++++++---
>   fs/ocfs2/suballoc.h |  1 +
>   2 files changed, 12 insertions(+), 3 deletions(-)
>
