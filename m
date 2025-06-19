Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1625C21ABBB
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342142; cv=fail; b=nA8TAJLSznZWMwNOvAc4dGaS3jENmTCqBd2xVQ97zARjdPuXiOwPnu3U1h+nnxhHpGQMzRh10SSMiPHUpYMk47TiORerlKW/GBY4BDFueC1W0QtuwRWWBQtu5mYD7Kfp5xSaxYFSzDX/hSKZ17R9y/vxi/tOIB0ntZmgaMMaBXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342142; c=relaxed/simple;
	bh=ZGVngGaw40IrH38jY1RSVWCMmR5Mr1/TCbjqbSc6leI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xi7rj40plSbOGxZr/EKI1Au8Cb8WRICb1XrQr6oNUwTxP4cQxi6z6BP3/9iyk5xPTqPxOY58xsrq3a6Rj3MtCcD5EjzlO/QdUAZKr0FYwBmRH5/OoNhoSk2wJx+GuBm9kUU3MNETxAlj5n2BdsnCys4hlP9Aj+zT/Jaaa14xwsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GIy32Pm8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dfH0rXq7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GIy32Pm8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dfH0rXq7"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDfBHs028882;
	Thu, 19 Jun 2025 14:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=WG3ql7D/kgedSfgum3SuU0Gy6EvfMOoSAGoNn4eF7i4=; b=
	GIy32Pm84k/amCZls9ehi3hnVn8cKtPqHlO5zDil30RcxNehkV3TVvvLOYwfvd1h
	bG0aVEO67SqjmkRHZN12BqndQsE9n5uebkTkeF3r8oJisIbrXTHhtQudMniv9Ezz
	d+5McIZdolbl8AOLqGglkWjKrOhjOe4lqRoQjMEG1ixK0XFUDDWlcu/7Hw9cI8m6
	vsJWN2p+//tgq/TBrZbs7g002HyqowYbb2d3rRzCHxImEwaOP2QzjatQ6TOViYMG
	5QZmwuZgtHEBBp4g08akv8KgosH4g6xzeorUPVYiyXT1gqdnYL7tMXhaenhe+2gF
	ckY1eOOJXakOxQ9TmYqbSw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd9xr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:08:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDQ7nm023309;
	Thu, 19 Jun 2025 14:08:32 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj73e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:08:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I959vSQnS2HlR9iXJamKaaOxgUNlx1hWG4RuOpOPsKZAGtiLjQhFzTvAdpSY6S7QLRHpOKHc7TrR+e2sS5ODKZ1mUaj5LCGcQrHNDtc16g1avZ6pzsitjEJXZULQuxVf1J3uWv3tyF/6jWJ29pTg8SvRLzDsaxtcP/iFLDcnd8tzM+B/TxUe2JkYWv78qHXJyn0t5+3fb4qcckBeoi8oFscwZE1GEhbOnwrMr3HX33bF9ykWn8t4UD9XdYFwSlby+qf1jUzLg6qHfWKGZ56cgP5EQGhEfdO3Vvl+QeuNYGfsjZ4EnhKeusSxcAQkoIFBRuEkDssuhc/Ff4Nb5U/gqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WG3ql7D/kgedSfgum3SuU0Gy6EvfMOoSAGoNn4eF7i4=;
 b=Df8RIEn1dqc3TQqwlJoIBNhC0lYdig5OtVh9FqAEzVBxv88u7daBK0aFaxcGGKUXTD8EotTs6nG8Dp+fV0F9nuNNUiCNkBGbqaDXBa/eh1oOTdGhYYbOZVx0c2IBAKr5viLIfY7/5ZKGslx8lRUSGobrMcFYQ2gd2+olRtAak42sjRrVpfoJuDSGN8z8Zt5T2c39WhLu+VxbiArgKQMRjrHi/PHsh/vEyGftHZmPQLISUjV4rwrr7pdD9++CEsLJA5txDyCjrbv0gGJmDwuPwY6V2qlBwmWZJ+7/HDTO3gxPA+nI80GpvK4qta/DZDdk7ziqwVHIepBAlK6m0ebzpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WG3ql7D/kgedSfgum3SuU0Gy6EvfMOoSAGoNn4eF7i4=;
 b=dfH0rXq7K5tynysKJhuTswjATAXdmOxNjdwMT48BnubKFXxtNTKSn35f/ZEGgiBIOXa4NFJHsraDa88hWeI9kS0i0gqoIXA8sGwhELuvAKSr+gT1TYnN4MgvpcDJf3G4/FA8XT9OzJ5CM5kU7W7z63ktyrtE0IxR4cQQq6g8b5g=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by SJ2PR10MB7557.namprd10.prod.outlook.com (2603:10b6:a03:538::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 19 Jun
 2025 14:08:30 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 14:08:29 +0000
Message-ID: <9024faaf-d4e3-4699-8b7c-df6650bd6f3b@oracle.com>
Date: Thu, 19 Jun 2025 15:08:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib/group_cpus: fix NULL pointer dereference from
 group_cpus_evenly()
To: Yu Kuai <yukuai1@huaweicloud.com>, tglx@linutronix.de,
        akpm@linux-foundation.org, ming.lei@redhat.com, axboe@kernel.dk
Cc: linux-kernel@vger.kernel.org, yukuai3@huawei.com, yi.zhang@huawei.com,
        yangerkun@huawei.com, johnny.chenyi@huawei.com
References: <20250619132655.3318883-1-yukuai1@huaweicloud.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20250619132655.3318883-1-yukuai1@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0087.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::18) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|SJ2PR10MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: d9cad7aa-7fe2-45c3-6ac7-08ddaf3ac43b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0tjQjRxbHJUQXZrRktRUDgvMUJYcDBRS0wwQ3paNWRXWEFERnZoK1VUczdw?=
 =?utf-8?B?VzF5MHR4bDN6SE16RDNYQXZOTlFZajA2bnBNYzZhemlxM2tuWGNXR3lRWFVl?=
 =?utf-8?B?Q3VHcTNLT0RaeGJmdXVYMENpQlJXeFdHWVBpRkw4dWtGQU0vblh2aG9GdkhJ?=
 =?utf-8?B?MFhOQ0YycVJvVlJoVEtEK25mcllyVDlBUGpyRkh1aUxZdk1yZitjcHhhZ3c2?=
 =?utf-8?B?czl1Y1dDS2grcFpQSlY2eWlaV2I0aE1waDlOSFRwRXNETU83aE1FRkxBRHo4?=
 =?utf-8?B?U2lncHVjemQ2TXI4NnRrVXhpYXZtemxMNUo2RFpQWUpHVjdRNjFmMWlJSlNS?=
 =?utf-8?B?cUl6UzlJbm1Ca2RGY1h1d1hZelEzTVJWWmJsaVlMaHVSRThZUnBidTRld0JK?=
 =?utf-8?B?VC8yUlk4VDlkVGZTaVhIbjJYTmFxaEdFNE5ZU1V5UkludFBtTkpQdUhxSVdo?=
 =?utf-8?B?Z0pXcHNQbnFjcmcwWlRoV2NLdno4MFpkR0w2QWxLOG1qZTdJVzA1UVpKcTg1?=
 =?utf-8?B?STE4UkV5V1ByK0tOSXNxSlNOOGlWUWxlUjd3aTd2WVM4ajZvQ2xsdXB2NldQ?=
 =?utf-8?B?dnQrbXBKdDV4ZXc2Z0hqaG5VSHZkdWFtYk15SVA3Nk1FdGY2ditQT2lnYVNw?=
 =?utf-8?B?L0t6TmhFRVhOa25uWmYrcXF3OVV2bERZVFZiTXZrUFk5RTlDMUtvekRtalor?=
 =?utf-8?B?aGFPS3BzSjhwTmdyZ0JiS2wwSjB2cEM1UG5hdmMzMzdtSjVLSTBib3ZUMlFp?=
 =?utf-8?B?ZWtGWVNxY24weCs1cEEwRGFQbS9yb09rbnZ0dTVuVjhodHVWR0tKbTRTZjZq?=
 =?utf-8?B?b1NWbFBJUnBPMitvWUZ4OER0M2pZUEttNGdHaGcwODd6b3V5QWFRSXdJWGU0?=
 =?utf-8?B?RWMvSWUyTjdRRlk2ZCtiWFoxTWZQZHJaTTZvK20yS3BaVis2MnRtNFpzUDAw?=
 =?utf-8?B?QjJjc0Y3SSszSFN0T0kySWdubll0Z25CL2JHN3lTb3MwdHJweDFpSVE4V2Fs?=
 =?utf-8?B?RTRFRWsrS2xsNFlwUExWeU8xQ211Z2l3K0xDVVl5TGJqMVBjQkhKRWJhQ0dU?=
 =?utf-8?B?Mk9GNHRvYUhzYS9DS0w3YkhiOUhWdSt5dHcvUWhPQ29GNVZTbjBsdk4yWUYv?=
 =?utf-8?B?N09IYWlQTXdSQW8zcUVJMWlvY2tQMi9WQ3kvR0JFZnpVWkpZOXl6VjUxeDRV?=
 =?utf-8?B?VXRwelNCT2JlZ2pOd2pSdEVZb0djT2grQ2NjcExvdFBIZDZOSThOTElpUTNw?=
 =?utf-8?B?SHVOeVNrUHMvM1pONkNZRkNsZDF2ZFUxOHBKSHpMdFpIQkg0eDN4MStXaWRw?=
 =?utf-8?B?U0NGbUtmYno1VmRJKzdHQlVxT0RTMjdQaS9zRzZvZ0FxMmhrQlZTWEYramV6?=
 =?utf-8?B?SzNzc3VjZkYyMXJFWXJUNWFmM3M1VnE0bEJoRXBKQTBGTlk1S1Q4OTN2NmV3?=
 =?utf-8?B?Z1RLb0ZwZ2c2eXowQVRtYTE1OGYvc1JZM3A5ZjdEVkVaV0VwanNOZjJNNTFz?=
 =?utf-8?B?eUhWU053Qk4vVUlwK0MzekRKMHcreU9sSld1OGFESFA1ODVxblhpTTVsVTNa?=
 =?utf-8?B?dURMWUN5WXE3dU53ZSs0aElyNC8zaFpDQjVDS0NJZit1d0FsMWs1dFlTS05M?=
 =?utf-8?B?M0E0R1ZJd0ZJaEk2SldxTFpiZUhXSDZ1b3dLbkN4WCtBOVE5NmxRZmFRZE82?=
 =?utf-8?B?WmlaTzdqc1VTRnRiMS9ob2xRTHN3Z2ZyT2U2aFMxSVZjNDRvdDlVcFdkTXh6?=
 =?utf-8?B?eUdvczBKbkhqWHJEZ0xyVUplaFlubStIOTBCcE1Idk1mN2N6RXA4REZLeXRY?=
 =?utf-8?B?Q3NHOTc3YWM5ZGdFZFlCUURsYTdjNVVmWlV3dzRZMG9nZlhnOFJxekNWcDlH?=
 =?utf-8?B?VkRFZXN0WkR0c1RlTVVTbS9wR09aelBra1RnYnZsUEtPSE5aMFR6L1NSNEk1?=
 =?utf-8?Q?B/7wxQsNg+o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmxMNUJ0ZkRTNitidUlKV3JVMU95ODlVZ2o0bkFFSTQ4dEtYN0tCNW9LRHcv?=
 =?utf-8?B?eVg5VzFOcnIxMmFRL1l0Zis3SUlqL1ppM3lCQngzVmRpdS85bWYza2FpQkFp?=
 =?utf-8?B?OVVXTlBxT1lxTVNWZnlYOXJnRXJrSTcxM1NEK3pKQmpGNGNEcm5CNU5tM28w?=
 =?utf-8?B?UzN0Rkl1VFlMMHdiYzVseUYxaUhwZXpMR1NRdEYwQnF4THhpZDhmSTduNW9M?=
 =?utf-8?B?UVREQ2R1YzBXaVA4WitvT2xTRnd1eFR6MmJQWVB0TmFKdWZiQVJXQ1B3WnAx?=
 =?utf-8?B?ekxqQ3VObFNGYWl0MFBBUzJxaFhqdVFBZW1XeU1pNmtCUzZBejhiVHhlcUtH?=
 =?utf-8?B?UzhkYlVjSWl0VEtWNWc5NHgrOWszaFNVWmlKdUsxNnNNdnNKUzMvSjA0ZG1m?=
 =?utf-8?B?RURVN1RqeWw2SGdjazJRSm1PMnFUR3hpYlBUemtpcEQrTWl0cFVlZCtkbmpm?=
 =?utf-8?B?SUMxaDhMMWJEVFU1Z21WWjV0QjUzREwyZ3VHYXNPWG8vaDJiWWNHL0VrNkNI?=
 =?utf-8?B?L1BLTEtKQXBBQkhNTWJRbGJpcFc3aHhCeTNNeGhFL3ljOTUxZUJKZnlxL3l4?=
 =?utf-8?B?UjVFc2ZJb1NiTVdLWUxtRG1rQmlUUzIwN2dFWkZjcXRLNDRMRTdZbFNhZytZ?=
 =?utf-8?B?aXlpN3FFNzdUTEplRFhBcFhZYmp5NGRWU1ZpQkhFZG14STNKRFRWdFJ2R0NJ?=
 =?utf-8?B?amthcTQvMVQ5c200bXVsSnhNRmRyL2wvTzZuRHNoa3hkOGVkdDF3aldodS9u?=
 =?utf-8?B?RjZSNS9TbFJCL3BpR25QZFBVZVpmTGEzTmxVWXRJS3A3cmZjQUs5SXdpTlM3?=
 =?utf-8?B?WForMGxWRWFqWHZFUHRHVmVERGwzWHlWZ3N4czlacEV3ZEN3TlYxM3ZLZ0lE?=
 =?utf-8?B?VzRGZk5kTG5ZOStQRTlSMFFKWDFTM2M2MlhEejdUZndoN0RLVWg1Qll4V1NT?=
 =?utf-8?B?VCtibWhpZHdhNGI5U3VRTkJ4OHhqUUZJUmUxRWRncm1GdXVDejU1dUJpWUpU?=
 =?utf-8?B?NVZXZ0crNjhjMzNqNnFkOWFFL2h5ZVR5R2x1c00yQXpvVVhwZHRvcDYrUlgv?=
 =?utf-8?B?UDA5alJsUDNINXR0a1dSTWNiZHpTQ1cyR2NhNnRrV2VZOTRqcXpPcVN2aUwv?=
 =?utf-8?B?TUwxMlh0ZXdCRU1nbWszVWwvK1oyV29XREUzM0FaSTlqK0M1d09PaFVleUdF?=
 =?utf-8?B?ZzhNVkZsR1VFR0p3SGlOb3lwekJ1VE9mMlNuTW9YRzZZUnJGaHdGS3F6VXlH?=
 =?utf-8?B?dUQxaXVRb2tYT3NjLzNaZ2hSYXN3ZktIelEzdTlJVU92WXMzVTJMU2w1cGNh?=
 =?utf-8?B?Z0hkSlZ2MGpWNDh3c0JiTWpxNzZnQUo5U1ZGU084TUlzck5YZktTZWpsN0lp?=
 =?utf-8?B?NHZmU2hsY3p0dzJacEtIbG1WN280TXdXYnpQT2hsbzN1WVBIZ1VTcG1yM3hY?=
 =?utf-8?B?c3hMVTRJdk1VMlNoYnF2c3ZiYTN6bDBxZTIxeStrdVJWS29qZmxXMGpONjN4?=
 =?utf-8?B?cW9RTllDUjF2SW55elZzeENmL3JsdzhvRUg0MHl5MnpSMTA3cS9HS1JWTHFM?=
 =?utf-8?B?S1ZjcnNNQnY5NnlmYWJwVHFEeDJKb3ZCbFY3UHhvWnh4OFRYU1A4UlNLaW9R?=
 =?utf-8?B?MUliblpSSG9yeC9KWkFaMkxERzZWb3RmaXFFSU9Mc1ZtMmlVQWpXeXFHN2Iy?=
 =?utf-8?B?K1U0SThsaE51SlA4YkJCeW5SUmVhV0xFQXhSa2pOUzFwakZ0dDlrTGRDcTVH?=
 =?utf-8?B?Z1hWSHVGcWVQYi9LRFdSWHFUVkZYa0hNMHlwSmVBNzBwajJUWkxVMHJibkxU?=
 =?utf-8?B?K2hmb09yMnFkSUZXY1doNEZQZkxvaE5TaVQxd0ZkMXIxYWJ3M2toc2xZbGFF?=
 =?utf-8?B?anJMK2VFRmZQejVHUjUreWFVMGhITUVHb1NCY0xIWFlKZGRxZ2xvYk1SY3RI?=
 =?utf-8?B?SUhLRURTM2h2cjg4cEdCSkhuVVJmaUczS0NFdSt2SXFaUXI2V280V1p0VUMw?=
 =?utf-8?B?SlFQQm9VN0ZtazFZZGlJdWUvL0RNODJkVVM4MzZtWWJwdHZmbU1GY29MZm0w?=
 =?utf-8?B?MWFkZHhzMndvbUZSVlZRVEkyQXo5bGZqbTFlT3lTMm5LdDR4Qkd1TFVRY0Nq?=
 =?utf-8?Q?GCm+levfxmGKKJejJTGdzya4e?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	srfcPIT4OLzLbUihBgjqCJc3b4a5qrXnjxW7drjWOV+Oc8BORs0y7zGVO9Q1TkJjvPes29zznYyfqqw67yV/2Wwz4XtDgFGxiBCmVTRFHPm4U9MiczXbf7cQWL0Se1Jdr56oBqVuiAHzOi7bFsXmLqVPJZoLzaq7ep2A2/JIJLrxOevCuD30yyy3+md0HlG590zlStnlaUnc5ddLpmLSP0XfD+m7qDv8fSf12OrivB6JUktJfSPbNAE/yTGn1xdfBYZGaJh7oRB7sOg5OwIqkK3QasL7SOuMl62aOOw1CFVC4U3M381n+GvG2LVaPrPvFzniaPf71B4gzoWexo/VKXRL/DHTY+0hahsNc+5ot7rrvZ91RQRmUh0cpp66jkJaplLBEYyzi2WG1BkSgw52CyXa9Xem0B4skkqqL2auQlYTgCJtytRXKnAs6ilgoWmwuwVkXWpFFkjkZHWcRcGtGARh0o/Gw2NYjjeFnZAr+DcVsua6A+QSPd/PlPiEMez9TXrKrKrj73X5kKnbnV9Dd47CjJ5g7m6b6mmOOvXoONijLdPxhLfqOlE+1bRjhsczTriw0zkOBUE/B5VNCLmOnlRTJB6nfE7kUosNOVeZFBI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cad7aa-7fe2-45c3-6ac7-08ddaf3ac43b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 14:08:29.4556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKTLu+rzoo6JLeX6FYkR49WdXn9KHPAE67GvuE+wMpwhU0EJTcIrO84LWb/p5IV9mdgsQNHRdI5znMs1bdF3ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7557
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190117
X-Proofpoint-GUID: RaH4NmtJ7kcCi7cMJi2gj0ku_O810v_n
X-Proofpoint-ORIG-GUID: RaH4NmtJ7kcCi7cMJi2gj0ku_O810v_n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDExNyBTYWx0ZWRfX26Om7ewgB6HB 17B7DJ9+tfDwU9fOo2qvY4imDVwxEoU6/l/aHuMI7G4KnONOO6OZRjmA46nVM5DwBJ+IvIqYQr9 xX5fJ+F647crTuaH5AjYgdIWhQ6nBcMtnV8fgOkIA3Vmi1X84lIxrERWhR8n3qPYFTYHgPeN139
 E+3Ah8+NSaoo5d+v9I+VdSQO0oWXyIsuyJ61ElwwxOKW+2xwkDm1ZhO5nvY0WnEImVIcU4NV5Pb 5s0GKFq6nuN8q769l//p8qxwUkQxZwgWiuw1Vde1ykozAeipurus3bXp0u70VbAhCcLfFzep3Y9 js0M+cKCvuaUyUZIVI13xFVD5tmIcntrn9Cr05Nf79QANtf+WY3aeJ1ju3r48KQUwWWKvHiS+D2
 J/EPmfWTKx4fFIrri1fol7JCrWquhMPHRaaflYGEoMqFJOpyxvyBf3ZgffBivJob7x7MOp97
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=685419e2 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=i0EeH86SAAAA:8 a=hYca96GdpMw07PilgRQA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207

