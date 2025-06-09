Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94C81F542A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483224; cv=fail; b=YcJTUsLy79TAxUzEaCc/JbpR5MY1cS8pokRpTm4+GvwSj139t1LmTJR9Qc8Zij6KE+AOzCm2Pqa4cIVWKFv3EOHtiSBufeR3dD0vsSPha/98/JL3sj46Yyshd15I/eOukp7EjQvKbPrmcFrfO2fMXBVk14hxQs2y9K7shDNu+5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483224; c=relaxed/simple;
	bh=/RA2xTFOVMd5GxQeeUFaLCuSXt3Z7LbnpUrm8o8jM0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hhDDBi3PTNk7LVibjtE3uRI95J2ZRlNXIKdbe7OCxb9rkdEycR2Pd+3WgGu1VAaLToP0A3Z07ebFAAXfl4hmX30J8MFYdj6vLq1ivj3CQroZCcIjS6CygChLGYbNjhGZTvx8c11tSULNv3q36+XeB04qaq3IuwLtv6ljaytgxtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cFgoG8zP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dMtuj0am; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cFgoG8zP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dMtuj0am"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593huC0000640;
	Mon, 9 Jun 2025 15:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=5kEHp3+MlgJvAEJDJ88Lz4d8t2hX0ZsCl02aWq6+37A=; b=
	cFgoG8zPOP8c5+USbBd0TVc3ZyxQyFqFvB+w+hv4c6M7Zf34BSEv9yXk9STgJhgb
	83yOQyTTKAfVB8FfmCO62ABs+SDsCrY2F8nLl4kmDeC8KXwJ46IXDYVYRj2Y7kso
	VKbrm94zTrU2JUj1ksNzb66eb0NTHbkv9So+wh+M4tveWqVJW3/7GXLd38zQ6AQh
	6bNEJSfDNYZW5iL9v7h/3xAzpb/FWLpLfF7zy5/j9ciIz824xSf5bgfYaAbsMnTP
	Jj2xUr5DcE/ho4hlpM1fGTXzolEHwmKvN9vbVvxmFHCojS9WyjSUEDqSiuLJp4z0
	eSfmjYiAUtM4H6um4CaklA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1v2db1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 15:33:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559FAYWH020255;
	Mon, 9 Jun 2025 15:33:23 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012001.outbound.protection.outlook.com [40.107.200.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvdtxcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 15:33:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTjBq+VKS/86sanndfM7xa2+sjEqmg2u3KwyQJeXprXxUzcNkG1wZA+PrenIeyRktMsxVfEEB0UVxj+SnjQCgOn4Qu0742Whsf77V5CcoMyh87fJYlF+Otc3RLz1B2pUngkO+dwSbrbNMjtuKjIa69CsNf5H+gNX43XvKKqr+UOtOppVx1Nq/3p002ux+34a2ucI2xXSZx+w6TEGmPDJSetPtJRWpSxDDmhPICmbwEF/4KIvN9XfHKR4fZ8/1wo32arbV1MGAz32EljCPhh3QQ2kgLlQq7D2XhM6QEZ+fEfZx7mle663lkfhqjksKqRGpAG3RyI3YLRHdydmPwn36A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kEHp3+MlgJvAEJDJ88Lz4d8t2hX0ZsCl02aWq6+37A=;
 b=ZYZmOf+WoAmcBb1+Gpk9yE2KLmpkx13tBpgYGr3toD+fG65RX9sE7pKbKFd3b9FcO8tCjkN6jFZRVH23f8rKD0FU4l/y86LokWMkP02WvqFEn1QDKc47xvDmmJB2YP8eFb76rtwIIDtT5oQ/jV6boNNU8X66w8OxZXkR5GmJdPD3P4X/nh84IImXzOHoztION9DDu1IoChnf1niVEkS3XaId643UNsEJYwJjOZ+7YJvk+foQJdBiqXBkpIrWgsjlf9LKB8CfY8ILh0oZv9hZyQ4Q9/CwXpbEusQ0l6Tx5NOsRmpwM7jCLhtfMl1Ps+G0RYon9TqQWKHaV4lIp/Lsfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kEHp3+MlgJvAEJDJ88Lz4d8t2hX0ZsCl02aWq6+37A=;
 b=dMtuj0amz99/jYpcjkD2Q9BfG/rvQ33rOLNtETDW2gbr4td4u3NDRmfKH3u/GoOGfa6LRt0r7cVLHLjcQpCj8HDCEj7hAQ/jWijoMDo1+2ujmatFxMO1XWkd9Km11lJ8aRRukts/NXyBc4gX5PcZic4wm6DQAFN/W2vu78AmGW8=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DM4PR10MB6278.namprd10.prod.outlook.com (2603:10b6:8:b8::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.21; Mon, 9 Jun 2025 15:33:03 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 15:33:03 +0000
Date: Mon, 9 Jun 2025 16:33:01 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm: shmem: disallow hugepages if the system-wide
 shmem THP sysfs settings are disabled
Message-ID: <86bf2dcd-4be9-4fd9-98cc-da55aea52be0@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <39d7617a6142c6091f233357171c5793e0992d36.1749109709.git.baolin.wang@linux.alibaba.com>
 <b6ae32e5-60e0-44dd-a1e8-37c162d04ed3@lucifer.local>
 <5578735d-a06c-4a50-9ca1-c141092f2b3a@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5578735d-a06c-4a50-9ca1-c141092f2b3a@linux.alibaba.com>
X-ClientProxiedBy: LO2P265CA0140.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::32) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DM4PR10MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: fe1774cf-5713-4920-6cb2-08dda76aec89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rm5JaHBTZ2g4OHFhbVVjVDJHbEYrTEcrVWpqZEJGdlZWVm9iWStkTCtuV3N6?=
 =?utf-8?B?L0J5SEQrejRFbW1jMVZyNi8rb2NkOUdNSFF2eVpRSUREQkV4L1B4cEluQ0NU?=
 =?utf-8?B?R0g5TzdqSmZuRmpINUhSaDFxR3ZEYVZxVi84RmRPZFZ0V3FCMEN6R3kzMVJq?=
 =?utf-8?B?bUtFV0xrRWRYQTgybHF4ajdteWw5VG1XU2NOZElQTGJTeHVSZStrVEFBcjV3?=
 =?utf-8?B?eDQ5ZWQ4ZHlkTEx1UVJ4NEtuVEErQ0ZVbS90MFRQL3JLN0FkQjBPZEJzMDJm?=
 =?utf-8?B?aENvbGE4Qnh5YTF0NFg0ZUhoaStPOGRZazA3Z01QYUVsRFJpUmM0RWJSOWZu?=
 =?utf-8?B?bXEvWm5aK09FUE5MRXRDcHRnM0dDT2R6a2R1Vy9UMlQ4Y1FtWGdiOG5Ed0xn?=
 =?utf-8?B?aUttMzZDelhCWVZMQzVVY3RiRUJIdnY2clBCZzZuT2NrWWQzWkN2YmN3QitB?=
 =?utf-8?B?cnpWUER4OVV6a1o3WnJpWWhVY3F5WTIzUTVtNzZycWN4dFJTcWtDSEQrTEV1?=
 =?utf-8?B?WjdkMFBtaFRVN0pFL2J4SktMRkFqMGhEdmxLcEJwRTdhWUpyM25tQWtFa2ww?=
 =?utf-8?B?dFJvSENGMTd1TGxXME5TUmtRNjJvWlFjMzc4S3huaHh4MzZFRWpGdzhiYlcw?=
 =?utf-8?B?YmI1R1UwVGkwcFhsYzJmWVFRdi9CaFNjcXdOL2c0c1VnVUs5OXluMW1tYS9q?=
 =?utf-8?B?NVNpLzZLeVRRQUdtcXdhdkoyWlNwZjFnVWlYb1VuWTZFQUt5QkJuY3JSRU9v?=
 =?utf-8?B?S1VpT29tWkNRcWdjRkJPQzhRMVJnQy80ZzF0Y1VnZVd1Nm5nWi93YjdCM1U5?=
 =?utf-8?B?TWhFSXBiQVZPY2hXWVl6THJoQzd3aFFJNStKTUhzcVBNVnNpRUU1SHpzR3Q5?=
 =?utf-8?B?MkVIUW1CODRUSEJROFROU0dhOGs0VEhBVyttNmt5d2tyOTZwQ0hwMFdNbENK?=
 =?utf-8?B?aHVaWTdpNHQrbFNSRzd2U1NUN3FOTjdVUXNJM25GOHdHdUZaOStTNXFCL1F4?=
 =?utf-8?B?UEJkSU5QRmNvRFdZakxyYmhjKy9NdWdKU3Q1OVZsbVRqbS95Rk9KZk5UWGVn?=
 =?utf-8?B?Zk9DWjA5Vjl3NmY0b0NnRkVObzczbWFZZzNqcy8zR1RtZm4rMkpDSVN0bU1X?=
 =?utf-8?B?K08xMWJhQlo3NlZhdUhOSHRHVkROWlg5d0w5MDhrNW84UTdCN2NQSEY3OFBB?=
 =?utf-8?B?ZGhvTThOTjRhQnF0NGlLQVBaTXQ4NTdHc2NKTlRCd3o5Y1VZcE16RUVvR0hN?=
 =?utf-8?B?dXp1OUM4V3ZLOWhySFY5bnNvUHZBcWZXalF3T1ZQVzZOSXE0SkJvMFVjVXd2?=
 =?utf-8?B?R0tCVWgzUGxNcVpsK1M0RUE0aU40ZzFZSTlkMURwWHJJazdSWjhpcjdyY2t0?=
 =?utf-8?B?T25SQ0ZhalRLV2FtcDNqL2s1UjlQRmE3UmYzM1krcnJsTlJyQ0RZWkYydWZV?=
 =?utf-8?B?bHRQTUIrK2JJRmFoaVBNdmFEYVdGQUQwNm40RmgxWURPS2pNckhJYVlZRkNj?=
 =?utf-8?B?ZUlWWStHeTR0UWxaUVByZ3d2TEVod201dUJ4NGVGS2o1ZEFkeFlZUXlEdEhi?=
 =?utf-8?B?YTV4Z3VaQTFjc3NqbkxRTm9KZWtDRXE4cXk4c3R4eFpGWUtZZTBhWW1WaHlJ?=
 =?utf-8?B?SWs4eUEzdHFWZGpEajBuU1F0d1pObXBLOVJCV0ZvcHUrMC9OMndRY2w4SmR0?=
 =?utf-8?B?SEZ2eTVha0lnaGZKczViOUpoNFQ3d0k3QkxrdU5oQUpBb0NSOW9MM2hlSEJZ?=
 =?utf-8?B?Rnd5L1hxdzdUUmtVSmx0dkQ3Mkt5Yk1sc1hMSmFaWEVOMW1YdlRDbnpPWjdN?=
 =?utf-8?B?VGVlSGZ6RE5lbmhvNFZ1WTlpcGUyRVNzTW9wWElEMGZMZ1poL2tiYnU4UU5r?=
 =?utf-8?B?amhkZ0NmRFNTSlN3Y2FXeXM1NjJTQjkrWXpmblIxL3ZjTTdqTDhzK2lxQmQz?=
 =?utf-8?Q?jcEK7e4C/w4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azFTZ1UzcENiUE5kbmliemQvT1I4SDY0d0FIQys2NGVOaFA1Y0drdk51MEVL?=
 =?utf-8?B?THI3dWcybDFiaTVhaCtDeEJQKzNEUElxRWMzQUsyZmRvcnkzenU4NFdzN290?=
 =?utf-8?B?N2ZacXNlVjl4RHBkcHg3Rlg1RmlKTWRrNzQrZEtqdWliOUFDR1U0OEZ0eWNj?=
 =?utf-8?B?b1pJcjloSjI0MTk3Q1MwbCtQZ0ZOV05wOG1kR3hDdHRwdDJPRjZWWS9RM3Fh?=
 =?utf-8?B?Ny9SejdDbkpwMnZQTUkzbHc4d3VxZ3hySjNHYWpFa04wVUJsZlZDYmxuNXlX?=
 =?utf-8?B?MWttV0xSZEg3Q0F5Sk8vaTVQREVsOW1MV1NFdXhRcXdld1R1c1U0eVpIUkZZ?=
 =?utf-8?B?QlI1cjdZcmN3U2xiZ3ZXNGdqdThvYUJ1cVh1MXdjdkN2UzFiVVpRb0dzWWJa?=
 =?utf-8?B?ejRuVml6a1pJMUgxYzFXYmxNU05LbE8va1ZPYXZwa2kxNDdVK29KaG9GSFFN?=
 =?utf-8?B?cVZ4QkJBcDk2UVVyUHlrZUk1eVBZSFFESUtCUVpZOEN2Wmw4c3lGTEJIT2J3?=
 =?utf-8?B?TDJLL2Rob1gydE55bytMclFrQko1NTgrUDlXdWkwMWdkSHVNNzdIVVV2amQ5?=
 =?utf-8?B?TUxNNzJnc0hVNm5vMExCRk8yQ3FkdkhabjVOa3pjZ2dOdjlIUWhTaTg2ZnVO?=
 =?utf-8?B?cWs5NHdSa2hOOE1OWjFlbzYvd3IwTlU4YWNlSGpPYjRFY1F6YS83NnMrVlht?=
 =?utf-8?B?MnFTQ1ozVS9pQyt3UjQ2SWVJOVJGRStUWitaSjlvUkM5VE5NdytjMlZTUVFz?=
 =?utf-8?B?TGw3NHNGdlJjZWxMZ0tRSkxCVFlMQldYaGNwSlhxZncxVTl1TTNtSDlqVjdC?=
 =?utf-8?B?Qlg2amYwMTU1enVFL1RJWHRTbzJWek1jamk4TWthUFNDa0o5L3g0ZkhSNEpt?=
 =?utf-8?B?UVNNbGZyVkN0SUJadVFySW0yWHpCS2dyNU00T0JIREcrdFY5ZUR5RzdCcWpT?=
 =?utf-8?B?R09qVDJUZkM5cmcxUUNTUjFUYmNGWWNicHZrRmlzdGJEdVlUZ3E3Ym9BdEkz?=
 =?utf-8?B?VFpiZ1VDWTRNTXltVlc3RWJaeFJOeW5QbmQyY0ttWlZSVEoya2lidEo0aERO?=
 =?utf-8?B?Rml4V2tpSHRSUjUxRlJScUUxRC9ZZkxwMmUwTVptaFZLMG0wNm5SWG9kSUhx?=
 =?utf-8?B?U3NpMWF2U2hxb0tlejQzRHJ2VjlTWW9rUW9QbFZmTUpEMkswNFByNmpySzEv?=
 =?utf-8?B?ME03eDFCTjg2SUI3emVNVmlaSnVvWWk0NEdHZVFsSTJzT24yRHV3ZWJCTUcr?=
 =?utf-8?B?T2p3VkorT1RDMURldDRUM0RacGt6MEJybmNadHREaHRHeXhhMndKWGlldjZR?=
 =?utf-8?B?OVl1VU5RQ042VlJXS3Z5cjI5OTJyRTFQY2hZRUxWU1hTaUFWVzRzeVhxa0Zz?=
 =?utf-8?B?R25GaXJuUDhJdlIreU04dmVVYUJUOHR3ZGs3Z3N5cFM3RXhHWVlmMGRaMHNv?=
 =?utf-8?B?R3NLa0k4Yld6SVlPZGJEWXJoR3NjVjYyeVNuS0QwVEpmOUlpRmNlR0VrMGUv?=
 =?utf-8?B?ai90Ymd4VU9oOXRaMk5lQlJVcEEyUVFSZGlWMktHeXJXU2t6K2NBTHhNZVZO?=
 =?utf-8?B?bG1GSTQ5ZjUwRDA1WUErRUdScE9FRk9EV0FvT1FBMHYzb1I0cDNlVjlvR2sz?=
 =?utf-8?B?QnlQNDBWTTNzRk1iT04vaDJEVW0yWXlSMVAxMTFYNysvaXFxZVhzVlBTRlZu?=
 =?utf-8?B?VFBGaFllcnBIOVdyQlBBeDJNblVtQ0ZyUXRBNWJrWXdlNm1iUDFLK2EzRUZL?=
 =?utf-8?B?aVpOOFdkVWxBMGZVc0ZmTkZ6dnUwUHdHckFFUFpwVThFNFJBVDg5WGhhZHBH?=
 =?utf-8?B?NXVOQ0R5aG12RFQ4aVVyR0cwZU1EVU9FTUJvM3BjWXFCdVJZVXNRRnVPZmR3?=
 =?utf-8?B?KzVwMHY2Tllmc0ZqNmtiSTRrbXRmQ2xmZHA0dTV6TDBzSnBrZHIxb3UrQnhN?=
 =?utf-8?B?RVg0MU1LeDJ3YVMxRW9LVWxJUzV6d2lCMXhGcFNLcTFweGZtcWhlMWVsL21U?=
 =?utf-8?B?cnJJRm5OMWwwLys4S3JQQ0F4MDZvSzY5dEVNZzlNd3hPV3lmN0pXN21lamtZ?=
 =?utf-8?B?ZGhXWjFuNi9KeVEvdWIzQVNsNmdMZUY5b2ZvTVVOeGZtNC94NWhqWlR4bU5o?=
 =?utf-8?B?d3NuL3hGN2JnL2RYNmZwODhyZFNjUTZpeVhVcVFsenB3b1hpb3l6aTF0QXZl?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	92IQfPuysPVAq8k9f4MFbbEJr82YzbTFC2zfh8cda1zwWmGiSR96sMvRcXZEZQ7p0CBru6wvJdUxJbUEc9nj2Z36iBlqramYa08k6IeUHQd2K4EzP3SnmQcn4UbHjSBfIOTbgGodmCIY6+EHbclz82WS/CXUP0qlbL5KD2KUZ67DaxMULAgpy5GX6s4PJPI5mtv/G0eP4DcYS0W4S9ZpEKeMDe+fWEjvrIY7gBflHiIdU1H81xNE6kIemGyDTGtHilyCtyKxVgkiP9Ui/ul8+RLwBgJIt0bpOft6Afsc+ty8TRxYv83/zZbhEv4o/sNqYAyCaSVT5DYrSv9lz2WdFv6oiSmsaK0vpVmZZW3hrGeYNOU+GOo2N/yDqmQDlSxqlaCbbYKbvEMMkM+8FmDHjADOakzxtlz3B4mDk8TbVaX+kS0RfCExWOAz3p++thcr8BsbpzxnZM/f1UORKgAPXc36fdFmTRDIuYnHjAddBZTOjsEAICMtueAEejojJ1BD2u/mn7BOjDHRhwEznML0fqGLKfMEmCzOHXKzBL6HklsOOwTKgFdBw/F+h6PMUTcPNk0L4VuTXBenyd9Hy/1D3tJsJk30mCMFGRsjnVueEiE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1774cf-5713-4920-6cb2-08dda76aec89
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:33:03.3811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjA+DfV3IPkKaicWrLcSDCrakYHWD98FJfo4vyy5oaJlSbtA15QvRctSzFrvh5XE667TAorBU1/5MIqEwo5SaiiLGVt0Uu1/vBA4tsJHSUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6278
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090115
X-Proofpoint-GUID: KqC3Dvo9A_oAJ67anaMR8-7q_vePQEHD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExNSBTYWx0ZWRfX1xZwfBGD97M3 LlkxZRnZmnoi+rex6ah6jdIpb41fRS0vadmuw2eZ19/lb1QYPTyclzjGX2nCbDxMgOaT9W+qM+6 H3JeiyTV79mqrApMW1aagV7tM73JZaDbR7F0CjoLCdN7KPlJyWKf1gUeB7d7rNKRTRXJR506z2k
 IXPEU1lrK5mYipNaLdTAgOpLEsb/7v8hlUYUip0J9Na5GKh+yoPqTiUhSnX46j+uev++6l9Vew/ rNoFGWyN2BHqARbK4yKIyoUNY/Gu6pY2QlhWlBTGv9lpMfHPXf3C87hJeLcrpZZbd6krBxbfbnu EHdPPjrzhsnjIgA3gYkwA3DMHs4KGb9NLvCCCuADzMmSNnMDFgUi6ho454+9dkXKg15z/PMgXEM
 j5/G2wGC4e1WYhSt8xc8Pp8hj5Q18SQt2/ffsarlbR/KcvRLEONnRMVBbGeqm04Uc+NTd/i7
X-Proofpoint-ORIG-GUID: KqC3Dvo9A_oAJ67anaMR8-7q_vePQEHD
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=6846fec4 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=Ikd4Dj_1AAAA:8 a=SRrdq9N9AAAA:8 a=eE9lFezPz4Z6i3vAhmQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207

OK overall the logic looks good now I realise the mistake I made is that
the thp_vma_allowable_orders() check is for the vma_is_anonymous() case
only.

On Mon, Jun 09, 2025 at 02:31:46PM +0800, Baolin Wang wrote:
>
>
> On 2025/6/7 20:14, Lorenzo Stoakes wrote:
> > On Thu, Jun 05, 2025 at 04:00:59PM +0800, Baolin Wang wrote:
> > > The MADV_COLLAPSE will ignore the system-wide shmem THP sysfs settings, which
> > > means that even though we have disabled the shmem THP configuration, MADV_COLLAPSE
> > > will still attempt to collapse into a shmem THP. This violates the rule we have
> > > agreed upon: never means never.
> >
> > Ugh that we have separate shmem logic. And split between huge_memory.c and
> > shmem.c too :)) Again, not your fault, just a general moan about existing
> > stuff :P
> >
> > >
> > > Another rule for madvise, referring to David's suggestion: “allowing for collapsing
> > > in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
> >
> > Hm I'm not sure if this is enforced is it? I may have missed something here
> > however.
> >
> > >
> > > Then the current strategy is:
> > >
> > > For shmem, if none of always, madvise, within_size, and inherit have enabled
> > > PMD-sized THP, then MADV_COLLAPSE will be prohibited from collapsing PMD-sized THP.
> >
> > Again, is this just MADV_COLLAPSE? Surely this is a general change?
> >
> > We should be clear that we are not explicitly limiting ourselves to
> > MADV_COLLAPSE here.
> >
> > You shoudl clearly indicate that the MADV_COLLAPSE case DOESN'T set
> > TVA_ENFORCE_SYSFS and that's the key difference here.
>
> Sure.
>

