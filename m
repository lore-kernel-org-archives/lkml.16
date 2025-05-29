Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2129.outbound.protection.outlook.com [40.107.102.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A60224AEB
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748536656; cv=fail; b=cgq9D7QElQIGXKQ2ouNjHIB6vkI33PXLlwDSnv92qDoHd3gophKdRpEitqk8ycdrCrboxr2yRG7nIDr3GHmWRG4klZ/aB6UGX7Hg0X8LtK0pVrB/UNttw4bmM/GpqoTpip2tkQ8E1ydg7AogT8RK0zcbbM0ZcI0eQxeeAetB2ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748536656; c=relaxed/simple;
	bh=//JLKkpNu3LYyIQGFwpRp7K0UERYTiigZoperEUPMJ8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IvDaAYKitJOEdxTY2tc9ycq9Ea7cGMDNnJqmXCnwDxyOLX5/XcDmwgIfCq3+UOp6sIHycv65DL6QX40C7I841Od6lx4oOyflSDj7G/KrKtSD97r5PBiih6u+BsF+1TOFfTpXiFYvrDNx7if6V4xp/ms1szkpgwSnRM4HNJzM5mQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=FAHXKYAs; arc=fail smtp.client-ip=40.107.102.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="FAHXKYAs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udXc9pWOhPbul023aSWRnE9Rvo5ynnVY7I3ZcxyTWP9c8eci3jHsE6F6Q8RNRSLveFBZWnr40FeAT6sAcOL1ZIasAxU6QHUejicF1ZPQDrxNThB/HDvq/InFlRWCyuJmPMYjiTv/6LwDBvVF4jMIt9DOzlR0t5QNbol6TZDgkIIU3JKKQI149ilv8kMk8MI+L4/oT8toSdtUFRwuCJahKevoTYGhs3B/a8r5F/6vGAb2CYbM/r8JqqPUcMCB8h9tVeBA+sY8xzyHSRE7nmwwjA8N908SjOqQaPhGQq2fbt+CWj5grh9eDBOTi+7qfePxte6ht838d0ziCwBUD+WlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqqHBy8515qqvxwUNr/Gwkq2Jm2U6Ll3exkZ+Nq6n4g=;
 b=e3wyVcLuRVRQrWwNuX/Mp6UnfW31324f21GwkEnL10VjpfZJjW51Epmg+SC+Xt2R/ZaYqYWWjqjUG/G8woqfSVe5pgqzeQosPLXBotu/wPD3RwIwQcWAXv0RJW1ko3w1CGazPv5aWwB93sWt1v57vSt/3NB+KSUdCu+BXq9grCiqxkV9Q0F6ExdQZZwxNcXj5/HXHJT05LM0j/FrdHL75D77pjqQOj4FgP+toi9QLIB/5hTo1cEijvD744AGFMSIS/cIFwv7o2BjRdNjqr/gvy8WDuSrvtBHd5gDoObWbfPC+aHsNppmbNg//U2+U2L5swdR/C0lIYn0iI7O4sRwXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqqHBy8515qqvxwUNr/Gwkq2Jm2U6Ll3exkZ+Nq6n4g=;
 b=FAHXKYAsJpRcex0hTY08nPlNG7J3zwio928YSREhWI1rcdmtrCmtpcghlt3o+pl8cnGzu0gkjog8qoHmM9NphhmsX/a9RW+oxo3WWZJDsCBCngc5j206S7dljl3HX4h0nj+E4pbmY+Qv9UHqxT1oxyWUI3sXc5gZsk+QODZ5y5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SA1PR01MB7232.prod.exchangelabs.com (2603:10b6:806:1e7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.31; Thu, 29 May 2025 16:37:29 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 16:37:29 +0000
Message-ID: <a27776ed-4b45-4269-9e3c-5ca1463e4841@os.amperecomputing.com>
Date: Thu, 29 May 2025 09:37:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <3750d3f8-17c6-4bb8-8107-215d442e4ec3@os.amperecomputing.com>
 <2fb974bb-1470-4a5f-90d5-97456140c98f@arm.com>
 <22b53cff-00db-48f1-b1e8-b11a54ebb147@os.amperecomputing.com>
 <4794885d-2e17-4bd8-bdf3-8ac37047e8ee@os.amperecomputing.com>
 <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
 <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
 <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
 <2ab5f65c-b9dc-471c-9b61-70d765af285e@os.amperecomputing.com>
 <239d4e93-7ab6-4fc9-b907-7ca9d71f81fd@arm.com>
 <1141d96c-f785-48ee-a0f6-9ec658cc11c2@os.amperecomputing.com>
 <9cdb027c-27db-4195-825d-1d63bec1b69b@os.amperecomputing.com>
 <e3e6a3e0-3012-4d95-9236-4b4d57c7974c@arm.com>
 <0769dbcb-bd9e-4c36-b2c1-a624abaeb5ce@os.amperecomputing.com>
 <f31792bf-3b54-408c-9deb-7058a79c60d4@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <f31792bf-3b54-408c-9deb-7058a79c60d4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR19CA0029.namprd19.prod.outlook.com
 (2603:10b6:930:15::7) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SA1PR01MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a81a047-241b-46bc-af1d-08dd9ecf19ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N21Udy90YWIveDdnUzlJR01UTWw0cnRNWllmMktDRFJ5QWZUcW9LbWZQWlRD?=
 =?utf-8?B?azA4NllQMGNFSHJUVjgyWFZKKytmWGttNSs5Qi8xYkw2Q2NwV3dqZjdDZkNN?=
 =?utf-8?B?RWdHNko4R2tuMXg4TGM4c0tGVks5YzJtbkdYUkRJempTalFxZW5EeXNiUEk0?=
 =?utf-8?B?eWVQZVVTcW0vdEJKZERKNnB2Rks5NE10U3VMVElySldZSmxIVzBwemhadXZE?=
 =?utf-8?B?VUxtcDUxSElvV0VCR3lLSG0rejJ4bHQ1SFRRbHVUeVl4THUzdVlwTWgzUWNR?=
 =?utf-8?B?Q0xLaFUya1ZpSVZMVFVyOVZnYkdpNWFXczk3U1dFZGtOekxZbjdyT0ZvZHlW?=
 =?utf-8?B?YVltUDN1bGpsRkRjUW5CRXFpOGJKbE1WTFU4QVRSTmErRzR3elRiMkViVGhE?=
 =?utf-8?B?aWF4SC96anZQUEhLand3cjFtUXFzYkxtU0hpZTdYRTVybTNzZ0lTeGVpZFlH?=
 =?utf-8?B?MmxCNExFaTF0bTNoNngxcWdsZDFwa0VqRU9reVh0dXRFZG9NSDQzbVNRcVVl?=
 =?utf-8?B?WEx1U3I0bEhFbC9Yd3lzRTJxL3RYMm5SUW5Qakg0ZCs1dUorTE9mbktaS2xX?=
 =?utf-8?B?NUpOKzVsZWdRL0ZQNG85YzdCR2FvQiszWmM0OG8zSmJLZDBocWVZWTRaUXpr?=
 =?utf-8?B?VjltWVBlNEJLaEdHKzRuZUhzNmtmQzVISkQ1RHluMlBXd3gxTmpJaFNURUN5?=
 =?utf-8?B?LzVYZHI5N29tTkV0d21UOEF1RmZMRytReGJWdFF0bmVIRm5rc0x3QnpSdHVa?=
 =?utf-8?B?R3hqNzBRTVVkUjFMYmtIOXhURUlHS1lBN2pyaTl3RFhNSU1iWWg3RE5kcklX?=
 =?utf-8?B?K2IwdHhzaFA2ZWUxY1pxNjlVTkoydjJLaTRWdUZJcFhZblNXN0ZzUk9jYWsy?=
 =?utf-8?B?RG5qZmRLTjNXbHdUcHVDalZaQWhsMEZPU21OdGx3b0k1M2w1Yzc3L1FSOWJK?=
 =?utf-8?B?N3EzWmRDNEl4TTZKcTBlaEFLM0NiOXV1M0ZXZ3RKQnhzckR4ekxhSHN3OENY?=
 =?utf-8?B?TVJ3WWJoMWhFWGFrT0RDTHZXdW0xWlVYdWJaTzc4a2xOWjdKWmtocm44bzhu?=
 =?utf-8?B?ejZZK0t6b2xrczQ4VVhTcFQ2Wm4zbTFWWVRTdFY2cW4vNVJQTndxcWo1N1lj?=
 =?utf-8?B?M0M3UTM3OFdwRkVkK1BlM1lLbG5wZEYxSHlDSHZObFRJUXBteXhIWWtObXl6?=
 =?utf-8?B?R1I1T2puOGU4TkU3M1ZvTGhxc1hPR2hKNnRVVVo5M0NVZTlFUmJBcnhkOWtZ?=
 =?utf-8?B?cjZIMHUrU0t0cW1lMHNhYVV6ODN4NEFDQmhvT0xxVHZzMU4zTjRrNHd3WXox?=
 =?utf-8?B?M1NPbUlOYTBlUmxoMWdTT0tINXIza1EybFhHMUZ4NW0yK2tzOVlqTlpwZHV4?=
 =?utf-8?B?UnEzMHJQYzRObVpqN09zdTJlTkhka0xiRFYrZ0ZCZ01XaTN6UGN2Znc1VjhR?=
 =?utf-8?B?QXV4WGxuNjRpZ2RHMVBlVExKemxSZlI2M1E0d0F6N0Z4Q1J1UHJKclZ4RHFo?=
 =?utf-8?B?a3FIMHlSS0psUytab3luSjVyamdVWEZ5T3hTSlc4S1UxY0RVR0plTGt6R0Jn?=
 =?utf-8?B?cE9tUmMyUURydndjdDhuUzlWc1QyZVRmbXJ0Ky82NXI1bHRYUmRaN3kxSnRo?=
 =?utf-8?B?TEpNMGpXZW1SMjVJdUwvYmplaWJCR0JENWFCVys1N3M5eGFabDBPT2VXSzdy?=
 =?utf-8?B?ZEZYRGlOam9jQVF2VW1FVWFGUStEb2pqcFo2b2pVUjZ0TVAwbERkcjltQjBT?=
 =?utf-8?B?RWtHVjRzci85b2xQTTRQUnRaU3RGTHoxSURhaDBJT3ZnSEEyU29tcDNNSk9G?=
 =?utf-8?B?bjVLUEdQYXBFMGNFRkNHQ3NBMzdxdlJmdWFyVi9FdVBPSVNTUHg3VDk4aGhs?=
 =?utf-8?B?d0VUMjFuSHJacHh6YW5QWWxUQUlKaFYya3pVNHE2dDQ4S3JJUkNMaGFVQ0Yy?=
 =?utf-8?Q?YdOD3AVIBt4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWd1NGNmbEgyVVhlSmpRbzNoMHhnZWRwK3BUMW5XT0Q1MUwyR0xkd2lybDdN?=
 =?utf-8?B?VkJqK0x6Yng2aXBGRUNsdXpnYmgwNWd0aHl5cjZUbHp3SzQ1OFVFemtPRDFK?=
 =?utf-8?B?bkRpYVdXTWcxN2xEekkrNjhmekFHV0lMRktYMTQyNjRWeEtBWmVUdGtHNnVG?=
 =?utf-8?B?SEtIWmNoaHFuZW1CSHloRkF5VkFIdi9ZSlVvcUdGVzFSMFdOVUlMQUxveWtV?=
 =?utf-8?B?ZkVWSFlaa1pjWEprbWxQaDJnRjJtWXJNUmFjNW9KTnBlZE1IMFdyOGUvSDRJ?=
 =?utf-8?B?Z3RqQmgrMjZza3hZRmw2TkJZM2dQTFpzcTQ2Tlo2RlBHMG4zZDhjQ1F6RkR3?=
 =?utf-8?B?d2N4TmQ4ZXBENzhtL3czN1dQaXUxUWpteEFYV2NnQ0wvTTFXOGRsTUQvcXJp?=
 =?utf-8?B?a3R2MmlTN2JvcTRHYUwvQVlFNXFxREpTd0FnZ3haWHRzOURDaUtoNXZqR2VH?=
 =?utf-8?B?OW91RDM2KzNnNlZkMVBReFJGU0JqTTVHQzRoSDBUZzg4VWFjU2xJQTJzNlUw?=
 =?utf-8?B?NW1mQ3FMaExMamhtSitaRjcxQkgrR2loWWZNaEFQSFh3NlA5TTA3TXY0aU1s?=
 =?utf-8?B?R2dDUGNtRXhNV05Dd0hjV1FhNUxXM0FlTXcydHNWaVM3NGFFZmQrQWhreVhJ?=
 =?utf-8?B?Yzd2RkpYZkxaMjY0N0ZBS3cycmZKU1lZZnhCVnJOcmU2UkFBMlVsQXVHOHdw?=
 =?utf-8?B?UnhsYWc5NU1rR2d4ZlR1cHAvTjZQd3kyL3pQc0RLOGtMZGxiWFNZTFNIQSs4?=
 =?utf-8?B?T3dkaG9hYi9vdGVubUFmNmQzRG5LeGNMZ3NwSGo3clcza1dtV2ZrSmRLVGtB?=
 =?utf-8?B?NFFYa1RwVFJDeGcwUmFjeEt2eVRmQ3pyWEZYMkZ6VU45cGdteTE5Um8wRS9t?=
 =?utf-8?B?ZGdQZVU3OURzTHlsRjd1MDlNRWYzRkRVdklENnMxNlNSejBVaW1lSWEvL3N5?=
 =?utf-8?B?Uk54Uyt5Y01jdk5SM3Zyb0tNVkZrdGY0elJHWHV2MTBkVHJvNDh6VEpZdFd1?=
 =?utf-8?B?SjhnVFZwS0FaazZYZzVXMktqRGhnWCtpUWZEVHJwVnpJYkttRUpTcjMrdDJZ?=
 =?utf-8?B?MHUvZGhYRmRIZ2x4bnRMWGV5YW5kU0FoMkFLVFNvWkRqTUl6V0kwRjdOemts?=
 =?utf-8?B?U28vY0VCMVowV3ZKeDJ0d0w5NXJSZEMvTTVRa2tRbzdOeGhzQ3hzNnVJbElW?=
 =?utf-8?B?M1Izd05INCtva2FQRWlqY1p5WnFrUS9FWWlGdHJBQ1pMU2lQV2RzV0hneWYw?=
 =?utf-8?B?eTdvSjJrL252aGlHSkYydmN3S2dpS2lpT1FxZXloU2hBa3RSa2FieGlUQ3li?=
 =?utf-8?B?Y1J3VmI4OEdCam9razRNTVFwNnU2ZkJRTHNpQVV5MEREK09Ld3JOdG1raGdD?=
 =?utf-8?B?UmNwRVNaTFhQL0NQQjBLMXR3SjUvQlkwamNRb3daRjVXS0syRjE3YUdSdkVr?=
 =?utf-8?B?TzI5OHM5TmtIdFV2blRYOU94NlpSU1RBSW9TbmJiMzNHaHR2YlZzYU5zRVhw?=
 =?utf-8?B?OWg4L1JhbFlWMkV6cWZOLzVvY1h3aTRyQUF1SFZTcGtybkM4bTFSVVVpVlh1?=
 =?utf-8?B?c283aWxJeHR1bXlNZGtUZUdMQTBMREpMWjAwNmYyMi8zVW40TVBISm12L2Y2?=
 =?utf-8?B?RCt4OFZRWmRMMHVwL1dpaWN4eHVFSFNhTGRrZDJOajVzRVRETlJyeVpVSWtp?=
 =?utf-8?B?NTZpekhYZm9HUmpsa25YTHhXK3ByQVJ3OTgrQjlUTjRQR1ZKaW9EaFU0dFNn?=
 =?utf-8?B?MTFSN3YzaEpWaVhUTS81c0t2bWoyQ1YxdTRUQmpxeVlvTEN4MDdBYTRvdnJO?=
 =?utf-8?B?cmxMZERNSzl0c3E2SWlFOTlDU2t3NGJVb01QOTFyQUZNQTFadmlXRXpPcFZn?=
 =?utf-8?B?ZDZ5VFZIUnRGNFVudDQ3Sk10Umw4MGkxZy9FaVZLanBTQTFtQUxGZVRQSmdL?=
 =?utf-8?B?Q0VDK1d4MlFBQ3JLdlRlcVVGbGd5SUI4N2grV0NOL1krTTlueWJFQ2tNS25K?=
 =?utf-8?B?dlNaWWlldmszcXNNMTVmd29aazAyTjFaa3dwQUI3TDU4UG9xNjFwNzR2SDdI?=
 =?utf-8?B?MjErM1k5Y08zZnFmMFo3U2hZR2xuNGtNdmphWm5xLytmT2NMZk0zYVJ3VXFL?=
 =?utf-8?B?bG5oVEJweENPM3RxZUQ3bVEyeW81ZDdqeWJmaXd0VHZ3ZG93NTlnY0cwN1VP?=
 =?utf-8?Q?ytzQ0Q0pOdF+kIWzH8MKifo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a81a047-241b-46bc-af1d-08dd9ecf19ef
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 16:37:28.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yrJfx3IOVLPdOtq1n1uSO9SnGJ/71NkxzWbRMywqw8/ilcdLDqXcAJXfoJTKiI0eZUG5PDNTuhhCg4bEIHiCF7E2g5+QcBEvxm56UW+5yY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7232



On 5/29/25 12:36 AM, Ryan Roberts wrote:
> On 28/05/2025 16:18, Yang Shi wrote:
>>
>> On 5/28/25 6:13 AM, Ryan Roberts wrote:
>>> On 28/05/2025 01:00, Yang Shi wrote:
>>>> Hi Ryan,
>>>>
>>>> I got a new spin ready in my local tree on top of v6.15-rc4. I noticed there
>>>> were some more comments on Miko's BBML2 patch, it looks like a new spin is
>>>> needed. But AFAICT there should be no significant change to how I advertise
>>>> AmpereOne BBML2 in my patches. We will keep using MIDR list to check whether
>>>> BBML2 is advertised or not and the erratum seems still be needed to fix up
>>>> AA64MMFR2 BBML2 bits for AmpereOne IIUC.
>>> Yes, I agree this should not impact you too much.
>>>
>>>> You also mentioned Dev was working on patches to have __change_memory_common()
>>>> apply permission change on a contiguous range instead of on page basis (the
>>>> status quo). But I have not seen the patches on mailing list yet. However I
>>>> don't think this will result in any significant change to my patches either,
>>>> particularly the split primitive and linear map repainting.
>>> I think you would need Dev's series to be able to apply the permissions change
>>> without needing to split the whole range to pte mappings? So I guess your change
>>> must either be implementing something similar to what Dev is working on or you
>>> are splitting the entire range to ptes? If the latter, then I'm not keen on that
>>> approach.
>> I don't think Dev's series is mandatory prerequisite for my patches. IIUC how
>> the split primitive keeps block mapping if it is fully contained is independent
>> from how to apply the permissions change on it.
>> The new spin implemented keeping block mapping if it is fully contained as we
>> discussed earlier. I'm supposed Dev's series just need to check whether the
>> mapping is block or not when applying permission change.
> The way I was thinking the split primitive would would, you would need Dev's
> change as a prerequisite, so I suspect we both have a slightly different idea of
> how this will work.
>
>> The flow just looks like as below conceptually:
>>
>> split_mapping(start, end)
>> apply_permission_change(start, end)
> The flow I was thinking of would be this:
>
> split_mapping(start)
> split_mapping(end)
> apply_permission_change(start, end)
>
> split_mapping() takes a virtual address that is at least page aligned and when
> it returns, ensures that the address is at the start of a leaf mapping. And it
> will only break the leaf mappings down so that they are the maximum size that
> can still meet the requirement.
>
> As an example, let's suppose you initially start with a region that is composed
> entirely of 2M mappings. Then you want to change permissions of a region [2052K,
> 6208K).
>
> Before any splitting, you have:
>
>    - 2M   x4: [0, 8192K)
>
> Then you call split_mapping(start=2052K):
>
>    - 2M   x1: [0, 2048K)
>    - 4K  x16: [2048K, 2112K)  << start is the start of the second 4K leaf mapping
>    - 64K x31: [2112K, 4096K)
>    - 2M:  x2: [4096K, 8192K)
>
> Then you call split_mapping(end=6208K):
>
>    - 2M   x1: [0, 2048K)
>    - 4K  x16: [2048K, 2112K)
>    - 64K x31: [2112K, 4096K)
>    - 2M:  x1: [4096K, 6144K)
>    - 64K x32: [6144K, 8192K)  << end is the end of the first 64K leaf mapping
>
> So then when you call apply_permission_change(start=2052K, end=6208K), the
> following leaf mappings' permissions will be modified:
>
>    - 4K  x15: [2052K, 2112K)
>    - 64K x31: [2112K, 4096K)
>    - 2M:  x1: [4096K, 6144K)
>    - 64K  x1: [6144K, 6208K)
>
> Since there are block mappings in this range, Dev's change is required to change
> the permissions.
>
> This approach means that we only ever split the minimum required number of
> mappings and we only split them to the largest size that still provides the
> alignment requirement.

I see your point. I believe we are on the same page: keep the block 
mappings in the range as possible as we can. My implementation actually 
ends up having the same result as your example shows. I guess we just 
have different ideas about how to implement it.

However I do have hard time to understand why not just use 
split_mapping(start, end). We can reuse some of the existing code easily 
with "end". Because the existing code does calculate the page table 
(PUD/PMD/CONT PMD/CONT PTE) boundary, so I reused it. Basically my 
implementation just skip to the next page table if:
   * The start address is at page table boundary, and
   * The "end" is greater than page table boundary

The logic may be a little bit convoluted, not sure if I articulated 
myself or not. Anyway the code will explain everything.

>
>> The split_mapping() guarantees keep block mapping if it is fully contained in
>> the range between start and end, this is my series's responsibility. I know the
>> current code calls apply_to_page_range() to apply permission change and it just
>> does it on PTE basis. So IIUC Dev's series will modify it or provide a new API,
>> then __change_memory_common() will call it to change permission. There should be
>> some overlap between mine and Dev's, but I don't see strong dependency.
> But if you have a block mapping in the region you are calling
> __change_memory_common() on, today that will fail because it can only handle
> page mappings.

IMHO letting __change_memory_common() manipulate on contiguous address 
range is another story and should be not a part of the split primitive.

For example, we need to use vmalloc_huge() instead of vmalloc() to 
allocate huge memory, then does:
split_mapping(start, start+HPAGE_PMD_SIZE);
change_permission(start, start+HPAGE_PMD_SIZE);

The split primitive will guarantee (start, start+HPAGE_PMD_SIZE) is kept 
as PMD mapping so that change_permission() can change it on PMD basis too.

But this requires other kernel subsystems, for example, module, to 
allocate huge memory with proper APIs, for example, vmalloc_huge().

Thanks,
Yang

>
>>> Regarding the linear map repainting, I had a chat with Catalin, and he reminded
>>> me of a potential problem; if you are doing the repainting with the machine
>>> stopped, you can't allocate memory at that point; it's possible a CPU was inside
>>> the allocator when it stopped. And I think you need to allocate intermediate
>>> pgtables, right? Do you have a solution to that problem? I guess one approach
>>> would be to figure out how much memory you will need and pre-allocate prior to
>>> stoping the machine?
>> OK, I don't remember we discussed this problem before. I think we can do
>> something like what kpti does. When creating the linear map we know how many PUD
>> and PMD mappings are created, we can record the number, it will tell how many
>> pages we need for repainting the linear map.
> I saw a separate reply you sent for this. I'll read that and respond in that
> context.
>
> Thanks,
> Ryan
>
>>>> So I plan to post v4 patches to the mailing list. We can focus on reviewing the
>>>> split primitive and linear map repainting. Does it sound good to you?
>>> That works assuming you have a solution for the above.
>> I think the only missing part is preallocating page tables for repainting. I
>> will add this, then post the new spin to the mailing list.
>>
>> Thanks,
>> Yang
>>
>>> Thanks,
>>> Ryan
>>>
>>>> Thanks,
>>>> Yang
>>>>
>>>>
>>>> On 5/7/25 2:16 PM, Yang Shi wrote:
>>>>> On 5/7/25 12:58 AM, Ryan Roberts wrote:
>>>>>> On 05/05/2025 22:39, Yang Shi wrote:
>>>>>>> On 5/2/25 4:51 AM, Ryan Roberts wrote:
>>>>>>>> On 14/04/2025 22:24, Yang Shi wrote:
>>>>>>>>> On 4/14/25 6:03 AM, Ryan Roberts wrote:
>>>>>>>>>> On 10/04/2025 23:00, Yang Shi wrote:
>>>>>>>>>>> Hi Ryan,
>>>>>>>>>>>
>>>>>>>>>>> I know you may have a lot of things to follow up after LSF/MM. Just
>>>>>>>>>>> gently
>>>>>>>>>>> ping,
>>>>>>>>>>> hopefully we can resume the review soon.
>>>>>>>>>> Hi, I'm out on holiday at the moment, returning on the 22nd April. But
>>>>>>>>>> I'm very
>>>>>>>>>> keen to move this series forward so will come back to you next week.
>>>>>>>>>> (although
>>>>>>>>>> TBH, I thought I was waiting for you to respond to me... :-| )
>>>>>>>>>>
>>>>>>>>>> FWIW, having thought about it a bit more, I think some of the
>>>>>>>>>> suggestions I
>>>>>>>>>> previously made may not have been quite right, but I'll elaborate next
>>>>>>>>>> week.
>>>>>>>>>> I'm
>>>>>>>>>> keen to build a pgtable splitting primitive here that we can reuse with
>>>>>>>>>> vmalloc
>>>>>>>>>> as well to enable huge mappings by default with vmalloc too.
>>>>>>>>> Sounds good. I think the patches can support splitting vmalloc page table
>>>>>>>>> too.
>>>>>>>>> Anyway we can discuss more after you are back. Enjoy your holiday.
>>>>>>>> Hi Yang,
>>>>>>>>
>>>>>>>> Sorry I've taken so long to get back to you. Here's what I'm currently
>>>>>>>> thinking:
>>>>>>>> I'd eventually like to get to the point where the linear map and most
>>>>>>>> vmalloc
>>>>>>>> memory is mapped using the largest possible mapping granularity (i.e. block
>>>>>>>> mappings at PUD/PMD, and contiguous mappings at PMD/PTE level).
>>>>>>>>
>>>>>>>> vmalloc has history with trying to do huge mappings by default; it ended up
>>>>>>>> having to be turned into an opt-in feature (instead of the original opt-out
>>>>>>>> approach) because there were problems with some parts of the kernel
>>>>>>>> expecting
>>>>>>>> page mappings. I think we might be able to overcome those issues on arm64
>>>>>>>> with
>>>>>>>> BBML2.
>>>>>>>>
>>>>>>>> arm64 can already support vmalloc PUD and PMD block mappings, and I have a
>>>>>>>> series (that should make v6.16) that enables contiguous PTE mappings in
>>>>>>>> vmalloc
>>>>>>>> too. But these are currently limited to when VM_ALLOW_HUGE is specified.
>>>>>>>> To be
>>>>>>>> able to use that by default, we need to be able to change permissions on
>>>>>>>> sub-regions of an allocation, which is where BBML2 and your series come in.
>>>>>>>> (there may be other things we need to solve as well; TBD).
>>>>>>>>
>>>>>>>> I think the key thing we need is a function that can take a page-aligned
>>>>>>>> kernel
>>>>>>>> VA, will walk to the leaf entry for that VA and if the VA is in the
>>>>>>>> middle of
>>>>>>>> the leaf entry, it will split it so that the VA is now on a boundary. This
>>>>>>>> will
>>>>>>>> work for PUD/PMD block entries and contiguous-PMD/contiguous-PTE entries.
>>>>>>>> The
>>>>>>>> function can assume BBML2 is present. And it will return 0 on success, -
>>>>>>>> EINVAL
>>>>>>>> if the VA is not mapped or -ENOMEM if it couldn't allocate a pgtable to
>>>>>>>> perform
>>>>>>>> the split.
>>>>>>> OK, the v3 patches already handled page table allocation failure with
>>>>>>> returning
>>>>>>> -ENOMEM and BUG_ON if it is not mapped because kernel assumes linear mapping
>>>>>>> should be always present. It is easy to return -EINVAL instead of BUG_ON.
>>>>>>> However I'm wondering what usecases you are thinking about? Splitting vmalloc
>>>>>>> area may run into unmapped VA?
>>>>>> I don't think BUG_ON is the right behaviour; crashing the kernel should be
>>>>>> discouraged. I think even for vmalloc under correct conditions we shouldn't
>>>>>> see
>>>>>> any unmapped VA. But vmalloc does handle it gracefully today; see (e.g.)
>>>>>> vunmap_pmd_range() which skips the pmd if its none.
>>>>>>
>>>>>>>> Then we can use that primitive on the start and end address of any range for
>>>>>>>> which we need exact mapping boundaries (e.g. when changing permissions on
>>>>>>>> part
>>>>>>>> of linear map or vmalloc allocation, when freeing part of a vmalloc
>>>>>>>> allocation,
>>>>>>>> etc). This way we only split enough to ensure the boundaries are precise,
>>>>>>>> and
>>>>>>>> keep larger mappings inside the range.
>>>>>>> Yeah, makes sense to me.
>>>>>>>
>>>>>>>> Next we need to reimplement __change_memory_common() to not use
>>>>>>>> apply_to_page_range(), because that assumes page mappings only. Dev Jain has
>>>>>>>> been working on a series that converts this to use
>>>>>>>> walk_page_range_novma() so
>>>>>>>> that we can change permissions on the block/contig entries too. That's not
>>>>>>>> posted publicly yet, but it's not huge so I'll ask if he is comfortable with
>>>>>>>> posting an RFC early next week.
>>>>>>> OK, so the new __change_memory_common() will change the permission of page
>>>>>>> table, right?
>>>>>> It will change permissions of all the leaf entries in the range of VAs it is
>>>>>> passed. Currently it assumes that all the leaf entries are PTEs. But we will
>>>>>> generalize to support all the other types of leaf entries too.,
>>>>>>
>>>>>>> If I remember correctly, you suggested change permissions in
>>>>>>> __create_pgd_mapping_locked() for v3. So I can disregard it?
>>>>>> Yes I did. I think this made sense (in my head at least) because in the
>>>>>> context
>>>>>> of the linear map, all the PFNs are contiguous so it kind-of makes sense to
>>>>>> reuse that infrastructure. But it doesn't generalize to vmalloc because
>>>>>> vmalloc
>>>>>> PFNs are not contiguous. So for that reason, I think it's preferable to
>>>>>> have an
>>>>>> independent capability.
>>>>> OK, sounds good to me.
>>>>>
>>>>>>> The current code assumes the address range passed in by
>>>>>>> change_memory_common()
>>>>>>> is *NOT* physically contiguous so __change_memory_common() handles page table
>>>>>>> permission on page basis. I'm supposed Dev's patches will handle this then my
>>>>>>> patch can safely assume the linear mapping address range for splitting is
>>>>>>> physically contiguous too otherwise I can't keep large mappings inside the
>>>>>>> range. Splitting vmalloc area doesn't need to worry about this.
>>>>>> I'm not sure I fully understand the point you're making here...
>>>>>>
>>>>>> Dev's series aims to use walk_page_range_novma() similar to riscv's
>>>>>> implementation so that it can walk a VA range and update the permissions on
>>>>>> each
>>>>>> leaf entry it visits, regadless of which level the leaf entry is at. This
>>>>>> doesn't make any assumption of the physical contiguity of neighbouring leaf
>>>>>> entries in the page table.
>>>>>>
>>>>>> So if we are changing permissions on the linear map, we have a range of VAs to
>>>>>> walk and convert all the leaf entries, regardless of their size. The same goes
>>>>>> for vmalloc... But for vmalloc, we will also want to change the underlying
>>>>>> permissions in the linear map, so we will have to figure out the contiguous
>>>>>> pieces of the linear map and call __change_memory_common() for each; there is
>>>>>> definitely some detail to work out there!
>>>>> Yes, this is my point. When changing underlying linear map permission for
>>>>> vmalloc, the linear map address may be not contiguous. This is why
>>>>> change_memory_common() calls __change_memory_common() on page basis.
>>>>>
>>>>> But how Dev's patch work should have no impact on how I implement the split
>>>>> primitive by thinking it further. It should be the caller's responsibility to
>>>>> make sure __create_pgd_mapping_locked() is called for contiguous linear map
>>>>> address range.
>>>>>
>>>>>>>> You'll still need to repaint the whole linear map with page mappings for the
>>>>>>>> case !BBML2 case, but I'm hoping __create_pgd_mapping_locked() (potentially
>>>>>>>> with
>>>>>>>> minor modifications?) can do that repainting on the live mappings;
>>>>>>>> similar to
>>>>>>>> how you are doing it in v3.
>>>>>>> Yes, when repainting I need to split the page table all the way down to PTE
>>>>>>> level. A simple flag should be good enough to tell
>>>>>>> __create_pgd_mapping_locked()
>>>>>>> do the right thing off the top of my head.
>>>>>> Perhaps it may be sufficient to reuse the NO_BLOCK_MAPPINGS and
>>>>>> NO_CONT_MAPPINGS
>>>>>> flags? For example, if you are find a leaf mapping and NO_BLOCK_MAPPINGS is
>>>>>> set,
>>>>>> then you need to split it?
>>>>> Yeah, sounds feasible. Anyway I will figure it out.
>>>>>
>>>>>>>> Miko's BBML2 series should hopefully get imminently queued for v6.16.
>>>>>>> Great! Anyway my series is based on his advertising BBML2 patch.
>>>>>>>
>>>>>>>> So in summary, what I'm asking for your large block mapping the linear map
>>>>>>>> series is:
>>>>>>>>       - Paint linear map using blocks/contig if boot CPU supports BBML2
>>>>>>>>       - Repaint linear map using page mappings if secondary CPUs don't
>>>>>>>> support BBML2
>>>>>>> OK, I just need to add some simple tweak to split down to PTE level to v3.
>>>>>>>
>>>>>>>>       - Integrate Dev's __change_memory_common() series
>>>>>>> OK, I think I have to do my patches on top of it. Because Dev's patch need
>>>>>>> guarantee the linear mapping address range is physically contiguous.
>>>>>>>
>>>>>>>>       - Create primitive to ensure mapping entry boundary at a given page-
>>>>>>>> aligned VA
>>>>>>>>       - Use primitive when changing permissions on linear map region
>>>>>>> Sure.
>>>>>>>
>>>>>>>> This will be mergable on its own, but will also provide a great starting
>>>>>>>> base
>>>>>>>> for adding huge-vmalloc-by-default.
>>>>>>>>
>>>>>>>> What do you think?
>>>>>>> Definitely makes sense to me.
>>>>>>>
>>>>>>> If I remember correctly, we still have some unsolved comments/questions
>>>>>>> for v3
>>>>>>> in my replies on March 17, particularly:
>>>>>>> https://lore.kernel.org/linux-arm-kernel/2b715836-b566-4a9e-
>>>>>>> b344-9401fa4c0feb@os.amperecomputing.com/
>>>>>> Ahh sorry about that. I'll take a look now...
>>>>> No problem.
>>>>>
>>>>> Thanks,
>>>>> Yang
>>>>>
>>>>>> Thanks,
>>>>>> Ryan
>>>>>>
>>>>>>> Thanks,
>>>>>>> Yang
>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Ryan
>>>>>>>>
>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Yang
>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Ryan
>>>>>>>>>>
>>>>>>>>>>> Thanks,
>>>>>>>>>>> Yang
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 3/13/25 10:40 AM, Yang Shi wrote:
>>>>>>>>>>>> On 3/13/25 10:36 AM, Ryan Roberts wrote:
>>>>>>>>>>>>> On 13/03/2025 17:28, Yang Shi wrote:
>>>>>>>>>>>>>> Hi Ryan,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I saw Miko posted a new spin of his patches. There are some slight
>>>>>>>>>>>>>> changes
>>>>>>>>>>>>>> that
>>>>>>>>>>>>>> have impact to my patches (basically check the new boot parameter).
>>>>>>>>>>>>>> Do you
>>>>>>>>>>>>>> prefer I rebase my patches on top of his new spin right now then
>>>>>>>>>>>>>> restart
>>>>>>>>>>>>>> review
>>>>>>>>>>>>>> from the new spin or review the current patches then solve the new
>>>>>>>>>>>>>> review
>>>>>>>>>>>>>> comments and rebase to Miko's new spin together?
>>>>>>>>>>>>> Hi Yang,
>>>>>>>>>>>>>
>>>>>>>>>>>>> Sorry I haven't got to reviewing this version yet, it's in my queue!
>>>>>>>>>>>>>
>>>>>>>>>>>>> I'm happy to review against v3 as it is. I'm familiar with Miko's
>>>>>>>>>>>>> series
>>>>>>>>>>>>> and am
>>>>>>>>>>>>> not too bothered about the integration with that; I think it's pretty
>>>>>>>>>>>>> straight
>>>>>>>>>>>>> forward. I'm more interested in how you are handling the splitting,
>>>>>>>>>>>>> which I
>>>>>>>>>>>>> think is the bulk of the effort.
>>>>>>>>>>>> Yeah, sure, thank you.
>>>>>>>>>>>>
>>>>>>>>>>>>> I'm hoping to get to this next week before heading out to LSF/MM the
>>>>>>>>>>>>> following
>>>>>>>>>>>>> week (might I see you there?)
>>>>>>>>>>>> Unfortunately I can't make it this year. Have a fun!
>>>>>>>>>>>>
>>>>>>>>>>>> Thanks,
>>>>>>>>>>>> Yang
>>>>>>>>>>>>
>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>> Ryan
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>>> Yang
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On 3/4/25 2:19 PM, Yang Shi wrote:
>>>>>>>>>>>>>>> Changelog
>>>>>>>>>>>>>>> =========
>>>>>>>>>>>>>>> v3:
>>>>>>>>>>>>>>>          * Rebased to v6.14-rc4.
>>>>>>>>>>>>>>>          * Based on Miko's BBML2 cpufeature patch (https://
>>>>>>>>>>>>>>> lore.kernel.org/
>>>>>>>>>>>>>>> linux-
>>>>>>>>>>>>>>> arm-kernel/20250228182403.6269-3-miko.lenczewski@arm.com/).
>>>>>>>>>>>>>>>            Also included in this series in order to have the complete
>>>>>>>>>>>>>>> patchset.
>>>>>>>>>>>>>>>          * Enhanced __create_pgd_mapping() to handle split as well per
>>>>>>>>>>>>>>> Ryan.
>>>>>>>>>>>>>>>          * Supported CONT mappings per Ryan.
>>>>>>>>>>>>>>>          * Supported asymmetric system by splitting kernel linear
>>>>>>>>>>>>>>> mapping if
>>>>>>>>>>>>>>> such
>>>>>>>>>>>>>>>            system is detected per Ryan. I don't have such system to
>>>>>>>>>>>>>>> test,
>>>>>>>>>>>>>>> so the
>>>>>>>>>>>>>>>            testing is done by hacking kernel to call linear mapping
>>>>>>>>>>>>>>> repainting
>>>>>>>>>>>>>>>            unconditionally. The linear mapping doesn't have any
>>>>>>>>>>>>>>> block and
>>>>>>>>>>>>>>> cont
>>>>>>>>>>>>>>>            mappings after booting.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> RFC v2:
>>>>>>>>>>>>>>>          * Used allowlist to advertise BBM lv2 on the CPUs which can
>>>>>>>>>>>>>>> handle TLB
>>>>>>>>>>>>>>>            conflict gracefully per Will Deacon
>>>>>>>>>>>>>>>          * Rebased onto v6.13-rc5
>>>>>>>>>>>>>>>          * https://lore.kernel.org/linux-arm-
>>>>>>>>>>>>>>> kernel/20250103011822.1257189-1-
>>>>>>>>>>>>>>> yang@os.amperecomputing.com/
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-
>>>>>>>>>>>>>>> yang@os.amperecomputing.com/
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Description
>>>>>>>>>>>>>>> ===========
>>>>>>>>>>>>>>> When rodata=full kernel linear mapping is mapped by PTE due to arm's
>>>>>>>>>>>>>>> break-before-make rule.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> A number of performance issues arise when the kernel linear map is
>>>>>>>>>>>>>>> using
>>>>>>>>>>>>>>> PTE entries due to arm's break-before-make rule:
>>>>>>>>>>>>>>>          - performance degradation
>>>>>>>>>>>>>>>          - more TLB pressure
>>>>>>>>>>>>>>>          - memory waste for kernel page table
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> These issues can be avoided by specifying rodata=on the kernel
>>>>>>>>>>>>>>> command
>>>>>>>>>>>>>>> line but this disables the alias checks on page table permissions and
>>>>>>>>>>>>>>> therefore compromises security somewhat.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> With FEAT_BBM level 2 support it is no longer necessary to
>>>>>>>>>>>>>>> invalidate the
>>>>>>>>>>>>>>> page table entry when changing page sizes. This allows the kernel to
>>>>>>>>>>>>>>> split large mappings after boot is complete.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> This patch adds support for splitting large mappings when FEAT_BBM
>>>>>>>>>>>>>>> level 2
>>>>>>>>>>>>>>> is available and rodata=full is used. This functionality will be used
>>>>>>>>>>>>>>> when modifying page permissions for individual page frames.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Without FEAT_BBM level 2 we will keep the kernel linear map using
>>>>>>>>>>>>>>> PTEs
>>>>>>>>>>>>>>> only.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> If the system is asymmetric, the kernel linear mapping may be
>>>>>>>>>>>>>>> repainted
>>>>>>>>>>>>>>> once
>>>>>>>>>>>>>>> the BBML2 capability is finalized on all CPUs.  See patch #6 for more
>>>>>>>>>>>>>>> details.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> We saw significant performance increases in some benchmarks with
>>>>>>>>>>>>>>> rodata=full without compromising the security features of the kernel.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Testing
>>>>>>>>>>>>>>> =======
>>>>>>>>>>>>>>> The test was done on AmpereOne machine (192 cores, 1P) with 256GB
>>>>>>>>>>>>>>> memory and
>>>>>>>>>>>>>>> 4K page size + 48 bit VA.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Function test (4K/16K/64K page size)
>>>>>>>>>>>>>>>          - Kernel boot.  Kernel needs change kernel linear mapping
>>>>>>>>>>>>>>> permission at
>>>>>>>>>>>>>>>            boot stage, if the patch didn't work, kernel typically
>>>>>>>>>>>>>>> didn't
>>>>>>>>>>>>>>> boot.
>>>>>>>>>>>>>>>          - Module stress from stress-ng. Kernel module load change
>>>>>>>>>>>>>>> permission
>>>>>>>>>>>>>>> for
>>>>>>>>>>>>>>>            linear mapping.
>>>>>>>>>>>>>>>          - A test kernel module which allocates 80% of total memory
>>>>>>>>>>>>>>> via
>>>>>>>>>>>>>>> vmalloc(),
>>>>>>>>>>>>>>>            then change the vmalloc area permission to RO, this also
>>>>>>>>>>>>>>> change
>>>>>>>>>>>>>>> linear
>>>>>>>>>>>>>>>            mapping permission to RO, then change it back before
>>>>>>>>>>>>>>> vfree(). Then
>>>>>>>>>>>>>>> launch
>>>>>>>>>>>>>>>            a VM which consumes almost all physical memory.
>>>>>>>>>>>>>>>          - VM with the patchset applied in guest kernel too.
>>>>>>>>>>>>>>>          - Kernel build in VM with guest kernel which has this series
>>>>>>>>>>>>>>> applied.
>>>>>>>>>>>>>>>          - rodata=on. Make sure other rodata mode is not broken.
>>>>>>>>>>>>>>>          - Boot on the machine which doesn't support BBML2.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Performance
>>>>>>>>>>>>>>> ===========
>>>>>>>>>>>>>>> Memory consumption
>>>>>>>>>>>>>>> Before:
>>>>>>>>>>>>>>> MemTotal:       258988984 kB
>>>>>>>>>>>>>>> MemFree:        254821700 kB
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> After:
>>>>>>>>>>>>>>> MemTotal:       259505132 kB
>>>>>>>>>>>>>>> MemFree:        255410264 kB
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Around 500MB more memory are free to use.  The larger the machine,
>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>> more memory saved.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Performance benchmarking
>>>>>>>>>>>>>>> * Memcached
>>>>>>>>>>>>>>> We saw performance degradation when running Memcached benchmark with
>>>>>>>>>>>>>>> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB
>>>>>>>>>>>>>>> pressure.
>>>>>>>>>>>>>>> With this patchset we saw ops/sec is increased by around 3.5%, P99
>>>>>>>>>>>>>>> latency is reduced by around 9.6%.
>>>>>>>>>>>>>>> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
>>>>>>>>>>>>>>> MPKI is reduced by 28.5%.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> The benchmark data is now on par with rodata=on too.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> * Disk encryption (dm-crypt) benchmark
>>>>>>>>>>>>>>> Ran fio benchmark with the below command on a 128G ramdisk (ext4)
>>>>>>>>>>>>>>> with
>>>>>>>>>>>>>>> disk
>>>>>>>>>>>>>>> encryption (by dm-crypt).
>>>>>>>>>>>>>>> fio --directory=/data --random_generator=lfsr --norandommap --
>>>>>>>>>>>>>>> randrepeat 1 \
>>>>>>>>>>>>>>>            --status-interval=999 --rw=write --bs=4k --loops=1 --
>>>>>>>>>>>>>>> ioengine=sync \
>>>>>>>>>>>>>>>            --iodepth=1 --numjobs=1 --fsync_on_close=1 --
>>>>>>>>>>>>>>> group_reporting --
>>>>>>>>>>>>>>> thread \
>>>>>>>>>>>>>>>            --name=iops-test-job --eta-newline=1 --size 100G
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> The IOPS is increased by 90% - 150% (the variance is high, but the
>>>>>>>>>>>>>>> worst
>>>>>>>>>>>>>>> number of good case is around 90% more than the best number of bad
>>>>>>>>>>>>>>> case).
>>>>>>>>>>>>>>> The bandwidth is increased and the avg clat is reduced
>>>>>>>>>>>>>>> proportionally.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> * Sequential file read
>>>>>>>>>>>>>>> Read 100G file sequentially on XFS (xfs_io read with page cache
>>>>>>>>>>>>>>> populated).
>>>>>>>>>>>>>>> The bandwidth is increased by 150%.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Mikołaj Lenczewski (1):
>>>>>>>>>>>>>>>              arm64: Add BBM Level 2 cpu feature
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Yang Shi (5):
>>>>>>>>>>>>>>>              arm64: cpufeature: add AmpereOne to BBML2 allow list
>>>>>>>>>>>>>>>              arm64: mm: make __create_pgd_mapping() and helpers
>>>>>>>>>>>>>>> non-void
>>>>>>>>>>>>>>>              arm64: mm: support large block mapping when rodata=full
>>>>>>>>>>>>>>>              arm64: mm: support split CONT mappings
>>>>>>>>>>>>>>>              arm64: mm: split linear mapping if BBML2 is not
>>>>>>>>>>>>>>> supported on
>>>>>>>>>>>>>>> secondary
>>>>>>>>>>>>>>> CPUs
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>         arch/arm64/Kconfig                  | 11 +++++
>>>>>>>>>>>>>>>         arch/arm64/include/asm/cpucaps.h    | 2 +
>>>>>>>>>>>>>>>         arch/arm64/include/asm/cpufeature.h | 15 ++++++
>>>>>>>>>>>>>>>         arch/arm64/include/asm/mmu.h        | 4 ++
>>>>>>>>>>>>>>>         arch/arm64/include/asm/pgtable.h    | 12 ++++-
>>>>>>>>>>>>>>>         arch/arm64/kernel/cpufeature.c      | 95 ++++++++++++++++++
>>>>>>>>>>>>>>> ++++++
>>>>>>>>>>>>>>> ++++++
>>>>>>>>>>>>>>> +++++++
>>>>>>>>>>>>>>>         arch/arm64/mm/mmu.c                 | 397 ++++++++++++++++++++
>>>>>>>>>>>>>>> ++++
>>>>>>>>>>>>>>> ++++++
>>>>>>>>>>>>>>> ++++
>>>>>>>>>>>>>>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>>> +++++
>>>>>>>>>>>>>>> +++++
>>>>>>>>>>>>>>> ++++++++++++++++++++++-------------------
>>>>>>>>>>>>>>>         arch/arm64/mm/pageattr.c            | 37 ++++++++++++---
>>>>>>>>>>>>>>>         arch/arm64/tools/cpucaps            | 1 +
>>>>>>>>>>>>>>>         9 files changed, 518 insertions(+), 56 deletions(-)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>

