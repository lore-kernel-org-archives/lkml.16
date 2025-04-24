Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4BE19CC3A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745471497; cv=none; b=mVgIZKVMfcSpNTIJoI3Zbg2q6kG08G2WG/Vp3wUrys+gsPeZzed5osn+19W9ge+Laa2NwSce04v22dcrbtvpGHZVkDz2Sd05q+7nBHXXT3su0zom85uh0QJX0tFunBoY5/vN+hX2qpZc25xO7mnH11/BzTqXIk3O4e+51NJMEUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745471497; c=relaxed/simple;
	bh=Ri/NiDodk6HGL3QDS5RHMwUZqLMNgjaQ59NxwIFu/gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pbe3ZT4D4LsY3vpbs7ulBf+Tn6tyZ3Us87wWIvnLXKmxmAKyJC4g54oGOZD8PcjR04Fi52k40QYM+XY3GDj9fO9EbiJbx0TS9icP8D766QF0P9RzhegLP5d0DUII6fpn3d32BRwPq4ghNtWYmwhaYcYEXptKWbW9DA6+8cUlRoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hht326GN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hht326GN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9Z5031009
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1g/H3A2mjEOxfLNFKxbSpvE+IXNCVSXHyxhD/lc8Qpo=; b=Hht326GNTGeNIhfc
	0bf6tRk7BA8fhuYrp8hqO63xWhHH3qGlL16PFWaRNiRkFlWnsuFgmMYT+DsPyKXf
	RNJ3+0GKm+plbaYw/hnAbuGA0DkDtcdWLS7PVXl2imeqlXKWz5rAl4Gh0PZeMPh8
	2AeSCzyI7O8XbOib+gLfE+NFRw02kARZEb4HGjTxj4sybrmZAo/F0iACblYP+YD1
	BacGfbstmaMabLkAJJ+uKx1NJz8PhDYyk0bSC6iAG7+nC4JG0cTJ9g7dMyv0rVBm
	p8fY3M2jWkrebL0+YqJ5+sw64ILJYq9qjF4OcwwDyOSqgYVnOmZMOShUAVNAisiS
	N5+UjA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5c901-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:11:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so587500a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745471493; x=1746076293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1g/H3A2mjEOxfLNFKxbSpvE+IXNCVSXHyxhD/lc8Qpo=;
        b=l4Lhq4vBhTuONgfdYp5TjqmVQf8ngCPVNzhwtakc8vD0T/3i9I7QcMqjdoDDoVbVHY
         o8PqrjJfJ0jXJ2MKWLhXDkiBIYxZ5jbdNbkQEIjUsj9StLU1aY31MqX976hapVhMVfa6
         jXH7XOI1UeGKKZ3672hX9U4pUghQJ2IrVj5aTBCK3Tx+O5o+u3lJpvKMFLteEHx07mfs
         kEv6ToB9cEWmD9LvkScjmbSNGHwup23bPKK5C+a4+MU9+Bscwv96r4yx+X/nCkpj6Lxm
         cCXP5F8odHlTEZEWS0vgmlJa70+KCzaDrZWEp3OXg9Iss9hc3kKyJ7aap0Jy0ffmyHMV
         odog==
X-Forwarded-Encrypted: i=1; AJvYcCV2hJ1gnKsPCY8Zo6UNzh6XH6U4s1U4R6e+d/RKATVSzAyTX47b5bWfOrVnC6mrwH32kwFAYZNCo2FQ5zU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA8YH181mdmTLvgfk1BNiZqhEnrCQVuP6bFWpJAWvC2CMqULSh
	ebK5+DrD0kgmWkpu/2a9oirVzRbrYLUs66eydDwRXJDj+JZ4SSGZjEeElQCPaeORm6eSCvjrsuU
	pTRUUFoxE7z/A9Ak8T5JRvu0ea7ZECae3DFEL6Gm1HS8T7c879c9z1r8fPpFzQ4E=
X-Gm-Gg: ASbGnctHUxcXIjdfHJLf/okJgO3KAbyWc+ET6DQ8ew0Dm6qz3o1rtW+4IGf1oFYk04k
	7f/IH9QISxhgp5HO8fvvYiTzaVTU4N1cvwS8rhJbXd54GzHV0q131dQ/kH/VzzKbelupnOWUvlL
	ZX0UJaGwnurtcxWzRcUKXllGqaxzIFWsluN3jsWIrKGq9IR6uUCYSrgiD3bVXcov81S9HmjEXrR
	oP/+PIpF3eCPlkYjpOJt8Svp+bw7rUVhRf6wOn1+wG4BSHFW3RM8w/oUafeR+pjQJFEjxc1yk2J
	xtYOLG/4pLa5sXaMLf5KQns/UPonucL9hsX5MQYp9Q==
X-Received: by 2002:a17:90b:2741:b0:301:98fc:9b51 with SMTP id 98e67ed59e1d1-309ed24bd2cmr1791974a91.5.1745471493295;
        Wed, 23 Apr 2025 22:11:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5SApp51kUWo79y5fXsGYF6r+exe1bnqAhOk9GnTlMlKAb5gSFGBzPaTpNXkU2mQHZEv7Q9g==
