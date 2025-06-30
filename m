Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD3621ABA8;
	Mon, 30 Jun 2025 22:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751323909; cv=fail; b=a7Ya1HBcg316wDveq//0Z3iMyPQX0rUfeb9vgKR/ZrVsUPh0o53qifxJ4VCmBuZ8gK6XcGgeG3wvR88xKJfKlkhvbaQapbqIjPTLlIpBqMyGk4Mc3FtAeQpivFxJuzc6yLnydv48ON27UUAHC7tZs8S1FjgdKEH7VicYgM9x4/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751323909; c=relaxed/simple;
	bh=6HIim5FDYPZ6xCmq1LVO10hddz/RUWh8uF0xW8RMCGQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KgH9ATOZ1t0JKTcOKGFZGEb6gGVUrj/V5Co92vGQc+D7D/rvIuWDP87AzZYJ8Sgu/WYPdv7t1suHJ5GSVNvhXd9Oq5TvOZPXZig6TD4UGpF3B1+XGsfs8dVjvzuFS3Ehbd2Vd/zgZQ6rYgE7gcNxMfBWvqkz2xkyBman1bMncLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fOZHf0I8; arc=fail smtp.client-ip=40.107.223.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fOZHf0I8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8xa8R446z2wbzD4N9tXtlUQzBTD6uqbf7ShjyMmk+n9mqD71kB8MIAB8/g9ePH7jepwmOxTbsU1p67h3KB9lIzMvVsRTx+qqPKPmZIUZrIjFKaVT83ishKNCPF0BwSul1z3jt0/URh3QBQ1PCNhvu6Oh9TaXWeeUA/+8XrQujI5hBDL779nmDjUiUGK0rSEuMgM4kwOoY4YDUnxktCAqW+5jvF/jdfa/JazdqsuO27At7GzcD8B/xBoc7kRGmr8HEnvYbavVaXpGFkWkcmLkc3fXMxa+DiVMfkoy8QJncIIhnxAm1h87132/CmOo3nTDKWXn5LHs3MC6RcF0Cb6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tt7omnp47RTeJTUiORIQLRttYbSZh/4FvnMZ6HOFXB8=;
 b=mDikwJhFUitvN6aA9/96jHAUqp8FwUikSXCRMDKUlr+UeFD40NqOGRugdHiJkn+6v4y0hy1MH6KHV9ISiAoLGdiz0VaXOKHDiulhWfmcpeXIML6fGjwWN114St7aLYyiWZLfANveTTIAbWF/ZqTOjYabqE68B6w9jgKosdSqLTT8DebzX2w7C3dZNP95SW7BYYcL7HwYhy/ncxk03w+adIPKRCYjx6SPInrFMwEijeHQQl4bKPF378NZ2bijl07CqJjH1OWA2rbmDJCkAs1vyLHHO6sKao0AqfAFEBMLXNg2MC/VNcIAn3YMqsc0+hLPcN8suHugO0YjwCmH4TtyEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tt7omnp47RTeJTUiORIQLRttYbSZh/4FvnMZ6HOFXB8=;
 b=fOZHf0I89QqEbRFQsoYIldPiyndDtmaGI3jYa+cWY6/9zYsbmnwi4O3M8YXgX2Zmj1ynbnu1H5CW7ylQLYltOZ1zJiplFk9NdR6ElD3nbs8Vn3HB4Qyd7aIII1uTRM2qJ7WTm/e5AL/e8y0jrXn7QqhIoBsbBe2fu7IKXGQXSd4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN2PR12MB4173.namprd12.prod.outlook.com (2603:10b6:208:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Mon, 30 Jun
 2025 22:51:45 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 22:51:45 +0000
Message-ID: <b9a59b70-2769-491d-a988-f4d3623c5653@amd.com>
Date: Mon, 30 Jun 2025 17:51:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 23/32] fs/resctrl: Add definitions for MBM event
 configuration
