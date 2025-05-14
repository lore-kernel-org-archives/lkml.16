Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6100D29372F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747252792; cv=fail; b=G39GE0vJFTi9tlI+1PivNAkktLzB0v4jjFmyaiSlCvHFet6JKEoqQQ5aofRGwIh0Xwog35aBJ7JugEwSXISGbveFJuKgllJFcdHdjNUTjIOGXWq1uHodamVCLMz99PzvJObZmrHvhcxrlOgxSYJ+WXzv1L4XYeD1scpWF4aNwRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747252792; c=relaxed/simple;
	bh=LvH2gOLizDurhZ0qD+q8WA7HO2me3eywigsq2WjOf2U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OWVdlzV6P1FY+YP3CH0xkYUclDxQhCdIA1sxnurCa9MK+3tYFIdZ9t8ABvx3BBI7LqmG1Jzd1mqHTl+UC9wV5VjVEBw315nA2kb1Bd4lg0mZhS3y1qrMdrUpx3s1LnBoCOwzn0kTAIIjeUkWfCFCjdiNydF//lN2hpZztj7SOEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kfUGLve9; arc=fail smtp.client-ip=40.107.220.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kfUGLve9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqkjTkfpmmESanCSu9j5n1RxYcojCQQ+WU599IFk6b2lQikVohcJpY8RFXUvICQdRbH/sBZ+h5dAaV4gUecAjoKJQ/6Y49BivtU5sRLHnNq1K68dUZH41HyKN3vD44NEhYfS5CV84N5mKLKbA+Mc6fFIrTcuIZB31wkAhtnTvWxeevLHNMRS0lMwodBwM//YkJWgyoT4uWCuK2mmoyT6RmpZD76wu4teyo4Hk7f1cmu03co7jkvsOrmrLKlDgrbCVS1lFW+I2K4tqCqGvC8u55O8AwhUfy3OMYygZiyPIBgnwvGiags9hdSoQhhZ2PIjRjON+cydr7r3OfKCNQBofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6+/O6rdbYoiRQ+KQw++GDTiNBwxR5qC7c4q+PwFV5Y=;
 b=WfTWC0jYK841Ya2qPtTbm/CShL8l3gR+FIRovsr9mhsaSnz6xB+P71jcObuAPzjQxIc9GPGayLJON1gQk3/dkFMKTXUYvLjhuHTVGL+eaLqSFrZdTxfueF3j0jsICP4bIWTkOLR7MrCUBASiuCSc11QIomIIR8RcSt3jjKlJtxssc8JreSQkgckzXQDowfEuKLY3k5fOee+AQP2mj6qc0y35OPI//W9bePeCqLsPksqKKj9MO3ZHFMPwplb5Ja20esyLEbOtF4Z+y83b+7XT0cAnihbFVRMIGFPihZdkyXQE1WCg3Or0Aq7l8yjR/pv1o1jkAw4Ii2kwx159Awa4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6+/O6rdbYoiRQ+KQw++GDTiNBwxR5qC7c4q+PwFV5Y=;
 b=kfUGLve9+BnkdSMf0n9Ksg7bsHrrNrE5DF98Y1AbSnk0+cUhtUZaJCEwyVAOm8Az/JzA6O1r4cprwHJvzCMXHsxrAi4HpEvkVrO5vXbFZMBwRRVR8isWf6jfU06JkVVd9S6EfIdvQfYhgWegHAQIfG8MApYGrXrmt8poVmEXlIUN5m7kum3A0IIHJJpHceMmdPkMbOuOk6MJTbRkTPsJL1sf+GQdeUqDa1M1GEbpAnxPyGyDVd29AKKBqkWYB3bEvbmSsNLnEsox+/0m9Qzv1qAJEiP4ja166O0247HtOSaZs7WeRz37O6dzotaiMLmg76zSZaV4ahAi9DPAYfmQqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 CH2PR12MB4104.namprd12.prod.outlook.com (2603:10b6:610:a4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Wed, 14 May 2025 19:59:45 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 19:59:45 +0000
Message-ID: <4f8b88aa-524c-4416-9eaa-74ea68ff1ed6@nvidia.com>
Date: Wed, 14 May 2025 12:59:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 02/30] find: add find_first_andnot_bit()
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-3-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250513171547.15194-3-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::15) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|CH2PR12MB4104:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2126ae-31d9-44e6-3f8b-08dd9321df72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2ZQOWVXLzROcDF5ajZVUTlnV0J6Zy9uSytpRzc0WCtZaFlDTm5lSFpvRVV4?=
 =?utf-8?B?WXRYR0J4bGJJMHJ3azlxYngwYXZhbHhmT2F1THpnYkdWYjFFSU1wa1VvcnBq?=
 =?utf-8?B?cDFEc2UxZE5UMWdDTFhQb2NTc0YySzJkSWhDSW85S3FpUXpSU0V2T25aL25z?=
 =?utf-8?B?NXFZODZqZHA5V2p1WjlLeWx3cGhzeDc2VUtXZ00xYktPZlQydWlVYmdXVlcy?=
 =?utf-8?B?NkU5RldSUjZVVVdvOGdMdEZTZkU4cEtsbnhvaDNXK2dSdXhrS1NHTEdzQS9O?=
 =?utf-8?B?a2svV1dZd1pEV1JSS0l1Q0JKMkg0M0w4YTBGNEhQM0IwZVd1QllMZnhRUlgw?=
 =?utf-8?B?d2pXZ1ZjSUR5NWNmRTg0ajBPLzBEM2lxUnFzZkdDYjlKN2FrUk10UXpUampx?=
 =?utf-8?B?SldoeURwVnZFVm83MmtSWEk3b2F6NTlyQk92WmZJNjczYXBZbWJ6K3FIWWlO?=
 =?utf-8?B?NEhYV1U3UE8vK0RiSjJHMWFtc0d4Vm1GUnJBNHFUQ2NnL2g5RENLM3dLQjBJ?=
 =?utf-8?B?U05YYjRrWmp0OVBoQVhMeVJBMG9ZYUxJY29YWnZzYzYzTkwxTklVQTZndEJY?=
 =?utf-8?B?aG9lYlN1MmhGb1hiREVKNWlWY21qMngwVXN5VHRnU2JkMDRCMFVkaVJ6U1FW?=
 =?utf-8?B?bCtVWW9NZGkyNDJNeEN5ZnRVRCt3em54ZkpZKytXUm5PMU5SRUJiTUNUU0lp?=
 =?utf-8?B?aHhaSlFQbHMvTW95bWh3MzA2RXFsVkE5ZDlqY0VrbUZxMzhyWitvaGZjQ1BJ?=
 =?utf-8?B?Z2xjb1VKRGVNYzF2RTRLcFpvbkZObmxSdlFodXhWdkJ2ZHJ3c3kyMmV3NWND?=
 =?utf-8?B?K1RzU1NOSVZqSWIxT1JTbTIyNTlFcjJqQ2lmQm9oYmFENkpzWFpTWHhCT3J0?=
 =?utf-8?B?ZURXSFhvSEQ2d0N4TVFPdm90T3NuVVRCNkpvUER4ZVZsMHJDWEx3Z2hVb1Fv?=
 =?utf-8?B?UExWYUtOVUlSWGpwb1FMRURzT1JXZlJEVGp1L1hhMGh5UE1saUt4MWRqYW95?=
 =?utf-8?B?NGRLZ1NoZlFxR3BJa3NNdTh3NFpCVjdEMTZ5MGhYV291Ykc0TWdkYSt6RDhI?=
 =?utf-8?B?M1FMblFvOEthb0Zpc2oweWl4ZFB2NTRIU3lTazhuS29EdUY5azVONER6Wk01?=
 =?utf-8?B?WXZKV3pRWXdxTkR0cmVmUGlZa1lIY3NiY0wyM1N3VDI1ZEFBTDhJb0dVNnZq?=
 =?utf-8?B?ODZ2bUN4RkRpNndRMUlBVkdpcWg4RUJ4eWROQzcydHVzQ1J5a2xwOVhyMHJ6?=
 =?utf-8?B?aldnYk1ZS3BwSjdFRTd4MUhWdVJhWVZhK3F3TXhReld2VEU0TnREOS9wNTFV?=
 =?utf-8?B?VDB6VWRBdjhxbXBtbWI5Wk5KMmY2c1k3SFdyMTZMczNXRFFwdGU5RW5SRGhv?=
 =?utf-8?B?dXRxSzU5LzNGNFUwTkFzWmhPaWs5UGs5dGNTaUUyZ3BXYWlyYmlYZUJ2VEk2?=
 =?utf-8?B?alVmRHd0U1FJMnp5bXZMS1BteTRSN0FJU0RIWHE5bkRQeWRCd29Kdk9MdENF?=
 =?utf-8?B?MSt5S21OQmxlN2VYY3NqTHlkdjh6UTh2ZXZBWlIyTnc4YWZiU2ZHalFKd3dK?=
 =?utf-8?B?eGpjOWRKZHpzdTBoalpnaVJrcVdtR200d0t0RG5HUkloMjRZRW9yTVB2eHRp?=
 =?utf-8?B?R0ovSmhQdTBwTGdWeXNGcktLdjBSSlY2enZnVWlwd1g2UzRaTUcvZ0tTbU9O?=
 =?utf-8?B?OWRNOVNhcUlTTUJiTHIzbDNSYzF1RDBsbWFjdGJTS1NIV0hmRG5PMytFVm9k?=
 =?utf-8?B?ckhwUksyQUFLWVF5UG81OHExc1FrNmFMZ3c0QS9mZkQ4WlYzSkhXWFN3V1Ju?=
 =?utf-8?B?OEVsK0JDOTU3Q1VHK3VPYUwyV3ZSbEluZm00WkpmTkNteXM3ZFNZa1hDTElo?=
 =?utf-8?B?WGVUYUpNZTM0UXFXMCtmZ1I1OTVvUE1SamxQS2ZiZENzRGtxVm5YTHplQ3Bo?=
 =?utf-8?Q?qCtR+g/QKLc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGZ4TVAzcGZTZWV1RFZnazNZUi8vc0pQeEVJS3JwckxyOVo1K25JaE55UWVy?=
 =?utf-8?B?K0RUNnI4NEo0SHRQS3J4WE1RZ2pQQjhpTHhjOStrMEVDQ014QTZ5Q2RiNmRO?=
 =?utf-8?B?Z0xsZUpncjN3K2UvT2FZSm5NR0NvYlBvNit5cXFaVTFrRmZNTFRkbUxqWHZl?=
 =?utf-8?B?ams4S25wR1QrRjFDNGJ3NXRTejliN0JRdGxpY0ROZ2VJNHk3MlJ4STh0MXhJ?=
 =?utf-8?B?YmhkODNNcE9zVW8vUHZzenozd2NxOGx4M0tLUFIvbnJRVWdPU1hvc2FtTC9i?=
 =?utf-8?B?TmdsUVNJdW9ZdVR6dk5iTDFJTzM2Z2duQ2ora1JUcnF5dmtqT3o4aE8xNUtW?=
 =?utf-8?B?SWd1RjZ6bTdNbjFFNG90M0FiaDdNQ3I2emZOcVUzc3dvMFBDSE0yaVcyRlJK?=
 =?utf-8?B?bDlpU2FXbXVob1FiSzNMUWc0OU80Z1kwcUd4dWxmRm5JbUNuK2UvdE5qaWwv?=
 =?utf-8?B?bWVlQ1kwK2xuMEVERjVVbjFLNWlNM2FEUlBXOU8wUjc2WEszVlkxSEFGWkZY?=
 =?utf-8?B?bTlmNE1qdStGbk1yL2llemNnVDNialBLdmJ1QmF6bkhmNkZnd0pXR3Rpby9y?=
 =?utf-8?B?R1BCNUVyZWU2V0lOcFFVVnZHR3g3RnRvYXpDSllaL1NrTlZndDRvOE01TUEr?=
 =?utf-8?B?RUhpV1d5UnVqWm10RURtRisvdWlTdjhjb09EWHMvMGl5ZUJRTUxsWmZueERo?=
 =?utf-8?B?ZW1FUXN4eFR3bWtGYUVORUtHdlp6Q3BvTFZVLzA3V1BEcWsrY0lEeFQyUndW?=
 =?utf-8?B?WCtueU1lSnp5c0VmanBFeTJqc21Bd1dKbk5aYWEwSWF1NzIrZ2hJS3VQcFZ6?=
 =?utf-8?B?bjl0V0lKT3lvZTBJR3Z4YmcrVTZsM29EV0Vmb0xBN2R4RTNZVWM2Q1NiaU03?=
 =?utf-8?B?a21wYUUvNVpsQkwwRGtZMXQ1Z1luUVYrQjI1c1FrNHFjYi9oTVJuTHhxeDFo?=
 =?utf-8?B?dnc1UFpHbGJmQlJWTDloTzVZMHhJTEh0d21iREFkUnMrWk5BK0t2L3JQanVr?=
 =?utf-8?B?VXJjVWJwVHErRHM4cmdRdHdWUERvNy9FMXNjVCtmZWJ0TU16Wi9VZEphcjhk?=
 =?utf-8?B?WkRBTTZuWnRKMTYrWGtFdG5TQmtCTFNtVk1BdUdUV01FVGtuWU1PQm9MUUNh?=
 =?utf-8?B?TEVncklBdlc1MVJlVEErVy9CaFFxQm9FTGh6eE1QWTE4U1ZGMXAvVkFuVEVD?=
 =?utf-8?B?bkE3QWdmRElxOVVhaENPSnlGQVd3eXd5NUQ2cjM1d2ZGRHFKMTBtVVhGT3RM?=
 =?utf-8?B?cUZZZStoeTlhWEJPN3NEZjE0QXk4cXVoUGxSWTNNN0VlRnczMjVxN1dkYmJW?=
 =?utf-8?B?Uk9PK1pTSzVWNE9sbXpSdGN5WWt4RDM5bldiYWVHZTZVUjJrcFdHNlNJRTd6?=
 =?utf-8?B?OTZvZ1diblgwRm1nME9jejZNVWh4UHNzVVdScnUxdW5QWFVCWTI4YTRqUEcr?=
 =?utf-8?B?akFtSmlRWEtCVjRmOFl3UllSTmEyZy9SMzZKRzdaWVQrRnJsNHZ4UzdKdWpO?=
 =?utf-8?B?UWFkd3Q0YTNzem1paW5kdmhrRUtKekNvL05FZWttTDg1bXEvaG5hSGJaWkFn?=
 =?utf-8?B?RTNDN2N6eEQwVG9VaytScElmTXZ2RFZNMVkwS1V1QU9sY0tmSEVzNlQwT2FT?=
 =?utf-8?B?QUlhUXJVQ1FoS2JqODRQUGt2ZjBpU3FQOUFnNTgxVFJRUlhPMTNBMW1vdWxn?=
 =?utf-8?B?TSt5cVk1aUF0TGZzT1ZIaE9tWXhiNzhSUEVaMHpBU2V3NTNTY2ZnUTdyU3B0?=
 =?utf-8?B?NWNiL2M1QWIxbEc2Y1BpcE9rT3NxMm9QbDFxYnQ0bDlINUI2MzN6YjdDcjRp?=
 =?utf-8?B?ZTk3SmdiVjRidGxIaUVwYzQvK2J0MFljRjBCK0RsOHBpWUE2WnhqYUZZNWFC?=
 =?utf-8?B?a08xR2hhdXJRUXBUTkk0Wi9WeXJrQWpqemVqT05jOGlBdTNOTnNYdFQzRGtD?=
 =?utf-8?B?QlFGUG5oOHI3TC9RdW9mZXRKSEhZeWE4R0dJeWpZbWhQdllCL2dzQXpHWmVV?=
 =?utf-8?B?bml3Tnp6dkNFeEZicG5WbXZBYnBKWnpRTjdldzZwbGlzMThpVVdjTWc5R05E?=
 =?utf-8?B?VDJDN2FZQVA4STB3Q2pEdkFwenNTS3RzWEtJZEM4YTF1a044ZFpFQkJ2cDVw?=
 =?utf-8?Q?Ltt814EQtdCqOPsTXLk9AUDhF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2126ae-31d9-44e6-3f8b-08dd9321df72
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 19:59:45.0464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRO4+6mflsQOf78lYCbYO1eKuySwtuU7T8P1USG9v64V9kU8GqH444d2ySaF7ptRkSujn9/MVfWmdKZtTGOdWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4104

