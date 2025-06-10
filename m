Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B72EC4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.23
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541535; cv=fail; b=AZ7FxmDF/Zo7arrXsjF08XSCj1MCfZ7dPo2+kWzXqnSAaK2c6vi42RW0DfrhbSFwy3n763ZIWTSaY+AdkE+1lUTrWEq574zuz6v6oK08bGwfi0uD/ntE/aJEIMZdyXJDi8bVB0cDXHHU4NehHmgNzT+Ljz7rebC/so+gvKwALeo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541535; c=relaxed/simple;
	bh=c7gFVAaqDW+DgQAZg9WUJieKfCFzNDQ2tNYPQUPWaXw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KIJUyevw40iGWoJ8XRere7Q7E1fX0kkg70kwSTyoC6pEs2cmco/EhHz1ZvY7uaGJ4kJ2iqsDik74kdrMT199nvO3D/pIydoD97ueLskE2X50RVriUMKVk82IPCss+QYrtpNoKMhb1lPW+DbrjR4W1uy/FAoI6/i4vWqabHIra4w=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rNvn1Cjh; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rNvn1Cjh; arc=fail smtp.client-ip=52.101.65.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rNvn1Cjh";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rNvn1Cjh"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IUqEMqzvcmjWMskVbTDtdmWU4Fdbo893SFWpQdSZeu5XvkYmNzcrSQq4rFvD0S+6iGmpd3gda171deUsg2zC3iZI22HiAZbRkXJzOBxPM/2+mZHSHFIORS9SWOxSU0yCNOOt7qYh6NaBS3OrLEqmvmZCzP+Ni0SvPTyYYVBDCFP1UenpY69tOG9XEdQaff5zvPIg+NCeGZBAVJLxs0rc3l1H0ymFrYLxJ6OMnhxjsTvs8WhJx+Q/XVls2uOPdibO+czcOKZT7G65wMWh0jId48dAhum0Lorej2l4QblOOyEIwV+IYEzyK2vLaCs5ybI0y+GPBf15Q8CLx1HToI7Lng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpaAUkCsSUzes8NzmSNvRc9Ht42J4pmUKF9iF/Tq8nk=;
 b=zVREZL/+y2j6RCA6Wg4lifSfZO49DfLBpak9Mf+j6uxVcC7tU3RYSnOoQFBQqobNdqTuzO5XMd+nwt8CXCpn0vU5fYqoG64hTKoYbbYGmcqnrCSeFJygc+WLTxNEm5jP0eIrZ/eGZplH8WhmfPXpkSBrshWNr5TqW3e895ssP+uC+xXDYbeFVmzagyJm3XX+gIZ2ROyLk75/8ualQkCEoTzVeWvcPfJH/CAEXePK0hiNrVYBUM2+qlv8ubGW7aGYFolN1CYxJbAOgNR1Zdih7cyRfaDoQ3c0eiXyz0aETu8UNLRqQl/gPpB9vBfc5uVmIOYq5V4G7gcn33bNeAz6tg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpaAUkCsSUzes8NzmSNvRc9Ht42J4pmUKF9iF/Tq8nk=;
 b=rNvn1CjhCRmmdUucVhwIJdLvgu3M6edYUDmUj0KyvHhUxr7dpIPaU4ZMYbgPcqhA/S5O664PMZbUHmq6Bus7e8twvrdDaD1JKH545IGE5MiomgS+jsIXlFWWn4mqLyjdPl459+WHykh9IKcJ3qzwmLTVDMYGdexsX8mUgBfkIt0=
