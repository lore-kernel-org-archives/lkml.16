Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013002.outbound.protection.outlook.com [52.101.67.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9F91552FD
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235286; cv=fail; b=LY5X4fKU6aqd3qvKfamQR4UWPU6BmzZbv77iCLOnApglcrQAHW+4C/sU1FezateumVZUx8zF8iJiVqJZ7afT7uYBJ4M4wGZPFT+p9ENn6AG/V3ANAngi+nK5iwLv2pH8OdrI/Xvs2cXeFZsUbTbdc7S7xyhNmZR+yUVNlgM6oXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235286; c=relaxed/simple;
	bh=JNV68JROrB6JPNADlb2tZ8BnIi9D2ZJ/uGe2PGMqqZE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QVrNK8Le60u5bKliN/q0BGOfMt9eD7WXNMnKAnJ0b9w7C2hHCJHUJgNNMp53YZxqKm2+D1V3aAWoNoWE6MCYBA32y4UVC0joVZHPxEzL67R6epuEdy1hYULiiFq+pyUPZoUHYmdzrVOE0JfONCBy3VASoLQR4bFbAleD5ALc/B4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com; spf=pass smtp.mailfrom=kuka.com; dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b=Iiei0Pf/; arc=fail smtp.client-ip=52.101.67.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuka.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b="Iiei0Pf/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvrKeGGPRwE9b4eUiMAtHJ8w/Xzz5PC1YFyYTmHR4OlxUbW6OXdl5Zv1R7nER6yBBvugT94rRl2xYNR+Vt1xfdVG8cal6fUBYAMu3fzmCLY/ysRBYS8hiTdogswh+KfIhdgnO2SCwUqO1o0dvGeGTP0m+XOLnjesDg4ST7yrg8ZiLPbEXq9tSZu6TOlaRk1KiosQIhCFEPvbXqoaP5g5POnTmdvRJMla1MRXEnUPzuq8qX6ZuRn6AzIg8Q1T5c/yUHoUN6cLn0gg+0vuoJRW8wn3bkod2NGkNUp7xsCDSel7JMsHEgt4FhIL9pKq85LBMb3O7tmIfDTPQmlDkL+2iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56Ou60ofYVG+hP5TG7IHdVZ53cKc0vyN4CVBkhAE//I=;
 b=pY1sFX1gNYKpki0zOSgNimSBozXNi3gLjJhDyfDCspmRUe8axE14+3VozPnqQfiuzi8QKlLnam2eM8l0ddfgD1tfaiWC6XO4xEQImOmx7o+woMP/uVMUdybG9xCSy/4lvSSg7rN6YOPUlGSttTMk4DDIqtwUmeZyusZuMuVvQjDixERapAFKdeEWeZ09wJJ3WcoW6RbY82HhTMqiFt/pYhiJgPJXliZJA6MASBhqXrNOHSHLDC+3jNx4ORVdOL/04u5JPq1K5mIMSeAIC4TP5CEJJJduadhne6SBjIH7J6eLmjfTgk7EByOZ6uez77K+RzEdUlpuK9OAaNtzMfXhlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kuka.com; dmarc=pass action=none header.from=kuka.com;
 dkim=pass header.d=kuka.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuka.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56Ou60ofYVG+hP5TG7IHdVZ53cKc0vyN4CVBkhAE//I=;
 b=Iiei0Pf/OrST3YG2w9kk9abk00rSvlrpCJIgatzmC5wS95TCo86fV/lDk9nBkEJkjTfRc6Var8S3WFs4fYOCG/nqdN76yhktObrmMXf7YF6cTYweDZn9wBXuEznHZMfoMIjaXlBJd1o8/nqueJdCIRCoH5WRBxD7CIGLLCMsvyk7tXjgCE161TK4tBTPGow16l2LRPd6c6Jv3fenerQTBFF63aVDSwFcJkbIQ1XZi7X4hng1HkM88irg4Jd9HsxUyoXnz2GJdA9n5qzry2DQ/VZiprqSOLkIX0/dxWkDHId1DvXy0VQFOLLGb7eN9qFCUtEmybzpDd99QoWxGrU80g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kuka.com;
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12) by AM7PR01MB6931.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:1b9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 15:07:59 +0000
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba]) by VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 15:07:59 +0000
Message-ID: <106c0d2c-7492-4a81-969c-de4f1798586c@kuka.com>
Date: Wed, 14 May 2025 17:07:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, yang@os.amperecomputing.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
 <3ed9ff7f-d360-4bca-9805-b70cf51cb023@lucifer.local>
