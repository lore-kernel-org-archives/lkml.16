Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B31015442C;
	Wed, 18 Jun 2025 06:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750229673; cv=fail; b=edgVo2xugt2yUpyDUO8hoxDrk/bZ5s4OB4gTfRZj3b83dgP3VpMqq9MEkIw3b0OXcunIQBsTViGFkbAZxHBvz+Oq93LAoPNB2u47qXbXkXIpcWVRrVb4fDbclWmGEAA/LwDl5Bdm5PnLdQRnkhOmMYA8ShV3XhqQhnaMu0SfXqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750229673; c=relaxed/simple;
	bh=zhWjEwXN+Zgcx5H4L0Fv6z3gJFozrMZA2XmNm9z6G8I=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uUF00I2/GFtOqNzybi61xapaZhRMikfkSE6qjAE+MSddP/3RdRFSC+7IiqtMJQF/eTEqIUAsR3CQ6Q6EOwQ876bpSXXqKEVA5wQW10iGzV4mtsnrLtslEQ2TSkY6E4ls9GRt3inzJXl/YzUvDFkRTQae3wcn0qw1KF9JtqbLfSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I509Dg000483;
	Tue, 17 Jun 2025 23:53:59 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4798kkkxj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 23:53:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVboVk6SA/vlPu+DIb6pdg5dCgLgJYvlzXhrStbccmKccBZa2eb8wIBxDw/t/G94201POTn5lhBqdvo3Z+bL9Tp2Exavgszk3mqKhjt5G2VbY0M3zMyX483W1Ba3ODVp34DqTZx+XLP/A1rBDGMVqS+VvHp9fFiwBqYcFrALpuiGpOba8BFbPDxLLusQWTghFPEplKT5TcFjpvJmcLUHKGFnDluVWq8GS2JOhuZ4xOpaFDjTaE/9uB3vEyTKmTPB6Znitg8PRw6NxMvv9pJr3kJWImqJ+mioUttMmRh+PexNmehL8NJrYRlQxSOMGxkdmVA5DcwNkXp1DerJrTVeww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HfNh1brIN0WjG1JxevNJOuKwswcZpxFJLP/aZyp9Qc=;
 b=cFPCQQrtUsQQlOJUB/XhhII0Viz+JVUoBGADluuF0b61KExjOpe0q8wWTiavhjXqaNLlNvs/8XDRd9XpZBlkeb6xtQAsxqMa0mB2BIzt95q1zmHxXdaMlXoLFILnmpXe6xfuHfU8ijhmnoZusLIpuFOh3JkVqcGGMlaeUlnMmWKyfbFoTI6CJZGYicN2c+5xF5RVtukzWynVGPlAa6t5/W85Sc8iH2h51UuFvi2w08z9+pf1LV5qjDFikv6Mos7zoSx9AchyyqgRWcblX0tFh90wtFi57X2G765+wUxzcD/o05AH8x+FLZ7U3WUDn0iKg7SuGxDk1xo0BJ6PhynYzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by BN9PR11MB5241.namprd11.prod.outlook.com
 (2603:10b6:408:132::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 06:53:55 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::18de:be50:513:1a84]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::18de:be50:513:1a84%2]) with mapi id 15.20.8835.018; Wed, 18 Jun 2025
 06:53:55 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, Frank.li@nxp.com,
        mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: xiaolei.wang@windriver.com, linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: imx: Fix an out-of-bounds access in dispmix_csr_clk_dev_data
