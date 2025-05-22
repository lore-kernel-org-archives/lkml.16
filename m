Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CA01531E9
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937792; cv=none; b=ReSsUAvxZz21ZdtmnCSXgQqaeaf2s0+wOYAlpGe5a092uMdNVarZc2NlqhxUzv3xvQ34SH5KdYQD86/0gv84hIR3ynTkVe792dsed7VCkKiao1RLVktUeTxfERZegaKaCcQCEdPVy1NBmynFWUSHztg15SoGMtHVL37nAM3ZlRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937792; c=relaxed/simple;
	bh=secQdXXEgFxsmOhPWrTAs0k7BqWC8fL1By+eEVP1/k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UvnojtR5MNJ7ZmSkQA++pmXDc979tzIuoiinpEgDRR+WA3ib0/2kgdt0MNiwPws0dBVPfP7Z68OOGZ486V72lENkcXs1iiJCSL50QBF6h1JVn04DmMsHDd4UQ6Yt1n915TCYqmda5W3UhlquEgR3YTu3HTG2Lob28WZITVVKY/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Io9dp5Rh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Io9dp5Rh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGesVo029048
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vd80H0upZK9Jr0k83Vkq4eqyU3PiY5TNFpb8R/4mM3w=; b=Io9dp5RhA7L7TC+1
	vFW+pX18qrmNfTtj/2tCqrg0pn/HnJtkR5o9c+TjVaLOFCN9SfBuYLtNpjje9yMh
	s++10oSTVaAOFwpLAQ7BKfFcM4/VuJsErHNxqiTUbH8q7nBn2DCZ5xKRcOUoMJHj
	dg+V1lnsKGnoh28C6WcSE8Dvv4OvR2AK7iwx6u0mZ6GIR1zuXdOd5x6BM/fyQhFE
	Nj2J1R9fxlJ6Xz7AQP4rmgOKB20Ti3aYHKWIf6tkC8cMSgl9cvegslS9c/3ejJK5
	0W7YXYKaqroxyE0LEK3NCnPZcZ0FXy9CRQnttlGncHqmSYhDWbRuqfSChL69zy0P
	TY6PGQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf47dgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:16:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53d5f85c9so207810085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747937788; x=1748542588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vd80H0upZK9Jr0k83Vkq4eqyU3PiY5TNFpb8R/4mM3w=;
        b=kuHBzEMlPTBSUTV1nBRTnBVf+/kqRuXsoKc5YSIb6Y8VGqvS6kCJ1RvoCVYPT9EhJ3
         9tMpqC6YDL7md/+Oztld9MJebHphwZtH9+sJWBaMPgaWtMLIZyubnvlErO4FEnmHqxir
         A/TWcB8oNrsWVcUnHLl5tXTGqRbsdGgmspXtgkAHHZYiN0BR5Tb2YHF/I7Ysc+KES8/i
         oHHqBbwfjVvr8dcZLCOmMVsI7SucoSHcm7zlvZUqCTj7GIQdXyOPRRbAkWwFHyj4P7BP
         qumW6tRlEul86akw3qnHZH9Fy7x3mCMeSUyfuhK/G/RJ6mO/B+hp1SoKWcnXx2AyPkuW
         S/3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXq85pkwD0a8Rkwvd1PGzSvynaw/Dyocla6RNnfjv4YRNoUiNdHaNPjoOz1bzO420coc25jYW926NPA+IM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPSG0+UDZWGCPx2bOyYAyGWsCilqJZuL7L91hBW0C8LtxBNP/P
	rD5J8GfY3p8uU0+z34VQPVBp3s6sHWmG+y5hBsCw1Idrz2xF0BLTBRPHZL9NS6XzRuTlwPXjx09
	74WMOBdz0iVtG42rFDg7yUP2uJy4U7yuNvh0J1JZdr8JsdaGpZ1AM/PiOc5DJD8iF01A=
