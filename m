Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7C51A5BA0
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 20:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738961516; cv=none; b=dtaW5XMSWSs9qtZHSJc9D++hXxAnlRuF4f7bBSXHT5Km333TFW4WmrT5Ai0WDB5V27NUYhSGkvIzaCETqk7NrsYZgjOk+cDSa8+/IAK6V1xbLBxbO7p0mPXOD+yk9v9do6eiqJnjhkhEJ693vkqKJMMu4FXkSXCFTflljlL58Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738961516; c=relaxed/simple;
	bh=RQC+JVcE7oBPPVf6dUb0HAwFqj0zvfI+bVN0sQy4rEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ja3qs4bIZkTYbuAYinay4iXAq3yLtJFrmvOhMAawVjihtDaN43/XydqGFd32zQOmIjskVFcPEa8p1bU15vapQzHReRH4n+6qEW96gmEAE4HfHQ3RVF5ijdkhLcpjxAc2htTvrJHWvuhyh/htwsfI/VCi53edP/IhqjXW6bgEONo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KJUJr+IH; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KJUJr+IH"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3eba347aa6fso1624675b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 12:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738961513; x=1739566313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pnjFJvm/loBhaRB23FVz9WTUd+LVkhO9DwWGD+NvqBM=;
        b=KJUJr+IHYSyQoTrXN/ahoQLMNW/lUDwT83LNjzSswRucUk4U5R71qrUbkT/eJ3THYy
         1FbKrGgZ1KNhDHhUD/oV/cydm4vX6Ti9v7Kn0Sk7IUh/dWih17kTtZiGZudvkrMS/+Qr
         gl31efUR/MI2Tlz71qgF0xvPFHjMJJdqZhtDvY0/JetsJOE9jWK0zV15G3xyuXJ3PwGp
         ptzExX/sUyA5FMz8Q0clV1R/w8bL4XNmSfSIpPPSemkAOH3UEoCvWW7UVyRmlKk3oJIu
         Tgw/PdDZv+6EDD8/io4j7+C9kCutAGm2d++jfIjhvtmkUL1Ltgd999qEHm0tk4nc6Szb
         8dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738961513; x=1739566313;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnjFJvm/loBhaRB23FVz9WTUd+LVkhO9DwWGD+NvqBM=;
        b=D7i0LTNoSmTOxwnntQGCqPiRJXMUeVgNtabDMrXKsfG/ES/YnwkwDHAstXBe6JxH37
         f5/OxIpWyVBttWPSUXujxoC1IFo9BjeEbdYB9c1/Ki9BcomVUcbLr+gXTDeWoaLE0Wq3
         fW6iQBA7Nb0BR7iNnK7cMiLBAAygWZ2jdyf30gdu3b4lipZi9+UJjHC9v9pqV5PD0WsE
         8QqupOEp0V+a06JiESx1IBkV/Hcg+TFIq+nmK2o49jPcP5kBKjV//PWxGn+25KFbvuzz
         MDrhdPiiymvfqHhGwoc5MGSmbKw1/DqNV3teSEi896n7wwR52uZCVGOYubn/rGAGHHZm
         DGZg==
X-Forwarded-Encrypted: i=1; AJvYcCVXhrhF35RE3JXH3J5tM1/7ZNK+diQIL4LCpakW4giRCbCZ1GKuHTBMzuqb9jUEUVull7lQwPWptjFp0BM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPH+b+MIxTZTEa7SgMN/L6pWAzBUefbK+vFGj5SmF8h/Tws1eS
	+77LOOva8qtmhBjTNdh0acPdHoX6TQbPslMxor6dyDiHwqGJN5ysH6dMq5kORj4=
X-Gm-Gg: ASbGncvGLUAFWAuwLKBI+JbWV3m+JK8W5g2t6U7RdFLYnAcbWQISFr0jUXXeo5fER0l
	LlWKBT0XwWVroBvZCktNZuFK0O4aTAvoEPIWSZcMmuwOy3zibDI1cTLqJALDISSxuf84zLtgWDz
	8clv12SjYsti76+slp+V8qMJ6m9wSQRA+lAGmkkob3hCuoMazM460SeFUJVchOUNCpdnNiCG7nS
	QjjDoc6/qJVq8u/5yVCWzfgWXKNl1BZ3CZkCdzZOWsfEpUjBkqDliA9rEtBsQjIX7Z0q1LDbZTA
	dEfOScu46R7fcnpEac5aKQpnplwu1AVN5RWEHzeah1tQteSpF/D8
X-Google-Smtp-Source: AGHT+IGpl71KycImgNCiKqZctD01j5FGAIb/sziDZ4/boUvxRYPV9jOBLrmQqlA8Jq9Uj/SLiNYj8A==
X-Received: by 2002:a05:6808:2024:b0:3f1:ccc5:26cc with SMTP id 5614622812f47-3f3921e8390mr2962591b6e.6.1738961513542;
        Fri, 07 Feb 2025 12:51:53 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af94ec7esm992605a34.31.2025.02.07.12.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 12:51:53 -0800 (PST)
Message-ID: <e30305b0-f997-4287-b3b5-41646d169f34@baylibre.com>
Date: Fri, 7 Feb 2025 14:51:52 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/9] iio: adc: adi-axi-adc: set data format
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, jic23@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
Cc: Nuno Sa <nuno.sa@analog.com>
References: <20250207140918.7814-1-antoniu.miclaus@analog.com>
 <20250207140918.7814-7-antoniu.miclaus@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250207140918.7814-7-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/25 8:09 AM, Antoniu Miclaus wrote:
> Add support for selecting the data format within the AXI ADC ip.
> 
> Add separate complatible string for the custom AD485X IP and implement
> the necessary changes.
> 
> Reviewed-by: Nuno Sa <nuno.sa@analog.com>
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---

...

> @@ -312,6 +324,45 @@ static int axi_adc_interface_type_get(struct iio_backend *back,
>  	return 0;
>  }
>  
> +static int axi_adc_data_size_set(struct iio_backend *back, unsigned int size)

This function only applies to AD485X so would be nice to have _ad485x_ in the
function name.

