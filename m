Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4BB20296C;
	Wed, 25 Jun 2025 20:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750883633; cv=fail; b=YB7VtxvE+d5ZqbJOdAu7Mprjre0/niTif5SYyiSKOny+HU8DmF55Mdo//Ql75SP0WgFHgHofO2pRaCJXWjNykdzCJD3khrWkKK/QeoAlnvFuKwt+1pobYLPv6I+1VE018tPS9zUYfdq+3Ve3HoHJdY9dJ6wRT6829AjWoEzOOFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750883633; c=relaxed/simple;
	bh=U3r8I/p86HKWeJ3XnolhN9xd5tC+nuO4E9o8cZ2+oW0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MR9rs4lcsU69r4GTt0he70hLAslz/I9WAAjm8sTIgBw6NAe/6aL7qNNLNvLgkwSSoVMlZ2ta/csXe4XJNzwqTtSr5mu+uVpGblevCdx5rYslJinp5F3Z77rql5ZtrIRAAAt6HZ+3IncrZ+AqxRroJKhi3pYb0yhNkSpRCWLNAD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ObtTifYs; arc=fail smtp.client-ip=40.107.101.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ObtTifYs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=po1hLx3ZxqstPf7bvARwvx2Ol9Bg/kz2yX2IcYj3y4SgH7XB+6D/zMpRUUt+/mnEGe2KGLCUtfItxrlGXTqt/y2vtnKuIPlgBwFDleY/1ZqeQbfT3lOHbKAlL6Bq2QNvwd8EBfsuPt/Cg0VtC2QWcI6+BJtwjXzTAynIcoWKVSf4WGrQ5H4t3bmBMjCEUw3mDtkQV82Tile/ZIRszcejgHRhFvX+ZdWf7gScjwrcHzsM4jSUQU4YbARcrJ2BR2FszNqcvNn/O5HZrqAL5fyIQGwMVKLxUpqb9I/c+3wp5Hahgotf4PIc1HZ41kpBuNibnPT9K6XII8EYcla5NL/Z0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XS8hZ8J0shrpOkqXZDCmReWiqJnzbvjz/v8ZFucOBwA=;
 b=gZ/eXpIVh+7LJDGt6nJOgn/MVYUPJxMvmJlVdFHjw+Pmht8/c3dkNBTcal5i+GL3muU+A1cQ/fhSwKf7erINC5+zsFqQuA4CjA1fPFZ63bPl8OgXpYBWJwA0F1aiC4Bt6dNcg+k9NSCkoe0Amp5i/cbv6q39XcrWweBMJ+qwa/mISQRrLzgG2rTCsp1JNk10/CEeAzFdEglDPguHqGuf5SgEBIbZObNJnOszElAJTW3xdwxuUdKFvuRSeMadGHnsLeF3xQd4yeHAalNbEkTuHkaOFo5OOIDrt7VEftI6q1fhivwgjUlhmrEaElaPrPu4ljBAM/YX3x4Z9Io6X1jfsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XS8hZ8J0shrpOkqXZDCmReWiqJnzbvjz/v8ZFucOBwA=;
 b=ObtTifYsZ1ZpYJv/rpWzVjV8siIAaKP+vn0QWU3KVMRSjM2s3PEQktUM3he/69+O8cSxeOAVazSpDhwhxkv6I3v1fNcPn4VHWaQ4rd1g+XGzS/n+Suh10P1qZAoo4BiEXJ8v49sc4syqDepnLnnOWt9gj2Wq0w78o9oOmwlTIq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA0PPFDC28CEE69.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Wed, 25 Jun
 2025 20:33:47 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 20:33:47 +0000
