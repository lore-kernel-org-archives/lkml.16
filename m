Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE5327EC6C
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746306875; cv=fail; b=oY9FYqt5oSiURk1nfhTvbS/jJ65h0dsd5NmM7LBb/+FC/vhzJ+Z6l2oqMCzpkU8MDGNYagRmLThdP4gr4aPUFZC2WUDeG6zesN4610RU7UCMONvQJuJkm3FFrcRLHMojLTkRQiqCoIy5uGq6w3swCHXSnjFf1JFqjgfohN3RIOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746306875; c=relaxed/simple;
	bh=od9JR9TGITckGZhpAtaTUl2UInyO6QBVl+iSlVTZwKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YdtCDCVWFFeHL03cHbuZgVDKbfAs8yRCMg7pEhmxzIjBU1Zkk3ICu1sQJm9UgTCsv7gWb7HIxyEg61vDxm2h4SDnduG0rBZbkJWVCFjH78xepDEyEspwCTn8uj8dIFI+lAo/EwuH30W+TtM7O/pna1NjGPspWbUWEIXzLfrNWfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SVEqPFOs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rShqyo1s; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SVEqPFOs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rShqyo1s"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543L5sJ7005499;
	Sat, 3 May 2025 21:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Jc/FpWTukiSQC7dJBUQXCCq5hIzUITwKucp/3nq0o9g=; b=
	SVEqPFOsAHC0LPuJjcJVNajXrXvjl/4e3NlVTPsMSz/jlPpkxxya95H5XrGDDmAk
	CwoLGX4JBgQPFyLUra9G686qCBKIXZBbCcIiO+ER1oPIRzLBCHvzXCEVfrd/7dMY
	5baUDWaXDobO2CpmhXhgh976jhn0c+lVl9+wj4yDj90DtfY6UMawH5yIv/ytaqE8
	A+kxZwNYqzbxkPMxCJgb6HZ4MdVUjGxGSAbbzrPDPV5RKUHZDpo7aPwlyzUvrHFq
	mbWIwnBMl55rmznJzJet6CH87e1uQ0Br+W/jPqhE313nAs20TurKs257qsrVa2UG
	ejGZeOf1Yqe6+e63NT2uvA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46dtja007n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:13:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 543IBVmi036067;
	Sat, 3 May 2025 21:13:09 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013077.outbound.protection.outlook.com [40.93.1.77])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k6f638-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:13:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQsWdMNuCNDezk4z1yJhAnY5IBEpi3o5dtGaw/doahBxXy5B4H2Z+lDesKGAW6h2gwGlo5VcFEDD3+db1OFxdWyyiY4dYtZwiDO/GDqIeKB15mZPWa/HybCNsF8ryPcWOb1tdtNPV816DBspQ8XlsJvx9fJygb8p8mK1Qi83VasGZ2sORipMZVW+O4Dz7P9rSsb325wJYNq37Mq8JSQF0SYGzEiX6hp1Q4QiTmdN/1SZsRSRfwdD6cU6g5vjsenphT2/VhKdDVKOKdo0rgKrtCgGirchmptJXbl/UEc1lIjT15FwiWrgyMUiowsk+1JFRDvZk4P3NAKMwTXfNe2f4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jc/FpWTukiSQC7dJBUQXCCq5hIzUITwKucp/3nq0o9g=;
 b=WB7k2opYYgcRrRT9DrqRzRpp6bFPH3ZWG+EgW/vhbRgoS4otqKJsRsKSpiw5ig40L/UPUI/Q2jyIfwbvnKaPBQeh6rO7RiOYMTy+djoCN6zBLmSSAXY4hB+46BCznUGra8riHqAylrWWpYux8/r25uPx3N8hdKN2HrV6/RmZUtvYgp0SKojc9vzZz5SINnWV2BsCb68ceZRUYGLEFoBE54ZYUNtjLb0qP1BFt4kZdCBha/AStDDYaJOT5VbSmXWwftypFmAcnDWMUVRC4QFt5TytNndn2/xxVBT9W29IUmOyv+vXpRsLhROzC+lMQL1QdFbwqi2V1wnFjZ3C9Nk56A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jc/FpWTukiSQC7dJBUQXCCq5hIzUITwKucp/3nq0o9g=;
 b=rShqyo1syL30gLZeeusrSHYtC/v44euJMpG8AtcuFzu0t0dLnBZcwpWJ1OhtcopbbILlZp7pVwZSeLXn7E38v8JQnWP2/u5PV1416EUUfJuAYkpmwKyTgxwYnhdO9ypz4HxVqL8o22vNTPdcThAkWKsmihaOeaQ/X08Z/RE91B8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4373.namprd10.prod.outlook.com (2603:10b6:610:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sat, 3 May
 2025 21:13:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 21:13:07 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 09/11] tools/testing/selftests: have CoW self test use MREMAP_RELOCATE_ANON
