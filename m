Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5040828C00D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549580; cv=none; b=DDRBTP1NsnJL2ZXPuckq2CnMdbdC2WLVNfGabSX7Pg3ec6BER1TKV9WVdg1TLQGQyM+QspNrK38pwf8+P+OsRXEUKEOY+3kUhCOD4uqthUToWrC//68lCZ2Mm+0Vt9dk/TKsY72llOvp8ObfWDw3eZsfOD+3TbS/Yz4qH41Q9iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549580; c=relaxed/simple;
	bh=F1y1TDuWaauSn1I3U/MZeKUHLkrykxmpbfGLjOlvQZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+fC1bHIiwHYug+CTunE5Vrsx20rDl1NnvQm9nfcVGMZlWtF0UAtf6iA/eRJegsjUZIWaf4A0KkrSV+k5a5sKumGgleLMlL81bOGt+zsTd5Qr2Oq4/utlDA57L4eY7Q92VpP4xOZL9dA+ZRTii2pT3/qDvKNXYOi2nlgAxB2f7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPd4HT3b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPd4HT3b"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8ulvG025168
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJO9i/czZYar/OKw/Dt6/+F7Wbhl4a9/21tm9FprFAw=; b=UPd4HT3bLZN+83/m
	PrJMzZ966dXSyLQuH3s5AlWrUuk5O3Ycr4IfsKYXOFODwvk//iHVkKjMtVPYao3q
	PutH2m+mSWkbwD84ST4K4yaxwn0dR0YZMkfdla1wxoip0f7zym7Gw0WQZSWE3d3J
	C5ZLb1+e2kKM5ZiNLioUDVzSE1DOkgVp9/Kg5hongW1TF7ABNcTgTCWXPqwjH9nD
	JE8oLJyRKmDrHgN+e8VaI+jNY/IPI4XeQkdm7Piyar0LHVzxy85Qs7HTp7PpCDQe
	DPQGY70NVNgF54NlF+Gn8AkmMujG1bJOt/NmeOMD8qEU8bfNWn9UOTLki5eBZScC
	PDI0Kg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d1212wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:59:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b1fa2cad5c9so3234410a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549576; x=1750154376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJO9i/czZYar/OKw/Dt6/+F7Wbhl4a9/21tm9FprFAw=;
        b=FQAM/T0An3ZvHZnOAuv3W2sUkTJIGuN8L6TYkNlDUMbfcmJxyooSBktS8GYjXQKRhr
         1FYKd4JO0z61uq8yZQfncW0RllQnfDNn9+spuXdoSzixQIpJIOEqoO/keVvA6sHPOs5p
         JMJasRt+ayqxwcSgKLIVC8FK99IDtNq810YUx9wmfufI9Dl5d2P6/alPLgYW6YoPQzuY
         eGFe0gDIS5yUC2y2DXKe3AUiDugqzGuYkTKWXHOb/y+fxdFzzRy85YHB83UleeOY46E0
         p3CW56kPu1rZ4uj5M81Mjn34/UViJw00Wo3FaQKuXuDibR5924H0EuSRihB7i00o1BDK
         0JVQ==
X-Gm-Message-State: AOJu0YzdnLM0n4FATcC4MAK/uuCHwaT1IRNW6BI9JBRFFVmowuhMr282
	TjCLMG0NEAzJaI0qAaf753GV+5sNiBKk5lxQxQuNc0ItW6Bf4Qez4E2+JOWsRx7tmUIIeiTiHbc
	MnGnRfIfA67Fma9/Hs2A1D+kRLI9CSkO7GrKqSJN4XxC2pMBB+mk8pABMVzVs6TmTids=
X-Gm-Gg: ASbGncvNmvksIYvTFXkj18iIJ9i5Con0rUafxFmNPjYb9bZfOR5wi7Q0c4ULIy5lon4
	y4guxHWULU32fyI0TQ0CZ2ZBmvJl2g7XCxF43pSXHcAS/ND8Sjn1Pbt+iobt3oWXzibplDteAwY
	U0aRT4tlO1z1xvdguS9h/Oh7qHHtfRjqqg4e8KwbRaLCPALl9ndHtQ75Kpn3G6wryuuwh59wm2H
	6gOrZYv6joHDNcuTQPLaEEIl0sryDkIScMBV34/7F/kTe2cXnPWhWScIxK8jpIyC+654QEMy8jy
	+YFhsV30NMjUzhEQD1adlpSNrMiFzLKyXz9magOarfIihx5dgQs=
