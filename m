Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5D619D092
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 12:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751717768; cv=none; b=BjIxkJHDqsu4opifFe3H/JdGMWSPFMX5GV+KgAia5niArt4wNFTM67SzbFIOHE8jWv2rN5Ytj2cI8u72OXFaC+2w/hTftezDCy0C3oh2tIiWpcn66+497hgFWer54UIxKouDesStPZy3unmhayvOwZNLidK+lUOK6FTX/2pmAc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751717768; c=relaxed/simple;
	bh=zXA7z4CAURglQcD0sdU5FjGHsRA0zPjWC2fjluyU4oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGvQF6pEqVZpFFy0lO9ucL4eHE8ceH7x/L7gKOfxbusacUKaQuiwh5KZiR9MuSzefYrvdtWfKuUFNnRUNnYn2UlWNfd9Mpr9mQ05YAQdLFHzpnxVKnKJsoMxBQydMa0iZvpzZFWPkeM1uCV4nlElJobjIEgm1pceWwsq0HfO1ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/qvHEkE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/qvHEkE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5658Ybqm029010
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 12:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DZskBg0KwT3zvs6x4xilopTA
	Ma1fKs/iNW6MtQwSdNc=; b=Y/qvHEkEDLVML7NMTl2jmdQOldxFH9AeSWShJCOz
	Q6pEFpd5uq/w4pnZkdY8LlxEeIbjrgbrWVCUW+tAx3WQX8iKx7Yh76FcZe7xzzrM
	j/gEe4vR0MUU76LYOU8yeD1Ci3VcRh9FAnwM8r5DYkSP4GMYLszVtMVawg+0w7r/
	QBw2yoSSYieLCkI1pX2/o/j3/CBgRSbHpibURUv5I9IMgHV1nsoO6pV84FnF2qt1
	9QdO2Cj91mE00ub0JZVitVtDcoN/VHQcZmJ2IzzpNDAIxSMAOnEhrDsoHxkOh131
	O8qfIHglvtGXDIDhjUot3NONrEGYFKBxs4T9Ti6CcSzUcg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pwbd0syr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 12:16:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3e90c3a81so128470885a.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 05:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751717763; x=1752322563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZskBg0KwT3zvs6x4xilopTAMa1fKs/iNW6MtQwSdNc=;
        b=M4ho29kpNklP56z99OBczBvbXEnB0Ql2CWCAcfn0I3RbVtsoVXPl7csPrnc5/Ni2IG
         tmSLa0gaQsRkyfMkBBvBU4VLRcj5E5nDLrmMhKSxl9zh6x704bkRfTFhdj51FGO97u8p
         tFE3qRdOeriO0Dfd6aor3AOlgbLwKCqcWoEznUkl9rXTPZgJva08dg6UMje9D/RYaiX9
         /5igPflBb+D0hUG2mi5/L2MUsrth8Yj99qmgTD0SvCSAIYWFn+iHHtHYaXswyMQUJ3nH
         TbtUIDfw12O6Xtd9N5NG6rSydsAF0C50IOdZ8uDAGl9F3IbWGiYPh+p6jHiGT3kbHWMG
         XFfg==
X-Forwarded-Encrypted: i=1; AJvYcCUePD7vO4uUW2t0w+mZIciSY4jsYIwgfThHep6aE129SjRiIVlj8PjEJQipfmP0byL32QVNZhiAJfvY4/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH5fDKIcebFBtZZenwfIy4opHFvagVD2Y2/Alue4V91nvI3RNX
	V0KQ1fw/GnXLcbYNkzZ0tCJV92WdQ7LlrmyU8s1wLP5qr/4eetz4sOjfZQYL6IrIHUm9ElB2BRH
	4HZs+67DhJteveKCxIg0wAgx80DNVsrFFBbvwlvjA54yVAWqU4XLOn9mAs87Fy7bE9eM=
X-Gm-Gg: ASbGncs9mKBdfSiUwlwOqZgwQpJfcahVPfaf/IxA5ItSGDhpEPkYAt1UGJxJKrNlvTK
	eFzCtdZCuQVGOndQ2rnLGN44bJWuy4w83CeVck/H+hJfZrg9QcbE8jpQzH2zON6L6zi+7412FRX
	I81Jal0/12YTA6ap6DfAR5Q3emBeZniMvBDKj/+AhPcTGffvuM7QGh9OpNcN3oARmjs9A3iUYLs
	tEVGd06hHvgjw84iaBlPH8P7mN59MeA2H2tW3oFmEAvTIfqzpBQJvLXPaVTsOJ0mQQmIkwvvMBQ
	y9QMyzMqHq5xdyeey2fqOkAfLvTZZgdB7i/p0LiL8PcLEfv11cEoKDM0hxX1SlZjUrkUFYwYSfD
	/tHh+PJwkUNeqglcx0ksF8aInhaTaAHK5Nbc=
X-Received: by 2002:a05:620a:1b9c:b0:7d3:8ffa:f1bc with SMTP id af79cd13be357-7d5df194ad6mr647606885a.58.1751717763484;
        Sat, 05 Jul 2025 05:16:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+gQQa0CaeGQsNRfGbtyGeCjeRcczJX70+ST7EoZUozdS8AfTgykjfKP0uSxr/FF8U1oHnzw==
