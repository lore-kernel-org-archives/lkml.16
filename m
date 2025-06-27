Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD342D9783
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041315; cv=none; b=k2a3KekBTUgUaSp81fJeR6R+5E+WS+nobNI7tQbHeu5fiQlRxH6SBMvBFwhnqstKs4Q5kgivwt0fAj1W/epUWs+nv5+AOrvVriPjmvFuZMWSCf+AOgyCTlimFjArOmwKOFLL10+4N6KRvNUK+KXOQ+URvIOHIdqBjZpDZA8Y9gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041315; c=relaxed/simple;
	bh=30vgKdy5n94b1DNeLRG5PLw2PPMa/I/W7Pqq9Wsa51w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7XXAe84X1f1nNhqN8aHUmrovT08+w+iTma1HBQb7lLNo4H0qlHlLMEmbPYUtx78D7aKJBUGxH81Z8pyXb50aM+GE3ybi7cgC06Svoeatbr6dAKigw43vKFLepj0di2VcY1iPb+rdCpPV0vOY5OU2QE8jA3ssLOZPyIyIpjCMog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBC50qEi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBC50qEi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBmNZ2027380
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8S/q69+hMXzlKm1t8hoFvS7fzscnXnzVXeG/Aysk4A=; b=TBC50qEikpNwSDDm
	cBrC48K85w4D7KXqQRgKZsP8yS5P+ij4btN1s5LjIA7iIGixJK+TmreJKYmAeXaG
	IGi7CrpzqKey8wweQalmj7GB7Ht6M4qMPx0CGiWFfhz7LHJmV1NqfDlk6zgIz5p+
	y+ZxXn68Pr02GC/PyLKaEcw7c7b7jYByvSzfB+b1rZvOb509kss3Kmv0KExAzFUV
	mhLa8JgaZ/e/zP957DD9sHeIeehrDk+Xz1a9Z1McSVT6e3FYCFPRroe4QpBu15Xr
	mOWCIbSF7mKXCUWjcIu6iUxA6l9MwPyx00idDae+RTMuTHjODgkZFwTUINcg4Y2M
	9mN1tQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26huja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:21:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3ba561898so25747485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041311; x=1751646111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g8S/q69+hMXzlKm1t8hoFvS7fzscnXnzVXeG/Aysk4A=;
        b=Vj48wnwHXxiJ766rArrNpKQYpaiuBeBrU5IuwxQwP7icFWBOXhZtdOTdPCWk3ZkK7j
         zuhRnoMP0rRSNnzPlFnvhM6ViGKG9XHsyMFucCHc+TfGFiLbEs05onv4QrACovw6Y/94
         SikOsdKNCfMnYc8shysGDrwGMCeTm4zauTDJkQ6J69WR6yz0ylzW7o3rhemgCM79Rtko
         jKLziIUhLkySt8u+ZXqRK8CAfTbo7Vjq7do/QnXjGUpfUd3moftsAXJ/lkn7NZssjE13
         WnyhZs6DVoERi2UlyWTOKbqLlexJyYe9G/LXv88Wrq0AFWzkTlfXJpVOXOf+JQJAxYNP
         AfJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZJYIhJmo1Ff4egHBzesGtVkWmdmqOmmWQR0tIjPtTxQH/PNbQdTikHYx9qgxS3kf5c2gdqXXkKBPJG6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTWFtWDa9HbPxm90Kk75VmYPO/5fGXXt1PngPKxqdnP1O2LpXi
	Dr4Afw/Kle7GmfxQ5QtWsxnre/7W4zrdidwyHESO1Vb6XAklIs+0oGdaeUDRFOaki0ztxOBUXex
	Zmnd0lqjsOnmCWbUs9+JgwTmVhEDtWsCxYGI8GB0Tv+dVc/3w9NM/e1hq8PrJS4LTkjk=
X-Gm-Gg: ASbGnctoeDVMqHxeYCWrnw/cFbQVrp8r1sOgqhybBmZ0H/r982DTxKwoI91VBkQfq3v
	PqzyyISxlM6cIYxQljWp0V5dDxXjnr2SLhK1vZPZGxePwfRD08Pezn8lrZk60gYUjS9LwNgjKO4
	V1f54IjKqCyVBJa3WSJCYbFuQFBdzuQjvzoP+5mJu+PGli3uQzN5pE4ytvYIalV8XDWehRQHpZA
	eTX8AIIV0jmXVOwfB1UEDienC/ZAurVkVvaefyrzL8jlZvJ8AGmP3EeFjmVHXQ7KsjzP9mVxqBN
	dloqwk+WctjKmQXWWDJLaUygdhyqZ580hymB3MC4trZy+ZKyuB6glfyPwHvyAgxNg08GnDlblBb
	lo/0=
