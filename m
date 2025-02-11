Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA13E26BDB8
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287892; cv=none; b=b4ZiTh8oZhVGqzanM8QjiHMBjEANqpppekG/LDKAwIyvOLNNj6n87Ioxl30H8/91e5mCJlWgEFI10ih/cSSULyD04DheQNjBH1npsTcYDGIRu2rLSXqHCrO1UVkO+dMco6wwKAGkeAbp1lWInh5zE+6BS0Sp8Kwlxd8fyspqa4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287892; c=relaxed/simple;
	bh=Bg6Nt+8C5j+0uyXnIEaKjL/2chmotYRWBmv2M/smtRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XR9hbHNTjE3uBQXBdUJXdoX7jx/wB1+DkH7a9krMmGgQuAlrhUZDKYr4/uuhToeICZYHG8+Vb4vMRmSZerpkM6FusTfnxLv5NxdXGnY6LZqvecUVyJbrQJO8VLYR00iL2IXNylS+BDYL6wepg4CSjd97OzL1ZLHXmYKURD9mcc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z8rw2wrr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z8rw2wrr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BAB9w2023543
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e5OySbyHguqdotrWL0HqWl8v1uqJmDtsgQTUaTpXBA4=; b=Z8rw2wrr0KDm8cSJ
	ORCU/NYvMIkBYjf5RynZfJaS0XWWbhWC80QIPlRTooZeu9p2V+foeMyt1kPKcojq
	EdB+qoLgglyaE0RKi0mRRf1ECPbW3BmXv+rzq3gMZRWiKYrufIYzjJUaWzNTshB7
	oAt+jQAG9ra3IPNdpr1+dL8Vui6oNMxkA+B7MfyoIO08/bRI1ChYtWbi5WSq4HdY
	UrqFTVl3TGoQCsb8985zmCyhPaVSR90lbFTFZddNGobB95T+3yuWnwCeDNEc6O0y
	j3YWcJ8FdZkt0PpglcQx3X4MAeeJ3YOsfiVtmrSpPolw5kMX+JYFWQGgg39vDMfe
	ZMMFKA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0gv06n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:31:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-46e4842dbd0so15548291cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739287889; x=1739892689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e5OySbyHguqdotrWL0HqWl8v1uqJmDtsgQTUaTpXBA4=;
        b=cB/wQncCqNT1UY8OSZ3s1DGYlpBPQKXetdcKMNe+Y0Ml0Pxwm7NFQ6xSDsWXyIWJ1P
         Aqrfjf+55kQCCNYZQdEThc+Q5qbso1zV09jLUSXmkyQF/n9b1IPAdlfqEPeY0sip4lBr
         sgqEmklfS2AzQTy+Hwkrj/PreTUbaHClryxpF6Q0vc71k2Rlw5J9UucfJ/BAjl6UecUO
         twzWol3IFOeEQUYQVWNZEFJHl3HCO66z7NbU8TPx/3W3AC1Qxqx/6Zj8OqvNgAof3l46
         Bq6fztOCy8ZGNk4ZLxU+fsqwD4gui3KLGa+17eNkC7u4wktwe4Yzt1Au/NV8altzYowU
         W7RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUvF1rhKsE/1GyrDepJ1/+l0j9OHdz3Ox5u8O+6WGUtrMy7m0f9Ppyn2OsbZ09DDcRGnPcYz9VFoAiD8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHvqEPmRztQEV5jS8I0xvK+XyvYiAT4jsK2EsZzlAKEZBnWn4L
	o0UUxsj8t68GBmguBJ7Ab7bWpagmV6FBWWp0M+0u8mG7Kz7BcliiT7gw3Bcdnhe8VEILL4GZ2oy
	9A+t1bdmSFXKhXN7ntU6dhvvhdTj2FqSKbqyPSz7Zko3Yqd8ydONGLIikHc5OM9w=
X-Gm-Gg: ASbGncv7/5bDXZnIAYqjjg4nPjG9mQm4ZAWTv5bp9hYBrRKlSNNECIwFK+12SW93lYr
	Hsg1GMWwMX/7z/y3wwClm3hNh/Br5lSXIVPu2dgx58uyfPIde4XUMg75bg3HkIhjV8ZG4StNSbU
	sUJYhZDCU00DQLVw9/hKCdxt0nnTDJ/35WFNI8kIHERyvM1+D4cuhnteAEas39NCLZqdDim8zGD
	klSZlV39Wo5xwomeuH3pRtbtQoB0K/ATGX8CnvTEdaPNv5Bn8DVST0XuV/pJaQJtDPONXhGCbjt
	nq9e+K4pJi5k+NxmM9XDMDfRAA1bTwElhEXnioi3LjpUcztuPmVA7yx1nuY=
X-Received: by 2002:ac8:5913:0:b0:46e:12fc:500f with SMTP id d75a77b69052e-471a38eb6a1mr15565831cf.0.1739287888711;
        Tue, 11 Feb 2025 07:31:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7FgJZnYB4h/Q3ta0guw1kWk+ay0aXvWhv0/ehdh20wsL+3hNZVueDiuf0CB+w+LhrMUtPNA==
X-Received: by 2002:ac8:5913:0:b0:46e:12fc:500f with SMTP id d75a77b69052e-471a38eb6a1mr15565691cf.0.1739287888319;
        Tue, 11 Feb 2025 07:31:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d72ae04fsm209952066b.46.2025.02.11.07.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:31:27 -0800 (PST)
Message-ID: <93a1bdf9-52a3-4dc2-a2cc-28f34b7ee0b5@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 16:31:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 7/7] arm64: dts: qcom: sa8775p: Add CPU OPP tables to
 scale DDR/L3
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
        linux-kernel@vger.kernel.org,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
References: <20250205182743.915-1-quic_rlaggysh@quicinc.com>
 <20250205182743.915-8-quic_rlaggysh@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250205182743.915-8-quic_rlaggysh@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hQVSPMoKNJO7rXVKyjLxwcev8aM-XH1B
X-Proofpoint-GUID: hQVSPMoKNJO7rXVKyjLxwcev8aM-XH1B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=936 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110104

On 5.02.2025 7:27 PM, Raviteja Laggyshetty wrote:
> From: Jagadeesh Kona <quic_jkona@quicinc.com>
> 
> Add OPP tables required to scale DDR and L3 per freq-domain
> on SA8775P platform.
> 
> If a single OPP table is used for both CPU domains, then
> _allocate_opp_table() won't be invoked for CPU4 but instead
> CPU4 will be added as device under the CPU0 OPP table. Due
> to this, dev_pm_opp_of_find_icc_paths() won't be invoked for
> CPU4 device and hence CPU4 won't be able to independently scale
> it's interconnects. Both CPU0 and CPU4 devices will scale the
> same ICC path which can lead to one device overwriting the BW
> vote placed by other device. Hence CPU0 and CPU4 require separate
> OPP tables to allow independent scaling of DDR and L3 frequencies
> for each CPU domain, with the final DDR and L3 frequencies being
> an aggregate of both.
> 
> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> ---

[...]

> +	cpu0_opp_table: opp-table-cpu0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		cpu0_opp_1267mhz: opp-1267200000 {

Drop the labels, they're not needed anywhere

> +			opp-hz = /bits/ 64 <1267200000>;
> +			opp-peak-kBps = <6220800 29491200>;

(921600 * 32) etc. to reflect the clock rate, please

Konrad
