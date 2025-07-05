Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E48247298
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 13:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751720823; cv=none; b=CN1Li2l4TNaAAbhvrqRYTqLrIU6V9Ymz3BdY6JmZ0XNJ6TZlVxl2Ut4tvmrEUgit9Nk6cINOnNUzAu91tgEfWPFLsc9xXDRhtjzVkSop+V4Em65ed9vEVdgRsNTD3/rX8CVKKvwUYEAu3LeMfoJ8L6p0iUtU+cdxQejIouRKC5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751720823; c=relaxed/simple;
	bh=FajfBbIyFZaoqO4Emj2sRX+mRhmdhcQblGwInlSO+24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgbLPjPUx066DFKOqZqvZSB6qlbXk1FELQtNfNj3WKkirv7aucvNEcHx6eg2PLcbwVfwbJk/chbohz9fDxRYMzfcjEpJvp7UwF09wLmG2GmxkQnN5MGTUvUmOA1LID9XtCafBdblSBw1JCuAJtgijmcV/NE+8/5DMydaCOcaNc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8qMdPxd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8qMdPxd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5659JOPL032554
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 13:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IKd8N3ast/derty+5n3+jvo7
	9rRMBMcTu9wby44QbFA=; b=B8qMdPxdhn8B7S9xQezoUQ4O1W2gvM4L07ywLqiQ
	pNwj4BQCNNL7ME2GLaDgDQlbzBVdH/onfvTsk7VpnW8GmcFC9rd46mFjCUuLLrho
	DktEtCekx2HvvrPlEAA3tysKt5HMTHZOALIK9sDypkC0VPnqPpMI5Dc4iDiIJhnf
	U13c9etLgMfxGxsKoJq9Fo+QS5d2WXLDESpEXDZ0Fzdn/wJFDOgX0sCCFx0uYKSg
	doWCXGRnaE9mzye6te/QhhKAfXdImpqiNIBJaTZ66+Gy4Ujvcec7jpciexBSKywp
	SwGdiMNiWcKUN6+g7dhv6RH2slLXXxBjOH9NV5MDvfvKoQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrk155g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 13:07:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3d3f6471cso271653985a.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 06:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751720820; x=1752325620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKd8N3ast/derty+5n3+jvo79rRMBMcTu9wby44QbFA=;
        b=k+KBUWAKE9+h7c5SPX451knodVFSXZiwRHIG6VeYiL/G1qhZlQHBwIftkmzukhHR/O
         7ZxJGpKmUzGBdg2UtJGH9ruPVP0mNhUXKsjYUu0t+5T8bqa4QdxUkvI0WYND0z+z4IAr
         1l9EODFcSTQa0gLloSutHhnc1hEAPosk0O2PlIh4Zb9fkCRnFRcvR0N74oNK0KoaIVvw
         Ug5oyJ4faDq8AqnuxXGAFPWjYSttpDJ7XiOfQaSI+iaqhwGq7yDEN3eJ21Q4bY7lYZ/I
         6lrK+e49G+6+IWxlaScdcOwlgvghVAgwTHMpepDgg98muPzyiXaZOcUFaKRh9xIPVcVd
         Txfg==
X-Forwarded-Encrypted: i=1; AJvYcCX6+j/tzg7/LSjW9q22f2YVn+4ZGfqpOsCk8dK9ny9Ac+iD4/pF/BT/JPaTHRV2RBGgp+hPy88RqTPwBbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI6idcHlYyP3ezZGg12p2Wi5TdLM0DGV7kWgo8o9s06K1cRH6A
	ip8wyhAAMfeg69S+YRrWipEDmYAHHUgluSK72fvxPmTXsBQ2wnuqcrfPTBgCexnNRXeO6rHKsxO
	hqCYpJsAvbIqTgTVPQQ3ZmhqxqTZHHV8AgzwGpQjhdNw6UpIxkD4ov8llr3VrNfx/QLQ=
X-Gm-Gg: ASbGncvdH4O1MxHV548SkmkhPKU0Mcd+ySaTD6QNJOhXZOuu0V7FDYPMlo1smgCrusL
	505kJ7/r91ofNBSq0Oat5so6xqfU+6Yf28eVu8xwt2hNWMEF1xaDG6JXtopID5T/kSkh2jUd/FJ
	Rx+tu6T6erNxqM0pC1LVIxBr7d221ULGN7N7VkgiYIResUuQMURtfmJbPWm3ViqltxybiIYWxei
	VgbxH2gQAtd5ZWypkV1dAu5CzeFXcOFdXZVzXfzaPYCI2mQyK9HRX03UMNGldDP/ka+4JqUU2Iq
	gENOk8eJ01BBDSk44fn2dloH29i61w/jSBHOAEOL0kTe8mMWbKFwWjXnvWYVTENvzNNuyy6/i6C
	BxyygctxSHNbCouM34YInbBaph/I2MSSm9TM=
