Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19F815539A;
	Fri, 11 Apr 2025 13:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377992; cv=fail; b=VHXavEEILPwPUAbk1thjMWv9ZBJQjjs3wDx9Q8vj1E9EzXFlg7MHUrNafQPgNAG7Vi/HcoDhDycJMtSDj4inDc6sgWyUcTq6x0h4I0zeGjnZKLfFy3MMQv5Wlezn8YlZP5oUBWUsbCb3vTE1dSn4sflHxniCpgmYqIqV7v4dNYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377992; c=relaxed/simple;
	bh=88uq+++mfxNr8RMQAb5tGgUfsq+6wC9MgJF81wO2qRU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dhmkX995DzVUIaCJ3dEacZKe1edbELcuRIpULg2IMnKTijnkoKBWzb0r9OQS56wtJHWCUtH0VgtBr/0SgjO7A7Dp6jiW7qybPn4O2SsXIlbmZdXPgfC19f+tZj/iv2K43QwiFmoCaiyv2uh2wYWRHYWu9yMwi1oyeyQsHPcSrPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q90QsmKc; arc=fail smtp.client-ip=40.107.236.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q90QsmKc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8x7H04eQkVKRrEZN5Qx74E7XGRgvtBXrQezep0aAGLtygWGeVlLqKIe79pKEJTZZaP1YcGo+xjg4XMrrVCRHeHS/zNK6+TVFfwwF4FmGADmdaCucSyX6ERpTA8X8MMv+m9YFcqUuU5AYKgIyXs9weCn33wR0tHtPIYS6Tc2Fevko2NTpfBwEeDnBF2vFEKWveXMLEQW1EKvQ95WWETHeb2vorGqDPDJ3App4epG8JKbXyNPNZSsLiD0vqtbHUzZcUh8Mzzw45hT2F424wBHYsTz773MZ7KZm/QLCFBZbMXqPTt7ICUPb+nrZPMYNSDWVpJsmX2SOum/AJCuh+9LAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88uq+++mfxNr8RMQAb5tGgUfsq+6wC9MgJF81wO2qRU=;
 b=Cz3Y4V/fWawlZnbBXubr18W3wrEvKDOdQ6VU1YuxYke7f5UU+C5a+BMQlYVtcZX4xYuz2zg5uLjqZewRpzbIJ6URL0T81Qbth6D+MLTwjHPKxmZc00P5SQRGPdRXlP+3QVHCCftRqqGPrYS2rdQlvJCsgu2WyJhV7h5YGDE1kl9ZPQbzlSZnas7a5Li6JAzPIqxRRc9imTNiopjt2TKXNI3SnaiGiVfQ7xjKbyqwb0ME+M3p+IwUketx7mK6g151SZ5pCWvonf4AruuBykSkh4g40NBjZe+DLEb+ZpxzzXpdYaZ0Q92AMFC7+52W+hh4lDOMt0djj1rwaOj7zTKwJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88uq+++mfxNr8RMQAb5tGgUfsq+6wC9MgJF81wO2qRU=;
 b=q90QsmKcZgO2E889Ku6bR47CiBSkDgrGN4zz+uhsxcXWG7iQL2P8ULXBCcxon4iPXXzNHaM5tM8KjFz7az2gG3H8gzpeLQQd8lsX+4wzrd4aSzU8VdvFZhmfOoLErTqBx/iYjEkpqjBRgfhQ2vco8DTQbFSf6Iezltc+qq82hxHdAUhoLi6jc2Y5orOjy8KlwzNOs+axwHSA2Ev/uO3rKytHsFl5TG3RNl8+ZrThf0VyPV+vx086ezgC2c6rFjGhkrJhzuiY8twEcNnz+3Vr8SnvGTxVMV9fqJYHuQySd7KVa3CNPTGOyZXGTFSkO+zNIRkOtUZ/41nFJ4ejTipJGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB7717.namprd12.prod.outlook.com (2603:10b6:8:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 13:26:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 13:26:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 22:26:23 +0900
Message-Id: <D93UDYZH7A8F.1FG8EIW013NKJ@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: alloc: allow coercion from `Box<T>` to
 `Box<dyn U>` if T implements U
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-box_trait_objs-v2-1-c5f31b8db847@nvidia.com>
 <Z_kUyx8ytlac1d__@cassiopeiae>
In-Reply-To: <Z_kUyx8ytlac1d__@cassiopeiae>
X-ClientProxiedBy: TYCPR01CA0023.jpnprd01.prod.outlook.com (2603:1096:405::35)
 To CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: cc113d98-89e6-41a3-1b9f-08dd78fc7622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cS9KbEo5aWlZNFJKWjdUUjQ0MWRIbGRyaHpqUGYwaTNraXJBN3JRTEVEN1lP?=
 =?utf-8?B?NVByZlRqcXhFU1NsY2NkVXE2dGR4dityRGplQkNweGRTeWpta0M5RU9KNC8z?=
 =?utf-8?B?NEQ4S09XRUQ1eXVkTGZ1d200QUFHdTBRMWpPOENBYzVIK0N5Nms5L0RzWm83?=
 =?utf-8?B?M1ZackVKb0xOY2Z5THpPSjQ1bzNVbWdwcS9aVE90YS9Pa0FyclFyRmJDci9j?=
 =?utf-8?B?ZmJySzdUWFdaZzRQelEzMExldUtQOXMxNU4yTFRQdEhJSlNNb2RaOWRIVHZi?=
 =?utf-8?B?QTRsdGF3NTVCRlR0bWFicWtvV3lidnVmSHhUUTdpTTRLTDBqZFlJZmpJTjJD?=
 =?utf-8?B?V3VRNEhWa1dIc1NZOXJXcUF3TE1DTHV5aEx4TzBLWlZ0aGlOUmh4Lzlwam5v?=
 =?utf-8?B?Q1M0ZHVEZVhaYUhKN2V5MlRzYUc3cHNrT0VaWDJNc0JrQ1pNMzFqdXhwVnBS?=
 =?utf-8?B?UjZRbjBSN3VaUjQvU1B4eTBPWlV1Rk1PNjBaZ1pRTE1uZ3hqMGFYcnhuYWhV?=
 =?utf-8?B?WjJ4UVU3NE0yTnVLSHErek5PL1NzNnZYZFJtTFhxa1N3eVFwbmVMQktiQTVs?=
 =?utf-8?B?TzVZUkE0aVc4NnM1djFzU28wcjdoK2lsOVZLK2FpOFJLZEdkWEF3SDMvR0Vz?=
 =?utf-8?B?bzY1MGpVdkc5VldiOFJOVTNwVGllbENKeEVwSWxWdDJ4V3A5ZURoWDdLZ1FP?=
 =?utf-8?B?TStlc3owOGVWUUxvYWppK1crL0ZrMGVNVUIyeDNkNnh0dVpPTU5zMFFMcVcz?=
 =?utf-8?B?TjlNRzdueFFmcW4zdk5mVWFMRU16M0dsUi9jRExOQVR3ZEIvZmlCa1c0bTNU?=
 =?utf-8?B?RnAxNFNseTZOalNpekJmckFLSVpXT3R6TzV1N1JRaExpaFRxdzJzWlFBclVL?=
 =?utf-8?B?RjAyNFpJT0o3Q21DZ3VxVFF5R3hBakFrT2YrSEJyY0Q5WlVEWGpRcEJSNW04?=
 =?utf-8?B?RVNiT1hhWDFkTmNzZHNIcmJmS0dRT1g4UVhoeExyUk8velBjeUEwNDl6aGJE?=
 =?utf-8?B?WkM1RDI2ZVNUSlZlajlweEEwOE8zMjVUVTB5cHhVcHRnOFJFbitNRjhFc2xC?=
 =?utf-8?B?ZjE5ZjJ1YlNRNVlrdG1MemVGKzFzSFhPdEs3c2IyYTRJNE9OMUFjNDlqZXZZ?=
 =?utf-8?B?bklUVTlLRmFFWXJwL0NBSXE0a21ZWHViRVZDbjdtdFZHZjdvcmZERVp4eUhN?=
 =?utf-8?B?OXdwdjdXR3Z5WmxmblBWWkV1MW51ckZYdnJueXZmdUU2b3QyVStRamdMbSti?=
 =?utf-8?B?YitZV1BZU0djakJZV0htdWN4WEptVEQzRWJKeFRsRnMwbU5VTmFvR0tMOGkw?=
 =?utf-8?B?dndHTlBkWjlNOXhrUkNCY1BJK2Y3dmJNa0F5cTNJOTRwcGRTaGw5YldLS0ln?=
 =?utf-8?B?aHJDNHRpS3pHZ1VTdEhMLy9zdWtoY1pKSjF4N3VtL2ZFTlFSb05KS012bHhO?=
 =?utf-8?B?RFRheTBDc05ZcENrekdOZ051RC9tYVYxTkZDUEpzc25FSlNnamNpaVZNVTdo?=
 =?utf-8?B?RGdWWUNPbkkvekpCZkdySU9SM3YvME9mM0MwS2lLS2JveFlQZFVjNmZGS1I5?=
 =?utf-8?B?ZTN4Y0NwV0t0NTRUQ3BRNVJlaDd1TDZTWlo2U05MTkVsWkU5OTQ5aXJlZXVJ?=
 =?utf-8?B?SjRvKytkTGtqSzN6aVpXNTdHaWdHcWgrWDhHR0FLbWRxQThZeERPTGtPeVpr?=
 =?utf-8?B?RjhwbFFxa0tjNXFIZU54OXZIcnhZNm9FTkNXRzYwVy83eUtodmNTbXY0UWJa?=
 =?utf-8?B?NEFMRDcrdUQwNjJyZ0RrdnE4dCt0T1Y3RDdGNXhtN2VaUUxpWXdtd2pXc2Qv?=
 =?utf-8?B?K3I3L3N0VlZaeEFmeHF3cGlWY0ZQZFRTQ1I1TVZXMmIxZDRJMEY2aDlRUEpr?=
 =?utf-8?B?WitnSEpLM0M0TUw2d3AzSEllc1VDNjJNaU9adGhPNi8wY2ZWdi9wc08wQkgr?=
 =?utf-8?Q?ps+tKN22x/g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDZNcnNWTGNHYVUxeTJBYnVOVzVZVWRZRDVyakNWZlBJZlMycThWSUZjVEJQ?=
 =?utf-8?B?QjRabXVVcWswS2NXNmh5bjdSMlZNY3pmVGJJSHZPakcvVkxHcStUQ3BuWVY4?=
 =?utf-8?B?Z0QybXpZTlV0ZFBEQ1hGOUliYmdsVkp6Rjk4QUR3aTdqei96MkkwY0ExMTY0?=
 =?utf-8?B?UlhoNzB6ZzM1NThGWllVS0s0ckJNanFGS25GU3JRU1dWZ3ZoVWI0MmJ1VHRK?=
 =?utf-8?B?MDJSQmlFMXVQM2dBenlqTThhYUl6ek1xa0xWSnlTNGhFMkMwaEROZ1JTWVhm?=
 =?utf-8?B?Q3pwMTNEVnVUT2RuaVVoWElmNlFqU3FDTGRBam44REc3SVdmOUFEYXY1RGVY?=
 =?utf-8?B?Tm90RmJwcHR1NDkvR2hRNWJHTlVGTGNjTlVQcjE2KzdUb1dFYXBFaXFuaUV2?=
 =?utf-8?B?dTkwWG9jU2wxNThVNERYWC85K0lnYVlLSUR2aS8yZmNLM3pNZ28vRjVaUWxQ?=
 =?utf-8?B?ZzRrd2NqcHJ5cG9Jb3hnNDJpZUhPZzRUVE0wUjBsU0pySzcyc2Z0bktEZHB0?=
 =?utf-8?B?ZHU0cjNXSjZYbUhPcHVUOXJlc0NnN2hqTW5TaG1PT2poM1h3OEFtTVVoNHpx?=
 =?utf-8?B?ckphdDREYS84OTlNRCtDazhBeThnY1RVaEo0bnkxN1N5QTJFaU5wNHVYNFdQ?=
 =?utf-8?B?RG1raDNYMHBPUWgwOUZhdTlDTmozc0NwaUxjSFMvN21VZForb0VCVEI4bmdT?=
 =?utf-8?B?TFlabEwwNW90US9PNzlzWWFjWUZIYlVHRWVtUDVzRFpORlFsOGQ3OGVUdFBs?=
 =?utf-8?B?MnBIeWh6dGs3L2NCNGlkVGNONkl1bDhsYyt3WHFYNnV1QVdtcnpVcnVZaVg0?=
 =?utf-8?B?ckFBUFV0UUhldXdOR3FFZW9zZ2xhZHcrTFpFZTl0azZ5SWpYcytOdmF4bFFu?=
 =?utf-8?B?T1BSNzhzaXhWVnRmVkUwZ3I1ZXo0dFR0Z1hpZ2xpY1RCb3lDSHJGRWpwWXl1?=
 =?utf-8?B?L0NSQ0J1elE0eWRVbThXNUJUWm8wWVVHOUkxQ3lDZ0xCeFQ4Y2lUK1lYejFr?=
 =?utf-8?B?cFlkRC9uWGxrZ1lKTUxFRlk3cHA2QlZ0akhHMXFEcWhhUHk4YXJuUGozMjBI?=
 =?utf-8?B?R3A3OXhKOEoyR0hzWU1HNEh2TjVzd0NHbTFlTTVjcDlXdkk3a1ljUHpWeUpa?=
 =?utf-8?B?aEVPOHArbFg3R3VOb0dCVFlNeGRPZWwrL1g2WDVwL2VyNW51MjYxdU9wQkFh?=
 =?utf-8?B?dUR4SytwS2swMFUxeWtLUlBuT2loMFBBZjhlNi9tcis2NS9XUkhIdVhqbTZl?=
 =?utf-8?B?M09ZY2xUc0xudzI0S3ZaT0FMUDVLV2ltUSsyVHhOeEdXTTVoUTZzbHpCM2dY?=
 =?utf-8?B?U3ZZblJyRFlRMFE1cWhuYWU2bUtKUEVSMzY0dGFyWjlrZURzRXBLaFpVRVo4?=
 =?utf-8?B?ck9SUktWOUNSTmx3Q21XbisxVkh4L3VVSVF6eW5EU045NC9CZTl2T2gzQnNy?=
 =?utf-8?B?NlMwc2dENEdhSzRUTFVwMDhITk9zemlidVRiRlgyOW5UMTdFSFMvVngzZjAv?=
 =?utf-8?B?QU5TUFIrR2QvREZjejFHeHdReThPbm5LSUhxOHJOWFVzVmU3RWF3eW5zZjlv?=
 =?utf-8?B?bWt0TTJLbXRXcEZ3MGQrM0Z3MU9NT3pNb3JJbC83RXc1bnQ3SHBoaUg4eDdS?=
 =?utf-8?B?UFN6cHpLQmU3ZDFMSGE1NG1wTlVqa2FmNXRpZHRpYnlCVGZQK2xqdGlpM2pH?=
 =?utf-8?B?MkhmMFRGNkxoWGNKZGZWaFFXQTllbE9pNHBNMENlbkNOTXNPajYxNERsdUJz?=
 =?utf-8?B?aWQ5VmFkNi9BU2Z6VGluUGNrQVFFbStISTd6dm5Qclh1NVVIWlZjcS9CNTFu?=
 =?utf-8?B?QXNGYmhITmFoT1RJTnpjb3pOVUVPeDFWNFN2VmdYUHpIOVJyZzdYRnB6VlNV?=
 =?utf-8?B?UWphTTBLUVA5WjZYeGRpK29zRjIyZjYzRHV5ZU10REJUQ21mT25ZSjI1Nmha?=
 =?utf-8?B?ckx1aGVFcFd1cjNhayttYnVOTDZaTlBoOEZ4d1E4ZHZpL1JJR2JCYTRMdXVS?=
 =?utf-8?B?Uk9acEM3SjhxRVJpY1BzUW05eDFyQkI0VlF2T092V3Y5Y254bFpzL053WkpI?=
 =?utf-8?B?OXVZMTJZdUdmdHVablAvcnRPdjFxdFNKQndUT051THo4K3JTcnNaZlc3VThk?=
 =?utf-8?B?M0xja3lDdGtZcHcxQkxVRksybk1BMldSWWN1Y1lhSitoRWd2T3FJeGFmeGN4?=
 =?utf-8?Q?oX+TB+FJAQPXipUp90eelTeu3cELmF+FcnQVIGrso+CH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc113d98-89e6-41a3-1b9f-08dd78fc7622
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:26:26.7134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sM6myQ+v344Q2GrBstt7Le/tQoeT9zeBYS6ievGBxiKqakuZCaICYSa+BOmMkZ52NGgr/tjLnIIqlaPYerOaZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7717

On Fri Apr 11, 2025 at 10:10 PM JST, Danilo Krummrich wrote:
> On Fri, Apr 11, 2025 at 09:07:26PM +0900, Alexandre Courbot wrote:
>> This enables the creation of trait objects backed by a Box, similarly to
>> what can be done with the standard library.
>>=20
>> Suggested-by: Benno Lossin <benno.lossin@proton.me>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> I assume you have a specific use-case in nova-core for this? For this cyc=
le, can
> you get away without having this in nova-core?

That's correct, and our next nova-core iteration will likely depend on
this to provide some basic HAL. If this cannot make it for this cycle, I
guess I can always use Arc temporarily.
