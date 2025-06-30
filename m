Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011054.outbound.protection.outlook.com [52.101.70.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9B728B516
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291964; cv=fail; b=ANYCk66EE5qhYVqJCVNONhqr6CkSAhJxVSTUhzSSZ31vx8LhG0BJuMd/NoOO7IzbzEVThWciVzf6BnHSeD11+mqp8yGaR8+oYLxnibU8nYLcEq6KQ9bieIEgulJM/0f/Ar62wn0Fe3Ga51KmT65l6mVVD0lXt/y9pSWOrqmVgvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291964; c=relaxed/simple;
	bh=LexlatkBHNvuaMri7+Q+tnDWN1j40ojUGhI63b4nTGY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Az7sccXbgxe2SdnQWdsTLF6vPVFUDzG/Lw6R3wkltWe9zen1ZnaXbfZvp7ih9Pl+wj+jMSPvnzNPz5KCUbp8LFIDj74/0ojdnLcCBclv+MMwYnaD9s2UzulV6qlLtcXDQrBwV9PnvOrMgrZbiOaKKG0FuAP5L6mC1guM3qennN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=F8L8O0RH; arc=fail smtp.client-ip=52.101.70.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="F8L8O0RH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrfCfZgGeJyJ55i2ur/fdszhsJthyO0YuApkNXRP/WYrSA0BgCRiTchwSS/jB6Nzqk9ENVgiZffJKML2+c4EuecCeg8n5KOJxcZWjHvk+VMEeCjYpZDcqRYQnyrSYxxLkJU6rMFRErnm+0PKcx1NWeB/YokFzZkqax28A4/r8MOiu6OwqzV0noZQb9QKyTmYbHOIyQUJnso2RlSfWPJ9/eRMvDc56reCZuicKonSSRjEcoL9bYc+RNto1CerbgElDRiNQin47/NPpfYMkcFSMk23j5NFNkd6b8BQZn7YHRmCl9X482AlR9H+er5rLVxxWJvMyTqQLJS+z338sqp9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znrrtco5uf16wklYLqxKC8NdispDi5nr2T15dwlQ9xQ=;
 b=a3/+SJyNkituLJrjDQ3bz+VHXIX9hzC5e4kipVBnHLLuFD8qShyGTDm2S5CVN/jmBxrl15GvV5B3MwKdqYh+b0cOE7OANifj+mYqWiSLXEyqE5wLPsb8lzi1Fl3EQPGuE+TA/Ljbl9GeV1/PIaCujN2zKAl2G9vojlAoFicuPyEMdZyxsOIqPgeyokJ/Zm4TXocSut+SLyvleWCu5Bd6nZo4sQG9RMwZHNH25GxQrDPuCe+N+4+NtNev74FoUhGbJDYv2eclWgXPnkE4dt1ySDSu7Bi5EDyvbgxWaNxohYBmy/qKLgo4YuWAmkx8T2dnn0PZJ7k6DNoI3xYRC4cdIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znrrtco5uf16wklYLqxKC8NdispDi5nr2T15dwlQ9xQ=;
 b=F8L8O0RH9TDWFGyw7a+hqMSCLowFINNvRJ0yMEj88Marn0INQL0d9Ap1M6v3cGZ8zDuYdCt9JZG87E9BlIHpCCYulgj7AAwSgEaFZjdn1N3qfFA+k0m+bsEQuxYfDxAE1OYEX+aRCvVeLRoMV9DyIKAc0G6f552VVaQ6d3gSmqiPAkCpSMcgdWD2Kg4JDLqcmvmMnQXJfdrYjTm9/vIaa6mFUzvdo8DFQafExhCgNmvxw9rPsjD82nTk9e/pJRslFBgc4ly2SKeoHOfaqRHujW+4zjX5v7IzJdkygOUnLhrYTMOCxmL5Hm9OA3QavXOuQLrx5bL17fKCoKQkJzonNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from PAXPR07MB8771.eurprd07.prod.outlook.com (2603:10a6:102:246::20)
 by PA4PR07MB7135.eurprd07.prod.outlook.com (2603:10a6:102:fb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 13:59:19 +0000
Received: from PAXPR07MB8771.eurprd07.prod.outlook.com
 ([fe80::e125:c4ef:b872:5c60]) by PAXPR07MB8771.eurprd07.prod.outlook.com
 ([fe80::e125:c4ef:b872:5c60%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 13:59:19 +0000
Message-ID: <c77690ff-9f3d-4ab8-9443-b377134e90ca@nokia.com>
Date: Mon, 30 Jun 2025 15:59:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irq: add support for warning on long-running IRQ handlers
To: Peter Zijlstra <peterz@infradead.org>
Cc: anna-maria@linutronix.de, frederic@kernel.org, mingo@kernel.org,
 tglx@linutronix.de, akpm@linux-foundation.org, bigeasy@linutronix.de,
 linux-kernel@vger.kernel.org
References: <20250630124721.18232-1-wladislav.wiebe@nokia.com>
 <20250630132517.GM1613376@noisy.programming.kicks-ass.net>
From: Wladislav Wiebe <wladislav.wiebe@nokia.com>
In-Reply-To: <20250630132517.GM1613376@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0310.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::15) To PAXPR07MB8771.eurprd07.prod.outlook.com
 (2603:10a6:102:246::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR07MB8771:EE_|PA4PR07MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: b894641b-937b-4487-4cdd-08ddb7de4f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1RhSTRpT3Q4TjlqTHdldVZ4cUhGZHpwNHRURTI5OWhSOCtuTCtLTXc0Ymxi?=
 =?utf-8?B?Zm5QVUQ4YjZGVFBzcVJPcDdSS29GUjhWT0pPZmlobzgxM1RwcFNMZHVqcHFq?=
 =?utf-8?B?UVgxUU93bGNUTVJpV3lyU3F5VjBrMWVsODhuRG5GcTE1VGJmaXduak5hN21u?=
 =?utf-8?B?V3BJVmJoMVMwWEthcXN3NzN5ck9haFJMWG1OZHhCVnZDbEt4bnpFUUJvZDZx?=
 =?utf-8?B?Q00wM2lQV0wwQVNEcmwxZVV3VWM3N0ErUTErbVU4TkFlUDd6dEpNUHBMeGth?=
 =?utf-8?B?YmFNQTVJVjYxSHFualNNeE8wd0dRdkZSdlNTWEFHOWk5Z01ZWkJMalFxUUJi?=
 =?utf-8?B?UThkZzBVRVZyTmV6OTF2cVNFcmJvMUszZU5ubFpyc2JHSkhjZlVYTmpJVjdl?=
 =?utf-8?B?SDFRdS82Sno5Y3ppZmc3L1ZUTk80S3lQYjBIallzTXJEK015OWtaUXlTUk1m?=
 =?utf-8?B?MWZpNXNLUVIwZ2FGSlZuTDM4NnNKV1htL05tdW5DWVBXemJPTkZ3MlFjQzd0?=
 =?utf-8?B?Tk9RVG0vYVZrUlhrVVpJcVhhZkNPQzZ4VlA5d2ZKWHBmazlNWnNDUVFKZ3Qz?=
 =?utf-8?B?OWl4S1V4MURyOEFxbTRSOUsxY3FMcjJ0cVJOcjcya1FIcmt5Z0cvS0szd2w0?=
 =?utf-8?B?OGtkVGhFRzZ6YkpPUVNSWXVFTjRmYzVsb1k2L1luQmZJd0lKVmw2NFpaODRV?=
 =?utf-8?B?QmVPUFNrUUdFU3VueEFYczNnNll0dmRta0lrcm5ybWx6V1dURDJaTmY4NjJO?=
 =?utf-8?B?UlNuL0JjMExjMnJzeEZlUXQyMDZCMjMydnFhR0RweFl4c0Y2QTI1b1NjMUxL?=
 =?utf-8?B?RzhMZDVTTTJtcUxyOXluR3FzNVBMRnFFN2FBMTFlYllUNDFQWE85U2ZBZEZN?=
 =?utf-8?B?RlBjelZPZnI4YlVCeUQrYmVjdW9sN0FkOUR1MVk4R1hCU3ZoU1NBaTZENWVN?=
 =?utf-8?B?eWxiOEt2eDRhRFp5RTRpdVRkNU40T0c5bUNRNEdmZXBjZmI0dDlXcHljdjlW?=
 =?utf-8?B?bDhjV1hQRVE4Z21iM1FVWWp2ck9zV0pvWmxxczgvcld0eEwrek9EcitWNSts?=
 =?utf-8?B?a1E4U1hjVkRLMnl3a0NBaU1mQjNQWld1d2xzLzcrNzF1K0dreWx6WVpzaTBI?=
 =?utf-8?B?K3poRmg3YVhHQmFmZExmTW1sS3d4M1FSQkZlU1lPaGV4aERKM0JWKzJ5aDdZ?=
 =?utf-8?B?aWRPb2REdEFpbGZRSWhCNHZoeXFxOHBGUzFST2FvRGFUdW80RlVIMHlPM25a?=
 =?utf-8?B?WFAyQU1TVWs4dnAwSHYyUStiTVNTdCt5OVRGYlc4dU9reHY0ejJLNUQrWDlu?=
 =?utf-8?B?NCtEVlZMS01JdzJnYkRUbG9reE5OS3pqS1NvVno2dWx6Y0lUR1pDTUppd243?=
 =?utf-8?B?dDhkQ2lGWjE4bFA5Y3E0aUpoLzJiUmFIczdhZXVralVkSzV5MzdEREtFcWF1?=
 =?utf-8?B?dlBzNFNlK1A2T1I1ZFNEb2IvOTR0UWNkWWg1K1VweG1vS0p1cm1OK3oxMG80?=
 =?utf-8?B?TzJBSmE1NmxwU1h4akJGYzJJb3NHUVJmbUlVSWFLZ1pjYWpFRC9CUjZaM0Fq?=
 =?utf-8?B?Q1IvbzZ1TDAreE92b2dhMHlTQitHRjkrUTR6bG5ZZi9yYVAzMnVDQTgxck5y?=
 =?utf-8?B?TmlIaStCNGdGMnZsemRGTDZqSXU2UmFRTEdLV2NoSkZoWlA4SGQ5RlExQm9U?=
 =?utf-8?B?OTNFbm1uVC9Ra3JXSHcrb0h0VXBCU21qdWRHaDVySGs5bGZoa095bSszYi9S?=
 =?utf-8?B?ekhDTWVyNkgzWVFJL3lwM3MxeG1XbGR0OGtKZG03Tlg0MjlaTzQ4QlcwNHBH?=
 =?utf-8?B?VFdjOUt6L05yQVRzV2M5N0NjWVJKNU95dkFjTVlwY1E5b3FPUWZSaE5acEVp?=
 =?utf-8?B?Z2hySDZUd3gxdHVyQ3ZHNXhGMmIvdlk0enVCblUvSndpbi9YL3hxNVlBdXA0?=
 =?utf-8?Q?VEdNy9MJ59s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB8771.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzJweXhhZzV3bjh2K2VFUVVEcmNubjQ0dXpUSVZFNzMwalExanRpcnRJckFH?=
 =?utf-8?B?bERPOGZ1THNWcTRZMXovUEdsKzF3a3daUzROaFZlSlhOMmJiQ3hGaWFDQlpV?=
 =?utf-8?B?KzJwRVFTTnVzMXlnVTVIUjZSMjdHRDRjSjMzZWkybVlrVit6cXUzRVFDSVk0?=
 =?utf-8?B?S1Jpd2ZqSHlqWHZBMjJQRXN6TnFubnoxUHAzMXhMMnRUMzhCb0FqT1Nubmxi?=
 =?utf-8?B?WndoZGM4RDM2blpDMXY1NGxSNUt2UEtKMHBtUkhiaURnYzVIZUQ2WndGbUdZ?=
 =?utf-8?B?ZDM4VWlEZFN1aHRJVDByanFHOUR5aXZhQ1U1cGhjL20yYkxYVkNiSzh1SGx3?=
 =?utf-8?B?VUdCa2dGM2dTaVhzOWEvRG1qM3VsMFF5WGY1b09BYXZsUG1FWmc4SDAxK3ZB?=
 =?utf-8?B?RGI5L3grWGVORXQ5K1BpWk5sdVlyUm4ySTRzbTFROSt5dzdTYXNnc0E4NGM3?=
 =?utf-8?B?UXNWZnh6Tm1DWlE2dkJkQWRkdk1zcHJSOVVNOUdJMVZVREV4eW9sRktqRnZ1?=
 =?utf-8?B?RW5QSW5EblJxN3JCODZxeG5LK2wyd29FNWlaelRhVW1ydXJqNkVMTmJ0L29n?=
 =?utf-8?B?aSt3YmxPVmhrTEM1eVhDUU1hbFVpdUJwMEw0NDREY0VPd3hseEoxTlo5OFp5?=
 =?utf-8?B?K1BnclJtT216bXhJWXV2K3VMUEJnS0FIVjhoY1Y2Z0NnOVh6MXdyR2lUT0Fh?=
 =?utf-8?B?NE40MkpteFJGb0NPdE9jNmZvSmIwWFE0RlpGMHEwQUdKYkhuUnBBOGNGZWFW?=
 =?utf-8?B?RTBwU2NjTjBVOHZ0cWJmOGcySndtOTBWZjJKU1ZVbVN6eUhWdDY2SFd4dHRk?=
 =?utf-8?B?NTVIYTkzYjhFYzg3djEyMzlSTFlPZXNyOEsyTGV5Zzhubi9XUzVlN0Y3ZW94?=
 =?utf-8?B?bEUvakxDVmR0Y3ZCMVgvSnVGR0REOXJUTU05Y0F4c2lJL2xqMlFxcVdnQnRG?=
 =?utf-8?B?amZkTWJjak5DWFpHSTk4VXdvV2NxcnJHWm9BWEhmdEwrcDQyQUJDWEMwOG53?=
 =?utf-8?B?eGRDRjd4K1p0S3lMT3JxK1pQRWFFZEdxMU96Y1dvelhybnVRZmpqZ2g0ZHlZ?=
 =?utf-8?B?OFlvUUFvS21oTHhjSTJiQW5CN1RZUXpoYk9XK3k1aDMyWHRUa1cyeXlvdTA1?=
 =?utf-8?B?S01CdzM4MzZLcXdhREszQldpak1LVnZzdU82QmpPcmt4VUI5bTQyMDBreTRa?=
 =?utf-8?B?NlJCUTFWMFNyNHVEQ3FFaHBYalI1Z1I1RXFwWmlPME9LY0F2SjhNSXR6Wjdk?=
 =?utf-8?B?UnNDbXRxd0FMdFM1LzVEbVpFVXJBZ2I2S3lwbW1tQWxLK29xRGRSUU9PZVRl?=
 =?utf-8?B?cU1TeVZmL3RlRWFmWGRLUVc3N0JTdW5VWTRWVlFRd2pxcTcvWE44MXFIY3hN?=
 =?utf-8?B?czJ4U2dwRHJnSVZXOTVUSlQrZVI2clBsSFhwNStHdXVvWkgybVBQWWpnRDc2?=
 =?utf-8?B?VmNEc3hrUXBFb3dMYXhlWVQyaWY4M1NLQWJQWDBCSmdoNDM1S2pqcHRiTlls?=
 =?utf-8?B?QnpleHFBYVhNQUFSTXZlWXlTOTdkS1htdmNRNmhDMDZiQ1dRWnlSa2NYRGFQ?=
 =?utf-8?B?WlFpSlNOekIvYzFFQ3VnSWR4YW1hdjlnTnRENmtJdkdKZ1FPamkwRHc2c1Fx?=
 =?utf-8?B?eXJ2RFlReCtud1JyMkRZTDVjQzgzNHV1a1ZndnpBWU5kK2J1eFUzV2VHcisz?=
 =?utf-8?B?azRrQVo1cVFNVzcxM3AvRFRWTDRmaTFUSWZQcHZJUkMzeHIzVWxzY0xRSnRH?=
 =?utf-8?B?bWdRejY3YVBHc2VNc0MyeitOT0pPeXpJVXBSd2Flc2lOcVc2cmlFZE0xTUN5?=
 =?utf-8?B?bW9KSFU4NlNrK3RJbzJlaFFQOEo4Z0RoMWF5Z1R6SnRGL3ZNdlBQZEtiK05l?=
 =?utf-8?B?L0lvTnJwejA0cWJZYk1qWGNJTFNra3RLYUxyOUk5aGhwS3p4MmpqN2ZWL3BL?=
 =?utf-8?B?VmZoM0pUWjJoeC9JVGVqaThXWDdTZWlCY2dkVmlTd1dOZ01keEFCcHN3Y29V?=
 =?utf-8?B?aHFIWnBFQkRJNWsraWswTlF6MTBOZXNHNHdVaEt0WE4xSFBxbk96NDBtNHEz?=
 =?utf-8?B?NDhKa3JMS0JVMzRIR1Z3dm5GaUpBNGVGdTlCQXlmeGFXSXBheVE2VXpVVnRm?=
 =?utf-8?B?dS9YQnVjNXVtdnZxa1JJeUNjN1grQzBUZ3R1V1BTOWpMaWxyenJ2b1FaN0RR?=
 =?utf-8?B?Nmc9PQ==?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b894641b-937b-4487-4cdd-08ddb7de4f11
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB8771.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 13:59:19.5168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDbn/8letIvWkZnwKvIxSpopljwYN8VPjg1VRnbQ50kquYDeLqc4uBqi7eMryJOKxa9z2c0/pR2r6Rj2RHu4UycVyTJkMj+cRXy8AMtO4Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7135


On 30/06/2025 15:25, Peter Zijlstra wrote:
> CAUTION: This is an external email. Please be very careful when clicking links or opening attachments. See the URL nok.it/ext for additional information.
>
>
>
> On Mon, Jun 30, 2025 at 02:46:44PM +0200, Wladislav Wiebe wrote:
>> Introduce a new option CONFIG_IRQ_LATENCY_WARN that enables warnings when
>> IRQ handlers take an unusually long time to execute.
>>
>> When triggered, the warning includes the CPU, IRQ number, handler address,
>> name, and execution duration, for example:
>>
>>   [CPU0] latency on IRQ[787:bad_irq_handler+0x1/0x34 [bad_irq]], took: 5 jiffies (~50 ms)
>>
>> To keep runtime overhead minimal, this implementation uses a jiffies-based
>> timing mechanism. While coarse, it is sufficient to detect problematic IRQs.
> local_clock() was found to be excessively expensive?

Perhaps not excessively expensive, but jiffies is the lowest-overhead option here, isn't it?

