Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2053.outbound.protection.outlook.com [40.107.100.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB19E186E2E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750129507; cv=fail; b=Qo8N4LhttYHdpNmra6U0pRlieCrVQhK3ZuhSTZj1y5TUd9p5FTyVOg0sj0Hsy7BtBT4MUsZld9DFh7TQ2LJ0Kokm4BVOxupjU4wd3LC0ZUFuB6HWL4hyF47kmi7EEXbZouXHz4phRWFDpwun9acyqKU1w/uEeoaUO2Q30o6s0Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750129507; c=relaxed/simple;
	bh=MpGkruPnEtzSIvRnWG9t+BYiO3Yjn5+VGxStHWo2oq4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WZc/Q7dysP96SJgM90o21djto+8V53qyyt+Ek385AUrAJdt8bgQhn60b8iJzqiudFRNLk6QrzMKZ5qU0EXh/Rvw2QeLc89lhrW+mpYje3p1ZS8Uyqyv14mLcSoBMXfZ5oGTTo8t9rqHXQzp99QSvoJ44tLrBN4WP4hMwra6Oneo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KsWxhDSn; arc=fail smtp.client-ip=40.107.100.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KsWxhDSn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIkrRiU8GI8X4H3t2Yg68cti89LkXad3BJLBkah1Y1OQ5W+b5ZcvxZAn7wMPkG/6J3tFnAjet047a4BNW80N0xEVihloNtKUIDxSW1icpRtjiInRD72wLWAPUWUaMWYcLHI81CdNtq3fnlN2wkOe2qSkbHwBsmdzVPWPNT1wzHeLn5KismgRGYyfQrQtjUswv/wIPIKBcToaTV69SXCZNaJ4X99qtb8nDNY1Klmc+eDdOk8fatOQ2DEnw2h+0Wa9NoxLHYDZGEcbNkXO2RYz+YCdx+KqwUojXDGXVnLYo7UJ7Y8dTHCAE5vBN6YiGFJQukN0TjDKmj/+Q7OOvSixPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HI5q67TaN/BNk3UCKdGi8VgPVanCo5KjuZk4AhpZ4Rg=;
 b=Nag4c7WyW6VOtyiksmBdeAb6sp/a6b/EUcozQZuU5K+yEQEmQ6nO2ILQkPKyC/oO0/uKzI5Ty1xhTrlC0wgPp612L22V8VzguvzQoFe36C3IlGc8z44m6sIUO/weJFrkUacSwcr3Ndbz0OyqbN4x1b01Lla4Po4nSNaoeRtW4lSIyjLwDXCQwUEcq/temf5B3v6LFykDQeIQtadSKh882avs/6ocjk9eGOuSy4XlI9KGN43v2xbUkIbRd7w701jl/G5cg9YarJvZ8rgXzT2eTZ0Z0A2xVh8JIVT3pgjxZ1WxfkU5fJqqbj/TZvEz2UcbqY27xIASe8PRsyVg2nWcpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HI5q67TaN/BNk3UCKdGi8VgPVanCo5KjuZk4AhpZ4Rg=;
 b=KsWxhDSn7NF1N8vVrp4hsNo6UIkVWrbFl2tqN/DII3F/Z5iTUttonUVtGM55gBhTtqu0NEjQvUtIlyWo9LN0UQe1mFtTZjL/RKPbjr/ob5lRs1NdG2j5HD3jyRB47lzd2nw+gLf9S0IfVqzbnE/S+NUuk42bylUi9xG7Va96i/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by SJ2PR12MB9242.namprd12.prod.outlook.com (2603:10b6:a03:56f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 17 Jun
 2025 03:05:03 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Tue, 17 Jun 2025
 03:05:02 +0000
Message-ID: <b1ff9a6d-4593-4120-b989-5a0fdba8329a@amd.com>
Date: Tue, 17 Jun 2025 08:34:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] sched/topology: improve topology_span_sane speed
To: Steve Wahl <steve.wahl@hpe.com>, Leon Romanovsky <leon@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 linux-kernel@vger.kernel.org, Vishal Chourasia <vishalc@linux.ibm.com>,
 samir <samir@linux.ibm.com>, Naman Jain <namjain@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>, srivatsa@csail.mit.edu,
 Michael Kelley <mhklinux@outlook.com>, Russ Anderson <rja@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>
References: <a5da2e4d-c042-4d01-bfc3-f50ca674247b@amd.com>
 <20250610123618.GB10669@unreal>
 <4110e533-6cab-4845-bd11-11279ebc9150@app.fastmail.com>
 <aEiKCqoaEWnZvlCI@swahl-home.5wahls.com> <20250611060607.GM10669@unreal>
 <f5fad97d-f880-49a4-9595-ca3f5b41d9bb@amd.com>
 <20250612074157.GO10669@unreal>
 <5a673979-e96c-4dc2-b84b-849c6c8084ae@amd.com>
 <223b16a5-8532-4f5b-b34a-c7a0448f2454@amd.com>
 <20250615064207.GA750234@unreal> <aFAnwZLdGn8zrrqG@swahl-home.5wahls.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <aFAnwZLdGn8zrrqG@swahl-home.5wahls.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::36) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|SJ2PR12MB9242:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c207f54-a40c-4d75-847f-08ddad4bc092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVZvUFpFbGw5MkpxSmROZFBUeGFTVTFNY094bndRdnZnTG5hNUYxSnM5WGZ0?=
 =?utf-8?B?YXQxdlBaZXBnTUV6ZjI0bkJiSkp0RkVDV1Q0WEtEMVpQOHVTQVQwakIzQUNq?=
 =?utf-8?B?ajdOaUdaRWQwbzBFTmNscXVlL05UQjBpQ1RyVjV2V0VEdm5Tcnpld1UxcGZS?=
 =?utf-8?B?MkZmTHFjd1VJR1pUVUI5TTdVUWk3U1JGd25xbko0VnJrUGt2ZnZMZnJNQjE5?=
 =?utf-8?B?dG5IV3VWYVdMeHBkSWd6dE1pbmQ3aWJXUDhmYTU5RXkzeXBaQW1lWTF3b3Nu?=
 =?utf-8?B?QncrU1A1b2k0VG5QQ01SZFRwNHNuUHFMUmtZbllFckZ6NzA4QkQyaEZ5b3BN?=
 =?utf-8?B?cXZmS0N5Z3lRSkRDN0xOMFpHSDZyWmJMZlAyVmFXVGdERXlxY1owUkRqditE?=
 =?utf-8?B?YlNqMmFlS04waUE4QWpUUzV3M0JKN1ZINGFHdkZXYlVFK0E3Yy9QbVQ3TWZL?=
 =?utf-8?B?OWdJSndQZmxJN2UxQ3J2RTR6Vy95V2dzclZkYVRCbVNNdURYWDhpSHRja1JM?=
 =?utf-8?B?TFh0b2xXOGtldnFpdHVEYmVqVmVsUUpIeVRyRmViUUV2YXorTGZLVU9idVAr?=
 =?utf-8?B?MjVTdU4yWVBPRDl4QXNWMnlCQ0V4K3gzMndpYW1wQUhaYUNsOUFpVXdxcWkx?=
 =?utf-8?B?QUE4alpHbmhZWThETzRLTDZEa1FHZHRncXpCNjhiZjdWVUd1ai9zK2JLOEh4?=
 =?utf-8?B?VXV4L1JpNzluMzFHWU5qR2xxWjJoRXJiMlhydDNWbm1pZ3FhQ202dkdSejRm?=
 =?utf-8?B?V1JvQmsyWUxOVDRVdlgyakVGRlU3Zkc4YTFSbHNoMWlGN0czdjdQa0xUL2Rq?=
 =?utf-8?B?MkFMZEY1VUwySmVOazZCdlRTK1lGZjR6WWNWb0J6ekMrR2kxQ0dHVWQ1d1JQ?=
 =?utf-8?B?UlZHclRuTklRdVBXci9lamNEb2hhdUFxRGVxUkpwb05qQjlQKy82NTYrYzVz?=
 =?utf-8?B?RmVWWVhtbjB0eXJ4aElOaHozbXVvRUdwWjQzM2dreTZ0SWVCd3JPR2xIUlA1?=
 =?utf-8?B?MU9kb3U4eTU1THlJdDY3MGdPNVByQW4vSXZGOU1IUmZib0Z5RTlNYTdIcmNu?=
 =?utf-8?B?Sjh0azltVDVyUytVWU9KZWJvTXI4dm9VTnNaanZaZ2Q4UkxNZENMb2VydXlp?=
 =?utf-8?B?Yng0NjR5Uk1JbEFvQ3o0eDRJMGtJL29OUmJnaStWYUFDVzBxWUpLNmVJTzVT?=
 =?utf-8?B?bjUySVJPTlgreW5ldVR0NlpJWmRwZDdBVmJXRmN3VUMwbzRVWVY5ZGdLYnY1?=
 =?utf-8?B?L3hCRFF2VXpTQ0N5cS96eFpvbXRWMHltVmlpL1ZWRk1aS3FSeUZwUmREaDdw?=
 =?utf-8?B?Q2d5aEFXN1IvQVRvQ3NzRG9vcE5JRHY3RzEyRDh3YmRja1pyRCt1QzRZaUp3?=
 =?utf-8?B?Unk0YUVRdE50dUd6cnBtVUZCQ1g2TDU0M3hIelVXTDR3SGhYN1JicWR2T1Fi?=
 =?utf-8?B?MnlYL016L25UNEk3QkN5czRxSktKOU82UlpPN0RvSmVPZXZ3bkZXUWgvQkwz?=
 =?utf-8?B?a1N1ekxmY2ZrSldIMkdZQkFDNVVta0kwSXg1VGlrcmYydzZaWDIyL1kyMGZa?=
 =?utf-8?B?Tk9kRERiSHduU1pFcjY2cW1rUk5UTmVzL2pMYktkMXAweE5XdW0zSDd3ZUxM?=
 =?utf-8?B?QkRIUU5VYktweit0RnhQSVhRSzNiMDBidmhkSFU1NDRWbkNiaThzcldXbkJW?=
 =?utf-8?B?ZGhiTXBaN1dERG5DbDhhUTlJR0sxc3c3aFZqSVpOLzhmMjB0WFZNb2RUNkNF?=
 =?utf-8?B?KzdWbDZ2dDF1Z2JGT2s3aTg5LzZMOW9Ca3prTVhVcTNGVHFPOC91UnNMV3E3?=
 =?utf-8?B?WjIyZW9KWnk3T0JkMkFkMXI4eUdsQzFyeFhzZmRxVGF1dzA0Ti84NU9qRUdR?=
 =?utf-8?B?NE9pNnNWM0ZKc0NxTjZEQk1aaVNVNVYwL2ZNbDJzZG44TGp4VmhCd3h0b3k5?=
 =?utf-8?Q?gB7/U5UiuXk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TS8ycmQ4NzdPZnM4WTUxSGc5UFRhQ3RRTmY2dDJKUERGMitENDFJUmNSRldV?=
 =?utf-8?B?aWR0RFRLcEh1cUh1YkxNQWdjeHB5LzFFUVVjVmZUckNPMlo3TStMRjFHYVU0?=
 =?utf-8?B?MSt4S3U3eTdmNngxOHhOSktnN01qM3hlNTMycGJhRU1Wb0ZDUUIwcXQwdkRu?=
 =?utf-8?B?Qm1nbS8yM2xvalFtam54V0drRUt1L0NGc0pXejhrNzhYRVAyZ2JjSWxYWnNR?=
 =?utf-8?B?em5STFJBNkRjTXU3S3BGcUVtSzhXUUVZTlNJcXBWRnBZbDdyTDY3OVMvNFMv?=
 =?utf-8?B?NHVad0lyc2pRcDVsK0ZXVTlQMWNHaDVLenpmaDV6UnRhZVJ5Nnl0Nm9NbFkv?=
 =?utf-8?B?WHlvUFYwMThNMytucUJPQmIrdjRBVXF2VUlObXZHandDbS9ZeEx3dzVoYlJT?=
 =?utf-8?B?Wm9UNFU4djREYVlPa3dUc0I5YmdTQmhlRkh3Nkg1UE9ER2tGdTBtRGZyZWxr?=
 =?utf-8?B?MXpWa3haL3B2Y3BDWEVkOTBYODlRdVp6cE9IdXpFTGxHUWYxcFh0WU9IT0x5?=
 =?utf-8?B?S2ZiTUhjUU5lWlRDeCtyVHI1WWZkbVhURmN5M3ozVGkxNUFwSVJFMkhtYU8z?=
 =?utf-8?B?NkpkRGZ0dS9UZ04xZ2RyL1ZBUUR5MkVSMlJ5dGkzeStoR21WVXR3VldJaWg3?=
 =?utf-8?B?bWkvQnRPdjNvUWhYRkFKeTcvTnM4TGJ4d1ZwNVRPQ1JIZTFzd3d6Nmg5MWlC?=
 =?utf-8?B?YnFsZlN3K1RZMXlpVElYQ0hlbTRVYmg1VGx0anZORmFlaVVPMFNQakpaRGhM?=
 =?utf-8?B?d09CbXY0OEhNVkFiNmtJSEc1R3hraTFUVGdIRnlCQ01WT0syM0NJQ3Fwcisv?=
 =?utf-8?B?UlJKS2NaeDIwQTg3ZVZDeEZnTWs0VHc4SEJPQml6S0ova3h6enQ1eDhpTWVT?=
 =?utf-8?B?eXY0a0Z1aForRGF5Q0lSbUJXOVo2SnBCOVlQajhSd1R4MXpvaVFnZFFEdnBV?=
 =?utf-8?B?ekZzSjgrQjQrWTZQTHZOZ2lUdmxFNVVLUmlLcVZaa05QdkVzVFNRQmFwRjBO?=
 =?utf-8?B?STBsbUJlUnp6VjF5YmQ0ZkZmVXl5VUFYdG1Scy84ajdwT0IzNmNZTVYzNkNB?=
 =?utf-8?B?Ulg5NW1qODg5dUNhQkQ3ZmVGZDB3THZ4R0hBVzltNSsydnZMbXhOMno2Z3Vo?=
 =?utf-8?B?S1hHeXRTOVVra05FenRvTjVUM1BsSkhPWHNVdE9sT1owRko4V1V5elE1QjVZ?=
 =?utf-8?B?ak9hdHhUV2hhQ09NZ010SkxYUFl6OTQrZjlsblAycmxwVEU0SnVGLzZWQWJj?=
 =?utf-8?B?OThBcVRCN2QrOU5OR2NTY2dYMllBRUhyQmIxNGkxVXB1dDJueW9NTVNmN3B0?=
 =?utf-8?B?N2EySFA3OTdEakRrTmo4eGlIajFPRjRmSWFRNnBjSUNmeTdEVllrbXZpaXBQ?=
 =?utf-8?B?RFpUaFFvQ00wL2lpOEJ1cGpSVjFzTGx3cFpxdzFkVjBxdUJnT3U2K2ZER2RR?=
 =?utf-8?B?YVFIYWpWenZSNkorUkpzMlBzMG9ZeWhVMDY0ZU9aU0VjRDVDQ2U2anZpN0tO?=
 =?utf-8?B?T1NrQXNFdExDVmc0VlhLVmtyN0JoVTJxdDZuQ0k4QkxjNDRqM05ZRE5WaUp3?=
 =?utf-8?B?eEMvTkpWVDgwMWVlZzBIUENZRGowS2JKRG91YWNOYkpLbkdtdlRjbW0rMmQr?=
 =?utf-8?B?YVJBSHFOb2dlRVpvR25BWDBuL0w2V0orbWlvYWF5S1I1aU9GSzhzYzcvMlpO?=
 =?utf-8?B?ZENEa3puMVZ1OXFrVWVncEs4RFJackNzRDVrbzREOGtLWkh6VjNaZjlKb3o1?=
 =?utf-8?B?WVo0YzFUUG5VbklDQWRJamVoak1USy9UWTM2WGs5NEZjNlpFNFZrZkNiRXRZ?=
 =?utf-8?B?OWJybTI0NW5WWjdJRjVPWENjRXYvN3JyN3pxWEtHNUFwQ3RqcmZpMkNPWm9x?=
 =?utf-8?B?Qkx6TjkyMnFnRXhrU0FoZEkwWHVaZW40SVZPbGs1a2R0NjlWRlV1WUwzQnI5?=
 =?utf-8?B?VVQvd09PRWd1VWJPWngwS1FEOHFXSGcxbHBGQTF4WkFObjdGcFVZVTZvcUhB?=
 =?utf-8?B?NWJYUkxuV2o5Q2U4bFVaaWFPOW5QVlFsR2o3MVpPUTBOd2ZiQ0lGV2U3S2pM?=
 =?utf-8?B?Uk41Y1IwUUlEUGh6QlhHQ1llbFpaVmFwMENJakM1N2phSjAwdWJ1UEdIdVdp?=
 =?utf-8?Q?JIiw1/TsEinwVqPZ24/CrLV4k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c207f54-a40c-4d75-847f-08ddad4bc092
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 03:05:02.5903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spa8wmcefY0veJ4VlcB0+m0ZoOk/WnU0G0di4QsLx/OBXmffomKfKbQ/M3JYLCwa1Iq9sTjkF+YtJQGIY4fDWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9242

