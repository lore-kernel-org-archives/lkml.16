Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7432A2147EE;
	Tue,  1 Apr 2025 17:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527245; cv=fail; b=gTS8VNWl2Qglyd6bjkJIuugCQ/lCc1LuWUeW/6kW0hmm7hio7w/cQL/5SNJc1PgV9/LcmzuZsneVG3K4p9uNeYZhZwtY8JqhTuQYpAmF1LSK4LV4soETYJYAxUBa8f6mx93U8AazySyKBuuPZFSxTu1whhbn7od47cO+DWjYwX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527245; c=relaxed/simple;
	bh=/URvSgrMTPsSmPBnQsLkr4YD2U4RZ67UXoiSrQ+zpdc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BodO25vbBFoI5RZRD+b13JcyJMQefxb9BR2O1yfD0PLUO7UdeX6X67btUKFgqiWLELdi7l/W1AIAXqepzhuvdPclUQHFnLMbmG1peFJLwxhEtznWLKawupGb9j/vLHU7at/i+3UQGDfQ5BOJA4aqdNOQK4PDwk1pUMnQT/dnxJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TNJ8KR1O; arc=fail smtp.client-ip=40.107.220.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TNJ8KR1O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPjxwUbBGA01+dErYj1d6HjXzWaqHuiP7zLhi+ivTbfxHhxC6HafPqTGzvPKChgU7RF6rDNp7DgApQAAjKRUJvOFotYIZr25z7hoS5O+3paqkPHTFBbDtQLdWJEQQEoR0GHgY0YHT1GKdv7hP8/gyWNyjwSBOqVxDmC123fUJkiV0/81/DXo2yRPK/8fAEQk10FSq+XualkuWT3Iy20uNAbTtWBDC1EYB7JxFWQgdvlCHwbWtRr2S1ZLXG4ZqJsMYw4bygdDMRH0Z8C/iqtqUq2Hjp6ime5w6trlCiycp9uBYKeiqKbn652S/GkSXZIF0F8CppIsE39B0GMuEcRvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvoZ4C6d0b5cU1J66WWEyErgcmD5UXdfYaevkdKFCYk=;
 b=JoWal6jaJlVaKDG/LR9n+noukZ9+MGLyPLNm/8CXTiJOSGMZPfJvTpjfIn8abUsrq8TGYQ1K2vD723CEWWwjVzEvNex1h1y8oG3oiUDXMs4whNNlT47noOZB/tfMSuZxfju9olqHidoZIK2c8ZeS54sNb1TZPR+CoJ5G41whuRCMmoAKjp2elsv74uRDq7IIkHacseSCtbrIAB6oP0fAJyn1PIZrUM+wbKE1119WGUszEl91gatJKl1IcCoBrh56kKOG163vivGCebK8r8KOggWl6yDJEgJmiwz1UONcXmWePz+cUW80r6gJDlRM3L4Itddc8hOs2tIHC472zxNSiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvoZ4C6d0b5cU1J66WWEyErgcmD5UXdfYaevkdKFCYk=;
 b=TNJ8KR1OBbFY5GSMOVa95IRSO9Wu+YQTIkoVFCpR7emq3ODlvXhdD9xQ+DBRXWMUurCduZzAD3WJlxpshaHeUOsd6y7MTf7bI47JEBDEfLkryt1C2bD3HPBNqI6li5r+OuaPHHDUObgNPWVXY4S1zQUKBMFXT2e30QKe2drc1clVpxZ6eWh1OtTUObdyBNMbh0syAsxnmqMgCqzynfZ4tuuPvHEfT13hPknXJS6V0Asy3VaICpmwgrqeAolmkC5Vt4Y3HNnoDV5FgrVXAWg75dPBbfCO4jxultyfYrqym92N8XJYtR7QRWedOTtN6ty4pP8aBZbtBysQbzeHiRZX3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 17:07:21 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 17:07:20 +0000
Message-ID: <aeb6ed3a-0b03-403f-a77f-aa1938b576b9@nvidia.com>
Date: Tue, 1 Apr 2025 13:07:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Guangbo Cui <2407018371@qq.com>, Miguel Ojeda <ojeda@kernel.org>,
 a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
 benno.lossin@proton.me, bjorn3_gh@protonmail.mco, boqun.feng@gmail.com,
 boris.brezillon@collabora.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rafael@kernel.org, robh@kernel.org,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu,
 John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>
