Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577A01C4A02
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738328185; cv=none; b=FU/7rtKXr1qXutn5QBOd90L0WjPLNLbxLjdelkCPfs3QtA8AOD7GWfNMl1HFOQQmcUb2OEvOOde25k9yWPHDQ+hYqkCdSeewbeyM0nmT3494L44lBWlCYK8czpqZZ6BrTtdysFyem+CGm62Ukq2nLxIBNvKBOoh418KQ3kFV130=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738328185; c=relaxed/simple;
	bh=UsFe8VlEZCmQ0sbihU2b0JFZi9Ej2TKBlU/qdva3I+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sEUXSWW5hQl9Z7Nehxh8RXFH51legNdnHA2K6JnSDDmtaFj8PtiwEGo3lK3c2FjJqkVRyub1Lr5juWftuHr62uzD4ZgIpWyoBrqLhOOYOpovZQxTc2UMknNQf+vtDrpRCWY3CxllK6ZESuuuPWwzR4aqlGXKb5qfJ6uBUXpfw68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgN5Y0x9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgN5Y0x9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VB9i4X007670
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	plPbCbgdcFippG/lsXp/DeHtnj+WORRPmcLa8nmWJkc=; b=jgN5Y0x96Go1UduD
	qPTkezkZNl4TjSCDabOLqPG5SZpYJING4ZSY53LpGiqCD/dhk9v1GP59UPmwgzNg
	+bXi/QmM5eFMpVyQIzOnRDDEFF5U4dQHmTgDPFRpZ2Vp2U8HGDZGWoFCL2Urw4az
	p4lNBIpcgnxP17yQXy1fqHgJ62AuhkgMjI73j+9z157Q5D0gqPuecRaUixIg+IgL
	tT1YM/zKcW7hYfzJWOHsUqd5VEcQN21F35FpUGyXHLRK8hisiJe0mxdFHarc1WP2
	uWAICI+NeTRDsDgFmpPfDCyd07xNij4TExRPYphccjqkMmxeZSIvNfRAWXppEIJ8
	iOk2Tw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gwcxr8fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:56:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d881a3e466so4663496d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 04:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738328177; x=1738932977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plPbCbgdcFippG/lsXp/DeHtnj+WORRPmcLa8nmWJkc=;
        b=lXsCXynSaObbm3a0rnI263Kk1wpdi/geqLsLJKaG5dEt1VPDLlquQlkLoHaZtNWZzk
         Z73gPvaWhi+3t69f0KmsadI9stY9V4uj9HuXcVKT4lJJoI3v3rp97nC5chDeDCDb4jmt
         uBWwVgmRyLZMa5yJ7xwDPePbuhOUVr2UqGwOCtyB/JH9RT9sZCNG3wTQl1WeBlEDdD0A
         kSyfo7xD1if4yVuTuWOQam+LOI73Yqq1+qoZBZGzdFYrqyayN7H+0ZyEBQKtmAB1fmIx
         +D2QXva5OucPAtwXsrrigDT+seDREC8AttEpKGinl+/hb462gB67DkMUjxcZOlc+bZpB
         Fd1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1siM9Gz4L40zyxjGpQQFfedmT8lEWG5B5OcPCmo4teSK3FCFqpAf32OlkSEC84NH3KrY/X/CNsPE2LeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVsvf24qQ3AuqErzhr9gaqxkVhoeihlSKiUBJgCOeJ7+0oq+Gr
	9ySN/xPW9gBYqQ7wgYfTLj24eY7xGucMSvICVXzT9lfvIok6xdsMZ+jio1O2Z8Qq43xKnTX8FHS
	y0a7f0zGevE/gSrL69YQzXL/T79jE9yuHIMvov/03XU3GZdnGsxaJxMcl8s7BNew=
X-Gm-Gg: ASbGncsAOo4CyeurEObh283r6H7V0OtH4LJZ34ez9iA5nkEwK8H/AGRehaT8VRJkMiK
	aVh4tWVbWQeA7EBer9pSKVLLDubLJAqvSyQ97KpMcBt+xayKS5kSxA6L06LypM9bkO6B/bwIFP7
	qXepliWKL+kcFSjLCN5dIEwz/cgNgkntl9C/b0BLjCl/2QM7i5YDP+O7BjzEClOShweWSophO0p
	/Qeaq2Ib75WXltFEdsxmXQ0QR7CkylKJ0Ka9F2PpqCa5IXSAklP5IaY8158h/WO9sH59e6uGRWn
	uxrPyKArYSmDS2FxZ3phK1Y9T5z+HKOyxCzUsj+SUMXFpSB7B//+YRK6XYU=
X-Received: by 2002:a05:620a:43a5:b0:7a9:b8d1:a26 with SMTP id af79cd13be357-7c009b37be4mr397854085a.9.1738328177126;
        Fri, 31 Jan 2025 04:56:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGm9+/5z7jb7xy21B+AJ8JUsYwxTcI6SmhkN7nHUwGclLh3z290C8ViPSJPsRA1U3ApIjkHg==
X-Received: by 2002:a05:620a:43a5:b0:7a9:b8d1:a26 with SMTP id af79cd13be357-7c009b37be4mr397852185a.9.1738328176714;
        Fri, 31 Jan 2025 04:56:16 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a31531sm291583566b.141.2025.01.31.04.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 04:56:16 -0800 (PST)
Message-ID: <e9fb5ee4-9ded-44e7-bbfb-cb2f897015b5@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 13:56:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-sdm660: Add missing SDCC block
 resets
To: Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Craig Tatlor <ctatlor97@gmail.com>, Rob Herring <robh@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20250129212328.1627891-1-alexeymin@postmarketos.org>
 <20250129212328.1627891-2-alexeymin@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250129212328.1627891-2-alexeymin@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VyRKCgutpNbqIAk7WiVqlB3hfs1LA93C
X-Proofpoint-ORIG-GUID: VyRKCgutpNbqIAk7WiVqlB3hfs1LA93C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=834 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2501310099

On 29.01.2025 10:23 PM, Alexey Minnekhanov wrote:
> This will allow linux to properly reset eMMC/SD blocks.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
