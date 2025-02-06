Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1999D1EDA36;
	Thu,  6 Feb 2025 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856112; cv=none; b=feuIqtOEkL3xXeel65PkxcSNJ5/ir1T0piGVPp8StaOFDc6izq9COyXga81BF00H+/V8NtjEQFTLz3cradJyukNpeFMFT6PBpdZ1g8a5vxeDBajZsNeOxIHG5ezCfwq8ilejTc1z41SxrHH/gTDesFrXfwTMNJjzPX0NhoLXLas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856112; c=relaxed/simple;
	bh=mckJ4ALqUn1Xz1k3xEpjN2B3Zmwg6s/C1dHNZnvmMMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XEoXlK3/7OBddok+JANusklt5NBFGrQS+B5L48Ywir/vbp+RPZqnASzBGPMcXnTBGvJdiDU8wPEDb7Hacw51erV/3/feave4HVYayOzea25igpp0gBsRfFvmKFn5zUvaO5PF99izuEyfPoyaSTK1u3oh/nqQ5YQ5Qrenek81XcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fjd/2C/z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fjd/2C/z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516A3b1T017647;
	Thu, 6 Feb 2025 15:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvhWNC12VrMqer5dai+D859xEFCg6y6u+tFtQX48Y8s=; b=Fjd/2C/zjfwnG5Vk
	DmG5mHLc3+T0guTWYO/kJJqpKecbmuQFgovSgPOjsq2c8xt5qt9imS2R+tjasxBf
	LTrbfJ7ekXV5YX0AUJiWdyOI/Xcdwg1D/2Nb1V6O8p6zTwGNvUan/xOuU0NLu+aX
	LjAMM0xq/5qBuJdDjXv7vaBrx2uMY92O0qJ+NXm1fBDoZ13jAmExFfiE5Sekko3E
	wrO3fracGcGeoaHXAv5jmnQJ1TQcwyeYCCtjS87NW5IcngS9oOk49KffdQsCRGnJ
	jMeAdeawCt1RSKNdd0m8zAn+qAdVqpTlC82tYD2kYq/wXULEl+Au4DH6XmWDuc7M
	NKo6CQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mu0drtf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 15:34:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516FYYo9006406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 15:34:34 GMT
Received: from [10.133.33.51] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 07:34:30 -0800
Message-ID: <f575978b-7103-48b9-8125-a38fb6425f5c@quicinc.com>
Date: Thu, 6 Feb 2025 23:34:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] driver core: add a faux bus for use when a simple
 device/bus is needed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>
CC: Alexander Lobakin <aleksander.lobakin@intel.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
        Mark Brown
	<broonie@kernel.org>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
        Robin Murphy <robin.murphy@arm.com>,
        Simona Vetter <simona.vetter@ffwll.ch>, <linux-usb@vger.kernel.org>,
        <rust-for-linux@vger.kernel.org>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
Content-Language: en-US
From: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <2025020424-retrain-recharger-407c@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DxvlvtnwDXdCwDfNxiHitJl6R4ukt8WB
X-Proofpoint-ORIG-GUID: DxvlvtnwDXdCwDfNxiHitJl6R4ukt8WB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060126

On 2/4/2025 7:09 PM, Greg Kroah-Hartman wrote:
> +#define MAX_NAME_SIZE	256	/* Max size of a faux_device name */
> +
> +/*
> + * Internal wrapper structure so we can hold the memory
> + * for the driver and the name string of the faux device.
> + */
> +struct faux_object {
> +	struct faux_device faux_dev;
> +	const struct faux_driver_ops *faux_ops;
> +	char name[];

Remove name since it is not used actually ?

> +};+ */
> +void faux_device_destroy(struct faux_device *faux_dev)
> +{
> +	struct device *dev = &faux_dev->dev;
> +
> +	if (IS_ERR_OR_NULL(faux_dev))
> +		return;
> +

struct device *dev;

//faux_device_create() does not return ERR_PTR().
if (!faux_dev)
	return;

// avoid NULL pointer dereference in case of above error
dev = &faux_dev->dev;

> +	device_del(dev);
> +
> +	/* The final put_device() will clean up the driver we created for this device. */
> +	put_device(dev);

use device_unregister() instead of above 2 statements?

> +}
> +EXPORT_SYMBOL_GPL(faux_device_destroy);
> +
> +int __init faux_bus_init(void)
> +{
> +	int ret;
> +
> +	ret = device_register(&faux_bus_root);
> +	if (ret) {
> +		put_device(&faux_bus_root);

put_device() for static device may trigger below warning:

drivers/base/core.c:device_release():
WARN(1, KERN_ERR "Device '%s' does not have a release() function, it is
broken and must be fixed. See Documentation/core-api/kobject.rst.\n",
			dev_name(dev));
> +		return ret;
> +	}
> +
> +	ret = bus_register(&faux_bus_type);
> +	if (ret)
> +		goto error_bus;
> +


> +	ret = driver_register(&faux_driver);
> +	if (ret)
> +		goto error_driver;
> +
> +	return ret;
> +
> +error_driver:
> +	bus_unregister(&faux_bus_type);
> +
> +error_bus:
> +	device_unregister(&faux_bus_root);
> +	return ret;
> +}

