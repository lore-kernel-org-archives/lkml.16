Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A2B289820
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250390; cv=none; b=jsVQx2K0/71IbME6fRdpf++ChxGK7LDKPz2/g0JDjpGRo9W1Kf2+B6tDFrxg7XU/G7zIcs39QJPCaCSCmBeOsjZdr/ol+vcqem69jEX2xBWaC1SOUaNOYTFH51iXCFu/63PD28PZGtikOhfeGntLYfxfuGS7SFvgcMlFqdzVaog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250390; c=relaxed/simple;
	bh=sAPWvpCc5paoP1rOvJ7l14yMheBzwGCOB5G1Qf7l0r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGmCA2GGUCEHCqqTe5cI3rRA7hkyTY17WC6OLeVGjBb5K8YDwcbph/aQExuS0hlt67I1IQLOCa3Gg6Pa6dLTn6Ytf8KO8oBpR8mL/Y+C8X5VaUGJbzuTs37/x/KpfLYJwz9Htz9n/+P4D7frzd/LkPkfAq4lIxicu+pxa0U4bVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2JzJzOo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2JzJzOo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAueD1004704
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NSHyr8CcfGxZ2/FMsoq0HRY8
	55iH+a0Kisr19P6Fk6o=; b=O2JzJzOom8ocJ+7zhyoyrp+ANFuZtweFf1QHwsm9
	s43qAt7RUPh5WzsAYicfRiDv+ScXNLROALmmt1Dky1/hbzKNTavqgljFAaeTepX4
	sicANhLzlDIg4rU2uXDw41AL8ph3feHUOTbuoI3m40yKjeTf39buXBIaEBzJA+QD
	4b82H7fBiGJS2PCswYk5YrjwP6qBsG1jOqSdCxlHI4BKuwbRjfA69jNpSshMkDTf
	sMEAG/mh6lxgS2YbvGUqynmACdz+nyik2Xly9AMpZOhgPMYWDb/zyWh+LZ/9vs+Y
	jcANfVY3pv/ZLdKme+ZxikYazpyTh8S+LSyrPO16Ml06og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnuu0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:19:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f876bfe0so17337185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250387; x=1747855187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSHyr8CcfGxZ2/FMsoq0HRY855iH+a0Kisr19P6Fk6o=;
        b=k0Yi21B2lKkMqSWpWgFtIUCx0XRrEI+xQFvYVUXkZkZAquIJQerFtq4T6alYhLqPMR
         7xNX7zAGmnNcqT9lLqKY9iuiaYJhHpnfyubrmqI4+iQ+yx1Cp7qX7sWbRp/NcEflp+6E
         ZZN5m9h3goIISqFzHTcS0c99pgncSNarwtorpPpfNKAbQWBF+ON+wU10JEnCoP/DYpX0
         bUNwWNeo+jJpU4zhuJpx2U/RTD1krZ9O/RKKaJnuhvD9OnZnpF0XoBqKNrdsGjsoGU+4
         xs+sloFherD9JMuX0mNCGlzFWKyJsnVJ96ghamuaYUZw5RXCQAaBJJIRnt1VB6UNrppc
         3d7w==
X-Forwarded-Encrypted: i=1; AJvYcCWuwZiLkiveIsf/9PG8vjMIhhX6ldC1mqFYEtOwima+n+ymkcv2YY6boNogaswJ5nPpaKad9bwvQMNNymw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx1X/9/L/DUB1WWChYDLXt9k4I/VzmajU2PZIf02N8bCh5nlcn
	9rutiYLnbMWJPiUIri1BFg0+etQ/GeKtc8nAhKFrhPk5fDCsRtjAZuKbZO9WwsDwQUzn7vU1hPL
	F0Su/5R/Nv19F4PmyxOn4j5lc8jQZAa4T8iBZ2MB6yHS8yJ7um+no4XpGkAf+unA=
