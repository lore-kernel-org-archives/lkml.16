Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D692223741
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 18:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748284248; cv=fail; b=m3CKZTHtkEfyqkzNCLL/aPlVfVZYqWMwgEt0AxefNYqI7jL76eOVcUnSoCUg9McJ1UeY86r2Y3pUxDyehv6pP3CDA7p++F/lLNZRi7SbPSjcjVZDJeO+4dcgMNvgaWBoFz9QWqdQZ71LaheORhf9uFhzyFvwKyp+C2RSTIngmaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748284248; c=relaxed/simple;
	bh=0c82P0yhWkuJy3XckiW4UEryIywDqyelDk5163ec+dk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uWVS9SR0K5YZz1vS3yGc8vexb3rEAeiKvwy8+uME7AOZ09eq4sQXHsmB/qIDIpY4fTLr7UJQuc7oi07ereN9uuPUMbvGn0QFx6UUWJOKElVvkJh2rP69Cennl5stY4mPGcxIQ4NnZoqyA2AQCZqc0lFMEcZdzsVdrdT05PZdxsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QSgkm8ir; arc=fail smtp.client-ip=40.107.244.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QSgkm8ir"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fh6YyhJ+O+cbVEKHOtKJ6a11gBWyxxjAFmBW1MeI+CbzjK0M2RSDymWR0GLdH98cXxgLLehwlYLyUHJCPygcz7cM5EWej36sz0rl16Itm+XNsb4Iir9kiDzLC/F6ToLfjYT0pjM6Rk1q3URGf1GES/gHQU/TF3APe6TZT4ob/efUpeInddS0Rd4Jx+wub4VDzKpFGz0xq1FFGC3pATDm/Y4CcwhbfgRy3Aznvweu9JPoj22URYzNJGP5273DgG7iSTtMtn3wWNJ5r9BSXwJ46KfuKs0Obb0Hjoyc6hrAkkM3uloZVtuWEm//IzdpH9TKQAXvcbVTFOVCtNLoxczZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jd8Dk6kIWne+45h5hYO25r9PnBGxRA2RwbHmpGKpzIU=;
 b=QB8UMkJDSEm2xbBdvPzsa/ZbcT8D2/8hzY4J2jsPQnYU3aCC55jK0zlpXxTDp9pYJb6oYQLv+nZkzMDh9W+65rO1dURdiOajcTNiqTQMzvd09etbFftMOpSsBCa9ivtBKZPApc7e1X0OkABYn545M0d6xcJ44BzDEw4M6J1gLo7aM/9WkkSvVP2duE7+fLdt2gaSXPTVm/hT+zWcQEChufJUj3iAsTc3g2uujG8iXzpecwJBJXeUw7ocQ6W1B05+8DFLjMMChO0omShNk0edOe7vGKc+z8gVI/HI/qlgdGwoe5igj12qXsE/4Mz9f7gSqtvaB7xDSpWZV/5WpsroZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jd8Dk6kIWne+45h5hYO25r9PnBGxRA2RwbHmpGKpzIU=;
 b=QSgkm8ircbAfovakw6PN7xjjqQF5k/5MQXYaVIaN2wCoRX4F3dpSkTr0lAtmOgHoKbLNb4mbfIqmpBCjDLcNobbgIW7Rf9d9Qf6sOKVjHmcsVncVvAieJ3v0Fr9J88QkvWY/QWhOdRCPM80GOaYCh3kmcmw+gvuk8eni2wTaQ8Y=
