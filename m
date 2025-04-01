Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3A8204863
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.59
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522538; cv=fail; b=plfOfFj6LZ/067GsNwArVTGYVE5kJJuYdtkjrCzaubqLxHL0arledU0iiT6Ua2gANUDEJgtpJXWkURKxXjRG9+6nuInaWNHQ1pOvrGZsbfVPPTQMUJ0Ky5ZwXCEgBYJ3cAYLNWUudJWxd7CDR9Ucq4KVxCfQhBhOiUdZEwpd4EQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522538; c=relaxed/simple;
	bh=wQ3wfaPlFk2yOgg5L0pMCoPkqCQKsCXrczB20tCZkiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=a/Gc9LkqiJd4QmRY+bUp2mMJMr24OWypI+DhMoOp60OoDqezt9GMPuae391/TOSorhdOqt64UyO7NR5a1DM15XmzeMxXZUMlt7uTmOTcNPCWg+RYqPdYTWvBAA77MSeNEmfOfqt5CCQ7/pcxMl2/xwvIqKHQoHwytS/N21E45qM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rypkbvKG; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rypkbvKG; arc=fail smtp.client-ip=40.107.21.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rypkbvKG";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rypkbvKG"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bbBIeupHQ4CGGZWYf3wSm5/E+ooU1KTqOsz3sUo7yOyuakFyFLMCQGJQwHRIlU+2GYFjdv3D5qFsPyUwGio5KL7x0Fd6VD3z52cvbsWLW2zTAoJSd/EXd7WvNU2GQxasCvj87kE/m7zyPjNbDCFy0DzY+2bebZH8uPDh3qTz0531A3lWD2RYJ/cEvSxdLuWHLskg4YnH2JY/ieeTvDlohFAJcOPICEqE5yLlHTWDpujKDwss/I5DFBk8d/9m/ORveuvm8jsByvUROllNcuzuuoeL3Q9YSrEVO5TRw6yaq4gim6ThHjL78x244EeGLceJbW6tKC6RkNkvlGitlcLWyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCB6axTDa+9Pnw96Iv/CHezjexvrPPHp5Wr/Pn/qDuU=;
 b=Ar4Ll9vdXHoWJusU54CZGWPgCmBTM6VftbUG95fm8y9pNJN/RuD0odvHaH1MroT1H4Al/P0nKv0qGRpunz0L6Vjq6aRpxzcG2bUern7EhV/y0iHeX37OHLuo0UVBKgJgAU75HfyQOb8NYzTgHXppnU4N0xqzoUKtzf2i0KszVGYuSlBmcPb6ncnSEgb/3nkuLn7oC4q1BY/2nBXh1eSzOEv58UuxUaZLoPEOqhxBa99bmyE8UnOZSmsOjg8if69fDJlcLcrxIAuNbfrXJw/T9Md4JfUg768wS0iZoxTU0EgVSNj8LjV2dEB4a92+vne6DYseYkbUd4g0aoSCQcaKKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCB6axTDa+9Pnw96Iv/CHezjexvrPPHp5Wr/Pn/qDuU=;
 b=rypkbvKGX6P/B8DCrD/VR3VuOCY4aXTdSNJf+wiW38v/2XYu1ilFj6NkSjTxlTS5b3irCR0p2MO5YOpCH18VdMTvpf1w2JyD+5I6M1v0jMMSESEtyV3q5EemdX4WJ3CZ+TyJw0/s6PZ1Kp7tCIsmxsXMFy90wB1Z1snfCPXFHqA=
