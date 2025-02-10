Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644D919342F;
	Mon, 10 Feb 2025 11:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187677; cv=fail; b=DxOdFM6uhw3scGogicDLJQwaE9fMB+k7SOMIoUcEkHJ2ZlysxrgNg+zlOJdRRqAHnQoCTAQml5QkzJMUUVkFWQcUzq71rRIzpAe74p+E9I2aJvyn5TFAQAeY50JDZXFun6nGhuWcGj+Id/DkCb0E5gM8TPDnSrr8EqIo5XsIFgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187677; c=relaxed/simple;
	bh=obJa4DHHpdpjoI5BIak4Tcbnm5B7reTjJV0bOwm8PWM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XLuo4ngjG+OTFQrvxB6O9T/HI9J/Vae8ApSKAOvwELKaK3FaYsivyMVCm2q9kDRbTHY+eF1lyEMU57ClpFC57kWKrcMKp1DyzMLL6EDhgwaceDvJRDoiPuktDLQLXnMYobtH84PfLX6r5QLtZOdrC6MWCZcknZo7Gwsm0SpQ1Yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HsazvXdQ; arc=fail smtp.client-ip=40.107.94.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HsazvXdQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2Xom9H86raMlCrj4CHSCdEl/JR3yVJMHPlQVPndR7nVCm/KPUOHR1/15bkbKHpEAtTSzkLN8bwMe33WIOYy6RjtPs/8gGBALRhjD2BxGCD2JZwh8ZuMpiUs6F/aIJQd1a+TIkozPy6WapyM7OEDqdL/e7qKz9avP2qCitvJxCDSI2lLuXurKFVJAGo/U1iVzMUKOBHGiP9SGrZX4t3ECSgZRJ1nMgP0AXpWdxFKN03SSmzFWFXnH26OvDesNNUMV2FaLcytUp85zspr2Yg5ogIXOfI3JL3/6fPi8DTtJX+whpw1Ap5r5SHxE0m/HW9JTUN7pQG8q+awuJgnV5V7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gioqdzcrPjecq5OOuVi+CZ0IJWqAQAd7eCwcvSsE8fM=;
 b=etWa7xNZ7rcm5O0atXRHJvnFaz4m8gmw+eiA4WNKjQN5wPlxYVyjVSwMQKWd3VeSmLp6T/gss2h7d9B1wqio6K68sLROrfHHDnzGIvGuCw3ZmrjZuaBqW99GspiWk899XZ32XtXq6j9BJH5cxdES4JlISX2wVjMZnQg3HXW2QYypXsRKUOXv94eOPBcJGjiFx+X6PXjTssqJzpLhQEViPulNdFLqJPurglV6JKNgjgDzQAEXpe+A43YLLyBH7gIQHC2pm5jKIGbICc3Pwxuu4hw+UJxpEPCWbGNemZ3z7pX0JazGc4XzzhZmKZ8MOk8OsYAkNGTd3XY5CamNUW413Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gioqdzcrPjecq5OOuVi+CZ0IJWqAQAd7eCwcvSsE8fM=;
 b=HsazvXdQJpXydujwkrqlkt061JDWE9VEjMiuW9rse0cmLpYGhjU3GuCHTLmRv4sttfwRaVfxOXXJhbdwtCAq7XREsqEYFv4hpcIYB5osJIzr+4yHz2wPn7+bsY3QLKmH/464Ul0OepONLfZ+oX1iVtmEQijsen7S+CiwoctUKWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by DS7PR12MB5768.namprd12.prod.outlook.com (2603:10b6:8:77::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 11:41:13 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 11:41:12 +0000
Message-ID: <c9bb4004-4467-43a2-971e-813f5f9bd558@amd.com>
Date: Mon, 10 Feb 2025 17:10:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: SOF: amd: Add branch prediction hint in ACP IRQ
 handler
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
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: kernel@collabora.com, sound-open-firmware@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250207-sof-vangogh-fixes-v1-0-67824c1e4c9a@collabora.com>
 <20250207-sof-vangogh-fixes-v1-4-67824c1e4c9a@collabora.com>
From: potturu venkata prasad <venkataprasad.potturu@amd.com>
In-Reply-To: <20250207-sof-vangogh-fixes-v1-4-67824c1e4c9a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::17) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5951:EE_|DS7PR12MB5768:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c35b2b1-0048-411a-28eb-08dd49c7d1ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dldQWXhuUlpWVjM5NU9ySmY1cHFkTVFSZzI4cEVueTFDNGpLUGIyNnJGbFdN?=
 =?utf-8?B?cStTTkhLelczNkJQeUt1dlVMejRhSEgrQ1g4enh1ZUR3N011RFM1SkxsRkRO?=
 =?utf-8?B?TWFra2Qya1U2b3NuTlpyblFZZGlka1Z0UERxVEhhN3c4ZTBzejhLcjJIeG1O?=
 =?utf-8?B?VUowRnZnd2FqTlMyWGtvL2pSN25Jd05JRE5Ob0t4TzJrTVBONitUeXkvRHRv?=
 =?utf-8?B?ZGJmQUVLaVFqeDhSQXhVdEFIM05hcUxYb2lsNmlWalBFcVd4RkxBWHFFd2JC?=
 =?utf-8?B?QkNSbndLZ2NvTDNSTjdzUmpyMWduK1lvWjhMb3RUVXBJcGdGeUFITTZtQ0JB?=
 =?utf-8?B?azVqbFpOcFBIK1l4RUw5eDc4MnY4dThmeWt3SmlzMlJ6dVNITm5BTmJIN24x?=
 =?utf-8?B?NU5kYzVaU3V6TVhpYkY5VEJlejlTZFBGS2toeFpCQVJ3OEVBeldvQW9salcr?=
 =?utf-8?B?bURtNHppa1ArRW1sd01obDI3cGR6KzY1d0w5U0V2SmhoV3RMRE10ZXRQQzZC?=
 =?utf-8?B?S0FmWTZCcUo0UzlIZ2FyV3Z6ek5vaDFhV2hJNVFJZjN4Zk1XQXZhdXNpL3V0?=
 =?utf-8?B?UUpadGRFM3dDQXpLYUREN05pQWhtSGxPYmxYdlhBTWsvaDB1OG12dUNhZWNH?=
 =?utf-8?B?cjN4TzkySk5KL2lYZEtCcGE3WEloZmJSdDZJYkZEQjJTazdCTHhzTERaUzNV?=
 =?utf-8?B?cFNpM1FUMFRkdTRzWGcyWGFaaU9hblVhNXN3eUdwcFRBbDRRWHFHWG5Yd1Jx?=
 =?utf-8?B?Y1RNczg5Z1lwM050WDNkSk00Z04zZE1VWExnb0c3dTF5cEQ2M0RLNWF4WjhK?=
 =?utf-8?B?VFlBdXNUOVd2VHZLQm5LTGQrUHV1enRhanBBT1lJWnRha2YyWVB1MncraTM1?=
 =?utf-8?B?OG13ZzJRSlVMNHJpTEcwazB5S1FheFVXdnRmVzVFaEcrRDl2YU5WeU9XYmJL?=
 =?utf-8?B?bEhHWVRwSnpsWGJjY3Z6SWQySzdzbGZiVjNFczJVRFRodVRPLzF6bXRaQmEx?=
 =?utf-8?B?NlpvRnBIOC9vZlZWdDFLZzhQaHcvUVBCckIwcDVYVGFxN2M5STJ3SjVCM2hk?=
 =?utf-8?B?UlB5NGE4Q0lYb3N3Vms4TU9FczFTemd0dVIxbE90bzQxNkovSGF2cnludEZs?=
 =?utf-8?B?RWJqcmhLTE4vV0JsSWhJaldiVUpMWXB6eHkvRVJJZUcrTDFId2luQ1NqTUNv?=
 =?utf-8?B?SW5tY01IM2dkT1ZrdVIxcFRudUYzSmoyM01HeU13djIzbGF1VytCSjlzcTNI?=
 =?utf-8?B?UW5nUU10NTZtOG42VkhpeWNSZm9DamlWY0djK3hJL0NaV0Y2c1hpMDRPT09l?=
 =?utf-8?B?VExYd0NVM1RUWVpSaURXVXNyYy9TSGJhRmlxenBDWlVReGhlalM3ck1JZTNI?=
 =?utf-8?B?NE0wL1JwZ0t2bzFvRSthOHM3d1J0M1VDNy91a0FkWXpsZXlQbXFmMGJFaVZK?=
 =?utf-8?B?aHdVNVNoUDhabkNBQ0psUi9kZ29uUHJkWnBJT21JRmNFOU8rVkk0Q0l2VjBw?=
 =?utf-8?B?TDVuSHRCczMrZ21JNmlHWWpzVTZ6c3FmVk5aSDhNT2pMNGxFMmhlclY2UGFG?=
 =?utf-8?B?NTJldklmRk9CN2FJclI2T0VscGNRZURCc05HdTQrNE1qdlI0ejFQWmxFakx1?=
 =?utf-8?B?a0VhYXBkbVdrVFhqaDJkaERpSG5hOUV0MWNia3B6bitQdzExNlRJczI1TTgv?=
 =?utf-8?B?MXVkNm52c24yVEpFTHZLQzI5cldhSmpBd1kwWWdmZ0RBRGJRRmx3UXhZSHJ4?=
 =?utf-8?B?K1BxZmh6cmk1SnJNSmpKM2RtRGFlOW1BUmhDTjZiYjJlVEs0L21sU21oTkl5?=
 =?utf-8?B?YzRkcW9vUUJRdC95UWZzRUNjOXlJWkY2eUpFM0pZdkRubjkyeno3eGtYYjF3?=
 =?utf-8?B?alNpaGVTMDUvRktvN3NrRXJZMis0QlJQcU1TSkpWMWk1U1g3L0t2QkRkV2c5?=
 =?utf-8?Q?jwxYHquNXSo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5951.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE1iaEtQQ3NsbUtZYURYdEhBb0lpQ2JKQXBGN3dxc1lIaUJIN0REbktoVUcr?=
 =?utf-8?B?T2RmeEtWU0J0eXUvS1g2OVNqREpka01XNk01SC9kZ2p3Q2E4dmJSOWI4L3Nx?=
 =?utf-8?B?OEZmWDZGL0p6WllVWkRBellnK3ViYlEzdzJ2OGlWMTlDcXBPemIyM1JPTlBy?=
 =?utf-8?B?Rk1pWkN5L2FPalY5eGk3MnYyQ1FQYitzc2NVVXpqQUhDZHhPeGZqd0VQaWE3?=
 =?utf-8?B?T2VSUDFnMWZRNXBublBENTlxcnpOVWVZdXJxTExIRDYxcEtEc2dtWjZnRm9k?=
 =?utf-8?B?MVV3d1BTUENJczE4a0VUWmVkLzRuZlAvd1BtZGVhdm1yMzV1T0cxT2FJZC9p?=
 =?utf-8?B?eURxNnN1SzJLZkZCelBSeFp4R3o0MWQ2eng5RjNWWHIrelhLbVIrTHdva1Bu?=
 =?utf-8?B?ekJERi8rcjdGY01uQVdzc2JMWWkyd0xIZm1vUkw0cGxwV3E4NjBNdDZwbHl5?=
 =?utf-8?B?Ri82U0dkN24yVUhQWW52SURWd0taS2dFUmsvRUhlL2wvVXJJWE9ZNzN2OGNw?=
 =?utf-8?B?WVVDYWMwSU9ES01wZWQ1b2pJYXpPaW1kT01sSlRBeGtNc0NsNFZHYkphS0JK?=
 =?utf-8?B?TnNiKzdXdmh3bXRsTDlmcFRhMEpqRithaWpvMG8wUEpwQWlFSkFzbm94KzVm?=
 =?utf-8?B?ZHU2ZWlxeUVwWDlLeUY2SjBvYm92cGl3SVdWbFZLOGY2U3NjclNMbVQ0U1g5?=
 =?utf-8?B?WFZSV2JoakZFKzMvM1g5c1MxRS9QNnNxeUErbTRLZHZrVFhoSW5vajNDaUI2?=
 =?utf-8?B?NVhGcU5GdHB0eVFSckpZaEpTM0lzM0JZd1IzZmxSUjdNc2QvTEo0TEYvSlZ0?=
 =?utf-8?B?LzdYb3IyZUc2aWJwbnZJaHNmTHpJLzhNdzFabDMyeHl0Smp3bUNESEVqTG56?=
 =?utf-8?B?QXEvUVIwSGVmZGlPWDlHb2VyQUNqWUI3OHg1NUh2M2lJVEpyR0FPTFBOTFBv?=
 =?utf-8?B?Y080WmhkTk8yL2pvaW1mRHBpT3JWQm5CNG53NkxXOHB2WENHcTE1bmlpV2xl?=
 =?utf-8?B?cDZRWG1QcGZUSXlOR2txUFRJQ0dobEFMd0JXSzdyTHN6SGVtcGs1L09lT0JH?=
 =?utf-8?B?cXVobkJCanJEODBLdzZDK2M5WktGenRCMVlYZFRqQmswQmlwZXl2UloxUWpY?=
 =?utf-8?B?NEtiN2dORnJWNlYxeHNUekJTUWowUEF6RTdZaUhOcU95Ti9xOVhxQlR2MHhX?=
 =?utf-8?B?OElHRm5SMjNrRm1xYmc3YStSWTk5aUs0NERvWkRtdGNMSlhKMzNVdkJxSm9k?=
 =?utf-8?B?Unl2dVlaeGZEQVkrZTF5bkNRODBBOGZkMms4VXBLYjM4d3lHckE0OEZzOGo3?=
 =?utf-8?B?cDZ6NHJONUpGREpqMXc4eEU3NUxEZHo2MEx4S3B0akExMG11MDd1WEJBdUsv?=
 =?utf-8?B?QTQwOEtMN2lpYVJvRTZranlwQUlPMitYYzh1dnJ1TDhXN204a0YwTTZhSGtB?=
 =?utf-8?B?ZHVGbys2K0RQYUpLMVNPTlRNSE1COGE3dXJvVHBrNUh5dTRWTmdKMGp3b3ho?=
 =?utf-8?B?U0JsaTA4a0p4bGVYUU9rY0Fua1A0RUFFeUNqZm5YRk55SEVJcmpLdVh4WjMy?=
 =?utf-8?B?L214VjR0NDRSL25ZSFhaZjVKc09VT2JTOVplVFF1RVk5ZWdVQWd3OHpzZ1lw?=
 =?utf-8?B?VWZJUEdFa294ZGtWZm5oc1g4MklYNFRmdmpTK0ZvOW5OcXpPZ0R1ekhEN05k?=
 =?utf-8?B?SjFXeUF4cklrRnNnNzlBMnJSdkNMKzIvOVU5UHI1dmtJanl5NGd1Qi9jOWty?=
 =?utf-8?B?S25yQXFQUjRhSmVwWGo1Yml5SHRmdUYzMlJ0M0g0SmYzUldDbUNBdmJ6UHhp?=
 =?utf-8?B?Ynk1NXpWbEp1MXNsTjJ3cGg1Qmg1NFFxSkVINUpNUkE5ZEpmV1VWdHJmaTFo?=
 =?utf-8?B?SGxxcDBHYlNjTnI4NDVXMHhuNlZJRTBteXNUOFFVMkRuSUEzRytJTG5HVGow?=
 =?utf-8?B?YnFhZ29aMFhWWTF0YWQrQVFrTGVzbzdUL2ZhU3dDM2ZoZEp3SkVyVXVzbWxN?=
 =?utf-8?B?VnN3U2tiK3VoRkZWblZhZmxZVVpoZVFaby83UWFqUkJySUtVRDVweXpDMS81?=
 =?utf-8?B?amtEeTlqckwzWFZ0eHF5SUtLWkNQVmlvc0hDZDFwNE9qZ1NCczlreFZmL2V6?=
 =?utf-8?Q?Q/eB15P6ImtgJgyxdeZL9eaqC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c35b2b1-0048-411a-28eb-08dd49c7d1ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 11:41:12.9116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMvb/A4+oNVFxOkHbgsuv3DyFjlMe3E/G7EkTydV94QItlWy7iE8BO+43Lw6cY8zNCqLz4wM/kHEnhZY3+MXow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5768


On 2/7/25 17:16, Cristian Ciocaltea wrote:
> The conditional involving sdev->first_boot in acp_sof_ipc_irq_thread()
> will succeed only once, i.e. during the very first run of the
> DSP firmware.
>
> Use the unlikely() annotation to help improve branch prediction
> accuracy.
Okay.
Reviewed-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   sound/soc/sof/amd/acp-ipc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
> index 12caefd08788595be8de03a863b88b5bbc15847d..22d4b807e1bb75e6f4e6dbf161d79b1a43808004 100644
> --- a/sound/soc/sof/amd/acp-ipc.c
> +++ b/sound/soc/sof/amd/acp-ipc.c
> @@ -165,7 +165,7 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
>   	int dsp_msg, dsp_ack;
>   	unsigned int status;
>   
> -	if (sdev->first_boot && sdev->fw_state != SOF_FW_BOOT_COMPLETE) {
> +	if (unlikely(sdev->first_boot && sdev->fw_state != SOF_FW_BOOT_COMPLETE)) {
>   		acp_mailbox_read(sdev, sdev->dsp_box.offset, &status, sizeof(status));
>   
>   		if ((status & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
>
