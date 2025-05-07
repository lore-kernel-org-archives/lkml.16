Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E531728B7D8
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633443; cv=fail; b=Rwz4YVHGGrPSx/SeU1ZL8WOvgfB29vtbw4mr/2jVY8sHpIOLPG86clePFDpuqn6DH9Vbk5+xD5p0+DYJV7qR5vPi7fMJEeCz7gxW2nOnbKFaRVcL4LY1xRAAyHO456KGAw+G0YYrZ5c081nn4UnXNtOzlhbMMAtNquQp2LGLi8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633443; c=relaxed/simple;
	bh=QfvtkasnG9aQLYUdwXecrxjFmTRTfEiIGwwqyfk5jGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Haa/3KTcxCqM8FDVSPfvufXCSYArKcN5HwyAVbngn87nyn/K0oIaZluE9awQlNUai7/vTu0hdIMEmJ8DBBwVgj8SOlCtkA6HRdX+aR2Th4BmRELv42nxTMd/zK6DDbjwLfLkDADGFKPaF+KMRuKAK61mrY8b3JnzxWvyv7DBKpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SNl46Eh7; arc=fail smtp.client-ip=40.107.93.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SNl46Eh7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUtc7zUhD1VXkuLrEODVW22N2rjcMV3Wf8apbqM+x4zamXQeov9kWp0l6GP20qAV1UMwhyd4jGydqlm04LWyw7BYSPG5X7avCy0qgFDMKCwc0nfCZBYLrmzJrrF2tgrJcLY3tveCdDyazEd7YQ++KuNcYwGX79bZ6rZZ0gc4HOVWH4LBedUVwmf3elTSxSE/a4doELULtcbSn1Lf1m3rQQAG1NmaLLP8PvJLN13e0JeVt86SbjNBmkqBp30CYMqpRKJusGe9caDq1h2LfUORVQzX0eLd5v0P3pi0Q/5NgUGGIacY1UxOE3EWky/qy4+rxtKliXdQsNSEp0KM068aDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sICmJx8w+PQdTkniZRbY2eqd2K6CBILgOV0JvgvYu1o=;
 b=hSbOsSin7JfIxhfDt7jQK+CS4pZZD2h1wLqzUDKC7ioT/7LkZQpdkAdZAE/w7DHs/4BgLdbqd1Y0ZTSnixpMItlUA0wnCsm9J1ZZ1eFWqNDUipLQITzVHsq3wxg0JMQXsmvNYDMjXKzQeb/7gK5Dk1WegKna/Fnn09j/8m6nTndeIs7tuUDqWHGk1HHoqogkQ0ztJmRpzscrAQWydeOrEBS4jfM/BOwwzjTV77mtI4lesO48+55SbySdlqSUBhB4QDsUbbJyqq1fAM8x0V1IJagy/XW5PFDLl9DrGDVpI7WhBzp/vKfQSn4Rsiw3KcBcLnMkbzUn3t1c9hLvD8/VTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sICmJx8w+PQdTkniZRbY2eqd2K6CBILgOV0JvgvYu1o=;
 b=SNl46Eh7uLPvps0DzctZ2asAwltTUL/e9KZkvKaPPLypSZvm1z5FjP67HsbQwMoj4Ve7gAnceMWZyCe9RdEwa9/FKhPZavjSQQ2N4hic+/AIEKQwFM4qNsLLpIZ8ylCwdCTlACEG/t/Gi//LYijs8nY7pwDf9IctzC3tjce7mOhKxPj0Zxgnr9YvMlKfDXoeCTH5tp0NMLnV/38EprDRuZO+7jDv0rtIoX4GjgmkFHNwchyD6A6CpkKk20gy6Q52MyLFJvR6s9UBLfZZ17z9k0GgcMvl3T9L8/l2qja0wJwjOS7mB0DAvtAvwJgRqi7pDgsFW/rhVbXZRTwj6JWTdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH1PR12MB9623.namprd12.prod.outlook.com (2603:10b6:610:2b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 15:57:12 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 15:57:12 +0000
