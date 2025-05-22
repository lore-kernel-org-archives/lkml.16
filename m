Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180A0EC5
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.48
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892796; cv=fail; b=aspC64SWlN+jXXUKHV45kiB0j3eFOPEYglyUBgUms8Wtca2sEeuWUC2YOcTXhWuql+JMO7KxqF3Yz8RRW6HxIIF1suMmp3w6oljZpMhJQP1fTAJgFU0htSiMKzBpf/sR659pDGpzV8ShedYDDLQq59yqevsb0GJNViTcEN35qV4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892796; c=relaxed/simple;
	bh=2ifpS9q+J9+dnkPqovBTquyTCcIUGWhIomKC1grFTts=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P5o8+ly3TAWLxH8UufdwtPeKAI5Nj6KopLe1/ACKuYE3eycquuMAn9tVO66Mj1WsSTYj/gRDiLY90r4cdefeG52UJ0Y5VrNWbrpIc2NADb5fgUZPVLrcn2/OV43QaVO2c35V+Bzg+RoKdalecK3h1rDz32L3e1ugChCppcIXecc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YcXFPl0T; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YcXFPl0T; arc=fail smtp.client-ip=40.107.20.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YcXFPl0T";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YcXFPl0T"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D4WXKom6c1+9rYUdvfm3xom3sbJszNHwy3NM2hhKehgjnmbdm+Wy8w7/YMAVTNM+QYC1dYI4AVs+zlLkJCkIjpk1HVNfVKVcpmb9twQ25DJPFL0mC3xMEUUYKkW/nPrBiKnnZrdpuNhVAgkZAAz6I7aJGVs/d/JmJgPqjj1b5Eb01JaGTzATBZkNEt6FeUhInQ8LhOnyIHJlcvM6AxAJrBjeZAuNpLTLXBWSOLFaAps1tn1NOKJ0YfWtzN4mRQKfza6g8IvFpTlT4B9pVyC36KZTmn7C87HtNM5z4MzuefrNqamuN7rfxnUcLWKz86O36aUA88y5LFXi34ogLp19zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+1rD17r6usVRYbxYwCzJtc/RhPFi0kZH+3HZ3Zw0WM=;
 b=eaMHDQMYNkyEifH/244yiuZYqZQzMnFKERFT8UPGwmGxhBB7rRjEHPxGQpX3SMTK87p1aOri3tjAcSTq5ZNhzgYD1Q7v4u1vv6yPG6vrshAwQTpKwJiTKWtyuKz7WNZokYapDZu7LEqIpycKDenXbXmYYlYnEXvcZI6v7iGRTz/G5OxcCq5hqHykMBqvv5g5C2q+sGzFw1WnEgwXw6tDoJ5MNYjsUoOrAK1noaIDzBgnXfEDR4zyAOW2U8tHAd8BrNv0/2erh+su6NirSi24jxA/zmgBA4Jmz9cvtyoA5oE+iGr7efcEJYhPK8aCVB8c9XGQMudPI3a/hEF0qGwOcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+1rD17r6usVRYbxYwCzJtc/RhPFi0kZH+3HZ3Zw0WM=;
 b=YcXFPl0TKaddg8jBOzFsZm9EdrMxM8NxAqm32dzTsDQBB9dho5TsBpZI9YZ8U6kQXtiSDl5XM2ixJz5+xgcm89zkUKPNnHlyt4F2OALAR2Pmb39kns/izfkE8E9f4e+kHnpK3s4ZgD83cBXOI+93D6qUR8jLUR2xEnMKqS0kuYQ=
