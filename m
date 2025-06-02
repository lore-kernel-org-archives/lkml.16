Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA2F253F22
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 23:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748908390; cv=fail; b=j3X1GY+d9xnH7o47vusvyKvRJXZXwTGbhVNTXICdLET3mCvoJCpbXfFwW76iM0+/QhzcqAsSg6bgKj8CViHeIGncv+LaQ8yWmKKwhe3GaMgRyB6f58J5jdGvg6xm4rJe6+ycVz3Z9D2JyJnxeso33TQXBfsaN26Gqm57zPlu/P4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748908390; c=relaxed/simple;
	bh=LhxcHub0OtdzSA45orzN+aD1TFgllLctkqv00XizHAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RgrtDuNCOh2Cp8sbBP7qAFz0rVNxvLj11TBtVBWwOk0hgkhEfjhQ1HxCpYR7wguq9y4OWjIKAsApZNbyyO3zLVekOr9evqDs7Hlkk26Ie2/GnHZbATGKtn4Ej9dkd/oEZYkZzuHd3tVRAxd4G6c8JcsJLr9mqZjhk+F2dybQwak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=usErkH+k; arc=fail smtp.client-ip=40.107.236.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="usErkH+k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooiCkTZeUX+sFEa2DjRirXhFxT8r+ZlpnV5XWbe+7rwktiEgw1coW6Tl49BFkQ9gHxYjPLUr/rQHXoou6TEABF5CtlDcMtYeNYtyX3OTP7HXfC4a6IfPB4570UlpkU8diYKITkRSnIXrNQ5jFnOkpJ3k8ZhtUNUbDQtYLbBIEdq5IYJ3AK6Yr+xu+LIjq/V+t68Z5w23zn9Nb1Z5omEFVCf/UKssi6WvvKh1wrBbzN5cbQE6cp8ou8mT96wz01hU9P59ubzBFgsgM6xM1ajI9/azNOFwCwZCVhrT2OBIZ7IEfZdRx4O32R1U/BVXwDOAXQWppLZ36yFjybydC5MVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHSzkPLbidH6Z9sxeXvVezSWHaVdGptkKez5GwKTgDg=;
 b=HBkbEiESmTnt1QvUEnvr8CZY6/rXkfcGlZhm+xvrvtCEjEDq78rr7yIBV2/bxGrFctTQ8uvfNhP9qnasXmqM7RBxdhZ+vmyc4G7HJ1pgHpFV9t/beZVDHg+/g/PjZ20Oj4cmb7pKJD6/xGPsgIhKJr+0ycDfqu8flYaXQsyXQA8tBRIxIPS/vkcX3VUCTFxugmbx7gmWnw3R/EggDipAP5OjKMh+vLPyLB51kO83hKRZxx7xOvtMWJdPDK2cNWgIqJtxJBdRQmnJicBP66iUA7bvwUBy90bq45p+duCvC48CQZ4Zy7g7cPJSuZ0JyhDU4rWdaiP63OtIr88FxMqr7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHSzkPLbidH6Z9sxeXvVezSWHaVdGptkKez5GwKTgDg=;
 b=usErkH+kHSryLJAtaDXsSUJqyzr1ssI7kw7MXe0Gv31dP87vomalaeRzU3bnbW2SxNXH5lHC+rjs73XZuiQeZNZzwZt2HJObL/6V93+knBfXTVh6dLJrHlnQA5zrDz7XnVtSenEUHQgZfobK+ZiKivRDfFSD67sTXvze87B+HZCRIpn6YsGW4143sLbu97/+jLhf0HJBDcpXpCaJ+0VrrrRc5OZg+zEQHg6YanF39PmNtf7QgK5patGvBiffElFfFyCnQRdwkjzxsdqQciZ6vTvVWamOgdCkh7+BroF1uVvr8nnqgbXrygGNUtU/UVTXw5gVf7jyp1v0zKD8v1O8jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV2PR12MB5726.namprd12.prod.outlook.com (2603:10b6:408:17e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.37; Mon, 2 Jun 2025 23:53:02 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 23:53:02 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v8 4/6] mm/page_isolation: remove migratetype from move_freepages_block_isolate()