X-Received: by 2002:a05:620a:1b9c:b0:7d3:8ffa:f1bc with SMTP id af79cd13be357-7d5df194ad6mr647602985a.58.1751717762891;
        Sat, 05 Jul 2025 05:16:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c8c42sm570788e87.237.2025.07.05.05.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 05:16:01 -0700 (PDT)
Date: Sat, 5 Jul 2025 15:16:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/8] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
Message-ID: <amnwwaoais7hpaoqb5zkkj6cd7aliufmeuwkhdrkyfc53ej6ut@yggpe53i2cvk>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-2-quic_pkumpatl@quicinc.com>
 <q6rbvbvejugioon6l23nmmzeue7l4bgtlaf44o3a4krj3lytjp@p3y6opl7vs25>
 <74793074-19ee-48f3-b502-8d970b9f50af@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74793074-19ee-48f3-b502-8d970b9f50af@quicinc.com>
X-Proofpoint-GUID: uI16vWPdtLMW9VMkuTkWn1dNx2Fr0zmJ
X-Proofpoint-ORIG-GUID: uI16vWPdtLMW9VMkuTkWn1dNx2Fr0zmJ
X-Authority-Analysis: v=2.4 cv=e/kGSbp/ c=1 sm=1 tr=0 ts=68691784 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NmWXvj1GLdLyyGW07i8A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA3OSBTYWx0ZWRfX2sK6hkCTwUFJ
 xx/1HdiTsiY85wmDmiT7xgdUeJeWJl6EskYg6ju1P06cBxxFfqWxiAK21I4+iz9UUcPUftwAfCC
 FVU4B7flhbGOgJLH+gkfdeEESJlPuGed/2hGenWfYegs52fo9rFCotL406iZ0PFwqqrpxoeflY+
 7JLyvGmTcyqqwyC0B5zSfpGlWDydeHalRml7/h04lzfUYE+YNQ6/8Vv7iY/9DiHPrpfhY2yLYyn
 3z6OS2VM7vNrKUXhPuv5GFJBKz3WI1i+OGgyOGIbxCWP+Vs5U4ZqGqcINtJNpDG6TXwChLKxzpl
 xkP9IkR2Ca+evR89p2CPz+5vu9Ttavqigh3kftt+vapSbj1AEByvorb7BywfTJN/U/rthUbRpmK
 QeOi9l1uLJar/lmUHrwtIexl8/3aw4Hxbh5uiEuslr89qcuLW/MYiY87tsyOtBmRjBnPhJfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050079

On Wed, Jun 25, 2025 at 12:20:39PM +0530, Prasad Kumpatla wrote:
> 
> 
> On 6/18/2025 2:15 AM, Bjorn Andersson wrote:
> > On Tue, May 27, 2025 at 04:42:20PM +0530, Prasad Kumpatla wrote:
> > > From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> > > 
> > > Add GPR(Generic Pack router) node along with
> > > APM(Audio Process Manager) and PRM(Proxy resource
> > > Manager) audio services.
> > > 
> > 
> > This should talk about the choice of adding a new "-audioreach.dtsi"
> > file, and should cover why it wouldn't make more sense to add the
> > opposite of this change in sc7180-trogdor.dtsi.
> 
> Ack
> 
> > 
> > > Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> > > Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> > > Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > ---
> > >   .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 53 +++++++++++++++++++
> > >   arch/arm64/boot/dts/qcom/sc7280.dtsi          |  2 +-
> > >   2 files changed, 54 insertions(+), 1 deletion(-)
> > >   create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> > > new file mode 100644
> > > index 000000000000..29d4a6a2db26
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> > > @@ -0,0 +1,53 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > 
> > We can be more permissive than that, please use BSD-3-Clause.
> 
> Ack
> 
> > 
> > > +/*
> > > + * qcs6490 device tree source for Audioreach Solution.
> > > + * This file will handle the common audio device tree nodes.
> > 
> > "Common audio device tree nodes", but not those audio device tree nodes
> > that are already specified in sc7180.dtsi...
> 
> Ack
> 
> > 
> > > + *
> > > + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> > > + */
> > > +
> > > +#include <dt-bindings/clock/qcom,lpass-sc7280.h>
> > > +#include <dt-bindings/soc/qcom,gpr.h>
> > > +#include <dt-bindings/sound/qcom,q6afe.h>
> > > +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> > > +
> > > +&remoteproc_adsp_glink {
> > > +	/delete-node/ apr;
> > > +
> > > +	gpr {
> > 
> > Glink only consider available (status = "okay") nodes, so if there's a
> > even spread across AudioReach and not, we could even move this to
> > sc7180.dtsi and mark both status = "disabled", and have the appropriate
> > one enabled for each board.
> 
> I am trying to add apr and gpr both the nodes under glink-edge, but yaml not
> allowing to add both the nodes.
> 
> Facing yaml errors, it's accepting apr (or) gpr only one subnode.

It should be fine to add both nodes as disabled and select corresponding
nodes only when it is actually implemented by the platform.

> 
> Please find the error logs for reference.
> 
-- 
With best wishes
Dmitry
