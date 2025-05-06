Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2105.outbound.protection.outlook.com [40.107.22.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B92280CF5;
	Tue,  6 May 2025 13:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538280; cv=fail; b=VRYE5SnaBEls7bXso/kTHtqaobIGorHKE60JtIroKgSQA0xnpSd740eHmkuoyDHwWc0KlxcZAQNKRJD05LtAlPtqwT3jrms7A0I8QmSuLyCjKZELkn8oD1x6S9Y9WdrGn9Ot8VFd+IgqqZCrb3gl+iWrnBzU2sJYw4W30+GKmww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538280; c=relaxed/simple;
	bh=xLRhZduNmodc8ypShL78iRtBVS8jvTbr/VGC6tVik0w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eHO0NEo2AsjJ7u0dTJFuOGRQ7hOUQjv6juBy3KUjUI8K7QveTTTAz0GbspvCSxu3fRbR2tE7DRBS0MwfKwtLM4cRi9VAuMy/oHH1c5uD2BLo7UU/soXWVTuK7BI0KOfxMLp0GPj47NcR0H6VbYrh7un7zIkaZw1aenMh2VWTs0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=Salg52sG; arc=fail smtp.client-ip=40.107.22.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="Salg52sG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3ccWWu9an/SfAVEvwVNWtoayQUZw0zyQcY9ZiQGpruMiDCPvhR20uZfiXzDob18SPCEJ8VkI4cLWrovWUIV6J49ddXp0//MzywKUpTsz9gRtprbXahqDl2wEH3aSlM5GytjF8lSevSx7BmEk3ODqwMftM/2CucphxP2fwbeInXyCL+rYjdIrR3A9MY0QLZQC3w/PM78Q7GfW8Nz0sAMGszb3L4m3MIqofFPJ8eNpxNtwjqC8DDUrRQT5+o0l+qEEIBVKTeCO7PqSETZH8kJSRb6YE/W36FcReP33pw0uF205KJ5A7reBI/EOzaFuoP4wzkxQFMx/XNasCmxzqCWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuAGsbt6+NVfxbQ5CRz9lGRSUTit3fxKrM9Np4vwmpo=;
 b=T1yYjv+iR0rwpB4bejnyUmlA6+kBHF6jwPps2cAsFa+lNbpNnYysZmUmNUdyFWURyHq3KjhUpQDZpaxYJ03YRCpDD7alyC9+8wnXvoTQYKKltc6K+J0QoDxdpra6cnJGbheeV5HcMSVQ5QYcaMXM+SvGUEE0q/rDav7aRBam5tJQZjRyHAjwbuSNB90f2riFkmwC4wRobS+aOpwC0I7NJHd/oZAs9M/zWw8XO8hWri27yhz11vauG8FvjZpFu/Mm694UBVrFn0yMeSoM54WToIX/K6wkVkE6q9IpDFAvLz3iQEbH4jDu4wEC1qA2QijBMR2D1EUbfBDYjf91nJw1VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuAGsbt6+NVfxbQ5CRz9lGRSUTit3fxKrM9Np4vwmpo=;
 b=Salg52sGnietZmSLWQlqAWt5bHj1PlxBqtLD4dkfhelFYvO3pXrDmPHQe3jDX5IeRg5MKl1/JxRwc7lRp4Vi3DRqJbK1VJ0myf8lL1soejFDdF0IqiZdFPONkPjxzsPCioF02EK/jA9jPSgfusG/LDtxQvBW9m+qMp7ozislSLekxRa6saya/NtDyoQ7LpzEb3y7uRr16OGqiuYWgd8DjNIUQgRi/zzGCEHdTFppkS4hWmRLO+T37Ex1maaSRJPXCbMQjjCwf7r/bTNRmq9mzrKW3Ju2FQx39PhJB2z1WdoVB8WCldPvq+T3DVyFNCUeCuXZ9RRJnY4Ohe780pZJKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by DB9P195MB1610.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:37d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Tue, 6 May
 2025 13:31:10 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 13:31:10 +0000
Message-ID: <d1b0111b-436f-4689-b59b-473bc87955e7@phytec.de>
Date: Tue, 6 May 2025 16:31:08 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] [PATCH 0/4] {am62,am62a}-phycore-som: Add R5F and C7xv
 device nodes
To: Daniel Schultz <d.schultz@phytec.de>, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de
References: <20250506115502.3515599-1-d.schultz@phytec.de>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20250506115502.3515599-1-d.schultz@phytec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0303.eurprd07.prod.outlook.com
 (2603:10a6:800:130::31) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|DB9P195MB1610:EE_
