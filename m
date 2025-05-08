Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4181DB366
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718058; cv=fail; b=GaHpgsrznwo9asnWkHRK2BXl/v4YVLJ2JrCL/UYZ5AIz4xrI2VemUkZwznrj2XEpvzA+TfgsrL+GR9mMJDDu/DAcMcVDCb/dB1WCylrav4B4C0BJSHtn3TJzXyI+UInk2IucrkMoPxJiX3tnIlD1pIt2SN1Mc/eHCIPfrR7laJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718058; c=relaxed/simple;
	bh=A31G7PVrEdjoqxl+fgS0txTGv4BrxbIpwE6wQ/qd2h4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lfdrmPlcXi9Kbze47x7SoRZIYhp9x7n5ktq23k38wKJMBjvge8QC6bOY/akzeAcL5llnHQnpl9lBT4HmKxW7Tar50CSpLKwSGGKMSHWhpyrX3+ULd5U682q1abLZcE4smVe8ObjJTWpgIviWQArLV/IGuIySwgzB0QsDmQETuhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fVicqX+5; arc=fail smtp.client-ip=40.107.237.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fVicqX+5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wp5jNg0HHZ4ogVBnW1G8X9Nl5NUMJ5yjZC5yng/jNu0feG+T0Gw0Q7iMBliyWGZdLJ0fMSd+ia0+lZ5SuVIatHZ5kHMDKOMVyjrHVIalgRiInIJiXSzTz4gLP0cOpCIK0u3hGpMZ+9rBOcNX3HhzPcmibI7P/9B0SLWQAuY2+z3/b2b/RMBUmF9JLfuJO5yO8j4zSB25IippXu6m5c3zkzpR1D5UhkLf19/L/oAmfynGhDLddjrNGM4q5f0PE80IMtdZGdpG+2lOzOZCVwb0f1bVED/xIVJzq9oISk4qkQuWAYyhhmOqtH36C0q7cFcQHZzOWGCGn81q1+zpEj65JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UforrpO7Gyq9v+NF7UwAeTiZVOdyanhRmbIKQuUZxR4=;
 b=aFU2pUYSENJt4kmQiUCG9MA7l0UjtbQ70bHhhq2/e6rAtDwxEdaZkdlUUh+bsczsHElpmQPrhrgrtUqeOTNnwFtwLxI/g0bpAeyHqFMDN9KlpeMgJlKp1Mt4JVsWXBUC9EOvpQIfXk0qz54j3l/ymvVkXJHn44ac44x+qGp1AL+tUw4qa3uRsDTiJCzIx2t31AfP+azAs8OUiC2/ULRQCYlXdj2eZRydITMy+bMbuIE0bjsn6iBm8qXAeLUH6QzE/aN/Ol582Y33tnGfvWCpbRr5ni8im2TBohDV6VxYlu+duhZ8jRh14Qnw+43zzoi3obI9wK4AJmQwJCp10WExDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UforrpO7Gyq9v+NF7UwAeTiZVOdyanhRmbIKQuUZxR4=;
 b=fVicqX+57caFC+GQIpq8jdjwtfN50ay/M/cQ7rtinFNx3+Thl58P+83OqzGSDVxDsLQ4HeMGfyWoZQR7FNXKsOQLgFpGL8S0Ei25VbqNSKySksGi0ZxMdXdybV+AqBDdKsSAL+hey6jBRn55sviSBLjuA1X4XUDI567bOCIEYhEqaZoPwseIGDYzV1hznkwe9vg6n7aYdjxe3hQHh0nhoEjMB/g6MTfIBz1V9dm9CWRDDuKlFsdiEB5wdFSTjEvOizuou/tkEJjQ1kferPXYWOwt0ZU7At9De18R+LTbDX4JGiVAtDfBFmvi7bY2bgEPaRIXBGpbXeAVZYyTb5mp4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW4PR12MB7192.namprd12.prod.outlook.com (2603:10b6:303:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 15:27:30 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 15:27:30 +0000
From: Zi Yan <ziy@nvidia.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mm/page_isolation: make page isolation a
 standalone bit.
Date: Thu, 08 May 2025 11:27:28 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <13898284-B62B-412D-A592-856406F7D7C0@nvidia.com>
In-Reply-To: <20250508052409.GB320498@cmpxchg.org>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-2-ziy@nvidia.com>
 <20250508052409.GB320498@cmpxchg.org>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:208:236::23) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW4PR12MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 602f9b34-7e3e-4f07-3cd7-08dd8e44d900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I0axNTChjRx5cmViLQLZ5F3xGX3LWC61TRFYIkpqLigeg35JbqJ0ulM2PBCn?=
 =?us-ascii?Q?zYBqrCmjsesVpnKB4fVoxEx+SyA6Fo1za+y/1NZNUK1QsAUpjlmHnl+47nCd?=
 =?us-ascii?Q?3CzEDugSDPeKMzl/OulQhoJTW5K8gIRr483LKl9x+tQ3gXekyhHk9ys0GTln?=
 =?us-ascii?Q?93PeYCSLBbv/sis9y3t/0cDuhaGOeZqk8OgzFNksxB8yyQmoGe5TL0Ihss+r?=
 =?us-ascii?Q?JSBgSMoQ7sGjnhuOLeITPsMzpmsmRckZE3tDUZ99d0PQVd8rZ9+jzrFgkSwd?=
 =?us-ascii?Q?/C+mY1EabaUuJ4MOtPAiPYa8fgw7SzDOl2/HJLu7aGQXgEB7eLev3VweZq8Y?=
 =?us-ascii?Q?Sf4FUX+4oSw4sO8BQxVCnYS0yjeQG8yawCJ5TJONbxlaQKc+Kfk4zxlJ+4Yh?=
 =?us-ascii?Q?CYenfyum6LVojJLLMOi3QRYkslrddKTxT/JSTAr2EAq/zWsT0dWg1OCf5D0H?=
 =?us-ascii?Q?MlZ6+oWXCaOx5EVhT8lb8GQlDZg71TYbPWzoocKmLsLuKTPjkrT/kJFwuD6b?=
 =?us-ascii?Q?gRu/43A0xjLP6zkJXeZsaxUghh4zICMQU368gSh6+nP1zJMnulvtw5eUQBCN?=
 =?us-ascii?Q?o5tdhqOpwxqJMUUCSRqgmXCncVH7R09F3PIS+8CtvlLbAyZq5L2D9e12On/w?=
 =?us-ascii?Q?Uw9hgSN1inVQnmVxoX4uzuRSE0F66Mdn7zQYSyJxFoqhWhGlqltJOKnPp6X+?=
 =?us-ascii?Q?vdfv5hR52Hhh0BXdBTy6gEoA4mQMCNjSo94mBgXksNEHd0maEaoOFbET3nul?=
 =?us-ascii?Q?Wn68FrM6qLy5EiDdR9aMknIPkV8YJ4pxtZDf86iZqu+DmIWc9ItAejWkaOGq?=
 =?us-ascii?Q?tdPVo1ozWm/bbYoForhEJK0bKd2BmOxNXUXRD8CQ/McHYtdOyT42mHNfpCaZ?=
 =?us-ascii?Q?BThPzw1Efd9DE3zz3F8/RMYM2Lnror9O7NeAbVS8Y4SB/kz2UQ73/T1GgG7w?=
 =?us-ascii?Q?Q8rH/WSJqgym+hDw7X9xzt4NmnmS/VHruUsN7p38WikfLz0HpwmTJrxdWRs/?=
 =?us-ascii?Q?RvVkOfpFeswafVJDLQ0x4gpuaPfwRUox7eseWeEas7mWCUYvKoEg60vgS0wd?=
 =?us-ascii?Q?2ZaGEHCcIn4m7JTLUYCL5ylR2CjZncaVhbQ56MyHXltY34MxFtZxh9LjTgYK?=
 =?us-ascii?Q?luA2Yu+drJ9l750PL2aP5qQz5WntII4q6xMwv74wuS2Jki2u7WA1nN4Wd3G7?=
 =?us-ascii?Q?47CrgpJetYaqQUWufGUvSGhYRpGdN+hMpKXkyoLSPGgmq8ZP7xvku2WVOSZV?=
 =?us-ascii?Q?Dyw3QOgIQaGTAMNcSxqu0++PjGhKpE7R7XsmwOzPFoPt65mNofNb5o3wChCE?=
 =?us-ascii?Q?0r1FhEEXW49C+EMVxM4z7LxnyVeUuKHItoe5JRTHbDIkNsxkAqkq9+31Uh4p?=
 =?us-ascii?Q?TzobzaMOw3Zd1AmuhXbQ9SB8fcnRIVsQFFPw9Nxzi3gwiN6obuY0NEFABFRY?=
 =?us-ascii?Q?nl+B5eoOxxk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t6gWFQjtZnGNX3zokq+uG1bcGukJzgOhNZoyXQiFj4LCTsQBZQCBI16JjgOp?=
 =?us-ascii?Q?cc+dLSFuUkUez9yCN0k6JxnwQrPp5AroflKX8GKWHCirvTWhRlTonBcmY22M?=
 =?us-ascii?Q?Idqx1GhSTGVgtkfPD0GuUennAOgNICN6qfibxdFvSsS2vomhhajaGOb1Gm6R?=
 =?us-ascii?Q?yL9mSd+aCZ7Jdc8I1pvqrVkz94xLb/akCtORltTpv+/Tt/5WhMTWvAEiDlQw?=
 =?us-ascii?Q?xAZSa9EtLrkX7ogv9WqgYAJ0yxs8PltBw1ndBQ9YyqRaaUw1G29rSYhTTF8v?=
 =?us-ascii?Q?XBm6ZvfBYnTilSKnzQ5MLtG7BNYMPCaloJ8EB45dLk258LhU4saQacimVYmF?=
 =?us-ascii?Q?2JJAoiAOL4/Xbg+XMWpeZFI8pH8CHXathaEuNp72KixaEuS4vdEhdr5phkE3?=
 =?us-ascii?Q?TYEtZCz0dRmypcMC6u9Kda/VCJ5VBwB+FcPtI+T1x1GOkz1pys0DpPKNy0X/?=
 =?us-ascii?Q?TR7XDbaymKMgSWxzkyIMMQZsVEFupNIqOuczcMmjc808HGmBBRpob2koG1Jn?=
 =?us-ascii?Q?IJJmRMMqrtu+YU1/WHc/GmR8lPqHqHysm1xtjlppV4S317LVMrsCE0iXZl6O?=
 =?us-ascii?Q?PKrFEbubAbNl3/NNaa/7bgENsutG546hqgG1uhVjfMuZQcSsvmZOGHGNWLOo?=
 =?us-ascii?Q?kUg1BBrdi89o6/Ai0hUG1HuAtgmiK9vFs+zHBno7KDWL98w5xbNTK3hbWlec?=
 =?us-ascii?Q?Imi6fB+tjmQxn679bAkyfkRfILDjXFwyf9gdjxV7kz0NRBq1/q3jOfYtA38U?=
 =?us-ascii?Q?HR7rpcnWgLebqrR4Cw2+Bjv6c5jn8Nk582EX4x3wM8IFtOOtc2OEIwtcdsSk?=
 =?us-ascii?Q?EPs5y1U5JQwk0+Wpm8PpCYV0Ma3Ko3Xe/ud9zQQ8MF/Nb0MOt4YiwRjERMwd?=
 =?us-ascii?Q?S4qPEvQk2BtIDc0C1r2aXs21YXrCwPB1vRnZRZrk4pFD+Fxo1PBusVYMzRjq?=
 =?us-ascii?Q?qZRuVq7K6Aa3p3zPihAHdh70iE251Ali+ZdX7+0rfzJK4glRMo1GYH9vXd8m?=
 =?us-ascii?Q?9IBKNgxgd/BeKGNr+uy5Wdym9y1fUzFTHASkqKBLCVAR3NhuUsZUg+24zw/e?=
 =?us-ascii?Q?Znw3KEzDO7IAdUAjKOf4cYgmR5dIOxf4e8Je/SWijaR+yFdN85aRfhkI6wn+?=
 =?us-ascii?Q?eHtTmydEMcXtciCOMoHGuwk0iMuh8ZkzHnGW5jTDJyL7UrKRXo7oChYJ5fHO?=
 =?us-ascii?Q?pov39LL8HFA3p2cjS1fafP8WBpeCA49eH6vZ8I7zZkqxW4gZ0sxqDrdxWUMk?=
 =?us-ascii?Q?TN7IVEz7BtGIeEI9EbszAAfjC/a6BLufIVToPGP8a1DSeYu99/fpmV9698gD?=
 =?us-ascii?Q?AHE3RnR0CGYL/C47iE6VwF6eXl49YQ36NrdtN7Vg5s5le/p58OcRbee/iKuu?=
 =?us-ascii?Q?Jfe9PyYv12heREO8mJWyyCXCHllQ2usmOjT301/gw+/ltaMVwa8yfT7yCLBd?=
 =?us-ascii?Q?9xELL/Z3FUjG7MU86Q15uQVHceRy3kVXVE5k8rVJhMV2IxmlSiJju/VhLO8M?=
 =?us-ascii?Q?QCAJvzKn0HPsGXYrRh9+oaNqPoLuROTi7Gj+rJijI35k6iSHLSPKiELEIoFi?=
 =?us-ascii?Q?oyuq4Q0/elVLbWcARdtJiaki2Cwa8iy9pQzfLj9h?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 602f9b34-7e3e-4f07-3cd7-08dd8e44d900
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 15:27:30.7563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Yu4Ksn6Toj+uQlalFfanPWqWxdd4/v2fEUaIt+w/jkmiQ3o5QjndCLMU8VPXFnd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7192

