Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F611FAC23
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776431; cv=none; b=eJjdLOKbR05p3WMzV/lBy2r8GnArpFVTc1pCmWr27Qv+derqK7HSmjstQRxkEYSPwOOpK92qNHpxC8DRrDqEbFsyCPR0VeI42cCacbgXZn+vxUVcYPhUvdIXRmsY4IelBBMonQ/WmgwkhU/iQayypCykoPsdz5ivUxww5sMxJ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776431; c=relaxed/simple;
	bh=Tlres75UciCPZpHtQqwkcdqZyqlwkclBJ7jmGOa+Q2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=im9VZ6IJg15ea8G95Y3b/Z8L66ZkEQUo1fH4nSFv7dy6PtHKswHO2vMl1mL4u3l+GNegJeGolawwR2rmKywhIWi9w3XBCwF8RSO10mDQhB+IbbmXM8r+/smFoNFQU5w5Oe7lYP7EBpz2LwZZnBDPYf7jV1IXG+zpkU2LNZShQoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qau5RWUG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qau5RWUG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdnLv027939
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tG/XW2Eqw3SoJlBkat+rQXZC
	WBPW6ciZKTyIRU1D/7Y=; b=Qau5RWUGBWsuY1V0sLQ0UJo3+PA/1aZ2EOK1E2TD
	80D/kMZWHeGddDhMa/GJTCC4JLehietYdJlEwMpS1A3RMNZMpR/IiA/l0SBdj5LG
	3m8++4sooJcMdAaHlKlFzkKOsxOeWoojDouaclpuahjiBKlv6FgEkos3wlNvSUsG
	7AgO/jRT3jJzPyG75hUckhKEAxFrk9DpCs8jdiHfJUWmb39am/dcznMSrO9NJ4NA
	TGZ7aVLQrDkuCeugZ2DtV8eMQwjyli6PngXQ4xBekMVFnShanK69Jx3F6UfoFxqr
	zaM/hOErf1arN8t6JcS139mbPOk6jA88DeALHQlkQWwKsQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf40pff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:27:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8d4461e7bso30146256d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747776427; x=1748381227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tG/XW2Eqw3SoJlBkat+rQXZCWBPW6ciZKTyIRU1D/7Y=;
        b=Gtmh7GuuSGSGmMfumMjrpbaiSqBaMChp7njd7KjRF+Z2nTxsEYL/CUzrm+LwpgYolQ
         DqwJtEcHiv+ADG3Xy88EPWU9jxhnSIbIeWnlgAHCTawdyaReulSd2AgxUuCkqw41gSwt
         n5WSkdWwvBkSMIJckV6yz9izdbbjWVOqit+1h7ec3bkIuuGKLLKDKshzsyCmoJi0VfPe
         1eTRLnzH55SwiXj5gAJNRcEdCLtGtelaxg+dvv2AgWz/Du3loBgtI9UNzw8QPm47Nj0e
         B5Q7uhUTeUu0QWrDzJ/IfugyX64rU7Su+rTsLwG/j7hQ5TYbutaMAlC8I89iFj4w6fHY
         NszA==
X-Forwarded-Encrypted: i=1; AJvYcCXC+XVjnry2Gelcyg/4kMgSm4Q4hqHD/8c9qHxzFHVyYyAMdCIXyUI3V+C0X1iUMPEPW6/TeIs03ASg8w4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqNC3lySnFEh3doFVd5vnmojzUwUuie0xv0myijYj8iAFCxSzv
	1DAGKq3trL7TjBOXBJEE0hfN9VRCFAQpyIE+3KkWfr4lZSvSMWMGcq6PqgRkHwnUINuU4HI2LCI
	XBvSehNlARRs9nAuQsc0ivozd0cohu5xsGtehWnGVNnTQC4R1Id2VwEirtPZgVwyuikY=
