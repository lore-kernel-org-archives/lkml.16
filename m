Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24AE1B3925
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041781; cv=fail; b=bCIi17vubwF9GP1aUH2G1zlzDKbE0vkad5LV+WFAw1eTd/nufeIbEOIZfCMSXdAP/4oX1ieLkSHyOFM3nD/8U+TwmsJeIBDcB5yZI/3xdbB86fivyC1FNp77fSM6v1QKRvFogL1NNrjja/RRY/Sgfi8Lzz2Bp8lm+4YHMa3ALKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041781; c=relaxed/simple;
	bh=hjSGkmwnrwxEQdpx31S1DKRAFHgocQshSIrqApeQZ1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lLV7J9d3jq4v9XhUBkKurnyqArflvBcsdSnCj4ChfJi7DeFiyjAqXdoqxDBVpQWvooL2VSClHTnqg1MYw/2xy1n867lEtztKIJ3hBfLIo+mGglnyYcF/uzC6rH19DV2JFc0I/v/KtLHNrDYa0s/x7yrQG2c1BL/ZbboY54mQRz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=saQzzfni; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gODXNguA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="saQzzfni";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gODXNguA"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RFdpVv001492;
	Fri, 27 Jun 2025 16:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=pntS1smFe4GNaqZ7jy
	F5P4xBer/Er7FHouPseXH2trE=; b=saQzzfniAvnLg6rf/PYzCf2byPJAJ2gC5x
	Mmp7WkLldJt0LJLGV2IBllVagURp7Yq/LB0x5hJ8g38jC9DJcA/0ySlbe7tqKGJR
	OpWmYck4LVAm0WSCruZD5VzTG5AY9Zho4crIxjd8uWB5gndGLYBHWLGKqW6hIrEr
	tTKz347Cs56X6oHPqn6OZSO0Ocm9QrCOybxGh3fXniWkU8fwSyEkOBU33NInXZpc
	ZYOpVc7au6+gdalG40t8hV4nZrkRdYz8sbP++mHY1BxfV29NeSSbuKD15pJnGMjX
	kb4rHvKNFATkWq6TBU8kPv12LU1SDN8pk73ZeAuMFLhwcKupKe0w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8n44kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 16:28:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55RF0fnp034092;
	Fri, 27 Jun 2025 16:28:51 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpuhmc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 16:28:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/SDApxR/nHQjxu0Lj/UoPzJi5iPlJXzT1xNjOgvF7BBvndseAs+Ctlt8XpbLPvnWTK4xPH6lnNo2T8zYakHevwTo78eitN+MNEcKm5n4f2XKN1tLx/vk4lJ+WiYgphvL+tdtJ6o4G3oti/fb98z1irwNZOZAY8bx/XNsz5f+B3LDlaFynvoajCuhT1Cz4LOMYcWjvdaysmW02FEQEzdvcvNaCwtcl2iorG/elc2d5rBjJA+vg92QyAxXC+uIcFHlkzD7DQE4ar8+ZO3EcVqdbs+SV5yB6tpv6bEX6KJx/XlmThTondNKFZwyReOc7r48T+klohYJZTfUPI610GB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pntS1smFe4GNaqZ7jyF5P4xBer/Er7FHouPseXH2trE=;
 b=kMizQbrW3hy6D6s05H7vksiQUM+gOHDgpQhMGZAavzaFdyfFywVx5ZcmMz3L/LJEOhUEjgwAykNgcesU6Hq1/ziYcjURFKrzBYuie3IyjQBU/kVld7npQQVqTuo0cWeE7eNrX4MMvosupEOLJFIcQoXMDa4O0MtYVCxSJqDR24nbk6xyK3lTxfU05/umCdEvMSZ2Cify8qxvU7hLCkaHZxqPGBQJT9S8IxYASn5fBJ0LRtojUBxoj5DT/RUj8XMbHwEJjbjZEgJaXIywmcCF7td+z/Tfqufq+eC5mEUd5BwI0QmXvJtcz6OHlMyCaFRkuqxOTX7I/hiVdByl94mkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pntS1smFe4GNaqZ7jyF5P4xBer/Er7FHouPseXH2trE=;
 b=gODXNguAyBtTCkr831LeoyX8w1FyJGiFoM2VV812wL9ZxUETknq4rpX5Pxx8STx1lv3e26KJmjjntw0itqGfBklBdv5PTO1l/eepqC4W3bP5YyjZVyvGasVjqbNbN3h+Yfn5X05TVU7RMu4d0tkiRN+t72G1HHtJld9vXpIty2Y=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7930.namprd10.prod.outlook.com (2603:10b6:610:1c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Fri, 27 Jun
 2025 16:28:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 16:28:48 +0000
Date: Fri, 27 Jun 2025 17:28:46 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
Message-ID: <6e3df002-fd04-4acf-a670-d36d5478921a@lucifer.local>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-2-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627115510.3273675-2-david@redhat.com>
X-ClientProxiedBy: LO4P265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 6598aa82-8c05-4331-04f7-08ddb597b1be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4IDgx9czbZ51xzeH58hAH8To/vDuHEQpNc14s9d44YyDYDf0X2ReiL4+VD8c?=
 =?us-ascii?Q?p/LGBCQ7zxq1WIVZ3lu+TybGeQCk9CypoWJ/9PUtLdZEszh0x0u2lNOBV5Qb?=
 =?us-ascii?Q?thiQ7+DdW00MG4tijTtU/CViUhqPYVyR24fr4cIeuSnNGG1SEgYuvYOPFKgg?=
 =?us-ascii?Q?tz/HiszleWIj+Is9UUAuM5kU4sBQh9+PU24br0FibYloKnsWVEJDfvuoGOu7?=
 =?us-ascii?Q?Ef/0huqBbB4onAh7ISeTq7usyz4tz/DJ8EmH49zspheYXPuuNDuAmIVpuoJs?=
 =?us-ascii?Q?AXscu8JySMAD58MXjPXrMZARPvD4VeulMtFKg4qkOQbDzCS+Razi54gT1Mkt?=
 =?us-ascii?Q?ucFrP1uVAQ9uXenVfkIO2Mu5SZUPmL0LOY+MhSxyklh8PxnWl3VyDjXgmu/j?=
 =?us-ascii?Q?JxPR1Ti2MsZwiS5PbhNnQGFT8gLTOfZpBW/svkbo7sTNlV7P15m667JtyZtS?=
 =?us-ascii?Q?CFlQH0vlj5MiqBxOZ61Nw8MAT9+O5tSJrh1suZjKGxcD8cReyn9/vhYhZ63X?=
 =?us-ascii?Q?Wq0rD2wLgBDM0d/+9zQtf62rB5bcvJLPKR571tjUWfCqaZx+u5c/6vOsLFXL?=
 =?us-ascii?Q?nKQBHxi5vXFynfP2+ovHIQjsFAkl78XPFmzvedrEzVrXjXxkdU+9V0sgvf/W?=
 =?us-ascii?Q?o9tlsEPcRAxJCl+aPlPitjQiyzkPa+Axr4h9hlxPXSRv4zK/Veo4PTBleGHQ?=
 =?us-ascii?Q?sNCpSlOKYYXxIH59ETYf4MQwvl19RxGAWqFFsVkBymVKypzdbFDX35PF7n9R?=
 =?us-ascii?Q?bluCeX++szMLMBK99pYHavPU5fm/dGBFJ++9NbkOuzzSAlWwv6gGv+x3HE8d?=
 =?us-ascii?Q?F8mjmnXNX1bSJPvPWdvaqAC2dy7h+gBAZ3YBp1YvreVRcsL3gFod/JGiXjli?=
 =?us-ascii?Q?CzDLTBXSE5qZyL1bC1LkLLBECIiofl+mDnqjPkQtZALUyOWTTBPImiezJtzn?=
 =?us-ascii?Q?ok8RKFQVHMK26yn/Ikb5gC1QC0XCQpU8yNw5xDbfhHnXp+umHh/99oycNS9g?=
 =?us-ascii?Q?/jQbD7/iLE52JteEQBlIECheO1sTNOKr1LJIuYJPhl6EmKg/DfDNxOuoqVsV?=
 =?us-ascii?Q?X7pDOjaESUOuClG6Y/S5QezX9P7tROk0dtd3aNKnuz/x/aJCu2H6apOUUNfZ?=
 =?us-ascii?Q?95bGXks9+K3nsWZGXx/BFuwVaNiRU+Mc8tobtphP33W8a6o8NIiVRMZe+isj?=
 =?us-ascii?Q?uUWPiQzVOvvdDOidEWyz9nafdCEAXmheDHKwrXidK6AnXPGYg8+Sak8rqAJc?=
 =?us-ascii?Q?qXju2Nx6p3SYnQWG2H4NaRX6PD9079S5lZIwyK+ZcTtxtx/xEQuu8YUAo0Ci?=
 =?us-ascii?Q?Tsa5yo6S81V7V/eBW75RxOS9aAVMpWky0KaqPI/ozNzkBocbCP76POKkycJt?=
 =?us-ascii?Q?a5Ifshl7OYt5ihbHztybcP6x4IUzbeXS4ddqY/djwwj8hxzBKQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?41f4uaz0yQfjTm2k/ulnD/njtU5Oh9kL7/4mTBr0s185hZu4xbjuVpLEV+YU?=
 =?us-ascii?Q?yR1EFClQhTcXX1dxW0gYTuC81kQjarQAu7d1BQ1dpRBdCOUgtNL4TVNnC4mn?=
 =?us-ascii?Q?OufCZaSnEP4E1L+FKplf9kiYI6Qt6e3H9vzrrt1d1vziZaWAO2x8+TSk9KEI?=
 =?us-ascii?Q?czB0DUMyWesMtegPQuNNb+aztemvn6BOX36fSSdONtJigNoek6vXjmDyIawZ?=
 =?us-ascii?Q?Y+/ziT8qxYkNBTIgAe2lojbzKdY+TppXBsFsaGo/zcKpGrGja71/F9TiVLSr?=
 =?us-ascii?Q?+7zmsdX+eu5n9Vv1kJhq3/XJ1u9kWnh5Rph5j5E36U4ITWzLL5rXjVXayulZ?=
 =?us-ascii?Q?9M93a0L206JsaViD7uE2sxlgvnGqhicQqqLvFzV660Hsu5Lprp4Kq2gf1CaE?=
 =?us-ascii?Q?E2jidMU5uHtdzaVeItJSZcw7gAgqILU/vjS3z+EazfufCbC3rRxWMA7ilSXa?=
 =?us-ascii?Q?+wfq9tiudJ/RyM/me32Mrjffqh4E9/7sKlkqCX1G1y4WWio+AoPrSBLu9RN+?=
 =?us-ascii?Q?XyhrXLhesXMJ1mhAJySdcwoIUv3XaFL0fq93H4mdnSBttGtW41Ft8Wlt35XY?=
 =?us-ascii?Q?um5Wacw4Vs0GbwdS6ciqLnyy2kD8MaaCUlGx8MdZxpxwcTBTmKH84VvRbKN5?=
 =?us-ascii?Q?F9tZWBGf6vRG9In1lSnWmCPR+aE4EBCeQrv9ftQe+8bDwlbkoG535YBDFAkM?=
 =?us-ascii?Q?71FyirWLHDvWLllQEeycZRyFKXE2EAqcMvu/ABXseS2XyaoAGyLmUeOPc3MR?=
 =?us-ascii?Q?YD7BIpweuTNlZFmQbH6YGUA6f75SsWoE+xLFd8J67XRF68cTH76Avmsm0QzM?=
 =?us-ascii?Q?R5fEhrc7IgtQ51FuXI4wp1NG8mI1ODtHM9GKCpqudOTTXsRltBZGXqJSS+ZR?=
 =?us-ascii?Q?zXCgxI7l30bujn4uUaTogO+qYNBM43J1rLMw+4p8DTsVb1KNYQyrtm1u9/Lx?=
 =?us-ascii?Q?q4YuY/29HN/sZXvXHEeOStecrlTeTf0nTabcCClAW9v1ZlyLw7Zox92unbJJ?=
 =?us-ascii?Q?UOjnLwmFDFj491wJQqM2buX7tswZMnXm9gSsYf0kMAR+jA/w5VJQy6DruDOF?=
 =?us-ascii?Q?6JgStwsAzLV1bRH1DO1Bav403NAKD+bi/6IQhua1aNBqQWWuc0a0Pk9t24Qe?=
 =?us-ascii?Q?0452huFB8JDhDZlXRznCDcc70KejoDxL+b/DPTVKyA2a789aFIHqUvsRvOuB?=
 =?us-ascii?Q?U9Uf48/LqK+sN+Ub/FRw4w4gqx2VEml7kvnKzzLhfIll5Af0MxjQqpJSB4Yv?=
 =?us-ascii?Q?Awp8+Q+yh9+7yFmxVhjSBR5fyBtFX6JiSc6S/PApQaJ02tSpEshsxLUrVwjf?=
 =?us-ascii?Q?/hFJnLcwgPEhqamUm409LICm9cYFnQ35Gj/nJw9274v82CY7iRLcIjVsNkBU?=
 =?us-ascii?Q?TIp248+U999/cYKnI2h/6XQ3Sdgy48h/FlqHHsz+g7OIVHXOi2LXoL5Bl1EL?=
 =?us-ascii?Q?yRjGDKW4ea4DZcz/dIffYDkX+aZpDNF4CsJALrG16IA4JtI06I1TqlR0uLE2?=
 =?us-ascii?Q?Lx1Xub74KDIetoRFir8NbU+5AoJ6t7toBdVCpepF+eu5iWcC1j3tGT0qZrEP?=
 =?us-ascii?Q?nwLGYPuOV5KxMDY6oJKaHJrc6SAkY/QYKjkwZwFsbIZ0pvLeALcIGux6JbWz?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C30znRdde4bIEm0TynqHgUXBavfeHiGGA6iSRdDcz8v1qNMPFJTCQyeRL4PLruohxSkK8m7PzwZlgxnV+tErje+9gqQwlQgYRsMJlZL51aE0D5O2QZ0MW+57N1YYqaS0Ah3labUQU1K1cRZFEQM7vbL2e5Mnzo1w2dtCcWcCevab3ilfsitSAp7nCNJGxDQUObUFbXNtEYTFwP0DfhywirCty2ZNABnxQHwokeUAXCCU5h3WdfxYUW1tkkYv6BWm5pBxXdtbTeAJBefnlO+1gl7iVPIC8hBzcD0oe2vRAWNRdmSFMIF6fX6zlAEQiOF9FbR7akjHp4vGSLU9VxyxWXNTrhunA9Sa+AEBnwR1k6WpZY9Dp1lS3m1At/Yg3Qq3/sP2BNQy5xZo70e4a2XOiI+sruaQQixYupr9ssRAQNsM3MkYuHWF3XRJBGejhMXo5wUQ4hbD7cRhzxKt1XpkpUWRauQlNQ293x0NWOfPrFNnNdvpoy54qgRxHKi3G2E8sHBxkGnpyVyBBrm4uYCqw2B6IsZ2T7AI7gNhMrOO1bSGK9pnO3xLJcEajcL4JlWoy9PQrENHgG2oMPdjoLLCdxnnbROhMARcRQSs/5WpkFw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6598aa82-8c05-4331-04f7-08ddb597b1be
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 16:28:48.4264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHdwVHjSxSPa4sxwP+LOmXVNk3c0Ji7DYxPSQqs+tyTvanQ/Yfa4m9l8o9GrzTLJrO0Lx+Om0RAN7bUY3JbAXsC9iWpQrfBhPIt1wu7TLwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7930
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506270134
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685ec6c4 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=sWee6YLRec0v3ildbBcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: yKTUyDNNVAQVJGZRZJ7wqY7MCPVLP9AL
X-Proofpoint-GUID: yKTUyDNNVAQVJGZRZJ7wqY7MCPVLP9AL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMyBTYWx0ZWRfX3WHmyzMaRH92 HYnZWABYQRjDXYfYchCN4Zns46RXO1CttNm2RDHBRuCssDwCoVAWNqXHCA6FQXNdSDLPqt3KKR8 kVK0zmREGfM0mYjy8zGSfuXqqLM2NlJlTnMiMIYTVKytLIbpnc28VCCMdtPn0zF5hACx1zPCq4j
 v637Ji1i3qBaDqcc0xmqRKMd5F3O/TjW/1Us7L6VokILhPj0Yg7yULBoVNRiIAvkhlUAmaOjLFF oc53KasyfByDDtfspNoi1jEewyVpUB5nuJwoJBZHsqO3zQihzk3heyySjCVBzYETFMuhnLtxXfp jwbuKyuOAqkidsgEvb0nprHS2oRjawH0Wh6/WGs8Vu0dH2BckWY9922cqjt8X/H5Y4XgUtKsvqY
 JFBfiuZquxqkiSlAyeOk7y3DBO1QXGZI/wsDv6xrvt35WFCdWBRBbOdL3IE/jePly0O+Oufq

On Fri, Jun 27, 2025 at 01:55:07PM +0200, David Hildenbrand wrote:
> Honoring these PTE bits is the exception, so let's invert the meaning.
>
> With this change, most callers don't have to pass any flags.
>
> No functional change intended.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

This is a nice change, it removes a lot of code I really didn't enjoy
looking at for introducing these flags all over the place.

But a nit on the naming below, I'm not a fan of 'honor' here :)

> ---
>  mm/internal.h  | 16 ++++++++--------
>  mm/madvise.c   |  3 +--
>  mm/memory.c    | 11 +++++------
>  mm/mempolicy.c |  4 +---
>  mm/mlock.c     |  3 +--
>  mm/mremap.c    |  3 +--
>  mm/rmap.c      |  3 +--
>  7 files changed, 18 insertions(+), 25 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index e84217e27778d..9690c75063881 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -202,17 +202,17 @@ static inline void vma_close(struct vm_area_struct *vma)
>  /* Flags for folio_pte_batch(). */
>  typedef int __bitwise fpb_t;
>
> -/* Compare PTEs after pte_mkclean(), ignoring the dirty bit. */
> -#define FPB_IGNORE_DIRTY		((__force fpb_t)BIT(0))
> +/* Compare PTEs honoring the dirty bit. */
> +#define FPB_HONOR_DIRTY		((__force fpb_t)BIT(0))

Hm not to be petty but... :)

