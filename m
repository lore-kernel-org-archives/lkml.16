Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1C523F43C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573393; cv=none; b=YeNXdAco5I3nYS2wNqvvWtMTxEvgALAPVwwVajn6o14G2XmB9Gh2WmMJyXIXL0rkJAeVlNUzV3QtWdKTLxs/nFrfRV+Vr7uzNg3aBCUDjcjK0IpOSf1ztkTSJ1CpJClmW5TgZl2ciKanFSmcitWDB2I3NbHjsmUV6Usog3pwlYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573393; c=relaxed/simple;
	bh=Eg50kcBcjpedW/qeykMTSlhsf+fX3Cb297JLnu6hTcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2E9HJOAffrBO8htnXHNXKD7rRx1SnHZf765h1hqq21pXhbVoKvfAdpRg3W0Z0ZDZYs2b1URvIOSMjUNfzUs/giprdy5THuCgXlGNwcA3z4Ye2gITFTJ53tOZwdMAUq5bcd8pvi7nnyRPO5fDg/4bcbccCbf5oQ1ImYacvmbPoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knpp6JMY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knpp6JMY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9O9dX011931
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YkXA3gRHKq931U+EfqfPkc+/AJrO2X04XQjf6hRpSkI=; b=knpp6JMYgB2+Q6o1
	U2Q7LmGLtmNjsfbjNyUe2tUoSHPOyfuF18rzCpgulnvzYmBMkFVPrGJ5VV5Qtx1c
	SBqseh5RJp1yaZss8LOoUsKyvP5ceXTRgXIOfaDGnzS6m6FyW5opU3fpEK5/RF4t
	F18/h4Sl6uK4P5azXSv84qVYIPVHLbeYl2oBt08xe+O+VmPiqxWPo4GTeD0AXM9P
	lC8hOIJYLsGKiB22wsOPmwIMYnakX/5Vx49Vl/3XRUt5mJmJLQCKw7dKiy4JJQEe
	m3zzfhe95HTONXVGtc8/VNrbkTFd8yVJwu9ljQwj9/Tlzm5moAdAnyemfZWUe4hW
	Y3Gy0Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpsucv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:36:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3138f5e8ff5so2086221a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749573389; x=1750178189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YkXA3gRHKq931U+EfqfPkc+/AJrO2X04XQjf6hRpSkI=;
        b=hH8GYPvIYcqYFi460rYehlESGZiHCiJ+PdAdsZ2rIMBvl5K8oYMF9oyoVlF4u7gcaf
         ntGlQ2Qj7ZtR6VooPYbxGKqLb+9Ncu4tdf/tseGCCIfyTv5WxwCe3Z6Wo84GCUU83B0K
         8le/AOcQwcmEy7PTd90yz3k0/IXRUZX7su/6EncdbtYWUz04Yw50I90eBZodZsQekcy1
         pjYiS6qUffOmcKDHBL7YfFEHViHaJd3T1mENyvLGYQMkS0PzCi0paRxj8gi0Xr+WLgoz
         oS0zXuJO1iAUtwgmCIgVCt9b/zil5wMXUkih60WIKWASf6MPzOWjyGnjREElYxPNWwFj
         N1pA==
X-Forwarded-Encrypted: i=1; AJvYcCXiSAzTB9D0B226bK6DiYw3bls9vibGYnsiMy5DOo6vD9wP4ybhfD+cu+m0qVuFcDJRMY9wLDrFHcmT4Us=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv9wz9dhEi4EjtD6/pTIwhX/+DAp2DjJ8gQtlblC53gHN/3Z3c
	RUkaXu9rs9vyUXVDCOF+ndCA46zPbiefsZi6F9vpRPs9/K4+UNzBbCRtVNW0fWtDRVU7wAP0/lY
	VI4W+3hzi7D2XRJS/OYw45kU1lYd1Q2zolnEs+AQV2BQMC1pDko+T4BQmqAgu36voHW5ZOKWIWn
	Q=
X-Gm-Gg: ASbGncvbhapnIYhVD1GdMub0Boo+vrE12rB3flFpCUkoMlsrw3CyaUQ4c/qiNse7Q2+
	Z/VZR5+P7G8FX0fIa9Va2BAiziuZidNXfV4RLg/1w4AI1r3q5783QJbClIFpUJc31hmE9iS3i7q
	YaoxFPkAGxeLL88Xkjeu/G/M4p4CUe4TYqvKFfC/iaVggojlst16wUvEItaJMQ6m7qb/1CPAkDL
	Y9gMfCqG9OHIyZsBIaPzX5yPpUEHnekaXdqionEDazWLFKP86mdlMCdTlh/S6NmpSUXC0guuA/p
	yRY3iUnL5JcLgx1CeAf8hjZmmGmPtHsA08Cto3n0mzUY9VFmZ5bdqqg=
