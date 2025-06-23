Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA0552F88
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750657688; cv=none; b=VxUv2sFo8iGn8MVXyhBny+g6OJyARqiVGsPVA/ADSoERyL2CuB9/nGElp1qgvy6LJDuauXMdT0RP2a078KIqODxyuebWzSCrs63ElLj6zJhxd44mOQHH5qncNiQlvhFOISpVhfFYVkZwFe2euIui8VCo6TiBvD6/7ZL7omPZZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750657688; c=relaxed/simple;
	bh=jcobvtMnOdwvMr++5+Edh0qP8TMiLNj+23DbcExBTJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWG/V9K54pXDPxtg6Jwl5/nKI2xvtRVDLY8EiE1HPjP2T0cvjcMXTV3M6WOC985Fusr5Zx8MqYDK3LDj/HSY08BfNudNXEI5P+iKdDjjVp9qHi+EfPflrj3e5cbLhQ61L2rXE323oZh1jggqgb/2SaWFOSOwlgjnfY5f1Wy0GtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0A8jkrz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0A8jkrz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N4dRZE014502
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AbRJoTOYKERrFGee5+m1f/UpxEvLfzCKtE0Xi3HsgBY=; b=g0A8jkrzO4qrnQLM
	ur2jp0lVHsZ3m+NsBFlXQUfYHvBHvFvKdMlZE5SxwmDXTtY7Pga/l8yYFXS19kER
	XeVHhHIIhBYRGbCXV+1HE/z1p6IYrbVXVw/a8GQsXXVrbptRoZ+peIJLE0reHaGM
	wcgtch78UbikbzfUcEOJ4r7qSiHQS/7DzC2n6+DoezF31O9b62j091BlBkonDmRJ
	DA+KrvzKYpM1/4fPwUzR7gJ7jIcuCxvZy28gi6j+Tu8SRyJwCeFx3f287dA083xd
	bl9aDfkMiCI2vu2QG3sjULQ40onhz9LuMac2n3C2AxRSJsIy8aLhNt5OL1M7IqiT
	AReOAw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f03b04ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:48:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748b4d5c045so2991761b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750657685; x=1751262485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbRJoTOYKERrFGee5+m1f/UpxEvLfzCKtE0Xi3HsgBY=;
        b=wa5R9sy7Vsz0ZOvs5jn10O7xebcaEg+LtTVHX3uEGpX0KqtzlMf1etofOVSpG0XsrB
         H3mAhGW8cGZxouWBXOX2i4EWgqtsrXPgnQOgVfc41Dq+41YFLBSCpUUfTTbu2K3lRnRj
         BYqIHIHyNtPIfoYtfnb1IDJa0YPmb0PpDV99birN1ofThWOGYCZx6lMDKn8bEnCSp3cr
         QPcPL/LKzh4xfCO9BPHLcTeRZ6cNoIts+hngltCJI/X3YhQuVzY3FfJz3GThatbann15
         61qU39gzB7RKHLiIILL4a1nwN3S5OZnivS3jaKyDYR7xNGmNjBUFqhI5Um6KPJP6ekxb
         QDUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtpHWrdwNkUJzkbni9DSVfpzr2B+V/iSVf1txkgR3fSsPS15bGDi+JLHg8jYXsZYQ/cEGf0ki9bDCGn7g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3fub+mxrx53QbHNmYUIhKAZn4TjQIeAz/9GPoQsIacFBm6Xa7
	C+n9pmeN9pP96g/E1FE0C/bt64e1u4liw8N0NSW4aEKWzIBAyiXv4377dT7lbRIdOi//rvYwE0a
	ERmos2WWV40XqdrAifzaBIIAP+V9VtqUPffBsuOrOAHzOGu2COtFSjfFcmjYfPQncL3ZHgNc/dB
	o=
X-Gm-Gg: ASbGncs1YEApODC8qCwTlL/+yil+dMv2fM7F0Leu3JlXFX7I6fnJK/9i/cLhT4Bqz3W
	UqDNkqdjfwUkq1ZoaUAw0PwhRn8XKpgOawLbW53pp/Ki+HhO0PQs0qNiCAAm1ogLgK5jWB2mivL
	UkbIm6Rbc0uPTBXqybqQPb1yBQXitI23aNIsG4RDTz20hblgsGZbYe1Rk67PvLu/bSRieCaxh/8
	j1ZqJgTPCbD38pC3Y0rtfnOBXUBBFV2F6AY4TA5jCaMBVoEbyD/ryfXLhkTr1LHjaNbrdd/axG2
	BfnYgsnnlvy8RWleziBanI7zBL/0aCspXIL5uuIe6Dcb97QmVA==
X-Received: by 2002:a05:6a00:3a0a:b0:73d:fa54:afb9 with SMTP id d2e1a72fcca58-7490d786d97mr15265924b3a.7.1750657684729;
        Sun, 22 Jun 2025 22:48:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXRjqJm5/CswjVpQ1SX8DoINTW14oKg+/CbEGNXmoJMAhb4MElgHRu4lGa6+EVzvmOQIyCew==