Thanks!

> > > For tmpfs, if the mount option is set with the 'huge=never' parameter, then
> > > MADV_COLLAPSE will be prohibited from collapsing PMD-sized THP.
> > >
> > > Acked-by: Zi Yan <ziy@nvidia.com>
> > > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > ---
> > >   mm/huge_memory.c | 2 +-
> > >   mm/shmem.c       | 6 +++---
> > >   2 files changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > index d3e66136e41a..a8cfa37cae72 100644
> > > --- a/mm/huge_memory.c
> > > +++ b/mm/huge_memory.c
> > > @@ -166,7 +166,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
> > >   	 * own flags.
> > >   	 */
> > >   	if (!in_pf && shmem_file(vma->vm_file))
> > > -		return shmem_allowable_huge_orders(file_inode(vma->vm_file),
> > > +		return orders & shmem_allowable_huge_orders(file_inode(vma->vm_file),
> > >   						   vma, vma->vm_pgoff, 0,
> > >   						   !enforce_sysfs);
> >
> > Did you mean to do &&?
>
> No. It might be worth having a separate fix patch here, because the original
> logic is incorrect and needs to perform an '&' operation with ’orders‘.
>
> This change should be a general change.

Ah yeah, I did think that _perhaps_ it could be. I think it would make
sense to separate out into another patch albeit very small, just so we can
separate your further changes from the fix for this.

>
> > Also, is this achieving what you want to achieve? Is it necessary? The
> > changes in patch 1/2 enforce the global settings and before this code in
> > __thp_vma_allowable_orders():
> >
> > unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
> > 					 unsigned long vm_flags,
> > 					 unsigned long tva_flags,
> > 					 unsigned long orders)
> > {
> > 	... (no early exits) ...
> >
> > 	orders &= supported_orders;
> > 	if (!orders)
> > 		return 0;
> >
> > 	...
> > }
> >
> > So if orders == 0 due to the changes in thp_vma_allowable_orders(), which
> > is the only caller of __thp_vma_allowable_orders() then we _always_ exit
> > early here before we get to this shmem_allowable_huge_orders() code.
>
> Not for this case. Since shmem already supports mTHP, this is to check
> whether the 'orders' are enabled in the shmem mTHP configuration. For
> example, shmem mTHP might only enable 64K mTHP, which obviously does not
> allow PMD-sized THP to collapse.