Message-ID: <48d8a630-0d77-45b1-8951-6dd62185953d@amd.com>
Date: Wed, 25 Jun 2025 15:33:42 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 12/32] fs/resctrl: Introduce interface to display
 number of assignable counter IDs
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
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
 <4ad1bac79c6100d347e333b9781b1c76196326fd.1749848715.git.babu.moger@amd.com>
 <84b53541-ce7b-4634-86df-bc0ac9ca4e16@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <84b53541-ce7b-4634-86df-bc0ac9ca4e16@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0020.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::25) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA0PPFDC28CEE69:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd8344d-ddae-4da4-2705-08ddb427960d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGZPQlNkZU9jdHN1VFVHdUZxNzYvM29MbW80d3ZQaFR1MjcrWmVCdTlqV2sv?=
 =?utf-8?B?RVJ0NnFhbjluUlIrWjBSek11dEdpWFJsQUdaNU9JdDk3cjNhMXFuWjhkdzkz?=
 =?utf-8?B?UFc5bjRXS2xZOXdHZm16QTl5WlhjdzlKNTFEdmZiSnhuVXdtNUVVYnVDRXpN?=
 =?utf-8?B?ZWwwODFLSWpPWWJOQUNUVjRuTmljbmRqWit5Rk9PdER2NSt5aDM0Zkw4NmtP?=
 =?utf-8?B?MVY2a0ZPT0pDS3ZnWldEc2xMN05vVnl0YWRRYll5OUJiVEhwc2RxS3l2RnZs?=
 =?utf-8?B?OTR1SzJyaWxoT2Z4RzlyMzRKU3IvMHJKWGxjN1RSL1VjSGxwNGh0MWVBbmVT?=
 =?utf-8?B?NUhtVkh6OUNZSDZ0cW1FYXN1UHQ5WldwTEdwYlRkcE80VXNUUnFrdy9lSUN5?=
 =?utf-8?B?MURUbm4wUSs3anYzbml0ZkVFcGVZR09PWmJ1Ny9nekt1dE5ZKzNEVEZjNmlO?=
 =?utf-8?B?SE5TN0piU3lqRVlQMTgzVy9OTUJkS2lVR3haRnpsSG1Ec081elVVeHY2Ymcz?=
 =?utf-8?B?QlIxdGg3SEx2LzdmWnE5bGdOTzZxM3o4cjVqcTdJUFZOeCtRVmVlY2E5WCtQ?=
 =?utf-8?B?a0NPbHBuQlBnMnp0OFFPNThwTktyVDM0YjBadzFINzU5RUtiRUR0cUs5YzZx?=
 =?utf-8?B?eXVicXNXWkREdVN6ckkyVzAxOU80aVRSRzRaYmZnUjh1bXpvZzM0WC9kMmpz?=
 =?utf-8?B?VUIxM1pWRXJSTVN6MjFZem1HR1J0UXM5ZGYyS0RtOHQ2eDdsbU15YmJFWW0x?=
 =?utf-8?B?a0JFYjlJUzVLajBranJSTU1iUzcyYTFBWVBUajEvcnFSTlJreW9iMXQvWEk5?=
 =?utf-8?B?dXNaeHJqT3JEQ0hReE81M0Y3bngwUmtMVUpxRUJkeWR6YlhhWVZqeVAyWHBE?=
 =?utf-8?B?NGlpczNRL09WVHNGdzJJa1pJSUNPamE4bG1TbTdtT3ArdnNPN3FHMzhta09l?=
 =?utf-8?B?S1RCTGdPaXpYbVkyL0NMeXc4a0tuUXJmMWt0RzkwUDZ5MGk0akpwRVZSOG9o?=
 =?utf-8?B?dGorUTZDaFU5dERSSXlKYzVZaTdBWUV6YjFOWnIvNng3ZjRqTlFjQWVnS1dP?=
 =?utf-8?B?ckJJVU1pS3dkRlNvaVRSaTdnd0F6OXBxNXY0YjlvaE4yUEV3TUdEM3phU2FP?=
 =?utf-8?B?YytDd3BLOGhLdkFMTHc2QkQvZm5rWDBXeUx3SCs0U09ZK3A1NkxUTDRFTkNR?=
 =?utf-8?B?UmtRb292MkdoYVdTaGR1RHB2VEtXd0c1d3AwVFQzSVdhZ3hiY2hTOVJFZm9n?=
 =?utf-8?B?eExPbFRPYU9MZS9WOExpZjFKVWVZM0Fobm9JVThGc1U1VTdoUytBVGpHOEdV?=
 =?utf-8?B?dUtWTHhCRnhzU0J5OC9vK01WRzJGUXBiakJFUWF3WFJLM1BuYmRKSjlRSitG?=
 =?utf-8?B?Rm9hOUFJT0QybkU0dGo3MHV1RUl5YUhITjI3R0VHRk80NkIzeStrOWtkMWVh?=
 =?utf-8?B?ZE9XSmFQZ29ESWh3VjZLaWlGeVNVSkNpRmE1V3V2YUI3ODhLbEozbDcwcjJr?=
 =?utf-8?B?NmJIRytvT01WZExseThkRjc0cGJ1SlB0dkpGYzRhMHFoeW50S0xNUFJPYzlO?=
 =?utf-8?B?MlpIUHl2Z2NHMzY4RGFvM0JldWlUYXJadnZOaUVDWlZkUHVOVTRrVlpkR1Nr?=
 =?utf-8?B?WXE3QUVBMUk5aUhwMTd0ejNhRWlmRW9WQ2ZVVjFJclgxa2JjTzFyTktHenRF?=
 =?utf-8?B?bFV5VDlGUjd2Z0ZDTFJkeVdqYlpZbm94KzFsTHJxdW5RTEZ6L2xsRUNHMjhy?=
 =?utf-8?B?aEhZZGxseG1YZjNZTTlTWGxHNi9QREtvdEFpVG8yZy85WnFEKzhEVnRSNXdk?=
 =?utf-8?B?eGdQb2lpSDk1a3NEMHlsWGk1VzgzZEJWTGR2K3hUVWVpbFhHc1kzdmU2U0NH?=
 =?utf-8?B?TzhEdGVDdXRmejllVFBwZWpDNjdMQnBZSE80bStQZUpIb1lGREkvdTUrZTZG?=
 =?utf-8?Q?iO0T8cPaL9o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmZTbXFrNmRpWS9MTzQrWmVvN2dHT0IyRUhMUUNBM3dVakZSSG9iRHpjd2RK?=
 =?utf-8?B?em5kdXlsSUZmb0JHSmI2OEFKRTlmOFNsSnRlWTJwM2hVTWZNUzZHeHdFMStN?=
 =?utf-8?B?VTdWYUFURTBiY2JiMHRkNzc2VWE2dzhUbTVyS1lQK0daTmRHdVhhUUJIZkJM?=
 =?utf-8?B?dmNINUE0VVpJM0tJemlVd2hiUk8xRkl0a3cyM3FGZUNDaFJwckVMc0RITFJJ?=
 =?utf-8?B?dGYvSVNkSWtWb3NVOTFCT3dudEJFOXZhMWtQS2ZidEpYa0JORWRueDVaNkJr?=
 =?utf-8?B?RGtWVkk3aUVMTEJWZ0w5T0FvMVk3T1lXWTNBWDlLazFqdklMMnNLMk1iWDc1?=
 =?utf-8?B?TDJLUkpuWk5JYis2ZWxPemFzS01HVmNBcmtVSmRZT2l3bVlLbGZuS0FXVWZG?=
 =?utf-8?B?anQ0YkNPYU44anhBbTFETjllR01yejg3cWhIcjdGWVAzb2tEY0QzMDF5Nldn?=
 =?utf-8?B?UlJ1RlVTekdnZHduUVlTRWpmZGNBQXVEdkMybWJEd1I1L1pRR05FYUZMdGw1?=
 =?utf-8?B?UUZhQjJ5VU0xenM4OEI4Zy9lc2FYckNzMDkyUnlwc2xDQnoxL1hWdzBaWWVF?=
 =?utf-8?B?d1p4dlNOeUJneHpBV0lHUmhPS3VsRGQrbmpJM0NlWDEvUjlkZEtSSFdGZDNC?=
 =?utf-8?B?dFZnVmcwbktRclB6M1FZSjZ3c0dOcFdZMkRFbXc5Q2NBeVNsaC8xUlBoK3N0?=
 =?utf-8?B?MVdHNlk4ZDhTbElVTklNOVliY2pwSXE2Z05PdG9xenBVVWU0Z3FGdnZiVWo2?=
 =?utf-8?B?M296S1JjUkx6L093WThVUFpFSkpZQWhvZ29jcWd0ZUxMdUsvUlRpbU43TUxR?=
 =?utf-8?B?aFZRRkJLTGlWSitVKzArUGVtc3VrSFlWTXhoMllpYmQ3SHljVzZUZ1hWYmZG?=
 =?utf-8?B?eWYzSGg2RUY3WUtIZEVvRFQwbVlaU1MzME4vVVhoZDI5VVlkU1hvR3RUMUcz?=
 =?utf-8?B?OGo2RHBPM2haWlhTbmlEMmQxSHJEUDgxMTVrdlg2M3RHY1VBc01OaG1kZXpD?=
 =?utf-8?B?cmdmdmxBaytJNWtNbE1EQ3VHTUpIeXhHN1JlTklacFB0Y1FuM2FGc2IwaTJT?=
 =?utf-8?B?alFvb1loZy85UzlZd2ZvRjNoM2FsemFLbytLbXRlV09jSnd4eXZPK3RhRUJD?=
 =?utf-8?B?V3kycWFtQ2Y5WmJRZlFVVytnVllEQS9zQUttNFk3ako5OVlzeThuUzBOOUcx?=
 =?utf-8?B?aTQwNmFjNElwNDVycjZEV2lUVXc4RTd0eXAzcVp5c0ZveXpZTENuVDJ0ZzlV?=
 =?utf-8?B?QmJJbXRwVkwwdzUzMzZCTHdXWisxbzduMmNDVE1QV2JCT3k1R1g0UURhODBT?=
 =?utf-8?B?SS93eGhzUER3eFJVU210M1dyaSt0Zjk4cmx0M2Jvdm52bHR1eC9La2RrVU1u?=
 =?utf-8?B?NS9kdlBvV3Jvd1NGUDFCRExlM0tvSzNJTkpUSkU2cWNHZ1dOaVhFcFR0RGJi?=
 =?utf-8?B?Nk5SWUl2ZGlCamkyMzZzeFBUdE1yZ2x1dzBLejZ1ZEJUR3lNWTBRckRFUVhy?=
 =?utf-8?B?SVJMT1FwdlNraWFENm1XNWVMR0s2RnhPdXgrOE1iLzVDNXE1MGxKenlLcWtn?=
 =?utf-8?B?QS9mSmVaTnZCT3YrSVN5L29KWFdQUW4zR0dyUi9SNXJHSUZaS29hS05wcEVB?=
 =?utf-8?B?c2hnT3lyZS8wS0pPazAzREw3RzJFZnMycmVpbkhsUXVxMjRwQm5hdmQ1dlZo?=
 =?utf-8?B?cWtBRE5tc1Rad3NiVENLU0RvOEM0c29sUmxPOEdqanZOMk9uZ3ZPcjdHRXNH?=
 =?utf-8?B?V2YzUEJaWUsxYUtpN3o5L0ptNGhvOGxNZW1NRDhaekpscGMrb2pCc3ZiL3JX?=
 =?utf-8?B?RHV3OSswVk1xS3RkVGNrb0c3N0FmQ1JFcm9VanQzMTA1WTRnanU5VkliOXRi?=
 =?utf-8?B?bVovOW54ZUowQWVCZUdoTGJOTC9KMFZYbkVLa0NhVVFCUnZlZVVhN1JiMVNk?=
 =?utf-8?B?b0RRQXE1STRqWll1bk9seUcvWFhLTE1ORUg5c3BxaDUybDc2ZHF1cnRtaDhp?=
 =?utf-8?B?eEZxcURxTFFlUDZGWm9xZlN2eWtKLzNyTXpBV0lRTGJxZjFiOHcxQzM0Wi9S?=
 =?utf-8?B?SnZlQzhwK0pkdzJoK0lxY2NVN0I5cGY3VURuaEVsUFE5U3FLMDEvbnIyMG54?=
 =?utf-8?Q?tqm8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd8344d-ddae-4da4-2705-08ddb427960d
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 20:33:47.3252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Edb/nv6QQxcs/1qb3ePMsXpiZcdUeVS/V0I+ZzJDse8CNKH+wROhjYY/0HD2fWx+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFDC28CEE69

