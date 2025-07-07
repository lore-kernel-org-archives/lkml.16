Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564FE271442;
	Mon,  7 Jul 2025 05:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751866775; cv=fail; b=t62ELF4dJwBVBEv6lNSSh2QWRquOvGqplQ5EBq2FBTVxV1k/bBlOg/YWfZdMnZ+/4f5dB0fSclut+RioY+pxPYEYgo5JNNVR7ZA/zZjo7tYuY0TWKl7UPjZARHbiY0RzpS4mR6xAfN6EPXvauWrVn5rwLnETa0j9VCYcgMpAb5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751866775; c=relaxed/simple;
	bh=cyh+82JwveVabwXQEUObrIWuYnYU4t1iBATpodufWLY=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=GLZmdcukLgh3F+7NLyrphI0GJ/ce6fFLRgm61W9g7XO/B8sqXdJT2Iul4Azd71hNSq6AimSoLvAJiHJlBvd35AClIQrBqdMRTTbUu53gl4ZRYBa0xPJj7iz89PM0p5pbkzLh59WF0chmljrnOouyQf1TY0tkuEyUdADIqfUocH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b2LdPfHJ; arc=fail smtp.client-ip=40.107.243.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b2LdPfHJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQ9IyNLu5oGIUV69mXnycBjiIpoDLssyNDPdmMTwle50AYRgoBUbX5wvlERzSsDcyHw6RHnU8p5/Lll2swsOup85Ei4xRhRpuVtRGZfLPsbVZkYpcwCkh8Lwh8FncBNY2B0bwubyeF26EpcOfgn4opM2LNoh/G5+/DUqQz5O1DeQxZiDd6lPn1ayTxljftJIYAY6cy6qtap6EaR0JTpihNBw1xz8sEHI6af4B3CZIBZbKZs2+2ECxCbAwp4x4+AP8n9mRsgHqsoHWGnSlOsXZ+aAI7q6RYblmBqdvYypcMFWSz7hNMIQgsoKrHQTpV6IT+xZXbTa5en7Wt4iz4+Mzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyh+82JwveVabwXQEUObrIWuYnYU4t1iBATpodufWLY=;
 b=uupSxmXtHxV7L7K252BLXjf2ORuGC5eX2rhw8vdt2lwA8C3aaCEFqFNV3v86GMkU8RVhdOTfGFIcDygR8OaMXTXvQpELQUhYNenNeChYreM4cpUjxQfCNBnc/m1DjVHgCXSsIGjZF/m7JpnuB0lerNkG2P1h57B/I1XDIJTaE3OnkjV7qUEWUXnBBBth5mZu83oHCY4FrfDI91HfL+8FLvHmbZKPOycyKA18MiSzrtRRo91vNGPlIj/VdQxz7+qorJuGHv7t2IwIRJrsLKUbsqBbMUhm0h9U5XxRcgj1GddDFNhsuvvLytK2501T8mn/wcUdctLzb2/1ccJVDHfPxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyh+82JwveVabwXQEUObrIWuYnYU4t1iBATpodufWLY=;
 b=b2LdPfHJUzbGwkBDb5g8kenwFJ8+kvEtFJg/oSHixkiAvvPdEYJCVEB0h+cihLP7F4rt5MC/jLQ7xV3RluZhoabct4iOadC78I41BJ9VLfqgivXEeQJERQ1ylDVCoSRA3cVr8kWDEoxb+flzamn8fJnNnz59SFLA4gwl6utNodHR2uTdBY75ZIVmQ3AXEqH0uRTerhVocutx1HK1ReUtl2jEPU1dTJHajuM8Qt+wifD1YvrklZovtvpDRC048VFumWPNApCHhlZhWntuT/BMeLk4GuQxQCoOYdp3rfkrZ9le1xg7TBxMfpNVAQWfrMbbM2V87NC4Qo1Tq4d66sYM9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA5PPFE91247D15.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 7 Jul
 2025 05:39:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 05:39:31 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 14:39:28 +0900
Message-Id: <DB5KXV0JKGD5.3STRMQ458D0Q3@nvidia.com>
Subject: Re: [PATCH v7 2/2] MAINAINTERS: add regulator.rs to the regulator
 API entry
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Boris Brezillon" <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Benno Lossin" <lossin@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250704-topics-tyr-regulator-v7-0-77bfca2e22dc@collabora.com>
 <20250704-topics-tyr-regulator-v7-2-77bfca2e22dc@collabora.com>
