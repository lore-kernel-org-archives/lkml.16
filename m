Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9581DDA24
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747713968; cv=none; b=n3bkxcHYYiKhI0d/kPVjjQewQWuo3jle021874aPxQbOI4wZYnxQzU3MIGSL3rqAKXz6LJ5NujarbVEF9WjLknpXxcwhcoAKC2YFWdZIqdX/Sxso9gth88tC+26Ckhrs2lBXU0c1FpCF3L8UccYelgiMVbY+73Z6se61II7qnUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747713968; c=relaxed/simple;
	bh=OjHg+Vyus8o0ZLxaz0u47ocwameFVHjmY7vBPG4yAT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zx59l5NLQuU7vOzaTd3wFYAzSmAd/nwgi0pUY3goeobnKmOq/f1rm9JYDNYhTMmhcaOKfI9cHoUFYa1Q3Iz0lydBkLJqzTEICIx50vwHU02u15SDM3dEpRhqe+qI+o1TbvTdhFgLd/H8/1aKhEsS2DWE0aTiIhqp718rxA0REqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ok2dYX/2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ok2dYX/2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JJbmqb009531
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRkL6ZD37aILbTjnj5L1nOvB0DmK7nmgx/7Bty5lsHA=; b=ok2dYX/2JfvIPoT5
	1EdJ6q1GigS8gpD+pcbPatWPkZVETqe0DYpUc8C50rI0AHNF6NWQuYu6OrO9zTF5
	sc7MlmfF9JG7cGOGVvPfyNhs07LnS3ykzrWV1YpJcyUdrpvOHdcEpWGkJQZYp8no
	5wFcgJJhoKju92/h2mCRC7a0zwME8nqH46J4mKl7Wha4CRpscBqrZNgGm+Z7vuwp
	6dDmpSaDx8aHL7ypmvUw1jY6rWMGHa6a6EqVy4bnYffiExWD3RWgVa0x0zqFYB+C
	WLUIPi54xiZlGU29YULaKW10p095pn4FoqRQpTL1otMeVPAECP3Iwls+a8MlwSQP
	5rlSmw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyphs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:06:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-231d4e36288so35741055ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747713965; x=1748318765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRkL6ZD37aILbTjnj5L1nOvB0DmK7nmgx/7Bty5lsHA=;
        b=ASlR66h/BAX91SRShbhlJF24F1kTAiBRuQUIhznmmwT+1jeEz47DheHTDu0HaWraSR
         4yoknmT7QUxfeT9MUhML1elP8EhpVqSZmAOi6aOfiznp6HsjW4s5v4LsNud/5YEiQA+B
         wMg7RCotQh0ZNMwRu9oQw+UGlkTYkH4PQhWwlh0OgWBuEEpt0GNyWcVnn3zJ9ZBZxwVM
         7Zgs0N37UpUlQ34Yjh9JbMmK5XSV4MChvBTfFSOp5vdliGk4kbGCQuhAl4lf7FScWVPw
         sr7b41ap2iF282no6ote+BRQobrpJKF5gXz56h8tlMFvFSaIyR2EpIxVrqc+Yne1S0FD
         SS+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVB8JKFFw3TNrgsC2pBKJxajOhRJwpH5oELXW0Jc4XqbGnox+P1EgA8M/ATwTDeYkFV7rMSmgF6xhJjDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4fdgg5IhJ0BxLLBAeGUFf24P74wZhr+3Zl6aY+MPrA56OUxB8
	s7sX9BtP3sNGNtZ/6Ep8r6oQRSZGYU6CJvYrGnE/1C0MVuakWa9ipFvDRARW2N2mmB9L0mqJY1r
	rRfP6xnw5X8M3Ilk7oIHFV6whMqpMKAs8WJMO4Xna87OCHo2FMUC6hMxGSdJZeg2BaPY=
X-Gm-Gg: ASbGncusEXBr7L7M9NIaOUE4QaCCselKMHrH2hpFTuVJ0BgFWL+4G5QxiOFMf2xmV8S
	Zprh0kmoTWQySLI1+KideBuKlRITSxn7vJ7ULgBqlpR0aG0jy7nPq72t6oWSnflBBI+JVpqZAZN
	ACItATEGF8qHpeA+XJa6nW2BGGRvepD6AEZi80zSQ0rxSF2eKh+QnYTdalV4p4zzgmQqxsyr9/3
	u/ikSMpR9gQ5LohN/Z1pB+zfaI6PuFAacisZ8ZJewnjut43ASr5dNHTlnptuBgigIy3CdP67ddd
	AhPCVk/ZVtK9NBGDSghUPioGvXxt6B3IM+/KnYMNOg==