Received: from AM6P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::25)
 by AM0PR08MB5409.eurprd08.prod.outlook.com (2603:10a6:208:183::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 05:46:30 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:209:81:cafe::7) by AM6P195CA0012.outlook.office365.com
 (2603:10a6:209:81::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Thu,
 22 May 2025 05:46:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 05:46:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2/0KBTG2M3hgfbcfYWR3QSQ2Nc0qsoFR8ON5VY4ZBCpEJYyiXh1zcFjjJ70miEiBvSuYyEYIcaduYcBg/ZbhZzmk73WmVzJdq3ZSQN3ZLyxBvhzzGoiTiof5C1N2N2cyn6yEWhnRthI5KFmNcDok+e7ksP9nOHr5mUI2O7Hys8xa4sbWVHiXwePtoD8SjHkSd0BudpfqOE7C1y6KnfRFaCitiMX6GWn7myNMCtAxlljS5bkXPLH5WjGd/IhY9qA3bGS41EKZSdO0CmhxiN5NmPohGHTM1kQcL5uOTXr0TLi6eZXM4/QWRbewHkq2BCrKJMdfEhrREP9+Et1rmNvXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+1rD17r6usVRYbxYwCzJtc/RhPFi0kZH+3HZ3Zw0WM=;
 b=pHASNYuEA2iZWjIBkuAn5p9Iok8pmko4kUirN+7xMYo+65EDTPBuJFmc+9mjE1uuJcyeUjr5k/KBwtnSxxSFFc6zd4mSTT8OxDsU8a7GpSqXHAMjVu5rIViaxgxDeZi7G+IchpBLGWpnLECY7PPwoVDiqTCx/KhhoAhSociDm04KXLaRSHbBi+41ytwpQ3z8Xih55tEx2YxTOUSkm98EZ4gxRL/7K7vrh3YfqfyL9uSbSvCFJMSg3xWwFkyMFPne0k7F9loiF9DZXyf/El+jsvzNF+A9j8ykaQWMD45QdOPY4/0gTJEGov87CnVYQ0kKw+1VPZhGbA0NVzAIVGHtxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+1rD17r6usVRYbxYwCzJtc/RhPFi0kZH+3HZ3Zw0WM=;
 b=YcXFPl0TKaddg8jBOzFsZm9EdrMxM8NxAqm32dzTsDQBB9dho5TsBpZI9YZ8U6kQXtiSDl5XM2ixJz5+xgcm89zkUKPNnHlyt4F2OALAR2Pmb39kns/izfkE8E9f4e+kHnpK3s4ZgD83cBXOI+93D6qUR8jLUR2xEnMKqS0kuYQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU4PR08MB11101.eurprd08.prod.outlook.com (2603:10a6:10:576::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 22 May
 2025 05:45:56 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 05:45:56 +0000
Message-ID: <7244e009-97fb-4f91-8d51-8bd66b367ef4@arm.com>
Date: Thu, 22 May 2025 11:15:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] mm: Optimize mprotect() by batch-skipping PTEs
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-2-dev.jain@arm.com>
 <00555927-bfa1-4df0-8107-7080447acaa6@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <00555927-bfa1-4df0-8107-7080447acaa6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::22) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU4PR08MB11101:EE_|AM3PEPF0000A79A:EE_|AM0PR08MB5409:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d24d24-0976-4f7b-19e0-08dd98f40083
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aVAxOVhhVW1BTVZnSEM4Ulc0S3Q1N2t1SWZFd0hCYXROZnZnQjJYekltZm42?=
 =?utf-8?B?MU05TEE2c2poY0E0THlUcFhySm1DVWY0Znl4U0ZaZXVSUVhTTXNkTmJ5VzR5?=
 =?utf-8?B?YVZVTzFoRXpWVGpBTU9iRWUyakZOaERZWWtVQ09zYm1EK1dtenJiLzFMdEMv?=
 =?utf-8?B?TGxUU1lDbXNiRC9kS2RuRkxUVGFuNlA4TlM3WW45OFJadm5JaGdaZThjNlho?=
 =?utf-8?B?dVdvMjljZHpQOGdBRDFGYi9UTU80ZlAwblI4c0x0N05ocEUvdUt4a2NFanFT?=
 =?utf-8?B?aEE0ZTMvRmRxUWFWaDhvUldiaktab2ZtMmZnYzVqN3IxMHRaTFRrY2dRdXpM?=
 =?utf-8?B?QUN4blJRT2l0cXdZdW1YV0RuOHpFNm54eW5GOG44TW84Rmx4QnoySVR4ck45?=
 =?utf-8?B?U0pzaEVhRDZROFFlYnlocyt0bEdWNlhPVG1NQXZJRkJuRFVFYllobTFKbzNa?=
 =?utf-8?B?Z1FBeXBQbDArandYZEFuTmlqZnZuYXlpeUlpdi9pelRzT2liYmxBVWE1elQ0?=
 =?utf-8?B?YU1CY0lEOFdpdFNsWG5HNXZsbm1VSFdENUJnZ0hocjhBZnZxb0U2OVVIa0dE?=
 =?utf-8?B?OHBZdTFaV3dXMWNhNm56R1U2UExVRUlQaURJbzFsZ1pmdk44N1BRTmUvUTBN?=
 =?utf-8?B?ODltTnBLM1hPK25WNFc2WVlkdjJMd0dTSk1NQTJXTmszclVabUx1QlEzN2Ns?=
 =?utf-8?B?Vk5GUmlob2xQQXRib2s0TEZEWUhmZmkxZ3N2TGJuM3Y0MGdmVXRIK2grYmdQ?=
 =?utf-8?B?YmdCU1VYZHBZUkpZdUwyYTBHdWV4M0ZGSkZLNVlwQ01taTVjeFFsaXNuMHZB?=
 =?utf-8?B?THIxZnNaRVlOb1FURkQ5dmUwcjhxYXEwK3hWNXF4TzNid0V2dzIyVldieldP?=
 =?utf-8?B?T1VYQ0g5K21BdUFCaXdLOXIrYWpIS20vSk55SGxXM2V2VkZaT2k2V1NZaU1q?=
 =?utf-8?B?U3JZMXU0eUs5WkMwUjBPR0szR3Z1T2dzNmcxNHlXbHZoaXJUclQvT0JKZ0Jo?=
 =?utf-8?B?YU51eTU5SUF6T2I5WVNYdTRMUytOZUFMVE0wNWIydldRcjVZaklxQ3VKWVB4?=
 =?utf-8?B?WHdGeVZoTnRYbUMwc1Rmc0JjRTRTRTNqK2l4cU9wZTVJSGhCb0xDN2Rqa3Rq?=
 =?utf-8?B?bUwzUE42SjV2cmZSNEZMQUxuQWxoTngyRjZFVlNKZ0VTcXp5d2hsWWtZNVJi?=
 =?utf-8?B?ZFRkYmlIdndrZDdRekJKK1pmM3NFMjgrSDRwR2hVQ0Nsc2ltUU1MendIbzJR?=
 =?utf-8?B?UmNZZUo1b0Y2WlFLSXhid3h2N00wNXhDYkM2L2pZY2xGM2RqTHlyY2RSOC9G?=
 =?utf-8?B?NFpYRm5rRkdRR2U2dzJFUEF1TE5jUUxaczlXTDE0OWtZV0lkNVl4RE9yeGMy?=
 =?utf-8?B?SjR4bkwwaFNTRkxQa2FpTlpiQmI5Tlg3ajc3VTRyblhBMXdkZmdlYkEyVFBk?=
 =?utf-8?B?NXlKdFVlQlRsSXZYY2xQdkVEdVNick1BeXVKMzJ1M1EvZzV3S1BGUHNLNE4y?=
 =?utf-8?B?MTFiMEpsQk9WblpEV0JvWmw2Kzg5SHdPNENWeS9aVFNtTjZ3RzFublNYeldZ?=
 =?utf-8?B?bGtkTlRvdkZBSEwvVVNWRHM3cjNxSUw0WGkrRUdReVcwTGcrckpDbXhiTndZ?=
 =?utf-8?B?dVpJRjdaQlFvZ1hXSTFBZllXTjUrZXVabGhqMEVvMTM5R0lBVmxQNVJvVURt?=
 =?utf-8?B?Q1lQeFVvV28rdG1jakxlVHJQN3V5NlViSi96ZWlicHY4cE14SElaclc0cnJL?=
 =?utf-8?B?cjd0ZG14TkFqNGgrRXpSVlFEc2c5THRVZmlEMHVwSEVpWk5zSU41WnlNUHJn?=
 =?utf-8?B?VndRUEtGTXlYb2xzZDFRWVQ4UzZKWnhIN0U2MWpES1psYlU5aTFNWWx0WDc5?=
 =?utf-8?B?bDh5Y014MzFiWWJ1eElkR0pYUnN0YzFpV2Y3RTRjQVQ5WkE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11101
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	433b08de-d0ed-4f19-048a-08dd98f3ec16
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|14060799003|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3BvZ3YxL0hqcE1OclFVOEFFM3JtekludDVuRkU3cXV0TXcxVU5jU2pYL003?=
 =?utf-8?B?TGRBcWJlU08vcUp3V3pjdUYzRVJDUlNtLzhEZitnNVE3Rkh3cjFVc1hIaWJR?=
 =?utf-8?B?aGdvbmJaUDFQbE1yZmZBQnBWeFVNYlFuQW95dVlja1FsS0hIckVWa0ViWmFT?=
 =?utf-8?B?VUdXWURyZWNSaTJ1OG9pMDExK29OYm4wOFZtS1gzS0k1VVpiL0MzVWI0OWRI?=
 =?utf-8?B?N0QvT2VqTmwxUDVFTjZCYU1oVm5WTElPMmZMejRwS3FWZWovMkJjVFlvaHUw?=
 =?utf-8?B?OSsyTE1FVlN3QzM5bi9CUkdQMTRXa3ZLNVJxSlk1RzJLem1CVDd1cW9rTHBv?=
 =?utf-8?B?bEVDdlZkTXFuT0VMVFZrTDlWL284UTRoNXdpN0RBT3puSlZhQ09PVGlDN3Fm?=
 =?utf-8?B?dy96MDVsbG1jS25oQWVPcTNOZTdGNEI2cktKRzU5UG5TL3k3Q2QrVUNha2Fa?=
 =?utf-8?B?ZXEyMFY5MGN4Q3l6U3lQbEVhV1c3dS9mQmpIc25ZM1pXRHVPWlNBTWVHKytI?=
 =?utf-8?B?YlR3cWZIWUVoSmprdHRwSkdvOGlPUDFINHRoK1JRdlFMNkN2ZzVsWS80WWxC?=
 =?utf-8?B?dnNCMk9BdUhXaE1Id0dZSjIwLzZXMnNqcUVwMGFLMkJZOW1jWTU0Qy9GWDBR?=
 =?utf-8?B?L0oyUTZ6TVR6ZzNaejFSS1dGUTkvQ0NjVzVCcCsxZ0NidWRkLzRWV21EUUFh?=
 =?utf-8?B?RGtXSFdFcTFkS0hIK1BHS1MwZEZGSmNOSUkrdzFCS0k4Z2tRZ0FDeTJ1bG80?=
 =?utf-8?B?R2JhK1REb0JxMGFXKzg0YnZRaW1yNmlubko4d2lIQ0lxVUNOQ295dEwyYnhC?=
 =?utf-8?B?dCt3TUI0RytieUF1N2VUV29aam1OaDdCK3FVVHZuUnBjL3N6VU9pamxEdVNH?=
 =?utf-8?B?dWN2eE9lS2E0WjZYMlN6TWVuTC9TSTIzU1IvYWFuaEdLK0JSdndWK3RlMVIv?=
 =?utf-8?B?L2Q1WVdrc0p1aFU1ZndMZ0NIZDNrZGFxY05TYmpNVWVzcWhUcDYrL2lkdy9W?=
 =?utf-8?B?bDE2ODJXMEszM1NVek1KWnFqTmJ1NWlzV2RPakVHOG1leEhSMld6YmZEeS9q?=
 =?utf-8?B?WDk4TnV3Rk9zTVk5KzJsY2daYTEyK0JobmtWdXlHdmh0U3Ftdm5SUmpQKzYx?=
 =?utf-8?B?bzJXM0RZSkFiNlMvZEh6eE02YjNwSHNBQTY5VnlVdEoyeGRDai9jWjRPTit3?=
 =?utf-8?B?bk9ZdEFrOGFtMkFsSmFNYmJMblNqdTBGeFJqTlVXbG9RYjhlLzlheHFlODJ4?=
 =?utf-8?B?bjROSDBNay9ZOWYrS1JRY25hKzRaYWs0a29LNGVqZEFWK1ZPKzFFdFJFUnU3?=
 =?utf-8?B?UWlFYWx1MjRDMzRKNkY1Tms3Vllod1ZwSlpjNThDU3cvK0NQYzJGOUdxc2Vu?=
 =?utf-8?B?QTRnQ09mS3Zoa2pwMkJGdzNiQnZYMjRKSmtzVS93aTI5a21YRGNITGducXVl?=
 =?utf-8?B?ZmhpQTFFZXlJdUIvSk9yVUMvOGg5bXRMcWtMbHpualp1YWFxUUY4a1RERXpY?=
 =?utf-8?B?TEVLRU9jTXlsMHl3bWNyZ2VqTTJueVhHdTBnQ2I0RzJvU3ZmdEZmL0U3MFNv?=
 =?utf-8?B?ZExFU2NVRXk2S25HdVREYlNCdVdOTDh1WkV6OUhwZDZzZ2VOVXFaQ0wyMTZu?=
 =?utf-8?B?dzBsUE1HRy85T0p3cDY0UStELzd3MUE5VUdyeUx1TUhSMEk3RW4xaHBBclJQ?=
 =?utf-8?B?ak1jUWJHaThDU3k3R0RnSXRxbU1PUWhsTG0wN3JPUUhWYVJiM05kY0VZRHAy?=
 =?utf-8?B?UWdhSzJSZUxiUWJvS0RZWWFwalNFMmIzNG13cFl0dHdyWUd4UEJlQ09Qc0hS?=
 =?utf-8?B?OXpGNndhU2RuRGFDd1l3UG1hVmR3QVdqc2hycCtNeDlCc2krRDlWTmRXNXJz?=
 =?utf-8?B?ckU3bmNDZDZwWWJIRnRpWjNaY2ZEejVTbkZXSEpLL1JxNXp5eWRxKzhpWE81?=
 =?utf-8?B?T3Q1VngrWDh4M2dROGkyVHZRellqcU5yY3Yvc2dCcjZzUmZ2bUhNU0lFbVcz?=
 =?utf-8?B?RndRSlhTc3BRRVB0ckErOXVDQ1VFektCWVhzNGowMnpOSVh5MGJ3TkJwWFhY?=
 =?utf-8?Q?O4Z4Ts?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(14060799003)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 05:46:30.3557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d24d24-0976-4f7b-19e0-08dd98f40083
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5409


