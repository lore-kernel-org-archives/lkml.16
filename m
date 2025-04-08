Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4C21FAC48
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 05:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088826; cv=none; b=YIkoCA9bnaWqvKh8MgrfTqeyfuria+JGHj1R9j03+nTJjUwN1DsyPhqtPXbj7tYydV5ZkNLxP7O+oBEqnaPxGwMkJwfWGpd/NXOf7iuLptgvTbMk+nGbqzXzs6Z6JitVcxzRM8D/KFzsiGyEfQvjI1SIrd8mLeU0heVamrxmHak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088826; c=relaxed/simple;
	bh=yhBwHLfqizqpyzfV7mejkBNdj+OfgWkT3OTFaUEypWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfAUmheBjrXRtQcc3fpj8kFIQhR8+wlonqvx9Xym1Rroa6aXrksBcgFi9cmXiSdqUWLzwX08VVZ6QRWLupxiiHZAMEnItTPb19qa0SVjoXkW0cY+iXi9EYAtcP73FJ+bD9madDyUP7lWMHFs0dQPkimo6GZPcmkx1+XnRRJoZPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLza2bPa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLza2bPa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GSv4008168
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 05:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rzU7UwodG3qyyW6TQN+vCBbVngzgxvfapCtRJnPw7nk=; b=QLza2bPaj2nYauIK
	xv4qHMYfNockI3TQpGfo0gIadcFwzFHUeZpmvIfbPokJWTlCGKsCzG8+tQYHBVvk
	YRijof9ijgRc/H6i/zlmlRO2MDovRP3yb7vJLoB+RYlp4OG9+I+k8bwIOX2XYHBY
	NEtGc5QbAngV0CMx6N/l5QTCMc4+p9Jhl/X3W1I5c3Uq2ifEv5GHNysoLFU+hp/Y
	L0s1gRDgmampmwF3W2XjU8lLqiuLw6Lq8gE8rd1hVudCG//rCIcaV73HkAMcNVI/
	UiXRkOnwaaViE9yqukIXN3L9g8fK/PdDMXrnPNrTaN/zoFtoSsSgOS0yR1WllFXe
	rNk+Jw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtaxjwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:07:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2254e0b4b85so45157265ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 22:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088822; x=1744693622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rzU7UwodG3qyyW6TQN+vCBbVngzgxvfapCtRJnPw7nk=;
        b=C2IefS17RXzg+DmBwrhBbxpgH5rDwlgqRaBa0NcaI20H0gWm2wlFe4E6MRfI1uHQNN
         EQSkvBUqBqKaUA1NskbebK8+lq+zGZIiq56fGu2SkqX48bL/yD6DS6Vm5IIO1rTtU+xg
         vbJxocynmD0rHRlIDaTdLEntWXe6bfMAUMLQtVRrNcZEUtLF+hge8ZqcPUbw+KNacPiM
         yOQ0SOv++utKXqdl6tPwAE0v9Itxx6FaxQPFKpXvv+WJ3jbyRMuacfdNBrXOswWR1ydq
         lDD9CmFLFwpMG56dtSSQIG+F3Ca+oIZfUS+9tgKtT3g+vw2gCuouSFJkMjU2qFhVxY1o
         Rhpw==
X-Forwarded-Encrypted: i=1; AJvYcCVsVRMVyxNIiTrgKLq77lJVaT+PlaiuR/fs5849ZuGjio0IrAM8J+c//2e5AxCgzFbKPX0B4QKRlxIL1ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAnZBOtjs1VfhtUcbqXzvRjEEUCiwjg4OncWKnVb7JeYKJzkh4
	MoBffZIPFCiZpkjfthyYakvdgYDR1Cn+dtgSiEuivqnPSj+FTmaku5iIW4URPUyousIiVdll6gn
	aHlsvyUFkFHJ/Vq8ReoCKIBZaYE4jzXlAtA0VUrmjrfE2fkdtUqQntQgONQ4i3+E=
X-Gm-Gg: ASbGncum8Dv/7fUlQgQA5JxbaOiNYmxr+gNdB/8dnJ/+TnytR+uyfyp06pshpK+6P0S
	SblZAjLXfH/usz/rwWn6um8W1CbywrPInF399TR0ih2aN42gIJuMOcE1aw6PnY5dQotj9qLLJvv
	Tjbu6EQYOyFOqb8SpwyMMIQuTf2gSknX4kEjEGvekYk6a3Kmq5J/oWycgDuC6AIFV3NJyreoWE3
	pJrTRi4COL05VhoUaSksE+fkET1G7SPFgvHBg/jrLR5qcA/xC/SSwEhJuQXR7S/lAtWeApPXDx1
	Izyd7fGG3wzUkS4YHmEP4RNhPTLMnGFkYZHIqK5B
