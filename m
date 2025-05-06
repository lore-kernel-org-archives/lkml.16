Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5207A264620
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534504; cv=none; b=g/B8NQmgRcPQidLsns4w26Z2kaJy1IlJF6Uec0sd4n8+PO/daVNcpUcvXb1of4fQgVd7J9Q56nP17KZTGzcRw9fu29cbTcDZXwkCL9oJTB6TWZTGhGGEgNQkgPkAiFRyYVExDMr10cby2ZNmamc4QuwnqDuAFfusyFk1E4JXRSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534504; c=relaxed/simple;
	bh=GwHJfPYBAa02n8mtCLeKpWVcI6hgBB3uCvSSN9RyeAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpFXfzrgo/a0XnYO8hgNPcw7u1pZTqbsekkTCqfI3LM4ImWcce8wblcw9V0iLb8w7JPubT8vMgB3fGzlh00lWAWjJKPr0W9f5SLyPxx9opkk9NmujAHx5Mbd3d1kCiUzK4zp6hYIdXGLPD4AofbtcOm6w2ltMpKoev/Z/P17sCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9GjvRVV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9GjvRVV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468nowv014062
	for <linux-kernel@vger.kernel.org>; Tue, 6 May 2025 12:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pMr0pQfkZDzwyRYDfelKCIMW
	JikVyJ1ChOSk0SMsQ3g=; b=h9GjvRVVU3uo5NAzoCkH1M4/efx7Le5pKqoBAWlk
	KHjiHTu62y0vboD821I/hC6aTrCPPvBR53r38EklDXJxsYmfH6k7WI97CXM2Uk4n
	tNPKARH6t5lRAR6WR4LBMMfe37auRuXRMbzDL0xq3l+W0fWW1/h+FLfWIVs8c9kg
	hmuegPyawh6/XZQ2VG6tWpMByv8cjzRevFOkCkfTQdhIq6FeGmZOyMvFbuPS6krR
	eq8wdEoyJQ9F0xf70/HBpQ3qezI6DNksuxvP07GJXUXKCweCD5AKpM8SEhVW6f9q
	MlA+fn2Z0NiJHl1tBwqrghWal8q9ilBgFOoifs+Zu3uhSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u428wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 12:28:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47b36edcdb1so112029401cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 05:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746534500; x=1747139300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMr0pQfkZDzwyRYDfelKCIMWJikVyJ1ChOSk0SMsQ3g=;
        b=dI8eAQ5f3dNTc+2XYVOQJGZ8EBiMt26dhZrXNx0L9p5JaPtQUjXAm5JdTkUD71YSXD
         gOedix99PIgr9faJXKH56MGYBb/KAwsHPixEtEoOTAnEvVQN7QYUQ4qkCz4AML+H2r5M
         ycfBAcwKdQv8GtiHprd2OUZqzTPE3QyuvAqiZ5SPq0KRkhReEgfr7FXd9OGln380a7W9
         KRw7x7UihIQ+PMQiHLjO4nPKPTyC8MESe1QCQoRbNPJy4yLk3+K2Rksr4Ib+VAsMw5xw
         ofz7OsT6eg1CMa+tdsY94izhpk47Dd6qSWXJza4vFBMOyjfzrIm5EnlAW1Fms2DpDmsE
         04Lg==
X-Forwarded-Encrypted: i=1; AJvYcCW+xaMBWlUDXKXfwiXtJrs60JzXL0Y1+huPgKRQOkDKLETgNGYO35IejaaZiB0/W4Vp6xQcnQzPBvqe+wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLxp28udrEz5xq4bzglvWDodeIiJLFAnSwIK6loi7AXvoLaxvd
	fozQtO1qhmPQycOkl4T7qrFWG50AVRyQvTTwNrJHZMXpfHZakce1qz59VpeM71lHH2BPC9ucNC3
	LquPc4vevKUDbMNngwNnkqWv3WOib4MThzgmCdE4t++IGx5GSJO3H5RIzK9zQgKw=
X-Gm-Gg: ASbGncssJ1PD4afLzBX6/FW9xKr6j0l68nzHKqfIUvag89Cm5mHbUraDHU3bqUVWslV
	7gL7WJGq1dHp9if9eZ0gijRSEPCFPmbz/Z1tCx0FK3UMHzIcAzwLaZQ4/8CzIfxQOdgXMd+2GLU
	RXIWT7MgJe9yNNdCcKvwVI7CNdEcLWaA0jJ0dM7ZerCVgCeEUhExJlRJ3mAd0TlLxQYMNePbq5z
	UkN7QRlMzpENxNQEJyfx2WDoo0jGhTcrb6hejhBQEXkhk0DQEU+3oF5YcGjwoFmqAW+4CBkwzRu
	L25/zWnB6p1EWXnAmegdSa4XZQtXDAYh3lTPml2jsuWPP7O08JkWJx/0AnjXY2BLNCENHbgl9f4
	=
X-Received: by 2002:a05:622a:2d5:b0:48c:51f9:5dff with SMTP id d75a77b69052e-48dfeff471fmr207623601cf.4.1746534500234;
        Tue, 06 May 2025 05:28:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVRzpe5kZ/C7fSbCX4k6D/yogiK3rg+EtVHsuYgNUWoJdLKfUJJzjORpHHDyQ+IzfzB/DYpg==
X-Received: by 2002:a05:622a:2d5:b0:48c:51f9:5dff with SMTP id d75a77b69052e-48dfeff471fmr207623051cf.4.1746534499730;
        Tue, 06 May 2025 05:28:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94edff7sm2006256e87.137.2025.05.06.05.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:28:18 -0700 (PDT)
