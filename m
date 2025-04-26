Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65FB1A5BB5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 09:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745660962; cv=none; b=pkRUS5Q12Q3Tl88mqpVBnZO5iEIrLOHLkk9qjWx7SODzCaQfpq58nOSLxoSb0LyYjD57FB1Uz31DK/HWfTrc3hpx60u+hxd4xRbvzMsSEidaWgYh5m/GcO31wk46p4J3e7VAuxr325XpE+wO9ncLxEW2zpNpVdgGqjCv1tzILpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745660962; c=relaxed/simple;
	bh=B8EgtZ28fzm2eefGDxmnFqlqJAmYimcdMeMTIQBGAqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=koUOE9BqLdi0i61wqsdnOQoaWL0heNa1irHRhzCeroi3pxHV/3wBr+gr5ctJzQZEuWWvj5H9wPlywS2Nb5gSfFBsXsNE5IWQUp6xNp2PDnMqjshmrwVoIssByRa43Wi9i892NoRjiQNV7nMaX0T/PrOihWSkDTNDUnDA+qqd1Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bv87gcBW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bv87gcBW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q3Yliv002150
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 09:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeBovqy5swxjnYwF2GUPObcG6Yg58Cf28ut61KxKi3Y=; b=Bv87gcBWNT9PnyUu
	ivmrPliji2D9S0zlNTIL91oCYu45mgjzDGobQHSWw89j2sdSPsnk9lWfh45X3fUj
	L+HIe9fLSL1S0uwAkEksrPl2xdqTSUuKxrBcSkxZwtTACKS5hEI+ttsVpp3Rhw38
	QJYTzeg7pNYrce6935EeuvwYKkRDVQriYi8thj9krf7Zg/QBqjtc8+xA2oDFSlVU
	91zldgyAprr6v5zmqPEorzzfC3QkA5i+50XPgY0cxAZxesqGkmY8E8iKCPE/7y9u
	t7NMGqYNpcE+yY5Pj7hswZAcY6DZlODuLSbV2q8aaqXuoLrh+GWLcyjz7Gy5FoY4
	jcfeXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq58sgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 09:49:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54be4b03aso65743185a.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745660958; x=1746265758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aeBovqy5swxjnYwF2GUPObcG6Yg58Cf28ut61KxKi3Y=;
        b=MlrF3u7F9munE1JUhkRP9ogWGJyAibT2GPV6VxRwXiuTlL/8OHKsu35WB9gnP3pz1y
         lYiLL9X6eCipuII/QHRvUXoBpVUe/xED8FNriJgv+OLxRXJ8BSVSDD6f2v1/6j4wIj6x
         uydWb8c4niA9LlVUh+lGq6YQ9iqL0NDY5i0iBZt+Hk42nGO8Fj9H6WVdFDNU+2zJCRq0
         e/D77RJZWRzx8EXqwLNKrzWEFJl2TSFt1RsnI1peo6zFddmrvuAJFKoo6sYtVhv9mIFN
         kWDeYSPOzQ7gd8PV85AFc6wpmaI4P8mOjyuutDpitjZf3aGBQasA2ErXglCCWXwKxqOp
         yfiw==
X-Forwarded-Encrypted: i=1; AJvYcCW9ixLTi3b0JqY3Ms6Sd/8dIGIyFEh7cNU8cJcPuP9njk0wCqB0LjzMGvXA6VM+7U2k/FEBbVgqf/PteRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/E92GlT4eABk29cGV/eq56uMh1nkHePtsy1hz1ePlunVf0Lbx
	+HfVXzEueKK8YDCDl1KRyUhvcA0hMOtioceQ7TJ23KnjFMVZoV9msMn41HgK8g12xssBWELE8zY
	WLgXp8q2/NxanJCx/g/jueLTgcWoH7Rb48ulBugIS3JbbsoYEwV4oRt7bwnGPRHk=
X-Gm-Gg: ASbGncseigVo8MmjGb9N5jS41TnrVoTBaB89LxWvSlJ5MTNG8NsUtsLzxaYJpvJ2bku
	WlfrbG07TWdqLf4nB02p1JpbaT8mzzI+vfkCGaoyOWovji1rtpqt0yZikiyz4HysSZpV8kpY3cv
	kSrq+q75Ts5Erv7OQA9CgI1biiQvk0K7mQXHyQa0mI4+o799Kepfb3RI6MC1ZA/9wJ90ZGLQiXu
	l1632KqrguI5RmuPvHUhZJb7GnmtwJrfXpfpA52GtQr9QRe1lgfc7+FWaMO+i72maSUI/cKaFGG
	0OkaGyfbIENPzB0f6y88dckCG4u7nQey6CIO8mnBDY8qQkTauNVgdg1VAuTfU9lmOWo=
X-Received: by 2002:a05:620a:319e:b0:7c0:9dc9:754b with SMTP id af79cd13be357-7c96054ba7cmr323496585a.0.1745660957610;
        Sat, 26 Apr 2025 02:49:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0QwLs2ir/PN1N5iqv5F0Lv4U72x8845jtF7TxG3fWASOplWiGCjdLlSOzZl2mG5wF3zAQtg==
X-Received: by 2002:a05:620a:319e:b0:7c0:9dc9:754b with SMTP id af79cd13be357-7c96054ba7cmr323494785a.0.1745660957096;
        Sat, 26 Apr 2025 02:49:17 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edae042sm261565166b.169.2025.04.26.02.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 02:49:16 -0700 (PDT)
