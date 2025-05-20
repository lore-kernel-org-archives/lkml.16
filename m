Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6AA25B1D5
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722053; cv=none; b=kTLpWYTnvPIrp+G7AUhHdYtM0n8wWi6EWY51mCm7ZiwK/Hwv4LmVnsAVw+N4Zrlkzwcy1lXluy3p/70F/7Hq4fBydu39RfuCOJSD1iacGFY5TzXQMvGesRTbcdKE+zMdUD8MdOqtxDD0mx72SY/INeICZ+U4S9FWPxmZl02jhFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722053; c=relaxed/simple;
	bh=TOUJJP9HBNSkN9xCbbCsJB+0OTQHGMK7Y1/W6LTIGZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZL/nptrbB7tc0kaE+QYqc0Ky9PQ366LwiUOnXLISu7rqQeiUSlIUC9fmlhHh0AeqttEp4wcxdJMrcLKuNZ8S2JzYWWHPsU6CtWHfTd+bemenbarL/VqrQ/OU+7heSjlsL9x4VUCXnC/gjf3x0Lh45AvVEaELk+PKWN/HQdHiuUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6CVEz8I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6CVEz8I"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K0qHZP011756
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yanYT6sVYOon7uUBSTMPU7zBvlZZ91XRvVjmXSRoWUY=; b=W6CVEz8ITlLArJJG
	pNr2xMax7mn4yVca7Kff3BDnKZh25fkYwEG7Mwq8wKvwmZmiz04Zkak8rCjc5dJz
	/nDMHRbQS2cYYRbnU2i7jQMUf38OsSwZkX3ma00zybZws8wCW/s4OSjD3LfAee/R
	VmNrXWhyaLAXYbcC/brlZMnYRT38PucJCoCnobRDsuVG0ArnSxOojPWHvRjC330i
	nVcoZXfcAcnS5XY+rI+p4nPGQdSiMNl98klpZe08OpGQDrbzvD7CvHLLIVs2fFRh
	tFcUOjLaw+eXH8AQATGsOJeQcKb8fq4YE06dQue7YUplZ0KZho8naaQ8NXZbekbB
	LRaJmQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsxmn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:20:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e7e097ef7so39664485ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747722049; x=1748326849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yanYT6sVYOon7uUBSTMPU7zBvlZZ91XRvVjmXSRoWUY=;
        b=LZpCyr1yOTEmKn75ZIfgNhlVefT6b3JAxMeg++Rt0jZmkvrB9emQGtur2dAwKojJH4
         3xAWRR9GE3DhGaZkfR2Ny27Hu7zCVDaYGDB6oUudL2kwg8fPmVHz7hiupk0nXufs4ERJ
         dBGXZTE2/YhMnheq/3Ee5XuNYJ9eZ4x3yzKALt328o2WBu+iJsH+ntBYVctTuIbPlmz4
         7Gqv0+6nbPRXuR4s/NOGPkkBmU3mJfqNUNb7e4x8izOAKQgfo8MTtS3Hw1OIH1tEKys0
         kCaPXIzJCMFIMtiP+XK+bQTFs/esrhKH3KfEUKGQWcToHgSar28pMDfaA2+m2P7EuPXs
         RQXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK03PEMmMFoq6Kg3C1dey5WZSYGYtiDr7TyjAsC2dayssRjbmkFSV4G1QB+IIXLbm4ZwwRZmjL8b5VdYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoTBigV/ejvLPeR4mJEy5l3HYUnSeTgiXpOR/ZS4UWTGYKC2QD
	AU2ufjOXDp6Ft9BdQH24dvcgj4Afw/jhvrzsQJlFkPeUZIL8BcfV/S2t1IG8lnedIac35aeDgPD
	aUZXBujVXMYKbx2HfD1ZRUvqqKmINYNEsO1Cvhq4IV0Sdtw69ioP89ydDN86AS9XLM9s8JnFNk7
	k=
X-Gm-Gg: ASbGnctbG9voBzqRcKNEHW7eVpR8LD/sA5jNIvGks0Ms2Kk3TwQqn7mkygEHaB3nm3m
	g40C/AfevaUID1dt4b2PoRVAu7FNgioVyTeEpNzZzbUIzqow4vysexyFajF/IzCq5Eu8Dmqm2nK
	oGVkDlavDkbDZUKZLrKFBhw1YVoV0PDGNM3xExjftNT9v8i1exLnovdTN8PSmi7FpRAsZBbqHP5
	Z+a9oti4g4ysZHbnAMNPklETrRiNrlmZ2W+yxwG9m9SMSnU+eCXSZPmpuw9Eknsup+Fe9a3hB2N
	KSa3/xqM1vV8UZ1RclzVr8tlweYi+ULuc0dvHbmD
