Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB16522422C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829043; cv=none; b=t0qrMKjSSIv1kMowE2+lDsL7nOxrNVCZwAb29qtQFUSVzHoBDTWqZDaahsp1e9Il+xyoWM08UfEmG3jUpIR69DKK9N8Ko7dyzlUF1q0woDbGWY8b/Hxd5QqsRx93e2866TKlRQXKrnJCgkxw6gQ2atdIcv2uZPZs+eqLXSX46HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829043; c=relaxed/simple;
	bh=C8cKwh7uzGJstEM3SOQj91jM6awnax2SblmAOFtgeBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wopmcx7t8nA2qypJ09F24cmCm+K8EJEy0S4U8VDL7Y4S8ClHRFZ7ch9G6CL1MkEfULLWcmASxPPOcHDOXCgyLHo0kyV7o3lZ52t+PHt8cW7aSuiIgqruL6dMD1WU8pkg4PrGQiRO3Hu61d5njKVVxqvUnU1w+8MwFBZeKJb8zJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Hl6cYHC/; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Hl6cYHC/"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72bb9725de1so1842501a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744829040; x=1745433840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eFNyZFztrG1dOuqdMRUTe/Wty6L/zEKrXsP9PzAiPXk=;
        b=Hl6cYHC/5kkMExMREYI2xBpVr/oL8qeVMwsW6PfCYnCTYEEl4zHlGjZylUakZy0SOI
         OeJCrutnVTDCrPRh2P5p/fGY8u+VT5gNXLRS11TKNfBBHao+Qj2xneBeAEhwpycaU86z
         ABakAivxoVjW2Y9ZHzzc+M2rRyDX2ja3o9WJzn/uOXUij6HZEESW5jV6ptdg3e9OAX+i
         13xG8T0+9cNC2OTrILU7q76t/gpM5wWOdFFT4h1gMcswhwEmKsYzq+Ya0cFz66X5InW8
         nm1B0UWgGYaKF07aU7/x6c16BAiLfr41VPYGd7dSSHrGrEViSp+3bfRayi6xjIVMa/o5
         X5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744829040; x=1745433840;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eFNyZFztrG1dOuqdMRUTe/Wty6L/zEKrXsP9PzAiPXk=;
        b=xESb9WtheOMKOWlIzvCAgpOqSCL+7ITYi8fY7Hb1ryD94dBjdPHOFMdtnK5y69fuGy
         z6IQUS+WGrPnSAQ/NJGFiy9HCqnUXz2FlX2EWLyCe8ZchlxOgfnSaFFm9h8dmYGrdG/v
         IblSQCKnbWx6tc7j2kD43ku5GHZ1Pqgg8LV2TVaW2uwFhkPL/pTy+mWBGdAyXepswS/z
         gr38m1zJI21LiVFJcqi8jmWqZnMwyoROUb5MeCFeV0AlvAcbpKCPpFtWl2beOoHUsk5s
         HGrTDFOq5RmQU1U7bDCyAh35BQuldHiEP3o75zlqbzWDMKkxZEj9kQv26yJ++EXahL2f
         7EXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHQoKKnEvbCTF5ykPGH8z/freq3P+r0Gvrkqyg/J9fDStxjHIBt8vmZivGU7AjjcaryYg2YUJQzdy9Z68=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVSi8AWoCXuZXFIj6O2n/qHVw38ycjKY/wSkr14HjxXcxwABOq
	avI83f678blhPkWNaea/p7eiFzyUQmPyTMVvQSAVPh1qMqaaHhBfn3YdasLjm4w=
X-Gm-Gg: ASbGnctGug51ZVziDvlS3nVakuf4QqCEo61jLQjR4fUjrMYctkeNEe8wgrN78ONMjD3
	nw+rOAGLuhy+MGgPee4Q7IWXUPKeHOdFjwxzo3AQcaYcZytI5Fph8zhGiT1j9KC/Rpp7FiTV/s/
	5NawQBcGR9gFTdpJImiPevwEzt9qEvBAxce+pel6nrN90eyLxLY9Yr1fo8yGePgjeUoBhIRCbyY
	zaqmnJORsvhXxuLo0lBQPbFtsb3dh4XImE81wlyhrBB+bR5YzFFRyaQPBvaWrS55Yuum/ysQ6LZ
	LXyAgtWgfrm1TQFUrUWV7PvOfbO5CQ1VGA3ERasqUuN5o0gm5Tpqsq1Ade5jC8ecwt8XEfsvfJj
	nHdVvxMF1ureErh5MLA==
X-Google-Smtp-Source: AGHT+IFNy7Si480QA8MeOF7SjrhfcYCIh4tBh20HJCj/dT3m88fwp7Q5GoiwZjRbLJPiJQ65PvSFwA==
X-Received: by 2002:a05:6830:2113:b0:727:4356:9f07 with SMTP id 46e09a7af769-72ec6bf6163mr2046480a34.14.1744829039908;
        Wed, 16 Apr 2025 11:43:59 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:58f0:670c:6b15:7fd3? ([2600:8803:e7e4:1d00:58f0:670c:6b15:7fd3])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-604a5c4bfafsm467955eaf.25.2025.04.16.11.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 11:43:59 -0700 (PDT)
Message-ID: <a6023ccd-76b2-487e-ae22-6bfbbc47ff85@baylibre.com>
Date: Wed, 16 Apr 2025 13:43:58 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: ad4000: Avoid potential double data word read
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 nuno.sa@analog.com, andy@kernel.org, marcelo.schmitt1@gmail.com
References: <8f765cfd6e93fad4e755dd95d709b7bea2a388e2.1744718916.git.marcelo.schmitt@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <8f765cfd6e93fad4e755dd95d709b7bea2a388e2.1744718916.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/15/25 7:21 AM, Marcelo Schmitt wrote:
> Currently, SPI-Engine offload module always sends 32-bit data elements to
> DMA engine. Appropriately, when set for SPI offloading, the IIO driver uses
> 32 storagebits for IIO ADC channel buffer elements. However, setting SPI
> transfer length according to storagebits (32-bits in case of offload) can
> lead to unnecessarily long transfers for ADCs that are 16-bit or less
> precision. Adjust AD4000 single-shot read to run transfers of 2 bytes when
> that is enough to get all ADC data bits.
> 
> Fixes: d0dba3df842f ("iio: adc: ad4000: Add support for SPI offload")
> Suggested-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

