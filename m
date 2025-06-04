Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2206628B500
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749029061; cv=fail; b=mfC+PYXt3HP/dw4xUMrabm7vgLeO4FqZpzi709gnnPErR5rmYHxB8v1mfMbvpT1/oQ/J+NepJkjRfMmpqR62aJtlhBGUYkQh7sbHKP2Dfh8JdGpeFScZ5mfZreh3icsLrYkF56TUKeewItbM/NOfh+accvz71QgcwKaDwOilNfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749029061; c=relaxed/simple;
	bh=yEkM3ZCf5ScWhawCViLIK/motC/gljP5+j7YoPGpRnA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=gl5ZFbgz8VJrQKVVjpWYs+7hvXsfpTle8ZaQnlSiTG6pIWZB/itdtpjYgRoFvSZwKcdKYj/jzM46LZlJPj/DxYznMiKwFSKUVujYEsA7+pas3fzz5xvgMCV+Rv+sLqfVXboUBRC5yXlJq0wnMxJ5Rev2mMtArR8/7a7qi9C/nx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CJedaWHZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Lwu8Oa4q; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CJedaWHZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Lwu8Oa4q"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5549MfhZ012256;
	Wed, 4 Jun 2025 09:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=yEkM3ZCf5ScWhawCViLIK/motC/gl
	jP5+j7YoPGpRnA=; b=CJedaWHZ6JL1ZxzUIRrRKawJl3G84X1HuS9W5TmN6y7S6
	T3Qk3iLH73EW84vjCVMnIeOiM+dUT7/FfIQxTv711u+PIZ9NsfpYfDK+VLU5qzFD
	wnU0nmm2sI2lHkQCeAOIRuc2i4WAY76OUc3pjyjMuvHwNr6oVVw5GrFcDDU1uD1p
	Y6jv6dTERjc1vdfadE9ig67zn6yuW+YvRs71KNJQfLtqLdwNutimGSykLKnKf4EK
	H3SWqV19YzvAFcFBoREsAC58RuJeBwF1eD8XFy4d+Ku83VLHiSKVW6FGf1/Lq6Yg
	+EdG2SNPFzFcs0NjVMq1+pbFbcfrQT8vmZaUCcmpw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8cujbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 09:24:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5547Gs6d034829;
	Wed, 4 Jun 2025 09:24:16 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2070.outbound.protection.outlook.com [40.107.100.70])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7as6fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 09:24:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU4bue2f/oArPcNXzOtQToJu2nhqKN7Kk2yruuHLVkNdSLNyGfW0JjpwtKwld9AqN8UAXLycKx+xdnLifjrdcSOrbKGgdBVCc3+356q0H/eyAmF9wYNp2kUjpu+FjU/Q2uK9VELoXAGdIVMMb0w0fvRG6YZb7jluzcKu1/yjt1owzW0TPnLoHmJKoVv0P4ceV4yu1XW/rjx+mC2MFxEmEbK44F2r0aJdRs2Ns597vikvh6L40Sy5wvnu9KJHP6zOb31lNDD7FYndh3QHQhHD//IxI9/7xcTQOUpcU+i2ReynVp86B+jlRCqmQLjkWYSGwMloI8B82bIepj4H0R1vrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEkM3ZCf5ScWhawCViLIK/motC/gljP5+j7YoPGpRnA=;
 b=iKPt6LOImWRPQkfAuTIyBLoowPruiGojbywB7GRpCtcSYNALp9OQk0qGwpV1E4y+8MuXcCFGBX1gFzYIF8pB9P0BaDCZSBMWoc0AuYW0QDvTT79iYyhHHT2iVXtExVieqycgaekNFughxSKtVJ2PEFANDV6bxo4XwNsaNXApnGQt5aZ77ZcEukaWRqz+OxIX7QyiQ+AZQkzdgu7Q7zulqNoa5y+3lxeZtqtEFFV1WDq7bDLVTBedVOu6yWxJhTgh1NPI0QXF+KXJf+hMDQEJrNfubLmMPqANlauRMxvz87BBTOOGXDMfI1GmJr0D8DyII5Vu0VVDNS0DoGVyyv910A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEkM3ZCf5ScWhawCViLIK/motC/gljP5+j7YoPGpRnA=;
 b=Lwu8Oa4qmqDXavrCA40iEQ2kut+0YpfMJFkDMBorwKW7WSAFmafJZSYiPR8o55tToeeEVDTprBGuJRrCDcDAbWDbqe+4ckczOQs7bP9d9qKBn8ln6ONwHMyg9PrE3FlwISDr9hh53VKj4+2QmDlk8Gp9MnlYtj7N5qwJ3ZVLZdc=
