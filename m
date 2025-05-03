Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A5F263F28
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746306822; cv=fail; b=MQitdTFL2a+BVLV/3euzFctjCvNP1qSW4rlBUnrENCyklaQTFShdGKLyaYaSKWndug0SslIxPKkfsX7DbNpAmR613WXc4KOPFwnq1Ezl1XIe96JqrHQnULg6OtzVPr0RccQDXtJy6EK7ghrATR60GaOWwONmzcbiNMblGQiP90A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746306822; c=relaxed/simple;
	bh=+6kOyzKZ0agh21+oMemBvalZok+aKug7wpbGJgzfulw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eprGvfOi98c0+g6iwnm0v1D+UDFXmU+VTevqw+dFkfKJqv0mR4QA5lb9G0xfziq2N2p/4leWosCTASSayDN1VwwWU7lQQRpv0Rm9xnoW5XaBePVyqKbAOR3pd/oMiPXyVpzQ6gEXFk7iR96Bf3CV/v50uDpgk5zEJhXw8NBLpHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BoyDy/7w; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Qg5bBCKB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BoyDy/7w";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Qg5bBCKB"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543KU2q6018906;
	Sat, 3 May 2025 21:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ZQqyJpRmP3HQMl8il2ekXwRRALv8Sl5bq/sujmgJarI=; b=
	BoyDy/7wS1dqAE8O2nCO5lQd/NOzIms1dq64qvWbZoJc4SU5dowQTXa+CvuPbx/E
	tdmTEgjLJvwTspNh1NuIHYOGxmHksMh1IVfHtY98o3quJdLqUve/ykhabfLWZKvV
	/IIpJtrN2sSDgfTXI/Bd0vhOLdxftb1nt0Iyp4LFlXaoddpsr//fX/Usb52SvRcr
	fhvH2FB3K34suUOt/BLBPvK6T8W7op9dC4Zpgav4BrU+7C70kNESG2jGyFy2QptR
	bA/CTkx26GH6TQ68wbbuboqM6AcwswAea4lL/DKeGcIdS62vQKi2311N76PVugps
	ec9mSqPqUo1py9K279gK+w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46drqp81wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:12:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 543I1bo5011261;
	Sat, 3 May 2025 21:12:50 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010005.outbound.protection.outlook.com [40.93.13.5])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kcq2hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:12:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLrBn2jcpIANvH6TCA2zD3AI/o6m3LTwGdamlKcmho0ht+fp6/3YN/vh3PfrBoJg3z9vxp4oJAI23kjJ4Vn5LNUyGC6xAKMa974D9k2NQyev2GdKnP5PhEa/o1yMAAAzguLN421KNaiQRqjnyu5F7yrv2s2kRJKVjCYs6HKD60drze9fCPfWCmmbThjVVP+wiTfoVp4rJ7Mv6zCDkxEf1QxRZeLfQvgbRxb+0+wERtqaHFWA3u+LP9a8qOrNEHkMtzid3PRAYCifAqLxXmlc78xK3Yp+t+ZuyCCG5/OPJ7Ekcj8f5PUlhg2w9cRV8qaJ48G5jum8pAZtROhhC4JqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQqyJpRmP3HQMl8il2ekXwRRALv8Sl5bq/sujmgJarI=;
 b=rfbF1JB7qu4q+YGzhjRfzsEpTSrTR1AQph350ldZI9FXbBvHruH/YiKQAYQ6K4Sj2OrUiQFWhSUlCapIKNPpBUo7nyfWKfLteoKdyd/4rq7cK4uHkK5JnLm9hmv34VrRnq2S893TsqK7DhpRK/fZNq5YVxNUqfwoqHMsegKBDQOQ6utPWkO/KgZCEvuHOH5ngbSk78Gu1rCD6HXChKbiw959LlRrP9Iwf7En7D502zX8hH0q+afBmhmbcWOtSPltVFQ5Krij4oVu2MQJraDNxYQ91unp65mEtScpoRwEoThPCqTE1XfizrUCI6iyrGvQs9V6xkJTgcudylOnMbruEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQqyJpRmP3HQMl8il2ekXwRRALv8Sl5bq/sujmgJarI=;
 b=Qg5bBCKBshoNRF3hFQjLjele8OQRrBsbSgCKiLmn/+UjvlXbm0jpcwkp2FVHfjnGFnfGPvpVIOf1zOgitNdjDEZ4x/EOo/x+jO06XDLqUpVGL118ju/7nBvhRo34ME1ey097ffPos4RCm4nivWct/vyLnLsIaiE+kxXr9nyj5mw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4373.namprd10.prod.outlook.com (2603:10b6:610:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sat, 3 May
 2025 21:12:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 21:12:48 +0000
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
Subject: [RFC PATCH v3 01/11] mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON
Date: Sat,  3 May 2025 22:12:23 +0100
Message-ID: <c8af0250f21148a65abaf6815168e76fd0f7f19e.1746305604.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
References: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0045.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::33) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: 9473bcf2-8937-4a95-5c88-08dd8a87419d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+a3pYEdqesOP8SkWP4FZ0+mv013aS0rPRO4zNcuLK70w4qU2+Aw5C0kEk8Np?=
 =?us-ascii?Q?Albi/7zHwNzQsd3+XpcA6UIFvSNIvZasKR+JgzPe+AKKbIBuxCEH7aL6vvqV?=
 =?us-ascii?Q?I3cz791QXrCi/Sj1aWPKF71R42Z7gIu/E8XkjVHEKCVkw/+JOhFQ5s1wS6YF?=
 =?us-ascii?Q?JBZN/F+YFyomwiXo30sL0kMgXHHc/BXEwBeSK80K1nt+ktMqgBQYiMcASKtX?=
 =?us-ascii?Q?1U3+e+/iIRDbdzKzE7Rl0WUwekkQlOXgCgiz8QIwhaCaGalapLfW23LBIrrc?=
 =?us-ascii?Q?g1zaEA5PhWz/RBe81vyqpwqrY555cyB7cKTNhu+L5EsicU3b4WrkcI1GJVCT?=
 =?us-ascii?Q?A47ZvMynRTBEOwkmfYZFUZtNfhrceSkZYfYijpIdXXDXU2CdZxqlDYCyE27I?=
 =?us-ascii?Q?P7qCEZtQWN+uLVZk6EFnXkhDuRu7lti2PAcaA/y5Zll5/s2HIZVcPq+AkPGj?=
 =?us-ascii?Q?2Sgich8NcAamjfv5l6rq8QSkbsgsgAXeJdWLA90Ykao2lVpnSP93wDqyLuoY?=
 =?us-ascii?Q?3eoKkj2+OwI8qDyoIMofnRq46xOOUo/oyOHvCriMLIM0GSAorwmG5osaVa7z?=
 =?us-ascii?Q?g7Avv7f9U/VD+Si15WU+DxvOAAbXwJOoZbSWHepJnxcGAhNuZGgFgid2Jxar?=
 =?us-ascii?Q?4IEKgZ/ndFtdhRsm0r3F9GZxznR/n3Eh5jfsTygGzra97uFxc0qEIVKKDQUa?=
 =?us-ascii?Q?CiHWeHjmIB0rHq5vcuH64gK1A7uM+4dTgzrVeIRHwiccmehsJ/Qg6QrEXrlE?=
 =?us-ascii?Q?USoN9ggGHHfbcS5WhOD9vTRdbFPo95C6/ZCx0nHn7IoQ9UGif/d6uCi0WkIr?=
 =?us-ascii?Q?Ew+lPcIEI9quFN4jlGtF+nVKf+n33pNXlaLXRqpTsnzq4A7QFRBkK7B/KMV+?=
 =?us-ascii?Q?6pWnRo99uiu/PRZoynJhVL8mZ3aF4G55pUWRzg+q6EAwy2qSQj/yrHoXNclJ?=
 =?us-ascii?Q?mW4rW9Ob5ikGAFKa60DqGWQKL8hl7BPTx3SzVTi2CSNseJgM8CTbA3tNo/ws?=
 =?us-ascii?Q?Q9/6N2H+SPLzX2ojtIZU3MK1K64NZTOfstHaMGyoG5JYq4YOKmYJ4yFSc7Uf?=
 =?us-ascii?Q?mKMEj0+hJAXyBpuq+oC8AWvLHfgIjbB+u+dv+BbHD+1hiyi2reQ1Z85SXJej?=
 =?us-ascii?Q?edGWTwJ3USCh37iC7I4PRzd9Ei897rqJ+oN4SynxPyLjPPqSfQwUuRJtniB1?=
 =?us-ascii?Q?4yT8HznAgyYnQIqZUdDzoPvnrTtGe5KllPLEtiDdkhodD7Uwq6mfHd3YgLGi?=
 =?us-ascii?Q?nIncLw+2bR1hSIsc/Dmeoz2sXvp+Ii565rqhUyNToFQCMj8PER56V/TGqZJC?=
 =?us-ascii?Q?iuGt2xiNdnd/LYUAXSESUP8gFU0wfeCXRnruLRYLmcZTKaDsA12XFSqjQuZH?=
 =?us-ascii?Q?sA2I+sfgVhs3VY6thRqR1fTq7oo4+bWFeReu2MP+BEkBz9tJU2VT8xagcXZ/?=
 =?us-ascii?Q?VWTcLUNHPMs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jV4FFpT6omBwaKkgSz/y/aW2UmMYhyCo5U7StTiREhR6aHWsGY8D6Kt03C09?=
 =?us-ascii?Q?yg+xEkGTMlrRYXOrkD0h3G63Uj3Q5K+g4sCBjSOM2YywJvEq5ejkiXycOSLg?=
 =?us-ascii?Q?EseezV3RURobQoxyFCKvHNU+b49UqyzW8z5eYLutnsv/9Er4bY8OmREArie0?=
 =?us-ascii?Q?rA3SmSoppg0fjFgLP6LY+k+wiO7QAMKogQkKeiMGpNGyZd2mfoTCY9AIymxq?=
 =?us-ascii?Q?Oe9YKeUelIEHqJGiRBqe/zYz2Hbpy9uv12TmJd8B0WezeAD/oJgjrmyIrQkC?=
 =?us-ascii?Q?A1H1kXC2XXG9UjHQwKB0Xfr4AbaV14qvs9/3X8uysaGpAEOtSFL7Sb6htqsn?=
 =?us-ascii?Q?f38Bk/haMNgPwQKMRC8GHcXl/qBXDWay2RbO04LDr9cLwU4MeJn1UeOA2Go9?=
 =?us-ascii?Q?totY7YaHyBnFY8P5JBjp5sAhpbyo552axEqSA5UBJgEXMUv7wOxhxjiLCb7l?=
 =?us-ascii?Q?HuQVGzGb6owTydevuqZ434maPR04++sC6HWA0Ei2iOVu7qXg7y4AxebTC2Y1?=
 =?us-ascii?Q?myZAMEDJ6JjI1E337RwlRfMTPQiU2oqwUTjCmw3YMLyN1I4/vG2c/PqArrT3?=
 =?us-ascii?Q?y0oxu53EOg6Vn4hkXV6ghSwGkcnvCnSxzcRFSUKJXz62XQOKy4/bedgNW+Ph?=
 =?us-ascii?Q?IVnn2jZnHxxZ/NOU8QhiU4orLW6+Gk4ELN2twWRMPUbdlHslmlF9QlAvm0dt?=
 =?us-ascii?Q?XU7HV1y7IrSFL/RU6uav4tPRpmaWeBbL1yDezG/QqQAWhQ66KBQL1pORi5fv?=
 =?us-ascii?Q?N9fdQeCShUlPvljSwWV0n678UbH8nqckPzS6dQMWg1q12A2umgBk8v+87tyP?=
 =?us-ascii?Q?iuqXMXsvIY/YAWKfNmBTJH7i+eH8PpAS/qA45NFNcdoAWWFoN0zs/8PVq398?=
 =?us-ascii?Q?tjiK8mUJQ6VHGt2I+3i93RA+oDgemhEAA0uM76yoUArhwXHD5cOpUejqiLDX?=
 =?us-ascii?Q?fVCvX8ynsGn7pO5tCCrZ9bFlJ+J2J+w7rn13q5eIOHbw8fpAwchQC3the8D4?=
 =?us-ascii?Q?dKbjm7xkzKy2K7t2e70uck9wQfgVLAvnHZSOuGCtN/8Wa+VTKR4d0NDyFGrC?=
 =?us-ascii?Q?uSYfCnavBSfTnKNVdE3Mq2mmleqC/QvTJ+KQ04167vDrM37sBlg54Cspw4g+?=
 =?us-ascii?Q?n1UOsB9snnVmCYjllM6s913/7bjaFh3DL5h7ZYgheicuCp5gHQwiW/+zgPKl?=
 =?us-ascii?Q?Udqmq54WKhUprIu/96nHciNATVrXBmhnJRuIF6EIgjqK8UrpIi9u2hBv3OLn?=
 =?us-ascii?Q?1+l4KgTLGbr0xtcB45xKLNnIjhdx8GYnRckcHInyuRQ2X9O5hSotCVrJ76st?=
 =?us-ascii?Q?YKoPIPonoyYP1Wn2sqhjfmJxXasm2Hp9pVQR0Ec4eYVu5G701G6b6GCZnlFi?=
 =?us-ascii?Q?Xqzhzs9AUDWogqDBhdrmVAMSqnIdUiOlltU8KjDyFQ0Y9HxMFeyuPRqEpcwT?=
 =?us-ascii?Q?Axw8BrEiZQH1XKBC2cS5LzOtkFCVBaGsS8OpZTEasiKP/VFEpdW6eRVOCfL5?=
 =?us-ascii?Q?i9mfXXF01jZoD1e6zfN9MVenupQ2CqjdsHKkuTsNiQG2plrbTi9JKtSuYOnm?=
 =?us-ascii?Q?DaeIwHty5A7S6z6lMghc/Txl6ZXqK2r3KDO3AddGTR3F8q18zTG8kYDlLLFk?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KvdHnqbZhaOfvJxtdstgraazNpnzXq6/I1+xapCgUFPXakdWY1LSV/DdWuS4jPfGxRaKdpRAOBkfM1lzysVibpRKcP7eihztfNzbTIhdcCg3HwS20gN/SlnFQ1iLARiZiPwIHxAU2zFj7xvShmc64A3tpylS+oHWXpuxnba63/n/s31GA+qS0X0oi41igkkkdRiwoTJHnkiq6WUhJna380iKzGfjrzNkplhheELNV1ceh5HN9hCX2Kr76fxdlywTBvgvSeNQHgRxSEbvdslHWxnwq3WooBHz3JKmJrclH/QToEeq7sVNPjbUxnEIPGz8EhwxfjSCckwMiS7+3sg2IGf6Y3xrmt6lBGf8Y6UbPuO+prQp1vCS152jx+gyEbCU95heUXgXvWfZY+MgoMqZYHszTGQBcQYBH/Iev+PjjSR1fojCZ1mupHWmOUgnpXVavBv0rHGQN1bVvEXeGd90L8k0l4Jeify5yLk20nfuCjwl8mmCNZqVE0Sd6naVRQdzZHO3+uUjacPz8mEDQhvvHssSJA7MpgC20jv0FkFxc4MF6Yx8znW35xWY7qFXra/2oEuXInWWfMid8clKVhnpNtUG366YRAZKTNRQOReNyd0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9473bcf2-8937-4a95-5c88-08dd8a87419d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 21:12:48.4675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2JzqpjRLBgG9O34lHmNDgleGDb11pKujJnu5kA1QY+uw68M8Yr73J3rk9ORY0QwZwC/V/vYL916BUWcMgLPal5acM6QahSVSgmhJN2+ikc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4373
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505030196
X-Authority-Analysis: v=2.4 cv=OYaYDgTY c=1 sm=1 tr=0 ts=681686d4 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=xeFcnC5iRgFsLvszZ5sA:9 cc=ntf awl=host:14638
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE5NiBTYWx0ZWRfXwCu8Pirry3nS WiC+KeubVZ8WIaHpA9FdOPW6Kj7NcjcYFy513qP/UaOvUapLFtbUdsObP69Gdbd/kKzejsq6IxS Zcc59epUhgaw18+usZhDC17ebcUWrNZOSnsX0ngC2O4QKNCVvb0xcD0yPNtYnFMUgwIFGwjd9K0
 NFNjNkEzr2stP19vPFSw3VG26oWk+sMbO1uGO9fPJCeKeCesTxuaLrrGXH1+/QFTEv+NQQbnWdp c9wN5g1dYECNHsFQ5P4YzL0gggl/g9doUx4OGmujRSvW0QbJUGSGyPY1ICEEkxdEzSb7Eub6td7 CEuSRqqNhUgMA2cfUMfpniuIBq5NJ4rL8QO1Jvd5crhlpRygUrHzF5j+CBoPPWaTtw5FgcaVAV2
 hjfKLOhnoDSJcnYFdJb16mRoBrjR4P9GY0FPLyrkOzy3gdTJH6TAATbxKffKujzvV96k8ZWl
