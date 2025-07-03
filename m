Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3371D2DCF54
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585762; cv=fail; b=Mo6kT3N2kXuECri3viaT7TYgopR4DddJ0qVW6IoiKH/QmT057WvYSwmBpsmeBQGaf5c6WIHOyNfqDPwzlqwmKqyHPTlW8pg4Q0GtfB1Q1Nj2wNWtZFlrRBjva+vHasD4a7ETAiR98fvDMu/Vf6OoNYCILUG8nCdvDQTuW6wWri4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585762; c=relaxed/simple;
	bh=2LmgwGZy7VO34L1MB1qzZLcTU0a+xzR6KF1SHqrEeS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OGMX/jg2nFWojSj9SV6StiB3WKi3dUvCg6yX3KSl3j4k7Tseg0R81dsYdtGjqHzuecpirJQM61mPWMJkSPiYG35fYxxaZShvAFPqUXeJyIOhyBi/EI7Ry0T9dKjUGB7R/jS6Izjc+H7YKyNVat2tLCKqP0wZUjjkgEGyu0ep6lU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hp2Lt6g7; arc=fail smtp.client-ip=40.107.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hp2Lt6g7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgQB3gzAlo4g4l0Mv8B0DJWG9FZKqrQaStvqJ+hvNyJapEPi1pFzIathV9JaUvbgCwO2I77+dSqapuMiDEtQRGto01+L+4qv3/VGfYTcomUxK7oLMtmj2/9qO2lEPZ+O7UwtCq9azg7mMlZFwyOK6kzkZwL0+eJ0SNwB3VLC8cfj4UGN4t8LlCJeXbhslTmCisPYPgUYlBRfA3oZzEABLYi1v5q7i2JLJFFp5mg/QsjkENYWXF5Qug5FviJ9tnWtQRNeriY/+RXTEFNZr3qKo2mWMHU1RmeOYB+rHpscs4E+TAOwQkTZiFM/oiMb04mvmAMh+i+uC0tJ7GDcFl1N+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pACjmb3yL0V064PPrmM8ulcJFpXTULEtourvoLdDMmE=;
 b=BA8R6aLN2Z1fSNiyXuIILDp0sjYV8oFYEV/+R034xn3TXgVWKtNgkieo8IbbuhwnJZvWHgM/6Kk6na85M/HTFugT3VN18whQDd9DKIeSUhzRuyWDMwBXit09+sVlnKotkJ/B+LXJGzwWTZgnaQIxkSQ4M7bxmkS0JrsbwU0OE0DOz0cIEDstE7z1cKe8JhGyNsHhC+aqlb0tqpAEt+oDQmO5Pzg1RWwLtkWOR5u/QgBsYTnrXHNurepY0PvdQNxOZxMokFPESGS+mLX2Ss9E10jdjzMyoYuqPsCTtagNsxyZpTf0g6syyFNRciNN0+TD0kb89iFaI5KZGqH7qQ49AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pACjmb3yL0V064PPrmM8ulcJFpXTULEtourvoLdDMmE=;
 b=hp2Lt6g7piKUPDimze11+9sjvNsWamZHQUsi4cYd5fOR8YDIHZYvtk96AS2si2LBOLSoLAbwcT/hMapZfwfwhlQ1phjnzjchkMp8h/5I7VKNHYE7rmeFcxxnkLHdwBReTvVZniF8N91k6ZPnXupmnCdkw7T9d0AJ/GYa53advITUHkwGvoX0VV8yw2ESYFBaIGZMkpVTQLf6FVJ30TKtcl7TSya6f+w5FMjLymjISZqeXGNfhnGsk8gKG8AHX00yJEKPU4ja7UZqSRpz/vbVoirPmvOL5xs6ANE5c0gMIY/Ikion4e5oZq0eDr4raSMnSwAo3OVjDbTQih5HxzJRlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB7459.namprd12.prod.outlook.com (2603:10b6:a03:48d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 23:35:55 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 23:35:55 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Xu <peterx@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Jane Chu <jane.chu@oracle.com>,
	Alistair Popple <apopple@nvidia.com>,
	Donet Tom <donettom@linux.ibm.com>
Subject: [v1 resend 03/12] mm/thp: zone_device awareness in THP handling code
Date: Fri,  4 Jul 2025 09:35:02 +1000
Message-ID: <20250703233511.2028395-4-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703233511.2028395-1-balbirs@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::17) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: f935460e-bef8-4a73-b0bb-08ddba8a5b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWR0Sm1kWmgvdWUzQ2c4ZmwrNjJVMElsQU9jL0RYbk0yY3UzNkE3MCtVNFdL?=
 =?utf-8?B?dzZVUVJhSDAxdWJubElTRGFOcmZBVHlxMys0UlpMeDRoSVpmNndPTEtUNUhn?=
 =?utf-8?B?MDNPYlhaaDU5eFBqOHBIL21GRXZTandnNGQ4Qk1PMkJscEdHSHlKa0pUQ090?=
 =?utf-8?B?Y0R4bTZCREpSZWJITFVJaGsyNU1PWVhmY3o4SE5QcUw0bGoySmtwSlFtSEpG?=
 =?utf-8?B?NTRNMHo2UHk5V3RZM2xyL2VkRmZIMnJqUHVqMkVOdXBNYVRjOVJkQTZBNHpo?=
 =?utf-8?B?L0U2UXVTOUg2OWEydkVsUy9CcytkRDhqeHo3R1MxNmM4d21BUnVNSDNEalRT?=
 =?utf-8?B?bDJ5WklJbm1zNWVTVTVCZjVLcHhQZ1k2VlBiTlNDSFl3NG0zaWRlU2h3SVQ3?=
 =?utf-8?B?cEFsVStWUG9NYTBrOWxSdzl6ek41eExwRlhBL3htTk8yTDIzelI3WTZWYS93?=
 =?utf-8?B?cWlVQUd0TTVuU0FxNTRabktCei9id3dvcEtQZ0RyYmJ2eEtoaTAyMWhGL1hG?=
 =?utf-8?B?TXVTNFJwSUVNNXRnRFBidU41OFBmZUEzYldnN1VySG9IZ2xXeU84UHBMZllU?=
 =?utf-8?B?VEFaa3d5a045R0F6SmhkK0VadGtpQU9wQjI2Yi9QbW11UklUcjNpa1Njb0xk?=
 =?utf-8?B?WHFRYk5oY1N1cG9GRm9Oc1ExVEVXTHd1ajM2SDVTNyt2MGFEUlNtTzhUcjds?=
 =?utf-8?B?Q2w2WFlEZk1peVU0UXk5RFljMFl2czloaFgyb2pJOEsrNktSdlB6bndWUVB2?=
 =?utf-8?B?RE1nZ2N3NnJ6T3pZMEpXckd0bFU1eENySktHbHU0ZDZ0SHh1QUtvNzBWamJ1?=
 =?utf-8?B?eTVTRVBHRVRJSkMrQVVQN3pIakNUSHNtQXBXVUlSVnlULzNGMjQzZngxYmpK?=
 =?utf-8?B?LzV2Z1RlVG14UVMzYXhpK1Fhb1ZJYk9jZktzSFNmUUJUMzRLWEJLL0dMY1Uv?=
 =?utf-8?B?dWhKWDRCMk5oQ0RtSnptNmhzSFN4TG1pY1ExUzRVZnBJLy9OYWFVNHRKMVM0?=
 =?utf-8?B?QUxndnl6VjFTNXVzd0ZxU29GMTRFeTJXUU45UWhlNnV2bUhGaTRaOWszKzk1?=
 =?utf-8?B?Q2poblg3a2tCa2NpYnJSbDg4aTZmTklVMEtnM08zb2ZMWGM0VGozMVlydFFX?=
 =?utf-8?B?Y0lKRHFQV01YeTlrMjZNdlp5T08zYVgyTmdJRVhWNFZ6elNMMlU1L2N4bnZy?=
 =?utf-8?B?bW9SZ2dWWWVFeTdLSWFBYWFBU090eit1d1VZcjhucW9neFhHSHl6c3MvdVAy?=
 =?utf-8?B?Y213UUQ4ZStUSkpsV1pCM0dQakgzbkNvazR5MERMK0ZuQW01andDMG9ZRjZG?=
 =?utf-8?B?TEI2ZjVKMTlrc2tETTFlMnRrL3FTLzBWKzYvMlBHTnJ3VVhUaUwwL09pWXp4?=
 =?utf-8?B?cUU5clJvQUdBSWFVQWhzZ1ZQYndPVFhzdEFTcGkwM2JMT2p6ZEp6TmR6cWJ3?=
 =?utf-8?B?cmpXQkZVaDZEb0lTcWVETExnd3VKMUx5YVBITUlZdGxGZVhwMi9mU3pKMzRD?=
 =?utf-8?B?VWlnaU5NZ2ZEbk55ODJxMVNIcmhzY3pQMEUxeklrYkxpSFBxTVFnRHBwK2Va?=
 =?utf-8?B?QXE2bzJleUlObko4M2pyM3NFcWNGcCtkczFxSDl4SGlEbnFTcVQ5dUg2eWh4?=
 =?utf-8?B?YmcwV0dMQ0JjTEdwd0VZWDNwaEtOeEdvQUtadGp1YU5lT1N4bXBiWk10cEFt?=
 =?utf-8?B?MUY0d2oxUWtBQ09mYlkrekw0WGlRWG1IZGlaWDg0TDF6YzFRY3UxaFhKL2tj?=
 =?utf-8?B?ZHFpTG5DdGRxcWpvNFloTnhydkRQRzdkNm5rU1BieXlKSXFFRmVsV3Q1Nlpv?=
 =?utf-8?B?NW1tVm9jM0JDdjlpSE9Na0RwdjJkL0hlbGM2N1ZJWVVLbFJoNml5c2VhRFpl?=
 =?utf-8?B?Z21uWjROVC9zanBnZW9HTHpDWGljL1l1SDQ5R1pTWkQ4R3M1bnVPM05WMWxK?=
 =?utf-8?Q?Mx7y7/VuMfw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWxXT1JlbjJoOVlzTVNqSitrUm80TE8zMlFacEQwOUFmM3dlYTRZNHFXUCsv?=
 =?utf-8?B?RkRnQkJKdlEzYkhYVzRMS2ZnU0dxWTRJd2ZPTGUzeFBzVVBGMDlFSGQ1ZTNH?=
 =?utf-8?B?QXZTZU0vSktlZ21CUW9FWjFJMllaajZlMlhvc294ck93OHREWUlycWJkeHZx?=
 =?utf-8?B?ei9yY0R5VUZuLzdVeXYrNGNWa1gxOFZDbTV4OHlPVnkrWFNaWkxQR1RWWEJC?=
 =?utf-8?B?OWhOZ2c5T0VMcGFoM2Z4emo5M1VkeFVPWk5CSXl1YUQ0alY2bTMrc3h6TnVS?=
 =?utf-8?B?d0lKWHg5N0xYN2poLzNaSGFvTVJLMXJlcm8yVVZOczF3aDQ0cmxBZ1BqWktz?=
 =?utf-8?B?ZWNOQ3VZbFBaRGFrOFJJVzkzbjFZRDZDc1VnTGYxK281N000bGw5QzhHSEQw?=
 =?utf-8?B?ZDhUQ1VKSHVwaGY5U29NbzdSUnRGekV3eklQdWs1VE9OZkY0bmxmZklFVTh5?=
 =?utf-8?B?dkN1RkFKNGpLT1UvY2xEMmZrQTBSVWFLZXNNLytPVW1SdDAzSHFlaXNUbjZ4?=
 =?utf-8?B?cDArVDZkY0VFeC9nVUkzcUZTNkJFdStEQTg4K0RsQ25ic3BBOUIrNzdweVhv?=
 =?utf-8?B?bVhFc2JCU2FWaURXaXZHWEhnc2xzWnJCWmgxUzRSODUvVWpaMURNcHp4SThj?=
 =?utf-8?B?TzNjQzcxdDR1RStsSlEvbXIrb2F6SW9rRkJDMlE0V3ZZbEZYR293eWJTbHJs?=
 =?utf-8?B?b2RiaDFkSHJMNHRCQ2ZlbkFXZXZPUHlFVDh1aGgzdXJCZ3ZyV05sbXJkeTF6?=
 =?utf-8?B?SEdtdXNwN2JKeDQxczNUeld4ekw3TDBEalNXUzRlMDlCZnNUUU5lRTU5ZCts?=
 =?utf-8?B?b3hGY2M3TUlqSWRCNndCNlVoRE4yaUsyTHVoL0xNeWdqRnBweDRXZjJjdld2?=
 =?utf-8?B?RGlwNzV4SEd3ZHdkejZjY2paZVpmVnVnVnEvU0VlVWgxbFEwVWY4ZDdId0xr?=
 =?utf-8?B?ckZ2OVRFNEVtU1pRV1c2YVNlTnJXakNyT0dEVFFYTUg2aHh5ZTBhd0MzMW9W?=
 =?utf-8?B?czZoVlNYU2lUbGt4UDZ6TmtTNFp0WWJ6SWluQms3OGhlWi96MElxN200UlQx?=
 =?utf-8?B?clVDRWhXMVhJNTlXOFZEd1B1dnNvQy94SHFQVGQ5eUxvMDRMVmdQYzhBRlB0?=
 =?utf-8?B?cTRZNWxmMXAybUJiaHc1aC8yMEVpTUwwOERMMWp5bGtiS2RtSDFLbTAzUmRx?=
 =?utf-8?B?Zm1wSEllUDg5eU5NZ0NYeXhSUFBwU0pSWnRKblJ6UUZXNGhyZXIzMWY2Mm5B?=
 =?utf-8?B?aVArMjg4Q1VueFIybk1NWHpJeGZiWVdXeEIrT0FSU3BPWUZlVGpVbFZNR1I2?=
 =?utf-8?B?SmZNcXBGYlU4RjYzelJXbWtkblB4eUd5d2N3Mk9WOFRBT0lGY2lmamtidHpt?=
 =?utf-8?B?eFlFV0x1WmdETjFhcmE2LzVzZXJMSnMzcUFRVlFLb24vb2RYcGhyZlVhbEIw?=
 =?utf-8?B?QkRaa1VzOWVpVkIzWkhJYkVuZlMxNzQxd0FIK2VkUEYvV2tVRm4yNzYvcEFa?=
 =?utf-8?B?OHQvbkxiTjNuWVlZYU1RVnhxOXNMbkhqTE1wbFMxZHJCSWJad2hmUjl6S01V?=
 =?utf-8?B?YnJUK3lqUWNIczlsUktYQU40WUcxOG5DODZPVmRSYVNFUzY5WTQrRW44Szdk?=
 =?utf-8?B?MC8wWUdkb3dxeGIxQVQ2NksyRnlWaEd2OWtYeEI4RmhTaElnbjhXalpOTzE3?=
 =?utf-8?B?eHZLcE9EVENzdVN1Tm5XS0ZtOTNiYmlxMGR3ZUJQajBVRjgvNEhBNGtEbEFO?=
 =?utf-8?B?QVFLQnpPRU5BaVQ3VDNDTzhaZ1F1Sk1VS1cxaUFjc3ljTEx4SmtMbktHMUxq?=
 =?utf-8?B?R0FyeldPLzJYNU51ZndwMUcvL0oxZ1BhUlJ1NkxJMk9KbVVnTjNNYjgwSXZN?=
 =?utf-8?B?cTVFaUJ2bThGZE5FSmJDSW1EdlZ1VnNwZ3NpSmxPa0o1NXVnNm1ES3dsdlV2?=
 =?utf-8?B?Y0tNUkszNTAvK201UEtxUy9hejNZMGJYMVFRdHFHSlZ3R3dTQ1NaN3VvUU9s?=
 =?utf-8?B?NmFLb29oRW5reDNHVmhzbFNtTnlCT2l2KzNJZmxwT3J1Q0l4SHJEQmJDN2Fp?=
 =?utf-8?B?WEFZMFFtWTZHRitub0NyOGVLZnJSUXlzU0srai9jU1h1VE1oWjIrbmx1UFdk?=
 =?utf-8?Q?NMQKpnZj3kXQgxaAJNPwHlhUu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f935460e-bef8-4a73-b0bb-08ddba8a5b37
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:35:55.6973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnzpIuPubAm/LArasXv4ef7UEc/xNaXwXS0dVqzFB5abIQ+Pt2dvIROt6imPdNPW4NQuPCQ5rQCg+Ee0d9dmRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7459

