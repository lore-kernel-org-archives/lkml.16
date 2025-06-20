Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BD31F03C7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750438792; cv=fail; b=V/AtwinUbFJTVd9jCs+EywP++sjqkXgjphO4x0bcrZ8N44/HHVScDv96mhfLpUCAzRHBwQVT2T3NnsMjxHaGBYB19jKX760K6hAWAjjWta7Nvb0zVY4ZMVUzzvph6JIoRmb5iPzZoF2/ClsSPqhyWdcDDwySOqg4m0sgVEqoxkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750438792; c=relaxed/simple;
	bh=jOoSHly8jo/GK9zcys7OzbZMXxmIV12OdNnVNd+GPEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aOv9iRAUxFvFVqlteLRs1vybCD1rV8KX6zIDmlo5hz4ostv9M/il47JyHAUQAihbkipdMUvFKXcYxZCTP4ti4qw8aaTxopJBlWk3AfIUbWD/J/1zz0HDtpaCRtLCTBWqKjRj5EWcrhdpTwiiTihFVfwpvNknkZnek2hhgVC/AXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CBK8eod2; arc=fail smtp.client-ip=40.107.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CBK8eod2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4gJs5+grYLjNYVjkr4CqOPdw5yOnOgJerCdXDklg9rSHAZ9DDWzmc1K47Ng4qyHy9dToSZhDYbwwcLVEM6KxHvMRFaPbJy8AeakC+QXkKWsanTlwTmn+t0W5Gq1KC7Wo43FtU0WgKMt48n+OD7XwFDRIWZFztoPoaoO/iCpMeF7QcUlQ44njU6iKYlLS1ByBS9R6/Zi71VRtmFJ4JnPa2dGfApCpIFNKoVJLMK2CnL0ExyeBEINMpcN36lMt30I+IB6GD5y0oad25gK1kfIa3dfDy6iGIRW+52bVfQylpZzvrW7AnSWBHC8JgcFLT033rVpscXzQS5fguzAn7xucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfA1GBkwPnknRcvEpHAjnDXev8li5dyXVQ2aYpcpTWc=;
 b=RPL1icWPttX4c8zVcfWfrjonkguBQe54WQF6aDxlBjF4N0xIDkY/WAdQLhuA0avJKApEOPwrp6dTIG7+1uBOKkQZ53frh77g87ZdLzu/t43v+RbOqTYYCr2Q/BGP/Qn+TeF7co0gyVlkfSGZ9s1nr99JAY5qYShSaLoajOJCdGddQfpYUnWDSRBCxpRAwaEYAt01RBu3hMAKxIUS9xnOlkcCaOF5Aa1eDHpsyut3nlmpQXcGyM5e3t9IEBdM/r3BSziAwV7xax3yXAhXf1gMre8ginc6U9qPl/QG0vxf/4G5T2QLcGFOiPrvZXCgMF4mFMu2zbFnd0IMt4rZfZIcwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfA1GBkwPnknRcvEpHAjnDXev8li5dyXVQ2aYpcpTWc=;
 b=CBK8eod2eT8XaKV0tSMrEtapKMC99TdLn/Ej46UlHRCHdCdmoDVQBGctLDb86V9fEVqxobrvPQGIiVYQ/BIHOuQtgOea7XGrGG5sBCOswWDia8d7A7gnz5StkTf3bLXFqQ3tGDcRbD9nhbsxI0ercGzd8gvlZ2dmB9xbmiDW6wMuFOOrq42bq6ghQGiRm4+O9JMEe/YQEGD+F8koKKPfcUeTLPNK6K4p2uT/hWViEpi0e7b61Q80i7fH9yQbcukRUnHHUShhYdh6YDePRDEMfRjjo9WncV9k4Zc+EbalVWhK6DClIfJJtwELul+p0b0cWsllkXrmXjmsfNz6PYkifg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW6PR12MB8736.namprd12.prod.outlook.com (2603:10b6:303:244::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.20; Fri, 20 Jun 2025 16:59:48 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 16:59:47 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
 SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 2/5] mm/madvise: thread mm_struct through
 madvise_behavior
