Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8905F2D8785
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776259; cv=none; b=GOXpnvB6/ThA/Cm7+fdQbhyqUZZoJq5LdYRZ5oRnxW8S6un+bBnr2XGrHC9OK2/RsmiEBxJ/SKvDQ1K18uCXzOMX16rnpFRgbFmpRV3cha5qpsDzddzVa2VPMVUqR94toMsu38BN0glmOTsttb1055KPqhAHJ2uww9Z1LkwXZDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776259; c=relaxed/simple;
	bh=0Igo8v1VtsItNsT3AblHA6Ew9pac4mchXDLSX67nECA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCApTAF1LePHv0bj0Pb1L3Iwa/ZU62ELy1Pg5juW3Jd5qbsHz15HkA9sKLigwKznIezwq4gSty3lKC4QGGCTFFlaEbCH6HfKB4ALn5ecesFSuyUtqruBXjd92qbV5vigfktz8MbG51cIEh/AF8Z6HrqGjvC2/CC08e8ZZEWE+ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4inht1Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4inht1Q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ODg8uF021627
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XalkEpC+IPpJrudCjeVEr9SC6eR1svVywZRX2OgzbKI=; b=k4inht1QCHusHcon
	c7j5JdwWAOqNUJn3ihSR9O02zHs5Xj8/mPqLqpm/pdqqWUz7u+nnaefFsBtp+dDQ
	ZZr6i0lgJhRUnAPjO7VfVDrz34ltQ+6b8v/VEXHI2gfPh0PXDTnAD7YtxrWIZafA
	bvwGJ5hwu3LzAb1zgIfCmXwV7Zc9AGtC/0DuC/f/DxE9k5t/A5IaM5T7vVQU6AO4
	3C7r6Kkb01LTHojg6Brm7eC7w2QKE4zKQAKhjqiJL8ScUGzzkPxnthQ2IB/FKLgT
	LAfhciDANaKoDFxSmgfHT5RENdNF0f0wm2XYMU8SrvUsDk6TeRCE9wRa49vD7La8
	A/feYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpvq61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:44:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so152489885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750776255; x=1751381055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XalkEpC+IPpJrudCjeVEr9SC6eR1svVywZRX2OgzbKI=;
        b=VGdVM62dzM9Jp77bvhiRHz/vh5qwl7wEHVDVrpZRTfyXiDnpPrky9GxEl4y5yUSKw/
         aeHngY0YlWafsq2I1BETb4bBofx7rm5bm1AmVHCuw7B8z5lvzN9XPRbQDzcfXsiteTq1
         1rZYdZSyQAukMam+07sTWDsP0Vp9ffMskDw7/j83O5KZcV0LBRIlDuri+wC/H/y5hAW9
         lshyrw5WOzcNnrUeI4Z78m5QUtTU1SvnV2191hov7TCtPVEj4uQOlo4A54BNfhZXq9wU
         M+h2M2oD5+zifRlrMyerLNdY4INuyVRpaX8dnoDaCKetTd4+udQpFQAEQqeUuiohJBoE
         viVg==
X-Forwarded-Encrypted: i=1; AJvYcCUYLmRZ3Akwy8gLD2SmCCNZ9XAbjjQ6uJmjuyUxq/1GiChdt/HntPXbiYnyHSfEImWNUY/kJ3Z81FZUV1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYZwy8GvT/CMa75AxrByFhOePMD9u3RSBWla+u74pSeLaraYs1
	G7WCGXcPnLaDy+LKpbC+vRqJFjA6azyenLRN7nJSfE2bisLtnItV61y1vjeXmu/ze+rYLk5P7bu
	9PtdXgiAlIUrnHsNb6c5WvhfwHpJZDTUlxYAhF4+toPPqQXxMQ+fnHT+pyG6l7M9sncc=
X-Gm-Gg: ASbGncuG+5A9XMGB9FoDjVP/PjZ/eL/J0MagouEIuc0B2sD82SG+vWR+/y+ZDdbFf+G
	JjQXrYGNTYVQfHXPjoDuTyNVKbQeKx3slbiVMpwL8baXPBXk9Ux8LUX+9SoBSMTM89xXulvwiVm
	2qt7Q9aZQvl3mOnde15p51LO8Tw7iyYjYSQ4ndp90QBYRbZsSK89CSO1+H9L2GLhDpCePe27+pa
	FtwGkyocm5ioz36+qf7T7A/FV2/sJ0xBhiielEi1Z8xHViroD2BvyWquc3WiP0QwuuxtxZi1r8A
	n4HKbxrb/PvEWfOUBKMKM9pPDqq4SwbiHoO9sclo6rz3nuwY+ny6pU00wzB/9hO3dofdvIylasb
	JzI4=
