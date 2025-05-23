Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54809298CAA
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024300; cv=none; b=iqMS6itLC/j4mGsy3NH45gFbBe94ugqPfCdu2I6n5KMph20K1aTpVqSZWJNEVJQLpOmqYkA6a/OTlPOZFhX4oS8octHZD+9otVZ0U2cu02mfRBhqVougjTwg1AKBCvg78LtNRMKXUVg8zN23U67WwaA/CRc8LwJ7OmVLjHspFtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024300; c=relaxed/simple;
	bh=BgjAMer4sBy25cvBdt4yVPcZycKJiNEnV1nfqRFJobs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8Rs3XYFkrxgcz2J3nV7/WteUN6S/bgv2IEv9lnFHI2ARwADNdrcUdFaAEUTUTuTuaVWonmC8qqLPw/+N6eiS1NEYSgf9hJF4kAFCV/Zs+Tu53Bgaei/PPFT0ZQLJXcAVbAFmNeAmoikN/UUlZ+ED4cmb+ozt0wgCaLWN7D6G0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yg81W+1e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yg81W+1e"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NDbabc011354
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V9nZ5LduKS47wlhyfgMEb7Qw
	5TuFpQZshDkakAX9jxE=; b=Yg81W+1eHFyyyKVUaS/d0IQRon4mr528HeaTbRO/
	ngncNDjc0ngAZVhZv5a39YpecHcUcJzy0zLdObyJm5hFiokCBP156uZtK5hxYwzY
	4AQILCwINFdepvbnoTYxMMSy17IfxxEWHrBXLjFM6Vr+Vbs58GdUVC8Gx0bac17W
	i7AdcKz6seqnVH0m06Y/5xjjhEHQLHYG15wiO5TQD2ew4LZ7i1l+ofbU06XvZUqJ
	KSw/u1vp1nw/sF/cCbnQpXmTFcX4UqTW4XuKF5J8KhGfD0KNwiJ4QYaMYgmeqjO/
	D6zXDR6vc7wx9JumFecsWvH8Rwb3Y8jSdyHha9YjXSQE+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfbaqs7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:18:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d608e6f5so27573185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024296; x=1748629096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9nZ5LduKS47wlhyfgMEb7Qw5TuFpQZshDkakAX9jxE=;
        b=SBCcuNEtpGGyuwtX7QFPR8sHkWOoAkFaqLmd5mxYnlrOVBJECMd4XwZe0VYZcrK4x+
         dsN/cUoR+D9iF/UeLEKEqg3l4TpYoGGXQFS9A4DVrqPVxKUpeXJMTKaW5LdTOkAowSiO
         +5jmfam5Am+RrkH+5OSlOe46E+rkRQdIhMvkYpaQ30IdVrNhx0zEF3xgT7gtGX5J23uH
         XiPzpmCixQ67jSPx1j48ciSYzOLbuCjUe3r9uBa+BXTOWFsC7wM9ACKGGULgiMzx2Wf8
         /K3K8ADSRq0Sw8rzV8MospnQKMnpqW1k1neGK9Z3fbm2MeI0q7yx7sLahFX46zi5Atqy
         v0nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy5rgX+5vXApxeQIWSHLO8XwqALZJL8uRlNXDBfusI8VnRJ0NLKF8yYYg4qwLSijfQpwm1u6YimU63xI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUk2YWH80e2ABTsQZhZBC6DdhS96G5qxl8hy5xMiHxbBh78GNV
	+COxH9syX5u9Tyyeh2vwECgOrWj+8quxvd+BmvAKt6C2U1+6hk/BemNFugCG8Ew/NP47nvX7sKn
	HYp0grlXkgUmBjBSJ1ho/fgLNziBZHlWhxwnYAe4Jq2MkIrNHbAMTg3crF63KD6PUQSw=
X-Gm-Gg: ASbGnctj45LbeFBDx4FUkL7RD2MjJTeAVfDp6/10Ikv35rbGv32C06kLKOPKPc2C8xi
	ZtxGSQPSy6NJ/XE1sfTnOVpaBV2WMNNyNnUm1O/ZmYXgw/LceDO17IpYPFZmGwLUmamtYhEw1no
	h6EbaqsZ4HOnLBiYpmgUid0PWsTQ2+95LTDrLoEltLgtcmYV/sT8LOVwZGLKa55weS5ZhZKZShc
	K6LKYGYThDc22/Sjo2Asuud1OV76oRSk1fvuejs1/3nSJh+2bxSy0+y8J16+22zFJcUntF8IuX9
	uVlphP98Tzswj16AYgqgKcU4cjfO3htHjhK41FyX3sYrdaMumr9blct8tVHScJvYISShp0RcYiY
	=
X-Received: by 2002:a05:620a:3941:b0:7c7:827b:46bf with SMTP id af79cd13be357-7ceecc2c915mr28251485a.39.1748024296139;
        Fri, 23 May 2025 11:18:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBS9Ctk+KlpdqLn+ytgHW8TpGchLngqgx0WbnAgQSn8atp2AfEvN0QF84rqFI/UCbAfB1ioA==
X-Received: by 2002:a05:620a:3941:b0:7c7:827b:46bf with SMTP id af79cd13be357-7ceecc2c915mr28247285a.39.1748024295713;
        Fri, 23 May 2025 11:18:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702f462sm3976032e87.209.2025.05.23.11.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:18:14 -0700 (PDT)
Date: Fri, 23 May 2025 21:18:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 03/10] arm64: dts: qcom: sc7180: Expand IMEM region
Message-ID: <5yseir6wftotl6gl4mfovfv4hoiurs776a3hkvf7uxt2gjvonz@ztqmyuw65ycs>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-3-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-3-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: shByvfZ0pECOjmMw8wvgasCfGE69plu4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NSBTYWx0ZWRfX5yh2vlVwlTWj
 LD6nR12V9bgsxaKFvBdYr2MeE1ZHegmOEYZ8jc1S5I8XgMvXH2tVIR4Bn4fGm1mFD753zd3ipEs
 BY8T1XTZrrVLTj/3ZJsvIUMmNQWbzhTzOGEyrZl2Jkn1I/HXnf2dA5drCIn1ZNKAOGBScBdJbG/
 2TqHcHnb0VEhNeacsETXs4eIZb9ZIQTWo+2ZPJPKA+cEK3ugFf/46DMfoRrI62UktnZ4M62XiO7
 z+R9s8RRSvrLuAGNH7nVvJDYX0FF953bJl5hRFe6c5xrhXcHx0YVweTZvKfqUEHoyegNyXxJeAB
 wYYfUUiur5WroU7Gb+U0CHlDyLOBVV5YWeHW225qpohfNUFLrIrec0j/vJuMRePihWc+QDNmdaC
 fm6AdFgAkgWirz9uuguNs9OkOAMcx98rfYy4AtVv5fGhYKl5fNVEqKiP9pP5kRVhQGzBm8mL
X-Proofpoint-GUID: shByvfZ0pECOjmMw8wvgasCfGE69plu4
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=6830bbe8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=3npRUmwy8-u2fLNlmfkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=545 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230165

On Fri, May 23, 2025 at 01:18:18AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> We need more than what is currently described, expand the region to its
> actual boundaries.
> 
> Fixes: ede638c42c82 ("arm64: dts: qcom: sc7180: Add IMEM and pil info regions")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
