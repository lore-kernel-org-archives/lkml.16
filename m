Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34112505B3
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284593; cv=none; b=TjHQpLof4bYT6Fy2WSOE8owu0afT8EvHGJaogxQfaChzPtYlnAfdUheZjIB601+mQUvAkvYcs5sH5y3AHdvWRql4GUmWUdn4/WGttqOeCLM+IAsgCCOeA5PEMr2VvKgQsivg3khx5kIvYdNksipv0Es7sHRt1+A0kzGnguCglb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284593; c=relaxed/simple;
	bh=7Ii4oZkOZGYKE3BZdy/K87x7eC+Q8/Yg8xmakzI1XRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JWNngVprisnAwnu+ntAIU1akkMBivZYsprW4RQwLhA6bgV+Ta929Kj7lx/iYqbSy32XkiOYdehAG7dhaWRy8x6E2fcpW6BixQXE2/1WKW2ZaY5sd7qtEgG31fKXYBxGPY1oEvV64SaXxdcRS6oXqfaMi+OsbXAywtMxra+HPVqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBMzsjW1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBMzsjW1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B8wcKW008240
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1WudjrHqQFLXTx6wDZ/8frFhEy4z+ON8ytd3oA/31g=; b=HBMzsjW13/L3niYb
	J/VObtlRmyL4aGLwfXV0eupMOupUvNloVngCbuuuB/c6Irsv4cHefNX/PURZgfWR
	8FnfAiAP1no2lFdB3EcEHOkeyJt4s9TVztSeY43PkuWanNGguzrqIsDE+lNPvpzp
	m6lKjM2JUetNKwCdLZ5ma7okY22rdbWd8zjQ4i1pKxun5hqobdJG6eHYtDHfIVGM
	oNINsP3V9lxnrrrkSsXmIzdWXOui6Wkh6s8DNr/4qRHp65L/vCrFEljxYp/zLQEY
	CbjFwuraDCG6sENmaMTZxyY/TCK910MOqwqoEpm9p4keuRq/Bs8CzyP+lDGx1dF2
	lhvE/w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh4cdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:36:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-471ad2e69d6so236571cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284589; x=1739889389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1WudjrHqQFLXTx6wDZ/8frFhEy4z+ON8ytd3oA/31g=;
        b=DfiQ0UUZuPzy4PRfsP29tx6MxFyzjJj+aB7Zyv4f0UYJYVpGP8ZwxuoqCfAvM9tSxQ
         sRds4YBWCe/A/mX0OHOyMPjmwZlbc5IELWEV6x/vwuPHUoMFKYQKMqFR0JTWcrzHaVD8
         dKv+Xn9qnedp0laQJda23dOdQQmkFW4QmZkJ051GfAiaigvVX+cba1X28CCXxWReYMlJ
         sKMK0C7JTmkLbdZuoHOSo0hYQJsM8o3s3BxU0XW7UiRPkWvnk1JvLB21CyIukDwInlXX
         UttW1ZZHM5xXkeaIDzP3nI3Qq//+dyAxx4yOfdKusQYZyqH5ApkqrLOL/zoIYtXIsO9y
         8VGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXClyGvD8/ijy6Yn9La8pAWF1uXRYRFw3FnnaDHqbzE6NudKHnL1nOwyyVGan8hFyLqww5TwjB7gV28sDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo4fj1iNV7ZrFrb2iyFq8LQT5atU5Xqto84Qr4PJ+sciPNn9PB
	5DcAEJcibbflFrgc11Ad7Y/OXzVa6sLD1Ie7UFwZJbVeYlQ9e0MD9HBh1Cw7PwnZH1tPE62SiLr
	L+MbV/OzNJFxRonas+MGurS62stdpDAqxGpUlK0S1aS2PZt7hMH5gktQzJK4+LFc=
X-Gm-Gg: ASbGncsjWsnmmodJpwA16EC+6dNUw3lNBzs/ifigdNTwqXtG2Q8BiUMe+6H8T4uxxOj
	9CBqaMQt243HJaLUzkS5JYqQo1GB6O12YMt/TEgumFspry6opjMFt2WK7Bd4htDRwjI6n16GY6y
	CheNOFjtURaHvRS0C6OkSMBIqzMSVvPq6eDaglybGu+cb3kaEkwbPHmV8PMTqqbO96+8v7oyEqV
	lvJcE3Qm8ca9Y7U6LFUniZ0R9BS2OfZIwX+tYvda6T+jtzBUttIBMuTnd9WirYbDkTQk+jYR6Ro
	G2qb1qUarcsxH31edO2XPZEU53X/fo0NrzfrLZxkyCQad00Ouzew060ucEc=
X-Received: by 2002:ac8:58c6:0:b0:462:b46b:8bf8 with SMTP id d75a77b69052e-471a3e28ffbmr13331761cf.14.1739284589369;
        Tue, 11 Feb 2025 06:36:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBtd/o9zaPUcZSBSJqeNb6V6jDhonTEpK4kvS0kO6RILTzAgiYeOe5mvtHYLZNwbNqBaucQQ==
X-Received: by 2002:ac8:58c6:0:b0:462:b46b:8bf8 with SMTP id d75a77b69052e-471a3e28ffbmr13331531cf.14.1739284588932;
        Tue, 11 Feb 2025 06:36:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b4e96185sm521953466b.86.2025.02.11.06.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 06:36:28 -0800 (PST)
Message-ID: <13f7d30e-9237-4a3e-b9a7-0c667b3e77a8@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 15:36:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 6/7] arm64: dts: qcom: sa8775p: add EPSS l3
 interconnect provider
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250205182743.915-1-quic_rlaggysh@quicinc.com>
 <20250205182743.915-7-quic_rlaggysh@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250205182743.915-7-quic_rlaggysh@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Wlq7EdzsL_I7DhuwgZ1yMVQAVjPc8SEI
X-Proofpoint-GUID: Wlq7EdzsL_I7DhuwgZ1yMVQAVjPc8SEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110097

On 5.02.2025 7:27 PM, Raviteja Laggyshetty wrote:
> Add Epoch Subsystem (EPSS) L3 interconnect provider node on SA8775P
> SoCs. L3 instances on this SoC are same as SM8250 and SC7280 SoCs.
> These SoCs use EPSS_L3_PERF register instead of REG_L3_VOTE register for
> programming the perf level. This is taken care in the data associated
> with the target specific compatible. Since, the HW is same in the all
> SoCs with EPSS support, using the same generic compatible for all.
> 
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
