Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA85B1F03EF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744402462; cv=none; b=ah4GgYwOvU/jHoLg7604ks5ur8IveocsI5Elqe8knGwU3GpdbeSie6sNXLYwBcEWd4Tm1kJy0bG0F/D/439pkrUXh/c+Slk4T08jya/GGNFS4wqNhiJD3WsovT5oLuwTZt19LnBuv32UlW6lpXC0CeTLwaQn558HlxkT3ljG7wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744402462; c=relaxed/simple;
	bh=aZ5XOR4b/IgaLq9DuiIrp4snw8Hhr6iyzEACFHVcv4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iHWrBwlIvmX+GHSLtsjuP9oY5hYOOuNioTVxco8D/M+i+FkVemnhTVFHpN6O6+hEsq2gSPrFKcD1mnVZlFxpYJ56bxIChMmp/asYfvpL1WlrAeUQGH0fcUGmjzh7lj/OwVP28CgDVPGvLUC2GhqUz87X16viN/MtEfV1DQYxVWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Du9FSdYt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Du9FSdYt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BELRMa008221
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 20:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nRKMxs4PD+KnoQqGDOySfKgieFf8nDxLnTvx+NwRVVQ=; b=Du9FSdYtPdpmt4Ch
	lBuYniEmpCuSY+/7jBZ9NOKmqihhYF5+LPv3r1DEaMMhU02yctL59fNl5AN8vR7X
	5C8W9JRm9+EmAyk94ny+cFNL5ORhYKwGFhYfUVy5l5Q2mnvXfjvQX8cyUHfeBiyq
	PM/eChF1NUdiS+vc9nLZnmOCnxAjc+kUZrxWM5kIiXGhZnUU02tCyRo74M4r9MNn
	cvk+JOS0NZ3qqipXMjCVOxaQ9H66Mn1rnFt8B5sfuaH2B3lmx8YV5zBdOMDy4rQ1
	iT3MXoYSipYwVXaAs2PMK2pH3BtLGY/qfbYK7uT8YM7/sK2LgMVL+G/NTcE3YB2x
	S/lvaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd0bnbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 20:14:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476783cbdb8so5963601cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744402457; x=1745007257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRKMxs4PD+KnoQqGDOySfKgieFf8nDxLnTvx+NwRVVQ=;
        b=tMo3whvsWS6c4ieJ0dDe0qPhhWSXg0auyIK673jBxCE3gHLb+RjzPTWrN6GgfDoYHh
         K0Do5QELnPHG1l6PSCGH4SvWtVDl07sazAztAp2N9fbrj2TwyH9sGRaz7l3Vgm8QMhTF
         SmCsAy8VP9z6A3tEluTMi3xYZ+DBH7nt3jCB6+Yts2pU6O31Juq661v5jxBuk2Zab8ou
         XpJLnTzeZVpF24Sc735PlQ8zJfE4F1LLg+LsVVwwGJMVelv6Mt6FB+Asq+EnPXe3IH7q
         4hGiAGcfPn2RJBVSxvLpY++g1PwW8ZGt6TkG2wbRY/62sEq/lnTMSJne2e58Ca42Lcd+
         1rTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpLh8IPmUCpxtS+LM/+5hGKIeML6ud67U4NXnve8F0pqQNU6gD+MieBfYLaUv7srJuXQIAhK6Nplvt77M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRhZy4pAe+1jOhnNBmd0e4x27sCrzHnYbqOemscvDb5JwpHjki
	t2iwGZJuhngcQ0uZoGMmgh076exDa/urGqsrW7JtXW8NETE4Wu+wGdPRX5KfOts6b2ubZmWmeeR
	F+As8dqP5hc7+UoNkimRXw/PkxR/aMSSad+zufokMFYpuQqIkoeVAQ6OpOJpKUOQ=
