Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32331E2834
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745875893; cv=none; b=Ucf56TPmerv2166mHesA4OkereEBXgVr6VCVOkhuhkLWkfXQqtu7a5oB7CpQbHasnCoRt1+ge9OqQyWeiaNy6KNto7SFJhM0l8E4mdGKWv8La8dyvWCJJt18RhIC6ZPOqoAIj+S3h1dzdRw4UhwqAA8IV59uAjopoVcTSdLPKhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745875893; c=relaxed/simple;
	bh=1uQ1p9HChNwz5v+PF4C2YcBZe/F9h7GtadiTffhnSMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRFUpdR1Hbfcw6ulA7IOTItBs8uxlAVG9Fy5L/yGTdOPPMbDBe+fsn4qb7f7aetd4PGslHOOFk+TXjnu1SShBnNgetpzUdWbPy0uHZFuT8y4NcUuM/RJXrqWRMHyhgClBbt9eUDhdvH9gDFh0u+MOu4IrIttgOvq4EqRcGiMhNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKCocxwV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKCocxwV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SA5156014528
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	koDjRjQqH2to/vO+qlVb+RlrUwtA9Ktaqvw64q5jU34=; b=WKCocxwVJdi83sdA
	NZE+FOJ/vswHygQx6VSJL5Xx1QIlHd7tfYTKDSlBo7jPIAQNu7lcu7ceqtjrGPY7
	hlUXDxUDGpw1SdievXxOqfI9TDdux+eB0JRRKZGPS7PfU+eZiTryj+WgDFM3Bit5
	k5e+ySLioBldbaOncUMQAjVRU3/S9PCm+63BmrRjVKog3q64kk4YvDo/Z/NL43+T
	YxsIRorF2FR7X1LoYUFvgkC5LPEZG2lAnbZoXv76rGJqDESzkeafaVslOSa/hh3C
	bhPVAhz+03r6+2mJ0Uz66M/DZWAHQLJMV1eXAxvtWDARMJcGneXO3X7dTMnobroa
	Er8syA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwtd1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:31:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47ae9ed8511so9929461cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875889; x=1746480689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=koDjRjQqH2to/vO+qlVb+RlrUwtA9Ktaqvw64q5jU34=;
        b=Azg0s9gxUM9ph0kbii1CCRCDh7u/IZr8q22OY6ga3jk/i2rtlJoO2I4mG8vRpOredo
         UBDWf+D5LD1A6sPCEJ7K+DgY/Hi0cYSvPWPBuJPwVwyUNtlpcSjcdIQlzYVxVNQANPOx
         JlH3MjGVov4DB3Z/pLbv9oOpEdqBrlxf62J9mPkYXAcMS0+EL5Z6IYdavAqd0bzIaYmO
         3rCeGqB5LLZwJ7v+j2yaGD6MBHsSPaTk4UOPgI4bW0nQr4qxajxL8CvwwO6xoxTrtVKm
         E7+Kt9ri0n8UnQdMyr7twSaseAZ/88f5etVIdCd+TRVDnq7x2cCVml4yOMLeIdYNaI6s
         HzAA==
X-Forwarded-Encrypted: i=1; AJvYcCVWYaY9RqYLrerpcKK7OMQuGYOQ938jbYO3mWOt57OzFBTC5yMFsYNjowjff6/G+534HxeFp36sgfGQF2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXusqzR1oUcuhdg8EG2uHCzcAsK1Lss/2EL1XEMI87btED77c3
	b5nf7CdYAgyiWTW0U0T40L1YHi7lJjLnZ3OAjghMPMTTtk4aGU3UNFBiU2nojkYtewoygPWVq1z
	d7dh7uspy+IrUwcZnKaCuC+U0J2NyfLxJsCVm8ctsbF7KGdwIlBRN9xBfl1bJxF0=
X-Gm-Gg: ASbGncubuOvrqFIAd18ghbUwFaXTgNw/LGut/A2x5selzQObmMLQ8QiSKmxWnX4aVml
	uOejLCKc2FYm8yN8DwRZ5mf9gf6jxoo6AGm9kqzv0J6SD4RJV21vl1dQLst9S9rP4UdRVxE+P2r
	YCzyAczzzemdhbNIpZGPM/UjnTxhlBz43Jb4iOJidX5LyM2TF0AE8uXU9w+WfZF0pZmII67EWN6
	ZRBMh3nU5uF0gBpC3aUDyx4d4NJE8eLjkd/HamQRq1v6FSoA3fqLztxVDrG9d6UO/0YDyUivuhS
	CnekEzJlXjcx7sPlFHwv5lASmPNPpvav9f4Ym4CwO5a3v2TMLrCyhHVt18Itt0WgTA==
X-Received: by 2002:a05:622a:24a:b0:47a:e5b6:50dc with SMTP id d75a77b69052e-488682ffe52mr4176181cf.10.1745875888949;
        Mon, 28 Apr 2025 14:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENWhwgKml8ygNyxQTKheJZ8sJhCkDikYrPeQpN26DX8AIlzvKeWw7xfymuBifBcbXQUgqFqQ==
X-Received: by 2002:a05:622a:24a:b0:47a:e5b6:50dc with SMTP id d75a77b69052e-488682ffe52mr4175951cf.10.1745875888589;
        Mon, 28 Apr 2025 14:31:28 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4f841fsm682105066b.72.2025.04.28.14.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:31:28 -0700 (PDT)
Message-ID: <81205948-ae43-44ee-aa07-e490ea3bba23@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:31:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 1/4] arm64: dts: qcom: sm8750: Add display (MDSS)
 with Display CC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar
 <abhinavk@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2nw02oJT76T6t--3EtjDJa1S2vOPTg7-
X-Proofpoint-GUID: 2nw02oJT76T6t--3EtjDJa1S2vOPTg7-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3MyBTYWx0ZWRfXzYtII1ywcyij M3SJ529C/GTIU/U/mpuloysnMQB6Ckhevq3Ucp/G4/9Y6V6hR9ehzxpvuMdWpJZWJBO8KdjULTA gKumPnyjY7DlrNJ89PmJ+VLMmH9/E5MI/FEnuP3b8AyLfnr1obpSzVBpJ6nqw5Y18yH3azHb4Wp
 Or2gem4iop//+Fo2yh5X9s+F0zpMqP1YhZeOXUhj9BhztKXGr4fZwTynC1tIOfupB/iKplJ4/a+ aRMz/XUsIgZrCVnFN4l7O6l7WPI2WCbDvtz/FhtxF4uKCiCmPI4rkjktTekPiNRD9mCYZdrF4qx vSow8BHWEABMEK9CWagMKIAa9+TutwwqDRQ1DlDLc7h54gIA3/8uGQujNMr2Sxhtcg7ttjy0WlC
 pEm4fnVeswgnksRImj4FQiUylBSRDpHU56tV9L11XrGZBV3oPcNYF84i2xoiyCPGsa+tHKjE
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=680ff3b1 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=PLh6gWFcBclqXqoiQUIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=769
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280173

On 4/24/25 3:04 PM, Krzysztof Kozlowski wrote:
> Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
> DisplayPort and Display Clock Controller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

[...]

> +				mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +

The computer tells me there's also a 156 MHz rate @ SVS_D1

Maybe Abhinav could chime in whether we should add it or not

[...]

> +				mdss_dsi_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +

Similarly there's a 140.63 MHz rate at SVS_D1, but it seems odd
with the decimals

Konrad
