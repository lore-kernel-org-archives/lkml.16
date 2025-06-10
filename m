Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E101322338
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749515666; cv=none; b=j7wohA27tyJ5lfNhrU+tjULq0ORD4/WOcPYxD2AhkAhjrCDZ2raf1Rd+KtFM8vtOpx9DowgOmy+GFMR4EeyXH5JPQ68V4YlvWHqoOELT9CYINcoOoH1wHtZPN760eFQ7NqEGmbCommtc8juEyAlVzVx03XxMhlhKk1n9NqeTq8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749515666; c=relaxed/simple;
	bh=pAvXuv0PbcklzkWSk8aVr21VDYCwOprq4gRJaWgcu3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0xFGFUhBfg4KTNb3QJ0yUJpYpZzlAV/jqXBRQ+qSf8XhBB0p+R1zTVxNMX0N0UQ98GQuRmcRO04eEtV0eJ6vKTmizzzSxuAQ/MxTogx1a/Gdqwv3W+os/ho6r5/sNiqREaHjBcp+lRr519Rw1Vy40kcLUkwbXBy8Bvvr5lR6Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfLE5qNE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfLE5qNE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559LCMWu024489
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jKXHPlovAe18pXN4Gv6r56FvRQixUbyObENb7DCEoVY=; b=SfLE5qNEkggJYc6D
	IIgdkhOux4NnJwiTaduVwTR3oux3/Pfh7MrMhMyntNctArWm0Wg0UeujfrH7fjpC
	PxsTMr7SB5NeNrBPrullAfIVHy8KLNzaa0en08SP2QtX5JYi5U/+fUqMb/6UsI4N
	uFnOvzIUtcKfwKQFe5+AWnPU/eJFbQiYl93vj6KUoMnHY5V7advirb415ONoxKlm
	KsC+bAFCjz2D0V/MkZIrHkOZM1eu3udyEfHIlF7syffannvKZkixx4R5ZilaTUeE
	VeVLUQQu7tmfGmCJNviYcPHl4QuHXxQ+0nWPTEnsoA8EyldgDN45izWIKiPpeCKY
	CRrpPQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn67j1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:34:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235e1d70d67so43154365ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 17:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749515663; x=1750120463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jKXHPlovAe18pXN4Gv6r56FvRQixUbyObENb7DCEoVY=;
        b=woFEMGfcahCMWyft7yNlI6glcFjdouwdD9bson1QswJUNuQ1YypB1k7fabJH6hwz4F
         D8HIBHRuyLF2GvzRUguokFV3f3CAUiP7hEgP+BGbaEUsQo1IIuPENwdNj+TVxc5+sGI0
         aw4fGQFgIPi1WJUpZjK7mGCUW3iVK3xkWgDrhSq6bjCo6xCEW60Tp9/xe6Uu9oRYFJ+j
         l1R1TKx7VWBuZpQjlpAmyadQz/C6yxmVGT6wRMXzmq5DBzwgvK+YzA6kNw2jlzXGt361
         sxvcGUSuFCmT3XhEkbwvISV0TTRyBxL2Ia3vwrfhC3SYsUGz5QLgEN63wGMiNCEbuF0f
         FMVg==
X-Forwarded-Encrypted: i=1; AJvYcCXxVq0A42W8hDj82QNwXRVuS5fbd1YNPoxVMGE+fRgRqkGckFbVy/Gre5AXMnyUWLf7wMP7tSxpxLpn0ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxEn794qE4PB7XFHqWOtM9ZcX0uQXswOLyopbxpq5zN1JQQKFp
	lLUPFrEVvGWRaDin7zre/1GoFMGLdvQxSWdE5Qhoej7j/G/j9eY1j3H37DiW0ZwT4udlQIbIYSp
	Qcu2gjh4oPjuVUnlO7xsYQeWS4rZFh2daYN/EUGdF7p3Fd3tqnSJrs3SqCSv0Kbx+MA==
