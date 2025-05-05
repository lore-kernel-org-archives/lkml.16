Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2064.outbound.protection.outlook.com [40.107.100.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEAC3103E1;
	Mon,  5 May 2025 22:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484188; cv=fail; b=Neg9TVOpg9NcMYS7/Afy/1yMP7UfJDwmcWtAXTNx4+dFBf13MFGk8A0cc3ppWt+cR7JxhjQPRVEg214wQSMEruq5pe/rHwxNS8Qc6oU+Smjsk7bWQYJ120S34lS1DY/jJHZHI/of2iix4Nl4sE9eUioRi/cFq84V/kWAZU08o44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484188; c=relaxed/simple;
	bh=88AUQg/QHKXeLKNol3wN1QFzIQ53abuEhjJmtXqd3eQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dDK4bkF966w/08WHa/bQmjruXVqFcEOZ5Nl5NY9vXuQlh3DxYjtXT4SgB1H0tsvII+p7lDYQ/cGNuPxAg+NR1KssQFhunT3aQyqF4ZXN9yYPLQUPuiNpoE+u1f5P9rrQEvGtmISrZY8mJmFa2PKfspsg+5kZtMbFIY9YM7YxIDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=unLajIyD; arc=fail smtp.client-ip=40.107.100.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="unLajIyD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdYLOoP9UMQr2aVpaolPIONq8n7vkLmiG1KiyUfak1yhUCVQYSMt2PAuE3wHbfLh/WogYdAXI7OIsocGOhWQGZ/s6FHE78hCkqiBdSSFMmxvyrUDY+1NdgdsLUWMWOJoNbeKlAMC3eGEYPdOsslYyxAUqPMZJxTpDcy0kKsxxfAD7iJUugOOTt3OF4T39itAckNp4/l8anncY1sESxrATE+tMjUXis/MMneFKJQZRN3ceqduf4ryZQDfugqZn8EDmGFcMlUIPecrk2yy9eF42Z4w2pvTKNLIJcXTlnJUZsgQsR1GX+Mz0qJTnlrLJ1mjwbyMwJHWTvg1qZV7kUOrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4ACBuv+OGmjqzEZVZBKa3p47byOR0fjHAH0Gx+gbFA=;
 b=gWkLw/Z/f2NF5En0K5788NsxN6cldsYktbZ1GbwunJVV47p/1XICVbnGUJtuyWbZcdAhLoNBqh7rwhU/VgzDXlTfp6vzMFpMKknANmSbm+AzqQV7RwEE9uSSy3qUI4mqcCpmGvWDlQRZDB5LZ4ztE32OfUyAUsIIwnlmLtTCmR7KAMfVL0Ze/rmgWn5C6I6bkbUkmIXkil13EcDttwh25Msl29DcH+w0DOKkB/S7MNdzFTLwSNyBsTpcwfaH58KrQ7pS1zw6P/67twKzpbEIYJiEQ6V5gTYoSqkl1yu668w2aMALSKIicvv/18T5GIH+orlbw5zi57SSPdMINDqW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4ACBuv+OGmjqzEZVZBKa3p47byOR0fjHAH0Gx+gbFA=;
 b=unLajIyDy4qlEFwK9sqC3xbUoMBXTsoJgQeX8Lhua+fN+r2pjEQv9FFvrhvwmmZFrzuwKgCF5sOBTbjzkIkGdho66RjkJATVN0U7UxYy3GO9GoYm0dOsgkB3Qlgog3F5bqRd7qFeajcbiUxsOvA7HeHl2/ebFEDnRjU6NDng8qk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 22:29:44 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 22:29:44 +0000
Message-ID: <1f6e891b-fcd9-48e5-bf85-7e30ec66374b@amd.com>
Date: Mon, 5 May 2025 17:29:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
To: Reinette Chatre <reinette.chatre@intel.com>, babu.moger@amd.com,
 tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: corbet@lwn.net, x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, rostedt@goodmis.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, thomas.lendacky@amd.com,
 mario.limonciello@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 riel@surriel.com, xin3.li@intel.com, xin@zytor.com, sohil.mehta@intel.com,
 ak@linux.intel.com, ebiggers@google.com, andrew.cooper3@citrix.com,
 gautham.shenoy@amd.com, Xiaojian.Du@amd.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, james.morse@arm.com, fenghuay@nvidia.com,
 peternewman@google.com
References: <cover.1745275431.git.babu.moger@amd.com>
 <c00c00ea-a9ac-4c56-961c-dc5bf633476b@intel.com>
 <3e0e9b68-2ebe-40f8-a840-1ad7cd3f56e0@amd.com>
 <3ca0a5dc-ad9c-4767-9011-b79d986e1e8d@intel.com>
 <b6521b41-d94a-4e69-af69-ed7657569f7c@amd.com>
 <c79d7c1c-e7a0-43bd-821a-947c910cd04d@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <c79d7c1c-e7a0-43bd-821a-947c910cd04d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0022.namprd18.prod.outlook.com
 (2603:10b6:806:f3::21) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH8PR12MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: a95f231c-4a6a-4a6b-5c99-08dd8c245578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djVNUDhWVmhiUU5kNnRJY3lodXp4VENpdGJZcmNEVXZRdzhKMGJGWnZuR1pY?=
 =?utf-8?B?dTBnWG1UUzZqZnA2UVVZamNxaXh3Um8ybmFwbUwxQTNXakpRWG8zWkVucVow?=
 =?utf-8?B?NHM4c281QmpaSEZYaHV4a2kwRVFrd2pnN3pYMURCZ0FyN0d0NjgrYkZxTjhV?=
 =?utf-8?B?U21XK2JsUU5RNmJZcUtxdUViS3kwUTZrTUl6QWZCcnpQVFpiRHZjTDYwaisv?=
 =?utf-8?B?Ri9IUnluTVgwSUxWbWpJUXlvTVAzSExodWxQSytjV3lnSTQxTzVpOExPbzgv?=
 =?utf-8?B?RGlXRUQxNzk1eE9aWERWZ3dTbmFJSWZtTi9jODBWQWFPM3FEemRoMnp6Ykl1?=
 =?utf-8?B?L0JUWGJEZ1NqVVJlSnhid1l5cnBXaW0vd3JMV1pzaFo1N095VHVkUEs5QjIr?=
 =?utf-8?B?SElqQ1lXRzBVUy9YYUhmMkthd2pmSzdjQjBCWU1GRjVJMGZ5MUVuYjVsREla?=
 =?utf-8?B?KzJQcERFTStJOWcrZGU4NjF6NDNpQ09SK0NlS1J6U2xrdlpaN3AwOXIweTE4?=
 =?utf-8?B?dW5RQURCTlR0RHhCaUs1TjRQYjRiSzl2d1hBQWl4RTUyTVVKWERSZlN6elZ3?=
 =?utf-8?B?WnRBTnllSVo1YmoxNDhvdUpIVjNpRmg5SVRmblFiaFEveUJha0NXWHR6YnJ0?=
 =?utf-8?B?TzRrSkNWUGkxTU8vRjlEWEZrS2VibUR5S0p2d0swZGlSKzQxRGx3WXYvdXdE?=
 =?utf-8?B?c3VMMTZqSFRUVm5PQzlJRnRzSG5OR3h3Qk01R3Bxa01XRHhBRVowY2czN3hy?=
 =?utf-8?B?SXpDeXJKZWIzNGdpTkJESVhyWDZMemRwYXVIaWRPU0MyVy9nZXI2RERZamwr?=
 =?utf-8?B?dTN4VWFoUm1XS2tEYUVRdUUxRnZlNjdNcEJFVEZhZHoyRjNmeE9uNWpxdXNa?=
 =?utf-8?B?cm54SWN6UGs0ZHdZa0ZrdnM0VVFnaXNnNGZhR01MYzhpcEZYbWMzMkZweEdh?=
 =?utf-8?B?VDNWSnFwZWx2TnFGVmt6QllKcDFyUWdHcFJsQitCang3bW1Uc2dlVjlqMVpF?=
 =?utf-8?B?WmtzakpKQWdickJIUGlQUkFZaWhxZTcyV0VzN2djMGdCUHpjVlhpWktMVmNy?=
 =?utf-8?B?RE5oeVF4VThzWWRUYXNpQmZPb3pZVkJjdnNxNW43U01xWFpQTjlnNURuSEZk?=
 =?utf-8?B?Vi9VTXdmcDNncmJVek5zdFNpSXFhUXc5S3BRd3g5M2N0dzZkMDRpYXQ0TEdu?=
 =?utf-8?B?eGFJbHh0Rko3aFRPcEJFaG1xYjA2TElnb1l4MTBtTWRNNGkyc0JIdy9Odml4?=
 =?utf-8?B?K0tvU3hnVDRwVmVwajN4R2wwTG8zTDFBUEdTWVZ5UUpRVzJIdWh2enUzTllZ?=
 =?utf-8?B?YW9CWFJUSlR6Szk2WExnOFNzZGNwSWN6L2c0WDROaUs1TWxURUVrMC83V2ov?=
 =?utf-8?B?bFJaUEhWZGRpT3ZPSElyTE9sWkpNMW5yM21oRldSMUZmU29IQWhhNzh1YVph?=
 =?utf-8?B?dVNBT3pWanAzVytxNGdVZHJCOXJBaHdubWxHRjNHcjVpOXNRTFBFQ1BvSGpZ?=
 =?utf-8?B?L3VEUFBIOG12TUM4TVk5NUNEeWpLSkpsZ3laZG50MW8rOWZVak8raDRxdjVw?=
 =?utf-8?B?RXRmQ3JIWC9HV3hCUEdxNTVlZGR4ajZLcXlkWG5KellUaWV6MlREVjIvMEpt?=
 =?utf-8?B?YWc5ODg0MVpwUUdCVTFWZGppYU02YXBta2xYczVRTXZDYXl1YzhFcG1sWXl5?=
 =?utf-8?B?WnBLbkRjWWM4aXFRY2lQbVN4RXhlRUoyRituNDVyN2hVYmdjVUJDSXpOZWdD?=
 =?utf-8?B?Rnh1OTZyWTY5OWpkem0ra1BxbHhUTEZNWHl4ZHRLVXhLYjNkNHB2dWE0aEZQ?=
 =?utf-8?B?MFNFMVAvTyttL3U4V05rVVBIUi9LYm9UK05iS0F5V2pkUTVWRWFtTWVKQXVo?=
 =?utf-8?B?SFd1ejZlN0k3cmx1OUZNQVZKVGg1V2dTR0liZDdJWGtCM1pjbWptZnhJaWV5?=
 =?utf-8?Q?O9i698WozuE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFNnSEk3SktENDY4ckZUNzhVc2VhRThUVTBETE8zdnFiWFE0cFo4YnRJcVFC?=
 =?utf-8?B?blVCb2I5WXhVb21sZmxBb0phWWRqK1MyWmMya24rTTFERG9GS1ZLTXY0MXdW?=
 =?utf-8?B?UVhzRTlGbUhldDN5SHQxRmpEVjBDcmpGVlFrWmRZQVQ4OHFwWmZZdjA1elJr?=
 =?utf-8?B?dVEwVjFuc0Q1dFZXclNudys2Zk5PbDJycGFmT2dOTVVEQlZ5YXBaaVFXTjN2?=
 =?utf-8?B?ZzI2RHdwTnU3dDJ2MzBrc1p1VWNvbnNqR2pZT05sWk1PWTMwSER0aU9TWFV4?=
 =?utf-8?B?cHluUG0xMHphalREcTJIcEZsUzRkNm01UEllMUdUaWE4b3lqaFoyc0tneEVX?=
 =?utf-8?B?Mzhxck9YZXZqWmo5TlJnZmpQTWZiUXJHN2xCaXA4Qmc3NzVhZFJ1M0Nrb3Va?=
 =?utf-8?B?TGtRQUVJT3lPSm1zbkk2cVVTemFRTTJiKzF2Y0hLNG5mNW9zbDBGY3BHSE1V?=
 =?utf-8?B?eHAxaWRDcjcxZ3VWbE9scmtmeXVDL2NkNG9rbUM3NmRtUjVPZkFWRW4wdzZu?=
 =?utf-8?B?M0tPZTI4YW9jeUJSblpCOTVyOTNBc1BuY0FMZ1pMcXFtNnlPMkdqSklLVm85?=
 =?utf-8?B?R0p0RjNzUnpKTWJyV1lJOS9JR2piT2hkeW1JOTlkb1JIQ1Nka3kxUkJCd0Yw?=
 =?utf-8?B?NmdKL2FVdUxMSFhJcEpQRkhqMVBTMmd2TGtCai9lMlVITnFnU0VrMExBWG1j?=
 =?utf-8?B?R1lEOTFudWdmRU80ZTQ2UEFaMkdIeDVkKzZxVGpHYTZhbnJRWVVGYjJMREdm?=
 =?utf-8?B?Tkl5UzE2TWc0NTQ2cnp6VGxrU1lrcWZsQlozTGoydVFSU0h2R2ZOY3UzbEl0?=
 =?utf-8?B?akcyRThHSGZZYXA3ODd6UytGMENHOFlKN3lPMm9Ja1dtTXlPeVJrZ1gwNTJo?=
 =?utf-8?B?bGpienJBbW5nTzQ1cXg3WnZXZzh6SExEWTBKWHp0aHJWM0I1dXV5SW1oZGgr?=
 =?utf-8?B?emxZZFlONmtZVmFDMWxBcGNyS1ZFTEwzWTFucW9DcDBqcEJnN1VnbFFhdWhI?=
 =?utf-8?B?NUE5QnFwOHA1cEw2ejdaQkgzUFdKTndWbC8vWXdaZCs5dCtpSVh0ZTVWWTlL?=
 =?utf-8?B?MUh5TVpTM2NnMW9uREtiZEIrdXJybWgzNVFSOHVsLytibk9lRVZ2ODAybUZk?=
 =?utf-8?B?dGJpUERDRWk2cWJlWXlKZ2hCaTk4ZlA5YzRwWXN2RzB1QVFVMy8zdzV0bW8y?=
 =?utf-8?B?ejROWUhQR2M5b0JRK09rOHZyVm9hYkpzZ2ZMdEZSUjJMbThQTXU1TFk2NXFm?=
 =?utf-8?B?UXdDbFVSaVZ0aTNIb3N2dWVWc1dVMlJnbWxnVlQ3MWFKRDhrWlZuZ2k3TitN?=
 =?utf-8?B?TmlNQ2YrbmF5K3BIcEV3TVZEZ0ZhT1BjSEdkYXdIeDVqbUdIU3J5aS9BbmNz?=
 =?utf-8?B?OWVZWDcvZ1VUV2FPNDB2U2xISmN0T0pBckFibHQzYXpMN25JZHhkb1hZT0tu?=
 =?utf-8?B?eG1YZ2JOak9HVlN6M2JDZE9obTZGVERsa1V5L2VMdzV6SERwMStlNTZ3cS9B?=
 =?utf-8?B?WGRCdTVSbWRYWmRHRjhkRXQrMHA2cVVGeUZmc0NFR0ZzY2I4Y09hTE9UU0JF?=
 =?utf-8?B?SktlOHZ4UVJzMDNVbG05aVRoaXFrQTVHMko3RUhOcXdkWnBTR0g5Yy8rOGJv?=
 =?utf-8?B?eEVzZUpka1BPaEFIOFV1azRRZGsxZ2tqODh4ODdwdmFBSU14RkNOTm1oZHQ1?=
 =?utf-8?B?aUg4aFRNRU1pcW02RTlCQXJCeGVWbVFNSEh3ZXJRY3BIYlVTdTQwUmdUVS9u?=
 =?utf-8?B?Sm5UajNhQWM4cnJxa3BIWlFJWkJ5Z0M5WTZBQTJUclBFdDdUeGpicjltNVA1?=
 =?utf-8?B?aSs5M0RKNzBsTUVCbWFrY1NURHRpOUNoblBralMrZFlMZ3hSOGpBTjZnSTFG?=
 =?utf-8?B?UGZURUY1aVpnTTNMR2hFWjhLbmlvbmpNSEFrbVFYZVNJTzl0aUN6OER2Y0or?=
 =?utf-8?B?d2FsQXFPdDlrT3lpWStzdVdNQWtabHRuRHVDUmREUm5MWDJQVktnQW5IK1M0?=
 =?utf-8?B?Vk1ScUF6aGVGZnpTNTJWejJNS04rWjFDcjVHcXBXM08xOHVVemxMNy9yVDQ1?=
 =?utf-8?B?TmVldXk1b2pZbFVZVmxqbWR5UGhZOW9reGJTRWlxWlFldThZeWlQTnhVY09l?=
 =?utf-8?Q?snMc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a95f231c-4a6a-4a6b-5c99-08dd8c245578
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 22:29:43.9812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnWw/0DhOl95RmdW2p1rggBWwZpk3NeQTW97LBaK99SSoHDw+uvMAzM2JDzXMrw1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7325

Hi Reinette,

On 5/5/2025 4:13 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/5/25 12:54 PM, Moger, Babu wrote:
>> On 5/5/25 11:22, Reinette Chatre wrote:
>>> On 5/2/25 5:53 PM, Moger, Babu wrote:
>>>> On 5/2/2025 4:20 PM, Reinette Chatre wrote:
>>>>> On 4/21/25 3:43 PM, Babu Moger wrote:
> 
> ...
> 
>>>>>
>>>>> Then "bit_usage" will look like:
>>>>>
>>>>> # cat /sys/fs/resctrl/info/L3/bit_usage
>>>>> 0=HHHHXXXXSSSS0000
>>>>
>>>> It is confusing here. To make it clear we may have to print all the CLOSes in each domain.
>>>
>>> Could you please elaborate how this is confusing?
>>
>> # cat /sys/fs/resctrl/info/L3/bit_usage
>> 0=HHHHXXXXSSSS0000
>>
>> This may give the impression that the all CLOSes in all domains carries
>> this property, but in reality, it applies only to one CLOS(15) within each
>> domain.
>>
>> Example below....
>>
> 
> ...
> 
>> Here is the behaviour after these cahnges.
>>
>> === Before io_alloc enabled==============================
>>
>> #cd /sys/fs/resctrl/L3/
>> # cat io_alloc
>> disabled
>>
>> # cat shareable_bits
>> 0  (This is always 0 for AMD)
>>
>> # cat bit_usage
>> 0=SSSSSSSSSSSSSSSS;1=SSSSSSSSSSSSSSSS;2=SSSSSSSSSSSSSSSS;3=SSSSSSSSSSSSSSSS
> 
> Please note that the "S" in above does not have anything to do with
> "shareable_bits" at this point. The "S" indicates that all L3 instances
> are currently used by software and that sharing is allowed.
> 
> "bit_usage" gives insight to user space how all L3 instances are used.
> 
> If at this point a new resource group is created and it has an "exclusive"
> allocation then "bit_usage" will change to reflect that.  For example,
> you can try this on the system you are testing on:
> 
> # echo 'L3:0=fff0;1=fff0;2=fff0;3=fff0' > /sys/fs/resctrl/schemata
> # mkdir /sys/fs/resctrl/g1
> # echo 'L3:0=f;1=f;2=f;3=f' > /sys/fs/resctrl/g1/schemata
> # echo 'exclusive' > /sys/fs/resctrl/g1/mode
> 
> The above isolates a portion of all L3 instances for exclusive use by g1.
> After above changes:
> # cat /sys/fs/resctrl/info/L3/bit_usage
> 0=SSSSSSSSSSSSEEEE;1=SSSSSSSSSSSSEEEE;2=SSSSSSSSSSSSEEEE;3=SSSSSSSSSSSSEEEE
> 

Yes. I see the same output.

> Note that there is no "closid" or resource group information but instead,
> "bit_usage" shows to user space how each cache instance is being used
> across all resource groups and hardware (IO) allocations.

Ok. Got it.

> 
>>
>> ==== After io_alloc enabled=================================
>>
>> # echo 1 > io_alloc
>>
>> # cat io_alloc
>> enabled
>>
>> # cat io_alloc_cbm
>> L3:0=ffff;1=ffff;2=ffff;3=ffff
>>
>> #cat bit_usage
>> 0=XXXXXXXXXXXXXXXX;1=XXXXXXXXXXXXXXXX;2=XXXXXXXXXXXXXXXX;3=XXXXXXXXXXXXXXXX
> 
> Looks accurate to me. It shows that both hardware and software can
> allocate into all portions of all caches.
> 
>>
>> ==== After changing io_alloc_cbm ============================
>>
>> #echo "L3:0=ff00;1=ff00;2=ff00;3=ff00 > io_alloc_cbm
>>
>> # cat io_alloc_cbm
>> L3:0=ff00;1=ff00;2=ff00;3=ff00
>>
>> #cat bit_usage
>> 0=XXXXXXXXSSSSSSSS;1=XXXXXXXXSSSSSSSS;2=XXXXXXXXSSSSSSSS;3=XXXXXXXXSSSSSSSS
> 
> Looks accurate to me.
> 
>> =============================================================
>>
>> My concern here is, this may imply that the property is present across all
>> CLOSes in all the domains, while in fact, it only applies to a single
>> CLOS(15) within each domain.
> 
> If a user wants a resource group specific view then the schemata should be used.
> "bit_usage" presents the view from the cache instance perspective and reflects
> how each L3 cache instance is being used at that moment in time. It helps
> system administrator answer the question "how are the caches used at the moment"?
> "bit_usage" does so by presenting a summary of all allocations across all resource
> groups and any hardware allocations that may exist. This file helps user space
> to understand how the cache is being used without needing to correlate the CBMs
> of all resource groups and IO allocations. For example, "bit_usage" is to be used
> by system administrator to ensure cache is used optimally (for example, there are
> no unused portions). Also, a user may be investigating a performance issue in
> a particular resource group and "bit_usage" will help with that to see if
> the tasks in that resource group may be competing with IO.
> 

Ok, "bit_usage" is a summary across all the groups. That is a good 
point. Thanks for the detailed explanation.

Will make those changes in next revision.

Thank you.
Babu


