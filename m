Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB6026A0F3
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435884; cv=none; b=cw6vudXkeZmu3SDM1OWUgkRNO2YHS36Q64g0cBn6LkYe+Sb+Q7rcGeXNOqgG/2XvBnD4M+ZtCAIj/ASF6YOE4CFhvFT2p+k9d3kU3DD5k+yZBv4kzhgvEQdYAKiEnI5zyW9JI8mordGcyuxVnXZDo28KLnF9IOLPMBDWciwf/Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435884; c=relaxed/simple;
	bh=sqONk/oAqQaksWZ2ArNRDlag/xuhtIBC0jRT4lXblFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tmotg2HofHrHKpAbDm1Cd+3464uGeUBb8AYrlNc9rb5jLxaNLBUPjSbBjvq1SmyWWs50csyHDjYX/2e4MXCpgQHASmIZm7EfeIKdpyMHlBxlq0ybvDah1fPxUPRjthGnmssQlgMWBYzRjRGGjakowMLCXPCeANkBHLrj49GBzpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aN5i82Yz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aN5i82Yz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S7giZE002083
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LnTOhc1LJtROB/kjrDGcE/rf
	8BNOgI+khnoo3xpI+II=; b=aN5i82Yzl4Ju2K4fPRuXGArnnnjQ0DBL/U89Uyzg
	YEusB0lLkN497fDAn7DxqHzIj70kAMhEW5GON70OU06rh6P3qKlC0Np0tUkIuSJ0
	kcIje/EoAeRrNKOUOYwwZBMg7Ft/3atT3jK1RVuY5HQaYzOuUSQlKpRq3ex8bvSV
	yuB1qeoxTR3SOLJHIHktc3MH40k7HVJFHJ+Pz9+a+tWaBnfbZHhMrilhxBcj7fGL
	r4rmWyA0Yc1dIlKMGXhbe7646KGbXaG7coCM3gWhd0TqpiYcegRTOXGN8T329k0S
	rCZVS6kYetIjbeZS4gKgB6I5yNZgTCGOU5ywJGe2kr0fJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g926r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:37:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6faa33468f2so74160496d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748435879; x=1749040679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnTOhc1LJtROB/kjrDGcE/rf8BNOgI+khnoo3xpI+II=;
        b=ZfZjOz4BPCujCyUA1IM7WigUOVmHWnDGC3hhM30+J8y6w0bgYKVgtCVCQcWdbyO4xY
         EQK5cPLsMftWPxUSgsQwvCAWFywsDt8hxi8JcHws0V5OZ6gyecJ6rS9112AoO12NbP86
         dS82FaTyGJ6G9Z4Tac3Qyb0SCbNgEtjqcwV1B7U/HyKkJmVYOYoKfASr/b4SLB5Rkt4t
         1GbDNAA54iZ2/tfvChXdsYOMnb4XJEPHhDJrbZUFzzslhkEZ4hgJ7pHvwo2/GYI4RIvB
         6KHHcCvEmfnseOaMyZOp0kb22U+Jz8D/fZ/JRepUeuADxkRdKoGxfDzoHr066FjpBJo9
         2Yvg==
X-Forwarded-Encrypted: i=1; AJvYcCXic0UGfVoVROO8drSkTGXga7JyAc7RAkYRPD8qJlbO21izOw4VB0nXbmICF4DtTfJk4Mh6kBEkFxGU/E0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzptjHZBmBbhRby1T933R5IAiF1WBd7SK1NR5sLz4cGVHMSM8Ur
	2/kUARNdeq59TqFN5a4xP6VDCPIt51bMJGnZjU5iFbTQTAvtMXa+ZBVLxW+oAC6kic38PIm7GfY
	CaWo4Zj1I1TTSGIFLvNEfUUb5HB1xXLRlS98fK/V9PWeIHwpLJV/sXo2Egt+5NIExWGk=