X-Received: by 2002:a05:6a21:6481:b0:21f:5629:5b9e with SMTP id adf61e73a8af0-21f56295e60mr12309226637.12.1749549575812;
        Tue, 10 Jun 2025 02:59:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCod2Fos0MENsVjz0hvMb9ntW/mBV4cNNsa8Hp9NfSIBo8DRdOx2IIYdOL0IuztGqHPPqkWg==
X-Received: by 2002:a05:6a21:6481:b0:21f:5629:5b9e with SMTP id adf61e73a8af0-21f56295e60mr12309205637.12.1749549575443;
        Tue, 10 Jun 2025 02:59:35 -0700 (PDT)
Received: from [10.92.165.7] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f66adb6sm6521748a12.48.2025.06.10.02.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:59:35 -0700 (PDT)
Message-ID: <c4a5fd70-1d72-4945-ad77-fcb4f3a0e20e@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 15:29:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Flattening USB controller on SM8450 QRD
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
 <7f5b7a49-28a0-4923-bbf4-8b0afdefe571@linaro.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <7f5b7a49-28a0-4923-bbf4-8b0afdefe571@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9xcUD4AB1WaiDWViENPkInqTGWgWkfIk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3NyBTYWx0ZWRfX/oENZLb2Ag/h
 y2QFwCSNaprDE2z6WMXo8mdEqpbik8coLAZIjqOldT78SJkzX6EA0dRwa6A38T7eOoCj2J6Zer7
 T3OqcTo7Cbg3cRBVkRkEFkU4CvDDhgjwor5o9aDa3BGkdD/6Clxk9Gvr5nIrPm+lN3iX5AaxBp0
 UDn09Bpb4QHFrh+J3lLd1fLp8KY5So0KWfEy2zELsfWw3zYNrcQ3gMCN3KprryaTJQz1lrkRbEx
 7a49GJ72H2NGsgknzOdoo+HjYtN4AEsNEoBtGkFky5Y6WRbajxoMzDGn7La8w3sSHnTP066UPxz
 sBCqdQNRoQhGwgF2xbbNPxHESFOag9TZJZAE/eqNJJr586Ornj/POcAD7PQ28jZRg8lTfqgSqo9
 mwryNnctIutNS7yFzUhb/ldsA1p+6wFLuGS5Rjuf1P8D8C1IWbDpMoZFzUlZPeyq9bgxi4jr
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68480209 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=YA6QX4G2g9P-5r4Gxh8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9xcUD4AB1WaiDWViENPkInqTGWgWkfIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=810 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100077



On 6/10/2025 3:04 PM, neil.armstrong@linaro.org wrote:
> On 10/06/2025 11:18, Krishna Kurapati wrote:
>> Flatten USB Controller node on SM8450 QRD to move away from legacy USB
>> Qualcomm glue driver and make use of new one. The series has been tested
>> with driver changes [1] to enable runtime suspend/resume during cable
>> disconnect/connect scenarios.
>>
>> I was testing on SM8450 QRD and hence flattened usb node on that platform
>> only. If the community suggests to flatten all platforms of sm8450, I can
>> do a compile test for the ones I can't get hands on and send a follow up
>> series.
> 
> I can test on an SM8450 HDK, so please flatten for all the boards and CC me
> 

Thanks for the support Neil. Will flatten all platforms and CC you as 
well in v3.

Regards,
Krishna,

> Neil
> 
>>
>> [1]: 
>> https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
>>
>> Krishna Kurapati (2):
>>    arm64: dts: qcom: sm8450-qrd: add pmic glink node
>>    arm64: dts: qcom: sm8450-qrd: Flatten usb controller node
>>
>>   arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 110 +++++++++++++++++++++++-
>>   1 file changed, 108 insertions(+), 2 deletions(-)
>>
> 
