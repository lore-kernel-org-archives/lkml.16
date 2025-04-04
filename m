Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF18B21E0AD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743799306; cv=none; b=JkYlBxD4HvhHDgux9057NGN2ZgvqzEC9TKroK/sSPrH1/adzL1CT8DBAtpIWe7rzg39QObsFKirMI2EXkkHrtFPApnuG8zremrsAMtVBDAOIIjB+/QcdXfx0DZK9Z+o9Hx98FTdWicMxcLwZ+OUlMkmvCdNSvEKjuEEPegV/zBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743799306; c=relaxed/simple;
	bh=ccyZLANca6twdJkvuWEqH0rOcwC7Rm7pJo18tnXG1VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vm0cgJ/zJNhVk9J4bGdBSLEXKNozb1sJy7G0+zQhqkeDyOFUyK0m37uhonfMG44sIff0AJNiGHl7B7oAuo8N4PMrRMqG/uVuTOzpb8keonUo8+jYK+7A6bEP+aDmYwatvZyJBMUwTEzC3SOjIbalH+zRvGPiq/Exf9E/mRYxOic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e006pJL3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e006pJL3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEgGL019833
	for <linux-kernel@vger.kernel.org>; Fri, 4 Apr 2025 20:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yhwB7sBtbDgAESOIuK+j/VpMVm+i7ozwb/nf6hzXHSI=; b=e006pJL3OxxAh8DY
	yw6pzBhVXjXPMKiJbem1EZ2wzfylcu7MoE8jlhD+yLNH/8wEqqVTrpIicznQ9JAj
	6L8OAq4Hv+XXOe0wHTxagPkOi4TuKwBLxCKJIUM8F13wbKZrGGEw1a7ewpS7h9Ol
	LlWJqc17vtQxsUc1Hd9cS1Irr7ooYRrNnfTwVm28GRqrJusgJ85frwJFvBdOGD8u
	d9yCx0PeWg02ITaLXRLspQw8ZoEwfmAr3aKscRUzaiPCkam6uTntdVgYNWJodDhY
	9AmbuNyq3qqO6CUw5UrwUR8ILDDbH6MAvfR6kg2EJscGkLCxou5n0Gk1kHGxaRKW
	82u7lQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d42w3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 20:41:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c547ab8273so25659885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 13:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743799302; x=1744404102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yhwB7sBtbDgAESOIuK+j/VpMVm+i7ozwb/nf6hzXHSI=;
        b=GLQF/JD/8XrVdF2at9tYFwZnnCeGtaCNKJz+Ey1UkhSB4AgudYbAWaRg6RO+TZakHu
         jMp3uR6Kege2eQzaNGlO3T/9KYN7wg9Uk8RAlsrq8Y10DZW3oHicQecY2Zi59Dw4MCZ0
         V+LzSrWEn8X1zqqEpGS6srtikVqx0p1LWsxkeOBM1Euo0KMIUmHLHhcTXDpYeS0xDbUm
         uL4UhArOoAdcOvyKrvNhdWjxl1BsZkAIZrz1EXJbGuQDt0o6U7yKSFc/nifE0rtSITcV
         1Xov9QqqRycpCHpPhFcAwYht2TqnGzmFqLsXh5NAIoPo9ClgJCCMkp9h9BHXSQMMtWNS
         g9ug==
X-Forwarded-Encrypted: i=1; AJvYcCVgnxF1iVwVIaw+29UjVQz5jeJpL+OnrbpTSwsB0gaEamk0i56Lf5uylK30hO1Ue/ZKWBiAWl9BGN8mSMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzniv8j4O2CKYNhY4yvzf6j/wuojV9eQHhkX95xpCI2zz2x0Mev
	ndcNHhnKTJeb979dzM7gdBzQBlCSBOmc5gy9kXzMNwbgJY0Tg6O+diEhGokEhHPrnU3wLEG7sHc
	XXAkPk8HUtued5KePUjV3oHweOBSSwE+d9tQgVmd6ZbtAA8uPfMGi6nmEXWbBNWo=
X-Gm-Gg: ASbGnct90JCCvD2nFmCrijbOo+EiNUnoWCwpGggIF4J+HP6TgQ3IffGdUhbqRu46xEe
	Vob6aTZsLheFqtCTb54bAnFG3Aa8qnSIpwBDyhZqFXe+mXF1kTKT10fupjQ98GFmbCwgGKQtoie
	bKoyJsLKScwhcCCDCX2IPo+IPTLHbpgyXErLZ+ZJlBMvLY9XTe7i5BZdLLLH8JrfYt752GOb6iw
	VcmiulPFRBn5BTi3B6F6uLn01JDFn1qTvOvLiLs6MibnfrnoLLvIvB8+KCOq6tn9UdWtZT8cxGK
	0c+zJkel98Weky8gITor25lXrkK+k/d9TW28NJLOBOVCt2GIBQyFeYog2/3EbEebqcccsA==
X-Received: by 2002:ac8:4644:0:b0:475:820:9f6f with SMTP id d75a77b69052e-47924943de8mr21783931cf.9.1743799301641;
        Fri, 04 Apr 2025 13:41:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1R4hoCTSAc5GEHefyuqv2Og+2N0LdZwy28eI6DAzYwdiZd4PyFBY4gfZbXP5sqGwuyOlLqQ==
X-Received: by 2002:ac8:4644:0:b0:475:820:9f6f with SMTP id d75a77b69052e-47924943de8mr21783741cf.9.1743799301314;
        Fri, 04 Apr 2025 13:41:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087ed19e7sm2857643a12.20.2025.04.04.13.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:41:40 -0700 (PDT)
Message-ID: <03011a33-174b-4027-bdd2-043aa685380b@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 22:41:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] arm: dts: qcom: sdx55/sdx65: Fix CPU
 power-domain-names
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
        Conor Dooley <conor@kernel.org>,
        Nicolas Ferre
 <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dnCwjU3AaKl-abP9GY7L1mxJ-65icFLa
X-Authority-Analysis: v=2.4 cv=HrJ2G1TS c=1 sm=1 tr=0 ts=67f04406 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=xglDh1PETwH3DoLBRHwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: dnCwjU3AaKl-abP9GY7L1mxJ-65icFLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0
 mlxlogscore=874 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040141

On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
> "rpmhpd" is not documented nor used anywhere. As the enable-method is
> "psci" use "psci" for the power-domain name.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

"psci" is what we want here, but these platforms require some more
massaging..

These SoCs don't seem to have any PSCI idle states (deeper than WFI)
described, which is no bueno, as they support some..

I'll try to improve this.

Konrad