X-Received: by 2002:a17:90b:3c0b:b0:312:ec:4128 with SMTP id 98e67ed59e1d1-313af2929dbmr224770a91.34.1749573389143;
        Tue, 10 Jun 2025 09:36:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/9pA8OhwvMFX7iIIMSv55Qde+GKXhEKCHgDisTSAvZR8mkshVPn0VA4G8ZlpuGmaaQytebw==
X-Received: by 2002:a17:90b:3c0b:b0:312:ec:4128 with SMTP id 98e67ed59e1d1-313af2929dbmr224747a91.34.1749573388573;
        Tue, 10 Jun 2025 09:36:28 -0700 (PDT)
Received: from [192.168.1.4] ([122.174.137.154])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b044d91sm7403223a91.2.2025.06.10.09.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:36:28 -0700 (PDT)
Message-ID: <aaeafb33-9897-4f47-b4f8-4b92885c3795@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 22:06:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
 <20250610105812.jepct55ic5snglno@umbar.lan>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250610105812.jepct55ic5snglno@umbar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68485f0e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=oYmrSCt18pvj5yoFrZalCQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Gsa_E7OOwjky2Y3vRcoA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEzMyBTYWx0ZWRfX7s/Ab1yRNrA6
 cCj61kthfznZZr3NwrIKIoCAemUIAsfVuT7l7IsPJ1f7BLlhRCmtp6vAw+W4w+7lHS+PaILMPA/
 YyhjAT1sJ2tONWpkZynPiohhR1IA1pRPgEPmB8/LRtpcBZHjFqIe+/SKLJLXWrdxOOHVFQX8wCm
 C8EBfkuRt+oczKMuKOTcwsPs7EuEOU3EXTI7ru9kekN6OVG5TOrgzCBwgqA3hzB6LHNrosYa9hX
 WdLxurtKLBSIdhoxbWwbuzY0XaJhLsYOWTziegu096gt/dvpfBAZay8s4nMR76eOSFuILjvYKVy
 jnStJX1GqK9hgGRIbXUXxAazAYXp5QallOar1CACl8qe6HBserUy9/jO1BlM1KNrychX345aJXP
 cSvf6UHsA7Vg6LBVMHMeO7rnu7jawv+XfSW4F228m3XA2rtEEKeICBgWSY/fQ9ETwPNvx3bK
X-Proofpoint-GUID: wjv4Fyn4jVggwKviV6R4fM_OiMa2xF3g
X-Proofpoint-ORIG-GUID: wjv4Fyn4jVggwKviV6R4fM_OiMa2xF3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100133



