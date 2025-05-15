Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416BA1F7580
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323529; cv=none; b=YIo8wYrcg9rROcY8IDKfjPKi0RGg/uwgQMGyoWfpNeOrLRBdzXCvXmipRoOq9qhkeQboVf7L9wmYX4vJOreMds/q1dVxY1lM5hRvQt7I/ZIWRkglL7PEz4UqtFPB03bp4F7kSK6o0SXFLzKA78oHEt18BV8OguQG+UgyPgayx0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323529; c=relaxed/simple;
	bh=YhjkVdXvtRWQPDDaVu+qCIt2CPoR+SqpafwJoDvxh2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eMGnNKvw60QGRTXeaKu25T7Ej3pVEJLBJzCsjtuzTLWw82wp0OFSPpuoRqCDyX5FGP//PTF83lYaP+WE8ud2PQ0ZmDa3+GOtfyBvjk/AxKyJdqXeCkX9e8Mtl34tZkYDw7P0SLZnsJa3IfOBiypAd9nbfDxpCgIoHR5/EtTnLDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E99OL5Kk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E99OL5Kk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFWcM002119
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3pdbEuEDP4tcdmm5ZtqXD3QPjEEiKtDhYgXWKQaq6K4=; b=E99OL5KkvoXjEGVA
	dQVWygwR+q35M6qlbHilW5smNXW7p04WezGoOETsCn2zMLv7f80AK2uiUIydRNdo
	E46/DCW1LYSBpX1WH3EOcBTYoFjyiovgv8Sl19I8PQEwf20Zk9GRPYXzWxzsI3Zz
	6pehrAv9RdORg5Y/bHGRi6LlVUSIkdOsF1Z3TCpUJq3LGgUz1BGlSV3NmyOtsJOw
	YCi9B7NB+k0gvJuvXQ6v/qwiPwcDVNTVhYEUOrGAcC0d0eHXKTnE5b9Y3sYtRxiW
	+6qrtH3b61sn9tqgcKCczwbpM/qTEXVAFWwnUQWmOHC3bSmDffCv87oebIPlKwy0
	W7iVXg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrek0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:38:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8911b0fb0so1401706d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323526; x=1747928326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3pdbEuEDP4tcdmm5ZtqXD3QPjEEiKtDhYgXWKQaq6K4=;
        b=kuk4r1KkHH3uWF231ZPe4N7n8wxm9oH3i3OGPm2wWYwejNFQh9nfBRZQyR5zgshTcK
         e15iLdatWqr2ADPoLcQq9jFziRNHiZZlK+kmxyQTxFqeFWfF4fEU/2zicgjKoukPzQzX
         PEjw+ffy5o1spLKWx9ae9eSTP9PRXw7lITQ2POyRoPPC4jNeNA+7Gcu6wnMfTr6eMU2D
         +GySZHTcmBgP58OlOD9Oi9iBz9aDWM2lgrTn+BlhYB3JbxExhtTsX6qqC67pv6XL1Ejc
         Y/mvkdW/niADyrFDc7a3asXqubJNi7AhQms1c8ST8V4NyeIsqbqOzr0WsB/lMkZTENWE
         Oy+A==
X-Forwarded-Encrypted: i=1; AJvYcCUIfZ9KUAJ3lnMuKpxbjtnw+HapGhv5EiDSvGrN36E4X7j/eGEuTTcgJp5KmIcnWwyAzkNRefHiMZybXC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbGPTKWwOAfzckI61gvr4VmqL3GDnvrPny4mIgPjUxg/hwOPtR
	E82cczL5ye2Jukvrg95YBg/dCFCdNLTeiQUohbLX8irEhHxWAy5QrniqQcBJCnuehH4paoqAfh/
	JQ94YdlGg3VrRyjH2aPQKMfh4tcJ2fjvxLOr3ZjArl0WcLKIvdSF56vdR9vIEQzXOjI4=
X-Gm-Gg: ASbGncvMVFmnudAeWbCVuZgpQjnNCQ4T1MyjeIdH78KNPDkX8Z+Lp+8x8nHuvgwzcHx
	eTvMMalgRhSw6ENTCeWa/Ft6ElP8CbOO93Rl8huh+4tZQKrNQWI7zMAUTUBwSBvxApFs8STlHVj
	t5TWwW3qDqx3ppU04jp1nsd7/ywntiqe66O/pXJ/H0GfERHvQyFVAwGWuRviOoQL05EzoL5WabR
	8cWjDBEkcAk1JV3AYvrGPnDtA4dSzY7SXRK2rHpokZ71GEAvWm0VrBqIltE2m43yba3lfRcKb3b
	XIqb5prFbeJpYb5GIJ4Aov8ungjVvaC1LzPkaHfhfIH3w4JsMVJ+C+ha1YLa+Hf4jw==
X-Received: by 2002:a05:6214:2345:b0:6f5:4259:297c with SMTP id 6a1803df08f44-6f8b08cefecmr936886d6.7.1747323526137;
        Thu, 15 May 2025 08:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHv3PeSvVVZHsqNQh1a6BwEeriW62crZna4w75F08uWKfsdhOTODl+xgVRMR+9uF6E3AiEoA==
X-Received: by 2002:a05:6214:2345:b0:6f5:4259:297c with SMTP id 6a1803df08f44-6f8b08cefecmr936596d6.7.1747323525704;
        Thu, 15 May 2025 08:38:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ae3b824sm2851a12.79.2025.05.15.08.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:38:44 -0700 (PDT)
Message-ID: <51947214-47b7-496c-ac26-8185bcda2312@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:38:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/18] clk: qcom: videocc-sm8550: Move PLL & clk
 configuration to really probe
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-8-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-8-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Tvah97_nDPyFMyRwq2joWO9oGrDF_Lm4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NSBTYWx0ZWRfX+3V7fxeswhU0
 fXID3d3+ncIrnHX4c8vyrKoxTt/PeZPFT42qMaGdgDUsV/6H1WBSEYPLvsgL1sm/I02QvqDZ90B
 9DZ98s4WQadKR+pa5k+VDpLMQJLxSCbSFKsoaX0I7KBpCgOl2SLdLx5O55MGbLB4dTYX7HxPSF9
 Y1GpH43Sld9gpkVAhCCef+ootgIryyyHCuURwriGVS9B/PQVghDjTp3l0bEfqDjMFN79l6Hx192
 Wzyx6M4+EpYjAjQ8E7Na12F/lahVuSJI7+GNZ7jyeu4cIFb7+KBZRz2hhXC9H6djet/v/7rL8kV
 2qkf1Qa++qbwmyn0diC41PZzTCHTX9F6zLvMY56T1rzl0rV3On3ZoETZH8YY43sl60qWKHcEPEn
 +dxlimQxjj7g6vkyZB1R5uuORc8zJ2wA0HB4FoZ/0m0lz3PciqcOCwEJtW1fuHIyYe3HgvLm
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68260a87 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CXQnK64LRHhqnx0rWp8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Tvah97_nDPyFMyRwq2joWO9oGrDF_Lm4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150155

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Video PLLs on SM8550/SM8650 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enable critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

[...]

> -
> -	pm_runtime_put(&pdev->dev);
> +		/* Sleep clock offset changed to 0x8150 on SM8650 */
> +		video_cc_sm8550_critical_cbcrs[2] = 0x8150;
> +	}

Because we tend to sort these by address, this index will likely break
the next time someone touches this

please introduce a separate array for 8650 instead

Konrad
