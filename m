Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486C926F47D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038610; cv=none; b=toR++LiwVc/Se3iDvW6I8ksNMe6img4LEx3e2iCYW+Q4RVcYB6xYO9HtDg+79gK6d8SvRdH4yJ7II93cxlN+ePZIEmV7uajJrlv4JSgrkr4XMlh/Rfyh6r/RbbaOV+XyUSuBBaNPBW5oKmG3xd63v5zWXDk4zipEaut72miVMp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038610; c=relaxed/simple;
	bh=Pb/efMrKg4+HQ6/2NfMbs7Yh7bxImHsK9yrL75Whraw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KrkFDvioJMkl0qb0aDFYxiHjR/SOB51QYhfa6vrjdSdQ1dv6ueP1CQb0URo/ZcPVAd/tYUZg9pLhdeU3r4skNSiH8qjWyOhjCCCzHdSdi/t1wUt4g4rmtIhOLVuH3UPwGjcnrd1PyOwfrn5TOFtwn3CKs4Q/OCAplo9k3Rqq/Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZtV8bycx; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZtV8bycx"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-606668f8d51so143357eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746038607; x=1746643407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dRXIk2lKOYAihoanpH8QfdOUyxAwjsmIpzrb0u3+vUw=;
        b=ZtV8bycxyMd8Oo2aCtRDHSBqDpXEvKtPS13YV11fWJNa3apDicwVUT33iToiV32Jsk
         L6lPAP8s2Wox4fHf5VRJdPRnjBKE5zZJIQWEpaH/K9OqAM+27TuIbcjfGDRE9GfwfXRy
         FFcDh9TjW6VINlRGFLjV3IZnk9q1NuiZ2UtYtLywb4BxvdtQluuy/XudfUZBbksaHufi
         CEdfGBMLgCQrEgP+/+DTTAQfmm5dlEhQjNi21Tk6jTMCb/tLsBGd8fwi+AVs1VIVSBvk
         anhdXrudaY3V2uzuLn4fDzVwgD/DvVHYpuYm2fsafeNymG2ADng+oIUX7Hta/viBOWPY
         +coA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038607; x=1746643407;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRXIk2lKOYAihoanpH8QfdOUyxAwjsmIpzrb0u3+vUw=;
        b=jef5YGKx3fOcEYf8fR1gESXHbKPWxbKKGhDg4ffmsWmUUi40UUiHulZGCkc/Ldyfl1
         3BxFavFsCUAzYmAOfihmpuu2zBT1aEgpkysgSwDBuMnt4ebcsyl4tfM2f7YeaijE431x
         DgGCmTMSbs+FzhiY9Cowl9Ywxf09uYKmDONANnc/TAnA6BCoDqN+fAHk6l4zOnxVt4uZ
         JKVZ0TJR9fACwLGU2NzcKpBHWGzxqmEPFQUWJjckixc+fVde2ZUX7sKhGHxG6UBwEFBL
         rmfYkwEReYy5FhNyTeA2ld/+3N1cOuJhecKY7e+8xZZu1Mc1XUnzkQKVlCwwIMc1ueZY
         rrtw==
X-Forwarded-Encrypted: i=1; AJvYcCW9Qu0YksdmxpgujkxABP4Y2/2JkZQxAiYzBpnvW+tjfyLVtQ41Jj2w80slqfY+j+6kFohZ57oK46STP38=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1X00peVVHDeeLqocAdWHCPxg6vsiRmXUP9sTPehGi0Bc5S+9b
	UKxdkfvMxzzIKNUg3K9YUQZe/KuQRL+4ic2cVyOaB6rQDfx84CFcxpnsKLukZFk=
X-Gm-Gg: ASbGncsP6g6yNhyfmZwV+OGD8xYzwnbON1+1QOw9R25cEzYCP/05KlD9bBjU15B/auP
	kXN/wMz6TopzjllJYaA1rfmu/GAiIP0AomcUwQHThChOgj9E1zjM8vqZ44+mfCYCSvlIb2E1H47
	G7YZeEsVkjlTcvqf/aQvlr0sA3TMUDt5qwgcaaXI6ZMGeGrYAj9/yNUsgK2m7kkAPDHGXRwysaL
	w4fKTN2R9Eq3a3lElyffjwfKj5azgPbW0GS7mUGB4IPhrzClZf1vNi2SkFk856g1OEsANQUXHzg
	Rpu6TGf92d+5E0n+xDduiV/gzXbdW9K3YZZHCEcTZJfHjXvAt2BIQt0SCLI+ORtndNYHZ+/F+XV
	BnPFTTWzB9mPkY0I=
X-Google-Smtp-Source: AGHT+IFJ7NsTI0Qgevug+avxKfif9V5H032u+ML/0KNagUrHEeVV4ThgLTtzw4bhB4wmXUjY6rLWXA==
X-Received: by 2002:a4a:e843:0:b0:604:99a6:4e90 with SMTP id 006d021491bc7-607df5e5f9amr353602eaf.0.1746038607385;
        Wed, 30 Apr 2025 11:43:27 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:359a:f1e:f988:206a? ([2600:8803:e7e4:1d00:359a:f1e:f988:206a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60686e96dddsm884171eaf.2.2025.04.30.11.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:43:26 -0700 (PDT)
Message-ID: <996aedcb-f4f6-47f1-a818-ac89de0fa459@baylibre.com>
Date: Wed, 30 Apr 2025 13:43:24 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] iio: adc: ad7768-1: add regulator to control VCM
 output
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: andy@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1745605382.git.Jonathan.Santos@analog.com>
 <8a04f8f1e9c14d57b1db2f38a8433a0367c0c9dd.1745605382.git.Jonathan.Santos@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <8a04f8f1e9c14d57b1db2f38a8433a0367c0c9dd.1745605382.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/27/25 7:13 PM, Jonathan Santos wrote:
> The VCM output voltage can be used as a common-mode voltage within the
> amplifier preconditioning circuits external to the AD7768-1.
> 
> This change allows the user to configure VCM output using the regulator
> framework.
> 
> Acked-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---
With the issues that Andy pointed out addressed:

Reviewed-by: David Lechner <dlechner@baylibre.com>

