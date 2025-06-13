Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C861EC018
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840514; cv=fail; b=CNXnCZmF//rVGFwCG7vOPb4xexfxk86trFxglfN59D0gqtIlmWT8u9dhpM95ZyTBD1rb9DFw4fXdRQ/EQ55P52Woopu5Pnovk3J8+K9iJJC9Q36mII7gkab4JcSDEGV+KrDSF1/wo/i+67AR1hxRWUmEBsVq88PBpk4WSENAmKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840514; c=relaxed/simple;
	bh=WeBtwWhK4C66gQ4sWAjf5/VgxV3vkK62vhjKYmbMOes=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GEOicrKqIfbS7js9WUApqxVmjkmZFT85GCHSam/DFcZZePT/wjEscM8G6LPqU6lLEu8FQME5hrSqfKU7ra5BzhbyrxBL0pDhu03w3Din8PzSdP+agOVGnC7+qSicZ22UGsMDFjqQPelrHvyfWQV+l20S3O5MRn/Lnijt+vkvAqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b14qjH+d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BM7cU3W8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b14qjH+d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BM7cU3W8"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtdg8005753;
	Fri, 13 Jun 2025 18:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=VvU7VsKJm0ZrvFll
	lWc4xTgzPaFeUSm66rUDmaG7+k8=; b=b14qjH+dM7bWzz1Ut6dqpN7nQmDpeRuv
	02rampCsNULU2yZDmr8cUFap98EHaRzScFA0MOVvhLK+dcZX9B6vV1fQspEMR0cx
	/mOwGuzghDQxhiXqGOvMVXfj/8ikNbBDqSyOHfAvg3AjvNjgdxKtxfN3tKre4DkV
	GT603HPzWwgIzVzkPe0LGgCJYHgBqNjW+ZAYC49nyXliRtH4ePHxpq2vcfVVRNc+
	HHnoskQ0uFgYUr7C1ABZmCHx6QwtT0otjNXO5n7zX8eaIBca4cpNBuwcg14e+bG0
	IiIdhVnguhLxLdj0+33021GwAdr4rg0jtMt8lY0JApLMCnB7+O3B2g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbem4r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 18:48:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DIFk83016716;
	Fri, 13 Jun 2025 18:48:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvd86mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 18:48:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kl/TZCpxgCv2ugWsMAeaMW/LVGi0Suju+oyvEnpDcL1Cpj86PzscOR65s+YQjbueb4+wH7OFZ5AYWLx1VrZGFU5N6IPuZP37HBg7aG3paTkfd3kEUte9DBicOTP8owQ+ANV3qKvSfdcSqGSSI4OecTMAsX/Y5KNFIKwBUu16Ujh/Lz2g0Eo5BT5hLPEJX4+j+hQe/Jh/QDja9GE5M7cDspJ4IG9VgMH5LRMnjVAQHjiKkyEGyzzeBCz5o0CzsJZyELI3j84oyZWbotYknaYMkpSyVEgUa8mQaxVS5lKrssGe9yLjT+dK5Zz0of9spk+9n4ApKNp6i4JpB9RnJuOLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvU7VsKJm0ZrvFlllWc4xTgzPaFeUSm66rUDmaG7+k8=;
 b=VOU54YaHv/ta1OETHpU+V6+h1aRLAiVwy2nygtosziuHET4sd72wLOrnOP7WXICApYiyx+gV9ejCTCnEDlsId+w0oJgdQkSIklzkeQ5NecSjU2QGnhHELN1qlu6oKt62UIwjmHybUcDr9hOY6fmpi3nfJpj6tqEotn/dvFeqDap1GVHg3Lg3/pffWdccgBj5bi2A3v6NBUdOpow7MKKB74OQlWUVxRaXs3zjKMSOJ24jOOnkJyzlms0kKdXF6sYMj8dGQiZYSfpOGj0Vhg2mr/4XXmNP9WddnltCVKhl4myibO52aAj4bXxy42/R9cIK7bZLjC0gHYxzM8A/ejtNow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvU7VsKJm0ZrvFlllWc4xTgzPaFeUSm66rUDmaG7+k8=;
 b=BM7cU3W88AxlqeRt2mOm30ye7qlTV0dobLueYrWXDtgacG9WS7LBInzJ/nK6VX+yaCZSUw26KpReREpcoZSZPH2DOsSa1Z+jtrhW0uRjv232nZFutIO0e/g9/3FLyJ8fHdzF7f4v9Z7h9d77RtAWxe1Mh4gxWVPRqc7i2EpvHrw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF1DE1C92F7.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::792) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 18:48:16 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 18:48:16 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>, Kees Cook <kees@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mm/vma: use vmg->target to specify target VMA for new VMA merge
