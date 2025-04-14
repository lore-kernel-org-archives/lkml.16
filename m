Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BA625F7BD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616397; cv=none; b=JdTnaYlxVcsMbEqLgeSPBekpJeMnsMcTXYptDBMOarT4fLOqzajcyUx2S6Qmh1+sK0NWzy4z+3dkwlSRPBD6m5jtaZhb0WXY2vNZoRBxPcvSGReuCMYUV5sxOUNXRq7W4QPd0xPphGTcy1RG1tZ9EX1VHMBeUFPGPj28wufaWuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616397; c=relaxed/simple;
	bh=qF5ht6cdPU1r0V+kQK5l0Co8aSKuRHlVK07MOUtDLZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOzoiqdBfCSbLMZuOif5IjIFd3hX/tirZysnnMxBmCAFCy/PW45zATbOLMMQ7ZMK4J93HJjMDv1BW9GcppSZ3YU7yJEuMxfz5LnRxpR0yYfyqWxpbHvRzfBNMOMgCvd9brRb3DJ2xHKFC8Gr+fYzWAyrwR0Yow6aEH+rBeH2ajI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4ZbHdgl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4ZbHdgl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DNMooa026434
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MmJ+Fq4K5UDpd363d47aRJm/
	X4ZqL75ahdqCEORaDrU=; b=W4ZbHdgl8auni3N8HY/TTNAmdqBWtinh2beNY+na
	ypPePIHizYMpmkfW7P4Vr5/k5fMIpeW9kDjwPBMSgX4ngDGNYazo/oWB/AlVOpkP
	v9K2u+zlTXb0JgLm/6Zl80VhvPa4jBAJscuxr4Htr/7XoYaWBMcIlrVF3ZWasxaT
	E/DUqyvPwCDke4pD7hmgYGvgTYNQwF7MfFhX1IzaNOBs9L+VJfzLj3v/07GZ9KWO
	QdNNXJQlxckrRe/+5WQnX27iRiyAOooDvyXKSIjLDdGennuPsQlK99LNUNR5FUhF
	5uX3KRlmVkctFVpg+Zx8WfgxPdMRXqJXtW5oM8qf90876A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj93p3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:39:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c572339444so564073685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 00:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744616393; x=1745221193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmJ+Fq4K5UDpd363d47aRJm/X4ZqL75ahdqCEORaDrU=;
        b=Jx7J5/o3YYMLHrCqE6YfLpR30mg3JORItSjIpafBCcrkHlHqBZ54BOWgrCCOwbwUeu
         FRLn5pNndEULuVeSESuUUOztR/S36pB5N5oSwNcQboU6Nh3VaN40zs+iVxdcoqoLGCum
         b9mE/2yr7SadOnihxJ3YRdiKrQOz/khFYKbBr2P5mTIvI/u4QHbfATokmjWx4CI3aKi7
         lmcUHdLT7+UHmZNKMv4kWW4uLaXPEeKh6B0VO9zb0S7SVjNvKiQBd7VHUn/BzVNhPW+d
         zojQsSJglwx6lcx3GC3z774+SqpXOOSv/FuHrUMzMjuLfKXWsXSKOpoHJ3koB7pSDwh9
         7qfA==
X-Forwarded-Encrypted: i=1; AJvYcCVywSlE8g/77bZmJdMTejV+0vKWvGhniYBX7rLAsbxLJMRDzy8IPCrEhYPH7stYi2ejp2nNc/lKWxc4L24=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOyeOrSSDOqS+zd09TcWjCisqZQlzH4q0c2yuI4iKEkbO003+o
	mUDqnruRFXQQqM2ikZrRz4k+jtzNJZwEWEbWBfqR3ZtejeTrQkAeiLdtD5+EYYsrmqVrqEYR46y
	49qVIG7Mth0QgCgl5ewzwToOVehB7eDoM63udTXtSFF3ElwdiIHwC8QAXP3F3GT4=
