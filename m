Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B37E1BD9F0
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622258; cv=fail; b=kgB5+O7Vv+Pokm8+PKEofB4KcSJ9RUHdvqOmknU0+W93o7mYVFpEa+s4klbl7Qu6qqZhumukE+0h3ZjNTW3SyDT5//6u5WN6PjJ1ZIIAmMlnebgI1LyzeS0yXPnjmXwHuJhttLAEwUa/7FWlWBarHLeOIhLfzVnHBd/QkYdYEx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622258; c=relaxed/simple;
	bh=veKwduc5AUTGaMnA0mxrIAih1oWi4wKBtixJxWSoWwY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uAVD2Pw40fEEEh9OqeTaNbUKmo+nRx8Hrm1jX2rWoCLTKJ4OnNzLHT4RVnMO8vkw9T7cOC/pb+7Ep9h6Mk3Wb2njBaisB9yWV8fE9YvsJmqdojZYraf63sSEsKpOuTso9QjyLkl63aKhfym3+Zj4cz/RSUKuyYdoX9oSKi6UXB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=L2e+Iuhm; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="L2e+Iuhm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMMsfaV7ARuQJhib9lPqBwlJSSS/JFqmiz5c6UKaxlVEuC4u/HMoFbgDbdqsFc+r5+JfgA0j/E0ebZ58Y5DwQtnel96mc5P5EsD7/5FLY6kQVDgjIibgZTm7qOJZg+EHTjlrG9VWcfVfD1BwFnxWuKrqkyvj+Nul6mDVEKYTsdaAtPFtiUqKnhlIFxkUtIVagj88H58aQlY0eshK5MArDZX0CPDKZljZGsD9udCjoZMw4UxqNYKGvD4prc1iN+tL9kHlErDwz+VMPNLWWBeWrBGhg7P/ONOHkerQdQYglfC4Yu9bL7mrTKgwV5Ah7l2AmBxBpNq1Yq61zfFHX1SXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ik7/1V1iZPplwPCbZPLOJubwhprgGRLrh2RU0dnG4Ic=;
 b=kXgsZB2vMUvOWKkXUl92SKHNPQwStW8Mi5JO+QPD2Lx0boO1lDOjiBSys0sfIJ3Yq5eZhPERM9FEzp692JL7+7PIzmPCZ+5G0mlOvWomLhxsSj7+v/VAXFdICOTwQjGrMXvW/mEZJyTZ6+VDoIqP9ouhVPt8QY2hLnFJ2TPR/GLkKj/PP7D3mwjrwhHRXLLaFBnSO04c2189Vo8QIreAoy+vph73hQuELzwGxrVcaM6UKx3YhHMhRIQDWAyxSz5SOrqs9vlKB9EmviBeByHqp5VgBU61DNvLFIo0IZtCx/qJonGmuonFE2EVmibUJb5F0P477meM3BKjxG+NwDGvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ik7/1V1iZPplwPCbZPLOJubwhprgGRLrh2RU0dnG4Ic=;
 b=L2e+Iuhm8F91ZMadxRhszXYfFp4j5Ng76ibf1syLqYF0Wci4iDJRUM/Spm34skvmXafBXAWBSVnbo/0PI6PG6Y2wnXoioVHuC3SwCAKwdptz1RYCPs08ZRShitCGXQSgNzYpN1TVvCho0niZ/jfMkSka09nXMnhNj4L4s4STbo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by OS3P286MB2105.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:191::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 16:24:08 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b8c1:9057:bf46:cc35]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b8c1:9057:bf46:cc35%7]) with mapi id 15.20.8769.031; Fri, 30 May 2025
 16:24:08 +0000
From: Koichiro Den <den@valinux.co.jp>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	yuanchu@google.com,
	yuzhao@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mm: vmscan: apply proportional reclaim pressure for memcg when MGLRU is enabled
