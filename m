Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013018.outbound.protection.outlook.com [40.107.162.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56921101EE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348907; cv=fail; b=eDaWAobgYafxsQw7JrR0QINmkhp2gEv7dQJ7Nc6ZQX7CsF2Clsw3lzdCjhxgGfZnMiVUOZtSixrQQZuLtBUre31p1MOB4PBVT0SuU/f5XFrZIdikd2mjKDw4EihHQfreqvuRfjuI+knW8Go7SEUVvrR5LO43PnfLClV/GIf41bg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348907; c=relaxed/simple;
	bh=diWfxljQvqi6LCNT4enoSM54NZ2Z+PUCgtN8jmAFUoM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PBGXGibyBRovICg6TJTPY/vgFsoROShE1U3vT+6qvDinNFM9BGuZGXEsHu5TYl8Jfpbvb3MKghLrAddTK2YH1WXAbsiCQPxG/zksRCnxj7uZGDfHvhfFuxweAOlz6WxCNaeL2/5DhqszxdlBfCNiD1b0DdpxAWNhLB5ej8Zaog8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qpLXb3f9; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qpLXb3f9; arc=fail smtp.client-ip=40.107.162.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qpLXb3f9";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qpLXb3f9"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BoQfXb/kRoVa1gcOWDLU7i0AOISW6oEOZhNnvcAfg6fvDl8eOfkxXWX4GTq8IRuBzQK8x9bKZB3/B+7Frz69XDVPxbl29MGH2LObf/zGhXJMSlpsOG9yfnvM6FCn9rqYOYaQ8ydMBhp9LDkgoNgef0q3T0wPqeS0NHB2owSch2BpNxj43Bze2MVuYopoEkLbezVY/2zSTuqa1uLTi1X1twBGgKcWgaLB2+0Evd7vyDf0zimgtf3X0i1gp/jSodkkqcPg+X3b1nwZ/4WyvXnBwK05ZSxHNIXWeVuDHuxA4m4L1n7I2Z+NtKlpvEXURpVWLy/8hQUy+eBSyoAfnq05Vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fk0A9wu4Y+GArQMwsvqnYEGR0au0RnW4PIZXGG2Njc=;
 b=ovN4PBG4uP+QqO2gObZ8yDkn0Dfh+0hNg+QGaMvd2LW3c2WdWyxDbhmiMDGjMhTZ3+jGvMzytRaHl9lenIleD7mq3842QaCaRt3YJ6GocPZvAulHr+aQKTbZDm0uamRfVOySrp+YVoBQ/JN2HrnItQEnnIWRnQ4hW+YfZAuapPrPPRUv9eJSt8gmoISoF+SNxYE4Ycjam/QH+3RFFX8cN/5VoOVgvA6MhnmejXtjrBIENCUAh8mWqG3RPqc2SYqo/mRozkOp85jRmh+OdD+eK1lLU1X5dHGCMiA9pkXoiK4l1OoFrl9wShUnPd4o70wQcpL35H18BckirtucxYHXYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fk0A9wu4Y+GArQMwsvqnYEGR0au0RnW4PIZXGG2Njc=;
 b=qpLXb3f9gh7MHh2snlEsq+bfZAC3r9HEmdFdkKdl95WpD17sYH0KQmADCktg495NCQJMra6t2+QWH0q/PSrcJMhiStwiLOdrdKEBQbBuRo0UIa2ZOcrjciRo3+8UIbI5VxAr9RK0ko6EGtjhHNc/qaQxYazcoHf9tePLsOi6cbA=
Received: from DU2PR04CA0307.eurprd04.prod.outlook.com (2603:10a6:10:2b5::12)
 by AM8PR08MB5587.eurprd08.prod.outlook.com (2603:10a6:20b:1dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 05:48:17 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::1d) by DU2PR04CA0307.outlook.office365.com
 (2603:10a6:10:2b5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Tue,
 1 Jul 2025 05:48:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 05:48:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzgBnkZailx4VrDfaFvBYJgc55JoM1XLBKiHec9rn2he+SyYHGWPP9BnsF9OwJf+0REwQwQ8S/Kyl2bejTzmHrdAFIo2WNrNAIr5+X3JBs8NC63aUhJU40lHad1RLHE/FXR9Q0dMrBLy/pamuqHQJNyLAjSnLSNozFrXUTYA2UgYeaiuYTVIxr7+XmSIn/KcajTVcADZzSmc7Zk7cAoGx8jEKa2qNAePUJuO2x+/dstdSP26XQPRrPXo3XXGT45iTgdBIOShT49Z6IjGNU2JFKgbep9/ppdW85qaO2L9AuQzdg50EvVGEvtyThSR5Xt5BudBciHp6CW7qzyfNHjeRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fk0A9wu4Y+GArQMwsvqnYEGR0au0RnW4PIZXGG2Njc=;
 b=ZWOA6/LiXivaE2Jh49MxNYD3eUOMqrTm8nC1IWkkaZxGZP05P0Snr/K13hy/eVGTQgr0g3t/mdbbS/u3cG2ubdHiYoAFFUTbWek4bSdEj4HEylMPpnpvOChi18EQ5ameIoAthau08MO9JzYyNshJuZ+hfs5fj0v+9y/Tc+0HGeFbZS9f5VIKNcwIwhjybSwxD0Hh3jRj+BvkcKDEvX5zNWc++xv5Tj703cCeuny3VwrKBlTa0En/AfuzKuudvKgiKcsgk/2qdK4EiSwRg4i5oZTCwjX5vcdiPO5dxl6QAx5Qywn1voOBTHD/ChQNh7DJH+3jhRrDWE2Mg0qzmkEM4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fk0A9wu4Y+GArQMwsvqnYEGR0au0RnW4PIZXGG2Njc=;
 b=qpLXb3f9gh7MHh2snlEsq+bfZAC3r9HEmdFdkKdl95WpD17sYH0KQmADCktg495NCQJMra6t2+QWH0q/PSrcJMhiStwiLOdrdKEBQbBuRo0UIa2ZOcrjciRo3+8UIbI5VxAr9RK0ko6EGtjhHNc/qaQxYazcoHf9tePLsOi6cbA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB7111.eurprd08.prod.outlook.com (2603:10a6:20b:402::22)
 by AS8PR08MB7719.eurprd08.prod.outlook.com (2603:10a6:20b:524::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 1 Jul
 2025 05:47:44 +0000
Received: from AS8PR08MB7111.eurprd08.prod.outlook.com
 ([fe80::4ea7:7e71:7dd3:3b45]) by AS8PR08MB7111.eurprd08.prod.outlook.com
 ([fe80::4ea7:7e71:7dd3:3b45%2]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 05:47:44 +0000
Message-ID: <7b39def0-f7cb-4748-9c20-3655ae30a836@arm.com>
Date: Tue, 1 Jul 2025 11:17:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
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
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-4-dev.jain@arm.com>
 <41386e41-c1c4-4898-8958-2f4daa92dc7c@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <41386e41-c1c4-4898-8958-2f4daa92dc7c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::16) To AS8PR08MB7111.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB7111:EE_|AS8PR08MB7719:EE_|DB5PEPF00014B8F:EE_|AM8PR08MB5587:EE_
X-MS-Office365-Filtering-Correlation-Id: 88e3fe9a-6a71-4f2b-78b3-08ddb862e049
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SmMwNGhQWGxIVVF5bUluMzVNNnZzOE44ZjJDb2dWLzRyd0Mrb0xyZEpRclll?=
 =?utf-8?B?KzAyNEdZbjBGSWxpcjNzVENZaEVOdmUyaFpKcGZjSjk5eTlOYlZrWUcrY1RM?=
 =?utf-8?B?dHZTMUthNVhtbWdXaFYrR21kNzBrUXhzSkI5YzRmME5zK1pLU29iTnhmRTY2?=
 =?utf-8?B?ZDdJSFpiYXNpbnNNY1BMczh3UEdCZlQ5TngyMGVuVU1ZN0JISEFtOEZla0E3?=
 =?utf-8?B?d1ZVcFBnV3VkcUhac3Bqa1dkVDluR1M4eEgxUFppMVczWTBpMERxWWZZanVR?=
 =?utf-8?B?dGNOTnJ0cVpmOXlHOEE5QTREN3lSNHpNNHFER0pNREphYm9UeGZIY21PMEdi?=
 =?utf-8?B?WFBiL0xQYmRxZjZYZWdDWTJSZjEySU5tYlR4QjgrVy9iQjJQQ2pmdkJ5NjFL?=
 =?utf-8?B?Y0R0dXNNcWc0QVNxQ1ZjZlVGWVUxQlpiU2swRnVwd3dDOEZ5WXVZWkN0bkZ5?=
 =?utf-8?B?NXJIVWNYNk5wVFhVdDRXOGI3WEZWMGxCdzRzdFp1eGpZay9LOXRSR05OU3BV?=
 =?utf-8?B?N2d5WGEybzE1OWlWak1ITnFVMml6UlNqbk9Jd1hWZjUxdmtGT2svdGVOQVNJ?=
 =?utf-8?B?Wmp4YUZBcTdhK0JmdjZlZFg4UTdidTZvdGZKakFjLzJSdnF5UG5Mem1ScDA3?=
 =?utf-8?B?cjlKYXJWbUhYSVFSV251VGRhTVM2ZFQvaFZtTG1pNVNUTTE2dkJKaitLalgv?=
 =?utf-8?B?VU42cGw0ajROMHJHUjk5Uld5WS8rS3EraEY4cVgrOVh5M3FLc1R2N0M2c2xB?=
 =?utf-8?B?YndFM3NVREpmS0VwaFJCcm1PUFBKZlI3QkFZL3IxdU9BZ2ZmazZDN3lJeHo4?=
 =?utf-8?B?MGZCZjdwVXNVcVB4NVRpMnRtZ1lZOENmY29QL29zWDN3cGVYdHJ3ZE01Vmpu?=
 =?utf-8?B?Y3VOSVgvM3dWblR1d1FOUDdxMHpXL05mSjU2cTV4S09KdkVUSHowQmhGM3Zz?=
 =?utf-8?B?MjhhMG8wQjN3cWh1MlJzNXpITkdPL2FQOHBYbUZnOVRpMEd5M0FVOVRFU29F?=
 =?utf-8?B?ZWlZMDA1b21yTWdmTnB5UVpkZEczYWE3bEpzWWpOdytQWFBVa0gzZlFhS2Q5?=
 =?utf-8?B?aVpPUS9ZQ0s3RGlrNHc0Z0MvT2tmcGlWNHhsQmFISHU1Yk9KaU5tdzJCc1NE?=
 =?utf-8?B?VWx5VTRpbDgvSXpueHdpYURLTGtzZFFuZUZGUTd6dWM3RFVxWC9XKzMrYnU4?=
 =?utf-8?B?WHNtNWRyaFBTVlBBOHJSVnU5OExhQnZVYzVqK3NocmdISzVZMXp2VmhYTTF3?=
 =?utf-8?B?WFJ3L1Fta29EUVM3VFhwcTB0UWpuVEdBb1hNRGVVMDdHSUxEeXR4NURKUk5T?=
 =?utf-8?B?L2tVNnJLeCtNSkVFRlpMeDFtaHJZZGdQWUlBZWdBWEgyZ2I2Nng1U1k5QkRU?=
 =?utf-8?B?eU94VGRNK3A0KzA0dS9aU0tlME1iTUtOa1VqNEYrenJ5UlBHdE5TM09TSXhw?=
 =?utf-8?B?NGVZMDlxZ1E5VlduVGxqcDlpK0ZtY1pITW4yeG1POHk1K1VhTWE1OUgwMitj?=
 =?utf-8?B?VFdYOGJFclBtTU1hZC9HcnRsa3Zkb1N5NE81ZnN2TE5JL3dKRk5ZY25wU2N4?=
 =?utf-8?B?TGQ1enAwdzlHSUY0VFNCd2pJUWd1LzhKS1BETlVQR2hkazVKK2l6T1hTUC9i?=
 =?utf-8?B?RnNaNSt1bk9YTXNIRW83SFBrN0VZclE3TnBUdVZ4OGh0RmkyWjNqbDZMd0ln?=
 =?utf-8?B?dGZKa3lxMUJoc0Q3cDA4VFF0am5KUUxVc0pWRGVDdU13bTg3bmpRZVI3TDNH?=
 =?utf-8?B?VmVSSW5CYTd0aWRGQzRjQnplL0ZzT2dRMUJHZ0d5VmFya0ZOMVNUeWUzaklt?=
 =?utf-8?B?RnVmN2F5bHQrZkV1d1pzdkVYbVNJZm9LMTlPT0J6eWl4MkNKb0VYS3ViZzBB?=
 =?utf-8?B?ZHMzNDVrN0hBdFUrY0tFWER0QkhjYXl2Q0REbFczU2RYSlBMUnFmNFlXNEpV?=
 =?utf-8?Q?Iy7xS5Yxqaw=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7111.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7719
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5f4ac4fc-c9a1-458d-3088-08ddb862ccf3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|36860700013|7416014|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3JSb2kyd1RYbHJ2M2dLeDYzd1l4YStVZ1ZrVDM3bnU5S3RkOGtJK0x4cU1G?=
 =?utf-8?B?cFhFS0IxbWFXcUMxYkZ5d3AweDNzYWVlSFE2S3ZOdG5YTm5saCtPeERmTG5q?=
 =?utf-8?B?NTV2MFpYdnpNcUszN3hBRmtDdEEwdVRBbkhPeXZEOHhrWFhob0hhdHAzZjgx?=
 =?utf-8?B?Z21wbEFFdnYzOHJBR0NjZFpkVHB5UmtPYWR5QWorTFduRkRoVkVwMnVPWkgx?=
 =?utf-8?B?TmdPRmV1U0tSbnBqTmZ6SE1GVFVFRjhDT0hsOTVxTW5aa0lYRXlUdVI0clc1?=
 =?utf-8?B?RTBFNkEwTU1SODFwREdyUGg4b2RwWWRsOXI3Qm9qek9pUDc5RWtpKy9nNEtr?=
 =?utf-8?B?dTZ2YS90MWp0bk5hWlFyZGhOYkNrdzlQVk5zTmg1azFOMUFIdVoxcDhtazZj?=
 =?utf-8?B?aFpOZnA4dlZReVRpNFNHSXYwcXdsZm5NR01QRVpBd016Q2FoV3ZDdUQ3Tzdu?=
 =?utf-8?B?QncwcWZOV0p0RDFKYWNIS0VDaTRlOVlXTWo3TGVnWk5uOHNja3RRa0ZWeDdu?=
 =?utf-8?B?dkpwM0kwK002ZlFqbVp5bHNwU1ZmT2xqQmE1U2FidC9PSmZaVHlnTHZMTVVV?=
 =?utf-8?B?dDlKQTljbVVjSDZXTnJjY2tkdTVXZXZYYjBvUlY3WFUxLzJTazNub3BGUmJS?=
 =?utf-8?B?aEg2RXl5OG5jZUlSYmlWMHBnU2hJdFZkVlNkeU1xcVlkYnpTMk5wWHJiT1Jv?=
 =?utf-8?B?TlliUzJkT2oyZFExK1pLSGtnOTN6YmU4SmF4NmZPdTBwalNwdUdLZ09GZHk0?=
 =?utf-8?B?L29hMjh6aWpldlU4TTJrdnM1SnZranlzOFJUUnFKL1UzN0dIRG5WaDY5Z3ho?=
 =?utf-8?B?Snd5ZjgrS2F3bmFIYnk2YnM3SmtBUkZlRXZaUFQzQnR2OTZDY3VldjFCRmhS?=
 =?utf-8?B?ZWF3aGl5U1JwbldLY25JRllWblVsUXlvdEc4WWN2MlBYQzlFSDlVME4xWWtE?=
 =?utf-8?B?WTV1N1FYTlp5ekRxZTJ5bXVaQ1NOSGVaelUvdDNoZmJHMEtyajI4K2YwNFZG?=
 =?utf-8?B?T3RTWEo1NlZKd0crVHVzWFI4a1hRNUJZOFN2NVpJSDE5T2lGNmlvdThWeWxW?=
 =?utf-8?B?RVRxNHVQWXdDWmwwNFY0cmplNlBEV3FDNWljSVJZNmd0Ui9VV01OdW5aMUhz?=
 =?utf-8?B?RjF0SjlMblNaL1NJelpsSVZzMGV3b2JnS1JnVUZHSzVKVi9OYnlvRVNuaFhP?=
 =?utf-8?B?aTY1WG9SVUFuM1BQdEVNUjY3aG8rRFY5SEwzVmN0Y09sWThtc2Ryemp2OE1i?=
 =?utf-8?B?VGZ2VTFaTHppdjMvMkg5RkYvbEVlWXF3WWtUYlcvSHdNNjZ3bmFBL2RmSmQx?=
 =?utf-8?B?VE5mOThJTzZvaS9BMWlPdmpIRHpFeG03M1QvY0Rnay9JT1FCbU5nb25XU3Ju?=
 =?utf-8?B?bnIwditZdG9jd1RvSmJtaWJqREVtYWxMeGNtQlZuaVE5Unp3MmpGcnNINVR4?=
 =?utf-8?B?MkFCNFI3ZWdCNXNlazU3c0h4RFpFSFFVQ2NPNW83ZGhSMXZyWW5QY3FrMXow?=
 =?utf-8?B?NjlUU2E0N25Gd0NxNldFYlVyVVhSUzhIWUpaQnlZQ0NIbkZEc04wdmtMSFM2?=
 =?utf-8?B?bE1qdUlqajZ2SnJ6NkNtSnhnTHhOSzI1SGVGZHNlaittaUMyTk9ram5pR1NN?=
 =?utf-8?B?YzI4RDY2SXc1UHRJVGxSekF0YW5BNVJWY1IrN1FlZ1ZHTWhuWDZBSmhadXZv?=
 =?utf-8?B?d1FVZ0tZYng4OVZ3VksvT2NpRFVKUDg5c2hSUjdEczZUUm44UnBWSUhycVY1?=
 =?utf-8?B?ODVxcVhlK3NIV0pwblB4UUYrYmtZa2FZWFBZKytseUFEVFM4RW1GNXFISG4x?=
 =?utf-8?B?MEtKNHBmNzJjWkM3cjZCVHlVeVJQQ1h6d1NzOHBWRDhBZnpiNkdqRzBjbks3?=
 =?utf-8?B?UXcxeEkwYTdlQ3RsVDdId2Y2TTRvNG1YbDVobm8zeUQ3TXBmVHprSkFCWmZ2?=
 =?utf-8?B?QndlTVlvRmZodmV1L2tEWFgyODVweU1zRFRWZDY2ZG90bU43bk1HOGZoVTRZ?=
 =?utf-8?B?d25VYm9xY0o0aGs4RDJwcnpwbVg1K2xEbk1xMzNWVVFrbFA1ZDdzam5yS3FC?=
 =?utf-8?Q?jRkIvf?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(36860700013)(7416014)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 05:48:16.4623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e3fe9a-6a71-4f2b-78b3-08ddb862e049
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5587


On 30/06/25 4:01 pm, Ryan Roberts wrote:
> On 28/06/2025 12:34, Dev Jain wrote:
>> Use folio_pte_batch to batch process a large folio. Reuse the folio from
>> prot_numa case if possible.
>>
>> For all cases other than the PageAnonExclusive case, if the case holds true
>> for one pte in the batch, one can confirm that that case will hold true for
>> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
>> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty
>> and access bits across the batch, therefore batching across
>> pte_dirty(): this is correct since the dirty bit on the PTE really is
>> just an indication that the folio got written to, so even if the PTE is
>> not actually dirty (but one of the PTEs in the batch is), the wp-fault
>> optimization can be made.
>>
>> The crux now is how to batch around the PageAnonExclusive case; we must
>> check the corresponding condition for every single page. Therefore, from
>> the large folio batch, we process sub batches of ptes mapping pages with
>> the same PageAnonExclusive condition, and process that sub batch, then
>> determine and process the next sub batch, and so on. Note that this does
>> not cause any extra overhead; if suppose the size of the folio batch
>> is 512, then the sub batch processing in total will take 512 iterations,
>> which is the same as what we would have done before.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mprotect.c | 143 +++++++++++++++++++++++++++++++++++++++++---------
>>   1 file changed, 117 insertions(+), 26 deletions(-)
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 627b0d67cc4a..28c7ce7728ff 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -40,35 +40,47 @@
>>   
>>   #include "internal.h"
>>   
>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> -			     pte_t pte)
>> -{
>> -	struct page *page;
>> +enum tristate {
>> +	TRI_FALSE = 0,
>> +	TRI_TRUE = 1,
>> +	TRI_MAYBE = -1,
>> +};
>>   
>> +/*
>> + * Returns enum tristate indicating whether the pte can be changed to writable.
>> + * If TRI_MAYBE is returned, then the folio is anonymous and the user must
>> + * additionally check PageAnonExclusive() for every page in the desired range.
>> + */
>> +static int maybe_change_pte_writable(struct vm_area_struct *vma,
>> +				     unsigned long addr, pte_t pte,
>> +				     struct folio *folio)
>> +{
>>   	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>> -		return false;
>> +		return TRI_FALSE;
>>   
>>   	/* Don't touch entries that are not even readable. */
>>   	if (pte_protnone(pte))
>> -		return false;
>> +		return TRI_FALSE;
>>   
>>   	/* Do we need write faults for softdirty tracking? */
>>   	if (pte_needs_soft_dirty_wp(vma, pte))
>> -		return false;
>> +		return TRI_FALSE;
>>   
>>   	/* Do we need write faults for uffd-wp tracking? */
>>   	if (userfaultfd_pte_wp(vma, pte))
>> -		return false;
>> +		return TRI_FALSE;
>>   
>>   	if (!(vma->vm_flags & VM_SHARED)) {
>>   		/*
>>   		 * Writable MAP_PRIVATE mapping: We can only special-case on
>>   		 * exclusive anonymous pages, because we know that our
>>   		 * write-fault handler similarly would map them writable without
>> -		 * any additional checks while holding the PT lock.
>> +		 * any additional checks while holding the PT lock. So if the
>> +		 * folio is not anonymous, we know we cannot change pte to
>> +		 * writable. If it is anonymous then the caller must further
>> +		 * check that the page is AnonExclusive().
>>   		 */
>> -		page = vm_normal_page(vma, addr, pte);
>> -		return page && PageAnon(page) && PageAnonExclusive(page);
>> +		return (!folio || folio_test_anon(folio)) ? TRI_MAYBE : TRI_FALSE;
>>   	}
>>   
>>   	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>> @@ -80,15 +92,61 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   	 * FS was already notified and we can simply mark the PTE writable
>>   	 * just like the write-fault handler would do.
>>   	 */
>> -	return pte_dirty(pte);
>> +	return pte_dirty(pte) ? TRI_TRUE : TRI_FALSE;
>> +}
>> +
>> +/*
>> + * Returns the number of pages within the folio, starting from the page
>> + * indicated by pgidx and up to pgidx + max_nr, that have the same value of
>> + * PageAnonExclusive(). Must only be called for anonymous folios. Value of
>> + * PageAnonExclusive() is returned in *exclusive.
>> + */
>> +static int anon_exclusive_batch(struct folio *folio, int pgidx, int max_nr,
>> +				bool *exclusive)
>> +{
>> +	struct page *page;
>> +	int nr = 1;
>> +
>> +	if (!folio) {
>> +		*exclusive = false;
>> +		return nr;
>> +	}
>> +
>> +	page = folio_page(folio, pgidx++);
>> +	*exclusive = PageAnonExclusive(page);
>> +	while (nr < max_nr) {
>> +		page = folio_page(folio, pgidx++);
>> +		if ((*exclusive) != PageAnonExclusive(page))
> nit: brackets not required around *exclusive.
>
>> +			break;
>> +		nr++;
>> +	}
>> +
>> +	return nr;
>> +}
>> +
>> +bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> +			     pte_t pte)
>> +{
>> +	struct page *page;
>> +	int ret;
>> +
>> +	ret = maybe_change_pte_writable(vma, addr, pte, NULL);
>> +	if (ret == TRI_MAYBE) {
>> +		page = vm_normal_page(vma, addr, pte);
>> +		ret = page && PageAnon(page) && PageAnonExclusive(page);
>> +	}
>> +
>> +	return ret;
>>   }
>>   
>>   static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
>> -		pte_t *ptep, pte_t pte, int max_nr_ptes)
>> +		pte_t *ptep, pte_t pte, int max_nr_ptes, fpb_t switch_off_flags)
>>   {
>> -	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +	fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +
>> +	flags &= ~switch_off_flags;
> This is mega confusing when reading the caller. Because the caller passes
> FPB_IGNORE_SOFT_DIRTY and that actually means DON'T ignore soft dirty.
>
> Can't we just pass in the flags we want?
>
>>   
>> -	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>> +	if (!folio || !folio_test_large(folio))
> What's the rational for dropping the max_nr_ptes == 1 condition? If you don't
> need it, why did you add it in the earler patch?
>
>>   		return 1;
>>   
>>   	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>> @@ -154,7 +212,8 @@ static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct *vma
>>   	}
>>   
>>   skip_batch:
>> -	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, max_nr_ptes);
>> +	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
>> +					   max_nr_ptes, 0);
>>   out:
>>   	*foliop = folio;
>>   	return nr_ptes;
>> @@ -191,7 +250,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   		if (pte_present(oldpte)) {
>>   			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>>   			struct folio *folio = NULL;
>> -			pte_t ptent;
>> +			int sub_nr_ptes, pgidx = 0;
>> +			pte_t ptent, newpte;
>> +			bool sub_set_write;
>> +			int set_write;
>>   
>>   			/*
>>   			 * Avoid trapping faults against the zero or KSM
>> @@ -206,6 +268,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   					continue;
>>   			}
>>   
>> +			if (!folio)
>> +				folio = vm_normal_folio(vma, addr, oldpte);
>> +
>> +			nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
>> +							   max_nr_ptes, FPB_IGNORE_SOFT_DIRTY);
>  From the other thread, my memory is jogged that this function ignores write
> permission bit. So I think that's opening up a bug when applied here? If the
> first pte is writable but the rest are not (COW), doesn't this now make them all
> writable? I don't *think* that's a problem for the prot_numa use, but I could be
> wrong.

Can this be fixed by introducing FPB_HONOR_WRITE?

>
>>   			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
> Even if I'm wrong about ignoring write bit being a bug, I don't think the docs
> for this function permit write bit to be different across the batch?
>
>>   			ptent = pte_modify(oldpte, newprot);
>>   
>> @@ -227,15 +294,39 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * example, if a PTE is already dirty and no other
>>   			 * COW or special handling is required.
>>   			 */
>> -			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>> -			    !pte_write(ptent) &&
>> -			    can_change_pte_writable(vma, addr, ptent))
>> -				ptent = pte_mkwrite(ptent, vma);
>> -
>> -			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>> -			if (pte_needs_flush(oldpte, ptent))
>> -				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>> -			pages++;
>> +			set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>> +				    !pte_write(ptent);
>> +			if (set_write)
>> +				set_write = maybe_change_pte_writable(vma, addr, ptent, folio);
> Why not just:
> 			set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> 				    !pte_write(ptent) &&
> 				    maybe_change_pte_writable(...);
>
> ?
>
>> +
>> +			while (nr_ptes) {
>> +				if (set_write == TRI_MAYBE) {
>> +					sub_nr_ptes = anon_exclusive_batch(folio,
>> +						pgidx, nr_ptes, &sub_set_write);
>> +				} else {
>> +					sub_nr_ptes = nr_ptes;
>> +					sub_set_write = (set_write == TRI_TRUE);
>> +				}
>> +
>> +				if (sub_set_write)
>> +					newpte = pte_mkwrite(ptent, vma);
>> +				else
>> +					newpte = ptent;
>> +
>> +				modify_prot_commit_ptes(vma, addr, pte, oldpte,
>> +							newpte, sub_nr_ptes);
>> +				if (pte_needs_flush(oldpte, newpte))
> What did we conclude with pte_needs_flush()? I thought there was an arch where
> it looked dodgy calling this for just the pte at the head of the batch?
>
> Thanks,
> Ryan
>
>> +					tlb_flush_pte_range(tlb, addr,
>> +						sub_nr_ptes * PAGE_SIZE);
>> +
>> +				addr += sub_nr_ptes * PAGE_SIZE;
>> +				pte += sub_nr_ptes;
>> +				oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
>> +				ptent = pte_advance_pfn(ptent, sub_nr_ptes);
>> +				nr_ptes -= sub_nr_ptes;
>> +				pages += sub_nr_ptes;
>> +				pgidx += sub_nr_ptes;
>> +			}
>>   		} else if (is_swap_pte(oldpte)) {
>>   			swp_entry_t entry = pte_to_swp_entry(oldpte);
>>   			pte_t newpte;
