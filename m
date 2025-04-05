Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9C41EF368;
	Sat,  5 Apr 2025 13:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743861118; cv=fail; b=exokUngy1q/U3rf+sGmQB66nibSwfgT3qZX1A/5NYp9u9Ob+csjjxtOkSE1bFIx9Df2kQ7qFAtoxCGaU1MlBz+mKXpdU29RC0/bfO2MCmMXkDrn9fOUgqgizCD0V+CtsyOvPlSLMpkpmTgWSa9nw4SE9/JyCxGMmiFDPVHd5i2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743861118; c=relaxed/simple;
	bh=JzvHnzuWq1nDj3BulFDw+Prd5a7x9utY2TicfY8KzIs=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=G9xgJFOmrDnCic9LOBtWKd+/tCSa9qE+v+tsmpLQEi1hvVUir5PwJYJOA5glmaIU9BaJ+dSyD9Icf3qH4Pt/ndqXUFdzhYtUgaj5IE3EkC9zS8MQ/juMVWCMQ5/76iSoGI/yCapBYVKI9pFTcjhfL45HtQSD5DsX87KmpZ4gdxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cRhsPhLB; arc=fail smtp.client-ip=40.107.100.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cRhsPhLB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqwBQ2L2WtuZOpYUzgjKxIKrOae6koKWfiAn8LgtGNMxB050PznCXk6Vi1NHoMG9VRcupeMbzx7WLnaUfLgwOJ9Xod22wUO+CsIavwGAykgtIv5CpYE6JxhC0FNOBAZHknIf4gpTEZKobTLvz2fPQTVGisraMCJKr5MlsmtOD4aJuugI+cVZeWZqc+SXDCcVcxkbCAx4exIuOmPkPdBOqmjItkGZzo2Q4/gZu3d2RULmksVCv6A5cHvm2X5woU9hhCDvVjW7IbXVZM/DufoHcHNxfFPwhz6MWVOLDgDNMvkeOFDfdPR04dRhgg/gCZEhcTpzU1VcDsQiuRvKbtAFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J325D55wJ2oz6tOjRnJLnK0McN0cM5DUp8vwdMGkL44=;
 b=XYCWFnE9XAVHHHnOdY4rNKzqFzRSucjzayRIIFws5CbSSZiDbNhQ49XRCdGwu9AJ90f6xIi13BiWf5O2a/xPX/pusOgYWDBJgrvXgyDfqB9c4lnvvm7ey12uwwT+LeAgEylpppOp38uFzHdHFSvjjV91d1hNn+OOlmLhqL+C0UoIVZpZrNfgpNy0zzCqRJHNVWcsyx/dlBkhqbyLq5wa1s6R4za3Lcr5l/Ic4aCBdjp+ws4bifw2G+WhMSjNYZreNQyFuz8YLx78xdyE4F3Hxik2IV91oF4lhyGwWBYhGO9f4+YIOaaVCVqaShEU7MQdRXenLkv8HIJq+Xz1JEsiug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J325D55wJ2oz6tOjRnJLnK0McN0cM5DUp8vwdMGkL44=;
 b=cRhsPhLBmxTfO0+l3BKl44bTe6XcgBCbsBk5TpneANlUlBNH9yYAltmHZWVn/tJ/QjGlzKLsxQ6tzDxcnS4LofRp1BCS0jCc5cyIQ8EGbaZIZP4+RhupvdiAY+cbnLiSJy+WLrHPlS/THeHyYdpm+uz0LRQEe7Aoa9J9SK2wFv60/cAFeFwexSKtXV3HqLyO0yauRenJO3F9kK29izo7bLXc1RvmxGbmDFmoRiEWA8m1Y/c25nQBxa/LChlWwaB7B1JhZiPNvTKli7eOeujq15Dv46RhG3RQtmCHw+wnrbByFGNkkSJa4Xo8O1/x8cDqj3WvBCL2C31p6UZ9EoNS5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6496.namprd12.prod.outlook.com (2603:10b6:8:bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Sat, 5 Apr
 2025 13:51:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8606.027; Sat, 5 Apr 2025
 13:51:53 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 05 Apr 2025 22:51:41 +0900
Subject: [PATCH v2] rust: alloc: implement `extend` for `Vec`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250405-vec_extend-v2-1-e4a85af43cb3@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAGw18WcC/22NQQ7CIBBFr9LMWgyDkEZX3sM0hsJoZyFVQFLT9
 O5iXbhx+V7y358hUWRKcGhmiFQ48RgqqE0DbrDhSoJ9ZVBSGamlEYXcmaZMwQu9U6gMWucUQh3
 cI114WmOn7suRHs/azD85cMpjfK2HBT/2b7ugQNH3rcd9r1vr3TEU9my3brxBtyzLG7JDscC6A
 AAA
X-Change-ID: 20250405-vec_extend-4321251acc21
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OS3P286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f5::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 8582810e-6654-46b3-989d-08dd744905ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTM4Ukp3SzN4L3VnbW42bEpjQVdVWWpraGVzQ3pXblYxY2Zia210V1lNcDBI?=
 =?utf-8?B?OGYzTDJldXdkMWNETzhMalZpU2xKL1BPdk4xQVNxQ0NnaWN3STkwTkU1eUY2?=
 =?utf-8?B?MDJJczFOd2phbFV2QnduWUdUUWswQU0rbU55UHRNT0JlOTFGOWRmWFUvZCtq?=
 =?utf-8?B?aTg2ZC9DQzRUeG45RklkaHc5cmhVeUpTcVlMV0JXS3Y1aXNNdWlLa2ZsMlFU?=
 =?utf-8?B?YjF4MEZWM2NvY0xIaVJWOUduQ0JIS00wUHZYL2hoMTRNeGVFVEI3MFNvL3Jr?=
 =?utf-8?B?QVJkd0k4bnNUTjk1QWFwYW13T1hIcVFvRUdqMjZ5aWlJZ2xZdjFtZzFTcm03?=
 =?utf-8?B?WEUvZUluMjRwck94eFpLWkV1bVRuYzRydXB5VVJ0KzRhcko4dmh4TVI2ajNH?=
 =?utf-8?B?Sm9seW90V1owYzdDc0s5QnhCRzAxUFdyaFJMWVRJeDdlbDcrVU00aUlGaFp5?=
 =?utf-8?B?UUlIYmpZa2lFNDZseU1obXRMb2FzMGZpV084YmM0MklwL05hOFNGa3pmRUxm?=
 =?utf-8?B?WjBYbU1keUVCbStXd0lwYUlMRG5xUUl1SlNYYlpMU0QweGljUDN4MzdoSXQ3?=
 =?utf-8?B?NFRtTjQ0MlV5eU5xSmtOcHY1OWZTdlVYTllEVVdKaGw3bXJFdE9FU21kV2FM?=
 =?utf-8?B?dERoWllWWU5CSXh1TGJ6VmxpeUtRN2w3L2xsZk5kMEp3SmI5M2U0cEtJa3Iw?=
 =?utf-8?B?MExHTzlOZWtueWEwdWY0L0RveHZabTNMekpRV2dLcWFSUzc3WGxtT3ErdzUy?=
 =?utf-8?B?RHp3OURkMXo4Z29uWUVjTUpiQm1sTEx3YUZSL0JpMUsrNGtpTmswNlFtRU83?=
 =?utf-8?B?N3BGRU55VG5RaWsrSGtScFh2R05McVFJNG1ZZVd1ZFFhcWZxN1ZxeFM2Q242?=
 =?utf-8?B?NFUvRFZvNlI1dVVYdjdFWU5ZS0ViZFhINm5BL1lZUTl0OTN6ekJGYnQ2YVY3?=
 =?utf-8?B?R0hlNWZWdkxtaXJTaGlDbmNnS09WaHRhQXBPRWJWYUNMYUhWcy8zb3VySFho?=
 =?utf-8?B?Z0Z0QnJyWFZ5dVp5ZXhLSEI2T3pXZGgwVk5oQ0dreXprNUdsZ01MYU5BRzN6?=
 =?utf-8?B?dUgwSG1uRFhPemJBVTFNZ3E0eExMcWs1MTF4NEk5Nk9ZTFUrUmFCUUJPbDEy?=
 =?utf-8?B?Rk5EbGl6UENESWN2VVNtbHFIR29XQkJuRnh6U3ZBTGhTWDhmcyt1WHgwSDd6?=
 =?utf-8?B?NWFQYUpDZ1N4SzFINzdkZk15MTdnNFVaU0NNdGUvNmQ4WVlJQ3pKN05wWDNu?=
 =?utf-8?B?OG5wV3JEenBIUktBd0NkVzZsMlAveC8zdnBBWHB3bXVTQ2dzakdHS1VRVzRQ?=
 =?utf-8?B?TlBTaGJXYkZrT09vQU5kNnJCUTVhODJvWElMaEdsbURTcWwvbktGU0ZWRnZH?=
 =?utf-8?B?MmlGTUZUYXpZMVpXWTJzK2RiRytSVHk5QUFXTFVjMzZuTVY4K1VlRGV5UkZq?=
 =?utf-8?B?S3hPemRSRHNsQTBlc3YzcHBQdVRydlNqZS9BZkRrd3M2QktuY1RWN3pmZ1c1?=
 =?utf-8?B?K2Ywak5qS3VrYi8rV09MZ0twbW9nM0hjWURsNklNZk41bVRZdEpHRlFVc2xS?=
 =?utf-8?B?bS9tM0FySWZ0bXdWVHQydXp0RDVqbTB6eFpBdmtSZ2ZpUndnNk52U1QwNzk1?=
 =?utf-8?B?eFRZN2YzT1BTQVk2SGNYRjhGb2NpQlptRDNWaW8veHZ5RUJZUHlJaFptbU9K?=
 =?utf-8?B?K3QrOWh5UG04SWVHUDNpUi9YM2ZibURsTUV3bUFVcWFTdTQ1MmdVVEdZc0pv?=
 =?utf-8?B?d3NHK01lNHQ5YmlLSW5tRjF0WVczOUUvR0hrVWVUWjlQeDN0NzJqYm5BSits?=
 =?utf-8?B?L0h2aUUvSWVWemo5TnJyMUxLTE16T3BQK3BVS084aFlrTHNiZFc3V2p3Q2FR?=
 =?utf-8?B?QytNSk0yT0JLTjc3WCtTamt4ZTdpOVVJdmMrSEloZDJ3QVNpY0p1SzhDYTJC?=
 =?utf-8?Q?QfmkWKlX1uU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YllvcXVMbzFLN0J3ZklmZHdiQmhUdi9PRWw0eGhSSEJzTURGSy9hOVVJb0RQ?=
 =?utf-8?B?UzdUWHYvU3hvc3R2QkQzNmJkR3FxUG9mTzJoSmJ3U1cwWUpJWk1zQVQyYUQw?=
 =?utf-8?B?ajZMamNNZ0lJVi9selZ5UDBDYjBERU56cWowN0ZtMjY2SUYrMjlZenNkZjBz?=
 =?utf-8?B?QThYd1BSY05xUW50a0JacFBwdENUL2c5VkRqMTZJRkNPUmdpMTRKMDluOUll?=
 =?utf-8?B?Z1Z4V1V2TjhpWjRCK1RJb3ZJd3dPU1FCZGpLQ3hMelNXMThRb3ptZXpuMlVk?=
 =?utf-8?B?TW5wM2RVT0NOSEw0MnRCNk9aZ0lPNnA5Y0JkamxCWlA2UkF3RXVFdWMxdkdJ?=
 =?utf-8?B?b29FR0UxUVRjUHlESVlmZDZNYlVtcjJYN0czdE05UGZCd2g2dFJsR3ZuMUxD?=
 =?utf-8?B?VkVMWEJDUXA4dUlIZ0ErMzB6SlhxMXlaRnllQnZDNHc4UENHaEdzb0FkbU5K?=
 =?utf-8?B?K3lNR1VrWjJ6aVpBWWRNS0szMWFMbE1yRDRmdFdUbSs2NDJJVzEyaW5TSVN2?=
 =?utf-8?B?VW5tNHVYelBicjdQc012NEJDNm9BVzNhdURYQ1QzVEg0YjRwcFAvK3VMSU1M?=
 =?utf-8?B?ZnJNd0xqTjFWVmpVbkRZWFNXWUVhZFhHZVdDa2w2STg1NnlpbzdZaFpUZkRs?=
 =?utf-8?B?d1cvT0xiOHBQZC82N0NSL3FVNGF6ZVdUVUlwbG1DOThlMElVanBMZndtSmNT?=
 =?utf-8?B?dGpLSFNoQlczV1ZpblY2RHArd0lVQ3VHQ2xTWllwU2ZuS3hzdTdKWDVrdGJh?=
 =?utf-8?B?Rm9yd3VHN1JGaHdCUm52a2ZMSnZuR1B2eWlRMVJJaTlQSHhvS0lKSDNUYWpJ?=
 =?utf-8?B?Mk5wVGZhQnB2cjBSUG03VUlIUWpJcTRUZDc3dmpYUlNaV2h2eU9QajNRelAr?=
 =?utf-8?B?M2Z0NXE4T1FobmhZT20wZU9qcUh3RnpqQmg0cCtxdTdJd2RlbU9OTW1PWCtH?=
 =?utf-8?B?WXZ6MUpKbSszc3BwaTZQMUZGTk5yOE5QN3lLZ3UrSVROL09OQ3kralpnNDVw?=
 =?utf-8?B?TExSNUNDL2VuK1htNzFFVjJvNDVseEdMTHFNU3VPdXo3eHJQME8rVGNRSFl1?=
 =?utf-8?B?bExjSlh0YkdyRVQyU01kdjEwY0RraXBzQXJSRXRWMXBXbzRsbXkvL2RUZVY3?=
 =?utf-8?B?SHcyTlBsNmtCblFsS0k1TkVIdVFBa0ZnWEtRRFVFd25uZmdkeFl1NkJKNXF5?=
 =?utf-8?B?OFk1VnVJdGc4aTJmMjg3dGJuU0JneUdNZTRYbUFiTDBwRnFSd3ptd2pVd0dt?=
 =?utf-8?B?NSttZjQwT0dYa0ZuWGdpamFiOTFIUGZ2R2tZUjhGaWwyeDR5WTFIYmEvbnlN?=
 =?utf-8?B?ZFE3ekRmWUEvcWloQ1hrdGQwcmZsWEdYbXJsc1hsMkJ6M2w4b0FGbmU2UHMy?=
 =?utf-8?B?TnpSZUY1MFlCemZlSmJCRWdCRWNwUmg4QW9yT3Y0eit4azZENkJMdldGY3h1?=
 =?utf-8?B?dWR5Q1gySndDVUN1Zmo2Vm1oZmRzVlJBK2lLUTQxd3QvY29kZDl4U2NpWXFy?=
 =?utf-8?B?K1ZoTWVxbDd0UE1nZy9LamhQeEFSOVQvbTk0bnZFcnBHN2JYTXV4Yk5zNE9C?=
 =?utf-8?B?cFVzeU5qb1Y4QmhBL3ZqZXFHanpEbGk2MDZBanJMa0d0SncwTE0vU1FHSDV4?=
 =?utf-8?B?N1pYaGNwVnQvdnRkaVJFU0V1aFQyamM1NlF5TnRYTG05QlZmMTlNRFdJWUZl?=
 =?utf-8?B?S1d6cGdJQklFTmxSZk43N1NsdG1raDJGenRFNUtqcll0VGpDVWFCckZzY09m?=
 =?utf-8?B?cEVibkZ1N2xIUWQ2eVp2R0hLZWFHbXBRaFdLVVBYWW1JTWJINHJ6YUYzQThs?=
 =?utf-8?B?SUsvUzFiWDZxMHVCbHhzVXZySWZqWkY1V1crWmRYZTZXWlIrdFV6QWhHYUs0?=
 =?utf-8?B?Z0ZXOHo1M291WENOK2ZoWU1mS0NrRlB4aXJQL2tlNDk2Q3h0SWJseHlaQ1Q3?=
 =?utf-8?B?OW9hL3lEVzdlYzNtTWtKWm5zZGNwUDRKYmg3eURlU09GREsrNzd0bDFaSWRO?=
 =?utf-8?B?WW0wQ2dEMEt3RTZyb0krZW0vakwzMFBlSERVenh3bmJ4TEZzdmpvMlpYYXo3?=
 =?utf-8?B?c3Y3MDFhZFQ3ZVZ0d2xIenh3dE45WTh0UzZsVk5YT25UcmpQWHdmR2xNWm9k?=
 =?utf-8?B?bjdRek0rWjZzSld6UkRQdUpVMTFya3M3a0VUditkQXpuV0NRZWFQRjg3SG8r?=
 =?utf-8?Q?wUhdICeoqMP4606kbvUWISorB82p7dK7+Hy2poTTqRt2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8582810e-6654-46b3-989d-08dd744905ed
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2025 13:51:53.8734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jw5KFp2XtfezydEpx7pDObt/o+n6ZYIriWadcpaHkqkaWrv8n+3WesIyZXKLl5TReNSRG/smno3Vgzo/rKwcTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6496

KVec currently has `extend_with` and `extend_from_slice` methods, but no
way extend a vector from a regular iterator as provided by the `Extend`
trait.

Due to the need to provide the GFP flags, `Extend` cannot be implemented
directly, so simply define a homonymous method that takes an extra
`flags` argument.

The aforementioned `extend_with` and `extend_from_slice` can then be
reimplemented as direct invocations of this new method - maybe they can
eventually be removed.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
I was a bit surprised to find no equivalent of the `Extend` trait for
KVec, and while I anticipate to be told the reason for this, I also
didn't hit any hard wall trying to come with my own implementation so
here it is.

I expect the new `extend_with` and `extend_from_slice` to be optimized
into something close to their previous implementations, but am not sure
how I can simply verify that this is the case - any hint would be
appreciated!
---
Changes in v2:
- Changed the diff algorithm to histogram for a more readable patch.
---
 rust/kernel/alloc/kvec.rs | 89 +++++++++++++++++++++++++++++------------------
 1 file changed, 56 insertions(+), 33 deletions(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ae9d072741cedbb34bed0be0c20cc75472aa53be..e78cb5ee575ce01e44283f8b4905689fb1e96165 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -454,30 +454,64 @@ pub fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocEr
     }
 }
 
