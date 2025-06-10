Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B374B1F0E29
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549694; cv=none; b=jYqeA5qLuWsJrgeeqaCqjmhneH7mE5H55i4KLbk+NW2o9GZJaTiozpD9vZ0X5v433UE1kWQNYhPBfEPGpXlnm7H2rjT2poG3kFcTDF9dlOGBPpc7CwMiHGLqWjigDMMOP4u6OOTasHFi52dPggQXwjmT8tUDocS9AKaVNxtTnok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549694; c=relaxed/simple;
	bh=JGAV+CUOY6EXm8RJw2oIXNOxzAARRDM+J0O98cxQxsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OAhC6twUglkyZHarEROYXnJ3hhUx/Q9dXCHg+UQ8f9Gv6dy4/rkeaXdVGCHFD7FKMZSXR/CFsuJ+NlWrQXMPIiJVkRYNlCWk0yDbmQlCaip7St+tVZe5eby2VUTIA23e1mvOPRV2wwZrd/oEU243/aCtxF3OZdorGV5e0fdN+rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlXXGG96; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlXXGG96"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9Nmjv007016
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bS4Hzj9a+WzWFlODSnPwST6wqsP6vSjcyVbEOkJffUw=; b=UlXXGG96gfXNx9EM
	ECRqUNZt4cBBciqIzzgSltnob0dr8fjh5rT5O0FQstZv8eQ8WybpsiqHDVD75OOx
	tC8GHxKsYoe6H4y5a4KpFIW9FGj5VCPcvxWCxGUYE8Za1Fl/NS4rnH4STHnZGVvt
	FLGwDAcS/+8pChSk+VQDnGjV4QZ63p0mh7X7TZB5bj4BGFLRsOTtyFtVoIr5XfQW
	LRE3OGNLiYYRqcKCNGyUhOypXcL2eb/gdJilZHI+Wq7v/4a6FY31eEm8oKW8AA2u
	VmN5KUZDPbgKMgCiIlZPRdvBU+bPpQw9RDjvoNC29lGmEP0C+ylpgbWoAgJsztKK
	xwg53g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn68vy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:01:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-747a9ef52a4so7466242b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549690; x=1750154490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bS4Hzj9a+WzWFlODSnPwST6wqsP6vSjcyVbEOkJffUw=;
        b=ZUyTWQUgenxED2MexcXnYLwK632HLuSEeBLg/93blLnS8M6yOZqTgHEmpujJsSZU9g
         +yWJ2MVUfCfOLuwGNvg4f9u+45uGVDZHvNcMql76b3LR64O/VO6ndvIa+Zy5NKK1iMlI
         3dViRWMiIFvq4H/irvGRSIm4os0ZadQbu5o9r1Y1su2lkJIIWJeNn/0oNLMgDhVXk245
         eQtVZ7vlnI1XLSi0pNHua0774/bEl9jsrBgxNIIm26DQrKN35RTNF7lbzawbCQ8wNC/L
         PmlVQ7ggim7KtTxo++Y4Lus0LSQd6n0zxkELTISYahTQOpMzNk1iryVqaWtFOUdkpjoT
         j4yA==
X-Forwarded-Encrypted: i=1; AJvYcCVDJWq1OGnxNfWJBeDj/p4TKXHIOeWOCstq/2IH+1hmBpnzV1oStyx44b8exe6PLMrfo8KlfzjrkS0ApOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPsjWA2MYJuyZpfPWfDKzXmVeUDjQuBxNc+2f9yGCaWRb5eaVp
	9jnbdj/5Sr3EeDSyIfw8Y7osNFoBhNWlXMFhHSd7HaFnwxabhgITxKlXmnUf3obZwH0Juv2eWfp
	T0EK15ZmRyc9bohpKVFzl0MCE2hUihQ8CJhLi48+z5Oa5U5+tLuaefQgCPUTIxk8X4b3OG8wFsY
	c=
