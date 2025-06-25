Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2043.outbound.protection.outlook.com [40.107.102.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE951FC7CA;
	Wed, 25 Jun 2025 19:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750881057; cv=fail; b=qdhyy1W24TUV5H+sOFDwOvXCGcNmkaFgXXASBZEzKSOCkvazFYlpgkj0K9d3Q+c4cFK/4kNnITrWHZ8c54K39QFVWs2uyuJs0++az6QHGO4nLA2olUGA+iSet6UEqrdbEV7hNvCxKjBeUDWfPU5b43xuRjPROTYI+MYai+qWQBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750881057; c=relaxed/simple;
	bh=IWUWrO9AR+zwo6xoIeITTQMbb0yBS1MiBoXYgSxt36Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XBRPAyr7S7l5SYCmg8fOFy0ORqXFACktJrjLCv3cVUNL00vn3HBw7mv0Z2amJHQVjq19y/vn7SmniO0O3OcF/GM22HD4A58Bg+YMXPx56vdEPgGiHWIesSuznNv0usNu2Xcog+ZzERnOylLrrpOFcro4Jn62gLIiRIoh9Qi8QLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jfadql0B; arc=fail smtp.client-ip=40.107.102.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jfadql0B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F27s9mycjEk137sFmdHWvM6juCZJxm4GpyQCa4sd2VBnYzKvOFMGqEWzTrozTNzlNJpXryc0WKSiRCH8LgB9og7PU6BdgGduIRMJ0FbsVLuPJBTxCvZzvDfOYR7dw8Ht84TieIUgomeOfENJz4We/XyOxgwkEkkHxg7/ipVR84MgdXExllOjbHs6jPt7/Mfpa5G6VyzegkMKHnHZo7fF2zIdaXMQtJFsmdvVL/4ww7QgQp9q/AtTUErCEBS3APkzlTnLoBzeTDv2H6MTp3p+31Xf8hFnh2JDa3LlIjC9iZiqfeSqZC1+GFRhmVEvSCejzeZhoZERgowlz2xt5hKqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3dAYtyXdQUpDiZK9yulX1ck6HVmPQa8FwWl5fpYZEA=;
 b=kU5eJQob+/ZI/5DpRXM6QfzCZQdeNdXzs6ukAUixmlMKM9l+082bhfZogAeq2nnxicNl6Mt6yAqSohp4UgFkBIxLv/10oc1EFKMFWZxsMTpLfwpoWiN9VOduV5ZlNRZwHxx96x8V5Sct72JQuvfW2L7OwEN31tTv1d+B77F7GIbiNttgyBV9Fw+JI9Cj+vs0/0kkZYADP0uVVWHaEhDBggWgPBjfm02L1bxqEOwHi8Jis+I4XT15ZantwxzX/6oIYaYhogYTDvQZfLgMmCrLS0EPFImArLHMvSHUPk1QiRaUehru1YZgC5hLfGyWZUo0WAXWhct2GG8PAwg8s/FjCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3dAYtyXdQUpDiZK9yulX1ck6HVmPQa8FwWl5fpYZEA=;
 b=jfadql0BHz2eZQdrWytUQ4AFS4lmLOsa5kp4LXPZiKzqDL5UYWkTshWdQT+TytAahy+Z3jAMJCAoWON3MnAuTQGqPxWHmihYF9WPNjHa+JatSPZhMa/SUupUbiH7rZLeVCW87feQ+w1vjRDeUY95rdteC96eSIiiLDDMTEKAJA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA1PR12MB9532.namprd12.prod.outlook.com (2603:10b6:208:595::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 19:50:52 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 19:50:52 +0000
Message-ID: <1adaf6c0-1449-44a5-9411-9a098c1bcb78@amd.com>
Date: Wed, 25 Jun 2025 14:50:44 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 10/32] x86/resctrl: Add support to enable/disable AMD
 ABMC feature
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
 <b755ee48c3c70fdd2015b51a331bb0456a107569.1749848715.git.babu.moger@amd.com>
 <c123ca9d-a34f-4b7d-b5d9-15742674600d@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <c123ca9d-a34f-4b7d-b5d9-15742674600d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0072.namprd13.prod.outlook.com
 (2603:10b6:806:23::17) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA1PR12MB9532:EE_
X-MS-Office365-Filtering-Correlation-Id: 500d81b8-59dd-4bd5-3a52-08ddb4219570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUxpUmE1SmlKT3d2QUF6VzJwckd3U05OaStzTjJMUlo0NEdsdjcrNHk3YmR6?=
 =?utf-8?B?T1dyRVpYRGNLdjRmTlNxMkRHU1A3YlJzSmRZUStTVzRYZDQ5SkdGQ3RUQytw?=
 =?utf-8?B?eTZvSTk4NjhubkVOMkFoMUs4Yi9NQ1daTUpQY0NWS0hKOW43aDc4VjlvN2NG?=
 =?utf-8?B?UVN6Nmd6QytBRTdHQVJqOEUyMzN5SzRqVDdSOUJOVkRtNDQvcnhZaHpZL1py?=
 =?utf-8?B?dHRHRVZZYkFOVW9lM3B2eThrWkJHR2x1VnovaDN4U2xtdVBKYWVocm9FbFdX?=
 =?utf-8?B?R0hxTmRyRGpPQzhjZzJ1cHBnYTlqRzBZNkdLck40cTNyVThPOVBTWGF3OWJB?=
 =?utf-8?B?R1NISkZuQ3FtSWNzakp4Z0xCeHEwSFhrN0JVRWRTWVJxTzNTYVAyQ0t2MC9W?=
 =?utf-8?B?OXMvUlVUQWF0VzlRUlArZXVyTTZKNkRTd2xBbzBMa2ZNcG5oWURDNFdwWkI1?=
 =?utf-8?B?OUs2a3hHb2hyeDVlcW5wVXJSTGZWV2IzSVlyQWJqMGl3VFlFVzBoUDBjeU9P?=
 =?utf-8?B?WXRXZExxT3BFblkzcUpzczg2YjltVllkM1R0Q0Faekg2eUxUZ3pXcnBON0dO?=
 =?utf-8?B?TXFQNmhFOEx0REMxRzMzanMvdHE4c29VdGxaTS9vYkUvVW1tMFRrY0ZWbS9r?=
 =?utf-8?B?SFlrK0lQRUREZHNmWCtxRnNWWlJNUm1GZUZwY0t4WjZpNEpYTVJ2cytwQ1Bp?=
 =?utf-8?B?RVJWQ1ZRVGVqL2VIUXdTUmQ2VHVrNkFvWWUrU241d0FtNzlFbDg5aDNIbzR6?=
 =?utf-8?B?eVplbURKODR4ck5CN0trbVZVSjd1cGhrWWhpNmRPWnFQcDI3end1aHFNQnAy?=
 =?utf-8?B?TzJyMnZaN0ZrVmpZVlZSVnhXcm90b2g2TVI5YTU2MXBQVmlBZVRMKzVWZ1BN?=
 =?utf-8?B?SGVzWWNjblhvZzVzRFpBcnl1eE9KS2ZUNVArUENRa3RBNFAwaVoxa3p2YjFD?=
 =?utf-8?B?YWxUaThFa0MxRTgzdk9TL3VIaUZvUExJWG43UTlXNmFHQVNBMW1MQzMyZCtQ?=
 =?utf-8?B?K1psWGhLVkVtUTNteFZ3c1JTVTdFd2Z6S0J1WU80Q0tvcUZaMW42dkJxcU5y?=
 =?utf-8?B?ZW9zK2ZycjhDYm1SV2I4N01xNXAzV25Nd0JRZXJyZ0ppcUtrVVNCNG9xNmtZ?=
 =?utf-8?B?TWN1ZkhiRG13NS9KbWdXZGR5NndtOFNsUFk5ZnZSc3VOWDF0Rk9IdWNScldQ?=
 =?utf-8?B?V1JMZC9tdnU2ZlQrRUx6b0RVcm5XWUFFZXB1U2JkRllhUForYkFhSDUrTkdH?=
 =?utf-8?B?Rkc0LzV5YmRtbFFjYUJwdkZqaDhuaFVSTUJocHJxcnJEVm9LVGRFVG1CMmJO?=
 =?utf-8?B?M0R2dHFDRGFNaHI0bnN4SVcxSlVoN1JFUG1BYTdxSUI1MG4zc1ZiVVlSakFP?=
 =?utf-8?B?M3FBcmJ3emRPRTB6U1l0TklDdUxhQ0h4YVBZVFVpQldLUm84Zk9DMDgwVmZL?=
 =?utf-8?B?bVQvYUEzL3EyRnQvUDlmYTFBUnFXL1pVeEV3eEZIRUpRSVVNVHFQako2UFgx?=
 =?utf-8?B?dG9qTTNoZFNENDM2UWt1SUI4dTlhdkJYeG54a0VhdGw5SU1YcEVyMXpsREw3?=
 =?utf-8?B?bHFKdzYxQWV2V3IxYk1yV25YOS80ZnpMbFNsT3VNVHF1OTlNM2x4dElPU05K?=
 =?utf-8?B?TjQzSFpCQVJveWJJTHBzTG1WMWhodStPaTduTU1SanhNWkVjdHJKRW5RU0FL?=
 =?utf-8?B?NVFkaDJabG8xYm92azNtWHJTTTBzM2dTZzlGdUdPdGJuanppMVdYOUdRNG9G?=
 =?utf-8?B?U2lubmt0bEtlM2lCQWg3Skd5alhudWMvY1VnZ3d2VHZscmp6OGhDeG5BRzFI?=
 =?utf-8?B?UmpUelBqL2pvTVA2NVJHVUEybEpQc2hWNDhYaVByd09rZDEwd2JnT0c1N0sv?=
 =?utf-8?B?eHlBbG96ODZBNVZvWjA1R0F4RktZVGczaEZ3N29KVEUrdEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eStZRHBHOHp4TFFLR242UU00SHJJUFM1ZmdjQmxGM1BVbTZkNmt1OU51Nzgz?=
 =?utf-8?B?OWJHVy9QcTUwSUZybDgzWlVBU05TcmJUcE9YN0lmV2FQajh6UFd6QlpYZEMv?=
 =?utf-8?B?QStWQWw5MGZpM0xnbGdkRXFXQ1paL3F2VUtGQmxaRlhQaWJlUE51Z1U2ZXZz?=
 =?utf-8?B?eVpRVXdacjhSdTdZTSsvc3E1Z1ZEUjVPVHF2NG5HcFMvN2tBQks4ZW5QUjhL?=
 =?utf-8?B?QnV1U3pPSS9RUjZ2bDVhbXJjei9GQVkyeUdZeVU5TW10Q2l5aDJDYmZWT0l3?=
 =?utf-8?B?dnhCQ1JsTmJSbUNJSmxIQitUaUxZcGdPSW9odGNtR2dBb2JyVHZSWUtOczI4?=
 =?utf-8?B?allvVTNrZm0xVzg1QkQ3UVpielRzQk4xZURNZmZmOTlDajFTVUp6RU9SRmJB?=
 =?utf-8?B?OTF5ZGM2clZPdGlCLzhLbGhIbmZjbm80V3oyM3I2enZVb3ByWVZCUFZCbFFW?=
 =?utf-8?B?SUd5Qks4dXpVdkJzUnUyaFBmSkxGcXp2S3MvT0NnMElVQkM5cHpHNXlBUmpU?=
 =?utf-8?B?OHpPQkVHVk13ZDJ3MjZpS09xSThCV0MxMCtDS3dQVXBFYiswc1p1MnpwYkFq?=
 =?utf-8?B?b3E2bndPZVE0V2g2OXZMRlhaMlZsbm1Vb1dndjlGODB3aGpiVjdZdXcvUmh5?=
 =?utf-8?B?THlkd21BYk1qOFd2cHFjeEFXNWRnUzNnQnd2MXRuTU9BdkZNUTlJd1FheTdr?=
 =?utf-8?B?b1oveDB6WmtLaXlzKzJxL0dUYVVGaEdRVW9wK01VL29RNVdzdUdhUGZzdUxz?=
 =?utf-8?B?cW9LT0d4YUpXSjYvbEZZZitURWJkcGNGazgxc0g2bXVVb2s4c201aVZEV0Y0?=
 =?utf-8?B?VnpCR0pWTmVVZWNwa1NYWGhZdFFsL0MvOVUwNTAzVmpxUVR0R0FmTEcrV1lK?=
 =?utf-8?B?Q2ZmTWN0U2VpSS9Heklmazk2TUVKdWVKNzY5MUFESGhyeEhWVmFsZW5lekgz?=
 =?utf-8?B?ayt1UDVNbHc3dmRrVEpnL2pra0NaYVhPVWRjMlhpWmpxTEQzV2xWOVJBZTdT?=
 =?utf-8?B?VzUwR09DOHp2cWNGZXJONGxYYTdnZ1pBa3JyTE0vVzBTWER3ZTd6SE53b1Zz?=
 =?utf-8?B?c1BmMzdhTDlkWkZuQnFUSC81SG5CQ3JmZktIdWZweEsvYVNuMHJkamZYMUk5?=
 =?utf-8?B?M2plUVhWNnY0QnRyTjJxeFhnLzZlVHI2cXU5UHo2SGw4ckxMdzl0YjZvcXRQ?=
 =?utf-8?B?ZGRiNlI5OHV3a0srNk01OWhRK2IvSHJRT1YzcjZieHFSK3cvQkR1SzFPN3dK?=
 =?utf-8?B?UkljVmZPaytBZm5QUXoyMmFtNkFaV0JCdHU3RnpiN2I3Wk04M1p6VHgva25P?=
 =?utf-8?B?Z3BMcEhpRE1jQkNzR0hnNlk5d2lmYWRoZkg1b1hXdHZHWllud25RaGVlN2k0?=
 =?utf-8?B?amZ4TUlDQThIRWhjd2pSY2N6YnY2dG5ITldLZjV0K3Zld1BjTkhLQndHWEQv?=
 =?utf-8?B?ZkptR1BPcVg0V2ovUGNXdHlrRERlVGVPZXo2OG1nK1RxQlJQK0N0VnhyR1dU?=
 =?utf-8?B?UTc0Y0FhUys1dWF3L1RTTEszQUJPMnNyNHJ6eUplOEg1OU15VE0zRzNKckV0?=
 =?utf-8?B?NGdGb2g0UUVJcExwa2Z3M2UwcmRnUWV5R1h1Nm5QNXlCaWNQaXNzd0dTeVNX?=
 =?utf-8?B?U1NpUUNEc1BTNGN6OWkvTGhpcGdVbW5mdGdJSFNMNi9Uc2gzY1EycVFnbS8x?=
 =?utf-8?B?eGZUcUJSS3BpZDlYTDY0NWtpZWJFM3E3akxHMmFNZW04VVdSUkhycWpzSlo4?=
 =?utf-8?B?QXBqTVF4cDRseVZDUmxTYThpSVBUamRYMXFqSXYzcVB5UHhtOVhzM255M04r?=
 =?utf-8?B?V0g2UG9SSC85ZkNlRFVNdkpaMWNFbHZHQnJad0lIbHlwK25iaEJKUk9ZdHhH?=
 =?utf-8?B?SGZQYWkxZWJaTlYrdHhwY1JqSi90OXMrWkxLc21pc1NIQWVrUncvWEk2SHY0?=
 =?utf-8?B?Y0Z4QzlFK3QvZnZRRk5xWFkzeTZlR3hzTWllR1BJN1hHZ1hORGR4bHRhajJj?=
 =?utf-8?B?aktJeXZmY1pXNVJuWXR1TEVDZ1E3cTd6TXJZSVdEcEJHZ2NlTTFGVXFPeHRw?=
 =?utf-8?B?NHlsb29rQXB6L3JjM1FpZTYwMm5mdHdPMWtQMHZYd1UwUTVOUHFCVUs2QWpp?=
 =?utf-8?Q?aGBg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 500d81b8-59dd-4bd5-3a52-08ddb4219570
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 19:50:52.0209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ei/Ybx1MRNSsx/65Fg33vAFiWeZto5oT8p80LCvjhhdykIavlvmnjHKe9zCEAwW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9532

Hi Reinette,

On 6/24/25 17:37, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:04 PM, Babu Moger wrote:
>> +/**
>> + * resctrl_arch_mbm_cntr_assign_set() - Configure the MBM counter assignment mode.
>> + * @r:		Pointer to the resource structure.
>> + * @enable:	Set to true to enable, false to disable the assignment mode.
>> + *
>> + * Return:
>> + * 0 on success, non-zero on failure.
> 
>  * 0 on success, <0 on failure.

Sure.

0 on success, < 0 on error.

> 
> (Just to be specific that it will be negative. Could also be "on error" to match
> similar in same file, but resctrl is not consistent in this regard.)
> 
-- 
Thanks
Babu Moger
