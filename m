Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E5F26A0C1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114249; cv=none; b=dw0hiSBmWNXzLDYsP6LY3kkMWq0Cutc5Pklbmb2IQggmlEu1cgLcYZbT3uRiz589nc9sgj10gCm3ybAO3k83xUCiX2khSdoEmwDzubyZHSgOq/kPaHQ5wbKrqnPvBHHGXhQl33EY5o01DBh6U3UmfibcuMMZAv8CSiVXJAOEQ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114249; c=relaxed/simple;
	bh=KT9mnVU/8FOyOrot9h9qNJcJkGwt/5NV3f3SDXIePjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZCNPrH79tKHS49QfuEJL+wkEhhtcgejSls4GxZSGX+vfsXvaTwCh/bCWboR1AVp/bUueVK2sj8dnQtkjmZqeUoqEYYhICJ+1TkYNG8PNRAxD4MgAhsc+kl+bZOgLSxaLw5TBbJqRe1YKzCYySwr6rb74/yBeZK6Vp09zpm8hhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQa2Zo5L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQa2Zo5L"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538B4q7r000832
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 12:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b73v37AOsmYqy5TlU6/p8jee
	10512NLdo4MzBxNAfFM=; b=IQa2Zo5LAEndXleXQuvgtit4l6XOx15FV4JspfGP
	6vEWjM3Tq/x607ZM+gAEwEOfha6NrpTaGA2l77sWAWIVjyr5tQELn3r37uXGKNPx
	OHkT74WxOXbnx3jcfcsEF1JKmr5Y1sLH426PWmy5HZV8GlCm9920Hpnzu6fpWp3Y
	0b85g1YhdiWDgyGLRHhwBGrFoFIK8onEAUrxRoOPQ4dGuUk292gtR1qfEyNUtsw3
	GpSPx7rMOJM/skBxnpnlSFCXn34sCbeP/G7wzY1CmJdDbNPgk3CrNfYtR14Y99P5
	8MeRbMH5EHj0w5rLP7p7znEmlLs3J+a5JjamM1GHdjdl1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe7qj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:10:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c791987cf6so319986585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114246; x=1744719046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b73v37AOsmYqy5TlU6/p8jee10512NLdo4MzBxNAfFM=;
        b=oM92LeEWj/IbJyh4Ekmw1WBaEh3QT37LyPAO138pztFFhRAg2TWRVvLigLWs8LA1qT
         ntZqYryqs6Xdxia4Fe4Xd/xBKTzTljhULeKgogQ8eWztXTQe63BqeYBjX/xEABDL+YwA
         C0QbxdMsugbwxoxZf/cTrSqPNyc7W1exVPs+vvlWKg+o4AjxgdSgt4oVoOmLs/0aAeCB
         KF4XB6n52HfUluqkxloMIaapHm9OjGoZmGHXJETLpTMLiugHQ3L5qjoLbCQKjgAZ9EJ/
         N8udJd3WJgVJ8yvXJ6cdqKBBmjPe0PGTV39TTRkKhIWtBKNrW5dcNLLnmJi9cWopwNVa
         JJ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyVF7GeFOIdyyojRmY6D5HO+t8MVN1b34M2T2cAoRLwVEGYwvH8+pfxwS/XmKXg+yglVaZw4GNXTEiI+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY3hMxuqv2deKIy7INCl8PFyeH1kf/GJUZR5ViYh1D9DK1AO6z
	+KSPuErOqsJlCnjTeTD82IqzAvjoKgbnPqvwmfE/cnkKSzO4zgx+Ed17zvAMsKWl5/cwIif6l7l
	VPPFY5vki4dunVosLR+dQ1xzo2e+8so71mzzsX4VOEMI058Cjpjn/p+x6E9pv3DM=
X-Gm-Gg: ASbGncvJn2EwRb5Qm1FDK7+KajNWaLuKjMoq7TeH/u7FU2Js90Y2HL1kGudLLNYjs27
	ZwTHIE4UIugUf0jjMj6Pk5/8hoUoWQb0IVFwdppB+qnpyjdE5kxlnZyBUA4ikzdwb+dEVypLz0c
	HdAJmT5nDK/qYRE93LTxmdyBFIqjCRNPpPugZOnG2xk7+2e3RFPpWRJzsemkCQ5x4b+i24OybP5
	b6JA3xcna24n8X0beWff9yZxV/e9oBIq2LB0Px3fr5UvpmqxpFEpAc/FrilXS69N+FI96onwJm+
	Wa5Qj7OKA5poy2eRhT28l9Uctc2xRJCWnZl/s0aNymcb89kZU3a6sYTFpVa0dXfynpBUeUvxfFS
	Hlfs=
X-Received: by 2002:a05:620a:1994:b0:7c5:4caa:21b6 with SMTP id af79cd13be357-7c775b1d15emr1774329385a.57.1744114245742;
        Tue, 08 Apr 2025 05:10:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqdj19EcF+WMojYfI4PdnZxJbpcMCmvDbz0hh/gURcbOAf793yDXKOJab77a6eCKwniOuYyQ==
X-Received: by 2002:a05:620a:1994:b0:7c5:4caa:21b6 with SMTP id af79cd13be357-7c775b1d15emr1774326785a.57.1744114245474;
        Tue, 08 Apr 2025 05:10:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab9easm1511766e87.38.2025.04.08.05.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:10:44 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:10:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qusb2: Update the phy settings for IPQ5424
Message-ID: <3hw324uzu53mskoixqruygeryseqauvuotn5kgyx7jurpxmk2a@zvts7vselb4c>
References: <20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com>
X-Proofpoint-GUID: yMkke7aOkxQwECqWQjmaCylej-wXVccT
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f51247 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=mh-cVgZ5-v770TwZDRMA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: yMkke7aOkxQwECqWQjmaCylej-wXVccT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=857 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080086

On Mon, Apr 07, 2025 at 07:51:17PM +0530, Kathiravan Thirumoorthy wrote:
> Update the phy settings for IPQ5424 to meet compliance requirements.
> The current settings do not meet the requirements, and the design team
> has requested to use the settings used for IPQ6018.
> 
> Revert the commit 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for
> IPQ5424") and reuse the IPQ6018 settings.
> 
> Fixes: 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for IPQ5424")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 27 +--------------------------
>  1 file changed, 1 insertion(+), 26 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
