Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D021EFF81
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750624166; cv=none; b=dnmq9Yio5lvmVxJfe2xErXxpN+gGqFLotV2dpJZiSL+zSxpMXGg/dAfb2E+PGhJQl0OEfrGQhR3OIXUOjYjl9rzRdTgEa2KP8MJClNrxdZtOrteMQqW4j+Z+yJjLzDgEans0JdTuSxCRNe5/5MKLhQ3WE2IwBIMwAQp5/+RZ0ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750624166; c=relaxed/simple;
	bh=IUfKtI+qtER+aJTlLv4om+Y3q6vy4ahf3LrIBEDbr6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMffROqH0+h0E0pkI9ORR9Jdi01EcJ74bxjB8+LwQr6FoRQ5kATARBqGWmGBdbhnhkMsskdoxoEIskN57DDGd818HX+li4xqMbzomrT3FkJ563gFDk/owSvRLsXJFYtwYDrUBR3u+m/Gic/zxv5Z8wkWA7+vHZfg87vRn/8l07o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUSNrDFn; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUSNrDFn"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-748ece799bdso2274227b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 13:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750624165; x=1751228965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XI+miuquo3gzPgrHbyJTHFVjYX9SZTLf8t7NEGOQjyw=;
        b=IUSNrDFn3xAXKLG/qWyPvBffqe8KB3puw6Ryc6A138APUeDg8rPkW+JclNBqlU3W78
         tEDGdpTqqbOxZRd0Al4BQDeJmQUq+KO3fr351vUBZgyC+0HRGuhKP1D2Gtaa6Gkv2oHD
         jdEI8XsckBzSMQK5CuaLv/bzFpeq+v+hmmXSVPeP3sOjQPgmAjDC0Dhl7Fc/WDefx+CK
         P+xMeuq5E8czYx6c0DFS2BYDhG9LHXJ95GSOi6I05R4Z+0lyfsTif4zv21ijpaZtE7xj
         fPclJBmUFgJhGZzqvCcdQuq3a7loFNpUae0JgIw/8LfYRfZya8JayhRZOrNLtN5b+cDa
         /Y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750624165; x=1751228965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XI+miuquo3gzPgrHbyJTHFVjYX9SZTLf8t7NEGOQjyw=;
        b=LUsxuOTCGQhUMok24ItxnhtoKCHk5zfLKAAjqHxLU+YJCrf5yZsCyotb1ohGNbOkCS
         geTRM20W6/4JZ9c420cVd5w2JWm3wzkIYOETW14lRYnx1QfEAavoJrlY0P6G+QdN7PPj
         h+s8zYIwMysqE5ONxDoTfJ57geYHjWoXyBPI6r1+zH34tc+8F+EgSqNMz4JzYOwD47DW
         VRQvvk2Z2H/JYeE9oQThC74BnDD6WQSjbdpNqkQbmqdJ2I193Dd+BGBLqxPyCuFE17kB
         QjfQJKaG2UL5lwEi3Xp7/SxqV1YI8cEUmiYUR/wJNO078RaknbZTriSs0+1bSilT+IxZ
         mATA==
X-Forwarded-Encrypted: i=1; AJvYcCXf9dVydC+5mRfbHj33rnte/39EMSA5ULmo7saumxH1WzHHhi+ojb8d0gc9j3cFo8An5v1JSVAyaoeZSvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxApDyZ2LLm8OH6yUMLEbpgbH/CgznU1Zv8xvIyllaiuzU2HrkR
	BrDZXjgh3e5Ijybl0tM4r44VXKpENv4vixyarkwXGs//+wcnvtd8hi7G
X-Gm-Gg: ASbGncucWOkNbx8C9dgPHe9rj/N3gW2ziKKZpv5dVcm3F8/YJvER5+CJCpwYYUIklqo
	ax+Yd2cI4/FBUAzZ5eAYXAlsXqxLkmzBOAYVxqI0acuAMsnTzOp2+UffRiv3k724ZwqnAkd2kIc
	wJ9AdW8cpN/sdF8HkyXoXFUrHcBW6kaq9l/HL0wbImiYNexmMWhSMXeQWX7tAWmv/I6lj8Tn8AQ
	iwCgOTTm6F9KECP9tWrODviLZWBvvTWoYVM2RZYU38eZAyrCCuiaeFlE69vUxYT9u2B4Wo0a22f
	m4dlUthFT1eAbclBmoUxL+kbW4Im1AGG13mjMEYCpOOF0XU9aoTz2X8ibUEd+/BSyUU5M6wVnvk
	EfGYPDU+taDdXdCFFjJvCEED8eW53u/pkUfRoiQ==
X-Google-Smtp-Source: AGHT+IGzEyIbY5Nuu4V8gPRP1Y2Y8MrHPw6ZQgNlZcDOEJYlnkYOtLmVoxR24UmtSwSordm1VSfqCw==
X-Received: by 2002:a05:6a00:1954:b0:748:e0ee:dcff with SMTP id d2e1a72fcca58-7490d760679mr14084508b3a.11.1750624164710;
        Sun, 22 Jun 2025 13:29:24 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:ba1:dccb:1016:4667:352b? ([2600:8802:b00:ba1:dccb:1016:4667:352b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6b3aa5sm6635272b3a.166.2025.06.22.13.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 13:29:23 -0700 (PDT)
Message-ID: <67b9cfd5-b06f-48a3-9d26-c3fa3ab867ad@gmail.com>
Date: Sun, 22 Jun 2025 13:29:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: export __memset/__memcpy/__memmove
To: Arnd Bergmann <arnd@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Abbott Liu <liuwenliang@huawei.com>,
 Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250620111257.3365489-1-arnd@kernel.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20250620111257.3365489-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/06/2025 04:12, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When KASAN is locally disabled for one file, the string functions
> get redirected to internal helpers, but those are not actually exported,
> so this only works in built-in code but fails for loadable modules:
> 
> ERROR: modpost: "__memset" [crypto/ecc.ko] undefined!
> ERROR: modpost: "__memcpy" [crypto/ecc.ko] undefined!
> 
> Add the missig exports.
> 
> Fixes: d6d51a96c7d6 ("ARM: 9014/2: Replace string mem* functions for KASan")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