X-Proofpoint-ORIG-GUID: a3FUOPhZKb7b-jK0qG_rCcqyf-RKaJcB
X-Proofpoint-GUID: a3FUOPhZKb7b-jK0qG_rCcqyf-RKaJcB

When mremap() moves a mapping around in memory, it goes to great lengths to
avoid having to walk page tables as this is expensive and
time-consuming.

Rather, if the VMA was faulted (that is vma->anon_vma != NULL), the virtual
page offset stored in the VMA at vma->vm_pgoff will remain the same, as
well all the folio indexes pointed at the associated anon_vma object.

This means the VMA and page tables can simply be moved and this affects the
change (and if we can move page tables at a higher page table level, this
is even faster).

While this is efficient, it does lead to big problems with VMA merging - in
essence it causes faulted anonymous VMAs to not be mergeable under many
circumstances once moved.

This is limiting and leads to both a proliferation of unreclaimable,
unmovable kernel metadata (VMAs, anon_vma's, anon_vma_chain's) and has an
impact on further use of mremap(), which has a requirement that the VMA
moved (which can also be a partial range within a VMA) may span only a
single VMA.

This makes the mergeability or not of VMAs in effect a uAPI concern.

In some use cases, users may wish to accept the overhead of actually going
to the trouble of updating VMAs and folios to affect mremap() moves. Let's
provide them with the choice.