Date: Fri, 13 Jun 2025 19:48:07 +0100
Message-ID: <20250613184807.108089-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::32) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF1DE1C92F7:EE_
X-MS-Office365-Filtering-Correlation-Id: af808fc8-502f-4dbf-9f8f-08ddaaaadb96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8WSdCfcrMWp0CUfbwtvsbuFyn8xZ47u7nIHNb9xCqHdAAWwfB9eJvLgZgSIS?=
 =?us-ascii?Q?BHJxdavedPtYCbRPKF5fs+f6eHhaKR1rDj0FQ1ZJbPUz7eC43ZNn7rjY6nQP?=
 =?us-ascii?Q?/5ZEVrT0zARSJ/DgwNawOna0jjLwqk8NFLHYL2b9kNNGua4NEB2CJ9YBcv6K?=
 =?us-ascii?Q?PA6AT30Kd/KPhfdD76rLC84NKyCBmfBbu5U3XdX6XbFkXEr8YMZvKNdCBNui?=
 =?us-ascii?Q?4ODraA6ZjhZQvj5vEBATSo0u8i+/q93Psc3S022enFovBZhH0x3O5oU4SdhY?=
 =?us-ascii?Q?i89PcSiA8z1TfFmxIipFa73BVKfWCMO8P+X1ushttG6bWuZ1J2Mc3LUf6JSc?=
 =?us-ascii?Q?wISxvleFfO/Bh2tBXquxuiJQzRIPAEd5pcxRf/lHhkv2oLwd9Sd+MVASDoeh?=
 =?us-ascii?Q?kxswrX0uOqB1JMLS/byyR9yx1k21bjPSYQ2tSdzp14WIyO3oHcqCPkiLzscq?=
 =?us-ascii?Q?n6UIpiXNncGnHuzCAaBZGco7g20xMSUeIjPvoOO61BYJXacF4PjjOv7nPf5U?=
 =?us-ascii?Q?Iop4pnbROOyYEOSyqvSoBg8LbRPIfHzLTZwOeHqePH9cph5fuG5qUomhrwgy?=
 =?us-ascii?Q?nlcbJ42JN7pZa5t4U5u4h9nK3nz+JBIaYmPOpMTEmtlFi3IXtAUB5eBO1vTr?=
 =?us-ascii?Q?1D/DfPaqybDH2LGEIlr801rJTBlVdLQMoGryFdJo/Eic2t4EQyCQn/9jxdkr?=
 =?us-ascii?Q?mL5UC91PROgjW49erJ3LdY3f27LDW8i/kcUuUp6uGLZw6EmfuHxoQapFcLHH?=
 =?us-ascii?Q?7GZCziBsQOOmFdx9NaJiBnP2rsgTysrzfeVI634Vm3W/ed0nk13t6wMfveIB?=
 =?us-ascii?Q?Hq14AutCY1uT0m4er6IuSVUcVPHe9uGeS3VA9VznLB0kXv0Ocd8w5A3lTLgx?=
 =?us-ascii?Q?GdS6wUB0q2vFm/YdntuZQ0XMYb2RBGnGSERfdvicalbUZiuOEJLy5d9ZbD/6?=
 =?us-ascii?Q?ncFtyx2NyQ1V8Gf3VGPaRak0T/+GQHYJdDplrEXfDpgYhoh5zAulJz+1OYYT?=
 =?us-ascii?Q?aSrMI4sA+FD+VFTV03SFxBd7U4cH4MIEz51Cy4rPcy88esN82F28Uq465mD+?=
 =?us-ascii?Q?xTD2ApPBINZ1y7pVABy8IhLEzQs/bdaGZkFq9M7yyAyedpboQdYcUc1Gyb63?=
 =?us-ascii?Q?5hCetzCApyT1cYOSGqRkbP2b/LiDT3X3Q+bxQz8bS6GmqSK2pLjNz83EzsNN?=
 =?us-ascii?Q?YWuzHDlNkpvZO6gKfxY5vsTsNjvWX6MMz0z+62EEN/Z+i3HM9ETzwqLl6z+A?=
 =?us-ascii?Q?RYK8RK3Yj6+ZDc8zPVlxhnX4ZFfCb9PtSsNbgfs4dpyNaqPoov8/ftwUWbzX?=
 =?us-ascii?Q?YYZKTADymgnpdrAZziizKHPwl4wSte/FEThus9hlg2KaDfszCreMx3Y2gy4W?=
 =?us-ascii?Q?ds+ZPc+APktEo9RU5VwcL77W3wAR2IWHOz2b7kTg5V3spIEsme+zI9iu0+U0?=
 =?us-ascii?Q?wy2g5fMoxe8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6k1Df6hz4zjPC+3C8IYyyiCIP0WgKFJWM4oms5e2S5bJa4DECJrNalKlACzU?=
 =?us-ascii?Q?/jOb1v4l7WHHclyf5dLq0uG2t5cKOyvE8GUq/AV1DVGJkmbhGMIb0/foxXA5?=
 =?us-ascii?Q?S1uBI5+XSC5tEDN+8UPDiQ/PZasICUvC0ZrYEADdFid+mL/D1JGHZu0g5P4T?=
 =?us-ascii?Q?VrgvedOWWADAgY+OPEdtXwNqiEifDyaZXNpnDOSEYB1wijC+XM5NVFBKvb+u?=
 =?us-ascii?Q?beWMrCFmKGknU26z3XtD1/EwaDcvKa1FZ6bCMw+sua4a/jVb8xAnW2DvDW7V?=
 =?us-ascii?Q?mJRZCUilDiU6WS1+/lmoA7XOB2Ju7gkRh5EbIwbd9xkSFg+M8kAoo8lDk5Ux?=
 =?us-ascii?Q?xF2cMMxPidrROEHVLGHGbLXEwHOehMHgRw3oDp0bRDAn7TR9iog81NrDeEJu?=
 =?us-ascii?Q?k9k+07+AiX1ykbqpJajtFp98hMsrYBATuu5xXa9j4TzG6n3CosFOA6KpYggT?=
 =?us-ascii?Q?kFJ+hYNgNI4bW1VVJe8+l5xTc3fYnl9Uhfh6XZ+i1nDd7osA+DPcpg2DM+AY?=
 =?us-ascii?Q?l3EuFnhm/p5w2SLkc3X7XoZvJcaS5FEDIcCsqi6cC7HMbJu6BGDbwvnBHE2t?=
 =?us-ascii?Q?bpHigTSttdw0mINq5/AQAEz1NpUqbtt6ed97TSwG9PkIJEeZwLnBS4jabyHz?=
 =?us-ascii?Q?fwPAcXdzzla8Ie4h1h+ttlBgkbPxrToWXMFcw/R+FU/QlYV+nAWUr6y5CO+Q?=
 =?us-ascii?Q?jvYzdVaY/Kr4uJIZR0VkXVOmDO4t0nS93AVq5MBvyTyhLLELv/2ed+a77fYC?=
 =?us-ascii?Q?v7PJoz5wsQLQN2TPYfHJfQBkrGjgaUs9lPtKL0zY8btCAZNdFIVLbcc7CcD/?=
 =?us-ascii?Q?Z+FLq1Eh3oVYj1s1IOBVoMzQXC/QuA7L3hRsR1S/zyaqcT1anOKDbP/rMy50?=
 =?us-ascii?Q?qZYLk6gShaII0+Qul0F4KBcLd6hCSYsJKbb2rRh2QhuAxre36h8grMKjJyfw?=
 =?us-ascii?Q?3OqJZzYDJFSyw7zsYaksmIUHhDH7fhuTJnVUNfFAJUHx1xJmL3TKfjRUT+4A?=
 =?us-ascii?Q?eU6n0oEcQATRR/S8XruXa7lSV1WCHNdaaY/MtNHHdCj50fj752BEMTHYgJxr?=
 =?us-ascii?Q?stkt5arHUTgcVCh0SA57wdGPMDqwOWR+sWSHHUuIjO4RQ8mkqMOyk/IVXFJT?=
 =?us-ascii?Q?jh8A6C3bRQ4EzZPIlz18Dr1DselwNzfx7RKSFoQPuVwRBbxKqllV0Afkkc3v?=
 =?us-ascii?Q?rOFLB8YrLWeggIsmuZ/5+akojzoxxiy4LSkGvKH5ltE1nZmFmSpJzoixZZo0?=
 =?us-ascii?Q?uTGmG/fAc/XECeJ7TQhmNqlxDDK+TuJThsWrw9PuvPm4bvlxIqpFM2hlgAiH?=
 =?us-ascii?Q?xk9PNNsDn1iiivDDyKzYmSguTTpIrgxiXYTJ6OXJkok1tBlMBPQ5B4HH7Yea?=
 =?us-ascii?Q?Q+CVGYIsH5VhOfmWYVE1OjXK87WfvuQ1kWkyKcfeq9DUtTWqiV4u8+GC/xyb?=
 =?us-ascii?Q?z2vJZW97ZwtW7Ql5ckI7eDdCfA7I0DLkTRTBTbiJv3W52M/SysnVbcXlp2SQ?=
 =?us-ascii?Q?AynelWXaLMaoAiSp93TdRdh++yY66KP9MieFq8bd/Ug6xhIjhFjbSL3jtibX?=
 =?us-ascii?Q?VlSZPaZ1tVRw6IKRcZEIN1yK9D5lPQDGWiXFhkkV+fpXjnc5Tk7yFbng7YjZ?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e1JVcrIOhgkkRvIT7A3hbQcgN4vZyhAxAHI6k9vhw2I9NwWn6z5Ik2bRgoSxPsx5daNTLmBPaLSEQ+ED4NygvNxAjb+KG0AeW8JxnIgPsbBrx/lj8SXp9Li1HyyBIxFaskpeweh9TK7X2D561jzDngmYivcbLM22JJJNDvMnl6R3FWsZn2Mw+HBWI9wTdDYYqZpNLe5MdcH3Lw0CwcQXxAnhasK5ak+l2TZVAtDc4XrVTBsoKQw35n/G6fkeirEQeY11KxF3Q7Cinp4Q3/R1B3RzHfbua4mOHpH/a9hKKnrbgT0MLVzi2DSqXdGk2afdfn9UUd4yXanKzJBNnvol89gebJhP6zIRYCyRopegLzG27z2Glc9wG+6lY86UTIVr8RDPPRyqWhQjtKXtwLw6ddoW2mhx6DXbeu2TZhZlczKMN0yoWdvuSIZjtE3nx+Nzs9xzF8TyUGUL687AHIxbqUQwTUMkKx9goe2elEB/G6Ckytc9O/h5yAtSxSp9nPqOVyawBGR7yPUCxwv3YXnwxebF+qpJ57Ic1MfiCizLfVwlu/UgV36RhWFVb599mJ184kIS3JoXeBR5+2tud0pj4DB+u+Ip1IoTMTfxXKppO/4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af808fc8-502f-4dbf-9f8f-08ddaaaadb96
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:48:16.2540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S78hPQIZgE2i/LmTS6Hwxu6egxgFaayuf7ouqudZ+haGzz/1OAbaGdQuj340SNAdYLIse1e0KG6es7uicRchKSpoHayUQNA3c4rsBBG9x34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1DE1C92F7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130133
X-Proofpoint-GUID: auahTKYbIH_OJdqwU7KSe7sPCIBRh_qm
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=684c7273 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=bZtX5uDdIcPNizj3TXgA:9 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: auahTKYbIH_OJdqwU7KSe7sPCIBRh_qm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEzMyBTYWx0ZWRfX/BTY2av1DQQJ PotPTBGKKHZ4zx+csl0g0JeO1rydpnxbdzofzszlq25jCLBiWVYgg6K06AzsixIfoVLO1tRh5hD ZS8MYuAx4x1yC50b2wyTpWxLaip4tNiIC/JnW4vDqbUNwDGWJ2aYZYltkJf3FyVd+1MCS3LzWTZ
 PnaBbGvXCTwvVWbY5rA0ILStiMS4icUNlhZ4XpygPNDnk0RB51QISKR//kNtdk3HIi33RsTqx6o fg/SD0BJrIZyoyZmJn9rM5siZ+/P+Uq83r1tUEgibAm8tC9O+Y4tCcYeei5CIFEB6Q1aq75/MKl hyYQS9TgNGr8EtPfEQ3yn58RTk8JHHSzbAlpld2w1fNgJIlmAr5CrRYA4dTnifI7Xu8xIs1CwHY
 jcmDQUUd0e/Tjvs8q0STmwbFZUr61z6FjlwpwTucGS/z35s6KxSwbAMMXeXJTFzK48gvKReT

