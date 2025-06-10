Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007AB23AB86
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560938; cv=none; b=Sl8MZuM0s4Q6tO//Iej/8bw6osZu0JRoOpjCAI2bkYk0K9+ee4Muh/TixPfo1pPVrG11fXcWUOUtG1ta8U6BRqs0JkDpt5l4cmCcljIWK+Lqf7V5kaoqz5TYoSxhvmfa6ooJ/sJOhD4cdE2x4h7iv4BYjMPckptFCEhqbg7MZXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560938; c=relaxed/simple;
	bh=evfZ6g1FYwwlpCeQBDLuX2LOv/1nyUFtLivVJP8bURc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dc2YEh7VkVCH6MHQaXPs489x7v+yb2JzJ+Nszx/toRKg4dKTaSPGrdEK0rHD4aEXctWf0YRom0Jf1xeDzpVk2sbz6kPa5gdUPV06fjFJr8LrIURd6QDeseT8EKOPw2pazaXD/+MOI0WBQue74CQAb7MzaZFwiyKZ4qGHDsZZItk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCkZ/GeY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCkZ/GeY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9t1KI008107
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1erattER2EyDtlcsiT8to8amhSAT62hbSa4lAh3IJM=; b=BCkZ/GeY5eGSI8p6
	K8aH8PRZnsnzqX+zl5WUM4d9MxgjBgI/aA2PoYMfx3zcuDS2BPzVkwbhMLlc7Hbs
	tZhGOAcGhecoujv0poqQo5VYwuxeuaGTFWYrMZGnRTn+eA7ImT3ybu8fqyMzfoVV
	db7nyOfQ+GZqkYNv2M+c+ieRLdyYfqSn5HehXtpAtSedO3VjGw3zjc7Mhe3UI30C
	KhHVo2mW2mxxZ3N6ceBVIHH6qJSGvuvRgh+D+pSTSckONEethNOiyfzMmA+KORvz
	2/Lw+2CdLBnEngpH/BSqd75pkuxg6RLUUEpBGLz917x+Y1C5zR1p4mjmEIExOuhu
	PSgjJg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d121m9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:08:55 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-60be791ca09so1329328eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560924; x=1750165724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1erattER2EyDtlcsiT8to8amhSAT62hbSa4lAh3IJM=;
        b=Xs2D6G85em/pI59TFcaqS8zhnLx3QBOJfdmfGnka4NLzLRqQd+nJ5CId7U19n8v3Zo
         bU0qdTpzGva6iltQes0sAqZ1eZBPq9IdH8uAZwgbUQKaRLRvQhLs19CadyWmoHEfF+9b
         FyIp6zNqEMELmkdTeiNgWuIFmxlJqPxPb183DElseseqFDOubmgGjufrRII5RFx0vfo8
         CiPrBCKMom3QA8wDE1oD6ITaZYQCD2Ta+ZZgM5YKZNTqA3imlE153O33gLXi42pALhhI
         PUhjx1nrxPPhHgd2lAU6MHP0w2N0YJySVEFc2hbcTfCQTIWdbdja6oZbbk6/dQfU/gDR
         QYzw==
X-Forwarded-Encrypted: i=1; AJvYcCUsvSgcL1r5AYG6eJjQ4BkYUo0NFmOTBSdzbtpfmiRoWVc4iwyGteWWhEsA8I4BqgcmPXUnonBUck3kclQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvfQTOCwC46XAVHKDwg/GSmS1C3Po83DCXB0Xo8ews8DYd89e7
	Vk9ChNhzkEf6hKnu16KWqm81/QBrs+Vk1VGIN2ztU67+wTdyPAesq92GYE5C+mFPlGVLTfcZvlX
	xRQTrLW5iYORK7bhg0nRg9kPdA00afJrGP77WE27DdrqPViIAn3yKoxz2X2v5focqkYa4Z7ZcxE
	U=
X-Gm-Gg: ASbGnctpkX4PbWr0PdpazsVNnJhDoWTj4Bi9rblf6CPDrPQDViB6ZLpYpLKBwzZVx5T
	BeFvbuEpuTo0MA+/VgZJzEsNBr0920N8W1XBEULIldkdxJt8xvTFHBZnqaUTi7OMZqqxz4eJKPR
	4M60WvFwS4xt25DGXVhnE/dZcBdLrC7fPJ5jO0efNP+VOe5GSpQNKFit+45pNP9AZTspo08VnUr
	8XWmtjCHyTY3zJZB3tnZ5s99GoRWAr0KN+VDNayBB2dbHtEZQiiQcDoE6jBPJCBud7rmpDHAMpW
	sFcQjURXtJgAC2siEDXzyYNAamtFoyPyRhsF9GkuKW8sKILuRxf+Fx4tj951Y22Ltd51dtgciGF
	S
