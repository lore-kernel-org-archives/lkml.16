Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53F1202C44
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 17:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750180639; cv=fail; b=UI3ODVRUtlvlflZKXF0qUcDaW1wRviWPXSOSyA31nMNsdPeSwVodudxnvn0aqct0Q6k4gydh0QYNoWeWutp+2nH1l0U4NFH/bM2Etq3jRS0dBTyBWw8ombx0d46aiG6Qu8peNCXB8x3y4ydDK+c5R7uD71T9RPJRuK6fxP/JN4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750180639; c=relaxed/simple;
	bh=fZrpSG/5nW1YOcF3chQpDl2HI0vLnpPE5qnrf6aynl4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nDOg19R1XftmbNv1DbKU0AFil0qMWowULW4ZGzI6IrfxxydDXtKmKaNy3ANQbuPjExftq3MBA8ARghlt53+InVRpzl3eI2uUSy0D/LokEZScB1gQ6Apt2M9PnHXJ0TQ/EdGGq3nSIpJo3Ph6Qy4PJuj/64FlEdCVsu1vMb7IIOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=buMcGgSH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rtBNXfLy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="buMcGgSH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rtBNXfLy"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEWvr3026881;
	Tue, 17 Jun 2025 17:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=uhzHZV4zLUA/rcSk
	hsqxWdW6fSqEBtnYKpmBKUtsrOw=; b=buMcGgSHjXB0mPoJRuQid+hkh2zTYjvs
	wmFNav3joG8rCfDUHqjQtSmeDHgaekuXNw9nV92CI2KSpGKCk1Ms8j4nQm0DCJA7
	1Hfn9BBsnKgovJaI1hemJI2rLaP1Np8uM+/XryFDAOc/xIfviUniyzGHCeB52Hxp
	Ngcxf4zKEA1/eqyd5ya/S7O1rsChJlvNTaXLADcPtEu89a0JIBslPsWKq/6cSONz
	RYwnu9hQGcqQc60Q2CH4A5IrXBuNp3sJJbyzn8p8imU6CMo6OOPdA81gSK6h4nh4
	Beu8L25lzyjrVg7vNR91FT05WEQdbGDgPOiN5YBqPNbBgBTOpLW9YA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn577e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 17:17:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HGAIbo036299;
	Tue, 17 Jun 2025 17:17:02 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhg1cxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 17:17:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAm2rwLPdSKp6ydvZ+kOzRianH6BZRbjfZIo2Tip8qWh4an+LcVuL5fzmy5Rdn5iE/RnwUhJLqQgkijABi/ioreI49O7ZJ66DufGdghDK/vY1zRy2c0lDpiljtoA+rANEm/b1R4MmV+O9fJMWu9hNZ0BCfXiQtIG5XBoXSh7ZwdqToB9yhTxFFKDLkzC9Q35Zg4a7GnqOKhopETwoUpXlBGRy4zUXLZUs65kUcZDc2MmYvqxWSwAQfAcXqvOecugk7NY7wc3cCQWBuIrby3T9LEmR57X/P1A9CmQoDIulREcQstc7ySzJGnsyr9yBcsy966RczQqmu+3QVw2yOcKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhzHZV4zLUA/rcSkhsqxWdW6fSqEBtnYKpmBKUtsrOw=;
 b=beZG1JcRb2YQ4jsInSCO6MY4AA8kiDu1KaoIfMZC54RSgxMVmoz5RIEusT/KPW2weO/2fj+YhDSY+4wzdl92gFINv6zpJO8Wt1iELuH3uBD0xd+HXCX5NRHbyqf4jwSn5+ESGs0bEhD4tXT+MfeBBhc9YW2J+Q9EttMvWffce/Zjycyi8blsamu/dRtdKmUJAit4SoX/6lvnCiKY7Y6gf/6bc6USkExReEp+9FKm5ia4zUhli5ZRhRpDkHs9Hkw2AIEMJuNc/Ut8kh8JuKWuKs5eB3IeghBOWvxmPFcA/3PgvgHXxxjIZsn1epppzBxV2ABUHwbTkLvRmyx1B/mjTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhzHZV4zLUA/rcSkhsqxWdW6fSqEBtnYKpmBKUtsrOw=;
 b=rtBNXfLyCvaIl29b4O+0XB5Yn3iBxP3OBiUCAjW/YB0L5bKyRgL5/2ayoAJHse09sRQXtdsB9pvvWbP3SGwmNlvuQzeptIa37Eo9fQvc4mocu3xNQ6s2x6McOh/1oGp/MjpVwqq7XgS5+GpHo7RKq+osFTBHq4Lu7LYei0b7O/A=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB6776.namprd10.prod.outlook.com (2603:10b6:8:13b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 17:17:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 17:17:00 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>
Subject: [PATCH] MAINTAINERS: add hugetlb_cgroup.c to hugetlb section
Date: Tue, 17 Jun 2025 18:15:38 +0100
Message-ID: <20250617171538.178042-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0031.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 16eb57b0-01fe-4e57-94df-08ddadc2c526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C1FlwhS6MgDd7dasL4L2jR+2sNn2YAtt/7WxBVU1NWV6+WOyJtdhyEJzquQC?=
 =?us-ascii?Q?b+RomgeCC4hi4y7pf6sTfYlVSqcGhrVTU+YbfnjVhV8MgOtSh4k3nPEVXLZL?=
 =?us-ascii?Q?QzHubP52HgFNcpkpbugg+Atd57Gx8NeiNyZf+aZGnFOru+bhKPLV/laSsNRO?=
 =?us-ascii?Q?Y/4lytdz2lFzTVps92oT6h6uPyUv/1cEP5oAR1Ov7XeTs0riXmZYDgHV2+ge?=
 =?us-ascii?Q?h1fB2a9JtMEdW3KBtXpcnYdIARvvarH4ZbHK5KGrLJKszbjbW4fRHfFT6G7G?=
 =?us-ascii?Q?6R5S7M1chqGFYLohMYixnoB6IKPi0nI8p7UY+ebh/f7bolPtxa0F96Ps9GxF?=
 =?us-ascii?Q?hrdozOYwdV3SNrvaEVO8fVF5GmAnoXyIwedR+GcXUTSXidePcIQjpnui66V0?=
 =?us-ascii?Q?MhYRdInEuP6igs2TAN1o5D0vw+OWn5QL4YUFvf6KPuRIub2Z2U5ZeW5eItDy?=
 =?us-ascii?Q?aEi0CV1cFFV5LkdeKocG3Kve027k7UWKhfLdocGv2ACR53gI63rUoE1PZD99?=
 =?us-ascii?Q?VQOwLqwjS/fkIl3zoy7O4YF/7Q/0Tl1f7PEO94pWBnOeYR6lTZX2jElYYMUG?=
 =?us-ascii?Q?x7N4kJbvROxDAgU+vg6h8J7xBUyJzqp1CSJmbhBVNRSs9x/CGQgFdw5Dcs2i?=
 =?us-ascii?Q?zK1Lnw9iezGkejlus9Iyl8cIeuEqNz/PgdTZEnHHQX5aZ5dpvK8HPuLP00S9?=
 =?us-ascii?Q?SUjnlXZgt4TiDVG3mtGFPsnxjc/JwwvLZNNt+PqGXRy8G2RxCw0S0uwl5J7S?=
 =?us-ascii?Q?19lEYFm0Zfy1cOwD26hkMOAyK3KKv1iV7WR4Iu8CuLLo+XCsl+51RtOw2eio?=
 =?us-ascii?Q?M6wcBzwMg90+xVMFqPCxs57rBSrOVe+z0HDbfUEc6u0MwtUMgpzvjW45KUSM?=
 =?us-ascii?Q?Ewb7+vVqa0CdLNtuFMjE6akZPTybHPOQPUx7ec+YoYd6LO6ly31TKePBueWE?=
 =?us-ascii?Q?X3UOmZlquzZrzlk750n3qOQ+PQy3m0ZLuHFlpHSZ845idetatFP3iOqJwWnQ?=
 =?us-ascii?Q?PEQqW/l1XM4uLMjUJvq06uE95p7EW8cKHliF5jbDnIptSrhzzlteE5ErmbnT?=
 =?us-ascii?Q?QwaNIXjotcPgA5zd9TRIcrLKfGh5bSIFl6iCgkpOosiSFPKjZp22Gv7Rsf+N?=
 =?us-ascii?Q?vDR0sIZ3k8TZIke+0PjTxXC6+gRk+3d1MwINh8jYrSomVEeJUd9dm2bdEmuD?=
 =?us-ascii?Q?F3y3rcwSk/Sa+uypXtfOjhHdumPpKF2OUQibC1j9eEeAeDl8HPHbAw9CzpwI?=
 =?us-ascii?Q?6xzWqIWPO2KrdrY4ZVL20253Pa9XYDqym4yg+FzdK6CtSAVotj6Y+YM0gfxE?=
 =?us-ascii?Q?mTZZRBqyXzdK3Locz4450H0h8PHck0SxAsQ1jSnO0aqNi3JyfXTjFym3+NqA?=
 =?us-ascii?Q?mf8iSuzQG/3eoSt8RtDhbHlG3mfTZ+8neaQ9hI4Rh0+vB/oWa83/mcv2BBq9?=
 =?us-ascii?Q?CbOYfjAdG+g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zrWLg4nzUznxRs5IsWCepUXp57j2Wg5JukHgY3qrUT1U0YHmdHg4R6q7W159?=
 =?us-ascii?Q?zRZyA5zavRFwGuu4G1Zk2s65K6ee5PE0rEd9aLRG3eDxb5Py/9XEEt+Uk7xz?=
 =?us-ascii?Q?D/EvO0fVgJzbWJyutg0beuokAk3OYLxWeJWu3UnlpFZvuM+92UhHQ7gVkGxv?=
 =?us-ascii?Q?nC6KfUW83lWX7pjeQ6uoPBBYGoUJyPoZjmyCzYB5SmmvXIPu/Dvo+roeMyBx?=
 =?us-ascii?Q?5MCPBNdngLITDpkFEfOfVQbcGMxMMrvAOutBtai+5SiSmIrACGMMigUyRXP5?=
 =?us-ascii?Q?iMpu0RMFoi1u8TX0300unKVNN4fPHncJeyiibeYWPyjtujiRLrSjdMyASBtW?=
 =?us-ascii?Q?8ib6swe1o/rzaoiWYNeoH6LH9jOavXLBd8TugWYFoxPNPEkw3ImSC8Hl/sZ3?=
 =?us-ascii?Q?/i7hsTSMrSyEB4dFP8+t1nBOJZvp1p6iFfztLwg+du5Xpse9PmjBf1Nojok4?=
 =?us-ascii?Q?fstzUTtogegeY+cqL02WJM5R2YOPAw61/DsylAN+UjjBINJA+dxrF1KPCHnk?=
 =?us-ascii?Q?etgUD6ObXqqfp5Q2l9kQR4kg6gjTVFN4bqtw6JDlt83yjCo5xdX0TFv2W19S?=
 =?us-ascii?Q?5xK8ZFam7tWr2mK/uENZfHc5uwU+CIr3Wg3LL9C27VMobRDj0PH5Tvh1z1kA?=
 =?us-ascii?Q?5CQCzK0eYbg5y9zNPqssurG8eD6ns6jzakhFIhSFbhXQCqjM9ikvBFChrFIe?=
 =?us-ascii?Q?DNUCFXWGOgtJQxGLv+JJEE1kBI2eOpKKtomUUufmc6B1UH/sOcY0SaATa2HY?=
 =?us-ascii?Q?GSvYVWnb99ISxQbKmU3u69QzA2Qblly80R/H6y/ODO1Xzu5smZNWLfIWyMrx?=
 =?us-ascii?Q?YT8emfMJvq8dK7UUpLnmttkxR4GWWrkTfjFqzGkxGtM9cl6f3GZ6N2QpNRiK?=
 =?us-ascii?Q?XaSa4x9dTxau6T7fgZ0OEPUWPsO4xCnd0tVx/6mxGDNIUi/zfQwWuHIR33aH?=
 =?us-ascii?Q?Axs7LFPd9T7rr6Szt2SEk8oyefGnjm4FBp2QtdTwrrG4243J3xFZ6T+rg2Ys?=
 =?us-ascii?Q?WmAZahi+vcFZFK6T4A8k4lv8K3YmIPKEjHniyV3HvrhyY+qY9jBxA6sEiqq+?=
 =?us-ascii?Q?syP04eDO/680kDYtooU8AAjzSCiJrqWxvwrOSY8/yRqHTudAqT+V5MIhLo4V?=
 =?us-ascii?Q?SO1To4lqXlvh9qo6J3DM+N/FxiEsSbGlzSEhJwfplzUmsKyhFvU+pYgvq5MW?=
 =?us-ascii?Q?gRjoV+Y2EC+Fum/6umD7U+/KGb1w5J+WgaW56xW7Ld4rbqT7pX6Pe1/2laZu?=
 =?us-ascii?Q?0c5cnl6W5OO1pzYRT6cIy7hvQSohOSCAqSqR0jFHeRnVE2CA6WrgoBgeo+Ad?=
 =?us-ascii?Q?28e/RCPXV/dCXbAkakteQwlcxW1hG9vEoA3Z8IH+YYE7uUZ0owJrQVKrdUzq?=
 =?us-ascii?Q?1QgPMujz7uYJ70TV5bepHO3gdlhZak7Sv/8DagI5GVJv7lWOl5WAcHLErUGD?=
 =?us-ascii?Q?0DlQ1QFVMYOfqhWZnpAQjKdwsikOhZXNGYi0PRiMTk40rpHoylvfloQwbxnR?=
 =?us-ascii?Q?90EN7czTm6etPcvuqtlm9MZkFQ/G4/C4UkheIRWarVI3pOSv+ZMmHfQFqVV5?=
 =?us-ascii?Q?CJiGV3yaOD8lEEl9IP3Ne3DKUgTmT2pIDBJxkpmebvLmdB/trL7yVJ/IGn3m?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NEgPtQXVnBjxURL7/BEh4ZjwY3D9SE8yWO27MJd8ObldlexoAv/CIgQIEjf8cjB2YKFBaO6UbaUSwVgX5YQQHrPM4tyQbJXRyhejqZjOMGecRS7LlqwmFpg6wWcpcVuIFS7/hHhADQjsiO/EViVQhbmyChru4dOF3FWupSHuHwt07Ryw0xSohS9uN2tFXQdUSTiKpK134b9P/PdNkXPj8MPIQH5LjIa+RweX0Bb5Y0O4VX7p7UPPmxKqFUhxdsNWcyZmliw/f6Qr8h675mpUtl37jZEh2V3fB2gx9OuviI+U0Lah0BP6lPjvAIx53ZDjCoEZshtwzkMtRMUOcCARHpjsU/DaTyV6kDZ67bFyFcIhatn2nCnhMh74PlBGdI38sWTFWszOVxBKGHh5ylUrXbVMwFbwMghZtcQxfhgjpmXh0E+xd0I/gD7GfksDVvV2Iiovvs3ghbte6McC+T4tFgo2rzJm0Ip56qTztHS+eLVYH7OVwhUA7Jx6SxkFUjRk5ycASauU7a925rX//IU944LBBBXOElQZazv/n4QeGGRBEZoMwRkX6dJhwgcW3hSgrl/Oox2owgQqcW20YxBjY/FMZG0iQ3kGYTL/nmTd9Xs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16eb57b0-01fe-4e57-94df-08ddadc2c526
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:17:00.0127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TVM+WjcSXHkYoxZHl1YYRAo7GPpOARYzCWtCWEQm9NIpOWnyDGoAGSWwO1+czVvsz8xcDNHAzJtIEs2o79jvh17yb08Zb5dOFKzs5zbfJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6776
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170137
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=6851a30f b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=yRSOzqyffNjyCeipiYYA:9 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: Z9DE6l0QwS0a0H99wx7omw7SyKICQVLv
X-Proofpoint-GUID: Z9DE6l0QwS0a0H99wx7omw7SyKICQVLv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEzNiBTYWx0ZWRfXxRzX9FI5j4P6 QgFtgy5Jyiv7PZONTTSjTzA4gDHLlrz1ac8T6c8nQ9r1qL0P4PWPDzYSFCTCtmGdIj8N4rJzM85 1tQvt2SNKFgw9Y7S25r1qNzhX7K9Y07nuoA3+0m5UdLtRteTRH90vb5cCJB0v0hmaxseatxaPmk
 vkLqzE4Yl2slDzSal2JgTWjDXl6k1rD+omlp044yOZhdgONOSlpsJiCdq0xqO3NLos2j+LIP44a 0r9GyqNWWJdYkrZ0Czpc35Oax/toR9quS9Kr1iR8bR+VkjcWiOsckDaSIhTSgulGa+s54RjDhdc luYq6s0mRyzL5RdsFyJkXJuk/EfpxyS6D6vVTlSPR9FU2sg9JwSskKrLRp6a7AQJF2EqHpHurGl
 AcCLTn3HTM7XIjt/d9nV2u95h1plKloJynRfipWBmH+oOBE43eELt6MXvTMVPXLj1jEG2nK6

This file is clearly specific to hugetlb so this seems the most appropriate
place for it.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08045f9efadd..e0d6daf0de92 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11168,6 +11168,7 @@ F:	fs/hugetlbfs/
 F:	include/linux/hugetlb.h
 F:	include/trace/events/hugetlbfs.h
 F:	mm/hugetlb.c
+F:	mm/hugetlb_cgroup.c
 F:	mm/hugetlb_cma.c
 F:	mm/hugetlb_cma.h
 F:	mm/hugetlb_vmemmap.c
-- 
2.49.0

