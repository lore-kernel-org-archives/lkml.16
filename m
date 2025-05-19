Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56493279911
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661210; cv=none; b=S3EaasthhC1OWDicPFGNnzV72iNGZgNDv0p+4uG70/jM0WzQPGm2JO2zaB3mQN/B++sy9i++Ea3DIWaKifByyXkhVLW9DJgqRwmxqbu94AGa43rGs3LnnKZj0hVNHvbnX+AnN3wSBKF4DyYLm2pOLKccMtuwML9+zGi+heF+zD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661210; c=relaxed/simple;
	bh=dUKwwAuAnYppk79gB4Ni92ph+3QHQ8Ax2CcJHfIxNQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6Md9UoL2lZzqVjXnqEnkLbd6vBI1GhX61UhRu/05n5qNi1yUuoqGvsC4ifCHBfzFDFhTxs6u+Iot6SpUTDGStOFprng0IQ6PWcifwWeB6w4b6NMwyZt2uqoAUg7NeWfm9PS5pBRJbONOMH/eEGUW5/NTSMAdpP8zFsf1mg48fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7VCfql2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7VCfql2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GbGJ023174
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oGkk5uPJENlcrR8ExGnK93Az
	4FZA48X1UVpf5g9eL1k=; b=I7VCfql2kc7qjAhj9U4Ib2pC2SRvhWpc50xCFtgB
	FZEbxxfJw7SgxZZY3MV/GJ6hS0Qfq8uC388znSM6gF+ciCv++FeiWFZP6H+axZbP
	sHQCInrP5gs8hJBIK0M7tgN4GgofOSI8Q5fXWFIgA6P4cbNCRkRTPLGXH3cJbjrA
	8X47iE7CVVWug/XC7DOs8I7+cJfDrZH53KkwJHstRaMHM2r0O1Hefo2N9ou+OmPG
	zE69BHQp7mLZbOP9pcQxWsQos+tybqsG0Neot7lgA09Fs2Wln2+yi1jpxAtYB5sS
	vggNG1t/KHaPtgc8vQZcAjXL5qahu+8DEa7CmRzoU6UzIQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041s1rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:26:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8aaba2f62so79980826d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747661207; x=1748266007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGkk5uPJENlcrR8ExGnK93Az4FZA48X1UVpf5g9eL1k=;
        b=Oi1lmGegxxvG5kCQWPffp/Ro297xcepTIa0C8QvyvvdhN/PiOrkaw7w7yR4/KGEa7+
         4jhFJOP+w6yF+7rW/AJ1cLeT8ruaoqOw2Xj/goKrrAlkP9YW0DaxtGgBn8VOTmLlgswD
         Wnzp28Asbc7MAJ2ZRULIrzretugRBMUWGZHwJkv/BmW5CfYtDUU//KYle3ynsKgdBneE
         KMP5vSHjVovNkzhsSJFIfmRG9K1haGk/OiM97d7isR/OFw1A0+HDyj4bJcQEIeMe6vZb
         0g3CL3j/+jDccweIO3qN2rGTb4LL2Lrs0SPmSVgSSJ3BE9v9m9TtrdnO15c4sQcBR18M
         jtMw==
X-Forwarded-Encrypted: i=1; AJvYcCUhCP+ScEwqaI+yKWUgqIIw9UL5c4msxDu8Q7qASJasDxsiu8TzdmENyj9ODOHHU2kSA7cXLCbzFnHXj50=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG09dn/kYhrQHWh278ZkPMoiqfgD2IZAjqDghBNELT5klnXyh0
	m8VqwrcRQ33bp3P6Z10kJ5f6ccspZtXtFY9nVG2azhMHNJKdRr9VHOGOl31m6x07BsTs4zcSq/T
	43UTywdDMCeUmj+HGxtY7/xtAq6tEYqvIM6gZV91HKmsxk/XKf+CTuMSAcWThPVny6Ys=
X-Gm-Gg: ASbGncuomOPqJg8PBYGQp0M2sctUPgOILLYDjm4yTKIBsWL7aiyuXZydgiRDz+UWj3K
	bQ+xoTbc4AU4jURWWEC+oLXo+wmPJQACNBaih3gp/E504bg1OgNlQ/KhlDVPnesXzOww+Vzg7B7
	WmvfYXTUy9czKU3uhX8YBxeYP3qoBKnXp1VnjKk9523BEhFlaXsg21xxWQsEIANl12YYvt4bK1t
	p44iH/SuC7MCW6IY+3Vm7bLrYvCaloXiLrbcHlh8LlC+KM71PvHdqMZqnksGHoXHQTk7iOSr2MS
	eAr5DPdGY05uP40pD+p/QkefJo/4+ZdqFpJGf1K5JD67XIJ2KND+A61I369vPBcLHCBZjh8JMIw
	=
