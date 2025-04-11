Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C57628C5C5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362966; cv=none; b=D3YG1Q53zcjkRGVKMe76wUOfqmah+iScef2BcSzyyaQ3AtvIpfRmtBTGtfKv92wdWcaIqzLlZz/YVlKFyIaGpZ7kWgYci6IOvmfU0082PJYpjdnig/fTxkHn+8GZhv8lClOrhiuBI4C7zrByKK2f1qi9ovcSuoI0fQBsJluBqmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362966; c=relaxed/simple;
	bh=6op12FQgpbMbUy118314dBQL/V50ZpjJ7sSJIU2P3TE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEJATDPOAdTCewx/rfrZxXIFxhzSAU+gEjZ3EZCxR3MeXe0Rzy5g7jOUu3YA0QJ3CpUmNXewnMbrl397M5y+BjpSKo0oPKsN2i98qD6Kcb4OsWWwQishOluQbz0t6Os89pmkm67qA6rI/quzKYuQxMLr8/7efjFrv4+mwt0Qrho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaBRntvb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaBRntvb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5pdi5016300
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SdbE/DxPDX7mmNIDt0tfMeaCACq/2F5Z7OVDEZCEKFI=; b=CaBRntvbdhZ+mLK+
	32w3o9t6//xksqnuukljgPuRd7Hq+WALFw/v5QZG5GddIFAhyBhORz3cozSk7+H/
	Mk7Z+K4RMDSnWXxpPUbMnYjPNsYUSJpPTQctEPWdd8Pk5ph2c2j6Du4s/VBxtavM
	veEDpkd2Zx5eNPaDorHFNXTWfJsdkrfGIxOj7FsErkptHEPU0y0/wGjPf23WuxPL
	mHCM5CPWie6RqW9Y9j6ZYzI9+IL0NBjEJvCJLVRZzKCBoULFNZIEbxLHzR06SWlr
	rv1LM9yqps4Z1nPCWdYbu0LlFB7366avWO8WAyMph4z2uOmWQRlM0LXz3zBj5h5N
	HG5GQQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1spyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:16:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0c76e490cso3025836d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362962; x=1744967762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SdbE/DxPDX7mmNIDt0tfMeaCACq/2F5Z7OVDEZCEKFI=;
        b=c6zZnYiLlLX7XSIpGEFOMWZJU/2VQUuw+BE280qzFXBodGepzIsUl8twUnODM98qHp
         SqG38iEIERaX0x/LdXMULg0wnS5iL134VQQ4G0FdkEEEznYpvPjNR2wHhxdNsm9uzzJ0
         pYpPKPXBUPFd4YvnDmUfPozFRsSYj00UHwW99NlEAUjXSvYCqWymVyJ6G3TFGC0wmrdX
         rmkj8ZoXSBm/3Hnz6wsLymgTuYovFIUYV5MOjLiEUMiHHoFVzmyQNi+pHmNkGaZf44yO
         Ng06bUJSeZINzAUmJZGJKAvf3aue4D4sMYTv1nsmxTbIe325IP8KP5+JNawri/g9oZxE
         IsWg==
X-Forwarded-Encrypted: i=1; AJvYcCWBItL1b0ixiubqKCEN8TajfiogpoQs2t7aFtyXm8vnt3fAwLFuEgQmxzY3gH3QKa1FCWFTQmvALAwadzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAgKDYpMit5NFBDTcEXUBeCD0g3w+djitchNiT7OaD90LWbnZl
	R2qfKkSQ7n5uJe8Va/7HOzZQtGLe9zI9aJdbLjlMKoP6B2lWQNAFhvPcNL2LQz6lq++IBNUDt/r
	FBMonrV9v997nq5+niqELxyfXe3O6YKKXyI7iTG86gA7Sn4aw9HgqFlNg2bduoa8=
X-Gm-Gg: ASbGnctnKPzmSupq6d6UOe6p2b/1wr2rNqH/2/+7dvnUX4PAVR2riDk18DImxHEmwdh
	JWTr8UhT4LbsNGGXbl0/GeN9hIOL1XPMqWKxGhXrfD3NqaHZ2C6aAmFUDNYs02+VE7XHPbHx+Vq
	l6kLKF2vdRI9c4iCSPuqYLgnIIrDg6F8EjkGZlHOTW3Zqo34IpPg/4ERaRHvD5P4G90MuL/ATOF
	PaA/wTi5d/oguOkEfTTbsgEZpFfM+3zOaF9DwKuFycRzYnPDKRr2M7DZXPDeR6RXF747k3bL6Rm
	QpIG0El2RjaOzxkNOVJ8TK3xst/vugKaufZrRVAaCkWJD3pl4LlW7RXy8MKdhmADPg==
X-Received: by 2002:a05:6214:21a7:b0:6e8:fa58:85fc with SMTP id 6a1803df08f44-6f283b06981mr4226026d6.3.1744362962484;
        Fri, 11 Apr 2025 02:16:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1S3Lj2+VP6zkrr/KAvVwoc07b2Dhiowu/+1L4K8SRDlWx9F5wmlXB5hv0kwshKe1D92mPDw==
X-Received: by 2002:a05:6214:21a7:b0:6e8:fa58:85fc with SMTP id 6a1803df08f44-6f283b06981mr4225926d6.3.1744362962091;
        Fri, 11 Apr 2025 02:16:02 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd2c4sm406829166b.129.2025.04.11.02.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:16:01 -0700 (PDT)
Message-ID: <088891de-cff9-4cbe-81d4-f94bf09df61d@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 11:15:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/17] arm64: dts: qcom: msm8939: Fix CPU node
 "enable-method" property dependencies
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
 <20250410-dt-cpu-schema-v2-5-63d7dc9ddd0a@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250410-dt-cpu-schema-v2-5-63d7dc9ddd0a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8JFkxWdSQkGIZClCTfsqJbYwfZP9_AVm
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f8ddd3 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Rt0Z8iD2R8SC1h9hphoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 8JFkxWdSQkGIZClCTfsqJbYwfZP9_AVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=716 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110057

On 4/10/25 5:47 PM, Rob Herring (Arm) wrote:
> The "spin-table" enable-method requires "cpu-release-addr" property,
> so add a dummy entry. It is assumed the bootloader will fill in the
> correct values.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
