Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522EA139579
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750182372; cv=fail; b=kfMKn3HJVDaLRf1m2dv/1GnP3PcdkJ1HN5odT8kdEVcwvTuO3bkG7VyWXEvssXe4gj1JcJWl6WJSI/pjzbF8j3WK1rB0NjFV0CoKf/S+dXSPHiEjzOe2Gb4cni8PTDE8Y+DB+gvJIj9CEYMmGUkl8ITM210tc31c1CFgVB0zIds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750182372; c=relaxed/simple;
	bh=HGSpF3Aaks1+wjZLvbS47JFavHpOCKabBj68OL3lbKk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EP5R6+z+JXwq5rf5Isxgz4TvBuP/qaBv9Mj1NPVDrYx9j/b3HLtKNhYTiCTOeI5bO7TxH+PZmjN51h0oZ8zFfNBO/o6hfDAJ/1RvGyhpm3Jfaxo+/WvRS3KsYev7jC3qIw2xyv2SLWdIpeCPT07VjoXEVmrpc+0rP1LGKUGQ3WY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g5cCmOWX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Wl5N/8O0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g5cCmOWX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Wl5N/8O0"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HHflED010522;
	Tue, 17 Jun 2025 17:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=kmxSsgML9W/6b3ow
	vT68jbxZ4jWFhKz3HqI5QdB+UKI=; b=g5cCmOWXdnikRrzX+zcbkgvTCCanE5l9
	6p2OasU8tdZbXbCW4oqQkakFEjspWYjUKiRKg9Yj9WWLVOkDgjA2PIT2aXqqvZK2
	X6R0tDO6oK0GwgDLmbAyBtxr/8BZhUVlhFcyNiSTu845+lxg2ar8+JSb+WPVeihV
	Rhf5qL9U3FfcvZCn90rytd6ap/dcB79R567rJLoM4oGeStBCGCFgAnA3ZtEMUquN
	XN917zxYfE/5UZf5wNygsxWVMZlmQjvUpdBiIFGFSpPmXP5lcJp5fB2e44Dqaj5w
	azv9oJ+ZKvUMfVROJHh4B8E8FpGZX8fIMDRSreL9JouY3mbvHLXE1Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd5whw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 17:45:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HHi2x7031735;
	Tue, 17 Jun 2025 17:45:59 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh9ah3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 17:45:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f11IId1thlbeqE3n1KNO4W11SBH0dHVypbR6aQi1phwXVq7e4c2U4S+SPKeTpEEVtE2b3vVZvv/eQL9PVofceneLqVTjHcQGtUvl/mvNPfyLpmZnMtx+/wrcOfYU0y2Ru30BeIeQCUlSxXlHpou+1eO3MI+kqt+ZAvFsBnyCAq+04qSoHgYFwldCFOTVjvkeqaG/4SYILTvX4ckXyAZt2Ifamj5NViFuGZ5VpWoPAyEaclc37rjfGM8N1GcuR31I6oXT8XHaNxILaRFKnG11Ntx0cByEFyBQyzzu/K1iLLgTf+kPbBX5Pgo/MB9dU0+smDFW0nChN5IGclVgV+qUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmxSsgML9W/6b3owvT68jbxZ4jWFhKz3HqI5QdB+UKI=;
 b=uTso+5QG564PVNcV534L9vA+df4J191DJ7QfUz6l2eViJDkx/uoDQOu9m7qKCUyZx1jRxVUOksfh8TVh3PJIpk7i3HRFoYnex09+EBg+0GOkZS09YJUYOAn8J/pLOH3WSWBEMw6U5R91yRt6oiWDVZgKS1Jt6BnkB/97s5eDIkeuZwOdcko1mF1TrfUEn0zPr8vnsdloOFiaQ/yDothFUnR8aid7fZw8kgXXJwiApmlwXN+69LD358189Z/hyro3Vuk8qQoZEZ3SbAZ4H8/+4nuTsDkfAnnFtSxRKklDlRjoPr8aTRQcZU0uVcOZHWi0/zw4spYL+6jo+wAqtWQP9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmxSsgML9W/6b3owvT68jbxZ4jWFhKz3HqI5QdB+UKI=;
 b=Wl5N/8O0W0WqMrA6mAeZ525/7L+BqSWP1xiH3ZjXqiFp91Ru3DgTjbFDt2i3bQCeXsTlpWNJAWQb9NeTD11HArSw/KLYVYiy4642Vbh/vCuqKTDrxKVuOtSBmQq2HC1kmBEpUhn5JWRw7QMJr678M1xc4X652Wr5QonfjqMbBNs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW5PR10MB5762.namprd10.prod.outlook.com (2603:10b6:303:19b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 17:45:55 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 17:45:54 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH] MAINTAINERS: add further init files to mm init block