This patch add a new MREMAP_RELOCATE_ANON flag to do just that, which
attempts to perform such an operation. If it is unable to do so, it cleanly
falls back to the usual method.

It carefully takes the rmap locks such that at no time will a racing rmap
user encounter incorrect or missing VMAs.

It is also designed to interact cleanly with the existing mremap() error
fallback mechanism (inverting the remap should the page table move fail).

Also, if we could merge cleanly without such a change, we do so, avoiding
the overhead of the operation if it is not required.

In the instance that no merge may occur when the move is performed, we
still perform the folio and VMA updates to ensure that future mremap() or
mprotect() calls will result in merges.

In this implementation, we simply give up if we encounter large folios. A
subsequent commit will extend the functionality to allow for these cases.

We restrict this flag to purely anonymous memory only.

we separate out the vma_had_uncowed_parents() helper function for checking
in should_relocate_anon() and introduce a new function
vma_maybe_has_shared_anon_folios() which combines a check against this and
any forked child anon_vma's.

We carefully check for pinned folios in case a caller who holds a pin might
make assumptions about index, mapping fields which we are about to
manipulate.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/linux/rmap.h             |   4 +
 include/uapi/linux/mman.h        |   1 +
 mm/internal.h                    |   1 +
 mm/mremap.c                      | 403 +++++++++++++++++++++++++++++--
 mm/vma.c                         |  77 ++++--
 mm/vma.h                         |  36 ++-
 tools/testing/vma/vma.c          |   5 +-
 tools/testing/vma/vma_internal.h |  38 +++
 8 files changed, 520 insertions(+), 45 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index c4f4903b1088..6d2b3fbe2df0 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -147,6 +147,10 @@ static inline void anon_vma_unlock_read(struct anon_vma *anon_vma)
 	up_read(&anon_vma->root->rwsem);
 }
 