Date: Sat,  3 May 2025 22:12:31 +0100
Message-ID: <65f70e95ec7ee2980f715f625151a8fc333832b5.1746305604.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
References: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ddd728-dcc0-4d20-0ca1-08dd8a874d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wZnoRBSBP/r8MtR5dQB0UCKwoz7/pHTaqes1JYhhOcEpUpOEG+JUye16YQwK?=
 =?us-ascii?Q?Uw7WbYX4//zIASxNG1oqL25OXTMk1GwGny4XstmeQhGUpu9fuRgyuGOSwSKI?=
 =?us-ascii?Q?6bIP/P7a6RQ1k5u3YQmXjIxjEeB1+FYzZQWhbk2aztM5dO3Yze81IrJ7Tni0?=
 =?us-ascii?Q?NxsMNQKjEMBrzGwH3a5q9iLgGWK884eyr9WFnNjehoaXhF+txTM0QqS2zZw4?=
 =?us-ascii?Q?dgnW6UKWs3xc9W7g8ciS66lNFFaW+7xPHt/ppE4YUi0eqkbXYTG3+hD6SNgL?=
 =?us-ascii?Q?/1/01VVGTnT2r/kLVrVRl3HwbjLZmGjk28waaWiIjKyqaSCJkjTae0fffrT8?=
 =?us-ascii?Q?YjFWhbGf8XIBkLCEBdqnrBhfpLtmtFgyoBA2rwy9ZdQttE3ULQkO6p9zkPli?=
 =?us-ascii?Q?ftqUZC1mzzLY0fwOs4Cf6LIVGRn4VqkNLd1MmJbTuLQ44Jytk+KdDmHPhGCA?=
 =?us-ascii?Q?aLzrrNWMHJ1XSm61XvXNXsMJ5bfLzOc9YdGJ9F+mfuchqJsUuCvrp5RGs7Uw?=
 =?us-ascii?Q?Qxs5Aav7cRujo93N9ouxYXEtSLhzlosyqpSDeFqi60yPcKGzv09XB5J8c3cN?=
 =?us-ascii?Q?46f2DDP7yZwA26nZCrTSnR2TruAqH+jOZbRqE/uIA+Jc3tTl/zkb28ulURY9?=
 =?us-ascii?Q?RY/etAnV7wWW1MZSmjwAPGRRYallRhur4DVtm55KkZ6HDvap3y2k3k4oYqwb?=
 =?us-ascii?Q?jAw+oUhSKXxBUufQjwQkBVG4hfkcwZJkz4YVL//mFqF2zWnfwpQIK2YYn9xa?=
 =?us-ascii?Q?TXDhDBGRRzg1bV7XUz74gn3cjL5pxDppgv0fMbGGriXVTtoyeRzQpJ6ga6MD?=
 =?us-ascii?Q?dQs1Am0OSm7Zb1Lm1kJ9MsH5WlqPWEbFsfbAogy63ohYte0Wlrmn48LG6GtD?=
 =?us-ascii?Q?9La0g4itysIFUCzfrewcVq/JQWKzKg7S8o5NCvizFG8VUl0I7jNAM/bBCkUj?=
 =?us-ascii?Q?noQhvqOZLgDS1sG+7B/dRjConEW6i0Rf9EFGKvJ7fqSh/vWxfJEE+oSOuA3n?=
 =?us-ascii?Q?ccohCP/bncoifU3Q4wDHoEUhUfrnc6f4jBuHRvqAfHX9/5cJmX57ZGYUcvkZ?=
 =?us-ascii?Q?+AG734R35QFirseKFl7rmcMji4eNsxgJZp1Bw2KOThLgHPdFrPXUTlhHSHjZ?=
 =?us-ascii?Q?wugZZ9MCy/ejgXpKOzUD4XjE0Go8VMRJRkvIoWuWg0aKr/LlfkqD4XxJt/Mm?=
 =?us-ascii?Q?vBUUN/52dPFXQ4FptCbUtyVaKLaMkUVK4yc4VXkpi2MA3DDfla+VhePcAlaj?=
 =?us-ascii?Q?lKhBnqZS9/f3GEhG88BidCdtdmwG23IT4mdJq/bQ0uHQsW6JTwi+KlOel+1j?=
 =?us-ascii?Q?A/kzOlcG5Wy+3v1+BYUv91RPJuvW0OvsBbwVvpETy7i9n6CgHUKmtkhz0WO3?=
 =?us-ascii?Q?i9W2wyNnTtKFpZfz+9SiAiXLqzYVnH5oiB92FcCkIpNM9R+IT4YmEpQRKyJO?=
 =?us-ascii?Q?DEzv7mTxX/k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ANPtK8J2V5nd8tjY2TnI2crANEJ4+o9dkbyz/Cbd5z78nXM10eY8YJwlPHbZ?=
 =?us-ascii?Q?QSch+7PF5UwEebuxsK4Nohng+RFGvqELXKERDbg3FkZt21ODPQ+Po2t+AueX?=
 =?us-ascii?Q?0xVXVsDA8N7MOZ636z+pF10AuldogmpNP/WOZjnBEOuanFbVOulPoaSv3TR8?=
 =?us-ascii?Q?djiU54olCjpJkkAIUq5gN6U/QyH1jP6/xBSrcogLvxUev8e/ESBn/JHC3nC8?=
 =?us-ascii?Q?TSVVrR3Wc4SUN1nPg52ADlTrS7P80rSKSCHf0WEm+wO+q78UzK+MFhOhuwb/?=
 =?us-ascii?Q?6mB5TSHePATuGOfjJM+zMtj7hXVq6ym2Ssw2BA82urGmnlvflEcD6Tb8wG+4?=
 =?us-ascii?Q?rZMnkBqoIvqZJ2ETd5um3jtwuQPyyZQhSkF9GBVFnKR7ZSXJz22qFeLPNz2B?=
 =?us-ascii?Q?ZGgITvXmAGylDXIogXFGl8fCUtAEHb00oufcMT02G6ZMjsPh81xG4LGg3083?=
 =?us-ascii?Q?qhiUvniATackc07kIN2AfKSukCKQekXP3SxHdosBfPhWNNSxD0nuL63T7W7P?=
 =?us-ascii?Q?Uo2KD81afB5HtCnNBbLv+Lwd40dB0rrP/s5H2mpKFP3J6nG5/LKRfUutInTo?=
 =?us-ascii?Q?KlNCAdCk4zjbTiqiMaglp8R1QhsQB4EJDBLYzWawOSg/4HDxPj9IdyGuFuZk?=
 =?us-ascii?Q?sfTc4TmvnhqyWqH6852wxgOJVvlfK5isZ47XQaLIzCwwjkwKGYToWzTwyKG5?=
 =?us-ascii?Q?mU8sL7RE/nWIC2Dr/wcAbOaudU/KeBCg4KQTpjsLJDo22tlnZ/n3b/S0Fa7V?=
 =?us-ascii?Q?TmHt3rgF9oC4FM/2J/+6NiDlNPGZkOXhI9Vzgq7fBukHNx4oyuJPFE7NsR1b?=
 =?us-ascii?Q?2TARYl7r2FAKVKyb6erKW8FURWTcnLsYnnDvx1AMmoD6gd+LoWdeBDZ2udmt?=
 =?us-ascii?Q?mpYJI4NEhKFu9PDDxgCOq1XGNsyxgsTrzTdfRi05y4sxqQmdRJNBsaFsxAUW?=
 =?us-ascii?Q?+gco1MyK4LbB7tazaHy6A7tbvymfvRqgoqJTCyrzSh+Y3QopADKigrEm7VaU?=
 =?us-ascii?Q?2dUd8n1oIzUJHy+mxPES3O8ySTbBeFml2o81gbHIG3YH0gGuzxWZrnOIXlNZ?=
 =?us-ascii?Q?1pzIORfVU/TgaVeLvBKomJcI/bFTz0RcAv+b5CzL4vJ2Ev7u9GZmten1+g7T?=
 =?us-ascii?Q?RtOmRV8tq6rbIn6v7F5ESl7giMiiqmV2X81F4Sh2nhPn7pJrGRVmpRi7kRvg?=
 =?us-ascii?Q?4D5NjfX0wuY6RD/exCwJZYqBF/IgNsfPfu/ai6tCYBtjRj5uWNzbzcIvCETn?=
 =?us-ascii?Q?StwQ/1zgumvG3KgN4T1tqTNlLnMvOQJzUrUN55WMlTOGadidswvwDYfw6C6e?=
 =?us-ascii?Q?mRm9881FYFjCPAByhyhQbV7fRKuFl17ipiJsg2xt6bfvtgmIjZItWt54/Cte?=
 =?us-ascii?Q?drGcxFr4Ngc1QsnyE3vhX7RJYCBSAP5bWjAxJKxf8T+Iz+kN9gedp2SNoiNk?=
 =?us-ascii?Q?PwjPWi7q6kWWhyGRb/yiNeDSZcrAjXH7jXDNCqaxpFEW44m5mGTgy5M2Vv91?=
 =?us-ascii?Q?FtNrqPTGepiPiqyrk9vakoMTY6fMHrDn/93pYHDSatFdeSD0P+u4vfC/mJyC?=
 =?us-ascii?Q?kpb4SfAaYnAESdpsq4WCDwbv+QD874BqafGETI8FOHpnJALhaUlyDi3DWycX?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nwSQp/ZO86ThxbN45L0d5/556p8ouiEX5ZtDll/h73hzND1lrbvDBQBL5hpczUB5z0CThieZo9s62YrdscCaEZMn+6Skz/3DrVoqd/3Dbr3w3Tm5rkvHLfQm1n47JZWbAoJEnu5iQCz71WQSOxoQSCKi78dzbLX9o1CICLnbN807gzZoY2Rr9qH7xqi4gSQ9hgaPn8ehsX6BguqBeCjiC/Eo6OZu6UjPMx4GZRZoX0TJFFcJiNT88m6TlEignHNw50sOLvDPb7giZ2eM1xv4P9WW7+fAYdTUCyY0vGTXiINPMjjMtAgUwnoDlDWNWGSqSRA5bELAzK+P8Ja79lEXAW28g16dzEwHmzkljZSru0HTU8g1vYMsnQCUW/AETc1pX+ZElfxDDYcu3FuWaITe1g+A7Cpq2xdj0rJE6ARsoy5/xKWihUeTY75J83pwKPOfrc2sd3xbuBk8wpoFwzIVHBeLx7vkiLvASjPP4nfagRgb4MyDIe61axyNfFRlXdzr223J2JUcfZsLgZSVaujm0ef0bgzYZYD5t7V+MAaCBiX4PwCUIiQ8ZZ4WizhgYj3PkeNrMiwvKIBfr7sV7znhKjJuI/qxB6CCMacpPcp0iOc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ddd728-dcc0-4d20-0ca1-08dd8a874d2b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 21:13:07.7337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYolLY4CI3Dbjwx9/CG6+3Gg/cLxBn27isY31FQzEQ/KJsPPTJbpnIfoJp4t/kLvdqMIvjFm1SOlOLOCj3YZ8U8iszH2v4hoDkiLUMh/vmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4373
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505030196
X-Authority-Analysis: v=2.4 cv=fu/cZE4f c=1 sm=1 tr=0 ts=681686e6 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=JUZvRre7zh5LkbeaQN0A:9
X-Proofpoint-ORIG-GUID: Wuo59kDGPfIxPtR39lK1GuJnSmB35KGG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE5NyBTYWx0ZWRfX11ijwWMGyR8D tLYK3HU8M/mcmWv5cEKx0/LUw2dr6HT/u8sg46KwZkJD13cmBXWrIJUGOSuMSKnbFutuPBpT5Sp nMADEI+ubJXkHvgA8sSNicfCmXSmmHjaCtYopQ8yvVdSzmkZnSLpfSEC0yf1skSNBU5Af2lm86E
 c1Nn4MjV8wI5X4Xmusq71licHfFM5STs6RCEOFEJcYhgbPpvX8kXA1gmk50IE2oTdg+3t80ewE3 DB2FSyzfWE897b+Q4NQSYLFdUFBMdvXgV/D+kNO8cYTdgjMXkU9zXEYBNx9VSDuE3eKSgGgibu5 r/Cz+qRqn+FNzET4stvL7FnKnQBcLuNbU3Ub3R09cBcsQltqJMNLYipiuWemRwnZxUjYiwlgXzR
 iMAlLhlwfOxRzzLkO7eRiMjXwN2FCVibyCGZ1YvAz2PzU6K8OhqV7k9KCvpiFeYrTqaGwWJm