On 6/10/2025 4:28 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 10, 2025 at 02:43:55PM +0530, Krishna Kurapati wrote:
>> On Qualcomm DWC3 dual-role controllers, the conndone/disconnect events in
>> device mode are generated by controller when software writes to QSCRATCH
>> registers in Qualcomm Glue layer rather than the vbus line being routed to
>> dwc3 core IP for it to recognize and generate these events.
>>
>> UTMI_OTG_VBUS_VALID  bit of QSCRATCH_HS_PHY_CTRL register needs to be set
>> to generate a connection done event and to be cleared for the controller to
>> generate a disconnect event during cable removal. When the disconnect is
>> not generated upon cable removal, the "connected" flag of dwc3 is left
>> marked as "true" and it blocks suspend routines and for that to happen upon
>> cable removal, the cable disconnect notification coming in via set_role
>> call need to be provided to the Qualcomm glue layer as well.
>>
>> Currently, the way DWC3 core and Qualcomm legacy glue driver are designed,
>> there is no mechanism through which the DWC3 core can notify the Qualcomm
>> glue layer of any role changes which it receives via role switch. To
>> register these glue callbacks at probe time, for enabling core to notify
>> glue layer, the legacy Qualcomm driver has no way to find out when the
>> child driver probe was successful since it does not check for the same
>> during of_platform_populate.
>>
>> Hence implement the following glue callbacks for flattened Qualcomm glue
>> driver:
>>
>> 1. set_role: To pass role switching information from drd layer to glue.
>> This information is needed to identify NONE/DEVICE mode switch and modify
>> QSCRATCH to generate connect-done event on device mode entry and disconnect
>> event on cable removal in device mode.
>>
>> 2. run_stop: When booting up in device mode, if autouspend is enabled and
>> userspace doesn't write UDC on boot, controller enters autosuspend. After
>> this, if the userspace writes to UDC in the future, run_stop notifier is
>> required to enable UTMI_OTG_VBUS_VALID of QSCRATCH so that connect done
>> event is generated after run_stop(1) is done to finish enumeration.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 82 ++++++++++++++++++++++++++++++++----
>>   1 file changed, 73 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index ca7e1c02773a..d40b52e2ba01 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -89,6 +89,12 @@ struct dwc3_qcom {
>>   	bool			pm_suspended;
>>   	struct icc_path		*icc_path_ddr;
>>   	struct icc_path		*icc_path_apps;
>> +
>> +	/*
>> +	 * Current role changes via usb_role_switch_set_role callback protected
>> +	 * internally by mutex lock.
>> +	 */
>> +	enum usb_role		current_role;
>>   };
>>   
>>   #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
>> @@ -118,9 +124,9 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
>>   }
>>   
>>   /*
>> - * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
>> - * validate that the in-core extcon support is functional, and drop extcon
>> - * handling from the glue
>> + * TODO: Validate that the in-core extcon support is functional, and drop
>> + * extcon handling from the glue. Make in-core extcon invoke
>> + * dwc3_qcom_vbus_override_enable()
>>    */
>>   static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
>>   {
>> @@ -641,6 +647,53 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
>>   	return 0;
>>   }
>>   
>> +static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
>> +{
>> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>> +
>> +	if (qcom->current_role == next_role)
>> +		return;
>> +
>> +	if (pm_runtime_resume_and_get(qcom->dev) < 0) {
>> +		dev_dbg(qcom->dev, "Failed to resume device\n");
>> +		return;
>> +	}
>> +
>> +	if (qcom->current_role == USB_ROLE_DEVICE &&
>> +	    next_role != USB_ROLE_DEVICE)
>> +		dwc3_qcom_vbus_override_enable(qcom, false);
>> +	else if ((qcom->current_role != USB_ROLE_DEVICE) &&
>> +		 (next_role == USB_ROLE_DEVICE))
>> +		dwc3_qcom_vbus_override_enable(qcom, true);
>> +
>> +	pm_runtime_mark_last_busy(qcom->dev);
>> +	pm_runtime_put_sync(qcom->dev);
>> +
>> +	qcom->current_role = next_role;
> 
> How is it protected by the mutex? Which mutex?
> 

I see a mutex lock in usb_role_switch_set_role() that invokes set role. 
I think that should be sufficient here.

>> +}
>> +
>> +static void dwc3_qcom_run_stop_notifier(struct dwc3 *dwc, bool is_on)
>> +{
>> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>> +
>> +	/*
>> +	 * When autosuspend is enabled and controller goes to suspend
>> +	 * after removing UDC from userspace, the next UDC write needs
>> +	 * setting of QSCRATCH VBUS_VALID to "1" to generate a connect
>> +	 * done event.
>> +	 */
>> +	if (!is_on)
>> +		return;
>> +
>> +	dwc3_qcom_vbus_override_enable(qcom, is_on);
>> +	pm_runtime_mark_last_busy(qcom->dev);
>> +}
>> +
>> +struct dwc3_glue_ops dwc3_qcom_glue_ops = {
>> +	.notify_set_role	= dwc3_qcom_set_role_notifier,
>> +	.notify_run_stop	= dwc3_qcom_run_stop_notifier,
>> +};
>> +
>>   static int dwc3_qcom_probe(struct platform_device *pdev)
>>   {
>>   	struct dwc3_probe_data	probe_data = {};
>> @@ -717,6 +770,23 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   	if (ignore_pipe_clk)
>>   		dwc3_qcom_select_utmi_clk(qcom);
>>   
>> +	qcom->mode = usb_get_dr_mode(dev);
>> +
>> +	if (qcom->mode == USB_DR_MODE_HOST) {
>> +		qcom->current_role = USB_ROLE_HOST;
>> +	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>> +		qcom->current_role = USB_ROLE_DEVICE;
>> +		dwc3_qcom_vbus_override_enable(qcom, true);
>> +	} else if (qcom->mode == USB_DR_MODE_OTG) {
> 
> Just 'else', otherwise you are not going to implement the default case
> correctly (per usb-drd.yaml we should default to OTG).
> 

ACK. Will modify it in v3.

Regards,
Krishna,

>> +		if ((device_property_read_bool(dev, "usb-role-switch")) &&
>> +		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
>> +			qcom->current_role = USB_ROLE_HOST;
>> +		else
>> +			qcom->current_role = USB_ROLE_DEVICE;
>> +	}
>> +
>> +	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
>> +
>>   	qcom->dwc.dev = dev;
>>   	probe_data.dwc = &qcom->dwc;
>>   	probe_data.res = &res;
>> @@ -731,12 +801,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto remove_core;
>>   
>> -	qcom->mode = usb_get_dr_mode(dev);
>> -
>> -	/* enable vbus override for device mode */
>> -	if (qcom->mode != USB_DR_MODE_HOST)
>> -		dwc3_qcom_vbus_override_enable(qcom, true);
>> -
>>   	/* register extcon to override sw_vbus on Vbus change later */
>>   	ret = dwc3_qcom_register_extcon(qcom);
>>   	if (ret)
>> -- 
>> 2.34.1
>>
