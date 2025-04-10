Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11F31E883E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299201; cv=none; b=PK1uFTfwW+Cqa7zg8LUxEBR9bD50p0pRhQ/FduqbDjd9fA7jK9YMOJXRS38hO8d18lF0e+5GphZk3SB4+HpIAZg/QpBsnqegGPMhGU3maws1HoyBSFsPWp2DyuIKroL+BAcpBaa1dttZ5PbJR09Toj6p8V5/kt5FXLsj7s4gjdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299201; c=relaxed/simple;
	bh=R4JcdOP5ZS2NZpHV1skCSE3ooXP17ubX1xad66aelU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EnMjBlY9BX5lwPhPTyuSd5smhMGqQf3nv7dVCR2wYMWkUhnyAj5ds4pD9uxzGugJAIqoboDJSD8mnfvGn9dRfqL1GEwNXwZDz1mZghV5GF3NUxfZdXkoZZ7oIlXhD/ys/t7xVVeGe4PuMxJa5zaTr3vClZUwymmAW4o4F6H4QQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A/qqkkvZ; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A/qqkkvZ"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85b3f92c866so25953639f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744299198; x=1744903998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVBSqrkQs33y/UfJ4YzZEYB1/aRTPmE1UaXspipmDPM=;
        b=A/qqkkvZJ/KkODb9kng1/fvp3u+IbpSwBWV/JctcVH7Ms0Om6+pDfxsegpQ/uv0/Hg
         uBigzSFfY3jyZqYsg16bZuXMWIrVVI+6gwVLD1041edmy46QpZI5bTo9ny5gIFjVr30Z
         3QeN6OzGlStopEEBFhwpwAAFFVxaiVApSmGj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744299198; x=1744903998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVBSqrkQs33y/UfJ4YzZEYB1/aRTPmE1UaXspipmDPM=;
        b=L0F6pEPyC0q0aY+i9JYe+IzBcb1d1bWLVdAhWGd0K4zTliVJLbk+OwWUFXosyqAIaf
         mokf0/XnXNsXpljvL9IH46dzOa/PRedy008TcbX3VPAq3oU6sT3rncXkx5EPkn1EurA0
         cGFx3o6vdjAa49HNYNr7HGMa1XmCZ82/z715sTz0KPgmWvVGqH8IYcZqYS98WBc0aJdX
         ZujI2rBukphr59HrR4O+H51NJUosnZafXmra/fVoQATbRcDoffDYyt+R4FCNLaWJ92ea
         nYMMjiw9v4+pqUskkg8+EyjXbCdm7+8vml3XNKyZaIKRvJG0tTY6Ph7Z+T/jIVCiZcen
         2izw==
X-Gm-Message-State: AOJu0Ywo2k+yvHwVlVTqfG+jfEQCuD0YXPWCNNz5PjFnhQARGZF3Hn4s
	21JzygdN3fX1FNJutuzxEl0Kdafmb4CQtgH5byEvqTxzuppoxewvLSGllz/LpAY=
X-Gm-Gg: ASbGncvb5sWzhfSNjfSpvu8LulVC7fWAo5UslQrdQK4AODt4oy/YVkifsL+0r5T6PdF
	qTqZJ4Is+eo+LRsVcB5a8fJmeAk5izShaCnSjGrgrnSQFo9tRfmuYBt3HqQSdTHihMLm0SWsuGb
	B63veErDzT3RUSSP54quWtXPtnM/IHSNd7hB2NpSh6+Wqk+BRYHlAkQhMVV105Gq0XRtwKfJOQw
	wkibH7dwoPuD8Yk2rU4MR+a5FZPWgw5aY17MfYWCZsGUjJuDWZk/DcNhk4o3ZKC/NnYMj42OuYj
	ZxqDukG7WovEfhATyVDiP0mag6yS7tquRTMbQ4b2wt+lN8HsycE=
X-Google-Smtp-Source: AGHT+IHjEffLROVPgH62sq+jvKud/CttzorBFAX4lZm7gaew3ZmymtkyTnvSGgylg5WNPumk3cnUAA==
X-Received: by 2002:a05:6602:4c02:b0:85e:183e:4c00 with SMTP id ca18e2360f4ac-8616ecea937mr335117339f.1.1744299197785;
        Thu, 10 Apr 2025 08:33:17 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8259sm785148173.29.2025.04.10.08.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 08:33:17 -0700 (PDT)
Message-ID: <ffd1f317-f4d9-4a39-ae6c-04afd7fddc0f@linuxfoundation.org>
Date: Thu, 10 Apr 2025 09:33:16 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/32] selftests: harness: Ignore unused variant
 argument warning
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Shuah Khan <shuah@kernel.org>, Willy Tarreau <w@1wt.eu>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250407-nolibc-kselftest-harness-v2-0-f8812f76e930@linutronix.de>
 <20250407-nolibc-kselftest-harness-v2-3-f8812f76e930@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250407-nolibc-kselftest-harness-v2-3-f8812f76e930@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/7/25 00:52, Thomas Weißschuh wrote:
> For tests without fixtures the variant argument is unused.
> This is intentional, prevent to compiler from complaining.
> 

Include the warning in the change log for reference.

> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   tools/testing/selftests/kselftest_harness.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index bac4327775ea65dbe977e9b22ee548bedcbd33ff..2b350ed60b2bf1cbede8e3a9b4ac5fe716900144 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -174,7 +174,7 @@
>   	static void test_name(struct __test_metadata *_metadata); \
>   	static inline void wrapper_##test_name( \
>   		struct __test_metadata *_metadata, \
> -		struct __fixture_variant_metadata *variant) \
> +		struct __fixture_variant_metadata __attribute__((unused)) *variant) \
>   	{ \
>   		_metadata->setup_completed = true; \
>   		if (setjmp(_metadata->env) == 0) \
> 

thanks,
-- Shuah
