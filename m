Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B13025F980
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824275; cv=none; b=AkYeRiPcoT1Z1DLnTHLk9t161uQeOW/NEGNx/1ZDkkvnCmoDi6oe8FBZgmsO5vYsRdPQyYtXI6o49YtH/lgGvCEIho4WXGt1D3hpgBiFTCsTJS2TxaOo6IGoY96fhmgHlUpSNWE0ajFmTuTGOgneLS5IrX3kUhn7wRgCNvWrI3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824275; c=relaxed/simple;
	bh=iJq/LVNV6rpXxVga2DUS4f+9CrKcNp+T++0NRuH31DQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNH+3Yx39g9BZAPHCbTpxpXPMsArXe01K1XkLcZOluZlwkJFk8bU6FQybV+ZtqRuKkv8PUeftYxrkm9+F/RL4c4vp58+2CZWR0VT1rNQ1K4Z9RkfM+jbLTy29ioXJWIfHNd55CQHzdCBGeCTp3qePHVU+9F2hvGTELN9q23jg4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPGBn9/d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPGBn9/d"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XJ5J031702
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRdDXnMxczOb/t+TwIMeK6kFUpWigSK73W2qMnHFICE=; b=BPGBn9/dxcLKzsk5
	KdGFJQwBF24Pz2iveKm+wnugo9H2qOC/yQbonym12nwv4iKkjGHpGzy/NVh8fuVb
	+hyGDSkVTmpceaUBEOcqziRz9oFnekC2iuewugHLSE+PQYNmQAPIWskWzTt+4U6i
	fKfL/YsGgOWmjFr4JlPB216/7bfoaP0a1DPF1d7PinsZm+jzFZRRzhcaVOf0aKDR
	oXyxKErWcLwcohwmZLSPqysB5cddLbeshda7wVk/YUXSgvTzZZfk2JL2PbHuKvnx
	18DgD6WLvtnYCYLFUY+mfSrz/qBuV6p7fw4HUzzrF+xGRmvdQSBdthojLunu7SlF
	m98XAA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c213qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:44:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-73dcce02a5cso4270850b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 03:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747824271; x=1748429071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRdDXnMxczOb/t+TwIMeK6kFUpWigSK73W2qMnHFICE=;
        b=Vln6cbLExR5ABiyZIY44XPJek1oT3OeGCFKlEuXfc1nBrWoVApUk5n2WJi5I4eR3Hv
         GEDkjcPo7S/gcfNSv7NMLU2brHIuYPIieVh/hBgYRXms3vdN5TIKwfDLqOiUMsKYZYAq
         NJTayq7hEprbclaRVI4tp20pe3odA6FBSpUR4X/zk4x3L8M50gCwT3i/g9i7V6CtDh2V
         JIcKtQFOp8HwVsgpfCKuQurJASVwMPjezRM7YZ8O1SxoyCJYMnGnWsukq9DRIrTq9q+y
         8/oFV9sduQK8lxGX4ZDz/wFjY7MsSSFuikEtdx/HA7iaQiTI229Kvhgm2pLVWzfD93Wk
         L4qg==
X-Forwarded-Encrypted: i=1; AJvYcCUvFwT84onhFL45Dddhzn+6WKB7fT9nDd6z7BZqJhKbBKYHF01CxOYppUy0EBoFl0OZH6yM4VySm4rRKqU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6KFCuRiKFr0V6P2IwEgbnFxB/LBiHfhl0/8t99pLFpVajgs1P
	+GER/b6ZhS0lF5bcA96Eeb5nDZ16J6ZeiAjW6CdVn2K+tFErw5DyShWWPGxhCQiwOp9vtc+n8tl
	UuvWOcxbIqxjjypQeaOHtxcNewQXjg28Ohij7c/Uvk8SqFgMf58nQnONVDFwk+bUsLqM=
X-Gm-Gg: ASbGncuZr8hyyeOCuxPJiNPbQDKbPDc5ct/mz0jDapX3QiNAPCrynEwdQzpZaHbGm9m
	CeLFd7eTRHYGibPYgslLh3mCAUv6ekeT98z+picIUPRdbfRg3TENZeViOI4J/XErchGzUbshyaK
	o6zBwKs2v9ljLuR8syyghiQ1yYutmDikG/y0KO3kx+eDF5YDqN6Xy9f/UtJkF3yH37jAkxEkmFT
	wh4urTQf24+iSV/cnpXjKLeYKy4ObvIUiMwa/HQi9HxOt9qRpmmigBFXHhTno+V5BiesLlgpvyq
	c7fkzmCfohCDeAWzdEmP4pskdEWz0msMW7SxoAxyLA==
