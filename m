Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2102.outbound.protection.outlook.com [40.107.244.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EDE2F004C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194690; cv=fail; b=lYsQqrCj2rvSSN79H7JNzqsi1ynq7sJlQY4WneHhZwcm1LsGh44WUx+Mu+wx6KNHcq6nTNHrSqmFXa8OUveIFmk5uy+QokOpfeIYvkHa9EZQwi2C6OzW6vAn2G0mmpRfESsdeWq9FUm5JUDIq0VyA9ucYp7cAzVzFzr8v/gEhBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194690; c=relaxed/simple;
	bh=O1tKmiV6cI7R98yj1yWzeU6+R9bys0auwxB61/m87wA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ppVHtFOsIbzRPRs4HCLAzXbMqKFoKFDKKDlGphEoHDhduTehpNvqj9bDxDvgy/XosF6ECwtKTUBEuBQ8KW/e/HxJjSPpzzheZ1xFq/hUE76vERG2bbTFH+iyh5E/orPFZ/l5aJLFNJ+Yx8pvdrksffeLbx7XEOipa8xcL1IigUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=M2VDeR+1; arc=fail smtp.client-ip=40.107.244.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="M2VDeR+1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6tByGJzUsafd9VPS8RlUOtb3hP0NGYDFO1LDY72ez1oGYjZ1oWAQhsx501yXNljzACv1+Fp8TbT4MGOkkiBXdnuLFhFAd6ddMr/KQyBnUZ6BJe66OIYfl7hbq/ywbG9jF617HrYg6fLn6AE7/i8R4AkxM5Wm0lQG/qZ1POXaS9mCJrGp8ApSRXrss41bGQ5PzALBVglhP7OnaIZIjGYRhoIK2LXmNPZ6oumCTA0YwP1jlcOUYIJiSZO2F2xuVLQEdMS94u4SzpKFXLigS+khsUiooqopErynqjzvONTpr+gy34UpxVpR55ZdunZE5ZfdvEYOAY7RAD6Ef1bxbKk+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AD7gFHfHrEgMU51ZYG9T4AmN9Bmv29mSbCnUTIhkpcU=;
 b=mA6unuAXFvMtEvSHavjhD38k1eaJKc0x+wYsdNjXy0VQj7URINJnaGC7OI12xQvo3y6Tz4IR7nIxraZaZ1qqX7qxDgOATiUl0ThMY3ERLP8i/RTcMQSdYORDYffpFgaiktjg7RSVduM87WT+flUwCBfY3E4eF81X3h2qIue2hO8aXMSfwgj2dZQzNW7O4TXAfhflWsT3tHxpXkWpUgz59GsnfjT2GbJLL3ZsPZRG3ozveJmVkoSLz1Mc2e0npgYJUT/aMTRq8SmLJGgKDI/sxfebvzZ1rsyOe6qY5w9bzboHzi1BGNHPrlHOdZd+G/xSxZZzZTsUS6NFVlGyJQokqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AD7gFHfHrEgMU51ZYG9T4AmN9Bmv29mSbCnUTIhkpcU=;
 b=M2VDeR+1EVkX7M0tb68iGsURvO8LEE5jk1/+ORirG37Jsc1DVvLD00q5ZQnzsjxjWJAU9w7zLiimoPO3j+xPRZt7W1E2mbka4ra33HWgEn//1et5snAjM8Kmwfs1oNgu5OQN+2ACfHBRSg6RPKiSxu3XTWODnJOs2dh4l5V7adA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SJ2PR01MB8404.prod.exchangelabs.com (2603:10b6:a03:542::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 21:11:24 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 21:11:24 +0000
Message-ID: <96cea729-437a-4bd8-8dbf-7ff651979387@os.amperecomputing.com>
Date: Tue, 17 Jun 2025 14:11:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: mm: make __create_pgd_mapping() and helpers
 non-void
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chaitanya S Prakash <chaitanyas.prakash@arm.com>
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
 <20250531024545.1101304-3-yang@os.amperecomputing.com>
 <38fb7875-88c0-4687-8421-f92ae3ffaa72@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <38fb7875-88c0-4687-8421-f92ae3ffaa72@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:b::17) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SJ2PR01MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 72192c79-403d-41ce-fb27-08ddade38436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWYzWTVFNXFMTVNkdURTR2o2YjlWUWhYYzlkVkpNTk1wUDYwTUNiRVhmOHlC?=
 =?utf-8?B?RVVtY09vLzR3Zy91Z2dCdktzNUdPa0Z3V0wrUHVJSHg1Zmx3UVM1Z0E3NTFJ?=
 =?utf-8?B?d1owQXRZRm1MSHp1aHpiWHJyRnNCVmU5TjhPWFYwUy9sRFpIQ09HSHk4M3Bi?=
 =?utf-8?B?a1NXajlISjRLdmdsa0wvWVFiK1NSWCttQTFDMU56VHM0UmpEMDNnbUgyVFkx?=
 =?utf-8?B?cHZnOGltZWFCTXB0SkN2cWlUeVZXRm1Eb3hoQ3lkNGt1Qkhrb09hR283RlQ0?=
 =?utf-8?B?RGh5eUJXZE00TEpyUURLdFBxZTZldlZFTG9JdkhnVnlQcVFRWVNzK2c5cVZO?=
 =?utf-8?B?eWpHYm4yZGUrSUtNSkVGMDBWMm1ub2lvY3Rzb3FmU3BDMmYvaTlhZWtaMjZM?=
 =?utf-8?B?SFdpakVVK0p4ZWN6bnZyKzhGZTdLU3krVE9nQVNXM3p5Q1N4V3NJdG1ZWFVx?=
 =?utf-8?B?V2VIbXZlZWRhY3J2NzFNNnlBZS9XZjZjd21aT0swVURQQ1haTE9KTW1GakJn?=
 =?utf-8?B?WlFyM2ZvdDQvMU41MDFud01Wemgvc21SZndDVXhOMXZUSXNxdzJRUFQvWVFi?=
 =?utf-8?B?ekd1ZUFRYmFuam9keTlSNWk3M2tHUFJBT2FFeVpOb2cxa2JQY3JHN0UvMVFj?=
 =?utf-8?B?U0dBVTVYTXNuSUVrOFk1bzVUbWRnWGtlK3RvQzM5OXhiZFVtRVZRZVZ2bCtu?=
 =?utf-8?B?R3UyYzZWYXZjNnIxY2pyNVFYdmw3MXRCazBEbWlPNmgyb2ZyZENFcitBRVl3?=
 =?utf-8?B?cVBYUGpBbVdyWmxJSXZUZGdzTy92TEN6NlRKNXBmcmtRZVIzVTRwemRSOXJO?=
 =?utf-8?B?c0tmZ1pHM20zWFNlUkt0SGlQT1Q3UGZ3QVVNMUUwdVBWcFA5MWVzWlkwOFR5?=
 =?utf-8?B?NnowYVZnTTVsSlBMMzRZaUxVbE1PRlVnQVdwZWxtWFA3TlRUWUYrazdkYWVy?=
 =?utf-8?B?ay9WQThWRE5QNlUyeWQ1K2Q4TkJpazhJRlNnSU1nYzBEU3lCT3B5SEpQRE5M?=
 =?utf-8?B?VzR0dHZqaTNDckk4NEw5Rm5jLzgwMDFLSUt1OFM4bHB3ZU1pSVZMMEFDTFhQ?=
 =?utf-8?B?Skdjbzl4VUdNZkRtUEtLV2ZlQS91OFM3WWhaSU1OUDhiYmNSTjR6TGZBdHVp?=
 =?utf-8?B?L2pDU05kR0llYmk5b1JpaE5XZ3ZIckVNcHBQK0E3K1NuVWFKSlZSa09kUFQ3?=
 =?utf-8?B?TFpQT3ZRa3RYTFZrMjhJZWR3S3luMVJLVU9naXV1Y0hZV2ZMSGQrdERQc1c5?=
 =?utf-8?B?SHJxcTBLSTQ5VVZyajQ0U0dwazloOThnTGFDZlNxOXdmRGx2NVppNFB1R2Fu?=
 =?utf-8?B?aFdXaWNJSlRxalowT08zdjQrTzhKSmlZLzVwbGMxeVp3TGtIazBGYW5DckRy?=
 =?utf-8?B?TE1aZXlRbmtMTS9wRlVZNFdiUE9kZXJOVS92Z3Y1MnVOSTI0dEFuSFpIYlJM?=
 =?utf-8?B?QVhmQ0piYUkyZCsrTGRtNFJQYmcvTGkrYmJIZWpGbXp1K1dSM0I0QUhDM3Qr?=
 =?utf-8?B?ZXhndk91WkJ1K294ZGphNHhLUkpnMWN3MGY3Rks4eFE0b0hNMFFnRjBJM3Q0?=
 =?utf-8?B?V200Z3FTbzlQN3pSWEtLODBqM0FuT05YTFVyYitxV0VUSmtYaTZ2VUFidllt?=
 =?utf-8?B?VkpMU2s2Q2NicmtFTEt0UEN2RlV0MVB0Tk11VENLV3VQMHJLRDRqMDkwZXNB?=
 =?utf-8?B?RmFFU2hzRDgyaG5JeEN5MFJrSEdXcitvc2wwTzc4MmIzRUNLbXZRN1FDcnFQ?=
 =?utf-8?B?SXA1a1YzNVZORkE5OUVwemxDS21INzBvRDM3R1R3eE8vSDFiZEJ3YkN3QmEw?=
 =?utf-8?B?KzZUUUhFMkdJYUdRWEdYb0lMZXFheGtVQlRDMGZZUCtOU21tbmFjWHdXNHNx?=
 =?utf-8?B?aGVPMXl5WmlQR1pxODRLQ2R4VmZaYjFrQ2xUd3BvUTJWWEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGROdllOZkhKalBzd2ZZbnNNMGFLVEswNFJ4SEVzWkYvN29sTGp5WXc1NGs4?=
 =?utf-8?B?R2xHaldRYUxiNXNEQ2MrR3VMRmdzVWtMK3F3dUxIUHo3K1BCTWFlUFhqejVZ?=
 =?utf-8?B?VFNld0NDTnVVc21nWTJvMnlMRjI5MU5XVE9VZVdQdWJmT29XdWtJbWU2KzRy?=
 =?utf-8?B?djJiNlhhMzVkOFBJV2tSS2ttbTZLdGtLSmY0WWJ0eWVzTVBjMlZzWjdvTVEv?=
 =?utf-8?B?Uy9tOUdrbEtXTWd1Q1I3RjdaTXRUR01OajhyOThSdDdXbjVub1RPbFJ0TExq?=
 =?utf-8?B?Y1ZqVVkvR2dQTndrbUpoSkxLZFRxeTlLYnR5WVlNMFJ0SmdFVWFvd1dIaEgy?=
 =?utf-8?B?dFMvL0JpQ28zV3ZPMFF0ZGhHOFp3RGtjUDBGSVRmOXF3eGt3WUFFbVBqdmJs?=
 =?utf-8?B?ekdBU1dFbjFBaHk0VWlXVmVtOWxDaE10ditISDZsWVA2ME51Zm9OdWc1ZjJB?=
 =?utf-8?B?VUd4M042aHo3Z1ZQQjdMWEUzN1JGMEk3bnkrd29TKzRTQlU0WU0zeDVDNTdm?=
 =?utf-8?B?cTNLQXRldEpsL3VDRThXQXNnTzJkWnhzeWFkemVXK2V6TjBTMzVqblhnbEgy?=
 =?utf-8?B?a2V4M1plM2RuMDFoU1RnK0dNaS9nV1BTMGxCb1JTdlJMSUZGRmZwRlpkT1J0?=
 =?utf-8?B?d2l0aTdiL2EveGJlclpBMmtzUjhEdkFDdW53Q0pHRFdSbWFXODhxQkVCMWM0?=
 =?utf-8?B?UFI4bDJBNW5YakIySS9OSHh1WDBkZmwxYmxYNitMMVRQUzdFY0xhQ3J1NUpH?=
 =?utf-8?B?a2Q3R3VOeG13MWlweEFnMVdCZ3g1WEtiSWxHaHVNSWFBY1Z3NmVnSlNuVWNp?=
 =?utf-8?B?eW54ai9KTERDb05yQmI5R0k3aVFZaHdGQXdjM1FoRWtHN0NOZU5hek5hVnRH?=
 =?utf-8?B?S2xBTW5jS3hHSjBVU09OZm9aekxkRGtIL08wdTVYRVlONUZDZHlLRXFSNHhW?=
 =?utf-8?B?RjEvZFMvamFIdUNPUW5OajJrTlkvOFA2YjE1N1BDUDBKQnF3NEF2R2Zhdmx4?=
 =?utf-8?B?UEd4ckc0SmhUeHNDeVZZaUhsS2oyeU5VNGFNM0xqTFZoZklwTy9lWWM0bFBK?=
 =?utf-8?B?WWhMcVB1VGsrbnhvRHRpUDk5WE9TVXRBblU3SVNUYUdwbGx4eU9CT2pTREM4?=
 =?utf-8?B?Wkk5VjZzWDY4MkFHTXJJRkRuM3prVDkwbU5zNDVJMUlZR2s3S3RDbTQ4YTA5?=
 =?utf-8?B?VDZVd052NnZTUWNFOE1ZTEJRRGN1bEZmd1VOcVlIVGptUlprdVJLbDBpV1hM?=
 =?utf-8?B?N3o3bW9OWGpXUnd1bmRGUUIvU1RIZUo3VmUwZFc1Qml2L2lCOC9uTnBCNS9P?=
 =?utf-8?B?eHptMzlMN3plYUg0Vmd3WGY0dUE0S3ptWkttVFh2NWFNbE8rRmN3SmhGT1Z3?=
 =?utf-8?B?Zi9RblJRc2dqZ0dzQmJUeU1BVjhJN3hsL0lRajFvSEdWVW5YRFk0QkRud1VV?=
 =?utf-8?B?N2dpZTVFdlBjTHIycGZLODRaczNmOXMyYUJJb0UzMzhrb2psZ1NqNHlFRGtV?=
 =?utf-8?B?LzhKamsrV0VYVWJmOSs4aTREWGMwNmZBM1pJYXZCaXVVVzdlMGpoQnZ2TS93?=
 =?utf-8?B?aXUrdDFyNUN2TzF1ZHdLU0IrMDVycGIxM3EwdENLbWkwUGlGczRhaUd0ZHdX?=
 =?utf-8?B?Wk0wL1JjOFlUSVc0Zk5MeFZIRERhd2J6bXY0N0Z2VDhVWjZUd2ptMGNzdUUy?=
 =?utf-8?B?VjJpblJJOHlrc3ViVVVsMkRlVUp1Misyc1dVeDB2RjVDc3dsSW5RL1BPSU1h?=
 =?utf-8?B?b3pTYU5SWlB6LzNDaDByOU1UOFpkczR2c3FKcjFuQUpZeFFCM0ExdlY4TW9p?=
 =?utf-8?B?ZjQ4RTV5OHN4NlpsNGZpdElUTmkxbVlWaUExc0FmaHFxOUdhYStGZWp1dDhv?=
 =?utf-8?B?MHZGcEV2NnhPVTNHdm1VbkJ3dnUyRGN4RXd1SkNFeVFPem5QZlZGZUVTRDZQ?=
 =?utf-8?B?UExScDZHaGlUd2tmaVhoRCtoUkMrTkpydEJ6VlI5VHU4RGZtZEtZa0JveU5x?=
 =?utf-8?B?bC94bVB0U1pxaEFnNGNrVGhKWEJRa2xtR2hxNnF1VmVydXpXUnNkQXl3cXZJ?=
 =?utf-8?B?bnNqRk1iaDdKUEVadnBKbTc2Uy9sbC9jUlVYSTNkMXBaRWpkeVA1TG5qUkNs?=
 =?utf-8?B?K0UwVy8xUEEwdWdKNmQ1MzhkZ2oxTnJCN09tR0F0U0NKSjBxZGhIeEE1dFFT?=
 =?utf-8?Q?wT/mzOoabs6NdBfQdUClUiQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72192c79-403d-41ce-fb27-08ddade38436
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 21:11:24.5105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gUoFlV6oOkMKhNFn7M/58QFh0mBcAidOXZHyky1stqpiYJVNFRHFrPtekSfwi0YikJfsTmqIQ6De63rxRxJ1mKQ9Bs2bf2KUJ8eVYaLCx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8404



