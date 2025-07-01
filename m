Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011054.outbound.protection.outlook.com [52.101.70.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C12B72601
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.54
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751347870; cv=fail; b=G2X3WZOQnEfmBUFOQCFSU3nLmsUM+k3BPMyeAfObM+QynWinJtSUtjlhI1+4uqyjikeKSocgK9bdRGSrj6XH8jG9nMTbLFi9+R+7pvyOJYilx8CknqEqUwVuBiXDqhzB7EGmqwXGgHhAYX9+JTOKmhfTITKt6iPJJi5MFtcjXX0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751347870; c=relaxed/simple;
	bh=g12ZkCJKxRKZ4adREyTJZQhpGqxNfyH5Lj7eEoWEuSI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qAoEQWzwvmsBKCJUXPdQe0O/McGTj7jNcgm7qCA9LcksYBrDF2T1t+6N8nbmwGWeONCBib9+nQjMg0+4gE7jQ0aAoK8Kf/iTMdujbf7iTBAM3BsrQCGtNYoKP9TAELXSgdrmB4f16yZCB1O4nT8waqQ6AbN5LA1/pItX/Nzg7HI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SzP0zxXF; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SzP0zxXF; arc=fail smtp.client-ip=52.101.70.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SzP0zxXF";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SzP0zxXF"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nJrgzhUIDbF2OSInEIXpWNAxJizqPM9yDjmZEI68XLjEiLFyIdmxCnoaLlUPeNWG2x1YjVADHnpPtSwdfNA4S0o3QKHQLsfSPqjMdqp1RcNy/FDkKpF3Kd+AJapnMgM78JfKiJOyuqGgcUxd89qbhUz8i70Pmq6iOKCGq7wDcsgirek8m0HYEdaYnt69YkeXu34/aoLo1Pzuyoz2Dnh24r3Px9tJzdEapO6ENsq2UrSq/1lSBFoiL4hk6YQ4pHJwH7UO5Th4H5HVXqtZGw4gqbFBdNw3RmInEi9tawL07Kr0r1BcQjkJ3LX2nmzaHM6vt2PMEMeGlHK0R2uhy+6imA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1z5FaTB3sGIApqnSWJz91GoC+T/jKDNc/AHv6D1hT2o=;
 b=TvBq7JzZW+fDHAuHHzvWYKF+FAvq13Z0XpEMnUCGYXuxdd13+EdGW7BVYaWKxgYt84f4zC6xmHZItlite+eiQc4tlZQyUJXG0YJE/E0pLasUpczzmK0lowxkAeKPHkpEXrB2TZDXaIKPore1LW/Lw/hBXDWZy9WJbhzAHE78d2SMkgML1OjwXFRL1L6hbePkGy77mKs4PJO79UzEQG6pdI4zqgJqER2hGe+AA6vCrDW942PFTLk4kuET3C5sO8X+Lcs1vXdB3G6M6ocSYtDCz8dLZUR4NjkbG7JG6L6fspKdFS3hvmgxGpxzb98v2USBhs6c3YEQq14dkAw7gFQDWA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1z5FaTB3sGIApqnSWJz91GoC+T/jKDNc/AHv6D1hT2o=;
 b=SzP0zxXFTdJL2LwNY57Vte+JZTws5FnllJpGxmU6ZgMLhSpurWH8G2V5YrSaQBu9iLqeDSwoZKvI0WJpftEwU6iiXYW0iw/UHO91mdnuHHEucLhAvW5EmGcE/6duv9vD6ke0bF7J5hkrMR02OjDJ6BY/yoIUADAHiBMpsGAyvVw=
Received: from AM0PR02CA0198.eurprd02.prod.outlook.com (2603:10a6:20b:28e::35)
 by VI0PR08MB10825.eurprd08.prod.outlook.com (2603:10a6:800:201::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Tue, 1 Jul
 2025 05:30:59 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::cb) by AM0PR02CA0198.outlook.office365.com
 (2603:10a6:20b:28e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.29 via Frontend Transport; Tue,
 1 Jul 2025 05:30:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 05:30:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPCDfO/Wd6LgSXNZJPMHhnaEueFOEc71Z9EKA7QzH/hc8JqvWpbK+2HASmzMqlcdpn+5RTI7JmFbnWTqrVrazzR9GjZyzCcsph4DC+LRnpTmECO+ueQ+p9HlPZb4eBMVqhwWNHxUF1Z8Gep7DslNYdfVHSodLMmHfL4OlHDDo3ZyVo+7uHBD+82P963/BUAbbyWBbVelmyTANIEyhOATWidp61Lzi6TWm1YgfIcFsdqiXEqXRcl/7yJsfL8/+rxXQKqBbsEJ99RbgY5jCFarJth0lscSj2bgeOmXnV707tugHNOdpvLdnvchzsZqmX3xBkv8OVRLxoZpDhbE8gERyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1z5FaTB3sGIApqnSWJz91GoC+T/jKDNc/AHv6D1hT2o=;
 b=ObY3QPFiksP5NGqDzhTrE+/W/D/S4E4rGocSt7/Ymy5YQEem2VmiIpuw/zFPX2E/a8ua+hFDu/VXAk2WrNBkxAaFf4mIAu5gW15ZfXKSCu0/9f5qbz+IhiGZKQP5L1vbdUGLkL4Ymp1eXphpkl+901/BiuyRtJsJEINuE0Iobj/kfio8geKmWan2H5rKcAPZn69t/yBI5/cTL9Nguh+l70PpctKrjCjpKKk6stPXta5wV23miUZ0+UU63lPPXr8ozN05zwbzuDCVerh3Rb6HDtk0CNbMJDqzURln4rdz2awE+PMQI6//GfEKABsZaAk2yA12Sht1mhlFCpjHJ1HYPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1z5FaTB3sGIApqnSWJz91GoC+T/jKDNc/AHv6D1hT2o=;
 b=SzP0zxXFTdJL2LwNY57Vte+JZTws5FnllJpGxmU6ZgMLhSpurWH8G2V5YrSaQBu9iLqeDSwoZKvI0WJpftEwU6iiXYW0iw/UHO91mdnuHHEucLhAvW5EmGcE/6duv9vD6ke0bF7J5hkrMR02OjDJ6BY/yoIUADAHiBMpsGAyvVw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB7111.eurprd08.prod.outlook.com (2603:10a6:20b:402::22)
 by AS8PR08MB8441.eurprd08.prod.outlook.com (2603:10a6:20b:569::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Tue, 1 Jul
 2025 05:30:25 +0000
Received: from AS8PR08MB7111.eurprd08.prod.outlook.com
 ([fe80::4ea7:7e71:7dd3:3b45]) by AS8PR08MB7111.eurprd08.prod.outlook.com
 ([fe80::4ea7:7e71:7dd3:3b45%2]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 05:30:25 +0000
Message-ID: <f09c2846-de76-4ca2-b05a-9e7633a24551@arm.com>
Date: Tue, 1 Jul 2025 11:00:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-4-dev.jain@arm.com>
 <0315c016-d707-42b9-8038-7a2d5e4387f6@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <0315c016-d707-42b9-8038-7a2d5e4387f6@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::19) To AS8PR08MB7111.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB7111:EE_|AS8PR08MB8441:EE_|AMS1EPF00000042:EE_|VI0PR08MB10825:EE_
X-MS-Office365-Filtering-Correlation-Id: c7cdc9b0-3052-4cf4-c591-08ddb8607558
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Z3V1THFCcDRoNFZVQlFmZUIydWZnbFd5cHRVREUrb3ZGM1cybEpTeEJySU5Z?=
 =?utf-8?B?ZklPZEkvSk5HVEdMYyt2cWtFeWZKL1FORmtnK3ZEYjZ0UWM1UGQrY01GbjMx?=
 =?utf-8?B?d1VkRXRGdElRSUNsS3ZVQ2NndXVZV3NWZW9ZTVNPVUU2SjBXbnNGREdwQTFr?=
 =?utf-8?B?aS91VXk4U3hQencrWTdUdXQvMVBFQWVDSmtzSS9FK010Y2xkWjVTMjdYVGtR?=
 =?utf-8?B?Skk0Yk1LdE5xZ21yWEVFYnA3cTFyK3N6ckl0VE1xd1FJUUppdWpEekVSSzlZ?=
 =?utf-8?B?WjFMd0tRV0U4Q2dnWU0vdyswZktBREZGRFN5c1BBTzhFd3FKcHBiZ1NNNHkr?=
 =?utf-8?B?UUxXTEo1Skx2Smh1eTVzbHhaZ1BORTB4VzNsVnBTYkN0L1k4azF0SlhWRjdH?=
 =?utf-8?B?TFZvMzFsa2ExSlJwektLd0U2Z2pCbFRBQmp1SjFPN0lHaTVyTGRZUGl3V3Rp?=
 =?utf-8?B?SkFBSllVMk5NU2RlV01WZjNxckx6Yk5tU3QrZWZUeno5MExzMElLeUxNYjhT?=
 =?utf-8?B?SXNYMmRtdllFTjRxUWU1VmZqV0dkT0s2UWw3U3MzVTJJREFlcUxtZmZ5WFNm?=
 =?utf-8?B?RVd5SXBPYTJUeXVtTDVSZzVZQzlXN2Z2ak1ZSmExTnhLU2xnSDVrSG1GdnRE?=
 =?utf-8?B?WDN0NEwvSDFXS1Y4eUMvbDhaVG5uSUNiL1JtMk5LV0RNWW5sV01YQWhQcEtl?=
 =?utf-8?B?OVdXR0xvRFJ2ZzUvWkhDNi9KKzYwTTlsL3BMNWREQlFYajR0dlNZN3QvU0RJ?=
 =?utf-8?B?TFdGTXFhWmhXL0xadTR2ZktienZQRjVLTy9PR0c3WkZib1JyNCsvWXg2Rmlv?=
 =?utf-8?B?YjB0R1MwVkYrMlc0SHJ0TmpHTlVndjNjdG93RHVyc0ZlSytKUVg0M0xGM0pk?=
 =?utf-8?B?QUszRGlJSXpieDJpdWdBZmFnWVpZV0JESGJNM3pTZHg1ajdYL2lBbDVNWFpI?=
 =?utf-8?B?WlJmV3EwS0tzLzFuV01QK0dVSkErcTNOSVFoOXoyOGxNMHhXK0M2aUhzMmtS?=
 =?utf-8?B?dVg0UzVpeFM5VWdqNEg0K20yT2pVaTdrblF1T1ZrZnQreDZiazFoZ0NFVVBi?=
 =?utf-8?B?UHNwMkZGWFowNWRWdFFnV3UzTnludlZCcVNNRGMyVGtyZUZNWGpTTHBSNGIx?=
 =?utf-8?B?Ui9tWTF4TTc4amlOK3QxRStTZGNiRUtVSExHUE8vbXgzc1VzZmZnN1RGaXJV?=
 =?utf-8?B?NnFCUlM3TGxpcmppVEZUK2huNmRVSVlWRlV0OVVUS1FSbEIrSFh6ZkVkenFh?=
 =?utf-8?B?RUZqOGtBaWdpSC9BQlE3NkJMandXbTVjeGdaZENhejRWaUJUdkNhMjVVeEFM?=
 =?utf-8?B?WU9hNUZSd2dQYkVLeGd0MXU3RFkrOXZ3NW4xWDQvdldqU012Rm43UHBQdWJB?=
 =?utf-8?B?cnlHdzdqWGF3aXowNUtRM0QraVBsajBDYURPdlYzaDZVamlxMWpMd0YvSmsz?=
 =?utf-8?B?N21FcHR5Ym4vQ1FFTThNRTNCS3liYk1YUEVvRDRLRFo3YXlOOHVUZEJDMGZD?=
 =?utf-8?B?UzdXTmNCZmF1dCtxQkJybkJ6SVMyN1REa2lmelhVaW1PV2VTZ21xVlJ4aUp2?=
 =?utf-8?B?TTlrZGpFWWNIWVdxTHVEK1N5YnVyRmFqTU1Rb2lsNTR2WGJNZzBFUnJtSTQ0?=
 =?utf-8?B?dnFwYW1MRytsZUtYelljR1pGcGxOU0oxQ3dNYjNMNzVoQ0lBMHJKdGpvYzc2?=
 =?utf-8?B?MUVreG0wWmovMXdVOTQ0UlpVTEJ4WGp6aFkyVXZZZGhEU3k2L0p1aWUxaHZk?=
 =?utf-8?B?QmlJZmllcnRkaENSL1R2QnFtQklObmhXZUE4R0pOaTFmM1d5LzlicmM4cmpp?=
 =?utf-8?B?aTgyZDg1UThDdDFGMW1zcnpBQUZSZU5SV3ZSOW5xam5BeHZlRFBqSjBDbEVt?=
 =?utf-8?B?UHc3SjROZ3l4clhsUTREdlBBUDlFTjM4WWtpRWkxQ0F3L2QyNUlsY1d4VXU1?=
 =?utf-8?Q?ljSAXsT50Zc=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7111.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8441
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	18100c01-20ab-447d-b36e-08ddb860615f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|7416014|14060799003|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFFxZ2RCYTVhUVlOUkpSYis0UUM0NnFlOW85R0ZDYWM4ckcvcVdUTjZFOG9M?=
 =?utf-8?B?L0FsWGwwNWlJRXhDN1cxZUV1OFpMTHd5VXlhYTNoUXdQUENhVVE3aW9GaWVL?=
 =?utf-8?B?ZUdKdldrQ29kSEIxbmNMbTRMUGwySWREdTkzMk9ITlJnNVhXQVp6OE9aOWxP?=
 =?utf-8?B?ZmZnQTNpZVZJQ1FpNk9pZW9jUytKVTVtaldjY2R2SW1PQ0Via2ZOK0dwdDFE?=
 =?utf-8?B?b0VSK3A4YXNVRlpkYVFGQ2RqdHR6cWF3NG5qa0JBa0NtTVdFWEZSY0dqcjEw?=
 =?utf-8?B?TStVV05zWnNBKytlRE9PTlV6d2xiZ1dyRW9KWmdRaHVVRThDM0YrRm9kQ2U4?=
 =?utf-8?B?L2hTRTl5Q1lYTzY0UzBCUUlnaHN2aFVYYkhGd0ZIbEw1NXBydUo3UWZXaEpO?=
 =?utf-8?B?Mm9FalhXanAvWkJsSnlOK0tBVHB3anZsbnlPN3pFZEcrRWs5T2c1bVVRSk5M?=
 =?utf-8?B?U0RKaTZsOWJLY3ZHMlBRMWprc0JRVThVVlM1WTZTZWN0MllYYk55MjlhNXJl?=
 =?utf-8?B?ZjdKcm9lckNOc2ZQY0FqR0xjdGh0ekJPeUVJN1BUZUZNMTlPZWlUUWFSMFhR?=
 =?utf-8?B?d0xrK2g0WmgvRkRXM2prZWFXWXR6dGxWNzNqRU9FUXdFS1hoS0hNMzVkSjcy?=
 =?utf-8?B?N2JWWDVMQjYrMGF2SzE3YTRkTmhqRG4rNEJreDRMV2pKV0E0ZE40VkxnWHRw?=
 =?utf-8?B?ZEVSdUh5RDRiNEZCNVpubE5wRmJDLzVoOWhxWnJVU1FBdnoxT1Z4RWZ2ZVcy?=
 =?utf-8?B?ZlRSVkZ3ZThyRUtHT1hvYlpsUG5NMzFxbERtMTFDckhkSDl2TXo3aEZCTVRk?=
 =?utf-8?B?dHJHNUhLK3BKSUZjdDE2S3ExdjVmdUxNOEtybGc4eTN4am41bWgrNE9tV2c4?=
 =?utf-8?B?WVpUaGllZjVQd25ITXdVR1ByZWk2SHd6Y1RsOFZ4STJWNC9pbGpzdTZNNFl6?=
 =?utf-8?B?U0o2ak5uL3B4RTZTc0lCQmRZV25mVkxMT3QwTUxqMk1RVkpaZTRoUHVEVS9W?=
 =?utf-8?B?SWw4ZndXR21NUHE0SVd4cWcxaFd2Rjg2RUVVdEhEak5udzk2MnZMS3U0VnI2?=
 =?utf-8?B?RVRVcEVuM3lubHlzVnRDblVHVUR1ZVhxbEE5SHJmOGdxRWhURlJjUDl0eGg3?=
 =?utf-8?B?ZnVZK0h4TCt4OEJtODZiaXVXN2VLWmd6bHdONm1ScFh0eE01R1p5ZkxqTDRw?=
 =?utf-8?B?ZlZqbWtWQkxWQlZzcXFsOVpqUXBNeXNQN2E5ZnQyeVZxTC9TRFVSVlJ0TUFo?=
 =?utf-8?B?akNRSk9VZlltWW9sYXU5ZS9kYlFqVUdkdksveGJDUGVzbWR4enF3L2pMeDI0?=
 =?utf-8?B?YVI2RmVyWHBCdi9Kbm5yYW5ad09yWGRkVE1oSGJ6Ky8xWGxteDlRbEVwU2M5?=
 =?utf-8?B?MEl2S3RLRy8rbU5LaFFoaTZoR3N5bGVDSkg5R2dkZXFZeEU2VFNBSmFuSXZp?=
 =?utf-8?B?OVg2bkhWblQ4d2l2VVlGT0NzRXdwclFwb1pGZEJWdUd3NGFpUjFJWncwYjBY?=
 =?utf-8?B?MUV4TnVYK2FvTVd6VmFUTlNVTW0xUzA4bDRocXVRbFFxVFA2QmhVMndCeVlW?=
 =?utf-8?B?OEtIa0YwMG1WWHVHVGZSdnFaRmtiOCtyclZIdGNNcXBaZVQyWmQ5NkpaaDZ5?=
 =?utf-8?B?T3M3Z0U3OW5ZaHlvUWVDK0lBWjlFL3JGWHhqVTZWWVd5cWhrK3pVZTlqcHVD?=
 =?utf-8?B?NEg5MzV1RWs2THNDbXZocE5GeXRrRTl6SHJEYitwSUs1OENPTm5LekRPa0lx?=
 =?utf-8?B?WEVUR0ZhTXVoNkNWNi85YkNZaHQxckI1Ky9QeHRUWFlYaTJZWEdROUNyQmlW?=
 =?utf-8?B?aGdIZ0VPOTB3dE9ONFUrbmNTUUlNWVNlZnd5SFNwaGtxcURqRnFUbkZOdVo3?=
 =?utf-8?B?aXNYVVhXWk1OUHMvc0NEUCtYajBSWklsM2hGMEpjbXB3c3U0YlRHTE50S0FW?=
 =?utf-8?B?aFBySlFXUUtzV0oxRW9yN1lOUUx2SjJDSkNDWDZwR21aeGUxaUdwbXcrNmc4?=
 =?utf-8?B?bmxxcDRSVzlaOW5mQjNPTVFKZnFjWGtUU2d5d1NGVXdCWVVCYXpncWcvcHBL?=
 =?utf-8?Q?ispls7?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(7416014)(14060799003)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 05:30:58.0494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cdc9b0-3052-4cf4-c591-08ddb8607558
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10825


On 30/06/25 6:22 pm, Lorenzo Stoakes wrote:
> On Sat, Jun 28, 2025 at 05:04:34PM +0530, Dev Jain wrote:
>> Use folio_pte_batch to batch process a large folio. Reuse the folio from
>> prot_numa case if possible.
>>
>> For all cases other than the PageAnonExclusive case, if the case holds true
>> for one pte in the batch, one can confirm that that case will hold true for
>> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
>> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty
>> and access bits across the batch, therefore batching across
>> pte_dirty(): this is correct since the dirty bit on the PTE really is
>> just an indication that the folio got written to, so even if the PTE is
>> not actually dirty (but one of the PTEs in the batch is), the wp-fault
>> optimization can be made.
>>
>> The crux now is how to batch around the PageAnonExclusive case; we must
>> check the corresponding condition for every single page. Therefore, from
>> the large folio batch, we process sub batches of ptes mapping pages with
>> the same PageAnonExclusive condition, and process that sub batch, then
>> determine and process the next sub batch, and so on. Note that this does
>> not cause any extra overhead; if suppose the size of the folio batch
>> is 512, then the sub batch processing in total will take 512 iterations,
>> which is the same as what we would have done before.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mprotect.c | 143 +++++++++++++++++++++++++++++++++++++++++---------
>>   1 file changed, 117 insertions(+), 26 deletions(-)
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 627b0d67cc4a..28c7ce7728ff 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -40,35 +40,47 @@
>>
>>   #include "internal.h"
>>
>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> -			     pte_t pte)
>> -{
>> -	struct page *page;
>> +enum tristate {
>> +	TRI_FALSE = 0,
>> +	TRI_TRUE = 1,
>> +	TRI_MAYBE = -1,
>> +};
> Yeah no, absolutely not, this is horrible, I don't want to see an arbitrary type
> like this added, to a random file, and I absolutely think this adds confusion
> and does not in any way help clarify things.
>
>> +/*
>> + * Returns enum tristate indicating whether the pte can be changed to writable.
>> + * If TRI_MAYBE is returned, then the folio is anonymous and the user must
>> + * additionally check PageAnonExclusive() for every page in the desired range.
>> + */
>> +static int maybe_change_pte_writable(struct vm_area_struct *vma,
>> +				     unsigned long addr, pte_t pte,
>> +				     struct folio *folio)
>> +{
>>   	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>> -		return false;
>> +		return TRI_FALSE;
>>
>>   	/* Don't touch entries that are not even readable. */
>>   	if (pte_protnone(pte))
>> -		return false;
>> +		return TRI_FALSE;
>>
>>   	/* Do we need write faults for softdirty tracking? */
>>   	if (pte_needs_soft_dirty_wp(vma, pte))
>> -		return false;
>> +		return TRI_FALSE;
>>
>>   	/* Do we need write faults for uffd-wp tracking? */
>>   	if (userfaultfd_pte_wp(vma, pte))
>> -		return false;
>> +		return TRI_FALSE;
>>
>>   	if (!(vma->vm_flags & VM_SHARED)) {
>>   		/*
>>   		 * Writable MAP_PRIVATE mapping: We can only special-case on
>>   		 * exclusive anonymous pages, because we know that our
>>   		 * write-fault handler similarly would map them writable without
>> -		 * any additional checks while holding the PT lock.
>> +		 * any additional checks while holding the PT lock. So if the
>> +		 * folio is not anonymous, we know we cannot change pte to
>> +		 * writable. If it is anonymous then the caller must further
>> +		 * check that the page is AnonExclusive().
>>   		 */
>> -		page = vm_normal_page(vma, addr, pte);
>> -		return page && PageAnon(page) && PageAnonExclusive(page);
>> +		return (!folio || folio_test_anon(folio)) ? TRI_MAYBE : TRI_FALSE;
>>   	}
>>
>>   	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>> @@ -80,15 +92,61 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   	 * FS was already notified and we can simply mark the PTE writable
>>   	 * just like the write-fault handler would do.
>>   	 */
>> -	return pte_dirty(pte);
>> +	return pte_dirty(pte) ? TRI_TRUE : TRI_FALSE;
>> +}
> Yeah not a fan of this at all.
>
> This is squashing all the logic into one place when we don't really need to.
>
> We can separate out the shared logic and just do something like:
>
> ////// Lorenzo's suggestion //////
>
> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> -			     pte_t pte)
> +static bool maybe_change_pte_writable(struct vm_area_struct *vma,
> +		pte_t pte)
>   {
> -	struct page *page;
> -
>   	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>   		return false;
>
> @@ -60,16 +58,14 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>   	if (userfaultfd_pte_wp(vma, pte))
>   		return false;
>
> -	if (!(vma->vm_flags & VM_SHARED)) {
> -		/*
> -		 * Writable MAP_PRIVATE mapping: We can only special-case on
> -		 * exclusive anonymous pages, because we know that our
> -		 * write-fault handler similarly would map them writable without
> -		 * any additional checks while holding the PT lock.
> -		 */
> -		page = vm_normal_page(vma, addr, pte);
> -		return page && PageAnon(page) && PageAnonExclusive(page);
> -	}
> +	return true;
> +}
> +
> +static bool can_change_shared_pte_writable(struct vm_area_struct *vma,
> +		pte_t pte)
> +{
> +	if (!maybe_change_pte_writable(vma, pte))
> +		return false;
>
>   	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>
> @@ -83,6 +79,33 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>   	return pte_dirty(pte);
>   }
>
> +static bool can_change_private_pte_writable(struct vm_area_struct *vma,
> +		unsigned long addr, pte_t pte)
> +{
> +	struct page *page;
> +
> +	if (!maybe_change_pte_writable(vma, pte))
> +		return false;
> +
> +	/*
> +	 * Writable MAP_PRIVATE mapping: We can only special-case on
> +	 * exclusive anonymous pages, because we know that our
> +	 * write-fault handler similarly would map them writable without
> +	 * any additional checks while holding the PT lock.
> +	 */
> +	page = vm_normal_page(vma, addr, pte);
> +	return page && PageAnon(page) && PageAnonExclusive(page);
> +}
> +
> +bool can_change_pte_writable(struct vm_area_struct *vma,
> +		unsigned long addr, pte_t pte)
> +{
> +	if (vma->vm_flags & VM_SHARED)
> +		return can_change_shared_pte_writable(vma, pte);
> +
> +	return can_change_private_pte_writable(vma, addr, pte);
> +}
> +
>
> ////// end of Lorenzo's suggestion //////
>
> You can obviously modify this to change other stuff like whether you feed back
> the PAE or not in private case for use in your code.
>
>> +
>> +/*
>> + * Returns the number of pages within the folio, starting from the page
>> + * indicated by pgidx and up to pgidx + max_nr, that have the same value of
>> + * PageAnonExclusive(). Must only be called for anonymous folios. Value of
>> + * PageAnonExclusive() is returned in *exclusive.
>> + */
>> +static int anon_exclusive_batch(struct folio *folio, int pgidx, int max_nr,
>> +				bool *exclusive)
> Let's generalise it to something like count_folio_fungible_pages()
>
> or maybe count_folio_batchable_pages()?
>
> Yes naming is hard... :P but right now it reads like this is returning a batch
> or doing something with a batch.
>
>> +{
>> +	struct page *page;
>> +	int nr = 1;
>> +
>> +	if (!folio) {
>> +		*exclusive = false;
>> +		return nr;
>> +	}
>> +
>> +	page = folio_page(folio, pgidx++);
>> +	*exclusive = PageAnonExclusive(page);
>> +	while (nr < max_nr) {
> The C programming language asks why you don't like using for :)
>
>> +		page = folio_page(folio, pgidx++);
>> +		if ((*exclusive) != PageAnonExclusive(page))
>> +			break;
>> +		nr++;
> This *exclusive stuff makes me want to cry :)
>
> Just set a local variable and hand it back at the end.
>
>> +	}
>> +
>> +	return nr;
>> +}
>> +
>> +bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> +			     pte_t pte)
>> +{
>> +	struct page *page;
>> +	int ret;
>> +
>> +	ret = maybe_change_pte_writable(vma, addr, pte, NULL);
>> +	if (ret == TRI_MAYBE) {
>> +		page = vm_normal_page(vma, addr, pte);
>> +		ret = page && PageAnon(page) && PageAnonExclusive(page);
>> +	}
>> +
>> +	return ret;
>>   }
> See above comments on this stuff.
>
>>   static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
>> -		pte_t *ptep, pte_t pte, int max_nr_ptes)
>> +		pte_t *ptep, pte_t pte, int max_nr_ptes, fpb_t switch_off_flags)
> This last parameter is pretty horrible. It's a negative mask so now you're
> passing 'ignore soft dirty' to the function meaning 'don't ignore it'. This is
> just planting land mines.
>
> Obviously David's flag changes will also alter all this.
>
> Just add a boolean re: soft dirty.
>
>>   {
>> -	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +	fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +
>> +	flags &= ~switch_off_flags;
>>
>> -	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>> +	if (!folio || !folio_test_large(folio))
>>   		return 1;
> Why remove this last check?

Forgot to drop this check also in the last patch.

>
>>   	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>> @@ -154,7 +212,8 @@ static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct *vma
>>   	}
>>
>>   skip_batch:
>> -	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, max_nr_ptes);
>> +	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
>> +					   max_nr_ptes, 0);
> See above about flag param. If you change to boolean, please prefix this with
> e.g. /* set_soft_dirty= */ true or whatever the flag ends up being :)