In commit 3a75ccba047b ("mm: simplify vma merge structure and expand
comments") we introduced the vmg->target field to make the merging of
existing VMAs simpler - clarifying precisely which VMA would eventually
become the merged VMA once the merge operation was complete.

New VMA merging did not get quite the same treatment, retaining the rather
confusing convention of storing the target VMA in vmg->middle.

This patch corrects this state of affairs, utilising vmg->target for this
purpose for both vma_merge_new_range() and also for vma_expand().

We retain the WARN_ON for vmg->middle being specified in
vma_merge_new_range() as doing so would make no sense, but add an
additional debug assert for setting vmg->target.

This patch additionally updates VMA userland testing to account for this
change.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/vma.c                | 36 +++++++++++++++++++-----------------
 mm/vma_exec.c           |  2 +-
 tools/testing/vma/vma.c |  6 +++---
 3 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index bfbc56df190c..a58b39b4eeb1 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -1028,6 +1028,7 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)

 	mmap_assert_write_locked(vmg->mm);
 	VM_WARN_ON_VMG(vmg->middle, vmg);
+	VM_WARN_ON_VMG(vmg->target, vmg);
 	/* vmi must point at or before the gap. */
 	VM_WARN_ON_VMG(vma_iter_addr(vmg->vmi) > end, vmg);

