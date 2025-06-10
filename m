Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C951280A52
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549045; cv=none; b=ciDa79T7A42bFdPXS7Xw+6+jkYiuF+gLKaepAWsaOMjKYPBfEX+7VPIa5sJ9ZBSsqO2Sl0g28TtflRMDuWtZ5LzZdJKF0IVqCcipg0kxV23yJ7OkoeKQovy7iN853N4aNGC9ykEYTWetbSmA2H+PSx/OTvTUcN31PABMT3mTdW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549045; c=relaxed/simple;
	bh=8Ll2kob0wSYtYqhFir3rxUwGEptHOBJiRRepu1pCBG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3F8HHHXWoSFSn1iAB0sU2rfqV2lpxgUiUO/pbXOZn+eM73c0NqSsYEGpbjxaMOsc52t1ORJUQ73+S7ZMC+9VELEnZvF8Zuiw1iRhWtBC1ULbwBFDkOAf1s3CKhsHOxmSuLox6NpOR6nyC4OQTeldiUDkA4K+9nxp3Qf95PkLGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p8Kh8YV+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p8Kh8YV+"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so4251350f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749549042; x=1750153842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8TznzlpknrW4G6RXb6OY8061/Q2TUa7Ep05qd1XEIo=;
        b=p8Kh8YV+1h0Mtfja6dRk9SorulJQLx5zlkXLR4MhDw7Mzhwf3dam/zWzfjekXS5ElO
         TmDj8LqG0qOcGo1VeUPBJZQtltFAC7UpeFbsVy7u2lCE4aYnMfBsjpz7Vwa0IJJ4O1V3
         qxvd49C1MtYbOazkrUhv+gzXq5y+yN8cbZ31ajzKji7Ge9d36QoWQl8lpSW5Y2bT49/U
         cPmVYFU/8/xQ9q3oRRKDKCHOHUhZkP4DlcCrnjika9XKGb8/Y0htUZQ7Ikm6FjpD1aw3
         T+G6elY0pcY1WqjyRh8yfR0L8tIJ8sYsftNpxK3k4EX2lvNnprRkMIuiBFqfq+RpZBwv
         e5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549042; x=1750153842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s8TznzlpknrW4G6RXb6OY8061/Q2TUa7Ep05qd1XEIo=;
        b=ojzF6/y1ul9+x4Gdqi8fhucga1LRxqdVZLNv4624868MS9gw+F4FrCJ1h/iUjDXadj
         2//JPeECiiQXzra7CObu5mSOAksCAj7ZUH3547AAO1V4b0oKG69lRitVw726J9x+1gwp
         9NvDEq4eaRsxGOUcqSmZwF67HgTC24r24DD74HxLn9BxXBe+kU7RdXLVbZwhK4HtH7KF
         OfUc+xeY0k0pEZ/fbtek4LwpAh5eNPnaPZm2VPbE7YIl9Q7OiIepDdxuBNEUrIij3NBN
         RbgagLgEfy/wuqf9v3YFADQeZFc+Qewf5/uwqBzLSmy4fixTkBUn4bSV6giTKktLmsPq
         0xPA==
X-Forwarded-Encrypted: i=1; AJvYcCXng/ZGmYs4m59yZKHilk2tCv63KEl+6tjvjsPFGA35Qix6wCxx/iHlD6igHJg7qdQRsBLAyl/ypiZDoYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz29Y2mq8fyH1sC1A2OhTrukZpPILQeAyUuoCdsYTaU4RwJacvg
	AMF9bxeG99lrXkONIOBdzgM2Hoy9BHWNcBGFerWl8rD1veM1Ts2b/HL8Dcsl60A62To=
X-Gm-Gg: ASbGnctp/MDjXbZoKHPm6wet6K7jcnQpZRbk6nf2sp+NalFHv2G774VKRDSt5mIzDcd
	+wlykXqvWz/ONNwyeagCOE/efZV6X9S+9EtzvMEOajXqHdbvPy3z2rHMKKOAk3qzrVlcAh+sXkS
	XFgMmJqhy1WWp15T6/ApuQ9WdywMjkW7Kn5aPP5i04z2dCFZ6YCk5/EOPO0aS09Ttk8vV2skTdw
	aNL3bwVrMFPr8yK1MfNNs3a+u7BJkRIazHxgi+JLf0JAEyK6bj3YqVCXiSBc7yRwN5JXlCHGnYM
	LwZsK0cFLSJalwG4IFDJu08xNJkgf7uNLVHkZX+N1UWybFg0jp9MMLPnRujErZ95AGRVJqcAY5i
	Piy0kE9VNELtO+HOvKfPcQSFmz3U=
X-Google-Smtp-Source: AGHT+IFusBXxkEoy5ESx9MfQVNtq1yC/GkKu9UVFSbJCvfrUmjZpjS8AwFM+vB8gJqBUqNEpqvdK3g==
X-Received: by 2002:a05:6000:288b:b0:3a4:fc3f:b7fd with SMTP id ffacd0b85a97d-3a552275450mr1444778f8f.19.1749549041672;
        Tue, 10 Jun 2025 02:50:41 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244fceasm11618998f8f.82.2025.06.10.02.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:50:41 -0700 (PDT)
Message-ID: <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
Date: Tue, 10 Jun 2025 10:50:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/06/2025 10:48, Vladimir Zapolskiy wrote:
> Hello Wenmeng.
> 
> On 5/16/25 10:27, Wenmeng Liu wrote:
>> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
>> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
>>
>> SM8550 provides
>> - 3 x VFE, 3 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 8 x CSI PHY
>>
>> Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 210 +++++++++++++++++++++++++++
>>   1 file changed, 210 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/ 
>> dts/qcom/sm8550.dtsi
>> index e9bb077aa9f0..722521496a2d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3326,6 +3326,216 @@ cci2_i2c1: i2c-bus@1 {
>>               };
>>           };
>> +        isp: isp@acb7000 {
>> +            compatible = "qcom,sm8550-camss";
>> +
> 
> This is the first time, when 'isp' label is used instead of 'camss', it 
> might
> be I missed the context, is there any particular reason to do such a 
> change?
> 
> If the label name is changed to the regular 'camss', then
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> -- 
> Best wishes,
> Vladimir

List feedback from DT people is isp@ is the correct prefix.

---
bod
