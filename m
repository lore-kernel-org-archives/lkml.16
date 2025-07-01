Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398DB182D0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350234; cv=fail; b=uAQEiUMj0dk+yldf5c0CXjpp221GaN3W2SuzWMLpHOXPQ1/EOGu5MYsDOnxXHTjr01BZ0QlK7wTZLmxTI18LXkh1K/kVWeM0TSfXpNxf4TFb//PS4V1s4u0K8jAP+2aKndHjKNrh6YGviyn07fZ1d2Mz4yACCo95WZ7kYEQNe0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350234; c=relaxed/simple;
	bh=LZ3R7nSum9R4BwlQUjLkZL2+2kKoiM5hOGCCGUlBYBk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=adhMPwmCzR8zrfJoozT6CL7M5Jd/+NDzJQIvEwEKrDeR9GR4CeU406D7vYQuUejT4RMiU1TSsWOeNLxZY3+ti5PTRN+edTMi/KP7cGMjfdJwmrH53B9rTJNliDGQtx+xZQUP1X/L0s1l+VicJPE28mB5lwEQADGq8Qm6ipJdDzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=QW3swefn; arc=fail smtp.client-ip=52.101.65.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="QW3swefn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqAmGEbCe7j3yRCaLo6KRZ4hUcvZhJlPkVymvNrGAT0u5ae9hFYbZcKFOybuZSHupIMkhkhgkqxNqrCF4erVw7I1h6SqLtTeZJsXFd0R0+Q8mlksS2H/byzAo6L124bOKKB+2/WzPhF5/02Ko5sLKz/JAN257gFSJw2JqUvhA6tby7IacuZDcBYWPVt4Kq9uLgGZ4mHmIqcWGrbiCiAcD7pTXtwx/SPr7wzj9aafKQrF7SyWWjutJeguV6ZPtqxMK3PKwu3Io/ER/M6BOUrMyb8St4JoxYMflDhNX5dDxmW+Xw/DEiH80r6Nwr8xRO1g3lkZXjKo+0DcL2+8E05tDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vLV7fb6K3QeQ/3TeRDy6vwdl8/npRZPklqs2b9imB8=;
 b=JtEzUSkHwwrPBev76D29RqyhC2m9HIQRTVoJs5U/nNcfw218j7/Zzx9JKjS+zwNSWpfN1n8Idl0VKO0lkmRTbUXyGJtkiMjp9i1CcykwdW43i0fIA04v+aKjyuZWAHlzztLtaF8pUuiEQZbo4HYewAXkEFyOlR2SvT0HC3zCY4XZ3c8flCE4rUpfEvSXdfGMCLMoQZL0Yrt9BfDXo6c+hnSiMqlFy4wArSQ0MLxhzjQejAgzkcEI1UwOj5ExvGYVO7ICFiUkSxYkfZg+YTcNnoxY25sr3SZeUnjZL0xSmUaJ/uKEGIY3IkhWUXyTbzl2j7pv6HVku0/rayj9X7VhqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vLV7fb6K3QeQ/3TeRDy6vwdl8/npRZPklqs2b9imB8=;
 b=QW3swefnymwrcy3+xL9iVSWWRZE7RVFVByM1UxdpSO1KMozkTOKnNNzJ/+fYX+wfU/Li0HOl28X5Uc6e1jBmAr+uKeC1t2S7ClmsoHaZw9xQtGDIGMICIB/F54cWsJHhMTYx41Xp+ronL/q8q8pkAlg+mIku50LTiUXlkb7cxJ1AvYrwU4QCOF6eX7wf6hF7V9ZM494Dku/E8sQSeZ+NT1yTKIuCGL903SUxuAo67c83XMBIbDBUdAaYryk7i/vqvMh1eoLIP02NuRzivdiIvGQtR0jE+1SNMDq75Sb+MEH2jb9XFSAheTlimDusuMGiffTrvAHX1jOhLJodmiCGpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from PAXPR07MB8771.eurprd07.prod.outlook.com (2603:10a6:102:246::20)
 by BESPR07MB10746.eurprd07.prod.outlook.com (2603:10a6:b10:ec::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 06:10:29 +0000
Received: from PAXPR07MB8771.eurprd07.prod.outlook.com
 ([fe80::e125:c4ef:b872:5c60]) by PAXPR07MB8771.eurprd07.prod.outlook.com
 ([fe80::e125:c4ef:b872:5c60%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 06:10:29 +0000
Message-ID: <9dcfe1fb-0361-4d13-a4d5-fbc274f68db7@nokia.com>
Date: Tue, 1 Jul 2025 08:10:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irq: add support for warning on long-running IRQ handlers
To: Thomas Gleixner <tglx@linutronix.de>, anna-maria@linutronix.de,
 frederic@kernel.org, mingo@kernel.org
Cc: akpm@linux-foundation.org, bigeasy@linutronix.de, peterz@infradead.org,
 linux-kernel@vger.kernel.org
References: <20250630124721.18232-1-wladislav.wiebe@nokia.com>
 <875xgdnsmr.ffs@tglx>
From: Wladislav Wiebe <wladislav.wiebe@nokia.com>
In-Reply-To: <875xgdnsmr.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::26)
 To PAXPR07MB8771.eurprd07.prod.outlook.com (2603:10a6:102:246::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR07MB8771:EE_|BESPR07MB10746:EE_
X-MS-Office365-Filtering-Correlation-Id: 6860cf6d-43df-498d-f579-08ddb865fab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0Z0a0VZZWtUcmZLY1JZNlRoN3NRSTcwczI3ZjZQZjlWNUppRGdQVnFNeXc5?=
 =?utf-8?B?ZGovZFJTdHdxQUV0YU9ISlJnUHQ2UW1yS3lsQTVFNm1Ic3hxc0l0TEhIckpQ?=
 =?utf-8?B?eDJ0SjE0cjBuSWh5dWdBVWFxbm55aXNmak5pWlNIWEZKT2dTYWozVkNBeDk4?=
 =?utf-8?B?ZnZDcTFHS1p6MnhrYnM5M3NMYmxLcmVWTDg4M2FwdDB4Z1FJVUZyUU5LaXpR?=
 =?utf-8?B?YTg1S0Ntb01tSWZmNmtUbWJ5WVlqbVJWN2tXakVxQTA2VnljS3Z2ZGluRzda?=
 =?utf-8?B?NE9sUE9BZzFRb0F0UXB5T3Y5VkN0K3k0Nk5JdzU2bzZndkNrTFJqUmJtOTFx?=
 =?utf-8?B?MXFwRi9lOG55YWhhYUJDQkJOaFZSdHgrbVF5N1RJYUFhLytvYkNFU1EyUnpi?=
 =?utf-8?B?VGRCeTdjUnNHdEtndDhxRnhrbzJXTSt2R0N0a01pcStDRXRqSWpCQjJCMTAr?=
 =?utf-8?B?Q01uc1o0NTJBRmQwTWcrek9hUFFvVlBmTlgvdGJpVElXTWppL2I2YVNuTGNy?=
 =?utf-8?B?YlpEMUdZbDRDMVIxazRWMDkvU2NyVmtKaXJIWFhMZTF5ZThXUmVEMEZGeTYw?=
 =?utf-8?B?YzFoNmJKbTRFaXpOYWorQXBNaEhmUW43cUhUcW5RSkRnY2tSc0VWT1ZyRkVw?=
 =?utf-8?B?R2RON3pleFJnNS9iMXJXTHlVejVzUVhaMjJqczlwNTNQN2thQ2EvN3NEWmNZ?=
 =?utf-8?B?UTk4dmYybXdTYlpFQXhUWW0zTFdDSkpTbnhrQlNXZ1o2bC8rbE1zb2VHbVVE?=
 =?utf-8?B?T2psd3cwV2NtM01pN2oxK3ljbVdxRGJKRUgwWTBWNjF0bnBWTEFsTmQrMXUv?=
 =?utf-8?B?REVhMThSRFBrTmZpOTdGY0tDUFpaSDBMb1ljUzlVdG9OMlNKSm5GNnZxV3Yz?=
 =?utf-8?B?cXZxd2JhVEdKblNnQkhPU1d2ajQ5SDhGbG5DRmZYTlpUZ3F6WU1MZitxVDdB?=
 =?utf-8?B?NHp3K0czcno4bGdzcUpERWlJTER6VDR2R2lpaXd2SGV4TUlYOHdyWEttSndl?=
 =?utf-8?B?MEhEWTQyZHJCamttUFNHSGVNR1JUeXJ0RU5tWHVZWDZWOG1VbVVkZE4yMDR3?=
 =?utf-8?B?bUF5Vjg2Rm1VWkVQQnJNYkxrSzduZlFwT2x4QjVEQ0NIOEwrQzJXa2RwcDBS?=
 =?utf-8?B?TVhuVGQ5bzkvTUVCRXB1TjNBa2FsTmFyVENxNkpnY2kxT1lNbktRZGRMUVVJ?=
 =?utf-8?B?VGszSFRWUFczSU1yU2lMcTJVT2tNMTZOUVVCcHpqZDdEZ2p6WmU5OFYwVEFX?=
 =?utf-8?B?L2NucDRubmlueTJBdFZFZEQxMTFOVWplK3pwUEU1UWRrbUFsSSs2YlZBWmVW?=
 =?utf-8?B?Y3BkdUMvVjNYaFRhZ0ZqY2FGYWFHRlQ0VW4vK0ljOE83ZnlXK1cxak5yU010?=
 =?utf-8?B?UlROaFVlOFErN2sxaWRZNHUvUkl0OGVLaEUrTTU0TThsUE9uNSswT0sycksw?=
 =?utf-8?B?K3lGRjdnWnYraWhmOGFpdDJQYnFFUHl3VUNjenlLVXNmWUsvQTk2ZzRjTjFH?=
 =?utf-8?B?VG0vT0NrVG1UdTBFOTZhOHdtdHZhVDQvemFPQ1R6K2t1bzQ2Q0xFcGxBdXRM?=
 =?utf-8?B?QUd1dFpGY3BnWXRQclhWNUIxczNoV2NQVUdHVk1kNzVjMCtLR1FYanF1eTlB?=
 =?utf-8?B?VHZtcmluRmpKeEV0MXJtY2p0bWRac2JZUXYvVENSM2RPb3FSSFZ2UExDWGkw?=
 =?utf-8?B?ZDB5K0RrbGNubCtYMlJNYlZkTDQzL05GYVBWRzRVT1NzdUZ3aGpDaG5yZmIr?=
 =?utf-8?B?QmwwMXR6N0paMXVsNGZTRG1VS2tCZlhGWHlNSm9hY0JMeUNYZTFwRkRzVVA0?=
 =?utf-8?B?RWt0WGRySUFZS3lCb1dCb0hUMWJ4TS91c2VzTU40Z2JpOHE3N0lMWWUxZVdH?=
 =?utf-8?B?ZSs0VlcwVEpEdkhhSGF5VXdRZmY1OUllWi9qcWNVVi9KYU04WHJqY2hhRzRY?=
 =?utf-8?Q?c5jykVCDmo8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB8771.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkJTcTk5bDNudnIyc3pobkhJeXZrZVg2c3owNFBOZFJCVzN2LzcyTGY4b29u?=
 =?utf-8?B?djBHeVpkVk03NC9ORkVWSEFkMkF6ajBNVkZNMTM4N2J2SzM3NEF0ek1oUWZl?=
 =?utf-8?B?YlB1bklPeFZIWWZueUJFZUVuZ0JiazA4U09rbDZqN3c0ZTlYRCtOS1NFZVRj?=
 =?utf-8?B?SVNPZjg2TXNaeGk3d2l4MWU2Y3ZybURZR2ZhdEFkRWJLS0lNcGkyY0dzWVBM?=
 =?utf-8?B?anlLL2FTSXZLQmVnWmJqVW9JN0gvNUJZcklXTHlGVlYwNVY1UXdrMzR3cGRl?=
 =?utf-8?B?dGdyWkZRQkd5OC9CeHBnOGR2TVZpVmtnVDVBNEg4cllFbE1zZlhCdERqT3pv?=
 =?utf-8?B?VVYvSWxidUVJOHZDREtPZWZZaVJ2VjgrQWFYeTNJTWhTTlNIZDJJMXhzeXpr?=
 =?utf-8?B?bEZLRmpUWnBIa1VjWjBtN0VqdUFpdEFaTnNJWEFQK1VkbFhNSFFHcGNQQUli?=
 =?utf-8?B?akxJVDZWalJTVEJPdnUyZlZtUkRsNjB4M0h3aDFYaTU5dHFkcmFuclZTTU9h?=
 =?utf-8?B?RWJ0bVF1NlFGeWZ0a3Irbm5FVnVLa0FLcmlYOXJJaGlPeGdkSGNuenlQeitZ?=
 =?utf-8?B?RjV4R2hIVVBYR05oRzEvZUdVbDlWRWloQlJaQk0wQVV5LzNDeGJaZXVRTEVZ?=
 =?utf-8?B?U0U5UDdoeG1EZVlmN0NZLzNySnRUeWxwd3hrM0FoZVAzZGh0VWgrOTZYSFBH?=
 =?utf-8?B?MDhsSXI1REdsNU81S2U2NHpGNzZyeEE0U3JOYXN3OUw1Z2xGajV2WVBSdlR2?=
 =?utf-8?B?aTZlQzlIcXoyRXR6cmNZcXY1Q2p6SmFtNEcwSmlGeGhGcnFkbDk3Skc2eFRi?=
 =?utf-8?B?Z1lyQVV6N2FidXA1eFo0aTFMMkpwaFAxZFAyb0pZaTRXZWpNVVE1bFNvdkhj?=
 =?utf-8?B?azRiRDlKazV2UHFVUkZuWWlyVzNzdEs4MGtvUjc2bjVYN3ltK2o1U1lPa3pz?=
 =?utf-8?B?amtCTGppOHJJWjJqakw4bTErWUV3R2IxZElZbnN0S3lJRmFORXF1TVQ0cTQr?=
 =?utf-8?B?UW1QKzBvOHRoaExGK2tFVG9kZHdMTlE1aFRHOFZNeDFLVGxGU0VkUjFUZzRM?=
 =?utf-8?B?WmtJM0luYlh0QitBQk9kMlJ5VW84Y01tZFNJdkNSTGJNMVRlU09aWnh5VUtj?=
 =?utf-8?B?RHlkZG9uZUttT0ZYakpUQXRMS0hDbDRuTW5XTkJmempLSjc2Qm9JcEZ0aGFM?=
 =?utf-8?B?KzlJbEtWUzVzRmNEU0VNZG1HaVJpR05hUm9EVzhKOHZlRDZaZEViSk9sck9L?=
 =?utf-8?B?QWd3TUVIZmpEVVBmZGVQMHBHY2NTU3hjclFCMWlSaFdmQXFDR1BVMmlrMVAv?=
 =?utf-8?B?TEZ4bDJab2RkZEtNTUcwOW54VVdKNXVzZnFqaHpJamYzZUZWWFVOazZPQ2Jt?=
 =?utf-8?B?bVl0MG9wWUZJRXNIaUdQVU1JL0xubzNSREhneUVIdlZNVjQ0L1MyY1NSMUlp?=
 =?utf-8?B?WUJhN3Q1azI5SnJFWE8zRnZ1VjRRNDA1aFFDbzYzVkRneko1ZVNzTTJDalJ3?=
 =?utf-8?B?QmdYVGx5aTRZTFJVdDlkNjdybkZYMlBNVVQ1cENsUHpDbmxVVUg2bC85TXh2?=
 =?utf-8?B?YzdURFpoQVQzY2YyLzlneW5XSUYrMXNhTmFvdFRyelRLQlI5NllMWnhmUUlK?=
 =?utf-8?B?T0JydWxyU1gvOUZnR28yaFpyRkdjV1JvcVJXTTlNYVZSck11dnJKN0JmR1pY?=
 =?utf-8?B?RzZGbVpZUEk1RHRaQlBWR1hueE5IdER5cFhlQTBmSHJ4MkxGZElFOUFvUG8v?=
 =?utf-8?B?M01yNU9ZbUdSd1g2NjZNanNOdVBVNktjTEtnUnNLVFV2UlE5RDBuUDJqOVpo?=
 =?utf-8?B?VXpwVjV1NjVjWG5tL1hwSHhvR2hVam1nTndMV0lOLzZWL2FVdVBsTjV1Ujgv?=
 =?utf-8?B?SnNPY1MybXREWTJ4ZGQwMll0dmNZZHJVZlhhdEplK1FoZ2gvSlVGRkhCRGRw?=
 =?utf-8?B?VFhCL2dTRFBvTUMxR0gxYjNmMmp4TVA5cU9lVlFMOGJhZ241bmdzQ2FSQS91?=
 =?utf-8?B?dytSTUZQMHVjdjhRS3hSUDZUSVgwaUE5TFhiUWpZWU1xYnZ2ZjRiNlpvNVJq?=
 =?utf-8?B?OW9vWisrYVQyVElhU1RtV1RKM0p1bVFJWm9iSUt3dFhLVUZ4YmxsTC9PNTFO?=
 =?utf-8?B?UHpnOUJIWjJhRDAyemU1eTZrVXl1V0tQaFF0Q2c2Z09Sckk4ZXh3enBrNktk?=
 =?utf-8?B?MlE9PQ==?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6860cf6d-43df-498d-f579-08ddb865fab0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB8771.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 06:10:29.4746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqlrOTBeLExyJSKnwN84lo+f4lInizrWqZcUf9GEWQgG3XuWKxLdgOHcQODUR9y5VyHV1gv2Rngkp5ohX/cvCBwMf1ddVUYveo4hawDhoUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR07MB10746


On 30/06/2025 17:42, Thomas Gleixner wrote:
> On Mon, Jun 30 2025 at 14:46, Wladislav Wiebe wrote:
>
> The subsystem prefix is 'genirq:' See
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject
>
>> Introduce a new option CONFIG_IRQ_LATENCY_WARN that enables warnings when
>> IRQ handlers take an unusually long time to execute.
>>
>> When triggered, the warning includes the CPU, IRQ number, handler address,
>> name, and execution duration, for example:
>>
>>   [CPU0] latency on IRQ[787:bad_irq_handler+0x1/0x34 [bad_irq]], took: 5 jiffies (~50 ms)
>>
>> To keep runtime overhead minimal, this implementation uses a jiffies-based
>> timing mechanism. While coarse, it is sufficient to detect problematic IRQs.
> Define sufficient. That really depends on your use case. For a real-time
> system a hard interrupt handler running longer than a few microseconds
> can be problematic.
>
> So instead of adding some single purpose mechanism, can we please add
> something flexible which can be used for a wide range of scenarios.

the initial goal was to cover regular non-RT cores, as on isolated/tickless cores
we should not have device interrupts.
However, I agree we could make this more flexible for a wider range of use cases.

>
>> +#ifdef CONFIG_IRQ_LATENCY_WARN
>> +static inline void warn_on_irq_latency(struct irqaction *action, unsigned int irq,
>> +                                    unsigned long jiffies_start)
> latency is the wrong term here. This is about the runtime, duration of
> the handler.
>
>> +{
>> +     unsigned long delta = jiffies - jiffies_start;
>> +
>> +     /*
>> +      * Warn about long IRQ handler latency only if jiffies are reliable.
> What means jiffies are reliable?

there shall be a another CPU online with active ticks enabled
which updates the jiffies. Means, on single or tickless cores, this approach will not work.

>
>> +      * The reporting condition hits only when there are at least two CPUs
>> +      * with active ticks.
>> +      * Jiffies updates are stalled on this CPU until MAX_STALLED_JIFFIES
>> +      * reaches and a force update happens on another CPU with active ticks.
>> +      */
>> +     if (unlikely(delta >= (MAX_STALLED_JIFFIES + CONFIG_IRQ_LATENCY_WARN_THRESHOLD))) {
>> +             pr_warn_ratelimited("[CPU%d] latency on IRQ[%u:%pS], took: %lu jiffies (~%u ms)\n",
>> +                                 smp_processor_id(), irq, action->handler,
>> +                                 delta, jiffies_to_msecs(delta));
>> +     }
>> +}
>> +#else
>> +static inline void warn_on_irq_latency(struct irqaction *action, unsigned int irq,
>> +                                    unsigned long jiffies_start) { }
>> +#endif
> I'm absolutely not fond of this #ifdeffery and yet more Kconfig
> knobs. Something like this should just work:
>
> DEFINE_STATIC_KEY_FALSE(handler_duration_check);
>
>         if (static_branch_unlikely(&handler_duration_check))
>                 ts_start = local_clock();
>         res = action->handler(irq, action->dev_id);
>         if (static_branch_unlikely(&handler_duration_check))
>                 check_handler_duration(ts_start);
>
> Then have a command-line option which allows the user to set a warning
> threshold > 0 in microseconds. When the option is evaluated the
> threshold is stored in a __ro_after_init variable and the static branch
> is enabled.

all right - that makes perfectly sense as well. I will refactor it and provide v2.
Thank you for the comments.

- W.W

