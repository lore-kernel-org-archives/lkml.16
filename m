Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586C52459D1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 08:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749456288; cv=none; b=ZtxTDwVTGh4NFTch0EQAfQIAmXC9CAGh4uKv8YHsGwUsREx4pyiBIZ4PMlVJett49oAa4Y6IwL4HOWr8aX7M6KCbVRhYuFySiO7Jq3AhvJdDfLaimqNrKQS6/zFpr/KtbZTE8Wiyb6v8WPTazjHvLscDCInZG2RBPMWAqpyYYsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749456288; c=relaxed/simple;
	bh=uyh7Z0bWT6bah3v9PGYs3YIOjwRZipTdMcUmMhw1dTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Qr5/8cEJQ3MI+7n0UPR01pdkLVXDam82r/SwIhIB3dNliKVRv1PYErkB4MbfSvC66EKAaasKCM/jVt1fyUTFeqQh0cHeKv9RTA40/LbL2814AcOmgIkvrvoCas1FA0WBUT/UYXu1D4FYIXIxE0iBOIwwFmjqXs3avU4i/MhCWAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lB6x3P+O; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lB6x3P+O"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso648957466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 01:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749456285; x=1750061085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LYbikLlFrJpSsHAbsyNOgXkJM+1ZHGImF6OaJb/GrUo=;
        b=lB6x3P+Oa1VETqAw8cQZ8kD5NDBtPZefD51RJC9cfLT6b8jmLrVOb1ownqe3+vXGn7
         BZtgRwT3MH/9LukDRXm8Qd2y1CjxhvQpWQ5Kl+xfcBUx9JGSm8QpOKHHqhuR1s7TvG9u
         tX3hg3jXBg3sEUhp2/2JOP8VDSM6CO5M56u3PIx9BtbeaBz0Dvkx6yoedMHcUK4tXk9L
         FcBBJabEYrA6vM1NTGShnlepAwFW6LlZ3EtxVCLlLPW4R57gnHdbF7xO2mn7QjgkRDpx
         zHPS7rIf2daHTS55zmvn9tI/k0aZBFzz5GJq7hXFxYwxueak1sMb8iAqoFjKfn/rEfFp
         SB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749456285; x=1750061085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYbikLlFrJpSsHAbsyNOgXkJM+1ZHGImF6OaJb/GrUo=;
        b=Ayg0HrMWY/KbA/j4glWjtogPYWg0WophRtXGrQfWFC2hWeJc+4uMSLTw496pA4PxZe
         A4nM+fsg0PBeSSXsZib6XeVbVS2NsunXMV4St2cDoLjdlQHdg6LYxFALDvkHyFmRlopR
         D5IZWBpZM7+AMkqApADJTprlJRCAxo7N/VzuleYukPDtNzQ4xX4g4VyA12i5CFVUW37U
         aYE3PgSPTevnSy1XACPTuIEQHWUzsLzKfbi2yktaUbCX8aifn/6XoMsdPGRLdBlwAVm9
         RsRqOHQvZgNaVTs+RBNrZSZBFPi+wQXaKiJzjVYRDBoRJXFFrbE1eIHmiQwFI4lX6OCr
         hi1w==
X-Forwarded-Encrypted: i=1; AJvYcCUepWaAnZDTlYAoC5sX5Ajo4IlrCf+6JE4C99D13cnCsa1o9s/Y7mt81kjMOjw1f2IsL4dLCutpLdwHlMY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+6z5PTgT2st/ymj3onJdBTSeIwyRfwTFE00fjF96OSC74kK5Z
	FZ0OaDJOwnoYfrgCh3R3UDtoEBs19JFaiko02DRcXh/4aaWJPvWSZNMgGu+E/BNJWWc=
X-Gm-Gg: ASbGncuEsi3VFzTpjOlkQeh6V2cuBBZsl/Vxj12Ra/jinfwlBBORQLUvlpYTqS2MF28
	kFsxhw/RAXoTUuipm5AMUrxT3Xc9mjz+XWKhXcPfCU/UR/OsZG87jtotrKfhdET1MIDKYBAsKRJ
	1XiUajRkbRLEvSoSp3lOatRvVGKow6BxwJokpTxz747vgR9nxPVWx7Gkk5E48yE9bRtTGl3izrQ
	iEbOKEQiNQXCLtbxpx4bCs7NCVpOZwRHLvLNz0qcaZA5V7gtqb2ph6qO4pyvRLIL0lNe5da6PSb
	gGWcZY5a/PGi7ZNr8DQ5WNglooAW2YCNqh2+Ecj4YzeoG2S/Ggxjj2tXE6EQQ9dTKHgrxIVF
X-Google-Smtp-Source: AGHT+IE4MSpOgbuv33HwkCjYoe/XHyfRRWBSdHnwS6XSdQ5vijF74vaQ28Yz93NEa6jYLsO+24PJkQ==
X-Received: by 2002:a17:907:868d:b0:ad6:4e8e:1883 with SMTP id a640c23a62f3a-ade1a917048mr1066441066b.3.1749456284653;
        Mon, 09 Jun 2025 01:04:44 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d7552a6sm517919266b.28.2025.06.09.01.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 01:04:44 -0700 (PDT)
Message-ID: <8caf71ab-8b3f-438a-8075-60dd01a7a448@linaro.org>
Date: Mon, 9 Jun 2025 09:04:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: sfdp: parse SFDP SST vendor map and
 register EUI addresses into NVMEM framework
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-2-manikandan.m@microchip.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250521070336.402202-2-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/21/25 8:03 AM, Manikandan Muralidharan wrote:
>  drivers/mtd/spi-nor/sfdp.c  | 161 ++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h |   7 ++
>  2 files changed, 168 insertions(+)

Please find a way to move the vendor specific handling to a vendor file,
don't pollute the core drivers. In what concerns the nvmem idea, I find
it fine. Michael may comment more on it as I think he dealt with a
similar use case in the past.

Cheers,
ta
