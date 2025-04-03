Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBF924C08D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688176; cv=none; b=IVdM0vspcxGrsL/bEjrMOD9wh9pTv2lVEdLQQwL4OsKWxwXS6AMYj9n4tKXlkTcyUsgzMweGOlvOT5r6Po4WbUbmLn3HWxrYI3EdE0HqbhdSed0NC8remVqD1UP8iJmwukU8GbymSn1Hr1gcIUF+40y9OYfzuj+Q8VCBDg9RrZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688176; c=relaxed/simple;
	bh=dmBi8Z4Puvc/iWOE8+hwaz+c4m0DMk7B1xt1gvWi3uY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZIXGjzLCjS/JQ3q/H7Lrp0Op0fRYolWK8H9QCWtuQSQeR+IPOYoXVJjUggc8viRehz+iitIuq5eVXw9HcNA0guAKVctFj0blAUIEvpFMSULhPiqSZaVJUx75uvYr1+ehkI6HU9FmlncNQqpSzZx4y6tzkrhMxB40kA1BuWpu8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=THOWBo1P; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="THOWBo1P"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso5197885e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743688172; x=1744292972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Lbun0GNki6Idmi3A3g8x7YFlOE4BIKGs03UY95gVCA=;
        b=THOWBo1PhH/DolX4Sut/QzyvEmLXXvoj+SKwyUwHJ3CQyVus9J8UgUBAK05jUUPUvX
         hrPDREEWbVCJa1R4E66S6h89dd87+QWaJ1aUzoeZIkxGQDt8t6eH3PT7QeEpjOydFNDz
         qIizmvuw0PvIm2g25Xyu90CdJVx2aNA9fwuwRGYVEtXjyU2cjrMtPLJY/Pb71OusI/LL
         zWswUO0jQCw/ur/gTKm/hFwLS5OQK5IBYF+nSSXjByb4npZceXtKfA716T27DU3bP+aF
         6KIm2tkTQ8L9bdjf04OppkFyrHNbkUxX3TSZghTClsMF4UZH3QL2gxoiPOAG5ilkefJe
         ZYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743688172; x=1744292972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lbun0GNki6Idmi3A3g8x7YFlOE4BIKGs03UY95gVCA=;
        b=BpFjcZSOOY5jLPWuGnEuyGKIo+hqM3GtJXvuxDhIinxbnjTVDYufe+m50mhMh5UPNx
         1joU1qosYp/TOa0iytsIWSkV6CkAQmT2sUL4vfGs8JbNJQIW5v7ufmIsvrBcDqInFPeY
         hZP8ID3VraBrVFgtyiQxWJG7TtneJlL2CMomWr84ukju9NG42bcE4Dlkx1jbPCx1Gc6t
         2YtM9iq/t1NcFCtzqNgnfvGRC9G1yeSc6Q9qLrmSs/bd7l5gBky6pJJXFj+BtJkBKVyA
         OHfhPKvPs015/8o6YkCtSMi+bNxhB5Jcp/j7j/N3TFyslO5onq/ldmw8qSubhkAgGYmP
         mrhg==
X-Forwarded-Encrypted: i=1; AJvYcCUlXyPqh6p0MmW/LFsV0r4tormaaldbFnRjxbYGeB04HKigMOxW6xU12LwTdp7A/nCEDntS+zSKJwEDNfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXLTVk8hxlP+Pl8sp1+oqX9Ex3ozrkHTQk1Z6W8AjDL6jGCDBF
	5JHkuU141SMTLT2EABrRsipS0RZ6uXmX9Q4X9CRgpiL95vDt9Dnx9EIXeYgbGsA=
X-Gm-Gg: ASbGncvi32/1fo6UnZmfSRBBnwjOgSBkJKYyu/1G8pychg0VaoJT1IUiYbXfk5nWWfX
	cxU55FGlhww0tiDle6LDDNIm9MXy3Wj4rhlhz3B2FH+d/OCc11k5+VtptFU655NirYD4lmBv1Sa
	PpdTvAjlCrfUkQgO44QTy3eP71tRUDrtoSXc8FYIksRLt9CuMfOtZo4dpwqsIC0yxP6G0BGEebD
	1V83O9OR3Ot4YUU1WcgOcnrHalZO2dlDkcHTTojkpPnCKhu8u+7Rr8OuZYpOhYxxeViGLJ8R2lt
	GFPK5M9ai+DvzR7mtewa3naP28C+L9fMLR6Pq7tad8EKU4b+6f53ZY/pn/+6UQ5aD+tK1Lj5FA=
	=
X-Google-Smtp-Source: AGHT+IE9rPmpD+lql1OOhXGIwaIr3nFGx77QjAL7GITh3M6FkiFPLNOqADUYHdezax8BrNQwiF0+bA==
X-Received: by 2002:a05:600c:4589:b0:43d:300f:fa51 with SMTP id 5b1f17b1804b1-43eb5c187e8mr59872065e9.9.1743688172289;
        Thu, 03 Apr 2025 06:49:32 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec1692ba4sm22202575e9.16.2025.04.03.06.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 06:49:31 -0700 (PDT)
