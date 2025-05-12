Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EC32522BA
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068043; cv=none; b=CiJmPeL3T+/vjfnbJ+oThLjcSz8zJpjHH/hLCpEp+Kt1+cQ6YhlWsPqAa7yH75APXPtlwkiuWGKyS2/3EIlNHxMfQ7WH9VpBwG7LDqMmHBMGB1+rD4hjJ0I62Fb5nE7LCGb0nehnVAP09s2MrHhv4beWNenQXAdIfXkyeZ5f6t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068043; c=relaxed/simple;
	bh=IBYs0W8saUAyKuZtsz6A9gS7i3ub4vw3XW/jT+PXSus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPYlGs1LPlkuQ3aESSef6YK+2AnXrRnv1btqQcZkMLCham9gsS0cQdCvEr8pcaNgQ54OViHvKioNA2UmWit78/DssqNVZbGgrO5IdXdKwXcSJe0IT9C/aTU3Con8yFws9jHJS2n0wHiExEYpbJEEQ1lsOdndB8o0Xzg/g2exfiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLWsQO1z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLWsQO1z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CAKZqm015473
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kr3jWOCGeen6mhPU6fQ82uGqo7KISN3OGotI9WEfvvg=; b=JLWsQO1zK5h+kY+3
	XgMugpyth20ltJzSLsi4BAavGHPJ7W5PKT/gAoHNW461/cYPAnIr4xQv8KMsSn/e
	+oKmNPd4D7B/F2j92WHykFvslMQ5BWUUsvHzTtl2UZy0bAEbpcMwhg3nrfKVn+b7
	F18qCj7u4Jk+6R40GikdoBn2iGhTP0mDBLaq35T3PXtvuBUniBUebVabz1H87XUe
	QcatAHQP7nUhbDmgx0hdZ6SSUbEsZrO+B1M6f023V3pLH70taUWrYplSglw67tFn
	wX5Of4Nh7+WYBYNTWQxRWeupBddVxn1akWstUbin948ZK2s2KqEL788oJ5jtXuzo
	aEI0cQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyjjmw9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:40:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7789335f7so20145085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068039; x=1747672839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kr3jWOCGeen6mhPU6fQ82uGqo7KISN3OGotI9WEfvvg=;
        b=MqfL3+DRNiqdocpkSx/ZSnxmim3Q+MHB1AfXDBXb38aG/OKBrf+R0jekcSLj04hiVD
         rwMT8BBQX2pNc9KWmKjVL+dLXwGsFk3XuWb9k9DbE+oluAXAaODiBR8DuU0YPT4BsdGG
         nGusoMqkrBdSnot1O11VO1+jgIlbq07BFFalRKgPteWeS7SsCiwlLcQfhNYC/JyMN3dF
         Gr9fGlnRBfQrlqot0UTfYv+2c1b7y02ilrVo4QmCuUa5cQv6AJpqfuAlyVMwE9uDUtir
         gV8XHdauHrN7uTGnZo8VdgJ4qmfx+PXPdmc7yxZL6YW6NAFaVWIeiWDR5jZHPfkMUtD8
         y+5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRdzpWyDjpUhLNgxGQXx5XdLdLh2zfNJ48+4MF4AQDGYNnYfuesRjpcPq2cgtR4hOdaHITVLIHdv87Wu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YymettLdU2iCBB4agV9hYejWdxkRse8+jBoHwM8HhY0JhUM+mo/
	JOgdYyar7eG+oOemt6f0viW3PXWXclsPdWStzaGI5mQL9pyqOFjjKODWGOU1XpUoAc/kyGZ+LI0
	xr2Q0QrtD6So6uxVdOfFvHAtPDvQtY2Gb/p4d6l00gwYaQoNzvN1gfggLvGMgdks=
X-Gm-Gg: ASbGncu0OP172Ioru5BmuuPFMlZ53rHLs3XARiLdtRnprBqtN7zYKWxnSSyVXYwHxGv
	GCdiUUMCSWXhg3lp18dedp0acMeVv+73eDyoxJiZyLGVfSLA0L+MPxDCGmNNCI63/S41Jsdr+aQ
	Bq9UvL4nKuiN0FNawxsmxbD54dQL6UONXSGeTl6uc5kIvJRo30glbVyBjtH5lq8RDF0zymmc9WJ
	gTCDkpfFZiisaoWK13gjBAAdjqou7QVgrPYHnYeIpnurODmHGAR7JlUMUsSyZ7bAfj69Ij+P70Q
	L3f0x0jQEGhMTsq3M6ILguwlDLIqYueKlARAcCHDl5pwtr3neYMub1RA0LXthV9R1Tc=