X-Received: by 2002:ad4:4ee6:0:b0:6f8:c53f:48e with SMTP id 6a1803df08f44-6f8c53f0bc2mr146769526d6.0.1747661206767;
        Mon, 19 May 2025 06:26:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0aOVnc3nCtR9lGsacqR42oc4D8WjdNAyfE+YftMATKn0uQn4ucAG7wCIoSsvdjD5bfEC09w==
X-Received: by 2002:ad4:4ee6:0:b0:6f8:c53f:48e with SMTP id 6a1803df08f44-6f8c53f0bc2mr146769056d6.0.1747661206344;
        Mon, 19 May 2025 06:26:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084dd21esm18791861fa.63.2025.05.19.06.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:26:45 -0700 (PDT)
Date: Mon, 19 May 2025 16:26:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Ayushi Makhija <amakhija@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
Message-ID: <4cjz3wu3osafi7sffluslxea3e6vkdw45usg3djpclw5lv4fvg@ofoqbmwjdmjh>
References: <20250513102611.1456868-1-amakhija@qti.qualcomm.com>
 <20250513102611.1456868-2-amakhija@qti.qualcomm.com>
 <tjp2pfescczqikbu2tzylx4ecb3n6trixvhbdwbpz6y4jc52wk@fmkdxrelun3i>
 <38a94e78-9793-455b-a5ab-6283d397b759@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38a94e78-9793-455b-a5ab-6283d397b759@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNSBTYWx0ZWRfXzG2VrzKVrIpt
 dZ1eUdG6N4Guw5igLMXHW3KI69JGT7M5/Ei6pi7kYcH2inEqwbjxTZG1pXaB3bZLCqEhiCPWxm7
 SsR0fAdM2TLJ5UVvrx7yTj/4H9ctyDVUGKiacr92jmOcETCaFagohzzLFpqt6ude7MMxStlwv0B
 kc4yzMAu7KUrldRn0D2M3WgFftCwtA4i9+dGjKfGn+QFinydSvYHU84NseYOAMgddoRyJlqMtyw
 n4PkfW8t64ex/Ak9q13xL3l2XFJt8mSnqgqSJf+2wIzI7GfMAFBiKYOSoOYm6dys/A803wu1T1G
 Yspb13JCCKGQSafiTlLj42UhMZ9G/hlEHzbsgz2chXGWfssjm+sT9BNmlliergcTc7bIcP7FwYZ
 dOGWBSiMO93t0jXZcKJOuXZ+5MJZVwBJK3Cr13tp3Rc3Ou5ltntA904M5WTd3vpVIEhA/aKc
X-Proofpoint-ORIG-GUID: QqTcnzQTJIKghbJXTnlLcUOG6Z7aXydb
X-Proofpoint-GUID: QqTcnzQTJIKghbJXTnlLcUOG6Z7aXydb
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b3198 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vtArrIq1twOU848iWwIA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190125

On Mon, May 19, 2025 at 04:30:55PM +0530, Ayushi Makhija wrote:
> On 5/19/2025 6:31 AM, Dmitry Baryshkov wrote:
> > On Tue, May 13, 2025 at 03:56:10PM +0530, Ayushi Makhija wrote:
> >> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>
> >> Add device tree nodes for the DSI0 and DSI1 controllers
> >> with their corresponding PHYs found on Qualcomm SA8775P SoC.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 186 +++++++++++++++++++++++++-
> >>  1 file changed, 185 insertions(+), 1 deletion(-)

> >> +
> >> +				dsi0_opp_table: opp-table {
> > 
> > mdss_dsi_opp_table: opp-table {}
> > 
> >> +					compatible = "operating-points-v2";
> >> +
> >> +					opp-358000000 {
> > 
> > Is there only one entry? Usually there are several.
> > 
> 
> Hi Dmitry,
> 
> Thanks, for the review.
> 
> In the IP catalog Clock documentation of SA8775P, the same DSI clock frequency (358Mhz)
> is mentioned for all the voltage corners (svs_l1, nom, turbo and turbo_l1).
> That's why I kept the single entry opp-358000000 for 358Mhz and selected lowest voltage corner svs_l1.
>  
> I will address rest of the comments in next version of series.

Ack, thanks for the confirmation.

-- 
With best wishes
Dmitry
