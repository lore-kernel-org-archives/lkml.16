Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D22265CD8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359465; cv=none; b=iYQdiSkC4gH8XmnR/8u2hFdpvCTFag0CK22+E+ftJfSJBpFE3d3kQBQo0vcAHBlJVMVfpZYKY0z65emoVzVv3uHpv6GIC4Mjmui3ZBULwSBKkwmgThoMujZS3gq3Pbil5XQjqotcbJqoWmKZAkx9qUiP8he2mhxBt3L2P/k8Mdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359465; c=relaxed/simple;
	bh=ETahjvfhObWfhp3wH4KH1j1xcBmeV7kvedrPys7wXik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4esaMEzUQtu+/fwB6uZVPTZ5PLHkUhptLCtBZkDBEah7LSLBApfl22P8kknQDloh2p072W0FIspLw3FPL+0F+A7eRK0K/twzZ9+aQqiGHVQOPPdw/n8vJ8nwyMb3++4CXJgcWeLTllmHTfTtELkO4sEey2ExnJ1c6+rUnkEEn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LTmc355r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LTmc355r"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613gAsb008172
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 08:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yf8OXMx4FGnWdIQA3MUAkQiLT+ux14ax47Cw7Z9XIeQ=; b=LTmc355rIX1vCd4V
	QbKXgSVG2hnzEhL4Ak+j0xi2wCu0JbWCm/5pLIIYILdPLgozQFThyEIW5eblLMM5
	L9Lf36yFB7Od6FdA+S29o2nLp6hv5+7sJ0PKmBqujBxy1rqHP00Lp14ZUgNp3+D1
	cFQ/Xsh9ZpUviWrYhSBOocEraKWvZGxc1sIiHXClNJ0rzX12DM5vOc8xUb25Diyx
	3e1dgAaRk4rWMOgbJry92RksReabhtN/hz1aw4ODmsNDP+TAIXq8ZkQC4IJ631zr
	D4wZ6ecxNW0z2IVmCj/7ZCFQ8r8Sw/s5CIITLXi4My0GnMcpxG9sBW2qqLCJhDsL
	aRa03w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmvjr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:44:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5ae436badso7867241cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359462; x=1751964262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yf8OXMx4FGnWdIQA3MUAkQiLT+ux14ax47Cw7Z9XIeQ=;
        b=wqUwwgQ82ZhCvT3AY480UBUtKQk7JgkRZRFckEo+K2XKnlWgAxfXv26+u3TAH5WvSy
         PqKifxkohnn2BXjdnlyOgzgyZl6xdqhQIaaUmdhoqDLz6peXR5XL4CvL/e7rFCMnPo8T
         c0BcNoElZXkQ1rXbnIc93gmRgi/aVymQ/hFsKZO3akxJXuo3N+Xp70dswWboWaCAZmhu
         CX1xaaVk1qeSky8llgvSB2HcgjtumQwZ4rjuCAPPnqU+ak0OeU5R80YeMTSfHRL+amd4
         ethlkoCVCl2loK8+aYmZxmhp/GhXoUBbsmzFQM9KWA1PjeHWfm4lCj/SNUlgI3U03JE7
         3i8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1IeeMnF27fvqgv6/ChQWOptJvQohVwyKDVPqzINwbKIqWHXfNORcDSmV9e2OAW2GOCMupQL5MpAiBpQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGOHiyNVffOTeomufTiBjx8THXym6n66jOz23kFMHPfAKbiWbE
	P0Mqx/OGTCsy7fmrQME73ByXfoeMGKp57q2nGnO9go7iMZLxpXggcc4HFZlJfupKAKAmv72xOqR
	yLYREsYSbGbsGYLEYPiQLlTF85bKG/xTWP2mdZE+QKw2ga9RT1s/W8IOcPFy0sLQN6ZM=
X-Gm-Gg: ASbGnctq/JqdMuKiuC3Jf4IRk9unyoqhvC9vA1iG9yCn5f/UvavYjxABWdKCJ/7Zoke
	HaHBTf5bGMApWE6os77vRku9r2QhiEAvzUSmqZ6Ji5TLjxHkGQxEaMWp02HVGJ5DPklWByDHUgX
	oLzQ0xPd1XweotR1U4UVOndtOskFJbOBd2/1iZK3vNVVXuXAPydqiTvpHl1e0sobv56vHo1xmVU
	wLJRKHFxMBsgoK039szyx++for9bHaTDq/idOvCpFw4tjkkUHltJJ8iDbhmdy8rtaoLmcd3Ph7B
	HpaHDUCsXwdxjjXhILHWDoHJ44NFxgbponYB5UcfF2X0PRLBCU4w7E0gCKzYY19zIOwU+g6IxTb
	erpYn/Qbv
X-Received: by 2002:ac8:5a81:0:b0:471:f437:2973 with SMTP id d75a77b69052e-4a833959521mr9863471cf.14.1751359462362;
        Tue, 01 Jul 2025 01:44:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/sA0oirRY7BnsvlJ60EVwuLrYw1JMcOwklbuCHYYyVTAZbHQKxT6zpexqZo4Yazepm+DXNA==
X-Received: by 2002:ac8:5a81:0:b0:471:f437:2973 with SMTP id d75a77b69052e-4a833959521mr9863291cf.14.1751359461842;
        Tue, 01 Jul 2025 01:44:21 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8319aef5sm7312708a12.48.2025.07.01.01.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:44:21 -0700 (PDT)
Message-ID: <850260dc-7e67-4ae4-82a5-5b8f5197633d@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 10:44:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: Convert qcom,krait-cc to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250630232617.3699954-1-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250630232617.3699954-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eXPa5WGQRkr0H0lCw7B_axY4Pm0Mlytv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MCBTYWx0ZWRfX/8aR/+yUrzEu
 6iZKK6xPoNQ89xYoo0t8BYT09QmuWhEpUni0j7JdRSV9WntojVR2iZ2hT9g9rwQk/zjJlKr/wfR
 TGYMUpneBupdlC7sh4gPMkfU12qoPTpCbqepR1H6ZYHMu+GGj5CmKrAA2wBfERsAfb15HFMKWfp
 54NhpE1Kmn81s1iW6kjEZYMsABfIgXBvmk+kOQiBmEkjsxmdjKD1sMsBDxmoWj7L7Y3lXs2k03i
 ADkkyBQTmJ9xd1HjrZRQD68YvzUM+5gmjJwqf2U2+vbmRxdjbDVbdwQ35tj50VDiVmA05sQnPf0
 S/1IzGTy9WgUN8xeSYrCJaRT5B7zP4B5gRBH1vfgM8tWKES75toLPLiedbkhliMGg2DqEMTDNGd
 bTus6RWLZtNcVL2OWmspleADGVRUgd3HAotNTqgpstcbiL3+IlDP28FBQE/oSDsU7Nc1Nu2Y
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=68639fe7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8
 a=i-1VaULvG7sLBx-uF14A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: eXPa5WGQRkr0H0lCw7B_axY4Pm0Mlytv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010050



On 01-Jul-25 01:26, Rob Herring (Arm) wrote:
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/clock/qcom,krait-cc.txt          | 34 ---------------
>  .../bindings/clock/qcom,krait-cc.yaml         | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,krait-cc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,krait-cc.yaml

[...]

> +title: Krait Clock Controller
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@codeaurora.org>

FYI codeaurora has been dead for years

Konrad
