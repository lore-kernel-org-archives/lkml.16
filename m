Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C293D30748C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863031; cv=fail; b=kqxmETmUHuQU/PeWsYDUOqj9SyR/DD7CfZ4F7izRwjuTqSE9+UzywCGEnYVCIsFEBrOHt7RJ5tqHvhjdcyocHzHzwPs/FG4WnI8IQy1vbTIWDo7Dt7xzfcNAUGNhFfla19N7qph7tScb39tWlCwnnM5jEwzQhKppL3OSVFHKanQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863031; c=relaxed/simple;
	bh=GWtV9FK/RYJUBAC1X6dHMaPFACKF2lkye3v9r+Cv96M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GJalAxV5UtdqhKkqDg6Hz1Km9I8Iy1zHwvucf635ckaPgdADNUL4uY5iqyIsiIkug3UgM2WfraNP7X75yCtpGq3BV47nJInJlhEiLPUi65nGO6yYdsOl/zjjYo1F4rZh3iE4lqOdvwdTrwLr1Y006vo9QDhHDMQ48UsTiBfcs4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C/o6PCXD; arc=fail smtp.client-ip=40.107.244.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C/o6PCXD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvtBnZYPXWsybS/vNRRaxhYLK2YGe4jBo+N2Hc5ECpBORkSgoKHXT5c4H7CrJhFkE+l4d/CRh8p4R1MWEZ6CR5OqSSJdLC60Jy6ORXKMtKiQ4HNmed4aSpRFUaqizpO5nFDZJQvnhIaC79VbarwfDWX3adlSfd5FHEYQp1FIIM8aYDIytFmrrtMyLjGV7Gti296tf9zc+RbkJkmZdpdpZ8eq8J84koUiOKmRa+ASp2bihLHzl0QcyUf5SS3LQ07CSPnkGnT8/pMhKxbizIM+rklRT9k4NPrkZX/74jeFmqWmkLjFcJcCLtBpqWBxl6txc+D9iio4QZzXp7WH2YD9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkCbdmc8w0LIy42C7KFFFgZIU4qnDE7WDIQdGvDEaTM=;
 b=rzrJnsXQ24l0Ng+amR27sqD6+DtgcKbmBe5BKa1B6H4zbALl1L9y4NPFVSeIWta5ofEQmEerVXnDIAFwZ0aJcHMQESvi2pQi1+Q86hZqIZiU5s3cfgXVuSryzETbcH1AdPBLrZ0cR5iTat3A6FKur8GT5Dm1LnE5/UYAO+m5kzo/qvr9CjswXpnvS5AramM38Zc02YEd9uFT3mDSXmEhKIeJcm3qiVoofWevAzyby+qOFE23c6gpByuxlA85xPK4imYTPs772FdGuu9yE63OMQ+gx82sK4x7kWzXGBS0sU1SIgo8f+2zLRcoGFs4+08F9Er06dlFo0Wc6CaKhG40uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkCbdmc8w0LIy42C7KFFFgZIU4qnDE7WDIQdGvDEaTM=;
 b=C/o6PCXDrH/mbshEmtIkgF+P181yFdBdgVEkTsjMF9JYxmNygBhICVIxO2bk8aII2cQiBZYRD+3UeMLtcKFF2Qe6oRhDEU6pHmNpSO2SsMgJ7zyVE1bmhjrrXpJdbrwO7maISISFMSd+E1jjl2j3hy22OHs8VWiyVP7fOzYnj0eYPVicTAep6XauZp2CmqYN2SmtYNg13JyZtiGsLtO8gJO6OntW/cH5l7os8ezEtY6nVxiyPdM8Z8aEHaW4pt3ToEqWE542LDYgwKSfX7WjjNqpS8LDqIPmrq8dIiRtq6hQ0xT8PCyy47aCn++vfRS48WUsP4Ab43ThRCAaTeHpBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB8121.namprd12.prod.outlook.com (2603:10b6:510:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 14:50:26 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Wed, 25 Jun 2025
 14:50:26 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add myself as THP co-maintainer
Date: Wed, 25 Jun 2025 10:50:23 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <5CB98B00-99F8-4200-919D-6182977D5FA0@nvidia.com>
In-Reply-To: <20250625095231.42874-1-lorenzo.stoakes@oracle.com>
References: <20250625095231.42874-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN0PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:208:530::13) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: a0220d0d-ebac-4005-e97a-08ddb3f79ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zMgG0t+k+OSOj7xl2Bv0XSfHFOcrWi/pxv3xj0B9rJtyrPUyFWm4eMeoX76R?=
 =?us-ascii?Q?hTMZSQ5IqkOrzlICf/MCJovBo7olP3R67plaPFpTO+jk3WIv0cb8HEsAgsOQ?=
 =?us-ascii?Q?lBdEtF05OBYhaYAwZcpB1kNCqwL1IyoDXIhLbAG59zYJUyavYC75Yj4unK+U?=
 =?us-ascii?Q?383e9XYDsWtLr/s0rlRB9aDSyWw+spRzguw9jjsjVvZTtEkCp8ZSkM4gHvq9?=
 =?us-ascii?Q?SoU5w/Em+QeCASDrDyJMrrK1cM3yt0t6s8IZ7bGVz5Olu1W0YNnaLgCnzw07?=
 =?us-ascii?Q?4sDbvM8bBoUsys7UofPIrjBFkZUZgK7PqNsMqH5V8EGbxtTMANqka87H2EFP?=
 =?us-ascii?Q?HXzjPU8wTWW5RXTFWzHX2d8t3PxoTD7xkfqnCgBMKuctB6j/+0bkbwRYxbgT?=
 =?us-ascii?Q?ba5rzgbSAC+1SbLoYAZOyzzXYyAA+C1bKqoq9EgPdz1sHheFDz8iVUelm3z7?=
 =?us-ascii?Q?Uzi3YowmxYf0/z9SsDeze9Kl1E3ri8OLsHMBJ+peXW9IBzjJLaeZgsPUulqi?=
 =?us-ascii?Q?pUqz2WWXA1f+0gjdbio3BSGRLEQHdGEIBjvM99T7+gfHfMz24tNUWvEPLJ9j?=
 =?us-ascii?Q?b7sRsNMDfhv+TrUDNLq96LUNZFZT/pXmaAfFw4z/2JINWRuwYx/UN82rIc6Z?=
 =?us-ascii?Q?TfrjFGXvd7E3meYs8wYp1nGV1qBrMUoPBUS77IOOCn9NsrctEypG+aiPHwm/?=
 =?us-ascii?Q?2KZzJTGVdEG1WIkx9eAx9+SNhYannuksiuh+8XCM/304KfOjjUGzsegB5Ds4?=
 =?us-ascii?Q?/2RSaYy76m4jruA0d66bOfOPZZNUqlQPvK4kuhPxp6RE5NFY+G1EP0RLm8NE?=
 =?us-ascii?Q?sDQ0EWcotg5mE7DZykcGyyJZCW1AiC/5nuYhkQJr2Dlcyk50kDmvkUk5+Y21?=
 =?us-ascii?Q?R4CoglXK9glz++jx3aEbVpjA7T+zcQGewGR+mWHlj3/NQu/Cs53T6VLBcwT3?=
 =?us-ascii?Q?I+knr7nvaGDehVIH3IK+wdrwauhmzXbexWCSfuEeBq/y+hERyzrYXShEoaHM?=
 =?us-ascii?Q?ASLiu4z9+tzm6tff7YNBPOJQT7KfhP5eiC66kOdfxzPt6KcZQQ3lz24AjIDr?=
 =?us-ascii?Q?lBZrc/WTa25loddOrDeibRZ7H7nEuBYu4UItIVSgPF2OI43xaQB7an2UgCeS?=
 =?us-ascii?Q?PI4Qhhq+sVcqKBEORnsKkWMc7n2g7kh0vV95DhlRI6x5uR3p03BLmZRascTr?=
 =?us-ascii?Q?3Eul8Z1seU3Nd01GkzXXV1HMAW4Seo4K1EPJjrNa0c8loFxrGJQm1JUsxsrW?=
 =?us-ascii?Q?Ez5NjlUzANPXA8R6QqhJ1lgf82xD3AFPJZmB+usCyhUBU2Kd/o6+dKAe3pur?=
 =?us-ascii?Q?GYjr+4lRn2HzsvqaUkNKBFNBmxfvjfble5R+8cvqsI0iusIQFkYIFD7PzBXe?=
 =?us-ascii?Q?p7eM+Wk9EHPWtmlnRovTSY9XGIFtRpuHixdWCqEplPn9W3iRbddfX2vy0wln?=
 =?us-ascii?Q?20HVoTqrlbQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LC+08LqQ9BbZSkEYlYOLx49C5RVasys9ne/apL6rwnjIwDl6UoNSGbOMp+hB?=
 =?us-ascii?Q?FDnbwOOpREoQT4QCaI4D4YulbN5TZwbxHvRQs6aWK50UvZetxZtXDGUUzjYF?=
 =?us-ascii?Q?jFAnXgnt8vGoUKjJa+EzmHHfRiUsmDon/1TtEV/EGm5sr0wkwXd/r7ss+jqI?=
 =?us-ascii?Q?qanF8HfQdxcZvsPD8u+IXpznz6mLVnDThBEW+AqjgbqX+KTdGUqeX6fTHmGG?=
 =?us-ascii?Q?JD2403N6HMbfSjX1nsy6+4DGP/wuRSmGg9gwt4d3+QDMXJvva2pavpfMJJMX?=
 =?us-ascii?Q?CsDuWljgfSDF+zD5MV3jXvaRBI6aA1LSEP0ajMtwbFdBweuvBNFKVL8u8HfJ?=
 =?us-ascii?Q?19n333WFUU3xUHrxcNNAM0ACqLfoTfUJb7D4YMB3IFk7z7vxe2Sl90cnRcFs?=
 =?us-ascii?Q?3IZF0ATv29387uE8gn3kfVPHOInuwk/FxI67kWwQgGtLblXT/PCc6BDBRlrH?=
 =?us-ascii?Q?8QS6DEYKa/utoXQTtvYszqN0/kgVpQyUTNVRuJa+qK3TnfFmc8u8ned3oN9a?=
 =?us-ascii?Q?pcB2vuLFa3ZOdjea3bsT2dfyFZ1i86t9nnvE3LmHhAE5SNP1W0ezmYhsZX5v?=
 =?us-ascii?Q?kfAxZVshGnpMqPXmXgemZBgh7dIzSF9P2MYhD9rY0755GPJc+DVx55w1wUAP?=
 =?us-ascii?Q?BbQlp0b1iFlPo93gOr48SGTJPWGyJ99w+x6OvGRQNY8pgNB34vAxr27n8VPU?=
 =?us-ascii?Q?duPt/Sy7cTeo1GzSMe+Tn1E57g4h8oIfrOeVSl1R6HDgDh41AwvNpP+E3iGQ?=
 =?us-ascii?Q?hdCkq7+Sb4sbcBcdR5M5YGawike0wOjYqKSDf6+eu+F0rA/TQXtiEdEhCwPM?=
 =?us-ascii?Q?PJ4A3m2/2Ph1+zNWUoCBrnH2bfQ6xW6E+ldXrbYJZIgVf3ZnW84eBHMlVLtr?=
 =?us-ascii?Q?AgdChojaKRxTzhpB6b4C5aKInD4OyfTCRiBgnwCagcVqsNxldlgRrKXd2U0J?=
 =?us-ascii?Q?jp0nhHelTsZkULq8kKUHxW6Sd9vTGEXFxVr8KqPTH9EuOW0EBIIvfgYygaqV?=
 =?us-ascii?Q?Qbp3yZ6HsxJMFdQlh/QIEalznLdJJAgtVi/HYqhPRm1DL1/Vb1p5+vZ1VeCK?=
 =?us-ascii?Q?iOpDg4C3qskkIUmRK/22Zo9fszOeNubzfJit2TcEGjcRd8ohmM059TYUxCUF?=
 =?us-ascii?Q?uAKZNbclN1SXsRYYnwBtw6D5SkluKzQfVs2K4wiV7Xxv2qpMSAGFc5YyAt1Q?=
 =?us-ascii?Q?kt5lCNCy6Zmi0IfWrZZgVeh14SXyU1M8HwW3tPRevoog5cZt1lul481sKJDS?=
 =?us-ascii?Q?4Bo38bWocE6DR12IUOVRzGXR3leQ6+rJmiUKGyr5zoTzLtz4rKV+TRAvtmhp?=
 =?us-ascii?Q?5rYGdMAo+nsX+cwhILp88Asl6PssFdvMqrMiAg4XDDj2uWAmpNKs27yl1dmG?=
 =?us-ascii?Q?fw2KkVoA4xUdtPmLZ+CiVUEl1InJsnN6dTIBGCzAY6EDiJX5LUiE0TuefILb?=
 =?us-ascii?Q?/mz8wcOh6+Nx8szUBQvJAHzgoOeBN7w9XCplJtCCVSAs4ku8neSnFZAxlGgJ?=
 =?us-ascii?Q?4jbfzzlbTCihJmJKpTzO6orEnfWvl0t1N64oRQHTcYOjCHbY415CuE9a1d4s?=
 =?us-ascii?Q?/knkbbbU2epF57dDIKN9edL1BhMqankYdT0CVFfl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0220d0d-ebac-4005-e97a-08ddb3f79ef1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 14:50:26.4358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSSUaekKZCPn3XVCXzlkZ0rdvhCI81YZXNfZxoHZpusFmJ1/Cp0lRW119toZByDO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8121

On 25 Jun 2025, at 5:52, Lorenzo Stoakes wrote:

> I am doing a great deal of review and getting ever more involved in THP
> with intent to do more so in future also, so add myself as co-maintainer to
> help David with workload.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4b9a4fa905e1..a8a963e530a4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15945,9 +15945,9 @@ F:	mm/swapfile.c
>  MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@redhat.com>
> +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>  R:	Zi Yan <ziy@nvidia.com>
>  R:	Baolin Wang <baolin.wang@linux.alibaba.com>
> -R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>  R:	Liam R. Howlett <Liam.Howlett@oracle.com>
>  R:	Nico Pache <npache@redhat.com>
>  R:	Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