Content-Language: en-US
From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
In-Reply-To: <3ed9ff7f-d360-4bca-9805-b70cf51cb023@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0351.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::14) To VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR01MB5696:EE_|AM7PR01MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb18010-b9f2-4e1b-ef79-08dd92f91d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlhKKzRJOUdIZ0JKZWZuMXJ6ZVFhTjh2bEpZN21Pb1BEWGtFOWJvSkFMZEFl?=
 =?utf-8?B?TjhCQ2d1am5SSlN1aGR4R2JaSmJDQjBubFhCMFFRUUQ4eTNTYnphQm5sMEJP?=
 =?utf-8?B?UHRGWWpGbDhhOTd1ZnBvVXhabGtSVkt2ZEdIOXNFa0M4dk43VW5adXNndVJV?=
 =?utf-8?B?ZjBGdmFSclAyWEpBcFRLNnpISE5LdjQvem8zWmMzdGxMN2tGTDJDSCt1T1oz?=
 =?utf-8?B?TWx2RzA4Y3ZLaG5MSkk5WmppTnRaL2RLMWs1TDM0ejltK2dBRFhFUDdDajBz?=
 =?utf-8?B?c0Z5SFI3UnpqM3FpQ3d4VWJxemlzZWN4TnZCN0E4K0xyUUNIUlBpc3JiWGE5?=
 =?utf-8?B?T3c1U2V2dTZyWkErNWpSaHVZQldCMzVDcHVzYWJwdHR4UUxPUHd2SFhoZ2Ro?=
 =?utf-8?B?RDdnNklVeFgydXFkVCtCK2liZjhjNE9KcmFLZ0JHU29sSlpEMmhySHpYNXJy?=
 =?utf-8?B?dnNZdFpRQmluSUFlcytlQzgwTWNWNVN0S3VUUk5IMG5xaGxTL29TUTkyTW83?=
 =?utf-8?B?RFhkY2NLNFhjSWY4azU2enhiZU5IcGdQQ1lKQngxdXRRaUVndkZvSFBYNnlB?=
 =?utf-8?B?SU1vU3B5Q1FhV3NLQlpOWlZ0ai9EVVNaWWx2OUJhaTFDclpFT1ZiUHZjM2VL?=
 =?utf-8?B?elBYNHlJbmFKUUlJc1FTZUs0NWJOcjhwUnBBRFdjUTBDWWg0RHJZSmpkNWI0?=
 =?utf-8?B?TWVHcHQzR2ExVFhmYWMrVVpNK3FqTzg5SkdYNnNYdGZkQzM1K1l1WjRabzBh?=
 =?utf-8?B?NXI4UEhYOXJpOFpqS2plTHI3RVNpNS9Td1BEVjVubWd5YzNHME1RVFFIaUVh?=
 =?utf-8?B?YVlYMkV1QmhvZnFUUWp1cndqb0xhcDk4cGlMRWU5UXVwWXQwTUFsbm43bHZr?=
 =?utf-8?B?SFRXT3cvd1hxeDNtTVpTWEVFVWt6QnJ1VXhlRWM4ZnZUN1RzK1RZR3Z1K3BL?=
 =?utf-8?B?WkkwVnE4TlkrOXduOVZFcFVLZVo4NVgyeTdTdGlIUG9GSlo4bVh5QmZpTitC?=
 =?utf-8?B?bTUyYUlhUW92VGZRRTVHL3VjZXRGV3l3TklXaGxKdXJFOEh0VGd4MllPVlhW?=
 =?utf-8?B?N0ZSQVZtUmorN0lSbWl4Nkk3UXNBbkhvUmx3VGZlbnpBa09CYkJ1YjdXMjZv?=
 =?utf-8?B?WGtCMWcvUC9VekhteGxMN21tSFV2STFHNWUrRitWbk55Qmg3aHE4SFlWRU5Z?=
 =?utf-8?B?d0RYbThhd25wNmEyTy9jUlNNVWRINE1VbFRPSHp0bXRBQVhPclVzbjBuY05t?=
 =?utf-8?B?VVAxTGlDNjAvdXlpZGlvcExwUVNrVXVvZHBJY1U4cXptQXpMNDRIVE8rMjZX?=
 =?utf-8?B?N016L0g4Q0xJd051RjdpUWFWbFpySUpGWVdtVXhucVBvbVBDbk16SGt5TG9M?=
 =?utf-8?B?SUFZM3pRU2NwR1MzK1M3NUdKd1N2NU44cWJtOHpvcmkrSGUzVENPUkxTdytp?=
 =?utf-8?B?RjRkNVBQYjdvWkRPeVFMc3Z4TDBJUTdEUStaR2RaYVk3djJrNEprSmdnOGNU?=
 =?utf-8?B?cVdPWHBwTkVZWm5VTG92WGNuZVVJdVM5WXoxV2kvWC9jZzViY1RhSTVZTDZ3?=
 =?utf-8?B?c1hRclZvRjJDVFBRa2o3NThLZDJRbDJsUTRhREc4K1Jpbk1jYWRxYjBuSjMy?=
 =?utf-8?B?Q3RBaHBpTWs1TUNoaFFOWjF3TWJlYzFJYXdVQkN2eWEzN3V1TjlQMVpzZ0tJ?=
 =?utf-8?B?MnAwR0RtY2dwK2R6NC9xdndpSFJaMlZYenVLd1ZybFRrWmFmMkNDVFNyUGF3?=
 =?utf-8?B?WHNEZXJnVDVzUFBTei84UVFEVnlRaFJQTUZtZzJMbmxtUGl1NEYxL096UmZO?=
 =?utf-8?B?Ny91S2gwdHZDOVliODhQQ2lkdHpsV1g4RzFwanJJd2RPdDVtNnVtdDJvRktI?=
 =?utf-8?B?WlZUS2xJckE5UzlXTUFHampwZFZPWDNsMUQxZDlYVWpSckFIOFkzNGJJRG4w?=
 =?utf-8?Q?6MoD1/VeAe4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR01MB5696.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmFuUW16VUNMTWNSZ2FOYTM1SUllUEh0dU9oREFqc3ZmdHhyTlR0Q1doQkQw?=
 =?utf-8?B?SWp4NXFMV1NObnRvZHJXSkhNRG5wTUM5UjYvWXhXS2NtUU9oOWNRbmdtVFhk?=
 =?utf-8?B?WGR6Z08vbm0rclNIQkZGMkYxTzF1NGlMVWtYZnV1UEluMFV6UkhKSkNOZXlW?=
 =?utf-8?B?MllNL1BHMFJkS2d5elgxN0FXRXBXeThrNklVbFJ4dWc4dTRzOWR6K044Q0Fo?=
 =?utf-8?B?OXVQcEx1aWhycEFVRzFLUFhva0MyUnBKSE1lQXJuL3lwM1NESE9RUTFwa1B3?=
 =?utf-8?B?SGFDTTNpUS9XOGtYbXd3UW1UUWtGdm5RNWJYcjNXa1pvMzJxLytJRzdqS1VE?=
 =?utf-8?B?NDdwaDZ5TDU0Y1BxYlRrdFlkYThFeWpPMjI3WmVNWXkrUVlJaVJuaC80ZjlU?=
 =?utf-8?B?bFZmMFlHYW51WllweG05SE1KZTJURm5SQ0pRL0VDQ1ZpYUIzL3ltTFZCNUt4?=
 =?utf-8?B?TG1xRnludXhDejFsRS8xbkkzdGFvTElYeExXV2RJYXp4SERGaXM4VEZkUFFD?=
 =?utf-8?B?NTdtRVNCd0o2aVlHTUdaTHJScVN5c016bnhKOW4wdVlWczJYVVV5OWppbCty?=
 =?utf-8?B?SHF0QkgvS2NVQ1BhMXJWeDhpL29rSzhqQzJBYXNkWmErL0FnSWJwS0FCcjc3?=
 =?utf-8?B?V0lUaGhRVVg5Y0NIb1BRMUxYRHF3bzRiZnk0UVNCUmNmV0N5cS8zS0xJUFpu?=
 =?utf-8?B?TE1ZQzlmYkxlOTVtVUFpdXA3MFZhOWhYV2k3ak5MaVFvUytjZms3Z1FXWFhU?=
 =?utf-8?B?bHdTMWZNS2JSNkVjOXpwWHl4dmp3dEFSQzdRdmh4R09odDhPaUtiV2Jxd3B2?=
 =?utf-8?B?dWZSYWpjU01vdWEyMHZLT09SYmg0NzRHT1pIQ2laT2JEWE0zTWNoejNla1hX?=
 =?utf-8?B?NS9iTlJhczh0eFJhY0RURzZWb3lrellKTGFIM213RUVybWZCZUJzditSRjI4?=
 =?utf-8?B?Z0dpK2dxUk56MTkxcUp2Q1hGZ1ViRUxTaXFWcUNBZC9XZXcwdCtPMjc4TURh?=
 =?utf-8?B?akI2SVgycldhWXJ2SnJ4eUhmVE1HczNiOFkzRHNON1hsZUo4NEt3MXk5MzQ0?=
 =?utf-8?B?UnYwTzUvUi9sT1lyMnFVRVNTVVFQVSt5MUJqVUJJNElnMnpTc1dPa2lqZTVU?=
 =?utf-8?B?aklDVXpZeWRzQnBLaGlNSTYvTkxBY3pYTWZBaU9oMWJXMEdDeDE1UVpEWGRE?=
 =?utf-8?B?OVdCdE8vOFBqdHl2NjJjeUZqUUJPTDI0N3lEdEJ1cys2YUdsYWZDSjJSd3Jn?=
 =?utf-8?B?ZFd0ZS9QM3VydjRzMmd2Mk1XZVVZZFRzOTEvNXIxZVg2K0pZRUYxMk1rcmln?=
 =?utf-8?B?aW9IRTdxeUI2VUJsVUdwM09TZlJyM0J6YWUzUzhPWGt5ejM5OHQ2Sk1sdllZ?=
 =?utf-8?B?TDJxWTFya0NKVmtBZXdTUEpSS2dsc21va0pyNEdEdStmNk5sSVYvdFc2Vzg5?=
 =?utf-8?B?VlhXWklyQWxEOHV1MGwwTzhxWjA3OU9sdFZLSFlRclFtZkVSdk9UVmRseGZ0?=
 =?utf-8?B?NUFlV2o5NW9OVzFZSUIvbG5tVy9Ybmp3THpJdXlHbG9QcXNDSzBQSUs2aEN5?=
 =?utf-8?B?NnQxbnVWaFMzOE1JN0MvTmlEQXlGT1g2RVg0L042NThKNHcrbWp1VXp1dGdV?=
 =?utf-8?B?OVFwaUxvZkwrMk9Yd3NKbUxEbkI2MHM3dm5Rek5CcnhnNk9FU1hYSU53eEJN?=
 =?utf-8?B?UWN3MFF2TDExR2pyQU04WFpEb0JhNEt3M2s0YUpzRnRycHJUUURMeEE3Mm0y?=
 =?utf-8?B?dXc2N3JiRWh0VkJQcG1SYityT0t6YmZNRjREK3ZwOFBac3p3YVZCTmhOWXFP?=
 =?utf-8?B?VTJ6dWR6SWZzaU9CTm9rSGRKWUx0cHFDMmRzMkhVMSt4REQ5akZqUjZacEJs?=
 =?utf-8?B?aEE2bGJsQVhmOElhN3UwMUpvMUZISFdGTGp2cDE5N1plOHRvNmdDMmF1c3Z3?=
 =?utf-8?B?VFNUSCtNdXJseXI3TkFkcXJCQlJ2Zi9HUnZiNGlvY2p2R3J2RWkza1pWOExX?=
 =?utf-8?B?dVJNZjc4NU5pcmtGT05hL0lzQnhFSVg3aTJoTldQeVo1S3pHQ0g0Wklzdjc1?=
 =?utf-8?B?ZVZzNWw5czVnazExanlmYjZmTzQ5RGhLekIvY0l0Y3haemxGVElSR01md1Vp?=
 =?utf-8?B?Nno4QjNLa2FMU2lRWWdJd3pBS1lsclh0ZnBoVWNPdXc0T0hYbGhXTzNaOGww?=
 =?utf-8?Q?UfEq4Txp2ajx09PpTpdvfK8=3D?=