I'm not sure I find 'honor' very clear here. Ignore is very clear, 'honor' (God
the British English in me wants to say honour here but stipp :P) doesn't
necessarily tell you what is going to happen.

Perhaps PROPAGATE? or OBEY?

>
> -/* Compare PTEs after pte_clear_soft_dirty(), ignoring the soft-dirty bit. */
> -#define FPB_IGNORE_SOFT_DIRTY		((__force fpb_t)BIT(1))
> +/* Compare PTEs honoring the soft-dirty bit. */
> +#define FPB_HONOR_SOFT_DIRTY		((__force fpb_t)BIT(1))
>
>  static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>  {
> -	if (flags & FPB_IGNORE_DIRTY)
> +	if (!(flags & FPB_HONOR_DIRTY))
>  		pte = pte_mkclean(pte);
> -	if (likely(flags & FPB_IGNORE_SOFT_DIRTY))
> +	if (likely(!(flags & FPB_HONOR_SOFT_DIRTY)))
>  		pte = pte_clear_soft_dirty(pte);
>  	return pte_wrprotect(pte_mkold(pte));
>  }
> @@ -236,8 +236,8 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>   * pages of the same large folio.
>   *
>   * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
> - * the accessed bit, writable bit, dirty bit (with FPB_IGNORE_DIRTY) and
> - * soft-dirty bit (with FPB_IGNORE_SOFT_DIRTY).
> + * the accessed bit, writable bit, dirty bit (unless FPB_HONOR_DIRTY is set) and
> + * soft-dirty bit (unless FPB_HONOR_SOFT_DIRTY is set).
>   *
>   * start_ptep must map any page of the folio. max_nr must be at least one and
>   * must be limited by the caller so scanning cannot exceed a single page table.
> diff --git a/mm/madvise.c b/mm/madvise.c
> index e61e32b2cd91f..661bb743d2216 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -347,10 +347,9 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
>  					  pte_t pte, bool *any_young,
>  					  bool *any_dirty)
>  {
> -	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>  	int max_nr = (end - addr) / PAGE_SIZE;
>
> -	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
>  			       any_young, any_dirty);
>  }
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 0f9b32a20e5b7..ab2d6c1425691 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -990,10 +990,10 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>  	 * by keeping the batching logic separate.
>  	 */
>  	if (unlikely(!*prealloc && folio_test_large(folio) && max_nr != 1)) {
> -		if (src_vma->vm_flags & VM_SHARED)
> -			flags |= FPB_IGNORE_DIRTY;
> -		if (!vma_soft_dirty_enabled(src_vma))
> -			flags |= FPB_IGNORE_SOFT_DIRTY;
> +		if (!(src_vma->vm_flags & VM_SHARED))
> +			flags |= FPB_HONOR_DIRTY;
> +		if (vma_soft_dirty_enabled(src_vma))
> +			flags |= FPB_HONOR_SOFT_DIRTY;
>
>  		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr, flags,
>  				     &any_writable, NULL, NULL);
> @@ -1535,7 +1535,6 @@ static inline int zap_present_ptes(struct mmu_gather *tlb,
>  		struct zap_details *details, int *rss, bool *force_flush,
>  		bool *force_break, bool *any_skipped)
>  {
> -	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>  	struct mm_struct *mm = tlb->mm;
>  	struct folio *folio;
>  	struct page *page;
> @@ -1565,7 +1564,7 @@ static inline int zap_present_ptes(struct mmu_gather *tlb,
>  	 * by keeping the batching logic separate.
>  	 */
>  	if (unlikely(folio_test_large(folio) && max_nr != 1)) {
> -		nr = folio_pte_batch(folio, addr, pte, ptent, max_nr, fpb_flags,
> +		nr = folio_pte_batch(folio, addr, pte, ptent, max_nr, 0,
>  				     NULL, NULL, NULL);
>
>  		zap_present_folio_ptes(tlb, vma, folio, page, pte, ptent, nr,
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 1ff7b2174eb77..2a25eedc3b1c0 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -675,7 +675,6 @@ static void queue_folios_pmd(pmd_t *pmd, struct mm_walk *walk)
>  static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>  			unsigned long end, struct mm_walk *walk)
>  {
> -	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>  	struct vm_area_struct *vma = walk->vma;
>  	struct folio *folio;
>  	struct queue_pages *qp = walk->private;
> @@ -713,8 +712,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>  			continue;
>  		if (folio_test_large(folio) && max_nr != 1)
>  			nr = folio_pte_batch(folio, addr, pte, ptent,
> -					     max_nr, fpb_flags,
> -					     NULL, NULL, NULL);
> +					     max_nr, 0, NULL, NULL, NULL);
>  		/*
>  		 * vm_normal_folio() filters out zero pages, but there might
>  		 * still be reserved folios to skip, perhaps in a VDSO.
> diff --git a/mm/mlock.c b/mm/mlock.c
> index 3cb72b579ffd3..2238cdc5eb1c1 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -307,14 +307,13 @@ void munlock_folio(struct folio *folio)
>  static inline unsigned int folio_mlock_step(struct folio *folio,
>  		pte_t *pte, unsigned long addr, unsigned long end)
>  {
> -	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>  	unsigned int count = (end - addr) >> PAGE_SHIFT;
>  	pte_t ptent = ptep_get(pte);
>
>  	if (!folio_test_large(folio))
>  		return 1;
>
> -	return folio_pte_batch(folio, addr, pte, ptent, count, fpb_flags, NULL,
> +	return folio_pte_batch(folio, addr, pte, ptent, count, 0, NULL,
>  			       NULL, NULL);
>  }
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 36585041c760d..d4d3ffc931502 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -173,7 +173,6 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>  static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
>  		pte_t *ptep, pte_t pte, int max_nr)
>  {
> -	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>  	struct folio *folio;
>
>  	if (max_nr == 1)
> @@ -183,7 +182,7 @@ static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr
>  	if (!folio || !folio_test_large(folio))
>  		return 1;
>
> -	return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NULL,
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
>  			       NULL, NULL);
>  }
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 3b74bb19c11dd..a29d7d29c7283 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1849,7 +1849,6 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
>  static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>  			struct folio *folio, pte_t *ptep)
>  {
> -	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>  	int max_nr = folio_nr_pages(folio);
>  	pte_t pte = ptep_get(ptep);
>
> @@ -1860,7 +1859,7 @@ static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>  	if (pte_pfn(pte) != folio_pfn(folio))
>  		return false;
>
> -	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
>  			       NULL, NULL) == max_nr;

I hope a later patch gets rid of this NULL, NULL, NULL... :)

>  }
>
> --
> 2.49.0
>
