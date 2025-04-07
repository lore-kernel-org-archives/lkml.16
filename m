Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADFC82D91
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013124; cv=fail; b=ISIj/roH9blO2bQJI0q7m5WGm+EXW8FPA+0jwsyZz/XgThF1ogxhXLPWE+FUb1ONytXqOOVyJnJ5ZpqtZ9ZXFudVm60qteFs7CWEpCZEos/89IY3FVmkPv/9y8CBGg91Ht9mqYRYYer+cWwJhOwW0IQbcfSJKMDKy7/Elp5XwJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013124; c=relaxed/simple;
	bh=gJYNG14WckjFcGdjz6sWGv0yeUzIgSMzlcNAJ60xXLg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FJlw6c/RKUjwSfgaAno6QGwRl6ahWx0T0CiMvKSpsIptvvHfM3Uw+KLUH5oQQPJ8eIVl0OmLwEE4d3QGkubCBf/FuQQP8mEmKFQInXec091xMkJ6ySQf/VyvqTRa1RQQDgGU7RHjj0TNxnrKE2f9FV0+0eFCGU9E+EyQJaSpp68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FB94a/oj; arc=fail smtp.client-ip=40.107.94.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FB94a/oj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oy6J+qmDbDyJg+q6ZlFE4fDYcvlSw+OC650075j3NMEN0UIAr6CISNfKZqw5iqtr1IpvVXHCXVM/Z9DH7g3ocyUmARAnruKBxlpO7dLj5iwR13xkin8Ks+snfSYvvlez///NaQ/bdwDC9bsaVTYfQrj1gJtpgoqWqT6zdqyU97qFgFtoeOYS4Zspe4K3O1IDM0pZ1cWhMBH8qugviOl6azxduNt9jlccMC/IoxNlgbsMh7nXvdOX/GrxyiCc8QALqStwM2bKbUL/yfn9mEc77w+MmagaWAjJUjK2tIPbj5Z0Zr68OkguUqQ8GeKD0d/OnlbvJ8MVw6pxtbpnp4p2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVFUbV44E8OZvDWwL7bGX9hgBSr1Hfy5Ku/lRda9UTU=;
 b=qRnRGQictyTOJCG5mAjZyCpiU7V9zOE8m8UcCMSJbvxNpoL7Y22umQ3ePMHhy9+FmQ8reDaPWuKp5bfyHcTh1v4MVAGySucivpUGVTIxHcu4I8btTKYyGwxZtKW8CE3EpKMYchLUAB8i/rhDHEkNQvM289D/qjfEnGpODLZ5sb/WMR3P+fK6lrs0xyGrNHHf0wILyF/fv1Sv/m5m9J/Q5c+RwQVgsMV0Dbe5NtS4Xqy9eOGMV7vVXtZyG6LmT6B3H11W9j5iURLIvDHEq6Gzc9dmqrAHwUuiuu4JPuDOE8ZqJ0ZRV50O25OTQV/Yg1yKgKrxGj0nA+/5M72XHukJKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVFUbV44E8OZvDWwL7bGX9hgBSr1Hfy5Ku/lRda9UTU=;
 b=FB94a/ojwpaoKRt4t6FWB9Lw5CBGX3si1rY1Oe47pByd2KVdY4W58Q8JEd7njdwTQmiQP+8exNgBakOuGxgx6NNOtL1xBOK+in3zNDlDuOFfmpZva3WtVMrJAWyp05TCTg+58NB/BmKwBsrjOws3xvdmaXtWGqoRg+cYN6kGhZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9193.namprd12.prod.outlook.com (2603:10b6:610:195::14)
 by SA3PR12MB9159.namprd12.prod.outlook.com (2603:10b6:806:3a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Mon, 7 Apr
 2025 08:05:20 +0000
Received: from CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7]) by CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7%5]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 08:05:20 +0000
Message-ID: <f50d5f52-d25a-ede9-63bd-c55c15778e76@amd.com>
Date: Mon, 7 Apr 2025 13:35:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 05/57] irqdomain: cdx: Switch to of_fwnode_handle()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, tglx@linutronix.de,
 Greg KH <gregkh@linuxfoundation.org>
