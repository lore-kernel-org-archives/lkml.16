Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298A02AF10
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250132; cv=none; b=RovYttb5TzhfxaYcldjANt6dr2e3wPMedwfoEklW+P/RExUNhymVxyAs9C9M51z2mg5ZstMJcGuk9xPjLEqcy9q2gexs2S0bT/h508t/7NxS7GTZC577kXox8X+29rRHC0rWc8zkewkHlpHr1G0fp2dI3nRq59Yu85iGg8cUzEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250132; c=relaxed/simple;
	bh=nAoSvOHPIz+9ILD3J2jNcNVhNO1TrCbTaIS+TjV9/QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ha0STXfagVyc2bgBpG4RAaRwb959CFGcrGAdeR7CTQ7UarvzSyfQUEbU7vuRvGsn8uHzaWDXHSMtLBe8N1BUh5Pk0fR3HWYJyhUwLZDNhzt5LIvwjvE87+BPUHQaulXbpuJlNSIuA5GmdBY+el8fjLnjAAoiWmqulHDboRgdXss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D04WyHYH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D04WyHYH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EIEgon013157
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=toamc2daXxgjaeXdZ8/hVu4d
	twjcBOGn9eztJcSpD8s=; b=D04WyHYH6rOt2gr9pdDx2ne+EyzhnnIrz2RhMmNR
	HWgLozm4McqxnMD+QFxHQmyCmrsa72oMwPPd7FBSluNW2fbYpsHanPNE1eEEdfmS
	dWWIpM4fnGewdI1lwwylUJ6rIVjJSIu8qu/ZoALlu7bT82UqS2SK64AMgqXu0aje
	lcj6rQnpuq5tK/4LDaBhYkQ1g27iX3yvifSV+SMq73d3ci7qWrklmybHCB9XGZrG
	AqrS0GlTl7PGr7+QGLbkNtLupZFiXkGw9LPkoPLu6j2z8Ow6wLxSS8KRHwR30MSe
	4Hgngi0vpQVHG7PCB2zL1X276gCzSZC6S44q+FQyWV9IWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmkuyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:15:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5750ca8b2so13188385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250128; x=1747854928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toamc2daXxgjaeXdZ8/hVu4dtwjcBOGn9eztJcSpD8s=;
        b=IMpLWbUY/Rp/MzrtwmA8AXvIrEPmVHQPuaDfS2ISe960mqc8gYBCJFe/b0nv+bp3lA
         Askt7t6sbPFKAeiF1BQUMw5wRKhJD0qEgdPG/0Znwt6nUOnKGR40UZhFNym/eJXhkfzE
         +cxkk2gYw51ZlXM49bfqHdU8z4PrMJ6yYxFJ3+M0zVKs3/zuU88gxAokKEoSKh0E346D
         piPNfWQK0wjGzVhC7oZDKxVGv/6Hs8scOYGyjO6VKByIefBoDaSdXf84S8BWPyHaXfEC
         iBo7TlF3GLq/Pm+JspUYu/k8QRx7+W4EQvGb0P6/XGDBo2jMNmfQ6poJ/hipdXzu9H1A
         9olQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKbohAuzw0W8cYf1cmGdrAEYKO4KZzuzCQgrbyfHDPaRW0X4xGYHbB5X2T0wkIHbXdQLhTMyhZgFW9FVE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0rq59sMZVdPo5RlXCRGMI2Tmp2sEsNMcf0KTpsws7OganmwVl
	PnfXtliy0ZalI+MQl+X40B3NBhZWmEpPXp0MDqTz5mtjB3MrB69a77kONthup2DGfi8dopSQWHq
	bNYCwQaq3IjED8wFlRKjMzDW2YZwUU50SiGcTJOeozvk7BvahJaoiiMuqfgAUpVE=
X-Gm-Gg: ASbGncvpPNrN5HNo09IbQrwdBr4eC29db8GsB9NDxRmMOJaLUJgwPYgSZIaDSAAdjUs
	gbsDxvUTEhXvT3tnAOtDr0jZZ83Zg1znNZbC4tKrzmpThIzkhRNe7i94Yh6fZgz+dHIz0J7Jq4W
	bQuiJlZwxCyKHxGTnipBha3J88gvIEayDBoVvqtMN07DFTZArEymiHlsZYIzYZmJ+OYfJPU4RuE
	H8EZLZjJ8Ne/lS1jzt+nA88lxxtGTXwPNqQXE4mAE2knT/yJOw/mzhrD6oPm1sD3S418NAr2VOG
	0hB21JCYTYKgj2v48wJXJub9KCuZqFtILME39g4aKFlViL4w+z1Q5Pdg2+BZeU2ZuWiLP945ojs
	=
X-Received: by 2002:a05:620a:f0b:b0:7cc:c07d:e3d4 with SMTP id af79cd13be357-7cd288557b9mr577862085a.35.1747250127866;
        Wed, 14 May 2025 12:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAmx0iWZKMm9tkE65sUZ+0KOPm2/eiRcewpi4kWrjcOrS5/n92vEonleB4k+OU4sB6qDStmg==
X-Received: by 2002:a05:620a:f0b:b0:7cc:c07d:e3d4 with SMTP id af79cd13be357-7cd288557b9mr577857285a.35.1747250127440;
        Wed, 14 May 2025 12:15:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33b7c1bsm20552461fa.35.2025.05.14.12.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:15:26 -0700 (PDT)
Date: Wed, 14 May 2025 22:15:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 08/15] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
Message-ID: <vnjkfbxyfpeb5nbu6nnasdcbkiviefi7hu7qtpthz4uu6zwnnc@2u6e5j22ozvx>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-8-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-8-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfXyxB6dJiEg9Zi
 d0TXTP2+8HYYQ2MHPBbYbFSCHcVDHnVQKqPes52EotUubQm4JZLxgx2B5csuiT4LVCZDl7Jma6Z
 rw1nzA2p4KsOcSCgmTAvgjbnmkuBWp3fnSlgDpEq7cWG23fphO+uOdC4kQMCSBI6wFnKGULUvow
 mDIMWLUqyg82Zd/+T553TbhSMBN5TBS+f3UfR/xf1TQbPyzA9rmSruhTxR2/4jhuiaKsNVpnCmj
 GR6bjU4MEjx6cjZqeYOPObvqM0qUBI52CVtuOx32tXQZLvE4QWOMmW6toT+LL58T3PyHvUWxCL1
 9gtNFgi4ctjsrlCs/66tlDAM/4Cl8AXQ06KmgggAefYaKEU0Yeh5n/zdM56RWZLohn+bY/NlMZe
 3dxm4kMQYGTRTCHG2c2D+sn+wC7tF2uO25B74UouwIh+Ekewu+sztI/4W7VWAXJfB9KFcmoe
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=6824ebd1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=0v1qzFne9LvPmFAOVWMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 77rHO1SEq0_OulRVjaSndKcdGMJisMRq
X-Proofpoint-ORIG-GUID: 77rHO1SEq0_OulRVjaSndKcdGMJisMRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=732 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140175

On Wed, May 14, 2025 at 05:10:28PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> ubwc_swizzle is a bitmask. Check for a bit to make it more obvious.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
