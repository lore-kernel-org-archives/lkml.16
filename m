Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A28F4E2
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 01:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746580613; cv=fail; b=NqY8wHqJJd8kE+8SJISM++RaqfXYXJ5Nw5ZjqBpwNpIKHy8Zeg6MAxVIIb3NrhQl8nbUvZT3+D3ahpVE0hVN5y6CeGvxf4VvxNw3egNNpcaEfdWIpwRdFIVq/3PFpLcTDA6SM+PHEeKQydrw1t8pjATyYzxqN0eeeCOmRI1Pp4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746580613; c=relaxed/simple;
	bh=WzGSA/qcoGau9NmxAdgNYS+fihD8cKQ0obdMC+mj0OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LBIB9+gVGMqmaOXz6ceWuc8dserWszqFElhcwOuKf/u7NHbk3cpM0n5lCvFdjtUaotua+hz072mVHFfXsaJE5DmF9Q5V6u2dI7nMS51+mqsI8iu0Tcc1Cftf5EBpH1AyALV4i8iEVvXO2Y5nB7MhsyoRXeVi4d5CszFKWX8QKBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eAt+NPox; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=siNowB9x; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eAt+NPox";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="siNowB9x"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5470Vbji029230;
	Wed, 7 May 2025 01:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=T7jx+5zzc/nFjOS5fGf6MGBPkzXozVdmqRM/DjGXM4c=; b=
	eAt+NPoxiRJ0s68IF+/5J5LUXT8cowzj31+bRaxP3qsPwBXteEfCjP0p6LBqlDcJ
	JxyV2MPIy9Xl4O7O16LsP+hxBeVNTWUYCOePdSyIqeA1+Dc0rNq8JhPUPHavmcMU
	4pOu+UFSPgkwCgSaYsWxOIHXjEs5sLYYByWRQGB+kr5XUZcjTpnsSlKLM3P1oBm5
	wTK4QzkIfpSzrvKHpQ7tppDsmHb9zTbvJ8VcIXtK9UlpK3hNEuXxxKdPv9Xyaijb
	2hmSBF06tCG2YTz9l0NUKXySrzpt3L3dzBWy6SLdTfJaSnzlyMDt/aR6aSZwVW06
	BunKovkMpWKr8n6Tx13gJg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fw2a81kq-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 May 2025 01:16:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 546Nggj2025048;
	Wed, 7 May 2025 01:12:32 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazlp17010005.outbound.protection.outlook.com [40.93.11.5])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kg14p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 May 2025 01:12:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmrkW5M5qucFjzBcEHgmYktvVGs7Rr34++oxpatT0nwo/VmmH6OnEtqr5/jLDFp47TkTClnQJ9DRrs6/zqsCK55no25Uz8Z9TkHY2EQyEqfwHFC68tl5AO6sJ9nwHOiG/XbU7/IMfdtXMBUixQp3BkY/Bofvc/EpDI/kuhhRm0HViwkhL4KCb1evgmOfHVOOBMWR6eto9Chrax9A1yeP5rp2ic2nzu8trtnR23thoZhCOHdBsMLd00Dpg8a4VsoP5SuSWg4iLjyyEi5lKVGplui9rxvK1xUnxZIikFDWmmmHK1j6a3wdXC9u/g0NYx4Z9CxEqGZcN2GNi7Up+8YV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7jx+5zzc/nFjOS5fGf6MGBPkzXozVdmqRM/DjGXM4c=;
 b=w1INKuyqS7YHOnos7guJkKbJzp80W5OSBjzhGKfyXAK9ZcgWMkIoVgYjKTXnnwNVcyTcC7bYqZ0Fwv1Z/7BtOyA/nABuwgb3tWgBHtIQeZS+Pec94yKbBwqsc8zoe0Nj22Z3S44WnuSftptPUIl9cBKwe5erNuLBmGtagNzw+GfVR8Ymdk40XojjeHMrw08W33p/GxZjK3OVP13uodN1RUpTOfqQBSXGfy3DO7nkQf6ae8zrq5YbNjbPXATUXi5DlFcafnwidZ33OCNwKHCdTy4lC/TlYOPDFtpRpKshZFGIv3M4fKoq/uDQB9S7bO1awSkvNXqLfscR1o8V4ps9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7jx+5zzc/nFjOS5fGf6MGBPkzXozVdmqRM/DjGXM4c=;
 b=siNowB9xsq07nkS/OQuXK/mZOy/9fe59k7XdCnT7LivaTj2StmXqQn3grmaQXOx/XQlNDuNzzuXZQg3JmDdazTVnnre1lPgWokB1oFGaEeAWt8vYXypi3SoLtLHN4STsFE4YF/jb7vN5Ltin/2fpctOd0KAwSFn0M7e6JECFBn8=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by PH0PR10MB7064.namprd10.prod.outlook.com (2603:10b6:510:280::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 7 May
 2025 01:12:25 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 01:12:25 +0000
Date: Wed, 7 May 2025 10:12:16 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Nhat Pham <nphamcs@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>,
        Chinwen Chang <chinwen.chang@mediatek.com>,
        Andrew Yang <andrew.yang@mediatek.com>,
        James Hsu <james.hsu@mediatek.com>, Barry Song <21cnbao@gmail.com>,
        Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
Message-ID: <aBqzcIteOzC9mRjY@harry>
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
X-ClientProxiedBy: SE2P216CA0012.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::12) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|PH0PR10MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cfb471b-b87c-4c65-8809-08dd8d043a14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHBBZHp6clhMUUpmc2lOMkVjcHJkRms0SGlpU1VDL3RzbFI3NXJhekF0TENp?=
 =?utf-8?B?ZmxJRjBDOU9rVnNpYVNYTFMrNnRxSjdUMDNtRjBkVEgrZkFKZWM5U3dTWitV?=
 =?utf-8?B?cEliR3ZZQ0ltVWhncjNaNlY4TVF5dUg5ZDlTNFk0NzNFWXZ2Vkx1VFFzZlN0?=
 =?utf-8?B?WnBsN0hnM3NJb2tHNXN2SldCMlF5ZCtLUy9Pc1ROOTRrai9LUmFnWmMyemNx?=
 =?utf-8?B?VVQwRG5MbC9RajZUVEYrV0xuVGFmUjFQb2lnZ1c5OHdqRXdNa2Z6U3VvNG4z?=
 =?utf-8?B?T3Y5ZkF1dlVsU2hsbk1yVjRJY0RnNFI1RE5UTmpRazJVMzhXTlJBOVBsNUxW?=
 =?utf-8?B?YlgzK1J5Uy9KWFZ4S3NRQjNlVmtIWlFHclMyNXNhS2FzWFFDR0pselBCWUNF?=
 =?utf-8?B?dERlZU8zLytQNDZ4UG5nV20waVhqdStkQmNweURnb0ZBMWtGbGc4bXVDTWh0?=
 =?utf-8?B?Z1dTTFJ4MTQ4bngyR0cyYXZMWTU0bFNoc21IS2ZBNVdFMjh0bnpYcUtqRis2?=
 =?utf-8?B?U1BLRTRvb1o1YXZIOGRaLy9IS1pCL1dIU2tqOHdSVk1mWmtLYWhyVmxQY1p6?=
 =?utf-8?B?d2hIUGVaK0Jyajc3eDdVWi9DWTJJMUg1bDhJemFYeXZuRkFndWUraW10czI0?=
 =?utf-8?B?N29Id1d2OVJkclhDK2hXcG9EZU9tclFxR1oxY3lIVzk3MHNFWXhOUERvVUhK?=
 =?utf-8?B?YTVraDkzMHpOZ3p0c3BJUkV6K2JpOHRRbmhCQVRYYjd2TEowTXBIWVgySnlj?=
 =?utf-8?B?RXdSNWRNbjRjRUhSa2Vpd1pKUGxwdFg3WlZFZjJ1VWlra01USktubGxpZVBj?=
 =?utf-8?B?L3pwY05VNSs0Y1Z3MXBrZmk5S0tTU0IxKzlFR09KNU9oTUd1c1JZekFVVWsr?=
 =?utf-8?B?T1ZZWWd2YzBRZXh3RDk1T2lsMTlMNEZocDFzTGo5d3dtbHBWZUwwU3k4TDdu?=
 =?utf-8?B?N0JyMEk5VGJDeWxxdFVGMEJNbGhJMW9XU1B2RURKK1lFVHZqa1Bsanl3dlJs?=
 =?utf-8?B?c2NIYkg2cXlpczBTTU9ocFZkTlJ5MjMyRERyMDZVb0R1V09UYUovVjlpZWo5?=
 =?utf-8?B?bkdEbTZkWkNUakVhZlZGd1pSL0E0RUZBSUo4OTBhclNLNjR5R1lwZndHNWNU?=
 =?utf-8?B?Qy9DNlFWeDVueEZxdFR0Smd3Z2ZWSHRxTk1BRFYreklQL3FQU3hqRkZSNDVS?=
 =?utf-8?B?NWRLYmZaUXJac01RNUhjSnVKSjJlZmZ5YlhFdk5LUEpCQVFndDNFVytSdCtL?=
 =?utf-8?B?S3VtYW5oR1VlcW1XaFRjL0xaLzdwaFpFRDZ5UXUvWmxiM2tmU0hkbU9URWRK?=
 =?utf-8?B?azd5aDNoUUVGblBoVzJ1dFdtWmdLOTc3QWRuSys0S0p1WEkwSm5vR0taRjMz?=
 =?utf-8?B?ME9nTWxzZXMrdll2dzFodUV2N1Naam1tczJpbHA3VHVQSDkzWUlhRTBSOUs2?=
 =?utf-8?B?MmplM1lJcnR5OEI2OFoxL24yV1gwbGRaZ2VRZE8xb0E1VWFKRXpGcnI0Qzhw?=
 =?utf-8?B?U3ZOTzQxckZyZzNGNElwZXQ4enMybVZ1MGcrWWt0STJwam1RSWdheGJWT0N6?=
 =?utf-8?B?NnpuN0NxMFVLcFVLVElIa0NHMlVDZFRPNS9RbW0zQ1U0anVLTDRYZy8zTWVy?=
 =?utf-8?B?bkJxeVU5QzVhRGQwcmUrT0JPbDdRU0s5SjQ2R2xYK0dCcC9oUW1ZdDdIVXFN?=
 =?utf-8?B?TXlIUmlrMXdpSkZ0MXh1dTlPVzJ4VEdDdUdOZnVoekp0SU0xMnJyQlVQMFgz?=
 =?utf-8?B?OGxEZjRROXRQaW51Q0x6dUo2LzMzRHo1ZkM5bXNzVHRUdjdUZ0twNGlrTEVN?=
 =?utf-8?B?QTBmeWlNODhvemRwYzZWb25pQTJweSsxMFk0OG5EbU5WeGZmbkhhZzNtbi82?=
 =?utf-8?B?Snk4UzZFS1lDSTJ3cmVKKytLQUtURzMvZU1WSXg5S3hRSnRUL3ZSWFJBVW5Q?=
 =?utf-8?Q?jTD4yVGYGSY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFpXTWJ3ZHJtREN5S1E4R2pDUzdldXhlU0xiUTVXbS9XWUQvbERMS2pwNWVE?=
 =?utf-8?B?WmNJUHNNL3NFclZRUlVvRFQ4OCtySVVDYWFZMUJXMGhLdFM5ZmhzcThPUnU5?=
 =?utf-8?B?N0syakh1VTR0RFR3UGJEU0dyc0FjYmtJclkzQlRNdzJKaW9QWm1RaTIyVzhH?=
 =?utf-8?B?UEI3ZFhmYWFLZ1VSSWtSTDB6b3dpWFd5Nmk1M054YkZJd08yYjZOaGtzcjJN?=
 =?utf-8?B?UlhLdGI1bHRTTUZMUWRiU0syYTV4eUxoSCs1N2dSSm80N1FqcCtNLzlQQi9u?=
 =?utf-8?B?V0xZMERwNWJkM0tyYzQwTkZQZm1XM0FPc0Y3UEU3NVZZZEpvc3hUbFkxRkpF?=
 =?utf-8?B?K21MKzZ4RzFXOE9SVkZkY1F2VUhqbGNXWjRvbnNkcUJ3MXE3UzBNbXZzMnUz?=
 =?utf-8?B?SmFQaGEvNk5ZdndtL3E5K3Rna2h6ZWRRY2Z4TEsvNHp4OWkwNVdrbzJMZWJ3?=
 =?utf-8?B?ZG5lS2pvS2ROekxlN0JNVndnYW9IcVlralJhMTJma3BaOW5POTVNb1dEYmRq?=
 =?utf-8?B?WUhVK1daak5raWxBZXM0TmJkVGhvUVVmQzFQOUI1NW9OcWVOTS9ja2VLa3dk?=
 =?utf-8?B?TlBXNGUxZUlqY0hSMkp1RlRRNGx6TnhabzNNVGROUHE5L3gyUUN6eHg5c29L?=
 =?utf-8?B?S1M3NkN0bjlydHBzNGdnM3ZmenhwVG5lLzVCdnlTUTV6QkIrSG54QTd2SUFE?=
 =?utf-8?B?aG90Q0JkT1ViYTdRTHFrd2gySkZ4VjFDRjloRU0zdWZwcG5ic2dRRUsvUXV0?=
 =?utf-8?B?emNVRzZkQ2pzSnpTQ2VnRzR4VVBOMmYyNUV0MVUxTFBtTnZKUnlJc3g3N0FS?=
 =?utf-8?B?bVN2eEk5LzRkQmMxSHlnQlZ6L0JrcThBSjR4OXBoaTFvMWtncDBFR2NCeERa?=
 =?utf-8?B?bmluUmF4Z0FuRGd0cm53NWtNRlQ0VHpDdXpMOUpVYzN5NkZORHNmSlJ5eW9z?=
 =?utf-8?B?aGdTblRmKzZ1clJQcVhzTkswMzhNNS91ZlVXNnF5ZHpVR2ZpNTdEMjYyNFlO?=
 =?utf-8?B?UUU1bWVOb0hTUUR2d2dGcE55KzJQNURlWXIyY3NUMk05d2JuNVNaZERucFhE?=
 =?utf-8?B?dlp5UjdUSmtFdUZycFNQMkxHelYrcjhpdlJpMUxGV2hpRFo0bXY5WURHRHFF?=
 =?utf-8?B?cm14dC9QdzNoQ0QzelAvMkhXaU4vZ2Z6NGVDNWR2VWtlSWsybG1lVFY0KzBX?=
 =?utf-8?B?U1JrYkFuYVA2UnIrSjdPeVE3ZWphYXpCdWZkNTJlMWMwdXRuRWZKVTB2L2FV?=
 =?utf-8?B?ei9hQXYxVHZIbm9WM3ZyS2hlQ1J2R290RFZaQXJZblpsR1Ztb1dFQ1hhUmR1?=
 =?utf-8?B?a3NXY1FWdU9QMnpLTFlEbTlrejhBdnJNcHgrb3VCa3Jhb2NHZlZoa1NicFU2?=
 =?utf-8?B?Qm55dXdYUitIRHlhN1ovSUlCNUpNRUdObjFmc0FLOVBnUmNKbFNsK0lhTjV4?=
 =?utf-8?B?RGlUNWV5UTFaM1pHTlJYQlRjUVFCWVpzMmpZYlFqYmVpcE4xRnp4TDBia2c2?=
 =?utf-8?B?VFRpWGJraUdYUmN4V2QzYXNtU2VjRDY3K2hRa0R3OVRIVzY1WDlmTmY0QjM5?=
 =?utf-8?B?bWF2YVEzcEtmWkRiMHdKdHB4WlRsaTRFc2xBSlFDQ1B4QW9NcmlwcHh0bThr?=
 =?utf-8?B?cmg1QWtldElORXdoU2Vqc0FMMmRlamVXRGlLY3l1cFBNRmFFSWJ4MEtMdUFw?=
 =?utf-8?B?UE5sTmNLVUp3UWI3bEphdHRNM0RmZU5tc1hzRmhlM1pCdHFJTk1oQ1RNWTN3?=
 =?utf-8?B?MXVMRFU3am03ZzZ5Wkp6eG9FMUFOQTZIdmVyVVF4aGgweThydXU0Z3laRzBv?=
 =?utf-8?B?K2JyVm9jSWM3eUNTd1hDL2d1cUR6alFiN0gvMWhZZTF5SU95anVaM2tFdzVE?=
 =?utf-8?B?WEhtNERoU1hDWVFGcE5aekhWY2FSOGZzUmVoQXBLTjNhM1M1VmxZK3o4ck5E?=
 =?utf-8?B?ZVBLWm1RcFZSZWxhWGduMExVUmJERVlJWFVRZ2dpRERxM2JDZ1ZlVEFZMW1n?=
 =?utf-8?B?YkdLRGNhS21pSlp5OC9SdURSOTUwV053amhuQ2VMM1NzTzMyUnM3L1RhV0FI?=
 =?utf-8?B?M2dNMjIwZWRrbDlFNWpXTHlpL0tza01McjNvZ0RBa2pkaFVyQSt3a3hGQ3Mw?=
 =?utf-8?Q?QUkKVl7UUsDcCgKh0UZ0znzXO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wMvLoBzpd6frFJ8ARd+2jgN0zomAmlTpexKSgXBvUnpZt51an8C8ZISabcYbPeXWrWqak2idVFYXPFHpiOY7TAs6wH3CPZt3UULyKKA8x4c93J5uEr+r4xghFy2Di+NFji/RALFAzeFVy/SmDNGhFXYWpWMSjboZfi9hf8gsGtrOzGQjrh+CDmRl5R17HI3LjRJqafYXgjOL/cgj7U2zRSveJIZGg9XlvBZck3TB1d5BzHjQnXOZ2OIMeL+PdtXmbIE+7LFD7ZqcPRYAzdVRXVQV49Do4iUVcjyRAFB+THvex85XfXJTerrZ8E3bb99JAwWWGcsen5+cxeIc1VgbC8XxikAWaXXZd21mwtmUbeKgvWSS5AVJ079vkRU55w7Z0X5t1krSEKB9lP6aTz2wv2Wb1K0xI5gXhwBt5p1SbcjVPqrILaeBUQygj3HmkVFfAOlb8S5RCJHsHMVz4iux5j5h1eWa0zlzM3+7VwcbZDP/l1uLofBO/JaKnKKATgTYgBRjDmEw6IJwZOr1YOkLr9rPv8JPkwatna+uGIXuj2swMmnJWX220w8mqrP9TcYVB89cFOVcswMjk2yBdjcEdJ/AzgNH8ah+gYC8AV0FMSY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfb471b-b87c-4c65-8809-08dd8d043a14
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 01:12:25.2060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYQeOeej3o5vNVwW1WkHLazAddhbm5kxxQyknRttgNK9p1zgwuoCxEEhMwgfWqebCMGx7xVfhJ0m5/AgkuK01Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7064
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_01,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505070008
X-Authority-Analysis: v=2.4 cv=etLfzppX c=1 sm=1 tr=0 ts=681ab470 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=mpaa-ttXAAAA:8 a=Pk-tu-amqDxEJIEjfv4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13185
X-Proofpoint-ORIG-GUID: z7ImCdnQUOoGAMUIwkj8VfVnLH1WdgjE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAxMCBTYWx0ZWRfX6Mqng6Z3oCv7 rXfXDHFVkU7DR9JVPDhahztoXAflPopQ5hX7hqqj+QF41vQthntUCzQlXa+2hddKR8aBDhP1j3X n5KRd0RMExhMEnytPrvtbLFsKjDUa57J1YaMrPJV6lDuBkscgG8KIA/KitLOj5VmBjbQ6viwcIb
 uSo8hDiuZA3W8XUWlKot3Bx/MSjyCJo3bw4AvZICsE2rCxhr0cneHEWTKkzDMvzRbmUEoEH+J0b rNxIpfb+eGcae5saoWQpOUykClhclXOmcX1kYAhZpQOS42n5VWiAGjtKw443pVdQV1IzmE/SQLO Vif89pHnYO7NotYz/jJSaakStN5waDQ5YYKvdgB6L0finccpfHwOnxCV7hNOG8sE8ZBpN2s1hsH
 Kf2a77inZ0NZWzcs6sij6WO07McreYhcJtxqzc4hjM1PPREknFKpz0q+ypoSMPBZDEQ+YEAI
