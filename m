Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D211EFF8D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 03:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751342363; cv=fail; b=ORoItxtoFb9Z0/N72Nyt+hXE/BAJLAFma3KgROBKGW0JEPky+U1IabsoZxq2BF09y0zZIjIE53D5n9ZiqFzGhJIhV2yKrE2Ogd6cpH+MSpiIWTZSxu/gEyOOkDdczAD6P3xOhJ25JYwPyF96IKTKOUKnB0rGX9slDj7UdYl8UrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751342363; c=relaxed/simple;
	bh=QphqgDl5aw/wd07Qb8BlBbMQLI5cW0acGlE6zKiJP+A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ecaKnvl8ZAwB047EFkbVa5gX6hL/tXU0bxfl38XvjE3wa6cquJWOwtm1A0Q9lW/iegQbC1mHXWWpCBnhahopYqVx0WJMq4OiM6Acd5iLqpyFEHAm6yoKTLSgCJJl1WeTJabJEurloltqJV1893+u9nStbH15XdCLi7Ln7dZPrOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vTw97Q1B; arc=fail smtp.client-ip=40.107.220.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vTw97Q1B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MO9RQWaEkJoi0ZNXMCabv/THHFBCooV70MRGr1OlDdmLJp18jsy//hfWWxV/ZFWoWo6EMIcxDP8xKvg80qdGLU0blBDrJAM9S88UCegDj4YrMpae2Wbc4lo8OZEfXhTILVsphJISQC3VB6vJ0svCyPRHZz/E9rmnaEscfy5/WL8pxj+zeFwsDXPHhsvNBiZSeLkTxC48HDxTNHiaqL0jn3cRe37jRV6LjSbQstgYQ/dnACg3gyIGuWUecUzlJdgdAJSk+fpFbMUmR2WQI1Ah3EXeLtCDcur+/a+Ffduqfs1u6+QaBth2ZCxWWNDVnZiG2UTcUKlAkcZbFi1RnvqfiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/CqbCBHFEdUW1kFVRLqAdcwHKsnsWOI/oTNr4TyJkM=;
 b=f9YSDsk8IoFL3nTfuT5yGeypTM0FUuI8r47hOAoRIHw5UUcSkc+8xeQ2pFohJPZQVzU2T2FuUYCecl4hrFQBqxDe7Oa8afOMZNwOtZb0Tjfksdy0lamyZdSdeNqJ9z6K3fv3jEVHQqkFFfwr6TaVQQR2VPPd6FpHFdOkj+y8UY4/wFrcfpCXFTEytVYUY8XWzmo4WEGOO5gK75k7ZCtB/cvn9FCEIodD9HHgi0QJ5Y48m2lwK2scUuLRYYxxAgnXo7BoCDLITFIYVYjMwrk4T/ZcJxhgAF4VHAnvuZ+pUvkPqpZv2AQKKGFZEBvq0qZDgfd7LkcQ1Lsv60ZgVTFfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/CqbCBHFEdUW1kFVRLqAdcwHKsnsWOI/oTNr4TyJkM=;
 b=vTw97Q1B/fRVuKssdsvIS+Ri/7XpbKSyC4XuaQ+OftLu+McpAL/GJeSosoHDDtdZh5S+vtOO/ZqoCXV3igTHaEn7ZboaVbuhAwIvo5izrwdmEqk/hmGqNby3rEa5gA3A6qYssEV0W91hBxEJ/XbRHRCfsYa5psixD/Pz0iEjMHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by PH7PR12MB7843.namprd12.prod.outlook.com (2603:10b6:510:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 1 Jul
 2025 03:59:16 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 03:59:16 +0000
Message-ID: <30b55100-d903-471f-acf0-12bfc31b0c9a@amd.com>
Date: Tue, 1 Jul 2025 09:29:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 3/7] Sched: Tunable to specify duration of time slice
 extension
