Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB0728D85A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561350; cv=none; b=NPEpOwcSIRj0D1iXW5xvetIINZXmY54AZY9X5hKJuQFHztIolTK2wP35X7UIZU9N5Ff1N27r1oqPDZwo4d0HkzS4fHksDkwIq8EuLgpXFzgAkLGZt6X4SbuA6vvSK1zfq3L1KafKIFnNi5xtCXpxgjgmLMgzxAvNN5X9NQPOKW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561350; c=relaxed/simple;
	bh=5KHtsypxTOEwH2hoppvEko6q+MsIdk4Z+d5NAh05LDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JESnGDAJTlU4yaj33+scuYjyGgSyxWklhoIagABubkmeq0liXhrWQut9KI2jxwey8bt7E+m0FZ7cH9jpdkn55341O1nEGPojbrXStKRgnd3bCXRjIQqvhMeDd+ane4EsiTuYyHo1zAUzR6o+Ci7kOgCLINAipqIi1L6BSPXXzWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ijXudvW+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ijXudvW+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8hW4K012128
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EwAmNEgz2U5R+Js4hjnEnVcfF/36zo6RLHZeqTJsg0s=; b=ijXudvW+2QCLsfen
	AvCbBi9I3LSakxmN0oAsNGHvKAGVW4Mg/6zczjaVLxk64Xdc3TyE6+DaEkCzUqSy
	Qxh8xhAbg+Xxx+6WkKkR+7MdWTJKxpp80fp9J4eJp8K3O9sVulnnNQ0MdHyuZa7f
	b1ZuD7t7BriHB2U25cWUblM6kbMrT/Y31FxGkiBcRo9/PVm1kMeI9MbgAcAHikCs
	0JFekTXbYZKXxCwGrdYWoxq/fprh7c1KqtIAJoRMCWNnynHFuQuGa08mrS9inTtH
	14l1CKq+edM3PLL5IM07eS8Zf5WGtOZ0ghVvbU05ekFqR38s8jx39P8XE/SPeibo
	wbT85g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv9fbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:15:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09a3b806aso97133985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561347; x=1750166147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwAmNEgz2U5R+Js4hjnEnVcfF/36zo6RLHZeqTJsg0s=;
        b=oO1bo5op/VIV+s2khSP3L+r5h4dO7Z63Jb9tjjwldrOSuIKhD7rvjm8HTnjoNTlycc
         sGXn2QJrwvrBFxqUIRIL32ZPlcY+kIV1wowfbEE6d7cxn+OtZlEG77oPl6NIF2GtPrPy
         ht0z0m4ULx/ptTwRpCfvetP+iEZVNVT1F1avrko5W2RnLr1rwlrPR0SRdVimSQrISTB+
         gIUjloeicLGCrGyxg9sxyhmdIJLx6yxPPko9FBfwHgWwNJT1IP2TZOzWlDgCNEVzuMMN
         h1wELUluC1jS9uDrMPMaIS4SSiBQQUhyucct0/BWvPARHQgy+eSKl/AXWJQztZ8CeRti
         7t1g==
X-Forwarded-Encrypted: i=1; AJvYcCV6B6he+Lio7/ZyHfqy4Qwqa8tQeTbALJH48uHk9EmG1rtsweu8YXyvqEek2ePpSvSqXUlRJ7Kt8DrHtto=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDAP42nup6VyC50P/yPTsgPznh4VBlx99OGcvHb52IS3e7jbij
	ONrQBJanFuLoomWSd5TYbT/TaNwWNlAmqbzx8oLEbd3YVO2wyiYLu5entJhEoJMqj4oavsZXBUy
	kXnCcVIsUGT1Qu0eL1F6JQsl1+W6k8x/ujFU/N87Hqo9bCJqiDCMgBffskveEwJgubYc=
X-Gm-Gg: ASbGncvEUB1EQ42swQaUBym0nV4Einlc1iyu/X18gMI6R0ujDckEMGxUb9ssnbDeOOq
	kcOV6ZA1yZTxAvEgBdzNynPuG4i+Z6BJPRnGhJ3oSFWCnmQbUoxha1akyZFuncX0tFfXbifBGMh
	EQRTwwxm4XUaLprw6aCc4vTLU6JZMcYWxjsygn8XKv+H6+c+zsesGU0u3FflQKVY9V/CsIKQkxA
	g3Of8afDUaGrVgh92z1RZ52VR8yzcN+XAg5IpQY3zi0NmOQrJ+PBK+P+FdiYERt3gETJiPDFmgu
	gPTiuVKNvBhXTW+LqXCSa0qG5WM5w7sKblxGhmJAlE4ikxbdiSQA2io7MNsh3iyqJxgMwxpfw0D
	0