On 6/16/25 3:04 AM, Ryan Roberts wrote:
> On 31/05/2025 03:41, Yang Shi wrote:
>> The later patch will enhance __create_pgd_mapping() and related helpers
>> to split kernel linear mapping, it requires have return value.  So make
>> __create_pgd_mapping() and helpers non-void functions.
>>
>> And move the BUG_ON() out of page table alloc helper since failing
>> splitting kernel linear mapping is not fatal and can be handled by the
>> callers in the later patch.  Have BUG_ON() after
>> __create_pgd_mapping_locked() returns to keep the current callers behavior
>> intact.
>>
>> Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> With the nits below taken care of:
>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

Thank you. Although this patch may be dropped in the new spin per our 
discussion, this is still needed to fix the memory hotplug bug.

>
>> ---
>>   arch/arm64/kernel/cpufeature.c |  10 ++-
>>   arch/arm64/mm/mmu.c            | 130 +++++++++++++++++++++++----------
>>   2 files changed, 99 insertions(+), 41 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 25e1fbfab6a3..e879bfcf853b 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -1933,9 +1933,9 @@ static bool has_pmuv3(const struct arm64_cpu_capabilities *entry, int scope)
>>   #define KPTI_NG_TEMP_VA		(-(1UL << PMD_SHIFT))
>>   
>>   extern
>> -void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
>> -			     phys_addr_t size, pgprot_t prot,
>> -			     phys_addr_t (*pgtable_alloc)(int), int flags);
>> +int create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
>> +			    phys_addr_t size, pgprot_t prot,
>> +			    phys_addr_t (*pgtable_alloc)(int), int flags);
>>   
>>   static phys_addr_t __initdata kpti_ng_temp_alloc;
>>   
>> @@ -1957,6 +1957,7 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>>   	u64 kpti_ng_temp_pgd_pa = 0;
>>   	pgd_t *kpti_ng_temp_pgd;
>>   	u64 alloc = 0;
>> +	int err;
>>   
>>   	if (levels == 5 && !pgtable_l5_enabled())
>>   		levels = 4;
>> @@ -1986,9 +1987,10 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>>   		// covers the PTE[] page itself, the remaining entries are free
>>   		// to be used as a ad-hoc fixmap.
>>   		//
>> -		create_kpti_ng_temp_pgd(kpti_ng_temp_pgd, __pa(alloc),
>> +		err = create_kpti_ng_temp_pgd(kpti_ng_temp_pgd, __pa(alloc),
>>   					KPTI_NG_TEMP_VA, PAGE_SIZE, PAGE_KERNEL,
>>   					kpti_ng_pgd_alloc, 0);
>> +		BUG_ON(err);
>>   	}
>>   
>>   	cpu_install_idmap();
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index ea6695d53fb9..775c0536b194 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -189,15 +189,16 @@ static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>>   	} while (ptep++, addr += PAGE_SIZE, addr != end);
>>   }
>>   
>> -static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>> -				unsigned long end, phys_addr_t phys,
>> -				pgprot_t prot,
>> -				phys_addr_t (*pgtable_alloc)(int),
>> -				int flags)
>> +static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>> +			       unsigned long end, phys_addr_t phys,
>> +			       pgprot_t prot,
>> +			       phys_addr_t (*pgtable_alloc)(int),
>> +			       int flags)
>>   {
>>   	unsigned long next;
>>   	pmd_t pmd = READ_ONCE(*pmdp);
>>   	pte_t *ptep;
>> +	int ret = 0;
>>   
>>   	BUG_ON(pmd_sect(pmd));
>>   	if (pmd_none(pmd)) {
>> @@ -208,6 +209,10 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>>   			pmdval |= PMD_TABLE_PXN;
>>   		BUG_ON(!pgtable_alloc);
>>   		pte_phys = pgtable_alloc(PAGE_SHIFT);
>> +		if (pte_phys == -1) {
> It would be better to have a macro definition for the invalid PA case instead of
> using the magic -1 everywhere. I think it can be local to this file. Perhaps:
>
> #define INVAL_PHYS_ADDR -1

OK

>
>> +			ret = -ENOMEM;
>> +			goto out;
>> +		}
>>   		ptep = pte_set_fixmap(pte_phys);
>>   		init_clear_pgtable(ptep);
>>   		ptep += pte_index(addr);
>> @@ -239,13 +244,17 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>>   	 * walker.
>>   	 */
>>   	pte_clear_fixmap();
>> +
>> +out:
>> +	return ret;
>>   }
>>   
>> -static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>> -		     phys_addr_t phys, pgprot_t prot,
>> -		     phys_addr_t (*pgtable_alloc)(int), int flags)
>> +static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>> +		    phys_addr_t phys, pgprot_t prot,
>> +		    phys_addr_t (*pgtable_alloc)(int), int flags)
>>   {
>>   	unsigned long next;
>> +	int ret = 0;
>>   
>>   	do {
>>   		pmd_t old_pmd = READ_ONCE(*pmdp);
>> @@ -264,22 +273,27 @@ static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>   			BUG_ON(!pgattr_change_is_safe(pmd_val(old_pmd),
>>   						      READ_ONCE(pmd_val(*pmdp))));
>>   		} else {
>> -			alloc_init_cont_pte(pmdp, addr, next, phys, prot,
>> +			ret = alloc_init_cont_pte(pmdp, addr, next, phys, prot,
>>   					    pgtable_alloc, flags);
>> +			if (ret)
>> +				break;
>>   
>>   			BUG_ON(pmd_val(old_pmd) != 0 &&
>>   			       pmd_val(old_pmd) != READ_ONCE(pmd_val(*pmdp)));
>>   		}
>>   		phys += next - addr;
>>   	} while (pmdp++, addr = next, addr != end);
>> +
>> +	return ret;
>>   }
>>   
>> -static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>> -				unsigned long end, phys_addr_t phys,
>> -				pgprot_t prot,
>> -				phys_addr_t (*pgtable_alloc)(int), int flags)
>> +static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>> +			       unsigned long end, phys_addr_t phys,
>> +			       pgprot_t prot,
>> +			       phys_addr_t (*pgtable_alloc)(int), int flags)
>>   {
>>   	unsigned long next;
>> +	int ret = 0;
>>   	pud_t pud = READ_ONCE(*pudp);
>>   	pmd_t *pmdp;
>>   
>> @@ -295,6 +309,10 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>>   			pudval |= PUD_TABLE_PXN;
>>   		BUG_ON(!pgtable_alloc);
>>   		pmd_phys = pgtable_alloc(PMD_SHIFT);
>> +		if (pmd_phys == -1) {
>> +			ret = -ENOMEM;
>> +			goto out;
>> +		}
>>   		pmdp = pmd_set_fixmap(pmd_phys);
>>   		init_clear_pgtable(pmdp);
>>   		pmdp += pmd_index(addr);
>> @@ -314,21 +332,27 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>>   		    (flags & NO_CONT_MAPPINGS) == 0)
>>   			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>>   
>> -		init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
>> +		ret = init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
>> +		if (ret)
>> +			break;
>>   
>>   		pmdp += pmd_index(next) - pmd_index(addr);
>>   		phys += next - addr;
>>   	} while (addr = next, addr != end);
>>   
>>   	pmd_clear_fixmap();
>> +
>> +out:
>> +	return ret;
>>   }
>>   
>> -static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>> -			   phys_addr_t phys, pgprot_t prot,
>> -			   phys_addr_t (*pgtable_alloc)(int),
>> -			   int flags)
>> +static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>> +			  phys_addr_t phys, pgprot_t prot,
>> +			  phys_addr_t (*pgtable_alloc)(int),
>> +			  int flags)
>>   {
>>   	unsigned long next;
>> +	int ret = 0;
>>   	p4d_t p4d = READ_ONCE(*p4dp);
>>   	pud_t *pudp;
>>   
>> @@ -340,6 +364,10 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>>   			p4dval |= P4D_TABLE_PXN;
>>   		BUG_ON(!pgtable_alloc);
>>   		pud_phys = pgtable_alloc(PUD_SHIFT);
>> +		if (pud_phys == -1) {
>> +			ret = -ENOMEM;
>> +			goto out;
>> +		}
>>   		pudp = pud_set_fixmap(pud_phys);
>>   		init_clear_pgtable(pudp);
>>   		pudp += pud_index(addr);
>> @@ -369,8 +397,10 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>>   			BUG_ON(!pgattr_change_is_safe(pud_val(old_pud),
>>   						      READ_ONCE(pud_val(*pudp))));
>>   		} else {
>> -			alloc_init_cont_pmd(pudp, addr, next, phys, prot,
>> +			ret = alloc_init_cont_pmd(pudp, addr, next, phys, prot,
>>   					    pgtable_alloc, flags);
>> +			if (ret)
>> +				break;
>>   
>>   			BUG_ON(pud_val(old_pud) != 0 &&
>>   			       pud_val(old_pud) != READ_ONCE(pud_val(*pudp)));
>> @@ -379,14 +409,18 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>>   	} while (pudp++, addr = next, addr != end);
>>   
>>   	pud_clear_fixmap();
>> +
>> +out:
>> +	return ret;
>>   }
>>   
>> -static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>> -			   phys_addr_t phys, pgprot_t prot,
>> -			   phys_addr_t (*pgtable_alloc)(int),
>> -			   int flags)
>> +static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>> +			  phys_addr_t phys, pgprot_t prot,
>> +			  phys_addr_t (*pgtable_alloc)(int),
>> +			  int flags)
>>   {
>>   	unsigned long next;
>> +	int ret = 0;
>>   	pgd_t pgd = READ_ONCE(*pgdp);
>>   	p4d_t *p4dp;
>>   
>> @@ -398,6 +432,10 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>>   			pgdval |= PGD_TABLE_PXN;
>>   		BUG_ON(!pgtable_alloc);
>>   		p4d_phys = pgtable_alloc(P4D_SHIFT);
>> +		if (p4d_phys == -1) {
>> +			ret = -ENOMEM;
>> +			goto out;
>> +		}
>>   		p4dp = p4d_set_fixmap(p4d_phys);
>>   		init_clear_pgtable(p4dp);
>>   		p4dp += p4d_index(addr);
>> @@ -412,8 +450,10 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>>   
>>   		next = p4d_addr_end(addr, end);
>>   
>> -		alloc_init_pud(p4dp, addr, next, phys, prot,
>> +		ret = alloc_init_pud(p4dp, addr, next, phys, prot,
>>   			       pgtable_alloc, flags);
>> +		if (ret)
>> +			break;
>>   
>>   		BUG_ON(p4d_val(old_p4d) != 0 &&
>>   		       p4d_val(old_p4d) != READ_ONCE(p4d_val(*p4dp)));
>> @@ -422,23 +462,27 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>>   	} while (p4dp++, addr = next, addr != end);
>>   
>>   	p4d_clear_fixmap();
>> +
>> +out:
>> +	return ret;
>>   }
>>   
>> -static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
>> -					unsigned long virt, phys_addr_t size,
>> -					pgprot_t prot,
>> -					phys_addr_t (*pgtable_alloc)(int),
>> -					int flags)
>> +static int __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
>> +				       unsigned long virt, phys_addr_t size,
>> +				       pgprot_t prot,
>> +				       phys_addr_t (*pgtable_alloc)(int),
>> +				       int flags)
>>   {
>>   	unsigned long addr, end, next;
>>   	pgd_t *pgdp = pgd_offset_pgd(pgdir, virt);
>> +	int ret = 0;
>>   
>>   	/*
>>   	 * If the virtual and physical address don't have the same offset
>>   	 * within a page, we cannot map the region as the caller expects.
>>   	 */
>>   	if (WARN_ON((phys ^ virt) & ~PAGE_MASK))
>> -		return;
>> +		return -EINVAL;
>>   
>>   	phys &= PAGE_MASK;
>>   	addr = virt & PAGE_MASK;
>> @@ -446,10 +490,14 @@ static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
>>   
>>   	do {
>>   		next = pgd_addr_end(addr, end);
>> -		alloc_init_p4d(pgdp, addr, next, phys, prot, pgtable_alloc,
>> +		ret = alloc_init_p4d(pgdp, addr, next, phys, prot, pgtable_alloc,
>>   			       flags);
>> +		if (ret)
>> +			break;
>>   		phys += next - addr;
>>   	} while (pgdp++, addr = next, addr != end);
>> +
>> +	return ret;
>>   }
>>   
>>   static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>> @@ -458,17 +506,20 @@ static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>>   				 phys_addr_t (*pgtable_alloc)(int),
>>   				 int flags)
>>   {
>> +	int err;
>> +
>>   	mutex_lock(&fixmap_lock);
>> -	__create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
>> -				    pgtable_alloc, flags);
>> +	err = __create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
>> +					  pgtable_alloc, flags);
>> +	BUG_ON(err);
>>   	mutex_unlock(&fixmap_lock);
>>   }
>>   
>>   #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
>>   extern __alias(__create_pgd_mapping_locked)
>> -void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
>> -			     phys_addr_t size, pgprot_t prot,
>> -			     phys_addr_t (*pgtable_alloc)(int), int flags);
>> +int create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
>> +			    phys_addr_t size, pgprot_t prot,
>> +			    phys_addr_t (*pgtable_alloc)(int), int flags);
>>   #endif
> Personally I would have converted this from an alias to a wrapper:
>
> void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
> 			     phys_addr_t size, pgprot_t prot,
> 			     phys_addr_t (*pgtable_alloc)(int), int flags)
> {
> 	int ret;
>
> 	ret = __create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
> 					  pgtable_alloc, flags);
> 	BUG_ON(err);
> }
>
> Then there is no churn in cpufeature.c. But it's not a strong opinion. If you
> prefer it like this then I'm ok with it (We'll need to see what Catalin and Will
> prefer ultimately anyway).

I don't have strong preference either.

Thanks,
Yang

>
> Thanks,
> Ryan
>
>>   
>>   static phys_addr_t __pgd_pgtable_alloc(int shift)
>> @@ -476,13 +527,17 @@ static phys_addr_t __pgd_pgtable_alloc(int shift)
>>   	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
>>   	void *ptr = (void *)__get_free_page(GFP_PGTABLE_KERNEL & ~__GFP_ZERO);
>>   
>> -	BUG_ON(!ptr);
>> +	if (!ptr)
>> +		return -1;
>> +
>>   	return __pa(ptr);
>>   }
>>   
>>   static phys_addr_t pgd_pgtable_alloc(int shift)
>>   {
>>   	phys_addr_t pa = __pgd_pgtable_alloc(shift);
>> +	if (pa == -1)
>> +		goto out;
>>   	struct ptdesc *ptdesc = page_ptdesc(phys_to_page(pa));
>>   
>>   	/*
>> @@ -498,6 +553,7 @@ static phys_addr_t pgd_pgtable_alloc(int shift)
>>   	else if (shift == PMD_SHIFT)
>>   		BUG_ON(!pagetable_pmd_ctor(ptdesc));
>>   
>> +out:
>>   	return pa;
>>   }
>>   

