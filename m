Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953D31A3A80
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751366; cv=none; b=S0rDF8xBU2ngtcxL97cRb8Hb0EZcXCb1Qj4OkjMHyEyFQfnmbfKduFdojSAeyTTQso7G2KmSF8fStQHoaPUSoHMpQvHyfyzNwnZScka8Mqpn06Nps7d6CLcM3qS5P63dDic6+tn7UDA/DX2nxz21n/IANR48Qhhuo9shbB951t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751366; c=relaxed/simple;
	bh=ejS6ovgsQrYlFQ3gRomd+Ji1tifZg7j6PQr7o/pIqA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEYnolYVyI+OAjtWPfC+nZ3cepcAaCYJc6/nAAtt6R1j72HUnhTN6wJ/imLCHBc8ld5dvnYJL6fWucAjSc0wv+3a7fI5j55X5qZcZVgEQ4B1iXQfsV1XJmSvObrNAyURtajx6uSkNS/UFkGTi2X5CwEm21N99b75z8kSkC49bzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVFm7eyd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVFm7eyd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K9anoq015431
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eTvWyp6sTsoPovqd27mbVAax9KqDto0mtErtu24hwf8=; b=dVFm7eydEyKaxevI
	vfIkMyHij2+KG8/TJdppUEn6/PAJrcB0JRS2Q55gC3y45jHO2eyObmQMmo/2retX
	i2BbeUhagfrA+Dmuj597YjzMVP78MXaDgfl+yIZmd2J2558VgIY0nPg5O2X5xMPp
	xs6pcB35a29K+qIsG9R4fXd+yt6nT0oCMrxZ8TNzxKysb1SCB7TB7kXtbAqH3Ulo
	GQYBfbaD4KPzOiP14qMKeGF7xA4NON4vQg6fZ24Fur76iVEybMXt/GfdFmUnUS+Z
	6z6RZxuqhr8y+M6qAK+LzbKNdxvkxmaplJiFuKiL8qAby26gXS/0su5A6+4PLOa2
	ysvvjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rbt22f0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:29:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c547ab8273so95919685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747751362; x=1748356162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTvWyp6sTsoPovqd27mbVAax9KqDto0mtErtu24hwf8=;
        b=GLrR3vRniW8iNsN+94u2cVOTvI6rpRiJrtcztiFxFfZpVw3EIMQexGJFkA2U7sJgR4
         Hfyc4BRLWH66szx6lhWn3LFukG0b+5ro/zz9kb8ouhuc6yclNW+iUcJpTdKynGnJ7XrY
         +XVx23ebSDDjDBp7b3wwqdFV/qcAaHgTMsMJ5snbAFsnH1tFFrr0ARIjhPju4WKsMu2I
         9bU47Turq2gOR8g3MHEb6BuE3DCswSHrGZ3hnm/YTcQjd0N5OblymxjNBeJaSS2/ddtu
         MykEdAoLIGfzXve7oQp0I35p88YuXGNN28SeO+WAUonCFUCmcNsMTxSYsxcTxq29eHh0
         Wr9A==
X-Forwarded-Encrypted: i=1; AJvYcCVY7a1ngbdNpFkO+IBRftQSY8BlbjLcUq87Ttss/KOLnwIU+9ocGC+7oecralbXsv6V6c3U3iiWtUZBlFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNQnQ+YYmmElmZslBRHz+HHph/v+4PoM4la9BjcfDHKPPB6/ui
	g8tU4MKbigeUoVD0Kp1DFI0h/j/13fj5QaL3iDat4D/BbSOXL5gZBFFtK0fO2Td5TTXC5B8g+yJ
	3zY5FoYFHq0+nrdfdLfXtsIKH27ZXtxv9Ds7G6jrCJAjPbDNuGOCQn3FULFiEeCSMoc8=
X-Gm-Gg: ASbGnctNGc6/4gnzCg6XoGz6ZCGzOEGPZ/NewEUf+JwWkAtxm6OV1j+Ub/8itqvqyMS
	c9igXYEoH1gxbtv0Lo0xCclniQ0s88p6WvxKn25ColNtFQ3BzmYCrQQr/BfswgTX4yTqaPDxKId
	54pgFHR/IPwOZ7LCEO/2pO/t32o41v5ec2mKNBkOblOwMVlpVzKRUtfy2kzcd6qFhbuSZj+II1s
	ZBoRFIaayxItirW0SUpeQaNeSTjYlt8kjUKyfiNUqYL8gzTMS3OW2s36UpuuuEMTAf3P4acNWtp
	WUAO4QPadcM6pJwPVY+wmT3/kkHw2m6ryvPvYEjYacg6CT8YySvcWUuyVrhcdkqSVg==
