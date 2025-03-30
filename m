Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F70184F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743331012; cv=none; b=czJhBx5PwlxzIZvlWXflFMH2O5lHCQMxBr0xnm1ra6Pc+ifvTmmc5E8sJWOmQoAOCnIPptPP9p0BOoVocgUWaGqJo7amE0SZuBd0PF5BKhml4gWEzOqM8tIZ+Slm8MgA16ZI7mz5h2tD0WH9DiHeyLgAbI0f5m15f0+natsdre4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743331012; c=relaxed/simple;
	bh=mlUFJe3hR1t0B6j0kchQ89qEo+mNhs51rs467Dn3d+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnpiTBlbzqnQrEKupoNkj7rtNg8un8frqxbK6t93sY9oCjr/HOZbey9ALBaESTge6SY0qz3lzmoy1sRQBPq+MZVp+03H9/MjjupslJ//eFyj8xwdq9O0WIfJTKL4omtTyqqHg3/6ZrkCynDDKdY16lSgCOBhTR5rSHLqYJ3haqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fict1UxL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fict1UxL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U7H3ng031778
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fVH5lVnR08zuySJUeq+uoGrf
	ogdD6s0iW5s7dVDfwco=; b=fict1UxLW9xXrMeULzi7aTNRGiMCuVAdVu2AI9Wn
	CUxu4l7FL4W0EFMDbbXhPn6J5urF2TJrWPg9ZXdEMOv1j4FffzrXTFn2hcrRGSRD
	nvNnqa6qPxPf8I/BDwILE1Ndg9CgfpMbLv04a6Sfb8fDUAvbMcEbEN7vL3nLhtpj
	ENCOEW2H5pvxflIvhNgZvNDJnC0hD77ObAC2z4o9y+L0SXoHcVDm4/Aa/YOQVhKz
	k/TYfFO4Mb7BGxCMgYhNAIPoAC/NWcIfqaPZ8SC/Xbacvte86MwEbUHlbILZwqUk
	H2B5pQqDd5jd19wdd9ylTxiUzNh6GdmT5YjIEJAkyF10og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8f1a3x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:36:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5750ca8b2so587944285a.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 03:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743331003; x=1743935803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVH5lVnR08zuySJUeq+uoGrfogdD6s0iW5s7dVDfwco=;
        b=R3i+e/Bpf0RpXt1poDTA3V4V6Wr06pttTjk/lW+FyusDNP7GzfzcFHV6rBL9mlqeSE
         ZOo1MlO/AfWcxNLq6YWVCXgxMnItNXlLfQHRoJM0jw+JpZV9MhV3T9kFl2LCfnj63ajm
         Ja0TSqoa6+Bo4D7eTzjha7RPD0kjnL3CsmdSX1cGLN/nY9HPmBB5smCrGTg36tMASitn
         YWTMGysvqgK+xiCBE1P2jMJkm98SUuKrzIb9liBPlLinBdPDM3qmCK9GQ9Sjv30laMZq
         bL0011DItPVslP4sq+ihN0yYpFAr8528VL/W+7mfZn3Hja+FfP3nDNiEVJlkLOGgFGxo
         eidA==
X-Forwarded-Encrypted: i=1; AJvYcCWOSFzGhpanEggbRiZFeuLHzomSXJgjsfkw3YITeQnNCRNKqpHvRziJ0gmvFbHw9F2n+gsW7pL4qOSNASw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiWjEnfFid+ZkjTPqlmP76rhyyM5AjLMh6mf8GNdWcEz4av3q5
	9depkcGFjyagz6goS4WETzOb8OTQDDYFP76zrw7bMqXsur0ZNj7thnrZ8f7KVuEbt10PHWcWeqm
	q8TC36CxOCpfCf3H3WBHEtx2T7PzkkCO5wR81HvY5P6AKxq5RglniBHuAPfaeMZ0=
X-Gm-Gg: ASbGncvtoDaj5sale9TDLPMApCc5Q0G3RpnBgzgsmLnQirPGLmx9x8eeLcYaAVTSBj8
	2TSYt2TRiuSwygoRVKO+JXcW0VDeLHJjCd/iHpdJSR727u9IQUpgjqh0Ld9XYK8o0TBuwmkpFO8
	mxzkh5I/m2dR/BEZhLIVd4cbDJUNerND533gQLWVIKZY0jg9edQom/LldcHs4bD+EOiH5rf2KeD
	F8Oumj0cUhCSE3ET2SDoVD5zSAJzo5oWiVU21u+USeyhyefIrtZwZhczL3+xF4YoAH/n2S5A2ev
	u13g5dQFfEEIl1MRiCRbKMFim4SGhz9OCc0FZ8P4TZveRk2i5YpZzAcd1EpKU+wHZkqkmhP2EQU
	vkfU=
X-Received: by 2002:a05:620a:394a:b0:7c0:c469:d651 with SMTP id af79cd13be357-7c6908950bcmr823934685a.57.1743331003113;
        Sun, 30 Mar 2025 03:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBtS6gPnV+Pz3tdsrxXFX0gc/+BT66q02s4zf4BNLAjJe/IVitafLnQPXX0a4yMcsExGqSNg==
X-Received: by 2002:a05:620a:394a:b0:7c0:c469:d651 with SMTP id af79cd13be357-7c6908950bcmr823930385a.57.1743331002525;
        Sun, 30 Mar 2025 03:36:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0959150csm848746e87.187.2025.03.30.03.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 03:36:40 -0700 (PDT)
Date: Sun, 30 Mar 2025 13:36:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <mki4de5adulxmmpi756bi5frnsa5yx2ng2vh22q7sz6ijsc5kw@oyvb5xuu547c>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-8-quic_amakhija@quicinc.com>
 <20250312-athletic-cockle-of-happiness-e88a3a@krzk-bin>
 <d64bf3b3-7c4d-490e-8bd7-1ad889aa7472@quicinc.com>
 <4aebd1f6-5098-4548-adae-843db8f45aa5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aebd1f6-5098-4548-adae-843db8f45aa5@kernel.org>
X-Authority-Analysis: v=2.4 cv=AsDu3P9P c=1 sm=1 tr=0 ts=67e91ebc cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=UXIAUNObAAAA:8 a=J_IFRixHdDkWMPCtAZcA:9 a=CjuIK1q_8ugA:10 a=bFq2RbqkfqsA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-GUID: 75hjQlWghHehlSy7hgJipgXSHFwnYcr0
X-Proofpoint-ORIG-GUID: 75hjQlWghHehlSy7hgJipgXSHFwnYcr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=827 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300072

On Fri, Mar 28, 2025 at 03:28:20PM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2025 13:10, Ayushi Makhija wrote:
> 
> ...
> 
> > 
> >> +
> >> +			anx_bridge_1: anx7625@58 {
> > 
> > Node names should be generic. See also an explanation and list of
> > examples (not exhaustive) in DT specification:
> > https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> > 
> > In this I have changed the node name as anx_bridge1 : anx7625@58.
> 
> Except that it is difficult to understand what is what, let's recap.
> 
> Original code was:
> 	anx_bridge_1: anx7625@58 {
> 
> You said you changed it to:
> 
> 	anx_bridge1 : anx7625@58.
> 
> and now I give my offer: I offer to buy a beer (or tee/coffee/juice) to
> anyone who will spot the difference(s) between these two node names,
> IOW, tell me what changed here.

Ayushi: mediatek DT are a bad example here. Please use bridge@58 as node
name.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
