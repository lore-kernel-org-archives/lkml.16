Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AD4265603;
	Sun, 15 Jun 2025 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749996523; cv=fail; b=H7GCW6dwb18BlQNsfTRyq1O2/nFM/al33BzJwgiZ6rlYrMq+HS2RyBJzwtUkXT+YY2BFZfqpDTgtwN5HQLKKfpJOKn989e7+H5/CQikphuZ3aB+efhiK96cwEAqGq0D6dA3uGsoJwR6j+MX4pd+ZB9nbNEjP9T2uTVoFb4U+q9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749996523; c=relaxed/simple;
	bh=2ONn2kCFENdWqpK0E+Rlml+7goMKNTNeCos3MCXAMAA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VZzSRSGCVJSE6W4qIlVGNP5/L8Hm6J3DJtBfk07tzUm8492dZT/pcG8jJHfUzIhnZswipddPgmAV4i0IhyYswiT+i3w9SZeltmPk2RabC/HKxozIdd/VQ12+u/sMrAzGd+cvFBS1prPvqZNrBy73G3Ta7VDd03KaBr26W49RFM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pbMixVVr; arc=fail smtp.client-ip=40.107.101.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pbMixVVr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3Lvxdf//sSJ0bG45QvPXuSUMD3OWht1WeUcfQ0R0lvM5feal0XZwTLeizP6ZLPyqm3fMtWEJ7v3yCv4l4LEx+jwgwq9dIGKgfV1M+jc7TWOTHOBjAQjfnueEs9EWPly7Cc0TzDc6c+iOBMzzTPQCxF9Sdx7WT9rKHrM8+qUU29T7BvMhXLJ3vnW3aXP1bgIKK1V6kEqVodXGPa5yPZtGJWdRdAKHtRcSa01khtOS/OzbUuLLC+pzUD5VJqEIlOstF9bp+BjRunwgwwHeq/7ouXnkKaIaXdYaZ2QU5yS4/X6nSq+uCqDfilrBZViHnfst9ie5p3Vx4UEOkZRpf1Ltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HByH++y6Cpu9XCQeileHiuhBnQhlHEwAqTQUXD8/sw=;
 b=wo4bp9mF6C+slrRQjJ9fM/j1sB/fQbiG5/byhKzlfhCpwgBYZM213IdY5z4CGe3FSss4bCwWREIfK1TIvoE2R79rSfml64UrqVc9Ltrmt7KzEkxQ0MS9MDk2thQbyPDGq5Qc57VhKxxrwr8SWOcRxgtuSNKTF0XVcDdjqcy7/vCeRkqyHNPa3+QWsY5ryL73PSTkzlDDrh45n1Wu6VhTPO7z/427dodTWbp/JhXidbiXRzVDsleTjPL44jUQTiOckZwTBN+yCbe1eWc42vmark5UOEUyQMegJvpBoQQ/xoSEQQQyovaJJOf2pvVLsV+6X5EXyXUfxiqFEEhMugKEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HByH++y6Cpu9XCQeileHiuhBnQhlHEwAqTQUXD8/sw=;
 b=pbMixVVroPQ3+1fOwlHCqQv6io4BtL5Sp4jVxTlzE6o7aKCqq4sCy2GfVZpyCH+5ikUP5Ol3VPWmunmB2zEni3P2tmpdQAPX9IXTjk+sHTdnk4uQTS7rB4WdNaZfQERRDXsgQWzBnn71ZymAj1oJyuBzGOVJzanozOP82ONBZqBsVOsqLuUrv65BsxFC20nLitbrXs6NbIdpdhT+gUk90f1IQzKjide3BKKmPFQVbd5f3gvxcVJJ3OpoLvCwSLnqkWklgPsz3VAxAqh3TOp2Loe3/qZ3G6gjOO5lgF5uRS4mej8RPmzZbRSETclbyl1KvANAQkZdIzlzZ/82X+1q6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB9460.namprd12.prod.outlook.com (2603:10b6:610:27f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Sun, 15 Jun
 2025 14:08:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 14:08:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Jun 2025 23:08:35 +0900
Message-Id: <DAN5ZONHV9OX.1S5KRJJ0VFVB4@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] rust: str: implement `Borrow` and `BorrowMut`
 for `CString`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250615-borrow_impls-v3-0-621736de7f29@nvidia.com>
 <20250615-borrow_impls-v3-4-621736de7f29@nvidia.com>
 <CANiq72kmN1iK=AD0yzj5TyMGJowaFzGMZjEXfUM3TCSRJkYuNQ@mail.gmail.com>
 <DAN5JZIZEIIR.3DJEY70B1TZJT@nvidia.com>
 <CANiq72keko32qoc9OHnQsJx8ae50c2x=kij6r_gkwpdF-9n6jw@mail.gmail.com>
