Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11020128.outbound.protection.outlook.com [52.101.56.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C18A20E031
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750884036; cv=fail; b=rROj9TjRvuh9cFZlVqnXJQtpdk0j+1fHvEoLDKL7DNsK9aHCZKOg9DJeQ6mbOW8NpP5V76IBPDKWO7WmS5Ls/RlKiDJ8zi6t4/WS/cvB+fymsly17BnwSWYOtZ3W+6XHamH1z04HJwPmofxH5yXaAf3h4QfV5ZClJV9KjyGzvbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750884036; c=relaxed/simple;
	bh=Bnkm6FEhEzwf7VEUl2eu0xyyF0abkpqsVz0IESArQtY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H51n+ZEYSr0a6VdznzYIBXCmgcspRqOcjC+zZ0dwdlNXFFai50pMQJMtzERHlrPQPmBe1+y+wiJDrXgwt2qfaMN0Dhrp+di/2U6PW5M4TJuBTPHxmlCiK8O/sJmVYHrzQqRPkcStuvSUmG5a6TEJGweUajEM14sey0aDHxjSWsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=pU12jgJx; arc=fail smtp.client-ip=52.101.56.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="pU12jgJx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3Uxceph95zgoQHlXPFG/pTkCOCgnQqX/1N6/5YqLtXeitZdsxjrUMX80Njtxs/7eR7R01tEtwC4ikn9CVwA4/521QTDdXpy99S2AEHwAuHVnlPXYt7BsDHR8muaDWbiHcEszPJmiLVNy4hXvpF7textkobYOg6hIGIa2KueObZOWy4Tq5/hs/Q9CEpubkWUDyJ5c7+kaW8ycft8DFIq4Qa+A+MJuue0mA9XbUfQ17kaY1GfHJU07CS+9+zOh/Gz5E24sbqlzm8pQrdL+RtdDJuuvLac0FIJ8+VXvuFW/X8ahCLtGe620tNxN5JpGte8N5Jq5EDBIC5aiIYZQwNAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ci8jgeg+Suk3zREv43syo1dRdVa6KuWLrROlrQPlvbQ=;
 b=hJDS9A7SQtmXlK6xMyCf/ScdiuLBQEODDpg3D4fCSc2fWlepvChtGycymFdf9elnP25vIj3TdFXkjfNa8/DrevuLr6Tzza/Mp5yvARXj9D4PdMgjNTQYPB89cj0c3Sq5dfLI8+mOW1PCG/S++O3FWa92/t2KcrOSChfS1oeOVFN+xgbThDeGcVGqtqmo4lzNG/krjkiF/OsixjSEirIj9wfA6wayRzjs19J6azhE5iHn+dn3EsCw9GwG8FIEnlif8vVgu7RnAa6eadi5LyvOU9msLAOGmMfrZs4xWOy3AsfgP3ZwIB4JYaklz/tsVlFsOeSNQVMGjWTsoaOyxOqBbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ci8jgeg+Suk3zREv43syo1dRdVa6KuWLrROlrQPlvbQ=;
 b=pU12jgJx6kW5M1zTncgjS1WXkJNkc7d+s+U3qbGLXfK80xQKl2HqNUGoj9Fm2rwefMFEa+6EcmITc45W7WLQeqRWbBk/Ofd2zweNH9doiawDAojltARMhay/R+zNk6ndRzVpbjaqHcmPAHntTB2ZsRm3YKhV/MhjP29FQ2wFYM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV8PR01MB8678.prod.exchangelabs.com (2603:10b6:408:1ed::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.28; Wed, 25 Jun 2025 20:40:31 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 20:40:30 +0000
Message-ID: <cab45bd6-8108-4a6f-816a-3f7b70a2902f@os.amperecomputing.com>
Date: Wed, 25 Jun 2025 13:40:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change memory
 permissions
To: Ryan Roberts <ryan.roberts@arm.com>, Mike Rapoport <rppt@kernel.org>,
 Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com> <aE53Jp7ZGgTxtxwG@kernel.org>
 <956f6ebe-606f-4575-a0a5-7841c95b5371@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <956f6ebe-606f-4575-a0a5-7841c95b5371@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0041.namprd02.prod.outlook.com
 (2603:10b6:a03:54::18) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|LV8PR01MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee2bd32-7a99-4c08-f8fa-08ddb42886b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXAwemRTZGJmYlgwSUhrRnNveGROdzVHUGtXb0Nkd1IxTVVDN1NSektoOFds?=
 =?utf-8?B?L0M5VkZEOVhBVFJaOWduVkhLWndCc1FkK0Z0c000UGYyMXVQSHFidnBuZ1JW?=
 =?utf-8?B?WTVCcHRqblRCalo0bjNWQzhhUVFiZGlkOEJMRnBnejN1bXI4a1UzTm5NNnJD?=
 =?utf-8?B?cVVOME5teXB6TzUrc2hJZys0ZlZxSW9ZL2VLZzRpS2lzeHc2UU1td3E2Y21Y?=
 =?utf-8?B?dEVYM29taEYxWDc0bENFSVJ4VlFPL0Yvb1lOWGxPbC9EbjZRRlhJVlpzcGNL?=
 =?utf-8?B?cXh3b3ZUOVY0R21xS1BpcVBmRFhkdWk2OFdiTDZDT2xjaWN1OXBTNU0zSWNS?=
 =?utf-8?B?K1Q0VnJ0L1RKV1paT0d2ZmNZNm9mcUljSStrNVNsLy9vcXlvZmY2SzluYkht?=
 =?utf-8?B?QjR1VFFMV09oR3JHRWZ4SXFqQ1VIQWREK0l3VmFhYWVKVStqQkFzYS8vWWZw?=
 =?utf-8?B?K3JXTGUvYkZuY21aZndtVWZyTVJjRE5WTTRIRllyU0lwdEF3dkc0cE1uNzZX?=
 =?utf-8?B?RkI5OUh4ZU50Wkwzb2pUazFLSUJ1d3Z1bGxPeUMxYTFqRndna2lRTE9HVWUv?=
 =?utf-8?B?SFZ3c2tDck02ZmVHS0taSEdPWVVGMFJNL0dycGh6dEthZlJURVZVa2FhUjI0?=
 =?utf-8?B?ZU4wYUxxUlM4Z3hkSjRmWmYxZ29RVzcvdDNreVQvODR0dFA0bUppTHZlL0xT?=
 =?utf-8?B?VTZPK1FhZnpPck1OcUhQTFdPZS9FVGZ0bXdwTGFUZENVZjlHVWtNN2dZSktz?=
 =?utf-8?B?Tm42Nisxck9SZ0NlVW1lWEdwY2wzcmJUL3dWMm1kMm1GcTcyWlhPVmRnK0ha?=
 =?utf-8?B?OG4rbUUvem4zM1cwUXFleDdpaFBmYktxUklOekRselRVSnRBUWpGbk1vdjNX?=
 =?utf-8?B?TGozL0t2TlFEZVE3Ry9VZFRwTFlJUWViVmlKRnA2ampQTU5zR1ROMUFPd1Rn?=
 =?utf-8?B?SzhaZDVQWmlxY2J0c1VNVVdWZUxBLzdBcUVobzJNQ3lDaURvRTNQSis5ZjFn?=
 =?utf-8?B?OGlTYWxaTEdVN2lCQUFpVmFsQ0RiQ3RJeHl6V291YVFqY29UZWczelhZeGpu?=
 =?utf-8?B?T3pVLzY3emxOUGlINVI5dk5yNkRVTnJWMHJHZE4zVHZGejF6SXZuYytRblEr?=
 =?utf-8?B?NUNPUURnUHYycmRpUmljQTM2MEFDOWJzRTc2dzM5RzNuV2xrR2dScVl6cTRp?=
 =?utf-8?B?YmRJQTdVRnRpZVJ0NjIwSnFRRitjNTFoQThmOWpDSG9XOW9JOHp0R3MwQkNB?=
 =?utf-8?B?QUlXbjgyMksyZ3plVUdzUGJBUy9mSUtZOFVaWGlvWFdZM0lMQzF6ZVMyV3JT?=
 =?utf-8?B?aUg2QmZIUzBNb2RaVXpoMS92YmllN0NPc2NyWnBiWkxlVm5nOC92eU1QcnFY?=
 =?utf-8?B?ZFVsVGRIM2hTNUdUM3FxVE5kVWFoc0dHNS9vdEZJUHRGdklEbkpQZitPY1Yr?=
 =?utf-8?B?YVBkbmhUclY5M24vVzN2WU9Mc3k0TDErVHp4NGlhVmduNWM5SlY2TTJYWnFV?=
 =?utf-8?B?d0VKVjI3YTNkdHNzYTAxakxLWGdPUktWZzBRWHJVL0E5cWs2RlNPTjZZdi9y?=
 =?utf-8?B?TGNwNEc4OU1heHAvdWdLV2pqMmZKQkRtNFBWT3JnRnVPUU5JQnhPeXp6V2VW?=
 =?utf-8?B?aE1qemhVYi9VZDF3bHFUOVRnOC8zUlZnZWV0aGdIOUxkOUFnSDRxaTVPZGFa?=
 =?utf-8?B?T1BSYWs1ZiswOW9GTnRQaTdCNTNTem14c0xHL1pLR0EvekdnR21BNkdTS2FH?=
 =?utf-8?B?SGdzYUJjOXBSb3ZMT09DNXZpVEx0dDNqUWp4SkI3WDhOL0UyU0hIaUJMb1d5?=
 =?utf-8?B?ZEdLcDlZZzlESUxUbGpFcDd3Q0grUEZrVHNYaEYySEFFY2ZVR0h0UFRJNUc3?=
 =?utf-8?B?bnFXV2pHMWxpMjdRZTV4cUVEdThwVWY0Vk9jRG53Z3BCLzFGTDUrN3h3b01X?=
 =?utf-8?Q?jVJTFk7+cxc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGMwNFo3Q2VOVjZJSksvQnlNSUhtOFdmZnQweDllTjBVeEZMNi9BVUh6RmFr?=
 =?utf-8?B?amt3K29SaXFBNnpxLzQvRE01K2x3cnVWcEtRZmpCTDVCZ3p2YzQ2RGJhR2l1?=
 =?utf-8?B?MUFvWnlxeGNJcnMzT1BaYTZwaGkxbzZmSzRxckVjV1JCbU1RZTJCRC9ONUZT?=
 =?utf-8?B?R1c2QVdEd3ZhcFBwVlA2ZlgyeUJmdXI2STdLRVFnWlAyaWNGc1JGYWcvSW5E?=
 =?utf-8?B?aXdqUElLYm5ManlTRy9ZRkFLS3R2cEx3OWNqVGVCdW5DSGZ4Wi9WM0draVdP?=
 =?utf-8?B?RUcrYWVNL3l1R0h1WjE5TGpwZXZoaWh3MmNucG1leVN6ZUR0VElUUktzWTNa?=
 =?utf-8?B?YUJQbXlaa1kxS1pYa2dnQmFocVkva254QmdaZHl2V3UyR085akprWVkyN3NH?=
 =?utf-8?B?ZUNDYm82VkVySVY2bHlvRmFsSVQ0VmZKWGpPc25lVDlySmF4L0x5QlN0d2Vv?=
 =?utf-8?B?MThZeWhqTDB1ZHYwRkJRQ1QybkhiaG9YK3owNHRhR2IzOG0rNlc4amdLelMv?=
 =?utf-8?B?UXVTaW92SnFucnlScTRaWHB3dkZxa05xTnhVY1ZMeklSUUY1WFM4b1NIbGVl?=
 =?utf-8?B?TjJFTDBuM2VLRW13THVTL0k2eXRqK1NiVFNmeUxDVEFsc2xHSmczRlJPcUZT?=
 =?utf-8?B?TkZEdDBkR0ZRTmdyZHhjRklPUVhPOGdTZGhoM2VOZ1FZVnZZaG5ZOVZLYVpr?=
 =?utf-8?B?M1Nna0lwSDBVaHRvYTlPNmplcUZuUURXbUphdXZtQXhmeTJBVUZJaEJleDhQ?=
 =?utf-8?B?OWxnWTFNcDFlSFB1d0VlWjFYZ3NsKytDVWxXUDdwRlpPMkU2Q3RCbnJSRnp5?=
 =?utf-8?B?NWI1Q2NWUjRUUXd1SDJZRG1oZzNOa2lhdHp1WWpyVkNjVUFmTW5SclFKdFdR?=
 =?utf-8?B?YW54eXY3OUMxT0o5RWRwZWhMbWxvTXE5eWlOQUkwQTlCZ0xVUnlpT1hDanRI?=
 =?utf-8?B?SkZ2cmt0eTc1NFpwMk5KOEJrL3Y3Nlp4TndhM3FTcTFiUjk1WkFBNEtTTWdI?=
 =?utf-8?B?bnJNL2hlOFBwZU9hYmRkNDFDQjBwL3Z4bDF1dFI3YTFJaE1FUlM0TVBvcXBO?=
 =?utf-8?B?elNMbkxLbnBFOSswaUNQVzdCek5UcjJJVUM1Nm5GUUQ2ekhFbytUOVpUUllW?=
 =?utf-8?B?SDZ5SFlCR21lTVVsL3BQVGxpNW40Zm5ZeDgyVU8rdExUUFpYWVF0TXIyYitj?=
 =?utf-8?B?UHNzV0pjYUh5MVJ3UEVvS1RsYnRSMFdlaE5CaWZKd3lhMnF5eXllRWh2WDR0?=
 =?utf-8?B?SkliOWcyNEdJLzNQTERVOHE0UkU0WExvMk5tRHhGdXkwQytwcEJ0bnRvSnVV?=
 =?utf-8?B?STZjc2pDQk5DWHFxaXNoVTRxQ1Qxdlo0cGZqT0VWUUVvd0dZZlM0Z2k5aUVG?=
 =?utf-8?B?Ry9KV3hoVWNLaFFKaGVxQXBhNHVScWdDZDJNWXlZWkdyeFRhV2N6WVBhcHNx?=
 =?utf-8?B?S0JlRlFMcWdTMiszcUZCUnVtb3piL041aFFJNW4waXBvV2VhY1c3UXBmY3Vx?=
 =?utf-8?B?M05VM21kcitxMnFBNmZxdDc4c2NmVkNzNlJiWnEwR2JlSEVqb05KOFJhZUZl?=
 =?utf-8?B?aDJwL0VJWU92SmZ6dzFJWW5TcWc1N0o2bmhxQTRtZzVpdTdxUk5ZQk5BTFo0?=
 =?utf-8?B?ejgzZEtldXNaaU4wcys1TS9NdW9JYUFIR25Ubk1kbGplUE82SUttcm9scmRS?=
 =?utf-8?B?ejg0WjIyV0FmY1ZqK3hOT2lXdlBQYzIvbHZMU3pYQ3U5bnVuMTJ2Y3htalVG?=
 =?utf-8?B?ZXJJYWFyV01JcmlQektrM2lmeHlwMTkrejlBTXpHRExFd1c0bjNEVjNkWXEr?=
 =?utf-8?B?OVRESEZHSmZMMHhrcWdwUE5RbE9HZkJZZWg2SDZKM1BJbW9mSXRvVkY0azFn?=
 =?utf-8?B?RzdIdE84RDdMWDBmWi9YZWN2YzFNWkNtdVFCOUt1NUF0UjNHUEtuMjBnZWFi?=
 =?utf-8?B?N0lucFdXNVQxbnpaRnA5SCt3N1o3ZmtRRVREeUlnaXhqTWlEbkkxRDQzdTJ6?=
 =?utf-8?B?VndSbjBpdG1RdjhEU1BUb0wyT1R0MHZRZDJNRGRSUE1mdjRQbENrbGJLOUEx?=
 =?utf-8?B?TmtocEUyR2VLV3M1L2h0cDRMYTBUZVplZ0p4eVErR2hhYUpkdUNQeENHMmNW?=
 =?utf-8?B?VGw3NEh1OFdCMEg3T052ci9RTjl1L0NVcGtmMFJqTmkvMWRKR0xsWFRraHpF?=
 =?utf-8?Q?qKc2F7fZiBHvmyYXAa9xE7A=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee2bd32-7a99-4c08-f8fa-08ddb42886b0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 20:40:30.9073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0t7fzmbUeNEePYYqj7/7cKIUE49mjJYcsHyNvz8l9yNfmRPw0yWAasvodwNauN+OKRDJ2LeYtEThWkfzWLsbgf2d8NIR6o+E5BgtH+teNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR01MB8678



On 6/25/25 4:04 AM, Ryan Roberts wrote:
> On 15/06/2025 08:32, Mike Rapoport wrote:
>> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
>>> -/*
>>> - * This function assumes that the range is mapped with PAGE_SIZE pages.
>>> - */
>>> -static int __change_memory_common(unsigned long start, unsigned long size,
>>> +static int ___change_memory_common(unsigned long start, unsigned long size,
>>>   				pgprot_t set_mask, pgprot_t clear_mask)
>>>   {
>>>   	struct page_change_data data;
>>> @@ -61,9 +140,28 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>>>   	data.set_mask = set_mask;
>>>   	data.clear_mask = clear_mask;
>>>   
>>> -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
>>> -					&data);
>>> +	arch_enter_lazy_mmu_mode();
>>> +
>>> +	/*
>>> +	 * The caller must ensure that the range we are operating on does not
>>> +	 * partially overlap a block mapping. Any such case should either not
>>> +	 * exist, or must be eliminated by splitting the mapping - which for
>>> +	 * kernel mappings can be done only on BBML2 systems.
>>> +	 *
>>> +	 */
>>> +	ret = walk_kernel_page_table_range_lockless(start, start + size,
>>> +						    &pageattr_ops, NULL, &data);
>> x86 has a cpa_lock for set_memory/set_direct_map to ensure that there's on
>> concurrency in kernel page table updates. I think arm64 has to have such
>> lock as well.
> We don't have a lock today, using apply_to_page_range(); we are expecting that
> the caller has exclusive ownership of the portion of virtual memory - i.e. the
> vmalloc region or linear map. So I don't think this patch changes that requirement?
>
> Where it does get a bit more hairy is when we introduce the support for
> splitting. In that case, 2 non-overlapping areas of virtual memory may share a
> large leaf mapping that needs to be split. But I've been discussing that with
> Yang Shi at [1] and I think we can handle that locklessly too.

If the split is serialized by a lock, changing permission can be 
lockless. But if split is lockless, changing permission may be a little 
bit tricky, particularly for CONT mappings. The implementation in my 
split patch assumes the whole range has cont bit cleared if the first 
PTE in the range has cont bit cleared because the lock guarantees two 
concurrent splits are serialized.

But lockless split may trigger the below race:

CPU A is splitting the page table, CPU B is changing the permission for 
one PTE entry in the same table. Clearing cont bit is RMW, changing 
permission is RMW too, but neither of them is atomic.

                CPU A                                      CPU B
read the PTE read the PTE
clear the cont bit for the PTE
                                    change the PTE permission from RW to RO
                                    store the new PTE

store the new PTE <- it will overwrite the PTE value stored by CPU B and 
result in misprogrammed cont PTEs


We should need do one the of the follows to avoid the race off the top 
of my head:
1. Serialize the split with a lock
2. Make page table RMW atomic in both split and permission change
3. Check whether PTE is cont or not for every PTEs in the range instead 
of the first PTE, before clearing cont bit if they are
4. Retry if cont bit is not cleared in permission change, but we need 
distinguish this from changing permission for the whole CONT PTE range 
because we keep cont bit for this case

Thanks,
Yang

>
> Perhaps I'm misunderstanding something?
>
> [1] https://lore.kernel.org/all/f036acea-1bd1-48a7-8600-75ddd504b8db@arm.com/
>
> Thanks,
> Ryan
>
>>> +	arch_leave_lazy_mmu_mode();
>>> +
>>> +	return ret;
>>> +}

