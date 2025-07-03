Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2101.outbound.protection.outlook.com [40.107.94.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1E8226CF8;
	Thu,  3 Jul 2025 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535800; cv=fail; b=N0q7x1ocYSAja+Xw6yMd2qdPb1U12PGL2I2mHMn1y67zs904/YAgnOFXZn5Bkf8SYSzWILo0IoR2fNWl8mvGDlOaiEv7FiFMzf1PBiN7hGNeQkDWBxCIyKvDc2zrQYomG00K8dauqE+LmxvPTrCUOIB02MMSRMdpSGoMzWDq/sE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535800; c=relaxed/simple;
	bh=u+P12595LtoSpHcAdngy29FNyi76dHN4zNlA+8WituE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=rn/K1U8kHMF0cEKAoEQfgnVPk74etfk3H0S/m7K2h+nSE5tH9htM5xoLTMaelOL6zqC8DtZeO2G+BmhG6KZo1sEJ5qoSU/sf+NGlXU9hL3Yti2c/1/szGuPvgtzqFhkLx7dwF4SwNRQ2KDP6cBVBxt+HPYVTjOf4Z+DflEy2DK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=ZfnaDYBJ; arc=fail smtp.client-ip=40.107.94.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="ZfnaDYBJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYbAal3/uvykSQE101Zx76fndhbAw371LTiSbwqUDiDRGeqH9kOOGclSCLKr8OA8Zi6YKnpOJWodNkFpZVSW549mTUq8T5VJ+UhBBa4EPbVr73HkUmZMxshs7tMqjoAEztSURIhfsjYf+Dyc5fatr3dcK9TOIYLw1btWmKm+ureS76rXhaWvVULyks+ijyT6oIrPFsKB47Ic7myY1H60O+4zQHSBEkTdvv22PjcqaP2C7pYW1rHsn1KgL4ZPQMFWXB+tSMsMqOD2CGRLyscQPJ0jjCMtK6C8TF65Qd91NwOHYYRCqCIEM4cPAdN28xBiYiquuTF+bHsa77hhDgXdgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWLQc5Mrwb0OR3LFvzLPFao73kDkHN5L2lcn0F3eak0=;
 b=tElogUOiek7MdRDg3HP5XcQp0hlOqwqi9xm1ecs8rVnIk7GoHIMDtmyZGFjSSRlMBAPLOJ48/XLxZivH7wmTrWKoF8WFeAKTA9affjNGSbNVLIKc1X+MlpeIk5LoFcgIMk1c6XilKS5P9IyJDXUhs5DQWfoi0zZ9Dru5j+JzpNG0p8Md35cKiUT2GzzMWUpBYHBAoPuEQZJoYmiJFeDJr/F4p8WHIREJ44IZOYS/tb1NiruZ1jq+CMrHLc7gteH+PwY3SV0HEtrHWJxvZ9Y2niqDU+RDr7NyxP5G3vAhNfGNAhPp4LQhlccrcldQqXU2iIhY2wsMmN42xo/CrBAiEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWLQc5Mrwb0OR3LFvzLPFao73kDkHN5L2lcn0F3eak0=;
 b=ZfnaDYBJU6dViO06cYjkN8D5oVl+hwO3DyjrUh+4u7ljpH1syMRpwOzVCtturR6ccMx0+QPs64JROSR51RGn2GDwTFYs5VTM4fzEiMzd93L/ZW1HPvMc42vGLpIMtC/V4paKE6F9MIK0OygHNyrfg75U4nhfffcfuvXfNaYaBq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 SJ0PR01MB6399.prod.exchangelabs.com (2603:10b6:a03:298::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Thu, 3 Jul 2025 09:43:14 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%6]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 09:43:14 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net
Cc: patches@amperecomputing.com,
	cl@linux.com,
	yang@os.amperecomputing.com,
	akpm@linux-foundation.org,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	Neeraj.Upadhyay@amd.com,
	bp@alien8.de,
	ardb@kernel.org,
	anshuman.khandual@arm.com,
	suzuki.poulose@arm.com,
	gshan@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rdunlap@infradead.org,
	Huang Shijie <shijie@os.amperecomputing.com>
Subject: [PATCH V6 0/2] arm64: refactor the rodata=xxx
Date: Thu,  3 Jul 2025 17:42:10 +0800
Message-Id: <20250703094212.20294-1-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|SJ0PR01MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: abe94ddd-a441-489f-25da-08ddba1607af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nj+otaVQYRY5DoNaySOqr6v6vfFHoqqzysAbJPju4w+ihKAZhLkbKd+gBPou?=
 =?us-ascii?Q?KWabTZZtrFiso8jn+q047XREwvbPdZXhjHHNdugwukurQoG+cylB5jyXx1xh?=
 =?us-ascii?Q?JViAnn5+ACowuDhcDI81jteeq+cV2tWTTSf4WhBzwMs7GpDk3c6Aue0fNuRP?=
 =?us-ascii?Q?EeerkIU34x/U7H0/hTNSEkJczglkZUZyvfLq5jkCm4YYFcfMMWmopFgrH05V?=
 =?us-ascii?Q?eVKi3LEo2S0RqVHogDHEOCtgTELfS3IJjoW5IivPQ/bviUpBFmOm0nK6U4sH?=
 =?us-ascii?Q?Epu3C0xtPRiJys69vs7pUXVTK2N9LOQMZmPtXWeh7FYHRvwdfaqAMuhndpBF?=
 =?us-ascii?Q?ihY7EA3uTmRvFaw0qgLSusvkTGCOMF25BzXw7bXSmnzXdP9KS3kfPWh+zNOS?=
 =?us-ascii?Q?FBOTNVQ/BKMutBkRbxchfgxwMzzD5X4V+MFrT8iBgqP+QqU9JVom/t2OMvRe?=
 =?us-ascii?Q?C/qia5vujJN+61Bo1EUkBd7jhpu3hMpavFP5tsl6RZfzGo9DOyBzW8eBw/oC?=
 =?us-ascii?Q?Ftj7hNSFhIyn5AQD60CXgztdEDhw975qatbHb9mrhXyqLdf3+imP3c095rJz?=
 =?us-ascii?Q?r2/s3Fsif+2weyAOaoWNKn/WxyPZ6MtQqHO7ny/5yKhv25pP88LKeFpGZIrr?=
 =?us-ascii?Q?Hq81a1cOYz+d6/SlZzWI0vaGYWjsPqJrEfvy3Szfv4k3T1oJeq6yUYHnxJyb?=
 =?us-ascii?Q?yPS/85lpgy28wAr26s5EZq6t8PoU+plH4zXHpJ7eD1pgUA08BiIlI3pI0xnk?=
 =?us-ascii?Q?cKHzpqJ671XkUEBOe+s15UVpRQecm/AzXM9iE2RoOGo1f4gjf9irZZuX4ER+?=
 =?us-ascii?Q?5yWSvGBQ/nqfVJLUGMCJTPQ1ul8xIO5sUjwX7XKOyP0laWPrb8JSe7byNdCh?=
 =?us-ascii?Q?jXCFCf54lemRa6CAXRZ+03U7qUF8N+Pc6JKGam0PGNXDhyYAZcocofBYHItL?=
 =?us-ascii?Q?MjvNFvq0tNZkEnUjPppRV9uYEkjLtC1VJQWCq4YXwdAVot4qK9Dv5wfvU2DM?=
 =?us-ascii?Q?xMkoQYhP3by/FM/5pgfRggIRb8zSf8su6tSjdb4oxeBOT+HN99II0I0kyPXY?=
 =?us-ascii?Q?Lev2Id5NHNGAypsvtntI/Cft8Q3HaAnk0zuAFuk2y9DY4iYnzy9+Swn/01eY?=
 =?us-ascii?Q?BjTIbT9QoiBGJA06S532X5LBqD6twVkzeabGaIz/sboMev8TXrcvzyeZOvHb?=
 =?us-ascii?Q?C6cV48gflNXv2ZyMQi22Cawir+/WlGyOM9Ya4V3NEs8+sqLqy3O2qHAq3vK+?=
 =?us-ascii?Q?XBc04PaMpHTT2Xe0+4YVCxcU+HGdIuVvohhwu01sS8YmtnuxZhpRndy+r6/1?=
 =?us-ascii?Q?PDjG4sWAYTmND5cD+FmesL+zo2IjDVckmDPx02qyWRwg7opYdTfS4mVdj5Wm?=
 =?us-ascii?Q?tIG3LyPLznjdLQRv9aHUUK0S8NcUJSF35nReJAkOQXJsgfYVYvaFF5mqgTzz?=
 =?us-ascii?Q?gbmQHJ+LlAtXevCQ2yaKWgzsgjGxasDuZwvsYSy49hqvcChQmvBGGjwPgt0g?=
 =?us-ascii?Q?38hGN7fYuwBPFAY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zLE56qW3D1/T5mmPzeAPo3ySu5C76/HEjltGJCXTBFeLOCZPXk9uQyfjuxfp?=
 =?us-ascii?Q?KzCKKaY/cOsSHklG42atg2FPlIyhWfPjWXSp4r7jmYO66R+SO66Auq0YYeqg?=
 =?us-ascii?Q?kSooI3JOmJVACooeahjb+3d8M5anjPgrnQWrjEeGoZCg5pQbH5TlGvCoK2xx?=
 =?us-ascii?Q?EGNa3SSC63vNnLkCQN81N4BxdECQTghWk0OubV9BgsfdgdjzUUic8JyEkCkC?=
 =?us-ascii?Q?MzgK96N16khgevEr2C0DMu/gsIeL68+bbGrDP5CocoMvDTN2a4GM6aIHTyXs?=
 =?us-ascii?Q?KEGQFSFiV3IsUnJhcg5YgO6eAsyrwbymfcDVvfVwNgnJoQNOYpUSsVp3kwLR?=
 =?us-ascii?Q?z7idx1VY9S413LuPW5o4+WOoJFTkv6++vHABwS1ZmVibnxpTGsIUzKP4v6gH?=
 =?us-ascii?Q?u5131+Dpz+iRLetxRnrMlolXbGv0vvq3a93UksHjYA0NcyJpe75vGJCvIYaJ?=
 =?us-ascii?Q?PjVfzl0dGfeMmJL29WknZ8L7k77QOehEmNhZGP2VZqnDiszFI+w18e+6PxnK?=
 =?us-ascii?Q?n/ooDh0OLjblAcS/lnfWM6RnmbXAhp4NQ29UBe15M6vMLryhpoYQHTW6r9bm?=
 =?us-ascii?Q?78j1ueXoBAiHux+mDt3NIN4QOdAF3kY8MGu6MfnqAFAF5rD0WY9o3pS66dRY?=
 =?us-ascii?Q?5P6sL1jVWzGAV4dx4Ut149Ita5E5VSW5xBQH8oasN+k8526Wu10UjbT8C+Hm?=
 =?us-ascii?Q?P0KXUd/IC/SgyOMT5cOhQhfssjLWzcZ5TmQ5nduedwKfPLVClP4g0Q016AnS?=
 =?us-ascii?Q?mN60WTEoAmVwCHCFvh0vU0ea9mA31kkSFGa/tElnnJD8Cp9CniU4amOv+t9S?=
 =?us-ascii?Q?qQKWg/MZenTnvXpOpjCFAzNjmkMMMd7cG4jB2lAQAh6Fa7GOlA7HzObXZe/5?=
 =?us-ascii?Q?4FHG/KDgqe6jJz+MNHCcp6eh1TD2qRxmZLopvmUQSAI2/wReNVpCWepiv71k?=
 =?us-ascii?Q?rP5RWja2+0cbl1BHnMLDg7wFVgBHrbe5VdeQNhgwaXKRsCPlJqq6j9CwGknd?=
 =?us-ascii?Q?VSADqwLN1vc3Z6eWOJ2PjtdGPUx3zApAPIXCmYBmPzg8GWCLYqKGPIORFisr?=
 =?us-ascii?Q?LmVMktWqgCnHtvGMhoeNdCBaO5iv483r+L+TYGYJ2Bjdqnywj98ITnX2+DIr?=
 =?us-ascii?Q?Qv5gbbiWqS+lbu8rxcSXJ2qQKlYVRPoYLrBiZowSEAFd6iMyEFA6pcxFH90H?=
 =?us-ascii?Q?vAlerJNs0nFU9Eq0xAwHZBG/H5zHQqT3g0xVCayGHaomgf9uJWWk7qfE4tS/?=
 =?us-ascii?Q?Mkv0WLk8t9u4PEY+/rcL26gpQcqso8s6iFSgJnZpotBYHsgL3wHv99/FBg83?=
 =?us-ascii?Q?qKk3XC6yjzHhnS0ByXAHQCJKHxcDbeyoPpM7r3LawyUTaMqivJRXNAQIP7gr?=
 =?us-ascii?Q?UAc4SsYKtB7uA4B5dy3tZ/rMCAD+RXS+MqS0Ao8oxpz5vnfXJ2LR4ZiS36cv?=
 =?us-ascii?Q?52axaxMbe6wi+lHSuOpSORZQx1UVousvK1+CYPcQWdldXoftEt/9F7uYdVXj?=
 =?us-ascii?Q?px36tb9Tbq+WgkPpgrERlHJf7eqlVZ2U10eySnb5rxNkO6+dTewJnwlfFxr5?=
 =?us-ascii?Q?78ZKQmdPjgaWq7Ri9FNoriGl8jPMMBWzb/0vbtnU2s1/oqnXIK9fgd95quYy?=
 =?us-ascii?Q?M0TmZGJU0/qLGaas8hK7o14=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe94ddd-a441-489f-25da-08ddba1607af
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 09:43:14.1683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5go613+isnX1meKoZpJBqMY/rRMjBKLYgQNYMItz/VdXxuHzrUtNZr1YN+3uXAcLsiylcoFpVdej6nmxNmmX/54qpMWMEHwAdHSrMueraFbsL8bQnB5PuiOS7d+LpiWT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6399

From Documentation/admin-guide/kernel-parameters.txt, we know that:
 rodata=	[KNL,EARLY]
	on	Mark read-only kernel memory as read-only (default).
	off	Leave read-only kernel memory writable for debugging.
	full	Mark read-only kernel memory and aliases as read-only
		[arm64]

So the "rodata=on" is the default.

But the current code does not follow the document, it makes "rodata=full"
as the default.

This patch set follows Anshuman Khandual's suggetions.
It makes the "rodata=on" as the default, and removes
the CONFIG_RODATA_FULL_DEFAULT_ENABLED.

v6:
  Fix a small issue pointed by Randy Dunlap.

v5:
  Rebase this patch set with linux-next20250627
  https://lists.infradead.org/pipermail/linux-arm-kernel/2025-June/1040297.html

v4:
  Follows Anshuman Khandual/Ard Biesheuvel's suggetions:
  - Change commit message format.
  - Change the titile name.
  - others
  https://lists.infradead.org/pipermail/linux-arm-kernel/2024-December/985629.html

v3:
  Follows Anshuman Khandual's suggetions:
  - Merge patch 1 and patch 3 into one patch.
  - Remove patch 4
  - update comments and document.
   https://lists.infradead.org/pipermail/linux-arm-kernel/2024-December/984344.html

v2:
  Follows Will's suggetions.
  Add a new file fine-tuning-tips.rst for the expert users.
   https://lists.infradead.org/pipermail/linux-arm-kernel/2024-November/981190.html

v1:
   https://lists.infradead.org/pipermail/linux-arm-kernel/2024-October/971415.html


Huang Shijie (2):
  arm64: refactor the rodata=xxx
  arm64/Kconfig: Remove CONFIG_RODATA_FULL_DEFAULT_ENABLED

 .../admin-guide/kernel-parameters.txt         |  2 +-
 arch/arm64/Kconfig                            | 14 ----------
 arch/arm64/include/asm/setup.h                | 28 +++++++++++++++++--
 arch/arm64/mm/pageattr.c                      |  2 +-
 4 files changed, 28 insertions(+), 18 deletions(-)

-- 
2.40.1