Received: from BN0PR10MB5015.namprd10.prod.outlook.com (2603:10b6:408:126::11)
 by SA1PR10MB7554.namprd10.prod.outlook.com (2603:10b6:806:379::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Wed, 4 Jun
 2025 09:24:13 +0000
Received: from BN0PR10MB5015.namprd10.prod.outlook.com
 ([fe80::f2f4:6196:e18:1b1]) by BN0PR10MB5015.namprd10.prod.outlook.com
 ([fe80::f2f4:6196:e18:1b1%5]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 09:24:13 +0000
From: Siddh Raman Pant <siddh.raman.pant@oracle.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: CVE-2025-21991: x86/microcode/AMD: Fix out-of-bounds on systems
 with CPU-less NUMA nodes
Thread-Topic: CVE-2025-21991: x86/microcode/AMD: Fix out-of-bounds on systems
 with CPU-less NUMA nodes
Thread-Index: AQHb1TJu4lhwUPDLCUm1kw49OGUbjA==
Date: Wed, 4 Jun 2025 09:24:12 +0000
Message-ID: <793ae4a30ab15d0993ce9152ce91b6b98a05b1a5.camel@oracle.com>
In-Reply-To: <2025040257-CVE-2025-21991-6aae@gregkh>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5015:EE_|SA1PR10MB7554:EE_
x-ms-office365-filtering-correlation-id: 7d7b01d4-5c7b-435e-d939-08dda34991d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|4053099003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UWFpdXNSOTFmNEV3bVQ3YjBhUnJxWXlCYWREODBNSGJFbTlkMkpVNTRxNnUy?=
 =?utf-8?B?QWV4a2JtaGY1NHl4alNFTERUcW4rcnoyanp0Zlg3SlhsRFcvQzgwSFZtV1ZP?=
 =?utf-8?B?d2VvcFJzMHVEWXFEelVUQm1tdzN2Qk9QRjBqWmdqRXpycW5XQi9wOG5SaXRw?=
 =?utf-8?B?L0x2OTJJWVRvUHRqQTE5dnNjaFE3Z3lXNWtZWjBUZThKVnBVNDh1MENIUklx?=
 =?utf-8?B?WUtlV3VMdVY5Y0M0ZFB0b3cxbURUVVpWZGpVMGhWWmQ0MTluK2xFRW9JWEZQ?=
 =?utf-8?B?ZlNBOWJCeHk5L2RNSGw3Viszd3F5Rk9OcnpvU1hMUkxrMWlNTTRUZmZYMnh3?=
 =?utf-8?B?SXdPcDRzZzdqWlFKanloNXQvTzdhZlJ3R2xSbVArYmNHcCtxbnR6eTFuOTd4?=
 =?utf-8?B?N3AwaE1OQ2I5VkZTZzJ3WTRjOGFPd05STDJEVjR6NzAydG5VQ0hWZHRnRkxI?=
 =?utf-8?B?ZzBRR2FPV3dCNGRRUXJ6dmZpNEREY2cxZjgvd0YvcTJZNno2Nk1ZMTRJeVcz?=
 =?utf-8?B?Tmc3M21XNTVPcVZVTmMreHBvYzRQUnZOMzJsMGFPQVhvSlFMa1lEckJmYVU2?=
 =?utf-8?B?alNPb1l3ZVFQdHhIbTQvWVJoWjY2TDQ0VSt0M0phc0RGU1hnKzZMemMyUFlM?=
 =?utf-8?B?MGRyZnJCbEIwei93YklRdytJMTM3Y2VFdWFlWS80S2pqUzVFZVdqR1oyYktU?=
 =?utf-8?B?M3R2LzNvQkxHbzErMWcwTytNOVhPL000UnQrUFlZOUhXTUpQSFkwMmtIc0hX?=
 =?utf-8?B?U3NpMzB2V1ZweFBNblVBQnlsak5LZElWeUIzaFBmc2ZvQTZNWHJLZDhLTmtt?=
 =?utf-8?B?ZFY2a0JHdEZQMVdOczA1bnJxZWx6TUZJNzhac1lKRk5tTW4vZlkwMWxTcVJw?=
 =?utf-8?B?aFdyMXlnelBGeWQ4bEFoalhCWW1NZkRJUzh5dTFuTVFEcDBJSjQ5SlFta0pq?=
 =?utf-8?B?VzRuMXRBTzRoZDMyWTVhalh4dnJPc1Z4K1cwd3dNNk5tZ29lOWJjREhRajR6?=
 =?utf-8?B?Uzc1NitWYUM0YjdJQ1A2VjVQRGtadWo0cGkwQVF3eG5lOWhTNE5PcjRqMDNT?=
 =?utf-8?B?NVVWK094c3pjZ0NWTVp2cDBvTVRndzdNUC95NHBnS2s3UkwycjdCTXdrcDNl?=
 =?utf-8?B?MCtsVGZTVC9nOVZ4dEREeEdLM05CdERUUjU1T0tlcFVlSCt2djRWdC9kZjJn?=
 =?utf-8?B?SmJic3c3VHJJTGN3VGIzV1JESzF3UDV2T3IweWZJbkhvdkw0N1ZlcnoyYklF?=
 =?utf-8?B?elJmNGRZcHpwYjJRT1VMa3N5c2l2aWViVUw1S21SQ3Fpd1VmTWtxWXIrVkFS?=
 =?utf-8?B?K2ljdzNkT2pMSU9iV0M5ZEc1WWNuYm9KYTlmNU9abCtQOUZsN0xsNXBhdDBE?=
 =?utf-8?B?U1NwaU1LSXBCd1BQWGFBemIrR0ZTczBoK3VyZTVCcnlENlpyaEZmeXIyYkJ2?=
 =?utf-8?B?L0o0ZlpFTGNCL3lORDdXL2k3RjJ6VkIwbEtxNjE0NkhhYjNIamxIMDJtcnVQ?=
 =?utf-8?B?cER2TmlQRjJKUnFyNFU3VTN3VDVwU1duS3MvdlBacGMzM3pUSTdtTEZzNUFW?=
 =?utf-8?B?cnlFdEhGTTY3MHFNTTJZeWlNc3o4bHZaRWhwaWhQbUY5ai9oYmY3TTRTSENZ?=
 =?utf-8?B?dm1BUFBVQ1dxbTgwTmtEdzBsSWxBTWhOa3FYZC92NGRSY2lGaktXUjJRbUFt?=
 =?utf-8?B?SWdwbmpIY0RaL0dPYzY0U3djeXFkNHc0U2Y4NkJGT0NkVk1aZS9hMElVVWJE?=
 =?utf-8?B?cUo0c1N3Rk5SQmFIRGZ4UzBoYXNvSnE4elBHaWlPRlRRMThhaXR4dEVtZXZO?=
 =?utf-8?B?NGphQmdGNmxHUEw3SlgxTUl5aTBWNmtYdnlZN3RwdjA3dlRhaTkrTHJOT0tW?=
 =?utf-8?B?Unk3QktZVUhLODBDTkw5dXRUUHJDSnRUaGtreGVCQjJtWjVTTEFlYWV5a0Ez?=
 =?utf-8?B?dmI0NFN0dGlCTFlmZUFSQTlrM2pyQTNvR3VLaEs4d3JYS0phSXI4bEZVeHJ0?=
 =?utf-8?B?MG44ZmZDZ0FRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5015.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4053099003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0srM3lUam9DM0VQUzhRUFVjUExFVjNURjhCWlIwQnRjQU11MnlEZjh2OGVE?=
 =?utf-8?B?dlBCejQ2eWd0MkppMFlYd05ncnZEZ0ZDUGNrMlZwL3YxNENzN2xvSy9ob3k2?=
 =?utf-8?B?aGQ3UHpDbjdiQ0krTVgxNUsvcVQ3Q2N1dDFmYlAxY29PRWh1M2RBNklrcGtk?=
 =?utf-8?B?RXh4R2xBOVpUU1JEWnpLNEV2eGhacTlHcGt4eVVkSzNKbnVzUHVtZ29sNWZE?=
 =?utf-8?B?TVhEMmtvMmszdGdYc3RrRU5PZ0llQ2lmbEtRQktuWFNJSEZKaERlVVFrdDZO?=
 =?utf-8?B?YjZ2UnRlOHAxUUo4Rmg5cmtpWGx5S2s5a0Z4TjRLQ1lRZGp3aHZTTHprUTl4?=
 =?utf-8?B?QzhFZW4xQ1FEZUovLzlLbG5JazJpTk52NUJaYUpSVFFma1dNT1JYd1FQWGd4?=
 =?utf-8?B?cDc0RmRSdHlhdUVrbVEzT0hYOEpVMFB5aU9uMkVWM3RkdXFuTW1Ha0JIYnNw?=
 =?utf-8?B?OTRPYXpWQXVXMDVack9Sd3p3aC9ZU1ZwRVBXWG56K2twYTUwUW5sb0Z0U3Z5?=
 =?utf-8?B?bm5LclVWRkR5THozL3lKUHhpOXBvQm4vU3g2a3VsczBWcU9HSTlJbTk4ak9o?=
 =?utf-8?B?Q2pGb1NRVVVSMlJYU1Q0b3hGVkxwTzNSa3JJQk1qN1NGSUcxZHJ5NVltbFFX?=
 =?utf-8?B?U3Iwa09TY1RrcTFHRWIyRFFhL3pvaVdPY3JvSzlkdUl1cmtCZE4yVzJmVzB2?=
 =?utf-8?B?cXB2UVFpM094OWt4Qk9YVktBdnVsUndqZkd3Y3lKRUFSb2lreld1cmxOMURj?=
 =?utf-8?B?VytPc1VPeEhvSjdXdk1GMFFlelhGS0ZIVmFmQ0EreWR5WXh5K0ZxRHhhWlpn?=
 =?utf-8?B?QWxLTWQxR0FKNUl3M2w4RDBkNy9rNFgzRnd2eFhieFJKNUZkVHUra1NvclR2?=
 =?utf-8?B?TE81UEliVUhTNnNMMys3UHFuWm9sbW5xYktxNHpCWVhVcU1TWTlka1BBTEY3?=
 =?utf-8?B?Mm94Q3hkTVFldndHeEdUbnI4UXF1bmpmSTBVc2RrRDd6UWhWb0hFTmRKSGFT?=
 =?utf-8?B?NUJOTnQrclkvUlZnRzNQS3c5eEtMTFRYd2hUTFYyT0tyanhrdXV3MWtlZld1?=
 =?utf-8?B?cnoxNjlEeVo0REpyZnNuZWlYMWNDdndjUU8wRmZDQXBhbWIwM0Zrb2FVb0hr?=
 =?utf-8?B?ZHRHUHNTeFVnUE9wem1IYXlrM3lVSUtQOGhBVWh1bGZ1NXdFWUtJVTFUeEky?=
 =?utf-8?B?a2JVYmUvTGpWMXF4Ni9WNnJuL1lYSzFRaVRkbWtkaHVKcnJ0NGpMdjZMN2di?=
 =?utf-8?B?UjJKRTZRMEVsSGRYbGM0ekk1OEFuajNuamtyU0tnUVpBdWVHRW1yNUVibUZr?=
 =?utf-8?B?dHNBbWVLeGlzaEJ4U3BDWk9GVzZvTk1BdTVJalh3RVY2S003aVpDWkFIQVdJ?=
 =?utf-8?B?d1BSSHVaMUxCNjJkWUxPUGZqN2VPMjhsK0hrNm9rVU9kb3poZ0JQVVN1V2oy?=
 =?utf-8?B?V1JMOEpicFB0TjV4clVXeFptamhYcGpMR3U5UEl1andwT1Ixc1ZHQndNWUli?=
 =?utf-8?B?YTZDOFhacEdLSHZTWjFGYTlrN2NST3hzdWp6eGVBTzYrUVZGamJnVVIvQ1Nj?=
 =?utf-8?B?eEhqTEJjYmdUUGQxb2Mvbk9DelJUeFA1Sit5K3phNWw2VmJiWjVBcjlEWWw5?=
 =?utf-8?B?OEcxcVpnSkxVRnlLM21nSHQ5cy9nUExwT0tSZ1JGUDJpcXBLNExOZDFCQy9Z?=
 =?utf-8?B?OXVOa0xMQUt4RERhcEhQSXBoZjBVZEJmSXdaUmw1UklTdFhNRWlzNXE3Q0dR?=
 =?utf-8?B?REZEbmVSRlJ4QzJFakVMKy9Ua3FVMzRPaFZjMjJWcW90WjgycjcybUdXOHZm?=
 =?utf-8?B?R3Z6QnprTmhiN0JMV0FYS2JKUEFuUmRIL0FoVkg2T2lYb2RJZGFubk5wSlRu?=
 =?utf-8?B?QTQ4SGpodUJMVDFYbk9heGREL3RMd2J4Y1g0bDRjbHRKUlpkWHhYRGxHNERN?=
 =?utf-8?B?Skw4bjdMcDhVRnlCN2oyVVNpN3RUM2RMc0Vja2IreGZRU0NuWlhWRUgwNlkv?=
 =?utf-8?B?MUh5aFdpeWVJRGRxYXpqdU8yQ1BSOUxXNlV0SjJPeENla1ZvV1RrYVhNV2dW?=
 =?utf-8?B?dGtxVTNteUQ2MGpWT1VYVnY3TjBwYlVxd2dCRy9Jb2ZGRlFwT2lKN0dud1dB?=
 =?utf-8?B?ak1NVnY4MXBnamd0YloyWldrYXdZTjNpcWlwYmJYSXhBNnY3NFlVdGM2Z2F4?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="=-FPXQ257AG1rFQhmPejIb"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OjCaMY3eVDccyz+9AyrAbF1WJSzfsvAxp0cZKTqD0SNf92jBx0vsebCL/IKuuuCuY+IY/+S901nVMTN7lia9XA/UJcMXKaJjfUnqdTPwehUAiu++QVAD5Wf7CA7X79urgMEpXRGHFMxWpwEiatbpLtGfhzsmiDx8RVsJv4aevFLrfvEoyxBZfxkfiaJd3NwIrDEd0uUIIOgWKorsxciApqsh0YmkRPhpAXNAz3IrwE69iA5s+lm+7s/wzwq4eOo5IEWQH/UetulQqedLIaAPiREnldX7fKF33BYv9/9S0kaipV9zhvUkcwfYkcRlL0f5sPoOwbj1Pfg4BCnnUgd/o75tEC4bF74a2uppCixAtE56Y8nZutov7G7SUkr53lMZC4jOnLE1XqVWpCX7Pog4byV7A7e69Fqob0RBRwrj170Md6zcd6N8m3Brxoh2ZkHc9PMYB513zmEMKKzy0iKogRDQdRA7AE0BN7NBiWApy9swF3cmihI/grHFT9ZEbG/Da0K94fbqIDmxys54ThNaVp9qevXxIKcMHuMjYqthlkh9A+7e93K5q72M4Q9PUVZoad7f9Hx+IIfdlbj0E/nCakH8Xv8SX7jBFvQLbOTXybg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5015.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7b01d4-5c7b-435e-d939-08dda34991d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 09:24:13.0675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 81ghTdA2Hl1JAW3oEID0VBT1mnLj2zx84SrrtQRw4si6WNxtdleqxAuw4AyA/EYVBfn63tJj8SWmaAT0UjrKzWMxc7r365suUj1lmb62jaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7554
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=941
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506040070
X-Proofpoint-GUID: Di-lUxfqFtxLm3gK15Mhd-zjFs-cjf9Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA3MCBTYWx0ZWRfX45GnLeLOuNsE YZlDE7eD0PHHEigBBJ6OcSu/Su4xUS2X4jlmZyjnX48/lDhTMMd4PyX13/tuQvXlQxEQcbYNPLt TaIImoI4ezX095N7QurJirDuV1nm/1UWxdqPmc9wKjKTKtXRNBtMqQJFAtre8yol7xiP1r5b41K
 lE1gPORzdfrLDN2bnTi+DWt6O0hL9r3GrkSuAhUWvOe1/3yHSAa6XXMBvuJXeoEdrbcQcmru+sg +/odTxCa0wwoNSOMfP3TD0CsGuqKDLiv0wyavOs7DAihl8CZIbTaaD+1mgJZ6J/OwgNnsZ/TUKu 7AfM45wqBUSgkdJsjxrcXgTLyDK7kxArHsyspsBD+7QFdyJjqd6j1/+2CO97B9i0QFz9uU9fQXU
 D0hj+1F4wtJ+wmCWRJp2PYkngGwXd05EECldSOmnZD+EfbBaId3s6XHHvXtTzXa7idBBezzB
X-Authority-Analysis: v=2.4 cv=KaTSsRYD c=1 sm=1 tr=0 ts=684010c2 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=cajZmgOlrgwRl5xnVmoA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=RCI8pwXd7yWMHiwSJz0A:9 a=FfaGCDsud1wA:10
X-Proofpoint-ORIG-GUID: Di-lUxfqFtxLm3gK15Mhd-zjFs-cjf9Y

--=-FPXQ257AG1rFQhmPejIb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Apr 2025 13:51:58 +0100, Greg Kroah-Hartman wrote:
> In the Linux kernel, the following vulnerability has been resolved:
>=20
> x86/microcode/AMD: Fix out-of-bounds on systems with CPU-less NUMA nodes
>=20
> [...]
>=20
> This does not have any security implications since flashing microcode is
> a privileged operation but I believe this has reliability implications by
> potentially corrupting memory while flashing a microcode update.

If it is explicitly specified that this does not have any security
implication, why is this a CVE?

IMO this should be rejected.

Thanks,
Siddh

--=-FPXQ257AG1rFQhmPejIb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ4+7hHLv3y1dvdaRBwq/MEwk8ioFAmhAEJoACgkQBwq/MEwk
8ipTag//X8vosj3z2CI3MlIeJMSUfcMKoS21cXOKVZmDBjwVCXmy9z+nu4Ue+nUJ
jeLbKXNVMwWNp4VR12puCagtXaiiLqxtNiMC12qt/utTX6ukxJS+T0oWySOFnQyM
06TA9QUsNFRCQvmmw3TJtEDnqnCydQlX/nhku6YFqmRwOfFz48YWwPOvxHtBpV5m
Drr1in4SF8V5LqaLZLmeMzznQSRkNb5lSMaXC+Jv6qZSwu7vsP7x2bcE6irwxXYY
XQZgtS/zYTS8aqubP/qsSS19GvKSTQgSK+/RyL2HAJ/SgoryvrmtgmZSJZAmGZ9W
moedWC37nnyFnwf47hwwRC9DYAHZVd1GhK5yqBb7pbWK3CXdqwFtmZ3KfjS7O13E
0VhTQaRHgkmfEW4X6aCgiAVcot7Ln7NAKvmxx7P6fGI15eIWYfLyVo+37tVAwSm2
1MFHgoL4sLDfp637x4y2Q53IcbQojKfxHCUJGJkXXBtRL64P/U1O7yy4bNnqpoh4
G+zGmgbjfmk2qu8aPn+YPYS++eFIcjlryS8arxZw/Ffv4+8yew4Rxzd7eGpdhg7i
rNVRH4C1zlZh2uhl2dfxrYrxuRlv7IUeb6cP+/RHQt2rTjLIuLu7M5RaptCn0AeI
bKYlUXX+PH/QfNjXjXfZqVMr+XNCyCHuYQCVHa6fhWB/Gns5aFA=
=TC3N
-----END PGP SIGNATURE-----

--=-FPXQ257AG1rFQhmPejIb--
