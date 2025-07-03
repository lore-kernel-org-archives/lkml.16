Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BC82C158A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582409; cv=fail; b=SqWBl1Dsaqx73Qp6FyAQ8XfCcesLtGA8mjugEpAUJSal8/uK29+l+WX6gA//d+5pQgLVx8J2rrnfnbTmc7WwB4oJEiGKRBErKyP58MhtcV0D+G0rD7nCYikmSOGc+Kds7iU/U30GySa25SxrZ2MvkIcXmF/r3UX5mzSrfw0GK1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582409; c=relaxed/simple;
	bh=+aB8vIKjO9RyvnHwpujSnM9+lxY9Ql/2Gl72ZGoP10g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XNv1MtgybzThJCGrAM0Umes/eiWBuBVIfht+rJe+rlY+ydIEq4hk7aI+J4ZovTABq128hSfeWs26e6QcdPd+GdRtGufBxy99xTzURrNXd6vz1LcOq9820XmnjWq4RfcYKh0kghFQsFNHpf8c/YePX4CwgFtBu8bPkKUWvReK7NM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qqkoZkLZ; arc=fail smtp.client-ip=40.107.236.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qqkoZkLZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9KE/WE329iB1vToyagqNHE7j6G51jnsj9gpfXAXCh6TrfMVbOA4CWuSxUBhlpeP8ERAjXdXXScCDZq+mHoXpZyUcG6jJWAUtUlp4tl0Eu48lBR8dkmFCWHtmXKq7wCea0mc7q5pf6m8cInHk61yz2Zxt7L2u/4SBnjybV/j/7SoriGVq194yv2BVz8RQMXIcFQnXq9nz2tunvl3B+psM29HNCSQrxu+1P1PTu8w9BTI4khBToKPV06ytxA2XALaCwTVdjQkd6jS03aD4DNYfAzyUg7x7WsYj6QiRVtTLOiEVgKhYCFv5ZA2GL/PCUPNXFwB6AF83mC+JXUjqx8uxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7T2WnUy/j7/LS4pDrOIqTFOwubSAaMJayx8O1NKdO1c=;
 b=Ow7RnxcT83u0i3TLcUW3JtvcObftusCfFxMiyOaM7d3HzNrDvEyOu2c96xAjZOZA2HDxlOACslAUqbDa4nx9SWxX5BBvd5hEj3yvt/RBEbx2Dd6UpbbN0+H/NGSGxuNjJQUtVOK/+rrwyqtDSgZtcfQAob/DNpS605C5E78ASps53DWIRhu7YmdvDB+ia0tpeviMAd4TLPNtLYL2yQ6T6TaMBGXV+iiDNTzXFeOz4RlPJcG2ovl4KMRJBL8hSSESOMr/7Y0w5dg9T+BM6sAERvbbR7SULSz/wJJErkKD0yQiovxH1jWT7WPH27SMDnOJ1X1XeX2uPZk+iGrl62LmoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T2WnUy/j7/LS4pDrOIqTFOwubSAaMJayx8O1NKdO1c=;
 b=qqkoZkLZwclR/OCNnu2IW6GO87K+WzTdHt6zB8JxE+O/noHh4g6EGkyTB1c3el1bi/Ry7kZ187Gwj3FBgveYVkkwgXx0YriHTxfzRUKbV1n8y4gAWsHVwO6ru/HD7VsuKDIXICrzLUvIPD3m0SQX7d9nuQ95LemaBsXRAT5z698kvSWhEew5jvKV1l9A6OVGpmOWRoCNSvCqp4RU4QGPw7MAK/mhTX30UuH1+ABlY+BX3TnoBBLz8rkUbFINcnhREkUFap0l6OZJMKbgEpWT7t0gSrW7XMXoTyP6/xcZCaWcZ720vnfvGj4cFCUBoGzWE5Ljst10WEYHe9Mrth1WWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 22:40:05 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 22:40:04 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>
