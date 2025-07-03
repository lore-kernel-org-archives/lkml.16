Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746CD225D6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 05:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751521849; cv=fail; b=HKgdrBB93OiBpVA4pEVZgCUftDCSXt8aEic+ioeiwbIeHGsqNhAQdT3WjXtxRLUklRLayw1MQW3AzQi4hrAdC5vJDivsEl3ma97v6mNsSZbfhnL6zp0ZlBVxCiJkAOneeaK84rNtTNNSaJLaXT7a7zCSgAsORTuFjC7yXbtpnVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751521849; c=relaxed/simple;
	bh=N9yFZY7aYipeKjB1SWOg66wBY4+GkI2NhQD6kbpb1sw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=BqcOnuOSCad4Nd2IsI2bI/p5giimw7ID+BHBqj0bpzuvcZk6HUGnHcaIfExiPGJHduajXdIH9/OG3drVhhZhhLXf8k1+nXCJBC2tFIMWpdfr6kHs++GTTcZmrqw9o50P1ycLyUMCUT/0XSm0tBo0zsfVF17/zKXaKrH7E0cqnpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0EX1Xti; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0EX1Xti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751521842; x=1783057842;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=N9yFZY7aYipeKjB1SWOg66wBY4+GkI2NhQD6kbpb1sw=;
  b=l0EX1XtixU6QxhDOW/nS3F2FTNf6jqDQd/hjIQPhl4gyFKWn/CPciz+E
   X0Qzd7YtrS6W8sUmrOasfVe84xVgMZ4IG0dx+1CT/6e0QPdfbw/s0NdEA
   n33VvBb5epmLMiH6CdDs2Fkc7OO70Uvreav5Znwt4bKjz7EjV/e/ssugv
   TIQ6KJcc7Qy7CS8BUzG0Ky/X5jiqsRGYpecafSVwWGhRGZ9mawQ56mrI2
   AOnCDVDDU+cCtnY7vqGWjDjKRRejcrMCbmnI3Ql+vajvMXuKTAHfbi28r
   05smLQrq5zvDGFVy+n5QR4iIg+E+zLUXhFyhBR4jOZm0IqjXL6v+vr8ms
   Q==;
X-CSE-ConnectionGUID: 0TdJliaoR1SM4WjLb48WvQ==
X-CSE-MsgGUID: cQM830xvS2qz6/8DYlL7yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="76379638"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="76379638"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 22:50:41 -0700
X-CSE-ConnectionGUID: VXTjwkZ1S7yjkCUnS9CbVQ==
X-CSE-MsgGUID: 6MGnIhecQ0upzReZyA7DhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="158550964"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 22:50:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 22:50:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 22:50:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 22:50:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OjsBT33lkEekO0Rz+Ha5D7glpyLEaxBf/GG10UT3JsVG+T1OJVRFWCJbGGbtEWmX+zsClCwxw4J5dmdBy/kWtmjuwzAedxntAOiBODWxbFkjEWk8iEivRX4o9LspxZoZ5ac6PlyHcOCBbox4BcXCJCA7CD0QRayOWu83/mDNCg/B3ISaPKAVkbSJc2mvZgnibs7UPXtkbtfrz5wrMLCZ9DBnbGkTJlPecS5HbPh8m+b6R7Vga2LdTEftr1yAG3fd7uI7rN7LglcoQYMVj+FMHQk8Rj5m5CrmLm/7HJ9cgGO98T9k7sao1WYpyY+NLgaMmL2f+3vKYkZ6aejmDo3S6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fw/z2UOCpOTE8rm8Dwaw1LPb4yIYk2QAOXD6mz8Qe0E=;
 b=ai+6I8x3A58PsDo0PHbOBBDcuuew6tjdjeSjgIsIO5oZ0P5ls9cUTDbRzoBybCKjge5LnHsBw5vgB9MU08qakVJR60z4aysKjuVGp3bYrDXGsA1/Sh77LdSEIXDLUC4j+VuX3Z+wpp2AVAHybUAvJQSRgVc+XBB1jQoqdzcjUAYOHmMk4pZNCUAkSqxnuz86bzk3OLBlfwMZhBgwAATJwNN0/68SuMbupmRX8ddBIvGJolS85GoVh/fiu5Yn2SVTo4fLTNPnyMB85LJkocwqpXcseBWMzZ5nk/iulBdGdoJwO4uYCyaGhcacuY+FRgM5s7HRR1HOAqYU7czkS04Fvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 05:50:05 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 05:50:05 +0000
Date: Thu, 3 Jul 2025 13:49:54 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Nikhil Dhama <nikhil.dhama@amd.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Huang Ying
	<ying.huang@linux.alibaba.com>, Raghavendra K T <raghavendra.kt@amd.com>,
	"Mel Gorman" <mgorman@techsingularity.net>, Bharata B Rao <bharata@amd.com>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linus:master] [mm]  c544a952ba:  netperf.Throughput_Mbps 18.9%
 regression
Message-ID: <202507030638.d8cff1fb-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0045.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::14)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: ff428c76-2b46-4a45-725b-08ddb9f57571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0HZ5eFSAyMGDpcuymmIkMpg1FkYRASYjWghR67Zvx53sF11vpjCT3YViMd?=
 =?iso-8859-1?Q?0keyos0JAHYKWk0zWv2FzKMcEJbPWd+xSUvZcD/YzUFlGiDiBsKTvbxmUA?=
 =?iso-8859-1?Q?h+tqywYAgcNPdcY2CiHi5El9Sato3x9oHdFRYMoLUjQrR0906icM+14HFx?=
 =?iso-8859-1?Q?taatDp/ilUniJxM9JNZDKDIXQoe0qBggJepVY4TsNbysgHfl1C+pbA8nDt?=
 =?iso-8859-1?Q?rL/MXVrw5EpLXWHpPkecDdsXIrZhje33MxvREQVuEVI4CwknJ/UMSQwIsX?=
 =?iso-8859-1?Q?VKAyuDxJi90w7Kt05dC3/7K/wIa7KQoFJppC/1hdKcso2VgiaVOFucggOs?=
 =?iso-8859-1?Q?lTTZwlKoCP8q8TI5E/2cjleFuw4cm0KjyeDXlUgztshrokUdZAvuFiV6Kc?=
 =?iso-8859-1?Q?qbmaQj4cKcOpZBSvVNkyaLWZ0DOIFTbU65yAARQIBJflTGhpQlSj8y/BlC?=
 =?iso-8859-1?Q?SQpNBFqB/0g1l+vJLQcUo/gW7dV01d2YKBiFiubq9fwrooz87QF27UhPc2?=
 =?iso-8859-1?Q?Ubzat5R38h7wn1SJ5hWSuuqV32Bp0c/I79S9x+Ees714awsqdig5U/LjAr?=
 =?iso-8859-1?Q?pTcdUyI09iIJK0lpywATdt4q5G5W/Ul2k1abo9a5vQwyxSaHVcUN+GSbU4?=
 =?iso-8859-1?Q?QnOz4Josx/YoZ7MbrUvdBXM4FI7GzvqhLA0zMNJGXK46b1hpE4qAl6YB9j?=
 =?iso-8859-1?Q?wh/jG/OfmRDZu/l82bptZs8uUAJLgY/4MsrecJafLp9lAqa2Yo57cQl/Pg?=
 =?iso-8859-1?Q?HSEuu4vn/gZNtQfug4Qp15dH3ONGQ2fLwgWN5iDN3SF5yQL6yGeaoxSfnk?=
 =?iso-8859-1?Q?PWBTs/1on/s0D4XJnc/eaaRVUm/2hQYaoD3+/FkHHOtIpgc6IaKB/whObN?=
 =?iso-8859-1?Q?agWEeh2VRZdMkJusDGwv086nDFOmmfj+7U3IOllxSBbcRDRahaDrpJO4S3?=
 =?iso-8859-1?Q?SszE01ZNZ8nHQs/C1w6H8sjJmduQHr9/mwfmY/oEWNYoVxfKwXbh9ihpH1?=
 =?iso-8859-1?Q?J7ss4/emCNsBz2PrLqnYz3bEOIZrMxX2xJ5gGKMu9HgpsbqYkfowT63Qau?=
 =?iso-8859-1?Q?o45wA9H0W5ePQ4wucAUKBbCReoAfbdArNE3VtfGXjR6zszKMvjm0heT9PR?=
 =?iso-8859-1?Q?+YLBIl8Rno4uJo/eUsS8MHl5p1XCbGOeH6dReqXbUc9xWSCM3AK9aCb6cG?=
 =?iso-8859-1?Q?LR6abHE35BWDZAnmn387U5MXS+PtC/UHACzK8wkf+5u10LsF4Uz+G+ftrj?=
 =?iso-8859-1?Q?Er8XA4JxKwvEKGCDG4ZDlKImZJO7Erp3baY7Q9yLnToFiZhme/LgaMQLAf?=
 =?iso-8859-1?Q?hziAGdla2VCyLUsX9Cn2X890NYF9gBi+DP7s4awAQ+yOBhxEWEfyo4zVwP?=
 =?iso-8859-1?Q?RAA85IuhPY2ZT4gSj/6LVsNRksAXW6SuRVdrIVXkKoo1okV3jVFfAhXtsX?=
 =?iso-8859-1?Q?afmD2pJ8SUEet8sM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pxVkPfgwXIzX2bwWBzoueh6NxQi5oL4Q6jZ+eqmo6U43JDuy3HxfTIr2xT?=
 =?iso-8859-1?Q?IIc+baGgT6X2Fho/ka+w0A1mD5cIW6YaKuX+yFUq/ZFMDkdqIeESvAYi1O?=
 =?iso-8859-1?Q?2olgJRN3nn68zA6wdIX1uhnvEVIcA4fOiQp3Ba5nUELnFJqnwBq3tmBhXg?=
 =?iso-8859-1?Q?sOvwslhc7RYr76hlO2fy8mpB0kHtr+Vxqln8LcBmC+Ht7Tf/CtV3mfwgcO?=
 =?iso-8859-1?Q?HX/v0i8xHL8gTbrrc6Ym/YYIuI7qEKroRvByxCDlyAm61V5mM9xj7BqTLx?=
 =?iso-8859-1?Q?T5FjRGHggYtWSH31mckH4IHLgpibCPiVOJNQTdKfXNIChKrajNLzyeVF4a?=
 =?iso-8859-1?Q?xvZIoLy5DHm5MDbAx0ef1KbwxOlOoTF39xmAvhPlbAY1AS+eTrwBcJIKZx?=
 =?iso-8859-1?Q?zftq1UgAXNVUqgUo2f+aR+TroJRJ5kJVzfWN+H0vZ7f2XZPOwUhnyD/nH0?=
 =?iso-8859-1?Q?7CENNKsxVLsAGk67hIVa9PVkVW5eLmAFOyI3vzoKmJdLbl6I9Y283hfofo?=
 =?iso-8859-1?Q?/ISQ99euGcjleWd2iVFoahBBLbSe2kyeC9CSfRedXy4fdjvO/8Zou2Ci06?=
 =?iso-8859-1?Q?sgnefMczeazac62KDx1YMvLvWyeQ3zbMasB8X4mbC4QXJREeCVzZ/wvGsO?=
 =?iso-8859-1?Q?3ZxySFrJO1OMvOQOGAv5xBZ9fznai0HSXXOSRV5dH1B48PCa99zoUbdvia?=
 =?iso-8859-1?Q?DYnTar0xFtMkJ1E2YlcUVaRdaOiDE5g+TCHLn3qXjc+cJDV7jYpCoDqhKz?=
 =?iso-8859-1?Q?2pGXi4JYgAcZGxFKPrQ+VrYjybnO3as7ExukmflEojrXcC42rN46fZY+TJ?=
 =?iso-8859-1?Q?/j4HxNJwhurnBC3gxZlFmXxW+r+S79zAwC2vOlCrEVPeCSn6nhqECAgyGN?=
 =?iso-8859-1?Q?c9K8AvS62y1s3HvA4JSQg0b47ajoeydS08yODAGFT/0CSSNEe8a+62jlJ7?=
 =?iso-8859-1?Q?XR79qJ0XuH09ogw42B4f6VkKZtpxpZ57NUzYjdyffjmIE9sWTqpQ95pJg7?=
 =?iso-8859-1?Q?pZfviQzGF0xMZdasA7lbWfZ9Lz6l9aYLpA9pBOXDZ912um6Wr9x8NUP0T9?=
 =?iso-8859-1?Q?XQmFp7H72HQWzlgS5iDQ64OhrR352J2XesWbjoBLivot/Qm2jhhiBBHYRM?=
 =?iso-8859-1?Q?/C2GDby1qM3//q5WYN4Eu3325FiXE1apySOZaX04VLWcbfQaCQvMPJqFyA?=
 =?iso-8859-1?Q?G/suv0TOWvhiURcioYFbzZHlC43LlTxt1dcX50iIuIr1J2TH53NdHbb0Y/?=
 =?iso-8859-1?Q?6neiyIjI88WcZIUmHZ1qpMdHEpDtDDWN65T8ZHcJYNOf4fWSTV1t0C+/Le?=
 =?iso-8859-1?Q?M3dQbulQOjQHF5Bb3jGKqt/ZnCfyAkVWlY2ORA3l+JfqZIaUvEyH8nZTVw?=
 =?iso-8859-1?Q?t13bckZqwDxs5TTNdg5n2PJvSGzYfZB2hony7VJ77htk06Bxtk/y3KoocC?=
 =?iso-8859-1?Q?e4nXQZsTuj3C0TajpvyMtsP2EYmfLI1ECzuwyFMXJv0kbY06sI43Aov3md?=
 =?iso-8859-1?Q?nsRkJO1oCVKqVaj2dWfb4YUPXMYt82r5RwQ2Z0xJ34PiZO4dt/4lxhuqCt?=
 =?iso-8859-1?Q?ISFUpIbV7XvvrK31S6Yb42uMwNAkmolkJ5jvPamgGaXtNASRf6jKK3wmRl?=
 =?iso-8859-1?Q?EH+o2PPsBuhSb2DtC0EqC9sdVRnaBrzh7bmPwouXkXTOlq5kNwI5lrsg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff428c76-2b46-4a45-725b-08ddb9f57571
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 05:50:05.2266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LqJM9g9pDKHRGMh2AyfueYUZQkQChizZ83lJd7JSw7ZW3F8HTqdmYjvSOQuhdU50zz2shm9Uz7UIkvV+ExeEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
X-OriginatorOrg: intel.com


