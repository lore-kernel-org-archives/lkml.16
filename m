Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2050.outbound.protection.outlook.com [40.107.21.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75DB27FD48
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534381; cv=fail; b=ijXlUAPxCvTp6aWkNi37LxVpR9lNCe1RF6OoDg+Q+2a53GM+uCgQKNcfmqa7L7bw4oWVU6wzSwIAi3tBTqRu8Q65Ylv/DC9RsxIhyx7d2A7H95O6HOSry9p9+3FNL+2Sq6zfhlLX3mQr5un1HiiFHmru30o96DybvtVSv4yLeQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534381; c=relaxed/simple;
	bh=+XimhMwZ8b8McvyzCKYPQELfypNiyUGBD9YTr43PGr0=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oOUNOsA4H4ehwSY+HldYKSNtySbWaF5YVW94GJ6SxkZuw0bXEOD2bNId5D0meNgAG86LYZh9VBL3wABG1Nl71/jRRpx+6nFj2Rje51zKEZjkTneDXg6bJybAq1OavuPXold146Ht+q/xkznQPkDYKMlfaB8TH7GHEI9gQHKyOjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com; spf=pass smtp.mailfrom=kuka.com; dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b=sItTvlUX; arc=fail smtp.client-ip=40.107.21.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuka.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b="sItTvlUX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkFoUfwyXryCU43YN4NTk2ryJxxTirisUHvbOcIC57ZeVe63DBU5TPRY5rZ4cxN1f9q1qhzXa1Zf+ckILcvfL7jmPh39uwcA97VXBOLdRFlxwV6TNq59V0yjhJPzkTbkobzhozx7G1VWAdZrF05Qlv78eFpYYwP3qrHxOYJfKYhHgtjqII76LQbm0jo+8gkL4P04LGBfpLwyfFP+batGGwkq+YUBEDgD0LeJOYkd8hkNs88fvdQ8dI7kP+nhgaPrt865dY8vOnYus6OxA9W4ufYduAX45KXTGV+wlijMDxatPe4IlGpB0U227Cbw2WzDH9kClnn93YkG0Tb0dU0d6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46gWfgrkFqH4bidFKMnyu7sardfwFKAbMm2E7W4QYtg=;
 b=Mn8U15r4C3PAb/L5NnHLrCfaF7xwRDPV1Yxq7DwwrKlcRkACJ/ibk4cqSZZCxbZ/LnZFDFg2Xg63i5ZFjIQjDUcs2mqv5DjtSG2FLdn4I9WRKdJnHbHlQh5kVm7RwN77cjBGrKyFN6fp9+VGLwptllpohoTZ5fviXATlcA2NyRsrwULYd1kTKWo+CzuIgaejwltQaQUSKbM7yDbiHTYGsE9jNQvBeJx6slzo8vX/zvh10gMrnxqcdYOm/eFpzmYp1KeVDmhK2757Ltkpvz5k8xOFd5i+A0etb5B8kxE+xN6FU+5bG9F6dJA+97O4JUhyILFhCvTZTPuYl29zopI1AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kuka.com; dmarc=pass action=none header.from=kuka.com;
 dkim=pass header.d=kuka.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuka.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46gWfgrkFqH4bidFKMnyu7sardfwFKAbMm2E7W4QYtg=;
 b=sItTvlUXdXOs9pT5sLcvDUWWvRLzBwp43aKki/x3KXwwnWDJisk2Mfpqay1bcpnV3EKoano5oCNpCk07YTLhuidSNduZliLrH3e29kCgrLs/kNIF9JWLMx3PJUUuR9y7tDkrnaiStctK2s+gKRH33PuzK9720jdC9tVi3YmvN8qIKOiaMG5t74SOklVI15miVf0K5ZtUClcbepqF2tpSK5kfhCtp9iACha90h0G4ifnRyvwbTCAionKnKtTmfqGJN+uc2Y5u9aTUo1OOVEPW+d9V0TVj9z1byIErNTrqtxKzvPqLExapKuN+WUINyIT5Szh9keRHinDXmtxsPTGZTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kuka.com;
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12) by VI0PR01MB11439.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:264::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Tue, 6 May
 2025 12:26:15 +0000
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba]) by VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba%4]) with mapi id 15.20.8699.019; Tue, 6 May 2025
 12:26:14 +0000
Message-ID: <51997572-3575-4fad-9636-cca5178c561a@kuka.com>
Date: Tue, 6 May 2025 14:26:09 +0200
User-Agent: Mozilla Thunderbird
From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
Subject: Re: [PATCH] mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is
 enabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Ignacio.MorenoGonzalez@kuka.com, Liam.Howlett@oracle.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 willy@infradead.org, yang@os.amperecomputing.com
