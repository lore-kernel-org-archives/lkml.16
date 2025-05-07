Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E842144CF
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604149; cv=none; b=lWeIiH8XZjOZ383N9YYBWlvnHiY0LCybK76Zw/g5H7g2oX7sGTRig12R2Xh3knQC4d5x23+GkpxYMdFBTXL+lLQ8FbkxPtu9BYw9QQRV6PzZgy2Y94t15KisffQmrtbKEzkD5pD7GKtSNJLydFHGms4UhRs2MYjZWEHdUocSE0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604149; c=relaxed/simple;
	bh=tWI5HjmnaAvX3rKLOw+VlT5HYZ0VV1JDXBn/CF3fvwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQyUja1Y+iHdQZFtDguaQZy9G7G3fcz3SsBnA6BouQgbNpOoI+WX+bmd8Sz3vA1aN/dScoPS3jILlafapzPIDj+XiHYJC1g2agD1tg/wYIDPnTvI3WCR5LZ6XY5JoUbLyj0UJLGAxrSXgWnSzXfiDpmb//W2I6/bJVrUvFfKclk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mhrnPEFH; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mhrnPEFH"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so630672b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 00:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746604144; x=1747208944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uBQhgtS9ybuOxHj6AdnuF/Cq3dS0a7fHWP3yItbSd2c=;
        b=mhrnPEFHTNO7iyaPgYI+tD96+oXpIccKdMpKzufwTepE3tnTGX7kf4MaXFviBt0dBa
         s7A+7oyL/mTPe/sSLq7AWuUzalBrP/RHt9HWr9VZBNZKZCbPi4UnmWt7huSjhRSgmi6m
         PFf+2C6ZyNdcvjAByiw4+Mp/QXBGEmjE9JSdBi7iyFn4d0UdXB/kGNp5hrTor0Hvw9RV
         omK/bGtsZVfLVBrODuOk2rq1xCl3buB16KKaenaDR8QdZU7rjNY82XlQSX6qGMjtaXHx
         cnnNuUt2uOn33ScUb5u9tAltFWJkk+UXi/u9K5UGzOYXuNDO9KEj2/wyIX6goYHVOoMV
         r6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604144; x=1747208944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBQhgtS9ybuOxHj6AdnuF/Cq3dS0a7fHWP3yItbSd2c=;
        b=w8V4JvWwG+HU5+Ho9RsziCCVX+AcyXeMh2ZZvMuOyqd3orx9R4s8OwBzoUnQ/fT2E6
         jFO+eLTUSOHEvrTw6cgUSDdLAHZh5GGZYXsuKJUtXb6+366uvQjUZyuc2vPghUaDUy39
         krSu6urLo7+/rSXlQjCX92AMfnR02HQOz9P2vSiID6yu3uqVdzO5/8pvG8F6IQLartQI
         XXJPi/Qvj4G0l4hiZDzDkMIfwo6wjluZGy6a474gl+8viBplqKtfbTQ31D4vo8JfEvtH
         1YDF/hRtmlB4mKopqakYGBVIztEfTFiubOxgNwLZOeTN425c5jE80zTbly2mOrolq2YC
         6kyA==
X-Forwarded-Encrypted: i=1; AJvYcCUeuDeh9THEOe6y7va9YmplsNqfnnKllPe3I1Qf7YgIQ+ptjgyyb4Jpbfr9PrQrpETa9By6UYFUIXywQdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGmat8L/MjNsr6UAXClEugwtlh/nOrThHENGgR14WaFf3f6lrF
	edWDtu3mWLqKYbe5wEDqzuXZ43mtcnFLx6bxQCQeaPBViUfr6K//ThmiGjikBRI=
X-Gm-Gg: ASbGnctsFcwgF8Jkguyk2LjmHy27flQKldXMEsmlYIt4EANIKRQqM9guTtS63Q02bxm
	aQGtrouwSdMpDZMeM6zwLhM+9JWFcPxnsBop0mqQV6jGQ/ZmWIb4as5Z9rqyADnBB7jQOyiG800
	eKNtJ6GSP7SeejE0XkBwQsnHgSHgnhNxWy/cYaNisnV9zTiD0L+dcbRAmOJbmDeRlKIw5D6HpVS
	jterc4Vj/93dAaANRZbvCWceYHlQiMCXTGlY3byQLlUZpPLwg0SXGS50g6UWOcfftFtcLZ772rq
	xEO99tF5dT2vfbvwtpjMtV/TYrK27UmQXBCL+WMxlJfFdC0DsA7s5MtBe/oQpnOzbdIWmXddJkr
	MZERtUJ1SbT1Vzqc=
X-Google-Smtp-Source: AGHT+IHjHRiwgANkAJ3S9Z01d1Zgt2+B4LvIz1I6F5aV28W7g29cSTSyqCEScOdJG7/V14ux2621Pw==
X-Received: by 2002:a05:6a21:101b:b0:1ee:a410:4aa5 with SMTP id adf61e73a8af0-21496321efamr2808776637.17.1746604144528;
        Wed, 07 May 2025 00:49:04 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dee10bsm10442690b3a.76.2025.05.07.00.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 00:49:04 -0700 (PDT)
