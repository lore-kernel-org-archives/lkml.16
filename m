Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A5822DF96
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744799951; cv=fail; b=iGiUqLayjaedg0PUmLyolMHk+kJTgYRJ74oZIo40XRywfOZMKrZG7HyvLspbdgzbwNfo2rG4xx1ECku4k7iXOXUFCinCshLLB8jXp+GhY6a0QwcVV1y+a3fB6wKg6CQ7JZF+17TZO7FAuhQZy2tjVMEh3hqTENFN8XRB5CzssMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744799951; c=relaxed/simple;
	bh=4poN4w/ai76Os2W7NeMbDtJeC5d2FxQwMHQ/2EW98oI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=e1z+DjSUfvExdi/TgeeLwIGlCAcmCEiTPrFonfCpHxF/4+7IYIEfyVPrrXVzc4xwjMO+oASHUX5Q0CtBJ90b2Vo2ezgJZk4eW0i9xhjtuWtMYnYEluA0SlwfginN0mSOo+b8EKXVhEimLU18y1l8yn0BS6MLuxsBTUy0anmyxww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=c523ZRTw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=txQqoMok; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="c523ZRTw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="txQqoMok"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9MrXg016567;
	Wed, 16 Apr 2025 10:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=nF1LZf4zamQ8iQII
	upJ56RdlXnElYQ3/OSeuLvYPJVA=; b=c523ZRTwejBbBfsgLqSO2fAx9rTiYwUp
	LNgB3qIQvH9y2Pz/uvSdEMQZsnbQ6E0ulx3D2oOl5b+7Aw6u28D95Rx0aV9V6n+7
	6vg/Jj/e+kKWjRPI9b2SOJbzKKl/HPAaW/t1azi3miRr9/geuV+R2CEFNx3JuIcC
	cozOUIMKfb0EiT072XM7mPFvXeMd5yui/liN6j4SKgUZhrfuzQN1gViyjYJXP6Vi
	ssAnWrzSH0ZwL2HFyhxei7idHIDEXuCsvZDWpywP8l3OD07dinGbdbtI7tfAJbXE
	3GD9K8D+NAlKklRqDsvV/BnHTSwTIr4rQ+SdOUnP4lG4BC+Dzyan9A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185muqgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 10:38:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53G8Vifh009213;
	Wed, 16 Apr 2025 10:38:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3kdnuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 10:38:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7ALdflzoZJ5Sam6XrQBgzVLavwMhgJthT2gug1PV1k/k+ONNHMdYKgp05bbcrDFv1w3QBLtp2h4tggZUMZwVDcH5GApPoHac6FxGf3g9rC3BgE6tSaDU77xy1onyl/Yzvcxbo6Z3hZQGnxuKW6EoZdxmE5HHiVJM1KIfPbAf7seHeLzKQZB+FEBCeUnt0cNb7bxGn2BYF8576wur7gN1SlUAgQnJUHw6Z3BKVfYN9H+7Ql2aVNK3y74QyajjVdHlC3a4pGuXg24wYISsPJG/jv+plgyBxKuSVLWsVsBmvopAhupK31LGw04UvVIwvUb9FSvMa5R4rOQroRXJgKEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nF1LZf4zamQ8iQIIupJ56RdlXnElYQ3/OSeuLvYPJVA=;
 b=n7of4ubo6bY8pthsK9GqgreGSB7VHuXSbdWthjui8pXRoSNN9iEu/Y8koniKtK76rqjnFsyrAerfSLKLNihmU22DXGuYhrM5a5LrZ/Bvg3Q4j587Wn3o0umcOxcv6bcjNzMAs/23KSvLxi8D/41Z/8cUu3SW7kGVKZQIvB+MAKpmKs9ma1n2nTu/nXIePt5yy+Z5ICY/P+H6koXNcRVA8LIUH3LyeEJYlUFEI20mmV2iYQ/zPi7GTE/gOXyRcSbP7aiQ2UUGPC6GVLD+Fh8G/ctlTyetbsklTgb4YF23OL7c5sszKLxELE+//OJHfN5NE4XCCxnLxqDVZ5G9thKFNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nF1LZf4zamQ8iQIIupJ56RdlXnElYQ3/OSeuLvYPJVA=;
 b=txQqoMok7r2GEkoNyWL+POAiq/CX2q8hwJeSkIxxKX8GznRyq0qNXY9aGEjsbTWdS86Cpad9+XUz/q9JxMdqdvtY3OCfkSx7SGwe02sL4PmizwdgVuy4LzPTRmpdJLClPL2xDeWd+EMaJUH5LNQ/Sm1ppGW1Mai5wcye4QlqD98=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY5PR10MB5916.namprd10.prod.outlook.com (2603:10b6:930:2c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 10:38:49 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 10:38:49 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>,
        David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH v2 0/2] separate out mmap_lock/VMA locking and update MAINTAINERS