X-Gm-Gg: ASbGncvUIM8cY9+vpP7GSJTuLMtDEDeosNNGoMUUzldACNLiUma7M3a+OPt8JaXCwV7
	VC2Lf2xSuy6i8b6kMUeFlYDV3qYx/vcN5WPXNXBL2NAgMArPi2CAMrH2/P7DXpAt/A8LDqzbgvP
	pQMRp4YDSWp1F62jtqoY/+7595UwbycNfz2WGf+1nGsn8Rc9UHrXoT95m154A5JxTVQQSQjBcBE
	YRhUAyjbu85CoojYgAi8oFBmqQBKelajnxmdJAYkxt9+3bp3u/RpmMPQcLjFzT61rn6j9Lbko/U
	Ntu3RdDZdiKGFgnINvhnItkWI4Gr4wiGuv5q92jaQeoHWCPRviVDTHF6bRhwWzZXCw==
X-Received: by 2002:a05:620a:468a:b0:7c5:6fee:246f with SMTP id af79cd13be357-7c7af0ee0f1mr242774785a.1.1744402457592;
        Fri, 11 Apr 2025 13:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwq+5VQLqjQev0co+4uNLsPoLMOr0u0ds72aNYr+2pB2wGb498Fhw3ISm8Ze3I7I0OKlaiMA==
X-Received: by 2002:a05:620a:468a:b0:7c5:6fee:246f with SMTP id af79cd13be357-7c7af0ee0f1mr242772685a.1.1744402457216;
        Fri, 11 Apr 2025 13:14:17 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7fd1sm486862466b.168.2025.04.11.13.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 13:14:16 -0700 (PDT)
Message-ID: <321ddc86-6ead-4079-8b0b-6527f0badeb1@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 22:14:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] thermal/drivers/cpuidle_cooling: Change the
 registration function
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rui.zhang@intel.com
Cc: lukasz.luba@arm.com, Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Javi Merino <javi.merino@kernel.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        "open list:THERMAL/CPU_COOLING" <linux-pm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wasim Nazir <quic_wasimn@quicinc.com>
References: <20200429103644.5492-1-daniel.lezcano@linaro.org>
 <20200429103644.5492-3-daniel.lezcano@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20200429103644.5492-3-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: InfQo5c0Zt2ok8GyJd7W6qdR9LLNffIF
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f9781a cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=jWAD08MBTVrP8qBQ8tgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: InfQo5c0Zt2ok8GyJd7W6qdR9LLNffIF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=793 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110127

On 4/29/20 12:36 PM, Daniel Lezcano wrote:
> Today, there is no user for the cpuidle cooling device. The targetted
> platform is ARM and ARM64.
> 
> The cpuidle and the cpufreq cooling device are based on the device tree.
> 
> As the cpuidle cooling device can have its own configuration depending
> on the platform and the available idle states. The DT node description
> will give the optional properties to set the cooling device up.
> 
> Do no longer rely on the CPU node which is prone to error and will
> lead to a confusion in the DT because the cpufreq cooling device is
> also using it. Let initialize the cpuidle cooling device with the DT
> binding.

[...]


> -int cpuidle_cooling_register(struct cpuidle_driver *drv)
> +void cpuidle_cooling_register(struct cpuidle_driver *drv)
>  {
> -	return cpuidle_of_cooling_register(NULL, drv);
> +	struct device_node *cooling_node;
> +	struct device_node *cpu_node;
> +	int cpu, ret;
> +
> +	for_each_cpu(cpu, drv->cpumask) {
> +
> +		cpu_node = of_cpu_device_node_get(cpu);
> +
> +		cooling_node = of_get_child_by_name(cpu_node, "thermal-idle");
> +
> +		of_node_put(cpu_node);
> +
> +		if (!cooling_node) {
> +			pr_debug("'thermal-idle' node not found for cpu%d\n", cpu);
> +			continue;
> +		}
> +
> +		ret = __cpuidle_cooling_register(cooling_node, drv);
[5 years later, adding some folks & linux-arm-msm]

So this commit changed the driver so that idle injection cooling is
only initialized if the dt configuration is present - should we not
always register it, with some sane defaults?

Konrad
