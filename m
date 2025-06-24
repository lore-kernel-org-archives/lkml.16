Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC32D18DB0D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750733420; cv=none; b=ejBsTAFLGlLcARs/QKVDwIUYZGG7a5wRFTLwIRe4i/CynAfRjO+0ni11uO9zT76d/uyisbo6HF1aDUsOSbUjKKjN6DExlCCT1VISYHlmSLhyUKpJaaMINyIV730Xr6QRdlR9nLhPx1jI7hqLTqYwz+rgOmrfMh02Robt7dHjZBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750733420; c=relaxed/simple;
	bh=g8dAforCGnHy12o7lYxQJoFAbEgpfFwsD5c9qkAMXaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoQfnWlU+Ukv2lJe6eR579O2FM14PjynHyvfAR3A8gvtSnrZHCaVXvll4IcdbckblpN/r6XKXpX7Q2KB99WMyr+r7jAXq3cYvc5zdWPDy0kN8QYqRjyuYtSd8EtW1hqyrlnOhTLSftynb4XBX1YraNChikkB1oO/oy2tErSU26s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpfXThOG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpfXThOG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlx0K013337
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1fcqhHZZDq36MXyPxQCuukUpaCaV86PjQrrl1SgLKU=; b=KpfXThOGyhsZ5y43
	DZg0CHJ1OrlqjR9r+kHc/x5ivGb3fcezQJTurCJJBhFdIfqys14vtsbMAKwPSPRr
	VYWS09XTKs2MJcBgmBPUHfzJJy4/QV1jksRCaQtGqmecmycMUzCV3x+90lL95rTI
	NYl+iwxLeqmd4yTSBEKgC460UVpQhJKO7qZnw/55TvyIJeH0laWC2dPuPPdetlTV
	GBQTNSqAzxFphn4DJ59cuci7n/LwxxXmqg1+hXn35ti/ldLtdnO5IyT+dAqw816s
	44kWIS8FYIG+4b8DtLFK36lGeYGMC21B8Azbf/8ALlr7OBO3jULBgm49rxwvpvsX
	XpGMzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1s2kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:50:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d38c5c3130so789699085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750733415; x=1751338215;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1fcqhHZZDq36MXyPxQCuukUpaCaV86PjQrrl1SgLKU=;
        b=q3oLeRKu5Cq7z/wQa9LL8rilPTKQiUMTWNefIxaw5ReDmMt1TDq0a63cILQkGyvADN
         GkaPXHD8t3F6TN54vt31WGSEdkTUWbJe4vpQre6hgv1+26qkCCScVutnP+F1Su/whWof
         l55r2OABzfvfYUavK6aRT2pRUt5SEEobbDaRLIiyB81rO1GeFczRVn8ctchFtIM3wseE
         jvPdjHuPYSzp8nf84VJhR3NrOmqG9loDErTTaLPtlEEcGDIlDEe4b24ytjkJuM/VQCqG
         ttCW8J1C8tx7RLywlBsfTr1QnWgA3yoi5abFcX53lbeoezPFTih50Ou99REHO0w+72R2
         UcSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjAhKss/vY6C2VcucxTNxx+KKLbkSDLteMvLDBj+AmYGthzODySH29A2DDXTf3T0hFml7lRukHsO4lOX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaYV4+0KhNkPNPWX9tKTyAwCEVgckMQAEr8NcbPYlF4ysh5gGi
	gQpgg3ibZEdp6a/vevrdSldTVNoGfGt33Fxzhzsyq8OD1BmxFTZfX0Js+YfWGa7BnIzk+qB1Heb
	sbb7ZlSUpM7Wyq8On5SxPvhakIKh6i17F7b1/Jke4zjXgIw9w7ZfcmMhKNbb7l3JtDis=
X-Gm-Gg: ASbGnctHfDvIUrRkZtBccYuEXS28vopj3wdPXjeC7i2MkjsWx5W3VkYPaY2wVifs0Nb
	rl3L7NKCEKT1FuRFjy/HUfQwDN3Vot9avhbZUXs1+hhw4ZoSJSs6McVXP3+WAqixzt7Q6xeDIj0
	HVZ4VUxTNA62ThbAdNkwGtkQvOstq7LpmSyDNBWNkamqCGOQut6FPXNFHay2bFMDS9xj4KDmRQr
	E6vkPX8ROgQ/0re2CmO+B2JV1A4+4XMVyB27AtQ0wsLHPrmKQPiyWLHmONpUDbXydzMANjacUvU
	cIVTvkCTOQ0W9H0O6XZXXlkQjxVHqd39lRvGc4LaNk5CAgDaCepJ20Tgwqe/PvOgQSBpl5sQgW0
	anZWDP2tH2gTR35bquedzKGEIRRGB3bIBin8=
