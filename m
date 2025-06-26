Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17DF2E717F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945742; cv=fail; b=WLwX6wPAX8euDuLUD4Glth3mnjlhZWgZK2TxNeBxl7zC7aRj305FCEz2vZs2d1pqXmfC7S6/V0YoGQUh5NAwydHSIwLNtsghFLj6pHFbr6gIPRaFp6bWf/O8n41tJocF7tW1yUy0aEtDnWpsto4Lt9KkDfzhijKZvpieWChZge0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945742; c=relaxed/simple;
	bh=4kulyyWlc4umVYKL0F7u18/ST9DuE+hWL4mBSasWTCI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Jize1MdSeaRJOyldT6WQOtUKImmvaJN999ymaP8cY1LJBiIeFCe3wrUHVvXZyyJYw1+y7tiHpertlm3AEMjhiMdecXQiONI84+0f6kz5MAzdEZlm/p7ERjIYtEKwhQZBf9NJvbcCzFbPvR1L+55ooxTMiRiZgPPQhzZKrkHCjrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=ULmcy14b; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="ULmcy14b"
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QCWFA5012729;
	Thu, 26 Jun 2025 06:48:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=cR3C+G5ZWTvz9cIf9vjNASxUTA2iSNy6LSz/TABqhaE=; b=ULmcy14bWaxp
	Ejj84HoHOFnBGx71alx+xjRq+dfac5EwjZtOMBedq962Sh2MDMKbyxrWrHQ0DUnC
	0UCUcWJxwEFUnrx2MiSoMIXkX/UrxC7jRqGuXWsYLmhXYNfjCy7ow8zKO605vsr7
	DCXzEJby/yEDM2L/AdjyYDj2ezdeuc0EQck5DpknjU9nKc0W55bsG6LAfEZWLPt+
	tSCMdTRDIO0hLmEr/OIS5sSjAb+KWI9yc0nsq0Qbj5VI+4l52QhySHKUbakP8qNs
	gmWbSf3n8SmnSIyT6WpTdOLZ71Bo1x1HVxVH9Z8BACafT0gzR/jnHSXkVd5sSRmY
	YzlVTkgaPg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 47gugpkmr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 06:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfZpPYrHU84wMovSYzBnLzcWy/aB+rKq2losORyK/QzrVqKUgMNbM+yyMk5Nd16O9YXuU+wyIWD+G084Uk/0RDeuNc99+Gcs+I69++en6JOPxJnF0rxdD1QqFeurOvivNa3ocQ97FlxUxyPM6AL80zeHziHGL5R+aULVGYSdY+yV7wSjxMjk1/5gfvO05YV2ZC6DVrl6iPuRefJVcF3p04+kp0ynkesrwtZ3rW8CG8roI2yyrmJKasPvbQd5hef558JnLyo1/ni3Qhb+QmlMSa650jNnE3zcCeDF+/wN3z77BKbJbgJKAfCVHPTexpQUSXHcajBAt1L3g7mgKB3zHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cR3C+G5ZWTvz9cIf9vjNASxUTA2iSNy6LSz/TABqhaE=;
 b=Dan/5fUx0EgNC5L2NT3mEIX8deawinOvS0nAJlQIESC3GdE6KNufTNVUcSNMFavrIDEw6qtTp4zqxr0dk6NiR4X5UtRlGG+RaX0K6QSe03uAuemXBxgA0Jp18VOwwa1LTqCpxdFXsp/fPITck39tJvFYqW5qmft0QWwf2wePTg/wOHWNCEwoMDGlPyS4V0Yt+fK4RzjjzaLgKZDkqOqEWrGgfh/MxMHKVVp47B3SZM/czefOfo/xErgEYQuM7BfSx9+uHMBOnuW+hxZcBXybbN5FHPCO0BFzSNPitge4g9PlZkZcjS73UbsPwY2e0vTHeUi9U1X8FFvbGJGEzg7PZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by DS1PR15MB6637.namprd15.prod.outlook.com (2603:10b6:8:1ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Thu, 26 Jun
 2025 13:48:44 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::2fde:34d6:643e:c01b]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::2fde:34d6:643e:c01b%5]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 13:48:44 +0000
Message-ID: <2fbf24bc-e895-40de-9ff6-5c18b74b4300@meta.com>
Date: Thu, 26 Jun 2025 09:48:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] sched/fair: bump sd->max_newidle_lb_cost when newidle
 balance fails
To: Jianyong Wu <jianyong.wu@outlook.com>,
        Peter Zijlstra <peterz@infradead.org>, Chris Mason <clm@fb.com>
Cc: vincent.guittot@linaro.org, linux-kernel@vger.kernel.org
References: <20250624204942.715206-1-clm@fb.com>
 <20250626070057.GE1613200@noisy.programming.kicks-ass.net>
 <SI2PR04MB49312C83A5E6B68086954B41E37AA@SI2PR04MB4931.apcprd04.prod.outlook.com>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <SI2PR04MB49312C83A5E6B68086954B41E37AA@SI2PR04MB4931.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:208:52f::24) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|DS1PR15MB6637:EE_