Date: Mon,  2 Jun 2025 19:52:45 -0400
Message-ID: <20250602235247.1219983-5-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250602235247.1219983-1-ziy@nvidia.com>
References: <20250602235247.1219983-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:208:160::38) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV2PR12MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c3092f-cc22-48ad-59e2-08dda2309c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eM7G8o089aIuU/pv2HhbL14uSMPFa57/94K9Ufvk/LKoHv9lLBCs+sqlw1NM?=
 =?us-ascii?Q?U4YAJP6rYPCi1mPejHIEEZCP88Mb4RFcyqtLFbf1owVI87WIcPPIuvCOk4R0?=
 =?us-ascii?Q?3jydk+A1pxIm2QfZt7WWvi827RkN0NKslxy6NxXb/5AFlmUe3K9nVoJreSNY?=
 =?us-ascii?Q?oQEhnuiIuIr+mCWfOlIcMEEoAVKZ0Kmnx//dc6pn/lWy+m3g3ZlDvc/plp3m?=
 =?us-ascii?Q?6DKHYeUTsUfVCN0KadLd8U8FCjO1hoDgLRaUGyhwMa1o2DqdriHnU9+cZS75?=
 =?us-ascii?Q?frVd/oQV5gwoM7MOYnwEtIhpduNOajFSZC3y0Jd9wJc6J6ZsThuuJP/ZRl9m?=
 =?us-ascii?Q?uDK3L+fX27zbbTrA1ZHPZw2ZVMP+wbWiDSYlU/gJwISFW78ETWSo3STHqC6d?=
 =?us-ascii?Q?SZTI7E667xIuG1+EXVJ+lzRkgeyC0b8d9Q6GXcOpO3j8tozcakJ/fTUvh+Qj?=
 =?us-ascii?Q?3W+h7BtZKRN7nNsRxwgidgvxigi3sYfdf9nZDZ+2yktfHEEwwxTKpIRqElIQ?=
 =?us-ascii?Q?EFX9Vl/QmWHVC4RYslaeg819VVaHNLRaQDH6ZgincYaBjKKUK6fWfH7Gj/hD?=
 =?us-ascii?Q?zFhdjs5Se844+bCuVu1x92CCtN/D7qHrtW9hPelpq4ze1nklImjBM+8cz/vn?=
 =?us-ascii?Q?+4O0GWyQbW8fu8RjatnBx/tMGg4fONSuJzRKICOdLYrGY4r2yFZv0cc8HypM?=
 =?us-ascii?Q?FJoLvN5KHRNslMg8BG4tnd88mvxdlEkUrDORlJo/AbBKicwm+YhjINexGe/r?=
 =?us-ascii?Q?eZPnCrrnWkyxXUfpQyW+iCrsT+UgWzvRmKfzDDrtZjEvqrwEOYBthkw2Q97k?=
 =?us-ascii?Q?04nzZ7CevfWRBtJsMYlc1hm0xmttWojmjBpJkoervXuaF3chCOBoBOzN9qdj?=
 =?us-ascii?Q?IfJrp71mCngqeTUCSOh7uCV5PS7/yUBHdso0q8emG0c0PL2rP/glEwaain+D?=
 =?us-ascii?Q?g3fUBsiPWedzB/qQ1o/eAgZRHtKcJY7rdlVvSXjFl+z3+mquB9efzUNCV1c3?=
 =?us-ascii?Q?TRWshQWsFd2/V1/C4cfydk0jxOljEvbQ7BUftV5l5a/ezIKghBYmKk+dqwxW?=
 =?us-ascii?Q?oZI4bRpw58a4e+GEu2EmZmrz7p+E2LF+OwOMZKm65Zn8tD1hFb4YFznBJUAk?=
 =?us-ascii?Q?TIeBi/BU2qdUqzVVsJSVb0gFyIrdFjyitKGq8CJe4I4B/85dk+TwSIQdsGqn?=
 =?us-ascii?Q?/SamisnDAD5j36PzBp/rUeSxCsq59Z64f0YT80+mDCdiUDtIFeK7rIEP8sNT?=
 =?us-ascii?Q?vYsnKw/Ru7ROMm7NQhjJ1VGETBvIc2w1UzVl042FxrhkTfW86GCYi5esP4RJ?=
 =?us-ascii?Q?zX8a6NjlE+Hh19Rb1YixFprV+kidh723Hns4VNVl3ajk6F7Feo54RknazP52?=
 =?us-ascii?Q?hKGtWn25sE2NmIMOVN1YbiHKDT/jPG6J57L6Lwl3PmkFnRPNIefrOcOz1nt4?=
 =?us-ascii?Q?NDO7poxmZ78=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q+nmbqXrbl76CxBRJnZw1eZLhzhwFz6WwXhnjGHgsrPvFXLaMdDPQiQT1anh?=
 =?us-ascii?Q?EavOLaXeg7BJkDHmVLIQnwEFjTYhrwJ09tn+EzaNPakkuncaIV0vfh9h0Is1?=
 =?us-ascii?Q?2W+bcmsdFK5cPT8086ggrMkPiJavKg7snusATvgGZRVqwX3wybauKPXXOLHw?=
 =?us-ascii?Q?J3MSVu8vnN7MHoWlgumVxoYFlWYExv44lYrFrAke1RJVMN7czHCmzhuNtAaC?=
 =?us-ascii?Q?Md4AmGXC8PdKfgcaDTTGlgo08eYvhhdnndTP6RmuxNpdEPab9oO+8x8uh/UA?=
 =?us-ascii?Q?JVbLet/Rf71bV8OMFFmrJxee3/KzF9iJSifZt3H5JFHOnibr3Xop1r7q/UXx?=
 =?us-ascii?Q?qvUiwVPbr5Qjf1n3cw8ISH0CW8R8lhosp6pzHAfOV+3ai44iVKkZYeue/naq?=
 =?us-ascii?Q?RnFcp756MZSV1UrcLnS1RavhoNzyPEWNNao1IyrM4SMXSyt0N64YuaBHOKLR?=
 =?us-ascii?Q?n9H+tXZifSI0Rfi+6mb47S6JZnKUhEj7Z1A0USssQ0mv51PxLzFhtwe1zumg?=
 =?us-ascii?Q?I5PCOYLaWJPqXELuZNE6yWKNlbZh8GwWdE+NWFh5njpFwd3mHusDUCFVP3GY?=
 =?us-ascii?Q?SJcysVrDjOloWCSzoIGvqX4zYqYCpHn4QI/a0NP+8D90Ni80T5XHri5OjADQ?=
 =?us-ascii?Q?IVlQNQoSIIuXE6jwpP9D84VHnNXZqmsDDDbaMAxyFtWJyR7R3UVbv/NRXpha?=
 =?us-ascii?Q?rPBcH2QBRsNm2AgNePG60c6XRDjRvPizNvOrJrRgDfJ3MAHAzs+84d6WHEBj?=
 =?us-ascii?Q?eIhzfN/ES8Rmcgh0FzaDXyLPFuypx7I0jKpYH2qWQftzYNv0I5sorYaXqNe8?=
 =?us-ascii?Q?nMQF5pSgl5HuWqOICzJWs+X436C7n3+2jppY10jtFNTgnf9eNcdC6SNsb/gR?=
 =?us-ascii?Q?84wFKcseBcBqBUW59YcdokGtGUly8lZSkFC6xmiAhZcANZzx78VuyfA86sio?=
 =?us-ascii?Q?5E7ico2AIjrXnFuF08YOdDA2Ppo2gwpAezNYy9hSq22biYiDoW5sKKNq+0ja?=
 =?us-ascii?Q?yOopp880LAB24HlYscYQPEXhhNlhoHqV0TeP5pPL8V4qW2a0mfPemQ1kINWA?=
 =?us-ascii?Q?q7u7ZL+3cw6DhMkykIN7PHi4TwzeIuBsS1fpgUMTGU0enLnb06Z7GeOUuU9r?=
 =?us-ascii?Q?2hba9Q4i+qEV4jMoXe+QabIOetjz1ENq6SdV2VaAvVM3k+h+ZXh12NZS92pv?=
 =?us-ascii?Q?3s1+Xc08lLYGPDXUQgUh0aSIdVmoH2D2njdPeKry0c1HbxJv9H+8RAvx4B8s?=
 =?us-ascii?Q?9s/kr1UCX4Y1HqXwf5bLZFqyx1yjBKQMFPcq9qeddk4cWx3CZhtk7HcwPD4M?=
 =?us-ascii?Q?Eu3MLhN1GI4YWbYS0Xq91flSAivp2xg6yBACuD3qCAe1ZAnSlRhd6SqkWxfv?=
 =?us-ascii?Q?AJ/526H61+22mmby3orCubN6l3pLf+/+OEE+vA0BSsTezSDEIBgbsPz5bSxv?=
 =?us-ascii?Q?f9adw60ZykcPilVluZzTB0UZytvQlDEoStASY9XPKP/zH50w+7Xc5ETMsdTu?=
 =?us-ascii?Q?q649JQvOJIxxoXHtgS6t7JBagsyi52pIwsni5Jb4MrcH0OSoQZ7yAnXpTlly?=
 =?us-ascii?Q?c7/yA+6Kyn/6Z+0yEOb7sdwdD5NCX8xZBYf8O55f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c3092f-cc22-48ad-59e2-08dda2309c78
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 23:53:02.7141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16d7uXZMtcZ+uZ/7XKzIAwduX1VkM7VcfRCH9DnP1VpvMatZyBN7hlfijlOZ5xfY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5726