Message-ID: <50ef47ca-1054-4b5a-a7d7-56e6cfcb863e@baylibre.com>
Date: Wed, 7 May 2025 09:48:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt6357: Drop regulator-fixed
 compatibles
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>, Conor Dooley <conor+dt@kernel.org>
References: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
 <174652097090.119919.16240846809714782858.b4-ty@collabora.com>
 <99febf26-2ada-4fed-b4b3-596ac4abf581@baylibre.com>
 <1e8b80c9-d491-4b71-b424-e2322c711fd3@notapiano>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <1e8b80c9-d491-4b71-b424-e2322c711fd3@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 06/05/2025 23:20, Nícolas F. R. A. Prado wrote:
> On Tue, May 06, 2025 at 11:30:08AM +0200, Alexandre Mergnat wrote:
>> Hello Nícolas and Angelo,
>>
>> On 06/05/2025 10:42, AngeloGioacchino Del Regno wrote:
>>> On Fri, 02 May 2025 11:32:10 -0400, Nícolas F. R. A. Prado wrote:
>>>> Some of the regulators in the MT6357 PMIC dtsi have compatible set to
>>>> regulator-fixed, even though they don't serve any purpose: all those
>>>> regulators are handled as a whole by the mt6357-regulator driver. In
>>>> fact this is the only dtsi in this family of chips where this is the
>>>> case: mt6359 and mt6358 don't have any such compatibles.
>>>>
>>>> A side-effect caused by this is that the DT kselftest, which is supposed
>>>> to identify nodes with compatibles that can be probed, but haven't,
>>>> shows these nodes as failures.
>>>>
>>>> [...]
>>>
>>> Applied to v6.15-next/dts64, thanks!
>>>
>>> [1/1] arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
>>>         commit: d77e89b7b03fb945b4353f2dcc4a70b34baa7bcb
>>
>> I'm surprised that patch is applied after the Rob's bot reply.
>> Also, I've some concern:
>>
>> On 02/05/2025 17:32, Nícolas F. R. A. Prado wrote:
>>> Some of the regulators in the MT6357 PMIC dtsi have compatible set to
>>> regulator-fixed, even though they don't serve any purpose: all those
>>> regulators are handled as a whole by the mt6357-regulator driver. In
>>> fact this is the only dtsi in this family of chips where this is the
>>> case: mt6359 and mt6358 don't have any such compatibles.
>> This is the only dtsi in this family to do this, yes. But according to
>> all other vendor DTSI, which use regulator-fixed when a regulator can't
>> support a range of voltage, IMHO, it make sense to use it, isn't it ?
>> If other DTSI from the family of chips doesn't, why don't fix them to be
>> aligned with the other families?
> 
> Well, but this isn't just like any other regulator-fixed in a DTSI. In this case
> it is part of a multi-function device (MFD) and so it gets probed by a parent
> node. That's the source of the issue, because then no driver gets assigned to
> the node itself.
> 

Ok, thanks for the details. After Quick check, Maxim does't use "regulator-fixed"
in the MFD too.

>>
>>>
>>> A side-effect caused by this is that the DT kselftest, which is supposed
>>> to identify nodes with compatibles that can be probed, but haven't,
>>> shows these nodes as failures.
>>>
>> I lack of data about kselftest, but according to what is reported here, it
>> appear to me this is something which could be fixed in the test itself. It make
>> sense for a DTS, but not for a DTSI because it expose HW capability of a
>> device, not the board, so it isn't mandatory to probe all DTSI node.
>> Again, I'm not an expert, the test shouldn't show the DTSI node as failure,
>> but maybe more a warning.
> 
> The DT kselftest is a run-time test, so it wouldn't be able to distinguish
> between DTSI and DTS. But in any case, we do want to check that devices from
> DTSIs have probed, a lot of the devices come from them. When a particular board
> doesn't actually have a node from a DTSI present then the node should be
> disabled, and in that case the kselftest ignores the node.
> 
> It would be possible to ignore this particular compatible, "regulator-fixed", in
> the kselftest, if it is a compatible that can't be expected to be probed. Of
> course that would mean that all the other regulator nodes that aren't MFD
> children and do get probed by that driver would no longer be checked by the
> test.
> 

Yeah this isn't the wanted behavior.

>>
>>> Remove the useless compatibles to move the dtsi in line with the others
>>> in its family and fix the DT kselftest failures.
>> If you remove compatible from these regulators, I think mediatek,mt6357-regulator.yaml
>> documentation file should be modified to be consistent and avoid dt-check error.
> 
> Ah, yes, totally agreed, I seem to have missed running dtbs_check on this patch,
> sorry. Indeed now either the binding needs to be fixed or the patch reverted.
> 
> I believe the most reasonable option would be to update those regulators in the
> binding to reference the generic regulator binding, ie:
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
> index 6327bb2f6ee0..9308008f420e 100644
> --- a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
> @@ -33,7 +33,7 @@ patternProperties:
> 
>     "^ldo-v(camio18|aud28|aux18|io18|io28|rf12|rf18|cn18|cn28|fe28)$":
>       type: object
> -    $ref: fixed-regulator.yaml#
> +    $ref: regulator.yaml#
>       unevaluatedProperties: false
>       description:
>         Properties for single fixed LDO regulator.
> 
> as well as updating the examples in the YAML. The fixed-regulator.yaml binding
> doesn't seem to provide any additional checks compared to regulator.yaml,
> besides enforcing the regulator-fixed compatible, which in this case doesn't
> serve any purpose.
> 
> Thoughts?
> 

Yes, IMHO, this yaml change should be enough.

-- 
Thanks,
Alexandre