X-Received: by 2002:a05:620a:4442:b0:7c0:bd67:7dd9 with SMTP id af79cd13be357-7cd0113e87bmr724491685a.11.1747068039515;
        Mon, 12 May 2025 09:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYboUn9LFZ6zKugg484tI2Fmt+H6eRADnHp8J2TCCgkIo9QNbZ938v2XB0JB1jPwZubnycuw==
X-Received: by 2002:a05:620a:4442:b0:7c0:bd67:7dd9 with SMTP id af79cd13be357-7cd0113e87bmr724490685a.11.1747068039202;
        Mon, 12 May 2025 09:40:39 -0700 (PDT)
Received: from [192.168.65.222] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21947a13dsm638882166b.83.2025.05.12.09.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 09:40:38 -0700 (PDT)
Message-ID: <3c7ddb25-1d76-4f85-a058-abdf887dc0dc@oss.qualcomm.com>
Date: Mon, 12 May 2025 18:40:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250512-trace-noc-v5-0-f2ef070baee5@quicinc.com>
 <20250512-trace-noc-v5-2-f2ef070baee5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250512-trace-noc-v5-2-f2ef070baee5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE3MSBTYWx0ZWRfX52a7ELjmCeqI
 CVd03fbtR8yxopIAduXSk35mNIPsKXj8w9FSsl1mji1Mv+tuzcuCHeGF+lb7Nhafd73/xf/eD4M
 QDv5tCreUiQclUcPZclCS889WXoT/M4YSepjWjnB9tZhuKdzGvKPZyv7wJPRabSEaFmZcXYn0N9
 iLwzLT8JRRSrH7SKBq+vsviee4p9RGgTBok2FmD71U12o/Eg0nPTsCXpnRBv18Tn7XSVm+PQ8Pa
 qm7rwwIpnoWJvFJXnUV1+YMWVq40ijykHD5CmvVRInPf90T6dJSj3h6ZYB3lQqNhI1Mz7/q/llr
 3iyrsZETT8RzTbYMhDzc+b0+zznQAsOK5dH/I/lfHSauRFAHz4Iqort1VpH9/q27BT2I6RYVT6D
 NNjB7L8Un1sdfWqHmEvsA6P+SnfSSt8Iy8lW7FmJ6Rpd3jr0ze1u03G1P5fwFm+pkFjenTwb
X-Proofpoint-GUID: M67lRcH5St-k_JeRWOdVkNQpN8jBQgHW
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=68222488 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=IWLDPTm1b9FEelM1JeoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: M67lRcH5St-k_JeRWOdVkNQpN8jBQgHW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120171

On 5/12/25 1:10 PM, Yuanfang Zhang wrote:
> Add a driver to support Coresight device Trace Network On Chip (TNOC),
> which is an integration hierarchy integrating functionalities of TPDA
> and funnels. It aggregates the trace and transports to coresight trace
> bus.
> 

just a couple nits that you can feel free to skip

[...]

> +static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
> +{
> +	u32 val;
> +
> +	/* Set ATID */
> +	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
> +
> +	/* Set the data word count between 'SYNC' packets */
> +	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
> +
> +	/* Set the Control register:
> +	 * - Set the FLAG packets to 'FLAG' packets
> +	 * - Set the FREQ packets to 'FREQ_TS' packets
> +	 * - Enable generation of output ATB traffic
> +	 */
> +
> +	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> +
> +	val = val & ~TRACE_NOC_CTRL_FLAGTYPE;
> +	val = val | TRACE_NOC_CTRL_FREQTYPE;
> +	val = val | TRACE_NOC_CTRL_PORTEN;

FWIW 'x &= ~foo' and 'x |= foo' are what one usually expects

[...]

> +static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct coresight_platform_data *pdata;
> +	struct trace_noc_drvdata *drvdata;
> +	struct coresight_desc desc = { 0 };
> +	int ret;
> +
> +	desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
> +	if (!desc.name)
> +		return -ENOMEM;

it's good to add a newline after return statements

Konrad