Since migratetype is no longer overwritten during pageblock isolation,
moving a pageblock out of MIGRATE_ISOLATE no longer needs a new
migratetype.

Add pageblock_isolate_and_move_free_pages() and
pageblock_unisolate_and_move_free_pages() to be explicit about the page
isolation operations. Both share the common code in
__move_freepages_block_isolate(), which is renamed from
move_freepages_block_isolate().

Add toggle_pageblock_isolate() to flip pageblock isolation bit in
__move_freepages_block_isolate().

Make set_pageblock_migratetype() only accept non MIGRATE_ISOLATE types,
so that one should use set_pageblock_isolate() to isolate pageblocks.
As a result, move pageblock migratetype code out of
__move_freepages_block().

Signed-off-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-isolation.h |  5 +--
 mm/page_alloc.c                | 80 ++++++++++++++++++++++++++--------
 mm/page_isolation.c            | 21 +++++----
 3 files changed, 75 insertions(+), 31 deletions(-)

diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 14c6a5f691c2..7241a6719618 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -44,10 +44,9 @@ static inline void set_pageblock_isolate(struct page *page)
 void __meminit init_pageblock_migratetype(struct page *page,
 					  enum migratetype migratetype,
 					  bool isolate);
-void set_pageblock_migratetype(struct page *page, enum migratetype migratetype);
 
