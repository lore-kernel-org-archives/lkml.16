Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2048.outbound.protection.outlook.com [40.107.96.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8E628D8EE;
	Tue, 17 Jun 2025 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150792; cv=fail; b=GIYKnIbR//M66upeE9ETJ4hC6QYmToxNrNQ5hb4zjX5gyM2BxtjPyRExG/AEzVC2vArgl+Drr/6GIQnJrTkWefWskjHgnNRpX31PrTVXcQt6udcCQ2nbPiYdEoARl3vG+tFNmxHBwsNszZ8e0vH4LOGE8vrlbKCIjhRHAgHO/Zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150792; c=relaxed/simple;
	bh=YtZmla56jlez13PUOMhn+6qIfDZXFXSipnimKTsHRxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GbmXkfoNPIuUt3Tum+d+M5ZFGwFkJlrihZocKS0+qZs7jheFPCi2lwNtaYqqaChJ/k/YEwVrz2fmoLsrB1dxIPmCoxCWvoVwLruDYBhABoW2eflQAYBU/D7JeOubdrCkKxh50uILvdk+EThvl9KqFXVQaTTx/k5BIAjbfI97LtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=pSxMOd+U; arc=fail smtp.client-ip=40.107.96.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="pSxMOd+U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEuBIgz4ygtZe4FyY6K+8jpy8Nyf7FmevW7dpyOPSqrsKSxEz24lifIFH9HOsvxplEwRn9hiIQ1aZWVTIfTV0j2VkUx3Lt1Kof5+nMWuqkGvBXSqXUPJV89qPYzbwDBOPWjUDs2rLuML4tGbjp8VNzdXGxOYr4JAZLxaREhiDdlffrd2aAdq8/C4oBdxg8jtkVGKew9ZDPMH4gx3SB9DXgp++Rzu9ofWoCFSH63hvzjfW3UB4dt8XwUqB+FmoNkU4ER36A62MqldWYUlU28Zm6WVnbbyOOZ7tS6NcFJlEl61x7jiCrQxv1pPpUupG6v1Y7ptycyedXGzHoj4lnlqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mZM967FI+NsaGy01tRHwX7qbhjT/Q2ryzVd90N0QpQ=;
 b=gtkD352qH+TlzMvO1j6CRbenJNYDEWiu7ODB/S+RFttByRvL16Ce/OR4fKsdGRZn7Tv8JApaLfedOYBbiHP9L1Uh3EIay97yb6kOp0sjB7UVOvi+0Th9gJ8yINJkuv9Buu4y10t2lvwSQrCBrM+YQp2IHdjS+IfuGNjJpzqittT/rQsMQ61JDlsW8HgH5gFzCC2f+bMHA7gmeU5INLgyE3YXHeby97w1Nko/eVyLZiEBCIXzlbHtRz51J/Zv/v3070pHanV6ZCU7qgmPl+TITdzJiF9wYMdm4a9hBJfeww+HIeNTu7nCx1y6CxGREzeRwPyGhHRvJXJ/cOcGU7ikqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mZM967FI+NsaGy01tRHwX7qbhjT/Q2ryzVd90N0QpQ=;
 b=pSxMOd+UqUFNANc0FLO6IH+cfMLzEzyCBOmeg2rswN2brXP1ShopApK5DoZCM646oxzeprTsJK9LhBqwOYKF+L+9gtfQdTGBa1rdc0Qyo6lioE9UzeGyPNKPLkO+wQLnApLjzV9VPwEsvTOmbnqD7TmOmEidZAulkH6jV0nP/lll4kYAo0Aw+G+W79Q8INNrFETpFLa8O1hstLNJ32OhGxG/rIJZKpWUEeRYAbELXRDh8KZ4/yQzNRAn3n5f6qT91jPrN1hny7gVk89MgARJMB/w3PsDL88jdNWpK/Oy21AaUO9HsiOxUjr1s0ll14DlNoMBacKsMi133QD/eYkNvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 MW5PR03MB6982.namprd03.prod.outlook.com (2603:10b6:303:1a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 17 Jun
 2025 08:59:48 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 08:59:48 +0000
From: adrianhoyin.ng@altera.com
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2 0/2] Add SMMU-V3-PMCG and L2/L3 cache nodes in Agilex5 DTSI
Date: Tue, 17 Jun 2025 16:58:53 +0800
Message-ID: <cover.1750150179.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096::19) To
 DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|MW5PR03MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bcd7c10-2799-4b1e-8e3b-08ddad7d5007
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UVxc3qNDNWXb10sz1lNcGneYP3vp0yEltHFhiLTIbY+YRAcbOmiLDhtHoTMe?=
 =?us-ascii?Q?4rnebczfB7Xf9mMMzfh6Ec89ol4F037n6nhyxDTugyGAk4m+F7c1TAfgZ2AN?=
 =?us-ascii?Q?gQsnhd3ULrGd8F/3T7W/LTNGcX4ze+h+yVFLN/wVp/W5f0Q3/kQE4Etg+8Sp?=
 =?us-ascii?Q?2YK3YafT3chOM/9aO3T658ocoC4uUX4AOTnV5eD853uAKv7TKD10FHtmHAkD?=
 =?us-ascii?Q?qIUjo8rZkkLATX4qdFaXepQWTvFZLcVFjCORbLnyvU8Q/gW7f1gNJ5PfOG0J?=
 =?us-ascii?Q?tT2BLan+0luIJ2Ko9qdwXnFJ+vE9jYDNtR6HdKVcFf5Z28x4qaZIehqgM8Dk?=
 =?us-ascii?Q?OHt3HUaosu6ZEjApWgOaSpMB9VjNB3FcROY1muLWsZihFK7afx8VDLwnXsRm?=
 =?us-ascii?Q?QWzzPiH5ktcIHqhxepwh/fh1KEJpv9PvYuASGooV4zO4PLlgo5l8XQfp4KbZ?=
 =?us-ascii?Q?pfMGxXBurkqkUjnxAArDX7Zjb5lpRfmuda9DERN8fHWl3iwqpVPnh6/hOt8T?=
 =?us-ascii?Q?7FyEsflYvE1JH2xy83J+jSCB65FYuqGmdSAibMFZ4jA4BTMHTRRpJAbRopXH?=
 =?us-ascii?Q?njEBGWp3fukiqGv/NrQr7KtyiQwC8Rp7mb9uQmHKgcqz42LzCViAgcOS4NaZ?=
 =?us-ascii?Q?0f+UoLpdGkmu46YdYAvcEA1rTPA5R31u0KGvtSsRpCl9+pJlAuWAlka6EQ2g?=
 =?us-ascii?Q?5Of4xH6ZziSVo4KQmngm4y9LBgYhmmJ6FImVxa1fBpmt7pB4bJzT0C7eKzQm?=
 =?us-ascii?Q?PfvmwhR/KcTj/5fR45khOMTuc86KVY3/4vhMXbnohh7e7Q3QCAokFNuyUis0?=
 =?us-ascii?Q?68wf+KfjBm5aGAe0UqLrQk5NAGfD6eiu79AMngPoM2WhC3kW9Wbk2Jgblkir?=
 =?us-ascii?Q?YzEJGpSMQRYNeG4SRaaknw3SZO7A4c55we320XCYOM7EQ/ygbaG9kpzHWMOt?=
 =?us-ascii?Q?V0eu+98K1bJyPTfLzO1kIe0I7MX/Cjd4ILoVST334vTcO4ypxQfoovMdY6/P?=
 =?us-ascii?Q?tkgSAyi7JKIHo/OScIFmP3ZUEfEh6dOC2fRA4UOXuECBdYTXdhl3afawfHjc?=
 =?us-ascii?Q?t8AhY2/PMJF1levUKrw3tYWMDvTukmMkWONqUppTK9fYASYThnPzP+qjOaan?=
 =?us-ascii?Q?PThk33FFJ2yRit7UczEO/SS7HF9tW32LzWGWfVZs7BTC8Z+mR0m50Uw1R36i?=
 =?us-ascii?Q?1w4qSOATUg5sis8Y3LAsc7xy4ydAVpXkSH/y0u/SPlYXtX94BOVpagFuPEMu?=
 =?us-ascii?Q?TSesVgzRl15JpM67mbByksGOc+INItRoIBHZ4VWvk/nlgfijnJLqpRgaYJDC?=
 =?us-ascii?Q?bkWHHelkbLLNqdk0ACojRuz9keqc1UxUtFkcxJqeND5QrXr/2zrExiCPbEVp?=
 =?us-ascii?Q?2r/0wyHAEaoaEoccGxSl5OxXyeHcm0BBK2YYxAM/aBPYpOmszSfLV3j/p84Y?=
 =?us-ascii?Q?EZmThK/eFmU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eF88LgUNk+YkRZYmNlQRcwhUC1qWI6P8s8LJC4MBhBK15Ha6bBKYb1lHen2V?=
 =?us-ascii?Q?k+x1elYu8hHFQZcuH73//K+5Ko1oZWcJf5y27AzR/LwkDkmjGg3uf7oV9hBa?=
 =?us-ascii?Q?JcyG7F5dS98xQjPb94BHmowQ7kM8u3kEUZDt0b1YXVCsm7Y8fIadSi5HZ+Om?=
 =?us-ascii?Q?XBSjKhgtk14YgIZlF/lPv0Re5eagbjrFTJvb873TRVfvlzPAjl1J0TF5gLP5?=
 =?us-ascii?Q?/FpVhSKaHF1DLHocC8Zsi9INH7jLCJ5M5d18GrJKvsX2ZSfBA1H8KrDZORom?=
 =?us-ascii?Q?SI1vsMndHZbtvoj36gy1dB1M4JVUy2kynMyAec9lugldso7vk22svbT6TO9E?=
 =?us-ascii?Q?8RRRmjzOWR10lcPpx88LIw9WmqfcTIYdZf++6V8mDi1S8YkQza0RhjNbpXwK?=
 =?us-ascii?Q?eQjTmyJvU7kC0ERTD/8kzIhCWCH4bbXxo1RDl915XY7NfgE8zHejyW5qPEY3?=
 =?us-ascii?Q?Q9poZ6sP79z4PJ3upzFIPeV/dEoUJ8HceL+XJ6y1EN2d8UL4w6pVS8f2i7VJ?=
 =?us-ascii?Q?nPfzv9PcgcN4fWwn9r5lp2XQ9S8XROPr1R3s+QrC5aN8Dl6D17k8u9ZXulUX?=
 =?us-ascii?Q?nD+6CpWTUpnPbezF0ejRCKMLAZ/P9HpXS+TG7jxJPa645GLkL7GS7iA+JJox?=
 =?us-ascii?Q?xSA0bBCYKjlwvzN1n1/msY1cx1Wwcoro/aQhgP+rE00ChGoBKr9zq2gs29o3?=
 =?us-ascii?Q?pIQ7rKf8yeCkp5eXxZDQ8M7O8vr5V7lZYlnZTBmGf3n3ZjB6D+lVaty9Y5gp?=
 =?us-ascii?Q?pbuH1k11muTR28f+Gz6N+B2YOJAW+ZIGoM4WFerbql/82RvoZCeuyMbrUJRd?=
 =?us-ascii?Q?XkmQOHniHoSqFynjzYcLs72tWVsnjSKtt3tM4KolsO4dxZBo7C3FM1apHuRJ?=
 =?us-ascii?Q?n4avo/+PwWv4qtE6ADjhjBPcl+ErXfdFWOdVeYdtmqegYSn3lS2JQVl6msZs?=
 =?us-ascii?Q?xo1GNJUSVy8ZMvOHkr8IFLZVgD+sYiJWBkxFIhDqj+0ZPRK//DIL8Oj70WKF?=
 =?us-ascii?Q?tCzcvTJy0J2xNLY3b6gFUwhiHV1ekWTcmtIaNfsHOj8T/tpUwCmTNdodZaY2?=
 =?us-ascii?Q?Yztp4PrPYeqWg2gu3i0+1HgW+YLfZ5qgGXH/5uXftsphxd2qNAvRftPOu4VM?=
 =?us-ascii?Q?YGZYB1SISICCPV572rU2S9JLfEhnTHbm2FsnaPzgcNwMVonXUF5X4HD14a/9?=
 =?us-ascii?Q?PkE09dHBRRaiZPt+/sK7q63q+jFd8HC4LBqXeDvBorxZablEUEM8lDhXGmCR?=
 =?us-ascii?Q?PIevwcYRfxtnsQtcalG6xmzHnqa/u45iZv1A1DcNvDuPePsy2mZaE8LRaoBg?=
 =?us-ascii?Q?Zq7gurEHViyxnhphPKfD9pWxELkIs3MlcgE6jFkFzP58YxQpo5cWcxdkiQE9?=
 =?us-ascii?Q?hu+wAfPQ7gCYsjLt1BYpTl5zRJdKF6Ev19/ZTLT0u4sz4J5xctLnt5iofNbA?=
 =?us-ascii?Q?PoVqJB6R0nJnVYaerlSz7PkTSZjQGLQA3gKix2G5kUDIrhEvRmupLFaDgdgt?=
 =?us-ascii?Q?8YnG+nzoLJKTYdhsqT+5Xq6fHd6qCC8eFA1oaS2XlrBSHTwdzPHnvSJeWfRB?=
 =?us-ascii?Q?z/8ISD1Bq/U87hizXO59Ol+RhpeneS8oigF2wiiRel/EkxOVG6hc+K8TTe51?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bcd7c10-2799-4b1e-8e3b-08ddad7d5007
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:59:48.4942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnnYvq9vaXB3Pky54z8SzhYi//fIh5moxGBPPkQhFDuWwwvMqyS4WFtDOkK5xKuZTjPpuHFv14R0Yi+WAHGVp87VIv6mjDFNtFdAwcyH6Qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6982

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

This patchset include the following changes:
-Add SMMU-V3-PMCG node for Agilex5
-Add L2 and L3 cache node for Agilex5

v2:
-Move MMIO nodes into soc@0

Adrian Ng Ho Yin (2):
  arm64: dts: socfpga: agilex5: Add SMMU-V3-PMCG nodes
  arm64: dts: socfpga: agilex5: Add L2 and L3 cache

 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

-- 
2.49.GIT

