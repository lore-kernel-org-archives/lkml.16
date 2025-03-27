Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011024.outbound.protection.outlook.com [40.107.130.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A905A79B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.24
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065860; cv=fail; b=o7OVSZK7REi1pZbx9LHjor89/fKhGgDRRFyQByOk24xWDc7I+qenIl55Jrr1G32sf4ByHjKg1A33H3WEMPkI1pwbVa5F+qHyziSxiBc1Kb/5Y9vA+GxFkz7vB/A6eSv041+RCiPrkes16EmlWNffxr+2yDTSj8hOqqKtBpImt28=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065860; c=relaxed/simple;
	bh=NfD6A+l9tNAAbBaEdeh8pn6mW5+e0qhKqjqU12i+2gg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sqxmtIaeGi8VMJfyzUcGkkrf9jP90ryCD/WqU8eAp6JjHzGadShLpByQ3O+m4yz3ARZ9IInM9YKpZfKLlM39/Yk3zI414u29IK5397zfEP1o09IU/pHwcPrdztSZwi9+Og8jA/nnkDEpyDT88PwWIOER9dUkfRYzIxDP5LLbO4I=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=N/BZcZUg; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=N/BZcZUg; arc=fail smtp.client-ip=40.107.130.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="N/BZcZUg";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="N/BZcZUg"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vV81B+1G9OXeaVkyDLqehrAKWytFASOdd2pfFtXY+sTSxNNtAblLJ5gOg4sUpY5K18Kc0vCtNxLpt4UW2f2ChzF5P68GnKLLTrMgDbI/ROthxCFVyMvv7YLMttnL8FEib/W5e6oxJ+yHt4hs1nVUR70KTqj5XtX1zJQFgAGAoOHIkGmPQQhL0yqjrGwJTFBMJzj3KTXHBRQGRX7n6ACQSd4bJPKROagXNeeGR431GAspcc40PpLMQ7TyWnU3vIdwCkjIfoOOa1FhjjYsWomxeC7r39I0huxs9MHJX/isfgJgtFkoLvpTKVmrq/uq7QBTvVb3gOyhxeVAs9BZCuU5qw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoqlolZywEM6FYMIqNOgs5PzUpIDgsPMw3ngTXKjUlo=;
 b=C/UNuBGjy2452Xaa9rZEQNivpRhtsI4rafRim4KtA8B6dBbYEy6PpBpSM2CK+S8KsXFHF/rGddH8efzA6RaYIprkUn3o/ybCiHQSb8mOfqiWqiTM+LnKQk6AXn1eOk2VHfrWVotc++exLX2IYCpb8RHFP9cFbRfQKL3xjZWlo1IY89FnWYHUoN4PbeH0s6SqHnkoRXquK63OgSBee8Hbkn+zkapfsBb623sB29NZYXKW2fu6Pd+xAGxlAET6osasXGCum1I/rs7zDyiXNgPB8S5xSVAPxgdc7VfWyGjGLK4adGDJzH2gmKnOcmCC+oGr562+J7VnlwL0kDOb8S1fcQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoqlolZywEM6FYMIqNOgs5PzUpIDgsPMw3ngTXKjUlo=;
 b=N/BZcZUg+hZXEwg1AspSoIjA90GHAVYhhvA4EIZZdZgXPtsXUlUyzKvqlLnpDY7C+ajDRQen+WABTNVvjGJifBy9zDMDz5r9bSVNqTAfAZlnPS7XSGBFVAuwtncGo4203QmIEDl24xOKaIACTzTU8nrxT1sEXDY1S7nGuaIIEkU=
Received: from DU2PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:10:234::9)
 by DB8PR08MB5404.eurprd08.prod.outlook.com (2603:10a6:10:117::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:57:33 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::56) by DU2PR04CA0034.outlook.office365.com
 (2603:10a6:10:234::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 08:57:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 08:57:32 +0000
Received: ("Tessian outbound d933a9851b56:v604"); Thu, 27 Mar 2025 08:57:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed96f20f337959e2
X-TessianGatewayMetadata: fH/LfhwbHsK334Y9j0M4bOlcAvcc7xKmM2+f9OWtcD78LU2cTBoCXewp2qVCfeBJ2KSvpFaTdsOoDo02sOeNuAU7CuAh989rL3wnFQChWBtBOYTmWcsCS20Zjs1OAQNM4IX77Rf4D1VhCu1C+HAhUCVCtvBvxB9BTksEw6RHums=
X-CR-MTA-TID: 64aa7808
Received: from La4adbf3633d0.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 83D52548-DEC9-4CC8-88CC-CDBD307CC691.1;
	Thu, 27 Mar 2025 08:57:23 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id La4adbf3633d0.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 27 Mar 2025 08:57:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3hyHHJlDwaCxiFnxJmS7H2YYU5g6YoRuky0QScGorXHPKL7aBIRfvVCYpQ0LmsoVcVxzByktZNqgOqJHz3GEWnEUX8wCkfOX6hkFOdbZ90qpgbXTw7/OpQTgm9yVh0WG1rMgLrKO7o5lTQ17rUzVLHIh4moCU3VdqVEpAhn/ACfuOLV/ELhSQZ6vawyGZoFeLwevVITGtiDNmjOOgQg7UZ3X6rUF6pIrqXlIg8n9Dz45rnLbzoKpHR+0oAM/eDxKWkeS3YDzqWobDxXF4EtmPVAywaPr0w0q1lnFCt0yyExrs0dEIhgIHNxf8IQOFS/h/oznQTlMXMpMA6015T7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoqlolZywEM6FYMIqNOgs5PzUpIDgsPMw3ngTXKjUlo=;
 b=xrR8R0Z2y3Azpu0wzFAxPhbq8JnjiO4LUFiEBnQc3syV2iXEhyBPANmN8fN3bGAsl++q6a/0Lg9kEjsucORfLH8v8AcX5wwP5lhFgBjbaiI9qnKMM5K1eNqTO7a6YhqwELyFNQzHIUjrt6UI6Vuuh7FJoZR+NT++/ir8KnUQFPpOEhN6P96tV3rV0pbWs1Jh3ik+qDRTDhK4MZ5KyLmi4q4kQYBZKin29sj5qmYrBlF/Fp6nB7ZSrzx4R4gR8MTIZYufNo6qisQyGxcPm1LNWwKacdZv3IGUM1vYRLnMqrPTnl2lscgeclFfuHR/e7dxKwpF6LJQCFJgojnGi/0Exw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoqlolZywEM6FYMIqNOgs5PzUpIDgsPMw3ngTXKjUlo=;
 b=N/BZcZUg+hZXEwg1AspSoIjA90GHAVYhhvA4EIZZdZgXPtsXUlUyzKvqlLnpDY7C+ajDRQen+WABTNVvjGJifBy9zDMDz5r9bSVNqTAfAZlnPS7XSGBFVAuwtncGo4203QmIEDl24xOKaIACTzTU8nrxT1sEXDY1S7nGuaIIEkU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by VI0PR08MB11084.eurprd08.prod.outlook.com (2603:10a6:800:256::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 27 Mar
 2025 08:57:19 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 08:57:19 +0000
Message-ID: <967812d2-de2f-451d-93ff-8c9dc0ee10d0@arm.com>
Date: Thu, 27 Mar 2025 08:57:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 7/8] drm/panthor: Add suspend/resume handling for the
 performance counters
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-8-lukas.zapolskas@arm.com>
 <vyjob57q2najc3ybjlgje6s2q26cfpicbz4kskcwpxirovdeht@7ljrdy7udmag>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <vyjob57q2najc3ybjlgje6s2q26cfpicbz4kskcwpxirovdeht@7ljrdy7udmag>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0216.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::23) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3315:EE_|VI0PR08MB11084:EE_|DB5PEPF00014B93:EE_|DB8PR08MB5404:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e3aba49-ffa5-4f13-d127-08dd6d0d6981
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dnNRSjNsR2VzTFRjUmoyNktmWGZXbi9TQmNDRmZsN2t1eDV1bjB2emdSZHMx?=
 =?utf-8?B?ZGN2SWhDVExWeXJsVURCSnR4TFJ3Z3pRU0xDS3VKTENJaFFBSTRTaFhhVlh2?=
 =?utf-8?B?Y3U0aUJmMHhKTHJnUTR1aVAwVjJGU0ZKTE9UNGF3UFVOV21YY21mdDlsdjlV?=
 =?utf-8?B?bGNCQmxXMTVPQkRRZDNwYXpHdVpKcVhuL1JOOEEzNnJXWEtaOUxVVDFPWnVU?=
 =?utf-8?B?WXk2VlpRNlQ5NlluRm9WeFhWTDk0bm0zVUNXRk5rTE9meDBWZ0MzMk81ajZT?=
 =?utf-8?B?bCs5S3BmdzJQY3c5SjFrMkNrTU9NMWltRVV6QlhvNUhXdlVNMjJYc1Q1dUVp?=
 =?utf-8?B?eVFJUDZoQnhNSW5GRmZ1UHFlRWd1VGJZN0hXVTZJN0JOK1RtSk5yMm9iRFhN?=
 =?utf-8?B?ZFMxNUp0eTZTZmNXbGhTcEkyZ0k5eXYrZWo1TGdWWjhVNHBRaWJtQWQ4cHRL?=
 =?utf-8?B?YkUzNkQ1azlXMjVPV3JIdFZVK2hNYzJYY1JMY280UG1KamM1bTdxbHFmbjFS?=
 =?utf-8?B?QkVKUE9mTzA2d0lpTUtUNUkyN3pjdk80MmovVGdjOEdHM1FBK0RqamFhTEJD?=
 =?utf-8?B?QnBWOTl5bG1GQis2Y0VNbzFmd1lLUHNqazdoWGhiMXNVZDQ1RnNrSEZLQWNB?=
 =?utf-8?B?TG52R1N4ZHVJSk5VemZ6N2o1U0J5VDFOT1FSNUI5WDI5Q3gydjMwWkd3ZnBU?=
 =?utf-8?B?TWdNN0ZSWmJLTm04VEF5K3RrK0JQb2VYT29KTTNLS3RnOHFhcmJ4Z3VPV0hB?=
 =?utf-8?B?QzRJaHJRMndZRVFWN2huMlI4U3dqenFrNUVXZ2tYdGhRQ3Fhb0RhNXU2QkRk?=
 =?utf-8?B?WFVkZXl2aXBhaG40L3ZKcHJabUY1TWNKOEV0TTMwbkpQMjJMd0dOSjJhaWhu?=
 =?utf-8?B?T29BQ1NBWjJzM3J0ZFl6djk5YXJEdG1NZm1NWis1RElvRkR5cWh4NXRENXQy?=
 =?utf-8?B?S3prSDYwV0VRK0l0b2hveVlVbVVvTHFzSGVaaGNOWnNZUkJJYkx5TGIyM0ZP?=
 =?utf-8?B?S095aTQzb2tlNDJRc0FFajQwRnlQS2J0SGFaeG9xNStGUEhXaWVZVStFckNj?=
 =?utf-8?B?MVVpcGw0Z1F3dHJsNEV0YXVzallETUcwYjBBN1NYRUtGbmtDdkxwWEtVSHZa?=
 =?utf-8?B?RXZiRnZqem8yRXJtWHVGN3hDa0FWSlFUcW02b21tZVFneXpCS3N0bjZlWldG?=
 =?utf-8?B?TXNKWTg5bDIyQnRsdnpjMWZ5L1FMZFNtMThuSGZURFRIM2VubEwzRW81UVBw?=
 =?utf-8?B?N0tWQW9qdTFrQmQySkpUa1JVLzNnb2k1M1FOVkRMTnZzV3V4SkRlTmJXWmVi?=
 =?utf-8?B?empEMHZJZDBNdkpBNGhWaDFJaHFjS200cTdhUHdxWC81Zys1Vm9JT2V6bzFQ?=
 =?utf-8?B?SFEwWjRxR2hZUUpaVmVzSUo2cGtpcHNySWI1ZnpLNXBhYmE0Y1U3bEVsMFUw?=
 =?utf-8?B?dUNKSEo2RUlFT0Y1VGFUdytWYm94dGdNTlVodGFRSndCcjFDWWhmVUcxRDZR?=
 =?utf-8?B?dDB2c21EcWQxNkYvRzRRcUFPQ3V1Q0p4TTNTbmJucTlRNFd2Q1FIQi9ESklH?=
 =?utf-8?B?WVlmd3VmRDNsSU9XUnRqUXpvcFNPMDVYZTRkN0N3bnFyS21SM0JQU09VbXFP?=
 =?utf-8?B?NU1kRk5oaXJHMjg2NlZrK1d5UTg2UFhsMDBHWW9Td2ZYN3UyNHlqZnhnN1lS?=
 =?utf-8?B?ZlhEQUVaOGU4QXdjc05aU0dQZmpHQ1BiY0dLYzh6TjdUWE9mVTZKSk12ZE03?=
 =?utf-8?B?ejB1SHl2NTZZck5pVTJZWHdwcGE1MnZqZXY4WE5teDRVbzBKMlNnY3p0Tkh4?=
 =?utf-8?B?cXo2Rk4vTkRDTDdrM3ZZZ3lGRHpQcURsQVFNSXp0ejRQb1BZU3dySGlKYVdW?=
 =?utf-8?Q?kmNo3Ook0QER5?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3315.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11084
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:208:5c::16];domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	365fe632-be5d-4ceb-acdf-08dd6d0d6158
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|82310400026|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmkzUkE3cUE2TElvQTF2Q2MzQndlZk9TTENkY2haSC83dGErdGFrSS9ra0dG?=
 =?utf-8?B?YWFMd2pralcyelZ6SEcyS0RyaFNleHpsTm5yTVJEeC9sdExXTmNneVk4OFdV?=
 =?utf-8?B?RmlTRHk3RjRkd1h1S21UdjNRQmZhVnNkUFhlRGN1SkkzWk4yUkNVZXlJZ3dn?=
 =?utf-8?B?QmdFZUlPUEVuYzVUOTNYWHZBNFF0VkNpUVBsTmtRanNPSHhTaHhWK1daRUpV?=
 =?utf-8?B?cjZHYXVYd0wrS1Rrb2VrT3B4Nkp0TXI0V1VxM1I5MU9lcHVqUjlxaXR5aFVl?=
 =?utf-8?B?UzBLNXNSMUdrbTZRdHpTNE10Z3AvZ05ySHhwUkJEWlM1clZZV3NDa0RpdWNu?=
 =?utf-8?B?S1NDOWorL1pKdFBONklFR1ZLL2t0VkkySGd4d1pFR1ByNWc4NmNwOXc0aVRj?=
 =?utf-8?B?STBjczBSNFhEY29ZcGR4UW9hTTNMaDRrbXIvNEVDaytrem5qb2NxdTRpK1N3?=
 =?utf-8?B?QTlXNnBrS2NlMnlIbk9uSDV4V2tndzlpSWQvUWJqRlh4ZXpEVzRXUFI2SkV6?=
 =?utf-8?B?Vk04R1AwM2Mwb2tnM1NMbW5tRTdPL2IzUlplb1lnR3ZzUUgwUmNXazFaeGx4?=
 =?utf-8?B?eWk5bHpWeFlYOEZTcktzaU1YdHRIcVU2S3V2OXl6Vk9WVzArbUQyQjcxbHlE?=
 =?utf-8?B?TlJFdWZzYzZYOXYzd2V0WUVodGk5dzhYWUVsaVRLaXlUdkc0L3FMcnJxcmMr?=
 =?utf-8?B?QVVUMHlZTDBlcWZDRzdrTEx2TDltbU12bFVSUXdKbmc5cDBjM1Vhblp3aDla?=
 =?utf-8?B?aCsxakFLMGVyT0RWRzBodmxnNXVueEs5YlV3c1BXbDVucWJTR2EyOFdRbXNI?=
 =?utf-8?B?QjRrSDFIQ2xTdjRIc0h3Q1dRQlNieEo5c21QVlQ0UERLR3pseGh3ZjJPS1Qr?=
 =?utf-8?B?YXNlaERMd1VrWjV5QkdGMVduVEVCUFhnOUh3Tmo3bFVxNDZIT29JZElPMTVs?=
 =?utf-8?B?SjM1MlMza2RYOTUzbzlPdHNYMEpjUHhPQlJSb0VRWWsrS1o5cHBhQXFvajdw?=
 =?utf-8?B?WjZOZ3VBSjZzK2hBdHowbm5KUjBVeEd5T3dDZEZTSlhtTWx6UXZjM1VoazYr?=
 =?utf-8?B?eEtka0VyZjlZaVJUQi8xb2RaV2RoeG5EUWtVeHk1V0xDczc0OFpMNTUvUnYr?=
 =?utf-8?B?QjdsbXZDZU9YVFowdDBMVExwazdhYUpzVDluYlFMSW5RaWlDM2JlZm82ajVM?=
 =?utf-8?B?NDdvczRYdWhCS1VKVWsxekVaeHNQQUlFMHlVM2xIakJDeFllTWR0SFY0eEFX?=
 =?utf-8?B?eGVCZVNFTkI0dWwrckFpbEpqcmlqSzl3b2lwdVdhWDhwN3pKamNSNFc3M1c4?=
 =?utf-8?B?THVJRFdzcExZY0dPR3E0U2xRcUl0OC85ZlFidENqTEhod2RZKzNjSURMeFFY?=
 =?utf-8?B?VE9NMnc1RjY4NkVkTlIwYlFmK0RLS1pwRGVpQmw1R1ByMXY4aVJRU1U0Q1VX?=
 =?utf-8?B?TDVQL0tETjFKcU9Fa01RZjQ1dzl1SXpOVFFROFdsQm55bms1WXYxVFpPd2tP?=
 =?utf-8?B?SUc4T3lxUmFIeHFWNng4aE9MenMxM0pIMmk1U1pOaXptcEpnLy81b2hwZVo5?=
 =?utf-8?B?b2FIUFNrQlVnNnJTcEZCZ2dVa0lLbmJqVy9XOTlyRitydW1vZGFoS2RFZEdZ?=
 =?utf-8?B?a251UlA3bE8wdkZMbHRINjFEM24wMFhtUk8ycDVjYm4zUDlHY0orS1R4UkF2?=
 =?utf-8?B?MXhyMDY1WUJkYll4Uk0yR2lVQ0dSK1JKV1pHWHo0TGduNTQwS1dXVXVieUVX?=
 =?utf-8?B?aTg3VVRYeXJEMjZBQUgyM3J1VTdIR2V0SVZGWDlsL0gybTdzVFhIcXd0QUNY?=
 =?utf-8?B?a1pGcjlMUDgvMTRIQWNHZ05BMWl2eFFzTGl6WEhyUjdCM1RUY0dSdS9abDhq?=
 =?utf-8?B?UVliV2JNQWtRNnRRd0N2ZE1QRFczYnJrNFhLKzQwRVdESmJSb1RjbDllOXJw?=
 =?utf-8?B?WlU3bDd1YlJRL0xKVFJtakg4YkpOcmFWY1YxRWNxV3VFYjI0TkhUaGVxY1dW?=
 =?utf-8?Q?8wAC4k17Yam0UTqIjZg2G6x5EOddOg=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(35042699022)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:57:32.8596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3aba49-ffa5-4f13-d127-08dd6d0d6981
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5404



