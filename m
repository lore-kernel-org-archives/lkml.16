Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E3F72601
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355659; cv=none; b=JPUQFiAbuE4yi6hIMmMwcx6PrH+nzdjdxm3ayiKiDF+MwMJnFTHu8mhM5DgdPOqa+kyCCcPoniL0lnlAqwaV4hcBjFyjx9Y5A5jIEUSqaUX7CJgtkOd9UpYBsrYayeJSKHBBh4zCrCI2X0Bvi/hbHZbi9Glbsw53gP46jcrSVak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355659; c=relaxed/simple;
	bh=HPdrHWCoDuz13Ky7biRX7elTO+NC2HCwGNPBBt8sgL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTc5HarLR6oKs8fmtNyTx55CTUizP7RivFJL1fm8etkXJz1tW2YFjRr5ZRoYZUAT2glLKCtcHewmegRwuOZEjRsQx02X1W1BIt0REfnKXIKgh1rIGH6rTjWky+A2ifoSxUQxFh/KTwje1CSi48SzWmn54eeiwVw0NiwR4t8RK6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZEvDCM4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZEvDCM4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5614OLgE028627
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 07:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBiUuHa4Ev9QfuzvshOa4pF5bJbfaWZqMb3L/YViHMI=; b=WZEvDCM4cX6BvRq/
	PFuv4W4DDqBcKiP/duuLq6RRydhbVPTi2zFCdKiZdKRtnpz4lw+qhukm9xqGeRcF
	+50gsHo90HJ/2rwv+ZJo/S+98Bt6ZXJcJZY3MGZ7aLiE/1cxQSSFVEPoywuj/ODX
	eHH6PQ4bV1bINlDIpIAnc7JVXo04fjQVs0klDu7AQpoKraPypyfBq7GnbVyoS+Ww
	NbtFaLqe8vrjcqAdM9rCouSmKUCftOB37Zr/zii0/VoKZy+gMQpTd1QIEh5/VRM2
	GLKyoozK+cGUlmhFediQEuE0ZJeA6Xg1lwPT0d7BfYtaupXmrAUz6/yKQyNU77JZ
	NEmO8w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvqm3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 07:40:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a804126ed6so6722461cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 00:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751355656; x=1751960456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBiUuHa4Ev9QfuzvshOa4pF5bJbfaWZqMb3L/YViHMI=;
        b=V1MLCZuDUg7ek1aE71coEriWJrgz2lmDnBjVp7n1XazE/IbSfAVES3ICfqdN83pR1l
         s0NQ/8enqTAzaJFzLBT0kTvERaHAHjQV6Ijfh5r7Z0efSlaqcT4k8RtR7uvWCCMinmCJ
         KXL4uDJMukgkYUj8fgqS0jkxHMwVrgMTRugkyfwMFwWFU3mFS0zEko6yUeSVngxTKjJt
         NpIll5jO9An6n1wE301tLYlZAklBbmDbERpyZACv10SNdLAcQsXUcawanAUqT+/bieFP
         il3tC7ErT6RcJyD7VfrvI/scUGPi35dFgzsm1DPZCs6W/sE/SPlAgo74nUsHWUrW/g2s
         VufA==
X-Forwarded-Encrypted: i=1; AJvYcCUsTBgYp9ldp+p+0Nvhlv2GGFLip/tgFZbRk5vmrGPJvFBaxbO7QLVnmF9toStGLx1oKsqjBeKQLuOG3GQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc6d88EI08/GK8CZ919jRl7pPn8qsXa/hRN1SqeFNIL1r6msF4
	NTL3pT1kb4RozE4ZbG6641GOUN1H7TtIkHxl4n/lKvQe/Y1wF2q/+JG3F9oA9UmF98Xqp1DLGm/
	ov4hxuvE9KwHckFBkpOOj0AjDSxAOcA5fFxMyW3dsykt0Vzgke++coCMu21yvnVh1Hdw=
