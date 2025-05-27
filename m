Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2492882D9
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748374457; cv=none; b=aJQ0XAElSGtB01n++o5piZGmWIqE9gFWPCMNmKcowQbjuI9scm83501BJ4zMKdqU15bvnTqNQ+g68kLbgfWrxhER0xU+2RMuBuaDE5AAofRTkgT06exVOTszwlc5b2hCgEpyGUSbbBY1iGI2oMEQD3RoKXqMwUrUdsBsYR4je9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748374457; c=relaxed/simple;
	bh=Gim1EvixO2KOD3fkcQcxzVOp9jQUWY6RRDvJDoEk5ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfaN4rPWzZ4p6kJYwjxmSkQ4aSq0+r1UirpxTU6ZHDvlqKqr7tZGhHwe5vjbusP1RR+nbFtAtF16DlaLJL4o4nebrAEJDn+Qxw3cqKmsxhbYLWf3dp4NekoylsLLHjp6QLfn4KEF222uaPZ9PJABl7rKGEKLwz4qwT/iz0/D/XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7KOfxMG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7KOfxMG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RA16Zr003699
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUJvkp2j6OioUYbp/N/L2xk2T6fTsVqGyrhvt5RQDrA=; b=f7KOfxMGfgVUsHGT
	k2dwXfNH0XREBIwF7qzgvSVgAHFz67XTm2Mw1M634Zh258+1wRvsZfr9cDhJE8wz
	erUPKCCCgqYcu20wCSiAjO9EztP6/zc073AU3XS3g3TKzIunrL81t7IOmnt6VkpX
	izg0cisgcw4JW3arrcNzzM1AzyjU4Y9vIYOzaSf3qeWzm6bhajscxxGttiJU3+VR
	P1Y9LgiNmThHUITWLY3bQnyjqcBXXtfBBE8gMRJLxbfwOulcZ8XntKditXw2WODY
	KBR08kN0yTX02L37UsWP8U3aKqwUugU4rdqn5IrBToQnYruB5s5JPfspwx/x0Ahc
	40fPFA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq86a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:34:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6faabeb105fso30884566d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748374453; x=1748979253;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUJvkp2j6OioUYbp/N/L2xk2T6fTsVqGyrhvt5RQDrA=;
        b=P1jWHWHwm3X2D21nVKXYAbn8wo9ptlSY72/8Eu33+vuHZakczYdgH4ILFCWE0y2MGV
         U+kY5DUsLi7hgVjB9bAMKXLb1er18/RIdbajilv/YwhQXj1a0f+coPxNQTc8G1NjECDP
         2+XjX18OAtrL9KRXoR47rF0Kms3zHLZx0ykPGKPNY9ozQXDI0f41168vOKSl2cp2Y3o6
         i6QKU3OE/wWtzqCmxL8MuoecMOiAYTsO2/vWgw4hPmSODp09PBl67e3hdaLO6zvSuYo5
         aVSRSFw1r03QCmKMFJxw0KL8e/+w1q6+3YzpScpBof4pZCWhtzyx/I1nrJTdeDsQwucQ
         g0gw==
X-Forwarded-Encrypted: i=1; AJvYcCWkwWYSCjQUiwGeOYsVWj7vjOhuPRUVVWkrcOHWl7pUJHMqM74a3nghxZUywKYcXJqMq/ffBqd+6nS7puQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxz/GaNB2ELM0lF4fuoySibCMBoga4SwrXUqn/jC1fKJtHx81/
	awD9zcAtYukbEpkw+FRYKaw0uWc26psoboyKsToPSTwNNknsGgtWHVXQWvOeYrNzIT21uFHL5LH
	yYMgevc3uDuZ1jj04PGCE2UueiMUAd/xUOQvhRhXxvD/h+EZqziog5gE0JAWLvZ5hpcg=
X-Gm-Gg: ASbGncv4UYTHG089iphwCk6Lm3uzDS1WRI+AfRJrI82goSSZBLBlyHsZcY2HWuzNWh2
	InRrEyGhm9Rbkwdbn50RUWyzm5dSKN7MFtt2jZwIYajLqcY8XOPp2iemYoeR04g+nQ+6ZHO/i+c
	UdUaJ7vqL3xmihwwktgFWO+angAbWaJ6ipbLinmwcNcPa0ImSTPQYAojITKzNx8f9JJD28nv4ek
	O8nLfL45DPeCAjQ/3P8Flba9gc9lSKYmBzLzTo8GMpDbXbrkYeK8eimvjO5aCvSpoSXbLGF3z1j
	HIORI9W2DZYNh3BW03Rt1iTkblwT5uQdOIyoL/say1GIcVf+GRUjEmmjyQZHcoZjRfNLh8vAaZM
	=
X-Received: by 2002:ad4:5f0c:0:b0:6fa:ba71:9851 with SMTP id 6a1803df08f44-6faba719f3cmr24651936d6.34.1748374453322;
        Tue, 27 May 2025 12:34:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVjlh7IJ1HPf8/Ye4KqMKhjhW+XesLiSZ6cwya1THWS+oCZUq91KslQK5TLzdgt+AXUqmiwA==
X-Received: by 2002:ad4:5f0c:0:b0:6fa:ba71:9851 with SMTP id 6a1803df08f44-6faba719f3cmr24651516d6.34.1748374452953;
        Tue, 27 May 2025 12:34:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b8f21sm52046441fa.81.2025.05.27.12.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 12:34:11 -0700 (PDT)
