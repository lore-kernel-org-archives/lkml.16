Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D78296143
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744408634; cv=none; b=bu0wVnPiIzAktMMLD/GP7kXztBrmnL5mFU+rl+1ybKvAQlN0ZyhEtoFM87+Sp39EK5qGERyBMFrcs6SBoyns9+p66yOuIkS+b/jZJDmCa4CgUTArV1rkDNo1iauFTHqBQH3MEecRy8kwv0i6ZMCEi0+L7/5eqoNPTWNvO61IoIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744408634; c=relaxed/simple;
	bh=U/5OSHIm4xidi8WZpyCWBuRqvMGUXBR//iyTnMoWcNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l2W9UNMuk4ntAprlQLb6fxIMMzi00b9H65M69CvcDlvGyU8l6NU7J9/qRT1nFe++LsQYyUoUzXLWrNdTR2FACTgrN1ZNeaS2muqkjckg/VSzrlN6Qd42fW6WqdltfBXh0c5oI3YBwHwRSVeVcxUoApQ6vF4THpzyohYuBl8zKsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M6dr6Jbo; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M6dr6Jbo"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72bceb93f2fso1865853a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744408632; x=1745013432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGxgbzS8SsXJLi5EFV0c4NWHcpynG76/jsFGgon3TKI=;
        b=M6dr6Jbo7oVS8NsgNlCn2EguipsGDH9H50oBIxFxjAr2bh3JnWasNuTJv1AxkFTXfW
         wW9ke+3WzhjlrvUPLqip92zDQnEylA7TyYXpVOAvkvPdrecqxToTDOBBWn3YDsVugdBM
         qjegjBZ6JAfYQ2hb9UwjGJd63z//gobAM2zNdIo1VSUNp7Sb1Z4Y4ekfDo07v4YNC+a8
         NkfDxkhUVLS3VC8rblHwI4hwSHfECa2TrLUY68IbhOQVnc2Rgssn7N5UIeE/1Fqs7Vr1
         13qeE8fs1DYcsdDeqpfehtdJSSNbB0g0Qon9CzeMTWVun/ixOjOwv+/9KKIkWuo7hTHm
         q4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744408632; x=1745013432;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hGxgbzS8SsXJLi5EFV0c4NWHcpynG76/jsFGgon3TKI=;
        b=aREc2DFpKVPdD1rkopwSD2L1Ywx49Qa2jG8b105lyBfJG/OCAD043wUGAN7mJDXJx3
         dgXw46ICYFx6vbYf9blQBVpn98EwBNuyaFti7NzmjI6Aq/rom5QO4sLnsjZlRzBkci/A
         mEuUp0XbUeLhuF4cmDWjyJ+ELIdq9Ibz6J6ycDif4gvuUieYE00dmJqU8lj2LvDH3K/J
         m3sdwxMySumiYowxoV8n5FhmQgwDmbP/3J7UxY4ACRh883j6kEezbe7vlETsKnSwJo1s
         Pj2kJ09S0iIvuPMTp5vZU7urnZp/7WexfTsbOnlDTZM5F2gU6zhiSJEMp0aRFEWOCyno
         qopA==
X-Forwarded-Encrypted: i=1; AJvYcCVVNtS/3fIwi75ltJjj7L5rgifSLsiVDqFv0Tr7kfi4lqe1bTsQwlmNOHHgwgykxau+cIopKerfVH4tcfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3IGX7BARpXMrYAY7Qbts1QvOHv4ZJZg0ahScpXukr6ggjIoUP
	NtoW8NZoPB6Bz8L4PDLwBa7FYvNGBfOVx/RVBwJ8cZR5s6yHjFl7lb2p05igHW0=
X-Gm-Gg: ASbGncsrR7yDemqezk0IFpLuG99U01tEFKbexkYDSMoAqylLcUUMJoWS+QViKVuIX+7
	EZHuOHjjLV0GQYP7TCEunzYHwY+GQ1DU3kN1m35hmK8FxkFZ6YLdV9M/iBrGtY9AyOOLULe037n
	3XyNbMaHiFS8GyhPmn3jUzzsPs8uSS/3gMABb0jTeHjY5PoTdCU391AdlqPLpuyMv8iOiEk7w6P
	nUZc4v4nFLjoNVHHEvzGXqGVRTweiyA6qW8xKeIPsE6HsotP2JYfYvfRutSHJYbsyxEX6Fprnmq
	++Uzopr6w7BQ8jh5ChPg/xhSeq4jslEkGaPPKJp/nWislVfti0dGTVi1fUn5By8Mr0jenKLexEG
	pMtn2zv9SYwBx
X-Google-Smtp-Source: AGHT+IHJ8jsSgRFDtzkrcSxyEZnKdBoL/URDBhhkNCEX69zyJiLizO+9RyTuZoOivQHbrnufomIfTQ==
X-Received: by 2002:a05:6808:17aa:b0:3f9:176a:3958 with SMTP id 5614622812f47-4007bfe4d70mr4807862b6e.11.1744408631784;
        Fri, 11 Apr 2025 14:57:11 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f5b295bsm1073636eaf.35.2025.04.11.14.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 14:57:10 -0700 (PDT)
Message-ID: <3027a9b0-cf4a-4e55-80a7-7f0dd2a008e4@baylibre.com>
Date: Fri, 11 Apr 2025 16:57:08 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/14] dt-bindings: iio: adc: ad7768-1: add
 trigger-sources property
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1744325346.git.Jonathan.Santos@analog.com>
 <35481552e9ce39a24a0257ab001c0bcfea1a23be.1744325346.git.Jonathan.Santos@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <35481552e9ce39a24a0257ab001c0bcfea1a23be.1744325346.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/25 10:56 AM, Jonathan Santos wrote:
> In addition to GPIO synchronization, The AD7768-1 also supports
> synchronization over SPI, which use is recommended when the GPIO
> cannot provide a pulse synchronous with the base MCLK signal. It
> consists of looping back the SYNC_OUT to the SYNC_IN pin and send
> a command via SPI to trigger the synchronization.
> 
> Introduce the 'trigger-sources' property to support SPI-based
> synchronization, along with additional optional entries for the SPI
> offload trigger and the START signal via GPIO3.
> 
> While at it, add description to the interrupts property.
> 
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---

...

> @@ -57,6 +80,15 @@ properties:
>    "#io-channel-cells":
>      const: 1
>  
> +  "#trigger-source-cells":
> +    description: |
> +      Indicates the trigger source type for each entry:
> +      0 = Synchronization GPIO-based trigger
> +      1 = Synchronization device trigger (e.g., another ad7768-1)
> +      2 = GPIO3 pin acting as START signal
> +      3 = DRDY pin acting as SPI offload trigger
> +    const: 1
> +

0 and 1 don't sound like trigger outputs that this ADC is providing, so don't
seem appropriate here. But the SYNC_OUT pin is missing from this list.

Also, outputs could be used to trigger anything, not just SPI offload, so don't
need to mention that.