Received: from AM0PR02CA0015.eurprd02.prod.outlook.com (2603:10a6:208:3e::28)
 by DB4PR08MB9405.eurprd08.prod.outlook.com (2603:10a6:10:3f3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:48:47 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:208:3e:cafe::a0) by AM0PR02CA0015.outlook.office365.com
 (2603:10a6:208:3e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 15:48:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 15:48:47 +0000
Received: ("Tessian outbound 67e15cee2e8f:v604"); Tue, 01 Apr 2025 15:48:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75034f922c7c18c9
X-TessianGatewayMetadata: NVIPw0w9ADQjKF8N7lBHDk3qwldFY5qBhz0ct/GaQTJicfn4Dlw78wx7k5V4an/JidtmVm1tSo571sBXgBQUT03XiSlpw12mgy59pC4Opn/GITTkNxmfyTjFEMyJX3OEc/47eitpBmHh1QgQIR5vNEdzNOne3XP2sFbA3kdQJnM=
X-CR-MTA-TID: 64aa7808
Received: from L4cd4c3758d8d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6531A2E9-B29E-46CE-99BB-9FC6DC945D36.1;
	Tue, 01 Apr 2025 15:48:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L4cd4c3758d8d.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 01 Apr 2025 15:48:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvNQsO5wpS/iYy7km+TdNKwXPqn96KQGXbCl2I56mKXtVMZ3izv8nlVGWtvo6LvXgB7C4c3dNJahodjxE9y051LcC0CS78nzCaKnQPKVHxHFyh3MVOxe6Oxwx9sM7LxcTVz56eb9B+8tx/VGrrgd7BYCQ8rRrM/MVhnQSzVQvjmpeWPeLRConq/6UfnB/kixXrGxJvi5IDipSE6+YY1ogkqYbYVeVeZk09g4Tmr+0MPXYdR8Peat7nAJNtxNXppft7Z2Mz7VYPWe8088doQN3oLIwa46/2aIE1l5oPiZF3qtfEnNt64FytWzkJLoEELmN7KwLNZybdda03PDLCPqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCB6axTDa+9Pnw96Iv/CHezjexvrPPHp5Wr/Pn/qDuU=;
 b=R8vm0AihhrJrWmrsePAnjYAI5fBnYE90YVCvbAMbjLdDPYlTmLYYRTLmVEqT912vk9mXCzmbmUwn8h0SK1Rnsm9EtxoopFrXcuipdg5XP/pBSLT1Xn7CzujdGrHCmWn16Q4TJovpMV4YsFRqXXJ6zwTwLcK7DyDrDETz2Pww5g7rJCtvPk2jf47mzAvraSdSkQkIHZu0OcV7jKlgCqpu+Jy48gLJa8NMTR4tMrc2nPVuJYalsg4/QFVwCm2j+gGpTYM+pIzoP7w3mhUHBcd0C1/4Fp7k35HEjKvWWm+zfHB8aDReARBDX7KX9z+SOHGMpH2n3vGFtS1Fm+Gr3S3fPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCB6axTDa+9Pnw96Iv/CHezjexvrPPHp5Wr/Pn/qDuU=;
 b=rypkbvKGX6P/B8DCrD/VR3VuOCY4aXTdSNJf+wiW38v/2XYu1ilFj6NkSjTxlTS5b3irCR0p2MO5YOpCH18VdMTvpf1w2JyD+5I6M1v0jMMSESEtyV3q5EemdX4WJ3CZ+TyJw0/s6PZ1Kp7tCIsmxsXMFy90wB1Z1snfCPXFHqA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU0PR08MB8279.eurprd08.prod.outlook.com (2603:10a6:10:40d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:48:32 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 15:48:32 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v3 0/7] drm/panthor: Add performance counters with manual sampling mode
Date: Tue,  1 Apr 2025 16:48:15 +0100
Message-Id: <cover.1743517880.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0255.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::20) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3315:EE_|DU0PR08MB8279:EE_|AM2PEPF0001C713:EE_|DB4PR08MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: 619dfac0-0a20-4738-ee45-08dd7134b0e9
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Sk13TmlxdmJoc2MwNGlxcFlUMGx2bGhKVUducUR0aHRCdjA5M1V3T21TZlY0?=
 =?utf-8?B?K1lOdEkxOEdRNzdSWXBNM1B3TG16QjhYSjJGa0hkbGhDeUJBb29oeC9ZVVp6?=
 =?utf-8?B?SjlHcURucVE5bDR5L0RpaFJLYmRtWXZocm81UFdnaUpjT1NVTzE0aVVIaFdn?=
 =?utf-8?B?SFhtdlExRXZrSVk5cmljQXVHK3Y0UmMxQ0xZNENwd1A3cEZRUnlrLzMyQUdq?=
 =?utf-8?B?TWVjWDlqN3ZPckFRTlVkZUd2Ymo2cnc5WVljOG5YRjNRVHpqVElXYnM1WlAz?=
 =?utf-8?B?aExNNEFDZDlydS9rTGFoclVkOGpNNGFkM0ZJSUhSUy96NEY1RCt2ZGg5eGtN?=
 =?utf-8?B?RlNWYzdBcW55U0RHTU9hVEcvZ1F3VFFQK2dpQkxzZG5hRVlDZHZuNlFpYVRG?=
 =?utf-8?B?VnhMN2lYU3N3OXZBM1EzRU1VTmpRTmhJWXZZRUtHTmt2akRQSjdDZlE1cThK?=
 =?utf-8?B?S2tBRTRvaENZWHV4NGd6eEp0YzdvT3NOVVN3SlRaYURUZEhSR0N6bjFkSHdN?=
 =?utf-8?B?NW53NlB3VUQ0STNXc2N0UDhzMCtvN3pJcXRTYmpEMGkwZG9aT1p6Yk43ZzJ6?=
 =?utf-8?B?NjhnL0ZqYWRoTHRYZTFvMkQ1Yk5sb0tkd3YxdEFCM2Ewb0hiQXlNK1JxOEU0?=
 =?utf-8?B?TVBxQjhSdHliaWlRVjBNSWliWm9ybXJWb0dYQVllYlI5UTkrMElmSG5xeUk0?=
 =?utf-8?B?OHoyRmIzOXh5ZVhoYmo2NVFFRGJzbFR4WlFiSXJMNS9WcWJhZWZnZnlpTnJJ?=
 =?utf-8?B?K0JySFI1aHpESGFLbzkzWGlqK21Rc0kwY0kwdDhiT3pFc1FrWmNzMlZ3ZWw2?=
 =?utf-8?B?N2QxTFpMVjdHV2o4T1dWdGhOVmpNOEl0MXJWejBIMTRLeU83bzJGZ3FIWmc3?=
 =?utf-8?B?SEcvcXpIT1A1Y25SOEdPeU5UcXdCMnU3Q1ZvaE9HVUNnMVh6NUdGSVhQVm5F?=
 =?utf-8?B?MTRjc0hGSWgvSXY1T3BXUTBIUUxwRHY1QXpwdWt0WlBVenI5aFp6azZNSW4x?=
 =?utf-8?B?dXBWOHpHRFFmVDArUzBGU0ZDaDdVaTcvM0Z6MytVUGZ6VmJJOGEvMUF1MlBq?=
 =?utf-8?B?VEpFZE5obk12eHpFQVFlSEtGamEvUFBORWNZVCtYN1p3SVZMbGlrcjROc29I?=
 =?utf-8?B?V1E2TkdiTXF5QmkyYmx4Q3ViU1B4L0ZsbnZVWEVNSEZxc0VOQ0YxWmM3MkJP?=
 =?utf-8?B?a3RHcTc4c1BvdGdjdlYxZUwxLytzbDYzUnpyVkJuZHM3ZkJ1Y0hLaVVHS0Q0?=
 =?utf-8?B?TklzRGpLRFp0K1k3QmxsQitKbkVUbzFCWnpVbC9VbndXSFpHVDhCRlJubGpW?=
 =?utf-8?B?Vkw2YlJVUER0ZzhEb1pKUTRsWExaVFZTODJ1M2hFbkVGc3hodU1HTkxFT1lk?=
 =?utf-8?B?MlVRWThReUhKR2t4RmpSQXcxRnVkWk1jMFpmODRqNGxIQko1Z1VQSnFJcGoz?=
 =?utf-8?B?Q3pFc3g4M2xGT2FXblFjNE14MHF5M1F3WlliRDJFaUV6MVVnVFlOTWtCbnlr?=
 =?utf-8?B?anhtb2xRYmdpNjErOUs4Q1hwQm9QY0xQbVFkYm9BNnhFa2xSTWpvTTBmQW14?=
 =?utf-8?B?L0VYRUtZbUVjSytNaUE3d2pLOFZVVi9mSkVKVkhhS2IzYVl6NzNPcUx1UjFm?=
 =?utf-8?B?aVh4L1pQVUpaOS9MZjRjYTVCSFkyL2VzUWNGT09UZW9VUUR3ZGFHaDlLaWdR?=
 =?utf-8?B?MWFHdzk4R1BIZTNDamM3RFFvNHZpN0w0RHRLa0IxN1JVajlCbTduRnFrSGRQ?=
 =?utf-8?B?OUNNVndnMDZiVFZFYjQ3T0NIbEl0NTlZUDFtNmhuMnp6Z080bjdIVS9zbXFC?=
 =?utf-8?B?eG5JS2NzUVZWQS9GNis0azE0ZG5xYVc3TThkTk92NXI3UVJUVCt0NlRsTy9M?=
 =?utf-8?Q?c8SUoyoETipWU?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3315.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:208:5c::16];domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	08f88fa1-1ae5-47ca-e742-08dd7134a7a5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|35042699022|36860700013|1800799024|14060799003|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djdjQ2pOZVVEazNVWGZFekZHMEhKcXNZOUpWVm1UTktDTjI2azRQN2FZaTFT?=
 =?utf-8?B?ZTlZc2JlRkRxQUJtUkZVSHVTTG5MbFNVeStHcWtWdUpUdk1tM3Nsczg1V3Ni?=
 =?utf-8?B?TlpUc0FSWnI1WWZ2bnNpOFM5MWkybU9GVVRSNit2SHo4SzZxL1IyaHcwdlpZ?=
 =?utf-8?B?eGEzMU9WODRSRXM1c0ZLcDlhd2IrTlEwU3ZXcTE3T0t6VWhaSGhwYUhiMU9B?=
 =?utf-8?B?bFNHUXZNUXltU3V2dFpPaUpscFd6cnM4d1pyVlpVaUYwYlBGY1ZUeTFWN3V5?=
 =?utf-8?B?RG12L1U2KzdkRHlUeGN3RjdzdTYzR25VZHZTWThqZGRNaHErRFhLR1N1UE12?=
 =?utf-8?B?UzFZK0ZReFNVc0xNWWl0M1FUWCswS0F1cTJQbDAvRGdBYXJYVHd3SmhQcm9Z?=
 =?utf-8?B?NkpEOUw2ZkdreTFFWGtyVDdTTnBmQktrdnVxemZDcDg2QjZiVHFGZzhyMmlF?=
 =?utf-8?B?OGdZbmNIYXMra1JLT0ZhZkNPOTJIN0hicmNUdGVLRVdaYWcxZmpoTURMTStx?=
 =?utf-8?B?Qk1Mc0lrbERzQjBhZGF0V1dCN29nWVNXYUhQRURIMC9QazVORGVZN25hTkQ5?=
 =?utf-8?B?aTcwUVdpbmx3OHBicEJ5UnZmV0VyMXVIbHJKaWxyYmpVby95Z3YzSTZEZ0wz?=
 =?utf-8?B?M1ZwL28yTjJpZlhjcUZGdnhEYWRjSERmaldZd3AvN3RqWXNOeHhIT3FJRjBQ?=
 =?utf-8?B?SEJKVDR5M0dML2UyTW1UaDZLem1QMkRxc2lCSjhGVkJrNmppeDRJRUtCVnpH?=
 =?utf-8?B?Skw3citUUnRlTHhhd1RkOFhickRXMTlYWkg2VXU4RFJtMG8wUnZ2cVdpVmNh?=
 =?utf-8?B?TFRJS2dLeGJIdmthVWdtOFJzL0lRZVZlbmVsK1lEaTRTS2htU1NTQnFYa3Np?=
 =?utf-8?B?VFNtRWxiTTd5d2ZaeDRtZitERWNHcHhxYkxCVGZyVUdjU2Ftb3NmLzNOWFJX?=
 =?utf-8?B?bzgxeEZEcTNLcVVuS1lzeWF0YWVQdzQxZXQ0bVhybWo0STNjVUcwRy9VT0Yv?=
 =?utf-8?B?ZlRHdXU3Z0ViK0cxNVZ1OEVzd1ljY1lJU0lpUzRGOFUyNWo3WVN0VzY2T1J6?=
 =?utf-8?B?T1pCOHgrV01HRjVmVVNpUm50cUF2bTMzUWlMcUQrZ2NYOEdxdXhrZFlRUkc0?=
 =?utf-8?B?SGpqK0Q5OGZzREIrZUtkbU91ZmhHeVJNVTMrd09aZ1dDcXFpVWdhR1hVOEFQ?=
 =?utf-8?B?UGpHQ1NxSDhLeG9EdVFnbWdlTUFQWnMwbzJKU01pV1lSV1ZXa0NhclRYbnEz?=
 =?utf-8?B?alFnVXFub2gwdFNGVnpQa0Rwem02VDhBd0lzRlV3MlAzTzkxd1N5ZnlLMlFX?=
 =?utf-8?B?ZVlQa3g5aXUvSXUvT2lYSndzRnI0bGpsaGI4SU43UW9xaDF3VGVKWkt0eFRa?=
 =?utf-8?B?RTVsT1AvVm5obUswNFBzZUdPS1o3aWxMdG4yZTBXWERLRnQwaWZoMVVtQit2?=
 =?utf-8?B?RlgwbG9POGJiMVd2QVNRMGdyOGpTYzkyYmlrU2lTYjMybjhWTnJMQ2tOZzNh?=
 =?utf-8?B?Qmp4UTYrbVNSZ0s5MHBuREhwMnNWVUQvME1rdUJ6MGpoMktkUWhLSDBSTXlu?=
 =?utf-8?B?RXdEdFBPazkzWHIwWFhIbE9ocThRYkZyN1hQU3JsRXU3bThKMjZTUUFOQ3Bk?=
 =?utf-8?B?Z2VSbUpWbTAzbEx2cWwrajNvc2UxSkhaQTQrQWxjVzBaVmVQam4wMHhPNVcw?=
 =?utf-8?B?RXR6Yi8yS3pFQ3lKTFVORzc0UnFZMHZYdUErWVZDRWpKZVhsbmNjUFBveFA4?=
 =?utf-8?B?NmRLZ1pUQ2kvWUhxYWQwMVdkR3lVVjZtQmRtc0p4Z2hLNzhZb1U2RTR2WU9R?=
 =?utf-8?B?Tm5ndmk1dit2VkQ5OXdXOHU0WTlMMUlrem1oUFlFZXRyeWJocUtUV1lFejdh?=
 =?utf-8?B?M0NtSjE1M1Y1eUdPTWxoSDB1N1JFK0xUelVGNHhhTGFCWW5wOTEyVnc3VjJ5?=
 =?utf-8?B?WXJSeWs1Sm1TYm1KTWxzSS8wWUIrVVUyY1Fka3NLRFlOOUFzL084QUNrZmtl?=
 =?utf-8?B?UFloYWR1aGJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(36860700013)(1800799024)(14060799003)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:48:47.6056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 619dfac0-0a20-4738-ee45-08dd7134b0e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9405

