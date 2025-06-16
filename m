Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3929C14A8E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051401; cv=fail; b=ek3dug462cdIFNG2e5wrQUswUzt126nxcpdFqeYMS9M0Hmlg2mhyyZj1lBXeW+8zLG6NX1UYxUWUziqkDC5TWe0ySPjqiwphv57kLC2UTOMoKooq/5m3c5E6S6R0eGaZcmSmB5n+DMfO9K9igi4n2QvsD5AFhto0vtQhzmt5kXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051401; c=relaxed/simple;
	bh=VckwEa6aLF06wfxYMncZPmiAQrtuk/GPH2gFGSDXge0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oTBor5KopFVhHCZFRbsZ6yxU3jd8dU7SkjRQRaQ5aavkpOQMKgRYaZTncHFY9kAGPxiCmWGZ0yDHBhNKJPmzdWrvjdZRklWROHUJEvynMdgacEFFi1iZHSgBwKesJsALKi4N55BSqK6JNaGa6Sw4eAr+7Xuxxr5Z0YOFLTJKfR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eVQs5rvD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pGJ01viJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eVQs5rvD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pGJ01viJ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FMsIHi002773;
	Mon, 16 Jun 2025 05:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pXPN2VaZbQhMEPG26gIGxv6/1QPE/LMFoEIJk6AIj+s=; b=
	eVQs5rvD7th2nfM9OPRkZsLMrYPatimDcvn1s2Au1AOtV+HWxGHuS5Vf0nFp11m3
	11FiuzDGVTHo0emH/WHlKBjgAVUZtj8b/65VTqIyWqXWSu6twvVj2TUCYwYzqGVJ
	iDlYJr4IzD3286DPPv3BAq+T0G811Clc88/bc9f6S+pTa08arwl3LOtOZ06ci6bw
	n/HlM2o51SilqH7uQQW/Fl8rSac97rd4vivTWdQgaWFLVGInSMft9QvMxKuJllXf
	59eGqu/rabTqn6dTlwzLHagQ7iBTNK1qbteL+rTfEbmqEjNwwIUREPcf1a9UWbEU
	/US8gd1mPJo5qDTdWC2qNQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4hqrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55G3PkvI036362;
	Mon, 16 Jun 2025 05:22:30 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhdxw7p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFmF/6KiF8oIb7FnhrV7+toYkEI3+C6O/To/3JuWT4+Q4Q2JDFlxLz9H/3p+PKaSzNJNyVWD3C4QyhML51RyCnG3ZVxYSDun7XQ60r83ZuiZ4DamCovZQr/xfDckn2m/i0++zco0Fv332oKErNFwuf8pqsektr9sMHbvaFzk4iPSQxEoBfojKWFbiMeWQmLSR8/mGEgGYRJJgUlXRtwKyIKyVZ2Qak0dvEnedJ+OCOxamcc4QI1iJTqsZT/tyg7Si1BwBRswVS9giPiR+bLdSOO5ATDOR+F2SEkvseLTxE2tcV2+xT6Ah65hZ/VomUKEF1s7OMgw/8hfdykcYV0eaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXPN2VaZbQhMEPG26gIGxv6/1QPE/LMFoEIJk6AIj+s=;
 b=j1UV4djLeoGs44bLqy8jPzsZJ20p5hyBDPjCIpc+hH3YaXWXRZN4wgFY2Seucs4imyCswg5dy7cuxhfJReoBtC6opra71g2uenZ9ceUQAkppkABhvVGKUTxtCSwC1b8oxYoI7wyGF5AgmJebdpSdPZTuoBQf10+SEyGmOYhO4F20pbt3Y4b2GQNubOuoqH/bL1AjCHy1AlYqUJVacjskVflUQEuygiUzu8nb2B/vcZMbaBpQg1w+i94UpauCSgsLj4KHHEbvGY2rOd5kIWz2eOtSxrNjiKobcmSjB9TBOV1KdAYo9DGSnpM+ybHQqI21qJ7NBqGcjjd+BBxF/r6gRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXPN2VaZbQhMEPG26gIGxv6/1QPE/LMFoEIJk6AIj+s=;
 b=pGJ01viJjGt5er46YzgJ8sgA39wtfWaJ/nDzjxawieX86qe7DxomtA8gzysAZ/bYWFBE5/upIiyzTlWu4MKJrAPtRMherQDk/hCJdUAiCoeL2YaqkL9y/O7a7DJuRxjRug4YxxqDoZBfUQflzY4q3f3Ihx28NCHhH7rWELd15WM=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SA1PR10MB6389.namprd10.prod.outlook.com (2603:10b6:806:255::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 05:22:27 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 16 Jun 2025
 05:22:27 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: [PATCH v4 01/13] perf bench mem: Remove repetition around time measurement
Date: Sun, 15 Jun 2025 22:22:11 -0700
Message-Id: <20250616052223.723982-2-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250616052223.723982-1-ankur.a.arora@oracle.com>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::15) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SA1PR10MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b65936-9ae1-465e-3efc-08ddac95c85b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LKnBHWLLaYyxu6mdXP+Gb9/7y7wr+gJLpG30XIxz75oTNasDWKuR2DqJWnFD?=
 =?us-ascii?Q?sN2e23cW8YcenNF9LAMW/fVNamnY56N/FrlyH6ssdXYeDvwkZvhY2elnJef+?=
 =?us-ascii?Q?ZKI6clxNDVItCvtJMRx06T7SBLORwRf8QswJEy0AESb2HCqTUGEQXywCwH0w?=
 =?us-ascii?Q?8EwcO+S6xJs6F6f9TRDkkLenQ84A+N2RzU6+ogChFNjhxKvsMNovAhOiyElz?=
 =?us-ascii?Q?VQe3EYW6mfn8gZ7/OGqYmxfvUEau/Bclj+7yK66sRuF+A1BW4Ue68nsutQjh?=
 =?us-ascii?Q?GjwilbxHHmoP+iOErbTkipSwoKR68MdpJO2xoJcjlgIP3a238RPtQduy/Ibc?=
 =?us-ascii?Q?5Z49+HLEwPX/NuatyFu7g/6DVGP4CCKmV/Jajy4FVe7FKuy4WMZSgYW/FMci?=
 =?us-ascii?Q?bHc//HqSxIHHXc7sKgDTpIszGPG7hGfWh61eypgnNLnnmsi3yaKUw2Qm8jNy?=
 =?us-ascii?Q?beT8i5ghRhNcTQVv19IZDz7U/uKCNTr+tj9wIjlpIf3FWu1sF7bWW/oyCOs5?=
 =?us-ascii?Q?SW3T3XFv/qL9gYlkLgC0KFwMFOG0F4792lOdyvnM8NjxoFtgEq2yM/bZ74sA?=
 =?us-ascii?Q?aiP1ahLdPBUDYjmnCQrZJ58azgjVmXnahtdxeLc/1X+auuv55JQtI6y5ltyI?=
 =?us-ascii?Q?aM1Wagq5BW2OZAI1QbWGOQ5MeBjG7mNuGdO+SV+DzBWgFHxcWBWL3zsNZoNe?=
 =?us-ascii?Q?WIsomdXbt5lRmOIG4+pRTzDPiNt0cCzCEIiynZ66uya894wO+k4QRtYq4Dc5?=
 =?us-ascii?Q?tRDhu6Z9+Vy4W/EF4KWQhELzMvttH+5guUev7qZd8za29SVW/qgoaVaVZKLY?=
 =?us-ascii?Q?xhWebE8m6dRoGolshJVWyip3EZ2tukvIj8B+RgP8JiYqVjbracEcNTbxEx1k?=
 =?us-ascii?Q?YBDtAJDl0HDi60l0cpTYnhKYLJNen5TFc2nQgmxtKkxzmmlCR2Ky8r1VSTMx?=
 =?us-ascii?Q?TmRiThLUF9CrMGizeeTv9tJFluO8zurM/HAqOY/w17onF1GRioCfPJ+3eNQz?=
 =?us-ascii?Q?GJzVIJ8ZzS24wAZ2G4l7D1vA64rMbePAwBGB189JWSJKRXg9QrejkeON7+72?=
 =?us-ascii?Q?BAUrl47JBMO4/ZxM8Ls9XJgH57Dlo7V751B04wUGWqSzkAjziR4SH4OUAQsn?=
 =?us-ascii?Q?w16C+2krCpve80kspmJHa4kJHTwvsRdipLKpOzTRTSPrtZH3tmed0jt+2jbD?=
 =?us-ascii?Q?bYLWD+WQ3dcMc/94Sr129x8nmQTmtBrdnAEZrmGqCx1TVl8iqPWuGRSDRh+F?=
 =?us-ascii?Q?RFWMZYDak3/IDhTq3LLYL7eQLAyJlPyTC5iUxsJEx5wkc91urYtGXccoTevO?=
 =?us-ascii?Q?VY6wbU9sZ3AomBfxcNXjhWGh+dVEScuul/3uuodkK5Lx+zHBdkcYIlWwjnUS?=
 =?us-ascii?Q?oq6JC2Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pkeEGW7PEc8PllVXPy6NRQgg15yG5mw3pr4wIi5UMmGasvjIh6YqVk8uIllh?=
 =?us-ascii?Q?ezW0fWfmp6k2pZ4svdwCATYXqkiCHJegQp+n9qNpFEDJE8kgMenrHSD70GSu?=
 =?us-ascii?Q?n3dEiI96M0A0UPWB6EBKCTkQkTQT95H7bJ9bwJDDU1zXC8zRP1hvIJkHEaUa?=
 =?us-ascii?Q?h5YvayKYqTHCndLSg5pJnogZfrdtpGZD8jWZjhnPNyzIvU3ZlZJOpHsBGFI8?=
 =?us-ascii?Q?8Q2O678QE1LjojOYxvHxCqxdOiUg5z6KVhJROSm/stukB52ZeI4trYwDl7/Q?=
 =?us-ascii?Q?e6cai72L8eRO7hBlD1dKGsieYE1olZi9amZJXLtSA0gcNKyq53oCYyH1YJB3?=
 =?us-ascii?Q?e56q1WJ1bZznyhMrMNlv+pzBtW0+4jv6NJHKbMSX6tTavWOZHCIAF4kfIjpp?=
 =?us-ascii?Q?oUqpFSXNUxiIEHfahqm0UQlHNOMgua0pgmroOJXJF7UKqs6uUYQ1vnRRxFgu?=
 =?us-ascii?Q?SOjeKxdNSnPGVX8Z935lO2jQmX6/2QlEslwlj1hW/7Voe01kmD/IflCSU5Er?=
 =?us-ascii?Q?el70Esy6LbwIkILeYJwTonD5rAiNtP/UYf5drUjRY0Ej7xJAtT7IpvGkqXvq?=
 =?us-ascii?Q?kAr5JM8yzcLTx3BK/KeoW5XwNeqsHLpLbthTd5IbzdiPk6jYIW7/8bP0fLMA?=
 =?us-ascii?Q?DAe5aTRXEpX7SNV7sYobYQFjz5/jGN4Bna3hN5ur2WDDkhL1v72v4wWkYlWz?=
 =?us-ascii?Q?13urOBsxAuRxeg+StBw8GWE8hFhldCzdvbL3RRT99apzoDIYxssx1AIZnmFt?=
 =?us-ascii?Q?QgeTUqH+oApZgQOPCXoZLGOATIuRNi0g+3ENbWgG/Kilr5b/zTOBL2fI8X41?=
 =?us-ascii?Q?rMZoI9VR7pcu1iMskuZlJnabKAMPkwsYbQW4VLA8HMuexqOLQHuLz/48I71V?=
 =?us-ascii?Q?Pw5eZOJu00my30bW/AvyN06TfOnMW7NlgyF+QUVUh68r+YZXFic5slU9lWZO?=
 =?us-ascii?Q?S8/DOJ7Ij4R4hPH5faK9lFlVndaNvsdA3Is45vzZTDXGDXubWmcoQfxUmYJj?=
 =?us-ascii?Q?6gYbLk2HvgxfPhXmrdaoN6z1RbGfhNxEEH+mJDCX6cr+spf0QHpG3SDAGHJM?=
 =?us-ascii?Q?EJ63ClC5CwAO/mUis3uAC+8b+0kHqifDppzwXktu7Dyg52+FMdjgVFYwYBnp?=
 =?us-ascii?Q?HPC/EvBJFkAJDhyERuIfqKThSMaSyeTy1eXcvyFx/dAaQNd4AargTIvCgllp?=
 =?us-ascii?Q?qMTPVi1RLg8cZhoZYGcWwd4kjck5onrPK8rLO6SeATjMnNfVghQaCwxuZP0W?=
 =?us-ascii?Q?Nlx8qcPAark2/PvFwsg1wXKX7Wz1TA8vbCow+/x1MejtnJXn5WBw0f95dFnz?=
 =?us-ascii?Q?x0fmP0VKu3RUcDeKvuhLpKKuoDJYS6Z41V/qqtRndUnkw2dTxmTH9WG56hhV?=
 =?us-ascii?Q?h2nCFkqRufC/FcYnosaY2f8Eg/O4xzFQrpOqWAQTSITpY9+cUJJfa4LKjYeF?=
 =?us-ascii?Q?PxbjLEBeCab6c4Km8PN0aC6InlhYB1x/IhRlz6oAVieQ1Js/+53Ymk/d4DTs?=
 =?us-ascii?Q?6zisRhnU4W8xFoiqY4838ZLkb7O9LoG6coyb2Saccf50rlNfTkc28BrdMx94?=
 =?us-ascii?Q?lROzh4UGVmKtAWTzZNfwpB5f4tD8K2Us3Xe4G6U2/xP5rdCrQGofU5WoZyhm?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nm2SklzwdQPW0Ln7Q4V0rQke/ot642uurjRZnPUZNUsROxFH7Onp3Hy7iHpqQVFN9oBObC4Iq9LgJjLZahdyU1HQOVIXp+Skf7ECkx8IzJ+4ohpMTrnfx/pD496xhzSCAW7zxDnDilRm6RZzA557OqPKL8SbdSteqaUMP4Sbru1j2Bj8xgz5zUawU2OteAejvOQwI3QZOOKiKYv5oA168Ocxog8TgfWlaJsnJE1UlyzHOZduwHBlLWc5seoBbW521J/Irb/2RzdhzkRQ0Fn/VHYJ/56j8LagAJVb19Nu/DqoxbnDYaPMr4mMiC4EptF/2A9VSkRE4O3aF3TkR/wse8epRF6twd1M73JJE7k3ctiHkVHuJW/n/4CjPGcTbhVf3UghPOYTVD3x926+krV6xiyuL98DiuIuDbWwRDjWHH22LguRgKrTKUQ1Bnjo1t0K5xktPDXNXY+YaQ14T+MP0Pgf5KcVoxbcJW/TiZQRtszD/5CAWnsel2/GldWUMwJeyhqEmQqqWO3SLhCDRNepQIwyUYx+O9UI+Zy4aC4jELeCh2K09C3LOMKUdAcRiTc8l3oW3YeDA2s+0Ot/OIUALOjoIDJZgOskuMhqoGp/2eg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b65936-9ae1-465e-3efc-08ddac95c85b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:22:26.8978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVbobJTT6LU7Qvh6BTIO7Yayc+W3GL6zy6EcPSiTYUL2ABC/VUloAuWLeudPxqcIE8wdY/+Q3DtCJx1QvgSEq0TbNxLdzilNw1Kn/hMi06M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6389
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMyBTYWx0ZWRfX47B9nPdfK2Wm LRSxJdQbM9XYvsJQ1NACqdIklNgv99STOkUoH8AkCVuF8GCMG3XQl5LFj8XLUHqctSoroavNttf FW/F1YW9+0mFXjJ3/w46B4+1Ii6iMFAW9nFpKcFrznjSAm1bdBZOLvnMbkhLavCMZMMgtO+kk8P
 XV1bPCM3v4AsgrHsnqORripVTmqOvmLoRTf2VPEYZYwnctd3Cisy0wi4vErqPXgQFKV4As7updF k7W3o2uSZKhBA8R8gdHrMxULaxBoePgulUc/wu2SxICmLi1NnbGn6pqywDD1Wk8QC1ep+rq8Q7g ZqM+rMX5AfaWIsT4rNb36BHsFMPAmfVmOzbuw8qOKTN4bW7TsxVBYYnZcWzvYyEas+tOCawmscp
 qdHc+uT4cs4QHsnmrhaxklSRKM6xjxLr3u2jckrJ430K+FlddgSAwZ3SHShglARQLOs8idlq
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=684faa18 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=QzB8L1Xlpqjwh72o9DYA:9 cc=ntf awl=host:14714
X-Proofpoint-GUID: BAsH7u4doTuWmSQm1uVyaJfU-I3HXCNC
X-Proofpoint-ORIG-GUID: BAsH7u4doTuWmSQm1uVyaJfU-I3HXCNC

