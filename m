Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411B2261595
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879980; cv=none; b=fDzlSePqNwUEG2yHmnYBdBibi/b67e+xVi53+ungAurz/aUkHHtZhBeL35FYh5mwxsqQU6yFkdP9l4Vhhsuqf8rwmMKbOpFluBqj8qH4N+WgTqAEjHB29hS0sueTQLWrpkcKr4VOAXFfC33cEWl7eN5d/KcW/XL3QT/ucx25mlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879980; c=relaxed/simple;
	bh=ljuEX21Jibul/BV1/uZPiIOWGalCwwuUymdQtWRaO2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GRiKmoBnT9mzKKqXWkua9jvSElbBJLrCPPiELKrSO4ACsL71h1+EC20Cv2sVQSRtlDsuNFDWs8P6MmymLM8aNf1zj6BOqhhH6DRlrYQq2HYg2IW0CrNDP+NH8y0OYAKEqNBRbzDg/f5YgR7d34CrTVNzypxbQRqLE06h2G4Zlys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rm45DgSY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rm45DgSY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566Mu8fJ032006
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 09:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VOMNRIdPe5++kYgsqfJ8vCXc2F2M2dCa0BteZPuPU8=; b=Rm45DgSYnQerxl79
	0X4MW1I5IcYlbWtSLDtYyuPlwVTtgHL5NatR8gmftZ74YKU1wrFJGB/AgbAL73fg
	LH8X8QB1r2y8CU8p2qljLvPqq4VZ8zogAmc1kAKY9I91ZACh5+fEkKJl8uRC5J26
	cRlyaH3JkD+9w9IP/vzsWUX+bUS29tmhF/MCnVzrA8UYkl/+26BQsvINbnipSTdp
	Mf9XBAkKAdRmQq4ChTSekzYsjaEjUFk/dwheyG9tQz1dliewkqm/75ARaQwjo3BK
	pR1+c4mwjwzwSGQ28sWTQKJvMKlwbDu/JU7gDr8BK69j0sLf4/NtvLgkLfY2+kDZ
	GqzQcA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvef3s8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 09:19:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a78573c357so2092981cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879977; x=1752484777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VOMNRIdPe5++kYgsqfJ8vCXc2F2M2dCa0BteZPuPU8=;
        b=QD9nxTsiaRsS0mAsUvZvJy0m8iepftV6UgB7pKGYsOTdDhV/TSMJ+TUAer/qtXIKW5
         0Qrr77Ko25+zu0HQrsUvCd8marft5ZC1F7J5fCwrawQgOOCmN0UIwoGWilHb3QWpLE+P
         vY6HjkVyWk1oPc/q+kp4/UjOHHhCQedUCB0gpQxMvVntOGnVZTat2wBYv94IJPY9lNZm
         5e20Y95Bsh8MYl+aigmDx/7Kml3VOcAseE3SkhDOQ1ob8z1KMkUsr6btm52yiSmL4fys
         z3qrH+K93ZejjyBn/XHgDVSm4I0T6EEZWUPwoNQS6481IW6aV4MBc0f1i1SmjiJxpB0G
         /vkw==
X-Forwarded-Encrypted: i=1; AJvYcCWuAi/yXoK/40oLQ1RPorqkPU6nmYFvq+fgK8j4tJnv9uuIfBH6hvSee2eP2GAdtcrUQ+NyZW3vQG1mJdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXlimBcAr+y1bwWM0+QGDKi+pySZ6P0as9xm2U28kXKWOd5uvk
	/3MGUoNsqvgiiO6OFKCCUlxjKfxSAjBE0P6QjnzjhQYZyUnktLoO1RKreHCB8H99xeYlb3zeKXk
	QnvIUcpyaaim/FgJHFxYgpcWsWZnPd21TsTrvVyQyWtCxC1zBHqK6AMS7IeNgGicKJt4=
