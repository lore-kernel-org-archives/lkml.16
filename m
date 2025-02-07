Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E7E1AA1FE;
	Fri,  7 Feb 2025 18:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952595; cv=fail; b=uxhSLrciuv0mmJgc3dVvlM704WLV5j8dLJU2GxxQm+SsHk2W0htKqXC3RttZlurwfVsb7bS0UHoj8KwqVoQ+l4RR7VthBSDvBoWAw55uRRikZImfYTDehOfOplX5f/inKcNG8rwpKxIftLsZZj5xE8d3qA00SqvbXQGkwl2r8qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952595; c=relaxed/simple;
	bh=7uP9LYrn19+vjrTMGy54SxhZ9aNz802LJz0a9XhyjMY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E0xSXbazHYgHa12g3ynz4TuDUe4tHV1QfmSUWi/oHoEpPyDPSz4Sqtd90ScZPQM8qrQ/IjwDQZYTau0xFcMcS9TDZps3rKvLE/9knJiU6XXjMyLj9LxyYaFooIGevYj6BjNMd8orjdXpesyVooRC6f5Raa+ZEtApaQZAuaeUiv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UEN89cm8; arc=fail smtp.client-ip=40.107.243.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UEN89cm8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxVz3RpgeTWMgsvuRDx95oug6NNQvpmywdne+WusKkNbCb25wRKagJFtlSJoEC2wqqzx8le3lDsFvemrdcGYojy8psGXHdVMEufe4OEQEaM3SltRI+qEPnJhv4ONPf7sGfrLtNwSVFp7caHqy2WeaOv1WFs3h9jAKpmwU+pjfz3hVkARwUDCTy72Ia/R1iY4G1i9GVBs0BXeC1OTF8nDyJT+GF9+hoiI58hPLI/i8zrV6guAvpdf7sfU8jGQ4/eoWXy4PgfdJVymDPS3/XL6kks1vkQJkCf+u4vqQ8TxXXz99xvl/pEYk4HwSWO+yZzYdhOd8UUJJJfcLihuox6Tag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoJJA90trniwsZb1hL+aZ42jw/nzhtiABaZNX7CGuE0=;
 b=G1WuASMMUa/rgzQPo2fQWFSg0FDi02+3GPo21C9EFWg+1LlbrrYX+Q29MNpUAdmNlWG7HsnMVZs+68BfeFklYnLp+F/Oh6yJFbUZ8+skL4oEQ4n2VmBD4+/lQtYEXii0CYA7gNz9uKfiW5NCkWp1i6tW8qnBJF+o9/bcZlcSyn9QjkpuKSdDlMuJHJfUeK9yGHuIHnzOXhTF/VsbJYC2rXTD/tT/+ZDk5IS1am0+FUoqp4EUYehrm9tzASEzHvbK8h8clblQZxEWDSMAyJfGPbsxRDib9JIeKtEVHB8olz3ydsPYvhWBnCFVU9ZIjK0GMqjSIQHO3Mg5Rk/Qg3NJBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoJJA90trniwsZb1hL+aZ42jw/nzhtiABaZNX7CGuE0=;
 b=UEN89cm8P7y2pYpGiQoZOt0BxlnPK/KryR+stEsFb7oF3340W9p7kAcm+mkcDFz8cbs9NSav32o1HDserc6JwItutYZ1/xCmFhlWtw/hNiCyHI/Xm03PHFEmLx0TsJ+zSj/knj1wcNH27SGp6EnlK0l37GzWKUHaxJDfp3NC1aA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA1PR12MB7565.namprd12.prod.outlook.com (2603:10b6:208:42f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 18:23:07 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 18:23:07 +0000
Message-ID: <7375cacc-5800-487c-bd8a-7ea11e694598@amd.com>
Date: Fri, 7 Feb 2025 12:23:02 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 11/23] x86/resctrl: Introduce mbm_cntr_cfg to track
 assignable counters at domain
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 tony.luck@intel.com, peternewman@google.com
Cc: x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <30652061d4a21eb5952a1323b76ca70927412a30.1737577229.git.babu.moger@amd.com>
 <b88868e1-52b2-4a66-bec2-e0846394b74b@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <b88868e1-52b2-4a66-bec2-e0846394b74b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:806:20::20) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA1PR12MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: dc523cb2-96d0-4221-46ae-08dd47a4782b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUlWWW8ycGFiaTN2RWRwRmJhZU10c0ZVcVk5TDhseURRNDZ1RmZEdnBBaXB0?=
 =?utf-8?B?NlAyVEx6K3c2RW9VUzBkNnBXaWNVY0xNTDczQmJJclFUdzZYODJzRWlhTHpY?=
 =?utf-8?B?VEpobTVZVkxKa3E2QkRTSXpTUE9WUGlodXoyRGV3SE1JWGFGR1dzcVgrWVBL?=
 =?utf-8?B?aUdmdTBndGt3YlNMemtaL2l3VHhRc05CZFBWNzFNb1NTYlNJWUJPKzFSU0h2?=
 =?utf-8?B?VzdKbkpIcHdVejI3aFkxdEhGL0JaVnlTZEl6dVpVaGFCdlFXNGJoSlMxZTZt?=
 =?utf-8?B?ZU1XYVJFcldkQlFkZ3hlZ0tmTS9ONEd6Y1JqeFZaSGR1a1JxZThSRG9rV09R?=
 =?utf-8?B?azFpeXM2VGplc01vby94S1N1bXhvVGh2eEkra29uRE5xWldPYUo1ODd1QVNw?=
 =?utf-8?B?dld2b2JVenZUVWZHaENuRXpOVG5IaWQvNys5S3hYUEJSSXNUNlR1dXo0OFFK?=
 =?utf-8?B?SmhTaWhlNDh5b1V5Si9SY1NzQ1FnanRrQzg4NWovTkpUcGJMYXMrbzRXYmwx?=
 =?utf-8?B?czlVNW95ek9wNnpBZEorcnVGcWVBYUhSUTVlVnlaUk4xWGd5eUhjcUdka3Nk?=
 =?utf-8?B?cERySTFyVCtRcEhDUkwwS0d0eGd4T3puNDlVQnNNajhKUDNabkdnT1RmZGta?=
 =?utf-8?B?K3F2S3Q1TjFsV0huTVMrazE4TDNYd1Zsb3k2cExHUlIvcmprNzdjWVowUEcw?=
 =?utf-8?B?bkxBbjUyZHVKaENDZEk2QWw3MTRCeUZpcHRpaUFDSmxTZ25ya2FFaEw5TStI?=
 =?utf-8?B?Q2FGSVFvbGtBTnFFWjJ4R0pFTEluSzhubUNZS0dSZGdrODJRaEsrRlFNK05y?=
 =?utf-8?B?UENoUzE3ckgzRGU3QzVRRGRmVGdRY3JsbE5ldytHVnBybEFKVSt1SkFPR3RO?=
 =?utf-8?B?ajdmOFdQK3FYeEluNzRqT1dXcVZSQlRuRjZLdm1IalF0UXgwZ0NtUHByL0hM?=
 =?utf-8?B?MEdpRzdPbzdJZldQV0hLU2RLN0dZNTl4VWlObndzVFBvMXBNNnRjMjNVRHhq?=
 =?utf-8?B?c2t2Y0VGR3h2SUtodDRFV0YxZVR3d1hFTUlIVUZhSjREejJSbnk4R0U5RGtw?=
 =?utf-8?B?elc2ZFJreHVZSk9udnhkWjRBdkhGazBuWXpIUzBrdm1kTlVmSEQ0RTlGVlIx?=
 =?utf-8?B?TGVsSWMvb3NYR21XVHdpZVJ6NkVOYzlQT1NBL0R6SllDSUs4MjVOVzZ4TElh?=
 =?utf-8?B?QzJjdjZhUE5wYlprdm1xbWhXbFV0cElzKzFCL3RxT1JoeS9MeFpiVFBvdHNs?=
 =?utf-8?B?cXVLcWRRRmRvQkphQVpWOHhYaWtyazdOM3RqR3JaSlBrQTBBRlA0Q3RhNDQx?=
 =?utf-8?B?NkZVQXFQeHNwMlFudGlTWmxOd002RFJnVVN5MTlYM3RCSGVTekFkaFVwOUl6?=
 =?utf-8?B?L3dacVZsQmxGMzFNQklrQ0xzN2JwZnN0OHl1bGxPVmFVN0lJK1RvLzNaMlhC?=
 =?utf-8?B?eVJZOVJCODZOZmFsRTdLNjg4ODdSTDlqVDJjY3VWSkd5L09Oa1lxR0dCcU0x?=
 =?utf-8?B?bUptY25ON25HOSszNkdOUkZra3lLYlBqalBIcjRnanRvUnd1dENVeG51Ry9R?=
 =?utf-8?B?QlJxOTI0K05EUkg5RE1rWGh1c004NUxhNlhQeE5pVERvOHdQNFZRaDRDMnBx?=
 =?utf-8?B?QmttZ25yUUNCdUFzVG41YXZUTDNQZXpIK0xWUmNoc2tKeklFQXVLSWJhelg0?=
 =?utf-8?B?WGZMaUpncDR3YzFOUFNsWkt3L0VZMGJPcTNnc3V3QUlMSGh2N0J1d0VYRUVn?=
 =?utf-8?B?VWF5UFI1RzVOaFFBQnhKWkttKzJsbnVFZXArNzFDWmY4T0FkVm5XbGtHZGJQ?=
 =?utf-8?B?aEw5bzFZcHhiNkhRazNTSDZoWFVCTXJJYllObzRtc2xzYzNHZEJlTTdRT0Nl?=
 =?utf-8?Q?05WjaFrMR2Lgd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHpCVmhOMDcvTnh0SmdYWE9nT0M0NGgzM0V4c21KcGZSdXlSREcxNDRuVHpt?=
 =?utf-8?B?R2c0RittYkZxNEtQZWQ2Tnpsd1VYS0M1dmlVbnRPdmpRaTh6QkVDUXFYQk55?=
 =?utf-8?B?RkdJTTRTdDZCcFNsbnFXdU9sa3pFWjBocFc5aTlBSzk5RFhIOGhFd2gycGI1?=
 =?utf-8?B?SktyenFEemlxdUhzdjZ3cG5vTWdvS3BodEVrK2pObEowdEp2SE9MaTBITk1P?=
 =?utf-8?B?ZHRFZDMxa2V1OGZjcHROSVQzU0NVdnFKSEQ1T0lMZ3NXczdTRUlBZ2tZOGJx?=
 =?utf-8?B?VEYwZ3ErR0pLQXdMakwvR0prV1NwSXltN1BPT2R4ODQ3Q1dSaVF5d0RpREl5?=
 =?utf-8?B?MUlxTVZLbERnUjJnTEg3QVRDckNabGtZV1FWZi9IYUIzR2h5Y3lhT1hxWlpo?=
 =?utf-8?B?R0hNbHF3bTV5T2hWalJzRVpOUEk4VW9EcThDQlBFWnhPTkNqeW03M2hvTE96?=
 =?utf-8?B?RDF5MG5Dbm9kRUFGa3k4L1NyRkFONHFmK2d5R2JpWEdTZ2MvOXA4YjhRdFE5?=
 =?utf-8?B?TUhvMHFRMTBETlh6Y1Q1czU1aDRSd0hvV3h5dWhFMGJmbmFFRGZUdndqeUQy?=
 =?utf-8?B?NlBuQmJXM2kybjc5L1NlQUJyam10QjNhTWkwKzJaS0hwQURidEYzNlBZWVJ3?=
 =?utf-8?B?VmdPU0M2R1FueUU3dXd5NDNza0VJR0FiR3o4cUFrek44NWJoK2swSlJRTDJ0?=
 =?utf-8?B?UXdMVnQrY3VtSDB0bUdDWGNjRG9FZUpPdWgzWXZ6VURuUDVnOWVjY2FONG1I?=
 =?utf-8?B?RUp6Mjd1T0Nock5PeUtPeDB2ZDVKak5mMDd6WWtxYkpRMktvdGRpb0JQMTZE?=
 =?utf-8?B?S2xRMmwxSWNrTlJrQXFGdFlDMi82TisyaWsxMi9iajNlTzFoVEtSS0xDclc0?=
 =?utf-8?B?MGNpV29hM2ZtU0VBemxEdFlqaTdUWnd1TXdCRGlwSmdtdFh2YUt6V1J0VEUv?=
 =?utf-8?B?S2YyaWdMbVorRGtqMnpvOVlqdUJpWEJETnJLeHRodU45VHpOa3N3N2QyWDRT?=
 =?utf-8?B?TlNsT2pkeHloRDFZTWxDN0NQRHhmWkwxZlVoOGxsSjdRb0o3UG5RRVlaZVI2?=
 =?utf-8?B?L2N4ZGF2OGZBLy9JZGtqTk0yZlVZL1hTdEtWdFJVS0gyNUt6NE83bW9WZlF0?=
 =?utf-8?B?Q1l5QlZTRFptcWlJWFpmSC9RUkFWYkl6RWU4a1UyNXN2WjRET0crdVhDV3Fm?=
 =?utf-8?B?cGQ3VEZpK3dwNU81V2gwSjJwWmppbGg0SW5PcFBUZVRTQkdOVUx6Ly9raTF6?=
 =?utf-8?B?b05pN29tNmhLeWg1Z1ovVFhmcmdZNldlMm9iR0NXMFBxcmZJa29HTHNDZUxD?=
 =?utf-8?B?TG1ybU5mQS9OdE1mUUczeWgyaHlycmFkb3pCL2dqME9aVGpJcDFRRlQ1OEhH?=
 =?utf-8?B?S1U5V2JHMUZSVnpjaEpKaFhJbThRTVVKTVNBc0FuUFRYTEt0Z1AzV2E2Q1VM?=
 =?utf-8?B?cXVJRGxzM2RhYUM4SG80MjlkM3VWOVJqaWQ0ODhCa3diOG9vVnFGTVhIbmVZ?=
 =?utf-8?B?Z1ZVRHVML1B3UmNMTHduVURCdytjTkgycXZ0TnQyMmVsWXFnQU90c3ljVzUr?=
 =?utf-8?B?ZnZER0NROEdxVkhuY3B5NE1SZ2JMOUUwWlJRNWl3a3RiSmRhRmhpdkVucEE0?=
 =?utf-8?B?UUdnVnB3VnN1Mm14UDVWdkF3V1M2UnJrUHk3RGJLK3NJVk81QmhjYUFhWUJ0?=
 =?utf-8?B?amF3MStmMlBiVktWZERVcSthY21ONDhQNUZaRUYyYnBoNHFWSnRHMnM0ajZi?=
 =?utf-8?B?eVg5VHRJL2tFck43MWphdzNiRFkzL2lxZWJlNGZwQnlVVDc4NUhsb2doMzZm?=
 =?utf-8?B?a29QUmYvSmk4bHRPeFRvRlJWMm55ZnhaS3hWdDVYaE5KYmNNZmMyVEIzczZG?=
 =?utf-8?B?N2xyR001WDUrREI2V3ZubWdQclVXbUttQy9Md09TK08zKzI1cVVCeGJTVmNk?=
 =?utf-8?B?ZzFDZ1RveVVUc1V1aWJjcFpETVNjRUlHZ29DV3ZOTGxJem5xWk96K3BhZkhD?=
 =?utf-8?B?dlV5QXVuNnh3WERnZGdLbjhXZi9oU3hsSjAxcXNLRHJxaFJJZU9neXc2Nnh5?=
 =?utf-8?B?M1FvRFJnVnJXbHp5T1JxcU5oVkhYUUgyNkp4em12K3B3b3o2c3hlTGF1QVNK?=
 =?utf-8?Q?XuNIvIyqM1F5WCE0o/tdA23Gw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc523cb2-96d0-4221-46ae-08dd47a4782b
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 18:23:07.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GR1lzFH+8b6LwlE0fOO94NwM80Hfu0oCH2klC5dQu+exzZEFhvt74ysOkLJHQ7AZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7565

