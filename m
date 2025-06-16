Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD27286436
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750099583; cv=fail; b=pAZxcXp5lwFMVHy4IHV+Fre9byEluXAkCSWB2L6ThwltA1s2JDmwVOkRkZW1HQYjRdU3oDtsoLoGhuo0mutmKsOfnx8jEkzkyPe1+4fqgs8y7QwWGHR+0BPQ3Ct9W1yN5cvJa39TZld+67LZoxIdiny0MzZYop1Yb/oO22zkIb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750099583; c=relaxed/simple;
	bh=XK5r9W1Tt042ADijIMwbTTJs+wO00oSJ5gdFSTHRrRc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YaPHPFlcsZPRwrtkdyWr+PcH5um0jolgH4stdzeKDXPhYqBA8Kwwe9K3JggVmlqZRY8Ubjq3x6fusoAYF3xvNUQ3RGVrsRzb4L9yZ97YSkDV6/FwxI7DB2NXQWj+4Y2S1ojdZ8yFNBuaCQQuILjLVoZojdWAQVqA1lRGDDqiKJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DdK+bnWs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JzSCPQH0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DdK+bnWs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JzSCPQH0"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuSif017375;
	Mon, 16 Jun 2025 18:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=s7bw6J8p/KLaK8kX
	pXsWFDomrRe07gjZumS0astX10E=; b=DdK+bnWsnUfwG5UTOcfJXM6tgJu5KsL8
	uFyhnZJpzuwc979LuDSxhDrzKliNNBdxfDP/4f3ro6ZuDSEdGeYY9GL548S+rz/X
	psYEYQzyKefsJH2yMmqLjlpypJqMA382/F0Hj7hv6wsJSqgi6w1dKEXtS5EodNSn
	75oeOadNjf5HIGA3UjhwuDrkos71bX9/7MlKQWAFwyhbJB3ZvFOiG9RFmN8MumPh
	JIaFyKzEvq9WpPCmEGd/e8anQ8YwsnmtoUdV6OGjP+Q7z60y4yxULvShWZd03ngK
	q1buj2A5cxO1XiEZeJbvTBj3ByOsw/9NWDGbXRgFnRYm6buF+F4GdA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914ekger-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:45:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GIClsB034412;
	Mon, 16 Jun 2025 18:45:51 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh8254u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:45:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x83cGgo1R64kPROybRAPeZyWGIGnAqSgMbGiqZ7NiCDK4ApJCkkdCQuqmnbGuBP8KGeqrv4rAFyJllZHiStqLLESudMDAi5Vp1nXzisLvo1BlWwlwVLafA1AAlcrdOWU8MTdNooBkia3/GYm8BzXM2GRtObRsRU6iMUCZVDTtX+xSR8m7af4FUffjqejcSTFbcdpQWFDLmxL2QM58zByOtuQkkhAMETb/i5bgUNr5fNxfJ9S0pK3G5rqBrOhj7kzulm6hyU7Z9avxQIl68U/WjCoCDqIyuNUSFLuwCeXvxvei0zBQUXlRRd7ou8hWoZ1sXijgsMNQq0+79i/YR3JwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7bw6J8p/KLaK8kXpXsWFDomrRe07gjZumS0astX10E=;
 b=w0a6slgxRBA7HUOHYRfzNRqkb2NYtTmMMZsMToNIPEskLxHtE8coz6exi/vKHkCmRd61DOg9qYhN6MHL/YZIg636UpXCieMJFbQe44gt4/XB0fQyYJgPmqmGcveSuODZv+zBdAGlt/vxuAkhde5njahT4Ns9N4W7OEDmQvghZer/dBvTfiCanM/mh3uBnS5ZzuWIUeh4kZsInnvnJbAZ4x+Hhu/zJHwdwT6Icyy0KEoGt8UmyJziMhTHLJlZoSo9KjPSaJY7vWx1fV+j702aipQko49/03XNkrQ4/yyJWrXYWXo4j0nYQs7/KBu9qR5m1BSNauYhcp0MP0DhyGvJ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7bw6J8p/KLaK8kXpXsWFDomrRe07gjZumS0astX10E=;
 b=JzSCPQH0cyWh8wMmk+N0uyU1H2QTrVxMqX0ScNSowOU8f4pcjmN1FCzNiS+vbG5QLj5DicnbQLOXXwY24NxwokCP6vugyI4DCtP6K4PEq+zVsSDdeDgjB+xur2RJbayGo4rkW6Lf2ca29JIKJwHJgzAYgBxpB5PbkjeGzqhmh9Y=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DS4PPFF6170ED89.namprd10.prod.outlook.com (2603:10b6:f:fc00::d5a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 18:45:48 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 18:45:47 +0000
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Suren Baghdasaryan <surenb@google.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Hailong Liu <hailong.liu@oppo.com>, zhangpeng.00@bytedance.com,
        Steve Kang <Steve.Kang@unisoc.com>,
        Matthew Wilcox <willy@infradead.org>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH 0/3] Fix MA_STATE_PREALLOC issue
