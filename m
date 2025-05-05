Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42DE1DEFD6
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746429910; cv=none; b=rjNWcNYfJmtmmMwD6ZDeFeUVMgcAtODPVmNYHdgNBfu7bnnVV1tBbZgs+Px8P70H2lhIKE5s8OJlyQLxY6BQ2ZVcIqJFeodJrzNcm3OR+N5x5/QSIe/Dr7yxUF95zr4aRBRLjTZ7CUC1gqJif034UbEgWplknUqiTvBMjhIiGg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746429910; c=relaxed/simple;
	bh=ZoIGW7Hdcr71KP+zuODJ4SglOvk7FuvdV1Q3fzoxcrU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=E0Xm/QBuSRJktdkA5hTAbKvGU00J8XUnjEdQywtcbn/C69svy6fmBQRDlKtiOoCH91nEIAQt6Y+k4Wdbu4DbbrLk3AUSNmDmx5pdWHSsr3dOboW0wO+DuubkDs3Pvp45IZPzUPSGuoZBXXjy0Yg1YYW8/PCFdzTNVeYGcHTh+GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cmVvOJPJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cmVvOJPJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf861f936so7257525e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746429907; x=1747034707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AD7uDfXNypqBe+HukkrcQnJsSohLCd55Cb+NQUE3a00=;
        b=cmVvOJPJcJoX9ieWX8vUNbDvrLS0ZXGh0fA0lgd3xSoOSAmdP3Eip9z8uU6XTW8tyE
         JxSJ1wL2YBqoxm5Y8Suw+jvHqRfw7HvKTIutaXBnRsnneM1oAfzVH8rHiFBHs1JJ0t6v
         z+5DYLjdkQJy7CGyVNX/QZEJJVdPwIccy1sEDKfyhrKn0rKW1UIgQWNZpxiPeduCvHbK
         u6qC59U1ORhQY5sK9PTVEeOJi2XZVrFuDus0dr+t8FOraFUGI/H6qc56CAq3iDFmaGns
         QzuIU1LCTxcUc5KH9mUm+MOFYdPkKK9PB73SmLFhP3xvwTc4pdoUc+Ped010Ghj7a+ok
         kWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746429907; x=1747034707;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AD7uDfXNypqBe+HukkrcQnJsSohLCd55Cb+NQUE3a00=;
        b=v0e/PgktFZbEWx9rJeKa4ZyScS9DvgwfsyN/LOtTtDCZ4XbcaTS1qz+xEFxyIW3Hxl
         um76t2IpJk9PSC/h3QRk48vsyHjv2Gn3QU14InhPcjHt+gwOHKY4hAM1OF/T2VAQNelL
         4gNIkjjeoR5Pfs710Xvp8vXDfiObguU1uzWMm+9TdYHYlyi4IRdhUpTKWH1h5T8KNa8a
         FZBawD2mlZKHC9BXsP3qHRv27MAIWW9P/4IiPPcecuuAPc5I7FDhRRjtCaORDmPr8r4X
         guhxuASzQT9x4v56fWa34C3LC3o+CKffjfz2Hzr74y08HFXWEyKfEHMLvEv0kk4l8jHe
         RCbw==
X-Forwarded-Encrypted: i=1; AJvYcCWsk9v76gvudi33vtVoltCAVDuin+FdA0b83m3+GNatQGErQgc6d6HE4hPNsG3vN57RZ3ZQXTRod9uV/N0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiQAUfLi2avaRQCUgJXsnDHcH4PU2JqdaezdLHgMowZ6LXJg2s
	/w777lxvYPiB2wB8y4592Sp5jQ+bMPlq8x5qCZbt+mXEXoHNKMN+xc/DAn61p5U=
