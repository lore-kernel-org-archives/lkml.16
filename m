Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E1722D78E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569589; cv=none; b=FUFN7296vQdPE7hp8wpz9w7IV3Z5g6BfijElxiA9osxfF41ftlRfc3CePakIiLoyUn2E8XUYc7Tah87kows/hGj0gfW2qqE+KDbnk++dOHdF+pBEWTz3jrg8FByloxC2xvsELYPhDwbv/Sb6HQgWChoS5PMesQVrlu8WRDzk1YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569589; c=relaxed/simple;
	bh=aBVvT3LdMnSNKKS95nXyx/2Wgt4vHzSWboqRRCTYYzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eM7Kvexn4Mg1SInh0SIsfjUt0rJ1YszHYRxIBJAr/BByrd5/1DGdcfBW9m+LCrXOectbMNpK2c1b1X6ZiL3kcujVGcO9gzNUZaJrUuTL2C9V/8boCVhCp4TWJPD/L6Ry470t5Um+JB70yAAo5NITWaG7p0b452GTukC9YijNGVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Out+PDcz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Out+PDcz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P17HKb016993
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5GhjiZ6SmVr+1yf43/s7AZnE
	KUCWcw2NJ8cW+4voUf4=; b=Out+PDczEhZ3wrjv/Zw4MEVJkoxvqWm3J7dXqNuC
	r9KRGaFwPTKcKtShryF7CJ9Ijz4nDBx/LwLH/YSU3kRNJFARzbUeHcxdZ3OOyeJh
	ceHgS5MO8TcUWkkgyd1dn3uJ5WRzkCiIKg5mNc1vxyoxa/bgTslNa5rBCvjEW9hH
	a8JlqlT7E7bZaQRvOqnhNLNlLAqhpSzan9Q8Jj7pUAhxXLeKq5aZ3RoyEGKHbTF+
	hnzM5ZbEnMWzfYdelLxMCZx1Is3kZgkt+lUvlqygyQtik6nVLqQJTOrLgJK2x1lA
	wQoEmeSpcJlaLDPvvfR6m4ws6AT9Rd2Ao7jQi8LKlxKiVw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3r6gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:26:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5b9333642so250528485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569586; x=1746174386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GhjiZ6SmVr+1yf43/s7AZnEKUCWcw2NJ8cW+4voUf4=;
        b=N+DdkCUx/ojOCm+c1zv2QloxLy5mKigg6niAb3xF5vOOJcYvCQMnvGwFPKPtVgGQ/z
         A0MFLO++8GnZBfVLnet+jSggyAzbCXvSghfxmtvwai6bLe3nEysoPDrG92bsefe5huUc
         SW0CIfamPcDBZfqRxun3vcfX7XeJuIA3j47WHqclaFxWkB1LoEYHN56cxcZTcELBZNmr
         xvqBMA6Na3jcahbW+BUXXDshSbcjz6CRt4dU/fcTEEXAvTwDYeU4AcyMte6h1Qo7cILB
         NO2DPHGsX6/ohEEm9uqlzaz8CA7QpWJDvlkVbsAXJpBlTKNXqiOjg+ZvJpT+I5LGiZvJ
         qBYg==
X-Forwarded-Encrypted: i=1; AJvYcCVZHF8LmCyxkTbS+kfKbC3DKv1GI21SASroe1MWBwa1mcR03f7f489vmRCe/hjuoi84wIrydhjsgdNKPR0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6p6YfNOrF6q9O2nIJuWhXIeM/yF1kuX3IvfUE2L1Gl2ta/gyv
	XLzlg3RaxuEgD/WwfPfjfZAgZnhX8X02jSNN0MSj1iB7o+nMZ8+T6rcc2PVgoWXcZH/An5N9j2t
	i91OW++DAfqlCZZXHK+zvg2/aZ0gpqeAwE+7njnXgV7/MxneN3T92zS1DkrdwG/o=
X-Gm-Gg: ASbGncsNx7f3VSn5+OS2lgH6azVqli8LB/WvXWBtVCZizKHS55bC3A61k9gXEv/Xg+3
	8BuPGj1shtz7ZLhnRef2JaZYT2Bsi22dV7hzPAr/5Yjiy8mZTkC8P8/d6QfJLy0xXva31Ec8k7t
	PaaT9+xOzwTGWQELPb5GJbbt90TnUEIzrlndU96I/KM23C+sfQZS1WrsCl9Wwbp29WViCWCJEYq
	tP7AYDZcoV6dLJBqdkonBV9xVG3iJXXZWLYX/V/wzEjZ7wvUDbW0kZ8jDLNoAIXYbtwjUwY0PaX
	UeUm1mWPL9RoZjSitoYE8bpRhSTWDorMqx4G/jK42p8YEK8bTHrMwmJAlZIezWzc62iaql8Zz9E
	=
X-Received: by 2002:a05:620a:170f:b0:7c5:42c8:ac89 with SMTP id af79cd13be357-7c96072019amr205522185a.33.1745569586074;
        Fri, 25 Apr 2025 01:26:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhkTqNaE2ZpZTXAIFDdmsRFjOhc20VJdlsjzXMKpiPe6YXZLDPrC+Vxjm2BsPdc1TC/8L4Jw==
