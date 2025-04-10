Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2EB19DF99
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315571; cv=none; b=jM1rdVm+bK8y16/dfJCWwteySVVkNXaNzK3zDR9EaMfsCHFSPw2bnAbpBcOH/F0VnAhL0tQ3fmO19ZMYOI8/N/HAWUT+zAA9abxRuLQCXWqFz9VCBUboy8zO5GjDRY/63ynzL61AErd60121PnO45HL1ADnwcuKwApZgjYx4wZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315571; c=relaxed/simple;
	bh=gJ8md7PQ2OiPGQLW9wdP+YLmyzBHezBVypNSfQMRcnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vd9gLhvFZje58eZPyHr7fEJFfCnqhdpKoa9Gq169RaJkKMoOnolPjFaQtCApfFaNqtMseghwLRqlsYHYmouR16YpG1InGhstwsmlWnDxTjBP84mHEpV82bv4dTvoJrgBEsHrrYYITy2OosaoXJtzCIcgCy14vM1TavnhgAdN3kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIoz9clY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIoz9clY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AD2lnu006966
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TZVLf8DQJOqLTTY5zbwnNMp8
	Hx3tMMxkt8z9vF08gyk=; b=UIoz9clYmvQhAvShfx9ifABIG9qcnSFNb1HUoZOr
	+XXrAaIDteF8LFXNuBT9IOS0s7Ay/lSIy1FppGlB+vAhNem2JVp3uDK+NkaOR7PD
	aQew5ygeYTaeK4Lc7yE5reIfyjuL8lcmM0/bXJXcaEaA1aYLag35VYlTn468yD/J
	hvDLIxJAFMWBnYEjngeqthoX9ZBZw8PcVx7VfEJNVhF0LqUItVALVg/j9Dlb55AC
	8UkIeLMuJ0QGizKhD2V2FrLBJidLP35sYMMeGmr9BXR18bcWyovrwD6TNx72IacC
	nDEkqadARg+d4Ob+CjWfNfrryh/RaDBtQsU5Uuwe5iURsg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3h80b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:06:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so350013485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315568; x=1744920368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZVLf8DQJOqLTTY5zbwnNMp8Hx3tMMxkt8z9vF08gyk=;
        b=mzyNIPTmVfYtrlXOs6WNaxwwV+fkF/DXL7GFrgWZKXZXplKcoeqcQ/7BFt/pOSJeOW
         DsdgzS8dh6j1sTKgCXeeePGcic9HcFazTc7LDPOVUNjn87nHfmdDPVGqQcQIV7U7GFJ1
         CHiOH8hmIikPaL47KqSEju4dcv3ETpaRt5WWDK7ttopmAwc4qUv12umy8QYqXDsTFiEu
         beKhURXmlwFOMc2FshxwOWMokGjtByDxgV3EueA7RoT8Gs9R25BEj2VWFjglkUK6Y4tw
         +oJifCPhqybeXhiEIR7D8fSxTn9wCVNwf/GRGCiE2y8GIu6Igh4r0uLUYupnOTrRAdU6
         2M3A==
X-Forwarded-Encrypted: i=1; AJvYcCXbZ7XEuZdIfVr/+V1zlecYTvL0ICQOKJHjcQzoM3S2x5RD2UVxy7vLSOmCc4YO0pUtIDA9ZvJUFF6maqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKSNXFaWrMpiVfStVMk5ANWjS/kpynTj6p69v4vNxgi2FFwrUE
	8ffJ4ReKXMEC2lD3HD1LrOk5vEPvKV9D69b74LkjsQ+OPzEFKFYp4/qV+Lde3ZkTxfROGoluL1x
	GAB+DnsNnI8jqYhQRCC4BpKc7vxJz4WLVuwgQpuUZQ712KT6V+NP49jVwUbA9v1E=
X-Gm-Gg: ASbGnct8rUDSn48jlS/rx3tHYeeZ+KkpL4jdrC5xsAL3Ql3ymyVs059w3cgZUJ+edG+
	e4PNA+bUYZB+KXl4sx7oWX2cfKOc0+DAYYydWbMCqNDcxnCpAgivB1+4S8C3OmKmOArwJimrSSQ
	eDF54x+3zWaXxLwGI0lEsDNUMF0k/MgsI4r/XxbkZ7Pn/4wombOwgDzE4Oe//qEy2Gtd9shjmEj
	/HJtoP8BhHmFuzJiXkP6I7rmfQ+m5LKSgUiITK6qXNsc6Tf86eTP6NegCxKyz9XmkN5bOIqVBtF
	5Z6C5jQ3oMV8N44PGlGY9xt1k5C9kxJkEv7UGVheXvtDMjiTdhJ1HBA13rAVtrKO6goZzBzL1ww
	=
X-Received: by 2002:a05:620a:2585:b0:7c5:53ab:a722 with SMTP id af79cd13be357-7c7af0c1080mr49123085a.5.1744315567839;
        Thu, 10 Apr 2025 13:06:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyFCAIZv2SoWtCU+S6mL10ZPcuXspL7BYeiCNpGEUGoqpR1wyjch03Yxp8FlSr3X0GqorOTQ==
X-Received: by 2002:a05:620a:2585:b0:7c5:53ab:a722 with SMTP id af79cd13be357-7c7af0c1080mr49118985a.5.1744315567533;
        Thu, 10 Apr 2025 13:06:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d2387cbsm232524e87.68.2025.04.10.13.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:06:05 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:06:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Can Guo <quic_cang@quicinc.com>
Subject: Re: [PATCH V3 3/9] phy: qcom-qmp-ufs: Refactor phy_power_on and
 phy_calibrate callbacks
Message-ID: <yswahfclsulxp6zveueauxtizcrzhgegwff4a55aztebgykawn@kwjrt3j5wswd>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-4-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090102.20781-4-quic_nitirawa@quicinc.com>
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f824b0 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=lFQMB9wLRqEjQFf09QYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WZ4FHMM94RGRZiagl6c6fi0VQO5VXURk
X-Proofpoint-ORIG-GUID: WZ4FHMM94RGRZiagl6c6fi0VQO5VXURk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100146

On Thu, Apr 10, 2025 at 02:30:56PM +0530, Nitin Rawat wrote:
> Commit 052553af6a31 ("ufs/phy: qcom: Refactor to use phy_init call")
> puts enabling regulators & clks, calibrating UFS PHY, starting serdes
> and polling PCS ready status into phy_power_on.
> 
> In Current code regulators enable, clks enable, calibrating UFS PHY,
> start_serdes and polling PCS_ready_status are part of phy_power_on.
> 
> UFS PHY registers are retained after power collapse, meaning calibrating
> UFS PHY, start_serdes and polling PCS_ready_status can be done only when
> hba is powered_on, and not needed every time when phy_power_on is called
> during resume. Hence keep the code which enables PHY's regulators & clks
> in phy_power_on and move the rest steps into phy_calibrate function.
> 
> Refactor the code to retain PHY regulators & clks in phy_power_on and
> move out rest of the code to new phy_calibrate function.
> 
> Also move reset_control_assert to qmp_ufs_phy_calibrate to align
> with Hardware programming guide.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 26 ++++++-------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
> 

With the cover letter updated to note the dependencies:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