X-Gm-Gg: ASbGncuh7Qaug1w3yu8MPVpsxUyhzKE4Myz8LxTR/Cd3/jlgfbHgW77jOp10E+gVTac
	EhkJtTGfLr5LU9OFqKkMmFnDA4EfSI0IPaHntjrIeQkqT6xb8FG29gwi+EFnD9WMWZiWd2Xzfqr
	HhmAWAqPocnx1Mxa4BiiLjv9KVcAbDYY/iqoEVmaIyb45ADWjJ45g+hJU0WomM4GLnY0KxbJAiX
	gGzmtYFKlyzBOr6ycbReNtCg/dgxyCK4ZE7ageE/iWJTalIEVBJfShh2crPy4ynbOTU7ZDDw30V
	o8pf2vZo3/cNn6uTrURoLgVz+2Wf87RGA1auN/afp1Ghi6kDQ0/Iqd2Hrh8=
X-Google-Smtp-Source: AGHT+IHARNDco34n2O4SxtdS+2Wglwn9LtPbzmzMjurgVj5CGD+8Ip/Ix/o54AILKhNRmzbRv2Tmlg==
X-Received: by 2002:a05:6000:22c3:b0:39f:6d4:fd44 with SMTP id ffacd0b85a97d-3a099af36b9mr2906684f8f.14.1746429907128;
        Mon, 05 May 2025 00:25:07 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b16ec6sm9267862f8f.83.2025.05.05.00.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 00:25:06 -0700 (PDT)
Message-ID: <ff7f3014-5cc8-45b8-a248-c24e28779f4f@linaro.org>
Date: Mon, 5 May 2025 09:25:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 1/4] arm64: dts: qcom: sm8750: Add display (MDSS)
 with Display CC
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>, Abhinav Kumar
 <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
 <81205948-ae43-44ee-aa07-e490ea3bba23@oss.qualcomm.com>
 <97ae84c6-0807-4b19-a474-ba76cc049da9@quicinc.com>
 <59e3e34d-83b6-4f83-be4c-eeaaba9a353e@oss.qualcomm.com>
 <387f8a74-8c5b-4b8b-9f6d-8f32cdadc6c8@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <387f8a74-8c5b-4b8b-9f6d-8f32cdadc6c8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/05/2025 08:49, Krzysztof Kozlowski wrote:
> On 30/04/2025 09:46, Konrad Dybcio wrote:
>> On 4/30/25 1:07 AM, Abhinav Kumar wrote:
>>>
>>>
>>> On 4/28/2025 2:31 PM, Konrad Dybcio wrote:
>>>> On 4/24/25 3:04 PM, Krzysztof Kozlowski wrote:
>>>>> Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
>>>>> DisplayPort and Display Clock Controller.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +                mdp_opp_table: opp-table {
>>>>> +                    compatible = "operating-points-v2";
>>>>> +
>>>>
>>>> The computer tells me there's also a 156 MHz rate @ SVS_D1
>>>>
>>>> Maybe Abhinav could chime in whether we should add it or not
>>>>
>>>
>>> Yes I also see a 156Mhz for LOW_SVS_D1 but we had a similar entry even for sm8650 and did not publish it in the dt.
>>>
>>> It was present till sm8450.dtsi but dropped in sm8550/sm8650 even though LOW_SVS_D1 is present even on those.
>>>
>>> I think the reason could be that the displays being used on the reference boards will need a pixel clock of atleast >= low_svs and the MDP clock usually depends on the value of the DSI pixel clock (which has a fixed relationship to the byte clock) to maintain the data rate. So as a result perhaps even if we add it, for most displays this level will be unused.
>>>
>>> If we end up using displays which are so small that the pixel clock requirement will be even lower than low_svs, we can add those.
>>>
>>> OR as an alternative, we can leave this patch as it is and add the low_svs_d1 for all chipsets which support it together in another series that way it will have the full context of why we are adding it otherwise it will look odd again of why sm8550/sm8650 was left out but added in sm8750.
>>
>> I would assume that with VRR even fancy panels at low refresh rate (in
>> the 1-5 Hz range) may make use of this, so I would be happy to go with
>> option 2
> 
> Corner cases, at least high frequency, was omitted intentionally because
> for example NOM_L1 simply cause hardware reboot. Something else is
> missing in rpmh, but I don't mind documenting all of them.

Lower frequencies work, so I will include them.

Best regards,
Krzysztof
