Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616211DB356;
	Sun, 18 May 2025 13:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747574669; cv=fail; b=ha8SpumNXfX4xH7GsHJkpmOX+A+wRa/ZHZqeE1zXjOtLwEVEO8PyKweDDQpR89VaotDBBKbIQvIaTfIMXbSuyNhRVPNC40Xbxuojecp+IWP6UUneEOZZRthBEcAMyJjR5AYeMk0z8vbNE7xejSMJmCkUB+JoAs8s3PbGmLOzedU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747574669; c=relaxed/simple;
	bh=lnmpUeiw9VCbfVzvqRFe/8PFqHAT/jAKdvNM0VzRJ5U=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Lps3CB+ONZ5JWBL8BdIlU+ntX85F4k0uV0NDXBNJYZGamf53Nb51Fhn2A41Whx5KpUIE4aWv1besHL+IH4GowNP6IGcB2JPEJ+iHYWrpfjZr4Idjz3pochW06QrzQQIwH12IwrT2rCTKTIc09Z7FoznPn8DK1inmXf3N4n/61Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aYSXA4T0; arc=fail smtp.client-ip=40.107.94.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aYSXA4T0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2JrO7tvUsVspBSajdBynSY2f+R/f834++G0pyBxn/ElHa3Lotg01Uk4LfI72ZGNRdRx26p2ApQlHhUcQouPP3ZLcz/45N0pgQZujfzA24YNq2UlmoZ4dzYfviFnPR8USs8vYnVzHiA8wJkovhfSOuVQJHbzQJrUHkfmbB6II449VOWnaBEvhGhRgnR5gqrgHgrwyAV+hD7Gv07ZljwJEfEeG1/ywgYrcGoU52tsDXQZzJk9eyRcocIbS57PekYIj2m9XvDHACrz8/vjBhOTtLWH+bQYZUBzEu/XNZYpMF9YMAjeag/sZDtS6jl72D6ToLvZ+YutnIkm6qc+wiYiFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPwP6kzyt90KNCfBW8jfifi70mPTPaPi1iNHZe0R+Mg=;
 b=Lo1c1xATfI2/S4g6dqfuo8pgUwQ8gAJkinN9VRNDf+2y9CdY5LXo7zWWUpcgH963XNWNWGmphTxuLj98RqenDJbMfmUVcV5c2y9efbiPTw94FVTWsILbEzVg0V/3qeBJ9VzA6gyLW0ttz/GyELi9ofbHa4pmdjXZkUifinVCIQJAwN+TkgkN71mK0fP77LdQZhVPMuACfdw7PxAqw7nz0WJIoBO4qFPRSpOfkBZk+FsygQVfPyiJ95daC8/jw+yh0RamalFXhzTiduFKedixRZVINCfzIt6nNqKMmsCJ/iU2jTZvhYGlp8uv6N/D3MiIUnix7XtTbjlmSXW3UsClqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPwP6kzyt90KNCfBW8jfifi70mPTPaPi1iNHZe0R+Mg=;
 b=aYSXA4T0cIQUJ+YGFpKVDDR1XnUgdvQGjcY2dNbFnwDr7AetLuqJoF1wtGuc+iamnoRxfWzUUuMQqipgr3ek3t2EbiH8LB9YkLQ7FlzXmlyaaKzJvDDmzI3e9+7JsSEQXZk5vzc/4yi+W+iZGfvH/57cPCU1PngSKdL0eG2kOx1+l8RnqN3XOneOnnMpqD9AMueItn+sT0K7ITn6ZkEII2k4g+Uuz18HvCqWlprpcag1eidM65Fx8RnUb52M6vj9Ci90l5i7emb++vkIErkvVTrTOEkA3ZmIqSdkzkLoGqtBtaVwQ3U7ySMHilU5yT3exYPSH/dECJutIulBZNc78A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by PH8PR12MB7349.namprd12.prod.outlook.com (2603:10b6:510:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Sun, 18 May
 2025 13:24:25 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8746.029; Sun, 18 May 2025
 13:24:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 May 2025 22:24:13 +0900
Message-Id: <D9ZBIGJWS9I6.17MVKGQWNNOX8@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com> <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
In-Reply-To: <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
X-ClientProxiedBy: TYCP286CA0236.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::12) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|PH8PR12MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: a620df0c-f883-40b1-0caa-08dd960f49e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmNwMnJZbk1UUFoyampha1g1WFpFV29OWVE3NDJKVzJsRmRodGZlcEt5R2x1?=
 =?utf-8?B?VUU0RHpMekhVTzQvTUo1QTVBd3B3M1JpUTNQZWhkVW1FaC9CTzZPWTlsdHdh?=
 =?utf-8?B?bDQ0amp5clJudjdscGJXQTVkcW10UEo0UUxmZ2lHZzU3QVNnMFA3OVh6Tkxy?=
 =?utf-8?B?Q1RQRjVJVzVNc2hnWjlIY3ZXRzFjWEtjcFBXd3JzNWRVUlpGckQzeW5YRVNU?=
 =?utf-8?B?MFZjSjZra3piWVczc0VBVWNKalBDUGpvb0pwWmRxdmFQM1FoYy9lRlBVeVdp?=
 =?utf-8?B?M0JnRlptVlpKWnhqUmxLRkIwK0dLTzlPbmFsdENGQ2JoNUEvYmVObG83Uk0x?=
 =?utf-8?B?L3cxak9lRCtZajZRaVZzREJEMXQ5UFNEdjYyYzJlRlkxSnlnUkgzTXRqcUNR?=
 =?utf-8?B?SU9zbHZSTU43UnhseGY4RnFMSGNtdzBoQzRvVUhIOGNHdXZzbmszVklNMU50?=
 =?utf-8?B?TVhQT29zdk1BNENGQ2Rpd1dadk5QY1hWRGc4NE9vaFZaUDh1VVhlMVFTM3hP?=
 =?utf-8?B?L2E5MGgza3ZMQUloQmpFTmhmYUxvZ0hENllaK25NV1hCWGdGYmxCZ1dKUFR5?=
 =?utf-8?B?aE5XeU01aVFpNmluUm4yeTJxTXNUZDJhVXJ3ZjgyV1UwWWZLVmgrR2xQckxW?=
 =?utf-8?B?YnZBVUlLdzVXOUVXTk1pa3BLZ0NNU1MySWdTb05zWXc4RHZWL1lBWEJUcS8w?=
 =?utf-8?B?RkFMVCswQWlPSXVTRDZuOEpGU0hVZjA3dkRod3dKSkUrUjFuUWUyd29ucnRo?=
 =?utf-8?B?WEtCVlU4dTFEN1dnalJZTlRtYkRWZ0VyTkRkaFBnSnFvOSsrb1dPWVltMGFi?=
 =?utf-8?B?ZGtxTExDSU8xeWQ2ek4wWEZtVGxkY1I2K2tFOGFzWUtmS0FmdjY0eGJiOENT?=
 =?utf-8?B?SmdCa3JjSWNTaFZMam1VbFFXOGVJVDdxK2ZTdWRMYUxSRWdrRjJvLzIxbG9o?=
 =?utf-8?B?YkhJZU9mWC9UVENCSm1zRmZPdzFWQkFWS3NvN2FYMnRQWkhzVWgrV0pPWWlr?=
 =?utf-8?B?ODR6QmtNZklEZTB2aEZRdGQwNER3RkNOOGRYNk0rVGNSN0grYXpKYmg1SStC?=
 =?utf-8?B?TEtxeVFuR0lNVEF5Rldwb0xIcGpaMWhyeWpSRml6OVJRYnRWMU5WRXB5V0M4?=
 =?utf-8?B?Q0IvakpxMWUzQk9mUTVzSjhoRm5ZT2I2NnJSUFI0aFhFR1pwc0RTVG1lOUYz?=
 =?utf-8?B?dkkwU2IxNVN0ck9ORTMvaFBYS09vTlR3ZU9FWVRYaEt1TEVmVys4ZkFZTGgr?=
 =?utf-8?B?SDd1R293STYrdkFnWVkwU1RIdGxMSFJFbjUrS2pzWHgvTTZBMDVBMkVzS0Ji?=
 =?utf-8?B?bG43c1N0LytKYTNRUVhRb09tNWFncTRRcGpLcEo3alRjOStjaXRLRnh3OVpK?=
 =?utf-8?B?aTVMNDlDdi9PRzRqaUtOeVVhS29nTS9Bc1lmQ1VVaElYRHFsY1BjQzVpcXZF?=
 =?utf-8?B?SmxwK29RNFRxVCtTY0Nxb0R0WjMwM1JjbmlSbnN6b2Q4RFlGYXlCN2grUFZs?=
 =?utf-8?B?QzJ3ZjJ2MGp4OVlpWUlCYXlKNVlDNkc3M3Ruc0J6WlpEUU9TbDFGQzhPOEVs?=
 =?utf-8?B?bElOY2kvUXZpSkRCYUkzdlVHWkNXbnVrQlRHYkxyc2l4aVI3ZHVXclVIaHV2?=
 =?utf-8?B?bVlCUUhyMG96dVhGcWh6SjFLY0RnZ2twa24zMG0wV01tcFNxK3JJUlJwbFZV?=
 =?utf-8?B?L1VkM1lVY0h1MTQycUpPM2FJSDV3dVJDa1JINmpWZ2d2blk2Zlo3NWtOVFpD?=
 =?utf-8?B?aDdOK3FubU1XeGd5c09ybTg3T1l3dXV6elZuWTNpcjczeWs5YkRDd3VNRmZn?=
 =?utf-8?B?Rll1eWZVT25oNGg0T0x1RUlvQVc0M2tKYysyd2lhL3JDdmxQWE9hVmxxTHND?=
 =?utf-8?B?RlBxR3Rza1FkZGU5MFFFMHQraTZaMC9tTDEvcFN2T2FxVGtmbzRUbW04aHd3?=
 =?utf-8?B?ZjVocElHQlpraytPcEYwbzFCTDNBY0R2alYxMUJuYTA2d1J3dWRrLzlVVFVz?=
 =?utf-8?B?MnYwenM1REhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnpvVjUrTE53TlY4YndJYm5GZGlrc1J5bVVBSzFRbHhwQ2R4Q3ljVG1oQkxS?=
 =?utf-8?B?cVlJSXNBOXJVMndYSTNYcEJsdnhhYWlsR3NWckt0T1ZMVEhhWHNxTk91OE5O?=
 =?utf-8?B?WFpKbnpuYzZPTW5oTWFpMDBVZVB5c3hMM0JFM1lXeHViS2xWSjJFRGhoM3ZY?=
 =?utf-8?B?SVAzWEVYd3V6M0xjVU8waXBrVTc4NC9ERStHaXVieExHeTJscDNZRWt6MXBr?=
 =?utf-8?B?VUMveG5WSEVETEtPZzhacW94c3krcENtT1d3cUZYelA4dzRrUTB5M21EZ3dv?=
 =?utf-8?B?L3crd2lGbGdHbVBjQ2liMUFZVVJTR1A4VEpDbVpaNnFaY0pzbEJGNnlkdDFx?=
 =?utf-8?B?bllLZDE4QkpPNWFXQitkckJLL3duSTBZRm1naGVTNTh4WE8xeEFLeFhiZlpa?=
 =?utf-8?B?RmcyczNweWd5Y01VQStZM001KzhXSkdRaGI0REhzZ3hGM3lNQTZ5TTVvWnBl?=
 =?utf-8?B?TEZ1RmplM3FjV3RoODdXNVFQZ2U2eTZZYzc4Z1hrRGoyUG55MVZlZHpDcW55?=
 =?utf-8?B?dDdlcHV2bmRtcUUzNWpOTDhTejErbWYwdnkvazhZU2xwTGRQeXFyeFlvWFdk?=
 =?utf-8?B?a245TDdKRjNoc0ZtNE9EWHNGSGtsRTIyUExKOGJIQ1A0V3dIenhiRUFQa1Zq?=
 =?utf-8?B?cWpzN08yZzZDeXRqSUFjd3VPOXkvajFIZVh2R2FSK0NpeGZlUDZEWnZJSWY0?=
 =?utf-8?B?aUhlMUg1RjNLa2ovd0JTbWhJQUlsOXNzVXVmbjlqY1pzM21MNUZib3NSbGZh?=
 =?utf-8?B?WFJhVDdXUXhiVmRlaE9NaUZNQ2Rtb2N5SmdxYU5QdUg1MURnQkZZNXIvN0pB?=
 =?utf-8?B?UjA4NzZwWjFvOCtOYnVlTGpDb0ZNSmplTktRUXBZcTdlRkJ0Ym5pQS9YeFha?=
 =?utf-8?B?TkcrcGRpRnMrZEtHNGthNklXMFVXQlNwYStDaDBXNnhKK1pyc0xRWnhlQ1ZG?=
 =?utf-8?B?TGZQcnMvZC9rRWQ1Nk41R0x6SjhCT1R1cS95N0tCU0xIU3FRaFRzS0wzZFNE?=
 =?utf-8?B?YlkyRTlMWWpBVzdYMWFCczFWNmVxMjVhY0RtNTNsZDZzYnBDb1RCL0prczc5?=
 =?utf-8?B?UTB5dGNOVXZwZ1pwM3hjbXFhelRybWpFMWhzNDk5Q1RSSTBiWExzbkxPanZ2?=
 =?utf-8?B?eExDcmlDODVnRUd3ZmZiUHJDdDJoaEV6VUJSbFV6YlcrZks0RXpsaGRRRHMz?=
 =?utf-8?B?c3BQY1FJK09ibDU5YVdUSzgzMkk4dXZiaDlJdURFUklscFFZT1VGLy9FLzVM?=
 =?utf-8?B?UjJSSkkwckUzSkVBSVpsUzlmTFlhUU1DaXNtV2FOaUNkZ1NGRkRTM0lrcnN1?=
 =?utf-8?B?VGEwZHp2eHNkZWFna0ptVXhmckFjN21CM2hKZzVCQm5NR3VjeHMyczBFTXBF?=
 =?utf-8?B?azlXNnZ1LytLTkVIUXBsMk5leUYwYk5XWjJsbzFndE1KcXZvUlVMTm8xNzFu?=
 =?utf-8?B?RjlpazNONGNaRENVbmEwenNLbjhCTFVBb2ZjYmxVRWZuYzBTTFgrWENHZkdx?=
 =?utf-8?B?VC9SQUhUTVlRQUZwRk12N3dQd1Q1LytsVkI4Q21XbFRjUU9HM1hMeExrdERF?=
 =?utf-8?B?alEzdEJ2WHZCU0NWaUtGZTc5S3AvazlCdGlaT3FCYmRackxQOWZZbitPZExo?=
 =?utf-8?B?ekVuUjBINVlURndNRkVVdlFCTUYrUzg1TGViWFFTbkJXZ1d4YmVNTUU4bkZx?=
 =?utf-8?B?anhrV0FocEVzZjc3WURBdXAwSkpkdGNEMnZ0RWVtVzNWc0hRZGVEdUFDN29p?=
 =?utf-8?B?U0hDbWV2SWwxdWJBUTdXdUI1bEloZW45L2dtNzdndzBBMkVhc25nL0k4eTVw?=
 =?utf-8?B?aWN1RnFRUlArVVFOS3psK2l2Zk5HYis2MjdQUjFjRk1lTkZ1WWR1Nm9tcTJq?=
 =?utf-8?B?eXo5b3E5clNTNWVHeU9DVEs3VG9Za1RHY09QeEUzWDI2aFJaOTZ0OHJtb2Zp?=
 =?utf-8?B?MmxDYVoybWE4aExBWWpxWTBUQzhpQ29LVlFrc0syb0lRVXpPVHowVUVmTnZq?=
 =?utf-8?B?U3FYd3YyN3pTeHZYTTU4ZjQrT1EwT015RThURWNUU1UxbXBUSVBkTE9pVXc1?=
 =?utf-8?B?WVYxR1dDZGNnK3JYOWRLTGNrWWNQQytSVSt0UXNkay9ha0trNWR5QXh2SlFh?=
 =?utf-8?B?REJOK0Nuc01DYUpEbkRRZ2tybldiVStqeTlUdDlPbU1PZHpOb2xvSERMQWRX?=
 =?utf-8?Q?TUXsSqZM74+MTorcC50eUhCw1pXyErw9X9I93Sofc2oC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a620df0c-f883-40b1-0caa-08dd960f49e0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 13:24:18.9672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DswWvXQdJlhuE6m4w/NIg++SLvXJrmbJrNdSnJufAT7Znk8nb6Oiloi0z0NyCOL0vJJWyGA2DZyAwd9xFjjlUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7349

Hi Daniel,

On Thu May 15, 2025 at 4:20 AM JST, Daniel Almeida wrote:
<snip>
> +/// Callbacks for an IRQ handler.
> +pub trait Handler: Sync {
> +    /// The actual handler function. As usual, sleeps are not allowed in=
 IRQ
> +    /// context.
> +    fn handle_irq(&self) -> IrqReturn;
> +}
> +
> +impl<T: ?Sized + Handler + Send> Handler for Arc<T> {
> +    fn handle_irq(&self) -> IrqReturn {
> +        T::handle_irq(self)
> +    }
> +}
> +
> +impl<T: ?Sized + Handler, A: Allocator> Handler for Box<T, A> {
> +    fn handle_irq(&self) -> IrqReturn {
> +        T::handle_irq(self)
> +    }
> +}

I see that every smart pointer would have to implement Handler in order
to be used with this module, but...

> +#[pin_data(PinnedDrop)]
> +pub struct Registration<T: Handler> {
> +    irq: u32,
> +    #[pin]
> +    handler: T,

... what if you store another type `U: Borrow<T>` here, and take it as
the argument of `register`? This way you should be able to use anything
that implements Borrow<T>, which includes T itself, Arc<T>, Box<T>, and
more, and can remove the two impl blocks above.

