Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2063.outbound.protection.outlook.com [40.107.105.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1B11A2632
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712486; cv=fail; b=FUd4+QjbeJ5LlxlKYwg8UheGIWinwU8xIT1zOklPtRV+ERyoa7FLTX+JhjP7XGM7zXQl4aPUa7w/0TSF8Y/PqgjzrAy+Fl3v6Nc52SHr+3UvHoMzLrZbhJeAkRdCEYMoPLWLnstm2h937JaPhzbEuM1U3pyf7/MF2OfAg/KqOto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712486; c=relaxed/simple;
	bh=fW2RO3Him+2AvUKDLhwUPfazw/4N7R9xmvkSPMNKzLg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XTemoytVyg8aRAWsN9faJDG+RihcnMZSXTUT6Z3ZIdEbpiTnf8nt6HCRWnmfbvjAMyYUWhYhxgbnYRQ8ofCpM/U2GiBkB5MbDfUYRbl728HG3REI2sN5A8vbnWkGlnG2dnuTSx3DOOPgufpu02RDT5nOmUjQP9SwCSeYCd0vxYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=lNN15n9W; arc=fail smtp.client-ip=40.107.105.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="lNN15n9W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zF+7Qv+PEMzSsLE7bNyhm0qtAeKbC/VvuHKg3ZbshKJZPxygo2OKtgC2i4R26h1J/uI8kXjmbjZNdnDbpmHgeQz/ErVP4uUYHYtz6hqy1A5GkSrTSB3QTxq+YtNMTA0RRKlpttrjiFKGNBI4kYd2UFH0Zz7tLwAdYj/COU2VmzipjG3fG8B3Ep8qatzwXoNUNUGS/9sNdlK/jM25dsF7hCqzOHQrqDLek6ztbf/wVd0mOrA+iggREvEbNgBFVaEqtkldBw+lBn34TZZALOMerscX3CwGGnoyictP4KgZnCS2crDkUNerwJPvI0qgda4NCbk3bQTZU5p5Iiee4+yrTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xu4rXJgQZAxs3bBQKTMSbuhwvq75qC/kS5YGv4rvO0E=;
 b=Kd7zPyA/mp1rpcnDpnz/Ir9gd919seZuX2ljoa+sHRfBpZbWyqAvN8IV1NznmM7NUTfon81BtyIUv8f7bioMRg4osGdQlOKmGcRaX0sty/MfXCpBciiy2mlobubIKahp1jPmQvz/SOnQNQzVMx9LIQqHX5//P1sDAr8TiQj9m/LEwbFBA5LX8trTg74E20Pu387jP1AAb+c2np1wTTXb1yDzNGNJLsEmaAa4dkQV7LE6fVKxFlsmGJV6XDuzO8F0J5oI6SgiD5MHA6gyuZsSXoHSmTxYeSOwpWSCRytLNP3L0RLcBI1Gxa3WhG5DmoVqly5NPaakBUNmvZ9PDlNNeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xu4rXJgQZAxs3bBQKTMSbuhwvq75qC/kS5YGv4rvO0E=;
 b=lNN15n9W/rbvddFAiFHPBXdA2BVtptLrQJAnVKqVwbNFnE/9KjDe8AdOOYXye02as717p9bldBkUq9TFRqfbCnCmKuFsdHLLHKeWYGbtttEl05mDCv/c1p66pq4jgM9XnBbQjFNuSIkE4dYB1chhA7PY9aqnM+2O43I+YLtAmxDsfh3lHgj/bJptANIsbaDsN+zlGbFkUkDCiTBkDFZHvbM/ZmRP5pDPb+m6yTgbuvJCfAvvWKNF8pa2LV9d4ieVJ2QN2Z1VJf4zAcoqu6iP3toeZT/0jpiPEEdUc0WKLlj96J66mE2mvd5bjR1vtasepIbyr9YfIQQqh9CVY/pZVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by PR3PR10MB4030.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 10:21:22 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 10:21:21 +0000
Message-ID: <f5111e9f-bdee-480a-b29a-d8d1c207a600@siemens.com>
Date: Tue, 15 Apr 2025 12:21:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/7] Defer throttle when task exits to user
To: K Prateek Nayak <kprateek.nayak@amd.com>,
 Aaron Lu <ziqianlu@bytedance.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Ben Segall
 <bsegall@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>,
 linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Chuyi Zhou <zhouchuyi@bytedance.com>,
 "Sebastian Andrzej Siewior," <bigeasy@linutronix.de>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <cee5bca4e2b024d3406b40b84c0d5db91c7d276f.camel@siemens.com>
 <20250414120407.GC3558904@bytedance>
 <7483d3ae-5846-4067-b9f7-390a614ba408@siemens.com>
 <0a06f6c4-5d69-4fd1-badd-92fd55d8f38d@amd.com>
 <55687bb5-7e8a-4d7d-a597-6f97087cab32@siemens.com>
 <5e919998-338c-4055-b58a-e4586134956c@amd.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 xsFNBGZY+hkBEACkdtFD81AUVtTVX+UEiUFs7ZQPQsdFpzVmr6R3D059f+lzr4Mlg6KKAcNZ
 uNUqthIkgLGWzKugodvkcCK8Wbyw+1vxcl4Lw56WezLsOTfu7oi7Z0vp1XkrLcM0tofTbClW
 xMA964mgUlBT2m/J/ybZd945D0wU57k/smGzDAxkpJgHBrYE/iJWcu46jkGZaLjK4xcMoBWB
 I6hW9Njxx3Ek0fpLO3876bszc8KjcHOulKreK+ezyJ01Hvbx85s68XWN6N2ulLGtk7E/sXlb
 79hylHy5QuU9mZdsRjjRGJb0H9Buzfuz0XrcwOTMJq7e7fbN0QakjivAXsmXim+s5dlKlZjr
 L3ILWte4ah7cGgqc06nFb5jOhnGnZwnKJlpuod3pc/BFaFGtVHvyoRgxJ9tmDZnjzMfu8YrA
 +MVv6muwbHnEAeh/f8e9O+oeouqTBzgcaWTq81IyS56/UD6U5GHet9Pz1MB15nnzVcyZXIoC
 roIhgCUkcl+5m2Z9G56bkiUcFq0IcACzjcRPWvwA09ZbRHXAK/ao/+vPAIMnU6OTx3ejsbHn
 oh6VpHD3tucIt+xA4/l3LlkZMt5FZjFdkZUuAVU6kBAwElNBCYcrrLYZBRkSGPGDGYZmXAW/
 VkNUVTJkRg6MGIeqZmpeoaV2xaIGHBSTDX8+b0c0hT/Bgzjv8QARAQABzSNKYW4gS2lzemth
 IDxqYW4ua2lzemthQHNpZW1lbnMuY29tPsLBlAQTAQoAPhYhBABMZH11cs99cr20+2mdhQqf
 QXvYBQJmWPvXAhsDBQkFo5qABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEGmdhQqfQXvY
 zPAP/jGiVJ2VgPcRWt2P8FbByfrJJAPCsos+SZpncRi7tl9yTEpS+t57h7myEKPdB3L+kxzg
 K3dt1UhYp4FeIHA3jpJYaFvD7kNZJZ1cU55QXrJI3xu/xfB6VhCs+VAUlt7XhOsOmTQqCpH7
 pRcZ5juxZCOxXG2fTQTQo0gfF5+PQwQYUp0NdTbVox5PTx5RK3KfPqmAJsBKdwEaIkuY9FbM
 9lGg8XBNzD2R/13cCd4hRrZDtyegrtocpBAruVqOZhsMb/h7Wd0TGoJ/zJr3w3WnDM08c+RA
 5LHMbiA29MXq1KxlnsYDfWB8ts3HIJ3ROBvagA20mbOm26ddeFjLdGcBTrzbHbzCReEtN++s
 gZneKsYiueFDTxXjUOJgp8JDdVPM+++axSMo2js8TwVefTfCYt0oWMEqlQqSqgQwIuzpRO6I
 ik7HAFq8fssy2cY8Imofbj77uKz0BNZC/1nGG1OI9cU2jHrqsn1i95KaS6fPu4EN6XP/Gi/O
 0DxND+HEyzVqhUJkvXUhTsOzgzWAvW9BlkKRiVizKM6PLsVm/XmeapGs4ir/U8OzKI+SM3R8
 VMW8eovWgXNUQ9F2vS1dHO8eRn2UqDKBZSo+qCRWLRtsqNzmU4N0zuGqZSaDCvkMwF6kIRkD
 ZkDjjYQtoftPGchLBTUzeUa2gfOr1T4xSQUHhPL8zsFNBGZY+hkBEADb5quW4M0eaWPIjqY6
 aC/vHCmpELmS/HMa5zlA0dWlxCPEjkchN8W4PB+NMOXFEJuKLLFs6+s5/KlNok/kGKg4fITf
 Vcd+BQd/YRks3qFifckU+kxoXpTc2bksTtLuiPkcyFmjBph/BGms35mvOA0OaEO6fQbauiHa
 QnYrgUQM+YD4uFoQOLnWTPmBjccoPuiJDafzLxwj4r+JH4fA/4zzDa5OFbfVq3ieYGqiBrtj
 tBFv5epVvGK1zoQ+Rc+h5+dCWPwC2i3cXTUVf0woepF8mUXFcNhY+Eh8vvh1lxfD35z2CJeY
 txMcA44Lp06kArpWDjGJddd+OTmUkFWeYtAdaCpj/GItuJcQZkaaTeiHqPPrbvXM361rtvaw
 XFUzUlvoW1Sb7/SeE/BtWoxkeZOgsqouXPTjlFLapvLu5g9MPNimjkYqukASq/+e8MMKP+EE
 v3BAFVFGvNE3UlNRh+ppBqBUZiqkzg4q2hfeTjnivgChzXlvfTx9M6BJmuDnYAho4BA6vRh4
 Dr7LYTLIwGjguIuuQcP2ENN+l32nidy154zCEp5/Rv4K8SYdVegrQ7rWiULgDz9VQWo2zAjo
 TgFKg3AE3ujDy4V2VndtkMRYpwwuilCDQ+Bpb5ixfbFyZ4oVGs6F3jhtWN5Uu43FhHSCqUv8
 FCzl44AyGulVYU7hTQARAQABwsF8BBgBCgAmFiEEAExkfXVyz31yvbT7aZ2FCp9Be9gFAmZY
 +hkCGwwFCQWjmoAACgkQaZ2FCp9Be9hN3g/8CdNqlOfBZGCFNZ8Kf4tpRpeN3TGmekGRpohU
 bBMvHYiWW8SvmCgEuBokS+Lx3pyPJQCYZDXLCq47gsLdnhVcQ2ZKNCrr9yhrj6kHxe1Sqv1S
 MhxD8dBqW6CFe/mbiK9wEMDIqys7L0Xy/lgCFxZswlBW3eU2Zacdo0fDzLiJm9I0C9iPZzkJ
 gITjoqsiIi/5c3eCY2s2OENL9VPXiH1GPQfHZ23ouiMf+ojVZ7kycLjz+nFr5A14w/B7uHjz
 uL6tnA+AtGCredDne66LSK3HD0vC7569sZ/j8kGKjlUtC+zm0j03iPI6gi8YeCn9b4F8sLpB
 lBdlqo9BB+uqoM6F8zMfIfDsqjB0r/q7WeJaI8NKfFwNOGPuo93N+WUyBi2yYCXMOgBUifm0
 T6Hbf3SHQpbA56wcKPWJqAC2iFaxNDowcJij9LtEqOlToCMtDBekDwchRvqrWN1mDXLg+av8
 qH4kDzsqKX8zzTzfAWFxrkXA/kFpR3JsMzNmvextkN2kOLCCHkym0zz5Y3vxaYtbXG2wTrqJ
 8WpkWIE8STUhQa9AkezgucXN7r6uSrzW8IQXxBInZwFIyBgM0f/fzyNqzThFT15QMrYUqhhW
 ZffO4PeNJOUYfXdH13A6rbU0y6xE7Okuoa01EqNi9yqyLA8gPgg/DhOpGtK8KokCsdYsTbk=
