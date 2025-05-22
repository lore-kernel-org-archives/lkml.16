Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9702580F5
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 21:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747950451; cv=none; b=UTWQYs20Kr2KmIi+9XFHKl4tgp66elpRVdmtZrbHOFUlViS85brTG5v7rFeJxLa7aEZB3P/GelaxsOwsxNIF/Ze9RosLnI/Y3x03ozmEqK2tRW0OVDTlbmWqLSXdNz7R1DBSLVXshU47lhHJaDXlp0o2+seUBrXgw3aov7FUNBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747950451; c=relaxed/simple;
	bh=GmcdqZzFuaEdaML55qbv1+YJ1+QpY93f8/SRY8QW1e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b9ntG0bNs/lIf9KtyoQlUb0pIQ85/oDjjp7JiWK7SF4QPiC5M/FjCefwP1EiXgjNYATGxwsBKoWnpoYVtWbcwCk1sVZARwVLOUz+Ekk6sGtsdTEx1BL5GWMkLg9S06VTImOIeenfovhZbBFm4liVGYVEmYxkxGow38o8wne8STA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aTQIboOq; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aTQIboOq"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-85e751cffbeso573811639f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747950448; x=1748555248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QkbebpTgv5IIk8GR2MwaHg8eO8HL86lzCVS0P9+4rUc=;
        b=aTQIboOqsZFkyDO9FXWoLK94lLCO/0wjCHqPqMA2x38ADFX7wQ9qeoZUxEHrAoU94c
         Cu/TKb5PmV2jRKbt0exz5L+Hv42BBeCDWaD7o2aCFe1K9Lj2vvZn7nbDrI1VJsbEa28g
         sNexX/hKAqaqAf9owpezlynU1OB1s622eUTBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747950448; x=1748555248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkbebpTgv5IIk8GR2MwaHg8eO8HL86lzCVS0P9+4rUc=;
        b=S2B3wPi2QYHanOMfo04TEnJMhYWzXEnnAQ0GpXprcQYYyjGEL/aOQ3XWgYDb1qtGIX
         dPwfwZ3gaTcRRqnN5zv4jiGfC0NmU9IZHAtl+S+kYbL/PtCbDXT8DKSTRU+IB+80Xc5Q
         Yt5VT/NdqJhV2GqVFjJAZcyqQJyq6mYVqpfNXDetbLq2uZGngn3v8oDquEvKFa1GF6GV
         kdGm1EGptjkes3iq30d9xYZgpqRxRIwqwWTp2lPVBe6rMBNqMld023bCwEkKP9vj8ny7
         bpzTDpAvJ8UikPlpGmn1uGmT0iIJT5NWissRxf6b6JbtYR+xt8pH4BpHfPKYCFCm0KH7
         vutQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhOdPI1JnJ1HDirbEPYgiQMPUEMZ8QkQFbiTfhUIy17nlxNuHDNm+s/pjoKJutFZwFNtj7sEzhM+3ei8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2eFgdw6ELnj4QnVNNY4mRRAeVMEGv2Vv63MFjigIA8exNj6VW
	hqAxW/HWL4fnowfW7ABwuIHkSIZysHqZhaDqgrJQ4Zd8JdliBHhmiyprRds8WKAG7XiSphTtOBr
	hLlTa
X-Gm-Gg: ASbGnct2I2fTrUFDyXd5WfqfSOBEOoxEoU9mxS5/h1mSnEU2DnsfACN4A//zq4/jGiv
	Ld2zU2Oig7Qb+tfoLhSnr44yi1LWQ+R++lZ7V2A2IZTGAKGi7+ok4Cnw7lAAYgyfm3W1eQXbXEC
	XRSMw3muZ4V0zAmy++gZHVA78uVykaZ+rdAE3rcydaO2CIMQaewO1Uki35BzhS1Q+2i4HZRbGgD
	LxRYE74kKcPn5K+B/pFVgCrmCJA+9L/NpXGrcpfL+6zv+oo6lfcwcXGgAfc3/FJHuyokDas4vXt
	OBqIZJtnQxwDFRz8VqiaLbZLw8JgS0enLVpI2xeKmuIFwFuH+RBj133WQ4MqP6Qz04epz/gD
X-Google-Smtp-Source: AGHT+IHWkyNL4mOsLb/aOWvt5xqS+lbnhvJHkixeQy8mN0hwCodgXBpYZ9c7UcG21/SRfKJ8G6B5lA==
X-Received: by 2002:a05:6602:7507:b0:85b:3885:1592 with SMTP id ca18e2360f4ac-86a24c91080mr2834797339f.10.1747950448629;
        Thu, 22 May 2025 14:47:28 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbd17aa848sm3141701173.67.2025.05.22.14.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:47:28 -0700 (PDT)
Message-ID: <e3a43bd2-261b-4bab-96ad-216ef4f0d1f9@linuxfoundation.org>
Date: Thu, 22 May 2025 15:47:27 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/eventfd: correct test name and improve messages
To: Ryan Chung <seokwoo.chung130@gmail.com>, shuah@kernel.org
Cc: wen.yang@linux.dev, akpm@linux-foundation.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250513074411.6965-1-seokwoo.chung130@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250513074411.6965-1-seokwoo.chung130@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/13/25 01:44, Ryan Chung wrote:
> - Rename test from  to
> 

?? missing description of the change. Looks like the patch
renames the test to fix spelling error in the test name?

> - Make the RDWR‐flag comment declarative:
>    “The kernel automatically adds the O_RDWR flag.”
> - Update semaphore‐flag failure message to:
>    “eventfd semaphore flag check failed: …”

There is no need to list all these changes.

Please check a few chanelogs as a reference to how to write them.

> 
> Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
> ---
>   tools/testing/selftests/filesystems/eventfd/eventfd_test.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/filesystems/eventfd/eventfd_test.c b/tools/testing/selftests/filesystems/eventfd/eventfd_test.c
> index 85acb4e3ef00..72d51ad0ee0e 100644
> --- a/tools/testing/selftests/filesystems/eventfd/eventfd_test.c
> +++ b/tools/testing/selftests/filesystems/eventfd/eventfd_test.c
> @@ -50,7 +50,7 @@ TEST(eventfd_check_flag_rdwr)
>   	ASSERT_GE(fd, 0);
>   
>   	flags = fcntl(fd, F_GETFL);
> -	// since the kernel automatically added O_RDWR.
> +	// The kernel automatically adds the O_RDWR flag.
>   	EXPECT_EQ(flags, O_RDWR);
>   
>   	close(fd);
> @@ -85,7 +85,7 @@ TEST(eventfd_check_flag_nonblock)
>   	close(fd);
>   }
>   
> -TEST(eventfd_chek_flag_cloexec_and_nonblock)
> +TEST(eventfd_check_flag_cloexec_and_nonblock)
>   {
>   	int fd, flags;
>   
> @@ -178,8 +178,7 @@ TEST(eventfd_check_flag_semaphore)
>   	// The semaphore could only be obtained from fdinfo.
>   	ret = verify_fdinfo(fd, &err, "eventfd-semaphore: ", 19, "1\n");
>   	if (ret != 0)
> -		ksft_print_msg("eventfd-semaphore check failed, msg: %s\n",
> -				err.msg);
> +		ksft_print_msg("eventfd semaphore flag check failed: %s\n", err.msg);

What's the reason for this change?

>   	EXPECT_EQ(ret, 0);
>   
>   	close(fd);

thanks,
-- Shuah
