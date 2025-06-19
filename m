Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373B7374D1;
	Thu, 19 Jun 2025 06:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750314117; cv=fail; b=h43f1qoaRl0D/EB0y8wUrfBLo0rPPcnoiGFD9Vygm7fKWVMM/MoMd4TV5fHxVFZj4dFfT/vKKXabMGdSn/zgZYO2gFKTEiNTV5jjdKpLmrV/stQt5UCivRb9CMTlCQw1yu1/8WtOjuEHxsCYnqg4qeu8oy1QWE0LHPN0pe4X3vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750314117; c=relaxed/simple;
	bh=3Z38uiPF5x1evQXjV28bn+4q3Rbs7OcTJN268uOqlRc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nYPwZHkrUNugrbPJdWJP+B5iYh2Zt+n57hKbJdADSRNtsxvDCj2XhFh79GHCt2MO3JRWlrhDm8TfX//RbhlEkQ44hYmPRMzJz2JHsOYWpRFBJtgGY8QeA1UnipahrbIqUnDKevPu4AS4nIpM7RIka0Mq2N2wK0/fE7CW81pjLlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J5K8al002977;
	Wed, 18 Jun 2025 23:21:32 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2056.outbound.protection.outlook.com [40.107.100.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c87287q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 23:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAZfancVT48NAS1dSrkefrhRxCwDTd37g31S8AWyWkqGDQQtEh+uYd8XlcedcmeWSufcyKB4YBlDy/VZDwMtSmpt5rqUHGBxtd+oQPUcHPvtb93ud+k49C/6z5pEIsoDfEgO+lGNZBSV7Cl3tp62dMepyZ4wZxT0Lag0IzftNjrzc4pfbSQe4NrXw5xANJduXoaqkofEoYCRvxnJUo0y1yjp3em8+tbACviqlfki/iwaGWhne/AFXk3DzvsV+TuScA73CMHxBHyUzGarDHln5sPXLClCKXqmvWQQpw2L/qHbTkvdaQUR9bQH5IpktBu92wW0SK6S60AfZLl2OvHR+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+BBHubCXSGyhsiOzAVvyxdgiU95FD+QD9l/EV557Z8=;
 b=iikSqStribb03dP5d15T4Bd6hXr1be2ooEm+APFq183ptfO9SfpuMi6EFTQjANG4lBotSj1dGTbTvWizmdEaUPwfvK+Z4VyQB/EpwSG8QOK6QpSqKBbetJlFFkq/RUKsF5nQdsDEXJ6hgF+o6JFGRPGoqqxT+QDGFQEeNk+LqV5IS8Fq7ns0wqIdX6KQKI/dS4QBXJcAFVlp3Lz3BI/1WGHezJ1zLMHYwJKkmr7j/ja4KbnHRRfMXDA/Ift3QMbmA56vMoBlUhvDZBlLMCeUqRn6Dw5m+PIItGmglWNvQ9iuLkf2cKB84MhzULnBjb1SCShWT3cVd0ywhGLSF5rquQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by SN7PR11MB7044.namprd11.prod.outlook.com
 (2603:10b6:806:29b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 19 Jun
 2025 06:21:29 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::18de:be50:513:1a84]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::18de:be50:513:1a84%2]) with mapi id 15.20.8835.018; Thu, 19 Jun 2025
 06:21:29 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: abelvesa@kernel.org, Frank.li@nxp.com, peng.fan@nxp.com,
        mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] clk: imx: Fix an out-of-bounds access in dispmix_csr_clk_dev_data
