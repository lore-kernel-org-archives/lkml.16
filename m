Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8435822172B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923410; cv=fail; b=BQ6erFZmheQOpupbkud+UDxO9Rf6JyxltKbZTTKRsBfkyptAzF2kvou23WcbnujV6xcUdYYbLZi+qOn3YVcH2C0gI3l2/pOcF86gC0F1R4crz60rh7ZKdVIfltwWpvkGvRseVvXdlsdTCj9OkFbIjJUk8HxWoYPG2Qk4lAlfTlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923410; c=relaxed/simple;
	bh=b506tbNeN20xv2lszlEJKdNULO37w+7axPDkNmBxsy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NBFRhzQZ/ag/5IBS15KtIHj8/JP+1HF8XqJ1ax3kqyZnQeQa3Ala45SiGYeCaKYp+++cSYtMl8aJY2rqt1A56aHc5LiK24e5Ah7K0p920RHSsisktCMbfDNK1ZE0lJz8vuUGqd/monS7woGG6vySvNgRCputDor3VNfSRY600N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ATaEDM5X; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kPSMIIji; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ATaEDM5X";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kPSMIIji"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9XGvg008212;
	Tue, 29 Apr 2025 10:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=TYVQKje5AIXMkYo19ZrZZx3zggxpbcCq/xtZdHbU2PE=; b=
	ATaEDM5XaIQ4uUC64F4J03Hk5Em++fLQKs13QbNGJq/Zjji45MAzxTD6xL9EOF5G
	Fw7kB1Rr3gA/L8nBtY8RXt6WD0EOYeb2WKfvLXE8HbLSxazFnRDqE0MqYK7pkCk0
	p02RxnBRxVwHQqWcYCwn/FfWkISvH1GaXp3wL+uOnLwB9VtOeV75499o/pOtmbdb
	ybu6lLuSeeyRJOfCtjqgAYj2zrhp2ZojZvoAqIgx7Sz8u6hkue3B7JRg/ZGIf9qB
	atWRzFM+S9CJp7jpHWkOrIOGbpuFQO8RGsDGxzqn8XS6zxtdVrYSBgzSgKnI37HP
	YfSjXhroi4evVkGIDpSNlg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46av7hr3u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 10:41:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9TjnD035406;
	Tue, 29 Apr 2025 10:41:22 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012032.outbound.protection.outlook.com [40.93.1.32])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nx9dj1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 10:41:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSK3XHZ6xwebI7U2LMklCBYm8HFEFWGGgPCgYtNvXZdP8b9aJZP4U0odBjVl3QXNi5qrXn6xPcjn0rKRJ/OZNocJY5FgM1KvyTpqxjzOZE5CJzZNdJD1REwTA83rHOAgC32uIvDVbIdagDL7zenRGOPvZvAVbnntI0qnh32RzWXwdjnT58wIqrUe8SwlmZfZH5GNLia7z6N/ZaPEhLSDe1ggyqt4rlGT6HXNmiTqR5ZVqFkqX6v6sUJlMDwc8B6mBvxbUVqyvJozormfb5h0BXJs0eENhVf0v0DbvLDemavfh38bikoEaunKwcCsOgtCH3etleVczvwF41uMVoucFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYVQKje5AIXMkYo19ZrZZx3zggxpbcCq/xtZdHbU2PE=;
 b=pYfa1lfKEmibU08MR1z5Z4K8DAJ50oNBAXat5RthzHDf2zhM9QH0wEnNbftgppDEyBB/LRMh5mmJQT53J9p9VSBQq4X3ka3v/n6DJ9GjN/IffwZO9zhx3ktZpUeByMSLGsuB3OWRCVJwRFLbY7Q0tEdT9QPWEJFk8J9sNj7gy401rkMcyuarRG30m4h9a78wWMrh0gagE+G1CNu/QRgigoTPNqjcpGZ/JscWVuBlk8N3t7l7Njh7pzIloOukGskSQkSxJflu6NDlaNfYyeZfnN5w4owPPiSOgfb485zgMhFjXbJ1eaaVqHd+SMYaxc+0MzT3ElxxDBAuBvg09mqZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYVQKje5AIXMkYo19ZrZZx3zggxpbcCq/xtZdHbU2PE=;
 b=kPSMIIjioXcWiCY2qrilP1KiYQ0/1B5hJindAcM25cVXDFPChwETQ9JlX9qdt9dcciTk3ofs6y8Uv0FC+PhsSHUhcbHPpKdLB6iz/dcwpTh0KsxDrE81bb9lFZ5LTZfXKub+X8CwRwl60p3aaGwzz7qIqfG17LVb6Sg5yOr8us0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB7228.namprd10.prod.outlook.com (2603:10b6:8:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 10:41:19 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 10:41:19 +0000
Date: Tue, 29 Apr 2025 11:41:15 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
        ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, namit@vmware.com,
        hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v2 0/7] Optimize mprotect for large folios