Date: Sat, 31 May 2025 01:23:53 +0900
Message-ID: <20250530162353.541882-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::9) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|OS3P286MB2105:EE_
X-MS-Office365-Filtering-Correlation-Id: 617077ea-5aff-47a0-6a5d-08dd9f9666e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hKtzAUa7pvZMXb5Qlau/thSBBEkWpgTIVL3rV1NWCPj8tIieJrbUyabe+yPx?=
 =?us-ascii?Q?66+/AUgRpYDfzO3S6rASz44FnIwMnh9+L3QjKgyFAElFj4KGOfLJyEqIdcm6?=
 =?us-ascii?Q?9yAyV6nLRWMUWYLzGIPvcFhXHYUzA7jri2/hGtDbrGEPgnIhYJKm8VEeqD5L?=
 =?us-ascii?Q?g1pArrqnlK/ZB412d4yRZFmLy0p06Tkr2TbAZ88YXgkUdWkGg3YdQ+BzLfIX?=
 =?us-ascii?Q?Rd0KveY8WXOrew/g/nrF1WhzNDaqRrM3/qgZn935kQb6oSwyhrfL0+3ggAZr?=
 =?us-ascii?Q?5ebM/rKHC/V/y9VB06y5Fc4ux5N5QKUdC5wWbaRRhR70GgC3hKFkjhkmf1RE?=
 =?us-ascii?Q?uV//yguRtr8aC2XItQepcnGy/woKoREQSpDrw/FW2qtPJyFrDp8ddIX+8GpC?=
 =?us-ascii?Q?yi2rKZTZRJjDcrCovF5zAY9p6hTG5U0oyLNtqR0+aiRp9mOh9uwsbanQeLBf?=
 =?us-ascii?Q?6wFew0vELQGsOWRDyffcv+yEaPBzir49SriquWC+ipk2EL8R8429wI+itTWc?=
 =?us-ascii?Q?1vo02g2S7x2wDyT7zr0UzRYM788PXgxMo93g2wXKEB8xqAvgTEshD4yNXlqb?=
 =?us-ascii?Q?nhyNV8qA2yA5OT93uf6E53SccljPuXKU99Xxp/55hY0locE6SZpGI15SPpvq?=
 =?us-ascii?Q?uoOrtNkQFREFH0op5J9JOYJwzDYIrXVd/MB9K+UxkgGpYakDPcri4kExoyGo?=
 =?us-ascii?Q?7FvgKQ4xWHkUbgAqFaUBdmr2vbpwH8NLetF66CfyLZ9p0E/BlOplOCzsON3u?=
 =?us-ascii?Q?8u9PMiEMfEYXe8YQCNLWi/gm+C7R+USWnL7itN4c0UVsxuuW2savnsIVyPB/?=
 =?us-ascii?Q?bhNR68o6x58sN7hQMKH0Y/RsSFUipy908PY26qSaXmIQSLKF1aa2UZbA9ZyW?=
 =?us-ascii?Q?oS79769KnOsJpYd47+XAUxcnXnSsEOxzARPcmE5yOApLCraKmCKplLl/GpzA?=
 =?us-ascii?Q?vL5BHu+aO1IqpkzvNY1QCl60UWTiRx1E4eWAe9doQStTXHj4C3+uqJZsdhzR?=
 =?us-ascii?Q?qyLyBNSmXVOIG2PF9X2OaM2DbE1+IxRILR9f/w5RI+4uuMJgX6ZiD/zc8MVy?=
 =?us-ascii?Q?9ZPM/u+IpPFXN0Ppb7CjpFl94RxZdk1WhuudheFZ0jj5mYoQ08JyiACX2GNv?=
 =?us-ascii?Q?wOb8M7uS7j4FdCK3pR6hF3oFnTfggAlEytBC4iS8lWfDcAvXTSy/tCKI84uI?=
 =?us-ascii?Q?ckrqvYo2t6KrcLwlCrvbqG26NB3Nylu9mUVO8z3zbmkoNaVEbhXPhLIl4t7v?=
 =?us-ascii?Q?BciTpf+xSPSNfadp7EhQg1xb1LcTsgZMBY0/A9k1n5X1o/b+KQgCkc4T7ggZ?=
 =?us-ascii?Q?HuU43BvSbqcwuSR0zHKA0TOJajTefJeyJsk/5DSppc4V9XBGyXzkmMsGeRa5?=
 =?us-ascii?Q?/Wlxrf99M3y3p5DYZBkrtjrkU4CoenaD6xVjNYdAMOsWLYbtQ+3H/Cd775wT?=
 =?us-ascii?Q?rn5qdf/ADWU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lqqMX5962/g3qaWu4DsFTxqQG/IF/WmGDK4oHP6dwtbkCo+GjiF8+gu4P68h?=
 =?us-ascii?Q?pEWpCguq33xgVKvKE1dUubeGcazaUVcIp99XPnEHx2DyG7+EKTkVxwdHOPVZ?=
 =?us-ascii?Q?/YJ0NrvTt4lIUdyCOXDZZjYYXtbD7g4f7PlwCDT7DVuc1p1nmQf8G1wJvbQT?=
 =?us-ascii?Q?pYOLSwFCj2qmh0MgeWGZm+X7Vo3PIUF44dDIB1QmpUFbt5jIzPzFZYgtWM3n?=
 =?us-ascii?Q?gVTKRRjfQkoxamXMbGqUq4Yp9PNA+ME9JkDjeCoRtidWktfXnks4ZxpqHlkA?=
 =?us-ascii?Q?8nRLTTy/wWLMStpMa0NUtw3/BBEYDSWxwUt23u8VcsqkGaZncLe1IRULfMtk?=
 =?us-ascii?Q?lC/ZtEv07+cIycM5YHvMeQbyljJ3eQdGVtOCu1bFaYkHTZsBfmZNI39iny8F?=
 =?us-ascii?Q?vxwMBS3HGGquMgToLwBGD19s2o/EqkvFCsJyuoQPKKK92/zeiFr3hQ4t2SQI?=
 =?us-ascii?Q?it9/W2U95lM9dK+ZyGwB8negTledIj6y8gHdc8cftKmp8ZlWJbtDLiSnbnt5?=
 =?us-ascii?Q?N0hDzt6RhpwEh3N3/9fbzeNd5w+/yH54W1dZIcir6ZsVuAeCfk7x4IWZPLgJ?=
 =?us-ascii?Q?VQgxDn0yQDLe1JJXX6hYHxIiKlKnPAGszkzufA7tisIC8jEWb4uhXD5XfV5w?=
 =?us-ascii?Q?DbN9dj3PJZlO7yB4r+0oxfojKUcKti2h+TXm8rNDMD3bKfPNBRWOmWhLS2CN?=
 =?us-ascii?Q?URfc8yqn/lEKis9UneIob+YOJQyoo7WDFJ3N9Xm3qaq0H4yYqe++js66+v/z?=
 =?us-ascii?Q?szj1k5EtSGRDn7OEfR0B/auMi9KdX8ob/tCK7NR1SSpRZnaubwSixEdJu+/j?=
 =?us-ascii?Q?jnAk6d8pRrkUqs4lp7NAfnnnlUCNAXrx6xP5PRAvdvEMLdIpXrBEZV1z0tR2?=
 =?us-ascii?Q?gWIRKn6ATtITiGoCwpTbgGClh6foll38QwobRYW+3WdeLWYMK/huFSQZlDXp?=
 =?us-ascii?Q?VAgxWRepg6vYSJmInC2Q8i13i5HMj4hMFLPdj/WoMXIiW8yDhqRWjhkMLk3t?=
 =?us-ascii?Q?VqdgWrCdV78TCyKlAck/dQ3EBLsWsC7IQD1HdiNpgpuECUvnct7FNBxlujMR?=
 =?us-ascii?Q?EaY4AqIar95cd3xnVSTmvusSvkNCG4E62r4fghvB3UMxlluVTpnny0Zayo9t?=
 =?us-ascii?Q?FwkeB5tcdGkOaLTIIOcYCm0Id8S936u9go7HBfKuolJug2Pdkk1Nhg60dUbV?=
 =?us-ascii?Q?4Q5YHRWeS+BnMK7FdG1KiRh8jyi2jgjqaPNr7a70s/anMhtwPCj4BX0cdgQg?=
 =?us-ascii?Q?bPOq+z01RmCnkejF+4XmfvjYPcZteO8/mVycoM6MfW/LRwBEx+vZFjOWPJoQ?=
 =?us-ascii?Q?brjdB0ehSIvkA60IMN9sojw5GSSNosTScN/Fr8smTLxYsRCO/GkPNP9kehy7?=
 =?us-ascii?Q?6rlRlE8eacTRn8AnjVKXZmTRJU8h2wPTvDB4mKiRV0tSIIODxYJvMPKDry9P?=
 =?us-ascii?Q?pirstbcj/nkiXEnF8yfxbz8l/d/sRnP/1gGu1Oo/1/7tKXziC3vliefcW9hK?=
 =?us-ascii?Q?DYAulGcp6xEfOcEpPzxpiEeXK6u+BNg8xZf2XlZjZYlHFJ0dSMnvPQDGsNcf?=
 =?us-ascii?Q?WJhu5ltC0A+pRTfdQe1VOy8PX2ePRIwND+fn69IfTme+SltCcvnYsDO9PZg5?=
 =?us-ascii?Q?RGlnS/XUveHewNd0GLCbdi8=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 617077ea-5aff-47a0-6a5d-08dd9f9666e3
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:24:08.4421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eaPzEp0neIAh4QUyQCw+fRnqtbrMrOm6a/o8kMDJGjhM+SdyfNeZEx0flXtIw1RozgsVvJrIFuZaKv4L6Na0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2105