Make THP handling code in the mm subsystem for THP pages
aware of zone device pages. Although the code is
designed to be generic when it comes to handling splitting
of pages, the code is designed to work for THP page sizes
corresponding to HPAGE_PMD_NR.

Modify page_vma_mapped_walk() to return true when a zone
device huge entry is present, enabling try_to_migrate()
and other code migration paths to appropriately process the
entry

pmd_pfn() does not work well with zone device entries, use
pfn_pmd_entry_to_swap() for checking and comparison as for
zone device entries.

try_to_map_to_unused_zeropage() does not apply to zone device
entries, zone device entries are ignored in the call.

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Jane Chu <jane.chu@oracle.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Donet Tom <donettom@linux.ibm.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 mm/huge_memory.c     | 153 +++++++++++++++++++++++++++++++------------
 mm/migrate.c         |   2 +
 mm/page_vma_mapped.c |  10 +++
 mm/pgtable-generic.c |   6 ++
 mm/rmap.c            |  19 +++++-
 5 files changed, 146 insertions(+), 44 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ce130225a8e5..e6e390d0308f 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1711,7 +1711,8 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	if (unlikely(is_swap_pmd(pmd))) {
 		swp_entry_t entry = pmd_to_swp_entry(pmd);
 
-		VM_BUG_ON(!is_pmd_migration_entry(pmd));
+		VM_BUG_ON(!is_pmd_migration_entry(pmd) &&
+				!is_device_private_entry(entry));
 		if (!is_readable_migration_entry(entry)) {
 			entry = make_readable_migration_entry(
 							swp_offset(entry));
@@ -2222,10 +2223,17 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		} else if (thp_migration_supported()) {
 			swp_entry_t entry;
 
-			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
 			entry = pmd_to_swp_entry(orig_pmd);
 			folio = pfn_swap_entry_folio(entry);
 			flush_needed = 0;
+
+			VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
+					!folio_is_device_private(folio));
+
+			if (folio_is_device_private(folio)) {
+				folio_remove_rmap_pmd(folio, folio_page(folio, 0), vma);
+				WARN_ON_ONCE(folio_mapcount(folio) < 0);
+			}
 		} else
 			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
 
