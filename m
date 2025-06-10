Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA87B2951A8;
	Tue, 10 Jun 2025 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564269; cv=fail; b=Eg8v6/2S/3KRJvLDd2nRPFyrbzUY/ZAkXdcYwq+5PQSoAEFeATlhcfusNAAiNZlIWvZUJEOBwvEGgMTCVIgIBvPW/+zH8TSK0Hdoekw8tzeevTNUEqRzMwX05d8HfywEQgH2bPUYULYrwsIEYyh34mq0ymS1lhZCuuARLB7/svA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564269; c=relaxed/simple;
	bh=fgKvSC3viiTEPYgYE3JdLzqeP6T/txKHHqT9i9me+5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q92K6u89MxBUC/nChBGwPGGvXkqE5uRlSEaaErj8AwI1Ao0WS6i8C+M1J6kneQVeONHkhL3sS4ijgPXB6hYzcPOU+ekGsRgSMv+Dga6QFq/AHkrF+GUaVVurbhy933pJwg7yHpfmxbjMOlNiUqWy8WG/iEcVytqJNYBQELZ603M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hDoHC2TL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GfkcKiXG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hDoHC2TL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GfkcKiXG"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADBdv7000585;
	Tue, 10 Jun 2025 14:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=fgKvSC3viiTEPYgYE3JdLzqeP6T/txKHHqT9i9me+5Q=; b=
	hDoHC2TLOF1La3d7OswucD0Yfa8jdwu1aOmR7SxKacPL/JsCcCjhEwv280l2TYVr
	SfOX6xD5uORdeEs8ccwHUDdVZfz4LUoGZENZnbEg5C7l/3WdJNvsKC29zWstvf3o
	Z2witRkXtAy/ROo92JCFt573yenCouszXri1/w41kY81tnRmysN6vanT1wloadv3
	lBscdLAg+bN9w0+dTlEofs47p9tLI7HulZNcPAoV34aFsybSr3HrdpxqnclyuPGS
	Jvaz2CckPeGDWdSWLRrHuoeMfgTdtN+/k55dHO0spsYzGesPQxBvmlLCdmVIuPON
	pfBdpPYT4JnVbH3AwfnCtQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbecadx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 14:03:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADZdYI021300;
	Tue, 10 Jun 2025 14:03:33 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2082.outbound.protection.outlook.com [40.107.212.82])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv9g7x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 14:03:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVpJx5WEpniNtWKsS/KmIofO+8CXiH6JJmnjsLsdqHX4BggknI+/+5TxLpukCxBPWnKHop20LOAfPbIDMgWD5v6LXzH/uw54ZNE49dWBlLdFHHiUgxERd96hHEXB2ejjqDV/QCCXb5Qn0VqvS0PgeBPnrvXpwMHZrFXSFLfmz2gYbIyHlYreiwuANUDPxl/0qTrN8lwdX4PZAnYb4PT5euQSIlxNnC+EVXtMk01zS26Rn5BNUSP7i8qCorKuFWHtGFHwIlgF/ka/h1QWgG4qAmJ0dGVm0wiagvjFgVpo6lX2+lX+w+WAgrslEWtL6OU+cBpe980suevibAydM61oGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgKvSC3viiTEPYgYE3JdLzqeP6T/txKHHqT9i9me+5Q=;
 b=Xf07DeA6kUo7SWSpNJJUitC9Ba4KYimtWz961HCDURLljG9zeRW8mIdusjbijHMZLT7yvN28JlaYmdg2ULuReiWw85xAWfrWjdjK0Jlwrv766kfAqiMYsYPQX92f0QT178wOvd/jN3kFnffAWL+6A3u9h2C44RdS4fqU6EG7sV6NqMjx6Qz8Nl3+4b1O6BVO+G+yIF/A6b8cnMmBboyQvDBMDZRZ7AKhCCTwM07nBskg/74abodP93sikP1uLh2bG8vX6lP/pR53bR5XxBrx9lffvcD66rlPSvMuJ+GhYwEHfKoT4hPLC2VRzWVH0T5vXbgkFNI8Q5c/p3Fwze6CLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgKvSC3viiTEPYgYE3JdLzqeP6T/txKHHqT9i9me+5Q=;
 b=GfkcKiXGToj3UmB7EOKk0sCv+5lTCeZQKw2+uboE03fGPk8NTIWx5D0xGHtUMmyLrqMVLn6P7hv73RWJWslHF0Vu9HoiAVkRgDGo5AlgAltVVN6YhU5IPr98p0YFFUoop7bbhPj4TbfHLzCKQ7BVVXc+FWUwZxVsu9zLxwCSXLQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO1PR10MB4483.namprd10.prod.outlook.com (2603:10b6:303:98::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.28; Tue, 10 Jun
 2025 14:03:26 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 14:03:26 +0000
Date: Tue, 10 Jun 2025 15:03:24 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Usama Arif <usamaarif642@gmail.com>, david@redhat.com,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        hughd@google.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com,
        Juan Yescas <jyescas@google.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Message-ID: <dc32ec54-88c5-4171-a2d0-389e3ab428c3@lucifer.local>
References: <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
 <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
 <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
 <0a746461-16f3-4cfb-b1a0-5146c808e354@lucifer.local>
 <B2F966F0-8F5F-43AB-BA33-BD3E65504F4F@nvidia.com>
 <61da7d25-f115-4be3-a09f-7696efe7f0ec@lucifer.local>
 <AA2C4D68-B1DC-48A6-A807-56516067B9C7@nvidia.com>
 <f980e652-8e2a-41da-af9b-39fdd439fefc@lucifer.local>
 <2338896F-7F86-4F5A-A3CC-D14459B8F227@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2338896F-7F86-4F5A-A3CC-D14459B8F227@nvidia.com>
X-ClientProxiedBy: LO4P265CA0256.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO1PR10MB4483:EE_
X-MS-Office365-Filtering-Correlation-Id: d43da126-431a-46ef-18bc-08dda8279200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEM3WmpxT05PK2YzQ3k5TExZSHhCRUI4V2dhK0JXc0dER1RkaDMwZ0pQMEh3?=
 =?utf-8?B?QmNzRkF0NC93b0lKY3pGV1M2aWtMRWdRRjNHZU9tQUxvR0NHa1ErUHYydTNq?=
 =?utf-8?B?NzJOTnF5bWNCTHdGMXdSa3lkQ0FJL3lONllBREZ4cTlVays5RHFIcTlqV21F?=
 =?utf-8?B?MVVFNHRSMmxRR21NdEFNTVc0NFNtMldHNG0zOHN6Ky9tcTdoc1Y5bGsxejhu?=
 =?utf-8?B?amMxdUFSd3ZJWXlrVTlWWnh5VDV1dVZ0UGhGVE1YSnUyMW83TjQvTjFtTUVP?=
 =?utf-8?B?Qy85eGVlTUJDWk52OVd4Ni90TkpLbkU0R0IyNGxvUXpUVW1VVHYvVEROaity?=
 =?utf-8?B?Z2t0c01pWFVyUFBhRDBMMlNGZWRvK2xZZ1gwdVR0MS8xNmVWWmh1ZFVYUHlw?=
 =?utf-8?B?czNCVnZITU9JMDZ3RTBtSHZCRGJha0tKVk5tL25KOFkwVUVIdTVkczZQSjdo?=
 =?utf-8?B?d1l3NGhYTVAvbTRNOGFTWUorcWViRVdqMmJidnBXY1J6MUxsQk9hQjlPK3NQ?=
 =?utf-8?B?Q1dndEszbzU2M3BJeW0rZ3lkTGhnUGJFUS9EbFJVWFhpOGk2aHZ3REVUdTUz?=
 =?utf-8?B?T2ZZQkJGakFsd0Z6YnF5bFRwQk5FZmtiNDVxdWx0anRvb0hyNXdYSWdqZDhT?=
 =?utf-8?B?Y3BlSWUrUE16N1BZb2YrdVgxVW1kL3NSR0ZQNk5yM3g4MHRwdEMxSE1PTmlu?=
 =?utf-8?B?aTFNbTg0QmlqdlEwalBNWURTdU1uS3RFNWxLdUl4dE9zZVRiUStDVCtBY3k4?=
 =?utf-8?B?a1d6QTltYjJYMzQyb0lJVGpmbUdhY2wwdnFRSzh2emhxdTBrSDFmL0lWYmtV?=
 =?utf-8?B?Y2lKZmhycnFXVkx1UDhSU2EwNGtKTTVDYlJ2bkp6M1JxUXcwZnZBTG4vS1Bw?=
 =?utf-8?B?QlRzVXFJWUZINmRmWDVyQUxoY2VGZVVST1hVZlRmR0Q4NFkvalJFRERVTklX?=
 =?utf-8?B?STR0azJMNDNzY0dPaDdIMUIvT3dZZk9vaFduY0tWVXpRR3lLWTlicTZQZlFH?=
 =?utf-8?B?UG1ZM2NvTHVYZi9EWHhOWFhVdS9ZTVhFZ0ozTithalZCeFk3YlJiVkZPN0sw?=
 =?utf-8?B?MDIxTU00M0ZXOW5BTnVXeCs5TGRBaDdWRWtGemxiTDhMY1JQNHVRN0ozYktZ?=
 =?utf-8?B?TmpRbS8xei9zQ0xTeXkyd2ZJVzgvSllYc015VHQ1ekYzQ3FHWGlVeVozUWZG?=
 =?utf-8?B?SzFKb0J3L0UyRjZlNEtjcCtPaE94V1NGL0JOZ2E0TWNZVndKM0dUU3ZhcXhq?=
 =?utf-8?B?cHdKakswZnY4ckxmRlNxY0t5UkxlQVRiZGcrRWdHei9ESDdLSWFHdmcvYU84?=
 =?utf-8?B?Zzc3Qy8xNW9XZE9QTEM4U1JjQXNkSE5oV1lIWm9qVWxZLzBaSjgyaXorN29j?=
 =?utf-8?B?QVdaS3NDK1RkWmxWMHYxQ2xUUlZ5UFdqOElXcG94WnRyaFVKRlJlQ2hQT0FJ?=
 =?utf-8?B?aEE4SGszeC9XbkRRWG5uQ2hEUjNwRi9QaUh1MnZCSWNnd2l5b1JWeEl5V0x3?=
 =?utf-8?B?RmN6ejFqS0FJZXhkdWpXOThvcTZWNURDQ0czL1RoeEVFQldOQk0zWHpSM2p3?=
 =?utf-8?B?SUdCTUJJMEZoRjB6RXQybXh3VTkyWFlIS25QQU1oMlRjWnFGdnBST3pWQWhL?=
 =?utf-8?B?UTJLT0YwUXZXbm9PdUd1OGNGUU45djIxb0pNSnBSdVppcEN4QkV4aFpaRHRx?=
 =?utf-8?B?endFVitVdDNvdkVzUzNHWXJtV1Fkd0VYN3hPK1Z1TTMxUG1TbXVTZ2c3aVQ0?=
 =?utf-8?B?Y216S09RcjZEUlZpOUJlS3RGYzROMU5WWmROc1hMU3U0Y2NvTjI2WFhRVVc4?=
 =?utf-8?B?QTY1c1ZqVGc2bHhFeW04Ti9QYW10eXBnOGFISmQyemJhYXJIMkZGdGJlejhz?=
 =?utf-8?B?TnBIS2FBcTdOUFJUUXNJSGxjaHlQczl4bEFjdkNLbjAzZVV5NW1ZMUp4cCt3?=
 =?utf-8?Q?QvTPq/K60dE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHNYK2tnU2l4OW9GbkFWbWtZaHdRV1N2RDdoQUhab1ZOUXhUMDZvSEhYTldh?=
 =?utf-8?B?RVg5cFROMWdyWGFEOWI0VzRQdStjTlVvQ3BCd2xFdzJDbktOVDBOUjNXTlNX?=
 =?utf-8?B?Y1NKZWJVbDZ0U1dFVERLQmZ5QmJBY1I0MzRsaFdjeWZiVzhUTE9DTFV2Sjh4?=
 =?utf-8?B?cDV1cEtkUHI5UGppa0lMWEN3dlNMT2JWNDNlQXc3Mis2UGlvZDRiY0QzSlFY?=
 =?utf-8?B?M3dNOUhqVWhHNi9idHQweGxRdFpyOGRqaDdiNlhTbTN2WVBqbzZHeHlnSWg3?=
 =?utf-8?B?cTdNL1ZtWDVEV2U4YzVnUCtRWnNJOFB3SGF0Y29qTjg4Nk9NdndISklvZmhC?=
 =?utf-8?B?YmpZOUlBOTcyZTlOTStaSlNHZFBJL25BdTllUUFPdkVSb2Z1RU44NEpsY3Ft?=
 =?utf-8?B?RzRVMzJSa1dxODJQRXVZaU5hRkRCbjBHZnNwZHpmczNJZ1IvblhtZlpTMXpp?=
 =?utf-8?B?TVpEYWtLQ2hmN1JMa3dSeENYaVZBbVd4V0gybG84YWpvSkNnSHcrbGlnbERF?=
 =?utf-8?B?Q08zSklMbDl6UjBGSTlhc0pDN1BSUC9kdzAvbkZqNzRydnZrYmdUeHFsMzMy?=
 =?utf-8?B?RXlpR1ZIeTB2VXQwTUJKQjhtZHB5WVJxV3l2N09aVyswalpCNStDRWVPTDll?=
 =?utf-8?B?T2ZzUzZ3TXpnM3VrTVpNWnBCZFFkNmZoTnlWdEM2ODAwUlNVeFZrY0lHTnBW?=
 =?utf-8?B?Z1FKb0k4eUk4MGhBTnM1bncwOVJPRXY3SC9Ba2pSMkpxOFVkaEY0d2Z0Q1By?=
 =?utf-8?B?MDdZZCtnNmFja0lBaG1adWw5b0xQcGdiMWNheWdyNnUvTnloZi9rUk42c3c1?=
 =?utf-8?B?eHp0QjJGY2ZkWEVxdVExWmdleFg4Z0k2RVFkTDBuV2VoWHVYLzY2Y0N5aUdt?=
 =?utf-8?B?T2NIMWtBREt6THhkUWowN096ZEx6ZzkzZTlWVGp6MHhwNnhKeGhWOW9mU0Fi?=
 =?utf-8?B?RjV3dWFhQm4wNXExWnY2KzVzZGF6Z0tCdDR3V0tWaUc2QXdVY29IUXpUSU90?=
 =?utf-8?B?RzFwS25oWHozVzA1YXJhVE5BRTY4VGlHSDJydVRLeFMreFlWRktIMWJqT2t2?=
 =?utf-8?B?eTZza042VDJkZVRZZDlNNk5nYSs1THBuMW50a1B6Sk92U2VNRmFpL0I4UktP?=
 =?utf-8?B?TzIwb3lzOTNKbG1FL1NQVFQ5SjFEYkVpZDk0cDVPb2dNQ0VySmpZSUJiS3VT?=
 =?utf-8?B?MElCbkc2eXR3anR5cDVEZEpKZ29CTXpVLy9hV25VeE4vWmNiNGh4QnNEUVh2?=
 =?utf-8?B?V3JhdUlFcW5QZFQ5c1dpMkIwTlQzT2lSV25RQnVuTTNMQUxibGdqOENBaksv?=
 =?utf-8?B?VCtQRzV1WGZDQWtOaUFYbHlTVVVMNXI5OHA1RjhxV05INDAzeC8rVExWZ0tQ?=
 =?utf-8?B?ZWhxcndmVXBxalpkOGxYNndHZ1JDcElCQ245endScWxWUEJPVmttQytad3kr?=
 =?utf-8?B?UGZnVC9iUjhWclcvbkNaakE2RGhNakJqVW5Qb0Jydmx0bExtR2x5cjdYcnY0?=
 =?utf-8?B?VGQwK3dXbFoxZ2l6YStRUUh5ZmZReVZpSTdWd1pYMk9FZTVnK1VnWnliWEN6?=
 =?utf-8?B?TEtiZldRSnZ6UlhoanBoS0Jnc0czZnVvdnloQWV5T09yWm0rZ3ZUTTVEa1l6?=
 =?utf-8?B?SjBzZ0pKdTNTa2xNbTlIZVhKZFpSQzM2aFM4c3B5Z0J5MU9WSzdEaUluYXJw?=
 =?utf-8?B?aC9HQkRXVEZ1OWtkc0JabjY1MW5kZHNhZXlnN0wwR1Fhc3kvcWx1L1AvQ2cw?=
 =?utf-8?B?bTBTYnZzOTVObDRUREFQeTZFWDY4SHVrTk9sZUZPL3dRcEdJeDZGU0FmRnkw?=
 =?utf-8?B?TGs0ZHhsTlo2eDBlVExCNGZtLy9SOFBCL3VjTk1WOVNFOFgvUWx3R2xwaGZl?=
 =?utf-8?B?SWV4blJvM3hoK2xVV2w4UlN6TWFKbXNDMHdhT2xsS0NQZDZkTWxOZ2tEelJV?=
 =?utf-8?B?YUJiVkJGQUlMZWhKNWNmKzVGbENpQTJSalNDTXZBNG9JTElRTFAvZ0ZxRDZJ?=
 =?utf-8?B?QjN4NW5wN21wT2dBeEtZeTRUdjQyWTBWY3ZwYzgxTStkeTJaOE5JUHlpb2cw?=
 =?utf-8?B?dW9JQnFQbk5GdjNRMmNLOHl0WlQ5b0hwQVhHclJweUFxRmxYZXlIRWYweTJt?=
 =?utf-8?B?V0pEa2hLMXF3YzVIeWM0MzAzdUxkbEs2c09CdnFHK0x1cGxvdlQ3clViTWRm?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D7NT36Ee9O0/YnWDdkBPOcykAaJ5g85WfmFf0u+MLd7dDvHa0rjWtVp5LLS0gX/88lmPUguNqLf5n0Hlm0l/nkAch4RC/l2BY84/WlHwLPlriaBf/tZOcoU5UX1IUZU2E/h97XxqDrBaveUq2sotwpbZYimvn42mKQIj0c4fr+T0qluEf5lQae0zEnVM4UE/mG4xCgA3paf/ZmC+i88OfnHlICADlSzhxrki2Sf+HXNY7ftSPmJhFRKPbYjGdYsZT+caHOXRkby22tYlhXBzK7Fh5PrjHHR6Td2bW+NFPaoN+jToVvTpYbmHZzCxmisT/pD49WDfNmCSj+WL9KeKjZz8CCrOH9EaKQCuXC6rBMKUYxh0LdwCaast6jLk13NtpvSq7M/SOm2Y9RJy5AUAA8vbj975ls0dlMerlZ4fOktkAbidsbjJR7YANUYAJgQm4pZ2L2k8S5uYAsUsXdgU0VOOPE9iOmblsGwNXyoRSM4BMeMsjo4wI7e47YJFMg2YhisRzLX/4dqxL8tqMHJmnNLme4qvoBaeapj+DyvBVsGQuKmx1L4QzhcGxhbc/9qtMQLuV5xFk00q1WwEwnhTf856WxtWbbXeK8xiff/Vo3s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d43da126-431a-46ef-18bc-08dda8279200
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 14:03:26.4024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ng0O8Q+LPhv2n8VCjlwNth9tDWRBPUiUgqELum4RzkKgJPMZsSieKXJ9/HI2v3ajA8id3lMqRyrEDGsz119E5lp1/QJ10FwReCN9xv6nUD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4483
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100111
X-Proofpoint-GUID: pBHqFbtrp7bcY3cpEy2fDIjifImlfVJO
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=68483b37 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=8isCIqPwncoCgboVlSQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: pBHqFbtrp7bcY3cpEy2fDIjifImlfVJO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExMSBTYWx0ZWRfXwC9RLRunWeVu xvwMKcklH5Jk0QFrAmkhx8qISmhtqKcBgaexqSEDQCW/pwRgmiupn2wvcp88J5sfr/RHLBZSUME WcKnd+iLWIcxp03ouqkWFdZN1rrPp85vaYgXR/0aX2hloQa7aV612/gEBzL/RmankKwAr8GQowV
 BUJ9YcIv3pWBUFLQssKCPO+eoSk8IwS38KQQyK9Ki7+qy45jqW2hdBe4fIrcPP3xeAXTb65k++a PCxpN66sypv07WMA80KSVscmnAyICMKJaqmrAdceDzX1PEckhofM6dBqzSxTJ6C8ZSvgtq47UGt oPSJEKb1+WnHfKVr1a1suedH1o063wQHtcLq3kla3DXr7uVv1vI++5T+7A6Eua20ZEXOIiAEfxC
 UAsbfKQnrIVCreAtFsc7NjVk2MPxeX79hEu/e5sy5WF8x1Hwx3WHjldBGk/uw1albIZdtt16

On Mon, Jun 09, 2025 at 03:49:52PM -0400, Zi Yan wrote:
[snip]
> > I really think a hard cap, expressed in KB/MB, on pageblock size is the way to
> > go (but overrideable for people crazy enough to truly want 512 MB pages - and
> > who cannot then complain about watermarks).
>
> I agree. Basically, I am thinking:
> 1) use something like 2MB as default pageblock size for all arch (the value can
> be set differently if some arch wants a different pageblock size due to other reasons), this can be done by modifying PAGE_BLOCK_MAX_ORDER’s default
> value;

