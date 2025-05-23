Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D94A299A80
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024755; cv=none; b=nAe8yhEHchJB/AVEbd4AiX2wE/+VooPOSdIkU9vJ9+EPZ1Hebl+y3sDMCLw5wVh0aS2UKtsg74TJZ6ibd1p1BLqqXvsMlPkV2vwzBZCaSg+UeAJZpBl4smLlCwqFjdMxaA4dYCLj0qBU81prjhASQ34vBLxo6Q3uG9T3cfygthM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024755; c=relaxed/simple;
	bh=NtQOkWCQz8U7GrzRiRmsaukr1M2Wq2lGQo0FZR6FC7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1vX7ZfqDCo0QLwdArD23f8hMtayoeryRa77gF75Yhbn71w9IEvU+nFBcPJrKv0FJ0z46v+epYT5GimYOly725A8MTK2bvFyU6S49lTup19xi3xXF1REm7N2XI/lIOCRHmZ/1u/n+MehnPLR5NPz5tPEKkXvKWN7BJSRis/GVfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfR6BXcX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfR6BXcX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NAG4Z2013413
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7jAskVrOtvAVeaEb311Ty4pkBPjetu94PQoDx54lkY=; b=HfR6BXcXPhL9z02U
	7PYNsF3D2uRj8K+AgnLAdgTlfOtOTU7JIrVaxVtVsb4fyYBC39rjqJBgMgzkha2V
	V/BW4qrAp1ucCNPQf9Paw4wBMBv2dCA5FmNtc3AUhlMiEBnAuTNhO+PJ1xP08Cod
	pfRla/oupSxgc0uE+dionxeGOEvAQYT2e5zFwIbZDW/ZgfHz3Garg+7PIofVQDYe
	0xtFPknPdg2XuffIKAXg/2WUCJOYQWpkrb5K5aPX/GhgfWxUmqSDn3UcSlKUE6mn
	VKLhIpafA2fL1XeOQA81nsI2tnVWD6mT02eNotorFnM+gl571xYwfgEh5Qt6Ycwt
	xXme4A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5k4r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:25:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d32c0b57so242196d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024752; x=1748629552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7jAskVrOtvAVeaEb311Ty4pkBPjetu94PQoDx54lkY=;
        b=qXzbyyrWQd8oTtfXDY5KS/C46wuwruD5hW5LeNKs9MlpvcUUxq+zq2bWCOk6t407BJ
         BptL4udSu4f7F/JQTNN0PIR5VpI/NkdcVtrHJenDENHFPTkepsPh59pKnshS1tt45hUA
         udEMjB2hBqNtI7S+AkMyD0G5dYr88TIcfG0jmQMTpTcWJqgSBQsiD2/iLqNeeGfxkvn+
         xi7WHzZfZMk3NK0GAvrYUHPK+tcTK3XAJvyrXn20nQTxQP1vS8i3D64uIaywvuy6rxJp
         CU5FRwThzQP8WfTqtKMPyzPsjkemxSUR2UQPCX6B2JJF4uPoLAgOaSstWuw8kX5dqNFs
         DcFw==
X-Forwarded-Encrypted: i=1; AJvYcCWrZfy2PUdjxgawLF206leOZSXweASGyXrcvbHnUCFbVusNHEj2UVRZAYFlJ4exeSF96GiBxmMWWKiyrGo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfbeizzs03B+423B14+D5h4puImcn4CPIkUSGrernGGtsuHH3q
	uiilIpZoi8uDPHVW+1Xxo5EFKaQLOTxGKP+FssXB6x2BCAh/0OC/vj9rm4+/n3Quue2B0Qwsu0N
	Ctiwj9b8XloZc9jEQoclnImgKiH1hvgT3o39bFefwdHNFjRO9UXXIK6Oab+onM7V20Go=
