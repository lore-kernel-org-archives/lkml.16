Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED12522E3E8;
	Sat, 14 Jun 2025 11:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749900234; cv=fail; b=ru0RJUTvzyEwOkBMqfVV7EunPQM5RqxHHIMie17N0ZF8buPx/tLxfLqZBB/aeawsoWM/EgX3ZIOB1da8nY8/ucSTBwhuYxVkP45UPp3eAqp/jyS1vbwAjwamAaUWPLBp0e2zPpTHyyxSFBPIuFw1/ln84WmsrgBst5VmHDXmUi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749900234; c=relaxed/simple;
	bh=phaIfut1xm4YNFoqZ6LUEooINZT1/wbxjCitIXgU8mA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=riY7WqUP6k/6VGFpvtKnfond0dPV/foRpgi+y708tR9Mif5t0GK7cGqLph10Dm734rUFkFIEbfeli/0ohmnpucHZJHO3yflR+uwChPBnU8DP+cWCM+eYT1FnAVngWI/Ust6WSmXsExF0RBUZF4uzsN0NPx3wX08AqA4zn8Dg1bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EBKAir009257;
	Sat, 14 Jun 2025 11:23:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47902808hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Jun 2025 11:23:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9/VHUCCHHzwvdlWeb8fb4ZNOJFzk0xH0L/S0GX5bJZVDSogZ3yQbw75nR2dS3oQIoim4W91x4Omo3oEigjBuhLw+w5nJZUTCjpXVxvnNIwBqz9RUF4ojH2iuuM05QA01sp44EUqMIvsA3v4tkq+Oak8gKMBJqxNWFLkui3fyKF8cZmNSXygR3EcQmK81z6ccCvig1FcivedNL7cglzyj4rrkLZwct4bDdAZfZflIIKTcyuUez3XGZDv1HBgs4RcZeI4yx6iEXJYNyOUEiSxVKH1whLCCVl4OrhA6hRTJYb2UmcZjhu9mll4msUbkP1i0XWuQO0/YGBr7kEKE4VXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZXLQ4fVL9V7bDrSoAO7l23OPlpr8stQEaUh1vXev98=;
 b=fiQGJXIxYgcQjWa4s7oHhNCCRQUfP2CmOWiBSxwSVxrtH0W08C9/2AfdVPq5PeR/3SzQ7CRfxGdoa017fuMsWtTGM97KjM2FjR4KEvX6ONXh63DsgkqcsxFEj0oTP+tdsBEgxTiQyz3rebKDiPLwRIuvvtM4c6keiMtdvvG5Ply/F0VDejhbMs4BDRGrXb51+tZ8BrbXcq3rUofeEXnJqVELvA6BPbvHcEwU2o+rS+YfA8Gv203HLGAGvAxl+Pp1tdcdHtxYa+k/BYDeo8eG/SWdxc8VaSqGuh8tIiU5GTjxlKVwUemy4wlUelEEm4sRoe+Ro2ufe9zLNyDZlEk9Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by DS7PR11MB7931.namprd11.prod.outlook.com
 (2603:10b6:8:e5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Sat, 14 Jun
 2025 11:23:13 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::18de:be50:513:1a84]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::18de:be50:513:1a84%2]) with mapi id 15.20.8835.018; Sat, 14 Jun 2025
 11:23:13 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com
