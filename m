Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1250253F12
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.33
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451309; cv=fail; b=JgeJarq+VtAtAyQpBWVPslhscJfq4d1UK7SUENBjipoARl48s+uZJsUobtycfbpaT8ztPVJEuL/yFe3EXtUwlrCDEr0zvzLrcFzK0M+BZLNEUgolu7Av1G8N96cJ3U2dPOpdl8s9RtpiIxs2LvfkxKN3/WtM518di9AhZrEI1ec=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451309; c=relaxed/simple;
	bh=PHJ1HxGN1CWRAr9Zg91TM9xeTmQGjQLgGXy3xpoOgMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Niro49jvY+SKHs59AIpn4fGW7OHVvSQPZSIkMd0Y/IzOOctGsFKTMuYfwvjtDZJsx2Ce6wgkEmrJ1U8pASqBzoHXiqYB6OOzRr3iefcF9VZJrBP0VJdOA8ihB1cfJMrf07rpGi3JzW2oxpqJ4mjda+DHRKECcrvWscLX54mAITE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=L/Rh/gik; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=L/Rh/gik; arc=fail smtp.client-ip=52.101.69.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="L/Rh/gik";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="L/Rh/gik"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=N5G+YOLsgiuf+ejbTeJC3OxCirWpZujVHjpnp0uTAmNc1EO3fBpR5PdObGaB9C9+qZ0jdvSaVVdVM6+saokbtG998rh59w0MUfICARs90uIQ3IRAQapIJNnLVRWasUz1jFuYkWGdHNVzrqqdjSO0R0OuaBH7WVjhiuR40x0MYoi/dKlB7/NFTRB75GlG+dSNDd1AlSxSAh1wf9jYFkB5GNuVdj8QZsK/sz9IVPwXmpI/f/fhxyDLIYwO1JX0gG8ekf8Cw5Hq4JWPOQ9V0reJR4DbZceFB1CQPTaStTwXLk3XcQ/Z20I+xXsFGdfsgoJVfzCJ0SSfmlANFoXHWaYG7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7txgnyUnulWEoShqX1RgWhXWR2ygK8id+NAmcsoX+4=;
 b=KtGDmjCWsBZBLjw+l6CVitzdvnX13jGnLUTygHCYMu8VewWe5YbSWpxENsAs6rfa/YawgkeppiR2bq4SQrOJbnv5hqrZFLsBAjHUkEzUgtX5RkDHVt5/99WlyiONV9RAq0ydqOJaX7WH+c3YvyXh20jfteXM1Z1t6JtCSoa8Ac1rBHnf3/94BbTy218nioByxSccUmXaRR/LVuv6kUhnr9xTMNUtLVejwi5zWe29sfMJX/wB3aRwGLPudWA41E39ROkYHpY8cHx6hCZQ/YwILHGQTcFIO0NLBzdae0eRW9he8iVqR9RIx2xfpyEw9iAnMpSMHDx6QPI2wcNFgWsckA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7txgnyUnulWEoShqX1RgWhXWR2ygK8id+NAmcsoX+4=;
 b=L/Rh/gikX959EQttsWK3hhAUq+IdM6WrkHksP4mDz6sWSxra6Jpf8Y+6QdUCyQWgh2Tm4fngrUFR6E5nSsIzsLoy8h0A8xw93uWNa3rApDdhdraVYDGBFo6AmFIuRbfjsF0gJOz9lhKFh2zVBDysvSzHCMkffngrN2UY69v23Ik=
