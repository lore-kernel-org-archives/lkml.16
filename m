Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2120.outbound.protection.outlook.com [40.107.94.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413972D4B5C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750705978; cv=fail; b=ZjfEj2ilTh4itGLWIel4WGAxeeNjWB4qgCU/d9W1e/ssdT17/CeOJUU6u4rXeaFE3jdNrUUpn2hsK9cTXm7sHF0FV8RgNg5oZQt1rny+vyHMqpd7d5Y8EbnN4EyWWDShI2dQO+qa9pkW6DzeNCQIsixf/YmBIMtLl5k/LFiooss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750705978; c=relaxed/simple;
	bh=3nz4HcbPtf3E0hhh32hau/BQHOqEHQFwOeJZ78B5p4o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oFgx+tLCmgPgqPPLi89lsP/UXxvTknIAhtK0Hug4typwv5G4UQJ7WZ+qy1rEEwt7YOI3ZdoHLbIuz7uV+tLtrBR5HrLNwyHz16lWESc4ztEWp2Ej6eO5xz6Z9xgh0f6Ip1KKlGftI+GO1xAlU0V9b1t5A35t5kDcVR2/j0lujVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=tdIvnjlP; arc=fail smtp.client-ip=40.107.94.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="tdIvnjlP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsswHQ0XeiwONqloNwyMlYWQijsa0GtZnqvzSGSwv7nkZPqPYWSbviX67vWZzotCCNuxmgPELfUWq79tESzWnl50m7vJKuCa4CFZDpY2O1s1HVEjFTSb0g+xS6/sBW7DLt5XCVf4pqabkWljMtPVCZIEqCjQlqaziLhfB4H9zpqRgnc2kxlIBk0dR8WhGsJS8zUNGV5zZYz+A+9WL0Q5QCVX081QNoo/h7rFyA8RUFTmmhvV6ldUQpV+XLuJDKppRDsDyCYFsHAbfC2X9QLpXSivDHe/a7YZm2BZtZIFmHpm/Qv49ziGT7E8t4SFC8hyPyW4LOMgddItijchMV3gtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mswwvT5iHdm9NcsVdKjT6FyTjG7gGwJbQYKIX6xe3mE=;
 b=e4q6r0zlQ1pK1bnf8Odanwfz8Tt0Y418FQFQmjXNCga+/dldJVAcWkw6OvSZkZhOMN6Ql/t6O49ewHUBGy8L2ClKJo3lxH79o26Dbdz8QiiPZn82dJ8OXWJLKfTvXJswc0eplq67hNUdPu7Yyh6jNYnWxhPvOESdWE9cslWFD/LGAKYtFgfH0CzzjWe5RQPzr2u1ZjAjTqvwdMuVyDzUye9B/8WdVWZzx49SjmXDANiFOwHV6Pue3KsuYBYohl9UPCb3uL7Xoiu85ldDDp4TBRYDnOmBY9GnZ5rQyxKB2/tiMi/rWBslSHSIrMlYLC0J5YUwcbi5bOtp8saqkDWQwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mswwvT5iHdm9NcsVdKjT6FyTjG7gGwJbQYKIX6xe3mE=;
 b=tdIvnjlPdwNFogMujg+MllQWxQc/pGS8UulXQY6MA2BmvCYRFC6WSFLoK0GqCRm5MaSfGOwQHnkMZS9ao8jwMqss2qX0LrV61vWOEqmh0dm4XWeFE/WBsxeBTKTdxOe0OEB/OjTI6y44cEB1mZw3U0WyDhZKsC1rU3ZAgkrQyGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 MW4PR01MB6114.prod.exchangelabs.com (2603:10b6:303:79::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21; Mon, 23 Jun 2025 19:12:53 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 19:12:52 +0000
Message-ID: <8e19c1f4-95f9-48eb-a854-0b1b6bee69f1@os.amperecomputing.com>
Date: Mon, 23 Jun 2025 12:12:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: mm: support large block mapping when
 rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
 <20250531024545.1101304-4-yang@os.amperecomputing.com>
 <f036acea-1bd1-48a7-8600-75ddd504b8db@arm.com>
 <50a4f767-0007-4f6a-8c62-398962d54029@os.amperecomputing.com>
 <ed942c01-58e8-4d91-8f86-3b3645af6940@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <ed942c01-58e8-4d91-8f86-3b3645af6940@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:a03:80::37) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|MW4PR01MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: a02ded2e-03ee-4d3c-8a24-08ddb289f3a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2tEMHlFcmVsZEhaWDFzUFkvSU1SSkxITjhGRUZIdGNqbHp5U1pjdzdwU2hh?=
 =?utf-8?B?ZTVsbUF2Q29NZzdaSVVkZURzV2hTYkNsVkVHSjNyb3JPNG16ei8yeUovb1Fo?=
 =?utf-8?B?RkdMZnpvUThFeE0xWktiU1NkNkg2aHdSZHFsWmFGSjlyWklkWnZjQnpDTEI5?=
 =?utf-8?B?UXpPNkFMTFA0cGc0L3FtSmFoL0lyd0RSTmFGaklTaTNSQkV1clpSWjRDRE5F?=
 =?utf-8?B?eFpudHh3VGc4QnF3WTlzODdyNnNaRTc3dHdQQ0UrRW9EMXplNjY5Z2tKamox?=
 =?utf-8?B?bnp5cVBwUUR3TlR6U2pKbmRGYVlSK0JIS0NnSm0yU05JN2pmTlhObWt6UWVC?=
 =?utf-8?B?dFN4czBhQk1oMXE5WGc1cTBvd2ZnQ29HU1p5bHlSWFNYbHZKbTJHbU5lRmJ3?=
 =?utf-8?B?UkV1MmRpbWVKSHpZbXFwTG9oTlNmblpCdVlvMGxDU2V6cDhYekoyNUtpTlVi?=
 =?utf-8?B?aDJ5c0NUSTEvR0hqNVRrVTdVNUpjQXE4Mi9VaE5BK0ZsbCtKQVpVdEdIK3d6?=
 =?utf-8?B?Q1Fqd3B6MVc1dEpIcmVPcWdqeFgwdHVrNERkeXhrYkRnZC9KaHAvUFVNMEhS?=
 =?utf-8?B?Um52MjdXZktHU1lyM0ZMb0U4b2l0VlE3UjNmaG5EVGFEcHZ3VElMazVvR3V3?=
 =?utf-8?B?a0Zha2dzTWNxUEZTN0hVanVSSEVaVklyMmpCYUdFUWVIRGdkOFU2SFp2L0Jw?=
 =?utf-8?B?M1NCdzhNb0owK2thRWNsMnh6LzkyY1MyYXVTSnFHd2pWUWcvdTVXcnpvc1U4?=
 =?utf-8?B?bVZKaFZOTVZDQ21mWVEyamtGRXlJUGd0M01RTS92bTdqUmwwNXo3cDFIN0l0?=
 =?utf-8?B?NkxVcldxTk9OdkNKaW5JRFNsZFhVemdYaHJjWVJzczNnUlQ3VFZHdkd6aXkr?=
 =?utf-8?B?c0hHQVFxcyt2ZHhDOENENEhNL0xyc2NhT0NZcUY3azAzenBGU2dwQk84bzJr?=
 =?utf-8?B?ekZlekVpOWxpYXhYTVJZLzBwMGhpMktHdXdMNzdoaml6MklEMndsbmRqNWdD?=
 =?utf-8?B?a2NmZkNOZ2ZCQUhjMkNhWlQ4NHdmOXFqazI0UWJwTE1rWkhCY1RNQng4OXhW?=
 =?utf-8?B?b1ZXaWk5TDhpaHhPbGJxQUY2UTh4WHo1R2JTYmw4dDJVUnF4RFZEVG5oZ0NM?=
 =?utf-8?B?NndGbllQWFV2Wnp3T3JaeFhlQkhzdEFLYUJGYnBVQ0JKeHAzNnZicEJxZ29Q?=
 =?utf-8?B?MWhodkRDajIrRm1xWUM4dGZScEplOW85RGdWek54Q2ZHYmFlc0JVcE5rR3ZM?=
 =?utf-8?B?YUpTSFZFR0JvelNkYnhVQmtsTEhJbGhRS290VC9uYWdhOEc0aGhjUXh6eDdq?=
 =?utf-8?B?TjZIdGJwWEVQVFZHdmNsYzk5cFByNkZYR3JNbHhubW5iMk93Y1l3V1cvWUtW?=
 =?utf-8?B?eWdTbFF6eHNpYkFRZ0UyUElIMlN4VGI3SzBQUldZZHBrQ3F4eHFNRDdCU2No?=
 =?utf-8?B?Tmg4cmZQczFOTWRMTFc0QVNuQzg4Wk5IMDJLRzJPZWVEVHZVaHZMSmhYWjda?=
 =?utf-8?B?U2VtK0FxZnp6azlhelFOU1JPZW9uVmxaTXlDTExlMTNLRmNBVlZ2a25abnN1?=
 =?utf-8?B?d0M0dVE3MmVGUjNYWnpaRGtXNUVWdmREdXM0VnpGV3MyNkpnQlFwUFdvRjVU?=
 =?utf-8?B?bzlBNHo0Y0NuWnArYU8wRTg1eVNIeHZZZmdQZU9wSWVtbENrMVdYanYrN2I5?=
 =?utf-8?B?d25udDVIVG1jNkEvTUNjV3BMU2E2dDJoMi9nNjFsNXc0QTIvV3hFWis0NFRp?=
 =?utf-8?B?VTdtL3A1WjQyTm5IemZQNEUzSHRZTjVmeTJVK2dqMUUzQTByaXRtUnMvcEgx?=
 =?utf-8?B?V0V5ME9ucExLYlZBWVpGeWQyMzJPajRDc2JyUHJlQVVBZDlMTlp2Y1RmNVJt?=
 =?utf-8?B?d3UyMTB1MG9VWXNITDc4K043VWEzclNiVGtuYm5CWVdRT3lWalBMSHNNMVRx?=
 =?utf-8?Q?2sgl8fllzl0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE9TYWVjN281Rlh3Z0lpa1Z1OFRITkxTbStYdXlLUnpMQ2pick5Lc3Fxb3I5?=
 =?utf-8?B?Wll2N2pQNHcyRWZOdDhIUnllbk5iNTk4Zk9laVZiOFFXVmV1VVB1dEdVRGZh?=
 =?utf-8?B?L05LNUoxemhoYWJ3YmYwUkdWdjJXTFlFY0FKQ2tPYytFUkRnK0RFbHUxemxj?=
 =?utf-8?B?WVpMNVY1Zm4rN0Q1SEhtang3MWdhc2FUR3RPR2F4dmZyeWZsVUdaamludzNX?=
 =?utf-8?B?cWFnNW5ldEUyRExPZ08ycEVITTZrN2IyclVnVzFMQ21LZzE4UzNhVVY3SzRv?=
 =?utf-8?B?UGhkQTR4MlI3S0pIanoycktjZUtPME9zTDF6V2tRMU9ROWI2UWx4cXFQZzE2?=
 =?utf-8?B?VFpqbUp5SEhjaHY1Yk5tQ1VPZ1dGSjJaRnRsTURjUTJZWlgyRVBjU2dlME5J?=
 =?utf-8?B?NmVDUDJlVU4rMmw2dzBPOVNFeFRwR0tGSkdtSW9URFBQdnVWU0J1WWxEUVNO?=
 =?utf-8?B?MDZ1aGFRZERwQTIyTzFtcnJyaU9rcVpYbWQzR2dLYXFZbThEODVxblFHNjY3?=
 =?utf-8?B?Q1Z2VDRrNUUrNEladGd5VlN5cWp1QXVseS9IU3VnQnhLd3VFbWNqU2d5bFo0?=
 =?utf-8?B?TXJ4RDR4MkppbDRNYjYzQXpabER0THQ5OTNPQWlzZktNQjQ4V0ZQQzVPQWZh?=
 =?utf-8?B?MWk5MXV4YkxmUzkzQm9TaDVRVGpDWEVZRXdMQUQ3V3NkM09SVlV3ZE1NQUxq?=
 =?utf-8?B?NmtsNGprNCtpQzFPaE1EbWp4cFczcTEvQm5nTElSUEZqd2hWUFpWdUFDNWFi?=
 =?utf-8?B?V0QweWJSb2Y4RnN4R0pKNkx5ampPL2tzempqNFhkcVJPUVdlRGhmb3V5ZE8v?=
 =?utf-8?B?YTFjMU9nYklEUzZDSTBmM0Y3RHQ2RGc1UTBWam1abUZIU29GVU1MczhoTkNT?=
 =?utf-8?B?ZitaZTY4ZHVjdkhubld2WWNTN3FWSW9JbmRWMDZ3c1NLZExUTHZHdDY4R2VD?=
 =?utf-8?B?OW9OcHozYTJXSmxidnlnTWdnbW5OcTBuYnFzT21OL1d3K3EyOVpoQ1Fpb0tz?=
 =?utf-8?B?ZWFsNml3OFU1amN1YXdkVzVjbW1uZ29Yb3FBaUVIMWpBUW9VWk1td01VbkFw?=
 =?utf-8?B?L0J1QU5udG0yOGhNYjJ1VjNJUmdaR1ZXQlZkby9QM1djRE8yM042SW9hbk1i?=
 =?utf-8?B?VFV0VU5aV2pHa0F3RWV6MUZySHpXZzVZaDNhYUx4MWtJbG43Ujd4cDY2dS8v?=
 =?utf-8?B?U1FINGVnbkJMRDRxaWN2UjJWMjdQR2pNYzE0cmgwN0YrK1IwbC93djlRTitF?=
 =?utf-8?B?WkwvYU5PQ3lxUUJJYUJiYzB0TlBQTUJxLzVFKytGempReGh3MTNqMnpiTW1U?=
 =?utf-8?B?a0RjT0U3SGNWMmF2VEhlRlFjcmdaVFF6a3RUQ0dUUm13VjNycDdWcUQ3c0xt?=
 =?utf-8?B?QjBWZjhYNVZaTXdoaFcrTU1wUEJwVFI2OThFeVNLVlE0L212Z3FqVnIwWEtq?=
 =?utf-8?B?MlhXUXNaUWRvb0hWamUvQitkREViZFFJZXhUazMxdjJBaGVuVk5Fc09KejZz?=
 =?utf-8?B?bXVid21qWG5kVThwWUI5OFVRd3hYQmhBVWlwVFFYeWVOQmR4YUptQjczOXhH?=
 =?utf-8?B?cHBFWGpVQlpkRWFWejgxTHlXcTBadEdCaTM5NW5oMlZtSVFYUW9aNlRKWVpR?=
 =?utf-8?B?cDh0OS96UFJ1OHBPNGcrYndSbFBHRU01bVR0OWg1all4SUNUL2RpN00rYzkv?=
 =?utf-8?B?Y0p1bGsyWFpnWHhEOFRmdHhFdTlacjg5SDJvYzFPUlE2d00xY281VHRpNGFn?=
 =?utf-8?B?YlFISGQ5cGk2VWZXOVV4anhVTnl5T3l3bVcrT1Z3eCt3eENMUzZqMWxmZStP?=
 =?utf-8?B?QUhNMXFOTjM4enlsQjFKSE81eDJZVUMxcGU4dFNDMWxzZXA5VnRRdmFGWFpt?=
 =?utf-8?B?ekRySXZVd0t4YzUydmpXeS93SG95bVFueHczdzA3aUVkdlVTbENBaTU3akxG?=
 =?utf-8?B?bnZnVHR6STlRd3cveEFtNk1oWWxxSEQwMzhISHR1NjF1N3N5VFE0RmdyOHJp?=
 =?utf-8?B?TmMvaFh3V1pjQkpzblNLR0VMNTg1Y3FtTjBSMEY4RXpqOWhzMHRSQTQ2bm14?=
 =?utf-8?B?bWQ0RWd6S2pWUks1WC8vc0RyR0pPVi9mN0Y1WXZUeGpGRnZjeEdUNWpXRGcy?=
 =?utf-8?B?ZzlNWkhGS05CR0xHYktMTUxUclJYMEFpWkt5bmhaWm9Dd0RvanBReExCczRx?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02ded2e-03ee-4d3c-8a24-08ddb289f3a8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 19:12:52.6226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5X0mQJhbYRuWPCUgFRzGSCgRPiDT1l4LijERMFcnlMB1VTIGVZ4MkV8jvQmlpdchVk08SqnZHYFD0zAfi5k6owp1zhs+y/cdEkygqAIp5Q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6114



On 6/23/25 6:26 AM, Ryan Roberts wrote:
> [...]
>
>>> +
>>> +int split_leaf_mapping(unsigned long addr)
>> Thanks for coming up with the code. It does help to understand your idea. Now I
>> see why you suggested "split_mapping(start); split_mapping(end);" model. It does
>> make the implementation easier because we don't need a loop anymore. But this
>> may have a couple of problems:
>>    1. We need walk the page table twice instead of once. It sounds expensive.
> Yes we need to walk twice. That may be more expensive or less expensive,
> depending on the size of the range that you are splitting. If the range is large
> then your approach loops through every leaf mapping between the start and end
> which will be more expensive than just doing 2 walks. If the range is small then
> your approach can avoid the second walk, but at the expense of all the extra
> loop overhead.

Yes, it depends on the page table layout (the more fragmented the more 
loads) and the range passed in by the callers. But AFAICT, the most 
existing callers just try to change permission on page basis. I know you 
are looking at adding more block/cont mapping support for vmalloc, but 
will the large range case dominate?

>
> My suggestion requires 5 loads (assuming the maximum of 5 levels of lookup).
> Personally I think this is probably acceptable? Perhaps we need some other
> voices here.

Doesn't it require 10 loads for both start and end together? The 5 loads 
for end may be fast since they are likely cached if they fall into the 
same PGD/P4D/PUD/PMD.

>
>
>>    2. How should we handle repainting? We need split all the page tables all the
>> way down to PTE for repainting between start and end rather than keeping block
>> mappings. This model doesn't work, right? For example, repaint a 2G block. The
>> first 1G is mapped by a PUD, the second 1G is mapped by 511 PMD and 512 PTEs.
>> split_mapping(start) will split the first 1G, but split_mapping(end) will do
>> nothing, the 511 PMDs are kept intact. In addition, I think we also prefer reuse
>> the split primitive for repainting instead of inventing another one.
> I agree my approach doesn't work for the repainting case. But I think what I'm
> trying to say is that the 2 things are different operations;
> split_leaf_mapping() is just trying to ensure that the start and end of a ragion
> are on leaf boundaries. Repainting is trying to ensure that all leaf mappings
> within a range are PTE-size. I've implemented the former and you've implemented
> that latter. Your implementation looks like meets the former's requirements
> because you are only testing it for the case where the range is 1 page. But
> actually it is splitting everything in the range to PTEs.

I can understand why you saw they are two different operations. And the 
repainting is basically one-off thing. However they share a lot of 
common logic (for example, allocate page table, populate new page table 
entries, etc) from code point of view. Repainting is just a special case 
of split (no block and cont mappings) in this perspective. If we 
implement them separately, I can see there will be a lot of duplicate 
code. I'm not sure whether this is preferred or not.

Thanks,
Yang

>
> Thanks,
> Ryan
>
>> Thanks,
>> Yang
>>
>>> +{
>>> +    pgd_t *pgdp, pgd;
>>> +    p4d_t *p4dp, p4d;
>>> +    pud_t *pudp, pud;
>>> +    pmd_t *pmdp, pmd;
>>> +    pte_t *ptep, pte;
>>> +    int ret = 0;
>>> +
>>> +    /*
>>> +     * !BBML2_NOABORT systems should not be trying to change permissions on
>>> +     * anything that is not pte-mapped in the first place. Just return early
>>> +     * and let the permission change code raise a warning if not already
>>> +     * pte-mapped.
>>> +     */
>>> +    if (!system_supports_bbml2_noabort())
>>> +        return 0;
>>> +
>>> +    /*
>>> +     * Ensure addr is at least page-aligned since this is the finest
>>> +     * granularity we can split to.
>>> +     */
>>> +    if (addr != PAGE_ALIGN(addr))
>>> +        return -EINVAL;
>>> +
>>> +    arch_enter_lazy_mmu_mode();
>>> +
>>> +    /*
>>> +     * PGD: If addr is PGD aligned then addr already describes a leaf
>>> +     * boundary. If not present then there is nothing to split.
>>> +     */
>>> +    if (ALIGN_DOWN(addr, PGDIR_SIZE) == addr)
>>> +        goto out;
>>> +    pgdp = pgd_offset_k(addr);
>>> +    pgd = pgdp_get(pgdp);
>>> +    if (!pgd_present(pgd))
>>> +        goto out;
>>> +
>>> +    /*
>>> +     * P4D: If addr is P4D aligned then addr already describes a leaf
>>> +     * boundary. If not present then there is nothing to split.
>>> +     */
>>> +    if (ALIGN_DOWN(addr, P4D_SIZE) == addr)
>>> +        goto out;
>>> +    p4dp = p4d_offset(pgdp, addr);
>>> +    p4d = p4dp_get(p4dp);
>>> +    if (!p4d_present(p4d))
>>> +        goto out;
>>> +
>>> +    /*
>>> +     * PUD: If addr is PUD aligned then addr already describes a leaf
>>> +     * boundary. If not present then there is nothing to split. Otherwise,
>>> +     * if we have a pud leaf, split to contpmd.
>>> +     */
>>> +    if (ALIGN_DOWN(addr, PUD_SIZE) == addr)
>>> +        goto out;
>>> +    pudp = pud_offset(p4dp, addr);
>>> +    pud = pudp_get(pudp);
>>> +    if (!pud_present(pud))
>>> +        goto out;
>>> +    if (pud_leaf(pud)) {
>>> +        ret = split_pud(pudp, pud);
>>> +        if (ret)
>>> +            goto out;
>>> +    }
>>> +
>>> +    /*
>>> +     * CONTPMD: If addr is CONTPMD aligned then addr already describes a
>>> +     * leaf boundary. If not present then there is nothing to split.
>>> +     * Otherwise, if we have a contpmd leaf, split to pmd.
>>> +     */
>>> +    if (ALIGN_DOWN(addr, CONT_PMD_SIZE) == addr)
>>> +        goto out;
>>> +    pmdp = pmd_offset(pudp, addr);
>>> +    pmd = pmdp_get(pmdp);
>>> +    if (!pmd_present(pmd))
>>> +        goto out;
>>> +    if (pmd_leaf(pmd)) {
>>> +        if (pmd_cont(pmd))
>>> +            split_contpmd(pmdp);
>>> +        /*
>>> +         * PMD: If addr is PMD aligned then addr already describes a
>>> +         * leaf boundary. Otherwise, split to contpte.
>>> +         */
>>> +        if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
>>> +            goto out;
>>> +        ret = split_pmd(pmdp, pmd);
>>> +        if (ret)
>>> +            goto out;
>>> +    }
>>> +
>>> +    /*
>>> +     * CONTPTE: If addr is CONTPTE aligned then addr already describes a
>>> +     * leaf boundary. If not present then there is nothing to split.
>>> +     * Otherwise, if we have a contpte leaf, split to pte.
>>> +     */
>>> +    if (ALIGN_DOWN(addr, CONT_PMD_SIZE) == addr)
>>> +        goto out;
>>> +    ptep = pte_offset_kernel(pmdp, addr);
>>> +    pte = __ptep_get(ptep);
>>> +    if (!pte_present(pte))
>>> +        goto out;
>>> +    if (pte_cont(pte))
>>> +        split_contpte(ptep);
>>> +
>>> +out:
>>> +    arch_leave_lazy_mmu_mode();
>>> +    return ret;
>>> +}
>>> ---8<---
>>>
>>> Thanks,
>>> Ryan
>>>

