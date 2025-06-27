Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F244C2D3EFC
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.58
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030909; cv=fail; b=oBNMwHD6Iam/CrEhUkQo+UMH4A7cG6fxHxK0nKLXfEktOn4/pSh3q00CvsM6KVgEpNEOdZOT8bwYMqfVZbstqTxjel3PW6zOM494qwSv9nXBfkbN0KiqT+7k7a6IoLE6EsRgWzufvJ0+FEjKu0vP8cCUDXzZsJ6l2NdputG+zyg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030909; c=relaxed/simple;
	bh=rD5ZTVFPZcGQgiLeP7D7czYleZ7gqXkH2mJU8J8uruU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MjvMua90U/aZ6JUvgfsnCBPZ0LzXy5uRn9WBG8Y2fIez1Z//qbkdmKDPctGOTW+TaqiZRm7BqBWXu5yeWP1AHwEPh7097cJx/IFLauo4EXG+iJAdWgFATcEqQCvdX/xlOVXfAgOk+FeA7yF8fxuDX0XNi8ALigkZa39KYxfJEMs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iIbXo7bd; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iIbXo7bd; arc=fail smtp.client-ip=52.101.69.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iIbXo7bd";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iIbXo7bd"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lTQXNg7ASEQMvP+6VqshIa8vl/+Tk3FLZv1Kw1fsCjavLavOc+bZFlcucPUPQ/VQkAWQpt1hab7nPJTJefb23ALKA41TCoCIp4CwplgnQfh9aY/kiOC9nUkNO9YnRtXWKI3yV/X4Ka1YyZUywmom8+c2LkfODmiG0Or9rpkFJ2hR6oSAuHQuiccQfi/cV3WUwtAjwjfEYe3yCN60luQ4bDPHTWPC48YES9SKEG765eiarMLQ2aG2Z0cJqK/X6oJ5PvZ24BVKeuKy7svF5+QCWxgutYnT259AOoJQuE28jf0TkDRZAukYXzM95jqcvjxW5dPfMSe0y7KnQckvYmA+DA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/h68BCxUMxC06RKAQkvg1yXgaQMjvwe3VT5pTjOm+4=;
 b=DToTLCAbrEkVSk3hNXkde3ezlzeQLYqJ2xzmgxWif26yMnXYtai3xFLp77qcMdREIEKVz3M3JjhtAP9DOhTvEa7DKOWnl+GWwFMDZC+jEMoCApgPU8S7NeKY9muMpM9SvCljJkJF5MhCWOu6c2ZRn3FimLBsiWnAPfslYM2SG4V+Q5LBbis50Oxkap5QCTOyc9MlAPeWV4cGSFALkREwtMr8b4D+s+82C+7d3yFOKnsyUVceu2QAambgVef3ahIq6h4cEC1LRqz8wZP+t2+gwNoxSw8WjGoiyVrr/RGgUzmF1XeO0uCaHCK3IMUYakKQMPuNJA541lY6RmNhMIGsnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/h68BCxUMxC06RKAQkvg1yXgaQMjvwe3VT5pTjOm+4=;
 b=iIbXo7bdmQfxAW4VfqM5+79s7wlpyxfibdFoIeQCDC/S0sK4YxqENnYbpuhgCRVfyayQLXGJ5ls1PBRFPP+6W/GLiQLSC7QMYBHTV5bqVcOMHhd7NmI7PedWNS9DSBIIrn0Su0cjL1UvA636VM8+LlBlF2aA6bUjUIQTGUCY3vI=
