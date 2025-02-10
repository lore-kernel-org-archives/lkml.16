Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C623925B66E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210911; cv=none; b=bm6SKVt1FOAnrjv8kePD9wz5IU3wzVPAt8ETW9kZI8/w3+0/dYMQiEhNpytMeW5bbUMfuecQ+OxNa81Zpiad1QdaskWYlDXDBlmuJJ5ktgItJNGQs0z5I88XBzn3itV5A3kwhMbrem69PN/aXxufh0dTMqdQEWcrA5IDsBucWZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210911; c=relaxed/simple;
	bh=OizxFAd8Ml7FWVe9/a0dRnpl/BRHIHyYnN/mYC7JJRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQG/BJ4GmR49ZUeudZ38hPXkNDbvfDV14+6ZTZwySNBneKDa1LVMPd2aOecaUuuoghe4yGUJ3T5/9Tt0WPF/pCJa77sNNZvI8nEI7jmwCALIyugyvYgoHbUed/e+gosSeJlUd29FA9xblZ+d6N+Npaynism5JLW2VecKBDmk7jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rq7q2rZT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rq7q2rZT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AHsPCB006184
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aVEc4MQ6CdO3X005rNysHQSMC6MxwNXf4vRrEItGde0=; b=Rq7q2rZT7t7BdYko
	JuUD8+Sw+Aqyry2pdzAPeAWj5QkByFsGln77OP1g7dXHuBO43xUKzZnoj+yNEXC2
	XMoKO9sJDjclozaeZVqP0qdPIWljYQF5WGTGa3NvnxvV/brigMJFaoOITFSNaZx7
	K/0J7037cxceIyWtphGFNVe83nQcYgOhlXgBplA9rqYsq9RooCYXrxW1e5mCIpIl
	EdS0jRD0pWhOjO8rbcZ/AXJ4jooTUHLJ1TBV3jN7ZewekY7DSVzBXu58ioyMmI7B
	MlSO0UGzhDhIbY4xnhCmXCwK3q5bWN6nrdOU+kIETM1zxM/lCgoeYeFrhbUqb5Xl
	oWOG8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5msj48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:08:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4718adef552so2588451cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210907; x=1739815707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVEc4MQ6CdO3X005rNysHQSMC6MxwNXf4vRrEItGde0=;
        b=J4gYebhwK41SoLFlWn0Ca9KwzXpJFKntumwnDhVgr+lkE7A3qKZq6DtU1f1izw+80s
         4eFdiqNIZ34t/ZfnFIeAyXDre3S+eRgxxlvI8h6s41MjnoZZfBYlgUe+Fq+E8o1PP6sk
         rDaGZbninlQZgD1GSSKWlpRz1BG3nCysEG4VvErJiuK9WKzpGZpOUcXadpWzXs2xGPzK
         wZrNPMHy/yYDxS0tlnM5Lcg9BzYvZ8CKGbsrCYJOMmXPGizRHEBKiLa3SUnLu0Cv3Sqo
         B8V78tguAqbjelk4QYCzZdUAyxdv/qn9MImakfLR+uY36wdmU/dtiuPt1hcFMqmu0gR+
         ea/w==
X-Forwarded-Encrypted: i=1; AJvYcCV5YiesFAuvsL1vxsVDR+sF7THotMpY1epivQvPGCIHEN/jdEwUnhyqTYhlmOwRZNYL5LqHZUAXPT22bmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ6Ys8gKs+qlR4kzrnqPOWBW+KENbPNn0TvgBt+pB4uo+1PByH
	UQw8TgzrY+h5TvOfgJQKTcAb4LiwZU2CSy+gmzgWXJSfLoiNbtiOscw9tSkrO1VHBUdQgXYsor0
	TFDJRnnxIyTHRepvmysw7radDXxNK819GXO+SJSZmgcaMRUxRnnThvnZkJoMHgdU=
X-Gm-Gg: ASbGncsPwXcXJ0iXXmkvCvoW5VaZZaaIdBVLTCyViyRqF3olu2ijIvphr8Hn6A0Ebzm
	w7iKCRKgQYYCmRzd/4Em9d5GXdH+pHWi3EwBME+niUBy8vVjrT6cVjQ2HXn6pVAS4RsCUskJtb2
	B2YCfrrhveVG9s41WyyABrDGdksgQfyE66Q09k0F6hcRrcnmfIwjWzka/MSeciDNCiv5144+7vy
	zfKlJsSZgxf4g7T6bqbStoa4RKeJSlDWv1JQLA6HDGA0aC5WG7uYKaTwacz6yn1aTc4rm5yXYzQ
	xZmVZKTj0+e5V2V/AULb77372kTTa/NEcnpON2sjkUgreJfUYTShNAIKMY4=
X-Received: by 2002:a05:622a:149:b0:462:fb51:7801 with SMTP id d75a77b69052e-47167a27b02mr81244401cf.8.1739210906692;
        Mon, 10 Feb 2025 10:08:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdrknB8s0TEZ6l6OxgfCx+ee/ErwU07AWVUGCwldaYl2UrQYfRoVCq+VbLfV+XOerh80eF2Q==
X-Received: by 2002:a05:622a:149:b0:462:fb51:7801 with SMTP id d75a77b69052e-47167a27b02mr81244181cf.8.1739210906224;
        Mon, 10 Feb 2025 10:08:26 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b43ee08asm374138066b.88.2025.02.10.10.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:08:25 -0800 (PST)
Message-ID: <a37ae05a-5c9b-4c48-a321-08c26ee3205d@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:08:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: ipq6018: add LDOA2 regulator
To: Chukun Pan <amadeus@jmu.edu.cn>, Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Robert Marko <robimarko@gmail.com>
References: <20250210070122.208842-1-amadeus@jmu.edu.cn>
 <20250210070122.208842-6-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210070122.208842-6-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6T07x7mqEozrjSYmKYmSgDnC9zocFMQ1
X-Proofpoint-ORIG-GUID: 6T07x7mqEozrjSYmKYmSgDnC9zocFMQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=818 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100147

On 10.02.2025 8:01 AM, Chukun Pan wrote:
> Add LDOA2 regulator from MP5496 to support SDCC voltage scaling.
> 
> Suggested-by: Robert Marko <robimarko@gmail.com>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
