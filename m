Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022CE1B422A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 23:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746659618; cv=fail; b=I0cfjmE1UPmBYYM5eWGjG23/OQZqnH2FDtb6cFcuYiJpkytgYPzfFbtLNwE6FZ7JtKyd2I22rk3TG2Gok7BmZUwvYxsoAkYrJ0MP7TrT9SwaeJrftnQ9flg42VhjXnKEAARhRTFGVWATUmIu8oorIb8mfHW67o6da5LWlYqKPXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746659618; c=relaxed/simple;
	bh=oks4fgb3CJWE8iGA62ZeLa54XahflSz0K/NBji95FeY=;
	h=Message-ID:Date:From:Subject:To:Content-Type:MIME-Version; b=kEKVOncfQ7H+AB3YGIUyNIQYQNwMrkmFgy+7ThVXb8T7nHK+dZa7/f/czRF/QPHLa2/fyHCtS8tJ/YNulw4pjdijfBnxMGZ41Q08IhxH/UbTiJcVAaZ2ydHSpZhyIQY67nZv1KCy7wDFBNteck5iTe3pqDodbuZBUJBGL0bGVUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=MeBVs8pI; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="MeBVs8pI"
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547Mseq0016190;
	Wed, 7 May 2025 16:13:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=s2048-2021-q4; bh=5q0cjupS4kwj6dIBzg
	o6P/z/v3QWwp/R8nN5DNFfSm0=; b=MeBVs8pIko1noSvMCOocB2L0Yqf9+DUruq
	a+1PVs4Ri2oG72OkK//hcYrYADDUjQjiJYaUMs1Zoyg6oAV+dcKC5Jw5/p6yLGMJ
	l4qYYKhbZhGAPhjkQYnej8D/5Fu8fbf6hQzVhOvK8m+CjrpgLoHPSe+hnqK7TXMb
	ZfOxWjXUosgBHYNsOWxcPxd0gODQQ6NIrYd1NGNzSxtjHD+u+5NU5cV4IMx4vjaK
	fM6VT2nMkJEdE0lqJWsaA/kn9vN7ptxQuGvuV0+1jSJtRdyfmMdin+5Tn7naL26r
	qatNjELce7l7pKbCTInggg3F4uX63QXO0XrjF0ixe2CX8sFiVLYw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 46gg6u8b0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 16:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwaZ/3UvKY0YyxYC52q8ue6E3tiO6H0ER8jr7t8cSiPMggo8CmZS4FNfgLM6ENOYaLGJMiFMJPO9OH8A6PTL2lXg20TdSrjCBSj1XUQOAS11vUFSBAzCdn0kQTQJ12TUMUWdz4+5UYTRe46Wqws20vL2/08bXhVJ9bWapnCy9KfpyqABem8dDxhR1ukk5TedneAT962NNT3xYh0io/Bo8tosE2OEU5EZBVdWjORJznKQTQTBCYer15Z2JjSBZ9Hib5/G9Xa7VpsP3T23CR3mMKMvTGLJ3BksT2IoCHcEinK0cfvYIFJHRhpVKSUTUyGVyBy30vP2zhDzg+IEui69nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5q0cjupS4kwj6dIBzgo6P/z/v3QWwp/R8nN5DNFfSm0=;
 b=Fdqod6rr4sVM8c3Cwk14q7+pBCxhEw0WrRWkADnnqza3xjr0N5viqlQJEoYpe1ySx5CsJYn33a+0bN+ai13V2HK4FGTb4LNCiwiep9QE5HDIdN6cbaYLig6kkvYR8HQAH5KKkSGACfqarO6iz8nfTLKeIBYWhkK7YziOmOUI2hnspOTylbFYToTXRsdDGpstdJ7JsRH2gCmu/yKmXu+LIXQFd1cN3e6yDawQP6cASVbAkaSao6Tjv1mwR5yU2Q4lKE+P8G44PbUy1czwRA9Ie7n38rOqVJpjhoT8TMG7ScZeHc+/KDXnc6TiXEts/8Kj2Asfs8+rD6w++1aC6fCNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by PH0PR15MB5639.namprd15.prod.outlook.com (2603:10b6:510:26d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Wed, 7 May
 2025 23:13:27 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0%7]) with mapi id 15.20.8678.028; Wed, 7 May 2025
 23:13:27 +0000
