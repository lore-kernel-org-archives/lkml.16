Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E683A21FF33
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751887902; cv=none; b=oxvdcYt24rKBUTO1a9W+9Qwr1XhxkxFuktIwuR646C0EBJXd+75y6TARbfwxJgFURF7eeGmcf8NyJ+kHjK14SdLGJLFTrSkThyVnReJJHwL8oDqd4vv6EgLQnH7Om8WUYgdAiVT897bqyx4KyL4iCagB1+My2d/4zQjIeunJVDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751887902; c=relaxed/simple;
	bh=EHqNUQU89R3sore7iAI2H4xqVvujymPymPAR6GGY8Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVmu6iy+g/A2gkFf5PMyWg3vlZReqnfuC267us0+RTsrTluxcylxs7fI5dvUJUUu5pNK0RxaU10U1x5n+hItrq1zuFQo7JqD5+RdOeOQT/y72bhFsV8eftfMdnlyZRnFKFOE3hVLMr4SlRvwOyfy24VdNnbxnYezv/h0d5BEoYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CV28eBDt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CV28eBDt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679QEOC018591
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 11:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DWTeIruv+S7Tt3sFAKNHbEJ7BbFsYXgmX08CqCNfWkQ=; b=CV28eBDt1MmHCUvz
	9jfUSDayPh7r516Y9xM0ovaJvXwfZ78AeFUW87DjxUISO96qc4qOkzO/iS9hrR18
	9he3jmNF9p4jwQxpzHpsjGC2ZcTB5MpDLDnflcqdCtXonL50RWaFLMX3WrKMDLLb
	jl/3own5ZwFZk1Qp0c7NYX+nZMqiNwb71cIEa/wEheS1tTdSV5CJvYjmD/GA/aRr
	ATwdeekTIOwv4+tj8DwiYJgoo3w9/v8XNsYx5FDTzLYOZM3kzJ2LBD7jFLlpzJbz
	jPEoIn4XjnmGFEV1I3TNboGsm7xsVBSNTTzQuyS3v//hAW7shmIEf8cjgpwQwNQH
	PaMk2g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qc69c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 11:31:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fac4b5f949so10237986d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 04:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751887877; x=1752492677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DWTeIruv+S7Tt3sFAKNHbEJ7BbFsYXgmX08CqCNfWkQ=;
        b=KnfrOTD5qTwm1YqGEc22uaZW7441E6U6VRLGHVn1GaDbG3Lfx54z4uy5Doxbi3RSiB
         XyRtDB4Xj1Y4SJnh9bQdSk+Rcz80AwlYd2skG8g+b2JZEn3HMlxqlaP1CuLSArV9kO+N
         CIr6oiUI8MLF6YWRRCwnPMJxLgLVMXc4jKtYj0KgdifI/wXE84ioemQ/t1cAEhtCxeaX
         shxwWJNz/Pr7lHBExvGa02LXfVUwKdAdoV2lZF07PFsajvPxq49YVJKfD2z1O3d/Bqt4
         SNY/YtND8+KJ/ilxQ4hCMJ8amibdXvVkdPk6iESAKQOwrzj8rU6Fq5cSDUPoqnDiywUS
         hdFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/11hq8KhIeW7wXmU5fR15knj7qNV887aIJYw5vncm+Scyi10sEE3PEhYjPREq/j26+e8/bGtczn+jazQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYAF28pkHzPKPb7kohixMzVCzcdxy6N4N6j25nUWhgwgSj743a
	G60KONxh8t3IV4UmZzykkjCtjupko1OuKhcJ0PDKAf8ZpeEYKPIltcU3uoz0y0TtlsDgbO/o1AG
	ly2/mAt0MrV8E5xfqBndOjSDLYCMQ/o9aF+KBD1j5VXvQMGdSU05AP1r5/PElhhdYe6k=
X-Gm-Gg: ASbGncsjrF/Y/xmAQAfyzXCUrze+dtj5qYSWKRhH5dhmlcwwvgExeNUoBs8baFiC8KC
	f6vNtJo3jgC8/KEjwYShEM7zTwRZQlw8gCI+SKN/evDXrTiccbDb3ihJo1AdRefZKnz0kLqsooH
	bQN7606ZueZ5SodmmOmBSa1o5jGA/a91eKOM/1wns+QJpK6GPe6/SfirhwJM9vt+VW2LuLvQqtW
	h3k8fnZsh+ZlPXv7Qb3O9jS4hE7j5b5a+PKGfGPZmmq4hXKbMTbIh27VAVR8d2vIasPnxs+6gZS
	2bkXaPsPafDnV1W/weMvgWafVf1a7Liwwn2Gv1C2gPoe1+ALAM5R0xikgN8UhdDvYRa/AcFct+U
	kLgY=
X-Received: by 2002:a05:620a:440b:b0:7d4:5cdc:81e2 with SMTP id af79cd13be357-7d5ddc9bdd4mr594385385a.13.1751887876784;
        Mon, 07 Jul 2025 04:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpaw9CJeuBmYG3lV7sOgssLhggh0DGHOI8ZYixyktqQXpKdT92pvO9ZNob3HUzwHwWW0HtQg==
X-Received: by 2002:a05:620a:440b:b0:7d4:5cdc:81e2 with SMTP id af79cd13be357-7d5ddc9bdd4mr594383685a.13.1751887876211;
        Mon, 07 Jul 2025 04:31:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93c8sm699187866b.11.2025.07.07.04.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:31:15 -0700 (PDT)
Message-ID: <f2793909-4210-4ea0-9f26-af03e0200c5b@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 13:31:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add Milos power domains
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
 <20250707-sm7635-rpmhpd-v2-2-b4aa37acb065@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250707-sm7635-rpmhpd-v2-2-b4aa37acb065@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2NyBTYWx0ZWRfX8mAM7zDk5G5J
 QDthF2W4WnIOrTSf/4SPDlfptVnTl3BmyDZaQRw0l8BWZTwdCjXRrqXoxthWHHuHFUve1Fe8ID+
 eWH+iPLAa/ivq+LCFokexJCRj74cP6sLm0MrfR1R0jRcMJPoKKG0WKLk+KJz/mVKBhIdSF9kEyK
 3KsfqxqPBB7koN6z/2ssyj9FotIpgYLgyALXglOSAJDEWcT16BcnScGCD/7fAG3Yv80BgJuE9qy
 VILInUenhVzcCv5Ze94HQTneoS/Ct5kcx985JNGoUHna38HGXD7mz9FdcIGSrj2VxDARjBv/Soc
 f44IpY9GVUXaxSmOx9beBbMbvu09E5Nc09Y6XVLVF+OY+0OjOal2m9VIjkNHHWzX/mLxOMPWg0y
 KC5Oc3EhdLrPMhn7fnsnVxctpG6bdhEj4OjHXOrOhU7m4vZy3x9F1gtvh8TBMrvpsRxF9EzO
X-Proofpoint-GUID: VO1EvQ9d38dPGPC1aNA9qX3njUhfrZYR
X-Proofpoint-ORIG-GUID: VO1EvQ9d38dPGPC1aNA9qX3njUhfrZYR
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686bb01b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=925 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070067

On 7/7/25 12:18 PM, Luca Weiss wrote:
> Add the power domains exposed by RPMH in the Qualcomm Milos platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
