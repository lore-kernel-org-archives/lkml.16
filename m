Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444A31DF756
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 07:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747554984; cv=none; b=Bp7EBkbcMQ/pR9yAdZo69oCB2k+M0f2ALOSyOdVCYZ+pDnOTj0WKI2dP011qGifaUrEUb9IhX5nQU3COxcYi3TY8WDFukQlSwPHcv3FJtmcve9DKt0ya/OLOzk+94z1stGR05kiSUSB4aXV/hl4MegzR96lv9h6RMYhp6vsUSuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747554984; c=relaxed/simple;
	bh=TypqOtyFA8AbcPYkm1pEiww0iQ08v7Ub4LB3ElfD4JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+po73LJtEXtwNl8YVRxAK7qLIn2NE6RPfPLXLFVjq/P+OV9j+cwip6XoAw7+C0Wq4lPakodplICCWTRYXvrnFuYJyMsLRwTDN/du03yfzrkSTJP9jzfDOcBkSc1fn1hSiFYLqh+4WLvWzH+hRXaA8jo+H1FF4xNK7hYd+8mswI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSKAIqx6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSKAIqx6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7ViRr017701
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 07:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Puhd7PmnW0WSgSmOeAsf8uMA
	ZRQ6dmvIBZQDY3wBh6g=; b=CSKAIqx61zUOYZ7ENbuO6hqwA62onT0OY1XdoEar
	5JyhphppQJzyfAVLmJEjw8FHvxViNrQKvGHgI586kYVRQprMDCrWl77rGL2nCSA8
	av2+sDPum0QrY8VxuC+Ty2T0onHQ9uS/oU07s/mZx+evrd8tgNV2oUwctxpxv0/z
	3Fuhvbd6LiG4gCFG4ETi5m40zAoxAVzBh/QhS8xjpPR4rNtmXLH29lSUOMHBD2At
	qI+UVTxhUjA1/tzLemRw4Lc2/ooFaCklh5ivblZCldUVk6eWSzBDH6wLfBf18VjS
	AYAvGJHV09YeJ8wjlf5CCUqkoDycAADCKopLriNOqCldzQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkcspxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 07:56:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8aaba2f62so60380126d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 00:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747554974; x=1748159774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Puhd7PmnW0WSgSmOeAsf8uMAZRQ6dmvIBZQDY3wBh6g=;
        b=tgAoG4RH/R+soGn8ERTJuHI0ybZbItno+dWyAhXjLCuqC4o1eAY01r8JVnkna++Tet
         aJ9ENlMl+7LPdti0uu5qhLGasQcbK37iBsa0e8r1JhCa0uD85eptDN06Hp5yBGuUdMXm
         1syO8IoKZQYoTFmAn8L74vW+/LmLs4kOpOMGeaYi0AA4pshOzmxrC9fdZZdY24Td/fST
         eUGwH2/CAVyyiiibL3vaP1BDt3sn1OK1kCtUcfF8mi0cnmkH78cOgi5RmhY7B96+am2l
         Eif6JI0T08ZEpi4OalsWdcVE3UOhCavJSIDG9AC72hAzOpfnjsmVvTMZ5EraONlIXpBC
         KnNw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ2UlXdoIciMM97bEiX6+Djgc33mZWKIHn/tRAETKhg2Z88R1vW6qR73fU+5rkuy1BtJtxvP/H7GOg1BU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg04MJWqWp/TbPJlI/1N8nZzbzG165Ec7rx5E88wzgKCPc6KOt
	6KRXf+DvxPCQd89XlOcE0h8sRs1rOHaCcGk/mxGqsegF0wFUtVvnmf+DL7rjliW14j7jssRcGaQ
	Py1P2j5I/eEDBjCMkQXuHSVeo997C/0NhNTv7+PO6YU+whC9oYxRDKoZm3KdtkVqWKTY=