X-Gm-Gg: ASbGncstBLNPlw3+2lqPSTdk9I9VctjDJ+Ojx4m2tNtjlWFO7Qt4avntPFuh1H96N7W
	+FroeWQ5TS2Agwe0LN77vOk0dJ0YlHpvPZLy4Rf026xlki71maQxabAChDLf/FzZYYLsmYIwYGf
	EBLb1dY4ynoLoBQjbTbMkwxhp3Nsuha11NKnH/dVQqGsRowguZ91Z0TI++AVFq1bGuo+3NSEQde
	jANWzLG4y55i4RG6kj6q5yBEfKTGWJgmJaDgvafRlGRm/AjSIbh4tFjFDo897sx6nFEaAkPjfru
	CJ36GGGhSLmx4jtR0abBULUJV85sJSNV1W2wWdVSP0BN2hchAIilLH0dJeBeSOOtE7wv2QX/Wvv
	t4e308LbW
X-Received: by 2002:a05:622a:11c5:b0:494:acf4:9572 with SMTP id d75a77b69052e-4a82f7911dcmr14041731cf.0.1751355655654;
        Tue, 01 Jul 2025 00:40:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8vIAxiC7R4/LjBlXrebEnIw+5ENBMrqahks1cWfXfwrsNWihn1ztDjWEuPkXZzU19jTs+TQ==
X-Received: by 2002:a05:622a:11c5:b0:494:acf4:9572 with SMTP id d75a77b69052e-4a82f7911dcmr14041601cf.0.1751355655195;
        Tue, 01 Jul 2025 00:40:55 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca20e8sm801034466b.165.2025.07.01.00.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 00:40:54 -0700 (PDT)
Message-ID: <5782155d-c69a-4176-8e57-3af938e5527b@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 09:40:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end in
 _driver
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Agustin Vega-Frias <agustinv@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
References: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
 <563db91f-3080-4a45-ba0d-04f415ed90d9@oss.qualcomm.com>
 <4396deb6-049a-4649-afbc-fd20986b118a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4396deb6-049a-4649-afbc-fd20986b118a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1dmB5kxBseIhnNk0lizdccy1IjiS4yTk
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68639109 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=IpJZQVW2AAAA:8 a=8sca0-RJ1klIZi52FdgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: 1dmB5kxBseIhnNk0lizdccy1IjiS4yTk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0MyBTYWx0ZWRfX0vm1/ewNAdKd
 fBIZ0liQqU2//HS+DdG+WhDn2voHT472Ezj2mOsrEUUVAExIczetWIBD/0/zzMbk9f+HGX+c5TZ
 /BoK7BASS72UJnAhy+sWV+nfYpJ59cKafE+LZL1nYaPcpy6WIvHxICpo6gTqDcfOY7nctvKfO4Q
 FkRmLr82e5Luk5+vpcn1l0hgV8H6m/dt+UAVa7lLb3CAEFaozNBxAQhZUsrrQ7jU13SS7Bc5+l0
 GLclBSR5p3WkvUKc7oVu+IRGbF1yI/66+m1QeNNNsKQyuIE6UdV4E8An6m7tjde/EJFKxIsHP5h
 LHodylzccEyTHL//GY6EYbUUNVsbVMpHa5EB26bq/LZYd3T9jSAlklJs6NfC4Cz07FSG2RbInOo
 DrPkp3gZYMgSvbQaWcbQBLoFU6UD8QcBvfDYH2gXyNGE44hbfR+/9+T+//6vE+58CKt1LSiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010043



On 30-Jun-25 20:31, Jeff Hugo wrote:
> On 6/30/2025 11:25 AM, Konrad Dybcio wrote:
>>
>>
>> On 30-Jun-25 19:23, Uwe Kleine-König wrote:
>>> The modpost section mismatch checks are more lax for objects that have a
>>> name that ends in "_probe". This is not justified here though, so rename
>>> the driver struct according to the usual naming choice.
>>>
>>> Note that this change indeed results in modpost identifying a section
>>> mismatch in this driver. This is not a false positive and should be
>>> fixed by either converting the driver to use platform_driver_probe() or
>>> by dropping __init from the .probe() callback. This problem was
>>> introduced in commit f20cc9b00c7b ("irqchip/qcom: Add IRQ combiner
>>> driver").
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>> ---
>>> Hello,
>>>
>>> I don't know if platform_driver_probe() works here, it might happen that
>>> the driver is probed before the matching device appears. As I don't have
>>> a machine with such a device I won't create a patch fixing the issue,
>>> but if you have questions don't hesitate to ask.
>>>
>>> Please consider this patch as a bug report and better only apply it when
>>> the issue is addressed to not result in build regressions.
>>
>> +Jeff is probably the last person on Earth that officially has one
> 
> We are talking about QDF2400 here?

Yes (or anything from the same family)

Konrad
