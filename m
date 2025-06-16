Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2080.outbound.protection.outlook.com [40.107.96.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8713C800;
	Mon, 16 Jun 2025 14:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085584; cv=fail; b=W1MiPxlnYNasYhCUDHUMX3ZbopFnVONL0tCEmYjZv3BoJ+5/kQLajTKXFagpIM2i8eeTq9dXxcRQqqfTn5NcunS/7loS6zO1ZJ87bTvb8NlUowYYl4MaU7HAjUCF8BAXTk+106TvPDVhuCrHAmoLhvp2BIoypA1qrECyMcS4oWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085584; c=relaxed/simple;
	bh=bIyQzY93KLyIlkpgDxNsI+QbNeP6/Ql5tOGxBq4+1Rw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GBTyEXZDDludP43O5PTxZ4c0eUaaALmdoMdpuC4zA/h8TpZts+yg5AUzhxbuo2g6TfQbQFwhgluGsNOLA285S5TnfT7NhmvBCXFid07hhqC4bSoxx+bPgqfx3NykKwSW/bG2pQhlA4P/MK1tHedqhll89WDiH0zSXDHNOrQ82L8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ht4ELTgV; arc=fail smtp.client-ip=40.107.96.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ht4ELTgV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZso4QcysfKcABrjNCFEdE1dwgpIKocAMqrLC7Xw1NW9q8CVXQK3CL/G+EtnO1nmQKUdb9o/txOk2Oa+5emnI9UnlEkougm0e+HFytTJQa+3Ou+GZ35Quh8XLAfxhs0/VA5LRNGBDcvUV6dSmwQ+tq4btVRSPo6XfpNfSkgK8KDZxvqnwPX49EFZ2h8pR++dhM/DzfONwR3nvzUZrJlhnJsRSmi5pPhVvjXKWgM4l5/24bzannS0aX/flpqV/gmXrRFCdJ6fZzj/XEu62nUSyHGSfzyM4LcWAlWeBaYI4D0ZxB4x9wm4rr3c4iY49YptqsDHyf7inR/gwfjMZ5drBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIyQzY93KLyIlkpgDxNsI+QbNeP6/Ql5tOGxBq4+1Rw=;
 b=Gji47Q9MCQBdDPJIyXGhOI9vlLfrmsYFVF87XKUnJPDKLVIz5Zh6slaJqjgyIv62b4ZD3F06bI6vnWvjz5iVATsRgU9xitNNe0S93g9dzoEmzqmNjue7wEeneziJhTOtge3tEj39klD5aAUyHjD0KMAimqRYyvE2b+U8kYC5CoRUGk+AlzPLvlmyZDo7g5rVgf5jnWJhJHF59a0Ziahpvq7+omCzDHLB9K2PF5evZfPatM4qc074JgtnqibpdOq9LIveJuCZ2RiraQMsv+bF4c13+YEbO2UEMsDDHMW2hvU7I0vAVMQjdEoeXFJo9nd2HsmovIYzPub5z2frXSOl8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIyQzY93KLyIlkpgDxNsI+QbNeP6/Ql5tOGxBq4+1Rw=;
 b=ht4ELTgVGEdYaDujm6uvVXEwOeXlGK9uXEuyleG4rZnjQF+uJEtvLnvEXhR+OEWXgScOs5mwX1RUJUbu1C0lBKVUxLL5AknhRKkQSY5LQ9NfMZAnGwCVWhuGg9sRBeE8CisuLblIZOezziDhY0neToM98ChpxlElZuUCgnYpNhxjrEct+Z8jhZLdCCtqBdojtsmXxS53f4XvRfVXFRrqPoawLjghTgFwtv3EdfR0dF5QoLHjrLxLNkOLcJOS0vwfdbK9yjRSBAMJpQhjfl1wxU+u8efUpR6rh3ZGg5KPXBXZGWw//H+ChhU8eWHTbIpOlAl3wUwtt/OsGdIfBxlEew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4051.namprd12.prod.outlook.com (2603:10b6:a03:20c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 14:52:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 14:52:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Jun 2025 23:52:54 +0900
Message-Id: <DAO1K5YIFVRH.31XI173DWYYX1@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v6] rust: kernel: add support for bits/genmask macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boqun Feng"
 <boqun.feng@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com> <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com> <9578ECFC-6C59-40E3-9340-A426E8D2328A@collabora.com> <aFAqLYBMHkC_X-dr@Mac.home> <D29BB87C-356E-4885-8308-456028AE3B6F@collabora.com> <D12DC02A-E1EE-47F1-86AF-C25C492FA3D4@collabora.com>
