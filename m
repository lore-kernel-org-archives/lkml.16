Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2048.outbound.protection.outlook.com [40.107.105.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FFB270ECF
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.48
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221262; cv=fail; b=JefmRMQyDtmaQ89UfEQ3tcqqF1eFgzjGHoUn4briaoFuxNgCu1WMKoK9SrAf3VQ5xAaB7x6QSsHUQdd6YvXmmocg5QMKiQ27AW3DEWUkeG2fVePIrH4z248M1REqmlbhzj4FXlUsPUEa+yXLEzgJFOr1iZCxGoVWUxlrw3DRCns=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221262; c=relaxed/simple;
	bh=MlIcxnNoxbDOhomGaWM6P3oXwry0XaMGlQPah4c9/IY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Nl/6/3jL6eYUbdTBJF5CAxXEe/9b9fGud2BqAndc6Z3NkfiQsU7iDdt50VWIE2pAwWylO2ffUsvs1uTonqYZMtsfIZtTswRw4LUHlruDsad5y8oAmBGq+VaE/VYHPrNDBVNouS+xlcOtiXYKyH2+F3DJ05S3HhvDI+ISPMx85pk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VWACZpIO; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VWACZpIO; arc=fail smtp.client-ip=40.107.105.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VWACZpIO";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VWACZpIO"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tFtFuMdFUMS80kD1XrbLeT8i2rhyJgDlkhxaWjMbPqON0UqGXJWxHIQc4IzHhqFnbAvIPhHSUukAfilKrpFdUi9419Ycnw+py/YyG6qmjk6hFdV+1aL9pF3YsyKiNoFICS5cPuoLM4PlbIfFKOP28/gpx6Nh56Rn8auqxNVWIsyDIKtZtQyE6CXt53iDU3foncQ4vWhJfLJkb+FQGFTWqjCFzOjQ9DAwCXrZPOONwgXolQjbzQC7FCzEd/mvNW8x8Uyf9gIIouaZ//WXWTa2WYX+gUpv1Arn0GKQPVRwF0yeyf84dVa0yO2pB07w/eqm0lVvwyeSwwYOpss8tH3g+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0X/ZoLGObCLRB+69IIkEFo1gS7bZ8NOE9FOk+VpFdo=;
 b=quZYjsZ+wulAhjAqqkYEDNjSnqaJrggfQrojfl9exkG+BPZA4yCQgY1Tri+QFDq9LtdyYoufzcI2S1ReJUAQEDfbLEAwJrCJnH7345LIAYwjAA/frAqGTiiA9i3pLNIGSvKQKLfPo0h37BHyhiqMNfluaEFCOsUWg1OdYFt/nAHNQB3Msynpn3DgSr4WwjhpWN7edz4RLcFzwUMZeda6fyqJIt6Z/xQM4tnhRjqkgLERSfFDCl4mSmonUtphLHcnBeThuqwCS/4f6XA367O9HOCkVnc8BP2Jhx3H0pFG0AnADhpuNsCRSF5OgxBXuM6+iw/zD/q5EkGUIOJTNHgEww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0X/ZoLGObCLRB+69IIkEFo1gS7bZ8NOE9FOk+VpFdo=;
 b=VWACZpIOq8CGLYUxvwIhLE7zpSKMyKvyy9gcK6ejK8G5TzD969u0Jan7hYCv+kY1EHJovPM8dRxlkeXFsVyf0GNSQ+2mJgh7pmMwlzY5KvY5BMDPPcqfQzUo1tUCC1j5c3k5C+FRDB5ovtCQ5r0M9vWUTmqbm8i8LWR382vtvUs=
Received: from DU6P191CA0068.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::20)
 by DU0PR08MB9902.eurprd08.prod.outlook.com (2603:10a6:10:476::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 14 May
 2025 11:14:12 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::fb) by DU6P191CA0068.outlook.office365.com
 (2603:10a6:10:53e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.17 via Frontend Transport; Wed,
 14 May 2025 11:14:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Wed, 14 May 2025 11:14:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7LOJmFG7UAmXiQlRaF5DE2RQ3cLVAN/E6rRNvlF90ifW506G8Y9CYEgzlbfX0CTpfNpsLAlGH7v4ySlzhphilAPcusjsO64cK1pSWns3Q0mSeUVvWVUgiLVBpz9a4qUn6N5EuSijsabFpXc6zhTcEfv9jJI07fENx6gsW5Jz+cMi4k1YAsq9Ucm6Z5AJ4ld1ZWvGDedw7RulHrafCFgR1NgTGqF5tf1Wm8ACEnNGEpiKKuPzmNpBKNgNv6Kw6JF3vLc7r9Rl/fPqeTnh80pUTY6ufrcpaM8KYP/nYyEtOCFlmdtamRahw4ZOTmqah94bYgGrCdBh9yxGxG9ZeW+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0X/ZoLGObCLRB+69IIkEFo1gS7bZ8NOE9FOk+VpFdo=;
 b=Rm03EQn/mv0+TFxxQE3HPdDPzOzkoOdTCFOOlICVjsAVx5qPjLOAec19ixZLfr7FD8mOvJH14wRwYh9ReJqU2nODwTudeBnIWhq4ovU/2TbNGk4wpBHZnEx+pypGAiffo0a8IJIOrQumztDOlIXrUf/303YsHN32IgZIzRvfkfxymMlZoay7+IqYvWUFxE4eVx/puas9myzWMIQ4+GFd/tUWxZWGlRrrc7yhP3cQCQXPj1/qqvRZfeI8vixYbO1sGi7zs+1RBDiTgeXbPt8j8Geu5o8wt2Q3s8h2+eRjvVmCwfQhl1H+WZhqCCODw7CFdHX2FYBlZd2U+GMbj0uUKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0X/ZoLGObCLRB+69IIkEFo1gS7bZ8NOE9FOk+VpFdo=;
 b=VWACZpIOq8CGLYUxvwIhLE7zpSKMyKvyy9gcK6ejK8G5TzD969u0Jan7hYCv+kY1EHJovPM8dRxlkeXFsVyf0GNSQ+2mJgh7pmMwlzY5KvY5BMDPPcqfQzUo1tUCC1j5c3k5C+FRDB5ovtCQ5r0M9vWUTmqbm8i8LWR382vtvUs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV2PR08MB8272.eurprd08.prod.outlook.com
 (2603:10a6:150:b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 11:13:35 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 11:13:35 +0000
Date: Wed, 14 May 2025 12:13:33 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] coresight: holding cscfg_csdev_lock while
 removing cscfg from csdev
Message-ID: <aCR63YGVjWe+L3mR@e129823.arm.com>
References: <20250513170622.3071637-1-yeoreum.yun@arm.com>
 <20250513170622.3071637-2-yeoreum.yun@arm.com>
 <20250513170622.3071637-3-yeoreum.yun@arm.com>
 <20250514091509.GD26114@e132581.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514091509.GD26114@e132581.arm.com>
X-ClientProxiedBy: LO4P265CA0203.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::17) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|GV2PR08MB8272:EE_|DB1PEPF000509E6:EE_|DU0PR08MB9902:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a789a00-c10f-4fe0-dd65-08dd92d873a3
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?pg9jIn3b1K0iGSjBP0hYvpQf+QkZMnSfwqXJfWFiU8VyWBJAjXPTjvEb7usn?=
 =?us-ascii?Q?yT/IlpW00WKImgZdEnF9ZRBXp7wLFpylA/aOQy5grXlGPF5dOSmAbFOmtopA?=
 =?us-ascii?Q?E7W41eXe8xQq8ITCSMQgliPFwtWUYiXCP0VF4VWaO5dGD4jAgxln/BX3cR7F?=
 =?us-ascii?Q?ZcysMlpMYCfJ38fXntNiGh1TDUkaMv//1WW+9jokUaFRKlq8Zb/oARwSHhhL?=
 =?us-ascii?Q?3APXKTxL5DTihqyIbEIWl+rDLG87cIfrHsbzf0kAWOT7BHxhqzUJWKKSLS1+?=
 =?us-ascii?Q?o07uvYGpaHtU+vxTx8dngnjBHigJ7xj8sINLE4s2eBYm1LTq4OlzT90dhyav?=
 =?us-ascii?Q?PNCnWy9/WSGkXqzQQd8fGfUR3Sk7sSHhAOS6ll+caLe9Fk+KXy1zQ6KLp5sh?=
 =?us-ascii?Q?GIjsVl/7pZli0wrqMxsBJXrVY9CO5ea8RYcXcwlP6flcF1wmBiOlCN/Y4qoI?=
 =?us-ascii?Q?xbPZ3ce9MB27emeZ9UCl9SDdEvRUdnaSFkugDPr0BkAVa3OKR5zLOi3S3LYF?=
 =?us-ascii?Q?YH+6b0km90AlXePB+gFWOx7546bE+g2TQccJQTCQvLW9eGhn775OL4Xo+qCt?=
 =?us-ascii?Q?VLbWFpEJkvAdIU/aniUCKrvBryGHYV05ly3PUdSGVHpjJsOOpBiu+Pt78NBr?=
 =?us-ascii?Q?F5yEtJNvtsRjA8rqCkcKiOsedRk+dHYaic4NeD+0Cv2Fz3L3wCowihuj4wZC?=
 =?us-ascii?Q?Mky8kiBOKDyERzR9YEDY83dVzULVnxfN+KcyNdG+57LrP4ZM0VYE6C0SMV9i?=
 =?us-ascii?Q?jcQkRBaB+btbmAP4FOu206wvcjY23B0m2mg71O5R6eZONZM+tsRMxVzzz74Y?=
 =?us-ascii?Q?+3xCMYAqLZHE9tXna4G+QLCqC4Jin+l260CLe5ISsqwVIuKTEF6DdfECxz0N?=
 =?us-ascii?Q?g4kj9p8LY1KpStOo/C0HouNviq+UgVAAH9hOkc+vb1a/iyxvVfkRsdNwxoWE?=
 =?us-ascii?Q?u1ClGAlfzhMr9ZCqcNoRA3jTGIShsDk6VAM0E1gQvyu4ptEe1K94lJpICik6?=
 =?us-ascii?Q?7899a6D6+CODQkgUkBgOagoGpmQJIjU/UYYeIxoV3Qb0blvstRNJgiU76xxz?=
 =?us-ascii?Q?9znnYSNzv2N2mW9xGsIjuAnBR4cQAItNeZExNl8oWXIB0uemDo7EbAp/axMD?=
 =?us-ascii?Q?+PPKWU0s7ly1NDR6k1Ld80ZkEjmSBdj8K3jBd0K3yd3Jt7aXMoJ3Szqj8QvF?=
 =?us-ascii?Q?WP49a9OLBldzpACt4QWLmaxi8q0L6G3MJCMZ+V+iPNnBpJoDZs3otxsrtY/N?=
 =?us-ascii?Q?VPImaEn2h+47miuPGc0clm0mCEtsAWHIOaGNz3IyMNIS5qVAl8/YwLNddzlU?=
 =?us-ascii?Q?KtJeSu8BtgtWyOF5F7XGLBTMGzJoATvu739vRj7Fel3wypSyIjL46abNKbMG?=
 =?us-ascii?Q?tfofwgzK7C99DyjPqPNIgb0vpPE1zOwS8GJlCZszDEZOpcci2GV6DwTSn/ui?=
 =?us-ascii?Q?/i9dEqTl6M4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8272
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be3045d0-4582-4f69-9017-08dd92d85eb0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|14060799003|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?whJNeNUY6Fhf1BnbM2yVn7byjgHnJeJYTX6dU6tIMG9IaYapLgOiPfosXuWG?=
 =?us-ascii?Q?DmGSDxvCS3INVUCZBKtrxAql8F36YvUyi8N/Ggk3/zyFA7/df9DPVSrcVf3h?=
 =?us-ascii?Q?lulkl+djtl9gl3gwxvBnRTTHWfGTbv3KIBSLXz2mSKowknudiqvon8+Dh8QR?=
 =?us-ascii?Q?rBGlYBSa33VS/wH44DhDX6G5NYw+DEB/JYSBXZ2sNIlvYD6bisaTDWsa2aPt?=
 =?us-ascii?Q?XHY2tOQypqbLz2qalN09VLTQoi6V35ps9Fla1gFxW54lSG6vhb0pildQAK7q?=
 =?us-ascii?Q?WrGJJGy9Sd/z6B1eoDT4R67J5l+SZAWtWDBGsilRAuNOTWLCB9HjGGWH63JG?=
 =?us-ascii?Q?ei2JrQtCuKw3Rh59NiJja6ovFvU7BtAwTpiHrLK/c7R2gKoXcjClJUpFwU9Y?=
 =?us-ascii?Q?1VZx7cccVeP13LpFb8fy6Jet9mEySnXgYWstzoDRnN3Q48C0Feaa19r7El1F?=
 =?us-ascii?Q?x++PKNQ9MAznUACWdT74RUJQvwan+cvuWFCAOAgy7Bkji4OKVnCpb654csJk?=
 =?us-ascii?Q?55W/TSbXBiSWLGxiPW5aMwBYRAIJogLg10VamfVOFF/CoKMNZFno07/00WiH?=
 =?us-ascii?Q?v+yDdPiMS+e3oM9eZ2fHyF6k17AOl1LVzXTi2VzysW8SiZ3gKECmbrNa6nAj?=
 =?us-ascii?Q?3isKOcpv2/6Z5RbJA4gVJYCS2SOR298W1SPsiqFKLia2nn9pWW2uPIJUoVNt?=
 =?us-ascii?Q?AHiqzYT7gce39Zc/YQqP7kI/vCp3j/Iix5mOQ9x9rOxAYzZ9o/nCmYuWCwbm?=
 =?us-ascii?Q?zwxORO4vW8uu3GtzPWPJqi63IYbTZTshjNF+6oH1Ode4TtkBvqNJkGaqPYZx?=
 =?us-ascii?Q?CViOaLgpd7spZPmfviRyDSIv+Qn3fJFthvO0cmBHQHBxwuDSnKZ00oxUOgoS?=
 =?us-ascii?Q?eIxnzuvKaecTpF7IUXas+Wb9CBX3jpXZgEMuJp3Wi2ojBfYpkTDpqoTIbv8s?=
 =?us-ascii?Q?Kuh8KPmKSNjxQBQd3KrgRjC+3R333+FMuOVdz7NfVR0rrHN+Ehq7GT9nfrNt?=
 =?us-ascii?Q?g36vHqZIEy4cSgQ35wxd/MNRb8UR5R2qnsCWH+E4KZI8u2A9RIoJU02QZT2F?=
 =?us-ascii?Q?MisQN7uFpAbAcm0C8ZQSNbc8+O/rD+awF4Owb0V4ggC+IzyByREaxu6AzV3T?=
 =?us-ascii?Q?n6PJBLSlzFgyQ6RsinYKJmIyJmniYrrdSxwmhkE4f343hDj9tKjaYVsri7JI?=
 =?us-ascii?Q?Iu+qiphSLuLuKBn9MlYiiOtMhdaofKqWaawrG9+lTYbjU7QFQeQEQRnWhGU4?=
 =?us-ascii?Q?cMj0A0+1yUdqkqBHDZmT/IwUNm4M5kwGN0iC4cMByfYwSeAul8Wt2NJlYMkO?=
 =?us-ascii?Q?ZbOWLj8QrquIvo8fOd8/E5jzHQZGo/lJAB6GkCKwuM3Z/kMyQDb6yXHHHXZ6?=
 =?us-ascii?Q?nRTrRaPxOWPfLK0W17KrWwYBK31jIPNj+pixYC8FcvFYMJ4gHg3pMsfDtLwD?=
 =?us-ascii?Q?q37fxXhNPuxDdW1GVm4NqYwNvi2Vur1yyXdXHol197HoMgmFSiorgmKeE5ez?=
 =?us-ascii?Q?/zMlpnIIMxAZLbs3y3m8iE+viMG6L0O9ErSM?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(14060799003)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 11:14:10.6120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a789a00-c10f-4fe0-dd65-08dd92d873a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9902

