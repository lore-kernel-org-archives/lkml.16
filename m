Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0470C275101
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707888; cv=none; b=hjn8H8pRdZtKJ+eebEI/fabu6EoK8Fw4RyEv9TXXqnIcU6DfGdmnKWO8qFMgKVpG0VI/r8BFq2V2jaiPX4RmXw1akHSTyEY6g2oS0V7Gbr7GiYTBeN0FDxJEQZKvglPwkVKCM2cJ88nuqHAo6zO4eKUjKvWl3bUS9hzC3X3i+Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707888; c=relaxed/simple;
	bh=gF/lxQOhW5uuQMJ4XHbAi68oANaDpp+yw8NmQQVNo8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pP8svcexxAmjPvVlFYVbrCnYaHT6U+p3AAPYfV2O31KPMiZtpNih6XIFPm7NrCHxAEipXtlMBth22b5t25MJbuxbPeqkWt60XEdToID0wOlDED7Qf+/afE3U6rgKHpsJAl1wT49eaisqyTfWn/hJfiTbmunJupyvDDAmSskhDao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGiYYZeY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGiYYZeY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tCTi019549
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hZpISES0U/oym4A/OtPRu8hY+MQbR3SyvSyRlk7Lsc=; b=mGiYYZeY0ltty7NV
	zksty3KtGbaINtI0a7fCA+Mlxq1G2XrOCV7unWBG9fiXEbDUfW5jWodTsAyBPXC8
	LbDLnrzZ+BvJdqtYcWe4AxLnlrB0WNA+aB6ChinrzkFVWNZfuvlM4PZkjRpNLssZ
	kp/8KNfDshNRePyyPdOL2CZUUU4CwIzmMmybtQ2+KTnMP4TaMsvP1Mb+UAd/mjNi
	7GQ7pAH+gvEk11wJzKZglvCkKBVYSyLOza75TLoHPO9Rd5D1wf1+iEijrbZuatI3
	gHIS38+96VL/SkLWfW01SzUNCg2AwMkEMQ3zH8McmoRHLvNT67XB5/poRjvqE47C
	0u4Srw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcyaf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:04:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c572339444so712480185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744707885; x=1745312685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6hZpISES0U/oym4A/OtPRu8hY+MQbR3SyvSyRlk7Lsc=;
        b=vL/ONk96MwpryIbJMzLOQAEMZjX3qN/U2ubfZNm8Fo6/DFj6tOPwCstruc6ab2bj9k
         dDSc8GhYNFI9lcI5Vwca6R9/+QN2ntAlZZz622WdGQPhrnur0lRSOdMyM9R7Szs5MUXh
         iyFdHgsT4nfWe73KIjc6FMj+3NJY9s7dDiNsexVEQUmN1wd+fGZnOU9axwiXJjwfMWwj
         EiS48APGi+KKGbK1f6VjPmJlCpnBTebAEB0BXA/EuR6Wr4AiCVdMuwjB3xRAH6ivGlUZ
         ajEISJb/bGof/6Ek9K/JqZAirdIN93Ko0Rabstzu//cLrcfTXGMV7qCq1ngnIy2dZHT7
         jLZA==
X-Forwarded-Encrypted: i=1; AJvYcCVgog3tkq9gE/953G2/4VgVq3is78xV6ymLcfdj7wQpqDh1aGxPbAhYfslQipHzVCmnoHY0BuAppL56Gao=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw79fOQ7mZHgGDjIfP1ZVa4cjWcBTXPnX8RqkdnPgAJn8I84gvN
	qFo32iWwIfqWlX0Cs7X63hyPiEgJvMAkmnFYT736txrWHvO0NC2PAMAL1y9BHxWzovrvB7q68fn
	QRPxl6mGQ7n71rxGTj9SniWS+r0WsXbRykc2D7kyla0NsvZiTRTFvN3BZ8zIWyII=
X-Gm-Gg: ASbGncs+gpMGhKcGdnGN+OCryXDJOzwi5AdPG6mTTb+8GLm24XkZEWYXcvLStt57D1+
	cpKLe4RwlubcKyO7tnbUOA9yT3QCvF8Fry+wefI4ixszx6psEsDpuFG4YSUakppSYk5ris39V6D
	Ou4NLuSvig5y+ggSZ+BWK/UdsyllTeGoV6wu7zmL9Tep8gd1yMA89XEuGlrnJySjRQdWkVttpUx
	SiWNSq9wPVk2gNo8ivqt0KeH1ebZeDMTklck+M4yZ3j1z+Om5bkuKXZIigkmPlWwFVGh5UC2Z9q
	P6w3aA8+vdA/a9HkGRtXDn6FDkGRS8psUNOR3Iq+o+lrhRLgk1ZEt/y3eEtDhFtf2MuNX3QWXjN
	I8vZ3NyHRkk3ijFOEW5/LNLMj6kcPFBor/eTaMnl4fNDj7qZcC4hfJIbsY0m7
X-Received: by 2002:a05:620a:170b:b0:7c7:a5c1:8247 with SMTP id af79cd13be357-7c7af0bdce9mr2263372285a.9.1744707884577;
        Tue, 15 Apr 2025 02:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqunBK84oqVf3RoA3SZGRSHrxH7q/c8tnI3gqgWn61qjL63ad60eci0nqMgqyVJRkBEaAlGA==
X-Received: by 2002:a05:620a:170b:b0:7c7:a5c1:8247 with SMTP id af79cd13be357-7c7af0bdce9mr2263369085a.9.1744707884246;
        Tue, 15 Apr 2025 02:04:44 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd? (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi. [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d509bsm19459131fa.84.2025.04.15.02.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:04:43 -0700 (PDT)
Message-ID: <ca85e5e1-9887-4cea-91f5-3c312680506d@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:04:41 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/11] drm/vc4: hdmi: switch to generic CEC helpers
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
 <20250407-drm-hdmi-connector-cec-v5-8-04809b10d206@oss.qualcomm.com>
 <20250414-thundering-marmoset-of-promotion-c8e0dc@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250414-thundering-marmoset-of-promotion-c8e0dc@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe212e cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=72TttzAs2X4TEUGSDZwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: b09B7R3sFWbsHHAZpOkK2KnxS7KyTCWK
X-Proofpoint-ORIG-GUID: b09B7R3sFWbsHHAZpOkK2KnxS7KyTCWK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150062

On 14/04/2025 17:41, Maxime Ripard wrote:
> On Mon, Apr 07, 2025 at 06:11:05PM +0300, Dmitry Baryshkov wrote:
>> +static const struct drm_connector_hdmi_cec_adapter_ops vc4_hdmi_cec_adap_ops = {
>> +	.base.unregister = drm_connector_hdmi_cec_unregister,
>> +	.init = vc4_hdmi_cec_init,
>> +	.enable = vc4_hdmi_cec_adap_enable,
>> +	.log_addr = vc4_hdmi_cec_adap_log_addr,
>> +	.transmit = vc4_hdmi_cec_adap_transmit,
>> +};
> 
> Did you compile it? it looks like drm_connector_hdmi_cec_adapter_ops has been renamed, and it
> doesn't have a base.unregister field anymore?

It seems, I've changed my build tree config and this got disabled. I'll 
make sure that it is enabled for the next iteration.

> 
> Maxime


-- 
With best wishes
Dmitry
