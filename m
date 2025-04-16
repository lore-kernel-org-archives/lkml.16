Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E947F2080FF;
	Wed, 16 Apr 2025 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818723; cv=fail; b=pnXi+K28KU6FxjqBYGb2nPz/nMz9NnjFWlQJZxs0WH7p8pq4JC3h8y+rMEVhNSx5ozCiLnY5jYwuI2pv+a4jV83G4bTxfIj4iE2yBbIr5ByQpUhXpwh1nYDdg2Ayf0+akuUPSSSSEHZNDc1YRFK/XWgtVzQwNxDmGf/HWG5un0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818723; c=relaxed/simple;
	bh=PO4uOlL1MYNahGsSjm5B0W3ttZf6lV+dhzRrHmtxrBs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SdpOAJ9H7c30/MCW/BonnXB6f5jKPSit6ct9OCJS4HzO02IYSOAQU+BQKcvl7bmPWbWYFRf0Z3olN0g0JaxVRJlAZoGy1TcJWP4S3uDttJVr/A5rim5itO9RGKzPyH/8azl+VjdskPzL914qHDB+1Qdk8uMw4txn6JIeFDhpEwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JS42yx3s; arc=fail smtp.client-ip=40.107.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JS42yx3s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLFHzlTjtmR3pRDD4Q8YS1Plu6h6OLp1Cqm/o7zn2djx6K9kRRxtsSoCWcQMZjWosDFu9RVTV+r7qQkpxtBsWOkk3a0goDXs+fiQxW9tiZcmYF0gc5BAB9Nm3xSkiayG5rN0K7LhYlORsRYFFb9+lvqi1kexcbywkKe943eupb0T3eM1vga8JwLcwUHfqgXnuJ6Du/3FnHJObI2WyNuR6CyxGTSlTSedqxBkWXvyrlhWsxI7O80QBLiXDGR4/IyzON/3vwCDTdr+Pi1zyolwbFY/FB8XChMPMe0Ujpm3FVUJq2K6PqPBVzhaE3i2m+B59TByoaPzJsmCdV7sH1sMEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdJtzlRtWCTZoWZ5T4JG3KRcEbhzQfr0BF0J+GQnLmk=;
 b=obUSugdLOH3xT5R3C2nkpN2AkXqgvCk9/L+eGHyh7PkVVNsVEOI9FpgFw3gnCtHpO4/xfQTEHPHcTMO/0wixhIwMLd/FSKXXHZQugM1j/XOTTk4vpvY4TfCp0tMd3EVQMQx22V+YflzhCA2atw71ixshf78D2aff5Pl6mQ3QQVuEdukz3ddU19X1AWUWlET+krg29zSpSyx5Gl8CN0o/Bu4n3MGGmdl6zftRCs/orODODqGdfnQhng0mCfe4Qq33fkwVl/G1b1lGyjz6uXfHdJxsb/eiyGfcjXCpXTFCy2RIEVq2DO+0N5FEfcw1MIVFmZcO+Itz9+2J1Cg0Hx+7RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdJtzlRtWCTZoWZ5T4JG3KRcEbhzQfr0BF0J+GQnLmk=;
 b=JS42yx3sQg7ySAqRGg+9os4RbSbt4vBtdUcE0ZUiy9ZsZSnDSSVDCpKdPRh2cDSQGLHPSUaYMD+J9eSMnRqZoBjHBMlz4c8V/CzcYLQG9Sa6i8HFcnzmVkGiyxA1uIBV+pAQWXGhF5ooijJsjVGjTd9dip1hd5B12uTDhJ/PeiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH7PR12MB6935.namprd12.prod.outlook.com (2603:10b6:510:1b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 15:51:59 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 15:51:58 +0000
Message-ID: <a3c6c614-a39c-4d1c-883d-6c0a078b9dcc@amd.com>
Date: Wed, 16 Apr 2025 10:51:54 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 13/26] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 peternewman@google.com
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <187d14b81db5f9a2f19657dd3af07e8555d68261.1743725907.git.babu.moger@amd.com>
 <ef0fc176-ce2e-4ad5-b752-f1d018ae985e@intel.com>
 <a05b3226-b341-4003-a0d3-8e1594d95052@amd.com>
 <456839d0-031c-448d-9f54-5e65a29ebf9d@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <456839d0-031c-448d-9f54-5e65a29ebf9d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:806:f2::11) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH7PR12MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 84028f3c-2593-4285-7f3e-08dd7cfe9e8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azYyNFBNSTNyb1h4ZW50di9xNUpUdW84UlByc2FmbksrMXh6OVhDcDM5MkJ6?=
 =?utf-8?B?M2RwVmdzODhKcm84V3BYTzNlT0VBOHJnUFpxVlFpWnM2NDlnVTdiK2FZVEhq?=
 =?utf-8?B?SnV0ekdzUkg3alNxVVFVdDlQSzNyalU2K0o3dEtlTlNKZGkyWEhRRDdIY0VX?=
 =?utf-8?B?Zk4vdU5oWHJ1cE4ySHZFWWg5TTR3Q28xQTBMWVJ5OW0wVWZ3UGtQRHZya3dP?=
 =?utf-8?B?Mmg4ajFTZWx2clFwSDB5bEtWTmNJbzR2SjRqaVZEeUJ2VHJhNEZraENRZlNj?=
 =?utf-8?B?TjlSb3RRQldzTGd5dm8vYjJpNXJLTmtKUkZOOVB2NVdZdkl6cGlEOExSMXky?=
 =?utf-8?B?ZDN4RWNYQ1UrckIwL3ZDa1NQRy9lU016OWJ0eGdqbWF1a3F4V29RTGlhZlNq?=
 =?utf-8?B?V0JvWWgzN2NWZkZXMFU4Vkw3NzFVZ0dubmw0eklaUHdyK0tidFdBLzZIMHFs?=
 =?utf-8?B?UnlDa0JlSmk3NzdyUlRoRHE1RmN1bkRKTHUzblhxQ1B4cWhXc2xkYXZqNmI0?=
 =?utf-8?B?SUtQRTdTWTVkVllrYXZ1UWVZZjZpOXJJblU3M0pkM2xOc0FQbVNqQjlaam5H?=
 =?utf-8?B?OFMzZWhIK2M5czl5QTJrRGdaVmtaajkwOGNxalBWamgyNXZiMC80bkp5N3hs?=
 =?utf-8?B?M0FsNUlYOWYrdUtNSDdjUzdxM050UXUyYVZLTlR3Vy9oN2VaVmpYNCtFN05K?=
 =?utf-8?B?algrOTBQTFF2ME9hWXJZczljcXFQcVFSUTVoMExsUURiRnhvS3BnbWpsbEJs?=
 =?utf-8?B?TUc0NUYrVnVpSE5vOUpQYklZS3Jua090NlQ3THh6ZVpENGVCdDBCcW5tbCtu?=
 =?utf-8?B?bCthZ0FZWnY0Yk9xa2hvbEtBbjhZclhDeFo4WkhaK2lCZURZVG93ZmFERU9h?=
 =?utf-8?B?TVMyUEZNRVUwait4bkYxK0JnU2lnc25LV1pUVU5YRk5BLy9PVTNjRWtiMnor?=
 =?utf-8?B?NFo4aHlQUTYwMndWOHhEeFBPUG9qQzBmNXQxMTFUWWE4RjgrSnF4emk0MXhH?=
 =?utf-8?B?Z25mTnAwTFJ6NUhtWG45cnRqMGViR1BYTjZVTDY1SVhndkxHMzV6UlpiQ3Ba?=
 =?utf-8?B?T1A3VUlOOWZFb1dsVUo1ZjMwbXJ2N0Vpa1A1ZlVaT2JTdHBuNFB1TnJEb01l?=
 =?utf-8?B?bVNDQm0vcklYWWc3TndxaFBTZlgxamR4TVZZcDBObnV5UmNuaVNVUnBtNFhR?=
 =?utf-8?B?aCtHMmY1UVE5OVdrQXFLbm8wOUpsdnVOdTRDYXZXeC95N3B0NmEzSUgySVNo?=
 =?utf-8?B?OHV0NkpCMlVZZmhBNXl6OHIvZ3RuNXZ5eFR4SHQzMkV1eStBT2RrNHRvK25H?=
 =?utf-8?B?UTBFRGFVNWlZa3pqWi9lWDE0VkFqeUFINk5sNFdERUNySmFuakxxbGRDNEts?=
 =?utf-8?B?bVVZTk5BbWE0QmxoYUhabSswMGx3VzUyK24vUDhQVVhsaEVvb0NFNWlQaVJh?=
 =?utf-8?B?MTlwRmt2UDNJYzJ5dW15SDBIVVRvbmU3bzFYVUdadXdGZmVKNXB3d3BYQUNr?=
 =?utf-8?B?TjR6OTZJY0hydnBUemNHMjNLZUhaNmV0SVZqZ3I3RWtyd2VaZXNMQmtPZjZn?=
 =?utf-8?B?WDZGL3krYVpNWjV4MUgzNVBRVjl5aFQramRCUTIvNmVrenM3dDZWUGg1QXJH?=
 =?utf-8?B?RnJ0TXdlMklHUWVHMWRxekdiMkVqUHprdlhLeEtMdjdSMWxSZVlLbVlSNUhF?=
 =?utf-8?B?Vko2UnVlKzJBR0Rub1pnOGxNRUpMUjBQVmowa1VKK2xJcGNzeFVtV3lUQVpF?=
 =?utf-8?B?eHNqcHBjR05odUo3eGFDKzZRN3BDZ29nRHBJWlJqVkRKcktrWnQ3N2Q0VGl6?=
 =?utf-8?B?cm92T2sxYTdrY2RzMnJabnJ3VVhHU3dSV3JaVE1iUWY2ZnFnTlpPVWlzdVpH?=
 =?utf-8?B?enNIYXR4djd6bkdsUi91cFQxcU50ZVN0SXZPZVNLSlppR1lzejJ5MnVvLzZl?=
 =?utf-8?Q?+Jmtmk8Z/j4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzBvNXQvUXdiSmoxVjRadDNGWWVnQ2JyOHBhWkVMb0dxU04vWXE1dENJWStl?=
 =?utf-8?B?WnFOWE5jdi9LQ3pNRnU2R0lLRjZiK0IxUyszdkczdFRIWTU2MVhDYzk0UnJq?=
 =?utf-8?B?Z0t0RGFRU3BLWDNsWEtlZ3QvelpDQ0NHWEtURE85VnRKMFJBdk85RG5rQTA4?=
 =?utf-8?B?NFJJSm0vTGRMT2pTZzN6QUVuSzN6OHN4bUJadkdoWUlLOVRGY0RSMnp1YWFM?=
 =?utf-8?B?U09VR1VYZDJSbStVMXc0U3Jhb09KSWo1NlMyZDhMVmJjdFdGdDhockp2TVBw?=
 =?utf-8?B?WHRtMGppZUhMSFJnaFJEbkR0VzNZRWJzT0tRNXpxS0JHam9ieGI4TFczeEdZ?=
 =?utf-8?B?RDFIaWdVYVJsMUs2Q3c4blZMK1FSZkJzTEJ1UldFYXZIWW8xZGxtd0hsa0JB?=
 =?utf-8?B?UitNd0tQSjdJWmVlcVdtRU5HVXhjaE1GTnhDZE1hbFladXYzUndnVlhDWGtu?=
 =?utf-8?B?cGtKbTY4UEkwMCtTbnJRM2pzTGd6WmpTRU83L3lxTVQ0ZFNsTW5CTnRIK1Mz?=
 =?utf-8?B?MitVeHVDN1QwM09kOWx0d2Z0dnBBRU9kSXpnUVRtWkxTMkJWTlk2cllHbUZX?=
 =?utf-8?B?U0c1Rk85RFpPUTd4aTRrd0NYaUcxUndrUEtEL1h5aW9WR0grSmNzRlgxUEtk?=
 =?utf-8?B?ZytHY1lzMjUzYnFqeE1wWldibnQzVnovMitraU9jT0RpcVJkYmN5ZnNrejlC?=
 =?utf-8?B?a0JsQlBPYlk2bHFseUc0OTFlYll5b0VUbC92eDcyWW5hMW5JaU1VWCtWa1B2?=
 =?utf-8?B?Yk1Xcm5ud2RXVVhLYThzNWx5YS9nYUFySnh1RnVYdzVuMXZ5VjdOclN6bVpF?=
 =?utf-8?B?VHlzZVRRdWkwRE5IOWFrZE5veWxKS2pYMjlDMkJoUEpBR1JKTTdEaWdNTjgy?=
 =?utf-8?B?eGpLRThGUlpUeE9NT1RzdGM3UjBhQllBUmZlUnZsVWVRdmlLMi8rZHdOdTIz?=
 =?utf-8?B?NFUxZDZhZFNUcjUxcGFMRXVIV0dmbmg3ajBzOUJHQi9VZHZRRXZISi8xaUw3?=
 =?utf-8?B?alVkRlEvOVRKRE9DS00rYUtoUFRLbFFVS2NmR0NReUpFWU9qaXQ5SkNNdkFk?=
 =?utf-8?B?aVdOaEZXWTJVK1hOK1B4NE5YMWoxaGQyQ2phc0NCRGdpL2JWd3pFMHNLZi9R?=
 =?utf-8?B?cGhyekVHMWpQYWR3SkUyY0wrT2IzUjhWSTc5TlBOQU1vYk1XV2ovWXp5L1FQ?=
 =?utf-8?B?c1VlQlhGODUrWnNZQXAxNlByZDRMcXBrNkFJREx6RS9QSTE3SlJGbWdId2Vn?=
 =?utf-8?B?eGZOazdHakZvWWlrNkx2WGJ3RVcrUlZIUnB2Y3lrYk5yRHRNYmgrT01mdmVW?=
 =?utf-8?B?Q2s4aUtIcHdEYVMxdmFmR1krWkFhWFVmajJsOHp6dCt4VVVqenJZaEdqd1NK?=
 =?utf-8?B?UDBKeW56dWFvOXRXRUdmMlBjMFNna3Z6b1grNC9tcDFwYXlzd0F5Y1BzU0sw?=
 =?utf-8?B?Ti9sUkJ3WENlMnM3MFNxV2JveEZLR05wOE55djc2RWxDRUlJbkQ4eTF6VUhP?=
 =?utf-8?B?NS9BbklVT3BYMVlwdU5sZ1dtZmJ1Um9BQ0hhOGtSV0txb255RGNJZnZzSG90?=
 =?utf-8?B?UXVZMlREaE05NlYvUnZGTDhtbk1ONmVNdEJBOHZ3UWpBNUtSSlpyK0RiVnJN?=
 =?utf-8?B?VVppWXEyMHB1d0t3ekFSb09GZ21ZbUIyZlNaNnEzRCtxKzEycGZIaXE2WXh2?=
 =?utf-8?B?TVh3b0JUSjQ0R29Mb3lWTzAwOVBDZzVNU1hSdUUvWlJFQTZVRFE0RjhpSUVo?=
 =?utf-8?B?ck1RSWxCTHBsdkJscHFsTWR1U2N6dDY5ajFmM2gxSkI3aUN4aEdudE16em5y?=
 =?utf-8?B?Y2VpS2lGUFJxL2hPenpKUFd0OFVHZVBBcCtNMnRUNXlsUXJxQWFSTzJqblkv?=
 =?utf-8?B?Yk94c2d1UE5NenlzdjZjVEgxOEdNaTBsdFhETndGUkdIYjBSNkFiVnpaSDF0?=
 =?utf-8?B?dEYzWjdPUkk1NVFDMzJHRElDYysyL05RVWpBbU16dEZ2aGhzeUM1R2lTQUdE?=
 =?utf-8?B?QnQ5TitOQ3NpN0wzT0t0ZUZzSWlONW1WYlk1RmtrTFVuNitEb004c3BqUENH?=
 =?utf-8?B?cnFwSzlUQ2ErWVRIejE2Zi9QQXZSSVhSRjJnemtRQmRuSUJwenZ1aW5Nd01W?=
 =?utf-8?Q?cbI8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84028f3c-2593-4285-7f3e-08dd7cfe9e8a
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 15:51:58.2686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBpvDj5mrEXbt8XJ4FroIBD6as+IhAV+ZmjnEvxAvAXyFJLtME6epIxpS5uVxCpQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6935

Hi Reinette,

On 4/15/25 11:38, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/14/25 1:51 PM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 4/11/25 16:02, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 4/3/25 5:18 PM, Babu Moger wrote:
> 
>>>> @@ -394,6 +394,21 @@ void resctrl_arch_mon_event_config_set(void *config_info);
>>>>  u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
>>>>  				      enum resctrl_event_id eventid);
>>>>  
>>>> +/**
>>>> + * resctrl_arch_config_cntr() - Configure the counter on the domain
>>>> + * @r:			resource that the counter should be read from.
>>>> + * @d:			domain that the counter should be read from.
>>>> + * @evtid:		event type to assign
>>>> + * @rmid:		rmid of the counter to read.
>>>> + * @closid:		closid that matches the rmid.
>>>> + * @cntr_id:		Counter ID to configure
>>>> + * @evt_cfg:		event configuration
>>>
>>> "event configuration" is simply an expansion of member name and does not help to
>>> understand what the value represents.
>>
>> How about?
>>
>> "MBM Event configuration value representing reads, writes etc.."
> 
> This is more helpful (note Event -> event). When data structures are decided it
> will also be helpful to include reference of where this data is maintained and
> how it is formatted.

Sure.
-- 
Thanks
Babu Moger
