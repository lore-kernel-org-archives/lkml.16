Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D394289807;
	Mon, 16 Jun 2025 18:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750099077; cv=fail; b=Ze1CORawTP4DTcP1syG0OTe+q3HfiIYXl7/XLOg32O9umOUaTGo3KeE49Kd8YTYGEKjHf4im68brsUoaXuSp6xa54usTICVWypWmuQabC5B4fQZpkrgDntkk6FUPBRXKLJoAnnywWc2/O6XqMaQV53vVT7CBF98ozk5DnTgj1iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750099077; c=relaxed/simple;
	bh=dXTVhut/XB8gXkW7TBJ4IQtXWnVlBXRWGzF85mIGuWY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o8iyRFN9Bci9L1bIqa973Yu7BIwVVMk/9rbgLPJwIKuthhxwMrMmuWTnWecx8EooR/ZUvsve3xMjH0f3jrngxrWx4MDGAA1qAWU9qqnf12gLK4fou9oiG2oURye3ddn4h85+f/PHxxfJuJ6kDclBF/Rvm1Dq9SyKoBoiM20tiGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fBMkc2jJ; arc=fail smtp.client-ip=40.107.95.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fBMkc2jJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzC9iytCd+ANFfn549zUSRiO3xqkaxuLsxTknN9SWMG6PEAJ/QEsX9/+sHt8DVM/VvZ8RlzJBxy+OO++GBpT2Z9yArnKxLvlUe1dhGjaKiKtlL7QU6KTzs8pxozMj/+GgwvjtQ9/0ZRb05CjTgcrya4gADrrJOfFBlCyZjzD1rcC0GfjnI1/x876+b9P+PvQ9E/7jx9OLh+xcYMDXSRG97xZ8z/um0UzAYE1Lvt3nj3Y9j4Pl1jyz74pfqRGbgXptIAORpMI5+ptw9YxTIYXwH6lKvtRc8AcEJISdy7Qzq+IORDztXfb2BSioaSDLhShC++Q9d35iF3fcoQ4hs4fIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXTVhut/XB8gXkW7TBJ4IQtXWnVlBXRWGzF85mIGuWY=;
 b=fsRSkcTcZo6zfAqYZeXIS01ohTZuci1QjQg1f/NDAmdQhDWJG48Nk36Dc1Ef1OkTiiOZ5GwNFHoQJyamfCk7QwDUya2tjoZFQPbDIqql1JbeCMswViWFDQu0tWxC3HeifNMHHoUkP4pdZIQg5lFwRgKEgh8UgiCNJQABytzuEgaVmbb4illgFB+6XQRL6/CA4agtqX+RkG5qiVNRJQ7iDo6zYAaNoAWbYOXY/XhYTxk7EcY7nTe49btK2B+aVNcHlduSZM+vcCIOwr5OjvvMhrnkStLwxjkN9fwblcgtWmK/HR4A5NMKPjDRGdNrILvacxpqHnocLKe5GEKvU9jNdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXTVhut/XB8gXkW7TBJ4IQtXWnVlBXRWGzF85mIGuWY=;
 b=fBMkc2jJ+DFAvXUN3CWjaothLnufCPBlcj5eUDH9GjO3cQmeCPff2jAgmeiOSdeEYlSY3imPbko0VfdBJNj8UcEp2r0BNbnZ9DsiCudTtH3AurxN1RNuxfpDwRiUdYooMjqAx1ai9QNBlbWem5J4CZK5JxS9MXcSqJ8KfQEsUyfdk/67PHBf3ylu/gQO0DuUJDjsDEOrz6sJJ0+TTNiz3MKdzRiBlhQoK0PL+wxjhbLEvW9eu6Dqo2SYrpFlK303gX6BwWPLFiUNTxcb4hmgwVWRR/Dwz+XnmYeqbybJmBZlNVuYaPmdbCqdZtyrWfKClBfum/0n2nzsQ6O+G3yjYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB6696.namprd12.prod.outlook.com (2603:10b6:510:1b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 18:37:52 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 18:37:52 +0000
Message-ID: <703f5e6f-4bfe-4134-ae40-d9d14cd04879@nvidia.com>
Date: Mon, 16 Jun 2025 14:37:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC RESEND v10 03/14] irq & spin_lock: Add counted interrupt
 disabling/enabling
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Lyude Paul <lyude@redhat.com>,
 rust-for-linux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>, Jens Axboe <axboe@kernel.dk>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, NeilBrown
 <neilb@suse.de>, Caleb Sander Mateos <csander@purestorage.com>,
 Ryo Takakura <ryotkkr98@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>
