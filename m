Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EE233993
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751868460; cv=fail; b=oPmhaB9UcrHal7rp/diGsFU9oMZ/KLPNA9pMc0oTwujhFp4rrmiJWQZgZru3l5hnOLSBjJHwvo/jXYYCec1RQEfX678LMnRU9rJJ57oT9q7QcGwGdE1+O+tSm2EsISHSoHvjOn3QdNzIL/7+kI6BxoC3A6urG1ICuGJd/o3D+/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751868460; c=relaxed/simple;
	bh=VtgP1p/YujksVKPMDfV2HATMePsLtpWZsyZd4tVMsug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TO4uETc+bk+1x7m6isLvlbI+KJY2Z1oE4Ak7EYLuNS9PAH2FPdam5dBR6PHSz9m43+nn6+Rj256ftXafOy4RhU1FbLrdHprPvq5wnl048yib9llD5c5NN+SAun+Kol9R17vy4rrYc1kYcXTw+N8BekJ9N0OQSdufF6vS20kUzVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rk6ONyiF reason="signature verification failed"; arc=fail smtp.client-ip=40.107.237.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rk6ONyiF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+07KjWU20VG7Lw9EPPVrve+KIVx/xdpmyZKI+4e/AENHTrIE3L72VwRhgi/bAQmFeHIhdIQ0+VBiOHYr3/CV/oStEKxU2Iad4zqiJjg5LbKtpa3RZMugxGJ/TOpnd/SRs/U3OKJ4Lr+IIF3AooA5c2ZTo0RaUF2MZcyqUgbZI3s/PQXRwK88tAd1H3VUIQo9hNKXm1dZn3z9+iWjFTQMzIiA/Gsw9e1+m3IvD77DKbzKksm70kBHIWy3J9B/PU/1DMkP/58MFZ6MVMMmgWcx3wHTaLs7cJwjPQYDOF9aiheaV51n9LN84dd4t+XLxg2FzQrSqHm7oqqfjB5wLJzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNGQDyXrbBc+yCxUsTQcV4ZAmVCyzBdB+96xdZwBkxM=;
 b=pdQtv25x0B7MTOXAlMM8U+WGaD3RIDwvM0w/QA95Lb56juxK7nOEXqGCzOSqQlHaj7O/ANOvCJZFIhkhf+EnDdUPpjHwL+Yf+BXmorQtCrw88xf2okvVJXLoEiJII7Zu77yxm2fLn8wnWWaFM4q3QwYuwme9fgj3scYTSEHlDjc66GIbIOtUp6grL2CE7r3Of2KylfJWNgJznLhIeivoAlXe6qN4GBUvJ0JbzA1HFr2LSQISpaJsFrVbFk6pc4sHE8tFB5sQuNqOGngbXmIIRl/ef+hPQEs4nX8ugcF9uplzLDWGe+VZ1GEXnYJfPW4sd8yOWhKrdq3znTlzw0/Vhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNGQDyXrbBc+yCxUsTQcV4ZAmVCyzBdB+96xdZwBkxM=;
 b=rk6ONyiFKeH/PoK1TYa2pbyOmm6ZWI0QxgN1ZJQ8QGZF916UiCaqwFTsQpHwSYa+KfywsaaDy8rODHYmAXyKs5TIgy/LYjjyDBb7L/R9b/izjaf9PJ/DMFByEiVUoN2DYclr8wyYDcuy8RwG0I+xSum/uJUs5S41JaS3uTIQIjwQcjc3F/+mh4N2WXaAQ3WdHEeuoo8Bc7FfTaF+fArgsJVpWCw7U+q39l4rq/+V09zav/E4kVAGPJRQ8vAtsRCgGt6vduR7OUvB57Z+G5ipddvOrAUysppqJrBr5OkCwUU+l2Vn5zvGOyh4A4LxUvFg+uZ5d5ulCXMiblaiAW5z/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4184.namprd12.prod.outlook.com (2603:10b6:610:a7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Mon, 7 Jul 2025 06:07:32 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 06:07:32 +0000
Date: Mon, 7 Jul 2025 16:07:24 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>, 
	Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>, 
	Donet Tom <donettom@linux.ibm.com>
Subject: Re: [v1 resend 03/12] mm/thp: zone_device awareness in THP handling
 code
Message-ID: <c65ucmpbzz3rjjlj2pgac4embz3o44r5tb6tjgprfzv5oopcx4@rtburoi377i2>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-4-balbirs@nvidia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703233511.2028395-4-balbirs@nvidia.com>
X-ClientProxiedBy: CH0PR04CA0108.namprd04.prod.outlook.com
 (2603:10b6:610:75::23) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4184:EE_
X-MS-Office365-Filtering-Correlation-Id: 4205210d-5071-42de-f347-08ddbd1c8ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?YWe7l7TEQPUZwxBu6Kf2kVULExd7FUqSLmg241g4kXiBt984WQUurdONSz?=
 =?iso-8859-1?Q?H017SUY2jC1dADsWov9qPafrA5qgsBHtXoLwKGkbQQ2TujSjNS8z24k0+3?=
 =?iso-8859-1?Q?jt9jALJwA+fObzkgO6sCMBBp0LfxfHbXfMxa0Gy4xrP3Pel4LTi0HLZjO0?=
 =?iso-8859-1?Q?V5BNeFXsv/DIlCvTKUrBPlqpNApCiP2XfnmYgPhx9sCQeNfTUKFgmxFVVk?=
 =?iso-8859-1?Q?7S76mS3lEy2JIO7HXt+76QLS+mZQAH3pjT0x2Jz0a1aBs2EiPaWbASMeiE?=
 =?iso-8859-1?Q?ayeJII5/gPAAIiWCZlsCaV8Q5/dcLvLEg0WNrfeyWRgn3qx7c+aEBa6/Tn?=
 =?iso-8859-1?Q?0Mt9nOJ5o2Nyj9k60SUlNxg8fI0JMJYmE6eCuDEjv94oUNUgZrlyMZCSEv?=
 =?iso-8859-1?Q?Xv1Q8GqnviHgKZrCq2nAgZTdHZmfpKM54FMznPcFCVr9pHmQkgHvK3W+NU?=
 =?iso-8859-1?Q?D2c82Qnk4RJGSoq/BIZVYbJSlby1By6fBs60XaBcNe+Hj4mNQwYE7I63SF?=
 =?iso-8859-1?Q?bpeehJ2U+Z4M3xQOFl2ATjNE6wjsR13KYqZeRdMgjbcdvchfwxDvCMoCcx?=
 =?iso-8859-1?Q?pcmyc1jcpRTtcygjUG/+asJuCvROIEA2h1U93Vf2zgP5X+ifIwgXGiscNK?=
 =?iso-8859-1?Q?30wC0+AD8v/bfQE67YIcMorxF7zntMWsxLkFKBlpYBfUObwuyXIyHTxxXU?=
 =?iso-8859-1?Q?ysIJr60rBRqwfFlAE4x/GJ0GWTqATmNm3cHU4+azArvEdWZrJkIiZFlX86?=
 =?iso-8859-1?Q?LnPWTgTePjCuZwn21JRAgBOoYNcRXcEnGsves5W3ZfIEp99dsp4L/eTBPv?=
 =?iso-8859-1?Q?3pyf2xSMrkubtYMYQ/JmsT0TVenlzp6lQw01jgXYzDaX23upnXwaF44Tkj?=
 =?iso-8859-1?Q?jIUSl8a4HzFbdTDt43VfxgFJA3g8DHtpObIsCdl+J6rav28EfhUjheyV64?=
 =?iso-8859-1?Q?Pw7WMzt3WhvzTgevmXcKjGmaVothk562zjH72oPBqlWXdNN1NZn1HxaYt7?=
 =?iso-8859-1?Q?GWnm8Ym9M0bCA8bWPL6I26N5VtMA4e7LSyYqdQ1UMsWo70aG37Y9h1JKpD?=
 =?iso-8859-1?Q?nsafd8XyrHb2x+TR0/2VJwN5PKvwOcQBwwgBsKg2bLNUoLzMbTSDBwXa/Y?=
 =?iso-8859-1?Q?6ieZHxoHttwRonNRHo5qjleJkLN32Rnb9tjihvIJLpu65OzQ/FvGVfc2WQ?=
 =?iso-8859-1?Q?XxsM9J2+ajMycdYy22SxlRMXQIprH7adz8R+n7mY+drhg8sAtJyGuyDP2G?=
 =?iso-8859-1?Q?2DgiKuzrOIEHDWwjplL/FmFjEcqq+LdI9mmP8RLHuj99SKIeuCz+dHRsBn?=
 =?iso-8859-1?Q?a0r60MUgI3KrP2qH5MdjFVUdYbHCeDY4PqWcuJWtSGdDmLSM5jPa3Q7F0R?=
 =?iso-8859-1?Q?n2xu7WK60C6hruPulZXivwqPR2LtTa4I3qCt2Db2AgK8B31XRRztWzMOCs?=
 =?iso-8859-1?Q?DOik87gkdecBAzQgiLBUZ79shdwvJdp3X0gIfjyMoMfhkr1XdlHnhA/ddg?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?caYDgTfDgMR1xi7EububNLSIMoISi/QP+DJ43dsyG++45E75zPuRZkuEew?=
 =?iso-8859-1?Q?Atf4kTqB/ZhuDIFJFJX/3DFTqDSpH53OR+PD9FCrGyIDavvXt9AatVqGZu?=
 =?iso-8859-1?Q?PqpGDRx4qIdx7L44GxJGuHRdwyoP0rvD0YqJlI4oHWxvhA3GbynmjMZl+P?=
 =?iso-8859-1?Q?2WuQKEVsNXXpZqPzltqHTqhFYBe6d6zS5KcRu1jwMshbr8Ukg4QFxrp4Dd?=
 =?iso-8859-1?Q?S+N/wNi5QRW8C4xI7QqkV1Fz4JpVnxCVjMm0X4hZeCODNP7FkTsHeNVCRq?=
 =?iso-8859-1?Q?Q0drotT+5ObOo/UhN8gpHESWy2tz7pKuBA0WfI7Yq7zDjyxzVMm6BxOQbD?=
 =?iso-8859-1?Q?ie4+CSy4/cOjrY6f5Cw5Tx5HAcJekiOE8ElzppC7k59sLFrvx1Qu3kNY6N?=
 =?iso-8859-1?Q?fkoYEpnh2g+EpfG6dcrsntT1BJX9yCUamBq1cuRpJGyj6S6sh8h5/4ZcYr?=
 =?iso-8859-1?Q?L48e4KQYbc9RoI4PmS+lVjC25c2A7uF7pOrnBg5SLvPiq5OtF809PA0kzS?=
 =?iso-8859-1?Q?FcjldM27MUkcWzkQ+JQWeNhXfq5Q2ST90v3FrDhqKDmuh61KdMh/TtwWjh?=
 =?iso-8859-1?Q?Z+tmfqtEhkV6kXScJtbpNhEqV1Nq1JbdFWUzmWIE6FnCYMOXGYmYAuU2jn?=
 =?iso-8859-1?Q?vJlZPhC3LrRPCsvJmL5vMQ/9vPg1wwk2QNz+GJafXSsh/cuWtoE8GV8aOe?=
 =?iso-8859-1?Q?B9gMP9G7VmXWQ1CfPLHLFLdQJAi6f30COJe9zfUdil7Bkk6/QGrqj021dU?=
 =?iso-8859-1?Q?NP/1g83HUN0Scg1ew+rmnJWIhmyEtmT+ERMxvmQTB5o6+uA9AHy00+bvu7?=
 =?iso-8859-1?Q?6gSPmdqe6xAs2Km/ARy+LGObKLYvi+/6W2TkMJws8fD+YQK1qfakS/AZ2K?=
 =?iso-8859-1?Q?dh0lp8dFCr3EBKNX0oxlnwpQmyY+AChMJf7Pz2rOTHqdB+je+Zp4rxJCC4?=
 =?iso-8859-1?Q?5B8t0Z5zbVmk9xcaeCKUisKESLjJ6oOG7MAp5a5+5burZ6hUWHqeUU44qv?=
 =?iso-8859-1?Q?LTar3dLu2RltqyTSdWbSv2LBtXyHdtKGQtK6toImSiKsT28caWq4/ftmdi?=
 =?iso-8859-1?Q?IjgSkMUszk8DxYLtSZ9IzRfqlTo5jIK74jYcBe8eTdxvIA8B4NnNl2PsBP?=
 =?iso-8859-1?Q?h/8qhWW1MW/uj576L5fXUmXmN0a5HaKR9sqJyXO89LIpnzo1U8HUoIpAtj?=
 =?iso-8859-1?Q?I9akbnQceiKHwJP2ehU8QzRHtuiWRlf0yhHIL5gnXMAcor0bozn4mq0QhX?=
 =?iso-8859-1?Q?6A0ULUhOE9EdwO5RYmFO8Bn/wKKdByEgSWh3jllV22CsSFmFr9y4yonxUA?=
 =?iso-8859-1?Q?8vNxtqd95QNGO5/9ZFl0+rIR4+ApdwYA9AwMZTIfDLLrj11YO6pogWupwp?=
 =?iso-8859-1?Q?GuQX2Kpbbs3pPE8d0+RxvHK+5dNd8ARfKjp/0bhdF4TJYLcl0+e/f/ds8u?=
 =?iso-8859-1?Q?3eaxg8YlGqSboHYmES2lOo65RcskhPHZ7iUBtGJ4yuUFRL5Fwd3n1oaGD7?=
 =?iso-8859-1?Q?H/eI6hvXRc+t6Ru50yUa9ObvftUAsS5nzxd6q42pCJ3T3rpR9wLGtGbdHP?=
 =?iso-8859-1?Q?2EyjlLngS7L//KV0074HDKD92KDvV1XB9rBh9wwrHn3YUTLok6Ef2aIltT?=
 =?iso-8859-1?Q?cqv+mn4Uuixgh1w2R+lTYgpiB8OaBPJZXu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4205210d-5071-42de-f347-08ddbd1c8ec1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 06:07:32.6583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quiKi9R/g4sxVmIMCHFJ1ltjmYZEBv4IqjG4uZQCcQEdk2jK+Zul6rykRapr+H9hUVcAS2ZWszkj4KwMiFu8tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4184

On Fri, Jul 04, 2025 at 09:35:02AM +1000, Balbir Singh wrote:
> Make THP handling code in the mm subsystem for THP pages
> aware of zone device pages. Although the code is
> designed to be generic when it comes to handling splitting
> of pages, the code is designed to work for THP page sizes
> corresponding to HPAGE_PMD_NR.
> 
> Modify page_vma_mapped_walk() to return true when a zone
> device huge entry is present, enabling try_to_migrate()
> and other code migration paths to appropriately process the
> entry
> 
> pmd_pfn() does not work well with zone device entries, use
> pfn_pmd_entry_to_swap() for checking and comparison as for
> zone device entries.
> 
> try_to_map_to_unused_zeropage() does not apply to zone device
> entries, zone device entries are ignored in the call.
> 
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: "Jérôme Glisse" <jglisse@redhat.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Jane Chu <jane.chu@oracle.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Donet Tom <donettom@linux.ibm.com>
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>  mm/huge_memory.c     | 153 +++++++++++++++++++++++++++++++------------
>  mm/migrate.c         |   2 +
>  mm/page_vma_mapped.c |  10 +++
>  mm/pgtable-generic.c |   6 ++
>  mm/rmap.c            |  19 +++++-
>  5 files changed, 146 insertions(+), 44 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index ce130225a8e5..e6e390d0308f 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1711,7 +1711,8 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  	if (unlikely(is_swap_pmd(pmd))) {
>  		swp_entry_t entry = pmd_to_swp_entry(pmd);
>  
> -		VM_BUG_ON(!is_pmd_migration_entry(pmd));
> +		VM_BUG_ON(!is_pmd_migration_entry(pmd) &&
> +				!is_device_private_entry(entry));
>  		if (!is_readable_migration_entry(entry)) {
>  			entry = make_readable_migration_entry(
>  							swp_offset(entry));
> @@ -2222,10 +2223,17 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  		} else if (thp_migration_supported()) {
>  			swp_entry_t entry;
>  
> -			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
>  			entry = pmd_to_swp_entry(orig_pmd);
>  			folio = pfn_swap_entry_folio(entry);
>  			flush_needed = 0;
> +
> +			VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
> +					!folio_is_device_private(folio));
> +
> +			if (folio_is_device_private(folio)) {
> +				folio_remove_rmap_pmd(folio, folio_page(folio, 0), vma);
> +				WARN_ON_ONCE(folio_mapcount(folio) < 0);
> +			}
>  		} else
>  			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
>  
> @@ -2247,6 +2255,15 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  				folio_mark_accessed(folio);
>  		}
>  
> +		/*
> +		 * Do a folio put on zone device private pages after
> +		 * changes to mm_counter, because the folio_put() will
> +		 * clean folio->mapping and the folio_test_anon() check
> +		 * will not be usable.
> +		 */
> +		if (folio_is_device_private(folio))
> +			folio_put(folio);
> +
>  		spin_unlock(ptl);
>  		if (flush_needed)
>  			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
> @@ -2375,7 +2392,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  		struct folio *folio = pfn_swap_entry_folio(entry);
>  		pmd_t newpmd;
>  
> -		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
> +		VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
> +			  !folio_is_device_private(folio));
>  		if (is_writable_migration_entry(entry)) {
>  			/*
>  			 * A protection check is difficult so
> @@ -2388,9 +2406,11 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  			newpmd = swp_entry_to_pmd(entry);
>  			if (pmd_swp_soft_dirty(*pmd))
>  				newpmd = pmd_swp_mksoft_dirty(newpmd);
> -		} else {
> +		} else if (is_writable_device_private_entry(entry)) {
> +			newpmd = swp_entry_to_pmd(entry);
> +			entry = make_device_exclusive_entry(swp_offset(entry));

Argh. The naming here is terribly confusing (of which I'm at least partly to
blame) because it ended up clashing with David's PG_anon_exclusive which is a
completely different concept - see 6c287605fd56 ("mm: remember exclusively
mapped anonymous pages with PG_anon_exclusive").

The exclusive entries you are creating here are for emulating atomic access -
see the documentation for make_device_exclusive() for more details - and are
almost certainly not what you want.

As far as I understand things we don't need to create anon exclusive entries for
device private pages because they can never be pinned, so likely you just want
make_readable_device_private_entry() here. If we really want to track anon
exclusive status you probably need pte_swp_exclusive(), but then we should do it
for non-THP device private pages as well and that sounds like a whole different
problem/patch series.

> +		} else
>  			newpmd = *pmd;
> -		}
>  
>  		if (uffd_wp)
>  			newpmd = pmd_swp_mkuffd_wp(newpmd);
> @@ -2842,16 +2862,20 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  	struct page *page;
>  	pgtable_t pgtable;
>  	pmd_t old_pmd, _pmd;
> -	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
> -	bool anon_exclusive = false, dirty = false;
> +	bool young, write, soft_dirty, uffd_wp = false;
> +	bool anon_exclusive = false, dirty = false, present = false;
>  	unsigned long addr;
>  	pte_t *pte;
>  	int i;
> +	swp_entry_t swp_entry;
>  
>  	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
>  	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
>  	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
> -	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
> +
> +	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd)
> +			&& !(is_swap_pmd(*pmd) &&
> +			is_device_private_entry(pmd_to_swp_entry(*pmd))));
>  
>  	count_vm_event(THP_SPLIT_PMD);
>  
> @@ -2899,20 +2923,25 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  		return __split_huge_zero_page_pmd(vma, haddr, pmd);
>  	}
>  
> -	pmd_migration = is_pmd_migration_entry(*pmd);
> -	if (unlikely(pmd_migration)) {
> -		swp_entry_t entry;
>  
> +	present = pmd_present(*pmd);
> +	if (unlikely(!present)) {
> +		swp_entry = pmd_to_swp_entry(*pmd);
>  		old_pmd = *pmd;
> -		entry = pmd_to_swp_entry(old_pmd);
> -		page = pfn_swap_entry_to_page(entry);
> -		write = is_writable_migration_entry(entry);
> +
> +		folio = pfn_swap_entry_folio(swp_entry);
> +		VM_BUG_ON(!is_migration_entry(swp_entry) &&
> +				!is_device_private_entry(swp_entry));
> +		page = pfn_swap_entry_to_page(swp_entry);
> +		write = is_writable_migration_entry(swp_entry);
> +
>  		if (PageAnon(page))
> -			anon_exclusive = is_readable_exclusive_migration_entry(entry);
> -		young = is_migration_entry_young(entry);
> -		dirty = is_migration_entry_dirty(entry);
> +			anon_exclusive =
> +				is_readable_exclusive_migration_entry(swp_entry);
>  		soft_dirty = pmd_swp_soft_dirty(old_pmd);
>  		uffd_wp = pmd_swp_uffd_wp(old_pmd);
> +		young = is_migration_entry_young(swp_entry);
> +		dirty = is_migration_entry_dirty(swp_entry);

This could be a device-private swp_entry right? In which case calling
is_migration_entry_*() on them isn't correct. I suspect you want to have
separate code paths for migration vs. device_private entries here.

>  	} else {
>  		/*
>  		 * Up to this point the pmd is present and huge and userland has
> @@ -2996,30 +3025,45 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  	 * Note that NUMA hinting access restrictions are not transferred to
>  	 * avoid any possibility of altering permissions across VMAs.
>  	 */
> -	if (freeze || pmd_migration) {
> +	if (freeze || !present) {
>  		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
>  			pte_t entry;
> -			swp_entry_t swp_entry;
> -
> -			if (write)
> -				swp_entry = make_writable_migration_entry(
> -							page_to_pfn(page + i));
> -			else if (anon_exclusive)
> -				swp_entry = make_readable_exclusive_migration_entry(
> -							page_to_pfn(page + i));
> -			else
> -				swp_entry = make_readable_migration_entry(
> -							page_to_pfn(page + i));
> -			if (young)
> -				swp_entry = make_migration_entry_young(swp_entry);
> -			if (dirty)
> -				swp_entry = make_migration_entry_dirty(swp_entry);
> -			entry = swp_entry_to_pte(swp_entry);
> -			if (soft_dirty)
> -				entry = pte_swp_mksoft_dirty(entry);
> -			if (uffd_wp)
> -				entry = pte_swp_mkuffd_wp(entry);
> -
> +			if (freeze || is_migration_entry(swp_entry)) {
> +				if (write)
> +					swp_entry = make_writable_migration_entry(
> +								page_to_pfn(page + i));
> +				else if (anon_exclusive)
> +					swp_entry = make_readable_exclusive_migration_entry(
> +								page_to_pfn(page + i));
> +				else
> +					swp_entry = make_readable_migration_entry(
> +								page_to_pfn(page + i));
> +				if (young)
> +					swp_entry = make_migration_entry_young(swp_entry);
> +				if (dirty)
> +					swp_entry = make_migration_entry_dirty(swp_entry);
> +				entry = swp_entry_to_pte(swp_entry);
> +				if (soft_dirty)
> +					entry = pte_swp_mksoft_dirty(entry);
> +				if (uffd_wp)
> +					entry = pte_swp_mkuffd_wp(entry);
> +			} else {
> +				VM_BUG_ON(!is_device_private_entry(swp_entry));
> +				if (write)
> +					swp_entry = make_writable_device_private_entry(
> +								page_to_pfn(page + i));
> +				else if (anon_exclusive)
> +					swp_entry = make_device_exclusive_entry(

As above, you're welcome for the naming :-)

> +								page_to_pfn(page + i));
> +				else
> +					swp_entry = make_readable_device_private_entry(
> +								page_to_pfn(page + i));
> +				entry = swp_entry_to_pte(swp_entry);
> +				if (soft_dirty)
> +					entry = pte_swp_mksoft_dirty(entry);
> +				if (uffd_wp)
> +					entry = pte_swp_mkuffd_wp(entry);
> +			}
>  			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
>  			set_pte_at(mm, addr, pte + i, entry);
>  		}
> @@ -3046,7 +3090,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  	}
>  	pte_unmap(pte);
>  
> -	if (!pmd_migration)
> +	if (present)
>  		folio_remove_rmap_pmd(folio, page, vma);
>  	if (freeze)
>  		put_page(page);
> @@ -3058,8 +3102,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>  			   pmd_t *pmd, bool freeze)
>  {
> +
>  	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
> -	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd))
> +	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd) ||
> +			(is_swap_pmd(*pmd) &&

Should we create is_pmd_device_entry() to match is_pmd_migration_entry()?

> +			is_device_private_entry(pmd_to_swp_entry(*pmd))))
>  		__split_huge_pmd_locked(vma, pmd, address, freeze);
>  }
>  
> @@ -3238,6 +3285,9 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
>  	VM_BUG_ON_FOLIO(folio_test_lru(new_folio), folio);
>  	lockdep_assert_held(&lruvec->lru_lock);
>  
> +	if (folio_is_device_private(folio))
> +		return;
> +
>  	if (list) {
>  		/* page reclaim is reclaiming a huge page */
>  		VM_WARN_ON(folio_test_lru(folio));
> @@ -3252,6 +3302,7 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
>  			list_add_tail(&new_folio->lru, &folio->lru);
>  		folio_set_lru(new_folio);
>  	}
> +
>  }
>  
>  /* Racy check whether the huge page can be split */
> @@ -3543,6 +3594,10 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>  					((mapping || swap_cache) ?
>  						folio_nr_pages(release) : 0));
>  
> +			if (folio_is_device_private(release))
> +				percpu_ref_get_many(&release->pgmap->ref,
> +							(1 << new_order) - 1);

