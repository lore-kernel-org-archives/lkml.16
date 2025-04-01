Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BF1F510
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743466091; cv=fail; b=tN4BdsxNsVZvaJG9+bB2AdLYnh14U9Wp0VGxE9RRBlkkqRG1PObp7ouVnN/fc3EV02S9zvwU12SlULR0e+0GkO/H8FhhBunpz2hy/BL05IXr3A3xyZ+GDXL8f6Cxdim3NMws0yG1aFcsLHPfwZlc8pMguAz5A9xwG15epcIDxN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743466091; c=relaxed/simple;
	bh=uDTIHRhIFAc/o60jvlooqwS8L16W5Q+lvDbus1Hm7HM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KpEkGIL+dpCSDniUW2tx2ulVsJaVFVbWO6dVqxJCZaO4imEEV/JjSV0+fUI8S/3zWs4hW30n89lAzUyiR8jmCLKRHbn3nw9KTegvYw+PDg0+BGTubpID7uuW3gy3xWk76A+eXGvGi8M3csgnmT4ur3S0oD82Gr0DL+b7sCh4yos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mXJbR8em; arc=fail smtp.client-ip=40.107.93.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mXJbR8em"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWogwLZuKCtC4ajItaaATLhNEOvAAvuEnq9F+2s4ZLWlTknl7PnkCVQSnPxSCS6zYLYNpKUf5QZJAzfkTP3ng3Ubk1+OQ7i/e6Qy0Q27SM+SrrciYzz4yblCFAFnTYkWrA0vQNJJTNPXnepcGMUQLvieFSJq7u1yCktcsRZjpl+42xAGrDBVllzgmz9+C4wnk2Jn5FIlq75SuqaBmXK8n5yZvfyq6f6ue5mY8KJa5sue+l5SxyuN//Zedekv+9OMmnEwLIEMc7W96s1nMgCx88qcmPYt2x91Es6sQmpr6H66DA6qrpx6rm7Q8tWjwC86Q7p4FDdwOPecfQ4kjczoyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vMMZQAXUOuKUW/H4/iIdPexFdyfYVrqe5vIuthqfXk=;
 b=XzMnZ4Vgks1WaFwJQPoffzxPs7lDqvpWGGHnqu/PUKOuCrkcsoYdN0i6LLkLFjfu2CaakdTDTP3PPXclDrEe81oWZnulfZbwI7qfC6O+VDS8kRqgrhD+LpeQU/QB+ed1I1waGBvcYEPJVX3QhvqHR3t8sgXRoKo/njoaDHvay5gNaYEz45fTGkssO+65BfHK3QNCJX9PXt7apT8HLqJ7DJDVxAmiq3+FoSfMpPYmbDOk/K3lgQgC3hasuYGo6X7solAdEqKNRz4oLL5c5njPH+yPxvG1k+m+0FC84w4Dxg3FgRQ0ufjB2H+FNp9mVljNcJMfTdWqfpk8hVtQ5yAWsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vMMZQAXUOuKUW/H4/iIdPexFdyfYVrqe5vIuthqfXk=;
 b=mXJbR8em01zgjVbBKWV8cNqIxty4tdfpvBCxb56rKMFqahhCWfm0SVK0az5Z4BXCduZOMu/oH+Hro2xt35iDAt81WM7QH9jyV+OSbLm56L2uO2INvzuPsKsup5UU+Rap6ar1X24qkn7qnD1ws0qm1nBIHWdfOHifM4VEqbz1Gr3cDvuEbiePKa2mFgS+PWZxM+AiXW4hkhy4RRq1sW6NYPVdsU1OEhjpnsawJLMB2ivksKqMj+oHe1swqdOJnHXohxJC6uQZBKB89pHL5Ygsx/ZEaxFLatpZBT4G4SR+aQRYyjeq1NXwQYlxB+GCPY59y0BaA26LFVKG5rd8EGmIzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7267.namprd12.prod.outlook.com (2603:10b6:930:55::17)
 by SJ0PR12MB8168.namprd12.prod.outlook.com (2603:10b6:a03:4e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 00:08:03 +0000
Received: from CY8PR12MB7267.namprd12.prod.outlook.com
 ([fe80::ead2:13cc:9d4b:6a8b]) by CY8PR12MB7267.namprd12.prod.outlook.com
 ([fe80::ead2:13cc:9d4b:6a8b%6]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 00:08:03 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Balbir Singh <balbirs@nvidia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Ingo Molnar <mingo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Bert Karwatzki <spasswolf@web.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] arch/x86: memory_hotplug, do not bump up max_pfn for device private pages
Date: Tue,  1 Apr 2025 11:07:52 +1100
Message-ID: <20250401000752.249348-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::26) To CY8PR12MB7267.namprd12.prod.outlook.com
 (2603:10b6:930:55::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7267:EE_|SJ0PR12MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a8f88d3-baaf-4550-6060-08dd70b14523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0RqSnM2N1J6ZkFxcjZvV0M0cEpBZzNzZS9Zd2w5blBwMlpQUEViWnBOZ085?=
 =?utf-8?B?Slk5U0RCeEVQMmNvU2FTOXNEOFArL21FNkxydTVqVmp3Nk1LcmxGdUZubnh4?=
 =?utf-8?B?Q21qMk5Dd2Z3aFdrWmFYOGZZZzF0VitHanJCVlJOLzlKWDJtc3hFaHJOWWl6?=
 =?utf-8?B?OW1ZRktueC9YVjJ0RDR1cVBOd2FMT1FCTEhCbGxTRmVxenpzOGoydjJ2SE5k?=
 =?utf-8?B?UnVvWHBvTnhvVSt6NitNOXVjWDliNHhGUEpXc1IwbHEzSEhxbTNtOTgyZWov?=
 =?utf-8?B?ZWJIWHlaTys2ME9mQkhSUXZWN1lCQUgvblo4R0NFY1M0K2MvekJwVEhXbWFC?=
 =?utf-8?B?MWxkVDhnS3N2c3BsbWpGTGt5MkVhdFhaWmxDWjJDek1QLzh3Q29xeFBWMGk4?=
 =?utf-8?B?Q1dJZHZ5WmVyOUNaTlJua3VBZ2xncUhEU2trdE92RXRjenRCSlY4ZkJMcDln?=
 =?utf-8?B?R1pTUGc0Q3lSUTN0Q25FWWFwMG9BNThvUXB4KytSc1RWU0NWRkMwVGdaU25k?=
 =?utf-8?B?cVpCRGh6MURHaFBuMU0rUTRHRUtQbER0c1Z3QzBOZ1l5WitsNnlua21aNmR0?=
 =?utf-8?B?OEIvUm1QVGVpVU1aUlFOQTVWTzN4aXRsZTVmWHFFZXhnT1c2SjlqRUtuS041?=
 =?utf-8?B?Q2ZYTnpBcVRjMWliYXFSREtoY05qUEQ2S3RYdzVuTG95TWhvdHlHTGxGYng1?=
 =?utf-8?B?U1hLd2wwNVE0OFoxc2diTU5GVVlaaHhYZUJsYUNRQ01QOGJLdDhEOEtTM0JF?=
 =?utf-8?B?WTFmek04Z0FjTzhkR0VrMS9rRlpTb2plTlNZY1pOTDRXdnE5TEJQdkF5NDd2?=
 =?utf-8?B?bHRCaDk4K3lHRUs5ZUhRK2R5WjJJQ2s2ZTQ4bTV0Q3VrSU5rZDR4M0FhSDRO?=
 =?utf-8?B?TS9rQ3pJUmVqWCtCSHJCQURCemREUlRmakpXaFZoZElCbEUzWmtWdHVEeDAw?=
 =?utf-8?B?ZlhZWHVnb29BQmE0cEdjZGQ4dGw2V0l1K2FyZy90dWF6K1ZIU3lJNlpMMlgz?=
 =?utf-8?B?czFpdHJXZUNXNzNBWUlFZzhYMEFMdTEwMzFtczNuTkI3cGFlVmpYdHRiMW1U?=
 =?utf-8?B?V1dHZE1ra1ZKb2YrdVg0RkE3ZXNySHllL2NwSWtCZnh5dDJDYnhRMHBlYi8z?=
 =?utf-8?B?Z256RGJ2Q1BWNjdMVEgxRTNEQ1diaXp6bjE5MUFrNHRhM2xvUGUvUFlZQWtW?=
 =?utf-8?B?ZG5ablNVK2ljeUpkL2RxMUFJWFhRUjBpNzEwLzEzdm12c1Axdk5ScmRkc25T?=
 =?utf-8?B?ZnZVWlNMa3h1WW9HamtNNTdmR0kvbEZ2cHNhZWE0UVJpUWw4SHJhQlAwNXBV?=
 =?utf-8?B?UmhNNmNlZ0hMTEtHeEhnMDR6VGRGVTFxVHFSdTdCYm1EL0ZIOXZhbExyTkZV?=
 =?utf-8?B?RTNaeU1UaFNmZlIwMko2bUpnbWo2TmQwTXlCdVJjK3lmSndMZFZDOVhJOERF?=
 =?utf-8?B?OE43djNTVTM5OEhJTUoyMlRIQ1cxSFpYSmxiU2Nyb1Eya2NIckM4N0plWkd1?=
 =?utf-8?B?R2hLa3pxaDRWdnF3NlRaQzc3RExKVjFiUkJwczZxVk9rb3pjMFFzSXVPZVRL?=
 =?utf-8?B?VURlV3hXckVvS0VxY2dMRy9oc1hXcDBubHU1eFplVXhHYnhOYnpNM29IRXdq?=
 =?utf-8?B?cC9lbTN0UnpFNnFiMFFDWXhUcnl3S3NRUzV4Qjd2QWxibHh5eDVaVnYvRVFQ?=
 =?utf-8?B?Zm13NnJlUlN0aEVBUHdLSUg0c3FuRmkzT1dacEZKZTJkK0RyUDlQeU5qTi9E?=
 =?utf-8?B?Z2NuK0VFTVhqL2VFZzlQUDZCWG9CYld3cFUxajVSdnNaUXNiRnBvZTYwdnA1?=
 =?utf-8?B?cms5UjBzQUM5Vk9WUmwwMklxSGhjWmpsbHR4V05ZUEpnVStJRXhjRmowVHdR?=
 =?utf-8?Q?22ISmjzn2/pEF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7267.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVZ2Ri9MeTRaemtwTmxMVjVWczhBVmNUSFU0Y1VkZ2dlSmhtMHAvWHNRZnFz?=
 =?utf-8?B?RGhxZHJ3ZUkxczVCY25tZXl1TjFtV1hPWkVHNUFpcFRwemNxMnlxYnF3S3Z6?=
 =?utf-8?B?MnFOSkhnMDhEYlFjVDRJU2JKQ0xJUzJWdjM4RjVJQU9DOE1yMUJMWUFGSjRK?=
 =?utf-8?B?R2J3Q2dpdE1EdHNRMkxKZDZicEsxUW5qUkZKYjlXcWFkOXc5dlRXaWZmcWJt?=
 =?utf-8?B?WG5nQndUNHhBVGY0YUh0UnRSU0RuMFMwU21tWlBjbmVYVkwrcm1LVXRGR3dH?=
 =?utf-8?B?VERQaitlV3A1bTJVallFQkR4Nm04L1MyVTJBK3JmN1RvYzN3VTBBUFdaUy9V?=
 =?utf-8?B?VHkyTENPcTNIMFRVNkV6OUdxWFBlSEFkRjBiR3VXMnhyV21WL1dGSWhucHRI?=
 =?utf-8?B?Wk9HUXN3bzVKb3VZM0RPbFNVTFRyY2Q3czBFRXVEdFk4UUJWb2wxVnFNVFhL?=
 =?utf-8?B?U25ZNW9JOFI2UktUc1FkWFRXOEJFZDI5dmRGSEZFd0xPbk0yTEo1TzNGWG9K?=
 =?utf-8?B?blEybXgxc2NGRVJpdmRjSStCOWNQVjRiSlZoalR6anVlaXA4Ly80NXdkQWNN?=
 =?utf-8?B?OXV3U2M5ZGs1TEk5TE5ETVBEVGE1MHBEUy9sQ05jQXA1Rk5QQkRJcDVSWTgw?=
 =?utf-8?B?NTJ5UWRlbStQZGE2VjZXd2hjWGw3MUt1RGNRa241ZHozTkJ3ZS9ad2U1MVkx?=
 =?utf-8?B?My9vTDVrZkhUU21yb0E4WGxLMEdubXZDZXp1MU1FVDVLUThHdlNzaEluNzFh?=
 =?utf-8?B?Qk42c2FkT2pjZGRkTGxId2tueG5lNnExeERFK3MrY2VDTTVoc05RZTZiYit1?=
 =?utf-8?B?bWIycXRhWlZlNUsxTVByWjZQUFoveFI5NFE0MGk4aVEyaWg3VDFtZVpPUTlY?=
 =?utf-8?B?MVExTURBcDVQK3YvajdCZm9rdEJHdnlLQkZ0L2NZN045N1Z3MkZIY3pBRUtB?=
 =?utf-8?B?bjU2ZTJuM0JPV3BHRGFVUERqNHlERDBDWWYrLythQVVxaUQvZVJNL3dmZXR4?=
 =?utf-8?B?VnVGOWs2QWJtc2NUR3RuTk0zdkpDSUpOTnVDN2ZQd1UrVGtSczhwbHZFNzZv?=
 =?utf-8?B?cEZvQVZ1Q2szYnZHV2d4Q3BhRC9LZzNCQUZKSnlvcHI2bTQxdWtmNUdQcEVh?=
 =?utf-8?B?bUN5MlF2WlphOWdqZkVLR1RqSStRNXVsalZ2YklZTVFSZHllQlN1eU05Vk04?=
 =?utf-8?B?QkRMcDdiM1JobnZvN2ZVcE5mVGV1WUZwY1ZxcGhCdWMvelNMWlJoT0JPa0dW?=
 =?utf-8?B?RGFmUmdtSXhWMi9DdXpwejU4NkJ5UWRkQktFRHdXQkZqdjVOUTE5aVBLVk1l?=
 =?utf-8?B?NkFkYjJSdlJQTEV6Z1RlQVBuZ2V0bUJPdHdzc2c5c1EraXhzZGZIYkc3V3pr?=
 =?utf-8?B?Z3kyOGphT1RsRE9vUWRJOE5uMUN5ZEFpZTVtbkVwaUFCbm81YURkcWFnbVlk?=
 =?utf-8?B?YlJLSGdLQVlpRE1FMTFjM2dzSmdFTStRRW1UcTJxaHVSOXF2a0oxbDVlcFNy?=
 =?utf-8?B?K0k0TzJWWEtLeVk3QmUyS2c5WUF4eTRBdjdld2ZMMUhxdDMvYVJUd0NlVzlV?=
 =?utf-8?B?dzIxbXU3M0xXSG9HdWtRSGtKWTBmZ2kwbUdCQ1dXMUZYZjBBUGZoZGZmUlBo?=
 =?utf-8?B?eG1MQ0ZUamcyaldkU2tONWJOMFFjN0JWQXdYcHR5bWZkRFJxTXY0djRsNTBE?=
 =?utf-8?B?dWp6MWo5MkJoVHhnOHBNSDJtSVljeU13MHcrV1lvSVVLNHNpbStOM0NGVkM3?=
 =?utf-8?B?R1FSNVBTYkxiNkV4RDBFSXhQLzZab0NmSWRwOEFOZnhNSVU1SEtmZGVyTkFN?=
 =?utf-8?B?b0R2TmcvZHdkSEZQR0JaNVdEbjZueGJ2czJWOWQ3WlVvWENtclB3dWlPYktO?=
 =?utf-8?B?ZHpLamdvbEVWVzVwTy9YL0xVQU9ROFlrZUgxbC9uSnlTcHgwdXBrc2lxSEFa?=
 =?utf-8?B?dE9udHZrUmErQXlKdUNnRWlRYWpiY1k1UERrRG1iQ0hqa3IvLzY3VTAyc2pQ?=
 =?utf-8?B?RFRSSmIwVEZ3SERvOGs5VXQ4Z1Q2cXNMM204WUEyZFVxZ3lwMUlFcHBOdjhS?=
 =?utf-8?B?bzBFR1dUTGNZK1ZpZ3pIQUVyTlJCcmVnY1FLOFBlQkVTTGsxRzJNdGZIMzJh?=
 =?utf-8?Q?dcuw+7Hi8RmCKdoepS6Eay5wp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8f88d3-baaf-4550-6060-08dd70b14523
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7267.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 00:08:03.0089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqi+sa1yfjR1qnaVRfN/oj1fGKoFggQX86GTHOLogRGMGIDHgTGXrsGa2aTtM6UFf7AZiA0PbmDs/+NP/RLVTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8168

Commit 7ffb791423c7 ("x86/kaslr: Reduce KASLR entropy on most x86 systems")
exposed a bug with nokaslr and zone device
interaction, as seen on a system with an AMD iGPU and dGPU (see [1]).
The root cause of the issue is that, the gpu driver registers a zone
device private memory region. When kaslr is disabled or the above commit
is applied, the direct_map_physmem_end is set to much higher than 10 TiB
typically to the 64TiB address. When zone device private memory is added
to the system via add_pages(), it bumps up the max_pfn to the same
value. This causes dma_addressing_limited() to return true, since the
device cannot address memory all the way up to max_pfn.

This caused a regression for games played on the iGPU, as it resulted in
the DMA32 zone being used for GPU allocations.

Fix this by not bumping up max_pfn on x86 systems, when pgmap is passed
into add_pages(). The presence of pgmap is used to determine if device
private memory is being added via add_pages().

More details:

devm_request_mem_region() and request_free_mem_region() request for
device private memory. iomem_resource is passed as the base resource
with start and end parameters. iomem_resource's end depends on several
factors, including the platform and virtualization. On x86 for example
on bare metal, this value is set to boot_cpu_data.x86_phys_bits.
boot_cpu_data.x86_phys_bits can change depending on support for MKTME.
By default it is set to the same as log2(direct_map_physmem_end) which
is 46 to 52 bits depending on the number of levels in the page table.
The allocation routines used iomem_resource's end and
direct_map_physmem_end to figure out where to allocate the region.

arch/powerpc is also impacted by this bug, this patch does not fix
the issue for powerpc.

Testing:
1. Tested on a virtual machine with test_hmm for zone device inseration
2. A previous version of this patch was tested by Bert, please see [2]

Link: https://lore.kernel.org/lkml/20250310112206.4168-1-spasswolf@web.de/ [1]
Link: https://lore.kernel.org/lkml/d87680bab997fdc9fb4e638983132af235d9a03a.camel@web.de/ [2]
Fixes: 7ffb791423c7 ("x86/kaslr: Reduce KASLR entropy on most x86 systems")

Cc: "Christian König" <christian.koenig@amd.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Kees Cook <kees@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Bert Karwatzki <spasswolf@web.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Nicholas Piggin <npiggin@gmail.com>


Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
I've left powerpc out of this regression change due to the time required
to setup and test via qemu. I wanted to address the regression quickly


 arch/x86/mm/init_64.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index dce60767124f..cc60b57473a4 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -970,9 +970,18 @@ int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
 	ret = __add_pages(nid, start_pfn, nr_pages, params);
 	WARN_ON_ONCE(ret);
 
-	/* update max_pfn, max_low_pfn and high_memory */
-	update_end_of_memory_vars(start_pfn << PAGE_SHIFT,
-				  nr_pages << PAGE_SHIFT);
+	/*
+	 * add_pages() is called by memremap_pages() for adding device private
+	 * pages. Do not bump up max_pfn in the device private path. max_pfn
+	 * changes affect dma_addressing_limited. dma_addressing_limited
+	 * returning true when max_pfn is the device's addressable memory,
+	 * can force device drivers to use bounce buffers and impact their
+	 * performance
+	 */
+	if (!params->pgmap)
+		/* update max_pfn, max_low_pfn and high_memory */
+		update_end_of_memory_vars(start_pfn << PAGE_SHIFT,
+					  nr_pages << PAGE_SHIFT);
 
 	return ret;
 }
-- 
2.48.1

