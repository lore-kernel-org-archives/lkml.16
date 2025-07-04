Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E7429C33F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751627180; cv=none; b=E5/muo+XG/PsBv030USb0YEv7kuSUqRVwAbDBf+5B2vucPwc+37ugIreqLkVC9GelBcoto0mOrQ8WxZR2RKBjU6OKVcepxqEKtMH4mJI5zLI8q+wQZjnLnlmODSq3OZmOCTKzx5vuYrXvqbaRyFszuIat8gIvG1TKVNC4Cs3pvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751627180; c=relaxed/simple;
	bh=k3yRpHVV4mG8PD+9jKn9SDf4cJFDmVdprG2GMo1cjKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1RnGZR42Kp2ZEFxwWLuyM1Ikw9z5DS+1aTK2/1hI7DBatO7TxZ2TqxT1bpACBWvYBg06k8WFDTQpFGrsqh8MAFAxNMuUU0H0AToXRi7r8pnBc58AO45GerF87UOSs6bVbaFQYqyFfsdckMRt6FLB6zfjevwCt0O1FAw016AX+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEOiVfWe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEOiVfWe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56463mho018851
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 11:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2XxqMM/RSUTF2mZkG2gocViLCUQzGXcwFWZuP+ol460=; b=KEOiVfWeA44SOaKc
	6xYZn8C2V3e+4xKSoxAAbHrk58XEX9tJJOKUl8s64JK5RUgE/AAqRWONcvhPBOdQ
	hmrMgLROzm4Mv6Ca4LCOkWwop1V3Oyf0WV5lJl73s7yHeFcM/3AReTWNYk6qHqgQ
	TeFALwk5GfIJpbaK/QB392LjbHHSVISiCk6T1V+61HoBPTUwCa6isi2WVSMGf8oF
	UezQGSf17DhbDnaSq8vJnL/WbdIdYcMyYMHUXywvMRbQLuJNCOeSh8JB74nUEgy3
	c40wF1Y83sy88TSPyckG9u6irCEUJi0B5O1TGop/4hm5ZnhULOXxnkRQRgvP61wf
	d76bSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxus7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:06:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5ae436badso1609491cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 04:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751627176; x=1752231976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XxqMM/RSUTF2mZkG2gocViLCUQzGXcwFWZuP+ol460=;
        b=hfJ6BNtq4cz/IvyO1QsTtVUHlSL9eac4JVMrvFzAtzTmtcL8hDpD/qQ0Z9gfoT0cjw
         qIRqvJnxV8WsaE4BEVemRy7TWi0ZgCxQZxncOjEFTHVdU/KezpCproBjSwt+SJxCGSmz
         bl0Bb8fxWKdC7fqj2wdleuewuLyFf/lNt2QmL9Nnzl1jXmio07kwnzGsAf8lO6h2eiuD
         mb497W1LZpWbSprDEdMjp1TyOwagy4O6sgkfVRTFoNPid1PQnS+8iTLvcDG4E0QcZznB
         d8rX6/3Cp1r9ByfXOTORq87SL5MgKisKgnoXlYsniN7FRjhaIQp52LQw5n8chutMiudT
         qBPA==
X-Forwarded-Encrypted: i=1; AJvYcCX6QJAfJcY1qX+pmu/OBMtX09DbBoizw5jcFCzoyU19A//zqjQe7B0lYgP3IhY3q8FY/jsM1FLi5csMhi4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjf1fFGvtwYdTIMiGGWP95X7sxaYov7sqRI6NLi3Ev0zr4K4sn
	gvD/ZyFXxNnH0d60IxSd2zav8Pr95n7KnSFkiiqc0/MWEcUGefIF4xW62ZU4mT3+Scfjp/f0bsc
	klgjB7qUtMJMz8TyFTGpFk4CGnOXb9JfQIWiIBswqcRshgm5QxshtNDrV391JH6cTwUU=
X-Gm-Gg: ASbGncuI2CHXbccsv73Rjt3E7oxUKPigeRC6Q4VBbD096F2cl+NSobc4aOPlto9A7a6
	K66XlWrTbXQK+1AEJDu4QUsv0x/nYt7PwyORlVZjt5B/i/BghKc8QrFl9jcRKeMYvqHVLPCrm4O
	86jrlBXFjAolURTHCPbOmNcjldoMT/d0m30Xt0GWEFJwZDXFhtlM7wbmgSJ+Fm9yG5hD5jcvaF5
	hWnm3Aw5uEJF87ykPWpaMYGQUNPkxtXAQ9FUkKVf9Vd/d1ZT6APir/r34GVqMfxIALRzidys0+i
	TFhlvGPG4F/iAlAgn37TH1A4dDVSQNjsUAEkmkdIT860eg4pgfDniBqvOzLl9yeclZf+c1UZOC/
	srZZ0ig==
X-Received: by 2002:ac8:5fd0:0:b0:4a7:bed9:524c with SMTP id d75a77b69052e-4a9975cf1eemr9429561cf.11.1751627175928;
        Fri, 04 Jul 2025 04:06:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL00AfasMKdltGMxGM974NBZd0imq6S1Dc9fbvd0ZKYoSfNqzbgVRMjgXDHONPutQiSOAFdQ==
X-Received: by 2002:ac8:5fd0:0:b0:4a7:bed9:524c with SMTP id d75a77b69052e-4a9975cf1eemr9429321cf.11.1751627175516;
        Fri, 04 Jul 2025 04:06:15 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b02a23sm152666366b.112.2025.07.04.04.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:06:14 -0700 (PDT)
Message-ID: <0e13833f-fc0c-4bb1-a1e4-fdba07c50768@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:06:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA4NSBTYWx0ZWRfX/61NpnxB31xg
 +9lIRHajhB4X3gjpXgfJxmbfUVL8fGLwZkwXj9/skJOZKXM8Y5Dbe60x2QmOHcnvsQJYJZJkeh6
 Ai8NyMWnwHWI/NCbxi/DNRIROsl1YdqjFLyM3TDmQfOtObHPHwTjB0eB8aFFqB9arvMEB+47JZu
 TnGFd1yKpcaDq6Ze8Oa8ZtCT+j447+M0DLFr5TbQDrA+gAYiDtY2DFT190TdSEyIubefBfbSer5
 lI3Lan1TWgusJ3B39k+1ue0eZcyEoYJC8hLZ/uA6BkyZITWesFQyhu4Vc5hQOQB31tYsAxuN0KW
 kluNgQsBSrKdjfjJZpqAgAn+1iIwygjnDhwImHQ9fUmMOZL+QiqVWjxIi2wWsxwYhpI6Re+5mpD
 rI424ItVxPfVgEkO9wG/qdXqorivl4MXetlF3huC5tRhwd00utDYEshdX700ydqS3Fujbyxg
X-Proofpoint-GUID: 9bufP7if1fJQWLKKfqzFkTOq_ZAPkYx9
X-Proofpoint-ORIG-GUID: 9bufP7if1fJQWLKKfqzFkTOq_ZAPkYx9
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6867b5a8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=oQRPDSM0WpIYGLKzx8wA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=954 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040085



On 04-Jul-25 09:16, Luca Weiss wrote:
> Add support to register the rcg dfs in qcom_cc_really_probe(). This
> allows users to move the call from the probe function to static
> properties.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
