Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C06F278174
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365484; cv=none; b=RRytLJYCPtr9C2OxeMwUDAGKKJeA9VGuLnlUEq/fYsaQMcSVz5+LM+qr9v3dYvl9CYjtHaKHixbwhU8k6UAiQDvk2P7r6PnmvfeR3vBGVeNBcRm9BhCxGOefR3kHkZZHiD9IhMDZmvuz/rBI/toynN3+sfgYx9H/rpX5oQaFEro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365484; c=relaxed/simple;
	bh=zsVOdD84X8pt+vFPxaVoFyBPCoT4S8sULlbK26J4FGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k13AnV+3iNlNoyazlk5Q73u6MsxnJlE/Xm8kCRcIwCt6lk0lMUESXIcbHm0B5jyYA687nFT9j3zBxwvOf85hidlYn+wMyDdXURD90SE9hsngNgkID5mvqdoYspvj613CovqJ4U/C875wCVUMaUUV9w3IO8GvLnOmck4RD6Tf6IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxOlhV7v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxOlhV7v"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5TWFC030658
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k+idOG9XotOwye43x+aZtsKS
	o5apYGkMFeSNzvPXUCA=; b=hxOlhV7v6VeJG+N0YGvU0gjoBJF6Yn4aA71CxGUC
	GYcp9uaTYZ8g29UzU0rmK5BJD5j+vDiWoU2KJQ46ld+4CGyz7s+SZabxzo5R3wSi
	Ybv/BUA3LcQp9THEOZFRn3n3IPkjSHa5cSAkHy76P+LvG6kcHQGxPXU2Pgq8SdsP
	jczEm4Ovqw4/QP6hK6qoqFkgUWoahjNO4yrGpR8RoiQc9caWBFo6aQ+weEa4JQ/8
	W52HPqmzJp4os2as8dyTd1cMESCp51Z0MYBw4Gzw88QkuzRzj6Psk1EZFXXB8k4S
	bMvgexwmkHI3S9tQw2ot1G8+Dnv3u5Wvj+/WusbdwCXL1w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftss2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:58:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff7f9a0b9bso1623106a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744365481; x=1744970281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+idOG9XotOwye43x+aZtsKSo5apYGkMFeSNzvPXUCA=;
        b=cKLPno6hmJfxK1FQaPgYUENZSSgIJ+3VlBecqfd/par5pzXPerWg5ZjaJ5aeT3D0q5
         ZTK9gI6cknWMM0bHdBIMMRx/KHzm+QPQFWCKcQAWR166+hIeuD/gsL5swgbKKv4TfCXo
         W4YF8COjfw+SK/6C0srJfI+aE6bZLAOp+n6A6l/i1e/Em63hTa/q0Hxz4oEJX6pynevb
         Juh2bt0iSQyLQ9tx/UOZK9qczFVOM7hzkf/qHwbeTKJyQjvuh2wb23dhCr8oQe+gsQlv
         NzUsFtt3zY1jlgDA6ooUPBIYTp+JuGZkFVwx10YGiPH6LVy5W9X5aMh/L38t/hzxQAjm
         DRAw==
X-Forwarded-Encrypted: i=1; AJvYcCW0wpbBv5LnJZnTuyhTDgWPeswmtanB24eQlqYpPgBgV9ZDP8s3TEdc2qkwtd6zeJDSJWW7hOqAMcRNdSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLOx5YOoSQTGZatfGTCAbRVfBBth9e9AdPTUUrGu/URMQUnSTH
	uX7/M031geD51bvJE0nSOOWAhdZTjStjU0srbL7k4SJnPqMKmCyfdkpCQB68NDioX+E/nHuTatt
	mDAjU+EUWAkP+Zf7pOQkopKKQAlFoxYs3wSa+qFwCsPXSU4ERSHgP20VyZEs2AdRcKMkw9HeAOh
	9OwN68JHoJ79khKTokM9hPwrNCxx/m1FE6pQ2jOyJsB1wS9Q==
X-Gm-Gg: ASbGncuJkMtHOIsXQgWoDZFjYL6v04hlXHTm66hEhFzpAxB7c7WaRkT1Qajgv/mHPam
	mE1KsvCLQw1fvm/OBcGQEk5+JxZBBWRf47xsTP8U/NOKuCqGAVKcRfkkkk1vA7d4HI0eP
X-Received: by 2002:a17:90b:6ce:b0:2fe:b470:dde4 with SMTP id 98e67ed59e1d1-30823670b3dmr4001699a91.12.1744365480563;
        Fri, 11 Apr 2025 02:58:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI1n5Z8D5yvjCWkAaXY4/KGC/DQqzFnZDGgKLa+mNp2DTPuSUov3tYEUj2t2409SXNjrimJVcrKkNOiyzN9oY=
X-Received: by 2002:a17:90b:6ce:b0:2fe:b470:dde4 with SMTP id
 98e67ed59e1d1-30823670b3dmr4001658a91.12.1744365480147; Fri, 11 Apr 2025
 02:58:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com> <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
 <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
In-Reply-To: <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 12:57:48 +0300
X-Gm-Features: ATxdqUEgh6uca37YjS4OleFpbDuXY0MPOwXUGWqzyIIRj2finACospEgxJL2mn0
Message-ID: <CAO9ioeUeNeSxz7ADZ-BbJbhEKkszVS+SmbqaZCgTpL=csak=hg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f8e7aa cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=aDpUdPclnTHmp7_NnesA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: N-MgUXRytpqqG71KS0IZdL7v0yFe94iy
X-Proofpoint-ORIG-GUID: N-MgUXRytpqqG71KS0IZdL7v0yFe94iy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=823
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110061

On Fri, 11 Apr 2025 at 12:49, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/9/25 5:49 PM, Konrad Dybcio wrote:
> > On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
> >> On 09/04/2025 17:47, Konrad Dybcio wrote:
> >>> SMEM allows the OS to retrieve information about the DDR memory.
> >>> Among that information, is a semi-magic value called 'HBB', or Highest
> >>> Bank address Bit, which multimedia drivers (for hardware like Adreno
> >>> and MDSS) must retrieve in order to program the IP blocks correctly.
> >>>
> >>> This series introduces an API to retrieve that value, uses it in the
> >>> aforementioned programming sequences and exposes available DDR
> >>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> >>> information can be exposed in the future, as needed.
> >>
> >> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
> >>
> >> - SM6115, SM6350, SM6375 (13 vs 14)
>
> SM6350 has INFO_V3
> SM6375 has INFO_V3_WITH_14_FREQS

I'm not completely sure what you mean here. I pointed out that these
platforms disagreed upon the HBB value between the DPU/msm_mdss.c and
a6xx_gpu.c.
In some cases (a610/SM6115 and a619/SM6350) that was intentional to
fix screen corruption issues. I don't remember if it was the case for
QCM2290 or not.

>
> >> - SC8180X (15 vs 16)
>
> So I overlooked the fact that DDR info v3 (e.g. on 8180) doesn't provide
> the HBB value.. Need to add some more sanity checks there.
>
> Maybe I can think up some fallback logic based on the DDR type reported.
>
> >> - QCM2290 (14 vs 15)
>
> I don't have one on hand, could you please give it a go on your RB1?
> I would assume both it and SM6115 also provide v3 though..
>
> Konrad



-- 
With best wishes
Dmitry
