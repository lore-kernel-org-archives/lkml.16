Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C482A1D1
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.29
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751254463; cv=fail; b=DyOe/GhOsCKp0rYbROIBGymjf0zSiJ36ZHwLyA/4CdQPJt2a0eqtZEq/gdCTWCwqiMww3KSW+TsBixaqT3o+UF4cPeFmyASEFu5Pqjd65CyEgW6myhiWD8PmpFzEO1IFDZQFCq7ufqTYbf3qfqwLrYZ4mFFQCnsOfXUwiGdJ8Wk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751254463; c=relaxed/simple;
	bh=K438KzaL1Sq28/bgZ401yP4EcmcBREnP+bdmIZ+NQW4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nd8btqhrqIR+sOg0iLYqimiUxBOU7ILiqnEOixvsU9jvsl5Py3wduaBgW8HBHPgEAkqqOtCfI7x+OWO/0uLP0ES59ezzE0sYGDh1QC3HGwfKK/7a4JXMev4wFzWdW5NdrwEbCeuvmpSVX0zcTgzuLRgl/Rfyl11D7FG3jiF/UhY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=B8vnsakK; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=B8vnsakK; arc=fail smtp.client-ip=52.101.66.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="B8vnsakK";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="B8vnsakK"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oIvSVSO0PRaZxH5U3Ye2z7mz0NxvrAAi6+tCuu0UVBF05oFXDc6zN/C8L9FiI3pKjTxNvyXd1dT8rY4lzzY9w7BJtIZN5lGg0VMBNqbH7Qzf0IMaEwFRXU3zDll1iURupIUIY5I6C/46j7Aggv9BLxZpf47aEBXS4vptjPNFKHfgUlkPHWcVnPVF4HwKqjw946EzCnHQeqscpGVffZ8EJzzkxllDNX7/PpS7jCX+kr4ckZYj31h4cvsVjuFWm0v7SlBpu0086WDVo3YhWCOaGTUT+3D0ERbv5gl95YAIKQHnrCk6nWuxwOQdQGD/PcF/G68nxhs3GkjRVqR6Ms9obg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQWCutE7FbxH197WHgz8lrzHa92Dmkj7Jy9VeuadSdY=;
 b=FqAPpn7AeQ1M+1J+QvF3QkthT9e9luew8FixjxxhSV4wVldk6mB2J5J9pHVgwW+k0/ecIGYwL8IdpgzEcVVQYZ1vbjZbMDne4OhVB+30MXmZ/qh95/y07KHvL37inXTriSZN+iyfaaJ2TFMx9OFxWYTlkCccuVuvBW8ruuBnUK0ViRh7B4A5XFcfr14s98r9rYnpDE9Wz4E06pzvyiy+tIQFXW1Jdwx4lRFE9WkEy4MzmziKk+KPjX9fGeiHM6jAkSgh4ZDyuISFy8zszdMRSEmjZMow1KgQj37R+29ChMKRj4TAs1RLy0kJ89z97vlDCyAPvKuOfm0dacLpRGsimA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQWCutE7FbxH197WHgz8lrzHa92Dmkj7Jy9VeuadSdY=;
 b=B8vnsakKXarX1F7+bCaH85miYaTJCtcMW6ps9F/+s662ve/oKM5NSQkDJ99ZdbyOAFKLFpNwAXj99JUjJ67LUgscDN4yIyTF3SMvI18pvwzukk7VaWiqcqMEkSkBnpiCXnqUmV99cg/iNihbAIc8yfk2oMGbiXK57yNERPflxD4=
