Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E417E286D67
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747953821; cv=none; b=L2W4pBErcLvj/1s0cUTqJ/pT2vsN82sAMQmf7sukUfsYmYeaAKbd6D4D16QtB6mmcYHD7m1iK5j9kTdcDVbwLJQKDf/Ymu9Is2G+ObMuQ1EB3K8uk58JM8EqYaTlFWzdERTEdb69RUqx1Mu0HdBmOrFub1sOotntyNZJvdphYZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747953821; c=relaxed/simple;
	bh=d8ElNV1KxKf1PTMc9BiSriOci7moGD7yluHGQynQVf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdNLCLtgh5mZakqsB90jdr5Vuvx9Tk1c1pfVReuS1tSqoYgwfMErgdW0Q2yuv6kBCUwv/b6P0E3MWmz729EY9pH3IQDjE9KLPD4kUhWKuvZFv6IcCbRkESCkSojUkMYUT8iVm8XZ3M+dAvYDlcvI2sqY3IoGHTHGRsDn/pvSKZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q4ROYLk9; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q4ROYLk9"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3da73df6c4eso67561305ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747953819; x=1748558619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SgAx9FRjAiSPVmD+10IVtHJnBsxw+8aMplanI2nZMN4=;
        b=Q4ROYLk9WwKxIjKIoOaiWWf9PUKeUP0J+yExkA0SoGTwi2C10purbPzas95RyyCkCK
         ZIq61ypWB2cYSIQSL/6CKRmyN9809QtMSgKWIvvJJhsltEVKKD4qjmQXEJp4Y7Yff+hJ
         tM1x0NB0ZlBRVUEn7aJTJnR48jkCGwI+Hsd6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747953819; x=1748558619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgAx9FRjAiSPVmD+10IVtHJnBsxw+8aMplanI2nZMN4=;
        b=v3rtRUKvQWjbdwSLahm9e04QzoJtwZjYVjx+APTHSvBro3vRqhAHBfaYbDnDn8O4wi
         xEGhrAkb2a3aVqvNEjOkwZhNxGLef5G6xx8+Z1tZrhGc6yJG/91aUn5uvDhEnd79Aass
         3eXRMMDLTnREIpXFxS4+c6o2Tw2LsjqLgq4ZweAiLDMuhSP6bblMsadNdJWgvCrkDVxh
         BWNiXCxfAFAWgsENT0nnquJ6s8OX+xLtZcjZdKG1LUtT6IWpGU7xy80IZnspQCK7szBw
         HhUG1UfGouDp509YbQxTHYeJz3dUt2DvTjsTGcAEtEaLC3cW1nMMBEtiAMS5BuiPaH0O
         Rg0g==
X-Forwarded-Encrypted: i=1; AJvYcCXnw53WRd/piMXKyeg1YSjiqW1bzlfhLOjjui/qoNYae4GYs9fpC1PgIXgPbTpsHSI7VIlbDXZ33cfP/rA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/oq1o3jXp7aKgO3q1MsnrjYNUIBDn3tsV8heLDImwlsFS1I/B
	mCT8UZ09UjgFEgr9ODSUuxQZjXHFt76hwRRgNJ/JPJgk+oLytxeAxYyNSP0TQn2NrZw=
X-Gm-Gg: ASbGncvMaW6MqXgDmc8snrwk+IelRT0r5uQFQTT1TlG/K2yNFNTbh8tw+WFvX13yLwn
	2LQDk9bamSt8JU9oaYeQzX5NHEb8mFlgk84lgWFM9uYvG641ntBBdUih+OKRPbRuyl4JEgIxYJN
	FX3Yz2m6klaq8KsUo2V2MozxjabMDaT1iJhPw4F/7mh72MSbWwje9b6mBzx0DwSgvLePoGd8NKU
	izixS2rmRWY7T+r4/wHS+ZDq3DUnP78mCGlP+aIkceIgSqdR0dAC4ouK9Zx2BRub4wBI+M6ygbY
	4dPyUCGVjHR1Yq30xy1kqUZu/KzgIjfcJ8DQ4Yc5ofwIt+JQSefoYJ8elleTAQ==
X-Google-Smtp-Source: AGHT+IGgZrub3EqyIIKtPGhYUaoxCm8eFkqbXkOsp+d+6Y4GjpSAtke5qsqtY8wSwjMno4kibcNjng==
X-Received: by 2002:a05:6e02:3c02:b0:3d8:1dc7:ca7a with SMTP id e9e14a558f8ab-3db84296d9amr301540885ab.5.1747953818933;
        Thu, 22 May 2025 15:43:38 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db843cf8fbsm37711915ab.1.2025.05.22.15.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 15:43:38 -0700 (PDT)
Message-ID: <a2980c99-6a6e-42ac-8978-8e0ab5319a9c@linuxfoundation.org>
Date: Thu, 22 May 2025 16:43:37 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Fix typo in cpu-on-off-test selftest script:
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>, shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250517011928.673585-1-jihed.chaibi.dev@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250517011928.673585-1-jihed.chaibi.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/25 19:19, Jihed Chaibi wrote:
> Fix typo in hotplaggable_offline_cpus function name:
> 
> "hotplaggable" is replaced by "hotpluggable"
> 
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> ---

Change looks good to me. Change log should specify the
subsusystem. Check submitting patches document and refer
to a few change logs for this file using git log.

Send v2 with a proper change log.

>   tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
> index d5dc7e0dc..6232a46ca 100755
> --- a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
> +++ b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
> @@ -67,7 +67,7 @@ hotpluggable_cpus()
>   	done
>   }
>   
> -hotplaggable_offline_cpus()
> +hotpluggable_offline_cpus()
>   {
>   	hotpluggable_cpus 0
>   }
> @@ -151,7 +151,7 @@ offline_cpu_expect_fail()
>   
>   online_all_hot_pluggable_cpus()
>   {
> -	for cpu in `hotplaggable_offline_cpus`; do
> +	for cpu in `hotpluggable_offline_cpus`; do
>   		online_cpu_expect_success $cpu
>   	done
>   }

thanks,
-- Shuah