To: Reinette Chatre <reinette.chatre@intel.com>, babu.moger@amd.com,
 corbet@lwn.net, tony.luck@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
 perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, gautham.shenoy@amd.com, xin@zytor.com,
 chang.seok.bae@intel.com, fenghuay@nvidia.com, peternewman@google.com,
 maciej.wieczor-retman@intel.com, eranian@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749848714.git.babu.moger@amd.com>
 <dbd02fa64c22ec933ba27e69ded8288d4d4ae9a1.1749848715.git.babu.moger@amd.com>
 <fd9c7ca0-1d16-49b8-b3f7-4f37cbd9060a@intel.com>
 <1ecc2e54-f62a-4937-be9d-5a275dae0634@amd.com>
 <689867b7-f3cc-4389-898c-53c4dc321447@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <689867b7-f3cc-4389-898c-53c4dc321447@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0114.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::21) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN2PR12MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: ed796e85-c34e-47d9-ded6-08ddb828b019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDBTaGhuWkpmRTF5WkZ1RzVTL1BaZ1lIZEtaMnF1enhqVXB1U3JmaHl0QnA5?=
 =?utf-8?B?QnVPNWtlNGpQdTRUVC9HTGNnTkN4TEVxWDkvRXovNlg1MkttM29lMDRQSHRS?=
 =?utf-8?B?Z3dYUTRzaTM5dW9NQy8zWWtsZ2x3T1AzQnI5anE4aDZsY2RPR0R3QlBUVE5l?=
 =?utf-8?B?WWFwMVFBaWZnK3B5VGI3alFtaEZScXpCQVhFTE5ndWlnNlNzUGduVmFOb1RL?=
 =?utf-8?B?ZkQ2UFl0cTZBT3ZBTTUveUNILytWVEJlRFRZVWl5M055alY0TnJQbkJCc2Z0?=
 =?utf-8?B?SXRKei80UnJCWWg2aXFZaWExZk0wRUQrcEpFeFBERXkyVHN0UTAyd2Y2Njdw?=
 =?utf-8?B?NXBQazhld3RzQlJBNm1jK1B1SkpSZlUyc2pXMHNhbjA4czZnanFRMHovTThJ?=
 =?utf-8?B?OTdBTUtUcE13b01TNm5mNWQ5VHh2SXhBT2FLRnZmZ3JtY2dsY3Uvc1pLY3BD?=
 =?utf-8?B?emVzMmxIRXppNXRNVTNsK3JjcktYMW1qWWFPMTVjY1kvWW9ETHBVZUhOaVds?=
 =?utf-8?B?OUwyUitmNzYrdzE3L1hmODBsQTQ2a3dFQVdKNWVGelpMS1hHcmx6QWVkMytO?=
 =?utf-8?B?WUREUjQvbVBYYUhrQWJYM2QrSW10UnVrMklpMDY4MnlRUVFnT1p1R3l3bFgx?=
 =?utf-8?B?aFI5RWNYMEdiQW8zY050VllvWXRyU1lENGV3TEhvOFpRc0Q5S2xEUjdxTUxp?=
 =?utf-8?B?TkhYOFNkMUdJUFF5SVZhM0FnTW1ObkZzVm5WNkNmWnhFcGRlZW12aDNPVi8r?=
 =?utf-8?B?dm1pbFlZRitNd0tGeGlWMU5CWWlhbmZGMmJVMUlVL2w0cUZUVlJxbXJNRzB0?=
 =?utf-8?B?L2pNdkRtWnJTYnQ0Z2Q0REd3VTQ5dTExZzVlRjRGSkIrbWF4R0I0a3lWRzVv?=
 =?utf-8?B?Qm5NTmFmK3RhVHQ5YlRQN0d2YWw4L2hpdzNWNnJ6SmRoZkRmNTVnbXZOb0lP?=
 =?utf-8?B?SkZuRE1YNUZMVjBxUVN4WTFyTGM4cUNOMjBISUlGS3FRQk1Mcm9ZVUdWcnh6?=
 =?utf-8?B?OXJnU0FFeFdKYmVBR0wyR0Z4Yk15azY0dTZORkk5ZWxZQXpLQ2l0bkp1ZU9C?=
 =?utf-8?B?S1dNVzRRbzBFL3NOK2thcDdsN1UxVWQzT3BIMEpFQTNJWE5CbVVCUEJaY3pv?=
 =?utf-8?B?djhPb004c09QdXMwblM1Wk9tZzR5UWVrNGo0YXptSC9KT1RTdFdXNmtoSFNL?=
 =?utf-8?B?MjhUUnNIZkdMQWc4SGRWRjZseC9DL2owaUZMd2V3Z1dkVEV6NzZBd1l0cG5Y?=
 =?utf-8?B?WjVKVzBRcitYcFRBdWlXNUpvcFJFa0VXcFBwbWdZVHRJb01vQlRCYjVkTWI0?=
 =?utf-8?B?bG5kR3hCUDY1bmE5eXluZzBEb2w3azVDeEYxZFcyNWJZUWs1NnMvTDlablIv?=
 =?utf-8?B?WWxLTUYvVTYyVFN6YXZ4eHVEYkxsVktPNUpQZHJYV1FFZEpTOEg2dDlYQkpo?=
 =?utf-8?B?dlpyNHVueG9RcW14bDdWLzhKY1VJTHQwNGlkK1FuRDBsWmpjMnl1bDd5MU9V?=
 =?utf-8?B?VnU1N0JmRzBnQzRvSmNjYU5PdkYzN2NoYjI4UTlLMzZid3hoZ2lpT0szclY0?=
 =?utf-8?B?QXFJbXJkQlp3TUduTDNKR1BlUDd2aDBRYitrV0NvdUs0NVBQRjNDa2Q4QjNO?=
 =?utf-8?B?TW1JcW80d3Z0WkF0Wld3ZGVBNC90UWRha2ZiWi9ZbGRnLzErTDJRUS9EVnpZ?=
 =?utf-8?B?SU1OdStwTDZDaHBIVlZJSmNFS2JqanFyUU43MHNoL3RjTDhScHFHK1dacXBD?=
 =?utf-8?B?cnE5aGJQS1YyYVBMb1ppUkIxTXdvR1B1NVk1NWVBeWZCOHNRYTB5UEF3bkJy?=
 =?utf-8?B?RlBqTWpUY2h2WEUxNk9HaTdGajhGS1I2dHl6Zm1pR0xQeHZySXg1dC9VZjNi?=
 =?utf-8?B?YWpPMDR6WUJKQW54cFRoODNlNlk3YXJ3dnpTbG9yaXlPVjQyYmYrYlM3b204?=
 =?utf-8?B?Z3RCaHdtYTRkWmp4Y01vODFQc2c0d3dKZFBLNjhLK3l2emlRZ3lFVkZLYjhS?=
 =?utf-8?B?WWk3NEQ1S2ZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDNsa3RiVW5TM09CNjIyVVVjcU9lZVF6QThacVJYTE5zb0xwdmNDSlIyTmdI?=
 =?utf-8?B?a0F4Um51WHFDWUNkRHVLek9KWXVRbUkydkNPZjJRZEZlaW9GeThLRVR6d0Zk?=
 =?utf-8?B?YlRXRmF5TGNJeko4eHd4Y3BRS1NSUTRIMkxoODdrdnQzaGt6NkhHZzFTOEVI?=
 =?utf-8?B?WVM5bUI1UzBNYjlsTkVqUFMxTkJYdVFqbzhKMzVuVUZ5eFN5MnZLOG5UcGtB?=
 =?utf-8?B?Q1YyU3g0bFN0RkNnc2lQNzlMQXhaMnBVSHFaRk1xWXd5ZGttVlpHOUpCd0p6?=
 =?utf-8?B?MFBtTWdiTE4yQ0hLQkYybUVwQ1hVRjk2SmE2TFU2QURvU3dFNkRrR0xYRGdv?=
 =?utf-8?B?VjBCMisvdWtQU2FKY0V4ck5FMjhKdlVFRjNsQ2hsVmZCT3Y3S3IxTHBkNnYw?=
 =?utf-8?B?TzN4VUxZUXZhY0J6c1NJV2FvM29pR09jMFdYV3Awa0cwRWFjMlVaVnhRZnBU?=
 =?utf-8?B?dmJCSzVyU1ZHUml5YXFVQmllYTVJb2FGc21KemR2V0RFbzVGRTM4YWVwYzl1?=
 =?utf-8?B?cHAwaWNrZ053VklRUEliSFBmbThmR1JFZDZCSC92eThDRHZCNzFxaU0wc0JD?=
 =?utf-8?B?UVJsMWdoelZFek5Ub0pWaTJzRlJnNExNWEFzMDk5T2VuZzYzN1BLY3ZVNFMz?=
 =?utf-8?B?Y0pZQ3ErODBHVlp4YnZJK25EN2V5VGtMQTU0SGJYWFgvNzh4SWVvaWpySTY5?=
 =?utf-8?B?ZTdmbHUyd0hET1NuYlZKMVBERTFhTnFKWUR2Z0cxRFZCSzQ2dkJEcFNjbWNN?=
 =?utf-8?B?eU9LQWc5bEdHSUJneVBlNjRSR1NXMkFPTmd3Z2cwUHUrakx3dDNEM084K3Y0?=
 =?utf-8?B?QkVWRDhWc1ZFdGpYV2krZHZlMlVSam00UGhKcmluNElsZDMrUHY3eE0zcUtq?=
 =?utf-8?B?WDdGVHRpM0NpK0Zaam9sMDJKNWd1bDlIemxkRmE2ZzZacFpzRzBKTm1mVmd4?=
 =?utf-8?B?dHMwY0RjeHI1VDZVbXhRSXFSZFZ6UU5henB1VXJKYUJrdDhva3ppOWRtb2Nu?=
 =?utf-8?B?K25jbHkvQnJPbmRKbFZOZWNvcTF5QnVJY0o2Uk4zWUN0RzEwR05rSXNIVHow?=
 =?utf-8?B?RTJ1ZXNuaVhLZ2xOVVFLL010d0dSZG9nWDk0ajJxOEVQRWk3Y3MwZng3WitU?=
 =?utf-8?B?cjBUNWs1MlhMVzVIR1Zia0dPejNyWGtzYVZsckw5d1lZMnZFbk9La1Yxdm9k?=
 =?utf-8?B?RFptanBiQ2NTRVlMLzVHSmZOTFB0N0ZEa3FUZGp4aGhaUytKSXVock9hR0JL?=
 =?utf-8?B?QXIxQVV3TzVIOWhkRnlTMlBrVEFFN1dOWmJLb0FsR1BhdUlNTzF5VzV5dTBk?=
 =?utf-8?B?VHNXMUdHMXZPVlc4ZU5rMXAwa3lsY0dZTEVFWmF5WDRQWmZQZ0dUcXUrUnRm?=
 =?utf-8?B?UjNvYzQwbEhwVTJoK3Z1bGxGSWhobWF5TUZQNXZDK0E2cGxoSnB5aWVoVlJL?=
 =?utf-8?B?UXcvd1lqWGs1Ry9iNXkwTTVyQ2lGaGRpTGFTTEFyNVVublpad05OV0VjNWpz?=
 =?utf-8?B?YjNYbURta05oWVorRGhEd0FHVjMrNVNSOFRGRW1qNTlRNFhrU1dGZ2pDSUJQ?=
 =?utf-8?B?VnAvUHUrYjdsRCtpb1psczlkb3VVMlZGUno0ek9idWZFQnlKc1ZqTjJHaGw3?=
 =?utf-8?B?RzJDS1g3QjhHdlhUYkk5dDBSLzNGWTJJNm96OEdCSmdoM0pRRy90Q2c1OUQy?=
 =?utf-8?B?QmhWTWc0ZmZSdzRCV1hEeGdkbGJ2L0F4MHpyNEhLTzdIR1ZaTnMwUUtVS0VN?=
 =?utf-8?B?bUt5cUxQZ3RPNUZMaFlnRXQ2K2hxQnVLY0kxQ1Y3RHdMOVFYbTU5VjNDb2F3?=
 =?utf-8?B?aVpmZ0l6VkdnSkl0UVA4K3Q3bGZURjNibEtTQWU3bHk5OFFGLzVoR2ptS21q?=
 =?utf-8?B?eDM1WEdFKzQ2eTArN3VYOWljRlJwSEEzVlE0cVhHbmNlNU1Fbkl1cWZ4MUxx?=
 =?utf-8?B?V2FDK2lzU1dWTlNud2daV0JIUHJoOWtibHZOYjFWclVYbW9FYVIxWmphT01T?=
 =?utf-8?B?bjJXQmZweGtLbXFDbU50Y01hNDQ2dGIzT1IrMFlkbGZiYVdFc01YQ2pXZjlT?=
 =?utf-8?B?dHRjN1NCdXFwN3MxeGduUUtmTms1VGE1NEJlYWlxZVNlWFV5a1NPVjdpN3Yz?=
 =?utf-8?Q?GQec=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed796e85-c34e-47d9-ded6-08ddb828b019
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 22:51:45.1637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVvKmiJ23pn/f9iAO3sa9in0GvusF7ZKzn/fqGuCXti1oE0NDn578r0QmAkJqvIp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173

hi Reinette,

On 6/30/2025 4:58 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/30/25 10:20 AM, Moger, Babu wrote:
>> On 6/24/25 23:32, Reinette Chatre wrote:
>>> On 6/13/25 2:05 PM, Babu Moger wrote:
>>
>> Changed the whole changelog.
>>
>> fs/resctrl: Add definitions for MBM event configuration
>>
>> The "mbm_event" counter assignment mode allows the user to assign a
>> hardware counter to an RMID, event pair and monitor the bandwidth as long
>> as it is assigned. The user can specify a particular type of memory
>> transaction for the counter to track.
> 
> Since an event can be configured with multiple memory transactions I think the
> last sentence can be something like:
> 	The user can specify the memory transaction(s) for the counter to
> 	track.

Sure. Thanks
Babu
