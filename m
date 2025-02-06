Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388551A8F95
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738870854; cv=none; b=DqKgjciv21gwfdiGa4qA2R2fIGd/QdwfZ8xESo/iHMnUqryCUQHTds7jo8ftXvSEKkAw2Uk0s/zSSHEA0mIdj0KSSOfqq6ITPrdwPiEpjoAUUUhBixVm+EPM58s1xtRvrrQlLVeau7TRPJIuc1sW7tydKasI4CdZ3IobqpCJKt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738870854; c=relaxed/simple;
	bh=kzFOt+hUFf2hH0dfSHzEMgZGBx5oqybElRnsgUP9O+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNPX+X6+gtPpk19NE7ZUECIwvshfLxJAnuK5Vw7XixB3mI1bi1CJospvq0NUJhRO9yMO6D6JDIJTlMGUkd2jz6SIiHAOMFaFHUOu51m/LCOM6FFI5A0TsS3mGgkvtBnZLHIDeBE5JUat6YyHjnYecMqNo4Sy9GKhmsdmsj6t+zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEiWV6ZM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEiWV6ZM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516AGVU8015699
	for <linux-kernel@vger.kernel.org>; Thu, 6 Feb 2025 19:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzFOt+hUFf2hH0dfSHzEMgZGBx5oqybElRnsgUP9O+I=; b=JEiWV6ZMs6Rcgd6m
	Rk5pSE6UsQbQ/v6Uoj16oVvB23CD8gYVux7FGaIrFWWCPTwm7FqtlWfGJypfJaKt
	/cYCSImgiP6PQ+b9UscfGuuL/Pty1N6DafI5ypBRjxcW0gBYHDoH/oRunhFw2Ynr
	LQQdf8cJXJ7SAkCPFc6mi1l+CPlaBUzKQ3xGMlnLVNQkP2DO/Zsx217gzeD8JiPf
	pizf24t7hCX9KvMUxjn6QEXbphRS2umZR1E/E+Yx1Dqeg10UHc9NgzRokhCVjYvu
	Zor2Dwow+V8FNBFuceikJQbbejD0k7mbtCUrpgdPmEomAiuSXP7NIA0rq5QWG7ur
	YmdOpQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mu6f1c7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 19:40:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e4287d04e4so3540686d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:40:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738870851; x=1739475651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kzFOt+hUFf2hH0dfSHzEMgZGBx5oqybElRnsgUP9O+I=;
        b=NifwKXeCN6q5fa9lJmsSx85pq5Crbi1vn9Cq/wHkC+jY6D74l7AJFL6cXQZNXXOj92
         BqgE86+rbxZmQxBXfhMwG1f4Mh/vXB2600L1hoI5oWte1v8xZ+Uk6WhRgvPL0Quk/X1F
         cKo1x7DH17ed2KLHRnc13LAkfQ0xzAyedbJO+xF0tkoc9+Qky3iHmCx0D6F3LwXormwh
         gt5MeBMZ+LSzlmFdVqY/2Zv8j3ttS47Zc32aoE4+2/6aMhfufuBeWV/WnKMfnqX0pUDd
         0KFFabdYLNpYAUQbSNuf8MU6DLVnii0NzA9FhhwsVW6kj0UJdwYKZykL3fotkyHjBNhj
         opbw==
X-Forwarded-Encrypted: i=1; AJvYcCXBuM9DU9zIieXE2KvpHGu6scWahNXORkCdgrTP39zw14Zkkk8XDob6xhdw/uHazrYskrzRZtq8n+OVCF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsRpeRdvoS/9y228IgE7Aoex3YiMNixTyCW97RsHC3UJXyurn/
	R3IxtUde81KRJ4TTImfATQjnN552mEXPP5AqP1NhErcz/qa2TdBGVIQMUZeI3TLyp7HLY1jejvp
	MCGkCL930OC9d1ycGysyb3XRSzxjZpdjQ8V+VE8A8r69BSTzUpY/12Seu0RqGLkQ=
X-Gm-Gg: ASbGncv7zi5vCc+L2+2xu8AGdpvTrSp2aRx540RjSjPgIAc8bLT4bHaPGGcAFyeuwec
	1GtcMD6oJ3acnG1TtUYeFumGPBnuUMN9bko1rFPYhc9ILByl/UzQV1BlFdNernJIc3BC4zDVIdT
	MNhNxKplMGCXOBQFv6wDucvltRV/G4i+JgdYLRPylpUFFkPvbjdqrfZaPQRSJPx9hk6KfhV8h9i
	dbOG0zlW31H6XQbGimiZy6eWVWm0NUm5Iv2e5IFldZimaoZvZ7C+944jmAsJrYxB7zinWQiF2rW
	MDa6/1zFYl0rp2MHrUluoA==
X-Received: by 2002:a05:622a:3cc:b0:46c:86d8:fbc with SMTP id d75a77b69052e-47167ad1375mr2774371cf.11.1738870851167;
        Thu, 06 Feb 2025 11:40:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK2GFCexxJpENqKGcHNEyCUS9NksWXDELz9dkEmRkjk/gHfsgg3nLmQnccU+pMc4HP4PrA1g==
X-Received: by 2002:a05:622a:3cc:b0:46c:86d8:fbc with SMTP id d75a77b69052e-47167ad1375mr2774141cf.11.1738870850809;
        Thu, 06 Feb 2025 11:40:50 -0800 (PST)
Received: from [192.168.65.90] ([78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f8460csm145266866b.62.2025.02.06.11.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 11:40:50 -0800 (PST)
Message-ID: <1ded2597-d5a1-44be-b5d2-30b70657730e@oss.qualcomm.com>
Date: Thu, 6 Feb 2025 20:40:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: ipq9574: Fix USB vdd info
To: Varadarajan Narayanan <quic_varada@quicinc.com>, lgirdwood@gmail.com,
        broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250205074657.4142365-1-quic_varada@quicinc.com>
 <20250205074657.4142365-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250205074657.4142365-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0lw-H6xuMOyIScsrMTuiPwQKODiReo35
X-Proofpoint-ORIG-GUID: 0lw-H6xuMOyIScsrMTuiPwQKODiReo35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=624 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060156

On 5.02.2025 8:46 AM, Varadarajan Narayanan wrote:
> USB phys in ipq9574 use the 'L5' regulator. The commit
> ec4f047679d5 ("arm64: dts: qcom: ipq9574: Enable USB")
> incorrectly specified it as 'L2'. Because of this when the phy
> module turns off/on its regulators, 'L2' is turned off/on
> resulting in 2 issues, namely 'L5' is not turned off/on and the
> network module powered by the 'L2' is turned off/on.

Please wrap your lines at ~72 chars

You use "'L5'" and "'L2'" a lot, making it hard to read. Try focusing
on the effect.

Konrad
