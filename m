Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689131E9907
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744562128; cv=none; b=KbrJ2zosp8/Sixw1gw6NL7uCrODMPqsWAH0T4FuW8rUiTWGXvamtICHGZDGs83N0WQ2L7xQ1VGQCiyaOGGu9DhSIMa1TagStCb7tv9yeHv+gj4rmbP0xvMQXzzB5djlqtAKGyRquWHzS1POakgwdlS0tYn0MIwZLiHsBLvb+q8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744562128; c=relaxed/simple;
	bh=RB0Is3RsXE4ayIze9bhVA06wlRHIFRumqGpp63ItTVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFZ9HbQwJB7GOCQy6sSbIDvzfHk4yWkVvm6JN7/5PP0p0nyvprJUuOher5mk72uetekOGUV4PveQrv4amPWReX7pf/gM8smH74rqvcMRyFVZtEJbSvuRIZsxmy6UydJNdGfpV5Dfx8DbS0u0Ef0YU0LlZQ+8rKfxMxyCizY5Szo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MikeDy2o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MikeDy2o"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DFMNWC000876
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HHDGRlqVtQyxh83zlwnFTMpQ
	Jn3llTrejkQ0QtY9TUg=; b=MikeDy2oM6IDwZvBeICfrVy6g2JuSn1wycCTDOJy
	ewpYcbNKm1lkqdvXr3OCB4shtXjbWN+TBdYtBVgcPSAIi6/zQM4I56WAMY5FjJ4h
	dn7FDu0fQaDrk9cbqdTUNneHMfwnhGAHMRgtP9+qGg0YI2MiVtKSWjj7orm7QRUX
	ZGYJvM8W3c972lOf/HW79X8durgIMCEro9e2RyIRBJM4dT+kPhHllv31StHI1gpl
	YVcdKhNbB2lQZ4txeZXjvuvtLb2NNGTae32ixYaZr6rsvoaJahePKgP/MXwS8FxG
	TttBkWSNZP1X/DghyQqyFoUQgRtCXFdMHmN7mxebRRJ+EQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfct8w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:35:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c579d37eeeso577297185a.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 09:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744562125; x=1745166925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHDGRlqVtQyxh83zlwnFTMpQJn3llTrejkQ0QtY9TUg=;
        b=eNTwlk4HE1DKin52Vtrq5xqDwNJARZfYet1d+MT4pYyg+EaSLCBsio+1NMrSxCy7Kh
         UbIohnvVm6HnmGxOIDq35pEaw6OsIzsJPTuWphouF0oYfIaueqHPhzzrkk0mkJYwCA8F
         IcI4jWjsRIb5+N2/SgqiwjF+wAFWiczuTiJPXO+7hib6jUUKw/VtMH2V29GK+8UJ6Q2I
         gK3+DQqr6OfX4amxJIA0STtYljhJXZukER/K0PKuT/IEy4UqE7ICPgP4mvwFelj/jVkZ
         RO9qGANa7k7y2nOpmJgxfM489puhqYqLoSM8d6JSpPJ3Izs7py54F+IDnDZhQa3idrzn
         bVBw==
X-Forwarded-Encrypted: i=1; AJvYcCW3PTYFKKdwhuBch9R4lD1BuWtAZbAKwPlW+Gu2mNpeVkCkFXOlVzS9QODvy79O9LNpwi76led3gSkyCdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbRi2rPqHTxad/x90dAzb3yLeRJJlmZ8OUIXyPrN68j4Jyu6pJ
	JOPW4IpWhwnVykhwWgTND0ACRinSI1t1NVkLmJ1RSnIy6wGpETSP9i15iofzHlFztkZt1U3lCi0
	lSx9nGCrTk3NzeMRJXkh6+tZp1g9tmWGhbu6uMkoLdBKHXqsjPC66JTfVPWQnUMo=
X-Gm-Gg: ASbGncsHaQv17HFuQsP/Z9kQ7fHrTnQPWhuWPS5N9DegEkg2bPLs0wiicGsyoS4oi6A
	NjG3En47l6SrPJeAFB3XGRk+dQpaHgizjWTaPrt1UGvm0R32ha04/9fC7GhAodKY6NZqgC6OSIf
	OGfADfVr6IUSvYaU8vME+gLaNEdcI0OodiyNu7YP4uTqqzonpY5TQGSt/CB/+x/JpvHkUvcEtgx
	wdA+ATNtV3RJyyMLP3cBz9qw3k8GsaDRxIeIrKAs4QICXGpNX+bsCIuWv0HeBEwExzOP4WMS5zc
	DO/JprQE0ICSTE3l5dLeJ/NOHGuVaM6JA5J6nUi7KuWJFJ6Fe8a09huUysgkEHFExFcuNUhoPSc
	=
X-Received: by 2002:a05:620a:2684:b0:7c5:50ab:ddf7 with SMTP id af79cd13be357-7c7af20babcmr1365620685a.52.1744562125105;
        Sun, 13 Apr 2025 09:35:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ2SmFOwzSyR099QmLh/foSM29GY2hyA1aduFy1joD+oyH331vhHReKlrLXjjTN89o+aPFZg==
X-Received: by 2002:a05:620a:2684:b0:7c5:50ab:ddf7 with SMTP id af79cd13be357-7c7af20babcmr1365615385a.52.1744562124627;
        Sun, 13 Apr 2025 09:35:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d23c8afsm888868e87.101.2025.04.13.09.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:35:22 -0700 (PDT)
Date: Sun, 13 Apr 2025 19:35:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 2/9] arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563
 PCIe switch node
Message-ID: <ethalrlraf4lnaefcmks4buffqfsuxasmfjmajhlz66zoqtzvi@37hh57nbfrmd>
References: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
 <20250412-qps615_v4_1-v5-2-5b6a06132fec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412-qps615_v4_1-v5-2-5b6a06132fec@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fbe7ce cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=2cuD_6P_uzM7HzBj738A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AjTqPVp52wCblOKrKgu7fjeolJVRwmSk
X-Proofpoint-ORIG-GUID: AjTqPVp52wCblOKrKgu7fjeolJVRwmSk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130127

On Sat, Apr 12, 2025 at 07:19:51AM +0530, Krishna Chaitanya Chundru wrote:
> Add a node for the TC9563 PCIe switch, which has three downstream ports.
> Two embedded Ethernet devices are present on one of the downstream ports.
> As all these ports are present in the node represent the downstream
> ports and embedded endpoints.
> 
> Power to the TC9563 is supplied through two LDO regulators, controlled by
> two GPIOs, which are added as fixed regulators. Configure the TC9563
> through I2C.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 129 +++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi         |   2 +-
>  2 files changed, 130 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