Cc: xiaolei.wang@windriver.com, linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: imx: Fix an out-of-bounds access in dispmix_csr_clk_dev_data
Date: Sat, 14 Jun 2025 19:22:55 +0800
Message-ID: <20250614112255.2838154-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::13) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|DS7PR11MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d7874cb-1e51-4806-ac24-08ddab35d99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sY8/BLqCHcfqs0q3MybHbmP+ec1N2tFuFcQQt5/S/kQkb/iAVr4W1lRSU7Wr?=
 =?us-ascii?Q?C0tzGSfm0Ro/e5Tnr4qkpg/tTgO0kLa0+dQxhKy0nlj+FJXopQK6rn+Up4iI?=
 =?us-ascii?Q?YWSXkDd9+UcbzAS53Jq4nwna53W4L9bJivJQvsMOPnGN7dcU+iZqQD1wlYhx?=
 =?us-ascii?Q?ih+fUXo9AaOrkKQKmAkfhpbDOyFPUoLmKKKdhpAZ9ifM+QjgDFPhqnjHW1Ex?=
 =?us-ascii?Q?Oxgtl1Ada0wl3gUEgQumaP4MBx8qJ3nJxHQn1Fefpq7UVUgvyCGZI1h+5Fax?=
 =?us-ascii?Q?gvGB2lnKts/IQSr4by057smPh43Dq48OW5XaGnYqLcTCJc4V9qJ37PELsBsN?=
 =?us-ascii?Q?Xl9aj7wV/WkQuNQHi3eJjpDDvPxdmnfRzYZ14wUBKKmkY0UcsV0NIxqpiGRm?=
 =?us-ascii?Q?JztCh1peGgNvse4FabmX2Xz0nYXiu1H3KRiSdv0ElIY3c8WwuLDQ7ALPMPeO?=
 =?us-ascii?Q?vkyects3Q3kg6aPyj/VhlGY5zkVHgCLlrQwkUqzdvkUAD1jdQpQ8Kt7nmXbR?=
 =?us-ascii?Q?U6F9m3Zi0nn3w2px1dhnRtIRF+IrgU8H4hQZNhpUquaGFMB805hQ2k11vNLo?=
 =?us-ascii?Q?Sktpxq3t+ee8lI0imW7TaxH2ipO5evTyrYfpG+QZorIyqxbAnCNC7uIWqy1y?=
 =?us-ascii?Q?+nsRdaNsHt1ApyuRheoPOyy/uGFaRivhqHuCDRvYHddvoP+jS/FnIewNaqmE?=
 =?us-ascii?Q?pMLir/7MdTGW44qZ4JzHjhtdx13AYxeg7vopwP8WRG/gmyBmdG3bSF/YYk/k?=
 =?us-ascii?Q?eSgk5SV3hVvzRQZ6+Cocxc9laf2qXIhBQXbEGzuuEaJCDccduUw1xxsXObHU?=
 =?us-ascii?Q?nWbgCyYROySSJDTfZBrwsJ6HVrwoIkU5c8yEj4ms/7OcKvZk42TTGcVC7mwQ?=
 =?us-ascii?Q?DYM7oveL7Gt9yK3eK+kWyOBcKTCKa/mnKCxGfJP5vnBWGgkBGwhfhCmT9UR/?=
 =?us-ascii?Q?cYEmuPbUZUd4Zp9dHE/p/6LC2fcy3GhKPIGVtUA99G7a/BSuc+G6u28ikKz9?=
 =?us-ascii?Q?IW3xH5PPG79Wlb6Nfi0uEOKIhIJgS7/jh559G91adJUW2Ie0syUW5pEqLRxK?=
 =?us-ascii?Q?4/IqouYCQgZKduCYaU/lzBZbqPSpr6ZZxgJ+YRDVlLa1c1wT2M6Ml8XhoFso?=
 =?us-ascii?Q?DDMa2SS6/X24NQwsGE5eASxBhQjRf6JXTi+/N8oMcKDePXvJ4w9xYQFXs1dv?=
 =?us-ascii?Q?Qh6SOJRziGL2NpGNl7m2HjXXzkNotU72ge/l3CBcM3do/uEVKpnA+uiF5eL5?=
 =?us-ascii?Q?qF9UJCKWNj/Zw1N3l7IQl7ii5wPZ/Uo+19V8Kgh+pB9kV0iNtMjEDpSBMWyj?=
 =?us-ascii?Q?fg/yh1y6gC6DK8q0VgM84At7PaCUYOLAivFoFftvXia7HNxUdYNnOiVJoTJa?=
 =?us-ascii?Q?BvHxSPaHCm9QhvECVkTFzlO51jreXL85sp55ibchGlFNMfKNndTpGCkBRVFU?=
 =?us-ascii?Q?lRKCZr0+e7bLGi8sLze4ES2cuVKt/vMOHCkDxcEb/a7a6b0h9PpSHg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rexvxrptzDPvNlzn59akUPbU07ydzA6g5MiKT/roL7SflLw0hl2MR2SAPX9X?=
 =?us-ascii?Q?zasb1p252uvhFJk/Zyat9dtBi6++phTAgmSlNzu/RJJLTgG9QWPpOiJRZ9Of?=
 =?us-ascii?Q?PKXSV/Y82GLKoWFLtlpshfvAtAwJKhE955IiZlrzoXC8DyiAkGt//gIQLfT2?=
 =?us-ascii?Q?mIZp7CrtDT1pw76MP6DwAOcwwaPapVvfdkE9q7UcOprEIzbed3h+V/aefNzp?=
 =?us-ascii?Q?o1ZZlW+PNcaTyNWfPrz9+9seD9YVCUxf6Q2m8vvmRZ2N2lmjzT3hC4TkC3DF?=
 =?us-ascii?Q?WXZbVJfNNfX8uR5ATVKHFkW7T3z03INhFLQgHuxK0kH0tz5wzn9KBqhoJ4vJ?=
 =?us-ascii?Q?VbkZMCH4LdrcAN8fPx40SB9fhEG+A8GZw8YFcQeeP11zhgh6RPFxB4hWg3fJ?=
 =?us-ascii?Q?LWD4eeE9QjRU4Chg6QlWeZHJ005RitAY2MyUvCTfQ9GlVslGQrc0FYWpMMxQ?=
 =?us-ascii?Q?lJKplPq075x1Pi16FUe4q5XhZVxoI8S1EqGitGP0Rd6aWmFiwM2+vEjseKb/?=
 =?us-ascii?Q?ja7YrpQiwpHZqnTnDV9aLpdR2IfAgsSD2uQVmsH33B7U0tEssPmnCxoutAnQ?=
 =?us-ascii?Q?Rurvia+G9VjBm2HxHItEKTi0WMGVEJhXrMfK6b7HAo2fpQpdyxqnkHVbAj7t?=
 =?us-ascii?Q?C4SKAAKI5ZTi+gnataVEe7zP6YrL6H7WxX315g+Tru0HiZF5aSjNvR0GaMfT?=
 =?us-ascii?Q?SeFfx0AVO9QRc/m6YUtiPieFFWFAwEjgV60zeQ80ntLhOB9se8p6ipY7777h?=
 =?us-ascii?Q?FI0duB1e8cLmkxrLxwbZlHItYjb8TaABcVXnN5fQZUBHsnnyLjvNIdYkahBA?=
 =?us-ascii?Q?bezfrkDDm2RrkMHy30Ur6FaeJS9RPTAOsLJ5nqlnJsjQguLRg7bx2q9POsMP?=
 =?us-ascii?Q?XY5XG9nhHQY3j7FbWVR/I8c4WkgBXtJcBqVAnhTNHAI4bZNiNrU6VPdkV2mQ?=
 =?us-ascii?Q?HCXjlFiQQJ/6kT4gu2cpRNXQIFkkDsd0pN3b25MR+c6Ps3Wpt8uXJ/B/oQMk?=
 =?us-ascii?Q?tr7UH+vNC9FvpHN8XKiBt30SQXTKaOVmFQXY61G78mHRmzNPmip34Se3nJ0O?=
 =?us-ascii?Q?tAuan6LitlOEtrGTpu4shCtsq3KryXm65PZ2+kaahR5ArYliQvTq/IUOnF97?=
 =?us-ascii?Q?ZxuhwqtUP5laJ7vP7GaPoAbCVLlxymIyUbemZsFSgKXspOdmylbtaqd6DUe3?=
 =?us-ascii?Q?EKVy/m1LSKSg7zaoW9gWCxVYhtkxt6nfeKTHpiPsOdgQgoSPcuhkOWUNaA78?=
 =?us-ascii?Q?m2ePZvgFck8JgazJ30kjTXNpQfroX9YRZLv4KhzMmhCugQ5DUMn2z72EmxjF?=
 =?us-ascii?Q?3//JRiatSpQWIOhSYvES/S4G1MNxMH4bUQermZLYtCNY6TIpqdDjDR+KU8nm?=
 =?us-ascii?Q?oG+1RtupU9HALU4LD1ufQPMH2CSi2xJFxMi5dUTc8rnQ09cjOTRG+XWi4che?=
 =?us-ascii?Q?c+PvUJ99cmD8lT99sYYtaXsL1SYRTIFvxyFDaxoMD3nzlyodtLS5pFsMCUw1?=
 =?us-ascii?Q?0aMlTCrAQaNOQjzZWAOizUgliRpEbbU3Jeb82wHdzp1nIvaEJ4WAGG+zr3iX?=
 =?us-ascii?Q?x1RXp/wTOePJzKEviWZ4IorSBqyQ/Xgehnej5RtOrw/dXA2eAmG5LuN7WNJn?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7874cb-1e51-4806-ac24-08ddab35d99f
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 11:23:13.1537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0EuM27+K1rVr/H87rcfj583eMHCgeLCrlA76mzdBFKwynh0yY0VnN88eyLhA7m3xtloPYvZBwJj3xrOgopbQolQdfIc7nu8wcDPaWE9AB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7931
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDA5NCBTYWx0ZWRfXx85tP7bz2SnP 5xSpW+DkRRSEVWVZ5x5ms+f2xE/Weo3WLwDRQ9rN8bu8oTxKhxiV5JGu0T8uUoK6JBsvJkKgghJ c28MANBvledZ6DlArFWctsnUj7oSGz3dEf1yuC/1B72zxyntQRBocLvc80ZvZctz2mPghX+ZsUc
 mS0poNkAHWfMptAQpx5+BsdI0OIasPK99J15mBBpTNqgdt8WNh63hBTvNzlqQJ+KEBhyi1afvgc s5e0LQ+q4azyU1du01tj5dni0+gOYHV+NqE/J2pQTiApTdZsSGr1pT0TCPtodemUdXC2+Y195go dEOZTpsARRoFctHVYfLGgMe1eDo21dp/BjTX7SRk8AjtT8SzklJZ18PMo/kcWNlALFryyiT7Avc
 maU9YC8SKIzRJw/VjaO+8KgtZDGwAvOa+0BlY32AESRarHqqjd6UXUWRH9Mx6Y/RPj8YLRkQ
