Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A712F29712C;
	Thu, 15 May 2025 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314600; cv=fail; b=unrP98hij3Fz1KJ7fAiwfVaB8otlVxghzfpm7Nu6LCjKDfZoPeTKjm5MGmiHNNCmbUIROlAFvd2WZc4HEnB9Fr4X0WcaZ9ssrC2Aqarc1RRddUKd/lwlXNoNE9OgBChK3ObwTe/Davitw85k6EhuA1oxGQuXrLQgYyJKL4b9Whw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314600; c=relaxed/simple;
	bh=jBD7lqGVxso+0eQJVXUVBEbnTcBWDPS1xInNQWgOm9Y=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=tmChZMHkefgQUZ77pYRVj0jRYEjWsHm9nM6xC0DgE0MYB3GvK32G2yk0UZ50LSNEldTtXJQM+t8yXqJwtydaengHWpK0GtknqFjxxBpZGxtu5/z7Napb3C8cfZEykJNk+kyT8uNRpCx7mHHK7irGvYr/qlOr+nA4Aacu1t192Jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UW2UOHIw; arc=fail smtp.client-ip=40.107.93.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UW2UOHIw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HluJmcc/wYSWvEYtD8UNBzWiih2xqwlbBNtL2vpoIeNL4+5IRyg57ln4rlwXZ/q5g+QRPsVufqCmPj7jJyzOfnP+6wAQyL2TsPxBroIYzJzyF7boMALnwoaCW6MD6XkE5bhPNbV8wJVVXTcnp4sNsPe5yOuG24eHm+GWPTjJ2szYroVI5kFedkmgdbpo3pAR3d2KaJqc9aTW4Jf3gcyGzdvIqHxQDfFaQ4DWD1p7MiDI5X9ZdZ9CRv+mwYAmgv0tHaRSB2tK96yCzDUsoQNYbx4XewPw+wTwQxZqGPBajn3Wkpg7ZCbt2XkwA+OeQKJtbBJEtiz5R+P8SowTeTNWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcuwYPbqW+IwS7dR+oEY2KEIkRye3bhfm7nQOgkGNZU=;
 b=bsmQss6HI6f28m4eDWFCKMppRiJ/X8CW7yY8V6qFZy3BweZGmPO+jIVz3ZrNo0WQnuJxLnqAcBw4cI2c9FnIc7wX3BgdOU9nb7OwAvbWbNKajCa/cVIshRa45kwSwQmOcMbJCCd8ykYYIm8nnmPoF2RduGdPyi8EboQNKk3H/UXaSI0yLkt863j8kWSUao2ohIUp6IEwQfg+NOnstR1vbxa+5/2X3Z6EU46JwFZ+wUGBIV6fMi2vsTRF2Vpgt7zdgmc6+wnotrqgNdtTybXjLSES+JU86GNmMH6MvigMjncG1XxQWJI8mvOGDe2vFPkMgGwSh6XcSTWV3Aef531vDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcuwYPbqW+IwS7dR+oEY2KEIkRye3bhfm7nQOgkGNZU=;
 b=UW2UOHIwhRIGhJdzjTKd+W2VCw28i4lTYnqERSyXeJB/Tu17dQr/IlEw8C79uIT66Cyvj0QQnL9zv8hs1EZAPhYHvQlalAuu0o9WSMg+QhZxOW0hLkUqLN52MnYbtEMaqmMIsSkqABf1giFcvr3wWx3wvJu/+HuaNRW8nyvfoF3IOlLHEffHn48miJGctGc3mOhjVjqaTQBdicEZNMYhJaNKSWS3hKsqwvyxgts2HLOm3I6I0CuGMTh5dMdjtBl+oSDV12KzR04jDho8dHnG+nRaOETo4x7+CL1dmwpwJuiDGsiWWzaINqss4P/dZUFCo9+IzrgJN8nz8ZBeK9JrfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9281.namprd12.prod.outlook.com (2603:10b6:610:1c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 13:09:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 13:09:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 May 2025 22:09:47 +0900
Message-Id: <D9WRBS02A1RW.2LEBA1AI0IVSS@nvidia.com>
Subject: Re: [PATCH] rust: add basic ELF sections parser
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250515-elf-v1-1-4b53745453c0@nvidia.com>
 <2025051543-override-rockiness-3ead@gregkh>
 <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com>
 <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
 <2025051532-gentleman-reset-58f2@gregkh>
In-Reply-To: <2025051532-gentleman-reset-58f2@gregkh>
X-ClientProxiedBy: TYAPR01CA0195.jpnprd01.prod.outlook.com
 (2603:1096:404:29::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: 8526cdf2-fea4-42f2-5846-08dd93b1c659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnJ3NzAyWHU4QXJCQVo1ZUpGY3Jqem94YVZTNzhYZms2c2c5Tkt3TzdXY1lu?=
 =?utf-8?B?bW9nclJ3Z2p4UVJnUnRIQ1VwVFlVb3lQK1dNenV3SkpYNWJYSDZleFYvdzhL?=
 =?utf-8?B?eXRlc2JadUJHbmNva0p4cm9JRm1Oa3lLYkVUTDdnTFJYQjJTVjlVaS9WbGxT?=
 =?utf-8?B?aHd2SytPbFVnaytvNG5jOWJsMDdiUzMrRjZRbTZSN1NTa3FRVjkxaHB0TVV5?=
 =?utf-8?B?NjNQdTB2NnBKSDNnRmdPQ0ducUZZbDQ5b2NhYUFNMEJVUTVsNGJnNE9oWWoy?=
 =?utf-8?B?elhEcFczQ0t2cXpSdkFwS0RlRDBhaXdjZDdIMXlNYmlDbS82UUozOTVDd1p0?=
 =?utf-8?B?VEtvR2tGY2tDTFI3UlFubHBaQUg3dWNyRU4yaW9tOHd4eE1saFNrVEIwQlcx?=
 =?utf-8?B?V2QvMGlWWlZnUFFWaWNTWDNuV0tWVkZkbDB4UitwbWV4NG93Ync4NjUyMjlt?=
 =?utf-8?B?UC9tOU9YTUptSnk5S1dtNFdxVmZ1ZFA2eVg5NlF6cmd2TngxaDVRRC83emdv?=
 =?utf-8?B?bUlFcWd2aWR1UjZFS1BaVVhDaE9lR2JtQmVMV0JNczVmZjMrVTZsbWp1OCsz?=
 =?utf-8?B?OW02dUl1YmV0Ti91M1loQncvZmZ4bHpUN3A3V1BwamVKUUJzOFZYL3VkQUJz?=
 =?utf-8?B?YmJwbXRXZXc0dVBiak5zS21PcDRGcUljWnRLZjVUT3QwajkrejdnL20rK3Yr?=
 =?utf-8?B?OWZ0SVJoc2gxSVRGQTlRMFRyekNKK2xMSWNqN3F6QjlrVXllVlBrRWYxbTZZ?=
 =?utf-8?B?alZhYXlkeDN0TGR3dXRvdmRrYXZwTFpoS25wVHZCeXczMHJuQkVBekdpdGYw?=
 =?utf-8?B?RC9nMUtvak51YTZ6T1B4NkcyOEE3TllXZ2x5ckRUWGpUSzhHWEwraXZlMkFH?=
 =?utf-8?B?UU4wK09qelozdFZ0aVc4RUtVdThXNWpsd0gzZVpoUFArZzE3MnVYcm5PQ0Rs?=
 =?utf-8?B?aUtmbUFJOUJYd3J2Tkd3R1B0c1BMRGRrMnh0K3VraXlTb0dEV1ZVdmtIOElG?=
 =?utf-8?B?OEVNRGxudFpsU3RBaDEzNWNZemZTT3plczJvVDRyekViN1RVRFgyckUwV3p1?=
 =?utf-8?B?QWFDT0xOcTBCQXF4MEVwUGxvcmZTdzVneDU5K0oyKy8vc1VnZXQyZGRVbHJ4?=
 =?utf-8?B?SXBqb0JMUC9ZaGF6Q2dNR2JlT2FrRzc3dzJUMnVIQXlSQWhyN2ZxcTVZUjl4?=
 =?utf-8?B?NkY3b0QwYk4wSWgxdW1IRHRPdTVsb2dxWUZNNGFsUGNGY3ZGbnBCUElna3Zr?=
 =?utf-8?B?Q0JGOHh5ZmxoQTJ2M0duQVFuTytRam9kaW8vUm4xZDlZbWEwZ09VZmZBNzhI?=
 =?utf-8?B?OVl2STRya3pZUWpHT2FzdTUxM1lVQ3ZGa2tsSmxTTmVGWC9PUlRuTjNaNmdL?=
 =?utf-8?B?RlZJRy9RVXNRQkZhYlVyaklIVVFrVjlJZU4vVERNVk8wMjdQVEwza3N2dVpU?=
 =?utf-8?B?MHBRRjJUbVJsekcwV2hRY1B0L0QvSHhxOEgyL2RjRU44cEEvTzgrODRjZTR0?=
 =?utf-8?B?cmN4RU0xWVlTZnpoL3NYMWhGZ1hIblJaTklpcC9la3VaTHFrQUpxcHJZcFVK?=
 =?utf-8?B?eUFPdGxsZzl4UE9OVUkyN2FweUVNY0JQc0ZEeVNqMmpKNGtPdUJpRmVBcWR5?=
 =?utf-8?B?Y1BBUndwL2ZCMS9uYllYRzB2YURIbW9wZFVSNWpyRENJR2pvN3EyVUUyT2Q2?=
 =?utf-8?B?YW1xQWFUOUdvN2Y4U2dqbTdhVitBajZ1ZXRjc0tDejArd2FWeDRRTkpzbHRE?=
 =?utf-8?B?bFllK3ZsQXlIZkRKWXRSUGJjK0NVNlFtNTR2MTJlTVY1UTdPYzRpRUxJWGd0?=
 =?utf-8?B?SFEvUjhnTU8zRnRXcjNBck5IeHZzcjNNdkNmYlhuWXd1ayt3OFVnMTNkUjJI?=
 =?utf-8?B?RW9CbFdKMWs1RHRiRkJOYWcxL04xUE03bmJsQmk5ZGpzbktTSm5rTWpkMzRW?=
 =?utf-8?Q?zFAca7xV5Jk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE5NVjlKWnMzVHJKZ3NodlczYittQ3JUWXJUK0JIWmMrK29HSHZzWW10V0Jp?=
 =?utf-8?B?ZWVkemlGTExqc3M0d1BCbk5vUTFYQmdqTWxlV2J5YjVmODFQT0E4bzg0by8x?=
 =?utf-8?B?elBGNDVXRERSenRSSVMwaWMrMHp5S2M0REVLaHZ6czV4MW0vdGVObWpEVnV0?=
 =?utf-8?B?L1pRby9GNVp1NlpYR1YzaDBjUWtLZHNzeEFpYnovSkFsU011V2hOamdkWldI?=
 =?utf-8?B?akthYjlQR1luN3dRRmFIVUZkNEFMWkNoV2w1VWIvbmZDK3ZMZzBCTDVHVXIr?=
 =?utf-8?B?WVhXd1UzMlEzNGRQcVAyL3JZL0NsRWpkYnRLTXlwSlBURTZnZDVGUG03SEFv?=
 =?utf-8?B?MjNuRkZlWGlFVTRuSHY2c3JaWXNUaFBabTFaeEpEUWpKc2tXUjZmcTUyclV3?=
 =?utf-8?B?V0hJK1cwUFFCTytxMllXaXVDbDd5UjlqUHc1Wi9QdU83TWVRWkxzakk4WUhX?=
 =?utf-8?B?cGRWaVVZc2E4aEVBU1hPbDFyd0Z4aDJMbHZkTzJ5SWs4MVFuQ0tnUk95MVY1?=
 =?utf-8?B?RzltOTJiRUtFY3VsSkIxcmRhY1lpdXB4ZkQvZVNYM0lWblhDdkpQWHhlWGgx?=
 =?utf-8?B?SEcwY0daZ0JXb05pSW9KdVJHczAyWk94WnJyMXEvWlV3L3lJVXMybEdHTlEy?=
 =?utf-8?B?SXZXbUgzN2xwOCs2bXFMUnR0NnRFYnJuaTlnU1ZNVG8va2p4S2lEN1dIeExr?=
 =?utf-8?B?RzJWL0JhQzFvempWQjZXWjBzMkFiZCtlM0pMMUpvVms5TTlCNFBKMzR4MzJL?=
 =?utf-8?B?ZnFmKzh4aGVSemVZQlVFRGpOeks0T2RDTUh4aWgxbFhCTGw5VXFrQjBheGFN?=
 =?utf-8?B?cEhjd0tVMmFPWWE3WUUyZkI1NURHSnlJYXRMOTgyaUVna0N3U1RwcHZaNXZP?=
 =?utf-8?B?MUZHVnlRc2llUjlZV21lcFZQVHB2TUJ3dVhmb0JZL0VrNDk1Vi9MTWMxTWkv?=
 =?utf-8?B?RmY3Y3R6eEJ1RWZOc3lXa2taRnU0cHNXczhlb2tkZ0JRV1A1dkkrRUVHbnJt?=
 =?utf-8?B?THNaTVU3emNJUi9IQXpNeithbTBnaHhrS2lPc2JqTFZpeTIvcVNCK2h6Lzkz?=
 =?utf-8?B?UWkzbFFrYVVuZWF2TGw3ZzM2T2NUWmY0a2o5dXdrR3BIaGk4QnVYWlBmS21i?=
 =?utf-8?B?bGJLS1c1S1N3SHhJOXIxUmpVMnh3d2IxRFU0cTBSYW5RVDdncjN3aGFHWEM0?=
 =?utf-8?B?T0NUL1dFM0VKQUlBTGF1RGkwQ2dTaENLcXRaVDBUdGpVZEhlR2dJZURJNHM2?=
 =?utf-8?B?aU1TV1pXR2lJNkU1MUlTNVNuMG00RjRHUURKMFo3QlRnVnlTY2E0R0pQVVJv?=
 =?utf-8?B?ZWg4Wm5qUDFHZTNwK2J5aHZZNnVCTHZ3U3Vub2NDMk5IM1hUMkIyODN3LzVK?=
 =?utf-8?B?a01zUUhXTWZVbEo4aklxVW1pdlJrTDRlUmtnNHgycmxXSjVMeUluOWRGY2xv?=
 =?utf-8?B?MjhqNHlhL2NiWU1odVVWYnc5cE4rTGczQURtWTB3UVZRZTRUZ0ZpdWw1ZS9X?=
 =?utf-8?B?ZnUrSVcxc3BBUXRRcGM2QWF4RDhLTHVVV3o2ZUhEWE5sMDhGeld2cUxoWW5U?=
 =?utf-8?B?S1VVaW13SXA2TU9NYkV3WkkxdXRKemFGVVI0V1lKd0YvMGNLMjVLVDJwTGg1?=
 =?utf-8?B?QVJRM2lBL0N6aTJoNnFVcE5uSGpOMmEwMTlIU0tNN1ZINVFCZHc4bHRQWHhU?=
 =?utf-8?B?MlkrMDZJZHp5MlFKdlNLNWJubTJiSlBmdHJoVlFneUc1SlpaWnYwZ01MVWJt?=
 =?utf-8?B?U0x0MzRSYnBJcXlCUXBsaFkwRmNqZE1icFFTeUtIR1kxV1NlMWsrZ0gvbHlJ?=
 =?utf-8?B?QzJORE5uMktaeXNGWFRkODdMU0JLeXQrT2NDVDIxRHNaYkxpcVNZbUJwLzVy?=
 =?utf-8?B?c2l3RDhxU2dzcHdvZEk1WkgwVEdQZ2J3QW90cUg2TW9hQlBsOXNJOXJvajhz?=
 =?utf-8?B?QUh6WGxjS094b1RMTjI2NW80bS9YK3N2MUpCLzJpMlZVSEJaTUNMZ3luVEoz?=
 =?utf-8?B?QWgvdWxodTNaa2lPM04zNy9zcE85elhBREwxb3JCR3lLUWE5NWduU21TSDg1?=
 =?utf-8?B?a3ZnUXg2OTcxTTdFeGlIb3R5RTdqK0gxU3loQkxmWWRwOGswamtTRGIxZzF5?=
 =?utf-8?B?WTJjRzVzd09OcmFoalJmZEdYelcxNlZzK203d0VnR1NPMVZQanY1SXZteFhm?=
 =?utf-8?Q?n800JPyITvuUNU3IHLz8ojHpfgOyCxy9QsxVPRldFvko?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8526cdf2-fea4-42f2-5846-08dd93b1c659
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 13:09:51.6728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03JHAszmKuhTpljwWyW9VFdcyPNfjVUmVzT+Ea8+s2tpTJyS0Ss4sV3dyXLKz3p88Q16ZLIBydkk9ODzAMqbTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9281

On Thu May 15, 2025 at 8:42 PM JST, Greg KH wrote:
> On Thu, May 15, 2025 at 08:25:33PM +0900, Alexandre Courbot wrote:
>> On Thu May 15, 2025 at 5:32 PM JST, Alexandre Courbot wrote:
>> > Hi Greg,
>> >
>> > On Thu May 15, 2025 at 4:38 PM JST, Greg KH wrote:
>> >> On Thu, May 15, 2025 at 03:03:51PM +0900, Alexandre Courbot wrote:
>> >>> Add a simple ELF sections parser for unpacking loaded binaries from
>> >>> user-space. This is not intended to become a fully-fledged ELF parse=
r,
>> >>> just a helper to parse firmwares packaged in that format.
>> >>>=20
>> >>> This parser is notably helpful for NVIDIA's GSP firmware, which is
>> >>> provided as an ELF binary using sections to separate the firmware co=
de
>> >>> to its other components like chipset-specific signatures.
>> >>>=20
>> >>> Since the data source is likely to be user-space, checked arithmetic
>> >>> operations and strict bound checking are used.
>> >>>=20
>> >>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> >>> ---
>> >>> This will soon be needed in order to load the GSP firmware in nova-c=
ore,
>> >>> so sending this early for separate review.
>> >>> ---
>> >>>  rust/kernel/elf.rs | 322 ++++++++++++++++++++++++++++++++++++++++++=
+++++++++++
>> >>
>> >> Why is this not just done in userspace and then have userspace feed t=
he
>> >> proper elf sections to the kernel through the firmware interface?
>> >> Having to parse elf seems crazy for the kernel to be forced to do her=
e
>> >> as the kernel should NOT be touching anything in a firmware blob othe=
r
>> >> than passing it off to the firmware directly.
>> >
>> > FWIW, the GSP firmware in question is already in linux-firmware and
>> > loaded by e.g. Nouveau.
>> >
>> > I am not sure how userspace could feed the proper ELF sections otherwi=
se
>> > than by splitting the ELF binary into as many files as there are
>> > sections. Is that what you imply, or is there another means that would
>> > preserve the current firmware format?
>> >
>> > Note also that in this particular case, the kernel cannot just pass th=
e
>> > firmware without modifying it anyway since the signatures relevant to
>> > the chipset need to be patched into the right place before it is loade=
d.
>>=20
>> Quick nit, as that last statement was not entirely correct: while we do
>> patch some loaded firmware with signatures, this is not the case for the
>> GSP (the one in ELF format). Not that it changes the point, but for the
>> sake of accuracy. :)
>>=20
>> The point being that even without using ELF as a container format, we do
>> need to parse header structures in loaded firmware files anyway, so the
>> kernel cannot simply act as a dumb pipe for firmware. And since we need
>> to add structure, let's at least use a format that is simple, well
>> accepted and which layout is already in the kernel.
>>=20
>> Or if ELF is the problem, I don't mind introducing a WAD loader. ;)
>
> The "problem" I'm not understanding is why does the kernel have to do
> any of this parsing at all?  What does it do with these segments that
> userspace can't do instead?  Why does patching have to be done within
> the kernel at all?  What prevents all of this from being done elsewhere?

I don't understand how userspace could do that unless we either 1) split
the firmwares into a multitude of files, or 2) rely on a daemon to do the
trivial processing that the kernel is currently doing.

A firmware like Booter (which loads the GSP) comes with a set of
signatures, one of which needs to be patched into the firmware data
segment. Which one to patch is inferred from a fuse register that is
read at probe time. So if we do 2), this means the kernel needs to
somehow communicate which signature to patch to the user-space daemon,
before it can get the patched firmware (which will still have some kind
of header with information like the entry point and values to write into
the boot ROM registers). This adds more dependencies just to bring up
the GPU and the processing that is done is so trivial that I don't see
the benefit of moving it to user-space, even though I do agree with the
general principle.

> And ELF parsing is "tricky" in places, and you aren't using the existing
> elf parser, as proof of needing a new parser in rust :)

We could also write an abstraction above one of the parsers that exist
on the C side, but I am not sure whether that would improve the safety
argument. :) This code is simple and easy to check (and pinky-swear
won't turn into something complex). Rust also helps with the safety
aspect - to some degree only, of course.

I have checked a few other drivers and many do at least some header
parsing from the firmware. I don't think what we are doing here is
particularly complex.