Hello,


we reported
"[linus:master] [mm]  c544a952ba:  vm-scalability.throughput 33.3% improvement"
in
https://lore.kernel.org/all/202506121415.eeceda1d-lkp@intel.com/

now we captured a netperf regression on a Core machine.

we don't have enough knowledge if this is a tradeoff, just make out this report
FYI.


kernel test robot noticed a 18.9% regression of netperf.Throughput_Mbps on:


commit: c544a952ba61b1a025455098033c17e0573ab085 ("mm: pcp: increase pcp->free_count threshold to trigger free_high")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      66701750d5565c574af42bef0b789ce0203e3071]
[still regression on linux-next/master 3f804361f3b9af33e00b90ec9cb5afcc96831e60]

testcase: netperf
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake) with 32G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 1
	cluster: cs-localhost
	test: UDP_STREAM
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.mlockmany.ops_per_sec 26.2% improvement                                |
| test machine     | 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=mlockmany                                                                              |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202507030638.d8cff1fb-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250703/202507030638.d8cff1fb-lkp@intel.com

=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-rhel-9.4/1/debian-12-x86_64-20240206.cgz/300s/lkp-skl-d05/UDP_STREAM/netperf

commit: 
  05275594a3 ("mm/hugetlb: convert use of struct page to folio in __unmap_hugepage_range()")
  c544a952ba ("mm: pcp: increase pcp->free_count threshold to trigger free_high")