X-Gm-Gg: ASbGncst//zrTB7R0jZA5OQgPIIMekGwh2wh0UyEjpQakHbr38SFPL4T6CYQPeMqr9S
	KCZ4QRBAICFnOnfNLPj2ga+UZahXto+AmGa8b1hd9LSuDzMsJ1QFSw2hoY05nToF+zHsUreZAzH
	R7Qh+IpmXxeixOlqF8LNUZ3mTsEhesSld7XONPcXYp7Xe9Ufs4yp1gCaST5zlne3jU0Uwe8CWNI
	jaKhnUDEyDvR+0RL5M0IPzKKOVo98zeXgBg+TRK8k4vaqmR2Bg2KU8Jh5z9RE6IpBBHsRaEPC5z
	hUnw9ZI2Ki2/KLHWCSDiwSbrnEuIeRS6CwiAJW8uVUmpgg4UBqKS7PCMW9r/4Fl4ufBIinrWHEg
	=
X-Received: by 2002:ad4:5748:0:b0:6f8:d14a:f793 with SMTP id 6a1803df08f44-6f8d14af9demr20836076d6.21.1747554974241;
        Sun, 18 May 2025 00:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO9KW1Szyg2ZNSjl+g7NrsOk0wUp6Z9zSHUEFCyc3cVLmsoQFZn/Qng43s08yf0QasbtkRAQ==
X-Received: by 2002:ad4:5748:0:b0:6f8:d14a:f793 with SMTP id 6a1803df08f44-6f8d14af9demr20835996d6.21.1747554973918;
        Sun, 18 May 2025 00:56:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b8823sm13563781fa.65.2025.05.18.00.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 00:56:13 -0700 (PDT)
Date: Sun, 18 May 2025 10:56:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: qcom: camss: csiphy: Add 14nm CSIPHY 2ph DPHY
 v2.0.0 init sequence
Message-ID: <kbslqkoqvzt44jnbendevub7qjxwa3sjazemomcvyafyxa5fqv@ytwnmvl4qb7g>
References: <20250518-qcs615_camss-v1-0-12723e26ea3e@quicinc.com>
 <20250518-qcs615_camss-v1-2-12723e26ea3e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518-qcs615_camss-v1-2-12723e26ea3e@quicinc.com>
X-Proofpoint-GUID: 0xIH28cWB-JAc2XHTsY8QVuVYELh7cKb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA3MyBTYWx0ZWRfXy1o98tqYkqXz
 AA3LWySIOe6K+wp9jKskq8WlMFwWY10jYy0oa0YQ/05ggzPg/RxWI4NAlZ3GEIJ1fq//j1Z9U4N
 8lo505G9IOJ34N+0eUOTpdR8vOg0vrdqh2J6EiKpWlfvZKpEdZQ7bN8dzu0li0GahsiL+MA3Jl1
 KtT2DoI7KQCawwh6mgRh0zEfXpHsYghG5xRo3hXPG6W9KZfxLTxmWocYmVRr4fAawGF3NdMA2MQ
 EQh/KOHzZ71E+IxbVdQegVkz/FsBWq4RXatJIAxJpibNiSO3VM2uck/u5sBTuAsobDiXUbvaD5k
 uIdRPlNmkNHwW+7EHyxD+sd5M4FYMYbarkzBNzqToG/BuTWMCoTAUfL/uVBlxC3txxSUBt5fmw3
 ZKpcHwcJ8WLwJZImYZfVqclkEGrt2iWLGDFP/1PMKg1zSBUkM/d5RD7l349EHwcTgJ3vbJFd
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=6829929f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=HcpNNPQB8qcH3S7Z6I0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0xIH28cWB-JAc2XHTsY8QVuVYELh7cKb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180073

On Sun, May 18, 2025 at 02:33:08PM +0800, Wenmeng Liu wrote:
> Add a PHY configuration sequence and PHY resource for the qcs615 which
> uses a Qualcomm Gen 2 version 2.0.0 CSI-2 PHY.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index f732a76de93e3e7b787d9553bf7f31e6c0596c58..3f3d875b8a74ee8f6585bebd29629bdb16eadb28 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -64,6 +64,86 @@ struct csiphy_lane_regs {
>  	u32 csiphy_param_type;
>  };
>  
> +/* GEN2 2.0 2PH DPHY mode */
> +static const struct
> +csiphy_lane_regs lane_regs_qcs615[] = {

You are adding an object without no references. Most likely it will
trigger "unused" warning. Please also reference it from csiphy_init() in
the same commit.

> +	{0x0030, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},

Lowercase hex.

> +	{0x0034, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0028, 0x04, 0x00, CSIPHY_DNP_PARAMS},

-- 
With best wishes
Dmitry
