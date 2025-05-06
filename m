Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79443214815;
	Tue,  6 May 2025 23:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.63
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746575851; cv=fail; b=KDQN93LBYpeWbAb9w99q1kRnXutQl0Fb4+Pv5vsoMFZDiRCKqNZ+GLOuDGQJhDhisV+xKkyad/4iyDqKn2vKVi7AuDJZDpQukdJVCL7k3BgOjOUjqyO1Q7ZCK7ayELwAk7y4BCUVJY/WPgRmo9pFCffJTuzmTwRjVbUnXvt+hew=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746575851; c=relaxed/simple;
	bh=5GY98X7PKjjzRcanfHwQaR/HaEj7nngm4fyWFPNS0bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o/csgld9aQGdaI0Zx+1eMW6CAE5fdshdys5fQr68UxLVG8ofsWCUaB7rviTETivdMOlPcXrkEHiTBzudXDhlLhcCzO5hI2h2UZmdQ+LQpSwuyOF2hxqY/ZyvyrSAf9DkrETngn+hw/TSH008B7UReVqalFJ+GrjvQcdiyY9/vGE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hQhSQ0oz; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hQhSQ0oz; arc=fail smtp.client-ip=40.107.22.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hQhSQ0oz";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hQhSQ0oz"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dq7ucizreR5NarSuOyWCHGJwzJVV6POn53vJBA5QHo1blC9fuzbTktNrX41f9UGL6zbb3qyTw3onGAIZM8NG45BI9eYVABaKjLfKOf40eAZ1BpyMN2/8oHI62dHOfgqOTo7QSUN7ZCRD/2bUz4JrKWV9nj2j0zyB/jyD42qohqVPH6ACgFkhibD831Io3NmP7bcvo0FCfBYM6u878RFTw1XgviFBquAgUqnqd0uy7gQOeBpn8WafwCOxm0I3no0O7rL7Qb4MrelI2IbeaphQNHwrUvZLbbDBfieKiUXxq2zDJm3qL9+hwEKGGBqKy4JKi1VS1XWU6e+S/gdfInbApA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eliAdGRpDSfLFeWKQA6k9yx7iPQY/KX5OwJGEBdxaUU=;
 b=mRKov27QaLMvNkrBIH9y2z76IlbEG3AFOiy0fV8sIaC/jadY13QzotlxNe1eLif911kXf8tPHfMex4bjz+FLyc3Rwv9oRF0wZu8TkFdlR271c1okWg7UGFFaRHhLXrkRPfupS3LlTfv0WDjoGSXYaGNn7NkXqLPnxcKMzvUpvMRuxMx+lODmcDAV35GIGMNO726bdMGQivWvAJ0vviG3ZN/ZNY2GEVABo0D6i15KGTvE2ceG0wdx/PSdDehH0wvBPbUrEU2cSDIOap6o8KZH+W1+FPlThK6hpzRGAzl5ljQi13D6Yz1h1MIzUb9RPP+i7eREs0y0qiA0sveZAbI8vA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eliAdGRpDSfLFeWKQA6k9yx7iPQY/KX5OwJGEBdxaUU=;
 b=hQhSQ0ozwbJOW8Todkor23P4CTWARVMLxpaLI9rYhY6ICop8AakAGkTKNQdNcDVnwI5qx+yndX7vmN/pWrtGi16dh1tcvr6mLhXKDbBINwAsVGEs3FMZzUNvxHNAU054Q6usJllHOjdetX0fymDL84cBUSKkBm0RopcE0MI3dks=
