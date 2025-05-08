Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDDE278E42
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718859; cv=none; b=lbY8OWApUt+9N6YdH92Eg6ulYQZxM/fvbje1BLzEGnUNpooPBiUqsGUd0MPgOAGHBDKL+A8a1TFrrx2Poke3CqLaC6wvh42UDvdxdPYpl7bMoCfuAikWSqXESsSdN54LTPG6rm1debWhPooqNBgogk6sYCrfiheJgZsod490MW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718859; c=relaxed/simple;
	bh=BudoP3nE0bpLdaJ5jrf66L37C2BHjnq7NOC0WAvQgeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i89xNXn5GeC5SBLKhqdPa16DYxcENQLNMVa5EdASuXi+40Nj9bzu00+Tz0SJLEVIu2lFbBSgVGNVI9YzVRDCf0ycyQae2QheXJsu4tFvpXohauggNyIlz3ZV0snhKMnrHPyLzmuqxWq9bBB2gKyg2m7TrEBtKQIW5b/Lrnplz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ur8eMjfm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ur8eMjfm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548CjvQ0022865
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 15:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oOF+MnASMYrIA5de3GFHql4v
	cdTwJ0Xq/bKgRzL4R4c=; b=Ur8eMjfmWQg4g9JIR+AJpDO+sHWG9LTjGeyx8Ekg
	bDeNaTxA45kwH/ih2i42vwan8UbYQdoxXeIEdWTpsbQrqzYDHLwIWTuP+o8I6FjQ
	Bhpwr3UOHhiv1RGJjUMwNoMCgpJ/kJ/em+dJOTscEBK5nr1Q51HnafeGCY5pVNFl
	GCxzZRAlnAJc6+gx90eKea+OXUBb4oIrk76XsSD+yX68o7hQ4Lcor57qeciohwKM
	MwVQTM4GSH2UgtPeAzfF7a+FhX/AdEeVPBeEoqfJQSFrPvl1sNQIrf1/6/ciUS6e
	uPw41PSKOEAXWNBAhbXary+v/GsP+OtDZ7XNsKMUrTJPQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp81u4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 15:40:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e6f5so275062185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746718855; x=1747323655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOF+MnASMYrIA5de3GFHql4vcdTwJ0Xq/bKgRzL4R4c=;
        b=jed0ThKDqCy2pNrnMMmbwoHCP5I/YQevlMFPoMYAEbAaFmFqwv+Yt7SRIOgMmDKr98
         EwVnJInTqoFX3c+9Mjv+pVSKNxyK6GB0gdty4Cp9iK3JADhznRnGHsYBuDl69Hiua9wT
         F69/zSQGSmnDUY0vKvCPa1aVttIIIU+nc1uUX7L20py4VfDwJGr66yydya+se6JyulrY
         94YlKRtSrCSXylLEi0oOQ5hV0bg45Eu3qTqIO181IrnDTUo9LGNq9dbFGZTpePW7d9eA
         foMHIYuNjQ6DTXoMKqPoSk61rAHqruBTbLjWZ7NneViul2cKJEvpal7AtJsKbEUoWbnk
         VuQw==
X-Forwarded-Encrypted: i=1; AJvYcCVsvMKuwyTBITouSm4tntKE8EJn9Xq1gDbiGt4xxkOzkxKKrTwI2S58pPhXqjc/8Xw5PMuniYmQeGmfeog=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrRsgTo44fmdiRzK61PXaYJQ5qD3P+4f9tkc8fhlDbab0Gggyz
	v42dCAS0uVIkFLjwtV6q7tKKRzeL+IHLzoIBITXngnLEZmhlhy/11QqGfOkrujx0jxm/WV1Sutc
	MBBYjg/R72ZLRX6v30xUG5TTlIxj2iEfjT04wqu3ajwlUAXQN0z/fx5srlDaOUTQ=
