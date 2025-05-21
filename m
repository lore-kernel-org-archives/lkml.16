Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA6623D298;
	Wed, 21 May 2025 09:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819911; cv=none; b=ooXVzZLNykkPTPtykWHz0FLzGZgtRkD4xhsol6Ejo4VNKGk4aiVQ1O1vBesCXAHzUA96+4mJGCW5LQm5iDlbk0I0lz6wZ6L8NOGZKn8K+CcmdPhjbB+fmIj0qspv17yU4X04R6z4AxwQD2+VTLx2tpFWMaNyO8BL2npt/FvOLVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819911; c=relaxed/simple;
	bh=D9BFIHEKkseNz3jfp1CByNZ3m3tfd8g3CrLhlsqHYl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sg/sBSkdLhmvZ5EHJcE1Awx2H5Y0ivp3ocAiyRgI81HXF6Ui5SB9jk1wM0rHHaMe2fKsKlzlh1ymUQNPECXKjpVXRSUHuGHaMCV2Wsy0adA70ZVdNjzuqd7PdcFwvbiE92NAToGkgCOZkEAEWdig3B1k2sBDZ0IgG/JVbbi5HD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQTDySfu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQTDySfu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442fda876a6so45695665e9.0;
        Wed, 21 May 2025 02:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747819908; x=1748424708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P9vDFRwjGT9DH8ggj/eFnlYDn2aFQTm92hBOO4bpuSw=;
        b=EQTDySfueDa+hugxBg4nm6e3KA2CnBbNceWL/bscm5wochJHmfnV1a7AMXV/J0XnAq
         L8IOIDaaO4r7qDEEbJ6YdaFawMc3qnA9FCk6ttUB0FRHOVX37kzzwQLJPznuEdiOK73H
         DxTXUYq6d38vvWcrOy+sRGLmxeXfTD3pP8aDkyWt0kpvlMJjD50OXIriIly9IUTLwq4E
         7KSlgbDban49Ua6SWSVok9pedl3sqyL8MF6Q5vQosOzJTSfx0lNT28fIesKTijuB52kL
         Jv9Oiw6pi6GczChsXfy46BWttI5vhU+89prj3wpt4+/GiCygTfPl/cl6N9dYlei0+4HL
         WtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819908; x=1748424708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P9vDFRwjGT9DH8ggj/eFnlYDn2aFQTm92hBOO4bpuSw=;
        b=D9hc7DdyQmY1Dnz35G4Hlv00r19JQNXAy1HxaNXQmpn+1+Z7q4gROD53slXgbfpj7s
         hozRI9/QNnE4Wk5LZ2tAGiVhtOp2D/8D6al3tzPnXPRaYjx28dY9Rn9ecxcfywnQYene
         f/nB+7wEVCP8fAJwi9U/oJJRZznXkCuyAL8gJP1tZ6hUn0EPI4SMrpqIHkdQpof0BUUq
         eNItg8fJ7KAyfdP1hbqJ6Y9vwyOpEkLVOG2XsHNzFCVJM/tWUwMgtNwF+fbFmDQVsPZJ
         FJ7bB9qOYpLSMOdZCT0SJWDKYUBn7Vk5K++q7TvjLL2IJGP74YF8csW6uDijieWcwR/M
         NVYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3pt2r1jovpL0rUGnCozlxtT+adUAyuW1i/GOSt0aXQ+zGDKQMrfu1oqc8d5eiT2HbY0nbSR8qMiXY/u8e@vger.kernel.org, AJvYcCWZqpgCVwSN9IHyzpRz4NONB65FDs7mt8DROnXm7ObYf8B6vFyza6yPaDj7ZiSDwCWlkqYzsZtdLBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVpucO3xGAdGMvcO2DeAV/oEN5g0FnPBN0ZO944Sh/8Tidd6/l
	tM1bFuMoYWeHylfAtdWj9On1t2ps1bOLCkbuOjnaJJKrGTc1/mrwbIqn
X-Gm-Gg: ASbGncsll27fjkRUPhG+jdOlFvL4w++GjE7fw9x5q/pj4FBLMP5K0Dnx37bx1VYSj+J
	hO8qaJyPoXeoknKeSbIeRJFH2nkU/GXFU3tP0w30G3i/r2GuiejuhogicIswle/LZdgJHaoHI56
	XgAFTQr5RZE/fdoWv2mhFeQAoMBP5/xC049EA5Bm6Y4kFc8qZ2cC/ZhSyRfb84c7/tZMVbEusLO
	ciUFoDbWU4m+1gL9zEFBknYr1TyOihfDiuw7IZNRBrvode2dQDIbAPrk843D0AUvF1YIHSLyh7s
	zJ/ITeGEj2OEH0yNCUCjjTFGzV4sKfLQdclVd0aEctarfAp12SZB5aKapDo9Jr9nTgCnDhRCwCQ
	K2pl9y7dl+sgISy3bBJa2YrXpeaUrpWRv4T+7f9jUZPjow7ZO5zpp
