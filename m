Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C33B205AB6
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591779; cv=none; b=oA5H+KmZLo3X1QEkptHHEn18Oaxao2nT5OePbzZMhfMEHWF6tSEhmM760pdY8kOlxGgHz7gvvMYiu610qtTK3bq7D6VmlYzKD+6hHc+sJoVKtRT0z1JSkg38W2H7uF1bWxUSlHSaR34CrMujctJ6ubCzhi8e0fgCa4a221gSI40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591779; c=relaxed/simple;
	bh=RfFcPj5QxP/ejR0yEfiE/70GcM+UNqCa42M8GZsasiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=k2IDKji7d3kuIf/+icuAJoxkaYSrn9HdnLVuA+mZSYLDGsn2x9acoPSnjdmXx7zMqzDQqH2klP85SgtZ3hfDyx8qJkL/6JoOcF2g9o4Niy4uhftzbvVP4IJ4pD6J7MfkujFcrGh+N43R2JgWYfiofHCLAXS6N6hkGb7odH5Iqo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=buA43dyd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="buA43dyd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513BH68O012282
	for <linux-kernel@vger.kernel.org>; Mon, 3 Feb 2025 14:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tgGefRCvIvqK61jfsaRPeTSfVrFB34EBcPuk1FzsiMY=; b=buA43dydqh/htKmM
	nesjdkfHwqOEbtX+Z36gZU/ZerZNZ0E7HGZWc7xv2wJRChDUPmAlsHEHgTeMqQo3
	xrkjgxrhsC6l5SqAX/RYsIXEln7GCrLX/66OGcWQPfgcEF2NQY7tGIKOKzpLryiL
	XSBMUzNk6hg+SH2KB1vxUrwbZVFLgpWMNZ+RkWbg9hsPUefgOgmIiczRVp7eFgU+
	XF55dORABf+wjLT5RviuY8CpE+er6uKLqa4ldgr0JzXpE/7BpkmdNedml6dIv5ud
	fbuqSNAxdNIfE/Sf+8+HvjKmaJebfveQ0KX8aKyZ0InsOXwEDTI9AEa9u9wiHPKs
	8NvDew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jvsu8hv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 14:09:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6e5c3a933so62614285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 06:09:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591776; x=1739196576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tgGefRCvIvqK61jfsaRPeTSfVrFB34EBcPuk1FzsiMY=;
        b=JPy6zjin2UpG716oS+DFKJhyBSuhJ+5p1SB9HF1xMc0ohLsgEvwlY6qP6JlaqLkY8r
         HrPBKFhg0Jzd8DmZgmik0atuOauTTmsEs69vzAImMoAnFZgQlxbnmY/aasUiZRymgInx
         FRL+sqz+e7bvsW6GjV3+3IHp7VeYTgu9ZwjV5OyfSaDhYsDw9Vti83Wzk+rPJTOYDt1D
         YBZ+2t8yRuJTn1BD0n13lzvlDLf5seqthMCG9PQRt2mWjzVVFPVZPbr01oCy1in7SD9H
         uDHlWuPCFioixHTtNWTKCR37hjdN/YGAYrZWR6vaM6sEMtUCDK2t87AViOhBPiMWQDL2
         v0vw==
X-Forwarded-Encrypted: i=1; AJvYcCW5j9oTwMlvZfk4wMKsM+Aci/yn0cjrUCv8XQXN2w2wG65zB/X37LJHHS7/+xPK79kQ9E3bJWBS49xL9CQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIfqFjbkekRtYhBxnQhiMDAPbfwMVo0MVc+0NhzciHWrxk9bd9
	MBbnrt4f9rUFSSvw0amhpJ3bcpLEXtyPj9bIthooHmQJQBXxR3ikeXXrpfm2+xzOKEN1sh2Vmn9
	BDvbt0Z4Qy0czNMVv5rZsPQN+6+Qbplj1GxSZnlu8hvMa3PQX5YDsd+aWb/zixXs=
X-Gm-Gg: ASbGncvLdDVTf/dKOayM6gcJVTZyTJDeySqujl8w0lrhPVXxLTlpY+k4gOeBUlnTfiQ
	nB19oJtEMIVfxPDlbOZse8566a3ECvKLyNpVKThi9cqSPp+cLuLoHPCqllSUnQ6qlgCq+qiLevD
	J8x9FXhjjj9mysz6ybTF7ZI/krrt1hnLrAfGYrcnzFOM+D+WAb5msJj1x0OffVLDSARNxn6FTm5
	HW7QUxp+kZjXK6GUbduumxsnPIgsrcfuls24uaAMlhr+AcQHyp2+Qry19oPq9Cq1jMepNG0ivWo
	dr4J56KnUilGONeqWwQtnrNmcWZsJoSCvY8iGZOzvgR86iNF03QXkC55eWU=
X-Received: by 2002:a05:620a:d94:b0:7ac:b95b:7079 with SMTP id af79cd13be357-7bffcd77f1bmr1161232385a.10.1738591776093;
        Mon, 03 Feb 2025 06:09:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCZIYQLN5x500cDbnoXO+DyGcYS80dtXLyv2/M5i9RTIULyYRtcE8ycdrxeI08t76/D1sSaQ==
X-Received: by 2002:a05:620a:d94:b0:7ac:b95b:7079 with SMTP id af79cd13be357-7bffcd77f1bmr1161230385a.10.1738591775685;
        Mon, 03 Feb 2025 06:09:35 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724043b7sm7761212a12.40.2025.02.03.06.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:09:34 -0800 (PST)
Message-ID: <2b07b8ea-9c7c-4f37-8d01-d14d1e82aff9@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 15:09:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: Partially revert "arm64:
 dts: qcom: sa8775p: add QCrypto nodes"
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
References: <20250128115333.95021-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250128115333.95021-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5BEZO9IIm44MHgEc8vIhGcpAb0prpuNI
X-Proofpoint-GUID: 5BEZO9IIm44MHgEc8vIhGcpAb0prpuNI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030104

On 28.01.2025 12:53 PM, Krzysztof Kozlowski wrote:
> Partially revert commit 7ff3da43ef44 ("arm64: dts: qcom: sa8775p: add
> QCrypto nodes") by dropping the untested QCE device node.  Devicetree
> bindings test failures were reported on mailing list on 16th of January
> and after two weeks still no fixes:
> 
>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>     ...
>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/all/CAL_JsqJG_w9jyWjVR=QnPuJganG4uj9+9cEXZ__UAiCw2ZYZZA@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

+Yuvaraj Ranganathan, please resubmit your original series with the
required fixes, or this patch will need to avoid build warnings

Konrad