References: <20250130220529.665896-3-daniel.almeida@collabora.com>
 <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com>
 <67AB9311-3EDC-44A8-9C7C-ABF2ED6B632C@collabora.com>
 <20250401155735.GA804471@joelnvbox> <Z-wX7_gjNH--Opv-@pollux>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <Z-wX7_gjNH--Opv-@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0055.namprd15.prod.outlook.com
 (2603:10b6:208:237::24) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|MN2PR12MB4320:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0bef64-ac5b-4b32-ad94-08dd713fa9f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sk9jeksxVGZldUxCTnpXVDFYVk1rblIySEhrb2NBWEIxcnBKNDdpNlBzbisz?=
 =?utf-8?B?TVBLSmZEd2pxZGkySmZHKzdpdUZQa0NoZ29taGF6akdkUzFYRi9zSHVTbkFX?=
 =?utf-8?B?RHRaNFlyM2U5eDJaYjdDTWdjVUxEanErd24rM1Y2VmZnWVFEL2xTUko4UEpI?=
 =?utf-8?B?TXdGTnp6TUxGUjhDRkpRbTEvb25hRUtnS2ZZOHB1WG9UOEpRQXRyN29aSDRB?=
 =?utf-8?B?eHF6S2ZMMlZ3ckRwUUVwaHFyYVZXUExhVGg3SzAxTFB4Q2R0MVg1akgvaDcx?=
 =?utf-8?B?R1JCcC94NzFER3hSWTlBVkFSd2FYOWdVYzNQdHprQlA5SHdFMm9kS3lBRHhh?=
 =?utf-8?B?SEhDQ3k3MUFmcm01RmNiaFBYd0dwVkdDbFlLb1I2cXZnQWh0MW1qeFpUWnpi?=
 =?utf-8?B?Z0ZENjFDU0JsQTh1TnVyYVhPN21tSEhHNzRhTUkyM2M4dld3Z2V1WW9VMk1J?=
 =?utf-8?B?c2g1WWJtVkc4UzlzenJvWlNXZ1MxZnllUENMc1h6U1M2QXpEamx4L2NQb1Nw?=
 =?utf-8?B?Y0VMSjBWZWptQmQ3dzFaNWdWZnkwQnNmWHpyQW1CcHcvMW5rbFFNK3pkMW8w?=
 =?utf-8?B?L2tDQUYwWkNGZ0lRYU9RTCtTY1BFOHdyTUsvRndRMGUwTFRvQlFObnNPQndu?=
 =?utf-8?B?WVdESWtZTi9Ub1V2K25ZclRWMUZ2aUxBL0dmamV3YXFNcFhVVDNGcFEwSGNY?=
 =?utf-8?B?OUx2WnBDRjhMOFVjREdHa3BpZ1h5OEtPNVJKNzJLaWdQUWRBczRlaVdWOWI3?=
 =?utf-8?B?ZG5tNHp1bHlxUDNVRjk3cmIzZmk0Um0rT05iZWVVcklkU3BqcndsM3VsVDdD?=
 =?utf-8?B?Rkd3UU9lZyt0MmVsRmtDSm9mQlc5UFczWHFhaXZJM0owMTVPczFNWG9Tcy80?=
 =?utf-8?B?cGdkQ1ZPVHJxdFBaTWNlVnNHcjFDcUNSY1dmbHJTRTYvZzRNKzk1VzljMWxH?=
 =?utf-8?B?WHdUNjhndHpzRExwR1hmak4rWnMwSUIrOGtmVGlLWWg4aERZYmxIcm9pbStG?=
 =?utf-8?B?MVNiTXhvcXluOU9rNFhrMXMxQW9uL1dac0hNQncwM2VVVllMQnFFaDIvTXVy?=
 =?utf-8?B?aHF5enJxbVlxWkZURnVMRExWdGFjZThRZmRHdEhtMFFBUHVsVW9ETFh5SHFJ?=
 =?utf-8?B?REtVNk1oVlJiSlVoWGtmZWVSbm13RGhscDdqMjdzaW1ZMEw5VGMvNHNDYUhK?=
 =?utf-8?B?RnhUOGoxREZWcFZQQ3I5bTBYYWxjU1BpUFB5QUZaOEZQbGs3eHpYcW5zZFZF?=
 =?utf-8?B?d1RXL0VPM3Q0eDU1a1dVMVVYZUMrWW5vNnA3ajR3VkVwL3BZTGtvTWpRV3FO?=
 =?utf-8?B?Mm1tVmVBWk9wTjVQdjNpNWVCUWFtNHFMQkZaNmxJNkNhZzNoaFdSTnVWMDhl?=
 =?utf-8?B?UlBsU0VJby9nb3VKb0tKeDJCbUFYMzA4NmQ5cGNsNUx0bDgyN1FOWW02Smo2?=
 =?utf-8?B?bFp4M3Q1aDhIR25rL2dnYnBoeEJkL3p0NzlMaFE5aFAyMG0vZ2NJa0txbUdQ?=
 =?utf-8?B?UWdwa1lPbzhZNkd4T0phUlU3RnVLckh3L2p6RS9iODB5ay9ObkRzR3h0THV1?=
 =?utf-8?B?MDZtbGdoOHFndm1DS2hBYkFrZHJJU0Q5T3NDbmJTdlB5SUcweE5XNktoL3Ir?=
 =?utf-8?B?L2NZc24xYTltUTdDZnF6M0JiSWt2bDBydUF0R0ptRENWZzBMTEVQRXBKbFZN?=
 =?utf-8?B?aENtQitrRkovUmE5WTdod3NkNGlOVkF3MzR6by91ZHdlaW8rZmxCVlhvTmk1?=
 =?utf-8?B?bHVyMEp4Mld5M3c4aVhvYWkxMHhRMWtzeDd3Q2w3OVRNcjdnTDBHR2xyVFd2?=
 =?utf-8?B?RE9wOTVWVnBUVUI0b28wQytWSFBOd1o2U2toaUxoZTh5b2Jnb1pESWhWOHox?=
 =?utf-8?Q?JDdCZGFJIr2li?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8056.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TytibXpRTjFBQWxhaFMrVndXamVJemFKWDJFQWpUZXM2cFdVZTE4ejk1QVdQ?=
 =?utf-8?B?aC9nbStuM0E2aGVvNGdKNEEwaXY5OGI1ZWw2MkMxWFBOTk5DblZoK3JPVVlR?=
 =?utf-8?B?MWlZUjUvR0E2d1BKeUloa3lCalFZV0FYcjczZ3R3cVZNckZaSTI5ZU9mZVEy?=
 =?utf-8?B?dTdlemZ3YklPcTJOWGs2ZjBqNGkzSW9Eenh3SUpIUjN5dEQ5UUVMMWY3anpm?=
 =?utf-8?B?aGVzeE1hSFlBT3NpYkU2bXNZaDY0NGs2T25CRzFRSVpmWVhiR2RpSFg5SFpD?=
 =?utf-8?B?ZGpsNGJkNlhhdEdMdWpGdkVLQTdHVEdTa1RQNjRIamxFSWhnWmNldWJNLzFF?=
 =?utf-8?B?bWxtdFRhbHRKZHpxRGFBSmdXZk42b0hyWVpscSs5TzZOQ1NQNmc4YXlibEtV?=
 =?utf-8?B?ZUxERzNMRnk0T3laS1R6cC8zWGtDUGdGdlJkaEd2R2hWMGtXcDZuejdzeDlQ?=
 =?utf-8?B?NFk4aDVMNjBUbzhCNW1pSzJWb25XOXh0b2UwUWZ3MDNSVFFRclZLWmN1cTBW?=
 =?utf-8?B?TzIvNEN0UnpkdDE3UFR5eDYyUFJraER0U2xYOFRLYjlEeElmS3ZpK2dUYjFW?=
 =?utf-8?B?YVVxYlh6OUJ4TVZzNURId2ZRTlBPcVB2aGJDZ0xsUnFoU3djR1dWK0dTUFZR?=
 =?utf-8?B?bHd5TDZ1c1k3YXJtbktobnA5MzJhMXlJNjU5YW5VZzdKRXhJSDlRa1IrOGY2?=
 =?utf-8?B?UWNVT1hKNDJ6QXpRMmJiaXFlaXZOU0lUTmNpdDFtcjFxMEl2NUkxRmhiaU9Q?=
 =?utf-8?B?K3I4RTM2Z3pUWGxmZ2drMU9lWmcxNTBUNzlaaWZnZWowa3R6YnpET1dVeGo1?=
 =?utf-8?B?Q1FOaFdZbnE0cmdSMWhsZHpGUmU4MkMzZHM3VDlTQW9DS1lJTTNTYVAyUlBN?=
 =?utf-8?B?TTVGTHlQaWdSU25hU0JxQTJzVUtvN014UkU3aVRIVndmcnVrYXhmdzd2Wkx5?=
 =?utf-8?B?OWJPSGdHaDN5YzF4SHhWbm16M1k0NjIwR2w2a2pMOERVSUc4MXN4M2NpUGlZ?=
 =?utf-8?B?UGx6YmdEbWpsQm96WGRLRit4YnNVSW1DMjZxY2c4VE53bHhOTnIrYjlNVlFP?=
 =?utf-8?B?OENqNGFVaEpQMkZzSHpsa3RHdWRwLzgzZ1hQaW9tZ0NuU2g5MjdiNnpzK28w?=
 =?utf-8?B?QWRhcEZxSGlGWWhaRjN4cjBMZ3NhRkhVcmxsWXNDcVByS01pMzBMQlo5UUh6?=
 =?utf-8?B?eGxLdG4zOVR3TzhqT1ZJM3UrY0NDYlp1cDNmNGVBR3ZpWGYyeVRZNlVnZzNs?=
 =?utf-8?B?VjFuZWdlV2JZKzlpVk5iZGRLeWFPY3BrRVlFdzNra2pMRU9HRW5MQUZtS29H?=
 =?utf-8?B?ZjJLejA0eURHZFdzWDZDMDJCQldqVWNaQmRXSUVsR3BVcEpXTzBBQzNuVHdx?=
 =?utf-8?B?NW56L21NeDl3RTZlMzJWZXlLci9rZE1tbDY5cThLT0d4RzJBVUtwZkl6QlJp?=
 =?utf-8?B?SXRlMjhLL3pFalNEYWxQbDc2TDBoRk5IQ1FObEs3QmNYT1NxSklUeXJQdHJa?=
 =?utf-8?B?Z3p1ajAwWWI1VjdxRmVlc3dpdUhWTGpsUmdGd0xBeFJ1R1VyVElPYkRnSkZO?=
 =?utf-8?B?cFFBM1Z3ZDl0MkRScC9pUXRGQ1B6TEtveTNNQmwyaGlQVXNqQmJTb0F3b0Zl?=
 =?utf-8?B?Q0RyOGR6UXdWZ3ZyUC9BdUpIQVZ3SENhQWh5WFMzSU81VDZ6NFc3T1dta1U4?=
 =?utf-8?B?WnZUMGdSVDdQR2ZsTE1wR2RNZ1VTRGxiMDhGMjQ0QjJDaXNtOXZBMW5oU1JC?=
 =?utf-8?B?dCsvR2xJUHhHR2F4WHhOWUlXN2ZSZEltb2owa3dlSFFzRndianhoQUNCUXdS?=
 =?utf-8?B?bEhXa1U0T29tZUNmTnM4eGgrWFhEY3BPbllzYlVzUUNwQ25JMHg0ZTg1OUlE?=
 =?utf-8?B?YWptZ21tMURHMW1rZE4wRCtqNVphcWQ5NDBHdVZ5WDZhR0hNMGJOcUdWa2xG?=
 =?utf-8?B?bDVWWUYzSUxnNEViTlBOa21mSkVTbWVJNzF1SGo4Wm4vRmdjZzQxM0paWFdW?=
 =?utf-8?B?dXZ0MFJoaDlhc3pJQlF0TzFoQUptb1VsVEZIRjVMTjdrVkxUNk5XMHlaM1Ez?=
 =?utf-8?B?ZUlYNVFXclE3Q3FCSjFLNFlaWkh6MmI4OFZ3MHB1Y2M2SG9CZzZsZllZbkRD?=
 =?utf-8?Q?ESaZ7Ffz9iemNfq5kGAGiWudp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0bef64-ac5b-4b32-ad94-08dd713fa9f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 17:07:20.6891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jq5O9p/GEcag+pWA+S0kWjUhoC65olRUqZpUh+XvqEHJ1O71hTLcm17jXMYIqpF0p4pPGEOLO/V6EJDrb1v7Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4320