X-Proofpoint-GUID: gcoKl2SbTwJz-kT40FjAjGsEJPNR7GaT
X-Authority-Analysis: v=2.4 cv=ar2yCTZV c=1 sm=1 tr=0 ts=684d5ba5 cx=c_pps a=3HMnoyM0ZnVJ7rqtKH+Jgw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=sX2u9MPDmDp8-MYZQ90A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: gcoKl2SbTwJz-kT40FjAjGsEJPNR7GaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1011 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506140094

When num_parents is 4, __clk_register() occurs an out-of-bounds
when accessing parent_names member.

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
 drivers/clk/imx/clk-imx95-blk-ctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 25974947ad0c..fd11932b12b3 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -223,7 +223,7 @@ static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
 	[IMX95_CLK_DISPMIX_ENG0_SEL] = {
 		.name = "disp_engine0_sel",
 		.parent_names = (const char *[]){"videopll1", "dsi_pll", "ldb_pll_div7", },
-		.num_parents = 4,
+		.num_parents = 3,
 		.reg = 0,
 		.bit_idx = 0,
 		.bit_width = 2,
@@ -233,7 +233,7 @@ static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
 	[IMX95_CLK_DISPMIX_ENG1_SEL] = {
 		.name = "disp_engine1_sel",
 		.parent_names = (const char *[]){"videopll1", "dsi_pll", "ldb_pll_div7", },
-		.num_parents = 4,
+		.num_parents = 3,
 		.reg = 0,
 		.bit_idx = 2,
 		.bit_width = 2,
-- 
2.43.0