+static inline void anon_vma_assert_locked(const struct anon_vma *anon_vma)
+{
+	rwsem_assert_held(&anon_vma->root->rwsem);
+}
 
 /*
  * anon_vma helper functions.
diff --git a/include/uapi/linux/mman.h b/include/uapi/linux/mman.h
index e89d00528f2f..d0542f872e0c 100644
--- a/include/uapi/linux/mman.h
+++ b/include/uapi/linux/mman.h
@@ -9,6 +9,7 @@
 #define MREMAP_MAYMOVE		1
 #define MREMAP_FIXED		2
 #define MREMAP_DONTUNMAP	4
+#define MREMAP_RELOCATE_ANON	8
 
 #define OVERCOMMIT_GUESS		0
 #define OVERCOMMIT_ALWAYS		1
diff --git a/mm/internal.h b/mm/internal.h
index b3e011976f74..956fb6cd559a 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -47,6 +47,7 @@ struct folio_batch;
 struct pagetable_move_control {
 	struct vm_area_struct *old; /* Source VMA. */
 	struct vm_area_struct *new; /* Destination VMA. */
+	struct vm_area_struct *relocate_locked; /* VMA which is rmap locked. */
 	unsigned long old_addr; /* Address from which the move begins. */
 	unsigned long old_end; /* Exclusive address at which old range ends. */
 	unsigned long new_addr; /* Address to move page tables to. */
diff --git a/mm/mremap.c b/mm/mremap.c
index 7db9da609c84..35a984977f85 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -71,6 +71,15 @@ struct vma_remap_struct {
 	unsigned long charged;		/* If VM_ACCOUNT, # pages to account. */
 };
 
+/* Represents local PTE state. */
+struct pte_state {
+	unsigned long old_addr;
+	unsigned long new_addr;
+	unsigned long old_end;
+	pte_t *ptep;
+	spinlock_t *ptl;
+};
+
 static pud_t *get_old_pud(struct mm_struct *mm, unsigned long addr)
 {
 	pgd_t *pgd;
@@ -139,18 +148,50 @@ static pmd_t *alloc_new_pmd(struct mm_struct *mm, unsigned long addr)
 	return pmd;
 }
 
-static void take_rmap_locks(struct vm_area_struct *vma)
+/*
+ * Determine whether the old and new VMAs share the same anon_vma. If so, this
+ * has implications around locking and to avoid deadlock we need to tread
+ * carefully.
+ */
+static bool has_shared_anon_vma(struct pagetable_move_control *pmc)
+{
+	struct vm_area_struct *vma = pmc->old;
+	struct vm_area_struct *locked = pmc->relocate_locked;
+
+	if (!locked)
+		return false;
+
+	return vma->anon_vma->root == locked->anon_vma->root;
+}
+
+static void maybe_take_rmap_locks(struct pagetable_move_control *pmc)
 {
+	struct vm_area_struct *vma;
+	struct anon_vma *anon_vma;
+
+	if (!pmc->need_rmap_locks)
+		return;
+
+	vma = pmc->old;
+	anon_vma = vma->anon_vma;
 	if (vma->vm_file)
 		i_mmap_lock_write(vma->vm_file->f_mapping);
-	if (vma->anon_vma)
-		anon_vma_lock_write(vma->anon_vma);
+	if (anon_vma && !has_shared_anon_vma(pmc))
+		anon_vma_lock_write(anon_vma);
 }
 
-static void drop_rmap_locks(struct vm_area_struct *vma)
+static void maybe_drop_rmap_locks(struct pagetable_move_control *pmc)
 {
-	if (vma->anon_vma)
-		anon_vma_unlock_write(vma->anon_vma);
+	struct vm_area_struct *vma;
+	struct anon_vma *anon_vma;
+
+	if (!pmc->need_rmap_locks)
+		return;
+
+	vma = pmc->old;
+	anon_vma = vma->anon_vma;
+	if (anon_vma && !has_shared_anon_vma(pmc))
+		anon_vma_unlock_write(anon_vma);
 	if (vma->vm_file)
 		i_mmap_unlock_write(vma->vm_file->f_mapping);
 }
@@ -204,8 +245,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	 *   serialize access to individual ptes, but only rmap traversal
 	 *   order guarantees that we won't miss both the old and new ptes).
 	 */
-	if (pmc->need_rmap_locks)
-		take_rmap_locks(vma);
+	maybe_take_rmap_locks(pmc);
 
 	/*
 	 * We don't have to worry about the ordering of src and dst
@@ -278,8 +318,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	pte_unmap(new_pte - 1);
 	pte_unmap_unlock(old_pte - 1, old_ptl);
 out:
-	if (pmc->need_rmap_locks)
-		drop_rmap_locks(vma);
+	maybe_drop_rmap_locks(pmc);
 	return err;
 }
 
@@ -537,15 +576,14 @@ static __always_inline unsigned long get_extent(enum pgt_entry entry,
  * Should move_pgt_entry() acquire the rmap locks? This is either expressed in
  * the PMC, or overridden in the case of normal, larger page tables.
  */
-static bool should_take_rmap_locks(struct pagetable_move_control *pmc,
-				   enum pgt_entry entry)
+static bool should_take_rmap_locks(enum pgt_entry entry)
 {
 	switch (entry) {
 	case NORMAL_PMD:
 	case NORMAL_PUD:
 		return true;
 	default:
-		return pmc->need_rmap_locks;
+		return false;
 	}
 }
 
