Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C774718A6A7
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750806111; cv=none; b=qMUqjA1OfV1EmKeDubf2doTepzplcIC7iZRyhhEAG565y2x5y1WcV1ZXGVoLiAmUradnGAJjv1Bs571Zf9ZTLxd5Dh6je+9PtCIycCQdJDYqrAGJXcObgJcanL9j/lJ1WOAVlEetUm+1X8bqgS/k1OMunZ4C/OnH7Mt97nnPqjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750806111; c=relaxed/simple;
	bh=skPMQQhVgy3pzhQOpPxLAARHXISiG/mywqmRIBrGIqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kABYlwO9LjsLFTyfm5Lhk7E8fXCk66WOnK+rRmxz8T45rIPxtv9UGtIH/1ZAnyre3pmLW7us39cy7bJldODE7HNc7szVw5wDzSEVsmzCDZCbAfDdCLyGn/Zv1ttpRjtkE9FsY4KxfXxeXfpRbTxJsDJX0LEsnIj3XwINcFLqcdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzhoyKlO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzhoyKlO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OF1M9h020784
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwlCE4yW5vlEsSV+FkTFfzpjifM+g7PyFZcUvFH9qi8=; b=GzhoyKlOWDmOHYEF
	slqUboFPpz+GhhzaUAz54ivGoo88pyhpE/om0UFmnJxmsjVqVKiLvBJCFAbGRx6L
	LbMYA3WJuJB085sYv+1wfr/sR1fZje6jCoyAIwRqNwo9U31mfpJle+4FXViW+n8R
	JOdpIZ3HPyl41eiTWtzi9We84lYujK1xLmUsJa7gmZWKs8++wv+p14GAiV1I5Zeb
	2QB6ENWbxCQw3oBpujAxTBJQhZuHAECbaUMisHh0UmdAdS1TavJg5tZEPVnVbo4f
	PoinY8msZkHXtzqC4u3nTcl8MIvg/Zl2GxEVo12+/8Q+KRLTj1x+k2U03dOiP2ka
	YH9OMg==
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3wpdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:01:48 +0000 (GMT)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86d0aa2dc99so479741939f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750806107; x=1751410907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwlCE4yW5vlEsSV+FkTFfzpjifM+g7PyFZcUvFH9qi8=;
        b=VxXIlf89HNdlDpDRz4/NIbjC5V8gfus4oUDo64XGstR0LlSGt3fvY+JjBxt9szOT2J
         SdzmRqocHg52qzz8F6Vt0/1+Y8j/K287/WPhmoo1xkYw45SCXzmGp9ykahcae+RdnIJY
         43FsWPu1vbW7z+8b5bDHM7XMHWHg4S4BrWLZ5VdLaiAeOZsqMd9IKkyzbvc7HL6Xnret
         fpRgHaTJ0aTqJwZeU6pdFG58jrHE/Pqmldj7JUCoFV3L9E+EGVkfir+pjJ2c3NfyPZ3J
         WtbsZoHwkYN2SRVdfoGwH5d6vlKumYCuFVtytVy6ni5kjUIWs9lOJHcpwxqb+axbzssU
         6Y1A==
X-Forwarded-Encrypted: i=1; AJvYcCXVEg0CI2uyzRUViXhQFGOZ+6TyHla1PP2qrOai85hNrODpErHRDyHVW36ZJ7N2XDsLKExQ3ft5Jlza2CE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzstV0KHKY6oy7AW5K66AyWcRgsnV6Fk4HhNZhvJfrdnIz+Bbfd
	evUygciJuNRgcD5g2JG2OlwApmJavX827K7Pno6y235f08hLkH233gf8eNCuFHta8LdlEJ08o+B
	gM2RRmP6A07QilZWqUghM74ToIM8CBNlIIhtGoCOLuX4clbrUpJ5F0MC2bURyi3Akvm8=
