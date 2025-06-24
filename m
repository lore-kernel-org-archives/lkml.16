Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11475221FC3
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750751430; cv=fail; b=G4tfvaVDfi3BkJCqF9wgP9oDV1atdFVZ/UDm//zhrroKZ/wmshw5htFyeTWDAaBy9DORn+7bQ3hEVyXV87/F9stEo4l8SeKd1lJ4xS1eMup8BYkai7YggoDkuYW+aVL+vwOuKnpsAq0xOMJbMX5mdDyc+M/O3rWcuFzecq2ZURs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750751430; c=relaxed/simple;
	bh=IMEhNud3yp8US8WTTMV10/ziRzVlEkpEdGf5zlsfr10=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YVFa711YTNBCkF36T/xQJGAIwsM9aFqXHy64g5gAm+1pyxb5Y9yjxAiECWjL5Ck8WmLK0m8K8/pnESJ1xwnOb2euvukWbhqHX0wzEIQmvpYBI5E7HrWeUC3pUaW37YEMo9E4mJaFYLQnOR+B/nwJy32ou+IwCbQtAd8ougZ5uxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R6Vf2tUS; arc=fail smtp.client-ip=40.107.223.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R6Vf2tUS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+T6j8cIU11YwZN37la6HMKRVuPHrPuJnpdiZSgE5SZCiB3lx3PgDrPw7heyxi0PAH6J1Y4rSO4qok8C43p3sGlMw4O9DjAV9t4K94elxZIBJQ7A0Qmvpvpfmsy9PLkU74eZOX1cDESV+lc/9OZtdvsEt3TRUTDNYDfo7Jnba1ueeH+U8z+MWSNBMCEocIxuWYh9QalIPhlBg8Xc1wSu/I1JDyz+UnfbS9nA1H4WcKEjZWhB+ST7kFK8nrkJR7w2dYyIz7HM0LMGo6V/JPwqhgS+Pf0zKRD9eLvLDMcgppIaaRIqhNQmp5BxzDsXlSizZNZ38jP3i5iFcHZ2WH6Q4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUOidMYqP9cgD9GidWzPfIExe2Of2qzn4gtfIsl9okQ=;
 b=Ec7EiceC4gr223Tl5lAL2Us8qkL3Fz3m6/TsLHxRlwmsYaoHyw+HEREXxIEQF7JfxWsV5UWb6ZJ1fdnSRyVFDo2ujq6p1+bo2Qdkx+vfXOovhhkmnj/xDm8k5AarxwQWgTr21giCj9cSy2mcQ4OIxNLPddI6EMIXZy9vnZGp0i+Xhc+Z6tAIyZtVwZqIy6gFrHI2SNw3lO0hgVY7GFcXXze1Xvn8XBPXu8L2S7zlonJ4vWo+Cff4JyQRsBCBS1pZ9c0+8M2424CBRC2tD4VKhmuB9ISiJN0IopzJ6KjDLxpUQ2C+idzTKLrXQWyv8/TOK1brWzZBIqJKCTIsLUX5/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUOidMYqP9cgD9GidWzPfIExe2Of2qzn4gtfIsl9okQ=;
 b=R6Vf2tUSE6oQ0Xsrw4OHWD/XQtczC3NK2NkOQSCTHLgKBPVR8E/enF4AwY0G9S9gGlRHC1s7yJgixfWwN2N9E7X4k+Elt3lCDbK0de4sY9FnvLyyznc8j8kHchCPGSdSkIUwOpNQVvtFWqbMXlirGH/Ht27Fd4QLoMAhlRQ1nJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 by IA0PPFFEC453979.namprd12.prod.outlook.com (2603:10b6:20f:fc04::beb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 24 Jun
 2025 07:50:26 +0000
Received: from PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3]) by PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3%4]) with mapi id 15.20.8857.022; Tue, 24 Jun 2025
 07:50:26 +0000
