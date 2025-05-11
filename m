Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED3E19CD1B
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746998029; cv=none; b=sr+ZB/nWNyngtWBWFs3B98kvUi6rSDGAi4SD8pO2jWsKHN75PznnQu4uCLLzxYKYIlN4yyk2Lm3ww3pBm3369HNQPYjcR4KASk5IE15aJ3HHc6Q2d1tp3NAFQ6+aH2a7UiEING/aYFCs0Dss8dFAH3sgNVzXDS2H6Sroa8jgMhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746998029; c=relaxed/simple;
	bh=lKhelJ2DwtYu1EQnN9bm8YjpdfO2ypAyd+RPpXYUagw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1JI2T730gxwiwPmnp4sVzlGwvJEUpfBNn9Kfew3ReXZ/zfLALJl0/QEzEyFxS2NNxirWuC6Wqa0qSLpmKPokht1XweBhcGAsCdugE6UEKi8XwWBNWdYf9YMQnX4VLKqi8qfNa0Mo3fBgPxIQkBi6bdw0I2OxZHGOW7bU8XJ7Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gD/ClAWw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gD/ClAWw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BKrBVE020838
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8XaiI9UiHHaa4h3ZDY6Ph8BoQyfXmu1/32HzoVTmShU=; b=gD/ClAWwC8+97Kue
	esIEUPrEaCCedZKvJTtKXL6w/v9zYpJtK5epmz7C98ktOicAJF0LtQhPn1jwgNCU
	4wTeMcnMb9ampIu44n3xOHwpZQwGwG7q7SBoAxx4fxXpUJ9oRPes3T7xTZOciqaJ
	/85E6M2pd12pWulAStVeW6x91p1GMeG7oaI9dNEvHz35zisHsP0QJ92i26VJE+Lc
	lTA6nWudh6ufCrdVwhLyEyZ430mxt0YQTSbw/H4aiR5FGWMUR0dvDlemI8G+D8s3
	+Z/GHUcFabZMt9WXPKTB5HxhLliOQJtSxtKl/T7THr5D++z3RPtPauIlNlQe3Bpu
	rt8gfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hvghap4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:13:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c793d573b2so332910885a.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 14:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746998025; x=1747602825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8XaiI9UiHHaa4h3ZDY6Ph8BoQyfXmu1/32HzoVTmShU=;
        b=pUjwQAg2FMEg79ryZ6ry3NbmyGG0JSIfOoEkjxt2QXyRdSFJknz6ZtC04TluZHGS+i
         8exsNmFRLMm+cHoyd15hH+PK2okO6IL4/xGCZM6AkWQZUbzLLA9s5NgVJViEIg/EMrkZ
         s1zp7wp4899anXVSXxKPhbNVnJ9BE4C8YLBDeULgzezDns//Rj7lGhS6Mpln0Qete3hU
         wzviWugExJeb7vtKqr4hf3Hm0wa6BKytnflMFSgIiJybnfmDCT/6dJKivSt8w/2hjYou
         GL4AXTyyjyXMgenI+icZ9Mfod2Kxb9w7AE2755XZwMWn5Ipnx2kBllRDklNhniRp6Zha
         ZLDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC17acgpTYb0eG0a+PNIYhgwHAHpiAMLEfKOSibaPeBvK8ohoOe17GkRsauI9d4IPT4RNAG27JUiCHCmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeHx42VadnNdLANBQg0ZPAG2enMX5h7k8sgvWu4k8uQAa9wVt7
	349Udp4KlzJr1F31vO6MnJ+m4O8/Z8iArYiYessmr2jwh9HPyG7A/hfRCaAcbFss3tSClELu7vb
	GbcuS0KQzwzaQwIGiHBplodsmjeE4FKXWX4taduB7LYmezaFREX1LLzKIKKlhAxo=
X-Gm-Gg: ASbGncuNMZbmyioXADXjtnmeT2/MJEtqMQozmO8B4vXDNF8RCeKGdu0AGJnz4W6FF/4
	gCKRLwrf0JGfDYTIk3hKQBVZGQZu8RYzjl06OKz+2ebAIheqg4zBawydGcEf3P5DzCAB/39v15M
	rNpO1PdKVAqSYdYKjpUfiSNVdPIUAp1kHHGYY5rCMZTRfjRRXhBgpm33lkCBIuKKxRXEJoca5d/
	YauccUHHcJ/dvoHtg/qEwNvZ1chKaOOanSW/d4mT2r7l0gI9xQ1jNVzCTEGeYEKaNEXOqDpjAFB
	Obe40obLoKJ33NA/NK/fogkgRVNOQN5Ax13ehsSeaPJXBsa+heAb1aZCvHbXlfisTFT2QMYxvxU
	=
