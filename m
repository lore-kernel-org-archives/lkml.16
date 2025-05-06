Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A876613B5A0
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523814; cv=none; b=ldnxzc42m2oUOoYdagXlw99sPsx615hlTh1hdi/0kB1KkA77fFJMuq2Y2OoSC5zqwqC7kkL9lV+7sOME7jCMA3kPo6AkbIWKeTYs0bnSA4keK56NP0s6VTt3wDX2o+CNu/pt8jK5KI0+oT46SFEfpebZxkpf4rZqgsCPU0uU25U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523814; c=relaxed/simple;
	bh=1I3gP9kEkdb/k/8hjuO2Gi91UtQ/5S9xrgBtVjkx6m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X1qJdqcAZSWZxm9E1xhO+ZRP0kMFLH5TEBDsQtMsy8Pjc6LnISUIsaUGUbx3WAsr7Hb22+oMw76S3fkgoQTiwGX8+/jqLwom7aFOr3Tl8rRzMCyywrdmDxtuS5K3KDEkFsR6cflm4X+pTrAidfCXaNekan3se5KTgHI+vP2KEGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WmObOW7J; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WmObOW7J"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-440685d6afcso47401115e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746523811; x=1747128611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxtTsA4QklcizN8YDpNxBKefp4yr2C2T/GjifCCGDUA=;
        b=WmObOW7JUMEyO4+eKwQZH1Q205ucJy7UJRzc2X4WiHDUq4FjTvdtpacZz//0H3OEHn
         Fkc73BlTS4oUDqYuDcr9gjJOXz6LZ8AeTfb93AG33YQU9mEV2cWFJTHJUfpmeS9r3P81
         OH+suTw70mtmG+uQeWLZkWkVXG4OxB+5+4M/IauuTY6XdqLalcwZ/eeIzXCCo0z17DVg
         mQfNbbGnASLBKUK4UEpQQK0YsCP6NHzty3JeMqat349PgYuBg/q4GLtnQjKNKN+RDupO
         DBf3qJJlmG8NnZyr8k357tRUsGjWi/F4HVcWQFCFYZVbOx744Ytp7llx7qYy/o//APml
         uymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523811; x=1747128611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxtTsA4QklcizN8YDpNxBKefp4yr2C2T/GjifCCGDUA=;
        b=NcGrV+Ja9Yrp2WCtcGiLG86p/1GEZm43bCI6JtVJkLpiUzY6LEaJ2Hzt3Qg+9SkdSl
         ZsnjKRXBfnsYH7y2wlx9WeNaSo6B3BVc38VL1CcBuf9DdM9AyYMZs5i9ENjBecH40JI1
         3ge121LxCaq7g29qMJbVqO0ydKWSZWwh6jOdKTpDEy7+NCfZyzBqWlPQIHxBSiwTkZXx
         Ll0XN3jULoMR0WkROHvsA5s8IuAZC9Tp+TrNAfyP1nVcV762bh4A09QK8kdHFGle+iVZ
         NJDfXnAX8cf5TpSaL74IJHxslkwJqlZtPXm6Vwq20BQQHOfoqvRGqjDGE75wN9U5WbtA
         cZSA==
X-Forwarded-Encrypted: i=1; AJvYcCWPydxyVRvhyz60INJaeNRN3GCUYc12UG1lpTNHpmJ8dnWWd/BspPEhJdXJPKQTg4XfNV96mYn+XnhE1eE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYSxWQgIE4hlMWg/U7o5tsCMKDo7GVJ1hwcnMpR8wNaxki6Fvz
	HKmWd3eCNgtelDJ53TZ9q3c9lz39xAzrr+suJ8U/liCY6HovkwzS61VVcN0SeiI=
