Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AF119F461
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 02:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751856109; cv=none; b=NMPf5NM6dB69p1vDGbta3mIll3+4eQPWuKCNErrJH7Q9n6qFQ7HhGSxNW6ZZJ5X3HSx3bkyrWS1kWjgyMgO8wOdrgEyYXMkw2HOrYTwpRDICQ2QJvqrqJoWbzqRj05+lAVm6GIonkMGM0ZhGl+ObhkSaVXEZkBUd2vQ+4yNaXZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751856109; c=relaxed/simple;
	bh=Bd7rI7VqdxM7c2dQxdHppqIbfL9os4fnQzmeRFd+rM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtExrvyCK+9PVZ1KHjcGAEzhvwh58HzO7JMFa5CcVPw9iVN18Xy6oiNaBazSLh9dNK6SKvbTYI5RC/9hZtXGUscrilqwlPEaL7VoJZMcsaqiFw/aHKv3ptFCdviXv8AxdmCCGvEDecFDQKLQ9wqSrclfhkJ3+ficGFR7PFEfIuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BqzR57hI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqzR57hI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566MhRFJ030350
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 02:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uMeglI13Y5o/t9jXpo6MASFHOtBoo7o4JxuRVGPiJe0=; b=BqzR57hIPh5UN8KK
	tb4AxnyLWWwO4PBbELcYyy+h77/4BvhAC6tIHLVPIX5oG5LqeYzqm8tqXJBDpxF0
	msmGmWncJHRTPdenIyBAQpgScB2zMPPAYMW8bZWdnRXaUVx6UX1ewjgqPAHNyV95
	ZLiyTmTM6vab4E+sgEGgSmDD7HrDVYqLc95/2LwRkUSFG0yrLXbiyL0Hs9ZCAy5D
	1LtcKGMsO4IQRxRr4A3pQjHULP+907l6kI83qvEfqvxVsOrJrQoFXqRya6Vt3V6E
	wGEax8JnECRjUbMRyf9DBFrA3cfLK2SuGGqDBN+3n5iaJ1mb7jhQebX21BclzqHj
	6vKowQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2arf3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:41:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74913385dd8so3865552b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 19:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751856106; x=1752460906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uMeglI13Y5o/t9jXpo6MASFHOtBoo7o4JxuRVGPiJe0=;
        b=NnDXIWt/iDgBF0IrzJONS0IYM41ZqtgijgNd51bU0AD+PphHCOj/9/9Z980JrnS6wP
         iQO1Ydnk5fVGlfhSNm8yWQLcmXHMrvLWiOzxItPun7DexcbbFCiE8xgv2Mz6z18WqHBd
         1M4XHUHSs1/sI+ClLqVjpSoj3q3M7L47sjkkgJB64/94HEUce0tpPljgy1YkgzDG9SBc
         vVK2zRClyi1R4drQO/B/7QTnShTl7U56/RAaYU2Slecrxb+U1cViYptWlcAtH3lRQU03
         8BdrBQN2gKsxlpfmsKgqbNqckwNWt8V4dPRAi5CGfU1yIiwUdsD48GbL2v2Xkpv3CyYx
         3u1A==
X-Forwarded-Encrypted: i=1; AJvYcCXBhH2322tPPIS76XwHaNCyomDF2COKSzIcLNLxZCFwwYmYZLdB6S1ulMTNw80ilirUEKTaEYKJdbk7YiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbLTuMaWg6M/cyoGAa/+Y5g89jxavElJ/Wu80fZ89QlybjorFA
	76hURWiuRbu02pAVSVZu5KLuaVuIGqk15MVbMAAm9XD7zjkTkcZIErO5SY1d7Jr7R9KzWFoJTcQ
	k6SX3tV85IcIXQAMcbJicODd/4ppUPiVcun4oFgslY7Q8QzDk4CyxqSpeXez15km8Fyc=