Hello,

This patch set implements initial support for performance counter
sampling in Panthor, as a follow-up for Adrián Larumbe's patch
set [1]. With this patch series, the RFC tag is dropped,
following [2]. The Mesa implementation is in progress, and
will be posted within the next week or two.

Existing performance counter workflows, such as those in game
engines, and user-space power models/governor implementations
require the ability to simultaneously obtain counter data. The
hardware and firmware interfaces support a single global
configuration, meaning the kernel must allow for the multiplexing.
It is also in the best position to supplement the counter data
with contextual information about elapsed sampling periods,
information on the power state transitions undergone during
the sampling period, and cycles elapsed on specific clocks chosen
by the integrator.

Each userspace client creates a session, providing an enable
mask of counter values it requires, a BO for a ring buffer,
and a separate BO for the insert and extract indices, along with
an eventfd to signal counter capture, all of which are kept fixed
for the lifetime of the session. When emitting a sample for a
session, counters that were not requested are stripped out,
and non-counter information needed to interpret counter values
is added to either the sample header, or the block header,
which are stored in-line with the counter values in the sample.

The proposed uAPI specifies two major sources of supplemental
information:
- coarse-grained block state transitions are provided on newer
  FW versions which support the metadata block, a FW-provided
  counter block which indicates the reason a sample was taken
  when entering or exiting a non-counting region, or when a
  shader core has powered down.