@@ -2247,6 +2255,15 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 				folio_mark_accessed(folio);
 		}
 
+		/*
+		 * Do a folio put on zone device private pages after
+		 * changes to mm_counter, because the folio_put() will
+		 * clean folio->mapping and the folio_test_anon() check
+		 * will not be usable.
+		 */
+		if (folio_is_device_private(folio))
+			folio_put(folio);
+
 		spin_unlock(ptl);
 		if (flush_needed)
 			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
@@ -2375,7 +2392,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		struct folio *folio = pfn_swap_entry_folio(entry);
 		pmd_t newpmd;
 
-		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
+		VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
+			  !folio_is_device_private(folio));
 		if (is_writable_migration_entry(entry)) {
 			/*
 			 * A protection check is difficult so
@@ -2388,9 +2406,11 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			newpmd = swp_entry_to_pmd(entry);
 			if (pmd_swp_soft_dirty(*pmd))
 				newpmd = pmd_swp_mksoft_dirty(newpmd);
-		} else {
+		} else if (is_writable_device_private_entry(entry)) {
+			newpmd = swp_entry_to_pmd(entry);
+			entry = make_device_exclusive_entry(swp_offset(entry));
+		} else
 			newpmd = *pmd;
-		}
 
 		if (uffd_wp)
 			newpmd = pmd_swp_mkuffd_wp(newpmd);
@@ -2842,16 +2862,20 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	struct page *page;
 	pgtable_t pgtable;
 	pmd_t old_pmd, _pmd;
-	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
-	bool anon_exclusive = false, dirty = false;
+	bool young, write, soft_dirty, uffd_wp = false;
+	bool anon_exclusive = false, dirty = false, present = false;
 	unsigned long addr;
 	pte_t *pte;
 	int i;
+	swp_entry_t swp_entry;
 
 	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
 	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
 	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
-	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
+
+	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd)
+			&& !(is_swap_pmd(*pmd) &&
+			is_device_private_entry(pmd_to_swp_entry(*pmd))));
 
 	count_vm_event(THP_SPLIT_PMD);
 
@@ -2899,20 +2923,25 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return __split_huge_zero_page_pmd(vma, haddr, pmd);
 	}
 
-	pmd_migration = is_pmd_migration_entry(*pmd);
-	if (unlikely(pmd_migration)) {
-		swp_entry_t entry;
 
+	present = pmd_present(*pmd);
+	if (unlikely(!present)) {
+		swp_entry = pmd_to_swp_entry(*pmd);
 		old_pmd = *pmd;
-		entry = pmd_to_swp_entry(old_pmd);
-		page = pfn_swap_entry_to_page(entry);
-		write = is_writable_migration_entry(entry);
+
+		folio = pfn_swap_entry_folio(swp_entry);
+		VM_BUG_ON(!is_migration_entry(swp_entry) &&
+				!is_device_private_entry(swp_entry));
+		page = pfn_swap_entry_to_page(swp_entry);
+		write = is_writable_migration_entry(swp_entry);
+
 		if (PageAnon(page))
-			anon_exclusive = is_readable_exclusive_migration_entry(entry);
-		young = is_migration_entry_young(entry);
-		dirty = is_migration_entry_dirty(entry);
+			anon_exclusive =
+				is_readable_exclusive_migration_entry(swp_entry);
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
 		uffd_wp = pmd_swp_uffd_wp(old_pmd);
+		young = is_migration_entry_young(swp_entry);
+		dirty = is_migration_entry_dirty(swp_entry);
 	} else {
 		/*
 		 * Up to this point the pmd is present and huge and userland has
@@ -2996,30 +3025,45 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	 * Note that NUMA hinting access restrictions are not transferred to
 	 * avoid any possibility of altering permissions across VMAs.
 	 */
-	if (freeze || pmd_migration) {
+	if (freeze || !present) {
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			pte_t entry;
-			swp_entry_t swp_entry;
-
-			if (write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
-			else if (anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
-			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
-			if (young)
-				swp_entry = make_migration_entry_young(swp_entry);
-			if (dirty)
-				swp_entry = make_migration_entry_dirty(swp_entry);
-			entry = swp_entry_to_pte(swp_entry);
-			if (soft_dirty)
-				entry = pte_swp_mksoft_dirty(entry);
-			if (uffd_wp)
-				entry = pte_swp_mkuffd_wp(entry);
-
+			if (freeze || is_migration_entry(swp_entry)) {
+				if (write)
+					swp_entry = make_writable_migration_entry(
+								page_to_pfn(page + i));
+				else if (anon_exclusive)
+					swp_entry = make_readable_exclusive_migration_entry(
+								page_to_pfn(page + i));
+				else
+					swp_entry = make_readable_migration_entry(
+								page_to_pfn(page + i));
+				if (young)
+					swp_entry = make_migration_entry_young(swp_entry);
+				if (dirty)
+					swp_entry = make_migration_entry_dirty(swp_entry);
+				entry = swp_entry_to_pte(swp_entry);
+				if (soft_dirty)
+					entry = pte_swp_mksoft_dirty(entry);
+				if (uffd_wp)
+					entry = pte_swp_mkuffd_wp(entry);
+			} else {
+				VM_BUG_ON(!is_device_private_entry(swp_entry));
+				if (write)
+					swp_entry = make_writable_device_private_entry(
+								page_to_pfn(page + i));
+				else if (anon_exclusive)
+					swp_entry = make_device_exclusive_entry(
+								page_to_pfn(page + i));
+				else
+					swp_entry = make_readable_device_private_entry(
+								page_to_pfn(page + i));
+				entry = swp_entry_to_pte(swp_entry);
+				if (soft_dirty)
+					entry = pte_swp_mksoft_dirty(entry);
+				if (uffd_wp)
+					entry = pte_swp_mkuffd_wp(entry);
+			}
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
 		}
@@ -3046,7 +3090,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (!pmd_migration)
+	if (present)
 		folio_remove_rmap_pmd(folio, page, vma);
 	if (freeze)
 		put_page(page);
@@ -3058,8 +3102,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
 			   pmd_t *pmd, bool freeze)
 {
+
 	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
-	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd))
+	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd) ||
+			(is_swap_pmd(*pmd) &&
+			is_device_private_entry(pmd_to_swp_entry(*pmd))))
 		__split_huge_pmd_locked(vma, pmd, address, freeze);
 }
 
