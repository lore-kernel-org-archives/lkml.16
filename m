Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CB422AE68
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746790720; cv=none; b=VYoct4X0BxtsiZ1guVCinp6GR1km3EZIxy00mtgFpkqEjHfOt9nJ1OIYWT3q50xDPLDvRSp7lCk+Tuf6KzGfZoTxfAXV9Ihf+U1t3bw0qdURSJ8t4dXFOupJC1o07CcZIuxunKdKLmC65fohslYBv/0S6EKQsZHzkX4oo7UY2GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746790720; c=relaxed/simple;
	bh=na1tyqxwqq2l1aEZSwT5PbD9czWYVEmyxOMMTJ+/ats=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/XJ+/xl7FuJisRwy0PHA96cjFLAak8OuoGscq398KzEnayrPSWgIWEFTg4j9tOG/IcubF37uBhVAMmPZu/AYPBy/7QhSPnPPTjQITx9VG48fF60TnA/PdAGywlhzmMsUCt499cBYipSEhKYF4G3gaIY9/76ckZFb0NEufCwrv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWCa/3Hk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWCa/3Hk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BF7sG011591
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 11:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wzY8pBM41DENYEFwwG+7GSqI4H2wlchni1dLBitsUOs=; b=FWCa/3Hk+EvtQiK5
	HqAgKsFZg1Lw10+Dbnq3j6hMAlZCN/1WognMOM7lVXiuVPaElDB/e4nJIRB+1Sk1
	0DQComVyWkX2guws/sUNwTmyTl+iioVOKzR0GZk8bIUKtyLb9Ys4GjoZsesfV3Xb
	BVTKgH3xHd0ESXlHEQf9qGARqYf0i9ptESmzCpDbbZcVp19RkCgQVytEF1JTc0p7
	azqvW7R8ZFm1gFWdJL+9n606bl6Aa3Ex8uMkmQGmlXlQAtLVxkFnAYv/jgVBQrHO
	oOgTKwzHXrmGUTbvTSCf/HNhwoWjlXMp4UMApZ1mRmSNqXyHO/44VvTvctA73tM1
	sdfcNA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmmgs9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:38:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f541067fa4so4637606d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746790717; x=1747395517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wzY8pBM41DENYEFwwG+7GSqI4H2wlchni1dLBitsUOs=;
        b=Wfi5yM780KoMyyaCADcpYeBDw70zjrLYSD26umYRkw/ltA37j7copwJusQmfQs5j4e
         pFFEtmYrWW7whTCWimjk51jf0jN6k/VEeRQQW6+l5Pj1b+v1QlthGL8rkyt9VvM79KvR
         Jw0ffSzzbCW8+MrAONeR72pZSc2FcyNkfDPjHImpu2eIURpv6082WU2JXl3X7bLIQqVq
         L+GmgL8bNKFqsKrD4pLzVx+NzuuFvXmRx2jQYO8PiPkDrRV/PKoSg3RjBFcr7cE1L7Io
         gGbdjBCPOn45JFe590L7NIaFJlN6X3PdyAa5yE2WHbJQQPGWrV0JbYAm+FyQW8TdRoAH
         FS7A==
X-Forwarded-Encrypted: i=1; AJvYcCWcr8VeOMfjTN4d03zCcbvvdXsQHNWoSkXcssnP85g7w/p9rC8rkpBE+FrvLOfnzShY48js/r5NUNsecJo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywokgw6yK6Aggazliunz0Bha1AI4LL7NSctP4+jKVmplQeWWfCb
	2t2F1eTuCmnLKUFV8kmgdaY950pe0McklNa5x2rJxbaJs2fXmDOv0OlzSHTyngJ2Xqy2p1QPbwI
	ORd0YYiVF3ptNUlfVTHN7DofyJJehRD4G4JLbQD4DGCC/peoL3gUZMTfGlXydhL4=