@@ -1043,13 +1044,13 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 	/* If we can merge with the next VMA, adjust vmg accordingly. */
 	if (can_merge_right) {
 		vmg->end = next->vm_end;
-		vmg->middle = next;
+		vmg->target = next;
 	}

 	/* If we can merge with the previous VMA, adjust vmg accordingly. */
 	if (can_merge_left) {
 		vmg->start = prev->vm_start;
-		vmg->middle = prev;
+		vmg->target = prev;
 		vmg->pgoff = prev->vm_pgoff;

 		/*
@@ -1071,10 +1072,10 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 	 * Now try to expand adjacent VMA(s). This takes care of removing the
 	 * following VMA if we have VMAs on both sides.
 	 */
-	if (vmg->middle && !vma_expand(vmg)) {
-		khugepaged_enter_vma(vmg->middle, vmg->flags);
+	if (vmg->target && !vma_expand(vmg)) {
+		khugepaged_enter_vma(vmg->target, vmg->flags);
 		vmg->state = VMA_MERGE_SUCCESS;
-		return vmg->middle;
+		return vmg->target;
 	}

 	return NULL;
@@ -1086,27 +1087,29 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
  * @vmg: Describes a VMA expansion operation.
  *
  * Expand @vma to vmg->start and vmg->end.  Can expand off the start and end.
- * Will expand over vmg->next if it's different from vmg->middle and vmg->end ==
- * vmg->next->vm_end.  Checking if the vmg->middle can expand and merge with
+ * Will expand over vmg->next if it's different from vmg->target and vmg->end ==
+ * vmg->next->vm_end.  Checking if the vmg->target can expand and merge with
  * vmg->next needs to be handled by the caller.
  *
  * Returns: 0 on success.
  *
  * ASSUMPTIONS:
- * - The caller must hold a WRITE lock on vmg->middle->mm->mmap_lock.
- * - The caller must have set @vmg->middle and @vmg->next.
+ * - The caller must hold a WRITE lock on vmg->target->mm->mmap_lock.
+ * - The caller must have set @vmg->target and @vmg->next.
  */
 int vma_expand(struct vma_merge_struct *vmg)
 {
 	struct vm_area_struct *anon_dup = NULL;
 	bool remove_next = false;
-	struct vm_area_struct *middle = vmg->middle;
+	struct vm_area_struct *target = vmg->target;
 	struct vm_area_struct *next = vmg->next;

+	VM_WARN_ON_VMG(!target, vmg);
+
 	mmap_assert_write_locked(vmg->mm);

-	vma_start_write(middle);
-	if (next && (middle != next) && (vmg->end == next->vm_end)) {
+	vma_start_write(target);
+	if (next && (target != next) && (vmg->end == next->vm_end)) {
 		int ret;

 		remove_next = true;
@@ -1117,19 +1120,18 @@ int vma_expand(struct vma_merge_struct *vmg)
 		 * In this case we don't report OOM, so vmg->give_up_on_mm is
 		 * safe.
 		 */
-		ret = dup_anon_vma(middle, next, &anon_dup);
+		ret = dup_anon_vma(target, next, &anon_dup);
 		if (ret)
 			return ret;
 	}

 	/* Not merging but overwriting any part of next is not handled. */
 	VM_WARN_ON_VMG(next && !remove_next &&
-		       next != middle && vmg->end > next->vm_start, vmg);
+		       next != target && vmg->end > next->vm_start, vmg);
 	/* Only handles expanding */
-	VM_WARN_ON_VMG(middle->vm_start < vmg->start ||
-		       middle->vm_end > vmg->end, vmg);
+	VM_WARN_ON_VMG(target->vm_start < vmg->start ||
+		       target->vm_end > vmg->end, vmg);

-	vmg->target = middle;
 	if (remove_next)
 		vmg->__remove_next = true;

diff --git a/mm/vma_exec.c b/mm/vma_exec.c
index 2dffb02ed6a2..922ee51747a6 100644
--- a/mm/vma_exec.c
+++ b/mm/vma_exec.c
@@ -54,7 +54,7 @@ int relocate_vma_down(struct vm_area_struct *vma, unsigned long shift)
 	/*
 	 * cover the whole range: [new_start, old_end)
 	 */
-	vmg.middle = vma;
+	vmg.target = vma;
 	if (vma_expand(&vmg))
 		return -ENOMEM;

diff --git a/tools/testing/vma/vma.c b/tools/testing/vma/vma.c
index 238acd4e20fd..61a67aa6977c 100644
--- a/tools/testing/vma/vma.c
+++ b/tools/testing/vma/vma.c
@@ -400,7 +400,7 @@ static bool test_simple_expand(void)
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vma_merge_struct vmg = {
 		.vmi = &vmi,
-		.middle = vma,
+		.target = vma,
 		.start = 0,
 		.end = 0x3000,
 		.pgoff = 0,
@@ -1318,7 +1318,7 @@ static bool test_dup_anon_vma(void)
 	vma_next->anon_vma = &dummy_anon_vma;

 	vmg_set_range(&vmg, 0, 0x5000, 0, flags);
-	vmg.middle = vma_prev;
+	vmg.target = vma_prev;
 	vmg.next = vma_next;

 	ASSERT_EQ(expand_existing(&vmg), 0);
@@ -1501,7 +1501,7 @@ static bool test_vmi_prealloc_fail(void)
 	vma->anon_vma = &dummy_anon_vma;

 	vmg_set_range(&vmg, 0, 0x5000, 3, flags);
-	vmg.middle = vma_prev;
+	vmg.target = vma_prev;
 	vmg.next = vma;

 	fail_prealloc = true;
--
2.49.0
