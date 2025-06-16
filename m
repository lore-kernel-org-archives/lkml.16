Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F079127605A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080892; cv=none; b=CkcgPmzWqBZ4ejMacyggub6bvcTXXUP/cvEcGVR/Fdh6KcIHL8hdEhRzX8PE2lxpyWafs6RDyuLjpJ6u/gLZyW4AygfnID232dLnViv/abS/gXeHS2SwooH8VkIuMLbGm667hPD3GCVhxskhXBCe5hNfPZ0aCvq9PvvgxwtMRIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080892; c=relaxed/simple;
	bh=FMoAq8disiNRxpyZoPEjdZRccpHqtD+dH+rBSz6PpDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1FWHTJFzlAiuoawfW4JW824A7funrKu/fUeUqjOYVuypZm8JBTl0adq//jaimHP7vdFQOo2QOb29+2Ou3spnUVz3yCqwl4K1ddc/nDYY39RVe7u1jpwoyssxDujzHu/paJAUOlFyvheNeAtP3TfxX5QjBlt8/f25n1/uIO5io8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyEGxcsI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyEGxcsI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8l6pM015579
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hV7aIlrhOYnPhaE5YGpfNg5HcLb1KNXsaP+VsHA7MAI=; b=WyEGxcsITlhYNjOc
	dq/yFfLO8UUwNsGXQF/lXCixUt7nrQQYAUihqVOX4nfcpXRfudiBAqlVcCskm2ZL
	hsp1o6KqMCLDyyvyRLmP3w7ZQxKWmwiM3pg/ndRF9446nYcYs0WzsWG9sVJF639X
	QylbWL4fUHrhsqhWRxXIdloPvCTdqBj5IraI6k2I0NsRQ1d8yQIQGFWBpZTA/Q62
	LMPCmPbiQpnwL8Gslxg20JF3sK1Mlb92OJUq4ZlJLpQ7NO0ybZJIIOtRCg5+pkuI
	OPIcm1lwfAUveLhHr5X9ImSIjzhZo1sUFQCxdQOtUFx8YR3zbGgqwcost8RbeH+Y
	laHA5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcvnn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:34:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38fe2eff2so776139685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080888; x=1750685688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hV7aIlrhOYnPhaE5YGpfNg5HcLb1KNXsaP+VsHA7MAI=;
        b=nFc69oPfdZHxv/3FyRwbzw04fOll+oXNNeeqXDu2Ly9PlKcE4w09t1M1pf6All6gEE
         XQKC6fRB/br6iMgSUsrIwnGBrBUrfEGc4oiowkv4IPTsjijL7lhCLIOlQtplugK57xvE
         qltn/qb4mHkFxryXBTAtc4If950Y3QdzFT0OwloG0NTcNltslvCDIZQb3dn4stG13cMS
         gZ4R1sXRtUx+1AK3P0h9tdIg7m48UfYYeIMhQ0yhVAEtXAHhgPZd5apDCUp0QRQKl8uF
         QsGr6DiQXDy81Jwp6BMfKGjlGe9zjHbIaij+JUigCPJSC+QcTFA4OCQSIWuvLYHPV65c
         nYqw==
X-Forwarded-Encrypted: i=1; AJvYcCXMkbNUuW1NT94JDpzWbfI4xYHPtePQIIVnpxgF2LSBpM4egCqMa9WzefA3n8/ToSmphnEiTQJseTUhO1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YydXIyldPbHf/FrJfHLFIFjC93cVcFYOON9H2REc7Zjj2aze7Pb
	n5jfPz9JWpO4fp1uge1aLT2cJqhtMoXbOXmDXzkt6slWQsdE4LfSn29R+Sh+rjHHRMXMZKz0Cyz
	11p+7OcCk6piX7rA0tADE30QMfxhUtspSNMe5vGmzjVJfEFM2/v7LQQz4ssxsXR/nqSA=
X-Gm-Gg: ASbGncssFp07I0vC9IOLj5hyXiNsYwaxSa9vdW5xqhrMdz14jbMt33SZyV6HuAJM1Yv
	/d5fGFIGfqqhOZ39XuOtMEMFq8dOOJ81VOWir78vUQhWOHgndB2UZWD9rI9FaMoKRzm2PV8tm/X
	0VtYey4yuwPHbPgnnMbBY6FCQpxkFnw2W5rjJ3NIldRs6KJXmLsgqaoCPouqh/L/kQ9lnkKgVy4
	hgykLK4XTvvYuRFf4gZIoQY24WHbgEXA5QFfRk7WKiizZ0AGYp13z57fCOMC3Hp4IUoc115RrJp
	dsKkHGrEZXm7owUmygU5dJLR9XTY3JOUYRoCg1wXbMPeddnJd+8C62pbb+zKik/9Bv9Sci4pzKH
	SMSuQq54Ab+oQs607VKEymjADFaXJWdelN8txRuQ9dwgBcSFV6lZNTkapWXDSWGbZ09ESD2vRRp
	8=
X-Received: by 2002:a05:620a:3199:b0:7c7:a602:66ee with SMTP id af79cd13be357-7d3c6c0844dmr1350302385a.10.1750080888649;
        Mon, 16 Jun 2025 06:34:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLTCIUcu5DAwal2m5FNrqtOq8DGSlR71nrO7McbfLy27qVYIS0Mcuos0H6+koDugco0fRfIg==
