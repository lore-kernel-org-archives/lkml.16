Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214C9320F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881124; cv=none; b=JBEBlc4UvGPcQtPGpokFpUwm3O7p7+MUhddjs8fEbb4TLr3IIpd8bkdqXB1cB161n5voMw9+6ryiuW3/3YW00QPJW3KzGrPGatd3L0HpXbFsm2LIGvjRrrCV/LQe8x2RlBkpYqsCJuB/YAvntjrHha3wfEY5kpVGPRF+iGEEMBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881124; c=relaxed/simple;
	bh=S9sx4WRmlrMxC51W4pRnbf5duDxnpgl+Tq42Ma9ogH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWPbIbMrtXZHIknwWbA2g7ntjnNsaMMQRYNPnuCm5SL7rzuIPaFhHDRWbOqzI8xQm4DagYhkv20kfFE8yvVHrSeiBmsPaop1Z3JO/udoFiDrkk3OXiiRs0yYpcQ6+XsFMyRQ0dPUFucVl4h2K9s83RmFyUlPDu28LiHQjSxd9Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uv0qjN97; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uv0qjN97"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5lGQA027295
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ib44xKBj/Ro+Xh08yJf1yGF0ql4Q7w+22UKEcuxyUGk=; b=Uv0qjN97adMvtefz
	EGm8EizDkZw6NWJUroUIg6Re6QCO0cnRWiLoMQNnp0n9A7OfwDB6MlrjPUQjFVN2
	RhoKU+OiCE2gx/QGfen8TjmLgivVvd9lIgod8tXQf7735RuZ0vp/tcwdCN2Z16MO
	XYIWC2IRhfWgdM3X++Rrc4/QY7WWQQXx3MJQoTTZPLQBgI3ZGoGq9q7jOTSoRXKQ
	UZFdl6N3FCwaq9rfb6fsDD6cAhCnpLKZXf7UdPkAxitmc7Qr8jWIr0nUKRUuEfXh
	hDuEc/z7La/wDE1Lk3wNjgNLWxPQ1+fCLOrvo5gm/s8b5WM/E+GxwU8MIoKj/dJT
	M4MYCQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjej1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:12:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22c31b55ac6so10569245ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 02:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744881121; x=1745485921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ib44xKBj/Ro+Xh08yJf1yGF0ql4Q7w+22UKEcuxyUGk=;
        b=KxglcNQzwY7Sz1uL3Pu6aH4tr8MzKNHhIg8PvbrxRGr+LIyy9FKJz7oRpIyrt3IW2M
         Rny+TKgeXsz1fbanrnY8qGiScGYvNWCKVz1mqdEMjB+TRNh2LectW/r/cweiIH9SegRG
         wIluQob3DaZi/wHbNUHCuugEvRRh+4uXLXQ3PHF4Lg7AG/3+nUu9lDiknHTAw3SLH/pE
         +OIqMOdi44J2geTWXAutchAYZdki+0O5NT690CnGhNgZhHcJoY3xLkTfZEzETPy489xa
         6jZlmFFsSBi0YlTkqCHgBCDsOY7Dkgqk09UP7hFQnHyKGRrS6gHOhLEgeC7dgbaZFgRX
         XWIg==
X-Forwarded-Encrypted: i=1; AJvYcCWIt89cWJJOM/Fnm/7c8EQPcXh852NY1cBglmf1OjCW364uktI8V/e2YXpk8hbqsUCjumYtaYtvsy4vGlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeihWCpAjgrp7I/K9hUWzg4H3MOs2OjIeDuNMz8V99ex9VI2X5
	1l8ENEzWYecpld0xgAbKlxXKicv2PuTXE9Mh7IM/eND/uCUjxrmfTKdox3KYiM45kQ8FuxhJckB
	Qum4KpdFPZwmKlMVI8puu+we8DJt/FiHaRaucuCCta/0K5ER8v293EjuzoySes9fM1qO+xKU=
X-Gm-Gg: ASbGnctgTpqrKzVIxjU1P2Oaw7zgLr3Rt/dGvssOpTHlXG6gcjgw7qfXQlL2BVXtTmD
	qFwJpU5SQFjnB1wEZczLaoZx0ot0xftBak3GaSXHVlUGRRhmpxr64k4utWUd3u5TBS3rQGPVpVq
	C/E2UNQ9uJaHrBcutS7yDMhER4lNYDsN+YoH14KMSPKJQ1CvL/b/6TRJ38xTtcdIexwlT6j45H1
	tzxfswiGw9m4VthOJIitT5sMeXW4qEbajqAjRi6c+dWd/UZc72dNc1gFzucvvXsDcM1ymoCAWRh
	80cictiqck4B8bD9zu0iX/NFa3+OHcu6RoZ5iGe9ag==
