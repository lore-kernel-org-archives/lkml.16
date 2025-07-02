Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08AF19AD89
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455227; cv=fail; b=FSFcKBg4VtuyQXnSHJ1mTDctKh7dvep4hmHA6IHQU1Q3ZBAancikVuwzl4iKSxdUZN0cPx2zF7a+OvVPgaTksoGSkjiKyMFE++N+kVeoV/vH6Xpfj99wICIWIprkxSEaay4Z2pGIAsk68h/rTGdf5QgnOV4/iMebJ8CbQUmqrsc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455227; c=relaxed/simple;
	bh=uogPYiXOdC5/fPDw2EdMYx4E0gvltHl1MGUMSRJmpWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Tm9etQZTKqTR2z78bslOJTERJ7Gat1n0hm8bbDbymCCDa9RfNDmrpXBKRhwloDlr2uXXyvDIMNjmBH9VYUFr68U1RzZRtx036yVAMamLjTqjqdjtVOAIMuec6b6JvW24SUN96RHEIWAkwQQzeZIXZutPsm8uufRR5TUQdWKowl8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=e2sshi5Y; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=e2sshi5Y; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="e2sshi5Y";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="e2sshi5Y"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UaebgT7q3DfGcRrIeFUS5EIF8SrhpbGlmj+p67LzdT0bfnoqXAEwwiiX/1+8u2eOwSSwXM0dO5qjqBMY+x9yfCh5LU2v6SIZl7QGREA9XCMKvMflixTE3PcktBuV0aN+JgwqdFn+qLNYRDSBa6CpkzG7T7OMV4MF93NQYSvaCcP+pVCdsJygB0FKk9vaIKnqnzx4nMzUR3m52yPZFFhe3dNydbzprPUZ3ugCNKwnTL4CVakw9KP5SUZcOv/KjFhjLQNBjz7F609WHDpouw24nz9ZmayJ6L0KxocBKjPpCCBIPiWo5gUgXUj+Zme8pL3dqarNxTNvTFPUz8V0NHiAeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQSXtEFQB1hKG9LmJc8ekc9WmzK8J08XAwaTPIdkKqo=;
 b=AifUudLMzVMtIp6l/m1FLm0T5ctWSbvO4IRs1H4EkReBFjgATY2ryevil7m9Lsa1KobA7U1jdhsO4jf/4OtME140iL5Fq66KLPG4PARUJ1l4aiz8KC0xreyNejgXDYfWtxNW1gBueYg30C1leJf6jHkx99R+8PUXEG50h/pt4QMY4gR39wmfcreZzON1n3wxTMTSq3QAV26YF2VfDyQvb30alpUCeT3AsZxy8WcIeIP5NjSut9vOM79+4WDbZ3Q0VF8eA6ze49uyaPlFNb4cLwqC+DdmgpiJ9pSoSRCfZwbCi99S4s5gEJ+nNLUm7jmpk7mJnhkpY92aVXhW360sfQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQSXtEFQB1hKG9LmJc8ekc9WmzK8J08XAwaTPIdkKqo=;
 b=e2sshi5YiGl6vkPDMGrQ19KJjfdsBtLUOoiRcOBfVwOfe1vTvD8KMup89ceLMjUZWrfOngTLzR2DrTDlyMALRZyMMKgvDsRRqXYsQj+JX1DW16WrgoIXQS0l7+wAeBqdPtkSsO9XpvXQM6jigkAHoc9yqvFshChmeHss66bISM8=
