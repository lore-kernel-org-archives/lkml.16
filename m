Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204D9221278
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 21:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749244001; cv=fail; b=b6IR+2tPzzB2kVs9qOnmVDwGMVJvgOTKr8zmSBD+P3+uHCtUPvkQJmc4vdhu0yB52z3C44B962GnE3zxtMg5OfhTli55kt67LKneC27M28PDCCh7IBeOsr2UQY8WDBN/tQuWumXRAql61lceapTmgAUytTXilmUlNLhb6KtwJbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749244001; c=relaxed/simple;
	bh=3hFggh+EffSttVyrKvALnjQLAFblg65kv76njy17Els=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UTh3ZS/Q8HCO7eqtH0KYnNCIBwUS5H97gJoEu8C3W6jM3JPpcpjKwCkVHO1NKQjz/ybe3gBN+HxG0VU1O3EL4SA8AkSe7C6Ol+D2gTfevMtG6NDE/hkkJQ8RoSmZqW785/ncdH6xOtbk89PChMg7QKa/fg7eomk4Wodt4MGQimk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=GM9UHuQR; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="GM9UHuQR"
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556H2iat017156;
	Fri, 6 Jun 2025 14:06:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2021-q4;
	 bh=6B2k4TWy48URr8cdsCkhmedCITUkM0NmDoFBhU/0SZs=; b=GM9UHuQR1Cbk
	55KDjOGWeVqyGx+OYGqA2MySkvJyao0TRKwcwJweYFVawIyN42pCejy6BthqymYk
	Tw8Nz5C+Es2WaC23Z3/pnZB9O4qHWSuzReIeDYBkPuxRnesM8E5ViLK5EP0Q+bYs
	VcWVZj75qruSWzX4dberacBTrTijJt8GgjOUkVGHeoDatIMtF2r7aP82tI7Wp1q9
	lIjy0usPZts6N0RhkjcwFN9G5FAtXgarIQ31gb5sjXN814IIHId06m3Q4WHZ/kHI
	UoyPtZkRsHPelGSxX0GqP1GqIWcHyX4CTYypNC7wLtqtFl4bZQhS5s4ylwEbk3la
	88SXE1RR3g==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 473v64w681-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 14:06:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nydQS6ZfihCMjvIfPlZYue2LZfzt1VwCdPxSFQdrWv6eJiJkdt+jvFSwg9xEjtQhCv6s5cR2dog9bC36ww+DG7omCco3VuFuxouN3ORX77sVJJt74BLAQzsRtbY9UQH8pUZv0Yd5KhAabV2MFzXUKGGtsvh9UOi97rPmcJWB+0lxJU9HulR/9ZyOYdl5J4JWMF+YLtud8Xp2XqkPiRtszj3sNyU1bXffGNBliy1ed7QoPcIYF5RyhVl1zdmFBI07TxGCTF9lrLwNEktF/JiXgEBTUjdC+RwAYx26O5nwrylUazX840aMSiQ8rj+8RRkUlH1SV2IpxSjCtSoR66gcvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6B2k4TWy48URr8cdsCkhmedCITUkM0NmDoFBhU/0SZs=;
 b=KneOL8IqltHrEIvG1RMsUsnyDELb7Kod7U8bvzeVVVrUXGx1Riz19KMWrZbRcTW1fVhhmazabWDegF2HK4xjvLUtXfgy7/u6cSRqoBWTciv2X96+nv4LjnbNtk3fJqcrEmtOoGt/EoQ/cR7sAf0p78BihYcd3QvkCD8rthFjMWybcNVpx0/cDu5Qqjl4gJs0LkSuf+urf7wxGlxnWwVgmyYxQYFRLL6ysFtsgYiO8YQjOisu2AGYRTOiEjQCP8o1A4VZ+jzSGddUnqR+j6Fcqjt6yYvwMo1HJTRt1Rtqq5Ayv3scEGOqYKZZcAqDCZ9c9EIOGAtxBP7lImjz96GD4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by SA1PR15MB4531.namprd15.prod.outlook.com (2603:10b6:806:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Fri, 6 Jun
 2025 21:06:23 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0%7]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 21:06:23 +0000