X-Gm-Gg: ASbGncuoYAQ4WdcvzVG5nQ1LMMXfmlmKnMtX6pilPuz0ehY9cuNEE6V9d+tgVjgDTn3
	apGydTAJxQ2YgDga9u4w7vyj1ZhRAr8VaRJCr79H5fDwoYWGOVasuJUoUZqTJHWMh6fVC+1Dljx
	jGinewTPwSMGpL14NIhLDw5UQlGmP9yNFS9geGd+6RyUj+ZIW4YKqcR+ytybGyqqyQmCcVMpyOS
	Ms+g6zWPDmnQkQmOSDagXHjkaQNsRnGxnQgozIkFIlRxT1Lr/CH0fxqDOw22nhsv7cTI0oTzhi+
	7WYK6dHthGM8VQidF/Bxxp4u8qvZCJhJI9U+wx2yhIY1N+SSteo=
X-Received: by 2002:a05:6a20:9150:b0:21a:c56e:3bd0 with SMTP id adf61e73a8af0-21ee696e89amr24563709637.28.1749549690554;
        Tue, 10 Jun 2025 03:01:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtdsn/9J1RkDGobV+X9NeAHlUUj40DP2x4Dyes7BuAZOzuwM4Nz/+NXqSizip31OoUxD12Fg==
X-Received: by 2002:a05:6a20:9150:b0:21a:c56e:3bd0 with SMTP id adf61e73a8af0-21ee696e89amr24563671637.28.1749549690096;
        Tue, 10 Jun 2025 03:01:30 -0700 (PDT)
Received: from [10.92.165.7] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ef88914sm6584366a12.33.2025.06.10.03.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:01:29 -0700 (PDT)
Message-ID: <819173e7-e245-4fd9-b810-1f3bd8c1a8b5@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 15:31:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] usb: dwc3: Modify role-switching QC drd usb
 controllers
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3NyBTYWx0ZWRfX/2GLPzRDLTiO
 jdPjM01kY2dRuYA03HNeuppt1v0/th35KWKyaIH9Qa1455OMhcULUK5972xHimNQOaIvAmewI5d
 PeQdIeXUwEyOc/hxY1gc1o5ZUvVL33+bzGPzXaBiEvXNqa1H9nR8BunAJFxuD3+bcR8LKtoB/fa
 t/30n0ZJZmuZMcqFNMDdGTd0/tE3TMofdleIAD0iMIAhEQM+C+3x9q2/gH5yBSePUzxbGLX3Cvk
 rHT5wK9COew6SWdp0Yvsq5lweyb7hML9RxqC8ObNK4Y3f4HmZBMYSgATTxo62ulsSKJ8NcCs6jG
 ZGqWgGqsFvXZPS3v7Eocw+DFpnVj9nRIxYcPGde7CUI0aFEhsLv6w3oM9rvl6ek3IJcCiyNmUDK
 3G1QLXMqQBabHNjmyU9O6JMWihriojLW92qMw+X3Th9E101+UojrjGj+UV8HwvR0go76pqla
X-Proofpoint-GUID: VRq2-0S6tn9cbS4TTGYueSY5Gr9rNvpk
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6848027b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=tKMUdf_y34624hTivQcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VRq2-0S6tn9cbS4TTGYueSY5Gr9rNvpk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=866 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100077



On 6/10/2025 2:43 PM, Krishna Kurapati wrote:

[...]

> 
> changes in v2:
> Rebased on top of usb-next.

One correction. The series is based on top of (acked commit):

https://lore.kernel.org/all/20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com/

Sorry for the above mistake.

Regards,
Krishna.

> Removed glue's extcon handling and made use of in-core handling.
> 
> Link to v1:
> https://lore.kernel.org/all/20231017131851.8299-1-quic_kriskura@quicinc.com/
> 
> Krishna Kurapati (4):
>    usb: dwc3: core: Introduce glue callbacks for flattened
>      implementations
>    usb: dwc3: qcom: Implement glue callbacks to facilitate runtime
>      suspend
>    usb: dwc3: qcom: Facilitate autosuspend during host mode
>    usb: dwc3: qcom: Remove extcon functionality from glue
> 
>   drivers/usb/dwc3/core.c      |   1 +
>   drivers/usb/dwc3/core.h      |  26 +++++
>   drivers/usb/dwc3/drd.c       |   1 +
>   drivers/usb/dwc3/dwc3-qcom.c | 219 +++++++++++++++++++----------------
>   drivers/usb/dwc3/gadget.c    |   1 +
>   5 files changed, 150 insertions(+), 98 deletions(-)
> 
