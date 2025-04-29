Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0B926AAAA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963096; cv=none; b=sT77NvhemUcleyaroBFhFrqGwVj4QYrIog5aa3TsqLxREEN1QErYlorvnus9ogJ/cOWMwMDxRiEUBRlOLsd4K1SglW88GAwh9pvxX+z+daTFE2D+bYMHkPoQ3D6J4IkN0gDX4yHND2zw7oTmfQXORUJwtxXTeDk4pjv20uzspA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963096; c=relaxed/simple;
	bh=qkHp5l9+nz4MH1uJ3GUPU77Td56tAw1bQXg8N40pIXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMNwiU6swVgCdx5Zm9u0Uor5PI1MMFvekDV1O5uGwjVVB8A8y5VytyYEBQGpdbIjwXOCVsAnwAcb3UQjoNIIa2Wq3jxlbw3A02LwcvIMntV7khMpLWicLo1T+6UA09oVxRs/VWrTjY+job/HvRd6x2mckhQaA47k4ZcmyMAcbTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rxv5evRz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rxv5evRz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLaTCO004141
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SN6pjaM2etTBGja25JzheiP58CmaPRV1x4Pzl8D4/+o=; b=Rxv5evRzs7U0gFZa
	Y58Jvr8LRRYyRBVb0wvkgcfcrcLCQ2MO86ObiCK8lo7m41HSHK6F6b9hWrygDEGZ
	7SCYb24IWntAAT4Vowd3oOjvEghgr2VDu7H8+jMs8IFUCdmeBD/ae94PFm9B2oQL
	oki2d4F+qM7mNqng4AMekGQgJJdTQVWANIWNLmP1YdOyh6UjMVmMQiSfwPS7K6VF
	fftJyVr9KAiUH4UVl+EEXiTHHXm1+TlYdRI2OJXdSTV/BMzxuEm995RqklKCwGPI
	FELB6KZ9YyWfwV7ALLqfavax4IMvBrY1sJGhOTqNXxWJMFy2g9eGU+Cb53MneifE
	OpOD/w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u480hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:44:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c76062c513so113030285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963092; x=1746567892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SN6pjaM2etTBGja25JzheiP58CmaPRV1x4Pzl8D4/+o=;
        b=Xfyyo1cxNPyT+3/G3Mi7HLCPNfEkCSeilVmvPD3Py60WzYXWzA0/Q6sHl8sWsOUO/I
         r06krIHPq8gyKO+pyzcdIUkUA30ztWgDm4i94lRrckPAIc2otBRz4/8vTd3PoMMUccHw
         FGxgyzU5FHrKC2oyh41BZk88M7zgLoaBLIVd6ZBlpJMt2rWB4ay9xuz2mSpESaRq/uhb
         ves1ZwAS+sCMCZRZZbORD3GJbr1Qb3yFvTUA46y2IF2FsOS+22pAoL0DF+zEot8xgvvn
         EGao2rue0X+t1UEN3GHcgTte5/BxLpaRoiFEJ3EjEa5HbxwEeN5hT6AFD5k+jC7N8O4H
         UqIA==
X-Forwarded-Encrypted: i=1; AJvYcCUoAH8t0N5XfjG3wIKXpk202bdp+tQ9mJfu2xvB9bK6ma76AkWqrFq/AqTlILW/ME0r3F58KhKy5/gUwZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKj8nBZVhwr0A8tGMh+WQodi/x3VGDW3TJsKgq61VHhGRCJUh5
	cj28twFfhG8twOyADdA+ekkEoeXILYwsMmq2F97/Mgbjx+zAI4opP0+dS89nwIpV7ZTzRWXQ34W
	tth4O40WFknBt+ywxXyraUCJcKeYF1UHk9qerREmO7Rc4pTqsxn5j1cEE7Uqnc9/Mm6CrN5s=
