Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086D8212FA6
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682223; cv=none; b=OMY/UBQouYi2iu6nnmYSbxlSRujBnrIribC6KRMBxaXj8ovr8QSqKgGNL6Ufw1y55X2vN8CPi57oNvKuV+/52efb5gMr6LQ2T3qEhN7Pui/6HoISwAcvhAfPw2WLATAg/fz74J9zmPsPvrsIl79gfCEde6fkomuAFJYDjgRIlak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682223; c=relaxed/simple;
	bh=xcNmWcNq3dlNbmcU4hF8FoUi16HAHXirv5VZScmYguU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q4YoQhSRbXG7vHgozsAw3TnkuBxigBBU0aEOkLnUdqnTWlPydjTqviqczBXkW0yuuC6CGNtST62F0Lsj57D45A3y6HvNVxGzCq90/VPWCmXws1BkUOHpFFQnxqsbX9BMl2ZRWYRS3b6WrZ1L4llO/yM/HsyhH3aFQROCnaeYEj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EhS1BkWy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EhS1BkWy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514BYSNb010392;
	Tue, 4 Feb 2025 15:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5r8czkbzYXVx26WYhM2Xu+E+zNDeBL7QBFVsOOc/Ex4=; b=EhS1BkWyoLO4trrb
	FeiQ9/svnWtDp1/cQateO6DSLxoXjq8RPmzNVGiBTMbJgrBoOvIou3LkKJfG43yL
	wPhwTHXa3nsKFY/vu2y9f4cd0hsSXQ4bN/tDIdnbbISTlcotyUxuFCanwA9EDmMi
	Lusm7LzHjBdMerk1Xz4S6fnESfmnYRDgegTdudYORkIX3RDzPS3L7IhpNujjkaY0
	hTctsUk45ifAtfaTlAxWDTPJciWaz0lf1Llwl8/82/b2KICBorR/AY/Y44pkrY6/
	QCaTo1+lIDnnxb5ny2dhJY5fb5K9vij/D8xpS6J+EKufrSqMXgx8chC2b5ZvJGi1
	y843Ag==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kj4yggxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 15:16:36 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 514FGZrH010144
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 15:16:35 GMT
Received: from [10.216.45.46] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 07:16:30 -0800
Message-ID: <3ff01e2c-fd48-40cd-b130-a515925418fb@quicinc.com>
Date: Tue, 4 Feb 2025 20:46:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i3c: mipi-i3c-hci: Use I2C DMA-safe api
To: Billy Tsai <billy_tsai@aspeedtech.com>, <alexandre.belloni@bootlin.com>,
        <pgaj@cadence.com>, <miquel.raynal@bootlin.com>,
        <conor.culhane@silvaco.com>, <aniketmaurya@google.com>,
        <Shyam-sundar.S-k@amd.com>, <jarkko.nikula@linux.intel.com>,
        <wsa+renesas@sang-engineering.com>, <xiaopei01@kylinos.cn>,
        <Guruvendra.Punugupati@amd.com>, <linux-i3c@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
 <20250204091702.4014466-2-billy_tsai@aspeedtech.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250204091702.4014466-2-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: z3AUbk5MKVla8EDbImzn-_JZx5NOdDAg
X-Proofpoint-GUID: z3AUbk5MKVla8EDbImzn-_JZx5NOdDAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_07,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040119

Looks good to me !

On 2/4/2025 2:47 PM, Billy Tsai wrote:
> Use the i2c_get/put_dma_safe_msg_buf for I2C transfers instead of using
> the I3C-specific API.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/core.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index a408feac3e9e..4f3738beb0f2 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -382,14 +382,11 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>   		return -ENOMEM;
>   
>   	for (i = 0; i < nxfers; i++) {
> -		xfer[i].data = i2c_xfers[i].buf;
> +		xfer[i].data = i2c_get_dma_safe_msg_buf(&i2c_xfers[i], 1);
>   		xfer[i].data_len = i2c_xfers[i].len;
>   		xfer[i].rnw = i2c_xfers[i].flags & I2C_M_RD;
>   		hci->cmd->prep_i2c_xfer(hci, dev, &xfer[i]);
>   		xfer[i].cmd_desc[0] |= CMD_0_ROC;
> -		ret = i3c_hci_alloc_safe_xfer_buf(hci, &xfer[i]);
> -		if (ret)
> -			goto out;
>   	}
>   	last = i - 1;
>   	xfer[last].cmd_desc[0] |= CMD_0_TOC;
> @@ -412,7 +409,8 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>   
>   out:
>   	for (i = 0; i < nxfers; i++)
> -		i3c_hci_free_safe_xfer_buf(hci, &xfer[i]);
> +		i2c_put_dma_safe_msg_buf(xfer[i].data, &i2c_xfers[i],
> +					 ret ? false : true);
>   
>   	hci_free_xfer(xfer, nxfers);
>   	return ret;

