Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A2E268FCC
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833048; cv=none; b=qjZweqG7SLKWG0dOTKbyLWwcTItjgV5pJpDQBqIW6iV5tnmDdgLZFVTxgRPRLvtkdHI+VDCo96esdFjWj8qYYCmI3ztJ0XAwINNBbLJ8rpeZZ2/7wqWSJYZN1Ym3kQ1mf+U0psnzTsnn7dh0tsCcFfD27o6Vzp11xus84py8/AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833048; c=relaxed/simple;
	bh=Pou7Zf1nWdBAa81MsiRtS+CcK5ufoZZj5UNXInbNfnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5p7TvbkgKTqpGauwXxO2P89pLAXrkexEBFr1Sb0WpBOyBCwjgv1tvC7gAe9Bgtck81Kq3C4+GD8TVEumuv1K7LBkXFhqkQGhkZfBSlVi7Q6F1NziiwAb/6EVzTrXPHAlwTlia7pnYjmqXvVSaXznDXGCd7rN5hXVVqzoV2Jz/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYAarRUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYAarRUY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XLQf000850
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Ny/4RwhOxpOmW4rwp1crSoL
	yoLz1hawgITXEILYp1I=; b=CYAarRUY8eShDDQQXm6E0pYbgAweu46zPiHfIjrr
	usOr/DM0N7EwsWUIg+Iymx3dX0gXNBrol+ymBwYrGpiLPnIVx0hA+R4Jl5iDLrp4
	Bx/c1KspxwplPilU/4XCnFD90aACtX+6zm9BJyYAy/enjoj3EYHAZZYaaiaIYrDU
	qPjrxd0/MnV+XBdeTP17ZvgNtPfIMhdCWb9d1BQ6d1RGi/XKlnxopDNUZm54ck6t
	vjlIcVswgbpWbheZGedHegPoHyVyx/JsBYWOijQMmz6uuFJEHccmvUeX/Q5IS9ce
	F/si2F38Uj9qtChmHpPlXOLWxjMk7WIVwro/6NYo4/G5kA==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6u0qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:10:45 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3dc8ab0ac67so339485ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747833044; x=1748437844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ny/4RwhOxpOmW4rwp1crSoLyoLz1hawgITXEILYp1I=;
        b=X0FUQ+SgFSZibkBd06GJruUn3dQ51m/4C8KkAFUzs2YO4xEyTCiS04CVd2ikqp6TQE
         gZEUaArzeWLQ5GzGhlLinvWbC88o7osZ79yPRmynlxha9/+yez9m6FnSBD5QDX+YyvEp
         iDYsI+C0xRIfGq7y9O6jsWBSyR/8grcXgPH3eh5qAlqeExOM45iY8F6VV0GWcuzb2/qo
         n+N4p3gA1Gg+evweiHaSFfMdvV3wAdCLoASG1p8utdPuVT5/YZxZRdXxezTuOpCWPqS4
         Q8owS2jlZqmVTGH1xPQG3ZsFsvYddWKgtCDr/U48IlLoM+NRHQM/GupwdCkH9IxVyT1b
         /GMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSa1LiyT+SFAG86uCC3AZnbs/P+vVYcSqkNY/FLvgQkG3E3zBwbPWH3fmIbLd3HXybtVTdwGHdfrdWV68=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTslV6H04v6ZItg2VSqAGvlVsOkzVIRHu0PhGZCUPHlWVn2xSm
	ywYvnGWFHJkUzAS/JCg6Xnw+OEJaJM6Rs+rqgJhCAYSbdiTSdH9YPZJFROeY9y+h/0XQ/kpQ6TA
	qj1VeZEV3tc1bcJXbC/XheElhEPV1Yyhhi6MrdJAp3fUaBTu4ELadVm5uEnTy++EZVK8=
X-Gm-Gg: ASbGncvhqvJnhiz8egiHSa3Q3S+gh3k1+Zxt42P3DMaxcuX5cLZEDIhsIATcO9Usq22
	Kf8ECqkMiNm4MOwkcsybzKif6Aml1d+kRM2xwtGCrZmWdGoNjaxWEmPJclG/35wZCLiIEVggEsC
	gpySgWCpsgda19hCm4CBc4DC/dEb/t98m5LC3HPmuL8LUxJsiPNfhnChpNUtxGWWpKIoCXn47aS
	aJRfqeEMwPvPSUgygQTxPi4XHgtsQJ+XEluik8v44WQa6mwzR8gpMknqcw3/itbCxKtLdcNQcsw
	hNk/unhkewQ0z8fyPPGscJoWkURQ33efADYrxZoPXZShliYXRUHdp9ghbV28pJQG/yjyIcJ1idE
	=
