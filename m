Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38E1DB12E;
	Sat,  3 May 2025 09:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746265394; cv=fail; b=amP3aXJA7r3KtKA3jA1cnlBG/3S7G/hdSkAZ7aFFLUTnYxm+m+RbdNGf5+5ZdcBRL1g6hFTHweqQK2pkLw+ce7mydDIELCHtI+UDNZmpMgTSIBZfq/9devCKOyaCYsziKbdlrImJmEFUj/ubrJH/soFgnPekYYGCgW+k+XrS1uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746265394; c=relaxed/simple;
	bh=yQbL0w427s9DW3bR3qxtM+ff2RRsAEZkaNBDlXIcA+U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HOWhjkYTbs3SbUbKjDmmKG9HB9MI70JWxmJjEAVq1xNjwmGo7haLx51L6XO1oozH8NDc7FsTb3UyLRA0NkMGTxvM8vYexvINti0gZzD+WGPYrYqyxwUjpJIU+MzlqN3xkFtkX1vl1eRkqWn/bTwfVZkgUpiDt7mdcD6APMpC5IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=McY4spHo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vpLUW89y; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="McY4spHo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vpLUW89y"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54397gbj000320;
	Sat, 3 May 2025 09:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=0bbFn7mCL16C7gIMiCSiCI/COea5VfjPbke/83783Eo=; b=
	McY4spHon4Zau+zFnQBZLgMazxe+L0cFck8SLZKAUDt9XG95jFNuuUgeyoxIFYmp
	LzSUXX92OeoNG0e7w6TM86GtHk7TitR47tVh4xPk/Qtt5QltZLezK8UzpzFcwrDP
	voHneU81JCP1NPpyk0hiFTpj5W39kgZPvAM4NRQw91PyJhOLs0v+VRMVpjSVUcZ5
	NO+k6s+tyQZ5mbZiXqG7MwQTy/1alX5QvOglWUzK5CM2ynm1U4PHqXXtlG2zSwEl
	0aWeeIrznrBPboIYiGnxiJJ3YdlqCxU74cS89N9vcRugiuao9HbJWFe/+227uQAN
	Eyo0/w5irXAAN3F1ZmNX6g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46dg7u80ju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 09:42:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5436qpLV035347;
	Sat, 3 May 2025 09:42:52 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazlp17011030.outbound.protection.outlook.com [40.93.13.30])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kcehg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 09:42:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fnq66IYCbRuD5JQC2rLXTXcoN1yK5zBglUEOfNLAssEs84PZ7xQ8c9ztoHHGRM57hLJ27GsEXW3VUTw8qfjBw2zvBdxu1ehX5zcVeRMRB1brUJUwPIgMBs8FCOytucwJYQoVy0QjUCXNFqH7jzYYVAySn7+ZKGMkOYAtQE6JTiCRanWvIqSnnHdDDurxSytINdZzfxEekQ49No0EpfH6iNsT46KGI9IeZEqPNpPNtEsJBX2pXRrcKVmIWECYLIqpqN1Xq875KdUbh97F8EAHGKcIMv4CwLcvTaGzOkbUmQE4ITiqa+dGU2axELt+nfbqykM1pDBHY9ILXNWFUv7Djw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bbFn7mCL16C7gIMiCSiCI/COea5VfjPbke/83783Eo=;
 b=rzKjQ4p5vlJpAFGBgGpyZv6vYxXhfqv5P47/dQ/XH95SotoDrdC5lQNQJQzYYLSaVDtFbracJ64399pDFMNk19xVSoUHPh9cdO+fwOQcgO3yo/+Iu/mjPDQjQMY/ikXv3N7KYRGbnl5aS0p+fqCrWC2XfNRoC5lBXntLjpe4xuoATd6DwKJ8azjVq1TYmYA3nrhi/dYopvWaPpYsLkdOyixygxvtulea2kUOHM8Bt4F58BbHd70+GuT1MEXmO1PYGV3ugv315vc879TBFkA5FlJtEPn5iZ+N0hIS7f6eNjbqah82b3T9p8XLtZgv7jj9R/xSNcPJ4KMJ5mFVRmx0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bbFn7mCL16C7gIMiCSiCI/COea5VfjPbke/83783Eo=;
 b=vpLUW89yKpFC7Rb5FNG2nvgre9iIixtpf8MmPTVpZjkDPAH124U8wRi02bkgM7WFpkpJa0tDKzGYng0MPN17a89wHtndCREbajsJW0CjrJz76dkLcWgV/QQEcm1Ph6Ar3YgnJXNCkT9MKC9Zt1qhEzW2fVyTfOoMPbIvhtgD0u8=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CH0PR10MB4844.namprd10.prod.outlook.com (2603:10b6:610:c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.39; Sat, 3 May
 2025 09:42:49 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 09:42:49 +0000
Message-ID: <d99f91d0-e511-4012-b681-c348ab5c2fc1@oracle.com>
Date: Sat, 3 May 2025 15:12:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
        Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>,
        Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
        Mia Shao <shaohz1@lenovo.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        "Cody T . -H . Chiu" <codyit@gmail.com>,
        John Martens <johnfanv2@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250503000142.1190354-1-derekjohn.clark@gmail.com>
 <20250503000142.1190354-7-derekjohn.clark@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250503000142.1190354-7-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0216.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::12) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CH0PR10MB4844:EE_
