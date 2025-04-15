Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAB845979
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744676873; cv=fail; b=kwCXuQwR4qIHX0SUcM/fBuiCQPrGOc6G+0K3zPy0YIXnYuSz8zYp2bSv5v8D55fsBSYUFde2Jzij/yTCOffsv3jRm2FXkZpgrwqwQezIWyIqu+SxnRblN5EPXSCJ3T7qA6N2SMNNv7fcB7Dn/U6nfK7i2vDzNz72sVz7FLsGha4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744676873; c=relaxed/simple;
	bh=PsXp4ZM0revryIbz8Sxcg5hOus+xX0upyIwmbOQx3E8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GlhQS1M3SRh1msRao7zP0oiwey9Q2sDykVXF791yf0g05wXDV0/VtvzUOPpPITqwrlDI6CFHS0zAFtmfjo6Z6LQJRF/jW44BfWr7KZP6At/+FyCAoswwKzO/4T9x2jdvOvWPqi9kDAYZX9vQIQZADA5bn5A0xhFxovWS7QA4tFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dRjlaaW5; arc=fail smtp.client-ip=40.107.93.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dRjlaaW5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/OrVT+8H2gK+nAg87Ciqh7p4kWej/3rASTqVHNblp6iDUV3JAuzYFdL304KGGBXxcg1eYa+2rGafjFuU/uuJ/c2E1gN8ZqPskAblBbyiEo/sH2CQR26ZA34SHntA3yd4Y5hmvLeoATpLGw+3K0P5SbSAURwVhJigGbxOHmYl/5qkOrYULXZ04BM2TfhFWYGysZ4/UTMdmw+xV7kZ+0mITcMTPOXMjGyjPcgAhfuwLEe1aNzIntvjn4ieXy/72fRXPoQXa9Ck0B+46alUtVY6rkpnUV4nPFwJufLqA7Nn3/lHAHC+Ah8xKi7rPho5Qkuf/1ZmUdqA19kWernamfkgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrHo2rFlPvzC/8ZCrrwOohkmaz44D6CfM3d3x1P39DA=;
 b=uU3Ize/iWAcLeVqm12EVLU5LV8/ECxL7yxkD9SFnAKDE3QoYgpWulKbxW370pww1PEVx9fuV53PKCsocxwTOZSCufLV/AL2uxVAkRYVEKYGKWf24NREL2JR4NvaIPLTgFAdprJotrDUl5EumhdTIvxUONMkskXHQ6MLoIYVvNivWCExSzYzlXYQ/dDCMWGS7XkYWpck8JILJGrr664VE0UxN6Yyaj0ktDHaOFT035rpgmsDO43pLWBC6brSLbOvB8Dfha7KC/nR86Nn7kD1hl5Ac6P+v/T6YO4oiGjQtFn6YrIiHjx+tw7glrId0S/jYb0sGbpMH5isr8rMTXirDGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrHo2rFlPvzC/8ZCrrwOohkmaz44D6CfM3d3x1P39DA=;
 b=dRjlaaW54nod5If0gKYBNEq3n37E37lgo378Lmbt8L5GaXYgR8Tu1OXu3ydJlNq5ltdE0XB9LuzrtcQ6O4GEPpwvgoA3sCZEnEynVgy0bKvdFt5tRIJxzbqa6h7FD/fyEDPEis8epwRAEITIKQnxZI4yW8CL7FsG8RT6PNBYXAxYNo/PS125lF+FAA6xZH+uUHsloKgBbaaViYC2uyPGGHtQJstt2R43jFQll5DRE8kkl05m6SrhM5dQsa+grlZAgSWJY47onYAVdkiBWup6kS+2TuTnlpt3Dd6M1iVyA2a850dRdu3dvOSWweqwvibfpY9vYMeAiIQ7vmxjMJI9kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 PH7PR12MB7891.namprd12.prod.outlook.com (2603:10b6:510:27a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 00:27:45 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 00:27:44 +0000
Message-ID: <9dd487d7-9414-4aa6-be21-692dda655553@nvidia.com>
Date: Mon, 14 Apr 2025 17:27:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/21] x86,fs/resctrl: Move the resctrl filesystem code
 to live in /fs/resctrl
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
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-18-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250411164229.23413-18-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::24) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|PH7PR12MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: 55340ce9-537c-4f68-b172-08dd7bb4572f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWM5ZjBDSCtnemFweG9XSmI5M2dkQytUTWgvUlU1Q3h1UCs4VkljRmJrZklU?=
 =?utf-8?B?M0dPeTl6UTRoUEFsK0U3K0ZXakJlRGpWd0pYZ2dkK3luWGk2Yi9ocE1pVzF3?=
 =?utf-8?B?dXZGMzRaV0FGRHdVRDE0Sml6anNTdnNBSE1GRmVRYnFUWTV4bnBUSjZPWGJt?=
 =?utf-8?B?Mk5MRzRJZ3I0WlZBNkFNYm9RNklKQ1k0SXdDYkhuRkMwQzFpS0lENm5JdFJD?=
 =?utf-8?B?N0lSdUkvQ2VRZ0JtQm9Id2tjZXMwc0x0TDFuUWk2Ujdidml0RXEwL2Z6TFpu?=
 =?utf-8?B?L2VobysxL3QzZ0NjVUNrQ2NxR1NXTDV1SWdYYmRweWZNdzRpVU92SlJBL0FG?=
 =?utf-8?B?M3FCWjRUZ2VmVWtMV0pKWGlhNEFLYk5uMkI0dHN1WnFnWFV0SWlicHJPdC9B?=
 =?utf-8?B?RjcvK0Z4Z29kRWhLRENNdW1CcGwrRmlmS3d0R2c1MEhEc0ZkVFBQOEVXYzJM?=
 =?utf-8?B?ZVo2NmpUQzN2R2VaN1hSS2dBTXFnR3hUdklQU0xJamFlcnZrRFNURDF0VTNQ?=
 =?utf-8?B?aFd1S3l5RVZ0Y2llaXVwcG5KN3F6dVNZbC9XbTA0TXpMMTRUeUwwdkxRWUpo?=
 =?utf-8?B?dkh3emtjRURpaU92VlZua0dGaC9IcnpnMTBNZ2d3K3RLckRCVjlCdUpIaGhZ?=
 =?utf-8?B?L09jMGc0d0wwY3NvWXFuYnBzdGc3RWIvcFcwNWRIVDZuZ05adEkrWUMzV3kw?=
 =?utf-8?B?cEhERjQ3UkkzalNJbkVobU5Ga0MzaHNsNkJVeU0zckJHd0JnUVFFZUFGRU1F?=
 =?utf-8?B?ekJwTDVWd2szbWd4RkNPTEZaTzByUGhwam0xQjlYMW9xaGZ5b2hFcDFUYUpo?=
 =?utf-8?B?THBnOXFZOExHTlY1c2tiZUtDc0YwTnQ3RFNMV1BZeUhaTitQU05LRFVUU0wx?=
 =?utf-8?B?Y3cwc1UvVXNmSmwrN1huR1RMMUI2L2tFaDRtZmV6VXlDSnV1OWJkc0F6ZUpJ?=
 =?utf-8?B?QlcrdHR0M3V3eGs4ZUVBYjRXamI0eUJuTTNWTWp1NWdZOS9oeHhFUVVxVVNp?=
 =?utf-8?B?L0IrTURTTW9GVHByTVo3MGZvWUhLbXBXa0FCUzdoWkRXR2VZYmpWUjNmZ2xQ?=
 =?utf-8?B?RFZFK1k5b1llZGYxLzhOV2FwY252YnNLbktiRGRpdEtBdlIwb3oza1hublAx?=
 =?utf-8?B?K0tzZTRYbDhKcnhmYW5tMExuSHMzR2h2dHNMRnAvY0RMQ3lKc2tKbFc3U2xE?=
 =?utf-8?B?OTg3aTZTbnE0aXloZHFRRDZQK3p4VnFiL3l6ZHl6R2VaV0tTVUxMcFYwREND?=
 =?utf-8?B?ZGYrZGlnQW5hcFhURG1wQzhjdEtpTmNaNzFuVml5eko3VnhabG9NRlhyZDZo?=
 =?utf-8?B?emx6MHUvYktTOHIvVDg5by9ycnFtRVJCanNqSFZSSHBxRFZPTmpBRVRkbkQz?=
 =?utf-8?B?ZFBmaGIvWHZpb1ZMeHZjZjE2MUxtaTFXajhWOS8xdWJreWZkK0xaRS81QWw4?=
 =?utf-8?B?Wk45dDFZTTFMQ0VOZHZJaFlrUmNQL3BNQVZGODdzUzJqdytIZitFRUg0cnFK?=
 =?utf-8?B?WURJWHlvWmc4Vkk3VTN5ZC9yNTNGc3Z0TmpuYlAvaEsrRlN2bXAwMzZxak1M?=
 =?utf-8?B?RmJtWkVkT1hEbHRLdFNxSmlYNXZVVXA2a2dZVkNTNHBqOXY0VHc5dlJuTXZN?=
 =?utf-8?B?Si9ndnlZWmQrbDBSYnRNK0p1U3ZadFQxKzdNbWh5QWdCMTR0aVdPY3dWdWdp?=
 =?utf-8?B?d09MWEUwdTVwc1BlNUNxNVpoYkUvZUViVW9WeFV3d2RDT3RrQkdBZ1dHTGNk?=
 =?utf-8?B?RU9BT29hcmRGc2ZWbHdwRUpOLzdkSWJvcmtJMnRJRHlnTk1WejVWRXRxZWtj?=
 =?utf-8?B?b0lWM0JsYkV6cmc5MTdnend6Y3dzQnZLemprNWlPWWh0WXZQRmZKY3hZTVRD?=
 =?utf-8?B?UVpVTUJxTUhNeUV5M1ZLeWRzQXJlUUpHcmNvY1BrSmhMV09ITzNBVXhLUEZF?=
 =?utf-8?Q?hOVEl/dfYkM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVRLRkpGZCs1U1dTTzFydjgvL1M0QXBJQnZ6SWZ0OVl0ejA0RVFiZDY3R29I?=
 =?utf-8?B?Y2lycHBIVHBtOWdRcWF0alltUTlhajRjbHJzaGhzN1ZsRFlWKzN2ekpFVFVD?=
 =?utf-8?B?RmNpdUIydi9PTFNmVmtpWm1TOXQ3d3ZxVTlvNTBJbk5tbW9iRHVUcHJkcjRN?=
 =?utf-8?B?amV6d21tWW40YmdEL1ZtUjQzZWhsVWtkL243d0xnditkVTFRVTErbnhxeko3?=
 =?utf-8?B?Y0dMQTZaK2ZkdHpSTFRjdEJ5ejFyMWJ1MFV0djJPa0F2enQwT1NtZ2t6Tzdp?=
 =?utf-8?B?WmtHQWNTaXpnWkpwb1cyRDJQdzd4Ukw4K0dCNGxsbFdsRktIRGgxQ3VvL01P?=
 =?utf-8?B?RnhIUlRab2VYb2ZPMnhRK0dTN3liRzlLb1J4bEZSbGJDZDN6b2QyU1IrUU1j?=
 =?utf-8?B?NmxpRlZGYmFYMXRUSStCeE5najl3cFd4ODhXWk0zVG05bWFuUXZSQ28yZzZv?=
 =?utf-8?B?VEpsS1EzVFNvUkc3V2FnbUdONDFlVWd4bnRLTFU2eEtEc0Y0dXlXQ2p0VWtV?=
 =?utf-8?B?WE44cEtWOTZoSDc0RWVrU1VNVlk4VC95YTA2L1VSenJ0cExHMERWbnVnT3h2?=
 =?utf-8?B?Q1hnWFFYdGd3TytQL1lMYThlWjloS0dpNHZyenVSVTNGU1ZlUVBlUDZ2WS9N?=
 =?utf-8?B?RzdGVXpLQXZIN3FXWTdKRUdGUUNaYjBDM09EQWVUU3ZwT1k0c3oyeUd0VEFz?=
 =?utf-8?B?UDAyakdjbG9GTjIxL2Y5Mkg5WHgzZmRLcXAvY2tZR0tjd2NKb1ozVWVDR1Qv?=
 =?utf-8?B?ckxtQWp2WXBXVGpZYzYyZWNybnlPbjBJeVVtQ0ZrTDlDRTFuNlFPZ3FvbXhi?=
 =?utf-8?B?cFRMRG9sMit5UmxlQ3NtMTA3NHNYMXhCdjBEYXo1by90dW1YbWZHWTQ4anlE?=
 =?utf-8?B?cXRLbitMTEkrOFZnOU5hOTk2TCtpUVorWG92SUlqQWtYekFJQ0ZybGU3d3pO?=
 =?utf-8?B?QTM1MDV4enQ5NjBmVDc4OEplc1JnOUNqMFVzYUJNZnFpRHAwaS9iWUNKejJ0?=
 =?utf-8?B?cXV4VEZnSHBEZUp2cDJWSXJPZ1pqY3VOTXdhTFZaZTdGZlpIRzE2dUhMc3B6?=
 =?utf-8?B?RzRvUlcrYVJRcFk4SjVZeURKbEx6VGR2M1BKQ0UrUW9LSlZESk16TExNbnBt?=
 =?utf-8?B?cTBLUjJSWHhUU0hBOFJoMEt3cGxWMzU3NWFKb0tmcTR2UjFOQVlYUXlIbGgw?=
 =?utf-8?B?bEJYM3hraExrV0taVHBjUGh5b0VKVDEvNWh4NlJhK2NVMGpZVjNzcjVJci9a?=
 =?utf-8?B?dGJUekNXNzh4clE4Q0MyTWR6V1l0Nnc3SnpZeUJKc216K1NPQUxKTklXWlJP?=
 =?utf-8?B?d1lZT2tJZ2pteG9uOGY5aC8zTzgzQzN0c0Fpa0lYOUdEVjNjb0Q0ZWhxcHRj?=
 =?utf-8?B?MzA2dTVjeVFENE5uM1ZNeTJ2MVQ4RkU0ZzNGdnBJUm50TDFQMnQycFIrMXJK?=
 =?utf-8?B?ODJKZmFUUEpEbGpoM0JTVlpTSnowVkRyTWhLalRwcS9ETTlCOFlWOWwwM0Jr?=
 =?utf-8?B?Q3dRRlpVSFdRTWpHcXR4ajlIQms5cWtlcmw5a3g2NUtEUkRZY1drK1FiQWR2?=
 =?utf-8?B?R0ZwUmJHM1l2dDMyU2EvalV3TWp0ZENnNzFsUjBOSlkwTTNQYVZ4dk05Yi9I?=
 =?utf-8?B?WjBrTGh0TDNna29zTWtxTGV0T1VZRGxQeUxxN0pEUjJ0VUZIQjE3S0VSVm5S?=
 =?utf-8?B?bWxYa00vY2FRYS82V0V0WVMxa1NsS0ZZNWl2amRqZm1neWNPVVBuTkNtcnFF?=
 =?utf-8?B?WTNCSENabCsxRVVwMWhlalVrSlRkMDNMUzNoTFhIRWJTdytPMnV1eXNlOVdD?=
 =?utf-8?B?b1d1Tk1oYjRoaW56cFdLN3E0WXBmSlBzeDkraGRYM2p6QVcrSTU4VHpiaTYw?=
 =?utf-8?B?SjQ4UjViTHgzSlllN3l4ZTVubUgyeFZJZ0FpSXFQQUc5N2w1dVBjRkdYd2Rv?=
 =?utf-8?B?dnRKWTdvVFhLWUVHTEJ6Z1EzcU15T3JrVDJjdWpQSE9JazdFaGJZTjBwMFVB?=
 =?utf-8?B?QkJzcW94TlYweVhpODVuNldkZitvTjc4STQ0SnR2WThXSlVXRDhZdVpNQzhr?=
 =?utf-8?B?THY0bDc1OHNBOTkyUi9Gb3Ava1ZqM3MvK2JETzhJZzhlQzhIbGEvS1JtMWE5?=
 =?utf-8?Q?cCecoAt5seJ7YsCIFXVvwxq87?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55340ce9-537c-4f68-b172-08dd7bb4572f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 00:27:44.7420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bTGQn8O0alHz/dlTL9vqPplbWQXRJk3pt4/MTbI6YpaRx1XQUfMkNUBIkSyF2zZs0u2S1eobZr9Y61+GxIJdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7891

