Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C146AA7;
	Fri,  7 Feb 2025 02:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896916; cv=none; b=jKErdaS5d94+K7PYsK4N0aNI3ofUmc8ap3kVXtecax2WDoIJ46DpvjiaXtRQ6cUSAV+V+aTbJIckIuyL9fr9vrgk8lvxYXhDDz7O7AHOWAWBvRd8YiPCSBSDJCNitOHt0OQgiV/GFaXz2xAuFd6PJ8gvTkFW4zoBOTnO/0rqXjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896916; c=relaxed/simple;
	bh=jTYxBKOjdaWKZhzMUu31ksejdQODNYTAtLBcDx+4/tU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sAczn9NthkVj8tu4FnRLrzqMGjBQ2SasS3AqSwgD8eRhqSnFuLVb+fsuOifKteqXDUTE5b21O5aE9avd7J8q4vNFvgVh2HXwcL6xDiT73T5m+okrwP4THF/2C5XSclH6xKZ21NNpwlMq1XYg+dqlh/f6PQCQwUwmag2oNB7jypg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IhJMo2+0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IhJMo2+0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5171PU5m009392;
	Fri, 7 Feb 2025 02:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DT6q24hDlUwkGSH97IqJdPWETMBtLEuGKqkfKsbpEDU=; b=IhJMo2+0m1sxrgSa
	ayjeknUiaHqsAWF4wJW2WyMjDkjwdwXfo30G5IDh8IopFj178oaRUiZCjwfgjIc2
	+K24QirKrFu+JXN2w9ZjJpAekYamjEfIx/4o35g6bMHBi3elfXHxWFiQsWtc5ARI
	IqAM6oyCxV9eh3FbhkmK1gaS7sadC6LWkKSUA8QxJ5mPUgrQQnSvCBx4sab+2llc
	/DVOZZZON4esH8dwJ0XZRsBfCBSiTcw+Kel8lLxFF7fCFNjnSukwBJGnzLMoNyFs
	Pvd8C+c360z4QWEL1XhHfqorMX+P0WGtXYKqh+/ZznU0MOixNZ2YQ5jOk1BMTtyM
	oT5hjA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n1vs126a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 02:54:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5172siaJ020788
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 02:54:44 GMT
Received: from [10.133.33.5] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 18:54:40 -0800
Message-ID: <e9c3f622-0126-4cea-984c-29e77209ae30@quicinc.com>
Date: Fri, 7 Feb 2025 10:54:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] driver core: add a faux bus for use when a simple
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
References: <2025020620-skedaddle-olympics-1735@gregkh>
 <2025020623-chemo-amends-102a@gregkh>
Content-Language: en-US
From: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <2025020623-chemo-amends-102a@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6UecibHba5myjDbItQxb_pf9gOoDQuh7
X-Proofpoint-GUID: 6UecibHba5myjDbItQxb_pf9gOoDQuh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070021

On 2/7/2025 1:38 AM, Greg Kroah-Hartman wrote:
> +#include "base.h"
> +
> +#define MAX_FAUX_NAME_SIZE	256	/* Max size of a faux_device name */

Remove this macro?

> ++ */

<snip>

> +struct faux_device *faux_device_create_with_groups(const char *name,
> +						   const struct faux_device_ops *faux_ops,
> +						   const struct attribute_group **groups)
> +{
> +	struct device *dev;
> +	struct faux_object *faux_obj;
> +	struct faux_device *faux_dev;
> +	int name_size;

Remove @name_size?

> +	int ret;
> +
> +	name_size = strlen(name);
> +	if (name_size > MAX_FAUX_NAME_SIZE)
> +		return NULL;
> +

Remove above block related to @name_size

> +	faux_obj = kzalloc(sizeof(*faux_obj) + name_size + 1, GFP_KERNEL);

faux_obj = kzalloc(sizeof(*faux_obj), GFP_KERNEL);

> +	if (!faux_obj)
> +		return NULL;
> +
> +	/* Save off the callbacks so we can use them in the future */
> +	faux_obj->faux_ops = faux_ops;
> +
> +	/* Initialize the device portion and register it with the driver core */
> +	faux_dev = &faux_obj->faux_dev;
> +	dev = &faux_dev->dev;
> +
> +	device_initialize(dev);
> +	dev->release = faux_device_release;
> +	dev->parent = &faux_bus_root;
> +	dev->bus = &faux_bus_type;
> +	dev->groups = groups;
> +	dev_set_name(dev, "%s", name);
> +
> +	ret = device_add(dev);
> +	if (ret) {
> +		pr_err("%s: device_add for faux device '%s' failed with %d\n",
> +		       __func__, name, ret);
> +		put_device(dev);
> +		return NULL;
> +	}
> +
> +	return faux_dev;
> +}
> +EXPORT_SYMBOL_GPL(faux_device_create_with_groups);

<snip>

> ++int __init faux_bus_init(void)
> +{
> +	int ret;
> +
> +	ret = device_register(&faux_bus_root);
> +	if (ret) {
> +		put_device(&faux_bus_root);
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

return 0;

> +
> +error_driver:
> +	bus_unregister(&faux_bus_type);
> +
> +error_bus:
> +	device_unregister(&faux_bus_root);
> +	return ret;
> +}

<snip>
