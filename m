Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E752257449
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747082897; cv=none; b=fSVIrxaRzjSQiRGyDTtwialObpS970qkHOOpl695L8vvXE7FFd1YqCZsCAPccBCXaPcFvIGXhelhN8OREMLdamCwhLaAy0Nj7q8nbki7ZE4g2KLEwibzwWR7Zoq04D/8XV77L5YjpeudHMo5ZLcngr5vUXzwpU7cdYfhYhkOnhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747082897; c=relaxed/simple;
	bh=wetSk7KQyPe93VuWtTaariuwT9d+FE4GY1/B0UWkXGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IP7FrILPo3yqS+af5m27nlEjUoB4BRSjHeVuze7NS7EBrcqdX9dkXmGHlZIAY2sxxe1kD21IF9st6m6zrTi/9PBtVHzOZ/nMsdBSQEag/yfy8MQ4zVdCShYiM8zJpuX2MPxUouu63HwHjsPRFUNxrmgRGE6X5gpDn2eDILPrxOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmdosR2w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmdosR2w"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CI8cd3012804
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMEGDGWDes2oQel40VYHijcONjInO+gIQOaXNYTja7g=; b=NmdosR2wzeX82hjX
	R7xfQNChr9s2zZRwEvXdMAMePnYf+JdmCSvMKpmtM5pHAPB4WbzC6UqF0byemHgR
	na4kT9knRJBd7KBRH+oezlf+aLo2y57Zunnb1BalfmDQyzkc7FYiIQcxwUbep/gP
	Wk1B9DC2Lp2f2elSVqOc+XwWzF/D3Nn1U8hCQkxXEIPOHQGt3ht9PMPbdUXq3S2c
	A181Ik3scTCZwoGH8aDUvACinXDjr6UcxqJZp395tB9PG+DG5dBn9DC1LAltrbcK
	eQIaPFbJqQK4v411v6qFvUGzyg30gbwDaTMMPz0H0iLw//4NwUUV5nI1jiSfI5gt
	aKUpSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyjjng1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:48:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5466ca3e9so60937985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747082893; x=1747687693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMEGDGWDes2oQel40VYHijcONjInO+gIQOaXNYTja7g=;
        b=vhbd1qRI7xrugu8oF5JeTKWE0zxaqHqMH+3euVCjHfIZpA+GCHv/XvF79zwTyAdnsu
         A6X4qTrrnIUlVfMUHBM5fT9BTC47aY+TVWX/dHu7sYHYCyXqzZZ17vP1J3qr/xvwu20Q
         O46bHWl7SQPSwj4hVnnQqY7kUX8d4nf/oL4yyjaLmj4Zk7kwGo08f3yZDTWMxcKFqi9v
         h7oQvbDuG76iD6ZmpGDMFYT1znklZC+yhvDTW45Q+5RpqBcJy2QknYnCfIpB1qIi20rd
         yFe9xHlq6nnyDA+ZlU0FAWgbcvrfQskEBlc6djbgkdC0SLVLWnyiKmkQ3vkD5i8z2LdR
         UvPg==
X-Forwarded-Encrypted: i=1; AJvYcCXn6Kut/AUuDgVxpqFEkcjqorJlcVQiL26zYRUqHRE2p/G6deJbQfFhfmeIDmBPgmnrpxUDbNviUxMxW88=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXsT2ULh98Sr24wdyxjCIK/ZgLD4fNYhO0NI+4ReRV9il5f5O8
	+P3GZlYjV0I0yWv8N7TA7mSHi+eOOrUDpXXBYerEyzmEqACak9gVaUt6AgMoRzYCPiBqaCUnCP9
	u/Rq/CLnFYwyPavRxW5902S02CqSDYaIx2LMCQyimPXuJaM/xZdFuSXhaP9vWL7s=