X-MS-Office365-Filtering-Correlation-Id: f30766b9-14e0-47a5-4c2b-08dd8a26dc5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2pjR1ZSV2R5YkVLbVI4bExvcGhkT01LdUsrL0p2QkYwVHp4ZGtSYmJwTFpH?=
 =?utf-8?B?aEFHemxpeFRFcGNPVFI5U1FzbmhRdWY5V05RUmJmT2laNDVrdmFRQmRudm1q?=
 =?utf-8?B?QnZVbWlqSW82TCtjc1lJdC9nVVUyU0IyRGJkdytCN2dDNnpvcEZSNEo4MVd1?=
 =?utf-8?B?KzgrOUp5NnB0VStMN0diNGc2dmtQMVNEVmtpa3IrQ0hMT2p2SW00TVNncGln?=
 =?utf-8?B?Z1BMVTJWMW1BdWdTeTM2eFNnQ0tKa0VWN3FrNUNMS3FkVFlmbGtHakRCZGx1?=
 =?utf-8?B?K1lFYngvc1ZRSmZLKzFyNlJKcTVwT1BaV1d4RUxuNWVMZ2JIMDEvUHM4bHJq?=
 =?utf-8?B?VXVDOE5DQnR6SksyWWxoN1V2SHVMdi9jODVNcUxyQi9rS203UUpGN3Zzb3VK?=
 =?utf-8?B?NjdHemhUMkNXQXdWRU02bEIzRTZyVi82TDg3a3YzL0FXNURjeGxtanFXWTVk?=
 =?utf-8?B?dzdiY2VOd3Uwd1BYNFpsV0JsWGF3dVVhL0F1UHFXK0Y2eXRLOWI5LzVWR2Na?=
 =?utf-8?B?dEZhZzJ2OGFvZk95NU1JTllieUJ1QkJLTG9qTU5BWVA0Q21wSTJvVEova2cz?=
 =?utf-8?B?Rk9DREZDR0lXa2xCdGEvUDV6ZmdkbGVsZUR1RGZCM1lWdmU2azBuQ0QyYjVT?=
 =?utf-8?B?bDdwbWh2Q0tPMzUvaWxidDNCWHlwM3Q3N1l6Qm9tc05nT2toU0hhb3BUNmMr?=
 =?utf-8?B?QzVaRFNKbHgvbkNNa2hYZUhzN3pjMWt0SUl3SDZNdlEwd2NOYzRNQmxwK011?=
 =?utf-8?B?WXJVS0kwdmxueXI5ZmlIRFNxUS9HQy9GQ1VUVU04WkYyQ2IvZ3NuOTNDL01v?=
 =?utf-8?B?K2VBS2pILzBVLzBZeFN1WGhvb1hVS05wNkhtUnpXb2NWNW1MaDk1TmlIZEdK?=
 =?utf-8?B?Nkh1TmRFQTViS25tMjRHQVdUUjBzaHNwdllqdmtRK0hpSDM0bnlDUVRKQ2h0?=
 =?utf-8?B?SS8xcnV0aW5ObkhWQis1V0RlLzlncnl2azEvdW9xa2RnUyt0VXVGVjNFK0x5?=
 =?utf-8?B?VWRzeXJFdEwvWStBUDRyYlRYVjV5dTBRZkpjRnJhTFRrQW5UQ3NiVEpNUDVI?=
 =?utf-8?B?OXozc0RPTys4cHcyUjNJOTFkVkNmUCtvNlFHcEhXZ08wKzZhcklYbVpBLzgy?=
 =?utf-8?B?dXVtMEdqVXlES2JMQ1BvdU4zQkp0eWpPbFJpYjh0bExWUkRsODZzQmlrb0ha?=
 =?utf-8?B?Zm01V3ljNzdSK1FaRm9uUkpRUjkxSGMvSW9KYnZ4RVpoY2lrWDQrMmpSeEJV?=
 =?utf-8?B?aHZNVmdZRGh2azk2OVQ4aVVQODNvbnlNT2UvNUQ3LzBPRGVZVXQzTXNNanNW?=
 =?utf-8?B?Vk5mUDVqRlluN0tMVWY3V1dLd3ZVNllHZ1VHQ0JvR2I2b3dFU0pyZnRzMzFT?=
 =?utf-8?B?TDZXRXc1clorTEFScjI0OWRBVTNkelhmKzdSQnUvV1ZQck5OY2tHbzdPaHAv?=
 =?utf-8?B?N1VMZGd4SWtycHdDelVKWThkbUZheW5INURmOWo1d2tDeWwzM1ExR29CSHRm?=
 =?utf-8?B?eThFZXBQQ0pKdjFaUjFsbG5mZmVhRXVDOWdRaHdLV0JhVkoxeERyRCtmOHZl?=
 =?utf-8?B?ZHVxNXNLSlk2aUl6dzNoNG5sWk9PRW5DUG9ETGdLeTVEcFdNSWhMTzEyeVQz?=
 =?utf-8?B?SjNxMS9ITVcrVUhoN3FjSThCeUtQRGhDTVVGb3VMdTJHYStYUkhDZnlRdFZk?=
 =?utf-8?B?bU9scEJnWkFadExmSk1lSWxWSFI4NGo1NlVCWTdPclpwZzRYQWx5bkNmUk9v?=
 =?utf-8?B?eHRxR3dkNHJqM0NUU2xHZTZxSytEQnMwL2RMV3RvUFNYTmtPLzBHc3ZITVNG?=
 =?utf-8?B?TXJTVGFMaEdoajlVbHY2ZG0yQlpZeWlseUZkTkMwTlVOT01LUms2QzIyeklr?=
 =?utf-8?B?U1Q2K0NaczE1TDJ1WUhkdE1MbEcrRXRudEpuOVNUM3c4N3czb3o1RG1QdXJR?=
 =?utf-8?Q?KgjxjbLLO/I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVNkSU1USHlWSDB0K0x4aDNGWXVheXJpNUd6dVhIZ3l3ekVCdUl0NDFzZ01u?=
 =?utf-8?B?T1NXVjMyT3hQNjk1OVVvWGp5MDdadnk4bE1ObVI5MFNGczZkNEFGM2ZFWEVP?=
 =?utf-8?B?cXdnelNYODZZWFczemh1ZnVheUh3ZGxTazduNUpHTkcvakY3RmtaTWJmTmNj?=
 =?utf-8?B?czVDaVFjZUEvWDJsM1VsUWp5L01HS0xZYmkvanN1QVlvWnZRcXNqM0hXRmNM?=
 =?utf-8?B?T3pNTzJqY0k5bGY1N3l2ZWh5R2hoQVY1MmVrQWlxbXZrWjlMMGVnZHBVR044?=
 =?utf-8?B?UnQ5cHBKMlJsQW42V1VnQk9iNlpFNlBpNVdyUURhL1dhOTk2VkdNVlN1S0Ro?=
 =?utf-8?B?dTFXMTZ0Nkp5V1JRMzlqMm5wRGpucGtweC9MYWhGYlNSQmk2YjhFcVBZdTV0?=
 =?utf-8?B?N200cjdDeE5lN05DRFNEeW1Hd1ZXUmdSVTJDUkNBNC9nWlNYUzJHeWhIMWNI?=
 =?utf-8?B?eUkxOVBxSU9qeEl1YURvZGpQTTNzWHVoY3RVRS96K0I3c1Y5dStRZDlMQlZK?=
 =?utf-8?B?ZDhKTVFIWVhPYmRCNE5oTEh4TXpoS0UvRGJpTlIyTkwyL25NY1FhVlh6UlEz?=
 =?utf-8?B?SGFvU1pHcFZTaU5wREZ0L0tzU0ErWk1zaWxNNWwrOGxpTVlxS1prOVBOT3ZF?=
 =?utf-8?B?VkFyKzgwaEE4YjhoeFJVa2NoQWNwRTBPK3VNZG9qUU03ZTZ1dmRPUC9WWi9L?=
 =?utf-8?B?bW50b1JERWljUVVxMEtrbGN1VDVwd0hZQnFTNm1lb2VQNTlKcGl0YU5ocTBs?=
 =?utf-8?B?MUlJUXVQSk9lZXNTNnhLSHVTeURzSThlL1JyakVCY2tCclNmQURVTWhpTVZ4?=
 =?utf-8?B?QzFGMm5Vb2V1YjF6OXcxUUR3MmtmL1BnamczUjFsS1Yvek1kdFJ4T1BUeXNQ?=
 =?utf-8?B?QmRBVUZRL1d5dlhuUUU4V0tJZW1VTUpjTWEzNXREUDVScnlhZHZFUXdOcHZG?=
 =?utf-8?B?eXJCQ3M5WHQwVm9INUxRY2tsUkN1VGJJR3VIc243Q3RNNFozdG1HT0lDbDlJ?=
 =?utf-8?B?VkVxZ3QvSUQ4RGJkWmo2cmd1aFNlRjJnN2dXWGg1WnNBRUVORis3UGV6VWRK?=
 =?utf-8?B?dC9STjJDWklOWFRQV2dBTGpGcXBmSjdRUW1OWWt5WGZPYXMyQzJQYzV4K3ZP?=
 =?utf-8?B?ektSRWJ2VjBrMnV3c3VGWFJsUHFyQnFtNW5Uams4a3dLRGsyWk1lVnQyZFBS?=
 =?utf-8?B?ZkxWQ3RmZlRiYUs2Ujc4Vm15ZzlwK0NURDIxMzBsbDF6Y04wTzdFdXdOUm5F?=
 =?utf-8?B?c1NOd1lQa2IrQVpFZ2tUemxrWFJPYTJTU2J6OEJxdS9mUURyZXlTUWJ3NlVw?=
 =?utf-8?B?aFp4UjBuY1pLSng2S1k3KzB4V0NPTEcxTzkzUEFmaXRycGw4MnVWakcwYkN1?=
 =?utf-8?B?ekR4d0ppNjlrR3JDTTF5d2NjYXpndUlQVUxCRXRGdmp6MzdsQm4vRnlhUFVl?=
 =?utf-8?B?UGxhZkxMQmdaaVo3dW8vcU51RzdyZjN0SjIxZE9RU1RuTEttZnJzdEZJTkQ3?=
 =?utf-8?B?M05IS2l2Y0t5aFNIWkRhSGswYmExWDJPbnFLWkZNTWRTQ2VRQnEyNURkYmlE?=
 =?utf-8?B?bU1GeEZ1UXBxZDhwLzJYMmRWWE4vbVpQRFIzN3U4UUk1TFcxdTdJSWxvL3ZD?=
 =?utf-8?B?b1V4YW0zdWRnazJtaGhWTUFEdzRnL0ZsL1dMOFNxK01hRG9LSi9RZjZ4ajA4?=
 =?utf-8?B?SzhkVGp5K0wxcHE2Yk1mUUtqb2VEc0t2blk0bjhUeHV2ZWhCSWJoWWd4a0dM?=
 =?utf-8?B?RjFCNkxDSU5rTnBETmNBZm9laGd2L2VtOG1mdmtPTW5aWk1NUUZWaHlkcXl6?=
 =?utf-8?B?T0xNcWdtZE1JaVNzRnMrMU8velk3UlIzSHhqTWg0Y1B4Z1ZGblhsc2RWdzZB?=
 =?utf-8?B?OTVuSmZMUEtNYnM1YUVnY3VydDdqREladmpmTWFVMzE3RlpobnpqWHNTS25n?=
 =?utf-8?B?ei9iL1NYanN5SDAzeWI0YUdjRmV6ck12QWJGWXZJdCtrdG1idnpOV3EzbFBv?=
 =?utf-8?B?TUJodlk3K1hra0tNNHZUalUxKy9mS3lMODczNEk3K2pITTlpM2Jzbnh5aGcy?=
 =?utf-8?B?WnhCM3U2WWRScDU5NFBsVWwrRkhCUWJ1MkFYQ0JNQ01Ld2k3Y0VxQno3YUpD?=
 =?utf-8?B?VjR6UlUyUkhncS8rdFZ4TndRaWJvb21aU0tKNjQwOVhqWGRNT3Z6MkhZVWZK?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/Nm7X6z531p3B2l1Z37Bmhz/QGlrYGsqwdOHIxR0g9ULRacKx/7J5uVVgQ58UzCbMyoWpa5t6A9frEX15n/2yz4ghfhSFSIOyxj8xETI1Z3F2wuhDWCIU8AvcbIvVFEab0+mFwma1A0f44ZoKjzfpFYcOIqtfR00wPY3Bar0//cdVO8r2TOiWbrZE0FsGJIGvj99vqRc0+hLQDMAM3OZXYgGaWMVa9oqPy9jDPJHNCxImdqKAhFwoUmlbnTr5cYnmJ7RpVSmS5VlSXhRtZRaZk0wTYRyLL4C5Mb/QyzFR4rNRXzm64IYzraGqgyu2XvUARoosKqZ83CuIWvfQeThCBESfSeFZE0PiUx/oxTH1K/W6Ggs7VNtpXPmf3jEqCk4Q6ZmhG8riQxO3oOaHL+MVcjmE2nzOVCGeANlYwTOil1sFFtNYTFR7YrMQj/3MYzjfAO35ioMIG1EJkELGw8ELaF7KcYD8U2IgmD+kuyN4ypnlV/WnX/kBNrR+IH6oHLOJvfsvLkBqV2Vc3+I+Upnx3VRZVEzlL+1JKSAEZ8gU2sbA8GHvZarNVHCktSM1INDcn4ZqOUVRe6tDrMB1oz0+mG8PTvuv9oRGzk1wEFszSA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f30766b9-14e0-47a5-4c2b-08dd8a26dc5a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 09:42:49.1881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OSxKaWZBq9yL3eHNthGLCFVGaUHJ6J5/e1JW0xzT3ItXtjuduIhUdvzIBeCFS0efvVciy0zosShLXsm49TmID7xZBuN7GgNQrq39DuBL7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4844
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505030085
X-Proofpoint-GUID: H_RKOl0iQZZbqhyA6Y85xua-cWCHezxd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA4NSBTYWx0ZWRfXzQGvkp+2XT6c ExsdG8odbIQg90grX6TSkZioWI3sYWYNtG99/GUOpyLMtzVx6YgEbJ9YOTwbXPRJ7JGyRJf1kpV VoWPaExHIpQk2Ea4OTC/EqGi4Ik6cZ+vuDeOYILyZtPnAetY0CLTKSM9gaEza7TbHpZ+SuiwEY3
 G9qi6YcYlcBKjnGyw5pF0SDtiPgUS5j695sLpByk3YpXqAcKooNhzRFH61dd5RtePX+shnHNzDP Gk8Fi0KxOi86O0VAWEv81BvMpUfdtB3nNvJ7/OxnULBBfDFJl2nVnA6oHAhsXaz1OfhDMy3NtVh UK4wr7vPteF+WMetvU6xx7BbT7LcmaTWOWrGPlh1eZWcOEBjgwOIML2/FX7a4fxnNh81KuhqmmX
 Og2yMnElU6CtFtG4qNg8l11uRkHCV8h6OWhqPVqxo4iXPZ71ny3BM6pi297UP4iRxwlN1fMq
X-Authority-Analysis: v=2.4 cv=Ydu95xRf c=1 sm=1 tr=0 ts=6815e51d b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=TqGvS9rje9JslPHGuNEA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13130
X-Proofpoint-ORIG-GUID: H_RKOl0iQZZbqhyA6Y85xua-cWCHezxd

Hi Derek,

Thanks for your patch.

On 03-05-2025 05:31, Derek J. Clark wrote:
> +	attribute_id =
> +		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, LWMI_GZ_THERMAL_MODE_CUSTOM) |
> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +
> +	//capdata = devm_kzalloc(&priv->wdev->dev, sizeof(*capdata), GFP_KERNEL);
> +	//if (!capdata)
> +	//	return -ENOMEM;

remove this dead code

> +
> +	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
> +	if (ret)
> +		return ret;


Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Thanks,
Alok