Message-ID: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
Date: Wed, 7 May 2025 19:13:18 -0400
User-Agent: Mozilla Thunderbird
From: Chris Mason <clm@meta.com>
Content-Language: en-US
Subject: scheduler performance regression since v6.11
To: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0132.namprd02.prod.outlook.com
 (2603:10b6:208:35::37) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|PH0PR15MB5639:EE_
X-MS-Office365-Filtering-Correlation-Id: 02d93a72-ba92-4c61-dc09-08dd8dbcc5c4
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVIrUW9OaDk1clpqRUk4K2hudzJZV1NCMHB0VUhibnFyYkYvK1dlQ3VGRkV5?=
 =?utf-8?B?YmowbUhiK0paanYxcGZ6QTRiU29vTmlpbExMdG9EV1VoQ0xXTkxqOG45ZVo1?=
 =?utf-8?B?K3ZaMFh2THVla0RHL0NlNWJvb0tFTmx0Ymw0dlRFZzFSMVJ4T2gzUmNBV29B?=
 =?utf-8?B?OEZVY1BWZ00vOUkzNUFyeUtCTUNqMmJMU3pEVjVEemJnSXRnY1JLTE1nUEdD?=
 =?utf-8?B?Y0Ixb2liUXZ5UTRkMEtpL1JtODZMWlJnWElzUTdEK1lIdG56WU9CUks3WDBJ?=
 =?utf-8?B?cGx2VnRrNDZIYkVVNjlJZzV3emVPdkhHZi9XdDI2SWI2SHlxRkZ3VGNoVDds?=
 =?utf-8?B?Wi9LVXVsc2tOZmhJQkt1bzcyOTdPdTJ6MHpLR2gvSzZXbjRUMzZmTm9MMURS?=
 =?utf-8?B?dVVPR3NyMzQ3QWlsOGs4RjYwRllraWI3UW8yc3B2NkFDV3JqNXJ4ZTMrckd0?=
 =?utf-8?B?RzhLR2h6bTFZWHN6emwzRDdIZGdrcUZoRmcxT3JZSWNjRUJzU3VPU0E1VU5I?=
 =?utf-8?B?eVptdkZhWWRPK3ZsTTJyc3NzZkszQTNHUTZuSUNKZXRTNUNUNTB0V1ZRbHU4?=
 =?utf-8?B?L013NnFTTmQ3ckE5NlVuWHhtZnFBQ1Fuc1VoY1lLbEFpU2xTa1YybzhMWFo2?=
 =?utf-8?B?K1MxazNXUmVqdC9vZzAvT2pjeE9XLzJiVHRKamNFT1N1TzMvTkgzWmdNVFp2?=
 =?utf-8?B?UkVOLzZaOFF2NjErSWZneE5uRDlhR21OY2xOaDJxMFd0c0NyMDhhRUcvSWcx?=
 =?utf-8?B?NlZ4ZCtKUHNpSjV4dHl3dW5zanRzMTdXeFQ4NmVqOFlFYmZZdngzWmxMM1U2?=
 =?utf-8?B?R0crUXZKM09JZitvZzhaNmpRTitzRC9FditxSDUzc1NHSUZ6Lzc4QWZzSUxG?=
 =?utf-8?B?SWdTOFpLSXllRllOcm1wWktsb0RVN2E0dFZpQkU3ZDdhOWIvVFJXVDAxWUtE?=
 =?utf-8?B?aTFmU0ZOV1d6OGZnL01ESHZna1J3TnRxVGlhbGJEbjdOZDh5RDNXZEl4ZnFv?=
 =?utf-8?B?U2VBVktVaC9jdlVCcktyT2E5Q3pUN3YvcVhpVW5DUFV6OFR1QWhNWm5lTnJj?=
 =?utf-8?B?UDVOaVVNTzNpMkRFNTl0SHlmNzZFT1dSc3VUdnUxUGV5WHVmVEhHRWdwNU05?=
 =?utf-8?B?NTR5MDV3VmdHN3lyQ3lPVnVNWWhaSDREU09UZk9Od2NZOGZpdFN0Vy9XTHFx?=
 =?utf-8?B?TnNPYW1NMXB1L0tVdkd5dDJBOHpyUjR1R1J6UFZOZk01UWZkSWlNTGhnT2Fy?=
 =?utf-8?B?UHZhNnIrNnk2WXkwZ3dtakdRbnB0WVZOQnVPdU4xRGVWdWVpWjUvOGNGSXdq?=
 =?utf-8?B?V3FaV0Rzc2hsY0FseDdvMUhobTF2empuNStPdWlEclJ5emYzMkRnZC9wdjds?=
 =?utf-8?B?M3B5VjBoZWhqSENxUm45WFJ5UVo4d1NBS0hFTHlVWHozTHhlSitzd3BVMHhi?=
 =?utf-8?B?ZTFUZkxPV1F2dW9rWDUxdHRwTWVnUkp6Mm9wemh4Qnc0RGM1cWFDanQzMkNM?=
 =?utf-8?B?eHV6UGtWNFd2Y2I5ZGVlN0VCYXZxTVozOGprdGxWbnhteFhsZkhIS2tFNXl3?=
 =?utf-8?B?L3p0UDNiVC9MVjhkUHRpR1hrM0E5SE5qUmFkay9ub3UySzh1c0I3OVZLUVJo?=
 =?utf-8?B?UlBVcklBSE1Kay9tV28xZG92Y0UwYnhZcHp2MGorckZmL2JxckJOWlVlZGZp?=
 =?utf-8?B?MnZUVmdiMzd5eVhSVEtGRU83Q1ZrcHZJVXJnclNoSHpVK0JFOG80V01wZk02?=
 =?utf-8?B?T1ExSjJtUWw1TnBwRG45dU8wZktFNUMySE9DUGZBU0dMYy83c0xrRWw2bm5R?=
 =?utf-8?B?dVhqN3ZHQWpuKzYybHZNMlZGLy9PajRIeUxlajExNUtTM3N6WXlyYTl1RlJI?=
 =?utf-8?B?aENlZ2NPdW9VTGsvWVVhVzM3UG9IWTd2M1Y4TnJPY3AzYXh0Vk1nTDRMQTdZ?=
 =?utf-8?Q?ylxjZV97zdk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm0yMFZDT2J4N2ZSdTZmTHIyaFJ6TmZ1c2dnVlA2S1hiRmxBZS9FL0F0K3N1?=
 =?utf-8?B?bUIyR3lrRk1aRGNNWTVTUm9QMDNXeGpkQS9Oc3dVbElvTTRwVGNFdEswc1Zm?=
 =?utf-8?B?VWtmQWhKSXRPeU9CVGRTalBvMWtCSFBhdTBINzNGeE4vL0JTa3lpVldXNWRP?=
 =?utf-8?B?ajhjKytxYlBKRVJ0amZYWHFZRGo5WjR4QUowODVYODJQUXdpKzY3R3dKdDlP?=
 =?utf-8?B?Um1QR0liYlQvR3lBQTRYWWlLZDBnUS9xeXJYcHNCbGw3N0FFMGMvREErQXh0?=
 =?utf-8?B?akRNenZWcndlTjI3d0ZUK0prOUZRUUNYbFJESXdwVGd4ZkFka1Zvcnl2dHJH?=
 =?utf-8?B?R0d1K0hUWVBxdm1EcEFpdnlLdUZLdlNsUVAvaWNTb09BUDI5WE9aaWkvdFZn?=
 =?utf-8?B?M0hlK2IwQit4aFU0ZW8yZkFFbTExTXE5Sm1nS0YxcGQ3K1NMbVNvYW1NNU9s?=
 =?utf-8?B?c1hlK2ZNdDNFd2tTUEVKVnZvdXFhcG00aXFiQlBscFQ4cWI3VGJiVzdBSmxw?=
 =?utf-8?B?d3NDdE01ZUpEWUI0WEl0eGZxeEt2YldNSXNYdDZ2VTdWcE4vREk2WVp3N3NY?=
 =?utf-8?B?cm5wVnZuaVF4dVFPa0Yxb01NbjVsVVQzZ2lpYlpZQ01YRG1JNFJycmhDakYw?=
 =?utf-8?B?QWZKbzRROVNsNml0RHdveW1CV0g3aGpYRnNzNkZqbk4rc0FOQzc1U0dLN3ZH?=
 =?utf-8?B?VTVjYnpPMXhyM3NKMFRjT1A0cDNBNFpBc3c5TlV2RDVrQ3ZvbXpjVmx1ZXJ0?=
 =?utf-8?B?TnY2STVMNVZKU0U3S0d0MTduSktKdDhhdmd3YUlidkJVeWFzRjFkZVZOTktE?=
 =?utf-8?B?Z2dhWHQwWVJEVTZGVUhWYkZkZ1pZM3dYZmxGdlREQlpWMFRRMmpKSlRld3hx?=
 =?utf-8?B?ODBadFBXV0hydkxEenRvZU9rTDFObU13QlNoOFM2YktzWjlQWFdnbnB4VnpV?=
 =?utf-8?B?b0grQXVQelk4MUdqT3l6MEdhdG1tRUF6YnVnNmowSlRsdWxjbEF6WEFuVzlX?=
 =?utf-8?B?RTVVVmtMVjNjUXVpQ0VvNXJtUUlwSjdaVjYrSEpydGo3US9YQmRST1lHdXVK?=
 =?utf-8?B?SllmejNHZ3pENEptQUc5V1pKcVI1VVdQVmdsU01QMGFHZ1hrc2NTRjhaR1A4?=
 =?utf-8?B?RHUvZjZ4RG1Vb3RYaHJmZTZkcXNXT21pY3dXQ3R3NlBpTWpQR29hdTZneGtY?=
 =?utf-8?B?cVBHWjlTRERNNEIzV1V5eHJvc2FJa1lRMmtndWhsYTZ5dXpSOE8zVEZiNW1X?=
 =?utf-8?B?SkRmeTUyTFh2U3BnNnVNZ044cTRUa09aKzRtVUNMalp1VFcvc2h2QS9NTnhj?=
 =?utf-8?B?RmdoUWJOQzhIdDJ3TU1VcTNIdi9hRmptZ2xhMVdlRE9WdkVabURzaVpnWlln?=
 =?utf-8?B?R1VucEhTWW1qTE1jdG1iSnpqVmoyL3JLYXdTOHMzTURobmV2SnkyR2lTWFcv?=
 =?utf-8?B?TlcyOWo4b2NqSVFMc2ZNeVFsQ2NPc3pSb3l0a0t2M2pwTlFXc2t3TW5HZ0xY?=
 =?utf-8?B?Rzd4ZGxCS2Q2b0dZQ0dNQURKcDhJczZKL0dvdGxYVmh0ak1vajBGVFZ0VTV5?=
 =?utf-8?B?VHAxVTBYcVh5d05GNVRycmpmQm9iUFBNNjZucW5kaDljdUt3UnRGMjNGcnJT?=
 =?utf-8?B?Q3YyQUhkMkJpaEJXSVMvZ3dVQkFsQlBNdWtmcEhObmhPUTlQUGtHVUhzV2sy?=
 =?utf-8?B?bjV6SUtrMGdyZnByYnVNTHEzMTJ4ZW8yQVBocE5CT0lQZEpjWk82R2JkU0lN?=
 =?utf-8?B?bmg3bCtTdGhMM1FpMWt3dVIyQnFaaEVIOVd1Mi9GQTFxZmxMeUJtRTZINVNX?=
 =?utf-8?B?bWZtQmVjdFlKR2V4N3lnYkd2WXRzNmhSY2lsTUh6Yzl6bXdROGJTYXVjcVVu?=
 =?utf-8?B?UDRrOUh3WFdBS3czTGU4YUtLRUdsVXp3Ti9kejJoOERFVWdiUkRoY25iNWV0?=
 =?utf-8?B?VUplK1FuRkdTQ0o2a1RZSGY2OWU5ZWtIN1ZNdllUR0UzSDY1QlpaaW9QZTVO?=
 =?utf-8?B?VzVoL0N5b1F0YWx3N2p1Sy80Ly81bUl2NFRhMTBDbEtRbFNhTlBEdE9zSG1X?=
 =?utf-8?B?REJXZkxDcDAySnhuVkFGK2FGYXE0aGlMRjR1VXgrcVhsRWJ3c1h4QmJYdmpE?=
 =?utf-8?Q?4Kaw=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d93a72-ba92-4c61-dc09-08dd8dbcc5c4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 23:13:26.9341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fk9qnoYxMSnyxOW3lr8z3k4PE0+lgu3z1CJQwpBCD+slAk6JML5qcaSs3my4l2Kh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB5639