Date: Tue, 17 Jun 2025 18:45:38 +0100
Message-ID: <20250617174538.188977-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0053.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW5PR10MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 75986571-6e47-434a-7489-08ddadc6ced8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iZEiMkCndM3BtQatnqsG30yV1DRPjCRq5rKxnnsDZEk6wInoZwvGv3gxrgP9?=
 =?us-ascii?Q?RHZLiUYO3Fan6UDbAwR5sw1TYEiBW8Qbw09aQ/a8+gtr0RMdNs9pKj7LT1Q/?=
 =?us-ascii?Q?ehdWu9AnRQnirh2J+qK9r0GEcvky5n3GQ/it0vqb/1dA1IJKqrXRcsulsRv4?=
 =?us-ascii?Q?+CRrjhFPyiQnydXfuaLWX6NEiIJLNhWsPgHF32KeQLN5UCOfR0PPFlwuGPYX?=
 =?us-ascii?Q?/XJewPonlqY7o3W3XiIkLcuivhZJHr5S4mmi/day8amp0CHbpNrKwE3VCWAQ?=
 =?us-ascii?Q?AdHVP4fK2i907VG4xYcyFiDKGCvAYNcTdT/tdm+O4NawbpbyzsnTtdpTQXBK?=
 =?us-ascii?Q?CmusCxQkwLvAImkFFmkIL9a49PtlBkdIF/1xpBPpsaLsaVjOC/bvc1ZvYu8a?=
 =?us-ascii?Q?p1HNAyrU76YN524C91YcY4LcmrZt9dxd85Wdq5j2Vymv0oHNgMJ156yOPUy3?=
 =?us-ascii?Q?+XjQiX8dLrkp8W4OnxfByZvhLqnw5PemBG0kleQehlyt1YsBE6MllbXnGlUm?=
 =?us-ascii?Q?PKtgGN9sz7m4D0OKdvJfMubLXcSH/57Z32K/2aD4KPKD8V2E5iHZ4qmCdc4K?=
 =?us-ascii?Q?pKrCBIGPLvWUy9G6VwBZ61RWUqvuZzJM5mqT0k2QWRigOz82bV0If1TCKbBb?=
 =?us-ascii?Q?lwW70qt0hNLjHG3mUwATs2wWEtt06/zOKkcww98S1SLyAE9ECupmRBLg5lRE?=
 =?us-ascii?Q?OIWeuXFmHHQ2IiCKgPF33QWG50cMuuApEOphDc+CnK9k24K7W2r2c0L0fHkY?=
 =?us-ascii?Q?k1ikS5+0jh/h8drhvfJCQvWDa3rjVTb3iR8ThSZtZbKoqan5iPMOxtCvk7ly?=
 =?us-ascii?Q?SO1Gu5+rX1L9kYo2U89Gzl2SpOvK5eaP2ihFBXFO7WlOfHT6Z44cYI+X9KHy?=
 =?us-ascii?Q?Q3G7ByqiPC5vJwpECEo10U5MoVUzRYa3xZInRv9xeenjDOX9Ef6C7+jgB6PI?=
 =?us-ascii?Q?HG5+AbZaM6kFwYCFNdDChM+U7RsQn4FXUbQwJ7b5uPXUsZoARTkehcnyktO9?=
 =?us-ascii?Q?feHIrsZdKfKv8jmZM5WB7G6qkIcVU0PTwuZ+BhhuKhNvrMnNV5Dt4ff51mNk?=
 =?us-ascii?Q?xEev+VClK8HCagXwHHQRzxsnbaIEjgud82B2Dt4P6GFPqx1iyn2AAg6na96A?=
 =?us-ascii?Q?iVjCaK/eyWY4wO+LIvdkfGYUSGaCGwPKWFdH+S4/0B/ceDeyWegjNqsVKYRS?=
 =?us-ascii?Q?vegXrqf8NWuZrSWy5kiZ+m+b+tUfOsCaHVSBqvfB4zUCzavhnzYg7/7pzcOr?=
 =?us-ascii?Q?sF4j7u8OPMPDazKqxy3EKvPv4xhutI6CB7NaTRNbFIjKbZuBpe3HYh0d4iVB?=
 =?us-ascii?Q?9/Jt2Hn2pE73J73+8GgTWLA2qltUjoPBfNdwUoTKtvsaJH/m/VDxEuGkSC43?=
 =?us-ascii?Q?AwfcT6hIrBfEWKeMwlFdXfjNfSu8IrHjnH6Gh5ZANEeNiqUz+DN/FnKtuWy2?=
 =?us-ascii?Q?+VrI8nem7Ik=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vN6aTiSakesr+CY1GXfG6BkrlP7uABYmrw8jSim6PvmaDiUf3FDjWAUnbVsR?=
 =?us-ascii?Q?vH3JD/kQbQo9oYCSQULwJPcM9fEuIB3UIrdklF4lw+mJYYN+ZYWXCBaEQ4Sm?=
 =?us-ascii?Q?ZxVGw7t6rMiP3oDLlBEYplgzMcv0rDrPkQM1heA+7XKXqO3VhobSjAZGol7w?=
 =?us-ascii?Q?FDuD5EzSIPqRPUc8BSW7PATOdwGGAMsGXq7ae3By0uVishxPOVPcP5CLGRqf?=
 =?us-ascii?Q?u2shd00TD7+BX0Gt459HKKSrUNAae6xLqpxP1bms4RJLj7cq4nLXXLmARWsS?=
 =?us-ascii?Q?7mDWPQ0KPLQNO5COhPc8NQ6zOFKVg3O0H6vYg1Wc8n+4oZks8GnSiRLYLhdo?=
 =?us-ascii?Q?fYHwLiXN5FHpkgqXGFJtrOYBnLXCriTc9A2+joHsv4YQGEZ4Wzo5qCoy/+Xw?=
 =?us-ascii?Q?XCU+vxvW8ALwUcg0wSaKNs6vz/LNukyd1OdS8JZ6h7e6M7CmBmt0CeFizzv/?=
 =?us-ascii?Q?Y5urAN2A9UVoDAyjeXgAmCm9+St1Y/Yk5p8XJ+CdRcp7JchvFAVDRE4kPZqN?=
 =?us-ascii?Q?sy0Vey1ETdV2N0nN3Hi8X5C+nZymiMJrW56fl6xRvmQ6p8011Zsnq3tU2kCr?=
 =?us-ascii?Q?Es0+fhM1z5cRi2bj/9OjXEhGdyCWcAz4YsoZXzz5nLnf/w5WjEhxJQidcKla?=
 =?us-ascii?Q?W3s0C1DQwN0rVDdxdQNl+v0O8OI5i9Gk1/+FpxwdknWePUikNsWFOcuUHar/?=
 =?us-ascii?Q?4n/4jwlQr3tsh7HCtfLAQg42apjg5Q7ZJqtcUNbq7rNs9pe4KITGj9KBuIcm?=
 =?us-ascii?Q?ceXQxSdWSM5IW1bmJWZV3g/ctPQxcv4eJJvIlbtHCLp5yoVfT+8pqHgInHK2?=
 =?us-ascii?Q?IDikzu0p1U31p524BHNOFBvyGKMEScVPaOYB7N+/cL2LVscW/Q5OZkO3s6EG?=
 =?us-ascii?Q?88pGaITlX9A97o1unCz9bQ6hQi0KSXkK+lnEFkXq8dQrEV6zs0ntJQ62lkNB?=
 =?us-ascii?Q?dFJFX+Y71AATqGWdgxog5lavviG0raOiogoLMfoq6EYNdO4QMYZr9F7IPnAi?=
 =?us-ascii?Q?JSDHs5uUlb4JJeKuwM7lza8HszwFmi9vCCqRs71qPhx6ccUuie328bHWV7au?=
 =?us-ascii?Q?g5j3psQ+QUQchrQTk0fuCno+zkoBWjES8wkxomhiT6UmYhjYU7XNfd0ti80D?=
 =?us-ascii?Q?h56IKtTX2f4S1qfz34w1AZN7BIWuEHqfdDRBWowL6s6fLB9v1ZbrZj1zd6BB?=
 =?us-ascii?Q?rfZmsrSbTzrw8fHmB2xw/TVDfcF8Jp5lGdg11GCDSMg3ohKRABi9LXOy7W0b?=
 =?us-ascii?Q?z3HWKfvgZNTEYqFY6lmeqtCcqFh4cnjgav1Ed3Ny5a3KD3KMzk3fHHrOfkSu?=
 =?us-ascii?Q?RwwlmAxXXqOFMETRvrvf5R7XvwHjR6SbDUhUNHH4IyNhbZaDJPmNOec7hP/e?=
 =?us-ascii?Q?1bxEXK0GE/IxsYyJzeUVdCyrK0z68Q6Ar4etVhnQHiJlDEfvMlsP4uK7GKbn?=
 =?us-ascii?Q?NOidocWol7PrU4eOjuGrLzyEtQ1ALQQGuP0jWFpfqIBOo3dcLAIWA2+hqiB7?=
 =?us-ascii?Q?YfRVknzho+JuLpDRez7K46BDbfDeuN3P+cT4Ah4lQOZ4XfJpgiv3cdXx3zN6?=
 =?us-ascii?Q?Op/SAOgd61TIn+WR0o0ogdeUjKBOjEtYV8Hk38mzLcsZJU4ryb11y3fgKrB2?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QVG8x3KyJ/2YoRsZEzoRVvZDFbGWeMOmvJOaN+2DiCfXz1JhOVI3SSD31UGS+AvVg2/1ChtC5TW94d88Iv/13Tw/gxGVOIJaGGXzsSMFUOWW3z9ahafc+p3WxDQkyvwpFH7iStEM3rUA0L+pugA3peKfJAydqATFTxeC/VbJ3Um3sDUZe1JK+EDiu9r66ZrvBN/OxQmSydG+d+DwQ0xnchDy/JCARq9ocgQZD/xSkp+3/dIMM2ZTorf8U02lCjQNQhN+gnMBp6CFWJv1si/9G67ypZTBSb6p965R4bDeEe5vv+Sr2FDqrjH8OQNq7Ai456eg3U5q7/Wenx3nEx1pLnuQN/9QIaO1kqz2XmT7nsN77loHjvilq/hgoLU64HeTktJFFPrOfBJeF3twtYAP/NRCbMfSViiKd5sS0uavd4tKnCe53NzkKkY2CQzA/Yjwc9+UPoXjVK9b4RZ7kfR8TzpyJ53DbalTa1iOQoNCFiBrDZ1f+KI3VnjN1gWgGh2zi9zmfcmYzJQJlxYta8Ku7Pz72OxlAe2zn6u165XD56l5U31CXDtIYOeEC9b1JwNZQ1mp3saiffEP7fb7q4s+qg6/fYtdOe4sQBDmQJx/fhQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75986571-6e47-434a-7489-08ddadc6ced8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:45:54.3627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQlie4Qr4NkCHUJvgy9R+4z8OUShsj3tpZZTYKS4zkEK7avcoeUHE9C7WV5W2sZSrkP0L81NcywnOKLWRgSFWssz0FV5y49Anx3pemLhkC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5762
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170140
X-Proofpoint-GUID: VJfuhlsmLhYGyXQKtz2s6Ar_vOJaylPQ
X-Proofpoint-ORIG-GUID: VJfuhlsmLhYGyXQKtz2s6Ar_vOJaylPQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE0MSBTYWx0ZWRfX3xOy3oyt0mT7 rWY9SO6zczGYj4C9YGElnlipKSK/m4pjIWZwaXwI5RirqKtnXdI4FTWBovAJvZ3gesOZHQRCuWc Ou01hs+gdinLG3Ukv55VPvk3Jik9zWKI1c2f8vMT/cI7XPL4h/EtDTyRWIkGv306dteMDU1JG9N
 DE36ILDNIQFgTfxwJZmVbwmZudC332rlOVfYDlAu43flitkOBpu3oRhJCtuYtuMsHh4GTbnX1sT yei78AMunwVh79vPLlo7kd2Xe02wNQp4Fojr+dxVgUnB0PgIjVRlhxp9h3nbThGWiGpjdcB5VZz hn5+kKC30xx6l0ex+8i6sA2igYGBPNmfkSOvObm/BYz58H4Ajf527P9jzh6s7Sws0AZdgos7k8y
 EpPhdvXB3iMbGGMQH4R5/OxCsKH9IM5YKUGyCFaKDgVdo55CmVpApP7CMOLIozVxcklhA+1D
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=6851a9d8 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=g_UbTocAgAWyKWC9dpsA:9

These files comprise the bootmem info logic which is initialised on startup
and also memory tests that are run on startup and as such this seems the
most appropriate section for them.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08045f9efadd..1d24399643f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15679,8 +15679,11 @@ S:	Maintained
 F:	Documentation/core-api/boot-time-mm.rst
 F:	Documentation/core-api/kho/bindings/memblock/*
 F:	include/linux/memblock.h
+F:	mm/bootmem_info.c
 F:	mm/memblock.c
+F:	mm/memtest.c
 F:	mm/mm_init.c
+F:	mm/rodata_test.c
 F:	tools/testing/memblock/
 
 MEMORY ALLOCATION PROFILING
-- 
2.49.0

