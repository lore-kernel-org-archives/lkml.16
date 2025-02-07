Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2073.outbound.protection.outlook.com [40.107.96.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20C71E0DE5;
	Fri,  7 Feb 2025 12:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931113; cv=fail; b=VYSV9C4MRD0QRnn3z2chP2RfiaSVw052ln0igHYeW5un5edn8qmhxQvtD+3yAtc1b8E/AvQv8nQvV3pmQzdhc9+xqLuNHDoFKPCtBrnnHOhZWCxIOzZA4dXO7n4slCEvWzfmAXiUaM20RCR3aarl2vu5T5WRz97VlXTZ1zKYD+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931113; c=relaxed/simple;
	bh=d5umsVjPavWmj+O2MgNGqz1LNcVPfbYRWFGGQSPLtvk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZWZ6Rlbcca3rtmDbbGoxEMKk5YNOm6nDjypxdiiwQOeli0Ztv4R9tX2SVCGoQEEle6B9cqsxc3xP3YeULedVCvuzjjJzRzcc6SuUsSl7jG6cfvz5p6jdzVfPbXwGUecQ53Dw91z2QOsEsidxg47taKNGBsk2UEsgOIv1qxxLDGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=whKQS2a2; arc=fail smtp.client-ip=40.107.96.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="whKQS2a2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGpXjzVjpqoIN3zxxlvoGE7z1UbzKc2bBaflxVhAr4jrJgchtYbDxJ76UBfJD1cZQthLiISFLNdOQ4c9xquQS9YU6HIDzKAP6YNr1F41sKhq7nJEVEbGSxBA767qsc8T69wNdaJZvyoBhLgkzDlLL1Q5cl2J1CBIWeWNL7+Q+PDvbvUxhcax/GWHyCJ0xZ/cfEny+Hgjg/U0TszTyZLxn+5xA9UqnBRkU848+I2r4I1Z+D4/MV/qsgHW8BrWecVovv5hzDazs3qLMKcgpWJsWfczJ5pBWAPo+4AWcC1jETbfIHl97Pq3C7qS4TFI1V7/U2O0Zf7Hhe8CqjUXYtnqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yy7B0N6B9LcyMYkkwdWypwH09AQyxUZJ/TSsGVpSDFU=;
 b=FOnK1EB5lkE6yJDK74kInyIz4cNNKGl2x+6DVrDojIcHW9X1Xeq9RADB3zMzwMrlBqif/vjBfqU1BRVJf2h7duOsBIyZSlL+QaO95tghzWCgaOo7EmzpaH+EnGGKc3MEhz7fAXrAkJrtLgX/csM1NufbiGcDMZTSNe838EjkCf2S8x7gZu0cWyLd3v/mXtCk/HW6DoO63l/v2K/6N2qorr7DPS2XCG3Eb9Qou5K8wJgN43U5UboX8GlUgjBCSuw78mqrcCB9uCtXSbR4kN4tPyvu+rN+SGBZxdTUnBcMALpQ6WDeGhzcfUEG7ff1R4CU27PJJ+W9jAgPuwIYTYXAtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yy7B0N6B9LcyMYkkwdWypwH09AQyxUZJ/TSsGVpSDFU=;
 b=whKQS2a2GMaHbUQzHI5pVQ4Dq/LZb0nmWlGkyc/Uthhs8a7Ds8eVci9Wifo+v0h1mlgqzY9ZbqdpmbWunWlYKgdFqi4qjMDZPVdQQ5zGBDo6k+QITTJxhQ0A2b5QfcOaXuqVOOYE0enj+3CEHiphH3SeOfrJNZZN81tCDrk0yxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CY8PR12MB7659.namprd12.prod.outlook.com (2603:10b6:930:9f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 12:25:08 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%3]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 12:25:08 +0000
Message-ID: <eb1628c2-b209-40a1-9f20-1057c2815536@amd.com>
Date: Fri, 7 Feb 2025 17:54:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ASoC: SOF: amd: Handle IPC replies before
 FW_BOOT_COMPLETE
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 "Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
Cc: kernel@collabora.com, sound-open-firmware@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250207-sof-vangogh-fixes-v1-0-67824c1e4c9a@collabora.com>
 <20250207-sof-vangogh-fixes-v1-3-67824c1e4c9a@collabora.com>
 <cd64ea3c-fbb4-4c97-b369-dd78942a522f@amd.com>
 <49744378-f63c-4096-a055-00abaed688d2@collabora.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <49744378-f63c-4096-a055-00abaed688d2@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::21) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|CY8PR12MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: f3517bc0-49c6-483f-a0a4-08dd47727525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFFzYmMyYXJ6aGlCUmpyMlRtNjkwZW5kYzZ6bnpOWVh6WXNqT2U1ZVRpV1dX?=
 =?utf-8?B?UGZSK0FPQVphZ2RHYU52VTZ5UElSb0xiN3JwM1FpR2djSzdTTGozcTdVTmp4?=
 =?utf-8?B?RWZUZmJ2MG9Qclgvei9MZG1xN2RjNUdJUHFlU2NoMEt3MG53c3VoeXRHU3RM?=
 =?utf-8?B?WjdiYjNQUEpDK2JZQTN2RGVXSzFuV2RwaEpZQjJjRWhQb0ZMbldDdEFuZjNH?=
 =?utf-8?B?Q2NValdlTFNtUG1HSDAvb3drdnlsMDMzMzI2Q2RXbFFWNzkyR0R4VEZ0SGVv?=
 =?utf-8?B?RE5EdGRsR3cwaWhzK3JDL1ZNbEY1bXRhaWhKTXpMekQ1bVg1ZGFBVFJIRUZa?=
 =?utf-8?B?TXZoY2Jxbmhha1FlWGZ0SGlxRjZCWllKd041SlpJWXhaNEtHb2grOHBEQjBV?=
 =?utf-8?B?bmpCdkMreDZMVDV6WWlXTVhockppUVVyalFRcy9wMTZLSTY2c3h1cW5FWWFI?=
 =?utf-8?B?UEMxaVUvSmNIcFVCUU9OV3dGSHJJQ3FZQ2NhZE1IRkZSblpyWGlwYkYxVTZr?=
 =?utf-8?B?VkZmRzJJckY1Nlc1RElnV3daVTJQQUNOa1QwUjE1cmp2VUpNRjNmRkE4aTU2?=
 =?utf-8?B?dnMxRUEzNTBjSTVoL0p4VlRYRkhxcExYODg4UjlzUWFVeHM3VmpjZ25MMXFa?=
 =?utf-8?B?dlBSUEpjdDVKOTdHY0lTV0Uzb3RYbmZXcGFiZlRhVVdwTTN4L0xadk9GYkYr?=
 =?utf-8?B?Qk1FQldIZ2pETUVJRld0R2tCcnhPQy9zSXpJdUdKWkQvUmQrUTRZelZtZWdD?=
 =?utf-8?B?ZUhLajBPVkpmV3VnMEhPMGQ2dnJkdjFmcGRaK3pEQW84S050VW5qQnBxOHRp?=
 =?utf-8?B?MzkvZjdlUmdUbC8vQzBaeHVITmFrWkxQNVJhanV2dloydDgvR1l1eVNralc2?=
 =?utf-8?B?WHREeFIwR2pibUI2TWVTUHN1WmRmUGNsL3VlZy93SktuM3l5L2J0a2lzcTJk?=
 =?utf-8?B?YWV5M0Z1anI3R2hFcUlCN1MvbVgvY0dDQXNBMVN6RHlPeWEyVGRicXd2VzRq?=
 =?utf-8?B?M2tQMXlWdWFGbjRWV0RLZHVjcHMranBGQjZkZDc5TW01dkpFVENpNzJsTTc4?=
 =?utf-8?B?OFU3WUFmK0RJVmtmR0R6WDdwZy9QaHBuSHdqckhYOEVJUGg2KzF4ZDdvRkdC?=
 =?utf-8?B?cWdDemI3bW05NEdRL1NxcGNtQnEwZDBxWXVuS2Z2bzB3TTN3ejdsRWhZditp?=
 =?utf-8?B?Q20xbEdxNVh0a1JjM2dqbkNNY3cyTk5HOVJPTGNTWTV6RlEvS2RmV2VDeDBR?=
 =?utf-8?B?SmdCQWZEVCtSSUh3dFVUaktLNmMrK1VpeXFMREJuc2F4Wmx4ckhzUlJPalFS?=
 =?utf-8?B?dDBsUENFbEozTjU4T2R0ak16T1JKb0NDaVVXY1dySFBjRnJmMTh0WHFFbDNs?=
 =?utf-8?B?TUt4c2xuM2dQZXRmT2xPR1BhSW9rUnNzaFRJZ0xac1NkUjBwSnNvemthMkdO?=
 =?utf-8?B?V0p3dmtub3UwcEVrWFJPdFVvYzV6TTVzeUpjOXVoUFl3S0hiaHFDdmxldm1U?=
 =?utf-8?B?UVdtNTRSL2F3dzZJdlAwZW54TTRrdWVPeVNaTHZUc3VxY0w0R0UwNlJ5ZDhm?=
 =?utf-8?B?SHB3STRhOXFPQjZzbjJ6VTJLdkNmMlE1V25YRFF6SWMxUThEYVN5V28zNTMr?=
 =?utf-8?B?V3Uzc1ZaMmUxVDBXSHFkR3hNZFpqV2k3UlBIMzZGOEdwbzNSZmlyY25veWtC?=
 =?utf-8?B?NnViTXBSSEJhb0xLOU0yMzQzS3RtMmFjdi9PTGxGT2Y2UHBhdTZtTE1ubTZI?=
 =?utf-8?B?WW9UUFZkTmRIaEJUZnZkNlJkbmE2UUE0dldoRjNIb0ZLbzA4UWUvQzBRUXdG?=
 =?utf-8?B?aGw2TDRkQ2dIN0dpOWs2bkwzeGRDaTRxM3hWRWkveEVHZGZHQlVGa2FOcW10?=
 =?utf-8?B?TXovU3g1WXZvejFhVjBSMmpaVzArWmlRSHZ5T290bzhPbFBBeUk0SmFCN3RL?=
 =?utf-8?Q?efIrWFvBUi4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzNUdUxLbWZ3bkJyaXMrODl4eVFWOENSdEpzeGVlbWRKd1Zta3pOMWhvUFIx?=
 =?utf-8?B?dGtTcE1BRHZxTzlkMk5iV284clQ0Um16SEpUeERWcU50RFVXaHVQQ203VHBz?=
 =?utf-8?B?bzFIVlEycEJwTFhIaDR0UmdCNmdIOVdhOHozZnRpZitibHAxRUZnUnRQK1ky?=
 =?utf-8?B?M3NZQjRadEJYbGJjNmo0emIwdzUyQ3hwTXArZk92ZktwZlNuYTRWUjlpWnNT?=
 =?utf-8?B?R0VlSG5qem1YbU9Cb21WcDZaS2RLM3BocFU5QUx2NzhEdWI3WjNPb21UT2hH?=
 =?utf-8?B?QUhQMEkvbWhYeFN1WXpndnZRK0xuQVRJU05wdWIzMW1BN3BQcUkzSDFRM2Y4?=
 =?utf-8?B?ZHFheXBNbjNvWEpjcXV4d3ZTNjhUNWJzRzBkelc5Umx0bm53WnpNcVFxTGo3?=
 =?utf-8?B?TXJWYlVXTUFyVjNMQVY0bGZKMllYYjdhcTZqalk0dkpQY0k1N1RIR0xiRkp0?=
 =?utf-8?B?eGxaUkpaMEsyU3hweTlsMXlyY1gzUFVUSFB1OXRWZUZPM010MkNla25uZmZn?=
 =?utf-8?B?TUhMcGQwN2EvdlZwQ2tNRWxwUzRtQmhpR2lZTFVGQ2w5UzkyUlVmTWVQdldE?=
 =?utf-8?B?VS9LemtVK1EzT0NYdHBHQ2RKWDhRUHgzY1NwUjVRSHk0Y2dKaFJZaFVHVWk0?=
 =?utf-8?B?UkJYNU5pTktHN0FDNHBRTGpybmVzU1RtZWcvemdiQzYyZlBlejBESWt6L21u?=
 =?utf-8?B?Q0xyekdPNGFMbTRQNGwxZWxlREZmajZOTElPSWFFK01YaUwwVm9IeDVONWlW?=
 =?utf-8?B?ZHUvRDc5dzVNWjU4ZHpNWExuZkdpY2U4M1IzdzlqV2tGZk4xUXBKS1NyY2hY?=
 =?utf-8?B?ODBDbjgxS1JQUzU0UVNiZHlFWmFhRW5ZTGhQQVY0MFlYMUIzZ1MzMTRhcjVl?=
 =?utf-8?B?UGorY2o4cndVeC9YUkxrVlIzQVltb3haVWF3Y0VPdm5uY2pQQjhCa01VWmpm?=
 =?utf-8?B?NUxGcWlSUm9zNFRQRThodWJSTUs2OWQ3TFpPZ2pwVFM2anFWZE45aWluMDhW?=
 =?utf-8?B?QmJOdXJqL2hqSDEzYk1zNDQrT2VTZWtNU3hrYWJnUHk5YnV6TDZFWkRvdkRy?=
 =?utf-8?B?Qk9XVlN3dXRDUjhSWWViaWhwdVZMOHlvWHpPd25YaSt4VDZubTJFemozeDcz?=
 =?utf-8?B?dkF0Q1RPMmxTdk1mOVZjeTNsZkFkWFlHSnFBUmRFMG4zTHlOR05Eb2Y5aXVC?=
 =?utf-8?B?d25FTmFzUGJhSDcyUUNtZmxwS2pkaXBpUU90Nm94SFVMMzZ5dTdSVnVEeHlN?=
 =?utf-8?B?T1BCVmdWd2FRMHZ0YUNDYXhvcWVVZHg5NzAvNkFEejZpMHJRUUpYM2pyS2Rq?=
 =?utf-8?B?VE5hQWZ4d2NmV2VTa0NRTDNyQWtUd1ZGTVo3SGNrQTRhWTZXZWlkRTN6ZVFs?=
 =?utf-8?B?ZjBVUWRKak9PZ0U2MnEyOFZXSWdJYVM4d2p2MDZFUzRnOXMrOWVyN09OcVVI?=
 =?utf-8?B?Z1Arb3M5Z25SdStvR0Q0b1RGbGRpNVQxMVM2RkNpZHF5SU4xOGhTZDhKVDZp?=
 =?utf-8?B?Vkd3dE1rdHlITzlVUldhLzJwWnFZWHdoSkc2N2x2T2lZaGMxK2dBaVE2REtX?=
 =?utf-8?B?VVVTc0pQV0NObUk1Rlc5M3NjWUUydFp3YnlkZ21nR21FcFg0RU03NVBNdUJO?=
 =?utf-8?B?OEpDbDhxYW5rM1R2ckxKcW1UTFgvOWVEMzh5WlI1MnRGTytLSXR2K1ZncFJu?=
 =?utf-8?B?WVUvSElhQTFNamtsKzF0TzJmQmdHTHpLcmdta2gvMENrN0cwV04rVmNyZ1hF?=
 =?utf-8?B?NlRlbEhkS3g0cXo0eWJyQ0c1aFZ3S2x6RUZsRTl5R2J0ekZrU040ZWFqSjUr?=
 =?utf-8?B?ZVovMDdkc2lwdnIzT2RYT201YXhLRXdrUHcxQlNzMER6S3FZY0JMcGY1elRu?=
 =?utf-8?B?ZTdYd3dmMFBGQUpneENyUDNLSW9xS2Q4ckJySXN4T3Y5bWNtMUJiK2xKK2JU?=
 =?utf-8?B?WjNBcTBoYXVIODgxYmxvMmxpSGJsMUNUdTdpeGg3WGlvWjNKTEhheWhRVFlC?=
 =?utf-8?B?UDhrdHI4YXIxRE8vejhIQXR1S25rMmZPejRYUkxoNWRtMmo3Ri8wTTBCcVpB?=
 =?utf-8?B?NzMvSWdXN0hOS2F3ai9KclhOOTVxUzYySW5nUzlUcklEellwWnJta1ZUVlFt?=
 =?utf-8?Q?NaCiD/9/v1ob1dl3BV58im3Hx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3517bc0-49c6-483f-a0a4-08dd47727525
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 12:25:07.9896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHsRTrW44uSCqhYd9IcXht7ZJUDLaKxIbGaTyoUHXpWRL6yZq5AXFEOS1BnzUdHVFdtOMZcnZSqeIuyOY45GcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7659