Hi Reinette,

On 6/24/25 18:05, Reinette Chatre wrote:
> Hi Babu,
> 
> There seems to be many places referring to user space assigning "counter IDs",
> as I understand the interface the user has no control over the actual ID of the
> counter being assigned. Please correct me if I am wrong.

Yes. Agree. Users have no control over which counter is assigned.

> Considering this, how about:
> 	fs/resctrl: Add resctrl file to display number of assignable counters
> 
> If you agree, please check the whole series as this seems to be an often
> copy&pasted term.

Yes. Sure.

> 
> On 6/13/25 2:04 PM, Babu Moger wrote:
>> The "mbm_event" mode allows users to assign a hardware counter ID to an
> 
> "a hardware counter ID" -> "a hardware counter"?
> 
>> RMID, event pair and monitor bandwidth usage as long as it is assigned.
>> The hardware continues to track the assigned counter until it is
>> explicitly unassigned by the user.
>>
>> Create 'num_mbm_cntrs' resctrl file that displays the number of counter
>> IDs supported in each domain. 'num_mbm_cntrs' is only visible to user
> 
> "number of counter IDs" -> "number of counters"?
> 
>> space when the system supports "mbm_event" mode.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>  Documentation/filesystems/resctrl.rst | 11 ++++++++++
>>  fs/resctrl/monitor.c                  |  4 ++++
>>  fs/resctrl/rdtgroup.c                 | 30 +++++++++++++++++++++++++++
>>  3 files changed, 45 insertions(+)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index 4e76e4ac5d3a..801914de0c81 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -288,6 +288,17 @@ with the following files:
>>  	result in misleading values or display "Unavailable" if no counter is assigned
>>  	to the event.
>>  
>> +"num_mbm_cntrs":
>> +	The maximum number of counter IDs (total of available and assigned counters)
> 
> "number of counter IDs" -> "number of counters"

