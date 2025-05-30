Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A691C2334
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599505; cv=fail; b=g70wSOS4/vbyjB4AopQau3DYEBc2difcFXkiNMWc++NA9p7SRTgY/Ux9cdKg5vtIFtIlvAMV2TBrrs3PJgZRRGDmsegoA/Ksr2/G3HA2ATjVwVpKj98adpdWauadz9SnernP/crAPik6/wvtLs+dzHZ5JmV2LugtPFBBDqutunY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599505; c=relaxed/simple;
	bh=jhqyyvTHyK2ci/+1suE6dPKfzV/pHYJGeWjuP/WX+eY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i2pf+MF3KNAlUiJSNeF2vEAIT9UVubxRs1UoWz9itqoIFJB32cWLLenXT4+gp8ROSfTG8oYDu554MqWchsc69CxG0ffKk5j63Y0D3J8kaEsd4AYyGw2bB8u4ceSnQ8kfJGFnq7YtO9BDMwJQc5nuqRXoJ0velzFcclQF6gCPBYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=A6mEiXbD; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="A6mEiXbD"
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U8iAJW014257;
	Fri, 30 May 2025 03:04:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2021-q4;
	 bh=3W9mxU9L/FZldFZ4/TqKqyX3vAb3fJjTVS+cQRHc8dY=; b=A6mEiXbDBpD2
	RUzhHPxK5zgWEtVSspQMJIvcPCq7NysVLXubAurUShE/IlM9hWq4XceexZxxH3ld
	LtlRbEFNu9FJ4cEy1yb+xZNbH253wsCwKiidkNI4wyZqIIvfi3HxEgBr68O+vMe+
	2rYPBYW43KAiDK3KbxPfeSXZrH6WgieHskgD1u/vLttTvjv603s7nbk9pX/yI9IG
	cWgdq8+7Gxtio5NYCqXUwqEXthgyyNJU0WMevStMnTW8eaqaJSHBUBLmegRJMSUN
	j2AqGikthCIko2YELNJxsZzsUne48bGPeFxc+Uq7BDQgdQGq92FCflY1tfNm50sb
	c2L559iPfA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 46y7qhrv04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 03:04:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dk4jq8RoySGqwdi7M0GqdHTiRYAyONvA+HvRhx6HJCdql37V7HniOV5qTrgTRaX9DQvs8zfa9JBIieCUMkmECYW4+i3FuCOV5S/djNfNrzMTzVhzF5YyrTYdeq2akugT7kArn8ujSRgV0k8xaF8UUXaNoaXYH8+H/RdqpT6qWqRbZglx5uWFiJsWH2QR707895veNFM8AKP25QyIwrpBXI11Ic3uk1Na+U+kTD54P8A94XnzK30p4BkjiwvpH7HefuYo84mAWYuO1y83ro3Ne6vIXCqrropcT+ie+WBDLEjC+vf8OHPJwPWqOIt2X0wkDgzCOXBFs0UMLfqlCp/T/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3W9mxU9L/FZldFZ4/TqKqyX3vAb3fJjTVS+cQRHc8dY=;
 b=TS/TCNhsxjd/yWWa5oUQtShC69FVZPcv4Pv37gx+IlmoQCNQuYNtjV3obfXsTpD47xAvfAX7cir12V333Rli2HOUZ7cCrsoxboNxJ4Zbc0UC53ZF87QHR7rkriY4SdLkX9O0hpr9iqOnfQTFtdFvxjgSlW5Dgwga0Y2EtlsikT7taNF4hFVGWWwjpyyPHOCgiFBjJk7s4qpjLuCrIDLRhc/m1QjZKGw782D9AmVdAcSjDbJeNcI4GhK1Lyuit52YEgDg5Ow9fnYxHplbG4GVw/GFfflh9whAOwTtThri3OfmL9PutbnoKvIEfxZi8e7sXnUX76flTaE4UtegcB/Cug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by MN0PR15MB5369.namprd15.prod.outlook.com (2603:10b6:208:374::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 10:04:46 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0%7]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 10:04:45 +0000
Message-ID: <83df73b7-afcc-4315-8d39-c5905a56ec40@meta.com>
Date: Fri, 30 May 2025 06:04:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 0/5] sched: Try and address some recent-ish
 regressions
