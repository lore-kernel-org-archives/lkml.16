Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2102.outbound.protection.outlook.com [40.107.104.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9013199237;
	Wed,  7 May 2025 05:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596308; cv=fail; b=A7P2V9ZeNOpSxlwatVfIhLdfktVPz81iNRcSTP0uXGiwYgc5pM+q67OaBRQ7h+2e+4Y6y2xP0IG/hMqDwVQ0RQWHAwoh9Viz3mksT4FxpKaOxSacjexd7V3R9K+4owrpIihO+nQnYYcA/FfE5fnGKZq/c/4u+Dmh1Lcr2p953Y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596308; c=relaxed/simple;
	bh=vpYVEK/y+XIIYWcoJIQBGb2QYF7WIOJ5sNtNYrGSRAw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZmDUP+apcSjEGYj7McjA80iJccVO0FHQAmBLjBuQ/gVwvN/l7uwZPoJjdt0qVQDXtfva7oJ1p1E0cjlKiXAcQMdCgtZ+f+TTX7tnbUMcsOZVigE8E9Xzw+9bX0R/GUSIWChavEZCRUlZ6Md8b6b9K8jqTyRfeF20rvIb/M8WUCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=BRZYVmUW; arc=fail smtp.client-ip=40.107.104.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="BRZYVmUW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDgNpZWnAebdzgtvwMFaq+ySeX+Sqx/GrdTdKTgQvAu3y7+9eXUpqounznR5NY0pDaaUN8DI07MXfBZRfWqSW2rSbqX0LJF0yzGCXwT/FNFQFBh8vP446cPlShaOTxgZ8s2vrO8SXGY3M+Cwjn1z+izzr/FSnZwNC6oqu+SvJG8AGXemiUxaKp+F2YpujJxByPuXHOHf4VuchwCLvxsNsW/l/AgUk1pvyyIW0oJUC2QCeUroPYuBIkY7G79SZwIblsWglBZrmIu6UJYF4LL7PUuFmVCQrUu4/TMCeDihzmDiiaHrptwMieaLO59J52ZXLYl5/jR3JVeW/3uHQ7GkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qxT6HEbf4EMWcLktiEEktfZ4hQDyYnB8aBhowmFlNE=;
 b=a0CQhQOGu/KFqyAsN4YVWCm9ID6UpkSo4uk2tulhLIzpvGn77JyFKNDfy5Cn44bYZUIx0SeZXmyeHZPi45mafJ7qJOfNqSBIxxYUdYIyoC63wfa2VPukeA3c+GZFKUN1Z01D8hZdyJuPuQQ61oKJET7h6McnXEwRfELoj4DlKM7AU8NkhJ+6dSsdRKKvUkJhS9j0M/ZVUDIGLTAm56WRxcsGPpUlqIjM1gC3vNcI2rjoBFOVBgWCLBa0yfvlKOpdz27BJ2u/kbKiYYdKxxCdpI6P8GDsIs1xgPDfp9n8RIef7LaUycvA0hhiYF2c0BvB9fX4+Rpgror0kuvealTKVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qxT6HEbf4EMWcLktiEEktfZ4hQDyYnB8aBhowmFlNE=;
 b=BRZYVmUWNNmhx7VLca6QM9hbm60I0HPm5EWT5T1RT5dB44x8G8woC+c6mMecws1nLnFSrf30LMrR8XUuwggpzjEMQbnlCJOFd/uSKvOt9YBm2lRgBhah/aKigM+zFE94cVdmU4VB5SZDitPh8VthyALaQcr6sHaP00o3PWJdeNio965onXQk8bXArQ150awQbWH+bHvROgTEm1lQkkVQZwzRQ8XnUwCvzkbVydW9pCgAnqhMLvHDmw3H6V80IN0qdrEStBaFzahHBff4hTzCTucpGVNnOJk9YPap+HHb6fqLE67+0CdZqi6baCqkdvD1hG2A5V8SmiWCFpGI1E7tLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from DB9P195MB1444.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:33e::16)
 by PA2P195MB2535.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:407::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 05:38:20 +0000
