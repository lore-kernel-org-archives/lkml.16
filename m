Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69578213240
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 21:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743543174; cv=none; b=uxNqPDKLuPiU+uljxp917lrA5vf5rDUkhkThHdSlZseJumpQhg0HzWMm2NL/6sAWhXcrEk5Oqx+Jx07NgJQunuCL0y0IcDF/eeaBpTmky4w3iYU+VFJGEA0hRKmrL0JWT/NTy4hHeduwy7heyTgY0UPE/a9g7JSUv2vu4Hf8I/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743543174; c=relaxed/simple;
	bh=TIyk3C4LTpXnp0bXnUYuYdIcIDDXHH9fq0JPyR7ET1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mp2HBEDR0YL9oNOVodS3Cvz0+I3OZa7KQSCkvhZ5Kj8DJXQwNVSyhtAwXE6jYWnJVLXq1LXWFvQRrbzPVXGBp/WDDKRIGtKFr9DKXZktj6PJ6eqkWRu5AC4ma+ZnaaoMOn/ssopk9bPl2gnaTsus2g6kX3qElH7YixscqVVKlwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2llPcuz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2llPcuz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531DeL5h007231
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 21:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mAmROBbxMpI635s6f1Qu59cEbx4hm2UkVyQd3iAFYzA=; b=K2llPcuzHROeWXDG
	92ZXZzxHcCMlex/orz90a3UMqEMqzscz3WvpDUzbQm0+cknEDaUJxTiyAZFSHKFA
	lc9suWuWpPwQX4Gg3CDu2puISvcbV/r9ETQrUIJ5Irj5nf1M/RdMDJKwutMYw8Hb
	SmmDgXpG7bDb1idLGGflBgMPhoUH4P/4+S73/TfrnerepuYfECiF1X+v3ceCR1eP
	rs2GcGLKMz2iZzKz1HbZxCcZmkT0+Z9/tGCGTnb8oR27S54yAXkmW7wpEVIoXzCq
	fzldgiSjmeBrdPh/uNkIccpyQHqAenjKMa6YNRLphBWTcDPUhrnuTbHMpaqXoWNy
	tPWXnA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rh7yh6jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 21:32:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ad42d6bcso152452185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 14:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743543170; x=1744147970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mAmROBbxMpI635s6f1Qu59cEbx4hm2UkVyQd3iAFYzA=;
        b=Y+p27qS0UulvBOqeNGIXmkwyWDbVTtFuhoGEgXDWcYApIFFFkAXd3g/owdcFjKYLtN
         A6lZeGhnh++BGNHzy/KC42uJbE5JNnvz/EZGf2Hcti0haNJSHrHShyEccFlkbKESHSsk
         hy7niYMUiOYSFGXT1gMvrR5Lnw937Hu2jfZyOOmqtcdPnXzFwc0KLIA0g3+AHhLHPpdq
         rP88nGEfY1VKxEQBZhwhbdvSVnA+tfRzQ9p/gqPWwrVUiWimXKv/Kiw+/s+/2ZA6bBgG
         DFMBrBkqnw3ed65MCyoF4db+fEBQkCqQptCAlTB6C5lbNnQXpSNhzFz1kCVPL5Uoz9Mz
         0YZA==
X-Forwarded-Encrypted: i=1; AJvYcCXNhvDulSu8oAbGfGk0qMT2XMym3fcUlNfp8C4TceYZ50PKIFPA2US5YSs8eg6rD8RM7REjHJyY9RHRjA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZhcTfHDjnQulczAwlPPeTESE3z6eGcR8vz0mnPl+B8GcBLwjs
	WQNRCOF6ujils8MKF8JrQQILQILcb1Tx7PzPTgazFrrGdHTlWv4fh7WOr6+Rc5RB4GqxR/Lvfxy
	G6VVQjOBkm4WHdE2gboVa5WRSSSbmqXsoBsm1MCNJA25gKBIFbwm0D0XkMz5akPQ=
X-Gm-Gg: ASbGncsRvu5ITqogOGK808f9Gz3a/2dekAZpiEpze6asYxYEA//+9mLH4Gx5T7n5T7I
	43ZgFUg1GRTYQO5Rcr/G8De7Ye7/jsXk1CoR4go7yYKEv25t7/xLgU1z8CrYPTsLpOwq02FTWMh
	+Hmt6Nf2XG4FakzEqPKikfDp/yZX3+5tdVRQIdNNNocLyW9U5QZFSk/YEnC4sSU7DQ8zWWtrBwH
	dCdVrKtfU7PcwsdOxQ4DAQ/Ch1bVskP7tgkaDPGcS/NOt3Yqr0RLTUDFxn/vThE+w4uoN8vJCha
	yGqPdwKykPbIq1mM5OMC8n40fhVsAso+0gyQ7I5m68LFuD6pxxIZweTFCHjgQbicgGvdpQ==
X-Received: by 2002:a05:620a:2951:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7c69073e0bcmr805793685a.5.1743543170209;
        Tue, 01 Apr 2025 14:32:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlTHtgkOBw9TQxd+dwvWeKCucExobX2TT78t8Y5y/W/QTvp2cSp6eDF52WJIU7vtQIU+kNlA==
X-Received: by 2002:a05:620a:2951:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7c69073e0bcmr805792285a.5.1743543169718;
        Tue, 01 Apr 2025 14:32:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b122sm816844366b.73.2025.04.01.14.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 14:32:49 -0700 (PDT)
Message-ID: <5917043c-9f22-4d3e-abc3-855ca84ea32a@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 23:32:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <20250317054151.6095-6-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317054151.6095-6-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IYWHWXqa c=1 sm=1 tr=0 ts=67ec5b83 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=yYI_cM6BSzGIY87TFkAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IvRIUnZY2Z7MH2kNEVBBJlfaH9xcy1fr
X-Proofpoint-ORIG-GUID: IvRIUnZY2Z7MH2kNEVBBJlfaH9xcy1fr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_09,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=945
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010132

On 3/17/25 6:41 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers
> and msm mics.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 80 ++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index a1a3df77ad57..5d4d3df6eff9 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -219,6 +219,56 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-min-microvolt = <3700000>;
>  		regulator-max-microvolt = <3700000>;
>  	};
> +
> +	sound: sound {

The label is not used, please drop

> +		compatible = "qcom,qcs6490-rb3gen2-sndcard";
> +		model = "qcs6490-rb3gen2-snd-card";
> +
> +		audio-routing =

Please don't break the line here

> +			"SpkrLeft IN", "WSA_SPK1 OUT",
> +			"SpkrRight IN", "WSA_SPK2 OUT",
> +			"VA DMIC0", "vdd-micb",
> +			"VA DMIC1", "vdd-micb",
> +			"VA DMIC2", "vdd-micb",
> +			"VA DMIC3", "vdd-micb";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +		wsa-dai-link {
> +			link-name = "CODEC_DMA-LPAIF_WSA-RX-0";

Very unusual link name

> +
> +			cpu {
> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&left_spkr>, <&right_spkr>, <&swr2 0>,
> +					    <&lpass_wsa_macro 0>;
> +			};

'co'dec < 'cp'u


Konrad