Message-ID: <56abd1ca-fca1-4f1a-9b18-7d6275739756@meta.com>
Date: Fri, 6 Jun 2025 17:06:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
 <20250606070638.2Wk45AMk@linutronix.de>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <20250606070638.2Wk45AMk@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:c0::28) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|SA1PR15MB4531:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb6f2d2-8b1c-4680-1ea6-08dda53dfe2a
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlpiYzVFUU5WR04yWGtnNnlCeXJWYjhIMlNpUUI3eHdFT0Z1Rmk0eklNMC84?=
 =?utf-8?B?Z1F5QVJtZlhMaFc4MWZzbW8yMHQ3b20yZTJiSmt0Zi9EMHZUM1JKVHBuaFM5?=
 =?utf-8?B?RDFpMUZ0aWdPalpZSlQ4VnZTTTJoZnNiT3czZ2ZqanFBS0RlazFLeUZlYlJO?=
 =?utf-8?B?dUw4RFdZYndzSWFwL2tvaXUyM2NQcnZGWUxPWjJONlhvVzJZSGNUYmdzdEps?=
 =?utf-8?B?dTZBYWhjYXIyTktXWEI3OFdocE1YTysrTlZtVk41L0tEVndQMysxb0wwMUk2?=
 =?utf-8?B?dFZuOW90UVlXRXNDWXJMNzcyclM1UlhYTUJndGpyLy82L2lscGhYRDJGVVUw?=
 =?utf-8?B?TUtLdXdQZzYrYytXc2NoUllqdHM4N3JzMURhcDM4dVhlNzZsTk5Jc2lqd2ZF?=
 =?utf-8?B?YkdsOE5XTmF2TmZQaGZTUmxvQmRWRkNjUVFSQWVwdnEvdHdzYXRaSmFTc3hP?=
 =?utf-8?B?em9YNUowNjN2ZlNsSmxKR1ZWZmVqNm9WZ09nRkxUQWwwQURIYUorSVBiR2JS?=
 =?utf-8?B?b3Y0NWdFVWplNjVZY01uWmRjeFVMalJEMHI1MTJnQVR4RXNJcHhLNnRINlZZ?=
 =?utf-8?B?T0d6aldwVnNTaDlYYnp5MTNjQTNWZVFuaG5kSnVDeFpRakNtTjBZMk10R00w?=
 =?utf-8?B?Y1ZZRkdOTE9ndTVCQjl5S2hrM2prbDdkRkpPRWJUVXpaYkNpR25nY0lacWVD?=
 =?utf-8?B?RG8yNWNlcHNvRStNNzdkVjU3NzJTTzNQN2tCQ3QxYUhtbEFBWEJXY2R3YTEz?=
 =?utf-8?B?U2FYNEtnaFdlVnRGbWlaRmM2c1JzT2JMcnZCbW9zRWc2aC9VeUhHQUpYamE5?=
 =?utf-8?B?b0VQOE44aDM0NzdIZ3ZGUkhDVEVROFVsS1hPcVVzeVAvMlZOSGx0K3RLOFhY?=
 =?utf-8?B?Q1NyU0E4NGQ4aUlUbUtTVGJ1cnkyMmplRGNKcnBERzU1N2VRa0VxdlVaTzU0?=
 =?utf-8?B?V1Ztelc3NktQUTg3ZCtjcytxNE9JZW1FRjhnVHBKQ2ttc1BFaGEyMWJiVDhm?=
 =?utf-8?B?dEx0V2hxc2JVQWoybHIrZWhNQ3QrWmFPd3l2aFpPTWR3K0JBWEQ4Z1FjalJK?=
 =?utf-8?B?bUpONThJWWNYK0VIa1d6VEV6VklHc1ptRDdUN1pFMnNscWVjQzN2RHVUNTBq?=
 =?utf-8?B?RldqeTVOZU5sN0llcnFORUxaRjZQK0JLWUZ4dXl6UHJvempRQnZhaURUNVRa?=
 =?utf-8?B?RGtOUG5XcWg4NU12aHI5eVdWVDgvcEt4WTlSSjdyYXlrTmN0NExHc3R5Qm14?=
 =?utf-8?B?dEdVLzdtc1RoUXZRaHFoZ1hiUG91MWxpS2FuRnZtS2IzRU1sYm85UFgwRXlL?=
 =?utf-8?B?UWRSL3ZzQ2diU1owb3docnRyYjNOUEVkZXFKbHBIVmFuQmRZUWRmVEoyTnds?=
 =?utf-8?B?WHdrejUyTUk2ZVVPWHBlMnM4OEV0WGpSWG1mdm9VK0RvcXVQcnNxT0ZiQTQw?=
 =?utf-8?B?ZzZNaDYyYUhiT3Q0WVZJWmh3ZGs1UnRyYktDc2l6Zlk2LzZTa3o0KytBZmo4?=
 =?utf-8?B?bTI1TmFkSVZQZDRBK0dxZ1VhcE5GZ1pJM0RKUUw0K2FsbkkyOVFwNUY5ZDM3?=
 =?utf-8?B?VTd4V2MwVXVOTHdPVHhNNGdteTlMR3ZzTGRiYkx2YVEyRjg5WXFkRFZOM3Jk?=
 =?utf-8?B?K3JtNHp4eGFkM2lQc2pUQkh1WmRhMVRTQVZiaFZsbGpLY05TR3hxVEUwOTIv?=
 =?utf-8?B?SG95djlYSG9TQlRLak9JZ05hQVFPbUZUV3gzN1piL3FWYml5emUwS1djWG1W?=
 =?utf-8?B?ZU5hZ1dWVnQ5MCtjYmVXYk1KcGJDejdEY2JBanR2V1ZnWHJoRlRaTUNvMDZN?=
 =?utf-8?B?bzhjMUNJQ3BqOWNFQUN0T1FjZjNYWFJ2L1lyUmFKZXVoQitZSjNiQTBaK0ZK?=
 =?utf-8?B?eUs5R2JkeWZXdjNXZjVodEViYVczL0o1ci9CdUJ3VytnT0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUhhZlN5REZ0OE5ZOUU0YlpUWHBmcjdpVEJTbWpkUThrWUlmYy9DRFZWeWMv?=
 =?utf-8?B?ZWdwS3hRSUl6V0ZnVFNheWlORjFUUC9HV0VVaDNneVROdmhOdll5c1BTWXVT?=
 =?utf-8?B?RG1WWUxHNDRmaW4vUm9ZNFc2ZUtFOUg1OEZLcEtORXQxbTE2WTlGKzI5VXRX?=
 =?utf-8?B?Qk1EMzFxZ2c5UGE1VkdtS1NvTXJXazBEeEVISWU3NmQzRFRrMEhKMGJhWTVO?=
 =?utf-8?B?Zk01Z1I0Q3NWbHh3NGx4VVpDUmtXQStCT2hYUHhtMWxpejk0b2tKb3ExTVcr?=
 =?utf-8?B?dHVudlhUOUY1cVVGdFRSMkdzTkVsMjRNRkNjZTRGVkVTZ3BuKzVrOStaeWlx?=
 =?utf-8?B?UUkrdUJLb0lnSDJFV1FnUUZZbkJWcXI0SHFQUVpyTEZRUzFEYVVNMS81bmlF?=
 =?utf-8?B?Tmc3NnE0aW5zaWkvcThGdmVVclFwanFxSEdzWnBnOE1CdGg3clA0MTRzMTU1?=
 =?utf-8?B?NVBCOXZ3TUw2OFBzWDJpVnVWTHRFQm4zL3lFVGdWZzArRjcxZ0x5TEZnSmov?=
 =?utf-8?B?QkdFUkMveWxjUjBzcmQwMEZTNTVBZ2pJNjFQOW9GMVdJTHhaa2pSY3VEbjRC?=
 =?utf-8?B?Z0ZtdmJQR080TTh5Y2xmdzJQUUVLOHhpU0hxWldqbHJpM0pabFM5NnlDR0Z6?=
 =?utf-8?B?WkZFVHFZWVdQWnQwMGV3TGx5NGRneEo4Z1lHUTlVODdUT2F6WTFHTEVmdmcw?=
 =?utf-8?B?WXJxMTJSWDBUWW9RaXIzTVRmMzRlU1JDR1owdTNzT1cxU0ZVREg1V0xYR2M3?=
 =?utf-8?B?WGRzS1JVS29sekd4SExBeEVwSURnM3c2cmtiVmZqTkRpeWFFc3BnSnlMTjNV?=
 =?utf-8?B?NnltaFdyOC8vSm0zeXhSMTcrQjNsMUhTWCtjRk1Edlh6SWdDd0gydDY4MVlj?=
 =?utf-8?B?SSs2RGR1UU0xYlI2c1dHMTZaSUs5TXhtT01LQzlRVWFKbnBRTXRYOW8rRytF?=
 =?utf-8?B?S1o0bHpRaUt6dTZzaU9SSmtuVWpIRjdueUNiWGJiSFFhWDVGWnZGdE5RL2VD?=
 =?utf-8?B?enc3WTZNeFRQd1BkVXhtU0tPcnhHdUxTMXVXQk9NR3VqS1JySGJrV29wTkFU?=
 =?utf-8?B?b3lQMUlRRWpTMWhCSXFHZUpLck5YK0IvWnZwK1RJNXNGZFM4VU1kamVJZDdM?=
 =?utf-8?B?dlZDZjRQQ0pmUmFlNmpmOUpYTVk0dTJSMmk1bFlXL2V6VWxVZXAwMmpxQ1Aw?=
 =?utf-8?B?U29UQUhUcUJYTmZvM1BZMUUxUmsrUFRFMVdEZDBFa2lLS2kzTlNFZFFKU3pJ?=
 =?utf-8?B?TUpia1RFanZKQ2dPYld3RG1GRDJBaUZLMmZaYWl6N3BJN3E5QjI4R0REK3Nv?=
 =?utf-8?B?OXg5WHRvUTVra0lwRm9hRWVEN1J1Y3ovUzRQQ0VXV3BncXBjQ2RkbTFqOWRZ?=
 =?utf-8?B?QTROZnk1alhOVFZzSTJSbkwrdlllRmV1WUtudzVEZGgwQnpNK2JlSjc2TVV0?=
 =?utf-8?B?QWhRaUhyYVF2SzVZc0l2cGlxd20yeHcxR3pId2R4MkJtQUNUU0VvWHYvUlIy?=
 =?utf-8?B?S09NU3drOTRjTjI0bUZoaTJVak15TU5XYW9BVVlCcmdXN3B5SThOR2grWWR4?=
 =?utf-8?B?NDA4SE9OTkQwOWNEZ2dhL09BRFRNcWpJZTJFTFkyVDFMNTA5Nm5rUFpZN2NV?=
 =?utf-8?B?dEhJMk1RdHp2NmVPTjhLMWtGVjgrQXpWY281azRneGdTUkpwUlUvRXNoRU1E?=
 =?utf-8?B?WXZvWWkyVWRqYVBFTDVyczhaTVdkcHRvNk9ZVUxLekFqTzA2NXd5dWZMdEdp?=
 =?utf-8?B?dHpGL0cwYTV2ZEFDckkyRXFqOFg1d1VuTzY2VjNvcmNnVi9SNVlQQUZGNUgy?=
 =?utf-8?B?L1JZRkYvekJQUUNCcnR3T3BCTjVFeWZSZnpyM0ZuZTVOb2JkU3hlN0l1M3p6?=
 =?utf-8?B?eUhJTnB1VUJoaFZjcXZzU0FnV1lHeldTOFJQeDQ1VTRyZE01cHQ2WEtEMDRm?=
 =?utf-8?B?ZFQ5OVo5Y3ZaaUtOdHlUN2dpaytkeGovcm5mMGRLZ0dxRGt6aXhVL3JRZTJL?=
 =?utf-8?B?OTNTb2IyNXoyV29sOUpqakpQbTVvd3pmN2FYbE9heUpacTJBOW5adnhFMytw?=
 =?utf-8?B?dm1LcURHNTVtQTlMS1RyclAyUGQzUElyVzVxL0lreFl6Z1lvK0Vyb3l3aDdV?=
 =?utf-8?Q?rG9I=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb6f2d2-8b1c-4680-1ea6-08dda53dfe2a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 21:06:23.3168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUD648cRxoWqFhiKxrtZdEanmd36EY40MbIDPckaOvcWvBuUKFkehu2OpvPh0eKK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR15MB4531
