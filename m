Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0091D90DF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298015; cv=fail; b=UV1iDRc6ytfM2/xOXt8Z5K2ztbywjsAvvdCaOMGRUYhY5Eyciw4XIT3/6aMEG4Zg6JYXTtpULoB5N7nMfxUWsBhuC+xQQMjv9rihqbzn4tv3RGCDRFumr7JFkf8PG0dsz3eYR0CeRQJmvR90uja/mQydS5xlhA1vwp0S4TmZnsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298015; c=relaxed/simple;
	bh=sjXV9ZP8CnjlZDct06tduG9BvmOSUIMYPosV3R/sXrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rmQWzNEkh06wAzAvDloIhlPQ8v8XfXsu78StuUZbMhc4sPAztDXLxYKOpb5FuAVLPFvzHXea+jwKfrZ2Mp9JWnLKfiWb3T2BVynQv6SUkxxbW28v3jYr3Ohue3+EJqF5Q92+kFPVYLPscLRxNWZ2rikqeRqNnhO6ZQJIMbQf+fY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kKdgkXAf; arc=fail smtp.client-ip=40.107.223.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kKdgkXAf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHzgALNXEm3s/0FfsjMOStkazlC5rNfB+Vto+ABhVPARn6fFnrjfXWQGrI8LT7X39gJyjTJreng/w+k6oVs2XxxDslEUw/Hm0k7dmQUnas2F12wfk85k62r6bMc7CNTCm46nVcfGAP2jSiUyjkqOPy/qerTAG7clfDmmeKQHZS18rA3+clR9ngMkbTsAnuXSYqppjB/D5BuC3pEjpF363Wr2He4MxJSAgdEur/ELndugW+/O8kdrqJ9D9aSm1ovSB51rwdVQ2Em6uZNL3ztFNySoZNlAuluSAs0+iOAIk7r/kzBUP05rtQ7bbOl1erbgehoYPxQhmW8ez/7nvARIfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnPcZmi9S7fkZmic0b2+3dniYAxupr/u/KOOUC7gyUo=;
 b=PSvBdNrfurNsVZDI8D5n0FIxXH2XsO4DOlI0600n1WyrrwVoMLhM8rcZGkzywxY3z9qCptXeTYYSHHGvXbq0R2Hr9l33L/bNe7ihqWeoPv8Q6HXcumAXLN7is/ubobhOuqeClKTD2VEBzXdKC7Jw4UQR7uA8T4A5ENiUhVXgsOcTMiDIz8Fl6APGKh0h6JRtTV9TJQW3Ug5jHBzT7uL4tMif73uXRChQmE8a1o8ZedUcGNLH669XzXQKQnAqKMcbyQm/wbKDVqW8udtiXimYq4EPA+IWTrr87tb+WFsB2WmETPQUxyNAxKWD3yQMDlSiExFF0AFV8F6vKEQ9MUMHWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnPcZmi9S7fkZmic0b2+3dniYAxupr/u/KOOUC7gyUo=;
 b=kKdgkXAfcyHHfJWh9gMOW/E2ZIrdrgoPBasM8w8/BvUhf4WaTN5y2CFA4JMf+U6SC1260yqdOOity6vPY4B8jPpUwC87fVEa7DduO7TYD0rx0ZqzzdFiLtBCtGz6btgmusa5zE+ypnUZFfgybnNe0Qd6MRstEamI1oLqCvIkud6GEOKpkaFNHytD/9wTEkJTKh4tPoTx05cO2lrpBC5Hh63AAi/a3wHY9PTcAPfEVl62H5jCiJlMQG2yjzPdQLS2kwX8UTeRpbuAGSzvgK1dFCaBe5vC6siSfbKkcVfGqguNYxupJolcwuw1SLn+lOKQZ6bvn3pMmTciKX3wB1hBug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB7773.namprd12.prod.outlook.com (2603:10b6:208:431::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 15:13:30 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 15:13:30 +0000
From: Zi Yan <ziy@nvidia.com>
To: Barry Song <21cnbao@gmail.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 willy@infradead.org, david@redhat.com, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
Date: Thu, 10 Apr 2025 11:13:28 -0400
X-Mailer: MailMate (2.0r6241)
Message-ID: <1E123113-7A0B-4D3A-AC7A-01767D7BF2D8@nvidia.com>
In-Reply-To: <CAGsJ_4yPxoF5P87WdXbXVb8BqovVvxhKg40YVddkEQmFjFsRYw@mail.gmail.com>
References: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4wnvWmOz-FNvYzkqEW1kz0UCfzythbeJSbSyWy_=ib5MA@mail.gmail.com>
 <5c52b67a-8e7e-4dd7-9127-96944715d883@linux.alibaba.com>
 <CAGsJ_4yPxoF5P87WdXbXVb8BqovVvxhKg40YVddkEQmFjFsRYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::16) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 8902234c-8f4a-41d6-c347-08dd784240af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUJ4cXJjeHhNWndRQlcwZURoclRRVXYrZ1pmVzdaMVRQOTUwVkNOcVB0TytC?=
 =?utf-8?B?ck9KTjBjblR5ejJXeS9WVGxpeHdBU3RCTHBGQWZOVEo0UXhsbU5WdzN5NFdu?=
 =?utf-8?B?cUNtdDZZWDRvTElmSXN0UjlIOEZCTDdweXVsdVpERkx3S29XTUF0M09yUzFP?=
 =?utf-8?B?M2sydjduSzhiOFM0UWpNbHRJcUFRTmVnMUk1RmVydlh3dURvanhGcEg2U2xy?=
 =?utf-8?B?a01ORFNKYWVNNGoxdUI3Wk1xN2pRdmpadUJJYVNRa0kyaitNOTdlWWJyTkty?=
 =?utf-8?B?SFVXNTdnRFh1Q3RsRU9iMGtRTDExYzVSaFYra2pEczEvUWIyczQ5K2pMUjlq?=
 =?utf-8?B?dE5lWis4UjFkSldxM0sxL3FzZXRHTGErQS9tUE9JVmNLUS9oOWNuWlJGR3Fy?=
 =?utf-8?B?MmVsUWU4aE85UUFZVE1OM09wV0E5R2dLSHp5K2E3VmpCRDZqWThzOFY0RlFN?=
 =?utf-8?B?OE93SVc5cTFKSHlvRXVmMVgrUnladzNIT1p3M1pIalRocnk0Tkx5Wk5SZmo0?=
 =?utf-8?B?Q0Q1VUlqdXc0NjZVSjZaU250TVlCME00WDhoK1lCcC8rRlZIczhUTVVWMFBS?=
 =?utf-8?B?OCt0UFlnbTMrd1dXTWJsbHQzcFpZSTcwdmNlNGtTQ3ZCWjJSOUo4dWlWaTQ2?=
 =?utf-8?B?TkhvSUVDaUNka21TVXF0VGxqRnkwbXJmR2c5L2RtVlNDR25CSFNsVUttZUJP?=
 =?utf-8?B?SEptdkQ2V0Fzdm1SMzk0OXp3ZDdxNTVMcmJJM0VZcXNRK2FWWmI0cW9qY0JP?=
 =?utf-8?B?Q21WUHVzTU94QmVVZE5qYTJQaEZzK1RiakwyVjMzZUN5VXA5MytXSlllTm1M?=
 =?utf-8?B?ZGQvUFRKRmdwbU1lMzM1RCtiQ3JJWTBSLzZoRGJNdHIyMXhqSmVnZnVYTVBJ?=
 =?utf-8?B?dGhJbThCRDE0RWpLWUpQam1oUnkxbUhNSzBnT1k0b0xXRGwvUk03MXZjUzcz?=
 =?utf-8?B?U01qWlFRK2prc1EvcUJleW56elZ5Um04MDB5QnJWOTdEODM5RFZ1R0VraUQ3?=
 =?utf-8?B?ZGcwenVXMm9KYlNCaEpuMHVmT2tPaGRGMDZQRFJHcDNDekFLS05hY1ZwY0lT?=
 =?utf-8?B?czBnTVowRmZFQjM5NXYzcW8wRUxJYzluTDJmdTJ0Sk9VU3kxVjlJS3ZTSEhi?=
 =?utf-8?B?RW01bkhHcTIxR1RyQzdOc1cybnE0d3NMbmlyLytEZFl1Z2FEa0VWVkJhZEdK?=
 =?utf-8?B?Z01pUDZEWTJ5U1pqcEFRdDh0RXRSclhNSHBsWk9kUUFTYVhBVTEyd2tWY0hq?=
 =?utf-8?B?dFVhVXB2SVJzalgyNDN1SysvSkdmSnhzbzNobTNVeW9NcmlyVWNZRFRrODNV?=
 =?utf-8?B?QTl0NmNpeVFaOGRiUlY3dS8yOWduS24ySmdkN0NqY2xhbyt4d1BqTVI2a2g3?=
 =?utf-8?B?MXZodkVhSm5KaTlFK1k4TkNicUUzZUlWamptU3RnMjBnNWVWY1pBSXg0MTVt?=
 =?utf-8?B?RFk0YmRmQjgvMExva3VqZEhUeDE0VW50U3pYZ3ZrVnorTWFVR0dvSlJWdlEw?=
 =?utf-8?B?bkx1cS93N1Uxa0xuWk9FKzExZVhXUUg0cDViNFEzVDNkNkoxeEhSZjBxZnJD?=
 =?utf-8?B?VUk3VC9XUTRiV1NsZHpZMDJNZEI1OVlCNUpKZEVGVTE3YjlQUFUrdEhsYnNu?=
 =?utf-8?B?RFQ3RlhuRS9CbDdHV0ZkTnQzd2k1MGpiNnRuaWZPY05CVFF3OWc3aW5KTS81?=
 =?utf-8?B?RjNibXRQbVpJckczdklGMEpLRUQ5cFV2cXV6VCtMQ2dheEtvdWk2RlhBTjdu?=
 =?utf-8?B?T1ZVNm40OG85RlRiUGs0aElMTDRGMm5lSGt0NHZwNWtlUG1VL1E3YzE1N1ly?=
 =?utf-8?B?MjlFRmxoMmFnd3U5N0o2WDB2TlZSc0xKR2g4bDlnZjFJU01lcy92Sm1KRk5u?=
 =?utf-8?B?UFNjM212YXY0d0hNU3NNRmhJL3FHeGNoQ0kyenNrZVdxdVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXlCbGtib2xPSjhPa1pBRW1YWnhHRzhidmhNajRFU2VFUktNYk50SHBmSVdG?=
 =?utf-8?B?cG42QURYTVBPMEVrQTlPRDJEckFqZ1QxT25lWUQ5cHd4YlZMOGEzUTlMRUhr?=
 =?utf-8?B?WFU2dVIzRHk4d3RCSVhUTGFvbDZzSEw3Ylg3ZTZzbWdYdEpleFcydXpqbnls?=
 =?utf-8?B?ZFIxUzlJM3RJYWNIVWJKK3VTeXJjRnlwL2RtUUtTeDZxeVlFL1Jid0JESHVp?=
 =?utf-8?B?NTVOODhWcTZ3eXBwR0tTeE82c0cvZ3NoaDRSbHVOcGRtOWtwOUZmTTdVV1Zs?=
 =?utf-8?B?UG5lWHJkVTllQkl0bW1lbWVrMkVtVXIrSE05WTYvMG5wUmVYbDFLVFBrRmdD?=
 =?utf-8?B?UmtvQWoyd1IyL2pHOFEvYlhUYWt0RnFsWXpxdy9OWURQR001NzJqejRXNWRu?=
 =?utf-8?B?UVZ0Y2duQjkyTFVPZk9kYWdIa3NEc2xYQ1VwN1hBTkxhci9GZTNHSnh5cy80?=
 =?utf-8?B?QzFvdVlxbjEwVklUeTkvWkI4QXRLa3hjbS9NMXlmQktPMzdubXVtbFR3UXF3?=
 =?utf-8?B?RXBCbmtidFZPejFUSTJINzN6WjNuRVFZWEw3WTlSdFp1aWd6eG03MUh2NkhZ?=
 =?utf-8?B?eUt6azBISGVEbkdOMXEwakdwdzBUYmNvbzFJRWViNXRnb3h2VEg1RTB3Kys5?=
 =?utf-8?B?QnBXT1UyWHVzOWNVWlMvWVo2THJHRC9KU0greis2MStMbWFFUEI4RzBEM0VT?=
 =?utf-8?B?azBPQ3c2djU0ZUhwN2lOSEtlYW9EVjZBZGJGaGp3bFIzN2Y2M2kzdDJoK3RW?=
 =?utf-8?B?eFZsaHB6NjExbmdvUGZqMDllSUhJLzlVTmttRUp1VzdnRFdzSFNuZFU3YWxp?=
 =?utf-8?B?MVVucFAyYUpHbk1XQlpaZTVaU2IxcnQxY1Z1ZE55R0RxL3N3NnRLaHNlVGg1?=
 =?utf-8?B?ZStNdkt6TDQrdHFSQ0x6THpNcUtDYnJ0Y2QzL1F1MTNMaTN6OVdaZHdNWVRi?=
 =?utf-8?B?VmJITXJ5VWtPMXpPTGVyUE1xc0dlTWJaK2xSdEp2Zkt2M21XT0dhRUsyM051?=
 =?utf-8?B?MTJzZnFBbTZyOHoremxWU04wV2ppODU5ZkpiRUJlUHZqaWw3Z2pmYzhaNEFq?=
 =?utf-8?B?d3ZJdTl3YjVieTBkM3JDLzFQUjBTakFEVDV3NmxEeW9MSjhIWGV1MEVMN1g5?=
 =?utf-8?B?aGlxVGhxekVEVFRiQm1FdUZUT2Rib2xyLzhpWnZsWlJsMlFRVjNacVp4T2g2?=
 =?utf-8?B?eS9LaThUZUM1MXdYR3BJY2xPTzRoZXY0bU5lSHhkek9QcFZmTmJZMnByd0li?=
 =?utf-8?B?UlBYL3B6MHlIZnJNUFBRWW51aEZTSHJveVcvS01MOE1vNVFVOUlTNW9GcFpn?=
 =?utf-8?B?dmFpdldHdUtPS01mSlQ0eXQ5UkhhSmNLNTErWUpXamtOS0hvbGtyTzlTdHJ2?=
 =?utf-8?B?VXgwWUt0SlFaK2xtVjNFS2QwckZBckJxeWFNZjNmaUVpSHFsZEZGUzVaS2Fl?=
 =?utf-8?B?MXJxRkR3MmxZRkpjVUlRZk0zTGZMZVBMZGlucjRjN1FKRUlKODhMaHN5RzFu?=
 =?utf-8?B?RUZQSHk0YXRGdDZ3bGoxeWdKbG5seVFPVzNDMGI4a3Fxc2pqVTd3Q0R6SmtO?=
 =?utf-8?B?a1QxWnVobWJTSnlYd3hlbGcrbXh4clF3TU1XNElLQVgvaHp1YW9BbnRraEV4?=
 =?utf-8?B?cGRLaVlSbnEzSllINERhaFpjQ0twS1M3elZ6aHhMV2t2TExibFN5RjNMRDlq?=
 =?utf-8?B?b2lBdFV2WHp6WGMvWFlma2hyaVcvMFV0Q1M1aDZMZElMN2Z4MHBjT0ppakU5?=
 =?utf-8?B?dmhDcFdCWVU2WjlHK2MzZUdpeFo0RkNqb3RCSWZiQzZlaW5leGJzZkJnK1Ey?=
 =?utf-8?B?VHJOMnV3azFFZ01nRTVxQi9TTExGdW42UlkyaG9BUldvR0tTUkhFVVJKWloz?=
 =?utf-8?B?R1RJdGhoRlBNc1FCQlk5bGF3aERqemFrcElSMUlrR1ExZWxJWi9HTnh2Ymsx?=
 =?utf-8?B?WGlObEpDWjRnajF0VGV5MzZJRkJuaFlYUitwaVZXMU9QUlN6ZGhoc2tKS2h0?=
 =?utf-8?B?SDh1eGF3N1dtREdQY2RJakkvR3ZOK3RYSk90UkxmRDQrdXg4UXRZNGRoS1ZC?=
 =?utf-8?B?WFU2SHJ4eXNqY25QdWloWGk2dUZoQ2tVMEVrWXRCV2NhQ3VDS2lmMG1WZTda?=
 =?utf-8?Q?ThUcOCUpAsBo598w3JKFjZCt7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8902234c-8f4a-41d6-c347-08dd784240af
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:13:30.6755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ulhIU18d3XqfK+JNwqjCoYsCApI+GEjp45REkltGSeOPG1RiQPVoQKgmRcKloZH8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7773