Hello Steve,

On 6/16/2025 7:48 PM, Steve Wahl wrote:
> On Sun, Jun 15, 2025 at 09:42:07AM +0300, Leon Romanovsky wrote:
>> On Thu, Jun 12, 2025 at 04:11:52PM +0530, K Prateek Nayak wrote:
>>> On 6/12/2025 3:00 PM, K Prateek Nayak wrote:
>>>> Ah! Since this happens so early topology isn't created yet for
>>>> the debug prints to hit! Is it possible to get a dmesg with
>>>> "ignore_loglevel" and "sched_verbose" on an older kernel that
>>>> did not throw this error on the same host?
>>
>> This is dmesg with reverted two commits "ched/topology: Refinement to
>> topology_span_sane speedup" and "sched/topology: improve
>> topology_span_sane speed"
> 
> I would be interested in whether there's a difference with only the
> second patch being reverted.  The first patch is expected to get the
> exact same results as previous code, only faster.  The second had
> simplifications suggested by others that could give different results
> under conditions that were not expected to exist.  The commit message
> for the second patch explains this.

Since NUMA domains are skipped as a result of SD_OVERLAP, the remaining
PKG domains don't show any discrepancy that would fail the current
check:

     CPU0 attaching sched-domain(s):
      domain-0: span=0-1 level=PKG               id:0    span:0-1
       groups: 0:{ span=0 }, 1:{ span=1 }
     CPU1 attaching sched-domain(s):
      domain-0: span=0-1 level=PKG               id:0    span:0-1
       groups: 1:{ span=1 }, 0:{ span=0 }
     CPU2 attaching sched-domain(s):
      domain-0: span=2-3 level=PKG               id:2    span:2-3
       groups: 2:{ span=2 }, 3:{ span=3 }
     CPU3 attaching sched-domain(s):
      domain-0: span=2-3 level=PKG               id:2    span:2-3
       groups: 3:{ span=3 }, 2:{ span=2 }
     CPU4 attaching sched-domain(s):
      domain-0: span=4-5 level=PKG               id:4    span:4-5
       groups: 4:{ span=4 }, 5:{ span=5 }
     CPU5 attaching sched-domain(s):
      domain-0: span=4-5 level=PKG               id:4    span:4-5
       groups: 5:{ span=5 }, 4:{ span=4 }
     CPU6 attaching sched-domain(s):
      domain-0: span=6-7 level=PKG               id:6    span:6-7
       groups: 6:{ span=6 }, 7:{ span=7 }
     CPU7 attaching sched-domain(s):
      domain-0: span=6-7 level=PKG               id:6    span:6-7
       groups: 7:{ span=7 }, 6:{ span=6 }
     CPU8 attaching sched-domain(s):
      domain-0: span=8-9 level=PKG               id:8    span:8-9
       groups: 8:{ span=8 }, 9:{ span=9 }
     CPU9 attaching sched-domain(s):
      domain-0: span=8-9 level=PKG               id:8    span:8-9
       groups: 9:{ span=9 }, 8:{ span=8 }

I suspect a topology level that gets degenerated for the failed check
but looking at the degeneration path, the degenerated domains should
either have a single CPU in it (SMT,CLS,MC) or it should have the
same span as PKG (NODE domain) for it to degenerate which should be
sane.

Leon, could you also paste the output of numactl -H from within the
guest please. I'm wondering if the NUMA topology makes a difference
here somehow.

-- 
Thanks and Regards,
Prateek

