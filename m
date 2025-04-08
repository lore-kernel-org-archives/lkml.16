Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B829218E025;
	Tue,  8 Apr 2025 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120544; cv=fail; b=LeXXoxesONoRllE3zzxdwloi8DZmvWBa4P9f6A/8Ax8q5JolBflRZOqK/j08cO/VFDMM+UMc2ya/adscEF6dHcFwvSOWTfg+m0+PKkNhvmN40uNFHIa2ayBICwL/b3p/r+otHyPD1/FCCnJWCdUXERY8m3iS6LiAshhUEBvCvR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120544; c=relaxed/simple;
	bh=nCgcaekQh8D5rGwdC12Ss8hQBgPaAt7EQfRcrm8Tkxg=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=F314atpLYAvQymWdow3bYabXTHFcp+Dqp/b8Q3RVIUtiMJP++MckKUFKA3w8If4GyUjcKOSzvRAnMUWvKnV+u1n4/TOfE4Ecu5RRtlHJbEDi2PQsqrfbv7FwwcBCzkRg14QbcRiIR4hWy34WYVub76fMgpTaNhs7tB0uBSwP3YM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lH78nzJ0; arc=fail smtp.client-ip=40.107.244.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lH78nzJ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6dtw5Vtw12OZUg+PNQECUDuEsCI9OCsuQCR4+PUUa+UYpKVuNEuqbc/upS4+CvMvHbTD5YllDXNQTwCxjVFDtgxZLUqtxrNpgFbWTxfeQBtLTpjoK9MYnzHoc4vpC0coRLFyF6myw6IUBfLoAwNxoAXsCoMOag+kjsFztOSqbKITUXycHGliM6NaEZROa14tlvZqq2RNnczi1LefaSNvj4Wzv2rnLoJVCnAgCWtJzFCkrgrm3mDfwgJmSM0gOW5AzVxMEf8btVcArHuknlfhsNUZ5JbQhFb2mJtexgUsz8TsqQENcKPsStvEOQ5qNV3lA874AxbHbjYrRZ8HqCqSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5RYEuAnQAg/knOzWAQh6/j2jOSLaYOXKgPvbNcbGaQ=;
 b=r0MeEASFjciX41Is+Xn8kwuYIDTrKBMdAnDE1k1JDywnDZAOFgTgELIn49+UpxK+vURS/q8yG99lwizdWbhFxYOdRmJDao6Hvr1oJJ+gJdN9iMlqnCxCwg4JsTfs9hRwpPqRStZCYpVjdBTjc7IsIN998RH3zmNcycSPspo9Nme+p+AVM0U1p5vWJehKqv7Q0snfbJFVsn8JGXjY3TqSmujHjGMn46E868iwOuIP+GQUzI/vqLLeQqGJsQ4+j9fkS7Du9oasI60+hTTNPNhfl+iLWFvFC4OMJrUlIritr+GZ96g1RAoMJpz4vC5XejCATCCaUNmHmWK7O4jrGqFNlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5RYEuAnQAg/knOzWAQh6/j2jOSLaYOXKgPvbNcbGaQ=;
 b=lH78nzJ0PlONFAY554nf9QzNzg4ZBK9LWjQUIi2hZpj5juieClC96o2U/uDLGJkXmg/0b09tLnN6ULVqYf9fuCPwxqik4V30QLRRJZfpLN/8IGLIYAbC8rhPo/9fdHL+s0XA4DCr+zIFHeAkREcW8jgiyi00zx7OgUgJpHMuYLGzXijsZZz69JVDrXKhIiRRSYOcv4EQlF9dPNYXqYHMcoiIGT1q22VifWPfuwb/1BgmK4w0d5ECgMGpiu+d3m5QWa7DrbUsQZg9XD2tS79Y3JmzBOc5FY7eWi/FfzNIjr26FrF2MkWvgiAkGw6Pp3ivx2/4pL5hhNXkLfp5luZ2aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8503.namprd12.prod.outlook.com (2603:10b6:8:15a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 13:55:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 13:55:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 22:55:36 +0900
Message-Id: <D91B4P0WDM7B.3IKSOWUAGEBFK@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Danilo Krummrich" <dakr@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: allow coercion from `Box<T>` to `Box<dyn
 U>` if T implements U
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250408-box_trait_objs-v1-1-58d8e78b0fb2@nvidia.com>
 <D916LG7Z9Q31.5RVNMYM38E2D@proton.me>
 <CANiq72k9Lo-M5v338iWWSiwrnU+JwP+aEZeLiR291xc2c+ESOg@mail.gmail.com>
 <D91ACTUAWQTF.2AZ98BUA5ZKJ6@nvidia.com>
 <CAH5fLghYwmTO6KmoSPQxjmN=nDrQOCRoigQA9OWYnPve+sYL0g@mail.gmail.com>
In-Reply-To: <CAH5fLghYwmTO6KmoSPQxjmN=nDrQOCRoigQA9OWYnPve+sYL0g@mail.gmail.com>
X-ClientProxiedBy: OS7PR01CA0292.jpnprd01.prod.outlook.com
 (2603:1096:604:25a::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8503:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d15d3c4-bb21-4837-0f4f-08dd76a50bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2hNUCtFT2NHMllGd0VYM05GbEt2eFFhREZFUlhGZnk0VUF0Q2RSSGJPblJT?=
 =?utf-8?B?MVo5d3JYcmtMemRVanY1UjdYOWk0M0dEYTRrcTBzOUZxL0lkb2grZ0dqLzg1?=
 =?utf-8?B?VE1RdWFGaW5FbkxndXVTUTRXM3NrWno0UzV2SU43Tkw1aVB1NnJudzNuOUYz?=
 =?utf-8?B?UEZ1Y2taL202dWZtbzBxV0MzdS8wa3hjTHRMMmUrenpMTk5mRmd3MXN4Smx3?=
 =?utf-8?B?OEd1dzN4L0l5dTJsWmN3a3pNQ0h0M3hhcGJ3bE84Mks2bjA0RHg4NFRIVlJ2?=
 =?utf-8?B?RnRmZ0luNW5ZUUVTNEl0Y3FpNThEN1g0V2g1TW0wMHB6Z3dRK0ZzeEVxcG9i?=
 =?utf-8?B?dGJzdzlQbGZKK2pZR3FZSWE2T1d1VTB0WHJ1OUcwK1gwVEM4UUdScXdsS29x?=
 =?utf-8?B?NCsvRS9TdnlYZDZoVWtRUXpBS0xZNUhqV1FSSE9JSFR5U01mZDlUOWFoQmgv?=
 =?utf-8?B?V1o2dVk4KzlkUmk1Tm5NUlRVd1BTV1lvYm5BQWI3eERPS05PenArTWN1bi9v?=
 =?utf-8?B?V1B6NFFrekozUjM5dENDQVpuN2tkNW80L0I1WEw4VCtBUUxlYlNQRVFVdTRG?=
 =?utf-8?B?YzUrZ2Z0YWJvcnc5VTZRbElhc1pscE84ZlNlNXpwMUFWNHdSbnNHR1B2bDFj?=
 =?utf-8?B?YW9HUkQ3aEx2aDg5K0xlTjI2U0ZPK1hkbUVraG8vNzV2ek1uUzNZVUZ2dEFp?=
 =?utf-8?B?bEp1RVIrTlFLUHVkMy9YUEtFU0hoL2RmWnhtaUtzRXhFYXpKdTRsdFJqNUlJ?=
 =?utf-8?B?VFNoa1pJRnMwb3lpWkRRZVpITHgvL1o1VTVmL241ZWo2QWNXYXBMbEo3ekF3?=
 =?utf-8?B?eDlkQmF0VTFXVnV0R2JrNUI1TzNtKzhSN3FFazB0VFEra3V4d3lCQXh2cStv?=
 =?utf-8?B?Nks0d290ZmNTSTIyUHMyZS9WMFZsYVlLalRiNXREbE9ZRUNMNFRDdGt5SjF0?=
 =?utf-8?B?M2dTWmx4UGJ0aG1RQmtIcXdqOFRxZG5TbC9kOWxyMUtqOE1weGgvZmQ1c1pB?=
 =?utf-8?B?ZkRpRCtUenpRUGFyUFhBT2RseHh0UVJ4Y0xXWlJWUnZvVlN1aUFoS0FHS2ZB?=
 =?utf-8?B?b2NuQks0ZGxmZWdsRmpjamRIRzNsSFNRMUhudDVteUxidFhOdktnNzQ0OUxC?=
 =?utf-8?B?N0dqQ3NBd0hRUU5ISXpIUlBEdjBoNEZzU2VtWFhHbGxFalN4eU1qQWs0Q3F2?=
 =?utf-8?B?K1lqeFo1U2o5VFc2V0VyYy9KYk0wZ05wcnJXVXpCNkI5NWV2T1BMb25IV2h6?=
 =?utf-8?B?aGJka2lyUnNvZ1BGb1hpMjR6elAzSzM0UmxJdFNMV1pENE44YU1PUHpWVXph?=
 =?utf-8?B?cFRBNFRkRE05WW1kc3FjRmJ5d3ZiWFJ3aXd3SHpCaTY2d1lhMURnUkZjcUxm?=
 =?utf-8?B?bFQzSXpoNVFVZlowNEp6eVROa0hzTkk1djc5WUJuMjRpSVNJQ2g4LzJmUDda?=
 =?utf-8?B?OWR1b29naVR0MDZMT0pZQTB5UGtnMkVaeDV0ZnhSb0R6a255cWxFTUJLS0p2?=
 =?utf-8?B?c3hKa2kxRUMzVEJpZ2hNSkk1RlhDclVlMG54TG4wdVpzRG1NZWdRMW9BYk9B?=
 =?utf-8?B?ZS9qL3V2ZmtEOHNQSkxYTTU2aWk3Rm5Pd3ZsMG01bFlEZUZ5Vm5VdDNpNkVI?=
 =?utf-8?B?TCtjWW1STnNpOEV6S21nUzYrOEg4enJkS3dGVVV2TDN0VW51bGc0dHlLYXBE?=
 =?utf-8?B?bzNyQW10S3JmdGJ5Q3hDdkpuVlZzSVh1UHZJUzQ2dkhFcjBzUXpTNmFZTWRU?=
 =?utf-8?B?UU1aNjJrZnZZbXBKZXRRRzlJcjlzV3ltcHBzZDVjZk5rTVk3T01sTmpVQ3RH?=
 =?utf-8?B?bHVKMXlVbG9NR0ljbk81NmlhL1pYTWpuQXJYNHlWMGZ2UFZsVHpDWDNMNDRk?=
 =?utf-8?B?WDJhdjh6cHQrUEVPLzZGWDNCVU5KenlWUkxVR3Y0VHdyS3h2Y2xHNTR4R3lP?=
 =?utf-8?Q?L98OoxAhUkw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGxmMVZiMWxUZTV0RlN5a2p5N0svTDJibHpiZFFjS3YvTG9LYVlDNWF0M1ZX?=
 =?utf-8?B?L0NSSEtkcjZtMUd5ajhlVWZqQm94aTljaUpYUWFVRWJzM2N0ZjFzYU9SZWh2?=
 =?utf-8?B?aXNacVM0UjhlVWxzSUxLeDVDWTZXRFZvVkRzeWNpa0RQclpKcHZJVTR4UElM?=
 =?utf-8?B?R3BBT2JtTjNFUFhwV3U0aU93aGpHRUtaMEF1Q2ZISEN1KzRLSlZHNTM0dGNC?=
 =?utf-8?B?dVFvWlk5dXBRdmRBeVZPclcwZHJFSEhZUk5NUVpNbDBxZ3U5T0JnenF1YXpj?=
 =?utf-8?B?QVR1SmxQL2VmaUx6VGRRd1RFcTdWdmNhYTFhNnhGcDlCa1AzZ0ZVZ2ViWjd4?=
 =?utf-8?B?YklKM2NnU0cyR2hwcmk2bkJrK0h5Z0hyRUo4U3pJb3hSeEdQbUFLckx3MGph?=
 =?utf-8?B?R0FFUlRUQ3BHbUozbUp1UGtTVGFWL01Nenk5aWNsN2J2QjhLTEJ6T2NDaEZy?=
 =?utf-8?B?MjdyL0I3NWh5OVBSSEJhUm5NNEZsOC9hY2tQZGR6U04wNFVEcldLemxYTnNZ?=
 =?utf-8?B?alNBOE5HemM0ckI4S2JHeVZ4ZWhlQTFVaUdnc3QxSWtBTmJiMjFGTGMza0V5?=
 =?utf-8?B?QnIxaC84RERaS3BJd2ZDNjVORGNlbVNoTlhrQkptQ3QwNFpFTnVUbndKdWFN?=
 =?utf-8?B?SnFIL1Jvb1Q5QUJ5Y1U4bXRkWjYrVGZUVnJaLzlBNHRWc01jSlB3Z2xBNDht?=
 =?utf-8?B?ZFZMU2c0SnF0SmQxLzZZTWJBTXRmdEJIRDJNWUFrNERreHRpRjViazBWQm5Z?=
 =?utf-8?B?aytoZ0o2WjNDZjlQQjF2SmlVa0UvWFpaUm1aeno4VUhCa0tGYzNXRUQ1Q0lN?=
 =?utf-8?B?QTk3RGxncjJicXBGK3gySEFDUGVOL0N0U04vN0xHdlF6Y1cvMHNrUlc4WDRP?=
 =?utf-8?B?WmRRNlI2OG85ZDdncUh4TTE5SlRXVW1GNUl2VURoTEdKdmZjUEZITktSRGdC?=
 =?utf-8?B?anBRTlBqU0kvSkRHMVoySXdpcS9NR0R5TCswUTZBK2JZTmJ1OU41b3AzaFhI?=
 =?utf-8?B?WklKbVdZcTBEM0VQOHZ6TkJtd1VKd3dlTWNkOFlqZFNmd0xQQmZPdGZEN3Rk?=
 =?utf-8?B?YVlOWEZNQjNQYjF2ZmNad0dOM29TRWFHUVk3ZFFTY0F2cFNCVzR2RHhqeTZ3?=
 =?utf-8?B?aDdmcnJYMUc1WThQL2U3MFhVVElsTnc1V05LV3V1WEt4U1YwMVU4OFAya2NM?=
 =?utf-8?B?VHRqLzdPTjV6cFZrTG4rck9wNHBhemxlNWRkY0VwM1NoVlJxUXQzSXVMSCtI?=
 =?utf-8?B?ZWZTWDErbXhjVXJnQTI4cWJ1VjhNNTF0WUY2MmNRZzJPTlFqK2EzTDZLNEdr?=
 =?utf-8?B?UVBQaTZlSXcyNkNVWkdCdUdqUEhjNWpmUGYxZnJYaUtGU3NjaTBFKzh1c25t?=
 =?utf-8?B?SndmZ1ljdFh1ZC9MOG1ITWl0VmZGdytmUWRKamtxYk04UmYrV0E5SEFucXlI?=
 =?utf-8?B?WGpjSU9CeGkyd2RnNUpMUTU1Wmp3Q0dYcFBJcjg0cURJTUJQTVZkQlZSU3dR?=
 =?utf-8?B?SEh5YzR3dGEySVpCK3Rib2xxY0NEenhKa3VWRGdENGtNRzhhNXdldW40cEgv?=
 =?utf-8?B?VTNUVVZwMVZURlV2U3FSS2w5MkIvby9VV0VRak1EM0x5R0NUb1FwMnNJckZx?=
 =?utf-8?B?ajhoZlZua3VmRGFKcUhtM3VVNjRkcDZQSXZDVFRjdzExUCt2NGx0c2lHNjZZ?=
 =?utf-8?B?b2RrK1lKM2drR1hXZm5BRzlLMlVFbnc3Ui9wY3h0T2N6S2FqZ1NTR3hBTy80?=
 =?utf-8?B?UW1XQWphTmdHc2ZkRHJuT2UwK3UrRVF0K0VPOUk1QlVCK0ViUVJ6WldqbnFS?=
 =?utf-8?B?NUoyNEZ4Q3l5RXhQRUp5UHZDWmN4MTlRR2IvWTBWWVpQUVdlM1dCWkMvSVNx?=
 =?utf-8?B?eWRZMTYwcWJvMEpvTFNwZWU3bHhQWHEvblhCZm1ROER2QUd6WTVpVUZyRjI2?=
 =?utf-8?B?Nlc5RFBXSndQVVRsQXVkdFdvUTZSdHkrQzdvR0tEVzYwVjNPVXYyaDZZS3hW?=
 =?utf-8?B?NUxYTlR0TFgrMlNMNW90MjQzbkp6bFJ2US9ZQXVhOVJsUjJweGEzTXVnekRL?=
 =?utf-8?B?dGlha2xiSFdEYTBWeW03eWJMR2lla3V3OHJmZDBsR3NoalFYekZXenNTNDVB?=
 =?utf-8?B?ZUJJL3FkUGFVQ0dUaG9IWWpIb3JOekxrSjZ6a0JvNllSV0RkZmR0L1oxOVhr?=
 =?utf-8?Q?a7eMV/TfDUHDcL1okDGZLcYQM2eNTCBHtbJlgsiqXVYd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d15d3c4-bb21-4837-0f4f-08dd76a50bf5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 13:55:40.0946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjOErUQP37cXMUmukWYOPNUvqrcjndaaE6XXLBud1TlfoM5zVve+udFLtBGa+Tvf7hmpAhGJePUdctoaJjibkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8503

On Tue Apr 8, 2025 at 10:40 PM JST, Alice Ryhl wrote:
> On Tue, Apr 8, 2025 at 3:19=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>
>> On Tue Apr 8, 2025 at 7:35 PM JST, Miguel Ojeda wrote:
>> > On Tue, Apr 8, 2025 at 12:22=E2=80=AFPM Benno Lossin <benno.lossin@pro=
ton.me> wrote:
>> >>
>> >> You forgot to add the `A: Allocator` generic here and in the impl bel=
ow.
>> >
>> > Yeah, for this sort of changes (ideally, all patches, really), please
>> > test with both the minimum supported version and the latest.
>>
>> Apologies for that, I had no idea how to build using a specific
>> toolchain and did the wrong thing, which is sending without proper
>> testing.
>>
>> I had some trouble finding how to 1) find out the minimum supported Rust
>> version, and 2) how to build using a specific toolchain.
>>
>> For 1) I eventually found a hardcoded version in
>> scripts/min-tool-version.sh ; and 2) is somehow documentated in the
>> Quick Start guide that mentions the `rustup override set stable`
>> command.
>>
>> I can send a patch against the Coding Guidelines adding a section to
>> encourage testing against the minimum version and explain how to force a
>> specific Rust version if you can confirm this would be helpful (and that
>> min-tool-version.sh is the correct way to check the minimum supported
>> Rust version).
>>
>> >
>> > For instance, there is another issue, `#[pointee]` is only applicable
>> > when you have the feature:
>> >
>> >     error: cannot find attribute `pointee` in this scope
>> >      --> rust/kernel/alloc/kbox.rs:66:18
>> >       |
>> >     66 | pub struct Box<#[pointee] T: ?Sized, A:
>> > Allocator>(NonNull<T>, PhantomData<A>);
>>
>> Mmm that one is trickier to address - I don't know of a way to make this
>> `#[pointee]` attribute depedent on `CONFIG_RUSTC_HAS_COERCE_POINTEE`...
>> Only solution I see if having two separate declarations for `Box`, and
>> then we have the problem of bindings the rustdoc to the declaration that
>> is picked at build time... Any idea for how to best address this?
>
> This might work:
> struct Box<#[cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, pointee)] T>

I thought I'd tried that already and it failed, but giving it another go
now, it indeed *does* work. I must have been thrown off by a different
build error at that time. This solves everything then - thanks a lot!