From: Zi Yan <ziy@nvidia.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Yafang Shao <laoar.shao@gmail.com>
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
Date: Wed, 07 May 2025 11:57:08 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com>
In-Reply-To: <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
 <293530AA-1AB7-4FA0-AF40-3A8464DC0198@nvidia.com>
 <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN1PR12CA0003.namprd12.prod.outlook.com
 (2603:10b6:408:e1::8) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH1PR12MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd7ce80-9c19-40b4-91c6-08dd8d7fd4b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MxWJm4ErtW4dgPGxtLS2aMpmcKVvbrADKInN432TLeTcBud8/qrL4y37aiL+?=
 =?us-ascii?Q?FRvfRXBMUwfKBGOdh1+UkEfzPvdm2p8lTrd9Fjeli/gtbLWlQomSFRvjBBKk?=
 =?us-ascii?Q?Z+2/r8b4ZLXVQJqVltoMEF2yvinIe224wW0pkle3OFa1vTwh9LX7hFyXE5bl?=
 =?us-ascii?Q?dBbW0WqeSK1l/eHWA6ZQyHBjOmPurA/Lyl42W09OHNy87Ecfl31fP6iVM6HX?=
 =?us-ascii?Q?OYtIFrXR6VC+uxdq+I96/aRroS4YgHvOsned4ypzupC/6rA4S1sKCA1mjjw1?=
 =?us-ascii?Q?dGrkv9xKt+JvYIp7AinbO05cWm6Gp7BdPJCYmQypI/s11kZg9mKhF/k7oPAz?=
 =?us-ascii?Q?ghCiccEOc+v8WnO+NOzPPV78ZdX61sjfQ1/wUyWsvE3LfFx1UpIklAzdZrWT?=
 =?us-ascii?Q?bqzoWV3ieTFTB0Q9KELyN9UPuoRzvxnQaUazwNjRIEJKSF835w9Cs4Ff/GR3?=
 =?us-ascii?Q?q7/6fZ8sYVW4ZhLYa9zF6jtdDhyPTOJe6rqn6V8iQAUmziOAGZox6gp06lB0?=
 =?us-ascii?Q?FGhDpT1YiLuHqZIhkvrjyJVLPJ2mE4x4BanpZOkCSm/YSf5ol56O15q5yurL?=
 =?us-ascii?Q?/GdYFRsK8qb+6ytUQraSQjxHU0bxfSu8RvijRQyQNmsc5OWMu9QlgrMMg4L2?=
 =?us-ascii?Q?MQ2jlfB6RlxsBljT3mHoHi35m+i6WB/4J/E86qxRN6Eov5X5tq1YoQRsI0JC?=
 =?us-ascii?Q?iyGBaDwjKsyHXq/RCCDxTyRnl1ahG1Zs0RuiZni8QaVVwTg1trw6XdEC1CSS?=
 =?us-ascii?Q?kpPFbCo1cTgANrAGyb8UW0xcATtOAFLo1MlfMKVXFfDJiU2BOGQBVRnVYlpR?=
 =?us-ascii?Q?T8afPkBCOL0lyWJjxqbCJep+18+ut1VtWUMA5uCtMK+BIti5PMngpl7iA/3C?=
 =?us-ascii?Q?rkvInMLKLsHPrRLx+jk6t07t3nC6GGSv2Ysm72TniTfDw2OV8+VJ8gbSe07d?=
 =?us-ascii?Q?F1xovvtSlWh+83h1n8RqZH9f95ExyfpIPenj3cxeNk50vYJLelwTttujBsRx?=
 =?us-ascii?Q?L0bUMI1sDG8rC9TYNRRVFexQDAUzSE1hQMm6LwMv6h6Rck5MnyZ5nYYN9p5i?=
 =?us-ascii?Q?1nLyCXbtkAZPIj2iIw7EQodAVPNPS1BZVBU0++dkYafs2dtxz7lUkzntMieH?=
 =?us-ascii?Q?Iopiytn1+rkaqgCUIDO+ZNvx63PCPNj5hPQILrd7L9pL2S2+P9+XCexjXMGb?=
 =?us-ascii?Q?EfsxMmmarSIzI3KNwjKcKEUsgdV6chiEK/pvSCJ9tmbPgUG7s2ft5HD82h7+?=
 =?us-ascii?Q?P24SrsHLuwqRVp3Rl96/h1FhxPDpyqko/cim/fySPQl0yrKzJNfK0hLEdRAy?=
 =?us-ascii?Q?CICndYMWc+THmqe4RV2zh4LwPq3EifmrNo+HB4mTJE9kk7ziIilBLsRcH2yq?=
 =?us-ascii?Q?K+nYuqPXynpjVaqf5pyDO83V7/XaWAgcmCT0cSbIFSp/oyhGNxd9ap40wURf?=
 =?us-ascii?Q?0Vupu/h0HwY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JZiGc6+Q9scg2NQGtowtA5Bhg2KGc7vamCSCyyF0wfyKJGn1JNjv5IlhwXuW?=
 =?us-ascii?Q?lS2NZgOSs07Wbh8tVdXgj+VOfxvsfxKNdLhGQHZbC0pij0zSXcC6Y405Y0Zj?=
 =?us-ascii?Q?tQvYN7dyZOyLkV/gW5ilxY0jNBMgANF7VtDFYaJdCZlOJduPFzIrGzhdfcgB?=
 =?us-ascii?Q?3JJew/qJVRuA0VTTzsYQ5rf1OkQ5ERkkpMBeOePvCqb3wYiJmOQbOiENLsK4?=
 =?us-ascii?Q?rL1w+y0sW0eD6UB18r99RrilGAjCU4Z1MmeZIHcOKazck2FyxLTPJu9W4bPI?=
 =?us-ascii?Q?Y9XNZ3mVVXIbHOQ2FaA/rsNAuToxrrq5SkruwFdT4Ltv3vTUWT/uSDmO82Lf?=
 =?us-ascii?Q?Wwk5fCpn3WJfg5C3+kCZP7DMu9ERQ+q92RNGxkoGkI27UTbAmcNc9MX+w+ma?=
 =?us-ascii?Q?vlOIsVFR8hMN75cJqXcigcWBVL/UNRKGy1RWKhy5/rVs5+D2NJoMKVVncaY/?=
 =?us-ascii?Q?eHqZ2j14+RcpU6jSrOGwyOPXogwSsb+Ogp6kFIVxFEtLoHsr6SQZfQZ0+s1M?=
 =?us-ascii?Q?u018Q372TCl22tTY45jgL1LNAfZwqgWxeoPXEDdM6PnUXJcQSm1V8Fd2mcv1?=
 =?us-ascii?Q?tYAS1KUdOAZkZOr2pWw8FvG3ZUxgsjt2ldNHHYIXTnqWC2wwdOA1/EORn6oK?=
 =?us-ascii?Q?qAV87M4jNaGp3lmugVPw5Ksheu5XyQ8ZDyp4mA0PTpf2W1u0Rkoai/T3POC9?=
 =?us-ascii?Q?07weKvgs7SjzQvVS4dKXq9n9ofNnRzN7C9YZ/RoDrshBmXfW/0TMZbfmtEUw?=
 =?us-ascii?Q?86IgmvQ3i6qlxebZ0p3gZIjN4OvLta7kD71WJJ4RgMSDpj01E38EZwR0WR/G?=
 =?us-ascii?Q?hnBf6groujclqvEYuFWbZPdnOGZGSgGyzdTaXrojfKqH4bB2ZvhmQBjA0MV5?=
 =?us-ascii?Q?GBcubyx6xot2QFoGXBGoXmVgaiBjTifm2DYzSPZWqaXUWpYTfx8R3rus5nzx?=
 =?us-ascii?Q?LgvJgTCZTJw3aRCfRveFMpxrl3jPVnYH+J5hgdteUOhaRJ4Ld70b0ZDeRLd5?=
 =?us-ascii?Q?9WiyOLA2BwhC1WlcWb9SfFRvdYMzd5ql1Rys+5yxWcWfReFs4rQWjnJf7SxI?=
 =?us-ascii?Q?iP4923VsYYde85RIt8XfRjv6DR/I8v4gSO3ihVOwTKwuV3TgT+azyz4tLt7s?=
 =?us-ascii?Q?UsCIs1wyjIgvg1GEbmkC6SeXGK77l1FMdW3dqwLzXHHNHO3+wb92NO8MB6Ut?=
 =?us-ascii?Q?qa0ALx84p5RtF7HWQQ2nlX99mLlYHpFTfskWkNUgCeP449W8s0y6WGF4Rx6j?=
 =?us-ascii?Q?wBJmYff8uNRMfwYxfDqRT1YiT76wgXfUiU88E6/bHwoMrdOhztvviTHxMpxN?=
 =?us-ascii?Q?PHhHDwE/yzYeEdlPnn0G2br0CH8rYz13IlIz1IFweKjR1pew95yEvb0ykQCi?=
 =?us-ascii?Q?WQuswlrM/Hjbkg7/SP32zqCLYAqoYQ4gDPoV0GWDwIfDTLSkeRQbwaNMxmhm?=
 =?us-ascii?Q?xTBx16Sy56MteIJ+4tPeCulSkEpVvPG88ITcYc7jeEAaOvqJC+TV7QdDHFmw?=
 =?us-ascii?Q?I/00OGPpMZ1sYGWLVKJqMYGE657wP2ka3t7O425cMFlBDES4s11QEUAdXI3g?=
 =?us-ascii?Q?o9D1hxqUWytKPPqhFnJN6q3oLXG5tSPewbxN5Dg9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd7ce80-9c19-40b4-91c6-08dd8d7fd4b9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 15:57:12.6861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cyNE2x4aH0oYG+psuk4jB8HivKM/1YO5Tdrm9KG+8Ft16waMxooAM5Gwh1JpE/7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9623

