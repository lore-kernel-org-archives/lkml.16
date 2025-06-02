Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2055.outbound.protection.outlook.com [40.107.96.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB98165F16
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 21:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748898562; cv=fail; b=F6QqVPQw7SQBPoQNyknYsk39mM1bp9HTSmkDO4apze69oA4YPjqnwqCa97By9SsVvDcmNE5FdYz+o7HD/YggJhsQwgCpkLV4prT3pxhxbptwBb/eCt9W90mNKsnZs8NF7NlZSYcydyBxnSqhApiZc2DbVlPcncqbreajKCKAPVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748898562; c=relaxed/simple;
	bh=b5ScupLOBK369uR3DMk8wBSFhF/LH4FClp7P8tdUn3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h+JS47jIJf9+x6324WuG1nxRFYMSfZsN3aoykMX8vK4FtKf/kYxuYWeFeh1RNg42roruxNYb5nzGHfc/SOhBl1cYeWjEFoaiyynNu6usvMyWqcRrh5SH5vgHVob4NF+48ZL6x7LwrRHTEZC7DwSPa/YFumSw6P/bHaBh1XJ5xAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RBNJU+eo; arc=fail smtp.client-ip=40.107.96.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RBNJU+eo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBtGvJHonxUXHUUILmB0vS083rsz/yE75r1BCqhewCOVyK5GD6jcAjTC1EGgiOcLkooD8ww91H7GAIwPQJYT2CGhNO9gdgLFM5RTgfz6B/1n7HR1AcyN/100nXo824Q68CfnNMUrTE9GvhqgR6SIsilZ9+rLpDCUMiuRSNnnZTGuewvmeVj9pBZ22xWyuzNKepY27L0LU+JPSrpBvTSKHz0A6dOoRYFsVXMbPwF+/qlk+u3QsNGcX0bkT5CKOWXq3AWkwJtu0ACprPqOg6oJKvlq+CQp8Kp+srtt4ZWL3mMt2DOATEPCiWejRy5IdHqMA3lmt+N62z+HJsXVicCwTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wu7yHOSr5LQw1ISgD/r1sleXDkRYzbDvhbACmVhfh78=;
 b=Vf2wRzSFoXX047TllfbwbFeD56lVutB2ttzP/nXdjEvHThQfNo/NPnlwu/G37+YjKkaQbxfD6ARrhXfMfhTnPlSwLJNIVp31F7Xn6GeG4PSPgr6ndQhw0A+Zhmz1uTr9GO77dTL/0s7CeUiHPtqtKWoRj5IDoQ1uDo5sHqY5hdHG+d0vgTQB33d52gH9MDOapn9SsxnUFOu0Le37p0v8I2jPBFVpY6Qio+ZfLLhFtFCiM9AGzdFZzHrWfssxW2gBNKvGn8aUsECWfzMoq6NDE1mmA0dxWyzbJE8imxfj37RavVmXiR/jMFzmVQPPFXDMwUWhHxe2oXpaK0R2WvD9BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wu7yHOSr5LQw1ISgD/r1sleXDkRYzbDvhbACmVhfh78=;
 b=RBNJU+eoXif1EkG3ILDGedfxPqq2V76kJNDOUkK1xqwGTWxYO3tHVo7+g6an2XgoGPZAMq8ZVNLrEqnz0tSriK43oynv/Om9bhgQgja56SOkbh3zkMYOP8lT3KkNNEng9LgE6yM5LTqE11IdW7g4qOl/20LwwSSonbQOhumeLNTUEPPWcQKCJRugXw+dZZMerUrqQ42jLctFniFTgS6tWiKqNQWGWsQAswJgFLSz+VZvJdpo0WJOEgpAuByUsGVaGLv1obuW3ccDMLi+omS2AptnxHP7MBVXUFhtoEgfRjO8UwlU/WvYtb8fSrfDWW2DlY91GJjsxHO4dHw5oHkw8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA1PR12MB7518.namprd12.prod.outlook.com (2603:10b6:208:419::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Mon, 2 Jun
 2025 21:09:17 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 21:09:17 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Mon, 02 Jun 2025 17:09:15 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <8297D7ED-2220-469A-922D-98C5E5B7671C@nvidia.com>
In-Reply-To: <1f1f1d26-5bbf-498a-b6af-0fb51fb3d50f@redhat.com>
References: <20250602151807.987731-1-ziy@nvidia.com>
 <20250602151807.987731-7-ziy@nvidia.com>
 <7BD9FB05-4125-4EA8-841D-9D08907D01D5@nvidia.com>
 <1f1f1d26-5bbf-498a-b6af-0fb51fb3d50f@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::8) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA1PR12MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb89757-67e7-4cf0-0aa2-08dda219bc5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H54Nfydn29Ws8B5batz6Ff77uD0DHm70LWb5GnompnM59L3D6tXBcPldKuxq?=
 =?us-ascii?Q?Nt8w7JTuIajHak1GyKGrNXupAXfWuwxLRWclR3lHHT9ja22/eAc487gg5Pb/?=
 =?us-ascii?Q?+gpcUeaMwXBqWJuy90Cb2V5RbtM+oR3pVfuVpOg3B7hUXuuZ6CAdkdSb3Zic?=
 =?us-ascii?Q?coObnjDN5U6Pxf6VAqloAGxEqd9ohlPlVNpQYFppR4bplQgneldqh6CE/eMS?=
 =?us-ascii?Q?LMGP2EdwerfmNqDKoZSc7n2c0RCwTUsdWLwhV36x23ykQ3AkLdwIORyttH1L?=
 =?us-ascii?Q?qWJHQc5wtR/hMViiyybwCUM4dq07XGWqBdVb4A8oQEYk6IFopG98OU2t4oAo?=
 =?us-ascii?Q?/Ags7TLR23Lp0kKiyLuZLpnGA8hzhEpKJ8n1Om3eLfaUNYINCA8aDTnfRweX?=
 =?us-ascii?Q?fglIawst0mbzlBAx/j6NSdzNfON0wyIpSjjZ4X0ag2ou3jp116BT4jGoWW5A?=
 =?us-ascii?Q?IFjUS1aWbDPzHmXVIqMcsWLK9iUndXJWEdKzaaBOVRvcO22nWvCKkGYK4kfw?=
 =?us-ascii?Q?QOTDUiko3LSyfCPeMe4h9dl++IG+klvzVMi2j/7XMQfxGwSRf3gxEqNtds+l?=
 =?us-ascii?Q?o4p9tuygEa6rjRhSvAajoGnlzpdKhQKyctnKcY7ZWjr0pzzW/YHyNpb5H1O+?=
 =?us-ascii?Q?ktg/d9jRAQ5nE2cYiEYOJl331EWjY88fTwgJgZ0T7PTyn+PWIpykGlAPM02j?=
 =?us-ascii?Q?jwbDdHjVfl31nfSBjEhuG40pa0BHVrPVG4okWEolyv+FUfzDWjxVp2hgR9rn?=
 =?us-ascii?Q?o31EvWSuGAxfXQ8eMfqp+mj06aTIAe77S/XW7IxtVN7qyeoPJy046s/EP7xK?=
 =?us-ascii?Q?4bHp0lZiQAp44+8G7+fcPtKe/feaZdjpa97rDEI+0qeHxBisf1RqneDl08mR?=
 =?us-ascii?Q?bcLzMhb16QSCQOiThJRjIfRZrX8cc47V6IPMK9dtkM2OCCknw11lhPhzR7G5?=
 =?us-ascii?Q?nYGvrtlpGgjFFMCyfLXiBiQEKeiSybPgmY0z5ZPyvJvCf5vGRyGfUy00WAgT?=
 =?us-ascii?Q?P2Umc5HVe4p8Wq/kb7vWqB1+64WvHccunbhKlK+7larkmf65OX9PFVjciOHo?=
 =?us-ascii?Q?5ES3C2um1OtL/7qEf30kY6VQPwIuz6aREAmz1iHaswOtxGbzsbV3wYKqQ1r/?=
 =?us-ascii?Q?zcleSzM3q2MNlwhCmK4kJMLR8BUyI8tP/K0kWS8JL5T+I/G8sSoY7DOLw+Mc?=
 =?us-ascii?Q?RH3rk+LQY6gc9ZYSxyACgs0qgWKO9rWF3C9Yqwtud7FkTY+tbscnzh1ot+Rc?=
 =?us-ascii?Q?Ylk076c2pWrR0xlpq+Kc5/Vc9pYyA4kDNQjOnf00PfIpt3WkPKcLk1u02cnu?=
 =?us-ascii?Q?FQgsIBaF51S27Ck8MJWQny1h1lD21BiYZaz+eqW0IBpqHmuEd9juTQTlh+8j?=
 =?us-ascii?Q?27lZD9AI7XAFiT2HNH1hiJgMnY1DZmplgr8HwEa9DilyVnK3pcilA+fvyiRc?=
 =?us-ascii?Q?VNfqtNjqmwo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k2CeIjYYTZaD422un0X7ABOwhIPRsZQpIsI3Aq5xWW/vLUTjap7Z8ehx9qUf?=
 =?us-ascii?Q?J1fsD5v7VZVdnA8x81FxWB20HIAcjjCy3KXdUb6PNof5jh3YO1yDeuMiqhOC?=
 =?us-ascii?Q?6YgzY5DMxXdUV+Qy4wDwL9FBj6LSxZeJ+B0AlTrQhB7WzFw4AAhr3qZKreA5?=
 =?us-ascii?Q?LBQMVCtVVQwaM+ZJaeM9jDKIYbXNEoFD79si6fXWDxgQfFzErKI3WR0K2Qun?=
 =?us-ascii?Q?HhYSoau4XCo2AxlDOZAkzZFKBKc0D/PnFc1l4lGbjYv4tG29am7MFc9pc3lE?=
 =?us-ascii?Q?Bus24gmpOCqgJ2lrlVoymlFL0gyQmtMtIyCDu2SMzEbzEe2pvLigGvc9SW/e?=
 =?us-ascii?Q?5M71jwHyR7cjGH9yOnxW50cXDXK3QAVMu10v/5SePVdOqVmk1S5GP8s67S3M?=
 =?us-ascii?Q?sqA1MrFUSZsN1M/xGAHrPumZoh60BhJosTvJ3fj7El+1R3PstFG8+rxNlCmN?=
 =?us-ascii?Q?FV92IS3bRVK6IZIE6LLxv2yUFTk9EAEx1/JXAXjCZUtez1NNg565EEJ5vwRB?=
 =?us-ascii?Q?po3sSIoBbJY8HzN2MF+JLUElfrIe0JI7trVjM2bVKzzGyTHQJoe4+m9Zi7rD?=
 =?us-ascii?Q?pFdGdn9HxpvXsJX7k18SBhwI/dUoxAPKwmS8a1ux3ERNgF0iGgorLEjezWx1?=
 =?us-ascii?Q?I5raLd/xnpf3H7UdjDKMXTkM/J5DbMy3eHdcWn8HXazpmg+OHrhM0iI676RI?=
 =?us-ascii?Q?EeEWPhU/mA4tg5/Xn/OCpDhMF67NLWigD0v/rj/AOLp+EVH10amv0Dx/+eEX?=
 =?us-ascii?Q?SZ7GRjVywF6Rz5myxOkM/MtJyhv38+oGj+J2m18BDVNysc97Klyx/EP11ITW?=
 =?us-ascii?Q?AfjXokTS3hQFJ62ijyOUE9JX2rGD/H3ySFkI4vQDQfR2K5L8wNzmd3kzBKeo?=
 =?us-ascii?Q?0Mv0NNgF7iqzc+EGFc6REoFuvud59O8UArOgVpjd5uyeX30wLg/bno1z4PTk?=
 =?us-ascii?Q?kNf+DLZoXLW1ef8Ocg4uY6f+3A9KvD17A06Oaws7fYIGmmfqVqeLj1a56u4j?=
 =?us-ascii?Q?j8UZ4bvWlrCsgPA88jJQZgVnlP2uhAWLV2XbaL/XTx1juYOpvacg0Kt2sldJ?=
 =?us-ascii?Q?hqVeEiWhG9BvCqHDAhM54dteBf7TkrYisaTuRM2hqYDXMWOC+9DOMXFwQPH2?=
 =?us-ascii?Q?IIkHzKt1VojGOGgSrjjD/7y3gAd5w9FEO9WIjpZCElnM4N/d16cdE0zNAZHa?=
 =?us-ascii?Q?ioGMx+9nwD1V7NEdTkGkkaMvtUAPKLYbVXh3tRnp9n6bqNInuwuWgzIghdF3?=
 =?us-ascii?Q?7B97M0uKL9o3T1dEgYcpe7xSFlPu0wUUz+/7TBl+ziuwmsz5sgPi8rLhiA1P?=
 =?us-ascii?Q?7rroZcIkvm1TyoPleiXy4sCVW0IR1PzEp2dLqn7mNyrvfWusV4zhFnyH35lP?=
 =?us-ascii?Q?E0ooGhflKOU2fEbZoUwbs2qArPQwCFkhKZND/GOxU/A8k+1ZFylNQatdGczY?=
 =?us-ascii?Q?W0L5CK4+7D9xQsOfruf3tpnaBrhsoLWPxfIaHfEhU6YOrK5/ju62+JODiT+u?=
 =?us-ascii?Q?Sqs+3nPyk1U8X2nzUqwZXxnKOAJwko4oycy35CqaZdZ+GUNULNG4/V48pC+f?=
 =?us-ascii?Q?1xfqhhn20noRZmLa/ze6KE3KsDvJXRfPp9MXpibP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb89757-67e7-4cf0-0aa2-08dda219bc5b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 21:09:17.5796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czENkcwYX6i0ZPE215IHxxwyAI6ajV0XgAeJi5BrDtJvRcQz/a598NiZeMSfbSw6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7518

On 2 Jun 2025, at 16:59, David Hildenbrand wrote:

> On 02.06.25 18:59, Zi Yan wrote:
>> On 2 Jun 2025, at 11:18, Zi Yan wrote:
>>
>>> migratetype is no longer overwritten during pageblock isolation,
>>> start_isolate_page_range(), has_unmovable_pages(), and
>>> set_migratetype_isolate() no longer need which migratetype to restore=

>>> during isolation failure.
>>>
>>> For has_unmoable_pages(), it needs to know if the isolation is for CM=
A
>>> allocation, so adding PB_ISOLATE_MODE_CMA_ALLOC provide the informati=
on.
>>> At the same time change isolation flags to enum pb_isolate_mode
>>> (PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
>>> PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
>>> PB_ISOLATE_MODE_MEM_OFFLINE, since only PB_ISOLATE_MODE_MEM_OFFLINE
>>> reports isolation failures.
>>>
>>> alloc_contig_range() no longer needs migratetype. Replace it with
>>> PB_ISOLATE_MODE_CMA_ALLOC to tell if an allocation is for CMA. So doe=
s
>>> __alloc_contig_migrate_range().
>>
>> This paragraph should be changed to:
>>
>> alloc_contig_range() no longer needs migratetype. Replace it with
>> a newly defined acr_flags_t to tell if an allocation is for CMA. So do=
es
>> __alloc_contig_migrate_range(). Add ACR_OTHER (set to 0) to indicate
>> other cases.
>>

<snip>

>> +
>> +typedef unsigned int __bitwise acr_flags_t;
>> +#define ACR_OTHER	((__force acr_flags_t)0)	// other allocations
>> +#define ACR_CMA		((__force acr_flags_t)BIT(0))	// allocate for CMA
>
> For FPI I called that "FPI_NONE" -- no special request -- and similarly=
 for RMAP "RMAP_NONE".
>
> So if ACR_CMA is set, it's a CMA allocation, otherwise just an ordinary=
 one.
>
>
> Apart from that LGTM.

Make sense. Thanks. This is the rename fixup.

=46rom ba6ff91746640e5baccbf55a48f9290a04ec1363 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Mon, 2 Jun 2025 17:05:19 -0400
Subject: [PATCH] rename ACR_OTHER to ACR_NONE.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 drivers/virtio/virtio_mem.c | 2 +-
 include/linux/gfp.h         | 2 +-
 mm/page_alloc.c             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 6bce70b139b2..42ebaafb9591 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1243,7 +1243,7 @@ static int virtio_mem_fake_offline(struct virtio_me=
m *vm, unsigned long pfn,
 		if (atomic_read(&vm->config_changed))
 			return -EAGAIN;

-		rc =3D alloc_contig_range(pfn, pfn + nr_pages, ACR_OTHER,
+		rc =3D alloc_contig_range(pfn, pfn + nr_pages, ACR_NONE,
 					GFP_KERNEL);
 		if (rc =3D=3D -ENOMEM)
 			/* whoops, out of memory */
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 95065cec85e5..ccf35cc351ff 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -425,7 +425,7 @@ extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *=
vma);
 #ifdef CONFIG_CONTIG_ALLOC

 typedef unsigned int __bitwise acr_flags_t;
-#define ACR_OTHER	((__force acr_flags_t)0)	// other allocations
+#define ACR_NONE	((__force acr_flags_t)0)	// ordinary allocation request=

 #define ACR_CMA		((__force acr_flags_t)BIT(0))	// allocate for CMA

 /* The below functions must be run on a range from a single zone. */
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index c12442fdb579..0867e2b2e187 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6997,7 +6997,7 @@ static int __alloc_contig_pages(unsigned long start=
_pfn,
 {
 	unsigned long end_pfn =3D start_pfn + nr_pages;

-	return alloc_contig_range_noprof(start_pfn, end_pfn, ACR_OTHER,
+	return alloc_contig_range_noprof(start_pfn, end_pfn, ACR_NONE,
 					 gfp_mask);
 }

-- =

2.47.2



Best Regards,
Yan, Zi
