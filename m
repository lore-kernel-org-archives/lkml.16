Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B841E89C;
	Sun, 15 Jun 2025 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749995292; cv=fail; b=s2EC5uswVYHuvHLk5VF83isVLczlS5pzJmHDbCiyEUxy/VWsbxXF6BOUxPs1BO4XtMHwtILcAmoG7xFT62iHXtOVZSFO0yTTOE+oNU45S94W2ZgUGWT47zBRHPNSE6U/RXb+dXx22qJAUi4RrKZhsI6a0lF1O+0UxFVQ9tMg1yI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749995292; c=relaxed/simple;
	bh=gJQbTrx0GWcoyravP1UTIuGnTX1SwjYQiuunty+O60g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=IKEl6Z9832illAdgIzW/osySSxZatS0+i/DTjtNNAB3T2tnk5Yn6qY9/VbEotlgkznIIz6O+XX4xcOzaq4MlnGZ6yAB5kQisYsDv2hqGCXXRvlLuIi8QhTacw4GHvDyltja0eHcx8XvGWOPXo22oSFzmfifKI78CnUKdavM+GPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ePDgglE6; arc=fail smtp.client-ip=40.107.223.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ePDgglE6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADh3Vy6doVX6wbcp4bJhZfC2dKCjexLjKF3AMVwK3E6pvUASVPWneTSrBIy9m+bNbuA+vuD7Venp4JvkNlvhtLwSRJRH9m9ZjFG8dzo5DtzTs9/S1zHgtiuatJr4+5PelSWbK9Sr0+aNHAn9iA/Z8hibIgFwHj7dbFPAI+Vd1j2liHEWXRVSiNb0WyR0mqIMUCcdB0qIIO9OnqXGCYFLZdUr1g5/CepoRBOhCUqr7+1OthcFV99S68ALSejfTG4KR/9RTE0nK1AxBeOWEg6CF/e2/+X3BgCaZy+MEdjctQpfhLnpQ334zRWVFNMkEacGBZ5MdkXNMrLS30RX9VWZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJQbTrx0GWcoyravP1UTIuGnTX1SwjYQiuunty+O60g=;
 b=HW/QfqkSnyUCgH5X9Fku5JpLNyO9nxxqo9FfwdnS4kT90B2U5m0pe11wSVgl7u0cqeCs3kRonSlkx5reZwpuOoUWLhNlTqdD57VdReMbM1np7O/tiHFq2eyGY4dgzXjDmT60YySQcescxgPz78SyK4eYk7jQW8GwnwOObLFgkFGJgYHXiIj9T9gACI+8TWi4GiwtPWVe0BO1unlPOi7WNio7ofGUk/FCcb5X/5AC6PGuGb2iQ8fPHKpvnKR7oMPXcaclV1p64b4QQdE+Il/QQBOnCrEp/QmG4kC4Dnfkr2MOMbsTB774dkZW6KIfHxCwYwE5ul3c+EpBnPP/ujg7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJQbTrx0GWcoyravP1UTIuGnTX1SwjYQiuunty+O60g=;
 b=ePDgglE6J5Fzb0ZIYH+jyeVzIf8x7eg33zpxmxOW5rQSS2q5bvio3C0PW28omUJXmB+6WQSxK5muYfZWHL8O47itNlxe0c2GijSIB4o9MJAr9TH5MtcpFF6HHgzcftYBmzimy+D1V11NzmlMwO9ewDeWzW3rer606qtGCm5dyApysHD8dytfu/pwn8O5pDH0Z3T4ALmRRUB/IoQUukSrbBi+iZhGrTHpLgGPdK7fzmMYWL98VMq2IutXjzMOO6b/39Uqor8wDWAA/zVp8AUrIYQmYp1mas3fnghoirzRTkjzCaIiLi3CBBieq/g8ema9JIenhGK9//JDVhd8xQjFCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB9424.namprd12.prod.outlook.com (2603:10b6:8:1b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Sun, 15 Jun
 2025 13:48:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 13:48:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Jun 2025 22:48:05 +0900
Message-Id: <DAN5JZIZEIIR.3DJEY70B1TZJT@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] rust: str: implement `Borrow` and `BorrowMut`
 for `CString`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250615-borrow_impls-v3-0-621736de7f29@nvidia.com>
 <20250615-borrow_impls-v3-4-621736de7f29@nvidia.com>
 <CANiq72kmN1iK=AD0yzj5TyMGJowaFzGMZjEXfUM3TCSRJkYuNQ@mail.gmail.com>
