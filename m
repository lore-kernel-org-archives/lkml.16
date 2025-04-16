Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC1E2080F3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817349; cv=fail; b=OlzFBdUPxV1IXeEEUB3JXVbMk4U4/tSyuXvEDbMqeUYvv2MfrMUOD99O7fVxFOx4PWtK69+1zWgiLclhB+8+AQkuQVXfzfrdJokZCCtmZUfZvAnBnuqTQlWzxdlOW+5w63azMJkk9+L6ZRqqwebhajLkw0f224LyaXvqTCIXTgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817349; c=relaxed/simple;
	bh=4pNw9y2E6Znm8BZ0otn874WXNodsAc/iW4HG8qfFSjM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NnRIRkldR2NaZ+SHiQs3A14sU4qUNKhAIacywGTS0AB0zATo0o5KYXoE+cy6tas72WDNSlnHpg/qoRqJcYVj7W0Hu4ZClu9lsjDJD949KvHHFOe+ilqJXb1MKrBcQd99vTgXXCs9ulYpOhCvcSaXQozpMD3VsIlAw2dzj81/6tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=Vyu+7Q4u; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="Vyu+7Q4u"
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GF6qIo001851;
	Wed, 16 Apr 2025 08:27:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2021-q4;
	 bh=SLgKSGFtGnDUuB9PBU/ZWmJiaIogE4d4IOTN7Boc9lA=; b=Vyu+7Q4uX1/g
	kHQzx5HtZXIhduOT/IMgkalZQAC1MuKKC5k7HqQZy7GyMSoHSj/uKif9LqJKLKEP
	Ceo2eh4a06HZNCwdSFaf22U3icjM7DRiTLEWk06ZOezWZFZbxCEAVEDqOTGshGNb
	74ZYvmF3dRmwxZHnaAGO8mGfOmZ64u1Elg6mEWrXHIY4b/MEENKJurZokQW+4yV4
	CXaDG5dVDi5spmBeH3ZYw4tXu5QBkQbwmOW2djyt2f2FupmRzG6zdkrG1TeLCcqH
	W9EMci7ZPEPpUQCyX24kYgHYp3/mAahIwGQHAVEoBt324JUy77u1vfmuvPAkgN78
	aE0lCQ9CVw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 462aj5t19x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 08:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bg/nlsVsnOh4iA+KlHXx9slY7a4/MtZJmcs/TeXWMuJvIAExun+2r+OSnokkLBMB+/QfttHCQ1G6chjd1A2jskE3m166+Cc0ymtuidjbsS9biUA6IYElRGD56oj5/NoA04EGLn1re/YonSaFuh6Jlz+i/5iPh8/TKA/zSYWpl/w4wTn2u3hulGh1giwoAcZsAFKxUGNfc7Ng7cmVpSRQslMnsbtCRKmJ8ZNGuoM1hqzQXhBA0DOs4/Ql4kOxYZHcNGMIXK1apj36rEOrwKyfTWsHR6Qvis0MhVebArSSabttGU0wn/DWjFYpwU20bKo9oIhhnd5g/RVgItQB5Q8gTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLgKSGFtGnDUuB9PBU/ZWmJiaIogE4d4IOTN7Boc9lA=;
 b=qaL2WxrtjcqjDrXZMWRgwjZmq2Cr0vXwR/IQGXSERsQltv5PudRexMMBCZOYNrjPtczfw7uo3Tj8C/1jBVJLEwN63Hq38NLB2Fn/+iV0wcFKgHRjoWvmpBM/wvr+vWuciAFaqJoHQ83g/yIZPlzQZfGioI+fK4OePhAMKmg6AJx6qRAJ4IXFNkeZrtg4OLk84UNOsbxGRkuQmpQkwHTd/BbFS1c+1o9w0K4aNnLGsAswHufSG2SaGdo33xKpxSblEJ/CgFWEbn9Yii6wf9MLJpcAXwhltWspNNPXfduRBphgASW4oYcdcktWDYxwG+lfQdqtnfY+Pvkk9/SGKUqZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by BLAPR15MB3777.namprd15.prod.outlook.com (2603:10b6:208:27f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 15:27:55 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::32d1:f1b2:5930:7a24]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::32d1:f1b2:5930:7a24%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 15:27:54 +0000
