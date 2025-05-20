Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83F22586CF
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747714026; cv=none; b=LzBR7VmaPwtOT6hO/c68Q1T6T1AYg+jCFjKjD/Rt9nfdOKy9pmM9kamNrVoiQJkG5yWFKj7+i3ZHrms5nwHlzFjzGEEpGV0PrfsvvUgApxxpeMHyZz1xtQdugDlQloT11y4VPBXCPvOzD0SHl06TAySwBjeUXxxUiFoE/mD/I44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747714026; c=relaxed/simple;
	bh=jUJ21JJ4WPhjCDnQnYHTsaL29vU0w091SKPo1AneqdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njhKYo2zWR+av0KySzmUdtg9M2jXSymHm96lfFhrd/8jXh4LTLmElk9bLdpbxRyxPtG6hojJughdntett6v4Vuha7pBrfeuCrgVxcqv7Y1h96ViRwXVrTZrc8/ZeXXKURSRMCwM2alXi3dsKRAAK4p9YWwahMg/XKHT94QYfiHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DbBXli2c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DbBXli2c"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JIoLZI022760
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxgIxQSLdyC89cm2d9pnLf6uGruK6tPHVMq9zFKS2Vs=; b=DbBXli2c4lZGp4pE
	xFrFsyp/+288YNjZ6b9tpgkMn2DFptyMNDHO55io6VkVOQWb/JfRRFijGkSQhMCz
	oqFpjChDvujboc4acVHDSlaRSjLQ0Ye6rjTmPzBjwzzDgxiF/3sBsZGBtuEJvX/H
	VboQIOJisYvu0t+rQP2ZYwunVsi+hFI/bw0+UYqc1Y2xZ0fXmAz4iDr9NfPLP1HU
	GStG2kVsY25tTj1xu7m0rWyFPDCyBNKKxYD1BsT4UFfXLzaBJUTvxkM/Qx0UMCTL
	03/Xk7CPd3Vjrk4Qqmn/e5CXfg4U6gKmfXjjCoMacBtqVRQjZ8WFQ2N/AVczPlnw
	53riNQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d2jh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:07:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2323bd7f873so16907425ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747714023; x=1748318823;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sxgIxQSLdyC89cm2d9pnLf6uGruK6tPHVMq9zFKS2Vs=;
        b=BcJxJlf4u3x+oHl3fn5DFsyzyiK/tpN+sjq0O6qOdPLV9p7AvNwvjvvU7dzwny4D69
         tZc7fVkYNs0zaa6j10y+Ci7Mm/BBx5c1buQuRxDn5mkWAnfFTs1Y+mRv3lH94tN2RFf1
         q/tgH7PAOVl8WF1AMaZRMu4HrfiDKSUIvP1/RCZRS0a03mO6HmlPPBs/A05XdYs9h6AS
         qQyj0CTV7bb+JN2/yW6y+onDeWG0f8YyFMdXZ7SpqGs0e5tf194Nm6wh++8WquZTTclZ
         3UiQ6waUjKREjZvlRDR3DEbaFuQ5/Y+yIgqVHiJ3GcisufvZis+gmqx51224sf9LPNIS
         ZzLg==
X-Forwarded-Encrypted: i=1; AJvYcCUshSipebIQKB6rerVBy+zdk4f+zG67RBG5upxyR5fNRWrMyeKCTr4I9jBElHiMHKi6jzMYtu9PZdfbOfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbGz9UFzMMV4O7wS87vTewFFi2+HEN4WvNUi9tfXY/B9fHxI7i
	uc5hblVzz7oBN7Zeu9A1pISpdI/a0RH7Isjn4lCqCrSx83tLl29G6lPzwDHcJhFpivzM6nvpUSV
	PG+02M9FwYm/fJ9pkEyqCWzOi2kpHDuyqCsrwEZcAER1hmlpnHpuTUGYcIF4Iw2YLfoU=
X-Gm-Gg: ASbGncty5pYj11iEey7PHsKR9d9Jc2F/8kDMZ0aI/Td1Ul9ZuDaYEEsgUae6cTitlfJ
	7gzYJZ+1PqwFItiaFAwPuPeHmuDmXSc8zp3Vq7RJPew8bF21OgFxsHeomDThA0BYuQkJFkUMhL9
	AL7/TkdpxriU3rjiUGtwwY1Vdt4Bc9ahEUfnoPq4OYYZRoBxLksdtPiZm81PWr4AoCY5KI3I0Ff
	D6EKTp07pkzRV5jvzDFeYpXP7G3Dea4Az2Z5/jRH19d64fOI/0oiI61Rhd85ApC9cDS1xrnid20
	trrwTrPDhFZCNPMFpH/FITCxuCCzgcA8CRymag/KXg==
X-Received: by 2002:a17:902:d4c5:b0:231:cb8e:4734 with SMTP id d9443c01a7336-231d439ddafmr231677845ad.15.1747714023214;
        Mon, 19 May 2025 21:07:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF43Iw8v4Ud4eBDvu+fuQQmpwMmCu214kAjlzWktyGTIXejDPtieMgy10/D1MOaJM7eXnyMVw==
X-Received: by 2002:a17:902:d4c5:b0:231:cb8e:4734 with SMTP id d9443c01a7336-231d439ddafmr231677315ad.15.1747714022663;
        Mon, 19 May 2025 21:07:02 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9619sm67528495ad.37.2025.05.19.21.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 21:07:02 -0700 (PDT)
