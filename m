Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC541204683
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713289; cv=none; b=MeMBMSYFg7//OdbVtDReGpiY22lAAyzF1fkBjbT3zncTQw4BwX514hgG1UzfjqxsSc3LXpeVz6SjBVxrFHMBJUrYU0z5aRCITIPmMDBbRaeW1KP3WbNaowNdlSLtoxW3QuZD7plFxLVdGqaQkAV00YQraGVfYc1ibvNEJ1RsiCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713289; c=relaxed/simple;
	bh=ByARVNs2/94yXyo2jTCQFxi95LxJUdjcWtISN+VzO34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FW/5xIke5BA7VfimSBVC7qQIbonY/OuW1AAUTXcOp1PxkxOhdOM6U8Fq6vbG1gVaXQ1LJrnWZqTNcEYnEybyNuGINPQg3a79mgnqd+K/hEBQkdTSBiJNCaENBNasCoyiw6xy/7AhmIxsebNH12QNeSriX6yHOdRoPOXTYe22uXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2nL7VbK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D2nL7VbK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533JiLbG022859
	for <linux-kernel@vger.kernel.org>; Thu, 3 Apr 2025 20:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZbSA1DZ+wm4AKS1guItAosf4nBYy3ZpMHJTTERfAWiU=; b=D2nL7VbKnTomAGe4
	up0KGWVTv0pdehrT1DGZDrrfu/TsifNDjeDQpKjNWwFKGYNE8wWaMgjSyheMSX2B
	8ZMYD1XkW50ekz5pMkPjwb2IOrvi33xeRMg9BAuqKSJWir4pLhqyjLB8xmHzbmD0
	Soi5RTWOC4XX9PLP7snYloUI19BcFLcF+iqdfU8a0+dPJEWz6OgAj+BatKitCNEQ
	p7wAV6rijtz4ZZu/1arCf67rhSi2G3qqoCwzrDZ3XY/4coxf+BRoej4m2D7X6Iw5
	jIihtqToz3raBdm8OT8zkUrhXVw3Iw2N+aIAXr9T72ic/YK87HHaDODplbpRx9Gj
	LZ8e7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sr8q1jud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 20:48:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c545ac340aso29690685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743713285; x=1744318085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbSA1DZ+wm4AKS1guItAosf4nBYy3ZpMHJTTERfAWiU=;
        b=Lnq9uUjD5yKGsjszsUmEE+OVhIrXANra7APBAH2jyjbvFnHQWn+1rmoRpajv/979LV
         ikDyI8FMuPNA1hFwnIejalDERJHyYx1cqu/IWCySsWambGBVbD593mLfQni9sHbKcP13
         1ur+qJDuN/xeseQhQJa8nNomSivR7i4SAFppg0uy8aUBHskf3WWEFXd0Bs7icK9tpUat
         uAj6UqtG0GqKZ82cDPqxdQCIX2D3RQolNyQbM0n3lS8EG0+dex8yOb31KMM8rFjGuTzq
         Dl/DxR7xd7PgBxHw2K8t4via5BudQYfwK6crqJH1acydTjbawiU5188DrGtanc1v0qpa
         4EMw==
X-Forwarded-Encrypted: i=1; AJvYcCVCovHM2ZHYdmKV7/9KAQ4GI62H8+1XQInkrEZCVionH0HqDiatCj3PH8bI8Qm3FDfnycEXw7lVs4xLOOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrPWnEZXlManJtf8aVHe8vTa1s5eK++QjXbLQ44rSxAb1MFctn
	K2Fb+WFXpxCu3H96urmZ83G8RiNyz63wBFWtTsju16glyHxTN+LefXbpmRQD/jFuyFEuriU1MdG
	nQzJz/YpnKTAYqwi0CQJCE/y7SqDGvSAWjQu2yqLPqGoDP3TjLzPaBtz26/PlGk8=
X-Gm-Gg: ASbGncvWk8NSMGZhx+Y0DB8gt4aL6nZxItu22T9kLd/fYK3cEGqOlWxrI0sCcDCNHAN
	jbfJC8DiaOh963lszjnzVSSSBaspKJQVQabC6uv1HOTfdabVhO/EWtZPSszbvBh/b4ldRtec5Pj
	HKe54dmIRCITbAkUzkV4bDCQkq4/jwzAxIFh0XH7sG9Ovx50NI4+zjcPPRgpkqrCBZdPXT13kNL
	qeNeuOiXVR0wVxjoAksQnR5USOIh49OvMwY8IyEEVA//fXN2u1fY05Kwv0ss5lANOCtbXOeTJUN
	8aHFEtaV+uRv2ZuLl3AvK9oiMjRbBK5fkwQqz9QD9AE5e0nru2+xZdHFUIpcYzn6K9KMeQ==
X-Received: by 2002:a05:620a:40c5:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7c774dc4185mr33441185a.10.1743713285659;
        Thu, 03 Apr 2025 13:48:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp+1amjTwUQ4AsU03G8K/0ubl+e1o8QxpJmKtqcBcBTnt7Mg14gblMDDogOym6+X/hYXyJvg==
X-Received: by 2002:a05:620a:40c5:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7c774dc4185mr33440085a.10.1743713285308;
        Thu, 03 Apr 2025 13:48:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5c93asm147372666b.14.2025.04.03.13.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 13:48:04 -0700 (PDT)
Message-ID: <c25d6b93-f5e0-4f28-8a6e-f7a8bf07d53f@oss.qualcomm.com>
Date: Thu, 3 Apr 2025 22:48:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: add the pcie smmu node
To: Pratyush Brahma <quic_pbrahma@quicinc.com>, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lumag@kernel.org, robh@kernel.org
References: <c5ead68a-f108-4e73-aea0-d6cb562092ac@oss.qualcomm.com>
 <79504e6d-5ccb-4909-a88e-307280c5d359@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <79504e6d-5ccb-4909-a88e-307280c5d359@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5Q4MdncFdF045KMi9szwXSpcXHZLkLdP
X-Authority-Analysis: v=2.4 cv=Iu4ecK/g c=1 sm=1 tr=0 ts=67eef406 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=rw1LKgnZhq2XGCI8xKYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 5Q4MdncFdF045KMi9szwXSpcXHZLkLdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=928
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030110

On 3/28/25 9:51 AM, Pratyush Brahma wrote:
> Hi Konrad
> 
> Can you please share any updates from your internal investigation?
> Do you still have concerns or can this be merged?

Pratyush,

please check the internal e-mail thread.

Konrad