Is there a description somewhere for how we think pgmap->ref works for compound/
higher-order device private pages? Not that it matters too much, I'd like to
remove it. Maybe I can create a patch to do that which you can base on top of.

>  			lru_add_split_folio(origin_folio, release, lruvec,
>  					list);
>  
> @@ -4596,7 +4651,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
>  		return 0;
>  
>  	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
> -	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
> +	if (!folio_is_device_private(folio))
> +		pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
> +	else
> +		pmdval = pmdp_huge_clear_flush(vma, address, pvmw->pmd);

Do we need to flush? A device private entry is already non-present so is the
flush necessary?

>  
>  	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
>  	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
> @@ -4646,6 +4704,17 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
>  	entry = pmd_to_swp_entry(*pvmw->pmd);
>  	folio_get(folio);
>  	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
> +
> +	if (unlikely(folio_is_device_private(folio))) {
> +		if (pmd_write(pmde))
> +			entry = make_writable_device_private_entry(
> +							page_to_pfn(new));
> +		else
> +			entry = make_readable_device_private_entry(
> +							page_to_pfn(new));
> +		pmde = swp_entry_to_pmd(entry);
> +	}
> +
>  	if (pmd_swp_soft_dirty(*pvmw->pmd))
>  		pmde = pmd_mksoft_dirty(pmde);
>  	if (is_writable_migration_entry(entry))
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 767f503f0875..0b6ecf559b22 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -200,6 +200,8 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
>  
>  	if (PageCompound(page))
>  		return false;
> +	if (folio_is_device_private(folio))
> +		return false;
>  	VM_BUG_ON_PAGE(!PageAnon(page), page);
>  	VM_BUG_ON_PAGE(!PageLocked(page), page);
>  	VM_BUG_ON_PAGE(pte_present(ptep_get(pvmw->pte)), page);
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index e981a1a292d2..ff8254e52de5 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -277,6 +277,16 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>  			 * cannot return prematurely, while zap_huge_pmd() has
>  			 * cleared *pmd but not decremented compound_mapcount().
>  			 */
> +			swp_entry_t entry;
> +
> +			if (!thp_migration_supported())
> +				return not_found(pvmw);
> +			entry = pmd_to_swp_entry(pmde);
> +			if (is_device_private_entry(entry)) {
> +				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
> +				return true;

Do other callers of page_vma_mapped_walk() need to be updated now that large
device private pages may be returned?

> +			}
> +
>  			if ((pvmw->flags & PVMW_SYNC) &&
>  			    thp_vma_suitable_order(vma, pvmw->address,
>  						   PMD_ORDER) &&
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index 567e2d084071..604e8206a2ec 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -292,6 +292,12 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
>  		*pmdvalp = pmdval;
>  	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
>  		goto nomap;
> +	if (is_swap_pmd(pmdval)) {
> +		swp_entry_t entry = pmd_to_swp_entry(pmdval);
> +
> +		if (is_device_private_entry(entry))
> +			goto nomap;
> +	}
>  	if (unlikely(pmd_trans_huge(pmdval)))
>  		goto nomap;
>  	if (unlikely(pmd_bad(pmdval))) {
> diff --git a/mm/rmap.c b/mm/rmap.c
> index bd83724d14b6..da1e5b03e1fe 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2336,8 +2336,23 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>  				break;
>  			}
>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> -			subpage = folio_page(folio,
> -				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
> +			/*
> +			 * Zone device private folios do not work well with
> +			 * pmd_pfn() on some architectures due to pte
> +			 * inversion.
> +			 */
> +			if (folio_is_device_private(folio)) {
> +				swp_entry_t entry = pmd_to_swp_entry(*pvmw.pmd);
> +				unsigned long pfn = swp_offset_pfn(entry);
> +
> +				subpage = folio_page(folio, pfn
> +							- folio_pfn(folio));
> +			} else {
> +				subpage = folio_page(folio,
> +							pmd_pfn(*pvmw.pmd)
> +							- folio_pfn(folio));
> +			}
> +
>  			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
>  					!folio_test_pmd_mappable(folio), folio);
>  
> -- 
> 2.49.0
> 
