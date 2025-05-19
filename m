Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31661284665
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667729; cv=none; b=opuelffb90vYRBdgadSGXEZogvUS1uzpG7UG3FvPYmxQVHstuckC3YnurASWjjelBK3RSwW6PnJWLbUQqRQgjyTVDVHn1gBNSIiYxuD2lG72+9f0k/kWFa9Qwa/DB66K8uV4eFuB4Gw/qJ4/DNPUlfcAdUSYCSbY56bvdupwC6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667729; c=relaxed/simple;
	bh=eqHHv6cti0ZoDTZXOD4YVGuzTI266dWkCvmxsUpKywE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=F8S4doivXw3N9qzVaTtgP47EUrptkEd6OsfiNRKW9ja4x43ptYScA+YOXWp0K29FO9ygOUPmgCL47WRqKPJNDZZEWRxS6f0cx6kJh04By2Zry/sCDMqfHHfBetu4RTKaTGarqO4IevIfRXa6xNHRMPL35Ju7YXOgs4rRtnIFZ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3N74rHI9; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3N74rHI9"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c13802133so1733588a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747667725; x=1748272525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EUxqgOyDxcOI5g2n2V0wPOdVEtNRAkky1kpuk2R3KsM=;
        b=3N74rHI9bZMFUmqk4wPg6D8KNYPsIXweGbinoJ1wCl/eJ5xK6Cax8Bx5luhpMXk8Rs
         iWtp6wNU6o0GdE3EOf8sh4JgZmfSgBJmzv9mf6ZzzZFYCUhHkt9aqNU19sdSJwM4SUKJ
         0iRw0r2LieM4WnItX1C4Wq3ZDqwEiESAY3r3orql+lcSB8SjXQl4firweNIlT0SVgppw
         D165QlxZpsBosommKPWZwKAKz/wzP5UsCuY30d5wLlC1cbdp3fj1/JxdsSPEWrekbVnK
         96lRaIm86TLvQBGv8nH4PEH3Il7PhC07F+ey1+wkSkLsz6Ag38OiMmh3RuXxcx4mEI5s
         uHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747667725; x=1748272525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EUxqgOyDxcOI5g2n2V0wPOdVEtNRAkky1kpuk2R3KsM=;
        b=YK7WRLhYUaxfro4Njcg01wgkyIjRCVGkseXSsCOlawN3A5rm/t55Br6YCLOTPm0EvV
         t9WWgpfhDfer1vhC2HP4fE8xPmg/vax6Yt3/vZNSJhP1gwlX7H0X4+0kAX++ZRipqmP2
         WTgkVqG6WZCVynAhMWFwu0LEbiOPHTDLw1HpQCBgmyqdi7dZfJJrRjvi+GRIDyTPAMwu
         qVxTsfBcDR89d8YG0C7MgqagWFOIQQ/ybnonha7WIZRtsynMV/oT1P6FFZpS45t0WF3f
         1pnqyClG57Ldyz63Of932IJEUjsy95T6+wSIk9Bgj6kdgn7AOQsuvmG1dqSVZwxs7I8N
         kyIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpnmLCs9dSn6G27zNpS5uhJXgyaqcljgm4FhNzzbuc1ba/a9WogeX+r3r2Di6huXOe4Iq8eAgW5PIW1lc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo5LBY5PlmN5BRYfFD1qJyE0ZcEHttHo/+oKu5bMV7AjNWs/g/
	9bZbo06QXi6DW6lj27ilbHng81JTshdPDhq+bg1pmRuiA/XCvns/oT55Sj6GUnJY29o=
X-Gm-Gg: ASbGncvdFMebYTfWyoQMxC73B8PH7Hqvqtnk7jgh3xkDoe+y+LYw2ceVv6QZ7CBNRMZ
	gNJDdWX8seBEKf06OcCjEp1BqhHHLNuRY1KSbvVO6tobahiIJvL2qch8remr99wB2V6m1ctw//h
	OuhscLRdBj3wlFiTnSXKbg1Cunh4NdPA5C6pfR9YxEQo+bZImUauYf7aYiK43Wj3+ESLyZdbNx0
	ii9rWJNghUckz5ynMdumO98iFARvn+wdp9cPF07mEIPYxzrBTW4Zw7in39RQ2DrrfDd1FPVkB5W
	ZNcXz0BPkfJOwKHsqcQZUeOWEvyaDC8ZswL5nGmvykLfo4rsqsHizuA8aqq7rtbl/qbAaqpPHZQ
	iME80nQPEnaukYOBqT5DXBzzGtw==
X-Google-Smtp-Source: AGHT+IE1LENky16XA/1nxfLz2cNQEDM+x/IwIthIkWz/+026QRc8Sk+1CMJx3x06Nx78du+/5N0GsA==
X-Received: by 2002:a05:6871:2208:b0:2d9:3868:b324 with SMTP id 586e51a60fabf-2e3c8384405mr7303802fac.23.1747667723862;
        Mon, 19 May 2025 08:15:23 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5? ([2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e3c060e33esm1788670fac.8.2025.05.19.08.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 08:15:23 -0700 (PDT)
Message-ID: <9cf04a91-7763-41d1-b406-014b1b5f0535@baylibre.com>
Date: Mon, 19 May 2025 10:15:20 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] iio: adc: ad4851: ad4851_set_oversampling_ratio
 parameters update
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
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250519140220.81489-1-pop.ioan-daniel@analog.com>
 <20250519140220.81489-2-pop.ioan-daniel@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250519140220.81489-2-pop.ioan-daniel@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/19/25 9:02 AM, Pop Ioan Daniel wrote:
> Remove chan parameter from ad4851_set_oversampling_ratio parameters
> list.

Commit messages should explain _why_ we should make this change.
In this case, because the parameter is unused.

> 
> Signed-off-by: Pop Ioan Daniel <pop.ioan-daniel@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