X-Received: by 2002:a17:902:ebc1:b0:21f:2e:4e4e with SMTP id d9443c01a7336-22ab5dfefe3mr29164415ad.5.1744088822432;
        Mon, 07 Apr 2025 22:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFOi+qFW074grRZM0tmColcpxEW6e8LT50yPGQePLPiAI5I4fAS+ASkr4Q4/ratkRlpN20mg==
X-Received: by 2002:a17:902:ebc1:b0:21f:2e:4e4e with SMTP id d9443c01a7336-22ab5dfefe3mr29164095ad.5.1744088822027;
        Mon, 07 Apr 2025 22:07:02 -0700 (PDT)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866cd1dsm90538615ad.159.2025.04.07.22.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 22:07:01 -0700 (PDT)
Message-ID: <4d68cb04-377f-4ebf-99c7-c63b68aebf60@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 10:36:58 +0530
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
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250408011758.qfdflgrrmahwmfqi@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: emGEeZGX_wxAiWd-HFwTW_GChQkaPtMV
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f4aef7 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HQgqQy662UQdokkEDRwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: emGEeZGX_wxAiWd-HFwTW_GChQkaPtMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_01,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080035



On 08-04-25 06:48 am, Thinh Nguyen wrote:
> On Thu, Apr 03, 2025, Prashanth K wrote:
>> Currently when the host sends GET_STATUS request for an interface,
>> we use get_status callbacks to set/clear remote wakeup capability
>> of that interface. And if get_status callback isn't present for
>> that interface, then we assume its remote wakeup capability based
>> on bmAttributes.
>>
>> Now consider a scenario, where we have a USB configuration with
>> multiple interfaces (say ECM + ADB), here ECM is remote wakeup
>> capable and as of now ADB isn't. And bmAttributes will indicate
>> the device as wakeup capable. With the current implementation,
>> when host sends GET_STATUS request for both interfaces, we will
>> set FUNC_RW_CAP for both. This results in USB3 CV Chapter 9.15
>> (Function Remote Wakeup Test) failures as host expects remote
>> wakeup from both interfaces.
>>
>> The above scenario is just an example, and the failure can be
>> observed if we use configuration with any interface except ECM.
>> Hence avoid configuring remote wakeup capability from composite
>> driver based on bmAttributes, instead use get_status callbacks
>> and let the function drivers decide this.
>>
>> Cc: stable@kernel.org
>> Fixes: 481c225c4802 ("usb: gadget: Handle function suspend feature selector")
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
>>  drivers/usb/gadget/composite.c | 12 ++++--------
>>  1 file changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
>> index 869ad99afb48..5c6da360e95b 100644
>> --- a/drivers/usb/gadget/composite.c
>> +++ b/drivers/usb/gadget/composite.c
>> @@ -2010,16 +2010,12 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
>>  			break;
>>  
>>  		if (f->get_status) {
>> -			status = f->get_status(f);
>> +			/* if D5 is not set, then device is not wakeup capable */
>> +			if (f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP)
> 
> We should allow function to execute get_status regardless of
> USB_CONFIG_ATT_WAKEUP. There are other status beside wakeup.
>
Agree with the first part, I also wanted to remove the explicit check
for USB_CONFIG_ATT_WAKEUP. But anyways kept it since only 2 bits (RW_CAP
and RW) are defined in the spec as the status of GetStatus for an Interface.

Lets do one thing, I'll rearrange it as follows

if (f->get_status) {
	status = f->get_status(f);
	
/* if D5 is not set, then device is not wakeup capable */
if (f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP)
	status &= ~(USB_INTRF_STAT_FUNC_RW_CAP | USB_INTRF_STAT_FUNC_RW);

>> +				status = f->get_status(f);
>> +
>>  			if (status < 0)
>>  				break;
>> -		} else {
>> -			/* Set D0 and D1 bits based on func wakeup capability */
>> -			if (f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP) {
>> -				status |= USB_INTRF_STAT_FUNC_RW_CAP;
> 
> 
> So right now we're not able to configure the function to enable RW
> capable? Perhaps we need to update the composite configfs for this?
> 

The removed code used to set USB_INTRF_STAT_FUNC_RW_CAP even for
interfaces which doesn't have RW capability. Its better to handle this
from function level than from composite.

Regards,
Prashanth K

