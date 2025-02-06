Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E742248AB
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738829860; cv=none; b=cZ/9EdVlsd8E42FcvUdNSBCXx8OYHFLj2R6aha96E61KcW1Lm5wwAK9ZXG6pI5Q41N9QprRTEm6e8FLS99ptuo/gcKqi/mKZRmdDlXUexeLmU+ZWrrlouO9+RJoDNcuQtgyKiKvgiVUymGTqKLOPNAKwTxSo2FzKwKFHkUkE+NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738829860; c=relaxed/simple;
	bh=3HlInxqa9GSbi/1OlZqZP+HyZ0fLB9r84J9XN/0AbV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UZvQl8x+81GK89WO7VPccaW1h0daNODiosinH76EpDXacxTqkEqkTdErNVN6Ii/2id/tSrMVN+uuvqUbnmK/ZhVzmml7Of8rqn+5x1Wa3JobkufPQNn4HLJnIfO6E3leOkQXKUaUnsDtm7H0wXE2fL3kEHyXwh60B/4cIEHj0ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WJHT/uJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WJHT/uJb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5167xh7A006173;
	Thu, 6 Feb 2025 08:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yua/USW/1aj6iciF4+Quq99t1aTQP9ob76c3VlC+xvw=; b=WJHT/uJbrpihI1nw
	pjHS4zPZEe4DarYaNYknkNe7YKL4SUSncUUlml4yf60l2pze0tQJ7MfU4ObgxpAV
	20P2AHEYOHDw5aaRNxCPnM4R9dUNhvJeTo8wf5m2EpX84myDGqjyFocKQN3nea62
	5JtLh53dMosy2r/nF8ONR4b1aiVcXD8x/luq+RDok4XkKLszWaPj6L11ZqW7O2c7
	oLzAdqniP1jXnsYo8hjsRHBrjnaZ/doUeqq3W2/aJhlLxaYfi2IqFGPF2A3QZLUY
	BNljcQPkcc0d3QZ7Gwlo6ffbxZjx6YcKp1kARe6xgO04doF80hmy9FDx+c/kwm3Z
	OwmK6g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mp648f6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 08:17:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5168HQe2004233
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 08:17:26 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 00:17:21 -0800
Message-ID: <bc44f10b-eafa-4f18-9d3c-b81dda0051a7@quicinc.com>
Date: Thu, 6 Feb 2025 16:17:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight-tmc: stop disabling tmc when flush timeout
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <kernel@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250103-fix_cpu_hung-v1-1-a7b9b3893d44@quicinc.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250103-fix_cpu_hung-v1-1-a7b9b3893d44@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gStDnVDkp0XwBq6GiCK5c8mJPJPRzO1A
X-Proofpoint-ORIG-GUID: gStDnVDkp0XwBq6GiCK5c8mJPJPRzO1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=909 mlxscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060067



On 1/3/2025 4:01 PM, Yuanfang Zhang wrote:
> When multiple ETMs are enabled simultaneously, the time required
> to complete a flush in the process of reading the TMC device node
> may exceed the default wait time of 100us. If the TMC capture is
> stopped while any ETM has not completed its flush, it can cause
> the corresponding CPU to hang.
> Fix the by checking the TMCReady bit after the flush. If TMCReady
> bit is set, TraceCaptEn bit can be clear; otherwise, return directly
> and stop the TMC read.
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  drivers/hwtracing/coresight/coresight-tmc-etf.c | 17 +++++++++++++++--
>  drivers/hwtracing/coresight/coresight-tmc-etr.c | 22 +++++++++++++++++-----
>  2 files changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index d4f641cd9de69488fe3d1c1dc9b5a9eafb55ed59..bded290c42891d782344d9a6e63ebdbed6719133 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -80,11 +80,21 @@ static void tmc_etb_dump_hw(struct tmc_drvdata *drvdata)
>  	return;
>  }
>  
> -static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> +static int __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>  {
> +	int rc;
> +
>  	CS_UNLOCK(drvdata->base);
>  
>  	tmc_flush_and_stop(drvdata);
> +
> +	rc = tmc_wait_for_tmcready(drvdata);
> +	if (rc) {
> +		dev_err(&drvdata->csdev->dev,
> +			"Failed to disable : TMC is not ready\n");
> +		CS_LOCK(drvdata->base);
> +		return rc;
> +	}
>  	/*
>  	 * When operating in sysFS mode the content of the buffer needs to be
>  	 * read before the TMC is disabled.
> @@ -94,6 +104,7 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>  	tmc_disable_hw(drvdata);
>  
>  	CS_LOCK(drvdata->base);
> +	return 0;
>  }
>  
>  static void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> @@ -650,7 +661,9 @@ int tmc_read_prepare_etb(struct tmc_drvdata *drvdata)
>  			ret = -EINVAL;
>  			goto out;
>  		}
> -		__tmc_etb_disable_hw(drvdata);
> +		ret = __tmc_etb_disable_hw(drvdata);
> +		if (ret)
> +			goto out;
>  	}
>  
>  	drvdata->reading = true;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index a48bb85d0e7f44a25b813f3c828cc3d705d16012..63a1f7501562fa0b5c2fe6ea53dce4d82842bec3 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1135,11 +1135,21 @@ static void tmc_etr_sync_sysfs_buf(struct tmc_drvdata *drvdata)
>  	}
>  }
>  
> -static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> +static int __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>  {
> +	int rc;
> +
>  	CS_UNLOCK(drvdata->base);
>  
>  	tmc_flush_and_stop(drvdata);
> +
> +	rc = tmc_wait_for_tmcready(drvdata);
> +	if (rc) {
> +		dev_err(&drvdata->csdev->dev,
> +			"Failed to disable : TMC is not ready\n");
> +		CS_LOCK(drvdata->base);
> +		return rc;
> +	}
>  	/*
>  	 * When operating in sysFS mode the content of the buffer needs to be
>  	 * read before the TMC is disabled.
> @@ -1150,7 +1160,7 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>  	tmc_disable_hw(drvdata);
>  
>  	CS_LOCK(drvdata->base);
> -
> +	return 0;
>  }
>  
>  void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> @@ -1779,9 +1789,11 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>  	}
>  
>  	/* Disable the TMC if we are trying to read from a running session. */
> -	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
> -		__tmc_etr_disable_hw(drvdata);
> -
> +	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
> +		ret = __tmc_etr_disable_hw(drvdata);
> +		if (ret)
> +			goto out;
> +	}
>  	drvdata->reading = true;
>  out:
>  	spin_unlock_irqrestore(&drvdata->spinlock, flags);
> 
> ---
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> change-id: 20250103-fix_cpu_hung-b5a95179ada4
> 
> Best regards,

gently reminder.

