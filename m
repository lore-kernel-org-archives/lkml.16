Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BC72F19BD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616927; cv=fail; b=aGXEImBgqBU5ziuixxv3AxU9oQ17JRfFogapt+mv9CBZgPcx0oRDw7B0+4iL3yqQuOQLvt4UhrYB3MpaiL8cPCql9HOYbNsT1ayfwGKck1iSD8JGmFq/ylExjyQ0Qq33I9dgHkjaWVcsZq0pw42w14M7ziUK4DiFiC7fApm2ves=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616927; c=relaxed/simple;
	bh=Ze+kEufwg4tL2snB9v5AxjEgkwEBn4ZLEn8mvJrRwBs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DLESqqMhEgTxdy38CgnEUYrzQLf55zslQK1NFI5f13AeycJ2qG/uIYK35E6NYfzKBb9rz365b88L/2U0Sx9zJB95S6dY0IcKg2mQyevSqo4H98lzX2jyX8mTiah7q2wygT91w7g0gQHWsPk3Ftd9GGX6ueIjBoLj9LHW31SMLAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oODR026f; arc=fail smtp.client-ip=40.107.236.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oODR026f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dm1B0y1gKDgUFSjZ6SjKfqbVdHwaPbCOgNiVjvTeBLoD0HV7/oaq50Pt3XpO31sKNA1U/xa5HFH1lmPcDrmCuK6mLIn+MWMw2ETELOryJuF4ig0ubJKjCfFXA3stspdp6oVd+dFYFGTXSDUsY5FtOULbRkyVBnJRT+Bi7rJQfsXrIp1dyZvqIpMgVPtJu3aD757xfw7sR5NbHknVYmOBbwYyUybulIbQwtes6kyltUbWseBN1UNyILZzGZVkzOz8lH+PZge5r6vaxo+5WVmLgKjOzn2E3nn7Gmqw7OSZ9Is5KXQdKh85LzWVtv+utLTDCeZO+91UqYMzrHBKsilQ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qguiF5n7WHZNuUdIlvovomg3lV5qRZpScrFC0EFMFbg=;
 b=xLOl8nDOmmK9HlBDkly2Q0XZgNciLFobvD1iQa7ba2gK2PBWNP3rv42/sWi4J/1/au9EO3YOpxBe9Y8fhA7k3pgPMMHw4eko05RVg0PFDKtJFdvd4VOrihXrxlITgVr/ylowo3PMheNyUd3TJyjSjLHGURzYujjekbw7NwnkIhsk1r7ISDcVysOQw1nFjmeRDsZTm9Gy4alrcTAyi+1QVYgv4bS1stxZZ8iSn/+TvDBTso3/tDGtwuYQ49sHJLH/QuJSSY6XcLXBl7uR/dRu4a41iLrSlndYI1uyr9dtlLAmVtt8uDFTZuRNFjtO4k9ETlY8Hm6GHpvOr5vqIYD0Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qguiF5n7WHZNuUdIlvovomg3lV5qRZpScrFC0EFMFbg=;
 b=oODR026f0PyVYVGkS6k4zp3qsBvCctt5X593AwuX5gw1YxpqNpYPbvWobhemSjHTsgKszv9IgtpDn1jrGmNWvOC8PcjV6K5I5jpqXSOTHQOInf7CS1XJNhNLS+tzDQeNn1/+VwprmRPFtNlfYgOEB8o7/X7eNRqok05od+IKTOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 by LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 08:15:23 +0000
Received: from PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3]) by PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3%4]) with mapi id 15.20.8857.026; Fri, 4 Jul 2025
 08:15:23 +0000
Message-ID: <fffd4dad-2cb9-4bc9-8a80-a70be687fd54@amd.com>
Date: Fri, 4 Jul 2025 13:45:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] x86/mm: Add multi-page clearing
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
 hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
 peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
 tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Language: en-US