Received: from DU7P195CA0028.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::28)
 by PAWPR08MB11204.eurprd08.prod.outlook.com (2603:10a6:102:469::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 10:14:58 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::f4) by DU7P195CA0028.outlook.office365.com
 (2603:10a6:10:54d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 10:14:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Wed, 2 Jul 2025 10:14:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scchOQPmXpN52s9dmVEOPAocH6IOCJpTWPhAHTYEC5JZxKgvLliRIfYXMSQ7O5Slg1TUTq40xhgxdN9GqJNgpEPuBZVhbbdme/JhJy6xuy6UDuRKA0zQiwmvlNpaAjeE/hqaxxQ6AsfFSHaz4g9EiLkAJdkX1qujW4TN6q3lIv8qqQVNPzTLtt/C1lgURstW3FSaFC/YY5g5ROER/XdxZkWUx2344eCPkEFkpi0nL8j/u8Ai9tzPoNJqwQYFvt0EKAVwuC04IKh48FxlRqqZVYaJpp/5bqjSnvjExSnwZBPid10dGwRrkuOoG4wg8293fbIYQip/hwoly58XMR1i6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7txgnyUnulWEoShqX1RgWhXWR2ygK8id+NAmcsoX+4=;
 b=qocjm1BCbTeznqBt9Kc9yaRH5fHnSfu4GEqXpUvvNtlLjfkz0R2u4opOPVoYwxxn1cs02K79PkFuimDpGwWj0HhCV3sABm6vOEpUor3lI2ftX3uVRgSQ5vB58yI7AeeEA5H1U6zw9cO0FS1hxSsurc5yza+egekcOcO/fATb4LOKAW9WxA7XBRWysSsjOdtOJO3UV8jbizhUhddssuPAO8jNeL3wWROXKvnW8oa0tw9NOTzzie8lKi1EAsUitAhzXQ9Yj1xhKXmfcp1mvE+IryzuhQnlfmieht+VGVVyM4lBMyJbfIVtSkuokA+kF4BoqqifptK8k2Nir8uTNjjMng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7txgnyUnulWEoShqX1RgWhXWR2ygK8id+NAmcsoX+4=;
 b=L/Rh/gikX959EQttsWK3hhAUq+IdM6WrkHksP4mDz6sWSxra6Jpf8Y+6QdUCyQWgh2Tm4fngrUFR6E5nSsIzsLoy8h0A8xw93uWNa3rApDdhdraVYDGBFo6AmFIuRbfjsF0gJOz9lhKFh2zVBDysvSzHCMkffngrN2UY69v23Ik=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB8038.eurprd08.prod.outlook.com
 (2603:10a6:20b:548::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 10:14:25 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 10:14:23 +0000
Date: Wed, 2 Jul 2025 11:14:19 +0100
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
Subject: Re: [PATCH v2 02/28] coresight: etm4x: Always set tracer's device
 mode on target CPU
Message-ID: <aGUGe82QxE+vCbx8@e129823.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-2-23ebb864fcc1@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-2-23ebb864fcc1@arm.com>
X-ClientProxiedBy: LO0P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::8) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|AS8PR08MB8038:EE_|DB1PEPF000509EF:EE_|PAWPR08MB11204:EE_
X-MS-Office365-Filtering-Correlation-Id: 4958e968-9072-4d64-21ca-08ddb9514c21
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?8L5/RGcL9nleCsY/tJCAhucF3EYCiUG+m5lDMCzR5JOr4ZemB/LEC0dxcFzZ?=
 =?us-ascii?Q?43BlkXL9AwIjVH+0PZLfLuHS5vxz1f/TCc2Qp2msx+DZMNgrfFxOdAFZfjrn?=
 =?us-ascii?Q?KS2h+m/NWgzPoxynXu5/NDI8qakDA+eWHMJ5S0CxKptaQI8aB+RZICCKLoT/?=
 =?us-ascii?Q?H/VthMhiVSIgAMestmtvD+GDp/i7ub3/ZAzJFDtx0AiCLlimoqwHDoh0mzS8?=
 =?us-ascii?Q?Q+R0jjatX2xT1bsI9JHAK1AwG8SAmuIcJElTlIDJbqE58Ki7rmATKYnXXVyL?=
 =?us-ascii?Q?csxNoR6un7Uq3/TraJGU+b4tDOmjU85WJ10ZpOtPwaurh7vXN5zn/VbWMedm?=
 =?us-ascii?Q?+s3vCjIAS+7TNCItSR3P0tSG4300787UqvGfCf/fddiXWsonJmrQT21B6sJ+?=
 =?us-ascii?Q?uhenRr/5sWcJlt9+5q329/FEs5YhMMiwJ2GWGl4TYrfn9fiao37sz9QyPvWj?=
 =?us-ascii?Q?nyW9xJF6YU04gtX4DXDu0OFGhvnlJg822XQGHvuvDvjHog9UhlkqYGyNb7Kl?=
 =?us-ascii?Q?unTZXBchPHW4nmDjoFMIVwa0XhpeIxipcoGOtwziow1kxK1VNj1KtoEvKF19?=
 =?us-ascii?Q?m9IJEjvrROU6ZSHtUVfnZruF8B+43WZRR4tKCR9I676Zqf+qTpL2qYsivVTK?=
 =?us-ascii?Q?yWxu0I2si/l50T8NNeEz8jAfJhVdV/O/lcurM3kiOrn/U2o53e7TZj2NT0bN?=
 =?us-ascii?Q?slK6chsGBotQ0opPYETERfYb2VjZ/YD153RmD6DZp7herwqpfBj8sqwA1SBk?=
 =?us-ascii?Q?7Q5sv9umphk6wi63/A/7BCMK7PDeCzLSdH+Gl+3rTVowwUvCu65PfakhBQMQ?=
 =?us-ascii?Q?pauHDxcu184Zfsd65adN3X9/LlsgnrtmpJphoKPyRO3SyLmDbxF53SG0Mulm?=
 =?us-ascii?Q?f+SulT1SMVonyZTLCyS4uww0qaSU6gQDNkPSroOSj2hACq8gaNCFInKvexPf?=
 =?us-ascii?Q?am+fBMr6Z6E0Ag5h4zLDU3GU6BDm8wpomrNlKYEpTSvmz4CdsH3Fa7Zi8r5g?=
 =?us-ascii?Q?zAiJn7ORCJaIy5Q4lRX+FkMkqvM4zaBJnpO6o052CW4M1AdqvSfkefZHTIFJ?=
 =?us-ascii?Q?E1EFTBzJ7mMag4UJXH30Tq14NLXMPtBZk8cwFYBjcvQjVnRcCl/JBMZ2+qGD?=
 =?us-ascii?Q?Nke8IYGVaBN42jl6AwavYWWpVr+xRX13RQxRiIbl821z6QYA0y5om16MfQzM?=
 =?us-ascii?Q?QD0q/Hv2ObPNT2notBQNLrYD5TpBFz+r0AwEsr8WIEp6QIm6+8VXY1K5uMcG?=
 =?us-ascii?Q?ZSUUtH6eqR+aqLMBciI1SyShLjFGVxyRVIkqXZ1o65QdIsw+nPPkmJj05+1n?=
 =?us-ascii?Q?KcP0c53Mg3gRdEgppeiWLj5DyPwyKOOCHeRJ6EHdgLfBMQkDKNDFuAu1ZPKd?=
 =?us-ascii?Q?T9Qq7+OlxwTq94TjK0M5YZxhiayx6LlYPkTzD7Cjme4HRBICuY46fC0ZFd7T?=
 =?us-ascii?Q?T5Cnhpn+O3k=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8038
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	62165151-d9c5-47a5-d26b-08ddb951377b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|36860700013|7416014|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zyS3DgI+3H3AryMYC1MBllfJISnTUyDRZ4+nooejQjHeMh2490RCz+kBzZdC?=
 =?us-ascii?Q?pfGgVHPcrx9C1/XChp31peeBhWQ7bfzWdvbCPyBUtbyI18y4XD1JBUdf+13r?=
 =?us-ascii?Q?pIhRXGprWJz3YUEHD8TH5tneWVFuM1g/xxVQdELrVVEKkfhP1Utpz+nOwRT0?=
 =?us-ascii?Q?NxdYdcXGnva6+CK1jL2Mc3/AoSuzk64dRR61WGY2rBvHAp5TX+lE9K9TTcaM?=
 =?us-ascii?Q?YzZz9nHG/FFT/cDP0xQV9w7D2duxbrbia/mPKA4DAMRke5PK7Gx0VMbhJLhf?=
 =?us-ascii?Q?NsF2Mc0e5GHZTRZCFgeqo5JOiPJR1mF8bJ8Yr//9NTra6kQQED6HCG0TxBCC?=
 =?us-ascii?Q?C3r84GKSfWRaUKdJKSD6W9orIL4Te7Zx5P2SbiLVpx0+bMkAGq4uwNS2hAeD?=
 =?us-ascii?Q?U7w06IJHhR9h/qno5KiwWCLtYmlyYpn7S8uWHYeY1l4PemN8CxQeHABXxIgv?=
 =?us-ascii?Q?2Gx+FevUmYyZinfK+xISN5LxHOG824HOw9wO8dKbLF7yuTgctIFdQZGwZa/p?=
 =?us-ascii?Q?+6JSFNvHm8GHzCQ4+4fDwf+OmYXKGWn5gW1hehfb32Jzg48vTXm/poNxe4kl?=
 =?us-ascii?Q?a+Fk2KD0V+ko0rgmQ2zJ4Ji1q3/ktq6Wc9d34lmGE5Ki7tY0UWkgKtd9RIJ/?=
 =?us-ascii?Q?GjOjOQBqJUZFMj836jh7Nq4GZfIs3cPLXvzcGi2d/uBVXtTPjMI9RExEXAp0?=
 =?us-ascii?Q?FcZki4QE1vOjt4PVVXdghmu2EYKXP6o2e3wJ31lkVxmWWyxrPUK2k4NbWVxC?=
 =?us-ascii?Q?I3ujqwxrWUp7rGqvXzM8ovVP4l2LipqWW610wB27qgxH+7fldiXswucQ5awy?=
 =?us-ascii?Q?n+iFcY9syXjBpY+E6ljDdz2CRQMOEezDIJ5+n2DJgt3QlfVe5m23OhETgZ0G?=
 =?us-ascii?Q?zPMNlqVsfXTCbvRHPx5feCcFPBYykR/WXr28KQHohymvm7bPh+0YASWm9E8L?=
 =?us-ascii?Q?CNSY7TfVaNfk2AJ6A6gF6I4lmokdlV9JtFk9AJlvO7yFAjlPR9I9LBqrp4z8?=
 =?us-ascii?Q?n/4WtKKTkYxVqz4tQpy7Q2k3IFIXsX5vbd14Fx9vuH7H+/sItUY+VnDLlNbK?=
 =?us-ascii?Q?o9Eb1FdOSRd4KwzsTHu5axAQxFszPjkG2ytO2LsZVeaBX+fnr8OLN4tTLFxv?=
 =?us-ascii?Q?93loGzXTyx+NDX63mFRBTDfKcgVe4OZg7LWl5ohg9n4aHMKCsH4An64Ttz8Z?=
 =?us-ascii?Q?q/YvKVXSTZLTwIqtE2CdxvMqPqDkimiKulxYMF3vnAhlWvBMexqUlkXeXDPe?=
 =?us-ascii?Q?2bb+BFhZjsQzz7sS8zLTppiU22vxAMssq07rlCLvn31xQkpMGERjesFNwuvL?=
 =?us-ascii?Q?oTw5m6ZIhMyl1BZlndw3eZHmqJ5vD+FDvtUC+zcoqEBGbnm8cliESVp43djX?=
 =?us-ascii?Q?VKMUuyFAz0ne/j35/WdIfQ5aHTwFgyw5+0lhmtkz2pOYLG1eYZ5yzpr+XS5r?=
 =?us-ascii?Q?Xi6u26U2CtXVBVQfxdavQfIP3pwHSvkq/Ft+8BGhSPdwLiP8avKTGdmKQWMn?=
 =?us-ascii?Q?5bKaZPIzwFTh9n6PjD09ekxb3nirjTY2q66l?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(36860700013)(7416014)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 10:14:57.5992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4958e968-9072-4d64-21ca-08ddb9514c21
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11204

LGTM.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

> When enabling a tracer via SysFS interface, the device mode may be set
> by any CPU - not necessarily the target CPU. This can lead to race
> condition in SMP, and may result in incorrect mode values being read.
>
> Consider the following example, where CPU0 attempts to enable the tracer
> on CPU1 (the target CPU):
>
>  CPU0                                    CPU1
>  etm4_enable()
>   ` coresight_take_mode(SYSFS)
>   ` etm4_enable_sysfs()
>      ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
>      			                /
>                                        /  CPU idle:
>                                       /   etm4_cpu_save()
>                                      /     ` coresight_get_mode()
> 	       Failed to enable h/w /         ^^^
>   ` coresight_set_mode(DISABLED) <-'          Read the intermediate SYSFS mode
>
> In this case, CPU0 initiates the operation by taking the SYSFS mode to
> avoid conflicts with the Perf mode. It then sends an IPI to CPU1 to
> configure the tracer registers. If any error occurs during this process,
> CPU0 rolls back by setting the mode to DISABLED.
>
> However, if CPU1 enters an idle state during this time, it might read
> the intermediate SYSFS mode. As a result, the CPU PM flow could wrongly
> save and restore tracer context that is actually disabled.
>
> To resolve the issue, this commit moves the device mode setting logic on
> the target CPU. This ensures that the device mode is only modified by
> the target CPU, eliminating race condition between mode writes and reads
> across CPUs.
>
> An additional change introduces the etm4_disable_hw_smp_call() function
> for SMP calls, which disables the tracer and explicitly set the mode to
> DISABLED during SysFS operations.
>
> The flow is updated with this change:
>
>  CPU0                                    CPU1
>  etm4_enable()
>   ` etm4_enable_sysfs()
>      ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
>                                           ` coresight_take_mode(SYSFS)
> 	                                    Failed, set back to DISABLED
>                                           ` coresight_set_mode(DISABLED)
>
>                                           CPU idle:
>                                           etm4_cpu_save()
>                                            ` coresight_get_mode()
>                                               ^^^
>                                               Read out the DISABLED mode
>
> Fixes: c38a9ec2b2c1 ("coresight: etm4x: moving etm_drvdata::enable to atomic field")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 48 +++++++++++++++-------
>  1 file changed, 33 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 42e5d37403addc6ec81f2e3184522d67d1677c04..ee405c88ea5faa130819f96b00b8307f8764d58a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -590,10 +590,23 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>  static void etm4_enable_hw_smp_call(void *info)
>  {
>  	struct etm4_enable_arg *arg = info;
> +	struct coresight_device *csdev;
>
>  	if (WARN_ON(!arg))
>  		return;
> +
> +	csdev = arg->drvdata->csdev;
> +	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
> +		/* Someone is already using the tracer */
> +		arg->rc = -EBUSY;
> +		return;
> +	}
> +
>  	arg->rc = etm4_enable_hw(arg->drvdata);
> +
> +	/* The tracer didn't start */
> +	if (arg->rc)
> +		coresight_set_mode(csdev, CS_MODE_DISABLED);
>  }
>
>  /*
> @@ -809,6 +822,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>  	int ret = 0;
>  	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>
> +	if (!coresight_take_mode(csdev, CS_MODE_PERF))
> +		return -EBUSY;
> +
>  	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id())) {
>  		ret = -EINVAL;
>  		goto out;
> @@ -828,6 +844,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>  	ret = etm4_enable_hw(drvdata);
>
>  out:
> +	/* The tracer didn't start */
> +	if (ret)
> +		coresight_set_mode(csdev, CS_MODE_DISABLED);
>  	return ret;
>  }
>
> @@ -880,11 +899,6 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
>  {
>  	int ret;
>
> -	if (!coresight_take_mode(csdev, mode)) {
> -		/* Someone is already using the tracer */
> -		return -EBUSY;
> -	}
> -
>  	switch (mode) {
>  	case CS_MODE_SYSFS:
>  		ret = etm4_enable_sysfs(csdev, path);
> @@ -896,10 +910,6 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
>  		ret = -EINVAL;
>  	}
>
> -	/* The tracer didn't start */
> -	if (ret)
> -		coresight_set_mode(csdev, CS_MODE_DISABLED);
> -
>  	return ret;
>  }
>
> @@ -951,10 +961,9 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>  	isb();
>  }
>
> -static void etm4_disable_hw(void *info)
> +static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>  {
>  	u32 control;
> -	struct etmv4_drvdata *drvdata = info;
>  	struct etmv4_config *config = &drvdata->config;
>  	struct coresight_device *csdev = drvdata->csdev;
>  	struct csdev_access *csa = &csdev->access;
> @@ -991,6 +1000,15 @@ static void etm4_disable_hw(void *info)
>  		"cpu: %d disable smp call done\n", drvdata->cpu);
>  }
>
> +static void etm4_disable_hw_smp_call(void *info)
> +{
> +	struct etmv4_drvdata *drvdata = info;
> +
> +	etm4_disable_hw(drvdata);
> +
> +	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
> +}
> +
>  static int etm4_disable_perf(struct coresight_device *csdev,
>  			     struct perf_event *event)
>  {
> @@ -1020,6 +1038,8 @@ static int etm4_disable_perf(struct coresight_device *csdev,
>  	/* TRCVICTLR::SSSTATUS, bit[9] */
>  	filters->ssstatus = (control & BIT(9));
>
> +	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
> +
>  	/*
>  	 * perf will release trace ids when _free_aux() is
>  	 * called at the end of the session.
> @@ -1045,7 +1065,8 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>  	 * Executing etm4_disable_hw on the cpu whose ETM is being disabled
>  	 * ensures that register writes occur when cpu is powered.
>  	 */
> -	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
> +	smp_call_function_single(drvdata->cpu, etm4_disable_hw_smp_call,
> +				 drvdata, 1);
>
>  	raw_spin_unlock(&drvdata->spinlock);
>
> @@ -1085,9 +1106,6 @@ static void etm4_disable(struct coresight_device *csdev,
>  		etm4_disable_perf(csdev, event);
>  		break;
>  	}
> -
> -	if (mode)
> -		coresight_set_mode(csdev, CS_MODE_DISABLED);
>  }
>
>  static int etm4_resume_perf(struct coresight_device *csdev)
>
> --
> 2.34.1
>

--
Sincerely,
Yeoreum Yun