X-Google-Smtp-Source: AGHT+IGLHDXCx2UnreLA/CFm4kgoBQRfWlWhp0M1orapr/8BkhOAb5uCLaMd6WGAMxPrcFwbP1RyDQ==
X-Received: by 2002:a05:600c:34cf:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-442fd664aa5mr162254105e9.23.1747819907397;
        Wed, 21 May 2025 02:31:47 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:f900:146f:2c4f:d96e:4241? ([2a02:6b6f:e750:f900:146f:2c4f:d96e:4241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f18251c7sm62768305e9.3.2025.05.21.02.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 02:31:46 -0700 (PDT)
Message-ID: <f7f54cd8-cc60-44ad-aab1-c1c082ed70f1@gmail.com>
Date: Wed, 21 May 2025 10:31:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] prctl: introduce PR_SET/GET_THP_POLICY
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
 baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, vbabka@suse.cz, jannh@google.com,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
 <p3lc5tuzpblwtikfodj5d5wjbpklqwg6oexn4xw3cdwspqwkmy@l7vhj72rjgsb>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <p3lc5tuzpblwtikfodj5d5wjbpklqwg6oexn4xw3cdwspqwkmy@l7vhj72rjgsb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21/05/2025 03:33, Liam R. Howlett wrote:
> * Usama Arif <usamaarif642@gmail.com> [250519 18:34]:
>> This series allows to change the THP policy of a process, according to the
>> value set in arg2, all of which will be inherited during fork+exec:
>> - PR_DEFAULT_MADV_HUGEPAGE: This will set VM_HUGEPAGE and clear VM_NOHUGEPAGE
>>   for the default VMA flags. It will also iterate through every VMA in the
>>   process and call hugepage_madvise on it, with MADV_HUGEPAGE policy.
>>   This effectively allows setting MADV_HUGEPAGE on the entire process.
>>   In an environment where different types of workloads are run on the
>>   same machine, this will allow workloads that benefit from always having
>>   hugepages to do so, without regressing those that don't.
>> - PR_DEFAULT_MADV_NOHUGEPAGE: This will set VM_NOHUGEPAGE and clear VM_HUGEPAGE
>>   for the default VMA flags. It will also iterate through every VMA in the
>>   process and call hugepage_madvise on it, with MADV_NOHUGEPAGE policy.
>>   This effectively allows setting MADV_NOHUGEPAGE on the entire process.
>>   In an environment where different types of workloads are run on the
>>   same machine,this will allow workloads that benefit from having
>>   hugepages on an madvise basis only to do so, without regressing those
>>   that benefit from having hugepages always.
>> - PR_THP_POLICY_SYSTEM: This will reset (clear) both VM_HUGEPAGE and
>>   VM_NOHUGEPAGE process for the default flags.
>>
> 
> Subject seems outdated now?  PR_DEFAULT_ vs PR_SET/GET_THP ?

No its not.

prctl takes 5 args, the first 2 are relevant here.

The first arg is to decide the op. This series introduces 2 ops. PR_SET_THP_POLICY
and PR_GET_THP_POLICY to set and get the policy. This is the subject.

The 2nd arg describes the policies: PR_DEFAULT_MADV_HUGEPAGE, PR_DEFAULT_MADV_NOHUGEPAGE
and PR_THP_POLICY_SYSTEM.

The subject is correct.

> 
> On that note, doesn't it make sense to change the default mm flag under
> PR_SET_MM?  PR_SET_MM_FLAG maybe?

I don't think thats the right approach. PR_SET_MM is used to modify kernel
memory map descriptor fields. Thats not what we are doing here.

I am not sure how the usecase in this series fits at all in the below 
switch statement for PR_SET_MM:

	switch (opt) {
	case PR_SET_MM_START_CODE:
		prctl_map.start_code = addr;
		break;
	case PR_SET_MM_END_CODE:
		prctl_map.end_code = addr;
		break;
	case PR_SET_MM_START_DATA:
		prctl_map.start_data = addr;
		break;
	case PR_SET_MM_END_DATA:
		prctl_map.end_data = addr;
		break;
	case PR_SET_MM_START_STACK:
		prctl_map.start_stack = addr;
		break;
	case PR_SET_MM_START_BRK:
		prctl_map.start_brk = addr;
		break;
	case PR_SET_MM_BRK:
		prctl_map.brk = addr;
		break;
	case PR_SET_MM_ARG_START:
		prctl_map.arg_start = addr;
		break;
	case PR_SET_MM_ARG_END:
		prctl_map.arg_end = addr;
		break;
	case PR_SET_MM_ENV_START:
		prctl_map.env_start = addr;
		break;
	case PR_SET_MM_ENV_END:
		prctl_map.env_end = addr;
		break;
	default:
		goto out;
	}


> 
> Thanks,
> Liam

