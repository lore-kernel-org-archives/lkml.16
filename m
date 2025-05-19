Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9681448E3
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747616832; cv=none; b=XBjNYsX+vLmDGUSxP50jI7yEN6w4RqpHXZQyH8o5D3WCMZxYngIqR8iqdhgzHuT2RvKZX5ztsXRaKjTysiZow6J54Gat2nRsIj96QlbqptwBUJTNJDOyBiXzHXoIogkFiVThGrcZ7muV0HY43HhOg9Eoq/tCoPp4KJ0nnStysc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747616832; c=relaxed/simple;
	bh=u3coNIEXcwpQF3VClyn+QPxuX3xpkCJDAeCZxa9HiA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyoNLe4sXj/54OvgigkHzuXYZiXiPk1xqgLJ/VVfYI81NOjc6uQGGU31M7CEMpuH8DwMhVO1wDe0siRDsfdSL14TpYfqbjMEalJyK9W98lt1MDwIR0Ca8yd9XIV5CUutETITkpF/uLtAmSBYAnV4i/jGNcdCBJyy77qb32EPBpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZsviGbt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZsviGbt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILLgDX025672
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9NaSP65lkazc1pMW1ainLK3h
	J0x0G4klMCtgn2cCzbg=; b=VZsviGbturYRMZsqYAxoR+//1K79EaiMXT55ntD1
	f1EAv3eR+B8zpw05vAgQC6WrHac3JpMOUyKMY1nd8wBpoo08kmEzTQ5Viu6k9y3C
	JjKSjWKDzql7Daiz1Ng04Nv5dpqEhmvXG0EMXy4eEQBjc+nK0olJ+sgAI5S4wjx7
	zeaNPkaj2QSwHAj0OH9t6mYM3kpe8e3Te0klX6vgLYf8O+3rPygvd0DtxaOzYfu7
	niivAisE8nPtgs0+GyM17+AuVxZzBwjrT8DJ+9aUZ2qhm2BETVP7bDRlCosb9T7v
	4kv5Iavv5VYEovKQzhUiaps7Nl38qyF4xaXowQ1Cm//vmA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7an28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:07:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f6e5d2f612so88321436d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 18:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747616828; x=1748221628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NaSP65lkazc1pMW1ainLK3hJ0x0G4klMCtgn2cCzbg=;
        b=CVmIVOIW72Hq9w5QIF02YFZRLcJGubrOVZnrG9/6xP3siOo4FDs/lq6rkMI8evIRur
         Q1PsLbrN6GxABTdxxSevobHClR0jvZFgld1Eq2Ia3qOwrG4fLYmVjf0nvPYOg8PEKjAT
         jymyRuZ67jtiVLLsxt0NAzdRVE4zU02fOzfPxsuMUNPm41RvBcAO9D0dIAr8kJwLWxN6
         5aJi+Stgmp6ZZLRQGBXkum4Hct2CUT9ROxOBTh3tzPMI5oJOP2K4oc7T2h3EEqigoZ43
         rXv/u1sKyODEB3nyiKnBGPaBUnkeYlgvNsk+bfGTHnsAbi5Lomp+izeXtWRk+MHMpdGT
         RFnw==
X-Forwarded-Encrypted: i=1; AJvYcCUt2cL26aOi8ZJ2O8AyavlUYPV0F+NYNaVBvPcI0qIGlQDiIqziebfVihdILjKWU0qYwZluP0tAxtxEn5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Jddf75QbJURVtm4tjYuiH82KBAmVASZv3DHVaSg7CaeLhdLk
	/DIUKrFV4Sz6MNJR6QKl6QLrlzMzZf7jBvCKPyWXuGMtO64Uq+VjlcQYPfF3GREqLtg/pcZeJT5
	yi/ond3uVhPD8G0N9daLKYK7HRN3Sh+mzGDeHKcwpGyReVhbtYT5+eKGszBEGZj2Bwaw=