References: <20250527222254.565881-1-lyude@redhat.com>
 <20250527222254.565881-4-lyude@redhat.com>
 <20250528091023.GY39944@noisy.programming.kicks-ass.net>
 <683721f1.050a0220.80421.29ff@mx.google.com>
 <20250616175447.GA900755@joelnvbox> <aFBcTePC-iXqRuXq@Mac.home>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aFBcTePC-iXqRuXq@Mac.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::19) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: d075215a-86fb-431d-7eb5-08ddad04e6ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTFwaU9aZWl0bCtEWEtFcjFOSlJ5UzZxZHlaZkJ4ODhvTys3L0NwaXc4TzJG?=
 =?utf-8?B?WGV6MTJQa0xIdG5KRXE1TWsyZjdOWXpxNEdVWUxoSFBwbHk4UmhMUlRscExL?=
 =?utf-8?B?azBhcVBhZDVoK0hFUzRzNXQxWkZCZG9UamZ5T053akRZL2dlVWIvaGhVSmJp?=
 =?utf-8?B?L1J4U3FyenFjMkY5VVJTWFZvekxPUmZBck85UnkxR2loK1RFUDN4R3Zrdkhh?=
 =?utf-8?B?ZU5uZzhVMWM1RW56L2ZZUlUwOHhCaHc0TG9PL0gvQkhzSzI3OGtiRFBEcDBR?=
 =?utf-8?B?V2c3cGFHdXRZZDJSRjlEQmptdzVrVGdIRU9zK1lJazdpVlg2WWlGSlFSK1o1?=
 =?utf-8?B?VVp2SjNXRHdLc2QrYURYL0g4Qlp2aGNpR0NvdmxvZi9GRnNQS05JNVQwSnNW?=
 =?utf-8?B?TGd5T3lQdWM2K3FXM3VaN0p6NThXSHkrRTlmdEp6Y0lhcGZwcmlrMHJ4WFEy?=
 =?utf-8?B?d1pkT2s0NFU2cUVjUmJDNEY0NUdoaGJNMmVqWjFOc2JrVE9XMVdiazZRRGNu?=
 =?utf-8?B?amlMQWZ4bVIzelljZUEzY0t0SnlZZDMwOE5iVlhnV0trTE80TWMzRlM4UDYz?=
 =?utf-8?B?RGRMazVQdU1USHVKMDJ5ZnBMQzV0Uk91VHltelFnUVdXQ3JvM3dnWm1UTk51?=
 =?utf-8?B?VVhhU0tkM09mYlRGRGRmTDNDUGxiQTdsLzNkZ1N4K25HeDhwZmp1WkRjWFJi?=
 =?utf-8?B?OTJVdTM4SlhwTDU4UnNVVHNHRnEyNXdFSFEyWHprMzdCcDkwZnY5djdSS2FW?=
 =?utf-8?B?b2cxNlpLU21HWDV1UEhkSHFEaVluVFM0L0lPLzJFR1hIOGxlTkpPblpybVhR?=
 =?utf-8?B?Y2NESTk0cDZQdG9kVlNFdjdSSnBVL2dQN2kyVGNMV2Y5b1ZsVk9Kd0RNbGlB?=
 =?utf-8?B?Vzhqck1tR2R1RU5qWnlJOU8vM294cmxiY3NYU0tqYWFvQkRIeXRUclBsUUps?=
 =?utf-8?B?ZTR6RXlnM0lZaTM2a1BXRU8rTHBacTF0bmJSUWw5Q3dHNHh2MWYybE4vaUtz?=
 =?utf-8?B?ZjNtYVRzajhOWG9mczlFOTN3R0RhMVdPZTJQWVdIeWZSTXFVb240cXZQbEJ4?=
 =?utf-8?B?cjF4eFI5dW05bjFCa01pVnRpV2dIZXpIK3VtQ0MwVFJYczNSNXQ3VkkxT0RN?=
 =?utf-8?B?Qjc2M2xhaCszSnhkci9HU0x2MmVqQTIzS2JvV0dIL08xazJROHNmdEJ0QkJI?=
 =?utf-8?B?SElGM1NpZStUUkFwdEkxVm5qc1NGcy9pOG1MR2FxRHJHRVFHd1FjdjdKaGRq?=
 =?utf-8?B?ek9JaTh5RjY4QVl6VW9Eb09JdnUrRkl0MmxFWGN6Ym1hWm1Qc2JXV1QvWWdi?=
 =?utf-8?B?VDYreFY2amRxZ2pwa3dDWG9VSTk2OGVwT1V4Q3dJdXlzOHlPc1Qrc2pJT3Qx?=
 =?utf-8?B?VWR3OGVXSktUOWs2SGlYNTJ6R3hRbEljVGVWWjJwSVlDVWVBaC9KOWJnZlFO?=
 =?utf-8?B?TEYrWC9leGdwUytHYnN2dWllckpKZldIRTlGdzNzK2twZ3BkK0lhb29QM01K?=
 =?utf-8?B?cEtCeGNQbHNJM1o1dDZGZnBlWGRZdDZTeEV2ZDZWSzFXK2NGMXR6MnVxV2Qw?=
 =?utf-8?B?bUU2bGFxVGYxSW4yV2tlZlRhSTVqaVZmNkxrZVgwNUk2N0VSRVJ2QUFPNU5o?=
 =?utf-8?B?OFNtREhqeWlaRHdNeGMvaVdSMHlld0RtNDhkc1JsYlJ6dnpZeFprUWxLZ1dt?=
 =?utf-8?B?dVpBRlRrODh5RDcwVis2TTR0NGFCdnRNWFN4RlFCMzNwYlpyaWg3UjdxYWRZ?=
 =?utf-8?B?WTdiOUtxeVFkendoekhiSVQ5V0lKUGRkOHd6blV1NWZvYjR6QWxELzMvN1lP?=
 =?utf-8?B?dCtmMlFSUjdVQnY5d3E3UXdKNUFDOXlXR3RkQ0pkNnN4SEFuVW9FWXZmLzh0?=
 =?utf-8?B?TmJIUk5JMHFBeEVBNWFuOEJQdXNGSHAyM21MbXRyUkZuZGlMMHVvaDk2ZkJL?=
 =?utf-8?Q?JeMvhsinKAs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnpCNStJcHFrcGhSeUV6Mm92QitScmtXZDdLdFdVanQzSVlrVkc0NDFiL1py?=
 =?utf-8?B?WXNaa00zQXRJYUVIWkkyc1VjZ1hySnViYVg3V3hzUVlRZ2lnOFBNZElzM1NX?=
 =?utf-8?B?V01uOHhFcnRGYmNkSmZNNERiRGhzamRaWFkyQkVieXUwNFhCT3dtTGdpZzNj?=
 =?utf-8?B?bGgwM3lQQ01xMENEVWF0amlYWW1hY3lldzJCL3FZUXdRRFB5UFNtWG9zTGYw?=
 =?utf-8?B?MmNHUWowQ1dmaFdDRE9hRURhaWpmeTlhS292NEJDaDZzd1hmbGMyR1VEKzIr?=
 =?utf-8?B?ZzNnanQ2U1FTZm5Gb0RFQ3FaOFpHVDJlTUFwSERFMmlYejZmOU85TzFHWEpD?=
 =?utf-8?B?bTU3WjdkcCtBalI5d2NlUkJ6NksweURkRXQ4eUkyWjdFWXlSZVZja3h6VFBj?=
 =?utf-8?B?cmNnQkJOcFBtdThTVTVCU1V0Tm91N1FRS3VoS2FIYS9DNG1lMGl1VVd5ejRE?=
 =?utf-8?B?T1R6cU1OTUZ4dFhRV2x2cE1Mb1dWUStPNlFxS1pPY0oxZDhQUi9BMFNjTThQ?=
 =?utf-8?B?ODNsZW1DQzBZV2o4S3pSS2NmVUhiOGZLNWlsNUM4NW9nUWpEYUdGWUx0aE9U?=
 =?utf-8?B?ZTZFdHVtazRoNVFza1NmcVlheXR2L0dXWEdJS3JMeCtEWjAzRkw0MU5hYmF3?=
 =?utf-8?B?TVBiSG5qY3ZBdmpMMUVPUmF6Q0Z2eWVoTytYT0pXdklUNHkvQXBTOHJtci8x?=
 =?utf-8?B?MDB0cWcwa3VvOEIzWGlzbWlOclhIS3ZSUFYyTlU3T2V5ZDVST0RPa3dOdHJP?=
 =?utf-8?B?WFJoLzNBWmdsdWFKNjBYVk1YRDkwb3plNDRMcWVuQ2ZZdWRHMk5GdHhjYXF0?=
 =?utf-8?B?Mjh1dHNrc0F1U1lucFFTOXE3WGVQdnUwSjZrY2NkUHVuVE42RmJST0JTYkdF?=
 =?utf-8?B?aVNFa05FQ2Q0OG4yOFcwZVp3R1dET3B3ckpFSFI4YmxBaURzSFRHNU56RWlZ?=
 =?utf-8?B?Y3c2QTByWE5vaU9WYTRtWVhrNFFrR3M5b29URFJqRGIydWRCK0dLOVRyNWI1?=
 =?utf-8?B?L2cySlpTbzFPaXltUWN1cFEvS3EvWFgrM0k4eVJ6MS9lWnlGUUNwNllFN0t4?=
 =?utf-8?B?Rm56QUx6T280RXJ4UlRkU202TUwzUERMVzBCckp4QlZaV00vb1dPbzE3Y2RC?=
 =?utf-8?B?QkRwcmdNRHgzL2FIS0ZWYmEvRGFiSDRzcUJ3R3Y4YkZJemVCZkluUThkQm4r?=
 =?utf-8?B?N3pUR1NDWTMzQlptbTA5b3pHTzU4djNGdmdRM1JxMC9ER3g4UHhPSXFYOWxl?=
 =?utf-8?B?cmcxNnlZdm9meWM0V0lOM0VjZ296OUVYdVpqT0p3WmhlQUROUFM5VW5ZNy9G?=
 =?utf-8?B?YStwa1dPVjNaNFVlTHJjYWhtVUo4YWJ5RmtKbWY3MkVnQWMxSTU2ZVQ1RWVw?=
 =?utf-8?B?ZGlSRVl4V2VYZVlCNkowQU5XNkQ4ZHZTVGZqdFRLYUFPcUlIbGR3cnNqdDd4?=
 =?utf-8?B?dFNJellOZVl6QW9KWVpUdnJjYmZLaWZYUXJRbzM0MnRYcmVSTEN0aHdqbytt?=
 =?utf-8?B?Y2srdFRTYlZ4Y3kyd2dBbFBObmN0K2tzbWZ5NjlubUxibUcvZmdXa2tjYUI3?=
 =?utf-8?B?RnhkMnJtWUQ5N2lGQThZTFo2ZklFaHVJOHVlclpIeUgzTlpaczlKMG9kODRv?=
 =?utf-8?B?dldBeHlITXA0ZnRoMUtvanhXeXNRemdZa1ZnV0NuVzRPd1pINW53b0NnODA2?=
 =?utf-8?B?aTk0aENBVDBzeHFCeHRxWTI1VHlEdnZoWlFzaUZVLzZ5QVYxZ2xmTjNWdjZF?=
 =?utf-8?B?OG5kMkw0QTR3dit3Y0dsYTZMWUM1MlRlM2ZaKzdSZ0o0Y2dKcGNLUTVJNVV4?=
 =?utf-8?B?cE5SU2JjeHpzdld1bjhHRHNyRWIwV0ZsT0ZHQzlreVpZalpjeUJHZkRwa00y?=
 =?utf-8?B?cXVhd0NhR0FDTks5c1ZkL1lIREhZZ0U3WXo1VEVhQmlJZ0xubVRoVnZ1UlZ3?=
 =?utf-8?B?cFNhd2U5cG15UERnM2wrb2dXUnRuUzc2NFNkS2VRNTNSSVR2Wm9wSzkvMklX?=
 =?utf-8?B?enVKRm9RTVpaNk9yNlk5REVWSWtqaXY3YjByRnYrMmZvOEhFeUljTU5VeEx1?=
 =?utf-8?B?bnN4WHJsUFlYT2w5cDZzMmRYY3F3TUl0bUk5cU5INXVTMTZabWI4YUtOb0Mw?=
 =?utf-8?Q?P8/8/nR1V/ivoJ4SLouk6V8/g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d075215a-86fb-431d-7eb5-08ddad04e6ce
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:37:52.2056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OgBrb2CLvScxGbYc4CdEV5Xn/Bd4rmh3a4sCvDCa6tj5KLdQDgHEvLom5UirAsg/sL+bIoyuqiWEUttAR3yM6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6696