Sure.

> 
>> +	in each domain when the system supports mbm_event mode.
>> +
>> +	For example, on a system with maximum of 32 memory bandwidth monitoring
>> +	counters in each of its L3 domains:
>> +	::
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>> +	  0=32;1=32
>> +
>>  "max_threshold_occupancy":
>>  		Read/write file provides the largest value (in
>>  		bytes) at which a previously used LLC_occupancy
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index dcc6c00eb362..92a87aa97b0f 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -924,6 +924,10 @@ int resctrl_mon_resource_init(void)
>>  	else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
>>  		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
>>  
>> +	if (r->mon.mbm_cntr_assignable)
>> +		resctrl_file_fflags_init("num_mbm_cntrs",
>> +					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>> +
>>  	return 0;
>>  }
>>  
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index ba7a9a68c5a6..967e4df62a19 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1829,6 +1829,30 @@ static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
>>  	return 0;
>>  }
>>  
>> +static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
>> +				      struct seq_file *s, void *v)
>> +{
>> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
>> +	struct rdt_mon_domain *dom;
>> +	bool sep = false;
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
>> +		if (sep)
>> +			seq_putc(s, ';');
>> +
>> +		seq_printf(s, "%d=%d", dom->hdr.id, r->mon.num_mbm_cntrs);
>> +		sep = true;
>> +	}
>> +	seq_putc(s, '\n');
>> +
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +	return 0;
>> +}
>> +
>>  /* rdtgroup information files for one cache resource. */
>>  static struct rftype res_common_files[] = {
>>  	{
>> @@ -1866,6 +1890,12 @@ static struct rftype res_common_files[] = {
>>  		.seq_show	= rdt_default_ctrl_show,
>>  		.fflags		= RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE,
>>  	},
>> +	{
>> +		.name		= "num_mbm_cntrs",
>> +		.mode		= 0444,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= resctrl_num_mbm_cntrs_show,
>> +	},
>>  	{
>>  		.name		= "min_cbm_bits",
>>  		.mode		= 0444,
> 
> Patch looks good.
> 
> Reinette
> 

-- 
Thanks
Babu Moger
