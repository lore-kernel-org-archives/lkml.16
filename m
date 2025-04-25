Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365121D5CC4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608650; cv=none; b=KyYZ0JnZSD6zCQeo76hfn3Wjwn8mIGF9t97UjlgV2QJFqrX6n/MajWovvg83UvlajTc+C4q9na3Mprbw1jHzXGP8RnwOddnVIian/Vw98Z8MxeQTJZMvGI8ILCdC/AWoUD0hVjJKCunxRt8q9oIyVIixMh5KXplWKfwplv9amVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608650; c=relaxed/simple;
	bh=/eHKeSZlC+sG2RSbp5FBHIx3+dmEo7RrjA+oItbP7s4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8vkEvDj4n2AnCMK2YY+btSXCkvkbBjVZIDD+oPncscGNOP4nD/tfMfx+0WiKzpd2sVgC/GEVqtwbrzJe0cxtv2E7di22f37CpzSyrA81qQYNirvTDBzIOdGv87zQU/YtSvdyrRTMcByxbXzBo8sQzN2Z7HqJlpcIlFT4Qbpq7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5QAuYyL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5QAuYyL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrXs011042
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zW4BUb9FJeIyuxTGb9b82pbw8fbGpR+wNWb2Ep/lNvI=; b=X5QAuYyL+Oy0kz2N
	9XGOknSgXa4sgRM097HDNaLvXo4B99GjTQvOcedu1RoilUorgRcK6gpZh3pVOCQz
	4ZGQAlpzX2YIo0uYbLFcYwnAHX+fP24IM9U5KFdCzZVpL7OIqHVhBfuTdk95p2KS
	IKvMb8MjAtYFXSIPOl9XJooM8D/XddQcW93B8hkvoU1RCCXPqtuDHxnI7i7DOBAU
	MDuRzlHyl8S6vor61m6layMJHeyaRb+IXaIPUdnpH0DkOn/4QqLPYfMgc/xPhSNa
	cL/O8qt+Ryz9dBHpoFoi7sSVbiwao70XPwcioMpDpw47LDtdIvYJRNH6DA/BUj5A
	n6yQzA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0j87d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:17:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5ad42d6bcso58453185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745608647; x=1746213447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zW4BUb9FJeIyuxTGb9b82pbw8fbGpR+wNWb2Ep/lNvI=;
        b=KDr06Dg2iYr15pNMg8iFTo1DVbCsWGHCAYHOdfe7MzlbA1KAyY1LjCWOp4dQvRaY1i
         Gn5qKtUytnB8lFSTHyGgraCG+ZJKg15oJC0tklV/3GjeDO0BJKIFG7EL6JckrjLYdtC3
         vuF7SZah7rLdJ41CSB7QB/xyz5KDJohZDved2q33ye+NnHmXmbvTZK4+0rHsLx2vrq3u
         5rYR7T1b8fl9ds1LurAJiRty/4+oQc81TQaS46zyLRuJ1a9ptBbP++G03HRBVrELLsGO
         /wM52BAlVQFFrMxQdV4eIEYmOSiIbyfHq0crb9VXjH3wQ16sTnLRU+IFLlcAZT/Fuk+V
         rGUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGF3Ti9nGZtK3cmTSYE5bcfRcBpM0Kb2UBLTucDYIjQ2qi8vKOzesjGbBdJLvdXB9IRE/mJ0DhMeVwwdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSDjFGfFtvhqso64ADMmJlwYJU6k0Czg0a4GknD8sokMbL5VKK
	fYo8BfyaAuHaH6cLuJk2ARBB8JZ5m2Nh1xNH2bE3rL3d92zCB+KPeqiWOw+20eq522y1GIP/hFX
	E0OhnQqnDgd4c7kjmzbEyGCP1cWXAabaVWD9rQSBBDtpZtIU78lsdEMWNK/UWWWQ=
X-Gm-Gg: ASbGncvLMoNIQMCYK8gsBwMkaGX9mznMDdi2fn7w5S8V5PBVODF/86IraYs7rka0XHi
	I1tbFvimTmssSRPm+v60OhNJfv/kzNL44ATNINzMLAHLPKo02XanlOrfqisYuDDFri6qmct7p+Z
	FjWVtTP8p4NwmgpVn1gBRFeZTNJ3n3mKDOcB6BbSY3h7w5WAHDDPZ17qMoGf0en5xJGKMHX/2DZ
	RoM54KV7Uf9nT72PUniBpzTh4ft7xXhG0l8Q3x0/FOOyrPPNDJBE0U7G5GAypzEmpzkjycD44EH
	3eUrUwUYxtzqA8r2M32Un1yi9nNyUHK3A5h/xoGWHWEANnGBJO3asDWX67UANtZEP44=
X-Received: by 2002:a05:620a:24c9:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c9607a7a59mr149124185a.11.1745608647084;
        Fri, 25 Apr 2025 12:17:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhxvPbUgf4x5IWB/fQYC99GfuF5ue+amA++zXhl2G8A3b5eTC8c/agPDJ4FcIoJ3T+aG5dJg==
X-Received: by 2002:a05:620a:24c9:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c9607a7a59mr149122485a.11.1745608646681;
        Fri, 25 Apr 2025 12:17:26 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f6811sm1690254a12.47.2025.04.25.12.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:17:25 -0700 (PDT)
Message-ID: <7ba896eb-6d22-420e-a289-2f7f650fd39b@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:17:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: firmware: qcom_scm: Fix kernel-doc warnings
To: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250425-fix_scm_doc_warn-v2-1-05a4f81de691@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425-fix_scm_doc_warn-v2-1-05a4f81de691@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FjZBVHTwIhtvYXFWnK5ntTm3AAtOloyz
X-Proofpoint-ORIG-GUID: FjZBVHTwIhtvYXFWnK5ntTm3AAtOloyz
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680bdfc8 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KcDGLjRRELW1gusNAwwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNyBTYWx0ZWRfX7JOsKTQg4+JY Joy84YCo7KlSrDAa9jJWmCU+oAdkRgPwsDdsAKf4zpD7qdNToGUj9hzkMKXCsQiz/Myws7W5eqH HAm5ETIXaYdvAl9TCqpHzNxAatED818HfQCYZMmqkggvVJWu3QIPP9WDnm1mJVp7J5DiUg2slPy
 5r2y7rh0hklmxq7/zDsVG1hdUbU1+O5S55BXQIipCix0m+bm2fT6jHZehzalv97xuV1C3zAhyh0 OfWazwW8CrN/ljVrmw+VAotADiHkuO0+/O/cAWjXEqmQVqVuAU/vDTshv14LoXYo5lIpwDTtR/M Gv1Q57oAmQR28EoVK+VlY9FzE4qzUnhf/ULJma74JmkNB1GFtiufIUQ0HK6yj6p6FbN99c1KrjP
 NGbcPzXduPHWGeUWboMqY1Yf4tffIjVqjWfefkOCPTfHW5JwIRxY/ntACp8iXGrFODrna7LX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250137

On 4/25/25 7:32 PM, Unnathi Chalicheemala wrote:
> Add description for return values and other arguments of a few
> functions to fix kernel-doc warnings.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> ---

I only noticed now that the commit title is funky (unexpected "docs:"
prefix)

Konrad
