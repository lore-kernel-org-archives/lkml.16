Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464E6211472
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491555; cv=none; b=hOQyzP0mQ9SFlXtPBGBFGLoHSrcpAlARTCT7HFoKOhgSosKWR6z6lZFmzXqFrbPPJXN7or/4c/AUYfEr9U/bFaB784YemW6JirH/wYyw4Ld3Kp0fqplALeRD3kLTXOnsyZZwmWBc/M8ejO+Hw7zGRgtRIYwTaRtDFBIACdNplqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491555; c=relaxed/simple;
	bh=PGXPJri6Cw6siaeSinOaARRSx2I/HYewhIvfzmeUnSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oji88wKRWmDat+e6xxGPRU0VqMWU/L9wvkj1vr0jsXzXqVvLdNoWxbGXX2tOmxKBZtWDE/0WyLXUtxxTcgMrkD534ilQXIgdPcFTxY5hJEAsJFwFcfozysgWTQe9VdwWzUUDPq3Li3yEFH4dpQPlf09UgI62oqKzqvJd11qRj78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pmIPMZhB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pmIPMZhB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAdM7i013087
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YTvMgSnUIIGLk/Fpg/tiBLoR
	7OymWdRd8yJc8ktCLRg=; b=pmIPMZhBX/VI7UiQN2DS72PS85z5qkr8rP6iNalN
	HPEncBXMwLR9N86aNrbsSrZr2OHdWNhWQk/JDFcATDtqSKn28URKTfVM9KhpcfhR
	rWJNwa5C3/WG2IC8UOHxomfZD8TlW3DZjbfaFp4R8exsTRJHHAhNh9Ol9KVL1wJR
	ZDzf2ib8ztXLTB1Fn7IJHYeomWd9vVPXGask/yhk14+Q9i1yH/Q1T8igdSAxVU7H
	GD/8+ktSIUQPM71Vs70tmx0jifeuaLLW06GUGuwOnTlm8DdvKGr8gtRAPkqleWfz
	OHMBI39GNYqtgjfuj37+wlcpj9hzbdKtVVzAT4GOkmNO7Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2d8vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:45:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8feffbe08so21917216d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491537; x=1746096337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTvMgSnUIIGLk/Fpg/tiBLoR7OymWdRd8yJc8ktCLRg=;
        b=eJPkVMrEqD4/wip6Duvhm+/znUEgICJzz5bHJBdsoV1AdlNpv2dDPyxBBgf8Q9D59x
         BMkuWoaxgdKAVIUarEkqoiw24I2t4ffHMVIe15G8uyGbQpnk6d50us6KC+nX2Rx9j2p8
         8dvtXm44RYnt3jyS6MnTc8uLxw5EMPyLOdYy9kCYg0zF83o7beuhL5zjgZfpCJiYbFv3
         /zLxcHl+0rKXBhwimpLB5BK3Ps8KldBa3ZfGZjUQu8FlY499ctfLB7GTHxdxODvUQWfD
         mzL6fi/xdp/3e1lfiiXrdjU9Y39Usn/pnjkTDZSayxFg4h1eGXyIJWA4gQNwYhY8udoR
         BFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhdKvACdTHnQQCds02jvhh+lPlNxMqYMi/vEsp+IKm/VnshGkOCy5TIbRI+NxhYRBIB+xtjebnjJNJ1RA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWW3DH0Bd7pMsVkutCPhC4JesAkcyJbpDPTlXITcmapGf+F0gR
	pZVAWtJ9HmS5dXU5fhwnAUoyByJLZwGzpmpDYRyEXzpmNubwle+5+IPIfdOll5DeoYyskR/i3DG
	UJoEUGoi50o7O/9x8aiO7LDjhbr6GbMn0YbZyH3oELQU7JJb4PziKFr+M3oONfno=
X-Gm-Gg: ASbGncvfBpxdeQw6wiNR/RbOtMKjnbbkfjkMAxhjpEVnGSnhB30XdDXMn9DlladqZjT
	zITBMZDfRNAkyUbjntrMNM6aTkhyKmW6BHd439T+/ZWWWwbtIJm+n74i7c6NkysSpC55CuIMDdW
	C2UE9Q7FhWN5wh/wMRxutRo+Mp+bGaE/F2MhASg/Bx5ZvoTXobbvXWp3YdlaC+kKJZOgWWKgzlm
	x8MiZRKCdvrgrnva7TQ2xubVLdhBma6uViLBOsdNzVTmEXWUlGhIOnLIEQqGZAvHdYVgMmzb1Pq
	9uMROLG9GHpThl54b4rKNvliaF0RX6nxSQsj5A5UKLltX7STN1mBOjfvdtpcxPAWPYW2I3cnnAE
	=
