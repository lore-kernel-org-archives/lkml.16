Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607622E3719
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 22:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751668271; cv=fail; b=R2teVXKrHE12KCqMLSaf4okSvH6fwXyVaGQqIVRFE3d2GR4oikV7gEFcjRxTonr6DDQ3yp5X1dTpNCM8dM6kBfDxHRNL72SEq07DKUbSe5xebaew+CU7eZr9SR3Hms0F65NFc7Te32VBWdUFTKLLm89a5+bZmVo9Dw3a+VZq6nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751668271; c=relaxed/simple;
	bh=zHFyegAOa4r3gLZyE/f9W7eJiGPhG4Ns13xYPHEuyyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lwpxZDJuQRMw+ozbfVfwnTsZ+29Vs/ZdHcjhR9UNQbe9kfsesYD8WJu05ni9DN0NjBexCrgXNwmTuR6JYoS0/Pgl6Ma9/YOCp2CyfEdYBieF6hFqiikelt9l3FTors6eZzyDCo6YaenLfCi6skEd0KZtToV5aWEKpjvEmrkZ5fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V09VnUKz; arc=fail smtp.client-ip=40.107.244.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V09VnUKz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzR4Hu/o5Rz+15jvtxgW8+loAJKHU0ztLRbRkf4LQn9BbdFy7CcBfBl6KhLif0qvOOP5GG3yhvnyGtuPJTKQac6hEfYP02i8A621FCa7PYl/EJFkdfZcL+3F2MskiSeftE75spMn6lJqNgJr5KObPBOE49UX27S7LTiaoFRZEW3mcTvitAOYBtYf7aTaIvTi/3CRqfGHOihGHiuHKu96jrSr13YBzQ8EW2XDBI3np1HZS5Tzj4V6kMXHvdprTeyRleUZLdWxZ7yCXk0bcuXHbrEkQxQPDCn4HKD+2Yg1ieLgFGrDsa8p0k6agFlWmcXM9hZCo7Aamt823Yu2WZjTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iX/Q/rvyhvKq0zFMgExn/8IhiDA6ddYBoZ64nMtKuHI=;
 b=SIkaWnMHl3SWFFsBwQKhJfcs8DIru8XR8LHjNn6QGvQZx0dVW6OXjcvzI4RgzOXyFprUZsqHObHZxHeeuQd9GKLwuLG8eczTa3V8pN70DwHAPA+9UYr2K4YuxoR7aoVGJAvbEJeJ+JjqgWS4chgut0UNvuru8cYgj0e1cx7fRmhZWuWhO89xGVqe3oaD9yhQlxx625s4UagX+fmSe1RMHJ39k2UoQ+qYCBcss3WY+B86XsHVeJvXlBd2n3TAwKHgaxOx5SgfdZGmyF6+d3gqNUOZ8gRyZNeIfbL62putyCPCx9GGjUfIVo8/tZj+7JBDOZ4zpS+cTXN0nYr+yUDsnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iX/Q/rvyhvKq0zFMgExn/8IhiDA6ddYBoZ64nMtKuHI=;
 b=V09VnUKzJHe9CRW16bDWCkbZMTkxhznIWMUhYwZ0X9Z6mwbHXYZYEBOBLE3EU+VGq5tjsD8la+kF7FiUC6aABwEZCnnD5kKoiJeET5xQ5WbCi7fquRcjOjHUpDyrKB6eS69mxcWQNtwnQ9eCV8KcoS3wWIKXqQuD3/NwRbf2+FOLiB2geZlUhGI/AkVvxRn3pRTWCIwn28Krv18w69tze38TVUvGrD7HMnaSZ9xwsd3+gKo/wr+suSp8dQw2wNm6yp3g4msBEyrxQOX134DOqA8l//Auk+n5V0JQVuBYHeU/MVId/PFfZmdAuinrMdxBXdiXAi8eNby4cJrFHIXR4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB9736.namprd12.prod.outlook.com (2603:10b6:8:225::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.23; Fri, 4 Jul 2025 22:31:08 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 22:31:07 +0000
