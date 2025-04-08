Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD32F4A1E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 03:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744081755; cv=none; b=FC7WZ/uZ8wZslXSojzFMpjisMlB2ttB7N8kuJUiOc2nS5kqXEHpKeyv5r1y++ylXaZ0H+J5nZl5x8jqIuM2y7yMqVUjw6setCcBo+MLWvcjG7CQ1A7Muse0nZCXa7EoPBpu/OZgIEWfpFxikQ0RTrAT3OeYudcZhprTVXOBrhVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744081755; c=relaxed/simple;
	bh=9bXBAqjwsMH7aUBaipURQXJeh98g4OYHsd+AsP53j/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kN4cOYB0UKNNjYPv+PQ3IOKmd8QHEVtfOZT3lqTYwXqtnn5R4gYclUkVWUvFwpPGhaxVAVECc8kEwD2LmUm+P2gwpapu/LiFA8PqM+mwP1dzXPyssv5bH4dFZhbzOqWaNvZbr4rK5RHXJt6qbGdnERhY7YSGQXWSVjf0vlR/p1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZqsvqY7H; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZqsvqY7H"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7398d65476eso3921555b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 20:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744081753; x=1744686553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sPuw2Ymw6aEL6CjIynPBldeAGkGLHtU6wbCawr07JKA=;
        b=ZqsvqY7HC4fmkSX78/ef4WpQ3vQ4sg63ljJB3Uns60qwKxL1vSwCy4ZQ198CHUw1IW
         foVqCnqA8ZYL6w1RymGCEvECGt3CPQgZofwgQCS195DSyvJUzmD0pgIDLcQVK2Yn3Eo8
         uefs1d4lqnG/YI3KqZ7Mb1G7oypi2rQ7BDgNlp12Z6PPCnurJ02z0hC+S5wjKs0Ldfk4
         r2tcuM+ezjRHjCeGY6BGN6S5Ka2M9ZiT1Dgd3IOTVrzjCI/HxXzxSPgWiuHz/N9n616j
         AWWCl+00hFBEj1/gmS2sr9iybrtR815AQIIo/9KgvinLM0BV6BjU6LsaFdBVJ2OR6VwJ
         70zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744081753; x=1744686553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPuw2Ymw6aEL6CjIynPBldeAGkGLHtU6wbCawr07JKA=;
        b=VC01+66DRiocGJ3dPAYPG+VEEKjBQeoBd3Z8GossI2vc23qxDDp5zvkNJepMcamhiL
         kotgdVWIxtliNimaxfzepThEQ5AYIb/+7a9cObjMmyxhLKMlKRViBheYnyLUPpfVtjri
         O0JNAKOdzL6L8CujPhKmsjm5PjKij4mirE+aRHJFmmax40QT7VOdnHxSUgahbavVHcWc
         oy3qLwrTFk5e+RnPutCKDRgd/cv516Bd9wV6kJwjQ8YbbKLiFoNnyeDgmItMHP9MHEbA
         iaW8xMKBv52uTY5tkRIhMqvwSn0mOFU/EySU7u8h9G6rs8W1RM0F4Y8cTXYbJr8Z2D/G
         lcRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp74A/Ufe0rl+EgtfFomPKR/xZMI+RFlAELEJ4hAA/Lubm6m3OQpSAfJRTTn/cRsOGWl+sAln8iAYosww=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhDbpm7QE8q1ZtcqiLF9CG3TsS/Ur95C+7/Ktp2lfoUPVAMVJu
	DegpBZP2KqegerBPeL3jrGfslPcD0XVVx6f+t2kHD4FKFdXNPQgZDdAqv3qbUvn7nx3sJN2U0mr
	JMbM=
