Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2052.outbound.protection.outlook.com [40.107.102.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0187B1DA5F;
	Thu, 29 May 2025 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748543137; cv=fail; b=QPN3QGQ7YqISQbR0cQ2yH9Cbeh4cypPcauHLIBYHEN5iUm9GwwNJI/1qBdvB+khn7IU12ZdJreod+Ur6nPz6E27KJl91oLjKN+NG6kLBrc9QAd3QdPLtY24F6AVfstxug46J1peS3q1JxknjdRK9rvkWUhLF4uXrwXcgaRQ0WII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748543137; c=relaxed/simple;
	bh=ANG2jXfM0Eoh6DjRCR4uo70rtJh/mtuWSsfL0bz2DdY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZvDnyUFDoIl5orij9Kq5SRTOj3F1xDo40k96oB5Rfg/slGlRMrPUtMeGUoALLvOBk0GeWGFKqpsg8gSHR1z74SKNKWZmN1fkcdrKDYzz6M+jR7hHINpU1MSeWc2FmF4rCmsuHGRrvOzqT8LxJKjgxVZY6ubFWME2cWG4wYiSbHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4wsJYy4C; arc=fail smtp.client-ip=40.107.102.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4wsJYy4C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAlIq68E3ng/y97/e5MvaFM+WGrJCKR4nsfVmT+8pVNvKezshxMElzWY/j/C16m5SmGaeq20W4aNsveM5zgU6tS9PKv8mIvHPK+Knj3M4d1F7XOYA2r5TSJEWdGOlEjIcOv7IvCAo9LuRjmGRGlDamLHkQnJr1pg5pR+RyuQ+G9djBJ60Wlg4Gp8ELAIZZpCuZwV3uKJD9KCFf6eJjthVDI/buVAWjvLIx9TSpN33ppidza/+61O+p9gKo7oafEqG7M0NeyIbZOG5liY6gyzHsbpGUl+5atfhEUagc8gj/ggtDkrnhqbbuhttVpjw/iXyl86HMQ7WJ3WRe/N7RRVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQ/hd7QXVJM0dPqq1wxwETwGgjLvv7/+3TCnQoFXDqA=;
 b=h3GdCx/mZ2B6fBl+jPJQkzyfCStcxdDQnGEPdTqECmbILAvAPrvW8p0Uxnq2uWFF0kfRFq4ceSskLgfRvneYfF0Gu6hpCBlyQCjQu5rNQnsdFOfYj7s49mToskAy2Ll6ntJgg9GkBHu6GaORCAFPbasQBZ+qyJVfZhEQ1sG/CkupAAzdylH5Pfx/mi3Hczka3x6HKF7x/j9UjmhU28m/i2tuA++25TCFNwbD8ByWum/qxVQjioPWdtYbw28LGrQdh3eq3qqTEHMgtZ/MBDMhsPukjUCfpHfBEfwi3JHxEuG6yQu7KnI5xj7mG8beDbJzEHn3R/LGWCUlVnRiZzdshw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQ/hd7QXVJM0dPqq1wxwETwGgjLvv7/+3TCnQoFXDqA=;
 b=4wsJYy4CETwAAPM3o7Xp+TYGyHAtDwddN+pO4D8m/UZJ5lmMtdXXczGL8n1RCvUdZktnhKtWs3NsDbq0bh3BStQPteP4acjJkut2VOuCW0OVdmAso2w85qa0a/rDaXC00tW4WkU7quKepVaNB3h+1zKJo7L6qRvX/7zAJQJOzUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DS2PR12MB9589.namprd12.prod.outlook.com (2603:10b6:8:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Thu, 29 May
 2025 18:25:32 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Thu, 29 May 2025
 18:25:31 +0000
Message-ID: <ba7f36c6-863b-4cd0-a3b8-3b6da273f9e3@amd.com>
Date: Thu, 29 May 2025 13:25:26 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 17/27] x86/resctrl: Add the support for reading ABMC
 counters
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
 x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, maciej.wieczor-retman@intel.com, eranian@google.com,
 Xiaojian.Du@amd.com, gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <af9e4c8e97f33299b49d1e3fb2025cc4f26f02f7.1747349530.git.babu.moger@amd.com>
 <00daaafe-3ead-497e-b441-ce1da8f4adc4@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <00daaafe-3ead-497e-b441-ce1da8f4adc4@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:5:335::16) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DS2PR12MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 20616b73-44cc-4860-5f75-08dd9ede31a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0ptT3JPKzNzVWZOZUk1U0VEOTc0RFpCVFpzTUdMMGpQVnc1Rm9YZWlaZGtQ?=
 =?utf-8?B?MmwvZENaWTNuL0hpY1MwdnNMZzl0U3dsaXBESXRVeEI3OHkwcXRybWpCdDNO?=
 =?utf-8?B?VDVua0JiZlJzd1A4ZGRLUlNSdkUzTmVuYUlvQm1UR3FTdGUzQmErRVl4YStJ?=
 =?utf-8?B?RVArcitlY3ZMTFVGK2Q0TUp1VW5PUjNHZW9XeWM0eDFZOUJCajlPUytEM2Nk?=
 =?utf-8?B?K0R5alkzaGxPSGt2NUw5TlViNktLYU9QcXRPQkpSTXlMclFqTFpOZzhQUTdV?=
 =?utf-8?B?TmF3SUdlL1M2bTBqR1c4K05kam54Nmt4UUdQcXQzZG9DOVpTOTF2Y2k5akta?=
 =?utf-8?B?NFNzcWEwd2JyYlFNb20rYW91ZnJnZnRCblMrVjdxNWU1UllnbWpVTVlTQ3Bp?=
 =?utf-8?B?Q29nK0llSHBQK1g3cXRUTEhxSWU0U2JSd0NWN0Q3OUNWM1FlY2xWMUJiVTVx?=
 =?utf-8?B?MnIxcnY0dnM4Sk1MTUtmbzhPTE9zRjQ1Z1FwWEpEOVlYOXRtTlhiTTFyb0l2?=
 =?utf-8?B?Zm5UTkthTmpHM21JbVlHd2FFZHgwYUV2cVc0UmpTbWRhNUdubVBzRjFkc2kx?=
 =?utf-8?B?cFdMWnk4QkQ4UUFmMXhibDkrMGt1b2w4ZytwbXoxOEJWNXhaME5LY2cvVllB?=
 =?utf-8?B?SUhvK0owY3pJZkNvRFZlRGNReWJQSDd3Q1hEdTltVEpKaFhXNEFXcDVCTC9a?=
 =?utf-8?B?UHZuRENHbVg0WlRkeExEU2crK0tzdExUK3lsdHp5djFmNW1mQlEzR2JZc0xz?=
 =?utf-8?B?dEorQVNpbGdkTG85RkV4a1F2WlRDQU9YOGp6Ty9ScFlmSXd4Y2xXV3hNdHdQ?=
 =?utf-8?B?TlJneVdPSnJPbVowQmVoUEUzQTBRQ01Sd3RZaUVaUUFmUHNHYUUxZU43TWk4?=
 =?utf-8?B?aDBiQm1BSytVVnZpZHIzV0pGS0M3ZmZjMDA1RjRacUR6ejNXQnNlY2FhL2Zu?=
 =?utf-8?B?R1JycVlab0NueHpTcXdNMUc4R0kxZnh1VU5PWk55MC81c2ZzK0NWb1RTVEps?=
 =?utf-8?B?dzljUG9GUUFaV1FaYVBWS2phRUtZeXlDMFI2Rkp6eCtyRS9lNFU0MHZNVEpq?=
 =?utf-8?B?L2EzaEtVRDNSb0FjbUFkVC96ZGRvdEp3UHhTNno3ejhPdnFodG9DV1UrZVBj?=
 =?utf-8?B?dXZoU0luR1Z3ZlFBTU1vK2xZNTZhWm95eWI4K3hMempLdXMvM0t3bVEzSGNj?=
 =?utf-8?B?QjY0Mng3RFJhK2p0aTdxdFRPME5nblFZZ25yWENKVHJXUFlFMWU4L1dSMncw?=
 =?utf-8?B?NjFGbVd2VXdSd1VhOVkyaW5vcGdJbTJUMzBEWEpuM2lOdWJQTTlYZGdRYThB?=
 =?utf-8?B?RzVKOExUQlFMQ2FyYWNDQUNuMmxROCsrZVRZYjdVU21KNHhmSm41SWxkODhr?=
 =?utf-8?B?M0MzUm5wejZZZlRqTzVvUXVkWEFFb3N0Zkt5czZNdERtNHZGTzRLZkVIRVNQ?=
 =?utf-8?B?bUVxbVJTTnQyYW5uaU51V3Fsam41OXNrSUhER2hVK3ZwVERYbXZYUE82S1pj?=
 =?utf-8?B?YUIrMUZGenlqNEZJRUZUdTUzUzNwd296OHZHSXQ3cS8vRWZrZy9FTzhjOFJB?=
 =?utf-8?B?REhBUWpvQXJFOWRZdW9PMnlRWlE3STBwYmZneTVGTCtYUXUrTWdIMDZHR2o1?=
 =?utf-8?B?bXB4QUhMcTJzSXZRODA5OVRYd2FJbTlCOVVWQzVZN3E0dnlTTllnN0pHYWRG?=
 =?utf-8?B?cVZIUjhDTkZiVkR5UitDczlzdzdiTy9wNzNDZUVnclRCUFE2WTNSZy9OWm9C?=
 =?utf-8?B?cXFhT0I2bTNueGZ4U1VFQk1zSmRKZENiME1WT3dVWXlxMVVlRk9Zc3pPQ2l3?=
 =?utf-8?B?S0xpOVZzRE9wclljbnVnaE1GZ2c5RjNXSWZ2citMdmsxdGhSbTJWL2tZayt1?=
 =?utf-8?B?Wlg2dkxhTyt5b0ZFaEQrOFZROUxreC84VWJ5ZXU2TzcwTW5JMGdLMU1pQkVR?=
 =?utf-8?Q?RK4A1xgmy0Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tjl6TWx4Sjd2MXdraEYxaVpCK1RDbHBzaG9scVFEYkIwc3A4ZXc0dkhpdkRn?=
 =?utf-8?B?SlBtVVd0ZVpNb21Lc3NrTUdiMmZidjcvSnNxUUZJSlgrQlhqLzdkSjRrYVd5?=
 =?utf-8?B?Y0RSTmpRemtiR3I0WDU4T29rSkJ1bkdRTkp4dXM2ZnIvUWFkTmxuVVkrcUgz?=
 =?utf-8?B?OTM4SEd1NU4rZHlYelk1YThTNFFtMmlodzhVYlFwQlRUbmlHRWpzc0VkeGh2?=
 =?utf-8?B?eUhFYmlKUlYwVk4vNDJhR0lNYlR5akZEZHl1ZzhLZTAySEVPN2xzQS9wbkR0?=
 =?utf-8?B?WWNxRjVXaWNYbXFxdmVZR3AwRnJWQmxnT0hhRkNrekxrYXVoYm5oQW02emtQ?=
 =?utf-8?B?OFVidThlVEFBVmVpanVESW5BdGdvMElnZFA2bmR5dTkyWG84SXpwandOa2hj?=
 =?utf-8?B?KzdST0h6akJwWmdsNnJuWDljbjF2NFVnWFlJUHRYbEI3TVU1M096Vmg4OGs4?=
 =?utf-8?B?dGNRTEZ2MnJOMlJFTjZGVlhLWWdCYzlESDlGKy9EaDZqUVJtd3ZzNDhMc25s?=
 =?utf-8?B?VG9RWW5nUXFsZ0JxcUlhbUg3T3BGUTQzcitKOCt5R1daV21sVjBXbVdjKzJ1?=
 =?utf-8?B?eUNGN0RrV0pPbEJ1TXZITnZKM1lnQWN2cVJyM29EK2MyRGpSZVVxNGlvOWZI?=
 =?utf-8?B?cGlWVExrTmdUT01FU2J0M0lBN2haLzZibTJ6c3JkeVZ5Z0hqZ0UwMllIcVUr?=
 =?utf-8?B?ZmgvdHluaUJWVHBINEorOEI5UHdxK1V0N25tbVYrWWt4TWE5c2kxVHZqOHg1?=
 =?utf-8?B?TUtiTStxVW1KaGpld3RuWGQvZUNSaEZzRk9iMDhJMzZXYzhSRUVENHd3R0tL?=
 =?utf-8?B?VXBLeGpwSHlNMVJvM3JOODZrN1c0VTZhWU5pNmdlM3FhWFlhak93S0dpazhF?=
 =?utf-8?B?YVhSeUcwR3AvN05XOXkzTE5BMWU3bDl2bjNSczFhM2tKbTBRTVhQZTdTWFUz?=
 =?utf-8?B?N2lNQ0pXd0Iza3JtSFVTaWlZdEZjVlk4RlltUnVyZmgzNnlqVjJBaExqSHpF?=
 =?utf-8?B?Wm1hWlFrZ1JCS3FuVy93WWhVTUFuODhXUW1INms3SEVKUlZQSTNGQUN0T1Zl?=
 =?utf-8?B?bjB1VGpiVi9QWFV2akFFYTBLVlNqNnpzL0hUM1ZnTkIzTGZyejBGUFVIL0ZG?=
 =?utf-8?B?ZUVycGFkazcxSjk1TEc1b3d0YkdLZGdSY3dUejRhWHY5QXBPV2F5SFNrQmZm?=
 =?utf-8?B?b1JVZ1cvaGNqSnVMZ0M4NGFlazN5UUM3SjZHMG1JQkdTdHd1WGkvYXBuMTZG?=
 =?utf-8?B?U3hrVGdVV05PM2p1YXgvbDBnUnNWR1FudzV0WlQwYkM0VWxWOWlybzBiOWpV?=
 =?utf-8?B?QnFGT1FyVTBURUp5SjZCa0h4b3U1QVlGaUhLRi9zblNzaU1MaHQwaVhzRUty?=
 =?utf-8?B?aXRuV1hULzFaNkRxSGxWSlRkTnFScmtrRGE1M0J3bGJna1FpVFBrTVJYTjJW?=
 =?utf-8?B?S2d6c2lGN1MrTEFGVmh4MjdCZFdldE5mcllHU2ZiWVZPb0oxS2tUSlljbkVI?=
 =?utf-8?B?d05xRFgyWEtuOEYxR3VKOG5IRmhkZXJabFhJTm1uS1lkaHZFbmtZaDVoMDFu?=
 =?utf-8?B?Y0FEcXJmWmNnZXNob3RuTkJuSFRuZktrcXY3Qi9JZk9UTkFXa3plMHpaZndG?=
 =?utf-8?B?OWs0clpBSVFqUHRDOFVHR3pzT0N2MDVaU2JibEt6aU1jaVZKWTNsQTZGclpD?=
 =?utf-8?B?bHFzY2lMb2Q4L1NoYkRzZVpYRXJjQ1F4cXRjWVMrenc0MU9iYVpDcW5uUjlC?=
 =?utf-8?B?YmE2alZ1amcyQ3l6NDVzUThFSHRXRkhwdVNqSTBUWGNEcGZWQXVRYWpGUDJJ?=
 =?utf-8?B?ZGthN3JFQTg1MEpSVW9CRjlGNG5uV0xCU1NpNmhCVzdCdWJXaExSSTRBYXJS?=
 =?utf-8?B?V1JwbEZIekt5bGRXelh4S043ZFJpUWlEZW5Ccmxua0dwN0pSSGY5S0NJc3VJ?=
 =?utf-8?B?TGxWa2xEY0UxNENlQkg3Y0RDYzBwUXVJUlE1Mmx4emVvNDAzdXFWNWFqZVpy?=
 =?utf-8?B?azRGaUxpcFhDTDZGdkRLdDQvRHh6aGJFcFFEOFp6MHJyNnAxYXBDclZXbXRr?=
 =?utf-8?B?MmVMR1RMSGQ3R0xGcWQ4MU9CRG45OW1UaFNkL0FDZ1lTazhmQ1BVSVVLWVp5?=
 =?utf-8?Q?hiSs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20616b73-44cc-4860-5f75-08dd9ede31a7
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 18:25:31.0750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COZFI2lyVAVNzm9o3Zc4TTQeWhiSyvSOUyDisqiy/QLSSSPMnVaPPqberIseZwi0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9589

