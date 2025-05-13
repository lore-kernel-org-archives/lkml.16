Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7611DED77
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747152759; cv=none; b=tDRAE4arKBjgp2uoCYfE0S0h7KHB5pcev9CTe3yZ0/JqmEmAcN4/EZX8wIqRcbQTfvXNy/mxtsjNZB1sBW2QPO44wwHb16oFy36/ptIt3rW51kY59GU27Ie5hvk1RucyJHfrX/Fa3gX4IRWfZtXlSot93P2B4+aa5Ew3ekpv8TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747152759; c=relaxed/simple;
	bh=dKXRdlHk9jdPedokAkdTX4cKzRar1ssOdF/9x0yTzlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/cJyZ2YKU5h/f9j2u7DCbgTQEQASSLAJWZBGtz+/L3dWhkSeehy2/M81j4a8pvDdT7J1I84P2iakR424NqnRMn84bjdUoBvUjrJSPVNiWdvCRuENxWi2/4mSjeelpQzFpSxfUzUzT4H2XH2haGSgI1zt1bpijqqUuM1hNLkJwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pRyPXIXu; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pRyPXIXu"
Message-ID: <b728052c-a5c0-490a-ac4d-64ea43c3e35d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747152745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gB1tsZVS6yD5HkJNxg9XSkBp0FbT6BoDERBRNVRnToY=;
	b=pRyPXIXuuRYvMOpWts12XZY/CdoQMx3vR5k0fTqe4IHJHbQPMa7iG64K0zClznCU8SsJfm
	yUS4QwU6OiFFJ22sOOi+BJEXs6x4IEUVMDquQjjHQa9MFOFbdgc2j44WDmxY+yP7U84DlI
	HHbYTvyAJVs3Ih41JIOnxHj1rxkOy+E=
Date: Wed, 14 May 2025 00:12:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] selftests/eventfd: correct test name and improve messages
To: Ryan Chung <seokwoo.chung130@gmail.com>, shuah@kernel.org
Cc: akpm@linux-foundation.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250513074411.6965-1-seokwoo.chung130@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Wen Yang <wen.yang@linux.dev>
In-Reply-To: <20250513074411.6965-1-seokwoo.chung130@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


Thanks.

Reviewed-by: Wen Yang <wen.yang@linux.dev>

--
Best wishes,
Wen


On 2025/5/13 15:44, Ryan Chung wrote:
> - Rename test from  to
> 
> - Make the RDWR‐flag comment declarative:
>    “The kernel automatically adds the O_RDWR flag.”
> - Update semaphore‐flag failure message to:
>    “eventfd semaphore flag check failed: …”
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
>   	EXPECT_EQ(ret, 0);
>   
>   	close(fd);