On 4/1/2025 12:44 PM, Danilo Krummrich wrote:
> On Tue, Apr 01, 2025 at 11:57:35AM -0400, Joel Fernandes wrote:
>> On Thu, Feb 06, 2025 at 12:57:30PM -0300, Daniel Almeida wrote:
>>> Btw, Miguel & others,
>>>
>>> IMHO, I think we should write a comment about this somewhere in the docs.
>>>
>>> When I first came across this issue myself, it took me a while to understand that
>>> the build_error was actually triggering.
>>>
>>> That’s because the result is:
>>>
>>> ```
>>> ERROR: modpost: "rust_build_error" [rust_platform_uio_driver.ko] undefined!
>>> ```
>>>
>>> When a symbol is undefined, someone would be within their rights to assume that
>>> something is broken in some KConfig somewhere, like this person did. It specifically
>>> doesn’t tell them that the problem is their own code triggering a build_error because
>>> they are misusing an API.
>>>
>>> I know that we can’t really provide a message through build_error itself, hence my
>>> suggestion about the docs.
>>>
>>> I can send a patch if you agree, it will prevent this confusion from coming up in the
>>> future.
>>
>> Interesting, I just ran into this. I am writing function as follows that
>> reads bar0 in the nova driver, however not having the "if current_len + i"
>> causes the same issue:
>>
>> ERROR: modpost: "rust_build_error" [nova_core.ko] undefined!
>>
>> which did not help much about what the issue really is. I had to figure it
>> out through tedious trial and error. Also what is the reason for this, the
>> compiler is doing some checks in with_bar? Looking at with_bar
>> implementation, I could not see any. Also enabling
>> CONFIG_RUST_BUILD_ASSERT_ALLOW did not show more menaingful messages. Thanks
>> for taking a look:
>>
>>     pub(crate) fn read_more(&mut self, bytes: u32) -> Result {
>>         with_bar!(self.bar0, |bar0| {
>>             // Get current length
>>             let current_len = self.data.len();
>>
>>             // Read ROM data bytes push directly to vector
>>             for i in 0..bytes as usize {
>>
>> 		// This check fixes:
>> 		// ERROR: modpost: "rust_build_error" [nova_core.ko] undefined!
>>                 if current_len + i >= 10000000 {
>>                     return Err(EINVAL);
>>                 }
>>
>>                 // Read a byte from the VBIOS ROM and push it to the data vector
>>                 let rom_addr = ROM_OFFSET + current_len + i;
>>                 let byte = bar0.readb(rom_addr);
> 
> The problem here is that the compiler can't figure out the offset (rom_addr) on
> compile time, thus it fails to compile.
> 
> The non-try variants of I/O accessors are only supposed to work if the compiler
> can figure out the offset on compile time, such that it can be checked against
> the expected bar size (not the actual bar size). The expected bar size is what
> the driver puts in as a const generic when calling
> pci::Device::iomap_region_sized(). This is what makes the non-try variants
> infallible.
> 
> If the offset is not known at compile time, bar0.try_readb() can be used
> instead, which performs a runtime check against the actual bar size instead.
> 
> Your above check seems to be enough to let the compiler figure out that
> ROM_OFFSET + current_len + i can never be out of bounds for bar0.

Thanks a lot for the quick reply. I tried the try_readb() variant and it works
now. I think instead of me doing a runtime check to satisfy the compiler, it may
be better for me rely on the try accessor's runtime checking so I will stick to
that.

Thanks again!

 - Joel



> 
>>                 self.data.push(byte, GFP_KERNEL)?;
>>             }
>>
>>             Ok(())
>>         })?
>>     }
>>
>> thanks,
>>
>>  - Joel
>>

