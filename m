Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074D91E3DDE
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750503554; cv=none; b=uAEiLxYKNCpYmtmOQ3XS0bzcHSdIS2polSeHuZ7wXrwqVHJz+rh0yx5gW/M8XeC6tH+xj+x5162xH7N+OIeNDoJxC/rPrwsOdt0uM6I05hQymmoRzRMjEgOUdE8yfzjTeXPXlLpsHJoKSnhQ7Sc4O6lNAo5lJcSyHesKlT8PpOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750503554; c=relaxed/simple;
	bh=nqPHGc6IxdJYuT0HEunMktv6HOZGwSni846BeMR2FNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llSlXzA1Ncye0PPaa3ygf+6TO6KK8rwEiV7az5+PPUcWFJHHWb6Ns2CI6nplfd8kkLBwSnL9x6JOhorlNgMy1F5Cr643GLR8X/Yn78Px/pWU3m7Qf/XTWT5bRtUXNSfnq1FKRyPc6U06AntcGC629ezPFJFFkXKx+2q3Z3+aNY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnnCbqBG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnnCbqBG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LAIJcF007003
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJu0vDfnFIlGv+6UPtbMsm9Wx8p7s3T8XgSoL3eY7gk=; b=nnnCbqBG30tsqiKT
	rxEONDhfRNyvVfiiMWLu2caIdCDA/BogNNeBeSazhjDyjzuWrWH2GydyyhK1yv7P
	ZOulsgAqP9OycqnqQPjbT6Y0xRWBMWDG4AMqHQ4p/RXGMFOqhI5eKK3AKCQcgUJF
	9DdoYGmGUuKfbmHn1ipy5v/IcwRh/3hnSKldDamJo0u2LyQo7foYPCMftD4Vq88Y
	fIcaEZagztn2h4s6yQi/bvo0z1pQzZA3dkLK6Ddz3Z3oSns+NsiUgBBAlmIwUzD4
	lu/zZHUMu64UbiWXEcyPvYgZxHvungoyVS9+BHXcWFG6o/8/3Pu/8pS4O1RwFdVg
	3mizvA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dj3q0qx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:59:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fabbaa1937so5637816d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 03:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750503551; x=1751108351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJu0vDfnFIlGv+6UPtbMsm9Wx8p7s3T8XgSoL3eY7gk=;
        b=dfuMONLT8JOTxk+F9zoXUV/hzUMT475ge9fmRRf2Qkohs1vB+e3lTF+el8MNnMyAEI
         y5hbzmJu5IntDxc+XO44/9YE7KnGjeY02xdhlsFoPwIp+0QRRpkDF2KxaM7zlPsFyJ33
         hQRtUHRmFn2ETtPs2/DDVQ2PBpj7+3yVGukcng3w/euZdUGfXMHrNI+WkTfEM+yXpZop
         0YMEEOU4XQXPg1A/ObNtXB8c1yI8eokNSGDE8B9FntiXTjhiulAtyeYhRPUGJVwAIWaW
         8ey6eNlWKzSyikWMRVM6/C1BLGDRDxUk6PgENvA6lWjMtnnQznmr449jW/YprHd1uEM3
         nGzg==
X-Forwarded-Encrypted: i=1; AJvYcCWzrT3Wgg/7YM3VHHXYM7rmsM/aRJIP6FLMMsYL8dQvgSrBOpXi0n95S4b837ljS5EKkdqn/aCIb3bOpFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+GMlgI8KQjfOzQEsuW+Y3+o31XMfoebHaAAzNsobUyWjKvLXa
	+5Ig48eOMngH+Y9qyYJaXr8AMNUv1MiHuCXkaW6Zdc7K41MCtX89an9NOixbsog7eHjFNWtRvOM
	R2nJv6G1BVvO6qI+nEJ8TlbDcS2YZ+t11dtrh55R1nMrD78K0NZTOwvqSgXxfo4NoaKo=
X-Gm-Gg: ASbGncuhShKa9alGEsUq1XmuFvt3yvZI0wyeU/oNe+ZEWrIActInrDj2nUhP2ba3THM
	+lTyZ1yQ/qbZzVgW60vB/Cq5uiBPSok1gBC4lQ9EEIo22wGrSnVSjnAvD7qBmTyTPy5tHqCRWN5
	r3XNTBdGgdN4igCMexiArmh/UGnFZH5grFfz4W+XfkiFgA+W5ay0qZTeABTgVlwfJfwiR/kn0Jz
	MHcDR3x29RcCZ5b75mTiQ0e5jKnMLgghn5M3mYpgtDTaFfU3Df8k6LfHaFspTKQOMYFM19/ZngA
	32ClHg64WRiwbbW05xeT0eDjzUeI1QNywUEsKJSuvqrgQw5yEMt1gB3GaTN2Uc4U5oi77uSzcOt
	UjXA=
X-Received: by 2002:a05:620a:2906:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7d3f992add7mr319066285a.14.1750503550886;
        Sat, 21 Jun 2025 03:59:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJpkwoUFoHOu2ELn+GDPBiPW1tYbRNVtvUlgrBUVFvTAtiH+urFIRnU1wsUFc9nTYSYedKMQ==
X-Received: by 2002:a05:620a:2906:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7d3f992add7mr319065585a.14.1750503550407;
        Sat, 21 Jun 2025 03:59:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209ac4sm340467766b.169.2025.06.21.03.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:59:09 -0700 (PDT)
Message-ID: <61cffc10-3e05-4331-b967-6c01cc03d072@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:59:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] mmc: sdhci-msm: Ensure SD card power isn't ON when
 card removed
To: Sarthak Garg <quic_sartgarg@quicinc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250620090333.3068568-1-quic_sartgarg@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620090333.3068568-1-quic_sartgarg@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BPWzrEQG c=1 sm=1 tr=0 ts=6856907f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=S1aXf4WNfHwdmkjjbdsA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Nz-cmrDWBIZ-q7AxJOJCTQyAMcye5NCl
X-Proofpoint-GUID: Nz-cmrDWBIZ-q7AxJOJCTQyAMcye5NCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA2NCBTYWx0ZWRfX2OUbMYmswv09
 1G7fkkZQYhUPkV7dbwdgs0FVvBryF0WUoqpEGSVug1fYhtv9Ty5LIjCqOSmnw5t9/elyyXz56Jk
 Bwu7MhrnLCfp6tfR1drdKIExidgIDs7pdk1OYyzER2XMtJ4rn1qsGKqCnQeR/D+X4bty436CgXn
 thypHAP2YG07Rp/sLWj0NSb+xNJLsoY6N04mmrbLENsjxQ43OWjsXe0Q55vLbI80TfK//22DmgF
 tyCFyF9hJ09f1XmQzJ11/OudVyqAv7qrq+vcbBwM0pof4BPR40cfEyGtq8VrHa0T9DUsxi893mc
 lUi5GIDqcy42ciiw4DOeyOXeoMBNcclb/2zkr5ouzMzGM48UXoNZEqF3Q+ft1eVoBmhz4/qMpBT
 Fz9ShFnjCQD27UpJWDM+B36ofC6IMJRaL9YGy4rDUhzWHeNvINATNc2fLlb4NCU3TzlKaWqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506210064

On 6/20/25 11:03 AM, Sarthak Garg wrote:
> Make sure SD card power is not enabled when the card is
> being removed.
> On multi-card tray designs, the same card-tray would be used for SD
> card and SIM cards. If SD card is placed at the outermost location
> in the tray, then SIM card may come in contact with SD card power-
> supply while removing the tray. It may result in SIM damage.
> So in sdhci_msm_handle_pwr_irq we skip the BUS_ON request when the
> SD card is removed to be in consistent with the MGPI hardware fix to
> prevent any damage to the SIM card in case of mult-card tray designs.
> But we need to have a similar check in sdhci_msm_check_power_status to
> be in consistent with the sdhci_msm_handle_pwr_irq function.
> Also reset host->pwr and POWER_CONTROL register accordingly since we
> are not turning ON the power actually.

This is very difficult to parse. How about:

Many mobile phones feature multi-card tray designs, where the same
tray is used for both SD and SIM cards. If the SD card is placed
at the outermost location in the tray, the SIM card may come in
contact with SD card power-supply while removing the tray, possibly
resulting in SIM damage.

To prevent that, make sure the SD card is really inserted by reading
the Card Detect pin state. If it's not, turn off the power in
sdhci_msm_check_power_status() and set the BUS_FAIL power state on the
controller as part of pwr_irq handling.


(Now I don't know if this is a good fix as far as logic goes, but I'm
simply looking at the patch)

> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> ---
> Changes from v1:
> As per Adrian Hunter's comment :
> - Removed unrelated changes
> - Created a separate function get_cd for cleaner code
> - Used READ_ONCE when getting mmc->ops to handle card removal cases
> - Reordered if check conditions
> ---
>  drivers/mmc/host/sdhci-msm.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index bf91cb96a0ea..97a895d839c9 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1566,6 +1566,14 @@ static inline void sdhci_msm_complete_pwr_irq_wait(
>  	wake_up(&msm_host->pwr_irq_wait);
>  }
>  
> +static int get_cd(struct sdhci_host *host)
> +{
> +	struct mmc_host *mmc = host->mmc;
> +	const struct mmc_host_ops *mmc_ops = READ_ONCE(mmc->ops);

What do you need the READ_ONCE for?> +
> +	return mmc_ops && mmc->ops->get_cd ? mmc->ops->get_cd(mmc) : 0;

I think this op will always exist for our driver, since we call:

sdhci_msm_probe()
 -> sdhci_pltfm_init()
    -> sdhci_alloc_host()

which assigns:

host->mmc_host_ops = sdhci_ops;
mmc->ops = &host->mmc_host_ops;

which contains:

.get_cd         = sdhci_get_cd,

there's some more layers to this matryoshka, so I'm not a 100% sure

> +}
> +
>  /*
>   * sdhci_msm_check_power_status API should be called when registers writes
>   * which can toggle sdhci IO bus ON/OFF or change IO lines HIGH/LOW happens.
> @@ -1579,6 +1587,7 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct mmc_host *mmc = host->mmc;
>  	bool done = false;
>  	u32 val = SWITCHABLE_SIGNALING_VOLTAGE;
>  	const struct sdhci_msm_offset *msm_offset =
> @@ -1636,6 +1645,12 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
>  				 "%s: pwr_irq for req: (%d) timed out\n",
>  				 mmc_hostname(host->mmc), req_type);
>  	}
> +
> +	if ((req_type & REQ_BUS_ON) && mmc->card && !get_cd(host)) {
> +		sdhci_writeb(host, 0, SDHCI_POWER_CONTROL);
> +		host->pwr = 0;
> +	}
> +
>  	pr_debug("%s: %s: request %d done\n", mmc_hostname(host->mmc),
>  			__func__, req_type);
>  }
> @@ -1694,6 +1709,13 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>  		udelay(10);
>  	}
>  
> +	if ((irq_status & CORE_PWRCTL_BUS_ON) && mmc->card && !get_cd(host)) {
> +		irq_ack = CORE_PWRCTL_BUS_FAIL;
> +		msm_host_writel(msm_host, irq_ack, host,
> +				msm_offset->core_pwrctl_ctl);

Since you're dropping out if this function, you can pass the parameter
directly to msm_host_writel

Konrad