X-Gm-Gg: ASbGncuMjAHy47vaW24n4OCEkzb9516SnptfIX+nSd8Qn7it5rSyzabnlsL1PTOLgos
	ejh8UYHNO+9FpyEND5gUeA5t5jznV88obqFKIj0Jn3ls0BBRev0gttwSV5pA63yv0nGut6DEoV3
	NnY1ibdh2iH7vX+9yBknsc3JUNEDsXtENCagwqWNURPjj8b1zedvHzNHrdqozK//eTrX0p232s7
	Cmwez3IPYc57HBWZbRx4WylcBfDIHOFFnD7MlyUNBJMuDPitqsl8jHsxL5twZAZgqASVnttIh65
	UBCa/K7QzJghdXKkxtmMAROVYbGwAckTfr3tpeoCFj6gv8lG1CF+NOlInokrkKtYbUiuZLeWYPA
	=
X-Received: by 2002:a05:620a:2984:b0:7c9:5ebc:f048 with SMTP id af79cd13be357-7cd287eb2ecmr555969085a.20.1747250386798;
        Wed, 14 May 2025 12:19:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0P5XZzLLpPqaHxvQBlIrU80oFWrGZUfLAHjWlXyT4vEYM7GmFzGqbUiFFJbaA20guyHR/jg==
X-Received: by 2002:a05:620a:2984:b0:7c9:5ebc:f048 with SMTP id af79cd13be357-7cd287eb2ecmr555964185a.20.1747250386223;
        Wed, 14 May 2025 12:19:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c5e977fasm19539111fa.34.2025.05.14.12.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:19:45 -0700 (PDT)
Date: Wed, 14 May 2025 22:19:43 +0300
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
Subject: Re: [PATCH RFT v2 10/15] drm/msm/a6xx: Simplify min_acc_len
 calculation
Message-ID: <h55v7u3tcxyu6v5ltiahdih22fdu2odqv4f4ix4xbepb4msaus@m6n4ftyp5nd4>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-10-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-10-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: VtNwBD6lOtxIJpvY3S5O2Q8FPgGLuBXi
X-Proofpoint-ORIG-GUID: VtNwBD6lOtxIJpvY3S5O2Q8FPgGLuBXi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NiBTYWx0ZWRfX6O68QEaYwlun
 1iJQxX8fD0rNbxr6JgllOU4TWuxTtZJWksYhEj/TCFC+PvL9ey0pQzISTFRJ518YL4xb/PuS1JC
 szuWzQ89tyq0/y0eXMr9u/8i73pRWTxFC/DPQI3uXtvJJB2s7KPkJZ2GdYPJEAtmSPYJ51MJWy8
 qQwJKF/lTiUYdt8lFGJZXLBelFDe6sgJ1VQnISjxHMHb4fESKQcmZjV7FgMO0daLGwyeibyrWBD
 8G1ydlg4N+iINQ4kyHi/XhpXzl/rHufjnjATMXw4FbQbb+eSdrGUqzjYSutG88IU0wX46j9fiZr
 LxhZqFrcDSyljlm4HaFalvC7FWzIVcbMmttrVIp8xxjnlSTV06C+DKnMcdSc59Me/vs9O9k4a2g
 L8K4fpz10N0eEnGl8iHLqoRZ2O0rOrvPRxkws4EiDEWNmKtV285DldzXTFsTT3TubSMAsbgw
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6824ecd3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=d28x5gvVvHF_Cf3YLGcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140176

On Wed, May 14, 2025 at 05:10:30PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's only necessary for some lower end parts.
> Also rename it to min_acc_len_64b to denote that if set, the minimum
> access length is 64 bits, 32b otherwise.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5ee5f8dc90fe0d1647ce07b7dbcadc6ca2ecd416..fdc843c47c075a92ec8305217c355e4ccee876dc 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -592,14 +592,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  	if (IS_ERR(gpu->common_ubwc_cfg))
>  		return -EINVAL;
>  
> -	gpu->ubwc_config.min_acc_len = 0;
>  	gpu->ubwc_config.ubwc_swizzle = 0x6;
>  	gpu->ubwc_config.macrotile_mode = 0;
>  	gpu->ubwc_config.highest_bank_bit = 15;

It occurred to me that here (and in some previous patches) you stopped
setting the field, but you didn't drop it from adreno_gpu.ubwc_config.
Would you mind updating the patches in this way?

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  
>  	if (adreno_is_a610(gpu)) {
>  		gpu->ubwc_config.highest_bank_bit = 13;
> -		gpu->ubwc_config.min_acc_len = 1;
>  		gpu->ubwc_config.ubwc_swizzle = 0x7;
>  	}
>  

-- 
With best wishes
Dmitry
