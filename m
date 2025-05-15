Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF4A218AD7
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323296; cv=none; b=l4ja7HCGtdeY5glivq3sFAyia2IgOyr3+0eTlXNyU3pdE/2nKou/88oj0jvpo9Iz/HUkLzlFl0UNFq6a6wr/0IT3Ng9evQgFgSZL+BG17ZEU9pkmYU8xUrJjdnaKTGdzUzA1zb3FjdhtYFufl4wTHZruAnCBeHzCeKH7KX209eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323296; c=relaxed/simple;
	bh=ixVP8pcTpJz5v3f3CERMJ2iDXMg23OMY+fwNf7RKcvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVmnl2UmGsoGtSf4PQE68cK4b6GGG2erpZFkB3zKI8MXk+iugudqhq6Kjzs0rSkPzrPbFuWaduF2DD3MBtNxewgH+AgUI6M7+q62EWVYbtnbc1AJoKnqRsdW9SVjaDbrOs/zFBvjc5CBe+FA5S471MU3Bx6jZ5Qmg2UKM07FsBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4+44zPr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4+44zPr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFdl7001060
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lA9ROa+Fk96jm+RavuSIENPK4Ma/Qw8dY3SARVyTTk=; b=W4+44zPrmFJUOxF/
	czpMNUl51CcT3hnQTqrrBvdxEbXdOCejmvSrIRDIbanB4oBwECKYLtPESVUqSBbC
	0EmLRKZcNc79jVRTdP7eI0+qPpdIRhQBAIuVGYBBr12+NTb0OgfawUuFeF36hVhF
	MG/kr/39YPtCFD3e5m6jn9KqIlz3gDvTQML9OGQFbU2LAAmYsa0vkoDXGfHxtZgT
	tCCfsHtZuBFbFti8OYo0X64ix/CjnVEImunXCfaKOWsWKqscK074hcap9RtDfH3u
	wnsfwtgyWmlOvcZORlEAN++RAzw0Dk7XtjTyWkdSySHAPxr1+Dpn+QBmSDWIyFIh
	pgm0QQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnxmcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:34:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f899d02307so1914256d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323293; x=1747928093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4lA9ROa+Fk96jm+RavuSIENPK4Ma/Qw8dY3SARVyTTk=;
        b=Gqgb55u9WdEsgWes747zrHKsFsw7NybFDiZFtmGHOPgXIv2t81dB3mFOYJIHysQhw5
         XnxaJtmeWDt+/FcC4cGUBC7zTHtJlQQZh/6alURjCAJ+1OaGcDrmSraBQbEUviiB6k9H
         1N5uAcppgAdYfEWwicc8noqKElZ/LsyBgALBXXmyv+oe7cJ9dpVj4w/3UGaqJbpb/du3
         O9xbuPTEdJGWJSHx/V/z0F9wf6a1+9KFcv0CgKLe5MbR7BiSvtYBkOJDbibixtTR0Br6
         u/oGSwpe1puQBCDTd36Ev41SgeksymChTJhA0NhCvUpkzuFg34mlYx7B6eXZ/m0de6Vj
         IyLw==
X-Forwarded-Encrypted: i=1; AJvYcCXYETTenoPJHpmBqCaDCHCK/O9USXXsi5s0sdBOqsitkggDPlCQxiVp8Ixt9Fey5vlb1a0sm/aFy+sPoiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDxKkFQYoigjAidqh9m5IU7yTcE8ng+Xtb+R9dPtC/evITQ6m7
	FIl1RbJfMIaVO+byxrBru9t2U+iFBAV7bA9+XPqv+C5aNyrngdrXM3LImVypwTvsj4m2uZ3NOrx
	K4e++4nxcvPT6CYrfWNyvyLIRdcXnMGInF3yvsn1YhwKp8+RaNkpp8qZy7z8O/wNpv4g=
X-Gm-Gg: ASbGncvgbl9bguPNxg0R8MADT3VWPszVlDjaZMbulTcJrVgO7E1/CXUrEz/wKV0o6DS
	B93pPK8hUkI8fdeAhNrVlovDtO3V9N4J+diHQiQ/AK5JVq3CwM3YzgBPQgx3Or2PpLm3knHi0Jc
	hpcf3V6YzWV0nE/EG53PRaBjcjRMBDy0nh44/+jF2BZVUj1a/WKfFrGf4ge5ArBj7WDaDsB2V8W
	VosZjTW8x2Jukcw5TrieZHr5mZngAwoQGDOfBM/ZSEwOgsYUx8hxx0wHzgvkw42O7Ycomh1HnL9
	ivNQ4AfTNGN8RdM+uwknz9cTTqWXY/UedehhTtNklaNjFnfl/Oq4LgwI0Z3oaRC6ZA==
X-Received: by 2002:a05:6214:dc1:b0:6f8:9c21:5ad with SMTP id 6a1803df08f44-6f8b0864435mr966906d6.4.1747323292583;
        Thu, 15 May 2025 08:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjj2ZZDhYRB2enJaHEsOmAOykmUWbJUBTlc1NNsNBnxb+VMUfOdfTnLIoB9XZCg64ElxHH4A==
X-Received: by 2002:a05:6214:dc1:b0:6f8:9c21:5ad with SMTP id 6a1803df08f44-6f8b0864435mr966716d6.4.1747323292181;
        Thu, 15 May 2025 08:34:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04ef59sm6102066b.36.2025.05.15.08.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:34:51 -0700 (PDT)
Message-ID: <4a5cd51a-b88c-4ba4-a8fd-d065f9b9f113@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:34:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/18] arm64: dts: qcom: sm8650: Additionally manage
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
 <20250515-videocc-pll-multi-pd-voting-v4-18-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-18-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: riDGU0D_i-_9kKQud8EBgOrezPlJS4am
X-Proofpoint-ORIG-GUID: riDGU0D_i-_9kKQud8EBgOrezPlJS4am
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NCBTYWx0ZWRfX3ARey+K5rRE6
 6UdUty8TXfXLgbQfo1WL7M6RfzGVJtWoSYPjuyBQo3BmuVfK4UcAu+R213//QwLik+gLBhF4Ti0
 BB/8UTBloOLuiic95jQWNskpUnl/6urmTCLEDxl5xrEunuUpoqSahDXPveOdYoHjFUpWasgUqvR
 6oxQR1qGCDkrb8So8TPIWyglM/CkhgfdNLxOeqiloYVDgLmUIj6h3L5czSqGkfRxUgDdG19OoRl
 9nGjhucT++5Zxgdbv40rUoM/5EV8MzgiNkln93VDcgmcz9TPv7e2NV91YFDKsStBIPcjZGnTVnT
 9QgBobM45XvbYn2asFRb7RW7NRnaHLRlD7F6KsNYy9YeajFH1PbeVkWjrnf95jzawNRx/CCVsTA
 25T+Ad/hfVMs7a4xOghn2801JoVhest7ktwzkGCysxA9Stg4tBAZVemwy40IQaOxJMNDSLd5
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6826099d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=l4YKJxAlfa9iYSc-yQoA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=660 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150154

On 5/14/25 9:09 PM, Jagadeesh Kona wrote:
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8650 platform. Hence add MXC power domain to
> camcc node on SM8650.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