+impl<T, A: Allocator> Vec<T, A> {
+    /// Extends the vector by the elements of `iter`.
+    ///
+    /// This uses [`Iterator::size_hint`] to optimize reallocation of memory, but will work even
+    /// with imprecise implementations - albeit with potentially more memory reallocations.
+    ///
+    /// In the kernel most iterators are expected to have a precise `size_hint` implementation, so
+    /// this should nicely optimize out in most cases.
+    pub fn extend<I>(&mut self, iter: I, flags: Flags) -> Result<(), AllocError>
+    where
+        I: IntoIterator<Item = T>,
+    {
+        let mut iter = iter.into_iter();
+
+        loop {
+            let low_bound = match iter.size_hint() {
+                // No more items expected, we can return.
+                (0, Some(0)) => break,
+                // Possibly more items but not certain, tentatively add one.
+                (0, _) => 1,
+                // More items pending, reserve space for the lower bound.
+                (low_bound, _) => low_bound,
+            };
+
+            self.reserve(low_bound, flags)?;
+
+            // Number of items we effectively added.
+            let added_items = self
+                .spare_capacity_mut()
+                .into_iter()
+                // Take a mutable reference to the iterator so we can reuse it in the next
+                // iteration of the loop if needed.
+                .zip(&mut iter)
+                .fold(0, |count, (dst, src)| {
+                    dst.write(src);
+
+                    count + 1
+                });
+
+            // SAFETY:
+            // - `self.len() + added_items <= self.capacity()` due to the call to `reserve` above,
+            // - items `[self.len()..self.len() + added_items - 1]` are initialized.
+            unsafe { self.set_len(self.len() + added_items) };
+
+            // `size_hint` was incorrect and our iterator ended before its advertized low bound.
+            if added_items < low_bound {
+                break;
+            }
+        }
+
+        Ok(())
+    }
+}
+
 impl<T: Clone, A: Allocator> Vec<T, A> {
     /// Extend the vector by `n` clones of `value`.
     pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), AllocError> {
-        if n == 0 {
-            return Ok(());
-        }
-
-        self.reserve(n, flags)?;
-
-        let spare = self.spare_capacity_mut();
-
-        for item in spare.iter_mut().take(n - 1) {
-            item.write(value.clone());
-        }
-
-        // We can write the last element directly without cloning needlessly.
-        spare[n - 1].write(value);
-
-        // SAFETY:
-        // - `self.len() + n < self.capacity()` due to the call to reserve above,
-        // - the loop and the line above initialized the next `n` elements.
-        unsafe { self.set_len(self.len() + n) };
-
-        Ok(())
+        self.extend(core::iter::repeat(value).take(n), flags)
     }
 
     /// Pushes clones of the elements of slice into the [`Vec`] instance.
@@ -496,18 +530,7 @@ pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), Al
     /// # Ok::<(), Error>(())
     /// ```
     pub fn extend_from_slice(&mut self, other: &[T], flags: Flags) -> Result<(), AllocError> {
-        self.reserve(other.len(), flags)?;
-        for (slot, item) in core::iter::zip(self.spare_capacity_mut(), other) {
-            slot.write(item.clone());
-        }
-
-        // SAFETY:
-        // - `other.len()` spare entries have just been initialized, so it is safe to increase
-        //   the length by the same number.
-        // - `self.len() + other.len() <= self.capacity()` is guaranteed by the preceding `reserve`
-        //   call.
-        unsafe { self.set_len(self.len() + other.len()) };
-        Ok(())
+        self.extend(other.into_iter().cloned(), flags)
     }
 
     /// Create a new `Vec<T, A>` and extend it by `n` clones of `value`.

---
base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
change-id: 20250405-vec_extend-4321251acc21

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

