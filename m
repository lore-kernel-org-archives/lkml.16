Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C21B1F8753
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323458; cv=none; b=tBOAXars8SUYAmls0XowlbhYGLrvOKvtD/zd/FI2wGEMgvFFbWdCgg4ZXn67l3fXZpX2Qk2ny46otXi+wni7Rl+Y6dqWSCA3TfgfONl7P1e4WMplrRZCVetzUi5Wx9ohqO7+uwPk+/dBy2rZea4q8AWSCmhnJVjD9/iHTSyumMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323458; c=relaxed/simple;
	bh=atIQpaQtopMpwJYgji9E+C/yVnZRqcR9Uu8nkCMzx9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXKy/hkhmgzIF+90Rdj9Q4mKOOkbiU5ayf8jcuA/zyVYi6J4TuXdo3Ojb1s6z0wRVM3L62U8T/vA2+/d6FxzG9ER+IoeLqGb9Vl+nOTI7nd3sV1xFoh6xmI54G5eDvpXjSW8TGM4kcuKywAVChjNwgeIc7aT6ku6Sno9UEooodY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmCZHdeX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmCZHdeX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFAQN016650
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLPxO64FqhcmIW9NSqbt9hKhOmOMomaefB8JAbvRe84=; b=NmCZHdeX7ZLIWbNm
	LlW+7vHn6PNHkGcoVrtku47I7KnVvh8D26U142nVo0jqfPEs6azNam5k/4J0TXcA
	wTTSqrBN+0garmh9IPRQ3/aw0QrggRo78yj16Ucx7PW1IwkPXjfoerbrDIcZ07cn
	P9XgZCzYpMIYrUq0oTVhlxbyXerDvqJHn08RQXJ+ko7z3TjxJiUCzBnbQUN33DIV
	WTJIsi7YVUx0e2VHAUHlVcjOT95Mebm+F1nSijQw0jBpU2LQJ2XUyvFhKWsSkCvs
	ZrHnxZMU3+KT6lGlpNTfMsKXe9o9nSltRr/KN7g5iXu/zLRM7T9XeEM691zWp64M
	+xRFiA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmpstj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:37:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8ac35546eso351866d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323454; x=1747928254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLPxO64FqhcmIW9NSqbt9hKhOmOMomaefB8JAbvRe84=;
        b=mxf2O1hPF8wlvb7pmiW0TkXYKbqKguueaHZfjELglHTl8PNMzjVTtfedr2w/nh0m1I
         RF052kgEeJ7k3tm0KsoKDiA6l2W2dA2kfci9yMmZvxGjmmHfPxtOY78n9jayLpFNTqSy
         gefAidmBsMjgLZvPZsfwFI/TbAvykEaSpxhyHpdkEfJhCsP2JRhZYpr05ZkImVBUgIu5
         nFkKbD1OBQaLIgtMi7oHh4Ez+c2kUEM2ltGrZwXHGcdjdB48O8EX5tYZgyHz8PKxHCY1
         YkIiCng7zpg3OxWYJCvlpMiQZkxuhNAKqAZe/P0XDahCUDeIPXC75y07RBIExVkzHgIy
         Qx4w==
X-Forwarded-Encrypted: i=1; AJvYcCVvqgyydpCYUrqwbZoSjAj9PbDaBn0H6PAN4oNZePySFcLw1stNz8tf9gh7TiztpuljPGIvawycuFO2d+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YywFgFeibiA/9EJ6Rop38A06fS205PLqtVXoJxOaiawhzeSUPqu
	mqFTXJwz6SaMVnXehQYxJMe15kJ1wk1vMXJXH+ysejOKSQ/FlX2tWG12DN74AH2BsB4eyx1kHjz
	a4IyS4hsBmaZ0ikL6AONA3xJ1sgWUCmUDWk6Jn6viZuUcSK19SkV2UMvnOXxCQ7EQY3g=
X-Gm-Gg: ASbGncstVrvakGs3xEmujXk64DcxUOHE61T+wOdBCD6f0M+C4TAVfiyeoXJLoq8ZeIk
	fEZamxiiHxislCaHIcMjqXF88p6hFiNIrUV/cqh4Xi5hQjK5AnNt/zSULg2hO8kqseSldZdmfti
	WAmRDSoG0DndVVi7mWHKiCr36Kv5wBNSsrVKr2/Ht8I8ZfXMb0RFqv7enhgHt163kMTyR4f/jzO
	5MTSgTVQ0yq07GPH4LQSZ1AONY2O59UgcWUxr0+qb0tZEmpV/mDr4pXrphpVMEDLNQA47wMtrqo
	bevr7boEE2AD/MEZg7QjOAWOp1x5D+ykkWCT1C8H+BdCgOkYqGyy5rOvbHl/7eWeEg==
X-Received: by 2002:a05:6214:2309:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6f8b08400ccmr964216d6.5.1747323453886;
        Thu, 15 May 2025 08:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5SKIS8bxAwsl16PrLjGcS3ujMsxqEj4y1zULjib1Z01idF3D6tCNQakAyR+kLSeki/BaSnw==
X-Received: by 2002:a05:6214:2309:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6f8b08400ccmr963926d6.5.1747323453394;
        Thu, 15 May 2025 08:37:33 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047be1sm6506966b.26.2025.05.15.08.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:37:32 -0700 (PDT)
Message-ID: <ea2f5477-e75f-4e07-ba0f-7926ec490639@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:37:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/18] clk: qcom: videocc-sm8450: Move PLL & clk
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
 <20250515-videocc-pll-multi-pd-voting-v4-7-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-7-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NSBTYWx0ZWRfXz0vMr3AEGE4V
 XXdlduX2u/lkB3lWCzye9Mon+bi0yTw06KersvXXemZE6lmJmUSkjzCcGljIGvFdyS9irswVRWX
 2cGPsLHsuAmJHyqAjmgVq+WbAlsX9SK5hiqxK4aPkfK9Ahibq0ItWfXneAvP/+WsFh2MsDU/OIY
 iAlNpkX5oOixIOs8WLCXClYREtA6Hu6EJHCp0yFEgUeq+0ImqhrkFVvZbDMGpzsJ/RmVIbkUHuF
 vt3ZIq76t0rx1g3uRsuWQbyjL6VJsV7jSs0B/lSgCHn6HJH0Q6f+SUD2EOJJh02P0NnM7USsEN+
 IRSsl9w64bFQApaTEWT/tjxvbelOuPjZ2hLQnb2Y4fc88mTGSjIBu8orwnjtWogWHrp7ofTZlv7
 peQ4Y4VUAN170OKVoqx1M8UeIn6qLzTEGNQLBeYSAQlJR1BGzaHzRvx30YBGiUpO9ZrK+Ui/
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=68260a3f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CXQnK64LRHhqnx0rWp8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LAezNocsiEnJgNjyZbrwA57JaJtYYYED
X-Proofpoint-ORIG-GUID: LAezNocsiEnJgNjyZbrwA57JaJtYYYED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150155

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Video PLLs on SM8450/SM8475 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enable critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