Date: Tue, 27 May 2025 22:34:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kornel =?utf-8?Q?Dul=C4=99ba?= <korneld@google.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com
Subject: Re: [PATCH] power: supply: qcom_battmgr: Report battery capacity
Message-ID: <oa5okg7i2s6s7pxm5tn6nnanazze5lnnre4vnwrhopn5s5hsil@vhh22j6b5cvq>
References: <20250527121807.3597061-1-korneld@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527121807.3597061-1-korneld@google.com>
X-Proofpoint-GUID: PcsswX0d4xYwu7I1YMCGOMbaKr4WzlLE
X-Proofpoint-ORIG-GUID: PcsswX0d4xYwu7I1YMCGOMbaKr4WzlLE
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=683613b6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=1XWaLZrsAAAA:8 a=P46Q_Kkv9e1Fnqp5vpcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE2NCBTYWx0ZWRfX2KKuMZUDgGpq
 jqLw3GnhmsKftB3wr8g8IeXKRq58ZGEHvTihFfjyGIBo27I8w26X1b93kufTWMKp4fxFtZ6kQFy
 +BCxBVmRJ/90gp5U4atA3iM0em4xDN+6o5rbbNH69IBzBnbCZaaUj9lX3bVuj2FNjGEv2yNkL+z
 oXD75APfSook05VEK2QmcvpYmQ4bJslQz9DOZxxxRk5mR1URtsCS+iJdunr4Fa37PcL8hLCdwgU
 aV3O1IIRuk6K3sZZNld8u1pqITjr4ArxTnIjAR+WHBEagfG4XCfGpsKa/IMLgIZ8OCNFGAVmkr3
 2TOqDInBI/TGPqcrvxf0/bElHjxZU0qd1/ologhUd4u2DbK3/jNod6+K0mjgPcF1tPmj7/P+h6j
 mxkBc4VNkM19qkwYoPy1fuLmXmIqTr88PSOK32oiEjRT+sIb3JfHL8nJ3Tdn3AaLWdDeNIu5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270164

On Tue, May 27, 2025 at 12:18:07PM +0000, Kornel Dulęba wrote:
> Battery charge can be reported in several different ways. One of them is
> is charge percentage referred to as POWER_SUPPLY_PROP_CAPACITY in the
> power supply API. Currently the driver reports the capacity in this way
> on SM8350, but not on the newer variants referred to as SC8280XP in the
> driver. Although this is not a bug in itself, not reporting the
> percentage can confuse some userspace consumers.
> Mimic what is done in the ACPI driver (drivers/acpi/battery.c) and
> calculate the percentage capacity by dividing the current charge value
> by the full charge. Both values are expressed in either uWh, or
> in uAh.
> 
> Signed-off-by: Kornel Dulęba <korneld@google.com>
> ---
>  drivers/power/supply/qcom_battmgr.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index fe27676fbc7c..5ed5452ab51c 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -577,6 +577,8 @@ static int qcom_battmgr_bat_get_property(struct power_supply *psy,
>  		val->intval = battmgr->status.capacity;
>  		break;
>  	case POWER_SUPPLY_PROP_CAPACITY:
> +		if (battmgr->status.percent == (unsigned int)-1)
> +			return -ENODATA;
>  		val->intval = battmgr->status.percent;
>  		break;
>  	case POWER_SUPPLY_PROP_TEMP:
> @@ -617,6 +619,7 @@ static const enum power_supply_property sc8280xp_bat_props[] = {
>  	POWER_SUPPLY_PROP_STATUS,
>  	POWER_SUPPLY_PROP_PRESENT,
>  	POWER_SUPPLY_PROP_TECHNOLOGY,
> +	POWER_SUPPLY_PROP_CAPACITY,
>  	POWER_SUPPLY_PROP_CYCLE_COUNT,
>  	POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
>  	POWER_SUPPLY_PROP_VOLTAGE_NOW,
> @@ -1063,6 +1066,21 @@ static void qcom_battmgr_sc8280xp_callback(struct qcom_battmgr *battmgr,
>  		battmgr->ac.online = source == BATTMGR_CHARGING_SOURCE_AC;
>  		battmgr->usb.online = source == BATTMGR_CHARGING_SOURCE_USB;
>  		battmgr->wireless.online = source == BATTMGR_CHARGING_SOURCE_WIRELESS;
> +		if (battmgr->info.last_full_capacity != 0) {
> +			/*
> +			 * 100 * battmgr->status.capacity can overflow a 32bit
> +			 * unsigned integer. Do a temporary cast to avoid that.
> +			 */
> +			battmgr->status.percent =
> +				(uint64_t)100 * battmgr->status.capacity /
> +				battmgr->info.last_full_capacity;

Can you use mult_frac(), preventing the overflow?

> +		} else {
> +			/*
> +			 * Let the sysfs handler know no data is available at
> +			 * this time.
> +			 */
> +			battmgr->status.percent = (unsigned int)-1;
> +		}
>  		break;
>  	case BATTMGR_BAT_DISCHARGE_TIME:
>  		battmgr->status.discharge_time = le32_to_cpu(resp->time);
> -- 
> 2.49.0.1151.ga128411c76-goog
> 

-- 
With best wishes
Dmitry