To: Prakash Sangappa <prakash.sangappa@oracle.com>,
 linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, tglx@linutronix.de, bigeasy@linutronix.de,
 vineethr@linux.ibm.com
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
 <20250701003749.50525-4-prakash.sangappa@oracle.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250701003749.50525-4-prakash.sangappa@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::16) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|PH7PR12MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: e45298be-acf3-484e-6f27-08ddb853a5c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHlGaWloblNnMFBXbDJvdlVCRWVwVnpxUUNsd20rR1ZiS2Zldm1UNlFJbnpM?=
 =?utf-8?B?d2s1bjc4SFJUcVVHYmR1VDlhNzUyZnNocmJaVHNOMkZpWUJ3QUxFK2pQaytj?=
 =?utf-8?B?blIxakZQQ2JDZ3pLUjFNYllOWkZYc0YwdWdVcVN4UVAxNEJkUDBCWFZhME5z?=
 =?utf-8?B?V1RCNC8rYytrY2diQ0dFaWIzZ21tNmNwbXNobGZxV0RJbm1rTmVMQkMyd05I?=
 =?utf-8?B?NGExLzFxRlUzMTBPcndjdzU5NmlqSDJDd2VYL0szQ0pjZ05IVGFTK3B1b1Jh?=
 =?utf-8?B?WTJpaHBiZDArb0l1am5idVkrWUFQdm4yZVd5bjdMUyt3WDUvKzUwcE5yTEh1?=
 =?utf-8?B?VnJpdm1nOUx4V29sK2swaGtwTGVLaEUrRXZzb3FydlVlYW9IUGRGWEg1ZzJ0?=
 =?utf-8?B?R0Njdys2djZMZ2UwV1hBYndndnZDZmNnZnU5cnVZQ0NjWHNvdThwbzNRRlBQ?=
 =?utf-8?B?QTR6TENiMGhPUHVKbnJCelRwRnBTWGZ2bGhSTnBFTjd1YXVxVUlOaXp6aEZy?=
 =?utf-8?B?MGFxVXZpTFhDRFVBczhBdzNIbFVsdkhkWEpvQitpbTJ6VUxsblNVcVlQSzhw?=
 =?utf-8?B?dkNyVWlyTjFBdmNLeEtJT2tHSldiNWhKcHBTaTZHTTA3b3VCRDNnK0VFdlBz?=
 =?utf-8?B?eTFpMEtqcFRoZ25RM2pwSFZtazIxYkpZSnNsMm5aSXJyY0ZrUy9IcEN0S0Fj?=
 =?utf-8?B?Q3RSQ01relFtaXI3Q2VaY0t4a0RiOTVBUVBuTUR2dG9tR2hIdFl3REp2NVYx?=
 =?utf-8?B?bkRWRmFUbnZCNGxuRlFTRllXdEoyS3ZsVEtBd3dRZ0tTd1pGcnFDcHpLYVB0?=
 =?utf-8?B?WUJMeXYxbUoycmVTUXFwRHdPZm9vb0drQ2pCMFBSSlNaN084MkJBZzZsaUdZ?=
 =?utf-8?B?aUt0bTZjN0liREFwaFVDU004eFhQd0QwbDRjTEhpSitGakhFejRYZUljS29o?=
 =?utf-8?B?TEwxdFZCTWRULzE4RTNkc3MrWHl6RHdyV0RQT25qNnhMdFBIVk5ST0Mra0Nk?=
 =?utf-8?B?MU0xenFtMjVHTmNoUlZxUzRHb3JBMUtyYXBxc2t3dmwwVzhUL2lMVHlzQWcx?=
 =?utf-8?B?Z1QrSnc1eDhaUkUwWU9DeHpQWGExaVpWVGVaWHh2T1AzVWxwT2E4K1M0QTVM?=
 =?utf-8?B?Ykx0ekN1WEYra1pyYjZoM2JPUERvU2NTRUZ1b2RVMEM5cXNqN0o4UENUZjJa?=
 =?utf-8?B?clVINDUvTk0rMDBKU1dSV1didWtINE95WlZSMmxGdEd1RkpEK1dKb2tsN2tV?=
 =?utf-8?B?Y1VvZmUwcUhGQWVrSnJVL1ptbVloNDl3QTBNdTcrU041cVFUdGFva0NoZFk1?=
 =?utf-8?B?K2tjSzNXVXUxam96d0Z1a1RRYWIwWWtyQ2h2L0NWZVFLTUxQOG1nMEs5SENz?=
 =?utf-8?B?VFl6VUNBczZsRXBmNzlEUlluTnFNU2ZuNjlFbkhDR2M4SEFHSEFXWk52VnZO?=
 =?utf-8?B?RDBKWWRKcWRhd1pIRzBScGJRMHN6LzMyM0lDUHd6clhWNEhTK2hGa0lUTUlO?=
 =?utf-8?B?L2p1RUNKckZLSzBEbGRRanpJdE4vc253eTJUcEoxZnZNdUlCdnA4OEZSOVZD?=
 =?utf-8?B?aHkwVENreVRlYjNCYXlSNlZDR1k5VzRVYVNzVWFITUwraW5VQlFyNmZjRnJl?=
 =?utf-8?B?UW5zWFowRDg1Zkljc3lJbmNGTGhkaVdKOGlzMTVaWjcyOWxZVGpjYWVhSTRW?=
 =?utf-8?B?M0hmeHhwdE45QjdOajJoemhTZER2dU9JZmM4NytYcFZnaWhjRFJXWE5IeHZ1?=
 =?utf-8?B?eURDRE94NktEWkVQUitNS2FRSWlONzJyQXRhbEpEREFHM1ZmSU11M0wxSWZO?=
 =?utf-8?B?bnNleHRuTXVEeVdLQ3dHQjAvby9obHFjdmROUy9FWTRzb1E4cWs1SmEwbkRR?=
 =?utf-8?B?ekhHUU1ETWxEaHJHWkJOYnBxUlMyUnRqTE9BVDdGa2F6UndpNDV6Tjhmd3BR?=
 =?utf-8?Q?afzOEVeZalQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDFlbnVjWXV6WGV5TElsUDd1czhsM2haTFA1UlFrL2JlcmtrMTNySm5yS3Yx?=
 =?utf-8?B?UTRxVVIzQlNBOFVZUnl0Mm9DbFFpUGFHMStLekhVTWtqSDhndkYvYno2N3l3?=
 =?utf-8?B?ZHJyQUc2dXJ2Tng3R010YnQvZmNIeUtnMnkwNFZYb3NuSzMxek04U1dvQ3ZF?=
 =?utf-8?B?MGw5Qi9nbU5vdnVDWlVud29ZUjBsUWFneHhQV2ZiSDI2VUcwRWg3QUFsdFlr?=
 =?utf-8?B?MEY1TWFDQmkyOTJqbEZ0K3VGYmVCOEl0ODIzUUlTN1daN0JWK29kU3BaeUo5?=
 =?utf-8?B?VHhPZUV3eFBraFErR2RLamgxWS9uclZaRFFyV1FCQ2huUFoyZTZScEVjcnUz?=
 =?utf-8?B?S0JyZlYwWjJBaXB1L1NYMmJWSnFaa042Vy9uSWdYeW0zWGZjVjFTMy9SR2R0?=
 =?utf-8?B?L1RpbXRNaUFoN2RWSThhaWl4eUNkWVdFbU52eFBHQlMxcW9KdDlFYmZyN28x?=
 =?utf-8?B?Qmx0RlJQWnNrUmF6dEZHekZIYUliWmx5TTl0bTlEZTNiRlJBWTBBczczb1JP?=
 =?utf-8?B?TkE4SzhKQWFDL1cxanh5enp3L2JmTW9qZUhKUjczWU5tV28vYUFmR2VBMjQr?=
 =?utf-8?B?VDRoOEZJY0dOVSt5UElGNGpEV3JZLzExRkhYbXczeFYzVnd3NENkMERBRUI5?=
 =?utf-8?B?YVJ4aTdZZzA1QVU0WkJPNlY4RmNhMlBFRG5SYVBMZ0RHV3VnbGZ0aFc4UzBn?=
 =?utf-8?B?dEhrQmJqclJHMGZCdW1NaDZqNDdMZktLbkF4N01qcVpYcDk3TDVJOGJkeHBy?=
 =?utf-8?B?dXB1WWdra3lyWWVBekVQb0NBNnFLVlhXdTFaNDlhTHZjZlFpakljS3Z5YzZ2?=
 =?utf-8?B?cER2eE9IUDVwdTd6bDZabHdaZ2VlUUx6WGlPZGo0QS83bmJvTDR6Smo4TFBu?=
 =?utf-8?B?VHhnME9hZUUzZ3NHZ0NZeWtPemxzRm5DdVRhQzYrT2pNU2Z6dVI0S0Z6bDgr?=
 =?utf-8?B?UWtuaFAxNlJEbEw4UEYvdlp4OVZRaUZtMFVDY3pkQlYzRzdka2FWbGpIUHhD?=
 =?utf-8?B?WFdyK2ZnU1BaSmZxQUFHR0ZpL01QQ041d08xNDR3UFZSTXEvYUlYTExjVWls?=
 =?utf-8?B?T0RQRHl6QkdaUWZ6L1RyZnhBdTNpeDllMExQdTRzTFkzMjZxMDRsekpwSGFj?=
 =?utf-8?B?MW9yK05UU3FPWXNBZnN4MGlwQ211ZGJxSnVCZC9MaHQxOTI5SmMxUVdFWmtt?=
 =?utf-8?B?S3dFanovREt5aTZRTllvQmgwK1k2YVZ5NGE1amhhaW1RbXErWEwxNEErUUUy?=
 =?utf-8?B?cnc0WFh0cXdXQmx2aTVnREdiaGVOODNiVnUrODErVTIxNkovMk5DcTJvZVhB?=
 =?utf-8?B?SExabzlVcDNCeVJ3aTMwbHpYQXdxRlZpRTZHSmpjOGR5ZTNKWWt2eXg2QldI?=
 =?utf-8?B?NFB6djZDeXVTZ2JUcGQ3cHlaMW4vS1RTRzNIOG5IM0oraXVCMHZKbmgzamZa?=
 =?utf-8?B?YzZmR0Zib2VGc0pyTDVYc1QvK2tiQ1VFdmE5VXZPK0R5bjdwMmN5bXkrQjdD?=
 =?utf-8?B?UlFiQ0pWM1NuUkxSeTdZaUw4a1lWY0c2TG12dk5PQVZXNzg1VVFFT0VuSGlu?=
 =?utf-8?B?dmJibGxlWTdUN1R3czUxK3g5eG9iNGdlb29nbjgzQmJ4Y0xjNmVoa20rL3ZX?=
 =?utf-8?B?YXRGSjFKNWRVS1BJYzB6VmFMZVFmUU1SeXRncXpoSC9Hc2J3QkdRSUtsM0Fl?=
 =?utf-8?B?TmdmR3E3UDBseG9sUzJrZ2hyTDlVSXJhbEhENVZ6SHgzVUhNemxzd0loSm9R?=
 =?utf-8?B?TlRqWkpJdHBIa1FYWFIyWVpvTUxPNVp6NWNEVVhhYk93a1FvYUduYXM2dk50?=
 =?utf-8?B?VFpodWpsSzZ0L1VTd0xOenZYL1hZVklFYUlMMTFqTUJkZkNOaVB5djIxeTR1?=
 =?utf-8?B?Qm9GNmNUVk1kVi93RzZmeE4zcmd3eW81QkJKaHRXckVNd2E2MEliWmN4UElN?=
 =?utf-8?B?aU5RU0U2RmxRMVhoTFE4SmR2aHpRN0hiUjlTeEc3NitjbXBsVE5NY1MwWHhP?=
 =?utf-8?B?cjlMWllOVjNmZ3FuVVYvNHN2RXRUNHdZWmttUTlMcXhTK21tQlZtQXMzSG4v?=
 =?utf-8?B?VnR0elhtNEVTbmFENHhwazI1MENSZXYyK1owVE9jVmxxb1Nna3ZNVW9yVHJ1?=
 =?utf-8?Q?5+LNDaIzENsT59q0IjOrsiwZQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45298be-acf3-484e-6f27-08ddb853a5c3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 03:59:16.3467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xnhf53y/HU57FyaTp9h09BKkaIElDoDHat0aDTq5/ZE+6SkVvz2VXovzIfeqNmiL7+XMUZgVxvSuttvL3qM/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7843

