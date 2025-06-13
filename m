Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3700C1805A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820014; cv=fail; b=t4FPf+O7DP1KfGNErrKGXIo9TukgqvskMY0UIw5sUzGqB50DpPu4FxoxcQ7vcm7qtlImqO+IeykXq3IACnlPVRPky4Iz9G2x99xydqXRl6FH5mN8B3+187PZRESm4j9b0geK4p9X7378Uu3REXSO4HAO6evguuFl/H1CKoR4Gck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820014; c=relaxed/simple;
	bh=RJFWvEaF0ioX/qycM6o45MYoTl1HtNS0ttDCEU0tH70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M4Uo33wMZMXGLTjbhYxS2HgPil1BaHI9qBo3nv2CenYCB3qgoiwW9laPh9q+v5AavQTf0YVx54RHVXisTtsFHJm6a81EEixEKbut9XtM70M+tETT7RCfwx+jtVgbly3XtZYcj+80J4FaQ+mSgx5hJUDVV2AsUGdM60I2zNVxsN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Vf1jgVdQ; arc=fail smtp.client-ip=40.107.220.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vf1jgVdQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qi4fBOGuhHeFQRn8h/Ap1JaH/FT7Krsxya/6O/V/OUAwSSt1nQlem5BUYB5qRMWvxwoUe6Krgo3FLxS+eaxjryEgJqD+l3OFB2dycuEhCqyMpT1lyxoF6kw1GK7j0LTVtyh71aZos8WEmglhY1w9nl6t/6QzH6rkI8g20Heh2izErkTxi7GJdj3iDXmqWMumSVamGS31rYQGNFZGkPKO4+RJqH+gM0lZKjgg7znqjz0G/H86DaX8Mg/lgMzygtx06FiIae0Q/tqwMfDj0tsTEr5wVlSyd+4G5DFWe+vQvCM+KkbyFvvaS7FZ8S+e4bECpNZlcpRz41d6SZfpFYB9pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gd31oLlSjB8AmHvNdrIpeBw4EFoci5IbfqxDR5GzocQ=;
 b=Gq42Llk1rYLxjocuytoYffIY0NroUFkP21PFNbqW3qF79C2e/Gmu57BWEaNE1DkbXcQfsgoaK0MDZCuIIUKDfcADlGjrHFadf86C5vnLeEYcTCVVZEwGrW1BLO1AJzt0j+lRP8s4KBrWWVQCHdpve0oz3hGQyNT1+WSvDlNvdB34jzJz/Qd5NIkSTaWXC0hvv1vt1x/u6v7AdtkqzC+g0xS68LxFBtNqD9e0Yav05SEBMYiJRc9KyUB7Eewk27rmvJPPbgp4k5jaodrdc189kgBBetvKfrddpj9t5QuWyItyLGxth2Pd587nCjPs+PPEvw+wA/vImlxZtinPB3lMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gd31oLlSjB8AmHvNdrIpeBw4EFoci5IbfqxDR5GzocQ=;
 b=Vf1jgVdQuBa9JasveiAA2pBqJs3F2u2NEv+BgvW4Y0LcwWqfrqv5eyktP88DRIlCktdi83FJqF85N/aD1RSF3/OP2uc9fJiIyGVGlaKydAxbC4dpLMA6sLakTrVps/eb0UjpRRtSk7tczSrV6lk2Wo7zfp78XVOdN0dRBWzukAUVZnH9GjsL/G5IR0d614DMcYHRuzz9fjZ8e7A93Hfcg53okkH/uMP/a4V1ettw4MSoIfnHfKNFSKD7A9m9kDNK5NORuQdSl+tMzQXTKmXGQX7vdmZ/lHOEInkh9ieuGrTjGLb86i1rRTszGLxLKe1Fstbmpy0HAsoZSTwiCpbK5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV8PR12MB9715.namprd12.prod.outlook.com (2603:10b6:408:2a0::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.25; Fri, 13 Jun 2025 13:06:40 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8792.038; Fri, 13 Jun 2025
 13:06:40 +0000
From: Zi Yan <ziy@nvidia.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: huge_memory: fix the check for allowed huge orders in
 shmem
Date: Fri, 13 Jun 2025 09:06:37 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <B37C9623-83F2-4711-BE42-77C1B33F1B23@nvidia.com>
In-Reply-To: <529affb3220153d0d5a542960b535cdfc33f51d7.1749804835.git.baolin.wang@linux.alibaba.com>
References: <529affb3220153d0d5a542960b535cdfc33f51d7.1749804835.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN8PR12CA0029.namprd12.prod.outlook.com
 (2603:10b6:408:60::42) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV8PR12MB9715:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ebdb881-430d-418a-2ce3-08ddaa7b2314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qqy780jcyjAeXuMIj8qhF/lHGkXiHiEybXZ70w4vVfxX8OA0WjwlCgikBq9i?=
 =?us-ascii?Q?Ma15uAh8q43G28LeaxCGTFmHTxwEtj3NoIPYL7OwV0FJ9ZiixFU25wHWZuou?=
 =?us-ascii?Q?upFCL6kuDwo85h9v3WEN5+le0q0bCueW1IYBvib6niPjTbVFQxv9MuzFl64j?=
 =?us-ascii?Q?5rzOJID+oNtd0bq/tLoxnRye7dgKaNEYjv/6lIwjZ2OfQSVtS6M/7RSYey2P?=
 =?us-ascii?Q?O0nuXtRjJ6UO2dw9i9SSWADxrGVRJkvntmstnyzUCWp5/GaK6LyLwmwL09Hs?=
 =?us-ascii?Q?CqDB5VcUjC2ehrKz4uFDS3Nd5RNb9vjd9qN42W/MKv34AEFNkXq0h8eWcMl6?=
 =?us-ascii?Q?nQ0rtaRE8UdBqfOnUQIcYbfOCG/pm9OusWc17n51w/G/G1B6mYUFprlMYQzA?=
 =?us-ascii?Q?FWQb2Ozu9XddJnJL44QJ7se1hSgl+TKNHB57LbQAn2sh+sq7YKIgy4A1K7VH?=
 =?us-ascii?Q?mzVZyq14J35/AvvPZ7mPDhw8+agHm6x5Rx157MDas+p4m0QbY/IBrUF0sG01?=
 =?us-ascii?Q?JyrtPiyxJryIoOeDBvpq3CV7UNPdhv7yYi4mCZSfE1XGzevPs6hEswXWm3Du?=
 =?us-ascii?Q?C7BKYT5bn+R14D0eMy2D0I53xnGtVsk4l67NboNHF4/WErDf+oMLC1PspG6e?=
 =?us-ascii?Q?dboua4oJyw7VFR//5WfQfN0zSGEwGv/OYFl8UpDtcBeN5WvJj4LX3gW7dZUw?=
 =?us-ascii?Q?lrqqOqTmCLgcxmt13VeXAe/b421X+m6kVnG0UFByea2rT+pvfDHrYY08DQYS?=
 =?us-ascii?Q?IoGUwO1tQmR2W2PZ59aBqbKFWKWke5hezS6G16wcb/VpRo8IUrfKQWXVqm/s?=
 =?us-ascii?Q?c+fLNVbzHxPrhnHyk4YX98H/VzOa0l4XiqFPVuwuupbJto9fohtuDXgkN6Nd?=
 =?us-ascii?Q?SAEummEwe4JBQwwN2AlJO9SIe9KxQY07uMSbeZYh0XZs7vZQGd2di3ezXoHp?=
 =?us-ascii?Q?2z9QDNos7j5ZC7wIb2bnLbhBRmPDu7Bt1x/u3hPVazUq/UIFPXaCpWVtGagG?=
 =?us-ascii?Q?/jP9plZ29oT/HO6zJMVsr9a5Wlpl27PIk3R2Iqgb94nzfWe3ecLUHBrt9INa?=
 =?us-ascii?Q?mq9dN9NEeMV1JbJbJVvxOXiFepg9mm8vBpdsKBuI6xCN6RQ7elerMojKzCTl?=
 =?us-ascii?Q?/QT+mu2mPBAlthFe0pn1HASrJJcj0jLIw6KAB6M7/UcpcOiVDZdeQQIt4IZt?=
 =?us-ascii?Q?mMvD+tDk2Z/9ARxq0DD6Q6mraRLSaiddUyONtRJk2RlGLNyzCqii1rWzUpVC?=
 =?us-ascii?Q?9V60EyaPY/KUIVURVowqOBHoDY6+Sl6fAaWRGebTPkPW/UA6oM1QpgKZ/gR3?=
 =?us-ascii?Q?XwV+lN6RiF3GJhfAgLH92e+QQClPPM57DxMYGGTGGwL07s1+9Au+x4V1WK0J?=
 =?us-ascii?Q?Cyr3aJ4L7/H2gDALwv6Po/oQO3rfoV2F7dmslWx83z/yp8QJQaAe2ps7pUef?=
 =?us-ascii?Q?j62SHOVPV64=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?453VbxEiuwir1+hoHBzZZDdH/CmxYWbXKjczrfGT8ruKeIBA1RYwWYafi25m?=
 =?us-ascii?Q?NmCoB1XYvKJF1BXx/AB8xzHPE3mioUC1EaM+oBGk8jnaHbMv/CmJlYPJT3rH?=
 =?us-ascii?Q?IFQ4HF96XwzjjCqEBMrFQjd2UOHaX6TnEBH+vWRo9CBf0ZnNuBvkofQpKS3V?=
 =?us-ascii?Q?3Mt9otm/Xs+PL39f+5TNu8a+AzXPS01Jz7oE2E80tqETnGdU5Dcz3vAcKUFK?=
 =?us-ascii?Q?bW8xOMul9qsY0Izqv+aS0gJ+ZfrnU3PH+ClW12hkU6oqG3jV66+KedQU5hbY?=
 =?us-ascii?Q?WyILLqe8e+l1mx6a9PynJW9ql8CQAuW/ahp5htqZ34IJc9qJjBuCCEBtbpcB?=
 =?us-ascii?Q?nfhleJeYuN1aTjfH0eEGYILxlM2+up/yhH0nHEJTbJ0KsY/nYJ5ZHhJauqhh?=
 =?us-ascii?Q?aDJiQCBELyMn0l2lQMlKxRXdhIQi/fLxJFgrNoFfhC49348TbHwVDKj6SYp4?=
 =?us-ascii?Q?A8TgBH3XekLQuzTS2nYsMAou9cciEyvLkHY6YcaaSikAuGkgtGD3zyjaJUjB?=
 =?us-ascii?Q?kvXAI9L71xuBBbG/S+rmVs8Fm4m7umQNE2hf8u8eSOvkQWphmkHeCZExfksb?=
 =?us-ascii?Q?pTdFEknIqEo2Ii6JO+lpKYoy0rtfLyFO6ymSnZk0lrHLfOQk0BM4mhk3GW+s?=
 =?us-ascii?Q?UwwXC9J3y493AOt68LkpnMydSeL087zDc97xtGckc32ms3U13SxtlcDQO1om?=
 =?us-ascii?Q?+WOp6Wv8U9+I5lGE/qIy0fRGlvx2LXgSmq/HpxykZjpMlXjglyRJMDJc0V8g?=
 =?us-ascii?Q?gDe6aI086lgvDlLzsyOmDGs7TqaRUvEWuLGXR0aqyJF/BUCuFCJgWUG9Jpya?=
 =?us-ascii?Q?unJ5IPgTIbUGHVurg3Ab73badlZhbLhDaaNJB5np5TK1wJ1AcgRrkVUXIUFn?=
 =?us-ascii?Q?tMRlEoEEXVy36JtfMjKxWCuDHRVbt51Fbm41P/C1c0GlYHQ5JCXEvwjZTwdW?=
 =?us-ascii?Q?6UQ22pBlwyusnNhfRblhdJGV0NWHe6swXZgx5FkWxZALGgwKTz/qpF3Zq5ZO?=
 =?us-ascii?Q?Cq63XI8ZX1EMOuxAFp08mT4my+W0mIMkDoCisJj/RGsxkAR2jIn7iMLCJJ7d?=
 =?us-ascii?Q?j78QswBCygL1MeNY0qRTv37g4BcWfB+7nZ/8Px1ENU8VsPLX6IJzOdT6Xys7?=
 =?us-ascii?Q?YVaC7M08g4m24Ljn5PoTMnieu8t1xVaiJeQzQ08S+u9S0OQz9xwr5kVTs32z?=
 =?us-ascii?Q?LIFuA4es/DXWw6B5sDnegG0Ukf3CWjUGxrjGYMSc0JE98jJmvGwfxxMUp0e7?=
 =?us-ascii?Q?9XsjKfUOJOR4vOrLWv308mmdLbRlGxJktFNPzfSnNpuEgg8WUK6EPF7dQT3+?=
 =?us-ascii?Q?e+nMm4NOQPjOn/UwFKN1v1BqdKWvP0DRZfehHN+YWYIcLga+X1EEPTOsjA0B?=
 =?us-ascii?Q?y7yKDBK3AR5Opo57m3+IyeezwsgcaEhXHUUhGve5c+EdgBeFUvnXFMg74KYZ?=
 =?us-ascii?Q?VPfBvX1tS/wZgyACtirwaAgVwEQTJNfIcB1OU6P8fXgjXM4UQI2ihTRWL1D4?=
 =?us-ascii?Q?4GnyDfCRiXfGFrhB7oP6JEN5OqgmyhhOrzX1ngukNJfrd9G+BWQ7pIp39oeG?=
 =?us-ascii?Q?A7c6CeKCr/f2HSqtEUQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebdb881-430d-418a-2ce3-08ddaa7b2314
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 13:06:40.4016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fbibWvE/LvxSZW4BXDJnVIwSYu6ixxn9aQ175cahLWT8xay1qHS06gzeo0FYAvF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9715

On 13 Jun 2025, at 5:12, Baolin Wang wrote:

> Shmem already supports mTHP, and shmem_allowable_huge_orders() will ret=
urn
> the huge orders allowed by shmem. However, there is no check against th=
e
> 'orders' parameter passed by __thp_vma_allowable_orders(), which can le=
ad
> to incorrect check results for __thp_vma_allowable_orders().
>
> For example, when a user wants to check if shmem supports PMD-sized THP=

> by thp_vma_allowable_order(), if shmem only enables 64K mTHP, the curre=
nt
> logic would cause thp_vma_allowable_order() to return true, implying th=
at
> shmem allows PMD-sized THP allocation, which it actually does not.
>
> I don't think this will cause a significant impact on users, and this w=
ill
> only have some impact on the shmem THP collapse. That is to say, even t=
hough
> the shmem sysfs setting does not enable the PMD-sized THP, the
> thp_vma_allowable_order() still indicates that shmem allows PMD-sized c=
ollapse,
> meaning it might successfully collapse into THP, or it might not (for e=
xample,
> thp_vma_suitable_order() check failed in the collapse process). However=
, this
> still does not align with the shmem sysfs configuration, fix it.
>
> Fixes: 26c7d8413aaf ("mm: thp: support "THPeligible" semantics for mTHP=
 with anonymous shmem")
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
> Note: this general change is suitable to be split out as a bugfix patch=

> based on the discussions in the previous thread[1].
>
> [1] https://lore.kernel.org/all/86bf2dcd-4be9-4fd9-98cc-da55aea52be0@lu=
cifer.local/
> ---
>  mm/huge_memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Acked-by: Zi Yan <ziy@nvidia.com>


Best Regards,
Yan, Zi