X-Gm-Gg: ASbGncslyPDt3Ge8z4+aqdCpRqr02UtMKjbereK3V3nsozWa/wvWJlJStGUw3NZxgJ9
	9GAW/H/jV2peKI+GoJTfeWNeqsVZaZF/m3QICG37D3oeA7sDiRbn6V1+oRks2GLfzoLbF+7KdaJ
	hiOMDMvtwiV5rxtb7fT4p7a6ln1FW6rtqgNdwIl8nqI+eDejVlCUczuHbQXjMGC5MgjyJMsO+VK
	lfI3jaHmn6NATH2kui1bm56g9t3hBF7+75ugddlUXR5p+YOWO5bOUTorJMV3t1B1rjw7iKbTZQF
	ZVu1KERNg66iKCAnp4PrEqke0tkktN9rf3yw20fxq6djACbC7rM71wTeWGO/MMW8dIxrOC65zqO
	kYe3NDe308XXDAhbUsfr9
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id d9443c01a7336-23601d96e8dmr245721525ad.38.1749515662812;
        Mon, 09 Jun 2025 17:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+4EiD9fyaogbUaMbdStFIwBRIn6968q0b03DmNNBp1CVezcKYxw6brYzabzVeVDmZmhU4lg==
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id d9443c01a7336-23601d96e8dmr245721035ad.38.1749515662328;
        Mon, 09 Jun 2025 17:34:22 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603504f09sm60227715ad.223.2025.06.09.17.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 17:34:21 -0700 (PDT)
Message-ID: <8a6dbce8-a4ac-4871-aed0-8d3ae56f8c0a@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 10:34:17 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: optee: prevent use-after-free when the client exits
 before the supplicant
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org
References: <20250605-fix-use-after-free-v1-1-a70d23bff248@oss.qualcomm.com>
 <CAHUa44EyGXswbYLgdrfH_cMSyadgVUAJDGAMdsPXQVN7V7Nhsw@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44EyGXswbYLgdrfH_cMSyadgVUAJDGAMdsPXQVN7V7Nhsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDAwMiBTYWx0ZWRfX6eIihZ9TjxOx
 KCzA3lxoN+qp0hM7fjER4k89cFxpJe2romGyM+Yq180tB0CUR59C0k9THpB4jWo6um4LI/Q2VGw
 eIvEp2959QlHRk2NvPHpDbp1OyDiGF8wj8NZ9H69d6gqF45DOa/rNbJ3O3XKvqgvBDUfA3WOtu2
 MG9G0lV0AdzTOwm9KOsCmNZ6h+yg9olv+K/WcPBPWzYSng6C8PUa+MpsaNDcJMLYoTt/SQuN8vw
 RjoDoivZ1cnK3aayAPIDbU1IQg8Wq3Ng6Oj1LWmrWp5klMUo8FDreI6D196M9QhZIsgG6UlaLkV
 2b8/BvPSv6uJIvhVuBE5VPEqkEjSVT3f5ff1Xz4uHZdAFiqjGwJQN6F+psmzJWrv25vTCcWZf9g
 W4hjmWUdA3DpTGBmh8W5C4fbJIJeli9jKVIHNXWO4HbfX/f/sjweMVBgePyuEK/KqskOCrMt
X-Proofpoint-GUID: 01K1ZUkC7hGnBmn27PF2cNXduFoMlTjw
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68477d8f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=hWFDaL5eoG7oPyYckLUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 01K1ZUkC7hGnBmn27PF2cNXduFoMlTjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_10,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100002

Hi Jens,