X-OriginatorOrg: kuka.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb18010-b9f2-4e1b-ef79-08dd92f91d33
X-MS-Exchange-CrossTenant-AuthSource: VE1PR01MB5696.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 15:07:59.2768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5a5c4bcf-d285-44af-8f19-ca72d454f6f7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /JqM8NbRx9IeOZ0c/S/+ZKO7GEGFeXK2won1Vilv/XhKxtMgDH4f+ixYArYOIZxRnUxz0wNQZewJBc7pyBoTfAGSB0aFvmiR46Y6dcK4yQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB6931

On 5/14/2025 3:52 PM, Lorenzo Stoakes wrote:

> I have pinged s390 people on there, but I don't think this is going to make this
> cycle given we will probably need to coordinate with them to fix up this enum
> name (which seems the best solution to me!...)

They answered that it would be ok for them to do a quick fix over the mm tree:

https://lore.kernel.org/linux-mm/6f8f3780-902b-49d4-a766-ea2e1a8f85ea@linux.ibm.com/


>> +#include <uapi/asm/mman.h>
> 
> Also this should be linux/mman.h I believe, sorry for not catching first time round...!
> 

Including linux/mman.h leads to a compilation error:

../include/linux/huge_mm.h:601:23: error: ‘MADV_NOHUGEPAGE’

Including uapi/linux/mman.h works, but I am not sure if that is correct.


