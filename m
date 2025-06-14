Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348F62E6D37
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749929976; cv=none; b=k/tc8CfFRwlaUSOY4CrL10t9SsfykjIgIF1ok9AGyimRvRMdjmA8eODo/u9EGhdEcNHrEOAXLuYGR3Kon8udJqK/hKKrStOk0hm6KoI8f8Hngv4FbCN0S+aQLf3B55g0n3ekn6OvduYxIe4bPtNy5PH47jdpevAFyJOMrulEJ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749929976; c=relaxed/simple;
	bh=zSkcy+9QC/FsH2JbyDzo+e5oYZeRb6hCJ+NReJzsy5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1gSBB/h6Q1MfrfShAkVDBxDyDackReUUQL0NmOWrFCayMdk3b2Bp9sfhh8dPHN9IbkQArhsPBWyuRIr9LWbya0bAzwjrf71nQ9k5tbqJ7HNyHHzgJ8MGcY4NOQPjT3e71zG228ZkKUM6MZPH87G54MXnTTku/rn01Nu3fRhcjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvVdejBK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvVdejBK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EHwejU016878
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OcxiXXKnkOWfPgGikwQVTCvvEomIPuV/EyKApCfjq2c=; b=WvVdejBKlY5Z5fvW
	qQhz/3eJrRsNKCmoVpRynF2+3ysfqUiq8WbFJGC58zxaZJ1+8dA2kz8Jv5q5KKZa
	o2Y3pEVayJMHLogafs3k7DrkAY9UUlSRcm7x90+NTDy3gP+7jLv5zVMkxYESSMP1
	J6Kfp4OVdnf1KVU3gdo4cDH0I4ao74DWTuB1xl8ImytKoCQkN7TC6WPvotfDq9Da
	HbSToywQHpwF59NOg092OeU26BTNeww/wrBZ+hJJLeLd3bTK5yEO0cddwwK55r08
	BuPSsgxMS60G7EZSBPUAaNnPbHOFoF6CXpD8C1YifYzbYqUy/W0vvBZDQJuF1LwC
	U/paiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h90y0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:39:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a6f59d5ac6so6219751cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 12:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749929967; x=1750534767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcxiXXKnkOWfPgGikwQVTCvvEomIPuV/EyKApCfjq2c=;
        b=LmyhXBQ5Eh70Tk4A4ZoXECCNMqIQ1HW/U3FMz0fbQXZyHAZr8F6cuN2S9qeRJvJzC0
         gr9xUYRGa96JWbMwCObctQvazhaASOOrEww0T3eeYNm3ntbTfcGer83rPeaTNk0yp0Zy
         o5/u4HUyolAeTM0uD6Um94c8Vp4/vR9/cnK9KoTARBnB8CtMLSRD9kqML7/Oebj7WeKF
         oZTcOjXv7U2BVs2EUA8hPuwGOXiEf0sBaSWPL2DBNA6/jIIPvN7X5nZvkAn6/Tc3XWUR
         K0BIHjNuTrtAHBPD/xS5n04D1PZWO/5BIrNqzd2iBEzlhfuvhIat+skkEkGtZZc0J48c
         UQqg==
X-Forwarded-Encrypted: i=1; AJvYcCWYtZdbctsIJVpZXLWiQa432iU8a5RCiID0ReihlV1VnLfxairbR/fqmwcbamhpG6FPftkVn6YY4SmWYV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2N289IdNMHPFmV0JDZPu3Q9qlTdQ9YoDeeDoQMNyez5KACP64
	z4LzHDiLVfXJmgN451nWadSECZH0iIXgpP6PHDeEzq7ojV2zxH4gFw1JSAupv/ZLCSH4I7L2sxy
	VI1Z1J3xGTqqF1682N35VrteLmUQN3fcufrKcY2Qf90bsrUapDyQLBqTIHOcKOpiGVr4=
X-Gm-Gg: ASbGncvQ2lnoz1PFBSh0lN6pjatgjL8ZpPVKddiVSHnkfm5+L39HdYpYXKaqYFXQge3
	i9veDuAvNJ0IXojO/85xLK3ARse+zNdv+Q/VSu5uDeYLBPcYr1T3eQe8T8DcFVPWdrA2L1TO12K
	rFyf2gsQoyw1M93EF3wZTa/iN8BxocUHNQWVVkhDnNxRUqEacPVO6e5sn0sfF1jpe9w8nBdqNhJ
	hAgNragPQ9tiLZuVUTqVr+/+LlBhxFiqiHRgC7SfkX1sWXkO/CWSwtMsLQFlHmD2yKj9k+d8uHF
	N+6DHxq4anmGjMtVqQuQ8bl8JjaMb0md3Qz9bst9t3f7845uMmI8d8Dd5ForoygBcQW6RZQMX+H
	yhqQ=