Hi Reinette,

On 5/22/25 18:31, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:52 PM, Babu Moger wrote:
>> Software can read the assignable counters using the QM_EVTSEL and QM_CTR
>> register pair.
> 
> Please append with more context on how register pair is used to support the
> changes in this patch.

Sure.

> 
>>
>> QM_EVTSEL Register definition:
>> =======================================================
>> Bits	Mnemonic	Description
>> =======================================================
>> 63:44	--		Reserved
>> 43:32   RMID		Resource Monitoring Identifier
>> 31	ExtEvtID	Extended Event Identifier
>> 30:8	--		Reserved
>> 7:0	EvtID		Event Identifier
>> =======================================================
>>
>> The contents of a specific counter can be read by setting the following
>> fields in QM_EVTSEL.ExtendedEvtID = 1, QM_EVTSEL.EvtID = L3CacheABMC (=1)
>> and setting [RMID] to the desired counter ID. Reading QM_CTR will then
>> return the contents of the specified counter. The E bit will be set if the
>> counter configuration was invalid, or if an invalid counter ID was set
>> in the QM_EVTSEL[RMID] field.
> 
> Please rewrite above in imperative tone.

Sure.

> 
>>
>> Introduce __cntr_id_read_phys() to read the counter ID event data.
>>
>> Link: https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/40332.pdf
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v13: Split the patch into 2. First one to handle the passing of rdtgroup structure to few
>>      functions( __mon_event_count and mbm_update(). Second one to handle ABMC counter reading.
>>      Added new function __cntr_id_read_phys() to handle ABMC event reading.
>>      Updated kernel doc for resctrl_arch_reset_rmid() and resctrl_arch_rmid_read().
>>      Resolved conflicts caused by the recent FS/ARCH code restructure.
>>      The monitor.c file has now been split between the FS and ARCH directories.
>>
>> v12: New patch to support extended event mode when ABMC is enabled.
>> ---
>>  arch/x86/kernel/cpu/resctrl/internal.h |  6 +++
>>  arch/x86/kernel/cpu/resctrl/monitor.c  | 66 ++++++++++++++++++++++----
>>  fs/resctrl/monitor.c                   | 14 ++++--
>>  include/linux/resctrl.h                |  9 ++--
>>  4 files changed, 80 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index db6b0c28ee6b..3b0cdb5520c7 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -40,6 +40,12 @@ struct arch_mbm_state {
>>  /* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
>>  #define ABMC_ENABLE_BIT			0
>>  
>> +/*
>> + * ABMC Qos Event Identifiers.
> 
> QoS?

Sure.

> 
>> + */
>> +#define ABMC_EXTENDED_EVT_ID		BIT(31)
>> +#define ABMC_EVT_ID			1
> 
> Please use BIT(0) to be consistent.
> 
Sure.

>> +
>>  /**
>>   * struct rdt_hw_ctrl_domain - Arch private attributes of a set of CPUs that share
>>   *			       a resource for a control function
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index e31084f7babd..36a03dae6d8e 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -161,6 +161,41 @@ static int __rmid_read_phys(u32 prmid, enum resctrl_event_id eventid, u64 *val)
>>  	return 0;
>>  }
>>  
>> +static int __cntr_id_read_phys(u32 cntr_id, u64 *val)
>> +{
>> +	u64 msr_val;
>> +
>> +	/*
>> +	 * QM_EVTSEL Register definition:
>> +	 * =======================================================
>> +	 * Bits    Mnemonic        Description
>> +	 * =======================================================
>> +	 * 63:44   --              Reserved
>> +	 * 43:32   RMID            Resource Monitoring Identifier
>> +	 * 31      ExtEvtID        Extended Event Identifier
>> +	 * 30:8    --              Reserved
>> +	 * 7:0     EvtID           Event Identifier
>> +	 * =======================================================
>> +	 * The contents of a specific counter can be read by setting the
>> +	 * following fields in QM_EVTSEL.ExtendedEvtID(=1) and
>> +	 * QM_EVTSEL.EvtID = L3CacheABMC (=1) and setting [RMID] to the
>> +	 * desired counter ID. Reading QM_CTR will then return the
>> +	 * contents of the specified counter. The E bit will be set if the
>> +	 * counter configuration was invalid, or if an invalid counter ID
>> +	 * was set in the QM_EVTSEL[RMID] field.
>> +	 */
>> +	wrmsr(MSR_IA32_QM_EVTSEL, ABMC_EXTENDED_EVT_ID | ABMC_EVT_ID, cntr_id);
>> +	rdmsrl(MSR_IA32_QM_CTR, msr_val);
>> +
>> +	if (msr_val & RMID_VAL_ERROR)
>> +		return -EIO;
>> +	if (msr_val & RMID_VAL_UNAVAIL)
>> +		return -EINVAL;
>> +
>> +	*val = msr_val;
>> +	return 0;
>> +}
>> +
>>  static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_dom,
>>  						 u32 rmid,
>>  						 enum resctrl_event_id eventid)
>> @@ -180,7 +215,7 @@ static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_do
>>  }
>>  
>>  void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
>> -			     u32 unused, u32 rmid,
>> +			     u32 unused, u32 rmid, int cntr_id,
>>  			     enum resctrl_event_id eventid)
>>  {
>>  	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>> @@ -192,9 +227,16 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  	if (am) {
>>  		memset(am, 0, sizeof(*am));
>>  
>> -		prmid = logical_rmid_to_physical_rmid(cpu, rmid);
>> -		/* Record any initial, non-zero count value. */
>> -		__rmid_read_phys(prmid, eventid, &am->prev_msr);
>> +		if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
>> +		    resctrl_is_mbm_event(eventid)) {
>> +			if (cntr_id < 0)
> 
> This would be a bug, no? how about WARN_ON_ONCE()?

Yes. Will do that.

> 
>> +				return;
>> +			__cntr_id_read_phys(cntr_id, &am->prev_msr);
>> +		} else {
>> +			prmid = logical_rmid_to_physical_rmid(cpu, rmid);
>> +			/* Record any initial, non-zero count value. */
>> +			__rmid_read_phys(prmid, eventid, &am->prev_msr);
>> +		}
>>  	}
>>  }
>>  
>> @@ -224,8 +266,8 @@ static u64 mbm_overflow_count(u64 prev_msr, u64 cur_msr, unsigned int width)
>>  }
>>  
>>  int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
>> -			   u32 unused, u32 rmid, enum resctrl_event_id eventid,
>> -			   u64 *val, void *ignored)
>> +			   u32 unused, u32 rmid, int cntr_id,
>> +			   enum resctrl_event_id eventid, u64 *val, void *ignored)
>>  {
>>  	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>>  	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
>> @@ -237,8 +279,16 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  
>>  	resctrl_arch_rmid_read_context_check();
>>  
>> -	prmid = logical_rmid_to_physical_rmid(cpu, rmid);
>> -	ret = __rmid_read_phys(prmid, eventid, &msr_val);
>> +	if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
>> +	    resctrl_is_mbm_event(eventid)) {
>> +		if (cntr_id < 0)
> 
> WARN_ON_ONCE()?
> 

Yes.

>> +			return cntr_id;
>> +		ret = __cntr_id_read_phys(cntr_id, &msr_val);
>> +	} else {
>> +		prmid = logical_rmid_to_physical_rmid(cpu, rmid);
>> +		ret = __rmid_read_phys(prmid, eventid, &msr_val);
>> +	}
>> +
>>  	if (ret)
>>  		return ret;
>>  
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index a477be9cdb66..72f3dfb5b903 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -159,7 +159,11 @@ void __check_limbo(struct rdt_mon_domain *d, bool force_free)
>>  			break;
>>  
>>  		entry = __rmid_entry(idx);
>> -		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid,
>> +		/*
>> +		 * cntr_id is not relevant for QOS_L3_OCCUP_EVENT_ID.
>> +		 * Pass dummy value -1.
>> +		 */
>> +		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid, -1,
>>  					   QOS_L3_OCCUP_EVENT_ID, &val,
>>  					   arch_mon_ctx)) {
>>  			rmid_dirty = true;
>> @@ -359,6 +363,7 @@ static struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
>>  
>>  static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>>  {
>> +	int cntr_id = mbm_cntr_get(rr->r, rr->d, rdtgrp, rr->evtid);
> 
> So mbm_cntr_get() is called on *all* events (even non MBM) whether assignable counters
> are supported or not. I assume it relies on num_mbm_cntrs to be zero on non-ABMC systems
> but I think this needs to be explicit that mbm_cntr_get() returns -ENOENT in these cases.
> Any developer attempting to modify mbm_cntr_get() needs to be aware of this usage.
> 

Yes. Good point.

> This is quite subtle that resctrl_arch_reset_rmid() and resctrl_arch_rmid_read()
> can be called with a negative counter ID. To help with code health this needs to
> be highlighted (more later). 

Sure.

> 
>>  	int cpu = smp_processor_id();
>>  	u32 closid = rdtgrp->closid;
>>  	u32 rmid = rdtgrp->mon.rmid;
>> @@ -368,7 +373,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>>  	u64 tval = 0;
>>  
>>  	if (rr->first) {
>> -		resctrl_arch_reset_rmid(rr->r, rr->d, closid, rmid, rr->evtid);
>> +		resctrl_arch_reset_rmid(rr->r, rr->d, closid, rmid, cntr_id, rr->evtid);
>>  		m = get_mbm_state(rr->d, closid, rmid, rr->evtid);
>>  		if (m)
>>  			memset(m, 0, sizeof(struct mbm_state));
>> @@ -379,7 +384,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>>  		/* Reading a single domain, must be on a CPU in that domain. */
>>  		if (!cpumask_test_cpu(cpu, &rr->d->hdr.cpu_mask))
>>  			return -EINVAL;
>> -		rr->err = resctrl_arch_rmid_read(rr->r, rr->d, closid, rmid,
>> +		rr->err = resctrl_arch_rmid_read(rr->r, rr->d, closid, rmid, cntr_id,
>>  						 rr->evtid, &tval, rr->arch_mon_ctx);
>>  		if (rr->err)
>>  			return rr->err;
>> @@ -404,7 +409,8 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>>  	list_for_each_entry(d, &rr->r->mon_domains, hdr.list) {
>>  		if (d->ci->id != rr->ci->id)
>>  			continue;
>> -		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid,
>> +		cntr_id = mbm_cntr_get(rr->r, d, rdtgrp, rr->evtid);
>> +		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid, cntr_id,
>>  					     rr->evtid, &tval, rr->arch_mon_ctx);
>>  		if (!err) {
>>  			rr->val += tval;
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index f78b6064230c..cd24d1577e0a 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -473,6 +473,7 @@ void resctrl_offline_cpu(unsigned int cpu);
>>   *			counter may match traffic of both @closid and @rmid, or @rmid
>>   *			only.
>>   * @rmid:		rmid of the counter to read.
>> + * @cntr_id:		cntr_id to read MBM events with mbm_cntr_assign mode.
> 
> "Counter ID used to read MBM events in mbm_cntr_evt_assign mode. Only valid when
>  mbm_cntr_evt_assign mode is enabled and @eventid is an MBM event. Can be negative
>  when invalid." (Please feel free to improve)

Looks good.

> 
>>   * @eventid:		eventid to read, e.g. L3 occupancy.
>>   * @val:		result of the counter read in bytes.
>>   * @arch_mon_ctx:	An architecture specific value from
>> @@ -490,8 +491,9 @@ void resctrl_offline_cpu(unsigned int cpu);
>>   * 0 on success, or -EIO, -EINVAL etc on error.
>>   */
>>  int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
>> -			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
>> -			   u64 *val, void *arch_mon_ctx);
>> +			   u32 closid, u32 rmid, int cntr_id,
>> +			   enum resctrl_event_id eventid, u64 *val,
>> +			   void *arch_mon_ctx);
>>  
>>  /**
>>   * resctrl_arch_rmid_read_context_check()  - warn about invalid contexts
>> @@ -532,12 +534,13 @@ struct rdt_domain_hdr *resctrl_find_domain(struct list_head *h, int id,
>>   * @closid:	closid that matches the rmid. Depending on the architecture, the
>>   *		counter may match traffic of both @closid and @rmid, or @rmid only.
>>   * @rmid:	The rmid whose counter values should be reset.
>> + * @cntr_id:	The cntr_id to read MBM events with mbm_cntr_assign mode.
> 
> Same as above.
> 

Sure.

>>   * @eventid:	The eventid whose counter values should be reset.
>>   *
>>   * This can be called from any CPU.
>>   */
>>  void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
>> -			     u32 closid, u32 rmid,
>> +			     u32 closid, u32 rmid, int cntr_id,
>>  			     enum resctrl_event_id eventid);
>>  
>>  /**
> 
> Reinette
> 

-- 
Thanks
Babu Moger
