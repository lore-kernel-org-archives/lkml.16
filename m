Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AB924DD02
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749395373; cv=none; b=Lcqn7KW5pduOjli9iCLkcpU1JTWngRUo5tB6jgAOIeLCUzN3YMPU57RwP2jMYZc5LSOf3tifUpGaHBNJQy1AQWX1QiEXUYjcF1n/i6OZsiYFm8ZBkCgPkPyfgEpl6EN01ATK2kBeqjJp9nQYERZD1zvXs3AI+lab/kgGj1KQsYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749395373; c=relaxed/simple;
	bh=7um7X5NeZjHikLWzlty4JC7AasspTawyi987o6ubjWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9NZq4IQEHMnr2LDGlGnJ4PqUlyz7eVKZStSjhOAd/1vXdGsbYgGE+JJbQT3h60+NTmxbQHg7OZpWdMHHzkbu7MAkQ/vUIifU7eBwN58RPX310msGDoitIUW9XZW1z/HMCNJVcQyeqI40SSnrlvq6xlfkEv9njz0RPY4iB3hIhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QiCoVzmt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiCoVzmt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558C0Pva007932
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 15:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZg6uov4M3COUU/cAjeod0ONVmFRFP7In1KT2LtVH5c=; b=QiCoVzmtOQGUjWRl
	KvbzAgMg4OkzYlkppjTxMBmsoTwcFjEqOxxluJY9kzVfEFAcS4/XbtlQn2wnzEdX
	2FPbyv4k4aOhQrqm7Xhu4rVVxpkXYrFHSGEhhPYTTOA2p8Gh11AVC0g7gwa9u7Ey
	jGDD/efgrW63QJA75+mFclI+gGIO0lJGPqbU0FyHEzSHmQxGxrPT0gObyfyMEkT8
	Ny0ORRN4suBnqVna6TaKiIua24aPLUBNyFa+gs2S2UzyMz7/Fz182/YDV+xVPYlz
	J0IkxAJF2qrT0J4ity+mIEetpb8RhyVsKLjBVqoNBoDNy+Pyi66IX2xs8OuRZI3R
	VhzrEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpjy5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 15:09:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so706594285a.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 08:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749395370; x=1750000170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZg6uov4M3COUU/cAjeod0ONVmFRFP7In1KT2LtVH5c=;
        b=uCXoo1VM4rjn5cAu6Q/DwKIZCD4GdnX84m6551RM0oYIDjxfW9o24qi0rJ8w7EtVn6
         oKxi6h+5GzVI3vgUGO2H8eDf+Stnkpld5drsi8RsTXJWqomduq9Y1qPTRLOKhiDFkWnj
         R9/38MmhMoY5VAW8y48L9U7cmQez64WX8kWWj+O9ThppyLhaHbi7N0fNe0uQGjmracno
         yMlZHV7KcaPDJdR0xniiTaiGffm0rdXnToDzpIcVrPywuxHN8dM03jHU2Ih++KiMpZyx
         IYCsZEwaH1614X/xmRc6VS8ev4d07Zx2VUCcjfcLX+5dVmkgJqaX1qvd7ej/d/Oz6XV/
         MqKg==
X-Forwarded-Encrypted: i=1; AJvYcCVJjfS4iEmfRynvBTZnm2sPtxWmhQMfYjgRkAvDUVHJJodPXGm8j1SliRJS35ZxKwoYJc1aTJvg1W9qZFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YztmVEQaD3m3jTNhkjyTjL9wHiN0jOdwmy9pk3V8imMcIONop4V
	FmlgV1wzOeAWp838QaAvGMJ03P30WfiCBkGiKdJnzlUxEg38CfrwcRZJSUDEa9GWzGTJBmXfPar
	coILJIpl4GggpZtx1YF87VI3iCRMqt1psR4Atq0/u69OC6CLR6GiMLCltLQEajxmCdUE=
