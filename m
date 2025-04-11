Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8981F03F4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744368614; cv=none; b=cqOELjS35nMtXbb3nMO6Bn/lNIov35azmIiNMt9603n8Bj5FRw7QUNG5sdlZ/zVoyXhVVuAHb8q/Cjg79A1nqGtPRInmo7cL/IdSPpc18Lo3gU4Aiiz0thTCAx+B6XDQ5oI1NvdPi0HcQ4IjmK7XtGDnYEC9vpR21zWAF2HvJhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744368614; c=relaxed/simple;
	bh=lSCdES3Wegn2px6sBYIOT1QpjTAuEGimv1iDsjuQuXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQwUPCQYzVTj7y+5CmH6Prxs93d4LjR+npXHOe1UTG4Da+Ue3x2aIYRjtP/Hy8B5aWA/So699+TwjN3135QqRtlanH8s7/S/skqi3XE2ypo7R+F/cTDax4b7Z1ruuJRcxMq3Ktg1QqRYf3rhhFa8k0Kn3NiG6IDq0EaTfOIpD9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bImzi9je; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bImzi9je"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5rZsY008236
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C97yfs8Wv2cDcw2jhs5lGZau
	Urf5iXgcz88ISp/clXI=; b=bImzi9jeqU4XRcJUar4+UAKMea3Bcl+eE/FvD+KV
	r7qDUPKpU8A86zZjmCGdb6Xq721PoHlqB3zss95FQmOKxfGBhYvZ1XpJJ0klzNpR
	vKMVi/rmR0YLx1DZpd5YxQ74el+itp8MprAZlQYRptAXXRK78U/bPVRNr78CIcWi
	mUjGnunaZ8FSVgcMzPZzDMmBZ0p2qSyCz4yAspIktlx76ub7mDKeIbprc9EPlh5F
	nYPqM3R0a+zeaRGp0ZdXfo5jqDQEN/vZSJX1RRkFVvpUA36R5ylEM+7saCdlk5sT
	Fqagh7eVBcVXky8k0ZRij7Gq2f3RvJj3S8+PbGezaJTOAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd0a8vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:50:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e703so321704985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368611; x=1744973411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C97yfs8Wv2cDcw2jhs5lGZauUrf5iXgcz88ISp/clXI=;
        b=AWbqLUGwltXfkKXd7zPex7aTMvKs/WWHKB7ZSPrkbftnPEsB6KkrexMktO91z2HvD3
         I3eFvxTrF6ydOZ/WugisuBh0Fp4hvQ6XvQQ5hJJLaDT4YNKsTkAO9nSSw5gwpgwxdMn+
         uImHDeWT6E3Mbooqob2JoRz5fnxrXaUoJ+UzeYk4dUT2o38/j9U+B0HuG7bpyI9qiG9E
         +LRdzIIWYewZTjFtH2tNZPTd6n9us8eAV8qCArA4jmPI/TML8oFS9HcbBqC5s/FEus9Q
         72rIQON2gOhGrTHICK/RDq7+OUh6ou7hGmX4aRNUSrn+nk05YmTGr37ei/3Nn5SIBYBj
         yu/A==
X-Forwarded-Encrypted: i=1; AJvYcCVy3osqc2csVTivHwXSzdXW00VFmrPcY208Sq5ItsMv6htD0Y5BzpF4oo3aFIdFF/GFRPsaH+NcOEB3ZcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL7ps1pC+UCskGs6vkQ1rJzFIlxc7ZfqXB66Kfdc/rrlgzXkYi
	Jy643aaldJ1dpJvs9fa3oJL4uScvKU2SkpOf+5WrLLdPO0gtG7geJK+hgmcmG7E1z9fHhzlD1gx
	/llj4Rt3wGM+S84FkXj4ACR63Sa2qXTCWGdqGiJgTAx/qboQIZQYQ8ZE6ydBM9o4=
