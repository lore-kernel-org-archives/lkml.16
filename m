Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9023E2F7CE0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619059; cv=fail; b=FIgvKzCQWChB1nR+LuVmTq6nnnBfemIh7Pg9y5Hv3Xb0kujS+vlC4YnkxmKKsayqSJ+KNM1NDxQyouVMrtEfAT3nRMenU/GeXx4CETr4kbwaulFA3R+dwOvPieeh0cj5wy+7VgOxRuiOonGvwriuUR8/ED+EDRCnjn1MvrVKDSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619059; c=relaxed/simple;
	bh=VOcrj9i1D0T518hHqIOT0lnFT6sMILn+FUt5Owcje4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SsTfPXgwFDXhbpFa4dVEHbK46wESoQGwUVPqWTuctpJbP9GTKX/n+xYX22watU0Qy5baZASBtDIOh2U2KR3ZS0UcC0z6kjNbg9lbmVYxPrNDPhHEQZ9NjYk7Kgorog2MGQfTkReWWKoaxB+Mkc8CNrAQpmbPeNil8AeDhogCvJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=QtzrUBZM; arc=fail smtp.client-ip=40.107.94.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="QtzrUBZM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEcFMGPkiKPUPF701hLGyG/mQL5ekrtApmpDGEBlFBKcYRullBrI2fcvXfMunUG8E/ZhKQvxPKEaBXebP6GwGNzhC1XiwwPokegFfbVLtH8Z2hHYvSlNWgpfvRnGDdwUS/6G5Zw7G4UIkV/RBqDddgg9Gx+77X3fz8Oqh93KvCepxX87c7EkzC2L/8+ZTmBBdUUllMDll4jZLVBqwrtCms+hkZgn8jIXoMOWEKHK5tzwn2VpIOYHIhNWCnikUmXSQ6bdf2bihNy94mjjWgPpjRGx3YeDxy2O1+sNszX3/+j2mEKYD5ffyDIGMYHJKNfPstU1IRjTLUSXgKf9mBrC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuaVkRO/T3Q38j9wMeOYS9lJTL088DFPC6C+SbvqzzA=;
 b=BWAQMOTcx9W0NKe0wiPCdy3qL3aZkVp+x5sSAv2UZOcp/A9TdcQiU6x0dNowdysmK3+qOuBAmyQJfxH2hJHAVXNzDex4NzcoWlHDg/l/Fge0c3i9FlYeJMPOUo8j4wiIreeunNKEJRKCnTYew9emEetAzC/9v3umfStuo1z4wM5tu5Q0RMZoYmOSjYOWr7TfDgZ0+n5tL0LBoUG9HzJbTLiqxYdVAKzz8w6hLWaFUy+NA0XOd07O47XrqX9kkrA+YSstlbQYjVxn0UvgLH5WX3ts6eaCr73MhqDDEiOrt2ri7L3rlVAdIdQk99ozlda6O8D2dz/jieBdStSlASk/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuaVkRO/T3Q38j9wMeOYS9lJTL088DFPC6C+SbvqzzA=;
 b=QtzrUBZMLCjOS54oD2YIQiqWPdW1Vruxz/9uAg/AmJU/GidQncLGdLGJYrLl3+MHAwf2WMlp+KVFwRw1AI/pBf7SV5p23+A5jNiRmt5bXl/yskBmlnkuCHPc+0IBWfEwIBX4xcTcO13X/2HRCb9x0lSy3GQfbMXFSqzdTgHpjKxi81u1/0qpWwTbl+cnxrUQ+4Ht7lnymTXvBI2g40aS8E2o2j3Yn92L1orvrxdaWznN4Uo+j8cclOOQaoOYXyZcJaQnmQqrb+YXlBmHMKSdTeSBTZ6LYim0mC7RcDs1R4mLIXilrFhGXpykpY36fQB45vg5EUjVl1mze0YvAGaoaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SA1PR03MB7099.namprd03.prod.outlook.com (2603:10b6:806:330::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 08:50:55 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 08:50:55 +0000
From: adrianhoyin.ng@altera.com
To: maz@kernel.org,
	tglx@linutronix.de,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2 0/1] irqchip/gic-v3: Add Altera Agilex5 address bus