X-Received: by 2002:a17:903:2f85:b0:223:6744:bfb9 with SMTP id d9443c01a7336-22c35973405mr86070355ad.41.1744881121015;
        Thu, 17 Apr 2025 02:12:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQyKNgE0DokKtvPIYouYE1uOOI7So2YqEjxzqZuyFFiQfJrMgw7yOOs6D0q9vCJ2ghjk5ZDA==
X-Received: by 2002:a17:903:2f85:b0:223:6744:bfb9 with SMTP id d9443c01a7336-22c35973405mr86070015ad.41.1744881120660;
        Thu, 17 Apr 2025 02:12:00 -0700 (PDT)
Received: from [10.92.199.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe9810sm28564065ad.249.2025.04.17.02.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 02:12:00 -0700 (PDT)
Message-ID: <2c0b0929-0610-3e99-03be-a50e9f5f323b@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 14:41:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/4] PCI: Add link down handling for host bridges
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, dingwei@marvell.com, cassel@kernel.org,
        Lukas Wunner <lukas@wunner.de>, linuxppc-dev@lists.ozlabs.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
 <20250416-pcie-reset-slot-v2-3-efe76b278c10@linaro.org>
 <26b70e1b-861f-4c94-47a7-a267c41cadbb@oss.qualcomm.com>
 <lsehjhqicvit32jcsjkfqemgypnpim6zbxwapzdrncm3hwrp44@bvwg2acyyvle>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <lsehjhqicvit32jcsjkfqemgypnpim6zbxwapzdrncm3hwrp44@bvwg2acyyvle>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=6800c5e2 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=om0y8n2fdRonrlNA1WoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Qz4efPXLkbe3JYrEUI7c5BTcC9ouXyVR
X-Proofpoint-ORIG-GUID: Qz4efPXLkbe3JYrEUI7c5BTcC9ouXyVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_02,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170071



On 4/17/2025 1:24 PM, Manivannan Sadhasivam wrote:
> On Wed, Apr 16, 2025 at 11:21:49PM +0530, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 4/16/2025 9:59 PM, Manivannan Sadhasivam via B4 Relay wrote:
>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>
>>> The PCI link, when down, needs to be recovered to bring it back. But that
>>> cannot be done in a generic way as link recovery procedure is specific to
>>> host bridges. So add a new API pci_host_handle_link_down() that could be
>>> called by the host bridge drivers when the link goes down.
>>>
>>> The API will iterate through all the slots and calls the pcie_do_recovery()
>>> function with 'pci_channel_io_frozen' as the state. This will result in the
>>> execution of the AER Fatal error handling code. Since the link down
>>> recovery is pretty much the same as AER Fatal error handling,
>>> pcie_do_recovery() helper is reused here. First the AER error_detected
>>> callback will be triggered for the bridge and the downstream devices. Then,
>>> pcie_do_slot_reset() will be called for each slots, which will reset the
>>> slots using 'reset_slot' callback to recover the link. Once that's done,
>>> resume message will be broadcasted to the bridge and the downstream devices
>>> indicating successful link recovery.
>>>
>>> In case if the AER support is not enabled in the kernel, only
>>> pci_bus_error_reset() will be called for each slots as there is no way we
>>> could inform the drivers about link recovery.
>>>
>> The PCIe endpoint drivers are registering with err_handlers and they
>> will be invoked only from pcie_do_recovery, but there are getting built
>> by default irrespective of AER is enabled or not.
>>
> 
> AER is *one* of the functionalities of an endpoint. And the endpoint could
> mostly work without AER reporting (except for AER fatal/non-fatal where recovery
> need to be performed by the host). So it wouldn't make sense to add AER
> dependency for them.
> 
>> Does it make sense to built err.c irrespective of AER is enabled or not
>> to use common logic without the need of having dependency on AER.
>>
> 
> Well, yes and no. Right now, only DPC reuses the err handlers except AER. But
> DPC driver itself is functional dependent on AER. So I don't think it is really
> required to build err.c independent of AER. But I will try to rework the code in
> the future for fixing things like 'AER' prefix added to logs and such.
>
Right now we have DPC & AER to use this pcie_do_recovery(), now we are
adding supporting for controller reported error (Link down) not sure if
there will be newer ways to report errors in future.

May be not in this series, in future better to de-couple err.c from
AER as err.c. As the sources of error reporting is not limited to AER
or DPC alone now.

>> Also since err.c is tied with AER, DPC also had a hard requirement
>> to enable AER which is not needed technically.
>>
> 
> DPC driver is functional dependent on AER.
I got a impression by seeing below statement that DPC can work
independently.
As per spec 6 sec 6.2.11.2, DPC error signaling "A DPC-capable
Downstream Port must support ERR_COR signaling, independent of whether
it supports Advanced Error Reporting (AER) or not".

In fact it can work if AER is not enabled also, but will not have full
functionality of DPC.

- Krishna Chaitanya.
> 
> - Mani
> 
