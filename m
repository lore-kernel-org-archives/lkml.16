Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79191253350
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748342191; cv=none; b=U2qVTYJ/8FfLACHJteTV7I2qt+102HPW69nLI7dw2flX7WjkpcA1iTVAuc5JKywNGt4nTuQblG4a0tSnzfCuvqGxomyfjC+zIN9j/qVOwrCAm5MU2WGoJpG9I6VjUuab1ZICOWJVFFlXG2PKcL9rUJFOXPSIwwDBLtgd2XtFgOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748342191; c=relaxed/simple;
	bh=95YD43MMSNqaK5LMwdPF8tp+FZ+dyamPivRNhheSkR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BW8oWu17qVwquEy4TiTAQPjEbmQhzNY0CxAm6+UKL89dJBpLuCpZjClvpWV4yurX1VNwDmnTT+FkPiAQ/EE6+Dj7Yrj2f7T7+ZUUTK86sMmOpT/mp+Snest6yfddveecsEvKtfkkr806itAQWxG5Waqu1HV96kx36xUlWVFyqoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1Z8B3PT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1Z8B3PT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R4U3Z2025125
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ft8QwZ0sa4EuuX7mh+a4pQA1Ub71zPC0fRpxDZpjuQY=; b=k1Z8B3PTu7cwO/An
	zSMjX58N9s/zHNyHpypRgK9zxFnjor704xYy2WhTwdHAabuqNjUb/rED6lNz0YZp
	IfDNYckh/YTEHZbwbDKMarSiC81QIS5IGXvcDukiTM8vKhyYfk1o85oI4nuYisxz
	nmaerRcyCqhnf+oXaTuczw1jY9NnnM6pwiHGuZ0oZfW2PY+iJqjUG+PsBa7S7Yxj
	ckcZbPqty9etM75AxcSmZxCJrCpcaj0DaJfa/EwtTt8IG/swxAHgGiCdiNNcERFM
	Bl9N71NMv90J+KMfTIaMFp+2QGzbC+DgXHP5wfQ3QheMoq53p3MYduTx9xOhch+A
	YBuLEQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p6h89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:36:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faa4abbe6eso4816076d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748342188; x=1748946988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ft8QwZ0sa4EuuX7mh+a4pQA1Ub71zPC0fRpxDZpjuQY=;
        b=nG+Dx+cm7crKFjfSplBPCvCSPi1n317JVfBs91nOr4B6e4TjxIiCO1P9nZslhwXRQo
         uVTPVu7L4v4PHuI9vojGY0513wKIKyEbmK7ymYvoQk6ZLWoGjfIdnVM4HdSp+3VVo+mS
         Kwy4QZwXL4hWKTZLHi83APBXcW/J7tSaf4wW1vGtb9KTc0/758K3FiE2TmCcfmL2B4Bv
         f7bVQGV0+zNcTm4ga+tcRJ9A13kPMkWIdVzv54nQHmHH7emVPsd2yBY+8uRFZUkAB+Mb
         28XTTZXNhrskGyC8IyrR86+W3bWhtCqeu5BDhPEm0Dolkaw0gcOcBAaVGNK8JDImfu1P
         WIZw==
X-Forwarded-Encrypted: i=1; AJvYcCVK/Klp7jzT0+0XMEckd4y2OMuWDcCDhyzxcAY28t4wDWcnwfkNZsPDnF2WugnWSWlnix3+6AkeTa9aTs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuAiIGEplmH2vNolGcNUKRtVKiyHbOF74wYEE/23jyueZy0N6+
	aJJOX3HP38xgdJCynNGK+9N5kbmrfT4rfIsZC/THiS+W1hoScWjZ3Bob+JAw/aT05+yWXcE67up
	eEJMsr5lvdSlCh5N8IMPd29zsQ3hAYMxoWTog4tu26MM4K7s18LeS0/lSKzOv8AU+EXE=