To: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com
Cc: linux-kernel@vger.kernel.org
References: <20250520094538.086709102@infradead.org>
 <20250528195944.GB19261@noisy.programming.kicks-ass.net>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <20250528195944.GB19261@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0412.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::27) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|MN0PR15MB5369:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6fdf07-debb-4476-f857-08dd9f6167a5
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFByM3E4Ylc2K0wrOVBMM093b3VVNEl4cTN3cEFZVGpaM2lNWExHajhLOTR4?=
 =?utf-8?B?Z1YvdXhCK0dhTG1jZ2VXRGVFSHJxNHJzbVdZN0MrS0pCQkRIZExYZU13VFZh?=
 =?utf-8?B?b1ZESFVoaHhhWElLL0xjcW9lZTJCT3YycFJPdEtvaTUzSDV3L2FPYktaU2c3?=
 =?utf-8?B?TUtROXFGckNnR0h3OXIzZWdjZ2NUUHYrVG4yR3Z4WTU3TUsvM2trVjE5Z1Vk?=
 =?utf-8?B?dEhkM2svdnAzdWppa2MvUEh3NElWRkRaa1ozRVcrRWJVYkRzLy9KT2c1T20x?=
 =?utf-8?B?alBwK1N1TEROWTlPNVJNQzVwYzA3WEJSZTNENUhHdW1TbERDRnIxRWY1NFk1?=
 =?utf-8?B?RC9RRjhiQUhXQk1rU0FUNUQ3Uy85V1EzaTZnMzVFZWVrNUsvTldKbHFmSExK?=
 =?utf-8?B?RTBROVZUamVHR21Qd1drZE9YbTlWbllKVG00cjI3bkVLbUpqLzBTT2pvQUZt?=
 =?utf-8?B?OUMvNFhIWFlmSlQxVzI0UTVubEdUcUVBenN1WGlqVFlhbjNRYzJBWitQdXh4?=
 =?utf-8?B?dEdtUWdORmNkdzFwcnAreG1ONkVYaktndUFlM2lReVZGSExITk9HNGhhTWtu?=
 =?utf-8?B?WUlabGZOSHJHZzBLVUh2NmppMkNQRmRrdkswL0lQN1BVbEtnd2tWVit6eWxG?=
 =?utf-8?B?VG9VNFd2SGd6Y0hJOXo3dDUvTS9Jc2hLREdCeFpWZ2dDa2NTbkNsbHMybng2?=
 =?utf-8?B?bDhqKzRKM3N0ZDhBWVBJTW84RGdIM2lKb2x4Mjk1bDJKQkQraTBxWnB4Qlg5?=
 =?utf-8?B?K1ZJandwaWhSd2JYdy9vWkxZVFkvQzlTNmdETy9UVzVXU3hxVjVvejY2a2Vm?=
 =?utf-8?B?dXFZOU9ieDFibXlWOU9iMGFGZVFUcXBIV0Q5SVFMM1hvZVZCREpxTGxUYWhq?=
 =?utf-8?B?NFFSRDJzUElsd1hwZDRsUVJLS1RCeE1qalhRYzFIbzZvcVBwSjU4Y3JNMlRr?=
 =?utf-8?B?amRNTzV2RmdyRTVicmRHL3ZVM3h1ZWZ3S01tamd4cm5BcU52a3hUUmtidGpU?=
 =?utf-8?B?dy9IbFF4T2djanMyMVdMMWhaUWprekM4clFVRm1IWTVxNGRROWhQWTRBMklz?=
 =?utf-8?B?VjNxRW9WKzFZR2ZnczRqMHQvUTNlZEZacnRoR0kxZlpyeXllMFNPYm96VDdR?=
 =?utf-8?B?eUd0b0FHSmFSVUVGRFoyRnZBei9IazhmOFVzSUk4SGhhQlhGTW5qRUNrb3pE?=
 =?utf-8?B?Q1NNZTBuZC9QbTZVcUpCVU92ZDFzckxGUXJVMTdTcGNUbVVpdEtzMFd2T2NB?=
 =?utf-8?B?akdJNVU3Y0pBQWtsK0x5WitzMGhOU0xvek10MDZKSVA4dGtCYWJkVGsycUw2?=
 =?utf-8?B?cUlOcUhLL1RIODQ0a2pLRkgyNXVtZHdZMStUSWdlREQ4Wk4yMXFjalFtZ0dJ?=
 =?utf-8?B?VVY3NHFleDFCQVljaXNtSzJmcHhBNTlmaW91bVN3ZGlyTGZhTG43VkNTTnpk?=
 =?utf-8?B?eEhwOFhZeTJWMHZGNnlpb0tYYVBWWTRqT1Fhak9VdGhEa1Baa1FnRUFZbXY3?=
 =?utf-8?B?T1hhT0tvQzd6T3dGU0YvcWZlTDVRTnJYdnhKaU1qZlJRbFJ4WGNiaEw5UFd4?=
 =?utf-8?B?azN1aHRRcFhXYWc0dzZ6b3pmOU5RZ0ZERTMyWTczUFpCMTFpQTBha2t4MlNu?=
 =?utf-8?B?SWZKWWFSSFhXTkg3SDVCczhmRzVrNjJJVHFyWFY3d3o5L3Uvc0tCS0Y4Nlpw?=
 =?utf-8?B?WTZwTmQwemVDS1VTdjU2WmxDd0ZQUFE0ZGhFM25VVm5NdkdxUXkzN1BMZS9N?=
 =?utf-8?B?ZmxiYjhJVEUxaWhKUDFNUVl1WWFUMTFsMk1aS0tDbXNseUxZanQvYzExMVhq?=
 =?utf-8?B?MlV2Qm5GQWNaV0hRS09IZUlJb2NoZVZWZWo4QTUxNDBQckNkR2pLVHNzRjBT?=
 =?utf-8?B?Qk5rdDdtWUtnanFHdi9NbEJ5bUlibE01bHVKTUhYWjlsOUcwOThEQVFFL09v?=
 =?utf-8?Q?lqUDbu0+uec=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHhSanh4STgwRWliOFU3VFNkV1NQb2Zlajh4WmYxVHJRL0FWSS9JazVSVkN0?=
 =?utf-8?B?SjlwSFZpWTVjSndtczBJcm4rRHRTRmwwUU1DcStuR3BnOWx1VW1PODFHSGJK?=
 =?utf-8?B?dHJteGNDa3Y4VjhpRm85VHFUemZQMHUvYXBvTGo5WUFzTGVLZzkvdWM1eEFZ?=
 =?utf-8?B?MStYaGdZcmZOYzJqWk9xbzIyZHFFcUdlSkVVWWFxZXlzR0NCY2sweHJqTUtU?=
 =?utf-8?B?SFhpNEJ2VFdueXFVcEc5c2RsRzVMZTRNTy94NXVtZmZkUFBJcVdsMFNOOUZj?=
 =?utf-8?B?ZlZKRk82Q3I3S0ovQVJvTVFZV0tTSTdVNkVQbEhFWHhJVmQ2TkdUV0ZPMlln?=
 =?utf-8?B?QWt2aWliZ0RkSnYyVEFlWjdLdjhoc3A4UlNEQXZETm9aRnQ1L1E0ZE10QUMw?=
 =?utf-8?B?MW13UXBNakhtMXZOWXllOUhpeGtXZkV1UlhjZUMvc0FzU3p5KytWS3Z1RTVV?=
 =?utf-8?B?a0VzakdUVm1zejdvYmpQbS9UWWNpdU8zZmlLTXBNU0MyNmxuWHI3dFFzdVRy?=
 =?utf-8?B?eGRyaGJVTkh6cmtXdUZXaVI4aDBaNG04U2RlUVFML0RObjdEdW1ONElzd3p6?=
 =?utf-8?B?QVNPQkhKajlOOFI4RHJtSlBIZU1DUDhDOHhCQUNDT2x2YkpqU1pvYUVWTm42?=
 =?utf-8?B?MW9xSDFseHdJc2ZKc2FLTEZQK1c3eUIxdmdlRElYekhaa1lhQlNoN0RSb05n?=
 =?utf-8?B?ZEU5RzUzVGhqdExkUEowREU2cGVwUHFFOEtxdWNLMkRkR2txNnhRS1dvMVhQ?=
 =?utf-8?B?T3R0c2NxdUdmZVRxNzBEQmp3RzFMODVxQ2J6VkZiWDY1eUFzdHNmQ1d3MGlH?=
 =?utf-8?B?S1hHbmgybFcrMVhRUWVwUlAwZ3VwdmJPb28rZVcxR2NuZWphM21VdHBpNXdN?=
 =?utf-8?B?dWZsa282bE5uVk5namQzb0JVMWpNRWQxcG9CcEdsUjBJVzh5SWFwa2lPRVYv?=
 =?utf-8?B?Y1ozVWcxZWRFbEFjUUhJTThKaWFKbGp4MTEvSzFhN00wR3IraW5YOVhNcUFE?=
 =?utf-8?B?bEtsanFtOWlLNlVyU2hSYmwzY0RyNzBNN3FwZHBsbW94QmRTNWhCdHc4Vnlj?=
 =?utf-8?B?ZllGeWdZVW9Nb1lmOWgvR29RdkIxT0w2SmRQbVArdDl0LysyUDJTR240NmlH?=
 =?utf-8?B?RjNBNlJOSVI2U05FSmluL3BDK1pYWG0rcVdHWHJ5ZndzYUVBUWR1cTAxdVlw?=
 =?utf-8?B?LzdjYk16c2JocXU1amp6NVNpdGFOdXNVTHB2aktVM0JnRlMyRlN2T21jOHZU?=
 =?utf-8?B?N1lEY29ueGhockUrVEhUT3E0S2E0VVBWNnF4WVNkeERTZG1qdDRQdjdvcjR0?=
 =?utf-8?B?TGphc0JPbDdPVHFaZTI2bWd5RnJQbUh6c3JwQzRkT0phM3VwWlpodzJkNGNZ?=
 =?utf-8?B?U01BVjdTQWtnQXFDMm5uajRXMXIzaDV3d0J1Ym9Bamkvb2ZNYnA3Y2JVVllV?=
 =?utf-8?B?djBnZWNpMzJYR1JVSDA1NjI4bjk5UnhXR0F2SXl0QzQ0NnhFTC85R1ZXSHV5?=
 =?utf-8?B?Q1hiOWR2eFlmenhZR0lUYTJzWDFLakcrWXJqUHd5ekxubm9SdUZSVHQwL05Z?=
 =?utf-8?B?RkpvSm9jYVZMSHluMjByakV3OWFFZlBqT3BXN3JpSUhJTDIwemxicXhhTjh6?=
 =?utf-8?B?S0VLcno1SEFJZ1hWWGxnTkIwNDUyYVY5MGZhazA0YmFwbHpILy9seGpxUlVr?=
 =?utf-8?B?bUcreStEbG5ld2I2TXYxWmFkbGs2WnJhMlEwUWxKd3FtTkswMFJGOEYwa2V6?=
 =?utf-8?B?MGNmQk9PR0pwT0JUdWhrdmZkQ3g0MEwxTHFkVFZpa0NlYU1xR05uS0FYQk9l?=
 =?utf-8?B?RlRHc1VveFI0akppTVhOSVBmNUsvRkFmc1FGR2ZNKzJ2YktLRXNBeFVWTDN3?=
 =?utf-8?B?UUhHVWJaWlQ0TjJYM1pBaFRUVDR0amx6eGxjSWs0ZE1Kak03UDRXMWVDMVlU?=
 =?utf-8?B?OGhIb2ZFaGNScWxwRE45TW80alpDOGo0ZVZUVjFnV3FRVHhoSmY5OVU3SDZH?=
 =?utf-8?B?Ym5Vb0pxaHN4Q2ZLVmdtVE9aUktQbHN5aHpGTFNPYzhpSXJ5VkoycXNvMExy?=
 =?utf-8?B?dy8rV0s2ZkFicXNDZUdSOHp4RXE0YkVBOWNyU2xpdVRka1MzcXpmQzY1N3Ja?=
 =?utf-8?Q?Gji0=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6fdf07-debb-4476-f857-08dd9f6167a5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 10:04:45.7344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klOZc5FgEeow3UrWOAH9jO3FT9CH8thiL1c2O6M4c6RCDIPLcohSmvr7D/LPP2ZI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR15MB5369
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA4NiBTYWx0ZWRfXxqzOYB1T/Bvz s15Jt+i+t4rQuiDH5TDuztrLrUq264+1Pdulkv8f/ca4Zf2i2/n/dBLFS++fwmUos4yZQsuuY1j v3+D9UN6uEvpj+UbWjPqR8c/sG2KrBw/jP++f9GEVmKpYXhniM25Hz1DkdC+FzKBy3tiznHoRRg
 7gY7D3PnjMWgYT0wJ7fOcE7BMJMDqjIMwxe8cepoOdlHWMHAFzn5JdnewCtq8PH0XPpcj7ByFHw YbcziF2nQVU2BQYr6laV1bvE6gamgwu51XVVDz9plYkNIDg/WIu/nz7pOkU/8c6sqFJzUq9f/uy SDFQXw8vUR5i7yNmlJayRsz81YbxjsfiYdsjo3hAYXZcw+8X5JywiO8AabLkrj6EC47yYrdtym3
 MGDY7GXQL5CCi89Kut0rRr+o6O0eUMFLx36uewxcLryPtjBHHKbYbrcK5j1qcwPv8TCRKY5n
X-Proofpoint-ORIG-GUID: oDQXCRsbb9rf6z29wpScmiYxH2tJBmWf
X-Authority-Analysis: v=2.4 cv=cZPSrmDM c=1 sm=1 tr=0 ts=683982bf cx=c_pps a=YAEMTVrAcchZ2C0DOoOS4g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=3gwvlTsiGaDvRPS2yPQA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-GUID: oDQXCRsbb9rf6z29wpScmiYxH2tJBmWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01

On 5/28/25 3:59 PM, Peter Zijlstra wrote:
> On Tue, May 20, 2025 at 11:45:38AM +0200, Peter Zijlstra wrote:
> 
>> Anyway, the patches are stable (finally!, I hope, knock on wood) but in a
>> somewhat rough state. At the very least the last patch is missing ttwu_stat(),
>> still need to figure out how to account it ;-)
>>
>> Chris, I'm hoping your machine will agree with these numbers; it hasn't been
>> straight sailing in that regard.
> 
> Anybody? -- If no comments I'll just stick them in sched/core or so.

My initial numbers were quite bad, roughly 50% fewer RPS than the old
6.9 kernel on the big turin machine.  I need to redo things and make
sure the numbers are all valid, I'll try and do that today.

-chris