On 7 May 2025, at 11:12, Usama Arif wrote:

> On 07/05/2025 15:57, Zi Yan wrote:
>> +Yafang, who is also looking at changing THP config at cgroup/containe=
r level.
>>
>> On 7 May 2025, at 10:00, Usama Arif wrote:
>>
>>> Allowing override of global THP policy per process allows workloads
>>> that have shown to benefit from hugepages to do so, without regressin=
g
>>> workloads that wouldn't benefit. This will allow such types of
>>> workloads to be run/stacked on the same machine.
>>>
>>> It also helps in rolling out hugepages in hyperscaler configurations
>>> for workloads that benefit from them, where a single THP policy is
>>> likely to be used across the entire fleet, and prctl will help overri=
de it.
>>>
>>> An advantage of doing it via prctl vs creating a cgroup specific
>>> option (like /sys/fs/cgroup/test/memory.transparent_hugepage.enabled)=
 is
>>> that this will work even when there are no cgroups present, and my
>>> understanding is there is a strong preference of cgroups controls bei=
ng
>>> hierarchical which usually means them having a numerical value.
>>
>> Hi Usama,
>>
>> Do you mind giving an example on how to change THP policy for a set of=

>> processes running in a container (under a cgroup)?
>
> Hi Zi,
>
> In our case, we create the processes in the cgroup via systemd. The way=
 we will enable THP=3Dalways
