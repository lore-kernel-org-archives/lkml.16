Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E29F1D63F7
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739258436; cv=none; b=UC5Dnb5gPDS5XdFKg1we6/3ttMbNwJ1bucXhoh52bKL2pBW4Xxw5YsCzUIK7VGTYcTkfa4xlii1joDAvexZTP1Ah/20H2oxGz1EMdNYPmrxRKa3mGeN+1NwVIyTZf7/RPjsLY22SWs7SZzu+SGwHz+HOBhG+cF0rVFzKGsMjJxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739258436; c=relaxed/simple;
	bh=3T4SyJt1uJ5QNowHppDWOJFB0u5XdrpIBBybBgEYhX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNc3cz1T0hU4xW2esuYtGo8rQwuKz5F7xbyWz/duGXaXVX3mrD1tp43pYnTXGa45lVz5PfyG+db/jvY0CPVqpy4p6hkcnbudjmfvCoCNEhurZ/X+ZDWKCY3yXP2z9vRQ/nhsni08+HnXsS6f0LlAAQXNdsOt7zoyIWCR63J4hvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TinooU/U; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TinooU/U"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439554db49dso1313545e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739258433; x=1739863233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mQFUnUHeMNpMv6VttQdjXX85m0xWz9+RSQYykuUCabk=;
        b=TinooU/U4if34asKIQB5dr4R7Tbl2qNXDSCI53zhVLCDtmd53gMJyVI2xTZ+SzYa/F
         e1uwfPplqpe0CMxGxmYma/ddkCexcWav4LZtmqiN2tSqyjw7ubaLpcJPhXNTQ2/q2Et1
         DZ6nxvY/sSm98zbSQHb75olenEOfkYmZJG2gtNcehKBszQdtg+GRErXgKv3eGHFRRqWI
         Mye5HJK/zGQpWvfziFkHkm208tSXvJFrFJHf4g0TsQViguu2/It3LIVmDtYdd7KyZF4m
         P28tkHZZ7EBKKU9l0oorm23drbRRAlOX7wCsfYQ7CVk9iwfAQE2iCJB9SbU8e81zK3T5
         1qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739258433; x=1739863233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQFUnUHeMNpMv6VttQdjXX85m0xWz9+RSQYykuUCabk=;
        b=CytnJoM2RFBJWWivWwdZioGTHohSmbEst7jU8BT2fonPK5AjtJo1erX4KHvhoY1Kph
         z9KEIIBqRg/74nd5suyffnF+wmII0w56CSUKnpdsICaJy/A4bK2ce0+wafdgDmt7TR3+
         DzJW8GPrK0rT/5MCgdJuB9Jscia0Xmr1WCv8790t6u4ZWnCTwOAsFuu+iIPoQrU4orpd
         LcACXobZI4ld5AwpfM2UJFspGZp9/AL2bTyhEsPxOFnR4CywbeaP5OWASVjAQAc8rcFu
         751/sztOAzzLpGQ+Srobit9/FB+ftwgdIaZjk1f0AZ4Fh0n+RlXlsX2QoBpY96+Hv3nZ
         S6zg==
X-Forwarded-Encrypted: i=1; AJvYcCWZotKm8DdV/6tZTW0Q6qzTucrJl/Xsui5/iLS5NorTg1gqiX+P1pkNEdiLKUKr/safFUeiAw+u2qZc6xk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0MzjhkRiI2utY+MuFL6HwPq6mDEDPd74DfhRhoysok1pl3eRD
	liyVgCFBbfLJqG8+KmQuhdkVtBE2KlaabTfQggWLc6eJnvxY6oZbU+JWLdB6YMM=
X-Gm-Gg: ASbGncvJ+Ti+j+f9SbN6+dmKSpcsfNiKFdDDrY9i+RI9FTPDTBgLXKrKN3HzmdycznW
	Pe2FMbZj053ZxBItpqkbGr0D4CC6DAAApLCfWFK+IEwfw1yKTUeBmK0fL1J1D603/OSL09M4H2G
	7VHFXR0uWnphKgUAiRypU389Mjo4wYYJvJsqfh0k7MgsCb7qkR7YSYTU1iIBWZ5gXs/L1SDRHcP
	rENXd/HA2WVRxfd7JnrgOOIlOmBOOlFJU3l7hJdmp36QYXoCOCPCpBQHJ+Sxn4fuOuEdC+zHt7H
	ENnt2qJfF1dAggvBczGjfZ+R
X-Google-Smtp-Source: AGHT+IFp0nNIyJ5DPxY3OoV2rGeyCRv1zSNTUe6xL6Z4n2RW40p5qn9RQa0e8xd+y7CFvq7/uzBdgw==
X-Received: by 2002:a05:600c:3d89:b0:439:4bcb:9627 with SMTP id 5b1f17b1804b1-4394bcb9824mr29222305e9.19.1739258433513;
        Mon, 10 Feb 2025 23:20:33 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7d4sm205464155e9.10.2025.02.10.23.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 23:20:32 -0800 (PST)
Message-ID: <e5458a0e-528f-44ec-a0f0-543472ad3b85@linaro.org>
Date: Tue, 11 Feb 2025 07:20:30 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for
 Quad Input Page Program
To: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250211063028.382169-1-linchengming884@gmail.com>
 <20250211063028.382169-2-linchengming884@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250211063028.382169-2-linchengming884@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Haven't checked the actual bit, but I trust you you verified thoroughly.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

On 2/11/25 6:30 AM, Cheng Ming Lin wrote:
>  		.fixup_flags = SPI_NOR_4B_OPCODES,
> +		.fixups = &macronix_qpp4b_fixups,

For your next patch that'll drop the redundant flash info fields, you
can drop SPI_NOR_4B_OPCODES as well if these flashes define the 4bait
sfdp table.
