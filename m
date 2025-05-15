Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2085.outbound.protection.outlook.com [40.107.101.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BCC4690
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336755; cv=fail; b=qbFvUzd27phuXveEGVA/+qMkh5P3ghgvzY3NpnJWEAtKK4vK1WQwWOUiow5jrqWexjZLp83yENB7xLXokYK1EYzJRpc+DV2FtFC8eqnDWLqjBNpYRduNjELzAxQ4VTudf9I24TKhZPKAI8Pn7shNBqi5WyBwI8iUhdy0RLxZuSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336755; c=relaxed/simple;
	bh=InqpyUJwRsC9k+baBNlbp24kmJpZEeAXURwrroTNHeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KSlZ/4roSmMnLKZ1ez5of8SifymjCAvmQkggPsy6Lqx13QYeZbD4gvjcafQdS+4c+qjvXbsLy3h2yGywDndNvzuUEhD5Fw/LL1CCbzyip/xamFTt3NK4Df+vUSI3O4QJhenYdSPMwlK55AcIedy3xyzs8WUS3Hp5rrhDHHU0Ln0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=diEeaAgr; arc=fail smtp.client-ip=40.107.101.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="diEeaAgr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPqVnm5viTDMBwclYTBTVpY64tIwS8U9vT+ThXzj05bzw45tPr7tA3R+4MYBEPdPd8Bmr23Kb+dikWhIfbkIp4XrWiH8nEoyacu1AIRYExOYhgT6xg/tmhYI/QbDCvjffIhZinmyCg4cM6rNLn6C34SCNcvytmxcAe0Apuf/CPss+HnsEfZS0bFhf3/SWOaRSu237HDTCeKaOpAuNLU2SoInIb9Vj1bR3NTAKHFAWcrFzr9ba7nMEH74SWnRA7VfxNseMVj0eoQI6n8qbAN/RllHSC9HD9is6wyfUEwIGMYwCpj978bbrk1jSzaAjTFQay8Nzs03ZnakBfOUemOwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4a8NifZNUgOQsfF0lTODrm0Ajhd157DwjnYIRr0bZdA=;
 b=g/5St25+I+hnoaKwrWjhHwf9mu6/IQnbM7dcRJUXdQ1D2XblveyNva6XH2ARbIkj3ow3jnmutBjAiB/KvO4ePseB1fm5feuDh7c1MWwKL9lRPr9S/6W+FwOFWkK5ZwyYMONt4beq5hI8sJnO5o5RvbRPFZ2+055N86NRL4MrwuSLc/TluPqtL3VDFeX5QsQq3+YG540zGDAtO4YYwwhtKG2wYn70kT3gZo1J/CoAus7bTgOznWHwVlizou3R7PDcUnVo2jcb0J7Ng3okDyPcOxwMAr+0wQ2fFUQhDutlmsDeZC4PGT5G9OZrz9g6XqPxrrLGxl4RMK3eOSoA4Z17Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4a8NifZNUgOQsfF0lTODrm0Ajhd157DwjnYIRr0bZdA=;
 b=diEeaAgrvLJsGiC9XqjEYEUpIhSVMfJdVioSC0b80dS+Bg3WD8tAbDLQteVkhCXkjL2KaPfH0DqzDDM7yWJgQJh4SzTKN9guKcvkuva/zhmluvYflSjfq0/0tCV0Nuf0KclEkHxBWhG8Egl55RfH1o/Jg+YjK4DVI056nRE2Rt1XQ6yzjrQCVwXEzJgLuRETIxouNcoVnyKneH8rYu4UO6meg45wIrWKInzQe6TVjWpLh+L3tnmPg5G3WYPAQbjZ4RtcX5ULvbiwzKgCaBBj2tlGDUUyU373qqsbjWR1H/KQfvcxVuot+aoRoHkfTxFyYOeni6DZhCP4ocFSp/iYgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY3PR12MB9553.namprd12.prod.outlook.com (2603:10b6:930:109::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 19:19:10 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 19:19:09 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>
Subject: Re: [PATCH] MAINTAINERS: add mm memory policy section
Date: Thu, 15 May 2025 15:19:08 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <AC1AD5C9-70CD-421E-8AAD-64FD847F9B97@nvidia.com>
In-Reply-To: <20250515191358.205684-1-lorenzo.stoakes@oracle.com>
References: <20250515191358.205684-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::18) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY3PR12MB9553:EE_
X-MS-Office365-Filtering-Correlation-Id: defbcb9d-1e23-495d-8a26-08dd93e55e73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m9P0NcWXfekrnKuXgR8m2iT1i+Bnmke4u1AXGfKEfy7d01KVf3GH1XyiBh3w?=
 =?us-ascii?Q?AhcSHJICUQVftgpaBvooU/G2iECkY0LbL4wxzuJNTZzj96BZYy5hU3QeTKFA?=
 =?us-ascii?Q?S4GsriRiL84H86NPvewAuO5jQWIW6nH6EknsXen05GdnnfEyZQZtnM2ZLdQb?=
 =?us-ascii?Q?N5ePOqhLrf0cDuTvnyNCG0m0KwvjOlcG/XMK38EFWYvYXQp+71gkFarOI5qV?=
 =?us-ascii?Q?fGWD1G/6VMrVkQhzMVmeUQNE3fpd60dNYp07Zvva+PSrIpGR+uegTR23w96t?=
 =?us-ascii?Q?A3LLOM2osbc1XXpgK+RLMHf4jG6wo+j9dIf413kf3TgWcAMIw/I+KGbWxlpO?=
 =?us-ascii?Q?uFsoPTb7DSdQwJ/gHFs2lqWO4XJHmLG5mIAmpPhIJlSNRm8gRdjrRc5LuEBD?=
 =?us-ascii?Q?fIGPFvx0OW30nCc6vx/UM4oMi8qUzXakY/LrM0AF/vpxoQsy25VCvOPUdSFb?=
 =?us-ascii?Q?KskT0Ii7sCrI1wQMu+eJxnLAQy9aOtk/Swv3shxCiUttalvAKNuXXgndjG/E?=
 =?us-ascii?Q?+XROKWux/LS9mHGE8AKc4Xa3bRUO4kgUgaoyJezDs9y8tbQm7F8n3p1VxFeU?=
 =?us-ascii?Q?Tm2eAi2Re9r7eB/GddvIpBZ8PMeHmjC66fxb1TMsXFEC8iJnROHo4lVCOU/4?=
 =?us-ascii?Q?VY612gGs/iN0ZvlghylleNQGdNJq5erHa4laTQSOwHS2Tkfku1ONFWjWZl5/?=
 =?us-ascii?Q?h+Ql3riQbkd4tNnpuyqorapUBJJ0a46NatuOdHFBjd0WO6N7hsvAbWkvG+st?=
 =?us-ascii?Q?f45sWicxb0vDcd4VrS7l4woFp5z1FDQWFx8iPuwVJBNka4vICRSMEnDIzQnT?=
 =?us-ascii?Q?IryPxQ8ABulIG7ZjKMoDGTzyt08sK9gaOIfJbTNKWdkP6Brp6y2gmUOtEguq?=
 =?us-ascii?Q?chEDXSas3aFpU6vdLm+GsxVIcCpFu7Xe02OHDIIC/+pvEzvj4FZpfryLaCM6?=
 =?us-ascii?Q?vCSXpuGbJ0Huf8ijJ2zcjqvlgGOsBtp9kRq55dM4CQt1GLNKMPi52sxSxKcV?=
 =?us-ascii?Q?CM0kOch7l5l4hGuADs90PYt3OURQZeK+ovhJumYK/vDfHQ7GN245b5Nx+mh7?=
 =?us-ascii?Q?Gy55MOP3LLP49hGX2T5t6wMuWE+BVOa9pnpl8HrrOzaqpe4d7FpWMpL2d/Mi?=
 =?us-ascii?Q?btv9k9gp77iAowGFx9KTDgl9tmncRXNTF5FhVGiyhhT/WYeyGOAhneoT1DKF?=
 =?us-ascii?Q?EC+hJgX2e4oID9wZzY2/6TXY5GHGvRS43g/PMsYizzCsp0w3PnpqaquIEF/9?=
 =?us-ascii?Q?5HvcuY4tZEELzWwYsVUeu8bXGDVwpl1x9Mhuvyo8LrwCdWWx3rIIPf6U8dF6?=
 =?us-ascii?Q?hxCPLlIvI8PNKwUsC9YRJo8h0uoNKkPM4HH2DK0Sw/KKkXZ+XNfMgJioivtW?=
 =?us-ascii?Q?j0V2LNikTUZWl1WSYg88ixtp9lojz8iyx5xLo7z3ZTiddl8a/kuD3aSYA/Sw?=
 =?us-ascii?Q?6Blhbo59n3Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+Td3a6zY4aQfjE72ppral/bFG39o0IC/oP/EnJWxfyIy4yc0BoiHLpHT7HvJ?=
 =?us-ascii?Q?/p/OYhYEjs8jYyFcydI0/6RtZC3/6rw46ItRMhh1l9d6StkMo/J+fvAc2tb0?=
 =?us-ascii?Q?VlB9RKwEyLSFwd7i3p7cg+Lhmcj76D8R59NHpN7nnq3QZTRnzhhNpgMAoW5b?=
 =?us-ascii?Q?0kFk33Y5x9Zh+omWtRAwACkyQfEWh1hn3aTmkh/NdrY7Kbo/Kye3cDNohRby?=
 =?us-ascii?Q?YHMcgDOm/F2N1BxL0NUgDl7m+R8tUqJr7TdPRa6H5rANTuMAqSo/GtY7OW+3?=
 =?us-ascii?Q?jMC7EsAour6P21tEa3/Yy9T4jU0oK/o781V5UhFltO8dZ2XQNEdwlW9kpRmB?=
 =?us-ascii?Q?hxKKD5g00/aYWtWL35EDuDxZ/sLg5Mb5R8OEfThPlYezXdPiIUtAehALw4d/?=
 =?us-ascii?Q?+M0tsstujnhDxTh5uT7utl/0u4wvYoPV9TfSaUUcsb2QGDkyucxACOpNPiv3?=
 =?us-ascii?Q?rYeeWIeh0c2iWsTnDJKNn57jeUEVdzEC5ag0vWvk0Y194jKIfLv7zzormJGH?=
 =?us-ascii?Q?RP+ZcdvfGr+POZmbIk1Bcxy/K/cjjZsSFq2lgUX2TQGvcLnCwZujK8JCw0/7?=
 =?us-ascii?Q?S0UjvXDz5G9/LcoOCntjvhvij2wTO5tkdwQ6CGAejRA3JrFCnDSZNRhV0z7Q?=
 =?us-ascii?Q?TXKsQ6VRCHdG6/edJN5kF4MSlMYqmocNzvzw7ZR76IVW9NetnKLF6ZaE4zGm?=
 =?us-ascii?Q?lqurQTztT9bf44QjMUwBGggTS9pr7b2J95cLOiuOFeIU41XDk+n6nnTqY5N7?=
 =?us-ascii?Q?zp9HXQ7wuHK5tH3X01+Mx43q1zDsirXWZtBESHlikGv07Ivka1LovOhM7+x6?=
 =?us-ascii?Q?88P9hGqOqKDTjJ6siRaWmlxH0zIV6Os42pTvjHVkxAFnivE5x8+SaMN2AK2G?=
 =?us-ascii?Q?fWr1zx0LM2uY7j/0o0lMcLrOa0fG1IuTBStsHhdDOf9GmN2vtwIaIhy6Zr23?=
 =?us-ascii?Q?Lbygh0CXNKl4sszKrjnSZoCshpCROmK8nRj3g//9shdEGXsBGC8LsxCCj0Cc?=
 =?us-ascii?Q?7LtWERqmr8hM0fBk+hdDEJkRYHkuJ8gG3MTCh/evJhLMXcMdKsMMQ7TxzVu4?=
 =?us-ascii?Q?YmX56JUH7r6gAxzJMWHc3cy4blnDExnLcL69VF5/LrJrUQuKHtmPoWmeUciM?=
 =?us-ascii?Q?eKe4viQPSiGXZFruuQmHSCY0CXuTNlXHMPFQMeM5luxzFLD4/RJtxIMtF8a9?=
 =?us-ascii?Q?9KzsJ1HM/yAdHC7CHkDAMTw0WS1tarKn5+TanstmQPFob0vLmhuq261qsrUP?=
 =?us-ascii?Q?vuW+GOU83QqomyiA/cr4YjiHLFDR5Tm1jpEvJLmqpkoNuDfpbXLq4Rfqii00?=
 =?us-ascii?Q?yW7xq+cx8Li0Xdvzf4tGECCx/jYgZyVqhRpQ5DQscpvLG+QCVhIPzZcJJh2X?=
 =?us-ascii?Q?7YfrOh1mMrbtD8wpMCaA60C537OsTZA0aqfMBK8cBdBr8qpoKI2HNTE/OMc4?=
 =?us-ascii?Q?x1kiW69BRGQv+Fej5HXTR5ISKjw1TFoags4XVjYmKmdhsdBtuaqUomVa58Fo?=
 =?us-ascii?Q?98AdMHVcjSkOWMjy2PUJIxp1hYGSrvGwwYJ9oxZSiVOg2dKE+iLLO9vdpzPH?=
 =?us-ascii?Q?UMO/u5V29VA6n68y4/eVBgaGzCf/u1eEnadmVvbh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defbcb9d-1e23-495d-8a26-08dd93e55e73
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 19:19:09.9011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3Gxp68cMFVbtMgHcQI4u3cv1iARebh1eFR8KjKSDUyeYo+yZNNs1+EIkywbK5Db
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9553

On 15 May 2025, at 15:13, Lorenzo Stoakes wrote:

> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for memory policy =
and
> migration and add appropriate maintainers and reviewers.
>
> Reviewed-by: Rakie Kim <rakie.kim@sk.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> v1:
> * un-RFC'd as there seems to be consensus.
> * Added Gregory and Byungchui who kindly offered to be reviewers also!
> * Removed Alistair as he hasn't been active on-list lately. Alistair - =
hope
>   you don't mind, We can very easily add you later, just don't want put=
 you
>   here without your positive consent :)
>
> RFC:
> https://lore.kernel.org/all/20250513160007.132378-1-lorenzo.stoakes@ora=
cle.com/
>
>  MAINTAINERS | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 314007e2befd..17403329d76f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15577,6 +15577,25 @@ W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	mm/gup.c
>
> +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Zi Yan <ziy@nvidia.com>
> +R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> +R:	Rakie Kim <rakie.kim@sk.com>
> +R:	Byungchul Park <byungchul@sk.com>
> +R:	Gregory Price <gourry@gourry.net>

+R: Ying Huang <ying.huang@linux.alibaba.com>

You probably missed Ying's message[1]. He also wants to be a reviewer.

[1] https://lore.kernel.org/linux-mm/87wmakt0v3.fsf@DESKTOP-5N7EMDA/

> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/mempolicy.h
> +F:	include/linux/migrate.h
> +F:	mm/mempolicy.c
> +F:	mm/migrate.c
> +F:	mm/migrate_device.c
> +
>  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0


--
Best Regards,
Yan, Zi