X-Received: by 2002:a05:6a00:23c8:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-742acc8da94mr26428633b3a.4.1747824271562;
        Wed, 21 May 2025 03:44:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHhpGAJJG6+/V9N7uDTJ4W9vuKvJImJrjV4G93F3t5Z8o2p5ZzaAD6O1NpT0A+p26F/FViqg==
X-Received: by 2002:a05:6a00:23c8:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-742acc8da94mr26428577b3a.4.1747824271077;
        Wed, 21 May 2025 03:44:31 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a0ca7sm9316886b3a.158.2025.05.21.03.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 03:44:30 -0700 (PDT)
Message-ID: <318cd991-4da0-4507-96fb-e9e6f2313b93@oss.qualcomm.com>
Date: Wed, 21 May 2025 16:14:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] PCI: Add support for PCIe wake interrupt
Content-Language: en-US
To: Sherry Sun <sherry.sun@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "quic_vbadigan@quicinc.com" <quic_vbadigan@quicinc.com>,
        "quic_mrana@quicinc.com" <quic_mrana@quicinc.com>,
        "cros-qcom-dts-watchers@chromium.org" <cros-qcom-dts-watchers@chromium.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20250419-wake_irq_support-v2-0-06baed9a87a1@oss.qualcomm.com>
 <20250419-wake_irq_support-v2-2-06baed9a87a1@oss.qualcomm.com>
 <a8e58612-c6f5-8b61-af35-2c2897ad7827@oss.qualcomm.com>
 <DB9PR04MB8429A141EB4E88CF53355D879290A@DB9PR04MB8429.eurprd04.prod.outlook.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <DB9PR04MB8429A141EB4E88CF53355D879290A@DB9PR04MB8429.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEwNiBTYWx0ZWRfX5/Pr5n5MU9P1
 kZwWu3f7jRQwyfLjWvhWnzH9iKuml7hdcxn6cixDGbtO77x44D51kJ7ahSFAEuv0YwOKB5T4WyJ
 Yv0NeiVKRPT5XIgpUjFEuGjGnYZCyiIt+zZQebwInQ0RwGMVC5gkEB2LNNWuT4ep7OVfuIZPk1S
 gPLQIkqtkg9guLe70ibfoOkgnagH3U3DtozO7S/6HZMB17N8bTpgPUZLikaMJVOSxxJ6wmSdtvt
 lZ1s0Z/8AcCUTAR10S4S63omirZ/pQ49JvN63XsgSc99RlTEThDTR2Z6Wm27XRngsXoynmIi9Sq
 cJtX87WW2g43gc7b74qu7aMIuYeIl5RbRJtOxwIzxdfk/GTDVKMot10PtNmRgjdBUJGNrmq4mvy
 r2FWU7hJfU6qS5FpFUDraFehAii1FfhIzOpWGqZBaD3kTiWGRerlXGI1fB5Lhojo3eTZiI+1
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682dae90 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=1XWaLZrsAAAA:8 a=COk6AnOGAAAA:8 a=cm27Pg_UAAAA:8 a=8AirrxEcAAAA:8
 a=I6U8J7tEZnt2TS94Z6MA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: Qu5hVNG5fUZmnTMq6Z4_g3kEg34JkWPY
X-Proofpoint-GUID: Qu5hVNG5fUZmnTMq6Z4_g3kEg34JkWPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210106



