Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A137B67E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 00:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744158062; cv=none; b=skI2JBcDmmTmca+7F6JQQlqB/QJn7gBnHGY+fDt+LX49eJepxMP2A005ZFERTym9xCebW22C9GXMHAcdiMMq6nKOrwWqSC4IyffYV6RdT0qvrU3hHFY+xU+NAtVYdknQrcGW2hG5B/Fl/wam8r6SiYInj4zOD/81ZcReSR+fCao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744158062; c=relaxed/simple;
	bh=tYkXqFIvc+gbe8sHgqItixjC+6rGl7AliNvh8LlSK4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rgp4Cnuh/c4xrKjkE1sqkf4WaqAARMITigUZBe+zd4sYcAdfH5/A//1LtsAbzqhTHbmEI82Ljx1XGLmVHMq8da96+Vt6u3mj6+3sokV2x7RUB0HCZNUG77boi20z2+67V2RuCkiv9I8xd56dUbQCy2WfuPxZrD78xUMZLhVp0Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fotEjA3/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fotEjA3/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYqB8026657
	for <linux-kernel@vger.kernel.org>; Wed, 9 Apr 2025 00:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+u8F0wFKlS2xCEt0m2UMyKjouRwHrMCvFiQ+byjNMyg=; b=fotEjA3/l9nWRfWo
	1I1/p7pzcS00FQeirRQhGq9QCLjK/NawKk7yQNKEYsHZwQhhQO6UiTG5a3+I4gmS
	K9VlISzFYayXSmr06XsvCtghYfPS5gHnpxwh/KQb2j3nerFMP50Cr9feiVCj0/Yc
	IKPmiVnt73oSvMaVXxMhbADM1Nny428ZviEEj8BwqVVT4YUSbYxuWQgm3hTFfRcB
	UoEBgrdKcR2Gr+DsMaRX3yz1c3L/QuxPLngikuJahUthokmIq4qM3GRHbvgFR7AN
	BcBXToc9aLNV7vhLDsubJ6lm6MUHvDgKzHnuXovY+i+9vRm449Xd1xeXWSeNu450
	UFTWVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdghm1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:20:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2241e7e3addso50709755ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 17:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744158056; x=1744762856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+u8F0wFKlS2xCEt0m2UMyKjouRwHrMCvFiQ+byjNMyg=;
        b=hDrKe2xLrPLeZW52XK5PVaUybKJq/LlGvOOlxuDL+NBgQ4a1Z3QRooLfA+JnZPxaOV
         E3RihdwtahL9Lw19MJuNdrypw2hR4ZsyDdoHzgLIZ6otRc+FEOChn1dCtbVyv9XfDxKI
         r9MflU8LePkNbeTvga3x9u0oXEc1o1xC5eDlGtFZmSWDZaqxrqjvjCjnuxJMnxrMnPfL
         xkuBfe0q11Pf6Uyu8vMAK8uQ6u4AzEcDv4oXBSA5IxfkesqdYyiBPJVopgyN8s0Eav4G
         Bx2BhXHMKF53kMTfeCM3XUlslRtb9qUSGPmiwXVrrklaf1dUVrqcFpIVK2Uwh48/Jw1h
         XD6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXn/nEPMjivxT1IAeQIo+vl6DQowu3EnmXyPwUKwjyXeK37Kit2Z3oln/bV7zTQIj6Cl5aKOtqzqU2SjRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOboW649UVuWYC/uXAbHteVdYBObzX0knXyl9uyrMbkIrkriNt
	cHL+NJVHfqSsggyeajAJbJ8qZSrrVtJPiBsDkgt4B70pqfFFgq7YrIqLVN8bm2bF1zo/JzcdCCd
	6dkMasOP2Qg7gxNdhTkckeA05Te7OPmy+2wC+Wtv72ntKe/yZbmjzlAs8KccqBg==
