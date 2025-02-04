Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEAA212D7A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682201; cv=none; b=cmBsQ/Ln724GtH3Ld3gADLIqJBJSuR++7dLcEgopDpPr3VPU3I+UG3EbX3tBMflHJM05rWMbAVbdWHbRoiaZVtadX6LQmkpKPaSELfrNnpgKlHhQ89vpsYCkagVvEkazLlHhjK6NSWHp3/MwZy/Ijb+xrJMyJSFNhD+O6RazKc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682201; c=relaxed/simple;
	bh=d2Q6lXTYW3wyATxt8SL0Uz5iNqgRs2KXi4XYvExqdgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Jy8BxQRaj/LeuXCn7ZknzO8QM7cVqTNlizRLL+9vIdhye5boqu6LUSlum4H3I1zggXn8DedQLrC96OFCs5XxMaprLSq1eyGWf0Bv7wXZHfRb9ZbD6WySj4vZttK2qIZIa6pswZviXhVQecAUi68uda7f7rQxQ6NSRB9v9mGNTOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NDODuhSA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NDODuhSA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5149BuwU006732;
	Tue, 4 Feb 2025 15:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BV92Osq6Yf4bGuJQ2OUcnHKxHNVRgDh8ERHA6WUJTTc=; b=NDODuhSAY/xmZ0Er
	Vzr7W6RB5th+Zh9aL2InuFuk3gDL2ljkUOADkGFCYjo/2S3pgYwYxUzlk9bWYtSF
	K9XXq7dMGo4taZQllAq8uVh2d7Pj7J2DZgud/CysZNXggkjPX0jUjnkr7ntciVI8
	2Pbw3NKVzvrv4Ougguidek5K2+PEMZRzKVqBa+iWoeNQwLBXIDYJTncE1k8THpmA
	rLDu5m/la4TEI7InyLg9Ay/TlSPQv341sBg2D6+NZ0H28muv6TPLgfHeeyIuX+l1
	nqSOdb7QzBuFwQXFZxvWQrf9TP2NdJlymfkby1qAStVuMQLXnpaEL8ld7/dXtwVy
	g/epqQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kg1yrv4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 15:16:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 514FG8oE007947
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 15:16:08 GMT
Received: from [10.216.45.46] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 07:16:03 -0800
Message-ID: <d5b5e501-1f5d-4c13-8895-48f473283f87@quicinc.com>
Date: Tue, 4 Feb 2025 20:45:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
To: Billy Tsai <billy_tsai@aspeedtech.com>, <alexandre.belloni@bootlin.com>,
        <pgaj@cadence.com>, <miquel.raynal@bootlin.com>,
        <conor.culhane@silvaco.com>, <aniketmaurya@google.com>,
        <Shyam-sundar.S-k@amd.com>, <jarkko.nikula@linux.intel.com>,
        <wsa+renesas@sang-engineering.com>, <xiaopei01@kylinos.cn>,
        <Guruvendra.Punugupati@amd.com>, <linux-i3c@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: anrQXYwG6pT68Z4AWlvkOP_jnPRv-OiM
X-Proofpoint-GUID: anrQXYwG6pT68Z4AWlvkOP_jnPRv-OiM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_07,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040118

Looks good to me.

On 1/21/2025 4:37 PM, Billy Tsai wrote:
> The change is necessary to enable the use of the
> `i2c_get_dma_safe_msg_buf()` API, which requires a non-const
> `struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` function
> ensures safe handling of I2C messages when using DMA, making it essential
> for scenarios where DMA transfers are involved. By removing the `const`
> qualifier, this patch allows drivers to prepare and manage DMA-safe
> buffers directly.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>   drivers/i3c/master/dw-i3c-master.c     | 2 +-
>   drivers/i3c/master/i3c-master-cdns.c   | 2 +-
>   drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
>   drivers/i3c/master/svc-i3c-master.c    | 2 +-
>   include/linux/i3c/master.h             | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d09ea5b6467c..54c7d86997d5 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1079,7 +1079,7 @@ static void dw_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
>   }
>   
>   static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> -				   const struct i2c_msg *i2c_xfers,
> +				   struct i2c_msg *i2c_xfers,
>   				   int i2c_nxfers)
>   {
>   	struct dw_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 8d69a34986d9..c9e4c129454c 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -813,7 +813,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
>   }
>   
>   static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> -				     const struct i2c_msg *xfers, int nxfers)
> +				     struct i2c_msg *xfers, int nxfers)
>   {
>   	struct i3c_master_controller *m = i2c_dev_get_master(dev);
>   	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index e6e482a259b4..a408feac3e9e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -367,7 +367,7 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
>   }
>   
>   static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
> -			     const struct i2c_msg *i2c_xfers, int nxfers)
> +			     struct i2c_msg *i2c_xfers, int nxfers)
>   {
>   	struct i3c_master_controller *m = i2c_dev_get_master(dev);
>   	struct i3c_hci *hci = to_i3c_hci(m);
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index c1ee3828e7ee..24bd701b5de0 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1584,7 +1584,7 @@ static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
>   }
>   
>   static int svc_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> -				    const struct i2c_msg *xfers,
> +				    struct i2c_msg *xfers,
>   				    int nxfers)
>   {
>   	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 12d532b012c5..c67922ece617 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -475,7 +475,7 @@ struct i3c_master_controller_ops {
>   	int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
>   	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
>   	int (*i2c_xfers)(struct i2c_dev_desc *dev,
> -			 const struct i2c_msg *xfers, int nxfers);
> +			 struct i2c_msg *xfers, int nxfers);
>   	int (*request_ibi)(struct i3c_dev_desc *dev,
>   			   const struct i3c_ibi_setup *req);
>   	void (*free_ibi)(struct i3c_dev_desc *dev);