X-Gm-Gg: ASbGncuM1Tt/p0OuXouIcO84WHCreUhGiyfuC11lyS6z7lGLmX8It0ASRE4xuug/NaY
	3OaDRFE8BTP/8uAS0paLTeYcOFNQ8MktQDAfLjHduWZr9Pdwau5zH12EDHosXqUknCsdLlC6az6
	oBHZuYHMxaxjDPxuABwSByTTmIPloHq+f3rnRO3eWT3LMSd7tqFI5pOFEtpPOMdYvdnYtedg9nj
	sALoIsS/CyqVl0/S4rF1M+IZ+MRPsZmOAHIwTrUJFq/tQJ1L7QjS2S1acXBMmdwYZBQ0TSkDxsS
	mMvT7xKWBu54YhJPtB7bAf1KG0KDymoLQZsgqQvv2meHgv4a1oEvNp+GDUUvvQhkZ1jxzkV0Cnk
	=
X-Received: by 2002:a05:620a:454a:b0:7ce:b9ed:24dc with SMTP id af79cd13be357-7d22986ec74mr1503742585a.23.1749395369645;
        Sun, 08 Jun 2025 08:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWojoQQKm6zmBmTfsN6DQaVIzipmhF3tAmQHC4y9/wG04I+Q+kLtPPteL2vns5BpTi9vfIOw==
X-Received: by 2002:a05:620a:454a:b0:7ce:b9ed:24dc with SMTP id af79cd13be357-7d22986ec74mr1503737685a.23.1749395369172;
        Sun, 08 Jun 2025 08:09:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722289sm792024e87.117.2025.06.08.08.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 08:09:28 -0700 (PDT)
Date: Sun, 8 Jun 2025 18:09:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
Message-ID: <rwjc7zkitubi6cdre5a7owmo76nopavkgifvvn6yq2mv2hrth4@bhwbodchd2gx>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
 <wayrour74vlli27xrtxi2ff2v7q7ye2yknmk2mjpur5ry5gruv@hhh2mdb6lw2i>
 <CACSVV03X5EyAb5yCPDn1ot8vOFV_dKG7f6+yO5t9srr31AiUKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV03X5EyAb5yCPDn1ot8vOFV_dKG7f6+yO5t9srr31AiUKw@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6845a7ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=NEwny6fml6yhTjldVekA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyMCBTYWx0ZWRfX7LYyOcV2anZt
 8vAwQLgawcjm7fmRvTWVoEEreyJu/kHQUiKPjzQmt+A1Z4od799/Q/uz8hrzk+nMPd//pkV2zlr
 LzLXFoEE7YvNOAydEBsIm4erKgM0YqefMdnQ5cIitLBitANA/5vohKHlpHMbZWO66G7UnIGCb3K
 UO+4Y58hSw50hOUC9jNuKaZRW+8h571+uVhbBvUpJ+6Tof9HkvpuxH86be2LuhGFREl9U3EuD6j
 wdVHgxq7TLh+JBm+DTQXJYYbNj8Eqp3qlCYShb/WOyuAkAJEM5C62bAAOiZlazLEWiY7lfEX+tJ
 8jJOBFUzC5OXlvL/huwe4hKMhiUUde0ArHUoW5P7nz36MZCYHrVHBraYaUKULHBBbuj86xhXnaW
 b58tebBLnLYHoAqUfCjg9K5OkxIxkLQEIywMBppc+iqgIVHCm1OJLBgnGAQJvOw9V/4xcwkb
X-Proofpoint-GUID: XYzKFr5s_nZ7UdIGF6XiuMUENsceklHU
X-Proofpoint-ORIG-GUID: XYzKFr5s_nZ7UdIGF6XiuMUENsceklHU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080120