X-Gm-Gg: ASbGnctZ4K4yZ4t8ny6Z258u3KKXIPO7zerRqgjptibyVDUjFc+hcYH3QhGhBUwW1m/
	rewX6d2shYcv1n5j9LELaAZ9j9DusH4Q5VQKZ85LnMc6x6fRY16cH8zR8OY7M9b8jrgEkTbPBty
	wTpOpbdLySijA7cVQgc9jy1zliZuUmEvSw+GTJDU5bUnwDPRKBIVcoeGiucXDgOKm7yx7Lm8arW
	JiFgPGAEH288J2F7sJJO2ueVt6Jx1IEkm0s1C259gCIrl1yV7JdL5vF1fUNyFvWtH8YWZclsvhS
	JAT4A9taXxEhSlUTugYbCZ2Uv6iIDVrlrJpnVRBKwLEuavHlPXComMuG1AMREUk1RF6A7e6e6qy
	i0eA=
X-Received: by 2002:a05:622a:a90b:b0:472:4c8:64c6 with SMTP id d75a77b69052e-4a9a01330c0mr49003791cf.9.1751879977083;
        Mon, 07 Jul 2025 02:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8zQl/VV82jUJ16IKGzuIQK2MD0Ay6nJSmgRfvnHnWiCJMb9E44wM/hVre6rQPyF4QKYG6bg==
X-Received: by 2002:a05:622a:a90b:b0:472:4c8:64c6 with SMTP id d75a77b69052e-4a9a01330c0mr49003631cf.9.1751879976627;
        Mon, 07 Jul 2025 02:19:36 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1418sm663547866b.183.2025.07.07.02.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:19:36 -0700 (PDT)
Message-ID: <30cf5c9f-6c9c-4cae-adec-81fa090a3eb5@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 11:19:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: krzk+dt@kernel.org, bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-5-jorge.ramirez@oss.qualcomm.com>
 <ded874b1-715d-a7a7-fd0d-3b98fd5fd029@quicinc.com> <aGuOzdCu5UmKDF94@trex>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aGuOzdCu5UmKDF94@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MiBTYWx0ZWRfXyH/GNHZQ0iTV
 WETOGsJmKqPQoha6ChBq7q6Ny9CEU1KHZm0jBiaXfDf3LF52vyw5kcDB2xdsngsdlFk7KM1iaPZ
 7mVn3RwdRXhKpgPHHCu8zse4/hmT3hI7qAlJ36/lt/uiXCkE9s9pAB0jwLDimfNewg5j965YKux
 01JBDbsPz3iTMnznl65NfxVSYRjIf3e9sBgyEaRJARXZcSWEpdoQKAZot0BOAVc2gSbWYoGsYPU
 cIWhSzAiDdkbC+tUMmFG+5nm7NR4C8w3BTx4oxmVk7BU55YUEDx36veTV3xgJvEhfOn1/7vryDQ
 hhxajCFSyi6SaKFnkKG4VIUntf/S8NwyqzQeOXViZCW7/JK5Gjf5TNYxyTYrBjPr9nLHBFVSrHh
 58tSmt1q/MRLtMyye39JEy7/iQ37RdpBgAoj/ij8VNra4C8imrHMhjInOalJMddp/PKreHVW
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686b9129 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=xq3W2uTSAAAA:8 a=EUspDBNiAAAA:8
 a=iOyF40SCRJJOIr8PYD4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-GUID: 83sQpEEyLV9gXx3KwXC-mpW5qqpQeEKE
X-Proofpoint-ORIG-GUID: 83sQpEEyLV9gXx3KwXC-mpW5qqpQeEKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070052

On 7/7/25 11:09 AM, Jorge Ramirez wrote:
> On 27/06/25 18:46:10, Dikshita Agarwal wrote:
>>
>>
>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
>>> Add a qcm2290 compatible binding to the venus core.
>>>
>>> Video encoding support is not exposed until the relevant hardware
>>> capabilities are enabled.
>>>
>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
>>>  1 file changed, 39 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>> index 736ef53d988d..f1f211ca1ce2 100644
>>> --- a/drivers/media/platform/qcom/venus/core.c
>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>> @@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
>>>  	.enc_nodename = "video-encoder",
>>>  };
>>>  
>>> +static const struct freq_tbl qcm2290_freq_table[] = {
>>> +	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
>>> +	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
>>> +};
>>> +
>> fix this corner.
> 
> ok, will wait for Vikash to confirm the other ones.

Actually you can get rid of it now, I think:

https://git.linuxtv.org/media.git/commit/?id=b179234b5e59013f8772da17b273f463f9720bdd

Konrad
