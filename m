Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A96111A8
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591797; cv=none; b=B+0azHDhYrKc/K7RokKIT8h7Q91jS+DUF+fpA89gbHoTrWMYvP5QyLsMEPT1pSt0MWR3p2dRW1xrd2vmL3PHOwsYam8j2hOhrkhH1y3cHgvwiLDCGXUwwjdt8OczvgLBwQtLo8M7EFizKqS3kYXWKnCp1LKRBOebzPY08cIrXvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591797; c=relaxed/simple;
	bh=x3CVHKQsrsBc35sYt/SLxzM7OsZW74laauClXu3SedQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AC1MErKe7A1uAtR6uI+qhJ1uwY325PI1kn9r+wo5mY+eBaAmt9RiYF14EK6dWDaVpGaLy2FIAG8aMNegwRZ7inZqtAni893A6SJx1m5O2FHj15YvRoWZNihT3mfGRiTVnIzdo/6MzukLdaA+U3mhga49BCruRIlt17WUJyFodug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HweA8u0h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HweA8u0h"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513BUaVH003933
	for <linux-kernel@vger.kernel.org>; Mon, 3 Feb 2025 14:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqnvQI074/SnPhRHaDZqDIU5f3FDzozpaHm90U+0054=; b=HweA8u0hbjNe0fJb
	f5n6RWmKMDZ6iVaCxA1mUqv5GcjN2NpU9mrTa/S/UvONbp08eyv5fqnAsZ8JkKWL
	CCLPL5+8HSLhEqdtO2KtPzGrkidpVYQrypPRHZV/j/ptmMKlZHPNKxsbSp7bSHAx
	dFBGOqYAfhHeYiy2zrVY+ZE8CX0PqwRzo+AKY9tRdSgVin1kT5iwbvBbfnimmZVF
	nVIQu269efng/uSfvDqUYIphJnPsSgzw7z3u3ZGIsEwyem5d1zC5ewOPizCAxPFN
	jozxZBCjJqKaYbatIG+vvggrOMjv6D9dmmyzMJZa5Rf0CoqRjm6R+bakGAFRyYTc
	WOIJFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jw03gj7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 14:09:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b700506e64so23877485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 06:09:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591794; x=1739196594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqnvQI074/SnPhRHaDZqDIU5f3FDzozpaHm90U+0054=;
        b=DH6VgUrsNb2Xit7oOKgeqLfmeyY5ppJHKrEysJVpSQeYOdKVhpZl4LULzxRBlilE2w
         IF/N9rMMypmx7ahCk9eRXSpCPwS8LDOnkogGM2kvSECFsELM9+mNZarbwb+xu0zxB+l/
         4FzgWILS+ZTOUes6yLRln935UhoLbR/B4HuRS0JJRA0wPV8GZOp7tYO3Wj9NJ6e5kqqJ
         JOQzI563N07RGZ62EXd7DeU/blVVBmHgk57OjM3VIAYLyQJUEoGdle8+yNaAK9Uw5WK4
         Y8r+eGQMB+M3kzg8hKIhKu/hvkmC63kExlJeTTd8GwDPfrwfbFeYEm1Z1r5L5pwPOXmi
         0eMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4jUtCQbUeebn2FOMTOJOFROt2E57BKyynVVRR6tZfKmlqEBPYa4ACuDkW1z0EhECUygoL92KO7/g1Jn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkSWOp8USVDZY/KPpFVvkrfo81d3ztIkSdZQp/+tIdUOLTN8iw
	KmMpSW/oOibWueENzzk2I/guaVoKeFPh5T37+d4pa6lZzZVqM3rJe/Y/Cw7XDmHRMRiwa6NCajc
	rdbm7j7J40NKgYeBEIrZ/WSyNsn5Gme9rVBhh0msUQSJiLi2BFfzh5QeemSVaf8E=
X-Gm-Gg: ASbGnctXAu2D8+jXU0OGX0xlyfbFHgWqNSzfszqZYyTMHDjA/rsaX96OrN/tMFgj3hz
	FMk4f3X3l6W0VZjx1K+oLRluatBQM2Tvf3/+9sgXyIevnNt5MSIkeydKhDT1o7pGUBOkwXh0HOq
	SKWjmA+QBoRFnVP2o98L9wbyitYSMJgTtn27rTwJ7FJJuxklXE6gGFxmqPYrBr+o91qbf7hiS8M
	4qhnoxmbRLnemX9+swhC2DE5MquXGq++TO5dPhszTuvHUyGTlpbliYacD6v8Yi0ih2z1gk+NTbo
	rDYVSWT174If96ipLvPbOvlgcSW/Qm+TV7vvqdlH6sMX+UhC1/rI2Zu0zNc=
X-Received: by 2002:a05:620a:390d:b0:7b6:d754:2076 with SMTP id af79cd13be357-7bffcd8fa55mr1031476085a.12.1738591793731;
        Mon, 03 Feb 2025 06:09:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEdwI+jcirq72tzg0fC8beLhnirVMEduC/S0WxjJZZWIFxTyTZtGZdO0egq+PfA0bGFTgCpw==
X-Received: by 2002:a05:620a:390d:b0:7b6:d754:2076 with SMTP id af79cd13be357-7bffcd8fa55mr1031474085a.12.1738591793255;
        Mon, 03 Feb 2025 06:09:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ffe2csm770673766b.97.2025.02.03.06.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:09:52 -0800 (PST)
Message-ID: <2c306351-39d7-48da-8860-e8eb75e301e0@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 15:09:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300: Partially revert "arm64:
 dts: qcom: qcs8300: add QCrypto nodes"
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250128115333.95021-1-krzysztof.kozlowski@linaro.org>
 <20250128115333.95021-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250128115333.95021-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wrCExuaDTeys8RT1qzaeiiJ_Q8AqJssm
X-Proofpoint-ORIG-GUID: wrCExuaDTeys8RT1qzaeiiJ_Q8AqJssm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030104

On 28.01.2025 12:53 PM, Krzysztof Kozlowski wrote:
> Partially revert commit a86d84409947 ("arm64: dts: qcom: qcs8300: add
> QCrypto nodes") by dropping the untested QCE device node.  Devicetree
> bindings test failures were reported on mailing list on 16th of January
> and after two weeks still no fixes:
> 
>   qcs8300-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>     ...
>     'qcom,qcs8300-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/all/CAL_JsqL0HzzGXnCD+z4GASeXNsBxrdw8-qyfHj8S+C2ucK6EPQ@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