In-Reply-To: <20250704-topics-tyr-regulator-v7-2-77bfca2e22dc@collabora.com>
X-ClientProxiedBy: TYCP286CA0229.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA5PPFE91247D15:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f4dcfe-477b-48b3-a33b-08ddbd18a589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1RndXpmcGN0ZU52amxkbUtjV095OFFicGpYV0RXNjdBWFQvMTFxak5MeDFH?=
 =?utf-8?B?RGpPbFBwUEdwWGZlK0pQQzI4Y2pGUklqL2ZOUHo4UVhIMHRSc1M3VXNLbmVI?=
 =?utf-8?B?V2ZjWU9KUDd4eHE3c2t5WHVBUFdKRXNydTYrcVNMakIzRUZBVGd5YXZsRXlp?=
 =?utf-8?B?NFdUUG9IVTVaUGlUa2ovYVFzMmxlUHFoZG84QzZoZm83bzlwTEhRdUpLTUUz?=
 =?utf-8?B?aVZQTHRTY1Q4UUVtWldTRU9Vc0RFcHdwZDVNTFloTmdwNENiNWFXQ3Q5a3ZV?=
 =?utf-8?B?MVZvbFBFdVZjOW1lQkdudnkvRU45Q21oTFRIZ1FDbnkrM28zUDQrNk9Id09I?=
 =?utf-8?B?RXRUSys4RmNudmswWGNnN2RmanJralN0QlNveitndUx5QXJvcjRyeFE1bFNh?=
 =?utf-8?B?d216aXo1N3FxZUtFQmVTNVRiV2pJNnorTTYxcis2Z0hqTE04SmFsa1pYU3ky?=
 =?utf-8?B?aDdGOTJBU0RnanprSXQ3aWZ6elJIaTkyKzI3amhSM0xQR0ROS3FxdFAzYmdN?=
 =?utf-8?B?RjlOQURabzNvR0xjSEhJcFE3TFBlTkZzQ1AzclA2WkpadEpxM1RIMkpYQ1Na?=
 =?utf-8?B?V3pTRHFZcWttRUV1WjlHeklSNm9HTG0vMDdCL3RmSXlvaExyVUFuSjh0R1Ri?=
 =?utf-8?B?TU5EaGlveWJ5VVJ1bG91Z0pzRU14a3RFV2JlTkZVOWlZYXM5NkJ5M1BQOXdI?=
 =?utf-8?B?MG4vL2Ztb1F1Y2lBNkpWZnlsK0xaTGY0MmlLTkRZZFVQQXVDb1VjNkVsbjhT?=
 =?utf-8?B?SGY4dS9xd1o4clVpVkZySUhYTVNHV1lVazhCeXUrczZPK1Z3Y1V2eW8yZk9M?=
 =?utf-8?B?aFJwZGdwZ2NUMlBydTdRTDNYVlE5TmlHbGlvN2lMck14MWRVNXJMak9ybHZU?=
 =?utf-8?B?TENLOHJLc0ovd20rNHZ1YzBwR0NYWTB1WHdWMHgxUGtFd2EyaVB3UFJyVFVz?=
 =?utf-8?B?VlBWd3pxZHlZdlNJakNKNVNrU0N2T3B1bzdOei9oZFY0c1o3MVZPOFdOdVZC?=
 =?utf-8?B?NkpVTkxnYW5YVWczZWF4SWpVOTlURlNnT1dkSk1qR3NOMGFmTkNwUXkyOTd2?=
 =?utf-8?B?d0xnWGVyUG5aYlh5dE54OHNIQnFTSUtRTXlHN29IUGxVWXZWbDdGdTVZRVg1?=
 =?utf-8?B?ZzdkMS9xdWErZzgvUXFJSmE3Zjd1N0g4K0RIWVpuM2JFVFRMdDdIRWdwNVQz?=
 =?utf-8?B?THYxWm1iVGtid1pSSEdrMExSdDYvUFJJVWV0MUxHYmUyYkFRbkhOZHNnclFs?=
 =?utf-8?B?SDVZNjBKY3RiWXlkR0xCZ0VCWmI4NlR4eGpqeEgyT0I3VXNOMC9lWEppalJs?=
 =?utf-8?B?MW40NnJpeEhrQWVldENiVWhVcDY2eVpDZXZEcm5DSUlKbE1BVW9JTWM3dVJC?=
 =?utf-8?B?NjM0aU5rTk5vRWJMRnVRQm9BWFkvK3FjREhYWnBkUnMwYXB5aWZPSk93WkRX?=
 =?utf-8?B?b3VmRWRIN282K1VUdUY2Rk5zcWIvK2JOQkc1eTh6WmxoWmtKclRUTWFLcDhW?=
 =?utf-8?B?enNpaDIzTlFrWlhCcnMzVnNEOVc4ZUMrSldud2tpNlFUc3hUS2NkaW9XL2lx?=
 =?utf-8?B?YlRyWFNPcDdlK0NlaWlmZjhKRHdLY1U1MkVlR0Y4R1lQT3lmL3VzSVpjZUFX?=
 =?utf-8?B?VSs5WlNBWTBEM3g0cno4NFdRay9iQzlSbldFaEJWNEhFd0lWZlczamdLaHFF?=
 =?utf-8?B?TnRrWnJBM1YxVWlzZ0xrTndQNC82VE9Yd3NwWXA0aW91SWJyUnZaVXR3Mzg4?=
 =?utf-8?B?WEZwZ3h6M0UrMTBXNzNsSG5JYjU5cytTcE5JSXpqQmoyZlo0TDBhdDJPUnA2?=
 =?utf-8?B?bXpUbGxXeThMcmVkTlJDVEEzOW9YWDgzRVN4MWdSdi9Wb2RMejRFQTczOURl?=
 =?utf-8?B?SjhoVHBndnQrcVpxN2h3RmEycXZlUTUzdHZsT0dlK0JrYkZ4WVFqUTZrbkRY?=
 =?utf-8?B?TklCT3F0N3A1U2wxQk1ZRHVKVTEzdk16MmVZcHJ1b2s2UUhhYmFIMHBCOVFQ?=
 =?utf-8?B?dTlyMFUvdHdRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU1zWW8vUDVEQk1XL0dPYW1DbUJoOXduOTFkWllNaFRVWUZsSXRyMDVPZDgz?=
 =?utf-8?B?TzdaT2JWejRjeHM0aWp5b1J1K1lOL1pQSk53dEV0ZlRqUFFuYUQreUJSSTJE?=
 =?utf-8?B?a0VlK1k5NzRMVmx1Ulo0U3JaUVczaGxwZ2ZXOTkvQWk4MmozRXc0d0taVk1w?=
 =?utf-8?B?WEkrVHZpUHkrZlVWYzlwY1c2dm9pQkRteUt1aDRpK2hUdGZzVDloUUFRRFFH?=
 =?utf-8?B?WDFmWSswNjNJUGs0a1hLOUxRYmlXUHlQekFQN0ZnSFhYUVVQdGp0QllxcEdw?=
 =?utf-8?B?d0xMWkRhV09uR3YzV1d2RzRkQ3l2czN5bkFPVitYRXYrbk1LUmdpNjhMU28z?=
 =?utf-8?B?NmlTSlZJelF5WjdVcVdOamFIQmQxaUFEM3Z3cTdRUllxUTB6VkZsSHIyMXBT?=
 =?utf-8?B?cjFpMDVWR2I3NnJoSlpyajhvMC80ZENMZTRvUlUyUmFLemNjSHF5SVlSaWtJ?=
 =?utf-8?B?YTg1NjAxa0JjOFBIdGVQZE1aS3FaRlVDTEFKdU4wMk5sYW0zbXdVc1hLdVNX?=
 =?utf-8?B?QjNtbzFSS3BNQjhCYldqV0w0VmxYeEhpUGxYT0JNa1U3S1pGNUp5N2hqM1Y1?=
 =?utf-8?B?dVdhTE5UNDhiUHNkS0FlWEF5Mjk4Uno5NmNBNFVtNENWWUQyck5Tc2xyQjJC?=
 =?utf-8?B?c1pQai9OZmVidVB5MVF2UGJTMTg5RkZRRVcwSUk2T1cxREJFSGdUTndsQk5P?=
 =?utf-8?B?NFhIS0xobytsRFdHcjVINjdBWEIyckVWY0FYTk5CVGtuYTJZdmI3TTJQOVc3?=
 =?utf-8?B?S2pVMEQzV0FoLzA0NEtSaC9HdE85Q2gxMUZjeWFmSW84TmlrSGNJUExJWUpN?=
 =?utf-8?B?SUcvVm1XUTZLVTg5aVRBMXluTHRTZzNFdUY4dG1qMXQ3cmduTzVKWm43L0NX?=
 =?utf-8?B?RFJLK3BPRFpPVHVTWU1ONUJKR2lBK2s4T3RpYzJJd09qaUphd3RLcFZYbktH?=
 =?utf-8?B?ei9ETG5iS2IrKzNsdlUwbzg3dTdZS1AxeWdiM0I3KytHL2FNM2tQQXBuNFpl?=
 =?utf-8?B?VXo2VWpqdGp5TjVuV3pRcHU0djU4eWZVekZxczYxWDl1SklzQmZjeThGUENh?=
 =?utf-8?B?ZkxMSkgxNlR4VXVqV1BEK3RZOVJHUnIvbW9UNE5sL2U2aEFNMktNSWdOK1Iv?=
 =?utf-8?B?RGxEd2FGQndWLzBRcHcrdUV0UTdBZFdrSXdlbXRweVJZRmdCMU5BcWJveEdS?=
 =?utf-8?B?ck95bDlxQWNYOGNKTGFqTVZlTVNxb08yYWhlSFd0UGdpTXFoSkl2VGMzcTFm?=
 =?utf-8?B?RzF1UnlnaERFTmIveWtKeHJEeTcrQ00rL0dWWmJKdi9PQ1gvVUMxSko4SlhB?=
 =?utf-8?B?ZkNzY3FTMzV2VEpqMVM1cFVjbVdZeEl5Nk5IWTRHUnFHNnppZ0lZakhGS29P?=
 =?utf-8?B?U1orTE0vbUVaYXh5dGxiN0JaYnV0ZWI1QmRYRVd1c2ZYODQ2VGYwMWlBV0RM?=
 =?utf-8?B?ekN5SHRycFB5L2t3RWxrOUg5M0luT1Z3SmRJWTNzVEwwM1lGeGtqa0ZNMHF5?=
 =?utf-8?B?bk9tMlRlSVE3QVd1REdLdHF0dUxySE5GUURnRnNqUGtVeWRJaERuYkQ4UVh4?=
 =?utf-8?B?UFJGMU9UZEI5alRJbjNLRDZRS3psQUY5enFOZVRTVmFhVlcyNzdYN1VxZUdI?=
 =?utf-8?B?MG5HQTlxL3JPUHJDNjNvaGJ0V3habXdLNWZRN0tqVWc4c0FXYllLS1NTZGN4?=
 =?utf-8?B?RThBaHNGZlY4TWdUaWExZS9JdTJPQ2FUMzg2SkxhZXI5ZXE2d2pjK0ZvRFBy?=
 =?utf-8?B?ckNYR2Y2Zi9kUFlCcStkZ05rcmttVmdKOXNPRTlTM0xPL3dPU1gwdHUxSThO?=
 =?utf-8?B?K3VQb0tvVHpHa0h3dncyaWljRFFqNmU0czY3ckhWVHVKQ29EZVJtcXpIeGhG?=
 =?utf-8?B?WktYVDQxYXFiaENUdjc1N0wxRG55OEM0VEc2SkxJa1B1Y24wNkZBT2lKV2FS?=
 =?utf-8?B?NUwyR3lWVUF4dDFzWkZKQ3BsSEJKR1QxUUlET3hLUDkvZU83ZHBHUitPTmRp?=
 =?utf-8?B?WmNTMzZ6OUpuZkcrRTVROE1SQkRwYVFOYkF2VFZUVStNRVpJYS8xL3JEMUgv?=
 =?utf-8?B?MDg1ZnJnS1BDK0tuOWRuZTF5dkMrRlM3WG14ZU1uVnVQT1V0alhOd0JXU3dY?=
 =?utf-8?B?YnE4WmhmdnBMTlpHdENHeEVuY0dyWmdqT3dBSDlVNEpXNVJHWUk1d01YdURr?=
 =?utf-8?Q?a3thq6dPWYhV6itPaBBZHZ846INutP6kvNes89D82Rf3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f4dcfe-477b-48b3-a33b-08ddbd18a589
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 05:39:31.1927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kjYmfp0ijPByJaCwGzuFbZAiZ5aUpnfYfAL1RRYQSw6t3j3V1kjV1LfuZqoG8Hh9CZ36LyL1PzM4uVSU78tGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE91247D15

On Sat Jul 5, 2025 at 3:43 AM JST, Daniel Almeida wrote:
> Add this file to the regulator API entry as requested by Mark Brown.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Just to point out that "MAINTAINERS" is misspelled in the subject. :)
