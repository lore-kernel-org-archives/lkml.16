Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020117.outbound.protection.outlook.com [52.101.84.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEB6288C0B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215826; cv=fail; b=FykwgNFKU6hczE/WpvE74RWFQvSWBtXgD3jxd6ZS1CSJsVmN8+zXmD9mJWuKcmtGpPAz8AHOy9QmXMVlf6lowJfUW2wlr/GQj7gWLfiUQ6nzZ0ScQ0uNwqlgJthO6O7AQBpnv1EQ91b6hvKV2vo24L76+CO9HAdXVCGYlyvvZaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215826; c=relaxed/simple;
	bh=XdfvOIs5+WlmXw83xKb0rDejCHr69Hz+aMCFb1RLkbE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hSRoLiiXL6pV7zx9srkpfv0ZgaeSojm2AAPyFK/gWsDSnhm//q692L8oHQdMagIAu0frtDlUh3RCsvm6EGefkFrnsYLMjQ/R/yppyyxNzpnjNcDNtn6JCvfHGUewR3vbkr7fZUpOT4YrcfqDnhedbv3J91QWSK44udoYhIV9DxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=Dv535wNa; arc=fail smtp.client-ip=52.101.84.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="Dv535wNa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsyXYX1iQswpIHvbKFj4QUTJJLGfp9auj1nGR8CgUVYHg2n6FY+w8egOYe+BWDZlqsNxBK5SLPvphOALbvkTJy+QeiGElXnf7H2VYN5XDeCmmvGfzAKmWmSxvYUixNYUXQOrqJXHAG50gNXIFHl/MS7k/5hI/UV/HkrG5Gu1P50FyIhUQNQ7BYgRrA8q4v3SG0BJfXrfCzaW6yzN43Q/vHnAJdYkMARgOIssNgHh08WoI92dmnAmF8qTjdE+I6Pjw3y3gVJhLZ1dqJdNcv8FqhU0fR4DPKm7LdfnrreZKqDY0b7YGp8Ozz7uhZVxFjqXQ9Svu1YwOepcCeU5xkuo7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6mW5RAxU7SbrACRpWC0pqJ5YOJpCz1n5CmeGBI8Elc=;
 b=LZgNEplTgbOlM8oRwJyJbs+6XJAUnYuTRNga/EFbo+74TE3n5LrYDrtuttO6GroeqnsZHxDlumi4GpSLuogkKmVa6UEP9/mzH65wLdvNDfBktPN4t9qDLFg93/kFvwDvIV+XrzXzCFErEM9LxZWiO+n82b8CHu1HPEeWBtbREUlbM5wQ6qz42+e3bqOSVXUqFHY5896lBvqkzuMchwH02RXP4Xk3r8T8hqdjxdX/VsxiGM0yADxxynxQ04rCDFfQuOtkJQnOqN2WjQjyafrNinFXtPN6pIRLCbZPr3iDZSFOjKIG88r3Y4zr3XjMpx5CqeQncLt6chnjHvEqtFklmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6mW5RAxU7SbrACRpWC0pqJ5YOJpCz1n5CmeGBI8Elc=;
 b=Dv535wNaFOAqYhICKc2eELr4dxgzDtxVa5UqBbUKXqF/rGuEyqyiGs0YEwIpTj4P/p04HpABUiP/A6G6WeHedb6Ff3q5Qhqb2Zge6Zs7VTkGaIx83TkPlKpsSaX3Mv4/7fKvK/gFXlb7RvZmRosaoWmcEanVp4VgAFQ6+RdkcTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com (2603:10a6:102:32e::7)
 by VI0PR03MB10283.eurprd03.prod.outlook.com (2603:10a6:800:1b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 13:16:57 +0000
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235]) by PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235%6]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 13:16:57 +0000
Date: Fri, 6 Jun 2025 15:16:52 +0200
From: luca abeni <luca.abeni@santannapisa.it>
To: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Vineeth
 Pillai	 <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <20250606151652.1c9e9988@nowhere>
