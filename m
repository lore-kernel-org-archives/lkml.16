Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2109.outbound.protection.outlook.com [40.107.102.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FE82E11B1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749835280; cv=fail; b=iagkhbhjqymoxiIECnEhMm3JWQ7W7FD1Drl5qtUgbURTgGORI019CMwg/x0J8jjLzIhMDolVgzugCnF3PydILE8hJfH2DwrTl5iDLUxfEhklMO2JWl7Iwo3CeciLT6Y0NM6w+pTw49xqNExy9uNyq/UM9phk1bXHNLAkQUSpOW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749835280; c=relaxed/simple;
	bh=M1wZRiOq9smQwZHYkgntx+LdgL2FAotkuTlpCOsceZM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PZ0XaGCIW1KL6FNZ7vcLod202KpUrA6LKU49YT3KOcs9dxFHVVF53y57FrOqVCHcMXfzfwAQGIWn2cryLHEf/Y2PfnbNZxQVQBTCiSjmGIP7hqedTMngE0nXfKTgyB91+Dm7EQRlOnSJbctxysTlpXpnro8QnSkXP+8qVFW64yA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=XHNTsADf; arc=fail smtp.client-ip=40.107.102.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="XHNTsADf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMByJ1ZEnQsQJ8UQvgl8Mw337GsJQYLy/LYBEUzVkwlulrAIZmyU4BwknDhvcCcQmpDvDjS2ZSoi88X0OXd0HVIS62dxoxxO7dj8mO+zMCOkf3PG4g06wfNRLD+MPWqIIFw43n9DCBIwn0LMPDjjcaE6EpRE/e6JuXVpdrI/1eO6KP4XD6ZHPtGURVKXTp299wzRG2LOFy2fxd/Kj25KoOUsFp4K0mjjsGZhI0DNVcZW2T4u6Ire7fkQ9AEdGGf3Z90wNBWLCGZgvCuMeOloopDgeWNWcCL6kC7K/ICJ371nKE8HUMOTKofChTvc20OOtU2duvuGYkv9UpOC89Lu/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVelvsw8VugF5y7OgnFAO+l+s5CyM6nZG3reKE9IrLY=;
 b=N/h2SLBeEcbyRtDKHZIBkJZBOkHsF5K3lDIZvyVJsvwhnigftuca/VHWkHlsOTZvhqmi5wBF5Aiki8+uPIq25blo2wNx0lwkGGz0mMjnsqeKlFzj2tHKmkc0Dq1YleZiy9YN3r9GY7NmGaAZ8CHWAoh+gxHC5eGVIdlY3iTMo8dSCiRSAvWPdIoKPFXWUTsu3LtaQcneIIjG5dgdRQMFazQoJWWycF2MGDCbfR7RkkSCnu/aNczDVWiQAosimE7yhMiVq4m4L9trv1UjoRSO/TFXm9u9x7giZw7vWgmr463kUJ8s8Wo6SwfOFIDMVscswGANJF9ayTXnQjkiez9NVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVelvsw8VugF5y7OgnFAO+l+s5CyM6nZG3reKE9IrLY=;
 b=XHNTsADf0LQw7Yc1hoj32S5u8orOKYDcWn9YB533qHYPwFvAa5rPOfvZw1mebrewG5ydPg9Yo4mKcwJDUVzne8NlBbVKh59V9QmwskWiTjTiTCFpURB83iwNH+m1fM72QXx82edNMsJVVVNuRGFZgR+JvvLFjloFM+AVqevfbwA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CYYPR01MB8566.prod.exchangelabs.com (2603:10b6:930:ba::7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.18; Fri, 13 Jun 2025 17:21:13 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 17:21:13 +0000
Message-ID: <47adeebf-9997-45fa-8607-67e219c2ed17@os.amperecomputing.com>
Date: Fri, 13 Jun 2025 10:21:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 PATCH 0/4] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: ryan.roberts@arm.com, will@kernel.org, catalin.marinas@arm.com,
 Miko.Lenczewski@arm.com, dev.jain@arm.com, scott@os.amperecomputing.com,
 cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <20250531024545.1101304-1-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR01CA0021.prod.exchangelabs.com (2603:10b6:208:71::34)
 To CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CYYPR01MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: 9203d834-1581-4fcf-3501-08ddaa9eb281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUF5YkFMMC85SWxybTJWWEpTeUZGWEZTblh2NGNSNFZGVEFZY3JkYlVDbG1R?=
 =?utf-8?B?RGd5aktndnBDcm1Dcm9jdzY0ZXFPaHpBZTdxR0RuNFd2d1pPNWJCVkdnRng1?=
 =?utf-8?B?S3FvRkNCdkUzVnF4U3NramJwQW9mMFpEdXZPY1RtVWptWno5UzE3ZllHaFMw?=
 =?utf-8?B?U1gzYXpQbGpxQkFaUzUzRE9mK2E0aUIxMTBlZndCY1JqaWhUZzVEV2xFMHp3?=
 =?utf-8?B?ZzAvM1ZuK1hQZFh4NVdHdk1IOG11em9lK0Zjb21hTXdGQUpNUnUzdkliRGxF?=
 =?utf-8?B?NTYrTGN3aENHV0RwSHNVcnNZa0ZUQ05xbWk3bzdxSDJKMjAyM2M2Sjg3SkZV?=
 =?utf-8?B?cTYvQkYzYytOeVpDL1E0MkVwSWdVNUdrV1hqYXJMcFR4ODNpeUFzaHY5VEI5?=
 =?utf-8?B?NnhnR3pwWHpxNndQQ0d4TGRlQ3FLcnFQZWEwV1pqU0J2NHh5ZGgwaXBpbm1h?=
 =?utf-8?B?U1M3d0UzU0hOZDVSR3BEdm9BUUdLMDdBM3hERGEvRlhoYlJqUFRFQW51TmZG?=
 =?utf-8?B?d0pjR01IM0xwcDJUNWovQmNUbVZ3R01yNnVvY2FWbDBKR09MZURaVnltNHhI?=
 =?utf-8?B?NFhvNkMxa2tPWldHelZNUlJnSXh2Tk5zalYzMWdCS2lnc3lGREJrUVFFTFlv?=
 =?utf-8?B?dFBhUVdkcHdwNFk2NGFJcDkvSFozc0xjK1dnTDZNMmJmTFJMWWw0QzlId1lE?=
 =?utf-8?B?MjVVZjM2R3JnRHQvZkkvVzYyQ2graVozSkFFSXJhWHR0emVjTU1WSjZjUkU3?=
 =?utf-8?B?LzdXOWJkWVdJZGh2TXFuKzh4MzZqZ0NrWnJHQ0pYaWJLR0ZCNnZHUFBxNFVN?=
 =?utf-8?B?VklQOERidkNjbXo0NkJxSHNTRUpqRk9ReHQ2UUR2bytRejJmeTB5eUJHc2c5?=
 =?utf-8?B?d050anNaRGdIZU0yU0xGNWdGbDNtQThaYkJKVnNUMTZscG9WNDRWUXhodmRI?=
 =?utf-8?B?aERyeE5Td25mWDFJSWFvNk1LUHBRQmVibStsL20zV0Qra0hVR2RRV3Rpb2pH?=
 =?utf-8?B?eURCaTlnS1FUSUl3ZVVsMGVKdmZBTXljQUd5Mm15QzR0ZkV4VU9QaVUrT0ZT?=
 =?utf-8?B?TzR0a3AydnlHVStHbWtnaVpMZVpYS01vUnd4RWd2MjBJcWNieU55akM3Ty91?=
 =?utf-8?B?Q1ZFcXBOcFFHVFgzK0JXS0lMelJydmZnOEhRVG10OFdFV1N5Y1hiUTZqY2tN?=
 =?utf-8?B?cEY5anF3RUtVZDRoL3RYcU1Hd3lxZWduSldwKytyNk9JZWJrRWZjSzdUZ2Nk?=
 =?utf-8?B?MThXcUE5a08wRWFydXJocEd4T1VjcDNwYWJpWFBjNGVpNys3NzYxaG1ETFZp?=
 =?utf-8?B?aGxNRGE0SWM0Zmoyd3BIbW84am5IWVJJcEJubnA0ajhrampzM3BXUUlSakJB?=
 =?utf-8?B?QmJpTkFObVdIbXlWS1crYlRUdXJ1bzk4VFNJcE5qbkU2dVV1emVsRHBxYnF5?=
 =?utf-8?B?UHFDVyswUkR2V2JDZjRZa0FuWGl0SnR3ZS9nYlhBbU1YTU9hdFd2OUZDM3ha?=
 =?utf-8?B?ZU9TOURVL0lSVVRtOUtPS2NnZHpsVnVyOGx1OTVOak9UUjQ0KzZ4bVRuTGVk?=
 =?utf-8?B?ZVE1bkFKYjRwUVNyem5QZi9VNFFpcFplMWYwS0dtTG9LUWRILy9INUt6enhB?=
 =?utf-8?B?SXJFMzVDVjh1TGRwSXQzYWJwUVMxalpsVFFpaDFYN1o1c05VUDVYUFRDdXNB?=
 =?utf-8?B?bDBoWTJmUTRIeGU2L1pVNEgwRVlsbmdVMTk5OXppQ3h3dkkrbnRoNnFwbmJK?=
 =?utf-8?B?RzJ3ZUdiUEVkVnJ3RzNBdE1rMFdlS3VWbkpKL2YrY3l6VFFDQnFCaXEycU9J?=
 =?utf-8?B?UGRDdFdhcEdvcnZhK2dnUnZjUUxaOHFOa0Jyc01XdEtVSE41Q2I5Skhpd0l4?=
 =?utf-8?B?MkNDRjhIQTVtMEJ0OTdUbm5ZUVNDbWxSd0JuQmdxVGpyRUxNQVpmVENrOWFC?=
 =?utf-8?Q?GjmqMkA1tSM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3N6dnRlSVZjdnpJQ2cwVjUrYkNrWnA0bUlLWFJRK2dpVS8zamMwVzhqRGxZ?=
 =?utf-8?B?c3JpUzRCdk1jUGE5R0dleXArdHdydWMzd01peDdlSVZENFFmMzdLQVJCZ1B0?=
 =?utf-8?B?VW85NUxsN0Fzeno1ZlpDTFRCV2Y3SEJJakxxNmI3MEl1NFRlb0kzQTZ6ZVRi?=
 =?utf-8?B?aU4yZ3NHZUp4SGZNTlVHTTJLMm9hb0hFZ3k4cEM2eGZrQjdRM0JQeDJFTlBC?=
 =?utf-8?B?eG5wdmpYR1JPZk9qcCtES1hrMWV3N2xqUWYwVU1lSzZCMnkyaDlGUEg4WEdu?=
 =?utf-8?B?amU0RnpSNlNkNDFYTWNWcHZyeEgzRHdGRkpwajllY3pYN3laV055bFFBU2JF?=
 =?utf-8?B?SW9JNWdTbEJPQnFGZDhiN1FPaTNjUEI3TkxXVG9wbFBXaTA1QlEwVnpkdHpz?=
 =?utf-8?B?SzB0bktHMU9LQWp4d2I3cGtNWlNXMWUvTjlTT2d2TDRDU1BtL09wVzZLVjhZ?=
 =?utf-8?B?bDJWUHFSUm1hcFNpOVg3VmczNnVRRUNVSlQvN1ZuYmlhaE9qUDFjSy9nV0hO?=
 =?utf-8?B?RjR6T2lYL1E5TEgrbm4rUGFUVmZKMkxsNmY2d2ZDL1EvL1BYdGp2RWZCbUtw?=
 =?utf-8?B?bFVLaENHaGU2dWpPbmUrMWJaM2FuSjIwM1ZGZzBQUGJydm5CKzN0QlhiMDdy?=
 =?utf-8?B?T2E4L1VKb2UxSG9FalJxcGhFREF2OTRVMUk0QjhVNVhqWis1TWtudlFsUU1H?=
 =?utf-8?B?dmxtb0REbWF2MDhtUVRtYXY4WjFielFiUkZZcnV4S0JnREVSWnRGTldiWGho?=
 =?utf-8?B?YkZDOVUzQ2hUbm9Ga21UWVlOTkN1NkJCZWVtQmRCSjMrNTNhMk56amE4eHVn?=
 =?utf-8?B?T3g1QU0rVWRlRm9hV0RlMW9HcTRMb0pwNlNtOGhvZWRJdEVwM0tBSHBpakZr?=
 =?utf-8?B?NitUTmNUQXEzcmw2MnhBc2pLb3ZYdkVKZFRRSDYwVnVYb0wyNmdkb3hHOUpZ?=
 =?utf-8?B?NlZrR2FuZ1JvaC9RRG03YXZybjRtL2RUWDlBUXM5K0JtYnFWL3NRNXRRQzFz?=
 =?utf-8?B?cWxteTd4elVTNndUeE5hQnE2MEx2RFAwU3JjS2o3MktLVnFqMXR2anNrSXNE?=
 =?utf-8?B?MkFtdHUrNmtmV3JmMW9YQkZqaE9JUitkdHFZQlNZY0FoWVo3U0JZYWlqbGJH?=
 =?utf-8?B?ZlpPK2FwcldmUXM2UUI0dTJnRFM5MGEzYjROMGZJaHJIY0ZHZkFOTGpLRkl1?=
 =?utf-8?B?bDRKbDVERjRZOGlMS1QyTXlZL2twa0FPWTh5azNtQjBWWVE4Y2taOVcrTXIv?=
 =?utf-8?B?MDRkVkNTR0NnbFo4Z0RzRmw5MzhWMENFeS93MDAzbGlvYkxkSCtwVHpjclA1?=
 =?utf-8?B?QmlEZmYyTlhHMnVBSzh0Yks0Nmg0bXBkamh4RkllU3JQNld6U05jd1BlcUt6?=
 =?utf-8?B?OUZQc2RJZitYRW4xaG1JMmlsOUlhdXlsazNoZ1Q0MU1TR0VUQ2VzRjBjbUVn?=
 =?utf-8?B?NkM4cHBrL2hjQ2NoeEppdDE2M01mdS9VVGxUNk9GM3pmVGhWOXFSdFZVTDJM?=
 =?utf-8?B?K0Eya2N6RStDVGpBM2xOcW8rUXE1V0VQMEN0UmoyTVl2QmpjVGZ0dmxsZkdP?=
 =?utf-8?B?K0ozQnlBb3ZxbkFYZm1aeDRFYStjQ0F4R2Y0VnpJc0FDUkNGekEya2R0VWUx?=
 =?utf-8?B?ZzN4dEJPSjZubXhaL25BZFhidVJkUkFXdXBraGNZZ3NKSFBPaE9vZDlzWTNQ?=
 =?utf-8?B?ZXRLQm10K0JJOU1MYTN4TTkrTHhZNnB5SWZzRnlFN3BhZGNkVUZZdm43NEln?=
 =?utf-8?B?R3lham5iajg2Wm1aZXY0bG0yYUdDdGFNVEZScUZGckc1MTcxYWdmbzhtZCtU?=
 =?utf-8?B?QnpzcFRzRm9QVU80WnQ5aVZwUHlpdk1jVWFZVlFzS0o3QnNSa09yeDJDMGpV?=
 =?utf-8?B?OEhLMFppbEZWVm1VRkJCY01HUXlNNjlhcW1kN0ZIb2d5R0FaZksySE9Ycmhy?=
 =?utf-8?B?SUQ3d1pud3pwWTV5WnRIalgvT2R3d0ZDcjJZSi9CRGdja0lFTldYcko3emxj?=
 =?utf-8?B?Z2lIWFhGNk1wRzloS00rdzNJMjVSdnVoeWF6ZkZPN1VRck1ORW5sVlBsZUd1?=
 =?utf-8?B?bUdZQVB1TzVqVEFUZkVydGx5WjM4M25LdlZxdzNMd2grRUd4OHl4dm0vcWtY?=
 =?utf-8?B?cGVJcmdwU2ZMck9RZ2tRQjQ5S3VaQ0Z0MVZ1QklLWDhmVndzaldhNmNLYURr?=
 =?utf-8?Q?fTSUMHRbM8YFLQVGRVcrP6Q=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9203d834-1581-4fcf-3501-08ddaa9eb281
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 17:21:13.5818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/z2T16JBQaslFBFZAYV0iMmdlxi4cac2Rc43MD/YcpNa0RPizA/fpcOWao1GpImVaTcaaBVcLQzA9NIDZXku8Hbg59isD1PJGy1OBOEcOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR01MB8566

Hi Ryan,

Gently ping... any comments for this version?

It looks Dev's series is getting stable except some nits. I went through 
his patches and all the call sites for changing page permission. They are:
   1. change_memory_common(): called by set_memory_{ro|rw|x|nx}. It 
iterates every single page mapped in the vm area then change permission 
on page basis. It depends on whether the vm area is block mapped or not 
if we want to change
      permission on block mapping.
   2. set_memory_valid(): it looks it assumes the [addr, addr + size) 
range is mapped contiguously, but it depends on the callers pass in 
block size (nr > 1). There are two sub cases:
      2.a kfence and debugalloc just work for PTE mapping, so they pass 
in single page.
      2.b The execmem passes in large page on x86, arm64 has not 
supported huge execmem cache yet, so it should still pass in singe page 
for the time being. But my series + Dev's series can handle both single 
page mapping and block mapping well
          for this case. So changing permission for block mapping can be 
supported automatically once arm64 supports huge execmem cache.
   3. set_direct_map_{invalid|default}_noflush(): it looks they are page 
basis. So Dev's series has no change to them.
   4. realm: if I remember correctly, realm forces PTE mapping for 
linear address space all the time, so no impact.

So it looks like just #1 may need some extra work. But it seems simple. 
I should just need advance the address range in (1 << vm's order) 
stride. So there should be just some minor changes when I rebase my 
patches on top of Dev's, mainly context changes. It has no impact to the 
split primitive and repainting linear mapping.

Thanks,
Yang


On 5/30/25 7:41 PM, Yang Shi wrote:
> Changelog
> =========
> v4:
>    * Rebased to v6.15-rc4.
>    * Based on Miko's latest BBML2 cpufeature patch (https://lore.kernel.org/linux-arm-kernel/20250428153514.55772-4-miko.lenczewski@arm.com/).
>    * Keep block mappings rather than splitting to PTEs if it is fully contained
>      per Ryan.
>    * Return -EINVAL if page table allocation failed instead of BUG_ON per Ryan.
>    * When page table allocation failed, return -1 instead of 0 per Ryan.
>    * Allocate page table with GFP_ATOMIC for repainting per Ryan.
>    * Use idmap to wait for repainting is done per Ryan.
>    * Some minor fixes per the discussion for v3.
>    * Some clean up to reduce redundant code.
>
> v3:
>    * Rebased to v6.14-rc4.
>    * Based on Miko's BBML2 cpufeature patch (https://lore.kernel.org/linux-arm-kernel/20250228182403.6269-3-miko.lenczewski@arm.com/).
>      Also included in this series in order to have the complete patchset.
>    * Enhanced __create_pgd_mapping() to handle split as well per Ryan.
>    * Supported CONT mappings per Ryan.
>    * Supported asymmetric system by splitting kernel linear mapping if such
>      system is detected per Ryan. I don't have such system to test, so the
>      testing is done by hacking kernel to call linear mapping repainting
>      unconditionally. The linear mapping doesn't have any block and cont
>      mappings after booting.
>
> RFC v2:
>    * Used allowlist to advertise BBM lv2 on the CPUs which can handle TLB
>      conflict gracefully per Will Deacon
>    * Rebased onto v6.13-rc5
>    * https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1-yang@os.amperecomputing.com/
>
> v3: https://lore.kernel.org/linux-arm-kernel/20250304222018.615808-1-yang@os.amperecomputing.com/
> RFC v2: https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1-yang@os.amperecomputing.com/
> RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-yang@os.amperecomputing.com/
>
> Description
> ===========
> When rodata=full kernel linear mapping is mapped by PTE due to arm's
> break-before-make rule.
>
> A number of performance issues arise when the kernel linear map is using
> PTE entries due to arm's break-before-make rule:
>    - performance degradation
>    - more TLB pressure
>    - memory waste for kernel page table
>
> These issues can be avoided by specifying rodata=on the kernel command
> line but this disables the alias checks on page table permissions and
> therefore compromises security somewhat.
>
> With FEAT_BBM level 2 support it is no longer necessary to invalidate the
> page table entry when changing page sizes.  This allows the kernel to
> split large mappings after boot is complete.
>
> This patch adds support for splitting large mappings when FEAT_BBM level 2
> is available and rodata=full is used. This functionality will be used
> when modifying page permissions for individual page frames.
>
> Without FEAT_BBM level 2 we will keep the kernel linear map using PTEs
> only.
>
> If the system is asymmetric, the kernel linear mapping may be repainted once
> the BBML2 capability is finalized on all CPUs.  See patch #4 for more details.
>
> We saw significant performance increases in some benchmarks with
> rodata=full without compromising the security features of the kernel.
>
> Testing
> =======
> The test was done on AmpereOne machine (192 cores, 1P) with 256GB memory and
> 4K page size + 48 bit VA.
>
> Function test (4K/16K/64K page size)
>    - Kernel boot.  Kernel needs change kernel linear mapping permission at
>      boot stage, if the patch didn't work, kernel typically didn't boot.
>    - Module stress from stress-ng. Kernel module load change permission for
>      linear mapping.
>    - A test kernel module which allocates 80% of total memory via vmalloc(),
>      then change the vmalloc area permission to RO, this also change linear
>      mapping permission to RO, then change it back before vfree(). Then launch
>      a VM which consumes almost all physical memory.
>    - VM with the patchset applied in guest kernel too.
>    - Kernel build in VM with guest kernel which has this series applied.
>    - rodata=on. Make sure other rodata mode is not broken.
>    - Boot on the machine which doesn't support BBML2.
>
> Performance
> ===========
> Memory consumption
> Before:
> MemTotal:       258988984 kB
> MemFree:        254821700 kB
>
> After:
> MemTotal:       259505132 kB
> MemFree:        255410264 kB
>
> Around 500MB more memory are free to use.  The larger the machine, the
> more memory saved.
>
> Performance benchmarking
> * Memcached
> We saw performance degradation when running Memcached benchmark with
> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB pressure.
> With this patchset we saw ops/sec is increased by around 3.5%, P99
> latency is reduced by around 9.6%.
> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
> MPKI is reduced by 28.5%.
>
> The benchmark data is now on par with rodata=on too.
>
> * Disk encryption (dm-crypt) benchmark
> Ran fio benchmark with the below command on a 128G ramdisk (ext4) with disk
> encryption (by dm-crypt with no read/write workqueue).
> fio --directory=/data --random_generator=lfsr --norandommap --randrepeat 1 \
>      --status-interval=999 --rw=write --bs=4k --loops=1 --ioengine=sync \
>      --iodepth=1 --numjobs=1 --fsync_on_close=1 --group_reporting --thread \
>      --name=iops-test-job --eta-newline=1 --size 100G
>
> The IOPS is increased by 90% - 150% (the variance is high, but the worst
> number of good case is around 90% more than the best number of bad case).
> The bandwidth is increased and the avg clat is reduced proportionally.
>
> * Sequential file read
> Read 100G file sequentially on XFS (xfs_io read with page cache populated).
> The bandwidth is increased by 150%.
>
>
> Yang Shi (4):
>        arm64: cpufeature: add AmpereOne to BBML2 allow list
>        arm64: mm: make __create_pgd_mapping() and helpers non-void
>        arm64: mm: support large block mapping when rodata=full
>        arm64: mm: split linear mapping if BBML2 is not supported on secondary CPUs
>
>   arch/arm64/include/asm/cpufeature.h |  26 +++++++
>   arch/arm64/include/asm/mmu.h        |   4 +
>   arch/arm64/include/asm/pgtable.h    |  12 ++-
>   arch/arm64/kernel/cpufeature.c      |  30 ++++++--
>   arch/arm64/mm/mmu.c                 | 505 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------
>   arch/arm64/mm/pageattr.c            |  37 +++++++--
>   arch/arm64/mm/proc.S                |  41 ++++++++++
>   7 files changed, 585 insertions(+), 70 deletions(-)
>