On 27/01/2025 20:06, Adrián Larumbe wrote:
> On 11.12.2024 16:50, Lukas Zapolskas wrote:
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_device.c |  3 +
>>   drivers/gpu/drm/panthor/panthor_perf.c   | 86 ++++++++++++++++++++++++
>>   drivers/gpu/drm/panthor/panthor_perf.h   |  2 +
>>   3 files changed, 91 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> index 1a81a436143b..69536fbdb5ef 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.c
>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> @@ -475,6 +475,7 @@ int panthor_device_resume(struct device *dev)
>>   		ret = drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
>>   		if (!ret) {
>>   			panthor_sched_resume(ptdev);
>> +			panthor_perf_resume(ptdev);
>>   		} else {
>>   			panthor_mmu_suspend(ptdev);
>>   			panthor_gpu_suspend(ptdev);
>> @@ -543,6 +544,7 @@ int panthor_device_suspend(struct device *dev)
>>   	    drm_dev_enter(&ptdev->base, &cookie)) {
>>   		cancel_work_sync(&ptdev->reset.work);
>>   
>> +		panthor_perf_suspend(ptdev);
>>   		/* We prepare everything as if we were resetting the GPU.
>>   		 * The end of the reset will happen in the resume path though.
>>   		 */
>> @@ -561,6 +563,7 @@ int panthor_device_suspend(struct device *dev)
>>   			panthor_mmu_resume(ptdev);
>>   			drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
>>   			panthor_sched_resume(ptdev);
>> +			panthor_perf_resume(ptdev);
>>   			drm_dev_exit(cookie);
>>   		}
>>   
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
>> index d62d97c448da..727e66074eab 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.c
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
>> @@ -433,6 +433,17 @@ static void panthor_perf_em_zero(struct panthor_perf_enable_masks *em)
>>   		bitmap_zero(em->mask[i], PANTHOR_PERF_EM_BITS);
>>   }
>>   
>> +static bool panthor_perf_em_empty(const struct panthor_perf_enable_masks *const em)
>> +{
>> +	bool empty = true;
>> +	size_t i = 0;
>> +
>> +	for (i = DRM_PANTHOR_PERF_BLOCK_FW; i <= DRM_PANTHOR_PERF_BLOCK_LAST; i++)
>> +		empty &= bitmap_empty(em->mask[i], PANTHOR_PERF_EM_BITS);
>> +
>> +	return empty;
>> +}
>> +
>>   static void panthor_perf_destroy_em_kref(struct kref *em_kref)
>>   {
>>   	struct panthor_perf_enable_masks *em = container_of(em_kref, typeof(*em), refs);
>> @@ -1652,6 +1663,81 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
>>   	}
>>   }
>>   
>> +static int panthor_perf_sampler_resume(struct panthor_perf_sampler *sampler)
>> +{
>> +	int ret;
>> +
>> +	if (!atomic_read(&sampler->enabled_clients))
>> +		return 0;
>> +
>> +	if (!panthor_perf_em_empty(sampler->em)) {
>> +		guard(mutex)(&sampler->config_lock);
>> +		panthor_perf_fw_write_em(sampler, sampler->em);
>> +	}
> 
> Aren't panthor_perf_em_empty(sampler->em) and !atomic_read(&sampler->enabled_clients) functionally equivalent?
> 
Hadn't thought about that before, but it may be the case. It
makes a slight difference for adding a new session to the
sampler, where we need to keep track of both the
previous and the current mask, as well as removing a session,
where the order of operation becomes a little awkward if
we use them to mean the same thing.

The sampler's enable mask is seen as somewhat disposable
in the case of removing a session, since we cannot just
remove the counters requested by that session and be done
with it. This would lead to counters that are requested
by other sessions being deleted. So we zero out the
enable mask and then recreate it using all of the enable
masks from the other sessions.

>> +
>> +	ret = panthor_perf_fw_start_sampling(sampler->ptdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int panthor_perf_sampler_suspend(struct panthor_perf_sampler *sampler)
>> +{
>> +	int ret;
>> +
>> +	if (!atomic_read(&sampler->enabled_clients))
>> +		return 0;
>> +
>> +	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * panthor_perf_suspend - Prepare the performance counter subsystem for system suspend.
>> + * @ptdev: Panthor device.
>> + *
>> + * Indicate to the performance counters that the system is suspending.
>> + *
>> + * This function must not be used to handle MCU power state transitions: just before MCU goes
>> + * from on to any inactive state, an automatic sample will be performed by the firmware, and
>> + * the performance counter firmware state will be restored on warm boot.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_suspend(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_perf *perf = ptdev->perf;
>> +
>> +	if (!perf)
>> +		return 0;
>> +
>> +	return panthor_perf_sampler_suspend(&perf->sampler);
>> +}
>> +
>> +/**
>> + * panthor_perf_resume - Resume the performance counter subsystem after system resumption.
>> + * @ptdev: Panthor device.
>> + *
>> + * Indicate to the performance counters that the system has resumed. This must not be used
>> + * to handle MCU state transitions, for the same reasons as detailed in the kerneldoc for
>> + * @panthor_perf_suspend.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_resume(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_perf *perf = ptdev->perf;
>> +
>> +	if (!perf)
>> +		return 0;
>> +
>> +	return panthor_perf_sampler_resume(&perf->sampler);
>> +}
>> +
>>   /**
>>    * panthor_perf_unplug - Terminate the performance counter subsystem.
>>    * @ptdev: Panthor device.
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
>> index 3485e4a55e15..a22a511a0809 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.h
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
>> @@ -16,6 +16,8 @@ struct panthor_perf;
>>   void panthor_perf_info_init(struct panthor_device *ptdev);
>>   
>>   int panthor_perf_init(struct panthor_device *ptdev);
>> +int panthor_perf_suspend(struct panthor_device *ptdev);
>> +int panthor_perf_resume(struct panthor_device *ptdev);
>>   void panthor_perf_unplug(struct panthor_device *ptdev);
>>   
>>   int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
>> -- 
>> 2.25.1
> 
> Adrian Larumbe