X-Proofpoint-GUID: Wuo59kDGPfIxPtR39lK1GuJnSmB35KGG

It is useful to have the CoW self-test invoke MREMAP_RELOCATE_ANON on
partial THP mappings, as this triggers folio split code paths and asserts
that this behaves correctly.

Add an additional set of tests to explicitly do so.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/cow.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index b6cfe0a4b7df..1770ebc3aa13 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -793,13 +793,14 @@ enum thp_run {
 	THP_RUN_SINGLE_PTE,
 	THP_RUN_SINGLE_PTE_SWAPOUT,
 	THP_RUN_PARTIAL_MREMAP,
+	THP_RUN_PARTIAL_MREMAP_RELOCATE_ANON,
 	THP_RUN_PARTIAL_SHARED,
 };
 
 static void do_run_with_thp(test_fn fn, enum thp_run thp_run, size_t thpsize)
 {
 	char *mem, *mmap_mem, *tmp, *mremap_mem = MAP_FAILED;
-	size_t size, mmap_size, mremap_size;
+	size_t size, mmap_size, mremap_size, mremap_flags;
 	int ret;
 
 	/* For alignment purposes, we need twice the thp size. */
@@ -869,6 +870,7 @@ static void do_run_with_thp(test_fn fn, enum thp_run thp_run, size_t thpsize)
 		size = pagesize;
 		break;
 	case THP_RUN_PARTIAL_MREMAP:
+	case THP_RUN_PARTIAL_MREMAP_RELOCATE_ANON:
 		/*
 		 * Remap half of the THP. We need some new memory location
 		 * for that.
@@ -880,8 +882,13 @@ static void do_run_with_thp(test_fn fn, enum thp_run thp_run, size_t thpsize)
 			ksft_test_result_fail("mmap() failed\n");
 			goto munmap;
 		}
-		tmp = mremap(mem + mremap_size, mremap_size, mremap_size,
-			     MREMAP_MAYMOVE | MREMAP_FIXED, mremap_mem);
+
+		mremap_flags = MREMAP_MAYMOVE | MREMAP_FIXED;
+		if (thp_run == THP_RUN_PARTIAL_MREMAP_RELOCATE_ANON)
+			mremap_flags |= MREMAP_RELOCATE_ANON;
+
+		tmp = sys_mremap(mem + mremap_size, mremap_size, mremap_size,
+				 mremap_flags, mremap_mem);
 		if (tmp != mremap_mem) {
 			ksft_test_result_fail("mremap() failed\n");
 			goto munmap;
@@ -988,6 +995,13 @@ static void run_with_partial_mremap_thp(test_fn fn, const char *desc, size_t siz
 	do_run_with_thp(fn, THP_RUN_PARTIAL_MREMAP, size);
 }
 
+static void run_with_partial_mremap_relocate_anon_thp(test_fn fn, const char *desc, size_t size)
+{
+	ksft_print_msg("[RUN] %s ... with partially mremap(MREMAP_RELOCATE_ANON)'ed THP (%zu kB)\n",
+		desc, size / 1024);
+	do_run_with_thp(fn, THP_RUN_PARTIAL_MREMAP_RELOCATE_ANON, size);
+}
+
 static void run_with_partial_shared_thp(test_fn fn, const char *desc, size_t size)
 {
 	ksft_print_msg("[RUN] %s ... with partially shared THP (%zu kB)\n",
@@ -1181,6 +1195,7 @@ static void run_anon_test_case(struct test_case const *test_case)
 		run_with_single_pte_of_thp(test_case->fn, test_case->desc, size);
 		run_with_single_pte_of_thp_swap(test_case->fn, test_case->desc, size);
 		run_with_partial_mremap_thp(test_case->fn, test_case->desc, size);
+		run_with_partial_mremap_relocate_anon_thp(test_case->fn, test_case->desc, size);
 		run_with_partial_shared_thp(test_case->fn, test_case->desc, size);
 
 		thp_pop_settings();
@@ -1204,7 +1219,7 @@ static int tests_per_anon_test_case(void)
 {
 	int tests = 2 + nr_hugetlbsizes;
 
-	tests += 6 * nr_thpsizes;
+	tests += 7 * nr_thpsizes;
 	if (pmdsize)
 		tests += 2;
 	return tests;
-- 
2.49.0

