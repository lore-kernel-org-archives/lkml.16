Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C792620C02A
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748689296; cv=none; b=PI7/wS6IUfAUoZYpOMkxsYUhaVySMJ7caSPRYEgq95OZbR6PvTZ4eshOpvk2ZmhWghynEtePDG2aDpPaEgmXY+pjKNuOmHfcwtso1bXWGp2x50ADhCYuqHtwE3qmHUXsm8XmgSvJMXmIc62btfH2V86TNLitccg3c0jB7mG0asY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748689296; c=relaxed/simple;
	bh=9jUhyhtYh/WjEsg9JLIeVwHyR1TB8Sf2degZczTD/RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCHnl+pQ3w8ksKRcKtqqOb2W6EBO7MhfAEwjFv0QmPWVz5J0cmBsaIx0AYbhQceq/DwXeAAASO0L4VCPxhRUR925gcCb6Rmcf6RElBQx6X6Hpkvf2AbN8bx2Zy6wyRTXeNs3LsrZnEZZ22C1P+I4a4kiRBKywsCdjy5bA5J51Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0Wy1B28; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0Wy1B28"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VArp6V023933
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeCiqHx1yrJeitABKFiq1doyQJ7MQ/DROi2v0A5OQEI=; b=H0Wy1B284eB/s2xw
	c+so37/X8FLl+d3vwwquG+v9bcjW5Zu9RWRlLyhhsKKp2ycgECXcRHcpk97//H9y
	qnVoCka/767PcbW2hP/X6xGLX1xqVLwwzHf4A1KhP00Yq0el9THas4gm1KdkQv7p
	dgzsqpgiXw2YMnpB7HBRictwXTLBRM9o6G5PiPG77VgaQjBxgOQ5gwSP6Z9F6fSt
	sLTSncd5RRFmCVK68P1SzuF8E3txzzDnidy6EOetycO4v76r3q8q2hjm3kAvF+kv
	W8+P200zSxjXOxI3Lhu82z0jePcpqnZ+PhefNjHrw2BwT4u9HYC5wIbfFDQIClQZ
	Gcz4Jw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytxm0fey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:01:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09b74dc4bso62640585a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 04:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748689285; x=1749294085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aeCiqHx1yrJeitABKFiq1doyQJ7MQ/DROi2v0A5OQEI=;
        b=QL1iG3tdmdQ++y4ExAqcXpSVvp7M1saJCLEPy7R9CFz+85ia3IH6xHh9AbHzDDmmWJ
         0thyxAURPmpgmTUk6pQB1aKh/5LVSyyWpgxb31/HLNwjd3SdfUj+eQxayFKNPS0ipLe/
         p2ICodAlDQQOYrVlKbLI4oR04yi1uB33BrpMX3xKEN3TyHkjDyydEdOQypv58kkEQj9b
         SWdpj4v5OsZe7WrEehU4YOyfGrnmT7e06YjtvocMrAN+RhQ4oQtazOI+ttNHYSgVXnZ2
         oZbaHHIh5x84o3slMT2kG5jE0oQGMv3/Qm0nx2CCScSIHJ0X4vZHUHrQGQiVmzrCVtsK
         wpXA==
X-Forwarded-Encrypted: i=1; AJvYcCVIAYbtoNLrcza3plnF0fCOyEFzaiqdeCRkaX1kwlETxc0l9vEd10PKEXKgm1Efw21242IBB8NZNav+fN4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd83BI/BmVUWFppT1Zne3ZOwCGALThZ+aTSlyojKnA6YQ4FyoR
	6lHQbSXGcc+84L73R4umCbRWszJt03M4ILmHrhjFUT4hwrqnv9RDKbf8i+ZpJJHxLJRbms7vBZy
	xaAYnL/Ei1exrrpgrctFrI+nfNJdFb6avepbJtZuQB3AerukquLB9tXi1Qen+CdmvhSYwBl/1Ez
	c=