Hello Prakash,

On 7/1/2025 6:07 AM, Prakash Sangappa wrote:
> Add a tunable to specify duration of scheduler time slice extension.
> The default will be set to 30us and the max value that can be specified
> is 100us. Setting it to 0, disables scheduler time slice extension.
> 
> Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
> ---
> v5 -> v6
> - Added documentation for tunable 'sysctl_sched_preempt_delay_us'.
> ---
>   .../admin-guide/kernel-parameters.txt         |  8 ++++
>   include/linux/sched.h                         |  5 +++
>   include/uapi/linux/rseq.h                     |  5 ++-
>   kernel/rseq.c                                 |  7 +++-
>   kernel/sched/core.c                           | 40 +++++++++++++++++++
>   5 files changed, 61 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 0ee6c5314637..1e0f86cda0db 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6398,6 +6398,14 @@
>   
>   	sched_verbose	[KNL,EARLY] Enables verbose scheduler debug messages.
>   
> +	sched_preempt_delay_us=	[KNL]
> +			Scheduler preemption delay in microseconds.
> +			Allowed range is 0 to 100us. A thread can request
> +			extending its scheduler time slice on the cpu by
> +			delaying preemption. Duration of preemption delay
> +			granted is specified by this parameter. Setting it
> +			to 0 will disable this feature.
> +