X-Gm-Gg: ASbGnctNLSLK+gO9ngV3biJLrb2PRQRHV8Ds4r6MIEmdmnzoVy/V7AGKGUsO2AEKO8C
	Hzew1FmCt4joLaqKh8d6RJmwdYUdqZUtCITyMvcjYLcCJJm0g3mMHoxMROM+InNXZ0Oh4UQC5Y1
	dT4T7lDmwY/jNwRUdVePfoA38jlK5grZ2WFp70KaBSlI3NF9/KpLH94Dk7+uNJFxM++b007EoTU
	9eTK1KAzvGBB/6z8jHKTBz07UQXTBCuJgzhdUOjsMw2bAbaf2B1RLdoA2zhqIwI0d1ILBdWla5f
	LdRJlqRI3mwQ4Ou6PjpEhrdnLSwzrrzGk2+dx9UNbtM5AoCuH8fBqrFuxg+PnkhVig==
X-Received: by 2002:a05:620a:17a8:b0:7c7:aee7:b959 with SMTP id af79cd13be357-7cac884649dmr7297485a.15.1745963092334;
        Tue, 29 Apr 2025 14:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4U0UKZFlmd3TBQNHJ/q/KhcLsN4Pb4aGDLUgdr3LZ9oZ/GjbmxIHPsdffiOjq8p8tlXQqVg==
X-Received: by 2002:a05:620a:17a8:b0:7c7:aee7:b959 with SMTP id af79cd13be357-7cac884649dmr7295085a.15.1745963091773;
        Tue, 29 Apr 2025 14:44:51 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1d34sm828131166b.185.2025.04.29.14.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 14:44:51 -0700 (PDT)
Message-ID: <fd1d1962-82e1-4b24-abe3-2818c0965a5b@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 23:44:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: ufs-qcom: Add more rates to
 ufs_qcom_freq_to_gear_speed()
To: Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Peter Wang <peter.wang@mediatek.com>, Bean Huo <beanhuo@micron.com>,
        Can Guo <quic_cang@quicinc.com>, Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250429-topic-ufs_sdm845-v1-1-faabce28a63b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429-topic-ufs_sdm845-v1-1-faabce28a63b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 49vs54W-ayqGGAqHSVA5ZhWQEzhhL7Tw
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68114855 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=YsRWGqPVQEfpbUtioscA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDE2MSBTYWx0ZWRfXwIyjU3PI4HVW 8nEyDcDeAiT6zhc7J59ualod5CaI6iwAbnLZ0AcmRjXcYxwwyx+0ydFguAz5ouv23Lt0U2TNfp8 nBTkBbrpFQsIZZNPrkz7z6rodEVuKNe2bm+GDFHx+rhOMRz1YSrxkTTtDc1D6OzMTUp7yfTMDgP
 22GuYSsOR3YHCrl68+xyTEyOVHNZ0o6lpFFfMoxsOILhMBn+iDCsuf3WbHCy6XEX07gkzJTSzOC kAaEBd/BhgnzfWVwUpbP6AuDpq5g37UEcifHIRF1TFvuSs3lkJ11XASjSKQKVcIkQ2yUYTwMNQQ VMLwk7pHumU/vNO2ZI6Oxwv1ZNc/480nzZUedO5WOQN1401D50OLrlSaqDhWAp/7ufPDjEuwG5o
 cf1uFnvA42/RImSM1B5o2nanwxS1yzc0PqwVaPWS8Jz15ivjalpCWgUlYealq1n0B+A81GCS
X-Proofpoint-GUID: 49vs54W-ayqGGAqHSVA5ZhWQEzhhL7Tw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=996 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290161

On 4/29/25 9:46 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Booting up -next on SDM845 results in a number of warnings like:
> 
> ufshc: ufs_qcom_freq_to_gear_speed: Unsupported clock freq : 50000000
> ufshc: ufs_qcom_freq_to_gear_speed: Unsupported clock freq : 200000000
> 
> Add the rates to the switch statement to make the check happy.
> 
> Fixes: c02fe9e222d1 ("scsi: ufs: qcom: Implement the freq_to_gear_speed() vop")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

Please ignore, I was informed that the issue exists because we're checking
the frequency of the wrong clock, a fix for which will be posted by another
engineer soon

Konrad
