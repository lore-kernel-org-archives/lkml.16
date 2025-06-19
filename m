Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F293D13B58B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 15:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346166; cv=none; b=hWtnge1ZJiTHMOIdqiqueJ+qSZEFf0AGHwH8M+c43/x29Ag2NRHhAaQX9wUz1YuCeCeYv0U7GF6p17ezl/ZyawiNigUctkD8I4aZU9Pim2qU2IVfNDIdJSjcj5nkUcLun6hMHcGrx6iF5k9fMpKNKwyTWgWlu9MVLbdP+ypm9tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346166; c=relaxed/simple;
	bh=hHbrgbeVpKHlN1WSxEnkfCzYAmnqqiwL3EFdnvUWEZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOjZYBRK+5vvVcb3JIIsPn9BdeioIfjzhN75QmoUVDWNaMcTngvsmsVG80XLju2aClmDKk7Ey6EgAa0CpSDUNeMi/altBoxbKe1qvvKDY/AuI5WqfV5i5+9btZdbSajBVb9sEIKJCLKmHVLmL0JNLSIEnzRKGu83n+0J41iZeNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IjdoxiO3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IjdoxiO3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEdX8t016417
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 15:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZePDO/8sG0YdU3YHcFxnAOlHbTMITMJ/juxHwf5oqs=; b=IjdoxiO3Sdncsz3Z
	3a7hbS5ySM5j8pHpzwCcWiiJqnCwV2OlenCeS/Ixjvjk0IBAhESqWNVKRzlQTCyo
	DuXLT/ZIoayx4YF1/LFjqc4v8q8YzZuKSBEJkB6UP6nAKyS6TMd5mwzCisDyVpJB
	wv3nS1KtBfUZ/UwBW/JRzfirlX3CYCBwBskwXDy7B5EYmuX4k3YuZNXK8EzRcdQR
	VbPWpmM1HuLahoOkBrLURlFq6+8VbXaDuCRjjj8iYT0Q+A75ETkRATho33Y+ciD8
	dfrTaC48GkdRoufenasDcmU1xkUo9Hrn95L3aLVQJ2LVGbLqiwCNUkCNX0QtmW/f
	pBidMg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f7gcgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 15:16:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so584987a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750346162; x=1750950962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZePDO/8sG0YdU3YHcFxnAOlHbTMITMJ/juxHwf5oqs=;
        b=K7Ite2b0lM0aUY+rasH5vmYc3h72S8JaU9w9mu/Btx+cfC7xK9x2rSk5ueJ4tGR7+j
         njcwEuIINWiU5eoWhGSO101YWgSWi6QHrqyyHPnxrjwv9+TH0EEyZiXmSFUB6gBJm3yy
         Gf1KGK60uvu04+JZ/kOh0dB+66AZULbznJAQMGeBF6Xf2M+DRW+t5kKJN8CXqkikRhW8
         w19OMILfvNynGGj4ZXRU2Hwl9r8eZBKgah9q0x7G1MA3bmiE13bFm+0KXw64W1YrJ67I
         T0DiUA4Z6zFt9+OzO1C72V0FWbDLE1hf0JqBi6pddAQd6vrjymZ0vqgMRhGMxqKtB6u9
         lSfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdiBsY9Wm1lVtl4QEcvmQ4prG+fKU0sL/gzc/qh4el9QvwUr+LOYxQ0ZLSWus5WtSV6IlTDJLBSR7T3Uk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/N1oQ+Bbqgol/UuQTEKeuR+gFXZppo3d+DPRlaDK8opTo1X/J
	WmOWebojLU4WVL1kvCVsxVdheGmbZNuC0X8MyNE9Gs0MskaHbVu9Pa0AR7JBOCWJrafohHfodlS
	BPfCS6vkI6A2mIUeHuOxTk/+LGLsiNRZS07ZB0lyCal2GDZxG06K8gFfdFIWQRIMiuY1cTP33FO
	U=
X-Gm-Gg: ASbGncsiHPRhbsnoankBdER02Vc0ydXjQ+dfHYDGq4idv73JlszsWlWj55MHYV81ouO
	wYtahzl+YxgnohxCbJ/Oi1y41MDn446O9tcyjFbi/426wElYVs0c5oTeBOWwHj/XtN9sk/SRQR+
	okG5p1zqnZ1/fOjK2JMMm3NOMJvc0CCvZ0uXnO5GZKZxOnHOxsbmYB50m1SxSrwy0wdh9i2eh+y
	JPNGeC5z+H6i8qe4+MeyFwep18qPnJXWTYNqcOVmIA0Y63BJsBEpTUkdDLqOUpA7lPw5KBxaiNo
	PB37m5ZeqvuDXmTGGDT3n3F95MIpFmpoRg3OsUPCzAQpdaQrtQtEUCWgGLLnFz6YleTz8fo=