Hi, James,

On 4/11/25 09:42, James Morse wrote:
> Resctrl is a filesystem interface to hardware that provides cache
> allocation policy and bandwidth control for groups of tasks or CPUs.
>
> To support more than one architecture, resctrl needs to live in /fs/.
>
> Move the code that is concerned with the filesystem interface to
> /fs/resctrl.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since *:
>   * This patch is generated by a script.
> ---
>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  636 ---
>   arch/x86/kernel/cpu/resctrl/internal.h        |  380 +-
>   arch/x86/kernel/cpu/resctrl/monitor.c         |  902 +---
>   arch/x86/kernel/cpu/resctrl/monitor_trace.h   |   18 +-
>   arch/x86/kernel/cpu/resctrl/pseudo_lock.c     | 1080 +---
>   .../kernel/cpu/resctrl/pseudo_lock_trace.h    |    2 +
>   arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 4556 +----------------
>   fs/resctrl/ctrlmondata.c                      |  660 +++
>   fs/resctrl/internal.h                         |  442 ++
>   fs/resctrl/monitor.c                          |  932 ++++
>   fs/resctrl/monitor_trace.h                    |   33 +
>   fs/resctrl/pseudo_lock.c                      | 1115 ++++
>   fs/resctrl/pseudo_lock_trace.h                |   17 +
>   fs/resctrl/rdtgroup.c                         | 4313 ++++++++++++++++
>   14 files changed, 7668 insertions(+), 7418 deletions(-)

