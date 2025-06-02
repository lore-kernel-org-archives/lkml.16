Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E993F81720
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 06:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748845034; cv=none; b=jtvYKWkNgYOFD8pDWnNlv1O7+YuR15cFE9sEGvpfIid2doZuEBYR0hr1L/yqvUWRjVjjh8SBtoGcZT3vkNSy4iV2GIhEEopuc1Y+/h8mtyY+1EVMzY59OI2hvTwjVhLFNWqI5AqcBFNJUaUJaXV7J0hdQ9q2egfXcCXkJYevjns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748845034; c=relaxed/simple;
	bh=xdoLc9XoaXK8M0XbS9PhopfYff7oTgRwR4OLTqlt5Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NprPLjd8mKJv9PUph+BASylJQTmXQ5q0DewP6ovUE98iEjaL04SBInUaPsCpdz56oMOKtio4ZkOSxzGuT6ZG8LW9WAVqz90PGHYOw6/51ZBDyv0uGEzyggQBjGtmVGlQXgmybSA+0xkn32SNo3TbKNtmZTdTwQqZMlPzyecFw/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTIcvhB3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTIcvhB3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5521jPH8018560
	for <linux-kernel@vger.kernel.org>; Mon, 2 Jun 2025 06:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2KsyhDG7BdkTTvHo4/rBMgEo
	RCi0WrKaizdzWoGZ+sc=; b=HTIcvhB3RPxriA+15Gfp6+IwwllYm5luw6HAwP61
	rTz4vIOi+lsgOoEP23Bx9SjOi+VbU809Dw/ynYYs2D7D58dtp+gTsaHq2rlWMOJR
	AysKL2+lxR2ZrlYe6q34I5cy3o4luLk71qF9ryrMXpq+A1xZnMVEd5/ryhWtpSKI
	o7IjS0CpcmPqADUCGK663uzdLv2yCiBcYObUCQYUm1yvx0KNfBUDrGAtQYx2ZH4+
	BQh1tv5Ch7pZa73RmW0PykqWSuN5n8YPrp/Q4V5nQM8OW4UKI1b5TWUNePqQvnDf
	hXfC4GU/FRRGlrca0QNR8uB4/jf9X0Q9PcWvyxs3/XsTAQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yu2a3heg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:17:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a42c569a9aso77526991cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 23:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748845029; x=1749449829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KsyhDG7BdkTTvHo4/rBMgEoRCi0WrKaizdzWoGZ+sc=;
        b=HBHtCX6TG7TEDrlGd61IuellpWL6jMsMKyIpm5XN6mC5AmbMP3o4/CrZhXBx6tByVa
         GtSGFYENj18dN4Sfeiv80hkFxuP6owHhlRysPrFdV5cXOrAr3MF0B34SzMvLDCD2I92T
         Yrckd2q/teo2fLaRqcL2eegPmtzKSzD+NqzRZdGlECL/3v3hkiNCu/KItzFc6wBrnb0/
         OwUtjvJvMMvNcIsLibPh/SAb5nvo84tN+yiAtHAojPBvf6uhEhl2aQG37To/EuGORPOw
         F5n2YBI49TB5P4Hvwnv2l7ykc2ygaH1r4XE0452I+H8kXB0WMcwergiZhq05K1Bmu16O
         SpYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAoAi7Wtn0SLZxYO0wTDvIwXxECm/Lta2Qw9aqYzidG2CiJYD493E+nP2O8e/7YSaJq4V1yTmTDJkLXS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb9JkLMPZfbrogxxMkqCC86Rl4aynqDJOd3wJ/pwSUTacjdwjK
	+OfPeLyxKqX5RxdEgFcsCQJcZrNfkX4WAib6IqyPhVE98rtE/ceO7+Wp0v4Y8Fm/W7eNaas8ouo
	WPyOE/Ws+x47PB+YRFm39O+rn3qLAKTia8CWx0onCzoUIGA1NFfjHhLt1f45Za8Uje7s=
X-Gm-Gg: ASbGncsAzCLhFpPEbutkm8JF4Nmr2Tbtl3GG3+JpRUEsAZ78SDYjqStvCrsyeqrb0fp
	8LUSNuB6ANBPkjl5v9geRU82nBgULoaiuOXK27GXfPzLh7WR66k1yFDba15PjUf7KbgxGlnD/LS
	k5jH51f9PaLgRyylXk1jUEr+ZCmG8HyKhlmQogBBzJtytO1uEbaeoNcLztfqR6+2Mm/KnHn7Xrm
	EhdRooe6+gQVG+KbXvL4U/gz+XfmIN/+pfnLo2ob2lpQzjHGN3MRHQdBR7eukZKdMz0Qw7+wFBY
	MxMJWM3bk/dOUVJFP/+c7Kxe4GSn1PNI2dDCIxlQdQEnbhvFc9a9HUouHjkwQCOKYWjGyoWk9Eo
	=
X-Received: by 2002:a05:620a:24c7:b0:7cb:de0d:ba59 with SMTP id af79cd13be357-7d09879d98dmr2538881585a.17.1748845029569;
        Sun, 01 Jun 2025 23:17:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSdGsGDCqj3qNFWw0eKZ+nQWqakHUuPqz0KDPEOWNeJVqgCsioBRM8H9Z1LzwjXuRTHL7kyw==