In-Reply-To: <5e919998-338c-4055-b58a-e4586134956c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:208:160::37) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|PR3PR10MB4030:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a654b5e-4727-4e22-2845-08dd7c0744c3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHRMSkdYbTZ3RXM1UEJCRUpMcXZFcG50YVpaRWljbUdXL2o5L1YrUlQrN1ZQ?=
 =?utf-8?B?MkdQa2p5aGRldm8yTjh2ZXdnbDF2dk9kMDZhcEVoZ0h4VDVLTXZRNVo1NHNJ?=
 =?utf-8?B?ZjJQRmQ0RkVGMDB6K0lmc1FrREkwc3huMytpNnFBQTJKcXhaYTFZZzhSTTlP?=
 =?utf-8?B?TG5BbGNqWUFpTzUzNkMzZHZoUW5BdVBZOVVjb280dGVaWDluY1VtYkZ6QkVw?=
 =?utf-8?B?Z0tlWTRsQ0NYQUluR3c4cFZib1lIWWhhdHN3Tng1K2hyWHFlSVErRVEwN2NL?=
 =?utf-8?B?ZTFuZjEvY3J4Z1pEdVRSUzJZSnNWZUJDTUZMWmVQcHppRlRnb2dJa3RXeSt6?=
 =?utf-8?B?VWxiVW1YbzdOTXZFQTJ3OFZOYUdHOTJkb2hoZ3FpS1BKVDVta1Nma2p5T2pk?=
 =?utf-8?B?MmNlYmZKZUw5YjNKYTNEQ3dxdWhBNUJ2RjdIUStleGxENURDcDBRb0VoZk4z?=
 =?utf-8?B?MWMzRHdQWFpsNGthUzZSTThab3hCaGNPMzhvWjlsNllwZTdjeEFLMGFrYUFx?=
 =?utf-8?B?Um82VzFpOC8yam5USkJTSWNPd1IwcVcwMGVQeDJzMk9JRTNDQ2RvdnpMemJX?=
 =?utf-8?B?bjZnaWpZTHhNa1N3UmV3bzJYZXgzSzhBbkI2V3QvRTdMZ3VpOFUreE9GTC9R?=
 =?utf-8?B?UlNZZVdXWHdhM2JSamlmMjZod2dGcVovZHVrY3VVKytIZytNdFExaUUwbjE3?=
 =?utf-8?B?b1B4STRiUlQyazFYMWNSdklORUgxVFBiR2xUbklxaXU1SmYvWmZCKy9Hc3Fh?=
 =?utf-8?B?MFZIWnpsOWE0dmhsQlFEdzBXNGI0YURDVXRGNFQ4QkZLQ3kydlRqNHYzeDZW?=
 =?utf-8?B?b0c4dFFTUEF0SXdXRUF0UWlZb1hIcXRSWnVkcmw0MUdIdC9kYXFNejY0WmRS?=
 =?utf-8?B?ZGdzV2JtUDdWUzkzODZKTmovM0NXdnlRTklpd2dFODdJalR4bERlSHFZWmdB?=
 =?utf-8?B?Z1RReUFKQ1FsZXVvM0c0Nm10U0JFNU9UTk5tY21ERVNTdk82RDJBQ1NkaHlq?=
 =?utf-8?B?K1pscDNuVDRaMWROQkI3a2xCNlRKNDZySlpPQjl1eWN6WVRFbkdMcGt1QnUw?=
 =?utf-8?B?OW91UVF0eHlZNUNkbXFROVhsM2hmZlpEbGwzMEVCdlBaYmdyd1QzaXV6ODds?=
 =?utf-8?B?OTU0c0lQUzRtZUU4Q3Z4R0JVRnBFNndEQVFGaU11OU94Sk1ydnFkcWlFL3pN?=
 =?utf-8?B?WUYxOVU5Q0l1T3dmQVE4SklKQkRlZXZibW5UMS9senJNY2FGYm5uSmR0ZTQy?=
 =?utf-8?B?R0hPL1V6cnJjRHJZbi9ERTFLOVV0ZkdFbWpYMm5MbXRpbzh0bTdRZ2VVeDhV?=
 =?utf-8?B?d0dvNjIwYUFRbnQvejk4M0toR1NIMEI2NWRobkFVbklIMEtDcllJSDdaTjd3?=
 =?utf-8?B?RlNZaytFWVBDczVjNGxqbkVTQ2V1Z2NhQm9LSGZPTzJiMUlhbDdkU2crQlVU?=
 =?utf-8?B?cXhmaGpYMnAzT3U1RWRsdmRUNzkwNzBxbzBCaFljT2x5M2xEaVc2dHZvam9x?=
 =?utf-8?B?VldZR3RCeitrcDg2Uk9uSWREcmMrNGZVd0hHTDBCM3UvV2JmL3BIZVZYa05i?=
 =?utf-8?B?UmkwSy8rVVRONDdBVkdDcmVPektpNnpRS1ZWMllWQml3UDFOV1BxVDRhWnhs?=
 =?utf-8?B?ZE9uRHU3RWpJYmdGMjk0Sm1uMmVtNTQxSUlEc3U4a3JQZ1pOVFFwb0F0eGtF?=
 =?utf-8?B?eGd5WEhTYmZROUNKcXJ0VnRKdUtYL3JSeXF2Zk4vRFUzcmdiYzFqTmMxNk1h?=
 =?utf-8?B?K0Z6RDVRWVg0UmtEMk9ib0tDS3NJREh4WFFBcjdoSkVXOENITVB4VkRFb0pP?=
 =?utf-8?B?TmNHN3Y4VUh1bjM0VEQ2dXZ3SmhrVE1za1Y1V2RJSS9IMjNWaFVCWmk2bzA1?=
 =?utf-8?B?THg0Nkw5dGdISzZndnNCUXRteTZjOWNydFY4d3JPS1RZWGI3R0pKalJ1MW0w?=
 =?utf-8?Q?aw+yFDuFZ4E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3Vac3FzSFNSRG5reDBPYjdCbjhlcXZhWlBjWEZGSVhYU25WUkR5aStjYnow?=
 =?utf-8?B?bjk4V0J5UU4yU3hqRlJ0UUNTUDYrRCt5TzBoNlpnSytSY2Jmb2hydVo3VFk3?=
 =?utf-8?B?VFlxT0tGSGh2bXFhcjBYKytQaFhQOEZYNllDcWFqRndZTHJuRG5vQzJoRG1t?=
 =?utf-8?B?ZktoWEZ3MkJDVFZKdSt0Q3BQbTlVaVdSZUlFbzNUekZUZGRzNW8vY0NPY1JP?=
 =?utf-8?B?YU1XRGJVdWh0MUliY1dCV2dLT3JGa2RodEk5eFN2Ulh3aGdrc3ZTLzEwN3RV?=
 =?utf-8?B?RS9DUVhzcklGNFVJWjllM0EzVFlhVVNzRC9nM0xrMzFpMVhuU0k4cnJxN0RE?=
 =?utf-8?B?QitOQ2sxNnJMeE4ybDFMNDU0M0gySTAwdHlYOEtyT3EyVnp5d2FjbEtocm1O?=
 =?utf-8?B?KzNrSlBSeXE4NHZQbFNNKzlSak56K1N0VkZsVCtpQWNJVklEeDhlSGVxRUJj?=
 =?utf-8?B?c3VIZ1RtMUx2NHRWamk4U1RWMndySEloL1gwTFlsTHRUb1N6dUVBQ2ZPbWly?=
 =?utf-8?B?S0dpc2dpSUh2dnFHdVpaQ1ZOYmkzT2ZValRCMjlJbnRyUzJEZ3oxeHFGRjAx?=
 =?utf-8?B?OTJzWWVkUXErQnJYNGRPa09QSkdxcGJtU1JDL1BvSzlNekFEZXVGRzY5MkM5?=
 =?utf-8?B?MDNuUW1yalRKUFhUVXB3dDU3cE5WbmlZUlJ0N3hEQXgxb0MxWW1VR3JmeTZy?=
 =?utf-8?B?SHFHNVdTMmpPS2RES1l6ZWlrM1VpNVdYY3FUQ3JlUXc2eHM4OXM4UWdpbExj?=
 =?utf-8?B?ZE0vdHJjTW0rQWZsUkVkUWFraTZXeEhGTUFJMWpKQkY4UlVuV3R2SlFWSmFz?=
 =?utf-8?B?YzFuN0lrdkljazdaZkZPamVkUTVBQk1pQnJIUmxpbnVVV2Rhemp2K1V4MmdD?=
 =?utf-8?B?VEQxRm9IV05nL0poY2lSMkpvQ0lzSnhuZFJyQ3dUUUVTb3ZhMTNxY0RqVDE3?=
 =?utf-8?B?WlZzb0RFRmg5NzVxaVp4QTR6SElBdlA3QnBPY1N0SG5GM3ZIMEdaakRWKzNz?=
 =?utf-8?B?eFJOZXREUHErU1VBT2xxNzFBb1BaQUZtZ1Q0ZTF1bTJNc2wxNWpNQUNtWms5?=
 =?utf-8?B?V3RiYVhUWXZkT1BxR0ZzdG9YbjIwWDhCWGk1L3BLNUlod0FNTUtENFo0SmJW?=
 =?utf-8?B?ckV3cDQ1Mjl5aGttd3pQNVJ5M25OTWRndXlSam1pQTg3WWYrVWV4WXNwQyt5?=
 =?utf-8?B?R2VzSS92QS94dlRSeUs1Y3Mvb2JoeU1tWlAvb0dlWGlmY0ttTjhhNEJQcGNT?=
 =?utf-8?B?aFRBM1duMHVmV3EyRVkzdHFocVk5TWxrckluaktQdGxCclgvVi9VNTAzdFY4?=
 =?utf-8?B?Nk9xY3JvQ2FXSFN2N3BwbjRmTkZIK2VodkhrNDFRMHd6RWZwaXZFQmRJV01G?=
 =?utf-8?B?Wk4yT21uSm53MEpoM1MzZitGL21JYXFrOE1iR0RzaElwUnNQazJRNERUMkVD?=
 =?utf-8?B?TExYNG5ySkF4eENhTXV4dXFNVDBjVm9NbnhqTUFVaEQzaXNxUmVKZ1B2Uzg3?=
 =?utf-8?B?Y2ZqTVNXdExHOGhDSERXaE0zdTVCWXVoZkdma2oycGwveXBhbjV1aHJ4cU9T?=
 =?utf-8?B?OG5VK3U4T3BtYlNFQ0pMMHg4bVRhWEd2VzBkNDFpZmx5ZEdHWGd6Sy9VeEpY?=
 =?utf-8?B?K1NhbWVBMU03QmthY09TZVZkK3pVNGhnY2h5NllkaFFFQ0ZHbk95OHpoTTJB?=
 =?utf-8?B?RW0vUDdXby80bXVPVjBXRVZldlhoUWNWNzNGSUpCa2N0ZzM4R05DaGREd1p3?=
 =?utf-8?B?TFBiQk5JdEhiakRzYTZQZjFQY2lxQ080WENFaTJTYnZMNm1OMkdIc0IwYXFq?=
 =?utf-8?B?VFh4SzVtR0QvYUN5Rng0Q3lvd1M4TS9sRTZsS0VkNFlSTGlLRmtqWldzSmVY?=
 =?utf-8?B?Rm45ZE5EWUVLY1NkaHdKd2VQcXZ6U1htci96dnlRNGpkOE1ZQWw1U0RrWGxu?=
 =?utf-8?B?SjF1YTJLRVZqbC9BNnU4ckF3b0czZE9Sd3FoZFNWOFBOUDJIOGlJdk84Tm8r?=
 =?utf-8?B?L2ErRUNEMmtKY0J0NG4vWU9VSDUraWJkUGVLcmNZZFJKaC9RL244VmhiRW9P?=
 =?utf-8?B?MmFZS1V5aVArd2M0SHNST21xQk5ENWtPbkdoS3dvM284YU14M0RYaTVsMTNO?=
 =?utf-8?Q?3TDcMh2r1rCOAsJLPTbyXt5dM?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a654b5e-4727-4e22-2845-08dd7c0744c3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 10:21:21.8414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mPvi04IpE3FxCIQZffizRv3lkj78DpmEMs3C4+x7WnKN1JOnY/ueDVelRIdsiJmuwCLj9ufIYJErS5YguyTeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4030

