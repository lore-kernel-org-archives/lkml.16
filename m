Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C7225A2C5
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 21:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747950747; cv=none; b=T7iguv7wYP6PdBCdREj4QgtNO0QEvH53ALbh0o7LNIw2esf6gjPj46+YUsgy7whIzfO7w89yN9u+VLkzhRUzITr3r3SpFvlBO8VhiHpg4fgHTD4O6wpNV+bgoBFKmBUTYEec0O8StsoShLecCAp/tYnx/gRtVwst5LO1MRyt13Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747950747; c=relaxed/simple;
	bh=h3gxn9cuXoddDKHE83elseHrpfGuY2/pgmGAoap5d/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HS4EbV4+zr8wScyHNf9aawgjSDvnrh+KIwx5rhooVPxlK+c1XCQ3lf6ZAn15N8ijf3lcYZTHCETlXfvpYJrukxlrGPVfWF1QnVGV2FdbQzHbBmkPKZJ2paZfiJEGRdqdQf2dTMH/QkjVcMA8Ke5VDVdULEu8GDb0kDixGjfKKFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Mhjb2SQV; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Mhjb2SQV"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3da8e1259dfso61597705ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747950744; x=1748555544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3gxn9cuXoddDKHE83elseHrpfGuY2/pgmGAoap5d/8=;
        b=Mhjb2SQVX3bac/4Vqm0LaturAOnByhS4eol6tJIAV/nrLWV5x51Fs8dBj2ird/PMjP
         aj44G5thvQUXI5Ek2xKom7BHNvY3xcPCgS3QYUHQ6N/1fG4kpmzlt5TVSxV3xcKj2fE7
         yeXYaHonkl2TsGkGMPYCWcPB/42KD6hPyptFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747950744; x=1748555544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3gxn9cuXoddDKHE83elseHrpfGuY2/pgmGAoap5d/8=;
        b=atlJTC5USyn+/H9dsHJA4G/1ZcJQQND/k+bvDX0dWUHWkJWrBEosFPEih6QWYRWvwW
         1g2MrA9xRstOHcARck6EvA6f3NcPJECnO0yfaLSHMNy0J9EiC+ivlQNe4/gACsBkRmG/
         wRGA5DEHT9fjZZ1nZrlBdaSDb4w/TYglXKdnWuVbARz7eGbuUsi9kBo2OvGue/c98Lew
         BTvXOSUsWTZFk3rK77P8dtPVsZz4o0ysq3swFGhRTTI1JGq4PyI8brgfhDLe1oM9oNsj
         CrSgGyCP1co7uQb+1L1EwIVTm1TuDqu9NfvxqL7UAt9L1s5swAdAATw6o9sVkFeTynS7
         50tA==
X-Forwarded-Encrypted: i=1; AJvYcCUyQi8abPxF5tmiHKSC2vF6ocKKWN4NlCRl4KQjvgvKY2huuoLZBJHGKrbSKMju/dJmPmxbBivCDJTq8dE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaxjOZbiBckjKrWMrjfP5eil0tnF+oDoR1fIoHoLGiFMJh7C30
	WqaFnyuogloPNwNYz1KCSAeVgxx8j+PDEesJwQbiNM/oZ8cq67/S0ml69K/UUK9pPXp86kzp7+g
	m6DKI
X-Gm-Gg: ASbGncvTWRgaTqfikggEisegcO+pttsrk0yleWyB5XQCnWpbW+ik98gIrYdyTDGsIMa
	trJBD96cneUdEa6vaeGOC23uWi7T8gL0ytm8khFJSOwf2n5TIljuCVOLW4XRPkG4rbu0uD7TwPT
	lLXYuUF0xY11pbs31AnuWklKxLp6BTXQ2RkQR4MnuA9L1VgaZaAtlJ1TNn938JDR8q7EIHEBGlV
	5KpiavorVrRcW3eeAZ8ARg3wgSlSMLxobcmGbkQqlXcsrVvlSYJZ+XffjnLsAWKSkm4kV/QfPq9
	uLL5vOaa9IwqedbYv+E9EPPI8Ne8sw2tEPQ1VrWSsVsrYKJvBXkyz5kyJfk1kg==
X-Google-Smtp-Source: AGHT+IGDkDoKX26+mZpUKHL9ezkJ1Wm3f/pt0o5Qwk3JRyWzB8+ExKX2tHk3jPeY0mXqaoYvPkV82A==
X-Received: by 2002:a05:6e02:380c:b0:3dc:7df8:c822 with SMTP id e9e14a558f8ab-3dc7df8cf18mr116514675ab.14.1747950744575;
        Thu, 22 May 2025 14:52:24 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db8444924bsm37442605ab.72.2025.05.22.14.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:52:24 -0700 (PDT)
Message-ID: <d1908709-dc6e-48cf-8a94-d03e173c6cea@linuxfoundation.org>
Date: Thu, 22 May 2025 15:52:23 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: timers: Fix grammar and clarify comments in
 nanosleep.c
To: Rahul Kumar <rk0006818@gmail.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250514222112.396705-1-rk0006818@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250514222112.396705-1-rk0006818@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/25 16:21, Rahul Kumar wrote:
> Improved the clarity and grammar in the header comment of nanosleep.c
> for better readability and consistency with kernel documentation style.

This patch isn't really fixing anything. I won't be taking this one.
Sorry.

thanks,
-- Shuah