Subject: [v1 02/12] mm/migrate_device: flags for selecting device private THP pages
Date: Fri,  4 Jul 2025 08:27:49 +1000
Message-ID: <20250703222759.1943776-3-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703222759.1943776-1-balbirs@nvidia.com>
References: <20250703222759.1943776-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:806:f2::31) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9d6c7e-58d1-4ab0-ac99-08ddba828df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NIMXCM5QIp7KuYu75p1yOnO89HSOlluRIADThq593edTDVclP/5YGP8WvwHf?=
 =?us-ascii?Q?+Pp6nx0oSaq0fEy+zUohlf8dylzOLq2sJV6q1+7KZJj7hJVU94vfjdC/i904?=
 =?us-ascii?Q?FtcbdqXloDPfsy/Lo4jKtal+/D7ZN/tD7w7I/cEHnZcraZYXzWd4iAv2us2Q?=
 =?us-ascii?Q?gjwaf1g9mGNO2TwtucLKc0Jdea44f7Y4UHLhGgJYNdRg+7nh6hEiCzytPb4h?=
 =?us-ascii?Q?4e5PQH5oghd9lg8tdZIpN2qfzAxOTit2QatCHylsS1mRDvjX3c9R3aKPtpn3?=
 =?us-ascii?Q?ZIkPMB57SwAzPzK2LhTR4ixLR7CmoVrDKAVvSQCWhFcinLbTNNID+gURHkBB?=
 =?us-ascii?Q?Kv0X8fjjhX5m8oRLZoW32XguBm6ickPd+eIScQF4+yHSSmUfjzLR8/ctUBM7?=
 =?us-ascii?Q?/+RuMH31yeiiuVBoVFnGCdiwzroRQ4YkmRVcojLmZYWzwjFjQFa/6HqsFBD5?=
 =?us-ascii?Q?Yu+WO4UksdcaH4vDAeOdPI317Qk9uiHpMpxaeio6caakYcCQyLXGHVO7UE4k?=
 =?us-ascii?Q?6BqY3V8dfHMziTTEhWDnRKN/HTekjOpVUmFIs8ijILipk2zfxxWxjIlsqvxH?=
 =?us-ascii?Q?km1rV5BYEUO3dAUWl1jj31FA+1cgv/L6oBrn1xg6mYImUE+gnZMdDH8MCykD?=
 =?us-ascii?Q?Ok5KS702poOFmZIU9N0ho+YeVvRGu1rM/5SFCKNWC4acgpLiFpXzT1uBRiB5?=
 =?us-ascii?Q?FGu9JiHFF1YCUYOIoFiMRiQmbbt0pv2dB6eeGGVXfYgGnnUKrrvMz3AC2BFT?=
 =?us-ascii?Q?OPXh+vI2S7CNOlkMAeXZ4H1njiHedSQXllZNNSM5hU1QX5MBL4JBM8rnvJF1?=
 =?us-ascii?Q?wDMkK2/juEfeOhmrYiJlIn7tQXelaNl3KM8cdYMpKLJUfCkr2n9tAB7NXJiC?=
 =?us-ascii?Q?OlsXDSME8T8TJjECLalkjzpeupBp5Os2q9Y0zyc9pesCC4n772FJpvfVNHSL?=
 =?us-ascii?Q?4XHBrj8OlIzpVA7c9D03Lh96OSki0vcoBP2b4Wz3T0wUwgqb03RoxrFrCig5?=
 =?us-ascii?Q?b1D0/aMrF4LBLiKzKtcO2fk44iE/86BH0aPK1oOfH+X3tO0tgay3YGx/1ZNr?=
 =?us-ascii?Q?/ji+bbvciaUlzUSJuY0HtFsTurOVrbyJbox5kgkt6jhMnon+hrnhQmBJTdBX?=
 =?us-ascii?Q?tidSpv4rRuFqBJMmlyWVIqUfa4sb42gbWnGeQg7VCk4M17iw//tVt0wWja4C?=
 =?us-ascii?Q?dif+iN9TdlXRsIr26guHv+u9n2LwdZRrmRDC1WlPa5ZRl19g36IF/D2WTdw+?=
 =?us-ascii?Q?OzeAyPei2uN+ZvS1q97W990NqOmvhmD1VFdx7Rdm5B9h0+2EJpimG+D+hlgh?=
 =?us-ascii?Q?UQTFZ1DU8LNREUHmTtD//1uZ6PiEj0mY6Ug/bzh/1QyHqnVBj6j0m9IP4ZvJ?=
 =?us-ascii?Q?oSSMrgfREkl6ph4pK/S0DQyt5WzeYIiPfhAiQ7zIrLgWWM+MWhbYtIWBVJBS?=
 =?us-ascii?Q?7V2D45SDVvY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aYt56JbYdKAvr8/V0RZD3I9U7AwZ8LUTxFWYVmjHZEIqE6rsGGfLefGvdBu7?=
 =?us-ascii?Q?QKDZyMIWBCCfLxa76YYS8aLbIrmtl2NqS16mIiD3gknl4moAhl/WFzLnkKY8?=
 =?us-ascii?Q?PPRmJT+KStK5d4G5k7iTAwXZ51hpJcA73/gxQYHm6+1AJcnOaDABNj/KjRB+?=
 =?us-ascii?Q?2wnkFrJ/Vw3m+UX5z9Px4485SYzQq/vOiVW63VcQ1LXpORbEZnAOxtjAC3pA?=
 =?us-ascii?Q?7/q6RD32c5oX1+FUPqjHpRb8lQ1Lbak/3iptZCBq1J754WNVY+Fu4glTPWC0?=
 =?us-ascii?Q?xvGRlG4LdAWreIuS4AkKFHQiua6gPTMpkekJ4CTrJPNZB7bxPK/HSF9e4zO/?=
 =?us-ascii?Q?TRVYxDg0P9gCcMbKqI++iaNRB4fY0BSVe+PpTgYGpPlX4+49Bvvf+GOii217?=
 =?us-ascii?Q?Vb35vqQAC9OicXRWYNXpES6X/Vcc1qjrsOD1sMMIfVlCBu0zv6nz/IczgOUF?=
 =?us-ascii?Q?Pzet5MrP1+YIvU592qMNOSL7gYP5RJBxU/nH+WwezA2ocLwtg5KXm/i4jscN?=
 =?us-ascii?Q?WTm2uC0BVucn0pt0dKHXbpupE7SQtlfdVLkmNSdoOZz1i7JPvAMm7B/PMg3O?=
 =?us-ascii?Q?FIl2hiRiZjj0bze2YjWy0KR506qYNO3522hkL2Xmzm1QbkbSjynnMLJQ+JRy?=
 =?us-ascii?Q?Uw3u7EXa16QT0ACvju1XNK2vhTYMZhIRuD9wvGSdl6dj+WNQMKOuIPVxmz7H?=
 =?us-ascii?Q?6ZW3a+wQkS36C0MfcUuaGkZ1tLwzx3Q8VSi60xxzGDw6XV9jYXXFcFxPy8aO?=
 =?us-ascii?Q?fsYM+jnj/R3w5np90bxra06MlFxGgITkijYysMBWinDKruR/UWVnuqISfObZ?=
 =?us-ascii?Q?HCunQMtA1a6ZDIngz9l0Jo9a6aW04CF1BqtEiNeb9JshTNjC1hYySbluGyQN?=
 =?us-ascii?Q?d4Cew6eCaVZNJDK30JalnG5auxLp3l5UQAtYx9muYzK8rG4gJX5MQJAnZ2IT?=
 =?us-ascii?Q?Op4B334csNThuRklTRupu6xEFq6IZFOXWKXRf2h4hgjQzxYo5tUROv3v5LL1?=
 =?us-ascii?Q?X6xWm1Iw9AutX+qSTDuhzYwGsjva5FknxofRA//29mjQwbMuwPiIgPcWQwda?=
 =?us-ascii?Q?lsr3GcxVx6OQvxziBL0Arj/qFp4Sr1xiWT/G3E+FkN17r59Fk4mE8xKZOuUI?=
 =?us-ascii?Q?rSDk9Sa2vJBwixPa16gHSZ0+8hyQv4nd751utJC2g7ACtUEAgDJPI6G0F+6+?=
 =?us-ascii?Q?m6nppMHPgoXUfVwdSoGijjub7egcqtlrZq0YL7AVncovG0fqWsXcTpGXLrGu?=
 =?us-ascii?Q?7I/vTSWZ/Pmf/VAVr1kmTlTqJjyhytlIk4hhzyIU6wnPsGoffGGOz94nsIXo?=
 =?us-ascii?Q?fQ/m+ZpD74HK4IOuKRpN77igR8xqe0Pc21QvIuemNppq3gbSY4o+hmbF+e7e?=
 =?us-ascii?Q?4kdGCWGBzLo5BNpK/vphlUGolbKJO2ReWaGWJVsskpm2dQXbzSrZts7l6fst?=
 =?us-ascii?Q?d0hGR6Njdv7SroqJwxp5424L/ZOSO3aaKgnBbhyxnRzlreGJ1dLFLzGTbDot?=
 =?us-ascii?Q?BOQ7lzT1AZhK+3QCIGE2BGBFUsKCeNU4LiHA6OFTt0NwRQlnra6t38Vjvige?=
 =?us-ascii?Q?Hf/KkEvV4IVAxCT/6Y7MPY95lMxYuKOlgHILsOad?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9d6c7e-58d1-4ab0-ac99-08ddba828df1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:40:04.7244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlzNQVnPLALyDQgeS7n95Hwh8sWXDUYqRkrGLbXs4sgX0ygPSggtk0PpLQHuo/WPINdPCMI4+toy9VlfOUFUEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722

Add flags to mark zone device migration pages.

MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
device pages as compound pages during device pfn migration.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/migrate.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index aaa2114498d6..1661e2d5479a 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -167,6 +167,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
 #define MIGRATE_PFN_VALID	(1UL << 0)
 #define MIGRATE_PFN_MIGRATE	(1UL << 1)
 #define MIGRATE_PFN_WRITE	(1UL << 3)
+#define MIGRATE_PFN_COMPOUND	(1UL << 4)
 #define MIGRATE_PFN_SHIFT	6
 
 static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
@@ -185,6 +186,7 @@ enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
 	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
+	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
 };
 
 struct migrate_vma {
-- 
2.49.0