Date: Wed, 16 Apr 2025 11:38:35 +0100
Message-ID: <cover.1744799282.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0394.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY5PR10MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df09347-6774-4923-f9eb-08dd7cd2dfc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p6NTmwNPQpW5D+UJXmBeICQMOw4cBb0oadMPBvk/6JPA2Y1jyW73ZBtdsNbA?=
 =?us-ascii?Q?4e+Yjw5L4r7Gc5/Tzli7RM9EJjrei8BYMcTz6XId12d/f0i0gpUeNtmvzTFc?=
 =?us-ascii?Q?fWM0wRm++HKnnAX3j1j0Lj2sbg7yOjDQ3xVoupZ6Ke2RQ2I9Gk7UuOds1ttB?=
 =?us-ascii?Q?0rs04+0RqXeSNCzT6Ehhw/7hUDylFeL9r/6vi2BsEHzTj4LpChJKjuwhYVey?=
 =?us-ascii?Q?ZpvB8LYUZN/rxFQzYJJikERqbGx1LNlDu0d54egQypgMy5boKufjA446Kli5?=
 =?us-ascii?Q?XhUxcXlQUgO8UrUI6CHNBHn4JrZcH+Vby4NnqYhVl2Oj80XSWI6OlVlTXbtJ?=
 =?us-ascii?Q?c9CyIqO1x13E0K5SwovskK6OEFtBMAgtCzMzfvwr2vgqjT06JgpKTyFA4VSb?=
 =?us-ascii?Q?Q6sXrhspebaCuNCbrOtOHvo2/gRw8QI8rsu2fHA9CCqC3ffe5A1TYWfLDtWB?=
 =?us-ascii?Q?22+CHt4tVNEgxZZuXYXEtd6Bjxdx9K78Rh/prwGRe2csXNnuhMHuXsvLw+CO?=
 =?us-ascii?Q?NW4BZYiYWTEPR/Xud8ZPzdPyd0vKOggf1fzsqoch5tQAA0lVdaVwJyfXq7WE?=
 =?us-ascii?Q?VNmONEmezYa/vmBDgOgQ0x8yDRb4qS6gWo94WCQNqIm/EMqjLuIomL9xi2Ny?=
 =?us-ascii?Q?zTsQyZzOFDnTummQdKNZ542saK9/Rllfeb+FgU6B9y6T5uf3arT5OpGT8seP?=
 =?us-ascii?Q?Vx3OP/yWPZCWSfLWDPcSGWP4DZLLglYZYXSioSo31Tj8FXHlsjoTG/BQ9joQ?=
 =?us-ascii?Q?Eb/PvhtPmtBV2QFN9v35RZytnzaqKOdAn1+jHM6PFAypZtU0k7gqv4sWoe4H?=
 =?us-ascii?Q?p+a/XOtIZzD49U6Nec9B3GtUqc9MrYQgDJhlBbAweUGdTEHaf46CgEgb2W5W?=
 =?us-ascii?Q?tsJq8Nx8fSOfXbMIpHKEvnTCgG7j0oXHcqRm+E00wIBJ4lIMPZERUaiWW/a3?=
 =?us-ascii?Q?GJvEesKWMbI8MlCo1Wzkp7spIpyGGm9yRi7xiDNQVVGv1TegjKIKPpBXh224?=
 =?us-ascii?Q?xzzhA+QnTAqDgjQiYmZ1LmADdnMXxsE/wfleLbfkeZu0RBkkdnXrgqtAe4sG?=
 =?us-ascii?Q?DzcYIT+n5IW/CLcJ94zndPNz8lGBNTIR7djs1KcPMwAmHSZrVJFMaXrOxLMY?=
 =?us-ascii?Q?DwRJXzyGFqUwWf2DLyalxMHMkyWQ1cbFqO5RycLg1yOsTHWUJdK0csP2pWda?=
 =?us-ascii?Q?I8hPYe7ZDA2+hnHbSWhJOl2lU5eItwAL6d1D5JN78PqMDKTcxeND3MWIiLoj?=
 =?us-ascii?Q?MqRhlGJAYkmQmdExZtuj+TKEDEHeMVHr3Z5t6ovoNY0VAEB1fQ9T7lZfD3pH?=
 =?us-ascii?Q?fNeBFEUT2JrzNpRAQYcSDtOt9I9MKjN6kyNt9qEW5CnwXrzy45j9j3G3auxJ?=
 =?us-ascii?Q?Hea302uXthA0/TWg9lwx/0xKNDIUatX+0F6DLFLvZGdBpIEHM9mygekCnzeY?=
 =?us-ascii?Q?h43AG2YIJFA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5kIQpbV4TSVuBNM75hJUblRikWGLYgid5ObGxiHCQg2qgURuEtJA/wh6TG1v?=
 =?us-ascii?Q?2C7hbC1XLoqQ+O3wUzOFN5ljAxKCLPhJRrpGl7pxvKh7McTEPCul9PAWwWda?=
 =?us-ascii?Q?AbYtBfPJMSwIYrj8alcW/wEbOMGTcaJ6n10y/WfZ10XtBUCEqJiPS4tc0NXc?=
 =?us-ascii?Q?ACRqqY/8x0a3AEi0bFDJ5SF1Rvi1dHDQZ8uaah9paY1G5K8CAMwAjQUS3oeD?=
 =?us-ascii?Q?sz7vGG80Hzub7WXiEhIuNIgnNV0Nn4UlR7GfAmjcCztWdS1/2PAnqqtTAuUy?=
 =?us-ascii?Q?V71uGQqcfQtuVJZg01bx670fi7fAUfY9yO3szhI3Sjfgl3kgYSJtk1b2piYa?=
 =?us-ascii?Q?VYrB2CGyXh3pjq/3ooROwYUAsn0AeVe2bl0gQwRnTy52sY0FCp61q4k1zoK3?=
 =?us-ascii?Q?3LctuuNF6+7KElt3hZNvnUSvMiw9yS7P0NgoG1FL/IErdMTwd3XUGajGPJm1?=
 =?us-ascii?Q?h1FRAiTg8s/BANk75IS/jo2xWAv9rk6cvEVekjoZNLGgMmmS7awWrmz9jh2q?=
 =?us-ascii?Q?MWcl8VlP2u4a7t17+4v/BKpE6e5SdD9EF9nAOiCmJ8pffo3OOyAGZuYkgupu?=
 =?us-ascii?Q?AWRE/wBGhn8Mf0vLWKJ7QnYI2OmjvlbHDaOiBft4yapnNqkLYpbzmkBzoHAZ?=
 =?us-ascii?Q?gqxnUNmu6pG47og3XDJiZnmO/iPYfT/wYt4sTtNuGA8LKSfWIubX28JcZzcR?=
 =?us-ascii?Q?Lu/CiKIuA84scE93kNEtr6ZenSTp3xoiZZoZbq8Zr5UX95/lr77X8X9hV8CM?=
 =?us-ascii?Q?AKgSb3PSKJCDZ5ulDf4Jeb7uWMZT3HPaKFgdnZeE/3mhnX/tNQHZfePXq6fY?=
 =?us-ascii?Q?YtsaHHOf5qtAr7X/7qr88TTOeXa8zwAmP9Abp9tKbCm1uBP2v0NcxCBXnUlx?=
 =?us-ascii?Q?y2658n1f/XmZWdZNa2WTNSwFKsNTWIyKR2vyaQf8rfbTX92oYzyESas80nY6?=
 =?us-ascii?Q?5kk5mIOws3vNqyHkRC6t2l1jqg7JDLMcKYdbEz/Q4RpBvY5eVgnk2Ct9Yeaf?=
 =?us-ascii?Q?1UbLuw6eVt1uUa1SCoVS+/dl4AtQJ29wBe51bhduEKFFyz6xAnS+1DeTLUos?=
 =?us-ascii?Q?k+LUm6QQ9wMxuSRlwBj28iTNm1Mh4Dx+BExqMmfLxwi2iPP5ptvnWkbrLb/c?=
 =?us-ascii?Q?FePOWTIArhvPI6TSZ5yRmfP412GVpf3U4SwWA4d9GieDC75l9pZS3x/ggyUb?=
 =?us-ascii?Q?V7zsG2QS41C9PTR5WE0p9Z23uHjfUqQnlOUt/OJNeqJ1mhSX7ldgzaPD+uhJ?=
 =?us-ascii?Q?cwTjbIrp3Kzjd6xR7iYLPgDc+XwvXwe7E0Ht3Lp7/9Tp6RTD0tHsd/3qOaz3?=
 =?us-ascii?Q?kRKZ4ry4jMax7NJPiBiJANTZOiVOq6W3YgBw9Sc+JHYk/aWVWcqwvjyDqeIw?=
 =?us-ascii?Q?Ri4JVeq5JP8FHvb8SQ4OPBXkUOu0bKK8P52bo/FiEj1OQLbu13XEC4C2kqaa?=
 =?us-ascii?Q?jFrnzUe7Tq/saYGE0LoOztm5Dw/zzw4f/iFs1l3+OQBBlsLVe03dmMPe2/Vj?=
 =?us-ascii?Q?rL9sRmwao/ZYzzQdbJJKS7hHR3490yHBRdS82wLk3SjMT/+mXMapYvQ3NR2y?=
 =?us-ascii?Q?yYpJ/7ZSXNQt48ubWUpb4tgDK3KG1PrFIjYB88W1Cyo8994xS+ajz2dhVmTZ?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ptEssll5ak7dV3kpklutTL2YNOntYQXnGJUAbBg6VHHaYEOT/ix4VG/3BymqCwnFtsn3ZG1COZwFvO1KOAW/dgR8UH6dPjmXacXXMr5+Y9Eq9KJHhkm5nIhhN9NPWkz1o18gOm/KD7juYHVpjhBxlwygk/Q/syR7lCyu3LhePzGWZPmid0bo7yeM87utmAfdFeNeOIr18p0VCOn76xMNG6ZdGP3ESUT5oCZZylVMyI7uC/hn49jUHSclnSjL/v6CAL9/HAd7xfXgVmlHPUeADMpAUeVdShgsJyTO+yNVmfBnF8REvi+VNtl+s11wPFsQILeJBloldppv8yK5HcjRpbYs4d2w4A9dFDQ1TNamrQ21iDNRSl0B3wypFcxsQCHfNPIPRUareH+jbzofIju40sMjul/Q0oEXaN6lXP/70ncDhbhi2UMtjgGot8mUBgrhp6YlzeHZF+BQKd8pRT/wVpFesFiUPIaAQyctDwxsCq8N74aDVXTm63Yc1MTKX4Xo/LFDgvHHrkdausVn7NbcBveyPTsa15/8FYySjWysUX54uFwY2yV+NCO4Ej1T+kkeltKEbr4nMGZmq9qkw2bPdpddTQXYxRw9sDqMv2OWVrY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df09347-6774-4923-f9eb-08dd7cd2dfc6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 10:38:49.6537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I40PBhEdCrV5nJ0ebpadLLiL6986TL/zq1NlyITx2673SLpg+FlRi3WaVA7dAyH95rGbn/j1bCmwkPp6qou6m+6pJsAcz14MTkK3MVN/+Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5916
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=687 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504160087
X-Proofpoint-ORIG-GUID: vSUo6am-KshmQZZKW1mUX6JCqyiXrEa4
X-Proofpoint-GUID: vSUo6am-KshmQZZKW1mUX6JCqyiXrEa4