X-Gm-Gg: ASbGncvenD3s4i7uJBzz9ANuoYlJB+fGIEn+ojIMGhoOYa68BnOlV6r3jMvbL0o6/ve
	fsnZVx6As18MrKYFMnfk/UrtCKyGUDGl9gxxcdddZW7peMkS5muk4ewP35QujF0l0k1S/xrpE+n
	nvZENitWtXt9bpYv6qrFzIK862g6hb5LWGj12Jh/mUiFeQFHlhK/L2OFu5KBhSpPoBLWCgVNaq4
	9llJ8fHiV+9IP0Nv/CME6fMuxdxM2zUpbLnNCFK6dvjmriLjDOqZjhQsBbT/sNi0X4hhYP1u/PE
	o8anHsXGZH3TmoWK5g27F+/UMBAn63BD/yPWtm5difamERL1UtWyVfRVBI4OeX2fa0I=
X-Received: by 2002:a05:620a:2723:b0:7ca:d38c:5d8b with SMTP id af79cd13be357-7cd01044e2amr926155385a.0.1747082892967;
        Mon, 12 May 2025 13:48:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1PFEnie7QK9hvQDnRlsXVbaR2Eq3M0V2Jui8DCrhPHVSNfmueMAmpx3G3g/iNJeK6Yme+lA==
X-Received: by 2002:a05:620a:2723:b0:7ca:d38c:5d8b with SMTP id af79cd13be357-7cd01044e2amr926151285a.0.1747082892344;
        Mon, 12 May 2025 13:48:12 -0700 (PDT)
Received: from [192.168.65.222] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23eafca8bsm428846266b.87.2025.05.12.13.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 13:48:11 -0700 (PDT)
Message-ID: <24173d3b-272d-4cfd-8519-ad5c9cf7c555@oss.qualcomm.com>
Date: Mon, 12 May 2025 22:48:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250509-a623-gpu-support-v4-0-d4da14600501@quicinc.com>
 <20250509-a623-gpu-support-v4-2-d4da14600501@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250509-a623-gpu-support-v4-2-d4da14600501@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIxNCBTYWx0ZWRfXyaM7wCs8SX84
 u1PXjJyEglBPHGPGJsyClbKDzM+oLBNUbNTDf1/RKfU4DtNX4KBUPDYoiRTh4Vf4v5dWpdzY/wl
 ia8rAVyB9RdGd4wKHkOA5tDpOVUee+ieH6UmIT1KLV0Ia/Ezzrc62oKfBArx2H8agBBMQBBVrQZ
 53aJsJuEmPGeWWKZGlbZVTsMda/px7hkg6BuO4H4SdTIdxqfsmPbeeWY5aKCn9odqZ7Q8CUtj+y
 icypwOt1Slzjr/pg+TbponkiRga9I6j9AVuklJ6QWWz31uOh/F0M8kJqJcsGzSblqg+X3cdT3pR
 06IZXVM1WfvfmtLVIB4k0suUmslihGgD6A9Xt0DydyBGG+nkjMYAaHZu9SU+grHnr4FfmqR2Z+m
 ff/0JI3utCsm/jk0WDy6mSfILxV1teMBT/Nbs/ngdZulh/anq3e4KS7VaCfzUoq74rFUl66e
X-Proofpoint-GUID: R3axOLuB0LIOvYO7OLq0aWDvXE3R46H7
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=68225e8f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=NWoSzSQ9CBVd_tIZLS8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: R3axOLuB0LIOvYO7OLq0aWDvXE3R46H7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120214

On 5/9/25 9:21 AM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs8300 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---


>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 91 +++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 40771b062e8d7010dd93d7cc7b3db73cfa16bfdb..1dbccb9a0c75366aa6986b6adb4feb6164ee8845 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -2660,6 +2660,97 @@ serdes0: phy@8909000 {
>  			status = "disabled";
>  		};
>  
> +		gpu: gpu@3d00000 {
> +			compatible = "qcom,adreno-623.0", "qcom,adreno";
> +			reg = <0x0 0x03d00000 0x0 0x40000>,

I haven't noticed it up until now.. this should be moved up in the file
to sort the nodes by unit address (the serdes node above is 0x089.., gpu
is 0x03d..)

Otherwise, please check if there are freq fuses on this platform, if not,
feel free to add:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
