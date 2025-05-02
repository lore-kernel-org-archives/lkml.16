Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11020139.outbound.protection.outlook.com [52.101.46.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96DC2A1AA
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 20:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746219205; cv=fail; b=uHhduxIPCha2yMP0FVljTmTH3KKuuXmoNY4sVSHWv947fUxnHBn7q7UosueJJOqdDW7fLzXMhNUTi+JljItb9DINaKqOsE8mkUaBDBjPMt+EAGNLIoXpINuNU8s5qNUIQUVxGckjZyvr/bYp8XECaOxB65jVPmsPZQiGZRCVcGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746219205; c=relaxed/simple;
	bh=9WGleyBUO/hJrcjR7Hr5QpUHgueRRcL+T9AoDot8aBg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=omYoI7/mowBmTFY9BTxLW8SmbLSyzDIpzHIVVJF0Msz5eKETJWCOBulpxJkPWwWy/AjpH35HKO4l4ICQ18PABZ5sfGj8vK9Q+ZHIeoMjhECRqh+9FFiS7VF27O98zozYnHobn4SpqsBLdlFpr3UsqPN+40rIyOAMnQw9Nz8BgWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=NXnmN7P1; arc=fail smtp.client-ip=52.101.46.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="NXnmN7P1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlKezpsJGWtFZv1X0BIGwI5VBGs7S+X1j6YqICUqCnsz3tuYnqMe/KM6KWoPoLUU6niUVfR5QdEk9eF76+vVH1ShOvq8QjcrE36fi60Ow4WCr2bGSS/Zz9G5hsjqDoIz/6lP5pE5t/Djd8g95mRjNO8+6V0rM5jOKxOmuiXL5/f3qJo7pE18O9ViCdHLOr0lm5bzENJyLt3iIAZ1QVNyWtRL90FnbZJgJrTHrCaGhNEZIBERWBIVr4y2q2bYmah70+2Iar7JvuxyODCasmzy1x/lQ5HnQH1oWrpFq1aUJBdrkiBA9uLkruUakrs8i61HQx5hnLWz/JZ/fBsByTt/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/xf+fViQ1sYUk4EF9Prh8JEK5uJG5u3QxRGi/lJkZM=;
 b=MZWoKoIud38/MJM3BCj/28rVZtl3mHE2LRDFxOVfZL9mHmMIs1KrpQ012185P6bDY9M5o5O0ACy+FPPlf7AxfFdI2dUZE+BfVeXZb1KNWEIJyrenxBha9PK9axOsHxMgVYZeBAYeA1a5yLOceTG7fq+FsNtPjzEq2zZT63fuXRZbFfuT/VjAyiNGosiyYaSBVrjNiBgUAweXAg4so5jyZ+zfUPsly1WV4hqc9arckWfbajkVsExoC6NWRH5wfiN6wxApD1PUMV7ZSfZ7oFOrAPKp7qYxkh4JdOgTO22NUKyzPc1RGzMEIh3bWSK9TWWI/PNDD69TK1qY6NS0to4dlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/xf+fViQ1sYUk4EF9Prh8JEK5uJG5u3QxRGi/lJkZM=;
 b=NXnmN7P1PLaBQPBent8sWXKl81wiTPc6CmUhT0ABgBj2xi0+Ud1H+uiwaqsjaxqtDJj1KGPNFFNlkGq3mOf3kUFO+85OnaL6ksslaffECd/q+ReWvk5aEaiWYCLj2LQ4ljJM+sZ4PUjqF+z/bWYeB0v819Mz/JzZ0DUSM2Hwasw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 DS7PR01MB7589.prod.exchangelabs.com (2603:10b6:8:70::14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.23; Fri, 2 May 2025 20:53:19 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 20:53:19 +0000
Message-ID: <60bc73b0-48b3-4529-8a73-2b85e3217e59@os.amperecomputing.com>
Date: Fri, 2 May 2025 13:53:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is
 enabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Ignacio.MorenoGonzalez@kuka.com
Cc: Liam.Howlett@oracle.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com>
 <ad1aa0fa-f1ab-4318-b423-35f59ebf0599@lucifer.local>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <ad1aa0fa-f1ab-4318-b423-35f59ebf0599@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYXPR02CA0051.namprd02.prod.outlook.com
 (2603:10b6:930:cd::23) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|DS7PR01MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ce15cf-bee3-4b86-89fd-08dd89bb5e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGVCNmVFd3owaEtzT2FmcHovd3JYVzhZV05BSy9IUFJYOGd2VmM4Zzlrb3N2?=
 =?utf-8?B?ZnA3OFZUV0taZU9kOE10OXlERDBVdG95b1Fyb0phUTYvSWtzY3JzbUsvL29T?=
 =?utf-8?B?RDR3TTFWV0xIejZuTWEzcjdOZisvS2dJU3BWYUpxL0w3eE5IVmhZcFlSQXQy?=
 =?utf-8?B?K3I5YndtalNBK3cxelVqcDlrWlc3YlgvdWl4cjJMSS9TaWRuam1INUJSWDlB?=
 =?utf-8?B?YzFUUUtQakdrTTNXeCtNMzlFd0xnQUllV2U3V3ZUdG0vc2YrNTB6RGNlR1Jv?=
 =?utf-8?B?WTQ5YW50bWxtdTFTbVRDbS9XUjIrWXBLb3dTc3RoS3lzeG9xSjh0Y0t3SC9N?=
 =?utf-8?B?eW1ya29aQnBNK2pNOXlOOHd5RzAzUWI2UmdLNE9lVXIvV1Nza2dqaWExeTR4?=
 =?utf-8?B?NzNReTZ6Y0JhOGRqUzB0c1prT3ZqS0RkcFVYUmRuUDNqYVRjTUhmNnp1Y2NC?=
 =?utf-8?B?bGdlVlBkSW4xRHZESExERExIWXluRXBScExDQTNFcHZ6WEg0ams0dDNJZG5M?=
 =?utf-8?B?ZmJhV1lteDZwU1VoVXNzdlk3WGZHMmRIaldBRm55Wlpsbm9LR3lVMVYrOGxP?=
 =?utf-8?B?cFdKaDVqYnhocFgzQVdRMm5YV3FLckhLa25yZzFaQWQvLzBiV1MxTWxPbWJI?=
 =?utf-8?B?VjNmcXFqL2N6ak1jakxsZlJXeDlKZVVha2FWRmNURllyMXpIV2ZTU0hKUGNv?=
 =?utf-8?B?SFcxV205akcwTGMwQ0gwaFFqTFNjeVg0RVYxd0xVU0NXSjdWc2F0TENXVWFQ?=
 =?utf-8?B?RTdIdTZjZE5XSCtJdTUwYWt5aVN2Z3dpMnh1ZTREQmlnTFArWWprTWxnejgy?=
 =?utf-8?B?Q3dNRjQ3MnRPbmpRSFY5cUF4NjNTOTBnR3ZjYUJTaEwzZU1iZk9SUzl1amRh?=
 =?utf-8?B?K0pBOFlwRFlsZ1dLUXZremV2aUI0d0xmQ21FZ1lCV1VHU2txTTU5NXRFclk2?=
 =?utf-8?B?TW55NFpGclB5YlNsazlnK3RFZ1FqcVBFaUN6QWR2cW9XUU1NK1JPbnBnQi92?=
 =?utf-8?B?bDVxUXk2UlVYeVhBWS9DYXVVeHNBSndGd01oZ0NoS1BXWk5UalRucWlUQm8y?=
 =?utf-8?B?bk50eUxTeFFyNEp3b2V2ZHRJd0U1dlRYc2laT29rbzBBMzVKekNHYXRiUVJL?=
 =?utf-8?B?NFhKUTBQeHVKbTNaTTZhV2NvQTF3V3lMbldLR0VEVE5IYldMc3FsUXhDZ2F1?=
 =?utf-8?B?UlVpWE8rcldUM0tESmZYQ20rRkNlSDBMZUNhaGxucEFsSzNPRlp2c0phWERC?=
 =?utf-8?B?VHNyV3lRYmtaTk1uRzhERjlKT29LTTF1Y3ZWbklNZUFObWhHMi8wVlRaRUtU?=
 =?utf-8?B?bytrOWpkbXhncWlpVGYrdFBZTVBSRWkvdmtNR0ZhejFmWEZseVhMT3BaQ3I0?=
 =?utf-8?B?cDNHbkpsWFBlOTBRY3IvaVBYVVk1NVA4dnNsUk9OU1QvZ05vYnZMTGFXQVVk?=
 =?utf-8?B?S1FoTFpkcnBWWTVlQjN5RGFrR3RnZDRBaFN4Qk9jMkxTcXY0cENOampjUkth?=
 =?utf-8?B?OHFpczJWZEZGeWIrVmVvZzltYXJUQXkvVit2Y01McEtCNmZTZ1ZWbENaUGND?=
 =?utf-8?B?MnFjbVFabUNQTDN1YU9SWnVqaWw3eEhCb1hneE1kVXVyNm8yYjV5UHNSQml0?=
 =?utf-8?B?b2kxWGRUZTF4SXRjUjc0UEVralFzUVZQMWtlcFVIOHV0Y0dXL1FYRlAzRDJ2?=
 =?utf-8?B?ZFhhdnFGR25QZnlDdmgyWGdYVjN5OW12NVY2L3VaeGVPaVRBTTBYQTN5TjM1?=
 =?utf-8?B?VDNqVldoakt2c3dTR1U5dWVCUlk0a05EMXFrcDBRWFJIYkhZSHNIYmlUNVhB?=
 =?utf-8?B?ZkRteUFwbGw1RkxBdHdUZC9SbDBIaHRnejUrOEZjUm1uUnlzZUtFQUVjNVQr?=
 =?utf-8?B?M3Flcjg0QjBaT0RCZHFwQzN2dkJRSjUyK3dOaDNGcHBzRE1Bb1Jvc2Qwc0pY?=
 =?utf-8?Q?WyMJ7bk5YvI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0xQV1NrQmx1MjRCSzRpeVczblhDemtQSGhkaGk5NUlNYVFnc1JXZjJCSWM2?=
 =?utf-8?B?TlNTSTJsOFB0TXdacmFWR05EYnFyc3E3RGFXamo0bFgxdWRkTVZVaUEyYTg3?=
 =?utf-8?B?cWE0QlZqem5xRFIrUjJKVENPbW8yNWcrRWRudDh0MWsrRi9xblhqOTVoTlRi?=
 =?utf-8?B?aGZqQVBNRUdaRDdPZlE5ZG9Dclhsb3VjdzFCWTc3am9ST09IamhXK3pjc1Z5?=
 =?utf-8?B?ZURqemJ6Tmo2R3ZJbHdYQVR4MlE4UlYya1MzZTcyRWdJMXNldDFBUVFMdlJX?=
 =?utf-8?B?b0czbUlwMkJBVExHbE5MMS9vU2FHUlhCRWJBb2JmNVpZNTRXTlY4bGV4ak40?=
 =?utf-8?B?elpOSnlGZVlIYmF1L2o1NVlwYktjRVMwK25WV05HRDJJVHlwRXU3SmNhdHNi?=
 =?utf-8?B?WmxsclUvQUs4b1VxYXVNOG9KOGQ0YkhPWXdJWUVpdnRlbjg2NE1QVzIyNHJG?=
 =?utf-8?B?dWpDWnlhUGk0NU0rZVE4Zmtyc1FVT0pSeVk3WEgzMzZKcFZiOG9PSExkM1Rn?=
 =?utf-8?B?NG1vTXNWVGFpZ3hncklLanlPY292Q0NUNVRLWHJrc0FJSmpjN3J2UlhYY0pi?=
 =?utf-8?B?MmJtQjRicWcwQlN5N2lLZEFYOFFwMm9ERTFYbmdFakx6QXl6YXRrWjRweTZV?=
 =?utf-8?B?UmxvVkZ5eGJpSEI0MXJtSDJVMjIwUE1JWkdJNnRSNnVYcXk2WEErdDhSNmdz?=
 =?utf-8?B?UlcyeFpIMW0vK1pBbXV3bDNnUWNjaSttaTdWekJkOVFGSWF0Z05CTjFWVytv?=
 =?utf-8?B?cTByVVZoRzI1dDhmMWc0UUNNQzRxNkVFcm1EeHRUeEx2aU5aMTJmSUVRQ08z?=
 =?utf-8?B?QmJ1ZDdnK1lwV1NuK2NjblRRQWwrdXZRNlB6aDdybjhuMDhhWVlXWG11TFd2?=
 =?utf-8?B?MG1aS29lY3lHU3h0Z1ZCeERQbTdieU9OYmN2bUpCK1ZSU0o0NU1CVk9QRkpz?=
 =?utf-8?B?UTl4ZU5KSnFGeFBNektvS2xLdnU0cUh6ZXVFWi9GSThEWHhqbnAxd0NOVjNF?=
 =?utf-8?B?Z0x3amZ0Y0pZMjdEdDE1VzVEeG9OMkViZU5BSHFsOGFjLzg5OU1LWVdkbmV1?=
 =?utf-8?B?RFJsdXM0cnlaOEdnaTFodFFndyszdmp6c2FiZVAzYisvMGFLcnUwZUtYKzJ2?=
 =?utf-8?B?eVVwUjBLS05VZGtXL3NBbDgreW8yQys2SnIyejVSNDNrSmQ3dHg1QnEvVEgx?=
 =?utf-8?B?TTc3b2ljVDJCTkwxY1NxOXVRU2MxTHFSUnB2UDBPVzM3V1F4TkJmM2E3OE5O?=
 =?utf-8?B?bmoxUytaR2ZtVVd5aHFlY1ZTZnBwaWJuVkM2M0k4ZEdha3hrdlVHcFhteVlx?=
 =?utf-8?B?VEFoYm9sbXlHSkUxZm42bzgvVnhFOUdVdDdneEFEdjNvSVpXbWtiS3ZuaHV5?=
 =?utf-8?B?bUVod0tVbWNnTjFHWk0yNE9PMTI5R0w3YUh2cWNTcjZpaHE2UGF3SmpJSjhB?=
 =?utf-8?B?SEFubnEvNFBjR3d0S29IV1hicEdhSUJueVFON1BxbW5TdU1xaHphc3lpSktI?=
 =?utf-8?B?MWF5WlFaZmRUSCtMY0czNXJ5MlgvS2hhSE1jK29SbjI0SE94cHh0WkJ4R1Vy?=
 =?utf-8?B?QVJSNUw1ZXNZbzFJUXRaOGplSlZXK0pkeEJSMDYxOG9QYnp3eGZ3Zm53YzB0?=
 =?utf-8?B?Mlg3c0RXSGtBQVdhdjRSZ0tRSnF1dEFEc3VxWXNCMnRWMFpyalBTY3RJQ3JD?=
 =?utf-8?B?ZUlockVJZlM1T0p4b0x0VWYzWlBXdmVnVTIzRXRQS2VEUFh3L2tiTm5wdmhY?=
 =?utf-8?B?U1VnQ3IzcXdrVjdKV1FzeFJoQWxsK0RrZURDVHo5SCtCdHljM01jaHd3d0Rv?=
 =?utf-8?B?eGpiSDg3M2NwMmwrK0hNQU5Tb1dVSnl4WklySHRVODNUU1lHNCthdEg4VGty?=
 =?utf-8?B?dGpSbVFodXVZbS9tN2M2QzlhbER3azMxVTFDYUJwa1VwTGNKamRObHlrK3lM?=
 =?utf-8?B?NjBWb3UrVm9QTHkyY0dYRkpML1pMb3pWNzR1ZTh4bnNOenpNeHhjTGZCNHpr?=
 =?utf-8?B?WHNhdTBLMGhCNFhPTUgrL0llbWJLc0VIRDRmYVYrQ3ZYTElBRVNBeTUrQno1?=
 =?utf-8?B?a2xMYS9CYXJFR3QyMHBOV0czdGZPN3plNVUrRm5nMWhSZmcxSzQ4cm8xM01i?=
 =?utf-8?B?VXk4aU01eXF2UmNzS1pERHpubUdlanFudjF6SnFlNzdJK2JYeHdmaGh2QXhw?=
 =?utf-8?Q?bpcoMHnbhvBVaHBsEsu4b08=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ce15cf-bee3-4b86-89fd-08dd89bb5e3d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 20:53:19.1146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iegqT4RtU7a6dfjpI1zDV8/2CDAAC3inZkQGUaJLIX67SJuR1rEWoICPAQB/C6xWFwwkm3EiTDaDeqtdla3dIkDmfEL+fCmG4UbMjBs/Id4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7589



On 5/2/25 5:46 AM, Lorenzo Stoakes wrote:
> +cc Andrew.
>
> Ignacio, you should always include Andrew in patch submissions to mm :)
>
> +cc Yang Shi who added this in the first place in commit c4608d1bf7c6 ("mm:
> mmap: map MAP_STACK to VM_NOHUGEPAGE").

Thanks for cc'ing me.

>
> On Fri, May 02, 2025 at 11:31:41AM +0200, Ignacio Moreno Gonzalez via B4 Relay wrote:
>> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>>
>> commit c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE") maps
>> the mmap option MAP_STACK to VM_NOHUGEPAGE. This is also done if
>> CONFIG_TRANSPARENT_HUGETABLES is not defined. But in that case, the
>> VM_NOHUGEPAGE does not make sense. For instance, when calling madvise()
>> with MADV_NOHUGEPAGE, an error is always returned.
>>
>> Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> I don't see how can this cause a problem, and it fixes one in practice, so
> LGTM. Though see note below about CRIU :)
>
> I also added a nit below, if you address this you can re-use my tag.
>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Yeah, I agree. Looks good to me too. Reviewed-by: Yang Shi 
<yang@os.amperecomputing.com>

>
> Thanks!
>
> Do we want to back port this to stable kernels? If so we should have a:
>
> Fixes: c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE")
> cc: stable@vger.kernel.org
>
> Appended here, and Greg's scripts should automagically backport, assuming
> no conflicts or such (I don't _think_ there would be...)
>
>> ---
>> I discovered this issue when trying to use the tool CRIU to checkpoint
>> and restore a container. Our running kernel is compiled without
>> CONFIG_TRANSPARENT_HUGETABLES. CRIU parses the output of
>> /proc/<pid>/smaps and saves the "nh" flag. When trying to restore the
>> container, CRIU fails to restore the "nh" mappings, since madvise()
>> MADV_NOHUGEPAGE always returns an error because
>> CONFIG_TRANSPARENT_HUGETABLES is not defined.
> Yeah this is really not a stable or valid use of the /proc/$pid/[s]maps
> interface :P CRIU is sort of a blurry line of relying on internal
> implementation details so we're kinda not obligated to prevent breakages.
>
> CRIU is kinda relying on internal implementation details so debatable as to
> whether we should be bending over backwards to support.
>
> BUT, we also don't want to cause unwanted issues if there's a simple fix
> and this seems reasonable to me.
>
>> ---
>>   include/linux/mman.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/include/linux/mman.h b/include/linux/mman.h
>> index bce214fece16b9af3791a2baaecd6063d0481938..1e83bc0e3db670b04743f5208826e87455a05325 100644
>> --- a/include/linux/mman.h
>> +++ b/include/linux/mman.h
>> @@ -155,7 +155,9 @@ calc_vm_flag_bits(struct file *file, unsigned long flags)
>>   	return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
>>   	       _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
>>   	       _calc_vm_trans(flags, MAP_SYNC,	     VM_SYNC      ) |
>> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE)
> NIT, but can we use ifdef here for consistency? Thanks.
>
>>   	       _calc_vm_trans(flags, MAP_STACK,	     VM_NOHUGEPAGE) |
>> +#endif
>>   	       arch_calc_vm_flag_bits(file, flags);
>>   }
>>
>>
>> ---
>> base-commit: fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
>> change-id: 20250428-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-ce40a1de095d
>>
>> Best regards,
>> --
>> Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>>
>>