X-Proofpoint-GUID: l0kayZaBGpcS1WWcWCDcUzlvyqAOY2Nk
X-Authority-Analysis: v=2.4 cv=D+9HKuRj c=1 sm=1 tr=0 ts=681be919 cx=c_pps a=yF+kfS/uWKtSACHbTM5LMQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=VkIDGP5pmh-bV7aFNsgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: l0kayZaBGpcS1WWcWCDcUzlvyqAOY2Nk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDIxNyBTYWx0ZWRfX3SpMEaY8tgay XW5w0JgqjtpMm40Q8waz9G0XMewSc3WTZ2X6jfqkHJIrbQTHLKEvmSnGRBkFyEi+QoI9hg8NcbU dO0vYkT8w9iWUsDynPAg5X5onULogzs4zmhkDA4r56vJm0GYt6vuqR/PgOktPA0GbJTD/1RKuZw
 QP1cI4ZmAMPG/15UmTaJ5f5iSPjlevI7k7FsVloTQKtM/QHZayLQREtKSMPFLkxwiJuiIDEYFlC /xAryoQ6k8pJ8HvsGZxfLZX6Oo4ZYD+R5KflgbgCWsj13I+6iNsVZ3mKl1Y4a2oO+1axZ81njnE vSKFt0Wupqrqwrj9CpZtYxz5XD2Lo4PLsOVxLsPHFnaEvJ3RScfutWqZxyi7qRN6/+iCOd6gzyF
 C7Ai+noKfztDcU5CZpylqC9VJ9IxXxoE2J6xo2+oKO670WuNIosfa6QO18kOioOtcy38DbMa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_07,2025-05-07_02,2025-02-21_01

