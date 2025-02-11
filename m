Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38059253359
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286165; cv=none; b=QEtAtBtiAFqrFkRvukx29X86IjPqLkCVs35T1sF8qCZ0hOWmje0k1Klzkz71dHwzThd7Fu9nuizwY1MwujHwNFgiQLIyyEYVGeIgtqEFJyRH7Au2mNWY3E3r8gy574oWDpf7spTufeR+VeuT9EjwUEvd+RHhoVAJTu/TF9h+wto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286165; c=relaxed/simple;
	bh=0MoAkeXGXl7JWzofzMauQ+F1BtvUSbi7MBO3YLF8uHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ag6K88A/8aJFiXozefKhUptInkG/N1VgQN7t/5POLzzuSnW21H0LPLzdmrIbbV5y7ObnHUiFgKtfUoVVco2YsWF5xJddsSBYNxwBxWDiiBZv8qUkOupc4cDGnWGGhztDO2RHN9hKu2FmFEdQ5IFlicPTmNEinC5K2dpbqHxkxBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxOnScG2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxOnScG2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BCLUGB011429
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6Q5hm1OPHRpoa4kVXD8cbwi81K5xuOqGMfiWarlgEs=; b=cxOnScG2MS/OL3Jq
	wy5ZpSpFLBMqDO9KZWGn2zTmKMVcDfTE16PHIjmTdhLSKfRvVj7jTdVrThdT7z/w
	FOY5GkK+lyYIx6p1gZzLwdzyli6G/t+Uf7H5Aik8mAtjWZOIyIHUdHV6cBA2Ju23
	fpmnoDCVb0lQqlHTKXFta/s3+3tbVPWHWw6Kcof4MckldGQydPIlfIjPgN02JUFe
	Owst2k+jfWimKC+2Dp2luad6dbWAS3D9cAd7KsXTDiK3pgSJsnvGZSdi6NQul7i/
	Zz3C9x9dK/kjaS2yilk8eb1kinWb5AcAjhjbT7Mbkkb6/JmuwL3JaZevyYbNmQly
	+oznBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxv3sryw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:02:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467bb3eea80so1638641cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739286161; x=1739890961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6Q5hm1OPHRpoa4kVXD8cbwi81K5xuOqGMfiWarlgEs=;
        b=hcjOP75SV9zoA4E3LgaVoV6/sraLxPvbH6PRdu/4RQHkoy7bprT7DhkMCVzsFt5PH5
         nS3z69m09u2uJlDj+Ti5e6RbLQXTZ6r9ZRCphPw4ycN1bFooO+1M8WKAQFcLXy+u+txB
         Id4FVOWZvIkGNRhJvkGDkxa6knZAQmBPiRvEnFz6xzwMLAYvK00Y/gjW2wEfCeXLm8ng
         YtbMwqyRyuHWP8ZRR/dS1OgwJgL2es5edziC42NeE4GnJ17yNlXJIEW62BQBzrjgpE/u
         JacYzjX48i4zniYL7L/hzSiXUrZEdbXObtQl6CsME5JG4JnQ0gFbjGhmYH6eHT9AK5Pn
         ycsg==
X-Forwarded-Encrypted: i=1; AJvYcCWxTcz7g72vcdTKderLtyX3QgdIfuxwVVs87bYpyg5PdCyz0mVJai/d2C0g07mdll77aKQ2KWXZfA0HuVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YytAjJLOT3j9guanDobPv8qyDB6Z4RtsEVel80pb4cDkDtSPkyv
	5P6uJG8nCy7VIi1tvEmiAQebEehGz+owvZZpRXBE34Eocmkfe4LbuCOEl5o1IlFH4hWam0awt7t
	fvFBx8EG+uNjgAy1MKbA088TupeSqkNw2pcl68tCkqP5qQHb2cOMquyZv2vrjiic=
X-Gm-Gg: ASbGncu72q4ok9K8FqOSJevbeWxL2IAJYf4kBsOaKeooGQ8TCIKtn5TlcgsTcZ+9Xlt
	uojnWHoXE3mfX4B6Jc0J/G1MKVUjPAhK3XR9mixSkJBemPIrS0aQDm72RK2IiiA88YU1fHaht/0
	vLNT5Q0WL3w8BttPTkWNIjWyEdPHgASEDMkDIq9TEhZuhiaDkWpUqTUQsL9b4T49bxaslxfsMzT
	D2aFY2hid9dPSO0M/1I4GcEJuied7I7IFK2paIZAnCfS8DCFqiILTn98DYu1ePxvacqFqsmpm0n
	hzCy7n6p0rRZyS3vS57H3ruLBmSOizdgW9z9BWmKt5+yra20JERZmpd7T74=
X-Received: by 2002:ac8:58c6:0:b0:471:9a74:f46 with SMTP id d75a77b69052e-471a3e27799mr15311311cf.15.1739286160818;
        Tue, 11 Feb 2025 07:02:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqOTD4B6Evza60wAUfKUybCDvikPI7vVxr1RuQkYFD1D2hK4fwRjHabOJVHvZhZQTg+r3eDQ==
X-Received: by 2002:ac8:58c6:0:b0:471:9a74:f46 with SMTP id d75a77b69052e-471a3e27799mr15311081cf.15.1739286160410;
        Tue, 11 Feb 2025 07:02:40 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4e6d60bbsm7827843a12.15.2025.02.11.07.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:02:39 -0800 (PST)
Message-ID: <e2bccf9e-0a30-4177-b3e1-996230151d3f@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 16:02:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add the watchdog device
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>
References: <20250206-x1e80100-add-watchdog-v1-1-77147510c2d7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250206-x1e80100-add-watchdog-v1-1-77147510c2d7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1roTr31XcmC_cugchviKjrQ3EgUrQSo8
X-Proofpoint-ORIG-GUID: 1roTr31XcmC_cugchviKjrQ3EgUrQSo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=737
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110100

On 6.02.2025 11:37 AM, Abel Vesa wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> The X Elite implements Server Base System Architecture (SBSA) specification
> compliant generic watchdog.
> 
> Describe it.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
