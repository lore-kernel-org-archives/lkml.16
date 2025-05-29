Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A701DF73C;
	Thu, 29 May 2025 06:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748501629; cv=fail; b=ns+Glfyvix67URmBbld6U9mNzEL4Cbdhb5w+b8zkNOXv6xrLYWiET3zYp442pxHb/AkodpIuRE3WTVqnNa8mfOu+fSBzfHKV6/P7LmxANB6TGlp0Ui1iEqGf4M4AYgTnQZJe6freegPKfmrcKvHuOMGeYfK40Kxi00MY6uydtAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748501629; c=relaxed/simple;
	bh=ZZmICa0MQapNb6FJMq/mZ/MKgkNoVNWxxe4AMoHfmxk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=cmEqBloHHQawwy1FedbZFfOjVk/TWnHYDKbCFfzW2BheBTeXSgYkU+lnZES8NoA9W/dBfB2/rqRIcRYX2lOutvnBYdT5PeByl6NINPsLpIL8cDbhC1GStp1VtCLMqQLi1w4U80eorX8fDyW3lZTqrKnajLTcC9n/tGcyt0Ck35A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=huN5k6Vg; arc=fail smtp.client-ip=40.107.244.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="huN5k6Vg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzz6BJTT/XJZRurCOVMWBsIfDQe+vvJWpd/fCN9uZk4bUhdJHkFeC6YJc5CxSeWu3j4TRw1mfjHE1ba+o05jTnX9KOtooQUthOSaS7U/AjkLiyhvDUs2XkDD2qFjHwG4lKCPnRNDBn4xgVosj4Sd37DHC2RZPNicGYkOkb4QBJovd+wjlistbJPlMCwamBKZRNI45zJx8Euo/U9XxBeMeN+fPO9FbUgn/l1v0Nrcy8PxeZfiV1g97cQIUxCva6PwZgR8YKzhmNZb8G31SNO+Lwzdn2ry0NQ7qH8zZUcxU+RAsctOqzxQSD4Q2V599feZ2WTUzhnZLRepuzKJukNp8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqRkh38b98lLLLyz7q/HL4nW/qlrJNGNWAMUvX+yRV0=;
 b=Bn6MV/Eg5jUjthI6PMPVs5NA5sM5HKxx8ku7+UfSmdbQlCayGWsgVRYD2DqnxMnh2NLJDEFDolKowVAc7ZF7OuQudk41uniX8C8GiYab3b1bxMNXBCDzDNQLSSgip0fQ8czd6XJqtM+fa2VkwA7vdLBQqeKWyYoMd7Ya0ZfGWZzKxKrUuF+wjk2TsnVe8Ws4U6kV3MhkBUugf58gQ/Kuz0sUQ3Xg8sP2d01ALGZm6FhSF3vaEPkCmpM3Mh/CP422R//JPVDNhJ/ZNy1y1SBpijoVLLSZEpeRRsYG39pKtCrOx602yt3zZaf5HcQyxMvq2cJkoNmlbqAiI8nfvOv8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqRkh38b98lLLLyz7q/HL4nW/qlrJNGNWAMUvX+yRV0=;
 b=huN5k6Vg66OlmG3TMCM/3vKELvySLwVnBp/iG7KSCJBYkq16RpE9gaSHuCNTcKmCHzxd8p9VyTNB6WIvIvh3oj7QgeIX4cmPaZT0vEsQfGeLZ3Iq93iLeHUi3O9gx4TYnR5PkZjDsh/E5lm54/x1/bBN0ijRKqbW/SrLTmVrMnCqwMDhPsyw/UrCf6RTzkNIqbuv3u6YyV3ugVzqNvHEzmI04L44aMcoLhp6GIUu+oy3FCK3Z571vOq4PEDY4ZOcNtr5EiWg0UP1mURYMRnNxt+koDLcYwR9tZeOS089f1VDn5VIsSFZod10h075kiuB1X6j7vxOdSa90dowr6zjcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8694.namprd12.prod.outlook.com (2603:10b6:208:488::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 06:53:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 06:53:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 May 2025 15:53:42 +0900
Message-Id: <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <timur@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add basic ELF sections parser
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250515-elf-v1-1-4b53745453c0@nvidia.com>
 <2025051543-override-rockiness-3ead@gregkh>
 <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com>
 <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
 <2025051532-gentleman-reset-58f2@gregkh>
 <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
 <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
 <2025051647-urology-think-b8e0@gregkh>
 <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com> <aCc_PSOPkLWTcTru@pollux>
 <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
 <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
 <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com>
In-Reply-To: <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: fa82016c-9b03-43d7-9b26-08dd9e7d8e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmk1d1hSNXF3RVpLQythZWwxbCtlc253YWpMV3ArZllyQ2hZNld3blBUNG5V?=
 =?utf-8?B?NktDWU5wQjFBV0dGV3lScEpjeGpROEFVNXYzbWc1OFJwdkZIdWQzNHZESkxF?=
 =?utf-8?B?eFdpdXhWa0ZZbHRYeFdaQXYzV3dybk5oZ0IzMmZoWW5ibUFNV1BjeWRTUEhJ?=
 =?utf-8?B?MHZCSng3aTAzbG5uUVl4SzF5MGFzK1V2Njk3ZlFWMm1VNHRsYlNDV3Q4VXBT?=
 =?utf-8?B?Q1RNUUhYZTIrT2o3TGZ0YTB4WG1yNlp3dUo4YXZCM1hsYXl1V0pONlREN2Iw?=
 =?utf-8?B?REh4VVRLVFNrYW9PNWRJNmVVWXdDaFE2bnNyMFFJK0FQU2ZXcXl1WjloOEc4?=
 =?utf-8?B?TU1ZWHJQQmV3cWVFaHBoaFYzeXF2K2JzTjA5a0EzVXBuT0hsTWFlRlMrTzdK?=
 =?utf-8?B?SXVGbXE5eFdEaGpYeFVET3lNNCswdnRoeWJWSnE5eUZGaHN0bkxOQXU5Y3Ro?=
 =?utf-8?B?NTBPSlZROWxIS1ZKNzFhU2ZUUnoxN2E5UXFwRy9rKytFMXBRa1ZSZWw5VmFn?=
 =?utf-8?B?V1dsRG40RnQrZnRNUCtUblQvODBYNWh1QmpTNzdFbXh3UDFGSW03MkZJdmFY?=
 =?utf-8?B?ZnA1eTVVUkZWZjRWOFFiemJWaWU4U3N2TFN3WTJsK0dtbjZOVzNyY1NhQ1Ns?=
 =?utf-8?B?dmlkOXVPZlZzTjBDdXVqQnFxdlRSZzQ0M0xIUzgwV3ZNRGJ0Z3EwcjEyYy9t?=
 =?utf-8?B?U3NVaUo2c29kQ1VCeGFzRXR5cEhCNTRrREY2VHpNa25JL1Y1Tkc3L2ZKbGNj?=
 =?utf-8?B?cVVoK2gvRFdWSlRTODEycm5rMFR3THBPTmZrS3cweExSVEFIbldIbUxldUF6?=
 =?utf-8?B?b0VQc1Z4TTBmRWJMeTNJTXN0M3R4S1BtbHBiM2RVcWo1ZEpEYS9iRzVqVW1B?=
 =?utf-8?B?T2lpK3p0eUN4b092R1VMNm1WVUVISU5SR2JvSEdVaEQrN0tCcnVpSVVnK1Bj?=
 =?utf-8?B?eTFDODN5bzZ6emxFbkRwNGxrT0VHZTdSKzdURW5OMkVFdmpGS1BJeUU5RVIy?=
 =?utf-8?B?bDdPRnZ1N0hCL3FKUnRRVEF3cUlKVS9JSG0xd3JyOEtyWmR1MG5jaEhzOExl?=
 =?utf-8?B?SnlFN0VFUWtvWThRMUowQWdYVm9zeXliYTByMFRkWFg1SHl3SUdGRlVPNkdG?=
 =?utf-8?B?NjlTb2lZN0krSFAwT2dWWEsxWHdzL1JDc2JzT2VwYW8wSHRYdmIyWjNYeGE2?=
 =?utf-8?B?V3ZDWlZkK1NVWTRPVVFDczJ3VE9odkdEWlh2ajV5a0tWd0xhZFVjRVJUc1Rz?=
 =?utf-8?B?NVB1U0dMUm8wU3VkY1VGWW9ZU1p0SUFXOG9QVzlNK0o5UWl1Z0xBQ0RDNTZP?=
 =?utf-8?B?SHhSVGZ0SWRBaDlkVmc5SmJtQmg4VWJSLzJFL2pUb0lpQ04raUg5N1JualFa?=
 =?utf-8?B?djd3RWhGaEphNU96TW5wWS9xOFdoenlpYnMxNjJnbi83bzMzVzRyTUlYRWJZ?=
 =?utf-8?B?akZ0a0hOdjZiU0tPNXJMRi9HMEpadml2Q2dvdFVXdXh2MmM3V1BLOU1jejVv?=
 =?utf-8?B?LzJMdGNmTXZuYWIwMHQ3MS9ObzR6dFNiOUlSQ0lCWnFDcyt6dkcwMFRJWUZv?=
 =?utf-8?B?TDZ3N09ZZjc2Mnc4aUtQdSs4bUZob0pzMXJqNHFQd3RlVWF0QlkyOWNxNHR3?=
 =?utf-8?B?aDJqSXdoQXcydjR0L3ltU2d3cUZmU2F0ckRrbEpCWGJhSTlhRkRFdkFwRm4v?=
 =?utf-8?B?OHpyb2tmd0JJdk1nVkpLTTVuVjlQQUYvQmVHRzRlTWp6NXRQWEd0TjBYbTd4?=
 =?utf-8?B?eTRJdFNaWXRLci9qQXB0Zk9QK2FVTURCRnF3REp3bU55UWp0Tk5tZlV3R3lQ?=
 =?utf-8?B?OU9KRXIzMHNuV1lEQm1DakNWTStOSnFtenpUK2c4NGlGbVZqaTFCMnZvSGVt?=
 =?utf-8?B?Q3RkRlNsWThSRmJybC9odWM5N1FtUENib2RhbjdKRyt3b0dnVmZtS0c1R1BN?=
 =?utf-8?Q?UskRqw08bNA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzlFMlZTK2RIQnpRZE1MeUFHRkE5ZUNRa2RKZzVoUThLRDVBNlZ1clRjTE40?=
 =?utf-8?B?dEhMOXlsdVg0QmJNcGZnajJibHYwUGtKdEZhaWlmZXVQTC8zeEJDWkhXNnhR?=
 =?utf-8?B?QnRBaUhpWWhpVTMrcThBOEFaZ0crMlM3bVZ1T0hTY3ZXOGVWSS9vT2xuam13?=
 =?utf-8?B?S0JmbVdmK00vRWc3V3NFZDRVeGUvZ0ZCTjQxNUNYdVRFckFDSGo5ZFZUcEti?=
 =?utf-8?B?MVN1Z1dCallqY093MUF3VGdrRFJBYkZOeE0zRWRvMVhHb05GWU1ENkpVUWZr?=
 =?utf-8?B?MUs3K3IvTnNNamFrNjFlR1A3a0xKd1Q5eTVXMVkwRVg5TEFNbWIyTW9yL0pZ?=
 =?utf-8?B?REVYN3JDM2FqaUdTMkphYU03RlgvdjFGRk1PZGJ5K09wajBjS0gvMnVWZ2xT?=
 =?utf-8?B?T0lRRXFldForUGd0aGx3QURwMm5CQ0dla2w5cXB0SVd3UW9EdzZPVm5JTlJo?=
 =?utf-8?B?R2J4bkZVRVNub2p0U2xZbHVOa1JJRmx4TGQ3Rnl6czVhcnFzbEg4ZmkydTZk?=
 =?utf-8?B?b2VHczJKZXpYei94UmVYOXh6YWJkL3RKM0RKSDdQN0tJZXEvMHAvMkhsTGc5?=
 =?utf-8?B?M2dkRGNOSWdwMUdENnliU3RVSUtsRW1iVWtTV3kvQWJ0blIyYXpJeThJRWpl?=
 =?utf-8?B?NldmV1I4dWowOVdpNmV5NU1acEx5MzR2R3RuRG5raDVvOTJOWHpDaVhIdDZi?=
 =?utf-8?B?UGxNWC92enBsMVU4ZjJDQ28xMG05S0VuODJ0SlpLUTNMM280Uys1eDdTc2FQ?=
 =?utf-8?B?a3VndVdZYVBPeENTOTc1em1XYmc5M1RGU2tIOXlGWGFqSEtTOE8rWk9SNHh5?=
 =?utf-8?B?VTltWHhJalNoM2pQVVZpVkF3aTJuVktWOHAxbVNhTFVzblFaTFlZRDhvbklG?=
 =?utf-8?B?bjIrWnQ5b2ZuYzBrK0xhMjlDTkJFZWl4dFA5THZkU0pLY1pudkR2YktLdGlZ?=
 =?utf-8?B?NEpIMGNhNmd4bDNNOHdnOEh3UlZBN3ZqbDkvUERnczJHd3kyRjBhK21NL29O?=
 =?utf-8?B?d0RiZ3Bsb3REZ3pSSnBjOGU2UkJRdEtnaGY2LzhPc1RNeFRyRWNtRXZPM21w?=
 =?utf-8?B?MUlBcS9uRFFETVlMNmI0SklJc0ZjV2g2ZzlLRGU5WU5yU1dUbUNKOWlNWnJs?=
 =?utf-8?B?MXBOUytuRU9rMzlaUkJpNnl1bUFQS2hiWGJBVDJNbmlCR25Yank4RjNzWnJN?=
 =?utf-8?B?UkR0RTV2aWtoTUNlZklSK29ES1YzZWZVVGwxVGRGTUVFb281dnB1WXJUR1U4?=
 =?utf-8?B?WXJqKzBRRk1ucmlMVkk1aFA1Qi9ZUFZKZ2pINUhRZXdmalJSb0R0cmhmMHZy?=
 =?utf-8?B?aTVyMHJnTTI3NFc1bjZieElSVmdYTFFDZG5qd3BJRlhpWGpFYTRGNVFFdXNn?=
 =?utf-8?B?V3RlVlFZQTNFOEpRcmcyRGhMczJzWW0yVDhHcVp0ekpQSzlkUWNQaGZYMllp?=
 =?utf-8?B?djJVWWdSdUplbk11dzUxek9oT0F1MmxGVm5wbUtad2pUcUNNMktSN0h6d012?=
 =?utf-8?B?Q3EzbFhLWXVrNjMzKy9qTEtISVNIVm5HOXlsdFJ3dEhCN0NqSmcxQkppaU5Y?=
 =?utf-8?B?VzgwdUVuMVNhR3BseWRZbHk0OTJldmZLcW9QQlhUT1dyZmt3c05qMkRFT01r?=
 =?utf-8?B?ZnJoMkI3Mjcrd2lsQ2grb204U3BPZzF2UHpYSkt5L3kzMHMvQU9tdXVGc1pj?=
 =?utf-8?B?d1piL29Jd05UcVJWbUpodzZLVzlSdW1SbUR3VkNTYnkySDI0T0JYOHNtSWV6?=
 =?utf-8?B?UStKdDhNK3R2N2w2bmFNanBwTFdlbmZLWEdiWXVIZlFCY0ZQTVp4RDByRnBl?=
 =?utf-8?B?OWVkbFM0ODEyaGNDc1ZRN05Md05hMTBTSVdWbkFuMXA5aDVuR0JCRHB3NVJr?=
 =?utf-8?B?T0FzQkd0UDgzU041OFpXZlNzWXRES0lpczFwRjR6ZXZqV3crNFpFWjl3N2Ju?=
 =?utf-8?B?dFhhUzdwc3EyRGRYc0h5ZVR5YVFSb3FXTUx1T1hXTFFTSDJSR29MeHNuZHBB?=
 =?utf-8?B?S2NuZWpCN0JTYXoxeFFCak95dGc5K2VjQUhDVGJjeVkrNFZRYlJqQlUrSXZZ?=
 =?utf-8?B?d2JXTUx5dks3RHpScDJiYmlORzVEeDg1U2grVk5SRGJXNmlQeUNZdjNheDJs?=
 =?utf-8?B?UmF3R2dWSmpXV0h4RFVTalRKS3IyRW5EanEvbUxlQ0lsNnU5Tkc5QlN1M29N?=
 =?utf-8?Q?KXvU2xM9mdlpje96SDZdG0z2InX8dQOwjV0OBj+zeqci?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa82016c-9b03-43d7-9b26-08dd9e7d8e3a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 06:53:45.2529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ok/+r2X+3PUrMCIMtnSRIYXBbpnAeSuDOQX3vl1rVCj7ZrU0PmFK8GN14vAWeDPrIRjWWZG+IWzXzGYtRl4iyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8694

Hi Greg,

On Sat May 17, 2025 at 9:51 AM JST, Alexandre Courbot wrote:
> On Sat May 17, 2025 at 1:28 AM JST, Timur Tabi wrote:
>> On Fri, May 16, 2025 at 9:35=E2=80=AFAM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
>>>
>>> We use ELF as a container format to associate binary blobs with named
>>> sections. Can we extract these sections into individual files that we
>>> load using request_firmware()? Why yes, we could.
>>
>> Actually, I don't think we can.  This is the actual GSP-RM ELF image
>> you're talking about.  This comes packaged as one binary blob and it's
>> intended to be mostly opaque.  We can't just disassemble the ELF
>> sections and then re-assemble them in the driver.
>>
>> Unfortunately, for pre-Hopper booting, we need to do a little
>> pre-processing on the image, referencing the ELF sections, and based
>> on data from fuses that cannot be read in user-space.
>
> I'd like to reinforce Timur's point a bit because it is crucial to
> understanding why we need an ELF parser here.
>
> On post-Hopper, the GSP ELF binary is passed as-is to the booter
> firmware and it is the latter that performs the blob extraction from the
> ELF sections. So for these chips no ELF parsing takes place in the
> kernel which actually acts as a dumb pipe.
>
> However, pre-Hopper does not work like that, and for these the same GSP
> image (coming from the same ELF file) needs to be extracted by the
> kernel and handed out to booter. It's for these that we need to do the
> light parsing introduced by this patch.
>
> So while I believe this provides a strong justification for having the
> parser, I also understand Greg's reluctance to make this available to
> everyone when nova-core is the only user in sight and the general
> guideline is to avoid processing in the kernel.
>
> OTOH, it is quite short and trivial, and if some drivers need a
> packaging format then it might as well be ELF. The imagination DRM
> driver for instance appears to load firmware parts from an ELF binary
> obtained using request_firmware (lookup `process_elf_command_stream`) -
> very similar to what we are doing here.
>
> `drivers/remoteproc` also has what appears to be a complete ELF parser
> and loader, which it uses on firmware obtained using `request_firmware`
> (check `remoteproc_elf_loader.c` and how the arguments to the functions
> defined there are `struct firmware *`). Admittedly, it's probably easier
> to justify here, but the core principle is the same and we are just
> doing a much simpler version of that.
>
> And there are likely more examples, so there might be a case for a
> shared ELF parser. For nova-core purposes, either way would work.

Gentle ping on this, as you can there are other drivers using ELF as a
container format for firmware. In light of this information, I guess
there is a point for having a common parser in the kernel. What do you
think?