X-Received: by 2002:a17:903:1987:b0:223:5e76:637a with SMTP id d9443c01a7336-231d451906dmr235890305ad.23.1747713965015;
        Mon, 19 May 2025 21:06:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCF1HMD5IOIAcLUdbyDa32PLQI1LeHPs7Pwruc6NNnS2Fm+f5VrtQdL4uL+gDaDwT1GlS9+w==
X-Received: by 2002:a17:903:1987:b0:223:5e76:637a with SMTP id d9443c01a7336-231d451906dmr235890025ad.23.1747713964612;
        Mon, 19 May 2025 21:06:04 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e98009sm67639245ad.152.2025.05.19.21.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 21:06:04 -0700 (PDT)
Message-ID: <25723231-c396-2d20-aea1-5e506b44a778@oss.qualcomm.com>
Date: Tue, 20 May 2025 09:35:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 01/11] PCI: Update current bus speed as part of
 pci_pwrctrl_notify()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
 <20250519-mhi_bw_up-v3-1-3acd4a17bbb5@oss.qualcomm.com>
 <10de35f5-bec6-5df3-768d-04f88c4e3d77@linux.intel.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <10de35f5-bec6-5df3-768d-04f88c4e3d77@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k7RYObEhKYQ0_WSpVKcP1vF1ZqwDR5f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDAzMSBTYWx0ZWRfX+2Uoa2MbLwUM
 X36Nez3Banb2wx0aTmr+pJN1dWAtmYQQatvee8k8NSnqUQgzyWQ1vJs2pw+9uDXraWyBZTUlJe0
 Id339yq9Qc92tM97ChIFM/xaOFsWxrFT/3jJLIelceuqnT36+NLyjE46V5Ug9s/A9hqlKyRWeId
 CIINRh92MfIeuxLZU/yIbSWMhzKEaVVKDQ1AhJP0xyUL4MUlteIyS8uH2XYiryMgIbHOZqtQM6B
 CGzk3muIlXKTzCgx4u0EvfcAfqgPf+Tdau4cRCoPl64leSkdh0AfyoOdWQm/JrTSO9JDPsfcmLn
 uBxBnoqpkYTz/HoCSb6zfTaCLpoCU/crypLdDUGgk1aSfuqS9IgdIcViZrXVnRaF/XnAnjiQinr
 9YvmbRJZG3EYMZMd6h3gbXCZAxYG8GVycGtZKzyOYN0+CnGvaGoEzG4p9ic4raoKVbqSxwdj
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682bffad cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=tf4daXCc1kDTc5M98m0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: k7RYObEhKYQ0_WSpVKcP1vF1ZqwDR5f6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200031



On 5/19/2025 6:39 PM, Ilpo Järvinen wrote:
> On Mon, 19 May 2025, Krishna Chaitanya Chundru wrote:
> 
>> If the link is not up till the pwrctl drivers enable power to endpoints
>> then cur_bus_speed will not be updated with correct speed.
>>
>> As part of rescan, pci_pwrctrl_notify() will be called when new devices
>> are added and as part of it update the link bus speed.
>>
>> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/pwrctrl/core.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
>> index 9cc7e2b7f2b5608ee67c838b6500b2ae4a07ad52..034f0a5d7868fe956e3fc6a9b7ed485bb69caa04 100644
>> --- a/drivers/pci/pwrctrl/core.c
>> +++ b/drivers/pci/pwrctrl/core.c
>> @@ -10,16 +10,21 @@
>>   #include <linux/pci-pwrctrl.h>
>>   #include <linux/property.h>
>>   #include <linux/slab.h>
>> +#include "../pci.h"
>>   
>>   static int pci_pwrctrl_notify(struct notifier_block *nb, unsigned long action,
>>   			      void *data)
>>   {
>>   	struct pci_pwrctrl *pwrctrl = container_of(nb, struct pci_pwrctrl, nb);
>>   	struct device *dev = data;
>> +	struct pci_bus *bus = to_pci_dev(dev)->bus;
>>   
>>   	if (dev_fwnode(dev) != dev_fwnode(pwrctrl->dev))
>>   		return NOTIFY_DONE;
>>   
>> +	if (bus->self)
>> +		pcie_update_link_speed((struct pci_bus *)bus);
> 
> Why are you casting here?? (Perhaps it's a leftover).
> 
yeah it is a leftover I will remove it in next patch.

- Krishna Chaitanya.
>> +
>>   	switch (action) {
>>   	case BUS_NOTIFY_ADD_DEVICE:
>>   		/*
>>
>>
> 
