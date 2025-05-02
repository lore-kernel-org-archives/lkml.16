Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2118.outbound.protection.outlook.com [40.107.21.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BB31EF372;
	Fri,  2 May 2025 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746213098; cv=fail; b=fHnosaEdJFogX+xmXgt3dAUHRH6diJwUfXZnw95QNXRH+Q+pNhgM5DkVuW1x1pVmt9aMUft9pH964udusyMfzbdf3QvJKI+FdWHar04trKGDaKxnwbU/8VPLDLPfAD9A0e8Mtyeabw/g4PVIARl3PCzO+K5XrQCLfk9HR8a2DTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746213098; c=relaxed/simple;
	bh=BGJRUhV/Z6oBgfiel5wBEWwfcUdTFEabyE2G2biB64o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cjrSYp6qsivIsyhFU6CU9BXEXCQ8mzMUkcYs5RzznhBF07i+fhXFGvWX5bdcHb8YVdXt44cMp3JfyPNwfPC8GYIIPOzvLql5q5Q9sPQS3w/xLw7JJmlUy9OqEZGGu3tz2Yhn/cYR+BJS3y165rE/6viAWxeJUBTIZbV56+1UOkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=OA0iz9a6; arc=fail smtp.client-ip=40.107.21.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="OA0iz9a6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMFGZcxobBimCafrs+JwV3wwoLfGUuSMkkDMsFqlvfz9B1vq5dIAdln51EFOZzCHkkR+Dw2XfHNp7ZwwABfidOjlXImCLZHNmG3XhviDbSXiouOq0gUMeHrJLWFXRJmt0h1GshLC5e777ZvzgBjzVIMptydmbB/kC0HkboSiK5S7/PXB9UCy+1cuQ1z52zqB6lud11GrchWRGBGU2MnTrBa5ZEuGgfvWRXq1k4jXoFQ/2GFw6NKlYLpF83wETh4PgKW0hbS2HPPw6XEnU+Pfk6IeEONWhqIlIplxzHv24FIWVBARacBzNdW4n11qINipWkKPmBU1yaMKJAVL+kRc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIL8d+5n87mtFb/O0Y5E69DnqKIGpEnlsfPOdevCSxg=;
 b=spiRDXk6Yj8VoVHr4YrK4hL9YMRk7Fj2h6h2MD4w3dnyUU8cCQQDk4pkVA80MqepkR0osUbQc3ZzSxFV1yY4lI56uResm7kJKgEGlpwhQPaSYHXUxzmwO9m5fYORAbN+E8zcjzoqRaxx5/c/BYYlPpigwiCNCp+nKaweQaJSbX+MlCv0HOEFU1tesJgkzqGm08mjiMk7hOPYNs6mn234PTNln82aLrpzfGJOcpmnPyrV9Kat1cBd2v8ZgTZPJTWUXMTXa4No91g+jDWeu0SikeJMRbkmB+ZAk8RV0CHOIq88lSVA/ZKL1PO+FPtnC4RMCBasWWRiduPBj3JtZ8+JVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIL8d+5n87mtFb/O0Y5E69DnqKIGpEnlsfPOdevCSxg=;
 b=OA0iz9a6ehXZrvKhgNvNrkXEeBNCl/lvc12EeGTXepgbwG4qP4fB8h+16+Ytw/h04y5wG81/TylNfgsqG7nk7QQVMeQMFogsLcruonEbpPc3VKasS8qYdxfRbywn4otXwYQNnWXSh2L2EnvcdOJpBX9BNvcYZZlMKBkRaTqEzVakCsp6u7xFJvelwIMXCa3K1JqEukfynJPdXJd+HONRRha0k8DsImUwrOr1tilKSfsperrkxSet5wnVbbZbOmc492PiCH9XDUs71b7gvVEs4flmk1mmbDoD4vixrFGYgDqotM3hDT2e+kvzFti0pHxzE/7ZBwMOiFTeOFRRxKiylw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by GV2P195MB2064.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Fri, 2 May
 2025 19:11:26 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%4]) with mapi id 15.20.8699.019; Fri, 2 May 2025
 19:11:26 +0000
