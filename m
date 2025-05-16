Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966F2189906
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407991; cv=none; b=ozpxDmm2qDWel8UgO2b4RPoW1GNB1WftzqYcU1xEc0GKkfM+WG2AHHioqOrEmtpSTLszpRAN2A8XwHOn2vc5016ILBO56HFiWqnxbBVyvy0PC2aDtJfOHn2f/gO3koPiylXggsd6xOEi+3F0bWtlkxDVooOxWuiPbOufxuSR05M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407991; c=relaxed/simple;
	bh=EwgaVrrNvERrVo6hXlK0vZlvt3rGO0/7YjrZNN42uI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uICxh7Yqj8tgSK6m4Hyvd19MzSPUWYZFs1cNpn4uVebxGxWMz6tZjoRsH1hsOZU8U6NJ9Z7uwS47jPZFXuJKOclT8BuYFryHbU4r6ASd0CRrgMfPxUT9DBgRRA9pnVtYmp5zKIcWWDkizFMibMxozBa/5vHlq0P5oTk5ApqCGYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=H6lfXKCX; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H6lfXKCX"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-400fa6b3012so2284211b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747407988; x=1748012788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L+mgC+9iYaOnkRUrISmU6CJ9rOcEfvgTcCvItE6s9B4=;
        b=H6lfXKCX16A/wxVj4/NqMWKAXL23Gnb4H+j1NqaZWJge5SgYA42vKEN2BE4bICwOKN
         XYm0jBqSh5TATXpCLAEcRULAZ0gGt/iWMFpWXSNa1hKGSR+cI+As6jqmjWDEiKj2N+lQ
         TIgiNpMi3KLMJpl8QKayeC28v2MW+t6hgDB1VixYaC7fEwAFZiR28bZepbDEuqp0LWoO
         RAVD9k2VCwxFJFowGwxv1zmiw0joyqCpm7hI5X6CxmHLJtKxHpvSDNooWftnMAqBF1LX
         nVvU3WJTbX0EQWlPG8lJDOtxNqOIwJmuopsNbAnYAQlPJxuEuu9SB1M87BR9DJJoaG4/
         NPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747407988; x=1748012788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L+mgC+9iYaOnkRUrISmU6CJ9rOcEfvgTcCvItE6s9B4=;
        b=qIBwIXiizyv6JxKXtp0mqJPCzI2utMgUBpbd+FNhTHcWb0poErhNKWqcecweirNnFZ
         oiHmTJgrnRflO2wLAKnby8SmPvwDzC3efyfmco+9SkJMB57gAabtYrFUMJdQReQ6v9BH
         mwIFkBycx6kaj3F0+8rM05GKx7uPvCKMscND5j3C43oW+4golXgwCBN8Nb3MskwCVQt3
         W7GT2b10E1fvWN0x32mYfC+/vnautIHJAltLizBjN2IK8gcZ8BtICB0J21zbjicdE3s5
         noV+rmJNLbvzTzKU2WdoQKYBF6/Vtw5Kd88xF0qCluis6cyodng8fGC5heFow0b4cVA0
         D0cg==
X-Forwarded-Encrypted: i=1; AJvYcCWA/S91QT1frENW3plEegnWic/Fv/hrs0ek1LC+cWm9qjwgYSNAo0+heFFEjVo3U4MFYkhx1oxhzvMjcsk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza/Q+z3KuKu++HIqQ/W7draVRk+uZNvMpBqfGOG9q7NKHkMT9x
	eVq4V+bn7vJSLsqZkrRJ7Qc0EU30OW/FlC0qEo9c78voB7Pu3ApMQFWOUH503o/2pcw=
X-Gm-Gg: ASbGncuiQUfRZXn4+RYQEpo/L9U+/iEY4KK0S+IT5xb+0baj1FhmoTyICV4LvnjhXGR
	Q/OIAgzadLgSKdwsrkogGa9x9J/JeyZXlsOdRLSjkAMEtb3AV80CPvp1n9T/IYZvlxOXjhKbZ6n
	1RaTm/A2CThrqrl2Lcsy/HRTqrYfylPmE98QCN/7Wf4qpPTUnRHwhZNf+J67LEV1VLNNTU6l+M3
	jXFcMitYHtKFAQESHjtvYiy0hSVY3aic3Ttid6E+lv4mB6aIQ7Pa0Oa3lx3+i7CLCQ9pn06W4+y
	IPyBHMJgiX5bNublFrAsnEehshorTRAcjfXZYpDstqviAL/QbQqJXOM+DBRLkcjkrcU4czqlFTH
	UqptTYjroBX+StjL0w+4JPBu5LLGJYbjmEcCQ
X-Google-Smtp-Source: AGHT+IGwybJrLLcmMkITpWBEXTSEnwjYmONKAkl8G2GKlvK5oZqmeJ3ESVy2dHunVHsEPZoATzAbkg==
X-Received: by 2002:a05:6808:1452:b0:3f3:d699:e1a8 with SMTP id 5614622812f47-404cd743b0fmr4674851b6e.13.1747407988522;
        Fri, 16 May 2025 08:06:28 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d2f:9b08:7c22:3090? ([2600:8803:e7e4:1d00:d2f:9b08:7c22:3090])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-609f3000be0sm419083eaf.26.2025.05.16.08.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 08:06:28 -0700 (PDT)
Message-ID: <6f764086-5644-44c3-be29-c16b7eddb6b8@baylibre.com>
Date: Fri, 16 May 2025 10:06:26 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] iio: adc: adi-axi-adc: add
 axi_adc_oversampling_ratio_set
To: Pop Ioan Daniel <pop.ioan-daniel@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250516105810.3028541-1-pop.ioan-daniel@analog.com>
 <20250516105810.3028541-3-pop.ioan-daniel@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250516105810.3028541-3-pop.ioan-daniel@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/25 5:58 AM, Pop Ioan Daniel wrote:
> Add support for setting decimation rate.
> 
> Signed-off-by: Pop Ioan Daniel <pop.ioan-daniel@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