X-Gm-Gg: ASbGncv1wXR9bhRBeRvCGPSloEotx2fobTH56KnUzHal73coFUX3tMv5/A5g+hXLjtt
	h2eEil80BoOgnGGc+afINCUYVGjZQeyeddl5rTb5wZAPBFA/pyvj/Rj0jXTC3J22RQ9s+g0y5MT
	jp67WO2MpzPs/m6McoZElxBfpfWm+HI8UGv9aF38Cx9ORalrsnnUjo/0WQQxmb5H1jYCN0YNMVu
	65lv/41O0PO6iYbu3/eLPS6arIUv192TAuygzzl0BwaCjJ24HRmL0IpbuImgZxt+5LAJucL3+Cs
	yBhb1VID06VI3akyUOIrf+a47AlcWj5uiKOn0Ki/BEftC6uMfpI=
X-Google-Smtp-Source: AGHT+IEwH96uV5EtxaP2ImURK29zECcTWq13GuIUlA74sMLhltZ9xgPDSZDjYcQ7xrW9wkCK0hHxtA==
X-Received: by 2002:aa7:875a:0:b0:736:b3cb:5db with SMTP id d2e1a72fcca58-73b9d4019ddmr2344723b3a.11.1744081752836;
        Mon, 07 Apr 2025 20:09:12 -0700 (PDT)
Received: from [10.3.43.196] ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d1881sm9372280b3a.3.2025.04.07.20.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 20:09:12 -0700 (PDT)
Message-ID: <0de20ab7-9f1c-4a13-a8d2-295f94161c4e@bytedance.com>
Date: Tue, 8 Apr 2025 11:09:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH] selftests: mptcp: add comment for getaddrinfo
To: Geliang Tang <geliang@kernel.org>, linux-kernel@vger.kernel.org,
 mptcp@lists.linux.dev, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Cc: matttbe@kernel.org, martineau@kernel.org, viktor.soderqvist@est.tech,
 zhenwei pi <zhenwei.pi@linux.dev>
References: <20250407085122.1203489-1-pizhenwei@bytedance.com>
 <ae367fb7158e2f1c284a4acaea86f96a7a95b0c4.camel@kernel.org>
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <ae367fb7158e2f1c284a4acaea86f96a7a95b0c4.camel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/8/25 09:43, Geliang Tang wrote:
> Hi zhenwei,
> 
> On Mon, 2025-04-07 at 16:51 +0800, zhenwei pi wrote:
>> mptcp_connect.c is a startup tutorial of MPTCP programming, however
>> there is a lack of ai_protocol(IPPROTO_MPTCP) usage. Add comment for
>> getaddrinfo MPTCP support.
>>
>> Signed-off-by: zhenwei pi <zhenwei.pi@linux.dev>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   tools/testing/selftests/net/mptcp/mptcp_connect.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/tools/testing/selftests/net/mptcp/mptcp_connect.c
>> b/tools/testing/selftests/net/mptcp/mptcp_connect.c
>> index c83a8b47bbdf..6b9031273964 100644
>> --- a/tools/testing/selftests/net/mptcp/mptcp_connect.c
>> +++ b/tools/testing/selftests/net/mptcp/mptcp_connect.c
>> @@ -179,6 +179,18 @@ static void xgetnameinfo(const struct sockaddr
>> *addr, socklen_t addrlen,
>>   	}
>>   }
>>   
>> +/* There is a lack of MPTCP support from glibc, these code leads
>> error:
>> + *	struct addrinfo hints = {
>> + *		.ai_protocol = IPPROTO_MPTCP,
>> + *		...
>> + *	};
>> + *	err = getaddrinfo(node, service, &hints, res);
>> + *	...
>> + * So using IPPROTO_TCP to resolve, and use TCP/MPTCP to create
>> socket.
>> + *
>> + * glibc starts to support MPTCP since v2.42.
>> + * Link:
>> https://sourceware.org/git/?p=glibc.git;a=commit;h=a8e9022e0f82
> 
> Thanks for adding getaddrinfo mptcp support to glibc. I think we should
> not only add a comment for getaddrinfo mptcp here, but also add an
> example of using it in mptcp_connect.c. I will work with you to
> implement this example in v2.
> 
> Thanks,
> -Geliang
> 

Good idea, thank you Geliang!

>> + */
>>   static void xgetaddrinfo(const char *node, const char *service,
>>   			 const struct addrinfo *hints,
>>   			 struct addrinfo **res)
> 