On 5/15/2025 11:59 AM, Sherry Sun wrote:
> 
> 
>> -----Original Message-----
>> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Sent: Friday, May 9, 2025 3:59 PM
>> To: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: linux-arm-msm@vger.kernel.org; Konrad Dybcio
>> <konradybcio@kernel.org>; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-pci@vger.kernel.org;
>> quic_vbadigan@quicinc.com; quic_mrana@quicinc.com; cros-qcom-dts-
>> watchers@chromium.org; Conor Dooley <conor+dt@kernel.org>; Rob Herring
>> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Bjorn
>> Andersson <andersson@kernel.org>
>> Subject: Re: [PATCH v2 2/2] PCI: Add support for PCIe wake interrupt
>>
>> A Gentle remainder.
>>
>> - Krishna Chaitanya.
>>
>> On 4/19/2025 11:13 AM, Krishna Chaitanya Chundru wrote:
>>> PCIe wake interrupt is needed for bringing back PCIe device state from
>>> D3cold to D0.
>>>
>>> Implement new functions, of_pci_setup_wake_irq() and
>>> of_pci_teardown_wake_irq(), to manage wake interrupts for PCI devices
>>> using the Device Tree.
>>>
>>>   From the port bus driver call these functions to enable wake support
>>> for bridges.
>>>
>>> Signed-off-by: Krishna Chaitanya Chundru
>>> <krishna.chundru@oss.qualcomm.com>
> 
> Hi Krishna,
> 
> I have tested the patch set on i.MX platforms, it works.
> you can add my Tested-by: Sherry Sun <sherry.sun@nxp.com>.
> 
> BTW, as PEWAKE is a standard feature in PCIe bus specification,
> Suppose you may need to add wake-gpios property into the common
> PCI root port dt-schema.
> 
I raised a patch for this:
https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/

