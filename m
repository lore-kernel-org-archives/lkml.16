Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C327C279789
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430260; cv=none; b=GgDMUseEnxBNXnSUejhviad4kMfBMErnBM5bg+Pjdc10c9Zt0OfjDJi6kxL1beRKcj6m2mAmYuqgx1d8Oq2Dv8qxXnbg/zpj8wP/3NWcXB7Az4xYg2vG5P0qGHdhrHkayP4zbEOwfLxwmKISCsVnM9HwpMUk2CxG6C+iljFr71w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430260; c=relaxed/simple;
	bh=riQtv7nBcYcJJkZrsW58H8At7TEIUV7pDVxb2GsgEmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tc+O7NlevpLkhOIsrSeHauvdh3k3lJRgdu85nPDA1d5DrK1zovHrFQc8z2/i4GIJTadSbxDQ0x3gXuWij+5Y4X/orAwIsaTxil7oR/AmdOBidK0PXFnT27cWo/glg/u6ZrUl9SKnVCAhbdw+sN3iluAovBxQdKh+JdSlZ1NNPoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EgA0yIdl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgA0yIdl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SA6iUh012585
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WBsyeat3wl3WwBotOVfTmQNG
	LpvBr+fBrkq380ZI68c=; b=EgA0yIdl8RcX2Cj4+Lq4jHOnMqJ3ywL5nriTjlYQ
	Q+pA5n+d5CnLWOcXy2v0PGBCcRvB50AKkOBtq3dnO7DSX0Se8DRdUzax8ymWZ70o
	4f67tPxxKNVXVj7nyimPPcRM3P1nXo/PrlKcARAR99o3+ZJz26euxy/H3AKTelKC
	qqc6swMlt2VYZSXl1zQawK+B038ThJ0WhWbXKcx4FpFxog3lX5lNBTutyEYC1gpv
	vn0FNUNtGrflXeUxvQDfcTWblN15/BCgZZpxdD6buISDApufZCIusSHq1OD4FYZi
	k4E4LPeJylSKYVjlI3R2b3BpvqfKek+Rvf4MZ58NoHWwTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691cfvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:04:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c760637fe5so676370885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748430255; x=1749035055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBsyeat3wl3WwBotOVfTmQNGLpvBr+fBrkq380ZI68c=;
        b=SEu465oGbHf/tGpGkU61pwHmIL7WosWHlvcf9pHB8/lRCgRcOWYf0u6BmH9cF055JO
         uNzGrlfOYi3+JklE4pYynEbmR/3JpKfqOZn2xiLbT5b2Ba9fbaVrsqVrfsyUnXVnNXq+
         0v1rRUxu0f9FOa3ilRURDCEEuULkgZSm0qYDRZ+enkIb4plu+IgxZAwxu8JnyG9k2haV
         Eja0FKkL2gEFyOTT+jFB0s42D0xqwRvtSLoMG/zskA821+0NBxVOuoTIRLS1r+uaCBKp
         L9e98cAVExc2jKCTrs0hn9DdPArUvXdY4bffh/RChvOWFcyBT6xKxmNIwvqCqhhC4cgI
         mLjA==
X-Forwarded-Encrypted: i=1; AJvYcCUC2nFC0CdneQAmLKf9P+2WOQvRcap6Eb29GMnL3k6lJG5azCAO3A2SHaLgfIynV7LbQVod9owLrB66MDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJHecym0ToMBQ3G3FKDhIJaeC9+GsWb60gTePW1FtwF6lH17Me
	r0aPTD1Rjn0pIXleZWBLrHCqr784CvaVV9muM44L/kPlRLbjkwu89/6EHM5CBIx66nqXerVgufk
	TVEH6ITRWriHP3jYM0+8Rgh3wbP4O40yZ0+cwQZxR0SnET8kauOLUXMfcKQ0S0+2PVSk=