Hi everyone,

I've spent some time trying to track down a regression in a networking
benchmark, where it looks like we're spending roughly 10% more time in
new idle balancing than 6.9 did.

I'm not sure if I've reproduced that exact regression, but with some
changes to schbench, I was able to bisect a regression of some kind down
to commits in v6.11.

The actual result of the bisect was:

There are only 'skip'ped commits left to test.
The first bad commit could be any of:
781773e3b68031bd001c0c18aa72e8470c225ebd
e1459a50ba31831efdfc35278023d959e4ba775b
f12e148892ede8d9ee82bcd3e469e6d01fc077ac
152e11f6df293e816a6a37c69757033cdc72667d
2e0199df252a536a03f4cb0810324dff523d1e79
54a58a78779169f9c92a51facf6de7ce94962328
We cannot bisect more!

And this roughly matches the commits that introduce DELAY_DEQUEUE and
DELAY_ZERO.  Sadly, echo NO_DELAY_DEQUEUE/ZERO don't fix the regression
in 6.15.  I had to skip ~5 commits because they didn't compile, but
Peter might have already worked that part of the bisect out by the time
this email hits the lists.

I've landed a few modifications to schbench
(https://github.com/masoncl/schbench), but the basic workload is:

 - 4 message threads
  - each message thread pinned to its own single CPU
 - each waking up 128 worker threads
  - each worker sharing all the remaining CPUs

Neither the message threads or the worker threads are doing anything
other than waking up and going to sleep, so the whole RPS count from
schbench is basically just how fast can 4 threads wake up everyone else
on the system.

The answer is that v6.9 can do it roughly 8% faster than 6.11+.  I've
tried on a few different CPUs some have bigger or smaller deltas but the
regression is consistently there.

The exact command line I'm using:

schbench -L -m 4 -M auto -t 128 -n 0 -r 60

-L turns off the locking complexity I use to simulate our web workload
-m 4 is 4 message threads
-t 128 is 128 workers per message thread
-n 0 turns off all the think time
-r 60 is runtime in seconds
-M auto is the new CPU pinning described above

I haven't actually tried to fix this yet, but I do have some profiling
that might help, or is maybe interesting.  The most important thing in
the data down below is probably that 6.9 is calling available_idle_cpu()
16M times in 10 seconds, and 6.15 is calling it 56M times in 10 seconds.

The next step for me is to stall for time while hoping someone else
fixes this, but I'll try and understand why we're available_idle_cpuing
so hard in later kernels.

6.15.0-rc5 (git sha 0d8d44db295c, Linus as of May 6)

schbench RPS percentiles (requests) runtime 60 (s) (61 total samples)
	  20.0th: 1767424    (13 samples)
	* 50.0th: 1816576    (18 samples)
	  90.0th: 1841152    (27 samples)
	  min=1733207, max=2027049
average rps: 1813674.47

v6.9

schbench RPS percentiles (requests) runtime 60 (s) (61 total samples)
	  20.0th: 1955840    (14 samples)
	* 50.0th: 1968128    (17 samples)
	  90.0th: 1984512    (26 samples)
	  min=1908492, max=2122446
average rps: 1972418.82

6.9 perf from CPU #2

    15.50%  schbench  [kernel.kallsyms]  [k] available_idle_cpu
     7.45%  schbench  [kernel.kallsyms]  [k] llist_add_batch
     6.92%  schbench  [kernel.kallsyms]  [k] _raw_spin_lock_irqsave
     5.90%  schbench  [kernel.kallsyms]  [k] futex_wake
     4.62%  schbench  schbench           [.] fpost
     4.57%  schbench  [kernel.kallsyms]  [k] futex_wake_mark
     4.46%  schbench  [kernel.kallsyms]  [k] select_task_rq_fair
     4.26%  schbench  [kernel.kallsyms]  [k] _raw_spin_lock
     4.19%  schbench  schbench           [.] xlist_wake_all
     3.95%  schbench  [kernel.kallsyms]  [k] _find_next_bit
     3.55%  schbench  [kernel.kallsyms]  [k] __futex_unqueue

I don't know why perf record -g and perf report -g aren't giving me call
graphs, must be something funky with the fleet version of perf and my
hand built kernels.  But here's the top call stack for
available_idle_cpu(), along with line numbers from blazesym.

12313 samples (6.66%) Comms: schbench
available_idle_cpu @ linux/kernel/sched/core.c:7437:7
idle_cpu @ linux/kernel/sched/core.c:7415:5 [inlined]
select_idle_core @ linux/kernel/sched/fair.c:7301:6
select_task_rq_fair @ linux/kernel/sched/fair.c:8219:13
select_idle_sibling @ linux/kernel/sched/fair.c:7618:6 [inlined]
select_idle_cpu @ linux/kernel/sched/fair.c:7420:24 [inlined]
try_to_wake_up @ linux/kernel/sched/core.c:4363:9
select_task_rq @ linux/kernel/sched/core.c:3637:9 [inlined]
wake_up_q @ linux/kernel/sched/core.c:1030:3
put_task_struct @ linux/include/linux/sched/task.h:127:7 [inlined]
futex_wake @ linux/kernel/futex/waitwake.c:200:9
do_futex @ linux/kernel/futex/syscalls.c:131:1
__x64_sys_futex @ linux/kernel/futex/syscalls.c:160:1
__se_sys_futex @ linux/kernel/futex/syscalls.c:160:1 [inlined]
__do_sys_futex @ linux/kernel/futex/syscalls.c:179:9 [inlined]
do_syscall_64 @ linux/arch/x86/entry/common.c:83:7
do_syscall_x64 @ linux/arch/x86/entry/common.c:52:12 [inlined]
entry_SYSCALL_64_after_hwframe

Call frequency count of available_idle_cpu() (10 seconds of sampling,
system wide)

@counts: 16273429

v6.15-rc5 (sha 0d8d44db295c)

perf from CPU #2

    17.53%  schbench  [kernel.kallsyms] [k] available_idle_cpu
     7.11%  schbench  [kernel.kallsyms] [k] llist_add_batch
     5.75%  schbench  [kernel.kallsyms] [k] futex_wake
     4.98%  schbench  [kernel.kallsyms] [k] try_to_wake_up
     4.89%  schbench  [kernel.kallsyms] [k] futex_wake_mark
     4.51%  schbench  schbench          [.] fpost
     4.48%  schbench  [kernel.kallsyms] [k] select_task_rq_fair
     4.28%  schbench  [kernel.kallsyms] [k] _find_next_bit
     4.21%  schbench  [kernel.kallsyms] [k] _raw_spin_lock
     3.98%  schbench  schbench          [.] xlist_wake_all
     3.20%  schbench  [kernel.kallsyms] [k] migrate_task_rq_fair
     2.95%  schbench  [kernel.kallsyms] [k] _raw_spin_lock_irqsave
     2.90%  schbench  [kernel.kallsyms] [k] select_idle_core.constprop.0
     2.83%  schbench  [kernel.kallsyms] [k] __futex_unqueue
     2.78%  schbench  [kernel.kallsyms] [k] set_task_cpu
     2.70%  schbench  [kernel.kallsyms] [k] clear_bhb_loop
     2.14%  schbench  [kernel.kallsyms] [k] remove_entity_load_avg
     2.10%  schbench  [kernel.kallsyms] [k] ttwu_queue_wakelist
     2.09%  schbench [kernel.kallsyms] [k] call_function_single_prep_ipi
     1.34%  schbench  libc.so.6         [.] syscall

17128 samples (9.06%) Comms: schbench
available_idle_cpu @ linux/kernel/sched/syscalls.c:228:7
idle_cpu @ linux/kernel/sched/syscalls.c:206:5 [inlined]
select_idle_core @ linux/kernel/sched/fair.c:7621:6
select_task_rq_fair @ linux/kernel/sched/fair.c:8637:13
select_idle_sibling @ linux/kernel/sched/fair.c:7938:6 [inlined]
select_idle_cpu @ linux/kernel/sched/fair.c:7740:24 [inlined]
try_to_wake_up @ linux/kernel/sched/core.c:4313:9
select_task_rq @ linux/kernel/sched/core.c:3583:9 [inlined]
wake_up_q @ linux/kernel/sched/core.c:1081:3
put_task_struct @ linux/./include/linux/sched/task.h:134:7 [inlined]
futex_wake @ linux/kernel/futex/waitwake.c:200:9
do_futex @ linux/kernel/futex/syscalls.c:131:1
__x64_sys_futex @ linux/kernel/futex/syscalls.c:160:1
__se_sys_futex @ linux/kernel/futex/syscalls.c:160:1 [inlined]
__do_sys_futex @ linux/kernel/futex/syscalls.c:179:9 [inlined]
do_syscall_64 @ linux/arch/x86/entry/syscall_64.c:94:7
do_syscall_x64 @ linux/arch/x86/entry/syscall_64.c:63:12 [inlined]
entry_SYSCALL_64_after_hwframe

Call frequency count of available_idle_cpu(), system-wide, 10 seconds:

@counts: 55867130

-chris


