Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474277482;
	Thu, 22 May 2025 03:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747883857; cv=fail; b=I+4DPsI+/Pih7zt9sNVwGSQaUH1n4ONHhFXk2d0nKaz/1B8Cwkr7Yej2wLRt2nwdJZ9qw1tlPpLM40w6RMrclRT7AD3UV9wVDWyWlF3NmiAjURGzXoW7mZCin5fiSSLr5sb8kKnXqVz95uWWZMtLE481LOlmm/ZQQncu1F17jzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747883857; c=relaxed/simple;
	bh=x0YvTNa+tc21vhucOydU6ya3yer6TqYebuPABHrtVbg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=HTUrBM8mtmGxjbGyFLHLeIYlAldZyqY0wxVrScYphPCItlFAyyaLo0pYsMFHxwn7XRragA1Qh37/A8VnJhCQs3uG7UyEyvusFAKQV0PNDdWsB0++18Khtc+Tx1RFajuHqgLJR4vtVgB+cL53OESgtldZO7qCckXUpGw17Z04kEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A7FMx60S; arc=fail smtp.client-ip=40.107.223.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A7FMx60S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XX5NZ1W7Jfu6bNTErlKFXEKaS1YlmFgopX9PatTSjBEqIRz10cF3Tx8Tbq4CgYW7jtChTgq9G/wsuaTChJSrL7kpb/bxfdIv8cjcoO2cFnvN75EjoQAb9hr9ENSaReBTLQtk01OqEy1qe1On9VEZKX7ZyJqa4UlZFgkPEScvYCbsOWfikZnz9zSZyf9bfqvhENBeYJF45u9sB9MpnBaLUjg0J79lpK+fi/GTg4ul48UsrwiVZQqo/PpheDoTK8U5saKyzDrDkK4FvnJabdM+edjTmU6rES5j8ikGEhfQzxrgq5YDPP068OjRdc1bsN5yvGnBYb4CfOFmEYMyBf41sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHQanNTSyXwQdroGRwUD5JkCTnt1o480i97D6HQx5ek=;
 b=wuP4zuc3WmsaFuK6wYQqLxX+8iPXn4R+tzOGghu2ykUtM3H+SYHGbSzmibIuLng0xPypJNFLQZ72pSCs64DRQp5EiVRGIFsUIjFtx6DvitMfDrJfwHPdLi3X3QltyxjPab94wZ60oYX/882YUkFXgmBogdBUv0/RdWMLwAhtjQng95sOxzxM7661PzEchZTv8cj6rhlsEiAMxnsDcFFXnViWtgvgltgp6JOSQE6e13qVyKHBBNltpvzhUBWWldfPSawlfCm9N66a/DD8GVKYZRuqgIbK8kwCXoLKd3V2j3RqgHZUGUdtV5rQ19ZMLyJlmhX38Ny/5CfjTHjgZobl9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHQanNTSyXwQdroGRwUD5JkCTnt1o480i97D6HQx5ek=;
 b=A7FMx60Sqczxa/5kXxQfNnoO7z1zAyFDUdZzb9cquOSouHop8raRSrh27IU7bfLVpI/eJIs9Id2iZNyDpCZ8Cn/Z/4OhPz9YdxBfAxTYnjVdrgXXo9CK068qvTa67Ino1osHwZrvQulAoVR0YqNPoyhNWdXENNGzuzfWGp+BqaXGDsXRlPFW5bySUGoqxqH9jgcxbjaDb7VL+VK1dXK0U9UUHImkgNos0hlWj9DqRFT2MyFYVBctge71IpuyDw/8vGVoGLttMuzv3N4c6QYQjgcHY+ItxjhEyUyXvWWKSwFF3oICY2mBm4GFh6HUUogjH8tJgg1Dr0Nrk5504dk5CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB7550.namprd12.prod.outlook.com (2603:10b6:8:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 03:17:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 03:17:31 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 12:17:26 +0900
Message-Id: <DA2D41UHSQTB.2P6FHWB6TBVO7@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Fiona
 Behrens" <me@kloenk.dev>
Subject: Re: [PATCH v5] rust: kernel: add support for bits/genmask macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250326-topic-panthor-rs-genmask-v5-1-bfa6140214da@collabora.com>
In-Reply-To: <20250326-topic-panthor-rs-genmask-v5-1-bfa6140214da@collabora.com>
X-ClientProxiedBy: TYCP286CA0192.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 3425fb4e-fa8e-4a92-5951-08dd98df2f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1lHTFNTbzh6bVhlVy8rbU5DZXYydkZ5d0tEKyt5VGxiNndxTzlmeVltdnFO?=
 =?utf-8?B?MTdKN1g4TFB6V1dySWZaQlI1LytpVzUrS2ZsU3l3QXBVV0M3Qm45a3NPNFRy?=
 =?utf-8?B?bXlmcmJGY1lWekJVSHo2Mm1BNzkxRFpnQWMyN2NIU3hJVCtjNnY2ck9uZStE?=
 =?utf-8?B?TStyUEVFelMzbGI5SFdOMWlQbVgvaFVLTkkxTVVKMFVEakpRcEtZUjFIeEZh?=
 =?utf-8?B?SjNnTzI3bEU1N3ZwZWdxQTR5VG5IRnJ1d2tYejdkTTVrN2IwZlBJTUdaa0gy?=
 =?utf-8?B?ZUxGUVNqeTBKMkl2RWg2bS9EWVl1c1Z0MzEyNTUzVzFsdHZSY0g5NWZBMTNw?=
 =?utf-8?B?SHZ5R0dTNmN0UkpyZ1JBZXE3ZGpVVmJqbFRUYW5iYjg2T3REUURlT3cwWFYw?=
 =?utf-8?B?eFFiaFh3ZmJsNlZ6b09zQ0U3KzVBaW5xeVNwUU5vRmRQS0RnRWN6bVlTYUlC?=
 =?utf-8?B?bEFRay9YQUV6Q1F5aUdxZC93WGVqZlR6Ri9Ya1J3MWRINTRkQVpSQS8rWUNP?=
 =?utf-8?B?Y3NLNUZQK1BudzZNVkFJYjNaL08wZEpCVzRLMW11ZWc5MksvM2cwMGlZaVkx?=
 =?utf-8?B?bzdWZGJwc1JJQ3dSNWEvRi96a1FhU2dPRUwxNXNubGlNTDRBSWFaNHU1TmQ5?=
 =?utf-8?B?RmFuUmdNaTF2OGpCV0YwalI4QmFCK09Ic2J5Z000NXQ5bmkxZHYvL1BpMmFE?=
 =?utf-8?B?dkw4YXJzdmhZUHFTbWl0N3U4VVZwTW1HM2RPZEYvYVBzTlFVUXVUNDRnVFYx?=
 =?utf-8?B?ckN3eitWZXJtMitBZEpnN2dVaG5GVytmU3BwL0d0QjJ6U2tFdk85QThGSng5?=
 =?utf-8?B?cTl4ZHhiNk96b0J5c25RQWl5UDcyMU5PenNrOXNYOW1qZWFMSFM0K1pyVzdW?=
 =?utf-8?B?cDFKSXlWNXNRR0hLampOYzBTbzhwMmR5UmVLT3YyRnpRcVNZdlZBRkpTNTNC?=
 =?utf-8?B?bkNESXB6MjRVTEpvVXYxUmV4K2w2YlVaK21qVE1PcHdyaEg1U01STkRXWDdy?=
 =?utf-8?B?RkJSQzFNWjZvMVh2bkVvTjFXYTFqd1ZYM3UzZGZjcUZrMUJTcXNVNzM4Vk0v?=
 =?utf-8?B?KzcybWlaT2RobllXWUlRdTlaTitOeXZXc0NUQzVzSWFZOHRhZnowZzlQL0V5?=
 =?utf-8?B?OU1BSk80a0czeVc0dHFXUkZqd2FCT2RCSy8xa0lNN09tZllDMm9iNDVTUVJD?=
 =?utf-8?B?T2pBWTlXejVJM1dNUVF5TFR1eTk3UHRMRDgyaUVLdE1CTC9XTWlob0dkVnAw?=
 =?utf-8?B?TVJienM2c2tNWFA0emtwRWVTNG5mWDZBdEFHTXdFZkx0YkJGb1VlbHgyWGhQ?=
 =?utf-8?B?WWViWEZvdVg3cGV4ODBqZktkU3kwVjNRU2tIV2tobzcwcUk4bnIxVGVhNmw0?=
 =?utf-8?B?Qm96cGVlVHFCbHYxTWt0bFVMaGZRRUs1QlVjcUFJT3V1b1I1VVh0RWhGRzZi?=
 =?utf-8?B?THF4Z0hIMGVScjBZRUhZc25Cdm9ZamxFTDVMS0owekpkUlFXSzc0ZE5pQTZQ?=
 =?utf-8?B?b0pobkhQUWVsbkZLWFdzR0VGMFRFTkkvQ0VqTXFBbXY1SU1TeThHK05RSFl4?=
 =?utf-8?B?NGZVd25XeUd1aHM0c0g5NWZSV3UyaXpFbXRvak93Q1VTeTduQk9keTJsN2tT?=
 =?utf-8?B?N0IxRzFJNDdvRkpMZVRDUGg5bXdKMjdjV3A2dk1BeVlwVkErVzJMd01uT2pH?=
 =?utf-8?B?b0ZGa0ZxaUh3YkdzMjBPTWgrKzF4cGR3OVM4K2VyMWRaUGpEMW92dGlhbS9k?=
 =?utf-8?B?SFFWc0tJR002dzk2NmN5MmdBeEZYSGZwMDRkbFVWbEdpemZPeHVxd0s1TEZL?=
 =?utf-8?B?dVRGL3Vidk9yd0kyVjVhb1ZubGdXc25VVHV1Y3RWQ0tyNWlSWDZseFBGT0pS?=
 =?utf-8?B?V05mVUNnVHQzcysweUlwaktrT3VIZU9CYmZnaDhZbVBoUjh1ZGlnUXpXaitv?=
 =?utf-8?B?M05mRjJEd2pSQ05MWTJnZjhRd0hvblVRZHJGYlNtN2dsMnBLSmx3eDZSR3ZL?=
 =?utf-8?B?L1k5bVJGSHNBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0IyYWg1RnZ6c1ZvNWt1OVVPWGZpa0FKL3BnNCs4MGs0cUl2WG9vNFY3d3hy?=
 =?utf-8?B?RTZWU1RBaExhVUZvK3BKTVBMUkMwRHA5VHdtUG1oNUdVZmJGbFR0bUNPQ283?=
 =?utf-8?B?S0U1Nmd3dUtlUkN0QlBtSktIWFhtTzdoU3pabjF0K1lMWFNmd2pqNnRSMTNr?=
 =?utf-8?B?RGdlanpDd2FmWXlqZXZJTEZOaXhOZUxFTkRHL2xxSHFBM3MrNDFBK2RSUUY3?=
 =?utf-8?B?Rkl0OWpkbDQyajFYL1BVanh3T3ByckFwMXJLczVMenFPQThPajNnWklWSUpL?=
 =?utf-8?B?NytFZStqcndKd0dZaEdyZURBR05qc1FiL0MybGd3dXlSSUR1RzZIZ0NMZEEr?=
 =?utf-8?B?aFlQOFByeGZPZngyVFNHUE9mNXpVMzQrUUxNY0hVdUd5OVlDRWQ4aDNaNzYx?=
 =?utf-8?B?eFBWTFh4c1ppWVJaKzZTY0VTRzkyVlJpSmcwTDRKZGc0bi9lNEE5WHBSWWMr?=
 =?utf-8?B?L1A1aHlNVk1ZNXBraUFUL3ZENXo1Wk5lS0FHOWEyWGt6TkZQTmdJOEQ5Uzky?=
 =?utf-8?B?TytOcEZ0ejhqdjJoTzlESjM2a3p5dnJhSWo5S1Vlb3drd1NWMDVpMnZIcDU1?=
 =?utf-8?B?K0pRRGNSNEJIeW5KcHdpNHVVdkZjRGlYejBYejE0UEkxUEJxZ3VCRDFpaFdo?=
 =?utf-8?B?UU5zK2pRWDVQcDlNYjJzdWdyazJwVXFzNHBnckJBdWNHK2dENHFUVTNxOUtt?=
 =?utf-8?B?Tko4TDBFV0V0ekRXVHhwWlp3cSs3aXAwVXByOSt2d3BSbTgvMDNxYVR1emtv?=
 =?utf-8?B?bTFxTUQ5UUxqc2tCblZkYkdXTjdjT1lYQzh6UmdRQmJ3dVRzVjhEUm14a011?=
 =?utf-8?B?bTl5UnpLSHZHYSt0Uy83VzFBUXFmT2pyL3pmUXRNb1JDWmJ5bGxPdTNRRXF1?=
 =?utf-8?B?ZXdXdUFhQTVNUnhIMnF6Y2tJdG5BTTNPVlN3MHBsbndiblJpSEZrRlU3RHJ6?=
 =?utf-8?B?aFJsNDdtM3N5ZlBtc2RScXcvQ1BDZXdqbWpISjNkeVY4SUJtWWJudUZ3YW8y?=
 =?utf-8?B?bkMybEZWZExONS9yQzAwZlkxcVRmVHZTVVhKLzh3dFZTTTM1SG13ZTdCTUY3?=
 =?utf-8?B?OWxNUndPZUwrcVg4VEs5TGd0MGx3eDFKckFpS2I0UXN5K25iaGV6UDA3Y1l5?=
 =?utf-8?B?VEZ0bHRlNE8rcUpBMVYwbzRMUW1LM0JqTmRvdVJ0aW1rTEJzU0JPQjBncWc2?=
 =?utf-8?B?OGtmMUlwU3dUTGVLdGZDV3ByWlJYT25XOFFFMlIrcEF3aFQrREtzME0zME1r?=
 =?utf-8?B?RjNhSWNVZGMyMVVaUEsrZW80Mmp3YXY4N1puNC9oaWpwQ0ZyS21DeloyUmU3?=
 =?utf-8?B?d1B0Wk1BVVVmVXlJcnFGYmp1YUdXbXVHTXNMNWIxb3d2dUwzcEVISklKb3BB?=
 =?utf-8?B?bzhkejN6ekVnaGJvaFVySTVlZ3VPU1BCZmFiQmlnSTc5YTNndVlUVDh6bmFL?=
 =?utf-8?B?Wm1EdFE3Zm9pRXlyK3g5TWZhZzUvRUNiRXlnTU9tdWFlMEZ0Tk82dXRQWjFh?=
 =?utf-8?B?L2ljcXp5MjhwT0xqWVphK3ZQVkF6eU42Y1crZE1HT1JQMHR3SzlkdmtVWjVK?=
 =?utf-8?B?Q2hkemRIdStrQ2wwS3VuQ0RVYThxd0JvWWtpbzdCenFSZU5mdmZ5aTJ1SnVw?=
 =?utf-8?B?bVlybjJRMnF1MWNxRzEvWDRYMERZVWE1VzdUUnFZdmNTL2lIa2hUbW1BckpC?=
 =?utf-8?B?NlU2S3hROGFuTHFtdFFCcVNMRU4yejlPUTNYWm5yaVZCNHlZZkpDNkd2bUVD?=
 =?utf-8?B?dy85R2taSVUzMHROMzdYZk45YlpLTi9BanFua1VhMkh1dlFaOVlQR0xPR1R1?=
 =?utf-8?B?UXFPb25WR3NTd1VZbWlwa00xT3NoZmlKZHRuLy93eE1lUklKL3ZKd1JYdzhM?=
 =?utf-8?B?TGdJMmdMc3ZzVFpyNFlaelBUVzhLcCtmR0xCNmhQb3N0bE54Q1d4RWNmeXFp?=
 =?utf-8?B?RmdGYjdPWnBjR1FBb1FmR2RxV0hzdllkbGpvTTNlMHNaRUZYOTZJZFBoeXFz?=
 =?utf-8?B?ZldvQlZJUyttL2dNbjZSNkxSOHVsTHBCTGtkNFUvT3dzclFMU1J4cWt6THph?=
 =?utf-8?B?ME4wdDA0aHRqcG9YV1FTdWdlRDdvbDhYbDBCTlFjdEQ1QVJ6TWtVeXdlU1la?=
 =?utf-8?B?RWRnL3cvU01kR1dlb0RjWGdmandBMmp1cXY0ZWdrMExOTFlxU2lUWStRMGZN?=
 =?utf-8?Q?6keR8NAikIqi7a7VEV6uA9casZnW8Y/jM92YowaeA1wg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3425fb4e-fa8e-4a92-5951-08dd98df2f2e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 03:17:31.1474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqvajHQsKWdAdG0Gvg3FwfA5KcYs8EqEY+T01dpYsj6g9AereSmykqpRv8Aw3jknxpfGm//U9YnCxxI24Iw86Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7550

On Wed Mar 26, 2025 at 11:06 PM JST, Daniel Almeida wrote:
<snip>
> diff --git a/rust/kernel/bits.rs b/rust/kernel/bits.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..ddae8a5be4698bb7df66ee2c4=
2ac6c2bc07eae7e
> --- /dev/null
> +++ b/rust/kernel/bits.rs
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Bit manipulation macros.
> +//!
> +//! C header: [`include/linux/bits.h`](srctree/include/linux/bits.h)
> +
> +/// Produces a literal where bit `n` is set.
> +///
> +/// Equivalent to the kernel's `BIT` macro.

The compiler is probably smart enough to figure that out, but shall we
make all these functions `#[inline(always)]`?

Also, how about adding a few examples for `bit_*` in their respective
doc comment, similarly to `genmask_*`?

> +pub const fn bit_u64(n: u32) -> u64 {
> +    1u64 << n as u64

The `n as u64` cast seems unneeded (and in other functions as well).

> +}
> +
> +/// Produces a literal where bit `n` is set.
> +///
> +/// Equivalent to the kernel's `BIT` macro.
> +pub const fn bit_u32(n: u32) -> u32 {
> +    1u32 << n
> +}
> +
> +/// Produces a literal where bit `n` is set.
> +///
> +/// Equivalent to the kernel's `BIT` macro.
> +pub const fn bit_u16(n: u32) -> u16 {
> +    1u16 << n as u16
> +}
> +
> +/// Produces a literal where bit `n` is set.
> +///
> +/// Equivalent to the kernel's `BIT` macro.
> +pub const fn bit_u8(n: u32) -> u8 {
> +    1u8 << n as u8
> +}

Doing `bit_u8(foo)` if `foo >=3D8` (and the compiler cannot determine this
at build-time) will overflow and possibly panic. This should be
documented at the very least, but the best would be to avoid that
entirely.

Maybe we could have several variants:

	  // Returns `None` if `n` is out of bounds.
	  pub fn checked_bit_u32(n: u32) -> Option<u32> {
			  1u32.checked_shl(n)
		}

		// Returns `0` if `n` is out of bounds.
		pub fn unbounded_bit_u32(n: u32) -> u32 {
			  // Cannot use `unwrap_or` as it is not const.
			  match checked_bit_u32(n) {
					  Some(v) =3D> v,
					  None =3D> 0,
				}
		}

		// Compile-time error if `n` is out of bounds.
		pub const fn bit_u32(n: u32) -> u32 {
        // Only accept values known at compile-time.
			  static_assert!(n < u32::BITS);
			  1u32 << n
		}

All versions are guaranteed to never panic, and can come in handy depending=
 on
context. The preferred one being `bit_u32` with a constant value, but if th=
e
bit index is not known until runtime then users can use one of the other
variants depending on whether they want to validate the input.

I know that's a lot more functions, but the standard library does that
with e.g. `checked_add`, `overflowing_add`, etc. So it is definitely an
accepted pattern.

> +
> +/// Create a contiguous bitmask starting at bit position `l` and ending =
at
> +/// position `h`, where `h >=3D l`.
> +///
> +/// # Examples
> +/// ```
> +///     use kernel::bits::genmask_u64;
> +///     let mask =3D genmask_u64(39, 21);
> +///     assert_eq!(mask, 0x000000ffffe00000);
> +/// ```
> +///
> +pub const fn genmask_u64(h: u32, l: u32) -> u64 {

Would it make sense to take a range as argument here? This would invert
`h` and `l`, but carries the intent better imho, e.g.

    let mask =3D genmask_u64(8..15);

Makes it pretty clear that bits 8 to 15 will constitute the mask.

> +    assert!(h >=3D l);

Do we want to use asserts here? This adds a path for the kernel to panic in=
 a
very common function, and it looks like we are trying to avoid such panics =
when
they are preventable:

https://lore.kernel.org/rust-for-linux/aBJPwKeJy1ixtwg2@pollux/

If `h > l` then this function returns 0 - I wonder if we cannot just accept
that this is a valid input.

One thing to consider also is how to behave when `h` or `l` is larger than =
the
number of bits in the type. The current version overflows, so maybe we need=
 to
introduce several variants here as well.

> +    (!0u64 - (1u64 << l) + 1) & (!0u64 >> (64 - 1 - h))

Nit: using `u64::MAX` might be more idiomatic than `!0u64`.

Instead of doing `(1u64 << l)`, let's leverage one of the `bit_u64`
methods since they are available.

`(64 - 1 - h)` can also be `(u64::BITS - 1 - h)`. Here as well, beware
of underflows.

