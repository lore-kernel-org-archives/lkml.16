Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6496B255E29
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211355; cv=none; b=sfpxHXc5CSiLlRGFAXIiejsruLm2KFgeSr/onJww+aNzLo5jIGi7/MAMFZGEK8V1C2wCMJYH4AYJZXOcgN6gRnxjNJcuLl9S9WbpWruroCBla05jywHGjqfpjzVShr+Yfa8FwqZ20bRAIC7TFHv2Z0pDnTQ5KTZcBPsCNDLsoUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211355; c=relaxed/simple;
	bh=DEygm5HWW7X1xdGiLNElosyRq33AJuWmRSE4tqMOcIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s944jwJ4RnU6G2CTthxUkXotooyzHUWICo2LnSiBbAg7VnFWICPTZW0APW0uJnHVYdAZQqvMtLOXn5DqgPoi8oejTaLwS5ZsHQZEyXpkCdSzwtnRXQPqo2oOQXngzDK9vQfk7IQ8UpawcmtfP7KOt4IIp1xun2z+wbwMX7HT7B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k98TtJxG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k98TtJxG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9cHFF021262
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCHZNtni/CSZJ0FFRkrYJ71iWbDqICIFGe1C4Jypxx0=; b=k98TtJxG9YSJjlkz
	AZn4RsntfJ37bbMCwWkkY6LGBUw+WXm0i23q95qFfFBG9wSOxFzQ7aQaN1vLHXTc
	t16eCKLZcEd9Ng3RlWoINgr4B+0iu3EmsBXovO5HGRPRM76udX/swr8InhRYzYM3
	qYnKXvuvldCKB8tuL6lCSgs8yqklbLHdBFPdtyKW5TZ/JrfZ6Cvx6b/hZLoZWaqj
	ICqGUL4Edn/+pVeq0nvdeyfFlAsFa/bqwea3trGlIlbuFTFh7zu29JDM3BpyONdB
	XWT0mlS5euFx8RvxLJY01O72MUSsjzb8cnXLoduwp9bOvuTzJ/SmaPj1SOjKnXuj
	EXff7Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyn7a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:15:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47181a14d8bso7540921cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211351; x=1739816151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zCHZNtni/CSZJ0FFRkrYJ71iWbDqICIFGe1C4Jypxx0=;
        b=ZQkl+xiXG8Ysmf/sQn5JlvJOfYIh9jBLZ8QZ5ABlBm55ibNMZwkrISpifATcz33qMP
         ITA1rxGbi7TghAhzx2cRq/1mfe9da1yO/TRkcPAIwYGl5tb8or+N4O9n/I2WSGs2wwqC
         qB7HnewajRBenUU7Ssit+UcGFkd8Ww0m+G2N3AChog1DykXnQfkwicZ1Wt25LVhe+/me
         cQ0ND3o86d0IeWmGe/h4+oqgl4uSzb6yVO6+1W+YPsdR3PNVgysYYlO3dOu6k3ULlN2C
         Q31McinclC40nrgyDWswZkr6jUeoR2Lagt+cSdOJA7Z7OCXe97OC1vBhhEpnC1qnjZFs
         +mjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9fyJEPwnoTXuJpbc37q0HdOxXM/LiwFGOS/SUgvQ1eHu4R170n9KtZt02k+IInE5OikmzkXpi06b6e3E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf8NZoqG4pPBi051VuzqsTmv8w6LJVZ/e+4cWSPcD3F7t70xQ+
	JHql09+IQ9ZtT0ohDlkYltsHcNe9Uu9PTQr7MCw3SqL3c1UkrKg1DpK+g5m221u0GTttnF8Q+Gt
	D43glCdyPQ2Hz3TvKsoLlDUy29ZFyRv+BMFwlIiJ+Ulpq/5vWXLfU0LC/jAsHRjs=
X-Gm-Gg: ASbGncsB29MGqp7QHRqAFkIUu648FaQf8Apm0vbfNxXAg7SqufuNJDbVKd2EsZ+XFRL
	1+PiqpTmkEfQFT+Wkxk7UQNG3YP50byIY8bDGdnqdg/2Nf3Xzf9VWTihR4/BOHA1eD178dOwBa6
	L0miC1VhQutlHIPJr5BX9QrfGUsfXa2Slm5gPeVg1kzIBcH80G5TTcQTNXEGtgkORsSt3bsICge
	FEioyPOxzgkeq912pzWrZnVxPAI1KGJE8JskjrLRNuTjRIeQ9Es7C4t5SeHTSm2fSrLOHDgT1G+
	FpN9+4Ejfu23Nl+gBELXXuMbkqhWu90C8jtePrME43taLO3tlxqgfNZqrjg=
X-Received: by 2002:ac8:5fcc:0:b0:467:672a:abac with SMTP id d75a77b69052e-471679dc26amr71995171cf.4.1739211351343;
        Mon, 10 Feb 2025 10:15:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+wRXNnWRPbq293evDdIvEhGqEHzq1kYbvdr3w/KyUUAyfZrYq8rC1dDpVfln5xyQdRsb5ew==
X-Received: by 2002:ac8:5fcc:0:b0:467:672a:abac with SMTP id d75a77b69052e-471679dc26amr71994941cf.4.1739211350986;
        Mon, 10 Feb 2025 10:15:50 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6c77esm8235727a12.69.2025.02.10.10.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:15:50 -0800 (PST)
Message-ID: <0a1735a3-b57e-4a98-a3c8-46e92b5cdf0f@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:15:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        biju.das.jz@bp.renesas.com, quic_tdas@quicinc.com, ebiggers@google.com,
        ardb@kernel.org, ross.burton@arm.com, quic_anusha@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250207073926.2735129-1-quic_mmanikan@quicinc.com>
 <20250207073926.2735129-5-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250207073926.2735129-5-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wMGKd7nx-VjDKAKsjD2TRQFoiTlc5fC5
X-Proofpoint-GUID: wMGKd7nx-VjDKAKsjD2TRQFoiTlc5fC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=709
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100148

On 7.02.2025 8:39 AM, Manikanta Mylavarapu wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Add Networking Sub System Clock Controller (NSSCC) driver for ipq9574 based
> devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Thanks for getting this buttoned up all the way

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