X-Gm-Gg: ASbGncszmaSMP4JPrvePiYwIiv0s68xcsjCZdn7iBSZfdJw9ln2gSsOttwmo7Otb5CN
	YYYwiMMk4sJ2q0E+OX6OTBz8KIF4u5DsIyPpL4zO7HE+kT+YRoWRvnHskn4vx9+c6jn7boOUBbw
	x8sAs6VoNdKGqY2S4ud5KC1x+30czy7EJNATtZViiV/leKU1BZ+YB7G/scsO/T95U9BtXne6FY6
	yKfk87xMoKpfW2fryYnA4ShqKRu94nFYwHq4nE60DDp1LB2+6Dj1nhAh7Rv/ZFkGDU7DgVrhkjS
	gg/WLyUB4JEHb/Uwq27gmWU+nfiZSelzdkWBux40mnrkDmoeEy0NoueIcnkN5YyRTnjNR0Q=
X-Received: by 2002:a05:6a00:4649:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-74ce66d595dmr14009548b3a.22.1751856105828;
        Sun, 06 Jul 2025 19:41:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGytTbiSMyewHgOSmCijjeGIwYcZKCqhu9mNO/04g6dtCqLUFDHD90v53IS+qCvT6lBFoNArA==
X-Received: by 2002:a05:6a00:4649:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-74ce66d595dmr14009513b3a.22.1751856105242;
        Sun, 06 Jul 2025 19:41:45 -0700 (PDT)
Received: from [10.110.98.120] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce43d69d7sm8102644b3a.177.2025.07.06.19.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 19:41:44 -0700 (PDT)
Message-ID: <a6cb75e3-1cfb-429d-9584-85a576439852@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 10:41:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250704-615-v3-0-6c384e0470f2@oss.qualcomm.com>
 <20250704-615-v3-2-6c384e0470f2@oss.qualcomm.com>
 <e32f074e-72ac-452c-9b1a-623750548cf0@kernel.org>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>
In-Reply-To: <e32f074e-72ac-452c-9b1a-623750548cf0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAxNSBTYWx0ZWRfXw6XLbFujvS7Q
 /kOdCYndgs/EBj+Iqgk6TKNqG4IT4ggMN26wNn9vUJGz83K9c0CwNAHc+F1XF1uJgpEjVR/3m+i
 OojWIplPU5130WeNuveLQMo2WMuZPTdHPcy+jNIsizOlUcy082DE52+0pU3ukDeampZiGAfjzO9
 kiiPU+ruPwyjUMUsiIlYoA3KXFLYAJzTiaow1m5JR++3DWTJIx67RTwBanDCZdCy8sXaxPT2fTH
 Et15Pqe/QUzpm0E8XficsFRP+CQ1EVyXCXv9+8O9SZLWNe9H6TL2nHEvm9+7WXZ6nIbCZJMRjuU
 DhhMljjTtvEGa9jaZ/D7hS5f3GCSWc4dstWfpheM7FP/ZYyQ/0SnYgT1zNhHKyOWi0pIcGcfQsa
 OhkLudm/0WUQ6DRUEImOBKgLFomt/XHeH/iFTLy9nshDjhf0546VNK7byqUywc93u62Kch84
X-Proofpoint-ORIG-GUID: dgT3CY5r4okHJvhTiS4GdU7dDx1XJ0LK
X-Proofpoint-GUID: dgT3CY5r4okHJvhTiS4GdU7dDx1XJ0LK
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686b33eb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=PaKHilmXYQLPPyyA4iMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=952 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070015



On 7/4/2025 4:05 PM, Krzysztof Kozlowski wrote:
> On 04/07/2025 08:43, Yu Zhang(Yuriy) wrote:
>> Add a node for the PMU module of the WCN6855 present on the qcs615 ride
>> board. Assign its LDO power outputs to the existing WiFi/BT module.
>>
>> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 +++++++++++++++++++++++++++++++
>>   1 file changed, 135 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index 011f8ae077c256f079ce1b07720374a9bf721488..e21524a8ceffca0c68951d04fa6895cac5bb3d0e 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -18,6 +18,7 @@ aliases {
>>   		mmc0 = &sdhc_1;
>>   		mmc1 = &sdhc_2;
>>   		serial0 = &uart0;
>> +		serial1 = &uart7;
>>   	};
>>   
>>   	chosen {
>> @@ -209,6 +210,85 @@ vreg_l17a: ldo17 {
>>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>   		};
>>   	};
>> +
>> +	vreg_conn_1p8: vreg_conn_1p8 {
> 
> 
> I don't see any improvements here. Please read DTS coding style again.
> 
Thank you for the reminder, I made a mistake during the rebase. I’ll 
update it.
> 
> Best regards,
> Krzysztof