In-Reply-To: <D12DC02A-E1EE-47F1-86AF-C25C492FA3D4@collabora.com>
X-ClientProxiedBy: TY2PR0101CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::27) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4051:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5296c0-aba3-49c7-54e8-08ddace57baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVhTN3lpbTdhRjZZZEVjWTNLYm1KV0NzelVQWWgyVnlxcHgrR2lwOFFsd1Fa?=
 =?utf-8?B?OHlEdnhsK2x4MG9aY0dteEE5MjZiYjkvaWQ2cGhHRXRLaHozMUZrQm9tQ25L?=
 =?utf-8?B?VlVmQTZiVkM2M3BXT1hHUFVsMFpkWG1EU1VITFZSVTNjNHJ2Z0JIZ1lnQi9X?=
 =?utf-8?B?T3NWbFoyUHphQTFlQUYySlZRdjZVUkpncWxqUjVqU1A3Q0MxNFoxTmpVc0xI?=
 =?utf-8?B?UWR1QWk0QklueUNzaCtTT3JHckdDWHRKMXY5UUdkbXhKV2NoUmFoMXJmRFJw?=
 =?utf-8?B?MmJ3dkZ2UU1tTU4wT2pncTdlNTN2bUlrS3d3NC9uRDVMNmdTVmhMdlhFOW0x?=
 =?utf-8?B?bmJySncxdlhmVUZyUjdVanYzS3d4emJqUzk0cHBHMmdKanByQmxlVWdNTFZ0?=
 =?utf-8?B?SjBKbnBnbU8rRXpBUDdhUEFiWG9UQ1JkR1BMV2daemhWbG0zTzUwcVVxRkNR?=
 =?utf-8?B?NkhQS21oRWRhbDJGWTFvR2JVVXFacFRYeTB0SiszMlFEUnpRUjVkdmhuQjZS?=
 =?utf-8?B?b2luV2NQQjdRK0YrS2FvRSs2VVhoWDVDSU9Ma3B3TXh5L0ZURFZUREtuelBF?=
 =?utf-8?B?d0ZPM2tHbGQ0eEhsOHM1cSswU3R3emQybEZQejdwQUJCYXBrU1lubXJkK2R3?=
 =?utf-8?B?OTRDbGFoWVkrVEtNNjl4RUlobjBGYUdQcFlPVmJqdHN0YmZKK2RnUGhVQ1Jw?=
 =?utf-8?B?MVI4YjRFeU9OQzlTVERuYnFveEk4QnNkNkE4aGJIbEN6NGEzOTBUUThkV051?=
 =?utf-8?B?QVpCazRZRWRoYTAyaXNEVjZPM1UzM0wydkpWeUpFQzByVnE1TTlKaHFxbEVj?=
 =?utf-8?B?a25zVUxMaG5NdE5ucXkvMWdtV0g0eldHczdTbkRBNTVxNXFhRmJyVi9zUkY1?=
 =?utf-8?B?ejBhOWhMUVpSVjVmb2RHV0JGZDZnNHQrQU9NOU42NHJvV0VKWjA1SlBGMHo2?=
 =?utf-8?B?N3NZcUMxQWF0T1JqbHZENS9vcU1wS3lsSDFEQVFobUFOQVhpaXg0TkE3Szh0?=
 =?utf-8?B?ZGl2YUNtK0dvL1Z3UTdkdGNnL284RjkwanpTMzhoNlgvUHA3QkJFYkpJVEhm?=
 =?utf-8?B?Ym5SWnR5OHlJeVFQWmd3L0prR0V6Uk9aSWdZUENBM3kraDVHbllNMnpEeHFa?=
 =?utf-8?B?cnhBSkJlSWxlbzVDK2hIQUN0eWtiMU9sNGErUnJpYVF6M1d1L0tqc1FPa2xQ?=
 =?utf-8?B?QTRWU0w2VHZXYkVZekZQOC9PRm5vUWJYdjREQjhyNXJiY2Zla0xkOTNyclFU?=
 =?utf-8?B?MU1YQzFPR2taeW1SU3pkU0FkVkNRTW0xTkNPMlhLdkJTSVhVQTZUdkJubVAz?=
 =?utf-8?B?UWFFM1BWWlRtbzV4OE50dXVxckF3V0lFbDEvVjJQRFpEMW5oSXVlb1cyWkE5?=
 =?utf-8?B?TTRwQ1Z2Q3c3TE5ldUdEbGt1T1JPQ0tJUEpIaEcyMDQ1Q3RjZmlQR1o5dHdQ?=
 =?utf-8?B?d2lHRmE5OTJTZnRUSiswRnJvdjBJT1VEdXRHVGxBcmQydTNhMC9BcDlLN0Uv?=
 =?utf-8?B?Q0N5STNHcEc0cnJYeGNBdEE4cGdjajlRS29Dek8vKyt1eDh5TmYrRTUrQnNW?=
 =?utf-8?B?dDNjM3huTVlydHJ1K1phcXFlaVhpQnpwL1R3Q0tTcENwWGlxNUhuK2diTEVT?=
 =?utf-8?B?L3l2UWRzdjdleVJNcUp5bUhLV1ZwK3g5QklSaVNZaG9GbnFlWkpXZndpb255?=
 =?utf-8?B?TFA4R2pTR0JraVk4SExqTzVNOFVHaFFDM2hIVEYvbERKd2lBcFIyNmNieDJZ?=
 =?utf-8?B?VGZxN052Y3ZEaWlsUVFTNklxV21oZ0RENWhNZi9CMVUwOWxPYmx2Z1ZNS0ZZ?=
 =?utf-8?B?N3c5YnZ4UXI5YW80WEpGVlhoL3NnMmFvdGU5aUN2WlFmRzUrbUI4dlJVOFpJ?=
 =?utf-8?B?YXRjWUtITkNRcmJCdElXdktndUFqclVTN2ZJYTJjLzdGUUpjTTc2TXlzSHRi?=
 =?utf-8?Q?hgRloqIdCL8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEp1enY4eGxoaXNsS2Vxd1lPSERiaEs2Zk9HdmxWNXFGU1p5L2hwOXFES1Jz?=
 =?utf-8?B?RW53Qk5GVHIvU3V3WlBDbjFWTGFhdXNRVkFyY29pVXZJblJrSjFUaXRQMnVW?=
 =?utf-8?B?cEw4M1Z3V0x0TW1QZ0pFZUR5clhXb3hVY0g3OEprL2RBYlp1V0I1Qll0OWMy?=
 =?utf-8?B?QXppU0t3Z1RoMXhnVkNxV05LVTJMRExKWEp3QUczc0lDcnFqWmNRNWlhUDVt?=
 =?utf-8?B?ZDc4YTJ2bW5uaXdZcmlqU2pEQzRYcUE1VnZOVEpXZktDSlpMUGx6SGljVm1r?=
 =?utf-8?B?amI4L2FSQ1p4YXl1eVl4bWxDSkUzWXU4V1BYanpqSTdqTkZhQWFjeXdJL0Rz?=
 =?utf-8?B?T3p3RytyNHRKUG1QOVdKM2F3Ukxab2FDT09kS1Jlb0tzSzRYMllBcjJaQUNi?=
 =?utf-8?B?b2V1ZEVmTGZURlJkeVF3eUU5RVJHem5YUHkyQjNYK3pza3JoaDkxUXZBbUw1?=
 =?utf-8?B?MWpzanNMM0RYYVhzRHFZbitjc1hzVHprdnBHYWhTMW5IeGZDaGxEeldWUzYr?=
 =?utf-8?B?T3d0ZHdUZk5CTjg4L2JKNGVxSGJ5WHFyaUg3dnQwV3k3aFBmRjY4TDUxeW5w?=
 =?utf-8?B?R3JZQlVJcisvbXkxL2p6OUZ3aEp4NmQzcmtuMyt3c2FCeWFWbkRMenZtakUx?=
 =?utf-8?B?YkpvUW1tQnphUkRKbkJwb3NvZVZ0aU9mT2xIckFnTWZjREpFcVlMZGRzTytV?=
 =?utf-8?B?OEFXcjI1eTlwT281MXdzQjBVY2NxeVpXT0VkQWpGNk5pN2RRVWZWek9RV0Qx?=
 =?utf-8?B?OGI4Q1RSL2V0T01FbnYrU2JXMWJzUWRDZFJJWTB2N2RNYndteXNZbUhIL0hN?=
 =?utf-8?B?SC9PUE9ZSHlFOXdGTnp0cFNVK0NYUDIxZDUwMVYzNWhFSGVBTm9SYUNLeG5G?=
 =?utf-8?B?dGRuU0ZzT0srMmtxQjJBTlVjbjJ4R0xOMFBzYk9wL09LTXJoQkpKUWVFdyt1?=
 =?utf-8?B?SE9KNDRWcGhsU0x3bzVCVjJQdVcwZXRXYWFkQ0t6WUtBNmVUcklBMlFLdm02?=
 =?utf-8?B?cE9Uc3h0MVN5NWVReXVHSHZnSVRicGliRHJSSUxLWllzVjBreUt6Qi9PVUo4?=
 =?utf-8?B?ZHc4em5vSnVFKzgzWFFwS3EvV3ROZFhSZERnSG4vdXhJM0Q2Zi83a1RvMGVi?=
 =?utf-8?B?eEpiQlN0U2J0Tm92anJXRFRpeFhKRVR3cTl2UU9HSGRHamVTWnZuV2lDSnFM?=
 =?utf-8?B?MVQrbHVkcHN4ZFlVbDdSTzdKTHNpSzJkYnJBYnlSMmxTOXNPMlBHOFVXVzQ1?=
 =?utf-8?B?MUxmUE14dGNZazJNaUx2VG1JbkRNQkdSN1VBYldVL1RTdW5mdnlhdDFMVXB0?=
 =?utf-8?B?RmtSMWFwSkQ1TWV3akVJcWg2LzJVazVScWRLUzRTRW9ZMThuemZEV1hXaXAx?=
 =?utf-8?B?UXNiM245M1UxOXRHekhtOWJ5MXdpS2RDYzBEZGZQbmpwdWRTMFhyVWY5Mk5x?=
 =?utf-8?B?VlRVeUFZeXRncnpsZ0o5MTJyRGhldzRlVDBOOXJWK1ZtQ3o1QnVwQXZiSjNF?=
 =?utf-8?B?R0FadFRBTitBSitTMExFeHgxOS9VRDZVeVZyNk01TzJMTXR5YnE2YWFKM2xP?=
 =?utf-8?B?SzVYZzBFQzFyVzBlNFpjUEtVR21DQ1E0dHNHRlByVVA3WXBuOVJtS2JnQnlx?=
 =?utf-8?B?dVo0M0U2N2ZpL1I0enRQb3hRYWdpaUxJVVB2MEJBT1RwUUsvT0VSQ3RuRVNZ?=
 =?utf-8?B?VmF6Y0l4U2ErTXIwVVFHUHFkTFk1THZjWEplYlVhYTNtaytkS01vaUNXWnZL?=
 =?utf-8?B?RUZGanlVKzZjdGZBOWJBL0RFNDZZTE1WeUY2UkdOa1RhWTJYM3QyTTZvVS9i?=
 =?utf-8?B?bHp3L2FOYkR5aFdTUWF3cGE1QVBBNDJnUWV2YzgrMjdJQ1RVcjJWZExmcGlB?=
 =?utf-8?B?TExPK1FiRHFUTC8wN280WUkzSEtuM1gwZjk3NktiVWV3bW91cXI3akxLRlFa?=
 =?utf-8?B?WVJTVS9XTHNFQTNIUFpwUkdLdE0yVHZyMmhNQytpVmVWdURzaUNITmFJNjF4?=
 =?utf-8?B?bzVrU1dPa05pVWpweC9TbVhPaC91aHpwQ3JvTlZGMjNGY0JtcFl6elNGWmhW?=
 =?utf-8?B?MWQ5ZDRXZmpSZU91WDdwZ09ZRlc5WDJ5OE1lVkpkbEZzYS9NWDFmS2VFSTNG?=
 =?utf-8?B?U0lKMVFidGpsTkxSYnhud2V2MnFhTnhkemF0TU40dWRhaUxYajBvdVJiaU1Q?=
 =?utf-8?Q?mOjKWCaT4OvQHRF23cC+uky+WAVsZvmoA5ut4WihWDeg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5296c0-aba3-49c7-54e8-08ddace57baa
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:52:58.0308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0Bd1Z6vjpsaHN/TsT/p4pzm0hvk4Wgsues/hHTalm7bRUZMiDx0/hWEkJn37G9fX+YqtiXoEWbHXxMr0zogYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4051