On 19/06/2025 14:26, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> While testing null_blk with configfs, echo 0 > poll_queues will trigger
> following panic:
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000010
> Oops: Oops: 0000 [#1] SMP NOPTI
> CPU: 27 UID: 0 PID: 920 Comm: bash Not tainted 6.15.0-02023-gadbdb95c8696-dirty #1238 PREEMPT(undef)
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.1-2.fc37 04/01/2014
> RIP: 0010:__bitmap_or+0x48/0x70
> Call Trace:
>   <TASK>
>   __group_cpus_evenly+0x822/0x8c0
>   group_cpus_evenly+0x2d9/0x490
>   blk_mq_map_queues+0x1e/0x110
>   null_map_queues+0xc9/0x170 [null_blk]
>   blk_mq_update_queue_map+0xdb/0x160
>   blk_mq_update_nr_hw_queues+0x22b/0x560
>   nullb_update_nr_hw_queues+0x71/0xf0 [null_blk]
>   nullb_device_poll_queues_store+0xa4/0x130 [null_blk]
>   configfs_write_iter+0x109/0x1d0
>   vfs_write+0x26e/0x6f0
>   ksys_write+0x79/0x180
>   __x64_sys_write+0x1d/0x30
>   x64_sys_call+0x45c4/0x45f0
>   do_syscall_64+0xa5/0x240
>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> Root cause is that numgrps is set to 0, and ZERO_SIZE_PTR is returned
> from kcalloc(), then __group_cpus_evenly() will deference the
> ZERO_SIZE_PTR.
> 
> Fix the problem by checking numgrps first in group_cpus_evenly(), and
> return NULL directly if numgrps is zero.
> 
> Fixes: 6a6dcae8f486 ("blk-mq: Build default queue map via group_cpus_evenly()")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
> Changes in v2:
>   - check numgrps directly.
> 
>   lib/group_cpus.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/lib/group_cpus.c b/lib/group_cpus.c
> index ee272c4cefcc..d68407e3601e 100644
> --- a/lib/group_cpus.c
> +++ b/lib/group_cpus.c
> @@ -352,6 +352,9 @@ struct cpumask *group_cpus_evenly(unsigned int numgrps)
>   	int ret = -ENOMEM;
>   	struct cpumask *masks = NULL;
>   
> +	if (numgrps == 0)
> +		return NULL;
> +
>   	if (!zalloc_cpumask_var(&nmsk, GFP_KERNEL))
>   		return NULL;
>   

There's a non-SMP version of group_cpus_evenly() at the bottom of 
lib/group_cpus.c

It also does a kcalloc(numgrps, ...)

Does that need to be fixed as well?
