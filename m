Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11020072.outbound.protection.outlook.com [52.101.51.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECC01E102D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.51.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445521; cv=fail; b=qRj0IDHaCM6kkbkut1onxp04k/A6cTfCf0wIOrwjvPZqshTb8O2YOBgj3qagU8dVlYTP3lLtWeg19yYHjy9ttQnYq+/t538AwyE4pN7XPyC1bJywx6IJ95AgQIZFH2H4fR0L87VWOMLZSlbBO0EC6BxR5w0R8UdLIzM9Oxi8iiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445521; c=relaxed/simple;
	bh=KUiiR5sAT6Q+vt3LPUCUt+NsWChnbDPGj6T8zREW2qA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EUlGV1hYSCYnihQs/p7DgNoe/wNU7H2XMGr6+RmQkPluyp40OXdaStGhah1JoT3B1RRHAmEEH1tdLrlgeF7Z3JgFrUdUdFkbMJSn0KtV00QmyOqWOk/QZW+gVV/FFrx8NuorYPl+plKYet3ZDLLCKOI8IiKINWhC6mfXaZJLMLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=Z+mtgut+; arc=fail smtp.client-ip=52.101.51.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="Z+mtgut+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmuwhqGNuNnzrApwXAI1Ul8URwNRkYAyZJth/nkVB4XKbMCUriiUK3uyobVreKY13+tLVGbPH39WXgJLZ0+BLJcgF35B/o+fPwjgffGiW24dau5VMb3v9CyuP4kf6ctWYe92wwWqvJDqQ+jPDiOAUDINKB24gpoQBBQyr3W5flIbgOtl7WqQaU0gHoyr8pfXAlQ8nKylihIQvVkGj61J2yrYbrtWlPUNWb08PFzg0DrVzvjQPTeo6xxN/mhT9lG+RtlkPE9u6EFFx6CQHUUC/hUqlvJ7cS3CJsjWY8WLHGkUVmjj74+jaiFcUWWiZX4VSg8TD3yeKkNFMQsvZwA8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+PqIrpP2tN3jBRlpujatrG99RDuDvo/HA47gvOv6jg=;
 b=nXgQ67WujtDNXWDFEyYENdyI47AXWsL6bCKuFsWf50A8boEQvZkBCR52Sb97gO0hS0Y2MVInh0MoUbKzYHLkNdbOBy4OiKB4MbO9vE08QOo40D1KaNVnbyNxqZ0PV5wtmOXAQ2tEpQBAl9BzSpSbr9GNYLpU5qtF2F9B24/xEKVm+rMCu45YM+ItBt2xfQH/DW7Mwdn4UiB4Q8c4PLPzsNACrePkcrARs8A3kJmMqTWr2Jfwm49EeNaw4fohAM6VxgPv5lMPLodAwP1oFEw/mjXnZO2W51F/svwzBIL7zd5QuS2erW1hsCoPSGWvStUyjtpzgSwMvJo3XMPbutKwVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+PqIrpP2tN3jBRlpujatrG99RDuDvo/HA47gvOv6jg=;
 b=Z+mtgut+GIKYcGhvTrVQZ7QihEK5/Sa1RcOYsVnf9B2fgmm8etco9Ow3yfFM4vLWnIfnHgeWkEOApUnVKZsncLGDgqxhPkfkX2CsYxXNVtBOdRGzAZQo2L5Q7irxmta38IZ/tujCCHFadkTbhIIlBPRGSlciu0Vkrd6S9nX5MCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 MN0PR01MB7634.prod.exchangelabs.com (2603:10b6:208:376::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.26; Wed, 28 May 2025 15:18:31 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8769.029; Wed, 28 May 2025
 15:18:31 +0000
Message-ID: <0769dbcb-bd9e-4c36-b2c1-a624abaeb5ce@os.amperecomputing.com>
Date: Wed, 28 May 2025 08:18:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <3750d3f8-17c6-4bb8-8107-215d442e4ec3@os.amperecomputing.com>
 <2fb974bb-1470-4a5f-90d5-97456140c98f@arm.com>
 <22b53cff-00db-48f1-b1e8-b11a54ebb147@os.amperecomputing.com>
 <4794885d-2e17-4bd8-bdf3-8ac37047e8ee@os.amperecomputing.com>
 <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
 <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
 <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
 <2ab5f65c-b9dc-471c-9b61-70d765af285e@os.amperecomputing.com>
 <239d4e93-7ab6-4fc9-b907-7ca9d71f81fd@arm.com>
 <1141d96c-f785-48ee-a0f6-9ec658cc11c2@os.amperecomputing.com>
 <9cdb027c-27db-4195-825d-1d63bec1b69b@os.amperecomputing.com>
 <e3e6a3e0-3012-4d95-9236-4b4d57c7974c@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <e3e6a3e0-3012-4d95-9236-4b4d57c7974c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0032.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::45) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|MN0PR01MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6077bc-22b4-4ef3-83ee-08dd9dfae773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akdvYjZUNC83alYrRHIydzA2YnpMWm1yakE0TUZHcmllanNDTjUwQ2hGbzFD?=
 =?utf-8?B?RFhTcjZuWUlXamloZDlDQldXYThmYVN2ZGNmbmRJbmYvdU5tSG85OTIyL05a?=
 =?utf-8?B?WFlYa0VwUC9nd0NFMVpmQ0RjNERWZkxSdXdBaEVGalpOTWlEZ29TTFEzQmxz?=
 =?utf-8?B?eDBSb0N2K2FtNXd5UCt1K3AvT3YwRjNjdksvSGcraGhxQWw0T3QrRzh5Q2FU?=
 =?utf-8?B?RmZnblZlcGtWcjNhR1BaVjA3WWMrdWp6SkNkU05MdmJ6ako4djlrSGdFZkhR?=
 =?utf-8?B?VWszOHpma003dXZkaGNidXRENWVEbG1FVXI4ME1JSE1TZnZ4eFhZRUNyU2ZM?=
 =?utf-8?B?OFR3REdTYWZML0tZQk91eWd6bTk2Ly81aTdGNml3T1Y5WGxKbGg0UGhhZS9E?=
 =?utf-8?B?RmwzUTRnYXZFdVdhVmNkVHMrZUtyaHBkTHgyUWs2b09KQ1QxVHo4RDAyaHQ5?=
 =?utf-8?B?TFgyVmtYbmxkMXRqell3a1NLbGhyN0NSLzlNcXk5NGg5djFpZWVaZEVOYW4v?=
 =?utf-8?B?TU5WSlJpa3B2NUNLWk9vTEZGNm41emRYNEsxczY1Um5PRy9ZV3NWZHE1VU9G?=
 =?utf-8?B?UmJydytaaHUwT0Z5MUFvdHhOWmFHeUVVWmhuUWF0bm9xSmpkWXB6dnVBODF2?=
 =?utf-8?B?TjYxUHBkOVMvZ3huOVdhZ1RPaVlxR1I3U1RFWjRYQ1NqS1ZQeldkT2o3Umwx?=
 =?utf-8?B?SEpiRXdxYXhKSDZ5WnhyTGZ1a2xoMllwMUF4N2hueXdLNFdJWXBQbFdOUzZI?=
 =?utf-8?B?dDFEU2dDY2ZEWkZMSm5kaHE3YjN5NDZTUjlPVFdlay9MbmNUWDhURUZMVE9o?=
 =?utf-8?B?by9IUXpib0NpRXE1SlYxQW1XMThoVTR2b0dVejgzWUVybG1pNEVsd05qQWho?=
 =?utf-8?B?Z0dReXlIYjZaTkNCb0haUzFvaldrZm9veDh4QVRVRlNKL1RYZHpvM0FnS2Nr?=
 =?utf-8?B?dWo0dHJiZ0JMbk9UTEZ1TEZTQWt2Zm9iOEIxY0cyblh4ODEyL3lyakRqcVJo?=
 =?utf-8?B?VGNvQWNabStGcTdiZVpRYWlmdFRFeTZMYjBBM0NrNGdDQkdPdlVqR1hYWkZ0?=
 =?utf-8?B?cDAvaDB5cWVmaWE1ZXNmbmFRbENLTjVqcDdlUWRFL0dPSVFoNlpIVHNlUDhR?=
 =?utf-8?B?Y2FObE9sd3V2Sm1oKzhlVnI3ekh5NjlOV1R4TG1VUllKSnVFSWRoNEhlUmZp?=
 =?utf-8?B?cXdIOGltS21WSFNpR0hiOUxGYjhXejN6bG1nbGFHQUcvK0lvbm5FdkdPdmwr?=
 =?utf-8?B?eWUrWlF3ZS9EYjhmbGdvRElPeHBHbWMvd0RpMktwUGlwZWdBZzJUQm5NcExC?=
 =?utf-8?B?bVJ0VGEreHRxaVlpVXVNUGptdTF1WjVmL1pGbmxKU21QaXBvODM1dWpiRCtC?=
 =?utf-8?B?UVVYaFJrQWF4emVJMjN5ZTZnWmk2T3JVcEllUGNIUlR1OXNQZ0xsL1JlZkVR?=
 =?utf-8?B?SlJyazUzNVJYZFdsazNJd3Q0b29XUnNiSkVGall1VFJ4blc4bEp4d3VwWWtt?=
 =?utf-8?B?VEZoWHBSMGdrTGJDYjZTL3IrZWlLMmQ4Mmo1c1p5eTJjd3NnOEpRd2gyY1FH?=
 =?utf-8?B?dVpFdHl1MllmTmdSUVJWVG9udFhOZWt6SVZkWWdIK1ZBTmVKZE8zV0RtZE9E?=
 =?utf-8?B?ZjRNUFpCVXdCVVJSQU4rN0t0bEF3OC80S0VxVnVwRDZTWUsrVXpsdTNsYzg1?=
 =?utf-8?B?ekRIV24yeWltaGlyTE1ZcWg4TE5ubG9WalkwcmpBWG05b1dRWG9TQnF0aUlZ?=
 =?utf-8?B?VnhBdlJnWUJLeWx3TWQyQVQ0TUV3TnIwWFNCek9kY0swaHpOeE5VTzg4a2dB?=
 =?utf-8?B?RGREVXNQNGxjWDliSmdsc2M3NjBzZkRkckxBcUkwcWsxK2VtTzRHTi9HQlZT?=
 =?utf-8?B?c09GcXdsQ29GM3NJNm5UaGtHdkZsbFk3YmZUbUlKUGthY1BYWXVFSkluNmVF?=
 =?utf-8?Q?O6SD3+jrnbQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1pEa01wMXVETzlpcHVkNWNUaExNQ2czOHFQcDl3SDMxYVowSEZvSkdVTVho?=
 =?utf-8?B?YmFrdlFKYkNOeW1XdzBVY2h0M1dLRGE0eWd4cTNDbmhIVjdLaGI2MGJNSVhB?=
 =?utf-8?B?dmVpLzdLYVZsSTMva0RjcnplVU5aYVIxN0E3S2d0bWp0L2xQNWtMMk5BQW8z?=
 =?utf-8?B?ZkFoUlk3L1NKckpzaEVFdE01RmE3bkpsVzYyelZSc0psOGNMZGd3UnQrUkNY?=
 =?utf-8?B?UVhQR1pHbnRqaVJWMXlEN3JqajlnS2I0QmxQeTVaVjhyenNSSzFIMDI1amJN?=
 =?utf-8?B?V3ZMYlFCVk5IQUZhWkc1YnA5RmxFZk9PRkZneUhkZTNZYlJra3RBNmhuSkI0?=
 =?utf-8?B?MVBGdnBBUG5WeU01WmFmNWRGdStaQS9kTG5DSWtIUWhkQ2x4UVE2TnA4V1FU?=
 =?utf-8?B?amt6QUw5MlNkVnZBejZ5VW1aSlpHNmJPL1RzZjNjM3U1ckpMelhoN013Zito?=
 =?utf-8?B?bVcxbkNwTnZlV1hKUFVtU3BZN0k5M2FvTUJMZzRuaVVVWFhLOFVubkpKUm1U?=
 =?utf-8?B?NmliZHhjakxRSjB0WmR4emdiZUxEQ0VoTmc0dFhmZnRMdE5zUHh3OVcydDV3?=
 =?utf-8?B?MC8xbGlRcTBvcjJrMzdSTWJjS0lPTzhhSWRYZ1BFSjRmQ2xWc2RQSXFIM3cv?=
 =?utf-8?B?LzUveHJnczIwTEt2QUNsTnhTb0s3S1UwZHJvUXpNYTBpclVnNlJVemZSWXZt?=
 =?utf-8?B?OEI5a3lQKzdZSDNkYW1oeFd4cWFicVVmZXgzZW12T3hZb2xmQXZyK2tZcndZ?=
 =?utf-8?B?RFdqZ29BVTRIL2lyNTJNaHMxTWRlK21jUHo0SmYwTVlhK05GZm93WnhFY2k5?=
 =?utf-8?B?MEFxYWZabEQrcmV5VUlXK3RJSXpFeVk3dDJDcVJnSXlzZWNRMTBVY1FyTGF0?=
 =?utf-8?B?YTRycW00MlBTV29BRnlwZmtCY0M2cmNyMFRBRGsxZERWaHBzNHZya0NVa3Bx?=
 =?utf-8?B?M2R5WHE5Tk50c2ZSODB6MFg4RjNwcGtNU01EbXlJY0l3Snd1cm1tUFdjYlJu?=
 =?utf-8?B?RlQ3T3FIOTRoVUZ1ZDA2SkgwT1R5QzU4MUVmeVhVZHhxMVN1RUx4eXZFNGM3?=
 =?utf-8?B?MXZNbzFjcUh4VHV5MGlqNUhlVUFySTFHTjdMcUdWck9taktVcVZrMDZNdTdt?=
 =?utf-8?B?dmtVOWlISS9qdWFycVNhTVZlalB6VCtzcVJvMTRLMVBBQjVXbjVKWW91anFn?=
 =?utf-8?B?Q1BsWjRVQktRZDh1K3pmN3dHdmFuSDVxemVpTXNZSGdpalBBcklWUkV1VHd3?=
 =?utf-8?B?TWhQeWtuaUVEbzlXZ3UxVlZSaDg4RWJjTC9MdjFPeXE1VEJtM3F5SXB1eEN0?=
 =?utf-8?B?Yng2aG5ScVYxSGNtK2t6bzVIbElkams2OXNiYk10dmI4Vm5Xcmd2VUs1Z2tH?=
 =?utf-8?B?UjZLYkdmQndnKzZ1TzZkRVZCRDlyTEVEZmpJRzU1QzVZcmR4MzFudnVuWU9U?=
 =?utf-8?B?S0o0RmUza3ZQTVhodTBPMXZyRTJZRlcxR2RWeDg2eFpVMTVXeHpXNW9lREwz?=
 =?utf-8?B?d2FEdHc2VVZkYVQ5bWJnUGwzT0cwM25EWEZYQk1NNHl4Vkh0NUN1WWRjaEpV?=
 =?utf-8?B?enJGT0ZHbWpJYkgrVHU1KzhVTjdrdVUyYTZvNEpJd2E5VzBZVXU1MFdWMjhL?=
 =?utf-8?B?SHo0WjNyNDBqa0ZDZUdNZnhwYURvdnFhaFRjTXAyR0pNVXJkTFhrUFkxQmtl?=
 =?utf-8?B?UmRLa3JUOS90bTQxWDJHdjNMSDFSZ3oyMXBzbzZVZkhNaXVGd1E2dVR5L2FJ?=
 =?utf-8?B?TkY0WTJBS3ZtV2JiaFA2dm5qMmxNN0VOejhVZXFLbHJEM2N1MGZxdjFXTCtB?=
 =?utf-8?B?aW8wUUIwcitqRmZWY2pZN0U0NlRhUWUyTU9LUFl4Q2ZvM2F1VFFqbzhBNnFF?=
 =?utf-8?B?WTFLT1dCVWZudnRtc2VVZUFlZUI4Zlc1b2plZno1dG5jT0VyT1JTL1RLc0FQ?=
 =?utf-8?B?REw5ZjVYN2duKzRraUpTYXZoT25TZk5vd0JMWVcvN0VINUpjMHdrSHFrbHgv?=
 =?utf-8?B?YmRnZnpBNWFaUFJybVBUamxUY1QyOVVVV0xrYjZzbjN0ZDJSU3VEWXlBa3NI?=
 =?utf-8?B?OE1id0dYN1JKV2JVMG8wNG9KTmpMUGtkMTlIMmtTRTYrU3o1dmJES3Z2Uncz?=
 =?utf-8?B?bVFwb28zbmhCN1B1YWZ5WVRucEt6YjJ4QUFkUm8zWVBOQlJpK21lYnJxSy9B?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6077bc-22b4-4ef3-83ee-08dd9dfae773
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:18:30.9125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hw2k8NdD2YUXQ+s8o9sf++se1tW1+3dpqiGzWLXSrCOYLt9cggkBLv06ZKsIwv+MOBOU1hPBsb2PEUq6h3mDHzY4yPtwyZXO5LIjCtTWd4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR01MB7634



On 5/28/25 6:13 AM, Ryan Roberts wrote:
> On 28/05/2025 01:00, Yang Shi wrote:
>> Hi Ryan,
>>
>> I got a new spin ready in my local tree on top of v6.15-rc4. I noticed there
>> were some more comments on Miko's BBML2 patch, it looks like a new spin is
>> needed. But AFAICT there should be no significant change to how I advertise
>> AmpereOne BBML2 in my patches. We will keep using MIDR list to check whether
>> BBML2 is advertised or not and the erratum seems still be needed to fix up
>> AA64MMFR2 BBML2 bits for AmpereOne IIUC.
> Yes, I agree this should not impact you too much.
>
>> You also mentioned Dev was working on patches to have __change_memory_common()
>> apply permission change on a contiguous range instead of on page basis (the
>> status quo). But I have not seen the patches on mailing list yet. However I
>> don't think this will result in any significant change to my patches either,
>> particularly the split primitive and linear map repainting.
> I think you would need Dev's series to be able to apply the permissions change
> without needing to split the whole range to pte mappings? So I guess your change
> must either be implementing something similar to what Dev is working on or you
> are splitting the entire range to ptes? If the latter, then I'm not keen on that
> approach.

I don't think Dev's series is mandatory prerequisite for my patches. 
IIUC how the split primitive keeps block mapping if it is fully 
contained is independent from how to apply the permissions change on it.
The new spin implemented keeping block mapping if it is fully contained 
as we discussed earlier. I'm supposed Dev's series just need to check 
whether the mapping is block or not when applying permission change.

The flow just looks like as below conceptually:

split_mapping(start, end)
apply_permission_change(start, end)

The split_mapping() guarantees keep block mapping if it is fully 
contained in the range between start and end, this is my series's 
responsibility. I know the current code calls apply_to_page_range() to 
apply permission change and it just does it on PTE basis. So IIUC Dev's 
series will modify it or provide a new API, then 
__change_memory_common() will call it to change permission. There should 
be some overlap between mine and Dev's, but I don't see strong dependency.

>
> Regarding the linear map repainting, I had a chat with Catalin, and he reminded
> me of a potential problem; if you are doing the repainting with the machine
> stopped, you can't allocate memory at that point; it's possible a CPU was inside
> the allocator when it stopped. And I think you need to allocate intermediate
> pgtables, right? Do you have a solution to that problem? I guess one approach
> would be to figure out how much memory you will need and pre-allocate prior to
> stoping the machine?

OK, I don't remember we discussed this problem before. I think we can do 
something like what kpti does. When creating the linear map we know how 
many PUD and PMD mappings are created, we can record the number, it will 
tell how many pages we need for repainting the linear map.

>
>> So I plan to post v4 patches to the mailing list. We can focus on reviewing the
>> split primitive and linear map repainting. Does it sound good to you?
> That works assuming you have a solution for the above.

I think the only missing part is preallocating page tables for 
repainting. I will add this, then post the new spin to the mailing list.

Thanks,
Yang

>
> Thanks,
> Ryan
>
>> Thanks,
>> Yang
>>
>>
>> On 5/7/25 2:16 PM, Yang Shi wrote:
>>>
>>> On 5/7/25 12:58 AM, Ryan Roberts wrote:
>>>> On 05/05/2025 22:39, Yang Shi wrote:
>>>>> On 5/2/25 4:51 AM, Ryan Roberts wrote:
>>>>>> On 14/04/2025 22:24, Yang Shi wrote:
>>>>>>> On 4/14/25 6:03 AM, Ryan Roberts wrote:
>>>>>>>> On 10/04/2025 23:00, Yang Shi wrote:
>>>>>>>>> Hi Ryan,
>>>>>>>>>
>>>>>>>>> I know you may have a lot of things to follow up after LSF/MM. Just gently
>>>>>>>>> ping,
>>>>>>>>> hopefully we can resume the review soon.
>>>>>>>> Hi, I'm out on holiday at the moment, returning on the 22nd April. But
>>>>>>>> I'm very
>>>>>>>> keen to move this series forward so will come back to you next week.
>>>>>>>> (although
>>>>>>>> TBH, I thought I was waiting for you to respond to me... :-| )
>>>>>>>>
>>>>>>>> FWIW, having thought about it a bit more, I think some of the suggestions I
>>>>>>>> previously made may not have been quite right, but I'll elaborate next week.
>>>>>>>> I'm
>>>>>>>> keen to build a pgtable splitting primitive here that we can reuse with
>>>>>>>> vmalloc
>>>>>>>> as well to enable huge mappings by default with vmalloc too.
>>>>>>> Sounds good. I think the patches can support splitting vmalloc page table
>>>>>>> too.
>>>>>>> Anyway we can discuss more after you are back. Enjoy your holiday.
>>>>>> Hi Yang,
>>>>>>
>>>>>> Sorry I've taken so long to get back to you. Here's what I'm currently
>>>>>> thinking:
>>>>>> I'd eventually like to get to the point where the linear map and most vmalloc
>>>>>> memory is mapped using the largest possible mapping granularity (i.e. block
>>>>>> mappings at PUD/PMD, and contiguous mappings at PMD/PTE level).
>>>>>>
>>>>>> vmalloc has history with trying to do huge mappings by default; it ended up
>>>>>> having to be turned into an opt-in feature (instead of the original opt-out
>>>>>> approach) because there were problems with some parts of the kernel expecting
>>>>>> page mappings. I think we might be able to overcome those issues on arm64 with
>>>>>> BBML2.
>>>>>>
>>>>>> arm64 can already support vmalloc PUD and PMD block mappings, and I have a
>>>>>> series (that should make v6.16) that enables contiguous PTE mappings in
>>>>>> vmalloc
>>>>>> too. But these are currently limited to when VM_ALLOW_HUGE is specified. To be
>>>>>> able to use that by default, we need to be able to change permissions on
>>>>>> sub-regions of an allocation, which is where BBML2 and your series come in.
>>>>>> (there may be other things we need to solve as well; TBD).
>>>>>>
>>>>>> I think the key thing we need is a function that can take a page-aligned
>>>>>> kernel
>>>>>> VA, will walk to the leaf entry for that VA and if the VA is in the middle of
>>>>>> the leaf entry, it will split it so that the VA is now on a boundary. This
>>>>>> will
>>>>>> work for PUD/PMD block entries and contiguous-PMD/contiguous-PTE entries. The
>>>>>> function can assume BBML2 is present. And it will return 0 on success, -EINVAL
>>>>>> if the VA is not mapped or -ENOMEM if it couldn't allocate a pgtable to
>>>>>> perform
>>>>>> the split.
>>>>> OK, the v3 patches already handled page table allocation failure with returning
>>>>> -ENOMEM and BUG_ON if it is not mapped because kernel assumes linear mapping
>>>>> should be always present. It is easy to return -EINVAL instead of BUG_ON.
>>>>> However I'm wondering what usecases you are thinking about? Splitting vmalloc
>>>>> area may run into unmapped VA?
>>>> I don't think BUG_ON is the right behaviour; crashing the kernel should be
>>>> discouraged. I think even for vmalloc under correct conditions we shouldn't see
>>>> any unmapped VA. But vmalloc does handle it gracefully today; see (e.g.)
>>>> vunmap_pmd_range() which skips the pmd if its none.
>>>>
>>>>>> Then we can use that primitive on the start and end address of any range for
>>>>>> which we need exact mapping boundaries (e.g. when changing permissions on part
>>>>>> of linear map or vmalloc allocation, when freeing part of a vmalloc
>>>>>> allocation,
>>>>>> etc). This way we only split enough to ensure the boundaries are precise, and
>>>>>> keep larger mappings inside the range.
>>>>> Yeah, makes sense to me.
>>>>>
>>>>>> Next we need to reimplement __change_memory_common() to not use
>>>>>> apply_to_page_range(), because that assumes page mappings only. Dev Jain has
>>>>>> been working on a series that converts this to use walk_page_range_novma() so
>>>>>> that we can change permissions on the block/contig entries too. That's not
>>>>>> posted publicly yet, but it's not huge so I'll ask if he is comfortable with
>>>>>> posting an RFC early next week.
>>>>> OK, so the new __change_memory_common() will change the permission of page
>>>>> table, right?
>>>> It will change permissions of all the leaf entries in the range of VAs it is
>>>> passed. Currently it assumes that all the leaf entries are PTEs. But we will
>>>> generalize to support all the other types of leaf entries too.,
>>>>
>>>>> If I remember correctly, you suggested change permissions in
>>>>> __create_pgd_mapping_locked() for v3. So I can disregard it?
>>>> Yes I did. I think this made sense (in my head at least) because in the context
>>>> of the linear map, all the PFNs are contiguous so it kind-of makes sense to
>>>> reuse that infrastructure. But it doesn't generalize to vmalloc because vmalloc
>>>> PFNs are not contiguous. So for that reason, I think it's preferable to have an
>>>> independent capability.
>>> OK, sounds good to me.
>>>
>>>>> The current code assumes the address range passed in by change_memory_common()
>>>>> is *NOT* physically contiguous so __change_memory_common() handles page table
>>>>> permission on page basis. I'm supposed Dev's patches will handle this then my
>>>>> patch can safely assume the linear mapping address range for splitting is
>>>>> physically contiguous too otherwise I can't keep large mappings inside the
>>>>> range. Splitting vmalloc area doesn't need to worry about this.
>>>> I'm not sure I fully understand the point you're making here...
>>>>
>>>> Dev's series aims to use walk_page_range_novma() similar to riscv's
>>>> implementation so that it can walk a VA range and update the permissions on each
>>>> leaf entry it visits, regadless of which level the leaf entry is at. This
>>>> doesn't make any assumption of the physical contiguity of neighbouring leaf
>>>> entries in the page table.
>>>>
>>>> So if we are changing permissions on the linear map, we have a range of VAs to
>>>> walk and convert all the leaf entries, regardless of their size. The same goes
>>>> for vmalloc... But for vmalloc, we will also want to change the underlying
>>>> permissions in the linear map, so we will have to figure out the contiguous
>>>> pieces of the linear map and call __change_memory_common() for each; there is
>>>> definitely some detail to work out there!
>>> Yes, this is my point. When changing underlying linear map permission for
>>> vmalloc, the linear map address may be not contiguous. This is why
>>> change_memory_common() calls __change_memory_common() on page basis.
>>>
>>> But how Dev's patch work should have no impact on how I implement the split
>>> primitive by thinking it further. It should be the caller's responsibility to
>>> make sure __create_pgd_mapping_locked() is called for contiguous linear map
>>> address range.
>>>
>>>>>> You'll still need to repaint the whole linear map with page mappings for the
>>>>>> case !BBML2 case, but I'm hoping __create_pgd_mapping_locked() (potentially
>>>>>> with
>>>>>> minor modifications?) can do that repainting on the live mappings; similar to
>>>>>> how you are doing it in v3.
>>>>> Yes, when repainting I need to split the page table all the way down to PTE
>>>>> level. A simple flag should be good enough to tell
>>>>> __create_pgd_mapping_locked()
>>>>> do the right thing off the top of my head.
>>>> Perhaps it may be sufficient to reuse the NO_BLOCK_MAPPINGS and NO_CONT_MAPPINGS
>>>> flags? For example, if you are find a leaf mapping and NO_BLOCK_MAPPINGS is set,
>>>> then you need to split it?
>>> Yeah, sounds feasible. Anyway I will figure it out.
>>>
>>>>>> Miko's BBML2 series should hopefully get imminently queued for v6.16.
>>>>> Great! Anyway my series is based on his advertising BBML2 patch.
>>>>>
>>>>>> So in summary, what I'm asking for your large block mapping the linear map
>>>>>> series is:
>>>>>>      - Paint linear map using blocks/contig if boot CPU supports BBML2
>>>>>>      - Repaint linear map using page mappings if secondary CPUs don't
>>>>>> support BBML2
>>>>> OK, I just need to add some simple tweak to split down to PTE level to v3.
>>>>>
>>>>>>      - Integrate Dev's __change_memory_common() series
>>>>> OK, I think I have to do my patches on top of it. Because Dev's patch need
>>>>> guarantee the linear mapping address range is physically contiguous.
>>>>>
>>>>>>      - Create primitive to ensure mapping entry boundary at a given page-
>>>>>> aligned VA
>>>>>>      - Use primitive when changing permissions on linear map region
>>>>> Sure.
>>>>>
>>>>>> This will be mergable on its own, but will also provide a great starting base
>>>>>> for adding huge-vmalloc-by-default.
>>>>>>
>>>>>> What do you think?
>>>>> Definitely makes sense to me.
>>>>>
>>>>> If I remember correctly, we still have some unsolved comments/questions for v3
>>>>> in my replies on March 17, particularly:
>>>>> https://lore.kernel.org/linux-arm-kernel/2b715836-b566-4a9e-
>>>>> b344-9401fa4c0feb@os.amperecomputing.com/
>>>> Ahh sorry about that. I'll take a look now...
>>> No problem.
>>>
>>> Thanks,
>>> Yang
>>>
>>>> Thanks,
>>>> Ryan
>>>>
>>>>> Thanks,
>>>>> Yang
>>>>>
>>>>>> Thanks,
>>>>>> Ryan
>>>>>>
>>>>>>
>>>>>>> Thanks,
>>>>>>> Yang
>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Ryan
>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Yang
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 3/13/25 10:40 AM, Yang Shi wrote:
>>>>>>>>>> On 3/13/25 10:36 AM, Ryan Roberts wrote:
>>>>>>>>>>> On 13/03/2025 17:28, Yang Shi wrote:
>>>>>>>>>>>> Hi Ryan,
>>>>>>>>>>>>
>>>>>>>>>>>> I saw Miko posted a new spin of his patches. There are some slight
>>>>>>>>>>>> changes
>>>>>>>>>>>> that
>>>>>>>>>>>> have impact to my patches (basically check the new boot parameter).
>>>>>>>>>>>> Do you
>>>>>>>>>>>> prefer I rebase my patches on top of his new spin right now then restart
>>>>>>>>>>>> review
>>>>>>>>>>>> from the new spin or review the current patches then solve the new
>>>>>>>>>>>> review
>>>>>>>>>>>> comments and rebase to Miko's new spin together?
>>>>>>>>>>> Hi Yang,
>>>>>>>>>>>
>>>>>>>>>>> Sorry I haven't got to reviewing this version yet, it's in my queue!
>>>>>>>>>>>
>>>>>>>>>>> I'm happy to review against v3 as it is. I'm familiar with Miko's series
>>>>>>>>>>> and am
>>>>>>>>>>> not too bothered about the integration with that; I think it's pretty
>>>>>>>>>>> straight
>>>>>>>>>>> forward. I'm more interested in how you are handling the splitting,
>>>>>>>>>>> which I
>>>>>>>>>>> think is the bulk of the effort.
>>>>>>>>>> Yeah, sure, thank you.
>>>>>>>>>>
>>>>>>>>>>> I'm hoping to get to this next week before heading out to LSF/MM the
>>>>>>>>>>> following
>>>>>>>>>>> week (might I see you there?)
>>>>>>>>>> Unfortunately I can't make it this year. Have a fun!
>>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Yang
>>>>>>>>>>
>>>>>>>>>>> Thanks,
>>>>>>>>>>> Ryan
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> Thanks,
>>>>>>>>>>>> Yang
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> On 3/4/25 2:19 PM, Yang Shi wrote:
>>>>>>>>>>>>> Changelog
>>>>>>>>>>>>> =========
>>>>>>>>>>>>> v3:
>>>>>>>>>>>>>         * Rebased to v6.14-rc4.
>>>>>>>>>>>>>         * Based on Miko's BBML2 cpufeature patch (https://
>>>>>>>>>>>>> lore.kernel.org/
>>>>>>>>>>>>> linux-
>>>>>>>>>>>>> arm-kernel/20250228182403.6269-3-miko.lenczewski@arm.com/).
>>>>>>>>>>>>>           Also included in this series in order to have the complete
>>>>>>>>>>>>> patchset.
>>>>>>>>>>>>>         * Enhanced __create_pgd_mapping() to handle split as well per
>>>>>>>>>>>>> Ryan.
>>>>>>>>>>>>>         * Supported CONT mappings per Ryan.
>>>>>>>>>>>>>         * Supported asymmetric system by splitting kernel linear
>>>>>>>>>>>>> mapping if
>>>>>>>>>>>>> such
>>>>>>>>>>>>>           system is detected per Ryan. I don't have such system to test,
>>>>>>>>>>>>> so the
>>>>>>>>>>>>>           testing is done by hacking kernel to call linear mapping
>>>>>>>>>>>>> repainting
>>>>>>>>>>>>>           unconditionally. The linear mapping doesn't have any block and
>>>>>>>>>>>>> cont
>>>>>>>>>>>>>           mappings after booting.
>>>>>>>>>>>>>
>>>>>>>>>>>>> RFC v2:
>>>>>>>>>>>>>         * Used allowlist to advertise BBM lv2 on the CPUs which can
>>>>>>>>>>>>> handle TLB
>>>>>>>>>>>>>           conflict gracefully per Will Deacon
>>>>>>>>>>>>>         * Rebased onto v6.13-rc5
>>>>>>>>>>>>>         * https://lore.kernel.org/linux-arm-
>>>>>>>>>>>>> kernel/20250103011822.1257189-1-
>>>>>>>>>>>>> yang@os.amperecomputing.com/
>>>>>>>>>>>>>
>>>>>>>>>>>>> RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-
>>>>>>>>>>>>> yang@os.amperecomputing.com/
>>>>>>>>>>>>>
>>>>>>>>>>>>> Description
>>>>>>>>>>>>> ===========
>>>>>>>>>>>>> When rodata=full kernel linear mapping is mapped by PTE due to arm's
>>>>>>>>>>>>> break-before-make rule.
>>>>>>>>>>>>>
>>>>>>>>>>>>> A number of performance issues arise when the kernel linear map is
>>>>>>>>>>>>> using
>>>>>>>>>>>>> PTE entries due to arm's break-before-make rule:
>>>>>>>>>>>>>         - performance degradation
>>>>>>>>>>>>>         - more TLB pressure
>>>>>>>>>>>>>         - memory waste for kernel page table
>>>>>>>>>>>>>
>>>>>>>>>>>>> These issues can be avoided by specifying rodata=on the kernel command
>>>>>>>>>>>>> line but this disables the alias checks on page table permissions and
>>>>>>>>>>>>> therefore compromises security somewhat.
>>>>>>>>>>>>>
>>>>>>>>>>>>> With FEAT_BBM level 2 support it is no longer necessary to
>>>>>>>>>>>>> invalidate the
>>>>>>>>>>>>> page table entry when changing page sizes. This allows the kernel to
>>>>>>>>>>>>> split large mappings after boot is complete.
>>>>>>>>>>>>>
>>>>>>>>>>>>> This patch adds support for splitting large mappings when FEAT_BBM
>>>>>>>>>>>>> level 2
>>>>>>>>>>>>> is available and rodata=full is used. This functionality will be used
>>>>>>>>>>>>> when modifying page permissions for individual page frames.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Without FEAT_BBM level 2 we will keep the kernel linear map using PTEs
>>>>>>>>>>>>> only.
>>>>>>>>>>>>>
>>>>>>>>>>>>> If the system is asymmetric, the kernel linear mapping may be repainted
>>>>>>>>>>>>> once
>>>>>>>>>>>>> the BBML2 capability is finalized on all CPUs.  See patch #6 for more
>>>>>>>>>>>>> details.
>>>>>>>>>>>>>
>>>>>>>>>>>>> We saw significant performance increases in some benchmarks with
>>>>>>>>>>>>> rodata=full without compromising the security features of the kernel.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Testing
>>>>>>>>>>>>> =======
>>>>>>>>>>>>> The test was done on AmpereOne machine (192 cores, 1P) with 256GB
>>>>>>>>>>>>> memory and
>>>>>>>>>>>>> 4K page size + 48 bit VA.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Function test (4K/16K/64K page size)
>>>>>>>>>>>>>         - Kernel boot.  Kernel needs change kernel linear mapping
>>>>>>>>>>>>> permission at
>>>>>>>>>>>>>           boot stage, if the patch didn't work, kernel typically didn't
>>>>>>>>>>>>> boot.
>>>>>>>>>>>>>         - Module stress from stress-ng. Kernel module load change
>>>>>>>>>>>>> permission
>>>>>>>>>>>>> for
>>>>>>>>>>>>>           linear mapping.
>>>>>>>>>>>>>         - A test kernel module which allocates 80% of total memory via
>>>>>>>>>>>>> vmalloc(),
>>>>>>>>>>>>>           then change the vmalloc area permission to RO, this also
>>>>>>>>>>>>> change
>>>>>>>>>>>>> linear
>>>>>>>>>>>>>           mapping permission to RO, then change it back before
>>>>>>>>>>>>> vfree(). Then
>>>>>>>>>>>>> launch
>>>>>>>>>>>>>           a VM which consumes almost all physical memory.
>>>>>>>>>>>>>         - VM with the patchset applied in guest kernel too.
>>>>>>>>>>>>>         - Kernel build in VM with guest kernel which has this series
>>>>>>>>>>>>> applied.
>>>>>>>>>>>>>         - rodata=on. Make sure other rodata mode is not broken.
>>>>>>>>>>>>>         - Boot on the machine which doesn't support BBML2.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Performance
>>>>>>>>>>>>> ===========
>>>>>>>>>>>>> Memory consumption
>>>>>>>>>>>>> Before:
>>>>>>>>>>>>> MemTotal:       258988984 kB
>>>>>>>>>>>>> MemFree:        254821700 kB
>>>>>>>>>>>>>
>>>>>>>>>>>>> After:
>>>>>>>>>>>>> MemTotal:       259505132 kB
>>>>>>>>>>>>> MemFree:        255410264 kB
>>>>>>>>>>>>>
>>>>>>>>>>>>> Around 500MB more memory are free to use.  The larger the machine, the
>>>>>>>>>>>>> more memory saved.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Performance benchmarking
>>>>>>>>>>>>> * Memcached
>>>>>>>>>>>>> We saw performance degradation when running Memcached benchmark with
>>>>>>>>>>>>> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB
>>>>>>>>>>>>> pressure.
>>>>>>>>>>>>> With this patchset we saw ops/sec is increased by around 3.5%, P99
>>>>>>>>>>>>> latency is reduced by around 9.6%.
>>>>>>>>>>>>> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
>>>>>>>>>>>>> MPKI is reduced by 28.5%.
>>>>>>>>>>>>>
>>>>>>>>>>>>> The benchmark data is now on par with rodata=on too.
>>>>>>>>>>>>>
>>>>>>>>>>>>> * Disk encryption (dm-crypt) benchmark
>>>>>>>>>>>>> Ran fio benchmark with the below command on a 128G ramdisk (ext4) with
>>>>>>>>>>>>> disk
>>>>>>>>>>>>> encryption (by dm-crypt).
>>>>>>>>>>>>> fio --directory=/data --random_generator=lfsr --norandommap --
>>>>>>>>>>>>> randrepeat 1 \
>>>>>>>>>>>>>           --status-interval=999 --rw=write --bs=4k --loops=1 --
>>>>>>>>>>>>> ioengine=sync \
>>>>>>>>>>>>>           --iodepth=1 --numjobs=1 --fsync_on_close=1 --
>>>>>>>>>>>>> group_reporting --
>>>>>>>>>>>>> thread \
>>>>>>>>>>>>>           --name=iops-test-job --eta-newline=1 --size 100G
>>>>>>>>>>>>>
>>>>>>>>>>>>> The IOPS is increased by 90% - 150% (the variance is high, but the
>>>>>>>>>>>>> worst
>>>>>>>>>>>>> number of good case is around 90% more than the best number of bad
>>>>>>>>>>>>> case).
>>>>>>>>>>>>> The bandwidth is increased and the avg clat is reduced proportionally.
>>>>>>>>>>>>>
>>>>>>>>>>>>> * Sequential file read
>>>>>>>>>>>>> Read 100G file sequentially on XFS (xfs_io read with page cache
>>>>>>>>>>>>> populated).
>>>>>>>>>>>>> The bandwidth is increased by 150%.
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Mikołaj Lenczewski (1):
>>>>>>>>>>>>>             arm64: Add BBM Level 2 cpu feature
>>>>>>>>>>>>>
>>>>>>>>>>>>> Yang Shi (5):
>>>>>>>>>>>>>             arm64: cpufeature: add AmpereOne to BBML2 allow list
>>>>>>>>>>>>>             arm64: mm: make __create_pgd_mapping() and helpers non-void
>>>>>>>>>>>>>             arm64: mm: support large block mapping when rodata=full
>>>>>>>>>>>>>             arm64: mm: support split CONT mappings
>>>>>>>>>>>>>             arm64: mm: split linear mapping if BBML2 is not supported on
>>>>>>>>>>>>> secondary
>>>>>>>>>>>>> CPUs
>>>>>>>>>>>>>
>>>>>>>>>>>>>        arch/arm64/Kconfig                  | 11 +++++
>>>>>>>>>>>>>        arch/arm64/include/asm/cpucaps.h    | 2 +
>>>>>>>>>>>>>        arch/arm64/include/asm/cpufeature.h | 15 ++++++
>>>>>>>>>>>>>        arch/arm64/include/asm/mmu.h        | 4 ++
>>>>>>>>>>>>>        arch/arm64/include/asm/pgtable.h    | 12 ++++-
>>>>>>>>>>>>>        arch/arm64/kernel/cpufeature.c      | 95 ++++++++++++++++++++++++
>>>>>>>>>>>>> ++++++
>>>>>>>>>>>>> +++++++
>>>>>>>>>>>>>        arch/arm64/mm/mmu.c                 | 397 ++++++++++++++++++++
>>>>>>>>>>>>> ++++
>>>>>>>>>>>>> ++++++
>>>>>>>>>>>>> ++++
>>>>>>>>>>>>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>>> +++++
>>>>>>>>>>>>> +++++
>>>>>>>>>>>>> ++++++++++++++++++++++-------------------
>>>>>>>>>>>>>        arch/arm64/mm/pageattr.c            | 37 ++++++++++++---
>>>>>>>>>>>>>        arch/arm64/tools/cpucaps            | 1 +
>>>>>>>>>>>>>        9 files changed, 518 insertions(+), 56 deletions(-)
>>>>>>>>>>>>>
>>>>>>>>>>>>>