Date: Tue, 6 May 2025 15:28:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <ip2phi56u4yof376t5a5mqhvo3x4oo4blcnirwc6w7eancpm7i@ofcgyfcxdmre>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
 <20250505094245.2660750-3-quic_amakhija@quicinc.com>
 <grwlmrgi5cfv3jtuki57ug7gsqykpwdf2to2l7di6glfxtb7vz@6id6cpfkrbuh>
 <88b139c4-0a35-4c9e-9993-573fede29b71@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88b139c4-0a35-4c9e-9993-573fede29b71@quicinc.com>
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=681a0064 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mgRI5fNFQDWczPtYMtsA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nx6QGeGSStgylw4vCycXjq2KrZ5UqrDd
X-Proofpoint-ORIG-GUID: nx6QGeGSStgylw4vCycXjq2KrZ5UqrDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyMCBTYWx0ZWRfXwMWmFZB6mJz4
 +QEBx/cakilQp2QKDO/2IM43tt2SpWDI8sdEBSrzFGYYwvkevTEWO2pfddy/6GW0F7zEz3Rp/qB
 ARYFVtRnuKUnE8mCujmPAVN/xhWCk8sTXX6HinyjR0WhS4rFnfP7olHfMe0mSbPYeNA0uh/GJOk
 hK4xtX97k+pFy1tcOw45TH42NBx73j2ob0FxY24u+wyGW+FN38Hx9pmtYJ0n4TTetjb4rnT+CPH
 BVh0Us21/ikQNrDBqylKaVMhtPf8+FZPJuzjfR3JrvGOMRhih0d/F9PXHlxSpCuh6qvdtzoQbUx
 un8K1cPKRXxiqPctVNhR93o1XJhFrbACkPGPNZoGZynSHGaTFdqVaTGE0x+z4wk5BpNPFwBTnGI
 k8qN49nAHT9qAr7mUWZNFT5QbCnjuefyNaO2reLE+w7bWvtRUiwjajPqR/63dg1ygLuSOE+5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060120

On Tue, May 06, 2025 at 05:42:50PM +0530, Ayushi Makhija wrote:
> Hi Dmitry,
> 
> On 5/5/2025 3:32 PM, Dmitry Baryshkov wrote:
> > On Mon, May 05, 2025 at 03:12:41PM +0530, Ayushi Makhija wrote:
> >> Add anx7625 DSI to DP bridge device nodes.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 183 +++++++++++++++++++++
> >>  1 file changed, 183 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> index 175f8b1e3b2d..de14f3ea8835 100644
> >> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> @@ -28,6 +28,15 @@ chosen {
> >>  		stdout-path = "serial0:115200n8";
> >>  	};
> >>  
> >> +	vph_pwr: vph-pwr-regulator {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "vph_pwr";
> >> +		regulator-min-microvolt = <12000000>;
> >> +		regulator-max-microvolt = <12000000>;
> > 
> > 12 V, if my eyes don't deceive me.
> 
> Yes, it's 12V. According to the chipset's power grid, the VPH rail is rated at 12 volts.
> That's significantly higher than what we typically see on mobile platforms. I guess,
> this is due to the SA8775P Ride SX being designed for automotive applications, where higher voltage levels are required.
> 
> > 
> >> +		regulator-always-on;
> >> +		regulator-boot-on;
> >> +	};
> >> +
> > 
> > [...]
> > 
> >> +
> >> +			bridge@58 {
> >> +				compatible = "analogix,anx7625";
> >> +				reg = <0x58>;
> >> +				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
> >> +				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
> >> +				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> >> +				vdd10-supply = <&vph_pwr>;
> >> +				vdd18-supply = <&vph_pwr>;
> >> +				vdd33-supply = <&vph_pwr>;
> > 
> > Here you are saying that 1.0V, 1.8V and 3.3V pins are powered on by 12V
> > supply. I wonder how the board doesn't trigger all fire alarms in the
> > building.
> > 
> 
> Let me try to explain the connections from the schematics.
> 
> In the SA8775P RIDE SX platform, the ANX bridge supplies are connected from the below sources:
> 
> 1) AVDD1P8 is sourced from the `VREG_1P8` of the backplane card.
> 2) AVDD3P0 is sourced from the `VREG_3P0` of the backplane card.
> 3) AVDD1P0 is sourced from the TPS74801 LDO voltage regulator that has `VREG_1P8` connected to
>    VIN & EN lines, and `VREG_3P0` connected to BIAS line.
>  
> The `VREG_1P8` is sourced from a buck converter TPS54618CQRTERQ1 that is using 
> `VREG_5P0` as VIN and EN_VR1P8_M3P3 as EN signal. 
> Where the `EN_VR1P8_M3P3` is an output signal from SAK-TC397XX-256F300S BD micro-controller.
>  
> Similarly, the `VREG_1P3` and `VREG_5P0` are sourced from another buck converter LM5143QRWGRQ1
> that is using `VREG_12P0` as VIN and `EN_VR5P0_M3P3` as EN signal.
> Where the EN_VR5P0_M3P3 is an output from the same micro-controller.
>  
> Combining above details, all three ANX bridge supplies are getting enabled by `VREG_12P0` supply,
> `EN_VR1P8_M3P3` and `EN_VR5P0_M3P3` signals once the SOC is out of reset.
>  
> The `VREG_12P0` is directly sourced from `VBATT_IN`.
>  
> Since, there is no SW control for ANX bridge supplies and they are getting enabled
> once the SOC is out of reset, I have used vph-pwr-regulator dummy regulator.
> I am not sure if it's the right way to handle above scenario. Please let me know if there is other way to do the same.

Add these regulators as fixed ones, describing the power grid. Consult
other board files if you are unsure. RB3, RB5, HDKs - all these boards
have fixed-regulators for the grid.

-- 
With best wishes
Dmitry