Hi Reinette,

On 2/5/2025 5:57 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/22/25 12:20 PM, Babu Moger wrote:
>> In mbm_cntr_assign mode hardware counters are assigned/unassigned to an
>> MBM event of a monitor group. Hardware counters are assigned/unassigned
>> at monitoring domain level.
>>
>> Manage a monitoring domain's hardware counters using a per monitoring
>> domain array of struct mbm_cntr_cfg that is indexed by the hardware
>> counter	ID. A hardware counter's configuration contains the MBM event
> 
> Something strange in this changelog with a few random \t in the text.

Not sure how it got in there. I can only see with "set list" option.

I Will remove it.

> 
>> ID and points to the monitoring group that it is assigned to, with a
>> NULL pointer meaning that the hardware counter is available for assignment.
>>
>> There is no direct way to determine which hardware counters are	assigned
> 
> ... another \t above

Sure.
> 
>> to a particular monitoring group. Check every entry of every hardware
>> counter	configuration array in every monitoring domain to query which
> 
> ... one more \t above

Sure

> 
>> MBM events of a monitoring group is tracked by hardware. Such queries
>> are acceptable because of a very small number of assignable counters.
> 
> It is not obvious what "very small number" means. Is it possible to give
> a range to help reader understand the motivation?

How about?