X-Gm-Gg: ASbGncufTMc10p4hFe8HTm/FiFi0OWXkZc2UyhT7t9fsUMZw1az6gZMhFgWJsuBYGTF
	Efx0RCTmtVrhil/7lj5mBTk9X5OWINbMOdgk3I9ql7TZfxVxlfvmPKhxJzuRBdalFoR0gujHOIz
	ytZacadmoh/X5/8BFT0hYXuUGEchYuJgpylsUVKNz4Kv+hOLGVU2kKPPalaluDVMIo4+d2xr9fw
	ePKhavIMGius0FGQVY7DWCrCaMKaadrWhy3AzO1ym8o+dQSk/DhxVZat27jXyMcUI3GjWJ5HwRt
	hH5YppbtE4M4ONlNnpZhNhJafyzeu2FjdyETK99hEH/dlwYn9NrG5xrcjy7sHihR7PXNMnBZZR0
	=
X-Received: by 2002:a05:6214:2428:b0:6ea:d629:f47d with SMTP id 6a1803df08f44-6f8b08f9a5bmr185310286d6.44.1747616827891;
        Sun, 18 May 2025 18:07:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqSJk/SqdkBbYqLR2IEs/FtCzb710T2GK5kX1TaRaCIGQhWa06z2VX/5aEjyY122E/NinQbg==
X-Received: by 2002:a05:6214:2428:b0:6ea:d629:f47d with SMTP id 6a1803df08f44-6f8b08f9a5bmr185309936d6.44.1747616827515;
        Sun, 18 May 2025 18:07:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f350b9sm1619828e87.94.2025.05.18.18.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 18:07:06 -0700 (PDT)
Date: Mon, 19 May 2025 04:07:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sayali Lokhande <quic_sayalil@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add UFS support for qcs9075 IQ-9075-EVK
Message-ID: <bhu7ifrgg4fgy56lc3ix37drxyciyzl46qkicv6lr4svjejcgi@dqdv63ogxtjr>
References: <20250513084309.10275-1-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513084309.10275-1-quic_sayalil@quicinc.com>
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682a843c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=tguQkwLf3mHSJAPor5UA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PUh4HpMcHmahLAlCae3nqWuMAo_1PN-0
X-Proofpoint-GUID: PUh4HpMcHmahLAlCae3nqWuMAo_1PN-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDAwNyBTYWx0ZWRfX0NZKvZHcJJa7
 rBUthehnwUmJd8V+Xktq3GBUv7OpeqBowQ4jru3YlEej3vU8mL/a4DDyG34tQR99Fmpwfi2KUw0
 manirM0nKWHAtAvTMHGHBY5R4F/CMBNeZxKDVEqIis16VmIrMqQseZeBFy7PdZ5S5OFjK3GtRiG
 n+y5/y420Xv61Rj41aEA9KOtqM22KaRVnQBcqGdJkyet8KT+4VuCSBrDLTtK3ANZ0KoEScVfI7O
 UtbecyZWuCiZG4UH8k008gyDhmQwogJFEENr4ykzI5k6SFpydohvgqZBSRrn3MbDB0SCc0BWyXp
 lPmvjTOUhAFJdNWZThnAQ2XkaR+ShBTk8yznu5uDLTxq5RcMEO8QopyKJt0vxki8kUXwlbw4fN5
 7cxw3r7tSl6q+bbm7EQYdSm/l0bFfVqiwqNySi4D2yXJ67Uh/uY4SjIv/i3HM7VSybnd99xS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_12,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=848 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190007

On Tue, May 13, 2025 at 02:13:07PM +0530, Sayali Lokhande wrote:
> Add UFS support for qcs9075 IQ-9075-EVK.
> 
> Rakesh Kota (1):
>   arm64: dts: qcom: Add support L4C LDO for qcs9075 IQ-9075-EVK
> 
> Sayali Lokhande (1):
>   arm64: dts: qcom: Add UFS support for qcs9075 IQ-9075-EVK
> 
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> Please note this change is dependent on [1] which add
> qcs9075 IQ-9075-EVK board support.

Please squash it into the original patch.

> 
> [1] https://lore.kernel.org/all/20250429054906.113317-5-quic_wasimn@quicinc.com/
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
With best wishes
Dmitry