X-MS-Office365-Filtering-Correlation-Id: a19833f5-1e44-44ed-b245-08ddb4b82b02
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blMra05NY2tkaG5tU2VtWU1qaVdRUVpKdVNUT2tFbVN4RW00eGNxTjcycTE2?=
 =?utf-8?B?TUN2R2hDUHpJV3l2WnFuSXlQVXdtUXdKcTVqdDV2dFY4MkRYZDhqYVlwTE5N?=
 =?utf-8?B?Rlc2ZktDYlBPSGEyOHVrOGFWNjBsY010L1N6V0NhUC95bHVsZU9IaFlmRlho?=
 =?utf-8?B?QWFVbG9NakVCVlAwczFrem9ISTdOT0g3WFZBcEsrQmVscG5GTytPSFZKMXh5?=
 =?utf-8?B?bmFPRHBCbkQ2MHpFU0M2UkJDd3BNNno0aHhFU3hMbTBySUhaUE5SbWlVcEdX?=
 =?utf-8?B?MU9UYThUb2pDd3JWSnRuWm9nTmxUYUZ6b0ZibTc2QXZSbWw3Q1pRU1ZkQlNt?=
 =?utf-8?B?ZlpSRndRZ2NkU0NqTzB2dDhyZ2cvWXpIR3dPcHVqcVU2bTl6d3hrTVVmckI0?=
 =?utf-8?B?YUUrRk44elQySDJBUDFaRnM4Qk9nNTVkMmk4Uk9mdktFN2F0c3Zncnl0RkRj?=
 =?utf-8?B?RjhpdjFmT3ZTeDNQZ2ExM0N1K0RNUDN5aml3dmw2cVJGYjJPd05iTUFoOEgx?=
 =?utf-8?B?dy80TkpQVk1keUhQMkQ1aFNHbDhUdkExTXRvU2N4V0RheFlqU3Y3bHIwY3ZY?=
 =?utf-8?B?SVZaZXZ1YTFUazdTZWQxbER0SzIvRXRpckZ6WWVNZWRzNzY3M2twQktEdWx3?=
 =?utf-8?B?YUxKajl6T0ZQTVVnbms4SXFiZFBhaUhtU2pKOXJrYjg0cjdYRlJxdk5Lend0?=
 =?utf-8?B?a2FIYVdURWtkTUxoOEF2ZzhqVW1NZEVYL1NkMTZROGNCRVhOb1NnRXhoZXhw?=
 =?utf-8?B?cW5UNkFNVEFpMlBZMG9OZFUzNlB1eENOQzMrbnlqYTFVbWRTYjNFalIxWE5M?=
 =?utf-8?B?Sm13V0xSSlRyc1A4R05EQkk5c0pqbXZlbzJCT0hhUWNvNWlZa1IwMVJNaVhU?=
 =?utf-8?B?Vk9KdTI2aWFHWUFua3BjSHo0aThWS0xqTkROK20zVjV4UU5FcHdScEZFdHEx?=
 =?utf-8?B?QndGeFJmYU1ZdUVKT2ZxTUt3Y28rSWV5SUkyRlNnVXVnbGZqT2JJY1pnNERQ?=
 =?utf-8?B?L2NDN00yK3RDY2ZjTktTN0c2RElWWC9rZ1hoclZhNHFmVUJoczVQSFhpOGli?=
 =?utf-8?B?a1lrWnY4bTI3MFZrcVpPTlJzNzRwVXlXM3dpd2FabTlKMFhNaWsvdXJ4Lzhl?=
 =?utf-8?B?SEdLS1hUTHp2Ri9BNGs4Q0cwWE5kcFMxbWNjT1hQWG54YWdpUTI5ZXVlTlJi?=
 =?utf-8?B?cFdCNG83dDRoVEdhNnlWZkM4VkZUMTl4SVZJOVg2dzZxaWJWSWpiRnMzdHhT?=
 =?utf-8?B?WmRxSEpMUTdNM0ZWQlJqV1FNSDZpd2ltUURwbEVZa0daWWw3SER6TWpCeWpn?=
 =?utf-8?B?NzlFbkRyQ2Z4a2EyQkZrZjk5NnZhdG5mMTFpZDk1Rm5xUHJFTzE4UmtrSGxu?=
 =?utf-8?B?U3A5TWQ0REliRUJvcnZjbm9lMnpwNkZTdm1pcDlaRWhHYkJXL3ExRWsxQTdT?=
 =?utf-8?B?MVc4QWUyeUwwci96K013TDhnR2Z2WElkVGtNSnJPemdObm1XSGJCTnYwUGpn?=
 =?utf-8?B?Vlo2cW8rc3J4dnJsOSt2N3VpeEhzeGlQZ2Z4M1RsTVdmUUdsV2txZ2UvTE9q?=
 =?utf-8?B?QkpmQUo1TEM3d0JucHF2a2hxMmJVSFUwdjNwY0NMcVZUQXdNUTRZUUxNeGg1?=
 =?utf-8?B?dnR1MHR5NUpadWtML3dOWGJLUktrWHBhUXNVQXAwRVJiSUtwV0ltWkhkUCtY?=
 =?utf-8?B?Z1hRNVBid29OSVZtVXZXVDlkRHMrdFg0SWV3N0RnTGxGZVNmMDlhQ2dsRHlx?=
 =?utf-8?B?QUdZSGhpM21RWHNHeWp4YVQ3aDNlMGNyaWI0MVNibDl1YlYzZlc5MEVzMERl?=
 =?utf-8?B?WVlqbXZqZFpOZGx4YUlwbm42U3ZIN2w2bGV0cGNER1F0VW9ub1RPVGdSQjli?=
 =?utf-8?B?UUZCSjFJeThjazZleDZRMDFKUUlQSmtFNHdkNFZjTHd2UHRLUlJaVk1tdS9x?=
 =?utf-8?Q?qF/Smkk74R4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU9YVWZnQzYwdGVBWlBXSDFHSXpaSE9hdTNHK3lQY0NOUlNmVlQrWUQ2WFJa?=
 =?utf-8?B?Tk4razZ1MVB4ZEZzUGgxcitXZUw4QWZqZE5CTHpTelMybXhlOUxEaVZqRmtI?=
 =?utf-8?B?ejIxR3pQNFBQeFRqU3BsdUk0eVJ5RnRXbmNyN1duZ1lqRGF6VmduaEJHMEVG?=
 =?utf-8?B?N1Y5WjRKalFGcXFxK0owdkptdGVqWU1uOUVpb0dJcVVDbklGMndxS1gzMUlk?=
 =?utf-8?B?cE5CanNZNXhnRnJERktRbWoxOEx4WVBlRDNNZ3RHdktrbEtIMDlJRDQrZk9x?=
 =?utf-8?B?QmEreUQrVU01UWZhWjEwbTFYU05TZGVlVlNaT1pJMWxzRzVRTWZtOFJBS1Y5?=
 =?utf-8?B?eXltaE9zZDJPWTNkWm1kUkE3Ky80RytxSzdZMmJVWE5ZRXNEb3FOdXFjenBh?=
 =?utf-8?B?Q00zcHZyWVhibytrdE5qNjNPcmpyNWNlL1JCemRBWFhZM2FlWXBPRGxkKzkx?=
 =?utf-8?B?U0NxL1dzWGVVNjdmT0hiNkhDNXNKR1N0OUFUcG44NWN0Zko5ME1BVWE0elhx?=
 =?utf-8?B?bHhmQWwrZFF0dDQyQkVFZjNqVTBQbWJyM0R1N0FxcWdwckQxYXR3QndnU2c2?=
 =?utf-8?B?a3EzMGsxeGpKMmRWUEhNRHl4Qm9ORldHcWN5NW85elY0cy9iKzEzVXdlbDJE?=
 =?utf-8?B?dUFGcE41a3k4aDZWSDM3L0ZUR0RpWTRVZmlBMnBVNGpKZ2poUUlOT284bE15?=
 =?utf-8?B?QkJkZVB4SEhTNDJ3L2Rlb2xRZ05TYXhQa01IU0VSWnFHZnZBQU1MZXFLdzJa?=
 =?utf-8?B?bENkZ2hzZWtCaU1Ya2tlRi82bjlQSFdPY2xlMGhxUmx2ZXRRb2oxTlY1dmFH?=
 =?utf-8?B?N0N4azE5T1NKM3crQUxwbVFMTStsdGtJNkNORkM5MXdEM2JhWGphRko3ank3?=
 =?utf-8?B?Z1JlZWc0b1BiYWhNTzBTeUpodU5YcENqRlFlSldvMnB6dTZVT0pnWEs4YXI5?=
 =?utf-8?B?Z3FxKy8rVEw1R1g5cEh0MEZDNmZ3K25xQUdpZHYvK2lLUFl0UnU1cXpiMnNZ?=
 =?utf-8?B?NG1nTSttdW5aV2FFWEhhaEh6YXdZZXQ2d3VyUGpiZHk4U1l6bVRKeW40dVhQ?=
 =?utf-8?B?bjBxU1Uzc2pYUnozRzVkMFJjSjdpV2V2eUJxWmdjNHpZVDBraUdSMUJiRDRx?=
 =?utf-8?B?NzZxTFdCZldvbVJTNklBUTJPNzBEK2ppMHpjZU84clZ4VEY5SWhlNmRLekI3?=
 =?utf-8?B?SS9lZUhWdnNsOTNRMGIvd0hlUXZ5NEsyenpBMzkzREY5N2h6emRYcENmcXJX?=
 =?utf-8?B?NVMxd21CSCtiUXNTUzB2eWdBUlVWTmlzZGpwYlFNN3V3dURiYldUbGhyNU9r?=
 =?utf-8?B?eVM0TXFNaHdpcE5pQi9PZUN2QmZzSlVneXdrSjFxWW8xM0M1aytwM3pxeW93?=
 =?utf-8?B?c0V6a3p6RngvUEptTkxpYUhOKytvL0NoNEQySnUxeDdVaUdIa2E4a21qQU5w?=
 =?utf-8?B?Q2NkRW5GbWtqNXZsUENjNGsxKzR2SmFXV05wSEFXRm8zRVlhcCtwUFdLZGR3?=
 =?utf-8?B?WU5jVlNKdW1WMW1xYzdRTVBnb3k4M3pIVFJSYjRsY0RVMjAybkpyRlJpUDg2?=
 =?utf-8?B?amtEalh2SHlSKy9SbTNkZDE5ekVWVW9SMGhVMGpjM2UxT0VzMHVKMlRWUTV1?=
 =?utf-8?B?a2Zadm14aVV6bkRaaVVBRWN4LzBsbU5HM3hXenZacFFVMWlXWEFrYlVCRGxB?=
 =?utf-8?B?MUZWbjdyaFpkMUpQWFZrd1l4ZU9XQnNkdGZ4Yjgwc3NXd3VJWVh6MUY4VG9Y?=
 =?utf-8?B?YytISXhhQXl6SHR3RGRqVDJSc0JyTDM2RFpCWWpvZDZ3NzlZMjZpck0rc1Z2?=
 =?utf-8?B?aHByZTRaZjAzdE8rekwybFVFSHhtL0pOMHJjZmtsNFBJSVVBeGhXdW9sanFq?=
 =?utf-8?B?cjUvV0ZvZU41aDlYZzk1bkhKclpQNTZWYytBRXd0VlJ0Y1dhNFRVSXJoaEU0?=
 =?utf-8?B?N2NCRjNqMGtjWHFGL2tkOTdNKzU5Ri8vc05hWDUxQ0orMklsYU13NUd5S3p5?=
 =?utf-8?B?bXZCWkVJQTllZUdCOGFuNzhKL3lFY255M0crQnV6OGNQNG5aUWs2NkFWL0RQ?=
 =?utf-8?B?dEhDbHFmanBoQ1dja1prSEtaQVhHWVR4dFBBc2pmOTFRTXRndXJVajhkOG02?=
 =?utf-8?B?N05TN21xRzNhZHExS0pCOFJCNjhKeG5Scjg2UnlpUVlSbytDK2lLbGFPVHBq?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a19833f5-1e44-44ed-b245-08ddb4b82b02
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 13:48:44.6075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1rngrmsUYya3wbhq1eJRFD1Gs5PhFCR1yMFB2LGL/MNtOJOD57SE8DQoBf46aU/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR15MB6637
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExNiBTYWx0ZWRfX6A6G3P2tWfP6 c1v/FpPzFhd1Gp5eWEMWopQfk3q/Ka9No3OX15Qi1IIdb1YOaIjZRsVI4PYvhYvOsToAYpyx9RV XJPNKebfX4UWXEho7y4Pxaa0XsRd4HxUTwuqOwOnKrBPCkvil+nuO4Srs7z1X/ELGD4fYaPgA3f
 i+smCC1yKOu0VelXnWREmvsIMnWlsTvnYnypfplocMTBR6AWDZo8Ou0ajoT6HNiZn0A+kgLOwhS OAqMrlzUHFV2BOg2Lmo4zgpDvUdFo4khf3Lw49l+13LsRef6o+FOBXzkeBcySXKOHrbuAbTjSli 3VeLZ9enRxO1jyHOWVxUknVoQxUwK+Z+SyU4S+YCNU5FHqDBVPKhOZTIwj3eGMbq99TGg86Xe0W
 tClVrhPyTH1g05QX8RuAmb93jTP1HIGCSFp9+ooyq8Uz4r0HU88s9T/0xR3SFUrTv48r94Ty