Date: Fri,  4 Jul 2025 16:49:49 +0800
Message-ID: <cover.1751618484.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0044.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::13)
 To DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SA1PR03MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d98d866-0b0b-44b6-31da-08ddbad7e30c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BKUP2tAFTSXZF70fomkNxBb2D2T5UCFwUZhAPpwgXkrBaKDkpgLn3frVWIxD?=
 =?us-ascii?Q?JCC2ToirsFV834SLHLr2DS2Xo4So2eBJ0B+TBfsVVH+BfN8paUu91piuzpgb?=
 =?us-ascii?Q?oc4m2SVdpctEXA6chSU7AwzTt1q1gj1Av8BtfYZJZylHadTMu385hRG/ZYdG?=
 =?us-ascii?Q?E2Mo9H1g+Xo+y+DQCM0en+/6UZ8HUgfOb017RqveLmmCf8JrzrY0mvcM72J7?=
 =?us-ascii?Q?Y/PSrMhjbTMDQfxggiRJsctAPEqoGt/zyU/aOf0FacjAvPSHgHuA+o+zgaaS?=
 =?us-ascii?Q?alol8zng9qJaMJuLHIrbto1YhAZXxU3vuKfNhfefLiNU+LVMoCpjjDetLl2b?=
 =?us-ascii?Q?VCRqFK7CRyUQToHAoCyP0wlWy+IPU6E3uRAXxdJ9cKxXep9BB3Rf3kt/YX02?=
 =?us-ascii?Q?AlcUQ1pN9FjS04piNmxG2oIzsU7GLM6UhlqmgfPeQnEt/bqGvs2KtceECqcW?=
 =?us-ascii?Q?ZZAqLvLiI16L9Ddksrvhphlds7i9DwLrikaSXfEjMduBZwLC25rveY2lt7YG?=
 =?us-ascii?Q?6T9OUPaL9+xWkI2TpXYvGAYjCiTMtGBC04aFpjzWs8JJABJhvBqOZUxiI2UJ?=
 =?us-ascii?Q?3RHlhJU7XrFqdxp7Fg81rGIzTj705VdxYBsv9k+PKN/ITgwRmbyGLPmstHw9?=
 =?us-ascii?Q?Mucr/uyvvTHObHKIYpwiNH4UIT7hTz4YiiuszkEVR2fyG7Jw7q2dYuR4ZyiB?=
 =?us-ascii?Q?Fpi5iiltB5/FxtRzhdltc/5UduZt9EJwcAqMVQVI86W9i0Ejq2Mun6EL+fpM?=
 =?us-ascii?Q?zAdnIar4rdTAyhPnMD2YVHq0MM/ydIinrA8OGvh1yS9P9N+L8D9w3FETdmhW?=
 =?us-ascii?Q?wwG8X2rQqrSQhPYb7+X1WfDdpwIjyoNzsWVEPJWtdsu5ZsiCn6xn9HNf/Fep?=
 =?us-ascii?Q?p17I9bOhs0TK8OVSWqbnKEP6p/27vbgaiUXBb7KFbTvpDixPGPLhCGvXlKXY?=
 =?us-ascii?Q?4XNHfDgbREP9T3EMzTWU+LCU8vS84mMzghfaJvip4S57cgiYwT6paTM+J7WR?=
 =?us-ascii?Q?kGbr+K8duzSXvcZOyqz17hST0RElueWnwHvr3+ljOYx7CxyL/iMYcIxUtyx1?=
 =?us-ascii?Q?bIUmqpms+rtSsqjRaP4SVfWs9pcZ/SY6DdIjPxXF9PxIdERXkGQsRvjzTI3y?=
 =?us-ascii?Q?GAjk5Y3Wyq2cIGV36QdFf47DBctc2gQ686Vd7x4RgVs6TS10FMwvU003/WUz?=
 =?us-ascii?Q?rLrx3kINdlMvTB3YH1eZ/ZusDTOMibx7X3NLhzoDgBmpUsJjiqFbeCbQ0Vmu?=
 =?us-ascii?Q?YssYBshfROohn+pJsATRe9daByDSq2N15i0RVLDSJ3PEKU1M8I8AR2Al5/B2?=
 =?us-ascii?Q?iexCwzFQZQPckWBm2A6R7t00+IvxRUtwttzyfl3x9jZZ4ZDMqk5hQqLJkw1V?=
 =?us-ascii?Q?WsG+ZCcmGbdtH3uf7uUNKKj3kXbRYWdDWz3uCZaW01kHK06N0tP1nyHMcey7?=
 =?us-ascii?Q?SsYlvqs55lA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cg/0t0oTzZ0KIwYNA2Nn1WOoTwv8fURbpuOiv23X2/749BlWWjKgXzOpmPBZ?=
 =?us-ascii?Q?V7yvOt7wePtpgnYl0OpTcl/lcFAcUjo2uW9I7OY5fVzAKoM2YUPdCpcPZYkv?=
 =?us-ascii?Q?5Ih28o4uJ1IlcMaa5ErrHSyoAkSfA+zMW/26C6D2tcouJ+loP99E8KXATC+B?=
 =?us-ascii?Q?foUJcARV5GUcTbtCmJ3RpzXCAJX+jc8Vm/TTKJFAye8CqYpHxomep+NsLHdR?=
 =?us-ascii?Q?8Zkh9mV3QGpxfCCpKrb78m/8kPNudJSE6cu0deKz7TnW0+c4nvIPXz52U0Dl?=
 =?us-ascii?Q?kt7kB9TT4lcqxmOQq2baJdMc4H6mzRe7GIG3LSIaKpWMJLYj0qws9FFbrZum?=
 =?us-ascii?Q?7UFRdDxGxPxOrXE0W710KqXMjpLujLEkhBZXUkFheycFYMglLWHtZM+yCZUd?=
 =?us-ascii?Q?R4HWXu+Ti+3j3i0PGeauCSrl3abOm7y/om8e+6SUrLY/z0eyHnS1NpeY7zi4?=
 =?us-ascii?Q?ojN/ehVyOUKNcy6ueMoKstT/n3/jXtu4n67AKjgS9leNI6RkYwfPhwVNDumI?=
 =?us-ascii?Q?vbnU/VROercF8FX9IkBB1R6BGvVzLQbIj3mkqzh/pkC/aexKaoflqe6GAphl?=
 =?us-ascii?Q?H96wOnxi3l/tDpqK/DMJQQ07TG22QjinvZfJZjk0HE0vDotMbIMGff/zFfLV?=
 =?us-ascii?Q?4soWHo9fSGwPcc1KNM2dneDpFnmZQkje5qbrqr3N6A5eKVLTCLZaqp982d+F?=
 =?us-ascii?Q?zov2KIvK8CeThfUrQHhLNfcNYPDOjubIfPhkK9AtA/TM6j6zmV9OqG97CsiD?=
 =?us-ascii?Q?Kq0ATVoxciBUj92nCHHcyBYqk0qhGL2G/RTQTlKSgdZ3SwPL5iNgQKEU4Z26?=
 =?us-ascii?Q?W7gv9jd/CmbcZFQD3FpGdlN6O1P0CwxzQQTWhrA0Gq1X5JaNHLLbY3V0rcRp?=
 =?us-ascii?Q?aqPdsviF+fjn6UhOzifPADAfA+dSCXcGKcMM2jhrSVt1sCjzzh77HDAILhtU?=
 =?us-ascii?Q?MOA+hwcXlfEEC+P/V8s/WFvL+WYT9HkgxbMOiRtG77V56ZfIWGZOlucSNl7D?=
 =?us-ascii?Q?ugUPw+GmrkCnnRrysEVvCkZM+W8t3ti3HDRGeiL8ZfueItaI/G99S7UbVCAa?=
 =?us-ascii?Q?1M5m6GseNqVrB4CwHffy1ZUkevN4Os/J6NRQ+sUXwU45OCDY+MxayGG48irV?=
 =?us-ascii?Q?v4xejwkEltXHiS0ilvFff9JXfrk/dfQ6d3/rARkG3iQMdAbgwxH2wJ7B1vaI?=
 =?us-ascii?Q?cDSi2/+s20OYJ+3ud/0d9EtzhxHvGaiY6EUmNTtb11rrHatQw9G5X3xAExyL?=
 =?us-ascii?Q?IC4CUKpujAOG8T4kIELU4ohSrkkX4MJ/bhab5T4llYcKxfttNiVR81LHLN0u?=
 =?us-ascii?Q?eiE0IV8ADA8bYOfVfrjnSPitYnP9pcsDVGu019jaBoiqQsYlll4fIiw6nr+v?=
 =?us-ascii?Q?Bz4HBixoYKCsHG5zdbN5IO+ye2RspdiY0SMnfnegDTRWPkd/DMj3wt06mAbt?=
 =?us-ascii?Q?jTSU/wzhrRlEOdFYxacjpwScfUvA21qfBE0bf5bBAmf17W7QxeYhBUMTFLRC?=
 =?us-ascii?Q?R6YhzcLz4Qf/GYO8+ANjN4clZmvqBGj6CExjMLc7OvJFAqY403q1OtVaIFb4?=
 =?us-ascii?Q?tJ0Jillloy9gRugCmkSZ+DVOmwbzMQkwr9PLGkWz+61yg8Gqdpm3wVNTgj3A?=
 =?us-ascii?Q?+Q=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d98d866-0b0b-44b6-31da-08ddbad7e30c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 08:50:54.9813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCD6ooOZB+ARsdfamrpL3p6QWaLXyNoN2/BPe1fF+tgPyRk4TLydXeXS+fLAZ40A0kEShw3iYdcEaPjaqe/F75tqVicqCnD7j5s+F078B0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7099

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Agilex5 address bus width for the ACE-lite interface is only 32 bits.
Hence the GIC600 SoC integration for Agilex5 can only access the first
32bit of the physical address space.

Add quirk to configure the gfp flag to allocate memory within 32bit
addressable range. As the 0x0201743b GIC600 ID is not specific to
Altera, of_machine_is_compatible() is added.

Add config in arm64 Kconfig to enable quirk.

change log:
v2: - Reworked implementation to reuse existing infrastructure as
      requested by Marc Zyngier.

    - Add new config in arm64 Kconfig to enable quirk.

    - Dropped dt and binding changes.
---
v1: - https://lore.kernel.org/all/cover.1747368554.git.adrianhoyin.ng@altera.com/

Adrian Ng Ho Yin (1):
  irqchip/gic-v3: Add Altera Agilex5 address bus width limitation
    workaround

 arch/arm64/Kconfig               | 10 ++++++++++
 drivers/irqchip/irq-gic-v3-its.c | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+)

-- 
2.49.GIT