Date: Fri, 20 Jun 2025 12:59:45 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <71B47639-F155-4A81-8BC5-90EF7C1EF4DB@nvidia.com>
In-Reply-To: <a47d850b0111735e026d438c3300c0e3b7f439f4.1750433500.git.lorenzo.stoakes@oracle.com>
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
 <a47d850b0111735e026d438c3300c0e3b7f439f4.1750433500.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0448.namprd03.prod.outlook.com
 (2603:10b6:408:113::33) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW6PR12MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb1089c-6ce3-415c-52ed-08ddb01bdd19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WYGEmZfqvKEcHwkC2ihpmS984Y4Y4fgVoI/1hcQY6UdZr2bqUXTZuT+51h8X?=
 =?us-ascii?Q?/MY/+LQ16gswkxaDdpJkT1EsunQyJujrue3N2r0ZJmeorrwjY6QAF7yl04EP?=
 =?us-ascii?Q?dgtLVzkb5WuYH96ILaFOh+fHeXefH+C719pzvSoH5RR+HUngb3RF253iMHg6?=
 =?us-ascii?Q?Saq9MFyOn+3/MNPz7HyFCgCSVGcLbLDlDwCneBq567KWglKAN90z6goycwFY?=
 =?us-ascii?Q?+KW+2Oq08zhytDjYQUDXBsjHHe4ae/PhMPcPxym2wFzE8fTCYcr7gVnJ9Mdw?=
 =?us-ascii?Q?ycazlAOgvPpwGiIt4p/zPKUQ1N/QAf4/QOd7lW/mIi88D9+000nv8Pd1AY9h?=
 =?us-ascii?Q?Gq5B5I0GZxtx4Rfg/Y2d+mTUfq4D1X9RECIOUCN7I++O0Ugvh6PkeiVfB5pk?=
 =?us-ascii?Q?3oGdrOu21Qqg3rOsqx+FFlMvd945MKc6nvY8kUK5HuvixZjDBGRQoF2l42Sq?=
 =?us-ascii?Q?atGQUJSxC3h9+PZEsnZxvL3TrzW0Z1/Uc7HUFlo5XvZ1ManupZd63faFh8oy?=
 =?us-ascii?Q?DXGvnaDUw9C7hjDHIs070N+tQXaIPey7nX7F7CS8yx7UH1GAWtTruFge83Tw?=
 =?us-ascii?Q?GLGi3fXF9tEz596yWNWlLM3L4KLBdDMEe4SiSa32KC/TZPfoYs5Jg0vLddMo?=
 =?us-ascii?Q?rlby3kJGdnYfcg4QQKcyqFlPYVq1VX6o850ScVVeTLZbFMtIM5jWUUzSDves?=
 =?us-ascii?Q?tqLpx5RzcuChSMSMq/gtPcvCDUsiQyBJlUYuwmfo9ChLJ8IhFv4DtaMvjPKl?=
 =?us-ascii?Q?Rl8VSMR2iWNWrQ5c+JEQZokWukKGg25uuZr016jlyFat0MajwccDo+BA0H4C?=
 =?us-ascii?Q?9gJ4cJCebKxyauPU7RI3VC2jQVQ5ANHA93/1BK8/80cboJ2PCljpsVIDWjCq?=
 =?us-ascii?Q?eYoCidCdEWK+9ZlC9rSsEpPlcGMYSZm8E8d1F+tfCyLlPNTfIJFGfapYiGRt?=
 =?us-ascii?Q?1QTpi6i2yM6dJfpWyoCiFlOzMz462hJWqQOq+AF7Vw9XbR795Z65UoU1VdVi?=
 =?us-ascii?Q?GTwhhgu4tBK6dabT39Fo1JN0KK+0IBaPvFksq8OJ0rivk6qXCtkz1JpGGpF0?=
 =?us-ascii?Q?Gj90hUOU07KZIW2L5aKBU3Fb+tnpcr5f015CfbnqUvz6Mi7swh4+764EAFiF?=
 =?us-ascii?Q?vjAkUs8h5DboLbYDyO77jno74XlAiGCfEx30odzYKqW2NSxdcKVWhEqwLRUo?=
 =?us-ascii?Q?uEDLYFO0NQTIR+Dz1e9p3tBCOleVWtQYnrkDv+xzwCJWHfEL2PMUjGeuVq+T?=
 =?us-ascii?Q?r/YGId61BsXRwo8IFNqu1uqeZ6fexNooFECKWuOkoe9QuZqzFAo2ESfpIybx?=
 =?us-ascii?Q?MZy9NB72Lt5LFYiF9panuSQij/vjGZhfqooQZkDhPLdcaKh/9yDLXV9FLAEn?=
 =?us-ascii?Q?g0Y17fTdTQtcAVoWcnuY570XjOC8DCn4ag45Tx+1Rs3RxW31ABrTFIky0DbZ?=
 =?us-ascii?Q?QhCIcGogiaw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p3Tv6f/Pqs3NUUDhLiWQKmmJ0ndqNbAZUodsuLajuxyprszIGiPC/078F7EO?=
 =?us-ascii?Q?AVCz1SRWexZxGjouBiatks9l3Gayl0glU/vm7VBX18nKN34DLC1RlKo7xPdc?=
 =?us-ascii?Q?xt3NCQV2UkKtibjbA4m/Gb1G307yGyOEh2TMQB5euA7CRNlbklSYyAwaAxNH?=
 =?us-ascii?Q?IRQ42Kicy2DftMlZDC+qoVLUjLEYJ9gxO7Dl0nSR/ItPCYQdX5faITrd32W2?=
 =?us-ascii?Q?gWj/S+GUocZ8AWAUT6TQnE/o8U8/OWvi2KWKIMm4N4yqiw8QSBwCZuyvJvUK?=
 =?us-ascii?Q?7DegPZzYk6xMwNPzrnBILMGd50ZBE8yq+WxvYbEJk4I6fK1esDaPbs2qnw49?=
 =?us-ascii?Q?mt7cfvfDR7xCPmfb77xgttkHHnHEBGO5/oDSv0j2R2hcQ7sZfhhp3hqRLx46?=
 =?us-ascii?Q?7ef8697SZlKZcXd2IgzGvQI0B7sb2vO6ExxVzNXUq6tJbLX4N737B9v83bOT?=
 =?us-ascii?Q?+xenlx8iJj4VyJ55tinjpvcfJs8pJr0PeL1n/8ohVQzR021bXfN9PhzdK/ga?=
 =?us-ascii?Q?HKLKqt6o6hcal+ouDeSlsBX3JxZiqf4B4+FEre+2xty1PTsfi30JajEbBU3A?=
 =?us-ascii?Q?ltDuNSTn7RASQjGIClcKmDa+kRjNcQaXlsawalvn1q0y5wbxnXJi/bH4DCvu?=
 =?us-ascii?Q?3GCeyJtLDkgIHxcPSoQcNz+Wwr3hw8p8J1UURSawqvLOLWklvaguH28ZzEPX?=
 =?us-ascii?Q?gMcnR9lRwDtjfVpgAaXTLKsy3pLAPMPUEq75YRgVAsuJQej5Hf1GeAfdOkCm?=
 =?us-ascii?Q?S1UTomsI80NjsTE1Of0ZH6dLHEYdhmP54myre6T2HSmL6xB2MkS0xbE/OmE+?=
 =?us-ascii?Q?3MbMEaImREkLDor10Zo7RmhPWZ2h1tcyRX/ZX8rBjNtebQd+33eCoFY2OGTl?=
 =?us-ascii?Q?D/MVyYzisLlut2NsayBgaD3/AYVsMdePybwWx0apJmwC05RetZHzjrd65rUF?=
 =?us-ascii?Q?5NCxS3uh0oZzECPyTg4yvkLqdYPCaXMWk5GAZiZXFHlVTEdmdeRwsEiuwvgX?=
 =?us-ascii?Q?IO63c0dYJpRgmHz5hbQdy5NAPoIOvJd0K4cxhmjBbOnv4Be1IYDA4c/BwNMs?=
 =?us-ascii?Q?kb46TKnJgNNFwxRQJXenYDT6XJqRLJgOcdQ6yTRZ0N8zzbTBYW3GHxx+6vBg?=
 =?us-ascii?Q?pM9NgMvxqfevINtU0uXxKUdmSKO5xHm2MdI0sEyBs3ccBhFBQNFZQpX/r6n6?=
 =?us-ascii?Q?FDnkyFaZpgM/IkMMF7nDkdLm8g9vMRAOcL8GsoVIboaIzMz05tBR+BZFDl0J?=
 =?us-ascii?Q?QotuZiKBAOSLtpDCmleXJRAxulVynlBo9x+VPH1esZDVEEJhfeR1S4Rob8YD?=
 =?us-ascii?Q?Z/UpQbQS7QhksPkR0xjrmxJhS7GZ7qKqOhEz2yDUiVO4eBSvBPy1ajrMT1hW?=
 =?us-ascii?Q?V5S2dYF31FLKn8kbqiT+cBiF5jK5twnJVMbM8o3yTA8DKCYUU9YYW2SYWEUD?=
 =?us-ascii?Q?swgpr2/E4CGbdp/kZ8tG+PsEA+ganOGHVNPziHCi8ndP1xtIFeckcwzaPRBJ?=
 =?us-ascii?Q?MTvGZep87A3B8ZU1eaFKdeVginP0/8PU8OT9Si0y5Vyf+24L3FUNgJ2+wVZf?=
 =?us-ascii?Q?DSSM6vTkJs8i6NJrVWfZE6x4JuFljXQ7uMfjBGv6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb1089c-6ce3-415c-52ed-08ddb01bdd19
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 16:59:47.8815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2qcv8p8i5oceEn+3o2RDk8BcH+As3cpZk2vNvtR4s77TjQ9qb88dJlqf3gmpYyI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8736

On 20 Jun 2025, at 11:33, Lorenzo Stoakes wrote:

> There's no need to thread a pointer to the mm_struct nor have different
> functions signatures for each behaviour, instead store state in the struct
> madvise_behavior object consistently and use it for all madvise() actions.
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/madvise.c | 110 ++++++++++++++++++++++++++-------------------------
>  1 file changed, 57 insertions(+), 53 deletions(-)
>
Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
