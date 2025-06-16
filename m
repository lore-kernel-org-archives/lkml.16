Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF6F285CAA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077903; cv=fail; b=AE4KYJcX7TTC9vkh58uPAUGbDpoAcKT9yANipn5/0c5x+YJ71T5qGLW2JMYbTeYXKRAWZuThMp+eRBB5XEhbj0rpKzkOBu8IUMZBJgG05WNvlF0shLKAMQGe/zrbeDnUH/Mc5wGDfzTvq8ez9A6918kVfMp2qSjsBr37VRIXcAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077903; c=relaxed/simple;
	bh=QTMLqtSWI9hvc1JPAJw1NNfZKV+x1ZGnBJfDGUHeVIw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qjB/D23dhM3iUTv9MmxwolVs6ng1kuDlKJ9TGZZAmXsSPVsh+yi5Q9NDHyrWOBfOoR7APbCKaUfX2qHeRb50A8Zctvo5+SVdAQMLDiUGd/yIqId45hmsFJqlofQJW/eYhE8cGktjc32F+NmgJtmZKnlVrApMoB34Fvirkrnjpq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RN3YfiDS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rlNeHffB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RN3YfiDS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rlNeHffB"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G7ffEU026456;
	Mon, 16 Jun 2025 12:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=DxViKcHeXqZir9bQ9MV4WHO/olRvivKXrs50KiWKSkY=; b=
	RN3YfiDS9rj0z4wGD+/uxAr/hOy8xuiviE3FzQjOsqud5w6PnJsu/JCaRx2z0cwM
	c7hz2ryYkO1fmV28gxwv8PxYrL3uIh/gaNtTPYqrjiWYcuQQ70cYb8mjNqK4cngG
	A1JWZdAkFfTEqmvtWX22iX3MOtYYGaneUz2I1E3+wynQOOSfQoNuLjyy8QBksJDP
	AXeX0OCW8Ph+8YexC68T41+FyBkkrBVFG4deCpOaRnlUlzemaHRSJPdkD9ZbyVJW
	zK0f81yl4QpfRdpCKAPZ9cPUyvmWpQh7Bm+nl5QP707/o5dEmHperlarbWZnld32
	fWlPcok461Cpe1gHwEfiUA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4jf3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 12:44:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GBHuBl036277;
	Mon, 16 Jun 2025 12:44:57 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yheburc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 12:44:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYxxTboxUO6wvsOf2d+EA6k2Bm2qe51f32VUmpFPLTPzCHtB0M1/Q0wbCzR7C/RjkwvveMi5652YCT/jOvPttRtz0NyH1MRGVXFGQGp89xBCmMQbvnj9lq1iN7aBEQJIdt/Li39928IXdN6/sgUR+Q+RSxqjKc+v2CQa6HcG4vyyuBCAqZq9s2d2kSKCs3DkTTgQFMcFV/n8K/omwfGWtm2cBGUqu2X/RtQqrCC93Gp5psZ0Jb2xIBmbefN+x8ru3eJcCJUm0rqvYmRj5Qwov81eY8U8b+IIEombKBX2PMC5UHj3Kk4FA1Blkf0d/Dm7/gM0kTWx5mctSR5PyrslpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxViKcHeXqZir9bQ9MV4WHO/olRvivKXrs50KiWKSkY=;
 b=Qem1s7qnYTDV65LYM8mL6VsVaCbvRfUxaBtoY+thm1x0CyKsRgULcuStMLx2kexivHY1u7Z1DjWK8z62bE4s16enzu86oR/rF9N1gRk6aihhizit+rIfPEmSwR3lNCfOYkP76sI7YYASZaTUo5fTsXDDBPyXgX+yojzvvCh774ow1udplPOPs8AeA9vItOPJXWYvZRW8h7EwqpiR63D+fTgAyoucdrHls9Yp07CZVN+eY45nxSvrujXtDuDQe7KA6jIcQzERWpGNswSy5f++qMxf2wnADJE5IhBSa2U+g95z2jHJkvpfURHyzj3CL21MyC4DBMeDh7iIoHyeT7y4VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxViKcHeXqZir9bQ9MV4WHO/olRvivKXrs50KiWKSkY=;
 b=rlNeHffBgqgc6WRkibVE7zqQmZaPBGkqer3CLL8UOQLOIrgNUPUn5rzESk0YsXkGbEWO27lk3q3/bl3yNY2RbY6W8Lu4CiMNdDdMVmEnB9BSlUmW4YhWuT+ldfsK2JtPRO6y/DzCKJoWNavB7Jzk/9ewJlTXNyxhKk/usBGjn94=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by BN0PR10MB4824.namprd10.prod.outlook.com (2603:10b6:408:12f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 12:44:55 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 12:44:55 +0000
Message-ID: <b4699098-afd5-4a1a-aa7f-15949b0d10f7@oracle.com>
Date: Mon, 16 Jun 2025 18:14:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nvmem: core: fix memory leak in nvmem_register() on
 error path
To: srini@kernel.org, linux-kernel@vger.kernel.org
Cc: darren.kenny@oracle.com
References: <20250615135212.1356469-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250615135212.1356469-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|BN0PR10MB4824:EE_
X-MS-Office365-Filtering-Correlation-Id: b9a94b22-6058-4022-fc91-08ddacd39829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N21uTFVrNVBmOEdLRjlFTmcxRGo4QndoUWNzRHFISzZyTmZyKzV0eG9sUlRi?=
 =?utf-8?B?MktOa1hFTXM5clBTd3p0aXhoejQ5dGJFRytKSkx1N3lqZ3RwWC9GemdRU3hm?=
 =?utf-8?B?SytFMnlWaUo0aXRoZE53NDNzVjRaT2xsRU9LRFlEUGZmTnVxRjZsdTNxYkoy?=
 =?utf-8?B?QVQrenRuOFVUVlVXQWl1eXdqeHdKZjRlandBcHdoUkhRWVlTcWh2d3ZhQW5X?=
 =?utf-8?B?Z3g3aW1kZzZ1cVliN21oWlhTUzl1R3VRZEZ5OEdVc0hvcnNBOU9iZXNNM2N2?=
 =?utf-8?B?eVVDS0tMWXV1OENJWDltRFVja0R3bEJVUUI3MGYvYTlIa0Mvc1dUaTRyRWxv?=
 =?utf-8?B?eXNNMCt6eHVnc2lsZVpPSVAwdXJoNkszQ2F2QXVZSnJuQlpQSWF1VnMwSjhE?=
 =?utf-8?B?b2I0SXV6ZDRZTW5IdTZQZlVhTXlHNnpCWjVWK0Z0bk1NK1VyVkJZYUNBWFpC?=
 =?utf-8?B?V0Q3SjVIQUFtcWp6UFBpMkpseC9Xd2pXcFVrQU1EYUswQWRTdjl4cDFIZTVJ?=
 =?utf-8?B?bkZ6b1ZTRDhnN0Q5WUwxQjcxOG03Q1M0SFZxdTVXRjV5cjdZT1U2aEVEc21w?=
 =?utf-8?B?OGtHTGRmSmc0YVhHTjhUWHozV2JNMmcwdDF1V0h2RnJjYkVmSXE3VzVSQzJj?=
 =?utf-8?B?Si9zbDd4Wmc1R3c0Z1hFZ3QwMXZ5NG9ZRjlVTEJ4RXlEOWNleUNjK0hKTVA4?=
 =?utf-8?B?WDdTa0I3NUg0bStCR2FsWVRxNEkrRTZmcFN1T0cwZTE5eWdUMXpCNVZDbEx6?=
 =?utf-8?B?V0JVNHgzZUIxcHNBNTU4aWtHNGdnWGk1dkFiYVl3MDhGK2kyRjNYRU1vRHk4?=
 =?utf-8?B?Y1E3SVY2QVhEanlIbU12YXJQWkxob1BRQm1Wa3ZFeHh6MjNQNWY4RFltczRD?=
 =?utf-8?B?S3oyZ1V3NzlRQk11UE92dTIvdHMwM0t6aGF0Z0t0OWhnWEpHMWJpaFdGSjBJ?=
 =?utf-8?B?SGd5MXhDakRTbGVyK2t0NFRjT3hyTTRGK2tPVFZZUW1DbnMzcDBraysvc0pX?=
 =?utf-8?B?QzlPcFVwNjVmem1ERmhlV1pIQmNjTStvdGtFbEViaWU3YmdXMzV1bkd0ZVlw?=
 =?utf-8?B?SjFWVlN3M2xSdmhqN01sVUYxQUdRa0Z2MFBiYkxkMlFnREM2UEZtYU5rdVFX?=
 =?utf-8?B?L1pPNTZhRlhlWWgra3Y3cVNUSjl5Zi9ueVFObEw0NnpLeXh4Y1dXQndDU2R5?=
 =?utf-8?B?Nkh4YVdadDQ0VnB1UW5LbUhTallJbkZWdkozcXFobU9KRXpMRVNGNjdYOGR1?=
 =?utf-8?B?cXFNdmR3L25mbzZUMWZzZk4ybkFzR1czMjcvVGlKSTgydG5SL1BVZEhKK1Ux?=
 =?utf-8?B?SHd5bXVlcktpaFZkcDZ0ZGdJd0ZoZmlEblMzRjdkTWIzeWgwWEZ5REJxVTVI?=
 =?utf-8?B?TEU4Mk5iTHJtNVVFeW55NjQ0UTdiWUhRYU5rM1ptbXNEVVU2Z0VPUVJINkZ1?=
 =?utf-8?B?M2JXViszb01ReCsxNy9RalVuMVRWMjV6ZnkzQ05RRjBFUnZnQ0w1N2g2ZmY4?=
 =?utf-8?B?d1NLYmxRMlJYMm9Gb0xyTUtFdFd3enQrWDg1ZjRJTEtTYm9WNWVDc000NWsr?=
 =?utf-8?B?Nk5qaGxIcUJSOGhaR3kyYUk1SG00ajJyeVJIalV4cFk4MTBpenRPOHVmR1Nw?=
 =?utf-8?B?dzNjaGZxd0c1cnptVXRpS2pFUUhoYzZuWWRTaDU0VURaZGl3d0VRRDJ6Q3Fp?=
 =?utf-8?B?bFpUUWxxeW5QNk5nMXJ2Kzdzdm5vRlZtUmtCcXFmdG9qV1BHQVhTU1dyU0kw?=
 =?utf-8?B?RzRDT2s3S3dNMVRvS0xsWnByeDA4REozZVJnSnlVZEF5ZkkybkJVaXVZQlQ5?=
 =?utf-8?B?YTFLZGVldzRNRUxxYXFuY21hQXFyZUV4eXpVQXdDQjdXb3k0Sm0vbC82bHJ3?=
 =?utf-8?B?MUFvZFZjYU5kWTc2Q00ydHNacWxFZVcwWEM2UjBSWEE5eGtJeSt5M1ZOdWxy?=
 =?utf-8?Q?1EfWBbJCR8w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHNUSDUrb1VqVm5YSEROZTRXN2dVWWRzaGtrWWE2ODFDbDlxbXVEWmtvT1ow?=
 =?utf-8?B?TmFRM3JZSDBOYWM4WDFkdzRXbzFnZW5ROHhOMHlqbWR1cEdVbW14SVlaV2Ri?=
 =?utf-8?B?WTNGYXk2SVlNNkt5TEJZVXlhL2ljejFMRXRleFAyRGZqUDFMRXR0blpPZ2Fv?=
 =?utf-8?B?cjI0SEo5NXNHbEdQcGV1ZUh4bjRvc1d0VE55NEdoWHRaVHlTUHhhM05wc29h?=
 =?utf-8?B?OFFGV0s3RFU0UDkxWnVlNERwcHJod3UvVjVOTXhYQklQSkNnN2JhSzRxL3Z6?=
 =?utf-8?B?bE9rU3JmTWlyNG1nNzRQeEZzQkZBNE5SNW5FSDhhRzBqZVY5UUNWS1hUN1Br?=
 =?utf-8?B?QVg0ejdNdDhEY0dXRDRCaFBIbzVVM3JmVlRtV2tyckRUOEJMV0RtcVpST0Yw?=
 =?utf-8?B?Qy9WQXYwS3RDSWszUllPZnk0eW93VXBwK1ExMm1xZXdnZUpWZkowMEpBb05Y?=
 =?utf-8?B?cGJZbXFsTStQbXpGV3J1UXhTMm1jWEZKLytFVVI2SmtYUFZWRnJaaGlEZkFE?=
 =?utf-8?B?NXNBYWNkYXd5Z0crN05BVFdsa1ZEaUJVbENORnp4RWY0cmlpVVJYbmszS3U0?=
 =?utf-8?B?R2x4UE9xZk12aDY5UmUrZTdhN1pBcU1NbHZPY2ZsTGJ0VlFSUFp1RXAxUWl5?=
 =?utf-8?B?dkM5NFZyRzZadGd2MElKblZRbzhQMWNsN1c2d3M4V0dSRExmWE9wN2lBWEFj?=
 =?utf-8?B?MFA5SHZCK0JGcnBmd0NOM0poYXRxaDBnR3h2MFhjaFNlQVJXV2pJRFNDbUdN?=
 =?utf-8?B?dzh5bFBkdkRjemROVTlGTCswMlhuY284Qzlrd1p4SkF1YllPWXgyTzhPejJ3?=
 =?utf-8?B?dFBWTUlBeFdtUGVUV1JiYnMwQ2t3UWc1MHcwZWplV25nVnl6Y05OaXBxcnFT?=
 =?utf-8?B?a05LZzlzL0oweGpBcjc0bmVPcU11ZDBoMlpYdzhhVXE1WElGV0VzdWpNZ01H?=
 =?utf-8?B?aUg3WEVKUkVFUE4rdkx6MjU2V0JzZ2d6cUFZUGR3dGpyUE1OdExHeXZpZmpH?=
 =?utf-8?B?SUpqa1UyZHV3bVQzdGQ0K3NlN2x6NzJ3cjlOZFZ2UlhtdHhBUlpFdTV5UmZz?=
 =?utf-8?B?Lzlzb2U3YWd0dTJISmxrMXU4ME5YaGFLRWdlVE1nZk0rYkhZZFZlOWR4OEZo?=
 =?utf-8?B?c2FpandieGRZbzQ2TG1MUCtJVEhzQ2ZVL21ic1dFM3FwUmVXMEFXZlhjamlP?=
 =?utf-8?B?ZTBCMy8yc24ydFNOM0FOaTcrYStqbWpiY0t6QmtNd2g0VmZVQWEyeUZWbjVo?=
 =?utf-8?B?L2RxVFNFQ2FMS1d6Z0dXVFFHbVpTR3RkYzRtYVZjWjUxYmZQeFAxMFdKYTNM?=
 =?utf-8?B?STVTZDBqU2VSUVpOYUlzdFhaOE1aZzAwS2NoUXZpa1RIRWp6c05VNXB3dFR3?=
 =?utf-8?B?eUcxQW5jRHQ0Y1RYY0ozYkFMNmtPbEMwTFhkR1dVbkxmb0wvakh6TitOU3J3?=
 =?utf-8?B?bjhiQ3BkZVV6OFgwWG9Cbi9IZkxGd0ZwRi9VUGdaSDM3c0JHY1duRHFDeTBH?=
 =?utf-8?B?bmd6TkZRcjFSSjQ2emVEUmtnRllBNjhFalNpYmwrVlliUmJvWkc0SzY4ajI2?=
 =?utf-8?B?ZmFyb1VUSzE5K3Q5R00wS055cUlmSmJjajhsQTd5SHcwKy9OYU9qU3l1dXla?=
 =?utf-8?B?dDJGakhCSXVCWmo5bWFyVHBiYnZKN2x1K2Nkdk9Rbk5ndmhjU3ptSnBYMDJo?=
 =?utf-8?B?UDVhRHg4WUNWVFh6eWF3dmcwL3RoV3ptcCs2NWJhMVZ5M3JhL1dLMllCZGxq?=
 =?utf-8?B?WCsvRWxDSmdIaXF1elBRWjJQbkVLT1o5bjdCMmpGVVNOU21nSzFmTFNzcHEy?=
 =?utf-8?B?aDhTRjBTZjl2eWVtMEx5cVloU3hKZXpWVVJVRHJGRnBBZVNXU0VLRlk0bndi?=
 =?utf-8?B?cG4zSWpIL0o0bkFWOCtwVHJMN3lySnR2c1N1akVrZSs5am1qa0Y1eWFkVC9O?=
 =?utf-8?B?UGVqdGFwanlVNjUyZWc3ZHIwcTJLZ2FnU2Q2UllERjF4cmMxOTVLb3lWaGVS?=
 =?utf-8?B?NXVKaUkyeFR6aGtLRSswTUt6UTNKUU4rT3FaeElWQ0YyRTFHaGpseFJiVG5w?=
 =?utf-8?B?N2htTW1MQnBJRlkyalphT09mLzZUOEM4MTZFZWVHVmZzWFlHOEpqVnMybG05?=
 =?utf-8?B?VE1yU0RDazVSZldXODE2ZUJiMVJUY05PcVdGWXZJblRoTUtVcXAwNnZSRVpB?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qcOCL6/rXtlbnZBI5pCchqCuzqql1LDo5hc0dl0L+7P35ZPfMNK3hZs7hdzUqcKXC9aiOCYmorn1gqVS9jqs50eQIdUCtSURZdQN2u8ceaYWfeuIR3oxQGA8SvpnM+x7nY3hPi17sP8btpDAu5OQzQBmydLcAU/Ad/CqOblhFXtQEmmFOSTkqWXSog7s6RQC9jByN7b2NcOqLMGCJF6dAPYd2lVxfHwY3rKGtUkmtH7G93qQ6/yfsamks0AZqC8KF7D+cawLeHBoB8pgIuTLl96mFb22JkbfmD/INHkLkv5fM8RXLVe3urvZDJQk4Q+yL9bJR0sqMtP0zfUT11Bp2NzjRV4WeKHBLlnwAxL8d6gakxGTm/+N5G+g5vgp3pEeSxoKEqD35qy9ZqpD2f/nvUMk0NPWLZobo6NhI3CkvB6WPecNZSTwc/R3Aj3aJN4855J3vCN/LlPczDnBwDVZCAnJAseJJbIkjpPPmppFeJQnImTF3tkHWIfRBY9+5g4fAShhAYFIE1KhHN86gtvCLgVEEpTTZd7te7Pd9q9H6VbbZw4ZAvTxQDqg6/AUDqDFiy3Ga1p2zG3AvSZJ6Qy/GaFc56/Bw50doCPwotKWYf4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a94b22-6058-4022-fc91-08ddacd39829
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 12:44:55.0963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWa8nquCP7qY11Dy8WELsFtCxa88zcMjGeAM8Y6MTyJMq1NUgzVF3oZXQSSBDd8hUIhjvvyz8m1Gexnt5ZvdpeGVSxlnDPE/8X9l3HtaJCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4824
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160079
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3OSBTYWx0ZWRfXwCImZViFieja eGMHzOSslG0WehhFzmaITGAfREv0v/m/F2lcwRr7q/9uD4DSsYDVt6qkjLFE8xTt2rlL5lbxw+a gHRR6Vqm4rW7BQHexSmmByCt18sbUG3mPUaodnKO1pYUyMVP3BPvI9bhz7vcXCqyVPvsTedmL9h
 vaRu0PlGMXbc8XSEhnqECqXVnp5XX3hmaIXYQputaaReX8Rzshjomwz7PMFomf+O7TGXj7gHWJO 6sLfqsJMT9LKJNv1S4zP+8+dSnCFt8s9p8WNgTNISJc3YUP6X/uqORHiTfcGGMhenUW6VFPJMmU BIYoOvK36wACneDHSVdTt4I7lYRSAbmRKXqh/74E/xZgjsw0c9GReI/YzmJTO2bLcUX8wMMLJXb
 CgkPrfAeiaWKr8bDcfSlqsNclPvGzlDzeqzsPLTWA8RYuW3bL2UnVC62S0BqSqFtz800SQFg
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=685011ca b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=f8Zoy6t-s-KBBlPHaOwA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: 5DSvR4f6GfkJfWrAbjjh1_4I5P4qPfpn
X-Proofpoint-ORIG-GUID: 5DSvR4f6GfkJfWrAbjjh1_4I5P4qPfpn



On 15-06-2025 19:22, Alok Tiwari wrote:
> Ensure that the allocated nvmem structure is freed if device
> registration return error code.
> The missing kfree() caused a memory leak when nvmem_register()
> exited via err_put_device label.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>   drivers/nvmem/core.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index fd2a9698d1c9..3203524ad49f 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -1044,6 +1044,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   		nvmem_sysfs_remove_compat(nvmem, config);
>   err_put_device:
>   	put_device(&nvmem->dev);
> +	kfree(nvmem);
>   
>   	return ERR_PTR(rval);
>   }

Please ignore this patch. it is not required.
nvmem_release already handles the cleanup properly.

Thanks,
Alok