References: <20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com>
 <ad1aa0fa-f1ab-4318-b423-35f59ebf0599@lucifer.local>
 <60bc73b0-48b3-4529-8a73-2b85e3217e59@os.amperecomputing.com>
 <ee95ddf9-0d00-4523-ad2a-c2410fd0e1a3@lucifer.local>
Content-Language: en-US
In-Reply-To: <ee95ddf9-0d00-4523-ad2a-c2410fd0e1a3@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::9) To VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR01MB5696:EE_|VI0PR01MB11439:EE_
X-MS-Office365-Filtering-Correlation-Id: 59df68a3-9157-47e4-7511-08dd8c9931a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjJpQ2h0QkVMUzFxR2RNUWJ0ZldlSHNCQkJET0pKSmltbmJ0eU14dytiK0lC?=
 =?utf-8?B?cS93SEd4Ny9TYmpSblFBZHlxeXpvRGZPcDRqY3RSVkZjZE1TMDJUR0NZcE1E?=
 =?utf-8?B?c3JLZ3Q2endRYkhYbzFobHY2eUNwWFlFQlE2Ly9ZWGpjWjhTR2xSQklnU3FU?=
 =?utf-8?B?SHhVT1pzdTNNNnkyTVVQMlZaRGRyWlYrSk0wcTEyeWYwUXdlTWEyMXlabzVz?=
 =?utf-8?B?K0pNOW9nZ29mRFhpWFpFL1MwL1N1YWNONEtlaTFIcGk0azczdktFeDJ4emRE?=
 =?utf-8?B?YVRZSzRwb2JGcGI3dmNPa3I4dnFQdnpnR2pvQkJFLzYwOE9ETEVDYW5Ba3VI?=
 =?utf-8?B?RTFUbkRCaE02aWZFUUljWXlRSi93ZmV6NUZHV2c1ek9WL0xDc0dnZm0wVUZV?=
 =?utf-8?B?ZkxNYkdLS1BHREE3eEhxUENJWjRUYTZQZzRsRzlacURyTmIzNDhSVlA3d3pv?=
 =?utf-8?B?V1dZT3FCRHlJSnIrQVkyYk5tTjF1c0dpZUFacVlGRW5aTStmNlgyVVkvcUdO?=
 =?utf-8?B?R0FuRW0xS3YrVHVMcTBNZkY4d1htekZkdDVFeDNQQXB6TjI3YzFhYm1qS1dR?=
 =?utf-8?B?UUJIUno0RERnLytZMVFKZ3ZBMkdSR1Jqak8yU2JKSGFxNDY2Zmwvb0ZsS3pN?=
 =?utf-8?B?Qkx0R05pSURpWlRFUU9pZ2UwYnZWOHRreXczNzYxOThvRGlDRTBnWnBGdTZC?=
 =?utf-8?B?d01mVWRrbVhXZG1hKzk3Z2R0S2tsWk9kZEpPUVFDTjcrVFg3RU0vdmdvTlFY?=
 =?utf-8?B?bW9aZVNHOVFvdXlibnM0dTQ2OFhZU2xDQTAwR29hcUlwTmdDM01zUWMvWWE3?=
 =?utf-8?B?Mys0TW5mR0hkaGpUZ2YxaWJsNzVVcHJFRnVNUGtvQ1ZqNHFVekhWaFZtNjVm?=
 =?utf-8?B?M0JyejMrWmFsSmM1MkI1VEhOdUdGbWxLeXFMZkpCTloxWGhqOVBrNlJWaUx4?=
 =?utf-8?B?aEMxa2JWZVdITWdXQTB3SWI1WmIzNkZRMHZDME9yYmhtVk1pUmw1VDJFVkNi?=
 =?utf-8?B?ZXVHekFtVEQ3S0ZGZUMzTU5DbitFYkV5YTVOcGM0ZzB1SzFtcXNRUzZPRmla?=
 =?utf-8?B?V3g4VjI4R1NXTUdkRVZMZnlqbnJCT1ZhZ3hUVHlzRnFZZXl5enFCNEU1MFlZ?=
 =?utf-8?B?RGVNS3lWMjM4TlQ5bm5OdkZwQTM0eDM2WXBNYWFTaWxqd0N1Q0YwMlpOT01n?=
 =?utf-8?B?WDVjYmd1a3didjk0RXc4M3VEMldpR0tFbTVIbCsrV1ExbFRWTFZuNDdqTzNH?=
 =?utf-8?B?bEZZdzFLOE55WFZPSEx0cWhmN2YrSmY5Y29NWHZHdythU1RYdVlKTXlmZ2c5?=
 =?utf-8?B?SmhlSG5Rd2RtTkt5ZytBc2FYWXZrSmZoVzdWQ01RMjhlUGIwaGFqNkYxSU5J?=
 =?utf-8?B?ZmN1L21IZnFGZERNcCtUV2hDMW5qTmdhbzQ3UmRjUnpCdXNCV2dMRDNaWG5w?=
 =?utf-8?B?UFhha1hNdldYYkZTS3I1eWRwWVI5aWNJODB4djZxTnowMDlvbnBHSzNYb2hk?=
 =?utf-8?B?MkVjSWJ2M25PZWxaTEVLK09JOG95N1NpMlJmdk5uMnEyVkZOQ3RtOVY4VWVS?=
 =?utf-8?B?TUNmWEpHdU5GNWNLU0wxV0ZvZ2JqUjZkbzBibitYY3A5MnI4STkxQVlFWVRF?=
 =?utf-8?B?bzVUZ0hrVW1FQlpoRXVzNlQxR2N0YUN2ZExXNFNlc0J3MlBOWWZGbEV0czJU?=
 =?utf-8?B?eHd3S3p2UDZPSWI1VG1VODJDM2g2aXM5TDZJdVg1NDZ2dzVZNjJ2MFk0eG5M?=
 =?utf-8?B?YVhoYlRIc0dsRlE4WlpwZ0lEM1NOTDhGT3Y0Sk9uM01pczZrd3hackFRRFJV?=
 =?utf-8?B?YzNTYXRFdFM1ZlJHRnk2ZjNVOUdyNEJoVEpCd3g3dlNnSVdXS2VSdEluZlZT?=
 =?utf-8?B?bVBDT1E1U3ZacmJpUWRqT0FyajJ3eSt2U3h5cVlld3MxV1VBRGVqdUlWY0Fy?=
 =?utf-8?Q?Pi5oxf//KHI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR01MB5696.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzNKa0FiWnFJUkFoeGFna3pWVk1DSEdsNkJMUklDcGJ1cGdYcnJOYW96RkFM?=
 =?utf-8?B?WGc4dVgrdUNBc05KRnRNb3NoNjZ3K0NEMEoxVkl3V0F1L2pkT2NyeVZ1ZGVS?=
 =?utf-8?B?UkFhTEZzcnZEcG5idUNCTS9KdllDVlNENzdkMGZkZXBCVzlhSDZrdnFJa253?=
 =?utf-8?B?TVR1M0xWZmY5eW1hRythR0ZjT2VzdjRtWUpONHJINTh6c2wwUHNsMUc4ZFZi?=
 =?utf-8?B?YWt6YVgyY05uZTBOQjByM01xUXlqTGk2ei9JUjRBZzQ5UGFxSWdFNUxiRGdv?=
 =?utf-8?B?VXhZb0pvS3VLU0VUb1JCZGlVRGlaVk04L3pkamRxbEJBSm1uZkU5aDRVbDgv?=
 =?utf-8?B?cHlWZlZBYmVwZmZvdGttWWt4NlM0MGlmYnRIQ2lCbEtDYTNXVERlZUdZekxN?=
 =?utf-8?B?UGo3SndEcDJHeWE0a1kvekR3TFRUTWgxa1pobUxRTVVLV2lrbktQeGdUMGR5?=
 =?utf-8?B?L2NwQ1llVDlpam5nZDJxSGQ4cTV1aTdPT1pXNkpLVkRiWlIzUTV1RFlVNFB0?=
 =?utf-8?B?R0QyV0MxYWFsVkY3N1Q0eUZBYjBMeDM0SFN3YzVzRGF6MktZL1dHTUxxaVpt?=
 =?utf-8?B?MUdRNHl6dmZnT3VObFRWUnByK2tncEhRL0FnbmRmQjQzZmNBRCt5SmYrREdu?=
 =?utf-8?B?WFpEN0xGdHg4Z0w0ZEhLdTRtQzduUzFKS3NLS096bzdaMjc5WTcyc0w5Y21F?=
 =?utf-8?B?RkRSaHJoakNoZWV4MVkvWllyWk10TC9wWFNHVE9mdUVhaDdjVHd5SVZpeHdD?=
 =?utf-8?B?OWVwcHJkRlJYZklwcGRtZEpFeFNxVmczT2lIWXdCcHdQU1djR3BVekFHdHRm?=
 =?utf-8?B?dDFsSUNtenFpenNuaTRKbGM0SlVmYzk1UThxMVhRcFpDZU40VWxqZk9NYnU4?=
 =?utf-8?B?Kzc2ZERMOEhENXh3Z0lnbzNlWVl4dldINHByZHlJOWNaU0ZCTVpzL1Fzbnlk?=
 =?utf-8?B?cStBWVg5SUVBTzFNb1lkRFpJTU5wSEhYSWgrUzY1K3VMdUdnbjVHNmpSUkR4?=
 =?utf-8?B?cVY5TUtZMFJvdWdUSlRML3ovaWhucTlhSnBweUErejQ3YTd4REhiWGwyY1BF?=
 =?utf-8?B?OWJuRTk4dzdmUDZORnkyY3Q1ZkNSK1d5OEl0L0NlYmVaS0tMWVNFYjFscFdJ?=
 =?utf-8?B?a1FpWmlaN1lSZEsvTVVOakk5SVNZZm9DWnhzblV1UVc1TDVuNFhCOEhMWXQ2?=
 =?utf-8?B?cWtxSHVOQjNVWC9WTmRTZ2pveHhRWlVqbFdreGtOL2tEa3I1dWlsWGJ0blBS?=
 =?utf-8?B?WEFzbFBNYzBYenY0YVk0d0I0dlJwcW1FaUFPNitheEpzb0lKeVhVQkxJa2pz?=
 =?utf-8?B?TWJTcWVTUHRlNnRxemN1N3YwTEd5Q1RSS3h5L0RCRWloR2J0aUNrSERHK1V6?=
 =?utf-8?B?T3E5U3ZiM1hvZW83bWhuRmM4TkxpVjJPeVlYN2RpWDN0Ykh3WXU3THVvTENz?=
 =?utf-8?B?UWx0dzlyYjVVeDdSbEZxZGJiYmZRQ001am9OdC9wZGJpUFN0bmQzenJXaEIr?=
 =?utf-8?B?T1NsZ0RRQTJNYWYyVXI0anYwYlZienIvd0FxaCs2ekV6TVo4b0ZlTXExTnZX?=
 =?utf-8?B?RVNqSkpGRG1zOUh3Q1ZFc0wxUURvRlJYaHFhaERxMVR6TklkSEQ1N0NlbmFn?=
 =?utf-8?B?WUx4dHg0N3k2djZBZ2gybHdGNjFkU1p2dyt1a3BsdnpMWTR6a2k4ZVNXOUto?=
 =?utf-8?B?azY4NlZaMFcyUWlYYzZ0dG4yOS9BNmNPU3pET3RYUm43UTV1Q2I0NnV6QUo4?=
 =?utf-8?B?SVpsMjFWYjJwMEFaSWJRTmRjMlBXZmRUSWhmM25qZnpXcXgwV1hlMlFnU3RN?=
 =?utf-8?B?anRyTm8ra0lWUEJubkFGWnRYQ2QzdFFycWJYaTJBWXhnWmhtT01XQXkxazd5?=
 =?utf-8?B?cFVYMXA4V0ZXalB2cGtnbGk1MFZsUTFuWmNVYUJZaTZlRzNLRk5ES1NIY3VO?=
 =?utf-8?B?MEg3SkRaeVZ4bWFjY1VzNEJMMWRPM2lFSURJelVNMEhwZzJIZHdrb2VEL1lP?=
 =?utf-8?B?R2lnTUJNMDJ4ZldTUVFKTjJRTnRnRTA3MmpQNDlyNGJQSEdIM1J5QnF3NmJG?=
 =?utf-8?B?OTVDNlNCL2dnbXE1VVRYYXo1RjVWNTRJZ2VUUHBmenYwYVRyamtkVXVYWWps?=
 =?utf-8?B?SEhvNFgwZzk3WDNDeFRENEh6ZkdsbU0xRXFXenV3Y0prYXQwL2NoRWR0dHZx?=
 =?utf-8?Q?y3xjjtC9ISZ7uiEJ7wVHjCs=3D?=
