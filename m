Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9B2200132
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265293; cv=none; b=S9bvOEDZIzlgZWO18ywBZcnLuXbUf6y8DQgI6iOv3d5+GcldDrukzA+nRCAYKYROOdsjjoKqpkgu69RgGshrYvSnf5a8xJnovr3dT13tiqYFEdNngscX36UkH4R37lUm3CuQaw0rCUl7PBYQGAL0LmzKsNB7YybKrh9U0WjdZio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265293; c=relaxed/simple;
	bh=rcFPXd+PyG2j8YKXDK5TE8WokieFvBLw4xHGkuYL270=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LlQJxvC2+jnYda5WzrRvE8vY+IgEVwkQe/x1bPOtndW1DlhczS7hU2eAzUfaLDbsypv+o9y20/LR15G4RB9cVWo7YnHT06o+hl5GpNynjE9ywlt7ZhfqFVgfzLlO1B3IgH9LmepHACJzH/LqzcH+pvpwAk7z8uyIVfJCHs1p5R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0b60taz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0b60taz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5Usrw029403
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c65/dq03YDlqT69lZS9YUG+UsJpEZoVLdFL5ZINuezA=; b=L0b60tazFeD6iY8e
	4HvYZ3rPKlDtfZ1vhQ3PjYoqb5QdO5pZl/rVYtVwLra416K1qW8T6jZErjQZ52SG
	HxjyDXf4vQnAaIab9A2ErIOtRn7AZQziogDFh4PEQypEY9YQQcey38UJyYb7gp/+
	kqRK68Ky2Z+DooRtH5dB4j1oujH8ukqQ/MviepQK4QVojRGCHYtfkpmnPzLTL+KX
	ebPtBzchQtKIUkiBIuY2PCt9iIXbSTQYSWN2wGFuu57abxSt6lujV757rK4ZnZQ9
	S8ArPYoNd9YjYA2oTaI5UwH7qZgNuEW6ua91jOedfl9fjjU6jSV6AD24uLNMvWi+
	Dj2AwQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbedvdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:08:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b00cd79a5e6so535251a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 23:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744265290; x=1744870090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c65/dq03YDlqT69lZS9YUG+UsJpEZoVLdFL5ZINuezA=;
        b=NCkZMaMpmytjK79kSHThkmVqenhcWYcKAkCOVk743qDRKfaRmlmkN9djPsM3dW+bf2
         j/YLFtTkGC2kMnnyCwZvPWiUCPhiUFkKcZkw/5BbMk5fhb5BfBRflJMKQkymxEym8eLk
         zxwxmSQjgZZHUIk6hs9wOwQNFHqFAPEcvePJzFCEGpE1tHxcNyt9/T0nEy5XLkoOJ/yT
         OHmM+3IxW8dWe6518eG/wufXEwm+iLz3g6TuDl5J8xXZv12ILC3+9uNjIIT4f+HeKjWo
         n+pFb66fCX46kr92alYTFXyOBLgBRNijZJZmXMzEwut3aMUQkVYElWPPoPjBh0dMlOAn
         Cnvw==
X-Forwarded-Encrypted: i=1; AJvYcCVaVuw1TCI9ulNag405mhXRXdZIZ9MtNsgFfreF7EfA9jawOELJcYBC8NRzj0xnYIVvaK9SAmleo0AEt+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrRBjbP4GGua+9mKKkAHL07bK9yVVNr2w3rfDnkcIBCKh1hFDs
	a7IMJXikQjyFs3MdZghTkDvcqLXI8PwnxBKbGGPlo2pVCtvXRkv0clycy9pTHcRp/7ssaNfuc5N
	PGdPpcOTGtajV0DPqMdHiNYDQ+S+pAQjnIqGGtrVCyqUhMBCHTBbUlYEEd1zgt9o=
X-Gm-Gg: ASbGncs94OeV6B0zCqg8b2rg/vU+H2mzz7wy978XsCiXuzB1R4ATS5pV26OBW0ESblG
	mAS0D0d3wIcWNCFc8VLzNhM7Iss3riQKxKiKKpdWVtri0ABOPEuSYvVRZXp60Lj/Coq+AZPXLI1
	yqUzoab8jeq4a1dVfUNVHvf+byT98GVouuMfpbeOfZSItnq35/+WhMHgst8XLuzzMjw05rI+kz/
	iwDuITlie1cn8PAPfb2vbbRYHEuISMRqDtcHAes+Kw/bsGKmOecA7nCZNasMlCqVeKs/A8G2UEI
	e55fdG3NsTgQulE/VkVF6zTgkhAjoPFVgZxZ