X-Gm-Gg: ASbGnct+WIsRu90HhocbcDkTn7r0PXJVfZ4FRYdcYV14cBSVoz6pV8IKpvvZaZvgk/O
	s8QNkpG1eOmc7wU38BTN1i9l74oCoOkShuiOWA/VeGlcOMFSlwL5ZJ58QjYFi4wf/FhXxIgTd/P
	kBPcU4SD8vIPvHAdxsPe/HWTpCZ+IIRARo+Dqpyj0FNk2ncotVuKh7ScK3Jcj5aOe1ksKRdMjCO
	5vuQqj/MqGu8HCNJ4l5UZ0NF63p7yOoBT4Pml3NqYUiWdeyVuDks9EV+ubD/xIH313Z9/hZ1xZu
	3Nz51kxXtz0ENCylBkcdt4e6eGzQ+ppPZuobahUtTHAKyV08oHO1KRt0QDz3TANOq1W+DybfQo3
	vNKaSKV3BR650Tg==
X-Received: by 2002:a17:902:d4d1:b0:220:eade:d77e with SMTP id d9443c01a7336-22ac2a2dc06mr14318105ad.40.1744158056471;
        Tue, 08 Apr 2025 17:20:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfrysMIWoJydh7GIwuH2hJSLX/HXRThwTul/foKNq3HmO4GJI1OgO2NEpmg7x0Yo54T6pcOw==
X-Received: by 2002:a17:902:d4d1:b0:220:eade:d77e with SMTP id d9443c01a7336-22ac2a2dc06mr14317795ad.40.1744158055940;
        Tue, 08 Apr 2025 17:20:55 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22aa0684804sm55144285ad.117.2025.04.08.17.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 17:20:55 -0700 (PDT)
Message-ID: <9c143438-82ee-47ac-acc5-00d58960afe5@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 10:20:47 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] tee: add close_context to TEE driver operation
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-2-7f457073282d@oss.qualcomm.com>
 <CAHUa44G+Z9LjxqqqvKRRHrfN_6QPweF_5df2uOqtRuBfa5j3pw@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44G+Z9LjxqqqvKRRHrfN_6QPweF_5df2uOqtRuBfa5j3pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f5bd69 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=dqaakhkvI0CaZRVxv44A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: XlpGwgCmqUyjaDoXzf2nu5uojNFURgYT
X-Proofpoint-GUID: XlpGwgCmqUyjaDoXzf2nu5uojNFURgYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_09,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090000

Hi Jens,

