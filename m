Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82E628FFCD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315541; cv=none; b=Xd66WLAedBbqdYJ2BZn8O1o1mfdSJ5/sLpVp0lcf83lVYlFpGqv70lViUKxLgkv1HzrDb1hjOUR6aZomywl3tb/8LtSqD7xMDZT62TgiPIvwiMoW0ZbBeTyga9ehVQVDx1zxXqOxFOxfof/9NN2gxcLfuMI9CuUokotPcuyIETU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315541; c=relaxed/simple;
	bh=kE0juyTpiJRFvY3bhCkubK6oqwgvbhtJEpj29J8UYsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBdF/jA7n3va9f4Vy2TsRUIPHbu/Gn/BVEWHyC/gw1y55Gz0UjhuB4jRPuaaC7b8WWtenJZGW53jmHy/sWh+tkEwJR42zlv9WeurHLiXNGNFHKq+qoyTTpMv583ApEDa7fhORiekUS4mvONLrjfFSEwSdhTrE415lAvcjD2Wh8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAvcKzSW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAvcKzSW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGWxj3014128
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TXfF9vM+BoIBd/qesq5gNZSO
	9HgKKIqscZ8pGO8kuqM=; b=IAvcKzSWfZBOeARWfvOqiUotdPXWOaEavfq48bcu
	swGb2WHJy0XVTswakGO7TB8Y5YurgV5MqfYNZWaKeO2bHSXB61bGxbZAWFJwKSni
	12xSCl9zI8WAs6X3dfXoB2LTJyRQAECKchgOtghHzMu6a3sd2pfbIh4jkoRrwaRO
	mI2yFmw1TUikbGaNo+8SDHD1CisIXAy3RA5hs3rXL0XFHrV/kTDcwOZ2V0PglAFh
	nM1MH3X8TChqnMWmCne+6B/JUYWeGqiiIyhIiYMaYnQ//9Mzlkt9tOcwBJWoCbq9
	dHCgm8fGQxgZev94yn45I0mTzHSCKmMftZyp2fhKY+3dTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbeg8q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:05:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c760637fe5so250092285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315531; x=1744920331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXfF9vM+BoIBd/qesq5gNZSO9HgKKIqscZ8pGO8kuqM=;
        b=GU4mfJW1ZWQIa7FocASRcMZYVIZNYXmqj9bEKJQAStvnmh8glW3uUDWsbR4jShCgLE
         AOiCilQvtQLYq+3xkVnFospSSWizCzkzn7/q1tT4WnfvsZbfVka9TSIWykcKdjoaA1Oe
         V0VD4xRNLlga3xQnUS6HZDsY+h4f8p2PgWpsMdZoWuViAac+5AOHYZkKo94Pzu+qmHql
         AWwnGjjhtUk/xaAUR5LGjhZlDZcgjUEx6SptdbfA+MXDN0sSJKFgdheNqhuH33uaLyud
         9kfF1bGZNvIg5sytR9ic/vrPTY58XQ4BWgHajSnFar7+KUZf+nt7ipcyqM93gIxQoW47
         kRdw==
X-Forwarded-Encrypted: i=1; AJvYcCV7+9b/hDU6EQminFOS0ssuw5me+txKsmiuLJUxy6p74gRh3yhPP2cBqP9fxfHrfhkLva2IVURFHwAsQzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcgXXtj1s/guVK072rxKXR76fa2EwPSvsX6q7cQuJmRjNS8kip
	vxtGMI9wEi0ysv0/mSor0NRryeNw+eufHblCnhDWzMm4zrRj2rShUbYMb7nlkxMLBhM0HOfnuf3
	4O5pOw6f63D7UwrKYvh/s0+0Ipjc/GhVGinaaGKae0f6FQwGSayiIjjYMurrx934=
X-Gm-Gg: ASbGncsK+TLPHoBhEu2EfXsEZChvzDgasM7RB1KATbMH00XC813GXso44CGsaXm74+1
	kkZy77Ij2/DsZe92azOooMhEjr+0a+vFf6NRIh8ZuSaCY3Z9WIeqpLB8MOTm7f1QBi65pKGdWuD
	SfcwQPcxIMqnREd5Wg5VynnO1pa62LcjvTH6OT9ktdhELgbSe3wKrdMRZ8XMm6l8q79UoOtGnru
	H/aoX/5Y4zrVkhXSR6y245NTzkZq+mQaN4ED05oMsCMzQxFnOQybW7rt8SGGbXUU285BzYCmiTd
	KIiMaZL8nPhClLFRA3T/Jh0wX0I74eiyVi+lG3NJvSTtKWbfAd3+C2o6vF1fTnccXdYVW1zSJOs
	=
X-Received: by 2002:a05:620a:19a9:b0:7c5:53ab:a74f with SMTP id af79cd13be357-7c7af1f32famr39462485a.39.1744315531620;
        Thu, 10 Apr 2025 13:05:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNwwRD5+XOsvvXwA7FK0l1NN+2EkzlXU5C/nqu3FRHnxldNXsWpsj4tAqkeWZh4iuNHA2zcg==
X-Received: by 2002:a05:620a:19a9:b0:7c5:53ab:a74f with SMTP id af79cd13be357-7c7af1f32famr39457385a.39.1744315531220;
        Thu, 10 Apr 2025 13:05:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d52084fsm232846e87.255.2025.04.10.13.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:05:30 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:05:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V3 2/9] phy: qcom-qmp-ufs: Rename qmp_ufs_enable and
 qmp_ufs_power_on
Message-ID: <2hysso6n4f5tnyknmgne2r4wpy72j2taqwuncqdcwqqztr4g7y@a3scnple4tew>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-3-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090102.20781-3-quic_nitirawa@quicinc.com>
X-Proofpoint-GUID: jQV-l8TXIN9aBJ2fZO0Zrderl_V5grxV
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f82492 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=hpSo_X1Mu2B5NIsQaEEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jQV-l8TXIN9aBJ2fZO0Zrderl_V5grxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=738 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100146

On Thu, Apr 10, 2025 at 02:30:55PM +0530, Nitin Rawat wrote:
> Rename qmp_ufs_enable to qmp_ufs_power_on and qmp_ufs_power_on to
> qmp_ufs_phy_calibrate to better reflect their functionality. Also
> update function calls and structure assignments accordingly.
> 
> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