MBM events of a monitoring group is tracked by hardware. Such queries
are acceptable because of a very small number of assignable counters(32 
to 64).

> 
>>
>> Suggested-by: Peter Newman <peternewman@google.com>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
>> ---
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c | 11 +++++++++++
>>   include/linux/resctrl.h                | 14 ++++++++++++++
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 18110a1afb6d..75a3b56996ca 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -4009,6 +4009,7 @@ static void __init rdtgroup_setup_default(void)
>>   
>>   static void domain_destroy_mon_state(struct rdt_mon_domain *d)
>>   {
>> +	kfree(d->cntr_cfg);
>>   	bitmap_free(d->rmid_busy_llc);
>>   	kfree(d->mbm_total);
>>   	kfree(d->mbm_local);
>> @@ -4082,6 +4083,16 @@ static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain
>>   			return -ENOMEM;
>>   		}
>>   	}
>> +	if (is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
>> +		tsize = sizeof(*d->cntr_cfg);
>> +		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
>> +		if (!d->cntr_cfg) {
>> +			bitmap_free(d->rmid_busy_llc);
>> +			kfree(d->mbm_total);
>> +			kfree(d->mbm_local);
>> +			return -ENOMEM;
>> +		}
>> +	}
>>   
>>   	return 0;
>>   }
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 511cfce8fc21..9a54e307d340 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -94,6 +94,18 @@ struct rdt_ctrl_domain {
>>   	u32				*mbps_val;
>>   };
>>   
>> +/**
>> + * struct mbm_cntr_cfg - assignable counter configuration
>> + * @evtid:		 MBM event to which the counter is assigned. Only valid
>> + *			 if @rdtgroup is not NULL.
>> + * @rdtgroup:		 resctrl group assigned to the counter. NULL if the
>> + *			 counter is free.
>> + */
>> +struct mbm_cntr_cfg {
>> +	enum resctrl_event_id	evtid;
>> +	struct rdtgroup		*rdtgrp;
>> +};
>> +
> 
> $ scripts/kernel-doc -v -none include/linux/resctrl.h
> ...
> include/linux/resctrl.h:107: warning: Function parameter or struct member 'rdtgrp' not described in 'mbm_cntr_cfg'
> include/linux/resctrl.h:107: warning: Excess struct member 'rdtgroup' description in 'mbm_cntr_cfg'


Yes. Will fix this.

> ...
> 
>>   /**
>>    * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor resource
>>    * @hdr:		common header for different domain types
>> @@ -105,6 +117,7 @@ struct rdt_ctrl_domain {
>>    * @cqm_limbo:		worker to periodically read CQM h/w counters
>>    * @mbm_work_cpu:	worker CPU for MBM h/w counters
>>    * @cqm_work_cpu:	worker CPU for CQM h/w counters
>> + * @cntr_cfg:		assignable counters configuration
>>    */
>>   struct rdt_mon_domain {
>>   	struct rdt_domain_hdr		hdr;
>> @@ -116,6 +129,7 @@ struct rdt_mon_domain {
>>   	struct delayed_work		cqm_limbo;
>>   	int				mbm_work_cpu;
>>   	int				cqm_work_cpu;
>> +	struct mbm_cntr_cfg		*cntr_cfg;
>>   };
>>   
>>   /**
> 
> Reinette
> 
> 

Thanks
Babu

