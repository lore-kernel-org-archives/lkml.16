Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B8A1B4139;
	Mon,  2 Jun 2025 01:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748826815; cv=fail; b=N77gn7VEx0psB8yCfI+i/n2v6bAcRNZiBBe6SZPQEfx/cbW02ZJ1XHPaOR7em7GC7O/aeOht91gWNEd3669VkPXjP09S5EH/SzEIdqoVO9nYYBiETcXcfCa6t4utehKuYrYSi5tmADcR5p++WcHu+de4aR7EokDETW240feWHa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748826815; c=relaxed/simple;
	bh=DuyN8uda4kbi4CnQ9zIIiRFAcCp0ms3VgIwSZL7UlNA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WXPf/o6gUogtqenTttxmgU5GQfzmB7FamXIMaR1t598KYL0Y1pkxTWQVg/hglqPhqJAELyh7SP8cINr0IiOXTLxI7VCYzuY6LumITdeVtZ+8Iz93HBX/3WvF1GL0Oi2bhy1M2wjGDHLbF0Sp2ZIngYe9PHN0eMq66Lu5tXXeJMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LSiAl6ca; arc=fail smtp.client-ip=40.107.244.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LSiAl6ca"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAEUd+wxF6VSBi1m9PLl1yiLXulnRS+OJG954MuXD4Res1oOnb1fHyfxTfQUmpV8SoJf8hOOG2b/9ARPF+RUTTmZ5MAA3yynlbbdvrNi6x5/6s3FhAlcrLA0sRPz2kzNFwy9kxRRztIqdjz0uSmBdoFwT0HJKNReTgq23kyuOEoN6o1M4NhvrOWZ3XnL+e29ToqxijUCIPTe6xLph8/R6UCpb8hHT7GUsp+PrR4Pg0CVl+EpoDNE3WWrhrL98ksFEATHayBgVq2/Rm6VhHDLaFVx+xQjwASpesS7EvPbgVfrw5Y5jKgEJUE3Cce8rzMm3tQRdDB8pyvOMvyDbbzCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2+PG/mA9q2S7qlGgEgpeeCuNp2xfwe3JNzpnaWI7Qc=;
 b=eRhT/1rQ3/mj74dDL12bXycfj8tDU+50z5YO2HTjqf4eDNyYlqFhTCHs4Q47NFyaiehGVMwhj1kRZP9wmNqHCDm3Lyhxa+IENWOP6hGesHEyb7zUJvA4M2qgAoptLINSgwFv0j/32XmbRapL8162yCwUkojb0udhT//W4QV9yAbqu8YKmy0pvcm2RI/KHrvelUrKP6ddwRysKSfiJ2NwiyttdmPf2xCER19XXbhy8+K7LOEybm222JFQlt2Q2ubnQm4hMq4Z6QTswqPpw9Mg+8RH46Nt9MY6ckSncWIzZ+HAbDHWWKZp5wobvaVKPpn76bvdLW1NFaNemcB2K6ttyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2+PG/mA9q2S7qlGgEgpeeCuNp2xfwe3JNzpnaWI7Qc=;
 b=LSiAl6caDD2AEyYZogSAZMckb3FrqgO1Q+mwXg8prKcVzTEE1gncr4n1UNgBdp7qul3tPsGOJKrEXdYYpIsNhWgSAXgM8UwKBhjI8Au+mbt6VsD6UdFlDLxLSXkKBUnTRbqOseO6oHAH/RFCysGXex1NBNfPphndAW5lvH7MprBkiX7VpncZSlA9y5zWQHlr0kcuSDi1v3chwIte9sVXot9dYWB95vwq69yagdngGqVsf587ulyHUPiI8Ac75/BI/CbwOxmOp3RyO4RLlvNk5yhsFOLf9um82HyR/CnAFQ+vFUv2cyQO1htaE+7s50M+oAmsfQm/6vKBcgb8c4+MlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7293.namprd12.prod.outlook.com (2603:10b6:806:2b9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Mon, 2 Jun
 2025 01:13:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 01:13:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Jun 2025 10:13:22 +0900
Message-Id: <DABND24P80ZZ.NLCKU3AYPN4X@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Vec`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
 <20250601-borrow_impls-v1-1-e1caeb428db4@nvidia.com>
 <DABBUFXP4O5X.1JG9O6Z2BRAQX@kernel.org>
In-Reply-To: <DABBUFXP4O5X.1JG9O6Z2BRAQX@kernel.org>
X-ClientProxiedBy: TYCP301CA0061.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd6ec06-b7bb-4cf9-dbd9-08dda172ae57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U21PbmFLejlQdi8vVEIzR0FLc1VyTFBVUy9QZ1NIY2NaSHBiOXhMMUxTK3dp?=
 =?utf-8?B?azNvVllBN1o1aXpHbzV2eFFHZWV3OEZkYk9uR3FXaDRjYnhiZ3lXNUFoVlVP?=
 =?utf-8?B?RnpCanllR0RJQUdUY2I2ZEFaSVprYlpBM3BRR2JDY0R4NEIwZ1VSc3MwME9J?=
 =?utf-8?B?a090bm9RbEtMeFA5VTlSZGNuMGxpU0RkbVNCL3lOSWpKMm9QTVF6TndCRzEy?=
 =?utf-8?B?SWFPZGU2Ty9SSk1ibWZpSndaNFBFNlo2ZTZkL3pwNTZuQXpYd09Oa0pSMWty?=
 =?utf-8?B?OVZ2TWxEVkhxUGZmQTZKQkdUNXdTL1lDZWVuMHVyZTdRWCtsZEtXY0lFZzBh?=
 =?utf-8?B?S1h4MG5xWVdVcWZuQVpMbGZZRVpvZUJZZHR5OXVTVTJmU0ZVOVU1SFRrWE8z?=
 =?utf-8?B?dWczcElDNDgxNFZLOWlWRVV3TVNKRHc4WDJ1ZHV3dGhnSzFOcFJDK3VnZXg1?=
 =?utf-8?B?RFJGNWVTZnVBYU42Z0k2WWVWQk9CazNLTmJtNFArTy9hQXhLNUxleTZsT3dt?=
 =?utf-8?B?VitCZFJ2Q3gwVWdONmdNTGgwUUpPZkNZQzZmY0pldVVVRE92ZGgzQ1hMcG1i?=
 =?utf-8?B?dFpOY0thdTRMc0VIMDlEUlBJaUxId3Bsc1NvZS9hTDJ4Qm9lNnFEdUJMQ1JX?=
 =?utf-8?B?d2VOZnhFam5ZTzlRRFJObWNmdG5WbXZ1REVqUDZVeU1vTzlKZUtpYTNIcmdD?=
 =?utf-8?B?TGE4OE0wZ1BIelBuV3I3bGk4T2NmSGNMdmtlNmFDVFJiaTRBK3k2NWgxdDVl?=
 =?utf-8?B?cjRyZE1JTjJCRlVOZlgzNk1HaGV4blM3VXJBVUtvYzdUTVpZcER2cEcwQ1FM?=
 =?utf-8?B?RVFEUnU1SjdYSGtrQ2hEK1BqQWx0T2JOOE0vdXBKMW1nRHZsckpXM2JLWWt0?=
 =?utf-8?B?YVRDZ2p5Vi93UTVpWm9sYjdSYXZxdUY1WUpHU1ZUS0NLOU5YcGdVaE1JWDVH?=
 =?utf-8?B?K3p5SHIzWWJUWnMvYlB4Rk1FZ05zYStCcHdPcFNGck5odXhKUUVrcFhPOEVj?=
 =?utf-8?B?NTRxT2pDaXhjWENETzIwYzVKN2g1K3Y2QlRKcmZ1WHBobGJtK08yOW5hY29p?=
 =?utf-8?B?S1hnWjdEU3hVdC9iRWREVE5LNlBlRU5wM2VsbmJJMndQR2JpYWpsYlBJaU5V?=
 =?utf-8?B?WndZYVN6cEdzak95U3A4dzFhcTJ0SkxFNUk0NE0vMUxkdC9sVXdHaHpSbkFE?=
 =?utf-8?B?WGtLSDdqREFJUURBTVI4Q1VRaEtNcktxSTd6Yis2UEYwQTFRRlJTSnkwY3dS?=
 =?utf-8?B?eFhtcjFVR0FQZncwSk1tS0xMdGFqMGhkMC96bnJaUy84cXBrRzN4ZmtrWVlp?=
 =?utf-8?B?TjJ2L1h4VU1kcmdtMFRBdHg2OUd2a3Zyd29VM09OQzlTNEZ2a0ZDOUVPc0ZG?=
 =?utf-8?B?SlBIWTUrbTRCNlBIY21QdS9ZbWFyOUMyRjFRUTl0eC9SN21MeUJQMXVvYlNG?=
 =?utf-8?B?RDVLL0dpZmhYUXdpTUFLZXdRUTM4TU1iS1NBZFp5czQrU2RxZVpjSmJWaDhv?=
 =?utf-8?B?Z3Mwc2dOeDVnWXlaTDE3YW9IaEJxRTFZbmdMUEp3YVR1NVdtbVdMdlV1QzNJ?=
 =?utf-8?B?ZnFCYjAyc1hGY0xhVUFwTXJVbXlDSVNiOVBJdVlDbTdHZ3l1UHZKTm5DTDU3?=
 =?utf-8?B?bnIySmlvcGJUYTkvQzkyWFlUK3pZN3dNVHBBdWRTSHBrdTNXNWZMWEpxdDND?=
 =?utf-8?B?bUtKRmJoUEJlaSs2UVpScFhRejVWalE2bjhwc3dpUS93c0h1ZXl2WC8yN2w2?=
 =?utf-8?B?QXZEbnh1M0FWelF2TjcrZzNQYk5Tb0hJZ2c5Vi9PYmhnU1pOamJJQ0tMSDBh?=
 =?utf-8?B?WVUzd3ZHdEFqSUZKbkNRa0tzVy9PMDBGTkVmUVg5V0hVMUNkWW1WSEJiSEds?=
 =?utf-8?B?cFU1YjY3dDJUcGwyVlN5K3lhOFAzY2NaTXhXOVpPQm1Vd1ZBZnV5RWRVMElq?=
 =?utf-8?B?MWxiS29wdmo3VzNydW83OU1YcS9SSm9ZNEVXMjF1L1d5ZGtWOHk2MkJhY3dR?=
 =?utf-8?B?anUxMEZYQ0hRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2JWTnExeXZIc0Y5MWd0RGJtQVVTMHFkM1FnM3h3Qk92VlNRQmxIS2s1SWhn?=
 =?utf-8?B?VFRibVM1VC9VbzkyU0pCanBMdkI3QWJPRlhZWGQ0WHdkVVpTT0xaRC9PcVpn?=
 =?utf-8?B?cSs3bnFYaVc5Mk9yQ0gxb0ZPQmU2YWF2bFp4QTByN3kvWmdNOHYwU1RlSk1X?=
 =?utf-8?B?U3pPRzJONW50VkFzQnQ2OVhSaFcvcmJsT2JpeHVQd3FCbC9WZ3NsSkxDemd2?=
 =?utf-8?B?UGgydit0VlNVZzVZdHJuMXh5Z2FwOGlaYmszdGlQN0p6TlFRRk81bHpsQXZk?=
 =?utf-8?B?cVdneEFlVDVPZEdkdjB4OWRjY0F2NS9rVlk2QkkrRTRtejBQNmk5WFpqQnFr?=
 =?utf-8?B?UUlNWWFlb3NNSDVRWkE1U1ZZU1pLVm9MR0toU1Q0RFBDWG0zK0grV0NNc3Jl?=
 =?utf-8?B?a2JnWE03RCtrTHd6TGN1SGZpQ0lqVVo5L0orNENsSWpwejVpOUlBMjFGaEQ1?=
 =?utf-8?B?NW5MS1paRUVGdlF2b3luWWhKbDFWV2hSMlgrNVZiL254WnBJaGVxTnkzcXMr?=
 =?utf-8?B?S0xMamhkTFRNVFNZUG14a2xpZ2lISTBkRWdkSk1HempzVHNKT3AwVW5uZVlH?=
 =?utf-8?B?RG1ZSTNjMDJoNUJsbTFkbUI2akVWWUlEVW8zRmpaWWtRTkx6aUJHNmpEZGxP?=
 =?utf-8?B?T2ZaVy9ONEdZeERHbC92YmdPYWtXMzUrcGRURGRuR1RZdmpBMmpzOSs2UVE4?=
 =?utf-8?B?Y0FoTUM2UTIwa0RpTHEyVEJNM2srTXF6V0l1VjdXWTQ2a2w3R3JZQ09aT1U5?=
 =?utf-8?B?ZUNBN3FrUzBSbmRvQ0ZwZGN3R3ZjemhJeW1iNGdFU09yZVI3L3AvWmRKa0xY?=
 =?utf-8?B?bWpjOUVJQjlhZEFZaXpjQWE4Z3NETjlMSWpla0xHNFArOE5LMC9IV0gxMlVt?=
 =?utf-8?B?NkQxNWZOSE9ndEplcVdZb3pZMGtYU0laTklHcnhTUXRBamNmRVFZanFEclJl?=
 =?utf-8?B?d3VkaDBhQXZsWW9NNHFsd2MwT3VUUG1BMU5pcVZ0VCtyNEdEY1JPZGlwMXpB?=
 =?utf-8?B?OWVNRDhMR0VSaFJvcVZEZWp2R1ZTSzNSRHp6cjQxQ2tsVzdWZDBDTzViMG5l?=
 =?utf-8?B?R0lUMkRqeFEwWGNRK2JXZmNpcXduR0hBVXZRUmhBcW9UbHphQXJiVDRWMnRq?=
 =?utf-8?B?Q2VhaEZEQUJtQkNqcXY0b3E1YjdyZDhLWTQ5QzlSSzFBdWp3WVRPT3ExTWJy?=
 =?utf-8?B?Y01SdkJ4bFUzQnZLdnFHcEhrcHh2dTR4VGIxNFJYZ2YrTmZwdUFXMWpGQmxq?=
 =?utf-8?B?djFxUXdyM200S1JZK3NrS1VOWlgrZU9LZlhZVEVRMnNVNitzV0J5U0liK25O?=
 =?utf-8?B?Rld3eGFFaWdidDdNaHdONkdKeFFldzk2Z2V3TEwvZVVJWGJNWmkvR25uSy9N?=
 =?utf-8?B?dGJiMVlrZ1ZZNlh6QUdTN2t1d3V0eCtWU3J0Q1F0ZVIyczI2TEtxTDV5SkNL?=
 =?utf-8?B?QmVDTmxsbW9YckJncTlNQnJlNkkxdVJLa3cvMk80U0xsdG9zVms2TkRuNHVr?=
 =?utf-8?B?WVpRS0NrVTdJUFdsNEJiZlVSTkQybUtyZG5pVTFqVUVpbTFva21FNnBHa0w4?=
 =?utf-8?B?NXl1RVJKL29kTkJrUzhsZEcxUlVGMWVsV2VCOHRMdDN4SGZrcTd3WGREcGNM?=
 =?utf-8?B?VXU2a2RuRzdnd2xJYUFUTVp5bytQT2lQd2k0MUJ4bVRFMEdBS1N6am1TU0VH?=
 =?utf-8?B?V0RaWmVQR3d1ZVlqdW9UK1NnejgreHhIY3FIWEFyZGowaHpnNW9Mc0U0OFlR?=
 =?utf-8?B?YXhpTk5wUXdpR2Fld1g0WDFRZk85KytSSDlCUzBkSXVWS1JhUlB0TExRRlAz?=
 =?utf-8?B?dkFGeFpnYXdGU25XVVR0V0ZQVnNwVk95WFdQOUlkTjIrTEphc1JwdDc2c3ls?=
 =?utf-8?B?dVJxSU5iNkE5eTRhc3llZFFjeGZabFlIVGZtTHNXUE1EZ3g1TEFLandHeFRG?=
 =?utf-8?B?T1d1Tjc5Sy9WT3lmSmR3aEFKMnJUMFVaVDc2VjNYMGhQdU1MSHRWUjJKeHdl?=
 =?utf-8?B?Y0lkdnpSc2tRTnBicUY4akQ5NkNpTGM2Qm9ZVW9JQ1VzWXhTc2ZUQVhrOW1y?=
 =?utf-8?B?TDRsZk5FKzRLOTRQYXZGaXpWZDFyc2w3WmJOdnhzenUvbHo3aUYvTmFSS2Rj?=
 =?utf-8?B?SkJudmJYUkZweFFCUUxnZk1iZGRNREc1b3NzS3VvNWt2QXdtNlhNa3duK3Zl?=
 =?utf-8?Q?s2zWdx3800e7NwSdrakIPvnUyR5chkxL87hfQ7IwgC0j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd6ec06-b7bb-4cf9-dbd9-08dda172ae57
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 01:13:29.6980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95MURFbTbX+r6cWuT6WR0dYX6ESsMTtVHy6tK+o32U5euDfgjzWVXL47htV6Kr8SHnYGIfBtpPVMtTaOMFa4aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7293

Hi Benno,

On Mon Jun 2, 2025 at 1:11 AM JST, Benno Lossin wrote:
> On Sun Jun 1, 2025 at 5:00 AM CEST, Alexandre Courbot wrote:
>> Implement these two common traits, which allow generic types to store
>> either an owned value or a reference to it.
>
> I don't understand the second part of the sentence.

I want to say that Borrow allows you to do something like:

    struct Foo<B: Borrow<u32>>(B);

    // `foo1` owns its value...
    let foo1 =3D Foo(0x12);

    let i =3D 0x24;
    // ... but `foo2` just borrows it, subject to the lifetime of `i`.
    let foo2 =3D Foo(&i);

And the implementations in this series also let you do:

    // `foo3`'s value is owned, but heap-allocated
    let foo3 =3D Arc::new(KBox::new(0x56, GFP_KERNEL)?);

    let j =3D Arc::new(0x78, GFP_KERNEL)?;
    // `foo4`'s value is shared and its lifetime runtime-managed.
    let foo4 =3D Foo(j.clone());