X-Proofpoint-GUID: ESFJAkiZ4cT7cBj6sWXSjgXN5djYMMUO
X-Authority-Analysis: v=2.4 cv=LpmSymdc c=1 sm=1 tr=0 ts=68435851 cx=c_pps a=xSHfZEJOfy926U5hXMN+0g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=ymvlD-cRngMTcOS0AI0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ESFJAkiZ4cT7cBj6sWXSjgXN5djYMMUO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE3OSBTYWx0ZWRfX7ZKiPKzXcOR5 XqeNpU8KdLwCE0dySGOc1nGg7qzqMeKGfIHbEPVyvgFxYWvc3bXBKjI7Y1K9lHGNywhFc6Bw9RA Y+CJSyDTuYO3s2s785IQX6E6lxTNi1n+plXjqkBY5IjJICxRuGfcBuPtW4Ol04OZ36jvFRTvy4C
 kK4yAGYD5A4h5KdyiJTRu1Fx7hhVWNX0lJm5POrlI3HB7LJsiN4QZVbC4GfTkHMqaKUxNgqkf6x aUFqhiEtvCeWioAE0MVNu/n3fEakBv7eqxJPA4wbpA9RHP8zpNp1TFUd3YVvmztkq0qQGm31TAF S+9PuKQFUIZ0mfsSKssXa2y5UG1aNUFLcYD4dhEUGqJo05jGvCRSiw5CkhYtsJfwmvpxw7mWdt6
 79pHOAM+tJm0m54ZtkaR+I0H8sDq2C8GfE+kLDv7Ie2Eju3prYA11+mbfpR5UkizkM+epQCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_08,2025-06-05_01,2025-03-28_01