Message-ID: <6b6a163b-be75-4003-a618-f0e928a6d114@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 11:49:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
To: Sricharan R <quic_srichara@quicinc.com>, jassisinghbrar@gmail.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, manivannan.sadhasivam@linaro.org,
        dmitry.baryshkov@linaro.org
References: <20250327181750.3733881-1-quic_srichara@quicinc.com>
 <20250327181750.3733881-3-quic_srichara@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250327181750.3733881-3-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tmpsLYQdNhEa7GWYoZNcDfdRG6TM9IY5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA2NSBTYWx0ZWRfX8UfhqrymqaGR gruuP7mD6TyeljqthZekl8tgueC6AwBxMvQ7Y6e3ke3vxHtzYunzHaPsAXDAtiX8j+mbybRg6CO y4AFMwMDbZvc/q2R1RALS+j/gnNgbkEt4vOO5EDMFcTPcW0VOvNsdb8E7d+yLD/dRRp01Yer4wA
 8vGZm/UUt+9gM6gKANbgY+lzhdSXSFfQvq6PX/F6VRmHgNELZ2oFJqd/OB9YhOdR484Hp8SoK2l 4LZzShjuAFzLFt3BUB6MSyhR0Rgw69hJA3Qgr0YNnc2H/bF7ptk1dIwIp4IXSQmJDlfSRe35ESr PE+i9k97izjYasD5kIXQ2eGfSRc0URhXCt4KcmccIH2erLhOw3O6oEI+UbUDzI9R8tZ1x9+qSpN
 H1GVljqs01vTFnGtZCxLdSzvRpEQ4NPNDEJQdD66TBjS7cLKOJkHJyzVjef2uiZ4EwJRPrUJ
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680cac1f cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=LmtxcP_z-R2aA1YV_JkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tmpsLYQdNhEa7GWYoZNcDfdRG6TM9IY5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260065

On 3/27/25 7:17 PM, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> This mailbox facilitates the communication between the TMEL server
> subsystem (Trust Management Engine Lite) and the TMEL client
> (APPSS/BTSS/AUDIOSS), used for secure services like secure image
> authentication, enable/disable efuses, crypto services etc. Each client in
> the SoC has its own block of message RAM and IRQ for communication with the
> TMEL SS. The protocol used to communicate in the message RAM is known as
> Qualcomm Messaging Protocol (QMP).
> 
> Remote proc driver subscribes to this mailbox and uses the
> mbox_send_message to use TMEL to securely authenticate/teardown the images.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---

[...]

> +
> +#define QMP_NUM_CHANS		0x1

Quantities make more sense in decimal, but since this is effectively
a single-use value, you can put in the '1' literal in num_chans and use
devm_kzalloc instead of devm_kcalloc in the other use

> +#define QMP_TOUT_MS		1000

"TIMEOUT"

> +#define QMP_CTRL_DATA_SIZE	4
> +#define QMP_MAX_PKT_SIZE	0x18

This is very handwavy, please structurize all data that comes in and
out of the mailbox.

> +#define QMP_UCORE_DESC_OFFSET	0x1000
> +#define QMP_SEND_TIMEOUT	30000

Please include the unit in the macro name - although 30s is quite a
timeout for a couple bytes..

[...]

> +#define QMP_HW_MBOX_SIZE		32
> +#define QMP_MBOX_RSV_SIZE		4
> +#define QMP_MBOX_IPC_PACKET_SIZE	(QMP_HW_MBOX_SIZE - QMP_CTRL_DATA_SIZE - QMP_MBOX_RSV_SIZE)
> +#define QMP_MBOX_IPC_MAX_PARAMS		5
> +
> +#define QMP_MAX_PARAM_IN_PARAM_ID	14
> +#define QMP_PARAM_CNT_FOR_OUTBUF	3
> +#define QMP_SRAM_IPC_MAX_PARAMS		(QMP_MAX_PARAM_IN_PARAM_ID * QMP_PARAM_CNT_FOR_OUTBUF)
> +#define QMP_SRAM_IPC_MAX_BUF_SIZE	(QMP_SRAM_IPC_MAX_PARAMS * sizeof(u32))

These should be expressed in terms of structures and sizeof() instead,
as well

> +
> +#define TMEL_ERROR_GENERIC		(0x1u)
> +#define TMEL_ERROR_NOT_SUPPORTED	(0x2u)
> +#define TMEL_ERROR_BAD_PARAMETER	(0x3u)
> +#define TMEL_ERROR_BAD_MESSAGE		(0x4u)
> +#define TMEL_ERROR_BAD_ADDRESS		(0x5u)
> +#define TMEL_ERROR_TMELCOM_FAILURE	(0x6u)
> +#define TMEL_ERROR_TMEL_BUSY		(0x7u)

Oh I didn't notice this during the first review.. I assume these are
returned by the mbox. Please create a dictionary such as:

u32 tmel_error_dict[] = {
	[TMEL_ERROR_GENERIC] = EINVAL,
	[TMEL_ERROR_NOT_SUPPORTED] = EOPNOTSUPP
	...
};

that we can then plug into the function down below that currently does
error ? -EINVAL : 0

Konrad