- Krishna Chaitanya.
> Best Regards
> Sherry
> 
>>> ---
>>>    drivers/pci/of.c           | 60
>> ++++++++++++++++++++++++++++++++++++++++++++++
>>>    drivers/pci/pci.h          |  6 +++++
>>>    drivers/pci/pcie/portdrv.c | 12 +++++++++-
>>>    3 files changed, 77 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c index
>>>
>> ab7a8252bf4137a17971c3eb8ab70ce78ca70969..13623797c88a03dfb9d90795
>> 18d8
>>> 7a5e1e68df38 100644
>>> --- a/drivers/pci/of.c
>>> +++ b/drivers/pci/of.c
>>> @@ -7,6 +7,7 @@
>>>    #define pr_fmt(fmt)	"PCI: OF: " fmt
>>>
>>>    #include <linux/cleanup.h>
>>> +#include <linux/gpio/consumer.h>
>>>    #include <linux/irqdomain.h>
>>>    #include <linux/kernel.h>
>>>    #include <linux/pci.h>
>>> @@ -15,6 +16,7 @@
>>>    #include <linux/of_address.h>
>>>    #include <linux/of_pci.h>
>>>    #include <linux/platform_device.h>
>>> +#include <linux/pm_wakeirq.h>
>>>    #include "pci.h"
>>>
>>>    #ifdef CONFIG_PCI
>>> @@ -966,3 +968,61 @@ u32 of_pci_get_slot_power_limit(struct
>> device_node *node,
>>>    	return slot_power_limit_mw;
>>>    }
>>>    EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
>>> +
>>> +/**
>>> + * of_pci_setup_wake_irq - Set up wake interrupt for PCI device
>>> + * @pdev: The PCI device structure
>>> + *
>>> + * This function sets up the wake interrupt for a PCI device by
>>> +getting the
>>> + * corresponding GPIO pin from the device tree, and configuring it as
>>> +a
>>> + * dedicated wake interrupt.
>>> + *
>>> + * Return: 0 if the wake gpio is not available or successfully parsed
>>> +else
>>> + * errno otherwise.
>>> + */
>>> +int of_pci_setup_wake_irq(struct pci_dev *pdev) {
>>> +	struct gpio_desc *wake;
>>> +	struct device_node *dn;
>>> +	int ret, wake_irq;
>>> +
>>> +	dn = pci_device_to_OF_node(pdev);
>>> +	if (!dn)
>>> +		return 0;
>>> +
>>> +	wake = devm_fwnode_gpiod_get(&pdev->dev,
>> of_fwnode_handle(dn),
>>> +				     "wake", GPIOD_IN, NULL);
>>> +	if (IS_ERR(wake)) {
>>> +		dev_warn(&pdev->dev, "Cannot get wake GPIO\n");
>>> +		return 0;
>>> +	}
>>> +
>>> +	wake_irq = gpiod_to_irq(wake);
>>> +	device_init_wakeup(&pdev->dev, true);
>>> +
>>> +	ret = dev_pm_set_dedicated_wake_irq(&pdev->dev, wake_irq);
>>> +	if (ret < 0) {
>>> +		dev_err(&pdev->dev, "Failed to set wake IRQ: %d\n", ret);
>>> +		device_init_wakeup(&pdev->dev, false);
>>> +		return ret;
>>> +	}
>>> +	irq_set_irq_type(wake_irq, IRQ_TYPE_EDGE_FALLING);
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(of_pci_setup_wake_irq);
>>> +
>>> +/**
>>> + * of_pci_teardown_wake_irq - Teardown wake interrupt setup for PCI
>>> +device
>>> + *
>>> + * @pdev: The PCI device structure
>>> + *
>>> + * This function tears down the wake interrupt setup for a PCI
>>> +device,
>>> + * clearing the dedicated wake interrupt and disabling device wake-up.
>>> + */
>>> +void of_pci_teardown_wake_irq(struct pci_dev *pdev) {
>>> +	dev_pm_clear_wake_irq(&pdev->dev);
>>> +	device_init_wakeup(&pdev->dev, false); }
>>> +EXPORT_SYMBOL_GPL(of_pci_teardown_wake_irq);
>>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h index
>>>
>> b81e99cd4b62a3022c8b07a09f212f6888674487..b2f65289f4156fa1851c2d2f2
>> 0c4
>>> ca948f36258f 100644
>>> --- a/drivers/pci/pci.h
>>> +++ b/drivers/pci/pci.h
>>> @@ -888,6 +888,9 @@ void pci_release_of_node(struct pci_dev *dev);
>>>    void pci_set_bus_of_node(struct pci_bus *bus);
>>>    void pci_release_bus_of_node(struct pci_bus *bus);
>>>
>>> +int of_pci_setup_wake_irq(struct pci_dev *pdev); void
>>> +of_pci_teardown_wake_irq(struct pci_dev *pdev);
>>> +
>>>    int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge
>> *bridge);
>>>    bool of_pci_supply_present(struct device_node *np);
>>>
>>> @@ -931,6 +934,9 @@ static inline int devm_of_pci_bridge_init(struct
>> device *dev, struct pci_host_br
>>>    	return 0;
>>>    }
>>>
>>> +static int of_pci_setup_wake_irq(struct pci_dev *pdev) { return 0; }
>>> +static void of_pci_teardown_wake_irq(struct pci_dev *pdev) { }
>>> +
>>>    static inline bool of_pci_supply_present(struct device_node *np)
>>>    {
>>>    	return false;
>>> diff --git a/drivers/pci/pcie/portdrv.c b/drivers/pci/pcie/portdrv.c
>>> index
>>>
>> e8318fd5f6ed537a1b236a3a0f054161d5710abd..33220ecf821c348d49782855
>> eb5a
>>> a3f2fe5c335e 100644
>>> --- a/drivers/pci/pcie/portdrv.c
>>> +++ b/drivers/pci/pcie/portdrv.c
>>> @@ -694,12 +694,18 @@ static int pcie_portdrv_probe(struct pci_dev *dev,
>>>    	     (type != PCI_EXP_TYPE_RC_EC)))
>>>    		return -ENODEV;
>>>
>>> +	status = of_pci_setup_wake_irq(dev);
>>> +	if (status)
>>> +		return status;
>>> +
>>>    	if (type == PCI_EXP_TYPE_RC_EC)
>>>    		pcie_link_rcec(dev);
>>>
>>>    	status = pcie_port_device_register(dev);
>>> -	if (status)
>>> +	if (status) {
>>> +		of_pci_teardown_wake_irq(dev);
>>>    		return status;
>>> +	}
>>>
>>>    	pci_save_state(dev);
>>>
>>> @@ -732,6 +738,8 @@ static void pcie_portdrv_remove(struct pci_dev
>>> *dev)
>>>
>>>    	pcie_port_device_remove(dev);
>>>
>>> +	of_pci_teardown_wake_irq(dev);
>>> +
>>>    	pci_disable_device(dev);
>>>    }
>>>
>>> @@ -744,6 +752,8 @@ static void pcie_portdrv_shutdown(struct pci_dev
>> *dev)
>>>    	}
>>>
>>>    	pcie_port_device_remove(dev);
>>> +
>>> +	of_pci_teardown_wake_irq(dev);
>>>    }
>>>
>>>    static pci_ers_result_t pcie_portdrv_error_detected(struct pci_dev
>>> *dev,
>>>
> 