X-Received: by 2002:a05:6a20:1a87:b0:220:96:11f6 with SMTP id adf61e73a8af0-2200096124amr9755112637.37.1750346161971;
        Thu, 19 Jun 2025 08:16:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq9RjBSQThQ08iVcBCPQDNPqsFAVA47zGCGsJ+0Gyl2tT/bxkUTY09tXQ+bAqgPKlf6W6XlA==
X-Received: by 2002:a05:6a20:1a87:b0:220:96:11f6 with SMTP id adf61e73a8af0-2200096124amr9755075637.37.1750346161503;
        Thu, 19 Jun 2025 08:16:01 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.222.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a626376sm104476b3a.85.2025.06.19.08.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:16:01 -0700 (PDT)
Message-ID: <a7626e7b-6308-c4d0-8d0a-0d80914841a0@oss.qualcomm.com>
Date: Thu, 19 Jun 2025 20:45:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2] wifi: ath12k: handle regulatory hints during
 mac registration
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250617-handle_user_regd_update_hints_during_insmod-v2-1-10a6a48efe81@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250617-handle_user_regd_update_hints_during_insmod-v2-1-10a6a48efe81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyNiBTYWx0ZWRfX4kUm536fO7d8
 yzB/3fJEAM01BOO36CmE6P7INehtsGg1ExJq6OxShwtkDBgoQpumuKgwpXrlqJDFeeHVONaFgZO
 bHxC93Syj0SPGkCOqsNkTfrnQwxW3W5j9mserj4z2T0/fYc0f6SzzPTI0zf844FyGEh/vjXXLkk
 Kk5lTiWrO/N0D4bHcRsXNZjm8/xkuK1ElLw7HpMurZCnM4LOWsSaFy9louD2TQD0SE33Z0QM8jS
 +q3aTRl81dVjT3hAlrXmXqXj7VCcGG+GSAT1CKYEdxclFWvzs8EvJgHJJ3fdJA4uNg1qVYAdpB/
 xvQPSPK+HCjH8a9g2vtwFnRriQcm5gqiFZF04XMyIXNkZlXv4KpNtFSakPps8vEMAM3x5fzGnRF
 BYASdmZPEtiCNCsD+nZjAjXDrR5PyrxjtNvr3mYuH8s4PdWdMfZS+vZ3WiFdMA/pP/hvJ+n9
X-Proofpoint-GUID: vqtJog3SDOujhGKg7ElEqrjDpDmlKhRs
X-Proofpoint-ORIG-GUID: vqtJog3SDOujhGKg7ElEqrjDpDmlKhRs
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=685429b3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=W/7+BeFhbfycsskxpRlngg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=oTJZ3fvRTWoEDzZ0YNoA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190126



On 6/17/2025 9:05 AM, Aditya Kumar Singh wrote:
> If a regulatory notification is there in the system while the hardware is
> being registered, it attempts to set the new regulatory country. However,
> ath12k currently boots with a default country derived from the BDF. If this
> default country differs from the one provided in the notification, a race
> condition can occur while updating the regulatory information back to
> userspace. This potentially leads to driver having the incorrect regulatory
> applied.
> 
> For example, suppose the regulatory domain for France (FR) is already
> applied, and then the driver is loaded with a BDF that has the United
> States (US) country programmed. When the driver finishes loading, the
> regulatory domain shown in phyX still reflects the US regulatory settings.
> This is incorrect, as the driver had already received a notification for
> FR during hardware registration, but failed to process it properly due to
> the race condition.
> 
> The race condition exists during driver initialization and hardware
> registration:
> - On driver load, the firmware sends BDF-based country regulatory rules,
>    which are stored in default_regd via ath12k_reg_handle_chan_list().
> 
> - During hardware registration, a regulatory notification is triggered
>    through:
>      ath12k_mac_hw_register()
>        -> ieee80211_register_hw()
>          -> wiphy_register()
>            -> wiphy_regulatory_register()
>              -> reg_call_notifier()
> 
>    This sends a country code to the firmware, which responds with updated
>    regulatory rules.
> 
> - After registration, ath12k_mac_hw_register() calls ath12k_regd_update(),
>    which copies default_regd and passes it to the upper layers.
> 
> The race occurs between the firmware's response and the execution of
> ath12k_regd_update(). If the firmware's new rules are processed before the
> update call, the correct values are used. Otherwise, outdated boot-time
> country settings are exposed to userspace.
> 
> To resolve this issue, introduce a completion mechanism within the hardware
> group (ah). Trigger this completion whenever a regulatory change is
> requested from the firmware. Then, in ath12k_regd_update(), wait for the
> firmware to complete its regulatory processing before proceeding with the
> update.
> 
> This ensures that during driver load, the default country is processed
> first. However, before ath12k_regd_update() is called, the new regulatory
> notification will have already been received by the driver. As a result, it
> will wait for the firmware's regulatory processing to complete, and only
> the final, correct regulatory domain will be updated to userspace.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
