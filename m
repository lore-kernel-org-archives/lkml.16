Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A16A22B597
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556697; cv=none; b=bMpx52gUa31rsb9nF5F5YC9kmdUem7IRndepKK3CcghbcM7Lxrtnw66TNfaZeJiRe2StZV53AVtrOC0U9QN//2dpeuvQFoaQNja8HMaNi53Y6k80jL923AWi2BrB0YnuY/Sq0b84MzGPXgPz4/xmUrBJTH7WABf013NRRalpge0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556697; c=relaxed/simple;
	bh=Y8Em9NS4yQ6mlgIzt0kUNbKJWBlBLGc6b39eEx7HxfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+JTSSDmMVWNNLQ8pDp2i6OiyuvbIHiS2bFfE5Yg6uKcAu3ZQodQIeH/PHpTSSr8V3o5G2VadJ41PqpYgS1PYM7Qm9luTqXWPTl+sIof9Hj2aIk+YXXUqF+jNDdsD8e77742o9zxGhg8QVatucB8/vn08D7mqsStQXnd1oEH3g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWKkWxYp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWKkWxYp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8ZWUt001845
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJ6+ORb5liBk+mkhK1nYbmCS+4yM7TemgWQTbWX2QOw=; b=AWKkWxYpgJXrVaLE
	UrBS05768i944CObxrkJFp5bufq2NoP2/OmyeRzleX7rNczsowZZxxRHnhMCjhh2
	UWU9vbWWfSve5s9e9nJMXK74X9UNbwWrX4zrMwUii7cs75sYEXu4+vlEc8eE9bmx
	z4/Ic5RzVjPkywT4Wq77qGZb01rTMZeZ10LBWiy1WBqL9aFCfu/EtDLO/uVKWwkU
	7Pt5i2zmXmIS2CszK/FRnhhC4im3O5z0R1G5dUoseOP9ONM/IVHTMt39x7ScefS9
	Sl4oUYDzJIcC15z1MT+JnBK8FkmkLCaDr+tKGIGbal+XbYkyhpJBF4wn8zPvN+j5
	uHF1Sg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxskjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:58:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-49a4f4021ccso11011571cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749556692; x=1750161492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJ6+ORb5liBk+mkhK1nYbmCS+4yM7TemgWQTbWX2QOw=;
        b=BU6T2BHvwXw0pLtUYH9OQI5JysbScHFWaDxFbiN+e4wod01oqKGCXAKEw7Ni7i8MMv
         2m92fRH9ZQC7bvGhRPqDTiaWMcm1wyhfhJcFeTImE12E93SQrtQbyZGDDxQByWfXSI6J
         5pDI49UHKtgVTEEuJxJQJLfJnDG4PlayU2pSXkseyfBXI56kAP20NwwYVkc60t5R8Pti
         1wsiTYqIaJXUdjX8F+s1QkWx1QGjXMmAzmxjB+uG5Yce75N0GsfV77EI48nywAUPWmfi
         ytTyPj1oSxw0QPvjYWR2xWmYHbh8Q5eO6PVs631VPRQCkrDfYEjLBv1KcbtX8eB6c7iC
         fZ6A==
X-Forwarded-Encrypted: i=1; AJvYcCURI970Bh8YdasXVFmIxq4Xrbdy3+BosZtr96cquikhHEUIxjEY2ltLYHWJIwo6WKkzG5T2U3j04X7nW3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YytdMrbBahVG90yeP8mkxCOZ34JfTCUgna1lZdFHsfOjt0rAlym
	ZJO8BoNF+ZLQeobsTEnMHyVA8+zr1QLC5LsCI52wHx5NBmOYowx2Ad3VR4DH+pXUizhbOpcKyVF
	aZ330ZtKI3fv6Vb/Di8Qf5wUGTlJLTW2FryvdTtYC0t+N7yNEpQ26MIQ2LPBiipF9Shk=
X-Gm-Gg: ASbGncs+sJpO8VfPsXBltxTuawClKgR4RLhpsF3lPndeK5TvUOJRopNA37AvZlXzIkf
	gIjaSQ3KxNErY3eHfQwECyF3poGpOLXTtQ4clFJxfBj3BfgmZPeBKPehezBZYSkaL9KEl12ZEpa
	HIm6Ci5QNQOV6x3a6nmJcLA8vgM0EqaLAgXr5U0aibVBNeL24MNbs0Pzf1tcqWOaBljeSiENasg
	DRmgoo05pAaqPlscMXSXgutXgT21FU8qW68aQOEWr1qg13psC4nFbd9uwrjkqduu0zbC7B52vU5
	7ebCXhDUom/NzW/fMVoQbgmFgF6JMtQdXn3IOZagopkMjP448M0a5GhxNi6d754KvQb36FCIMGp
	s