Hi, James and Yury,

On 5/13/25 10:15, James Morse wrote:
> From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
>
> The function helps to implement cpumask_andnot() APIs.
>
> Tested-by: James Morse <james.morse@arm.com>
> Reviewed-by: James Morse <james.morse@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   include/linux/find.h | 25 +++++++++++++++++++++++++
>   lib/find_bit.c       | 11 +++++++++++
>   2 files changed, 36 insertions(+)
>
> diff --git a/include/linux/find.h b/include/linux/find.h
> index 68685714bc18..5a2c267ea7f9 100644
> --- a/include/linux/find.h
> +++ b/include/linux/find.h
> @@ -29,6 +29,8 @@ unsigned long __find_nth_and_andnot_bit(const unsigned long *addr1, const unsign
>   					unsigned long n);
>   extern unsigned long _find_first_and_bit(const unsigned long *addr1,
>   					 const unsigned long *addr2, unsigned long size);
> +unsigned long _find_first_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
> +				 unsigned long size);
>   unsigned long _find_first_and_and_bit(const unsigned long *addr1, const unsigned long *addr2,
>   				      const unsigned long *addr3, unsigned long size);
>   extern unsigned long _find_first_zero_bit(const unsigned long *addr, unsigned long size);
> @@ -347,6 +349,29 @@ unsigned long find_first_and_bit(const unsigned long *addr1,
>   }
>   #endif
>   
> +/**
> + * find_first_andnot_bit - find the first bit set in 1st memory region and unset in 2nd
> + * @addr1: The first address to base the search on
> + * @addr2: The second address to base the search on
> + * @size: The bitmap size in bits
> + *
> + * Returns the bit number for the first set bit
> + * If no bits are set, returns >= @size.
> + */
> +static __always_inline
> +unsigned long find_first_andnot_bit(const unsigned long *addr1,
> +				 const unsigned long *addr2,
> +				 unsigned long size)
CHECK: Alignment should match open parenthesis