From: Koichiro Den <koichiro.den@canonical.com>

The scan implementation for MGLRU was missing proportional reclaim
pressure for memcg, which contradicts the description in
Documentation/admin-guide/cgroup-v2.rst (memory.{low,min} section).

This issue can be observed in kselftest cgroup:test_memcontrol
(specifically test_memcg_min and test_memcg_low). The following table
shows the actual values observed in my local test env (on xfs) and the
error "e", which is the symmetric absolute percentage error from the ideal
values of 29M for c[0] and 21M for c[1].

  test_memcg_min

         | MGLRU enabled   | MGLRU enabled   | MGLRU disabled
         | Without patch   | With patch      |
    -----|-----------------|-----------------|---------------
    c[0] | 25964544 (e=8%) | 28770304 (e=3%) | 27820032 (e=4%)
    c[1] | 26214400 (e=9%) | 23998464 (e=4%) | 24776704 (e=6%)

  test_memcg_low

         | MGLRU enabled   | MGLRU enabled   | MGLRU disabled
         | Without patch   | With patch      |
    -----|-----------------|-----------------|---------------
    c[0] | 26214400 (e=7%) | 27930624 (e=4%) | 27688960 (e=5%)
    c[1] | 26214400 (e=9%) | 24764416 (e=6%) | 24920064 (e=6%)