On Mon Jun 16, 2025 at 11:45 PM JST, Daniel Almeida wrote:
>
>
>> On 16 Jun 2025, at 11:42, Daniel Almeida <daniel.almeida@collabora.com> =
wrote:
>>=20
>> Hi Boqun,
>>=20
>>>=20
>>> We should tell/educate people to do the right thing, if a..b is not
>>> inclusive in Rust, then we should treat them as non-inclusive in Rust
>>> kernel code. Otherwise you create confusion for no reason. My assumptio=
n
>>> is that most people will ask "what's the right way to do this" first
>>> instead of replicating the old way.
>>>=20
>>> Regards,
>>> Boqun
>>>=20
>>=20
>> This is just my opinion, of course:
>>=20
>> I _hardly_ believe this will be the case. When people see genmask and tw=
o
>> numbers, they expect the range to be inclusive, full stop (at least IMHO=
). That's how it has
>> worked for decades, so it=E2=80=99s only natural to expect this behavior=
 to transfer over.
>>=20
>> However, I do understand and agree with your point, and I will change th=
e
>> implementation here to comply. Perhaps we can use some markdown to alert=
 users?
>>=20
>> =E2=80=94 Daniel
>
> Or better yet, perhaps we should only support a..=3Db.

... or just drop the ranges and do as Daniel initially did, using two
arguments. But I agree with Boqun that we should not deviate from the
official interpretation of ranges if we use them - the fact that `Range`
is exclusive on its upper bound is documented and a property of the type
itself.
