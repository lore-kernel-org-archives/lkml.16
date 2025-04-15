Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74CF2820C4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707810; cv=none; b=IOyWNpu/7oxSCb4OKryhu67PkTpf9cXwEvxRI0RiidEGFMSKIV+zeSz6YHaYIGYJoLBgwU4iGrfOicWTPI4+cNNIe3au07RUrO/eCBMtxTfvmTJZV+6a3dV9OmzNIFv3m+FKD+flSUxjoixfsixOp+5cBfn54GVqmEvwuNRHC2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707810; c=relaxed/simple;
	bh=+3jlt6GcMa9OMBk/b+hHsOqBomKGFuEnhQSLutcK0vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOvOKFY1BRKu+TkTXypSiu+rtWTEsZHdnCxOVw+mwfQoncWLnvudYnVDY20IiX/tVBPfT5v1tAwGpgmsb/tOmEAscpyGUDLfbd12HpQgjwkWHLZST8vWWuCcuG72vc4Htx+vrenS9BzRv7NBT4AYgC8FZflmeNlgqVPR/BvE2PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=He+BI3s0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="He+BI3s0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tB0v025041
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pi9W8xDLtFpfMCtDZ/I2qyKiiqpdZeuFsiGXpdMBpHo=; b=He+BI3s0YJ/2TUMV
	oO9+aMBAxYo42PxqQhuOKQS4YVmQsPePdK6np0q78+1xWiMYBGAxccIZWVDprg8B
	Of0CfjQ1HxM00+9Uq3pful9EjN/89iSsaU62QX093+sjJQJvRGTAl3ZqXwC1Y/3o
	UsAPGEdyrDDVKmRg+HJP0MHuSmLqhd0UyLwzy6nksJcZoLkWG3YTm6obWFZBU1OU
	dDWTfcfUpoN2V8nbNTgJPPz4X5qH0M14vOaaT4rQlJRX+dRtvBfeiqYx2TAQVedw
	XJLio7UJrQEVyFcByKZXmprkM5ZNvyx5iK9E7mkUlVIOXnyb9heMvMofoouFzyX5
	13Kg3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wfdh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:03:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2872e57so976716385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744707807; x=1745312607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi9W8xDLtFpfMCtDZ/I2qyKiiqpdZeuFsiGXpdMBpHo=;
        b=O7VuL3m+TYW2N2CLTALpHxotLCDtMbfcao+XS/KR9//glvEDIVkAyGwG0AYiWDnobc
         aGD7qmk3BaWpF0Fdcu2bUi1RVESbABRtQ9ScE4IMJ2JsXmW6et8dDy4HtM1xQLWnndL+
         Fa26ATDKxejTIjaus/oApWFp6ysaEhPLsJFlOfTu1P46+5oCsREq6sEZMBOFcqIi74YU
         B7yQLlGLcAIV2RxqU6zxayGWg5PYsf8gKP7XCl4fSQy1Mjw1tt2nAPz2c95kxjX0Plb9
         pJnHhBWIsq43yaSZZ+cp7wMXHu7RibHpeHG+a0fn869dlXMxUMn7YE3T00mos61mOzxR
         N+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwSmTQzdo47UNU2JDLTNeTF6eoBTJ48bykItqbkTDE45hoCyaIz9UBi8Zyn8AQ4QelIxzN88PxF5nYZ7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPdvtKV1wc+BLlOc9N2Sb1f+aMV0UJwcQwGz/+whXPh/BRAMtX
	lEm59pGg/UhmJm8jvzGWMbBiggtCSx6bxbEIYi/qK+GVrNy3dHBRoCQqBwVm/s3N3yohgQP5B/s
	LyWB4rts8FAj3coIKQhpHjofIUNkcPjN3ACYjG1bWhheBYbEf1WTbqO44O6Ixti8=