On 07/02/25 17:46, Cristian Ciocaltea wrote:
> On 2/7/25 1:55 PM, Mukunda,Vijendar wrote:
>> On 07/02/25 17:16, Cristian Ciocaltea wrote:
>>> In some cases, e.g. during resuming from suspend, there is a possibility
>>> that some IPC reply messages get received by the host while the DSP
>>> firmware has not yet reached the complete boot state.
>>>
>>> Detect when this happens and do not attempt to process the unexpected
>>> replies from DSP.  Instead, provide proper debugging support.
>> As per our understanding, before FW boot completion there won't
>> be any IPC responses sent from Firmware.
>> In this case, do we really need such a condition check?
> During the suspend/resume stress testing I was able to get this kind of
> messages, and that's the actual reason for introducing the verification.
>
> Also it doesn't seem to be uncommon, e.g. Intel HDA IPC also provides
> similar checks.
>
Could you please share reference logs to know which IPC messages
are being received before FW_READY message/FW boot complete?
>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>> ---
>>>  sound/soc/sof/amd/acp-ipc.c | 23 ++++++++++++++++-------
>>>  1 file changed, 16 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
>>> index 5f371d9263f3bad507236ace95b7ef323c369187..12caefd08788595be8de03a863b88b5bbc15847d 100644
>>> --- a/sound/soc/sof/amd/acp-ipc.c
>>> +++ b/sound/soc/sof/amd/acp-ipc.c
>>> @@ -167,6 +167,7 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
>>>  
>>>  	if (sdev->first_boot && sdev->fw_state != SOF_FW_BOOT_COMPLETE) {
>>>  		acp_mailbox_read(sdev, sdev->dsp_box.offset, &status, sizeof(status));
>>> +
>>>  		if ((status & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
>>>  			snd_sof_dsp_panic(sdev, sdev->dsp_box.offset + sizeof(status),
>>>  					  true);
>>> @@ -188,13 +189,21 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
>>>  
>>>  	dsp_ack = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + dsp_ack_write);
>>>  	if (dsp_ack) {
>>> -		spin_lock_irq(&sdev->ipc_lock);
>>> -		/* handle immediate reply from DSP core */
>>> -		acp_dsp_ipc_get_reply(sdev);
>>> -		snd_sof_ipc_reply(sdev, 0);
>>> -		/* set the done bit */
>>> -		acp_dsp_ipc_dsp_done(sdev);
>>> -		spin_unlock_irq(&sdev->ipc_lock);
>>> +		if (likely(sdev->fw_state == SOF_FW_BOOT_COMPLETE)) {
>>> +			spin_lock_irq(&sdev->ipc_lock);
>>> +
>>> +			/* handle immediate reply from DSP core */
>>> +			acp_dsp_ipc_get_reply(sdev);
>>> +			snd_sof_ipc_reply(sdev, 0);
>>> +			/* set the done bit */
>>> +			acp_dsp_ipc_dsp_done(sdev);
>>> +
>>> +			spin_unlock_irq(&sdev->ipc_lock);
>>> +		} else {
>>> +			dev_dbg_ratelimited(sdev->dev, "IPC reply before FW_BOOT_COMPLETE: %#x\n",
>>> +					    dsp_ack);
>>> +		}
>>> +
>>>  		ipc_irq = true;
>>>  	}
>>>  
>>>

