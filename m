Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF1F1C3BEE
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 17:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738432515; cv=none; b=sty01/+DRHFSMYxAudgc9zFCa/2Vnh1mY321IhT3jfJrC7TXrA/SDAuyZKHWz2fhK7tyTG23jlDWd3tiGhM3H/qvQqdn0PMIzI+/sOoeKN2unsThZlHx4lTPtytifz0iqziDJllgVRMSVR2R2rYGZSxf616tJUv52Q9uTi7JCuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738432515; c=relaxed/simple;
	bh=iAYd0ZRjxDAI453ejd39UbthqVqoJ/XIVz+LaYar7z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NtqGMBd+gzILZNTf5WKULQcb00ymNpKF/JRlPnY/dP9hZEear0AFSkb5eLk9vWuYJGlI9+dDv//ISXuwiTXC1MNwr0Uc666V8LnO3o29Jc1WjTK2Pw+y+g9IjJb5YyrF21amfAjK1Dx5pjoHwvhunMy129I3JGxpAXUH1jfPB4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jXoDGRTi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jXoDGRTi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5115xrtQ002238;
	Sat, 1 Feb 2025 17:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q1Ixnaw0RZ/JySh7ZUdddiddm1Ud/HVfBrMZmPOAIUo=; b=jXoDGRTiBXOlBgqy
	w7gA1nKgBjovfCRhqLPQX1QoMm3+53donMdpGEWiK27Oj5dI85XG054cyUz7pJla
	ePmlO/CK6WhaI7LQxMod8r1izOA9z5Ogownu5Oaa0UsXgXNJ6cO9Oiy5ApaphyfX
	WGv9MBywVSAhIaRVZho+/cvluQLv5S2sNShcgpEPH3QQIq3K2ZZYQ7BVPRVeSsD7
	V0adc5b5MeBB5WR1+GV3ewTAV/Cgy/Z3526YtkYT5PEd1qtEN1uGEZ+l/wE8fegZ
	eKuFHvzTYSXgzdhWLnsrd1ssTxlDl3Aqn1kV9L+UZE0nnDBOb0+HmyK85PpBPlKj
	d6x8lA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd6a989y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Feb 2025 17:54:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 511HswlI031371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 1 Feb 2025 17:54:58 GMT
Received: from [10.216.35.42] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 1 Feb 2025
 09:54:55 -0800
Message-ID: <e09b50b8-dd65-4636-aa35-42efc86bba16@quicinc.com>
Date: Sat, 1 Feb 2025 23:24:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i3c: Add basic HDR support
To: Frank Li <Frank.Li@nxp.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Conor Culhane <conor.culhane@silvaco.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>
References: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
 <20250129-i3c_ddr-v1-1-028a7a5d4324@nxp.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250129-i3c_ddr-v1-1-028a7a5d4324@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xEH_uXuCIbNJp35C4EFl8PmKqkdkjCAu
X-Proofpoint-GUID: xEH_uXuCIbNJp35C4EFl8PmKqkdkjCAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502010154

Hi Frank,