X-Received: by 2002:a05:6a00:3a0a:b0:73d:fa54:afb9 with SMTP id d2e1a72fcca58-7490d786d97mr15265900b3a.7.1750657684221;
        Sun, 22 Jun 2025 22:48:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a48a1b6sm7676218b3a.50.2025.06.22.22.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 22:48:03 -0700 (PDT)
Date: Mon, 23 Jun 2025 11:18:00 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinmux: fix race causing mux_owner NULL with active
 mux_usecount
Message-ID: <aFjqkMxNPT7cZAgK@hu-mojha-hyd.qualcomm.com>
References: <20250620164324.3616153-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620164324.3616153-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: qk7thhu4ayvXn5P-hPT-HW45ybKJpVkx
X-Proofpoint-GUID: qk7thhu4ayvXn5P-hPT-HW45ybKJpVkx
X-Authority-Analysis: v=2.4 cv=CPUqXQrD c=1 sm=1 tr=0 ts=6858ea95 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KXfMyb82C9iuoBlzvdcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAzMiBTYWx0ZWRfX+1Pzu4vHdC5o
 t8Y8+A3PttJfpMdU1fxeYt7KozZgEJSk3fyx9/H4ccg23njCEapIgrfvcBA3sAMtru12X45ibCB
 vJPxl7UFI31JFE/mj5GCARcpEYTyS7M938Mmp2WRowFjDLL4TgwkODG96oeaITgOMSgTzaXU02x
 fqH9JufGO5wPKR6ThGqJiHLHqEwa8h6hDkNfnVPZBJ4FCx0yVWNLnaWE/ngrZgccXL36PqREM7I
 SnpReXVprOPzlgbK6TQkwH9jSnXW8uGIKDbFjbEyFDW37QS1DZCv9PAv3hWxsIrN+q8bKHEYnxH
 XJabkT02W1wd5JMFs/UpU0xsQdffjSIh6ZcEGLvLoVprMMccJQ2+fSdTjeiahvG5qEOBEdBTjz0
 X6P8l0jCpQoUdN7eFnVL9pMEn474D2ZuqoaEbuC7bxDC6vfs8GgjTtJ2PtlQyNtlKb1NUzio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230032

On Fri, Jun 20, 2025 at 10:13:24PM +0530, Mukesh Ojha wrote:
> Commit  ("pinmux: Use sequential access to access desc->pinmux data")

commit 5a3e85c3c397 ("pinmux: Use sequential access to access desc->pinmux data") 

> tried to address the issue when two client of the same gpio calls
> pinctrl_select_state() for the same functionality, was resulting in
> NULL pointer issue while accessing desc->mux_owner. However, issue
> was not completely fixed due to the way it was handled and it can
> still result in the same NULL pointer.
> 
> The issue occurs due to the following interleaving:
> 
>      cpu0 (process A)                   cpu1 (process B)
> 
>       pin_request() {                   pin_free() {
> 
>                                          mutex_lock()
>                                          desc->mux_usecount--; //becomes 0
>                                          ..
>                                          mutex_unlock()
> 
>   mutex_lock(desc->mux)
>   desc->mux_usecount++; // becomes 1
>   desc->mux_owner = owner;
>   mutex_unlock(desc->mux)
> 
>                                          mutex_lock(desc->mux)
>                                          desc->mux_owner = NULL;
>                                          mutex_unlock(desc->mux)
> 
> This sequence leads to a state where the pin appears to be in use
> (`mux_usecount == 1`) but has no owner (`mux_owner == NULL`), which can
> cause NULL pointer on next pin_request on the same pin.
> 
> Ensure that updates to mux_usecount and mux_owner are performed
> atomically under the same lock. Only clear mux_owner when mux_usecount
> reaches zero and no new owner has been assigned.
>

Fixes: 5a3e85c3c397 ("pinmux: Use sequential access to access desc->pinmux data")

I missed adding the commit SHA and the 'Fixes' tag. However, I’ll wait before sending the next version.

-Mukesh

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/pinctrl/pinmux.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index 0743190da59e..1cea04d57ca2 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -235,19 +235,9 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
>  			desc->mux_usecount--;
>  			if (desc->mux_usecount)
>  				return NULL;
> -		}
> -	}
>  
> -	/*
> -	 * If there is no kind of request function for the pin we just assume
> -	 * we got it by default and proceed.
> -	 */
> -	if (gpio_range && ops->gpio_disable_free)
> -		ops->gpio_disable_free(pctldev, gpio_range, pin);
> -	else if (ops->free)
> -		ops->free(pctldev, pin);
> +		}
>  
> -	scoped_guard(mutex, &desc->mux_lock) {
>  		if (gpio_range) {
>  			owner = desc->gpio_owner;
>  			desc->gpio_owner = NULL;
> @@ -258,6 +248,15 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
>  		}
>  	}
>  
> +	/*
> +	 * If there is no kind of request function for the pin we just assume
> +	 * we got it by default and proceed.
> +	 */
> +	if (gpio_range && ops->gpio_disable_free)
> +		ops->gpio_disable_free(pctldev, gpio_range, pin);
> +	else if (ops->free)
> +		ops->free(pctldev, pin);
> +
>  	module_put(pctldev->owner);
>  
>  	return owner;
> -- 
> 2.34.1
> 
