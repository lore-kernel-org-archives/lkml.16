Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9E7154425
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746374262; cv=none; b=Qus3zLWeh0B2cQ+e21iSwlx3vo+K4Y3JPDrBaAmC6BXEN/9nGEUOryXL16ZArfx6/pBp7p0ONZ23o2x4nJ4wwFwmdZBCukr7Y506mjFOj2rzSk6xZwYzwpgJnBDWlnwE/cLnZvu1Jw/uvJ3vCazd/eKahT9joD0Ak1CJX+jZoic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746374262; c=relaxed/simple;
	bh=Dgx1jva6DzN5ZiPWjqZBOROZ41hVkAHSccmbGgta4qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nt3IDPEHdyvlWLnSOXU6uPlEAMPcCsMNIzCBVp75KBCeBGOelMoHHd1Tu5URC6ZkR0LqJHuhjqrkNSgU/M1qIOsWyQAoJltbY3nLpp4Cof1FBgpx40UeL9s1SfQz7Qg0gSOwmLl3WYaHbwXqebml+u4oNshoqrQu6BtAOb6p7AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Muhs0tLx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Muhs0tLx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544FI6nR022383
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 15:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+NBQddzgvDX+iZ2tGFQkPQN/
	CB+FVzuOwSU6o3vai0k=; b=Muhs0tLxv4F0GjAsHtYTZwiV0aE1Ojbcs+DMkUy9
	aXJ4pj5l/4i+4GO4tSC02XrC5zsZeRwwSr4vthbo0cIwk5IO3dSxp4FOzJs8Prji
	3i6UxhQDSPKiOQBziC4yFtXe/NZghgLC2CJZHLEMarbctkn4NErxbhOGugXfHfAd
	GyMSa1mygawfFIs9ziSjaQ8oM9Q6HIzkTODSEM28B2uH3+lUxmA3MZBIcwc6BMbL
	TbTmS/lbB29to/muzTgyjjPEN081PnKqQRawsfQL4EHSnuHfTuIvyEAHHJzuS5rD
	gGPddG8+z7dq8tW4mg3C4LQrtzQMbmBUdNw1mCwy2l/8Fg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9a24h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 15:57:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47ae87b5182so77140711cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 08:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746374256; x=1746979056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NBQddzgvDX+iZ2tGFQkPQN/CB+FVzuOwSU6o3vai0k=;
        b=alwx+YOIL8SkbhDeATcSvzs017R4MCkjjTwvbx3VEEzPCGvFAwEJjOnQhZp1l98f4b
         ExApYpSzz6Q/su1CT4aEsIQlPV3QTyS7qF8iCjqb1UJYKJwBGRH9o7AfsgBr/R7XSLAg
         HETZY88PPOaqhN57koDuyQ9WNfxAWe36utMbhHZl6jR3xWFSHQb4oKnOWfYGjxCq4kDX
         QcmuEBKh1dX/4y6ePJWIkpsf2iXMg1T/xqtCfvvPpytkKpR1R5rRC4rpNfBJnqisSvku
         xSuRnNUZ8abZQOQl/7Q35uV2Qce1pr1xZabzZRDKu+nG91EU6nJlu+Ksg53jS+fRbmyW
         ZiGw==
X-Forwarded-Encrypted: i=1; AJvYcCX/Ygr+XQbWEbJutFGtB3CUfsOeJegb7zsRTwZNu+ZKODtwMqN9C9BnHBbLclFbZKDvsjDn5dUFxWHfLyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFnjdJ86sTZbqxdO4eWCAVIsGCBMcpT3Z9KdfzEQhYmhZcIyXL
	cdpVI8xXhVPN12BLcJ7ug4G3I4E3Ie4SZevx/Jwbcebo2ubXpd0dpG59CYPchR0tk0wEnJxRCAp
	C05sleuaznUtLCZhLtyqGx882ULo52hxhvkaiYRqYJXVPSR2wJ8kW5wMQlAKprg0=
