Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366C128A1FC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546204; cv=none; b=a3traMT4IUX0ZyUHQepBmmbCK+qTm+m9uhx1aEGKKHVKTrm8c17NEfhzcOTYSpCdTgMGXhgn/CKLbYzbAKKJfI2+bLmwEa6cRS/xtt1sbqAvcpjNbSdf9EcCM1AwcJJ2c+6pv8QH+aHWLr40V2hKHLfgZv4AIwIC72apQRQoc58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546204; c=relaxed/simple;
	bh=jQuhSajM/eKNYIy+lnEsFf+cKW6Vn57R891VHKHU15Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRdA4vUbeQ2Crb/mUmEROe7KHPdtu0Wk7Q1lcM/S51YhtsQr2On+LgvwnukdGOytc5mC9Gluvq+O+XT2TtyIWh46upTkoURQRQh2Bjk+rftlz7kQi8ppoQzcIxAw+P7lGVHA3vLIEuw37ZbadwiT88kh2kDA7UYgwgRKVUM2VoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P0RMF03W; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P0RMF03W"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450dd065828so34932785e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749546199; x=1750150999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HPqK+7Pme+jXJ4ncyLUwgWNNufzulUH6kf6Ic21uOPk=;
        b=P0RMF03WSisK/xP7ix41vaM4/M6uSwPIakViqd3QtA9WQXzi1Q+Z1X3LD9VVbvWP5+
         3rvCk90v2eSnpCf833HTItZH50ezlXmwOyboR53hfYDSQyfVtIIbaXKaMZo1tLvxjkoH
         0T78cAQUQTloplKFVV1KD4yS5WjzyENkGXX1wbwGXEOE0qswBluRYc1e+emrksT4Ik7O
         2N/4mneOS/6EFwsOyFEomMosdCMs0T2NVmIOUS31btFTmtRSEtodSqA4hEIgY447L2Qe
         h6q3+9GNuYg+QZ1cFTcGIbeiJwiC8EOYIa0lvHzffSjHyxls/nPxGw7nmhYcMHr1bpEh
         HrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546199; x=1750150999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HPqK+7Pme+jXJ4ncyLUwgWNNufzulUH6kf6Ic21uOPk=;
        b=VteXAFN3y50ndXUdi3FE0SajN3RKfiIsjtpPHkKE+sK7E2n3mzdS5rsixHT8gZOHZQ
         TeWJzLlgjMmfD9D4CFmuApWBuT5Wp6n/AqfdKkzUGwmeo2NT86wdWWib5HWgbAoW2MkV
         TL+Yjx+KIqiWPsoI8moyR5bo0TATVdsId231sdIBz40AhjNTt57bbiRI+0ieq3/zQy6E
         tKLQuxCsGNeASxxU4aU/UMKqa/ddgjRgBqHFuJz+Wa7khHl9BkLOC2oLuDyJHUV43wlN
         ayuEwY7wYkJWQTDKYrblIv6lYclTdwXKCAkbddiv0Or4EWuz8gy4Y0nMDm8R6AtHsF9Y
         KwTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAU3utyg0JVOT7890PP5rb7/kPq4OqbJSgGlJvUgQ3eNYkvPmRpj0TlQaRg8rQefzVl4O//CY4L8D2wAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHpKwgxAlsDXmADJFZkO4lYsseHpqMIklcnHPV0R3vhIrMPxC5
	5FRaYz8H8uCK2Bom1Xp6LgDUMXCyGpVqEzM6lQgjz0TNHGRq15lXFzoAZ1/6S4RA9UU=
X-Gm-Gg: ASbGnct0DkC5eR0x8BLLK4D4svxVIpHUt9dywLe/f52Ejgx8AV/v2HRw1e7qjpUHjHz
	LFC1D5E3vOaGA2g4U7RhxBSARLEoDd06kdSsoLGA1bP1QgvCpeqSndYRKnLAexKd7SWKCtNZsb7
	2Wb7nJ+TIYHlJzOcBqKTjy3DYfrebwPTkb9s1/ArP6I87+tQKuGAYVys1UdLQRJGXgC+twoXpj0
	aZSJbPuCa8AlAp7+iXcTyYLgM4oYN+tlH4xxPjsPkba1E0qeDoetvGx1K8fr+Bis9QgP1eAO+ZT
	9xaUbdQlyUOmq1K+TVJpLzrpanKrmPiv7a7J6ala0QvyU0fkDcTkem14kepBd653tbM=
X-Google-Smtp-Source: AGHT+IENhfICQtVFbADftr85Dr5PIfBzTkNl7ToSjNkBgjBnd+DfSLsY1NJ+qsOdHIdVQA5u4x1ouQ==
X-Received: by 2002:a05:600c:83cf:b0:450:b9c0:c7d2 with SMTP id 5b1f17b1804b1-452014146bamr149777785e9.11.1749546199567;
        Tue, 10 Jun 2025 02:03:19 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229dc33sm11573487f8f.20.2025.06.10.02.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:03:19 -0700 (PDT)
Message-ID: <e78107ae-e2d9-4ffb-9a2a-bc04426e2a75@linaro.org>
Date: Tue, 10 Jun 2025 10:03:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <1c579729-4461-4666-ab1a-77f17a320ee9@app.fastmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <1c579729-4461-4666-ab1a-77f17a320ee9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/06/2025 9:26 am, Arnd Bergmann wrote:
> On Mon, Jun 9, 2025, at 17:32, James Clark wrote:
>> Using coherent memory here isn't functionally necessary. Because the
>> change to use non-coherent memory isn't overly complex and only a few
>> synchronization points are required, we might as well do it while fixing
>> up some other DMA issues.
>>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> This version looks good to me,
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> I had reviewed an internal version originally and had some comment
> on that, all of which are addressed now. You did not Cc me on the
> other patches, so I looked them up in the archive, Patch 3 also

Yes sorry about that. I've just started using "b4 send" and I was under 
the impression that it would automatically CC all patches the same way, 
but apparently not. Maybe I'm holding it wrong.

> looks good to me and complements this one (i.e. you really want
> the combination). I did not understand the logic in patch 4,
> and it would be good if someone else can take a closer look
> at that in order to Ack that.
> 
>        Arnd