Date: Mon, 16 Jun 2025 14:45:18 -0400
Message-ID: <20250616184521.3382795-1-Liam.Howlett@oracle.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0108.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::25) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DS4PPFF6170ED89:EE_
X-MS-Office365-Filtering-Correlation-Id: d37e5782-2bf2-46ac-2adb-08ddad0601a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S/871AC9kqx/f0TYCe215kGBwJmcRqf1Bl6d4C9EC6ElR76lkfplUn/lIk+v?=
 =?us-ascii?Q?NRg7XcFge/Ce8j8kEinJmv8DKrdX5HOSFqeBkgpybPktjRo/qhudw/4AizJg?=
 =?us-ascii?Q?JwGEEe/LxQQtIv3AiwuPGIP3AidSrlzpx3oTQm/U9Y6Bu2qCDXAO44nngu1s?=
 =?us-ascii?Q?QMd+UfFnpDKNoznjGCV8rnLwFH5Ezlo9vGfPqSKupJn2CTBcPZ528qApS078?=
 =?us-ascii?Q?18uXdwPt3LRJN3BPJlcKB0Lb3hPXAQrSPOZTTIkVuDGfSLUxz+9q6M/SE3Nk?=
 =?us-ascii?Q?Z8HgWFwufQbBYcZtU98EPdX++wJQ9BywBccs2XNvB1IWKCOmEwqsdIz4m+zr?=
 =?us-ascii?Q?hrK612SZeuix30UtYkoKSdADkkeWQ9Pu7DfJF3zCYoL3Go3xVzHIBrv4o2k0?=
 =?us-ascii?Q?ck8XLKVc52b2LCol3GQ5UtzZjmJKh6CMNMc3pydctfV8Rkvj/kP1dw5k8vSy?=
 =?us-ascii?Q?C41+AOHi/D0cnSBXnxRu8+ZtaowT8yFOzbA2xdgjaq69t87yByd8/uY+Awdq?=
 =?us-ascii?Q?SKdYfsGgqnR0+wFzMZeWFasSmAptCSUsOEJQ9Jnz9IosB8JEcQmEuIa7HIje?=
 =?us-ascii?Q?PMdBPoaADfDqvMnj5DTxaCtp0o+3JUEUuSJ7rtexJ9bj/4ieYioiE3Dv8xh/?=
 =?us-ascii?Q?edtdRsljm8HkiGipVoUvRPzh3+11BIivTUnS7H3HI2UzmSy8yhMvlxlpMzpt?=
 =?us-ascii?Q?/dwA11T5fB/vBgpqSZviHYtOXK9y7aU8kxy+MWRyl+TnH0Wg1514qdwIBOIR?=
 =?us-ascii?Q?GKLhY+DIYfoXMj1Yk5rwT8s+IW6iDl2aqzJ6Bb0wFKDESRINaT8f+cZ1ByZ/?=
 =?us-ascii?Q?DwVjaxDU+hua09aOzGR39YNgmsEpI7UNVKi5ef7TtKtW6MygEMPj1jNPbTqp?=
 =?us-ascii?Q?57csjrEYhRkTDHqOAYw2jdBx7bV1LOtY6kSy3vsUJCNH92rPfMj1ZR11R78j?=
 =?us-ascii?Q?VAV4eWm5YvFnrCyETzswtzTD9+a8N3ddAh82OjUgfAa/6PsEITe5UAxX9Ybt?=
 =?us-ascii?Q?42wTsmtvRxxJ18u4SSSvQGU9C2oSAhrvZHWR9g7MxUAYWM3/8wSQaiG+UH8I?=
 =?us-ascii?Q?fvpMsOd1ynph5WE1dL+qXCbc4C1QqSGOySpibgF5hq7sgAiCV03p2pi0kg6L?=
 =?us-ascii?Q?qcvzBdQU33xr9Mpxinz5bP0dSKkOKI09KqcGrOx+RUOh3h3NDkIF/j8X8lIy?=
 =?us-ascii?Q?QVMRNOj0aJNSPtHz3GibkDdCN0KHxxof5Svzo/LBw5LS2GPTMf9YEVcfs4ah?=
 =?us-ascii?Q?QcA0E090qC7/za4LVnH8WiCREg/ZmyWuCoYwNueseNuhuidJSZpuCn6+S4Bg?=
 =?us-ascii?Q?SJcLg3jGRyuxstPGAgag3VpqQFTfiFEhvwwG8XBmtSIaaVmwUsjawEoSllz7?=
 =?us-ascii?Q?oDh8FzI69549gaGFqWd3uABAYhzYsnkkcRP4OZPFT9MpXtc4iMG8t8kkeQWA?=
 =?us-ascii?Q?FUzhJaYntBg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nVlbCyqguWYTsWuAodvK2vdcEkaiwBCuhvYuGdAKR1zFrsTbh2C8t+ymCcqg?=
 =?us-ascii?Q?refhNWKN3h6J6ZxZw3qYILDne68EWy7+yw5AvPN0zetGDKeagQ+6M8aC+XS8?=
 =?us-ascii?Q?SxUi9reFMk1EIHuxmfhMG/bpDifQ6nRjXkkrz436OCrztBLJCQpucq1fgYs3?=
 =?us-ascii?Q?32p4K/JZYHbW4hY/2s5K67Z7jGpgqf+CUic8K6sj56tEO9ubkbQbbZ8EoPF7?=
 =?us-ascii?Q?y4h/Az0n9Sut4e9/XFbwsde3y22X8UB4MUkbrspQhnIelrqzSxheGV7ypyjV?=
 =?us-ascii?Q?9796//O03MdBkSTRYwhleS8ZyXtiC2BSZc3LcCnpNLcyCMbtMgtVFPyr+lmb?=
 =?us-ascii?Q?lZwLr6YhoGYHCV6CIfiTOrvmuvQE37Bghv5qWWk/co/KVAN5mjiE+f+KYbMn?=
 =?us-ascii?Q?gAae64/PEh39055NUHAgrdymJlv4lnabKlrmNMRfR9wIinL1HJcvxx8za4KA?=
 =?us-ascii?Q?eUltybKvvhYV/qVo6qfNsk9/MfvK6PDMrsDRjdzKaUK5hIcsy6BFvdcIyUvd?=
 =?us-ascii?Q?3NMqGP3zqTUPI1iR4C0182O+8qgyJNQQFZsGWWb6DEbFvZ7e8X5ObYqDNvC+?=
 =?us-ascii?Q?56TuH8tH6lh+iWkY5miJ6YBCpmuTCO5v3pcEndBvjtKLkCqf2mrkeCZA30Xi?=
 =?us-ascii?Q?IvV9G4lYxW+wt3GG7lRobR58PDY1pCzQ2tyUH+BYJ94ruwqkImO4JkXrBdC8?=
 =?us-ascii?Q?iJ75GcLKLidRs0ZGJ4mX6FBA8is5p45Mk3X/jOnRtYkonGyqYdShBayP6RuU?=
 =?us-ascii?Q?JcvRo8hU12dYL1QmO7Qbdg3ZO3/Q+LBZpw90DVNl5ZBS8rf782ZpcLs7+eY5?=
 =?us-ascii?Q?7hRZW+5PGiLeRysmRBSLySh9sL9rY6eBJBoP+p2P6V83rl+7UpXqiTU6IOwc?=
 =?us-ascii?Q?V8gpYkUJ6d3hAV/sKN+hpbGF80JtFTXLwY8svqmLj2Xii59E+NNU6V+NqQN+?=
 =?us-ascii?Q?dBAkYZlgOnyfu5L9omvl28WK9wSU8tr+WFE40jrUBH2RG3pEGCQhesi9hoQb?=
 =?us-ascii?Q?9H8irb+G+9nBifEHTdJc9fkChLCI0TS3QqFxqqOTkIUdHZM/2TcDcpI7h3kO?=
 =?us-ascii?Q?xJMGY601bpv5gWOScP8jA4YI+ANvtn+AIkmFJK8cCH22HYbRU9atxZoAvkXI?=
 =?us-ascii?Q?VhLEriiqq5tJuETMArgvAFY52b79v3AeTVrOVi92ixIU9ULrwv/4IzaeojSA?=
 =?us-ascii?Q?Lll7wAVVDrl2OBnbMO54Op9jaFzRW3RZ7lOPh3Z4eVs+mocYzj3vxRfef78J?=
 =?us-ascii?Q?L88/L5C15wTULfgUfRlsCo/7eqpIyslBSjrixGzmfDgx43im/YsaD5r/UeIW?=
 =?us-ascii?Q?Le8Fa1RUGko/QIMOxIq99ETJMojSIQlQ+07+q6ir2DuZjyxelMLvemjREJXj?=
 =?us-ascii?Q?mrkVuSa++u4clJeaSl7i0zLwWEu5J3s93PZfLDGFfzfxCBboLK/uq9D2yYQg?=
 =?us-ascii?Q?rg6bIDl5FpqQ1j05oEycB9JcgSKdu649uNEjKhk676uRcjsZyxxb1JmvF9S1?=
 =?us-ascii?Q?B3i5bP7Litvf6rwpJJZW3jgQS/FwQ8Wq76bLySeXdWOBpj3pTk3RxajN4i+6?=
 =?us-ascii?Q?CqD1cRLJ3Hfycdl5BlBJyrX6jxq+2hwBjcwQONEO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EUOpvCeWEJM77sZjIDcIV/Xzezm6wta7tvyZhRwErK0GSwPVk6UdIYLC526CC26Ak1UzrJ+7BFWoSo3XemIT2dybhrMSXa5/6purr8VMu/fKsCoPx3i4dSN4DWJ7rZDEF02zdK8uUk2znMsv2uJ8YMdfZxNoM+ENabTb/LPxVuBNHBoTeqJcKcPvkCnb2GGMlH6XYOLRQ/aYWRYMiDxCZ0WbXaJa8L55HyDNbkkh5HQqlEjRNMPSHjX0XPBmHrjKnG9YAGqbQ2weFviX3SyFyJjwmT9vZtWE1yIEZ4hDP8SFUVbtDHYnGP8aZbyg0LKKVa9poY4jNRiekfxSl2h9ZEPKelW9VoA79uu06rO9jeLagnkV6X3REHKvowNdgMsqLaxwZyvnzxcLv4nxfvnj1wbhZRHIr6TR1OwPU86wAOBb/y7JkzNk4tL9TpCkhio2gg+eXzAApPz8D/qOotdFZofN78fejMwJR8iY/GoOVU+rNG+4z7NGzr2sL+9vkzvjrrvQmqUcP0BhziuovKDEvAnlcy69DLCXVWXrRyxkDwiPcoiFpK6dZIDgsQZxbQSQQ8USih3cKpZxC3sQh2E9SX0ojlZrke3+0wwvyocHogs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d37e5782-2bf2-46ac-2adb-08ddad0601a8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:45:46.8311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2BreJe+6OhinFjKZEzGh1iahBs4pDcQpqJylAGeqWkOPSB2mmajWgzbczaWLPiI/vgRkuKrXq7O8gFHYfL4Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFF6170ED89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160126
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEyNyBTYWx0ZWRfX1JQNju4/2bBv aAxaZKErJR88FQ6pzNnMMRUpsSSEBXXrRAhUXOCcnJAq3j7IiALNIpN6HIuusAQk8YiXWaSGvGf m90VS5NRWP/P9QmIGbo51udr6F7wr6qDtKMhm7TgdjAND/XEmap5TJobzXskx7rGL6Nm0jRh23/
 qM70HyxCa1nHzJiRYOBvWWOkvo6coVD4rS5x1WuXIEjPes479twujB0RSAJbUY988EVelin94i0 Z+9tp4ac7uaDs//08iPC3PPw5PRyaMG0RUTodTwjcZFo78NON9ZCdyR45NUmCe5NdlfeGEfdZns Oa8OjAhZ9ynI4BRjhw9OqxA9XNKyrFt7ilSGBg5yB5NoV35qBH+7iAyf3cAZP7lyvhsMtEr6C8m
 wIJ4B9BCl9kQv5jEppq+umNKcFFjHAuvMttARfGBV/d0no5SZYRbtTH1VQkUKD4gowMTUPSl
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=6850665f cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=sAtLLDkTHW6rr8UvFEAA:9
X-Proofpoint-GUID: xeK4ojeHvmkgS6y2uJ8vXwhsKw5pQ7Z4
X-Proofpoint-ORIG-GUID: xeK4ojeHvmkgS6y2uJ8vXwhsKw5pQ7Z4

Address the issue of reusing the same maple state for multiple
preallocations calls caused by MA_STATE_PREALLOC, and add a test for
this use case.

Included is a change to the testing code to reduce false positives in
the rcu race testing on faster machines.


Liam R. Howlett (3):
  testing/raix-tree/maple: Increase readers and reduce delay for faster
    machines
  maple_tree: Fix MA_STATE_PREALLOC flag in mas_preallocate()
  tools/testing/radix-tree: Test maple tree chaining mas_preallocate()
    calls

 lib/maple_tree.c                 |  4 +++-
 tools/testing/radix-tree/maple.c | 19 ++++++++++++++++---
 2 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.47.2

