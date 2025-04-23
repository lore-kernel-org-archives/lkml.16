Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC812522B9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419738; cv=none; b=Lc82Kef4H9PfVs/D6YrKSYa3goEQKSNLzHI0BBl94gswLMHamy5Gj9vDPmHHQpL9l2cI8Dqg0vKhMJBvHv2XINPiUqT7nvnryoCH321emmqrwt7+e83RBVtqQbsrsjg5m3CHm6y3F36JLHVQUlBRMGXzjkW+7iRH7adtX2UP0oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419738; c=relaxed/simple;
	bh=nIxaNcf672B7BSGcnupZqGaWJgpILObY6cKHqizWiH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bbEk3uIN8Xo76EopF2gNl7MJ4FynwvKS5nTAquFTt936jEysadwZWRlF2Id2X62wc95reUemNoBwBnMIMp+g5rAW1IZI4K799RsS+gtmVdlna575Qst/vc7Qb0WJzyBEXFPwZDZI8jGDY9JASGg2X1swp6oHeswqYQoYINbzSSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0iTAgQt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0iTAgQt"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso70275825e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745419734; x=1746024534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U40sY2uDKd5zyA1HQw2VSyNbPCI1Z9a/feni+xQEoJo=;
        b=D0iTAgQtwkhOpGkvnehrYuTYLMsn5sJGO93gdKFfXaaiwBb70KYDauXc7mn+sGGgHt
         K3kKcAP3idB6FXk+iOiKLDEDr3Ije85y/UFuJduYA282rEidRGwRG7UhPf4UPGzzhVZZ
         AhGPfgnq96ZrmMBwQac91b5kFgC5pyq6A29Z95ZghyoOpmV1YuCqemglPqeHDoyPZtcK
         Z53O1gVEF/Y/lqpgk37Ccl8qx70BYFkEW8rquREs2Ymx7f/lh1v/iacUM/r+hp6BmI0U
         gYzEpcHG5ufkM883d41L7vipCxrW0NXIKdLshaJnDtDiigNJZ4ecvX2C7VDyQfccZmTb
         cdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745419734; x=1746024534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U40sY2uDKd5zyA1HQw2VSyNbPCI1Z9a/feni+xQEoJo=;
        b=tPaPLt1akjpm1MraOJ2oqcvg9DWk3BQwdUP6NDGfRT6NmcRWelbI9lFNjiuZUinz8R
         8u/4MOEiUxU96+GRqV0u2nXhbv348X6WAGdbx8PpvFIhBri0wGjwz7svHuG5DDB1+nbS
         wR3Hq4mZGN9joKyFQR3XUKjDul6ZWStfRD3LgyVVP89RFq1IYjAbwL8gWI+tA6OeRezX
         CnWttdB/j5UvpPftsQtimAFUEj7QhU+/1RE+PP6WRpes/BdODu7k5tJAniPP4HoCay7g
         XPl9ArNK+siLzN/QisNWe1LObaXglJFWbrxFZd/iE61un3z2keL0wi/nya+S6ztCTD1P
         j2EQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8XJj8/V2C+RsjxkJY0p5bsQ6ln1h5wteuTh3SqIxSoOSkObYQYK/gTnr4ePsbTU7vi+IzO0oTF7dnguo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCYn9zH3qYCBtXMIVvTEwMCpH7UsTJbZxyh/C3gQ36qkbg3Epz
	qMqDZI+qu8zUSpuwjz1UvZcV3RzaFZ4GjAnpfOr89M185MXPffgM
X-Gm-Gg: ASbGncsnzeGISa4rgfAqI0Qv3PpqHppP97eQuUNS6vk0sS8IXZ+zVC9g/A5bSKQM1En
	sguptNWxkw3vboMxduaHm4+nVy/OsvO0ZE0UtBOwLRujX4KnEF1xabSQi9J+OI9rIcsM7lp7cgU
	Kr+p1FQXooX2AnEYMw2tNyxLZ2kuiKpmkO866qICYP2IteM4wZMqX/inATKNVvl0XA78dPgAX0N
	Cmncj49RKGJtqzJoBTnzFEkiaga44DOxMi8cS8zfwklGUca12zpS2UC+Rer1clD71kCJulSuJF8
	80wtkkxQnN9VZCxumEd56u5Jmkk3T8vZp+xkQ8kkSfuZsdsdrH0XSUGt28PL/0uH4p4YNUP/arC
	yHvn80EF1QsFSv/0133Bqiw==
X-Google-Smtp-Source: AGHT+IGD09CKrm4TLFkOE3DHOpjoorPdju1PSsQrQJIXZsv/BX5Okilz+aUMdimUZnYgR81Op3U6CA==
X-Received: by 2002:a05:600c:11:b0:43c:f575:e305 with SMTP id 5b1f17b1804b1-4406d846ba6mr108270405e9.8.1745419733416;
        Wed, 23 Apr 2025 07:48:53 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bf28:2e00:ff96:2dac:a39:3e10? ([2a01:4b00:bf28:2e00:ff96:2dac:a39:3e10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433191sm19319164f8f.31.2025.04.23.07.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 07:48:53 -0700 (PDT)
Message-ID: <ccfc1eeb-8bd1-41f9-9146-c8752723ccad@gmail.com>
Date: Wed, 23 Apr 2025 15:48:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] maccess: fix strncpy_from_user_nofault empty string
 handling
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 mhiramat@kernel.org, andrii@kernel.org, kernel-team@meta.com,
 linux-kernel@vger.kernel.org, Mykyta Yatsenko <yatsenko@meta.com>,
 Kees Cook <keescook@chromium.org>
References: <20250422131449.57177-1-mykyta.yatsenko5@gmail.com>
 <20250422172011.feb243d2f7478c0e7109b74c@linux-foundation.org>
 <08e3ec4c-4401-403e-9d81-5ee0abebba5c@gmail.com>
 <20250423095941.1cab813f@gandalf.local.home>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20250423095941.1cab813f@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/25 14:59, Steven Rostedt wrote:
> On Wed, 23 Apr 2025 12:37:46 +0100
> Mykyta Yatsenko <mykyta.yatsenko5@gmail.com> wrote:
>
>>> Does this fix any known runtime issue?  If so, please fully describe this?
>> Not that I'm aware of. The issue could be found when trying to copy empty
>> user space string in BPF program (and relying on return value).There are
>> some usage of
>> `strncpy_from_user_nofault` in tracing subsystem, but I'm not sure how to
>> hit those code paths.
>>>   
> Although your patch found a bug in the tracing subsystem, this wasn't the
> cause. It only cared if the read faulted or not. It was incorrectly
> checking for zero as non fault when in reality, it needed to check >= 0.
>
> With that fixed, it should work the same with or without this patch.
>
> -- Steve
Sure, I had in mind usages from trace_probe_kernel.h,
namely fetch_store_string_user, fetch_store_string, having a second look,
it appears these only used in trace_events_synth.c, and we are good there.