X-Received: by 2002:a05:620a:3199:b0:7c7:a602:66ee with SMTP id af79cd13be357-7d3c6c0844dmr1350296785a.10.1750080888132;
        Mon, 16 Jun 2025 06:34:48 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a4:c3fb:c59f:e024:c669:a69b? (2001-14bb-a4-c3fb-c59f-e024-c669-a69b.rev.dnainternet.fi. [2001:14bb:a4:c3fb:c59f:e024:c669:a69b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b331ce2dfsm15414821fa.105.2025.06.16.06.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:34:47 -0700 (PDT)
Message-ID: <34cb0398-a986-48e3-a15b-7bfda6081e21@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 16:34:45 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] USB Type-C mode selection
To: Andrei Kuchynski <akuchynski@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Pooja Katiyar
 <pooja.katiyar@intel.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4NCBTYWx0ZWRfX0lr/h9HVkKxY
 IYT/a1ToTutNL/kswV823dtH7LUJfaK1zKjse8X+DfE0DzgOnj8NeNQ05T50boAgdaEE6UFrlDv
 VwskcxfE6yQbNwja+h8SOSbxsNuRT30FGNNXTNDCcNOJEr7e9imNUFXXgY4/K6kJIRoWX+EzMCR
 Rkf3C6l7YawNUO0/h3XUCJlV4z/cXczSNpUXdxAOLYyMuafIMIOt4p1HpQcXdFLycdjMWHgNsK4
 dJhBcAN7+DYphrRP68bO4s3DFWnkYcv1DaffIYrBYUcx/DWj01H2nWvyjpC6fy087gV8+5OdfTx
 ncW4BYnsm9xfN2L4qUjMHgKiFVq8lu0rPxtWelPURn/fIGAx5L9uy0fR8y4MdYXLIuB0iIKTRP+
 GzabbsQpk2aWwS6pNvMU22DM/ZX6zFT7NqxKkJbgGAjLwYMkjDPPA4On3PmvkxtpIh6Hg5K2
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=68501d7a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=JmsPOU3ckOcHMdB6JcMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: XQ_j81pdQHdiorJOOuc1RCuWAKNbGtUw
X-Proofpoint-GUID: XQ_j81pdQHdiorJOOuc1RCuWAKNbGtUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160084

On 16/06/2025 16:31, Andrei Kuchynski wrote:
> This patch series introduces a flexible mechanism for USB Type-C mode
> selection, enabling into USB4 mode, Thunderbolt alternate mode, or
> DisplayPort alternate mode.
> Two new sysfs attributes are exposed to provide user control over mode
> selection:
> `altmode_priorities`: Allows users to define their preferred order for
> attempting mode entry.
> `mode_selection`: Initiates an automatic mode entry process based on the
> configured priorities and reports the outcome.
> The mode selection logic attempts to enter prioritized modes sequentially.
> A mode is considered successfully negotiated only when its alternate mode
> driver explicitly reports a positive status. Alternate mode drivers are
> required to report their mode entry status (either successful or failed).
> If an alt-mode driver does not report its status within a defined timeout
> period, the system automatically proceeds to attempt entry into the next
> preferred mode.
> 
> This series was tested on a ChromeOS Brya device running kernel 6.6, and on
> an Android OS device with kernel 6.12.

Both kernels are terribly old. Please run the tests on top of linux-next 
or usb-next.

> 
> Andrei Kuchynski (10):
>    usb: typec: Add alt_mode_override field to port property
>    platform/chrome: cros_ec_typec: Set alt_mode_override flag
>    usb: typec: ucsi: Set alt_mode_override flag
>    usb: typec: Expose alternate mode priorities via sysfs
>    usb: typec: Implement automated alternate mode selection
>    Revert "usb: typec: displayport: Receive DP Status Update NAK request
>      exit dp altmode"
>    usb: typec: Report altmode entry status via callback
>    usb: typec: ucsi: displayport: Propagate DP altmode entry result
>    platform/chrome: cros_ec_typec: Propagate altmode entry result
>    platform/chrome: cros_ec_typec: Report USB4 mode entry status via
>      callback
> 
>   Documentation/ABI/testing/sysfs-class-typec  |  34 ++
>   drivers/platform/chrome/cros_ec_typec.c      |  11 +
>   drivers/platform/chrome/cros_typec_altmode.c |  32 +-
>   drivers/platform/chrome/cros_typec_altmode.h |   6 +
>   drivers/usb/typec/Makefile                   |   2 +-
>   drivers/usb/typec/altmodes/displayport.c     |  17 +-
>   drivers/usb/typec/altmodes/thunderbolt.c     |   6 +
>   drivers/usb/typec/class.c                    |  95 +++-
>   drivers/usb/typec/class.h                    |  16 +
>   drivers/usb/typec/mode_selection.c           | 505 +++++++++++++++++++
>   drivers/usb/typec/mode_selection.h           |  42 ++
>   drivers/usb/typec/ucsi/displayport.c         |   4 +-
>   drivers/usb/typec/ucsi/ucsi.c                |   2 +
>   include/linux/usb/pd_vdo.h                   |   2 +
>   include/linux/usb/typec.h                    |   1 +
>   include/linux/usb/typec_altmode.h            |  12 +
>   include/linux/usb/typec_dp.h                 |   2 +
>   include/linux/usb/typec_tbt.h                |   3 +
>   18 files changed, 775 insertions(+), 17 deletions(-)
>   create mode 100644 drivers/usb/typec/mode_selection.c
>   create mode 100644 drivers/usb/typec/mode_selection.h
> 


-- 
With best wishes
Dmitry