Message-ID: <9964aeaa-0169-4596-a33d-c56bdb6edae3@phytec.de>
Date: Fri, 2 May 2025 21:11:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62a: Set Critical Temp. to 105C
To: Nishanth Menon <nm@ti.com>
Cc: vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20250502142606.2840508-1-d.schultz@phytec.de>
 <20250502142606.2840508-2-d.schultz@phytec.de>
 <20250502144934.t6hjiwp2f64ovb34@deeply>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250502144934.t6hjiwp2f64ovb34@deeply>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:303:dc::7) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|GV2P195MB2064:EE_
X-MS-Office365-Filtering-Correlation-Id: bb870327-1554-4bd1-2176-08dd89ad229d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEdFRWZZMURXR1dEdEhvUEZTNjZST3U3aW5CQkpsUS9QK2M2SFZyUnF6UnR0?=
 =?utf-8?B?bHNYa01ibmU5d3ZGSEFueTBkVFZxaVFmZG1IMjRsY3lnOVZZYVJKOEFHZWN0?=
 =?utf-8?B?TVpnZUVZZjNNTENXWHF2REJVMkxxT01PTnd3SEpsVWlDditzNldDNjF6R3V4?=
 =?utf-8?B?RklqWS8ybGlMc0toSXJBMm1RWWovQkFob1JGOXRqUmZ5YWpmaGphNE8yY05y?=
 =?utf-8?B?Ymd0SWg0TmF3dDYwaGRSNTVFUFZlMEtaMFlOZW1neUVNR1Z6ZGMzbkNSU2NO?=
 =?utf-8?B?UUdGYXBiQXBHa0pvUTUyVFhrVEs2NjV4NFhVUmZ0c0hMSThoT0t6c2NwNkhQ?=
 =?utf-8?B?c1BaMnNKdW40M2psNFRVVXR5NldGeFg4WitSQUhmU2VHcVRxbTF3YlRZUHFQ?=
 =?utf-8?B?NGZSYXBpd045Z2VQVXNGNUhwbzBaamxFU0VHZjdxNnVxYWdDSGtXSlZpZm9T?=
 =?utf-8?B?djROLytsRnVWSWhEdjBhSU1BVW54bXZWZGhJalhWcDBTZldCRW41UGdXWEtV?=
 =?utf-8?B?Z3lVYUFZZ1NtODNjVitSditIVFFvTkUwY1lQRWlac1JmSkhkSzhuZ0JIKzhl?=
 =?utf-8?B?MmJWTm10MmZQN2ZreGlTYVJaYVl1dkxzTGd1Y0l0QzkrMkpIeWxENUhLbXV4?=
 =?utf-8?B?b0h6RHZZNG5OL0wreWNSTy9TcXlUQklmTWJUNkFWdnEybHcvb05neklxdS9l?=
 =?utf-8?B?NDYzeVdoVEFNeHFOUnlYZ0ZPZlkyejdrd1cvVXZ3VU8xdWorZm1vbGJFYURK?=
 =?utf-8?B?Y3R6NSsxZXhZUnY1M1B4S3JKWUo5NjIyVC8xb2xWcmp6SWljVlRsYjVPSjdi?=
 =?utf-8?B?L240RWcyZXdRNlY1VDVsOU56ZEtpWDJObTg2UXpLMURtQnZtZFJESmpTdkVx?=
 =?utf-8?B?NC80WTcycS9LN3hpeHllN0t0dUozNFpmenZUTnRVdmZ6VTVkNTIvdGhTenkw?=
 =?utf-8?B?RUV2cVdZeDI5MitzcG5iUUVKNGEzam05aW8vUUluTkxJMDVyalhEMlBQVndY?=
 =?utf-8?B?UDdEZm45ZXh1clpDRmkwV05iN2YrbkJkZ0hJWmJPbEJqVzR2VE1ES2dVVmdL?=
 =?utf-8?B?YnRBM2lpT0pOZ0lvYVJrZFJlanlGUWF6RElTdXNRWG1JUGZqYkRaeTRqUHJH?=
 =?utf-8?B?SUYvTEtiMC9RNkdqZ1NXZ2RYQUpodjM0M3BHOHk0MUZZNHhDTXZIa0p2bWNM?=
 =?utf-8?B?L3JiRVo1bmpvNjJjZitUOUhaeWRTSE81L3lKWW1qYXNCTlFIZnZNNzFraEZ4?=
 =?utf-8?B?ZjRYekRueUdldGxsZzBUcjFqTytWY05Bcmx1YmhXWnZsV3VZVk0xUG9FUjVr?=
 =?utf-8?B?SDJiYWtQTnY2NXRHY29wTUcwNWsydUJ3QTdCNW9oRXF1TTlaVHpyVmdVc1NS?=
 =?utf-8?B?VWUxUEttYUgrSWkwdVg0ay81bTlscitZWmVGTEtveWZMU0hzaUZrUkM4ZzEr?=
 =?utf-8?B?eXNCcXd2N1Rwa2kzYmR3QnFNOTRJVXNUWWZweGFFa3hvRTQ5MXQvbGQ2bHVF?=
 =?utf-8?B?SkxpU0k0VVpoQ0Y5cEl0UE0rSGFOYktoM1FIY3pkVDROL25qaE5PVnpTdlpZ?=
 =?utf-8?B?UndWYm82R0lFKzNvOWo3d3hRcllYSERFbWhmc2p2bFBZcm9rVWVGWjFOSEha?=
 =?utf-8?B?UXVZMnNtdFhYazBtbWFwY1B6Q0NOZjAzdTFYcFJ6REc3TkZzRlZwMFNQeWk0?=
 =?utf-8?B?N2g0WDhMNHdzUEorOWloVmRPL0t0Ujlqd1ozRFAyV1Q2TlVoTVNITVdIL1Ny?=
 =?utf-8?B?eUg1bEllcm53S05sTzFFZGVYa1k4ZE5XanI1YjRxL3ZoV1ZGekh2bWxpeDg5?=
 =?utf-8?B?bHdhRXYyb0diQndxM1ROSldOMExCYXdQT2h6UWNOVnJueE1GMytQaC9XWUZW?=
 =?utf-8?B?YzhycE9PNVAydmZKWnl5K0l6VlRaMTM3Q3Y5cmZmd0YxL0FZcTdlRTVDeHBC?=
 =?utf-8?Q?4dbb4b3iVvI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Znh4dDdrRnIwRUN0M2lBV1RLblllWHVQUGRvc1NmZHJXMjNTcXhwenpoWUlz?=
 =?utf-8?B?YU44Y3dKNmFQVTJHcUd4NVluRzZramRieGpjMkhUek50T2FtMndCdm9sV24y?=
 =?utf-8?B?ZnNVbmhYQ1NIU1crUkZNdWRIQ0JjdHNBTW95NWlrZG5lQjNka1VLclQ3S3pm?=
 =?utf-8?B?ZzJ4c1ZJUEVpY0ZBdFgvTGpYK2hjY0VZMWdtTDh0WldmV3QreVluemZNdXFR?=
 =?utf-8?B?QmJZN0dYY2xXTndaQ1N3RlN3azFVK0J2Ty9tbWJHK1l0NGM5Q2VUZkN1UVdw?=
 =?utf-8?B?OFhoM3FKTWFibGRoM0pqcExUWmpncnR2RnVIUmx0aFZFS3hzZVJORFd5Qklv?=
 =?utf-8?B?UzdBQ2dhK0c3Z0Izajh6czJLZFhsNDJRV3BaR3lWNHlNaDhtZlFuRCtjNHlv?=
 =?utf-8?B?VldLdVhBaWZVSzNrcU9sNlRqTURXRGJHWXVpVitJSFJxVWZsOHdRZEZEV2FG?=
 =?utf-8?B?RVpBdGRoTnpmZkV0cUk5OE1KVCtENW5EbUFDSm1vNGNid3A1SkZLNlkrZTR0?=
 =?utf-8?B?UGQ4bW4rNVJYRnZpNFlFa2wzWlhYMFV0S0lpYlRzeGZhZnBYSFFPVFd1Sm5Q?=
 =?utf-8?B?ZStQaW1zZFViSGVPbnptampTbXZhMEt2NWhZY2lPb3ovb2pkUURURVRwc09Z?=
 =?utf-8?B?ZXd5OEdGUmJERDg3bWdSK0lVL0NSNEUzOTlrZTg5ZTlOc21JbzB1OU80YUx1?=
 =?utf-8?B?Y24zNzk3cTd1T1o1NDhJTGs0elVXdW9acGNCYWFlZ1RKWUVCRi9UK0E4RTAz?=
 =?utf-8?B?d283NkpjVEkxWXdDaS9RVXZhS0JIZGxoT0Y5ZXBaeUlCYXRLZW5xQzV2UGFI?=
 =?utf-8?B?RXpUZUtFa1ZxYVh5bUZpR1RsSUl1bVNtT1RXSkxCOVJHMFQwd051TnM4L2k5?=
 =?utf-8?B?K1hJUGd2c0hXakwwMm95RVZQam9MMU1OaW9wK0l4TDlTTmpLenV6MHNNZFgw?=
 =?utf-8?B?dHVTM3R3eHpNajFJT1plcG5MS0dFMFhybDZFYk0xRDFUSE0ySi8yZHNJSzAr?=
 =?utf-8?B?WVp3SUZuYUkvc1ZpUkc1RXNEWHl1dDJsUk9SeDFDY25ZejdJWDhIU1cxdlFj?=
 =?utf-8?B?TTlpMkhsZXpLaTR4UEZaM0xaZkpwR0Nqb3pLQkxaSm5ocUp4L2hUMzRLZ2Fx?=
 =?utf-8?B?TWdWdXdJSmdrUUphK2VzeHM0azdiY3BMSTR2bUdRSjFzK2MwUGNhQldyZlJ0?=
 =?utf-8?B?ei90M2g4WWExcmgyWFJzTGtDTnpyYzVaRWsrRTh1WWZ4Rld3cXhFRGVRdUFk?=
 =?utf-8?B?bFZ2cnNYSFRmQTFqNkJTQXJKaHRFWHEweTFqRUJYb2hPeVhsVUZkQ2orOEcw?=
 =?utf-8?B?R2pzaHhIeVk5TUttUHExbmZiWTZ0Q2E1Vi9HeUJuVXkxZWgyWHlIRWVRdThm?=
 =?utf-8?B?UmpGUmlEdy9iNG9EcEtWdXlCMHRwUjJlVVM3eWFnYzJBNVlVeDc1Tkx5b2d1?=
 =?utf-8?B?KzlzUUlDelRhMGdKbFh3ejI5M09scGpKUTJxNXdtSGVUek9CNmtwOEEyNHdt?=
 =?utf-8?B?WGJIbWZpcnNOdXVuVzVMSGs4M3lsVEpuV1A2VXovZXd5U1Q2UUhybFQzSzNo?=
 =?utf-8?B?L2poeC9SMCs4c0RCcFpMYjVPOHhCZmhzWnZ5ajg1QW5RcVRjMWRJYlBsVkpO?=
 =?utf-8?B?RVZ0bThJRWdvd3YxTFlreEt0NzdwYU9iaWRTRmIySlZsOUdxNFkwUldQajdM?=
 =?utf-8?B?dmJXOGwwZVFtelZxVlNPai8vUEVoY2x5MlNLam9yT1J0bEtSWVVLUnZubHFM?=
 =?utf-8?B?cTErR3UrY04vVVZtQWV2d1N5QXNkY1ZMeGlOZDhhc1hlZ1V0ZTY1Zlpvb3JH?=
 =?utf-8?B?NEgzdSs0Z0hiYVFtaE0rclBtUmZJMXJjQ3JKY1ZJb3djL3Rhd0RSTHgwZURC?=
 =?utf-8?B?VEpwOVNWR2k4dUtmU0IwNzJVRDJZZngxWTZNQmlGZnpVM3BxK0lPWElUbGhu?=
 =?utf-8?B?QzJaRjRjUktkUnJRdmxhK1FKY01HdDRxUHQwWk84Zk42UVNMbUNlUS9Qd2pG?=
 =?utf-8?B?UmxBOUNjOGFaS3pWRGVQTTdEN2EvOVEwb3I4akNnT2RET3ZxcFRBeHNHY3dR?=
 =?utf-8?B?enVWQ0pEN2E1Y01Ba095eWFjTTNpWituQXBMclFjTGk4WVg1cEhBTWhuTjdK?=
 =?utf-8?B?dDNnSTB3dWxWUDZyRlRnN25aVUJJRHlmYjBoWEhFbndFdCtSdmlTc2pSa3dV?=
 =?utf-8?Q?xrisI8ch87u2obxtvFHbT5a9nP4un/vZ79b9zRJn1IKj?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bb870327-1554-4bd1-2176-08dd89ad229d
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 19:11:26.2938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rw5Z6noalR3IihMqkLUL31t74g9+TH0jhAQfWdhgrOf9EDsiakScxJbC3GV8/iTGByZkuqWrgrJoje1zd7rCuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P195MB2064


