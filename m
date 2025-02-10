Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF1522257D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211673; cv=none; b=d4YKx5ZZmfmiF5OAVbvvydryJ7Zi7oajzB6zk19orgpMcRpQ5/81wZOsPUcZ7eGXgowI2ramzdTwNYSXC4AeAfwOJINkIxWlSbOa82C7Dxhcy0M0Qxc7Gt0NTxvdjviQPILL40ugbmYFmFOxH5uaRPct+k/iqB8bUcYg2WdoAHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211673; c=relaxed/simple;
	bh=0xL+skDucnhLW89bz7IEHnc3Zd8q/Qz85gybd/2B8EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJLj8IKukRWKdR05iW1M0QPsDiTgfnZI47XBxEsfDksPoJarsVWCoVSq8PJt1OsD1sqqoOetVU71YQD0ppQh7Mpw/gBX+bJhne7IGBkxwYkJUqGA56sstXnFN0vtUSwEuNGCK55cWuBcIXAz6GBB2qVcBYT6/G6Vy+xddQN/ZNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nM6cG0tm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nM6cG0tm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AC6tuO015713
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QI+unw75zeXEBFxdOXAwEc+3K46TDQuzT8vn2rDTQVo=; b=nM6cG0tm7Qff3bBq
	VEcWhKl+xaOX5DX10tn5EW4zfaKmjKXd3fjSSPm6N7yEbCJWweRw/deImo96TE9q
	LE+JqPVlqqHz2C/tgWRFEi2l+ZMazWBPgZ7DFs9C8ttbujNAY/e+LB5ajX5EXgPp
	dfPzUD8oFqHF4y79tpvxHQukNmqs2zHS1y5MVeJA3VX+YBou1neX5175ESHMXTN+
	di478lKXVYqHQMmedEQ/R0ah5XdJ/zNQKbjSFD7VQ03IYGuOzQIS1KUo6/7ZCb3P
	MtFz8mN3mF+L/U00eWijASukcB/81FBZ4K/bJceLa2lEHtrh7Cha4+ROgjqaGzIC
	VyE9yQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0esd9wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:21:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4718a18521fso2412511cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:21:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211669; x=1739816469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QI+unw75zeXEBFxdOXAwEc+3K46TDQuzT8vn2rDTQVo=;
        b=DqFDTShORXWAw69zkgeQEli1MVOGLStX7kCDsVWSfxI/ZJVveqL9XYXMjJSpOB42Qb
         b4ZHwRy670n0+25lm5TonYJyYAP1YOWBSZYyZJknwCJ2oFOb3lNPDvwJFD8MNJrNQuZC
         dlZLyYq9zZoX2u1anKocmVOs7VwCok4V9fCN49iSa4XpwTEvsyx4tvEndlsyqTRjWrzV
         2/ieiI31Ko5VaskRX/4Xj0eQkDzEWcgqai3Uf1CVBPSCiUGizGCsBXTdMdMYxGRZq6Xt
         PSGeWhHOsBaATaTIdahRsnL6dKE1nj1rTVFMSsbTQT0eCAviJV2kCtYVelBjPrWSFJCo
         nfYA==
X-Forwarded-Encrypted: i=1; AJvYcCXLEN6xYFLeZOwiO5DY5XbJnuplyeQAyFllfhXCUCPoaFOHhhzfIWt8uMXj7KxCBqGkDWgqouoSnFQkNo4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+NPMQyLf6hsinsg3rAkPnwYhOR0NS8SV0MqQmSl2dwKeIAFu7
	ORy4EcyVHhocNjSBsz3oe+ilDFIp1sboEyNr6O1/j9yf6UiYI/j1rd94j12n+KUgv2y3h6a9Mq5
	gMxmRSUroNDG1eNFkzlerM4NkIDk7MbtDE1STHhNrCpWutBmhXaPwN+HclxrGjA4=
X-Gm-Gg: ASbGncs4QaQtDnYtszP1AymCLOhY6lGzYjx2EblHTEslIqyaJeULhdR6n+0mjZiawF5
	BFrwJzrhQuZjSWFgzheUJWuEeu1/AOsnyLKsvgPc6CImocWUrQqEMmLm5jhZz3l1qI5PSw+L5J3
	cUw9wlK8HNXxSDzOFLrEUZge7Lp2Qj6+IShwG13SbOLYbrAP/O/NwpRdKxo+Kg6DXZ6sCAIEWeG
	01FwTuoVNxx7Or/XC34kGp8H+3aGqsEhxelilumxCc+sOHY8Gz4WVQjrR5NGBfj54qQQAHgXCM1
	w/eaOgCBs6lOggaVkloz9P9VNgkyPCv7XH2b4Ob3hTFy66nm6ZdygOlsv8I=
X-Received: by 2002:ac8:7fc3:0:b0:471:9a28:9cd9 with SMTP id d75a77b69052e-4719a289dbfmr13057471cf.12.1739211669094;
        Mon, 10 Feb 2025 10:21:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJNqJM+UBEddhwuMPsWiRaR7uhcCjBlr02t3ErOLh4HzSUhnhYV4TIB/ErinPZjckYCY0qZA==
X-Received: by 2002:ac8:7fc3:0:b0:471:9a28:9cd9 with SMTP id d75a77b69052e-4719a289dbfmr13057271cf.12.1739211668780;
        Mon, 10 Feb 2025 10:21:08 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7800ddc19sm849807966b.175.2025.02.10.10.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:21:08 -0800 (PST)
Message-ID: <9d156390-148f-4853-a9c4-d00c4ba11d32@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:21:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8650: switch to interrupt-cells 4
 to add PPI partitions
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
 <20250207-topic-sm8650-pmu-ppi-partition-v1-1-dd3ba17b3eea@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250207-topic-sm8650-pmu-ppi-partition-v1-1-dd3ba17b3eea@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: or_vPJuN7Mw7yo0H0Hlm7UBd_tb9kkNq
X-Proofpoint-ORIG-GUID: or_vPJuN7Mw7yo0H0Hlm7UBd_tb9kkNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=783
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100149

On 7.02.2025 11:31 AM, Neil Armstrong wrote:
> The ARM PMUs shares the same per-cpu (PPI) interrupt, so we need to switch
> to interrupt-cells = <4> in the GIC node to allow adding an interrupt
> partition map phandle as the 4th cell value for GIC_PPI interrupts.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