Received: from DU7P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::29)
 by PAVPR08MB9116.eurprd08.prod.outlook.com (2603:10a6:102:327::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.34; Tue, 6 May
 2025 23:57:23 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::b8) by DU7P195CA0006.outlook.office365.com
 (2603:10a6:10:54d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Tue,
 6 May 2025 23:57:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18 via
 Frontend Transport; Tue, 6 May 2025 23:57:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Asto59hzkTA5haTP9zGkgE/KPtwY8JKd7QYuj8eweCfYAF8RAtD0h5FCqawtRKrOyVQ/XlVOmKUGv6yY2iPbohHJGf0PulvQmb/Tj1Y1HeYZQbdKTMLQcjgbNJcGZAMvo26Hs1VT7XQfEoP7BlzYoe8p5axSCaLhkqTYCpJI/ZSxBC4UZuMQ1iwUPICErcXV+AyXXmtHpYn92b8HCpjhYLJNdOIh0rDx0GUya7KxIgIaeg8se5rZTyeo5Ou31R1tw4Hfu4HFuAJn3OWV8TEjhc7wYhfYDZkFK2jnWuGA2JXFQ538RAaLqYPhVpsK9IsBGdJ5w2tdtlyHPyEnYR+4dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eliAdGRpDSfLFeWKQA6k9yx7iPQY/KX5OwJGEBdxaUU=;
 b=L8rGWzhSGKfp5DZ1G/LeCcRrPeQ+QTN+xU8vjjcLjt74jbY1CF5LvJe/BIlGj8rOrVXrO02ae3H/9MVP7XXT8RiOariAGlM4YchVs8mnACgrp3Hs84GWSvqAl4IpRTM7NI/IcbRlKY4+CKDGFiWDyPbJnNU//Y/ZnVSTv4QKNMKOq6KIlANZxnY+uzlpSDSPS6r2H/3iI1h484ve4P3Iji2u7hiZkk+C95VLGzDtj2d0QPAYzWE9ufKrV3fJk8+IwAzZGe09JAcJ+xdQy7+fDIbC3GO1nfM4Z2VPGz9+Fq/SpUXlI70IX2IQEASwRkzsMGHh6EvhuVEomqCKoWOrIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eliAdGRpDSfLFeWKQA6k9yx7iPQY/KX5OwJGEBdxaUU=;
 b=hQhSQ0ozwbJOW8Todkor23P4CTWARVMLxpaLI9rYhY6ICop8AakAGkTKNQdNcDVnwI5qx+yndX7vmN/pWrtGi16dh1tcvr6mLhXKDbBINwAsVGEs3FMZzUNvxHNAU054Q6usJllHOjdetX0fymDL84cBUSKkBm0RopcE0MI3dks=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU0PR08MB8954.eurprd08.prod.outlook.com
 (2603:10a6:10:465::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 23:56:48 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8699.024; Tue, 6 May 2025
 23:56:48 +0000
Date: Wed, 7 May 2025 00:56:45 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shmeerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v3 3/3] tools/kselftest: add MTE_FAR hwcap test
Message-ID: <aBqhvQPG3J04Qdx1@e129823.arm.com>
References: <20250410074721.947380-1-yeoreum.yun@arm.com>
 <20250410074721.947380-4-yeoreum.yun@arm.com>
 <aBT9yiaLF9LisLR6@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBT9yiaLF9LisLR6@arm.com>
X-ClientProxiedBy: LO2P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::18) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DU0PR08MB8954:EE_|DU6PEPF00009529:EE_|PAVPR08MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5ffaf5-ca5e-4e44-65fb-08dd8cf9bef5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?eaVUfYb/e2ShD7f0xAPO5ogwHXVTkkupTjPBSqUaLw9NNwlBgG+LlMeS8YcZ?=
 =?us-ascii?Q?DcBwFCPy2/ydVbsh2qQuIIeDdamnEIg19qzxbsa7QJv6Oh1jrJ2q4+aXPTyT?=
 =?us-ascii?Q?fS3I/n3fOWJA7hu+QsARlaXx13uvF6gfTBmT91qIsIsru5WYA6fDbdL+Qg5z?=
 =?us-ascii?Q?KoS+3e63+01dylPAHYGLRJojNuSLYOBhDlH8w1pTvHu5aji+nyyk0U3CPi3a?=
 =?us-ascii?Q?y5YHFl/6+JrP4+nVSgycTLQ5qgPDP4TW4Ddjr8g64vU+qVuvF2LkiTNCpFWd?=
 =?us-ascii?Q?BEhZrYPC3N1tw5iLGyFPQc/BMxUtPP0QobpW5gVIFcawvx1gyl9AydR05FEg?=
 =?us-ascii?Q?xFMHzUld1Z+TJalG/Ix3yMz5ENlnzhHslsbysFd2rk+WsonogimUQLzWvocZ?=
 =?us-ascii?Q?D5FRlSMHaS+Y38iBCH/8ecYaa8nMVJpPtt5+1I+qoALJ8jp4NWZ9Ha6cRfKg?=
 =?us-ascii?Q?j7Xcu4YUa7Qn1G08M7R0ss9UKyonn9o6/TkSFN7/tiwbSEeNUECwcIn/ey40?=
 =?us-ascii?Q?awrSr1nu/WGJKIxHifyIgg3jpNtnyhju8FWsQWSqChSSQnQdQJWCUKy3vKYG?=
 =?us-ascii?Q?s9b0zOoTGzQwob90M3PfESw0mHRvLdVxh6hdQZncWsuYOf+4Eea4s6agV3U1?=
 =?us-ascii?Q?hitNHPhSnB2QIkGzx1SDZe1v4u+Y6YUee8iaJR46ELBe899tZzBmrx0ByAmo?=
 =?us-ascii?Q?NEdRG92ijiNBWI6Nmvq+36EwjwOdyRU+iI4o4WGeba5DXYmSeOrjBaDl9sty?=
 =?us-ascii?Q?sfFjaVFI2Iam02A4TegbmcG1dMIXbNZxEDYl7PhKjrBFiYwuo/zsJHWcu+wz?=
 =?us-ascii?Q?SSbBaCMuyDb67XZqjfOgDeL6Klwfsb/yyRhZzyLsoOQatk9iSUZhllk+RL/B?=
 =?us-ascii?Q?7TkjD7eeVe1cmSd8+9BAsrMeD+hLk6aMwwzzO2I2ENaq9Lns6HTSqLObEnPb?=
 =?us-ascii?Q?CHsced0NYAB5W3OfoPu4h13mS+QyVB/cdK3ma1CTY0Vgbvc+0HlyHvyDQC3v?=
 =?us-ascii?Q?EKAVQow0kOCeGmYcvxxLOHRGYGWQROXv6WkPTIrP68394vWq16H1Blsa8O9K?=
 =?us-ascii?Q?aBfPCWGOENVCOAOOeKFIlqD++zZpBGBZbqvlwXF8bXROWEvIZg7pwrXTyqn3?=
 =?us-ascii?Q?x6EjJwMrcBHvI709m09xXP027UdB/JHHwoR7dNPorMkcIjg0AfwZ5vzbalfF?=
 =?us-ascii?Q?Pa6xK6bj4ROd1yEJaL/PUcU6KwfVD9GEFjpbMF20XmXNvH4toxG9VjEgXH61?=
 =?us-ascii?Q?Fl3XaOadx0RDqu39nn/Zg/1eyHdlaAccN+BjSJjKF27PTLmnAEvJEis2ye9z?=
 =?us-ascii?Q?GE+cdpZIg+Go9BX1TgdGzCSGakH1ErRYumzyskdnWzNKEFq+mvR8LkDLFA54?=
 =?us-ascii?Q?jX1Dpt9aSn26Qx+evUvcGQc+7m8v+sVBqFAvJMorzqPnaA+LdX4GZxlGzhcD?=
 =?us-ascii?Q?1AGdbDn3Atk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8954
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8722cf3a-bd97-49e4-9833-08dd8cf9a9dd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|1800799024|82310400026|7416014|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KDbnxOKSK8ek6uAdPfcQ5c7E/gEDZevyxn5ehbA2vGHSyfbfwReY1OZakSz7?=
 =?us-ascii?Q?cbnOH8k33hijHj8u56WLm9W2mSpytNObhmLRyypIqFg1GNUR+5fG7HiPL9a3?=
 =?us-ascii?Q?BLGdkPLnQjmupGTxfIMqMsfffaBFpIIXjIulA6A3ftbaL6qtximOMQ3K2BSH?=
 =?us-ascii?Q?EXQDQRhQtt92BlSK1HT3XXgRpPCvQ8NDYua1IybxWsfg7Fo1wwaqLb1mm/oo?=
 =?us-ascii?Q?lZNTuNuLO7k4BVB7fH24SnT9e+o3XZwEmrNKPK9vrDl2nh8LryeWasaTucHX?=
 =?us-ascii?Q?tjodrFAbnP+DQAHjU6f66dB/RkhIcGUpSqEIjFVr6oEXITvMSsl/Ggmb7oUV?=
 =?us-ascii?Q?uv2YwUevCgkeAhgfqB39DCEpJ9WOakL+D+mOGi7gxeqhJcoDJTc/3lK4TrNW?=
 =?us-ascii?Q?Siib7UKXhCjdKEB8Ksnldqvl1h8npduJIv/FdFPCUQCVhNwQVg+xwD24L26E?=
 =?us-ascii?Q?5Bjgg3oDdVm0Jui83gsGyN5ZxxqnMWne914/DMp0n51XSSNWYuK8UTpWGZ7e?=
 =?us-ascii?Q?uwcGGAToTujoKoiOk4lrr6jPFqO4C+t/JoCl2e3HxFuAcQDBdeR/ksj4dZgD?=
 =?us-ascii?Q?4ihdLVqysANsEsgofOyj9ysV2qJDwgbpeM0tG0Cs0UxE3hhmud3diOTrdLjn?=
 =?us-ascii?Q?jbO0AYGfCEldQEFVzTL1/GQSNurHGRASjM3RXYYJh5Q07UC8LbpsiLqiXMTd?=
 =?us-ascii?Q?Yjg2vE7K9q1jXKY7kXivKwhSupb6t5FIQ8nb2yZUPWQw6XX/9bTt29+K5OIM?=
 =?us-ascii?Q?D7lXOHlJqjFjjZgnr8TbdjhCEP5O8Qo1l/sY1rG5RkqrTNhld40V9matMWBL?=
 =?us-ascii?Q?+qrZ0YbhW8XwCsd1yqvfjQIpGGZABudP8CLKYWqmHCydNKt2y8vmJycUZEdu?=
 =?us-ascii?Q?rFkVUSWvm8ijUArY8rxk6NZeAdvzOnLzhKV+byeqHvYGuMNOnb/f/cL1S/Zd?=
 =?us-ascii?Q?axC2v9RlOqqViD/aLguS6I53s4JjOVKaOt3YUfMZpCYHvDDro0ypz1OhIWuC?=
 =?us-ascii?Q?grUB15YhbV1RnhD/3tVTuZlWraVeT6uWS0+qlYDz2zFnsqIfWJTGeY9Pasy3?=
 =?us-ascii?Q?WJGANiUCBm3ZVhOdkOag+V5kYynIr1u15A9fkWw3qeazPguXeCXbR/mZHqHS?=
 =?us-ascii?Q?1xyoNZA3sgoxV0XC/tkLzHw+eKJpEdaK3NnWVNhjcdXqsDxSakgiZL4VUpFg?=
 =?us-ascii?Q?OI4m1KQOdL+RJ4LdX5Gi52mQyztg/LFeGR+VQyMIMoNszoNKTN2MuUyM7QDd?=
 =?us-ascii?Q?lcf0aSpnks2hL6xtPnOXkHdjyHUlINpcfZIGNIXaS37+BDiEZyS1+fgCPTmZ?=
 =?us-ascii?Q?gQ6spo9Xqji9Y43w5ceN+1Plpc+6M/6w4y5El9/oC9Ex8ABVgKWNBN5+do6R?=
 =?us-ascii?Q?Mb6XBn1/5hPtBfC0vX0PZSPHC8BtaUnNld2roynt+0RUrE5mK57eWhn98/cQ?=
 =?us-ascii?Q?7WQD7iM+PM5n59nvmroEzT1zIZhkakygRUVaHMWiOpMz3gH/gRE4Y7jQ90pM?=
 =?us-ascii?Q?4zDxp9pCafhOalk49qHlza8W2Qz/M7bBw4HY?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(1800799024)(82310400026)(7416014)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 23:57:23.3950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5ffaf5-ca5e-4e44-65fb-08dd8cf9bef5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9116

Hi Catalin,

> On Thu, Apr 10, 2025 at 08:47:21AM +0100, Yeoreum Yun wrote:
> > diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
> > index 35f521e5f41c..a539eeb0bfc0 100644
> > --- a/tools/testing/selftests/arm64/abi/hwcap.c
> > +++ b/tools/testing/selftests/arm64/abi/hwcap.c
> > @@ -1098,6 +1098,12 @@ static const struct hwcap_data {
> >  		.sigill_fn = hbc_sigill,
> >  		.sigill_reliable = true,
> >  	},
> > +	{
> > +		.name = "MTE_FAR",
> > +		.at_hwcap = AT_HWCAP3,
> > +		.hwcap_bit = HWCAP3_MTE_FAR,
> > +		.cpuinfo = "mte_far",
> > +	},
> >  };
>
> This is all good but I'd also like to see a test to check the FAR_EL1
> bits are actually exposed to the signal handler when the hwcap is
> present.
>

Okay. I'll integrate the address tag check test into check_mamp_option.

--
Sincerely,
Yeoreum Yun