Received: from DB9P195MB1444.EURP195.PROD.OUTLOOK.COM
 ([fe80::f79f:1750:8791:4336]) by DB9P195MB1444.EURP195.PROD.OUTLOOK.COM
 ([fe80::f79f:1750:8791:4336%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 05:38:20 +0000
Message-ID: <db40cbe5-8ccd-426e-ac51-571086b4bdd4@phytec.de>
Date: Wed, 7 May 2025 08:38:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] [PATCH v2 2/2] arm64: dts: ti:
 k3-am62x-phyboard-lyra-gpio-fan: Update cooling maps
To: Daniel Schultz <d.schultz@phytec.de>, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de
References: <20250506114134.3514899-1-d.schultz@phytec.de>
 <20250506114134.3514899-2-d.schultz@phytec.de>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20250506114134.3514899-2-d.schultz@phytec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0076.eurprd03.prod.outlook.com
 (2603:10a6:803:50::47) To DB9P195MB1444.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:33e::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P195MB1444:EE_|PA2P195MB2535:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f803f1-737f-4f76-1ead-08dd8d296009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUc1bEFhUTMrYlFramg5SEw1L2VFYVVXMEEyMmZ5dXpxOEVQU2toMEJYcXN0?=
 =?utf-8?B?Q0ovbVpVcmxYK1JVTGdZbHNDWDBQSzE3TW9yR3ZoNE5uZnJKZzNGSE5SK3E3?=
 =?utf-8?B?L29weTZYdVkwNjZlUUQ0dGNQYXI3L2hQOUJyN2lkemhFSVpIaUVwRENNRkpq?=
 =?utf-8?B?NHNzemp2bWxvYmlYczdiYkhCTzZJeVZubDJ5bWpvMlNSUmtId1E5R2tOSFVi?=
 =?utf-8?B?UnVzNjRKeFArV05GUVdENytoWFJHckNadVp3dlVHV2xWODN4NGxaTUlUTENv?=
 =?utf-8?B?WE9WMFdCYWY4VmxQRUFKdTRlczdnVnZFTzd4amxVa3hVdTJYVFg3ZEpaN2hX?=
 =?utf-8?B?ZW1aeDBZMWxtUVRtRFN4aStaczlHclh0YjNNWkNZdWcyc0dubzhTVkZXMHRs?=
 =?utf-8?B?RG10bmxORG02Rk1uaFhHVllNNkp5NG94bFVBUzE0b2hDQkhKUXVlVmI1MElF?=
 =?utf-8?B?MG83ajZjOGh5cDBNY0FCMmdwMmdvUEVkUWJNWFF3M0hldGo0aEVFVDBZUHhY?=
 =?utf-8?B?aFk4YllJbHVVb3BMSC84dmFYMmJiSXNHOUNzRVRrODYyaFFMTi9SOGlpU2Fo?=
 =?utf-8?B?c3Nud0llRjAwcG5ZdzcrOUJHWXliZnM1dzNVL1F4RkRRTVhzbDJ5a0x6dEgw?=
 =?utf-8?B?ZTFOZ2JFaVp2Q0tkTERRWTdhQWFncTlzQkZDOGk0Y3dCSThIZ0xuK0lodXpE?=
 =?utf-8?B?Wml1eGxQem5handvOEQzNGd1T0ZBcHUxNU4wcVU4UXRUVUdMbldob1VOdVdN?=
 =?utf-8?B?Nks0U08xVWJ6eFVYWjFXQmRJWUJWcXIwOVRubFdhcVdJQzM0VnU2YWpPeHQy?=
 =?utf-8?B?SXc2WjM4MkhmYTgxTWJ1QVpSVVBLbmkvRUF1QnFqdktUazdpbitwNDJQTmZz?=
 =?utf-8?B?OW83bklTOEF6UUNQUGxaRWxJRzI4SVNXbmxDTXZqVUNKWWhMTUVJR2xuVWJn?=
 =?utf-8?B?RW1reFJ2U1ZucFpuUjZpNTdWN2ZaTFZZVUZZS2VYcmROaUUrV080YUFGWTRU?=
 =?utf-8?B?eitiaFdmU0ZFVS81ckFjR0lGcjFBQkdyRmVSd04wU0c2S0FUWUZRRjRqRE9T?=
 =?utf-8?B?aCtwZWo3UXhNbk41bEhueXNia3MwOTN6ZkZ4RStZRW5lS0s2ajBhSDN0QWxv?=
 =?utf-8?B?Ymg2R0ZKdDhYY0s0L0E1RFllMS9rVUFCMHZzT05uamlSTmdRaENtM1drOTdR?=
 =?utf-8?B?c1VMMENCMjBpYmJXL3BTZGZ0eHJ2L0MycWxabS8ycjVpeUNnZWdjVk9wTjRG?=
 =?utf-8?B?RGVMVDNwZ0U1WUJVcFdnYmZjeEhXNjluVkw5dk55czgzTmwyVzRHQzUxWDg1?=
 =?utf-8?B?cW1KOVVmRGxxQXR3NXMxTFg1UG9BeHkydFRNcnVkSnRSbTJ4eFlMQ1IxNTlv?=
 =?utf-8?B?RGZ4UktVdXdNZXAzRjBoeWR5R3VWcURDRG9IUlRZM1ZRZXBtMW5ZODVHOENl?=
 =?utf-8?B?WWgwbThQNUhPMHJPRHVnOGhlMkljcnNxY3N0RlIrR3BGSjV2WDZYaEZkR1dZ?=
 =?utf-8?B?VnlBVzN1eStma1lvcVpvcGg3TVlvN081L1lnMUQ4ZEtFTkpKcm83N2hSMERI?=
 =?utf-8?B?ZTg3RWFmQlY1QVVWeE1UNnNRM0lXT2tNTFRhWEtTODNqWEJFcUNEVmJ3OFZ6?=
 =?utf-8?B?M0RqUjFDOHBqME1kTDloUDNqNGV4QUljYi9xNmRqRWh5cFNJc0JwU21VYTVH?=
 =?utf-8?B?dktxZ0lxcmdoMDF0QThTT2dTczlGcmFIN21MdmhZSVdDYTB3L2NtTHlIRlNQ?=
 =?utf-8?B?bDBQMHRmNUl5eGJ2L1l3Mk9Zbmx6SjVKcXV2Rnp4K3M5MFRYUUlUdVhsakxQ?=
 =?utf-8?B?ejhNQ0xJRmpleWU2R3U3UnNJMmQ1d243eFZhVXNFbU9UUXBockxKOUpoYnVL?=
 =?utf-8?B?dzdJS0FNRVFhZlptdkVUWDZOOTl3TUhMRDhsTE1sQVdiUzg4QmszT0FLN2tN?=
 =?utf-8?B?b2dkNFFiUjhmeDA5ZTNxR2pHMVFUZ2lNSk9jbE9TQjR6endaeU5JLyt2N01R?=
 =?utf-8?B?TzFjTXZ5UnJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P195MB1444.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDBpallTT2hkalNaMUxZN091ZzZ0c2xzM2VyRmVLbGk5R2k4UG95SmFTZXRJ?=
 =?utf-8?B?cVhLUE53QVdTRWVGUEl1SXJOcTNEcld1RlQzTDRlWTNYV05YdTlRZE0zRU4v?=
 =?utf-8?B?SFNlTU1DcXJiMHk4eUc3VmZ5aS9nQW5TZ05zb2hJQzVGVE03NGFWNjFjMzRW?=
 =?utf-8?B?b2lFUHdCaW9aSlp2TG9GdHVQcjdneUpLQkJueGRZQzlMTThheVk4djArZGZV?=
 =?utf-8?B?QlRZa2twRTNTOHdsTmFhbjQ0R1dtb1JoZTZJUjd0NGIzWS9uTXVFRVd4Ymh6?=
 =?utf-8?B?V1c4UW5TdEVkYndaTGYyNldSeVVlSTVuSDVRNzZYaHdkTlhmbHhzcHhQVXdt?=
 =?utf-8?B?aHlXbmEvZFFReXNrN0doNFQxV3haUk5VOVZJbXp5VVNkZW0zZ2NIOXRRSG1j?=
 =?utf-8?B?dVp0c1hvV2dvQlEzSlNmVU5ESDVocnRXd3M1TjFraDJXa3dYTzc3ckxmM044?=
 =?utf-8?B?emxHWDlrNG8rVVY2SitSd2kza1c1N1ZQbkQrcmxheWRsc0hWNHBFQWdjaEEw?=
 =?utf-8?B?eTh6UUE0aEZvM3JrRWsrcFJYVUJ3MHk0L3pUOGFlcVJCTGhiTEdvczE2QjRI?=
 =?utf-8?B?MDg4VWwyQzl4RWtER2NBa250L0daWXdJY2RQZ1ZtZHZYVDBGRlhSQ2h3Vk9h?=
 =?utf-8?B?L1l0QXQzUWM4TExVdHN4UVRWUUxGSTA0NVRXclI4TmlBOHg0SDN0am10NEJx?=
 =?utf-8?B?R0hKSFREaGNYbncrSm1OTVlnM1c0VWpZT2d3VG5NVXI4Y1R2UXA3bWo1Y09l?=
 =?utf-8?B?T0xOdnpidG1OemYxSmRBSml5VmoxZ0d6dC84ci9tZ2IzKytNSGZnSHEwVllS?=
 =?utf-8?B?cVgwZCttd09CWVZuUmJDeGZIOFNOUUFFYXRTZjUzMFNNSDY0dEN2aVVXeDhC?=
 =?utf-8?B?YzgyRW0vNXB3bllLWFVKOUlXSThqb2VOU2pLc2JRL2c0TVR1SGd2RFdmbzM4?=
 =?utf-8?B?azlJK29MNUhFbkYxVFhzajRzeWp4TTZFZWVpMnR0MFRYcmt1clExNE9WbEly?=
 =?utf-8?B?K1doMDdtbnZvdnRIYWIwa3pOTHdCMmlYMGcrd2JXODZTSEJ2Q3lGRUdMSit0?=
 =?utf-8?B?VWRRQWtCTzU4bkdpVUwrV2NyQXI4L05oVmhKMDRHb21lQ1JZUHNYbFNyNldZ?=
 =?utf-8?B?dytJMWxRKytYSDdkcjFWZ3RuK281QlV4UXlWZjBCQ1pqRlpKa2dkc085ZVB1?=
 =?utf-8?B?K0NWSzQ0SWZsc2d6RlBNMW0xMVVYS2NPM2xOVVlkSG5vcTdaVzBwOWxUeW92?=
 =?utf-8?B?QlJnUm9BazFWeWs0SHBQNTVpRjRlcGFxU0o5VnFwRWptWVRnUVNTYXlCVUh5?=
 =?utf-8?B?anp3Y2tWYmhzQWp3a3d1MWVkSU1jZ2lpQ3RqQStnbFJIcFc1bWhPcHFBcXZv?=
 =?utf-8?B?T2lEMEZEUmFMZS9oRU9BdUtOdFozR1lMcnYwK0NKSW0yZVArTDYxK0p0T2Vt?=
 =?utf-8?B?ZnZuYThFYW0zdWFzVUZrS1JQVDBDQVlDY0FUcEtSWmo5TU5DTVQ5SExSaURh?=
 =?utf-8?B?QUcrMlIvRXo5RWU5cWFkdmlKYUtIa1l5c1g3UUM2T2IyZzlwTHQ1eCtYREFl?=
 =?utf-8?B?bm55WWdPSlZEVHVHdUMrcGlzQlFXem5FbW41NG5idUszMU5majJwY1pWY1hP?=
 =?utf-8?B?VlNreHJJOS9SUG1ZK244eUszZnF5VksrTTNUZ1A2RXJTejJGakRmalBqd09T?=
 =?utf-8?B?K3U5eGNMRHNGTzJjMnFmdGFsZ2VmK2hkck9heGkzNTA4cGRMUzNXb2FONFY5?=
 =?utf-8?B?bUNhbWJQOHRlQmpWKzVIeFB2Qy9tN3QyVVBUN1V1UFAvdVNNb3ZTcDM3Umkx?=
 =?utf-8?B?L3lhUnpiN0MxYmw4K2ltMDJ5M0hxcU05dktkcU5UY2Zqd0dZRWE5dWVTdWZq?=
 =?utf-8?B?WE4xNTR0QTh2U0dFYnErVitpVnhSRmpjOVc3bk80WGo5WXNMRllYU2hnVHdQ?=
 =?utf-8?B?SW1DSkdXalUrS2piL043MnZaaWgvL0dwQlNGUStiT2lnTUpxSFE5RDdqd1h5?=
 =?utf-8?B?alpyMEVtRGY1aE45LzZTL0ErWUtwQUI5d05OcytWcHpUL2FEQU44NTdmRUg0?=
 =?utf-8?B?dFRkZmV5NHc4NkY1RDZtTWN2a2lXS2RZSDFqVDhYaHpsTWtiU3pxM2dZcmlv?=
 =?utf-8?Q?d+5Hain7i5c/0inQXtb81kbpJ?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f803f1-737f-4f76-1ead-08dd8d296009
X-MS-Exchange-CrossTenant-AuthSource: DB9P195MB1444.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 05:38:20.3859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBWcFWQsSVb1GHe41q0YRtREwRqUMdCGS80KBCEXWhmxt33RM751UOn6enTVoROHyDES+bVpfbS5K/gO2B9fZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P195MB2535

Am 06.05.25 um 14:41 schrieb Daniel Schultz:
> Rename 'main0_thermal_trip0' to a more descriptive name that
> includes 'fan', as the current name is too generic for a fan control
> trip point.
> 
> Move the fan to a new cooling map to avoid overwriting the passive
> trip point used for CPU frequency throttling when this overlay is
> enabled. Also, add the fan to the existing cooling map.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>

Reviewed-by: Wadim Egorov <w.egorov@phytec.de>

> ---
>   .../dts/ti/k3-am62x-phyboard-lyra-gpio-fan.dtso    | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra-gpio-fan.dtso b/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra-gpio-fan.dtso
> index f0b2fd4165a7..1fd0aaff3193 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra-gpio-fan.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra-gpio-fan.dtso
> @@ -33,7 +33,7 @@ AM62X_IOPAD(0x0a4, PIN_OUTPUT, 7) /* (M22) GPMC0_DIR.GPIO0_40 */
>   &thermal_zones {
>   	main0_thermal: main0-thermal {
>   		trips {
> -			main0_thermal_trip0: main0-thermal-trip {
> +			main0_fan: main0-fan {
>   				temperature = <65000>;  /* millicelsius */
>   				hysteresis = <2000>;    /* millicelsius */
>   				type = "active";
> @@ -42,7 +42,17 @@ main0_thermal_trip0: main0-thermal-trip {
>   
>   		cooling-maps {
>   			map0 {
> -				trip = <&main0_thermal_trip0>;
> +				trip = <&main0_alert>;
> +				cooling-device =
> +					<&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +			};
> +
> +			map1 {
> +				trip = <&main0_fan>;
>   				cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>   			};
>   		};