X-Gm-Gg: ASbGncuWkpMovbv1EW2n7yG8asNyUr1/40YjyhoswY+cLKGvMkhB4yJgb8josnkDfNj
	uXk/XyqOtoShI+NX65h15vxFnqwBHOD59OkZu+JnHlt6iPcZLSwV8C9JQhkyjY74eJSH369i8Us
	XQHZ9I/MCTYefuGoIJZQKLbQie24siQ/clOZPlgwfMxAnrcLUxyEITL3ehFv3iu0HRReKv5ZSup
	WD/ZL6u20NrOCOoVFhhlIOqOokWgmgytSc7mqYwVCFO0xb89mz/2qFaTBjy5c61Uf98mEFysOBH
	ufWP45kWVxkAA67RZjfFnqMWVTtU4gimHbSUbAxuQm7HOhVT5ewaa6bjJ0RGeP7l5DAT9NGLbvQ
	PJyPR
X-Google-Smtp-Source: AGHT+IFpif+qSrRTApHUVcDoxXrKID7abzqZ2HIETxhr80u7rcgLHGd48r0VmjGtaI8HxmY7d6CElw==
X-Received: by 2002:a05:6000:200d:b0:3a0:82d4:ba90 with SMTP id ffacd0b85a97d-3a0ac0da280mr1767727f8f.21.1746523810868;
        Tue, 06 May 2025 02:30:10 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b16f92sm12768416f8f.81.2025.05.06.02.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 02:30:10 -0700 (PDT)
Message-ID: <99febf26-2ada-4fed-b4b3-596ac4abf581@baylibre.com>
Date: Tue, 6 May 2025 11:30:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt6357: Drop regulator-fixed
 compatibles
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>, Conor Dooley <conor+dt@kernel.org>
References: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
 <174652097090.119919.16240846809714782858.b4-ty@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <174652097090.119919.16240846809714782858.b4-ty@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Nícolas and Angelo,

On 06/05/2025 10:42, AngeloGioacchino Del Regno wrote:
> On Fri, 02 May 2025 11:32:10 -0400, Nícolas F. R. A. Prado wrote:
>> Some of the regulators in the MT6357 PMIC dtsi have compatible set to
>> regulator-fixed, even though they don't serve any purpose: all those
>> regulators are handled as a whole by the mt6357-regulator driver. In
>> fact this is the only dtsi in this family of chips where this is the
>> case: mt6359 and mt6358 don't have any such compatibles.
>>
>> A side-effect caused by this is that the DT kselftest, which is supposed
>> to identify nodes with compatibles that can be probed, but haven't,
>> shows these nodes as failures.
>>
>> [...]
> 
> Applied to v6.15-next/dts64, thanks!
> 
> [1/1] arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
>        commit: d77e89b7b03fb945b4353f2dcc4a70b34baa7bcb

I'm surprised that patch is applied after the Rob's bot reply.
Also, I've some concern:

On 02/05/2025 17:32, Nícolas F. R. A. Prado wrote:
 > Some of the regulators in the MT6357 PMIC dtsi have compatible set to
 > regulator-fixed, even though they don't serve any purpose: all those
 > regulators are handled as a whole by the mt6357-regulator driver. In
 > fact this is the only dtsi in this family of chips where this is the
 > case: mt6359 and mt6358 don't have any such compatibles.
This is the only dtsi in this family to do this, yes. But according to
all other vendor DTSI, which use regulator-fixed when a regulator can't
support a range of voltage, IMHO, it make sense to use it, isn't it ?
If other DTSI from the family of chips doesn't, why don't fix them to be
aligned with the other families?

 >
 > A side-effect caused by this is that the DT kselftest, which is supposed
 > to identify nodes with compatibles that can be probed, but haven't,
 > shows these nodes as failures.
 >
I lack of data about kselftest, but according to what is reported here, it
appear to me this is something which could be fixed in the test itself. It make
sense for a DTS, but not for a DTSI because it expose HW capability of a
device, not the board, so it isn't mandatory to probe all DTSI node.
Again, I'm not an expert, the test shouldn't show the DTSI node as failure,
but maybe more a warning.

 > Remove the useless compatibles to move the dtsi in line with the others
 > in its family and fix the DT kselftest failures.
If you remove compatible from these regulators, I think mediatek,mt6357-regulator.yaml
documentation file should be modified to be consistent and avoid dt-check error.

> 
> Cheers,
> Angelo
> 
> 

-- 
Regards,
Alexandre
