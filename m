Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8781917F9
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748716331; cv=none; b=fOUpsVaLwmmUq6HzEReBqLR9ivGI5bm/5lADCYONV12PuSrOO4vOOM/Hjlklm333SPtm+M6PcYprb9IkQvZut851sb3NIQe620d7BY1PviSEupYfupkgODNGeijJ03EOpuRY3h6VULikWxpR+qKSp3pp0uAyKZSwK1XlZBqdV3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748716331; c=relaxed/simple;
	bh=PiF6hqUws/uXK2z2qLpJr3JuiGcUxwlTUjPFuJp5SPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhsMGLoTuPSLGT8KZY4Umprezk1meuPXPgGw6Jgf2/3WBQIh8PeWKce9xGISu5ocfX2m7y8LMbb9+EDCtrRy2DQewaQfcNDNjOLitPN+9n3npC6SYsT94JVYdkJtN2P42eZXLy4N2QyMjJNeQVagcR4inoeVV5UBhuakCT7/27M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjkU/YuU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjkU/YuU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VF99eh012930
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 18:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZHCTS02b52liYmEagWUc7peB8KjJ4JVv3poNupxDf3M=; b=SjkU/YuU2tgu9LAc
	lpXpv+zCBHDyUnast/fSqKYDa1PdEFc3KcOPd4NGYFlWIWlBSEy1/13XQwqVGbgX
	wGfch5cuXzyrHHdj2i6ULQJrSfkZ845+Q95wQHu9EPxhBMencNNVTzIu3sFpD+q+
	yc3gfXM7vH9galL04CfSLwF/j6hlKMnVKr/wgYXzFIJr64GpF/vs7kqaZEL8FRiM
	9p5H/SekzhMDBnDFgsY3GW9XIrVFJH3iW/K7HJAVX2DKEy6+rNu3SaExMD6l94mW
	mrvVR4acb2nY6pr4RlorNreZn6fZd0jjbEjqkdPfq/Cr2SJrrat3dUXqAZUqXx6/
	PIWDFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytj0s5yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 18:32:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09b74dc4bso69174385a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748716327; x=1749321127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHCTS02b52liYmEagWUc7peB8KjJ4JVv3poNupxDf3M=;
        b=WjhmCny4uQnF/YHrtiCqzFRXNin8QohRMHCasdhmTQBscXFjIuwFoy4WsScAmdY81X
         2hkMiOB5UB0QrWQYQ8dzMuP2ONv1lNezHDzdALGqlCKu6c0hjmtM6n6Gjvfq0X1fcuQI
         GsckkgGSLUyjoSGkQftErVg1RFvAWOxB0C+LjjL0eGOB/LVdiohQ9Q+liLpOrhezKiSS
         QnVniIl2el4HTwfLtAlD3mLZHxGvyIYrpVG+tPlomqzFUy2cQshlv3PTMVWz5guZ17hq
         qNAA14iPZDXKSKuFtQBaV9BZ9sl80F4BaH2aF7WYtrRmguKlC4+PB4nznbChQnitb5AT
         +Zhw==
X-Forwarded-Encrypted: i=1; AJvYcCWn+PErbOyyZSh06gwS+WDGZQ3gxsWOdVg/gsTO9+qNSW1EQKro/LT04Tl6nhJ9pw2mxWslqGAKVy929Uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaLJSYN0BSAHGaUZ3K/q7WaPbYNHxIBlVMIf+ZUSRSe/BtXZq8
	VMoCXUf4Q8Wc7dAJBiZPbKeQtjCU4+hMX+BfP9E0BLfzPXFI0aMI4asOb/1lE5FFKdwfP3AZTE3
	78zOx9cPdrDDtWgaVe6oZm1lF1uQVNgXZoUiz4eM3C1oMWgAH46t+/cTPPDh50obgLwg=
X-Gm-Gg: ASbGncvbDChLUk2lMRO+J29+zTjIuEJnkV5I7hf9Omi0rXBxyTPjOwuH0mKfTxlNDhY
	QTTHTevKJRsJb6YYEXCwFHTnkLyvakyvyfmnUfYYW/cvmO20PABu0SnR4PzCs//VAvLOpMX62Or
	a5pD9as7kMQNWZw1JHN7+u2gYkQNZhc5nzi66S8L4bF8w7PZdiGfH9cVc8D70fa0w+q7ZW5ez40
	WXntBy4uwbnnTf2+mvhbrorNR+YHNeRTKFA6oJUR+UGIOlVs7L+l43gc/QAaxEBXvwSQhjayrWG
	AYm0oxUh37jCSaLjdfzvBTyDe0zmZPjuuayiBXDS8IID/MFUKEMkpmkNou2D2/VoOQ==
X-Received: by 2002:a05:620a:44c1:b0:7ca:d396:1460 with SMTP id af79cd13be357-7d0a3e12576mr385235485a.14.1748716327487;
        Sat, 31 May 2025 11:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKHQuo7PTOJi1tD+3r4vH4UDMjXZMCtq0HBjSd2NTJ1pkGxJ8G662rVF3hH5fenX9J6ZKNqg==
X-Received: by 2002:a05:620a:44c1:b0:7ca:d396:1460 with SMTP id af79cd13be357-7d0a3e12576mr385232685a.14.1748716327088;
        Sat, 31 May 2025 11:32:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82d773sm534600666b.61.2025.05.31.11.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 11:32:06 -0700 (PDT)
Message-ID: <14492412-d340-4c9f-9597-39219712c0f5@oss.qualcomm.com>
Date: Sat, 31 May 2025 20:32:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] arm64: dts: qcom: sc7280: Add WSA SoundWire and
 LPASS support
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-4-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250527111227.2318021-4-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDE2OSBTYWx0ZWRfX3qGA+Ktv5KiL
 YkVYwz97gbV3FG68jwkF+m27g0fTGArGiUdjr0xC2nWA/twKLWQJSBs4ZvkO8issZ0LvtNhiZ/k
 95aQWIXsZo61IeDaz3DuBZ/ruYH6CqKNgrvoTjHSKHd6eDfVJCPqhSh9/ZcNHNRMvCFZuPCAROd
 5wrVYzhdRlRC1+gDNADD3qBWcbrXPa6pR3IpUVSNp1vUFLAWzJsMkZFlHlcpzyRbINch/nTeO08
 3ZU33//rxc2Zpav3ywhCdO6zkrYkAJtZp/hKEfr5DUmgtB7YnNb3hJxI6WwfnXG2htJTZr5nfh/
 8g7irhvu2BvXwkT1DGqtpqAj0NJAtTPuvR0Sj+F53fLMapoTJKOrvzknD1bQhKIjy15wwg7fjOZ
 hKhooEueFitpiG7k23y7mM1jAwvKP/2Ky7hTTS9EmTHURf5LVmDo1pvjCG97mJCosGszJqW7
X-Proofpoint-GUID: GSzjSgljSA3fLNvk5c1O3H_qNHRhON4r
X-Proofpoint-ORIG-GUID: GSzjSgljSA3fLNvk5c1O3H_qNHRhON4r
X-Authority-Analysis: v=2.4 cv=dc+A3WXe c=1 sm=1 tr=0 ts=683b4b28 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=RWuSP1-prhlrjYyZVaYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxlogscore=926 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505310169

On 5/27/25 1:12 PM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add WSA LPASS macro Codec along with SoundWire controller.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

[...]

> +		swr2: soundwire@3250000 {
> +			compatible = "qcom,soundwire-v1.6.0";
> +			reg = <0x0 0x03250000 0x0 0x2000>;

0x10_000 for size

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