X-Received: by 2002:a05:620a:4106:b0:7c7:a538:490 with SMTP id af79cd13be357-7cd010f3f58mr1553894085a.2.1746998025355;
        Sun, 11 May 2025 14:13:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG9kjNTS7QVk/IBI3fAZ7q6HPf68wGUS7tIWiANtFyYY/r9CODAeCGOJFnFzMk3+bULTdImQ==
X-Received: by 2002:a05:620a:4106:b0:7c7:a538:490 with SMTP id af79cd13be357-7cd010f3f58mr1553891885a.2.1746998024994;
        Sun, 11 May 2025 14:13:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fd30sm1255824e87.13.2025.05.11.14.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 14:13:42 -0700 (PDT)
Date: Mon, 12 May 2025 00:13:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFT 01/14] soc: qcom: Add UBWC config provider
Message-ID: <yxmlvcnfjk2nvkqz23lyid4itacrptgpair3zptz7wqsrecsr5@27euwgdw3zvn>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-1-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H6FGm0npQnG+M3Jzn9RSL9CYkkDg3rtH+=on4_caPTZQ@mail.gmail.com>
 <17431c94-7215-4e50-acc9-7df97558af16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17431c94-7215-4e50-acc9-7df97558af16@oss.qualcomm.com>
X-Proofpoint-GUID: A3wiwixl82M0-tG0eM55ZwiZmWClr520
X-Proofpoint-ORIG-GUID: A3wiwixl82M0-tG0eM55ZwiZmWClr520
X-Authority-Analysis: v=2.4 cv=AMDybF65 c=1 sm=1 tr=0 ts=6821130a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IBcEPC0dAfEB-spL9jgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTExMDIyNCBTYWx0ZWRfX3D/71V+6EaQR
 s/oIKRyOAE8+Ly3tA51/GTC2fMsziUjyKaTfrtls8wrNpRuf9cbR7gFeE6RGxHYOvkYoEd/2RbB
 eNT4XQ1cSkLlCpW996Xc6tHmCsaiNOcJtAJIoUMh+oWsUb44qhr+69eGno+p6h/LroKbkzSzKgR
 teA6i8vuKSRQyf4UP3cbSucnNObOXi4oiKFF4KGI0uU3qZGioZRmbaJtHWF5O3pBNk2zp/YeKB+
 OPFqyx77Q+qLWLAO9Sm8X857kD5ST64SL+MK/k2iS2/nSHaarFiaWG9Sh4Cn6YLUeQsHMh8bS81
 9YSBHSqHCduSWqVGzZdBQrhe/w1i93KZhRxsnbo/n4mDGSXXByhKkfu5a4MXmGHvrP9GZM70+zX
 8RJHYQEwTWrT3Qz5c8MeC3AA/+XseTR5Ul/C941tGY/SMuN1qXn89XS5wTKYBR14AacSuUA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-11_08,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505110224

On Fri, May 09, 2025 at 02:28:55PM +0200, Konrad Dybcio wrote:
> On 5/8/25 10:12 PM, Connor Abbott wrote:
> > On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
> >>
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Add a file that will serve as a single source of truth for UBWC
> >> configuration data for various multimedia blocks.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> 
> [...]
> 
> >> +struct qcom_ubwc_cfg_data {
> >> +       u32 ubwc_enc_version;
> >> +       /* Can be read from MDSS_BASE + 0x58 */
> >> +       u32 ubwc_dec_version;
> >> +       u32 ubwc_swizzle;
> >> +       int highest_bank_bit;
> >> +       bool ubwc_bank_spread;
> >> +       bool macrotile_mode;
> >> +       u32 mdss_reg_bus_bw;
> > 
> > This doesn't really seem relevant to UBWC?
> 
> I'll admit I just took it with the rest of properties for a simpler transition.
> 
> Generally, we could ma-a-a-aybe just make up a common value and pray it doesn't
> break anything, as we're taking numbers that translate to ANYTHING_ABOVE_OFF or
> ANYTHING_ABOVE_OFF_PLUS_1 in most cases wrt a cpu-ipblock path.

I'd rather not do that. Let me check if I can cook it on top of your
series.

> 
> > 
> >> +};
> > 
> > The comments should be copied over from the Adreno struct. That was
> > the main way the meaning of most of these was documented and you're
> > deleting it here.
> 
> I'll do that.
> 
> Konrad

-- 
With best wishes
Dmitry
