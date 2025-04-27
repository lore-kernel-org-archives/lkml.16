Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F3E1E4929;
	Sun, 27 Apr 2025 22:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745794798; cv=fail; b=FyAcgLZ5kybw+fnnqw13tavETCwD2SsFp3L3rPWuIVgOpt3F4KPF81gH3ZyFyFL4qMSr/9llxYS7Tl8fXzpIVIdg8ycKTkrFJMJGd7XB1wzYJ6pcycc91kruC49Q8bjhUcNKTjsDh23BgBxxTNZTOsXVojEkeeP8ykJdHBZXmIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745794798; c=relaxed/simple;
	bh=scAlPyEM8oDWajQihia1R5kwNbBGVgk2Yb5DJLR/YGw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nsrIN4LEj0nLYeyuaKdngQw3p3XjFZRoKMLVe47Mbor4gyfblS9/l1IhgYDWj8FkdQAQOw/dcTMy8mqrp+SjPXEjq0E8iqXkkB8zcTa3zfKMaVNtSpLnzKcPLjPivYd9/+jpndoC6PxuepPgr2yhDzrDOXOb/YQ4yzLxMbXLYCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZP9r/CMv; arc=fail smtp.client-ip=40.107.244.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZP9r/CMv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjKtbH9SEaVVbmoXSyAcy8SFXdK5hlOzReFQoFXlxoIVBJp7sqAq427Kc8qBuiIU/bbImqY9BJ9jg60myJmQ/NZ90kVQjtMVDBBrNISOpZvVTLj3Es9CyFf3m2ir9sgKJXF9SC1pRXdRWtevWOEYkKLMupyUce/NW90I2QlcHCatxbhmyT+0Xghu06POAZ9BlGG7ttdLIGiNl7YKBwfDc+jdjYIpxLRQiGixuH8FqU3K3IBGtNS0ySciZ95Z+cjFpDxuyAhx2gSd4+1JgkiOuDkrFLWeStF9Y2boMVMMx1AGijKjAD3Wiizak+UziZTzwFQi5bT5JbS+VGrVW7TNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W95S9gdjHtdR0QKsf+baBIJ5t/zYp+BgfGmnbYAXqJ4=;
 b=ZtkXylwIAnp9LYqgDmA/yAlLFGLphpdxbFb5cp5PkixkyagffBddx//FtVzIZPgHXo+avty88hyCBQLlzM+GnZSF0waxI/co36iLSag0kUH1dhKOiyXkqnr6199ookdALhvyfZaR831Ff2F7wFE41PKnQzA0RCv584QgeYEMoShONU3Yhg0rxTkU28rxZQECyz4bpgbygdUlEmi+X4zsQBKVg8ZxXkwgwa/bGG+4GC6mBdQEutTT/wpHoULAO+/5IlzMYEmH452LDl27WsN9HT8qgKBMrufpKLV1XuAgR2EFQ4AegKf7ia3bcjV8f1ZzCYJd6VxZGV3xbHBxWgTUpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W95S9gdjHtdR0QKsf+baBIJ5t/zYp+BgfGmnbYAXqJ4=;
 b=ZP9r/CMv+AO+07BUK5oxCAfGbRP/DAq5GE00bFJzhpXFcgCtmVT3UVvG/Le00GYbZBzy7liw3P91PTk+elPOrygEjkvp7v1jSnOPgOMLod5iGv4h7QvP8MODO9Q0bWUwamO8mcrJjnFfTlgE8NnGN5BUpe0n7GG3aJW2T1MZ/TtPPBMAkoaGJ1bS+WnRzKja4Nfmu+hwRN+FxBSzKzmh+F5lNN1Hu9cxTKt/Cgte3vKsRVTuOKAyNlr/ne1F2U1Q9xiCp23Z4zi7zrWKuq0hFIGsFVvtYCvh47djUSnGy4ZUYbpKaZc28WbdYUkxUEiMkTx2lpG7ngHqPAcTGYR7gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by SJ2PR12MB8829.namprd12.prod.outlook.com (2603:10b6:a03:4d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sun, 27 Apr
 2025 22:59:52 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%7]) with mapi id 15.20.8678.025; Sun, 27 Apr 2025
 22:59:51 +0000
