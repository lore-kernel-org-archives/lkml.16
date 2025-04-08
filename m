Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8216126773A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744112662; cv=none; b=JO0l/nFdvc6s+Xy8XDKe2Nxq1zO6NFx4nIp1d2WQlxfHi+0xAZx7CPyeRswxmsAZ7nEtWX9fbcIGhSoSWJaE7P/FLT6m5IVI3vcZP4K0tRsfBa7igomt8bSP7ZtQdJ/kTfGcW70UtvqY52u0YJLWbvhs/vg+0kKt4CgXy7jWfDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744112662; c=relaxed/simple;
	bh=DAkJSOh9oR6R2NnPl6o248WpYSHSAEwaTPnUb+BYUBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnmoT+kFWOtblLhjYYi9aKqj36e+15Igb8AH/AYoOfjTPq1t3vsUYyGz6b8azqgDcLu6d/GfbAOZ6IB8hu+ZvcUzQMTM4YhQhxjrX1krFdV9QcmVTJaI5Iec3kN6kJFP5xMyz4XNK7dWsR+cXSamWWyEEyZaTIjgvS0fcwsXgAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUpQTWNF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUpQTWNF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BFsIE019576
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 11:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QiH0xgG4cw0AZfAy/Vvm2ZJJ
	V+VbLE6k/8voYBHRRpk=; b=EUpQTWNF0QGjiTo5X2CUR/GYtBQCAM9kje5bNJN9
	7w6PzBw9QzAnLVlko7o/QmN5PcSfHqy2A44CsEXISrPWbijoFz+Dn9C6+SJIyudi
	3SjrY8xKY7uSwSoQNhD7xLhUIPW7K8u2jEEwa16LB8F6aneBmvMJT8jc3rD+MWqr
	xagh561hbh8IWhPdTmtSzqXfVVSTnJnNj8s9COV7vvx9nxcwELPHgT0T6evxo9qN
	bOyanp+H2LMmb1TsA6EXlZeUcSDJ8KpdZ5Eg9ufPBJU03vQcwby6wwjL1AA0Zza6
	VT7j4O191SllL2CKQYz5bHsgjVwgcl2A/vcG2w7E53SY8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3fkmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 11:44:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d9d8890fso1230178585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 04:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744112658; x=1744717458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiH0xgG4cw0AZfAy/Vvm2ZJJV+VbLE6k/8voYBHRRpk=;
        b=PeIqn32pdJRo47P0rFcxUkkY6V13jIegri7QDIG1/IaV9rjpBwnVl0051MLdaVgTtt
         tdNSfDWM6DfWcKqCFon5VwkcqzaCDNipEdcAATYozKLGA94a65BeiRukZJV3/ruOhR/v
         JAr93GcnoJs3VbRq2nI/2LQhkY533lQSAD3Xlh890q+8YthhlhYG3cGOynlvaEDUUJUt
         Ak5aqH2T5f/qgQrUcujnRs/4L4FRj4PPAJm4rZlUeV25k6Dtafj40znPmwnIiTUEOJfS
         eyrq8EFBtEI++Zp6hEUc0o5n2LtYriUJfjV3Buv+i71ooE/Chq30ruf5i2aUV2ICbYmr
         cLcg==
X-Forwarded-Encrypted: i=1; AJvYcCWS1KQzhdMbb4/cM3uoJN9uLZxOAfbL/NYKzqYZoxph549z50FeaasNmggpsonxStL8q1sJVSUK8d2aA2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgLv1Yr7Fw+6UvjwlK67lTqD/XMvBfWzp3AGMlMze1CYntQHRS
	0QRIYkydfqqP+GbQilrjnsVbemax+VJnKaMTOQQfTpbBErOvEGCtkMXP3SOONLD0UJkglCsrYgV
	PBGkkjtxtWhFpbdJnzfMMtOdt2qD6FIyuiif8tajJZiMzmGQok12tFfdiJupQ3fQ=
X-Gm-Gg: ASbGncuksb8/RlN2jGqSjKSqHwnu6hl6nBoRtSIAoRk6iXgzWr5/SZ+VQevSqjRYgNW
	EWy4BJr34myd8ManPp2SwM4qbfgkTeqaw2BgC7QTU4yE4oHBV3/RPLibe/tZvXVku5kYKIkKw1i
	a5hDppMhu/KNFAikf6CIq+m9CgrbxllbcBAHv0PfTqz+xzhZFREHikvvhyZscsk7nr442osj4P/
	p+qsuD18VPsCwV2LPcJiDlrhvBAjQETolxv0DUIOep3mTmh3WxtunwfZdRvHY5+vVgYhckWWfLk
	JF+eRoBabDRvVrsqnA9Gmmb5ayRCQsfPwVjKAiPcZUkaEENuqFYveVh2WJ0pn5SXR3EvEd8Sgd9
	N/v4=
X-Received: by 2002:a05:620a:1a85:b0:7c2:f39d:d0e0 with SMTP id af79cd13be357-7c79405806amr399833685a.3.1744112658504;
        Tue, 08 Apr 2025 04:44:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9w/HQSwcn+z9yoY59a3SkR++9C/Xa/l18tIcBrY3nXcExKTwVPb0rBd71tZyAyXxczD6fRg==
X-Received: by 2002:a05:620a:1a85:b0:7c2:f39d:d0e0 with SMTP id af79cd13be357-7c79405806amr399830485a.3.1744112658207;
        Tue, 08 Apr 2025 04:44:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031246acsm19338721fa.16.2025.04.08.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:44:17 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:44:15 +0300
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
Subject: Re: [PATCH v2 03/10] dt-bindings: display: msm: document DSI
 controller and phy on SA8775P
Message-ID: <zpmr6cpiixyu2sj7r7oqpqsge6dcqw6xszldf7ugznmcrxqsme@efiwnggcn5qx>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-4-quic_amakhija@quicinc.com>
 <20250312-calm-steadfast-cricket-fe9dd8@krzk-bin>
 <654d409e-2325-46e7-a064-ed9e64277e69@quicinc.com>
 <a168a473-c363-4041-8e3e-84fa44e92b10@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a168a473-c363-4041-8e3e-84fa44e92b10@kernel.org>
X-Proofpoint-GUID: wuieXj6GyhhB-sXEZKbuJD_K3BKZjKNK
X-Proofpoint-ORIG-GUID: wuieXj6GyhhB-sXEZKbuJD_K3BKZjKNK
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f50c13 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VUUUEbkTROAwnXgzEp4A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=750 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080082

On Tue, Apr 08, 2025 at 01:03:53PM +0200, Krzysztof Kozlowski wrote:
> On 08/04/2025 12:38, Ayushi Makhija wrote:
> >>> +    properties:
> >>> +      compatible:
> >>> +        items:
> >>
> >> contains
> >>
> >>> +          - const: qcom,sa8775p-dsi-ctrl
> >>> +          - const: qcom,mdss-dsi-ctrl
> >>
> >> Drop fallback
> >>
> >  
> > Hi Krzysztof,
> > 
> > I couldn't understand the meaning of "Drop fallback", could please elaborate it ?
> Look at SM8750 example on the lists. Keep only front compatible.

Why?

-- 
With best wishes
Dmitry