05275594a311cd74 c544a952ba61b1a025455098033 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   9598254 ±  2%    +120.3%   21149239 ±  2%  cpuidle..usage
      0.74 ±  2%      +0.3        1.03        mpstat.cpu.all.irq%
     13.83 ± 30%   +1916.9%     279.00 ±  6%  perf-c2c.DRAM.local
   5565599           +43.0%    7960473        sched_debug.cpu.nr_switches.avg
    147281           +43.9%     211941        vmstat.system.cs
     41295 ±  2%     +26.1%      52074 ±  2%  vmstat.system.in
   4579072           +13.4%    5192396 ±  2%  meminfo.Memused
    184905           +33.6%     247093        meminfo.Shmem
   4847053 ±  3%     +30.6%    6327984 ±  2%  meminfo.max_used_kB
    173195           -18.9%     140491        netperf.ThroughputBoth_Mbps
    173195           -18.9%     140491        netperf.ThroughputBoth_total_Mbps
     86581           -18.9%      70215        netperf.ThroughputRecv_Mbps
     86581           -18.9%      70215        netperf.ThroughputRecv_total_Mbps
     86614           -18.9%      70276        netperf.Throughput_Mbps
     86614           -18.9%      70276        netperf.Throughput_total_Mbps
  99147409           -18.9%   80425670        netperf.workload
    213873            +7.3%     229425        proc-vmstat.nr_active_anon
    696762            -2.2%     681377        proc-vmstat.nr_dirty_background_threshold
   1395229            -2.2%    1364421        proc-vmstat.nr_dirty_threshold
    927101            +1.7%     942622        proc-vmstat.nr_file_pages
   7042884            -2.2%    6888804        proc-vmstat.nr_free_pages
   7004908            -3.9%    6728519        proc-vmstat.nr_free_pages_blocks
     46218           +33.6%      61753        proc-vmstat.nr_shmem
    213873            +7.3%     229425        proc-vmstat.nr_zone_active_anon
  99843328           -18.4%   81500007        proc-vmstat.numa_hit
 1.006e+08           -18.8%   81672733        proc-vmstat.numa_local
 7.936e+08           -18.9%  6.437e+08        proc-vmstat.pgalloc_normal
 7.935e+08           -18.9%  6.436e+08        proc-vmstat.pgfree
      0.39 ± 38%  +14026.8%      55.29 ±  2%  perf-stat.i.MPKI
      1.71 ±  2%      +0.1        1.84 ±  2%  perf-stat.i.branch-miss-rate%
      0.40 ± 39%     +16.3       16.68 ±  2%  perf-stat.i.cache-miss-rate%
   1816975 ±  4%   +9020.7%  1.657e+08 ±  2%  perf-stat.i.cache-misses
 1.199e+09           -16.3%  1.003e+09        perf-stat.i.cache-references
    148691           +44.1%     214192        perf-stat.i.context-switches
      2.31            +3.1%       2.38        perf-stat.i.cpi
     17.83 ±  5%     +19.5%      21.30 ±  6%  perf-stat.i.cpu-migrations
     17472 ±  5%     -99.7%      45.86 ±  2%  perf-stat.i.cycles-between-cache-misses
      0.45            -2.8%       0.44        perf-stat.i.ipc
     37.20           +44.0%      53.58        perf-stat.i.metric.K/sec
      4028 ±  5%     -99.1%      36.71 ± 44%  perf-stat.overall.cycles-between-cache-misses
      0.46           -19.0%       0.38 ± 44%  perf-stat.overall.ipc
 1.195e+09           -30.2%  8.334e+08 ± 44%  perf-stat.ps.cache-references
      0.02 ± 22%     +46.2%       0.03 ± 15%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.02 ± 20%    +150.4%       0.05 ± 56%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.02 ± 38%     +89.7%       0.03 ± 21%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.46 ± 60%     +75.0%       0.80 ± 29%  perf-sched.sch_delay.max.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      0.03 ± 22%    +151.1%       0.08 ± 65%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.03 ± 28%     +70.9%       0.05 ±  8%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.05 ±  4%     +25.5%       0.07 ±  8%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.76 ±  2%     -26.2%       0.56 ±  2%  perf-sched.total_wait_and_delay.average.ms
    182104 ±  2%     +38.4%     251957        perf-sched.total_wait_and_delay.count.ms
      2232 ± 14%     +19.8%       2674 ± 22%  perf-sched.total_wait_and_delay.max.ms
      0.76 ±  2%     -26.2%       0.56 ±  2%  perf-sched.total_wait_time.average.ms
      2232 ± 14%     +19.8%       2674 ± 22%  perf-sched.total_wait_time.max.ms
    126.76           -22.7%      97.96        perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
    132.33           +29.5%     171.33        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
    179794 ±  2%     +38.8%     249629        perf-sched.wait_and_delay.count.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg
    126.75           -22.7%      97.96        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      4.87 ±111%     +49.3%       7.26 ± 81%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     92.03            -4.6       87.41        perf-profile.calltrace.cycles-pp.main
     41.96            -4.5       37.45        perf-profile.calltrace.cycles-pp.recvfrom.recv_omni.process_requests.spawn_child.accept_connection
     42.50            -4.5       38.02        perf-profile.calltrace.cycles-pp.accept_connection.accept_connections.main
     42.50            -4.5       38.02        perf-profile.calltrace.cycles-pp.accept_connections.main
     42.50            -4.5       38.02        perf-profile.calltrace.cycles-pp.process_requests.spawn_child.accept_connection.accept_connections.main
     42.49            -4.5       38.02        perf-profile.calltrace.cycles-pp.recv_omni.process_requests.spawn_child.accept_connection.accept_connections
     42.50            -4.5       38.02        perf-profile.calltrace.cycles-pp.spawn_child.accept_connection.accept_connections.main
     23.28            -3.9       19.36        perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.udp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
     23.26            -3.9       19.35        perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.udp_recvmsg.inet_recvmsg.sock_recvmsg
     22.25            -3.8       18.46        perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.udp_recvmsg.inet_recvmsg
     21.91            -3.7       18.17        perf-profile.calltrace.cycles-pp.rep_movs_alternative._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.udp_recvmsg
     36.57            -3.7       32.91        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.recvfrom.recv_omni.process_requests.spawn_child
     33.82            -3.5       30.37        perf-profile.calltrace.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvfrom.recv_omni
     33.74            -3.4       30.30        perf-profile.calltrace.cycles-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvfrom
     32.73            -3.3       29.42        perf-profile.calltrace.cycles-pp.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
     34.60            -3.3       31.30        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvfrom.recv_omni.process_requests
     32.64            -3.3       29.34        perf-profile.calltrace.cycles-pp.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64
     32.52            -3.2       29.27        perf-profile.calltrace.cycles-pp.udp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
      2.76            -0.5        2.22 ±  2%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.recvfrom.recv_omni.process_requests.spawn_child
      2.83            -0.5        2.31 ±  3%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.sendto.send_omni_inner.send_udp_stream.main
      0.67 ±  8%      -0.4        0.28 ±100%  perf-profile.calltrace.cycles-pp._raw_spin_trylock.__free_frozen_pages.skb_release_data.__consume_stateless_skb.udp_recvmsg
      1.40 ±  4%      -0.3        1.12 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.recvfrom.recv_omni.process_requests.spawn_child
      0.65 ±  4%      -0.2        0.46 ± 45%  perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.udp_recvmsg.inet_recvmsg
      0.62 ±  4%      -0.2        0.44 ± 45%  perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.udp_recvmsg
      1.47 ±  3%      -0.2        1.31 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.sendto.send_omni_inner.send_udp_stream.main
      1.00 ±  5%      -0.2        0.84 ±  2%  perf-profile.calltrace.cycles-pp.ip_route_output_flow.udp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
      1.03 ±  6%      -0.2        0.88 ±  4%  perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.__ip_append_data.ip_make_skb.udp_sendmsg.__sys_sendto
     49.52            -0.1       49.38        perf-profile.calltrace.cycles-pp.send_omni_inner.send_udp_stream.main
     49.53            -0.1       49.39        perf-profile.calltrace.cycles-pp.send_udp_stream.main
      0.77 ±  5%      -0.1        0.66 ±  4%  perf-profile.calltrace.cycles-pp.ip_route_output_key_hash_rcu.ip_route_output_flow.udp_sendmsg.__sys_sendto.__x64_sys_sendto
      0.64 ±  3%      -0.1        0.53 ±  2%  perf-profile.calltrace.cycles-pp.udp_rmem_release.__skb_recv_udp.udp_recvmsg.inet_recvmsg.sock_recvmsg
     49.07            -0.1       48.99        perf-profile.calltrace.cycles-pp.sendto.send_omni_inner.send_udp_stream.main
      0.60 ±  5%      +0.1        0.72 ±  6%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvfrom.recv_omni
      2.19 ±  2%      +0.2        2.36 ±  5%  perf-profile.calltrace.cycles-pp.__free_frozen_pages.skb_release_data.__consume_stateless_skb.udp_recvmsg.inet_recvmsg
      0.74 ±  5%      +0.2        0.90 ±  5%  perf-profile.calltrace.cycles-pp.dl_server_stop.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule
      5.85 ±  2%      +0.2        6.06        perf-profile.calltrace.cycles-pp.net_rx_action.handle_softirqs.do_softirq.__local_bh_enable_ip.__dev_queue_xmit
      0.47 ± 45%      +0.2        0.68 ±  8%  perf-profile.calltrace.cycles-pp.ttwu_queue_wakelist.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_sync_key
      5.57 ±  2%      +0.2        5.80        perf-profile.calltrace.cycles-pp.__napi_poll.net_rx_action.handle_softirqs.do_softirq.__local_bh_enable_ip
      5.54 ±  2%      +0.2        5.78 ±  2%  perf-profile.calltrace.cycles-pp.process_backlog.__napi_poll.net_rx_action.handle_softirqs.do_softirq
      1.06 ±  4%      +0.2        1.30        perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule
      5.22 ±  2%      +0.3        5.48 ±  2%  perf-profile.calltrace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action.handle_softirqs
      4.61 ±  2%      +0.3        4.92 ±  2%  perf-profile.calltrace.cycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog.__napi_poll
      4.62 ±  2%      +0.3        4.94 ±  2%  perf-profile.calltrace.cycles-pp.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action
      4.44 ±  2%      +0.3        4.77 ±  2%  perf-profile.calltrace.cycles-pp.__udp4_lib_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog
      0.66 ± 14%      +0.3        1.00 ± 17%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle
      3.89 ±  3%      +0.4        4.29 ±  3%  perf-profile.calltrace.cycles-pp.udp_queue_rcv_one_skb.udp_unicast_rcv_skb.__udp4_lib_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish
      3.96 ±  3%      +0.4        4.36 ±  3%  perf-profile.calltrace.cycles-pp.udp_unicast_rcv_skb.__udp4_lib_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core
      0.54 ± 46%      +0.4        0.95 ± 17%  perf-profile.calltrace.cycles-pp.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue
      0.84 ±  2%      +0.4        1.27 ±  7%  perf-profile.calltrace.cycles-pp.free_frozen_page_commit.__free_frozen_pages.skb_release_data.__consume_stateless_skb.udp_recvmsg
      2.03 ±  4%      +0.4        2.48 ±  2%  perf-profile.calltrace.cycles-pp.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule.schedule
      2.30 ±  6%      +0.5        2.76 ±  5%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_sync_key.sock_def_readable.__udp_enqueue_schedule_skb.udp_queue_rcv_one_skb
      2.16 ±  7%      +0.5        2.62 ±  5%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_readable
      2.13 ±  4%      +0.5        2.60        perf-profile.calltrace.cycles-pp.dequeue_task_fair.try_to_block_task.__schedule.schedule.schedule_timeout
      1.92            +0.5        2.39 ±  5%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill.__ip_append_data
      2.24 ±  3%      +0.5        2.72        perf-profile.calltrace.cycles-pp.try_to_block_task.__schedule.schedule.schedule_timeout.__skb_wait_for_more_packets
      0.08 ±223%      +0.5        0.56 ±  8%  perf-profile.calltrace.cycles-pp.__free_one_page.free_pcppages_bulk.free_frozen_page_commit.__free_frozen_pages.skb_release_data
      1.96 ±  2%      +0.5        2.44 ±  5%  perf-profile.calltrace.cycles-pp.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill.__ip_append_data.ip_make_skb
      0.69 ±  3%      +0.5        1.17 ±  9%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_frozen_page_commit.__free_frozen_pages.skb_release_data.__consume_stateless_skb
      2.19 ±  7%      +0.5        2.67 ±  5%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_readable.__udp_enqueue_schedule_skb
      2.44 ±  5%      +0.5        2.92 ±  4%  perf-profile.calltrace.cycles-pp.__wake_up_sync_key.sock_def_readable.__udp_enqueue_schedule_skb.udp_queue_rcv_one_skb.udp_unicast_rcv_skb
      1.77 ±  2%      +0.5        2.27 ±  5%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill
      3.34 ±  3%      +0.5        3.84 ±  3%  perf-profile.calltrace.cycles-pp.__udp_enqueue_schedule_skb.udp_queue_rcv_one_skb.udp_unicast_rcv_skb.__udp4_lib_rcv.ip_protocol_deliver_rcu
      0.78 ± 13%      +0.5        1.29 ± 11%  perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry
      2.62 ±  4%      +0.6        3.18 ±  4%  perf-profile.calltrace.cycles-pp.sock_def_readable.__udp_enqueue_schedule_skb.udp_queue_rcv_one_skb.udp_unicast_rcv_skb.__udp4_lib_rcv
      2.34            +0.6        2.90 ±  3%  perf-profile.calltrace.cycles-pp.sk_page_frag_refill.__ip_append_data.ip_make_skb.udp_sendmsg.__sys_sendto
      1.50 ±  2%      +0.6        2.06 ±  6%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill
      2.30 ±  2%      +0.6        2.86 ±  3%  perf-profile.calltrace.cycles-pp.skb_page_frag_refill.sk_page_frag_refill.__ip_append_data.ip_make_skb.udp_sendmsg
      1.04 ±  2%      +0.6        1.68 ±  6%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof
      0.58 ±  4%      +0.7        1.24 ±  8%  perf-profile.calltrace.cycles-pp.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof
      0.72 ±  2%      +0.7        1.38 ±  7%  perf-profile.calltrace.cycles-pp.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol
     43.98            +0.7       44.68        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sendto.send_omni_inner.send_udp_stream.main
     25.36            +0.8       26.16        perf-profile.calltrace.cycles-pp.ip_generic_getfrag.__ip_append_data.ip_make_skb.udp_sendmsg.__sys_sendto
      5.49 ±  2%      +0.8        6.30        perf-profile.calltrace.cycles-pp.__skb_recv_udp.udp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
      3.44 ±  3%      +0.8        4.26 ±  2%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp
     24.94            +0.8       25.78        perf-profile.calltrace.cycles-pp._copy_from_iter.ip_generic_getfrag.__ip_append_data.ip_make_skb.udp_sendmsg
      3.55 ±  4%      +0.8        4.40 ±  2%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg
     24.34            +0.9       25.20        perf-profile.calltrace.cycles-pp.rep_movs_alternative._copy_from_iter.ip_generic_getfrag.__ip_append_data.ip_make_skb
      3.67 ±  3%      +0.9        4.55 ±  2%  perf-profile.calltrace.cycles-pp.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg.inet_recvmsg
      4.08 ±  3%      +1.0        5.09 ±  2%  perf-profile.calltrace.cycles-pp.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg.inet_recvmsg.sock_recvmsg
     41.97            +1.0       43.01        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendto.send_omni_inner.send_udp_stream
     41.63            +1.1       42.73        perf-profile.calltrace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendto.send_omni_inner
     41.58            +1.1       42.69        perf-profile.calltrace.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendto
     40.72            +1.3       41.97        perf-profile.calltrace.cycles-pp.udp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
     30.65            +1.5       32.10        perf-profile.calltrace.cycles-pp.ip_make_skb.udp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
     30.04            +1.5       31.57        perf-profile.calltrace.cycles-pp.__ip_append_data.ip_make_skb.udp_sendmsg.__sys_sendto.__x64_sys_sendto
      0.93 ±115%      +1.7        2.65 ± 42%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      1.29 ±100%      +1.9        3.18 ± 42%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.84 ± 10%      +2.3        4.18 ± 11%  perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      2.28 ± 10%      +2.8        5.09 ±  9%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      7.10 ±  3%      +4.4       11.48 ±  3%  perf-profile.calltrace.cycles-pp.common_startup_64
     92.05            -4.6       87.45        perf-profile.children.cycles-pp.main
     42.10            -4.5       37.58        perf-profile.children.cycles-pp.recvfrom
     42.50            -4.5       38.02        perf-profile.children.cycles-pp.accept_connection
     42.50            -4.5       38.02        perf-profile.children.cycles-pp.accept_connections
     42.50            -4.5       38.02        perf-profile.children.cycles-pp.process_requests
     42.50            -4.5       38.02        perf-profile.children.cycles-pp.spawn_child
     42.50            -4.5       38.02        perf-profile.children.cycles-pp.recv_omni
     23.29            -3.9       19.37        perf-profile.children.cycles-pp.skb_copy_datagram_iter
     23.26            -3.9       19.35        perf-profile.children.cycles-pp.__skb_datagram_iter
     22.29            -3.8       18.50        perf-profile.children.cycles-pp._copy_to_iter
     33.83            -3.5       30.38        perf-profile.children.cycles-pp.__x64_sys_recvfrom
     33.76            -3.4       30.31        perf-profile.children.cycles-pp.__sys_recvfrom
     32.73            -3.3       29.42        perf-profile.children.cycles-pp.sock_recvmsg
     32.64            -3.3       29.34        perf-profile.children.cycles-pp.inet_recvmsg
     32.52            -3.3       29.27        perf-profile.children.cycles-pp.udp_recvmsg
     81.08            -2.9       78.18        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     46.43            -2.8       43.59        perf-profile.children.cycles-pp.rep_movs_alternative
     76.92            -2.2       74.71        perf-profile.children.cycles-pp.do_syscall_64
      5.66            -1.1        4.60 ±  2%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      3.08 ±  2%      -0.5        2.60 ±  3%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.35            -0.2        1.11 ±  3%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.87 ±  6%      -0.2        0.70 ±  9%  perf-profile.children.cycles-pp._raw_spin_trylock
      1.04            -0.2        0.89 ±  6%  perf-profile.children.cycles-pp.__check_object_size
      1.00 ±  5%      -0.2        0.84 ±  2%  perf-profile.children.cycles-pp.ip_route_output_flow
      1.03 ±  6%      -0.1        0.88 ±  4%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
     49.52            -0.1       49.38        perf-profile.children.cycles-pp.send_omni_inner
      0.83 ±  2%      -0.1        0.69 ±  7%  perf-profile.children.cycles-pp.check_heap_object
     49.53            -0.1       49.39        perf-profile.children.cycles-pp.send_udp_stream
      0.78 ±  5%      -0.1        0.66 ±  4%  perf-profile.children.cycles-pp.ip_route_output_key_hash_rcu
      0.54 ±  9%      -0.1        0.43 ±  6%  perf-profile.children.cycles-pp.fdget
      0.66 ±  4%      -0.1        0.54 ±  6%  perf-profile.children.cycles-pp.simple_copy_to_iter
     49.22            -0.1       49.11        perf-profile.children.cycles-pp.sendto
      0.64 ±  3%      -0.1        0.53 ±  2%  perf-profile.children.cycles-pp.udp_rmem_release
      0.22 ± 10%      -0.1        0.12 ± 11%  perf-profile.children.cycles-pp.__mod_zone_page_state
      0.70 ±  5%      -0.1        0.61 ±  6%  perf-profile.children.cycles-pp.kmem_cache_free
      0.48 ±  4%      -0.1        0.40 ±  7%  perf-profile.children.cycles-pp.__ip_make_skb
      0.47 ±  5%      -0.1        0.41 ±  5%  perf-profile.children.cycles-pp.__slab_free
      0.28 ±  8%      -0.1        0.23 ±  4%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.31 ± 11%      -0.1        0.26 ±  7%  perf-profile.children.cycles-pp.__udp4_lib_lookup
      0.22 ±  4%      -0.0        0.18 ±  8%  perf-profile.children.cycles-pp.skb_set_owner_w
      0.22 ±  3%      -0.0        0.18 ±  7%  perf-profile.children.cycles-pp.refill_stock
      0.16 ±  5%      -0.0        0.13 ±  7%  perf-profile.children.cycles-pp.drain_stock
      0.11 ±  7%      -0.0        0.08 ± 11%  perf-profile.children.cycles-pp._copy_to_user
      0.12 ±  7%      -0.0        0.10 ±  4%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.07 ± 14%      +0.0        0.09 ± 10%  perf-profile.children.cycles-pp.put_prev_task_fair
      0.06 ±  7%      +0.0        0.08 ±  8%  perf-profile.children.cycles-pp.rb_next
      0.05 ±  8%      +0.0        0.07 ± 15%  perf-profile.children.cycles-pp.delay_tsc
      0.06 ±  7%      +0.0        0.09 ± 12%  perf-profile.children.cycles-pp.put_prev_task_idle
      0.06 ±  9%      +0.0        0.08 ± 13%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.03 ± 70%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.update_min_vruntime
      0.12 ±  9%      +0.0        0.16 ± 11%  perf-profile.children.cycles-pp.update_cfs_group
      0.11 ± 10%      +0.0        0.14 ± 11%  perf-profile.children.cycles-pp.os_xsave
      0.08 ± 13%      +0.0        0.11 ±  6%  perf-profile.children.cycles-pp.timerqueue_del
      0.06 ±  7%      +0.0        0.10 ± 13%  perf-profile.children.cycles-pp.get_cpu_device
      0.08 ± 16%      +0.0        0.12 ± 12%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.18 ±  7%      +0.0        0.22 ±  6%  perf-profile.children.cycles-pp.prepare_to_wait_exclusive
      0.03 ±100%      +0.0        0.07 ±  9%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.06 ± 11%      +0.0        0.11 ± 23%  perf-profile.children.cycles-pp.x64_sys_call
      0.03 ±100%      +0.0        0.07 ± 17%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.09 ±  5%      +0.0        0.13 ± 10%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.20 ±  4%      +0.0        0.25 ±  3%  perf-profile.children.cycles-pp.task_contending
      0.14 ± 10%      +0.0        0.18 ±  6%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.18 ±  7%      +0.0        0.22 ±  4%  perf-profile.children.cycles-pp.avg_vruntime
      0.06 ±  6%      +0.1        0.11 ± 11%  perf-profile.children.cycles-pp.sched_tick
      0.13 ±  8%      +0.1        0.18 ±  5%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.21 ±  5%      +0.1        0.26 ±  5%  perf-profile.children.cycles-pp.update_entity_lag
      0.11 ±  4%      +0.1        0.16 ± 13%  perf-profile.children.cycles-pp.rseq_update_cpu_node_id
      0.01 ±223%      +0.1        0.06 ± 17%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.sched_balance_update_blocked_averages
      0.08 ±  8%      +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.llist_reverse_order
      0.14 ±  8%      +0.1        0.20 ±  5%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.get_nohz_timer_target
      0.00            +0.1        0.06 ± 30%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.00            +0.1        0.06 ± 30%  perf-profile.children.cycles-pp.do_exit
      0.00            +0.1        0.06 ± 30%  perf-profile.children.cycles-pp.do_group_exit
      0.16 ± 15%      +0.1        0.22 ± 11%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.01 ±223%      +0.1        0.07 ± 27%  perf-profile.children.cycles-pp.switch_fpu_return
      0.06 ± 45%      +0.1        0.12 ± 17%  perf-profile.children.cycles-pp.available_idle_cpu
      0.02 ±141%      +0.1        0.08 ± 22%  perf-profile.children.cycles-pp.__enqueue_entity
      0.18 ±  8%      +0.1        0.24 ± 11%  perf-profile.children.cycles-pp.update_rq_clock
      0.13 ±  9%      +0.1        0.19 ±  6%  perf-profile.children.cycles-pp.tick_nohz_idle_enter
      0.41 ±  5%      +0.1        0.48 ±  3%  perf-profile.children.cycles-pp.native_sched_clock
      0.01 ±223%      +0.1        0.08 ± 19%  perf-profile.children.cycles-pp.intel_idle
      0.12 ± 12%      +0.1        0.19 ± 24%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.08 ± 13%      +0.1        0.16 ± 16%  perf-profile.children.cycles-pp.tick_nohz_idle_exit
      0.18 ± 16%      +0.1        0.26 ±  9%  perf-profile.children.cycles-pp.llist_add_batch
      0.33 ±  4%      +0.1        0.41 ±  2%  perf-profile.children.cycles-pp.prepare_task_switch
      0.48 ±  5%      +0.1        0.56 ±  8%  perf-profile.children.cycles-pp.__free_one_page
      0.30 ±  7%      +0.1        0.39 ±  3%  perf-profile.children.cycles-pp.hrtimer_try_to_cancel
      0.41 ±  7%      +0.1        0.50 ±  5%  perf-profile.children.cycles-pp.update_curr
      0.10 ±  8%      +0.1        0.18 ±  8%  perf-profile.children.cycles-pp.io_serial_in
      0.26 ±  5%      +0.1        0.35 ±  5%  perf-profile.children.cycles-pp.__switch_to
      0.75 ±  4%      +0.1        0.84 ±  5%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.26 ± 16%      +0.1        0.36 ±  7%  perf-profile.children.cycles-pp.select_task_rq
      0.19 ± 20%      +0.1        0.29 ±  9%  perf-profile.children.cycles-pp.nohz_run_idle_balance
      0.08 ±  8%      +0.1        0.18 ± 10%  perf-profile.children.cycles-pp.update_process_times
      0.37 ±  8%      +0.1        0.48 ±  4%  perf-profile.children.cycles-pp.set_next_entity
      0.35 ±  4%      +0.1        0.46 ±  5%  perf-profile.children.cycles-pp.start_dl_timer
      0.30 ± 10%      +0.1        0.41 ± 10%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.15 ±  3%      +0.1        0.26 ±  8%  perf-profile.children.cycles-pp.wait_for_lsr
      0.32 ±  6%      +0.1        0.43 ±  5%  perf-profile.children.cycles-pp.__switch_to_asm
      0.15            +0.1        0.26 ±  6%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.15            +0.1        0.26 ±  6%  perf-profile.children.cycles-pp._printk
      0.15            +0.1        0.26 ±  6%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.15            +0.1        0.26 ±  6%  perf-profile.children.cycles-pp.console_flush_all
      0.15            +0.1        0.26 ±  6%  perf-profile.children.cycles-pp.console_unlock
      0.15            +0.1        0.26 ±  6%  perf-profile.children.cycles-pp.irq_work_run
      0.15            +0.1        0.26 ±  6%  perf-profile.children.cycles-pp.irq_work_run_list
      0.15            +0.1        0.26 ±  6%  perf-profile.children.cycles-pp.serial8250_console_write
      0.15            +0.1        0.26 ±  6%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.15            +0.1        0.26 ±  6%  perf-profile.children.cycles-pp.vprintk_emit
      0.28 ±  9%      +0.1        0.39 ± 10%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.22 ±  9%      +0.1        0.33 ±  6%  perf-profile.children.cycles-pp.read_tsc
      0.55 ±  8%      +0.1        0.68 ±  8%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.63 ±  6%      +0.1        0.77 ±  6%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.10 ± 13%      +0.2        0.26 ±  6%  perf-profile.children.cycles-pp.tick_nohz_handler
      2.22 ±  2%      +0.2        2.38 ±  5%  perf-profile.children.cycles-pp.__free_frozen_pages
      0.48 ±  5%      +0.2        0.65 ±  4%  perf-profile.children.cycles-pp.set_next_task_fair
      0.36 ±  5%      +0.2        0.52 ±  5%  perf-profile.children.cycles-pp.ktime_get
      0.12 ± 10%      +0.2        0.30 ±  5%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.75 ±  5%      +0.2        0.92 ±  4%  perf-profile.children.cycles-pp.dl_server_stop
      0.34 ±  2%      +0.2        0.52 ±  6%  perf-profile.children.cycles-pp.menu_select
      0.15 ± 12%      +0.2        0.36 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      5.86 ±  2%      +0.2        6.06        perf-profile.children.cycles-pp.net_rx_action
      0.62 ±  5%      +0.2        0.83 ±  3%  perf-profile.children.cycles-pp.enqueue_dl_entity
      0.54 ±  6%      +0.2        0.75 ±  5%  perf-profile.children.cycles-pp.enqueue_entity
      0.66 ±  4%      +0.2        0.87 ±  3%  perf-profile.children.cycles-pp.dl_server_start
      0.16 ±  9%      +0.2        0.38 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.56 ±  4%      +0.2        0.78 ±  2%  perf-profile.children.cycles-pp.update_load_avg
      5.58 ±  2%      +0.2        5.81        perf-profile.children.cycles-pp.__napi_poll
      5.55 ±  2%      +0.2        5.78 ±  2%  perf-profile.children.cycles-pp.process_backlog
      1.09 ±  4%      +0.2        1.34        perf-profile.children.cycles-pp.dequeue_entity
      5.22 ±  2%      +0.3        5.49 ±  2%  perf-profile.children.cycles-pp.__netif_receive_skb_one_core
      0.83 ±  4%      +0.3        1.10 ±  3%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.21 ± 12%      +0.3        0.51 ±  7%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      4.63 ±  2%      +0.3        4.94 ±  2%  perf-profile.children.cycles-pp.ip_local_deliver_finish
      4.62 ±  2%      +0.3        4.93 ±  2%  perf-profile.children.cycles-pp.ip_protocol_deliver_rcu
      4.44 ±  2%      +0.3        4.77 ±  2%  perf-profile.children.cycles-pp.__udp4_lib_rcv
      0.26 ±  8%      +0.3        0.59 ±  6%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.05 ±  3%      +0.4        1.41 ±  2%  perf-profile.children.cycles-pp.__pick_next_task
      3.90 ±  3%      +0.4        4.30 ±  3%  perf-profile.children.cycles-pp.udp_queue_rcv_one_skb
      3.97 ±  3%      +0.4        4.37 ±  3%  perf-profile.children.cycles-pp.udp_unicast_rcv_skb
      1.87 ±  2%      +0.4        2.28 ±  4%  perf-profile.children.cycles-pp.schedule_idle
      0.84 ±  2%      +0.4        1.28 ±  7%  perf-profile.children.cycles-pp.free_frozen_page_commit
      2.05 ±  4%      +0.5        2.50        perf-profile.children.cycles-pp.dequeue_entities
      2.31 ±  6%      +0.5        2.77 ±  5%  perf-profile.children.cycles-pp.__wake_up_common
      1.98 ±  2%      +0.5        2.44 ±  5%  perf-profile.children.cycles-pp.alloc_pages_noprof
      2.15 ±  3%      +0.5        2.62        perf-profile.children.cycles-pp.dequeue_task_fair
      2.26 ±  3%      +0.5        2.73        perf-profile.children.cycles-pp.try_to_block_task
      1.93            +0.5        2.40 ±  5%  perf-profile.children.cycles-pp.alloc_pages_mpol
      2.18 ±  7%      +0.5        2.65 ±  5%  perf-profile.children.cycles-pp.try_to_wake_up
      2.20 ±  7%      +0.5        2.68 ±  5%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.69 ±  3%      +0.5        1.17 ±  9%  perf-profile.children.cycles-pp.free_pcppages_bulk
      2.44 ±  5%      +0.5        2.93 ±  4%  perf-profile.children.cycles-pp.__wake_up_sync_key
      1.46 ±  3%      +0.5        1.95 ±  3%  perf-profile.children.cycles-pp.enqueue_task_fair
      1.80 ±  2%      +0.5        2.29 ±  5%  perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      3.35 ±  3%      +0.5        3.85 ±  3%  perf-profile.children.cycles-pp.__udp_enqueue_schedule_skb
      1.48 ±  3%      +0.5        1.98 ±  2%  perf-profile.children.cycles-pp.enqueue_task
      1.57 ±  3%      +0.5        2.10 ±  2%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.77 ±  3%      +0.6        1.33 ±  4%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      2.63 ±  4%      +0.6        3.19 ±  4%  perf-profile.children.cycles-pp.sock_def_readable
      2.35 ±  2%      +0.6        2.91 ±  3%  perf-profile.children.cycles-pp.sk_page_frag_refill
      2.30 ±  2%      +0.6        2.86 ±  3%  perf-profile.children.cycles-pp.skb_page_frag_refill
      1.52 ±  2%      +0.6        2.08 ±  6%  perf-profile.children.cycles-pp.get_page_from_freelist
      1.05 ±  2%      +0.6        1.70 ±  6%  perf-profile.children.cycles-pp.rmqueue
      0.59 ±  4%      +0.6        1.24 ±  8%  perf-profile.children.cycles-pp.rmqueue_bulk
      1.86 ±  3%      +0.7        2.51 ±  2%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.73 ±  2%      +0.7        1.39 ±  7%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      1.00 ± 21%      +0.7        1.65 ± 10%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      1.09 ±  8%      +0.7        1.83 ±  4%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      2.08 ±  2%      +0.8        2.84 ±  2%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      5.50 ±  2%      +0.8        6.31        perf-profile.children.cycles-pp.__skb_recv_udp
     25.36            +0.8       26.17        perf-profile.children.cycles-pp.ip_generic_getfrag
     24.97            +0.8       25.81        perf-profile.children.cycles-pp._copy_from_iter
      3.57 ±  4%      +0.9        4.44 ±  2%  perf-profile.children.cycles-pp.schedule
      3.70 ±  4%      +0.9        4.59 ±  2%  perf-profile.children.cycles-pp.schedule_timeout
      4.08 ±  3%      +1.0        5.09 ±  2%  perf-profile.children.cycles-pp.__skb_wait_for_more_packets
     41.64            +1.1       42.74        perf-profile.children.cycles-pp.__x64_sys_sendto
     41.58            +1.1       42.70        perf-profile.children.cycles-pp.__sys_sendto
     40.73            +1.3       41.98        perf-profile.children.cycles-pp.udp_sendmsg
      5.22 ±  2%      +1.3        6.49 ±  2%  perf-profile.children.cycles-pp.__schedule
     30.66            +1.5       32.11        perf-profile.children.cycles-pp.ip_make_skb
     30.05            +1.5       31.58        perf-profile.children.cycles-pp.__ip_append_data
      2.09 ±  9%      +2.3        4.37 ± 11%  perf-profile.children.cycles-pp.poll_idle
      2.53 ±  7%      +2.6        5.12 ±  9%  perf-profile.children.cycles-pp.cpuidle_enter_state
      2.56 ±  7%      +2.6        5.15 ±  9%  perf-profile.children.cycles-pp.cpuidle_enter
      3.24 ±  7%      +2.9        6.14 ±  7%  perf-profile.children.cycles-pp.cpuidle_idle_call
      7.03 ±  3%      +4.4       11.39 ±  3%  perf-profile.children.cycles-pp.do_idle
      7.10 ±  3%      +4.4       11.48 ±  3%  perf-profile.children.cycles-pp.common_startup_64
      7.10 ±  3%      +4.4       11.48 ±  3%  perf-profile.children.cycles-pp.cpu_startup_entry
     46.23            -2.9       43.32        perf-profile.self.cycles-pp.rep_movs_alternative
      5.52            -1.1        4.46 ±  2%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      4.20            -0.7        3.50 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      3.05 ±  2%      -0.5        2.58 ±  3%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.16            -0.2        0.96 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.87 ±  6%      -0.2        0.70 ±  8%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.51 ±  5%      -0.1        0.36 ± 11%  perf-profile.self.cycles-pp.check_heap_object
      0.35 ±  4%      -0.1        0.23 ±  5%  perf-profile.self.cycles-pp.skb_release_data
      0.53 ± 10%      -0.1        0.42 ±  6%  perf-profile.self.cycles-pp.fdget
      0.22 ± 10%      -0.1        0.12 ± 12%  perf-profile.self.cycles-pp.__mod_zone_page_state
      0.60 ±  7%      -0.1        0.50 ±  4%  perf-profile.self.cycles-pp.fib_table_lookup
      0.46 ±  6%      -0.1        0.37 ±  5%  perf-profile.self.cycles-pp.__free_frozen_pages
      0.39 ±  7%      -0.1        0.31 ±  8%  perf-profile.self.cycles-pp.udp_recvmsg
      0.29 ±  6%      -0.1        0.22 ± 10%  perf-profile.self.cycles-pp.__skb_recv_udp
      0.32 ±  5%      -0.1        0.24 ± 12%  perf-profile.self.cycles-pp.udp_rmem_release
      0.28 ±  2%      -0.1        0.21 ±  9%  perf-profile.self.cycles-pp.__alloc_frozen_pages_noprof
      0.22 ±  6%      -0.1        0.15 ± 13%  perf-profile.self.cycles-pp.get_page_from_freelist
      0.60 ±  4%      -0.1        0.54 ±  3%  perf-profile.self.cycles-pp._copy_from_iter
      0.22 ±  6%      -0.1        0.16 ± 15%  perf-profile.self.cycles-pp.__ip_select_ident
      0.47 ±  5%      -0.1        0.41 ±  5%  perf-profile.self.cycles-pp.__slab_free
      0.12 ± 14%      -0.1        0.07 ± 23%  perf-profile.self.cycles-pp.inet_recvmsg
      0.22 ±  4%      -0.0        0.17 ±  8%  perf-profile.self.cycles-pp.skb_set_owner_w
      0.34 ±  4%      -0.0        0.29 ±  3%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.16 ± 10%      -0.0        0.13 ± 12%  perf-profile.self.cycles-pp.process_backlog
      0.10 ± 13%      -0.0        0.07 ± 12%  perf-profile.self.cycles-pp.free_tail_page_prepare
      0.05 ±  8%      +0.0        0.07 ± 15%  perf-profile.self.cycles-pp.delay_tsc
      0.10 ± 10%      +0.0        0.12 ±  6%  perf-profile.self.cycles-pp.sched_ttwu_pending
      0.06 ± 11%      +0.0        0.08 ± 18%  perf-profile.self.cycles-pp.ttwu_do_activate
      0.06 ±  9%      +0.0        0.08 ± 10%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.12 ±  9%      +0.0        0.15 ± 10%  perf-profile.self.cycles-pp.update_cfs_group
      0.06 ±  7%      +0.0        0.10 ± 12%  perf-profile.self.cycles-pp.get_cpu_device
      0.11 ± 10%      +0.0        0.14 ± 11%  perf-profile.self.cycles-pp.os_xsave
      0.08 ± 14%      +0.0        0.12 ±  5%  perf-profile.self.cycles-pp.enqueue_entity
      0.20 ±  6%      +0.0        0.24 ±  5%  perf-profile.self.cycles-pp.dequeue_entity
      0.02 ±141%      +0.0        0.06 ±  8%  perf-profile.self.cycles-pp.task_contending
      0.08 ± 14%      +0.0        0.13 ±  9%  perf-profile.self.cycles-pp.nohz_run_idle_balance
      0.19 ±  8%      +0.0        0.24 ±  6%  perf-profile.self.cycles-pp.do_idle
      0.13 ±  8%      +0.0        0.18 ±  6%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.18 ± 12%      +0.0        0.22 ±  9%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.09 ±  5%      +0.0        0.13 ± 10%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.02 ± 99%      +0.0        0.07 ±  9%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.07 ± 12%      +0.0        0.12 ± 11%  perf-profile.self.cycles-pp.flush_smp_call_function_queue
      0.02 ±141%      +0.0        0.06 ± 11%  perf-profile.self.cycles-pp.put_prev_task_idle
      0.02 ± 99%      +0.0        0.07 ± 17%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.12 ±  8%      +0.0        0.16 ±  6%  perf-profile.self.cycles-pp.__pick_next_task
      0.17 ±  4%      +0.1        0.22 ±  4%  perf-profile.self.cycles-pp.avg_vruntime
      0.14 ±  4%      +0.1        0.19 ± 10%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.12 ±  8%      +0.1        0.17 ±  6%  perf-profile.self.cycles-pp.set_next_task_fair
      0.10 ±  4%      +0.1        0.16 ± 13%  perf-profile.self.cycles-pp.rseq_update_cpu_node_id
      0.14 ± 12%      +0.1        0.19 ±  5%  perf-profile.self.cycles-pp.ktime_get
      0.13 ±  7%      +0.1        0.19 ±  7%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.08 ± 18%      +0.1        0.13 ±  8%  perf-profile.self.cycles-pp.enqueue_dl_entity
      0.17 ± 10%      +0.1        0.22 ±  8%  perf-profile.self.cycles-pp.prepare_task_switch
      0.08 ± 10%      +0.1        0.13 ±  8%  perf-profile.self.cycles-pp.llist_reverse_order
      0.48 ±  5%      +0.1        0.54 ±  3%  perf-profile.self.cycles-pp._raw_spin_lock
      0.01 ±223%      +0.1        0.07 ± 27%  perf-profile.self.cycles-pp.switch_fpu_return
      0.02 ±141%      +0.1        0.08 ± 22%  perf-profile.self.cycles-pp.__enqueue_entity
      0.06 ± 46%      +0.1        0.12 ± 17%  perf-profile.self.cycles-pp.available_idle_cpu
      0.02 ±142%      +0.1        0.08 ± 17%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.39 ±  6%      +0.1        0.46 ±  3%  perf-profile.self.cycles-pp.native_sched_clock
      0.16 ± 13%      +0.1        0.23 ±  6%  perf-profile.self.cycles-pp.__skb_wait_for_more_packets
      0.13 ± 12%      +0.1        0.20 ± 17%  perf-profile.self.cycles-pp.try_to_wake_up
      0.01 ±223%      +0.1        0.08 ± 19%  perf-profile.self.cycles-pp.intel_idle
      0.20 ±  7%      +0.1        0.28 ±  6%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.18 ± 16%      +0.1        0.26 ±  9%  perf-profile.self.cycles-pp.llist_add_batch
      0.26 ±  5%      +0.1        0.34 ±  4%  perf-profile.self.cycles-pp.__switch_to
      0.33 ±  6%      +0.1        0.41 ±  7%  perf-profile.self.cycles-pp.skb_page_frag_refill
      0.10 ±  8%      +0.1        0.18 ±  8%  perf-profile.self.cycles-pp.io_serial_in
      0.26 ±  6%      +0.1        0.36 ±  5%  perf-profile.self.cycles-pp.update_load_avg
      0.32 ±  5%      +0.1        0.43 ±  6%  perf-profile.self.cycles-pp.__switch_to_asm
      0.22 ±  9%      +0.1        0.33 ±  5%  perf-profile.self.cycles-pp.read_tsc
      0.19 ±  5%      +0.1        0.31 ±  6%  perf-profile.self.cycles-pp.menu_select
      0.48 ±  7%      +0.1        0.61 ±  5%  perf-profile.self.cycles-pp.__schedule
      0.36 ±  7%      +0.2        0.51 ± 10%  perf-profile.self.cycles-pp.__free_one_page
      0.41 ±  4%      +0.2        0.61 ±  9%  perf-profile.self.cycles-pp.rmqueue_bulk
      1.29 ±  3%      +0.3        1.60 ±  4%  perf-profile.self.cycles-pp.__ip_append_data
      0.15 ± 10%      +0.5        0.61 ± 21%  perf-profile.self.cycles-pp.free_pcppages_bulk
      0.99 ± 21%      +0.7        1.65 ± 10%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.99 ± 10%      +2.1        3.09 ± 13%  perf-profile.self.cycles-pp.poll_idle