Message-ID: <34457c78-fdcd-4f1b-a349-4ca9bcc2febc@nvidia.com>
Date: Sun, 27 Apr 2025 15:59:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: check type of `$ptr` in `container_of!`
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0035.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::48) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|SJ2PR12MB8829:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c93220-6e78-467b-7484-08dd85df37b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1UybU5ja2U0c2ZBcjdxRmplT3h6UDREWk9BZktoTC9VQk5SNU40Y3pLczho?=
 =?utf-8?B?clN2ZWlraHg4NFBTWEpNZVYrb0N6K0RIYVMyZXBhTWw0R2lMaXV2ZGp1Y0g0?=
 =?utf-8?B?elQ4cnQxV1l2clhpOTcrS0VUSFBOWnJPVXhCRWlGZlF2VTgxcWxEL3IyaW5j?=
 =?utf-8?B?OEUrTkpsRm50bVVJZ1lOUFpvamVtUUlWYkJKQTJwWnBsTCtoS2RWeWFPNzdt?=
 =?utf-8?B?a0ZGdWtmRytXelJ5UHFVV3p1VXVua3lTZlhOaWJmWkk2aDFTMUUzMHA5UXdh?=
 =?utf-8?B?VXpmOVhBWHlJWHVVd01TUmZNNmVrR0QvR1ptZGRPRUhRaG1zck51blFXNzhE?=
 =?utf-8?B?YmorOGVsdlV6M2g1Y3pCcjd1WFI5STdwTDJ4UUFHYy80SC9kQkQwUXpGMEt1?=
 =?utf-8?B?blFZTS9mYXJPN29QeDF5cU5PditEZGRKemVOK1UxbzNVbVJsMWJlWUFLNzJq?=
 =?utf-8?B?UEJkY0F5Z1MydG40Zkd0VElHdzRxSVhMWTZqTk1LZEE4dlkvaHk4Snl5NkZv?=
 =?utf-8?B?TldYeUJScGlwYkUvNHNOejR5U0tPb3kvUE94dk5wckd4R2tXYnRteVFaS1Ft?=
 =?utf-8?B?MnBPeEExQmpaZEVYZzlxakh4OGY0S0czYWl0cno0bVNFU3crN0xUZ3FHN0xV?=
 =?utf-8?B?dG5KSCtlODJiVXExcnkzWWJKeTVXTGRGTDA0dy9ZVWVkZmMxQmtrUWdZTktS?=
 =?utf-8?B?TGY0bkU3N2pCWUx1NjZFOFUxNXZNek9sRTRucHovVXZRUUVXc05rQ1lxTW16?=
 =?utf-8?B?SENhWnBPM05VbWtOZStyYkVHZUpRTWo4SHNNWnA3NW9hQWNPeGUvck5TakxL?=
 =?utf-8?B?RlFFYytmNFNYZ0VZNTJjTTEwUjBuMEprOVordFFWUGIwSUhuTG96emdSVmZE?=
 =?utf-8?B?ZTdheTB1VTBVU2puTVpuQUh2OGJCSE5ncTVpUVpreDFVTHkxWndDalZjNmRV?=
 =?utf-8?B?ak9OSlZuUlp1ZG1SZEVvR0pJaWg5a0ZLTGY0a1I1dktIOUZHZHBIQU5xTkZ2?=
 =?utf-8?B?eU1jL3VrZUZ3M3k0QWF6YUw5N1FjbUtpRzZXZi9yaHJVdS9rdnZWcC9oTWtr?=
 =?utf-8?B?aVhuQmpWSEI5azRkTXB4cUtjRFF3L2dHZUN1U1cwSG5xaHMyNVpZRkc1azkz?=
 =?utf-8?B?eVExWTY1VExISFFGbWUzZFRxMThlTmt2OFlValo4T2d0bXNjeWZTaTJhQXgv?=
 =?utf-8?B?Q09CTGpxRCtFdytKZkV1ZUQ3V25nSlFWTUplOXV4K1ArVzJwbVM2YUYwOVUv?=
 =?utf-8?B?T29QdHlqY1RWRzJpemZwMUlndEtNc2pYdHA1ejZNZ3MyZ0NnYWJSUVF6c3My?=
 =?utf-8?B?c2J2Y0dmS2tPWTVNMHBkdTRyQnV1aTRtMmI4MXhKdzkxOVg2blBzeXVNRmgy?=
 =?utf-8?B?MmVqbU4rc25PdTNlNUZRS0hyTjl2aHNFeW1HMEVUNjhRZ2FwYlRxVjc5Zm9X?=
 =?utf-8?B?NjFTM1U3SDNTQnY5VXpNZTJKN1hNczc1T1R6a0ozUm9oem9aSG5IZUZWMWxa?=
 =?utf-8?B?ZnFtc3BSQ3U1K0djMytXaEFBMWlkajlxZUZGa2Fja2lRelA4Y2swV1cxcGsz?=
 =?utf-8?B?dWVScTN0eWg4V2srTVBRSmtYNjNoZmVoSGo2azVIa3VobkR1bEhmSkp0QjVP?=
 =?utf-8?B?QXE3TEIzaENKL1FsVFFjeGhBODVUWSs2d0V6VHJjUnF2TGVrNVpEekxpbWFh?=
 =?utf-8?B?Q1FVYzhQUlh3bFlvVWtkMU9FOUJiQlBpRUV0TlRuOVRvZThYZkJLS1ZHYjdG?=
 =?utf-8?B?T2JqQzhybXE0RHdxbEwrNVY2UzdSaDRkVHZqbWtQU1UrUjh6TGNXdXdjanVa?=
 =?utf-8?B?cDVvSG9hckNoQkVhVFhITnFnbjV5QWhTUG8wdytVZmRBRk1Bc2V6bnFDSDdl?=
 =?utf-8?B?bWFML0ExQVZxaUg4MTRTck00bHZjYUU4eHV2UVpRaVMrSS9VWlY0a0MzUm94?=
 =?utf-8?B?RHEwbWxTSW0xR2dGL3JiaEtVOHd1Y25ZQ1hhdjN2cmVGcnFXZzF0VVlVSWND?=
 =?utf-8?B?ZE5ZTjU1eTdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDFVRE1KdjVLeDVDakd1MG9yN04wYWRGUThETUpUL0wzVFJ6WjNjV05Ib2lj?=
 =?utf-8?B?T2FHc05NY1dZZGNOaUJLOGRKU2FjanV0QzNPNG0vZjVwRDYxZDJHRUc4R2tG?=
 =?utf-8?B?UHBNZlFqYy9wK1dub0xCZDVvaHVFc0RBZmZXNXJSZzhjd212T0p3eHVLUThN?=
 =?utf-8?B?MXpqeXNCLzcxb0xSR25RQk9oNloxMWpMNmQ2WWdlaHhQYjVXWFVtMnB3NWdk?=
 =?utf-8?B?ckxnSnBEZTFJQ1oxczdQZ2hjWUFheU9ZU3IvcTlrUnBoZStsNndDZnUxRkxC?=
 =?utf-8?B?YkVZZFkrTUlsNXdYS3RiTURyZEo0R2Z0Q2RMNWZDT0sxOU5hdUxzdm9QdnB2?=
 =?utf-8?B?dVJGVmx1amhXd25BNmlwTTBvK3VFZ0tjZWp6MXRYSjg5MFMycWZoRnVoT3pD?=
 =?utf-8?B?RkdVUm9wSzBGZ3ZlTmhYWkR4N1ArRVZrTkFPQmJWYnFpcmNOUjNBN2ZBcW1h?=
 =?utf-8?B?SG9hMndwWlFMRnZqM3FQRlFRNUE4VllIMkpxZ2ZsZzRlWHBQSjVvcGw2RFdj?=
 =?utf-8?B?bGFCa2FCZjNFMGFMTWVtdVVoYytodkI4L2lPWENrY0xpc2NBMUxCSDJsc3Yw?=
 =?utf-8?B?dUlqdFk3c3hsdUxUdlVuMHpJYmZiWFNjLzJhWjhWdGI3N1RmeGZUUklFQ01P?=
 =?utf-8?B?VVYyMW1ORnlDS1pOSGpSazdVczRaakdqdGVvOTBQak10MkRFQjEvRmVsU3pL?=
 =?utf-8?B?U3N0RDhPRnpxeUc2NUVacURsV3lzOWJ6TE80YjJUbjVneDVVR3l1RXZzejhP?=
 =?utf-8?B?Rk55MVB3K1RGM3p6NjI0MGh4M0QydHFOZWd5MlkxVk1mNStOVTVzZzR6aEF3?=
 =?utf-8?B?VndIU2J1d0h0Y3Zad09jWHdrMnJjd2RjNDZ5cElJOFRjY3BKY1NVamNqZzN2?=
 =?utf-8?B?RThDbnZ4RlJaYzZHeStiNldzMU1ZM09SS0Qwb210TlZqUUJMR3IwUmpOQ2FK?=
 =?utf-8?B?K0lGVVJyWU43OXZZZ203NXRxakhJeHFpa0lUYTQ2SlY5YmcwNkRXNXhUbEZX?=
 =?utf-8?B?U3lpNUpuZTNjV1ErTU91eTlsdmo3OC96N2tlaVN3aXdELzVLQWRZTVpQVkpX?=
 =?utf-8?B?SlBLUWZtd2ZwS3dvNlFyemF6R255RzJPYmF1VHdzUlM3WXNWWGNZZmxFUStx?=
 =?utf-8?B?ZzUxUUdnWTQ1RFZrT1VaNEZJbFNzS3VNMEFTOGNGNnJjeGk4cWNwSGt6b09u?=
 =?utf-8?B?L0FIUGhaQm9LSWFHaFd4RDhzQmovQ2RBQkZWQVJDN3VYVEhnUnUyaFdXcVZZ?=
 =?utf-8?B?K3ZNdXJpOXRWV2pUUjhhSEZ6NTd6VTRvWndUajV4c2ljNmFRdjJmQ1dMNzZY?=
 =?utf-8?B?dVkxMDZvLzN5Q3hhbzdNM0NmVmsxWDRHSkwzV1p3YjZTTzVyNzQ0Q0ZjbTl2?=
 =?utf-8?B?bHpyS09veFhyYXNoWHNKSDZJVS9td2xnemVJR2FqTENIcUNUZFpTWFVkU1dI?=
 =?utf-8?B?NHI5NTY1NzUvOHpLNWUwWVR1MGVpaTI0Z0JnT2FOTEo2MG8vejdIc1ppeGY0?=
 =?utf-8?B?QkdHQ3RKd0IwOXRkSjNrbCs3MVJGUkJXZUhNbVM5TjM5L1JtUjFhOHRad3hB?=
 =?utf-8?B?djc0ckNlZTcxSENGMUszZWZPODF5cW1xeENPOE9WQ2hkRUZUUVRDQ1lENWNM?=
 =?utf-8?B?N0FTaGUybjNheFYxQWg5WHFlMG1aYkFqcmloWDRkT0xZOS9QTlVQVWQ5emFU?=
 =?utf-8?B?enk2c3JYMDVOQzUvRDNXWkhKSkhHUHc2WTArU2VhMG52eDZWT1FWODdVWWgv?=
 =?utf-8?B?a2pUTzhheDhESDZaVkNzZnFZVzh3NnYzZStFanlHbkRFQzJMSUxDbVp5bjZJ?=
 =?utf-8?B?K2hCbnpaT0I5clhPTzF0ZzdMN2ZsdzA3bm9XMHZUTmovdzVGblBTZElWeWpw?=
 =?utf-8?B?NXBKeHErWFlLVVdpYXhlajM3NFhUZjlFa3hyLzIyYmhtVDRuclluVTdLS2ZJ?=
 =?utf-8?B?K0NYL2ZmSWorVWZZaTBiSzI3emJtdGpyRXRwWi95VmxqMGJObnNuWXlUQUZJ?=
 =?utf-8?B?VTNkQUhtWUNaUXVWVXJXT0toUm1UWElUMzUwRjgweEtPM2l1MHdzZ2VuSlE2?=
 =?utf-8?B?Y0RiVFJMcUpzNXVEVm1VeUJXVmV2UjBodlY5dUFnbDFreWxpRWN0UVBYT2lU?=
 =?utf-8?B?TTBKS0lOUThnS1hJM2dvSXhwdmhQMzVNVUVZZ0Y4OG45V2Z5MWRXUDZud1hl?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c93220-6e78-467b-7484-08dd85df37b2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 22:59:51.6739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yP3qbXKfZ20b5RqbTTiF/vITDpxho2ZRofpNHyyWYWxdPe7lOQufE3C/zqtiUbibHcW59hD1X85YdJxTUg8Wgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8829

On 4/23/25 10:40 AM, Tamir Duberstein wrote:
...
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 1df11156302a..d14ed86efb68 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -198,9 +198,15 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>   /// ```
>   #[macro_export]
>   macro_rules! container_of {
> -    ($ptr:expr, $type:ty, $($f:tt)*) => {{
> -        let offset: usize = ::core::mem::offset_of!($type, $($f)*);
> -        $ptr.byte_sub(offset).cast::<$type>()
> +    ($field_ptr:expr, $Container:ty, $($fields:tt)*) => {{
> +        let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
> +        let field_ptr = $field_ptr;
> +        let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
> +        if false {

This jumped out at me. It's something that I'd like to recommend NOT
doing, here or anywhere else, because:

     a) Anything of the form "if false" will get removed by any compiler
        worthy of the name, especially in kernel builds.

     b) It is a "magic trick", in that the code is on the face of it,
     unnecessary. So that's not something that you would pick as your
     first choice anyway. But as I see now that Miguel has also pointed
     out, the -O2 optimization level that we build at makes it either
     unreliable or broken, so it's Bad Magic. :)

Anyway, I don't know where this pattern came from, but it's not a good
one for kernel builds.


thanks,
-- 
John Hubbard

