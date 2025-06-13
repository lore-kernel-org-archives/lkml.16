Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A09518E377
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823776; cv=none; b=NlnBkqywFMuUeirl7a84f0YxvdVLZkbbw2v2EcB9L/SYTA5vYF8KF2bs4ESjIiyaRldCe4sj6wMBnsiCrjkCRHgTEp+muY5p1AQH1pte3cQAS56ux9k6Xj3JEUYVFaSl6w736BAivCs3WU2QAkp2xCHNb9yIatwW+CxaMBII5yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823776; c=relaxed/simple;
	bh=9ybk7RoIxVOTSKEF8RhhpxFfV6/NthPvrJR3mww0pOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgCABLSbxrNf2bzmXUw2lTdNbBo5nqcLZMDcYy70XteYs1JUUfTuDNZP1jTC2JcymfMXAY6XSqbe9HmWHczqZi18W6+xGTL2L3RKdO+rBc1sBvC/OGBu59Kvyg+q6CHVx5004f3jcb73P2lCJnN27l/2VSDLBdDgRiwsG0R+AYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phlfbA9i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phlfbA9i"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9VcIE013459
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dBbKcLZy+Jxr/umSkxl0m8Tk
	8e+YIMdKicRZEcvJZzA=; b=phlfbA9iTDvq1WogUJYlWJS8EhtGPIDz2A6VewGW
	3Yq3W1pyrbl/1giXjxXG7Ovg7eSya2uVhq5cxbPlwugPyawQDkwhDKBr22IuENs6
	Z6iibqYWe1PPDgRfrafXyBQJUycsLZULTX434MtUAGY5nV2PqnVMW8gZyU1slf7B
	8JiiF07QDEgl5O4BNLEFVfAJXgTG4/orRouz3R/O/ZI9YsfvEApvXBNYKrnZdkUc
	9iRPZgl2rPOthRhVW0yxNQVp8gAlozhOkT3CT25y/Kr+uL3Rv+vPJ6plkFoQ1M5k
	DMWLSWrrqwSAAV+SOIaeoy4CpI6gvQ0PWXq65ZzEAJtrDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmnkafg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:09:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caee990721so513043685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823773; x=1750428573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBbKcLZy+Jxr/umSkxl0m8Tk8e+YIMdKicRZEcvJZzA=;
        b=Tj8jj7uytr67XKbikXHEuDcrs61CbttRWDO7cgU1cjXNy89pfeZmVFrgcXYJiBUuVN
         UKcQ9y2hMk9rYaJ+LOE+4UFGCYwpjp6HTueg1ODl9d2a5CCAEv7SVRAgWbDxnvTYN0R8
         M3rFfO+6UufX3ol4C01wiFEd0RT5qmzBsiNC5TfQFusjIu/XZuvlykXoUhnvc/ZSnG1B
         nhKOtDlcMFp+RHsEfJ4/XvCzMZJkyhc94y2493DBrmvrgdmStNNgl0E9i8OTsJ8fVZtg
         TVLV5Xf+7QwBuI6nKFKsrXYHaxMkozd7rXQIZdUSNpBTwtkxC54VDeJCfR9BY4ygskRV
         l+ow==
X-Forwarded-Encrypted: i=1; AJvYcCXdxkO3gxz9lgM2e49US9vj32XG1qyOcJYyOS+0FdXAGIvBteOvblzmsgcTxsTUnA+jBOCLYQp66iDrB7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWCCv7mIqwVJKPP3MtF4aZxVGZ2xpTtImKQDX3b75EwbokugUG
	B9+L83cbcfTjTuu7yIKXfLm0eoytuA/aXBOcxupUD0d17RV1hje+6FhVB50NRBh+8xxa7xgnya/
	WTozguM69IAn0tY5sGn2ZutV0glK6zvROR24sS3xNodWrd5rokNRRqaaFUCWv8DKtGj0=
