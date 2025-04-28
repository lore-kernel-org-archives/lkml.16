Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2C620A5E5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745851321; cv=none; b=JOSDhVdvQPSs8BX4f48yafSUHzTFoCZ8t346Ko/NRC5USLe/CtzlYPoC1T2iSppMEVaKXjFT7n6GJ5gBCTW8FRB8+WkRfxz8rDBKfPgOehSZyKRYWsf+yQB3KdPSnAsgmAf3vau1zf4fzv53DMlQZQ8nQOs37kxJnNcENL+lV5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745851321; c=relaxed/simple;
	bh=Pk4B8Z9F6DCzs0R6AaWas25DIan6wu6rgaYLPtHiOFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VsxYr4oT7f6i+Jp0XM/DbKfMK6kXkyCXt9Cbg8khPdyFvQ9mtIUP1vKiwRWEms1spDT+6G05dbJ1RyVWZ2B2Jk5qrlsxCSO5wcsQy5Ou2+m+su/YVBlbK5gY5/TlN0BbbPIPGMpSMrbtEJ+XwvGTyQPVCOPv1nr1i0m9eyJgPZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Os21SPBw; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Os21SPBw"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912b75c0f2so334964f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745851316; x=1746456116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3C8ecqtlsWJdWnYmgKh1dE1AWagcaI57zvbzZiHqTQg=;
        b=Os21SPBweEmvnxSf7yqmOxbDQ2lSpOJp7RLLgfvSqBbaqGtAI7F4AcLxaDifIfeqq3
         Y0O0gCOIJ7qr3DRMVuBCJr0lYfvn/1Lgclx3heXm+km+h/1381GVHnGl1fL6cOiik1zT
         AtjsmXKHMX8TO67jQF+h+SE7fxujQ/OUZC6dDUO99jRXlwWxDTfO0VJT9C/KO0xxTm8s
         T5V25FwXJsZHUmx9ACMgR7Z3P7GXBC/6zfhmnOEbFl8MBDX9ftytZzshQ4sgMMsxTVvR
         Sf60KQG0cYzdskqJx6xGRpNMAC9DWKpHlOLtWGjAuNnqs6ScpseajaPvY59/vcYYpHLw
         814g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745851316; x=1746456116;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3C8ecqtlsWJdWnYmgKh1dE1AWagcaI57zvbzZiHqTQg=;
        b=ubgdwKc56N/jajwyIO7c5Y73PQVyHpDS9mLYzxjMhmcfi5OEAmymmlc7zZiI4uAmTb
         kCK/RZoWsEIgGgcptfJFLWzhr/Z3ESLBJcBMnc0dfEH+u4AbA3TFbk3z8vjBqNvV28Wa
         BS8229q8dWbl+ZW4UBgfjioZpf3ziRHcZOi21twZJ5yJzjjqXuSFN6x12yqGQW+PEUP7
         bDKmTiojyZ6EBjjPb1O4yz4e/C64h5d8pGDIn+SghNRHNselccLZ3IfrZIw7r3vS5Gnt
         K110faNqkkMzo4mvdmH+Y2bCv7K5SMdrAlPtBqM2/Srapg22pxc9y7xMTfOFdvxnnzbL
         bhrw==
X-Forwarded-Encrypted: i=1; AJvYcCWr4Ve89Q4ir7G7h8l/rp9+jxRf/YXjwuj2xndq/KaeSTo6NLPbq9OKa8Q4KOgcQFRj1h46GjQKtjtLtwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZhVRTHNQHYhbqfalORyr9sjqB+pv36nn1FG27f1T7iE6y64OO
	yaYqCwpL8B/CF/ENoK5G96LmMXsZDUFkTx7o7WNIDCL+/K4uxGhHJNJfVtVyTkg=