Message-ID: <86a44c07-bf95-4e69-8db4-4523833b923d@amd.com>
Date: Tue, 24 Jun 2025 13:20:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V2 12/13] trace/kscand: Add tracing of scanning and
 migration
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: AneeshKumar.KizhakeVeetil@arm.com, Hasan.Maruf@amd.com,
 Michael.Day@amd.com, akpm@linux-foundation.org, bharata@amd.com,
 dave.hansen@intel.com, david@redhat.com, dongjoo.linux.dev@gmail.com,
 feng.tang@intel.com, gourry@gourry.net, hannes@cmpxchg.org,
 honggyu.kim@sk.com, hughd@google.com, jhubbard@nvidia.com,
 jon.grimm@amd.com, k.shutemov@gmail.com, kbusch@meta.com,
 kmanaouil.dev@gmail.com, leesuyeon0506@gmail.com, leillc@google.com,
 liam.howlett@oracle.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 mgorman@techsingularity.net, mingo@redhat.com, nadav.amit@gmail.com,
 nphamcs@gmail.com, peterz@infradead.org, riel@surriel.com,
 rientjes@google.com, rppt@kernel.org, santosh.shukla@amd.com,
 shivankg@amd.com, shy828301@gmail.com, sj@kernel.org, vbabka@suse.cz,
 weixugc@google.com, willy@infradead.org, ying.huang@linux.alibaba.com,
 ziy@nvidia.com, Jonathan.Cameron@huawei.com, dave@stgolabs.net,
 yuanchu@google.com, kinseyho@google.com, hdanton@sina.com
References: <20250624055617.1291159-1-raghavendra.kt@amd.com>
 <20250624055617.1291159-13-raghavendra.kt@amd.com>
 <20250624160958.e36196456a4c8befc99717ba@kernel.org>