X-Received: by 2002:a05:622a:60e:b0:494:b869:ac06 with SMTP id d75a77b69052e-4a73c4f0986mr22710961cf.6.1749929966906;
        Sat, 14 Jun 2025 12:39:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8dmtvab1DD72NJPA+fqrTATOvFUC8Y320lY5T4Vp6J43nwiKHvw9BkAW22BjuNAMnhrTD7w==
X-Received: by 2002:a05:622a:60e:b0:494:b869:ac06 with SMTP id d75a77b69052e-4a73c4f0986mr22710791cf.6.1749929966424;
        Sat, 14 Jun 2025 12:39:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48cb761sm3224336a12.17.2025.06.14.12.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:39:25 -0700 (PDT)
Message-ID: <ee088b5a-e792-4704-8f1e-e709f1b0c5fc@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:39:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
 <20250607-tb16-dt-v6-4-61a31914ee72@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607-tb16-dt-v6-4-61a31914ee72@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UhkuyUtS6S3AYZEY4CWhZ5I6Zqy8f1K7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2NCBTYWx0ZWRfXyQFFAX4+Y6+5
 B3zrm4yRNuoodV7zw5ssXHViF9QuQ60bE66p9ofIhx8fue+bZyD6BjyvbKrmOKstvn2ilEXp5wF
 1MhUOoceRvhOd9b0HwZL2QcGa1D8kZ+FYAJejvbIdBfftkBGUENVyfsbPzRBQ3bXBogqRliEyaA
 5id3nSSG9nqEBT/0aSbvB42rHZ2ws60Y5BKsZLQjWSwkyU5XoaTJx9MQNHloR9PY/KtduXJn5cE
 RalcDHADuGBs1gX1vu/EaRM6Bbd/+82XpupCq0sDRaqU7IPSD1PK1QIIR+wZNqz3l2mVMR/RCqr
 SvtI2DXmwgL7XcfvvvNj6jrg04fyb6TKc29jy7G620h2A/ahcrIAeXoN6VYRFm3u+ttUMznWnxC
 bUR1EJYiIzMqIyfuQzoQ81UBAZ5uT0bvl7PNlIbTJjBpIs5Eb3dZIMviiHmgWRwBepBzsFOO
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=684dcfef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=pGLkceISAAAA:8
 a=Lh12ZzDr1oTyhi1fLBkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: UhkuyUtS6S3AYZEY4CWhZ5I6Zqy8f1K7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=998
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140164

On 6/7/25 9:19 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Device tree for the Lenovo Thinkbook 16 G7 QOY
> 
> The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].
> 
> Supported features:
> 
> - USB type-c and type-a ports
> - Keyboard
> - Touchpad (all that are described in the dsdt)
> - Touchscreen (described in the dsdt, no known SKUss)
> - Display including PWM backlight control
> - PCIe devices
> - nvme
> - SDHC card reader
> - ath12k WCN7850 Wifi and Bluetooth
> - ADSP and CDSP
> - GPIO keys (Lid switch)
> - Sound via internal speakers / DMIC / USB / headphone jack
> - DP Altmode with 2 lanes (as all of these still do)
> - Integrated fingerprint reader (FPC)
> - Integrated UVC camera
> 
> Not supported yet:
> 
> - HDMI port.
> - EC and some fn hotkeys.
> 
> Limited support yet:
> 
> - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> but not UHS-I (SD104) and UHS-II.
> 
> - The GPU is not yet supported. Graphics is only software rendered.
> 
> This work was done without any schematics or non-public knowledge of the device.
> So, it is based on the existing x1e device trees, dsdt analysis, using HWInfo
> ARM64, and pure guesswork. It has been confirmed, however, that the device really
> has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
> @43).
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Co-developed by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

[...]

> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wcd_default>;

property-n
property-names

please

[...]

> +	/*
> +	 * This is an odd one. The camera is physically behind the eusb9 repeater (confirmed) but
> +	 * if it is placed below the usb_2_dwc3 node, it will be switched of after ~30 seconds.
> +	 * The whole reason it is described in the dt (as an USB device) is its requirement for
> +	 * that additional regulator, and to get power management to switch it off when suspended.
> +	 * Defining it stand-alone does work.
> +	 */

Looks like DWC3 only does of_platform_populate() ("probe drivers for
child nodes") in drd.c, and your dt sets everything to host-only..

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <34 2>, /* Unused */
> +		<72 2>, /* Secure EC I2C connection (?) */
> +		<238 1>; /* UFS Reset */

Please align the '<'s

Konrad