X-Received: by 2002:a17:90b:2741:b0:301:98fc:9b51 with SMTP id 98e67ed59e1d1-309ed24bd2cmr1791931a91.5.1745471492726;
        Wed, 23 Apr 2025 22:11:32 -0700 (PDT)
Received: from [10.92.199.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef097d56sm320932a91.29.2025.04.23.22.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 22:11:32 -0700 (PDT)
Message-ID: <31f071d7-db56-f032-749e-92bc387238b8@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 10:41:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
        Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Marc Zyngier <maz@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>, dingwei@marvell.com,
        cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
        linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <f32b2ece-f7ed-45ab-2867-9d276b88cf62@oss.qualcomm.com>
 <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAzMSBTYWx0ZWRfX4RltL5gxaTO9 ghTfUMARYXrA4pInLR5o9kSosVHTMH7V8B9iz/T71Q3kRmFFoQsUgIV2RblJG25zJBGtK827GLZ JcnC3cfaoc5OqNzPMcYNM8NeB8wzo+/Hvrb3RDoiYAazt7oXl8Lyis4X0Dplw1roOFWkjR3PuKn
 Phrj1rUxzk+qHnnlxlrxjl8xR+8vM74aylpWXpGIzRLVN18Q4hXKCwC2QQgFEMNfLEIl/4wtDSd 2Q4t/+UXreR2FS8QPBWoIAN0sOl6LxlqMp7tobspj4muMdG6srWNDPiWR8xlSlgGrA0iKhu+m6C KXBZrVNq99v+xRJ5q59Dbs1i9D0ZTJ7AkKT8gL+RuamdhaDpGP53P3oDwWSUqjGCY+IkvMYEhb+
 clVuTzorfs8eD13prfpfFaHr+CxckzZqVKfAEY18nbgpj6jwI6L2xAVht73HjOSWYbEWXbn4
X-Proofpoint-GUID: ExuD9M-ODZgK8JngkT4KgSDrPPsOFk9A
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6809c806 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=HZEN96OWHqwnsOiu:21 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=lE8Iksk3R2_BZhG9ioYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ExuD9M-ODZgK8JngkT4KgSDrPPsOFk9A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240031



On 4/24/2025 10:30 AM, Manivannan Sadhasivam wrote:
> On Fri, Apr 18, 2025 at 08:11:47AM +0530, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 4/17/2025 10:46 PM, Manivannan Sadhasivam via B4 Relay wrote:
>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>
>>> The PCIe link can go down under circumstances such as the device firmware
>>> crash, link instability, etc... When that happens, the PCIe slot needs to
>>> be reset to make it operational again. Currently, the driver is not
>>> handling the link down event, due to which the users have to restart the
>>> machine to make PCIe link operational again. So fix it by detecting the
>>> link down event and resetting the slot.
>>>
>>> Since the Qcom PCIe controllers report the link down event through the
>>> 'global' IRQ, enable the link down event by setting PARF_INT_ALL_LINK_DOWN
>>> bit in PARF_INT_ALL_MASK register.
>>>
>>> Then in the case of the event, call pci_host_handle_link_down() API
>>> in the handler to let the PCI core handle the link down condition.
>>>
>>> The API will internally call, 'pci_host_bridge::reset_slot()' callback to
>>> reset the slot in a platform specific way. So implement the callback to
>>> reset the slot by first resetting the PCIe core, followed by reinitializing
>>> the resources and then finally starting the link again.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> ---
>>>    drivers/pci/controller/dwc/Kconfig     |  1 +
>>>    drivers/pci/controller/dwc/pcie-qcom.c | 90 +++++++++++++++++++++++++++++++++-
>>>    2 files changed, 89 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
>>> index d9f0386396edf66ad0e514a0f545ed24d89fcb6c..ce04ee6fbd99cbcce5d2f3a75ebd72a17070b7b7 100644
>>> --- a/drivers/pci/controller/dwc/Kconfig
>>> +++ b/drivers/pci/controller/dwc/Kconfig
>>> @@ -296,6 +296,7 @@ config PCIE_QCOM
>>>    	select PCIE_DW_HOST
>>>    	select CRC8
>>>    	select PCIE_QCOM_COMMON
>>> +	select PCI_HOST_COMMON
>>>    	help
>>>    	  Say Y here to enable PCIe controller support on Qualcomm SoCs. The
>>>    	  PCIe controller uses the DesignWare core plus Qualcomm-specific
>>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>>> index dc98ae63362db0422384b1879a2b9a7dc564d091..6b18a2775e7fcde1d634b3f58327ecc7d028e4ec 100644
>>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>>> @@ -34,6 +34,7 @@
>>>    #include <linux/units.h>
>>>    #include "../../pci.h"
>>> +#include "../pci-host-common.h"
>>>    #include "pcie-designware.h"
>>>    #include "pcie-qcom-common.h"
>>> @@ -55,6 +56,7 @@
>>>    #define PARF_INT_ALL_STATUS			0x224
>>>    #define PARF_INT_ALL_CLEAR			0x228
>>>    #define PARF_INT_ALL_MASK			0x22c
>>> +#define PARF_STATUS				0x230
>>>    #define PARF_SID_OFFSET				0x234
>>>    #define PARF_BDF_TRANSLATE_CFG			0x24c
>>>    #define PARF_DBI_BASE_ADDR_V2			0x350
>>> @@ -130,8 +132,11 @@
>>>    /* PARF_LTSSM register fields */
>>>    #define LTSSM_EN				BIT(8)
>>> +#define SW_CLEAR_FLUSH_MODE			BIT(10)
>>> +#define FLUSH_MODE				BIT(11)
>>>    /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
>>> +#define PARF_INT_ALL_LINK_DOWN			BIT(1)
>>>    #define PARF_INT_ALL_LINK_UP			BIT(13)
>>>    #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
>>> @@ -145,6 +150,9 @@
>>>    /* PARF_BDF_TO_SID_CFG fields */
>>>    #define BDF_TO_SID_BYPASS			BIT(0)
>>> +/* PARF_STATUS fields */
>>> +#define FLUSH_COMPLETED				BIT(8)
>>> +
>>>    /* ELBI_SYS_CTRL register fields */
>>>    #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
>>> @@ -169,6 +177,7 @@
>>>    						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
>>>    #define PERST_DELAY_US				1000
>>> +#define FLUSH_TIMEOUT_US			100
>>>    #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
>>> @@ -274,11 +283,14 @@ struct qcom_pcie {
>>>    	struct icc_path *icc_cpu;
>>>    	const struct qcom_pcie_cfg *cfg;
>>>    	struct dentry *debugfs;
>>> +	int global_irq;
>>>    	bool suspended;
>>>    	bool use_pm_opp;
>>>    };
>>>    #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
>>> +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
>>> +				  struct pci_dev *pdev);
>>>    static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
>>>    {
>>> @@ -1263,6 +1275,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>>>    			goto err_assert_reset;
>>>    	}
>>> +	pp->bridge->reset_slot = qcom_pcie_reset_slot;
>>> +
>>>    	return 0;
>>>    err_assert_reset:
>>> @@ -1300,6 +1314,73 @@ static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
>>>    	.post_init	= qcom_pcie_host_post_init,
>>>    };
>>> +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
>>> +				  struct pci_dev *pdev)
>>> +{
>>> +	struct pci_bus *bus = bridge->bus;
>>> +	struct dw_pcie_rp *pp = bus->sysdata;
>>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>>> +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
>>> +	struct device *dev = pcie->pci->dev;
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	/* Wait for the pending transactions to be completed */
>>> +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
>>> +					 val & FLUSH_COMPLETED, 10,
>>> +					 FLUSH_TIMEOUT_US);
>>> +	if (ret) {
>>> +		dev_err(dev, "Flush completion failed: %d\n", ret);
>>> +		goto err_host_deinit;
>>> +	}
>>> +
>>> +	/* Clear the FLUSH_MODE to allow the core to be reset */
>>> +	val = readl(pcie->parf + PARF_LTSSM);
>>> +	val |= SW_CLEAR_FLUSH_MODE;
>>> +	writel(val, pcie->parf + PARF_LTSSM);
>>> +
>>> +	/* Wait for the FLUSH_MODE to clear */
>>> +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
>>> +					 !(val & FLUSH_MODE), 10,
>>> +					 FLUSH_TIMEOUT_US);
>>> +	if (ret) {
>>> +		dev_err(dev, "Flush mode clear failed: %d\n", ret);
>>> +		goto err_host_deinit;
>>> +	}
>>> +
>>> +	qcom_pcie_host_deinit(pp);
>>> +
>>> +	ret = qcom_pcie_host_init(pp);
>>> +	if (ret) {
>>> +		dev_err(dev, "Host init failed\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = dw_pcie_setup_rc(pp);
>>> +	if (ret)
>>> +		goto err_host_deinit;
>>> +
>>> +	/*
>>> +	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
>>> +	 * non-sticky.
>>> +	 */
>>> +	if (pcie->global_irq)
>>> +		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
>>> +			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
>> do we need to enable linkup again here, since all the devices are
>> enumerated previously, the linkup irq will do a rescan again which is
>> not needed.
> 
> Right. I was trying to keep the irq enablement on par with probe(), but LINK_UP
> is strictly not needed. I will drop it.
> 
>> Instead of linkup we update icc & opp bandwidths after
>> dw_pcie_wait_for_link() in the below.
>>
> 
> Why do we need to update ICC and OPP?
After link retrain, if the link data rate has reduced due to some
electrical issue or some other reason we may need to update the icc and
opp votings here.

- Krishna Chaitanya.
> 
> - Mani
> 