X-Gm-Gg: ASbGncsY01WCf4Z5XQj9oOVvbNCHhPkA4yX2bXM+ie0t3ZKcwc3rWQXKfRAbyykSbJ3
	tOLCigW7zxKUn6F8Ch4A1BYUWqjdFN9tZIZb9u+zwhatuqMNWlY4HV9jUFgPc7n6GKpaZD0Fzfp
	Q64EyhPsBm1yARggRkjLrMoiSfVkgVQzQG/FRXpUzz54ZA+1n7K/7zQdokU/+/eutgAjgLrwTUH
	h2dJGQJl782sixG2mynnP6XvNtvSrsxLgkwNzokDqSA3jevcZabVQ02TEMn0Cd4UNSggwPa58A+
	O1YwS2wFA7M9J9pqK8KKiTUsbECt8CkQkmLJN/jTYR8shMwZ5XHOdI+ySdTflOVR6w==
X-Received: by 2002:a05:620a:600b:b0:7c0:b106:94ba with SMTP id af79cd13be357-7d0a3d9e14amr283128785a.7.1748689285474;
        Sat, 31 May 2025 04:01:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPhz34bJwNdP2FlxXdeGr04uffjVcOkUPbyMNe8pUCP22/47kesOrRkNv+OJ5Cac778GzJ5Q==
X-Received: by 2002:a05:620a:600b:b0:7c0:b106:94ba with SMTP id af79cd13be357-7d0a3d9e14amr283126085a.7.1748689285050;
        Sat, 31 May 2025 04:01:25 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c2abb4sm3098010a12.13.2025.05.31.04.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 04:01:24 -0700 (PDT)
Message-ID: <171f207c-85dc-4610-aa1f-9c986f7004f6@oss.qualcomm.com>
Date: Sat, 31 May 2025 13:01:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: ipq5018: Add MDIO buses
To: george.moussalem@outlook.com, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
 <20250528-ipq5018-ge-phy-v2-4-dd063674c71c@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250528-ipq5018-ge-phy-v2-4-dd063674c71c@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mQfUf26FwzqmfXAV0LfRDwIFxBAzuflY
X-Proofpoint-ORIG-GUID: mQfUf26FwzqmfXAV0LfRDwIFxBAzuflY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDA5OCBTYWx0ZWRfXzuvZZiuPTUKS
 EHQbgJrX83wYfVGevwgNk+vs+BmL5KKum/a56v6I2tnMq3GY9pQn84ZZ4jH7FB0MUazryaodwZ0
 MUY1rQo10SrNNUBZ+n0IvtHejXgiAHgOOh9jZlN8n5qbVmeTT+jT6MoYGEXN2S4RKu2yJ71azYF
 SbsDcs0NIgZ2MBv6vfcAW+JfbTjWAu5LXfr2Nuwbw7Snm8qsrJInN06xRZlmOw38FqKsGsNieLX
 Q9Bagw5aEK+k9++VWj2BQoug+5Ig3ZwZ0gJZT9gJOSl5/fvbzNIAm9uvAg43OSvzWPnpFSZq6GP
 YWvjifvK7HalxDVElKT61A2INzmh9OhdGTWurI8OwCGQ/bX5vh9/7Ns24jhaie2le1ccB3plMmu
 Je+dtCvdVJw0SgEJlDm0UV8Bv3jSBlUpLaDpN0NseCpXRwGpMRKnrDK60t66NlbsGgCTkCeE
X-Authority-Analysis: v=2.4 cv=XdKJzJ55 c=1 sm=1 tr=0 ts=683ae187 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=WGRY1n-6GeFXo4cNehYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=731 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505310098

On 5/28/25 4:45 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> IPQ5018 contains two mdio buses of which one bus is used to control the
> SoC's internal GE PHY, while the other bus is connected to external PHYs
> or switches.
> 
> There's already support for IPQ5018 in the mdio-ipq4019 driver, so let's
> simply add the mdio nodes for them.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