Received: from AM4PR05CA0032.eurprd05.prod.outlook.com (2603:10a6:205::45) by
 DB8PR08MB5433.eurprd08.prod.outlook.com (2603:10a6:10:118::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.18; Fri, 27 Jun 2025 13:28:24 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:205:0:cafe::36) by AM4PR05CA0032.outlook.office365.com
 (2603:10a6:205::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.18 via Frontend Transport; Fri,
 27 Jun 2025 13:28:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Fri, 27 Jun 2025 13:28:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0z0Ex2SpfN7SpBe0EpGelZfzf1VJgQI7Vq/aY6mZblhqBtlnKaNtU3+T4tz4lVF9tnN1fVYvr0ZQPurrx5wz6K2lg3tKeN/xbCXjazAex1A/GCkN7M9ILJNQqodf6/KZ3OEb819svwXMvZFkXOS29YaliAGzHpKJ7wMRgPyZydLsym8zwdNaPRHw+nHjqX7Jmfgah+Bkfslhqk1Fu3tfg2kHPcemIFesijZnzQJN5KsF3o3Oa8fxlzVl02uDkUOgp4SrFVdPhy+QI9cxSK5kGz9QM1eas/NferIwmF5RIAaozxxp5KJxOvapGPhv21xjsuGfzklp13ZsiTJtPtxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/h68BCxUMxC06RKAQkvg1yXgaQMjvwe3VT5pTjOm+4=;
 b=hCiMf9wuwGzrhKElCoDmJ2sxIbfN6QtN0KtnkkDnzXAt/RhNyPmksyvitVA+wrpnXszt/aQ2UjbCOmUYNkqjqp2LhUj0ydBWT49VUlKpptV4Xhc+gQbCngi2VdbQXfAsmzItf8reOu5CLht6z9AIYp/gFwE83xRZrDXxHwVvm7+UFGXA0qkugKOnD3xGsAgqRnU12EFAsspR6yu1c+1jABQEuuMiwNcmy+NBqKZuWd/RfkyindgTGhFCF2236j/uYjgDlktpNL/4yRHW1cJx0mEyAY6Tosw9iu90p2bhu14U//iHMD+DvoB5FyoRG0azLc4gfihMb8is/tzsSViEgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/h68BCxUMxC06RKAQkvg1yXgaQMjvwe3VT5pTjOm+4=;
 b=iIbXo7bdmQfxAW4VfqM5+79s7wlpyxfibdFoIeQCDC/S0sK4YxqENnYbpuhgCRVfyayQLXGJ5ls1PBRFPP+6W/GLiQLSC7QMYBHTV5bqVcOMHhd7NmI7PedWNS9DSBIIrn0Su0cjL1UvA636VM8+LlBlF2aA6bUjUIQTGUCY3vI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by VI0PR08MB10798.eurprd08.prod.outlook.com
 (2603:10a6:800:211::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Fri, 27 Jun
 2025 13:27:51 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 13:27:51 +0000
Date: Fri, 27 Jun 2025 14:27:48 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/10] coresight: tmc: Support atclk
Message-ID: <aF6cVFA7NpN2S273@e129823.arm.com>
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
 <20250627-arm_cs_fix_clock_v4-v4-1-0ce0009c38f8@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-arm_cs_fix_clock_v4-v4-1-0ce0009c38f8@arm.com>
X-ClientProxiedBy: LO4P123CA0228.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::17) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|VI0PR08MB10798:EE_|AM2PEPF0001C708:EE_|DB8PR08MB5433:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d19cab-ba5b-4586-2073-08ddb57e7df3
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?UbDT1xAawtodrBprZcgYHESoGzQyGoOjuwiXwaSfLyXywyuMpe8oyMsy3fPB?=
 =?us-ascii?Q?0cqHggcp5KZti4mUil8dfxmiDWfwW3nsz7UrpZHUFZR6Hgi6zgU6U95iS+/m?=
 =?us-ascii?Q?IjI48RBTsN4PZk62NI3RbGdH3f6YoJ7r2rVkdt2Pxvpq3Mk2gEYWDW6oxtJ3?=
 =?us-ascii?Q?h5Mh7iblYMKvclu4ZWy/CqnQwibrLqsILxv47PtwHt0JZELMJVmhzUIsto50?=
 =?us-ascii?Q?RqSCT1anPI6PNCp07RSu+0miPnHXpdtDQgvIrUBwB1G10OYkWrSIR7CkNLGL?=
 =?us-ascii?Q?uzw3j5WpCwYPo5VQfMhddXhjXxbL/7XeFmKl3AYhk1woPPc6Yx0/XKEtefpv?=
 =?us-ascii?Q?42vbBw0MnR3Txq0sjxLxKlLyQGMMN0uBki4h9JjY4aprTSmhLfvcriwMY5S7?=
 =?us-ascii?Q?HVdSr4cBkf1K/CNdo37+RllniZZZ3+bta4U42RAzaGBrsuFCBtqBugq6ngTq?=
 =?us-ascii?Q?FXKe7w3jakjAzoP19TEFCn1BOS9HklntsSY+Ax3mDuBij3bJFc/UgwbjXRZZ?=
 =?us-ascii?Q?CHqgpu28aTDsPaSjNei+j7EoEx0GHmXQxxvKaf7yZWz6MQiyPjQ/Ok6QHgLH?=
 =?us-ascii?Q?npIdeL5p0fZM3JF7AoYOw87H9idk4iKxR5CL/3B9gJ0Pk0o8ezozrjqKVTsA?=
 =?us-ascii?Q?pn6GUsr7W+1nkjpiltqdROJfcx958jwBpnwgoQJMIseVvXHdiCFHw3VbGvIU?=
 =?us-ascii?Q?EA/3w8FdnYGJk8nW8h2UWnNRot9I8Oy9moZa++Ak354yGMEQM9+S4h6HZb2J?=
 =?us-ascii?Q?yFVAZPLH0YEHkDkbjHi+uldWoD/88ocVK1GOm0w4UL7UxO6R7xXLzaaatO88?=
 =?us-ascii?Q?SIYJSAFE++JPfTZsBuQYFRKB1nSOBJEUGM2/DvCnw+Fae7sQMIqkZCMgNcvA?=
 =?us-ascii?Q?nWrnnz4FVAI/4dMoVEFvf66v/9Pu/vWNwkkLq9zRCA0+fWGDxPY4wQBQzyoC?=
 =?us-ascii?Q?R4EOWY1N2FwZbHStKP45uq2loYnKnmxdHbiHftkyN/aQGqNA39rYDIng/nkq?=
 =?us-ascii?Q?ajKztmgTCxTar35DVQM0mNT06baaHAiYA/9b5BUg5Xvdn9X9kHBmEzSQG6Ld?=
 =?us-ascii?Q?1p4TikYRbiE4aVgUqtDDwUySiR8d9WN5cvfSzT3S1fOm51vfCGhCdWwWW29J?=
 =?us-ascii?Q?nKYsBGcVbcqKMUsNSOs5ipfiTch6FbD/u2svwxQJ4vYmlcvW24sDoFmQZ4o/?=
 =?us-ascii?Q?x4karQAG1OD1yL4lGK6nF/cR1EHlIon93gmatLLq43v9RicalSkJTlWnHGVe?=
 =?us-ascii?Q?Cv9uHCj4xmwcVkUi7Dbi8I78jvubu4i8meUB6qhfaZOkW9Va26jZPA8TzvyG?=
 =?us-ascii?Q?RnDH39k4FfyN36ZKICmOFyH96Wi3SXo2BX95EEjzc6usonRJlfzur76vnmfx?=
 =?us-ascii?Q?YeGXRpg3nT7LGquW3Pr/Si1uBR1DgOtMVE95SoxoFD+O6f1AwhG7byk4gHCv?=
 =?us-ascii?Q?ToFhrbEVk7U=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10798
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31a46990-378b-4c1a-a972-08ddb57e6a2f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|14060799003|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZvnhpgYBVQLzoXN5MVlu9nND74c/AmRVQ8DjyaTZEx3foPttJKYav+a8iFGa?=
 =?us-ascii?Q?2FHXPZy9WODs+fGEfX86KanNPU7FbezoTcybazG5RW/s9XK0E7fz4vI0PC86?=
 =?us-ascii?Q?z52OYS71BP3kXlQyM5uZ0SyxUbrqlcu82knwNkF5sO0PJfLNuT/OVViNqC/v?=
 =?us-ascii?Q?u0q2AS6fLWKTCvchmyOwnIFeyUGc+nDhieWDdO0LLH8MDjUqDi4vhtvZ8BX6?=
 =?us-ascii?Q?voUc9zPAPO6xedpAlGQQ/iLTvuP4Oa/jguIt0j28cazFPqlKGYAd5kIFyrFV?=
 =?us-ascii?Q?rxzByqnhKl6kq8tntyw0F1Op3Fva3/gJ1/pF7E1G1rRCnltctaQJYlp/4wyM?=
 =?us-ascii?Q?gnUkesyg0biwz6xlFAxKJDAeHIdyipREyXXlWoTYy3xE0+znaszKICMNorUh?=
 =?us-ascii?Q?PDuQrjUC+cs6JcpV+ol/p0JZ9WjTnenwV3qPJJaRekt/8PG3AsK6Dxzyf4zF?=
 =?us-ascii?Q?t85/YMwEHSempa7eKvZ8t6bDtLQGbOVB4Jk/G7h9l/zcYhVNDJVm82hyEKGh?=
 =?us-ascii?Q?7r1BqespnU/s454hGTmRn/GuHtAwm2EirCNlWtfPumqdxyhhZbBh678H+ZoB?=
 =?us-ascii?Q?vJGWbGihiy2++n5SD/XOw0NcM6v7qW0ypGRr12ZjlabM+Cg3DdCRS53uKSrU?=
 =?us-ascii?Q?Ve24hDWHIWm3AekO+S7bT/fJLQwQvctrKEnZE9/yFeBxJ5LHPPEF3MxnF/9W?=
 =?us-ascii?Q?vlGqdJUsOwwMiHtmJMjsqOl3y7iMiPXrUF6EzYiW6XYPQsClXDQSKKWrdEX1?=
 =?us-ascii?Q?H3DHHxg2krbB/cuosppTnd5ejOnMyXFFuYlFM9nTlf6t2VAwXxlBa17yS0s9?=
 =?us-ascii?Q?EM+em7/JG7M7P8RCFFFSmpiFVljBIvqviDq2szjHw/4BcQvuUE42LzxBs5kI?=
 =?us-ascii?Q?XQuO8/NO1LKFy9NhukTerBHZbdAvpalrkqp+njijjNd3J0jRY3ueIBhGyDtV?=
 =?us-ascii?Q?w/AOpN2j8L3dGeJMePI/Sr8P6CPpSw4PIOBOMuSLWp0GGyDBMmjhwfgrHMPM?=
 =?us-ascii?Q?dhYGoTLKwwUWlRpyI7+PfC6DXtU605LT3VwIec2HvrNhYzTYlQRGwBPzIQmJ?=
 =?us-ascii?Q?dssVSz06ktr/LTdUrDl2PgbL03/ggWkiCIh11mwRP05tlkRCqPhB1UFTjo7h?=
 =?us-ascii?Q?P+2HUAGUW5ne2NIldAaKeGMNUnTlRIy6DDs1geu3UwYBNI4eCQpBe+WrOE6n?=
 =?us-ascii?Q?Fkxiq8tOGyZ1nvoP4nPe26tVTrmDaZvCTrkjp4gxzJJfpjLCyZvtw97WSY+Y?=
 =?us-ascii?Q?k+dRXYzsV+9HzlwTGzHD9qPV41aqt8GcXJeh6UakMX28vIS9XuvR5tU5StQ7?=
 =?us-ascii?Q?XE7p6MMrBxcKN7/Uujox0MfGYBeDI1bl4rq24RnmLdAmawUDx9YuSCYtqt1L?=
 =?us-ascii?Q?LgW7t3FQkpZ+AgkNiIEyiTHpCwJnF90wXe/JcI7kPr5mNV1lJGxGb+HKZl4C?=
 =?us-ascii?Q?kCXyvo/sBxaJbXGn8E85+as30eThtvMyfvPcEWT7ZtyDEFISOYdbW4jQSEl6?=
 =?us-ascii?Q?R5v+LvYjub5hH3PCFHBT0lTUpzjkwvIUfLMY?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(14060799003)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 13:28:23.9093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d19cab-ba5b-4586-2073-08ddb57e7df3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5433

Hi Leo,

[...]

> @@ -789,6 +789,10 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>  	struct coresight_desc desc = { 0 };
>  	struct coresight_dev_list *dev_list = NULL;
>
> +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +	if (IS_ERR(drvdata->atclk))
> +		return PTR_ERR(drvdata->atclk);
> +
>  	ret = -ENOMEM;
>

Just another quetion.

If this function is called from tmc_platform_probe() and failed,
should it call the clk_put() for drvdata->pclk when it failed?

--
Sincerely,
Yeoreum Yun