X-Received: by 2002:a05:620a:4895:b0:7cd:14b:554b with SMTP id af79cd13be357-7cd467c0835mr1061653785a.10.1747751362234;
        Tue, 20 May 2025 07:29:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4MIcwFME3fzluDpcCr0w4MNNLPjzHGz+1z4WA1cnE5MqMZfKL4v0eGPZNm07L4mDAE11zzg==
X-Received: by 2002:a05:620a:4895:b0:7cd:14b:554b with SMTP id af79cd13be357-7cd467c0835mr1061651285a.10.1747751361733;
        Tue, 20 May 2025 07:29:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e674sm733754866b.24.2025.05.20.07.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:29:21 -0700 (PDT)
Message-ID: <a49df292-dcc6-457c-a565-984887687341@oss.qualcomm.com>
Date: Tue, 20 May 2025 16:29:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] SC8280XP SLPI
To: Johan Hovold <johan@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
 <aCr7UzmK7XCjpsOx@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aCr7UzmK7XCjpsOx@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExNiBTYWx0ZWRfX4QhCLaUwEsHR
 37lSci0DzjplPUbSvW4M/AYrDsPQK0fCf0UiuGX1nnKM6D9SYZUrn6qfixy46+iFp0F4bz8ndlR
 Vuna0sZK8RS95uwlE4Ike9JZ2jnVUNy0jp9/XNMMsA5z+xZW51kjhi5pD14px3KU/tmjnwLG8eZ
 gaAqGh1vWG/qwkslPOUj6eV+K2bjl6iCsMeDJ4TF4p+S7l0LrD/Te3wE3x5EB/I8sw5Q3gYd9FT
 RPz3FRRE+i8nI9loPt0/2KJvGSxxyFow/6Mk9sqUmhthghtCvQNO8IDmQ4aSIRrL5PJtJfPeYDq
 6S9ux5qlNu2ZDFaCZlZn5qLgIEEz5+zswFUEBfUa7maEBwJzXObolCNrtZHJWw3W8QkcNSlL5rV
 gFXNYMZo2Pez7DqAtsXu0EkG6bj3V0yeYO6HcB05aqet34ZHsNvBTvj5cy6xcUIgRww4bFn1
X-Proofpoint-GUID: PKVB6HGEFtEOB5Lf-qC2lHZ0u4TGCeKA
X-Proofpoint-ORIG-GUID: PKVB6HGEFtEOB5Lf-qC2lHZ0u4TGCeKA
X-Authority-Analysis: v=2.4 cv=dISmmPZb c=1 sm=1 tr=0 ts=682c91c3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=IX2s_8XrF8Sh1HtkrDgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=804
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200116

On 5/19/25 11:35 AM, Johan Hovold wrote:
> On Sat, May 17, 2025 at 07:27:49PM +0200, Konrad Dybcio wrote:
>> SC8280XP features a SLPI, much like its distant relative, SM8350.
> 
> Please get into the habit of spelling out *and* explaining internal
> Qualcomm acronyms like "SLPI" so that your cover letter and commit
> messages makes sense to people outside of Qualcomm.

It's difficult to judge which acronyms are known when half the words I
type on my other computer are TLAs..

> 
> Also say something about whether and how this is useful for anyone
> currently or if it, for example, depends on Qualcomm proprietary user
> space bits.
> 
>> Dmitry Baryshkov (1):
>>       arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: enable sensors DSP
> 
> At first I was worried that missing firmware could cause issues here
> (e.g. drivers not reaching sync state as with venus), but Lenovo has
> indeed released the SLPI firmware already.
> 
> Are there any other potential downsides to enabling this (e.g. before
> anyone can actually use the sensors)?

It's probably only upsides resulting from keeping the rproc in a known state

> 
>> Konrad Dybcio (4):
>>       dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
>>       arm64: dts: qcom: sc8280xp: Fix node order
>>       arm64: dts: qcom: sc8280xp: Add SLPI
> 
>>       arm64: dts: qcom: sc8280xp-crd: Enable SLPI
> 
> Without firmware this results in errors like:
> 
> 	remoteproc remoteproc0: slpi is available
> 	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
> 	remoteproc remoteproc0: powering up slpi
> 	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
> 	remoteproc remoteproc0: request_firmware failed: -2
> 
> but enabling for the CRD reference design and requiring users (read:
> developers) to copy it from Windows should be OK.

We shouldn't expect non-developers to have the CRD on hand, right? ;)
