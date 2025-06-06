Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C4220F09A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749207589; cv=none; b=vFBnGy40KvLzvPXx0NElCxBHMxq2pGmO8Y9nGEJ/glvoMbKipLQsjbPfPQexnqYBBs5F1ZxFdtve9VDorLEBJHii58AybVJ/JhqXlPsdeOoWbEPesYxPoNhaR4dqfgYHcGnp9pG7bVhcQ+jEbiuYK5pmX1qUQOV04BoF63Zyhdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749207589; c=relaxed/simple;
	bh=eNvJDVx2RVD1ON1QjqqCkfACmTkFJYvAfRFH/oO/c8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKxm7S9z5CnH/1wijqI2KVsKRTyTwHmhfWKX1C87QVzHd7YkvTkIWZx9XnckPTXmibEE3BOnRMjqmHKEaohrumJwvvyC4xmGyC2zOmYpeLa+59IWQHfC0P0/prWankQIEZDjN9USvFDJOBeQHefgskeRU9NJ/D3xTXgqHE9h+1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y7HvIGO6; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y7HvIGO6"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55342f0a688so247102e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 03:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749207584; x=1749812384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvqW3AWqkK+q0nQJutHUZ9u8mAXK0/731ZCrAoRGHHE=;
        b=y7HvIGO6Qgb8Jd6cOhGPeEheZl0oTWJsquM7T8v1Pt4XRmNmpQzdBIKhcEGqV3RoRb
         JzFKHSYxau83ee0ZkqjtQbQVm2lMOV5CH0r9qb0RaiakGI5CZvlGJANB/fgoswf5hPB6
         VeHtydAr20LUS7q5LSYkezfHF2DCpH5h/5TglbOrd/BV0sTKZOk+1dpWjR2alnTmL039
         idYPqOFYnwox9Nm7YaToTgDOwTTz5xf2gZo39GIL+oloHCNX0RrUsnx81FT5t5N5RCx0
         2MfW2bBWTz0yNH4i5h9KIeYaxrq7qOczOk5bcXd+pd/roKChu/bG3NPMKw34oDIeWur5
         3bIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749207584; x=1749812384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvqW3AWqkK+q0nQJutHUZ9u8mAXK0/731ZCrAoRGHHE=;
        b=Iny33T7AiAM2hpAulUMYLhPqTxtkVYq7N0CD/SQPcTDK0Z7wSV+BN9t8fSbXKRs+qo
         onscYwqm6Dv+SbsqwWua8KMEbas6UvZcesF9ECC1QLLFS+p7NRB3NsuHzSokLK1yOTTA
         EagFa24bnrmAOPagq11K5Csbo6yc7qKYCgZYpiAxs/wq67AHHdEmHuIX6uSy7ucCIJ4t
         KnifQ9nPjXwbVeO+GF+mP+tAl0jKXv7zr6a5hg8yuO95VmzFvjfAy1NImzNAEAzAuZso
         IORMXMy9VOuVmCf74kyjTGWA5rvCPgzmbwU5XqZVw5shlkfmWJUBnUbdYLejx4HaXcHP
         ZC4Q==
X-Gm-Message-State: AOJu0YxahCynnhT9GS+mbFYnbNZaawC27J2jTzsfdqI5HMCeQs4p96bk
	p7u4AIYPGoIrULMcblbHbs2szNMWjz5PmpGw9li6N6+VPhgsOcXRuL0NRmd1zSJmONo=
X-Gm-Gg: ASbGncv1NB719md0qAup39sJXJadeTtNvA4gbyY5zW3uv+B7ZSZ1oL3tl1k9vKyNTS6
	fquRLnJs89RLMbWdlfQPxd8qkbuD3wF2ykQ7xBQkvgCJW4zHBYCfn7D4Dr0s2TmuIE0c8zll7+f
	5QvXK2DBPKbxca1+PDSw7XHLw2aDCXO3vnYjGWLcFcHZ0vI4/KPy07SL2urzyNFluDjDbBU9odk
	98OsPhl/KRgVQvrqz5RfbPXyxuGMC5J5rirHQookAE9PcqdkuKYouziIf35NjAgn2zEdgX2BuSp
	HwU8wzG1+F5vOv+GKA8s1EotsTbQktSCSWL1fRsamjYKniCJgbjUzHEPV13PC1JYRLWvI4qUiiX
	FCfCKyj4tcZfcpvriqtOIJGy0vFTBUOa5Z4DZ9omd
X-Google-Smtp-Source: AGHT+IF6VGZzfzzaonioCVFuOZMDtflg4UEsDYktUq+bINrW6ckDf4AUU0LdM6+SSpNaHgJWBn5jVg==
X-Received: by 2002:a05:6512:401e:b0:54d:6dd3:614e with SMTP id 2adb3069b0e04-55366bd41d7mr243196e87.1.1749207584314;
        Fri, 06 Jun 2025 03:59:44 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367731877sm151482e87.223.2025.06.06.03.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 03:59:42 -0700 (PDT)
Message-ID: <877a72fa-cdae-4a66-9991-5ea86ef76aac@linaro.org>
Date: Fri, 6 Jun 2025 13:59:41 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: qcom: camss: Add support for MSM8939
Content-Language: ru-RU
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org>
 <20250602-camss-8x39-vbif-v4-2-32c277d8f9bf@mailoo.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250602-camss-8x39-vbif-v4-2-32c277d8f9bf@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Vincent.

On 6/2/25 20:27, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> The camera subsystem for the MSM8939 is the same as MSM8916 except with
> 3 CSID instead of 2, and some higher clock rates.
> 
> As a quirk, this SoC needs writing values to 2 VFE VBIF registers
> (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
> This fixes black stripes across sensor and garbage in CSID TPG outputs.
> 
> Add support for the MSM8939 camera subsystem.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

There was a preceding and partially reviewed changeset published on
linux-media [1] before v1 of the MSM8939 platform support in CAMSS,
due to a merge conflict this platform changeset should be rebased IMHO.

[1] https://lore.kernel.org/all/20250513142353.2572563-4-vladimir.zapolskiy@linaro.org/

--
Best wishes,
Vladimir
