Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B7F267B99;
	Sun, 15 Jun 2025 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749991059; cv=fail; b=ceS8P85gX08+e1XNeX4vVvC1tH2oApHXozxCWd02SQA7ewv/4QJKPUt+c4PjcQQwxkG6uxLjpYEZYbSSSOqE8hUUmkllrif2RbVaCe4MiYfb2EACvHCK59pPjwcJZA2JgIKcEY/W1Kd+ZeFbK2RhrBjoMm5RxgteOkELmW5NqGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749991059; c=relaxed/simple;
	bh=SSaJTEecKctoQELa2iBwHmcj1bXxy/3jvA9aOFNq79g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gZvWjx8LvqBkSS66k4HbmRUytDKEqmRvBS8aA9AtyPrHGwQh8O8wcjNYFuZuVHrmKTco0tYZ2eZie/2VzLDFRiXJnYcEi8pNl8xAizb1hrbSsVLNjpcKeDiA0iQJlLKLHXU0yD8o7b0AiQDdQhSUhz9xyZ3iTKp3a+YqPggwYAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jXHInmb9; arc=fail smtp.client-ip=40.107.223.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jXHInmb9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHoS+cKpDo45VJrMZkOzUTYbo5r5MkQV89Fvgn/cHm07P8ctpffoAy0H7J1giLTpmbIEhyib2LbHwhjKecAsW3hCSNsHpG0JqHkDrpW6e/sDoR5g0OnHLDUTv46oXrOiBzrKmfjQeyQsI407iktvKjF9FfoX4sKxy+lEXom6X7R3xProS66KnoCUB/TtLxKUYn00Qmy8VvpqwFsyZcIy/Hv/o0ji9HrIMpX5japGlPjucsR0cNCtXoYkjHfpsALL2qxE6ePQs8Uy/cFogaCmKRhXfoArBPX/3NNMohdvWTLh+jx2QnA1yi5s3vHOA5ixhkr0FReaPQk7Egvo2RmkXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rzYw7x2HCEptL29VyhEDw4tAnPhlhIQiVbDNhE3gw0=;
 b=q0zcZaZYsuW1rYXujCOfHpEJAaSeR54ZcbnuUnVpanZhIL6yr7fTBC3ZtB2HjulcJXTSu0wwAkNAmCw5o5bQztG1nYbNEDcf4zmAOnw64l1eimAyxHdxKygcAfq6WstJDuxbwpKI6+jjtBBuP8VtgnDPbWSYeq7J2ON3d29g2h6IQgOMnq+7m5/fYryQOC5/cYd3r0Pmkwnr0DmyEUDUQmh9zr4K7LTUFJRIAYYjOoQu5qfOcsO/eTwB2PnonX4b2NSDliyq6tSJlGrYPhkD5brbKBRJRP13UueO5Ga7Dnwz/PQCIFRcq0HuDVwDgqBgf3JfIFHw9OrBUnfO35ifWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rzYw7x2HCEptL29VyhEDw4tAnPhlhIQiVbDNhE3gw0=;
 b=jXHInmb9A6u3rdkusO8jsCy75uBS7QKnrLn2siB1K5ErCJBKUHnKOsAybg0HTQqzeZc0ot1FNxfVHrguDmx0mc7Mrj+hnLJLgajl28AWoAtIlowK0WUaJCCfDml5vI+pzn0Z8FC/njaRiIAynWkFk71MK5qnfn12mmCNwU+UVo5iR7tDdifx+zxFnkRhqQzKNwR650W3+meqOG5lUOQWPeUFEMHjSDVX8w4ecYL9Chs4oTFOnaDdXycq+iXu+z6ljMzOTukXARPNhkDDVGojDYWCMafICUSRYnErm7PkiHAkExtOzdetddyK9bYuAx27k6bKeu8B72ls9eT67WCgkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7278.namprd12.prod.outlook.com (2603:10b6:510:222::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Sun, 15 Jun
 2025 12:37:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 12:37:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 15 Jun 2025 21:37:12 +0900
Subject: [PATCH v3 4/4] rust: str: implement `Borrow` and `BorrowMut` for
 `CString`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250615-borrow_impls-v3-4-621736de7f29@nvidia.com>
References: <20250615-borrow_impls-v3-0-621736de7f29@nvidia.com>
In-Reply-To: <20250615-borrow_impls-v3-0-621736de7f29@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR04CA0020.apcprd04.prod.outlook.com
 (2603:1096:404:15::32) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 67625fa9-59bd-444f-535f-08ddac096772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWVkVWQyZ2tZQ2F2aDlYdDFPb0VjbHZmZnU0dXpFZGFXbmU2bjJmaVQxcWor?=
 =?utf-8?B?cm9ocGRyUnZqYlJWL0xibkJmVXVLRGxRcERhNG0zaEd0S0dsN3VYWmE0S21T?=
 =?utf-8?B?N3F2YW80cy9HbjlDMllWRGJoTnMvWGk3ZnB2TElsS3dibWNOZkFJTENsMWJm?=
 =?utf-8?B?RG90YjRPbkZWcjdNV2JzVVBqaEZoc0JjcXFSamIwKzlCWXMvRGdDRVhTdFU3?=
 =?utf-8?B?Ly8xc1M1K2dXQUJVRWVoT1p1OTNGQS9LMGlDNkFoVlB2MlFhR2RqaGM1QTdy?=
 =?utf-8?B?RzJIYyttcHRpdmZ4QXNGOHB1cUlqWExsOVJhTVNYcVpCQnY2WWZaNFlmU0d3?=
 =?utf-8?B?NC9pV1NQWVp2blQxQzZsWUlmanh1ckx0T0I1MmlhdkRyWXR4UzkrdVIwdW80?=
 =?utf-8?B?SUNFVXl0WE8rbVFscjFVeTJIQWFBNGk0K2JoVUFiUktpdlJ0em1BWHNqZnhw?=
 =?utf-8?B?cGJFRU9oNDRHMFBJbS80RWExZFd3QUw4SkoveHRjR3htYUMvOFF3azJVZVcw?=
 =?utf-8?B?Q2l6c1drRHdEa2FqOUdZTG02UTgyZU9Rb0UxZDNIaGwyYkVsd0ZoUi84djJN?=
 =?utf-8?B?YVFPcEtVQmlnZDNSbitGdFVYVSs2dE1VUjZ3KzVsc29zSXc2SWtSdWdFa1hq?=
 =?utf-8?B?KzhXbC9DZ01MTzhOMEc2b2dYTkh4cWFHTDRwWVJSaHFJOFZGK3N4MWNjTktG?=
 =?utf-8?B?M0lva2pmWFRLTXJxWXhmZGNNTS9qMkR3S0pUNENKU01tdmJsc01HSXRiZzd5?=
 =?utf-8?B?THdtZFYrd3lYeDlwSmdqWkozeTFlV0t3bVA4V3FpcEF4UHQ3WUFGMmdxU05U?=
 =?utf-8?B?ZXk1L1o1ZDlaN3ZZb09nVWNmTUNnSHVuUWwyb1JOdGVkNG40enJab2M5MDh3?=
 =?utf-8?B?U2lYWE9NSFgvRVhiZTVRSnRHdEdWKzVabHE0a3Q1NWpjb2lKRFFsYmZVbU9p?=
 =?utf-8?B?UGdaU2ZGZjRrMkFhalo4WGxkWmZvNjFTM2xvTG1ncDRjVy9wVVBRWUlvRVQ3?=
 =?utf-8?B?ME9JaGg4cDFYR28vdk51UnIzaVdCUmFIR2NnS293M3lsWXNCWFpPTmcySndw?=
 =?utf-8?B?VUt4aHVBUUtEWjZxeitqbDJBdXoyVDZhSjFOb2lkRFgxOTU3MEU2RmlTSDZF?=
 =?utf-8?B?cUhHLzhZdlFrMHNzMmlrL0hUZWI3eHNQMVVZcGNjR3UyN0NwQThJbnZmTG8y?=
 =?utf-8?B?NW9nK2Z3QlUzVWlXelV3TzJySkc4RDNwQUcvaUNyS01DcXMrNWJTQjUrNUx5?=
 =?utf-8?B?cmNKZStHS2thODU2MlhBOE9VUEJYYlRmUndlbUNQcUQwNW9vclNRWURhb0Y1?=
 =?utf-8?B?Zm5lT3liVWFQWmdIZldFblNDMG8zYXVPdlY0cFhIZUFDSUQ3N0VkOTBmWVl1?=
 =?utf-8?B?M0wyTDNHS0UxMDFqNDE1cXEwVWp1N2xKVVJXV3N5Z3ZnWDBuRTM2VzNyNUJZ?=
 =?utf-8?B?ZlNmMSt1UEJKa3VNNk1WcjFsVUQ1L3dPTmNGR0VCSmJJMzEva25kT2g2ejFj?=
 =?utf-8?B?RjRqd0lxbERrdzBIbDVXYVRtSnBYL093MXhnNXBVK2l3V2NEUUFQR0pMaitJ?=
 =?utf-8?B?TkwrbHFjdVc0cVFOMUhCNXdUWExxUC9GQnJ6K2N2VkRKcSsvNDhTU0xrWm1W?=
 =?utf-8?B?Wm1oUWErVCsyNGkrSTBDdnpuanc2QnFrUnF1cjRMQUR1Sm15YVQwVjkyNXFR?=
 =?utf-8?B?dHl3dk1FVVp2czMxVWg2ZnAvWGZ1a1dkeWhBbUpERjFqaXZxOFZ0aHJXYmFj?=
 =?utf-8?B?OVQ0SHp1L25YSkdkTG84bDBJbkRqYmVNWnE2UnIrNWlBYXZVZTV2VncvSkJr?=
 =?utf-8?B?aGtzaU4xUTVxdWVPKzM2bmppZVJnaWpxaFF2Qm5OODBoci9aU3BadjdLY2dn?=
 =?utf-8?B?Qi9Tdmp4N1lmcjI4L0FEU3JocVh2SzVHMjRSdVZvOGRFSEkyaGE5RXhmQzc0?=
 =?utf-8?B?SEoyNERCZjIvdTJRMW9wRWZmWWs3N0RreU5UdklCeWdJWDl0OGRLNC9RZC93?=
 =?utf-8?B?KzFLMDdGVzJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWk4NVZaWXE2R0QwSHBSR1R1L0lXYjVvNnE5LzRVZWF5UjdvYXY3K240VFdF?=
 =?utf-8?B?TnhMZ1BpZ09xdlhwWGtHZnR4TkFKUzRVUXV2TUJzbHk0NmFPeHpNemhLYkRK?=
 =?utf-8?B?SEpPNUpWOWU2aHlWMTQzejVra2JtRm5FSHdYQWQrREhzUWJMUlE5ZGt1U1pV?=
 =?utf-8?B?Q2RRbTdQZFA1aEdLeEdhWUdpY2NiemRNSWZoVVNmNm4xZ0Y4RWt2ZnQzMHUv?=
 =?utf-8?B?SjNaY0wvZk56K1ZuYnB6alVLOXRWeWRJNFFBQngrWm83dkxBdHZHbkY4a3Rk?=
 =?utf-8?B?SUVGYXRhajNtR0FXYUpKTEVSRzR0M0NmdnllUHBTcUQ5dFJkaC82MFc4V2Ix?=
 =?utf-8?B?VVBJR3FSR3EvY0ZlenVKS2syZEROZzJ0WGdUWFUvV016VVNGU3RVMHNSZHVM?=
 =?utf-8?B?MUc3SzFMcmdZTmRKcmd2dWNPSVFFczJtNFRxOWF3eFJNckx3d0pIRllWRjRt?=
 =?utf-8?B?bHpjOWtyVG9BN1diVVhWVXAzZGUxMnl1ZFRIOFQwRmZneHNyZ1p3S0RFYk4v?=
 =?utf-8?B?NmdkUEJad3pkSXlLR3Rkbk1kWjVnak8zMFRoN1dtVm9CMUt2NWorbE5BMWJl?=
 =?utf-8?B?WjVsWGdpdjNlQUw1WjVHSnNMb3pCTUFEUHhnMWR0eVdVR0VtOVV3TCtSVDBr?=
 =?utf-8?B?TXJKbVFkdnRETjZ0emRURWhLZUJvYlFhcnBlVGFveTgvcmhVMkxoUW15UnV6?=
 =?utf-8?B?Q09KWjFXeVQ3NTFQSXpLL2p1UUdRalYzVnV4MnJnTWlmdFF4L0lObnpZV3NP?=
 =?utf-8?B?ekJ5R296aVQySzZqcTBhUVNybG5mU0phMHF2djRNOU1mV1Y0aGRTdjdnYnFG?=
 =?utf-8?B?blMwanZvYVl0MStKYk4rZExHZWdiUXM5aUwvbWhqSER3UDBPWXJNMDBXUU9l?=
 =?utf-8?B?NEVJZTEza2wzVUE5dG5ZOFFIN05nUnVKcU9zclJOSUE2U28xb2ZkRkdJbXZU?=
 =?utf-8?B?RUI3emlTaTlFWGxuOXBLS1BQaTF5NzFVZERIQ0ltNytUUkY4WnJiV3BXUkxu?=
 =?utf-8?B?UXVWazRHZGlkR0lTM3VoWml2ZTNQeDhva2NqcGc3b2RkTWFFWGlzRDdwTEVx?=
 =?utf-8?B?ckJNUjF4TUc5aDd3NnFDbVBBVTQvNjloN01teW1jUUlWdjBGalg5WFpCOWFz?=
 =?utf-8?B?cTVsUTBBU0tlVHJZaVEyN293SEc3T2F1dndRTVU3dksxWGVZN0pCbUpBQW9U?=
 =?utf-8?B?ditXUVBnVjUyNWZWN0cyVTU2dHpZaldBQVozVWRXTzYwYU1OUytxVXBlS0sr?=
 =?utf-8?B?eHdheTV0WXNLeVJ6NDI5bjVFZC9SNEo2cTJnK2J6MHdna2NlcXNWRmdtN091?=
 =?utf-8?B?cUFPVHN4eXFjcGNEVTlsTkhFYlpsN3NCd0M1aU91TnM4dUJJWTJmNTBhQmJL?=
 =?utf-8?B?alh0TFp0Z2t0clpuSUQzQnZPdU1Mczl6M1BFWkE2TUtRUFQ4NG9YOEpJb0R3?=
 =?utf-8?B?VnBvVDlOdE5DcnlETjFpRktBWVdQMU9OaWpmc3JqWndEU0psRFdUWlR4ZHda?=
 =?utf-8?B?VnNaYzJvaWRWMENFZllHUzE2V0Z1ajdNRnR6Ymlsbit4OG1MSmZ5U0hCaUI3?=
 =?utf-8?B?dlRxcko1MG9USDBIU0liZXpqVTIxd0I1UUlIaG9haGtJTlIwK2hsWTMyNVRQ?=
 =?utf-8?B?WUN3djQ2aG9CL25uaFFnK1BMMmFzUC9HQ0FrbzRzM0xwSjV5amJSaXVXSXZy?=
 =?utf-8?B?R1prc1FENjFka0N0N1p3V2dMQkFKMTUrNFplUGUzUjZlbnFKZUlDcHJlZCtn?=
 =?utf-8?B?dXNRREsvaldiQVJmd2ZoWFdFRGliYW5EbGtCU0poYXBqZFIvN1dacWFwSXRF?=
 =?utf-8?B?VGVUQUFYTlpzbU9KUmhERm9FSzk2TXN6dTJrZ0wvcUFUZUdWSmpIdGRQYlNX?=
 =?utf-8?B?ejRHaExqay9LMWttYkxVcmRIYkVFMWdtR3hVK0pTcEw4VGhQV0h3bjl2ZGJX?=
 =?utf-8?B?QTl5MlpRcTk0TTAzNUNsOVVHbEcwNzlGRTZJTTRqT3BqaDQ3SndPNFZ6K0Zt?=
 =?utf-8?B?bWxrYlA5NGRLUlhtVGJiOWdFSUpJc21rRXZDWUlSRHZkM0dubCtoRHU5M0g0?=
 =?utf-8?B?SG9xTVBsSUR2QkRSaHBzM3UxVWFQbVpSbUpvN1dwV3BqWDRaR01CeGVYTlVr?=
 =?utf-8?B?WHlUNWxLaldaNlFQci9YdmRia1UwMm9aWU0zMC9FVi8wTndsbnNYOVUrcytp?=
 =?utf-8?Q?iHeCvWb+/gHvmaGMh2FNhMKjJcgVrX5quuZz6MP2y1n5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67625fa9-59bd-444f-535f-08ddac096772
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 12:37:34.7614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnVa+3ers2PErBWkKMNVWoprp0aKRucoAeXHOXeZ8yv7YxBfK1y0T61EVwgOL8nbayWu5HLOVCvqgeWEPlQK5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7278

Implement `Borrow<CStr>` and `BorrowMut<CStr>` for `CString`. This
allows `CString` to be used in generic APIs asking for types
implementing those traits. `&CStr` and `&mut CStr` also implement those
traits allowing users to use either owned or borrowed values.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/str.rs | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index a927db8e079c3597860880947a03959e1d6d712e..1cf787d4ace36a84d0ece7a7017ef0c67499bf89 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -3,6 +3,7 @@
 //! String representations.
 
 use crate::alloc::{flags::*, AllocError, KVec};
+use core::borrow::{Borrow, BorrowMut};
 use core::fmt::{self, Write};
 use core::ops::{self, Deref, DerefMut, Index};
 
@@ -911,6 +912,50 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
+/// # Examples
+///
+/// ```
+/// # use core::borrow::Borrow;
+/// # use kernel::str::{CStr, CString};
+/// # use kernel::fmt;
+/// struct Foo<B: Borrow<CStr>>(B);
+///
+/// // Owned instance using `CString`.
+/// let foo_owned = Foo(CString::try_from_fmt(fmt!("{}", "abc"))?);
+///
+/// let str_data = b"abc\0";
+/// // Borrowed from `str_data`.
+/// let foo_borrowed = Foo(CStr::from_bytes_with_nul(str_data)?);
+/// # Ok::<(), Error>(())
+/// ```
+impl Borrow<CStr> for CString {
+    fn borrow(&self) -> &CStr {
+        self.deref()
+    }
+}
+
+/// # Examples
+///
+/// ```
+/// # use core::borrow::BorrowMut;
+/// # use kernel::str::{CStr, CString};
+/// # use kernel::fmt;
+/// struct Foo<B: BorrowMut<CStr>>(B);
+///
+/// // Owned instance using `CString`.
+/// let foo_owned = Foo(CString::try_from_fmt(fmt!("{}", "abc"))?);
+///
+/// let mut str_data = [b'a', b'b', b'c', 0];
+/// // Borrowed from `str_data`.
+/// let foo_borrowed = Foo(unsafe { CStr::from_bytes_with_nul_unchecked_mut(&mut str_data) });
+/// # Ok::<(), Error>(())
+/// ```
+impl BorrowMut<CStr> for CString {
+    fn borrow_mut(&mut self) -> &mut CStr {
+        self.deref_mut()
+    }
+}
+
 impl<'a> TryFrom<&'a CStr> for CString {
     type Error = AllocError;
 

-- 
2.49.0