Date: Thu, 19 Jun 2025 14:21:08 +0800
Message-ID: <20250619062108.2016511-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To DS4PPFD667CEBB6.namprd11.prod.outlook.com (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|SN7PR11MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 91362b8d-0a02-429f-3b8c-08ddaef986be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8mJ+MCMpuDHQOmfA8eGlHPhQ8axzZBZHsS8eeRO9GVxZvuDHPHu+4n0b4xE2?=
 =?us-ascii?Q?b7Y11Rh0xQbKjz/3VmIsQXR45ppwwNAwRp/dr7ANvGbYQGfb0K7/NwlumBKk?=
 =?us-ascii?Q?nnvC9/woqjNxDM3bO4HFkSxlGdBdZyuIoyEVr0Hr3Gtqo+AjuytRyQ9jlNXF?=
 =?us-ascii?Q?cqnvS29aOxZlqtDxP5mVevoCDRipIU+NvDN93H/R332vMpzmQKtokjVA1SLK?=
 =?us-ascii?Q?i/btMPRFv4Tzy7qVz//qA9U+eXJ5jsmW+IsZ7z2ZfJuZQyMgbd2+ndEPsio7?=
 =?us-ascii?Q?MSbi3XpqkeKOmPUHVi5c6Fh5CrDHDtr9wB9pXo/53s2gfEl7KMvQxj0TMrBJ?=
 =?us-ascii?Q?GD0kqaJ2kE1onfwsJOa2D3vVuPk/QroH19p6V28parNwItczRUnvvuHAGryb?=
 =?us-ascii?Q?i9+junNyEVfwedvJFeGBw2Kt1s2sYLt604dRs8zdslCdkGLL6HGG82KsXFrz?=
 =?us-ascii?Q?6LE0lqyo9ikptv4M8bE+zFulgLQg6boatqI8PDjf/l5Fh027/KG1sAqMJXTe?=
 =?us-ascii?Q?wQ0vEl04C+JCC3ivz67L5aqeuPqEVg3zgwqDdk6rnhRwt9itgrS5fwc+irjh?=
 =?us-ascii?Q?Ot3nW/ArSgc2db3k2deKPZAlDCt9SV5khCx1JnfZYnoHXSqALEoFzn/roPrA?=
 =?us-ascii?Q?yL5tIyc+UfEPBPaQC21CW3IhaTrxC1KisnTFtUn0vRLhwO6pxykLfsDzyBTC?=
 =?us-ascii?Q?1w/HoyZQZBYyYVpzaOjuTAKEo+giUBWPbb1D2HrgiyT4ltikGFV++KQ9svMD?=
 =?us-ascii?Q?n8xHCxuNWKwZhR48MasVp5w/3XbHtqydRoHAyUrzxHj0qB7zMYWPWvQSnb5p?=
 =?us-ascii?Q?hZMB+/G5iZqKJh7v1ol0PqD2KT900kxkmEhTeusPTm5l13GBi1Z18yww/C3H?=
 =?us-ascii?Q?RUdDEjFuLvN6VFnzCuOcWO6Ff4AWsii8C0OZLseYrqQa0X0z1bS9I04v21ny?=
 =?us-ascii?Q?NukPexm7iw2SEcIsvAbs3p0895/D9qJ1WW5sbTvWosYelxyK2Iy3MzG5MNpv?=
 =?us-ascii?Q?SRWaFK4DWWSoz2lca116ilnkwZieP9f7HVqWOhqfF++rsmaP4DblT0DjtLWA?=
 =?us-ascii?Q?qzHMNf09VlyGgOjr34jiARLk/1hHbfi3J/jsXc0VkmcybeqqOYxV4hILWTFI?=
 =?us-ascii?Q?h0z6lgCTQfb/VMhJ4nZM44VFkYbuzEyCfnUIifB1SV76Io6Odi3Z3ftdqN/R?=
 =?us-ascii?Q?dEj1DUwFs7iHri/1wXUrUBkPi9YuUAmkolDdrsaJAVoLU5VgVNo0Aplr5KrS?=
 =?us-ascii?Q?FqCcH0nXhHlEku11JkYJ7Xig83ZDdx+FfQa3tihTxpcpWXsCiVEw/Enay6Od?=
 =?us-ascii?Q?au19nLdkfuO+asR02ZSTunLT71UQUOtTAsGvW/3CaiJF9gKeBvbMRC+TeG+i?=
 =?us-ascii?Q?pN5vibNjeRGkvaVnfLOYQm7DHAcrjZC+HajdDd+aP4HamK5kDPHkXTn85OEF?=
 =?us-ascii?Q?A22NREPcKwTIy+X24AFVuQnrTgVfev/fuLykdSfxTQ5yvPkhMh5b8Rbiw15O?=
 =?us-ascii?Q?UJtS7m8nSlG7vBk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fAKQtkMBfQ2/eA926WDZdJSIzPi5jvj3Cg+zeAbeaCugyiRWs2p02ytX6IRa?=
 =?us-ascii?Q?WRkYtTzn+HzkA7jxh6FYVBPeKqznglEAfET/6FfPz2w/vn+KaddbHjw8zsWn?=
 =?us-ascii?Q?ovxSrYLFVOulU/CQpmxX0ev6CL9r2yCUOud+virpodRoPioANoFyAYUqRkui?=
 =?us-ascii?Q?4sRgBoDp/Py8IPXMPAk2eHpVCTM9yaCIKSCpPR2uqj31HoJWq2snFf667epr?=
 =?us-ascii?Q?Ky52fj2ZsFor/ZIBldyT0ZWAwwi2PFiGLyXaZw+T0TttKIHeC9q9tnwP5AED?=
 =?us-ascii?Q?kKsM5KVc4z2AAUTVAAaHqiEgK4AFfOcvumkS44Zbazgcqq2ztZmxElkULSwo?=
 =?us-ascii?Q?HwgQ19snmlEe66rfK9rch/axuqayq48gHF/eKwncv9wBqALHJjkMEmUPX6oO?=
 =?us-ascii?Q?LVGrvyMv7CUmWfDNy/tP3GfyDfIVeLI6N/sZNQSvERx9/Q/Dry3EyXswVWHY?=
 =?us-ascii?Q?9C32gWIY/Ks8iHr+jj2cZKdy6p+QdilqPSToMt+3+9PmxgMfJU2vMclG4YmK?=
 =?us-ascii?Q?jMaNK36dY0rL96Gg3qYWutMF/saigZHMQVgRFZn4wAMeHJmeCy4nP9GshDOO?=
 =?us-ascii?Q?Qg0VQpIlpKfPjwyQ/x7P9JD727n92fMa/zVc6tlTvBH9ME1LjDlZblIROnzy?=
 =?us-ascii?Q?a6C2maU0r23CJV516YVvw3lzd8FhxTS6kIHEoscXbgUsdc0wdhmodj6i1Mos?=
 =?us-ascii?Q?AOPaUuD7n5cUXdB6GUcZpxPf6GVKluBiSoGEtc7+DGn5JzBVlLRzU6epUaQO?=
 =?us-ascii?Q?ZZT3kmih3+LATCY+5wecHVZtlT9TGalFKQ/0IO9flfYOlZx+yXkg3KAgBBXh?=
 =?us-ascii?Q?nda9A7XCzLfYSb47Q7iyY5DUpNTtoOq4jd+/sYAF+LN6arjnmtNnCA3ysLrr?=
 =?us-ascii?Q?JeFXiOxmLzmBk277qeqaUFntufZMgwOZkc/9O1O1HQdwbcFIhfZaND43RjqX?=
 =?us-ascii?Q?uT2gk88GixyVQ5a3x/jvEclA0O7U2Wg0TK/SELX/mM/IcSQ+j/FUfNFAXj3h?=
 =?us-ascii?Q?YlnbFO2tfJ+rZsi+L279AOXX0hm2JgVaEqkKPiPdfEHBLKjCIN2ufBaEn4sY?=
 =?us-ascii?Q?m6XdJuKo8x7krnY9vL9e7t/EtSN7nfUSxF4dynD/sxdyw8tdepHuadFkQjsG?=
 =?us-ascii?Q?G1f6SjMWYrgy6+1azhw8pvK1Ea6bFLJKN5PGtYgXAD87K4ivI2H9VYOJWq/E?=
 =?us-ascii?Q?n7LRX0jzsv2DfRo64J25sXQHH8Y0Vtm/hgsX8F2qlRQvSmEUusjCd8SNAbHi?=
 =?us-ascii?Q?CT1htdhERpc18v9YMY+SNcFRTNpldwpyYUtvFyn7JvShnt82SuIAk9mTAtBL?=
 =?us-ascii?Q?+PYTJukfRS1VFVXxzEj8ehtV7Twpmv/SvGstF4xZX3DouLxVddhaU/FVkmv7?=
 =?us-ascii?Q?ye5EyK8GkJihdZBTsQE1oepQnc6Pop02KWpOXfv17jjTrfxmW597cm04jWsw?=
 =?us-ascii?Q?IAoQpLFETpqmiiAAgGKWYkAstr8tf61V2c94pYPAB08bX5671L4DO7zUWo+z?=
 =?us-ascii?Q?lCA+p9+c3xKlN6+Rh7Qotzjwb6ycY9ULxaxv/7iVm+p/VLdDfST1mx66JsJm?=
 =?us-ascii?Q?mgtTOBM1O9wW2LEuBfz0l/UUcpSuzP+0z6d0rMek7MIDwA4n2UbPXFi07704?=
 =?us-ascii?Q?8g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91362b8d-0a02-429f-3b8c-08ddaef986be
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 06:21:28.9940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ba58D5ELiPCXfTcxjIH4duA3Yaaf8YUkhyakI5QS+hE3y7qq/EZLY9kIkM2I+JbwkvW4V7nJwc/Xb6Y8ZPPAtuFJfq/iS9+J7tYTgXGogMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7044
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA1MiBTYWx0ZWRfXwSaWGbOysXZ8 jD1oJpQ+rM16W4yy3h34tS5M1BCAdTu/FcQeGFNnyPHPTybZbFRinHu0vbARp5RfK8pyuMeuB4a 9V2bbqvNIDubWBKkv3EItTMFF1m+Fq3jqv4dWWxUU2Z38fmSSahpa/3GG75NwlRrkmu0EeccnSt
 gLVvwOiwVylehMQEw5RfhcUD9SkUfOjd/2MGlMvN5MRzM8xTgOaNjalf4GFspy9iJgNGKTarF96 zQvHhe0LJuIPTpoxW8xJ+Xee2uIRoDejLFpnaMZLv3zjfK842xzXGIxvshf7Yrn2r0vpn1yQ/Nv GiGijHRKeRnMCpiWnayFy5h9w3yDi+RTWCVQzUF6O7rvyBbS8h7PqieLT96x07keOASJGF4KOK+
 y9CQG2ECo9emTSQ8jSSFKltOSrTA+60UzIa8WLhA4oWNHNHYr0O744W1jlG1Dzt7iszAzePB
X-Proofpoint-GUID: HqYvpaAHTBkvg-HswNez59aebpkN-Zxz
X-Proofpoint-ORIG-GUID: HqYvpaAHTBkvg-HswNez59aebpkN-Zxz
X-Authority-Analysis: v=2.4 cv=RpXFLDmK c=1 sm=1 tr=0 ts=6853ac6b cx=c_pps a=vLGgxbWFiLOFFkiTIxWaAQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=8AirrxEcAAAA:8 a=oHQybRLuQiGXMqFduX0A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506190052

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
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
v1:
  https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250614112255.2838154-1-xiaolei.wang@windriver.com/
v2:
  https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250618065318.319339-1-xiaolei.wang@windriver.com/
  Use ARRAY_SIZE() instead of hardcode number here.
v3:
  cc stable

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

