Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBF6189905
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743798769; cv=none; b=Up2rKP9yb8zYcviSi+odq0akYREW6sdZkrbGCEOeHAFG9IiaRb3/XVVHEjgze7YcoQjm2/q7Ulv88XhKLK5DNccTgHGR2HU1Ghgy11CR8fv3e37klcTHvogKxvt71pm2/8pBNe0T5SQb+Hi7KZw/RX7VH47SIrhtrZo5Xd+1F58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743798769; c=relaxed/simple;
	bh=LElVHAM9xf/Dy7ylzvkbDBQA7o1vD7xD955A5P8xnEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OxAjq0zPckDENh1yNNqOHmUn39k5Z76DZo73w8r9ctc9VDYBF8jQrMKz9ZIckl9YqiK1vyTl8WqlG02V7u1YxuRt/BG/zaga8m6INU5n0SaLBDSKxZOqPlXHdt22mtgmzaIqQKjjOiIlhvEIkSBqLGMX0cVTPnvK0j8SjonD3wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iz052oQg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iz052oQg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JQwFi017943
	for <linux-kernel@vger.kernel.org>; Fri, 4 Apr 2025 20:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOAnLBAJdmL2Wb3sULNUowgzyt+Uj1UkgtRMWgKYGwY=; b=iz052oQgLnMJGQPP
	CErBkb5+kMai2wmrL1VN6aYCv2tNSjmEdIrfLe2CSQfXGDiEFb4OXZOEkTaYZbPR
	s2oHMwQzXNhmk6SUZYgDGSHI+F+YBm/87r/DJurVf0ZzFNC4ot67mrIvW7zyGbGr
	tZrwmJjCSh2aBcHFo9OGDPtXHHuXRis1nGLi6+/UB7OHXPrcGPX//U63Ls94UkLt
	dND0Ti+J34F+JtMUGdIBWvVSCJdsUwwGmSZ9Vhqq7H6+HJDbJf5Oev3LOX3sgkS9
	B71WuA92ekAKJCQDQ2Sp7sD/yQWdIFKTjhAd6eBWWM+UflUROy303DyuHyl4dUJb
	sT2VVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45tbnkst76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 20:32:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c545ac340aso51083585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 13:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743798765; x=1744403565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOAnLBAJdmL2Wb3sULNUowgzyt+Uj1UkgtRMWgKYGwY=;
        b=UpWkQuC1eGw9JwBX4JRk5tzSwwfiUw3TgcmNwEPc03N78VJnwyq54pw4UM+bzNOf+t
         rJo0w5Jq4I7uSUPiW1Ks8PJNAeDxtFcOkgckDb5/EiuwRF0tw8lqGAQA1QKEmqwLvH/X
         ti3aWN2Sz6BI8I8pmRC7F6OmEojtyE2wN44F1jb3ZflDTesUmcRNUd2QBGx0Adu6AKoJ
         bYH2jTmvojVbhlunzzG/ZdXeOPfcd+T+StrhvIYq/XqNSY3Ply20Z8rJfTNuuA6F73bd
         5wg24J3eguwAwRxg01s5dzCqWguajCbYwdOg5RGv2wOcxAVPOXKlqSX8luNUQyMgAXwv
         zwSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMljvpQ0hhmyoAbB5KidS77XldTMw0DnUba1v4nrB5iymFNoQUmJc9SQFRU6W/Lgix61lOqyxbojW+5FU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJaznEVFvLTtKuRPvUvt0hoequowjKLfRxylAg1XXwPXhG0HD+
	h4PBLOQuLiaMZgcKJ5H3M+2yTgzku2luWop3UtDxe30t3/4vnHFGdsDZ/hrCtf+0QdLESdYO6t5
	77oLbJsQ+PxXBeRAzINYrMATqCcZwp1TA2J5QK2/rc597utRf3rLrqP2zs55U7pk=
X-Gm-Gg: ASbGncswb23e5cIZw1ebJfTepg8F8xKEJpxgSD0zAe+VuF2nVydJ5CUyCA92fgWzHQo
	LMZc3xV2deHYmiI8Ja5EMqWDXoExsjBXCTnaTp1zgVf13dgrqLOhLmCMyOMhumumYUSz/ZjGb9f
	TUYZplXRFhYaKOI+0g8RIOz6XGWcZoQ8HC+WsIlawHH1sC7w4EWgjHsS5zdqMRVNnEMNDJd841L
	VZfVnzwy7QrjRnRVj5b2DDvNj1HiU2MQ8knhLpmEJXj8QGDA6aazqC3YcrnGFLGml2DsyMS3P0T
	yzWhKZWQ/jHNbf8wTK+gULPPgkSg+vzF0ny1s2MOJtSuCocglTJMkT0doVEH0gWLgrpUAg==
X-Received: by 2002:a05:620a:40c5:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7c774dc4185mr209774185a.10.1743798765313;
        Fri, 04 Apr 2025 13:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEszusUf9J+0IEkVjsuj8Y1FnlY8CMQ4G+oamdYonxr6PB4E4ScKqwKTkVXQqlueNvC6p0Aaw==
X-Received: by 2002:a05:620a:40c5:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7c774dc4185mr209772185a.10.1743798764979;
        Fri, 04 Apr 2025 13:32:44 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a405fsm2902483a12.75.2025.04.04.13.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:32:42 -0700 (PDT)
Message-ID: <d3592f32-e29c-4b40-b045-7267795a9617@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 22:32:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] arm64: dts: qcom: msm8992-lg-h815: Fix CPU node
 "enable-method" property dependencies
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rob Herring (Arm)" <robh@kernel.org>,
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
        linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Alexander Reimelt <alexander.reimelt@posteo.de>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-7-076be7171a85@kernel.org>
 <470e2155-7145-44ab-9d6d-117a2d98d7f8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <470e2155-7145-44ab-9d6d-117a2d98d7f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w0rudg-AYKuefY-jLznwKzg8Pr8DzTAp
X-Proofpoint-GUID: w0rudg-AYKuefY-jLznwKzg8Pr8DzTAp
X-Authority-Analysis: v=2.4 cv=X9xSKHTe c=1 sm=1 tr=0 ts=67f041ee cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=vHGDO5lFCXZzE5S5F1YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=695 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040140

On 4/4/25 10:30 PM, Konrad Dybcio wrote:
> On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
>> The "spin-table" enable-method requires "cpu-release-addr" property,
>> so add a dummy entry. It is assumed the bootloader will fill in the
>> correct values.
>>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
> 
> This looks good to me without knowing any better about the specifics
> of this device..
> 
> +Alexander - does the bootloader you use take care of this? Otherwise
> we can just do what Sony devices do and stop on removing the psci node

I failed to add Alexander to Cc, second time's the charm..

Konrad
