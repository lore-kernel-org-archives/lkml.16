Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC67E21A454
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323777; cv=none; b=fTKScKF5QcWnEaHWxB2Q9qb3kiKQGlDiKn5fzYvPX4uOGX94wu6+lSw/Z9hmlBHSzjddR4i3N8+ijPtUQeLrw9HriTNgb13LqNEJbsO6aa0+2X+OBnPfCS0mAH4u1naDy0mpvCduSYgrbk2zj/MtXyYfoWuZaFl8zhE3sQ6sHII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323777; c=relaxed/simple;
	bh=JVbvGVI7vr7SKk/Dz3SUZ0JXpDRQsX+JcZVvFlgYb5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4Y6JW3j+UEHx6MUKCvEHIs/aGQByoU2p8DREEulAqtU6U003lDqLS3kNK7n/6nNYKBfymwx3E1G5j29FshMJU05JY9vNqm/JX52C7JSSF833jXMkX3l14xAqESaD0IAzUNmEDk8EW6dbOhrTV0Gtk2Oau/fWUuOzTKs+vuZK8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P78DGP8h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P78DGP8h"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFC7p020842
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XA2Ckgb1A92R72wK/xiF3TiinHUJne130PivAkUoja4=; b=P78DGP8hI4UwuJsM
	9/31wNhbDcv4OGgarg9AGfZR9+i6tbOYdRa3ANCne39ds6UHtjWdnZJVgjfwbC0j
	SPMXPa/iMqhhTGQiZrHYKHAlyfjOq+Bo7kRXu85gOgCSEibkA20rdmGJxaRNARVc
	u0o19mrWhUYdiovADs4v6PxDVIc6vzx8vRqgRAVs/73pft0FjqpnOdTk8DkYVxsT
	Y20dwHxi9urOnzI8hKTBm61SQBxg5j7fIqdfKQlDF98DlZ/rILjHa1i7DOv7D0XD
	ahlblFFtaBI0mr4ilXdNbxpHxLjwLb596XZMCY+/RNY1esLMonq1KcGTmxcHYJHV
	xcfq1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew6kkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:42:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso22817285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323774; x=1747928574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XA2Ckgb1A92R72wK/xiF3TiinHUJne130PivAkUoja4=;
        b=EvB6nHp5W5q9a6jOS+D73gCjp912IJV7iZglw9uYVQkGdoLzXuJutQDfvc6Jy2p5Ht
         3An1XqVDXxTiSbVMrvKviwQgoClihlfhVbHPADSWGLi/Y8krv1Fnio9X9kqzXza6BxN1
         DIW4hY5Nuu9xz++jgx7DeA50Tob3uX87+77DRf9mtraGkrx8cIpfTcD9MQfDfI5dMAcs
         xto+zjeroGVQse0i2+k1KqxhJ6cmqTBAiPYgrV951vuTTj+HjhbeiBoclfOpdeS6KIcq
         vKR7wi2K9POFzJcrqhwdZRfr+dYuS/r7olN6liegB7yrY8dFZp4Z/atRngq+VXzEXTdE
         OxMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWItvBrdPD9yJFuICUe4raOnRHAhv70MQVXaz9+gd3eyZhLraP1ROrY/OmlX26rwod/YJqf9b5GZ0hW79Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsvoAAtjxThyGZepTPx9kz57qNz7Z3Y+n/QJKP6i7EEFddjYbk
	XrnqvHIXOG0B2M8ixHsVgFxhIjBzpLKS8lYAsTeYPmcWrHk6nZEjS5MepUzcoYgXEikIUWz6M4b
	ElI4Uxw6WJdKwEIrGxJ/VFf92KMxdZppwBbNIufa1BqUjINuakqDp+F9s4h39d9M=
X-Gm-Gg: ASbGncsaNK4b+TIP+W6co18wmzRDwHBbYxPD5asqyuFsDX4GA8Q4Vshjeya//moocpp
	xUMU2BDVDP8JAvMIQsf4bjsgDqKxJKkxTI788S/q/FVtF9DB9eG95R7Ogq+d4r8jB/tvBUVWX5v
	qF0fdtepdVHR8EMgycm2ZV1jR95l6AJJLqar6LqvNyD+nRJUzFuOI6Ul7pHNFQnfXV420hyY6bA
	e4HtHwws+xYmEGsdqSMlkKdETKiAGYyWWb/Qj9ppdVuP+eF+7ojxzFIRj853PjWBNRURoEcokdy
	hsTXg1eeC58Fb+yZ0XDmluNOaBkh560dA2Bj051YzctOQUfzPtT+bUg+DU9Uef/a0A==
X-Received: by 2002:a05:620a:2811:b0:7c0:c024:d5 with SMTP id af79cd13be357-7cd287f8075mr543661985a.8.1747323773893;
        Thu, 15 May 2025 08:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT4fxs45M5zKmI/an/xseNIdZWlRHxwm3i9EJcr/D08ltlthN8UWO9YUVu81PT/6ZHnHRi4Q==
X-Received: by 2002:a05:620a:2811:b0:7c0:c024:d5 with SMTP id af79cd13be357-7cd287f8075mr543658585a.8.1747323773413;
        Thu, 15 May 2025 08:42:53 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047c30sm7074666b.6.2025.05.15.08.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:42:52 -0700 (PDT)
Message-ID: <7f167ba1-5367-49a2-8d00-08fe7a44a022@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:42:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/18] arm64: dts: qcom: sm8650: Additionally manage
 MXC power domain in videocc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-15-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-15-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ii_JiaFKrlbsHkxiIv7DyP31fCmlpQjp
X-Proofpoint-ORIG-GUID: ii_JiaFKrlbsHkxiIv7DyP31fCmlpQjp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfX2dB4qmEwpHtZ
 Z2hf1q11bTrUcs60Vqj6DhkJLp1RVR74DMsYAJTW0FXatcNYmMII/1O+otIEwQtEiJIU5N3KuBl
 +Y2UwR7wDzsWPtbDV5M8bBEIECOIZrypJWYa/Zsb78ijnvA3akTWXgClLvu7HKeFYzR2dzAy4rd
 9p4u77zeNZX+E8sYNdw1HiTBPwP4HC2aYrjWQC3bPKtJgc3Ykm44D/FHHxhou3ehvTEK+tpzNgU
 6Qe/yQzTPmxW7C9RgS19d/8DTym18YgWGXtCP2wcdz3xDNepjzfMSrxZ/t9HOTjn/6IjNclKA2n
 3nGz/Xv0hcEdCU0+8G8TRDcjbxZauS09Sd1eC9gpAL5M8grybSlt1IO27UzRN8lL5dRnVYMz9mf
 RRMdEc6lPJ/pqA89SczIsp4kALmKwtGeJ+Ia2pcrrMM6o/vP8M0X7rcNzfcx3uSAhFvA32rU
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68260b7e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fvWm4ETZ9MensVEMrR8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=727 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150156

On 5/14/25 9:09 PM, Jagadeesh Kona wrote:
> Videocc requires both MMCX and MXC rails to be powered ON to configure
> the video PLLs on SM8650 platform. Hence add MXC power domain to videocc
> node on SM8650.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
