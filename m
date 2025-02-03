Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0376F20B1FA;
	Mon,  3 Feb 2025 16:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738600140; cv=fail; b=FJx4p/kQh0Y7IO/sqclLvcppdh3Hqwa7gDrW2o5QXJ54S5Q/Rw2tOC8JmV99Ia5jyq+T2qZzLxZnmmPpsYTv7I8cy5k7UXKzl2QnfGs/+NOVmeA7zduBZYsNGNeXL/sgpJz3bGvYujF4nq1enmzy0BfcmmkRHQZbbjE/OMX2RhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738600140; c=relaxed/simple;
	bh=zXNq3f6zq0BjV8JtkioXtCd82bnKJPwvi7mztDa+JOQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S+8MjLyNGZFWtLMU0XqnEhqya7sxJKS9/G3RU4F9yNl+bMx+3sMtaG2D4291sj/tcs+NNXJDb5zc0ksB06OyyuKI8XImDD7yU7+4SXkMWEkLvdfQFpTrCCez8tXSFu0+oSKATV5ABZzfw31QI6DVjjRa7lrdy6ACFkWHvAWXqbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E/RNjbPt; arc=fail smtp.client-ip=40.107.220.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="E/RNjbPt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7JsEu3b++SKhbgYkabR2x4hIHWkLKy5qKPKK6DGeoJ3yjw73Rsk0NwrYVTFXjx1S7rWBh6Vy2OExndF7+9AggihglmjkY7zKiZXIDnv30cptFDYZswm+xFPzEEZTH3pAE0BDNe8AQ12jWKrYiLYONSUseOD0zoJt0QAjtbZHqtQAZvsAVL1nL4U6+Y5KbROKje7B7lY6guVFXHnAT52v+pCvXQsZ0gcBzKLY47wtsr6ovBExa9nOOXcGnYZ8mBHU1za8qPMZaIpYMUZnRss8bq3qslqKr1ojxI5E39nPODC66MAHZG96kmb7QMjxWUleuK1jYTcXqQvk7IbQd3CDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epgKzhGsK5LTQk52dBcE9RhRh7PgUi0X94RFuUtVBeo=;
 b=fZk5YWeHfFAJMBwhG0hLaJy8OueJhQxD0l9Fd6cH44S27GU6H217wrwj9SqXdWBUDtvrpf7VOKP5kafIALHWbBKp+jz/oveuu+6i6s30snpQ6x5hnRXoHJA6FI0fqDsmRBlRBLbo869JNaw/I9Lj36n/CDAmyyWANnNOotYn4C/Hc3a85HdZZG0syWkDb0GWDboU0fE8lFEN22zXZ22mosFXSrDxpJDtBXZb30s3Kkoo1Zk80mnxZ2Rcb6wvw9Hv38oVE3tCnNnf5LykRl5pGMJist6Pz5UdLbIaar1a+ZprLFIiR6OsV39DKq/dmIfm9YlwD9BvIx1wrOlb+dqvhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epgKzhGsK5LTQk52dBcE9RhRh7PgUi0X94RFuUtVBeo=;
 b=E/RNjbPtQzMKUtbyRgyDsNMhcUL1X3pf+/2Gqe9eT+eQ3/Mo4mdXDSeKLFnRhG6Td7KEVoaGekfl8qFvZvE2dgbxlgSgtjIHYuzoZnZ/vIW/t/U5fxppauqcaG9YULy/ghBtLUp3Wd2pyCqU7eG1PmOtKKnpVqueLqiqaYD592U=
Received: from SN7PR04CA0212.namprd04.prod.outlook.com (2603:10b6:806:127::7)
 by IA0PR12MB7675.namprd12.prod.outlook.com (2603:10b6:208:433::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Mon, 3 Feb
 2025 16:28:54 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::a7) by SN7PR04CA0212.outlook.office365.com
 (2603:10b6:806:127::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Mon,
 3 Feb 2025 16:28:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 3 Feb 2025 16:28:54 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Feb
 2025 10:28:51 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/3] dt-bindings: xilinx: Remove description for SystemACE