X-Received: by 2002:a17:902:ce8f:b0:223:fdac:2e4 with SMTP id d9443c01a7336-231de3515a6mr193661605ad.1.1747722049093;
        Mon, 19 May 2025 23:20:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTX8hp5weskPEE5GDjz/pk/LjB3S3wezIwyc7zvRNHdSFb9Vg1zsGhKvMWA085CsYcUQkZyA==
X-Received: by 2002:a17:902:ce8f:b0:223:fdac:2e4 with SMTP id d9443c01a7336-231de3515a6mr193661335ad.1.1747722048622;
        Mon, 19 May 2025 23:20:48 -0700 (PDT)
Received: from [10.92.166.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adafedsm69345285ad.56.2025.05.19.23.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 23:20:48 -0700 (PDT)
Message-ID: <a6382f2d-2b66-45d6-b903-da8822f9f883@oss.qualcomm.com>
Date: Tue, 20 May 2025 11:50:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] usb: dwc3: eic7700: Add EIC7700 usb driver
To: zhangsenchuan@eswincomputing.com
Cc: ningyu@eswincomputing.com, robh@kernel.org, p.zabel@pengutronix.de,
        Thinh.Nguyen@synopsys.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        conor+dt@kernel.org, krzk+dt@kernel.org, linmin@eswincomputing.com,
        yangwei1@eswincomputing.com, gregkh@linuxfoundation.org
References: <20250516095237.1516-1-zhangsenchuan@eswincomputing.com>
 <20250516095408.704-1-zhangsenchuan@eswincomputing.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250516095408.704-1-zhangsenchuan@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LWXrA4_PqjO8cLT1fBnc38jIicUFgZgV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA1MCBTYWx0ZWRfXz94ShNkURDKe
 Xyyz6o8tRuIcob7Lt1wNx8oFXbKCePprAn6mHJd7hT1mrOa93jxx+kP1srnSoZkm/4AAOZk2wuV
 dVRvVmsImVxp4w57D0EcxtYYeOqz4Ru6CoLevIWi4zcd2FMNNgGTr5c7T6PcyZr16shhsSuY2tM
 ZfrNPAC3eJvBw+M5JV8hUmIe4iqVfFbqWX3nZWPJ2vrMPtbd9cVqfspU6j/LHtoMCxo65+b/k02
 BHB/qgMEHXISqRCh+RlQw9zrFsrSrR1gEbYWNx47hBcNW+nuvBRNh/fEBIsxOT2CLEqhQMfJJnT
 ciGGGe7D2UOmi7NtZ0NJ5AaaYgT8/EE+xLeHe54GojSI0USKe48TsFnH78yddYWoKbkNPIL4R7j
 cvMWUUqD+lY8iA1s0VS1BHBCTDid0LuDKkhX7M7qSAkDUnTBJ5W8Gtpm1OCYbFLUh0Nh3j5Y
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682c1f42 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=h4SL0BZ7AAAA:8 a=2JH7PhIhr8-xlRfLaC8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=Cfupvnr7wbb3QRzVG_cV:22
X-Proofpoint-GUID: LWXrA4_PqjO8cLT1fBnc38jIicUFgZgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=921 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200050



On 5/16/2025 3:24 PM, zhangsenchuan@eswincomputing.com wrote:
> From: Senchuan Zhang <zhangsenchuan@eswincomputing.com>
> 
> Add the eic7700 usb driver, which is responsible for
> identifying,configuring and connecting usb devices,and
> provides interfaces for accessing these devices.
> 
> Co-developed-by: Wei Yang <yangwei1@eswincomputing.com>
> Signed-off-by: Wei Yang <yangwei1@eswincomputing.com>
> Signed-off-by: Senchuan Zhang <zhangsenchuan@eswincomputing.com>
> ---

[...]