From: Zi Yan <ziy@nvidia.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: fault in complete folios instead of individual
 pages for tmpfs
Date: Fri, 04 Jul 2025 18:31:04 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <DDA700FC-6FB3-41BD-A409-AA82A94DE406@nvidia.com>
In-Reply-To: <440940e78aeb7430c5cc8b6d2088ae98265b9809.1751599072.git.baolin.wang@linux.alibaba.com>
References: <440940e78aeb7430c5cc8b6d2088ae98265b9809.1751599072.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:208:32f::17) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB9736:EE_
X-MS-Office365-Filtering-Correlation-Id: dde21715-284a-4e96-2def-08ddbb4a7853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k1YrjCYVVMyVOwnfVM8dxINNfC2UGWVEsLkeZcNhOOqrYcfgVUGS1u4QI/cH?=
 =?us-ascii?Q?ymkT5fwINp/9fi/isZ2KFMv6s8oopKnmALHPArmWdblBSpLoFoIag5cEw0TN?=
 =?us-ascii?Q?uUGD0gQrr8iFJJpFvpA+pDBiLeanMIKw2Ap7LLOk2KCrhlHYdIRhFx86doqL?=
 =?us-ascii?Q?ZtR/yrsansgjLr7145qmKuZhiNdusE0xYehlC2tiKx/9Y0x240MH75USpTVW?=
 =?us-ascii?Q?UPXy14diORkM6nUHxNd4yQ6CvKCbH6GZePDr1cxPnqMM5e6q33FDV5rvFiSo?=
 =?us-ascii?Q?RoTK9CI5Eid/b6AvjxrK3sczx2h4owXWU22S0yOSDOgzV5GnVl7SkZAvlBTI?=
 =?us-ascii?Q?XGOZu3xVsii5fEp1p92IIz/Rp00JH5WoCEFFVsgpD73NiviGIo/yr4WWUbjz?=
 =?us-ascii?Q?1+z7hg2X0J1MTBO5PcgYF2LIpJqpaS0O9qiqCQnQ27Fl6SpZmE6UTc24tx9s?=
 =?us-ascii?Q?KYdOx1o5zCWdaPNR5cE/ASg09h/FWKFKwDY87yCUFwtJCF8JS98BLf7KVTAw?=
 =?us-ascii?Q?N4E1k/IQ7c5tCC6VfsG4+mjh1YpcxIGZzrofFPP9m5yPy+/XPjLLNj6OIbG/?=
 =?us-ascii?Q?M+aLBjAEBFuhpNNfrB87ffQz+BHq4FDwOA+UYtIaD5OFUeZzkxod5zyTiItg?=
 =?us-ascii?Q?CCSE3pmE78V4HRmG1+he+jb54J8YsVxSH7H3SHhl5Rxgvy4xsmqWnqqzdsXq?=
 =?us-ascii?Q?6IkR80DA4nuiBux/sS307qV619cFOPa2QHaAPdMQ5uOWS9iMHIl68VbqFvfs?=
 =?us-ascii?Q?RmUmjqhFTEe/KipPpugj2H/R+pvX7HWNFMQw1TPP04Eqdv2aRvFQP+345FRW?=
 =?us-ascii?Q?5R4ZeRen3cclj3G/B2oBLVfFuYhHObMkzmxG/nzR5p6+nwtnE8iRqKPj/WHR?=
 =?us-ascii?Q?3NA9Ppq4LdjJI68jQA4S4+9A6I0XAXbohSwDVMj161JIhz3+HrC95+t5dwCJ?=
 =?us-ascii?Q?2Ht6x2wxMUAsK6x5pZ3DdvzOdSJSHJRxXNeExHyVorsf00X8RG6YmCAKrkWz?=
 =?us-ascii?Q?LMmj/FprDi06B6cwzLLAU9HDy0639xhYkdg17hARdNfqQ8xV3u0c3P1kVnS1?=
 =?us-ascii?Q?Q4WAqQepG6h0BqC+SaaCB3Az1IT1Reen58v+ORv3/+EwNSh3hhY4NIGxqwp8?=
 =?us-ascii?Q?RBXdeAfMDqiU4hZEkTBA92UTomj3kjfyv372n2h6tnI6qrkY8NWDpzGr0JD/?=
 =?us-ascii?Q?e/8XzlLHt1MXZMvdEXxlx6c+hb65dZAp5D4lLuvG5LtSUMBqRbvokQU6TmX2?=
 =?us-ascii?Q?++s8wjgv5yM5PFnjwrhpj5QW9yW5T202bSjp65RyeylmtITACe8GTXS57RWc?=
 =?us-ascii?Q?lMmat5bq5yGi7Wqm1qfVXZxYuhZxGYQIiDEel5L9BcMD3TyIa3NjlGzR3kIE?=
 =?us-ascii?Q?76lSG250iLvlYN6rBTYZqYh4+Lru2IFCqlfLqStT91hJSAC3ZugiwLV7cmu5?=
 =?us-ascii?Q?n9qc5hYd/5Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wHZm8V/E9NYzdXqv1KFOqfZz6tBUbQEaE/rDxNy2SZB7Nw7kUa32CFKpuSNl?=
 =?us-ascii?Q?ExfFOQHmnFQesJa2oBRt09H2ogrWKqkLpVXRvs/S905gUrbcniqg5DqGkf+s?=
 =?us-ascii?Q?4HKP15Bb6vjWMgU/gR4mWjt/yFKvMn3v5hsV1aXDz/U3hYYv/HCRTnyGmYTm?=
 =?us-ascii?Q?hnvMQcgyeA2hmCu/+XUcOwkf13RQMJS09B3muhesRD8XCFGBudSzTQxHZaIx?=
 =?us-ascii?Q?YM9Sg+LrYf4nyLbgg8L9L+4J9zyCGgeIeafu8mS0C/oIr+oTh4JiFhro1t7e?=
 =?us-ascii?Q?jHPNCs1VG9dFjlOzmXT3NQ4TTDTBxRVkEcr7ZFH8R1zOOzJc/uHeHMk/LS6t?=
 =?us-ascii?Q?qVLVS2hADtk9FTWOt9iUluG/jPoQempaGwd4FShiDthXHMbcSH7KoZ+3vv2j?=
 =?us-ascii?Q?eHDBJCTBdb533WcRbqw6qx38+t25p4r0w4jMrWxhWh/C9P43G0XQ1mOOOzUs?=
 =?us-ascii?Q?Tfy3UNyTb3YQfdpOzrLQzvRMzC8nVIGAdMUXZMkw4PsEaeFDWpEnQMZ4wLWk?=
 =?us-ascii?Q?YXAz0F3EXfdwVcaDtJ6E03Dns/K++oMILlUaAJRk3tHAnE+MZ+0tvXTnxllt?=
 =?us-ascii?Q?Bn21WKfKkrqcwuefjNQGmhQpwD7SnYG5xeOt1Wlo/WEf6S6IO5aNFm3Ktzpc?=
 =?us-ascii?Q?8xRIrFvZ715dPvIsahso5vzaoWWcdwNu6OTUoTnHPuVaiG5jAB0lydJ6lVon?=
 =?us-ascii?Q?5sioNPji5H0XtT66LgjCuoblbNu3ZIjt/MCm4XjyjUVP37KCt/e5IpqrC5fw?=
 =?us-ascii?Q?So7wwyhZhPtQO/QLW/OvMX4PYlEfrhXUT+LX0ECa5YqPjUS2smf2r+t1MkJw?=
 =?us-ascii?Q?dmE0/BZ+Htthy8YWd2AQVx3g01rrk3zBN7dHCkBcQOxW9gyoafvz8fLX2Knx?=
 =?us-ascii?Q?LR/BDsPMsDvg/sWtjbDuM+37SceB0GSXI/m0uEDlTf5Y7lvGP/LImEWtnj2F?=
 =?us-ascii?Q?buleSXHZH0P3nKwuZBynadm10p1fwcJSRxW+vIBUCA7g8UxlgzPqb1wlUGtr?=
 =?us-ascii?Q?mexd9v2CLjVIA0jgROGSPOyFcbYmZAUM/26hrdRTkkxhJbf3OLGTo4yXamm5?=
 =?us-ascii?Q?gZvCRhoGpxMXcScqz1ub+l4MnYq3cqs62MfQ/YfvuZzAbQyc55oa3wRrBoqm?=
 =?us-ascii?Q?sM7qfB12f00ipTXNp5F3tD1sXwUuWgxfu2xHHKsWB1TbRJLER0d3YULDWsQh?=
 =?us-ascii?Q?/H7HFrIdzuu69kDAdaduFnZGj1pDKriJLuKYri3+QDLb0onSJxaRL9ac+dxs?=
 =?us-ascii?Q?mIfvnrdZKXx9addbHW8Z/dsCSBBGme8eSsNOALnc7tsssIOn22dnfm6bVgUy?=
 =?us-ascii?Q?+ubTW0IXP2Go3Y6D2ZdGayljh2aprz9T/Z3iQbfDEFJbOFmPTSa534MtU+Jj?=
 =?us-ascii?Q?phvrNi2XdQo7rbwA2T5NYkHmUdQssJOb4del+Rca92zUhirgg33X/JiE3btw?=
 =?us-ascii?Q?2JNRjVlj7qu8ViYlA9P0tgHImlYib8NfYGOEWURJYnikQJPdHeei3t7KpE6g?=
 =?us-ascii?Q?fBEM257drglCFrmVc3Na9JlJhPNYP0YYAf63YRzHNXBqONNL2vQ1Z4fyftuQ?=
 =?us-ascii?Q?WaWVDS/58kIibPJe0N7XnKe8Vb0OBaz2IJ39t960?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde21715-284a-4e96-2def-08ddbb4a7853
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 22:31:07.8268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMuFQE+wJbL7dSXT3g1LV6BUkGBuitSi27SjiKuYgtnIsixYee4dz73KAj+aqZUp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9736