@@ -3238,6 +3285,9 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
 	VM_BUG_ON_FOLIO(folio_test_lru(new_folio), folio);
 	lockdep_assert_held(&lruvec->lru_lock);
 
+	if (folio_is_device_private(folio))
+		return;
+
 	if (list) {
 		/* page reclaim is reclaiming a huge page */
 		VM_WARN_ON(folio_test_lru(folio));
@@ -3252,6 +3302,7 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
 			list_add_tail(&new_folio->lru, &folio->lru);
 		folio_set_lru(new_folio);
 	}
+
 }
 
 /* Racy check whether the huge page can be split */
@@ -3543,6 +3594,10 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 					((mapping || swap_cache) ?
 						folio_nr_pages(release) : 0));
 
+			if (folio_is_device_private(release))
+				percpu_ref_get_many(&release->pgmap->ref,
+							(1 << new_order) - 1);
+
 			lru_add_split_folio(origin_folio, release, lruvec,
 					list);
 
@@ -4596,7 +4651,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 		return 0;
 
 	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
-	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
+	if (!folio_is_device_private(folio))
+		pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
+	else
+		pmdval = pmdp_huge_clear_flush(vma, address, pvmw->pmd);
 
 	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
 	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
@@ -4646,6 +4704,17 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 	entry = pmd_to_swp_entry(*pvmw->pmd);
 	folio_get(folio);
 	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