> +static ssize_t dwc3_mode_show(struct device *device,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct dwc3_eswin *eswin = dev_get_drvdata(device);
> +	struct dwc3 *dwc = eswin->dwc;
> +	int ret;
> +
> +	switch (dwc->current_dr_role) {
> +	case USB_DR_MODE_HOST:
> +		ret = sprintf(buf, "host\n");
> +		break;
> +	case USB_DR_MODE_PERIPHERAL:
> +		ret = sprintf(buf, "peripheral\n");
> +		break;
> +	case USB_DR_MODE_OTG:
> +		ret = sprintf(buf, "otg\n");
> +		break;
> +	default:
> +		ret = sprintf(buf, "UNKNOWN\n");
> +	}
> +

Use sysfs_emit instead [1].

> +	return ret;
> +}
> +
> +static ssize_t dwc3_mode_store(struct device *device,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count)
> +{
> +	struct dwc3_eswin *eswin = dev_get_drvdata(device);
> +	struct dwc3 *dwc = eswin->dwc;
> +	enum usb_role new_role;
> +	struct usb_role_switch *role_sw = dwc->role_sw;
> +
> +	if (!strncmp(buf, "1", 1) || !strncmp(buf, "host", 4)) {
> +		new_role = USB_ROLE_HOST;
> +	} else if (!strncmp(buf, "0", 1) || !strncmp(buf, "peripheral", 10)) {
> +		new_role = USB_ROLE_DEVICE;
> +	} else {
> +		dev_info(eswin->dev, "illegal dr_mode\n");
> +		return count;
> +	}
> +	eswin->force_mode = true;
> +
> +	mutex_lock(&eswin->lock);
> +	usb_role_switch_set_role(role_sw, new_role);
> +	mutex_unlock(&eswin->lock);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(dwc3_mode);
> +
> +static ssize_t dwc3_hub_rst_show(struct device *device,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct dwc3_eswin *eswin = dev_get_drvdata(device);
> +
> +	if (!IS_ERR(eswin->hub_gpio))
> +		return sprintf(buf, "%d", gpiod_get_raw_value(eswin->hub_gpio));
> +
> +	return sprintf(buf, "UNKONWN");

Here too, Use sysfs_emit instead [1].

> +}
> +
> +static ssize_t dwc3_hub_rst_store(struct device *device,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct dwc3_eswin *eswin = dev_get_drvdata(device);
> +
> +	if (!IS_ERR(eswin->hub_gpio)) {
> +		if (!strncmp(buf, "0", 1))
> +			gpiod_set_raw_value(eswin->hub_gpio, 0);
> +		else
> +			gpiod_set_raw_value(eswin->hub_gpio, 1);
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(dwc3_hub_rst);
> +
> +static struct attribute *dwc3_eswin_attrs[] = {
> +	&dev_attr_dwc3_mode.attr,
> +	&dev_attr_dwc3_hub_rst.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group dwc3_eswin_attr_group = {
> +	.name = NULL, /* we want them in the same directory */
> +	.attrs = dwc3_eswin_attrs,
> +};
> +

[...]

> +static int dwc3_eswin_probe(struct platform_device *pdev)
> +{
> +	struct dwc3_eswin *eswin;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node, *child;
> +	struct platform_device *child_pdev;
> +	unsigned int count;
> +	int ret;
> +	int i;
> +	int err_desc = 0;
> +

[...]

> +	child = of_get_child_by_name(np, "dwc3");
> +	if (!child) {
> +		dev_err(dev, "failed to find dwc3 core node\n");
> +		ret = -ENODEV;
> +		goto err1;
> +	}
> +	/* Allocate and initialize the core */
> +	ret = of_platform_populate(np, NULL, NULL, dev);
> +	if (ret) {
> +		dev_err(dev, "failed to create dwc3 core\n");
> +		goto err1;
> +	}
> +
> +	INIT_WORK(&eswin->otg_work, dwc3_eswin_otg_extcon_evt_work);
> +	child_pdev = of_find_device_by_node(child);
> +	if (!child_pdev) {
> +		dev_err(dev, "failed to find dwc3 core device\n");
> +		ret = -ENODEV;
> +		goto err2;
> +	}
> +	eswin->dwc = platform_get_drvdata(child_pdev);
> +	if (!eswin->dwc) {
> +		dev_err(dev, "failed to get drvdata dwc3\n");
> +		ret = -EPROBE_DEFER;
> +		goto err2;
> +	}

Try using falttened implementation if possible.

Regards,
Krishna,