On 6/9/2025 11:00 PM, Jens Wiklander wrote:
> Hi Amir,
> 
> On Fri, Jun 6, 2025 at 4:01 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> Commit 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop") made the
>> client wait as killable so it can be interrupted during shutdown or
>> after a supplicant crash. This changes the original lifetime expectations:
>> the client task can now terminate while the supplicant is still processing
>> its request.
>>
>> If the client exits first it removes the request from its queue and
>> kfree()s it, while the request ID remains in supp->idr. A subsequent
>> lookup on the supplicant path then dereferences freed memory, leading to
>> a use-after-free.
>>
>> Serialise access to the request with supp->mutex:
>>
>>   * Hold supp->mutex in optee_supp_recv() and optee_supp_send() while
>>     looking up and touching the request.
>>   * Let optee_supp_thrd_req() notice that the client has terminated and
>>     signal optee_supp_send() accordingly.
>>
>> With these changes the request cannot be freed while the supplicant still
>> has a reference, eliminating the race.
>>
>> Fixes: 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop")
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/optee/supp.c | 114 ++++++++++++++++++++++++++++++++---------------
>>  1 file changed, 77 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
>> index d0f397c90242..62c9c75f48a6 100644
>> --- a/drivers/tee/optee/supp.c
>> +++ b/drivers/tee/optee/supp.c
>> @@ -9,6 +9,7 @@
>>
>>  struct optee_supp_req {
>>         struct list_head link;
>> +       int id;
>>
>>         bool in_queue;
>>         u32 func;
>> @@ -19,6 +20,9 @@ struct optee_supp_req {
>>         struct completion c;
>>  };
>>
>> +/* It is temporary request used for invalid pending request in supp->idr. */
>> +static struct optee_supp_req invalid_req;
> 
> Prefer avoiding global variables where possible.
> 

Ack.

>> +
>>  void optee_supp_init(struct optee_supp *supp)
>>  {
>>         memset(supp, 0, sizeof(*supp));
>> @@ -102,6 +106,7 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
>>         mutex_lock(&supp->mutex);
>>         list_add_tail(&req->link, &supp->reqs);
>>         req->in_queue = true;
>> +       req->id = -1;
>>         mutex_unlock(&supp->mutex);
>>
>>         /* Tell an eventual waiter there's a new request */
>> @@ -117,21 +122,40 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
>>         if (wait_for_completion_killable(&req->c)) {
>>                 mutex_lock(&supp->mutex);
>>                 if (req->in_queue) {
>> +                       /* Supplicant has not seen this request yet. */
>>                         list_del(&req->link);
>>                         req->in_queue = false;
>> +
>> +                       ret = TEEC_ERROR_COMMUNICATION;
>> +               } else if (req->id  == -1) {
>> +                       /*
>> +                        * Supplicant has processed this request. Ignore the
>> +                        * kill signal for now and submit the result.
>> +                        */
>> +                       ret = req->ret;
>> +               } else {
>> +                       /*
>> +                        * Supplicant is in the middle of processing this
>> +                        * request. Replace req with invalid_req so that the ID
>> +                        * remains busy, causing optee_supp_send() to fail on
>> +                        * the next call to supp_pop_req() with this ID.
>> +                        */
>> +                       idr_replace(&supp->idr, &invalid_req, req->id);
>> +                       ret = TEEC_ERROR_COMMUNICATION;
>>                 }
>> +
>> +               kfree(req);
>>                 mutex_unlock(&supp->mutex);
>> -               req->ret = TEEC_ERROR_COMMUNICATION;
>> +       } else {
>> +               ret = req->ret;
>> +               kfree(req);
>>         }
>>
>> -       ret = req->ret;
>> -       kfree(req);
>> -
>>         return ret;
>>  }
>>
>>  static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
>> -                                             int num_params, int *id)
>> +                                             int num_params)
>>  {
>>         struct optee_supp_req *req;
>>
>> @@ -153,8 +177,8 @@ static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
>>                 return ERR_PTR(-EINVAL);
>>         }
>>
>> -       *id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
>> -       if (*id < 0)
>> +       req->id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
>> +       if (req->id < 0)
>>                 return ERR_PTR(-ENOMEM);
>>
>>         list_del(&req->link);
>> @@ -214,7 +238,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>         struct optee *optee = tee_get_drvdata(teedev);
>>         struct optee_supp *supp = &optee->supp;
>>         struct optee_supp_req *req = NULL;
>> -       int id;
>>         size_t num_meta;
>>         int rc;
>>
>> @@ -223,16 +246,45 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>                 return rc;
>>
>>         while (true) {
>> -               mutex_lock(&supp->mutex);
>> -               req = supp_pop_entry(supp, *num_params - num_meta, &id);
>> -               mutex_unlock(&supp->mutex);
>> +               scoped_guard(mutex, &supp->mutex) {
>> +                       req = supp_pop_entry(supp, *num_params - num_meta);
>> +                       if (!req)
>> +                               goto wait_for_request;
>>
>> -               if (req) {
>>                         if (IS_ERR(req))
>>                                 return PTR_ERR(req);
>> -                       break;
>> +
>> +                       /*
>> +                        * Popped a request: process it while holding the lock,
>> +                        * so that optee_supp_thrd_req() doesn't pull the
>> +                        * request out from under us.
>> +                        */
>> +
>> +                       if (num_meta) {
>> +                               /*
>> +                                * tee-supplicant support meta parameters ->
>> +                                * requests can be processed asynchronously.
>> +                                */
>> +                               param->attr =
>> +                                       TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
>> +                                       TEE_IOCTL_PARAM_ATTR_META;
>> +                               param->u.value.a = req->id;
>> +                               param->u.value.b = 0;
>> +                               param->u.value.c = 0;
>> +                       } else {
>> +                               supp->req_id = req->id;
>> +                       }
>> +
>> +                       *func = req->func;
>> +                       *num_params = req->num_params + num_meta;
>> +                       memcpy(param + num_meta, req->param,
>> +                              sizeof(struct tee_param) * req->num_params);
> 
> This is the point at which this function must break out of the loop
> and return the request, or it will be lost.
> 
> Cheers,
> Jens
> 

Right. I'll update.

Regards,
Amir

>>                 }
>>
>> +               /* Check for the next request in the queue. */
>> +               continue;
>> +
>> +wait_for_request:
>>                 /*
>>                  * If we didn't get a request we'll block in
>>                  * wait_for_completion() to avoid needless spinning.
>> @@ -245,27 +297,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>>                         return -ERESTARTSYS;
>>         }
>>
>> -       if (num_meta) {
>> -               /*
>> -                * tee-supplicant support meta parameters -> requsts can be
>> -                * processed asynchronously.
>> -                */
>> -               param->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
>> -                             TEE_IOCTL_PARAM_ATTR_META;
>> -               param->u.value.a = id;
>> -               param->u.value.b = 0;
>> -               param->u.value.c = 0;
>> -       } else {
>> -               mutex_lock(&supp->mutex);
>> -               supp->req_id = id;
>> -               mutex_unlock(&supp->mutex);
>> -       }
>> -
>> -       *func = req->func;
>> -       *num_params = req->num_params + num_meta;
>> -       memcpy(param + num_meta, req->param,
>> -              sizeof(struct tee_param) * req->num_params);
>> -
>>         return 0;
>>  }
>>
>> @@ -297,12 +328,21 @@ static struct optee_supp_req *supp_pop_req(struct optee_supp *supp,
>>         if (!req)
>>                 return ERR_PTR(-ENOENT);
>>
>> +       /* optee_supp_thrd_req() already returned to optee. */
>> +       if (req == &invalid_req) {
>> +               req = ERR_PTR(-ENOENT);
>> +               goto failed_req;
>> +       }
>> +
>>         if ((num_params - nm) != req->num_params)
>>                 return ERR_PTR(-EINVAL);
>>
>> +       req->id = -1;
>> +       *num_meta = nm;
>> +failed_req:
>>         idr_remove(&supp->idr, id);
>>         supp->req_id = -1;
>> -       *num_meta = nm;
>> +
>>
>>         return req;
>>  }
>> @@ -328,9 +368,8 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
>>
>>         mutex_lock(&supp->mutex);
>>         req = supp_pop_req(supp, num_params, param, &num_meta);
>> -       mutex_unlock(&supp->mutex);
>> -
>>         if (IS_ERR(req)) {
>> +               mutex_unlock(&supp->mutex);
>>                 /* Something is wrong, let supplicant restart. */
>>                 return PTR_ERR(req);
>>         }
>> @@ -358,6 +397,7 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
>>
>>         /* Let the requesting thread continue */
>>         complete(&req->c);
>> +       mutex_unlock(&supp->mutex);
>>
>>         return 0;
>>  }
>>
>> ---
>> base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
>> change-id: 20250604-fix-use-after-free-8ff1b5d5d774
>>
>> Best regards,
>> --
>> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>