Content-Language: en-US
From: Raghavendra K T <raghavendra.kt@amd.com>
In-Reply-To: <20250624160958.e36196456a4c8befc99717ba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0245.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::10) To PH7PR12MB5805.namprd12.prod.outlook.com
 (2603:10b6:510:1d1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5805:EE_|IA0PPFFEC453979:EE_
X-MS-Office365-Filtering-Correlation-Id: 77282b62-f371-42be-0872-08ddb2f3c7bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1QxVjZCVDhFU0xCNkZxTFQwTHc0akFaZVNWelIvYlNINlQxTWVaa2hCK29o?=
 =?utf-8?B?Y1habkJlMGhSWlZDeERsbHdCUVB4VlVhSFJFRU1kRnBUNndUUFJmOUhGMDNl?=
 =?utf-8?B?N04ydGJUTTZpbWZVWmxLTnJKbGsvajh0dnhUMXZtalZYUWpNN2YrV1BCVHd4?=
 =?utf-8?B?bTJ2ZGxhK1dDSS9TMzYyRzluaEdRb01GbFRaMjNQK0NSbjMwR2lONFArQTFV?=
 =?utf-8?B?SmtJTUpKVlBKaXEwd0JCekczZG1aSWFIRTdLVkRRdnpmQ252UFNWTkc2Y0RI?=
 =?utf-8?B?SG9VMTZPRk5LRkpwZWRCa1BpeFg5M2p2eFQycFpZNG5mRXR5UTF6ajB3SWFy?=
 =?utf-8?B?SHJjZTlzTHNTVTc4R1NFQ1ZSQzd5OXl5UUlWTnlLalM3VHAwK0lRcUNtWmFt?=
 =?utf-8?B?RjhiRzZ5OEc4Z2s2WVhnRjNBMWNSaHV4Z1g5d0t2c2pDZ2UrL0lKeXhhczlP?=
 =?utf-8?B?L0ZvV1dTRHo0dTJrVjVjbFJkemRvSnJJeW0yVnNqSHNyTXZvUWlHNHZ2UG0w?=
 =?utf-8?B?eUN0WW93MzlpSXRHdldsWml2ZWZnWUR2MHI0NVdiN1pTbmF2d0prY3VRdkpC?=
 =?utf-8?B?cEt0OWIwaVo5Q0FDY3BQOTEyVTJwR2c4bnI2V2d4NVFyQnVOVk9Dd0tHSkdE?=
 =?utf-8?B?N004VitqNnZaenZvMFZ2UlVydVpOVFFWL1VpVUo3UVdXcmk0WVVJUCtEcHdJ?=
 =?utf-8?B?ZC9PM1A0aGNYU2VGMngzMDZiYlBpcmNIeTlKZ3hxRllCSW8zRitSSk1Odldz?=
 =?utf-8?B?R2JpaE1udXJwVEhIV05temN0Qms4MnFNZTZSUW5VY2FqejVpcDAzSXRlelBv?=
 =?utf-8?B?cks3VjUvYXlLeHNNTnlxa0NTSmpqeGpTOG92NGc1SWczcGZOb0VsdFJyVUtt?=
 =?utf-8?B?dWFCa0tZcWVyMGp4cElrSms2OTZ3ZTdsTWEwM3NMb0xQZGU1UXNTamVwQ1NG?=
 =?utf-8?B?VEdETWQ3L01LQy9saVBYZXpoRlByTjExeVRFb29pY2VMeEZXc3ZkQ0prb1F1?=
 =?utf-8?B?MFBnRDE0cXY5cnBseFVQdmdPNERQdklTaVNYZEFpMUxyb3JTb2RlUUNHd0o0?=
 =?utf-8?B?YXJHcERVWnN2VGdSdWlOZCtiSjJyWUlSVlgvaU83U2c1bkFFL1REOGNubGJz?=
 =?utf-8?B?NmpLQ2prTDVNb2ppMnMwUzdUS09WbE1PbjBxNVNTU2FlQytlSmZkOU5Samp5?=
 =?utf-8?B?aEkzYXlKNHhiRVBDTmtENmJYN3QzTURoclRFZWNQQWtkckNyYjBNdmNsZW4v?=
 =?utf-8?B?bGJyQmhhWXZHbnFHR2plcmFRVE1JSjM1Nks3Vnd1RllkdDRQZkJlZGNkQlU3?=
 =?utf-8?B?OXd6UFVqaFZ1UWJyMElGbXZURFEzczBCS1NIZ3orVExaUW55eE43b3BWb09F?=
 =?utf-8?B?THFneTQrWXZ5M2Z5R2JTWWF6OXh3UVhKa3B2b2FKOVpKMnMvck5lK2dyeDZL?=
 =?utf-8?B?NHViaFh6WEhOU2M5MC9wTlkvQlVjTUpjaVpkODlRRklsUkRpZTRZV09ONkF1?=
 =?utf-8?B?TGZDY1VJaGFXOTBFNjd0TVJ1MWpTTGpWeWhmZlkzYXdwRm9TMEtaVlFBZHRU?=
 =?utf-8?B?eVZxL0xoOXhlWTI2Z0J3Vk02RjZ2UElkSk5vUlFPTlVaUVF5NjFpNlQxK0dr?=
 =?utf-8?B?Wi9IVXlQbkM2bVg3aFZlS2xKNW9RRTBEd2QvbEJFNzJTeWFVWjFwQ0RKU3Bn?=
 =?utf-8?B?S2pYNU1wbm1Ua1BxNU5UNmsvejlLZ21oZU9LSXhid2VZdlhBMG9yY0xvVjRC?=
 =?utf-8?B?NVQzai9pa0ZRK1d1bmdBRlRtcUlqbGVubkdSbUJuYWI0eHBTUVNqK2NDSEQ3?=
 =?utf-8?B?Uk1ZSDlROGxZOE9RWnM2VEh6L1pMTnNyT251SWdMclZYZ0VZVzhndHVYRXNi?=
 =?utf-8?B?aDRkRXh5QUo2d1RrNnI0REJLTkhNaXJkVFNDY29jUytZTzY3V3laUjZ2ZnNV?=
 =?utf-8?Q?0i0Miv5P7Xo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5805.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NldDVVpIM0RhQlVqOG8ySm1kK3JZK0dOTkRpajBjUWJXM3Ezc2NsQ2M0LzBR?=
 =?utf-8?B?eit1c1MwWm9zL05YdGFsZXQ0bldmYnk2SndHOVl1Si9EeVdlM044TGxRajF4?=
 =?utf-8?B?SmVrRWpTTlpuVDV2ODVtaEU4QlJMRWhobHIvWHVoMjNoVCt4MmNEcXloMjhj?=
 =?utf-8?B?aFRVcnN5VVVLK0o2YTdaTmkrWm5YTk9aL2VHQmpnRWhpMWxuN2doUjlFK2My?=
 =?utf-8?B?T0lEU0E1SDZWL1dodm5CTGZzaGJHa2ZsejU5ZHhzRE5Pd25hcWZESnFtcUhh?=
 =?utf-8?B?R3B5cXpqYkZVRXdOY1hUMHBXczI3VUk2djdxWVhPZG5LOG1ENzVHcjZlNDFM?=
 =?utf-8?B?UUQxQmUwQmQrWCs0emM3YXFFb2o1c3RMMTNGQStJWmNMSk9xcjVlYVdLYmNP?=
 =?utf-8?B?TTZoRDBrM2dPMnE4T0lDZGs5WGZPbzJFMFZrc0IvdmpGa2g0UmFoWE1jcVFy?=
 =?utf-8?B?dzR4elo0ejJZeitPZmlxdW9vU0NLV0k1Y3pac0hpRWRIcXZsRXpaQTRYc3VI?=
 =?utf-8?B?Z2M3TG96MEJDb0FMSWZYMjNQc2twck5PclU4cWdrRlVCYXAwMjYxMURibUxS?=
 =?utf-8?B?aHlNa2lPalFBd015ZDlvU2FKNmhkOUdxaEZGclpaUXJ6VWhuR2RnOFpuRFVO?=
 =?utf-8?B?ZGVDdW9PbVEwUkUyZ2dlKzhJRmtDeG5ESVlXdnBhZjduNXU4Z3BlVFhLVjQ1?=
 =?utf-8?B?RHlSY1RXZ1dSZ0JMcngydGhKV2wwcDFWdDRQZnFWSVJiVWpudlBkNWFVQ01C?=
 =?utf-8?B?cWpzK0ltQmgyMlVxS3NEK2lpWUJWc05OMVNvSmNPL0QyRjJHYWJsMVFSd2VP?=
 =?utf-8?B?bVJnR2tWSGtPNmNVWjFPNFZIV3lsdkJ6MlRrMmxlZzhIK241bGplN3J6Y2cr?=
 =?utf-8?B?bWdRdDVzQlF4T3BjREEzdDJLWHpNcjJNcU9obElIZFA0T0s5aGhRRjNxT0Ur?=
 =?utf-8?B?UHF3Nm8rT0ZxTUg0cEpSTjV5RjE4V2VmNUUzKzBjN0ZnZXVXUWNmbVBTNzVk?=
 =?utf-8?B?ek1XUFhSelB2czhZSjI3aW5wdS8vKzRhQjNUeE10STJVRkhqc2RlOTRPMjhE?=
 =?utf-8?B?VHpnUlNLZDdFYnRmK2FucGsxVDdWdnFwTlMzK04xNjZibnZ1SzJhZTRsenZ4?=
 =?utf-8?B?MGpLU09RdVdaT2FMZUFsSjdrM1JnTXhlWTVmaXFmWkpMdkdYbnlTRWV2VVBP?=
 =?utf-8?B?aDNXdXBjWU5ZeEYyL000eXZPQkorTmE4SU5udWZRcldTdWNrNEZCUStlUUJY?=
 =?utf-8?B?dFMyUncvMWpwUjl1MnNsZEhjNGxDUmZrVzhrUUNIUXJLM0p2NTBNYnBuL2hV?=
 =?utf-8?B?M1RDRC9ZQVc5V3drV1c2TDFXcldzSk5FMVF4MnRPaERIcXZValpRZVFtbnZl?=
 =?utf-8?B?SXhJVTFvQkVITU9JK2o2M2dJeHZlU2huL1BBU0cvM2JQMUFyT3ZJTkFTWDIv?=
 =?utf-8?B?WThFRkR3WjkwaU9qekdkK1RJWVl2L0RBb3hKTG9zWUVIZCtQNHR3RVRhSnVR?=
 =?utf-8?B?b1h4L25iUklmL015LzNkYjVsRmN1WDczRDNZSUNYUTM4VENINXRlYzJJWTVq?=
 =?utf-8?B?N0ptZnBvTHFGMnFqZDNZWkdydG44NjZXMHdQQ3c1MCtoNXQrNks1UWpLQVFi?=
 =?utf-8?B?MVY5ckVHL1VFNFVQeGJwazF1WTdaUXZONEJmd2JoUTlpYUE3VE9KVXgzSFFQ?=
 =?utf-8?B?RDdEYjV2ZlplK0kzVm5ERnBiakl0QUkvTnprczRYeUxKajNZQWxEbzRublUw?=
 =?utf-8?B?UFFyQmd3amsvd0VhQlFGbFlRM1Z1RXZDVXA2ZVFoTWdvaDlzZEFpMlhBMUtm?=
 =?utf-8?B?WjF2Sm5xMWFaczF5UlNYWTdkLzFpVnZwSDhqNUVlUndwZmlzM2xMSEVwQ1M1?=
 =?utf-8?B?Z3dYUzRUUGxqZFkwN25sTHdnK2hRRGQrVUlzdXpTSGEvV0M2aXpjNU5rTzd2?=
 =?utf-8?B?U1JpcE5HMjB6dEFyQUZTaHdBQlZ4cG92K2ZyYkdPaU1WRWRza1RnaCtWYlZM?=
 =?utf-8?B?dXZmZ2l5dXhra0VQZTJtNGoxdXk3aVNQUXNwSTRRUDZjUGZleGdHTXNMSHJy?=
 =?utf-8?B?eTkvdDgyWUhHalpPLzZvN2dRWHFkTWRRVmRPT0ovVGxqMERQbnRHYWgrL1VG?=
 =?utf-8?Q?2rLgbCjDzJe5g84Jfr5TprMGf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77282b62-f371-42be-0872-08ddb2f3c7bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5805.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 07:50:25.8331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKZS+QeMyYdwrbn8XrRI/hHS6JJd1cZvQuTzRetSpIGTzsKmTi01iIrkd5iyfy9jh56imvh8UCPzFo6FGjt78Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFFEC453979



On 6/24/2025 12:39 PM, Masami Hiramatsu (Google) wrote:
> On Tue, 24 Jun 2025 05:56:16 +0000
> Raghavendra K T <raghavendra.kt@amd.com> wrote:
> 
>> Add tracing support to track
>>   - start and end of scanning.
>>   - migration.
>>
>> CC: Steven Rostedt <rostedt@goodmis.org>
>> CC: Masami Hiramatsu <mhiramat@kernel.org>
>> CC: linux-trace-kernel@vger.kernel.org
>>
>> Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
>> ---
>>   include/trace/events/kmem.h | 90 +++++++++++++++++++++++++++++++++++++
>>   mm/kscand.c                 |  8 ++++
>>   2 files changed, 98 insertions(+)
>>
>> diff --git a/include/trace/events/kmem.h b/include/trace/events/kmem.h
>> index f74925a6cf69..682c4015414f 100644
>> --- a/include/trace/events/kmem.h
>> +++ b/include/trace/events/kmem.h
>> @@ -9,6 +9,96 @@
>>   #include <linux/tracepoint.h>
>>   #include <trace/events/mmflags.h>
>>   
> 
> Please make sure the event is not exposed when it is not used.
> 
> #ifdef CONFIG_KSCAND
> 
> Thank you,
> 
[...]

Sure. Noted. Thank you :)