X-Gm-Gg: ASbGncvQwMb7gz+ffyJAnbX+n1zZxJ3drSrdQgVB2598jFGbJYpvrz/rPi0Aoc00W/U
	kuZaPrI9Us3n7uXqCaMCrrtBfneGTeKUzWDOhZRyewO8T9bEkp/bKXKl59Y4Bvvnox4fno7uuPN
	UtBZ2/ntYkcv7T2rForPbtfp2VWz2DRPsbHnROk45uvIANCWET8n7DJbBjNcmf4Gx5QuLPr1Dcb
	nOrc/COZfMxIHY23GYU6yVJ44eGmK3wkoA0FVFI8ztAhSz4OJNDPRRdGhVFNxcKWHxcO8CRcTg6
	Lv9StM1SLYRSnmbB/kE0v+/KX2ddyjaBTLDS7Xs7fGPEv6IWvvNrUMpE5+XCZztNQLBY91Vu27Y
	=
X-Received: by 2002:a05:622a:348:b0:477:1ee2:1260 with SMTP id d75a77b69052e-48dff3e17ebmr59557801cf.1.1746374256688;
        Sun, 04 May 2025 08:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4apz9O7p8cmIJktiBqV/ploX2tWp4mathpyShsF97cdRuhrFPCVNENtImRJjdMdTGiCcezw==
X-Received: by 2002:a05:622a:348:b0:477:1ee2:1260 with SMTP id d75a77b69052e-48dff3e17ebmr59557571cf.1.1746374256352;
        Sun, 04 May 2025 08:57:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202ad908aesm12406461fa.96.2025.05.04.08.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 08:57:35 -0700 (PDT)
Date: Sun, 4 May 2025 18:57:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V4 08/11] phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
Message-ID: <vliufhbeztmvgoddhxsla5p4vmr75wmqf6iqlnqe7pnp3bobqi@thrwl33u22yi>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-9-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503162440.2954-9-quic_nitirawa@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MCBTYWx0ZWRfX7iCMHK26gOfa
 yLTNRVAVe3m1ovqTYL6Z1VHDFWztgPIBtG29OnPwewIgpC5S86hthfS9CIdEJAkG/20Ijj/3m6H
 LjbvnZiJOLdp4pgcLVNCX7GS/21UIaUi0St7nrJNhaG1VdUIHbNYf6Vh4c0hdoXlCRc3XCuityh
 9bMz1vXZZbbKP+edZSMNrfdeKeFOHpFO4FNeH+gT9fR2YA5LfmtD0ICeeF7Vlu/cg5XGCmgeI4l
 MZFUsbkOHVtluLZorwpIRvJit2vVb6EWPRz7Uw/W4ASGTC8Jagj6knPtOqX/gdB6lzcab0pthfK
 mpq6q4JRWJj5ZZMTSa3UKdtoZnVGs5NP6mhMvAi8gB9PAbulFigOZZRBvkMwMQaPB0kMOfiZXqE
 Yj6E+3Bt3xbQKdRmUVL9QmQpgBmHA5tVfRzm1oC3AB97i52gTeAzI6M5EU3LZWyqC2N8PDYR
X-Proofpoint-ORIG-GUID: IrJ5ERLzdZWPTQo-GpsvHbLJ3LCNL45L
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=68178e74 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1ySLA9CudziWiy2AdkMA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IrJ5ERLzdZWPTQo-GpsvHbLJ3LCNL45L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=675 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040150

On Sat, May 03, 2025 at 09:54:37PM +0530, Nitin Rawat wrote:
> In qmp_ufs_power_off, the PHY is already powered down by asserting
> QPHY_PCS_POWER_DOWN_CONTROL. Therefore, additional phy_reset and
> stopping SerDes are unnecessary. Also this approach does not
> align with the phy HW programming guide.
> 
> Thus, refactor qmp_ufs_power_off to remove the phy_reset and stop
> SerDes calls to simplify the code and ensure alignment with the PHY
> HW programming guide.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 7 -------
>  1 file changed, 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