Date: Wed, 18 Jun 2025 14:53:18 +0800
Message-ID: <20250618065318.319339-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0294.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::6) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|BN9PR11MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: 478d86c6-80bf-4b14-b3e0-08ddae34e46f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fp4SgtEs9l8UUHvxDpvRBNM7k7+znH1pSq1nNnJSqxoJdC6xf3OxOYsWxWr2?=
 =?us-ascii?Q?m32bgHErwbnw4yONe1S2Bv03sVK6MEFxm9ttgs5R5O32blFLy/U53rXWNAWB?=
 =?us-ascii?Q?9cooMefznrSx57GObJpWpZ7QW/sO2k3x00VSNtFGxocYutapKzJT0zPadXp2?=
 =?us-ascii?Q?ScNWs5QgzqL3XBUDzD9wE1lOqy78ewHp4585DuQiVCxKLVxM9EqmSWJd5Va8?=
 =?us-ascii?Q?gQSG0s5RAlkOHnMCb5PCbHKTZWwIqFqhKaNDhw+ZSAKAuMDi2ssuDXWRmqay?=
 =?us-ascii?Q?F/9kZKpBPCecNvNV2JNPMl/HoI7VlryRcEl5MalC0nUKPvf4YoqDlfbfSZCK?=
 =?us-ascii?Q?yXC3b4xguC2e8V4sEZX8aoTSf5CJHJsOdL9OetX3B8XCuwL/N1N//UEAc83K?=
 =?us-ascii?Q?bvbD0xm0B9Wlzwc/Te4j9LlaXgyhALSpGZQvbbdXSbsRd6dolDilWc0KkU8H?=
 =?us-ascii?Q?IaiEHHwDU0ft0dFGU/tYQ+FMHtJqcQ9twfiz9IT7F5s8SD2jsi4FrZ0jPsqf?=
 =?us-ascii?Q?yMHWDbD8BIeKWAybczJ+zA37IPrgkjwTdixNQwgeXYxXLAdO9YFe96dcRxNB?=
 =?us-ascii?Q?JrChebkrO2xRfcGklnlMBVwTv5L6nRPoKwHYzuV+ED8cjnkCAhBuXNuNoEJk?=
 =?us-ascii?Q?boKQaSPLX9kTiS3xkk7VcDiUUFoVLvZgNmRO09yfTXjmGLcGB2bQRsgMO/Xk?=
 =?us-ascii?Q?QZS71OZ4RTlIQWjuLxezcjl21ZxngKPR5s8MZMLTqfntMucUAnJkbXrTG/SH?=
 =?us-ascii?Q?8oh+N6bMBEREpiX+2lDtnU66ebcXyOdeiVpdx0VRG0l4P/grrbxJNai6EqEK?=
 =?us-ascii?Q?NLAgkr8MVV9T6s3BduLvrz9hi7clh+XIPhISGGSFStOXVy6Ln+91VTAnK9C+?=
 =?us-ascii?Q?D/SnLR49lzqZK5BRdvz4mFxgsAOgBphy8mKYXFQK27O5lmQbHFvFERgTTDu6?=
 =?us-ascii?Q?wEd+UTpS/NVdwXzqo+HKO/mDnXpK2CsklkICazN5nI4mdKJCN0FIZsdUC/+5?=
 =?us-ascii?Q?Hsknu5C2JS9920ekjXBRoGQ2KJukl1KG/n2QmKTAS5xxAl8L0+1+ziEhsNqO?=
 =?us-ascii?Q?dJ4L9qmbFzvEuTq5Tn0/79zFZjU16a4Qdu3z558uhQx44JbOWxoRQmE0Fg3M?=
 =?us-ascii?Q?pNGbXXoBovLygI5fXnlr357USWRVo9QU469RiGxvVlP8/LeMGWW8Yy82LMuC?=
 =?us-ascii?Q?mkY77tY9mCtF6QSgR8DAyYd8mB6/Yjb3XJL62O3zOrcYN4V3Sf3hlp1zwZbD?=
 =?us-ascii?Q?Xpu1DZuwFEzqgxyHBzN9GJMH8DH7aWORuBhxMNh7sytU5m/h94ZG01pim1ll?=
 =?us-ascii?Q?JxrTAA/iy9OP5cV9fMVeBOvUPgrPTJRYbDB1qBuX/tgKo3LJQ2jq2ppjAIU3?=
 =?us-ascii?Q?Pe1BPYiu46X+xwWyz2+shHio1/XyTDmqi4PIyu5jTU2BotAML4hF6bbu6Ax6?=
 =?us-ascii?Q?gZM9oPmSbEikno5KARaKy+oH1iV/wwQb2T0FHqYR4aFT9MX1ToHOkjxKJ48h?=
 =?us-ascii?Q?IsuIEeDXz3hTtec=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qOSZeFF54/IaHmhzOnbMrO8VodCj7p8QJdNNoKn88wew+/V3CCHxxceEsWE5?=
 =?us-ascii?Q?/WLDF36jSq/SEcMmXJK5wheZk0P64ylnx4rkkRvRSLBssN60siRFY+Bajh2x?=
 =?us-ascii?Q?pCS/5Z40NVQ090g+g2HS47GjLR2uKJIfpVVStuktI8eMc599Hc+XHmkjiJvF?=
 =?us-ascii?Q?cthXOJmDpTxZ8t81i+gHVnDDLN6xdvyuKtxcOtqIo0GwFr2f0Je8aV7TYwIV?=
 =?us-ascii?Q?AoCBKWDnHBZFw+bUSYLPM3+8zrJD+ytqawtqqDl07eOOt9uveUXIcpepl9W5?=
 =?us-ascii?Q?eQnIY/xvJMRD4x0xtIIid2V0jaGBJNlRoB29BBQzFPl4WKJor150suObtyQ6?=
 =?us-ascii?Q?2fPd6D0u+qxy9S4oHc/0/v7HcSDCDxzkRlDWDYuS5UJPc009H5SzIvl8zmPf?=
 =?us-ascii?Q?omdpdInvnegoDe/GDUwn5sTDq+uWqlMc9uYL9xNDYNKrga/F3zJyrYCNJbzC?=
 =?us-ascii?Q?6d0rXBo9/yluLdlj8EOtVElye1Nv2/5Jy564+hYL9PyW0U/vbVwrdfvT45k4?=
 =?us-ascii?Q?ZBANf8hgzkOIOh8jPpSOos+4kO77NW+7klmIZu3drLVq1zgL2XnCG/OR27Rg?=
 =?us-ascii?Q?m/AunQmp1eurgrdXY9lF5WXk8CC2FoE/me3P+zGEK1T0ctWTGnU0vJDBz6CY?=
 =?us-ascii?Q?wqCAy6y+aUCs0Hf+1WUwslxd2EL3LFcRJ+8xgojzt6EuEx7DT5DdJUCOCJ9F?=
 =?us-ascii?Q?vRpjgGpfUdPiptcm6ltKgtGAEXDWoCen+nkecVzTp2MPRY5xvTd4kbq3Ct9K?=
 =?us-ascii?Q?l87Pufjq6S+mm31l7all355ZNiuh9Bb1QXJ5ZDw8OC8UjOyJDltJ+oCaQFaC?=
 =?us-ascii?Q?vmruz/eYNnVKkuEUD0Xq8HmaQ+uRzaBaWqa/hDGIenUkX1HafWnzNOHw2/RJ?=
 =?us-ascii?Q?w5oEana58eq1TZIizMVokexALLKtDNLvC6j9TYabnTTcz+VLaRIYz6X+sNFI?=
 =?us-ascii?Q?Bwhw1DsoSy0Cluth2t91J9sIwQ0u+7mvJ1SBnA61rfsNkZPGLrHMlwPUC9Ur?=
 =?us-ascii?Q?9s+WBnDQrN3ExotZUa8WnDpz4IrWi/peYFeGr57BeQ4rO2AWeg49q7WXuhU+?=
 =?us-ascii?Q?nWfB/bpwwLRvI53BvZ9e91xqvLJ8AtsU1Q3gZmnQoFQfOnXHkOo7g07u6WLE?=
 =?us-ascii?Q?IIxHNU8aUcl6uT8A/DBTHTpWFL3FDMk6CRKMzKNtdDz65XmNO1Q6iGmvGwEI?=
 =?us-ascii?Q?gcvBpP286+RAXm6RODLKU3Ft3MLFpKGNbIL5pnOb72fGIP87ao+B1ASGLSw8?=
 =?us-ascii?Q?8BbT6jAruOsjYTu8N4QvbT7K9u8fKam/bjWir8H9bCMqTfWw5Xfa+j1hGq0v?=
 =?us-ascii?Q?o+9FKxB2QwqVzBIa0K7sWltotDsrUFOkNybDUmcF/IRdUCV0l44rirgontNq?=
 =?us-ascii?Q?dTxtc9OixGqk2gao+JIMO/2EYYVao0lVGpfXoSOhltPe2dDmmmoNUKMJELsu?=
 =?us-ascii?Q?N00KvzFw4lMjio1RpeoMjO866bLLT2vWkWBlcgti3PYINsxNwBL8ZkCPcUsN?=
 =?us-ascii?Q?jYvb2EsCLRgFtitfTO6ZKXERdrPQ83zGmOFFn2FPTH6rSAtdk7N45+16NaHE?=
 =?us-ascii?Q?/vSLChc6NJr+pQh3tJ0A9BaKS/liO4VlyKjab07Wv9fH834SvsJvlzHCN/NQ?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478d86c6-80bf-4b14-b3e0-08ddae34e46f
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 06:53:55.2876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BI2yjTFIN4Maxg1b1WasH6WBdkOfOzJYgyvLO7yDetrwCe5Mbkafbpuw3JodelzRqKixon9INI9de3Xc/XYjkl8p6DUIAeXzdkvwOWMf+XI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5241
X-Proofpoint-GUID: ibG-A1n4J_wvANx0VYXW6d0XFvLR5yqF
X-Proofpoint-ORIG-GUID: ibG-A1n4J_wvANx0VYXW6d0XFvLR5yqF
X-Authority-Analysis: v=2.4 cv=MaFsu4/f c=1 sm=1 tr=0 ts=68526287 cx=c_pps a=vb9HsekzWx2LiYkC2JKhpA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=8eI5hsvDgIIfQnGMUFQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA1OCBTYWx0ZWRfXyZX3TyYnRJrS ySPFYQ5KfT5aP/25f8Qj+VuPUN45Om01f7dsm4rpbRcHU5liSrWSzdGU3YW0a841ZXxfoVrjw3O JhmAMHuhlVNc5x3fsbLRBbr3WKMxFBc2D0ubbVPXgom9IErC3mJXo7Lwvmvvt8zi5xG/Jrk3sT2
 qRcI+zR041NZWFQ9DJxLHzAe4rjXgkMpX4O4Wntmb64n8KL8FtOSzqgVC5Z6qH85Bdq9CW2KaTo AVncKVGeYuUrTC5O4dqqswBpQLdgWEM13zbUhpM/W0ZlngxhikmHYdDx3RDyMjetTRhoVwMYphX +Ik0R+GCtV4posEvPFOhIwN0Ht1RqalMbXyg+tkdd4cgTpvWYCh5TQUOmAkuSuEvxrYRL/U23Ps
 fi5wxTzkUUfUHWohHOW6ot9K/SXOvk4bjUmh+EJ7zooS/F43KDFdUg/AcaTCw1Kr+7T9fWke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180058