Yeah sorry I get it now thp_vma_allowable_orders() does a
vma_is_anonymous() predicate. Doh! :P

God what a mess this is (not your fault, pre-existing obviously :P)

Yeah le sigh.

>
> > > diff --git a/mm/shmem.c b/mm/shmem.c
> > > index 4b42419ce6b2..9af45d4e27e6 100644
> > > --- a/mm/shmem.c
> > > +++ b/mm/shmem.c
> > > @@ -625,7 +625,7 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
> > >   		return 0;
> > >   	if (shmem_huge == SHMEM_HUGE_DENY)
> > >   		return 0;
> > > -	if (shmem_huge_force || shmem_huge == SHMEM_HUGE_FORCE)
> > > +	if (shmem_huge == SHMEM_HUGE_FORCE)
> > >   		return maybe_pmd_order;

OK I get it now, this means the !check sysfs doesn't just get
actioned... :)

> > >
> > >   	/*
> > > @@ -660,7 +660,7 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
> > >
> > >   		fallthrough;
> > >   	case SHMEM_HUGE_ADVISE:
> > > -		if (vm_flags & VM_HUGEPAGE)
> > > +		if (shmem_huge_force || (vm_flags & VM_HUGEPAGE))
> > >   			return maybe_pmd_order;
> > >   		fallthrough;
> > >   	default:
> > > @@ -1790,7 +1790,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
> > >   	/* Allow mTHP that will be fully within i_size. */
> > >   	mask |= shmem_get_orders_within_size(inode, within_size_orders, index, 0);
> > >
> > > -	if (vm_flags & VM_HUGEPAGE)
> > > +	if (shmem_huge_force || (vm_flags & VM_HUGEPAGE))
> > >   		mask |= READ_ONCE(huge_shmem_orders_madvise);
> >
> > I'm also not sure these are necessary:
> >
> > The only path that can set shmem_huge_force is __thp_vma_allowable_orders()
> > -> shmem_allowable_huge_orders() -> shmem_huge_global_enabled() and then
> > only if !(tva_flags & TVA_ENFORCE_SYSFS) and as stated above we already
> > cover off this case by early exiting __thp_vma_allowable_orders() if orders
> > == 0 as established in patch 1/2.
>
> Not ture. Shmem has its own separate mTHP sysfs setting, which is different
> from the mTHP sysfs setting for anonymous pages mentioned earlier. These
> checks are in the shmem file. You can check more for shmem mTHP in
> Documentation/admin-guide/mm/transhuge.rst :)