On 4/8/2025 12:55 AM, Jens Wiklander wrote:
> Hi Amir,
>
> On Fri, Mar 28, 2025 at 3:48 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>> The tee_context can be used to manage TEE user resources, including
>> those allocated by the driver for the TEE on behalf of the user.
>> The release() callback is invoked only when all resources, such as
>> tee_shm, are released and there are no references to the tee_context.
>>
>> When a user closes the device file, the driver should notify the
>> TEE to release any resources it may hold and drop the context
>> references. To achieve this, a close_context() callback is
>> introduced to initiate resource release in the TEE driver when
>> the device file is closed.
>>
>> Relocate teedev_ctx_get, teedev_ctx_put, tee_device_get, and
>> tee_device_get functions to tee_drv.h to make them accessible
>> outside the TEE subsystem.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/tee_core.c    | 39 +++++++++++++++++++++++++++++++++++++++
>>  drivers/tee/tee_private.h |  6 ------
>>  include/linux/tee_core.h  | 11 +++++++++--
>>  include/linux/tee_drv.h   | 40 ++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 88 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index 24edce4cdbaa..22cc7d624b0c 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -72,6 +72,20 @@ struct tee_context *teedev_open(struct tee_device *teedev)
>>  }
>>  EXPORT_SYMBOL_GPL(teedev_open);
>>
>> +/**
>> + * teedev_ctx_get() - Increment the reference count of a context
>> + *
>> + * This function increases the refcount of the context, which is tied to
>> + * resources shared by the same tee_device. During the unregistration process,
>> + * the context may remain valid even after tee_device_unregister() has returned.
>> + *
>> + * Users should ensure that the context's refcount is properly decreased before
>> + * calling tee_device_put(), typically within the context's release() function.
>> + * Alternatively, users can call tee_device_get() and teedev_ctx_get() together
>> + * and release them simultaneously (see shm_alloc_helper()).
>> + *
>> + * @ctx: Pointer to the context
> Please move this @ctx line to before the verbose description of the function.
>
> Cheers,
> Jens

Ack.

Best Regards,
Amir

>
>> + */
>>  void teedev_ctx_get(struct tee_context *ctx)
>>  {
>>         if (ctx->releasing)
>> @@ -79,6 +93,7 @@ void teedev_ctx_get(struct tee_context *ctx)
>>
>>         kref_get(&ctx->refcount);
>>  }
>> +EXPORT_SYMBOL_GPL(teedev_ctx_get);
>>
>>  static void teedev_ctx_release(struct kref *ref)
>>  {
>> @@ -89,6 +104,10 @@ static void teedev_ctx_release(struct kref *ref)
>>         kfree(ctx);
>>  }
>>
>> +/**
>> + * teedev_ctx_put() - Decrease reference count on a context
>> + * @ctx: pointer to the context
>> + */
>>  void teedev_ctx_put(struct tee_context *ctx)
>>  {
>>         if (ctx->releasing)
>> @@ -96,11 +115,15 @@ void teedev_ctx_put(struct tee_context *ctx)
>>
>>         kref_put(&ctx->refcount, teedev_ctx_release);
>>  }
>> +EXPORT_SYMBOL_GPL(teedev_ctx_put);
>>
>>  void teedev_close_context(struct tee_context *ctx)
>>  {
>>         struct tee_device *teedev = ctx->teedev;
>>
>> +       if (teedev->desc->ops->close_context)
>> +               teedev->desc->ops->close_context(ctx);
>> +
>>         teedev_ctx_put(ctx);
>>         tee_device_put(teedev);
>>  }
>> @@ -1024,6 +1047,10 @@ int tee_device_register(struct tee_device *teedev)
>>  }
>>  EXPORT_SYMBOL_GPL(tee_device_register);
>>
>> +/**
>> + * tee_device_put() - Decrease the user count for a tee_device
>> + * @teedev: pointer to the tee_device
>> + */
>>  void tee_device_put(struct tee_device *teedev)
>>  {
>>         mutex_lock(&teedev->mutex);
>> @@ -1037,7 +1064,18 @@ void tee_device_put(struct tee_device *teedev)
>>         }
>>         mutex_unlock(&teedev->mutex);
>>  }
>> +EXPORT_SYMBOL_GPL(tee_device_put);
>>
>> +/**
>> + * tee_device_get() - Increment the user count for a tee_device
>> + * @teedev: Pointer to the tee_device
>> + *
>> + * If tee_device_unregister() has been called and the final user of @teedev
>> + * has already released the device, this function will fail to prevent new users
>> + * from accessing the device during the unregistration process.
>> + *
>> + * Returns: true if @teedev remains valid, otherwise false
>> + */
>>  bool tee_device_get(struct tee_device *teedev)
>>  {
>>         mutex_lock(&teedev->mutex);
>> @@ -1049,6 +1087,7 @@ bool tee_device_get(struct tee_device *teedev)
>>         mutex_unlock(&teedev->mutex);
>>         return true;
>>  }
>> +EXPORT_SYMBOL_GPL(tee_device_get);
>>
>>  /**
>>   * tee_device_unregister() - Removes a TEE device
>> diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
>> index 9bc50605227c..d3f40a03de36 100644
>> --- a/drivers/tee/tee_private.h
>> +++ b/drivers/tee/tee_private.h
>> @@ -14,12 +14,6 @@
>>
>>  int tee_shm_get_fd(struct tee_shm *shm);
>>
>> -bool tee_device_get(struct tee_device *teedev);
>> -void tee_device_put(struct tee_device *teedev);
>> -
>> -void teedev_ctx_get(struct tee_context *ctx);
>> -void teedev_ctx_put(struct tee_context *ctx);
>> -
>>  struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size);
>>  struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
>>                                           unsigned long addr, size_t length);
>> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
>> index a38494d6b5f4..8a4c9e30b652 100644
>> --- a/include/linux/tee_core.h
>> +++ b/include/linux/tee_core.h
>> @@ -65,8 +65,9 @@ struct tee_device {
>>  /**
>>   * struct tee_driver_ops - driver operations vtable
>>   * @get_version:       returns version of driver
>> - * @open:              called when the device file is opened
>> - * @release:           release this open file
>> + * @open:              called for a context when the device file is opened
>> + * @close_context:     called when the device file is closed
>> + * @release:           called to release the context
>>   * @open_session:      open a new session
>>   * @close_session:     close a session
>>   * @system_session:    declare session as a system session
>> @@ -76,11 +77,17 @@ struct tee_device {
>>   * @supp_send:         called for supplicant to send a response
>>   * @shm_register:      register shared memory buffer in TEE
>>   * @shm_unregister:    unregister shared memory buffer in TEE
>> + *
>> + * The context given to @open might last longer than the device file if it is
>> + * tied to other resources in the TEE driver. @close_context is called when the
>> + * client closes the device file, even if there are existing references to the
>> + * context. The TEE driver can use @close_context to start cleaning up.
>>   */
>>  struct tee_driver_ops {
>>         void (*get_version)(struct tee_device *teedev,
>>                             struct tee_ioctl_version_data *vers);
>>         int (*open)(struct tee_context *ctx);
>> +       void (*close_context)(struct tee_context *ctx);
>>         void (*release)(struct tee_context *ctx);
>>         int (*open_session)(struct tee_context *ctx,
>>                             struct tee_ioctl_open_session_arg *arg,
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index a54c203000ed..ce23fd42c5d4 100644
>> --- a/include/linux/tee_drv.h
>> +++ b/include/linux/tee_drv.h
>> @@ -96,6 +96,46 @@ struct tee_param {
>>         } u;
>>  };
>>
>> +/**
>> + * tee_device_get() - Increment the user count for a tee_device
>> + * @teedev: Pointer to the tee_device
>> + *
>> + * If tee_device_unregister() has been called and the final user of @teedev
>> + * has already released the device, this function will fail to prevent new users
>> + * from accessing the device during the unregistration process.
>> + *
>> + * Returns: true if @teedev remains valid, otherwise false
>> + */
>> +bool tee_device_get(struct tee_device *teedev);
>> +
>> +/**
>> + * tee_device_put() - Decrease the user count for a tee_device
>> + * @teedev: pointer to the tee_device
>> + */
>> +void tee_device_put(struct tee_device *teedev);
>> +
>> +/**
>> + * teedev_ctx_get() - Increment the reference count of a context
>> + *
>> + * This function increases the refcount of the context, which is tied to
>> + * resources shared by the same tee_device. During the unregistration process,
>> + * the context may remain valid even after tee_device_unregister() has returned.
>> + *
>> + * Users should ensure that the context's refcount is properly decreased before
>> + * calling tee_device_put(), typically within the context's release() function.
>> + * Alternatively, users can call tee_device_get() and teedev_ctx_get() together
>> + * and release them simultaneously (see shm_alloc_helper()).
>> + *
>> + * @ctx: Pointer to the context
>> + */
>> +void teedev_ctx_get(struct tee_context *ctx);
>> +
>> +/**
>> + * teedev_ctx_put() - Decrease reference count on a context
>> + * @ctx: pointer to the context
>> + */
>> +void teedev_ctx_put(struct tee_context *ctx);
>> +
>>  /**
>>   * tee_shm_alloc_kernel_buf() - Allocate kernel shared memory for a
>>   *                              particular TEE client driver
>>
>> --
>> 2.34.1
>>