X-Gm-Gg: ASbGncthoaurvhUu4ZebUTbBffBZ9g5rhLpPWcTsGWna2HHG7LmcC/4dZ8RQM40ZeRU
	DMhKCxxC8JRgld/sJ3haHv4ht2TXSGKuk9yChz+Lg5DFsEKRVIX+1UvbYSYg0raxG/dq8lq7lS8
	hsk3OnbjO7Mp9qnRWsLhqfv1WJhNcQmQFQG1l68gPkRLRN03FzwJW/vwJ5K6PWlQPvC8h0VeCYG
	APnVnrfwQ1oMbYLXzsAUsqatqx0DkNisd5zokycjE/lkMa2EtD1eEoYwB4Oshc9RWZ3fKQr7q8d
	yJMw99ifxAKvNf35Eb9qjZ3ZaOE6kqI1pQxF0LQRFQwcsD73OdO2CcnqaamPRDsfp9Zv1TWc2ip
	QGP10Lb1xj95dJYhhSDIUxVjO
X-Received: by 2002:a05:6e02:2285:b0:3df:2a3c:53e1 with SMTP id e9e14a558f8ab-3df32a1f475mr13610725ab.21.1750806107380;
        Tue, 24 Jun 2025 16:01:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAI9ilcnYIJuCqgRflshhJ+t1O8KYfJ9n7xTtHpVWRsIVwSO4vaowELkkrFwPI0xnOBsLZKA==
X-Received: by 2002:a05:6e02:2285:b0:3df:2a3c:53e1 with SMTP id e9e14a558f8ab-3df32a1f475mr13610125ab.21.1750806106916;
        Tue, 24 Jun 2025 16:01:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c37c4sm1974353e87.170.2025.06.24.16.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 16:01:46 -0700 (PDT)
Message-ID: <c887babc-4a6c-4f53-9501-1ae66cd25c51@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 02:01:45 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: pmic_glink: Add support for subsystem
 restart (SSR)
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624225535.2013141-1-anjelique.melendez@oss.qualcomm.com>
 <20250624225535.2013141-3-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250624225535.2013141-3-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MyBTYWx0ZWRfX6d4k8DdK2TFj
 OKRn+pMseld1vefwfrniI8bVV5iCb4OIuWLwZn6ZeEfM6Oq6RJVgdQ6EGhAinTQbmAr7kJZLGgg
 LHvsuAhbbSupFspE83XDf36/XLwOPK5kETJozsIqIWNC4LP3lz4JQ1YenWXRd2GG+/FOVQokJw8
 KsbRimsPcFhA7tJvc1wjmAcAaaCi9kxYEnQVyidMJQWGSt6iq9Ire3liAs+7Oo8m6i+p8tYZYly
 Qj1RHYVJ6syZZUsT3Tj6BbROb7P56/Y3JF7F1RuLyTk6HvdEsbhwx536jERDM0qJqCWnZ9P/w9M
 wPfjgY3fktmMFR8g5hW3RVxMWeoMXzYodhfw77s4LJQbeL2WrYAhBS0yluBNPq73UUj7Xxf7RMB
 bsLnQbCb1v8/6nUb9zLx7nH2aPzNtTuLxyAYYH1EbUUbSFpKAloTqh+sXIzp3Qd/VdlvPL8T
X-Proofpoint-ORIG-GUID: jf74RYKRQaMqXB56RVVvnvz-mpHDD4ul
X-Proofpoint-GUID: jf74RYKRQaMqXB56RVVvnvz-mpHDD4ul
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685b2e5c cx=c_pps
 a=x6q9Wowz3da5qcMoR2tSzg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=7Ilphcs5pd63uBFtIagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TsFzuV67ciA61D7d30EA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240183