X-Gm-Gg: ASbGncsFaEFZqJq8jr2IB6pteNZPIjdVSURBLd5hqTB4JGohYh3T0NGTmhtvuwM1jgh
	xWAnZvc3VUC+95Fb09sz+53sYN9bS+4potq5sdEi7inVcMXpdyilQXHI3p/7Gu74m08Y7ImmhEY
	cEdDz+o3HNi7yCB/Vmk8zFdPDdtSRgD4tAAX8JkE1v/IGc1zmGJdFkkj1pr1EjDVjvPVLwjhaDG
	+o2IYyS2OMwxs1MsxuqzhxftmTy/HegEMp7JBuOiUGSySVUEERJWJ/cN+7+/k1xtjJ5sF63a+Ts
	/66pmaWFHM1jhPv9z760sZfMW7lpyYFk+69jBaYdzZuCk7WTlUSvXFN1CfMmsaMS+w==
X-Received: by 2002:a05:6214:2586:b0:6fa:9b06:99d3 with SMTP id 6a1803df08f44-6fa9d34820fmr72067956d6.8.1748342188334;
        Tue, 27 May 2025 03:36:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRa1Y4Koar63eOa+CmHZ0wuxOPR9FIR8wrbdrkAW5Zh1e7ttEcc8xkpvvR7wWXg0ZSiOKx2Q==
X-Received: by 2002:a05:6214:2586:b0:6fa:9b06:99d3 with SMTP id 6a1803df08f44-6fa9d34820fmr72067856d6.8.1748342187980;
        Tue, 27 May 2025 03:36:27 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4382ccsm1815593466b.118.2025.05.27.03.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:36:27 -0700 (PDT)
Message-ID: <0aef1687-0158-4d7e-8e3d-b6eafc38d049@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:36:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
References: <20250525-update_phy-v3-0-5b315cd39993@quicinc.com>
 <20250525-update_phy-v3-2-5b315cd39993@quicinc.com>
 <mcmpmaapzv3vbiynlrp6sijdjvj6a5j3dxzoixz6b4cxqsvbsl@ecljexn3zg2e>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <mcmpmaapzv3vbiynlrp6sijdjvj6a5j3dxzoixz6b4cxqsvbsl@ecljexn3zg2e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AKDbhcB8vSKMOiPsFq2mwJD7I7QmvVeI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA4NiBTYWx0ZWRfX7prqFKRXiKem
 YeV/ostFJtir7B3eTgOH/YHsj/ITqTIY+pPPdWhKAIBDsramFq/BYk1muoSrwtADd5m4oViBdxq
 V0rHaYJ4jyRnwib0uvLT9V7buYRGUEzwwbuKh77zHGjt0Tk6FQn7Ss27FJa9j6Vy/R/dOMG55WV
 KOCkV5b0OYc7Ca6pbEdCfau0pfQ2xNWAzKjahvo/VxxlW7hzLlskAZXMavGy1GRyaqtf9eLH7v9
 li2FjCk3ZLs7hdRbfr/VORrysZYgxTBpkWkeTH69ZQ2Uv8piPIVGWT4nh4PvTHqfOFZgdeXS8Qg
 SFhZn67f4AwnMPhr7MIgak3slvsu7A90+VeuJyAWGzQDb4d5duMU5/cm3MvxxCFcgYXw9iyyJf/
 j1gnpJcbqhsLpPIuXdtugouxihMMtYaysTQKVENQyylOru/oBKHjh5sNbAYyq0kZGjRfRIVP
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=683595ad cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=oxSCaEAS-4EJenh-H58A:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: AKDbhcB8vSKMOiPsFq2mwJD7I7QmvVeI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=756 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270086

On 5/25/25 3:29 PM, Dmitry Baryshkov wrote:
> On Sun, May 25, 2025 at 11:27:18AM +0530, Mrinmay Sarkar wrote:
>> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
>>
>> The maximum link speed was previously restricted to Gen3 due to the
>> absence of Gen4 equalization support in the driver.
>>
>> Add change to remove max link speed property, Since Gen4 equalization
>> support has already been added into the driver.
> 
> As Gen4 equalization is already supported by the XYZ driver remove the
> max-link-speed property.
> 
> "Add change to remove" is a bit clumsy.

I'm more worried about this node not having these gen4 eq settings
(i.e. the part talking about driver support landing is true, but it's
unused without the presets being explicitly defined in eq-presets-16gts)

Konrad
