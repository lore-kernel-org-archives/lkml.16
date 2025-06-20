Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71226233155
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455266; cv=none; b=DVhySRq/R3RHKFcqMzUWTnVOlyMHmS0HdaGv466l4bA3tdnqoCURY8JeLkNCvFoC0XqXLazEDHJJhCl9racHuxEBEQJkH56WkW2JHYovFu+FlVOzh3ChAyZ3pfZGy5Nuh/j2exklxCfnpsNV7WhakkKSyYAIQt15LlTb48A2AKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455266; c=relaxed/simple;
	bh=ddeEOwDx9KIEkwLrqjkmYZXL0t1PupX616M914w3kqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6SR0CATkqzYW7Sd+ws8CZOIu4cvrIVDf4xWyvV0aZaJSvGMxBrIFmPZ1GS3WHiIlXfVHDCHCkxjNhe2t9K/YhOIV8O/FTGOW8DQ8g2Cwao66q1uPL8VjXW0HT1Vf/aAP8FUry4YoDuCuJG46bHVFFIDMtwt5YB0urHJDUHKU5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYjD9sYs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYjD9sYs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KGVapM031102
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I5eUMVemtx+WOtxG7ifeKcbV
	DLFe5coNfGzblu/bS8Y=; b=pYjD9sYs9RyZ3OEacXtIZo34s/uwKLSE7os3otJL
	XywyPBWBdd44hpHxqtKSefoK6kfj3ndV3LfdD55+Ugvu3Y2ngdyxceqM6UP05c+y
	gv0XI3bNjA5v3W689kVZL2VVDr0aGdCa3lnpJmA0OweikRXYLkje5x9HUp0GZBtp
	P4krv3KP1jrlMD/imeN24LgPuRKTQMFksF+nevf/wc8od6jl+in2FoOLExpqPZr6
	Q56NKsB9U6gz22H5fi3c8CfmS8Mnd0qjqm1IeK2QVbCXGbHRm/vG58QeACT0/fEu
	ETvssLpIkHjkVocbU8B1ObByruqcBjxBnfrcxdp1V62OMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47db82gkxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:34:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3e90c3a81so192557885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750455262; x=1751060062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5eUMVemtx+WOtxG7ifeKcbVDLFe5coNfGzblu/bS8Y=;
        b=t9xZIVMBTxRisQxQQFhQV/ad+5SU+2Wvb9GCgrK1CUtBVCgpfgYkGJQcYm2x3TTvjg
         Ed6TJ72Q0+EkwKtcHTYdc/OzhrRdolqvy5VS4HmZ2qMksDBS71Hx1eqrVz1ptG5JiH5U
         WDvsh6ap1zFaY+uVrI+NYX7GRcaysS0A1d4bPdfh6wSPkRsps7jgl+Y/JSo7rgaw57Ew
         QJBCtmJKNozPFC0A/LXK5cyvrTlgHDySGRCVrRYIZHYPAt3+mUhij3iE08agr+IM05qt
         1H+3EvTJrsTsL+E33DzEYh81Q5eazYPMqB+x/nnHKej/Fjx0zaLm1llCcQeUkoz66RC2
         vcpA==
X-Forwarded-Encrypted: i=1; AJvYcCUOJhOl3E+ItKgDFVqLhTPH2YtZV0DXaIKHKgnaFhfooyPHY/YoMFzI3Fo8sM2hF+5L6oz8iY8MA+o8WiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/QLoIxZXtnmalL+gOo9Is0D4xERbEml7Noed2HBJ29179uJ1s
	DaSEdJF/VUJLDe9Tg+IE8Ocjb3pjrEWjwBmXvbIct9qd7jDSrvKEhpSZAlPCt+GdgLdThU+jJtr
	DEjZ35III7zTrEMaFuQ7Bo4yY39tv2FXfjXL5YvA0HambnMJKUdUpljWAinquaR3qHbxWgbPGoe
	O8iQ==
X-Gm-Gg: ASbGncsC5RK/Y7ZnXhjswSZ+LINpbpQdXrJgE9iPMiDfgK7GCVUZBaLFnksn0OHpZwC
	bNo2X6rAJoBy0M/0tR/Cm5binCvCSHUoSNG3IaiH4WlqKEfok0y5KjvKlLUkturlg7iieXCiIpY
	TPshPpVA4XKrBrN6FZhjfTZ54cTDMLO46ptSlZ230F5lov1iffvR1POpATu863iD27rlmYDqQh1
	KhqEcg7/6N/Ei0oFiQS4sxh7yjBG5uCWzVbNveUvgioS/sejKp/uhX7yE2uwDWMPvDeq/Xh/JPe
	bC+j5SbDFZG/a+mVaadMf49ypGBRe1nbbvp71ZIm48hoiKyzUYmVjSDl2yNbLhyR0YrcRyHQ7OQ
	pBpkO/6xKZQjCKIK89T/30z02IqVtGyZncRY=
