Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DEC27145E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368297; cv=none; b=SXDwqgD0uBUk2ADgQ5wGtezy7fCm+VrKtRZwEjzqVD4k8xYe6WknRlnJob3YpntoZgnfd/sGUEzPYqiJUG/+wU4cZPpAUmEd1irO6gXjeL4UDDxRbzZKIM0w7NTxvDAdM58pXxoRIfkZY0N081BfJUTDlWQnGx6RINNEMuLoa3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368297; c=relaxed/simple;
	bh=9WDZ1BqFOD3xKFamAF7RAiKGsLzFKTCGgUcxfHNHCNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWEA+x1vDczstmj5IQIr79P5tcTNsiNbPn+bxyIt5/ZgAIL7M9ISxxO0EGm9hikVKA9d77/auTfQU/FyjXhFcoB1TWzPHEOaCREaKRAYanTBKhxesLez26FPJonnc/Xi87YEbFmNEqzHnbzO5NhIOmTTv4AAxB7bA2leB7mCnRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkDKsZ5G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkDKsZ5G"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5616lXha029738
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 11:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TrlZZdJIO7yzkVy8vnZqCokz+DnJKjhGP7uK8AgE5nA=; b=TkDKsZ5GUyt1B7T5
	OkxgZeG+x5ohTlr9KIpnlY91Rn8FNGsduMA1IxqbdHGMhHWGRrADlo/AlluuILv+
	al/tPZi9aJo1Y10Ci7aHm6CurQwwhc9+FF7veETzgWDW7dBO33gtpJBrXIscUq7A
	0QgcW3C2CmffluQ1XI/1Rw2m/GIMn0nWgOnZia/IWpa/Oydj/BKHZLGY9St/79lu
	9fmpEAb50Yo10hKlpX+6vQMp/mLMOJ3m2PGxX8fhneMQzQ41vV223/o6UDcETKpi
	HAAKpptQC21BlXlEyfUocHhzlX0hnXgujVIqSKaTXjqkoNC88cCmdj0pKfXdmqx4
	QGNm2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47m02v2p2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:11:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d094e04aa4so168288485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368294; x=1751973094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TrlZZdJIO7yzkVy8vnZqCokz+DnJKjhGP7uK8AgE5nA=;
        b=VSpoR8FgJm/x/g2wXOkmcmcxhXiCARtonD9Gbq//SCH6ZUJJv3fS3jfia1T4CuW6Mt
         JokSYUpKvwyxdUSZLWuDx5p2r/bXl90TmOo8snlc/fSIWrbNk85HSTJ/giEbnoGnv/uH
         yT4Xw+W65aBoZWXxZiikBfAMamnGRbHtPJ4XpzonicYKDWOLStVToBBJBABblU+XhlnR
         +TJNXSvSawzrmlnmc7EsCFk+LV2kLavz667P7H762fxv5kUZ45daRElw937toPYCtGT8
         P5VYIeSI60RWaPsOhHrhYoPJrTuZpd0HfHi2UUEpDu2O8/UTNKwYIc6WGYquywaqVrwj
         QX2g==
X-Forwarded-Encrypted: i=1; AJvYcCXzICVsXjWkboxNqb9y3RKrKNUNjHU4IyiruEGiNTFRtc8w3JtHdNejAPdimHOOZE1jrnrjK9pbBG/qGG0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7qMOBheAb+V1bHuTUoxJduVG1bJEuH7p3A20ugr7lwvwCEF1V
	wvxnW1zN/BuNP7L49Yd5okrIY2o05BqJK47GgDF20bPofRbtbN+4QnBG3jC/B9BbV1ZIB1qxJwo
	l9CjZu5K081nOmWmW0hn2V2gWxAH/ZYu3ZUh7YD7WThjXQI/faNgp1TBPKfMFbM3wST8=