On 25/06/2025 01:55, Anjelique Melendez wrote:
> Add support for PMIC Glink clients to receive notificiation when
> the subsystem goes down and comes up again.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>   drivers/soc/qcom/pmic_glink.c | 43 +++++++++++++++++++++++++++++++++--
>   1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index 0a6d325b195c..5121f19d63e5 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -2,6 +2,7 @@
>   /*
>    * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
>    * Copyright (c) 2022, Linaro Ltd
> + * ​​​​Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>    */
>   #include <linux/auxiliary_bus.h>
>   #include <linux/cleanup.h>
> @@ -9,6 +10,7 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> +#include <linux/remoteproc/qcom_rproc.h>
>   #include <linux/rpmsg.h>
>   #include <linux/slab.h>
>   #include <linux/soc/qcom/pdr.h>
> @@ -39,10 +41,14 @@ struct pmic_glink {
>   	struct mutex state_lock;
>   	unsigned int client_state;
>   	unsigned int pdr_state;
> +	unsigned int ssr_state;
>   
>   	/* serializing clients list updates */
>   	spinlock_t client_lock;
>   	struct list_head clients;
> +
> +	struct notifier_block ssr_nb;
> +	void *ssr_handle;
>   };
>   
>   static struct pmic_glink *__pmic_glink;
> @@ -205,10 +211,12 @@ static void pmic_glink_state_notify_clients(struct pmic_glink *pg)
>   	unsigned long flags;
>   
>   	if (pg->client_state != SERVREG_SERVICE_STATE_UP) {
> -		if (pg->pdr_state == SERVREG_SERVICE_STATE_UP && pg->ept)
> +		if ((pg->pdr_state == SERVREG_SERVICE_STATE_UP ||
> +		     pg->ssr_state == QCOM_SSR_AFTER_POWERUP) && pg->ept)

carriage return after &&

>   			new_state = SERVREG_SERVICE_STATE_UP;
>   	} else {
> -		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN || !pg->ept)
> +		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN ||
> +		    pg->ssr_state == QCOM_SSR_BEFORE_SHUTDOWN || !pg->ept)

carriage return after ||

>   			new_state = SERVREG_SERVICE_STATE_DOWN;
>   	}
>   
> @@ -231,6 +239,18 @@ static void pmic_glink_pdr_callback(int state, char *svc_path, void *priv)
>   	pmic_glink_state_notify_clients(pg);
>   }
>   
> +static int pmic_glink_ssr_callback(struct notifier_block *nb, unsigned long code, void *data)
> +{
> +	struct pmic_glink *pg = container_of(nb, struct pmic_glink, ssr_nb);
> +
> +	mutex_lock(&pg->state_lock);
> +	pg->ssr_state = code;
> +
> +	pmic_glink_state_notify_clients(pg);
> +	mutex_unlock(&pg->state_lock);
> +	return 0;
> +}
> +
>   static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
>   {
>   	struct pmic_glink *pg;
> @@ -281,6 +301,7 @@ static struct rpmsg_driver pmic_glink_rpmsg_driver = {
>   static int pmic_glink_probe(struct platform_device *pdev)
>   {
>   	const unsigned long *match_data;
> +	const char *subsys_name = NULL;
>   	struct pdr_service *service;
>   	struct pmic_glink *pg;
>   	int ret;
> @@ -333,6 +354,22 @@ static int pmic_glink_probe(struct platform_device *pdev)
>   		goto out_release_aux_devices;
>   	}
>   
> +	if (device_property_present(&pdev->dev, "qcom,subsys-name")) {
> +		device_property_read_string(&pdev->dev, "qcom,subsys-name", &subsys_name);

No need to read it from DT. Use a static value here.
If it differs from platform to platform, then add it to platform data 
and select it depending on the compat string.

> +		if (!subsys_name) {
> +			ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->ssr_handle),
> +					"failed to read subsys_name string from dt\n");
> +			goto out_release_aux_devices;
> +		}
> +		pg->ssr_nb.notifier_call = pmic_glink_ssr_callback;
> +		pg->ssr_handle = qcom_register_ssr_notifier(subsys_name, &pg->ssr_nb);
> +		if (IS_ERR(pg->ssr_handle)) {
> +			ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->ssr_handle),
> +					"failed adding ssr notifier\n");
> +			goto out_release_aux_devices;
> +		}
> +	}
> +
>   	mutex_lock(&__pmic_glink_lock);
>   	__pmic_glink = pg;
>   	mutex_unlock(&__pmic_glink_lock);
> @@ -360,6 +397,8 @@ static void pmic_glink_remove(struct platform_device *pdev)
>   
>   	pdr_handle_release(pg->pdr);
>   
> +	if (pg->ssr_handle)
> +		qcom_unregister_ssr_notifier(pg->ssr_handle, &pg->ssr_nb);
>   	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
>   		pmic_glink_del_aux_device(pg, &pg->ps_aux);
>   	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))


-- 
With best wishes
Dmitry