-bool move_freepages_block_isolate(struct zone *zone, struct page *page,
-				  int migratetype);
+bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page);
+bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
 
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 			     int migratetype, int flags);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 92a368d38d77..6ddf4fd6b2bd 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -525,8 +525,8 @@ void clear_pfnblock_bit(const struct page *page, unsigned long pfn,
  * @page: The page within the block of interest
  * @migratetype: migratetype to set
  */
-__always_inline void set_pageblock_migratetype(struct page *page,
-					       enum migratetype migratetype)
+static void set_pageblock_migratetype(struct page *page,
+				      enum migratetype migratetype)
 {
 	if (unlikely(page_group_by_mobility_disabled &&
 		     migratetype < MIGRATE_PCPTYPES))
@@ -534,9 +534,13 @@ __always_inline void set_pageblock_migratetype(struct page *page,
 
 #ifdef CONFIG_MEMORY_ISOLATION
 	if (migratetype == MIGRATE_ISOLATE) {
-		set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
+		VM_WARN_ONCE(1,
+			"Use set_pageblock_isolate() for pageblock isolation");
 		return;
 	}
+	VM_WARN_ONCE(get_pfnblock_bit(page, page_to_pfn(page),
+				      PB_migrate_isolate),
+		     "Use clear_pageblock_isolate() to unisolate pageblock");
 	/* MIGRATETYPE_AND_ISO_MASK clears PB_migrate_isolate if it is set */
 #endif
 	__set_pfnblock_flags_mask(page, page_to_pfn(page),
@@ -1923,8 +1927,8 @@ static inline struct page *__rmqueue_cma_fallback(struct zone *zone,
 #endif
 
 /*
- * Change the type of a block and move all its free pages to that
- * type's freelist.
+ * Move all free pages of a block to new type's freelist. Caller needs to
+ * change the block type.
  */
 static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
 				  int old_mt, int new_mt)
@@ -1956,8 +1960,6 @@ static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
 		pages_moved += 1 << order;
 	}
 
-	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
-
 	return pages_moved;
 }
 
@@ -2015,11 +2017,16 @@ static int move_freepages_block(struct zone *zone, struct page *page,
 				int old_mt, int new_mt)
 {
 	unsigned long start_pfn;
+	int res;
 
 	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL))
 		return -1;
 
-	return __move_freepages_block(zone, start_pfn, old_mt, new_mt);
+	res = __move_freepages_block(zone, start_pfn, old_mt, new_mt);
+	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
+
+	return res;
+
 }
 
 #ifdef CONFIG_MEMORY_ISOLATION