Message-ID: <9d995850-d0c4-4e02-8547-74a9723e0405@lucifer.local>
References: <20250429052336.18912-1-dev.jain@arm.com>
 <ba73873b-1b26-44cd-ac0f-76e33e8fc2cf@linux.dev>
 <05c3cd68-0d75-4682-a51c-59307e2b2e78@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05c3cd68-0d75-4682-a51c-59307e2b2e78@arm.com>
X-ClientProxiedBy: LO4P302CA0044.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: 155021c6-1706-4a05-be76-08dd870a604e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0R4RUNQS0JaK3JLR2dwdzVta2pnUWNDZ2daNHQ5TG9DNEVVb0ZWRDFad2gw?=
 =?utf-8?B?SE5OMi8xR0pMSlVFM1RHZHQzdmFEa1hoZFhGTTY4amZsYUw2MkJHN0gzN0Zm?=
 =?utf-8?B?WU9CakhwdXJrZFlJVXlCVFI1anBFdjRxQmxoUHNzV3dGeExMRk5sT2VOU2Fl?=
 =?utf-8?B?a0pBMzFGK2hEUFhvWVZPaVI0aXMxYmt1Tm1jKzNENXRwNzVxTVR6K29TYlF1?=
 =?utf-8?B?L2dwWm5Fd3BtT3V0cFVPMXRIQndLa2lwMlJHTHI1UzFHSlU1d2F3cFJVR01D?=
 =?utf-8?B?ZFphOGNmM0FFVkw0eEdEcXQzS09rNk5kTHlQUFlTY3JBTXRBYmhSM0VEdDNH?=
 =?utf-8?B?SHNEWU0za2lFOVdyUnYwaVhhYUhlWjRXVnRjazdYMTR0VGhEQVR1M1B0bCtV?=
 =?utf-8?B?KytZbEF6T2JYZlNMVmU5c04vRVloYndDVXdIbEtmTmFOeTFuUlhucWhvcXRD?=
 =?utf-8?B?eGkzQmVHUGIwK29rUXBqV3crdkJvNHpFbEo0OTFhWll2ckkzUlRBUHZmZzdW?=
 =?utf-8?B?MVduK3FzbXRwTzZqb2padFJIWGthWEx4QVlsd2lqb3FZc1VSUDYxclh2Wk1h?=
 =?utf-8?B?ckZyTExnNk1ScTRyaEJSZURJSVA0VjBLeWxTNlh5UDhBekFvSzgyajYxeEpK?=
 =?utf-8?B?anc5dmhIalRBMm1td0FweVhSdVhXakJGN3RYQkR0Y2Y3MmRqVWpWTnVlSHlh?=
 =?utf-8?B?RXpKQWx0Y09HOTYvSkpzU3RGRmo1NENzM0ZvVnBTRFhyVnYwOWlMTUtaWlNn?=
 =?utf-8?B?dWxiWldIeDFHai9YZnViN3psY1puMEtYWWN4OFd6WjRuanQ4ZDgyMC82MXR4?=
 =?utf-8?B?OVI3Yk9URlZLWWJpWHk1cGlFcUJ5Rkh0Ry9XWGRGQ0MrL0ZMMnlTbWdZSTha?=
 =?utf-8?B?cElOMVVTYXlyc0ZkMVhZYloxNDdGVHMyV3dwVTd5V3Nna2krcEhJMmxJZm8z?=
 =?utf-8?B?aTE0N081K1ZVdnluRmNNTkk0Z0tTYmxjQk5JN21PWEc1aUVjZndTZjlpUWxE?=
 =?utf-8?B?c0pRUGRtN2xsQS9rK3VWRzEyYW5WODNkZEgyTXZHbEljSmtyNnYzalZQOWUr?=
 =?utf-8?B?eEwvNnRTWWxJL21NdkU0eEEvZERGTE9sTkswdGpOYnRhTzhrSVFHcTBGcDQy?=
 =?utf-8?B?WUI0d0VpQWtEcDFZVmJ1cUMwNWs3ampUeFZMNlg4UGxGOVNzYXZvV3BXd3o2?=
 =?utf-8?B?bm8yc1ZRdE81bmlzTXpwamVBMzRja2w3WnRFRkhCOS9WaFVHRHVFTUJIa3FJ?=
 =?utf-8?B?Y0xUdlViTytMNDRRM0VPOVFnUm5yUlFEQ1ZvVTV2c3NKQ3Fka21TN1d0dEcw?=
 =?utf-8?B?VWl4WER2cVkyMlhocXEvTjFqT0UveHU0T3BycHJTcXIvZEg2V0FFTGVmTHFX?=
 =?utf-8?B?aUVvRFVkZEV6SjA5Zk51eW1SM3krOUlCYkp4Wkp1bC9pWHpsaFhsRzh2S3lo?=
 =?utf-8?B?b25uR0tZUko5T1FXTkJTb2poTG5xZVVSdHY2NVhIaTVMZXppOTNTUVhTNzI1?=
 =?utf-8?B?Q2VpempDSnNTd2tya2xoTnRHRnh4T1V2elBKTDRhWEREVzZqczVacklqdVBx?=
 =?utf-8?B?YUNYa2xMUzE3c3ZmUEFBOXlpVHk3SDl6Z1Fzc0RUODYrMisyQ3g3WGJhNmlB?=
 =?utf-8?B?c0pVMTdOemJ6UGtlNWludlZFYlFUeE5xOFJKN3B5cXBGOElnQzFzTWJpdDBK?=
 =?utf-8?B?bVU1eHZYR0lvOVpHY054aUR0c1RUMFc3aHBKeEM2MVNMQnFZNElSQ292Z3JP?=
 =?utf-8?B?R1JBbXdZcG9teHFPTTNSRTNuYkVTQ1FuZE13a3BTMnZrS25mSzJPZ3Axa0dY?=
 =?utf-8?B?Umo4QUtwdS9OOWRTQWt1NjhsSEp2NGU3aWhVMEpNc2o3S2hGRndDdFdJNUlD?=
 =?utf-8?B?TFdGL0xnaGpGaVhOZUs1cEZ4eDl3T3dlcU85c1U3QTkrVVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHRYaTlHWElMZzBMZG5UYitRaWQ5Q1VsSVFFUWdwV2lqUWdtQlFoeXNzS0pM?=
 =?utf-8?B?d1orUGRjL1FQbUdGY08wS3ozeDZHMVNrcWRMaXRWQUE0N0JibUR3RWhWdHhZ?=
 =?utf-8?B?VGY0SUk0Q2ZUbHRENDhTczJjZ3c0UjZocGc5VlF6YmFQVUp5ZE16QUVGcXpW?=
 =?utf-8?B?emFoc2d5OTRMcFhoNkF0U1Q0RkVOTG94cHVhc0dBRFZGWlB4NG1iMjlpMEtT?=
 =?utf-8?B?RGVIWHhzZWdXYmcwRVdpUFJmay9lU1RNRTF5MnlXNFZYOXYycFhySlovTnJp?=
 =?utf-8?B?bWRFeE0wT200K3M4TzhOZDZ4Z2loRFVIakNraVN2ODhQODhPMVBteWVxYy9U?=
 =?utf-8?B?N3g1bUVvcVFMc3dZeXJmS3pFMXN5RjEvZEduanRqVExxdXJGdjZyYWtNY2pG?=
 =?utf-8?B?QzlxK3dWQjdpSVRBNE5kVFFEUWRQcTUwcmRWS0lHVGdQbkVuenVya21RY3FP?=
 =?utf-8?B?djJXd2RHQXNUaFNHNU53cDRnazh1bmV2Z0VLY1RWVHVZdTZaQ0Ewam8yYTBy?=
 =?utf-8?B?VFpoSUJEbXhuc1JyTTFDcEFrRi9pSHQvYWFOSEk0NSszZ0ppczhjdXZrbDVw?=
 =?utf-8?B?ZXBmOE5YU3FqOHN1eDFTM1lxTGJCVUpvWTFRd2YyaS8rSVc4djdIaGFYUmZW?=
 =?utf-8?B?U1Zia2JVeFlXQk5DUVFLdElHQjA4bjJoZkgwMy9VMUdmc0tsNlRMQWl3RGcw?=
 =?utf-8?B?VVAwS1lXKzVVa2poN0NBWTlXL3crZnFWL3gvdGs4endhbkxSU2VHemFCV2p5?=
 =?utf-8?B?SUhieHhIUVQxVUJ1UEE5aGNyanVrYS9jRzBadWNjNU03ak1kbVdwM0Vpa2xt?=
 =?utf-8?B?OUZ6QVNzMVV3VWc1MlVOK1k3cEtRSU5qK0NuMWp6ZHJuWmVRR3kxYWE3RWhH?=
 =?utf-8?B?OFBlMkN1ZkZUUFJYREtjN09IMENlYUdxREF4K3JhT3BvV2p2NGpNNFZRT05R?=
 =?utf-8?B?elNHaExHd1c4VkkyQVh3djFVMmJWeUk5UGN6RUk0NU9IVHFaQm9WTmgvaFVn?=
 =?utf-8?B?WnJ1QWl3RUd4dWlyRWhhVEF2b1lsQXl3NmNiKzVrMVNBSHBRVzBWOW1aUTl1?=
 =?utf-8?B?Z2llQURSUGJXdlZjcGVVTXlPdVBELzJrbDdhL3hJc3c3c2daMThFUnhTRGg2?=
 =?utf-8?B?MTc5NXBySnBybFlLM0l2Q2JrVUY0dVF0NnRFUzdzT3BXNHFlT25JZFhKOEoy?=
 =?utf-8?B?M255R3RoSGJ6dzRmQk8rNDF5T0JaeGkwdU9QRzNlamNabW0rQm9YaDJJS1Y0?=
 =?utf-8?B?K093TnppMEI4eUZ4K1ByV0FFZmg5ZEV1ekhZdlF3YnJhMzJCeURzSnlySTNX?=
 =?utf-8?B?Q1dIZFFlWTZrejArU1pza09nRmk5VG5SdHBQVWVpMW9tbFNzaHBYMTRuMExZ?=
 =?utf-8?B?bng5c2xOU0t2d203bzM0QnI0K0RwWmwyd1Q2cm5URERWRW1CWThackNqVjFk?=
 =?utf-8?B?ZERRQWdyVWZyRHVMaHpJUms4c2diK1B1RWZFWFc2eDNidGh2dExXVVhacnFQ?=
 =?utf-8?B?cFd0L281TXp0Unk2ak1QcEhvMFVmelhndGhrOEx4UWVRdmFwVEIvelFLYjI1?=
 =?utf-8?B?b0RoVWZWSnU5QkR6aEE5cDVqZkpQaDROUXdqaFhVNzFweXNHcHFYeDNCMWh4?=
 =?utf-8?B?MjBHaFpzVDBCcS82YWJJKzVIejVRcCs4eU9XbFE1Z3hXZ3ZZelFEVHY1ZzRK?=
 =?utf-8?B?dzdUREU5QUpaK0FobjhuYlhESjdjN29ZSC96ZWk3T2tEdzNDVUJ4YUF3ZnpS?=
 =?utf-8?B?SmRiV1RsY0ZoV05EV2R0L1ZRRmI0VTRwOXcvZ0ptMXowSnJkS0RMT0J2NWoy?=
 =?utf-8?B?bmVBRkNwbzA0dHlpWDROOWNTWmFWeDYwSHlHTHlybWs3VWIyVHdSNi9WaUgz?=
 =?utf-8?B?UHJVTzN1amMzT3JhZXZWRi9FZ3FoT3grSWxTRm5tcXprY0d1MzFvNzMyQ0hh?=
 =?utf-8?B?RGlOUGZQeWFJSkQ4RzZmS05pRnA5ekZtRXlnVWJCZGMzSUdheHVXVG11S3Vk?=
 =?utf-8?B?Z2RNZHFleXNnWE5ZNm1zK3pVR1RWdmF1WVBzbEp2QVRQdW1oRHRCVlFSaHNQ?=
 =?utf-8?B?c2xPck9ScnRHdjVoMUxkaUtRQVFuUitGUVhjaTM3RXN4aFUyLzg5bWZZa2Rh?=
 =?utf-8?B?eWMwOU9UTmRTQ2ZvSHFVNlVYdVNOYkE3Y1U1cUxkSEdOZHZ4VTkrUDBQTlpG?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7dZt8I8z7MJ5jf9nL2ou2XWBAF5o++uuHeo1fVuJglXS0suVVkjgVsKLUV9U1hl4cOO1JEsRvtEcfwztS3/fAB4EDQ9zhd+MVRPozIUEBkBpMd9dG6/Nrcz7xaNFXemT2/a8WrPMOowOCHhO7jJFaEpdE6/fVeu/aaVX/maYB6yqOe7JosOasoUWQBxjVfTzuZstnE+Y7sfz05cCysblwX3p7pRR+oUe3QFZSXtt8Bczx2T4TRYTO0meWuCSfyvz7zzlL3mu9bscfDQwQ8fNFbJThjFkVC2xCtPd0Bc4byrhUDwOyfohPkJIVkYfAn8yqIt938gduqBWqQTxZ7wC8j9kis4lGKt5gvI90oLAWY/xbmfoF+KhjvjhS7gtos8hJlBhGZaOd+oOJJ8a7ANccsA7NQN91YKlc5/9e2f2F4paEDuKgpshin0ipSZdNalwfMnPVoPDupM10dwsu8N3P/v2z1t6/DFLiFNU99sgZaH3I7cgpHGbJEkTu1THHOtpkhYiuxWDSDuJR2+GZpz7rfndZJMNXs/jyz0SVqMikco0k8AJL//7Anu3CVoGCjbFkE1Crj3AINdjsv+TjXZMMhcABcUzDYicu4B9cWj02XM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 155021c6-1706-4a05-be76-08dd870a604e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 10:41:19.2382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qw+RYKSof82/WxHqcQB2wIXInUAZxy/jI7J2brQM+dczigsSRL61WY5lB5HrJh0J0kYgU+AGiLkI93JVdKI5aYmVj8UFk0potK5nyqRnUbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7228
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=440 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504290079
X-Proofpoint-ORIG-GUID: xGO80eKmnO_vUIcuyzSj4ZiOz8-7CzQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3OSBTYWx0ZWRfX91/hMo6gFZdD g5u7MFnRHTaa8iFxpp7zTpnGv2N4SWEw/VJ8/zDd9aP4vm6KPwPAnJ8ll7hHU44A88S/CQTJlnf 8tWrx2MajytgF1A6W3eTcwzco8CvU/SNZ0/NvKunkQ5XiibGhfOxNxNa0li4E7WwhNhvqWmA7Tw
 uQlSWap3EDei6g1ANyM9Q7T/7+YEcnX2bvr58AOcbI2nJyd/nulvUqYt9k2weS56kQwUvKlnn2G CJbtYE2ZepKuBMgNJ9v20zrb0nmyhCsRlasZC2QMwQCjp3CIVFVfRCa3ZZVgxEBM9QUPaRZ8ko3 AZ1mesmOtygFBEacxXWws7RQCavl3cqf/lwrqD1CA6BL5xx5CgG3oJaeG8ZL9ckAE1IpTj/NS5l sCHqLqQO