Message-ID: <355c7626-e515-7b13-d882-77dba717e35c@oss.qualcomm.com>
Date: Tue, 20 May 2025 09:36:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
 <20250519-mhi_bw_up-v3-2-3acd4a17bbb5@oss.qualcomm.com>
 <2a539ddc-95d6-7c37-4cfe-3a54ffce0861@linux.intel.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <2a539ddc-95d6-7c37-4cfe-3a54ffce0861@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDAzMSBTYWx0ZWRfXyhvVJWLz28Py
 Or9Xm0u1IfGyC2hZ6jLsAAIdmtmJyyg+qzFaa3QLO56C54AAsbJF+ay2YdBEP0/yXVNbXgSeld/
 wBd1nftNTYApxnih3GZ+k1hUgwNXEINVOzVraZH1Y9OkOpNdqpwNSlOoD5zDYAT61J8eZW0YoUU
 gtISupGeHYC7z1hwJUlxuen8hD5esrtxC2OxSob+Ucv6+F97kUOxS1gxFRWeBCyXy75CgoLQDLi
 WupV0FXN5fNoa3d5ISryNzeY5xxUWJ/lkxtG7D2sj4qMPELhqIXcvfeyTQ+dlnUTNSGb6FMnIUi
 8g89giRiHS2aLnTft4F9FNPCqwlvu1fZTBz8UNJR4CSImLsDuNDf2BcblK+AvQO8+MYZDmMknGr
 2vmIj/hrvaKPZQa150wgZXjGtMoaDHw19ExQMhgrszkqxKyYl5BdqGPJWDOprLXUcv9+iP/D
X-Proofpoint-GUID: XrjA3gWQ6aDRSuwEbETEHWRS4ccOG597
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682bffe8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=PjKuzrdxt0Go-pjIBLUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: XrjA3gWQ6aDRSuwEbETEHWRS4ccOG597
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200031



On 5/19/2025 7:11 PM, Ilpo Järvinen wrote:
> On Mon, 19 May 2025, Krishna Chaitanya Chundru wrote:
> 
>> If the driver wants to move to higher data rate/speed than the current data
>> rate then the controller driver may need to change certain votes so that
>> link may come up at requested data rate/speed like QCOM PCIe controllers
>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>> link retraining is done controller drivers needs to adjust their votes
>> based on the final data rate.
>>
>> Some controllers also may need to update their bandwidth voting like
>> ICC bw votings etc.
>>
>> So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
>> the link re-train. There is no explicit locking mechanisms as these are
>> called by a single client endpoint driver.
>>
>> In case of PCIe switch, if there is a request to change target speed for a
>> downstream port then no need to call these function ops as these are
>> outside the scope of the controller drivers.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
>>   include/linux/pci.h       | 14 ++++++++++++++
>>   2 files changed, 29 insertions(+)
>>
>> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
>> index d8d2aa85a22928b99c5bba1d2bcc5647c0edeeb6..3525bc0cd10f1dd7794abbe84ccb10e2c53a10af 100644
>> --- a/drivers/pci/pcie/bwctrl.c
>> +++ b/drivers/pci/pcie/bwctrl.c
>> @@ -161,6 +161,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
>>   int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>>   			  bool use_lt)
>>   {
>> +	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
>> +	bool is_rootbus = pci_is_root_bus(port->bus);
>>   	struct pci_bus *bus = port->subordinate;
>>   	u16 target_speed;
>>   	int ret;
>> @@ -173,6 +175,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>>   
>>   	target_speed = pcie_bwctrl_select_speed(port, speed_req);
>>   
>> +	/*
>> +	 * The host bridge driver may need to be scaled for targeted speed
>> +	 * otherwise link might not come up at requested speed.
>> +	 */
>> +	if (is_rootbus && host->pre_scale_bus_bw) {
>> +		ret = host->pre_scale_bus_bw(host, port, target_speed);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
>>   		struct pcie_bwctrl_data *data = port->link_bwctrl;
>>   
>> @@ -197,6 +209,9 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>>   	    !list_empty(&bus->devices))
>>   		ret = -EAGAIN;
>>   
>> +	if (bus && is_rootbus && host->post_scale_bus_bw)
>> +		host->post_scale_bus_bw(host, port, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
>> +
>>   	return ret;
>>   }
>>   
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index 51e2bd6405cda5acc33d268bbe1d491b145e083f..7eb0856ba0ed20bd1336683b68add124c7483902 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -601,6 +601,20 @@ struct pci_host_bridge {
>>   	void (*release_fn)(struct pci_host_bridge *);
>>   	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>>   	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>> +	/*
>> +	 * Callback to the host bridge drivers to update ICC bw votes, clock frequencies etc
> 
> BW
> 
>> +	 * for the link re-train to come up in targeted speed. These are intended to be
>> +	 * called by devices directly attached to the root port. These are called by a single
> 
> Root Port
> 
>> +	 * client endpoint driver, so there is no need for explicit locking mechanisms.
> 
> Endpoint
> 
>> +	 */
>> +	int (*pre_scale_bus_bw)(struct pci_host_bridge *bridge, struct pci_dev *dev, int speed);
>> +	/*
>> +	 * Callback to the host bridge drivers to adjust ICC bw votes, clock frequencies etc
>> +	 * to the updated speed after link re-train. These are intended to be called by
>> +	 * devices directly attached to the root port. These are called by a single client
>> +	 * endpoint driver, so there is no need for explicit locking mechanisms.
>> +	 */
> 
> Please fold comments to 80 characters.
> 
>> +	void (*post_scale_bus_bw)(struct pci_host_bridge *bridge, struct pci_dev *dev, int speed);
> 
> I still don't like the names. Maybe simply pre/post_link_speed_change
> would sound more generic.
>
Ack, I will change the name in the next patch.

- Krishna Chaitanya.

> Not a show-stopper but the current name sounds pretty esoteric.
> >>   	void		*release_data;
>>   	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
>>   	unsigned int	no_ext_tags:1;		/* No Extended Tags */
>>
>>
> 