Ah yeah the issue is if (vma_is_anonymous())... doh!

The stack trace is correct though, this is the only place we do it:

~~

static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index,
					      loff_t write_end, bool shmem_huge_force,
					      struct vm_area_struct *vma,
					      unsigned long vm_flags)

Is called from shmem_getattr():

	if (shmem_huge_global_enabled(inode, 0, 0, false, NULL, 0))
		stat->blksize = HPAGE_PMD_SIZE;

Note that smem_huge_force == false here

And shmem_allowable_huge_orders():

unsigned long shmem_allowable_huge_orders(struct inode *inode,
				struct vm_area_struct *vma, pgoff_t index,
				loff_t write_end, bool shmem_huge_force)

	global_orders = shmem_huge_global_enabled(inode, index, write_end,
						  shmem_huge_force, vma, vm_flags);

Which forwards 'shmem_huge_force'.

In shmem_get_folow_gfp():

	orders = shmem_allowable_huge_orders(inode, vma, index, write_end, false);

Note that shmem_huge_force == false.

In __thp_vma_allowable_orders();

unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
					 unsigned long vm_flags,
					 unsigned long tva_flags,
					 unsigned long orders)
{
	...
	bool enforce_sysfs = tva_flags & TVA_ENFORCE_SYSFS;

	...

	if (!in_pf && shmem_file(vma->vm_file))
		return shmem_allowable_huge_orders(file_inode(vma->vm_file),
						   vma, vma->vm_pgoff, 0,
						   !enforce_sysfs);

So we set shmem_huge_force only if TVA_ENFORCE_SYSFS is not set in tva_flags passed to __thp_vma_allowable_orders()

The only caller of __thp_vma_allowable_orders() is thp_vma_allowable_orders().

~~

But yeah we do need to do shmem things... sorry my mistake.