Message-ID: <2d8224c1-c391-452a-b206-89f25c025688@meta.com>
Date: Wed, 16 Apr 2025 11:27:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: Add null pointer check to pick_next_entity()
To: Rik van Riel <riel@surriel.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Pat Cody <pat@patcody.io>, mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linux-kernel@vger.kernel.org, patcody@meta.com,
        kernel-team@meta.com, Breno Leitao <leitao@debian.org>
References: <20250320205310.779888-1-pat@patcody.io>
 <20250324115613.GD14944@noisy.programming.kicks-ass.net>
 <7B2CFC16-1ADE-4565-B555-7525A50494C2@surriel.com>
 <20250402082221.GT5880@noisy.programming.kicks-ass.net>
 <b378f48593ca7449257a1bb55e78b186d88cd9f1.camel@surriel.com>
 <20250415080235.GK5600@noisy.programming.kicks-ass.net>
 <20250416124442.GC6580@noisy.programming.kicks-ass.net>
 <abffc286b637060f631925f9b373fad114d667d6.camel@surriel.com>
Content-Language: en-US
From: Chris Mason <clm@meta.com>
In-Reply-To: <abffc286b637060f631925f9b373fad114d667d6.camel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0058.prod.exchangelabs.com (2603:10b6:208:23f::27)
 To LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|BLAPR15MB3777:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5aead5-1a78-4619-9413-08dd7cfb4220
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXg2L2oxVWdPdDZpNXBOaU1Fc1FHZ2RkZDIrUE5SS0pidjNtWmpxZVpwMlRp?=
 =?utf-8?B?VVA4OEx0c1R3QjJKc2hyam1kNWxyVjRncVMzai8zNVJmeStxd1ZIWDhIemJp?=
 =?utf-8?B?ZldqZksyaUgvT2FsRTdIdm9yZFJxdWdGZk1tbU4raTdzQlFsOEhGZHV2cGpQ?=
 =?utf-8?B?ekxQaUZLS3RXMG9EaGRYZWRWbUNObTlyT0dxS1p0NzdEdlBzZUhWRjhxRHBm?=
 =?utf-8?B?NEc0SS80Rm9KS3ZseXlJck1WZG0wTTBIeVN2RU9pM0lHRCs5UkJtY0Z3bVlM?=
 =?utf-8?B?VTZFL3ZFTHcxT3gvRlBtMlptNVpqL0NCZytocnplZnZ6N2lBYUlDZDNjNUMv?=
 =?utf-8?B?RlNkK3d0LzF6YmlMMWZldE5FT3JqbHhYb0lBY05yUGtYOHl3cjNIVE5TQnli?=
 =?utf-8?B?RXl5VTUxR21lcWFDRWZIang5WVBLSmZpY2N1NVN0eFIrMytvZ1EwZjVVM3pF?=
 =?utf-8?B?dnhITlY5aWczcDZLejhpbjFaUTI5L05UU3I2anRoM29zbnRZVWNWVHBwODN3?=
 =?utf-8?B?WUVMdTdsS2Z5TkswNThsbkovTW94T2ZLNS9OL2xvcEZFeEV1RXJjSk9ERC8w?=
 =?utf-8?B?MTlxbmRhWHdvOG8zMDJKWmVqaHF3TWYvUy91SEVNQjJ2YUdlb1dJZjJiRitu?=
 =?utf-8?B?b2ttbjRuVExIb1luRzBWOWVNbTdNZmNiRkl5c2Z1aXFGV3JsV2JyaTVDR2th?=
 =?utf-8?B?Y1dHOFFSeWE5cXZuYmtsNVA5Vkl2SitOOS81Z3dMdllhOWNFTW5rVk51VEZr?=
 =?utf-8?B?SWk3YnJ5cE05M0QreUZITFBSVzNXU0dxWnVUcjNEM0hTYmg3MW8vUE13S1Zo?=
 =?utf-8?B?T2Z2Q3VKc3JrZ2RSY01oTTQvOEk0a3k1czhycXdFbXRUK01ZZG4wVEk5dW9W?=
 =?utf-8?B?NEc5a3MxY2xOUFpUcmJyUWkvRGprMnJaeU9haWlCcythVEZaZGtZRDZ1Z0Vi?=
 =?utf-8?B?a0pKSWdhZzFVTXFvUWpnb2MrQzdOZW1OK0dlUUFqMTAxMUdWd3Uwc202RnRU?=
 =?utf-8?B?Smh4cSs3L1pmZU1uTGx2Q0ZEa3VjaVk4Y2pOalo3bURDc09nNUw3bk0xMFhy?=
 =?utf-8?B?ZnRkOEdGR0xqYVk1Wi9xVVQ0OTdhejdOL0pZeVlyQU9WaEFGaHp0TFNFSXpi?=
 =?utf-8?B?QVZkclI5d01qKy92d1B6RFJkTHNxZyt3RjdnV3Uvb1ZDVFlldVJuVU1UQzVM?=
 =?utf-8?B?Vk5wc0oySWtZdWFTTTZYN0M3cmo3RUF1ajA2SmxBTG5xZG13QklxVEIxNlFG?=
 =?utf-8?B?Q2s5ak9vWHQ3Q3BFelZNVVdiSEdYUXhoWC9ieWNPRE5melkyKzZlRzFJOGFL?=
 =?utf-8?B?VWc1c3pod2FYMDdGUXUwdnpuUGFIVnBQT3AyNUp0alZRVVNuQWFmVkNoNE1Y?=
 =?utf-8?B?Y2ZDbDlGK2hmbHJSRXhIOVlFZTdxYTBiZWtmOXRHOG9qbU16c1ZaRDdpaENt?=
 =?utf-8?B?QVZPcFZWejZlaDZCM0EzN2dzOGhYcDZiajhPOCsvMEo5ZUdEMDJaU3dabWpN?=
 =?utf-8?B?cUJ0UHFMd3k3aFpJMWQ5NXJaMnQ4TmJKU2U2Rmt1Z3IyMUZ6cUtyU254d1hV?=
 =?utf-8?B?b3NtUHFQZVdGM05UZFYvdXhRS2RRVStCc0x3RG1aUXRvSFVFMEZlNTJYSGZU?=
 =?utf-8?B?RHlmeXZMRGViaVNMOE11S3NrSDdJSDFjMmllL2h6K0ptUUlNb21MR2R2VXJj?=
 =?utf-8?B?bEkrV1JFbFAxV0FLak02M0dmbmt5K2JwNDNZcGcyQVk4L3dvZDljSkg3WjNq?=
 =?utf-8?B?dWcwSEVuMG1SL29STjg1Rm5tZTByWlVpbGc2MjlWN2FraitoUVN3ZWw2TlhZ?=
 =?utf-8?B?WExNUi9xeEM1ZlZJQ3Izcis4c3pVZVFiUyt0TGVVaVJjSEFjRjJZOEdlRU5D?=
 =?utf-8?B?Mkk5QWdqNFZIa2diWUVZcTEzeVgrYTk5NUFNa0pRMmd5cGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHhkdXZYY010K2JrRGFJbE9pU3V4R1A2Z0VxaktIZ1F1SGp4aXllUWpCUzMw?=
 =?utf-8?B?Y1JiVmpiNXIxU1ZiVCsvYW54bG9zQTlQenNLMFUySlJyRnhLMzkwNDgyZXZL?=
 =?utf-8?B?T2NkVXhGaFBmMWJvSmlPV1J6Q1hPZU8rcXJVTHl2N1M2UmtYT1RhTm1yUGk2?=
 =?utf-8?B?RmRHbklpaTBwZmdQalBua0VTY254aWt0WUZRN0ZNQURYN2NGT0JhTlJMbDY4?=
 =?utf-8?B?VWFTNE5nelU3NzlvZU1nTXp4RThyQngwK3BFZ1huL0d3ekU1WWdINmZOUmpS?=
 =?utf-8?B?UExGQjBZbEdqaFVKdHNZbkFqanJPK0l5QXBvTktIZ1FHZzk3cURtSzAwU296?=
 =?utf-8?B?eXhtL0x4SGYrYm44cEdyMEZmRjBEN0xwWmV0QnlGNVZaY2t6NHpKRjJRSTBl?=
 =?utf-8?B?ZTZhK3NmcS9LZWtLbXZmbHVQVHZKUzROK0hJREY0Q1V0VWhUQTRwKzloT25I?=
 =?utf-8?B?K1IxMzVvUE1FUjVmaFFsOCtQR0svM2VZZGJQZVdQZm52RmYyZ1o1cHFvSVdN?=
 =?utf-8?B?a09QbUVXcHlQQlhKa3lzSTRjZ2xHNlFrRldwR2JseVZzbjYvVmZMOGdjZjBp?=
 =?utf-8?B?ckY2Z21aU1Y1ZWpQTTRjVVNud0h5NE9HbHpZTmN1a3lvQjJrN0tlOFQrUjVk?=
 =?utf-8?B?UkhsdFNlekpHNWRxWHNaaURoS29vZ2x3RmhGWFNpZURDenFZcVZrVFQwVVkw?=
 =?utf-8?B?ZDBTLzlyZlVpNlhQU0JValdVSE51Ny9NUHlBaEJaTkdqc0VJZXhNWmswMWkv?=
 =?utf-8?B?OVFLdGU5L2YvMHlLRmx0c042cVRFbXVIcHNyZWkyMmg2WVgvTjFVN1VhUVFY?=
 =?utf-8?B?V09oTGZ0cEhTWGZSSUxRSzRkWG8zRGZFZHZxKzllSzZJQUZVV0MzVU56aE50?=
 =?utf-8?B?SEd2OGJzRUFQT2p1RlJXbGF3aG9BYTdibUJkUmpxaW80Z2NoeXR5MnN2V0hX?=
 =?utf-8?B?L1FnMFFaa29oWmdQMEx0MmUybk5QQkt4VUpackJ1b2I2eVRDNUtWaDJQZnBX?=
 =?utf-8?B?UXZtQ1RwbVVOOFNSYTUzK05iOFdlZ0x0Qks1UmVibldEenRJNkd5WDVIMTAw?=
 =?utf-8?B?dWNNdEVYWUcxZkJGK1pmblQrZFdpeUtCMUEzNHBTK01JaGgwLzZzcHRmQmN1?=
 =?utf-8?B?UUZzak8zQzVOVncwVktzUWFBelg3eWxWQUdyNWFZQndXKzYrL2ZHUzh1TTlo?=
 =?utf-8?B?QWlOMXVlUGNxYit3eTROZkV5Q0FsSjJ5blRGNmF2TmxXR3RucGJsMHQ2U2dH?=
 =?utf-8?B?dVJ1NXFNWHRNWmZiVzNrOVkzR1Uzem5FWDVFb2VWV0VvYWQwN0NyUkp4bnBU?=
 =?utf-8?B?cWxveW4yY1FPdkRjcWEvdHV5bndOUnlCQlRzS3gyeGNkSk4wazhmdXM4TnFw?=
 =?utf-8?B?UmF2MUNYZDExNllpblIxVDlIeXpoU21OVFY5MHdsSU1jQkd4b3NtanovbnMx?=
 =?utf-8?B?QUFicUx6QzhxeHNmSWlIK3lmM1dHSktHSG00aVZlSE1XT3hEd1RrVVFqYkh1?=
 =?utf-8?B?WVdlU3hSSHRNeXpHRC93R1c4NjJGaG9vcFA4ZCtoRlZrWnJ0RFhtL1MwVUsy?=
 =?utf-8?B?bC9jbHpMbFhpZFVHbEFvSDArakZrazZQdGV2TnduM3lnSUFWV28ydWVIRWpG?=
 =?utf-8?B?dHlERnNHK2x2NGNVUUQwNlFxdlFMMEVUYnM2UXJrM3ZwRk1iMVl2aTZNemcv?=
 =?utf-8?B?czQ1L21oT0tMV2I4Y1Ria2tNb2VGRVF2bzU3c0toa0ZxeUJ5aHBkb2RHRWVh?=
 =?utf-8?B?bFBIVitFaEJiTzBWa2hacHFXTEN2eGlKZ3ByVEg3ZURiQVdJeXVhZUpkZjdB?=
 =?utf-8?B?UGhGa216SnUvQUxOb2drSERhcndSS0szTldOaXc1aDVxV3BvZVpVMFNFOFVG?=
 =?utf-8?B?czhaZ3lLVUNJeXhqdkRVYTM5Y0liZ2lYR0xvcm9qbXIwY2NZS1NTTHFNUnIr?=
 =?utf-8?B?N01WRVdBb2tvQmo3MlAvSDZrSFJ6alBmdGw2RmFVTkowSmpiQlRMcEZZelNR?=
 =?utf-8?B?RXZmWE44WlBaUlA5RlJzaFZFWDdoOXV6VFYyVTg2a1huZGRFSEsybUJMcnNK?=
 =?utf-8?B?S0JIY05LemM4UGhsUDBNUlJadXNLSkNQVkJwWDdBSDRmcEd2bEd4UnFLeVVX?=
 =?utf-8?Q?vlrUQ/rJrtOWYKRwA+QxoN2E6?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5aead5-1a78-4619-9413-08dd7cfb4220
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 15:27:54.6942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWfqdPfb3S19aEL9y50Fwcx2E0thVyaaYlp+DTs6vc9Xb+Eis9CGpvBx2oiUtzh8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR15MB3777
X-Proofpoint-GUID: FOvjqAMa9QBxTK5yAtsbZbOboygJAcFh
X-Authority-Analysis: v=2.4 cv=UuxjN/wB c=1 sm=1 tr=0 ts=67ffcc7e cx=c_pps a=SX8rmsjRxG1z7ITso5uGAQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=ATgzmS6HIZ9MK0nuXusA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: FOvjqAMa9QBxTK5yAtsbZbOboygJAcFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01