@@ -557,11 +595,15 @@ static bool move_pgt_entry(struct pagetable_move_control *pmc,
 			   enum pgt_entry entry, void *old_entry, void *new_entry)
 {
 	bool moved = false;
-	bool need_rmap_locks = should_take_rmap_locks(pmc, entry);
+	bool override_locks = false;
 
-	/* See comment in move_ptes() */
-	if (need_rmap_locks)
-		take_rmap_locks(pmc->old);
+	if (!pmc->need_rmap_locks && should_take_rmap_locks(entry)) {
+		override_locks = true;
+
+		pmc->need_rmap_locks = true;
+		/* See comment in move_ptes() */
+		maybe_take_rmap_locks(pmc);
+	}
 
 	switch (entry) {
 	case NORMAL_PMD:
@@ -585,8 +627,9 @@ static bool move_pgt_entry(struct pagetable_move_control *pmc,
 		break;
 	}
 
-	if (need_rmap_locks)
-		drop_rmap_locks(pmc->old);
+	maybe_drop_rmap_locks(pmc);
+	if (override_locks)
+		pmc->need_rmap_locks = false;
 
 	return moved;
 }
@@ -752,6 +795,209 @@ static unsigned long pmc_progress(struct pagetable_move_control *pmc)
 	return old_addr < orig_old_addr ? 0 : old_addr - orig_old_addr;
 }
 
+/*
+ * If the folio mapped at the specified pte entry can have its index and mapping
+ * relocated, then do so.
+ *
+ * Returns the number of pages we have traversed, or 0 if the operation failed.
+ */
+static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
+		struct pte_state *state, bool undo)
+{
+	struct folio *folio;
+	struct vm_area_struct *old, *new;
+	pgoff_t new_index;
+	pte_t pte;
+	unsigned long ret = 1;
+	unsigned long old_addr = state->old_addr;
+	unsigned long new_addr = state->new_addr;
+
+	old = pmc->old;
+	new = pmc->new;
+
+	pte = ptep_get(state->ptep);
+
+	/* Ensure we have truly got an anon folio. */
+	folio = vm_normal_folio(old, old_addr, pte);
+	if (!folio)
+		return ret;
+
+	folio_lock(folio);
+
+	/* No-op. */
+	if (!folio_test_anon(folio) || folio_test_ksm(folio))
+		goto out;
+
+	/*
+	 * This should never be the case as we have already checked to ensure
+	 * that the anon_vma is not forked, and we have just asserted that it is
+	 * anonymous.
+	 */
+	if (WARN_ON_ONCE(folio_maybe_mapped_shared(folio)))
+		goto out;
+	/* The above check should imply these. */
+	VM_WARN_ON_ONCE(folio_mapcount(folio) > folio_nr_pages(folio));
+	VM_WARN_ON_ONCE(!PageAnonExclusive(folio_page(folio, 0)));
+
+	/*
+	 * A pinned folio implies that it will be used for a duration longer
+	 * than that over which the mmap_lock is held, meaning that another part
+	 * of the kernel may be making use of this folio.
+	 *
+	 * Since we are about to manipulate index & mapping fields, we cannot
+	 * safely proceed because whatever has pinned this folio may then
+	 * incorrectly assume these do not change.
+	 */
+	if (folio_maybe_dma_pinned(folio))
+		goto out;
+
+	/*
+	 * This should not happen as we explicitly disallow this, but check
+	 * anyway.
+	 */
+	if (folio_test_large(folio)) {
+		ret = 0;
+		goto out;
+	}
+
+	if (!undo)
+		new_index = linear_page_index(new, new_addr);
+	else
+		new_index = linear_page_index(old, old_addr);
+
+	/*
+	 * The PTL should keep us safe from unmapping, and the fact the folio is
+	 * a PTE keeps the folio referenced.
+	 *
+	 * The mmap/VMA locks should keep us safe from fork and other processes.
+	 *
+	 * The rmap locks should keep us safe from anything happening to the
+	 * VMA/anon_vma.
+	 *
+	 * The folio lock should keep us safe from reclaim, migration, etc.
+	 */
+	folio_move_anon_rmap(folio, undo ? old : new);
+	WRITE_ONCE(folio->index, new_index);
+
+out:
+	folio_unlock(folio);
+	return ret;
+}
+
+static bool pte_done(struct pte_state *state)
+{
+	return state->old_addr >= state->old_end;
+}
+
+static void pte_next(struct pte_state *state, unsigned long nr_pages)
+{
+	state->old_addr += nr_pages * PAGE_SIZE;
+	state->new_addr += nr_pages * PAGE_SIZE;
+	state->ptep += nr_pages;
+}
+
+static bool relocate_anon_ptes(struct pagetable_move_control *pmc,
+		unsigned long extent, pmd_t *pmdp, bool undo)
+{
+	struct mm_struct *mm = current->mm;
+	struct pte_state state = {
+		.old_addr = pmc->old_addr,
+		.new_addr = pmc->new_addr,
+		.old_end = pmc->old_addr + extent,
+	};
+	pte_t *ptep_start;
+	bool ret;
+	unsigned long nr_pages;
+
+	ptep_start = pte_offset_map_lock(mm, pmdp, pmc->old_addr, &state.ptl);
+	/*
+	 * We prevent faults with mmap write lock, hold the rmap lock and should
+	 * not fail to obtain this lock. Just give up if we can't.
+	 */
+	if (!ptep_start)
+		return false;
+
+	state.ptep = ptep_start;
+	for (; !pte_done(&state); pte_next(&state, nr_pages)) {
+		pte_t pte = ptep_get(state.ptep);
+
+		if (pte_none(pte) || !pte_present(pte)) {
+			nr_pages = 1;
+			continue;
+		}
+
+		nr_pages = relocate_anon_pte(pmc, &state, undo);
+		if (!nr_pages) {
+			ret = false;
+			goto out;
+		}
+	}
+
+	ret = true;
+out:
+	pte_unmap_unlock(ptep_start, state.ptl);
+	return ret;
+}
+
+static bool __relocate_anon_folios(struct pagetable_move_control *pmc, bool undo)
+{
+	pud_t *pudp;
+	pmd_t *pmdp;
+	unsigned long extent;
+	struct mm_struct *mm = current->mm;
+
+	if (!pmc->len_in)
+		return true;
+
+	for (; !pmc_done(pmc); pmc_next(pmc, extent)) {
+		pmd_t pmd;
+		pud_t pud;
+
+		extent = get_extent(NORMAL_PUD, pmc);
+
+		pudp = get_old_pud(mm, pmc->old_addr);
+		if (!pudp)
+			continue;
+		pud = pudp_get(pudp);
+
+		if (pud_trans_huge(pud) || pud_devmap(pud))
+			return false;
+
+		extent = get_extent(NORMAL_PMD, pmc);
+		pmdp = get_old_pmd(mm, pmc->old_addr);
+		if (!pmdp)
+			continue;
+		pmd = pmdp_get(pmdp);
+
+		if (is_swap_pmd(pmd) || pmd_trans_huge(pmd) ||
+		    pmd_devmap(pmd))
+			return false;
+
+		if (pmd_none(pmd))
+			continue;
+
+		if (!relocate_anon_ptes(pmc, extent, pmdp, undo))
+			return false;
+	}
+
+	return true;
+}
+
+static bool relocate_anon_folios(struct pagetable_move_control *pmc, bool undo)
+{
+	unsigned long old_addr = pmc->old_addr;
+	unsigned long new_addr = pmc->new_addr;
+	bool ret;
+
+	ret = __relocate_anon_folios(pmc, undo);
+
+	/* Reset state ready for retry. */
+	pmc->old_addr = old_addr;
+	pmc->new_addr = new_addr;
+
+	return ret;
+}
+
 unsigned long move_page_tables(struct pagetable_move_control *pmc)
 {
 	unsigned long extent;
@@ -1132,6 +1378,67 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
 	}
 }
 