X-Received: by 2002:a05:620a:8392:b0:7c5:5fa0:4617 with SMTP id af79cd13be357-7d3f9935983mr2313374685a.40.1750733415286;
        Mon, 23 Jun 2025 19:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT4NR5UJbm4MQAPipZTbFsNQXAug/1Tlf9ab2RMHJRtc3i2/7K3/VgEthQDpNviIo5IRN38Q==
X-Received: by 2002:a05:620a:8392:b0:7c5:5fa0:4617 with SMTP id af79cd13be357-7d3f9935983mr2313372485a.40.1750733414830;
        Mon, 23 Jun 2025 19:50:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbf5asm1631886e87.91.2025.06.23.19.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:50:12 -0700 (PDT)
Date: Tue, 24 Jun 2025 05:50:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Slark Xiao <slark_xiao@163.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, manivannan.sadhasivam@linaro.org,
        johan+linaro@kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add Foxconn T99W696
Message-ID: <o45vqmp26vu6jjijq5an2s3xtxieyqx37sitpqal2fijnpanxq@2rtmibk5lkqi>
References: <20250528092232.16111-1-slark_xiao@163.com>
 <4k7426oxhrnfoshkcqwwilq5lqldjovvtrwfownllwxwgudwjo@a3i47vma4lhr>
 <cb7bd34.6056.1978c2466d2.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb7bd34.6056.1978c2466d2.Coremail.slark_xiao@163.com>
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685a1269 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=_Bkqbk7FAVchwUwboagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: l9Et5ZAhq9Ue-91uIUqr4RSBJZhXmCIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAyMyBTYWx0ZWRfX0bm7SiyXwH8t
 lkfRiS4Su0mdhupBLqEI+Re287HSsf52yKA6TCCfQWw2NP4SLtYAQg8azrBLhWvOF1LEWIAXmlT
 tMskF/EEtHEtkoG9KwQIFnfQou/txdCFihdU81aM5uprnEezdVihvES1ozeINrwAWf7W/TNETES
 JZRhUNoKGv1gyqCgpXGn0DoagLsViC6QoheCFUxf37aD5In0F8vhhfV+csMOO2hxeCFKdXwSI9v
 ouRkEMrXLEPZVULRyoOZ6EBkT4JQM7Vnxk19O5Ul71MqsPzUSZXX5jvMvkLPMCfjPPUWCtSEyZh
 WkYxeRA9N/l+6tE32CCD1JxnWVpC8kbksN/E4gXhvwzPE+g2P6EZOEoy0tvovKWQo+gp96PbeGW
 A2HCf6UT67cxiWFgcpBJtcCG8AJ5a9MJSwN79TtiI6zLV89g5bvAMQjrHegjZyjq/E9AXrS4
X-Proofpoint-ORIG-GUID: l9Et5ZAhq9Ue-91uIUqr4RSBJZhXmCIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240023

On Fri, Jun 20, 2025 at 03:01:25PM +0800, Slark Xiao wrote:
> 
> 
> At 2025-06-17 17:39:11, "Manivannan Sadhasivam" <mani@kernel.org> wrote:
> >On Wed, May 28, 2025 at 05:22:32PM +0800, Slark Xiao wrote:
> >> T99W696 is designed based on Qualcomm SDX61 chip which is a cost
> >> down chip refer to previous SDX62/SDX65. Though we have a support
> >> on SDX62/SDX65, we create a new channel config for SDX61 since
> >> we add a NMEA channel support from this product.
> >> For new products we are allowed to customize the subVID and
> >> subPID only.
> >> 
> >
> >Could you please push the firmware to linux-firmware? I don't expect the users
> >of the products to upstream the firmware, but I do expect the vendors to do so.
> >
> >FYI: Qcom was able to upstream the firmware for one of their modems:
> >https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/qcom/qdu100/xbl_s.melf?id=01842da45df0a9f862098d1597f6ae5774b3e48a
> >
> >So there should be no licensing issues. Going forward, I want both Qcom and
> >vendors to upstream the firmware before the modem support gets in.
> >
> >- Mani
> >
> It should be okay. But we are facing that we can't commit files to linux-firmware
> since China was banned from that community.
> I will share the edl file to you in another mail.