X-Received: by 2002:a05:620a:a115:b0:7d4:1e05:ecae with SMTP id af79cd13be357-7d41e05f012mr194639385a.3.1750776255367;
        Tue, 24 Jun 2025 07:44:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVq8f37SvoPT0P8pLGhVHvvXyWJweJ5pitiEAPEdL2jkjDDdXQB3lhdYSnOQ0RtIqUeUDZag==
X-Received: by 2002:a05:620a:a115:b0:7d4:1e05:ecae with SMTP id af79cd13be357-7d41e05f012mr194638385a.3.1750776254954;
        Tue, 24 Jun 2025 07:44:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f4a997bsm1112538a12.81.2025.06.24.07.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 07:44:14 -0700 (PDT)
Message-ID: <c4947591-4d09-4f49-8458-b993b5f95a2a@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 16:44:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: rpmh: Add support to read back resource
 settings
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com>
 <20250623-add-rpmh-read-support-v1-1-ae583d260195@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250623-add-rpmh-read-support-v1-1-ae583d260195@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685ab9c0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=8FWldycYYUwg2ulvLiwA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEyMyBTYWx0ZWRfXx1SRinBrG2BV
 RsT7Gf3zf0aVg7vN5DeHmJU6akcwJRqHVAZ6KwoxH62/IunIFBEzlnJrkFUHP4vGxozdqFu1KO9
 P+osNJQ3upkaS/WmKD+6Oh97NGct1WdYvvyzH7J185WC0KKJqgff33MNcvEEF1xhzU7LySfalpm
 P5LVvx8V7ouqBSdOe0PfN8hWZXkp2WrdwFIoERBfmAYWNiuZim5/aJz5O1Sf4ia7OGDAaCQ2Uqh
 DcSW4f666TACzizBHiDEWng3WxM8rlkjge9xtSoEq3TFLQL1c95DZrmNj+oEO972QMwFJQ+Wd/t
 b89y5kRHN7lV18p6CRgAVFjp/v3Zhf6Y5NFwZvLpciREulGrStFhafWydQQvvlNshn/hc07U9AF
 6E35Wzk761ZjkvqGhMq1B3kuAXuvm/zfvfr9F9Dum3KgQS4hws0Z2L9mGDW32w3jydeOKd4Q
X-Proofpoint-ORIG-GUID: H6MTKqlfpuCuuKqtZm_QItQKMlS_u_Nf
X-Proofpoint-GUID: H6MTKqlfpuCuuKqtZm_QItQKMlS_u_Nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240123

On 6/23/25 6:43 PM, Kamal Wadhwa wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> All rpmh_*() APIs so far have supported placing votes for various
> resource settings but the H/W also have option to read resource
> settings.
> 
> This change adds a new rpmh_read() API to allow clients
> to read back resource setting from H/W. This will be useful for
> clients like regulators, which currently don't have a way to know
> the settings applied during bootloader stage.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

>  	u32 msgid;
> -	u32 cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
> +	u32 cmd_msgid = CMD_MSGID_LEN;
>  	u32 cmd_enable = 0;
>  	struct tcs_cmd *cmd;
>  	int i, j;
>  
>  	/* Convert all commands to RR when the request has wait_for_compl set */
>  	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
> +	cmd_msgid |= (!msg->is_read) ? CMD_MSGID_WRITE : 0;

if (!msg->is_read)
	cmd_msgid |= CMD_MSGID_WRITE

looks more human-readable

[...]

> +/**
> + * rpmh_read: Read a resource value
> + *
> + * @dev: The device making the request
> + * @state: Must be Active state
> + * @cmd: The payload having address of resource to read
> + * @n: The number of elements in @cmd, must be single command
> + *
> + * Reads the value for the resource address given in tcs_cmd->addr
> + * and returns the tcs_cmd->data filled with same.
> + *
> + * May sleep. Do not call from atomic contexts.
> + *
> + * Return:
> + * * 0			- Success
> + * * -Error             - Error code

This isn't valid kerneldoc

> + */
> +int rpmh_read(const struct device *dev, enum rpmh_state state, struct tcs_cmd *cmd, u32 n)
> +{
> +	int ret;
> +	DECLARE_COMPLETION_ONSTACK(compl);
> +	DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);

A reverse-Christmas-tree sorting would be nice here

> +
> +	if (n != 1 || state != RPMH_ACTIVE_ONLY_STATE)

if n must be one, why is it a parameter?

Konrad