X-Received: by 2002:a05:6e02:5e07:b0:3dc:757b:3fb2 with SMTP id e9e14a558f8ab-3dc757b446fmr75183425ab.7.1747833044285;
        Wed, 21 May 2025 06:10:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKoNhtb+5owKr4FzQyiElr9BMC7t8S+TkjVWacZxR6aDGOYdAfaPB2hP5Fm4Afpv3YSeiSkw==
X-Received: by 2002:a05:6e02:5e07:b0:3dc:757b:3fb2 with SMTP id e9e14a558f8ab-3dc757b446fmr75183255ab.7.1747833043939;
        Wed, 21 May 2025 06:10:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017e79sm2826647e87.154.2025.05.21.06.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:10:43 -0700 (PDT)
Date: Wed, 21 May 2025 16:10:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, bvanassche@acm.org,
        andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 00/11] Refactor ufs phy powerup sequence
Message-ID: <ni7kedpcz7vchztb5qrs5msdt37mfdoabtt4gdqsaiwmbxlb2a@im4wurr77z43>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <yq1msb6lowo.fsf@ca-mkp.ca.oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq1msb6lowo.fsf@ca-mkp.ca.oracle.com>
X-Proofpoint-GUID: rAG2olxWqpk3yt4klPZst5auv466eau-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNyBTYWx0ZWRfX+vMJ8MWWz4+v
 76hyXNX/RzU565vfJepxLeAWKJB2kCWl1RIFLOcq9ptEQVY70uQZim1obpOjokWb7CO0afl64WB
 KjmWZ2ZOIuUqIQra0JSUSdQBxt2y4TXuUHRvNR/g+v4HfKAS1f3XGWkWN3BnH6cgTwac6Ei8ziQ
 f2nkvh78gwkNoYzYoxgPepLMiVg7SCR3MOdplNfEYpcyWKmhGK9+3Gfo3mkf+yjc/zSimQjrpl6
 3qJUfCpY83BTbYKbm5HlHJwmaWEtaup2sDsJEkCF3yZJ6Q9rI7+15nJDNhqOLwHAF7o4tmDqa6I
 jPZTWqANGBfHHo098ogNsSCZZbYKG0iHj/TarrGGVfES46toYtf4rdqJE4NjSyvfSKZPFaaIK6F
 qOri72xy6ecWSeh3lSrFUhhEmctmzfZQdyAmfgunOV7iijrYBLreJ39Rq9NQodQqTgcA3m9+
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682dd0d5 cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=66i0CxVaxzDmHRmSCfsA:9 a=CjuIK1q_8ugA:10
 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-ORIG-GUID: rAG2olxWqpk3yt4klPZst5auv466eau-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=852
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210127

On Tue, May 20, 2025 at 09:45:40PM -0400, Martin K. Petersen wrote:
> 
> Hi Nitin!
> 
> > Nitin Rawat (11):
> >   scsi: ufs: qcom: add a new phy calibrate API call
> >   phy: qcom-qmp-ufs: Rename qmp_ufs_enable and qmp_ufs_power_on
> >   phy: qcom-qmp-ufs: Refactor phy_power_on and phy_calibrate callbacks
> >   phy: qcom-qmp-ufs: Refactor UFS PHY reset
> >   phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
> >   phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
> >   phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and Inline qmp_ufs_com_exit()
> >   phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
> >   scsi: ufs: qcom : Refactor phy_power_on/off calls
> >   scsi: ufs: qcom : Introduce phy_power_on/off wrapper function
> >   scsi: ufs: qcom: Prevent calling phy_exit before phy_init
> 
> What is your intent wrt. getting this series merged? Can the phy: and
> scsi: patches be merged independently?

Unfortunately PHY patches depend on the first scsi patch.

-- 
With best wishes
Dmitry
