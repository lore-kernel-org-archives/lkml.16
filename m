Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A461D5176
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590616; cv=none; b=gAq1vf8PYZNmbOytz8y3N36qR3vOLN9N5rkK8wdCti9WZlsDaRwz9ZGP7JZDOWUD6wT+vzBKXKBvSAzUgUvAjDzDJ7O1wC/ee/5aYHwU1UwG5TDWboGvEEIPs58RGD2hjJR5+rbDvoE8AL0X4wLb9TiwJgfwqmEkANOhda132MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590616; c=relaxed/simple;
	bh=Tt9vBDTFmYZuSOqXACKt/0t7ZIw9rhZJNXLHRo6BQ0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWlFTddK8oy7PtwmkwmHvoi0ryk+1pX5lkkMA8L3sVm5DnCJz6ZB3jo07cTw0vKyOtm0eRHn8v8ve11CRlbRgEu7kzYlfn6HyJkh5/BezuRTOH89LS29vTcSINDbC2NdroUW/xLY1H+PSNylPHuFFPu5Iz/shX69CHqiflU+qDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gzG7lLqO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gzG7lLqO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135LQsw014166
	for <linux-kernel@vger.kernel.org>; Mon, 3 Feb 2025 13:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nqxiWCIT/Tin2k7dnyFvGCB27cd0ePrjkyaWPJDOOK8=; b=gzG7lLqOW/iDn/Tp
	LSm0/gU06ruPg3G1dOPopwi/0hClR66txX0RGSYlLYMe4Un4QTYLO49YUb0QDF5E
	qkNEIEEcIZnULW7QfJkLNwqB5yN1FFP4KCG8kmi6BUMGKnzv+2gH61AE1+fgNOfU
	7u8EAsMb9IlIhH6x04G7S2IiaG2H6LPH6SoGLgvi5IFJtsZv5lFe+xua+hkmPEX/
	DSdtwu7esh7g8v7xIRbrmnjRzUNahHzo0PEGW2K6WENujxEJKKtDARZlvmF89NG2
	MT/Y5+IRcWhrTlJQ36kdYee/5roEAQP2jn23Xja3HgB3PGFPRVZ9QUxAR2cW0onL
	cUzo4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqk4s9kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 13:50:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b700506e64so23590885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:50:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590613; x=1739195413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqxiWCIT/Tin2k7dnyFvGCB27cd0ePrjkyaWPJDOOK8=;
        b=PKLlPxv5eh43t5bYqHLhHMc2qfysd8Qwv7iOnSWDEKibauRBqd6mksZFT73oF4vz25
         VLA26w4+Fq2F63TXTMRjCZDgg/j1RmjwXepbzEZdXCWqJeUslFBOC/6TDBI0FrB1HAlb
         OQTU9K74WBrahjyoATWUh7Wo1weHoX4Rp+d3P84qGKhel4gaM2aHODlxjrmimAPUcBsk
         1o6nbUjZdTl9eBjK7nXyUE+ETTKFhTKv7+k34vCteDCOKdQUI6r4nRsm2LMU++Yz8h2V
         YXpaNV1BtTu3sEqWBixtBgzmw0mXhnWSubOnbZGVb6ZtBdfZ894v8M7G5A92sepn30nW
         8AfA==
X-Forwarded-Encrypted: i=1; AJvYcCUkz+DsiDF7mSQpNNfWeZOmiVMT6fEL0GslILoYKN4tKv4HEH8nR6wDQP0zOdJ8nXg337fOXNcEOM9s9Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSj6LWMbrno6xCdCSHaAVE5/waPGAfX/Vm9iZWAZhLqQQ8KrRJ
	E/wEeJllU5GEDgSXhg990AS0uEAt87vsxg5AK1RbKq4+BRV7ooMw7OmGKOnWboi9scm1X+M0LP2
	gKJ06BcfzFXK0h2a5vspzxY7ltljyb4fOirVH6c8gUWWwohTVcV3lCD7WhPpcK74=
X-Gm-Gg: ASbGncv576+pADq8fUm1gBwEH3Ntyp0jH9zNbjvWOl33Eoly3txhHge3LTOhWE3zFOr
	STHMSWpHq+YT/oSSDzUW5iFaPHXSTR7Q66hrbZZ6842Kb45yYJTWYu7a1qoitJaawJM4kYIRwYF
	09mUpAX+yzP37+8E9W0A7RQP95VRb+AY3k2bMZ4NUOsC6OaitdmKcB85yWf16wLlDmThR+ZEb9j
	Gfu416+4Vc8RkziNhIZRgNRjJLq7SICfh8EvL3uqYPb6PSL6MGhfLJeh131jQ9DHHBaMeqEvNlv
	sGjKRP2qi8RDTUKtsZhvZKBjZDXVse+KpHp9qMO8PfTmay142zBvkZc1L7w=
X-Received: by 2002:a05:620a:40ce:b0:7a9:a632:48ad with SMTP id af79cd13be357-7bffcd8f975mr937810685a.11.1738590612874;
        Mon, 03 Feb 2025 05:50:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFojunUVhTwHgzodyssJiBoApke2JKM/2E3BIMLMBQGie53Ao5Kal4SPfr3pBEYVHL6tCtiYA==
X-Received: by 2002:a05:620a:40ce:b0:7a9:a632:48ad with SMTP id af79cd13be357-7bffcd8f975mr937809085a.11.1738590612564;
        Mon, 03 Feb 2025 05:50:12 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7ffasm755714966b.7.2025.02.03.05.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:50:12 -0800 (PST)
Message-ID: <d5e1e6ae-b773-4ec8-a66b-2e1830827164@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:50:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: qcm2290: fix (some) of QUP
 interconnects
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
 <20250202-rb1-bt-v3-4-6797a4467ced@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250202-rb1-bt-v3-4-6797a4467ced@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t19abNI4HwNsfR4wMi3ADRoVqur2GJkx
X-Proofpoint-ORIG-GUID: t19abNI4HwNsfR4wMi3ADRoVqur2GJkx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030102

On 2.02.2025 1:16 PM, Dmitry Baryshkov wrote:
> While adding interconnect support for the QCM2290 platform some of them
> got the c&p error, rogue MASTER_APPSS_PROC for the config_noc
> interconnect. Turn that into SLAVE_QUP_0 as expected.
> 
> Fixes: 5b970ff0193d ("arm64: dts: qcom: qcm2290: Hook up interconnects")
> Reported-by: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index f0746123e594d5ce5cc314c956eaca11556a9211..6e3e57dd02612f3568f07f1e198028413f463c69 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -1073,7 +1073,7 @@ spi0: spi@4a80000 {
>  				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
>  						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
> -						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
> +						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;

Still incorrect, this should be &qup_virt SLAVE_QUP_CORE_0

Konrad