On 15.04.25 10:45, K Prateek Nayak wrote:
> (+ Sebastian)
> 
> Hello Jan,
> 
> On 4/15/2025 11:39 AM, Jan Kiszka wrote:
>>>> Attached the bits with which we succeeded, sometimes. Setup: Debian 12,
>>>> RT kernel, 2-4 cores VM, 1-5 instances of the test, 2 min - 2 h
>>>> patience. As we have to succeed with at least 3 race conditions in a
>>>> row, that is still not bad... But maybe someone has an idea how to
>>>> increase probabilities further.
>>>
>>> Looking at run.sh, there are only fair tasks with one of them being run
>>> with cfs bandwidth constraints. Are you saying something goes wrong on
>>> PREEMPT_RT as a result of using bandwidth control on fair tasks?
>>
>> Yes, exactly. Also our in-field workload that triggers (most likely)
>> this issue is not using RT tasks itself. Only kernel threads are RT here.
>>
>>>
>>> What exactly is the symptom you are observing? Does one of the assert()
>>> trip during the run? Do you see a stall logged on dmesg? Can you provide
>>> more information on what to expect in this 2min - 2hr window?
>>
>> I've just lost my traces from yesterday ("you have 0 minutes to find a
>> power adapter"), but I got nice RCU stall warnings in the VM, including
>> backtraces from the involved tasks (minus the read-lock holder IIRC).
>> Maybe Florian can drop one of his dumps.
> 
> So I ran your reproducer on a 2vCPU VM running v6.15-rc1 PREEMPT_RT
> and I saw:
> 
>     rcu: INFO: rcu_preempt self-detected stall on CPU
>     rcu:     0-...!: (15000 ticks this GP) idle=8a74/0/0x1 softirq=0/0
> fqs=0
>     rcu:     (t=15001 jiffies g=12713 q=24 ncpus=2)
>     rcu: rcu_preempt kthread timer wakeup didn't happen for 15000
> jiffies! g12713 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
>     rcu:     Possible timer handling issue on cpu=0 timer-softirq=17688
>     rcu: rcu_preempt kthread starved for 15001 jiffies! g12713 f0x0
> RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=0
>     rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is
> now expected behavior.
>     rcu: RCU grace-period kthread stack dump:
>     task:rcu_preempt     state:I stack:0     pid:17    tgid:17   
> ppid:2      task_flags:0x208040 flags:0x00004000
>     Call Trace:
>      <TASK>
>      __schedule+0x401/0x15a0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? lock_timer_base+0x77/0xb0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx_rcu_gp_kthread+0x10/0x10
>      schedule+0x27/0xd0
>      schedule_timeout+0x76/0x100
>      ? __pfx_process_timeout+0x10/0x10
>      rcu_gp_fqs_loop+0x10a/0x4b0
>      rcu_gp_kthread+0xd3/0x160
>      kthread+0xff/0x210
>      ? rt_spin_lock+0x3c/0xc0
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork+0x34/0x50
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork_asm+0x1a/0x30
>      </TASK>
>     CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-rc1-test-
> dirty #746 PREEMPT_{RT,(full)}
>     Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
>     RIP: 0010:pv_native_safe_halt+0xf/0x20
>     Code: 22 df e9 1f 08 e5 fe 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90
> 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d 85 96 15 00 fb f4 <e9> f7
> 07 e5 fe 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90
>     RSP: 0018:ffffffff95803e50 EFLAGS: 00000216
>     RAX: ffff8e2d61534000 RBX: 0000000000000000 RCX: 0000000000000000
>     RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000081f8a6c
>     RBP: ffffffff9581d280 R08: 0000000000000000 R09: ffff8e2cf7d32301
>     R10: ffff8e2be11ae5c8 R11: 0000000000000001 R12: 0000000000000000
>     R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000147b0
>     FS:  0000000000000000(0000) GS:ffff8e2d61534000(0000)
> knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 000055e77c3a5128 CR3: 000000010ff78003 CR4: 0000000000770ef0
>     PKRU: 55555554
>     Call Trace:
>      <TASK>
>      default_idle+0x9/0x20
>      default_idle_call+0x30/0x100
>      do_idle+0x20f/0x250
>      ? do_idle+0xb/0x250
>      cpu_startup_entry+0x29/0x30
>      rest_init+0xde/0x100
>      start_kernel+0x733/0xb20
>      ? copy_bootdata+0x9/0xb0
>      x86_64_start_reservations+0x18/0x30
>      x86_64_start_kernel+0xba/0x110
>      common_startup_64+0x13e/0x141
>      </TASK>
> 
> Is this in line with what you are seeing?
> 

Yes, and if you wait a bit longer for the second reporting round, you
should get more task backtraces as well.

Jan

-- 
Siemens AG, Foundational Technologies
Linux Expert Center