I don't think we can set this using CONFIG_PAGE_BLOCK_MAX_ORDER.

Because the 'order' will be a different size depending on page size obviously.

So I'm not sure how this would achieve what we want?

It seems to me we should have CONFIG_PAGE_BLOCK_MAX_SIZE_MB or something like
this, and we take min(page_size << CONFIG_PAGE_BLOCK_MAX_ORDER,
CONFIG_PAGE_BLOCK_MAX_SIZE_MB << 20) as the size.

>
> 2) make pageblock_order a boot time parameter, so that user who wants
> 512MB pages can still get it by changing pageblock order at boot time.
>

Again, I don't think order is the right choice here, though having it boot time
configurable (perhaps overriding the default config there) seems sensible.

> WDYT?

>
> >
> >>
> >> Often, user just ask for an impossible combination: they
> >> want to use all free memory, because they paid for it, and they
> >> want THPs, because they want max performance. When PMD THP is
> >> small like 2MB, the “unusable” free memory is not that noticeable,
> >> but when PMD THP is as large as 512MB, user just cannot unsee it. :)
> >
> > Well, users asking for crazy things then being surprised when they get them
> > is nothing new :P
> >
> >>
> >>
> >> Best Regards,
> >> Yan, Zi
> >
> > Thanks for your input!
> >
> > Cheers, Lorenzo
>
>
> Best Regards,
> Yan, Zi