Hi Leo,

> On Tue, May 13, 2025 at 06:06:21PM +0100, Yeoreum Yun wrote:
> > There'll be possible race scenario for coresight config:
> >
> > CPU0                                          CPU1
> > (perf enable)                                 load module
> >                                               cscfg_load_config_sets()
> >                                               activate config. // sysfs
> >                                               (sys_active_cnt == 1)
> > ...
> > cscfg_csdev_enable_active_config()
> >   lock(csdev->cscfg_csdev_lock)
> >                                               deactivate config // sysfs
> >                                               (sys_activec_cnt == 0)
> >                                               cscfg_unload_config_sets()
> >   <iterating config_csdev_list>               cscfg_remove_owned_csdev_configs()
> >   // here load config activate by CPU1
> >   unlock(csdev->cscfg_csdev_lock)
> >
> > iterating config_csdev_list could be raced with config_csdev_list's
> > entry delete.
> >
> > To resolve this race , hold csdev->cscfg_csdev_lock() while
> > cscfg_remove_owned_csdev_configs()
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > Fixes: 02bd588e12df ("coresight: configuration: Update API to permit dynamic load/unload")
> > ---
> >  drivers/hwtracing/coresight/coresight-syscfg.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> > index a70c1454b410..5d194b9269f5 100644
> > --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> > @@ -391,14 +391,17 @@ static void cscfg_owner_put(struct cscfg_load_owner_info *owner_info)
> >  static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, void *load_owner)
> >  {
> >  	struct cscfg_config_csdev *config_csdev, *tmp;
> > +	unsigned long flags;
> >
> >  	if (list_empty(&csdev->config_csdev_list))
> >  		return;
> >
> > +	raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
>
> Could we use the format:
>
>    guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);

No problem. I'll convert with guard.

> Sorry I did not mention this in the earlier review.  Otherwise:
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Thanks :)
>
> >  	list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
> >  		if (config_csdev->config_desc->load_owner == load_owner)
> >  			list_del(&config_csdev->node);
> >  	}
> > +	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>
>
> >  }
> >
> >  static void cscfg_remove_owned_csdev_features(struct coresight_device *csdev, void *load_owner)
> > --
> > LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> >

--
Sincerely,
Yeoreum Yun