X-Gm-Gg: ASbGncv7gTE/0gz9itsd+x0c8Z3DBazVlDgj3let+IBGVbY+rDvazlaKZ/54/I5HQEA
	rxpMXm+0GicS5w6FIgIJbOV9cKjJS8sZbWk2qkuerZAWpOGD40ltzSFR0zg6QyBvdsFb3dusJ7R
	ZtGmDBvSAw/CBg/l9If7LHUWDpqt8WWhfki7c4Qg1idkGDJ90RGaw6BsEyXhwfe99d73VHBpfaH
	KhajO917fDq4MGfhNGaqv9+eWslrUPCVAaidN3D8r2/JJ9R6bTZO6UWQaIzr2pnWnpEBFrpKgSO
	LLUiuCa9W1D0FMvjDvp3O6YcMXv19s9B/eX3Z9JmKSfynE5gcK2J0x4jNUt8bcuidzpQhfCkMmC
	Tp+JWmW9CqN+l/6Y795clD4HOFibXRRTKsVA=
X-Received: by 2002:a05:620a:2989:b0:7d3:9201:850c with SMTP id af79cd13be357-7d3bc3ace08mr455413585a.14.1749823772915;
        Fri, 13 Jun 2025 07:09:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl8SN7pbaLAjQfx5kpcmJcfOmKWAhZsdbfkETLGHu4trAzY1dXsnxEVeHBZOpN1dpoy0tfGQ==
X-Received: by 2002:a05:620a:2989:b0:7d3:9201:850c with SMTP id af79cd13be357-7d3bc3ace08mr455406685a.14.1749823772367;
        Fri, 13 Jun 2025 07:09:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac134f46sm459281e87.57.2025.06.13.07.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:09:31 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:09:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sa8775p-pas: Correct
 the interrupt number
Message-ID: <bjys3ptti725husvinnny6k5qtblqpcnsnignt5t62psuhgkz4@rlabonf2wwe2>
References: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
 <20250612-correct_interrupt_for_remoteproc-v1-1-490ee6d92a1b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-correct_interrupt_for_remoteproc-v1-1-490ee6d92a1b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7VjRIIBpGheNOKbfgqmfBFgwV_0FiRPI
X-Proofpoint-GUID: 7VjRIIBpGheNOKbfgqmfBFgwV_0FiRPI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNCBTYWx0ZWRfX8OrmWedppoNN
 p9ZNFi2fbVZsIxsdQzzmu4Jv8xhuvUNZr478pxrmfOUD3y+1X/qum/qAaGNfU1Z7VdD3SaefzbD
 FDhCxUup8xaLvUwOG4KW5+NYQVTcJYauvYKl86AxNzIWTu66iE3P/Ymc3ns8TrRvEMTx9Ol9RkL
 sv61ZOYVH+ogqDdoqmwOO1X2gIspm/WVt2FqUO4egybfOcsBrUXuS0gngoXtErHNCjoccoo+3Cy
 q+m37BbVhAheYNJwZTLi2SsUUESypz0GGiI2nAMtDYd9/e1TW9c4IQs+uXrGcwO5Vg4Y0piEqAi
 bRjEHmbXOoxn0K8nniXtIMRDAlEuRS3H4+dlBYpWeE3j6HfMfuKjB60VQmm9aAGZG6lk7qgjlmR
 1n6klx3YWkEOnJK01W4vAUsN03BjWpqJvEk2du4Tqj+2XmPx4vM1Absbx/bZLNJcWxMMr9mT
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=684c311e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zHrrO1oeWpa5Vr4l-gIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=733 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130104

On Thu, Jun 12, 2025 at 10:39:32AM +0800, Lijuan Gao wrote:
> Correct the interrupt number of ready and handover in the DTS example.
> 
> Fixes: af5da7b0944c ("dt-bindings: remoteproc: qcom,sa8775p-pas: Document the SA8775p ADSP, CDSP and GPDSP")
> Signed-off-by: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