In-Reply-To: <CANiq72kmN1iK=AD0yzj5TyMGJowaFzGMZjEXfUM3TCSRJkYuNQ@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: f15472ef-3168-4194-221b-08ddac1342ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekxseTBFNVZnT3hGTms1MW1YbjlSUjhhM3BpKzBZa1haWkRuOXNXRE9XcUs4?=
 =?utf-8?B?aEpLK2p6TVJmMWErcUxqK1k5eDVhY3lldERQa2drNjdkVjJuYkhZWmEyYktM?=
 =?utf-8?B?MUhpUGZYN2NEMlVpMDBCaFFyT0NuVyt5bTdvellMR1czZmhkcTlmbSs4NlNn?=
 =?utf-8?B?KzcyQ2hEaDlmQzFmNjZRY1ZZRlV6bGhNSFRBM01nY2t0Q3ZENkdXTVpsMXRr?=
 =?utf-8?B?aldST3ZhVE11YzRaWGtTeWQ4bm5oRGlJTGViejFVWTNhdnZTam1sMFhiM1ph?=
 =?utf-8?B?U2FpU2RJZHUzQTdVTks3YWNkUnFZUmFkU1Rra1pzVEFLSzc3OTNFLzdvNTV4?=
 =?utf-8?B?Smg4MUt2dDIrK0FnNDFmR01mTFduUEFKcnByeWszRGNaTU05U09uSTdQOTZE?=
 =?utf-8?B?MitNUlVpOEJyQlVlM2tkL2ZqaHJ0enNQWHFZeXpQVmdEcE5KeUNwaVpabWFw?=
 =?utf-8?B?emthMk5wTWRFWjEyVXJPMG42MVdoMTVOOHp5dVhZc0NPalV0WjFSTEgxU0o0?=
 =?utf-8?B?MHhITENKSjJqZnpiS3luSVlqdHp5ZWlKbmVYRS9oaHljMkJaTXRaZWpMK1BN?=
 =?utf-8?B?TGw5ZjMwdTdVbytlcDBnTW1ESlRud3lpL1IwR291bU11ZVVVdlI1TTdZcHo0?=
 =?utf-8?B?V0tEcGpEQlFaVUpzbmdUK0VBRG53alpVRVRXZm55bU5VUUhaemJVNjEvbWNq?=
 =?utf-8?B?b2hnODgvaTdUQ1ZTbjd0S0pJNC85VUkyT3N0Y3NEV0J4bVBTQ1k2d2xJREo0?=
 =?utf-8?B?ZU8yYjZhb1ZKbGN6OHI4c3JGYThUbjMyeUx1Qktwd3ZhUkJkTnRaU25TZng1?=
 =?utf-8?B?bGl4NjJLcDJvUkdrRDdPMjlnWDZ3Wm5CUUJxUitvNjdXSEovZmx6RG5ZM0t3?=
 =?utf-8?B?ZFZQUVptNDM1MlZ1RHNOSnlzaEFTT1A3REFycm5RdmpJbkVWS2xyWWI0bVZo?=
 =?utf-8?B?QUlTOFVuc1JMdWlEU3FUa1drcWFMU0JYNExwT2NTQnNnZmpaOFVBYWhUbFJR?=
 =?utf-8?B?MlJUZzQ4T1VwYXpNR2o1ejIzV2NKcE8zM2dwVlJGQ2tDeU9CMnFvUnRXemQ5?=
 =?utf-8?B?eFNlQjZZZEtuUGFURFQ5cEEzcWxQM1hlVHdQWnZibnY5NlVRY3FoaFhZQ204?=
 =?utf-8?B?OUNuVk1oMWNCa2RvaXYxWThySWFnck1XeUlBTTdITmJiaENXSGxDclZ3SVMw?=
 =?utf-8?B?YWJqczZxd2pHZ29DamFLaWtTazIzZTZFU1QyRkw5bm84MnQvQkVJQkVsVFlR?=
 =?utf-8?B?bldzWDllcG42WGc2eDljZXlTRGZrNWE5cU1RUXF6Q2VvM0hZZVVZbE1yV05X?=
 =?utf-8?B?Wnk2WkQ3eU1UOUMvSElHUUFmeWtYcGpoL0NlWTFqZU9peUZqOG1lczRGUXFV?=
 =?utf-8?B?bk52cWFiK0U4VU0xdTZnN2dYYkFGNmJQOG55aGpMNE5Udkw0M3A0V1puckxJ?=
 =?utf-8?B?d0tIMUE3SXdHdGg0dmFXcnJEV25KSDJFMWM0VllxQUlqb3lyRmJqblRnU21O?=
 =?utf-8?B?K3J1dkVXNFFQdmxDV1IxSVJvT29vUkRVKzkwOFF5SjVZK1F2RDRSRGFETEpy?=
 =?utf-8?B?aUhPLzlJL3JzWWlHTmkzeFJkMXk3MjV5UExRUU9RTDN2czdlYnB3MGlPVmVj?=
 =?utf-8?B?M0Q2VzZOcUs2bWpoaEJub0RHY1NJazFRUHF5ZmtyekhzL1Y0eGR1eEVLM0tU?=
 =?utf-8?B?eDhKRlBId1JoLzl2dDVvaTZ0cFpPUUdManF1dXZ0N0g3R2NhaXJGekc2aEVy?=
 =?utf-8?B?OU1qeXV5RmxVcjdNOU5TQWIwZTNLRVdKVkV6bDdvWFJxNFF6ZEVCbG9TTmtG?=
 =?utf-8?B?b1NWNnZyYW9jejk0N3cwQ285Y0lFcXlMTGMrdVdZcC8xcHhZRG5SWkhjbllq?=
 =?utf-8?B?VWJpZjhFRENVMWFNRmJ3cGQvTHdZTVVQb3JhUlBnd0dFQ2VLRXM5dXR4eHZQ?=
 =?utf-8?Q?rZhJTHoE+F4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bExvUkxGYjJTcEdrMHJ3WTFQellRNEJGQi9KTUlmUzZ2dTdHRUZ3SVpWbUFK?=
 =?utf-8?B?M2pTMGxCZVlsemgyNXhUdGdkZDB4LzBnK0xEdFUzSWF2TEc1VUxrQjMxWHUr?=
 =?utf-8?B?aE16dC9uQjFQNTVPM1gzcnVOUE40aWI4a0YyNFdkTFlITk0xNThHRjdzaXRr?=
 =?utf-8?B?ZUFhMU9TdXJWZjNGL2tPaTJYRHFsMy9MZCtJYUM2enlNVnpjNXhlTmFiMFgr?=
 =?utf-8?B?bEFDU1FHNUhEb0JPVGlIaHZCN3M0LzAyWWZTMTYycGNHS1FmVFVZVjZTRE5n?=
 =?utf-8?B?aTFWQTh5K0tLampTL3QwMTRZK3k5TzcxWWpQektiWEpKcW1BalpqTkltVkZV?=
 =?utf-8?B?MG5keGNFZDludTRqT05qcE5YNkR6bGRXT2xTUlk1K25BUHVzZmlUNEZNTkFU?=
 =?utf-8?B?UkJ0RUJTWVJCQ3NlVDBxdXhzckwvVCtSMWUxVk1tbGZqaG1za3dnb1JwZ1Fo?=
 =?utf-8?B?a3FKQ3RQbG45U1U2MnAzWEwvM3g1UE9HMUszMElkWFRiaEtWTWZ5bFR4QjJn?=
 =?utf-8?B?bk5qWXRjdlM4SDFSQ0tVa2taUHBpc0c5NktvZEZzU2s5cTVFU1JKMitoTko3?=
 =?utf-8?B?UXlneFpHZG9RdHdoR1M1dUM3TEF6MUpOeSt1VndVR0hrdHIyOWZ1bjNESG1n?=
 =?utf-8?B?cXYxNm9mSjUrYTViVHVwSmlTUFF5Uk82OUF2RVFtYmQ1bFRFQ21JT2NiY3lZ?=
 =?utf-8?B?Qjd2ckpFaGtoK2dpTDVWUHIvVGV2YS9Hck5XUjlPWW83cUhpUGUzU0FqWm1n?=
 =?utf-8?B?Mk5mcXdhckhwWlJwK3lEdW9TcDFpN3hSWlVDcitzTStnTTBwUnBkODRDdlZZ?=
 =?utf-8?B?VXpaVis4MndmU216UlFuN1hOTjVhZUhWTkc1dUc4bXFOS01EK2xZYzBFQXhs?=
 =?utf-8?B?Ri9MQW56bEVYdXJNbVpuSmxOR2h0c1ZQOFU4QTdWc3RFSmhUaHZVdkV4TkFN?=
 =?utf-8?B?UTg5SjZmZjAyL2REYUpsRUtEdUxqdUREckxwYm52RytPSkhMaGo1elpabjZh?=
 =?utf-8?B?Yis3eTBRbHhlUnFib3FJaVJHUkFkY3ptR3AyYmtWcW9rU0RrL3JkTFB0bDJW?=
 =?utf-8?B?dGNwaklZMG91RjU2VzF2Wm5ENmdTQy95WjdKZ1lVakVOZ3cyMHlvVkIrcENv?=
 =?utf-8?B?dTgydzVRRGk1Tlg2dTU0MzRBcHNvclJYMEp2bm94Ti9Ua1lXU09ibSs0TTlI?=
 =?utf-8?B?VTIzNTZFbnA2M2hEMkl5eUttc3Bsd2VyZHJMNW11K2JkUkRab0NORXhjZWNU?=
 =?utf-8?B?ZUlWdEEyRFgwU0JhZEZmNU9ZaDRqNURUWUhMb2FkcTFqMkpyc1o5OXlXMmNZ?=
 =?utf-8?B?TEVBU1UwQ2xWQnNoZU1kdU5mV2liUGxEcG9hNi9TNVdCa3BMeWc3K2xRMWl4?=
 =?utf-8?B?aGZjM3MzTEM3WW9sZ0Qyemd0WjVIQmV3TG9SL2k5MHhLdVppNTdGUnVMZ0Nw?=
 =?utf-8?B?djJBMk01aTN5QUF5WUtxQy9WN2RvRVpxUkdSTFNoN2ZCbEdTQkJOdFBwcGN5?=
 =?utf-8?B?T3Z4ZjhlVkVTOUZWeVptREo2MjVyUnQ3WlZ2SnphUUFwRkYzdS9oRDdCcURk?=
 =?utf-8?B?U1YxRnUyMU1wajlyVHlEdDVnSkh5WlJ1b1RqVUloMWQxU3cvQkZoaHFCM0Qx?=
 =?utf-8?B?VWdQR3NIS0M3WlUySlRjNEhkZGJmRDdDcERIQTNQQVJqV1Y1RS9YU0ppRjZD?=
 =?utf-8?B?M0N3YXVCMlpQMmZZSDRWYSt1VkFlbE1Ta3ZZelQ4dTRHVnNRWnRvZDZXRnJw?=
 =?utf-8?B?MHc5RGY1cUo4bGNqcGZyQUtsTXNDdldtQXl3ZU9HR1lUWCtvUC9Ld05sWUxr?=
 =?utf-8?B?L1VwMXRsVTVJSSs4cGphRlhVdjMvRVYzQm9EU3I1bURhYWNVSTNxMVFYWSts?=
 =?utf-8?B?Uk5XRFV0djF0KzMrMFdnRkQ3S2tRam83M3RHSXFOaUliQ3FHT0xJYWFYOWZW?=
 =?utf-8?B?ZFcxdXFMVEl6cHQyYnd5V20zYlk5ckZuL3NEMWVSSE5saG9LMmRwSmQ2TzNZ?=
 =?utf-8?B?aXJqck5KZGZJa2NTejJoMGNPQ3JuekY3ZTg2WERac3ZuazlKZzlmUCthTEhQ?=
 =?utf-8?B?L3lPUWNRalh2S21OLzJXYzl6THBub1ViRUMvNXEwdmtoY1A2L1JJYmNEM3Fn?=
 =?utf-8?B?dlhUTE9hYzQ3QUpTY2xhWllBVW5yU0RGeFNYMUw0NDZCM1R0NG1SeXBYYkdX?=
 =?utf-8?Q?phu1cBOUFmE1OCeuqgI1j1Sj1UsItCeoLzv7P04sNrUi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15472ef-3168-4194-221b-08ddac1342ce
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 13:48:08.2726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmu2+rk1nr9d/ATgW4uCM4olObZvm5U3KzcpFXMLQAD813bgk2157DWodtj8Lsz1he9Cb1fXl0ixwveZbqxoIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9424

On Sun Jun 15, 2025 at 10:15 PM JST, Miguel Ojeda wrote:
> On Sun, Jun 15, 2025 at 2:37=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> +/// // Borrowed from `str_data`.
>> +/// let foo_borrowed =3D Foo(unsafe { CStr::from_bytes_with_nul_uncheck=
ed_mut(&mut str_data) });
>
> We will need a `// SAFETY:` comment -- Clippy should complain.

I thought I could get away with it since it is in a test, and clippy
does not seem to complain about it, but...

>
> Or to add a safe `from_bytes_with_nul_mut`, I guess.

... as penance (and for symmetry with `from_bytes_with_nul`), let me
implement that so we don't need a safety block at all. :)

