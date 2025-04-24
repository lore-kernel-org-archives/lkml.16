Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012064.outbound.protection.outlook.com [52.101.71.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A3D27CB18
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.64
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502657; cv=fail; b=g3s44/ApEZvWbd2UQKZ//+E5/X4cC5iTI709SlI7Q6FMlZIGe9RiFs960nNy3kmYKuLV+kn4++atIawrmjPyAcM/cHzuCQy8Iwq5n2njydK+KcVylGf9QTs0b/NRb3Yx84XiGSUqZESXvvaTarY8V2mfWuN/H6L8gelTTS0xPbY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502657; c=relaxed/simple;
	bh=1P4YQONkG/enByc6hfMYI/GlUgW5oL69h5WAjJ6hi9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gmyet6lfeITf+7V8iTzVcP8aM9GXjOHw4eM/m117XWXyagYYMfsTtMudsE4kq9N0M5Rf/IqccCb3v9bPFF2XziWsJJsIUDuwU9E0yqJ+StKTpD4ywEFlrx6ybKBKAo6jYgF1YbecouvVkL/NUtlQs0NKANf0hcEjTbBJBIOQUtc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MRnvh2M2; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MRnvh2M2; arc=fail smtp.client-ip=52.101.71.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MRnvh2M2";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MRnvh2M2"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nWxPT6saXhZ3svM7NDyh8p+DHKwdHag1gJpXMqZAjqRDVlwBg6ugy/PXIa0VpfIQfj/VdN4TZRb7L9hFH9pKbBETr2SY2Py4yWLwvNumRNo+mi6LuzDRK4G6p8aXSkYVvx6cRx1CVU0z+rB2EaEd+K8n745zZmMEDG4/2Kni+84Hd+M+NpIhJfgAge3J8/nZ2H0n3OlsdLJlA9LB2//qSsoel/nGeQ3ih8iaaI8YtjgpF3WEe+MvTx/qAMGThJJdQunS7d0Zf1lAGb1vNTDHeW3tm3BWTeu/LyPaoxEUXVDoQoUMhVtd8GZlFmHqyOVOJy3jPqVVeUcOJjzbuJZGrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PheHzuZCwvDcv646FAFctshUZ/ixTuD1dwF6FcCOLEs=;
 b=bswIADzzWIrKI9H/ng6E+U5ZIrFhEDhIBPmntlBfWb5KGR4obJSIfTruilj+eTvsGv8GHCAbUGPeh0wW4tAdUSZbptqJTFmk18uTVKS8l2wv+KxJ8QWEuYFaOEnXFYIzrBIHrdXrW6EaHXo683b7VLcxkBFbeFdFuzKT+nBGxySO8BqvJK/IhjSyKluZ1pzZ9TheVvUbosoCA4DwP0g5+Y71yZ6hFC2CmKV9WZuSpN5jtC8FQV/nasJEq8M6fkOt+9LuJftzkN0PkNH2JKb2X98l1JrYhd/D0msXF28i65L6aNds+lXAZGocc0bvyfWcGrEHrQb2vMtQFxMW4Z6s/Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PheHzuZCwvDcv646FAFctshUZ/ixTuD1dwF6FcCOLEs=;
 b=MRnvh2M222mp05KSgJ0lwbDFIEbWyqshxFDdSgKDa9awihZ0jyiZdESetAdfI7QwfpjW7j6XaQYD6M69UIdbUnaWAS/ovbFeWmeLXXwZfY2aVrghIkk3zFRU2EyVIRIQrr/WkPUjpoIvAMj9j5o+O9yK9qwTPNyj3Wz+DiRfHaA=
Received: from DB8PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:10:110::28)
 by DB3PR08MB8986.eurprd08.prod.outlook.com (2603:10a6:10:42b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 13:50:48 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::84) by DB8PR04CA0018.outlook.office365.com
 (2603:10a6:10:110::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Thu,
 24 Apr 2025 13:50:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 24 Apr 2025 13:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBefIHV+8Uz+wRTUnU6js/USYyGWFYqqdKz34+8R0bMvcR1749tGsizou/QGQlD8v9Y0osW+mcqkVoJhU62Em63HvlehI33TeHLIQoPI0ySLa80PE/hMjDReFpuzDEu+WZwVuuBF6ZJ0NTWsaqTgcvun67k1er+FVcCFZwH1eDmao+6lw8971lzKgp81pPuoiONC0dVesjimJ9LPPXJ8vGgNIaMJBz6KyaWF7v3s44oFo/i5SStufl0cl+0brGZuCp2yi20QGUY/qsO34hdICQhlpbFCgJ6J4/tO4y9jAGlBhK4tWMYg7F6C9ixZdJDZ1TM9J82Z2Njb/Kd4leM2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PheHzuZCwvDcv646FAFctshUZ/ixTuD1dwF6FcCOLEs=;
 b=obp6tIjdE/l/6RUxHHKWN7W0dRvc0J8zuxJLwKY9TTPzNfmCanQiHZwe/33YvPFn1uDyDGR42jArAsVENzXCUc7BWgAWkPEFJwk1cPMB+o7+zMADlZEoVt1gAE0ZfytFlAfsovL/1fncyrUepRLANiZjahUUci9yn5US1qZZrYzfYsZRb7JilhopGO+kEoJvX/IVqFHSuXlg2MRN7uxVpu0XyhrU6r+HBnzygiGuzFfc63VzkU2uKbd+UAZ6kWtLNDDjYpf2NjetQE9VUnrIY3sVnoX3GU6VeJuPmrSPxtUEqqesn/u+cCPw6PtslDw32PqSWDmT/MsBtNEVXqAySA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PheHzuZCwvDcv646FAFctshUZ/ixTuD1dwF6FcCOLEs=;
 b=MRnvh2M222mp05KSgJ0lwbDFIEbWyqshxFDdSgKDa9awihZ0jyiZdESetAdfI7QwfpjW7j6XaQYD6M69UIdbUnaWAS/ovbFeWmeLXXwZfY2aVrghIkk3zFRU2EyVIRIQrr/WkPUjpoIvAMj9j5o+O9yK9qwTPNyj3Wz+DiRfHaA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV2PR08MB10383.eurprd08.prod.outlook.com
 (2603:10a6:150:b0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 13:50:14 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 13:50:14 +0000
Date: Thu, 24 Apr 2025 14:50:11 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	nd@arm.com
Subject: Re: [PATCH v3 0/4] support FEAT_MTE_STORE_ONLY feature
Message-ID: <aApBk8eGA2Eo57fq@e129823.arm.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410080723.953525-1-yeoreum.yun@arm.com>
X-ClientProxiedBy: LO4P123CA0116.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::13) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|GV2PR08MB10383:EE_|DB1PEPF000509FE:EE_|DB3PR08MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: 486c5828-7363-4864-c494-08dd83370437
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?sowEDC3D2e5qL4zNvqF4r0hcGCRZRvkbO18tYHklf05p8rLMFdrPCxtwOfh8?=
 =?us-ascii?Q?u2RVm+Db58YtIZFRQa8wuZZoWe8xx+UGCQjB5yyKBIsKwtNh355XFrF8RPhC?=
 =?us-ascii?Q?znNwCkVGWaBKp8/ljc1U3EXxKF4AMiAOGf278Fie4nSNhg8SN0XujGkS8Dt3?=
 =?us-ascii?Q?fBKrC0BXOoGaSTEdmoWNJ436pZbXopIWMZ/rBbA4nxYiKaDIHv33QuS0as/C?=
 =?us-ascii?Q?vXsegrxSyU/EJAUeatMg33CzNLLDY1S6S0x3VByGHBNwLyBt/r3TzKSKJBMD?=
 =?us-ascii?Q?uhOQbR7A548114YYFkj/JaggrI3wL37+RVZt3qFMBJSc3voBbT3c2zNvQwht?=
 =?us-ascii?Q?X8uBHRyCTgUC17Q1D7Ie5Qs/+7+Sf1kyHX4P0gjcvqtreRjBPzSzSHL/X2Nw?=
 =?us-ascii?Q?MVWKMO45Ts++kxGgphQweWtce+1R0+NH/sqfDJf0QgAsFhGbhdIDWDGaqgSt?=
 =?us-ascii?Q?EKUXGRNmmSmW3MMugSA0efW7VT10EmIojIr3t+36uznJWzF5APtDyKtOZQWm?=
 =?us-ascii?Q?9H/XbRlPvrbFVlZtMduRKBMkt8ujN3A1kaQhJcSVhrpmUNqvj3j0RU1Y83rj?=
 =?us-ascii?Q?hsGXBcYOJssDnpxEhJ02Dl8pr6WfsUJV2cBs1pYRDf1iHj8xigpyuD3on17a?=
 =?us-ascii?Q?plU+jjIp1OQU3w0o9aoe9lfOBVRyA6APLJj3/y8La0Q0lIR9rc+cuJ5uH9x/?=
 =?us-ascii?Q?tg4URvtg+Mwprb1cH6GER5BF0W08i1wOJHLLHy+8u9ik/XmKLBACvD2pKtPl?=
 =?us-ascii?Q?Jdzx1vqcXwYqJ+9xMLfkv4C8dwYCA6C3n5rHqvu5KLDoYCKUfeidzQp0Lmsk?=
 =?us-ascii?Q?DedKkPSbPPyZwHRNUty5SSBguycWStpvw7NNWM3opwmCpjCEBG+FWEKCDsMH?=
 =?us-ascii?Q?cUoKk0W+dcWoriUToCn02ctdOZtWlYSU1RWKMcHtIDt9L3+twE9gjBauf9w9?=
 =?us-ascii?Q?+ae6UPeEcm+D4i7JvWnBy+e+O2euovuTMnV4jX4krJx+ev7/9dZrqcKjZrw8?=
 =?us-ascii?Q?nhPbBLyexLdfYkQB/EFeo+h+pzPM9Ndob+yByWtbdVdLfJIfCHdM6cdM4wz6?=
 =?us-ascii?Q?HSqjE8QGAxlZxseRvRcjPTSO3whSrG6XnRg9F5BRCsQ8XlAx9O4NJLa9hdbn?=
 =?us-ascii?Q?QZsXfSIS3Dnocq7y67yo4pKahpZnt/OA/ZmwoRhibcHmF6WQZmB0oGXS250j?=
 =?us-ascii?Q?fA+GvVNgJnwuDjf3b2GeoGPQVR23CL3iqYwSNWRCYJlEO43D8/1UnP9NAJWQ?=
 =?us-ascii?Q?N1p4sJaqQf/TuW29wwn1slX2fzu9Q2Yr80xGxttK7mmLie44TeikZUz25O4G?=
 =?us-ascii?Q?+nq5Bb9oN+8wla3XiXUnTsV6SDJkDeAsfPxkVAOOKlRms6MmXyIaCQJJ9eA4?=
 =?us-ascii?Q?fK3Rv3Oa4cD8Z/4R62JGElTDVDGDayfFoqR09G3IB4VxOYWjevyAuCx17J1X?=
 =?us-ascii?Q?lv7y47ChW+lNRfEWe4MR+gKgbiq2Sx+Estl5ObNCXBRUiX0Bi1I60g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10383
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f6da4fe-232f-4dd8-9550-08dd8336f076
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|376014|82310400026|7416014|36860700013|35042699022|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XDpHUEfWnFCj48Z0VTIHtadaxaRxmzZSE5vKXmmtIHp4GCWJ2Rv/WDLWcIp0?=
 =?us-ascii?Q?9VaVu2DAuUGt8treZFcRFx77zzL4HeQO5+M9ORX5PoMe6Yh06BMU+rcFt20t?=
 =?us-ascii?Q?26Qb3VFlg5ie2SJo7qOr7gRsUsPu8B7khyYSj4FlMcTZuHq1cYz+YefaLitO?=
 =?us-ascii?Q?taH79nliI9eb+Bgk0jYdGKhLv7Nw3X5xBm2wMT1GtEkfOAwEQyTbY3tp510S?=
 =?us-ascii?Q?kxZ8524Hs7wJk21nweZQ7VR7MpkJC9WK6Tw5qcNZsyUM7TZSe7Jt5Ctazd2/?=
 =?us-ascii?Q?x6Vf+pCdBVUS1V/IgmZPX9tbBYLjBWZcuPiyIQNShb7qm/RJ2tLUoaj3Z7TJ?=
 =?us-ascii?Q?LvGSRDh73MqqMn+noJ2AAeSvZqWckhbtCfgE8qSx6+YAWNm7EdJRkpH7uo1N?=
 =?us-ascii?Q?qCgYwTyEH392Iy+sXylUrIAe2Dm5NtwoxtenO0ifUsqgERoDa+Wn8Iyeag28?=
 =?us-ascii?Q?kY5QbtmAfE+sxfTGesCj8C+61O4LFwPARAk4o2aCW70/EjeeSCGQIJ1lPC2S?=
 =?us-ascii?Q?RLSY5UNo9gNApf0eaCohYtAWjaI2aiKBFMWcEwfHFNYnU/ONtKxp5pZRM1Gr?=
 =?us-ascii?Q?arRBcVQY2CffHiE0BH2KhIX14nmvsHZM7icTA9YFpKW0XbysH+QBiu5hDZP0?=
 =?us-ascii?Q?36WgNbYXb77/+N7mjLwvAFRq0viIKiuZh101alrdyrurIfsiBEAYc2UY2k+1?=
 =?us-ascii?Q?YPiM6Yy6+YjjOV+r4MvC2rFJDghrRge6B4zKb+uGU3pgL5OYER4oeofHc2ff?=
 =?us-ascii?Q?nFeKtu5BqVlDKE8qg4u4VrdvSZVQFSu1PhQ7s1e6d8NVMEjyO+9Y9Fx15Jx2?=
 =?us-ascii?Q?LgEKTiVRMKPe3E3MvOyU04U0uMjp6aM50jE6YeT5c2V2Vyi/SihnkNDxIYI2?=
 =?us-ascii?Q?2vDM7Pca94mOW7SgvVifD/NkGAkUJUWjMhyzS5PgMX6sPRkUdLxeIugybi7O?=
 =?us-ascii?Q?7ql5jDTNyQBNzr7jUC5cqsU+qZ6rQdNHyx1iREwMBzCIYBvVHKh7ew7PCYoa?=
 =?us-ascii?Q?Q8FEHUE5o8HDDRQqxB5z36HymjQdffTZWRApB+EHaFOTqCxUhxfM0dT94NTn?=
 =?us-ascii?Q?dYU7ZPyGbFA0MelxHlxEchU3fiORexqO/Rb8/ZMOGUhr5YmyoCbVi7SfBqtf?=
 =?us-ascii?Q?4uhonoiT4+3oq8zChEaQefMpmaxTqRWCHXnK6iA8rqbEV63Qn/QDF0RcJue7?=
 =?us-ascii?Q?vM0+EdLfmH4eAbFSGui3AG3T2mKZH0BzvjPLOw5BvQV6mp9TnUBcnvYkaSzR?=
 =?us-ascii?Q?RL+vayoPpQTp8QhzSaV/MkNumdXwQiJcr/wX69LBSmFkl3HjH7hSturSiAU7?=
 =?us-ascii?Q?yQjMiqzJnoQMizXZpzFMDqPS27k75YC6DX5JVktTEvV5VxCQGY5se43ISDog?=
 =?us-ascii?Q?8Y4HriHZSghP3FZCerI+0b3KntKlgNA4uKCGiVmUASt8ijh/u+ZKmYyQ8GJu?=
 =?us-ascii?Q?SxIad16ctaY0blqWYZOfUJvM4iW40Vcm0GDsolIwi+fieB3CbGu5/S+BvgNg?=
 =?us-ascii?Q?TUc7c+EE2VPNpwHTTLco+n+99Zq8UaIoqN0/aHp8rbMTiOUXI3U4sPIrCw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(82310400026)(7416014)(36860700013)(35042699022)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 13:50:47.2744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 486c5828-7363-4864-c494-08dd83370437
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8986

Gentle ping in case of forgotten.

> ARMv8.5 based processors introduce the Memory Tagging Extension (MTE) feature.
> MTE is built on top of the ARMv8.0 virtual address tagging TBI
> (Top Byte Ignore) feature and allows software to access a 4-bit
> allocation tag for each 16-byte granule in the physical address space.
> A logical tag is derived from bits 59-56 of the virtual
> address used for the memory access. A CPU with MTE enabled will compare
> the logical tag against the allocation tag and potentially raise an
> tag check fault on mismatch, subject to system registers configuration.
>
> Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
> check fault on store operation only.
> For this, application can use PR_MTE_STORE_ONLY flag
> when it sets the MTE setting with prctl().
>
> This feature omits tag check for fetch/read operation.
> So it might be used not only debugging purpose but also be used
> by application requiring strong memory safty in normal env.
>
> Since v1:
>   - add doc to elf_hwcaps.rst
>   - add MTE_STORE_ONLY hwcap test
>
> Since v2:
>   - Rebase to 6.15.-rc1
>
> NOTE:
>   This patches based on https://lore.kernel.org/all/20250410074721.947380-1-yeoreum.yun@arm.com/
>
> Yeoreum Yun (4):
>   arm64/feature: add MTE_STORE_ONLY feature
>   prtcl: introduce PR_MTE_STORE_ONLY
>   arm64/kernel: support store-only mte tag check
>   tools/kselftest: add MTE_STORE_ONLY feature hwcap test
>
>  Documentation/arch/arm64/elf_hwcaps.rst   |  3 +++
>  arch/arm64/include/asm/hwcap.h            |  1 +
>  arch/arm64/include/asm/processor.h        |  2 ++
>  arch/arm64/include/uapi/asm/hwcap.h       |  1 +
>  arch/arm64/kernel/cpufeature.c            |  9 +++++++++
>  arch/arm64/kernel/cpuinfo.c               |  1 +
>  arch/arm64/kernel/mte.c                   | 11 ++++++++++-
>  arch/arm64/kernel/process.c               |  6 +++++-
>  arch/arm64/tools/cpucaps                  |  1 +
>  include/uapi/linux/prctl.h                |  2 ++
>  tools/testing/selftests/arm64/abi/hwcap.c |  6 ++++++
>  11 files changed, 41 insertions(+), 2 deletions(-)
>
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

--
Sincerely,
Yeoreum Yun
