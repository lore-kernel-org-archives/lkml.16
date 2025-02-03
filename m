Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE94204F72
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591016; cv=none; b=eVOpYzdXf58XpdhMDOQsLz0Ouh/dPRXwE6hgOfBPkmIDgn/PJZRVsJNQ8aLv9nMloF0nnylFuarxuDUW+S0lMa+m74RKdqSbwjHPKajO0D2NvUaglmljtK1vQCQKZnWrj2hscPGok99rlbEro7vEA86+lQjOFvBK403X7VgpO48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591016; c=relaxed/simple;
	bh=zz82p7hcneLrafwVsfA0STSZi0ieg+1/nWnNxjI3JCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOC3LTE1phCCIBQksWQ6STb6S14kv38wHlE0FjRcY0decGF4qK9TSadhhKsKnx9TjD+GUqwk6X52m31R3wv5jA3Ouu+LjvNcjTpgmxVe5eQ21QT6eLsEGjT2cdNJdwJDmURodvnHXkOSA7HITT2uHJQ+dKh2ImtJaRVGJi8vmUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cobwUbxO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cobwUbxO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135kZOu006247
	for <linux-kernel@vger.kernel.org>; Mon, 3 Feb 2025 13:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N09aEg4/UjLzB5RTR47KifPhflhm9MeBFZX2WuYWw8I=; b=cobwUbxOXAsBqcnw
	Afsp4K2iN0tc31AOuklNlCpwBhZn1lPVKBCklKB2jmMLjvPvcasZCR3u5Qt1URcu
	aInGWPfl7p4hWiLeSzyO2ev0VpVSc80Pe7b3pC3lql2xsQMw29Vs7fHPwBQPg6Kj
	wlPU1mqL/3I3iwgDGi2iGXyrLrwkwG3rweKpxPYzOEnx9uU06QOANwUeloX7GeX/
	tGewfOdAsVwnC8gr6+nEs6odMVHKxGmWb6daVieGUodPJsjnrxEZqJjDEeDoWetf
	8YpL/I1cb6B2Sy2k4Z428U61IoEpJlqCxxx2hpS4djOK+LtHYAEZnGpUR/DzV+E2
	w4AmiA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqxw19fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 13:56:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8824c96cdso10329966d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591013; x=1739195813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N09aEg4/UjLzB5RTR47KifPhflhm9MeBFZX2WuYWw8I=;
        b=CyjMuu+XiMIoo6If1EdI2Ac2xtXEJgcPlcBZ1CI1Y2LyiFhEEgzfwJBCGPDu/0ilB6
         Wt2SkhFv/V1bMEEw9VSDSAwisYKRR2r9Q7E2cLHHns0kfRdAUPuOZpCbsyomafKvuhha
         YjOkipsVKVIdewbE3aulwMf3tVY9P8tFj7qwn6LqBU9a+h9nwD7zEsxCRsaZbyeumlOH
         JBnqbqZROIsubElzwX7dk8+W3t+7L4h9M9uGTQ6MNYyVRwniYDy+lQwOuK7NcY+m8m54
         osLMyo9VLR1Lsyb1PKIXRnXEoqTJq5RF0EhirC9GjRqNmMgaYRwrsHNglRcG0WvMFeuL
         hEOA==
X-Forwarded-Encrypted: i=1; AJvYcCVWgGDKwWFMzOzMBNP+GPkz91p3PqYmQ8BsBRYlE1tQQd2Viuq1JGRuHadYOUzFo3DzrOQI3R77M3suZ6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyCutWIV8GU6j2M04NCHmK0u90eow9aYp4+eLWSvvdaPgXA1Lv
	xFyEsqBJNIeOOE5UCvuGMgVNxWaM0ZQLcWFQi7KZ2Ldl2v4+7EZsgjmTrhqVJ3qTNa1SqjFTViV
	mlz1JEHYhvd9ryMy+Q79ZMCNQe1/Z1kB6O2hoe8LKJSfYhVvC945k5yXSAw6hlpc=
X-Gm-Gg: ASbGncv7UjVD5BtlkvRxsgTOD0EqHJrS8fU0kWwkxXN3/lDfFHkmmV65jLY/UTDa5M5
	kGzvH39EqcYHY+zZwOmQInYszAgPf7O0mkItKJNB78cD4wZt4Zt6a7EZIYD8DLT2c945hNEkelo
	RewOMc1TFjlrD6C3545pbVP1orxa5HoeWQ+baIBLLbsO0LDndFbdGBXOUIFMIk8RTCF15rubele
	mILZ8dsEE6YU4LeR8mtNBS8071g66lSKE0nYZ4WAJuOSY6BLoRGQ+jlazMU9HRstbBCSZ4GsBvU
	Vx1kmnmsJ/BgW7t+oFbgKDRZXO7wUuI5v65D01euCi0Cp9azq/gW7NFqouc=
X-Received: by 2002:a05:620a:410e:b0:7b6:dc0f:406c with SMTP id af79cd13be357-7bffccc503cmr1279660185a.2.1738591013143;
        Mon, 03 Feb 2025 05:56:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE62P5OcOODF9zaK87BlabKbKuPd8Li0k9f2+3Xiecc6zvEmDG9TbpzHHpkVZFYZoCSltuIgg==
X-Received: by 2002:a05:620a:410e:b0:7b6:dc0f:406c with SMTP id af79cd13be357-7bffccc503cmr1279658385a.2.1738591012780;
        Mon, 03 Feb 2025 05:56:52 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff3d4sm756840066b.112.2025.02.03.05.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:56:52 -0800 (PST)
Message-ID: <f63c0fd0-e94d-418f-b921-4e7af9d43c31@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:56:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 display
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
 <20250202-fp5-display-v1-1-f52bf546e38f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250202-fp5-display-v1-1-f52bf546e38f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jmsUFahi1oQTlOo7awIpRVq2ZGjVjAkI
X-Proofpoint-GUID: jmsUFahi1oQTlOo7awIpRVq2ZGjVjAkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030103

On 2.02.2025 11:45 PM, Luca Weiss wrote:
> Configure the MDSS nodes for the phone and add the panel node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
