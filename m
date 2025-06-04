Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B451328B7ED
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028899; cv=none; b=I3JvwgCggpM1o6NWIumcZ0a4RsuNCI5v8Db81kTbPMl8hpuM2RRMzXL+7mEX+3QjuMoNNlvZzFcSyW731Z3kdNegDLnSgGedJiccPLg1qE3336VSvIUfYR1Jq6NFnpnpZAv++7ONqiPdvJ1VQNJ1Lzxy4Zt2dW0Pk6EmOIli3jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028899; c=relaxed/simple;
	bh=iMlClG97yiqR3GPY8UpwCOs8GVYHJRmskTZc6hJT0No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OD8EmM1m8+lo59n7eXE2q9uOkWCg9rIdZBm4XDhavhsfcb0g1bx/a1rPyJsYojQ99dnJzP9RbqU0/Sdn6UzWGyYn/w9p3Z0ULmlQKUJyuLSAcSSVUdNTJhB/+u95MXnaFjEjFq7JFd87qf9oHrLeliv+y4RfSWZJe7BFJlt6Tos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TS3dH206; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TS3dH206"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5540Ep31012594
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 09:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R+aLR+kiZ1KGuKrMttuGRYAV
	lykWWo5RCnMa4dfVWY0=; b=TS3dH206MqEG9+qEEwvj+nlq2yphj1svKGBNCcNU
	V5QqVwdA7Bs0eMwXb67r5swmHRRLbHFbZwdNmWxnHq7jvRLIPUv0173H4tikgNil
	cQZsq0sDS+yfCvmJU5j+B73XQiGlo7//F9VFBq3KOAxqUoUDcg2C+2wvNHgtWuC9
	/89vOfS/mJSRkzt3csbEwVussOwuUVPeIU36NL8vPs8PZWUCJOp9p697q7Ljkn8/
	jgt1GwqumbEsFJFqAMFwi0Humk9CKuifAJqHFOXcsWMUjzDLoATSTQVjmvQDWZCO
	JlHMRUjlepSX81A14oHXMAo83SyoZ/aF6eQ8SnbjIc3NoQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be818ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:21:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c95e424b62so116285285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 02:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028895; x=1749633695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+aLR+kiZ1KGuKrMttuGRYAVlykWWo5RCnMa4dfVWY0=;
        b=MQselyqPv5/IvdE64qUWJ6X47NcyAOLoVBavht/54Q6vfguPTs/MzbA/2gMIccLyND
         TfAbICXQQI2HQmfU6q30r07XD9qKDZDmKAlKSvn35F6NKrrjV1DR/Vmc3vy81XN/+sMj
         dBhMprlu68/MqgPFGIzk0ITrDhGFDd5OiwOVsjmzcCLoDDiZWk+Lr6BuQjd7Qw4IqqQX
         VmzlGBLS3roATEk4gfxhBKCPhFyzvQTxPmr0BB7T8PKfbHY9/hnm2CWqC/fQVloJPvhi
         OTVwNRs1ojRYJtkSdh2IuQfKX4r/Fv7GcaDBQI2yGOzU20qczhqYx43Y7xCSSynrbCVP
         xoRw==
X-Forwarded-Encrypted: i=1; AJvYcCVUzJ02+fKfj8L27reOY7D/yhQ7f0Mjg6g6Vof0EYTew1bVgYcsg8UCfsMDo1CaRDN8VyS1Ue5D4IP1t1k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxayr6LwvUPSP2xfG2uwy5dL7ayA8/zbDfe6JLMx2cI9rexHa5I
	k8o27H7R54WdTm1gOobDcqU/zB8KDYmWVIZwTob6XFGOiS3k4OMBn7Y+4zwMLX7GShzhRdo4ml6
	nQNsZw566my7Gs6EpX3mJmefe31wluGjyfJVcpZmXQoeTXZfIbbOgmmEB3h6Q1CgJUsA=
