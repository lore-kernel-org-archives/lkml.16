Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D11D1E9B22
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744255380; cv=none; b=f7Djhvnp3jBXk99s+0RQf0F+YxSYmk5NNOUJ7XHFy5zgKj8VY09TfyaAYpHXIluEjaqTeO+xU5pci4gi7ab1AWm4opMjxhxMKXaMPPj/6XdvqiBjf3oULMLkoNQ1UV4SZvdjOZylmUp7ZISHKcddM2r2Ms7AhqfW2b6DpGC612s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744255380; c=relaxed/simple;
	bh=qPeh0Ja4yEU1rTr9eUKX8gtlUq67HRNq5YbB4fNpeqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pny9wVVfWCK0lk1nZClGit8lRT9QD3o81hch0bpDlo7UBTbReeBrBhjG0lmXgIoU4Fzy9T2UpugS+yKjoW6uI96ZISlphpp5hLH9/+GmBfpUR2reH76SOu6iT6yKuJfSFjSfSNTQG3xM7mt8A/tjCrSDDq41mgiFUlMig0j0fKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I5p11Y35; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I5p11Y35"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HFxeW014999
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pfANK38r2/Y0veNUeTUAv/nE
	G8v1dA3z5o6Mox8qnqo=; b=I5p11Y35E3uk4R+AslEb/sZe87E9qPzIOb9grMUy
	Q9vDG4rbEC6+ZZGjaVVMvUg5QdTvkpP4qsX9g9GMymYOJ5AO45WLI50Sgqj+it0G
	kr/imzKJHfVmBDD/9qSyTjASDo4UyanuKPW9QhmzKO6XZLvhUuWjm6lOiwD+Ecid
	YwdWQYEK6deJBbafAp2j1gotiX+NUdNYbS68TyLByWCLS6bE/vtACHIRPuNaJqCX
	ikEC9NU9/N2+i3kfMxvZqD8MW3nMeFwNrGCRhWUVUKwmoPVe/EklmrToEI695tvJ
	OMXLjeYxeZuVyPGXRqggt0aWzyT0wpJC69b7+5Jaj2RIPw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbunfyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:22:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0a3ff7e81so76698685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 20:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744255377; x=1744860177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfANK38r2/Y0veNUeTUAv/nEG8v1dA3z5o6Mox8qnqo=;
        b=NbST92nEzGM51IY7sgBWgUieIOP+vIQmd7BOYNcsMAnIepkHRsCzA+TSLP9uT3qk7Y
         kuxEiNf0IQ08KRjKgqT7l9f3pRSYAIkP8SSXEO/FOUGMB75OAdB8MOgC58TUqMsxS6zm
         Zs6iCXZfB//Il6cbWXgKM+XAPtogpsmX0/wpnqL1Z2XNRsekavwlVMt4+TPHoJUgFWuw
         fYVryYIigxg/lcC9Y1g1RoHsn+EQXCm4wFjMjEp9sDfFy/4LQeA/yN20y5vejVc9Etow
         3wMYZa0msC4U0sMH0F7fPxPNOO1l3PPb4LWm/Y68Dr5oErd7M9W2StVxY/M2jXSw9gAE
         Un+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1YJBGSGf3k+kr7ifuyoekaz/HvazpSStiRwKA7Aa3MHXftuwEduE8WCRqbMhdKPqn2zhSrq3wsiytyfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4INZL03nwhgoJSZnYZwqFZKq55cYzcOx2V1LCoSBlU8Swqnae
	MjZkI+FqH0PHi1lEPcXI99u85an0lw+vtm2dCWRLpeJ3YRmkYyHOK69nh8TGeCrD2pH0X7vHwUB
	Py1f1ri++P47ugNybqGzbS+tq8ViS3suxMJSb6HlAtGHYwpbNQo1gXroh+r/ohhU=
X-Gm-Gg: ASbGncsuT3uzRf49KcBLtEFXAMX0VlId/mtpHWF1dkz+vbtsTyv2imG+D5Fo+x75GTu
	pSOQoqHTcZtzq5FoewPrxs/0XrkVw0/eSH/aNx0INIklx4420BYqIc1L2p2jS+zFpPD1THUs/Yr
	+aILg+gABz4whkrDBAPK5pFifqaRTKiiiziaaFbsdTi8JqlQbSz5C1C0Ivkmc2ye2DcD22j3k8+
	UN54QSWh25XEEn+VzGt4LvqY4NE7bBwjtnNiGSrS2tL0r9Qxi+hAVs5G1ILMKLtaZfEGt49QykU
	YPquGemAzLSwOD3DlKoc4cacIGqs7xz7pZxoiVkLT/zcKKj2lIqHZipLsMdsXr5M82fAlikjqpY
	=
X-Received: by 2002:a05:620a:4011:b0:7c5:5d4b:e621 with SMTP id af79cd13be357-7c7a81b6b63mr131507585a.37.1744255377673;
        Wed, 09 Apr 2025 20:22:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvdPKTSB3sqkRdmy4+rKmOaEHDNl9nfoJyk2DFMvWHYvIaySZUI2uhQyy+e3BTNZL0wgeEFg==
X-Received: by 2002:a05:620a:4011:b0:7c5:5d4b:e621 with SMTP id af79cd13be357-7c7a81b6b63mr131496485a.37.1744255375618;
        Wed, 09 Apr 2025 20:22:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d4ebbsm3476721fa.73.2025.04.09.20.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:22:54 -0700 (PDT)
Date: Thu, 10 Apr 2025 06:22:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <fvbfsvx4ibixnvdh7ujt3kaybjqj3fdla4k5sx6lguegepxipg@ci5nmq36irpr>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
X-Proofpoint-GUID: uZ68UGi-yRkKMxb_2AHjTcQySUtTi5ac
X-Proofpoint-ORIG-GUID: uZ68UGi-yRkKMxb_2AHjTcQySUtTi5ac
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f73992 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RKJlQbLL0f_VtHaaO3gA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=521 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100023

On Wed, Apr 09, 2025 at 10:48:17AM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> sequences to bring it out of reset and into an operational state.  This
> differs to the M31 USB driver, in that the M31 eUSB2 driver will
> require a connection to an eUSB2 repeater.  This PHY driver will handle
> the initialization of the associated eUSB2 repeater when required.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/Kconfig              |  10 +
>  drivers/phy/qualcomm/Makefile             |   1 +
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 325 ++++++++++++++++++++++++++++++
>  3 files changed, 336 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