X-Received: by 2002:a05:620a:1925:b0:7d4:2901:2b3c with SMTP id af79cd13be357-7d4439b51a3mr212887585a.9.1751041310920;
        Fri, 27 Jun 2025 09:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1SPxuQsD4kZcYVOTyATUEwOXLUOsQYA3SYR1WoncAoVYNaaL5puLHJyjBBdfcBGSK7mKW7w==
X-Received: by 2002:a05:620a:1925:b0:7d4:2901:2b3c with SMTP id af79cd13be357-7d4439b51a3mr212884385a.9.1751041310357;
        Fri, 27 Jun 2025 09:21:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a016sm153479966b.57.2025.06.27.09.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:21:49 -0700 (PDT)
Message-ID: <4556893f-982b-435d-aed1-d661ee31f862@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 18:21:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 03/14] net: ethernet: qualcomm: Add PPE driver
 for IPQ9574 SoC
To: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com
References: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
 <20250626-qcom_ipq_ppe-v5-3-95bdc6b8f6ff@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250626-qcom_ipq_ppe-v5-3-95bdc6b8f6ff@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMyBTYWx0ZWRfXzrKbs+oWrduE
 SQnNP3mcNIz21b4cIc1HCkuoSDD5NWNMRN89PA0Wx7OGKAqQX76xpoSZJJuHRBD5DWPChbH9Jal
 MNMj2jfCxVMLsns6a6+8/3tyQX7vqsyfKUSLVj16BbFKkWvw86b9FbuMkConQAlFGek4XnX/2Od
 VCPi/IFjARTulPT40ZDjD5petwrNOBYBCU/GnwfQYxGwJk8WPh2JlcbLbdKweqJt9LrT9IN3MwE
 lqXkicAFFndsBp8CUY9WBZ8MZ+MIQ7o+hvaEfC2Jjwff5o/QuOin1mPUNTlRtPe4U2cqqrydRkz
 y6V4xyM8L1qKO9z/hsOvotSqcXUbEC+8oh/jEqC8xuLcZrv6XDWbtIcUjFK8WZjpQedY6YT9VXB
 axDl3b+FzL43FnvitGZWUpm6IfEtI4+iD8DKNFrZtxIFm6y2oa0c9d0i/mpswzbLOECcRwqX
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685ec520 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=JRFc35xCpNCPHeNcAxQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: t3wbClGvYjKqsAuv1Zcu9h42Rcpbs4tF
X-Proofpoint-ORIG-GUID: t3wbClGvYjKqsAuv1Zcu9h42Rcpbs4tF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270133

On 6/26/25 4:31 PM, Luo Jie wrote:
> The PPE (Packet Process Engine) hardware block is available on Qualcomm
> IPQ SoC that support PPE architecture, such as IPQ9574.
> 
> The PPE in IPQ9574 includes six integrated ethernet MAC for 6 PPE ports,
> buffer management, queue management and scheduler functions. The MACs
> can connect with the external PHY or switch devices using the UNIPHY PCS
> block available in the SoC.
> 
> The PPE also includes various packet processing offload capabilities
> such as L3 routing and L2 bridging, VLAN and tunnel processing offload.
> It also includes Ethernet DMA function for transferring packets between
> ARM cores and PPE ethernet ports.
> 
> This patch adds the base source files and Makefiles for the PPE driver
> such as platform driver registration, clock initialization, and PPE
> reset routines.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

[...]

> +static int ppe_clock_init_and_reset(struct ppe_device *ppe_dev)
> +{
> +	unsigned long ppe_rate = ppe_dev->clk_rate;
> +	struct device *dev = ppe_dev->dev;
> +	struct reset_control *rstc;
> +	struct clk_bulk_data *clks;
> +	struct clk *clk;
> +	int ret, i;
> +
> +	for (i = 0; i < ppe_dev->num_icc_paths; i++) {
> +		ppe_dev->icc_paths[i].name = ppe_icc_data[i].name;
> +		ppe_dev->icc_paths[i].avg_bw = ppe_icc_data[i].avg_bw ? :
> +					       Bps_to_icc(ppe_rate);
> +		ppe_dev->icc_paths[i].peak_bw = ppe_icc_data[i].peak_bw ? :
> +						Bps_to_icc(ppe_rate);
> +	}

Can you not just set ppe_dev->icc_paths to ppe_icc_data?

Konrad