On 6/6/25 3:06 AM, Sebastian Andrzej Siewior wrote:
> On 2025-06-05 20:55:27 [-0400], Chris Mason wrote:
>>>> We've got large systems that are basically dedicated to single
>>>> workloads, and those will probably miss the larger global hash table,
>>>> regressing like schbench did.  Then we have large systems spread over
>>>> multiple big workloads that will love the private tables.
>>>>
>>>> In either case, I think growing the hash table as a multiple of thread
>>>> count instead of cpu count will probably better reflect the crazy things
>>>> multi-threaded applications do?  At any rate, I don't think we want
>>>> applications to need prctl to get back to the performance they had on
>>>> older kernels.
>>>
>>> This is only an issue if all you CPUs spend their time in the kernel
>>> using the hash buckets at the same time.
>>> This was the case in every benchmark I've seen so far. Your thing might
>>> be closer to an actual workload.
>>>
>>
>> I didn't spend a ton of time looking at the perf profiles of the slower
>> kernel, was the bottleneck in the hash chain length or in contention for
>> the buckets?
> 
> Every futex operation does a rcuref_get() (which is an atomic inc) on
> the private hash. This is before anything else happens. If you have two
> threads, on two CPUs, which simultaneously do a futex() operation then
> both do this rcuref_get(). That atomic inc ensures that the cacheline
> bounces from one CPU to the other. On the exit of the syscall there is a
> matching rcuref_put().
> 
>>>> For people that want to avoid that memory overhead, I'm assuming they
>>>> want the CONFIG_FUTEX_PRIVATE_HASH off, so the Kconfig help text should
>>>> make that more clear.
>>>>
>>>>> Then there the possibility of 
>>> …
>>>>> 256 cores, 2xNUMA:
>>>>> | average rps: 1 701 947.02 Futex HBs: 0 immutable: 1
>>>>> | average rps:   785 446.07 Futex HBs: 1024 immutable: 0
>>>>> | average rps: 1 586 755.62 Futex HBs: 1024 immutable: 1> | average
>>>> rps:   736 769.77 Futex HBs: 2048 immutable: 0
>>>>> | average rps: 1 555 182.52 Futex HBs: 2048 immutable: 1
>>>>
>>>>
>>>> How long are these runs?  That's a huge benefit from being immutable
>>>> (1.5M vs 736K?) but the hash table churn should be confined to early in
>>>> the schbench run right?
>>>
>>> I think 30 secs or so. I used your command line. 
>>
>> Ah ok, my command line is 60 seconds.  It feels like something is
>> strange for the immutable flag to make it that much faster?  schbench
>> starts all the threads up front, so it should hit steady state pretty
>> quickly.  More on NUMA below, but I'll benchmark with the immutable flag
>> on the turin box in the morning to see if it is the extra atomics.
> 
> That immutable flag makes this rcuref_get()/ put() go away. The price is
> that you can't change the size of the private hash anymore. So if your
> workload works best with a hash size of X and you don't intend to change
> it during the runtime of the program, set the immutable flag.