Received: from CH0PR04CA0027.namprd04.prod.outlook.com (2603:10b6:610:76::32)
 by SA3PR12MB7902.namprd12.prod.outlook.com (2603:10b6:806:305::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 18:30:44 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::97) by CH0PR04CA0027.outlook.office365.com
 (2603:10b6:610:76::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Mon,
 26 May 2025 18:30:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 18:30:43 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 13:30:39 -0500
From: Shivank Garg <shivankg@amd.com>
To: <akpm@linux-foundation.org>, <david@redhat.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
CC: <ziy@nvidia.com>, <baolin.wang@linux.alibaba.com>,
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <npache@redhat.com>,
	<ryan.roberts@arm.com>, <dev.jain@arm.com>, <fengwei.yin@intel.com>,
	<shivankg@amd.com>, <bharata@amd.com>
Subject: [PATCH V3 2/2] mm/khugepaged: clean up refcount check using folio_expected_ref_count()
Date: Mon, 26 May 2025 18:28:20 +0000
Message-ID: <20250526182818.37978-2-shivankg@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526182818.37978-1-shivankg@amd.com>
References: <20250526182818.37978-1-shivankg@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|SA3PR12MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c5f884f-2912-4688-4359-08dd9c836ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1rtB7OAa/8YbhpnovrM0hG6dfW2Gn581NJvZ1UQoPyWjjLYmxWL1RkNiMtXp?=
 =?us-ascii?Q?ngfMtIlNwR/RxsgSnkOYsZqNs48hdHf/Vd2NJOhPJje5eGjJzLrSJyl9zy5I?=
 =?us-ascii?Q?Sz5CqqyAF62I6cRSST7xNHm435sTVCQONlmzSCjnDxnW7nekq+Ji7G0Rge2Y?=
 =?us-ascii?Q?bLcI67d6KZ5pyoJSysc8P8yi5HueK17YQIpFUn/1LVwi6EW90Ev44kft7ZL/?=
 =?us-ascii?Q?Sm1jtc0+V7BXZ8aO0XcR/oGf5H/7zrqfIJ1jwHUqOz/qXRLyiOqX2RtedX4E?=
 =?us-ascii?Q?uCYRGRC1JxXqQuVz5UeAssWn6lVnm6yCypWnYmi37fUsJkvLS3r5BW+tzFjO?=
 =?us-ascii?Q?RakPB+WYjpjl/ctIsLPZXvz05jjDSTZ9DdrLectLuFRlAjXwbU3x+/dkydZt?=
 =?us-ascii?Q?/Kas8eZ+4C8EzvziRpKn7jllklxt4Gn2lKROy+FpyxRp48AYzN+7iTvyqt/o?=
 =?us-ascii?Q?ihz78j4k3ogzIcecFi/BjJFu3i/PH9SstbhHP+bgX2cgXPwiw/TDrfbzx6CH?=
 =?us-ascii?Q?vNR945wMMNdpWgLoFS2tVtdEWwzDqswFsJvnydE6ttJgThqlLrhZ/fZI45Sq?=
 =?us-ascii?Q?6mZrqnixPaH1fKa7vUw/xfmvQnS7CBAfkbUpf0uVagpMA2ERpq9i/r17eBs0?=
 =?us-ascii?Q?/ldPfC6/FlLtwi6SDJ/fKlKrOEvE3Q5HJQDUT3EgtYm5K5d7cP2CPegujYq4?=
 =?us-ascii?Q?N10Tol7Ocb5/jO2VUjSjOkmT70S7UVYNXRT30NzMYvqZGwln+QiHI3Ujrukr?=
 =?us-ascii?Q?j/2LQXu0HYDjGIVKcEF/NwYB6WUVKtnaPqMSDEaHNNgcxxBRm1U8zH091D7U?=
 =?us-ascii?Q?Q7aKXzuEOfmCwqnFQertQI/LstevvC4RCJMA5MLqHFkltBbrSUtJQAx48oVr?=
 =?us-ascii?Q?jz0h0heiq0xq0DJxVgY+DwsRC97eHRrD1DjdGW3IpowP9USoxGoMvAvk/n3d?=
 =?us-ascii?Q?BrfiIUXbYTB45yId0pRe6bFTefMvxBXoNK8/AFPqTWHnQUrpPiRrljXyFH2s?=
 =?us-ascii?Q?Pyhji4GdRMZ9itxy6+tWsWlN5PcxWOb+zyzzV1CicKvNkZGtsV39KY2JraRE?=
 =?us-ascii?Q?+WFL46fzTuTm0M2gvFO5+k1XQREJrY3fr0OKTPGszWqZ/GCWtuxr3vh28Ki/?=
 =?us-ascii?Q?rDcLxXOSTs8A21V5hPpHhwsoGACPRvAW5CwZbIwYTagA0qa8I9NED2+5UJ2g?=
 =?us-ascii?Q?YNtWCswzIssao2xttgFj8yt65Nmj7N+6bG7eSi6+6DJfsn58pPawy6LUBtJM?=
 =?us-ascii?Q?utyvE8zO4jycsoHPTesdCaEeGKTgpRcCq/qduDEBUqjKvbVYXeHqZuZ/y+CL?=
 =?us-ascii?Q?FmpvzhS3Mni/iJwkNsuOXXyqgDeaErVIuvWJ7LwLgcv/cPNatfnMhVFF8qbK?=
 =?us-ascii?Q?klj0RVo2jDkPRJ3Npt8zueRqiOrW24vvcgVxFf30SXI0hw9utkRRPvTLhfT2?=
 =?us-ascii?Q?F3cL/FTxicUsTIaWnCRmbo2LWapXkIKBjkNiD7xvRY94Vzek8hem4l2IKAIY?=
 =?us-ascii?Q?YfHUE/qOQThCPqPywIhW5l/3MqJXe7bM/508?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 18:30:43.7617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5f884f-2912-4688-4359-08dd9c836ce6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7902

Use folio_expected_ref_count() instead of open-coded logic in
is_refcount_suitable(). This avoids code duplication and improves
clarity.

Drop is_refcount_suitable() as it is no longer needed.

Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 mm/khugepaged.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index fe1fe7eace54..685eb949f4ce 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -548,19 +548,6 @@ static void release_pte_pages(pte_t *pte, pte_t *_pte,
 	}
 }
 
-static bool is_refcount_suitable(struct folio *folio)
-{
-	int expected_refcount = folio_mapcount(folio);
-
-	if (!folio_test_anon(folio) || folio_test_swapcache(folio))
-		expected_refcount += folio_nr_pages(folio);
-
-	if (folio_test_private(folio))
-		expected_refcount++;
-
-	return folio_ref_count(folio) == expected_refcount;
-}
-
 static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 					unsigned long address,
 					pte_t *pte,
@@ -652,7 +639,7 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		 * but not from this process. The other process cannot write to
 		 * the page, only trigger CoW.
 		 */
-		if (!is_refcount_suitable(folio)) {
+		if (folio_expected_ref_count(folio) != folio_ref_count(folio)) {
 			folio_unlock(folio);
 			result = SCAN_PAGE_COUNT;
 			goto out;
@@ -1402,7 +1389,7 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 		 * has excessive GUP pins (i.e. 512).  Anyway the same check
 		 * will be done again later the risk seems low.
 		 */
-		if (!is_refcount_suitable(folio)) {
+		if (folio_expected_ref_count(folio) != folio_ref_count(folio)) {
 			result = SCAN_PAGE_COUNT;
 			goto out_unmap;
 		}
-- 
2.34.1