X-Received: by 2002:a05:622a:1101:b0:4a4:40e8:6e23 with SMTP id d75a77b69052e-4a667c1d1dbmr95005981cf.2.1749556692142;
        Tue, 10 Jun 2025 04:58:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbA5DrdMqWCD2ySC5PETSlVXoPSub2FJPNFoTOkSwxhiBGPqwDNOPd7MHJQlO6PqwixOLarA==
X-Received: by 2002:a05:622a:1101:b0:4a4:40e8:6e23 with SMTP id d75a77b69052e-4a667c1d1dbmr95005791cf.2.1749556691688;
        Tue, 10 Jun 2025 04:58:11 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783e66f1sm6071020a12.79.2025.06.10.04.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 04:58:11 -0700 (PDT)
Message-ID: <90791cfa-89a9-4745-916f-ca5381247a90@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 13:58:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: Add support for X1-based Asus
 Zenbook A14
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        maud_spierings@hotmail.com
References: <20250607200229.30538-1-alex.vinarskis@gmail.com>
 <20250607200229.30538-2-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607200229.30538-2-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bfxEAxO4gPpXDMUu4UULRtw56s2JwRxy
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=68481dd5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=04dXdBH-sfCwm-JsXqsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: bfxEAxO4gPpXDMUu4UULRtw56s2JwRxy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5MyBTYWx0ZWRfX69R/wQ55EVuG
 jwrw+4J2ksiYaFK/2S0QRss819a+9FF9wgBHJGsEjeV9VZS10TXQpgKnrEs9dQ4B7FBycBOFpPi
 KEZR73TRqxoB4httm22Tkaq3YxRWkcSgBD8QRFATK+qgni/NGMoUqt0w52KeEbBAQYiKY+sL4DE
 BzZFNbogNFXwazyZSw5TlwGFVUSf0pDDb7Xlbo9+52SBqkjQxhRKW4gwX3dc8dpd15iLiynWVw/
 khGyKMKw9qp1psa6Jy3heT29ldF8C/A65gfF//OmRaiG8shblPRASgVjZEv1Q6n41Qfn2Q8RVFQ
 PiFZ4oIcul1INu7ybXGxjgOiPmUTCLpjFA7KM+PR7Mqv6XRx+LvXBn8ORB86e8xXFSQ5rO230sL
 vKnEZuNU26dNegm/K3ZQE6Fk0jNl1vsdCf5PuiA88kCsj5WkBZBw243j7t7cloyA9yf9WEzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100093

On 6/7/25 10:00 PM, Aleksandrs Vinarskis wrote:
> Initial support for Asus Zenbook A14. Particular moddel exists
> in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> 
> Mostly similar to other X1-based laptops. Notable differences are:
> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
>   and Qualcomm FastConnect 7800 on UX3407RA
> * USB Type-C retimers are Parade PS8833, appear to behave identical
>   to Parade PS8830
> * gpio90 is TZ protected
> 
> Working:
> * Keyboard
> * Touchpad
> * NVME
> * Lid switch
> * Camera LED
> * eDP (FHD OLED, SDC420D) with brightness control
> * Bluetooth, WiFi (WCN6855)
> * USB Type-A port
> * USB Type-C ports in USB2/USB3/DP (both orientations)
> * aDSP/cDPS firmware loading, battery info
> * Sleep/suspend, nothing visibly broken on resume
> 
> Out of scope of this series:
> * Audio (Speakers/microphones/headphone jack)
> * Camera (OmniVision OV02C10)
> * HDMI (Parade PS185HDM)
> * EC
> 
> Add dtsi and create two configurations for UX3407QA, UX3407RA.
> Tested on UX3407QA with X1-26-100.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

[...]

> +&gpu {
> +	status = "okay";
> +
> +	zap_shader {
> +		firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcdxkmsuc8380.mbn";
> +	};
> +};

Override &gpu_zap_shader {} instead, this doesn't work as pointed out by Rob's bot

Also in the second dt

Konrad