X-Gm-Gg: ASbGncuDXvI1TJD3T9AYAC2NgGdy/47n2L//+uBzDPZSAI/mNDs1jf2PVMS35dpXzWF
	3TEiP6P9WnJoGJZYl/349rlJBP3k8RUCMO05d6bCdge2kh2fME6d5RjQZXWEogkZh7Y+pK4eQjd
	JzIzUcUAo9njgUSyGOQhzz8l7z2gW1OGcgILVcpO/De1QpyYFC9UcxAvtqdgK4X6JKu+egngytc
	Y8GrQtAKXhXwnw6j3ajI+3lNu/LXRYlqR0UGicFaSr/d7f5NrJaC/pdG7xp6UFQryYToqM9j3mn
	Kccr3hwIOP1r30SaVGrl5eXtpBr8V5JQgDEZ6r2YCHtbG3GFwGpb/NWAXHGgKkxfKn0U68+34B8
	=
X-Received: by 2002:a05:620a:2a0f:b0:7c7:6667:ade5 with SMTP id af79cd13be357-7c7af0e0de5mr1678091085a.27.1744616393065;
        Mon, 14 Apr 2025 00:39:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWB8yJJCQ+1aExZQAKcvLDgxwXWq3sPKi6sM39R0/E6aSC84IG/VhxIYGxrQIc/6fwCKflGg==
X-Received: by 2002:a05:620a:2a0f:b0:7c7:6667:ade5 with SMTP id af79cd13be357-7c7af0e0de5mr1678088085a.27.1744616392568;
        Mon, 14 Apr 2025 00:39:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7affsm15992091fa.92.2025.04.14.00.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 00:39:51 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:39:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v5 1/8] media: qcom: iris: move sm8250 to gen1 catalog
Message-ID: <gkgd7gelin2hbkm2ltsifibxs6laluc66yx5k5uupfa2p4sswc@ypkyrj25njew>
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
 <vhfuhjruok7gupoeo2uloe525k7oycd5gkh67zzz4wbiwrczpt@i3qknymfu4px>
 <f637965b-dff5-45d4-b6be-de8c68c6c397@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f637965b-dff5-45d4-b6be-de8c68c6c397@linaro.org>
X-Proofpoint-ORIG-GUID: HFl3T4JUgR_S7d8k6LbRLCT27cG09qN1
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fcbbca cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=Eqk6DaCM9aLN9NpnsfwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HFl3T4JUgR_S7d8k6LbRLCT27cG09qN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140053

On Fri, Apr 11, 2025 at 10:14:02AM +0200, Neil Armstrong wrote:
> On 10/04/2025 21:44, Dmitry Baryshkov wrote:
> > On Thu, Apr 10, 2025 at 06:30:00PM +0200, Neil Armstrong wrote:
> > > Re-organize the platform support core into a gen1 catalog C file
> > > declaring common platform structure and include platform headers
> > > containing platform specific entries and iris_platform_data
> > > structure.
> > > 
> > > The goal is to share most of the structure while having
> > > clear and separate per-SoC catalog files.
> > > 
> > > The organization is based on the current drm/msm dpu1 catalog
> > > entries.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   drivers/media/platform/qcom/iris/Makefile          |  2 +-
> > >   .../media/platform/qcom/iris/iris_catalog_gen1.c   | 83 ++++++++++++++++++++++
> > >   ...ris_platform_sm8250.c => iris_catalog_sm8250.h} | 80 ++-------------------
> > 
> > I'd suggest _not_ to follow DPU here. I like the per-generation files,
> > but please consider keeping platform files as separate C files too.
> 
> This would duplicate all tables, do we really want this ?

No. Keep the tables that are shared in iris_catalog_gen1.c, keep
platform data in iris_catalog_sm8250.c and iris_catalog_sm8550.c (and
later iris_catalog_sm8650.c)

> 
> I want just to add SM8650 support, not to entirely rework the
> whole iris driver.
> 
> Neil
> 
> > 
> > >   3 files changed, 89 insertions(+), 76 deletions(-)
> > > 
> > 
> 

-- 
With best wishes
Dmitry