X-OriginatorOrg: kuka.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59df68a3-9157-47e4-7511-08dd8c9931a2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR01MB5696.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 12:26:14.8844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5a5c4bcf-d285-44af-8f19-ca72d454f6f7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpQmPF7AHajCfU3jwKlGk+F+7CLb6TiIDu/XLaQ9rf32phjNrR1IG6/kpvkZKUflWQviilkFJ+PYA4mZKK51DyKyJxXrMK43cFjbK2A3zPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR01MB11439

Hi all,

Thanks for your comments and sorry for the late reply.

On 5/3/2025 11:50 AM, Lorenzo Stoakes wrote:
> In which case, Ignacio - could you apply both Matthew's change and address
> the nit below and send a v2?
> 
> Thanks!
> 
> [0]: https://lore.kernel.org/linux-mm/aBTCtOXBhUK_FLU6@casper.infradead.org/

Sure! I will separate the changes into two patches, since the first one will include the 'Fixes' tag (as discussed here). I also think it is a good approach to keep the patches separated since they address different issues:

- The mman.h (calc_vm_flag_bits) patch addresses mapping MAP_STACK to VM_NOHUGEPAGE on !THP kernels.
- The huge_mm.h (madvice) patch addresses the issue that VM_NOHUGEPAGE should be a no-op on !THP kernels.

Regards,
Ignacio