X-Gm-Gg: ASbGncvmhbF/aQWhQmJtXGb6nDSINFFiWIOCzDdpe6k+HuXu1U/knNo5eCvVh08YYh/
	ySUJgY0kywKZS2l6zb2NeqHhdrU7JeG+Qvg9T4tI0V0iSfj1px9GTgIU3szoQjnsOOVr8x1umXE
	GFYL1QU/ajwjO5oIMRfDwFbeBwBJ6y4zFu8jw/azdxgQEMEOzAipSsXHuoA5IM7NxP8qBkSK3ON
	Wtn+jYHbWn47nM46rawMlLGteuD7RNeICajsOwlTDc0AjpHHZtWVK77Q0rkIuXJ15M+FFfpfa1W
	fnwQ2ODNJfMO+sulqDV1m9kX2EDujrASRJkrfxNIShsleUKLAXo/cWDWwrMudSowjVB1u/vVFBi
	RgIYUpXQa7PL5igX3RU6nQ9zDd6MJLprHVG7/xeLBg2BVCJKMWP54G4gXvqik
X-Received: by 2002:a05:620a:44d1:b0:7c5:55be:7bff with SMTP id af79cd13be357-7c7af114905mr2363266785a.43.1744707806626;
        Tue, 15 Apr 2025 02:03:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmALGO/49j9P1UWM4GcEnINXzH+/qaxVWP9A1Xi4UfCFAuKfFmnRfD3FeJ10ZTTxf0ZPZJwQ==
X-Received: by 2002:a05:620a:44d1:b0:7c5:55be:7bff with SMTP id af79cd13be357-7c7af114905mr2363262685a.43.1744707806221;
        Tue, 15 Apr 2025 02:03:26 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd? (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi. [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d520389sm1358576e87.251.2025.04.15.02.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:03:25 -0700 (PDT)
Message-ID: <f59c0ab6-2391-4712-a3d5-18e67f538d4f@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:03:23 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] drm/connector: unregister CEC data
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-4-04809b10d206@oss.qualcomm.com>
 <20250414-hissing-auspicious-goldfish-78b9dc@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250414-hissing-auspicious-goldfish-78b9dc@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fe20df cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0wzSBSrXEAkDLt2uI0EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Bxy4nHdD9w8sZFFBD5yhFtBFpdBQ7ddD
X-Proofpoint-GUID: Bxy4nHdD9w8sZFFBD5yhFtBFpdBQ7ddD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150062

On 14/04/2025 17:47, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Apr 07, 2025 at 06:11:01PM +0300, Dmitry Baryshkov wrote:
>> In order to make sure that CEC adapters or notifiers are unregistered
>> and CEC-related data is properly destroyed make drm_connector_cleanup()
>> call CEC's unregister() callback.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/drm_connector.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index ba08fbd973829e49ea977251c4f0fb6d96ade631..ae9c02ef9ab102db03c2824683ece37cfbcd3300 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -743,6 +743,13 @@ void drm_connector_cec_phys_addr_set(struct drm_connector *connector)
>>   }
>>   EXPORT_SYMBOL(drm_connector_cec_phys_addr_set);
>>   
>> +static void drm_connector_cec_unregister(struct drm_connector *connector)
>> +{
>> +	if (connector->cec.funcs &&
>> +	    connector->cec.funcs->unregister)
>> +		connector->cec.funcs->unregister(connector);
>> +}
>> +
>>   /**
>>    * drm_connector_cleanup - cleans up an initialised connector
>>    * @connector: connector to cleanup
>> @@ -763,6 +770,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
>>   
>>   	platform_device_unregister(connector->hdmi_audio.codec_pdev);
>>   
>> +	drm_connector_cec_unregister(connector);
>> +
> 
> Actually, since we know that the HDMI connector is drm-managed, why
> can't we make the call to connector->cec.funcs->unregister a drm-managed
> action registered by drm_connector_hdmi_cec_register?

I haven't settled yet in my mind whether we can/should also use this 
infrastructure for drm_dp_cec management. So, at this point, I'd prefer 
to keep a non-managed unregister function. Once we settle on something 
for drm_dp_cec, we can switch to drmm.

-- 
With best wishes
Dmitry
