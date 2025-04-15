Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF4F2DFA21
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732894; cv=none; b=O8jJS+vKk6eCmaOqnBejCe2mpq/GmFT5C1EY+ZeSt6HXg5BiM85JT/4Ynsijt0zth5vzg/HBK1MUlwvXFiLcDNVsmAi1Vq0I+WR9ghQcJwMR8sWLJdAf8QXqHUfkAMOiJ2f7l4wVzlBlNAa8EnML3WlDLiXrkfynjlzhahHNLh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732894; c=relaxed/simple;
	bh=tyYooO+YaN+XLh5miNfaYap3d5q8YOsGFuRseUdXiPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OhIUO013DdfI6s7zyvO6li+FFW5wvH37dpv6nVQfv82q+gjgU22Px0aMq7be/9WyLiHhfdAcPIfc5eP5eGkV6ujrI8GDgvayozdGFHaVN1BSWGbMC8hiXyFDwdieP7JzFYPM23vD6pGeBzsX1XudUHZK9AL9vG01YlSCae0gzms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mm0OH3+H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mm0OH3+H"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8u7Ir002933
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5u2T6l4s1t7GjnVZQRXRPhLWe1OIv4ZxKDNlwrBlgUM=; b=Mm0OH3+HMJMDCje5
	MAhJNF8cVWHlQ9+egmRkzxALAqZ/XWfxDocb6dCPK3inhlJ7LV61Hg9kguHuE6Bt
	EzpwJCHb7uKDEw/N9IRH4akbzt7Jo0QcBrpJVswxymvX+lDizQqtO2/eJOtJeBNx
	XO2EUFtztwSAxuPbP8OSw50ZbdCT4r1OCSUWCEuBk6c9ZPGY2EQl0Ylk/jP62+nY
	Jy2dm2PRXYwpiURZX59ONlMr4J5Xvxui5SEPrP+FQSmuQRi2tzgWAY0zFNYL71B9
	c8ETLIKcuKnFBxRWKnGfRdhqI5yClZ35J809tDRiIe+c+qvNbW7ru8NpBDyzLSEE
	XuPLQA==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk0gk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:01:31 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d451ad5b2dso61769635ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744732890; x=1745337690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5u2T6l4s1t7GjnVZQRXRPhLWe1OIv4ZxKDNlwrBlgUM=;
        b=BiJ10gR0YPAcvq/URvwOr8R/w1iS+dfOXuGEp8CmlYqKCcnti3G7EL5chc9SgsonI1
         wl6NofSabjj2TuVKMrITKLxdsffw8JmBtRfe7iGJ+ZIQsCg9efkC1Ul0dt1b1RHDrD+O
         LE8w+VdavfPlnwcS8ULJ1kaqV11f2fypgOf+MHsnL72Q+xuXH8XNY8NFDVUhSKGhpWKt
         2tnDYt7BxNTuV9h7BHkkbws/kbALzLWK50M3avW5OSCzLEdIB0Ne1Cc0yknjIbfaQqs4
         jSVNDFcOKje04Sp3PILRzfXY3AkahRcy6b5sSQAIpLcSil1rRjWm0ab6XfA+YYeuVm3O
         jyew==
X-Forwarded-Encrypted: i=1; AJvYcCU+0bFuZGj2lv98chrUdmRcg7SH3oOvqgkhVzEluW8bZ0epLCfOSrbC35/RcskARoAfMCyvghLX0boYbkw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1KiVuNGRetMMwrAVQM/jbi0CzUStZ/g+wnHdnyX0yMPU+dXN0
	UTHOfibzHFJvRl/30BzL7Xx9bbkJJk7xJWLYn+F9ebOoSHiXVi2P8/1DthHr7EIf0AliDW4uXci
	zfzmtM4rPmRzu1CTivMB4I6SuZb4ZO5xUBVrLsGR4hEvLFdllriXBVw3GQ670I3I=
X-Gm-Gg: ASbGncurpvjraBgt+zX+Ua4o63hFBYtOXP3kyZ7iQ1Wth+HQlMPGlMMlZ/pssf9dUNi
	gxyz/jG8kjPs3jOvvKSHfd5s8kOOT8MXEIS2oUtTUoi7P6bvV0Y/nqcDz1mOo2K5pNLiqNKgUOR
	n+kUD7nPGcXnx3LNPT7yguY7TJuaPtaimS62Y5Trkrn5sV6dX1dUaeVSwWbbr7PPORdKcv4dWeQ
	hTY2A19XML5NnCA5kFzVdeM3Efdl6nd7fsPbmN0ayQKWcSBH4Ow62Gkal7VvGTMqD7xZxTeGHez
	MXpqOEofqWmGS8oxKOrezvcxBsPXdzU4RrKWn/WSS7yifuPIFIx4daiCPImxZXFHcRHnFjKu0e+
	Z7OKyQkKsiOtzU9jHgVAOtM3wz+caPctDu7uuWcjViQFKLplTCWiM1O2kLvz+