+/*
+ * Should we attempt to relocate anonymous folios to the location that the VMA
+ * is being moved to by updating index and mapping fields accordingly?
+ */
+static bool should_relocate_anon(struct vma_remap_struct *vrm,
+	struct pagetable_move_control *pmc)
+{
+	struct vm_area_struct *old = vrm->vma;
+
+	/* Currently we only do this if requested. */
+	if (!(vrm->flags & MREMAP_RELOCATE_ANON))
+		return false;
+
+	/* We can't deal with special or hugetlb mappings. */
+	if (old->vm_flags & (VM_SPECIAL | VM_HUGETLB))
+		return false;
+
+	/* We only support anonymous mappings. */
+	if (!vma_is_anonymous(old))
+		return false;
+
+	/* If no folios are mapped, then no need to attempt this. */
+	if (!old->anon_vma)
+		return false;
+
+	/* We don't allow relocation of non-exclusive folios. */
+	if (vma_maybe_has_shared_anon_folios(old))
+		return false;
+
+	/* Otherwise, we're good to go! */
+	return true;
+}
+
+static void lock_new_anon_vma(struct vm_area_struct *new_vma)
+{
+	/*
+	 * We have a new VMA to reassign folios to. We take a lock on
+	 * its anon_vma so reclaim doesn't fail to unmap mappings.
+	 *
+	 * We have acquired a VMA write lock by now (in vma_link()), so
+	 * we do not have to worry about racing faults.
+	 *
+	 * NOTE: we do NOT need to acquire an rmap lock on the old VMA,
+	 * as forks require an mmap write lock, which we hold.
+	 */
+	anon_vma_lock_write(new_vma->anon_vma);
+
+	/*
+	 * lockdep is unable to differentiate between the anon_vma lock we take
+	 * in the old VMA and the one we are taking here in the new VMA.
+	 *
+	 * In each instance where the old VMA might have its anon_vma
+	 * lock taken, we explicitly check to ensure they are not one
+	 * and the same, avoiding deadlock.
+	 *
+	 * Express this to lockdep through a subclass.
+	 */
+	lock_set_subclass(&new_vma->anon_vma->root->rwsem.dep_map, 1,
+			  _THIS_IP_);
+}
+
 /*
  * Copy vrm->vma over to vrm->new_addr possibly adjusting size as part of the
  * process. Additionally handle an error occurring on moving of page tables,
@@ -1151,9 +1458,11 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
 	struct vm_area_struct *new_vma;
 	int err = 0;
 	PAGETABLE_MOVE(pmc, NULL, NULL, vrm->addr, vrm->new_addr, vrm->old_len);
+	bool relocate_anon = should_relocate_anon(vrm, &pmc);
 
+again:
 	new_vma = copy_vma(&vma, vrm->new_addr, vrm->new_len, new_pgoff,
-			   &pmc.need_rmap_locks);
+			   &pmc.need_rmap_locks, &relocate_anon);
 	if (!new_vma) {
 		vrm_uncharge(vrm);
 		*new_vma_ptr = NULL;
@@ -1163,12 +1472,59 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
 	pmc.old = vma;
 	pmc.new = new_vma;
 
+	if (relocate_anon) {
+		lock_new_anon_vma(new_vma);
+		pmc.relocate_locked = new_vma;
+
+		if (!relocate_anon_folios(&pmc, /* undo= */false)) {
+			unsigned long start = new_vma->vm_start;
+			unsigned long size = new_vma->vm_end - start;
+
+			/* Undo if fails. */
+			relocate_anon_folios(&pmc, /* undo= */true);
+			vrm_stat_account(vrm, vrm->new_len);
+
+			anon_vma_unlock_write(new_vma->anon_vma);
+			pmc.relocate_locked = NULL;
+
+			do_munmap(current->mm, start, size, NULL);
+			relocate_anon = false;
+			goto again;
+		}
+	}
+
 	moved_len = move_page_tables(&pmc);
 	if (moved_len < vrm->old_len)
 		err = -ENOMEM;
 	else if (vma->vm_ops && vma->vm_ops->mremap)
 		err = vma->vm_ops->mremap(new_vma);
 