Factor out the proportioning logic to a new function and have MGLRU
reuse it. While at it, update the eviction behavior via debugfs
'lru_gen' interface ('-' command with an explicit 'nr_to_reclaim'
parameter) to ensure eviction is limited to the specified number.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
Changes in v2:
- Leverage the new evict_folios() parameter to ensure correct eviction
  limitation via debugfs
- Update the commit message to use the latest upstream kselftest instead
  of LTP memcontrol03.

v1: https://lore.kernel.org/all/20250404141118.3895592-1-koichiro.den@canonical.com/
---
 mm/vmscan.c | 149 ++++++++++++++++++++++++++++------------------------
 1 file changed, 79 insertions(+), 70 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 07c51fa03434..750c0e72bda4 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2473,6 +2473,69 @@ static inline void calculate_pressure_balance(struct scan_control *sc,
 	*denominator = ap + fp;
 }
 
+static unsigned long apply_proportional_protection(struct mem_cgroup *memcg,
+		struct scan_control *sc, unsigned long scan)
+{
+	unsigned long min, low;
+
+	mem_cgroup_protection(sc->target_mem_cgroup, memcg, &min, &low);
+
+	if (min || low) {
+		/*
+		 * Scale a cgroup's reclaim pressure by proportioning
+		 * its current usage to its memory.low or memory.min
+		 * setting.
+		 *
+		 * This is important, as otherwise scanning aggression
+		 * becomes extremely binary -- from nothing as we
+		 * approach the memory protection threshold, to totally
+		 * nominal as we exceed it.  This results in requiring
+		 * setting extremely liberal protection thresholds. It
+		 * also means we simply get no protection at all if we
+		 * set it too low, which is not ideal.
+		 *
+		 * If there is any protection in place, we reduce scan
+		 * pressure by how much of the total memory used is
+		 * within protection thresholds.
+		 *
+		 * There is one special case: in the first reclaim pass,
+		 * we skip over all groups that are within their low
+		 * protection. If that fails to reclaim enough pages to
+		 * satisfy the reclaim goal, we come back and override
+		 * the best-effort low protection. However, we still
+		 * ideally want to honor how well-behaved groups are in
+		 * that case instead of simply punishing them all
+		 * equally. As such, we reclaim them based on how much
+		 * memory they are using, reducing the scan pressure
+		 * again by how much of the total memory used is under
+		 * hard protection.
+		 */
+		unsigned long cgroup_size = mem_cgroup_size(memcg);
+		unsigned long protection;
+
+		/* memory.low scaling, make sure we retry before OOM */
+		if (!sc->memcg_low_reclaim && low > min) {
+			protection = low;
+			sc->memcg_low_skipped = 1;
+		} else {
+			protection = min;
+		}
+
+		/* Avoid TOCTOU with earlier protection check */
+		cgroup_size = max(cgroup_size, protection);
+
+		scan -= scan * protection / (cgroup_size + 1);
+
+		/*
+		 * Minimally target SWAP_CLUSTER_MAX pages to keep
+		 * reclaim moving forwards, avoiding decrementing
+		 * sc->priority further than desirable.
+		 */
+		scan = max(scan, SWAP_CLUSTER_MAX);
+	}
+	return scan;
+}
+
 /*
  * Determine how aggressively the anon and file LRU lists should be
  * scanned.
@@ -2551,70 +2614,10 @@ static void get_scan_count(struct lruvec *lruvec, struct scan_control *sc,
 	for_each_evictable_lru(lru) {
 		bool file = is_file_lru(lru);
 		unsigned long lruvec_size;
-		unsigned long low, min;
 		unsigned long scan;
 
 		lruvec_size = lruvec_lru_size(lruvec, lru, sc->reclaim_idx);
-		mem_cgroup_protection(sc->target_mem_cgroup, memcg,
-				      &min, &low);
-
-		if (min || low) {
-			/*
-			 * Scale a cgroup's reclaim pressure by proportioning
-			 * its current usage to its memory.low or memory.min
-			 * setting.
-			 *
-			 * This is important, as otherwise scanning aggression
-			 * becomes extremely binary -- from nothing as we
-			 * approach the memory protection threshold, to totally
-			 * nominal as we exceed it.  This results in requiring
-			 * setting extremely liberal protection thresholds. It
-			 * also means we simply get no protection at all if we
-			 * set it too low, which is not ideal.
-			 *
-			 * If there is any protection in place, we reduce scan
-			 * pressure by how much of the total memory used is
-			 * within protection thresholds.
-			 *
-			 * There is one special case: in the first reclaim pass,
-			 * we skip over all groups that are within their low
-			 * protection. If that fails to reclaim enough pages to
-			 * satisfy the reclaim goal, we come back and override
-			 * the best-effort low protection. However, we still
-			 * ideally want to honor how well-behaved groups are in
-			 * that case instead of simply punishing them all
-			 * equally. As such, we reclaim them based on how much
-			 * memory they are using, reducing the scan pressure
-			 * again by how much of the total memory used is under
-			 * hard protection.
-			 */
-			unsigned long cgroup_size = mem_cgroup_size(memcg);
-			unsigned long protection;
-
-			/* memory.low scaling, make sure we retry before OOM */
-			if (!sc->memcg_low_reclaim && low > min) {
-				protection = low;
-				sc->memcg_low_skipped = 1;
-			} else {
-				protection = min;
-			}
-
-			/* Avoid TOCTOU with earlier protection check */
-			cgroup_size = max(cgroup_size, protection);
-
-			scan = lruvec_size - lruvec_size * protection /
-				(cgroup_size + 1);
-
-			/*
-			 * Minimally target SWAP_CLUSTER_MAX pages to keep
-			 * reclaim moving forwards, avoiding decrementing
-			 * sc->priority further than desirable.
-			 */
-			scan = max(scan, SWAP_CLUSTER_MAX);
-		} else {
-			scan = lruvec_size;
-		}
-
+		scan = apply_proportional_protection(memcg, sc, lruvec_size);
 		scan >>= sc->priority;
 
 		/*
@@ -4545,8 +4548,9 @@ static bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct sca
 	return true;
 }
 
-static int scan_folios(struct lruvec *lruvec, struct scan_control *sc,
-		       int type, int tier, struct list_head *list)
+static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
+		       struct scan_control *sc, int type, int tier,
+		       struct list_head *list)
 {
 	int i;
 	int gen;
@@ -4555,7 +4559,7 @@ static int scan_folios(struct lruvec *lruvec, struct scan_control *sc,
 	int scanned = 0;
 	int isolated = 0;
 	int skipped = 0;
-	int remaining = MAX_LRU_BATCH;
+	int remaining = min(nr_to_scan, MAX_LRU_BATCH);
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
 
@@ -4666,7 +4670,8 @@ static int get_type_to_scan(struct lruvec *lruvec, int swappiness)
 	return positive_ctrl_err(&sp, &pv);
 }
 
-static int isolate_folios(struct lruvec *lruvec, struct scan_control *sc, int swappiness,
+static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
+			  struct scan_control *sc, int swappiness,
 			  int *type_scanned, struct list_head *list)
 {
 	int i;
@@ -4678,7 +4683,7 @@ static int isolate_folios(struct lruvec *lruvec, struct scan_control *sc, int sw
 
 		*type_scanned = type;
 
-		scanned = scan_folios(lruvec, sc, type, tier, list);
+		scanned = scan_folios(nr_to_scan, lruvec, sc, type, tier, list);
 		if (scanned)
 			return scanned;
 
@@ -4688,7 +4693,8 @@ static int isolate_folios(struct lruvec *lruvec, struct scan_control *sc, int sw
 	return 0;
 }
 
-static int evict_folios(struct lruvec *lruvec, struct scan_control *sc, int swappiness)
+static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
+			struct scan_control *sc, int swappiness)
 {
 	int type;
 	int scanned;
@@ -4707,7 +4713,7 @@ static int evict_folios(struct lruvec *lruvec, struct scan_control *sc, int swap
 
 	spin_lock_irq(&lruvec->lru_lock);
 
-	scanned = isolate_folios(lruvec, sc, swappiness, &type, &list);
+	scanned = isolate_folios(nr_to_scan, lruvec, sc, swappiness, &type, &list);
 
 	scanned += try_to_inc_min_seq(lruvec, swappiness);
 
@@ -4828,6 +4834,8 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc, int s
 	if (nr_to_scan && !mem_cgroup_online(memcg))
 		return nr_to_scan;
 
+	nr_to_scan = apply_proportional_protection(memcg, sc, nr_to_scan);
+
 	/* try to get away with not aging at the default priority */
 	if (!success || sc->priority == DEF_PRIORITY)
 		return nr_to_scan >> sc->priority;
@@ -4880,7 +4888,7 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 		if (nr_to_scan <= 0)
 			break;
 
-		delta = evict_folios(lruvec, sc, swappiness);
+		delta = evict_folios(nr_to_scan, lruvec, sc, swappiness);
 		if (!delta)
 			break;
 
@@ -5501,7 +5509,8 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
 		if (sc->nr_reclaimed >= nr_to_reclaim)
 			return 0;
 
-		if (!evict_folios(lruvec, sc, swappiness))
+		if (!evict_folios(nr_to_reclaim - sc->nr_reclaimed, lruvec, sc,
+				  swappiness))
 			return 0;
 
 		cond_resched();
-- 
2.48.1