Received: from AS4P195CA0002.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::6)
 by DU0PR08MB9824.eurprd08.prod.outlook.com (2603:10a6:10:443::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Wed, 2 Jul
 2025 11:20:18 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::54) by AS4P195CA0002.outlook.office365.com
 (2603:10a6:20b:5e2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.32 via Frontend Transport; Wed,
 2 Jul 2025 11:20:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.1 via
 Frontend Transport; Wed, 2 Jul 2025 11:20:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFyNV/4Ce3bcfUDYh1Mf/eYmWr50/ottzgV+Qo6xW7Jh+sZvJ6hi0wv9up4dQdEkbYCceg9KSxjO0z8iVjvrWMgwfWBSFJFFKSyLmRmKeRyR9OiXpRdsLtOYYJtsvW5xAW/OFC5nP9zPehN/gFzk3mrhS2qPXmQ58pvh5ZAycs2Fm5TIyvz5WkAkgKi3pMVzkve10yX0O3c/LTYYhCK6/TCsUXYPAGUB6DXfVpp8eGpfmT4/DTLoe/hTjuqxP+nOMHq+owk2n4bqO6QE8NV/IGHk/xX77AhoveqAVAusepAFvYqsP52UzZXhIsYL1vqKb50MdcmkmolzUeYuFfo8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQSXtEFQB1hKG9LmJc8ekc9WmzK8J08XAwaTPIdkKqo=;
 b=rcQ6QtecEqZTGRmwslk242CfSuZuMljr18oElqaQSjUuTu4j8znbdtdZDskHboUMSEujCcvBSzvRPz3mpyQ5fErxx3hNl1WD8Y2scuU1Y+7lLgRSX2gne0E79AJAe3MUC374HV8dCRKn15cBq7DBQB9Egd8Gdj9S2ypxportqf0qnYUUEEDnQs3lJYDRT0M8ADO3Grp1hkxPPZSAWu9fX4ma8cxaBg+9j0RUb8Mu0+ypNqUkicSWSAQPvBrmWjTtZWXBQA8L/Wpk0rFcHZum0ajfrGC+oi0itaj1hDn2fGEwq/4af925o1WRGLREvEiAQT5+MKr5x7c9jWm3r5TMuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQSXtEFQB1hKG9LmJc8ekc9WmzK8J08XAwaTPIdkKqo=;
 b=e2sshi5YiGl6vkPDMGrQ19KJjfdsBtLUOoiRcOBfVwOfe1vTvD8KMup89ceLMjUZWrfOngTLzR2DrTDlyMALRZyMMKgvDsRRqXYsQj+JX1DW16WrgoIXQS0l7+wAeBqdPtkSsO9XpvXQM6jigkAHoc9yqvFshChmeHss66bISM8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PR3PR08MB5563.eurprd08.prod.outlook.com
 (2603:10a6:102:89::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 11:19:44 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 11:19:44 +0000
Date: Wed, 2 Jul 2025 12:19:42 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/28] coresight: etm4x: Remove the
 state_needs_restore flag
Message-ID: <aGUVzn334CJ8WkQR@e129823.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-8-23ebb864fcc1@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-8-23ebb864fcc1@arm.com>
X-ClientProxiedBy: LO4P123CA0414.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::23) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|PR3PR08MB5563:EE_|AM4PEPF00025F96:EE_|DU0PR08MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: 430106a5-ac95-4b34-21dc-08ddb95a6d0f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?6vcVoQTh9qhzu8XZZ4lMYREDgCoIRjlcwmklGRzsXgkdnCWCsu913ueCMNfr?=
 =?us-ascii?Q?JX87tkRoMITRfMlHrJxnsnVBIMc2om5g0GO25mjHEQ0quVxz5BNW3Tu6xrwk?=
 =?us-ascii?Q?v/p6S4OtxueDfbHkna2kaAN1PTJ0GrHB3ygLJk+IY0HiHlTbiW8C46V1a2I0?=
 =?us-ascii?Q?dUWuAivjV1dQjxcdTty6YIoulWUFejOTcEKEy6DD94ZXqDHg0X+MfqXDdU0N?=
 =?us-ascii?Q?vMb6v5ZwPWPfmaY/WyfmwmrAU3Y3vc6QDTJL6uzczkTWTt2f9v7dmtLGivwJ?=
 =?us-ascii?Q?pFUQZ03iEMT2XwWZ4fEHszppbbDY6NAaykXTUEINAlU5Hw/efSwlI1Rj9G2C?=
 =?us-ascii?Q?ft7HfyDGipQqKIzRbkSDuYJNzuE8+kzQGfep+xeQHrqSNMfWxAKBJabpXq1d?=
 =?us-ascii?Q?5rgEzLCbqkQLL5Ue8QxrUfCLemdpLx6xLHTEYDE2opy/L/9Pn/NHyhN2Y/MF?=
 =?us-ascii?Q?2t8DQ45x+iADMCWIu6NIxlGzzfGJ7Q+Ls+8kCGvZ1ChEYhEkljkNHZGz46/W?=
 =?us-ascii?Q?Rh8ayEOLGTfk6lwctUWI/eSZQg5Lqbyf4N6kKdeauHjashwrfByHwqLjG5W/?=
 =?us-ascii?Q?/ggMp9uk7wzjlcEt63HhN8nZ+WpTuogaSrDfVFsbltnyPUOw+sG/XtzG8Kfv?=
 =?us-ascii?Q?CYRCDj+e46CmqW6pVS+Lo3RaKksOqn9clbuDow7Bem0e//QpkJ0003dfD/Ru?=
 =?us-ascii?Q?Tq3s4X7aIKwWlIeEDi6aSUXFAnWXsfMLzfA43BiPu0hfUtXRpC6qPULcD2Wp?=
 =?us-ascii?Q?UYD5tmxcK3g+dbyrVtMUgydqmXSi1BXNfGxNsF49FqeUkf+vcxhBp9wAEzMu?=
 =?us-ascii?Q?h5iJAyGBpoITAOEvHzGS77xUm2NBq3bNXJqtMheChnEkWzDbPWy7CO5wGuxo?=
 =?us-ascii?Q?fY0wpoFyh3UxYPTRqXhRLfucKHmmqWfSkhdmjFm1C2UaC4d7sqEOznftaxPf?=
 =?us-ascii?Q?36UOaxlZUBDHy4VAgOcHqwcSPxTwWESY62ZQpB3B0vRwoeXeJil9nqDkBbON?=
 =?us-ascii?Q?cdJE1xWpiNJ2sLmCsPDBdmAz4K6tnnMQ/BgNnCB0Z5tyR3NugQZs8ifTXtjc?=
 =?us-ascii?Q?fkOUQ3uyua9hwpZWTgmxjTpb3KLsDRNz30uu3A9hDesNnC5cHsrvKNQbqr7L?=
 =?us-ascii?Q?yVL4eRaJifHn6zl2dljgUhJi67lwmTmzOiJP5g6bkRsaGiriY5729/Ar2UVA?=
 =?us-ascii?Q?jM0qiE/0ROrc81pCn7aOvfECJs2TvetjhZ4vkjtb5N3xHQRaNXxVy0eMQs0L?=
 =?us-ascii?Q?jVri7GGJHwv3o2Tbd5FgUs30znLR61vwg1P3Dewdm3vPg3jCofED2LYAxT8U?=
 =?us-ascii?Q?AvitOSWdwVdDqv3wDWzvXilaUVy5Ol7b0w/8ZSYoKQ28Hi1Eo7vpWOaRRc5i?=
 =?us-ascii?Q?pElDGSDSmJ2sWso31ugxSN7UrWxvEgYKRd4MSV8JyFDwS3ddaksz/DBddTvU?=
 =?us-ascii?Q?RKzD/KMzQDI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5563
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	402ffad6-dd88-4b41-6d71-08ddb95a58ef
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|14060799003|376014|7416014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sUBdyh1Z9dRncgq30xp1q0yKEs09f0rYb+vpsiNv1v9gk+T+75CFgOkrrnxe?=
 =?us-ascii?Q?uYeOPLx49CRz+7sUw9kjy9IVYCiaUNfEcF/pgCBTULG6PkPy+LDs9MNTRRFA?=
 =?us-ascii?Q?4HKd5E/akcWiPZuwOzfG7aN7SEh/0nkMxA083uHEH9bbZD+yN/vlzhZWhO3s?=
 =?us-ascii?Q?J/YCCli6uqOjnNn8KkWnzF2RlNvDLOU16NOcliG474K3Nd1zs4loinrkCuxC?=
 =?us-ascii?Q?QwZA59qdHE32Koma2wdnH9oSIkhFwCT8a3I/Vmvtchl2dxCnA/0vzdQFietq?=
 =?us-ascii?Q?0ZJe3u9OOnI+aw8JSRViixJNhZVH/iLHk8ghT/QdMHg3gZexxiuk7nvn9Bms?=
 =?us-ascii?Q?WXYei00BAthsLrPJ0unaN/rKX/pqJzrcT0FjIG3NZ3wSC9I/vn1xJkrQwC3T?=
 =?us-ascii?Q?Plv+CyRTJ00oE7ju+hij+GtImxqCSq81ch8p4dWOIHBtuy6bmXjve67qUSLx?=
 =?us-ascii?Q?rlCU72FW8KC573LK/rvsXertebMZsIJk8JAqx1aRvKZNyyvTFVaoqH2UdpU1?=
 =?us-ascii?Q?SHVok/P8FyKx+u0k1+wwM0TC/VNFr5otVZ6sfKVDwBFJ6NjEr5xvF+x1UPOX?=
 =?us-ascii?Q?zfiuWgmIQdz51xxpKAJoPC54fPlKISPNi/PhQWjYN1d3Qnm7wrItVUM4SzTF?=
 =?us-ascii?Q?G1yud9PxuzvPPwmLIXuVKZ9kYUCbWPLPlDSTrE1i9kZ5VJTrPrSa2My1vNBW?=
 =?us-ascii?Q?z7UfjbftHygXf3kKon1ni6OGlh7WgqRM43U1Wl+Ldp+V2TX3YscIhLhtHjeD?=
 =?us-ascii?Q?n4QDMTcwfk98um2bGUQTjx3TaL3YHAqpe06R/zUrQYwvw6ZIm6UZhiI8xHvk?=
 =?us-ascii?Q?IBxeGCW3VWaR/GgffoVcF1A6CHZVkV/uqUvvZ0Ykt6U3TFh8P4Qqd2QeDF5v?=
 =?us-ascii?Q?gzlyWPP3Pw6e4flSNl2lXJODJv2ieQZuH3+/XVf432dDe52Taag9sNwI97za?=
 =?us-ascii?Q?RJt7Wv9ittwC9VmsI/jju0qBmPgW07QFBtvYnAtR6KBJE/sOeDguDZMBIl6F?=
 =?us-ascii?Q?4/VoUdUuc7vxCPAFHZTljsghFJYMu+krPzSN6hSxX9T+pSlSoOZSqQnAkId7?=
 =?us-ascii?Q?Es6ly/zzS6LvmrB4DpwCVfvSSP/ZhUmjUf66vB6ZAyNQQ8toFeiMSf+RZNH5?=
 =?us-ascii?Q?VSXgrRMA4piXYeWNbtVdx1THT5rsphuF09DJ/6oLldAT+hlJr9HnWXVvWb/d?=
 =?us-ascii?Q?ey/nvaSZbGHzpd8dRd7DNDW8bneJN8jnHmggiPvJQD52nadGzttx9pTjW6oI?=
 =?us-ascii?Q?+0p5BglAEGlrXpR0rZkB7DmaH3/kVl8NHgzV2jagsa03NfbhL7nFtHNtYu3F?=
 =?us-ascii?Q?tVRE3quDyL51g4TPGt2gygE0qTp6sH2gbUoa9XVY1yPEY+vg/bV4tHQ6N622?=
 =?us-ascii?Q?vp/yxK/gF0qnepl2gddSaQxxt8krPrk9tNJJAw3QZdmpGQcklESSo4tu3M4m?=
 =?us-ascii?Q?ocFH3BIhkoozbUXwgsHb1UsFBEOQMO3GJqHQeG29+nYTGspWZFUEUum8reD2?=
 =?us-ascii?Q?I/SBZS8M6zUzhvb+x6W1H1ni589tyhE2UlyV?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(14060799003)(376014)(7416014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:20:18.3332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 430106a5-ac95-4b34-21dc-08ddb95a6d0f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9824

LGTM.
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

> When the restore flow is invoked, it means no error occurred during the
> save phase. Otherwise, if any errors happened while saving the context,
> the function would return an error and abort the suspend sequence.
>
> Therefore, the state_needs_restore flag is unnecessary. The save and
> restore functions are changed to check two conditions:
>
> 1) The global flag pm_save_enable is SELF_HOSTED mode;
> 2) The device is in active mode (non DISABLED).
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 14 ++++++++------
>  drivers/hwtracing/coresight/coresight-etm4x.h      |  2 --
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 6cd76a2527cf11752963a7cb1b3b0e9a8be241f0..1faf8614366f38eea4909152558fe8e69730bde4 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1981,8 +1981,6 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  		goto out;
>  	}
>
> -	drvdata->state_needs_restore = true;
> -
>  	/*
>  	 * Power can be removed from the trace unit now. We do this to
>  	 * potentially save power on systems that respect the TRCPDCR_PU
> @@ -2000,11 +1998,14 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  {
>  	int ret = 0;
>
> +	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
> +		return 0;
> +
>  	/*
>  	 * Save and restore the ETM Trace registers only if
>  	 * the ETM is active.
>  	 */
> -	if (coresight_get_mode(drvdata->csdev) && drvdata->save_state)
> +	if (coresight_get_mode(drvdata->csdev))
>  		ret = __etm4_cpu_save(drvdata);
>  	return ret;
>  }
> @@ -2093,8 +2094,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>  	if (!drvdata->skip_power_up)
>  		etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
>
> -	drvdata->state_needs_restore = false;
> -
>  	/*
>  	 * As recommended by section 4.3.7 ("Synchronization when using the
>  	 * memory-mapped interface") of ARM IHI 0064D
> @@ -2120,7 +2119,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>
>  static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>  {
> -	if (drvdata->state_needs_restore)
> +	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
> +		return;
> +
> +	if (coresight_get_mode(drvdata->csdev))
>  		__etm4_cpu_restore(drvdata);
>  }
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 4d32605a84ce91eae2101cd83cad5f5317e2638a..06438ed1071478cd5c1a143c6ef58a926d6992fb 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -978,7 +978,6 @@ struct etmv4_save_state {
>   *		in EL2. Otherwise, 0.
>   * @config:	structure holding configuration parameters.
>   * @save_state:	State to be preserved across power loss
> - * @state_needs_restore: True when there is context to restore after PM exit
>   * @skip_power_up: Indicates if an implementation can skip powering up
>   *		   the trace unit.
>   * @paused:	Indicates if the trace unit is paused.
> @@ -1032,7 +1031,6 @@ struct etmv4_drvdata {
>  	u64				trfcr;
>  	struct etmv4_config		config;
>  	struct etmv4_save_state		*save_state;
> -	bool				state_needs_restore;
>  	bool				skip_power_up;
>  	bool				paused;
>  	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
>
> --
> 2.34.1
>

--
Sincerely,
Yeoreum Yun
