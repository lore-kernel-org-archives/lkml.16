Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C563A254B09
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687117; cv=none; b=e3behTzRr+RA4CVfJDBKZgxcfm677RD013lSNIoTRhW8VBdbRx0hGcNz5n8SPeYakkbZ4OMzaBVUFcmwembAI1UGUBoaYV8d3V0fnOh7FsPVeiKaKY2XWSE/EgGl2kBC1m6kbVgnv8NxLdXEeE01Cz/K0qJZSWm0qnWiscORgD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687117; c=relaxed/simple;
	bh=z7xRW/zHgqmPhcHqJRBygp5qO68gNdSDYBspX0f2XUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jzx5q0BglED9Ym88QuFMtBRzvG3mIxG3g4fLD5D+ka5QCRONeIWAne4/eAtToANj7pfo4REjxW7fltlMl1xLNbAaw3nqM3NsGnMoBt5A+aqawnM0oRMzAqX9+m7Y4NksxlfzztOaB/fmx9gWRA8iFTlppPy6nrhmTbYXu4XaRu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DK7GbNpc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DK7GbNpc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9kXmt014510
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gVPZjTtp1XI2FupP4oz954O3iw9aZ3hAniyWNapzx64=; b=DK7GbNpcZaFHiJ63
	1jj2VqudphMJnRJdIYUaxmX7dxhdHWTIY0OS2nDiN4a61RVr8cu89xcRyGdgmRTa
	GhLwq++sMu7DgR70uzwptTFprZjMz/Ah5WaMes+sDFnu9AYuO3BOB8lbeI5dP24I
	RX8mK20MwZDrbp6KsLUZXEiHnJE0PIWQWunUWX0z7klfvXVz7Llg8dnov2KLu//P
	AQA3TRgjUd7dn/XdqX+VurjV5xErBCBM0sCuSEgHXpYH9YVSqtqjcXSwVSgFf6FP
	PHUzxQ2ntcw78aS+p7BIhuDo91BrTmR/Y+yL0JOHZ8tNKYxDh+y8tIlTYIn7ILCu
	Aa6I/w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5hyfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:58:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b321087b1cdso1762285a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687114; x=1751291914;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVPZjTtp1XI2FupP4oz954O3iw9aZ3hAniyWNapzx64=;
        b=F/ujVwh+V85tcUDL4jl5KhhJpcH8ApQNCCzwzIDPHQrbW7RWBli2RWSbD/MCiP8jd+
         8X3/BGxzVAGmZF6/uYJmUKzUQVKT/kSq5zZJt5Bc0fbQ2gCs5SspSZLCwyMe9psElyK9
         bA8PxwTVjeHIGOregYWARltFtEVAjs4IfBLw1NwqfCAHzgXMhzxiidCN4LuY3DbIIUz7
         4gHTp9NAsy+h0l5QnubnCumA1Ll1EA8y3sMQLYrK6UCrpcjOzwzo52eut8pRp33TZk0W
         uzZhyV2Do/Z4p/Bf0GW/3/a/aHiKnq0EnqmifztWvdDhf3iCxFk1e7nfLakL5rbwolYq
         o1NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCT9PzxEYMngl9k5Brm7TSuLo7C+EzgFA8nOtChf3p4Ckx+jG6aQ19YsbMscewNoxbRvACFtwrxKl/qMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd1g9EX/Y+u3BxW8mHrgKve6QQe0AZwT/S/Zh2tWIOspXShvYO
	31u4DwpZycCtJISHLKWJvhuh56/adqpBXx+Bv3nvQXE6IUZoKI2hBxCunOZHP8rnZo68qVxnRAh
	BYzHD6W0CNAqUuxQIJQg3XtNvcOy7eVmV0utOZ/4UZ3JUIrsL4eajpt5smcBWMWAYJ5I=
