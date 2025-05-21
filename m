Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1448717BD3;
	Wed, 21 May 2025 07:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747814035; cv=fail; b=PmaSkk+A7vT8F8tDJVTWSe6yy5h2fUD74ivJQbROKwBXIePhs5YzW4G1b0Ae4hcwW/QKPp/TZSBCqDA8mYnhpxNqFFTSAFx4QC8/Ik+p8IVDrQa36kjXskDK2a0SV4al7iAo920Zj1piCX8oagGllQMNUNuWf7fQe2YbfOvL3lA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747814035; c=relaxed/simple;
	bh=XzlvRwrOB5zNRRzzZIaPug9bm2xpJ4OOI0WE2mYq/+4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PyrEeiHQZ1JcO/R0RHZ3LFdOCCyW0U/LlweIQs+7aeASwoKRjxmaNoRRT0tEX27xxHsqwboqZ+X3vUykGMwDs4oWu7EQUPONfw6Bu/E4UEg3dzC7mVr+Ecx+n/ubh40AbXEmu0UxsMquNmlSHW0kCoECWiU5qCUXe1RzY/sYxIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D0BDmz0N; arc=fail smtp.client-ip=40.107.243.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D0BDmz0N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/+Mh3ouE0XgthTIUc7Zjs44YYHOoUnKk6zfcp/SAjGIHW211uOymNlKv2KrlmchMpjXtdYHqhiz7QFhHUXJfq+HX1uar6Yv+kBI62S8zFiM41lCwIwQxVC+6MiIAPDMG8086X54pt89qMaBLVAsp0RIuNtY4HpFzEGvNSz1JtdmCzeoDFi+585HLdRQAOx2cCBZfLnT/I99UFiFpQBX57J1ITAacRlDKzjOZpHpJlZ2pZNZfLNbMtlqrYjvbpi0+OLoVWQz95zA/lVxajS5JqT9bZxdAGlXd0Wd569gIiwfh1OWz5dqjyukzod9YmG12nFaGY3ENMbWwXMfvbkSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzlvRwrOB5zNRRzzZIaPug9bm2xpJ4OOI0WE2mYq/+4=;
 b=IIMlHtx/Se983B7ljXMOBOmnK9WyGg9SPcIRSYwt/ZXHR4lu/ECKzMCGHSSA/C0wUEpblaKqLts1r8+tzj+8hEMFUDmlRwI8LM14JcNt6OGFkCmbyjR+xjsPRoExnFVKX7chMyXkjx0rDaQW+iDwAVzWevqtyGRBVrRf1SIhoX+514WRxEBLJUV/tMPh9eaj5lWjBVLQFKtgJIxEo49ccPL4rGaYmOfIi/+oJzDRFYqh+vfhodXqsd4KAV2Jh6/V5taHZkV3H6qqmmnJPMV8f8oOwLYPIVAjoHGBCfa+eapVimIKgxnGN4UJSCfL1S6PxITa/VCY5wD8BfXZXFHrOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzlvRwrOB5zNRRzzZIaPug9bm2xpJ4OOI0WE2mYq/+4=;
 b=D0BDmz0Nxbz9q2J5C6MMz78siBMtJO/o3Ua3FJ1JKlzbG0Fz0POSzBdkq8XS5bEIc8lCWZpasIHrw0k7ukAjNaK5BuQJmpKe+n0Vrxo+hsSAncIrbuSev5f+i4DhmdcAeaZnZCYFZbHbr1kxM/1Td/Fh9pl7QVuC040bIGW4pr22L12exLXklxfdAQ4C/DhSK4fy2E6sr/EjMtA8P3zZIr/ByIign14ArCO1OsHM60lmxd1AJtoJXSYUwVXS298ROtVEsmHy2ndSGjns05xnwmrmeItE7Ry4WHxWPne8yHboq+5actsrRYpnFWqGHrI43g2pSOR6glOC/7mmaq1k6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6657.namprd12.prod.outlook.com (2603:10b6:510:1fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 07:53:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 07:53:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 May 2025 16:53:44 +0900
Message-Id: <DA1OD24LT9GX.2JYOBUQUMQ8YC@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Fiona
 Behrens" <me@kloenk.dev>
Subject: Re: [PATCH v5] rust: kernel: add support for bits/genmask macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250326-topic-panthor-rs-genmask-v5-1-bfa6140214da@collabora.com>
In-Reply-To: <20250326-topic-panthor-rs-genmask-v5-1-bfa6140214da@collabora.com>
X-ClientProxiedBy: TYCP286CA0373.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7e67a7-a25a-4d02-baf8-08dd983c9de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3ZzS1V2TXE1TDRJMFlmbllxNTNBKzQyMGdNNkJSRFUxKy9MRFl5SVJIckE3?=
 =?utf-8?B?elBXMm9GUFUzdUJuYlZtdWtEVjFMSUhabkt1UG0vbUd1M1pCVEU0Q24zdzFr?=
 =?utf-8?B?VEhXTnFiMDNUMTVZSklsSllOOGFDbG05TDhzeVZXSlpibllka281OWQ3TG5x?=
 =?utf-8?B?aHEyTW5ySU0yUmZIeUpoWFhoeTlHOXNGazgveXhSL1REelFERjlkMTJVNnBj?=
 =?utf-8?B?VGFIcWtkZWcyT1gvVlR3M3Zvc0ZjY0FWQnBBRUxRdnJVb0NYNVFTeFllVEZV?=
 =?utf-8?B?Y2RGYThtZWJUL3lBZjY0dUpSWUUzSXV0dGtsZUdhMzg5eWg5dzhmSUlKMFhv?=
 =?utf-8?B?TWE5b1I4bkNweW9vbS9kTi94L2I3MnlMK3FLR1g4dDFTemJPYmg4STlpVWtq?=
 =?utf-8?B?M3J1YXg2UUhvV2VhVzBtU2c3VzdoYzBNWEJuV0VsYWdOa2V3M3RzZjVZTlVK?=
 =?utf-8?B?R0dUYlE0T0VrTGkrVkNOeXI4NlZUQ1NFaU5iMVdyL3BWWnMrM3V4eGFaR3VE?=
 =?utf-8?B?RWtIeE5XdzUwVkd6UEl1ZWh6cm96S0NnOEpGdnhzdjRWaEpleVVFeTRPNFA4?=
 =?utf-8?B?Q2lreXVCOTQ5Sm9rNjh1RFY3b0VDSFFZZWRJU1AvNjRkWWpSazkxUk8wWWFk?=
 =?utf-8?B?QzYrcGF6L2JCdTRUTHdzT29CdDlGMFF0aEM2algyc21WK2N0UkpndlZnUGJz?=
 =?utf-8?B?dXlsdTRnNXA2UXJlNUR3MkN1RFdpMzlpbW5qMFJxRXBPVXFmYkYrWE94YW5H?=
 =?utf-8?B?Y0lNZkdVMGxxTW1NaE9RcW9ZRnV5QW1kZ3dzWjU4ZUM0Tjk0K0tFNzhuSSs5?=
 =?utf-8?B?dktjZkhhT0s4cTVYY1ROSi8xRVdTN2NVSzdLQ1JrRVp3Z200dmZhR3VOcVZT?=
 =?utf-8?B?cnlxMlcvV2lQY1JjeHByM3lLMTN4Y0RpL3QzbDRrWlFpS3VoVzNrdVVpZzJ6?=
 =?utf-8?B?ZWFvVkRCcUVrK1Z5a0VZS2hFWWF0bnVnNDd6RXU5K2tudmttM1lmWW1FQkpl?=
 =?utf-8?B?aU1WZXpIem52Vk01Q05NV0MrUzg5QW16Q1dCdXQ4RDRvU3doK25mLytycXZz?=
 =?utf-8?B?RmdnNm5JTEEzWjJSVXNpSXlsVWh3OHk2OUVTcnhJbzVEYmlMbGRZcjZnVWJ1?=
 =?utf-8?B?VUswVE5pcXZZYWdYc1RGU3VFUkZyYyt0UXhRNkxKRzBSZnZqYkRGV0MySE9q?=
 =?utf-8?B?ZzYvSlJKUnpPdUY2ZlBmdkx5aXJRN1l2UWoySFZLOEErQWpyZkhSTzIzWUJJ?=
 =?utf-8?B?eTcxUnZWOEpUQ3NVUzl1Z0NZSmE2U3o4ZHFOeXJDQnVmbkRTRDl1c2djNE9H?=
 =?utf-8?B?RE84Z1c4SlZWNXgrY1JvYzFhUlhzOHFIMFhmdTFzZzZ1RnpnODNzZXM2UEh4?=
 =?utf-8?B?Q3B6bkkxNWpYMkNLQUdxUG5pQW14TTZEUmJuck9LRzV5Q1pJemxON0w2bUtY?=
 =?utf-8?B?czVDRjlsSjQvSXNiUjUxT3ZLM1JVNWVBVXZGUkNsTHM4Q3BTR2Fqd2pEYzNF?=
 =?utf-8?B?NnVyckt1R3p5ZFhsbG13d25ZS0dyaHVlRzdVM2NRU3J2OUpLdkZPS00xbmU3?=
 =?utf-8?B?Qm5uS1RaVmRjMW9sejArdXhUNUc3QlBhckEwd3BHN0hFL0hpdW9DS1lkYjQ2?=
 =?utf-8?B?dGZFK3NFdTVaMFdRR2krc1B5OXd0eSt5L21TQ1pQOUdIUEkwb1lNaG1qWmhU?=
 =?utf-8?B?YlRJRjJ6Y2J2L2JNeWFlMEVnWEtyOHVDM2xtOHd3RGMyZGdHNWlKS3Q0VUI0?=
 =?utf-8?B?bmw1TnN6OXRha05UNzFpYmNXTHAreTM2aWZyY25vSDNEaXEyTFo3bkhPQ3JC?=
 =?utf-8?B?TTJHa2JOa3d5eXJWNldjeHFyZWh6ZHU0cG5hYzBvVmNRck5LNzZJY2hkRmt3?=
 =?utf-8?B?MzA5YmN0ZS85QWt3eEZHZGtiQ2NtTlF5Y0VXclhJZ2p0a3FwUnJtTUM0MTFt?=
 =?utf-8?B?a0J6VXA5bGtvMTRibEdrNHpUanlIK0QvWXR6NkNKTldwUWgvdkx1ZDJKS3Mw?=
 =?utf-8?B?dU13T3YvZDlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkZWWG1zTnphV1I0UTl5M1ZLZDQ1L1lqRzlGbWFSOGM4RXRmajJERU9XcS9o?=
 =?utf-8?B?bG8yMks1SEJ5OG4xZVU2ei82b2lxcDAxVzI5ZzNUOXNMOERDSkhqaGVqR1pm?=
 =?utf-8?B?VGlOeGpHV0R2azBWS1ZMMFNCQlpybVpTcHJ0VGErMjlpVTVyQm90Q200RHVS?=
 =?utf-8?B?TlpkWkZCRHZwdHZXamtEckJiQXBBOWVSMjQ3dno4UDdxVlZ4UTVkS24ySzVr?=
 =?utf-8?B?TzQ1YTkxK3FISG5aVThHZzkwakNFZjRrVWVCWXRIT3Y5bWxrM2QvMC9EbUJp?=
 =?utf-8?B?WHR4RWxJdFVHWW5xWEZMWHFtOE5mdXVjR29rUWs0aWExbTlJZThwaWYxOGtI?=
 =?utf-8?B?aXovU0xxYW9wVFBlWkt1OS9GRytWcEpLU2VJTzFtQnRoa2lpL0prcXRmelpk?=
 =?utf-8?B?eGNQc01VZG4rbXd6Q2RleWlBdHNlbk5JQ0NsQmkrY0NiRFJIZ3pjU1dVVmFF?=
 =?utf-8?B?K1F0QTZKUlp0RGVIVU9aL3Z2SzhBUjk3OHdYV3RxU1RlMmZXRVhvK1FTZ0ha?=
 =?utf-8?B?UUFFWm10Y21ySmF5MHdCWmluS2RGaDdKWGxOYjRjeEhFRVN4YUtZOVNmbFl3?=
 =?utf-8?B?TUQzNEtlQW9CRksvU08ySGNFQXpadFVwckpZcE5qZjJSb2NGQURMY2ViUTds?=
 =?utf-8?B?WEJCZWROcTM2ZTZIaVEzekRVdU9Lc3dZMDFFSmh1OGhGeGZmZ1Zxd045RnJQ?=
 =?utf-8?B?WGhHd1d6NitoZDBTQVNjS1FVSGRGelFpajh1Sk5YbWxWMzVhbGtLNzZaU1I1?=
 =?utf-8?B?NmZzREY3Mk1BdXAvMjQ4RUNzZDZ1ZXI1RURURVNoK05EdU11clRic0FYaktB?=
 =?utf-8?B?dFdBQmF3aXQvcUsvVEJtL1RDWEF5ZjFmcUZsTzgrVTF2M1Vxd3EwUSsxK2FV?=
 =?utf-8?B?ZXRsdU9WM2JKN08zUWpxUmQ3TU9HRzVJR1A3d1QzWWFVTCtmT0Y1V1lrL2px?=
 =?utf-8?B?WnhzSU82VW1ub1dpaFZPZzhTZE4wYkRhUXBNWVZHMzB3Q09hYkt6cmkzRzcw?=
 =?utf-8?B?anh3TXJCVU4zMXl2ekhCdks5dTgyNVJNcTF6NmdyTjlkQm5qSXd5NU04OUJp?=
 =?utf-8?B?cFFSY2d5eDhLM3J4d0pDT2NadHRMZ1Z2QWttc3hXekZQNmRzN1B4ZCswR0E5?=
 =?utf-8?B?WjFsa0pETURDZEdkN0NPaHFKekJMMkk3MFB6c1krRmJySDdZUllyTk0yVVlM?=
 =?utf-8?B?WkhxakFmRjZHZm04R1drL2YrUE5PblA3TnowWTFhRlBZZjU2Sjc0L2NlcU9t?=
 =?utf-8?B?SkhNc3F3Vm5qOFllcE9YSmZBYVpCZ2h6SWZBaUJwNXJ4TzlNZUg1QWN2UTM3?=
 =?utf-8?B?alhyQmttdWpoMy9TaW1IaGhZdGpmSytCekxGMVByenNtcnExOTNvKzhvcTdp?=
 =?utf-8?B?RmhWdERGVXNNWkJtemZ6SURkVVB4dW5qWUsxYlJtRzhaSjQ5WHRzcnd5cmZH?=
 =?utf-8?B?WXF3QnUwVVR5aUhHbXZtbDV6L1pmdjdhaWJpVnVaVVFaYnBTQmNSdTJpajNz?=
 =?utf-8?B?RGd6WkYzV0wvV1pzTytyOEZBMlpCYXNGTElkeG9qd2E5Rmt1dzdpL3dVNDdV?=
 =?utf-8?B?eExOTWUyQ1ZJampnblVYSjQ0aHU2dzRVR1lBeXkzSkt5WVBxOWYxb0Y1a1p3?=
 =?utf-8?B?REJnTmh6dEptc2YyYWtJRVI4bENONEd2Y0FHbVFFWlRLUTBzeWNxOWxRNDEz?=
 =?utf-8?B?WnM1cWFJR01PRGphcTRvSUVoNElUMzZQb3diY2R3cVZucjFrSmRxMlZKcmJC?=
 =?utf-8?B?dWUzcXJFMmdwZHhndHkzSW1TZ1NEeGRUcTNsdWcraVA4eDI3MFdMNm1qWkNP?=
 =?utf-8?B?NExnV2x5VkZ1RFNhUjdzWXR6aTdjOEIwNVRKYitTVFcxeUJPRE5HR3FmVDJl?=
 =?utf-8?B?MitIS3Z0Mm9zamVEWW82RTRrWUJUNnB1bm0yeWhTU242NUExeFY3MXQ2QUJt?=
 =?utf-8?B?bStkZWt1anZaSXNWZENkeTY2dHh5QnMwdWVqcmREZW5aRUErbStIMlZuT3Zu?=
 =?utf-8?B?cnVRMTR1U0QvZlcwNnJKTXM4elRyWlhPTW1idmsxVE5WMWxtSnZCemlHUEho?=
 =?utf-8?B?d3RxSnM2RHBSQmlBeVBGcWY5SHY2V2RQWUV6M0g4YiszWFAyRzVhZ2N6SXNs?=
 =?utf-8?B?SFdOY2sxN3lCZEtIRmNzSCthUE1QOEZlWGk5UXlXQUQ2MDllWnVhQkNncnJa?=
 =?utf-8?Q?Do7EHUeQ0/3sJckps3L+NrHUPmZITlIlLNiz73m58Niv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7e67a7-a25a-4d02-baf8-08dd983c9de0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 07:53:48.1382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpIwUa3hCjKOCot66P41J+XniQpObt8oeTQMkFuz4wE4WeS497LNTTa4ZJ136FsfS44QkTELnww5xnPwxzj7bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6657

Hi Daniel,

On Wed Mar 26, 2025 at 11:06 PM JST, Daniel Almeida wrote:
> In light of bindgen being unable to generate bindings for macros,
> manually define the bit and genmask C macros in Rust.
>
> Bit and genmask are frequently used in drivers, and are simple enough to
> just be redefined. Their implementation is also unlikely to ever change.
>
> These macros are converted from their kernel equivalent. Versions for
> u64, u32, u16 and u8 are provided in order to reduce the number of casts
> for callers.

This looks good to me, my only suggestion would be to try and use a
macro to generate the methods from a shared template, to rule out
copy/paste errors? Similarly to what we do in [1].

I guess this means the examples would need to be copied to another place
(module documentation?) for them to run, although I am not quite sure
whether this is needed.

[1] https://lore.kernel.org/rust-for-linux/20250521-nova-frts-v4-4-05dfd4f3=
9479@nvidia.com/T/#u