X-Gm-Gg: ASbGncvklD0sjLy8QVe+Gst5aAjAjb4qYLqXPulFm6ceKQ1S8VSveCD27VUUWnzEDNL
	XHId8/sL+ZnLTnxnDdlAx5wLJM9Z+Q8qMXB5B6fxl1KyYAfTpneEH6KdpXubLWMTGVNrlcxRn9u
	I0p6u5cHj0H/NoFprDx5afXYT0PtW/xmTUmvlyCTuEkL19mwaFxqZbLa2Jxfhm7j9yuYShHZEW6
	LL6RFJMhkzREUPmwC8WiWTVuVE4h8y8uBADZQb7DKMKFtwehgxrxGfTzx/aYlMJVWpQracbvT4O
	J+msaNgFiH3S0RieH28lkUXOQ3duCrXLP5/NjuZzSgfAjGEsznhofxE1UYFjdQa1IQ==
X-Received: by 2002:a05:620a:27cf:b0:7ca:e519:6585 with SMTP id af79cd13be357-7cd467237e8mr1424904585a.4.1747937788071;
        Thu, 22 May 2025 11:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7zzhGT/5VJb4RVwNUci3BKE6HkwyeAUZ42nE2+lAjreHoCnTgE4GqyoQ4ph1hnGhM2Vtkwg==
X-Received: by 2002:a05:620a:27cf:b0:7ca:e519:6585 with SMTP id af79cd13be357-7cd467237e8mr1424902085a.4.1747937787705;
        Thu, 22 May 2025 11:16:27 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06dfa4sm1119265866b.57.2025.05.22.11.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:16:27 -0700 (PDT)
Message-ID: <fd2b7010-7935-4299-9b72-e12d41014d25@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:16:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: qrb4210-rb2: add VA capture
 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-12-9eeb08cab9dc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522-rb2_audio_v3-v3-12-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4NCBTYWx0ZWRfX2Ph+iZHSmoMB
 1HNCHBWHB87oAa1z5HYfjd/byGdnvPNz++NDeP/9fdnGcR7ZcpUCHMXR/bQuJhhU92D3PzN8ls6
 yYD7tTlONeK72ek/c5RYVOgzGD4+oNrwCSKnEhMlV+UGbvAVLitGOr5WSOQPTZumrF18CTzKGZT
 qUA9EoiqqygCNSNOZ4hiQjq2zD616/P8nrwxVCxXUV1AcSxPBms9OZYtD6+NSV/U/opWv7cIR2U
 DgZFan17eDxtzpMKsnY441HHWVb93P/Vf7Bxl/cMHRx7TKwh6bBGBxiVFavvJueGQ/C5rX4AqZG
 PYL+WqC1z2BtjXn6E8XEQFyL7SHbQ7w1J4siGGsmCfUwk0iYyC7auiuIu/cw9LXum9VZuKskQrD
 fVdYa8DB1LtoPqy1Y3ZrNLHqnMcothgFfqviXm4UGXR9fhjpbnGH5prMZ4sMw6NB6bE1JDSl
X-Proofpoint-GUID: IiyqrC3-6mrC3i3hvNrc8fdFJda7l4uq
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682f69fd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tiHu44C2SuCey4_Rhg0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IiyqrC3-6mrC3i3hvNrc8fdFJda7l4uq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=941 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220184

On 5/22/25 7:41 PM, Alexey Klimov wrote:
> Add support for audio capture using onboard DMIC. It is directly
> connected to vamacro and txmacro without any soundwire interfaces.
> 
> The capture was verified using the following commands:
> 
> amixer -c0 cset iface=MIXER,name='MultiMedia3 Mixer VA_CODEC_DMA_TX_0' 1
> amixer -c0 cset iface=MIXER,name='VA_AIF1_CAP Mixer DEC0' 1
> amixer -c0 cset iface=MIXER,name='VA_DEC0 Volume' 110
> amixer -c0 cset iface=MIXER,name='VA DMIC MUX0' 2
> 
> arecord -D hw:0,2 -f S16_LE -c 2 -r 48000 -d 5 record.wav
> 
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