X-Proofpoint-GUID: z7ImCdnQUOoGAMUIwkj8VfVnLH1WdgjE

On Wed, Apr 30, 2025 at 04:26:41PM +0800, Qun-Wei Lin wrote:
> This patch series introduces a new mechanism called kcompressd to
> improve the efficiency of memory reclaiming in the operating system.
> 
> Problem:
>   In the current system, the kswapd thread is responsible for both scanning
>   the LRU pages and handling memory compression tasks (such as those
>   involving ZSWAP/ZRAM, if enabled). This combined responsibility can lead
>   to significant performance bottlenecks, especially under high memory
>   pressure. The kswapd thread becomes a single point of contention, causing
>   delays in memory reclaiming and overall system performance degradation.
> 
> Solution:
>   Introduced kcompressd to handle asynchronous compression during memory
>   reclaim, improving efficiency by offloading compression tasks from
>   kswapd. This allows kswapd to focus on its primary task of page reclaim
>   without being burdened by the additional overhead of compression.
> 
> In our handheld devices, we found that applying this mechanism under high
> memory pressure scenarios can increase the rate of pgsteal_anon per second
> by over 260% compared to the situation with only kswapd. Additionally, we
> observed a reduction of over 50% in page allocation stall occurrences,
> further demonstrating the effectiveness of kcompressd in alleviating memory
> pressure and improving system responsiveness.
> 
> Co-developed-by: Barry Song <21cnbao@gmail.com>
> Signed-off-by: Barry Song <21cnbao@gmail.com>
> Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
> Reference: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd - Barry Song
>            https://lore.kernel.org/lkml/20250313093005.13998-1-21cnbao@gmail.com/
> ---