X-Gm-Gg: ASbGncvekwBoF5zwzNMr68IHuPMh0hfJRlytgZJOmkfPahRo/dWRbE0a62fyiCVoi3u
	MdImL0vpQr17ZVukA+Zz7cDRTNzR1e6haZ4BIM3T/Vs5ykdclCqWBKnWAnspkOYwmpDRbQ/gEjx
	nCE+ZLA8mchNuUWSnqYe7p/J1QJrF6eq/MrWen9++HAOzlmY9Wf4HzvxUesXUfhqlDuIv/uHYwd
	be9oHktitFEWa2eaO5P/5EfinZuAI9S33pEAeqjIQA4Xz7ZZ/z9vaSLY8TZOL9IRtQQTexLWsrL
	LNtGDUATUVP7cLSIpI32BEHUcGZJLt7kZlybEKqwxIjNhG1hnXQHqPK/eRf3PSMBJnfqXLttiu4
	=
X-Received: by 2002:a05:620a:4496:b0:7ce:ed0e:423c with SMTP id af79cd13be357-7d21155b3damr900235185a.9.1749028895477;
        Wed, 04 Jun 2025 02:21:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMv6RZWeZ/LQ6eNRt+X3KctomnYvePpW2ORiBuP4HN5BXynMs9rse1yUNywIc6fLSS3qR1Sg==
X-Received: by 2002:a05:620a:4496:b0:7ce:ed0e:423c with SMTP id af79cd13be357-7d21155b3damr900233085a.9.1749028895133;
        Wed, 04 Jun 2025 02:21:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b1b549sm21837981fa.10.2025.06.04.02.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:21:34 -0700 (PDT)
Date: Wed, 4 Jun 2025 12:21:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
Subject: Re: [PATCH v4 1/2] phy: qcom: qmp-pcie: Update PHY settings for
 QCS8300 & SA8775P
Message-ID: <p3qlrehr73i6aj43jwnavhlmm6brnkjkyos3h44bg7p6ozmgd3@ejqlcy2rpwcs>
References: <20250604-update_phy-v4-0-d04b12bb89f2@quicinc.com>
 <20250604-update_phy-v4-1-d04b12bb89f2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604-update_phy-v4-1-d04b12bb89f2@quicinc.com>
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=68401020 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=FU6otyn0G4FSvijP6mMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: GX9WewTQpdyuhHD9ojUMG5hC5yG9Is_S
X-Proofpoint-ORIG-GUID: GX9WewTQpdyuhHD9ojUMG5hC5yG9Is_S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2OSBTYWx0ZWRfXy9FFKgHdBeMm
 8VPyqQIsBNIdFcIFmXwKo/UDtVRAkihdmYgdqDmmt/XmuYV7d19lU7XNij8ySvrs5YzP44gU/6z
 olDi5o1l1HMP3O/gVjY5VXw0laO7geSEqoy49fpFyHyFYauF44HRvLeIEjVPvhTByrozvgiW66f
 s3XvrvvwOFlaxJQS4BsO9waWUmA8PY5oa9Yo3yEsG2ARv0crq/jiRYisNIeqsOlPaq/oAfEivWD
 dO4Aig4so2H7QZyWheTVUtskSMd/7qBHdQ8o8K+faoj6W5RuuB6iJwirP/zc/RtxI5jHVgjcd3Z
 WpnBUsb+df7jVbtdOkd0kCkg7SS9EDRIxd3bGy5u29Lq2OPBB06JEq1r56xy9+sgap6Xq0Nl3f1
 DcH7SBSSYWhqaW5ZpWX0o3cFcGWm6foHEl7WmgTfCUGNFCvLODROL5BmEaUoxtEcIiboc453
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=976 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040069

On Wed, Jun 04, 2025 at 12:05:57PM +0530, Mrinmay Sarkar wrote:
> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> 
> Make changes to update the PHY settings to align with the latest

Don't 'Make changes'. Just 'Update'.

> PCIe PHY Hardware Programming Guide for both PCIe controllers
> on the SA8775P platform.
> 
> Add the ln_shrd region for SA8775P, incorporating new register
> writes as specified in the updated Hardware Programming Guide.
> 
> Update pcs table for QCS8300, since both QCS8300 and SA8775P are
> closely related and share same pcs settings.
> 
> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89 ++++++++++++----------
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
>  5 files changed, 66 insertions(+), 41 deletions(-)
> 

The patch LGTM. With the commit message updated:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