In-Reply-To: <CANiq72keko32qoc9OHnQsJx8ae50c2x=kij6r_gkwpdF-9n6jw@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB9460:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a1c8c6-e576-4664-6432-08ddac162017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHNpUUZFMTc1R0E2bStxVDhLczRhZTc1UnNMSXluTGp3TGJUTXhuZzlUU3R3?=
 =?utf-8?B?S1kzMkNDbWxKT3dqbVZOT3RwQTAxZjA5ZENnTFh5aCtYVkxqYjJZd3NWa3F3?=
 =?utf-8?B?M1NuWTRlK2NaVmgxckdvSTRDQWlDZERRaFA4MUxuYkN0MHVzSmdYZE15T3JK?=
 =?utf-8?B?YndjTkN5QmtXY3lpSVFnUVo0Z3lpb05QTlpRSUM1TVNwNUZkcVVINFU4Z0tN?=
 =?utf-8?B?YStvR2pKVTFvUU5yeGw1a3dHSlNFOGk1ZUtjSjNzN29HTUM4QldtakRkZGpw?=
 =?utf-8?B?Tk95MkM5ZXRsWGNmdUV6Q0xxZitXOXNPNWg0TGJBdmI2N2RQWC9IRDJnbjY2?=
 =?utf-8?B?WjFYNlpmcnRZR3dvc3lkbmNhSGp3UzdqeEFZWUZ1MEVubm8vYms1UEhZa1Y5?=
 =?utf-8?B?eVhlYmp2RjhVdlRKTEMwbnpqdTBZL1lLc1dGdWQ1ZHBzeDZiRUpUQjRxTXVy?=
 =?utf-8?B?VXZIRDVCYUJTNVZIaFpXWVZoN2c5K1RDVWpZMHl5QTdBdHpzOGFucjI0aGtB?=
 =?utf-8?B?NjNkSmEwbFN6aFZBS29PWVRyNGVCWTJWN0tyWGtSdmJTTWZUWHlPUTNFMUww?=
 =?utf-8?B?eUFnZDZGSlJ4WnRKSU5tVy82VTg4aGZjbjJsNktGS1cwZGVSM1F1d1hxV0F1?=
 =?utf-8?B?TDdJQWw2NlhTT292b0NDMGorMmhYYTkwNE5xOUtSRTdDV3hRampZemR3dW03?=
 =?utf-8?B?SC94S1BzeEhJSm93bzZTMG11My93QlRuZ3RtbVE3a1NKTmJDOVAxVTZVQ0dv?=
 =?utf-8?B?RUVaODhWRGZ3THhvYUIxYytvTVRRUzlWL1lhM0Q3a1k2YnJWUnNjeGpKV3Jl?=
 =?utf-8?B?YVdLMEcyY2tYNWdRVkhoWS9qZXhRQjBhQW9EZFlBTmpTZU80d2F2Q0piUUtP?=
 =?utf-8?B?QzNGMURpLzFjaWg4RWNyMU5lOGNiTEJ0bUM3RjhTRkltTGNPR1FrYjlaaW16?=
 =?utf-8?B?VTFzdE9nYWJjUHhYRTZINUNWcE5VNE1NUldWZGlDSThzVzhkamQxZFFvYnFs?=
 =?utf-8?B?aWVZc0luN0hRQ1h3UE0xTVhTWVBJUWk4Y1Q4TDI2a0lHRWd0VG5xSGVrc3BM?=
 =?utf-8?B?MFBHWlJXTlA2N2FDNWdHV3JPWEJqMnFFdXh6M091UXR0clZpSmhremZoZmlr?=
 =?utf-8?B?ckRoa05LZy95d2pZM1BoTmhEUXcySTF3T1BKNFZoSU82dnZWVkRxSXlGMk50?=
 =?utf-8?B?UTQzZ2NVVXhXWCtMQVZJcHUxRWxkbjh6RXBEMFoxOUZKcmhra1MrUENOVDRn?=
 =?utf-8?B?N1ZDZGg3ZUMyeTlRNmpvSGNoNzlzQ0FvZTZzWUpLajV3cmdCUGsrMU5UbURV?=
 =?utf-8?B?MjcrMUxDcGFPZDNUV1BFVVFxbVArdmtNemljTWJVaWYrRjI0dGQrNmNvZys2?=
 =?utf-8?B?RWYwbHVpQzU0Y1hlaEt6bkNUczRhSE5wT25DeklJdW4zOFVOZ1QybWVjR01m?=
 =?utf-8?B?NEJZK0xucmZpekp4ODVKL2VFVThSZmdXNHo3Q01mV2ROVXVaREdRS0JJMFBI?=
 =?utf-8?B?WiswMCtBTzFNbE5hMnRoQjU0UVAybnVaUDVWeWEwN0pJUytDNktVaGRyTEhv?=
 =?utf-8?B?V0w4c0ZDeWIyR1RuZEpPeHMzTVZPTjI3QlZFZnFsTy8xNmlCb3pJOFhxZWhZ?=
 =?utf-8?B?NkY3aDlENitlMHZnVFRKRlZLVXhHdE1LVnBpQWpSMXlWVmNKMC9xR3Z5YzdT?=
 =?utf-8?B?N3RicmQ3ZFY5bmM5eXZPalVJak9LUS9LeHZvd0JNeGlTTHFFaFJPQlNWck02?=
 =?utf-8?B?Ly9UWkNoVE5Ld0Izbk4zR2xvUzZBeWtZeU1rQktWbWc0NXNoc3FjZDladGpx?=
 =?utf-8?B?b0dDTHZlTzRLcG1yVzU1L3lhQUJCUE5hd25YKytxVyt6cE5SdnJYQ0g0RnBI?=
 =?utf-8?B?c0Y1MFBnRDMwWUQwbWFZZ2ZMOHEvd0l1b0ZOQXpRaDNjdDhlb1ZreUFuMkRH?=
 =?utf-8?Q?8F8SKmcrj9Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTRqQjZTRFc3RDE5eG1EbDB6Z0ZtUUdldzNpNDZVRXE0djlTMGljeVRpclpB?=
 =?utf-8?B?L0tvZ2ZyQkF1S0Z3V0lsL3M4ZGxMdnpLU0Z5VHJ6NmFJVmVxV0x3Z1oyTUZK?=
 =?utf-8?B?S05Lb2VHSm5PdU5vK3RFWk5melpGK2VsMzJkbitLQ3FOZ25WcUgxeUJ5UTA5?=
 =?utf-8?B?UFJsNy9FWDB5bmg5ZHZTT0szQjFkUGU1T2Zua292Ni9udVQ3b1Q4c1dYc2Zy?=
 =?utf-8?B?T0p0Q1RRTTBhK0k4WVgzWEV3NGFhRWlENHVRMTN3Yk1CbEZ1RXl1eHRJL2tm?=
 =?utf-8?B?VDJIb2t1Z1JNakJZd0JRRXF0c0ZqUGtlZmd6ODJDUzgzOXo5bTRlcm1Za1dX?=
 =?utf-8?B?eGxqVEFFR1hOMmEwcGNHcnMzWDY2VEdHV0w0eVJvY2gwSnhxWC92YUFqTGU4?=
 =?utf-8?B?VjZmWFRrT1IwK3cxUVhHSnZGSTdFZWdjM3FPWEJ3d3hON2YwSDdCc1BqUnJM?=
 =?utf-8?B?ZUxiV1BLMHdUZGhNSWgxemVoVWNiR3BOMTZaSGxoT3A2YnR2eGNuTmtMaTB3?=
 =?utf-8?B?elVlOUl6TnJXYTZHZEFuekc4SlVsOEhvN2FIRVk5cGVuU1J0Q2dMVW53TTNV?=
 =?utf-8?B?bktXM2RJaTVXczBCbXpzQWhQZnRFOGxvaG9EaEl5TzUwZU85MmlFcXRwT2Rm?=
 =?utf-8?B?R3lmakd6OTU0ZHR4OFovSlJVTkNJQ1ZrcGRvZHlXUzFyNVFhSGdBNDBUMmNy?=
 =?utf-8?B?UDdmYk9XbDdjYU1CSml3RXdLcFVNL1dhNXNEVlpWS3N1Z1g5VDBKM2F5MXFR?=
 =?utf-8?B?alVQS1M5bW9Vbnk4L2s5TEMxM1Z5Um02NXRmb1pJcnVzSWpwS081ZWhjMmha?=
 =?utf-8?B?TDkvTU95SkVhbnZGMWVsL2R2bWV4cU9BakNuby9qZHhwc3p6UjY4b1piRUtP?=
 =?utf-8?B?K1liSEo5YzBLZXZHaGJkeGZQREVaZkFqbnQ5cUhLRVBFT2VWL1o5dVVUa2pJ?=
 =?utf-8?B?ZWQ0YnZBTGloeGZEQ2RzV01PQ2NCMTdCRmNpQ3BVdFFkK0ZJb3lmUXB4VFg3?=
 =?utf-8?B?b0RNUkpoZlZLc1NvNVp6bnVkcEM5VmpZdkYybjBGeTJCaGhhRWhTTWtMZjJ2?=
 =?utf-8?B?ajlrcVZwYnV3dHlZb0xLbTRob09LU0tSMVM1UFZGNnM5eFNSczAvZnB3RENY?=
 =?utf-8?B?aVZCSEJ2YVVFcUZwUnRnbE9XeE5Qc2VseHNBNjlNRDBlYWRjOWpKQWc1TEox?=
 =?utf-8?B?VDdGL0lTM1pkVGdaQ1E2QVFRRmNJcldLaXUrNVkrVUhyT1hGak9kb3V6Z3JK?=
 =?utf-8?B?YzA1RElyRDVLcDhibDRjcDVQWEZaRlJWaWRpU09PTVFkdGRIZ2QwMVhPSC92?=
 =?utf-8?B?Qk52ZHk0YnA1Z3NIQkJ2dkZUR2dtYTc4elZxK3ZlVjQ1L2xtTkFuUGxSbmlE?=
 =?utf-8?B?WnlNd1V3VWxXbUxCTlpCcGIxQWlyZWFORGwxdUw3UDM1eDFOTTZXN0VBellm?=
 =?utf-8?B?OWxwbjlSY1RiYUdaaUxQcFV1UUdSOUFCSmU5QUtyZnRGVW1qeUdIaWxtMjBG?=
 =?utf-8?B?QVBXbWdsZlRkYmY5REJmUlAvVTdCWlZ2MTR4UDdaQW91UE8rQnFzMFN2aUo3?=
 =?utf-8?B?SFg5MGFvZDZ6YnY1ZWxId3JFVzl6dHJxWlFkVHZzNzBtVUdNcG9RekxjQUVK?=
 =?utf-8?B?b3NGdHBPRzBEazFJcHA5eTJJcU40eXlyT1lPbFVqaFF1d2Q2K0JNd2Jrcm9n?=
 =?utf-8?B?M01haldlMnd1bmRnTTBITUJmUDFiOEJOMWpTa3dHN0RVWGV0MmFZQ0ZrU0FN?=
 =?utf-8?B?MHBDbFBUTEs1L1Y4Qnd4Y3VMQ2JHeGE5TU1QeHRaUEVrd1hJTjZEUmd2bVdu?=
 =?utf-8?B?azJLdWtVR2Qyd3daeEdpaXlBT3NjZ3BReUFFcE1jZktIWWl0Q2RNUTdBYmNq?=
 =?utf-8?B?V0pmVWxjNDZnNDRFVGJMNVdlZXN5RHBrVU9CNGF5a1pDMytob3pEMnlWbTBJ?=
 =?utf-8?B?WGYrd0hjam1SbFJKMmFwclo5TTM5ZVdLaHI3cTBXa05yaTN2WTJZcURieE9h?=
 =?utf-8?B?elhhTzZCei9VRnZ1OGxSY1lYck1XRUdySHk5Q3Q0VnZTa0JRaHZCK2l1TnFQ?=
 =?utf-8?B?TzV0Y0ZYdFNrNEh6NTF6RUN1aWNvMmVpZmNVdER5WDMweGRwNFFKVDZ5UHFz?=
 =?utf-8?B?Ykw5cEtCNXYxTXJtU3owdTluNjlUUzFRRW8rWEZDOWxEZWUxenkzT1d6RUpV?=
 =?utf-8?Q?P/YmY5ISyEmyCq+PLwKcDnHzHbAxfpYowB8SkLXr9CJR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a1c8c6-e576-4664-6432-08ddac162017
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 14:08:38.7598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtlfmp0jOQseQwsvwuPMqizAKtc6o5sV6rFw5qAaag+m3nqieDXhhVoNXMMI/JIA2rYQ0wF5HiUylClq+u0j+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9460

On Sun Jun 15, 2025 at 10:57 PM JST, Miguel Ojeda wrote:
> On Sun, Jun 15, 2025 at 3:48=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> I thought I could get away with it since it is in a test, and clippy
>> does not seem to complain about it, but...
>
> Hmm... It should:
>
> error: unsafe block missing a safety comment
>     --> rust/doctests_kernel_generated.rs:7973:24
>      |
> 7973 | let foo_borrowed =3D Foo(unsafe {
> CStr::from_bytes_with_nul_unchecked_mut(&mut str_data) });
>      |
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Do you have the doctests enabled? i.e. CONFIG_RUST_KERNEL_DOCTESTS=3Dy

... and that's what I was missing. ^_^; Thanks!