X-Gm-Gg: ASbGncuhBAM5NRzhgNBpojEndgASqPSe+I8A/I4IQAnwptDuYobqieFdCyNU208EEGv
	h8JYs98QXIADXxtcVH1ngWeGIJncO2w7YRLmrQcN63O4v2PtHRoBiIzFXcupJogO/qemTqbrYgF
	71nWbXoLgGbw6N46AuSBo4d49Kcizk/1Q4yOwM7QxNblIbaFWIEZUQ4z03tv5Hc+Cb0XXfTZnwN
	AmKO8ERlh94oq1oyV6nnF1xtXq9TfBC5ia12CnBmJ71g88nHFuRk5rYWz7L+laaYx5lsEtPjpeR
	6HJSPyguZ7LUr9bAnjjsDKpUXaUJC5d+IKmxs9QTiFYeLEOLYoxMOS/1Rq+hIiaysYalEl0BqaQ
	=
X-Received: by 2002:a05:6214:5198:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6fa9d289038mr256233386d6.29.1748435879085;
        Wed, 28 May 2025 05:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf/wgeitoAgxxj9Q2ekKkeVrKgLV9879XWXLjEkhNeRx4XpQkYYovwYdM7CGYXKyMxm7vwPg==
X-Received: by 2002:a05:6214:5198:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6fa9d289038mr256232646d6.29.1748435878664;
        Wed, 28 May 2025 05:37:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69a4easm265991e87.154.2025.05.28.05.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:37:57 -0700 (PDT)
Date: Wed, 28 May 2025 15:37:56 +0300
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
Subject: Re: [PATCH v6 10/10] arm64: defconfig: Add M31 eUSB2 PHY config
Message-ID: <zybi7fyii72vm3dljqw2en76d4n2rmdicz7jgm5xdv6netpwrb@xwihqutyfa3w>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
 <20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=683703a7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=J22MhVpkVBW5EiQ_9csA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ijsbBd2Zwx-S05CvQLEk_e-7kiOXQGKf
X-Proofpoint-GUID: ijsbBd2Zwx-S05CvQLEk_e-7kiOXQGKf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDExMCBTYWx0ZWRfXxFKpz8PFNyKO
 z15j8jOmq7J/JYXDYD+SlKcJlvb55uW11fe/HbxK6xrAFok3U23Jbkam4Fq8Q+QlwfXWrNxUzMC
 R3GSVY56eQcddJrPdkvGtlZC0AelKnsqXbvMHQSP7e2TVrv4SCDEaYiLvEgpXov+5eFDOCi9wVv
 pfiwAEH7gopCLYcf52mzwMXEaGsG3AMc+AjyDGjxBlmXrHZUZOssz+1tyMWU81PhTvw8WzHGC3e
 oNKU3yjnnE7/UQMZZVOPEQO8iw8Qe7NloZ/rMKyq+t98Kp0rwsoHs4zsijm0SLxj2DxwynNqUS5
 BR7koYU9DgmVdvQSF6N72PIKRnq9d9NmfmjKU2ZFJbSbT6+bdrx1WhggXYl8437Sz+p0p9p7SN1
 qB5tvrNOq5bNqEwscOCemZ6j+hmB9Md+LJTqOZ5HvDLd+3vUVVgu5o3f4HmufAF01HBBR3CQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=636
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280110

On Tue, May 27, 2025 at 02:04:46PM -0700, Melody Olvera wrote:
> The Qualcomm SM8750 SoCs use an eUSB2 PHY driver different from the
> already existing M31 USB driver because it requires a connection
> to an eUSB2 repeater. Thus, for USB to probe and work properly on
> the Qualcomm SM8750 SoCs, enable the additional driver.

Nit: in defconfig messages we usually talk about particular boards, not
about the SoCs.

Nevertheless:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 897fc686e6a91b79770639d3eb15beb3ee48ef77..f4de2473b3078543b68b01387ac7e3ab6951e4a4 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1600,6 +1600,7 @@ CONFIG_PHY_QCOM_QUSB2=m
>  CONFIG_PHY_QCOM_SNPS_EUSB2=m
>  CONFIG_PHY_QCOM_EUSB2_REPEATER=m
>  CONFIG_PHY_QCOM_M31_USB=m
> +CONFIG_PHY_QCOM_M31_EUSB=m
>  CONFIG_PHY_QCOM_USB_HS=m
>  CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
>  CONFIG_PHY_QCOM_USB_HS_28NM=m
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