X-Received: by 2002:a05:620a:170f:b0:7c5:42c8:ac89 with SMTP id af79cd13be357-7c96072019amr205519385a.33.1745569585576;
        Fri, 25 Apr 2025 01:26:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258c2sm524680e87.32.2025.04.25.01.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:26:24 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:26:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
Message-ID: <3kprgpvzffupnjbh2aodsowwklliywpemzwpsftd2cng562yuw@37tpwmpemr2c>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
 <krofzevprczeuptn6yfj4n656qsw52s52c7cgiwotidxmi2xo6@d3q5bb5zbccc>
 <f05cba73-6d8b-4b7b-9ebe-366fcd92a079@linaro.org>
 <lwv5pk3dtyyxgtrwxss43dyecesv7pvrzvgwacwrnztkiowfkp@jqosvhrs3jk5>
 <42b56d7d-26cc-4c10-aca2-a0a5a16b09f6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42b56d7d-26cc-4c10-aca2-a0a5a16b09f6@linaro.org>
X-Proofpoint-ORIG-GUID: PMPJ-_oChPjBQ4Xy90xfIBHkkpJGJ28g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2MCBTYWx0ZWRfXyg03XKVyfG2q YOJDyEL/kfQhfFB49s8W86ckbNH7eB8Gx0rJRZLWDg+UgiB4fDCXzdR+3Ja2U4h7+m2Vmr10/oF BXzdhErAxcfre0Bce8CDw3T9OOIa88Hs/TrhnfWBl3fGNUhUJ2g6i6SBxzctoB7Iz8+eeNnDZ/B
 tbbzjTaE7CPsBoxvxRTcVKig4GDGa13WjMBUEcB9vu1NQwoucgscAgKnBbeXiwKTflSbgUSKt/x E5btffwmfzFTLG9nVsYCa2x/R0/l2kNqniCc/x9LM+aV+LJgMF13cikf1OgkKT4LXCXbUWwoc6S nSwZaOme5IEHjbEAdjSlqdIwWhF/nOVNmft+KXNRTD+rOftvOUG5+WpwG/WcLXfECfTskqnquYB
 M5DaC3SMGj9vAE90wZ8bZbWE9BxxxabrrR6V03grF774PiC1huM9PjYpejfBWtU3E3uvFoHc
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680b4732 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=mjvOFFmTwYZxuSbJlPoA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: PMPJ-_oChPjBQ4Xy90xfIBHkkpJGJ28g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=817 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250060

On Thu, Apr 24, 2025 at 12:51:31PM +0100, Bryan O'Donoghue wrote:
> On 24/04/2025 12:32, Dmitry Baryshkov wrote:
> > On Thu, Apr 24, 2025 at 12:29:39PM +0100, Bryan O'Donoghue wrote:
> > > On 24/04/2025 11:45, Dmitry Baryshkov wrote:
> > > > > Which would then be consistent across SoCs for as long as 0p9 and 1p2 are
> > > > > the power-domains used by these PHYs.
> > > > This won't be consistent with other cases where we have a shared power
> > > > pin. For example, for PMICs we provide supply names which match pin
> > > > names rather than one-supply-per-LDO.
> > > 
> > > Yes but taking a random example from a PMIC vdd-l2-l13-l14-supply is
> > > specific to a given PMIC, so you need to name it specifically wrt its PMIC
> > > pin-name whereas csiphyX-1p2 is there for every CSIPHY we have.
> > 
> > This is fine from my POV.
> > 
> > > For example on qcom2290 there's a shared power-pin for VDD_A_CAMSS_PLL_1P8
> > > but then individual power-pins for VDD_A_CSI_0_1P2 and VDD_A_CSI_1_1P2.
> > 
> > So far so good.
> > 
> > > 
> > > If we follow the general proposal of
> > > 
> > > vdd-csiphyX-1p2-supply
> > > vdd-csiphyX-0p9-supply
> > > 
> > > in the yaml, then whether SoCs like qcm2290 share 1p8 or SoCs like sm8650,
> > > sm8450, x1e have individual 1p8 pins is up to the dtsi to decide.
> > 
> > So, what should be the behaviour if the DT defines different supplies
> > for csiphy0 and csiphy1? Would you express that constraint in DT?
> > 
> 
> You'd have that for qcm2290
> 
> yaml:
> 
> vdd-csiphy0-1p2-supply
> vdd-csiphy1-1p2-supply
> 
> vdd-csiphy0-0p8-supply
> vdd-csiphy1-0p8-supply
> 
> qcm2290-example0.dtsi
> 
> vdd-csiphy0-1p2-supply = <&vreg_1p2_ex0>; <- individual supply in PCB
> vdd-csiphy1-1p2-supply = <&vreg_1p2_ex1>; <- individual supply in PCB
> 
> vdd-csiphy0-0p8-supply = <&vreg_0p9_ex0>; <- shared pin in the SoC
> vdd-csiphy1-0p8-supply = <&vreg_0p9_ex0>; <- shared pin in the SoC

What should driver do if:

vdd-csiphy0-1p2-supply = <&vreg_1p2_ex0>; <- individual supply in PCB
vdd-csiphy1-1p2-supply = <&vreg_1p2_ex1>; <- individual supply in PCB

vdd-csiphy0-0p8-supply = <&vreg_0p9_ex0>; <- shared pin in the SoC
vdd-csiphy1-0p8-supply = <&vreg_0p9_ex1>; <- should be shared pin

I don't want to allow DT authors to make this kind of mistake.

-- 
With best wishes
Dmitry