X-Gm-Gg: ASbGncuu+281buYLkgtP9E8q5oF7+5gPDMlS+hqANTUqUoh9QBEOTtbukP4+uG4e+At
	GgWvsFKjTojtNwk7hcza5VmUIl25lhx6D36joVJX01lUYHS60IQQLSukTLufhlNLJmRVfX+VZwW
	6+7T+eN4dbnlhWONeE1KbNPgSfrP96MrkUN70iFyigkPECSFx7HgHs5P7bBYmYyf6gwA80JFvr7
	Jfbgyj5t0tktTHvGzsxLtFS9meJ6NsrFO8ydjgFj5A70qGlCXbX8ygRri1qoYIIzc487JTCfu5j
	cDc1mWZjfux6npCoK+oCPZSe79nG3U8agkKYsa9iiQ==
X-Received: by 2002:a05:6a20:258a:b0:220:19b7:9d6b with SMTP id adf61e73a8af0-22026e3fc69mr18664035637.9.1750687113749;
        Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVl1R1DUJMadEXAlc5CPHNyyosQFNPkLwlX/IE9EL9s6zL6fnh2dV9q0vTc02V0SmdWqoDwg==
X-Received: by 2002:a05:6a20:258a:b0:220:19b7:9d6b with SMTP id adf61e73a8af0-22026e3fc69mr18664002637.9.1750687113387;
        Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
Received: from [10.204.101.81] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a66622asm8539213b3a.137.2025.06.23.06.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
Message-ID: <e8653c35-d6bf-4992-9edc-414309768bfe@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:28:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: defconfig: Enable X1P42100 GPUCC driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
 <20250620-x1p-adreno-v3-2-56398c078c15@oss.qualcomm.com>
 <66094c33-07bd-4621-b49c-b29a0270e002@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <66094c33-07bd-4621-b49c-b29a0270e002@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lsKREUVsfuxK3u3mdkLgTENgnjxSOskF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MyBTYWx0ZWRfX+wP3p8UkPjOa
 I9dCMzJxdrOiEvKiAqma9WJgurQSuwxRhoXKu2RYZ9o6Eog12AzycI5Q5WyzDsPO0OivBaDqpxc
 pn49x4xhwrCB7LiJJa3xlEEY9IFco28EpIPCP3dVHsr7zuw379ElVeN/DJ9f0asi4KdW/lZUcr2
 ZA9jjqOdxLFO3+hjVYXx8jToBBZ8cT30uJqXNSivpaPCiifCXTOvMQO4Xisj93ENKDN9uB6/AaO
 9uVo7joE7w6Ycaic2OT895V57vpBiH26ibNjOysWAUZDBwAlQ9ylP9NvI9YuXWqboSOEit82eeg
 nsMStv0IjrpGnyPUgfK1pL/65PcCb/KhKMJSNynI9MrzdRsLNyp8H0Uui4yP1Tk6+7pMQL0iPO/
 c7ZxpOrNVFTOlt7yEGt+2gvQQfASQj70sh6peeC7s2dUPfCt8bvVoWCtEgbl4Ae0sScvWC4g
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=68595d8a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=Od58GZWkWy8WqyN3Zg8A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: lsKREUVsfuxK3u3mdkLgTENgnjxSOskF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=672 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230083

On 6/20/2025 12:39 PM, Krzysztof Kozlowski wrote:
> On 20/06/2025 08:54, Akhil P Oommen wrote:
>> In order to enable GPU support in X1P42100-CRD and other similar
>> laptops with Snapdragon X1P42100 SoC, enable X1P42100 GPUCC driver
>> as a module.
>>
>> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Defconfigs cannot be tested really...
> 
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 897fc686e6a91b79770639d3eb15beb3ee48ef77..ccd03ab5de495498281175a4550bc73d3e65f3f4 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1347,6 +1347,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
>>  CONFIG_CLK_X1E80100_DISPCC=m
>>  CONFIG_CLK_X1E80100_GCC=y
>>  CONFIG_CLK_X1E80100_GPUCC=m
>> +CONFIG_CLK_X1P42100_GPUCC=m
> 
> Not placed in proper spot. Don't add things in random order, but follow
> savedefconfig.

Ack. will reorder.

Btw, can this patch go via Rob Clark's (drm/msm) tree?

-Akhil.

> 
> Best regards,
> Krzysztof