On Ryan's suggestion I'll just change this to pass the fpb_flags.

>
>>   out:
>>   	*foliop = folio;
>>   	return nr_ptes;
>> @@ -191,7 +250,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   		if (pte_present(oldpte)) {
>>   			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>>   			struct folio *folio = NULL;
>> -			pte_t ptent;
>> +			int sub_nr_ptes, pgidx = 0;
>> +			pte_t ptent, newpte;
>> +			bool sub_set_write;
>> +			int set_write;
>>
>>   			/*
>>   			 * Avoid trapping faults against the zero or KSM
>> @@ -206,6 +268,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   					continue;
>>   			}
>>
>> +			if (!folio)
>> +				folio = vm_normal_folio(vma, addr, oldpte);
>> +
>> +			nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
>> +							   max_nr_ptes, FPB_IGNORE_SOFT_DIRTY);
> Don't we only care about S/D if pte_needs_soft_dirty_wp()?

That's what the function will do, it will switch off FPB_IGNORE_SOFT_DIRTY
from the mask, meaning that folio_pte_batch will not ignore S/D. Yeah
that switch_off_flags thing is really horrible : )

>
>>   			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>   			ptent = pte_modify(oldpte, newprot);
>>
>> @@ -227,15 +294,39 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * example, if a PTE is already dirty and no other
>>   			 * COW or special handling is required.
>>   			 */
>> -			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>> -			    !pte_write(ptent) &&
>> -			    can_change_pte_writable(vma, addr, ptent))
>> -				ptent = pte_mkwrite(ptent, vma);
>> -
>> -			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>> -			if (pte_needs_flush(oldpte, ptent))
>> -				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>> -			pages++;
>> +			set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>> +				    !pte_write(ptent);
>> +			if (set_write)
>> +				set_write = maybe_change_pte_writable(vma, addr, ptent, folio);
>> +
>> +			while (nr_ptes) {
>> +				if (set_write == TRI_MAYBE) {
>> +					sub_nr_ptes = anon_exclusive_batch(folio,
>> +						pgidx, nr_ptes, &sub_set_write);
>> +				} else {
>> +					sub_nr_ptes = nr_ptes;
>> +					sub_set_write = (set_write == TRI_TRUE);
>> +				}
>> +
>> +				if (sub_set_write)
>> +					newpte = pte_mkwrite(ptent, vma);
>> +				else
>> +					newpte = ptent;
>> +
>> +				modify_prot_commit_ptes(vma, addr, pte, oldpte,
>> +							newpte, sub_nr_ptes);
>> +				if (pte_needs_flush(oldpte, newpte))
>> +					tlb_flush_pte_range(tlb, addr,
>> +						sub_nr_ptes * PAGE_SIZE);
>> +
>> +				addr += sub_nr_ptes * PAGE_SIZE;
>> +				pte += sub_nr_ptes;
>> +				oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
>> +				ptent = pte_advance_pfn(ptent, sub_nr_ptes);
>> +				nr_ptes -= sub_nr_ptes;
>> +				pages += sub_nr_ptes;
>> +				pgidx += sub_nr_ptes;
>> +			}
> I hate hate hate having this loop here, let's abstract this please.
>
> I mean I think we can just use mprotect_folio_pte_batch() no? It's not
> abstracting much here, and we can just do all this handling there. Maybe have to
> pass in a bunch more params, but it saves us having to do all this.
>
> Alternatively, we could add a new wrapper function, but yeah definitely not
> this.
>
> Also the C programming language asks... etc etc. ;)
>
> Overall since you always end up processing folio_nr_pages(folio) you can just
> have the batch function or a wrapper return this and do updates as necessary
> here on that basis, and leave the 'sub' batching to that function.

If time permits could you take a look at the corresponding patch in v3? That was
my original implementation, does that look any cleaner?

>
>
>>   		} else if (is_swap_pte(oldpte)) {
>>   			swp_entry_t entry = pte_to_swp_entry(oldpte);
>>   			pte_t newpte;
>> --
>> 2.30.2
>>
