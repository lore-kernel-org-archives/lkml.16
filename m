Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012004.outbound.protection.outlook.com [52.101.71.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA83C239085
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.4
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282608; cv=fail; b=asTYgkzErDR7C8VP3dq/UX0BKdLPj0JciG0y3ZuTIDQdwF5TwT3r9otzBj1np4Vgpui2eE55xIit3szpiu1t96hMiHYdBKIcCWCBbUi7+iZ8nnuxQloD8To/9Iwfq5XDxJBTQ/dlZY0GhhnfHHcJ4doLX26MS1vDzSFKbD3m96Q=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282608; c=relaxed/simple;
	bh=CVQhaPsgPSEXHN6PuwOqqLQ4DaG37LOq31qDaWjMg+M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cu4Hu6bd7iYIBiJaMtJOgP9cSAP3moFQYeC7vjy+mrKN9xpWxTeoy4IO/dBgvjTUrj1l3ApkHZGZr8oQT9BI93HcoCHyy+WA2zWGxLI104SbIXAIBXmLKWPAwCjEeHga2ijZm/F/l7DrMti5MtwI1yP2REynWvJ48zEi8r6Fk3U=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=p/yrkQFL; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=p/yrkQFL; arc=fail smtp.client-ip=52.101.71.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="p/yrkQFL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="p/yrkQFL"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fcpCFYktyzksyu3GUIXHWBHpnCVyEEdCAq41NQbi3uLWFdHrllHW3lp69sf+sT5KObRHVvZJlk43HPdUnblXXosj/11S5VzPIoNQepHWv0bBJObBff9jBBZ7aWRTJIpF82qCU7TxVVIJ5xRAcfrE46mNz34IU3OOl4jDNiFEdmrxmk3OhJimYdvwX4/tNBBuAkIee1qQslz4WuVIgZ2Rr0p/XfbK3hwXPrBZ/kQuQ9rLlIuLWBU43KEYnw72P46cmf3Kh/fjh2u7n/zmbId5kzn5dLYpWqPRvgCEqndJlCNZ81K0qjDl0m3wsE9MTBvJJ0rx/HVWEwub9jZLSaS9CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVQhaPsgPSEXHN6PuwOqqLQ4DaG37LOq31qDaWjMg+M=;
 b=xBSDOgLehB7xQm26SUVIgooSVLyWkusFeUL6oxWbaKaiJlIzcFSNiaIFg3LYHrt7xmg5dL4V1l/a82gXM7PCaPTutOvh3SlFAzJRPCjNHkFGcZbEPSON3PFCmUpnWKHglBE4nUkZK9WCNF4iPBc0Y49aMFl0coRdm/IDo2PUPR0sr60SSZ9y+DiRsanslXyai0uYiQxtgW1R+oI3pUEd2d7zWsFQJ23vtG74/GbxgVNPaWQ/NSvWsvNQ7TOzfjrf+6vyBUSkeY08KscSShTWbZaMwZPu7nrutUGeB2tCJUal/9gxDsPRZPS+v8vfpb54DMx8cCskFJdmS0JwI0wnMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVQhaPsgPSEXHN6PuwOqqLQ4DaG37LOq31qDaWjMg+M=;
 b=p/yrkQFLvvteqpYjtAFIuL9fsmUf9yoA+wtjtmxhMvkXS3kx32DpUVtikuUSYXscfM1AbURtBgP1xQQaWvslsGEL9RBs5J1UyF5XfugBsQ6UzEGfhMdj3wDuYaGZDnezsdHLhjlwMAPdwQOqjYGFcS6AeAINlIrhPr+tY12ypJw=
Received: from DB9PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:10:1db::7)
 by AS8PR08MB7885.eurprd08.prod.outlook.com (2603:10a6:20b:508::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 11:23:22 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::20) by DB9PR06CA0002.outlook.office365.com
 (2603:10a6:10:1db::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.26 via Frontend Transport; Mon,
 30 Jun 2025 11:23:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 11:23:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBoNt611AgT3BwbKxsfR6KTccIZue0pgppwUvMEgDoUi2L/vj5E7J2x6UiC/sb2c8kPP1dSK1XGzJKgYXGn/QdlItTVBI2auK9FjFEQG4KHx0LoUKJ0WBh4ekaLsqSZAs0bT+vKx6lZhA6uRXD/eCURA3RKYL1U6/mzFii+AWQk1M0DN2xz4P1417WOAis0n6wOoy3wI1YrT0Iic3JzG0hk7IsuPXSi8xtLVqi6OS9exE/CnYkUjj8Q8mtabVy4ez9TRPAz2iIuEnlz7b2KwWma0WbKUKmmFyWhsP4J7bHPG3c3tSG/SJpDXMOFxWeYP0IqOcOUj3e0QNl8IwJtg3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVQhaPsgPSEXHN6PuwOqqLQ4DaG37LOq31qDaWjMg+M=;
 b=mAhRPy+U1DiVfM4+Hhkhr8aOy0S+0/sIjDpzQCotHjhnPRShCu7sK+EjtjERViUMcHovzjCUCBC82ZUwPhpT7sm/mcQhSkOc33yRSMbNUIvFK23gUoge0gMkd4X5xbfOCgQYMM44/ew+FuCQp9V5YoY8RVy8zq3fzMZ2FZa10NUKfh8k1zI5QnGaKJJhdDmSArRieTx/Un3+CzWAmKSmkhC4klhIW0Jpx9XZOkGOWJDit4tmA/0lh/ZLRlcPjlYDatKB9dTixXPDMxLgwl98W84H+PbmFqTK08Jh8FAhq5UYm6gJc+GE3Ue1KMGBv6b21QyLB7PXLguOHyPMaX3WpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVQhaPsgPSEXHN6PuwOqqLQ4DaG37LOq31qDaWjMg+M=;
 b=p/yrkQFLvvteqpYjtAFIuL9fsmUf9yoA+wtjtmxhMvkXS3kx32DpUVtikuUSYXscfM1AbURtBgP1xQQaWvslsGEL9RBs5J1UyF5XfugBsQ6UzEGfhMdj3wDuYaGZDnezsdHLhjlwMAPdwQOqjYGFcS6AeAINlIrhPr+tY12ypJw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PA4PR08MB7459.eurprd08.prod.outlook.com (2603:10a6:102:2a6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 30 Jun
 2025 11:22:49 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:22:49 +0000
Message-ID: <cfa3a3a8-6075-46ff-8150-597c8bfd0652@arm.com>
Date: Mon, 30 Jun 2025 16:52:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Optimize mprotect() for large folios
To: Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250629160549.da922e78d202c510a1ec68f8@linux-foundation.org>
 <29f418be-31c4-47b0-bcac-3375f57d00e7@arm.com>
 <7eaee53b-d538-4991-addd-379a380b8ee2@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <7eaee53b-d538-4991-addd-379a380b8ee2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::11) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PA4PR08MB7459:EE_|DB5PEPF00014B9D:EE_|AS8PR08MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b63d34-e17c-40e1-637e-08ddb7c8859d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dkUyTGd6KzhvMWF0eFlia1MzSjc4WVNYeUhlQ3V4cDFPbmpHYkdYRk5aSW8w?=
 =?utf-8?B?SkZrZzRKbHhva3ZHenEvNHZWVUtVL2t5UFJoK3hzditEWXh0Y2dpU3FWeDJE?=
 =?utf-8?B?UURzK253VmE5UXhpUXRRK3MxSmcySGJqN3Z6Tkw1dnY3cUlIb0hGRVY5ekJJ?=
 =?utf-8?B?RFBPYjFqSzBhZnRvc3dXRnVDSnhQOXZLWFFReTVkYlJxN0lwems3NkNDWDdN?=
 =?utf-8?B?TVFvc0cyNkYxellldzV0Nzd6MTQzQUVWcnZTMXNleXdtTyt1L285bWliMlp3?=
 =?utf-8?B?NjRHOHVYWDU2ODJPYi81VE84NkQ0N0VNODgyeUl0OUNNODl1Q3dmaFgrWGZq?=
 =?utf-8?B?Vm82L1VRb25xRUw5bGVXdmFkOVZSSzM1Y3oxQTZ2MHlVV0QrZGVZUC85VmtC?=
 =?utf-8?B?OXV5RDNrVHF4K0g5U0Z4RDBDMFoyaVB3aVQxcmdTdjdBSmRyckEwd2pnZSty?=
 =?utf-8?B?TUpIUlJ6UWk4ckFLSXpwL1pkdVlETXR1U1BnYWw0UzNVRkx0M3N4K0hxK1ov?=
 =?utf-8?B?NlJGNGlIMFN4bitNTlZZbForL2hiUDBWeHYycngza0xXQURZd3k0a1lhNEla?=
 =?utf-8?B?WnVuMVk4OEpIRitPNHBOclhtMW5XOWlySUpuZ3cwWDhpc2Voc0tGZmU5cHNF?=
 =?utf-8?B?dVdJazFmVk95M0h3V2tpVVlYWGpwVDQ0UEZVL2FpQkFhdVozV3ZmdEIyblMz?=
 =?utf-8?B?TkhMbXkyQml0YlRuVjFaWlJweGg0Vm5HVXUyUE5pNGlCUFNDcStZbzRzblZn?=
 =?utf-8?B?MERaWGtKMXhZVGlFTDlsaEgrOUJJbDBNZm5FbzMweWFsYk51c2hhL3hSUW1P?=
 =?utf-8?B?cTZtc0R5ODYzV2xqV2l1TFE4Q0dnWHBFL3JoSWt1STljU2tWRFZaODd0TXhm?=
 =?utf-8?B?aDRQWmMyK0JpenFGSk1yUE9ncmNyMTVRSlM1VURJN1hPMFhIWUVDRktDN2tZ?=
 =?utf-8?B?ZXZyaUR2VWNEWFZHL3NjQ3NPS29oY3VrZG1MV05WRUhRM1hSWFh3dlc4QVlw?=
 =?utf-8?B?QWVvYkRialJTMTIvUDJOZ2dDeE52a0VoemdqTXlFbFVLQkVCVFFseTlOS2tn?=
 =?utf-8?B?OFVzVTVtR3FMM1g5ZVp6QnVOazd6YUgwRFh1cWhQNHRUaGZSNnNhNGRXQ1JU?=
 =?utf-8?B?aFJkTWN5SjFaMm1VYW1wMmJHRVd0WW9qdTBlckdOZDNPV2lVYXJrSkNGMlJB?=
 =?utf-8?B?MzBOem5ocHd5RFV5SGdnRjNJdjVKSklkUWo1Unk4QW9nYlgxb0dHMzdJMUFT?=
 =?utf-8?B?ZXJWc2RlWk15RjAxZHZaYlhXbmtZNkozemJ5Q0dmdkRjclNxL2E0Ym9QODB1?=
 =?utf-8?B?SzZZM05CKzRNSXdFVFdaa3JtQmVZVTZSTGhoSHhjRjlhL0NmMVJ5Uk1DK2o1?=
 =?utf-8?B?bXN5ODlFYU4vc1Uvdnpob0tOZWNMbVA3SS9rcWw2Yjc1WjVVbVlHVllreC9z?=
 =?utf-8?B?ZUpreFJadHdVcWZ2MnFGWHJrVjVIVnNlMHJqWXh5dnRlRm1vRkp4MEg0ZUtH?=
 =?utf-8?B?dm1jbDNLNGtKOXdVRWJ1U24vK3FrMGpKMlNUVCtLWnZtVitSU0g1UDRMZ3Av?=
 =?utf-8?B?bzFuL1RTLzhjWkxsUFFZNE9LcGJOL21QRXpFS1hwczduSk05ZGh6WWlkdmI4?=
 =?utf-8?B?Q1hYSnpIRkJxTEUySVhnajlKTmhyUzZ3clZFZ3VNMkE2WVEvQmhKRUFUdGwx?=
 =?utf-8?B?WDc0STcvMnlXZG1RaUY3RlRyTE1Wakk3QnhVb2hzbVNIVzIyTk5PMnF4U1hw?=
 =?utf-8?B?SWdMUXE5Mm5kTEZTU2ZVbTcxRS9IY29tYjN1T3JHTUI0UEJRVXpQOVRZVnZo?=
 =?utf-8?B?R1JSMUIrUytIZG5KQzFnbGdoYjZkZ29YcUcrUFhyMWRBbVE0NGJNN0NNYkZo?=
 =?utf-8?B?Ym1Memxpa2NtNTNFTnd2MkZ4RUovb2p2b1orTDdSYUhKTE8xOWZ2MXN6U29X?=
 =?utf-8?Q?j0MlMspTi1Q=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7459
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8aa34f30-b6a4-4d41-2045-08ddb7c87201
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|7416014|1800799024|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eThISk80OWNiM08yZStpanN0NGxXSEVWdnlPT2pYMXcwZ0Z0QTVVTzhKbVVr?=
 =?utf-8?B?WmVyRjVOcjc5TmJTRE1lVng1TkRNOVo1T09XQkNSV21WTmJZSnl3bUFua2V1?=
 =?utf-8?B?UEYrSWppYWNraXFwVENaYVlibXY0bUdGbGo4TEQrSldkdldXUTUydVM5ZnVY?=
 =?utf-8?B?WWxjeGwyWGlJVlphWndOOENyNlM3d29YdEV5OFJOT0UzWjdrNXRwZ3J6dXAr?=
 =?utf-8?B?UVExR0twMXdyMWJ2MEY1RFZCN20yY3FCenQyTXBXYU9XV0VjWW1tUVB4eHc5?=
 =?utf-8?B?K2VLKzRUVVYxTUJkY2V3ZHI2QzBCRkpXVmNvUTBmWTByVSs5SjdZcUlXS1Bm?=
 =?utf-8?B?YmtNSUJmVWFUT3lWRWJ2aWkwMTFwSE82eUQ5RGxXb2V1MkdSbUl3Nk1oQzE4?=
 =?utf-8?B?R1hQM3NuWkNpdjZLMytvT1JQWDhVODl3UWxrdUJqMExwK2UrU3I4SUFleXBD?=
 =?utf-8?B?eTRKWmVVN09TSGJZbDRUek1GRWFqVTAvZE04Tk0yekxiaitma1pNem9tYXRi?=
 =?utf-8?B?UmJrWDZab1Nuc1F5Y3RLemlCSU16OGRJcjFJWEl6WXpaVS9kZWdManVQS1lP?=
 =?utf-8?B?YmhxSTU2N2MwbXRnYXFINExXaXcwNjJBN3lwRHB5cEZOZ2VhRmtVWkUyQjB4?=
 =?utf-8?B?ek41ZmFmTzA2ejVtd3Z0dDRKR3o2NDc1RjdrSUhGMEZMQmcrU2tkYjRMeWY0?=
 =?utf-8?B?bUFZbWM3UUk2ZUFCVEswb21hMWp2a2FRVi95ZWhZUjlITDZ5cHlhTnF6Sk1X?=
 =?utf-8?B?SjVVQTUzaFBlRlVDVzlQYzV0NkFVUFczUXFvTHJtN0VXODhCaW5JODc4NUsw?=
 =?utf-8?B?Z1ZmR2w5MFZ1dHREWkdPNDI5WTdCL3dYVS9VajZuaDQyQUFGWlA2cUZFV1NX?=
 =?utf-8?B?c0RIK2cxMjY5R05ZWXFsMTEvekNpanhZbUl5dEFFNWlqMGc5SWlWM0N5cWhv?=
 =?utf-8?B?OWpoR3VtemgwRitXcitCbTR5b0lyclhWK09mS05OcXBNbzZnTmJVRHVqaUV5?=
 =?utf-8?B?MTdlUVVIdWJjRzRxNEVVT3lpdi9OdkdoK0FuYTZ4WUY0UFRGaXlWdmZLcjlH?=
 =?utf-8?B?Ny9tQUlaSE5rL3FDdW9yM2JWY3ZwRW1NS1d4RlBQc0RqSml3T3FqNnk3amdv?=
 =?utf-8?B?b3NRZkdUdVJqTjUveUxrakFCVE9UV3RnYVh3RjVrYzdUR2R2UGIyaWNzdjYr?=
 =?utf-8?B?MExJZzY2SXk4cG9XTy9qRHZ3NUtNRStuNHo4bVQwWUZTWDVHbGpYaEpwVUJn?=
 =?utf-8?B?NXZxTnFJNFBud3F2bEhteE9tRGxwZFlvbllKeDlSN2RuZnpjOVRQODVVOVBH?=
 =?utf-8?B?TnVzeVlVb3htK3ZlVzYvdkp1WFdQbjczYVR6V2p1TGdFcEIrV3MwbUVvWU1i?=
 =?utf-8?B?bE5IYy9EdERFNTJwUThWVUEzTHVCZzZrR2IyUmRKMUVCOExRZzFZbmFYOWE2?=
 =?utf-8?B?MlY3SmdhWnFoOU5wR0FLbDlOTVByeWFxMDkrNm9IUjZWZ3BSTFc5bVdDRXdr?=
 =?utf-8?B?OE5iTlJiL29tRVlIRG1VY3FyVnZndWl4RTg5blRRRzVCdGtXS09GVG9Qem5Y?=
 =?utf-8?B?L2JBSGZSaENUVnk4enJIb1RJL2hCNThWZUVmQ0RDZ25UdTl6QllBOGpOeld2?=
 =?utf-8?B?N1I2Y25tMHlUMTRPY0pLUkNpMFhJQnVVQkh5Y0N2UHdkTndBS0hObWdxWXR4?=
 =?utf-8?B?YXBzOGV5eWMzVk5ISzJ4NHJRbVR2Qzh3UVJDL0pIMC9jR0ljWGx6V25iRTlu?=
 =?utf-8?B?NzZlMjhkT3cxbE1XaXV2SVIrVkhMcEo0b1dNZ25MZzM4SitnQnFGMm9kNzdL?=
 =?utf-8?B?UExtK3hWNEl6WUt5L21QenJHK21BQnFvUVBuUmRkYjBIdE1sRHZRd1NLcFpZ?=
 =?utf-8?B?MFZobFNoZjdEQXRwQXJ1SEJRekpJKzBQVFBCWUhBRGZ5TmJlU2FnN2IrdUly?=
 =?utf-8?B?Y3Q5OHI5N0tlWEpwbHZnTDBHdFVHK1JNZzdrTTRkNnJ0dUIrTkg4Y0MvSTFC?=
 =?utf-8?B?eWpnTUVJLzRXb21IVU53WW9iT0JqQUxjTk05eGxiN2Fadkovd2N2RXFnMURH?=
 =?utf-8?Q?Im/C+6?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(7416014)(1800799024)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:23:21.8541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b63d34-e17c-40e1-637e-08ddb7c8859d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7885


On 30/06/25 4:15 pm, Ryan Roberts wrote:
> On 30/06/2025 04:33, Dev Jain wrote:
>> On 30/06/25 4:35 am, Andrew Morton wrote:
>>> On Sat, 28 Jun 2025 17:04:31 +0530 Dev Jain <dev.jain@arm.com> wrote:
>>>
>>>> This patchset optimizes the mprotect() system call for large folios
>>>> by PTE-batching. No issues were observed with mm-selftests, build
>>>> tested on x86_64.
>>> um what.  Seems to claim that "selftests still compiles after I messed
>>> with stuff", which isn't very impressive ;)  Please clarify?
>> Sorry I mean to say that the mm-selftests pass.
> I think you're saying you both compiled and ran the mm selftests for arm64. And
> additionally you compiled for x86_64? (Just trying to help clarify).

Yes, ran mm-selftests on arm64, and build-tested the patches for x86.

>
>>>> We use the following test cases to measure performance, mprotect()'ing
>>>> the mapped memory to read-only then read-write 40 times:
>>>>
>>>> Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
>>>> pte-mapping those THPs
>>>> Test case 2: Mapping 1G of memory with 64K mTHPs
>>>> Test case 3: Mapping 1G of memory with 4K pages
>>>>
>>>> Average execution time on arm64, Apple M3:
>>>> Before the patchset:
>>>> T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds
>>>>
>>>> After the patchset:
>>>> T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.3 seconds
>>> Well that's tasty.
>>>
>>>> Observing T1/T2 and T3 before the patchset, we also remove the regression
>>>> introduced by ptep_get() on a contpte block. And, for large folios we get
>>>> an almost 74% performance improvement, albeit the trade-off being a slight
>>>> degradation in the small folio case.
>>>>
>