In-Reply-To: <84b4ab9d1402e4308bf4738e2c53203975ab855a.camel@codethink.co.uk>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
	<aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
	<f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
	<20250507222549.183e0b4a@nowhere>
	<92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
	<20250523214603.043833e3@nowhere>
	<c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
	<20250530112108.63a24cde@luca64>
	<84b4ab9d1402e4308bf4738e2c53203975ab855a.camel@codethink.co.uk>
Organization: Scuola Superiore Sant'Anna
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MR1P264CA0195.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::7) To PAVPR03MB8969.eurprd03.prod.outlook.com
 (2603:10a6:102:32e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8969:EE_|VI0PR03MB10283:EE_
X-MS-Office365-Filtering-Correlation-Id: 503ff8d5-2402-47f7-e582-08dda4fc69e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGN6cDJLeG5ya0RiVDhrVk9vWmtyYnJGVkZ2UkpDOW16VlFnTmcvY1dXSlNY?=
 =?utf-8?B?cGpGbWJhVUQ4WnFIb2YvNjlmWkV3VCszK3FpY3lWekVFcHpBWlYwOWx0WS95?=
 =?utf-8?B?V0ZsUkFUQ1JPeFh0MUx2RU85SEpNQTJ2TzEzcnBXZEUzc2xNRzJjOG9JVTUy?=
 =?utf-8?B?c29GRjNsNXFRUkNPWFFXQVRoY0VpeWlicmhrVnUzTGlaZUREV3pHaGN4alZi?=
 =?utf-8?B?aHdBMC8yd0F5dWVEbnZDYWFPVEROMmQ0ZWpGMTNWMG5YdnBQczZlTkljVlVS?=
 =?utf-8?B?S3Z5QWF0aWY0ei9RYjg0ZHJwaWl3cjlCZStpaEgyV0xyYXFyenZLTXpSVTNs?=
 =?utf-8?B?bS9qWk94SURzZnlFQnY2b2lQVUJXVUpoVHVaaTJFYS90RXUza0dDUXRHOW5E?=
 =?utf-8?B?KzUvd1ZEMWNFMzhkTEhRQnI2Unlmb0pUR1A1MFg0Y1FaQmZLM0E0YmpHVUl3?=
 =?utf-8?B?T0MxdzZpakRpZFp3ZzhXYWhCdFovc0NrUkJMOHBtbmhyNTFPbThmbmlNZmNY?=
 =?utf-8?B?U29xRDFaZmNSblNSYkYraGwzYm0rYVo1ZzdEUGgySmc1azdWN2hSVFJpV2FG?=
 =?utf-8?B?WlZNUDhSeFU1aHdJVSswdVJYK0JmZFFkbWpOQ1pJWWpRVHM3VE05OHQ3OE9m?=
 =?utf-8?B?SVllam5NK21OaW1JaW5jU0xrWUM5S09xa0UwOTZuaDdrcXEyVWdwcmpCUUUz?=
 =?utf-8?B?dC8rYWhwMjJWd3dMWm5STmRjemdrSGpUOFNzblRabmZndFJxUXk3R21Ub1VR?=
 =?utf-8?B?bjlSSGUzeW1FN0xmSDdJT1RFY0xtY25Ya3ZZbWsxVkdMdDRXY3VOMENzMTBS?=
 =?utf-8?B?c2JOV3hsLzJlMVdtTGtuYW43VzFkNGdzM21vOFdPUWYyeWl5SUJOU2lGQ3FE?=
 =?utf-8?B?aHNKUGhXbENycTh6L2lPV2lsWWJjYmhuQ2V0ZEx4dDZzMU9MajhDRFpzenQ5?=
 =?utf-8?B?VERRQWwrU1djajZCanVhUDdUdEovSGMrYWRYV1RMdjVQSG1SdS9xMEUyQkFx?=
 =?utf-8?B?UUZnQjJBNmd1dDBZQWVLc2t2SDhyUWtNOWkyczJ0VUZTSzBlL0lVMXQ3V1lw?=
 =?utf-8?B?dGtiaHJxY0s4ZTBGaTlMQTBheHA4UEtJV3NvV0gyanU2K2xNTnNpQ3JYV1ZZ?=
 =?utf-8?B?RDl3aGNQMDZ6UGFaOVJRWTNod2t1bjFqWUhYa0lVL3BXNG1YQTM4WGdMZ3lB?=
 =?utf-8?B?ME5WendrbzkvQ1QvbXcwcGpUdGZiOWd2TkR0UEdZUGZwWll0bm5rYVBpaUk4?=
 =?utf-8?B?TTMrWVZ0VklqYnBZNGwrNWxHZ0kxUXN6S0syZEs0VVk2RlFQRmY0SUN0N05K?=
 =?utf-8?B?bm1rbEZnUlRORXdqa0ZxVnhSOUFvWXhHT0Vlc2dnNkRFazZxeWdGRWduUFBD?=
 =?utf-8?B?STBWSktzVnI5SDI4SHBMbkp1N1dFdllUN0M3TVgxc0I2bG5KUUVYOWpmTGNL?=
 =?utf-8?B?NjNOSHFaNmx6aXl3dU1KWDgrNWJXMm56V2U5RnRyUU1Qb3dwRWNnMTl3L0w0?=
 =?utf-8?B?anR0YUlQeXRrWVd3dDFQRHVHVnVuNDN4aXBHRklSd0h2dGwzWjYwR0drVmQy?=
 =?utf-8?B?WkIrVFhXV1o0dlRrYnloMGVkR1MwcE5PWXRKM2ttdWVwdXBCbkZTRFlIaXpa?=
 =?utf-8?B?bEprNExJblFBUXNTeVBpUjRzdWtPV2FZa2JaandtTzRRYlFKSUZuaGhKZGha?=
 =?utf-8?B?UE1ZYmVzS1NSSEhEb0RlZFV5Mlg3VnJ5UStYUnRLZ0pMaThuQUZpWk90VzBz?=
 =?utf-8?B?RGE2bEN2VGs2U3BScGtWVjNaUStxMTc1aEV0Q0JycTFIczFXTTRvOXlmRzc5?=
 =?utf-8?B?SE1JSlBtR0VUaFZMR0xTRmNlUmZNMUxIZzZsS3BQN0FVejl2TDJERjNRU2Rv?=
 =?utf-8?B?RnFrMlg2NkJPcE43bTFOdWc2TkloUmZtU1F5OE1pOFZzZnVNRjdIdDdrRmRl?=
 =?utf-8?Q?lO8H5pbDvqI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8969.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEFaZHlJdmkyNjlUK29yVXNkdGJJN3ZmUytzcWFURVMvb3JDK0ZBaU1OZDc1?=
 =?utf-8?B?N3haVjZERDlWdWdFR0M4eFdNUnRuemFxQldLSXpuY3NGSnFMSjZzbnNDNjNz?=
 =?utf-8?B?WUVrZ0NvVGVuZ3U3OWc1M2tEdWpKOXQrUkUvSTBNdWF6aG9HNUd6a25Oc2pi?=
 =?utf-8?B?T0dGczRyVDN2cHJjaEU3MWRPNGdBd3J1VDJneUQ2a04zYi9WYWJ3VmN3NW9t?=
 =?utf-8?B?eHVDdEw0SFY0NFRHcU5nSDNBMFJPaVRrZFlpQm4vK0NLMlhOTjNuY2Vnc1lT?=
 =?utf-8?B?eXdSbWQwa1NCM1RCOE1UYTloZXBvUUZhblVXbzJiYk1OMmllWFl0N2FyZ0h5?=
 =?utf-8?B?ZlJOd2thMGtRemMxcmZlZ3lLSTdycW9ySGlRMG84WU4wdWF2NE9BZEZDU2VQ?=
 =?utf-8?B?NWE0WlVXelUzU3lISEk1NWhUNHdmQXowdkQ5cllaMnBmRWxOVmduc2JzbDBq?=
 =?utf-8?B?bmlWenFVWEdwSUt6d3FVakRxMm84MFFTcEZtMnovU3dnenNRQWRySVpCRXFu?=
 =?utf-8?B?WmhQU1JhQlBON1hVWTFqTE1NSjVzNnFFaU9vY1JDR3pQTDd2d2JFc0w5Rzhp?=
 =?utf-8?B?d0FWWUxyR2d4RlZOSU9lZDFOajdRY0U3ZHdyek9XVmRNYUdOcmZVRlJFRi80?=
 =?utf-8?B?NWlJSjluZ3Iyb2dPRVZiNk8zbURqVGEzUmVpUTU5K01WcnBKZktPd2l1ZWJM?=
 =?utf-8?B?RU9HWGd1c1R5ZVBWajUxVHVFUmpWc2Z5bmNzcys3c29MeXUzeHF3bUlueFVJ?=
 =?utf-8?B?b1g2RmgvRlc3dE1QNFZxOGs4Ni94bVJpeHQybWd2dFlGUFZOYXQ5WXJxU2gw?=
 =?utf-8?B?WnlWNEtmNVkwa00yaGMxbkc0dXAzODBJWnZTRG5HMVB0N2xaLzMxMEcwenNT?=
 =?utf-8?B?ZFRESUVBaG1FQ2hyVE9UeExadWZVM1dyVC83aG5HQ1JNVzJnVVZZd2NVWEwx?=
 =?utf-8?B?emZHZ3FqY1pkOE4zaE5LYWhsZGEzNVIvaHliVnFlUzFkMytDRFkrUWVOSFRh?=
 =?utf-8?B?YjhGUkErZDBsVmZxaTVjcHlSeG1FTW1OZm1lWjlheXpKU2toeUR5em1NbGxU?=
 =?utf-8?B?Y1JmVG16R2FRQ3RwSnJKaVNYM25yMGwrTTB3QWtaeG43YmRWQ0MxR3AyTUI3?=
 =?utf-8?B?OVlNZXlGeVhZU0VHaXlXR05rTXFzblRjZnZrNTNrVERlTER6dTRtazMzNzFO?=
 =?utf-8?B?TWtSajQ3KzBDWmtyc0tFd1lvSFMxVGJrZjhTcnBQZDl2NDdUdllDUEgvNDF0?=
 =?utf-8?B?SFlKS1hXQUlPRUVjQ21VMDBFWE9yNlg4MjlyZTNodHBabzVVQ3pjMlFzUys5?=
 =?utf-8?B?eXVSamZjYlovSnNrR2wwMGFVTlIrNit5WEIycTJUVE1GTkQ0Q0VWTlI5Nkd2?=
 =?utf-8?B?OEJRV3BNMzBXTlhXWFF5VWZhZHNRMHpnVWhNbjVKSG4vTi9EREtLR1RIMEcz?=
 =?utf-8?B?T2FqWGdoQkJ2aDcwNE9tNTF6UjltR3NxV2N5bXZpZjI2K0FseENlcGlGcVYx?=
 =?utf-8?B?dUJWaVBEeDQvWHc4ZUM0SXpIWlZFdVNrVlUveUFObFBNN2NrWW1ueEVhRW5Q?=
 =?utf-8?B?VENHY1dTZGJtaGZCbG5keUVNSEZpenhTbGRjeHdkNHpSbjJTR2VpRUFqdXEz?=
 =?utf-8?B?T2E1S1htejdpYmVLZkQzaDc5Y0pzTFNMR0NBY3hpVVJLZ3p0WnlWa0Z1K0h3?=
 =?utf-8?B?N1Z5Wk5OMXhnMTE5YjVKbVg0a05RcE1ra3h2YnF1TkZGQmR2YmQ0V3pFTjgz?=
 =?utf-8?B?d1praDJ3ZHVOUUFoS0k4cFZ4UVJBNHBuMSt5RU0rLzM4R0R1SEI5RVZ0cHBw?=
 =?utf-8?B?TWxvNjNZNUM2N096Q0lzUkNZcy9yQk51WFp5V2RrL1ByVkt6SkhwR0VOaVd3?=
 =?utf-8?B?S3NjNmY4R0FBQy93K0FmUExBUTNyWG11TUxNS2JJWWplY2pqaXlwUGo1KzZZ?=
 =?utf-8?B?QzF6diswV2dWaXdsYitDWG8yTVZrMU1jWm4xWUNKbENjaFFrb0d3Y2lFbU1r?=
 =?utf-8?B?WENZeXh3V3cvaEoxY1BjRHZkbzZOdlpsMzZFRnQ1ckNwdXhYdC9SY0NmSyty?=
 =?utf-8?B?NndIdW5LeS9jU0VDOXZmWW16dFBkSXRPQksvT2dGTUp1RnFaWUtSOVNUV0NP?=
 =?utf-8?B?a1Q3WDVFdnNvUGluTjd1SDNmdDhFTnlBNmhwTnNwVkhCcE9CM2F1MlJrUFdl?=
 =?utf-8?B?ZkE9PQ==?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 503ff8d5-2402-47f7-e582-08dda4fc69e9
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8969.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 13:16:57.3408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFGlw6cjC6kcqdzAMcCXq/9Ab2IRnbkq827bAE+KXU9EgL6yGNhmyFPQQZDtV1t4JKlg5ECj3oiMn/jf8b+9y3/7Pri/q24wgtoO84h9bQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10283

Hi Marcel,

I am still having issues in reproducing your setup with cgroup v2
(maybe it depends on the systemd version, I do not know), but I ran
some experiments using cgroup v1... Here are some ideas:
- When using reclaiming, the core load can become very high (reaching
  95%)... This can increase the CPU temperature, and maybe some thermal
  throttling mechanism slows it down to avoid overheating? (this
  happened one time to me when replicating your setup). This would
  explain some missed deadlines
- Related to this... You probably already mentioned it, but which kind
  of CPU are you using? How is frequency scaling configured? (that is:
  which cpufreq governor are you using?)
- Another random idea: is it possible that you enabled reclaiming only
  for some of the SCHED_DEADLINE threads running on a core? (and
  reclaiming is maybe disabled for the thread that is missing
  deadlines?)

Also, can you try lowering the value of
/proc/sys/kernel/sched_rt_runtime_us and check if the problem still
happens?



			Thanks,
				Luca
On Tue, 03 Jun 2025 13:18:23 +0200
Marcel Ziswiler <marcel.ziswiler@codethink.co.uk> wrote:

> Hi Luca
>=20
> Thank you very much!
>=20
> On Fri, 2025-05-30 at 11:21 +0200, luca abeni wrote:
> > Hi Marcel,
> >=20
> > On Sun, 25 May 2025 21:29:05 +0200
> > Marcel Ziswiler <marcel.ziswiler@codethink.co.uk> wrote:
> > [...] =20
> > > > How do you configure systemd? I am having troubles in
> > > > reproducing your AllowedCPUs configuration... This is an
> > > > example of what I am trying: sudo systemctl set-property
> > > > --runtime custom-workload.slice AllowedCPUs=3D1 sudo systemctl
> > > > set-property --runtime init.scope AllowedCPUs=3D0,2,3 sudo
> > > > systemctl set-property --runtime system.slice AllowedCPUs=3D0,2,3
> > > > sudo systemctl set-property --runtime user.slice
> > > > AllowedCPUs=3D0,2,3 and then I try to run a SCHED_DEADLINE
> > > > application with sudo systemd-run --scope -p
> > > > Slice=3Dcustom-workload.slice <application>=C2=A0  =20
> > >=20
> > > We just use a bunch of systemd configuration files as follows:
> > >=20
> > > [root@localhost ~]# cat /lib/systemd/system/monitor.slice
> > > # Copyright (C) 2024 Codethink Limited
> > > # SPDX-License-Identifier: GPL-2.0-only =20
> > [...]
> >=20
> > So, I copied your *.slice files in /lib/systemd/system (and I added
> > them to the "Wants=3D" entry of /lib/systemd/system/slices.target,
> > otherwise the slices are not created), but I am still unable to run
> > SCHED_DEADLINE applications in these slices. =20
>=20
> We just link them there e.g.
>=20
> [root@localhost ~]# ls -l
> /etc/systemd/system/slices.target.wants/safety1.slice lrwxrwxrwx 1
> root root 37 Nov 10  2011
> /etc/systemd/system/slices.target.wants/safety1.slice ->
> /usr/lib/systemd/system/safety1.slice
>=20
> BTW: /lib is just sym-linked to /usr/lib in our setup.
>=20
> > This is due to the fact that the kernel does not create a new root
> > domain for these cpusets (probably because the cpusets' CPUs are not
> > exclusive and the cpuset is not "isolated": for example,
> > /sys/fs/cgroup/safety1.slice/cpuset.cpus.partition is set to
> > "member", not to "isolated"). =20
>=20
> Not sure, but for me it is indeed root e.g.
>=20
> [root@localhost ~]# cat
> /sys/fs/cgroup/safety1.slice/cpuset.cpus.partition root
>=20
> > So, the "cpumask_subset(span, p->cpus_ptr)" in
> > sched_setsched() is still false and the syscall returns -EPERM.
> >=20
> >=20
> > Since I do not know how to obtain an isolated cpuset with cgroup v2
> > and systemd, I tried using the old cgroup v1, as described in the
> > SCHED_DEADLINE documentation. =20
>=20
> I would have thought it should not make any difference whether cgroup
> v1 or v2 is used, but then who knows.
>=20
> > This worked fine, and enabling SCHED_FLAG_RECLAIM actually reduced
> > the number of missed deadlines (I tried with a set of periodic
> > tasks having the same parameters as the ones you described). So, it
> > looks like reclaiming is working correctly (at least, as far as I
> > can see) when using cgroup v1 to configure the CPU partitions...
> > Maybe there is some bug triggered by cgroup v2, =20
>=20
> Could be, but anyway would be good to also update the SCHED_DEADLINE
> documentation to cgroup v2.
>=20
> > or maybe I am misunderstanding your setup. =20
>=20
> No, there should be nothing else special really.
>=20
> > I think the experiment suggested by Juri can help in understanding
> > where the issue can be. =20
>=20
> Yes, I already did all that and hope you guys can get some insights
> from that experiment.
>=20
> And remember, if I can help in any other way just let me know. Thanks!
>=20
> > 			Thanks,
> > 				Luca
> >=20
> >  =20
> > > [Unit]
> > > Description=3DPrioritized slice for the safety monitor.
> > > Before=3Dslices.target
> > >=20
> > > [Slice]
> > > CPUWeight=3D1000
> > > AllowedCPUs=3D0
> > > MemoryAccounting=3Dtrue
> > > MemoryMin=3D10%
> > > ManagedOOMPreference=3Domit
> > >=20
> > > [Install]
> > > WantedBy=3Dslices.target
> > >=20
> > > [root@localhost ~]# cat /lib/systemd/system/safety1.slice
> > > # Copyright (C) 2024 Codethink Limited
> > > # SPDX-License-Identifier: GPL-2.0-only
> > > [Unit]
> > > Description=3DSlice for Safety case processes.
> > > Before=3Dslices.target
> > >=20
> > > [Slice]
> > > CPUWeight=3D1000
> > > AllowedCPUs=3D1
> > > MemoryAccounting=3Dtrue
> > > MemoryMin=3D10%
> > > ManagedOOMPreference=3Domit
> > >=20
> > > [Install]
> > > WantedBy=3Dslices.target
> > >=20
> > > [root@localhost ~]# cat /lib/systemd/system/safety2.slice
> > > # Copyright (C) 2024 Codethink Limited
> > > # SPDX-License-Identifier: GPL-2.0-only
> > > [Unit]
> > > Description=3DSlice for Safety case processes.
> > > Before=3Dslices.target
> > >=20
> > > [Slice]
> > > CPUWeight=3D1000
> > > AllowedCPUs=3D2
> > > MemoryAccounting=3Dtrue
> > > MemoryMin=3D10%
> > > ManagedOOMPreference=3Domit
> > >=20
> > > [Install]
> > > WantedBy=3Dslices.target
> > >=20
> > > [root@localhost ~]# cat /lib/systemd/system/safety3.slice
> > > # Copyright (C) 2024 Codethink Limited
> > > # SPDX-License-Identifier: GPL-2.0-only
> > > [Unit]
> > > Description=3DSlice for Safety case processes.
> > > Before=3Dslices.target
> > >=20
> > > [Slice]
> > > CPUWeight=3D1000
> > > AllowedCPUs=3D3
> > > MemoryAccounting=3Dtrue
> > > MemoryMin=3D10%
> > > ManagedOOMPreference=3Domit
> > >=20
> > > [Install]
> > > WantedBy=3Dslices.target
> > >=20
> > > [root@localhost ~]# cat /lib/systemd/system/system.slice=20
> > > # Copyright (C) 2024 Codethink Limited
> > > # SPDX-License-Identifier: GPL-2.0-only
> > >=20
> > > #
> > > # This slice will control all processes started by systemd by
> > > # default.
> > > #
> > >=20
> > > [Unit]
> > > Description=3DSystem Slice
> > > Documentation=3Dman:systemd.special(7)
> > > Before=3Dslices.target
> > >=20
> > > [Slice]
> > > CPUQuota=3D150%
> > > AllowedCPUs=3D0
> > > MemoryAccounting=3Dtrue
> > > MemoryMax=3D80%
> > > ManagedOOMSwap=3Dkill
> > > ManagedOOMMemoryPressure=3Dkill
> > >=20
> > > [root@localhost ~]# cat /lib/systemd/system/user.slice=20
> > > # Copyright (C) 2024 Codethink Limited
> > > # SPDX-License-Identifier: GPL-2.0-only
> > >=20
> > > #
> > > # This slice will control all processes started by systemd-logind
> > > #
> > >=20
> > > [Unit]
> > > Description=3DUser and Session Slice
> > > Documentation=3Dman:systemd.special(7)
> > > Before=3Dslices.target
> > >=20
> > > [Slice]
> > > CPUQuota=3D25%
> > > AllowedCPUs=3D0
> > > MemoryAccounting=3Dtrue
> > > MemoryMax=3D80%
> > > ManagedOOMSwap=3Dkill
> > > ManagedOOMMemoryPressure=3Dkill
> > >  =20
> > > > However, this does not work because systemd is not creating an
> > > > isolated cpuset... So, the root domain still contains CPUs 0-3,
> > > > and the "custom-workload.slice" cpuset only has CPU 1. Hence,
> > > > the check /*
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * Don't allow tasks with an affinity
> > > > mask smaller than
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * the entire root_domain to become
> > > > SCHED_DEADLINE. We
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * will also fail if there's no
> > > > bandwidth available. */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (!cpumask_subset(span, p->cpus_ptr)
> > > > || rq->rd->dl_bw.bw =3D=3D 0) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retval =3D -EPERM;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto unlock;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > in sched_setsched() fails.
> > > >=20
> > > >=20
> > > > How are you configuring the cpusets?=C2=A0  =20
> > >=20
> > > See above.
> > >  =20
> > > > Also, which kernel version are you using?
> > > > (sorry if you already posted this information in previous emails
> > > > and I am missing something obvious)=C2=A0  =20
> > >=20
> > > Not even sure, whether I explicitly mentioned that other than
> > > that we are always running latest stable.
> > >=20
> > > Two months ago when we last run some extensive tests on this it
> > > was actually v6.13.6.
> > >  =20
> > > > 			Thanks,=C2=A0  =20
> > >=20
> > > Thank you!
> > >  =20
> > > > 				Luca =20
>=20
> Cheers
>=20
> Marcel