Date: Mon, 3 Feb 2025 17:28:39 +0100
Message-ID: <7ed73455057a5b3ffe9ba00ce27654c296bfdda7.1738600116.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738600116.git.michal.simek@amd.com>
References: <cover.1738600116.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1182; i=michal.simek@amd.com; h=from:subject:message-id; bh=zXNq3f6zq0BjV8JtkioXtCd82bnKJPwvi7mztDa+JOQ=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhvQF77bvvLc3eeLG12WnTLUz1vVtWNbgJsl1wNrvBi/no 9lPBOO4OmJZGASZGGTFFFmkba6c2Vs5Y4rwxcNyMHNYmUCGMHBxCsBERNYxzOE6axTFbcTYzxrP lhn1TWGCaM3DPob5KRoJZ1fL7JkmFLBQs/b6rb1G+7/uBQA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|IA0PR12MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f14cfb2-c80f-46a9-7918-08dd446fd9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EyrlVPhXGEaK+0Gv6szhaTSMXoaq67QN3Sk97ElGBXccWkUq8R/ENg2JaKYQ?=
 =?us-ascii?Q?S148iaNEMFsjG07L50c36gQ5g+Wsa6nADDvWyOpttCSZChKPGuY1OxlP0hSY?=
 =?us-ascii?Q?FrKYfR613HkB1lXkU78LVU5G7j1YQh0rkhgc6EkJ2OBtuJRPKNvDGJ8j4DRO?=
 =?us-ascii?Q?PSgoJeffbbIYOXhiACiUgwxAbFsxsnGOtInDbKuFrSg4WkEWnYgD5O2q8akH?=
 =?us-ascii?Q?LFnZGLIdKc5z7IS79TCJCgbRZyS/ihddm4cNhxGN+WJDliwUpX5E5t43erzH?=
 =?us-ascii?Q?1od19ysGfLw19oYrh90GAiGT6VIDIRhcT3zfMc0s68nUSzPw3yL5f8RHMp3g?=
 =?us-ascii?Q?ua+539DuQyfoGjSJS+8fwJ/MpDKxfhKIo+2dzkao/RIF12rSUikGH8ULQqPD?=
 =?us-ascii?Q?TaErxCN7YOcdyUq21mF6nhiia6gK3WAK0twpiKwl7T7eYlMpgTEfO4Sy8rNY?=
 =?us-ascii?Q?rhhKTD7FazmPENOfIRCQdMCc7V8M0CkFuKRVkywWLwDmSBIFRqyr+DXffVlU?=
 =?us-ascii?Q?00q6s4TfQl828i9SW45OhRWxYfta2CjRZiQJYT+Ya0W1woZUrdXOgel7P+Rv?=
 =?us-ascii?Q?mLi3z8aArwNirwTZoZ5cHorUcLwtQ1+ZUPBhHYsc5ZNQNblHDTkyPLD6bzg6?=
 =?us-ascii?Q?tOnbFTbgPx4S+WfOGm9+Xu6UGagOVnurvO8RZMUshKk8ZTwwLEVi6+iwXe1Z?=
 =?us-ascii?Q?LcM9IyBrdFrmomlDU6NB4G/isQsauMBjalOw+4+t12tjVmo7F0HRpMkuj61c?=
 =?us-ascii?Q?s+vAfG63Ba6PhBsLSKcbzBS/CXO79JERfnKLTJzQ1wf3Qyzgoz7rdhzUVogz?=
 =?us-ascii?Q?4Gla1oBQ4+liMR6Uy+MbaIrNOOJ+d32sxfLFBkCUuSYyOMQnKi4ZW/lJjzEh?=
 =?us-ascii?Q?o0kw3lfBckfUa3JMqlK/W7xQOdNXGoJ2Sv/7kwY0P5XYOyQBvYxE2uZYjrEj?=
 =?us-ascii?Q?i41AJHK5EEa6ujZyttbFo+h2ETkossnbzw8KVhMcHH5KLHk2Wgi4omAxEtoK?=
 =?us-ascii?Q?gms1HUDBWSf2YT/URO/3UBnUtzJKJW2WX3cB5xArSIZjz0nYDx9rb4+5CUcd?=
 =?us-ascii?Q?TofVE0rQjGiS951NlavrGKv67cK97RRpdVxxPeLODuXljUFQum11k7nDiloj?=
 =?us-ascii?Q?5J7hGb6knJFwjr9u04b+F200BzflU5L288UJcVyL5i0MRrpQHrQkPNgDLfRR?=
 =?us-ascii?Q?VkZNf4YK7Z/ZPQWMNRV8O8KSOzIMdlMzRP5hPLaIMf4zM0H60wmxxEOLEsKh?=
 =?us-ascii?Q?mLKY3CKQr4QLxIuwiLkwnZsY4WA+AJCaLFNUOJURcua3NJe9xXs1jaN1/YnQ?=
 =?us-ascii?Q?bqWtFKprGlUggzSswaJ5yrQM7W/sMtpSKDGSnqYejbziMkfPoRpwluutPAeG?=
 =?us-ascii?Q?JZu6+3Xa7HiAE/c0bB471gy36iPschb4ucA/RtMifqS/Vke2ypA7jr2iVDKg?=
 =?us-ascii?Q?dFeXQiEGjbLgvLK1zfQJPQIYiSYugZ9zmq1ZFeH2Pn6YBuurmiRth/7jOXEI?=
 =?us-ascii?Q?rCjnYHNYKvoIRtg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 16:28:54.4890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f14cfb2-c80f-46a9-7918-08dd446fd9fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7675

SystemACE driver has been removed by commit 2907f851f64a ("xsysace: Remove
SYSACE driver") that's why there is no reason to keep description in
xilinx.txt file.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 Documentation/devicetree/bindings/xilinx.txt | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/xilinx.txt b/Documentation/devicetree/bindings/xilinx.txt
index 6af9b67f9252..b788c9928710 100644
--- a/Documentation/devicetree/bindings/xilinx.txt
+++ b/Documentation/devicetree/bindings/xilinx.txt
@@ -102,15 +102,6 @@
                                            Default is <d#1024 d#480>.
        - rotate-display (empty) : rotate display 180 degrees.
 
-      ii) Xilinx SystemACE
-
-      The Xilinx SystemACE device is used to program FPGAs from an FPGA
-      bitstream stored on a CF card.  It can also be used as a generic CF
-      interface device.
-
-      Optional properties:
-       - 8-bit (empty) : Set this property for SystemACE in 8 bit mode
-
       iii) Xilinx EMAC and Xilinx TEMAC
 
       Xilinx Ethernet devices.  In addition to general xilinx properties
-- 
2.43.0

