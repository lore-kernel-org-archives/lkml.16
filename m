Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAB3241123;
	Sat,  8 Feb 2025 19:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739042298; cv=none; b=ueyYZlMfMrRgj4FNjcz9YyK+Mi2fUVGvQVkz53nixp8cxySZ8r1gg6Y5Ipfy2mK9tgwJf9DqP20ILWQs4JQ8/5kF01wo5pp6er5XK2Md5ioK7qIkjzEt+TqzIIaZRnng2OM76DviWHeDEHXGueXHZpzaGRbdBGejj/5oTmfIehI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739042298; c=relaxed/simple;
	bh=Qjr1Lwn6U5Rw4Ej8sM40TWnuhXzjrsCgHcdYuSWInTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVe4n6E7g2gVXkds+PY3KaSBLLVJv1zbPh7ORaNcZWqsq0H672ex+XxwvWYsX9j770mXyBG49mz62Wa8evdutR8jCyX7KN/RMnNbckQ8Xl3jY7Svqn+jijq57yV7pCVkM6IQp8sx0tZsHkxJ3yV5E7MVxJMf82FWk/AcXvYIss0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knZ/7Sqh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knZ/7Sqh"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f40deb941so60250095ad.2;
        Sat, 08 Feb 2025 11:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739042297; x=1739647097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EaZobdudAIfmgRkPGXc55iVGg6/s8yxwmlpxfTutnFA=;
        b=knZ/7SqhGah2rSzL5I7ati/9DG19teXQsE9YrC6ViH+uXxniUmwrtq5OShWI+F4I37
         o5W/c2Gr98pt/US8xRNSSTjTqlMoJzf0HsFkEAzVVwRqaeuV65jHSPJFaVsWha7ZCoiq
         Osm4Uaq4rpu6YGzrsJAgVGHS2+F46V4Xb/iAGRqZv2v8pydoqAylbpwRexS5aCU4+WAu
         Zh4u5fudzxgH1WatICi68aPqjkjP6XL30EmSR2l+gH62IqN9eqVC0HjEhdIAw9/UbuKZ
         OZYfyJawu0d+dR9CRXaayLZ7JGJAnloP8+t7sod+zbg0z0SxefYNlMpbblFDHoBq2MpT
         +s2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739042297; x=1739647097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EaZobdudAIfmgRkPGXc55iVGg6/s8yxwmlpxfTutnFA=;
        b=g4OzzY0tm79+z3S+lmNS5vW6qXruRSsHs90QXHojK8ZmWkdBiR4cO87iB4UykfIw+d
         L0iqANUnoGd4lR6lo7n/ucd8rM5yzL9qKfhDrL4Dg5Mm7yXLUKH+/RQaY29dUsiq0sSW
         Ril/vPnv3ZwpO3+JbsAKzwYVzzsjEEiVHzDE0eoGH4SigkktDuz54Lmj2lo86BV4YYRh
         Le2ZDXBE+OeeOyVUqKemnRQdF/68FoMiRWXmPVrZy3xKUl70bw4quO04bfM386ylCts1
         p6sLJI8BoXYgnx+AFLKPlgaeFZnOXZccFkMPsjHTB26gy3W+/YKQEyXL09gZDl5Au3qu
         Mt+w==
X-Forwarded-Encrypted: i=1; AJvYcCWQClwkGGT/+jr7g2gUOMEdX4xFS2naSjwczAaytMBNl4tVmV3sQBFDTc6J7OAZpMmb2tjy/4dziWA=@vger.kernel.org, AJvYcCWrsTopgtpbaWOtGPmrPyamua/Cq/ubw2K8QYm2muJgLZq0DFdxyRdO9o7KKzXBH26BtQhDoqxM9G0n+3vN@vger.kernel.org, AJvYcCWxaA9wKkvcZa1qlBQvnh2esES5dxaR35sfa3lU1sklxcLSV2pD1aKQaazHX6ggVcAoQSyQd5fNAITFfAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsWhn7UPWE5tbYKemfGVUPLP6rBQZcT+FiNFNYwcY0qAv30+gD
	AY1C5pwjOLSuK8H9SRacaJTtC+k4T56zp5IXSZKaJoVcyI5rzsJEwQ60jJGe
X-Gm-Gg: ASbGncsubRLxXEH1Rdb/HisT60Q4PiaDhbkuN1iKy3IWSn6sVygtVJExygKNh6QjOS7
	zzyCIExtsJ60+NDCdvLlwmbT/10OgTZXpznkOCl9VARvRAKG6xcroHqIG3K7KIbF062aVCmrGbk
	WVr76rZ7imLb5OLliki2VKh2ITVL3/0821Ut4sZMeeCispiim2f69s7rlbbxFcYa+wQh5naO0Y7
	Z6JNAaStrLK3VqdReKD1M2PBmF1VpZv1NLriehJl1KXVKS/XFRmzew4xIvFwW5X1L5Ryb2gPC9Y
	ZZb6cNB7AZR5frNiOUBsgV+IR/76ay2NFuI6ZHelL5i1jS0UzVnkGu+mQmhbZaSJzKfaZg==
X-Google-Smtp-Source: AGHT+IGK4ENVPz75Utsdlpusg9fVkdWaS6EY8fISSBPjjwvWXOzzzLFVyJDsDe9ASLA3AP7D0H9nxw==
X-Received: by 2002:a17:902:d2cb:b0:21f:60cd:e8b with SMTP id d9443c01a7336-21f60cd2b67mr87598285ad.14.1739042296667;
        Sat, 08 Feb 2025 11:18:16 -0800 (PST)
Received: from ?IPV6:2409:40c0:101d:c4fc:7ba0:5deb:5197:6901? ([2409:40c0:101d:c4fc:7ba0:5deb:5197:6901])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653babfsm49923715ad.68.2025.02.08.11.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 11:18:16 -0800 (PST)
Message-ID: <2840ae27-1754-4f01-9768-f0ec81f40cf8@gmail.com>
Date: Sun, 9 Feb 2025 00:48:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: hwmon: Fix spelling and grammatical issues
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250205200134.12006-1-purvayeshi550@gmail.com>
 <e0dcc70d-5dad-44cc-8209-7b31c13b0976@roeck-us.net>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <e0dcc70d-5dad-44cc-8209-7b31c13b0976@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/25 08:22, Guenter Roeck wrote:
> On Thu, Feb 06, 2025 at 01:31:34AM +0530, Purva Yeshi wrote:
>> Fix spelling and grammatical errors across hwmon driver
>> documentation files.
>>
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Applied.
> 
> Thanks,
> Guenter

Thank You!

Best Regards,
Purva Yeshi