You can use b4 Web Relay to send patches. Or you can use the git
send-email to send it to the linux-firmware ML. The issue is that
linux-firmware maintainers could not identify you as a valid sender of
the firmware. Either use a Foxconn-related business email to Sign-off
the patch (and probably send the email through Foxconn email channels)
or find somebody in Qualcomm who can acknowledge you as a valid sender
for Foxconn firmware. Otherwise your emails to linux-firmware look like
coming from the random user.

> 
> Thanks
> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> ---
> >> v2: Correct the ch_cfg as sdx61 channels
> >> ---
> >>  drivers/bus/mhi/host/pci_generic.c | 52 ++++++++++++++++++++++++++++++
> >>  1 file changed, 52 insertions(+)
> >> 
> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >> index a4a62429c784..a90ab31c46a9 100644
> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> @@ -490,6 +490,23 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> >>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> >>  };
> >>  
> >> +static const struct mhi_channel_config mhi_foxconn_sdx61_channels[] = {
> >> +	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
> >> +	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
> >> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
> >> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
> >> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> >> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> >> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> >> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> >> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> >> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> >> +	MHI_CHANNEL_CONFIG_UL(50, "NMEA", 32, 0),
> >> +	MHI_CHANNEL_CONFIG_DL(51, "NMEA", 32, 0),
> >> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> >> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> >> +};
> >> +
> >>  static struct mhi_event_config mhi_foxconn_sdx55_events[] = {
> >>  	MHI_EVENT_CONFIG_CTRL(0, 128),
> >>  	MHI_EVENT_CONFIG_DATA(1, 128),
> >> @@ -506,6 +523,15 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
> >>  	.event_cfg = mhi_foxconn_sdx55_events,
> >>  };
> >>  
> >> +static const struct mhi_controller_config modem_foxconn_sdx61_config = {
> >> +	.max_channels = 128,
> >> +	.timeout_ms = 20000,
> >> +	.num_channels = ARRAY_SIZE(mhi_foxconn_sdx61_channels),
> >> +	.ch_cfg = mhi_foxconn_sdx61_channels,
> >> +	.num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
> >> +	.event_cfg = mhi_foxconn_sdx55_events,
> >> +};
> >> +
> >>  static const struct mhi_controller_config modem_foxconn_sdx72_config = {
> >>  	.max_channels = 128,
> >>  	.timeout_ms = 20000,
> >> @@ -615,6 +641,17 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5934e_info = {
> >>  	.sideband_wake = false,
> >>  };
> >>  
> >> +static const struct mhi_pci_dev_info mhi_foxconn_t99w696_info = {
> >> +	.name = "foxconn-t99w696",
> >> +	.edl = "qcom/sdx61/foxconn/prog_firehose_lite.elf",
> >> +	.edl_trigger = true,
> >> +	.config = &modem_foxconn_sdx61_config,
> >> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> +	.dma_data_width = 32,
> >> +	.mru_default = 32768,
> >> +	.sideband_wake = false,
> >> +};
> >> +
> >>  static const struct mhi_channel_config mhi_mv3x_channels[] = {
> >>  	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
> >>  	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
> >> @@ -863,6 +900,21 @@ static const struct pci_device_id mhi_pci_id_table[] = {
> >>  	/* Telit FE990A */
> >>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
> >>  		.driver_data = (kernel_ulong_t) &mhi_telit_fe990a_info },
> >> +	/* Foxconn T99W696.01, Lenovo Generic SKU */
> >> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe142),
> >> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> >> +	/* Foxconn T99W696.02, Lenovo X1 Carbon SKU */
> >> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe143),
> >> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> >> +	/* Foxconn T99W696.03, Lenovo X1 2in1 SKU */
> >> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe144),
> >> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> >> +	/* Foxconn T99W696.04, Lenovo PRC SKU */
> >> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe145),
> >> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> >> +	/* Foxconn T99W696.00, Foxconn SKU */
> >> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe146),
> >> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> >>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
> >>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
> >>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
> >> -- 
> >> 2.25.1
> >> 
> >
> >-- 
> >மணிவண்ணன் சதாசிவம்

-- 
With best wishes
Dmitry