> +{
> +	if (small_const_nbits(size)) {
> +		unsigned long val = *addr1 & (~*addr2) & GENMASK(size - 1, 0);
> +
> +		return val ? __ffs(val) : size;
> +	}
> +
> +	return _find_first_andnot_bit(addr1, addr2, size);
> +}
> +
>   /**
>    * find_first_and_and_bit - find the first set bit in 3 memory regions
>    * @addr1: The first address to base the search on
> diff --git a/lib/find_bit.c b/lib/find_bit.c
> index 0836bb3d76c5..06b6342aa3ae 100644
> --- a/lib/find_bit.c
> +++ b/lib/find_bit.c
> @@ -116,6 +116,17 @@ unsigned long _find_first_and_bit(const unsigned long *addr1,
>   EXPORT_SYMBOL(_find_first_and_bit);
>   #endif
>   
> +/*
> + * Find the first bit set in 1st memory region and unset in 2nd.
> + */
> +unsigned long _find_first_andnot_bit(const unsigned long *addr1,
> +				  const unsigned long *addr2,
> +				  unsigned long size)
Ditto.
> +{
> +	return FIND_FIRST_BIT(addr1[idx] & ~addr2[idx], /* nop */, size);
> +}
> +EXPORT_SYMBOL(_find_first_andnot_bit);
> +
>   /*
>    * Find the first set bit in three memory regions.
>    */

Thanks.

-Fenghua

