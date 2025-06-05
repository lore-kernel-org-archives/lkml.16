Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36731DE88A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 05:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749101102; cv=none; b=lBzGlFnt5BNpwTKF7/ht2JAHxwFVOjPOEYE0QNv4Ai5CvQ6V0EyMKZ8gp5bVac7tvDYABS1rpe3yj4Sl/mGEUbDMS5DUXa/4s11pxt3z75reBY51T9BKe0v1Kv8eF/s/gZSxUA2ukVHeE2GFbUtQf0lFd5Tpx8MmriuyslZShTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749101102; c=relaxed/simple;
	bh=M/t0pCLO2KZxMM+bBZlvb/oVz3LhELFVIIlfB6eoU1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlbfZfzMDD/hfSvY/m4JuKElx+1zSBCvmgnN6j5I1oHw6rrE0/U1++PcUoEl3YXX5C42KWRTVrjYtwCUJTMNUYgfNggp4OdzWNwUe6bFIqBU/l6NnHGQaBHYtNWFgUtAyBrjIatCstihXnEciecwQpgx292Tzu94layOH1E9Psw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTox0Obq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTox0Obq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554No1dl022637
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 05:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1a9JgcopP9bJ5yF1Me7vfccR
	Le+8BXkEbBw51pVceW8=; b=RTox0ObqdSLNR5F8asiRpPLHATO4WAFotd9IbWWM
	/Lcf2ZR2kFLHkaKRMdSv2q4ftBQC/CjKMEuuv0HoB4nudfoFyp1Kf+sPRaVvor4O
	2lwZer5akc+gE7QGMyK2fsmh/IySUhT8GaU9GOfyx5/bUgM189yuu+pD/IT3FXl4
	3R0/SQD1nCAptg5c2MgX+7ssKO5eZCgmASLqFVS0VyXpXiVRoHGSUlqZvB5w7Gp+
	i7alpuLT9V0xPdSY5KS8vdAFMtpSJbzfPOkStceSW2aNv/Xz2/H94/Nb2AJSmRPz
	n6Ju7powBABYrI/9whDi5XTkm9ndIeOc6lwlXR0pumhPzg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn02ep4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:24:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b1fa2cad5c9so349539a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 22:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749101092; x=1749705892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1a9JgcopP9bJ5yF1Me7vfccRLe+8BXkEbBw51pVceW8=;
        b=EXkbuQFNUfeFmEPLXi8Tx2v9lzWBBAZmLC7lYoNV62ZhPk0nHgo4VPIk4WjBsacV5C
         pZVCmdGROYDznKWeX4RPPVn5qw/8YHeh9wKBwO95v0fBkB9N/s7F4uN0ca7xBmRDN1Dq
         fDT1ZwzOZHxPBlAPIb/0DKmf/ojkTMxi+fO4Ddg2gcxoeyAJehWqdfAtlZKbBq145pYx
         FxAaA6I50txj33dDOKXTbQwuQsXiMWJfiQ16FMQc1xU87xemAM8YYm/sA9M6U9ODjLod
         GNcWvDXbMcg5saExTZbN96MGXe8MzZEnStHiGg9QBmetvAbI54H9bLCekYFRFi+rsgx9
         YXvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdeM5lAGkM0dNb7Wolor7cGFT/nZTD+XbkSEhy6vX8iAR4NgOs8GwTnmNlQUT4kgJwdOPShQeiXrPXIfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdGxmZNsOkspVkK+UhjOxrVLLHQm1TZ7FOyhPJCodknpHdAFW2
	+gDSQm3N5WEkF4ccTqsCC/KN5lHKT1zDBUjtRY6TZAvVbcBKYInRfVK43AfW2nkg2FTIrd0GAK7
	8XvCyoi6uson5imke2Z4uZaK8WSNCOpy2zwKcrPwFpbz9dLt/ZrHYKEVTf2WBzjAfFOw=
X-Gm-Gg: ASbGncsoKVNYvRWS5VhjFTDdf9Mu/3QyxadPtMSQEtE90RV+DZNlu3kMLbZqflJco3R
	ePA0jjPEhNYtGg6VNFtqC6yq7/xj/otSeYBiRDSWvNx8uO/dQrdF0Pauuc8jlUxy8JNYFfd5kRi
	pKBYd1yBRfk9nnJ8qOQzsleNaL/TfzdDiBoQw5L2PGH2E45g+WWpLKMQyLQmIzyRoRJoNuetYV+
	GUG22V1BkeH7aPWzIZ7sTzX5j5KdN/tuwEXSCQY+fD3MCaJY1PeGKBvuqhn/kancSJpVixjVFtZ
	rnLocHeP9CyU4BF/biiYgzX9sNXn3fFazNx3vvfuvm16Qx1tLcNDR1I5x1g=