+	if (unlikely(err && relocate_anon)) {
+		relocate_anon_folios(&pmc, /* undo= */true);
+		anon_vma_unlock_write(new_vma->anon_vma);
+		pmc.relocate_locked = NULL;
+	} else if (relocate_anon /* && !err */) {
+		unsigned long addr = vrm->new_addr;
+		unsigned long end = addr + vrm->new_len;
+		VMA_ITERATOR(vmi, vma->vm_mm, addr);
+		VMG_VMA_STATE(vmg, &vmi, NULL, new_vma, addr, end);
+		struct vm_area_struct *merged;
+
+		/*
+		 * Now we have successfully copied page tables and set up
+		 * folios, we can safely drop the anon_vma lock.
+		 */
+		anon_vma_unlock_write(new_vma->anon_vma);
+		pmc.relocate_locked = NULL;
+
+		/* Let's try merge again... */
+		vmg.prev = vma_prev(&vmi);
+		vma_next(&vmi);
+		merged = vma_merge_existing_range(&vmg);
+		if (merged)
+			new_vma = merged;
+	}
+
 	if (unlikely(err)) {
 		PAGETABLE_MOVE(pmc_revert, new_vma, vma, vrm->new_addr,
 			       vrm->addr, moved_len);
@@ -1486,7 +1842,8 @@ static unsigned long check_mremap_params(struct vma_remap_struct *vrm)
 	unsigned long flags = vrm->flags;
 
 	/* Ensure no unexpected flag values. */
-	if (flags & ~(MREMAP_FIXED | MREMAP_MAYMOVE | MREMAP_DONTUNMAP))
+	if (flags & ~(MREMAP_FIXED | MREMAP_MAYMOVE | MREMAP_DONTUNMAP |
+		      MREMAP_RELOCATE_ANON))
 		return -EINVAL;
 
 	/* Start address must be page-aligned. */
@@ -1501,6 +1858,10 @@ static unsigned long check_mremap_params(struct vma_remap_struct *vrm)
 	if (!PAGE_ALIGN(vrm->new_len))
 		return -EINVAL;
 
+	/* We can't relocate without allowing a move. */
+	if ((flags & MREMAP_RELOCATE_ANON) && !(flags & MREMAP_MAYMOVE))
+		return -EINVAL;
+
 	/* Remainder of checks are for cases with specific new_addr. */
 	if (!vrm_implies_new_addr(vrm))
 		return 0;
diff --git a/mm/vma.c b/mm/vma.c
index 1f2634b29568..e79437fc09cd 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -57,22 +57,6 @@ struct mmap_state {
 		.state = VMA_MERGE_START,				\
 	}
 
-/*
- * If, at any point, the VMA had unCoW'd mappings from parents, it will maintain
- * more than one anon_vma_chain connecting it to more than one anon_vma. A merge
- * would mean a wider range of folios sharing the root anon_vma lock, and thus
- * potential lock contention, we do not wish to encourage merging such that this
- * scales to a problem.
- */
-static bool vma_had_uncowed_parents(struct vm_area_struct *vma)
-{
-	/*
-	 * The list_is_singular() test is to avoid merging VMA cloned from
-	 * parents. This can improve scalability caused by anon_vma lock.
-	 */
-	return vma && vma->anon_vma && !list_is_singular(&vma->anon_vma_chain);
-}
-
 static inline bool is_mergeable_vma(struct vma_merge_struct *vmg, bool merge_next)
 {
 	struct vm_area_struct *vma = merge_next ? vmg->next : vmg->prev;
@@ -783,8 +767,7 @@ static bool can_merge_remove_vma(struct vm_area_struct *vma)
  * - The caller must hold a WRITE lock on the mm_struct->mmap_lock.
  * - vmi must be positioned within [@vmg->middle->vm_start, @vmg->middle->vm_end).
  */
-static __must_check struct vm_area_struct *vma_merge_existing_range(
-		struct vma_merge_struct *vmg)
+struct vm_area_struct *vma_merge_existing_range(struct vma_merge_struct *vmg)
 {
 	struct vm_area_struct *middle = vmg->middle;
 	struct vm_area_struct *prev = vmg->prev;
@@ -1799,7 +1782,7 @@ int vma_link(struct mm_struct *mm, struct vm_area_struct *vma)
  */
 struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 	unsigned long addr, unsigned long len, pgoff_t pgoff,
-	bool *need_rmap_locks)
+	bool *need_rmap_locks, bool *relocate_anon)
 {
 	struct vm_area_struct *vma = *vmap;
 	unsigned long vma_start = vma->vm_start;
@@ -1825,7 +1808,19 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 	vmg.middle = NULL; /* New VMA range. */
 	vmg.pgoff = pgoff;
 	vmg.next = vma_iter_next_rewind(&vmi, NULL);
+
 	new_vma = vma_merge_new_range(&vmg);
+	if (*relocate_anon) {
+		/*
+		 * If merge succeeds, no need to relocate. Otherwise, reset
+		 * pgoff for newly established VMA which we will relocate folios
+		 * to.
+		 */
+		if (new_vma)
+			*relocate_anon = false;
+		else
+			pgoff = addr >> PAGE_SHIFT;
+	}
 
 	if (new_vma) {
 		/*
@@ -1856,7 +1851,9 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 		vma_set_range(new_vma, addr, addr + len, pgoff);
 		if (vma_dup_policy(vma, new_vma))
 			goto out_free_vma;
-		if (anon_vma_clone(new_vma, vma))
+		if (*relocate_anon)
+			new_vma->anon_vma = NULL;
+		else if (anon_vma_clone(new_vma, vma))
 			goto out_free_mempol;
 		if (new_vma->vm_file)
 			get_file(new_vma->vm_file);
@@ -1864,6 +1861,21 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 			new_vma->vm_ops->open(new_vma);
 		if (vma_link(mm, new_vma))
 			goto out_vma_link;
+		/*
+		 * If we're attempting to relocate anonymous VMAs, we
+		 * don't want to reuse an anon_vma as set by
+		 * vm_area_dup(), or copy anon_vma_chain or anything
+		 * like this.
+		 */
+		if (*relocate_anon && __anon_vma_prepare(new_vma)) {
+			/*
+			 * We have already linked this VMA, so we must now unmap
+			 * it to unwind this. This is best effort.
+			 */
+			do_munmap(mm, addr, len, NULL);
+			return NULL;
+		}
+
 		*need_rmap_locks = false;
 	}
 	return new_vma;
@@ -3053,7 +3065,6 @@ int __vm_munmap(unsigned long start, size_t len, bool unlock)
 	return ret;
 }
 
-
 /* Insert vm structure into process list sorted by address
  * and into the inode's i_mmap tree.  If vm_file is non-NULL
  * then i_mmap_rwsem is taken here.
@@ -3095,3 +3106,27 @@ int insert_vm_struct(struct mm_struct *mm, struct vm_area_struct *vma)
 
 	return 0;
 }
+bool vma_maybe_has_shared_anon_folios(struct vm_area_struct *vma)
+{
+	struct anon_vma *anon_vma = vma->anon_vma;
+	unsigned long expected_children;
+
+	/* Trivially fine. */
+	if (!anon_vma)
+		return false;
+
+	/* Currently or previously shares unCoW'd memory with parent(s). */
+	if (vma_had_uncowed_parents(vma))
+		return true;
+
+	/* mmap lock is sufficient as it would prevent num_children changing. */
+	if (!rwsem_is_locked(&vma->vm_mm->mmap_lock))
+		anon_vma_assert_locked(anon_vma);
+
+	expected_children = 0;
+	/* The root anon_vma is self-parented. */
+	if (anon_vma == anon_vma->root)
+		expected_children++;
+
+	return anon_vma->num_children > expected_children;
+}
diff --git a/mm/vma.h b/mm/vma.h
index 9a8af9be29a8..382b936e620a 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -267,6 +267,9 @@ __must_check struct vm_area_struct
 __must_check struct vm_area_struct
 *vma_merge_new_range(struct vma_merge_struct *vmg);
 