@@ -2047,11 +2054,19 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
 	return start_pfn;
 }
 
+static inline void toggle_pageblock_isolate(struct page *page, bool isolate)
+{
+	if (isolate)
+		set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
+	else
+		clear_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
+}
+
 /**
- * move_freepages_block_isolate - move free pages in block for page isolation
+ * __move_freepages_block_isolate - move free pages in block for page isolation
  * @zone: the zone
  * @page: the pageblock page
- * @migratetype: migratetype to set on the pageblock
+ * @isolate: to isolate the given pageblock or unisolate it
  *
  * This is similar to move_freepages_block(), but handles the special
  * case encountered in page isolation, where the block of interest
@@ -2066,10 +2081,18 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
  *
  * Returns %true if pages could be moved, %false otherwise.
  */
-bool move_freepages_block_isolate(struct zone *zone, struct page *page,
-				  int migratetype)
+static bool __move_freepages_block_isolate(struct zone *zone,
+		struct page *page, bool isolate)
 {
 	unsigned long start_pfn, pfn;
+	int from_mt;
+	int to_mt;
+
+	if (isolate == get_pageblock_isolate(page)) {
+		VM_WARN_ONCE(1, "%s a pageblock that is already in that state",
+			     isolate ? "Isolate" : "Unisolate");
+		return false;
+	}
 
 	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL))
 		return false;
@@ -2086,7 +2109,7 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 
 		del_page_from_free_list(buddy, zone, order,
 					get_pfnblock_migratetype(buddy, pfn));
-		set_pageblock_migratetype(page, migratetype);
+		toggle_pageblock_isolate(page, isolate);
 		split_large_buddy(zone, buddy, pfn, order, FPI_NONE);
 		return true;
 	}
@@ -2097,16 +2120,38 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 
 		del_page_from_free_list(page, zone, order,
 					get_pfnblock_migratetype(page, pfn));
-		set_pageblock_migratetype(page, migratetype);
+		toggle_pageblock_isolate(page, isolate);
 		split_large_buddy(zone, page, pfn, order, FPI_NONE);
 		return true;
 	}
 move:
-	__move_freepages_block(zone, start_pfn,
-			       get_pfnblock_migratetype(page, start_pfn),
-			       migratetype);
+	/* Use MIGRATETYPE_MASK to get non-isolate migratetype */
+	if (isolate) {
+		from_mt = __get_pfnblock_flags_mask(page, page_to_pfn(page),
+						    MIGRATETYPE_MASK);
+		to_mt = MIGRATE_ISOLATE;
+	} else {
+		from_mt = MIGRATE_ISOLATE;
+		to_mt = __get_pfnblock_flags_mask(page, page_to_pfn(page),
+						  MIGRATETYPE_MASK);
+	}
+
+	__move_freepages_block(zone, start_pfn, from_mt, to_mt);
+	toggle_pageblock_isolate(pfn_to_page(start_pfn), isolate);
+
 	return true;
 }