X-Received: by 2002:a05:6a20:6f06:b0:1f5:8b9b:ab54 with SMTP id adf61e73a8af0-201694cb037mr2907498637.23.1744265290184;
        Wed, 09 Apr 2025 23:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8MricBGPJy7z5KTQxmuVxXADC6pI74ej+8CixhRowybv6WzBxlmKULawmIeaSnOpfeJ/ubQ==
X-Received: by 2002:a05:6a20:6f06:b0:1f5:8b9b:ab54 with SMTP id adf61e73a8af0-201694cb037mr2907470637.23.1744265289757;
        Wed, 09 Apr 2025 23:08:09 -0700 (PDT)
Received: from [192.168.29.15] ([49.37.108.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e6972fsm2488523b3a.171.2025.04.09.23.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 23:08:09 -0700 (PDT)
Message-ID: <2cc61d5d-656b-49d6-9d09-98c4368b1fc8@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 11:38:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] usb: gadget: Use get_status callback to set remote
 wakeup capability
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-3-prashanth.k@oss.qualcomm.com>
 <20250408011758.qfdflgrrmahwmfqi@synopsys.com>
 <4d68cb04-377f-4ebf-99c7-c63b68aebf60@oss.qualcomm.com>
 <20250409005524.fbehw2gonv3p7j2v@synopsys.com>
 <a4cc6d1b-4925-4b57-ae23-fc1e23c5efde@oss.qualcomm.com>
 <20250409220510.eynefm7fesydagpz@synopsys.com>
 <20250409221158.n5duanv2gmctrr64@synopsys.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250409221158.n5duanv2gmctrr64@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L_ugItQEPDDaoIKXinaWPawgWtyw6jRK
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f7604b cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=cNzNqdwVgqoaoh8yHwe9gA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=JHkCR1Z1QDo9LWSbiEIA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: L_ugItQEPDDaoIKXinaWPawgWtyw6jRK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=881 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100044



On 10-04-25 03:42 am, Thinh Nguyen wrote:
> On Wed, Apr 09, 2025, Thinh Nguyen wrote:
>> On Wed, Apr 09, 2025, Prashanth K wrote:
>>>
>>>
>>> On 09-04-25 06:25 am, Thinh Nguyen wrote:
>>>>
>>>> Not at the gadget level, I mean to create a configfs attribute common
>>>> across different functions to allow the user to enable/disable the
>>>> function wakeup capability via the configfs when you setup the function.
>>>>
>>>> What do you think?
>>>>
>>>> Thanks,
>>>> Thinh
>>>
>>> Thats a good idea, in fact I had the same thought. But thought of doing
>>> it later since its beyond the scope of this patch/series.
>>
>> The way you have it done now forces a usb3x function driver to implement
>> f->get_status to be able to respond with function wakeup capable.
>> Previously, we automatically enable function wakeup capability for all
>> functions if the USB_CONFIG_ATT_WAKEUP is set.

Currently function wakeup is implemented only on f_ecm and others don't
have the capability, so the expectation is functions should add add the
get_status callbacks while implementing remote/func wakeup and mark
itself and RW/FW capable. And if get_status callback is not there, then
func is not FW capable.

Current implementation sets RW/FW capability to all interfaces if
USB_CONFIG_ATT_WAKEUP is set (which is not right). I have provided an
example in the commit text where we incorrectly set FW capability.
>>
>> Arguably, this can cause a regression for remote capable devices to
>> operate in usb3 speeds.
> 
> Sorry typos: I mean arguably, this can cause a regression for remote
> wake capable devices to perform remote wakeup in usb3 speed.
> 
> BR,
> Thinh
> 
>>
>>>
>>> We can add a configfs attribute to enable/disable FUNC_RW_CAP, and
>>> functions can return get_status() based on the attribute.
>>>
>>
>> That would be great! This would fit this series perfectly. Let me know
>> if there's an issue.
>>
I seriously think we can take it out of this series and do that
separately. The intention of this series was to fix the wakeup
operations. And enable/disable func_wakeup from function driver would be
a new implementation. Ill take it up after this.

Regards,
Prashanth K

