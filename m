Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A74320D509
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527112; cv=none; b=QQPJPLcSF7JzNyShcXDu6VoRAMhMg/aa2JCNg06jevJHFkazt8KmVv+7qrycK0C0aK6RVcPFdWRC2pSSQsGdXTpUyDRZcvSiKgYc9v/Lv5NaGn783hiIERTLXg3bZmTSz9XVJXAhw3HOBYqr8y8IuQdsgwFkbom0x6B/4SAQVMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527112; c=relaxed/simple;
	bh=aGC9dm6KUtiiQ68RVH7jvL+r6CQi36l1rZPcfEThsok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhwWKx4ANT9M1SntsNHd64S2YQAK2RKQMUrwjaeLEDJHaHxkfDQZOuCHPzm4CVDjicPirSrLdaJSjgcpod5SUlcyR6ZIwbGbH3NxktJkL+WRS0gMu0DcNk7c3l12vNHeQofehIcn9cthPGVzFi2KmlTXix+WhEGD5w1yR07MYsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dnv9sZxA; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dnv9sZxA"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3fbaa18b810so1809167b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743527110; x=1744131910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2GHNg+GZR1xh3puiq8oEcYCi8euQPRHec8+8+bjsNQ0=;
        b=dnv9sZxA4Fbtq7LdaMS4xRm7tsqaxKj4NjytCh5QzWIELI1bthtiByDtOlxGXjZkyT
         yK9E05l3/Z3h7AmEFCDtZfyCdsPBqW/pZD9OVUJ76GyzwDLQXG59b+FZTDszw1Ot4TpJ
         2nBAFaTuJwKTtoTWDQ2lguABp7ZieQ4pKJzlDFrZ/5AMW/zGrMB4io4Gg8ZALMSvvibJ
         0WZFuHR6cKu6BpR36PcZhRnxujqcKVfgLCMqzE7BMJ4/fpzy4YYkLlYUP5Pa9P1GthxH
         XybmCVqHldrPaasUoLN+N2oM+aMU4a2p8/9raXDLwznu2+6hkhVy9HJJY5EmibWbZ9W9
         zdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743527110; x=1744131910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2GHNg+GZR1xh3puiq8oEcYCi8euQPRHec8+8+bjsNQ0=;
        b=N88U2HeEFCvKqDI4VdtmEy2D8zS3A5K1yqPAwWrd7GcdIHcyiW0rRLUiZ+FlOYQxkT
         daDJP790DBk+8hf9iqEKVL0W2u9kMiFSHJWEDnHG8u8TkHN10C26nAt9Hv+QoukUH20u
         kH2jPo5nDLGCvp2Xy9iH+9zpOAqHsEbzc9iD6FAiNY0wZwGcJwCV8gXe2NU+xHBBLSxi
         QVTgQ8bQwCktL7NOE0KcVuKCi+ZBTSMUBaaCJyIa/nueYJsBh7bbh46v9Hju4s0uTKls
         maVtRWfWWuS48D6OWw+U9rVi+JU70j4BE/tETq6tu93tWHMifqIyNakeyQLac7OxNZoy
         OIbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYqql3BMcCxswytxrXbAYNTtpQCvmuKoAs2iOoghWQtMsJhDpA330qcLK/ld+VqpVrdePh4Uynh5UipnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YysE2aRi8bF4VUP6fznJoX7oD5TpomW6ct3yVX5waSLheAU2o2Q
	oRAaLw8ELxVY/dKw2oDs3ZKLZFKOggkdubwoqShMnzIcjBiQC54ujQOEkzlMMsM=
X-Gm-Gg: ASbGncuCQeJI7BAOQL3qK2ygDw//DpUzEjyYRkGI86f5ZZSVAbaiDrD81N+2wos3e3Q
	R9nWwfB1SLkAZZ796sDP7yhAl1dB05wTl4c+4s2yZp9C/wYQMleohyQB7JapO6tAhzYJe8lrPHD
	EDq3gJ8Kxax0LqcFC7G9LS/or42PbeQo/nuouWCMjMlE1+92J1D+Z1NGKJWmSED837SmArFIH2G
	cZr50jnqI9LjrNJyPJXuZP5a2t83UmSoxmhfWzlVFZucmN5wljXaU2fT6rV3vmHokV7tjFbDIva
	uIVsCd+l/walUKSymnhBpEdN1PNakC6SWAbuhaaaQ8SmqFy+fgkcAz7VPN5QDLUH6zaIVJmHq6F
	t1b5JtA==
X-Google-Smtp-Source: AGHT+IH8zT9NfafTp39gA7w1GuQhxmWEGB+Q5BcMBLrZm7s6gO5+wURUfgUr3IvdChYZ47bg36HrsQ==
X-Received: by 2002:a05:6808:151e:b0:3fc:11a6:7433 with SMTP id 5614622812f47-3ff0f637b5bmr6831543b6e.36.1743527110260;
        Tue, 01 Apr 2025 10:05:10 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ff051aaf60sm2022138b6e.28.2025.04.01.10.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 10:05:08 -0700 (PDT)
Message-ID: <df59accd-76da-43bf-b52f-8ef5de0db060@baylibre.com>
Date: Tue, 1 Apr 2025 12:05:06 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/17] iio: adc: ad7768-1: replace manual attribute
 declaration
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, lgirdwood@gmail.com, broonie@kernel.org,
 marcelo.schmitt1@gmail.com, jonath4nns@gmail.com
References: <cover.1741268122.git.Jonathan.Santos@analog.com>
 <6d429bf18851e9e423e90252d351db550b2da536.1741268122.git.Jonathan.Santos@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <6d429bf18851e9e423e90252d351db550b2da536.1741268122.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/6/25 3:04 PM, Jonathan Santos wrote:
> Use read_avail callback from struct iio_info to replace the manual
> declaration of sampling_frequency_available attribute.
> 
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