On 8 May 2025, at 1:24, Johannes Weiner wrote:

> On Wed, May 07, 2025 at 05:10:56PM -0400, Zi Yan wrote:
>> During page isolation, the original migratetype is overwritten, since
>> MIGRATE_* are enums and stored in pageblock bitmaps. Change
>> MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, lik=
e
>> PB_migrate_skip, so that migratetype is not lost during pageblock
>> isolation. pageblock bits needs to be word aligned, so expand
>> the number of pageblock bits from 4 to 8 and make PB_migrate_isolate b=
it 7.
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>  include/linux/mmzone.h          | 17 ++++++++++----
>>  include/linux/page-isolation.h  |  2 +-
>>  include/linux/pageblock-flags.h | 33 +++++++++++++++++++++++++-
>>  mm/page_alloc.c                 | 41 ++++++++++++++++++++++++++++++++=
-
>>  4 files changed, 86 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index b19a98c20de8..9ec022a0b826 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -106,14 +106,23 @@ static inline bool migratetype_is_mergeable(int =
mt)
>>
>>  extern int page_group_by_mobility_disabled;
>>
>> -#define MIGRATETYPE_MASK ((1UL << PB_migratetype_bits) - 1)
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +#define MIGRATETYPE_MASK ((BIT(PB_migratetype_bits) - 1) | PB_migrate=
_isolate_bit)
>> +#else
>> +#define MIGRATETYPE_MASK (BIT(PB_migratetype_bits) - 1)
>> +#endif
>>
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +unsigned long get_pageblock_migratetype(const struct page *page);
>> +#else
>>  #define get_pageblock_migratetype(page)					\
>>  	get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
>>
>> -#define folio_migratetype(folio)				\
>> -	get_pfnblock_flags_mask(&folio->page, folio_pfn(folio),		\
>> -			MIGRATETYPE_MASK)
>> +#endif
>> +
>> +#define folio_migratetype(folio)					\
>> +	get_pageblock_migratetype(&folio->page)
>> +
>>  struct free_area {
>>  	struct list_head	free_list[MIGRATE_TYPES];
>>  	unsigned long		nr_free;
>> diff --git a/include/linux/page-isolation.h b/include/linux/page-isola=
tion.h
>> index 898bb788243b..51797dc39cbc 100644
>> --- a/include/linux/page-isolation.h
>> +++ b/include/linux/page-isolation.h
>> @@ -5,7 +5,7 @@
>>  #ifdef CONFIG_MEMORY_ISOLATION
>>  static inline bool is_migrate_isolate_page(struct page *page)
>>  {
>> -	return get_pageblock_migratetype(page) =3D=3D MIGRATE_ISOLATE;
>> +	return get_pageblock_isolate(page);
>
> The old version still works, right?
>
> It would match is_migrate_isolate() a bit better, but no strong
> feelings either way...

Yes and compiler should generate the same code. OK, I will drop this.

>
>>  static inline bool is_migrate_isolate(int migratetype)
>>  {
>> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock=
-flags.h
>> index 0c4963339f0b..9fadae5892b2 100644
>> --- a/include/linux/pageblock-flags.h
>> +++ b/include/linux/pageblock-flags.h
>> @@ -20,7 +20,10 @@ enum pageblock_bits {
>>  	PB_migrate_end =3D PB_migrate + PB_migratetype_bits - 1,
>>  			/* 3 bits required for migrate types */
>>  	PB_migrate_skip,/* If set the block is skipped by compaction */
>> -
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	PB_migrate_isolate =3D 7, /* If set the block is isolated */
>> +			/* set it to 7 to make pageblock bit word aligned */
>> +#endif
>>  	/*
>>  	 * Assume the bits will always align on a word. If this assumption
>>  	 * changes then get/set pageblock needs updating.
>> @@ -28,6 +31,10 @@ enum pageblock_bits {
>>  	NR_PAGEBLOCK_BITS
>>  };
>>
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +#define PB_migrate_isolate_bit BIT(PB_migrate_isolate)
>> +#endif
>> +
>>  #if defined(CONFIG_PAGE_BLOCK_ORDER)
>>  #define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
>>  #else
>> @@ -105,4 +112,28 @@ static inline void set_pageblock_skip(struct page=
 *page)
>>  }
>>  #endif /* CONFIG_COMPACTION */
>>
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +#define get_pageblock_isolate(page) \
>> +	get_pfnblock_flags_mask(page, page_to_pfn(page),	\
>> +			PB_migrate_isolate_bit)
>> +#define clear_pageblock_isolate(page) \
>> +	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),	\
>> +			PB_migrate_isolate_bit)
>> +#define set_pageblock_isolate(page) \
>> +	set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,	\
>> +			page_to_pfn(page),			\
>> +			PB_migrate_isolate_bit)
>
> Would it make sense to move these to page_isolation.c? Then they
> wouldn't have to be macros.

Sure. Although I am using get_pageblock_isolate() in mm/page_alloc.c,
I can change it to use get_pageblock_migratetype() =3D=3D MIGRATE_ISOLATE=
=2E

>
>> +#else
>> +static inline bool get_pageblock_isolate(struct page *page)
>> +{
>> +	return false;
>> +}
>> +static inline void clear_pageblock_isolate(struct page *page)
>> +{
>> +}
>> +static inline void set_pageblock_isolate(struct page *page)
>> +{
>> +}
>> +#endif /* CONFIG_MEMORY_ISOLATION */
>> +
>>  #endif	/* PAGEBLOCK_FLAGS_H */
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index c77592b22256..acf68ef041d8 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -381,12 +381,40 @@ unsigned long get_pfnblock_flags_mask(const stru=
ct page *page,
>>  	return (word >> bitidx) & mask;
>>  }
>>
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +unsigned long get_pageblock_migratetype(const struct page *page)
>> +{
>> +	unsigned long flags;
>> +
>> +	flags =3D get_pfnblock_flags_mask(page, page_to_pfn(page),
>> +			MIGRATETYPE_MASK);
>> +	if (flags & PB_migrate_isolate_bit)
>> +		return MIGRATE_ISOLATE;
>> +
>> +	return flags;
>> +}
>
> Since MIGRATETYPE_MASK includes the isolate bit if it exists, I think
> you can share the get_pfnblock_flags_mask() part:
>
> static inline get_pageblock_migratetype(const struct page *page)
> {
> 	unsigned long pfn =3D page_to_pfn(page);
>
> 	flags =3D get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
> #ifdef CONFIG_MEMORY_ISOLATEION
> 	if (flags & PB_migrate_isolate_bit)
> 		return MIGRATE_ISOLATE;
> #endif
> 	return flags;
> }
>
>> +static __always_inline int get_pfnblock_migratetype(const struct page=
 *page,
>> +					unsigned long pfn)
>> +{
>> +	unsigned long flags;
>> +
>> +	flags =3D get_pfnblock_flags_mask(page, pfn,
>> +			MIGRATETYPE_MASK);
>> +	if (flags & PB_migrate_isolate_bit)
>> +		return MIGRATE_ISOLATE;
>> +
>> +	return flags;
>> +}
>> +#else
>>  static __always_inline int get_pfnblock_migratetype(const struct page=
 *page,
>>  					unsigned long pfn)
>>  {
>>  	return get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
>>  }
>
> Same with this one.
>

OK, will change these two.

>>
>> +#endif
>> +
>>  /**
>>   * set_pfnblock_flags_mask - Set the requested group of flags for a p=
ageblock_nr_pages block of pages
>>   * @page: The page within the block of interest
>> @@ -402,8 +430,14 @@ void set_pfnblock_flags_mask(struct page *page, u=
nsigned long flags,
>>  	unsigned long bitidx, word_bitidx;
>>  	unsigned long word;
>>
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	BUILD_BUG_ON(NR_PAGEBLOCK_BITS !=3D 8);
>> +	/* extra one for MIGRATE_ISOLATE */
>> +	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits) + 1);
>> +#else
>>  	BUILD_BUG_ON(NR_PAGEBLOCK_BITS !=3D 4);
>>  	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
>> +#endif
>>
>>  	bitmap =3D get_pageblock_bitmap(page, pfn);
>>  	bitidx =3D pfn_to_bitidx(page, pfn);
>> @@ -426,7 +460,12 @@ void set_pageblock_migratetype(struct page *page,=
 int migratetype)
>>  		     migratetype < MIGRATE_PCPTYPES))
>>  		migratetype =3D MIGRATE_UNMOVABLE;
>>
>> -	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	if (migratetype =3D=3D MIGRATE_ISOLATE)
>> +		set_pageblock_isolate(page);
>
> Are there paths actually doing this after the second patch?
>
> There are many instances that want to *read* the migratetype or
> MIGRATE_ISOLATE, but only isolation code should be manipulating that
> bit through the dedicated set/toggle_pageblock_isolate API.
>
> If there isn't one, it might be good to enforce this with a VM_WARN
> instead.

I checked all set_pageblock_migratetype() callers and do not see
one using it for pageblock isolation. Let me replace the code
with a VM_WARN and add a comment to tell users to use dedicated
pageblock isolation APIs.

Thanks for all the reviews. Let me send the fixup patches.

>
>> +	else
>> +#endif
>> +		set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>>  				page_to_pfn(page), MIGRATETYPE_MASK);
>
> If the branch stays, you could add a `return' to the MIGRATE_ISOLATE
> leg, drop the else and indent this line normally.


--
Best Regards,
Yan, Zi