X-Proofpoint-GUID: 0GoVHZnQndSbqTzxzFPZw8D0FHKEJa-d
X-Authority-Analysis: v=2.4 cv=CacI5Krl c=1 sm=1 tr=0 ts=685d4fc2 cx=c_pps a=YccY8Kzx3+W15EWE9sCpLQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=vaZf2n_NA9BzdkYkAwYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0GoVHZnQndSbqTzxzFPZw8D0FHKEJa-d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01

On 6/26/25 7:47 AM, Jianyong Wu wrote:
> Hi Peter,
> 
> On 6/26/2025 3:00 PM, Peter Zijlstra wrote:
>> On Tue, Jun 24, 2025 at 01:48:08PM -0700, Chris Mason wrote:

[ ... ]

>> So sched_balance_rq() is used for pretty much all load-balancing, not
>> just newidle.
>>
>> Either make this conditional like:
>>
>>     if (idle == CPU_NEWLY_IDLE)
>>         update_newidle_cost(...);
>>
>> or do it all the callsite, where we find !pulled_task (ie failure).
>>
>> Specifically, we already do update_newidle_cost() there, perhaps inflate
>> the cost there instead?
>>
>>     if (!pulled_tasks)
>>         domain_cost += sysctl_sched_migration_cost;
>>
>> or whatever.
>>
>>
> Maybe it's meaningful to do the inflation here and no need to limit for
> just newidle part. Because when we do the regular load balancing and
> find nothing to pull, it means that there are no busy group here and we
> should not start newidle balancing either.
> 
> If there are concerns that the newidle cost might grow too large, we can
> implement a decay mechanism here.

FWIW, the main reason I parked this in sched_balance_rq() was because I
wasn't sure if there were other reasons we might fail to pull a task
where I didn't want to bump the cost.  You've got a good point though.

This v2 performs the same.  It takes about 60 seconds to warm up to the
point where schbench performance is fast.  Below I've also got
the drgn script I'm using the dump the avg_idle and sd info along with
output while schbench is running.