X-Received: by 2002:a05:620a:6187:b0:7d0:984a:d1b4 with SMTP id af79cd13be357-7d3f98d99b4mr612143685a.17.1750455261813;
        Fri, 20 Jun 2025 14:34:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQgOg+RQxEGOUR5Axw5ElARrL+47mFou5bAIbvY41SUovy9rbjpZJh1+YdUa1r9WfF2UcAeQ==
X-Received: by 2002:a05:620a:6187:b0:7d0:984a:d1b4 with SMTP id af79cd13be357-7d3f98d99b4mr612140885a.17.1750455261374;
        Fri, 20 Jun 2025 14:34:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cae2sm425057e87.59.2025.06.20.14.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:34:19 -0700 (PDT)
Date: Sat, 21 Jun 2025 00:34:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,sm8450-videocc: Add
 minItems property
Message-ID: <aswg6zjmyi4pcx75uzfj5byadkx5gof2yfpjcu7fspbuniatrg@dy52pmcrgnoc>
References: <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-0-02e83aeba280@quicinc.com>
 <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-1-02e83aeba280@quicinc.com>
 <4657c6d8-8454-478a-aac3-114c6194b72e@linaro.org>
 <5ed72663-da54-46a4-8f44-1ceda4a7d0d9@quicinc.com>
 <6068badd-8d33-4660-aef8-81de15d9b566@linaro.org>
 <ffe32102-cc55-4f86-b945-ae77a4e163bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffe32102-cc55-4f86-b945-ae77a4e163bd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: UdjOmUcdxsuE0q-TFZuXkUK1yvX-bA6-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDE0OSBTYWx0ZWRfX9eToMdp472Ey
 dGGFIa3k8UwwLLuEXtthNY1KzPptjyK3h58cci+Mww+qJu9kZ843ICVKATE1c8hzp57djIwf7Uf
 7F41R9dnDv5GaB5y+FzOow6/ntiStAIgtPZqoOiNbT12X+t4e+Z81DE72FLpViBPDyWwdpP1TiF
 XfInLjcNkF+KbkamNAuhs+fLIOCr/WhATIHlmm00Kjms+pDkTJhb/UJlBck+ZeE6sFGcRsT6iQe
 RsRV0gJQJozibxadwGd4dIGkItEGkihVMJ0BZfeQIjzVOxOke7FCyoTswK5HZuhGatDA4QTKh7Y
 gEwZUxx/wj/InE4dEwsM0Vz1GOFiS3MviJ0HuzexA2pNbvlEPK6oSaoVTY7IFF6isnWBR6o3dwm
 8/Qy5NRhttH+Y9LxFzigBToSx84bGkssEgXzttyBV4qZpA1m1le3zbuiuLzX/0IyQMJlwdnZ
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=6855d3df cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=SDRi_Ghe60FVfvUD7c8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: UdjOmUcdxsuE0q-TFZuXkUK1yvX-bA6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200149

On Fri, Jun 20, 2025 at 07:39:06PM +0200, Konrad Dybcio wrote:
> On 6/20/25 7:56 AM, Krzysztof Kozlowski wrote:
> > On 19/06/2025 12:20, Jagadeesh Kona wrote:
> >>
> >>
> >> On 6/18/2025 11:56 AM, Krzysztof Kozlowski wrote:
> >>> On 17/06/2025 21:07, Jagadeesh Kona wrote:
> >>>> Add minItems as 1 for power-domains and required-opps properties
> >>>> to allow this binding to be compatible with both single and multiple
> >>>> power domains.
> >>>
> >>> This is your hardware, so you know how it works thus I expect here
> >>> arguments why this is correct from the hardware point of view. Without
> >>> this, it is impossible to judge whether this is a correct change.
> >>>
> >>> If I overlook this now, it will be used in discussions by other qcom
> >>> engineers, so unfortunately you see, you need to prepare perfect commits
> >>> now...
> >>>
> >>
> >> These clk controllers mainly require MMCX power domain to be enabled to access
> >> the clock registers. But to configure the cam & video PLLs in probe, an additional
> >> MXC power domain also needs to be enabled.
> > 
> > 
> > Then your patch is not correct. Anyway, you should explain the hardware
> > in commit msg, why this domain is optional in the hardware.
> > 
> >>
> >> Since the initial DTS changes only added MMCX power domain, this change is required
> >> to be backward compatible with older DTS and avoid ABI breakage as discussed in below
> >> thread.
> > 
> > 
> > So you send incorrect hardware description allowing something which will
> > not work? Or how exactly?
> 
> So I think there's a mistake in understanding the backwards compatibility
> paradigm here.
> 
> There exists a single, objectively correct and represented in hardware,
> list of required power-domains and the commit that caused the schema
> validation errors was essentially "align YAML with reality" which should
> be coupled with an immediate DT update to match and we forget about the
> incomplete past

I'd second that. Let's make sure that the _driver_ works with old DT.
But we don't have to support old DT in schema.

-- 
With best wishes
Dmitry