On 5/2/25 16:49, Nishanth Menon wrote:
> On 07:26-20250502, Daniel Schultz wrote:
>> The AM62Ax SoC supports two temperature ranges:
>> * A: -40 to 105C - Extended Industrial
>> * I: -40 to 125C - Automotive
>>
>> By default, use the lower limit (105 °C) so that any AM62A running
>> in Extended Industrial mode will shut down safely before overheating.
>>
>> If the bootloader detects an Automotive-grade device, it should
>> override this and raise the critical trip point to 125 °C.
>>
>> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
>> index 39ff9118b6c4..40dcb9bab965 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
> Why not create a separate header for industrial grade and rename this as
> automotive grade and let the board file pick the right grade used on the
> board?

Mostly because I copied this from 10e7bfd8114c207ac and with the most 
recent temperature fixups in U-Boot, we also have the missing bootloader 
logic.

I would also prefer an out-of-the-box solution for that.

- Daniel

>
>> @@ -19,7 +19,7 @@ main0_alert: main0-alert {
>>   			};
>>   
>>   			main0_crit: main0-crit {
>> -				temperature = <125000>;	/* milliCelsius */
>> +				temperature = <105000>;	/* milliCelsius */
>>   				hysteresis = <2000>;	/* milliCelsius */
>>   				type = "critical";
>>   			};
>> @@ -50,7 +50,7 @@ main1_alert: main1-alert {
>>   			};
>>   
>>   			main1_crit: main1-crit {
>> -				temperature = <125000>;	/* milliCelsius */
>> +				temperature = <105000>;	/* milliCelsius */
>>   				hysteresis = <2000>;	/* milliCelsius */
>>   				type = "critical";
>>   			};
>> @@ -81,7 +81,7 @@ main2_alert: main2-alert {
>>   			};
>>   
>>   			main2_crit: main2-crit {
>> -				temperature = <125000>;	/* milliCelsius */
>> +				temperature = <105000>;	/* milliCelsius */
>>   				hysteresis = <2000>;	/* milliCelsius */
>>   				type = "critical";
>>   			};
>> -- 
>> 2.25.1
>>