X-Received: by 2002:a05:6214:4103:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6f4bfbf09c4mr34154236d6.22.1745491537222;
        Thu, 24 Apr 2025 03:45:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW9ALRiFj0PWw6i0JiIe2IjPxWzjJGDX1PP0wKX7qV2MJPeYhrJs/Xxya61v7OTQE/lz454g==
X-Received: by 2002:a05:6214:4103:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6f4bfbf09c4mr34153766d6.22.1745491536843;
        Thu, 24 Apr 2025 03:45:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bc48sm189292e87.88.2025.04.24.03.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:45:36 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:45:34 +0300
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
Message-ID: <krofzevprczeuptn6yfj4n656qsw52s52c7cgiwotidxmi2xo6@d3q5bb5zbccc>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
X-Proofpoint-GUID: xHyJLULcsOldmv6kofACFU3vaKFumAWv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3MiBTYWx0ZWRfX0bkEGGWECpCF oc29ZxTUUfs4XhQ+co0dTGuAivIEHfTTDQnDaRncLMrvqv0DYGN8iTfYPRe9gKCggzWKywlpof0 gfvE0UHoruBp7p8r43I79Ki9JTKMci6lflsBcDX3bl9Pxecv2L46dN5hgSTuTnDP70tltmrhwgF
 vrcOxp/UXOqQ4Cw+B7ZqKbdOql709wUfODrNbB9j5qnvb7uFt40YabAnRAhA1UmhFe0qrHN/w8w kXB912QMh1wLU8wmRtWDgA8e/K5cTrJoXHMhOqZixIRi+Bi6x5EzkpCNRVVbUjtLL73LhkrcUao uJYUXMc9an3Si+j9BtqHg9WvPtCF9XRQUFuidHULUmq0FibFZ0LxNeGySqthuu0Y/5F5TMvaJ5u
 qFCrffZa/TAuV5hOBmupV8U0wO1SHCg4SjQfhrkTak0ClMWYuVn4j47Du3lV4cgv86SmUUa4
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680a1661 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=w3QZEHyxT3hpLgro1OoA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xHyJLULcsOldmv6kofACFU3vaKFumAWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240072

On Thu, Apr 24, 2025 at 11:17:13AM +0100, Bryan O'Donoghue wrote:
> On 24/04/2025 11:07, Krzysztof Kozlowski wrote:
> > On 24/04/2025 11:34, Bryan O'Donoghue wrote:
> > > On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
> > > > > +  vdd-csiphy-0p8-supply:
> > > > Same comment as other series on the lists - this is wrong name. There
> > > > are no pins named like this and all existing bindings use different name.
> > > 
> > > The existing bindings are unfortunately not granular enough.
> > > 
> > > I'll post s series to capture pin-names per the SoC pinout shortly.
> > How are the pins/supplies actually called?
> > 
> > Best regards,
> > Krzysztof
> 
> I don't think strictly algning to pin-names is what we want.
> 
> Here are the input pins
> 
> VDD_A_CSI_0_1_1P2
> VDD_A_CSI_2_4_1P2
> VDD_A_CSI_0_1_0P9
> VDD_A_CSI_2_4_0P9
> 
> I think the right way to represent this
> 
> yaml:
> csiphy0-1p2-supply
> csiphy1-1p2-supply
> csiphy2-1p2-supply
> csiphy3-1p2-supply
> 
> dts:
> 
> vdd-csiphy0-0p9-supply = <&vreg_l2c_0p8>;
> vdd-csiphy1-0p9-supply = <&vreg_l2c_0p8>;
> 
> etc
> 
> vdda-csiphy0-1p2-supply = <&vreg_l1c_1p2>;
> 
> because that captures the fact we could have separate lines for each phy,
> names it generically and then leaves it up to the dts implementation to
> represent what actually happened on the PCB.
> 
> That would also work for qcm2290 and sm8650.
> 
> https://lore.kernel.org/linux-arm-msm/20250423221954.1926453-2-vladimir.zapolskiy@linaro.org/
> 
> So for sm8650 instead of
> 
> +  vdda-csi01-0p9-supply:
> +
> +  vdda-csi24-0p9-supply:
> +
> +  vdda-csi35-0p9-supply:
> +
> +  vdda-csi01-1p2-supply:
> +
> +  vdda-csi24-1p2-supply:
> +
> +  vdda-csi35-1p2-supply:
> 
> you would have
> 
> +  vdda-csiphy0-0p9-supply:
> +
> +  vdda-csiphy1-0p9-supply:
> 
> +  vdda-csiphy0-1p2-supply:
> +
> +  vdda-csiphy1-1p2-supply:
> 
> Which would then be consistent across SoCs for as long as 0p9 and 1p2 are
> the power-domains used by these PHYs.

This won't be consistent with other cases where we have a shared power
pin. For example, for PMICs we provide supply names which match pin
names rather than one-supply-per-LDO.

-- 
With best wishes
Dmitry