+__must_check struct vm_area_struct
+*vma_merge_existing_range(struct vma_merge_struct *vmg);
+
 __must_check struct vm_area_struct
 *vma_merge_extend(struct vma_iterator *vmi,
 		  struct vm_area_struct *vma,
@@ -287,7 +290,7 @@ int vma_link(struct mm_struct *mm, struct vm_area_struct *vma);
 
 struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 	unsigned long addr, unsigned long len, pgoff_t pgoff,
-	bool *need_rmap_locks);
+	bool *need_rmap_locks, bool *relocate_anon);
 
 struct anon_vma *find_mergeable_anon_vma(struct vm_area_struct *vma);
 
@@ -505,6 +508,37 @@ struct vm_area_struct *vma_iter_next_rewind(struct vma_iterator *vmi,
 	return next;
 }
 
+/*
+ * Is this VMA either the parent of forked processes or the child of a forking
+ * process which may possess an unCOW'd reference to a shared folio?
+ */
+bool vma_maybe_has_shared_anon_folios(struct vm_area_struct *vma);
+
+/*
+ * If, at any point, the VMA had unCoW'd mappings from parents, it will maintain
+ * more than one anon_vma_chain connecting it to more than one anon_vma. A merge
+ * would mean a wider range of folios sharing the root anon_vma lock, and thus
+ * potential lock contention, we do not wish to encourage merging such that this
+ * scales to a problem.
+ *
+ * Assumes VMA is locked.
+ */
+static inline bool vma_had_uncowed_parents(struct vm_area_struct *vma)
+{
+	/*
+	 * The list_is_singular() test is to avoid merging VMA cloned from
+	 * parents. This can improve scalability caused by anon_vma lock.
+	 */
+	return vma && vma->anon_vma && !list_is_singular(&vma->anon_vma_chain);
+}
+
+/*
+ * If, at any point, folios mapped by the VMA had unCoW'd mappings potentially
+ * present in child processes forked from this one, then the underlying mapped
+ * folios may be non-exclusively mapped.
+ */
+bool vma_had_uncowed_children(struct vm_area_struct *vma);
+
 #ifdef CONFIG_64BIT
 
 static inline bool vma_is_sealed(struct vm_area_struct *vma)
diff --git a/tools/testing/vma/vma.c b/tools/testing/vma/vma.c
index 2be7597a2ac2..238acd4e20fd 100644
--- a/tools/testing/vma/vma.c
+++ b/tools/testing/vma/vma.c
@@ -1551,13 +1551,14 @@ static bool test_copy_vma(void)
 	unsigned long flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
 	struct mm_struct mm = {};
 	bool need_locks = false;
+	bool relocate_anon = false;
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vm_area_struct *vma, *vma_new, *vma_next;
 
 	/* Move backwards and do not merge. */
 
 	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, flags);
-	vma_new = copy_vma(&vma, 0, 0x2000, 0, &need_locks);
+	vma_new = copy_vma(&vma, 0, 0x2000, 0, &need_locks, &relocate_anon);
 	ASSERT_NE(vma_new, vma);
 	ASSERT_EQ(vma_new->vm_start, 0);
 	ASSERT_EQ(vma_new->vm_end, 0x2000);
@@ -1570,7 +1571,7 @@ static bool test_copy_vma(void)
 
 	vma = alloc_and_link_vma(&mm, 0, 0x2000, 0, flags);
 	vma_next = alloc_and_link_vma(&mm, 0x6000, 0x8000, 6, flags);
-	vma_new = copy_vma(&vma, 0x4000, 0x2000, 4, &need_locks);
+	vma_new = copy_vma(&vma, 0x4000, 0x2000, 4, &need_locks, &relocate_anon);
 	vma_assert_attached(vma_new);
 
 	ASSERT_EQ(vma_new, vma_next);
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index 198abe66de5a..b93ce68faaef 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -26,6 +26,7 @@
 #include <linux/mm.h>
 #include <linux/rbtree.h>
 #include <linux/refcount.h>
+#include <linux/rwsem.h>
 
 extern unsigned long stack_guard_gap;
 #ifdef CONFIG_MMU
@@ -196,6 +197,8 @@ struct anon_vma {
 	struct anon_vma *root;
 	struct rb_root_cached rb_root;
 
+	unsigned long num_children;
+
 	/* Test fields. */
 	bool was_cloned;
 	bool was_unlinked;
@@ -251,6 +254,8 @@ struct mm_struct {
 	unsigned long def_flags;
 
 	unsigned long flags; /* Must use atomic bitops to access */
+
+	struct rw_semaphore mmap_lock;
 };
 
 struct file {
@@ -1372,6 +1377,17 @@ static inline int ksm_execve(struct mm_struct *mm)
 	return 0;
 }
 
+static int do_munmap(struct mm_struct *mm, unsigned long start, size_t len,
+		struct list_head *uf)
+{
+	(void)mm;
+	(void)start;
+	(void)len;
+	(void)uf;
+
+	return 0;
+}
+
 static inline void ksm_exit(struct mm_struct *mm)
 {
 	(void)mm;
@@ -1405,4 +1421,26 @@ static inline void free_anon_vma_name(struct vm_area_struct *vma)
 	(void)vma;
 }
 
+static inline int rwsem_is_locked(struct rw_semaphore *sem)
+{
+	(void)sem;
+
+	return 0;
+}
+
+static inline void anon_vma_lock_read(struct anon_vma *anon_vma)
+{
+	(void)anon_vma;
+}
+
+static inline void anon_vma_unlock_read(struct anon_vma *anon_vma)
+{
+	(void)anon_vma;
+}
+
+static inline void anon_vma_assert_locked(const struct anon_vma *anon_vma)
+{
+	(void)anon_vma;
+}
+
 #endif	/* __MM_VMA_INTERNAL_H */
-- 
2.49.0