X-Authority-Analysis: v=2.4 cv=R+UDGcRX c=1 sm=1 tr=0 ts=6810acd4 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=t3vCF23Z_XOjuHxQfpAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14638
X-Proofpoint-GUID: xGO80eKmnO_vUIcuyzSj4ZiOz8-7CzQ1

FWIW can confirm the same thing. Lance's fixes sort most of it out, but I also
get this error:

mm/mprotect.c: In function ‘can_change_ptes_writable’:
mm/mprotect.c:46:22: error: unused variable ‘page’ [-Werror=unused-variable]
   46 |         struct page *page;
      |                      ^~~~

So you also need to remove this unused variable at the stop of
can_change_ptes_writable().

Cheers, Lorenzo

On Tue, Apr 29, 2025 at 02:32:59PM +0530, Dev Jain wrote:
>
>
> On 29/04/25 12:36 pm, Lance Yang wrote:
> > Hey Dev,
> >
> > Hmm... I also hit the same compilation errors:
> >
> > In file included from ./include/linux/kasan.h:37,
> >                   from ./include/linux/slab.h:260,
> >                   from ./include/linux/crypto.h:19,
> >                   from arch/x86/kernel/asm-offsets.c:9:
> > ./include/linux/pgtable.h: In function ‘modify_prot_start_ptes’:
> > ./include/linux/pgtable.h:905:15: error: implicit declaration of
> > function ‘ptep_modify_prot_start’
> > [-Werror=implicit-function-declaration]
> >    905 |         pte = ptep_modify_prot_start(vma, addr, ptep);
> >        |               ^~~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/pgtable.h:905:15: error: incompatible types when
> > assigning to type ‘pte_t’ from type ‘int’
> > ./include/linux/pgtable.h:909:27: error: incompatible types when
> > assigning to type ‘pte_t’ from type ‘int’
> >    909 |                 tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> >        |                           ^~~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/pgtable.h: In function ‘modify_prot_commit_ptes’:
> > ./include/linux/pgtable.h:925:17: error: implicit declaration of
> > function ‘ptep_modify_prot_commit’
> > [-Werror=implicit-function-declaration]
> >    925 |                 ptep_modify_prot_commit(vma, addr, ptep,
> > old_pte, pte);
> >        |                 ^~~~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/pgtable.h: At top level:
> > ./include/linux/pgtable.h:1360:21: error: conflicting types for
> > ‘ptep_modify_prot_start’; have ‘pte_t(struct vm_area_struct *, long
> > unsigned int,  pte_t *)’
> >   1360 | static inline pte_t ptep_modify_prot_start(struct
> > vm_area_struct *vma,
> >        |                     ^~~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/pgtable.h:905:15: note: previous implicit declaration of
> > ‘ptep_modify_prot_start’ with type ‘int()’
> >    905 |         pte = ptep_modify_prot_start(vma, addr, ptep);
> >        |               ^~~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/pgtable.h:1371:20: warning: conflicting types for
> > ‘ptep_modify_prot_commit’; have ‘void(struct vm_area_struct *, long
> > unsigned int,  pte_t *, pte_t,  pte_t)’
> >   1371 | static inline void ptep_modify_prot_commit(struct
> > vm_area_struct *vma,
> >        |                    ^~~~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/pgtable.h:1371:20: error: static declaration of
> > ‘ptep_modify_prot_commit’ follows non-static declaration
> > ./include/linux/pgtable.h:925:17: note: previous implicit declaration of
> > ‘ptep_modify_prot_commit’ with type ‘void(struct vm_area_struct *, long
> > unsigned int,  pte_t *, pte_t,  pte_t)’
> >    925 |                 ptep_modify_prot_commit(vma, addr, ptep,
> > old_pte, pte);
> >        |                 ^~~~~~~~~~~~~~~~~~~~~~~
> >    CC /home/runner/work/mm-test-robot/mm-test-robot/linux/tools/objtool/
> > libstring.o
> >    CC /home/runner/work/mm-test-robot/mm-test-robot/linux/tools/objtool/
> > libctype.o
> >    CC /home/runner/work/mm-test-robot/mm-test-robot/linux/tools/objtool/
> > str_error_r.o
> >    CC /home/runner/work/mm-test-robot/mm-test-robot/linux/tools/objtool/
> > librbtree.o
> > cc1: some warnings being treated as errors
> > make[2]: *** [scripts/Makefile.build:98: arch/x86/kernel/asm-offsets.s]
> > Error 1
> > make[1]: *** [/home/runner/work/mm-test-robot/mm-test-robot/linux/
> > Makefile:1280: prepare0] Error 2
> > make[1]: *** Waiting for unfinished jobs....
> >    LD /home/runner/work/mm-test-robot/mm-test-robot/linux/tools/objtool/
> > objtool-in.o
> >    LINK /home/runner/work/mm-test-robot/mm-test-robot/linux/tools/
> > objtool/objtool
> > make: *** [Makefile:248: __sub-make] Error 2
> >
> > Well, modify_prot_start_ptes() calls ptep_modify_prot_start(), but x86
> > does not define __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION. To avoid
> > implicit declaration errors, the architecture-independent
> > ptep_modify_prot_start() must be defined before modify_prot_start_ptes().
> >
> > With the changes below, things work correctly now ;)
>
> Ah thanks! My bad :(
>
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 10cdb87ccecf..d9d6c49bb914 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -895,44 +895,6 @@ static inline void wrprotect_ptes(struct mm_struct
> > *mm, unsigned long addr,
> >   }
> >   #endif
> >
> > -/* See the comment for ptep_modify_prot_start */
> > -#ifndef modify_prot_start_ptes
> > -static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> > -        unsigned long addr, pte_t *ptep, unsigned int nr)
> > -{
> > -    pte_t pte, tmp_pte;
> > -
> > -    pte = ptep_modify_prot_start(vma, addr, ptep);
> > -    while (--nr) {
> > -        ptep++;
> > -        addr += PAGE_SIZE;
> > -        tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> > -        if (pte_dirty(tmp_pte))
> > -            pte = pte_mkdirty(pte);
> > -        if (pte_young(tmp_pte))
> > -            pte = pte_mkyoung(pte);
> > -    }
> > -    return pte;
> > -}
> > -#endif
> > -
> > -/* See the comment for ptep_modify_prot_commit */
> > -#ifndef modify_prot_commit_ptes
> > -static inline void modify_prot_commit_ptes(struct vm_area_struct *vma,
> > unsigned long addr,
> > -        pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> > -{
> > -    for (;;) {
> > -        ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> > -        if (--nr == 0)
> > -            break;
> > -        ptep++;
> > -        addr += PAGE_SIZE;
> > -        old_pte = pte_next_pfn(old_pte);
> > -        pte = pte_next_pfn(pte);
> > -    }
> > -}
> > -#endif
> > -
> >   /*
> >    * On some architectures hardware does not set page access bit when
> > accessing
> >    * memory page, it is responsibility of software setting this bit. It
> > brings
> > @@ -1375,6 +1337,45 @@ static inline void ptep_modify_prot_commit(struct
> > vm_area_struct *vma,
> >       __ptep_modify_prot_commit(vma, addr, ptep, pte);
> >   }
> >   #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
> > +
> > +/* See the comment for ptep_modify_prot_start */
> > +#ifndef modify_prot_start_ptes
> > +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> > +        unsigned long addr, pte_t *ptep, unsigned int nr)
> > +{
> > +    pte_t pte, tmp_pte;
> > +
> > +    pte = ptep_modify_prot_start(vma, addr, ptep);
> > +    while (--nr) {
> > +        ptep++;
> > +        addr += PAGE_SIZE;
> > +        tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> > +        if (pte_dirty(tmp_pte))
> > +            pte = pte_mkdirty(pte);
> > +        if (pte_young(tmp_pte))
> > +            pte = pte_mkyoung(pte);
> > +    }
> > +    return pte;
> > +}
> > +#endif
> > +
> > +/* See the comment for ptep_modify_prot_commit */
> > +#ifndef modify_prot_commit_ptes
> > +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma,
> > unsigned long addr,
> > +        pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> > +{
> > +    for (;;) {
> > +        ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> > +        if (--nr == 0)
> > +            break;
> > +        ptep++;
> > +        addr += PAGE_SIZE;
> > +        old_pte = pte_next_pfn(old_pte);
> > +        pte = pte_next_pfn(pte);
> > +    }
> > +}
> > +#endif
> > +
> >   #endif /* CONFIG_MMU */
> >
> >   /*
> > --
> >
> > Thanks,
> > Lance
> >
> > On 2025/4/29 13:23, Dev Jain wrote:
> > > This patchset optimizes the mprotect() system call for large folios
> > > by PTE-batching.
> > >
> > > We use the following test cases to measure performance, mprotect()'ing
> > > the mapped memory to read-only then read-write 40 times:
> > >
> > > Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
> > > pte-mapping those THPs
> > > Test case 2: Mapping 1G of memory with 64K mTHPs
> > > Test case 3: Mapping 1G of memory with 4K pages
> > >
> > > Average execution time on arm64, Apple M3:
> > > Before the patchset:
> > > T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds
> > >
> > > After the patchset:
> > > T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.2 seconds
> > >
> > > Observing T1/T2 and T3 before the patchset, we also remove the regression
> > > introduced by ptep_get() on a contpte block. And, for large folios we get
> > > an almost 74% performance improvement.
> > >
> > > v1->v2:
> > >   - Rebase onto mm-unstable (6ebffe676fcf: util_macros.h: make the
> > > header more resilient)
> > >   - Abridge the anon-exclusive condition (Lance Yang)
> > >
> > > Dev Jain (7):
> > >    mm: Refactor code in mprotect
> > >    mm: Optimize mprotect() by batch-skipping PTEs
> > >    mm: Add batched versions of ptep_modify_prot_start/commit
> > >    arm64: Add batched version of ptep_modify_prot_start
> > >    arm64: Add batched version of ptep_modify_prot_commit
> > >    mm: Batch around can_change_pte_writable()
> > >    mm: Optimize mprotect() through PTE-batching
> > >
> > >   arch/arm64/include/asm/pgtable.h |  10 ++
> > >   arch/arm64/mm/mmu.c              |  21 +++-
> > >   include/linux/mm.h               |   4 +-
> > >   include/linux/pgtable.h          |  42 ++++++++
> > >   mm/gup.c                         |   2 +-
> > >   mm/huge_memory.c                 |   4 +-
> > >   mm/memory.c                      |   6 +-
> > >   mm/mprotect.c                    | 165 ++++++++++++++++++++-----------
> > >   mm/pgtable-generic.c             |  16 ++-
> > >   9 files changed, 198 insertions(+), 72 deletions(-)
> > >
> >
>