On 4/16/25 10:19 AM, Rik van Riel wrote:
> On Wed, 2025-04-16 at 14:44 +0200, Peter Zijlstra wrote:
>> On Tue, Apr 15, 2025 at 10:02:35AM +0200, Peter Zijlstra wrote:
>>> On Mon, Apr 14, 2025 at 03:57:42PM -0400, Rik van Riel wrote:
>>>> On Wed, 2025-04-02 at 10:22 +0200, Peter Zijlstra wrote:
>>>>>
>>>>> Please confirm what the reason for overflow is.
>>>>>
>>>> Running a large enough sample size has its benefits.
>>>>
>>>> We have hit 3 out of the 4 warnings below.
>>>>
>>>> The only one we did not hit is the cfs_rq->avg_load != avg_load
>>>> warning.
>>>
>>> Fair enough, that one really isn't hard.
>>>
>>>> Most of the time we seem to hit the warnings from the
>>>> code that removes tasks from the runqueue, 
>>>
>>> *blink*..
>>
>> Which warning is getting hit on removal? The avg_vruntime mismatch?
>>
>> Also, which removal path? schedule()'s block path, or migration like?
> 
> The most common warning by far, hitting
> about 90% of the time we hit anything
> in avg_vruntime_validate is the
> WARN_ON_ONCE(cfs_rq->avg_vruntime != vruntime)
> 
> The most common code path to getting there,
> covering about 85% of the cases:
> 
> avg_vruntime_validate
> avg_vruntime_sub
> __dequeue_entity
> set_next_entity
> pick_task_fair
> pick_next_task_fair
> __pick_next_task
> pick_next_task
> __schedule
> schedule
> 
> 

When I was spot checking hosts, I only found these early in boot.  Rik,
did you find some that tripped later as well?

-chris