X-Gm-Gg: ASbGncutitlTvfyZ5NFhis47B3lJ55BG2c+sxNk++IjDxgLFSoeGSaentEIJI8RHM8i
	geWrLPwSUOZBEqifCATayZwoyJf5P1lV6vlRDOHbLjnDyF0U1jgwH4eoQVuSFcPt8n98rnQPYQ+
	o3iVQhVf5Kjx6L7Trg3pzBhpgSBtlTgPXXFb1ugAC0Ppq5FNd7AHrHm2KawlzJwkkRQKAXcd+Y0
	FCJW7Kev1grRPNNhpG+NIcCVl3ubQ/G4b3rzLXdr0CT5MeSnn/lGp8wOpuzLTOdJAhSCIww5phZ
	IldKKy4qKgLOiiDNfLZVf2E9AZbCGvvPkvwgukUk+5oXHBVqs8Lh+uYOqCELgcjzZ1t+aLhfBbj
	pKj2jW8fV
X-Received: by 2002:a05:620a:29cf:b0:7d4:4a59:6e8f with SMTP id af79cd13be357-7d4677a1ef6mr127724985a.15.1751368294014;
        Tue, 01 Jul 2025 04:11:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0enYbn2hSOvbfPZgODz/DO0dsSgkRNbwZ7zhkY+8pN41BaLMoLizJRBjD4L/DazCQBLleTg==
X-Received: by 2002:a05:620a:29cf:b0:7d4:4a59:6e8f with SMTP id af79cd13be357-7d4677a1ef6mr127720585a.15.1751368292723;
        Tue, 01 Jul 2025 04:11:32 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae36327ce4asm772552166b.163.2025.07.01.04.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:11:32 -0700 (PDT)
Message-ID: <242d353e-99a1-4ce8-9435-8b2addcf1276@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 13:11:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: qcom: fix GPIO lookup flags for i2c-gpio
 SDA and SCL pins
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250701-qcom-gpio-lookup-open-drain-v1-0-9678c4352f11@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250701-qcom-gpio-lookup-open-drain-v1-0-9678c4352f11@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2OCBTYWx0ZWRfX0Pzq4MRIh0dL
 LoZgqg8VudcE+CGvL/2jGunDq0wxXvD7+nkYSeCJ2Kc9pO+CRdGXCFGhlQVaeK4s+tEDz8TJVKC
 VYT08N72jkrHgt2ZbjOksFX3yigEbb0BDUcLGlpXC6cHizxuAeVlKSYvQpHHupDbDse1uyNIex9
 ZHyak6G3otkDae4Opbk4jNfoIcieOil60uzDyS3hubpWzZD8zuIcp26drodhpoO0R7FY5BT4/PA
 ZcLHXQ+xUq5BW1H8dV3Tu4LPLSX/dPB74hogECM2IyzZgREVhWYfaN+71PXcl7bTys+jgwIFj/7
 yet+sdxRZqSUI9HLgX7WH4sfEFh9NX8/wUSWbkQ4ns/ID+Hivo4hyXaUPeRhfDlrRqz9bFwUNmg
 bvb04CxKzRQ76f3+E5C0zub/GjokrFurTJD3VIdGfE83O7229tbPbV+uMUHZBIG34s2zX/8t
X-Authority-Analysis: v=2.4 cv=Y8L4sgeN c=1 sm=1 tr=0 ts=6863c267 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=OvpKPoiE28FR6mlLKbkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DWBttItRiAP7zLNCDvGOg24ZRmRnNevr
X-Proofpoint-ORIG-GUID: DWBttItRiAP7zLNCDvGOg24ZRmRnNevr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=625
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010068



On 01-Jul-25 11:01, Bartosz Golaszewski wrote:
> There are three platforms in the QCom DTS tree that are missing the
> open-drain lookup flag in their DT nodes associated with the i2c-gpio
> device whose driver enforces open-drain outputs. This causes the GPIO
> core to emit warnings such as:
> 
> [    5.153550] gpio-528 (sda): enforced open drain please flag it properly in DT/ACPI DSDT/board file
> [    5.166373] gpio-529 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file
> 
> Silence the warnings by adding appriopriate flags.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

For the series:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
