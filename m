Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DE820125D
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746134246; cv=fail; b=VYH/PSnf3lBfb0IbEKczlG9ZOvSFbxBTFgdSr4AnfLUFD2rzMG+VD0aHyMiBqI09pS0rTXoOPWouel4oyDw+fgMSCBp+fHazXBE6ziYjNgJiSHNoWBTVJWDrM8hjavb55sj/j/csGSGf5o/uvJfYyZh9h2hgWFD8AUEWkECng0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746134246; c=relaxed/simple;
	bh=2XtBMM5nXtOunvZqnwbYX0e/OijkGc0AzzJKkGB9BW8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uxLKIOpeZ2pprWTSDzdJopbViJFXbYtStRCBSBXYexHPfMOYQiN+kZntJQC8aAWpxaK93NFg6A5QP4iUyAEj6Zyb7hiMLznJ9hYKF9VSBhFwXsMXHBjQr9uGJdwQxBopJ83jf50SahlTmZKZGP4vDQ9snYpmmTtuVnn27jvHWU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XCp6tPzm; arc=fail smtp.client-ip=40.107.243.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XCp6tPzm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAr7TGxIBSyi2GFstM8WQGY0QoQ0w3pckWABVtT/O0sqtiN1ud0PKL6nnw+f9gOsmhNVkHGsQObgynd0WBzuwyPTGcqfwxTqxtSAaMh/YIbfHqbiDLoITN+XfYkqBh8HWo701r1gQGZMqy2MwpnrNN1yZ3CO837PWrK/MP60fwb9TONOBHFHtI+MnXOtLUuzrn4Mnr1HfoVosJseQca0zWWCt6G1kSUpkCww8BD4VnJeiIIKlJJo9+ALklmAybmeKFVXH+N3JL7sAbIsM8cB6+18mkk0PWXeIfLr+f50EhqF+WWDlYPhgdzIL6rCGjWPc2604HY/AlLi6trJGVn0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3R+EKN7FBDD9Km5t61vJyc7EEijUBVdZ0Z4Foe244E=;
 b=rZ7NDHH7JD4bEogiWMaPC/eZynbr9hzVazZ2k7d7ruiySV8feSa+guHDzz3kuJv4vTVbqDdHx2KXmebE4xHPs2WSNK3N1hrJwdufm/vjr7X8AudjRRhKuMAf7oZjYZWxVV/C65SbJRrrD/SbZ0fCgiM/UQFxVXnFCDu2525N/m4hRbhFF8zNELeJye94S6HhqBZBOmRfXlSDmWIgja7NqCIU8/H+qJG/uKnTpkHQfAHZAh5p8psRIxS44EtH/cAUrmZSzGcq1mL/1HAhfAee0KHC5zCgFTQD0+AkOnS37riDbgJJbuTmHQOWMeNKyrl+Xvfi7C+Z9nzapL6k4jC5Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3R+EKN7FBDD9Km5t61vJyc7EEijUBVdZ0Z4Foe244E=;
 b=XCp6tPzmvVQo9wViYt+qcwsKDQ1ZI9ARngR/EyTcjtOmWkZk7gFfq+QdQL5mFp20VeiRjvL1TQC8LwQQQDgGhM7KMJ0JoznUOvXWgrl2/3uWITx//hzvB3Rjgvm2aZvHDBPgAy2FPQJWM9Xe4S0vj9ATkrGWefjqCaChwjvexccgunyQ6uZ4xHFShysJM6jIUUVVtfjgOJvX++qNKKCvj2pJ4zCZSZ30rlSoBFLoGfxqLyzrkRyWeNlD/U1LJ31TP1SZG1j7JakRgDGBOrykLgMJQer48IcCrqJr1Tkn8tyj8+RmmWREbcGPHrhxyNv0xs8z2ZhO+TMiid5M88X0QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 CH3PR12MB8935.namprd12.prod.outlook.com (2603:10b6:610:169::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Thu, 1 May
 2025 21:17:22 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 21:17:21 +0000