+
+	if (unlikely(folio_is_device_private(folio))) {
+		if (pmd_write(pmde))
+			entry = make_writable_device_private_entry(
+							page_to_pfn(new));
+		else
+			entry = make_readable_device_private_entry(
+							page_to_pfn(new));
+		pmde = swp_entry_to_pmd(entry);
+	}
+
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
 	if (is_writable_migration_entry(entry))
diff --git a/mm/migrate.c b/mm/migrate.c
index 767f503f0875..0b6ecf559b22 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -200,6 +200,8 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
 
 	if (PageCompound(page))
 		return false;
+	if (folio_is_device_private(folio))
+		return false;
 	VM_BUG_ON_PAGE(!PageAnon(page), page);
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 	VM_BUG_ON_PAGE(pte_present(ptep_get(pvmw->pte)), page);
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index e981a1a292d2..ff8254e52de5 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -277,6 +277,16 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			 * cannot return prematurely, while zap_huge_pmd() has
 			 * cleared *pmd but not decremented compound_mapcount().
 			 */
+			swp_entry_t entry;
+
+			if (!thp_migration_supported())
+				return not_found(pvmw);
+			entry = pmd_to_swp_entry(pmde);
+			if (is_device_private_entry(entry)) {
+				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
+				return true;
+			}
+
 			if ((pvmw->flags & PVMW_SYNC) &&
 			    thp_vma_suitable_order(vma, pvmw->address,
 						   PMD_ORDER) &&
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 567e2d084071..604e8206a2ec 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -292,6 +292,12 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 		*pmdvalp = pmdval;
 	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
 		goto nomap;
+	if (is_swap_pmd(pmdval)) {
+		swp_entry_t entry = pmd_to_swp_entry(pmdval);
+
+		if (is_device_private_entry(entry))
+			goto nomap;
+	}
 	if (unlikely(pmd_trans_huge(pmdval)))
 		goto nomap;
 	if (unlikely(pmd_bad(pmdval))) {
diff --git a/mm/rmap.c b/mm/rmap.c
index bd83724d14b6..da1e5b03e1fe 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2336,8 +2336,23 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				break;
 			}
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
-			subpage = folio_page(folio,
-				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
+			/*
+			 * Zone device private folios do not work well with
+			 * pmd_pfn() on some architectures due to pte
+			 * inversion.
+			 */
+			if (folio_is_device_private(folio)) {
+				swp_entry_t entry = pmd_to_swp_entry(*pvmw.pmd);
+				unsigned long pfn = swp_offset_pfn(entry);
+
+				subpage = folio_page(folio, pfn
+							- folio_pfn(folio));
+			} else {
+				subpage = folio_page(folio,
+							pmd_pfn(*pvmw.pmd)
+							- folio_pfn(folio));
+			}
+
 			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
 					!folio_test_pmd_mappable(folio), folio);
 
-- 
2.49.0