X-Received: by 2002:a05:6e02:180b:b0:3d6:c2ff:eee2 with SMTP id e9e14a558f8ab-3d809cebf2dmr42094885ab.6.1744732889906;
        Tue, 15 Apr 2025 09:01:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhT2iFWSl8B5lrAhlh2VfACCzUSvDHCQ5wYZeqMP6DgpJHzf63QqS2vwH8kBgKxT+bdulSTQ==
X-Received: by 2002:a05:6e02:180b:b0:3d6:c2ff:eee2 with SMTP id e9e14a558f8ab-3d809cebf2dmr42094135ab.6.1744732889148;
        Tue, 15 Apr 2025 09:01:29 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:a0aa:ce3:e648:8962? (2001-14bb-aa-77bc-a0aa-ce3-e648-8962.rev.dnainternet.fi. [2001:14bb:aa:77bc:a0aa:ce3:e648:8962])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d51ed80sm1469663e87.230.2025.04.15.09.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 09:01:28 -0700 (PDT)
Message-ID: <d923d469-ef1d-4dde-87ce-6b9e840b27fc@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 19:01:25 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/11] drm/display: add CEC helpers code
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
 <20250407-drm-hdmi-connector-cec-v5-6-04809b10d206@oss.qualcomm.com>
 <20250414-determined-kind-peacock-e9a47c@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250414-determined-kind-peacock-e9a47c@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fe82db cx=c_pps a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=FoKcXcNF-cLjYyKC5aEA:9 a=QEXdDO2ut3YA:10 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-GUID: RES6LKTbLlXxBo141-XmGp6tXb7hsrFl
X-Proofpoint-ORIG-GUID: RES6LKTbLlXxBo141-XmGp6tXb7hsrFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150112

On 14/04/2025 17:58, Maxime Ripard wrote:
> On Mon, Apr 07, 2025 at 06:11:03PM +0300, Dmitry Baryshkov wrote:
>> +static void drm_connector_hdmi_cec_adapter_unregister(struct drm_connector *connector)
>> +{
>> +	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
>> +
>> +	cec_delete_adapter(data->adapter);
>> +
>> +	if (data->funcs->uninit)
>> +		data->funcs->uninit(connector);
>> +
>> +	kfree(data);
>> +	connector->cec.data = NULL;
>> +}
>>
>> [...]
>>
>> +int drm_connector_hdmi_cec_register(struct drm_connector *connector,
>> +				    const struct drm_connector_hdmi_cec_funcs *funcs,
>> +				    const char *name,
>> +				    u8 available_las,
>> +				    struct device *dev)
>> +{
>> +	struct drm_connector_hdmi_cec_data *data;
>> +	struct cec_connector_info conn_info;
>> +	struct cec_adapter *cec_adap;
>> +	int ret;
>> +
>> +	if (!funcs->init || !funcs->enable || !funcs->log_addr || !funcs->transmit)
>> +		return -EINVAL;
>> +
>> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->funcs = funcs;
>> +
>> +	cec_adap = cec_allocate_adapter(&drm_connector_hdmi_cec_adap_ops, connector, name,
>> +					CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO,
>> +					available_las ? : CEC_MAX_LOG_ADDRS);
>> +	ret = PTR_ERR_OR_ZERO(cec_adap);
>> +	if (ret < 0)
>> +		goto err_free;
>> +
>> +	cec_fill_conn_info_from_drm(&conn_info, connector);
>> +	cec_s_conn_info(cec_adap, &conn_info);
>> +
>> +	data->adapter = cec_adap;
>> +
>> +	mutex_lock(&connector->cec.mutex);
>> +
>> +	connector->cec.data = data;
>> +	connector->cec.funcs = &drm_connector_hdmi_cec_adapter_funcs;
>> +
>> +	ret = funcs->init(connector);
>> +	if (ret < 0)
>> +		goto err_delete_adapter;
>> +
>> +	ret = cec_register_adapter(cec_adap, dev);
>> +	if (ret < 0)
>> +		goto err_delete_adapter;
> 
> I'm a bit concerned about the respective lifetimes of CEC adapters and
> DRM connectors.
> 
> When you register the CEC adapter, its associated structure is
> kzalloc'd, and freed when the DRM connector is freed (so when nobody has
> any reference to it anymore: either when the device is torn down, or a
> DP-MST hotplug scenario).
> 
> The CEC adapter however will only be freed when its own users will close
> their file descriptor. So we can have a scenario when the CEC adapter is
> still live but the DRM connector has been unregistered. Thus, the CEC
> adapter data will have been kfree'd.

If I understand correctly, CEC core will handle this thanks to the 
cec_is_registered() calls in the important places. Nevertheless it's 
worth adding a comment and a set of drm_dev_enter() / _exit() calls.

> You might consider safe because $REASONS, but those need to be properly
> detailed and explained.
> 
> That's another reason why I think that just putting the connector
> pointer as data is better: connectors are refcounted, so we know those
> aren't an issue.

Not quite. CEC adapter itself doesn't have a refcount on the connector. 
And if add one, we'd create a loop, preventing connector from being 
unregistered.

-- 
With best wishes
Dmitry