> for processes in a cgroup is in the same way we enable KSM for the cgro=
up.
> The change in systemd would be very similar to the line in [1], where w=
e would set prctl PR_SET_THP_ALWAYS
> in exec-invoke.
> This is at the start of the process, but you would already know at the =
start of the process
> whether you want THP=3Dalways for it or not.
>
> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4a=
de7c6ab7be29a/src/core/exec-invoke.c#L5045

You also need to add a new systemd.directives, e.g., MemoryTHP, to
pass the THP enablement or disablement info from a systemd config file.
And if you find those processes do not benefit from using THPs,
you can just change the new "MemoryTHP" config and restart the processes.=


Am I getting it? Thanks.

>>
>> Yafang mentioned that the prctl approach would require restarting all =
running
>> services[1] and other inflexiblities, so he proposed to use BPF to cha=
nge THP
>> policy[2]. I wonder if Yafang's issues also apply to your case and if =
you
>> have a solution to them.
>>
>> Thanks.
>>
>> [1] https://lore.kernel.org/linux-mm/CALOAHbCXMi2GaZdHJaNLXxGsJf-hkDTr=
ztsQiceaBcJ8d8p3cA@mail.gmail.com/
>> [2] https://lore.kernel.org/linux-mm/20250429024139.34365-1-laoar.shao=
@gmail.com/
>>>
>>>
>>> The output and code of test program is below:
>>>
>>> [root@vm4 vmuser]# echo madvise > /sys/kernel/mm/transparent_hugepage=
/enabled
>>> [root@vm4 vmuser]# echo inherit > /sys/kernel/mm/transparent_hugepage=
/hugepages-2048kB/enabled
>>> [root@vm4 vmuser]# ./a.out
>>> Default THP setting:
>>> THP is not set to 'always'.
>>> PR_SET_THP_ALWAYS =3D 1
>>> THP is set to 'always'.
>>> PR_SET_THP_ALWAYS =3D 0
>>> THP is not set to 'always'.
>>>
>>>
>>> #include <stdio.h>
>>> #include <stdlib.h>
>>> #include <string.h>
>>> #include <unistd.h>
>>> #include <sys/mman.h>
>>> #include <sys/prctl.h>
>>>
>>> #define PR_SET_THP_ALWAYS 78
>>> #define SIZE 12 * (2 * 1024 * 1024) // 24 MB
>>>
>>> void check_smaps(void) {
>>>     FILE *file =3D fopen("/proc/self/smaps", "r");
>>>     if (!file) {
>>>         perror("fopen");
>>>         return;
>>>     }
>>>
>>>     char line[256];
>>>     int is_hugepage =3D 0;
>>>     while (fgets(line, sizeof(line), file)) {
>>>         // if (strstr(line, "AnonHugePages:"))
>>>         //     printf("%s\n", line);
>>>         if (strstr(line, "AnonHugePages:") && strstr(line, "24576 kB"=
))
>>> {
>>>             // printf("%s\n", line);
>>>             is_hugepage =3D 1;
>>>             break;
>>>         }
>>>     }
>>>     fclose(file);
>>>     if (is_hugepage) {
>>>         printf("THP is set to 'always'.\n");
>>>     } else {
>>>         printf("THP is not set to 'always'.\n");
>>>     }
>>> }
>>>
>>> void test_mmap_thp(void) {
>>>     char *buffer =3D (char *)mmap(NULL, SIZE, PROT_READ | PROT_WRITE,=

>>>                                 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>>>     if (buffer =3D=3D MAP_FAILED) {
>>>         perror("mmap");
>>>         return;
>>>     }
>>>     // Touch the memory to ensure it's allocated
>>>     memset(buffer, 0, SIZE);
>>>     check_smaps();
>>>     munmap(buffer, SIZE);
>>> }
>>>
>>> int main() {
>>>     printf("Default THP setting: \n");
>>>     test_mmap_thp();
>>>     printf("PR_SET_THP_ALWAYS =3D 1 \n");
>>>     prctl(PR_SET_THP_ALWAYS, 1, NULL, NULL, NULL);
>>>     test_mmap_thp();
>>>     printf("PR_SET_THP_ALWAYS =3D 0 \n");
>>>     prctl(PR_SET_THP_ALWAYS, 0, NULL, NULL, NULL);
>>>     test_mmap_thp();
>>>
>>>     return 0;
>>> }
>>>
>>>
>>> Usama Arif (1):
>>>   prctl: allow overriding system THP policy to always per process
>>>
>>>  include/linux/huge_mm.h                          |  3 ++-
>>>  include/linux/mm_types.h                         |  7 ++-----
>>>  include/uapi/linux/prctl.h                       |  3 +++
>>>  kernel/sys.c                                     | 16 ++++++++++++++=
++
>>>  tools/include/uapi/linux/prctl.h                 |  3 +++
>>>  .../perf/trace/beauty/include/uapi/linux/prctl.h |  3 +++
>>>  6 files changed, 29 insertions(+), 6 deletions(-)
>>>
>>> -- =

>>> 2.47.1
>>
>>
>> --
>> Best Regards,
>> Yan, Zi


--
Best Regards,
Yan, Zi