Received: from DB8PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:10:110::11)
 by DB3PR08MB8913.eurprd08.prod.outlook.com (2603:10a6:10:43a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 07:45:28 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::66) by DB8PR04CA0001.outlook.office365.com
 (2603:10a6:10:110::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.22 via Frontend Transport; Tue,
 10 Jun 2025 07:45:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 10 Jun 2025 07:45:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xameC+S++YSj4VRWHeuLiXJ6c4e+0BheR7ru6ScGiGAB3P5mgtO2R4bi+9F44nNyVLRF5MzweBvEYc/nPyph99i2T4Kocpf0VUj2GMJiMdZFEHfkxeQzdO2vVe84bfxhwS+vW34EPkZGNM+05oFJMIKL51ZcNXiZOhRQNgqVzGTHbSRZFbNDgrLp+l8xKPFap+3E9X8dWSYo5iHHdN7DTiyIOYCgQyrIJFFCixrzTTUBOvLfa5HG2FWogpH48u35t9HLdGcG62YgiPyfR1t7T6v8h09zUqjoU8keXAkB+izcCspcnx+sldSHt27zZs57VR9oWHzY1mlYKObtNBMJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpaAUkCsSUzes8NzmSNvRc9Ht42J4pmUKF9iF/Tq8nk=;
 b=v19d/UWTp9G8YAqzCs5oYG10UMNwbsADQaJM9zp+bXxY+MpH0qKJNWxV1egvgGkjovbY2k1QF4xw7sCRLQiB391sRWRWJ4qq4p2CicRC2qS+x18VhWMJLSRCLipYRZhYDQ3md7hiGkSFTPUy9LYbzkke+ExPOsxw1GauQUgzhv3K/JKpkGS70frFwzm7hLK6B/nw1os6OaDGw+D9hZPjqpkHZ2gtHe2LehE+SUbHy2122ofBhjpvz0zUNew09JHy+h+BUeb6YXDNpjxNWcBolaIqRL3/XHvpnGDzeQL7PIJLbbtseTb+PXKhp0v/CqAmBftCN4qxm/6SoRKcg5zSQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpaAUkCsSUzes8NzmSNvRc9Ht42J4pmUKF9iF/Tq8nk=;
 b=rNvn1CjhCRmmdUucVhwIJdLvgu3M6edYUDmUj0KyvHhUxr7dpIPaU4ZMYbgPcqhA/S5O664PMZbUHmq6Bus7e8twvrdDaD1JKH545IGE5MiomgS+jsIXlFWWn4mqLyjdPl459+WHykh9IKcJ3qzwmLTVDMYGdexsX8mUgBfkIt0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS2PR08MB10010.eurprd08.prod.outlook.com (2603:10a6:20b:64a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Tue, 10 Jun
 2025 07:44:53 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 07:44:53 +0000
Message-ID: <bf185ecc-8310-48ad-b9cc-5c78e3da6d0b@arm.com>
Date: Tue, 10 Jun 2025 13:14:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] mm: Optimize mremap() by PTE batching
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com, mingo@kernel.org,
 libang.li@antgroup.com, maobibo@loongson.cn, zhengqi.arch@bytedance.com,
 anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
 hughd@google.com
References: <20250610035043.75448-1-dev.jain@arm.com>
 <20250610035043.75448-3-dev.jain@arm.com>
 <CAGsJ_4xPq-eJ7JE-SFhhO2TboH8HKGifaYCwKw8cqd_2K=uD4w@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAGsJ_4xPq-eJ7JE-SFhhO2TboH8HKGifaYCwKw8cqd_2K=uD4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::17) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS2PR08MB10010:EE_|DU2PEPF00028D01:EE_|DB3PR08MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5da26e-940e-4dc5-ece7-08dda7f2c3f6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Z2ttRlVPaktJMXdLZGNwaU90LzVDL1J0UXhEaTZlRm5DSS9mUnFvYmMvZ3ls?=
 =?utf-8?B?NFZxV0R3YUhDUkwxWndmWmlPZmVpcEViV3Jmd3JRZzBvWkliNXZpSnR4T2kx?=
 =?utf-8?B?dFB5cklYcndidzVtaFVBL2hUUytMMG5yVXRmMXdCdnBXUXlLWlNnSWJrRm9j?=
 =?utf-8?B?SGw1TThOVGJhdkxPd0lDdG9LaUpmRTBMV28xOVRCaFVBYmQ1SGlJdzlCRUV3?=
 =?utf-8?B?VTNvTENQTURxQnB5RzVwWFdYdFd3WWRtemsxUElGK05qbXQxTW1idndMT3Bw?=
 =?utf-8?B?NjdyS3pMQ2J0U0RuOXB1K0ZjQTZpTEdoVE02UDNBMGZwRk9QcGp2SWFyRFhl?=
 =?utf-8?B?dWp3cUJ0ZnVmaHBicGJOT3lFZEhSTy9ON0hCZ0RLbnIrZW5pajI2WFZYTkZR?=
 =?utf-8?B?RnFMUHRuZXF4QjYyRHcydndwSCs0bWR1TG5LMWN2eHZ0K0puKzk3aVRFMGQ1?=
 =?utf-8?B?YUwwLzZibDFPektoL21idE85T3lSQm0xWEY3Zk8xZW42RDF4eHI5ajN6V2dn?=
 =?utf-8?B?ajlZZFlaUVdvaHpLcmc2bkgyeFg0aW40b2h2QWx1S1dxU3pNN3IrczBKaHEr?=
 =?utf-8?B?eEpBNE5iYmcvcE8zakpNRTVGaG1BV0FRUUZVT2tadmVOWHdxb3Nsb2VPbXZa?=
 =?utf-8?B?dm11TTVpa3Rzc242ZFpuNkx2eVJHakVubEJ4M01CVWd0bkZBRzIzcE5nOFkv?=
 =?utf-8?B?MUE2NlFBalBlcGVLcjhueC8zdHR4VFJTdTFlc1gwUExXa2lKWERrSENuSDBx?=
 =?utf-8?B?elROd0dTSTdic3QreUE1U21kV0djRlQzRTFyREg0eFdtY2hlVUl0RzJpMmgz?=
 =?utf-8?B?VXMxWVVPU1prSm5qMTUvNnd4ZVIvd1ZvcFNBV3VQeXQyYndKdjdDQXJ5dnhs?=
 =?utf-8?B?ODJaay9XZWdqTGlTS093dG9LWHRDUkRURWlJMWU5b2FtR2VRcG90REp5dG1I?=
 =?utf-8?B?bVdSSFpDRjhOUnFBNjdCYThZY2FCM1E1ZG4yV0pUWWtEVjRvendYUmxWanpn?=
 =?utf-8?B?T0hBZmsvL0ZxWE0yejVKTjJITjhWLzBQUHp3S010dWo4M3o0MWRoWjFKZmh5?=
 =?utf-8?B?TjU4akRKTGdTN3YyWGsyVmF0cUdpRG5LRFNDNm9oMkFGQ1FWM1RNbDF1S2kx?=
 =?utf-8?B?STNQaGl4MEtOUWRKVnhldE5SMTBVSUVOSnBsSGUwWEhWWk9FVGNGNTNhUkVr?=
 =?utf-8?B?ZDdGOWw0MFh5Z0hGOXdFRExBNHhLcCsyYVR1enBNblRYOWdCKyt3aENTZm5Y?=
 =?utf-8?B?ZVVvdWNEUDJXRUh2U2l4Nnd4a1doY0s3QlBIQXkzcnpjNWVoZVlFUllwb0p2?=
 =?utf-8?B?Mkd3ZXk4b3RjZW5FMWhtR1d5ZlM2c0RpS01vYkxHYnp1K1gyMGxEWGFqbVMy?=
 =?utf-8?B?alo5ak5NYjVuenFlNUJQbkUxdUxpV0pzYkFhUnczUVZaVDExRmE3QzhUdkRB?=
 =?utf-8?B?MWI4MlpIWW5SOUhBekppajNoc0I1a3p5dmxXbStUOEZxUnpSVkFtejNlSEZv?=
 =?utf-8?B?VjBnNE02ZCtwaGJvczlybFVkeUxDV2dIUTY0czEvb2U0NjU2NzdTb0xkbTlZ?=
 =?utf-8?B?TnA0VGdkc0JoMzFzOEpZemlDZUtHRU5nZlhhNGdvTFgvL00vN0t4OUVWVXpx?=
 =?utf-8?B?MnlLTm8xa0tvMEdWeG5PWnlnOVVNN0w4VTMrODUyZ0hVbzU5ZkxkbktZdFBv?=
 =?utf-8?B?bFROa1NlTzA3QXJ0MWpWZDI0YTAzZE5pRjB2SjdwbzEyc2Uxd1h3QXdMTUNX?=
 =?utf-8?B?NzlTdDFzcUpBcm5lRXhrNUxKb1JtSjVYQlQ2RXVSU1dlMXZBckpkMVYveDFI?=
 =?utf-8?B?WWdJemc5bjhReFZ5Unk2ZmRDZkF5anlMa1JOVXl3cys4a1JBTHYyV1cwL0Y0?=
 =?utf-8?B?bnhXdHNObHhTT2EvT3ozWXU5V2wzSkxJSndMVjFQQk1IaVE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10010
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	15048ff9-6a16-432c-493e-08dda7f2afff
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|376014|7416014|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVRsQkZrdXVlM0VGN0F5SW5NZHVpYmV1RHU5Y0lHNGx0cWpXKzhtSVB3T1lr?=
 =?utf-8?B?TWR6ZVlnM1lhSngvei9LaFBSYmFjVTRKVzZFR3dFRlA2TlBCc0hycitWUG92?=
 =?utf-8?B?K3l6L1V5UVUySEJHaVVkeWlOdWZPTktPR0dpSEZTOEVoMlZBaTZDT2prSlNt?=
 =?utf-8?B?dDhIMzlXOERNU0lmTnVxRnBDa2ZPN3lrWGtkWEs0bHhGTFJseERZK0ZnMTBQ?=
 =?utf-8?B?Z3NMZVA2L1hWVUYxRHhwQUptYWl6ZkxoWjk4ZVFkcEFXOWpxMUpJeVBRMFAr?=
 =?utf-8?B?ZUlwNjBrTDBxdStPL0JnVTdpdkk2QnN2d2g2NXpLUW82d3BVNjdobnJSNlZP?=
 =?utf-8?B?NXRnenllb2p1MEFIYjZyQmtYampOaGpoNmVuV0R4NnFlRTVNODVTNlByMUta?=
 =?utf-8?B?aWt2cm9YcUlCQTNrNEhINEVYZmgxVjBVRGozOHJQWlRNY25kN1BIb3czQ0p2?=
 =?utf-8?B?dDhBeHordEh6azNZS0pCWUJybmpVZmFRV0ducXMxMlBLdnJSNFN5NHJVbERw?=
 =?utf-8?B?bVJoRkJoVkswQmZpS0M3OUMxcGZ3UHBPcnpWbHV3Vk83M2l0aFFSejhyK0Ji?=
 =?utf-8?B?aXpUQUthNnVJRXRTNjBzTUtRWkJSZ0NadkU4QUNweGFqamNpRWR1ZktvanRF?=
 =?utf-8?B?TXN2ZkNzNGFJL1BBQU1MVE1MUHdvUE1WVnNYNllESVdNVlA3bk10MnQxcVp2?=
 =?utf-8?B?VzBtZzhiODhLZTcyNFlEbHJ3b0VtYlFIdVB3dTBoSUxjUlpKTlVvaXR5dlNM?=
 =?utf-8?B?SHpFci92dEFYekhmMWZTekZZbHdESVFuRFJmdmhJWDBlY0ZxejdmRTVWekxy?=
 =?utf-8?B?dVhCZE5PbE9VRm1IVzdxd1RxV2ZERkt6MzgrWG9lTERXdXZYR21lMU5yWnlj?=
 =?utf-8?B?aWRmRW9za1RiKzVaVDZSOUlwYVV2em92VjhhSzVoNE9tMXJ3L2o1VFlTS0p2?=
 =?utf-8?B?QWVXZG9walRvclFPT1FqQ3lqYzVVN3owNnRDMU1zelNvRUN2bmQwamNYV08w?=
 =?utf-8?B?by9hcUVnd09SR1NiWHNZTjZWSFlDSWNZbk1UTUU1RVBtbFFwZEg1Mk5uU0tB?=
 =?utf-8?B?WnNIU3VvN1hFM1htMWZUTS9oaVZqOTJkLyt2RTQ4ZXdWY3dVZFFhejJhOW9l?=
 =?utf-8?B?UnIzc3BLR1V0MXc5THFMWEFaMC9pM043NU9Fc0VrdVg4UEhGdnFtci9ZV01u?=
 =?utf-8?B?aDhvYlNjKzlWU2U4Mk9tck5NWHJ0QXR4R2pBYjdVMDBUcHNpbjZoZzgrbWFa?=
 =?utf-8?B?Z0RzcXVnOWx3YjBHdld0U0IyLy9IRlo3K1NqcEFBYTdKTWxhYTdnb2VkbjdR?=
 =?utf-8?B?OGxKa0UxK1VMUnhjZENqYWRQQXJKTlFHSVdlZ0FqVm9Bbyt6YThNNnljRXZo?=
 =?utf-8?B?T0dRdTIxMk5TcWgxWDIya1FzbjA0MWZ1YWh0V0J6c2JPWTh5MzU2S2gwY2FS?=
 =?utf-8?B?V3ZKNWdWZjhFTklPNWVPOTdvTmdIcGpkV1lOZlNvUzdyb2MySEI3ZzBrNmor?=
 =?utf-8?B?bnVDREljZ1VDT1djUXEyUWI0TWNBSGM3YW5oRFVuK3dSTGhmQ1VJaWwxQ2Mw?=
 =?utf-8?B?WEo1MEV6Rk5PN004dzlDZnVvTkRVSjAvOWFlM2xHMmVmSGgrdzZKRVM5TWZn?=
 =?utf-8?B?RnRuLzc0dHRMOEhDNyt0djBFNHllQ3NFR1Nna2MxVkR2RkxSTnZmVGJwaHZL?=
 =?utf-8?B?c08xcmFNUUN0dnJnMXBVR29UTXh0K0doRFZLZk5Qb1phZm85TE84L1RIem4r?=
 =?utf-8?B?RUxDWlpSVHdZL2t3dExZWFdyeThrdmtMYjNoU0ltSENHMk1IOTJNc0t5SDVG?=
 =?utf-8?B?TFc2bEZjQXU5TnFSaUxBSG5MZzVlN29mbnNUZklSZlRtYlJ1VVJhVFVxRlRq?=
 =?utf-8?B?MzBEaXQ5bXdLclF3aHNPZWc5VmRBYlRaQXJVVnRFdFJOaE5NZitvM1pzNGRH?=
 =?utf-8?B?Q2trVUdzM3NrQlVGM3lPRCs2NmtLZEZtWSs0aEdaV0lVOFFuTW9rdit3UnRZ?=
 =?utf-8?B?ZTVCSGVudHdMeFYrVkErcjZyWGhmNzhEdnVzZFRjSzNLWTFzZVpzOGEzLzVk?=
 =?utf-8?Q?PVshyo?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(376014)(7416014)(14060799003)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 07:45:26.7004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5da26e-940e-4dc5-ece7-08dda7f2c3f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8913