On 3 Jul 2025, at 23:19, Baolin Wang wrote:

> After commit acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs"),
> tmpfs can also support large folio allocation (not just PMD-sized large
> folios).
>
> However, when accessing tmpfs via mmap(), although tmpfs supports large folios,
> we still establish mappings at the base page granularity, which is unreasonable.
>
> We can map multiple consecutive pages of a tmpfs folios at once according to
> the size of the large folio. On one hand, this can reduce the overhead of page
> faults; on the other hand, it can leverage hardware architecture optimizations
> to reduce TLB misses, such as contiguous PTEs on the ARM architecture.
>
> Moreover, tmpfs mount will use the 'huge=' option to control large folio
> allocation explicitly. So it can be understood that the process's RSS statistics
> might increase, and I think this will not cause any obvious effects for users.
>
> Performance test:
> I created a 1G tmpfs file, populated with 64K large folios, and write-accessed it
> sequentially via mmap(). I observed a significant performance improvement:
>
> Before the patch:
> real	0m0.158s
> user	0m0.008s
> sys	0m0.150s
>
> After the patch:
> real	0m0.021s
> user	0m0.004s
> sys	0m0.017s
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
> Changes from v1:
>  - Drop the unnecessary IS_ALIGNED() check, per David.
>  - Update the commit message, per David.
> ---
>  mm/memory.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

LGTM. Acked-by: Zi Yan <ziy@nvidia.com>


--
Best Regards,
Yan, Zi