X-MS-Office365-Filtering-Correlation-Id: fde9a14f-dbe0-4c19-9c6d-08dd8ca2438e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Umoxak9qbmRPMnRaM2Jzb1MzT3ZDVzhWV3hTMnN5YzJZNDNMMGJzb2RhdWxT?=
 =?utf-8?B?L0ZIbVZRbWVRV1ZwMFJYNmxVVDBwblZyR0hBYmFjb3RKY1ZIRVpFYTZnV3BD?=
 =?utf-8?B?YjdwN3pUR2QyOVBiYncxRStXSjJZdmJib0V3M0hxQmJ3YXdtdjBpNkt5bEF6?=
 =?utf-8?B?eW5EcmVMdmxIaXo1Q244UUpwWnh2cFVmS2hKOExuREhCR0NYVmJORG1reVRV?=
 =?utf-8?B?bW1sQVpzMThoVjFJdnlzSG50MzM0N0FwRVZjcHFaWTJNeE5ZT2RmLzhFMEE5?=
 =?utf-8?B?eFVGaGtlTjhYNlE2cjVZbDYyLzdqeVpwazExb0VFTVF4M1lnZmJpRUlRaVQv?=
 =?utf-8?B?QlRtQlk4RUNIZW8va1VHeFNPQlRhaC95eEdZaUZWcnBGOXdsMTU1emFlSkRC?=
 =?utf-8?B?Z21haWZvOU5Weng3OVBFTU03L3pZQmdaVU5CUis1U25IRzFDaitiaVZ5bkc2?=
 =?utf-8?B?VTlyMG4vdkhqanpIQWlOUlp2TE9MTGZBa1NHUjhlT1NYK2tEUjRyZ3B2enFu?=
 =?utf-8?B?Q2RtRzI3KzUwU3ZCbklnNmZ6alFBaGl5TVJucFpBcUMvLzRPbXJnSFJpWTRt?=
 =?utf-8?B?YVpLbGRsdUFsRzhVc2ExNnB5Vld5WDhQVS9XeTRPb0IweVQwSW44OFBJeUJx?=
 =?utf-8?B?dW1EdUE3YWV5NUxHU0d5eW1UQXN1OVN3dFI2R3Y1NDhObCszN1pnbEFZdTlm?=
 =?utf-8?B?ZmhuOStJejNxTFdUSUo0TFhRbTNHbWQ5QS9XUVZuYTU2Rk9GMVNQQlNkeHg2?=
 =?utf-8?B?WHpLQVVyVUJNVEViYmFtMDZLVG55VzBoajdSZERaOUwyS3VlemltajJReGYw?=
 =?utf-8?B?VjFkU0wreGxKeFMyeXFONW9oUXZKVDR5Q1I1WnNjRDloVjR1QlZYTEltZytu?=
 =?utf-8?B?OEM4Ykw1MCtTVGYyQXk2UHo1UWY5VzZaNTl4R0VKSTdqSVJzY3dVZjJVWWtN?=
 =?utf-8?B?OVVUS29IdWxDOVp6NStmQS9aZVo3NzcyazZHY3U3YjRwb2RKaTBJVU5vdTlL?=
 =?utf-8?B?RWZOcnRhNk4yNEgrUU8vL2JFNGRVc1hGZ0Y3MllpazdlT0lGbW82MG54VkdR?=
 =?utf-8?B?TEEvb2R5Q2VSM0JvdWZXcXM3SmEyT0VyVk1rRUFZZ3ZSMGQxeUNhU2h1Ynhl?=
 =?utf-8?B?a2RHVXNlZEVJcmV0VHI3dkxORVBFbGgxMnZJV09WTzkwWGpXcld1eXIzazlX?=
 =?utf-8?B?WWtoSml6YVVsQnpOcDd6anlldEJqWlNhNnc3L1JROXpya2VTU0JKbHpVQUhI?=
 =?utf-8?B?aUtYUEhINGlSZmFRTGcwNXZFT3NrRlNESzZvTjNvQXFtVFpOTnQ5eGlUS0JE?=
 =?utf-8?B?clM2Y0xRYUdqTjFmeDROdjFpcHhvQmpScmhwbXAvcVpza0w4ZVhXdkpaMXpE?=
 =?utf-8?B?Wkw2ZHRyeERzRUduK1AvYlMyMjkrb1FkRWdtQ3lQSE5Sd3FLb2JjUFk2QTZy?=
 =?utf-8?B?em1Ud2NKMjRFazJVUXpzQXFKTW4yYnd2UUhVUkhSWmdUbTIveE1SMHY5WFlz?=
 =?utf-8?B?R3lVTjBpVWYzQW5HYm1BMWF3dVhiNTlCUGlBZTF6OFZ0ZmVnWHFYUU9Tc01H?=
 =?utf-8?B?cllIV21XMElqc2dVNWF3WHlrR201RVdPTDcwTk1vb3N3VkNZU1QybEFWQlBI?=
 =?utf-8?B?Vm9oOWU1OWowYUF6MDJqaW5GQlVIRXM4K0FUb1FWUmUwMHpOejZlQ25zdDds?=
 =?utf-8?B?S20xaFMvZFRaUXpDVHlUR1dVNCtLdzdlanpUa3gvUi84NFl1ZVdZeGZKYlN1?=
 =?utf-8?B?TEtSTElzUmJ6SzNVSkd2bkxhQTFPTlhBVlo1NFZxbk5JcjJpU2FNTmpwcVo1?=
 =?utf-8?B?bWxtb2ZzOXlWYzRKcmJHSjNIbFJZWTI5SG5nbHVjYnlrZ20xaHBZVHNiQlpp?=
 =?utf-8?B?cmFwUkk3SngyblUxaDVreUNjQk9nczNBMUV0YmJsc0oxLzVRM1NHd3dFR3Fq?=
 =?utf-8?Q?c91IKa1jwhY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1RkWU80NjBNTFFCTUo0c0I0eU9HNnlncDdDNDNGaUtteEQ2enB6b3hjbWo1?=
 =?utf-8?B?VzQzQmFCVmltY2diTzRZSVNvUFdoVVNzbjhpSXNIeGVkZkpER1Q3bUZ1SG5a?=
 =?utf-8?B?YjR0K095MFZodGV4L1p3UkdNOGFuMFpmZ2NnQ2NnOU9XUS80Z3M0ZE8veC85?=
 =?utf-8?B?L3NzaXYyQ2xQdEMwOU1kdzQ3eUw4cWRNSkJ5RGE3UkpmaUM1eUVYMXdvQXVi?=
 =?utf-8?B?Q2M4N1F2QkVMaVAyMSt3MkhJc0xBOXo2YkRyZ3RYNjk4RlBjZ2hucHNHaHYv?=
 =?utf-8?B?SHRCM1VVUGtDdmJzVlhPNGFoV0lmVENtT1BSc1ltQ054NHlZNjFWbHZIRVQv?=
 =?utf-8?B?RE9DelRxQTRPeEkvTHZ5WXJacnBhYmwxTnZ4UkgyYVU1UTdPbWhNVWlmR21U?=
 =?utf-8?B?ZWhDMEpnVmpQUGNXZjFRRlZQTXBRNkNCRVdvVXo0SXNYN0ZGODVQbCsrbUJs?=
 =?utf-8?B?SjI0WncwYjlyOGtWV1dIWmZtd2trRFQydUNVT2FMZkw1ODlSQkxYcnVnbVF2?=
 =?utf-8?B?VXhMTnpoY0w3RndIMzArQ1crc0hQQkVmeGNPVEZLckxkZWRQVTVIcFFqbzVX?=
 =?utf-8?B?VUpMdFdvZElIc2V6S0xIU2g5dmpqY1dOdThScHgyeGdJTDNMUmFTQVhjTVRy?=
 =?utf-8?B?WFFvQlJSdGh6NzJyOEUwTzA1RGpRZExwZjBINXN3S2xOYU1KQ3pwSEpDL09P?=
 =?utf-8?B?VWVzQUdJbU1qMk92MHVKcmtmdkx3Y3o0VXBhcU5VdDFJb09rZUw1WExWSWpD?=
 =?utf-8?B?ZEJsaDlFT2VtaE9aY3l5Z0tyZXRnL0dkL2tMek9uRExnVWdROFF1V05EUGRE?=
 =?utf-8?B?eDhEd2hkMlNFUXBDMXNjcnFwU0RxNjZaVSt6cUNpOHBHbDBPNjF4NXRLU2FD?=
 =?utf-8?B?Z1E2cytGWmhxbVphUkliYUxvL3hUeW9hbTRVT0hwdDl6MnBmV0dydENhTEU0?=
 =?utf-8?B?MUZOenk1OXRkZ01lTmFTSXgwaURIRFlRa2hkMjkxbUJ3WFVGTG12STNSakFG?=
 =?utf-8?B?N2ZwN2RITlpCaTA1ajVEZEhQZHB3YmliVlBvN1h5NTNZZ2R5ODFTMFJHNE1B?=
 =?utf-8?B?N0lRYkgvcU9jWkVicU02SWpqcy9mU1VSWnFTeXNwVi9TaTRQc0F3UDdLbUZY?=
 =?utf-8?B?TytORWRZZ0drQmhkNkF3ZDlEMGdWVFJwcXZEUTlIeko2SUdmVWtJL1FnOVNW?=
 =?utf-8?B?SkxHc1hhMWxxbG1FNUhWODNoN0hPaVRwbkQrVmdtaFZ1ODdpSTFMcHczLzJh?=
 =?utf-8?B?NHhNMVdBeEFrOVFNWGVwMTMrbGJRMnlvWitET0Y3Z3lXblcxNHByeWhWdlBY?=
 =?utf-8?B?d21lQlgySXNkU2dCR044UWJiazRGTm9pWkRqLzlDT0xiWnl1ZStzYys5eGkw?=
 =?utf-8?B?MWFxbUppVUJsMHc1eXdoVWpCVHJUS05jZkljSVcxbDBVZzN1OVlWbS93d0wr?=
 =?utf-8?B?L25PMWE5ZjlvSmh4ZzRqM1A1Sk1LWUFRcFZwb1FSMFZjd3p3YVJQaW5qVlVQ?=
 =?utf-8?B?cHFiaUVoZ3ZHdTdTc04wZ0hYcURtdWQrM1hib2ZRb1pHTU9TaHZqd2ZMVjd4?=
 =?utf-8?B?NlJ6NHYwZG5OOHo3WWg5b1JPWGxRMFdyNHRnSHZBcFh0SGt4a2J1ZnVhcmow?=
 =?utf-8?B?VWo0Q280YlNNUGIxT2hTVzBBODRrQkFPZ2pYOTUrckpSd3M1TmUwUXBRVURL?=
 =?utf-8?B?ZzNzbTRnUm9SbE1tU0Frc3ZPOUZNVC9ndDhmL1dmS0ZIRTJDdkZzcis2QTRP?=
 =?utf-8?B?Zm1JaG9EOFEwYWxmbWtMRm94eXZKeEtiZU94ZEtyelZYY0pkK1p3aklDNHM1?=
 =?utf-8?B?RzhWM2xJUVRPY2tRcHVVNWZyNFQ3VDIyMy9oVWE1dU13RmliMDFZcHZwSDVQ?=
 =?utf-8?B?ZlZjMGJLY2dsbWZ5bEFtRTZMVmRQRjlFOVJqdmVOZDF4NmRCWjhjbks5Wk1X?=
 =?utf-8?B?eXFNVFI2TkVUUHR2TWZZcTBNSmZ1M2d0UFVaYVJBdUg3MzlaY21vOHZiYitl?=
 =?utf-8?B?aUxPU215R2c0ZzNqQjJtTWEzanhtdS9XcEUvNGwxT1M5bzhqUkVEZzU1aE1Y?=
 =?utf-8?B?ZmpHMmZwbUlaYitaWWNBOGNRWXdEdS9MRmhURU5UalJjaTZWUXc3YytwZGdY?=
 =?utf-8?Q?ag7Pya3xQqH4t4WuPpTLvEmNy?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fde9a14f-dbe0-4c19-9c6d-08dd8ca2438e
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:31:10.4628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ka6EqT6YDfDQ32/1GRDlgf72FHx1nV3/KdVZ7F9ZB7VK85miFhUbu0MfYNwLYsYjsG98Tg4gLsfz3Aeb8YneiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1610

Am 06.05.25 um 14:54 schrieb Daniel Schultz:
> This patch series is based on [1] and adds these R5F and C7xv device nodes
> to the am62- and am62a-phycore-som device-trees. It also reserves main_timer2
> as well as main_rti4 for the C7 DSP firmware.
> 
> 1: https://lore.kernel.org/linux-arm-kernel/20250502220325.3230653-1-jm@ti.com/T/#t
> 
> Daniel Schultz (4):
>    arm64: dts: ti: k3-am62-phycore-som: Enable Co-processors
>    arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors
>    arm64: dts: ti: k3-am62a-phycore-som: Reserve main_rti4 for C7x DSP
>    arm64: dts: ti: k3-am62a-phycore-som: Reserve main_timer2 for C7x DSP

Patches do not apply on master

> 
>   .../boot/dts/ti/k3-am62-phycore-som.dtsi      |  35 +++++-
>   .../boot/dts/ti/k3-am62a-phycore-som.dtsi     | 106 +++++++++++++++++-
>   2 files changed, 129 insertions(+), 12 deletions(-)
> 