+
+bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page)
+{
+	return __move_freepages_block_isolate(zone, page, true);
+}
+
+bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page)
+{
+	return __move_freepages_block_isolate(zone, page, false);
+}
+
 #endif /* CONFIG_MEMORY_ISOLATION */
 
 static void change_pageblock_range(struct page *pageblock_page,
@@ -2298,6 +2343,7 @@ try_to_claim_block(struct zone *zone, struct page *page,
 	if (free_pages + alike_pages >= (1 << (pageblock_order-1)) ||
 			page_group_by_mobility_disabled) {
 		__move_freepages_block(zone, start_pfn, block_type, start_type);
+		set_pageblock_migratetype(pfn_to_page(start_pfn), start_type);
 		return __rmqueue_smallest(zone, order, start_type);
 	}
 
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index b2fc5266e3d2..08f627a5032f 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -188,7 +188,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 	unmovable = has_unmovable_pages(check_unmovable_start, check_unmovable_end,
 			migratetype, isol_flags);
 	if (!unmovable) {
-		if (!move_freepages_block_isolate(zone, page, MIGRATE_ISOLATE)) {
+		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
 			spin_unlock_irqrestore(&zone->lock, flags);
 			return -EBUSY;
 		}
@@ -209,7 +209,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 	return -EBUSY;
 }
 
-static void unset_migratetype_isolate(struct page *page, int migratetype)
+static void unset_migratetype_isolate(struct page *page)
 {
 	struct zone *zone;
 	unsigned long flags;
@@ -262,10 +262,10 @@ static void unset_migratetype_isolate(struct page *page, int migratetype)
 		 * Isolating this block already succeeded, so this
 		 * should not fail on zone boundaries.
 		 */
-		WARN_ON_ONCE(!move_freepages_block_isolate(zone, page, migratetype));
+		WARN_ON_ONCE(!pageblock_unisolate_and_move_free_pages(zone, page));
 	} else {
-		set_pageblock_migratetype(page, migratetype);
-		__putback_isolated_page(page, order, migratetype);
+		clear_pageblock_isolate(page);
+		__putback_isolated_page(page, order, get_pageblock_migratetype(page));
 	}
 	zone->nr_isolate_pageblock--;
 out:
@@ -383,7 +383,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
 		if (PageBuddy(page)) {
 			int order = buddy_order(page);
 
-			/* move_freepages_block_isolate() handled this */
+			/* pageblock_isolate_and_move_free_pages() handled this */
 			VM_WARN_ON_ONCE(pfn + (1 << order) > boundary_pfn);
 
 			pfn += 1UL << order;
@@ -433,7 +433,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
 failed:
 	/* restore the original migratetype */
 	if (!skip_isolation)
-		unset_migratetype_isolate(pfn_to_page(isolate_pageblock), migratetype);
+		unset_migratetype_isolate(pfn_to_page(isolate_pageblock));
 	return -EBUSY;
 }
 
@@ -504,7 +504,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	ret = isolate_single_pageblock(isolate_end, flags, true,
 			skip_isolation, migratetype);
 	if (ret) {
-		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
+		unset_migratetype_isolate(pfn_to_page(isolate_start));
 		return ret;
 	}
 
@@ -517,8 +517,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 					start_pfn, end_pfn)) {
 			undo_isolate_page_range(isolate_start, pfn, migratetype);
 			unset_migratetype_isolate(
-				pfn_to_page(isolate_end - pageblock_nr_pages),
-				migratetype);
+				pfn_to_page(isolate_end - pageblock_nr_pages));
 			return -EBUSY;
 		}
 	}
@@ -548,7 +547,7 @@ void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 		page = __first_valid_page(pfn, pageblock_nr_pages);
 		if (!page || !is_migrate_isolate_page(page))
 			continue;
-		unset_migratetype_isolate(page, migratetype);
+		unset_migratetype_isolate(page);
 	}
 }
 /*
-- 
2.47.2

