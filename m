Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87E41547D8
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 19:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738698334; cv=none; b=D0z5ObwcjC+Z4kdGTaFzADJ/f/BeGedSKJV2NmjIU3zJOFAx+tPQfDPqz6kZhfIGSLfPKvQW5j8fJlSkniVVywLFAq/5Pb3NVjUBtsKXzfNeCFGsYe2aKmI8a/e7/q3jJsx9yXhuJ84BpPLNdQ7lDa/rYu5UG8+lDb7651umw5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738698334; c=relaxed/simple;
	bh=AWm6SRoVJLrztDNtraR6Ywyc1Zgy0EqSsNUFbVwwIds=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ateB2kSJf7ccQNZdBxshEXiYqAaM5g6+INtQ7c4BU406xro/lGnRIBK2QDZBDU91aCqJPPrZDQ2Avnd/uEWb5QuZJ47/R4MkSnBpGJROUBx0CCtQo3NTXaiPHohFk3MZidmocdzCzerCPWW0Qj34nM/kOCk3Dzete7wYReoBUjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Rsv/Sp/z; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Rsv/Sp/z"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-852050432a8so4052339f.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 11:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738698331; x=1739303131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kCaLJAqQDbtyXBCxltyHzUvfbctOseKjqFt2LzfHmYo=;
        b=Rsv/Sp/zyNcBldxh2z7QmSotGAaqkGe+7vgO5g9/Vix2qEGMnO533jj0biboo+/uRd
         5y/+E3414Sv0Gc/rsuH06WKLIW6CFvufEmeoIok5lLLBagcMOp3NxIs9qXSbEBhUuYaQ
         2g42LUzeRdGe08omi8yucBcEWcwuCU+zFtEYHL8dQQhjBpGf+06Gte1fbccLVBZZf1JZ
         GUuOWTgwav2z9BT2iZSi8wxTPej7J1+VY2Y7MzlZPNXevnltIw9UrRikO8RLmUhdsdy8
         9s3LQjYTua4jpU+WnaU4gZccosp20jlmxZDMtXv5a0IlTgPfhlmtYtc8Pd3ptHBZwo1x
         e3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698331; x=1739303131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCaLJAqQDbtyXBCxltyHzUvfbctOseKjqFt2LzfHmYo=;
        b=qPEQcAn3KoPkcAd59RceeeldF8+hz3kSwGWM4tUUc8P1k4DKJWG7w6fZlHo6Sg/Kt2
         qsbVr2OZhmFUWW0M1qkjV2b1RE7XwTRIowJ1YehtV9c10sFRKU+P6e2HjvwC2FLDJZUV
         +OjFYxYTFokaG6a7R2wzS0vHOpmqQZf7V8qMOjgiLdw6W9C2fioTx9fwsS4jyiddSUCN
         ygy4bWRmkoAb0ngI7OOzXanw4sbZ26xQ9m9GXs5gZl5S/svcTCTo4Xylq9QDuKCfdye4
         SuqcIO5CttEXFzJnSMos1ll4AtndVCd31D+nTBqOj+wM62Ji9cYRjpP2ggu838UdZEWI
         1SOg==
X-Forwarded-Encrypted: i=1; AJvYcCWYBIdEiRsUJKscD68Vp/dYFWsoo0/xuejDjq1CwLCpOdgOgDbRUwxhlCKZ3L5VdAOJrpPgpfqQZH7PXEg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv3yzjrhRmVmwFhgnJwhX4YVYKMANWcrUD/vt6pQ3QaScojmfK
	yVtnngVwBj60XJvxo2ykDn9aym0KGYOh5FicxU2d3iZmJYjm6NrPHf8xV5hro0A=
X-Gm-Gg: ASbGncut/Pz/EpChTSI8UwBK/VCQEYOdEgTYokbica+kV6EgZ70wSUu0drC28m5UE+6
	7/I5NJPjh890z9jpGPknmPJCAhiICFmHFop4NcpE2IacxngtAa/JaZx3JtXMYS2ILhRhn7ZOdmS
	FqoPb2sZvZ/mxgOWQIb3CSr2C3hrnYCFYqBeqS0zILPI6oBmUpZ5YH7U2pLCO1NJi0tU67lZAYS
	EuWI2WDha68wjY6A+TYCIanoMkwqEhe/ABbnOHxEsVY+6p6cz2h9g45YuLUpBINYknIOL41DAjZ
	MPMvnH163N8=
X-Google-Smtp-Source: AGHT+IGKMGtyC0z1dZUkfQ6BO3AVDd1waxB6CoIvaCTe3UQZScJQnLt8679sVZwJEgQU+3Y/5hNPtA==
X-Received: by 2002:a5e:9747:0:b0:84a:7a0d:cc67 with SMTP id ca18e2360f4ac-854de0af199mr363785239f.8.1738698330691;
        Tue, 04 Feb 2025 11:45:30 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746c0db2sm2821658173.115.2025.02.04.11.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 11:45:29 -0800 (PST)
Message-ID: <7d927254-6e75-43c3-be17-6e449395ff0d@kernel.dk>
Date: Tue, 4 Feb 2025 12:45:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] io_uring: cache io_kiocb->flags in variable
To: Pavel Begunkov <asml.silence@gmail.com>,
 Max Kellermann <max.kellermann@ionos.com>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250128133927.3989681-1-max.kellermann@ionos.com>
 <20250128133927.3989681-8-max.kellermann@ionos.com>
 <a7733b94-c7c0-4e95-975d-e45562d54f3f@gmail.com>
 <fcf5df70-d709-4bec-b4ce-aa833d1d4da2@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <fcf5df70-d709-4bec-b4ce-aa833d1d4da2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/4/25 5:07 AM, Pavel Begunkov wrote:
> On 1/29/25 19:11, Pavel Begunkov wrote:
>> On 1/28/25 13:39, Max Kellermann wrote:
>>> This eliminates several redundant reads, some of which probably cannot
>>> be optimized away by the compiler.
>>
>> Let's not, it hurts readability with no clear benefits. In most cases
>> the compiler will be able to optimise it just where it matters, and
>> in cold paths we're comparing the overhead of reading a cached variable
>> with taking locks and doing indirect calls, and even then it'd likely
>> need to be saved onto the stack and loaded back.
>>
>> The only place where it might be worth it is io_issue_sqe(), and
>> even then I'd doubt it.
> 
> Jens, I'd suggest to drop it out of the tree, for the reasons above.

Yep I'll drop it, thanks.

-- 
Jens Axboe