X-Received: by 2002:a05:620a:462c:b0:7d4:2854:7960 with SMTP id af79cd13be357-7d5dcd3380fmr989846785a.48.1751720819787;
        Sat, 05 Jul 2025 06:06:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl2P4eow0MB8ZATz7sgaNnaIhCr6NxTArKEUe0L5N4/jUT6bdGt4eYeFrdGpjGLiRly/SFRg==
X-Received: by 2002:a05:620a:462c:b0:7d4:2854:7960 with SMTP id af79cd13be357-7d5dcd3380fmr989839985a.48.1751720819187;
        Sat, 05 Jul 2025 06:06:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3f6asm4991761fa.45.2025.07.05.06.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 06:06:58 -0700 (PDT)
Date: Sat, 5 Jul 2025 16:06:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp-ufs: Fix HS-G4 PHY init table for sc7280
Message-ID: <o2chuy22dls3y3bsjke34z7pnyzap6m4m34tjxswueshulii4d@d5lbcragrbjb>
References: <20250613-sc7280-ufsphy-g4-fix-v1-1-1bf60744f5ac@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-sc7280-ufsphy-g4-fix-v1-1-1bf60744f5ac@radxa.com>
X-Proofpoint-ORIG-GUID: btSD_Zwnd9hLUfrAizH2ByI2qbtbJYn3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA4NSBTYWx0ZWRfXyEUOrTCyP/ol
 LmNOt/2ZMAOjgwpaS8EiRL2aoOR+R14qGBngNIy+jcEaWz3ahNoAU5GFXn1Vw0qaIj7XAdhhiXp
 LQMMC43656Y2pv1hdDSk+yoD2bryVeef9J47XKKhFwr3Ba/r9MdxajyvZDCIL49Iog4rLRMM4uu
 XyoKA/maQYKyYDq4xcVorQ99J0ZF05fUWd1GQ/1UpwFcaxqG2QFyQV9ZM6F8Vbrb/DgY7SkOemn
 lO6/ks5Bxf8U/Sa9GkEza/xY+Glruzi/RPs9MvR8mzQ2PcxbVbY3g2JIk2rb1gBw8rAMgLXXH3A
 6KZR9OLsT7O1zei9rmN9Dq7T4ALsVfH8xikpKX3+ZtqanZkBiD+9tDQie3LG3mKwTzTw06Nq6Il
 mw35JDt/jGxh68a00VTuOOnfadOxCv/3UWCfeUEnMO6wJgPPLAkLJ6pG356DwPTOb5rCY9Ar
X-Proofpoint-GUID: btSD_Zwnd9hLUfrAizH2ByI2qbtbJYn3
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=68692375 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=ksxQWNrZAAAA:8 a=vXUHhcYBCYzUoxaoE6oA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050085

On Fri, Jun 13, 2025 at 10:41:48PM +0800, Xilin Wu wrote:
> The PHY is limited to operating in HS-G3 mode during the initial PCS
> registers initialization. Extra PHY init sequence is required to allow
> HS-G4 mode to work when needed.

I can't find corresponding settings in either of HPGs.

> 
> Fixes: 8abe9792d1ff ("phy: qcom-qmp-ufs: Add Phy Configuration support for SC7280")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
> This might need testing on sm8150, sm8250 and sc8180x as well.
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index b33e2e2b5014d3ca8f19b623ba080887f53e616d..7797be329d75f95c80863e05351d0cf55fdf38c2 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -570,6 +570,13 @@ static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs[] = {
>  
>  static const struct qmp_phy_init_tbl sm8150_ufsphy_hs_g4_pcs[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x10),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_PLL_CNTL, 0x0b),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB, 0x2d),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB, 0xb0),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_PWM_GEAR_BAND, 0xff),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_HS_GEAR_BAND, 0x1b),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x04),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x04),
>  	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_BIST_FIXED_PAT_CTRL, 0x0a),
>  };
>  
> 
> ---
> base-commit: bc6e0ba6c9bafa6241b05524b9829808056ac4ad
> change-id: 20250613-sc7280-ufsphy-g4-fix-024542f31fac
> 
> Best regards,
> -- 
> Xilin Wu <sophon@radxa.com>
> 

-- 
With best wishes
Dmitry