From: Raghavendra K T <raghavendra.kt@amd.com>
In-Reply-To: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::6) To PH7PR12MB5805.namprd12.prod.outlook.com
 (2603:10b6:510:1d1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5805:EE_|LV3PR12MB9265:EE_
X-MS-Office365-Filtering-Correlation-Id: 555db7a2-5e2e-4f81-b629-08ddbad2ec3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzNwMVZVQWJPOTlGeGFkcmhzV3BlZi9kVVlCWE5DZnREcUtaMmxsTHI3OXBF?=
 =?utf-8?B?RjIxTmpkWm1yT0lEcXZ2WTJLMFdFeDdoMzBJUWhIcFZWczBSUE01dW5EN1ZW?=
 =?utf-8?B?YW1yUVpnbDJjL1pUcERlRCttV1dzM2N6RnpYRzB3ZGVhQ1NhL1ozNEZRajFI?=
 =?utf-8?B?dFVsdnd1SWJQZTB5dU4yWkhhOWYzYjFqTWtCeldzZ0pEV0lXM0toYTF2eldn?=
 =?utf-8?B?K3VGR1k2YnNleGpkZlBvOW1VRWlTVm91ZFJHblpIMVhwYjcwVU0zdlRwLzkv?=
 =?utf-8?B?dU9ZbGRHSVpTR1Vrb3JRbisrbGx2YTgvT0pGNXFlY1UxamMycXorK3AxS2xk?=
 =?utf-8?B?aTRiOHFyT3ZzZkhvdE5QMXJ4Rk9pMjBVZmVKUjQ3S0FEellDU1I4Z1VwZHd3?=
 =?utf-8?B?TjY3UWdpeGRWc2l4M2xsSEdiZ1Q4SkUra1BSNFdrSm5zM1RoOU5BSFVmUWlX?=
 =?utf-8?B?dTh2ZVJZcE9wb2lpMVgzUW55VDlOVE5PSmRXQ1RITXM3U3JLU3UrS0plSmRy?=
 =?utf-8?B?aHN4b2JsTmpHV2VPbEZ5L1FPbkdWbWxwelVqUWpOWnlwb1lxTzZTY3M1MEhl?=
 =?utf-8?B?OWU5K0VqSXVVQVNGMWVZbFphL3psOGJ5SHFINlpIWUxZQWUzdjJDMFRJZTEr?=
 =?utf-8?B?ZzlBc1QyYks0SU5VaE1qellOTGRiYTZDZERkQ0lhb2FDK2I1THFOL0ZSVTV3?=
 =?utf-8?B?VTRVWnVQVGdZTGtPNkdoQmE0cGNieWgyWmoremdGaGZieFE5cTF2TXdwVG5s?=
 =?utf-8?B?eDQxdG43akNkS2FiNjF1QlJFcHQweDhPZy9LclJ4YnJYV2FLMGhLQUIwcHZS?=
 =?utf-8?B?MmdYdFliVHdPZHdCS2E5cXBXSTVQZUNUWU82TmQ2a1JPQVVJNTVST3NKaGYv?=
 =?utf-8?B?aUJoUy94MFBPR3gyZXZsUE1LSVBnYnlzamlxTWtaUVlFSWpZeHBnQk9uZHhG?=
 =?utf-8?B?alMzUnE0S3FmYjRXd09BQ1ZCd1pxNS9GSTZuc0x6ZzNxQy96Z0ZMbVh0R2tU?=
 =?utf-8?B?Z05GYk1qcElIaG5KODQ4NTlGeUsyM3hCckJqZkl3aHpxYkgzTDR1L2ZJMi9q?=
 =?utf-8?B?YkZBOVU3VGlyU1pFTVZmZDNldk5uKzBkc2xFSkFHMVFkNjJlSVhaNU9xZXFa?=
 =?utf-8?B?ZWhoUlRTZHRDam4zandwcVlrWUpJK2k4TXJBTU9yRWxDK2IxK3crUlhIbUx6?=
 =?utf-8?B?N3pnbTlYN2RhbFA2LzBKZG0vYlhkSUFubGZBS0FOa00zOW51UVBrQTFOYUFo?=
 =?utf-8?B?SVYrR1I2WDZRV2tQNVJhb2tYNkdCc3Evano5ckU0dUpxUGxRTFhPKzlReXF3?=
 =?utf-8?B?Tndtdms2bjhLY1RSdEU1SGJ5ekdxbTM0Q1hRZ2N0dDZ1M1VlcFUvbzJkMysz?=
 =?utf-8?B?dWlHRFdOMWZlYllwMDNBY0Q0VkVVMXkrbUw1S1Y0cG5JV3M3SnFhZzNIblRN?=
 =?utf-8?B?OUF1YzM4UXJabnExRlRndEFFMkhFdVVWcmJsazNHaW5PWURKdjlQZ2V1cUM5?=
 =?utf-8?B?eW9nREloUjR6b0dnM2pMUnpMUmR6QzF0NDlyQWQvblVpdGVSL2xlMlVGa3pK?=
 =?utf-8?B?NjRMS2h1QWxJWW1uYXJvSCtuL3RJVDlkbGd4NVM3dER5RXB0S1lXOU1nR2JU?=
 =?utf-8?B?ZUxaOUUvdmRTdTJpeW9TRkl3bVh5VHlpSnlPMUc0c3lTUnUwU3hyNll2RjdH?=
 =?utf-8?B?RlpkMWZ0c21vTlR5VENBME8rYUdLdTJxTm5keUFCaUhjUUxVUXNZbVdJMzdx?=
 =?utf-8?B?bE85VUdvZWtDUmYwa2IwTTR0WWJyQ3l5dlNvY0RFVFRNajJLUkdVMEd0Mkpw?=
 =?utf-8?B?Y1Mxa0lTYk45V3ZmZEVkQmppY0JPa0JqdFJEMkVaSjNDNHl5K3V2Vzh4N2Uv?=
 =?utf-8?B?UEpwOS9zUkt1NWh0a3Z2UU1pRzhEcmRWd2d0T3U3SjRuM0VFMWppVnFGdzVw?=
 =?utf-8?Q?fe8mXg4lNQI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5805.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkpXOW94TENZekxlTWtoeit2bkdJZTBLdnQ4VXNLd2ZlRXpad3ZpWGxiNEJo?=
 =?utf-8?B?Q3IzZlAwSTZGTU5Zb091WjlEU0ZlZGE4TU9KWnZMZEZmTE8reEYrd2FVaTBw?=
 =?utf-8?B?UkpDWk03by9nYnJnZm1pa3FqNXBpUjZUam44VHBGRzRENFNtYVh1b3ZNNVho?=
 =?utf-8?B?VzRtUkN1dzZsbmpBRHlTSEVyQUFnUVlqOWFVNnFsUDVYUzVzZkVVUncwWEFu?=
 =?utf-8?B?Nkk5dEc0WHEwdCsvclBXT1I3a01OemJkTTZoK21BUEJwbXB4WFZGMG13Q3Ew?=
 =?utf-8?B?ZVhLTU9rS0lpVkJwWCsrYmpHU1VwaVBqUlNQV0dVcXJDOGY2aUl5VGRYdC9B?=
 =?utf-8?B?di9FaGZ5SmJnamFBclFzaUY2RlU1enlhbVhTMnllQmcyWGd6YlB2NUNwcks1?=
 =?utf-8?B?d3dPK1lFb05TYyt4ZmNyVDdtTWluWDRlMFpRcUwrNmZkMHVVZldwZ3pJejB1?=
 =?utf-8?B?U0t4Q3RqUSsrYXJyYjEwYzdCcHJoSFlxQmpWb2RySHd1dllnbVo2aUtSSkYx?=
 =?utf-8?B?eW9WOTdVWHA2TStEVWliY3lza25rTU9VemxhcDdKTmNlYTZZT1hNQmhqcS81?=
 =?utf-8?B?TWhjQklqK000am1MV2d4NS81WVdIWmcyWXB1c3ZqMnFKamduQ0dXNjZ1UnAx?=
 =?utf-8?B?NklRclRiL2RKUnpPaUtXT08wbjZLeFMwM2Rmci9IbENaM01LbXZTeUhmemFx?=
 =?utf-8?B?WkJQaExGRXZqZ1FwRTU0b09kRUhmYzhSYmYxUUdNUlRsdnpkR3NrQ01TaVcy?=
 =?utf-8?B?bWRneERZck5NQUJsTzJrak50VDlodzh1cTc1VHJyeHorWGl1TTFzN0QyREZJ?=
 =?utf-8?B?dnU2RGNkeTl0cVREaSs3UDVJRmtQTG1Mb3dRU1hyUXJ2anNjM0R5QUdoODkr?=
 =?utf-8?B?N3BEZ3lNbThzTjVTU2lnS3I1ZEhCeG1kWlJrMkRWNlFGUTU3TjkvZGpxUkg3?=
 =?utf-8?B?bWxDNEY3Y0ZKOTYvTmdGK096VHY5eGRDV3VCQjRKUzducXJoeWR5eG9Lamxl?=
 =?utf-8?B?ZklITTZ1djlLZm45T1B4ZFRlN1QyOXlUTmE4aHdXdDVKR2haaHE0UERUN3ZI?=
 =?utf-8?B?NWZqV3JwS0czMEFNb0phMlpQalh1RzMwaVRDZ2JLclo1b3o5ZVpvcElOcmEw?=
 =?utf-8?B?Y0FPR1doVXBNVHB3VGRYQlpZck83S2oxYm5Idjk2MVdtNU5wY1AxVWpLQXpa?=
 =?utf-8?B?MTMxZm9WcFZ0WHlwNVFSWVhyd2ZwMnRTWE5NUUVyeENWYzc0Q0lKSlRWNFk5?=
 =?utf-8?B?NWptUjcwNytOQithekliWElnd2I5R1lMTWY2b1p2UlRhSTlDS1JXVXFRRk1s?=
 =?utf-8?B?OUN6K2ZDd3NIREVJMkZXdWhBWS9uclpFaTVnSDRuRTFzazRWRWd2RnB2eWdC?=
 =?utf-8?B?RklxRE4xT2xZSXlrR1pBeU5uS1VUbEtrdGltQnMvRWNxY0hUWUV2UTlpUFpJ?=
 =?utf-8?B?S2FJR1QyWnI4SlgxVVpPMUQ3a3kwOVRmTnl1QWNWMzNLamsrYUpnTThkMUhx?=
 =?utf-8?B?STVLbUNUcVZ3MjJpVmU1L3dsNkRZU2tEd3dLeFBIZ3E0emZlZnRuaFVTM29q?=
 =?utf-8?B?TlNpWGhpaXFzYitjeS9jbUllR2xDeGNpOElQOFVtRTJWTno5MVdqWW1JZEdF?=
 =?utf-8?B?VE1xaWRwanlvRit4U0tVb3lyWGRqQVlBZ2h3VTZkbVlPa09FMDlDeU1ZME5S?=
 =?utf-8?B?VGw2OEVuNGhTSFRmdzZrU2gwcjV3MzZ0Y3M5RmRuU1FkcGMxcHVJTUhIQ1Bu?=
 =?utf-8?B?OHErc3dCczFWMXRqQmpVL21DeEVZVnR0NEJUZnhNb2QxeEpiZVR3bFNoOHdx?=
 =?utf-8?B?dnhFbmNXMUdwamZPUDJMeWdkZWl6QXpCclNnR2ErRlI2bXVjZ20wSEtDTFlm?=
 =?utf-8?B?ODZpNytNeXZIbHhSNW9raXFHY0JmSW5OdlNubGtBVUs2T1NpY1R3NGVoTTNR?=
 =?utf-8?B?OFc0UFZuODZ6cDBIUldkbXlPK0doN1JIb3pTRUxXODBJUUY5K3Q1VlJ4bzlI?=
 =?utf-8?B?WWFnY29YOGpvMlpKQ01ucmlab2hQdlpYMFYrcGoyRFR5L24vbkQ1ZFYvR09Y?=
 =?utf-8?B?K09tNXluTTRqUlpSZS9LUzVtYzUvUzBxTjdsbkJuOWJ4WVYzYXhUMlBEZmNx?=
 =?utf-8?Q?SE6fNBq/+SYV43/yKEFeqHDCZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 555db7a2-5e2e-4f81-b629-08ddbad2ec3b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5805.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 08:15:22.9481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KWNqVi4ZRHMBQrGK4SR9iRSL/qJ4QQrAuaxcxKfNyEdq+LMVO3SArM0bQj2XduI9zaCfwBBDEr20/O0uTIJcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265


On 6/16/2025 10:52 AM, Ankur Arora wrote:
> This series adds multi-page clearing for hugepages, improving on the
> current page-at-a-time approach in two ways:
> 
>   - amortizes the per-page setup cost over a larger extent
>   - when using string instructions, exposes the real region size to the
>     processor. A processor could use that as a hint to optimize based
>     on the full extent size. AMD Zen uarchs, as an example, elide
>     allocation of cachelines for regions larger than L3-size.
> 
> Demand faulting a 64GB region shows good performance improvements:
> 
>   $ perf bench mem map -p $page-size -f demand -s 64GB -l 5
> 
>                   mm/folio_zero_user    x86/folio_zero_user       change
>                    (GB/s  +- %stdev)     (GB/s  +- %stdev)
> 
>    pg-sz=2MB       11.82  +- 0.67%        16.48  +-  0.30%       + 39.4%
>    pg-sz=1GB       17.51  +- 1.19%        40.03  +-  7.26% [#]   +129.9%
> 
> [#] Only with preempt=full|lazy because cooperatively preempted models
> need regular invocations of cond_resched(). This limits the extent
> sizes that can be cleared as a unit.
> 
> Raghavendra also tested on AMD Genoa and that shows similar
> improvements [1].
> 
[...]
Sorry for coming back late on this:
It was nice to have it integrated to perf bench mem (easy to test :)).

I do see similar (almost same) improvement again with the rebased kernel
and patchset.
Tested only preempt=lazy and boost=1

base       6.16-rc4 + 1-9 patches of this series
patched =  6.16-rc4 + all patches

SUT: Genoa+ AMD EPYC 9B24

  $ perf bench mem map -p $page-size -f populate -s 64GB -l 10
                    base               patched              change
   pg-sz=2MB       12.731939 GB/sec    26.304263 GB/sec     106.6%
   pg-sz=1GB       26.232423 GB/sec    61.174836 GB/sec     133.2%

for 4kb page size there is a slight improvement (mostly a noise).

Thanks and Regards
- Raghu