X-Received: by 2002:a05:6a21:3287:b0:1f5:9098:e42e with SMTP id adf61e73a8af0-21d22a6cab8mr8581870637.7.1749101092392;
        Wed, 04 Jun 2025 22:24:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELuWY/1bcdQXTlNAC0FeBkJQ7D653GZ5CNEp7sdXfBrnquNDS8cgkO69w0uf0qsyvNLiEZIg==
X-Received: by 2002:a05:6a21:3287:b0:1f5:9098:e42e with SMTP id adf61e73a8af0-21d22a6cab8mr8581844637.7.1749101091990;
        Wed, 04 Jun 2025 22:24:51 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe96781sm12040801b3a.29.2025.06.04.22.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:24:51 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:24:49 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_cang@quicinc.com
Subject: Re: [PATCH v4 1/5] arm64: Kconfig: enable PCI Power Control Slot
 driver for QCOM
Message-ID: <aEEqIWSU5P9Xp9J/@hu-qianyu-lv.qualcomm.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-2-quic_wenbyao@quicinc.com>
 <46r6cdcugwvyuvkjqbi3tq4f7ddkrgy4jut5fwqjsfwbsfoke4@upmtzhcmc7ni>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46r6cdcugwvyuvkjqbi3tq4f7ddkrgy4jut5fwqjsfwbsfoke4@upmtzhcmc7ni>
X-Proofpoint-ORIG-GUID: WO_eDMh3QWm_AmqFlYwi4JICQeiOAN8x
X-Proofpoint-GUID: WO_eDMh3QWm_AmqFlYwi4JICQeiOAN8x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA0NSBTYWx0ZWRfX7K7xBq7/Dmgx
 O4LoGnTiBxZrMbVNpT4CfyTwW3EmtWvbvo2/y39I61ZQlrSybO+SQsZZooKv9mQFyTZ2cJ9rbtv
 1ePutFzX5tnqar64X7Zx6eqekuQsLfRdPNUzh4ZHEe5L9CmrIHw5JQbOj9lJ+rJ7D/lzfw4StKL
 ms1F96Nk4XkbseDztG7Z5isMCCxNPbSYaz+qMwIj0ktCaqvgW8REx48HavKFZSjhubBdk5Qs82t
 xrP81p/jo9lxLKKO1XIwGQGndaFcnj0GlguW5Yp6NEmMYpKzEUObfpY4bMk9CA/F2SX4otbGZfZ
 DCC1C1gyFLVqTUn2LPglcVxLDf/vMHbw7rlOKcDVqcwg3LOGRI5I0j8elOluzORVJUlQrZ4khsD
 gqFnpNhTbVOsrASp+7t9lIfTYNv1+668selzsuOgCiOeSEYG0DKQ5oM47F02BNGaSlE/MXSb
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=68412a25 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=yafonziSkLk5LdqN7hYA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050045

On Wed, Jun 04, 2025 at 03:30:22PM -0500, Bjorn Andersson wrote:
> On Wed, Jun 04, 2025 at 04:02:33PM +0800, Wenbin Yao wrote:
> > From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> > Enable the pwrctrl driver, which is utilized to manage the power supplies
> > of the devices connected to the PCI slots. This ensures that the voltage
> > rails of the standard PCI slots on some platforms eg. X1E80100-QCP can be
> > correctly turned on/off if they are described under PCIe port device tree
> > node.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> > ---
> >  arch/arm64/Kconfig.platforms | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> > index a541bb029..0ffd65e36 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -270,6 +270,7 @@ config ARCH_QCOM
> >  	select GPIOLIB
> >  	select PINCTRL
> >  	select HAVE_PWRCTRL if PCI
> > +	select PCI_PWRCTRL_SLOT if PCI
> 
> PWRCTL isn't a fundamental feature of ARCH_QCOM, so why do we select it
> here?
> 
We were asked to select it in the same way as PCI_PWRCTL_PWRSEQ, following
an approach like:

select PCI_PWRCTL_SLOT if ARCH_QCOM in Kconfig and nothing in defconfig.

But to be honest, we didn't figure out a more appropriate way. Unlike
PCI_PWRCTL_PWRSEQ, which is selected by ath11k/ath12k, PCI_PWRCTL_SLOT
doesn't have a specific endpoint device driver to select it. Would it be
appropriate to add "select PCI_PWRCTL_SLOT if HAVE_PWRCTL" in the Kconfig
for portdrv? Do you have any recommendations?

> Regards,
> Bjorn
> 
> >  	help
> >  	  This enables support for the ARMv8 based Qualcomm chipsets.
> >  
> > -- 
> > 2.34.1
> > 
