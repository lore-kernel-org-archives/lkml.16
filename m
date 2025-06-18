Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12E821ABB0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280801; cv=fail; b=SU8Ax9hAjBZ7Nn8+688Bjid9RpPc1zV96hJ4YcX20Yd+QyORm7S2JB2eZ8gaOAOXWdwb10gSSkOEwBk7zKn5M9Gtrwd7ThHsMCaiMk6H01yDMa1qAhC2t0cTMbcjB6v/aFm6YrSirejAOMTBwQCNccwxr18RWBzM4VqC81btSjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280801; c=relaxed/simple;
	bh=MeNvkj6J4SAMuei/Y4nWMeoG8Cd0fCHwe4BsHr39XB4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HP03bhKvynob97chjcSf4VoFu+g8uSxrhh4vHLHNJ4LMMKL2wkLqIJrvkJbVChTjVqyAeN4U50NzwTJzcJFXNA/D7zFuy5ECXbGSnwZCSX6DXALicwIaxAt5VcHG2/64zVVwDJPu0d/HuniDMRptCwjIJj+lA/wn4J1UFHJ8KzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TutBua8v; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Hn+b2j8s; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TutBua8v";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Hn+b2j8s"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IL3Vob009828;
	Wed, 18 Jun 2025 21:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=teafVDwvK28qZljbvow9WUhm6/yETH9KOxDYAUmM2Zc=; b=
	TutBua8vYohxxb3MJeJmvHQXEruxh7swZiv/yujAxh1+yC0gxCSM/RoUHkbColBc
	8hpm70kjSKGHZtPnNK8VH2X/UgKp5RF3ggUwmwWiXP73lrhXYP/mYid2rJFucqKI
	fQdIiGSoIjq6/4B4I3PYmYE25dk8ibYU9b+WlJM22mWetvhupTBNhHKtrCMYIRXh
	4mTzJBRNAFqNuWzflWzab2eCyyVAcmsXaUsmyWMegt2GSQwq2JqtZxSxeYASHQvj
	VIxnw6z4HxSQwuHy/qWRbCoI7C+K0zpLdxWd8gTwbMS2okWLqtq4fvgbSEhZT5c5
	8wnew4QI6g2/Jacm6eXFag==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xv8bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 21:06:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55IJfCqq026123;
	Wed, 18 Jun 2025 21:06:28 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhhdxet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 21:06:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEYDMPTZGIAWnS/c95WY27Ij1JNfLq0NhWxKYXaW0nkgMbG7FAC3uc9AaFL74PL53c/7oE8yaFLg1X+J/AXnAVdjFFdKBiTKmqK0+MEDfdPW/YXpXRU8wFKTQixmKyUJQzHkxIhj8jPeZdMBH9HPbkZx5eCG8UQDIAf1lrmyEEClMiByVMKpFSMugZtZgB/qA428QoC47ATav3IQPlvRyJ3+vb39TePVX7S4KKp0Px3gggta7aaBo+Zqml8BehY4b23AtnXKpHpXZhTubkKx+BauxE/Z7r5bqwbqryyY3QZd7B43vnvE4wb6jARPAaWsm92xS0OoXzw55xdYLCiv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teafVDwvK28qZljbvow9WUhm6/yETH9KOxDYAUmM2Zc=;
 b=hrS2GsV2m67zFH0V7zOJTjFTaYtRNMRBBySaG56icqmjQRCiZhDXf/t6DQUlK00Xs77FvO0B1fBum9/isRXdKKBy8pFjDitpFmid86SM3yKJxkPwgkbiJIGAii+uvKvI0PtRHBszQBUDy9YbjJP1utWIYPowBel33HkfRyDYClJdsMgPQPDWKmRo+cq8MvWI9U9evLvFsKKJRbbNOViIS0drhbEwp6ZvPl28/76Tk31o5EMjFaTxVI6VEAFias00MGc6LymtK9qoLQnPCmR2m4xjVUpAh6LsuNjQZ9ooqjtTJ1HEh//hbc+v9ceFMzYMEJJsaP+J/tIlpmlRx6DNlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teafVDwvK28qZljbvow9WUhm6/yETH9KOxDYAUmM2Zc=;
 b=Hn+b2j8sqcQwnlNbqruw9YPn3NnLyqZUOuhAU4pRugF9BeYZ5jaT13Kw0Cm8CCTxyGGm9HjpmzO6IqrILXBo7shhkFZeAX6OBUUQn0c7Mpd1Rgfaoofr0+EGAk2C9sKyS3H9MfztwQIVo1j/tocxbKtJnpgNgc/9cYlzr4mrlhc=
