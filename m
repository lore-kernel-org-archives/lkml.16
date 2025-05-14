Received: from SJ2PR03CU002.outbound.protection.outlook.com (mail-westusazon11023076.outbound.protection.outlook.com [52.101.44.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B76125B2
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.44.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236318; cv=fail; b=GvgmOiBN5gpQFAjQTBeSI7USFEW9lhGOt1v+YJS+2iSLTZFpWLN8LvOTSipNhw7o7BpyM92MnMPv2d78He44ozbijd2q4vhQ1HtDb525ExE/j1TbELjp7cQ7V/sPCriZ/Baonek4jmAkUSZhqoAJtW5hyVkxGKoJt5q8RfYYapM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236318; c=relaxed/simple;
	bh=l+yt+saaTKtkv0dealb9jURJ5O5od9fMMFR67nLdaP0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XHbOksb/EISwnPRST1vm9L8wvPauei/lMRFodN9XSxzhlbDKdnJRgu7Xn8+fgXKALNvEqVgTDQI+2KMfJE0rC/93w/CD6rHvatHeeCGsrNqR6RzBaejb2DRM/Zk+WfavnPlyRQ4fdLgMsB6rpD8GG+92zJJMoMYJb7PgyXcbU44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=cK3SU11S; arc=fail smtp.client-ip=52.101.44.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="cK3SU11S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2OdXPJ6ZKA3Rn5xOcNhS2UYTHN/PWW30Xj4Is/FRu5viBUDUJWD9h505NiPOwzck3nWpJP4s/zABjb3vWgB//kn7F69cd5Zm64NvMn6Pc/jR5YIzbxJ+BOR45QUHr5khK2QArpKOdV81gWaMgFHmXWq8cZETMyKHQKP3jj6FoGbsH2sZh4S0aHLY9O/UP0CrHhcMMLyOcIRiSSMtFmK1Le3rSghYe6z27x4HLrZUmNFGtPECArxE3D3EHIvDSQMhrtqTL7ujHPwDOINgdv+hSr3el+GQIhBiqMaoXGFhknKS2BVa67p3jPwZkaIvgsPe5PI0MuXirpxtKzpXWBLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7TyUmKp6NHzjmBjBsSh9f3sh8FWP2XYBCQ8KpBmG9U=;
 b=rW7A541VHuW6v1QZ6YNJML/VvYAK+jZySraAz2QkeGwrkxPfxOFc9ZV0TSD2gCdRKa5gMIhNoCBRfHD4/YLoGj5UTHbyg1El0GUj65vckG+eW2iuBTjxzs0JTmlUsmdVyTLWhK5rCLMc//9H9Pd5N9oG/eMDRTfgWvwXcFOmWcLdZMC845NaF+5abmRsTH4q4Sn6tV4WesAxkTsIzzLIuhm7BO+La3mVBxZQ3iOAq5dlBPHNg1Hdu9+2nQPeQCPzOOMp5Yp/Baok6u2WrZyz7YYJTIt/TiwjNCiLPFMApCzswIZb4AOvQG8fTpIdbkJLUrMtA+JY9SAsIzj5E/63Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7TyUmKp6NHzjmBjBsSh9f3sh8FWP2XYBCQ8KpBmG9U=;
 b=cK3SU11SXJcPrFu8yzzoRuBBlUtf/1qfknYTwGyfjocvqRSAWA8DOH7O7rFFVcsInXCcROMDLS1GuucuutaH1kKgaLbRpfvGNZ+298iQ7TJrE7V0B6tbjBOA/srQCXoLBD4J2FTqACmR7SGrlCHOLVuM0vMCMGCRjoKTM/hUKc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CH2PR01MB9375.prod.exchangelabs.com (2603:10b6:610:27d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Wed, 14 May 2025 15:25:09 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8722.031; Wed, 14 May 2025
 15:25:09 +0000
Message-ID: <2766e825-4a45-47b9-8544-95a427123547@os.amperecomputing.com>
Date: Wed, 14 May 2025 08:25:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
To: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
 <3ed9ff7f-d360-4bca-9805-b70cf51cb023@lucifer.local>
 <106c0d2c-7492-4a81-969c-de4f1798586c@kuka.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <106c0d2c-7492-4a81-969c-de4f1798586c@kuka.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0057.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::6) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CH2PR01MB9375:EE_
X-MS-Office365-Filtering-Correlation-Id: b426c409-0192-4fbd-b423-08dd92fb832d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3lCYkJld3NWRkc4R0NQKzJ3SHhFYlpCTXJuM2tLMXE3UFRMMGxiMDhiUnZJ?=
 =?utf-8?B?RGQ2QlNLM3Q5RUxRSzh0RnF6d3RQUFBkbHZtWnhFbGlrSC9FSWJOalU5MmpG?=
 =?utf-8?B?VUhlU2wvRXMwR1Z4Mk4vTGl3YmtNb0tORGRVR3lmcDVmSndEUVp6WENoQml3?=
 =?utf-8?B?aFlpRUp1Ukt4eFhKZFJGc0E2YUZsOHJtUXZrZjA1ZGVLTEdQWjQ2TnlQaXRy?=
 =?utf-8?B?TWhFYWRNSVBJeDY2QXFUZjErTzNZb25kaHIyU1pncEFSaUd3Z0QwYS9wZnFY?=
 =?utf-8?B?TmxST21xSU1qZk1lZDJGTnFRTjhEd1c0NGprQTdmd2labGsvYnZiUVREYTRa?=
 =?utf-8?B?cjVCU0gxYW5NNDZlSlo0d3F1eVFVWDVIMkhlSjZranFTQTVvcUJWd3NjNm05?=
 =?utf-8?B?aDYyUk01bkFoQk1IZExhWlFqSHJGYjAxVHdZVElqNiszclR2VTNyNlJESWY5?=
 =?utf-8?B?TkJjQVJrNFowcDB2ZVhCUHRDSWJCQ1ZLUmFaYjZkbXd6VTRCcS9iZ0t2aWh6?=
 =?utf-8?B?QnN6Q1h6V2F1TU1Kb1ZBSjg0c1FtcnhKbnh5MDZTaEMvUTd5aVFvc1RGMXZj?=
 =?utf-8?B?RFFFd29mMVBlemdSdzVONUU1YmE4WUhQdDBpb3IrS2NHaTUwUXJjVEcxRy9i?=
 =?utf-8?B?aTB3V01DQndib2tLekhXay84ODg4ZHV2TzFCeXY2MVlsanpYaHpWRHNBVVl0?=
 =?utf-8?B?N0R5a2FSM1ZjM3ZGZFpZYnE2SGRKUzU0M1FPVlBwVW8xWWUxQnJOWENXSW5O?=
 =?utf-8?B?ME16aUtLK0FOZS9OeE5TMjJIaGxaaWVUYjd2d283akRBRlNHaFFpbFQva2U0?=
 =?utf-8?B?Ry9ZYUpnc1JqR1BxVmoxRmZZRm9sSmhSWGN1ZGJOK2EwZUhSdWR1dmZJZXl0?=
 =?utf-8?B?bmp0cHpndXh3R0RnclVPcW9NMTZ6ZU5yWUtJcVFEMUJ6TFk5c3JSMkliNHRF?=
 =?utf-8?B?eHNJUHNRSmh5YXBQUUpLQ1FJYmVVLzZRbE9OMHB0NkQyQWxCOUhjcHlIWTZ3?=
 =?utf-8?B?YjBnc3lsZys3ZU54RUwvTUtWYTU3d0lGOHR0TGh2S25rRmdPQVgrMUJ0cllB?=
 =?utf-8?B?cDBQV2QybTZzVGVnbWtsVjRLcGE5SXc4eFRUMHEvSG1YQS95aTBEell5amY3?=
 =?utf-8?B?N1hIU05uN0oyRWkzcXE2UzZMK2ZKZS85MnBjM0VDUnl1UzJ0Si9jSXFNMTZv?=
 =?utf-8?B?aDlaSklneTBoWGpYcEZzV0hmOWVWRFU1YkpVRFRYN2NjelhOVzZ0NmJlNFUx?=
 =?utf-8?B?bGxmRDZUVWJPd2R2c096dzg4L2E1K3RiT2RUTnJ5a3FET2FlNkhYL0pGZERz?=
 =?utf-8?B?cEsrZEpGcmJxSm5WQ3ZTYUs3TXR2MGNLbGNUNm5YQ0FDQ1VweEI1bmpzdUhR?=
 =?utf-8?B?SThHTmdmY0JGaG5hd3Nkc2NjYUdkLzJMcFVCZlZ6RjZvdE9mRm1MdjVNbVAv?=
 =?utf-8?B?QlJka1FzWi9BZzVwU3JyaXlON2hoTjcvRWJBZWgvOStzaG1mVDc0ZmROSUJa?=
 =?utf-8?B?RGh1c2RiT1lXeitSMUtxVnBSbnhXbXF6VndURjE2T0E4dktOSm9vT20yV0ly?=
 =?utf-8?B?UEF5WHpic0llS3BSbVJXV01jU1d2WjdRN0puSWZobWcxdkhWNnQ0SlRvUmtm?=
 =?utf-8?B?RVFXQ3JmNVF3K2JiQjY2TVB3KzRzeHhQd3MxSUpUb2p4dE5SdHM0QUhFWXpV?=
 =?utf-8?B?QlB4bTFha2psS2JVczJhQVBvdWl0eGN4a2lwUEpHSlVHYVNxZW5jRTdnbDFH?=
 =?utf-8?B?ZThDUitCRHNiSUNJdDk5Njc0SDN1dmhkS1JxS09QMjV0TjJWcnFHdGdtSlRw?=
 =?utf-8?Q?HAyctNnQgVvpycITM82VP/TMpMqmMxm94hCHU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1dGd3pXMW8yNkFIMC83Z3ZUajdiNTBDYjZMVmVoTEI4eE9GdmIwZTEvODBm?=
 =?utf-8?B?NmZ4c2xaVERnWXQ4a1VQUEcxbjNjNERwWGVsalJYR0tTVjA4a2tQaTY3dDNq?=
 =?utf-8?B?V1YwUnZNS1ZFRmZHT1VUU2JLRk0xWVpLQ1Bjb0x5T3pmYWllblRLWXpid3A2?=
 =?utf-8?B?R0l0dzdpeTVteEFOWnNjc0FnbVFxNFg5WUtDNzBNQ21zN2xVNm52ZlpiL0h4?=
 =?utf-8?B?OHhMOXdxL1JNaDFhbUFNZUFhMDRpWXF2TjY1SmhpSnZMbFV6ZGRLZjg3eUFi?=
 =?utf-8?B?Tm4yKzFiQXJTcGh1Sjc3d3NmWCsyYVltVTRFS1VCSWh3d0pXMHJhZlEzWll2?=
 =?utf-8?B?RWNHcDAwKy9EZ2ZBeWpDVyt6R3NTYW1HcUpsOEtuTXV0Z2R4MVZiVnV6cnlS?=
 =?utf-8?B?ajdQdVBTdEY5MGVVNW1GaE5FallGdzFoNytFZ2JXN0cvQ21VL3Fvd3NHd0Vk?=
 =?utf-8?B?WFM2d1AzakJDZXBWWWxiTEVCYUF2RkJkQVpYMGVoVDVaUU1La1lTUjVkTmhP?=
 =?utf-8?B?STUyaTZKd29RK0orYkYxUUYrVVluYStjb0lKbUFaWllKTkZnN3VuV3BSbnZX?=
 =?utf-8?B?OEMzY2M2MmQwbnc1MHlJTW1ldG1yVkhBMEVBSFZZYWthNTI0OTVNSGlrbWpD?=
 =?utf-8?B?OVVxbWoydWVuTVZtVWhLcTNNTHVTaFMrYUIwSkcwMUdqeGNKK0kxeEI4Zk5S?=
 =?utf-8?B?OSt2bkNwOFdlTVd4U3I3aXZ3Z0ZSNnhvTWN5S3I5THNWOUdZOSt2TkhXdEQx?=
 =?utf-8?B?TUZEeXBJekVIaGsyeHpLVkZUV2ExK0JhUUk1QituNFN1TTZHYzRBTDRVQ00y?=
 =?utf-8?B?dW0vYXQ4OHNyTTNVWlc3V29HWVdZZXpZbWFyOEdXc3RSK3IwNmlSYXBJbjgv?=
 =?utf-8?B?RnUyZmc1Mm44cU5qR0tLSWwvd0lVUFZnWWw5U2ljUG5aSUVYQy96L2hMNEow?=
 =?utf-8?B?Vm5WQXcremhCY0Jva21paGdUakZqQWp2V2gxOGFHWmtFODYzTEE3L2lZeE90?=
 =?utf-8?B?TEFVUDg3b3VjQmZ3RUkxM28wYXNkR0xnZWV0cTdiSnRoc2tvelc3MXdnVkJx?=
 =?utf-8?B?SjYzZERYdkpQL0Q3RXh0K1ZIeGxtWFN4OU1YWG9NdldBNkF2Y0xsRGxZc0l3?=
 =?utf-8?B?cXhIcFIzQmw1S2pwSVlNclFsMXFsUXcwejlFS1JKUmRMdDhLOWtwekJXMzFn?=
 =?utf-8?B?QVJLY0VaeUlCQ0ZvMjVGeEdQdmhZa3dMemJyazN4QmVoK1ZVZHhPb3pDSVNm?=
 =?utf-8?B?bm1mVUtkQkttbENMdXdVY1MyZEV5aHc4bjNreVJWMm00VXp6cmNKZit5TkVw?=
 =?utf-8?B?ZHI0T3d3UHpSNHhoWGF3RTYvMzl0NFJzeWRNdG42clhJcmRuQnNqVEJwQ3pt?=
 =?utf-8?B?cnFIRW5WZ1gyM0cxSG1UQTR5SGhZcEZya2xzRkxyazhpeXB4U0IxVHI2eEMx?=
 =?utf-8?B?WnRtM0hVZ2hHdG4rNHBPRlNPRnU0SXY2MHc1Vjd1OGlqYTBVcWkxUU9kbFRU?=
 =?utf-8?B?Y0NLM0xPUmx5ZjR1dEE3VTgwVTkyTlkxSWJTdGtXUWtOd0VVN2J5QzI4aEc2?=
 =?utf-8?B?N25xakRUVVZ3OXNRbmx6eERjZ3NWSW8zN2VwZldyNjYrNWlmRFJLd1UrOUln?=
 =?utf-8?B?aVlSZFhVN29HNTZwa2gvQksxUlc3cTR3VUlrU2JoeGs2cUJmMFN6YVVOZnc4?=
 =?utf-8?B?WUtNNkNmVnRNL3VSQzFoaTE5R1cwWjJ0WjcwVUYwTW14dmc0Z2VQUnNEWC9h?=
 =?utf-8?B?cXZUd3gvMmMvcU8vZnNYZ1J0b0pZMDQrWG1neDJicHliQWRqK2RYK1Z1cjBP?=
 =?utf-8?B?Um1wRTdhWC9HQnpLeE1MSGU5eWRCeHArSmxxaTBQSHdPRDYrRWpSSnRJRGZR?=
 =?utf-8?B?OTZZaUVMWGdxRDlVZ3VmTHlGd0R3QTN6ODRYQ2hmcXdZanRPSXc1eXZzMzhq?=
 =?utf-8?B?MTE1ZDU2bEZ6bXlwMWs3WFVtZGRhK01RWVRYZUxZLzduMUFUVTdCUU9LSnY4?=
 =?utf-8?B?UzJadWFvLzRtcUdOYVhORUlqYUNNZHFQMzlwbkdhdTRkUndEQ25mQnpnYlRO?=
 =?utf-8?B?M0Z0RlJkUFNXOW1TSEl0TUZqRHFEdUdSbFM4VlArb1YvUnRTb0VQcEZkVjIx?=
 =?utf-8?B?bHlPT29ZQStacnB0VG5xbCtNdGlnTlpva2FZWTdHbzNrakhQVkludGhveHFD?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b426c409-0192-4fbd-b423-08dd92fb832d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 15:25:09.3593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gn3PGjaBhXfDESmIK+V/NTkU4FY9Xy+ezXptnFTTybThViaVKjZTVlNivqEFiwJ5HMCuJUTOV7buyOksM4+6edT0AzuHstu9alHXSpVcAYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR01MB9375



On 5/14/25 8:07 AM, Ignacio Moreno Gonzalez wrote:
> On 5/14/2025 3:52 PM, Lorenzo Stoakes wrote:
>
>> I have pinged s390 people on there, but I don't think this is going to make this
>> cycle given we will probably need to coordinate with them to fix up this enum
>> name (which seems the best solution to me!...)
> They answered that it would be ok for them to do a quick fix over the mm tree:
>
> https://lore.kernel.org/linux-mm/6f8f3780-902b-49d4-a766-ea2e1a8f85ea@linux.ibm.com/
>
>
>>> +#include <uapi/asm/mman.h>
>> Also this should be linux/mman.h I believe, sorry for not catching first time round...!
>>
> Including linux/mman.h leads to a compilation error:
>
> ../include/linux/huge_mm.h:601:23: error: ‘MADV_NOHUGEPAGE’
>
> Including uapi/linux/mman.h works, but I am not sure if that is correct.

Is this build on x86? I actually tried this on my arm64 build before I 
suggested uapi/asm/mman.h. But I saw a lot of compilation errors, like:

In file included from ./include/linux/memcontrol.h:22,
                  from ./include/linux/swap.h:9,
                  from ./include/linux/userfaultfd_k.h:18,
                  from ./include/linux/hugetlb.h:16,
                  from ./arch/arm64/include/asm/mman.h:10,
                  from ./include/uapi/linux/mman.h:5,
                  from ./include/linux/huge_mm.h:512,
                  from ./include/linux/mm.h:1238,
                  from ./include/linux/memblock.h:12,
                  from ./arch/arm64/include/asm/acpi.h:14,
                  from ./include/acpi/acpi_io.h:7,
                  from ./include/linux/acpi.h:39,
                  from ./include/acpi/apei.h:9,
                  from ./include/acpi/ghes.h:5,
                  from ./include/linux/arm_sdei.h:8,
                  from arch/arm64/kernel/asm-offsets.c:10:
./include/linux/vmstat.h: In function ‘__zone_stat_mod_folio’:
./include/linux/vmstat.h:414:31: error: implicit declaration of function 
‘folio_zone’; did you mean ‘folio_zonenum’? 
[-Wimplicit-function-declaration]
   414 |         __mod_zone_page_state(folio_zone(folio), item, nr);
       |                               ^~~~~~~~~~
       |                               folio_zonenum
./include/linux/vmstat.h:414:31: error: passing argument 1 of 
‘__mod_zone_page_state’ makes pointer from integer without a cast 
[-Wint-conversion]
   414 |         __mod_zone_page_state(folio_zone(folio), item, nr);
       |                               ^~~~~~~~~~~~~~~~~
       |                               |
       |                               int
./include/linux/vmstat.h:273:28: note: expected ‘struct zone *’ but 
argument is of type ‘int’
   273 | void __mod_zone_page_state(struct zone *, enum zone_stat_item 
item, long);
       |                            ^~~~~~~~~~~~~
./include/linux/vmstat.h: In function ‘__zone_stat_add_folio’:
./include/linux/vmstat.h:420:56: error: implicit declaration of function 
‘folio_nr_pages’; did you mean ‘folio_page’? 
[-Wimplicit-function-declaration]
   420 |         __mod_zone_page_state(folio_zone(folio), item, 
folio_nr_pages(folio));
       | ^~~~~~~~~~~~~~


The build used default Fedora kernel config with THP disabled and 
v6.15-rc6 kernel.

>
>

