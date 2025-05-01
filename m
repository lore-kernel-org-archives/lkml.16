Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401B6204098
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135931; cv=none; b=ttDNsztUqcm6gxyjlals5cenaDlKXpBzlDzs0NABosp5EI02NcCNzbGseBMmh1A3/X86LBsjhfLCEgYpbsqm9alqwGVTeZ9T5cGYGyjNwDxTuZ514nA0wUYbpRg1spsdMiOQGS0iv/T22MVkchNmkLaJGYp2qon4H38HPeYDoUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135931; c=relaxed/simple;
	bh=Vl91YjoG9bqUjwa4D3IQmMOeHqOlYv+Ub5TMWghr/ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCCNNb2pGBtOzANOo9Nxe9YCUoFHkW+8I79mzZWnAFTQb3Y7WWRx2XZpGNnftjLGjDILaix3ziSARXfe5lR4WixXpgObQnnMhOfGxAQST27spa8/AGjLx7fhdVx+BQPQIrSXmhdd2PACySN2PTG4UuS7XCH4t+KgRoYkciE8pl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6vyi+7m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6vyi+7m"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D24wp006978
	for <linux-kernel@vger.kernel.org>; Thu, 1 May 2025 21:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZWvEe+y9fZ95LVZsDUiRwMr7
	gR6HVKRq8+OepTYfaZw=; b=K6vyi+7mToNIxjqq+Ofgd06E3o9S/X8ARJPRxMz6
	Unhkwgq3QdDdgB7/LoNv13RljEQ2wjstmw4D4y3PKkA7L+u6j2+3OBdSH0eklOdb
	trR54Z6tA+VB0OfEqSFs+thq2Yi/aStvjKUNbNSdbEJbaPV7bChyArEVh30sUFDx
	vr5NUHdJoS+pOtJbUDH9x/GWeF3PzTsOrp6tjU/Yh1ZR2BugoAqMJLO4qzW8WNR/
	spOs4ksP/c4jHEHpbSp+QCDAwjcKIS+x4n2rqgzYGJBU5vL6fM4nWtgbDF8cJUtk
	41i2MzIdzp/q9BCiI+Fv+N7hsX7bay5REUyT6LwjaAr+vA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u9xeum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 21:45:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c82c6d72so230973385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 14:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135927; x=1746740727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWvEe+y9fZ95LVZsDUiRwMr7gR6HVKRq8+OepTYfaZw=;
        b=V4cGRZv6j6wkJLHKHAkWEC/+Uw9sDI0JAinQ/NxeI6Ges7CoJWoEOzWE8pVsev9ZT9
         aVleSAHpSWTNdbh9N2LYrGKGurH0DK3lxjcf1qVge2thCHig7Jfq5Lo80gX77YicHEGf
         Y/1Y7c59n3+e/wB0ezGka+GmNoMEj/56iFCNdcoWVsS0e06ulxZUiDsiGkfzhNo0JsEy
         F4qG+1m+fw0Cpt2c+oTwJR6YS5GH7/iwRP6q+wDQqNhuUTTtHo51h9dPeasCt8zozwfk
         yVQhMXjqBfrZNFzaFxf/gK4/f8A9+qV7YlY25yQgS5HDasWFVeL/HzvfiNUVVHnufXeY
         7rOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsFokekWP+7kVUyzOB7Zb1TcFvJPrnH1f94MrGj1ncFQGPL0ju8IurOWtW9/PbmR/AMUE4c75v4G60WWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH3nyEtPcEnESQhkev0+YFMjr6tZTTeaQbg0yiUlKSJggkZ+qO
	NSdhxwkWyJjGsmd7v635sczf7cOr6o3hAxGF7F10PAk4TrN/s182Gt2qb5KM2PltDGjxF/EG0tU
	caW0FpHLylzCvDfRRP78R7Weyg9Qgn0d22wpD3aotXdz/yu/S3hhxS0/o3rNCww8=
X-Gm-Gg: ASbGncsqSGE+BuZXVsN60stD++nD045+bLNtEts61nsE47Ag3dv3di4b10SUtxNXJzv
	1dJQjDzvFuVZi010zkQR+7159O7gBsMlQj5oAA5gv6V8cGaSTNZad9YNNBVkQB5yKFcmBAfC9sw
	EUvKF2Q+94cWXgp7Yf3+1wbR3O8m14YnfeWuoyMQ2IwcZM0M/PJAffcqzAl/QthbGCp3AMWFAWY
	GOESLZxfR6NoApo7BOJ93HnXRge0Iov6AF0NE06xFe33xKciODgKKrq4LNf5wfmxMQvZAGMSVGp
	aeAr3vYRztPjkuI9o89OftCbGsebzEFVp4zfrSFZq6B4EAPjk6c7nieGm0BwuXc988HLk/ntZ48
	=
X-Received: by 2002:a05:620a:4304:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7cad5b8e24dmr91836985a.37.1746135927305;
        Thu, 01 May 2025 14:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+2T3LiQpLagEU33hPpPGBOSneQuetQ2NiGG7X9LR4oyqvviiI/t4vmBzHx93FvWEjq2NtFA==
X-Received: by 2002:a05:620a:4304:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7cad5b8e24dmr91832185a.37.1746135926940;
        Thu, 01 May 2025 14:45:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202930c92esm1997371fa.54.2025.05.01.14.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:45:25 -0700 (PDT)
Date: Fri, 2 May 2025 00:45:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Robert Foss <rfoss@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 02/11] dt-bindings: display: msm: sm8350-mdss: Describe
 the CPU-CFG icc path
Message-ID: <spvg6kmgzkmkknttwrzjonn3pshj3vvoqn2ffv7euucnkysbtc@vmiqfocytvar>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-2-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-2-0c84aceb0ef9@oss.qualcomm.com>
X-Proofpoint-GUID: yX1DJi-tyS7Y9BYaOykjj7Luy5AprarF
X-Proofpoint-ORIG-GUID: yX1DJi-tyS7Y9BYaOykjj7Luy5AprarF
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=6813eb78 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=EuULMs42TwgxzVLzQZQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE2NCBTYWx0ZWRfX6Wy01+NBhgsW vqgwpTieIPFLbigRtPq935LsEXZhu6rlRWC6Ien6FltEw+MdVELJGZdZJqdM4G9D+LR/8o/uS20 w7S0ShyblKI3aZ6DNXZI46kSrMgmdp1lEtMFRnVAkWkjUxtXa0XTWF2f8ES5Ong2w9CpR3v7B1s
 eMALBYdsTM+k+sblVIhOlEbhd8wO+x3/dq4LYifdIEjJOeRvvD4tSU+tQl6vUS3CrT5B7bCq/Y4 KueRAB3m7Ubng6YfGsnuh7V/m1avePKdQ1fe6nkZYPjis60/ZWBbTY8L69/ecNZVCs9GF3ASIV6 BdKkZx8IGZNQHoziFb072r+w7pOKO5tosnoZInHHcNoMZHy+X5XdxtqN9wvsGiTOglWi8vONNeu
 1gAp1ATnNKIwgwEM0BHCnDTsOKP//QeCXR0/5GQw101UkPoaLpUZClH/yiEgvPnbWqtMcoqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=623 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010164

On Thu, Mar 06, 2025 at 07:11:14PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There's a separate path that allows register access from CPUSS.
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry
