Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0595221D94
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746790559; cv=none; b=mBc608NAnBnavbkCNOg0fGJG5ixG/+RWk98pJJr7a2a7gAKencbplNo/AQfcuJ4cE0Pa6b0Pn/KAeB4/MmV/JtqckDiJzNOciN/YSQ5Tj/aFrZR3G/GcUKgOpunbVL3HDybTq2fxQBMS2P5mkIu1Ga/AIUCq7yym4J8Wl+sePO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746790559; c=relaxed/simple;
	bh=b/ocDn60AZKD7DkQrGARHz1m4s5oOy4i/S4RjymqpjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dvgDlymbPnwhtGXccsmlbXA63UWaS9K04GBU25yI1RVVXlX61R5DqCzVVv90OkGlDCWNa7o+Och8r82gc9OAPB/1R0T6/9t+E3JYymhtV+TWW/tq/tHjPihKsEBdiEX+p+zMxKoMnQTw9q2Kwknz/LLpOH1NpS7XrcHlZWKslEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAD2UEUj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAD2UEUj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492jhCs002550
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 11:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clpGEQdwMWcHuVX1s2S+PQJLA4E0hBPTvMUFRssmFE4=; b=aAD2UEUjR0E5eUUc
	NtEkzdPATHCH3c90bsbbi4K5NgQftUd9kPGnopjSYTILXe1flpgQ/v0ieg7FHqZf
	G0cn7icUQiV8Jy6TzEM3nCs5aUz6AWV3wNXgit1O8deAK1dmq9c78Mu1SI/8zsNW
	p3aZEj2MwS8J5UDWtOVlC5nh38OEgFLMVwmevV9AEu/v0oVHJtLvhgQjc77439Xx
	l3Xq9SK/taKrJw8P8sFaVm20C9HKK/oThsATHMoe1o9uKQ3NT1dd93pJcKbaeshR
	Xq5lVFJ2CcXQr0GG3rFAK5v6906GY7UHzUxWyMZE+vPNtanuY8MACiiTtwk3CwCB
	B1Y1qQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5cfk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:35:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47983a580dbso4144091cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746790556; x=1747395356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clpGEQdwMWcHuVX1s2S+PQJLA4E0hBPTvMUFRssmFE4=;
        b=TXUQJ5Rko4plj7Ps+UUDuZ+ijYeqsMiq1F5GNwGsPTavraRQQFAV7RXgq2w+83yjaI
         /ktc9gIdUechjCslcBZCMhLcXiuzonnkU497Wzx4GYBvgF+rpR1vbWeEMpDUgp/hR+8N
         gaULpmIJmRQkAVi2XN63jvDlzBNJwOtmPk0wm1LEmM2sBp8gVB+zjVDeXyT3Kya3K7bn
         aSdUQesKQAL1KVnb9SVegV2B3IBoD7VGg7LhInqx8mDJn9NhkIRKo+/erPlWiVWtO2OJ
         XVyADN2NsTZOMhZCU+ZNpI3JVz0ZXwu8m/Rxc33oUPGsidteW1VFhh0Dhc96AI3z9DqN
         yAEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW87uzE0WJXkr8BznBdmtve2McIhz+8wb+I9yTbGtmaXwqVXcLspqVmN+WwXfqZ/lpZg1N8ynlE1cuw7js=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqKFzma1G3uTkBany5LPYNYDcMs3C2ppQSlw25WfgxTNsMp8Xk
	2rm2J6hXOTSk7NPux93InMGkFH0nzNGsMj6Va53RemTw7wGAC0s5SwXMjw/BTrVWhLOl95rYIa2
	6eRSNcPHsoWsW7oFGQ6zqPFLPSXS/RTbU+dZmNX6s1TXm9CfJJPQYXICBJLrV4+E=
X-Gm-Gg: ASbGncs+QA0EHai6CK+RwUL9p/tlkhKVOorUEeRzqCM5GqddX0m0MY1w/CzRvrW1S9I
	vfPC+Kp0dKPnAPE74ltBQzWfBp8m9+X29VwqvCFcZ6zk9/AGnDmDcAkMBUYTAwC9GT9tptI3/jb
	gFx8Cziy7I5ZZ4XFLSYcUl1rnAOYFHyTPqrtDYla5PeilMN6etecb1Zscvac9IqivZ6eAg0EXHr
	zZmM7XXv75rPj5/lLrTezNRAiG1Lhr2Mgx4b+zqpSCC38L6RQLcFXQjKoHYA2i802yuyEUEAn/t
	Gs2TpoMEPgMqf4xjO+O2VAuiEF0mQrEGInFWKC0cLcZmy97xcuepWgs/S7IQK1iqmL4=
X-Received: by 2002:ac8:5f49:0:b0:474:e213:7480 with SMTP id d75a77b69052e-494527f40dcmr13254041cf.15.1746790555652;
        Fri, 09 May 2025 04:35:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQrKt5+ENDzVyZIaPC6bM/I1w4UI11+gCCI1inxl4cHyjOu66kgARpVBcFs8jbdIp2WkVnDQ==
X-Received: by 2002:ac8:5f49:0:b0:474:e213:7480 with SMTP id d75a77b69052e-494527f40dcmr13253771cf.15.1746790555168;
        Fri, 09 May 2025 04:35:55 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21947b26bsm137062266b.86.2025.05.09.04.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 04:35:54 -0700 (PDT)
Message-ID: <780d84ca-4004-41ef-a9ae-17532053f8a5@oss.qualcomm.com>
Date: Fri, 9 May 2025 13:35:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 09/11] scsi: ufs: qcom : Refactor phy_power_on/off
 calls
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-10-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250503162440.2954-10-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681de89c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=ItZO8zVqQjmK9ylnveIA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NSp-msPP21ugFZOcY8OeooOz8LPmcpvz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDExMiBTYWx0ZWRfX3NPuIZybxxap
 p2+tH923uMzOhThsec61I2Nw4/SEzkxuZ9oufTvWdAogEdyK9ctt4+WhbZQpL7M1/jasoK3sGig
 GbRZ0Asttod3IXAmWcbZFIvo/b+sa2gXg1qc8ZndwhZo6+CMVxHluBJQmi4DvXQkS52E/6xWL7A
 qBcaDH9ntWzkxjUm52F2alHH9UMzoJgGpN+q2R9jSOiqvZwXxbJS35UBWstSozOed6i6iTyy582
 9e8FHIwwschwoNMCjYUCKDzyAsM9eHyG4f1DmdbM0Qq8jDsRNBeiJFQx2cLNlUu6CO/lu6BtAVg
 iYIRuN+lnGSbhBrOh0tHmULY+i7+BZZ4QzBW7bOXBTt8xonrsS40ifXMENE3DEjfiDePiH1EEa+
 6kQVFnTl81dMMt8Wn6ivXntYK64+xidHAgKn4FgXnGxEohzVIZN49lPdlHwbS6V2TJHCzAMM
X-Proofpoint-ORIG-GUID: NSp-msPP21ugFZOcY8OeooOz8LPmcpvz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090112

On 5/3/25 6:24 PM, Nitin Rawat wrote:
> Commit 3f6d1767b1a0 ("phy: ufs-qcom: Refactor all init steps into
> phy_poweron") removes the phy_power_on/off from ufs_qcom_setup_clocks
> to suspend/resume func.
> 
> To have a better power saving, remove the phy_power_on/off calls from
> resume/suspend path and put them back to ufs_qcom_setup_clocks, so that
> PHY regulators & clks can be turned on/off along with UFS's clocks.
> 
> Since phy phy_power_on is separated out from phy calibrate, make
> separate calls to phy_power_on and phy_calibrate calls from ufs qcom
> driver.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 55 ++++++++++++++++---------------------
>  1 file changed, 23 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 2cd44ee522b8..ff35cd15c72f 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -639,26 +639,17 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>  	enum ufs_notify_change_status status)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct phy *phy = host->generic_phy;
>  
>  	if (status == PRE_CHANGE)
>  		return 0;
>  
> -	if (ufs_qcom_is_link_off(hba)) {
> -		/*
> -		 * Disable the tx/rx lane symbol clocks before PHY is
> -		 * powered down as the PLL source should be disabled
> -		 * after downstream clocks are disabled.
> -		 */
> +	if (!ufs_qcom_is_link_active(hba))

so is_link_off and !is_link_active are not the same thing - this also allows
for disabling the resources when in hibern8/broken states - is that intended?

>  		ufs_qcom_disable_lane_clks(host);
> -		phy_power_off(phy);
>  
> -		/* reset the connected UFS device during power down */
> -		ufs_qcom_device_reset_ctrl(hba, true);
>  
> -	} else if (!ufs_qcom_is_link_active(hba)) {
> -		ufs_qcom_disable_lane_clks(host);
> -	}
> +	/* reset the connected UFS device during power down */
> +	if (ufs_qcom_is_link_off(hba) && host->device_reset)
> +		ufs_qcom_device_reset_ctrl(hba, true);

similarly this will not be allowed in hibern8/broken states now

>  
>  	return ufs_qcom_ice_suspend(host);
>  }
> @@ -666,26 +657,11 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>  static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct phy *phy = host->generic_phy;
>  	int err;
>  
> -	if (ufs_qcom_is_link_off(hba)) {
> -		err = phy_power_on(phy);
> -		if (err) {
> -			dev_err(hba->dev, "%s: failed PHY power on: %d\n",
> -				__func__, err);
> -			return err;
> -		}
> -
> -		err = ufs_qcom_enable_lane_clks(host);
> -		if (err)
> -			return err;
> -
> -	} else if (!ufs_qcom_is_link_active(hba)) {
> -		err = ufs_qcom_enable_lane_clks(host);
> -		if (err)
> -			return err;
> -	}
> +	err = ufs_qcom_enable_lane_clks(host);
> +	if (err)
> +		return err;
>  
>  	return ufs_qcom_ice_resume(host);
>  }
> @@ -1042,6 +1018,8 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  				 enum ufs_notify_change_status status)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct phy *phy = host->generic_phy;
> +	int err;
>  
>  	/*
>  	 * In case ufs_qcom_init() is not yet done, simply ignore.
> @@ -1060,10 +1038,22 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  				/* disable device ref_clk */
>  				ufs_qcom_dev_ref_clk_ctrl(host, false);
>  			}
> +			err = phy_power_off(phy);

a newline to separate the blocks would improve readability> +			if (err) {
> +				dev_err(hba->dev, "%s: phy power off failed, ret=%d\n",
> +					__func__, err);
> +					return err;

please indent the return statement a tab earlier so it doesn't look
like it's an argument to dev_err()

putting PHY calls in the function that promises to toggle clocks could
also use a comment, maybe extending the kerneldoc to say that certain
clocks come from the PHY so it needs to be managed together

Konrad
