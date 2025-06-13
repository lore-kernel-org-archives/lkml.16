Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5EE2E175E;
	Fri, 13 Jun 2025 13:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822398; cv=fail; b=semc27HImrPFa+2k9O0D5wHnPKVUKsrbP71TQIYH3PW498Gb+Nnv0HfW+vlWZi287QBnYCITyDZST1m3L1sUEPf6zD1Y8OvU6RMtbZs4tZBUfbL8OP9mS6vGjSzKrlSotT0QxhFOGbEcj0sQZsembqTJ9eVxftNfv0W1Opb5zgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822398; c=relaxed/simple;
	bh=IFOVqbZqx1Liyq2cGquxjdFBS/kKk0SBhpTa78+5qiU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GQCZ8qdoGKdJ4hMOUnRxbW9ndSOe0SN+rILv6q9RPJtlnZ0CsC2WNMHN/AJV4spZ4TmoCS9QFtO4ARAhzQC+fexDBo6/85p/bUg0Pyi2COaeF7dcfrhxxbP9HUK1JRnbgRnVlS9/g2Mbcvf90+UqZSHfwcRp6nkmqF1Bax+pEVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SyqH6hMO; arc=fail smtp.client-ip=40.107.220.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SyqH6hMO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSFaF4eNOk+MG+MU+bWacX1IPT9TVLYmzetpzLxK97KGeCZSNnxO6jypWXsD4bGnM3OVqTIlTGpF6/zALvVhynSHr78Ewgyrg2AALDk2jL5oUR7yUCSrAi4hSMKUfeGulmbexUpq6Wgi76vyXyAgeWgsJ869ATfC8X5L1KUXH7h1SDC846GACbdeXQahw9yoTTLAjhMaIciAq0qWU2QQbG8agTbHJNmiE1WdRtekENO1qLLdjKV/NIgQhmaVduDrHyDfBYf7B6i6d1L+uaq7cWDD4XuVbtD78UYRz137ryQ9q3TZBGS77wEKehjNpwjlz4NH+/80W7URxKDlkXcA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TXV/oZN0SxMvxZ2RU9oABKctRjCgv3D5TAjHcZs7dM=;
 b=ywa9R4XCwAQ4I17XXj7/vm2Prj6kjT1z6XHXIie37TAoumDF5lsZuJ+zIdFSWWKZDJW2dTDEqRStou0m1X3NEmz6gmuooWfDcNEBY6pHM2zAvrydDYWyZy9k+QMCtQW5dS+IC07TSajp5FP8zmFJwL9bANp0NGWEi0qxWm0VFvhJhcXs7pH3Lq3MYLYE1qFLhfQSFgA0K9G385xjiahXfV2lf1BDxN78l6nZz2phLHFaORD4UjHar4zIEnqEWh+0K97W0hvAQ59JNJm9WCtuklCiv+P+TTIfr6kecz1y/4PX6c6FSXBFRsEtnIk56uxk9yr+jNcYW6b0MDDNHykA5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TXV/oZN0SxMvxZ2RU9oABKctRjCgv3D5TAjHcZs7dM=;
 b=SyqH6hMOKvKQ7fjdFbaMSlTPRKw/nPQ5C1pIaEtKci1LcT+5po/w/frD2tvGFspwELNM9cb5mX9DNNTx+5c2n54Pq70Gx/6mfWLT0po9mfnaD/Df3KjxFLR/WpjU5WZ3G7VjnFLo3fHErjaGHmqNxowX7J+lda+O8a0LqL9uIGBnKS/h3K1HwTlZemeMXipCAFUroJEWuUCIkkYO8NnOPVlsD2xku449lollo76rjC4PZotPXKH5oY3lvkN1GBRo/KAuZOxpVHNk0IQFP35aiqHpe3D9EzCx72BvlTOyS7SokVC9X4mFwcCky94PftWXv+h9fBSsxNqHjZ/9Sb59rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7892.namprd12.prod.outlook.com (2603:10b6:510:27e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Fri, 13 Jun
 2025 13:46:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 13:46:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 13 Jun 2025 22:46:11 +0900
Subject: [PATCH v2 4/4] rust: str: implement `Borrow` and `BorrowMut` for
 `CString`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-borrow_impls-v2-4-6120e1958199@nvidia.com>
References: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
In-Reply-To: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0216.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0e5295-0afa-4d4f-9929-08ddaa80b64d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rk85T0o0aUhUelZSQ1RqNU1XUjB5TVhZem8yMTJPeis3dzZUa01DZ0ZvTDRj?=
 =?utf-8?B?ZGJuaThha3RpeCs2RjhuRDZVVzVwVFo2bVd4MWtldithaWJCZE1DOW1IRWtw?=
 =?utf-8?B?eHR1NWs1cnpnTkNJNTJUTlVUNElhanNvWElMNE80V0U3RVhPSUxaTmtFOHFM?=
 =?utf-8?B?djhocHpsQVlZVG5hb0ZOaTRQeDQ0OG5Ra1dHMFlTSEt2UmlmaHdUWFEyRTR5?=
 =?utf-8?B?d0l5Q0pWQ3lESkFVSnRNSGNiNytCbG1KNWlyUGpYYTZOK2RLOFRXVjkvN0Zy?=
 =?utf-8?B?UDY0TEJQWWwrUTJmU3FkaWZWNGZ4RnBScGVWdmFscCs0TUo2dktERHYwQlhz?=
 =?utf-8?B?U3c1ZnJqZytURTczTnFoV3BCeFBvRk5URS9wUk9JVklYTWpBOWJnWW0xK0pp?=
 =?utf-8?B?V3BieEVMOU1FbklXNXczemFDczJiczlOTFU0MzkrRW51bDZoRnI4WW1vdEJU?=
 =?utf-8?B?d2dBN1p1dExjMkd0NUNQSGJSTzFYQnE5djJxTFZ3ZDBXcDkvdjlZODkvWHRC?=
 =?utf-8?B?ejdWTGhVRkZlbStHWnlyTlNWd0pMZjJOci9QMGFEOGFFd1dsVGkzZTVzTnBP?=
 =?utf-8?B?enhVc1dlcHFWdy9hbnRTSEtYNm90VG1NNmdLRVU0cko2OWY2R1ZueDZDTitt?=
 =?utf-8?B?OS9HNUg1ZzVCZk1UZUtBTkh1dW9SYytZRnMxRnpqakl2cWRxaG5WM1JodHN6?=
 =?utf-8?B?SHdwQmlDa1VCVlRpMTRqbzN6OS80UEVjMGZCS1JuMDhJODFIb1Vqam1Gck5H?=
 =?utf-8?B?OUFvcTJCSThXbC9CM0tlOXBxQnYrNFFUU3BFUzY3SUtZNWE0NDdtc2dxcC9q?=
 =?utf-8?B?cFdYOWVMMURvZnNSN1NGUTBsQ0ZtdWp2NFdFRFFvSjRTcGpBT3pVcHYzYmJZ?=
 =?utf-8?B?WHhXdXM2VzJRY0Nmd2w2blNnbnd4M3NkWURYczFYdEVIbll6M2FVTHZmejRm?=
 =?utf-8?B?TlB1M252amZTVHc5UGpWUFBFdzRxVVZsdVA2QmdHaVVERHJSMk9UWXd3cUVi?=
 =?utf-8?B?REpUTjVtMExOdU5ybjNmWlhHSzlDNnRrcmtnM3JVeTA4TGlGNCtCa285cE5a?=
 =?utf-8?B?TWwzUjluUkc2NmUrVDd4VzRJVGxJaCs1dStXRVovcFJXNW9IS0U3YklhemNs?=
 =?utf-8?B?RS9keitQZmNEMjJDQzQ1c2FidzN0RmZQa1hkVXZVcUM0Ny9qL1NQK3JtdWhz?=
 =?utf-8?B?eHlHVmtFWTdVUi9FL0hUdWNBZWFIWnlLMC9CQzB4WVJYY2tkUWlQV1JKL0d1?=
 =?utf-8?B?M2NMa2lCYmpzVmhNNXFZTkZRTFRlVnhZWklFSEZlK3hnVTNubE11ZkpUMXov?=
 =?utf-8?B?dFAyQ0I1eXdYaVR4VzdMUDNCRk5Ocld4T0NHQVlXRFpXWWpJUTIydGwxWlR3?=
 =?utf-8?B?WUhBWVhqZ2tObURESlBvaVd0UTdVZ3RUazN5QVFOdnRuc0thckRubUVlQmd1?=
 =?utf-8?B?Qmo4RlYrUFV5UEc5RXVyNmsvSktOcHhwUnc2U1pXRFRock5wVkVwM2gyYTN2?=
 =?utf-8?B?M0E2SWp6Z0xIeTRwL0JyK1AxSDE4Wm5ud29xWW81OFhjaTdtMmlEc2FYa0ZC?=
 =?utf-8?B?bDRlM1NmZWRNT0UwTFh0ZHFwK1dIMTZWK0lFR3VlZlNZRThiYjdWM201UURl?=
 =?utf-8?B?RFA1YkluYjRKcFkvRllVWk5jZ2JZMHVpU3RvTVJTQzIxU2ZUSTgwdWhGbU5H?=
 =?utf-8?B?UTNqNjhodktoSWJnS0Zxek9CZFJBbWxJRkhNZlQ3QjBLY1hxQ2p4QmxjSWQ1?=
 =?utf-8?B?ell5aHk4bkcwRm5ESFdjMm55TVJYcGUzR0lKMi9qMTlSaVVJLzd6T0VCRnpJ?=
 =?utf-8?B?cysvUFRoM2V0bW1lRzNySFpvS1FDOCtsUVIyMGVKd1Vtd09qeUtEVDhPbml1?=
 =?utf-8?B?RStGWnNCd2NxRXlMWURIeFFDRTZGU0JBRi9JSWJva3pkUi90OE9lcjlEOU15?=
 =?utf-8?B?aUJwWWU4RzR1aDRMWDJFY0pwckhHaWJhcGQweGdCK2N2cEdoZEJJWHBleWt0?=
 =?utf-8?B?Mm95c0hGcmVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVZPSnM0U0QwMFlBNkVyazEzZzB0MWl3dUZ3cWdNR0IwUERpdFFzLzhoZVh6?=
 =?utf-8?B?TVVBTGtwVUNZdFNqRU91VkdqbC9wRmlUdXloc2RoS2IxS1c0Z2x3VDJ5NlB3?=
 =?utf-8?B?aXNvcU1yM3YzN3UxSjcweWdNYWxzRmEvZTBwbTJoTkZ3bndoRUpjV3Y1NVdV?=
 =?utf-8?B?eUFwVDNNVlJPNmF4Uk13bk5GU1NTM01iRWE5bksyL0ZkNXRXNjJRbmZOYllF?=
 =?utf-8?B?alQvRWVJaUE1VVkxL1J4QWdoZE82Zll3SUZESExsVWwwM3FLT0RINVFqbU5O?=
 =?utf-8?B?anM2UXNmdDB0M3pBTmg0V1hsNW42bHJSb3pFdGtDKzFFOC9pRTUyYjQzQ3VX?=
 =?utf-8?B?UnF1YWVSb1hrTjM1Zi94YUZHc2Q0R3BkOE5YaC9CeU5wUUZHeEJtNjVid045?=
 =?utf-8?B?aVVXYkh5QTdQRnVOc1BKanFFVkNZMFhsVXYyTkl3cmFJZWJuUEFWQThlalJ5?=
 =?utf-8?B?Q0wzZzJvcVh6ZVl1MzhFTWtkNkY2Q0s0aXQrS0JOamhKTTRwUC9ZZFlHUk1i?=
 =?utf-8?B?ZDU4bFpkSmY3OVpjOHBEZ3RLRXU4QVBuSDUrVjRKTlF5Y2NMMEp5TlpHRGRB?=
 =?utf-8?B?MExwVEV3T2IwK2g2V2hUY0tRT1VhQkhrSmdyRHAwMmd3S3d3bWdydWpKV3RX?=
 =?utf-8?B?U1hLblI1bm1mc2dyUHdmMFI5NDRXN3lLZytGd3R1OGZwZWhxL2xUZXVTVUhi?=
 =?utf-8?B?MDJMdi9Tai9md2J1NjU0dEZRajRIQUZjN1BxOGRDZ3dQQ0pBNCtsR2E2Kzhs?=
 =?utf-8?B?WnVMMk44Y2tZOXM3Vm9wZm54ZjNESDVvQ2xaQzJxTkVTU2JBQXJzcjRCcXpu?=
 =?utf-8?B?SmdvQzZmZmEydHNtZU1lOUVhZWprZE5Sd2JUMGFDOEdsNnRsYXorYWZIV3RD?=
 =?utf-8?B?ZmJoSzJoMXFPUnN0TWlpa1AvK25YRGlaazdRSHVlOTFLTVo2cXd2MDRKQjZu?=
 =?utf-8?B?aXFHKy83Qk40c1QwTkFOZmlMVGhsdUt5b2lqNkhRUzFSU01aM0x0MFEvaEJi?=
 =?utf-8?B?VWRHSFl4SUhSQk5BQlVQZ0dneVg1dzlEOGdRMWhFTUptUU1iamJyZXVJQSt6?=
 =?utf-8?B?MmlRdGxRMDA5dmd6RG5uc2pmTC83aXFJVGF5YVR3bGhTblFPTVZtSy8zcGhO?=
 =?utf-8?B?WTZYUXpPMWJyaHk3L1Q4UUtBV2RydkdSemQ0OVBMWEF4MUNrK2NRNmVPNXd3?=
 =?utf-8?B?T3N0YmgrMmpCenpjTVN4M2Q1OEJqVDNZSGFKd2l0dUNoWkpJK2ZCWExjcU13?=
 =?utf-8?B?ckpDZGpZYmJiODZmVDdiZVVQOGZad2FWRGVETm12ZE56VGpzVEpqYlJJSGxk?=
 =?utf-8?B?N2FOL2x4UlVDcHF2bHhZMDVCU2licE95T0RlVFBsRkhrN3VnT1loemRjK0Fm?=
 =?utf-8?B?Y3l2Y0JsZkp3MzBxRzZVVmZCSnJ1VFlqZ3pTSUVBSW5WL2R6a3lkQjczVHBs?=
 =?utf-8?B?d0VSSEFnYW5IOXFOQ0w1ZUsxUit5aWRKOFdIMWpoQk9VNFVuY2lteHFSdmx2?=
 =?utf-8?B?QlZrc3B0cUhQampiZ3dIM0UxUHovOFpZek9qcWpSbjF5Q29HbmcybXVKNnE5?=
 =?utf-8?B?T3pRcmFrdXJXK2NXc3JNYlI4RTViaitoSi9nNk5pZUtLYWFxemdOTzZFUHVp?=
 =?utf-8?B?Tnl6akNLZTk0MUVVSXVQbjVFcmt4OTladEpFVzE5NVpJNGg0MzRnc2o4eGEx?=
 =?utf-8?B?Q25ZVDRNQlBLb0hUTksrVXhoRnQ2R2QzWWMvTDdYdmpYTTdMTzB4b1Q5Nnhz?=
 =?utf-8?B?ZzJsMURBdjlLYTlpQXczbER1d05FeWpOcG1YM3pBMzFJbnhoM2hsS1A0QjBz?=
 =?utf-8?B?OVF4Zk56S1liLzN2aS9rWXRKb3p5bUNwVVZUcCtxRDYrNUdoMzRQN2dDaWhS?=
 =?utf-8?B?TWQ5WDZma3NwSVh2bG1McG9Pdjc2UkVuNkw2blhHSW9nWm9WdDJTTVZKdGZY?=
 =?utf-8?B?aUdyWVVEdXZPUG5SbVZHTWlEcy9JL1lyZGhVeU84b0Y3MHRMQk01U3dENkFl?=
 =?utf-8?B?a1FuUDlscHpnQWJKZE94ZlRCeGthcTRocmo3K0FJT3ZUNnl0UGl0azFYcWtH?=
 =?utf-8?B?cEh2QmNUc2QwZjFBUlJIeXZZeU1OOW1Fd2t6TVJYeG1QNnpocytzc2tRallI?=
 =?utf-8?B?QVpuUnlLNWtoUUxtYXZOVlhJSGNEcFZ1NFBETmtRTk8rd21OY3VjSVJFVmdv?=
 =?utf-8?Q?p5CxJG8BZEp8ZmCBuXmXDUCxYCR/cqFRl9mROYL5nGzu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0e5295-0afa-4d4f-9929-08ddaa80b64d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 13:46:34.8516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uyzdyweh9V/Mt5k/iEFBNhgnp6bG9Nx6E1aPHvI/kg6qNTuxUCw2qIwyyUyQO0kYjS63Mw9q8P5uvbGaSLlG7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7892

Implement `Borrow<CStr>` and `BorrowMut<CStr>` for `CString`. This
allows `CString` to be used in generic APIs asking for types
implementing those traits. `&CStr` and `&mut CStr` also implement those
traits allowing users to use either owned or borrowed values.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/str.rs | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index a927db8e079c3597860880947a03959e1d6d712e..36d46443c269a73fa1246c52ab8558bae3e439ee 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -3,6 +3,7 @@
 //! String representations.
 
 use crate::alloc::{flags::*, AllocError, KVec};
+use core::borrow::{Borrow, BorrowMut};
 use core::fmt::{self, Write};
 use core::ops::{self, Deref, DerefMut, Index};
 
@@ -911,6 +912,54 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
+/// Allows `CString` to be used as a `Borrow<CStr>`.
+///
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
+/// Allows `CString` to be used as a `BorrowMut<CStr>`.
+///
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