X-Gm-Gg: ASbGnctsjNSIC2GlkliYoHYXTamCJjSz3yFy+WzGyTHlkTVS7q27IzCFLDHDhtLbPSj
	vODfc8LqTJUfZthB+5cDVLmR9Xxu2LQLgo+twe1cshZyR6IJekExNr7rjnmYK97cOo4HTQV+t2N
	U8hgTW9xKXsaD1aMg8e3176kSHXcX6jl5xLY2DTPQS9I7SXPznPX3tGzshlvvFRyM9mBIaVQJUB
	m3U31/AAqQEBdQ2+UVjBEF0LsQVqOBdCgHH22LyOekN423rX40zYlZhOcZeB7WWB9u3cu0t0qeQ
	c0tZDWa0pO5fkIhP1zwKKHb1usiCi1vIAN1awFiQhlbWchyljbxR8cULMZ1hUfWdxg==
X-Received: by 2002:a05:6214:21c2:b0:6f2:c9dd:353d with SMTP id 6a1803df08f44-6fa9d2baa17mr3427446d6.10.1748024752345;
        Fri, 23 May 2025 11:25:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRXjYKiZh4UzYAut+MyKZE13w0f4gwaL2w4sBdwdgygXZc6Mqqi5zfAiRZTmNuRy9a3FKMAA==
X-Received: by 2002:a05:6214:21c2:b0:6f2:c9dd:353d with SMTP id 6a1803df08f44-6fa9d2baa17mr3427246d6.10.1748024751924;
        Fri, 23 May 2025 11:25:51 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04f263sm1257906766b.1.2025.05.23.11.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 11:25:51 -0700 (PDT)
Message-ID: <d0d3c2c0-d5ab-484d-835b-3a76055cad55@oss.qualcomm.com>
Date: Fri, 23 May 2025 20:25:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/3] Add level shifter support for qualcomm SOC's
To: Sarthak Garg <quic_sartgarg@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com
References: <20250523105745.6210-1-quic_sartgarg@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250523105745.6210-1-quic_sartgarg@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NyBTYWx0ZWRfX1/rvpXyNzoCi
 MT5p0obDLtZh+AS06rAfsGsLoaZtnwpP8hxlynAUK3KC12WjzLYE8gdODWqHOuQo5wjy90f7EZ0
 txI2+ZqtEyQvD8e/xUvHvirNcDT5mX4bLKxFhB77p6fRfWBqPDmq8gELQJtCQGsq1dAJUIsqcME
 PRvz/Ss1w1um58a5qNPs+iVChv1ncKEwFKwavRjR7mdIGkfii1WblZ9/XSBw/LcKiayIaKBUvRg
 Vvxq1aWL4T5Naev5AhyJA0AJed9Rl7CBJyhMwRRVc9t0sErl/G3eN7+U1GQXDdh9s0iKb4ZbBQF
 D9CgpQrbweMdtfD+KlnCzlCL53FfwIkkvQx1O7eLPyvrTG2Bdq1ms4/mLFJ/vI4Qu8exOBBszRC
 lRIiA0k1GwF/yQq2sVznzgZS7+sndUKWJ9wa5OZnGarQCjAvZx5nO4qhv2mRc+ZXsL9JHFuK
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=6830bdb1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=phjHtPm2XXW9BfwSypYA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: JSWB_wGdjp8maGDxfLxSP_BkfRtGEWAt
X-Proofpoint-ORIG-GUID: JSWB_wGdjp8maGDxfLxSP_BkfRtGEWAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230167

On 5/23/25 12:57 PM, Sarthak Garg wrote:
> Add level shifter support for qualcomm SOC's.
> 
> - Changed from v1
>     - As suggested by Krzysztof Kozlowski redesigned logic to use
>     compatible property for adding this level shifter support.
>     - Addressed Adrian Hunter comments on V1 with resepect to
>       checkpatch.
>     - Cleared the bits first and then set bits in
>       sdhci_msm_execute_tuning as suggested by Adrian Hunter.
>     - Upated the if condition logic in msm_set_clock_rate_for_bus_mode
>       as suggested by Adrian Hunter.

During internal review I suggested we could introduce a generic quirk,
perhaps called "max-hs-frequency" which would update this
currently-constant value:

---------------- drivers/mmc/core/sd.c ----------------
if (status[13] & SD_MODE_HIGH_SPEED)
	card->sw_caps.hs_max_dtr = HIGH_SPEED_MAX_DTR;
-------------------------------------------------------

(50 MHz)

which I believe is where it comes from

Konrad