X-Gm-Gg: ASbGnctzm2fnWYHTP8sAZ6mu073wzizizzZFaS/ah/iBS7L2kkzxXpdVwQAdSMAuKfy
	Za1XW6CZkmSp+80VzHJgwhBUD6w/D5vqjzDdFokzxkeRTWseuCbl7LnUZIp1psC4NDwCMWzmHCG
	apdVWS7vu1U717UCpHtNViXCpYS5KgSsmt2TzhGYrrdyth3tycL8D/rhVtkqjhe6kVXhwyJ1YPD
	99DZGMb258FVreQVmtA0rYXSoJJJyYc0eXkUz4FS2rwzlv3mdhabuqsnBwGtJc3ENKOMNYip3CB
	XcTdi2M7K3xeCNwiYfD9EfTnW930SLBo7QmEonJbBljrUt//MbSb0QUyLXKWdyFMec+dYeRuq+0
	=
X-Received: by 2002:a05:6214:194c:b0:6e6:5bd5:f3c3 with SMTP id 6a1803df08f44-6f8b096e039mr276434216d6.44.1747776427457;
        Tue, 20 May 2025 14:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXQvCXDN9w2FBtdGnI+rkan1fAQ9YM0ciJNl1Yj+gIlZexf465oAOPMwNVhIxArargpBSedw==
X-Received: by 2002:a05:6214:194c:b0:6e6:5bd5:f3c3 with SMTP id 6a1803df08f44-6f8b096e039mr276433866d6.44.1747776427125;
        Tue, 20 May 2025 14:27:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551f8493043sm821758e87.210.2025.05.20.14.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:27:06 -0700 (PDT)
Date: Wed, 21 May 2025 00:27:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v6] clk: qcom: dispcc-sm8750: Fix setting rate byte and
 pixel clocks
Message-ID: <ipdt2r25de4zi7zovntb7vopah23on4dr7l2ui3ieevapzdveq@3dtvuhtrdlww>
References: <20250520090741.45820-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520090741.45820-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MyBTYWx0ZWRfXyJv6fFCCxhAU
 VbqpzrOR2ArfQJd4x0bEv+4tohygAHcdCFTsFhNXrDJY7+tNqhh+LLt2jxUGnT1kM/yKYHSFvIh
 obLdd04NCJtKvwMf41YswT58CHXtNEkouzGNGjl8l5m+mhMI0Lb6x7icwf9UxJ4mtEsrlnglJ5t
 CJTGx1i9gLyLnFjjJbi08Zl15xqTwBaj8qYGBB5xHVJ+ZcV0DXxQjjEINjj3ZzhW+4xRsKENB1p
 /viStGvvuwzOsR3NV3FkKLkpqwUpvd+amcgQJFHrCzjQi2+QaUF2wqXgEFo/PGDfpqR2HCtsso8
 JIwP+6gN/QmBRMjuLGBUB8hG65btfkkgWoD1tHSflAN+TCptbil2TfLz0FuwP3raCnmyzSthYrC
 F9az2FgnnBu8TQH+xjDi/fkOHSwWlrxXT8ybuj9XUHslxkzyxl3fHMf8a0w+036VPJCQD7XP
X-Proofpoint-GUID: 52jHN07lj30sdJWZeDlnIqQSJTnFoej0
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682cf3ac cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ZhXjtQkuzpVzWrVPaUMA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 52jHN07lj30sdJWZeDlnIqQSJTnFoej0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=553 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200173

On Tue, May 20, 2025 at 11:07:42AM +0200, Krzysztof Kozlowski wrote:
> On SM8750 the setting rate of pixel and byte clocks, while the parent
> DSI PHY PLL, fails with:
> 
>   disp_cc_mdss_byte0_clk_src: rcg didn't update its configuration.
> 
> DSI PHY PLL has to be unprepared and its "PLL Power Down" bits in
> CMN_CTRL_0 asserted.
> 
> Mark these clocks with CLK_OPS_PARENT_ENABLE to ensure the parent is
> enabled during rate changes.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: f1080d8dab0f ("clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v6:
> 1. Add CLK_OPS_PARENT_ENABLE also to pclk1, pclk2 and byte1.
> 2. Add Fixes tag and cc-stable
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