On Sun, Jun 08, 2025 at 07:10:11AM -0700, Rob Clark wrote:
> On Sat, Jun 7, 2025 at 1:17 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Jun 07, 2025 at 07:45:01PM +0530, Akhil P Oommen wrote:
> > > X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> > > version of Adreno X1-85 GPU. Describe this new GPU and also add
> > > the secure gpu firmware path that should used for X1P42100 CRD.
> > >
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
> > >  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
> > >  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
> > >  3 files changed, 131 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > index a8eb4c5fe99fe6dd49af200a738b6476d87279b2..558d7d387d7710770244fcc901f461384dd9b0d4 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > @@ -8245,6 +8245,13 @@ sbsa_watchdog: watchdog@1c840000 {
> > >                       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> > >               };
> > >
> > > +             qfprom: efuse@221c8000 {
> > > +                     compatible = "qcom,x1e80100-qfprom", "qcom,qfprom";
> > > +                     reg = <0 0x221c8000 0 0x1000>;
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <1>;
> > > +             };
> > > +
> > >               pmu@24091000 {
> > >                       compatible = "qcom,x1e80100-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
> > >                       reg = <0 0x24091000 0 0x1000>;
> > > diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > > index cf07860a63e97c388909fb5721ae7b9729b6c586..cf999c2cf8d4e0af83078253fd39ece3a0c26a49 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > > +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > > @@ -15,3 +15,7 @@ / {
> > >       model = "Qualcomm Technologies, Inc. X1P42100 CRD";
> > >       compatible = "qcom,x1p42100-crd", "qcom,x1p42100";
> > >  };
> > > +
> > > +&gpu_zap_shader {
> > > +     firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
> > > +};
> > > diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > > index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..5ed461ed5cca271d43647888aa6eacac3de2ac9d 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > > @@ -17,15 +17,134 @@
> > >  /delete-node/ &cpu_pd9;
> > >  /delete-node/ &cpu_pd10;
> > >  /delete-node/ &cpu_pd11;
> > > +/delete-node/ &gpu_opp_table;
> > >  /delete-node/ &pcie3_phy;
> > >
> > >  &gcc {
> > >       compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
> > >  };
> > >
> > > -/* The GPU is physically different and will be brought up later */
> > > +&gmu {
> > > +     /delete-property/ compatible;
> > > +     compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
> > > +};
> > > +
> > > +&qfprom {
> > > +     gpu_speed_bin: gpu_speed_bin@119 {
> > > +             reg = <0x119 0x2>;
> > > +             bits = <7 9>;
> > > +     };
> > > +};
> > > +
> > >  &gpu {
> > >       /delete-property/ compatible;
> >
> > I think, you can drop this line.
> >
> > > +
> > > +     compatible = "qcom,adreno-43030c00", "qcom,adreno";
> > > +
> > > +     nvmem-cells = <&gpu_speed_bin>;
> > > +     nvmem-cell-names = "speed_bin";
> > > +
> > > +     gpu_opp_table: opp-table {
> > > +             compatible = "operating-points-v2-adreno", "operating-points-v2";
> > > +
> > > +             opp-1400000000 {
> > > +                     opp-hz = /bits/ 64 <1400000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
> > > +                     opp-peak-kBps = <16500000>;
> > > +                     qcom,opp-acd-level = <0xa8295ffd>;
> > > +                     opp-supported-hw = <0x3>;
> > > +             };
> > > +
> > > +             opp-1250000000 {
> > > +                     opp-hz = /bits/ 64 <1250000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
> > > +                     opp-peak-kBps = <16500000>;
> > > +                     qcom,opp-acd-level = <0x882a5ffd>;
> > > +                     opp-supported-hw = <0x7>;
> > > +             };
> > > +
> > > +             opp-1107000000 {
> > > +                     opp-hz = /bits/ 64 <1107000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> > > +                     opp-peak-kBps = <16500000>;
> > > +                     qcom,opp-acd-level = <0x882a5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-1014000000 {
> > > +                     opp-hz = /bits/ 64 <1014000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> > > +                     opp-peak-kBps = <14398438>;
> > > +                     qcom,opp-acd-level = <0xa82a5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-940000000 {
> > > +                     opp-hz = /bits/ 64 <940000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> > > +                     opp-peak-kBps = <14398438>;
> > > +                     qcom,opp-acd-level = <0xa82a5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-825000000 {
> > > +                     opp-hz = /bits/ 64 <825000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> > > +                     opp-peak-kBps = <12449219>;
> > > +                     qcom,opp-acd-level = <0x882b5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-720000000 {
> > > +                     opp-hz = /bits/ 64 <720000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> > > +                     opp-peak-kBps = <10687500>;
> > > +                     qcom,opp-acd-level = <0xa82c5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-666000000-0 {
> > > +                     opp-hz = /bits/ 64 <666000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > > +                     opp-peak-kBps = <8171875>;
> > > +                     qcom,opp-acd-level = <0xa82d5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             /* Only applicable for SKUs which has 666Mhz as Fmax */
> > > +             opp-666000000-1 {
> > > +                     opp-hz = /bits/ 64 <666000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > > +                     opp-peak-kBps = <16500000>;
> >
> > This looks odd, why is it so high?
> 
> You want max bandwidth on max opp

Yes, but can it actually sustain / provide this BW?

-- 
With best wishes
Dmitry