We have two copies of each mem benchmark: one using cycles to
measure time, the second for gettimeofday().

Unify.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 tools/perf/bench/mem-functions.c | 110 +++++++++++++------------------
 1 file changed, 46 insertions(+), 64 deletions(-)

diff --git a/tools/perf/bench/mem-functions.c b/tools/perf/bench/mem-functions.c
index 19d45c377ac1..8599ed96ee1f 100644
--- a/tools/perf/bench/mem-functions.c
+++ b/tools/perf/bench/mem-functions.c
@@ -51,6 +51,11 @@ static const struct option options[] = {
 	OPT_END()
 };
 
+union bench_clock {
+	u64		cycles;
+	struct timeval	tv;
+};
+
 typedef void *(*memcpy_t)(void *, const void *, size_t);
 typedef void *(*memset_t)(void *, int, size_t);
 
@@ -91,6 +96,26 @@ static u64 get_cycles(void)
 	return clk;
 }
 
+static void clock_get(union bench_clock *t)
+{
+	if (use_cycles)
+		t->cycles = get_cycles();
+	else
+		BUG_ON(gettimeofday(&t->tv, NULL));
+}
+
+static union bench_clock clock_diff(union bench_clock *s, union bench_clock *e)
+{
+	union bench_clock t;
+
+	if (use_cycles)
+		t.cycles = e->cycles - s->cycles;
+	else
+		timersub(&e->tv, &s->tv, &t.tv);
+
+	return t;
+}
+
 static double timeval2double(struct timeval *ts)
 {
 	return (double)ts->tv_sec + (double)ts->tv_usec / (double)USEC_PER_SEC;
@@ -109,8 +134,7 @@ static double timeval2double(struct timeval *ts)
 
 struct bench_mem_info {
 	const struct function *functions;
-	u64 (*do_cycles)(const struct function *r, size_t size, void *src, void *dst);
-	double (*do_gettimeofday)(const struct function *r, size_t size, void *src, void *dst);
+	union bench_clock (*do_op)(const struct function *r, size_t size, void *src, void *dst);
 	const char *const *usage;
 	bool alloc_src;
 };
@@ -119,7 +143,7 @@ static void __bench_mem_function(struct bench_mem_info *info, int r_idx, size_t
 {
 	const struct function *r = &info->functions[r_idx];
 	double result_bps = 0.0;
-	u64 result_cycles = 0;
+	union bench_clock rt = { 0 };
 	void *src = NULL, *dst = zalloc(size);
 
 	printf("# function '%s' (%s)\n", r->name, r->desc);
@@ -136,25 +160,23 @@ static void __bench_mem_function(struct bench_mem_info *info, int r_idx, size_t
 	if (bench_format == BENCH_FORMAT_DEFAULT)
 		printf("# Copying %s bytes ...\n\n", size_str);
 
-	if (use_cycles) {
-		result_cycles = info->do_cycles(r, size, src, dst);
-	} else {
-		result_bps = info->do_gettimeofday(r, size, src, dst);
-	}
+	rt = info->do_op(r, size, src, dst);
 
 	switch (bench_format) {
 	case BENCH_FORMAT_DEFAULT:
 		if (use_cycles) {
-			printf(" %14lf cycles/byte\n", (double)result_cycles/size_total);
+			printf(" %14lf cycles/byte\n", (double)rt.cycles/size_total);
 		} else {
+			result_bps = size_total/timeval2double(&rt.tv);
 			print_bps(result_bps);
 		}
 		break;
 
 	case BENCH_FORMAT_SIMPLE:
 		if (use_cycles) {
-			printf("%lf\n", (double)result_cycles/size_total);
+			printf("%lf\n", (double)rt.cycles/size_total);
 		} else {
+			result_bps = size_total/timeval2double(&rt.tv);
 			printf("%lf\n", result_bps);
 		}
 		break;
@@ -235,38 +257,21 @@ static void memcpy_prefault(memcpy_t fn, size_t size, void *src, void *dst)
 	fn(dst, src, size);
 }
 
-static u64 do_memcpy_cycles(const struct function *r, size_t size, void *src, void *dst)
+static union bench_clock do_memcpy(const struct function *r, size_t size,
+				   void *src, void *dst)
 {
-	u64 cycle_start = 0ULL, cycle_end = 0ULL;
+	union bench_clock start, end;
 	memcpy_t fn = r->fn.memcpy;
 	int i;
 
 	memcpy_prefault(fn, size, src, dst);
 
-	cycle_start = get_cycles();
+	clock_get(&start);
 	for (i = 0; i < nr_loops; ++i)
 		fn(dst, src, size);
-	cycle_end = get_cycles();
+	clock_get(&end);
 
-	return cycle_end - cycle_start;
-}
-
-static double do_memcpy_gettimeofday(const struct function *r, size_t size, void *src, void *dst)
-{
-	struct timeval tv_start, tv_end, tv_diff;
-	memcpy_t fn = r->fn.memcpy;
-	int i;
-
-	memcpy_prefault(fn, size, src, dst);
-
-	BUG_ON(gettimeofday(&tv_start, NULL));
-	for (i = 0; i < nr_loops; ++i)
-		fn(dst, src, size);
-	BUG_ON(gettimeofday(&tv_end, NULL));
-
-	timersub(&tv_end, &tv_start, &tv_diff);
-
-	return (double)(((double)size * nr_loops) / timeval2double(&tv_diff));
+	return clock_diff(&start, &end);
 }
 
 struct function memcpy_functions[] = {
@@ -292,8 +297,7 @@ int bench_mem_memcpy(int argc, const char **argv)
 {
 	struct bench_mem_info info = {
 		.functions		= memcpy_functions,
-		.do_cycles		= do_memcpy_cycles,
-		.do_gettimeofday	= do_memcpy_gettimeofday,
+		.do_op			= do_memcpy,
 		.usage			= bench_mem_memcpy_usage,
 		.alloc_src              = true,
 	};
@@ -301,9 +305,10 @@ int bench_mem_memcpy(int argc, const char **argv)
 	return bench_mem_common(argc, argv, &info);
 }
 
-static u64 do_memset_cycles(const struct function *r, size_t size, void *src __maybe_unused, void *dst)
+static union bench_clock do_memset(const struct function *r, size_t size,
+				   void *src __maybe_unused, void *dst)
 {
-	u64 cycle_start = 0ULL, cycle_end = 0ULL;
+	union bench_clock start, end;
 	memset_t fn = r->fn.memset;
 	int i;
 
@@ -313,34 +318,12 @@ static u64 do_memset_cycles(const struct function *r, size_t size, void *src __m
 	 */
 	fn(dst, -1, size);
 
-	cycle_start = get_cycles();
+	clock_get(&start);
 	for (i = 0; i < nr_loops; ++i)
 		fn(dst, i, size);
-	cycle_end = get_cycles();
+	clock_get(&end);
 
-	return cycle_end - cycle_start;
-}
-
-static double do_memset_gettimeofday(const struct function *r, size_t size, void *src __maybe_unused, void *dst)
-{
-	struct timeval tv_start, tv_end, tv_diff;
-	memset_t fn = r->fn.memset;
-	int i;
-
-	/*
-	 * We prefault the freshly allocated memory range here,
-	 * to not measure page fault overhead:
-	 */
-	fn(dst, -1, size);
-
-	BUG_ON(gettimeofday(&tv_start, NULL));
-	for (i = 0; i < nr_loops; ++i)
-		fn(dst, i, size);
-	BUG_ON(gettimeofday(&tv_end, NULL));
-
-	timersub(&tv_end, &tv_start, &tv_diff);
-
-	return (double)(((double)size * nr_loops) / timeval2double(&tv_diff));
+	return clock_diff(&start, &end);
 }
 
 static const char * const bench_mem_memset_usage[] = {
@@ -366,8 +349,7 @@ int bench_mem_memset(int argc, const char **argv)
 {
 	struct bench_mem_info info = {
 		.functions		= memset_functions,
-		.do_cycles		= do_memset_cycles,
-		.do_gettimeofday	= do_memset_gettimeofday,
+		.do_op			= do_memset,
 		.usage			= bench_mem_memset_usage,
 	};
 
-- 
2.31.1