On 21/05/25 5:28 pm, Ryan Roberts wrote:
> On 19/05/2025 08:48, Dev Jain wrote:
>> In case of prot_numa, there are various cases in which we can skip to the
>> next iteration. Since the skip condition is based on the folio and not
>> the PTEs, we can skip a PTE batch.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mprotect.c | 36 +++++++++++++++++++++++++++++-------
>>   1 file changed, 29 insertions(+), 7 deletions(-)
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 88608d0dc2c2..1ee160ed0b14 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -83,6 +83,18 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   	return pte_dirty(pte);
>>   }
>>   
>> +static int mprotect_batch(struct folio *folio, unsigned long addr, pte_t *ptep,
> Perhaps it should be called mprotect_folio_pte_batch() to match the existing
> madvise_folio_pte_batch()?


Thanks, this is better.


>
>> +		pte_t pte, int max_nr_ptes)
>> +{
>> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +
>> +	if (!folio_test_large(folio) || (max_nr_ptes == 1))
>> +		return 1;
>> +
>> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>> +			       NULL, NULL, NULL);
>> +}
>> +
>>   static long change_pte_range(struct mmu_gather *tlb,
>>   		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>>   		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
>> @@ -94,6 +106,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>>   	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>>   	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
>> +	int nr_ptes;
>>   
>>   	tlb_change_page_size(tlb, PAGE_SIZE);
>>   	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>> @@ -108,8 +121,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	flush_tlb_batched_pending(vma->vm_mm);
>>   	arch_enter_lazy_mmu_mode();
>>   	do {
>> +		nr_ptes = 1;
>>   		oldpte = ptep_get(pte);
>>   		if (pte_present(oldpte)) {
>> +			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>>   			pte_t ptent;
>>   
>>   			/*
>> @@ -126,15 +141,18 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   					continue;
>>   
>>   				folio = vm_normal_folio(vma, addr, oldpte);
>> -				if (!folio || folio_is_zone_device(folio) ||
>> -				    folio_test_ksm(folio))
>> +				if (!folio)
>>   					continue;
> You modify mprotect_batch() to handle folio == NULL later, perhaps just add that
> here, then you don't need to unpick this conditional and can just goto
> skip_branch, even for the !folio case.


I'll check this.


>
> Thanks,
> Ryan
>
>>   
>> +				if (folio_is_zone_device(folio) ||
>> +				    folio_test_ksm(folio))
>> +					goto skip_batch;
>> +
>>   				/* Also skip shared copy-on-write pages */
>>   				if (is_cow_mapping(vma->vm_flags) &&
>>   				    (folio_maybe_dma_pinned(folio) ||
>>   				     folio_maybe_mapped_shared(folio)))
>> -					continue;
>> +					goto skip_batch;
>>   
>>   				/*
>>   				 * While migration can move some dirty pages,
>> @@ -143,7 +161,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				 */
>>   				if (folio_is_file_lru(folio) &&
>>   				    folio_test_dirty(folio))
>> -					continue;
>> +					goto skip_batch;
>>   
>>   				/*
>>   				 * Don't mess with PTEs if page is already on the node
>> @@ -151,7 +169,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				 */
>>   				nid = folio_nid(folio);
>>   				if (target_node == nid)
>> -					continue;
>> +					goto skip_batch;
>>   				toptier = node_is_toptier(nid);
>>   
>>   				/*
>> @@ -159,8 +177,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				 * balancing is disabled
>>   				 */
>>   				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
>> -				    toptier)
>> +				    toptier) {
>> +skip_batch:
>> +					nr_ptes = mprotect_batch(folio, addr, pte,
>> +								 oldpte, max_nr_ptes);
>>   					continue;
>> +				}
>>   				if (folio_use_access_time(folio))
>>   					folio_xchg_access_time(folio,
>>   						jiffies_to_msecs(jiffies));
>> @@ -280,7 +302,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				pages++;
>>   			}
>>   		}
>> -	} while (pte++, addr += PAGE_SIZE, addr != end);
>> +	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
>>   	arch_leave_lazy_mmu_mode();
>>   	pte_unmap_unlock(pte - 1, ptl);
>>   