ok, for the benchmarks, I hard coded the number of buckets at 1024 and
the only thing I flipped was the immutable flag.  I was running on top
of c0c9379f235df33a12ceae94370ad80c5278324d (just today's Linus).

schbench -L -m 4 -M auto -t 256 -n 0 -r 60 -s 0

1024 bucket without immutable:

RPS 2 297 856

1024 with immutable:

RPS 3 665 920

This is pretty similar to what 6.15 obtains, so I'm hoping we can find a
way to get the 6.15 performance levels without the applications needing
to call prctl manually.

I took some profiles on the 1024 + non-immutable

    16.92%  schbench         [kernel.kallsyms]  [k] futex_hash_put
            |
            |--8.93%--fpost
            |
            |--6.99%--xlist_wake_all
            |
             --0.58%--entry_SYSCALL_64
                       syscall

    13.27%  schbench         libc.so.6          [.] syscall
            |
            |--8.90%--xlist_wake_all
            |
             --3.98%--entry_SYSCALL_64
                       syscall

    12.36%  schbench         [kernel.kallsyms]  [k] entry_SYSCALL_64
            |
            |--11.04%--__futex_hash
            |          futex_hash
            |          futex_wake
            |          do_futex
            |          __x64_sys_futex
            |          do_syscall_64
            |          entry_SYSCALL_64_after_hwframe
            |          syscall
            |
             --1.23%--futex_hash
                       futex_wake
                       do_futex
                       __x64_sys_futex
                       do_syscall_64
                       entry_SYSCALL_64_after_hwframe
                       syscall

Percent │    0xffffffff813f2f80 <futex_hash_put>:
   0.05 │    → callq __fentry__
   0.06 │      pushq %rbx
   0.08 │      movq  0x18(%rdi),%rbx
   0.05 │      testq %rbx,%rbx
   0.03 │    ↓ je    15
  12.49 │      cmpb  $0x0,0x21(%rbx)
  12.58 │    ↓ je    17
        │15:   popq  %rbx
        │    ← retq
   0.24 │17:   movl  $0xffffffff,%esi
  12.76 │      lock
        │      xaddl %esi,(%rbx)
   7.80 │   ┌──subl  $0x1,%esi
  22.96 │   ├──js    27
  23.05 │   │  popq  %rbx
   7.85 │   │← retq
        │27:└─→movq  %rbx,%rdi
        │    → callq rcuref_put_slowpath
        │      testb %al,%al
        │    ↑ je    15
        │      movq  0x18(%rbx),%rdi
        │      popq  %rbx
        │    → jmp   wake_up_var

If you like profiles with line numbers:
12830 samples (10.24%) Comms: schbench
                 futex_hash_put @ /root/linux-6.15/kernel/futex/core.c:179:2
                  futex_private_hash_put @ /root/linux-6.15/kernel/futex/core.c:148:6 [inlined]
                  futex_private_hash_put @ /root/linux-6.15/kernel/futex/core.c:153:6 [inlined]
                  rcuref_put @ /root/linux-6.15/./include/linux/rcuref.h:173:13 [inlined]
                  __rcuref_put @ /root/linux-6.15/./include/linux/rcuref.h:110:5 [inlined]
                 futex_wake @ /root/linux-6.15/kernel/futex/waitwake.c:200:1
                 do_futex @ /root/linux-6.15/kernel/futex/syscalls.c:107:10
                 __x64_sys_futex @ /root/linux-6.15/kernel/futex/syscalls.c:160:1
                  __se_sys_futex @ /root/linux-6.15/kernel/futex/syscalls.c:160:1 [inlined]
                  __do_sys_futex @ /root/linux-6.15/kernel/futex/syscalls.c:179:9 [inlined]
                 do_syscall_64 @ /root/linux-6.15/arch/x86/entry/syscall_64.c:94:7
                  do_syscall_x64 @ /root/linux-6.15/arch/x86/entry/syscall_64.c:63:12 [inlined]
                 entry_SYSCALL_64_after_hwframe
13795 samples (11.01%) Comms: schbench
                 futex_hash @ /root/linux-6.15/kernel/futex/core.c:311:15
                  futex_private_hash_get @ /root/linux-6.15/kernel/futex/core.c:143:5 [inlined]
                 futex_wake @ /root/linux-6.15/kernel/futex/waitwake.c:172:2
                  class_hb_constructor @ /root/linux-6.15/kernel/futex/futex.h:242:1 [inlined]
                 do_futex @ /root/linux-6.15/kernel/futex/syscalls.c:107:10
                 __x64_sys_futex @ /root/linux-6.15/kernel/futex/syscalls.c:160:1
                  __se_sys_futex @ /root/linux-6.15/kernel/futex/syscalls.c:160:1 [inlined]
                  __do_sys_futex @ /root/linux-6.15/kernel/futex/syscalls.c:179:9 [inlined]
                 do_syscall_64 @ /root/linux-6.15/arch/x86/entry/syscall_64.c:94:7
                  do_syscall_x64 @ /root/linux-6.15/arch/x86/entry/syscall_64.c:63:12 [inlined]
                 entry_SYSCALL_64_after_hwframe
14364 samples (11.46%) Comms: schbench
                 entry_SYSCALL_64
17612 samples (14.05%) Comms: schbench
                 futex_hash @ /root/linux-6.15/kernel/futex/core.c:311:15
                  futex_private_hash_get @ /root/linux-6.15/kernel/futex/core.c:145:9 [inlined]
                  rcuref_get @ /root/linux-6.15/./include/linux/rcuref.h:87:5 [inlined]
                 futex_wake @ /root/linux-6.15/kernel/futex/waitwake.c:172:2
                  class_hb_constructor @ /root/linux-6.15/kernel/futex/futex.h:242:1 [inlined]
                 do_futex @ /root/linux-6.15/kernel/futex/syscalls.c:107:10
                 __x64_sys_futex @ /root/linux-6.15/kernel/futex/syscalls.c:160:1
                  __se_sys_futex @ /root/linux-6.15/kernel/futex/syscalls.c:160:1 [inlined]
                  __do_sys_futex @ /root/linux-6.15/kernel/futex/syscalls.c:179:9 [inlined]
                 do_syscall_64 @ /root/linux-6.15/arch/x86/entry/syscall_64.c:94:7
                  do_syscall_x64 @ /root/linux-6.15/arch/x86/entry/syscall_64.c:63:12 [inlined]
                 entry_SYSCALL_64_after_hwframe

With immutable, futexes are not in the top 10.

-chris
