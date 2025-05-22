Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B574025D53F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 21:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747950927; cv=none; b=u3FPYWEeRPjGCmD+ROFCdnpPe+TF6vMioxtPAHV+AAJmuc5x1b4ptJLQjC6Dk8Xw83cB9SUu2dIHPXagODV0npAIKnEROUqKExaVSwV+AxLDNmnRgBfm7S8rXpLrBJe2MqlI3pwkEx89aEKrHCrM6mjLiExfGUPM83h8Uk60M8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747950927; c=relaxed/simple;
	bh=XmeeadVd6Z+Q4b8dcysuWdnWYCDg66vF0EY5hAY70Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvY6p7YGzfa2JWDwCUgsi9/R4RxbxqlSbMoZxRqrgz3Sir41nb0GHgaLvSfrUoHjfmTbNPIfwzjB++1wHfD6qU25xgc0cFsnkyJiTvYe4yIHKB0ERKzsX0cPrQ6+uHEinytjx/K2n0GtynbG55+xBZKRkZ2tUUg/k5iuSW43WJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Vd7ThP8u; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Vd7ThP8u"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3dc6f653152so15997355ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747950925; x=1748555725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsNTc721PK66RA8sSI/Jw77VKtdJQEKr1LL6A2sC2Jw=;
        b=Vd7ThP8u0CyqKnx8DDFovRIgsCsOSvWJfQZzX6fLg/d5Ce6GntXS+/eT8VG/zA8K8g
         W9o9skbnzAG97r16QcM0RAnUoD+Pn0XFmMyI0cud7bTwg4zmSRpiek6+WLiI2B+moSMN
         aj2yi5qn3vO7uRCRnIBYyTYXaUWB/o2qFlbJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747950925; x=1748555725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsNTc721PK66RA8sSI/Jw77VKtdJQEKr1LL6A2sC2Jw=;
        b=smVnib+rGr4btPmisBQbmA8WnSrR2IkPOqgINw4Jw3DTTH3RTWmVEyTvwN1Ez75KIn
         rc8TAe3Q/7LL72XnKuOHT6y/a4o2V5Sor1nGggUt0CmMI1ohNHLdkp8YerRaFNUD7gQC
         Kj/nFkqlk6pBFT758MwkhW+sjJjED2aJOh1pQAGb9o97vl0cm3BaldpLr4XY4VmYN9+M
         2hE42qEWPfhyZHakziEjvHnMvAmuHMLTuTcr4I7M5Ue6VMuzCLclCCmmK7xtX0bzz9f0
         mQcLXu6L4LisJB4GMTUw07dbXOj0PQkCQVMQpHa/nNHl32RUiXAEMy23OekSMKQ6xJ3G
         qB7g==
X-Gm-Message-State: AOJu0YwvGTBxEoWHxt6eZu/YivYwhsk5UcCF7dzkYQp3XsyGnu4QWNeb
	Uo7h1zXJSscSk0SWEArm08TQpo94ViXxhr9PP8aUmH9qxjZ8rG2EgkURu8hkqB8DSSo=
X-Gm-Gg: ASbGnctFLk4Lhx8t+4de95JWMCZygef9ICBSyPiJSdsdXepIHJwrQ/SnJfrwsqB2rve
	B8sImJAR0oI4lvWfcq7efmmP1a1lnFJIOSDP2U+K8BDRXyk6dsYhWhzo9RKNXRGrD4zZ3ewjQgX
	EeMEL06GyvPQh6yWMwDagktWPqPrH4OMy7t0bkGO51hji7N5vhS7BEgi+CnO9AQ440zqd6Npy8c
	CY+ka9q0efJW63ld76HiWqVMVIrHU2jM3UG9l08vuDUIVHz69C0lTvphMJX9AIC/7eocE/xTuX0
	h9LRh/yhxOwtVzdMZVfxKwbR8VSMnWN0bIy+p9YdhOdqIyeQy5+2DCoINpcqkQ==
X-Google-Smtp-Source: AGHT+IGTZWRdRAPzUj9NunbARRKcbmYiwV5p5BdqQMJqFvX9jNL1fBlhQhdNQn649bTrCNVyXMQ+HQ==
X-Received: by 2002:a05:6e02:1569:b0:3dc:8a5f:7cbf with SMTP id e9e14a558f8ab-3dc9323abf9mr8551935ab.1.1747950924712;
        Thu, 22 May 2025 14:55:24 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc899a580asm8532895ab.9.2025.05.22.14.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:55:24 -0700 (PDT)
Message-ID: <d51263a0-50df-490c-84c9-ebd0ac49d7d1@linuxfoundation.org>
Date: Thu, 22 May 2025 15:55:23 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: [PATCH] selftests : timers : valid-adjtimex.c : Fixed style
 checks
To: rujra <braker.noob.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <CAG+54DbGpNn-Ps=djpsUy+K-6V+eoNcMbTcJoW8W5upz2OKn+g@mail.gmail.com>
 <CAG+54DZ1wDTdWPQSw01G4YgTdihezQ966LGa6ttmBgT2D2gTyg@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAG+54DZ1wDTdWPQSw01G4YgTdihezQ966LGa6ttmBgT2D2gTyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/25 19:44, rujra wrote:
> fixed style checks according to Linux Kernel Coding Style standards.

Fixes

> 
> 
> 1 : fixed alignment of parenthesis.
> LOG : CHECK: Alignment should match open parenthesis
> +                       printf("ERROR: out of range value %ld actually set!\n",
> +                                       tx.freq);
> 
> 2 : fixed alignment of parenthesis.
> LOG : CHECK: Alignment should match open parenthesis
> +                               printf("Error: No failure on invalid
> ADJ_FREQUENCY %ld\n",
> +                                       invalid_freq[i]);
> 
> 3 : fixed line length of 106 to 100 and less.
> LOG :  CHECK: line length of 106 exceeds 100 columns
> +               printf("Invalid (sec: %ld  usec: %ld) did not fail! ",
> tmx.time.tv_sec, tmx.time.tv_usec);

Please refer to a few logs for examples on how to write change logs.
Also check kernel documentation on submitting patches.

thanks,
-- Shuah