Received: from PH3PPF654CF2C22.namprd10.prod.outlook.com
 (2603:10b6:518:1::7a9) by CY8PR10MB6828.namprd10.prod.outlook.com
 (2603:10b6:930:9f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Wed, 18 Jun
 2025 21:06:25 +0000
Received: from PH3PPF654CF2C22.namprd10.prod.outlook.com
 ([fe80::a379:d61a:ee0d:6442]) by PH3PPF654CF2C22.namprd10.prod.outlook.com
 ([fe80::a379:d61a:ee0d:6442%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 21:06:24 +0000
Message-ID: <a01d8c8e-21b7-488d-8fa2-0a8710bc1e9a@oracle.com>
Date: Wed, 18 Jun 2025 14:06:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts: gdb: move MNT_* constants to gdb-parsed
To: Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham
 <kbingham@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Berg <johannes.berg@intel.com>,
        Benjamin Berg <benjamin.berg@intel.com>
References: <20250618134629.25700-2-johannes@sipsolutions.net>
Content-Language: en-US
From: Stephen Brennan <stephen.s.brennan@oracle.com>
In-Reply-To: <20250618134629.25700-2-johannes@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::12) To PH3PPF654CF2C22.namprd10.prod.outlook.com
 (2603:10b6:518:1::7a9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF654CF2C22:EE_|CY8PR10MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: fae96163-d2fc-4938-213f-08ddaeabfbcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1FQS28yWS9tS3FBNFczSFdqR3o3QUNHSW11OHEzMW9wZGVwTjFzTnE0VVNU?=
 =?utf-8?B?UEZEdDFOckMyc0VRVmdQZTdTdVh5NWFlWGVxQkcxbi9qOUNMQXF1aDRJZnNs?=
 =?utf-8?B?RlU1Y2txWnEvSmhKVndpbGFBeC9xZ2o0YVp5MFMvbzR1ZEpGTzZIVnFrWnFn?=
 =?utf-8?B?ajBJK0VWemY0YmNyOXY2U200Snk5RWR2a3ZXcHZmdlprT3lrdkRwM1NYVXlx?=
 =?utf-8?B?Rm50QW54d3RlWCt6akF6VWdTaWRwZVVZUFlKTnpqT2ptcEVWZHBjemQ1N2tL?=
 =?utf-8?B?Yy9hc1dqeWh1aTAyVHROQllnRncxaG1rQ1B3SlpKNGdIWWRtNU4zM1BxNlVw?=
 =?utf-8?B?YVlCbHNUMEdCMVVqcTdhbzFmTHFsdjVWYWNKM2FWZ2w5djBXczRJVkZETXdP?=
 =?utf-8?B?Z0NwZUUzWUhTbnZ6cTEvdUVEZncrSysyQ0VVSmJ4L0U1M0VoclZ5dmVkRjNY?=
 =?utf-8?B?RnNxcmFDS2RvUlM5eGNsUGFZV1JIaTdTZVdscFFKTzMxcWEvbDIyL3BsdUp3?=
 =?utf-8?B?Y0x6bGI0SmwrWGZjU3ZMbU5KcFVLRDhUaDVSVEJ5RjdDUW5FR2taV29nNWV0?=
 =?utf-8?B?a2phNFE0ekZieWRuWU5yT2lzVjNmK3ZSSU5aNVRpcnZhUCtHbU8yQ3V6d2VZ?=
 =?utf-8?B?RHBqbEtHK3J1R2xuRlBHRHpHclFqeXJxVExRL21OanVFcVVqNXd2YWNZSzYz?=
 =?utf-8?B?K2RYV2hUTWZDNC8yQkRjbkwyb0JMbEFrYVJ2cXp1T1ZnWmd3enV3R2Q4eHo5?=
 =?utf-8?B?Q0VacUx5OFFRNWswWllxdkljYnYzRGVwWnU1YUcwYng4QWhkKzhENUdtdHpP?=
 =?utf-8?B?RUxRZXZpV3VHRlpCR09ieDdRRXMxQ2dicUNIclpoRDdiQTA5OTBITDBISFh6?=
 =?utf-8?B?U1d5bGdiTXcrS2ZPK0s1ZmFnY0R1U0FBS1J3QnB0VVRxSjErRUlwWFduWEhZ?=
 =?utf-8?B?S1BaT0hVZVlWNmo5U3o5bERKQWplb0VQQ3o2RHBGYzB2ZGx1bDUrc2NvTGlC?=
 =?utf-8?B?VEtTdCsrQ2taNmlwd1BKaTZseFEwS3dVMU1VRUY5WlBDa1V3V0NKWlo5SkFk?=
 =?utf-8?B?VGpSb0grcDdsSzJNWnhhMkxFSmVRR2pHNmt6TGNaWE13RndjOFBiTUpWbmVr?=
 =?utf-8?B?b0pHYnlpK0drNGpGZEdXV1JoSVMwakhBcE5pUmxGOUlTSGJtb1hGenpZcmJW?=
 =?utf-8?B?VmNvcVJBek5rTW9EM0JRVEFHVWltemM4ZFpDNnY3V1Bya0xxaDdtWVk3eEU0?=
 =?utf-8?B?dGU0cVhBbzUrcUZEdWZvcHlod3NEU1RHZkEvcmdUdDNKckgyeEZRSVc2TVdr?=
 =?utf-8?B?L3NPRXQrb2Jnc3ZxZnh6b0trY0huelJDcG5jTm1xS244bjJzT1oyZjBUZmJ4?=
 =?utf-8?B?SEtvaFJRYmxZQ3ZlL0krc3AyWnB4ZUJ2MWJMUHZLSDdBeFhlMm5VSXVuMGNq?=
 =?utf-8?B?VVBCa1lEMVFZczF0S0d4ZW5TUllYY24yR2R0N2ZSZ2JHMHhnaVM2MjNiZ3Ix?=
 =?utf-8?B?eGF3cG9ISE14VmN5SktwT2ExQVJDNkVPeFNYblBYVHR2MU9MTTlGYXZYYlha?=
 =?utf-8?B?WlJ5N3Q2Y2pkV0FwUVhrYkJod0NMK3JqSGwySWFtSEZMWldZQkFOU3RsOGdq?=
 =?utf-8?B?b29la2xNWUZpbkNZVjB5NnNNV3hDZnFRKzhlK2ZscGJZazkwcFhVSnJJamJY?=
 =?utf-8?B?dlMyVUhISGxwWnU1RFY1TnNjRnFiQ0szZUdudTdoOHI2QWs5dGxOVmhkbzds?=
 =?utf-8?B?T21yNXphKzd2ZXJHcS9GRndtWHpKakRFOEdkSHRqYndCc3dVdXh0aUJNNURK?=
 =?utf-8?B?Y003RTdCMU5nYldnN3Y4Y2tJMU9YSHMxNzhCY1drZWxoWnM4eDE2Zy8wOVB4?=
 =?utf-8?B?eGRDempTTDYyZW9aVVl3NzJ3aWVFcTVIa085ei9VbnNuRnRpclgvaGd6Ui94?=
 =?utf-8?Q?cU4Le41IPdk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF654CF2C22.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1NYenc1WTNnRFRNL09MVXlaZzYveTkydWZIWExnd25KNmNiVTh3UDRHNXBz?=
 =?utf-8?B?VHA1eVpoL0tZTUFRa3p4UUdCb2tFM2wxTHZETGtXYjdySCs3RTZaK0pkK0lv?=
 =?utf-8?B?VHBCSitjRTh2YWF3RmdjLzg5MHd0cGhDeDlsZXQyZHRIa1A3dnhBYnE2QUJs?=
 =?utf-8?B?b05UdUR2dkhOQ3BNTkkya3dBOFBhb2tZMXlSbWoyNGRyVFFYbnptWU5KbE14?=
 =?utf-8?B?RVBCb3NQQjJMaGtQclBkQlU5dE53UTl1d0QwV0FVaFo2dGtBNHVUYjRYclNE?=
 =?utf-8?B?aTlrQ2x4VHNHNUxnSGlubFIyYmZxamVLeGRTYUtKNzQ1MngvZlpWeXpMa3J0?=
 =?utf-8?B?NmlCenc4Vi9rOSsyU1ZRci9TZGxjcEFPVk5LcndLSWpqK21yR3crempqa3h5?=
 =?utf-8?B?S0UwVkJuWmxLd1pDYXVyeFQ4WXVqZC9MM09yQzIrS0Njc3cvV0U2Z01laWcz?=
 =?utf-8?B?QkwxMTAxRnRLOTNVdWdDZmoxZWk3TThreVgzYzdJRHIxSjRtR2ZrMGd1OVNM?=
 =?utf-8?B?MVJPQ0J2UmpzeFIyOFl3d3lmaEtiSmR6dC9aVE91NEVrU3ArM2JpRzVBZTdv?=
 =?utf-8?B?WUJFV1RWUlo4YVYwRlZIb3Q3dHdsZFFmWVlmM0lpNmhJeGJzcVZVMFFOQXJq?=
 =?utf-8?B?ejhvMTBzTTVXK3NNbFlOQm5ZeDk0aXYvR2ZMZkZOanBkb1hCZzNSNDlncHov?=
 =?utf-8?B?bXU3RUhCdHlVSlFBMksvWnEyai9sNERjK1R5ZmJqZ0R4NXhieUVXZXI5V1ZY?=
 =?utf-8?B?dWljQjR3VW5tRXhOcHBYYjFhUUVidGRhUmFsR0prVjFWcUxwczFzRnFzU2ow?=
 =?utf-8?B?OXlDZUdDT2lnV1hBcnUzWDJxMkJxYkY4dE9JdWpQdzJIcXJIWXJuMUhldnZE?=
 =?utf-8?B?eHJWMDF3SlZZd2ZncTJvYXArdGh5MHdSaWowWWRuWWtzeEh4c3VXOUZIYWJn?=
 =?utf-8?B?dHN0MmNQUVo1SGNvc1F4c0lwOTlrLzY4L0lvNGZaS0lnRTQ5aTZMNHZ4N28v?=
 =?utf-8?B?MFlqWEhXbHhTVGpSN0hXYUxhUkZuMWlzbkdva3ZpaW9TMFRKcFZ3UCtrRjNF?=
 =?utf-8?B?WjNaMEUycExqcURVR25QZy9tVStINnM3MHdsZmZJUjQxZEE0UUVrdTBiMDVU?=
 =?utf-8?B?SEQ3cEQ3NXRrcUpDSjFGa2piWHpBYTlOTWl3VjhRdkc1Qm5pVXJnN0g5cTJH?=
 =?utf-8?B?a1U5SElFcjYvQlhxcXhuRXhJZENLTW9WVW91eGVqOFVjT1lRSlA1emhJV2Fj?=
 =?utf-8?B?MWU3dGVKWXdMbmNibXpXNGVsb2MzeFRFSnFRU1VyS2NPRllvTjVpQmRKelEr?=
 =?utf-8?B?NlRidDBwYURoVEJyQjFoWERDUDB0MWdpM1REcmtlUmQ1YjFQSTdHUGF6dkRY?=
 =?utf-8?B?YkVOeDBHMXc3NEVKQ3J4OW5BdVllRmpwSzk1YS9qU1NCL1ZSVDdHbWpWdnJl?=
 =?utf-8?B?MFlQK0M5Z1hsZDM1SFVSVHB4UFFBQnNlR2s1aWd2QXl6NUI0ajFzN0N1ZlVS?=
 =?utf-8?B?aEIyMkxhQmNqT3lMVDdTbmhhOTROSGQzc0F1RHJHTy9YMUlTQ1ZxTXVySFor?=
 =?utf-8?B?VzFoRjNNVmtCWXl2WnZ6RXVMZ0RFZzZDN2pBdEFPMnNEZ0ZtcVpuQjFCdmVJ?=
 =?utf-8?B?Ky93M0RpZmE4dXo0V2d0bVdTNFhTallneXI3UURyZDZncFl2YktvaVc5SGRD?=
 =?utf-8?B?U0pmbFFKeDBrMjdKM0dHL0l4Zk8yM1NGRjg3clplTXg0WkZEODFGcXhmSkpZ?=
 =?utf-8?B?dDA0czFHdXM2cm5NSUw5YzdsOUJuRDRnRTNKc1g5N214ak9xVWVUSzlHWGJv?=
 =?utf-8?B?c2g3alV6bGk5QnJsaUljQ0xQUkN5YVI5RXViT2lLYlJrM0dGV2NCaksrQjll?=
 =?utf-8?B?bWpoeVpkcFlkS05GMmI5RnBaeERPUEdxY1llNVJwcVhNOHUzbkFVSWdIL3pa?=
 =?utf-8?B?a01HNjdueEh3V0UxR21UajZvdEh0TENUaVdWUjN3YURNUCtTSWZVUG9IM0tm?=
 =?utf-8?B?SW8yNEVyVmttQ3JyT0xjZ29WSlNzbTR3dnFSWDZQTTZRSzhRK1RzbTJlcTk3?=
 =?utf-8?B?OEVwWGlkTU5wT0c4RmkzMVphdWVhaUI2bTIySmFWbHpDV25RZWxDanN4RWJu?=
 =?utf-8?B?N09iM05JUXp2Ry84bkJ1L3I2QU9SZG5QVkw0RzErWVJZNUN4cHVrNzY3Ukl0?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CRIN/wxTkrcEKNLigbxrfMG1PzzPEGMF/IvcGgMwEyWgKA3n3IUZdEnkb1WRyfSqkntERQCNReuI57YKhZ61JtZP3UfQQN6KN7Jb8N+UJxivAVeYcb1gvych9tdIPJMTtkwMOxwUZ2ZFx0DU493RLge7Q0/qR3JLYzys7/+ay53H4X3cDqj9nqe0meyXDlOr36PGN9kRIbKC5Xf2T7F7YoxTCE1aee3kheVByNdlElb2nN26kBN0WgoM3EPK4bF5+P6IMJe8+AvoXxxUkqkMzzwnxD/bF1lZVQiPFu85a6ZhqSCXENVvsBS24xWs94zM+2yoB+ZyDl1bwumXr0PsuKYRvwZtAbPiyu9gsEWCFuubIjvIl0gIctii/xbCHYqCpnDcBNCYkU12vd8FZMzWcMDO5urefXmvG4+WY41bO0SPVkGGbZOCEfebQfWAa8Py70oUhJCOo4FyZ0X9bHMpfTZCTo3bAna0FZ36HxTE2bJsb3ysVJujVfvdtl7g/iBz6olQ6lkpgOED6EPC0RkqEjtRj6MlCUd55cHgVIckFN8iIGPfPJb5ChXkORVSmRetrfs9NZ03MrvqQSHG04Zv2VYgVUMgBXmwGsKWi+dQaxQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae96163-d2fc-4938-213f-08ddaeabfbcc
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF654CF2C22.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 21:06:24.7158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhWjkvZPiZ3JEzw0tr84u9HRN11QkaPIqEX2vyxyb7ogp1lkSsXjHbqJUNKgj8v5gJ6VKTGahUbM6T3PYdRiG+RB1iOWxI9iDwx/pRv4Nm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6828
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506180180
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE3OCBTYWx0ZWRfX5euVy4fEJ18B 8JxHi6e2uvZA5/I8ERYiih3Pr+HO648SYvnM9ankSBTRoOnuRK/tvlluUGSwCsv0TnEdbKTsnya dAjLllCOJVfulI48B+726cHzsXkzkWiPGRdKdF1fW6n12saXxyfwDnlGeCeBcuTvPRYLAqAeSmy
 5wBYnQZ5pxdJAcjOCTAZ4xrwCrR+mh+i8dAVX1+AHX+GRRKWfozu3fTA3il6i9goHdPEz+/TD97 YlLyU+tTkRTmviMqQ0CHhKN1n67m9uK2IDBkJNmSgg6ku6zfgFBI7NkwglVz4vm0VNrlZWaOmSg ZqQLmxcHwm89DYPlzj4pSX3NZUXFlRzUhL5A4GWeQCE/lTtzqrWZvhxhaHVymBDw7YxG6assc/S
 kOhfoMFKq3KlxZD9ri4tEgW4XwfUo0Ah2zOnXpaoqbc72J/CWYbabvL4lQnTuuMuBDwUTUXC
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=68532a55 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=811_SR1zad5fQrMJvvsA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207
X-Proofpoint-GUID: ZglMKGkuJppki20XasUDJZuHiSciDKxC
X-Proofpoint-ORIG-GUID: ZglMKGkuJppki20XasUDJZuHiSciDKxC

On 6/18/25 06:46, Johannes Berg wrote:
> From: Johannes Berg <johannes.berg@intel.com>
> 
> Since these are now no longer defines, but in an enum.
> 
> Fixes: 101f2bbab541 ("fs: convert mount flags to enum")
> Reviewed-by: Benjamin Berg <benjamin.berg@intel.com>
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>

The exact same change was already submitted and discussed here:

https://lore.kernel.org/all/20250601055027.3661480-1-tony.ambardar@gmail.com/

I don't know what tree this would go through, so I can't tell whether it
was picked up or not. But I think there's consensus that it's a good
fix, and several folks have written or reviewed the change.

Thanks,
Stephen

> ---
>  scripts/gdb/linux/constants.py.in | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
> index fd6bd69c5096..d5e3069f42a7 100644
> --- a/scripts/gdb/linux/constants.py.in
> +++ b/scripts/gdb/linux/constants.py.in
> @@ -73,12 +73,12 @@ if IS_BUILTIN(CONFIG_MODULES):
>      LX_GDBPARSED(MOD_RO_AFTER_INIT)
>  
>  /* linux/mount.h */
> -LX_VALUE(MNT_NOSUID)
> -LX_VALUE(MNT_NODEV)
> -LX_VALUE(MNT_NOEXEC)
> -LX_VALUE(MNT_NOATIME)
> -LX_VALUE(MNT_NODIRATIME)
> -LX_VALUE(MNT_RELATIME)
> +LX_GDBPARSED(MNT_NOSUID)
> +LX_GDBPARSED(MNT_NODEV)
> +LX_GDBPARSED(MNT_NOEXEC)
> +LX_GDBPARSED(MNT_NOATIME)
> +LX_GDBPARSED(MNT_NODIRATIME)
> +LX_GDBPARSED(MNT_RELATIME)
>  
>  /* linux/threads.h */
>  LX_VALUE(NR_CPUS)