[SNIP]

> diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
> index e69de29bb2d1..29682dd46871 100644
> --- a/fs/resctrl/pseudo_lock.c
> +++ b/fs/resctrl/pseudo_lock.c
> @@ -0,0 +1,1115 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Resource Director Technology (RDT)
> + *
> + * Pseudo-locking support built on top of Cache Allocation Technology (CAT)
> + *
> + * Copyright (C) 2018 Intel Corporation
> + *
> + * Author: Reinette Chatre <reinette.chatre@intel.com>
> + */
> +
> +#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
> +
> +#include <linux/cacheflush.h>
> +#include <linux/cacheinfo.h>
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/debugfs.h>
> +#include <linux/kthread.h>
> +#include <linux/mman.h>
> +#include <linux/perf_event.h>
> +#include <linux/pm_qos.h>
> +#include <linux/resctrl.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +
> +#include <asm/cpu_device_id.h>
> +#include <asm/perf_event.h>
> +
> +#include "../../events/perf_event.h" /* For X86_CONFIG() */
> +#include "internal.h"
> +
> +#define CREATE_TRACE_POINTS
> +
> +#include "pseudo_lock_trace.h"

[SNIP]

> +}
> diff --git a/fs/resctrl/pseudo_lock_trace.h b/fs/resctrl/pseudo_lock_trace.h
> index e69de29bb2d1..7a6a1983953a 100644
> --- a/fs/resctrl/pseudo_lock_trace.h
> +++ b/fs/resctrl/pseudo_lock_trace.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM resctrl
> +
> +#if !defined(_X86_RESCTRL_PSEUDO_LOCK_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _X86_RESCTRL_PSEUDO_LOCK_TRACE_H
> +
> +#include <linux/tracepoint.h>
> +
> +#endif /* _X86_RESCTRL_PSEUDO_LOCK_TRACE_H */
> +
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +
> +#define TRACE_INCLUDE_FILE pseudo_lock_trace
> +
> +#include <trace/define_trace.h>

If applying patch 1-17, building the kernel reports this error, which 
will cause bisect failure:

   CC      fs/resctrl/pseudo_lock.o
In file included from fs/resctrl/pseudo_lock_trace.h:17,
                  from fs/resctrl/pseudo_lock.c:35:
./include/trace/define_trace.h:110:42: fatal error: 
./pseudo_lock_trace.h: No such file or directory
   110 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
       |                                          ^
compilation terminated.
make[4]: *** [scripts/Makefile.build:203: fs/resctrl/pseudo_lock.o] Error 1

Again combining patch 18 with this patch together makes the error go away.

But you said combining them together may cause the conversion python 
tool complex: 
https://lore.kernel.org/lkml/97aeaf87-b2db-4efb-9d81-43769c6f27b0@arm.com/

Is there a better way to resolve this error? Maybe update the tool not 
to generate or include fs/resctrl/pseudo_lock_trace.h at all?

[SNIP]

Thanks.

-Fenghua