When num_parents is 4, __clk_register() occurs an out-of-bounds
when accessing parent_names member. Use ARRAY_SIZE() instead of
hardcode number here.

 BUG: KASAN: global-out-of-bounds in __clk_register+0x1844/0x20d8
 Read of size 8 at addr ffff800086988e78 by task kworker/u24:3/59
  Hardware name: NXP i.MX95 19X19 board (DT)
  Workqueue: events_unbound deferred_probe_work_func
  Call trace:
    dump_backtrace+0x94/0xec
    show_stack+0x18/0x24
    dump_stack_lvl+0x8c/0xcc
    print_report+0x398/0x5fc
    kasan_report+0xd4/0x114
    __asan_report_load8_noabort+0x20/0x2c
    __clk_register+0x1844/0x20d8
    clk_hw_register+0x44/0x110
    __clk_hw_register_mux+0x284/0x3a8
    imx95_bc_probe+0x4f4/0xa70

Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
v1:
  https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250614112255.2838154-1-xiaolei.wang@windriver.com/
v2:
  Use ARRAY_SIZE() instead of hardcode number here.

 drivers/clk/imx/clk-imx95-blk-ctl.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 25974947ad0c..cc2ee2be1819 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -219,11 +219,15 @@ static const struct imx95_blk_ctl_dev_data lvds_csr_dev_data = {
 	.clk_reg_offset = 0,
 };
 
+static const char * const disp_engine_parents[] = {
+	"videopll1", "dsi_pll", "ldb_pll_div7"
+};
+
 static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
 	[IMX95_CLK_DISPMIX_ENG0_SEL] = {
 		.name = "disp_engine0_sel",
-		.parent_names = (const char *[]){"videopll1", "dsi_pll", "ldb_pll_div7", },
-		.num_parents = 4,
+		.parent_names = disp_engine_parents,
+		.num_parents = ARRAY_SIZE(disp_engine_parents),
 		.reg = 0,
 		.bit_idx = 0,
 		.bit_width = 2,
@@ -232,8 +236,8 @@ static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
 	},
 	[IMX95_CLK_DISPMIX_ENG1_SEL] = {
 		.name = "disp_engine1_sel",
-		.parent_names = (const char *[]){"videopll1", "dsi_pll", "ldb_pll_div7", },
-		.num_parents = 4,
+		.parent_names = disp_engine_parents,
+		.num_parents = ARRAY_SIZE(disp_engine_parents),
 		.reg = 0,
 		.bit_idx = 2,
 		.bit_width = 2,
-- 
2.43.0

