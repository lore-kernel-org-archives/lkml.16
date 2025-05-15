Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD5E21773D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323307; cv=none; b=fHcqvDBhk3miC+Jk9XHHheAwlgHYRJPJUz5Y0eBUj0/aGjqgMPghoCQj4DSandIYlOkkyLZ1nhecKsDPtdDsb9yF4mAzX7KbXbSOvkWBs6Ztej0cUzmuXJ1cDIE41RSTHvs24POFoPz9NdcS7HsxDqrBpfuG0JjZ3+03DnuCo3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323307; c=relaxed/simple;
	bh=PiE+MH1cFiOpy6aub2DtWFiJcuOCWUKrQxaljJ2s49Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbXyamnvTmO6kU+GDLBdUCIJHWizA743wbyP3ej1oFxN9z1kZCaooIGW7VX9Lsynn101BcfuxDdVxnsAsVrEgh80Y22prrLjq70gyhRzlhXD5CbrTRPIrZGvEU/hE2UhQqAbVZcdEt13pnTVsQlwmSJif94O8T3rXT0Vc9/MN00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRTIPliF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRTIPliF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFC75020842
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yB/XQGZjAJwAICW4F7u+rn/T60dhMBEFnCYzfHzDX4=; b=QRTIPliFhSzpIgiw
	pgvEdtyT0EHBMG7dH+tDDmMdDHsD7n4u/QzeFYejwXxcFPo25g7APjxPWgYMfwCe
	LXMFPkqPDjvLT1c3Y9hjWfkheeOFDJ2Wp5OzhSu5EY/fNKkkBM+sW+V7AtKEc2L0
	yI0gouRmgTL1xl/owD9FEWLEfdBQdk9SUhhUidAnhRtqIiW0bgNQD0zx5m1guU7g
	bzGP5cljNX2dwsphn7r9OgWRYReL5jbNXqgYHubaGd9gkJF5vlkOD4RHWXUpI+Hw
	uPZ2VobrBtFCjJ4Jf9I9wlmJbaGXAX/zVzRV8UKKkwZKB7LU3jhrtd/FdvTdfXfs
	An03yw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew6jqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:35:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f5466289bdso1106586d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323304; x=1747928104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4yB/XQGZjAJwAICW4F7u+rn/T60dhMBEFnCYzfHzDX4=;
        b=SE+VIFmJ4YbTJY8KIWT+e9d63UBJAn6JrBDPN+RKgACq2PopRrWx0Fh+/ZoVj3jyxQ
         fsl3Raq3LQqIJCmAbayA6FNMNoa2Cb3prT1u2mn4bSt4CcLQptFiH3nUQ++zLpQkbVxc
         eTJJuDEPm/G8O+OIZrnZ2ffopeFfAVtKl3iXQiBu3taxheonHrPJ1ewjxDUAkip4vKX3
         Xl8glP6OY+bcQxTMDtwCpFMc3oUBuwE10d6Lr6mhaJYMNIlhbz9CE06nEEZubg+bqU1v
         HBr0RqzYebJ6HXZTitZoEhd7x7BgnVt5DjwhZGGDqC4fiOI5SW5vb7E+dZ4w/q1yyIf6
         HDhw==
X-Forwarded-Encrypted: i=1; AJvYcCVEej7pyNYU3ip2J8RYZjdoffdDtYB25kNE2GMGEuYHStFZho+VaNCfj2kyJbjkyAAeJIZoBicQHANRG8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcUZF8HS2WLIhpgHpV1R8rl0lxOPGGpJegniJ3pghGGadcF+DF
	Q2nLU3Xv5oWcUYWzLW4Hau5no+ZK6GfJYRNOn/4ueIkcZ8UheJYkW29L8wGCrvsKbPaR8842KoS
	wfoOaG/M+TkB49Yv2Ce8RKTE34daPawmPxze5hmzTr3Syajmce+qDTDCYFPePxSXeoHM=
X-Gm-Gg: ASbGncuerETLM1MsnIyCDSD1G/v1nRZ2mBkm2KNo7hscf6+pegkdz+IwogYH553rKN4
	w6VUMSOELglua8qn/USaB+tn+QvXwf3v+PEOrjEWqI7qc6yiEacfoBcPTrfKZv10QIjym3SG8J3
	Rmwwrj+YaEJq+rT9CptJY/CY2C9zaxxh1AzR5HpPgHmNgMIoKGuyxD/vphxW18Wg+Sb13LYvh5y
	3pF82A+v0R7D7GEM/Zmux6GMWC9bOoRAGC1+IFyMpRiebjWNfDWLZ3046v0XdcXvfjXD4vhqy83
	aOTH1gnExJ78m02LI4V3nZJROSIA3mtfZHxHC7lQF6uMmXiQnPP3BvSfzb1jYA4Zog==
X-Received: by 2002:a05:6214:2403:b0:6f6:e6d1:40d8 with SMTP id 6a1803df08f44-6f8b08c7856mr1053756d6.11.1747323304326;
        Thu, 15 May 2025 08:35:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5GtBANepnczey5ulcTX+FlLpeblm1J2dmWkv5sgN3i5CFmiKb8SQIzrnodlg/LcQE6qf1Ww==
X-Received: by 2002:a05:6214:2403:b0:6f6:e6d1:40d8 with SMTP id 6a1803df08f44-6f8b08c7856mr1053466d6.11.1747323303917;
        Thu, 15 May 2025 08:35:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e637dsm6880a12.43.2025.05.15.08.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:35:03 -0700 (PDT)
Message-ID: <2a49a457-9b6a-481b-9b04-c9747ac67003@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:35:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/18] arm64: dts: qcom: sm8550: Additionally manage
 MXC power domain in camcc
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
 <20250515-videocc-pll-multi-pd-voting-v4-17-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-17-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 37eHdzubmwvMCusqiF_TGkFjBBqSi1iI
X-Proofpoint-ORIG-GUID: 37eHdzubmwvMCusqiF_TGkFjBBqSi1iI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NCBTYWx0ZWRfX+O3lCzy0Ntxc
 gd/72VBanyC+TiQBZstzWpqB1ganIoPd4oYemH6TxD0Zor1t2c9rKpY6CP8m15QOO4hU3SBU2ch
 UZj88r+Tfl1ux2ulTwwmNb07tVZ4dQ5Fvzb6RghjU2WR9iI/QUwku3tXAXdfN2ZRjcQicZqehM3
 WMUTUReuAQNezX9kT2akW+eKoy6cVC2y9QeXa+kYi8BPFdQBnW4UzYlFJ+Lwmf27u9MHGvMQdb5
 8TqRJhzEfQSjheRQA3kd2ItMg1Sb5zSNnbyuwgqk4gFza4PnF4u+QNyWZhoT9GFfwT7czXmQK8w
 RfmnKozXLMAxj7lZ8e6PUd9pqFVlRc5ilKbzeows0vaiBE5K+f7OK/Xln/aUEp1lMXEp44vkzAe
 u1jBwZh7zAFlPmEV4d4oVpBb45ujEXuiDQT/PxrPy/xJZ7fARDXLFsDmzniJwrjoGsQX2H9a
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=682609a9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=9YvV8F1douotiZniFPIA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=632 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150154

On 5/14/25 9:09 PM, Jagadeesh Kona wrote:
> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8550 platform. Hence add MXC power domain to
> camcc node on SM8550. While at it, update SM8550_MMCX macro to RPMHPD_MMCX
> to align towards common macros.
> 
> Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