Message-ID: <a68503e9-cd88-4c24-a049-7f3da18b9b00@nvidia.com>
Date: Thu, 1 May 2025 14:17:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/27] x86/resctrl: Add 'resctrl' to the title of the
 resctrl documentation
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Reinette Chatre <reinette.chartre@intel.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-11-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250425173809.5529-11-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::25) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|CH3PR12MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d48cc92-e0cf-442a-5f66-08dd88f58fb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVA5dHUxeGNqUVpYZjhHNi9hQUlsWUZyN3A3ME43SGYzVlkwSFZTb1ZaWTFX?=
 =?utf-8?B?eVNrZHZyU20xbXlQZDJIeDhzT211cXNoUkFHR1piMGZFVWZDTm9KZis4Vzkx?=
 =?utf-8?B?Q2UzNVpUcVd2K1p1MjQwRjVXZjhmR0MrdkMwMDVGcWtwNlcrOU9NRjVOMG4w?=
 =?utf-8?B?dzAyYTFtN0lXTzFnY1lHeEFRRkNuS3o0emVMb09BNHdta2xzQ2RIbmlxcUNh?=
 =?utf-8?B?V1d4VnAzQm9BNDBEWW9jUFJGbkMyOEF5MmpBVWdzMzN3QjRmckRuQ2t5Q2E5?=
 =?utf-8?B?VXpTMVdZeTFNTzI0U2drMk12RE1IbU1QVlBJaHQ1MlNaaWZNdjNTMlNLT1Ri?=
 =?utf-8?B?eU5ma0ovN3Q3bGRobU5ZWUNkUCttRTZ1bTFsYnE5SVlZekYwa2RpT3lyd1o3?=
 =?utf-8?B?NlRmL1BtbGtPd3lKNmx2eHg1eUFpUlpUdDhPb2NZRVBtRFNVL2Jya2NsMHAv?=
 =?utf-8?B?aHNqeXB5QWVieU13WkhvWDc5VmliTXFSWC9IbnIwSlk1OGRHWEJmKzhrcS9T?=
 =?utf-8?B?RktuQlpFWjJqL0pPZTlRUEJ3MllxZGtjSk9CNVEzY0FONzVKU2RDSkNVaXJa?=
 =?utf-8?B?VWlWZWZvdEhwTlYxZUdxQjlUN2VaeXNSM3JjcVJzQStOY3hFVGk4djZpU3RF?=
 =?utf-8?B?K0pGK0ZMTHBVR3J1OXV1YzZJczAyYkVQVEgwQWtZaUVVZWh3a1JuYVZaTXBL?=
 =?utf-8?B?UmloNDdHdUhqRXJSanZSS1VqV1NJRXJwQ29CdjBVRWhvLzJHMTAydWk3dlVn?=
 =?utf-8?B?YnFqWUZhMEdLTVk1b0tmaWNnOHVOakVFb0trOHJnTU1IUlNYTng4bDUyYWkx?=
 =?utf-8?B?Z2pRWmdHc3ZGM3hzZ1hmVmx4d1NLOXNFNXlzcEZvT0hpMkVkaFl0Q1lJSFRn?=
 =?utf-8?B?WkMxaHF6dmhFVW0vMnVURk1CS2ZkZGxxWWZVQmdBbDQ2V0lkSzZQTTA2T3Rn?=
 =?utf-8?B?TWJKR2ttd1QzZVY2NlM0NjM1WDBHQVpZbFBEamJIU05yaHJUNkc0ZWV5UW0r?=
 =?utf-8?B?OU81cnBkVEsxRzV0RnZJUFNHWFdqUDA4d1V3OGRJQ2g4amtQTDhCUHJNK2ph?=
 =?utf-8?B?ZEFxTjBCa3BtREprRlRMKzlQZUlrWlplb0RwdU9uNk5OOGU0ME02NHVyQUJs?=
 =?utf-8?B?Q2lDQ0ViUVhUSzV2eDFCVVhNRW5NUHRZNzJ4eDdYcmRSdElBeU01eUx1Y1Br?=
 =?utf-8?B?MmM5a1poMGdkRklSNXB5S25NTXo4b0tMbVpYR3doY1MzMVRWaVB2aGF3U2Ny?=
 =?utf-8?B?SUdZd2hlNjRFNWpWWWROVmpTd0pWTlJnOW0wUFBIUHcvL1MzV2N1SzhRUHdS?=
 =?utf-8?B?SU5mM2dCRWRhRi9wVmc0bGRTdWI3aFcvWG5sZ0V3Qk9EODZ4Z3M4aVNZQXdl?=
 =?utf-8?B?WXI2ZEdIa2QvSitUeVNCMDljUGxKWW1OVmRFSDBNbHRES2dpWVZaZWtXWlZa?=
 =?utf-8?B?aUhYcVNpRTJYWUFwRnlkSDZZUmVsVStxTXQ0N0xQU0ZlNU9VbFArM2h5TWMv?=
 =?utf-8?B?eXFiWmxxaEhHa1RzWW8vNk9BdFdhK1k1dFBIdkRmRkRoK2oxbGpON1lJSlZM?=
 =?utf-8?B?eHJ1amo2M3RGUmR3VDEraGdXd0tmdW4yeWpjU3NxNEROTlE3YzRLSkVJRW0w?=
 =?utf-8?B?S3hOYys3WG5oSWp4U0kwMzdtZk45c3Q5dVVjVnYwVjc3RnVPUVJpMlZtVGtz?=
 =?utf-8?B?RDYwNmVTOHdzUCtuSkM1QjV3WTl4bnVlSXE1aTRxQVo3Y04zcVJ3U0o1Y005?=
 =?utf-8?B?eFJoWGd2ZWtpbG4zZTJiOU8zQ0hLVU5mQzE0RURjdmtQYUIyTGZLNjdYaWVK?=
 =?utf-8?B?ejRhem4zV0FXaVN5WmFFc21USkJIbXRXUVRQTnFUTm5vNlFhd01xZU84WTlQ?=
 =?utf-8?B?UURubzhQSFlKZWR1a0IvUXVaU0JOUmlQZjlIanY5MThZVXQvZFhBV0lRVFVD?=
 =?utf-8?Q?uM3Vfan4vqM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmtuTFM5OTFJcjZJTW0xaDFaZjZLK2UyUk1QWllrTWJwdXpQb1YzL3hDLzNF?=
 =?utf-8?B?bEdNOWFXbjVtelJRYUxtZFdzRGtBVHlTNGJOS0RTakw3VmZSWE1ienVDdEN6?=
 =?utf-8?B?ZzhaYTJmZllaN1pGUUtMZkEvRS9hMHVRVVlVNW54T3BEL1A4YzVycnFHZmIz?=
 =?utf-8?B?M0lCaDYvYnpCYm1pdGdMOEJtV1RNTGhydmcwNlBnU0xmRDFORTZCRW9kVGlX?=
 =?utf-8?B?d0V6V252dGhGbHhhZnlGUUx3UlE4RS9YaTF6eG13VFVFQ3dZdWZoL1RCU2lK?=
 =?utf-8?B?L2ptdTdwSll6SzBmaEVobnBVOFl6eWZhY3Jkdk5NQmxTM1BHa3hKbFBhRVBT?=
 =?utf-8?B?WjNZVXhtb21PQXprZVM1aTk5eTkvSitORmhFTWVTOVBCU3lhb3hFL0o4dmtv?=
 =?utf-8?B?LzdrNHhiV3VhNmdENGJ1bVBqTEYydU5UNVhoSmd5d3B4VDZxblpsRDVuVG5n?=
 =?utf-8?B?OE9ZMTNqOTJJTEtPQTErZzlyQTJxZWRGNFVaWE9xelc1cWZ0ckFYN2JIQWth?=
 =?utf-8?B?a082OVpFZWNPaDdpSDJBdVdMd09TYWZybG1MOG8yMzhwTy9panFYZnp1QWhz?=
 =?utf-8?B?a2RhRGFlV3ROL1lxQXlud0FzblZhQVRTUmJSeVN6TGptcG4zQmdrMzVSQkEz?=
 =?utf-8?B?a2RvVGpTN3pmZlVtZDAzUVpmRDRjOTREN1J0TXNXbk1qNlg2d0dTMEpoRGpX?=
 =?utf-8?B?TERGdXhweU54R0FOZjlYeGt6Y0JjSkJ0VnlMTytjWXViQjFxaWlieHAwNHR1?=
 =?utf-8?B?OEhGZm9NQVBOTE00OGR2MnN0YkN5Rnp2WkRTWFN6SFlaa1NmUERBWEdTNjdP?=
 =?utf-8?B?U1BmL3YxdlgvTWJyeWNNdEFjSDJ1cGNwdXR1ZVF0NnA0TEhvUEtFMjAybUxm?=
 =?utf-8?B?K0R2ZjBieS9xMkZkM3ZOYnNLZjJVaWcxWmVxM2VkZkJLNGVJdlhsKzlHVmZi?=
 =?utf-8?B?UzZPNWxRN0kxSG95L3p1U09taFIwa0tFOEhrdkg0NExSYzh4eHJpU1F5UndB?=
 =?utf-8?B?Y3psVjVsempkZEF0cnJPcTdoL2xWdW5XR05jYUZYR20xdlBLZ0dWMzFjVHhR?=
 =?utf-8?B?UGZ2aTRuZkt1aU40b2ptOHNlQ3hEYzBFQ0IxV25COGtiYXQyTEQzbVZ6L3Vl?=
 =?utf-8?B?bTRFckZYNnlGay9hTG9MM2MvaXVFeWZ6dUxyS3d5RG1CQnFNazUxTnQ5YU1s?=
 =?utf-8?B?S0N6c1BXVnI4WTByWHlzbXpyL2o4NE12ZERydnJGd1hwU1gvaUZ2SWNrcGk2?=
 =?utf-8?B?ZU5rYWk3VWxGdnp5QzE0UjlMTjgweUdjdmRJYmdhOGpvc1htQ05YaEdqdWw1?=
 =?utf-8?B?OUxhekFYbjB6a3htdFpPQTZyRWNjUFpPc2l2MlIvWndFMEV0bkdJYWd0RkFk?=
 =?utf-8?B?ZjU4Y0xZT1d4QjNrY3BmbWRqRUhjQ3ptaE5aVW1tMEpTejNBbC9OMTMwWnll?=
 =?utf-8?B?b0VNQmFnU0RZdG9ldDFqa0hmWTA1NEYrRDRBTlhoc3hlNmZUY1lkc3pWRG5L?=
 =?utf-8?B?bitqZXc2S3IyQU52N1k5L1NWV1U5R3FHZnhSdWN6eEg5U1QzUytqaEVDZlNF?=
 =?utf-8?B?dC83L3Y3ZWhwNDJzUW9OOXpOUmdYQ3lKRjJZbnlKbFJTdTVKSjQzYWUvNm1i?=
 =?utf-8?B?N0F0QnpBeGdadTV4SzR1dFRlNkZTS2MrbitYbXJncFJUREQ2RDBXN3BUV1pj?=
 =?utf-8?B?ei9BelZzVkJjRXJYby9lNnpFbEdGZFZaaEJyd3RXZFZVcGVBdm9xcWZydHJh?=
 =?utf-8?B?NWNKbVlvcVZlaUxhWUppOU04b3lOZUR2cFlYQkFrSGVQdUNoZmlJaUhDRnNs?=
 =?utf-8?B?QUphTGRjMHU1dWhQNUVncDJxYW9yWlJ5NmNFb0RZaDBQa0RHV3JKWHpXR29M?=
 =?utf-8?B?YnVUSjFZNUhxY1hNUkVhSzlBbUtMNG5LbHdHZS9OYnU3cWVMS0tjL05HZVk2?=
 =?utf-8?B?STRqblNNL1Z2eWtvRHgwdW4vaHc1YitOSDdrV3JSendjakhIU2QyN0I0NU9W?=
 =?utf-8?B?aGF5djhKVE5tdzh3WmF3YktzN3RlSTFjdVZvczhxeERpbE41aWttbTRMdVY0?=
 =?utf-8?B?UnZYZ1NMbUR2Ny9YY3p6NU1oZlRUUGFObzRnRWkzcU9xMU1UOUliOVBQUXk5?=
 =?utf-8?Q?gHqLAj7Sr+g7KsMqn9nN4FQKc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d48cc92-e0cf-442a-5f66-08dd88f58fb8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 21:17:21.8106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hf+SmSeeA1BrpDMRJZZOjY2Lf3Tg4TXt3W3JNIk09zues7OV/XGSlAdy4I6f71V4couhIVa/TyUf2qcK0dELpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8935


On 4/25/25 10:37, James Morse wrote:
> The resctrl documentation is titled "User Interface for Resource Control
> feature".
>
> Once the documentation follows the code in a move to the filesystem, this
> appears in the list of filesystems, but doesn't contain the name of the
> filesystem, making it hard to find.
>
> Add 'resctrl' to the title.
>
> Suggeted-by: Reinette Chatre <reinette.chartre@intel.com>
s/Suggeted-by/Suggested-by/
> Signed-off-by: James Morse <james.morse@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

> ---
> Changes since v8:
>   * This patch is new.
> ---
>   Documentation/arch/x86/resctrl.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index 6768fc1fad16..c7949dd44f2f 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -1,9 +1,9 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   .. include:: <isonum.txt>
>   
> -===========================================
> -User Interface for Resource Control feature
> -===========================================
> +=====================================================
> +User Interface for Resource Control feature (resctrl)
> +=====================================================
>   
>   :Copyright: |copy| 2016 Intel Corporation
>   :Authors: - Fenghua Yu <fenghua.yu@intel.com>

Thanks.

-Fenghua