Shouldn't these bits go into Documentation/admin-guide/sysctl/kernel.rst
since this is a sysctl and not a kernel parameter?

>   	schedstats=	[KNL,X86] Enable or disable scheduled statistics.
>   			Allowed values are enable and disable. This feature
>   			incurs a small amount of overhead in the scheduler

[..snip..]

> @@ -4678,6 +4689,24 @@ static int sysctl_schedstats(const struct ctl_table *table, int write, void *buf
>   #endif /* CONFIG_PROC_SYSCTL */
>   #endif /* CONFIG_SCHEDSTATS */
>   
> +#ifdef CONFIG_PROC_SYSCTL
> +#ifdef CONFIG_RSEQ
> +static int sysctl_sched_preempt_delay(const struct ctl_table *table, int write,
> +		void *buffer, size_t *lenp, loff_t *ppos)
> +{
> +	int err;
> +
> +	err = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
> +	if (err < 0)
> +		return err;
> +	if (sysctl_sched_preempt_delay_us > SCHED_PREEMPT_DELAY_DEFAULT_US)
> +		pr_warn("Sched preemption delay time set higher then default value %d us\n",

s/then/than the/

Should we print the current value too? That way, the dmesg can read how
badly the user wanted to shoot themselves in the foot if this ever goes
sideways / has unintended effects on PREEMPT_RT.

> +			SCHED_PREEMPT_DELAY_DEFAULT_US);
> +	return err;
> +}
> +#endif /* CONFIG_RSEQ */
> +#endif /* CONFIG_PROC_SYSCTL */
> +
>   #ifdef CONFIG_SYSCTL
>   static const struct ctl_table sched_core_sysctls[] = {
>   #ifdef CONFIG_SCHEDSTATS

-- 
Thanks and Regards,
Prateek