+Cc Zi Yan, who might be interested in writing a framework (or improving
the existing one, padata) for parallelizing jobs (e.g. migration/compression)

>  include/linux/mmzone.h |  6 ++++
>  mm/mm_init.c           |  1 +
>  mm/page_io.c           | 71 ++++++++++++++++++++++++++++++++++++++++++
>  mm/swap.h              |  6 ++++
>  mm/vmscan.c            | 25 +++++++++++++++
>  5 files changed, 109 insertions(+)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 6ccec1bf2896..93c9195a54ae 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -23,6 +23,7 @@
>  #include <linux/page-flags.h>
>  #include <linux/local_lock.h>
>  #include <linux/zswap.h>
> +#include <linux/kfifo.h>
>  #include <asm/page.h>
>  
>  /* Free memory management - zoned buddy allocator.  */
> @@ -1398,6 +1399,11 @@ typedef struct pglist_data {
>  
>  	int kswapd_failures;		/* Number of 'reclaimed == 0' runs */
>  
> +#define KCOMPRESS_FIFO_SIZE 256
> +	wait_queue_head_t kcompressd_wait;
> +	struct task_struct *kcompressd;
> +	struct kfifo kcompress_fifo;
> +
>  #ifdef CONFIG_COMPACTION
>  	int kcompactd_max_order;
>  	enum zone_type kcompactd_highest_zoneidx;
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 9659689b8ace..49bae1dd4584 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1410,6 +1410,7 @@ static void __meminit pgdat_init_internals(struct pglist_data *pgdat)
>  	pgdat_init_kcompactd(pgdat);
>  
>  	init_waitqueue_head(&pgdat->kswapd_wait);
> +	init_waitqueue_head(&pgdat->kcompressd_wait);
>  	init_waitqueue_head(&pgdat->pfmemalloc_wait);
>  
>  	for (i = 0; i < NR_VMSCAN_THROTTLE; i++)
> diff --git a/mm/page_io.c b/mm/page_io.c
> index 4bce19df557b..d85deb494a6a 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -233,6 +233,38 @@ static void swap_zeromap_folio_clear(struct folio *folio)
>  	}
>  }
>  
> +static bool swap_sched_async_compress(struct folio *folio)
> +{
> +	struct swap_info_struct *sis = swp_swap_info(folio->swap);
> +	int nid = numa_node_id();
> +	pg_data_t *pgdat = NODE_DATA(nid);
> +
> +	if (unlikely(!pgdat->kcompressd))
> +		return false;
> +
> +	if (!current_is_kswapd())
> +		return false;
> +
> +	if (!folio_test_anon(folio))
> +		return false;
> +	/*
> +	 * This case needs to synchronously return AOP_WRITEPAGE_ACTIVATE
> +	 */
> +	if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio)))
> +		return false;
> +
> +	sis = swp_swap_info(folio->swap);
> +	if (zswap_is_enabled() || data_race(sis->flags & SWP_SYNCHRONOUS_IO)) {
> +		if (kfifo_avail(&pgdat->kcompress_fifo) >= sizeof(folio) &&
> +			kfifo_in(&pgdat->kcompress_fifo, &folio, sizeof(folio))) {
> +			wake_up_interruptible(&pgdat->kcompressd_wait);
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>  /*
>   * We may have stale swap cache pages in memory: notice
>   * them here and get rid of the unnecessary final write.
> @@ -275,6 +307,15 @@ int swap_writepage(struct page *page, struct writeback_control *wbc)
>  		 */
>  		swap_zeromap_folio_clear(folio);
>  	}
> +
> +	/*
> +	 * Compression within zswap and zram might block rmap, unmap
> +	 * of both file and anon pages, try to do compression async
> +	 * if possible
> +	 */
> +	if (swap_sched_async_compress(folio))
> +		return 0;
> +
>  	if (zswap_store(folio)) {
>  		count_mthp_stat(folio_order(folio), MTHP_STAT_ZSWPOUT);
>  		folio_unlock(folio);
> @@ -289,6 +330,36 @@ int swap_writepage(struct page *page, struct writeback_control *wbc)
>  	return 0;
>  }
>  
> +int kcompressd(void *p)
> +{
> +	pg_data_t *pgdat = (pg_data_t *)p;
> +	struct folio *folio;
> +	struct writeback_control wbc = {
> +		.sync_mode = WB_SYNC_NONE,
> +		.nr_to_write = SWAP_CLUSTER_MAX,
> +		.range_start = 0,
> +		.range_end = LLONG_MAX,
> +		.for_reclaim = 1,
> +	};
> +
> +	while (!kthread_should_stop()) {
> +		wait_event_interruptible(pgdat->kcompressd_wait,
> +				!kfifo_is_empty(&pgdat->kcompress_fifo));
> +
> +		while (!kfifo_is_empty(&pgdat->kcompress_fifo)) {
> +			if (kfifo_out(&pgdat->kcompress_fifo, &folio, sizeof(folio))) {
> +				if (zswap_store(folio)) {
> +					count_mthp_stat(folio_order(folio), MTHP_STAT_ZSWPOUT);
> +					folio_unlock(folio);
> +					continue;
> +				}
> +				__swap_writepage(folio, &wbc);
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
>  static inline void count_swpout_vm_event(struct folio *folio)
>  {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> diff --git a/mm/swap.h b/mm/swap.h
> index 6f4a3f927edb..3579da413dc2 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -22,6 +22,7 @@ static inline void swap_read_unplug(struct swap_iocb *plug)
>  void swap_write_unplug(struct swap_iocb *sio);
>  int swap_writepage(struct page *page, struct writeback_control *wbc);
>  void __swap_writepage(struct folio *folio, struct writeback_control *wbc);
> +int kcompressd(void *p);
>  
>  /* linux/mm/swap_state.c */
>  /* One swap address space for each 64M swap space */
> @@ -199,6 +200,11 @@ static inline int swap_zeromap_batch(swp_entry_t entry, int max_nr,
>  	return 0;
>  }
>  
> +static inline int kcompressd(void *p)
> +{
> +	return 0;
> +}
> +
>  #endif /* CONFIG_SWAP */
>  
>  #endif /* _MM_SWAP_H */
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 3783e45bfc92..2d7b9167bfd6 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -7420,6 +7420,7 @@ unsigned long shrink_all_memory(unsigned long nr_to_reclaim)
>  void __meminit kswapd_run(int nid)
>  {
>  	pg_data_t *pgdat = NODE_DATA(nid);
> +	int ret;
>  
>  	pgdat_kswapd_lock(pgdat);
>  	if (!pgdat->kswapd) {
> @@ -7433,7 +7434,26 @@ void __meminit kswapd_run(int nid)
>  		} else {
>  			wake_up_process(pgdat->kswapd);
>  		}
> +		ret = kfifo_alloc(&pgdat->kcompress_fifo,
> +				KCOMPRESS_FIFO_SIZE * sizeof(struct folio *),
> +				GFP_KERNEL);
> +		if (ret) {
> +			pr_err("%s: fail to kfifo_alloc\n", __func__);
> +			goto out;
> +		}
> +
> +		pgdat->kcompressd = kthread_create_on_node(kcompressd, pgdat, nid,
> +				"kcompressd%d", nid);
> +		if (IS_ERR(pgdat->kcompressd)) {
> +			pr_err("Failed to start kcompressd on node %d，ret=%ld\n",
> +					nid, PTR_ERR(pgdat->kcompressd));
> +			pgdat->kcompressd = NULL;
> +			kfifo_free(&pgdat->kcompress_fifo);
> +		} else {
> +			wake_up_process(pgdat->kcompressd);
> +		}
>  	}
> +out:
>  	pgdat_kswapd_unlock(pgdat);
>  }
>  
> @@ -7452,6 +7472,11 @@ void __meminit kswapd_stop(int nid)
>  		kthread_stop(kswapd);
>  		pgdat->kswapd = NULL;
>  	}
> +	if (pgdat->kcompressd) {
> +		kthread_stop(pgdat->kcompressd);
> +		pgdat->kcompressd = NULL;
> +		kfifo_free(&pgdat->kcompress_fifo);
> +	}
>  	pgdat_kswapd_unlock(pgdat);
>  }
>  
> -- 
> 2.45.2
> 
> 

-- 
Cheers,
Harry / Hyeonggon
