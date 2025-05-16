Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB05231838;
	Fri, 16 May 2025 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383399; cv=none; b=Xb+Msiihpilnce9A26JIdRdLHfkgXrWJSVcIl0LQ1PhIPqAeHRt2x9LDFwSruIUdWxvFjKSVqKIBRQW58wfkrU89kGB39wQJqCJlhvZZD2TaFUUDYRgrYoBrTFUu9ODrpfxn2D12tr1jjf1GAxybJWU90qfeIcCMOLWYsQiiK4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383399; c=relaxed/simple;
	bh=+hZAqH08xCVXK8kytHytBGpF9HetP+6wRwFHX9OnASY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmAgjr26sDngyhIoTbyRLd/rvWhuusewbsNAkAA7Gus8tuHUcZPVRhPFpXobwmBufWqFcFomiAtVxzJfu4g9lFFiyxdOHkSoVeNp9RF2aoJSNy3U/2a8MRzmwiri45wooPYu/WVETJGP1wIabKSl77v3mJ7RxoPv7deAOl6jHHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSJX8yJk; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSJX8yJk"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad24b7e0331so285091566b.0;
        Fri, 16 May 2025 01:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747383396; x=1747988196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p5uMs6FkdhW0yuPSJiF5IsCQmeoDxyXFi4ZKMZV6l28=;
        b=YSJX8yJkGJipwbEhJqwW8U50h21QpaAZIqtzVWOZoJZMar0AkEq0h8QcUcfdduTXaQ
         hZNkbYwOo11aJI1l+04W1K1+ICu8+5qPQu+BFJq7soyW/kCX2++A4Hto1g/jpYCshN8d
         MokGEEkfSC4JGbVCPwJWZVkfmjqETnFcEkeZsKT8Iwu3jbwHYDEhbpWCUvzRjSET/eNu
         NQ6EcJesJ2rC0oem092bpjBB/XNHqcIZULJOg+f7UvNlT3xxx3UYArMdzbO/xdFTk3dg
         AcWl0GGmkvXjHS0OSvaFxDtBep3yYK3JNeJnMzL4mY3N0NmKl3r9L8TZibonxGj7k6RQ
         ghjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383396; x=1747988196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5uMs6FkdhW0yuPSJiF5IsCQmeoDxyXFi4ZKMZV6l28=;
        b=ZbnGS+tds9lEng8HUmXR1T8TEbME+W7Aq59JMYRGtmqt6M4sKnUNAxMIizQfFuFF94
         61Cby69vtoMVTkgMLhgUWmXCZLsBwLOmO0gtD46sdv92QGlRhTpAR4nbDvs8ONyPDWEX
         cGCgoY7vQTKGMzkhyizr60Fgfe+46/Q9aWLG64fk4+U88V4UpNrrT1KTGvpNz4yu96h1
         QvOMg/cd9ENnU1gfIZBjP6ICrLBDFFZl9pvpkWoXrMqUiB1KCHMyuQZJzSYgM8HpV8Eu
         jYJcyxgdLkFNztChZtfKzQ5KwUT9x5Sx7lS7B0/LgYIf6gFe2dZsjhOs7DHqVH5uIrgm
         M3RA==
X-Forwarded-Encrypted: i=1; AJvYcCWcz8qZdv3fqC7kqdnBYUYfaWWo9Z1QVM1eOLfbEWxV3qCSrQ50kto4HT7GL0Js2p1jlclL6+rr/Rlb2pM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6LuKkoW0a+XJ8OAVTXQaamaLYHwFsmBi0r0dRwCNppJxMSiYH
	5JCSufQYFrux9kGYd47GfVkEVbmVRGgvu7uIJTYWxzDx+2CWeyt0vh/a
X-Gm-Gg: ASbGncvQAPi2H7s8zHGvC4J3TGSC7f9UYtyY2KsZ0iTYtEbKp3+MUbYGuwLjXKKb1+P
	pNO3A1Om08oXk4LZjDMbGQN7qG8eyMT45r1pdps2dLBQKpwvYMukNqaeO42PPF6MfqxZC2VcT7m
	kUU18agEQ79kIw/O09NUJIO45GtEhWXMu/9Rc8KMFt2cE11ouxEE23KjdfL2JCEyQh+kNiH40NP
	3I6dWxTiQxyy76jf44UT4wzK9r5vNNW7L/OL+jlP1Q3iyCUI1Ll3nE/bbA9XosuCq+qzsX+HDsx
	p+8vSjxLn1hvLDjOAJo7T9v89yoWfPn6aiik+eF82Ihk5mrXqozBmtw9IoHu
X-Google-Smtp-Source: AGHT+IGUyQ4WvvI8Y54HOBmPIQUwWgTnB7hUofnygJIB5iOp5HSMPI4dclX6JAUQZWevtotWc6mVOA==
X-Received: by 2002:a17:907:9811:b0:ad2:3371:55cd with SMTP id a640c23a62f3a-ad52d46ae67mr221922866b.5.1747383395358;
        Fri, 16 May 2025 01:16:35 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d4f1c90sm1016490a12.12.2025.05.16.01.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 01:16:34 -0700 (PDT)
Message-ID: <e53f54ad-df31-4b1e-a2a5-2d14a138c9eb@gmail.com>
Date: Fri, 16 May 2025 10:16:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250508143818.2574558-1-goran.radni@gmail.com>
 <20250508143818.2574558-5-goran.radni@gmail.com>
 <8e25c2e3-fbc6-4d60-8362-2b0fb3066821@foss.st.com>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <8e25c2e3-fbc6-4d60-8362-2b0fb3066821@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alex

that is great. Thank You!

Best regards
Goran

Alexandre TORGUE wrote:
> Hi Goran
> 
> On 5/8/25 16:38, Goran Rađenović wrote:
>> Add support for Ultratronik's stm32mp157c fly board. This board embeds
>> a STM32MP157c SOC and 1GB of DDR3. Several connections are available on
>> this boards: 2*USB2.0, 1*USB2.0 MiniUSB, Debug UART, 1*UART, 1*USART,
>> SDcard, RJ45, ...
>>
>> This patch enables basic support for a kernel boot - SD-card or eMMC.
>>
>> Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
>>
> 
> Series applied on stm32-next.
> 
> regards
> alex