Peter if this is what you're looking for I'll send a new version,
without whatever whitespace mangling exchange does to this email.

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da5396fb2..6a3345168870a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12173,9 +12173,11 @@ static inline bool update_newidle_cost(struct sched_domain *sd, u64 cost)
        if (cost > sd->max_newidle_lb_cost) {
                /*
                 * Track max cost of a domain to make sure to not delay the
-                * next wakeup on the CPU.
+                * next wakeup on the CPU.  Also, cap this cost at the sched_migration
+                * sysctl, plus a little extra so we don't have to worry about off by 1s
                 */
-               sd->max_newidle_lb_cost = cost;
+               sd->max_newidle_lb_cost =
+                       min(cost, sysctl_sched_migration_cost + 200);
                sd->last_decay_max_lb_cost = jiffies;
        } else if (time_after(jiffies, sd->last_decay_max_lb_cost + HZ)) {
                /*
@@ -12867,7 +12869,13 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)

                        t1 = sched_clock_cpu(this_cpu);
                        domain_cost = t1 - t0;
-                       update_newidle_cost(sd, domain_cost);
+
+                       /* bump the newidle cost if balances aren't productive */
+                       if (!pulled_task)
+                               update_newidle_cost(sd,
+                               sd->max_newidle_lb_cost + sd->max_newidle_lb_cost / 2);
+                       else
+                               update_newidle_cost(sd, domain_cost);

                        curr_cost += domain_cost;
                        t0 = t1;

------- rq.drgn
#!/usr/bin/env drgn
from drgn import NULL, cast, container_of, execscript, reinterpret, sizeof
from drgn.helpers.linux import *

balance_sds = 0
nr_cpu_ids = prog["nr_cpu_ids"].value_()

for cpu in range(nr_cpu_ids):
    rq = per_cpu(prog["runqueues"], cpu)

    avg_idle = rq.avg_idle.value_()
    sd_ptr = per_cpu(prog["sd_llc"], cpu)

    level = 0

    sd = sd_ptr
    while sd:
        max_newidle_lb_cost = sd.max_newidle_lb_cost.value_()
        domain_name = ""
        if hasattr(sd, 'name') and sd.name:
            try:
                domain_name = sd.name.string_().decode('utf-8')
            except:
                domain_name = f"Level {level}"
        else:
            domain_name = f"Level {level}"

        print(f"CPU {cpu:3d} avg_idle:{avg_idle} name:{domain_name:4s} maxnewidle:{max_newidle_lb_cost}")

        # Move to parent domain
        sd = sd.parent
        level += 1
----------------------

Output:

CPU   0 avg_idle:1220213 name:MC   maxnewidle:0
CPU   0 avg_idle:1220213 name:PKG  maxnewidle:0
CPU   1 avg_idle:2966028 name:MC   maxnewidle:0
CPU   1 avg_idle:2966028 name:PKG  maxnewidle:0
CPU   2 avg_idle:1344908 name:MC   maxnewidle:0
CPU   2 avg_idle:1344908 name:PKG  maxnewidle:0
CPU   3 avg_idle:1520682 name:MC   maxnewidle:0
CPU   3 avg_idle:1520682 name:PKG  maxnewidle:0
CPU   4 avg_idle:2296 name:MC   maxnewidle:18102
CPU   4 avg_idle:2296 name:PKG  maxnewidle:11868
CPU   5 avg_idle:2256 name:MC   maxnewidle:11931
CPU   5 avg_idle:2256 name:PKG  maxnewidle:11931
CPU   6 avg_idle:2277 name:MC   maxnewidle:27442
CPU   6 avg_idle:2277 name:PKG  maxnewidle:27442
CPU   7 avg_idle:2039 name:MC   maxnewidle:18568
CPU   7 avg_idle:2039 name:PKG  maxnewidle:18568
CPU   8 avg_idle:2875 name:MC   maxnewidle:12368
CPU   8 avg_idle:2875 name:PKG  maxnewidle:8025
CPU   9 avg_idle:2730 name:MC   maxnewidle:18153
CPU   9 avg_idle:2730 name:PKG  maxnewidle:11785
CPU  10 avg_idle:2770 name:MC   maxnewidle:18780
CPU  10 avg_idle:2770 name:PKG  maxnewidle:12311
CPU  11 avg_idle:3311 name:MC   maxnewidle:11802
CPU  11 avg_idle:3311 name:PKG  maxnewidle:11802
CPU  12 avg_idle:3610 name:MC   maxnewidle:27446
CPU  12 avg_idle:3610 name:PKG  maxnewidle:18056
CPU  13 avg_idle:3632 name:MC   maxnewidle:28125
CPU  13 avg_idle:3632 name:PKG  maxnewidle:28125
CPU  14 avg_idle:4106 name:MC   maxnewidle:18369
CPU  14 avg_idle:4106 name:PKG  maxnewidle:12051
CPU  15 avg_idle:2600 name:MC   maxnewidle:12138
CPU  15 avg_idle:2600 name:PKG  maxnewidle:12138
CPU  16 avg_idle:144809 name:MC   maxnewidle:500200
CPU  16 avg_idle:144809 name:PKG  maxnewidle:500200
CPU  17 avg_idle:1989775 name:MC   maxnewidle:500200
CPU  17 avg_idle:1989775 name:PKG  maxnewidle:500200
CPU  18 avg_idle:830836 name:MC   maxnewidle:500200
CPU  18 avg_idle:830836 name:PKG  maxnewidle:500200
CPU  19 avg_idle:2483294 name:MC   maxnewidle:500200
CPU  19 avg_idle:2483294 name:PKG  maxnewidle:500200
CPU  20 avg_idle:192608 name:MC   maxnewidle:444573
CPU  20 avg_idle:192608 name:PKG  maxnewidle:444573
CPU  21 avg_idle:1309153 name:MC   maxnewidle:500200
CPU  21 avg_idle:1309153 name:PKG  maxnewidle:500200
CPU  22 avg_idle:185294 name:MC   maxnewidle:500200
CPU  22 avg_idle:185294 name:PKG  maxnewidle:500200
CPU  23 avg_idle:139949 name:MC   maxnewidle:500200
CPU  23 avg_idle:139949 name:PKG  maxnewidle:500200
CPU  24 avg_idle:186589 name:MC   maxnewidle:500200
CPU  24 avg_idle:186589 name:PKG  maxnewidle:500200
CPU  25 avg_idle:1582340 name:MC   maxnewidle:500200
CPU  25 avg_idle:1582340 name:PKG  maxnewidle:500200
CPU  26 avg_idle:2966028 name:MC   maxnewidle:500200
CPU  26 avg_idle:2966028 name:PKG  maxnewidle:500200
CPU  27 avg_idle:205108 name:MC   maxnewidle:494338
CPU  27 avg_idle:205108 name:PKG  maxnewidle:494338
CPU  28 avg_idle:2966028 name:MC   maxnewidle:500200
CPU  28 avg_idle:2966028 name:PKG  maxnewidle:500200
CPU  29 avg_idle:2354397 name:MC   maxnewidle:500200
CPU  29 avg_idle:2354397 name:PKG  maxnewidle:500200
CPU  30 avg_idle:289438 name:MC   maxnewidle:500200
CPU  30 avg_idle:289438 name:PKG  maxnewidle:500200
CPU  31 avg_idle:122074 name:MC   maxnewidle:500200
CPU  31 avg_idle:122074 name:PKG  maxnewidle:500200
CPU  32 avg_idle:1313865 name:MC   maxnewidle:500200
CPU  32 avg_idle:1313865 name:PKG  maxnewidle:500200
CPU  33 avg_idle:353004 name:MC   maxnewidle:494338
CPU  33 avg_idle:353004 name:PKG  maxnewidle:494338
CPU  34 avg_idle:301310 name:MC   maxnewidle:500200
CPU  34 avg_idle:301310 name:PKG  maxnewidle:500200
CPU  35 avg_idle:267552 name:MC   maxnewidle:500200
CPU  35 avg_idle:267552 name:PKG  maxnewidle:500200
CPU  36 avg_idle:356823 name:MC   maxnewidle:500200
CPU  36 avg_idle:356823 name:PKG  maxnewidle:500200
CPU  37 avg_idle:2966028 name:MC   maxnewidle:500200
CPU  37 avg_idle:2966028 name:PKG  maxnewidle:500200
CPU  38 avg_idle:171526 name:MC   maxnewidle:500200
CPU  38 avg_idle:171526 name:PKG  maxnewidle:500200
CPU  39 avg_idle:2966028 name:MC   maxnewidle:500200
CPU  39 avg_idle:2966028 name:PKG  maxnewidle:500200
CPU  40 avg_idle:82075 name:MC   maxnewidle:488544
CPU  40 avg_idle:82075 name:PKG  maxnewidle:488544
CPU  41 avg_idle:348035 name:MC   maxnewidle:500200
CPU  41 avg_idle:348035 name:PKG  maxnewidle:500200
CPU  42 avg_idle:2931264 name:MC   maxnewidle:500200
CPU  42 avg_idle:2931264 name:PKG  maxnewidle:500200
CPU  43 avg_idle:153130 name:MC   maxnewidle:500200
CPU  43 avg_idle:153130 name:PKG  maxnewidle:500200
CPU  44 avg_idle:113817 name:MC   maxnewidle:500200
CPU  44 avg_idle:113817 name:PKG  maxnewidle:500200
CPU  45 avg_idle:309720 name:MC   maxnewidle:500200
CPU  45 avg_idle:309720 name:PKG  maxnewidle:500200
CPU  46 avg_idle:176268 name:MC   maxnewidle:494338
CPU  46 avg_idle:176268 name:PKG  maxnewidle:494338
CPU  47 avg_idle:142664 name:MC   maxnewidle:488544
CPU  47 avg_idle:142664 name:PKG  maxnewidle:488544
CPU  48 avg_idle:1690262 name:MC   maxnewidle:500200
CPU  48 avg_idle:1690262 name:PKG  maxnewidle:500200
CPU  49 avg_idle:829104 name:MC   maxnewidle:500200
CPU  49 avg_idle:829104 name:PKG  maxnewidle:500200
CPU  50 avg_idle:153489 name:MC   maxnewidle:500200
CPU  50 avg_idle:153489 name:PKG  maxnewidle:500200
CPU  51 avg_idle:2297489 name:MC   maxnewidle:500200
CPU  51 avg_idle:2297489 name:PKG  maxnewidle:500200
CPU  52 avg_idle:115350 name:MC   maxnewidle:500200
CPU  52 avg_idle:115350 name:PKG  maxnewidle:500200
CPU  53 avg_idle:2616757 name:MC   maxnewidle:500200
CPU  53 avg_idle:2616757 name:PKG  maxnewidle:500200
CPU  54 avg_idle:167287 name:MC   maxnewidle:500200
CPU  54 avg_idle:167287 name:PKG  maxnewidle:500200
CPU  55 avg_idle:141616 name:MC   maxnewidle:500200
CPU  55 avg_idle:141616 name:PKG  maxnewidle:500200
CPU  56 avg_idle:1987543 name:MC   maxnewidle:500200
CPU  56 avg_idle:1987543 name:PKG  maxnewidle:500200
CPU  57 avg_idle:982411 name:MC   maxnewidle:500200
CPU  57 avg_idle:982411 name:PKG  maxnewidle:500200
CPU  58 avg_idle:149479 name:MC   maxnewidle:500200
CPU  58 avg_idle:149479 name:PKG  maxnewidle:500200
CPU  59 avg_idle:182644 name:MC   maxnewidle:500200
CPU  59 avg_idle:182644 name:PKG  maxnewidle:500200
CPU  60 avg_idle:121516 name:MC   maxnewidle:500200
CPU  60 avg_idle:121516 name:PKG  maxnewidle:500200
CPU  61 avg_idle:74137 name:MC   maxnewidle:500200
CPU  61 avg_idle:74137 name:PKG  maxnewidle:500200
CPU  62 avg_idle:949717 name:MC   maxnewidle:500200
CPU  62 avg_idle:949717 name:PKG  maxnewidle:500200
CPU  63 avg_idle:1029923 name:MC   maxnewidle:500200
CPU  63 avg_idle:1029923 name:PKG  maxnewidle:500200
CPU  64 avg_idle:110456 name:MC   maxnewidle:500200
CPU  64 avg_idle:110456 name:PKG  maxnewidle:500200
CPU  65 avg_idle:167751 name:MC   maxnewidle:500200
CPU  65 avg_idle:167751 name:PKG  maxnewidle:500200
CPU  66 avg_idle:111451 name:MC   maxnewidle:500200
CPU  66 avg_idle:111451 name:PKG  maxnewidle:500200
CPU  67 avg_idle:179427 name:MC   maxnewidle:494338
CPU  67 avg_idle:179427 name:PKG  maxnewidle:494338
CPU  68 avg_idle:123710 name:MC   maxnewidle:500200
CPU  68 avg_idle:123710 name:PKG  maxnewidle:500200
CPU  69 avg_idle:168850 name:MC   maxnewidle:500200
CPU  69 avg_idle:168850 name:PKG  maxnewidle:500200
CPU  70 avg_idle:211844 name:MC   maxnewidle:500200
CPU  70 avg_idle:211844 name:PKG  maxnewidle:500200
CPU  71 avg_idle:2298920 name:MC   maxnewidle:500200
CPU  71 avg_idle:2298920 name:PKG  maxnewidle:500200
CPU  72 avg_idle:173488 name:MC   maxnewidle:488544
CPU  72 avg_idle:173488 name:PKG  maxnewidle:488544
CPU  73 avg_idle:309200 name:MC   maxnewidle:477159
CPU  73 avg_idle:309200 name:PKG  maxnewidle:477159
CPU  74 avg_idle:2862954 name:MC   maxnewidle:500200
CPU  74 avg_idle:2862954 name:PKG  maxnewidle:500200
CPU  75 avg_idle:165485 name:MC   maxnewidle:500200
CPU  75 avg_idle:165485 name:PKG  maxnewidle:500200
CPU  76 avg_idle:1126952 name:MC   maxnewidle:500200
CPU  76 avg_idle:1126952 name:PKG  maxnewidle:500200
CPU  77 avg_idle:194514 name:MC   maxnewidle:500200
CPU  77 avg_idle:194514 name:PKG  maxnewidle:500200
CPU  78 avg_idle:707066 name:MC   maxnewidle:500200
CPU  78 avg_idle:707066 name:PKG  maxnewidle:500200
CPU  79 avg_idle:297014 name:MC   maxnewidle:500200
CPU  79 avg_idle:297014 name:PKG  maxnewidle:500200
CPU  80 avg_idle:182589 name:MC   maxnewidle:315837
CPU  80 avg_idle:182589 name:PKG  maxnewidle:315837
CPU  81 avg_idle:169244 name:MC   maxnewidle:434214
CPU  81 avg_idle:169244 name:PKG  maxnewidle:434214
CPU  82 avg_idle:88970 name:MC   maxnewidle:409359
CPU  82 avg_idle:88970 name:PKG  maxnewidle:409359
CPU  83 avg_idle:38676 name:MC   maxnewidle:347075
CPU  83 avg_idle:38676 name:PKG  maxnewidle:347075
CPU  84 avg_idle:52361 name:MC   maxnewidle:351191
CPU  84 avg_idle:52361 name:PKG  maxnewidle:351191
CPU  85 avg_idle:88990 name:MC   maxnewidle:0
CPU  85 avg_idle:88990 name:PKG  maxnewidle:500200
CPU  86 avg_idle:75961 name:MC   maxnewidle:351191
CPU  86 avg_idle:75961 name:PKG  maxnewidle:351191
CPU  87 avg_idle:79392 name:MC   maxnewidle:471567
CPU  87 avg_idle:79392 name:PKG  maxnewidle:471567
CPU  88 avg_idle:83466 name:MC   maxnewidle:409359
CPU  88 avg_idle:83466 name:PKG  maxnewidle:409359
CPU  89 avg_idle:97452 name:MC   maxnewidle:372515
CPU  89 avg_idle:97452 name:PKG  maxnewidle:372515
CPU  90 avg_idle:33705 name:MC   maxnewidle:424096
CPU  90 avg_idle:33705 name:PKG  maxnewidle:424096
CPU  91 avg_idle:58096 name:MC   maxnewidle:494338
CPU  91 avg_idle:58096 name:PKG  maxnewidle:494338
CPU  92 avg_idle:179356 name:MC   maxnewidle:409359
CPU  92 avg_idle:179356 name:PKG  maxnewidle:409359
CPU  93 avg_idle:177919 name:MC   maxnewidle:471567
CPU  93 avg_idle:177919 name:PKG  maxnewidle:471567
CPU  94 avg_idle:2966028 name:MC   maxnewidle:500200
CPU  94 avg_idle:2966028 name:PKG  maxnewidle:500200
CPU  95 avg_idle:142124 name:MC   maxnewidle:500200
CPU  95 avg_idle:142124 name:PKG  maxnewidle:500200
CPU  96 avg_idle:2579799 name:MC   maxnewidle:500200
CPU  96 avg_idle:2579799 name:PKG  maxnewidle:500200
CPU  97 avg_idle:2609151 name:MC   maxnewidle:500200
CPU  97 avg_idle:2609151 name:PKG  maxnewidle:500200
CPU  98 avg_idle:2243870 name:MC   maxnewidle:500200
CPU  98 avg_idle:2243870 name:PKG  maxnewidle:500200
CPU  99 avg_idle:727727 name:MC   maxnewidle:500200
CPU  99 avg_idle:727727 name:PKG  maxnewidle:500200
CPU 100 avg_idle:137305 name:MC   maxnewidle:494338
CPU 100 avg_idle:137305 name:PKG  maxnewidle:494338
CPU 101 avg_idle:158576 name:MC   maxnewidle:494338
CPU 101 avg_idle:158576 name:PKG  maxnewidle:494338
CPU 102 avg_idle:171278 name:MC   maxnewidle:449845
CPU 102 avg_idle:171278 name:PKG  maxnewidle:449845
CPU 103 avg_idle:340608 name:MC   maxnewidle:500200
CPU 103 avg_idle:340608 name:PKG  maxnewidle:500200
CPU 104 avg_idle:120103 name:MC   maxnewidle:500200
CPU 104 avg_idle:120103 name:PKG  maxnewidle:500200
CPU 105 avg_idle:202656 name:MC   maxnewidle:500200
CPU 105 avg_idle:202656 name:PKG  maxnewidle:500200
CPU 106 avg_idle:1965012 name:MC   maxnewidle:500200
CPU 106 avg_idle:1965012 name:PKG  maxnewidle:500200
CPU 107 avg_idle:261602 name:MC   maxnewidle:500200
CPU 107 avg_idle:261602 name:PKG  maxnewidle:500200
CPU 108 avg_idle:86541 name:MC   maxnewidle:500200
CPU 108 avg_idle:86541 name:PKG  maxnewidle:500200
CPU 109 avg_idle:163898 name:MC   maxnewidle:482818
CPU 109 avg_idle:163898 name:PKG  maxnewidle:482818
CPU 110 avg_idle:4484 name:MC   maxnewidle:500200
CPU 110 avg_idle:4484 name:PKG  maxnewidle:500200
CPU 111 avg_idle:2249056 name:MC   maxnewidle:500200
CPU 111 avg_idle:2249056 name:PKG  maxnewidle:500200
CPU 112 avg_idle:2966028 name:MC   maxnewidle:500200
CPU 112 avg_idle:2966028 name:PKG  maxnewidle:500200
CPU 113 avg_idle:2931264 name:MC   maxnewidle:500200
CPU 113 avg_idle:2931264 name:PKG  maxnewidle:500200
CPU 114 avg_idle:168732 name:MC   maxnewidle:500200
CPU 114 avg_idle:168732 name:PKG  maxnewidle:500200
CPU 115 avg_idle:183124 name:MC   maxnewidle:494338
CPU 115 avg_idle:183124 name:PKG  maxnewidle:494338
CPU 116 avg_idle:173684 name:MC   maxnewidle:500200
CPU 116 avg_idle:173684 name:PKG  maxnewidle:500200
CPU 117 avg_idle:2307583 name:MC   maxnewidle:500200
CPU 117 avg_idle:2307583 name:PKG  maxnewidle:500200
CPU 118 avg_idle:2966028 name:MC   maxnewidle:500200
CPU 118 avg_idle:2966028 name:PKG  maxnewidle:500200
CPU 119 avg_idle:2829402 name:MC   maxnewidle:500200
CPU 119 avg_idle:2829402 name:PKG  maxnewidle:500200
CPU 120 avg_idle:2862954 name:MC   maxnewidle:500200
CPU 120 avg_idle:2862954 name:PKG  maxnewidle:500200
CPU 121 avg_idle:2966028 name:MC   maxnewidle:500200
CPU 121 avg_idle:2966028 name:PKG  maxnewidle:500200
CPU 122 avg_idle:157259 name:MC   maxnewidle:500200
CPU 122 avg_idle:157259 name:PKG  maxnewidle:500200
CPU 123 avg_idle:86758 name:MC   maxnewidle:477159
CPU 123 avg_idle:86758 name:PKG  maxnewidle:477159
CPU 124 avg_idle:1548064 name:MC   maxnewidle:500200
CPU 124 avg_idle:1548064 name:PKG  maxnewidle:500200
CPU 125 avg_idle:368488 name:MC   maxnewidle:500200
CPU 125 avg_idle:368488 name:PKG  maxnewidle:500200
CPU 126 avg_idle:6369 name:MC   maxnewidle:34807
CPU 126 avg_idle:6369 name:PKG  maxnewidle:20138
CPU 127 avg_idle:4599 name:MC   maxnewidle:44539
CPU 127 avg_idle:4599 name:PKG  maxnewidle:29576
CPU 128 avg_idle:4470 name:MC   maxnewidle:173840
CPU 128 avg_idle:4470 name:PKG  maxnewidle:114389
CPU 129 avg_idle:3616 name:MC   maxnewidle:139656
CPU 129 avg_idle:3616 name:PKG  maxnewidle:91856
CPU 130 avg_idle:3306 name:MC   maxnewidle:18743
CPU 130 avg_idle:3306 name:PKG  maxnewidle:18743
CPU 131 avg_idle:3668 name:MC   maxnewidle:12047
CPU 131 avg_idle:3668 name:PKG  maxnewidle:7904
CPU 132 avg_idle:4857 name:MC   maxnewidle:18611
CPU 132 avg_idle:4857 name:PKG  maxnewidle:12251
CPU 133 avg_idle:3135 name:MC   maxnewidle:12088
CPU 133 avg_idle:3135 name:PKG  maxnewidle:7836
CPU 134 avg_idle:5178 name:MC   maxnewidle:12365
CPU 134 avg_idle:5178 name:PKG  maxnewidle:12365
CPU 135 avg_idle:4019 name:MC   maxnewidle:12072
CPU 135 avg_idle:4019 name:PKG  maxnewidle:12072
CPU 136 avg_idle:5271 name:MC   maxnewidle:12508
CPU 136 avg_idle:5271 name:PKG  maxnewidle:8084
CPU 137 avg_idle:4510 name:MC   maxnewidle:18839
CPU 137 avg_idle:4510 name:PKG  maxnewidle:12366
CPU 138 avg_idle:3942 name:MC   maxnewidle:17482
CPU 138 avg_idle:3942 name:PKG  maxnewidle:17482
CPU 139 avg_idle:5642 name:MC   maxnewidle:12658
CPU 139 avg_idle:5642 name:PKG  maxnewidle:8298
CPU 140 avg_idle:4146 name:MC   maxnewidle:8051
CPU 140 avg_idle:4146 name:PKG  maxnewidle:5167
CPU 141 avg_idle:4937 name:MC   maxnewidle:17973
CPU 141 avg_idle:4937 name:PKG  maxnewidle:17973
CPU 142 avg_idle:2484813 name:MC   maxnewidle:500200
CPU 142 avg_idle:2484813 name:PKG  maxnewidle:500200
CPU 143 avg_idle:2244756 name:MC   maxnewidle:500200
CPU 143 avg_idle:2244756 name:PKG  maxnewidle:500200
CPU 144 avg_idle:182133 name:MC   maxnewidle:500200
CPU 144 avg_idle:182133 name:PKG  maxnewidle:500200
CPU 145 avg_idle:168356 name:MC   maxnewidle:500200
CPU 145 avg_idle:168356 name:PKG  maxnewidle:500200
CPU 146 avg_idle:2931264 name:MC   maxnewidle:488544
CPU 146 avg_idle:2931264 name:PKG  maxnewidle:488544
CPU 147 avg_idle:182791 name:MC   maxnewidle:500200
CPU 147 avg_idle:182791 name:PKG  maxnewidle:500200
CPU 148 avg_idle:133861 name:MC   maxnewidle:439363
CPU 148 avg_idle:133861 name:PKG  maxnewidle:439363
CPU 149 avg_idle:911712 name:MC   maxnewidle:500200
CPU 149 avg_idle:911712 name:PKG  maxnewidle:500200
CPU 150 avg_idle:837921 name:MC   maxnewidle:500200
CPU 150 avg_idle:837921 name:PKG  maxnewidle:500200
CPU 151 avg_idle:1508246 name:MC   maxnewidle:500200
CPU 151 avg_idle:1508246 name:PKG  maxnewidle:500200
CPU 152 avg_idle:122924 name:MC   maxnewidle:500200
CPU 152 avg_idle:122924 name:PKG  maxnewidle:500200
CPU 153 avg_idle:1174324 name:MC   maxnewidle:500200
CPU 153 avg_idle:1174324 name:PKG  maxnewidle:500200
CPU 154 avg_idle:147233 name:MC   maxnewidle:477159
CPU 154 avg_idle:147233 name:PKG  maxnewidle:477159
CPU 155 avg_idle:188047 name:MC   maxnewidle:500200
CPU 155 avg_idle:188047 name:PKG  maxnewidle:500200
CPU 156 avg_idle:570376 name:MC   maxnewidle:500200
CPU 156 avg_idle:570376 name:PKG  maxnewidle:500200
CPU 157 avg_idle:1183979 name:MC   maxnewidle:500200
CPU 157 avg_idle:1183979 name:PKG  maxnewidle:500200
CPU 158 avg_idle:97075 name:MC   maxnewidle:482818
CPU 158 avg_idle:97075 name:PKG  maxnewidle:482818
CPU 159 avg_idle:2966028 name:MC   maxnewidle:500200
CPU 159 avg_idle:2966028 name:PKG  maxnewidle:500200
CPU 160 avg_idle:1488243 name:MC   maxnewidle:500200
CPU 160 avg_idle:1488243 name:PKG  maxnewidle:500200
CPU 161 avg_idle:330254 name:MC   maxnewidle:482818
CPU 161 avg_idle:330254 name:PKG  maxnewidle:482818
CPU 162 avg_idle:159287 name:MC   maxnewidle:500200
CPU 162 avg_idle:159287 name:PKG  maxnewidle:500200
CPU 163 avg_idle:162074 name:MC   maxnewidle:500200
CPU 163 avg_idle:162074 name:PKG  maxnewidle:500200
CPU 164 avg_idle:2763468 name:MC   maxnewidle:500200
CPU 164 avg_idle:2763468 name:PKG  maxnewidle:500200
CPU 165 avg_idle:170162 name:MC   maxnewidle:500200
CPU 165 avg_idle:170162 name:PKG  maxnewidle:500200
CPU 166 avg_idle:294592 name:MC   maxnewidle:500200
CPU 166 avg_idle:294592 name:PKG  maxnewidle:500200
CPU 167 avg_idle:58190 name:MC   maxnewidle:477159
CPU 167 avg_idle:58190 name:PKG  maxnewidle:477159
CPU 168 avg_idle:217468 name:MC   maxnewidle:500200
CPU 168 avg_idle:217468 name:PKG  maxnewidle:500200
CPU 169 avg_idle:174712 name:MC   maxnewidle:500200
CPU 169 avg_idle:174712 name:PKG  maxnewidle:500200
CPU 170 avg_idle:280704 name:MC   maxnewidle:500200
CPU 170 avg_idle:280704 name:PKG  maxnewidle:500200
CPU 171 avg_idle:171507 name:MC   maxnewidle:500200
CPU 171 avg_idle:171507 name:PKG  maxnewidle:500200
CPU 172 avg_idle:115288 name:MC   maxnewidle:488544
CPU 172 avg_idle:115288 name:PKG  maxnewidle:488544
CPU 173 avg_idle:184219 name:MC   maxnewidle:500200
CPU 173 avg_idle:184219 name:PKG  maxnewidle:500200
CPU 174 avg_idle:95222 name:MC   maxnewidle:500200
CPU 174 avg_idle:95222 name:PKG  maxnewidle:500200
CPU 175 avg_idle:189439 name:MC   maxnewidle:466040
CPU 175 avg_idle:189439 name:PKG  maxnewidle:466040
CPU 176 avg_idle:1775320 name:MC   maxnewidle:500200
CPU 176 avg_idle:1775320 name:PKG  maxnewidle:500200
CPU 177 avg_idle:764919 name:MC   maxnewidle:500200
CPU 177 avg_idle:764919 name:PKG  maxnewidle:500200
CPU 178 avg_idle:118566 name:MC   maxnewidle:500200
CPU 178 avg_idle:118566 name:PKG  maxnewidle:500200
CPU 179 avg_idle:125186 name:MC   maxnewidle:500200
CPU 179 avg_idle:125186 name:PKG  maxnewidle:500200
CPU 180 avg_idle:141305 name:MC   maxnewidle:500200
CPU 180 avg_idle:141305 name:PKG  maxnewidle:500200
CPU 181 avg_idle:2561101 name:MC   maxnewidle:500200
CPU 181 avg_idle:2561101 name:PKG  maxnewidle:500200
CPU 182 avg_idle:2612165 name:MC   maxnewidle:500200
CPU 182 avg_idle:2612165 name:PKG  maxnewidle:500200
CPU 183 avg_idle:208728 name:MC   maxnewidle:482818
CPU 183 avg_idle:208728 name:PKG  maxnewidle:482818
CPU 184 avg_idle:2966028 name:MC   maxnewidle:500200
CPU 184 avg_idle:2966028 name:PKG  maxnewidle:500200
CPU 185 avg_idle:356882 name:MC   maxnewidle:500200
CPU 185 avg_idle:356882 name:PKG  maxnewidle:500200
CPU 186 avg_idle:2966028 name:MC   maxnewidle:500200
CPU 186 avg_idle:2966028 name:PKG  maxnewidle:500200
CPU 187 avg_idle:2966028 name:MC   maxnewidle:500200
CPU 187 avg_idle:2966028 name:PKG  maxnewidle:500200
CPU 188 avg_idle:374657 name:MC   maxnewidle:500200
CPU 188 avg_idle:374657 name:PKG  maxnewidle:500200
CPU 189 avg_idle:155167 name:MC   maxnewidle:500200
CPU 189 avg_idle:155167 name:PKG  maxnewidle:500200
CPU 190 avg_idle:2966028 name:MC   maxnewidle:500200
CPU 190 avg_idle:2966028 name:PKG  maxnewidle:500200
CPU 191 avg_idle:162937 name:MC   maxnewidle:500200
CPU 191 avg_idle:162937 name:PKG  maxnewidle:500200
CPU 192 avg_idle:79301 name:MC   maxnewidle:500200
CPU 192 avg_idle:79301 name:PKG  maxnewidle:500200
CPU 193 avg_idle:160541 name:MC   maxnewidle:500200
CPU 193 avg_idle:160541 name:PKG  maxnewidle:500200
CPU 194 avg_idle:2293664 name:MC   maxnewidle:500200
CPU 194 avg_idle:2293664 name:PKG  maxnewidle:500200
CPU 195 avg_idle:255174 name:MC   maxnewidle:500200
CPU 195 avg_idle:255174 name:PKG  maxnewidle:500200
CPU 196 avg_idle:181076 name:MC   maxnewidle:500200
CPU 196 avg_idle:181076 name:PKG  maxnewidle:500200
CPU 197 avg_idle:138368 name:MC   maxnewidle:500200
CPU 197 avg_idle:138368 name:PKG  maxnewidle:500200
CPU 198 avg_idle:337965 name:MC   maxnewidle:500200
CPU 198 avg_idle:337965 name:PKG  maxnewidle:500200
CPU 199 avg_idle:163587 name:MC   maxnewidle:500200
CPU 199 avg_idle:163587 name:PKG  maxnewidle:500200
CPU 200 avg_idle:164217 name:MC   maxnewidle:500200
CPU 200 avg_idle:164217 name:PKG  maxnewidle:500200
CPU 201 avg_idle:106478 name:MC   maxnewidle:500200
CPU 201 avg_idle:106478 name:PKG  maxnewidle:500200
CPU 202 avg_idle:198609 name:MC   maxnewidle:500200
CPU 202 avg_idle:198609 name:PKG  maxnewidle:500200
CPU 203 avg_idle:167160 name:MC   maxnewidle:500200
CPU 203 avg_idle:167160 name:PKG  maxnewidle:500200
CPU 204 avg_idle:131516 name:MC   maxnewidle:500200
CPU 204 avg_idle:131516 name:PKG  maxnewidle:500200
CPU 205 avg_idle:841168 name:MC   maxnewidle:500200
CPU 205 avg_idle:841168 name:PKG  maxnewidle:500200
CPU 206 avg_idle:83514 name:MC   maxnewidle:477159
CPU 206 avg_idle:83514 name:PKG  maxnewidle:477159
CPU 207 avg_idle:2966028 name:MC   maxnewidle:500200
CPU 207 avg_idle:2966028 name:PKG  maxnewidle:500200
CPU 208 avg_idle:185433 name:MC   maxnewidle:500200
CPU 208 avg_idle:185433 name:PKG  maxnewidle:500200
CPU 209 avg_idle:318034 name:MC   maxnewidle:488544
CPU 209 avg_idle:318034 name:PKG  maxnewidle:488544
CPU 210 avg_idle:86766 name:MC   maxnewidle:477159
CPU 210 avg_idle:86766 name:PKG  maxnewidle:477159
CPU 211 avg_idle:91448 name:MC   maxnewidle:477159
CPU 211 avg_idle:91448 name:PKG  maxnewidle:477159
CPU 212 avg_idle:2261598 name:MC   maxnewidle:500200
CPU 212 avg_idle:2261598 name:PKG  maxnewidle:500200
CPU 213 avg_idle:86049 name:MC   maxnewidle:426064
CPU 213 avg_idle:86049 name:PKG  maxnewidle:426064
CPU 214 avg_idle:87027 name:MC   maxnewidle:368149
CPU 214 avg_idle:87027 name:PKG  maxnewidle:368149
CPU 215 avg_idle:258805 name:MC   maxnewidle:401674
CPU 215 avg_idle:258805 name:PKG  maxnewidle:401674
CPU 216 avg_idle:98132 name:MC   maxnewidle:178063
CPU 216 avg_idle:98132 name:PKG  maxnewidle:178063
CPU 217 avg_idle:85742 name:MC   maxnewidle:500200
CPU 217 avg_idle:85742 name:PKG  maxnewidle:500200
CPU 218 avg_idle:175594 name:MC   maxnewidle:179342
CPU 218 avg_idle:175594 name:PKG  maxnewidle:179342
CPU 219 avg_idle:41942 name:MC   maxnewidle:224373
CPU 219 avg_idle:41942 name:PKG  maxnewidle:224373
CPU 220 avg_idle:208547 name:MC   maxnewidle:488544
CPU 220 avg_idle:208547 name:PKG  maxnewidle:488544
CPU 221 avg_idle:2066611 name:MC   maxnewidle:500200
CPU 221 avg_idle:2066611 name:PKG  maxnewidle:500200
CPU 222 avg_idle:814866 name:MC   maxnewidle:500200
CPU 222 avg_idle:814866 name:PKG  maxnewidle:500200
CPU 223 avg_idle:192260 name:MC   maxnewidle:477159
CPU 223 avg_idle:192260 name:PKG  maxnewidle:477159
CPU 224 avg_idle:178792 name:MC   maxnewidle:500200
CPU 224 avg_idle:178792 name:PKG  maxnewidle:500200
CPU 225 avg_idle:176798 name:MC   maxnewidle:500200
CPU 225 avg_idle:176798 name:PKG  maxnewidle:500200
CPU 226 avg_idle:151578 name:MC   maxnewidle:500200
CPU 226 avg_idle:151578 name:PKG  maxnewidle:500200
CPU 227 avg_idle:1781520 name:MC   maxnewidle:500200
CPU 227 avg_idle:1781520 name:PKG  maxnewidle:500200
CPU 228 avg_idle:89269 name:MC   maxnewidle:500200
CPU 228 avg_idle:89269 name:PKG  maxnewidle:500200
CPU 229 avg_idle:112549 name:MC   maxnewidle:500200
CPU 229 avg_idle:112549 name:PKG  maxnewidle:500200
CPU 230 avg_idle:794122 name:MC   maxnewidle:500200
CPU 230 avg_idle:794122 name:PKG  maxnewidle:500200
CPU 231 avg_idle:150021 name:MC   maxnewidle:500200
CPU 231 avg_idle:150021 name:PKG  maxnewidle:500200
CPU 232 avg_idle:175535 name:MC   maxnewidle:500200
CPU 232 avg_idle:175535 name:PKG  maxnewidle:500200
CPU 233 avg_idle:113889 name:MC   maxnewidle:494338
CPU 233 avg_idle:113889 name:PKG  maxnewidle:494338
CPU 234 avg_idle:200296 name:MC   maxnewidle:494338
CPU 234 avg_idle:200296 name:PKG  maxnewidle:494338
CPU 235 avg_idle:1053324 name:MC   maxnewidle:500200
CPU 235 avg_idle:1053324 name:PKG  maxnewidle:500200
CPU 236 avg_idle:262170 name:MC   maxnewidle:500200
CPU 236 avg_idle:262170 name:PKG  maxnewidle:500200
CPU 237 avg_idle:2597951 name:MC   maxnewidle:500200
CPU 237 avg_idle:2597951 name:PKG  maxnewidle:500200
CPU 238 avg_idle:2931264 name:MC   maxnewidle:500200
CPU 238 avg_idle:2931264 name:PKG  maxnewidle:500200
CPU 239 avg_idle:141097 name:MC   maxnewidle:500200
CPU 239 avg_idle:141097 name:PKG  maxnewidle:500200
CPU 240 avg_idle:183973 name:MC   maxnewidle:500200
CPU 240 avg_idle:183973 name:PKG  maxnewidle:500200
CPU 241 avg_idle:2641893 name:MC   maxnewidle:500200
CPU 241 avg_idle:2641893 name:PKG  maxnewidle:500200
CPU 242 avg_idle:265108 name:MC   maxnewidle:500200
CPU 242 avg_idle:265108 name:PKG  maxnewidle:500200
CPU 243 avg_idle:287485 name:MC   maxnewidle:488544
CPU 243 avg_idle:287485 name:PKG  maxnewidle:488544
CPU 244 avg_idle:350129 name:MC   maxnewidle:466040
CPU 244 avg_idle:350129 name:PKG  maxnewidle:466040
CPU 245 avg_idle:82454 name:MC   maxnewidle:494338
CPU 245 avg_idle:82454 name:PKG  maxnewidle:494338
CPU 246 avg_idle:2931264 name:MC   maxnewidle:500200
CPU 246 avg_idle:2931264 name:PKG  maxnewidle:500200
CPU 247 avg_idle:165595 name:MC   maxnewidle:500200
CPU 247 avg_idle:165595 name:PKG  maxnewidle:500200
CPU 248 avg_idle:6737 name:MC   maxnewidle:500200
CPU 248 avg_idle:6737 name:PKG  maxnewidle:500200
CPU 249 avg_idle:332116 name:MC   maxnewidle:500200
CPU 249 avg_idle:332116 name:PKG  maxnewidle:500200
CPU 250 avg_idle:52773 name:MC   maxnewidle:500200
CPU 250 avg_idle:52773 name:PKG  maxnewidle:500200
CPU 251 avg_idle:16963 name:MC   maxnewidle:500200
CPU 251 avg_idle:16963 name:PKG  maxnewidle:50020
