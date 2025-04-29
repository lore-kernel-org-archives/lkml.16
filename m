Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACC1218AA5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745942981; cv=none; b=qJ3HD9TcCORbo5FpIfSySbpw9IxlWRjyCEs0XOlk1WqrW6obetpTQDVpznRp2rtyvjRCEAQQfT4X0i+btZIvkXpPI9FXkOY4KROq+BZ55LA2+VE5SbnASAhtNXhCHrELR5YmuWoMWQh3EyjNnWA8df3wPIM1tikbpJ9ISlUBNLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745942981; c=relaxed/simple;
	bh=FeW6NZZnT2JkGeFcJl16D+GN8m8aywarupY1yGS4RME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=by4RPshx1qG/sgDSeGHTnDr6RokJh9pTueVQXxoM0Zbk1hA57WEhFHmDgSOMaw998Y2xsE8GWXXy/rZRq35Gxla/68fA8FxD8jbZerf21Ll+5sSa+mZD9qQorUepb/AlH0dnEP6VduKKuVNu/U6iAy1anq09IVsasqbgJbK15j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vmmFbF/E; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vmmFbF/E"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-601a8b6c133so3570216eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745942978; x=1746547778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twUw4qQlTNSkf05OsZKa256sL/YQOX+GI9IF4/pR0G8=;
        b=vmmFbF/E759tZZxvnHZKNhcoRUklkjm2pWpB5sQF4glGpSXwgslTEmvb6Lu19HMWIE
         u+4YBwsFk39544OssDegMe+Xzo13JyRU+pHThRYNEQxVMDFmrABXCilp1jcBzEoAV3PA
         NoAT8ifrUqSJPCXNBnPoKpE8xvIRnSUCOeDBxOALrXAt6UVdtglJsKe146DoQi05pW0I
         N7LCbXGA5HxsiRL9wRAD64lo0ye6kETcsREQWv7/G0x7adiV7hA7mFPswTusQ08yC6Xi
         3P/5+G2ju42ZFrFirJiutS/sBfwp0czUE+oOzvUmT7hqOAXB1IyQF3VHDs24CBERolqb
         PM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745942978; x=1746547778;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twUw4qQlTNSkf05OsZKa256sL/YQOX+GI9IF4/pR0G8=;
        b=dqJz4LzrM0W9wgaHsV4Ol6+ExhWhvVAtv2RaTFtPYIs3IeRxXBM3BdXAAKhGnTadvw
         R0bn1t+rwATa+2sQ/Nfich5tksO4ljjV90vpSKMu8p2GMUAzwbe+wSU5/JEnmSTy58aB
         UK9kp2mZ79dMsH18MXC47MF8ObrprwlhnpaKbcel/lZgD19Y/eGo1lzahidoNeT9L72Z
         1pMw3nVOwQCh/KvPvJgom+Ip1vrDu5IAoeDCsj2uR26phjuX3ZbBQng4YdMAQ2fZ68ef
         g/Z+FUObElMx7urULYyXU4cp7R9NgW8jkW4rD/vgYqzjEoC3twvv3w0Q9IQ7pq4e90ht
         HMcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvTtITPAJJlNwjcRoyY2IHCQMk7PcgGo9U56MQJFPzZS9Any7QhC0yeRKHEUkJdDwCkEDtXob9OM/sLSU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz5PqkN4JC7gh7cJkvjO2c9kSBq7PUO8Wf+dE/5qx4mZrw9D3r
	7KXCXw+6sz6yA8HAOr+tOKDQtUfAntEc5LCmuT8062FRXOgGt5nYF1Z/Y4HKo+c=
X-Gm-Gg: ASbGncv6AfE3a0CrzfG9uIzXWqVMA4pgEVMCJsq8YuyzRxl3pjXjYxEUzsf5+crCbdZ
	SU40cMIq5Gil/FANoL9hSCd5GmqO2wG9GBzgLn6TTGJfH8cdV9perEJ7QPzFzkA0ntQSca/CTRq
	d7SXteeaUjTsIz9bmW6YCrQVl5iXmOZKM9cYtKJMzCyhupdAkpZczUu9o8lkCyVIhuCAjxSUqWy
	Vk1IE3OP6YneR7/kAuuGsw0sax37XnXm9gE64vkKK3jsRBJQXtQyMENpHQL4GvBmC62Ueno29WG
	HMf/6fzCFNUyg5ogBeb0bVN014ttiDyOZSoh5GaSI4Ai6N9ajuGR4rBNW45+G9y0B29E0DoB6hS
	NoTCH7jtqJRc6sKgZMczv4YrqcSsE
X-Google-Smtp-Source: AGHT+IEXP2190VLgPbiSUaZigtpyKTyEjuDG0U+ihI7tQn9U1hHD4Bc4d5pI1WBD9C2EynCfn48IMQ==
X-Received: by 2002:a05:6871:d106:b0:2d8:957a:5166 with SMTP id 586e51a60fabf-2da461bd37dmr2200377fac.4.1745942978120;
        Tue, 29 Apr 2025 09:09:38 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6? ([2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7308b0f3f26sm341853a34.2.2025.04.29.09.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 09:09:37 -0700 (PDT)
Message-ID: <00fdf173-ac7f-48bd-be81-5d41351e99bd@baylibre.com>
Date: Tue, 29 Apr 2025 11:09:36 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: iio: adc: add NCT7201 ADCs
To: Krzysztof Kozlowski <krzk@kernel.org>, Eason Yang <j2anfernee@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nuno.sa@analog.com, javier.carrasco.cruz@gmail.com,
 tgamblin@baylibre.com, olivier.moysan@foss.st.com, alisadariana@gmail.com,
 gstols@baylibre.com, antoniu.miclaus@analog.com, eblanc@baylibre.com,
 andriy.shevchenko@linux.intel.com, matteomartelli3@gmail.com,
 marcelo.schmitt@analog.com, chanh@os.amperecomputing.com, KWLIU@nuvoton.com,
 yhyang2@nuvoton.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250429025505.3278016-1-j2anfernee@gmail.com>
 <20250429025505.3278016-2-j2anfernee@gmail.com>
 <20250429-sensible-subtle-cobra-badedb@kuoka>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250429-sensible-subtle-cobra-badedb@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/25 2:36 AM, Krzysztof Kozlowski wrote:
> On Tue, Apr 29, 2025 at 10:55:04AM GMT, Eason Yang wrote:
>> Add a binding specification for the Nuvoton NCT7201/NCT7202 up to 12-bit
>> ADCs with I2C interface.
>>
>> Signed-off-by: Eason Yang <j2anfernee@gmail.com>
>> Reviewed-by: Krzysztof Kozlowski <krzk+dt@kernel.org>
> 
> NAK
> 
> This never happened. Don't add fake tags.
> 
> Best regards,
> Krzysztof
> 

Then who send these messages? :-p

https://lore.kernel.org/all/7f2d4894-788e-4ba7-bbfc-67ac0903b6fb@kernel.org/
https://lore.kernel.org/all/20250417-acoustic-ambrosial-mosquito-9d75f4@shite/
