Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2075.outbound.protection.outlook.com [40.107.96.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBC41C860C;
	Thu, 29 May 2025 16:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748535969; cv=fail; b=BA3dm0w50AO4fCwHZvBUANGpQ8vdzXLHkVteyyOLrTCbdAb/BiivG1wwI49+k1vXxX0Vl3SIX0lx+1R8ApKTA1XuBu9WXrlN1Fi4FQLQxCjPgM0vNndZsCMN0uyMAzdG0VOUyhJBXqsSESGLkfxuC/hIP5gQjgIFkpXWQwtw5oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748535969; c=relaxed/simple;
	bh=m8+QgQOghNaZpZdq2ils2aZbzHIueyu+/2yOWeIXXvU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ihOjPov9/+chrofC0Z43Acajekw4iLgQAFXJj8/17sGmXL8DdUbkhIJQ0AkuDH5JZYp1gZtT225k5rTHqUV2MkvtUdUThB4lC7T6suXKoeg7JQhst/Jn7TNna8SIO+79JhU1zbqSl1yNsquv9xj+ivxH88QkuRjFMJMQkCLpa1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BFtuEMkl; arc=fail smtp.client-ip=40.107.96.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BFtuEMkl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVflu7y5H9VM1fokAx8KTEzZSNBigzMTOVbofW+P2wLQBrEtt/xbquutZ+pr5DUj8hbJ8B6iihp+pAa9icTGyM42yjKZsvAVsrvc/1pxG3Sw43kOb6G9aNohPx8TVwdc+4WWd1LL+vDiX8+rbOBi3kwYkVNqyoQ08OpEqMF9rj3RcXB7DGpZ1OCgOHNKvC6yK2VNST6Q+Rzqd5nQ751qq8vQfeOGrv3YWjEKi0xZF7wNmzqJ+8J6VoLMV/cHgTQtxkcEBnH/w0djrL4gZYdqsZfUuXnd4Ud5FpDWMCNjSNbSUZ1tzKqD+bwMi7xTDLvMRiYSxdW1IbNMsHQ2NUTGSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wc0vZ7vqpmNcOPyfwroMtpQnXMLXAAPOKohYYwLj7qY=;
 b=O1qJ0QMNSNAw93W6s7HOB4aKAsAkrQ6iG48AQdPoGOkQ5gtOfSiAVfJSW+sLoETfEmlfrK249g27NkehuHP8A3lm+yMeAXIKi6SUck96klNzM+9safD3QtdlTBoJHZ6OYtpaLtJ2QDKlscY5iejvxi+VmbRAEaokklyoG+QHa8TkH2Eg3bbGFU9IXkzp/iphlA99uHuM4ofIDNpKqf8wDrZPx2fiHFRvCd+Bjj/VDjK1FMOj9C+WldEBwlqXlyKJXL9OdHuN+oE6cZlEgkdSNh2aCt9T5aB4K0/uAKcewroDMJ3L+5YNK4i2ARf0mb49jRmr7nNK4KpzcQlkuar2nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wc0vZ7vqpmNcOPyfwroMtpQnXMLXAAPOKohYYwLj7qY=;
 b=BFtuEMkljU63H9fJeX/AnVenpg5iEnOtoy1CxrEnJcEGcKVfQMNJlcoVr7783W9YUmNC48nEmOALtIThgJFN5iYWMiIIdcKx+q4d3emwrIBhUVDPZL8NsFLbk23N/7mpDo/79G3mYZIc+BA5/rZ6T38dP/O9gQ2SJKIE+cB9tgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BL1PR12MB5827.namprd12.prod.outlook.com (2603:10b6:208:396::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Thu, 29 May
 2025 16:26:01 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Thu, 29 May 2025
 16:26:01 +0000
Message-ID: <dc2ac138-10fc-4e0f-bb50-1f9d5df82918@amd.com>
Date: Thu, 29 May 2025 11:25:56 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 14/27] x86/resctrl: Add the functionality to unassign
 MBM events
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
 <1ba0091cad7d1e5ab32136d4742580294a2ce5e3.1747349530.git.babu.moger@amd.com>
 <d54c8b00-c30d-4c01-b748-34c1d87743d4@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <d54c8b00-c30d-4c01-b748-34c1d87743d4@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0043.namprd11.prod.outlook.com
 (2603:10b6:806:d0::18) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BL1PR12MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: 560a2916-3391-4ee8-1f1b-08dd9ecd8010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUtWL1R0U0E0NFdUUEFkdVdhQTV1TjhpUkNMWUlHRlg1UnNLR25NVk1WbVRh?=
 =?utf-8?B?RURMbUZjZ2psbVNXY3gvUE1wYUlBejZMb0N5ZWlsVXl2Zy9MRWFpc1AycE05?=
 =?utf-8?B?NFo0WlRoMHhFV2kwNG51cXZpTE0vVXJpN2paRWVYbVZBYkh4NU9ZZ1RSU3Q2?=
 =?utf-8?B?S0lycWcwQ1hUMGZtMTJpYVdKOWwwNEoyWXJzZVlDaldzbU1QbkY3RlUyOFRa?=
 =?utf-8?B?b3I2U0ZwQndJcVE4WE9hSzMxUWxhWndjcGRNQnl3V1liS1FvcWM0TFk3Qy9T?=
 =?utf-8?B?djhqV2NoRkxMSzFxeEMxeUNqZHE1Mm85cGgrZUVzN29aTzN2ZUVRK2Q1Unp0?=
 =?utf-8?B?cWpRT1liZW5xRmFwNGsvUkZPMmxjQnJwZENvM3RvTzgrcGdWRWlvWGhiSEoy?=
 =?utf-8?B?REgycGpkSGRLUEpKV3RZVlhTNWNMUDJZSkY2TkY0WU1GdG1TYnJ1dXV2UWtv?=
 =?utf-8?B?Z2pmSU11L3RNbHpvTVpkTkc3MWZ5ekg1YXRNdytpbW1aWDFvUDJZTW1HcWd1?=
 =?utf-8?B?bk0yaE55RWVjQjRhcFozd1R0cHFhdS9MZEtlOUdxbzkyWGVWQVBuZ0ZPbUJa?=
 =?utf-8?B?dG1iclJ6NkV2VDZWM1AvaWRjcU9FdzRmTkF1cVFVMDhsTVE2aWpCMGUxVnp4?=
 =?utf-8?B?aGMrS2JDOEpka09XL0VEOFcxRGp3U1JMbDhYUVNkNzM2M0lmZFFBOW1walQw?=
 =?utf-8?B?RlY3c20vTmFiQy93QVFUNDFncVVIdDdjdjYzNjZDckZaZ1krdXpzTXhtNUpj?=
 =?utf-8?B?ZGw5dlRwLzdsSkgxNmlwaTZoN2xJQWFuVlVaL3UzWGN0eG5aaHJuOU5hNEtv?=
 =?utf-8?B?U3FaRnlBLy80V2dLRzI3NGYrOVJTR0JiUWlIeHJ6eERCWmJic0ZPMlZTOFBq?=
 =?utf-8?B?aGdBNTI0MnFuWk8rdVkvUGh5Q1BCYVZQc01LeE5kcDJURmNqdTZ4dUtVREpk?=
 =?utf-8?B?anFRYTZYMEpZSG1xWkJ4aHVwN3BxS2hqQVlGdkFibFEvTktLVGFxcVZqUGZ0?=
 =?utf-8?B?TTQwaHVlVTAyQWZva0NwektMOXdUcW9QS01BT3ZPbmNNSmhRbFpwS25yYjM1?=
 =?utf-8?B?YW5mN1BPb1REN2tVQkdZY1p2TFk1ZlAwQnhadDRXbHdEd1YyUjJTOGp5eElz?=
 =?utf-8?B?Q0VIT2RZWWdSWU96bEdYTjdncERTM3luNGNHd3pYVkxYUnVwMWwwZzJURjZQ?=
 =?utf-8?B?STJSaFVhSUc0WWxLSlVOSTJVdWRJcVhoSWFONW1CVUJMMTdKbVJYdTVCaTcv?=
 =?utf-8?B?OVZUSEw3WkdEZ0d1ZnF1QUlaenhFa0l5R0U1Tk9Qb0dBMHdQc2lucmd5c0ZE?=
 =?utf-8?B?WlFZdDB6enFmMTAzUTRBV2RPeFErWDA1SUJNV1pJWEcvbktnQ3ZpS1JBcXBF?=
 =?utf-8?B?eUdjQmIzaU1WalpnakIyTWdRRHhDMW5icXhtMTNldXo4VVpiTG0vTlV0TFNF?=
 =?utf-8?B?ZWp4aHBXWmErbmNpSzlZNDRGM2oyVUJLV3RMR3F3K1owMk5zMndmMzdkMEha?=
 =?utf-8?B?b05STSt0VnBQZzlPMnFWRldrT1Y3SXBkcEZWMmJ2VVozZkszZDRwRTZOTUxM?=
 =?utf-8?B?Z3hTYnB3ekVGekVvb1pxVU0rZEsvL1VYWHIwakdGSXE5NWFTMnZ1YW1rVVdz?=
 =?utf-8?B?d1pyZXVHL1Q5YnNmRXU2ZFZ3S2RzTVc5eEtXQm9iaXR5eFVZTi81eURCN2dG?=
 =?utf-8?B?R25VMEZmUjJBMFJRbldkZlhzZ3NCOE4zc3FxMWpUbXA1U0VBOUU2LzhUSDcz?=
 =?utf-8?B?TTB4YjBFQUZ6SE1IYWdTMFV5MkZmUW9taFVuTHJvbjAvMENMRzNKekRqS0Js?=
 =?utf-8?B?RVM0cGR1ZmRJeUl3UXh3eG9oQ3ZSam1SeXhQZkVQcXZ1cmIwckczN2RGK2p1?=
 =?utf-8?B?R0VpTUpjZXRoRWM2bE1HeW8rMmF0VnVoTUJpSXVYd1JWRW1peHhIdC8wRm5F?=
 =?utf-8?Q?PZJAmviR9q8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTIrMVVnVER6b1kxQXBLSXUvMkpwaW4xQ2xHTDF2aXFiZm9qUzExRTUxN1Z1?=
 =?utf-8?B?bjlOeDNlamZKVHI0dkpCeXloVHhkQWFIVG01a0l2V3VIMEJTWHowaFhQblV1?=
 =?utf-8?B?TmtDYWZmQ3hJYkZqSEx3bFRvUi96RWhDeElLbU5WVDFRT1Q1T2loaFZ6QStF?=
 =?utf-8?B?aFNVR1hWZDFaRzZ3TnkyMWhCYmp6S3pHeG9YdW1QQndOVHAxTUFJOVRYc3RU?=
 =?utf-8?B?aFBsZ1VxdHhHWXZCVDJuUS9UdDlQRHZwMkdxdXZBN3F2Z01wSjJRZzJaTnhv?=
 =?utf-8?B?THdVYzdua2UrWFByQWllQWF2bE1tOFZXYzNkbE9vSGl5cGxWR0pQeElaclhz?=
 =?utf-8?B?c0xxd2lycXgvU1BxSmhjbjN5emtQVHIrM3RoamcrYVNocnhldWUwZFBkS2lY?=
 =?utf-8?B?UjBrWnBKc01IN0NnbENQekdHQVRNc2xHU0ZIYmYvQTM5b3dxa1ZwL2pCOE5G?=
 =?utf-8?B?TGlyemdpdGhYUDFjdmVDcWlYdkJKTGhmdEhCS0hkSktwRnpCdnE4QWdIR0Uz?=
 =?utf-8?B?UjJsYUEvOTlIamFpbVk3ZGJDd0REOFI3ZktjV0Z4VldNZGhJaTJSVGs4Ylh0?=
 =?utf-8?B?R1NLMU1rYmFQQzdMTTRNZHJIeDF5V2ZWZ0xVeTRwWUdtZFBwL1lERXZneEtX?=
 =?utf-8?B?MExMMEcxeVlvUmZ1M25kWlFFUjlzQ25zV3Y0NTBsaFNDVjlpeUtENk5xNXp0?=
 =?utf-8?B?L2JEMTRZczNBSzVydnIxVll2N1ZyOWZhWUpINTZrWEpJMHBGK3c3RzVpSk5K?=
 =?utf-8?B?WUpUeFBBWEI0SkFSUGZEUE9xQWxYdldsZ0MvUm1oUWJ6OGtaeCtXeW1XVUJB?=
 =?utf-8?B?YWh3N3FUK1FmdTFMR0FCK0IwVUsxeGNBNUxQVEduNUFleHpsa2xmejdicm9L?=
 =?utf-8?B?OU54RHBuTWVjSUNoWWU3RDR1Q1dFS2gvOE42aDgrR29xaUdka0Q2QVBLK1ZE?=
 =?utf-8?B?b1RSSWVsTzA1b0RqblNrRHZZV3BXR08yQitObTAvQVF2OEc2c1RxMzRxMDgv?=
 =?utf-8?B?UnFsTEhiTjNPN0YvUFQ2MFkrZm1CckExSjd5U3d2d2VBci9vT1Q0ZUlCak1l?=
 =?utf-8?B?MWR1QUdGa25pN1krVTVPTHlmSCtjYWZnVWszWG9jRjU0QnA4SnptdjJ4UnF2?=
 =?utf-8?B?YTJJdTNZakJEN25GdlNvOFYwdTNsdFVYL0NaZUpFSkFkYTljRzkyTHdNYmhB?=
 =?utf-8?B?RmFyTXFianJwK21FSWhheDYwa2pkaExyc25wN0N6dWN4clc0RUdzaHYrYUx6?=
 =?utf-8?B?Rk5rOTdxTDhDQS9QY3pOdzVFSkYrUmpZUWNaRDZoYWxmL0l6ck5MQ2xNeGN3?=
 =?utf-8?B?dWZrNWVWT2Rrbk1Qbkd6aUN1TldUdnRSL2U3ZTJFMWg2ZHhEMzlRM29uUFIv?=
 =?utf-8?B?OEZRZHRlUEVQKzIwTWlVVGhpQzFpL1N5NkM2R3JLejE5ZDJPMHZvYVVGQW02?=
 =?utf-8?B?c3Q0aGNmUkdNY2JTN1BxUlhOd1hpUHBvbU5jTzVxS0FVblB3Z0ZhZkhYSTRp?=
 =?utf-8?B?QVU2OERrU0tHM2lKS3BDM1ZNWjM2NFE1Z2haZVo3ODdoRVJ3azEzYm9xZkVw?=
 =?utf-8?B?WjBZU2dZV1hPczRkVXdBUEpHU2dYTHphVm9TaWUxK2tVQ2NjWElHLzhVQitW?=
 =?utf-8?B?KzlrZmU0YmFxMXlQM1hPYzdMK1hVWStjVmlVemY0aXZWTHhObjQ0N3M4YVVB?=
 =?utf-8?B?bnZETHVqYUxnTk13OVVaRk9EQUNsS05VMGt0OHlIdlhtOWltM0NKWk5QaGMw?=
 =?utf-8?B?QkpwTzdrUlh3c1NuaThSNkgzcUNOYWRaZGNpbEFHL2VrSkhnLzhJNWdGUjhi?=
 =?utf-8?B?RThuTEpacGNnTlozSmlCUnBzU096eUQ5eVREL3F5UHo0Y2ZGQ2UxS2RLNUUy?=
 =?utf-8?B?bEI5WGtWei94YjNTM0RRY3U4cUdBRmZMNVNtVG5xazB4aFBFa250a05qWlpk?=
 =?utf-8?B?MEhaUzNldkRsRE4vWk9PRlk0Z09xY1VhOXpyaTFOZWlENXgyV1NmMmFLeVpz?=
 =?utf-8?B?VmQyUzVtRjdwdnh1ZXY5Qi8ySkdDU3dMeWhsdlJiOWgwY3RVSWlpMU1JKzBl?=
 =?utf-8?B?bGtCbUdsWjBwT09lS2pHbUJGQW84eXJHeGVCOHpYS2xtVnNHbHdaMytUY0pH?=
 =?utf-8?Q?O8Go=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 560a2916-3391-4ee8-1f1b-08dd9ecd8010
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 16:26:01.2480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+Gvw93IS46AA1h0yoQaB5UaaudizEtcvKidUGvlu01HZT6lk5O+QPSGw9f7jx+a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5827

Hi Reinette,

On 5/22/25 17:49, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:51 PM, Babu Moger wrote:
>> The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
>> can be assigned to an RMID, event pair and monitor the bandwidth as long
>> as it is assigned. If all the counters are in use, the kernel will log the
>> error message "Unable to allocate counter in domain" in
>> /sys/fs/resctrl/info/last_cmd_status when a new assignment is requested.
>>
>> To make space for a new assignment, users must unassign an already
>> assigned counter and retry the assignment again.
>>
>> Add the functionality to unassign and free the counters in the domain.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> ...
> 
>> ---
>>  fs/resctrl/internal.h |  2 ++
>>  fs/resctrl/monitor.c  | 60 +++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 62 insertions(+)
>>
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index ce4fcac91937..64ddc107fcab 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -379,6 +379,8 @@ int resctrl_find_cleanest_closid(void);
>>  
>>  int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
>> +int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
>>  
>>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index d76fd0840946..fbc938bd3b23 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -989,6 +989,14 @@ static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  	return -ENOSPC;
>>  }
>>  
>> +/*
>> + * mbm_cntr_free() -  Reset cntr_id to zero.
> 
> "Reset cntr_id to zero"? cntr_id is an index to an array.
> Please provide accurate and useful descriptions.

Yes. My bad. Will correct it.

> 
>> + */
>> +static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
>> +{
>> +	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
>> +}
>> +
>>  /*
>>   * mbm_get_mon_event() - Return the mon_evt entry for the matching evtid.
>>   */
>> @@ -1068,3 +1076,55 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  
>>  	return ret;
>>  }
>> +
>> +/*
>> + * Unassign and free the counter if assigned.
>> + */
>> +static int resctrl_free_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +				    struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	struct mon_evt *mevt;
>> +	int cntr_id;
>> +
>> +	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
>> +
>> +	/* If there is no cntr_id assigned, nothing to do */
>> +	if (cntr_id < 0)
>> +		return 0;
>> +
>> +	mevt = mbm_get_mon_event(r, evtid);
>> +	if (!mevt) {
>> +		rdt_last_cmd_printf("Invalid event id %d\n", evtid);
> 
> Similar to previous comment this is in kernel bug territory and could be simplified
> by passing mon_evt instead. Although this is the unassign portion where 
> evt_cfg seems unnecessary.

Sure. The call mbm_get_mon_event() is not required anymore in this path.

> 
>> +		return -EINVAL;
>> +	}
>> +
>> +	resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid, rdtgrp->closid,
>> +			    cntr_id, mevt->evt_cfg, false);
>> +
>> +	mbm_cntr_free(d, cntr_id);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Unassign a hardware counter associated with @evtid from the domain and
>> + * the group. Unassign the counters from all the domains if @d is NULL else
>> + * unassign from @d.
>> + */
>> +int  resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +				 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int ret;
>> +
>> +	if (!d) {
>> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +			ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +	} else {
>> +		ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid);
>> +	}
>> +
>> +	return ret;
>> +}
> 
> Reinette
> 

-- 
Thanks
Babu Moger