Cc: maz@kernel.org, linux-kernel@vger.kernel.org,
 Nikhil Agarwal <nikhil.agarwal@amd.com>
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <20250319092951.37667-6-jirislaby@kernel.org>
Content-Language: en-US
From: "Gupta, Nipun" <nipun.gupta@amd.com>
In-Reply-To: <20250319092951.37667-6-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::12) To CH3PR12MB9193.namprd12.prod.outlook.com
 (2603:10b6:610:195::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9193:EE_|SA3PR12MB9159:EE_
X-MS-Office365-Filtering-Correlation-Id: 807ab7af-3617-4eb8-d704-08dd75aaf086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnUzRmtWQXh0bHUvSnZ0SGsvWFZQbUJkUDFhSkVib0ZFMXZRTXhod1BrZEVx?=
 =?utf-8?B?bmYyVS9pVURCaFE0SWF6Q3crMHdwUEJBVFZxaWRmRnFSVlFpOGM2S0crQm14?=
 =?utf-8?B?cEJwb3RrZk5TTjRnQnhGU0R6ak9PNUNkRk94d1ZsbUpLNnNVNFpiNWhqLzJx?=
 =?utf-8?B?S0lreU9TMk5kRXduaURnalVMOUZ0U2JIRlJzelhwcURnTk9hVWl5bUU5OHFu?=
 =?utf-8?B?WDRWSERqYTh5S3hyK2RhZ2E1ZjQ2Umo2eUYwSWh6MWZ6cmhMUDNMRkI1NmdI?=
 =?utf-8?B?NlZDdUs0MGxIVkZuVUw0Vy9YeGY1em85N0MvRVp2cUI0SlVqWnAwMnVGM0dZ?=
 =?utf-8?B?cFBMMUlaTWF1UE1POTIrbWV1eWNNWTFOcTlKZ3NsQ1BpSGtoRmVSWW9UQUxU?=
 =?utf-8?B?b002TEZKK204UzkzcFMxWFNueTNVTUhWVWUxTHU2OTU4YjZHcHlESGVaK0J2?=
 =?utf-8?B?cmhVR2dUd0JpdFBCeHd6bUlpaHI3cU1EaFlhVnR4ek1PSDJkamxqVWNXUS9B?=
 =?utf-8?B?aHpldi9POG1Ha3BZL3l2clk1UmNNUnAvbStWbnNUT252akhabVMyUkpERkll?=
 =?utf-8?B?bVdwOTQrb3dpL1lCVlFRYStLOHlxVlp3d1RnOWxwM0dWWnBISVFveHhyMUhZ?=
 =?utf-8?B?R2MvaXhzaFFmUVJVK2VZZWt1R1NmWWdWOHMvbCsxYUhycTdFKzRHMEtOOEhl?=
 =?utf-8?B?dFVtNHZLTStBdWxCdW1FbDU0ZUZjY1lISzZhekJJL3EyTzBvMWhlYzNTQTdr?=
 =?utf-8?B?bmVBUFVYS3F2d1c4N1VmY1poK0tBa0hTMjBqTTJOdmJmU1lnTDloV1NCaTVU?=
 =?utf-8?B?NVl4NzJWY09aQWk5c24vcjM2bmJkbC9WMUVLZFNKRE9qNi9mN013a2MwY01S?=
 =?utf-8?B?VFYxSFpjejFkNWhONFFiTzQwQTlWK296V1l1Vzd0T09sOUx5MEpGaExRc2FW?=
 =?utf-8?B?RmdmOUtqYm85VEd0ZjFYcm10czE5TENGSXRnOHlxMm45cHlLb0t0SklEVTNh?=
 =?utf-8?B?eWJkdnN0a1llbWl5emdPd1oycXAxN2RnME1HWEVhWnJZdG1oLzlweWVBRHJ0?=
 =?utf-8?B?WXhZemVoSFF0STcydVJJVHUxSGFMeWl6ci9ka0F3cGVLZjVKTDljMGJoVjJm?=
 =?utf-8?B?a2oweHY4Q0srdTZXeEJNTVFDanp1ZUxJNUtEdHp3aW8yd2NZSnNhSHFWNmtz?=
 =?utf-8?B?RkVjcG50dk5uQjdlYnM5eDlqS09xTmVCUkRRejhTTmF2NFJqT3cxS0tQaDNZ?=
 =?utf-8?B?S29laGFLR0JMVlpGYUNJSXQydWp6dUZma1F2bVNGMC85cEY3eU02QWVSMVY4?=
 =?utf-8?B?ejM1ckFiMERmMFFmMEtuR1RCa3Rhd0Zpb1FnMmhBcmFJRVNueXl4eUZNVTNs?=
 =?utf-8?B?LzNKSTcrcW15V2w5Z3krTjFQTjNHd0o4NUJxZmIyK2tqQ2dXeXdYOXU1TEpT?=
 =?utf-8?B?U2RIV2V5MTFzSW9xWXpqaHJGTjd1MkwvWlVSQjRqM1lxWjRvQVdQN0llTHly?=
 =?utf-8?B?c2xzVEdRSS9wZjlwanZoaGxmRDlWUjN3WDhoQ1B6Z2tHbXlrT25sd0dNZlZ4?=
 =?utf-8?B?Rzd4azRuVnBvZS9kNFFnWEFzY2lxS1BiMkR5V21nMXdqcGlPZy9pYTMvckNN?=
 =?utf-8?B?ZzRYWHZXa3NwazZOTE0zY1YwcERVQms1UWp1YkYzR25lT0RLWHZkSnJKdmh5?=
 =?utf-8?B?VGZpSllnUkZCa04rT0REWHVsbmZPQ2M1UUhVMi9YYnVrSkxTMVcvQlJmREJN?=
 =?utf-8?B?Y21xN1lLcENQb28yRkl3L0gwaEJYbjcvVTRYcmIzOWdwLzVBbE8wWkRpdER0?=
 =?utf-8?B?eTgxMlhQNXVOZ1lmQnhCN3BXUk9BQmNKZXliSVNhak4yclZOdHZzUm5HMDcy?=
 =?utf-8?B?OXFxV3Awa2NXdms3cngvNnZxUzROTXMzd1ZtenU2VFVUZXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9193.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUtlU2ZvYy8vZzJ6MXNGalljbTFXdWFtRjU0QnFTZjhJZXZ2R1djMlVzeFpn?=
 =?utf-8?B?c1BmSzdyWUQ5SThpZC9FYkdxTUJ6KzhDay9OSEtsWWlKZDNuS0g0OVNQd1Iv?=
 =?utf-8?B?b2RZUDR5SWVqb2I5Q2xXdXR0bUwrcUpnQWNhamxrN0hBZzQyTkFLU00rR0Jq?=
 =?utf-8?B?emY3blMvTGFTQ1hzRmRXc3d4YWxlRThlYUYwNEJPZU1FenNIcHF1blZ4QW9H?=
 =?utf-8?B?eFZYRjJiUXUwMDg0b0g4TjlQODQxKzhHVEpuS0tsUzdlbGxXMEFRVlhpRDBR?=
 =?utf-8?B?UHlSWXRvSzZ2WmI4NmRMMkhITDlUMkpESHN2ekd2N0d2TTRuaWsvSGtJMDhJ?=
 =?utf-8?B?ME9md05LaWVUVDBVNmQ0SFRPdkJFeDZsYlNiY0lXK3pSdXlXUU5EZmJpamVz?=
 =?utf-8?B?LysrL0VKZWxPM3NhSGVsVUwvM1hqUnVCUVp1dXRkVW5VeWRSQkhMbGF2bzg5?=
 =?utf-8?B?YndVNjBFTUp3SGpSSWdBTFdWTTdyZ1BjeDExTWJYZzViOGtvWDh5R3VmVUJw?=
 =?utf-8?B?VE04MWhTWE5ZN052UXI1dkNyczlrT1lEQTN2Z3BUQ3J1WW1IM1U1QVBscDRu?=
 =?utf-8?B?dHAxM0xYY1FQTDN3UzFTbXVqd21yZXBQTW1ZR1Y4R3ovN0F4VXFSallvYmRw?=
 =?utf-8?B?eEMydFJ0YTN1WXUrNWptaVZrTE4vY3FHMDduQ0JhaENBL1dIei9IU3MyZkk0?=
 =?utf-8?B?eGN2OUR2TzhFM2hWWUV0M0hBUHJkZk9SdTBXUWJGVUxTQVorbE51SXJpbkFi?=
 =?utf-8?B?Q0dBdFhUKzRTbjJsdmYydExUYmNCTS9FZVFDREE2emFtOExwTHo3MjEyMll5?=
 =?utf-8?B?cG5SWkU1SFZHWWpQN3llWlF2WUdDQkNvSk9RVkpwYTMxZEp5RTR2VGhjOTU1?=
 =?utf-8?B?blpUNkprbnhKTmFrdmJxMGxvOFFlakg4VnByTHlYVmVQYThKUWJDRlN4MjNL?=
 =?utf-8?B?V2s5S0N1NXJmWTJ6VWwzenFGM1c1VUV3STg1OWkrRlE3MlVsMVczLzc2eEZ0?=
 =?utf-8?B?eXJpQW44TlBUaThURlVvVmVtN3h3Nlo3c2I1K255Nm1SNld4VnFJRmlnWjdV?=
 =?utf-8?B?Q01nOHdvaDF4VE9qbHU2SEhCUVY1RzhGTWVSbDU3Nzl1YWh4enRXWGtxMTNE?=
 =?utf-8?B?WVlXVjFzbTJGeVNHQThpcTgwWG1qcGlXWGI2bjdIZm9NQXNVYjJ2SmREVTBt?=
 =?utf-8?B?TGhKZTVMNmJaM0p4NlI1Q0I4Q1VDalEyTUxySXhnS1F1NnBEYmFyTERrbFV0?=
 =?utf-8?B?MS9LNzBnM2p3dkpMY2VudExmWkgwckgzbFk3UHhRTzZlMnVKd0pKWEZiaS83?=
 =?utf-8?B?UTU1LzA0eEltOVg2UEdtajllY0QyWlFrWUxkRkgxckFFSmJoOVV2T2JNaVov?=
 =?utf-8?B?bEMwbXU3OExOUG1VZXQzTm9ZUndtSXlTOFl3eHZtR3ZFMElMMDM1Ym9mMkFp?=
 =?utf-8?B?aUlpcUVsZTZldWtXODhwbFF3dVRmSFVNWkwvNzJKSGdpa1Z2RHp6SGxjZEpB?=
 =?utf-8?B?bFc0SHF2S0ZTampsUm9pSFQ5U2Z3a3BVNGdsamRiV01FZ0NrNk01KzdQbWNt?=
 =?utf-8?B?S3FsRUwxcVFubW0xV2pPS0tDcnAvSmZsUmY5ODhqT0srQWRlUjQ3NksxNnpr?=
 =?utf-8?B?emxMc3M1WlB6U05VMCtHb1A2V3JZdjFxNXpmcEhpaUhack14YzVoaHZmUHov?=
 =?utf-8?B?YnRhVHUvWXZKWnE1aGF4eWxLTGlTMXNpemY1bDBhUWJ2aFU2Mjc0MFZ0R2ov?=
 =?utf-8?B?YzVmOVc4WEJCTXNObE5JK1ZVT2luaVhCNStNc3VqaG9HZXQ5S3U2di9GVGQv?=
 =?utf-8?B?UW5vdTNhMFArcWUvbmcwQkdPanNic0ZNTVBOVHhkRWxZOXNLRE9McnVyeEhy?=
 =?utf-8?B?aThhYXhER1pmcDZWcUtKVmdIdjk2RDhsK2t3K0RtOWd4UFdZdHR6Vm5kZmVZ?=
 =?utf-8?B?a0ZGejFlaUcraVFvK0xid3VXalhCSjNLcVFISjB3WUZTbndWVVJJRXlIaTh3?=
 =?utf-8?B?TDNOdG1seGtTYTlURHE0c3BPNzJlQjB0VzE4b1E3cWxUU0xUT2ZEdE9hSUV3?=
 =?utf-8?B?VGdhTHU1SnJHblVoemZqS2xhVU5PRVF5MkVHc1pLRi9FM3pkMGdQRFRyZ0M4?=
 =?utf-8?Q?1oXBwVOJyuty2soYtBVpSPcu5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807ab7af-3617-4eb8-d704-08dd75aaf086
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9193.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 08:05:19.8957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4pyG+xB1HWhemj4WWuvKeV4wjsAVp1ned6h4JB99C+uVNIjatBHRujePmHXpCN9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9159



On 19-03-2025 14:58, Jiri Slaby (SUSE) wrote:
> of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
> defined of_fwnode_handle(). The former is in the process of being
> removed, so use the latter instead.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Nipun Gupta <nipun.gupta@amd.com>
> Cc: Nikhil Agarwal <nikhil.agarwal@amd.com>
Acked-by: Nipun Gupta <nipun.gupta@amd.com>
