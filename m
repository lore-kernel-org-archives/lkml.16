Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2047.outbound.protection.outlook.com [40.107.212.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A9C1D63E4
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748952800; cv=fail; b=Fdfgyl4p0ShQyR7nvcdtWFAQU2b4ioPWGP9wG89kshL2Sv+zyBka4LSAIMt3s1ABQGSudKAXk6w8DEHcu7NYlucvkWAoPAp9rKbIQ6evzonxxF3R4u6EEK1EXsyvfzqMnaLsgxVvN7wI6rkhk5wVk1670+7TV18ZukwQWr7b7B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748952800; c=relaxed/simple;
	bh=euci+r6c//OZXMDx9GJq0uQVMZ4rS1sXjJooU0BD9W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sxjTbDEVUt/yysMN5/6CnwWUqUlgx1HIZczULlcKQYwlpxwnKGuMkgQe7ZKYnslnaM63e56A9t5rn/rxpiCiBpQ86Rqlynt7PfB5+ldmb6owyXJhsFR5zkEuIJ/PcL8+8J5AljNpAcKDSJTtMQY7qccOPSiomlzZGB12FQ5JJQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KeoRiOSp; arc=fail smtp.client-ip=40.107.212.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KeoRiOSp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1PXDC/GH1rU7Ypn6MHtcgxxSi07jbU1fBZp9y3fbvSOnDuGKWui8Qv8sDk0oqKywAMJ7DoR36GOke8jrWFATMCMvdw/bICXPbxzwCSl+++ZXPVeHKF3vU3mTwr/Su0cV/UI1E0GF6Z3MFPCJ4D9ntm3/8M7erJ/9RLqcrPN9EGxTx3IvVzYD3ZvrA7z3JbXWm6oWJ6pNR3qUWeYxVMbzLEQ6BEFiW6AtSclmgrYMQYORislSGPZVcYFSANGpMzYZfqgvKd71bEikKsFcKMPTf+7z+46M7IyBIWNDc+OEENgfr75JravUnMa72A+1jbgRYBPrtWv0B0a/A5KWo51IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGRm+fCClxkuVZ10YUbx/Me5/HOvbeWxmPCl/Vxe07k=;
 b=EYwcHPla05wqwae8nH48hqr7Gswn24sdLe/JrDzfpKN8Qwmy1HnaClAkA62eO5cN7rcOTI4T04frwHKKHPT+Q9OVkW3MsjEhv8mJLJVOjVHlElgBcnCVWkkmr6qrfs+c5g4Y0Sqt011zOuHRBVc39nGdYGUDrpJcAP9eA0SXD+7N6Kb9SuX+VRdaqiNjBxEocmYK5DJeVHVQIGBg1kEg3cTF83b87xvK6XqczSaX/cfEAEpnUtJWidvKceCKj/KG+qSZ0HzhsZQwe0YnJTiV0XVi8WKbS3mwrez1X11IpP6GQA6RQommzfzL7Nqb/JiHAslvDZETI40kfRK6Cmf3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGRm+fCClxkuVZ10YUbx/Me5/HOvbeWxmPCl/Vxe07k=;
 b=KeoRiOSpKncOA2ivurFLxmWGL2CapQq3Oa/hsSvyr01W3OsTJZW1UASnXfQDua7JxRiVoMAmRmz7XjHCR9VDgXB8aUoonEwE69Jl2+aFpFIeApCsIz9298kKcatxlJxz5VT4z3exB7cZorGAttpcuySG4jBtYZtRCX39xKPGILsRx9qFxziJBUFMpsMR7S5CULTMdtZMGG7WUHw/WA8kMmeY2cTg+o5Dcsu7P8QE78m8BATkOUe4mUkSdmPrerR037FIU4L+PRKq+lRcbhmqAT2teXUTOuKf8DQbRSHO9132E4egQ2awZMLgInOBdzxzB0pFCfYzeXaGgj/H+YnPcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Tue, 3 Jun
 2025 12:13:09 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 12:13:09 +0000
From: Zi Yan <ziy@nvidia.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Juan Yescas <jyescas@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: Kconfig: Use verb *use* in plural form in description
Date: Tue, 03 Jun 2025 08:13:07 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <84B8149D-C81A-42D5-AB40-BABA6D75D2D8@nvidia.com>
In-Reply-To: <20250603061303.479551-2-pmenzel@molgen.mpg.de>
References: <20250603061303.479551-2-pmenzel@molgen.mpg.de>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0017.namprd18.prod.outlook.com
 (2603:10b6:208:23c::22) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 8223062a-5ebc-4ddd-236d-08dda298010c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7THH40ClRppHLBpKhWMgfspqrSRCQ44UQsJmno4maCgs4iqMAqEuwOkNBTvD?=
 =?us-ascii?Q?W8CKg08KEEprmkmYNyIvcD2LZ3dyorUFq0BI9vYmeG13MY3vc9YoGWrwi04Q?=
 =?us-ascii?Q?RZp53NRCwTtgLZ3mn14b+BXG8M8dbbP1rorKHF1ZpB0kD4/GdX5BEliHrdel?=
 =?us-ascii?Q?7D73HKcU27EEqUsVvTRC+7Hi91AIe713jzWJHgyFKgkaK5mLeYx9B3BCBoUH?=
 =?us-ascii?Q?j7/ziXn+HZ6yDbxHkfhNhYq1y/zcxEY4PS1nhvqHpr8uFneasdmS4paRvRaG?=
 =?us-ascii?Q?SYZkx7efKn+D6R1T5guPK6/9isbgpsQ0ebVlgFNcbMaIJPXH2QIXjFdRW2lK?=
 =?us-ascii?Q?bzR8fJDLUjKhbs3mV/PAoBvvegf/zb33FWJtvqk7uzl5YWyrUWF2VEggMyMI?=
 =?us-ascii?Q?AOnmBkpzDf0sHr3OpmOLmOjf/zNs+Bq6J63XORP9zUvPbjbPnXEP6pJv6tYK?=
 =?us-ascii?Q?dVEEOxyr+gswbPF62NYbLS3TgsTNqelmoWL/31wqo81tdGQP9XZU/dCUPv8o?=
 =?us-ascii?Q?W5kRkxkb+/P6xN1k5qxNiirKDG1WUHkEbNlp0/5RyUIxcTl8i4qGUAnDTiIQ?=
 =?us-ascii?Q?x+ikTQuwgcg1R+V+O4iw8JrYkjYCLrusygwo0sxn7zNUxmy7Tj8211ZbXK2E?=
 =?us-ascii?Q?rtGS3Nd+/qb5uJGpbUs3WAFbZg6h2yUGSqUHPoXC6dlhrugIbmR6xgIxLn92?=
 =?us-ascii?Q?8vMvvOPt6CkcsY0wX8j1m6c2OHDZgswc1zqwvhNau9uS88fBrBzAsCTRhUYI?=
 =?us-ascii?Q?O934cO7BKsomCaUIaKhMUJ8DaPiYuyFuAUMJ5WUfbVgUlxnYXVC+20twWuxz?=
 =?us-ascii?Q?qUup6RCzRhb0hVS4ZBLHud3P30Jtjj8Hx33HqhBGExnHgeAWwSjthRs4+OwO?=
 =?us-ascii?Q?1PxxB3j17g6QQw5m6MMcjQXHQPYhptFrIB709iqn/io1T3TBCsOzbTHKa2Et?=
 =?us-ascii?Q?RcS6+q1lN1/I6JDVNQd2v1qqJVxkVL/Zo4uy5f+dZGSfKFTr9kS1fKOt0+v3?=
 =?us-ascii?Q?SJu620SMM/o1gVMHa50aEiQYFT+wgGmvr1XAG1hRVCOy2n19GOBj7oV1MFfY?=
 =?us-ascii?Q?60soAFDagOwVffxcBwyCHbpuiwOH/J9dWoGobR/vJnQS0KpQp2U7vhnu5y9H?=
 =?us-ascii?Q?Vo4N87Pg3VaoScH8Wqnb8KJQZR73QJyqAy79XlJBT/L69cjKw0zh7iTl6sN6?=
 =?us-ascii?Q?+0sy/42iWd25/6sIrU79b/f8DG5xVzTbAPmRIcAoMmRlwNOqkzo3ssxY8e3l?=
 =?us-ascii?Q?Z71lm7aaLPK7RsYPfiK98awtZqhWqWTd6IjQh/ZLWUneaZeIvSPp//XgeB25?=
 =?us-ascii?Q?TfLR6iOxLw7S8mAog5akJWE94i8gO3mb2DnaA80AIBrRoRmcQuD1qs1LEX7a?=
 =?us-ascii?Q?3EI5j5y5kR45ppdEE88V3hyKsHATzVFMDV8p2kPQQ+pwb8KbsA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8g84Gjo5eGrkqX7FlSckFlElhCgvbRV7gCz6Vdgz0QsQLqGaU+oWh9NN9VYr?=
 =?us-ascii?Q?MCrGtYi+VKga/8c0vfQE48I5sgeGmYyv2lwqZ1GM44MpJ+iRN++d4/VAPV4w?=
 =?us-ascii?Q?y17hP9YMm8RiL+/bFxupRmqRhsyIWWvfb5+vtXBxmTPTuT57qf9kXd8VYJ1+?=
 =?us-ascii?Q?trP116XsD7BsCaMRib8XLMSxpI+oRaWAJAYES7CZIdQm2QS0mz0zRC8+qgGr?=
 =?us-ascii?Q?jhWj5VChvCN7nFgWkVBzI87Zn9m3CSHUCpnNf4kQ2L9rljXxIoufTGXvKrV8?=
 =?us-ascii?Q?ORPCwC+M+Fjwnz7lchmYuwJLGa5N4Lbkrl4zUMpWEyxpNqlLk22MEcXIa+Rd?=
 =?us-ascii?Q?YGjPQAqBfYGV+12LEZLbLnLwaqAPi6ML1omowAAoshjx3m/IT71RV4Sf6AQa?=
 =?us-ascii?Q?EBrKY1x5uKL12jNPW0Tiew4JXj22RnlapmKs4rQgOkOx+iVmzIHkLS1MReNi?=
 =?us-ascii?Q?4SwFjNlqwZlhw9TAaiX2PPYBkwWbQmLrWnR1+A6+OX/CA+G4RuqcUV9o/xWB?=
 =?us-ascii?Q?dAb/Do0OLTY4SlKHghODYY32qhMDC8nGsvUgK6kYi46v/GjipkoXST4/cYYO?=
 =?us-ascii?Q?hI3HxT3xwlNUhP0LK2hDZ+unZLr5DtHBZzTVpAytUQDyWqnaR/ai0qIkq7zG?=
 =?us-ascii?Q?gAAZdA1OMgtGVSM4HWLBA0wmb+TP6aKuo7QLlpM2rQlTbOwe16743pjKTrs5?=
 =?us-ascii?Q?UlAom/rqBWz7TUBE3Tk8OIcIpH4bJdPem8JTj6xgw1J+GqXCwBb1fTwwsVFL?=
 =?us-ascii?Q?L3ZOy2GI//HGRfFeGUyZIimxyBBkIzcXWPOtmD5+desGhQcvk93PHMjSOAPY?=
 =?us-ascii?Q?7My0/O65LsEV3ojJaef/P06m58p1w64MsquDmsJvz6YH4r3TkGdhBCi3W3Xf?=
 =?us-ascii?Q?R5MviBG0WbHxLiZT9mm60qQCuLONcRvkxyj5sYZ+eiy84hzs935X/7BOGJRj?=
 =?us-ascii?Q?Y1GaTunDBp+88V4X8hmnl1hV9pKfrds7OkyasIOCRq+EynsI3brAF1Cshinn?=
 =?us-ascii?Q?HY8iPHwasyqTRADLH/FcWjftNVJDgTS3AJ898CD6A/7xH9DsQqoAZxr/0FbF?=
 =?us-ascii?Q?/bg43s3Z1xg2cemE00U4UeKxwMx+n6srn1XxWKnVSE5geH0FZaVxh79xKtZw?=
 =?us-ascii?Q?liwAws5QTRB8KYJWNPuBp/KYGO//WZjf9Bp+v6NSay/WzEVql5uN+lVi2g/h?=
 =?us-ascii?Q?lWNJZnEFfoHBb2AlCLBj9AVNHmlXd9Vat04tLBZ30lOF5vcx4JB7sRM/eTHS?=
 =?us-ascii?Q?FOosom3m9JPZt9Gdihvhe1uqZW4HARaeetsbpq1v/i6oM4DOs5ZEGH84Ibym?=
 =?us-ascii?Q?7FcNhsb9i4KllMCAtBC7q0Ou4J76XqqhM1JMuNZ+POyAWfbnvgBWSQL6uDN3?=
 =?us-ascii?Q?rWrMc5TozsN6BbSrlpPe8GZVMdKDLXKfgus9r35bxC0j7zabLBzI/tptEHD9?=
 =?us-ascii?Q?zpUmA0vKaSdRhYvVjjOVbkIg94XtrpG/zlOymJ24wXv01dWc90TPgy2yFUM8?=
 =?us-ascii?Q?v2/k9/iF3H0CW/GQVSoYN/zMZ38fIrHX5V/QKw0hH9Q5moM3FQBnjzySJr06?=
 =?us-ascii?Q?W+0TJPXuJtly1aPyKqErjOH1auO8f6vDA9Jpi323?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8223062a-5ebc-4ddd-236d-08dda298010c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:13:09.4062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnPPUbAeQxkugZFLcHjBVWsEuATByKFoDTtvo0ye+2g+7V0R+tC2VcS4KkUSjP5K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

On 3 Jun 2025, at 2:13, Paul Menzel wrote:

> *workloads* is plural requiring the verb *use* in plural form.
>
> Fixes: e13e7922d034 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---
> Reading the sentence it feels like, something is missing before the
> *please*, but I am no native speaker.
>
>  mm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Thanks.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