X-Gm-Gg: ASbGncveY2v9D+wTEXI9lHsnWPQQNqe8CbBjxAnDySP0r1ubJzzQAqFeugRc7AtWyaU
	Pl2//1osIeAx3zCm6Kt+ikJ+jiGOlWOR/Hawp3CZXDkGG3iNSwieimEjo8lYsj/+WFVVLmeSl2Q
	tCXVEhdV92hXRcfi82FSdCbeP2SHkvkN/BjpmxJ+MFXMx1HntbDyEqy1hHDXnLoIRuK26Zf+wMg
	Twjc9Yfh0wh+lxOy2Tt0uNS8EBXXllIN0biL0CGCdVU3fG6TgvFnMga2POTRpsFmI4DyrCBWV/6
	Q158Uh7juycs7H+X7O7vQxvfF88vKxtwaf7Uo8v+iPHV15cxjL/80HqQU8UWO9qzJsI=
X-Received: by 2002:a05:620a:390d:b0:7c0:c42a:707d with SMTP id af79cd13be357-7cd0114f7afmr171896385a.15.1746790717064;
        Fri, 09 May 2025 04:38:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2mTyIvcv8MpYVvW+C/BCuqOrS5cjs+4maoMxoSUTTRMdl+MKEdX34QZo79ZW83evuQYcgnA==
X-Received: by 2002:a05:620a:390d:b0:7c0:c42a:707d with SMTP id af79cd13be357-7cd0114f7afmr171895185a.15.1746790716679;
        Fri, 09 May 2025 04:38:36 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad22ba47376sm10450066b.53.2025.05.09.04.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 04:38:36 -0700 (PDT)
Message-ID: <104e863f-a5c6-432d-8f65-0fd87602b288@oss.qualcomm.com>
Date: Fri, 9 May 2025 13:38:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 11/11] scsi: ufs: qcom: Prevent calling phy_exit before
 phy_init
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-12-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250503162440.2954-12-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681de93e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=4sLBAxgaFKQY7hVYck8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: N57NA8H3za6OIFsJVT2KcR8QE6mhVS7G
X-Proofpoint-GUID: N57NA8H3za6OIFsJVT2KcR8QE6mhVS7G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDExMyBTYWx0ZWRfX08+9u3tOwbMV
 IK0qB7Tmo5igvKimD2RS8CTZhY5cvm4lyVOTVx2IZuxmo0R5fXDlpwUna7aGNMSFMVM+aoR7mcJ
 IKRMfOtmurvxiZPAoBBI+32NXY38zIU3cuy7DYnObdDaXlYnNjgio2AgQNKFe/FYLNK0ZhbZ+m+
 zKYa2I8cZLu0XRfq5BjMKGaBv31w6jG0SCTttUd30eEI6gRb3KK+bD+7uR0LBW/FynlDlEJlBDd
 bGgumxmdab/HC4lcxUaWIPOXP8DDPOSV2ucB4dCK7ASIa/P2TzZsc6O6PguCXK8hCqaP0ef9oNB
 Bdl88+Z8i4DQ/C2UJiPdRH/1py36lsLgbK93Yenqgd3LYHg0IiqIT8LOCaQsJeZfGcar+srxgAe
 LnLelojVyClXOswF8LIhIPKT2aSUbZMELN9abtAwZqrnFlXMoz6wV0VrPLhUJr0GZAPXvLD1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090113

On 5/3/25 6:24 PM, Nitin Rawat wrote:
> Prevent calling phy_exit before phy_init to avoid abnormal power
> count and the following warning during boot up.
> 
> [5.146763] phy phy-1d80000.phy.0: phy_power_on was called before phy_init
> 
> Fixes: 7bac65687510 ("scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()")
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index a7e9e06847f8..db51e1e7d836 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -482,7 +482,6 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
> 
>  	if (phy->power_count) {
>  		ufs_qcom_phy_power_off(hba);
> -		phy_exit(phy);
>  	}

You can also remove the {} now 

since this is a fix for existing issues, which I don't think has any dependencies
on your other changes, please post it as the first patch so that the maintainer
can pick it up more easily

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