On 10/06/25 12:33 pm, Barry Song wrote:
> Hi Dev,
>
> On Tue, Jun 10, 2025 at 3:51 PM Dev Jain <dev.jain@arm.com> wrote:
>> Use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
>> are painted with the contig bit, then ptep_get() will iterate through all 16
>> entries to collect a/d bits. Hence this optimization will result in a 16x
>> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
>> will eventually call contpte_try_unfold() on every contig block, thus
>> flushing the TLB for the complete large folio range. Instead, use
>> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
>> do them on the starting and ending contig block.
>>
>> For split folios, there will be no pte batching; nr_ptes will be 1. For
>> pagetable splitting, the ptes will still point to the same large folio;
>> for arm64, this results in the optimization described above, and for other
>> arches (including the general case), a minor improvement is expected due to
>> a reduction in the number of function calls.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mremap.c | 39 ++++++++++++++++++++++++++++++++-------
>>   1 file changed, 32 insertions(+), 7 deletions(-)
>>
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index 180b12225368..18b215521ada 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>>          return pte;
>>   }
>>
>> +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
>> +               pte_t *ptep, pte_t pte, int max_nr)
>> +{
>> +       const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +       struct folio *folio;
>> +
>> +       if (max_nr == 1)
>> +               return 1;
>> +
>> +       folio = vm_normal_folio(vma, addr, pte);
>> +       if (!folio || !folio_test_large(folio))
> I'm curious about the following case:
> If the addr/ptep is not the first subpage of the folio—for example, the
> 14th subpage—will mremap_folio_pte_batch() return 3?

It will return the number of PTEs, starting from the PTE pointing to the 14th
subpage, that point to consecutive pages of the same large folio, up till max_nr.
For an example, if we are operating on a single large folio of order 4, then max_nr
will be 16 - 14 + 1 = 3. So in this case we will return 3, since the 14th, 15th and
16th PTE point to consec pages of the same large folio.

> If so, get_and_clear_full_ptes() would operate on 3 subpages of the folio.
> In that case, can unfold still work correctly?

Yes, first we unfold as in, we do a BBM sequence: cont -> clear -> non-cont.
Then, on this non-contig block, we will clear only the PTEs which were asked
for us to do.

>
> Similarly, if the addr/ptep points to the first subpage, but max_nr is
> less than CONT_PTES, what will happen in that case?
>
>
>> +               return 1;
>> +
>> +       return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NULL,
>> +                              NULL, NULL);
>> +}
>> +
>>   static int move_ptes(struct pagetable_move_control *pmc,
>>                  unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>>   {
>> @@ -177,7 +194,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>          bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>>          struct mm_struct *mm = vma->vm_mm;
>>          pte_t *old_ptep, *new_ptep;
>> -       pte_t pte;
>> +       pte_t old_pte, pte;
>>          pmd_t dummy_pmdval;
>>          spinlock_t *old_ptl, *new_ptl;
>>          bool force_flush = false;
>> @@ -185,6 +202,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>          unsigned long new_addr = pmc->new_addr;
>>          unsigned long old_end = old_addr + extent;
>>          unsigned long len = old_end - old_addr;
>> +       int max_nr_ptes;
>> +       int nr_ptes;
>>          int err = 0;
>>
>>          /*
>> @@ -236,14 +255,16 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>          flush_tlb_batched_pending(vma->vm_mm);
>>          arch_enter_lazy_mmu_mode();
>>
>> -       for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
>> -                                  new_ptep++, new_addr += PAGE_SIZE) {
>> +       for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
>> +               new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
>>                  VM_WARN_ON_ONCE(!pte_none(*new_ptep));
>>
>> -               if (pte_none(ptep_get(old_ptep)))
>> +               nr_ptes = 1;
>> +               max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
>> +               old_pte = ptep_get(old_ptep);
>> +               if (pte_none(old_pte))
>>                          continue;
>>
>> -               pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>>                  /*
>>                   * If we are remapping a valid PTE, make sure
>>                   * to flush TLB before we drop the PTL for the
>> @@ -255,8 +276,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>                   * the TLB entry for the old mapping has been
>>                   * flushed.
>>                   */
>> -               if (pte_present(pte))
>> +               if (pte_present(old_pte)) {
>> +                       nr_ptes = mremap_folio_pte_batch(vma, old_addr, old_ptep,
>> +                                                        old_pte, max_nr_ptes);
>>                          force_flush = true;
>> +               }
>> +               pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
>>                  pte = move_pte(pte, old_addr, new_addr);
>>                  pte = move_soft_dirty_pte(pte);
>>
>> @@ -269,7 +294,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>                                  else if (is_swap_pte(pte))
>>                                          pte = pte_swp_clear_uffd_wp(pte);
>>                          }
>> -                       set_pte_at(mm, new_addr, new_ptep, pte);
>> +                       set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
>>                  }
>>          }
>>
>> --
>> 2.30.2
>>
> Thanks
> Barry