X-Gm-Gg: ASbGncuSKbi/Bwq+yqyVJ9d58rSRpFTRYWeUYykiwmzl8vQEiU99KHSsvVgUV77fevR
	AzE9r/6Hk2bEcJVkuyq9nkj5FguAWsb7PhfQrk0FtvPKCsVgzA7b5RW0j0IDtK3Y/2F8qszxgXP
	nA9MEBWYFzRkbkw1mb1/hPRsvVkjN29rjsb9Unll9AIKH7ygyzNJMPVFjlXNEXqn74MsAckTBRK
	0OzHQMhCj1VBbxAD9GDMiHF35zY08hS3pfKOvxf8k0CrGKA5WJAUplgBTqnlyXodxIfo5598TGy
	FwjlAb9DEYAGMHPPQawmNRYWEflORGmIakBTBPkxEqQR58mZuf2cKeJHOR7PV5VHnyVo4hjU8Dg
	=
X-Received: by 2002:a05:620a:c51:b0:7c5:6dc7:7e7c with SMTP id af79cd13be357-7cd01116cabmr16250785a.26.1746718854964;
        Thu, 08 May 2025 08:40:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH++qSy1o2LpXKpm27+d087eaP/M5azZLvvr1IACNhrczohQ43CEn/1wba7dJLQRJIXoyzPFg==
X-Received: by 2002:a05:620a:c51:b0:7c5:6dc7:7e7c with SMTP id af79cd13be357-7cd01116cabmr16248385a.26.1746718854679;
        Thu, 08 May 2025 08:40:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fa48sm1857e87.1.2025.05.08.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 08:40:53 -0700 (PDT)
Date: Thu, 8 May 2025 18:40:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: Add support for qcs9075
 IQ-9075-EVK
Message-ID: <k7xxfhkzv2cuoxnmcwysh5hdqsbwpwiidjgxumlgbhipcwujho@lkbn2poddg54>
References: <20250429054906.113317-1-quic_wasimn@quicinc.com>
 <20250429054906.113317-5-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429054906.113317-5-quic_wasimn@quicinc.com>
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681cd088 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=v055IAusiqpEkrIEdyEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: D3fKG8RSWW1UebKZM7LrgJINiZkn5nn9
X-Proofpoint-GUID: D3fKG8RSWW1UebKZM7LrgJINiZkn5nn9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEzNiBTYWx0ZWRfX6EhurlIlvXK2
 32suZkWqhNBQ4Fhxfy4n04CRPC3Z5RODIry9shuwpVWie5fSJhVCK5u49I2RbruvivupFAKXQiw
 D3WP+81VrL6pfa5vCy7Lxe9zmw30WCyugRrFMDRW31KDZJeaZt1wb+oI9HGG882FawVRWfR275h
 0HzZzHd1FRsZYfAkahEKjPuOJZL6xfhtgjt9Hsf2o1PsKl+8Hy7Y77iLABuV0Qv8ATyO0zMpXcP
 9kG9quuAIglAgGZmk61zVci0Ua5RUWxOVmLwHcGVUkeTVNuR6UvMcu4Zy70bcwnOXzG8crGggrU
 +K+Pj2Ws3gKC6ysAmy1lTfYweRFxGSKuIxAjFH5W3qk60f4DogCVEIGcg/5+ba3uQoIFTxGOTD3
 VWnjKF/so/x9ps2U2RsSMCG67hUjMIyabmbxrKcCbMltNS2fOi9osCmyUgszz7mLcdxNFzSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=772 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080136

On Tue, Apr 29, 2025 at 11:19:04AM +0530, Wasim Nazir wrote:
> Add initial device tree support for IQ-9075-EVK board,
> based on Qualcomm's QCS9075M SOM. QCS9075M SOM is based on QCS9075 SOC.
> 
> Basic changes are supported for boot to shell.

For v7 please include UFS support. 'Boot to sheel' as 'no storage' means
almost a useless board, which even can not boot the CI images.

> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 268 ++++++++++++++++++
>  2 files changed, 269 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> 

-- 
With best wishes
Dmitry