Separate out mmap_lock and VMA locking logic from include/linux/mm.h and
mm/memory.c and place it in the existing mm/mmap.lock.c and
include/linux/mmap_lock.h files.

This both provides separation of concerns and allows us to correctly assign
maintainership based on file contents.

We then go on to add an entry to MAINTAINERS adding the appropriate people
as maintainers and reviewers of this code.

This was first raised in the patch adding tracing files to the MEMORY
MAPPING in [0], kindly pointed out by SJ in [1]. This series implements the
suggested changes.

[0]: https://lore.kernel.org/all/20250411173328.8172-1-Liam.Howlett@oracle.com/
[1]: https://lore.kernel.org/all/20250411174734.51719-1-sj@kernel.org/

v2:
* Fixed typo in mmap_lock.c from errant C-v keystroke in emacs as reported by
  Suren.
* Moved nommu definition of lock_mm_and_find_vma() as reported by Suren.
* Added Shakeel as R as suggested by Liam and confirmed by Shakeel.
* Moved myself and Liam to M's as discussed with Liam + Suren (and also
  confirmed by David that his tags may be propagated to this).
* Added tags (thanks all!)

v1:
https://lore.kernel.org/all/cover.1744720574.git.lorenzo.stoakes@oracle.com/

Lorenzo Stoakes (2):
  mm: move mmap/vma locking logic into specific files
  MAINTAINERS: add section for locking of mm's and VMAs

 MAINTAINERS               |  16 +++
 include/linux/mm.h        | 231 +-------------------------------
 include/linux/mmap_lock.h | 227 +++++++++++++++++++++++++++++++
 mm/memory.c               | 252 -----------------------------------
 mm/mmap_lock.c            | 273 ++++++++++++++++++++++++++++++++++++++
 mm/nommu.c                |  16 ---
 6 files changed, 520 insertions(+), 495 deletions(-)

--
2.49.0