X-Received: by 2002:a05:620a:288d:b0:7ca:d396:1460 with SMTP id af79cd13be357-7d33df39118mr853769685a.14.1749561346905;
        Tue, 10 Jun 2025 06:15:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtqxF7J4fX5ZWQs38R17ip9jUcljtcIHttrdjrmoxx/VmubjbCQ1iXaj4T2zV2SHyjyVpQ1w==
X-Received: by 2002:a05:620a:288d:b0:7ca:d396:1460 with SMTP id af79cd13be357-7d33df39118mr853767185a.14.1749561346394;
        Tue, 10 Jun 2025 06:15:46 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783dd48esm6072351a12.56.2025.06.10.06.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:15:45 -0700 (PDT)
Message-ID: <56eccdb0-c877-431d-9833-16254afa1a0c@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 15:15:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: qcom: sc7280: Move phy, perst to root port
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com
References: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
 <20250419-perst-v3-3-1afec3c4ea62@oss.qualcomm.com>
 <20250423153747.GA563929-robh@kernel.org>
 <2ce28fb9-1184-4503-8f16-878d1fcb94cd@oss.qualcomm.com>
 <ba107a41-5520-47fa-9943-6e33946f50b1@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ba107a41-5520-47fa-9943-6e33946f50b1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6c4rIJ4n3RNomnqb8x0ckUkll6BnAzr3
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=68483004 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=IJG2AnB_qZu2HhMjgm4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6c4rIJ4n3RNomnqb8x0ckUkll6BnAzr3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwNCBTYWx0ZWRfX8kHnOVYD2cQH
 wk55VG5Ar34XfYiMOQPmsf7zQKIr2PrJHNXMOUKTlxEmwAFI7WfFKiTar3dkyNbOCQ6AE4BaP5K
 wLLk/SWMuqXiFuRu6ouLA7ixdgwnhM95YbaF6TjvLC1qRwG2qBk2/bNZcDgrncOcqlMsxFaN1f6
 uAI+CkeTyVDazX33b6OsA46cbTQg1MH8aHsJYrSBhR5vTiPEqWTctwtvp4xq51UD2BN6T63pxK6
 TBXLqkWrM0jSRtNS3n/UvqzBFPhnlDmGlkGah68sED5KQmlJzMxnEEVVziCPtiNyrtonKeSMP9H
 2roMZFFsgQIonD7rLUMe8cybcFbfGZXd7uvzER5+XyZBbxWsJXglQnLQ10DDyQvwnZBuJmJMvz2
 rRlkXiwuGX75WNEH6EmCjdhu6b8e+1Ey9H+3DGJ5x3k6eYOHyJi1OZ8Iuoz2ds/t5K6lYlXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100104

On 6/2/25 3:01 PM, Krzysztof Kozlowski wrote:
> On 08/05/2025 16:26, Konrad Dybcio wrote:
>> On 4/23/25 5:37 PM, Rob Herring wrote:
>>> On Sat, Apr 19, 2025 at 10:49:26AM +0530, Krishna Chaitanya Chundru wrote:
>>>> There are many places we agreed to move the wake and perst gpio's
>>>> and phy etc to the pcie root port node instead of bridge node[1].
>>>>
>>>> So move the phy, phy-names, wake-gpio's in the root port.
>>>> There is already reset-gpio defined for PERST# in pci-bus-common.yaml,
>>>> start using that property instead of perst-gpio.
>>>
>>> Moving the properties will break existing kernels. If that doesn't 
>>> matter for these platforms, say so in the commit msg.
>>
>> I don't think we generally guarantee *forward* dt compatibility though, no?
> We do not guarantee, comment was not about this, but we expect. This DTS
> is supposed and is used by other projects. There was entire complain
> last DT BoF about kernel breaking DTS users all the time.

Yeah I get it.. we're in a constant cycle of adding new components and
later coming to the conclusion that whoever came up with the initial
binding had no clue what they're doing..

That said, "absens carens".. if users or developers of other projects
don't speak up on LKML (which serves as the de facto public square for
DT development), we don't get any feedback to take into account when
making potentially breaking changes (that may have a good reason behind
them). We get a patch from OpenBSD people every now and then, but it's
a drop in the ocean.

Konrad
