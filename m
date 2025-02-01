Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D95D1C3021
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 15:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738425390; cv=none; b=htawyPUVKHHZaMjOwQn58fdtTE7/weGHHTwcaRY9BQyGMBQ/sHN8MJT5TCzMcg1ifuJJBPovL0AsBmXlD9wfQutXNhKC07H+q7H3/tmqXRF3Y02cpyG5uFot0E1hnsNyx8gorGXJmSCciZp3L9O3Yr1ltAIea7z4OZf/WKmHtH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738425390; c=relaxed/simple;
	bh=3ynjV06sDgDSo077gCycJ6AmBGSkax0gKYdfkjSHV34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBhjRbBZv72BBQGhmdbHWGKRLAXHzsFwQ7yHAcZ+U+oCR8cPeNjOe8V8J1Jgqdf3cjlSrUhCv7A3+JpzoAB5kF9nUuzkJiTkZlRz+RSKTMQ5mmGKRskyGBQ3W5Y6SzWNwYSzOYiU4Umt4xGRo709EDfpiAYbTRvdxlv9HE/LkBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wuczx6zz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wuczx6zz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 511BKLsd032258
	for <linux-kernel@vger.kernel.org>; Sat, 1 Feb 2025 15:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxAI9QfYzUboOCqPfk86tl0uJEcqlI27N0d6rOMmn2g=; b=Wuczx6zz54Cwy1gA
	XovtkIrG5aZ+hXsHE7QufKxE9d+kBV+zVhLaV94NPy19REaCUYF/MXe0O4Av6FHb
	fTiYGKmTOwQcDENGyh/St69Ga/Qv0cjwIN81+Zr5rS7FRsOVhMchRwrb8n8sV1ne
	/T8xS0VM4fqx+zxncVffSYtqVyw8XwRvo6j1LiVNQDNTRMIAEZkFCBOEfdm4yFer
	N9KsUr+/dvVrXScbvFDztgmCXjK+eOBtDQiX+7RZFt4n18bWYM7fGciDjskmJlgV
	qTy8Ui6wEFn82oWuvecWS2AUEGPAQVe28tQu1Afn20FAhA6L+SCSyj++xFMS542E
	T/clpQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd6ws3cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 15:56:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6e43ed084so72197685a.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 07:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738425387; x=1739030187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RxAI9QfYzUboOCqPfk86tl0uJEcqlI27N0d6rOMmn2g=;
        b=LYtGBzdFfcnewCnW8F2a1PboFOBkK+1n2dWgFs12Y27VEoTXtvsC1i9iZQU6HaKsp7
         8/cTKfybV/zCJpuc3zSWizP80t8qbeV/6RLiud+Lt3tMgToT/30VuvpNKf06wbaAPDV3
         vPIM3mrx7RtNO5QjSYEebbN0W0MvqzEK7JRnaj01yLpRInHdsGiZmH7S69o7MPIdgm1b
         Zf1VpRAvUvyttpavmBVfFEb+QPqHii6UoR8/CyDefDxAlKSWpamRtg4YuVxqZNn00fn4
         DRMTOsvcrYaV20oFiT3y+cB2AiU4CSpP7SbiB7XBUCq5Q45ZzD+7K8yuuey3Urb7D3Rt
         q7eA==
X-Forwarded-Encrypted: i=1; AJvYcCXvJUOcGD22+7HPe3jUevndrC5JMk0VE0dQ+0Tqs2re2khyO8uaQ9t8+wneUkRYOijc4CoOI3teODRYME8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBqLj/NSG+7Ny5QZMT8E0l/vEmw9ITlOjOA/FE0Z2EXrjXX84j
	AWsquRCW7m3Jc7hHzMENTreEVUdq4bD2+/e+pOFLU2Hlm0SA8KSarnfZJKbOMAOo+WY0gswP4V/
	Eq89aNEndDSJwsA/2KhnOpe9RKoPmbABj2xjlZrkt3jzjywQ16Mz3PnrTTwHXRgc=
X-Gm-Gg: ASbGncuIVZ7bac6IBsj6goF9mShYcl9E/awiGYy75YKyzpbCLUvBdTIzgHyovvIR0eV
	YDq12qQnugQsFkRwc5SIsExd2XYIjciDfxhEhocjWxNJL/evqDbcSe9DhIyR6WBx7T1uikz9cto
	AUg6d0lmH273sSWFTne1QLLyANtMmgBncPJ7WRiW3upQzWyV8poigwlVGZdQgNy9CYC/3TTGE/V
	Km3EkTilSO8DxBiiMEfwpP4iShjMo5yN7yk63DjAVCnOlIyjWYGzoNLAyxaz2Hx61co5rUh4PcA
	TfHFgcb8VfUOiLuLD3Lyi2NdPDZ/PwCAuUmoBNASs2uUtiYNHR+Om94VG1o=
X-Received: by 2002:a05:620a:4246:b0:7b6:da92:fcd5 with SMTP id af79cd13be357-7bffcd0a7bbmr802318485a.9.1738425387283;
        Sat, 01 Feb 2025 07:56:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCspEPtqtytsQHm2+LoVv9U32cEp2WRHWSz2SmhEQGoYUVNNLQcIl4uNOb1zVwXxus0FRB5Q==
X-Received: by 2002:a05:620a:4246:b0:7b6:da92:fcd5 with SMTP id af79cd13be357-7bffcd0a7bbmr802316185a.9.1738425386886;
        Sat, 01 Feb 2025 07:56:26 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e4b6dsm4577092a12.24.2025.02.01.07.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 07:56:25 -0800 (PST)
Message-ID: <96c4af07-6adb-470a-8cbf-784bb544ff76@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 16:56:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: phy: qcom,qmp-pcie: Drop reset number
 constraints
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
 <20250125-topic-x1p4_dts-v1-2-02659a08b044@oss.qualcomm.com>
 <20250127-hungry-bald-groundhog-4f7d4b@krzk-bin>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250127-hungry-bald-groundhog-4f7d4b@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a3zEZ1u1_gBLG-GNTSkRrgBfLF9z5VpD
X-Proofpoint-GUID: a3zEZ1u1_gBLG-GNTSkRrgBfLF9z5VpD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502010138

On 27.01.2025 9:26 AM, Krzysztof Kozlowski wrote:
> On Sat, Jan 25, 2025 at 04:31:18AM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> (Almost?) all QMP PHYs come with both a "full reset" ("phy") and a
>> "retain certain registers" one ("phy_nocsr").
>>
>> Drop the maxItems=1 constraint for resets and reset_names as we go
>> ahead and straighten out the DT usage. After that's done (which
>> will involve modifying some clock drivers etc.), we may set
>> *min*Items to 2, bar some possible exceptions.
> 
> You drop minItems now, so that's a bit confusing. If all devices have
> two resets, just change in top-level resets the minItems -> 2 now and
> mention that it does not affect the ABI, because Linux will support
> missing reset and it describes the hardware more accurately.

This will generate a ton of warnings and resolving them may take an
additional cycle, as I'd need to get things merged through clk too,
so I thought this is a good transitional solution

Konrad