X-Gm-Gg: ASbGncucEAschZuHpyUxlV4srmIglr6ffuuZqDgIOQWY5kWcS/BUCC9xFlryieXlS/r
	qzrmPKQ4Yi0jSjNJFubgwB0b7PlgrWW73pEm002UNv2L18p2n+QoLtWZdVO8ZemZeJZOkTQtjZC
	74/kSJ0MsIFO8VDQIrtQrGCnqCOp/D7afYh5rYpQVTtCJIfeuHOeOC7B3rgSZp0FT5bd+yiZHPT
	bV+nK9c6VLykw6AwkoJ+6+wqvEz2t5dVHSZff1hi/sHCNC8+bb5Rwcfv2MdieKpr0gGjls7Q89J
	Zl04b3r47VA+oPU/crgtRIFaxsLfXrw/q9FpqUmVkCDqN7K8g1hCPnHx3aLKeFzlBE4dU04kKfg
	=
X-Received: by 2002:a05:620a:28c2:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7ceecc2b4eemr2502096485a.43.1748430255514;
        Wed, 28 May 2025 04:04:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG10UZJ7QoYyXLSVHNCzvi96Bk8bbljVwgKTscsPit6mUHckIdBl5B8wYFznELJjPcvrLyuhw==
X-Received: by 2002:a05:620a:28c2:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7ceecc2b4eemr2502087985a.43.1748430254788;
        Wed, 28 May 2025 04:04:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f629746sm236497e87.56.2025.05.28.04.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:04:13 -0700 (PDT)
Date: Wed, 28 May 2025 14:04:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
Message-ID: <idc4476ibh4geraklzpas5536jnwvbp6xhjjaajcdcwxicorrf@myh7kyz77rxy>
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
 <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
 <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=6836edb0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=DEnfwTRa2Hw7pMDRkAkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: OJyo-RsRBEIVf2vbV0OlyVCwT-bnWl7P
X-Proofpoint-ORIG-GUID: OJyo-RsRBEIVf2vbV0OlyVCwT-bnWl7P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5NiBTYWx0ZWRfX1022SFEQq+QE
 n7Rc2L6it7SsblmkTd+kxuG2mGZ+O76e5eJO1F4vIAZspxQCP3eKIdAyws7M81hfMjeRdX5p3Sr
 IAx+f40V05jNCGgt275s5HGcz5bRHqBc8g/qH7Jjpt8jcCcl64oZHKOyefmqO52XlG5hg+PNsjq
 28YFEM+fXkChW/Y9ZtPW0msLLFBA2XfFkXaSDQi8CtGc3CH3oIidrHSLvoHIMku7IloJMCHH7RN
 Z3pKQu5Bh7TPmAP7F1Ur5Ky4d1xr7EWpPMY+RTqj2Cm+JhP6GHVNwyQ2r0QA6iSWOSxU0q6+oVg
 2azzkPCGp+GXxGjkMoSsq3e87MZkO/JwPdYB04JcUFwjwPOtpptlM42CknRz4LL+09v8b8jdy5k
 YNroxqzxdu41XE1zBAkrKToFoQQyCCEF0YAQih7HjOniu+hH6b6W366cACPI4mgQ9vEttN9S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=848 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280096

On Wed, May 28, 2025 at 05:13:06PM +0800, Renjiang Han wrote:
> 
> On 5/27/2025 9:57 PM, Konrad Dybcio wrote:
> > On 5/27/25 5:32 AM, Renjiang Han wrote:
> > > Add the venus node to the devicetree for the qcs615 platform to enable
> > > video functionality. The qcs615 platform currently lacks video
> > > functionality due to the absence of the venus node. Fallback to sc7180 due
> > > to the same video core.
> > > 
> > > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> > > ---
> > [...]
> > 
> > > +			interconnect-names = "video-mem",
> > > +					     "cpu-cfg";
> > > +
> > > +			iommus = <&apps_smmu 0xe40 0x20>;
> > fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)
> OK. Will update it with next version.

How would you update this?

-- 
With best wishes
Dmitry
