Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5065BC2EF;
	Thu, 22 May 2025 05:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747890102; cv=fail; b=X33P+hsGXKGnMEFcwJZlYtTP8GsEv/L7ywGm6MoarlWbd0uGPkmwhYmxFrGbKrKCrBePg5siHA0PLI/76tpOqmOdt4VMp9RMtT7mmKJ/0jXkfilo6Nmmz8NCcbsoDpxUpBTBLrDD27DEgpF2jOXlZGBBFFPMlKDZouCBu8eXT7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747890102; c=relaxed/simple;
	bh=Nr7/AmQxynsAtI4yk+EDjxYDKVHUv3UvmwOarX3hWHs=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=cbTwDjtdxI0WzEKYF/De4ye4qWqM3QGk9vCAuYr8Vq1ptNhtcpbMoLY4dXwr1nqdqVlvn8EymbL79qKsIHo2D7IB36rc6+xSv9YmKa5JLhoUV/mFFqbqoijaXaZGHQZsljjGpxXrb78dLChKeg0/a+lZwtrtyhYBCO4V93d9dBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XrEUzl8A; arc=fail smtp.client-ip=40.107.237.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XrEUzl8A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llUnO44K7cS8FWV9CM31P8x4sw0Md9NZeU5kih9HYzZeag6mlXHZZlJYPu59BnpiwmYbzGDmkTyX5V4MhnI6U7ZGGyH5AXCLxxMSTCVMv9FpesOdGTVcgA5Oo6OUoYcYydSnpSc+hJv7nxcN9hg3BmZX/a7r6rtuzwVd37sLm2esT2TrypOn4bGFkyTctPKThptK665iA7TMV0hcLhrArJG20HNyXaqO6nHfoGi6rGxxLGIGfGKc7OmECvt9MuHSNMObQOpg9w28oF5kpzLV7onHzP0MHHXAolvMw+JABGoC7onuvJevwrZR3jl1pQzi+6K5uf7nE6m9x1fzlkruyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LjaX34uT9G0+DLDdBd4vNSb2DAIIpM3q1BVd/9DVYE=;
 b=O+ggbVgcQLuJBGwcuzu1EU5dGvvznd0eZnhOKAMwUJtulisPdSG58GuUAKLfJJLboGO7XhSAPr8v8onS/fzPicTebCFggVHpaBygRsjcUr31aUxxv4QdDNhutVSQwiaueG2MAsraoiCR5IHrCOs8z0bVDKfXYn4eiY6AUPp0Tr3sZ2pFGKqUjQuud5kBlKmsOaz034nXsLKlQmX3gYA2E5jzVTuO1bDxACFornFz8zxm51GkI11ff9TysjNrrp4XU2nZ0XuImRtA0fkIYSj3IbXOHKviUFUPFwINE2iToAWLjy/dmU7g0xTjb7hXCAwuB1HWR5Afo/1Ewbw/s3BHGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LjaX34uT9G0+DLDdBd4vNSb2DAIIpM3q1BVd/9DVYE=;
 b=XrEUzl8Ap8jmkGLkdahb/QgX4Ul7BUu9lXs3QX+/P3qe7y5wgliPZuO9CN8kW5Kk0KuzkGxt5FGIkKpCJKRjtd9YKiNr7n8UQSXDOtdOXYe4Xc5eqAXDP6vPtPgFLgITJBV3/auqUOSCI25mEo+0K2TkgrqHNqrmVSvc2W+63sgffy0iXvLYPpE67iUmfvytSYjeegSrs0TOTj1zDAkENYTUTkUBSR0AlToXxnt6grV84+HmvF1EeQiscSh6MVIO9Kjv48Jnw8GNvHU8jca6nlEDAKHYjANwivFyzMwgXVo8/KOJAPKTV57O9ju8tnWgHZFJ8QUiiexqvkXBjnip+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB9513.namprd12.prod.outlook.com (2603:10b6:806:45c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 05:01:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 05:01:32 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 14:01:28 +0900
Message-Id: <DA2FBPO5OL2I.1DJAT7E7JOSFJ@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Fiona Behrens" <me@kloenk.dev>
Subject: Re: [PATCH v5] rust: kernel: add support for bits/genmask macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250326-topic-panthor-rs-genmask-v5-1-bfa6140214da@collabora.com> <CANiq72kkgBtEWNQtu_tZpUYC+b-_3RsnWFO2biHPB74mrKE=AQ@mail.gmail.com> <8998B971-BB46-4624-8077-5C85FE5FA97A@collabora.com>
In-Reply-To: <8998B971-BB46-4624-8077-5C85FE5FA97A@collabora.com>
X-ClientProxiedBy: TYAPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: dded1e62-26d0-42d3-d4ae-08dd98edb7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nkp3YjA2WCtoWWJQN1J2RkRadGw4eDJCS2ZGbUhWM0RpN2pZM2xtQW5FTTgr?=
 =?utf-8?B?TllPNzlLZm5zeGZNQ3d6NDMxMHhnZDNMd1pldXN6a0lUS3E5THNmR01LdEpu?=
 =?utf-8?B?NS9yMUV2QWpHeHlXcXg4S3dKMUt3c0ZFYlFqOVlvZHllanNIUWVwTDNVWDBv?=
 =?utf-8?B?QjBuTWpZZ3o2U1R3ZkE1eGphUnZXUjRNZzgxMVVRRjIyM0g2MW9xNmxidnFC?=
 =?utf-8?B?YVFXSlJxdCtZWUpNSWlzNFZoWW1WOThveldjcEwxUTRUY3ZIK0hpZjBmVWxk?=
 =?utf-8?B?VzZYUHI5WVFYT2FiYUhYTmthMzdGVllGbDUwVGp1bU9TL2JXZENBMGhZTzFY?=
 =?utf-8?B?L29yRTNWN1A1bHUyVWtoam53cXozUmd1VmQxWDljUjJUemNHWHFtNHplSFp4?=
 =?utf-8?B?N3JmN01OS2YyUE1WN0ZrNGtvZkRpVCtYK255RHRKZVhNYldxSTVlZFQwK0Jw?=
 =?utf-8?B?dnc2UGE2cWdCc21GbW9JZmxyMlhIRkIrenV6d1kxZmRIVm1CbXZTdXd5VVpW?=
 =?utf-8?B?WHVQRjFiZEhPMlJGbTlsc0oremMxdFl5Uk1mWVJOcjIveldSbTVrUHZRZVJR?=
 =?utf-8?B?dEhOUkpZdzJ6WU1QUWZXN3M3QUdEMmVyekcyMkFJYnpCZm5FYjJhV3hVcS85?=
 =?utf-8?B?Zkh3TmxURUJQL0pCaU5WT2JvMmJoRDVORy9MVURmK2NxTS9XTENzK2gybytQ?=
 =?utf-8?B?TklEczhMVjZPUms3OEludklkWmJTSTFpbmJNekVtZzhzUmhQajk1ZVpUSEps?=
 =?utf-8?B?V0hocHZZSmM4bmxoNkllRmpYMWp4NHBrYmdRSUtVQzloNlJ4WGZySlJocXUy?=
 =?utf-8?B?VjQ2NG4xVHU5L1o5dlRsclVpWDYrVk9kRnZoUW8yMHg3ZEkvVmVhemE0NW40?=
 =?utf-8?B?cGo3SlZRYXhRazJKeGd3TXhBSmNJOGVYMVV2RXFES3NXRVpsaGI5WDZWZkhK?=
 =?utf-8?B?SU9aTm94YmJuYjhFNUN2ZGM3c3VFbHhSRW1HckFQUjIvc1RqTXNHZWJUUU56?=
 =?utf-8?B?cWFwc1ZUN0EyaEFpZ2hNbG1PWW81aTFHWlNOblArQzhVQ1U1TnJPRXVGVUJo?=
 =?utf-8?B?cEFqNUxscVhrOFNqd3A3OGg4eUIwUmU1T3VPckFDQWZCbUFoeVZ6Z1ZmNWdh?=
 =?utf-8?B?V09WNEYrVEdBSUkxSHZiOE9WN01ZQVIxTXpSMUYwNC9mU0JMNk53NTdRZTRy?=
 =?utf-8?B?eHpPOUVYSHh1ZnA5SW9zOU5vdnRRd1lKeW1XdWN4L1l4OU1hSy9KZXNYc0tN?=
 =?utf-8?B?U1pmUUx4bklXRmFYRmF4SUVQZkZXdmVySVNFTmxrb053cDdWL3pic2RpZGNw?=
 =?utf-8?B?SEpuck9NYyt1THZyeUgvTStYaGZhbmZWZ0VvNlp6SHBmNVY1aUxaeWNRd2Yv?=
 =?utf-8?B?THJTL0Y5dU5RUnFkbTdFV1FKY2U2V0ZUdThBblRzdEdJWWIzcFAvQWZBcDNB?=
 =?utf-8?B?UlFIbmtRbkZQZldCamhqdWFhejlIemVvNzBsTEx6VUg2SlFjT25CdWZ5dWRv?=
 =?utf-8?B?UllrUU5KK1hNdFNzUnQrYkVhcE1OV05iNWZOczd3YWpGRTFvV0s2VHlSUm8y?=
 =?utf-8?B?Z1F5WlJYb0gwcWx3bDRzN09RdENnRUR6Mmljdnptam1PakxjS3c4MnNDSnUz?=
 =?utf-8?B?ckZyUWdBSXAwZ0Q2NFYrSko4SHZkeGxBbnpaRVBPUDR5MXFCMFFvRlpYdkRr?=
 =?utf-8?B?T2dYWXovRnpYR1lqam0yaUVWQ1ZjYlAwbG1GSFRGbU5wY0lXWHZjTElMMC81?=
 =?utf-8?B?aTUxbTl2SGt1VGJQSHBTM3hYdzFOVFpoQWw4NERlUzhHRHllZTlURm54MnNP?=
 =?utf-8?B?SXVVc0JsQ0Z4QXVRaFZoeWJjZ2E0cFowc2pReWRZSVN1U0Q0Ym1wTnV5WFVD?=
 =?utf-8?B?dVVSN01WTC9KK3FHTjJPTUo2aXdTcFFQNTNRRSs1TmJnMEF3YUpsd3pNcmRp?=
 =?utf-8?Q?JDqTzz7XtGU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk1MR0d2SG1iWjMrT2N5cllYQklNRklBd3FYcVNJSC9yNm9jT2p5ZUFMZllp?=
 =?utf-8?B?L1ZveXhobFdoMEVHNmV5cHRINzNWVTZreHArdm5jcWl0SjlQYXVTSWFpY1Nv?=
 =?utf-8?B?UnFMbWxWOGZ0YlRUbnVoVnFYbEtsK0JpTHdWdkpVUUx5aGlEWjVyS0hsdkFU?=
 =?utf-8?B?cDJJZFVqZE5wZldBS2IvaWlJSVJERnpHNnZ5cTlBY3dQOWFNWnFiZnkxc05S?=
 =?utf-8?B?Q01KVkZ4Q001Z1hqR282c1RqK1B0amNqZkdPMTNOVVBMd2pSS0loenQ0NDRp?=
 =?utf-8?B?ZW9memdnS3VpSzNuVDVkVWw2UWlEZkMwQ0RtT3luYlFCZ3hYa2xLVGEyTlMw?=
 =?utf-8?B?UlU0Z0JlMjVON0ZMNG11anFsamRoWnJFYnNDaUp4dXdUdUxDL3VhNXdlTnJ0?=
 =?utf-8?B?d09PVFNYUjg2RU80YmZISENlemE4MGIrWVFuWGhlWVRNSWRvR0hmNG9kWFN4?=
 =?utf-8?B?eFdDTHlSOFNsVFptQ21ySkhGenhiV01BU0d0RXRxQVFjYU9UUlJNRWk5ZnlR?=
 =?utf-8?B?NzdqMFNSUXIxbVVOdTEwSS9PTXMycFA2K0s4SlZneTlUcW90UXBBdTQ1MXhF?=
 =?utf-8?B?MzZKSmZTOFM4OTlia25lWlFPZDk3WlFjWnM0akpzVzBDU0JJeW1DSThYNFcv?=
 =?utf-8?B?OWZjdzVpL0I0ejVyUG1OWHBBOTBvNEtjSVFzNHU4emozZlJsTUtVajFCOHhO?=
 =?utf-8?B?ei9TTEJWQUMvV0lXZ0lvS3hwM1A3QUM4MHlvWjNSaVhRNDNWNE4ybTNvRHBx?=
 =?utf-8?B?dzIzelFiVlcrMXV4bmNqSXhhYVB1RGlPZ002dllUOWhRZFlqeTM1ZTd4VE9V?=
 =?utf-8?B?ME9yL3BYUGFWbUlReDlpSEtFWDFyYjc5QVd4VmZaSmp5VUhxMUM3b2RON05o?=
 =?utf-8?B?NExvQUluaDJvVXE0eXlYUGtnZ1pscFFFRTRwQXgxaW9ZU3dyd0E2ejBUNjM2?=
 =?utf-8?B?ZnhZNHRBS2RUN00rRTN4bzFROFZMWmVkbU53aEJxVTY1RXl5NGpFNVlkdmpp?=
 =?utf-8?B?L0tCSmI2dEo5YnBWWEg4YmF1eWR4aHZ3aEExR0JnakJmdFhyUDFBOTIxYUln?=
 =?utf-8?B?Y0FUY3pJYW1RT0xSMlgyNU5WNTUzczQ2V05hRUZVdnExY2V0L0xYd3N6Z2tx?=
 =?utf-8?B?R1Jvb21XVkw1aXZoOURUNDJpVm9XOHR6NWxNaHZ0b2k2RFFQbTRmcEZ3c016?=
 =?utf-8?B?cUZOSGpaaG5nT2Z6aHp3Z2lleGMwUTlhYTVFS2ZHSVhuM2Q5dHJsZ2tnYStz?=
 =?utf-8?B?RkJpUXg2WFR1cEFEQ3QvTFFUREVEd1FuYlFzd3Y5U0x6c1V2WkkxZzZ2WmlN?=
 =?utf-8?B?ODZ3d3lLUWttRnoxZkJpMkFaeFUwSTdrbVI2SkdUM2VOSEpWMlFRNEVuVjZx?=
 =?utf-8?B?MFdtVVpqbWlNVkZSOFNRRFFlakZrUHlGOWoyclBySEJXMFg0M040WktZcmN2?=
 =?utf-8?B?MHlEUG9LZFdqbjliY0NORXFjU05aellqTFd0NDB1dlVBTWllQVFVUFRlQ1BQ?=
 =?utf-8?B?eXFvRG5RUkIxc2pCTGVUOE5ITUdNaTlTWlU1TWdjUnhaOFhyYVBRQTR5VHF6?=
 =?utf-8?B?RlkwWUFPY3dJRTliZjZBQ0ZheTNPTW1ISEYxc1dZakppVVBDNGs4NnhmUTlr?=
 =?utf-8?B?TkxHaEpFRnJiQno0VElXckc4Mmh4d3VhSkpqUzJIeXZkM3VwdFV5dUdYN1VT?=
 =?utf-8?B?U2gyS1c0UWk2TVlqRG1sSHgvQXlUMGtydW5GVHJlOXkyS1VYTGExemFIQTJk?=
 =?utf-8?B?WE45b2xSTDQyT09xbC9IcEJQcjFhYnhtZzZZV0pKK3NsUnBsZitCcThFRG5D?=
 =?utf-8?B?cjZQc0tPVDRtdmc1aTR3THdPZUUzQjJtalErbnJBeFlFZG5LSUZOcTNpN2c4?=
 =?utf-8?B?bGxQU1lHQ1B6N1pmempZT2NtSG9TZVlFelJCRXNXb2FVNmlQb2hmZVkxNERq?=
 =?utf-8?B?bXo1UEFFYXBMcm9pcTcyOElMSW1sYWl5c0pyTDJ0c3hIeVRZOWNZU0g5SERU?=
 =?utf-8?B?d200NDhEQTRCeWQya3orbnJUZElOdUs4U2dvSlE2R1c1ZE5QV3FTeDFKcTNn?=
 =?utf-8?B?eHpXMk1ibXIwRVY0Qlc0TzZ3NitnY2J4Y1JyWnFlR1Vrd085UnJnSTdEcVhF?=
 =?utf-8?B?Qk52TkdjZ29HV0JJMU96bC9hY2hUaDFLdi9RR3ozYVlUZzF5aHQxQWZmVTlE?=
 =?utf-8?Q?WJd9/TYQzwYrtTVLmQS4IPxTp7qjBboZ4iH9OIo9jyVW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dded1e62-26d0-42d3-d4ae-08dd98edb7d6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 05:01:32.7331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hUYvIr8YXNdfRyOP5pRuq0cT0hLi09K13Qlc//WABpff3NRJIbRCu7YU/TUVtwAqXFmt46L3ycgkANeWYg2NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9513

On Wed May 14, 2025 at 3:52 AM JST, Daniel Almeida wrote:
> Hi Miguel,
>
>> On 27 Mar 2025, at 18:27, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>=
 wrote:
>>=20
>> Hi Daniel,
>>=20
>> My usual docs-only review... I hope that helps!
>>=20
>> On Wed, Mar 26, 2025 at 3:07=E2=80=AFPM Daniel Almeida
>> <daniel.almeida@collabora.com> wrote:
>>>=20
>>> +/// Equivalent to the kernel's `BIT` macro.
>>=20
>> "To the C `BIT` macro" or "The C side ..." or similar -- these one
>> would be also the kernel's :)
>>=20
>>> +/// Create a contiguous bitmask starting at bit position `l` and endin=
g at
>>> +/// position `h`, where `h >=3D l`.
>>=20
>> The first paragraph is a "short description" / title -- you may want
>> to leave the details to a second sentence, i.e. in a second paragraph.
>> Please check in any case how it looks in the rendered docs -- it may
>> be fine to have all in the title.
>>=20
>> In fact, given you `assert!`, we should probably mention that very
>> prominently e.g. in a `# Panics` section. Or, better, avoid the panics
>> to begin with if it makes sense.
>
> I have been staring at this for a little while.
>
> I wonder what is everyone's opinions on an extra set of:
>
> // e.g.: for u32
> const fn const_genmask_u32<const H: u32, const L: u32>() -> u32 {
>   crate::build_assert!(H >=3D L);
>   ...
> }
>
> ..on top of the current genmask functions we already have?

Do we need to make this generic? IIUC `build_assert` should enforce that
the condition can be guaranteed at build time, even without the const
generics (which a quick test seems to confirm).
