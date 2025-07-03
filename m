Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2081.outbound.protection.outlook.com [40.107.100.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230492DCBF8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585757; cv=fail; b=bWO7olD74TwhFssSE5AhKwOhyGAw+nA42IhI1+NxAATpBvakZgRm8w3qHGPVn0dfeLcwez4gxmrvpIuc6pG55gakD51WhnBCFBMcJLW3T4wJhV0yU9CnwxYyMJ4cYYrhuGeepFZHxFHH+F4uBiR11Byt5A5YIX7DKrriAuaUwLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585757; c=relaxed/simple;
	bh=l/pHFG2Ozn0wREEg50f2/YztxvusgneQI62HxLjBvl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UnBK+lMwoeWOHaR4kcMvw/dUXZ1+GFaNQMbO0twdmrBhCzs0XTUnmzTFOQRUysolMFm7L47wTOppuvZu4ByXLdTXXKEx2SfgWoQ1ooAywoSSLEZ7BtNDKAgzRqMzNtFCmeDjN5gleTDzjkMV0G4Z5HiR79LsWiSL6Z7/U6qJB84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G1b2/cIf; arc=fail smtp.client-ip=40.107.100.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G1b2/cIf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4AhVZWlCaCe9bYIufsrGg5HLw1DAboYCfS/A+V8/yAGa1TdfDKmjLjm5b7S5FTSi002WYGpVvJGObKSbGPiFEbfgGvKpkSvNeo4XIx+dxU/AVQHHjZJPE7CEAdzg5haIx2FdgonPK1pueTa9zyHKTSOXKq8cMckH/iZFk+4D0IN7C6Mny8ZR15hzuAX0q7mP/VvpvII5LhQXerHIib9lgyB6Nn5ew8BT/kZDIC++gp8T9kJkwhlgMKud58gV0JnDg3ZMGrGJE50SrIc5TKzb+wXuJ6qqqZox+SaG7ow4cgGSpvsEQCVoTpfyn4kpSus/wkezvJlmU+vGjCfhDBIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFmSWAsvjkoAj0F1TCy1aC4iy7kMRCR76dOQJ6Iayqs=;
 b=Z78Cz0aXCKg32RtUhbzubEx5WGVjzXv+6VRF7AMqxifSwhLhb+HuVlWtJytaz7zTUMMuK6ETWIBJ6nmSvz5Aiff7778VdyZkCAuAVmonwAzxIi1PJaO6iyOpA+danhvFmhCEc/l7eta8YmOqV16qVxaMPIVZcfyRGOFxhon3nhwPjHUEjsfh0OVKy9ju4LmeGLKQ0HSzOr8WkdV2GqTcoUAqm5itRC5bQwE8lq6ZCJnoysFkucT/XpMpbuRMIhYKVmfenaxfIsZfv383uK6Zx3XMKrDbfFkR4oIEbgEBEeBf+CXEaa6YCEx9eN/PXCJp5CVAri9UDD+h+MOhv9q9UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFmSWAsvjkoAj0F1TCy1aC4iy7kMRCR76dOQJ6Iayqs=;
 b=G1b2/cIf8RBTvNrkEgFgxOUyzHX7EYwjn43To7bUtVVZtjCgfcC3jteb3pFp38VckFWY3ADc7levJm14C19vcFHrxdBOQHM0W/COu9nKY/aUSTWfOpczk6ih4bKBkbvbMcEfDGs1Ppf4v2br4gN7V4KWU/8DRddHR4ZQQ6xU9wga9LLZyxqGFztmR42VJ4xV7tVJm0sG+9wP35kxmJXxeqg+SZ1IxMEWX/wiVtW4VpG6zl+JGLH4/5r8/UYgmDjpQpOFaEcsyOp/y3Ulxq+K9G3u63jmaoEiytqdHKxIOIGWt/sTKt/QAOe/Cim7HVF4+HJaqqW4CvD4ew2r1vHLfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB7459.namprd12.prod.outlook.com (2603:10b6:a03:48d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 23:35:52 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 23:35:52 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Xu <peterx@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Jane Chu <jane.chu@oracle.com>,
	Alistair Popple <apopple@nvidia.com>,
	Donet Tom <donettom@linux.ibm.com>
Subject: [v1 resend 02/12] mm/migrate_device: flags for selecting device private THP pages
Date: Fri,  4 Jul 2025 09:35:01 +1000
Message-ID: <20250703233511.2028395-3-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703233511.2028395-1-balbirs@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:806:d0::35) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: fda3be44-8f33-4dac-b67c-08ddba8a591e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0c1amZTNmxRaExML2MvbFdLM09Qck0rMkZPVU5ZeE9id01uZUNuU1RleFFk?=
 =?utf-8?B?VjFGdUR1cC92dlRqdnZteWt4YlgwM25rY1d6akw2Tkswck83KzlNV0NRMjc5?=
 =?utf-8?B?QkdRT2Z3ZlgzenNlNHNyL08rMTZTdGZGWXZCU3RRbWRtYU15bWxMdEgwdHQ5?=
 =?utf-8?B?ampMUkFYaDJyeldvMGVLblRXaTdPdEFVZ3VHSXVodDFVU0dVTzdOTHN3ZlU4?=
 =?utf-8?B?OW1zQmVvOGxFR25BVFZKanR0N1pZV0FvSnEvY2tLdHQzc0lPZ01JeDk3Q2wr?=
 =?utf-8?B?bWtiYU9sV1RBRVJmWDkxejFLbG10QkwrUHhCTTgxV1dnRmdBLy94WkR3S0xy?=
 =?utf-8?B?b3dlajRVTmFXTk9LUmZkMy9kTlk0Y1V1ZHZ0d2lUUzVLWS8vZFhZWnBsZkJj?=
 =?utf-8?B?WTBzeDV2Y1o5ZUZCVVNKeDZPZkUvUnQyc3didUZxdUhYWnNoVDEwVG95N2E0?=
 =?utf-8?B?am5nTHRUZlRoU00rcTYrejhFUWdRN3RWM0hpM2pXRk1CaHh3WTBwYTFpTGls?=
 =?utf-8?B?Q0pHTDhvTVd6cmpsa3VaaUE1UFk3SC9JT3pFZGkySE44TUZZRXN2RGNXOHhF?=
 =?utf-8?B?YUEyVHdHc2Fia05pRXNsbnRPcW5rVFA1ZzRmMUoyQURvcFBJYk91N3FUYnRl?=
 =?utf-8?B?c01YeGJob1ZXYU52bnk1RktlNGpiZ2VBdHh2WVhUV0F4bHRDVjVadUI1QnV6?=
 =?utf-8?B?MVhQQ3RYVnA3dlhGUDBNZU50R0Z1VWRaQ0ZWTEZnbEsybW5UcE1Sc1A1OGVw?=
 =?utf-8?B?M3dPVGlpWkQ3NHk1dFFtbGJTRU83ZjNCbEQraVd6L25zSTR3ZmxPVjdZMDBQ?=
 =?utf-8?B?bklLbitHeWZWZnJrbEhmMGRxV1BYU0dLZFVnNnRwZnJlcnV5YkxkN0VJSTF0?=
 =?utf-8?B?aC9lVlQvVWwzOHE2cFF3V3dpVDFiL3ROT3pzUE9JcmNZTytONW5Famh3a2xw?=
 =?utf-8?B?c1h2VWhyY2JVdVRMc0N3UVRmenVwcS95Q1pidHN3b0lKSjVaeVExYk5lNUpM?=
 =?utf-8?B?eGJOQTh4eXhXdVdKKy83SWhCaUIrNlpVSGowb0NxWHc4S3l4K0ZuK2RONk9a?=
 =?utf-8?B?NmhHZ2ZqeEV5eXZES0RmbUkyaE5MRGU3enpPdDVqb0xDRXdoVmVTQUhSZHky?=
 =?utf-8?B?Y2FuK0lLMElDVVZOc25pU3lvY1IyS1R3dldYTTRHejB4QlIxTjloZktlaDBy?=
 =?utf-8?B?anpwMXQyZEc3R0x5dTV2dzRGUTRWRUtFZk5rU0ZYRmkxSHVsSEdhbmxXRy8y?=
 =?utf-8?B?MXZDZTFGTVB3OE1ad3ZuS0J4d0dDYTZ6UW5DRy9HS1lHd3RqNFdTQWU1cWxR?=
 =?utf-8?B?V2JBS25VY1lmZnl6dUxUS1NYSlpGMnlTcHNLYnVrUjVZSUwxeUNnNVExdi9y?=
 =?utf-8?B?MktJTHFKZExaL0w1QjlrUVpNS2kraS9iU0RCenkza3VNNUg2a3pxUUJNUnNY?=
 =?utf-8?B?UFdDT0JYamllNHBpTDlYV0Q2L1EycDZNUEpXd3NkOXhvbjFIaDlGajlaSUZ2?=
 =?utf-8?B?cjRMcjI1YUJnMFE4ZHJUdVVGMVNMYllYNXRjODNFbXU2Q25rakZMRkMweFd3?=
 =?utf-8?B?ZkRlVGxOaHRFaXR6cVJhaFYvZEFhK2ZSZE1VdUtmL2NvOEN2NSt3NUgyQm9j?=
 =?utf-8?B?R2RVR1FNUkRaYTVSOTExREZqMUNoQVBUN0dLOTlzMjdYUWF6UjUrSTFqN3gw?=
 =?utf-8?B?MUlhWW9Ja1MzZlVoNjlqYWpNVysxR2p5aXJucFNhbnRYaGpwdjRjTFpnbkZy?=
 =?utf-8?B?NWtnREF4U0E1OEhpRzA5TVZMSmlpZUZEWmxHOXpoTE0vaGRVb0dMK25wQlpC?=
 =?utf-8?B?STNDbGNMTFlVTjZ1UmJwUUNXL3ZIV2RtR21jK1VhQjVtMEtHWjZ5djdvNGJr?=
 =?utf-8?B?ZmUrSVNPbTBiSXpONmN1TVBhQWgzSXJjN1o3bkFqYkswMm5vOVJpNzZzSzJ0?=
 =?utf-8?Q?Vh93PHPO91s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUQ4TlpVbVpnaFp6WjgyV3o4QmxVaGF4ZWttWERUVVFaekVuRDRvdXVTWlh6?=
 =?utf-8?B?N1YvbjJ3cWM5aTFQeWREU00zZzl2UGJ3a2NqYldrT0F4cFp5eFUraDhqbE9s?=
 =?utf-8?B?czB3Sm5kUjBuOVlReDl2S1pTRU1qNnlPVkVJemhIRE9LV3RnWDMxZWR0bGR0?=
 =?utf-8?B?U2hTOU5BTnhhclozOUdkOEhGd3JMWHJwQnpiMU9XekJrVWtmR0huVEpTUXVi?=
 =?utf-8?B?RDVkRnlDV3JRUGFNT0lJRmhhN29Pdm1hNnNPRnBCa202RGY3YjBoaGxnZWU5?=
 =?utf-8?B?K3g5VHV1cGNENXRRWE12ejlQcHhVdUNuQVBuYlAxWnpsUGU4Z0FCS213a2ta?=
 =?utf-8?B?STk1TnM3VVRTc1NlalRueTZnaGluenRCMnlwNk5HOEUyMTZqRkcxcHppMS85?=
 =?utf-8?B?aUFzaG5xQ2dzbGZDTVIvTXlJSmZaOWlVM3RIMnljV2kyTTNJY1hoWDJXaTNC?=
 =?utf-8?B?RzJxWlRyamRWWkhGY0hoYk55L1pXYlZZVldtVENXYnZ6V3pWQ2h5U2dlYkZn?=
 =?utf-8?B?dGJrYXhZVzRWekxhZXp0SWRnUlhqTysvT2EvUmtVK01jMFZCZVhTc0xEN3lo?=
 =?utf-8?B?c2tJZDVNQ0pFNmg5RW1oZkpvaUZYUFl4UzJtaDB2UzFDTE9NTHdDdnd5V2pS?=
 =?utf-8?B?QXhRNDRIelNiZGdhM1gyN2V6bXlkN2MraWlCS05aZkh5a0lVOW9ZN2J3Q0ZX?=
 =?utf-8?B?UXlXYXZBQUtGUTlpNDhXV1lSRTU2NGxsbEE4VXJIMG5EOHBsOGFDTmMzQXpJ?=
 =?utf-8?B?TGFsS2JqZzdhSU5pVU51Z0VJTzROUWNvSm8zQUhaaWtOTXZMRFcxUFVoWUxB?=
 =?utf-8?B?U1UralhONm9WYnp3azNYd09RWDlwOG1LVmRjUUJrUUhLR3NtTVJYN2FGbFBN?=
 =?utf-8?B?NjRWK2VnUWdYWjJoRFJmQ1E0WDhWZzhwT0dqeUx0dVFNeVVNdHM4bmlpVkpi?=
 =?utf-8?B?RlhxMTJLcjlhbVdGaUJUMU5zUFp3WXAvZ0xZakVyWmFCcmppZTRndzdPYmNV?=
 =?utf-8?B?ZWRHaysvYUpkc25vN1RIbnQ5Sk5NaUE3cHRaSWtNSkRuaWh3c1V2OFdhRktN?=
 =?utf-8?B?MG1oZWhIMEh4U1lpNWJLb2IyZnFuY1EwTkY1QzhrakJ1NHV2VTlpRE4wOEdV?=
 =?utf-8?B?Z1dpdDE4K1lkSWl3c1NWRVJuSTRFbCthdnlDRFl3Qyt6QTJoc0NTRmNMQzJ0?=
 =?utf-8?B?b3VtRmxFN2tHTmNOck5xc1ZvZmxiNXRHYmF4dTJOOUJqdlQ4SUhQYTBHbC9z?=
 =?utf-8?B?N0UrdTZGcGJZMXloVGMrcHNRU3ZjODBPellEcUk1RGtQNW8yZWpLNE4rTEtn?=
 =?utf-8?B?c0dYMGVXbkVvZ3FkWHY3UFJvelQ0UE54cWp0K09XblN3WmNWUVVpYkpXU0h0?=
 =?utf-8?B?R1N4UXYwWURCdUxmMUd2aXBwcjMrVWJRUGViY05RSE05REF5Wlc4bHhiRlQ4?=
 =?utf-8?B?dHhWZWp5d2sralZZK2dham5QTHF2b3FQb0FmemZ0RVpxU0RUbkM0dEFjYnlx?=
 =?utf-8?B?eGVlTjBCcWk2dVIyTy9xdVp3ZHVhMHZ3WVJ6MkhzVlJRZm5tYWVRRnhuT2NG?=
 =?utf-8?B?Q0ViUThwZmovbFMrZFVEUm5vRm13NmY5WnRHZGorak1XVVBPMTJ0TlpmZDJP?=
 =?utf-8?B?cW9EZmRUMkhRUHBOZUUwcEhGcGp4c2ZPcUIzbVVHYUlHVGJOOGJZRHpocHNB?=
 =?utf-8?B?b3VjNFAzQUI3cDJCM2gvKzVHK2Vhb1lYdGdCSE5RTlNlUklKQUFLTndNemEz?=
 =?utf-8?B?Y2s4QUZteFNaL2ZyeVhEbFU5Y3NYRC9USFdxa3d2YjhiczkrTkNodGd3bnVG?=
 =?utf-8?B?aVUwbWJXUkdKa2ZBd2NRaXd6NjJFRXBOODBMZmEwSHM1SG51dVBrNExxSks4?=
 =?utf-8?B?UUthM1dZbHNNLzV1M2hEcmxjb2VHc1FKa2xWblJZK0NnMFcrVE1saHhVTDAw?=
 =?utf-8?B?WitXaXpIay9XZUxNWnZjOFY3YW05WDFYOWwxUjQvVkNHTkNLSUxsdk5HdmNQ?=
 =?utf-8?B?RW51ZzI1TllUeExCcXltZFRwT3o3SWtWVWxpOGVFUUdSM1lvckFzeVIzNmdv?=
 =?utf-8?B?UEZEa0wrWkpKcDZYem5QREszRkJ3VHN3QXB1SjZlRGdBRXJ6Zm1maU9pdmdE?=
 =?utf-8?Q?c9oMdDvhCmfgKPfguknU99e97?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda3be44-8f33-4dac-b67c-08ddba8a591e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:35:52.2898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXwQpKITgkeafMGykayVIHc5uyCh86Eg3d5xkD/gl3p2s5A+OnW+cXsjhCZ0MuB9ZCwUK+5FaANXO9Ei1g8WgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7459

Add flags to mark zone device migration pages.

MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
device pages as compound pages during device pfn migration.

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Jane Chu <jane.chu@oracle.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Donet Tom <donettom@linux.ibm.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/migrate.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index aaa2114498d6..1661e2d5479a 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -167,6 +167,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
 #define MIGRATE_PFN_VALID	(1UL << 0)
 #define MIGRATE_PFN_MIGRATE	(1UL << 1)
 #define MIGRATE_PFN_WRITE	(1UL << 3)
+#define MIGRATE_PFN_COMPOUND	(1UL << 4)
 #define MIGRATE_PFN_SHIFT	6
 
 static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
@@ -185,6 +186,7 @@ enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
 	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
+	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
 };
 
 struct migrate_vma {
-- 
2.49.0