Received: from PR0P264CA0066.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::30)
 by PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 03:34:15 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:100:1d:cafe::7d) by PR0P264CA0066.outlook.office365.com
 (2603:10a6:100:1d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Mon,
 30 Jun 2025 03:34:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 03:34:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ke8AHxxJguoZtDsNZHcR2B2XoQ83JSuG9qJACrFIxKdFT3NM8e5XESqf2gucmu2qEjoSRONYXAfUruuPaDQF2yM7AkChBiySIgiiEx3FesPGp6UO9/HE89+2np9H22qnpXGVWGIDhyw5wiUO0SGU5kq/uxjXegnaLCTNqW286SmsdvLljvSKx5YbwpVARmxGxlqprvswpkk/PRv5WKLMKPU1i56gDtfRhMLCPSZ30jJaktd36wQRoRgU68qhkCpVuDOhWi8v+YEPTLNd62JDpG4wxtAQHh0k/i/8qJToXR8hEkMSTa5ENhf6LODPQiq+B9OO/hHnde7DLsl+QsR1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQWCutE7FbxH197WHgz8lrzHa92Dmkj7Jy9VeuadSdY=;
 b=ioteu6yopt1h3+2LAlg4ykNZq+BXUI3kuNs6Mx7zKEBQqETt2KVca0V+W+DlF9wP3QRMeucyOmxpiv8z1IcZqzu6Z5OCZ5uFenTIgYHHIpsNmacfB/J702G9pdGnBNDuQQ5ju3kcn+/rF82Z0q1x/wnS1Kwd/gWuO1g9IRv3zWKhbKKDffuGKREnadkbtOF1e8W/UmdE9Tk97BU2OlamTxltc82e2f47gtxBqxaMIzPwmNMpLicgvGxc3elC9OkNdp51uShzUdP66AtilWtv49hpvLvvdGhSmnyRiUFgJuvkbRoySwMktlGA9Zzw6QZWF/IRrG9FETtXVUutrBOJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQWCutE7FbxH197WHgz8lrzHa92Dmkj7Jy9VeuadSdY=;
 b=B8vnsakKXarX1F7+bCaH85miYaTJCtcMW6ps9F/+s662ve/oKM5NSQkDJ99ZdbyOAFKLFpNwAXj99JUjJ67LUgscDN4yIyTF3SMvI18pvwzukk7VaWiqcqMEkSkBnpiCXnqUmV99cg/iNihbAIc8yfk2oMGbiXK57yNERPflxD4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS2PR08MB9521.eurprd08.prod.outlook.com (2603:10a6:20b:60f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 03:33:40 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 03:33:40 +0000
Message-ID: <29f418be-31c4-47b0-bcac-3375f57d00e7@arm.com>
Date: Mon, 30 Jun 2025 09:03:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Optimize mprotect() for large folios
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250629160549.da922e78d202c510a1ec68f8@linux-foundation.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250629160549.da922e78d202c510a1ec68f8@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::18) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS2PR08MB9521:EE_|AM3PEPF0000A78E:EE_|PA4PR08MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 92cea16d-71ec-4823-3575-08ddb786fcbd
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RVhib2lwc0MrRStiOFlWUGhYSUVyTXQvQit2YjVLNFdZVzRPWFFVZ2tqZjJh?=
 =?utf-8?B?NXcxZi80UWRlL1MrMDBwZ3c1cldMTnZVclVRd3ZvdjFXVlllVzRzT2VhS1lo?=
 =?utf-8?B?Wms3dHJ0RytObGxjS3QrZXREc1V1OTQ5NjlVQjkvL2lPNzdLbEQycmhJQXJB?=
 =?utf-8?B?NXU4b3cvdUlGK1U2QXFIcXgwWi8welpCbDdNT2ZVcFpLd0YvcUVsSzhsZ24z?=
 =?utf-8?B?YWlLTE5uT3k5WE5qL0NPaHFYNm5NS09ySVpsOXUxdlowVytkVkI2dnZ4bU83?=
 =?utf-8?B?T3V5YkxmQkRhSFpVU0lKS08waG5RKzRjRDcyOXlZWXB5ZDlmQlQybkpzVXFy?=
 =?utf-8?B?Q1NxbFJsUzhweVd2cWhLUlh2WVRTQ3pVQ21CNU1udTkySjVKTWU5bWN4cTlj?=
 =?utf-8?B?WXVkcjdVdFd3N1N4VVg3UlRWUzMyNHdmMTROK1Zqa1AwQ3FjQzhvbjNqSVZt?=
 =?utf-8?B?ZUlHTWk0KzkrNUdxMUpkMmRQeUJ1ZDJqSVk1MldMWGJXZVhZODdhcVp1a0tn?=
 =?utf-8?B?UkdsTjAyaWtDT1JZWGI5aGhPbHdiaW5tN0lUYmJLazNHYW85QVU1b2VLTzAv?=
 =?utf-8?B?OTcyMlBoVXc2elJwemNBbTZkMXVvM1g3STZRdmw1WHY2WmYxaDVYOWxITHRk?=
 =?utf-8?B?TE51WndVd2dOUXI0YVM2MkVJeVlhOFlucWFSWjhSVUVCT1BFQXJ0ZldISERp?=
 =?utf-8?B?dWFuY3ZCOVFPUmxsYUpWemJMdG9BeUVCZXpUUE9QTFZrUnVEQUZPbThWQ3lO?=
 =?utf-8?B?ZzRPRG84SXBIMjRwaW44Mng1TjlLTUpjU0trazkxTWNCUjI4SmgyQmlDdVFY?=
 =?utf-8?B?d3IyZWZLMDBlNUV0WUl6Tnp4R3V1eTdzMVUyRFkwSHREZGphdnMvWUJ2bm9H?=
 =?utf-8?B?dmNaN09uczcvclZxTG5QNllieUNia0hMdzQ4UEl5RjFyaXZYMXVTRzE5MEdr?=
 =?utf-8?B?UHdrNUVYcm9pTFBLNW5nSHZMdzVMSlJyVHl6MzdTR3JXT1FSbWo4QklZQkdS?=
 =?utf-8?B?UUhpbmltVk0xVFFObjJRL1RYY3dQQTFlUU42NW1HM3RvU2JoSFR2S3Z2RU5o?=
 =?utf-8?B?L01QSDBlNWNubWViY01NVktubWIycUpsU0F3WnAwSjFWNXQ3REU2UlpCemdU?=
 =?utf-8?B?TW94azZzVHlvWnhnM1VlckNWZDRVR2NwT3huTGErclJ6N2Faa29ramFBZ0xu?=
 =?utf-8?B?WEd3amFaSFBqU0lTYzM3Mi9LalNLSkNiUnExTUc5ZTQ2MTFLbExCSmI1RTI4?=
 =?utf-8?B?VUYyNldzR21pUjNJaDlpSGgwNlRmTUlmWU9oYzZyR0liZTEwN3pvakdvSHFL?=
 =?utf-8?B?M2ZyNzlNQmw4UWI0TTVQeVlFSEpUWmJvTXdoK1NpMVdQRE91L200Z0FRSC8x?=
 =?utf-8?B?R2hIVnltb1cwd21rZlNmTXk2UXlTU010VmJNLzZjM1E5eGdwZXlqQ1dQMHRV?=
 =?utf-8?B?UElXTHFGcXRLTnRkSzgxcnJDcDR5Y1RWSUN3TUFaelkvc25iZ09NRnRQWk9s?=
 =?utf-8?B?Q0lKNHhrY3FBcHFIT1NHTmc4VWNvNGVpQzBGenc5VmhqbjBqOFhlc1hyMW9r?=
 =?utf-8?B?UGQ1c0VjTnF4ZTJ4bkwybndvcDNtcytab3VzdjQvRVp4aGdGVmpmV0N1cGhj?=
 =?utf-8?B?Um9KQk4ydUlJZ2Vma2d1azh4QUh5dXZTRno5cklkVEo5c3JONGsyeGpHSUNh?=
 =?utf-8?B?blFGV3VUY0RtdUhyOUxieFVvSmJ6M2NPRWZyZGtwVU5lSWM3bHhQbmNtSUc2?=
 =?utf-8?B?RGl5N3NQMGs3SmNFUE1KUnBEOFJ0WkZrTFBpTWpTUGRJTmVJZjNyT2xhYmpT?=
 =?utf-8?B?VXhxSVJoa1VtWVVOSnRBSUpJSDB3ZkdCMENMZEhvZ0VQckUyV3ZvNE1xbEZQ?=
 =?utf-8?B?WE80SUlFbVVLZ2w0clVpUXhUdktQTjBRZHJWNzZ4RllyK05DRkZUdTF6Rkxs?=
 =?utf-8?Q?qS0mN1IY/o4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9521
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	128ea3c4-f36f-4a03-fdcf-08ddb786e7e5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWhaaGdCbUdzbUoxekNDamt3bjVJRy9UTnFTOTR6QTZGS25QVk5HQzFESGxT?=
 =?utf-8?B?dlU4ZnpHbHBQS2xRaEJRbmwrUWJJYjIwUno1WlZXdm9zVmVUS2N0SGw0UVJ5?=
 =?utf-8?B?aGRmZDFjSXkzcU9MTk1VMUFGRmNJdnlDNTdsUEh4U2JBWE5zRFpnbkdkZWg2?=
 =?utf-8?B?cHM2NVhFMDdGSElVQSt2eEcyN1M1TGxhMVI5MHpjVlQwV0dYRmJGOEQybUZo?=
 =?utf-8?B?VkxHZEhZM3pTVDM5NmJmSzE2S3c5WDd2VUFPanZRN2loSElJL2NIb1RzUlVB?=
 =?utf-8?B?d2Z6cENvTW9vMFhmcGt6QW1ua2cyZzVUNHlzdHF5U043MHR4ckgrbTRWLzZS?=
 =?utf-8?B?NU5qMGI4VExTQk1ITVdNcW1MQ3ZuOE5CUCt0MTd5UnNQa1NWa2MrY09kK1M2?=
 =?utf-8?B?MGRmYXFVRlJrSjNyYUxVallZVENnOXFVU2dUV0JaVDcvTE9lOHpZK2JTMlJH?=
 =?utf-8?B?KzQvbmNyQ2p4MzNhUll4UnVmeGlaMG90SmtHa1ZJYVRLT3Jib0NGWGl0cDJP?=
 =?utf-8?B?K05FNkx3aEhZb3ViNlhCM3lLNHdNeUllMHFjbFRycnVVaDhRWHhtWFBzaXNh?=
 =?utf-8?B?dElmdE0ya0J4Qnd0K1Y1Ti9neEVhYzRhRnFVdSs5SUNMZ3NndUlhQTk4S3Jo?=
 =?utf-8?B?Nkc2ZFA1TEZaQTI2OXREYzR4OG1KbUR3VUF6SGtNT2NVNnZRRGFmeDBvaGd5?=
 =?utf-8?B?cHlRSy9La3JPN25NOXVjc2pxdGpXVlVUWkt4UHErL1BZKy9DSnVtK045a0pU?=
 =?utf-8?B?QXQzU0dOZU9LNGkvaWNLc1g5ZGh1c2h6WDkrdVdNaHhUSlA5WTVLdERpRTAr?=
 =?utf-8?B?ZWcwbmg4cXNKNk1lL0wxdnA3UlJHMVh0SVdCQ3dORkdTSFhoQ3VrYUduZ3kr?=
 =?utf-8?B?Y3EyOExuczNnaUZFR0FueU1VM3dIM2VkNnA0eXlkWUQ0YjYyN090UktWUUpv?=
 =?utf-8?B?aEJFLzY0MUcvUnh1Y3lvZkFiKzg4cjl0eXVzQmNmUVpKalh2WFRhNFA2dXY1?=
 =?utf-8?B?Z244V2xMZ3BPYTE0b2cwTS9FRm5xRWdqRkRNN3QzS0ZWLzRmNndzaXJsZFBm?=
 =?utf-8?B?UE56cXdMbWZaNW8rNXlFLy9WUDNscXpEOWNKbFpsWDBUazdjc1Vla0JjYmxz?=
 =?utf-8?B?emNUUFhjOFI0NHVtNzNLZzQ5N2xyWWxhZWdaUFFHR281N2FlZkJDMW5USVpy?=
 =?utf-8?B?eHRDR29JQXkrNWdodm5tVEhoVGdoV3lkQXVFbEQxTDdscVIrVWh5UWJ1VjFK?=
 =?utf-8?B?ZU93UmNQSWt2UGx6Q3RSbE50OGRZOGV3dVFYSERiWWN3bm54WnhhSFp0eWJB?=
 =?utf-8?B?bk9rRGRxbHVpdEtaQkZ3UlpSTkZrb09rZ05NbG9FVDNHWnVYQlI1SnBiTHpx?=
 =?utf-8?B?cTl4QUQ2elY5aHdUa0c3UWcrY1FJaFlhVW9wZ2xSTlNoYmlyYk5VTnJ3QkJT?=
 =?utf-8?B?a0RqclV2empiZlFiVlNRbXptNnF5aWZmRkdxQk8xSmlPT0szckN2V0xpSWUy?=
 =?utf-8?B?dHM4WWRLaHJaOXA2MTIrQWYrdnd2a1VDcGdOOC9CQlkrbmRVSU1DWEhsMTA3?=
 =?utf-8?B?eG9PckNoL3NDVGdldVFad3FuZXpZSjJzQzU0RnlyRW14VFYvYU1kOFp2UkIz?=
 =?utf-8?B?OSs5RW9FK3ZNQ0FJZWVyaDZnTkFmNE51Um82dlZEOHNqUWhsSDJTWU5WaWRH?=
 =?utf-8?B?alNXWGp6azl3Tk82K2lvT0VxOTBGblVqaU5ISC91VUI2ZFNSa0VCQS9RT216?=
 =?utf-8?B?MGFVUVRKQ1dVZXRjZUVmV1UvOG4wSnpvN3NsR3ZLZUYrQ2FCMTNGYWQrd2JK?=
 =?utf-8?B?SGJiSHV0ZFZzdDllN0U4RHl2ZEFwdXZ0UFQvYmZZczVsZ2JhbUtDd0FQZWsw?=
 =?utf-8?B?cFg1SXhKR0ZxVmZXbGJxMUZIVmRFYnBiMVQydFYxRVk2anVTWTY0anZxc2Zh?=
 =?utf-8?B?Vko4NXlDdTh2cFRPQVQ2WmJIRXRYMmV6dld6NDFpTHNaMENURE4xdDYyQ2pJ?=
 =?utf-8?B?Vkk5cW5pSDdsUlZlVmZaYWtxZEtsM3ZVcjhMeUFFcmdlTzBFMUY2RVNOaWZI?=
 =?utf-8?Q?HDwfkh?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 03:34:14.9393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92cea16d-71ec-4823-3575-08ddb786fcbd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6253


On 30/06/25 4:35 am, Andrew Morton wrote:
> On Sat, 28 Jun 2025 17:04:31 +0530 Dev Jain <dev.jain@arm.com> wrote:
>
>> This patchset optimizes the mprotect() system call for large folios
>> by PTE-batching. No issues were observed with mm-selftests, build
>> tested on x86_64.
> um what.  Seems to claim that "selftests still compiles after I messed
> with stuff", which isn't very impressive ;)  Please clarify?

Sorry I mean to say that the mm-selftests pass.

>
>> We use the following test cases to measure performance, mprotect()'ing
>> the mapped memory to read-only then read-write 40 times:
>>
>> Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
>> pte-mapping those THPs
>> Test case 2: Mapping 1G of memory with 64K mTHPs
>> Test case 3: Mapping 1G of memory with 4K pages
>>
>> Average execution time on arm64, Apple M3:
>> Before the patchset:
>> T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds
>>
>> After the patchset:
>> T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.3 seconds
> Well that's tasty.
>
>> Observing T1/T2 and T3 before the patchset, we also remove the regression
>> introduced by ptep_get() on a contpte block. And, for large folios we get
>> an almost 74% performance improvement, albeit the trade-off being a slight
>> degradation in the small folio case.
>>