X-Received: by 2002:a05:620a:24c7:b0:7cb:de0d:ba59 with SMTP id af79cd13be357-7d09879d98dmr2538878885a.17.1748845029212;
        Sun, 01 Jun 2025 23:17:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337937786sm1489417e87.227.2025.06.01.23.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:17:08 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:17:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fenglin.wu@oss.qualcomm.com
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/8] power: supply: core: Add state_of_health power
 supply property
Message-ID: <6oixvnhihgjucqaovkayzm6cpi35jfmtwmm67wa6h4nlmhr6w5@ggb7auvjzos2>
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-2-9e377193a656@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-qcom_battmgr_update-v2-2-9e377193a656@oss.qualcomm.com>
X-Proofpoint-GUID: GWXPLsfGoOaDvIthgDOXerpMBOlI_H3P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA1MiBTYWx0ZWRfXxqT3PA2qp/5W
 qG08rHmn4WdrLB+Aon/4b/sxfdYnUbLFCxN8S994/YcHOADcJWLchdjsMymb1q9PsfnOus0eFDy
 DzyLVHN7H5qYlRouIhJts6ND1maarZSJSzQv4Gi5N5ZQZnEVkJfOFezbYrcpm+FPSIjbaN8NuEd
 JhhHertKE3OVW0sjapJKPldIU5Zv1in/G1rFFEacPGj4HwhuyvMIK/wf+mqGZdsaA4Y0v0IajxF
 gOSYR+oeiN/BAQJKHb18UOI1E9pORfTOsUI1kfEQ3O6SnmYAHVCXv9WzaG2vbPlBbanvS8AhlPj
 FKTpHoUta5yJFpbZeZBQ6hqsB9wgHhA35oHvNuqKrY/p9OPaYYhF7EAa4sixggsyCy8bBzdQ60B
 JLSMKWNntUE4gKUaKN4MVTtBhCrFGdTx4OXb6X5JuNiDBs7k7e6QCW40QcYNJxkxei3a/Xqz
X-Proofpoint-ORIG-GUID: GWXPLsfGoOaDvIthgDOXerpMBOlI_H3P
X-Authority-Analysis: v=2.4 cv=WYIMa1hX c=1 sm=1 tr=0 ts=683d41e6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=EyRF99YuA1x6hCxG0qEA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506020052

On Fri, May 30, 2025 at 03:35:07PM +0800, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Add state_of_health power supply property to represent battery
> health percentage.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/ABI/testing/sysfs-class-power | 10 ++++++++++
>  drivers/power/supply/power_supply_sysfs.c   |  1 +
>  include/linux/power_supply.h                |  1 +
>  3 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
> index 22a565a6a1c509461b8c483e12975295765121d6..74e0d4d67467500c3cd62da3ae0b2e4a67e77680 100644
> --- a/Documentation/ABI/testing/sysfs-class-power
> +++ b/Documentation/ABI/testing/sysfs-class-power
> @@ -562,6 +562,16 @@ Description:
>  
>  		Valid values: Represented in microohms
>  
> +What:		/sys/class/power_supply/<supply_name>/state_of_health
> +Date:		May 2025
> +Contact:	linux-arm-msm@vger.kernel.org
> +Description:
> +		Reports battery power supply state of health in percentage.
> +
> +		Access: Read
> +
> +		Valid values: 0 - 100 (percent)

What does it mean that battery has 77% of health?

> +
>  **USB Properties**
>  
>  What:		/sys/class/power_supply/<supply_name>/input_current_limit
> diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/supply/power_supply_sysfs.c
> index dd829148eb6fda5dcd7eab53fc70f99081763714..12af0d0398822ff23d8970f6bdc8e3ef68081a1d 100644
> --- a/drivers/power/supply/power_supply_sysfs.c
> +++ b/drivers/power/supply/power_supply_sysfs.c
> @@ -221,6 +221,7 @@ static struct power_supply_attr power_supply_attrs[] __ro_after_init = {
>  	POWER_SUPPLY_ATTR(MANUFACTURE_MONTH),
>  	POWER_SUPPLY_ATTR(MANUFACTURE_DAY),
>  	POWER_SUPPLY_ATTR(RESISTANCE),
> +	POWER_SUPPLY_ATTR(STATE_OF_HEALTH),
>  	/* Properties of type `const char *' */
>  	POWER_SUPPLY_ATTR(MODEL_NAME),
>  	POWER_SUPPLY_ATTR(MANUFACTURER),
> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
> index de3e88810e322546470b21258913abc7707c86a7..dd0108940231352ac6c6f0fa962d1ea904d81c7a 100644
> --- a/include/linux/power_supply.h
> +++ b/include/linux/power_supply.h
> @@ -175,6 +175,7 @@ enum power_supply_property {
>  	POWER_SUPPLY_PROP_MANUFACTURE_MONTH,
>  	POWER_SUPPLY_PROP_MANUFACTURE_DAY,
>  	POWER_SUPPLY_PROP_RESISTANCE,
> +	POWER_SUPPLY_PROP_STATE_OF_HEALTH,
>  	/* Properties of type `const char *' */
>  	POWER_SUPPLY_PROP_MODEL_NAME,
>  	POWER_SUPPLY_PROP_MANUFACTURER,
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