X-Gm-Gg: ASbGnctuPrIzUOJsQn1x2OM4i+3R7Fd6qcA+dijPx52VJ5q9A55kh3ZSRfQJaQCTNXI
	rQdj26hqNuaUyY6Lgb5O2+q2Efh+HvIO+J2b1jZIA+7Jp1fu1pDUJQvcrzSY5LCv4tf1cFGRpzv
	UCRCTvWK1BQJc40SC5eskkKQ9bx1Ffuh5f4IbVBIW4/7BdRCK0/P+9JTjNyCQ3jPF4c0TgyguTI
	44Jkm1PxigWaUw1XZpI3LS+UcWS+baqO8gYSWpF4NRGNVz/1sMG2Jp1EGCrdN+O+PWsc/d2veqk
	GA3rBtRMM0s6BjEAL769/x+xoVd12f4hNaBZq6KLf4PsQ1RtoaZk7evXXTl1b9vFVRRwSfqzr5g
	=
X-Received: by 2002:a05:620a:3944:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7c7af118d54mr322640985a.11.1744368611151;
        Fri, 11 Apr 2025 03:50:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwuTv7stLnK+XR3ItFXzEehhs3MrRks/jgeNMsXwGYVinCOPI7c7U5rRfwv5bn3sWzVW7hog==
X-Received: by 2002:a05:620a:3944:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7c7af118d54mr322638185a.11.1744368610673;
        Fri, 11 Apr 2025 03:50:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d2369c8sm398622e87.59.2025.04.11.03.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:50:09 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:50:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
Message-ID: <sgjporlde6bgcp2mhr3r5c6wj3a3u37s5nlrrokbutsyizixod@7shpt55muqki>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
 <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
 <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
 <CAO9ioeUeNeSxz7ADZ-BbJbhEKkszVS+SmbqaZCgTpL=csak=hg@mail.gmail.com>
 <b04464b6-2ad9-4866-88e9-437e96645726@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b04464b6-2ad9-4866-88e9-437e96645726@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Qc7cQ2Y2-Ziep8QZr5bzdYcE2OT6tiHG
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f8f3e4 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pm7WE2fj5uaCs4OQ7f8A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Qc7cQ2Y2-Ziep8QZr5bzdYcE2OT6tiHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=779 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110068

On Fri, Apr 11, 2025 at 12:03:03PM +0200, Konrad Dybcio wrote:
> On 4/11/25 11:57 AM, Dmitry Baryshkov wrote:
> > On Fri, 11 Apr 2025 at 12:49, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/9/25 5:49 PM, Konrad Dybcio wrote:
> >>> On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
> >>>> On 09/04/2025 17:47, Konrad Dybcio wrote:
> >>>>> SMEM allows the OS to retrieve information about the DDR memory.
> >>>>> Among that information, is a semi-magic value called 'HBB', or Highest
> >>>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
> >>>>> and MDSS) must retrieve in order to program the IP blocks correctly.
> >>>>>
> >>>>> This series introduces an API to retrieve that value, uses it in the
> >>>>> aforementioned programming sequences and exposes available DDR
> >>>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> >>>>> information can be exposed in the future, as needed.
> >>>>
> >>>> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
> >>>>
> >>>> - SM6115, SM6350, SM6375 (13 vs 14)
> >>
> >> SM6350 has INFO_V3
> >> SM6375 has INFO_V3_WITH_14_FREQS
> > 
> > I'm not completely sure what you mean here. I pointed out that these
> > platforms disagreed upon the HBB value between the DPU/msm_mdss.c and
> > a6xx_gpu.c.
> > In some cases (a610/SM6115 and a619/SM6350) that was intentional to
> > fix screen corruption issues. I don't remember if it was the case for
> > QCM2290 or not.
> 
> As I said below, I couldn't get a good answer yet, as the magic value
> is not provided explicitly and I'll hopefully be able to derive it from
> the available data

I see...
Is this data even supposed to be poked into? The foo_WITH_bar types
doesn't sound like a very stable API.

> 
> Konrad
> 
> > 
> >>
> >>>> - SC8180X (15 vs 16)
> >>
> >> So I overlooked the fact that DDR info v3 (e.g. on 8180) doesn't provide
> >> the HBB value.. Need to add some more sanity checks there.
> >>
> >> Maybe I can think up some fallback logic based on the DDR type reported.
> >>
> >>>> - QCM2290 (14 vs 15)
> >>
> >> I don't have one on hand, could you please give it a go on your RB1?
> >> I would assume both it and SM6115 also provide v3 though..
> >>
> >> Konrad
> > 
> > 
> > 

-- 
With best wishes
Dmitry
