Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A40A252901
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744903746; cv=none; b=L+pLPhFbjlUAs8IO6Xln2rORPYwfg+jZaD1dd2JIm4Kk6VnQhhSXORKjCSZhmP7zcNi87ybLOFqM+xnLqaic6QrRu2neF9TjRk8sAUo7OFwX/RTzPp26TA0oGRMQKKsEml+07bn4useIOrIRi+UR5cPy4Dz8k785aQDnJg0bg1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744903746; c=relaxed/simple;
	bh=0gB/pwrbPQGErQqmcgc3iIvczx2VIEh9MQ+dCK6zl94=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NwpGTYs3gJVL8QaRFQYNjBHSCY/4jY2QEMGufwgxv82fWp1MX5ENnDSFfSdCFdkk34S4SGf5x6oEsQBRf1kC31Bbl884TvkNbNagoGhdONBTaPjbfzAGKxiy7lwupg2vJd6Hribf7CwY+n1Z+DoE1Qkjgy26cIFK+5B34lJY0UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=o43DZNAR; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="o43DZNAR"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6042c04fd18so418353eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744903743; x=1745508543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n/z01Qthe3TkovfBZc3mh75wCgUL0F0cKT48OArWJrc=;
        b=o43DZNAR1G9Iv+pWAeqOP/UnO1uUQCKq4zwMsyNjqNCmGRTNM8VpUg0tJ28PG4qyUS
         8NRSFq/pf9jEJseuWy5n7hIx8I2FC+8du1s0CXFjYpHBi6fyxoyBTN8Qeb3LvpVBJZGk
         qocLoCRpciVSjRVOD+MczVBaSRSB70c+bFiw4P2h5WYji8a7oUZ0oU9XWuxeCju8B3xd
         cKBvbA5+TiuG36pUReyrTFTHbBB76ZR2F15Un6uA7vgtbtWUjEtMf8PYZy9EoJNpJSQX
         RiXRsXo2/g/Abm5z+X4U991gXxRXSHgXn8xAyNsVcoKOGpTFen4bsfE4AOrzjT1AAReM
         eOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903743; x=1745508543;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/z01Qthe3TkovfBZc3mh75wCgUL0F0cKT48OArWJrc=;
        b=SmSUHVJ8CPxQm8mKnL6tua081Xa/jwwIew8hnVX7kE59FK5o37ur7qHO6jnv2SSYTP
         DAJv5je1rxQqgUVKdXSeasHE9Dj13CXEj6x84QmOikaWooUDftU39KFvdzHC0J54ei+p
         yq8zFtDgr2KsLOSqo2/Jm+hj7ERei0cAgS011LvBwuO6I3duzf2996KZQN+w+FCTHNQI
         c0VQUpzyikTRsmkxwjKCXbGZfJpewGMLLp2MXx7Zc81MEURlVuelcQnooZWQbHu3yKFM
         SXUjvHpEmgXhG9j8osShreaQcAtrvSpRkbm/lrRkYBQ08svtv8xY+e4ak+ZpsHX1hvKw
         GA+w==
X-Forwarded-Encrypted: i=1; AJvYcCXzFJQeEnmuUteiw87nVGyr+WLpXwCFPqAk3y7nh7K9J5YRCOVT+Omk720JABB6yg1R3rp+NfIvzp/umwI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9YRx8IFNRDlLnFZ87ee/ViFDEuKq7TGi3EInPBpG2anNZf1C
	D5E857RHgrzgcBnMcjHvt5xa2aiXlDJr5vloYYmM6t/BeGbdAuqJWBtggjvK4kA=
X-Gm-Gg: ASbGncu9AmtiF5/z1B+VJ02+5aDjuDII70aRcPqPZ3eRusBMGPVdzq72/fI6jqX+lkZ
	8hKgEH7hlyf/B9LvxRjEFnB2P7tvCCMHTRCkg1KdFFS8UFPe5sihGoSro71I4GHLNGvy9y99tgr
	WcNlW8rZ7+PelX7pQTTHrxQrCMW5WicO4kH9awJC52bMaZ05H2GfHB+V96DLT24gctb9yzDxOXN
	TxOkBzwtjws6GcFJ5Asy+FPBYT6v0t7EA1Vhba+s5rir8I8ufBitzYcDWLNg8ynDWQqXtVQZOqY
	y/6GBXf92UbJRM3lbctArq/qXYVkDCVi+oRNSjXTynmB6AlV/hqJ5dyzKWyIFDcoKZ8swCdYQjH
	66GvAhz5KeE9CcHVtVQ==
X-Google-Smtp-Source: AGHT+IFOBWtQneAONCr2U2SOb9RBNnXfC2q7v7nNNBJo664tswwBOhWsnSsu0vdpPGeutlf06qG6Bg==
X-Received: by 2002:a05:6820:1993:b0:603:f191:a93c with SMTP id 006d021491bc7-604a9360a55mr3503816eaf.6.1744903743664;
        Thu, 17 Apr 2025 08:29:03 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-604a5c66b95sm819465eaf.38.2025.04.17.08.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 08:29:03 -0700 (PDT)
Message-ID: <85e51ff2-4fe8-45a2-9993-2faf4afa9665@baylibre.com>
Date: Thu, 17 Apr 2025 10:29:02 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] spi: Introduce and use spi_bpw_to_bytes()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250417151958.490174-1-andriy.shevchenko@linux.intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250417151958.490174-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/25 10:17 AM, Andy Shevchenko wrote:
> Recently in the discussion with David the idea of having
> a common helper popped up. The helper converts the given
> bits per word to bytes. The result will always be power-of-two
> (e.g. for 37 bits it returns 8 bytes) or 0 for 0 input.
> More details are in the respective code comment.
> 
> This mini-series introduces it and replaces current users
> under drivers/spi and we expect more (and possibly some
> lurking in other subsystems).
> 
> Mark, if you okay with the idea, please, make this to be
> an immutable branch or tag for others to pull.
> 
> In v2:
> - improved examples in the code comment and commit message (David)

With the typos fixed:

Reviewed-by: David Lechner <dlechner@baylibre.com>

