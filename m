Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6214423535A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 16:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750350562; cv=none; b=W9R4+EIzmJpa04MuTXZO8BRgOS34uZTY3w+OlQM/IlGVSZPjkwyHen9HhvEAJrv+n/IeBsdraSQxewKdVw48HfLsG1ajFJEO0dceOM9Qbl2RGU1HUrjopfOaELDtrVVPl5vW/LJ//f6thzHrYnk91oLBBPUC+/N1l02i1juVKb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750350562; c=relaxed/simple;
	bh=EMyL1Uo0zzWNprcGuHaXIt2QwhvXtZojt+40ir9jHkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZDcl8Jbms7g0q2hRW2mmn+8ngrkTihdHK8ojoofQTJSB2Kwj1CAsMPQfJK5oTmnhkEW9YH997NLH+FDri1dUiI5XT9zMdC4saCsGop402v1kvStBXKxmkUaUbxALv2yuk8appKli5VmvnOgg9B/qEiPwWCxYjRaMTwfJhCYN/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RAvdPmVZ; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RAvdPmVZ"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-40791b696a2so248143b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750350559; x=1750955359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Id+f7kVLppAX20HAP2AURqNW1tLLgPJWhJTti78Nq48=;
        b=RAvdPmVZiiyVV4XKLJ/iNfBCoCl62eXfu4FRUgmdYnhCOWt2SZTcRC1I3WR3MS1/Nq
         jCuzzAKhWNHn5vpD1jA3NxkVySJT2XQQ1xmaOdljUbkiV0jiOLfrcMusqmxqrkZC+iJy
         FyGi2IMa6cQLNbiF4zpsPH9ZIjpRZ+MSYxaKKm5uoAzaw5Y0B+U3O9PrFV8CLHqbxrh2
         vkRIhltCm/N9tAiADQh1A4dpMxJKeYJOOJ0oifd0o+mkrbEhOPxrwk+FN/Kj12NGSUI0
         Z8CdYGf1TgBNftKk1//XtTnEeudbOLwecnK3RJfc25/NK7ofRaifBv6j81/QOCNno0QT
         36wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750350559; x=1750955359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Id+f7kVLppAX20HAP2AURqNW1tLLgPJWhJTti78Nq48=;
        b=AXsWggyCe18CwpHkisT3HEjpA2ZvrtyAxnYIQANg9513wIRX2MRvoupyzYwAh7oKk6
         OEidU3gujycLSJJ8FVgJnVl7D9t6F+JBdy1jgEXzZdPrVrbYs3887XlwSvfyt/zS/0Z4
         NWVNNOZpRGCyyqOSH5elEC0uQi9l7ljvEkw+DbHnyQgO1r1B4RUrYth1xliHadbX8acc
         Hn/ps0iD/qr1eq8YCT0uLvds47VyDr8RAKQLU1MidJwPCkr2FUy82mVnxz2gAvsYbgiw
         ad1z/JwOT2Gu69df2NWlG/zWNHenWY08QprDt1WgnxVAJQQ87UnhdSh5IcT9Opd3ZOd6
         1/+A==
X-Forwarded-Encrypted: i=1; AJvYcCW5hOSlHso7fxebOo71UwgwEL3PbWcO/8Mkf+RLKh/jqO/IzTx7fd0rTFlbFG9pY2STs4vWmGOMEhslW2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7M1K3StizR5viT0AvocNd3LRzJata8DfyoUa3pkKI4nUk4mr1
	BYIWjmqleYw7exE/veYf41O3QsIiqIVc22vLavJvRmmJq5K0phfvGrVitYHKin4Lu+Y=
X-Gm-Gg: ASbGncsVAIINUxHdxtd31X4TV5Ku5nHbb7MyFSMQsLmLmdTSLpYcmCaqWZUy79Lj4WR
	Yn+zdQe3JG/8QKE0v4KVlpi9dtzJdqGh5EV0WpxZkPeZo/EEhLvW8s1580zzwKrJL/mJXOQASN6
	IRHmJrcRTmVdguXqnmDBpxKg+5rL5P7uCvjCsG/fgZyHPag9fJKat1Wt0O9zYekway1Prw3tIFL
	QaK7B+5gogHJya7ZSOn9qsD7aNDvWCBvyqHTZlGo3Xy5sAMB+/kC0SYBHy/qc5iS4lW/V5iFff6
	YSVA8UKzCJ4XW5D5Oguis++9QDWaxy3qZ536xK2zfkQVUfl6UJvgl3RTH35kXa85hVWysbJ14iN
	lrEZtutL4DAPEDFrmT5AUglcU+hVAhVuViem39Tg=
X-Google-Smtp-Source: AGHT+IE3wykgtpudCLPxyYXHgot19QH7CguFGEPEsZeTABHQ1Nd9aytQtOo9OtA4EGXFPZmqiX54mQ==
X-Received: by 2002:a05:6808:189c:b0:40a:56e7:1e59 with SMTP id 5614622812f47-40a7c17ecdemr15537482b6e.5.1750350559492;
        Thu, 19 Jun 2025 09:29:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5504:5211:6fc4:c093? ([2600:8803:e7e4:1d00:5504:5211:6fc4:c093])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a74172cb3sm2790979b6e.25.2025.06.19.09.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 09:29:19 -0700 (PDT)
Message-ID: <b27c6aab-e363-45df-8521-e85c2b3f4421@baylibre.com>
Date: Thu, 19 Jun 2025 11:29:17 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] dt-bindings: spi: zynqmp-qspi: Add example dual
 upper/lower bus
To: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-3-sean.anderson@linux.dev>
 <2588bb7f-2a3a-4001-ab1b-6d9bd57b545b@baylibre.com>
 <cdeb54e8-0624-42de-bac2-25b151c37872@linux.dev>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <cdeb54e8-0624-42de-bac2-25b151c37872@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/19/25 11:20 AM, Sean Anderson wrote:
> On 6/18/25 14:27, David Lechner wrote:
>> On 6/16/25 5:00 PM, Sean Anderson wrote:
>>> Add an example of the spi-buses property showcasing how to have devices
>>> on both the upper and lower buses.
>>>
>>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>>> ---
>>>
>>> Changes in v2:
>>> - New
>>>
>>>  .../bindings/spi/spi-zynqmp-qspi.yaml         | 22 ++++++++++++++++++-
>>>  1 file changed, 21 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>>> index 02cf1314367b..c6a57fbb9dcf 100644
>>> --- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>>> +++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>>
>>
>> In addition to changing the example, we could also extend the
>> spi-buses property for this controller since we know this controller
>> has 2 buses.
>>
>>   properties:
>>     ...
>>
> 
> OK, but this property is for the slaves not the master. I'm not sure what the right incantation is.


I think using patternProperties, like in Documentation/devicetree/
bindings/spi/spi-controller.yaml

patternProperties:
  "^.*@[01]$":
    spi-buses:
      ...

> 
>>     spi-buses:
>>       description: 0 is the "lower" bus, 1 is the "upper" bus
>>       maxItems: 2
>>       items:
>>         enum: [0, 1]
>>