X-Gm-Gg: ASbGncuzmzXD2i/DdVMz0fOUvnkDRrdBiqd2KCbc2KGQCqrHW3y2b9gJ65K3h7SWmF1
	6u7ZHvSBr1wXGW6oxW+L1gBIcN8LIsJI6g498IN8a0H+TtTo+djC0pp8YcOTmgohBIA6vBEx/cr
	9DXwuKCAK+igrJrSYJsYBwRxQdsc16KQzjPwQjJSwUL9DgeN5QCY6HcLEJXUAgCIXoxjXa2vhKm
	qrg0uhrUR41mGCc5/sG2oqOf0GERXm7KqwpTX12FrnhgFNMHozh7iu3c39YEOrKEE9r8+xqY7dV
	CtgIMuhaIdDk4ehA6rSTPRNCjR91c3G5k5IZrrZLUz71lzN/ObX5NduTIEk=
X-Google-Smtp-Source: AGHT+IFC+L5dCQlISR/Rww5twRXYbVZ4XdccxceQoYvuWU8bkAImIc6lkhMr2QVI1yTHoBwXcLCOIw==
X-Received: by 2002:a05:6000:1a8e:b0:38d:b090:a0c4 with SMTP id ffacd0b85a97d-3a074ef34abmr3565710f8f.10.1745851316104;
        Mon, 28 Apr 2025 07:41:56 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbeda3sm11463839f8f.50.2025.04.28.07.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 07:41:55 -0700 (PDT)
Message-ID: <e61e17ca-fed7-4712-96fc-a9a2339de1fb@linaro.org>
Date: Mon, 28 Apr 2025 16:41:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750-mtp: Add sound (speakers,
 headset codec, dmics)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-2-50133a0ec35f@linaro.org>
 <dd271e8c-e430-4e6d-88ca-95eabe61ce94@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <dd271e8c-e430-4e6d-88ca-95eabe61ce94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2025 11:30, Konrad Dybcio wrote:
> On 4/24/25 11:40 AM, Krzysztof Kozlowski wrote:
>> Add device nodes for most of the sound support - WSA883x smart speakers,
>> WCD9395 audio codec (headset) and sound card - which allows sound
>> playback via speakers and recording via DMIC microphones.  Changes bring
>> necessary foundation for headset playback/recording via USB, but that
>> part is not yet ready.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> [...]
> 
>> +	sound {
>> +		compatible = "qcom,sm8750-sndcard", "qcom,sm8450-sndcard";
>> +		model = "SM8750-MTP";
>> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>> +				"SpkrRight IN", "WSA_SPK2 OUT",
>> +				"IN1_HPHL", "HPHL_OUT",
>> +				"IN2_HPHR", "HPHR_OUT",
>> +				"AMIC2", "MIC BIAS2",
>> +				"VA DMIC0", "MIC BIAS3", /* MIC4 on schematics */
>> +				"VA DMIC1", "MIC BIAS3", /* MIC1 on schematics */
> 
> Is this a mistake in what the codec driver exposes, or just a fumble
> in numbering $somewhere?

Which mistake? MIC4? Schematics call name things differently. They
always were, so to make it clear for people without schematics I wrote
which MIC it actually is.

> 
>> +				"VA DMIC2", "MIC BIAS1",
>> +				"VA DMIC3", "MIC BIAS1",
>> +				"VA DMIC0", "VA MIC BIAS3",
>> +				"VA DMIC1", "VA MIC BIAS3",
>> +				"VA DMIC2", "VA MIC BIAS1",
>> +				"VA DMIC3", "VA MIC BIAS1",
>> +				"TX SWR_INPUT1", "ADC2_OUTPUT";
>> +
>> +		wcd-playback-dai-link {
>> +			link-name = "WCD Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
>> +			};
>> +
>> +			codec {
> 
> 'co'dec < 'cp'u
> 
> [...]

That was the convention so far, but we can start a new one, sure. Just
ask the same all other patch contributors, because each of them will be
copying old code, which means cpu->codec->platform

> 
>> +		/*
>> +		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
>> +		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
>> +		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
>> +		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
>> +		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
>> +		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
>> +		 */
>> +		qcom,rx-port-mapping = <1 2 3 4 5 9>;
> 
> Does this deserve some dt-bindings constants?

No, because these are hardware details/constants. Drivers do not use them.

Best regards,
Krzysztof