On 6/16/2025 2:02 PM, Boqun Feng wrote:
> On Mon, Jun 16, 2025 at 01:54:47PM -0400, Joel Fernandes wrote:
> [..]
>>>> Your SOB is placed wrong, should be below Boqun's. This way it gets
>>>> lost.
>>>>
>>>> Also, is there effort planned to fully remove the save/restore variant?
>>>> As before, my main objection is adding variants with overlapping
>>>> functionality while not cleaning up the pre-existing code.
>>>>
>>> My plan is to map local_irq_disable() to local_interrupt_disable() and
>>> keep local_irq_save() as it is. That is, local_irq_disable() is the
>>> auto-pilot version and local_irq_save/restore() is the manual version.
>>> The reason is that I can see more "creative" (i.e. unpaired) usage of
>>> local_irq_save/restore(), and maybe someone would like to keep them.
>>> Thoughts?
>> My thought is it is better to keep them separate at first, let
>> local_interrupt_disable() stabilize with a few users, then convert the
>> callers (possibly with deprecation warnings with checkpatch), and then remove
>> the old API.
>>
> No objection to doing it slowly 😉 My point was more about the plan is
> to replace local_irq_disable() with local_interrupt_disable() other than
> replacing local_irq_save() with local_interrupt_disable().

At first glance that makes sense. Was there some concern about overhead? Me and
Steve did some experiments back in the day where we found local_irq_disable()
can be performance-sensitive, but we were adding tracers/tracing which
presumably can be higher overhead than what this series is doing.

thanks,

 - Hiek

