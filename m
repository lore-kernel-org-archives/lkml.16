Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F45917BA1;
	Sat, 12 Apr 2025 01:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744422743; cv=fail; b=ME7zsRIlHht8AYj/w0WIJmkUAbEufTUCrZhYylRAj/lUvHkBOQEOpa5aKrw3gT25W4RAUn+WyR3QbY+uccwiC9EHBBdXH8gColOgiVYJlqKqUWH4D1SK4roTIZi8+eXn3TEU7Xm+2JBKQyOa2+Th3PvbAzXA/kfjQEKAbVpgeyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744422743; c=relaxed/simple;
	bh=1vN5P3V/P65D6InnETE3TVU5id6nVEJZYdCha/ytWzE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=UQEp8yxxARjTXTaQCZnZI4OaF0LAw6kUy5tE2fF3o9vsokyStU8JHE7oKmQyG8Oq4ihgsymf0vLoHuyMKargFRp+WwwkP+YOh69cPYjsEdbjpR5WgTQSffaWvbxgzOJZ3JSMAoCfrfDkPkTccnKx6WTkiPYnycnIVepJna40a8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MaU3nMTp; arc=fail smtp.client-ip=40.107.92.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MaU3nMTp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgUVCpxqfwiGgzGBZMCLChyoYO4oh85D1jcHBqexr9wF3lGzPR7vi/w6PAvo88tyk6yUZgPrN1eO5IyIsk98+zJOCcmsntP+bVpWF0TqYYSk2lYGE5ASb5iWYvdnCqmU3fqXPAGp5ixAbP5fdNZFoAHjvBvm/miCd+4rK50l6ssJ00TcBhIQ12N5T4mLb2d1Unhu0vszghwdckCkIf8GolQDBK2HcJ9TUyhdJmS3uHm34+SJu0fty2q6tgxk6G7ecrB27gmbgSvwDEuWmUlXPBZSLl5LJmKDxe2w1QrNXOS8rHbUdjLOJGg7ZAI9jIusQudUhPdkDZE+bY+QZpr3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vN5P3V/P65D6InnETE3TVU5id6nVEJZYdCha/ytWzE=;
 b=NhVlZccZV2/btTSZiYEIA9PIMxt6/fhcb3yaafqURWH6xQ/qGWhiRheNZSkyUsUgTqqrIjbOWFDq9FXgHxhlSTMP4iZ6UIMcBn76G4utgwjUZiNjl1+jF7NL21XWAWQfjZTpFRQfUYSR014z1rq8Vrs8KW9EPkl6LGZOK/iIHBfgm/+RhPPBmyDOVHnPqR1xQhZNCqmroRg/ha2XBXqtBC9wRsRG+o9U2JW66PtrBZoSLDgs4hrzDtKeKcPef96mlXCNUumSU5swRh1bg/hw1TZNAuXT3GQ6JXSrPfAodDwTxTXl2UwNpIj/Q7ljN/Fz+DThnxKatEr3p3fWfcECbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vN5P3V/P65D6InnETE3TVU5id6nVEJZYdCha/ytWzE=;
 b=MaU3nMTpypCl3Ykvxuzew4W6hBjBGE6mqps23E4KbvO+TfroHjDk21MwlMoyCn9Tt0D/hCh8o4bIbTmhOAL2XQd/yo+SeSfK0GY2lLoupo3oxHm2x6Zsei8kFFyv7Fg4xM2DApzMKnWla8HJyIdb6gH3jx/xhxvC1Jcy/57vgrXe3LfZqAADEUKmaiYvOsT5+H3GfOwcWlFjP0yvEqOfea/u+QTYAUjhcX9NqyAgkyFDeZF84qmJuPVakTaCJwgdHS4pDKrEq0+PctaH1uoazrl78tGaDaiW5IwKFR+FBqdL8AE5gSZiwxWlVbntzyjUkjscUSDEn6ACEK4IMfrYVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8980.namprd12.prod.outlook.com (2603:10b6:a03:542::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Sat, 12 Apr
 2025 01:52:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8632.025; Sat, 12 Apr 2025
 01:52:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Apr 2025 10:52:08 +0900
Message-Id: <D94A8YFTQQ7Z.3RSIVKEESEDZD@nvidia.com>
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
 <Z_kUyx8ytlac1d__@cassiopeiae> <D93UDYZH7A8F.1FG8EIW013NKJ@nvidia.com>
 <Z_kltpjo9bn4ah-l@cassiopeiae>
In-Reply-To: <Z_kltpjo9bn4ah-l@cassiopeiae>
X-ClientProxiedBy: TYAPR01CA0016.jpnprd01.prod.outlook.com (2603:1096:404::28)
 To CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8980:EE_
X-MS-Office365-Filtering-Correlation-Id: 7546a211-beda-46ea-b875-08dd7964a515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlVTWlVLSm9VMlRicFYzWlVwV3lwaTkybitYYXpXRmJLbklQZWhsSnpkb1dF?=
 =?utf-8?B?SUpTaEdwMGNDZVV5MFcrMDY0cnNIZnRqaXowSFdjSmdFZjJNQjM2SVBVdjlH?=
 =?utf-8?B?VTBjNXpBQ0dMQkVYYURhZlYveWtFMGRGeXVJeVpXTGhaSWMwOXNtemkzcHBE?=
 =?utf-8?B?V1FFalk4MFBZempwb05mYXRSOGtYYnd3ejhjdmJ6WWlBZXRlM09kTGJNOUhB?=
 =?utf-8?B?OFg5NjRJWkpRcWtFcmJTWlZSdHN4SWJxNW9ERzJvdC9uZHEyVy9NQ2tnY3BG?=
 =?utf-8?B?NlZXbnMwMUwvZ29OU1ZqNVNMSU9CTmlFVlhRK25NanBaNUJROXRYN0l1dHNX?=
 =?utf-8?B?NGIzMUZjV0N1Z0MvVXFpNG9raDhrL0NMMWZPcE8wNmxDcUtRVzl0Y0h5S0wv?=
 =?utf-8?B?RHJ0VmY1bzYwRnpwR0ZLYmRycElVK21McjM1bWl5WEhZR0JyeFpUZVN3dmlp?=
 =?utf-8?B?RmpseWg1anlCUzA0VzRHajNuZ3ROREZWY0VhY3ZrY2VBZ0ZMMTdkemdTMXVL?=
 =?utf-8?B?eUVwR3p5REJwZFJVRitweFlEWVZuUXBOcU5XN2xDNEJ0WXd5eDI5OFhNSTJ4?=
 =?utf-8?B?REZHMjhFKzJsQ0tBNWtLNTRuOGRkTzRGNTFQdCtjT1NJT3RydmxNZENaOGY1?=
 =?utf-8?B?UlYxUWJrVFp6cllxZFhzeWFTcndHT28wZTRxbVlUalpHV2RDbDdSdXpqUmE0?=
 =?utf-8?B?ZzR6N2d2TklQYlVGRXlqOEIwTXpjUlp0d1pqeEM4SjdlTmJOVzlWbnRQQWRM?=
 =?utf-8?B?elcwcGRTMFNZSFhTZlppakhqWGFWVCtmT1czS2JFZmJJRmwzVUtyTU96bzlF?=
 =?utf-8?B?eGZyWDJWQVhVZVg1Vmh2VGc2K3NEL2hzVFV3Q1o5SUhlSHMraWdwMVpTMHRY?=
 =?utf-8?B?cmJPdGpIUi9xR3Z0TUY4aGtYNWdTR0FZSGdMeW5VRlBmZlc1UnV4UXJ1bTV6?=
 =?utf-8?B?Si9yNWZNV3p4bURUQlVWb1NmNXdtRnBWdms1WDVZNFE2NHF4OXNzWUkrTXBv?=
 =?utf-8?B?S0pVTXFQcU9JbGJiWlhBMUlreVpTdjdKVTJVdFJvUmo5S3QxWnFHeExtbnNE?=
 =?utf-8?B?Mjg1TXlQdUhXZ0U2dGhhSENvMHJoQi9WY0Y0SjdtQlBSYXdiL1ZjaHJacVpw?=
 =?utf-8?B?bXBnUXByV0lBeWZuREFKeDV2M2crKzJYSkRyc2JkREVla3o0RjhxNk55S2dO?=
 =?utf-8?B?cTE0Q1NBMGxIODgwM0psL3IzNklHY3pkZ1NiTG00SnJhalpzc0NaRFREd2hJ?=
 =?utf-8?B?SVZVSVNMcjdEVmJSVnF1bUl4WktjV29lUzJEOWZwVE1ESUtkbjlvSUhGQ09F?=
 =?utf-8?B?Y2pKZEdjSzdiVmN1dTV5UEJsWGJIekl1dTVMYkZrMkNDa2RVODkxZ2ozcXcv?=
 =?utf-8?B?YmZFQUJyYkhwNGErMjJCbmVJZXdTWXJhL1ZxdnRybVlCRkhUODQ4S1lRNlhB?=
 =?utf-8?B?UTlQeGtRZTA2SDV1a29DdldiTzl1L25jRzlFdUMxQ0hlRUNpVGNTb0JOWTdL?=
 =?utf-8?B?SGF0d3E0elJ6bEc4bjRnMktKcDRST1RKYkR2ZTBCK0NEaWtrRm1SeFU4QSto?=
 =?utf-8?B?cUtjWmozcld6RVdLd1FVUkxZaVliTmRaczl2czNUQk92Vk56aE9sY2xRUHpm?=
 =?utf-8?B?UkpVUUVEMTVIMDZBVjFQUzVIUzdVaVVRT1R1OW02U1lyNTV5bFVGcUtFa1Jv?=
 =?utf-8?B?UjNCQUpDbjF0UGFMNWVkaXhEcENDLzJza09BQ0FFeFpISUY3Um15R3VoaUxN?=
 =?utf-8?B?VEVhMGd3L1ZWUDdKdjRKYU5QY0xRSnZFSmJCdTV0U0Y0NDcva0w5b3d5aHM5?=
 =?utf-8?B?eEdGa3g1SXpuUVVZckZucjBDRFFRN251ejA2VC93WkFDL3o2NmVqL2hGZ2hu?=
 =?utf-8?B?TlJwMUo2WWRJeWF4TnNUMjFJVmg0ZE5ONWlhVVM4Z1B3R3o3Vmt5eUFyVW9V?=
 =?utf-8?Q?hFsFLTEtEJI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2E3ZVZldWsrdVRMVVA1c0I1S0h5aHNDckcyZ2JyY1VJdUV0L01CbFdFSjZW?=
 =?utf-8?B?MjRoUUhxMG9XMkdGdFpFNEk4cUU4ZHZJaEZGbTFHcWZCVUc0bWt2WlhUamRv?=
 =?utf-8?B?bGVLTXZ1d2RTN1dOZ3ZMNzc5TW4reVF1b081RjVXc3dlSXM0K21ZOUJFNEpZ?=
 =?utf-8?B?MytjMTlEMGNpRFoydjgvaE9neXhGYXVYRUtvTTdBeWE0ZWVNZjNDclNWdGhJ?=
 =?utf-8?B?aDBIU29xQys3VjVYM25kc2cvQ3p1OVNpWGM3UHhUWW8yc2N1SktpakVKQ1Zr?=
 =?utf-8?B?TkxaaXkxaEVtb0FrdkRDbDZrU1RRdXNCVlhMbFN3aUpJSEpuMzV3MjJXSmxr?=
 =?utf-8?B?bWFTaG5ib3pEOGQ3SDhpV3hDS3VPM1FzaWFsT09JVUp0cnFvRmxOa1orSFcw?=
 =?utf-8?B?ZG5Tc2VEczY2YTgxSThvWDJzeG1iZU0rTWR5Z05URFZMTWMyMVJkUzFWdFk2?=
 =?utf-8?B?dDRWZWhjMm9TaXNSNEZhbFRxZzB5WXhUbmdrWGZHSStZOFRGZThyVzYzWVZ4?=
 =?utf-8?B?d2JLWVlKU1p3bnlkZEk1bkIxekxCV2tqRm1Db3YvNXJvUFVaclZlcUJXbFRv?=
 =?utf-8?B?NERKYWdmZnlJaDd2TkhMd2pnTm9DQ1Qxc1FaRHYyS01xQ0cxU3RIeENHckgy?=
 =?utf-8?B?K1owSGczakd5a0dJb0FkVFUzRDVnUEpucE5iT2hpS1dPN0drWUZabEZOSDRz?=
 =?utf-8?B?Yllsc3d4eS9CWnZJd3Z6SWJrWW1NajVDN2lzQlo2OXBMRTIwSG1lNHJZK21a?=
 =?utf-8?B?d2VsRS9wbkk1bm1LZlNuZmxuYU5UclBlWlFrRUwxTDJkeVNtWjdOQkpvTWNs?=
 =?utf-8?B?WU82T0FLRGtYdi93OVR4SFM5aGNjWkUraVJ0dW9IcEpSaWpWV0UzcUVmN0d2?=
 =?utf-8?B?QmRHOGhZM3VxOVZXWGs3Y0lRSWZCSFZ5WC9HMVJ4cFMzelVScG5PQmdFNjhD?=
 =?utf-8?B?K2xYS0JmNGpoWmVZbkFOSmhqWXdSSDNldTVMOGx0R2JqT1kxclMwdzRBSGpL?=
 =?utf-8?B?MEFkajRHTTF2SjNEd2tlS3NUTVlEVlN1YU5kandBY1B2cmFFRkpVUmJsWWow?=
 =?utf-8?B?YnVyZ1N2UjB2WityME1POVlmV3VaVW55R283UmZaejdHZEZ1SDZseTdqZ0xY?=
 =?utf-8?B?ZE9sTG1ZY2VPMFJjZmsxdUdjKzNGN2lTQVZoMWtrMHZ3NTZIYi9Fd25Gc2Jp?=
 =?utf-8?B?ay8yMENINE94TFRGUmREUkhEY1prVzZmbVdnLy9mMjJYVEppYWE5VkU4eHFp?=
 =?utf-8?B?VCs4QWJkeDhZdVJ2UVhRK2VJOWJ6Rmh5SWNwL2gwTkkxU256UXpodmh0Rzho?=
 =?utf-8?B?L3pOV0hlTTdCanRoNzBEc0cwNktuVzVIa2FHYnduUHEvT3lLRXFjYUIrS3Nh?=
 =?utf-8?B?REFXcVdRVTJCTnpGVnV5WmZ0eDVrWURKdTgramFCSGpKSW1Td2x0ZEpwNnhF?=
 =?utf-8?B?NHdpK2pRcTBWMlhVTFo3R1R4eUFXaUZyN21UTGprMjdHQXFvVDFubUlVOWwv?=
 =?utf-8?B?bTlXTGdPSFRjakYyVTlrQUpjVjhsNkZrdnJiejRoajJQd1hmVzBZajkzcGFl?=
 =?utf-8?B?UnMyd3I2Y1BNbUZqK1FpbVZXZDJWRTBSY3JJTTNmVmgrTnAxQ2Y5UHlpa3ZK?=
 =?utf-8?B?YnBBOVVQZzRENCtvUlJoZ1ZhNWtSQTR3N0doeDJjL2ZmcCtFMTMvWXdkZ21q?=
 =?utf-8?B?QUJmenhpd0lLTGxLT0xGNy9ibnAvNlJLOUFOMDA4QlNjaWhhV0wxQ2M2WStR?=
 =?utf-8?B?VFN0VEtzQ2M1TVU5MVRlT0xLaUYxOENTQWk3b1Q1UU5HSWZiY1BOeHh2UWNt?=
 =?utf-8?B?WU5rbC9xUVJHcmFiVlRYUXZ3MTg2azRZMkZDMUdiek9JWkFYdGFPTllZUEV2?=
 =?utf-8?B?WXdMdDZ4cngxdVZqVm5mODJlS1MwelZOSDJNWnBHeFZiRENjbW9tdFdFWU5t?=
 =?utf-8?B?QUhSeDFQVEtLTldyZHRicEpUOE1EZzR4VlFvTTNYNkt6amY5RDIrckpyWlAy?=
 =?utf-8?B?OXR4N0JmeDJORXZydS9vNkF1cUorSUozRjQxdEZwRkJnYnBGSm1tSm1wZnNj?=
 =?utf-8?B?Q05HSHFoM3JaRnhlV3hnQ3ZUWHB3ZEw5UmNHelliN2x3NXNHK1pWNzhJNVdH?=
 =?utf-8?B?RlpVNWJ3b3ZpYUg0Y0QwWDN6WkdQZGtxaXlFYTVsclFueHRnNVVlaTN3VTdL?=
 =?utf-8?Q?mwjwmbVpGv8VlvflUoCggzawGChFUJvRCStLbl2nR3Nc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7546a211-beda-46ea-b875-08dd7964a515
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 01:52:13.1337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nrFKVjrE/pCUcc6zwqwN+9fY15rfzvfcZWF6T7cBPUJwRXSP1oaiethL9Yd1ljee7zuJbm/aViQ+HQQ4f3Sjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8980

On Fri Apr 11, 2025 at 11:22 PM JST, Danilo Krummrich wrote:
> On Fri, Apr 11, 2025 at 10:26:23PM +0900, Alexandre Courbot wrote:
>> On Fri Apr 11, 2025 at 10:10 PM JST, Danilo Krummrich wrote:
>> > On Fri, Apr 11, 2025 at 09:07:26PM +0900, Alexandre Courbot wrote:
>> >> This enables the creation of trait objects backed by a Box, similarly=
 to
>> >> what can be done with the standard library.
>> >>=20
>> >> Suggested-by: Benno Lossin <benno.lossin@proton.me>
>> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> >
>> > I assume you have a specific use-case in nova-core for this? For this =
cycle, can
>> > you get away without having this in nova-core?
>>=20
>> That's correct, and our next nova-core iteration will likely depend on
>> this to provide some basic HAL. If this cannot make it for this cycle, I
>> guess I can always use Arc temporarily.
>
> I'd prefer to take this through the alloc tree (for this cycle), but this=
 also
> means you can't use it until the next cycle in nova. I assume that's just=
 a
> minor inconvinience?

Yes, taking it through the alloc tree is fine, I will just work things
around (or delay the Falcon HAL, it's not like nova-core is going to be
anything useful in 6.16 anyway ^_^;) for the next cycle.

Thanks!
Alex.