On 10 Apr 2025, at 6:29, Barry Song wrote:

> On Thu, Apr 10, 2025 at 9:05=E2=80=AFPM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>>
>>
>> On 2025/4/10 16:14, Barry Song wrote:
>>> On Wed, Apr 9, 2025 at 1:16=E2=80=AFAM Baolin Wang
>>> <baolin.wang@linux.alibaba.com> wrote:
>>>>
>>>> When investigating performance issues during file folio unmap, I notic=
ed some
>>>> behavioral differences in handling non-PMD-sized folios and PMD-sized =
folios.
>>>> For non-PMD-sized file folios, it will call folio_mark_accessed() to m=
ark the
>>>> folio as having seen activity, but this is not done for PMD-sized foli=
os.
>>>>
>>>> This might not cause obvious issues, but a potential problem could be =
that,
>>>> it might lead to more frequent refaults of PMD-sized file folios under=
 memory
>>>> pressure. Therefore, I am unsure whether the folio_mark_accessed() sho=
uld be
>>>> added for PMD-sized file folios?
>>>>
>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> ---
>>>>   mm/huge_memory.c | 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>> index 6ac6d468af0d..b3ade7ac5bbf 100644
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct=
 vm_area_struct *vma,
>>>>                                  zap_deposited_table(tlb->mm, pmd);
>>>>                          add_mm_counter(tlb->mm, mm_counter_file(folio=
),
>>>>                                         -HPAGE_PMD_NR);
>>>> +
>>>> +                       if (flush_needed && pmd_young(orig_pmd) &&
>>>> +                           likely(vma_has_recency(vma)))
>>>> +                               folio_mark_accessed(folio);
>>>
>>> Acked-by: Barry Song <baohua@kernel.org>
>>
>> Thanks.
>>
>>> I also came across an interesting observation: on a memory-limited syst=
em,
>>> demoting unmapped file folios in the LRU=E2=80=94specifically when thei=
r mapcount
>>> drops from 1 to 0=E2=80=94can actually improve performance.
>>
>> These file folios are used only once? Can folio_set_dropbehind() be used
>> to optimize it, which can avoid the LRU activity movement in
>> folio_mark_accessed()?
>
> For instance, when a process, such as a game, just exits, it can be expec=
ted
> that it won't be used again in the near future. As a result, demoting
> its previously
> unmapped file pages can improve performance.

Is it possible to mark the dying VMAs either VM_SEQ_READ or VM_RAND_READ
so that folio_mark_accessed() will be skipped? Or a new vm_flag?
Will it work?

>
> Of course, for file folios mapped by multiple processes, such as
> common .so files,
> it's a different story. Typically, their mapcounts are always high.

Text VMAs should not be marked.

>
>>
>>> If others have observed the same behavior, we might not need to mark th=
em
>>> as accessed in that scenario.
>>>
>>>>                  }
>>>>
>>>>                  spin_unlock(ptl);
>>>> --
>>>> 2.43.5
>>>>
>>>
>
> Thanks
> Barry


Best Regards,
Yan, Zi