On 1/30/2025 1:35 AM, Frank Li wrote:
> I3C HDR requires enter/exit patterns during each I3C transfer. Add a new
> API i3c_device_do_priv_xfers_mode(). The existing
> i3c_device_do_priv_xfers() now calls i3c_device_do_priv_xfers_mode(I3C_SDR)
> to maintain backward compatibility.
> 
> Introduce a 'cmd' field in 'struct i3c_priv_xfer', using an anonymous union
> with 'rnw' since HDR mode relies on read/write commands instead of the
> 'rnw' bit in the address as in SDR mode.
> 
> Add a priv_xfers_mode callback for I3C master drivers. If priv_xfers_mode
> is not implemented, fallback to SDR mode using the existing priv_xfers
> callback.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Why not add hdr mode in struct i3c_priv_xfer because mode can't be mixed in
> one i3c transfer. for example, can't send a HDR follow one SDR between
> START and STOP.
> 
Is it wise to add two function inside main funcion and separate SDR vs 
HDR ? so we don't need to change current function arguments.
> i3c_priv_xfer should be treat as whole i3c transactions. If user want send
> HDR follow SDR, should be call i3c_device_do_priv_xfers_mode() twice,
> instead put into a big i3c_priv_xfer[n].
> ---
>   drivers/i3c/device.c       | 19 +++++++++++++------
>   drivers/i3c/internals.h    |  2 +-
>   drivers/i3c/master.c       |  8 +++++++-
>   include/linux/i3c/device.h | 12 +++++++++++-
>   include/linux/i3c/master.h |  3 +++
>   5 files changed, 35 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index e80e487569146..e3db3a6a9e4f6 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -15,12 +15,13 @@
>   #include "internals.h"
>   
>   /**
> - * i3c_device_do_priv_xfers() - do I3C SDR private transfers directed to a
> - *				specific device
> + * i3c_device_do_priv_xfers_mode() - do I3C SDR private transfers directed to a
> + *				     specific device
>    *
>    * @dev: device with which the transfers should be done
>    * @xfers: array of transfers
>    * @nxfers: number of transfers
> + * @mode: transfer mode
>    *
>    * Initiate one or several private SDR transfers with @dev.
>    *
> @@ -32,9 +33,9 @@
>    *		    driver needs to resend the 'xfers' some time later.
>    *		    See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
>    */
> -int i3c_device_do_priv_xfers(struct i3c_device *dev,
> -			     struct i3c_priv_xfer *xfers,
> -			     int nxfers)
> +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> +				  struct i3c_priv_xfer *xfers,
> +				  int nxfers, enum i3c_hdr_mode mode)
why can't we pass mode as another structure member inside struct 
i3c_priv_xfer ? Adding function agrument parameter impacts existing drivers.
>   {
>   	int ret, i;
>   
> @@ -47,11 +48,17 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>   	}
>   
>   	i3c_bus_normaluse_lock(dev->bus);
> -	ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
> +	ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers, mode);
>   	i3c_bus_normaluse_unlock(dev->bus);
>   
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers_mode);
> +
> +int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c_priv_xfer *xfers, int nxfers)
> +{
> +	return i3c_device_do_priv_xfers_mode(dev, xfers, nxfers, I3C_SDR);
> +}
>   EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
>   
>   /**
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 433f6088b7cec..553edc9846ac0 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -16,7 +16,7 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
>   int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
>   int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>   				 struct i3c_priv_xfer *xfers,
> -				 int nxfers);
> +				 int nxfers, enum i3c_hdr_mode mode);
>   int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
>   int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
>   int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index d5dc4180afbcf..67aaba0a38db2 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2945,7 +2945,7 @@ int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev)
>   
>   int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>   				 struct i3c_priv_xfer *xfers,
> -				 int nxfers)
> +				 int nxfers, enum i3c_hdr_mode mode)
>   {
>   	struct i3c_master_controller *master;
>   
> @@ -2956,9 +2956,15 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>   	if (!master || !xfers)
>   		return -EINVAL;
>   
> +	if (master->ops->priv_xfers_mode)
> +		return master->ops->priv_xfers_mode(dev, xfers, nxfers, mode);
> +
>   	if (!master->ops->priv_xfers)
>   		return -ENOTSUPP;
>   
> +	if (mode != I3C_SDR)
> +		return -EINVAL;
> +
>   	return master->ops->priv_xfers(dev, xfers, nxfers);
>   }
>   
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index b674f64d0822e..7ce70d0967e27 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -40,11 +40,13 @@ enum i3c_error_code {
>   
>   /**
>    * enum i3c_hdr_mode - HDR mode ids
> + * @I3C_SDR: SDR mode (NOT HDR mode)
>    * @I3C_HDR_DDR: DDR mode
>    * @I3C_HDR_TSP: TSP mode
>    * @I3C_HDR_TSL: TSL mode
>    */
>   enum i3c_hdr_mode {
> +	I3C_SDR,
>   	I3C_HDR_DDR,
>   	I3C_HDR_TSP,
>   	I3C_HDR_TSL,
> @@ -53,6 +55,7 @@ enum i3c_hdr_mode {
>   /**
>    * struct i3c_priv_xfer - I3C SDR private transfer
>    * @rnw: encodes the transfer direction. true for a read, false for a write
> + * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0x00 - 0x7f
>    * @len: transfer length in bytes of the transfer
>    * @actual_len: actual length in bytes are transferred by the controller
>    * @data: input/output buffer
> @@ -61,7 +64,10 @@ enum i3c_hdr_mode {
>    * @err: I3C error code
>    */
>   struct i3c_priv_xfer {
> -	u8 rnw;
> +	union {
> +		u8 rnw;
> +		u8 cmd;
> +	};
>   	u16 len;
>   	u16 actual_len;
>   	union {
> @@ -301,6 +307,10 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>   			     struct i3c_priv_xfer *xfers,
>   			     int nxfers);
>   
> +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> +				  struct i3c_priv_xfer *xfers,
> +				  int nxfers, enum i3c_hdr_mode mode);
> +
>   int i3c_device_do_setdasa(struct i3c_device *dev);
>   
>   void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 12d532b012c5a..352bd41139569 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -472,6 +472,9 @@ struct i3c_master_controller_ops {
>   	int (*priv_xfers)(struct i3c_dev_desc *dev,
>   			  struct i3c_priv_xfer *xfers,
>   			  int nxfers);
> +	int (*priv_xfers_mode)(struct i3c_dev_desc *dev,
> +			       struct i3c_priv_xfer *xfers,
> +			       int nxfers, enum i3c_hdr_mode mode);
>   	int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
>   	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
>   	int (*i2c_xfers)(struct i2c_dev_desc *dev,
> 

