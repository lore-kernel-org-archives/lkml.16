Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AEF26FA75
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952513; cv=none; b=gmC8YA2RBbZKJdN2tQWFECZH4/tDyvGbsv/3Ny8Vy0yxQLKgb/0qq18jsg8SFVSfZCtejjEK/3x9S4tLZDuRuhnjs1HORBM6eTjDWrpvYn+UHLD+7ZYWunaBnIRYcRUiQVJ35iLT5YlGCDaeQqDX0furPCmgyUyUOa3idO9Bphs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952513; c=relaxed/simple;
	bh=mNIIiTjvtytH4knIqgAqMbf5Ewmg/ZFc64IhbBi3Vdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6JV2oen2IkJjy6wAl0U/xw9qzqO5JhrSfbOTgrEiR7qA7v0gRckuq9P/VIZ+4A1wSf21nJOw/+wVFoc7528mFfBUdHyx5OgpzcbU1wydWfpArIv/r81BcM9sfwvyjOBeQqExMdLWZJ0LOY92Vf6FMnuGUJ5MsMc0lyr97HrOLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QLda/JMF; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QLda/JMF"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-85b41281b50so279597239f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747952510; x=1748557310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2WumDBboBbqjKrIFNDMqIj4OU2U2Il7ihCN6R/RgGaE=;
        b=QLda/JMFI3WjBb9KwasMKmMhdHr4BqIxvOc3W8ILUuCwERJIOJTJzVlKSvf+RrY88L
         IN9ub/oy0dFYgHO2BlbiYVRMq56wTRxsBR95RAPfPzzzCsW+h0etcCPztwBRHM8KJHS5
         2SC5k2lheCZtm2asAgL9SGJlXNGBuwkxifkOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952510; x=1748557310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2WumDBboBbqjKrIFNDMqIj4OU2U2Il7ihCN6R/RgGaE=;
        b=QUZQtoY7XbrzLSDYZe4+Qa3RQaTjCMI3DtQ4+T4nF8HBkXftsVuwyw9D373fO7xeqj
         9dmY5+KdNWJoF/YIDu+JD/LH/7SCXC6u5nDtLJij0Pw05t7PaH4MutX3REQj4MaKOevh
         XXjLCkXmfW1I7psHUTRrjPGRQeVWxUnL3Fn4238XENCp1dlQ2pZa8THrXoRkphxy+Qhn
         f5hPBrnd7lc0T7qqcYwilZHzyj7gDlC+hezS6ewBkt9yxM073rQwa3SRH6k3sRlNL7Vl
         n6NMUxrPWKREkxiHeZZmSNa118f5cc+V7BZ/fcXMe76V4ygPC1E0ghfnJv5rQbGpia5q
         zi4A==
X-Forwarded-Encrypted: i=1; AJvYcCU3Y0+4KZRQPzpklheuHlwsbS4zsiENOjWUlOMwyg9tp85AVNgq83DQ5qrWmlwvh+++cAZQjzr10scYU+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/xEtGvA0Yao28wRdBWN08gwjhP3ULn6emGh/ZTvd5F1knPaOt
	v5B6RpJ9Qjqvt5Potqd3hNo/sN2uMhvGrQML3pGDOVj9DC272ETUsugYK4soNnaj9pw=
X-Gm-Gg: ASbGncvQH6C1MdX6KBvUJ/M4RdXrsqcEexZtGQZtpqaISK3Tibq2/hCHCRWwMrjAjlT
	6/6TuxX16EXTEDSaI3CFhVWK+Mv4g5PzQB1CCOMvBkmyFKGFph0jBknjHqMeHX0Pw9MBv9u24Xj
	9ZAz82pgexMP6bfa6z40RqlR8yG503Awt6aZ0vk1Ot3jCdo9RtAm4KB+ML+k+oh1XLqA36Mx1re
	gCA24pQ8UgwAKSqMmiDfzhhvXW07u8j9uskoAgE/tEUTECs4keWxbCS4gSTRUx+9m3H77kffuMm
	vhXAmW+82M4W0ddSdG9OeA3MH5+zyCLVV+0mYKPdyXBjIy8sex5sGY/6gza0XA==
X-Google-Smtp-Source: AGHT+IF6i4zqwY+JBhmaF7DvaOm1r/5AaHpcOaVaT1YyrMVNieZOKZaK6Fd3OhODW0J03U/i8rnFLA==
X-Received: by 2002:a05:6602:c86:b0:86a:25d5:2db0 with SMTP id ca18e2360f4ac-86caf0d4272mr132154039f.4.1747952509713;
        Thu, 22 May 2025 15:21:49 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc3b1aa5sm3462066173.50.2025.05.22.15.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 15:21:49 -0700 (PDT)
Message-ID: <195e5806-df31-4476-bf6e-4c911d261fbb@linuxfoundation.org>
Date: Thu, 22 May 2025 16:21:48 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [PATCH] Change pidns to pid namespace
To: rodgepritesh@gmail.com
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250516164902.91085-1-rodgepritesh@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250516164902.91085-1-rodgepritesh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/25 10:49, rodgepritesh@gmail.com wrote:
> From: Pritesh Rodge <rodgepritesh@gmail.com>
> 
> Changed a comment in memfd_test.c , Unabbreviated pidns to pid namespace
> for better understanding .
> 
> Signed-off-by: Pritesh Rodge <rodgepritesh@gmail.com>
> ---
>   tools/testing/selftests/memfd/memfd_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
> index 5b993924cc3f..4e4c46246a4e 100644
> --- a/tools/testing/selftests/memfd/memfd_test.c
> +++ b/tools/testing/selftests/memfd/memfd_test.c
> @@ -1359,7 +1359,7 @@ static int sysctl_nested_child(void *arg)
>   
>   	printf("%s nested sysctl 0\n", memfd_str);
>   	sysctl_assert_write("0");
> -	/* A further nested pidns works the same. */
> +	/* A further nested pid-namespace works the same. */
>   	pid = spawn_thread(CLONE_NEWPID, sysctl_simple_child, NULL);
>   	join_thread(pid);
>   

Please run get_maintainers.pl to find the complete list of recipients
for this patch.

thanks,
-- Shuah
