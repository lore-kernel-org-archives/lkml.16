Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013070.outbound.protection.outlook.com [52.101.67.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C4D20DD4B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.70
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589457; cv=fail; b=uMBJHIAH/fV1vxEIH9ntZZ/iWtG0V2a5jpKUMikJXqbVGV8tJFeviTCTVgvz2QLgeFFNgDS1HgIJG/3f08NHc5SHSoLGNlwpksxYzmI5wCpJ9Y1TKs0amp4+Ye93btobrixybpv5u5eO5s9I9DkkkWPc5PpC9eqmXIo8cFygGXU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589457; c=relaxed/simple;
	bh=/VvRZgUqXqz5GL00Aa2UFkTuFOxbgGqPRSSpWqZcesE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hGXusthqFzzG8Z3V9/w7Q3NNAD+7F/ffc2bjLS/H7Glwa4BNrrAjqe3HuFoLOhBayEypGTQ/lrBXoAJGmhiuoPuYTSPuAOnHbj2ZcQCFRiIG+F3/eY45sSnnr71UGU9O5qG5YTpqf9F0U7Fp1OIIxk98oXnSlBlNVuHgG+J75Ks=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gGbx+jRd; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gGbx+jRd; arc=fail smtp.client-ip=52.101.67.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gGbx+jRd";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gGbx+jRd"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NEmryl52MOkN9ZBDk2PTukqpqzN8SfrG0l/TQZtsHZByyD1Vk/8ie5otPsB2vo936hYhm0y+1LIhXyM3Y9vnfhxIHZJ4b+RVsW3sMKuiAC0RucVdHhgxe4pVH4V0LuAresib/XwSOxWWnuRyZaRPwGtetRw+NtyDg/RkiQiaHNScjSi2l/31yXSXAnTn3dIGlOqqBo1mbwLzY736UUhoREn/PNtYIzvYecMBxax9GtAiKaBUGSmScsB00wrFT7RWYncfZk34R7w6uzYGGj9zEPQzL3um5toneRhJMrxal9RMPHfZkOeWDK8VLPlDYD3+7hDpYJt9sKBRL501vSUESw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttnXVmqFhmSc5geab/PM0crUrR28BDynNr+OT9kn0vA=;
 b=rn7lgI1+C5GXFbpv0VBwbgbDNvl5Pvmc4rv8xvSgnVomkMVLV1qxJOrxL/2h9LCm0NbQrOmDYv8OxYlhp5QHc3yaV/xb+5Xf0bO49slAdwa4z2CvrTvqxvXxXTVVs4sIVhaRIn+9ZGFS3J9sqfCFx7Q7Qcr+PTljkrOMFeziYyNNv+7ebIVp6wk17XIRABdzatQGBGTzrqgTtmyrGi6NPiHljuewF199XiYPjxX4KJrnol8Iccgc0iXX9ecD60zKY+BsedVZJOkoCXQ9bUx91/D5h0Zoj4tVfcChVH5NVZ+GQLqfJgnDJARuLeyGq3CEHsBoT06NjcE/TSpog69/rQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttnXVmqFhmSc5geab/PM0crUrR28BDynNr+OT9kn0vA=;
 b=gGbx+jRdZs9MdO8zXKusdC45ywNX1pDCQ82OM91iimJkuRJH8ICUENbQJ8EJR6VPGAaU/pLB2dlhgvHcon5FuBV/wfjwzTNT+2BdKANw8oMg5watCOsPUPUqccs/qfQhuqUwOPpsibAtrgxIP+45lqFYLGAadnM/guq6FN/Tqz4=
Received: from AS9PR05CA0172.eurprd05.prod.outlook.com (2603:10a6:20b:496::33)
 by DB9PR08MB7793.eurprd08.prod.outlook.com (2603:10a6:10:398::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 10:24:05 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:496:cafe::9c) by AS9PR05CA0172.outlook.office365.com
 (2603:10a6:20b:496::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.42 via Frontend Transport; Wed,
 2 Apr 2025 10:24:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Wed, 2 Apr 2025 10:24:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T03zjwT78ghYWDVtQxirh9fTxIlLy8d+M67Kn+87q7AWeXagZxLq1YNF0ebbZLjKsjM4j4XbzggbSPn5ntR25yaPp4s7v27lxPwdtj2LG9WIF3901XpEZkBcjbqeVZ+tpII4IL9i2eAO8KhGp7IGHTWxLi5UO9cEWPQW+r8rd9UanHP137MXTKsnPxfV9t23yUoch7OsrVCNqCGWjslyKkwdMUmDkR9Wlr8Zwmix2afgaLPRFKTkTLLtrOAa+R40iHzVmhHMYgvwGyqA0KqLt/Du0iA6LPYWcviLBJjZfc6XQmsE5Emr0L+DUshPCWh5kFhKsnjDx/+Op8EpI6vVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttnXVmqFhmSc5geab/PM0crUrR28BDynNr+OT9kn0vA=;
 b=iAbwO6xDfnTtvhLjsHqCghFnY5hCSihmrrIUHSDH/I9qOzFoYjqiKmmmqmjgSOiuM3GYOUNDgj8PMx+SJhdNwPMaz1iV/+0vcEKrrtemmkNtxEcPvPLahY8yk6coWqXDjdX0oDLU3QjzxYuLL6/iq6aWZuj4Jx1ET6bi/sdVH2sF4iPZjNaQi+wHsBANRB9lQ7W6bs+oXDgkUSOfhSs1BZze4n8tXe4T18ZbMLzSpoPsVuyg0cm3cCRoAuQIWsuNTEhq8a2aveOY7MPz6hq+5vsilmrgZbnMnfJ+5isIkmuyisOX61owdcPZeLgVSPODjbaQRUxNmPGYCnbvmhCcVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttnXVmqFhmSc5geab/PM0crUrR28BDynNr+OT9kn0vA=;
 b=gGbx+jRdZs9MdO8zXKusdC45ywNX1pDCQ82OM91iimJkuRJH8ICUENbQJ8EJR6VPGAaU/pLB2dlhgvHcon5FuBV/wfjwzTNT+2BdKANw8oMg5watCOsPUPUqccs/qfQhuqUwOPpsibAtrgxIP+45lqFYLGAadnM/guq6FN/Tqz4=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AM7PR08MB5511.eurprd08.prod.outlook.com
 (2603:10a6:20b:10d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 10:23:24 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 10:23:24 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Leo Yan <Leo.Yan@arm.com>
CC: Suzuki Poulose <Suzuki.Poulose@arm.com>, "mike.leach@linaro.org"
	<mike.leach@linaro.org>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] coresight: prevent deactivate active config while
 enabling the config
Thread-Topic: [PATCH v4] coresight: prevent deactivate active config while
 enabling the config
Thread-Index: AQHbnPFwTPg9POyxs0aDmE6nXWCAq7OD+FGAgAEQy4CACy9xeg==
Date: Wed, 2 Apr 2025 10:23:24 +0000
Message-ID:
 <GV1PR08MB10521AA4C5A9DB3CECDD4E36BFBAF2@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20250324191740.64964-1-yeoreum.yun@arm.com>
 <20250325151803.GD604566@e132581.arm.com> <Z+OuATAe31GbcKZ2@e129823.arm.com>
In-Reply-To: <Z+OuATAe31GbcKZ2@e129823.arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV1PR08MB10521:EE_|AM7PR08MB5511:EE_|AMS0EPF000001B2:EE_|DB9PR08MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 73a5a6c7-e231-4dcd-d600-08dd71d07dc1
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?HkcwrR7aByBznKzuc6IDAKADVc2E02Wfg75ypr9rQU6rYCpshv1S++Uppjel?=
 =?us-ascii?Q?aGkdfO9d9S/agz9/ppMCf/qWrXbzd0U+RxZoStKyzsQSsZTN0zn9hPcUTkTp?=
 =?us-ascii?Q?zfLCkyZylWEqkP087wmWFy90RuAR7KH4kQnuWgFDXhTLikoOBic7Bnibv4Is?=
 =?us-ascii?Q?qsARO2Re6PbbLWOpQx3+9x3dW/hCedYC9Fe1lr3PY9gCsCyBy/8YyjygulhG?=
 =?us-ascii?Q?VFmJbQPwwhWoB9IWdd5Zz/2t3N5EoSkvJwcPhxXNgOMmEujSdBK/pZTPvXa9?=
 =?us-ascii?Q?9HWBlmzQLTIVDtgTmo7BwHe+IFUXUGRQkRVvrJfhTsMTbLFfheWAMQfEvgkH?=
 =?us-ascii?Q?g9VchQuOTlLmKG8XViaYVuYj7z719wUTpv8b7KcWWQt1lFHIGyM1XSEgG1Hg?=
 =?us-ascii?Q?mBmYMWQltEN5yfD0gxZBDM43og+Fxw5eWaD8jsi0JgTR3nv6o3tw3KcNHuHX?=
 =?us-ascii?Q?SjCdkUStE47lwC1lgiQmX3j41eoRt9KloRGznIOYpnzga4AYRV65b/IWI9k5?=
 =?us-ascii?Q?Ky5onj0Fhl12E1MP/CbdmtWIXSJy/8VTgKu4wsqsjjYiTfvP05CUyFWON8Xe?=
 =?us-ascii?Q?R3Okb4cjlsupJ7PxLY3wYFRTsrAFyAGtug7M3aaxg7FwooicaA42q8PIUiDX?=
 =?us-ascii?Q?SUMfuRXnYw79FAYpB1O1nXnogP6rNsaEmiAfDAjLb4yntoDAolbbUfpAQG5V?=
 =?us-ascii?Q?8HYWlumuc5VcmiWScJyPJoJU55/MJLDCcBkOsThyO+xzXqQ5fMI7yAvhVHeV?=
 =?us-ascii?Q?3n7Sx6nEiZpf4OVYf7hXV8EaV3ND4aAAPo6BVOlS8KbUGWF37FHbGTzm1dXb?=
 =?us-ascii?Q?4LjeirY5WU95sOtRNUbwonR287kurGmPK56dxJT6xcjZRyh7sOZJ4OpOaxqj?=
 =?us-ascii?Q?zsbKlH4fLeRckMj6ZdKhaDT96CghQKFe5GGE2gvo1J0Udkg9fDophdjZRdHk?=
 =?us-ascii?Q?o43sPJTy7chsm31mVTsSvOuZwjKoFiGPTyDF7YvXvEKmTujukrfNFkYq6RZu?=
 =?us-ascii?Q?NNj9Am1Pw+dzXWO+IyVfGu2gVaPMmGQ81lOKQwoKolP41k83cnqa1dEbi5cY?=
 =?us-ascii?Q?+tKtPzenBHdGlibBp8cDlui6Snrk7HwrvLRoHp3pxLXBodst27IQ3N7ajCu1?=
 =?us-ascii?Q?qNR+2qAE6CtRJ+zDKWp370mcLfJWaxMhxovfouIBxnDJr1RPyrRdscLDudmE?=
 =?us-ascii?Q?Oc9yddHh8OKh+SQP4tWbv92GeNRHnxc24gvqUlBB7vuF9MXNs3Uq17rwCFa4?=
 =?us-ascii?Q?3KbLpGJlqtPxqQkbEqTSAEd7RCUe38Ioi4WYSZvqT6pUvQyqnQ/Nath7uJ05?=
 =?us-ascii?Q?98YlIgKaaP6/Buu3SF928ABb2f8IYcCqkqr+xVaRbxQHmsABiHOho2NYRwhF?=
 =?us-ascii?Q?gl+hkZ9gpamd8XbQ87A6eLrG0tW95NwUW/jd2qnnDYIWISi//xV/rqorgocg?=
 =?us-ascii?Q?Qjgjv+jjgM3Z/GUYjMCCgg77a9j4BDB0?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5511
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b872dbe1-538c-4d0d-0940-08dd71d06655
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|14060799003|35042699022|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rFPH8+zrKgBYRtkmlHOyXbtv8D/NNKdG4u0t0WC1s7xJ1tvXGpMwMg5uDPl8?=
 =?us-ascii?Q?aYlptVCkQmP6xsIRfdjCQv7SXXK47bDeJXYuPZvX0iOG/1gaYxkqkzMD2L4X?=
 =?us-ascii?Q?gUmFBQYq+yit+t8chCeACVnhoh9pUC4QYVQJEGaIffZjbly4iP4k1MOaLrEk?=
 =?us-ascii?Q?6Nzyf2wg/474bs7BtUceyH3mnWac15N9pHWT7FMn1Q4SJzh/0HHhixOzREMs?=
 =?us-ascii?Q?tUMLmyrK6EvyJzHRcfy2WPZFlGVZiBP9vVX67YlLHVl0XUnQ46/H5vpQg/CF?=
 =?us-ascii?Q?Ct3lWQMJExauXH9+AO1xlQWELVFT5mrJqpwNcBZcXI8HzEuCC+Y4+FdF1DJp?=
 =?us-ascii?Q?Hr59LxcfNCMUo37IVoC85k0KcUseiKLxq4cJkwbMypEOjagwWUxZqlJycFw3?=
 =?us-ascii?Q?CKJXeUPyt9au0jKaai0+55SVFMmnbVlcCNbHcIvSkuW6Yfhri0exy/AEtNVt?=
 =?us-ascii?Q?Tht6e9WBd4G8POGiyfK3/A2vyXakpQdwfNgtqW/3hbh0ig+A/R0icDGRFemF?=
 =?us-ascii?Q?Q5Upky9/pah741MMDXGFTIof6ad0KGqCIgDKn+kaWYbVpYEr6SUKBa4RbTca?=
 =?us-ascii?Q?xpf1iKXbzr2CS76K4De2EUnaKzj26NPG6w61M26ethNHvgLRj+aFEDvfNmFV?=
 =?us-ascii?Q?tolBlJjGWXejzFuqxJTHTd0W32DygRSc4wkoR1Vu9zbw+RHs3Urk/wffxHJp?=
 =?us-ascii?Q?0edot72g5PA8qaIcv8eMUOQ4Df1nSkTPz6MSaSLOsoDEF3UIfDxjHRcB/cva?=
 =?us-ascii?Q?JrAsOV2qjXD9Gw/MDyrewWaG6NXCE/5+VP+cb1LkMR7ogYQzoU1vaysVv6va?=
 =?us-ascii?Q?JikvVFQST7xjOHzJ5cbiubVlELGxZ+KG6wtkTS+G7UEFcwEkLensbU9koOe1?=
 =?us-ascii?Q?CH/ERQYHVbzqA1rwkGWmUyYckR4jqE622L1dpt0B3kFtMGQWYt0UmODasAlL?=
 =?us-ascii?Q?C07JpFM88BhE2wR0gsij3Y9620//1KS0dOuDlUwWqlTIhaWa8loGiYn+8Z9e?=
 =?us-ascii?Q?iekU4XetIW0i+wK1olmZJRas7y9pUscAN8/SN4pIXy3CmmCMeRQ9qYIElrx4?=
 =?us-ascii?Q?QQimEn+5iJiewh6FI6yUWxNPuNqj8qKANYfb2BsUV1dqCpZdUzg/5oYuxw4z?=
 =?us-ascii?Q?BTwDlALgLdmmubbalCC/ODhuT4ov5cvPgvvR4nGnrOEl0WBj0Kiem2BALXHk?=
 =?us-ascii?Q?slQKIrcDBzVPJPLr/0NXPd3q6OWB0KlTUsTp5kyrJrY2WBBCoggVykQZhp0P?=
 =?us-ascii?Q?kMHbrjH5ctFht9mnif51DvFiKndWP9Y4FrUDhDoRHipvJj3PI6e0zdL5EHam?=
 =?us-ascii?Q?fl3lIct8xFU+M4tMJUXdvrb86jwhDykTz3RnrTQI+Nhz2onyPk8DUq9rUONe?=
 =?us-ascii?Q?CBRVSyzK1M0Lz11kb6jtuSNLwFOgFnRd61C2VBZCYhQClNWT6YLRb5W7IayL?=
 =?us-ascii?Q?Ev37V66nmKiKYP+vQF58QxWDH8QpGM44Yk06sB6wGFtwJImv4abzMd107y1c?=
 =?us-ascii?Q?BeOzCDC7Bl6yZcM=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(14060799003)(35042699022)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:24:03.2376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a5a6c7-e231-4dcd-d600-08dd71d07dc1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7793

Gentle ping in case of forgotten.

________________________________________
From: Yeo Reum Yun
Sent: 26 March 2025 07:34
To: Leo Yan
Cc: Suzuki Poulose; mike.leach@linaro.org; james.clark@linaro.org; alexande=
r.shishkin@linux.intel.com; coresight@lists.linaro.org; linux-arm-kernel@li=
sts.infradead.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] coresight: prevent deactivate active config while e=
nabling the config

Hi Leo,

> > While enable active config via cscfg_csdev_enable_active_config(),
> > active config could be deactivated via configfs' sysfs interface.
> > This could make UAF issue in below scenario:
> >
> > CPU0                                          CPU1
> > (sysfs enable)                                load module
> >                                               cscfg_load_config_sets()
> >                                               activate config. // sysfs
> >                                               (sys_active_cnt =3D=3D 1)
> > ...
> > cscfg_csdev_enable_active_config()
> >   lock(csdev->cscfg_csdev_lock)
> >   // here load config activate by CPU1
> >   unlock(csdev->cscfg_csdev_lock)
> >
> >                                               deactivate config // sysf=
s
> >                                               (sys_activec_cnt =3D=3D 0=
)
> >                                               cscfg_unload_config_sets(=
)
> >                                               unload module
> >
> >   // access to config_desc which freed
> >   // while unloading module.
> >   cfs_csdev_enable_config
>
> I am not sure if this flow can happen.  CoreSight configfs feature is
> integrated into the CoreSight core layer, and the other CoreSight
> modules are dependent on it.
>
> For example, if the ETM4x module is not removed, the kernel module
> management will natually prevent the CoreSight core module from being
> removed.
>

No. Suppose some user writes custom config module for etm4x using
cscfg_load_config_sets() cscfg_unload_config_sets() in init/exit of
module function.

Although it's rare case but it can happen while  above 2 interfaces are
EXPORTED.

> > To address this, use cscfg_config_desc's active_cnt as a reference coun=
t
> > which will be holded when
> >     - activate the config.
> >     - enable the activated config.
> > and put the module reference when config_active_cnt =3D=3D 0.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> > Since v3:
> >   - Remove enable arguments in cscfg_config_desc_get() (from Mike).
> >   - https://lore.kernel.org/all/20250109171956.3535294-1-yeoreum.yun@ar=
m.com/
> > ---
> >  .../hwtracing/coresight/coresight-config.h    |  2 +-
> >  .../coresight/coresight-etm4x-core.c          |  3 ++
> >  .../hwtracing/coresight/coresight-syscfg.c    | 52 +++++++++++++------
> >  3 files changed, 41 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/h=
wtracing/coresight/coresight-config.h
> > index b9ebc9fcfb7f..90fd937d3bd8 100644
> > --- a/drivers/hwtracing/coresight/coresight-config.h
> > +++ b/drivers/hwtracing/coresight/coresight-config.h
> > @@ -228,7 +228,7 @@ struct cscfg_feature_csdev {
> >   * @feats_csdev:references to the device features to enable.
> >   */
> >  struct cscfg_config_csdev {
> > -   const struct cscfg_config_desc *config_desc;
> > +   struct cscfg_config_desc *config_desc;
> >     struct coresight_device *csdev;
> >     bool enabled;
> >     struct list_head node;
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drive=
rs/hwtracing/coresight/coresight-etm4x-core.c
> > index e5972f16abff..ef96028fa56b 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -1020,6 +1020,9 @@ static void etm4_disable_sysfs(struct coresight_d=
evice *csdev)
> >     smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1)=
;
> >
> >     raw_spin_unlock(&drvdata->spinlock);
> > +
> > +   cscfg_csdev_disable_active_config(csdev);
> > +
>
> In general, we need to split changes into several patches if each
> addresses a different issue.  From my understanding, the change above is
> to fix missing to disable config when disable Sysfs mode.
>
> If so, could we use a seperate patch for this change?
>

It's not a differnt issue. Without this line, the active count wouldn't
decrese and it raise another issue -- unloadable moudle for active_cnt :(
So I think it should be included in this patch.

> >     cpus_read_unlock();
> >
> >     /*
> > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/h=
wtracing/coresight/coresight-syscfg.c
> > index a70c1454b410..6d8c212ad434 100644
> > --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> > @@ -391,14 +391,17 @@ static void cscfg_owner_put(struct cscfg_load_own=
er_info *owner_info)
> >  static void cscfg_remove_owned_csdev_configs(struct coresight_device *=
csdev, void *load_owner)
> >  {
> >     struct cscfg_config_csdev *config_csdev, *tmp;
> > +   unsigned long flags;
> >
> >     if (list_empty(&csdev->config_csdev_list))
> >             return;
> >
> > +   raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
>
> I think we should use spinlock to guard the condition checking
> list_empty().
>
> Here the race condition is the 'config_csdev_list' list and
> configurations on the list.  For atomicity, we should use lock to
> protect any operations on the list (read, add, delete, etc).

Interesting... Would you let me know which race it is?
here to check list_empty(), it already guarded with "cscfg_mutex".
However list_del() is special case because iterating config_csdev_list
can be done without cscfg_mutex -- see
cscfg_csdev_enable_active_config().
This gurad with spinlock purpose to guard race unloading and
get the config in cscfg_csdev_enable_active_config()
(Please see my response below...).

the emptiness of config_csdev_list is guarded with cscfg_mutex.
therefore, It seems enough to guard iterating part with spinlock :)

> A side topic, as here it adds locks for protecting 'config_csdev_list',
> I am wandering why we do not do the same thing for
> 'feature_csdev_list' (See cscfg_remove_owned_csdev_features() and
> cscfg_get_feat_csdev()).

In case of feature, It's okay since it couldn't be accessed when it
gets failed to get related config.

When we see cscfg_csdev_enable_active_config(), the config could be
accessed without cscfg_mutex lock. so the config need to be guarded with
spin_lock otherwise it could be acquired while unload module
(after get active_cnt in search logic cscfg_csdev_enable_active_config()
and other running unloading process)

But feature list is depends on config, If config is safe from
load/unload, this is not an issue so we don't need it.

Thanks for your review!

> >     list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_li=
st, node) {
> >             if (config_csdev->config_desc->load_owner =3D=3D load_owner=
)
> >                     list_del(&config_csdev->node);
> >     }
> > +   raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> >  }
> >
> >  static void cscfg_remove_owned_csdev_features(struct coresight_device =
*csdev, void *load_owner)
> > @@ -867,6 +870,25 @@ void cscfg_csdev_reset_feats(struct coresight_devi=
ce *csdev)
> >  }
> >  EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);
> >
> > +static bool cscfg_config_desc_get(struct cscfg_config_desc *config_des=
c)
> > +{
> > +   if (!atomic_fetch_inc(&config_desc->active_cnt)) {
> > +           /* must ensure that config cannot be unloaded in use */
> > +           if (unlikely(cscfg_owner_get(config_desc->load_owner))) {
> > +                   atomic_dec(&config_desc->active_cnt);
> > +                   return false;
> > +           }
> > +   }
> > +
> > +   return true;
> > +}
> > +
> > +static void cscfg_config_desc_put(struct cscfg_config_desc *config_des=
c)
> > +{
> > +   if (!atomic_dec_return(&config_desc->active_cnt))
> > +           cscfg_owner_put(config_desc->load_owner);
> > +}
> > +
> >  /*
> >   * This activate configuration for either perf or sysfs. Perf can have=
 multiple
> >   * active configs, selected per event, sysfs is limited to one.
> > @@ -890,22 +912,17 @@ static int _cscfg_activate_config(unsigned long c=
fg_hash)
> >                     if (config_desc->available =3D=3D false)
> >                             return -EBUSY;
> >
> > -                   /* must ensure that config cannot be unloaded in us=
e */
> > -                   err =3D cscfg_owner_get(config_desc->load_owner);
> > -                   if (err)
> > +                   if (!cscfg_config_desc_get(config_desc)) {
> > +                           err =3D -EINVAL;
> >                             break;
> > +                   }
> > +
> >                     /*
> >                      * increment the global active count - control chan=
ges to
> >                      * active configurations
> >                      */
> >                     atomic_inc(&cscfg_mgr->sys_active_cnt);
>
> Seems to me, it is more reasonable to use 'sys_active_cnt' to acquire
> the module reference instead of 'config_desc->active_cnt'.  The reason
> is 'sys_active_cnt' is a global counter.
>
> > -                   /*
> > -                    * mark the descriptor as active so enable config o=
n a
> > -                    * device instance will use it
> > -                    */
> > -                   atomic_inc(&config_desc->active_cnt);
> > -
> >                     err =3D 0;
> >                     dev_dbg(cscfg_device(), "Activate config %s.\n", co=
nfig_desc->name);
> >                     break;
> > @@ -920,9 +937,8 @@ static void _cscfg_deactivate_config(unsigned long =
cfg_hash)
> >
> >     list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item=
) {
> >             if ((unsigned long)config_desc->event_ea->var =3D=3D cfg_ha=
sh) {
> > -                   atomic_dec(&config_desc->active_cnt);
> >                     atomic_dec(&cscfg_mgr->sys_active_cnt);
> > -                   cscfg_owner_put(config_desc->load_owner);
> > +                   cscfg_config_desc_put(config_desc);
> >                     dev_dbg(cscfg_device(), "Deactivate config %s.\n", =
config_desc->name);
> >                     break;
> >             }
> > @@ -1047,7 +1063,7 @@ int cscfg_csdev_enable_active_config(struct cores=
ight_device *csdev,
> >                                  unsigned long cfg_hash, int preset)
> >  {
> >     struct cscfg_config_csdev *config_csdev_active =3D NULL, *config_cs=
dev_item;
> > -   const struct cscfg_config_desc *config_desc;
> > +   struct cscfg_config_desc *config_desc;
> >     unsigned long flags;
> >     int err =3D 0;
> >
> > @@ -1062,8 +1078,8 @@ int cscfg_csdev_enable_active_config(struct cores=
ight_device *csdev,
> >     raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> >     list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, n=
ode) {
> >             config_desc =3D config_csdev_item->config_desc;
> > -           if ((atomic_read(&config_desc->active_cnt)) &&
> > -               ((unsigned long)config_desc->event_ea->var =3D=3D cfg_h=
ash)) {
> > +           if (((unsigned long)config_desc->event_ea->var =3D=3D cfg_h=
ash) &&
> > +                           cscfg_config_desc_get(config_desc)) {
>
> This seems to me not right.  Why a config descriptor is get in multiple
> places?  One time getting a config descriptor is in
> _cscfg_activate_config(), another is at here.
>
> To be honest, I am not clear what is the difference between 'activate'
> config and 'enable active' config.  Literally, I think we only need to
> acquire the config at its creating phase (maybe match to activate
> config?).
>
> >                     config_csdev_active =3D config_csdev_item;
> >                     csdev->active_cscfg_ctxt =3D (void *)config_csdev_a=
ctive;
> >                     break;
> > @@ -1097,7 +1113,11 @@ int cscfg_csdev_enable_active_config(struct core=
sight_device *csdev,
> >                             err =3D -EBUSY;
> >                     raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock=
, flags);
> >             }
> > +
> > +           if (err)
> > +                   cscfg_config_desc_put(config_desc);
> >     }
> > +
> >     return err;
> >  }
> >  EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
> > @@ -1136,8 +1156,10 @@ void cscfg_csdev_disable_active_config(struct co=
resight_device *csdev)
> >     raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> >
> >     /* true if there was an enabled active config */
> > -   if (config_csdev)
> > +   if (config_csdev) {
> >             cscfg_csdev_disable_config(config_csdev);
> > +           cscfg_config_desc_put(config_csdev->config_desc);
> > +   }
> >  }
> >  EXPORT_SYMBOL_GPL(cscfg_csdev_disable_active_config);
> >
> > --
> > LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> >