Message-ID: <fe188552-3f1c-49f3-96ef-6e5aca6896ca@linaro.org>
Date: Thu, 3 Apr 2025 14:49:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
 quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
 <qhriqbm6fcy5vcclfounaaepxcvnck2lb7k2gcpbtrojqzehua@khv5lwdgbysc>
 <9962c517-5c0e-4d46-ac0c-2a7bab550156@linaro.org>
 <412fe24e-ce70-4733-ace5-d3fbe43476c4@oss.qualcomm.com>
 <c27a97ed-c765-421a-a48c-3abbae3bac93@oss.qualcomm.com>
 <bfa29a76-f89a-4398-b6b3-1be7ae6cf8b3@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <bfa29a76-f89a-4398-b6b3-1be7ae6cf8b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/04/2025 05:44, Ekansh Gupta wrote:
> 
> On 4/2/2025 2:12 PM, Dmitry Baryshkov wrote:
>> On 02/04/2025 11:38, Ekansh Gupta wrote:
>>>
>>> On 3/21/2025 5:53 PM, Srinivas Kandagatla wrote:
>>>>
>>>> On 20/03/2025 18:43, Dmitry Baryshkov wrote:
>>>>> On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
>>>>>>
>>>>>> On 20/03/2025 09:14, Ling Xu wrote:
>>>>>>> The fastrpc driver has support for 5 types of remoteprocs. There are
>>>>>>> some products which support GPDSP remoteprocs. Add changes to support
>>>>>>> GPDSP remoteprocs.
>>>>>>>
>>>>>>> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
>>>>>>> Signed-off-by: Ling Xu<quic_lxu5@quicinc.com>
>>>>>>> ---
>>>>>>>      drivers/misc/fastrpc.c | 10 ++++++++--
>>>>>>>      1 file changed, 8 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>>>>> index 7b7a22c91fe4..80aa554b3042 100644
>>>>>>> --- a/drivers/misc/fastrpc.c
>>>>>>> +++ b/drivers/misc/fastrpc.c
>>>>>>> @@ -28,7 +28,9 @@
>>>>>>>      #define SDSP_DOMAIN_ID (2)
>>>>>>>      #define CDSP_DOMAIN_ID (3)
>>>>>>>      #define CDSP1_DOMAIN_ID (4)
>>>>>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>>>>>> +#define GDSP0_DOMAIN_ID (5)
>>>>>>> +#define GDSP1_DOMAIN_ID (6)
>>>>>> We have already made the driver look silly here, Lets not add domain ids for
>>>>>> each instance, which is not a scalable.
>>>>>>
>>>>>> Domain ids are strictly for a domain not each instance.
>>>>> Then CDSP1 should also be gone, correct?
>>>> Its already gone as part of the patch that I shared in this discussion.
>>>>
>>>> I will send a proper patch to list once Ling/Ekansh has agree with it.
>>>>
>>> Thanks, Srini, for sharing this clean-up patch. It looks proper to
>>> me, but I was thinking if we could remove the domain_id dependency
>>> from the fastrpc driver. The addition of any new DSP will frequently
>>> require changes in the driver. Currently, its usage is for creating
>>> different types of device nodes and transferring memory ownership to
>>> SLPI when a memory region is added.
>>>
>>> The actual intention behind different types of device nodes can be
>>> defined as follows:
>>>
>>> fastrpc-xdsp-secure: Used for signed (privileged) PD offload and for daemons.
>>> fastrpc-xdsp: Should be used only for unsigned (less privileged) PD offload.
>>>
>>> The reason for this constraint is to prevent any untrusted process
>>> from communicating with any privileged PD on DSP, which poses a security risk.
>>> The access to different device nodes can be provided/restricted based on UID/GID
>>> (still need to check more on this; on Android-like systems, this is controlled by
>>> SELinux).
>>>
>>> There is already a qcom,non-secure-domain device tree property[1] which doesn't
>>> have a proper definition as of today. The actual way to differentiate between
>>> secure and non-secure DSP should be based on its ability to support unsigned PD.
>>>
>>> One way to remove the domain_id dependency that I can think of is to use this
>>> property to create different types of device nodes. Essentially, if unsigned PD
>>> is supported (e.g., CDSP, GPDSP), we add this property to the DT node and create
>>> both types of device nodes based on this. Otherwise, only the secure device node
>>> is created.
>> This sounds like breaking backwards compatibility on the userspace side. You can not do that.
> Okay, I thought if the property is added for all older platforms, that will ensure backward
> compatibility is maintained for old built applications.
> 
>  From userspace, the expected device open sequence is to try with the secure device node and
> fallback to the default/non-secure node if the secure node is not available/accessible.
> I understand the ABI cannot be broken, and this expectation should be added for new
> applications/platforms.
> 
> This is still a security issue that needs to be fixed in some way. I'll try to find out if any other
> approach can address this.
In the past I have suggested you to update the dt-bindings so that any 
new platforms that get added will not use the qcom,non-secure-domain 
flag. The usage of this flag is still confusing for any new users, as 
per the dt bindings its open to be used.

As we can not break the backwards compatibility, why not just restrict 
that to those platforms for now, and enforce new platforms to use not 
use it for for domains like adsp.

--srini