***************************************************************************************************
lkp-srf-2sp2: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-srf-2sp2/mlockmany/stress-ng/60s

commit: 
  05275594a3 ("mm/hugetlb: convert use of struct page to folio in __unmap_hugepage_range()")
  c544a952ba ("mm: pcp: increase pcp->free_count threshold to trigger free_high")

05275594a311cd74 c544a952ba61b1a025455098033 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    183479 ±  4%     -14.2%     157507 ±  2%  cpuidle..usage
      2.62 ± 24%      +1.7        4.31 ± 26%  mpstat.cpu.all.idle%
      2.91 ±  4%      -2.0        0.87 ±  3%  mpstat.cpu.all.soft%
    219798 ±  2%     -10.3%     197133 ±  4%  numa-meminfo.node0.Mlocked
    217527 ±  3%     -12.4%     190464 ±  5%  numa-meminfo.node1.Mlocked
    412.05           +15.1%     474.32        vmstat.procs.r
     90984           +20.1%     109298        vmstat.system.cs
    452201            +4.6%     473111        vmstat.system.in
   1453896           -12.4%    1273314        meminfo.AnonPages
  10107135           +12.9%   11406807        meminfo.Memused
    447630           -14.9%     380950 ±  2%  meminfo.Mlocked
  10499561           +12.7%   11833700        meminfo.max_used_kB
 2.409e+08           +22.0%  2.938e+08        numa-numastat.node0.local_node
  2.41e+08           +22.0%  2.939e+08        numa-numastat.node0.numa_hit
 2.375e+08           +21.9%  2.895e+08        numa-numastat.node1.local_node
 2.376e+08           +21.9%  2.897e+08        numa-numastat.node1.numa_hit
     55425 ±  4%      -9.7%      50074        numa-vmstat.node0.nr_mlock
 2.408e+08           +21.9%  2.937e+08        numa-vmstat.node0.numa_hit
 2.407e+08           +21.9%  2.935e+08        numa-vmstat.node0.numa_local
 2.375e+08           +21.9%  2.895e+08        numa-vmstat.node1.numa_hit
 2.374e+08           +21.9%  2.894e+08        numa-vmstat.node1.numa_local
    105.92 ± 14%     -28.9%      75.35 ± 12%  sched_debug.cfs_rq:/.load_avg.avg
    609475 ±  4%     +21.5%     740406 ±  3%  sched_debug.cpu.curr->pid.avg
    725601           +26.0%     913936        sched_debug.cpu.curr->pid.max
    149.67 ±122%    +354.2%     679.83 ± 79%  sched_debug.cpu.curr->pid.min
    260666 ±  7%     +35.7%     353837 ±  5%  sched_debug.cpu.curr->pid.stddev
     16226 ±  2%     +19.2%      19337        sched_debug.cpu.nr_switches.avg
     11199 ±  2%     +20.3%      13471 ±  5%  sched_debug.cpu.nr_switches.min
   1468638           +26.1%    1852566        stress-ng.mlockmany.ops
     24469           +26.2%      30870        stress-ng.mlockmany.ops_per_sec
   2523625           +20.4%    3038711        stress-ng.time.involuntary_context_switches
      2017 ±  5%    +170.5%       5457 ± 31%  stress-ng.time.major_page_faults
 5.066e+08           +22.7%  6.214e+08        stress-ng.time.minor_page_faults
     17966            +3.6%      18609        stress-ng.time.percent_of_cpu_this_job_got
     10789            +3.6%      11180        stress-ng.time.system_time
     62.88 ±  7%     -11.9%      55.38 ±  2%  stress-ng.time.user_time
   2257684           +25.3%    2829176        stress-ng.time.voluntary_context_switches
    361795           -12.4%     316790 ±  2%  proc-vmstat.nr_anon_pages
    126934            -7.0%     118034        proc-vmstat.nr_mapped
    108871 ±  3%     -11.8%      95988 ±  4%  proc-vmstat.nr_mlock
    995769            -1.3%     982916        proc-vmstat.nr_unevictable
    995768            -1.3%     982917        proc-vmstat.nr_zone_unevictable
 4.786e+08           +21.9%  5.836e+08        proc-vmstat.numa_hit
 4.784e+08           +21.9%  5.833e+08        proc-vmstat.numa_local
  4.81e+08           +21.9%  5.862e+08        proc-vmstat.pgalloc_normal
  5.07e+08           +22.6%  6.219e+08        proc-vmstat.pgfault
 4.802e+08           +21.9%  5.854e+08        proc-vmstat.pgfree
 5.397e+08            +2.1%  5.509e+08        proc-vmstat.unevictable_pgs_culled
 5.398e+08            +2.1%  5.509e+08        proc-vmstat.unevictable_pgs_mlocked
 5.398e+08            +2.1%  5.509e+08        proc-vmstat.unevictable_pgs_munlocked
 5.397e+08            +2.1%  5.509e+08        proc-vmstat.unevictable_pgs_rescued
      5.56           +12.8%       6.27        perf-stat.i.MPKI
 2.373e+10            +9.2%  2.591e+10        perf-stat.i.branch-instructions
      0.50            +0.1        0.56        perf-stat.i.branch-miss-rate%
 1.165e+08           +20.4%  1.403e+08        perf-stat.i.branch-misses
 6.635e+08           +24.7%  8.274e+08        perf-stat.i.cache-misses
 1.191e+09           +23.3%   1.47e+09        perf-stat.i.cache-references
     93801           +21.2%     113707        perf-stat.i.context-switches
      5.03            -9.7%       4.54        perf-stat.i.cpi
    905.91           -19.9%     725.22        perf-stat.i.cycles-between-cache-misses
 1.192e+11           +10.3%  1.315e+11        perf-stat.i.instructions
      0.20           +10.7%       0.22        perf-stat.i.ipc
     33.22 ±  5%    +168.8%      89.29 ± 31%  perf-stat.i.major-faults
     15.71 ±  3%     +28.8%      20.23 ±  2%  perf-stat.i.metric.K/sec
   1508049 ±  3%     +28.8%    1942280 ±  2%  perf-stat.i.minor-faults
   1508269 ±  3%     +28.8%    1942666 ±  2%  perf-stat.i.page-faults
      5.57           +13.1%       6.29        perf-stat.overall.MPKI
      0.49            +0.1        0.54        perf-stat.overall.branch-miss-rate%
     55.70            +0.6       56.31        perf-stat.overall.cache-miss-rate%
      5.06            -9.7%       4.57        perf-stat.overall.cpi
    908.46           -20.1%     725.73        perf-stat.overall.cycles-between-cache-misses
      0.20           +10.7%       0.22        perf-stat.overall.ipc
 2.328e+10            +8.9%  2.537e+10        perf-stat.ps.branch-instructions
 1.137e+08           +20.2%  1.367e+08        perf-stat.ps.branch-misses
  6.51e+08           +24.4%  8.101e+08        perf-stat.ps.cache-misses
 1.169e+09           +23.1%  1.439e+09        perf-stat.ps.cache-references
     91964           +21.0%     111300        perf-stat.ps.context-switches
  1.17e+11           +10.1%  1.287e+11        perf-stat.ps.instructions
     32.46 ±  5%    +168.6%      87.20 ± 31%  perf-stat.ps.major-faults
   1478457 ±  4%     +28.6%    1900887        perf-stat.ps.minor-faults
   1478673 ±  4%     +28.6%    1901264        perf-stat.ps.page-faults
 7.179e+12           +10.8%  7.956e+12        perf-stat.total.instructions
      2.21 ±  2%      -9.5%       2.00 ±  3%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.alloc_anon_folio
      2.56 ±  2%     -17.6%       2.11 ±  2%  perf-sched.sch_delay.avg.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.do_mlock
      3.55           +11.0%       3.94 ±  2%  perf-sched.sch_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
      3.41 ±  2%     +13.1%       3.86 ±  3%  perf-sched.sch_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
      0.38 ±110%    +707.5%       3.03 ± 41%  perf-sched.sch_delay.avg.ms.__cond_resched.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
      0.28 ± 71%    +206.8%       0.86 ± 35%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      1.89 ±  4%      +9.4%       2.06 ±  6%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
      0.09 ±222%   +2246.0%       2.07 ±123%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_lru_noprof.__d_alloc.d_alloc.d_alloc_parallel
      0.05 ±  2%     +93.6%       0.10 ± 26%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.29 ±140%    +340.5%       1.26 ± 71%  perf-sched.sch_delay.avg.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.22           +10.9%       3.58 ±  2%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      1.21 ± 48%    +100.9%       2.42 ± 26%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pcpu_alloc_noprof
      2.18 ±  2%     -16.7%       1.82        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_clone
      3.75           -13.0%       3.26        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.42 ± 90%     -93.5%       0.03 ±131%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      0.11 ±  4%     -12.9%       0.10 ±  8%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.82 ±  6%     -66.4%       0.28 ±  9%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.58 ±100%    +795.3%       5.17 ± 39%  perf-sched.sch_delay.max.ms.__cond_resched.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
     10.02 ± 17%     +80.6%      18.08 ± 61%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      9.45 ± 21%     +45.5%      13.75 ± 13%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.exit_mmap.__mmput.exit_mm
      1.50 ± 87%    +187.7%       4.33 ± 31%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      5.05 ± 28%     -57.1%       2.16 ± 63%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.__x64_sys_munlock.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.18 ±222%   +1309.8%       2.48 ± 95%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_lru_noprof.__d_alloc.d_alloc.d_alloc_parallel
      0.21 ±215%    +504.6%       1.25 ±103%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.__ksm_enter.ksm_madvise.madvise_vma_behavior
      5.12 ± 42%     -67.3%       1.67 ± 57%  perf-sched.sch_delay.max.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
      0.48 ±142%    +206.8%       1.48 ± 60%  perf-sched.sch_delay.max.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     27.20 ± 19%     -30.2%      18.99 ± 12%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      3.55 ±109%    +120.7%       7.84 ± 30%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.97 ± 18%     -95.2%       0.05 ±142%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
     10.45           -13.2%       9.07        perf-sched.total_wait_and_delay.average.ms
    485797 ±  4%     +16.6%     566668        perf-sched.total_wait_and_delay.count.ms
      8.84 ±  2%     -15.5%       7.47        perf-sched.total_wait_time.average.ms
     16.35 ± 16%     -23.4%      12.53 ±  8%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
     19.73 ± 40%     -50.0%       9.86 ± 51%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pud_alloc
     15.33 ± 10%     -23.9%      11.66 ± 12%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
     15.82 ±  3%     -23.7%      12.06 ±  5%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.wp_page_copy
      4.02 ±  2%     -21.4%       3.16 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.do_mlock
     17.93 ± 15%     -29.1%      12.71 ± 15%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmalloc_cache_node_noprof.__get_vm_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
     15.38 ± 15%     -20.6%      12.21 ±  9%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
      7.10           +10.0%       7.81 ±  2%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
     16.59 ±  9%     -21.7%      12.98 ±  5%  perf-sched.wait_and_delay.avg.ms.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
     16.47 ±  2%     -22.0%      12.85 ±  2%  perf-sched.wait_and_delay.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      6.47           -19.2%       5.22 ±  4%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_read.__mm_populate.do_mlock.__x64_sys_mlock
     16.49 ±  4%     -20.0%      13.19 ±  5%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
     16.63 ±  3%     -20.6%      13.20 ±  5%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
     16.15 ±  2%     -19.0%      13.08 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      1.25 ±223%    +505.0%       7.54 ±  2%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
     54.17 ± 33%     -44.9%      29.84 ± 22%  perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     20.67 ± 17%     -28.0%      14.89 ± 12%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
     16.65 ±  2%     -22.4%      12.92        perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.anon_vma_fork.dup_mmap.dup_mm
     16.29 ±  5%     -19.9%      13.04 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
     18.22 ± 40%     -42.7%      10.44 ±  7%  perf-sched.wait_and_delay.avg.ms.__cond_resched.pidfs_exit.release_task.wait_task_zombie.__do_wait
     21.12 ±  4%     -16.3%      17.68 ±  7%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     16.29 ±  2%     -23.0%      12.54 ±  6%  perf-sched.wait_and_delay.avg.ms.__cond_resched.uprobe_start_dup_mmap.dup_mm.constprop.0
      6.15           +12.1%       6.89 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      4.46 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     11.02           -12.0%       9.70        perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     14.08 ±  3%     -24.8%      10.59 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_clone
     13.86 ±  6%     -23.2%      10.64 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_fork
      7.22           -13.5%       6.24        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
     64.86 ±  3%     -20.1%      51.82 ±  3%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4.24           -10.9%       3.78        perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     30.11 ±  2%     -20.9%      23.81 ±  3%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2436 ±  5%     +14.6%       2791 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.wp_page_copy
     16403 ±  2%     +12.1%      18384 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.do_mlock
     34.33 ± 13%     +49.0%      51.17 ± 13%  perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_cache_node_noprof.__get_vm_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
     58.00 ±  9%     +23.0%      71.33 ± 10%  perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
    231.50 ± 11%     -39.7%     139.50 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      4931 ±  3%     +35.7%       6690 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      9614 ±  7%     +30.8%      12577 ±  2%  perf-sched.wait_and_delay.count.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
     25007 ±  4%     +25.4%      31363 ±  2%  perf-sched.wait_and_delay.count.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
    766.17 ±  3%     +29.9%     995.00 ±  2%  perf-sched.wait_and_delay.count.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
      2099 ±  3%     +22.9%       2579 ±  5%  perf-sched.wait_and_delay.count.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
     10958 ±  7%     -44.7%       6059 ± 12%  perf-sched.wait_and_delay.count.__cond_resched.down_read.__mm_populate.do_mlock.__x64_sys_mlock
    909.33 ±  6%     +22.9%       1117 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
    480.17 ± 10%     +22.3%     587.17 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
      3390 ±  5%     +36.4%       4626 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.down_write.dup_mmap.dup_mm.constprop
    432.67 ±223%    +716.9%       3534 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      7573 ±  5%     +25.4%       9494 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.anon_vma_fork.dup_mmap.dup_mm
     15.83 ± 54%     +78.9%      28.33 ± 18%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.dup_mm.constprop.0
      5.33 ±103%    +168.8%      14.33 ± 20%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.mas_dup_build.constprop.0
      1420 ±  7%     +29.4%       1839 ±  5%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
    357.67 ±  4%     +45.3%     519.67 ±  7%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
     19.17 ± 14%     +47.0%      28.17 ± 16%  perf-sched.wait_and_delay.count.__cond_resched.pidfs_exit.release_task.wait_task_zombie.__do_wait
      8887 ±  4%     -58.1%       3719 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    295.33 ±  9%     +35.3%     399.67 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.uprobe_start_dup_mmap.dup_mm.constprop.0
     20982 ±  3%     +33.5%      28021 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
     52.00 ±  5%     +10.3%      57.33 ±  2%  perf-sched.wait_and_delay.count.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      4024 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    127121 ±  4%     +20.5%     153203        perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     42940 ±  4%     +16.6%      50078        perf-sched.wait_and_delay.count.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5577 ±  7%     +63.8%       9134 ±  3%  perf-sched.wait_and_delay.count.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      4913 ±  4%     +12.4%       5521 ±  2%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_clone
      4025 ±  5%     +34.9%       5429 ±  5%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_fork
     26101 ±  5%     +33.1%      34753 ±  3%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     33647 ±  4%     +20.3%      40470 ±  3%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    144.82 ± 42%     -56.5%      63.01 ± 55%  perf-sched.wait_and_delay.max.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
     26.04 ±223%    +564.0%     172.91 ± 45%  perf-sched.wait_and_delay.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      1849 ±  7%     -14.0%       1589 ±  4%  perf-sched.wait_and_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
    128.53 ± 62%     -72.3%      35.62 ± 38%  perf-sched.wait_and_delay.max.ms.__cond_resched.pidfs_exit.release_task.wait_task_zombie.__do_wait
    343.72 ±  4%     -30.9%     237.64 ± 18%  perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    693.56 ± 65%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     14.21 ± 18%     -27.3%      10.33 ±  9%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
     13.07 ± 11%     -27.0%       9.54 ± 15%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      1.14 ±  2%     -13.7%       0.98 ±  2%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.alloc_anon_folio
     13.81 ±  4%     -28.4%       9.89 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.wp_page_copy
      1.47 ±  3%     -28.0%       1.06 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.do_mlock
     15.97 ± 16%     -32.3%      10.81 ± 17%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_cache_node_noprof.__get_vm_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
     13.23 ± 16%     -24.5%       9.99 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
     12.89 ± 39%     -50.9%       6.34 ± 20%  perf-sched.wait_time.avg.ms.__cond_resched.__kvmalloc_node_noprof.proc_sys_call_handler.vfs_read.ksys_read
      3.55            +9.1%       3.87 ±  2%  perf-sched.wait_time.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
      2.99 ±  2%     +18.9%       3.55 ±  3%  perf-sched.wait_time.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
     14.49 ± 10%     -25.0%      10.87 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
     14.41 ±  3%     -25.3%      10.76 ±  2%  perf-sched.wait_time.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      4.40           -24.4%       3.33 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.__mm_populate.do_mlock.__x64_sys_mlock
     14.57 ±  4%     -23.5%      11.14 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
     14.75 ±  4%     -24.5%      11.14 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
     14.14 ±  2%     -22.3%      10.99 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      1.72 ± 11%     -21.1%       1.35 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.commit_merge.vma_merge_existing_range
      3.96 ± 22%     -60.6%       1.56 ± 63%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.__x64_sys_munlock.do_syscall_64.entry_SYSCALL_64_after_hwframe
     52.12 ± 35%     -45.9%      28.21 ± 24%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      1.96 ± 54%     -82.1%       0.35 ±118%  perf-sched.wait_time.avg.ms.__cond_resched.khugepaged.kthread.ret_from_fork.ret_from_fork_asm
     17.60 ± 20%     -37.4%      11.02 ± 22%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
     14.58 ±  2%     -25.7%      10.83 ±  2%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.anon_vma_fork.dup_mmap.dup_mm
     14.16 ±  6%     -23.0%      10.91 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
      2.40 ±  2%     -16.1%       2.02        perf-sched.wait_time.avg.ms.__cond_resched.mlock_pte_range.walk_pmd_range.isra.0
      3.75 ±105%    +344.5%      16.65 ± 81%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.ldt_dup_context.dup_mmap.dup_mm
     14.01 ±  8%     -19.3%      11.31 ±  3%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
     17.31 ± 41%     -44.5%       9.61 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.pidfs_exit.release_task.wait_task_zombie.__do_wait
     21.07 ±  4%     -16.5%      17.59 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     14.37 ±  3%     -27.4%      10.43 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.uprobe_start_dup_mmap.dup_mm.constprop.0
      2.58 ± 14%    +100.4%       5.17 ±  8%  perf-sched.wait_time.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      2.92           +13.4%       3.32 ±  3%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      8.46           -17.6%       6.97        perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.28 ± 12%     -31.0%       0.88 ± 15%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
     11.90 ±  3%     -26.3%       8.77 ±  4%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_clone
     11.98 ±  6%     -25.8%       8.89 ±  4%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_fork
      3.47 ±  4%     -14.0%       2.98        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
     64.75 ±  3%     -20.1%      51.72 ±  3%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2.01 ±  3%     -16.9%       1.67 ±  2%  perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     29.29 ±  2%     -19.6%      23.54 ±  3%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    142.78 ± 42%     -59.9%      57.28 ± 65%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
     10.02 ± 17%     +80.6%      18.08 ± 61%  perf-sched.wait_time.max.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      9.45 ± 21%     +45.5%      13.75 ± 13%  perf-sched.wait_time.max.ms.__cond_resched.down_read.exit_mmap.__mmput.exit_mm
     10.12 ± 26%     -66.3%       3.41 ± 93%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.__x64_sys_munlock.do_syscall_64.entry_SYSCALL_64_after_hwframe
    131.43 ± 50%     -65.9%      44.88 ± 43%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.link_path_walk.part
      1849 ±  7%     -14.0%       1589 ±  4%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      4.11 ± 52%     -83.6%       0.68 ±121%  perf-sched.wait_time.max.ms.__cond_resched.khugepaged.kthread.ret_from_fork.ret_from_fork_asm
    127.30 ± 62%     -73.8%      33.40 ± 33%  perf-sched.wait_time.max.ms.__cond_resched.pidfs_exit.release_task.wait_task_zombie.__do_wait
    343.68 ±  4%     -30.9%     237.63 ± 18%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      5.26 ± 57%     +95.1%      10.26 ± 22%  perf-sched.wait_time.max.ms.__cond_resched.unmap_page_range.unmap_vmas.exit_mmap.__mmput
    222.76 ± 22%     -27.2%     162.26 ± 29%  perf-sched.wait_time.max.ms.__cond_resched.uprobe_start_dup_mmap.dup_mm.constprop.0
     27.20 ± 19%     -30.2%      18.99 ± 12%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
     11.95 ± 31%     -40.1%       7.16 ± 12%  perf-sched.wait_time.max.ms.io_schedule.folio_wait_bit_common.__do_fault.do_read_fault
     43.65 ± 73%     -67.6%      14.12 ± 18%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_file_vma_batch_process





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

