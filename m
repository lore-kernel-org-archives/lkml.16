Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2076.outbound.protection.outlook.com [40.107.101.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27B8C2C9;
	Thu, 15 May 2025 11:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308347; cv=fail; b=Nm8P7LFWp2VE1bGLimPLZxuCzpSafJzi8SnKQAihw/D8PONmq8W+HcdTP4wtkmcB8TzVA9v/8Nvfm/qLhvo9djCrSukM3eljKrXsBxRnX2Cl2peigsUW9XeaFS9UMcS8BtNmSIa1L5OzKru3xmlhG8Ac72deJZE8VMFQ47Iks4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308347; c=relaxed/simple;
	bh=UZ6uMa76tgQcLMLWnVCy2aQZvGW5wKMX5olIfQkNnJg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AIA7YUjVzWdnHPLVXa0gJq7utn3TBaO3suhYp0N6tDVsmkgbSGTxmcCfM8mQXlHzUomY2bGB9DrFwC6LN1IEzlqmbw/dFDVghbFwm6vciyFHIeqYj9iyHAQ5LZofDEqUYpo8p8AwC8tCHq6tBZDBBzDvSE9JPpbrFw0aWYEHgIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MR/fvmXb; arc=fail smtp.client-ip=40.107.101.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MR/fvmXb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOIjrw0t8oQW5UABFujrRZXe+JcIwhfK9y2me//vv7ZDDJfoeRolBjAA4Lk1Ccc3Pd9Y4EKKxBx66VGMvH2J40tcQAvfTWzMoWDIVDDZ7FvNpwl0liywWFDv8YqcT6srQYEv2wseA0khJHG4b8BKxQpEoFFvd96XjZxM7g7bTyjZQMseNzlcSrUUV1qyY0gTOYux1NboVfQeuBKVsUMBnh0AvP96dY75Z7IDD5Va/wt6impF+Hd+7KXLmAf5txQyaazdZtjETe6cRrW6W404ItQyfRlRNwsTzw9pRtP6cbj0nI9UN0oPXBSw4TnNlPXCkQ42WmbJp6UpVnOxMw1fxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kXt16iAHtXq/2Tp0GpG+cLiromO6Wbh4FeyIs8Yh+w=;
 b=D28jbk1BbKQQESS5gFPePcv6qLBi2ciR2YHp59MLuG8/e2nIiKtssj/pCYGqmUdHN84xlu/8FMl5tlVJKuLLRCCv9d9edFIBLCIIZ/J7UulXB8lTC14dFaxs932YMXGn9h0qvLU3Uc+IsJpcYAMzj5PACIR6A94hlHlZEsA6AhCV6Fo3yuTSbH6aMuEdjfHNkUYny2LwTsRq/4OCkLRke9GE8wG1+iKgx7pCx2VRXNEzbYgl+FNlB1AVRjqLeNdXT0nLi6rfQ6/Is3o/H0UWae6VHoVOLugt/Lws3WlbqT+HyTcXaH5QCoj2NoL2rD5g3yaITNH2MQEk1x2nbEwxyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kXt16iAHtXq/2Tp0GpG+cLiromO6Wbh4FeyIs8Yh+w=;
 b=MR/fvmXbk6mrdjZsrrDu4yg9TqHJaziJDX8cOfPZertSKeanThbGZ6S/8Xf/AIA7PotFwFO+u50lOXZgt/n69WsDeDLsV4OIzbFE+eCmbbxtecDM82TV7sdkNjU/Mi6zlVL9jps1fSJ5rPN5daUzR53nPUidLjoQ1jF7tKRRJ2+QHFvnMc3229xwldr2TFnNoHoqiBSKMA3HAeLNxBqX03CfevhZw2+L6pOi+6EpaTYIGkKy0ZSRhH77okynMOwEEyuart/7IgZMKVeYydhZcckxP6WG/2GkfM6Tn42Gl6Y28AnFSa6EjfidX++yTnzODHlDqDeVxe7ycDyN7Fqa4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 11:25:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 11:25:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 May 2025 20:25:33 +0900
Message-Id: <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add basic ELF sections parser
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Greg KH"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250515-elf-v1-1-4b53745453c0@nvidia.com>
 <2025051543-override-rockiness-3ead@gregkh>
 <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com>
In-Reply-To: <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com>
X-ClientProxiedBy: TYCP286CA0068.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8784:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6eb74a-b72d-402b-c6e9-08dd93a33795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wk41TG1GejNOejl2dldHb0dJeTVFRVVvcGNyOXZCR0wydGxCYU93c2hYN000?=
 =?utf-8?B?NWlyQ2tlVmJOa1p0TkRoaXhOM0YyV2U4UjhCOXV2aGIvNUI1MzZ6aVM2V0hi?=
 =?utf-8?B?d3V0QzRkd0xDbUlxK3NBTXNKeHhaWEZ3WmtZUkZIKzcvU3ZWc1FVb0JHTGg1?=
 =?utf-8?B?Z3RTYWVzU0pMb2dmR3lzL29zaHgrMFJGNEtwci9MdGtLN3ZhSzJZVEJ0ZFF5?=
 =?utf-8?B?bm51d2J3YmFYMFFnMDZRdHlkY2lRWVVzSUFjQzZYZnA0WUNWOGpDa21HNzBJ?=
 =?utf-8?B?cEtkNWY5VW5tQ1diTEZFTzdBdmQrcFZJYW1GVE5kMmNTdTRBMVMrcjRkWnBC?=
 =?utf-8?B?V2JnSUM3SUxlQytPMnhpY1V1M1lYekVIa1RwSndSdDN3bCttRTA4M1FPZVlS?=
 =?utf-8?B?RGF6QkRnR0J4QmlINFlmZ2lhSlYzb2NnTDRwTEtSQjlIMk1zQUdJMU9mSFZl?=
 =?utf-8?B?Yk5MUGhHUmZoOGZjVDNzTkowaExudzlKMXFhVWVReUxQRVBXbERkajVNbWJK?=
 =?utf-8?B?QmFzcDZzb3E3bHNHY1FnalU4cDN5ek13UzVLUWNyMWVuWDROeXJQc1poSVd2?=
 =?utf-8?B?aTBRM1dtcTNhZTJjemp2a3ZybWFrNGYwZEtIc0VhVXBkc2ZQb21reGRDMmcv?=
 =?utf-8?B?aFRWN0FPc2ptZkxEYmZBV1h4aVhTMWVwYnhmd2t0cnpxdDNvQnluUjk5Z0xF?=
 =?utf-8?B?S3EzNXBmT2VUOTFzL2drRU52OTlwOWg3VmxzekVDVkNFNDdUa2VYbUxiTk9H?=
 =?utf-8?B?UmpiQTJsK0tMam82d3lSV1hTdVFYYzJuOHEzVUFBcGxCRFljQmNkVCtWRFBh?=
 =?utf-8?B?Z09OZXZOdXlUTGpoWGt1QytTUDlQS2dFU3ZLZXltcmR1MjVpeVRvWEw4aDNy?=
 =?utf-8?B?TWFBb29iOC8ydStaQVJucmtFMXdhUXRkMnNRSGM4cDNMVGFXbEZac3NRekYx?=
 =?utf-8?B?SUhWQTF6U1dCMk1XUW42cndJUkxTVitZWkZZSEJmdVNLa005cEFyd2FFSC9Z?=
 =?utf-8?B?TVgzK1lGcjYxTWtoY3N3aGtjbVlDU0hHcUUzdUtXUHV5THIya01QZXVkUCtQ?=
 =?utf-8?B?L2xkT2k3MndwZ0xYa3k5VzF2WWx2aGsxdWJKMHlEeDY1YXlseXA0VTh1d3RI?=
 =?utf-8?B?cDYveDE1QnNsZWxzaTN2N2trb3RzbGY4TnRUWnE2VlZmU0htTU1FeUdkRUN4?=
 =?utf-8?B?NzVjcDNRYmFMMFprSXdFT1pmdG1CcWI0cHd4VDd2THNpNW02NTdZNENmb1Fy?=
 =?utf-8?B?clBFWmx3bEc3STQyNUphMDVrZ0NQL1hVU3JiZ1p3aWdwOXM3dW5qY0p4SWp0?=
 =?utf-8?B?WEhPT1JmMDdxcmY4alZQTFcyT3lVUDk0VElPYnF3b1ZNdXJuMXN4eENYR0dG?=
 =?utf-8?B?VHFMVE5YMzV5RXozK2d4dlp3Sk5LOTRRUWtaWU13VTRENlFGV3pJRCtWQU5R?=
 =?utf-8?B?TDNQRktJRVN4Z1NJUnh1STZHaE5YS2FIZUZTeVUyOWV2Tm9ob2Q2YWRzZlRT?=
 =?utf-8?B?Qk9iZnQrTXgyb0xPWWVpV1ljeUhmSFl6bFZhbDJjUVl5NkpGbldMTE5paXpk?=
 =?utf-8?B?TkVweWxMMjczYVlSTVVzMkF4SllXK1RpMWZhN2RLR0pod3hKN3lMbDdMZU9K?=
 =?utf-8?B?cmxVRlJmcVBmSmpESEtJWWRISlVUVFZuWFdsYTU3MHhhR29Vemx0NlNnaUdM?=
 =?utf-8?B?aDBDNUhTajVEY0JyRDVlY0JaNW11YXFKOGpYbWxjUUhFTy9wTjF0akZOT1Ns?=
 =?utf-8?B?U0NubFlUQXhzVFNtSGRwOUpJU2dzVTBoZ21EZ0Z1bWpLRkNoUVdjbHhuM0hq?=
 =?utf-8?B?YUJnZGs2Sk1hWlJyamlkWjdrbVNnMDdoY3B1a1lXYzErUnR3cUR6OG9kRXV3?=
 =?utf-8?B?UEJncGR4NmpZTWtSdFVhQU1XUU1OT2lJeEcrb2gzcExyT1J0QnloZDcrRzFa?=
 =?utf-8?Q?86vAgsWrzX0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTByK0pqdzluR05iVGNydHFNMUEwSGlhYjNsTnBxQWhGSUt2M29qM2tseVNE?=
 =?utf-8?B?ZW42ZlJjZllBRVhWc2FTUWNGMk9oZWpUOXZvUDJ2S0t0Y2ZBM3VEd0t6c01x?=
 =?utf-8?B?TVZBOTBNZXZWc2s1TWs4RldEV2ZhVFoxOUV5RlhXSXRFeG90TEhLb3JYRk43?=
 =?utf-8?B?VXJpQ3dlQ2FUT0J1QytILzB6aTBuaUxhdDkwL296ZmdadlQxYVJWcFpqZlZT?=
 =?utf-8?B?N2crNktRSFFRMndYTlVLY2xRVzBEaXplTWRaQndIMktXWTE2SjFBSHgwMTlO?=
 =?utf-8?B?aS9MTWFmcUdpZWQ4USswU2Z1ZHhmRGxYdUVMVVZlSmp4SzV0V2ZlMDNPdFdq?=
 =?utf-8?B?YUtRemhybWR2RWhnTWp3aWw1UnB0eTNRbXFQdGJZZ2VibnRHZ2ZwKzZjRk1r?=
 =?utf-8?B?STNXTTVDQzEwOXlPRkNVTEtrUmxYMlh2L0xaS2FkdVhld3pMVlZwcmVUekd0?=
 =?utf-8?B?bFZZeWRNS2dpWG5sQ0RsS21UcHhZc2pKR0x1amVIQjFOcENBWHJkRm5YS29X?=
 =?utf-8?B?R3FWcmVobU9sODZ0YVFGUkRxUWRzZ0d0RTdRY3BNRUdSRTZhLy9VM3JLQUIw?=
 =?utf-8?B?VVBCb3IxZzFXYlhJdFlFLytIZ0pHRm52UjRxVTdQbm8yeTJaTlVvUnl1WUpV?=
 =?utf-8?B?SmxXdklrNG0vUmdzWkJxSFloUTd4QXlHMmtrOWlkSFNZT3BaOXNNUDdQK3Fk?=
 =?utf-8?B?Qy9NYmtGRHpVaGJyM29MSnc2bDhSS3hYMFdqRFc5SzFjT0lsOHpaOXgvV2pQ?=
 =?utf-8?B?cTJZSm9jQ2JVSUVZZUpIcDcyVHJTVk91cHcxQjNNdERIOFh2cjdhTXpRQUll?=
 =?utf-8?B?V0hFNWZTQjd5WU5PeGNHVDQ2YTZTWVkrbUk5ZzlYMXFQR2JSWk1QKzRndGVr?=
 =?utf-8?B?OGZhay91SUpUTXU4R0sybGlsWVZkQzUxaFVmbTBlTVFHeWFBMFdJN2hpa2Rv?=
 =?utf-8?B?Z0RVOTI4RXN0Q2czdzVHQ0pQVTJmQktVQTBqRG4vaDlXVlp5aWRqNjYyNkl3?=
 =?utf-8?B?NGZ6RnEzQ3ZDVmVhVk5HNkI2bkxCbDdZYURGVVhFbTN1Skd0OTEyRUFSLzN1?=
 =?utf-8?B?YWQ1YzllNXZSVGFydC9keSt5Z2VWRnV4d1FpSW9taitFMTlZU0dEZXFxNktt?=
 =?utf-8?B?SG1hU0ptQ1Q1a2krbEdiMk9TTDJ3UXNNVFh5RjFyRFVhVVdCNThJdjZ0cE9M?=
 =?utf-8?B?aHlTUG8zK1F0a1BROFdhM3B1NmxGcSs1QkN5bU9RZmE1NUFEaTZLWktDdy9v?=
 =?utf-8?B?VzZqdlErblBlZk8rVkpuQmFVUStFVHdlQS9mMktFZk5qMFRVY0dObWlsRjJl?=
 =?utf-8?B?UTZOTGNqU3JMeWNGUm9Hd1pFWkJZZkxnLzNLSkFLUlNhWUMzMEpWSW5KNmpI?=
 =?utf-8?B?RTZRK3doMjl3QkxLVW14cjdBSjNEMGtza2ttazJTSEl3WXZlNXFPVThEOGg0?=
 =?utf-8?B?Z3g0cGhOajFRd3lnM2Z5cEZIQUdaVEo1dGVhMzRLejdSdDZHWW0rWEZMSkdi?=
 =?utf-8?B?VktUbmlJUkFqckhVZ0pBUzRxeStHOTFXS09PWE9YbUJaTHJucCtvL3l4SnVq?=
 =?utf-8?B?R2RJdU8zR3NDaUtMRVZDUHJ4QUFnUzFzUjJUQTRDaHRpMjIwUXBQRjlxdTFT?=
 =?utf-8?B?dndjNGZ5bWRNM283VllGN0NiUlF0NEZhODhZeWFJY3ZmUjRhaU9xd1VSd3Ry?=
 =?utf-8?B?ZC9XQm4yUld2Vkc1dExLKzJzZVVXSnZBYmNNVVZiRU9PUFRhR2MwWm9XNW83?=
 =?utf-8?B?WkdkMW03bkNnQlp2bVpUM0VhN29SREx5UTY1SkdlQVpBQUtGWFVjZElQSkNV?=
 =?utf-8?B?Rlk1WXhwRktTeEpKMnFWMmp4aEg2WnRuTWlHd3dSZzladTlWaUIxTUZaWVJL?=
 =?utf-8?B?YkcvSmlGNUl0QllEZDVWcTlIb0oyOEpzS0VkVjZPTVcvTjR5T1pjR2NSMk5U?=
 =?utf-8?B?RE1YcHg4bnRWVEZvVzVlU2c2czZjb1dXcDQ5dVRROE52Tjk5WnJ1MC8vNk1w?=
 =?utf-8?B?S0RZamZNZExyRndjTDhxU2psZk5QcVZjNzlzbTNqZ2MvOFV3cVFVaHMwNE9z?=
 =?utf-8?B?TWlBaDhucjZINFJnajVsWmxUVVFESjlmVEtlZWhiR3h5UjgvcjJtRXlrd1dZ?=
 =?utf-8?B?UmQ5WElET3YrMW1ucEhDNTNQaEZNRlVmUUtRaHk5cVJpK3ZzWXZWc0llaktr?=
 =?utf-8?Q?69i9aqjzcz2JzI0czdJqodaFCwj4whkXBrBYR13kJmej?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6eb74a-b72d-402b-c6e9-08dd93a33795
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 11:25:39.1106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzn6nbULZPKYhhu3yCS9qNTFPJhWKadz5OhBD46vPFR09p3GO7Yw1OeGiCyubGVbg1FZlV7IXabboO2aT4ExjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8784

On Thu May 15, 2025 at 5:32 PM JST, Alexandre Courbot wrote:
> Hi Greg,
>
> On Thu May 15, 2025 at 4:38 PM JST, Greg KH wrote:
>> On Thu, May 15, 2025 at 03:03:51PM +0900, Alexandre Courbot wrote:
>>> Add a simple ELF sections parser for unpacking loaded binaries from
>>> user-space. This is not intended to become a fully-fledged ELF parser,
>>> just a helper to parse firmwares packaged in that format.
>>>=20
>>> This parser is notably helpful for NVIDIA's GSP firmware, which is
>>> provided as an ELF binary using sections to separate the firmware code
>>> to its other components like chipset-specific signatures.
>>>=20
>>> Since the data source is likely to be user-space, checked arithmetic
>>> operations and strict bound checking are used.
>>>=20
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>> This will soon be needed in order to load the GSP firmware in nova-core=
,
>>> so sending this early for separate review.
>>> ---
>>>  rust/kernel/elf.rs | 322 +++++++++++++++++++++++++++++++++++++++++++++=
++++++++
>>
>> Why is this not just done in userspace and then have userspace feed the
>> proper elf sections to the kernel through the firmware interface?
>> Having to parse elf seems crazy for the kernel to be forced to do here
>> as the kernel should NOT be touching anything in a firmware blob other
>> than passing it off to the firmware directly.
>
> FWIW, the GSP firmware in question is already in linux-firmware and
> loaded by e.g. Nouveau.
>
> I am not sure how userspace could feed the proper ELF sections otherwise
> than by splitting the ELF binary into as many files as there are
> sections. Is that what you imply, or is there another means that would
> preserve the current firmware format?
>
> Note also that in this particular case, the kernel cannot just pass the
> firmware without modifying it anyway since the signatures relevant to
> the chipset need to be patched into the right place before it is loaded.

Quick nit, as that last statement was not entirely correct: while we do
patch some loaded firmware with signatures, this is not the case for the
GSP (the one in ELF format). Not that it changes the point, but for the
sake of accuracy. :)

The point being that even without using ELF as a container format, we do
need to parse header structures in loaded firmware files anyway, so the
kernel cannot simply act as a dumb pipe for firmware. And since we need
to add structure, let's at least use a format that is simple, well
accepted and which layout is already in the kernel.

Or if ELF is the problem, I don't mind introducing a WAD loader. ;)