X-Received: by 2002:a05:6830:618b:b0:727:41d9:bcca with SMTP id 46e09a7af769-7388bb22c72mr4740411a34.3.1749560924552;
        Tue, 10 Jun 2025 06:08:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHumeK8s6YcLMXzmdaaLzgYlUSa+GoLCZFmNnBzQDlQdOXmx6iMWgCspTl9NFPTRxuzi3p5yw==
X-Received: by 2002:a05:620a:408c:b0:7c5:79e8:412a with SMTP id af79cd13be357-7d331c39c85mr858426185a.2.1749560911969;
        Tue, 10 Jun 2025 06:08:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754653sm718680666b.20.2025.06.10.06.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:08:31 -0700 (PDT)
Message-ID: <f123294b-b944-4723-bd74-713970468d51@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 15:08:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] arm64: dts: qcom: ipq5018: Add tsens node
To: george.moussalem@outlook.com, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250610-ipq5018-tsens-v10-1-3a10a5a2642c@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250610-ipq5018-tsens-v10-1-3a10a5a2642c@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 72SyFihBWkOnIQADtyeIP081j7z1T7PL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwMyBTYWx0ZWRfX6vBaf5b3ScdR
 WtBkcnfiFHRgAFyaMA43ShYMemR2xOWU8tF1rcCBVlC5OrHMLGp3viGfPaDbxNtghgAVEJMCaVs
 yvQ1dJe2AVZk63wN7T+zyT8ZnNUa44uIOLBQ2V0EcqbKdUZdpbOLrjzRZ52EjCUOaYaakvAazsh
 J3OlWXD+TfSxCdJSQ8j5uEEkWYEghP1dDlA12NsmkCKNxqAuveeSIXd5j3zkQQ0U8tPeCIWCkUu
 MhsolNO8rkeSLE9sQUEQUniDRqImEG0NiM3l84VwWHbzOuM3kedL0BmB6WiRfHB7BJD7rIkDwkK
 we12XFX5gYGS8pRFDSp8hWEIxZT3Q/qez4OGWyNHPWEpilsAhO1WBiaPOkKr7emsOm2EmM+zMck
 1KGnNl9blziQjDx39wO+p4Xfo4UMs4u27o7e9edlx/U3F+hl5vF2KEGSnJdIzliiCDGFgCku
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68482e67 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=UqCG9HQmAAAA:8 a=gCHPDHSnq_wzHoAtv_MA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 72SyFihBWkOnIQADtyeIP081j7z1T7PL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100103

On 6/10/25 3:03 PM, George Moussalem via B4 Relay wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> IPQ5018 has tsens V1.0 IP with 5 sensors, though 4 are in use.
> There is no RPM, so tsens has to be manually enabled. Adding the tsens
> and nvmem nodes and adding 4 thermal sensors (zones). With the
> critical temperature being 120'C and action is to reboot.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> +		tsens: thermal-sensor@4a9000 {
> +			compatible = "qcom,ipq5018-tsens";
> +			reg = <0x004a9000 0x1000>, /* TM */
> +			      <0x004a8000 0x1000>; /* SROT */

Please drop these comments

[...]

> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&tsens 2>;
> +
> +			trips {
> +				cpu-critical {
> +					temperature = <120000>;
> +					hysteresis = <2>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		gephy-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&tsens 4>;
> +
> +			trips {
> +				gephy-critical {
> +					temperature = <120000>;

I'm not sure whether there's any firmware/hardware measure to shut
down these beforehand. It's better to have a software trip at 120C
than to not have any at all, but you may want to try and find a
case_therm or so thermistor for your devices..

> +					hysteresis = <2>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		top-glue-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;

0 is default here, you can drop all such entries

> +			thermal-sensors = <&tsens 3>;
> +
> +			trips {
> +				top_glue-critical {

underscores are not allowed in DTs (see:
Documentation/devicetree/bindings/dts-coding-style.rst)

use a hyphen instead

Konrad