- the clock assignments to individual blocks is done by
  integrators, and in order to normalize counter values
  which count cycles, userspace must know both the clock
  cycles elapsed over the sampling period, and which
  of the clocks that particular block is associated
  with.

All of the sessions are then aggregated by the sampler, which
handles the programming of the FW interface and subsequent
handling of the samples coming from FW.

v2:
- Fixed offset issues into FW ring buffer
- Fixed sparse shader core handling
- Added pre- and post- reset handlers
- Added module param to control size of FW ring buffer
- Clarified naming on sampler functions
- Added error logging for PERF_SETUP

[1]: https://lore.kernel.org/lkml/20240305165820.585245-1-adrian.larumbe@collabora.com/T/#m67d1f89614fe35dc0560e8304d6731eb1a6942b6
[2]: https://lore.kernel.org/lkml/20241211165024.490748-1-lukas.zapolskas@arm.com/

Adrián Larumbe (1):
  drm/panthor: Implement the counter sampler and sample handling

Lukas Zapolskas (6):
  drm/panthor: Add performance counter uAPI
  drm/panthor: Add DEV_QUERY.PERF_INFO handling for Gx10
  drm/panthor: Add panthor perf initialization and termination
  drm/panthor: Introduce sampling sessions to handle userspace clients
  drm/panthor: Add suspend, resume and reset handling
  drm/panthor: Expose the panthor perf ioctls

 drivers/gpu/drm/panthor/Makefile         |    1 +
 drivers/gpu/drm/panthor/panthor_device.c |   14 +-
 drivers/gpu/drm/panthor/panthor_device.h |   11 +-
 drivers/gpu/drm/panthor/panthor_drv.c    |  150 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |    6 +
 drivers/gpu/drm/panthor/panthor_fw.h     |    9 +-
 drivers/gpu/drm/panthor/panthor_perf.c   | 1940 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   |   40 +
 include/uapi/drm/panthor_drm.h           |  546 ++++++
 9 files changed, 2712 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h

--
2.33.0.dirty

