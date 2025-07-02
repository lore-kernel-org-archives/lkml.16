Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4CB254858
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.46
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451944; cv=fail; b=jzugSQ4eul8ynJADzxUYMoBr8oLKXGC6yAqL12wml26qwBIyq68ATZqqZ0Lr/EnvB1rNoRl999DgyOP7j5Y2ov6hrzAR27kvIvRNpSps1yiEQuWm43igIC07tRdHvww7d3UzD6z+YXS6I6m8Bi5iaQx3UqBbiYYPdZXfm99noyI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451944; c=relaxed/simple;
	bh=jW5IueEP9QMcTE2VaAsM8H9w65/QaO6qnXwEDsrkyno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Je2q5pb70LEChO/0wbfucnDF/oAK5d4HX+5/3j1QYkzSjwWGoE/PA02pMHDJg+knwEq+63JekcH2BL1XNXJ6iHj7dytdWD84YkV7Kf+RILD9HQJc+esHZouf8L2XBi+OrMVzHWJcoPgLpjOvcf6AwxWYymP2c9MzJDAor565QYo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qhAIJJg6; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qhAIJJg6; arc=fail smtp.client-ip=40.107.159.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qhAIJJg6";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qhAIJJg6"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=L2FDZxAT8aBcH7mWARbs+BKfd8X5r+IJEClWHq5zwB1xOaeBVv4U7utqcRBWp7k3uLZF77COX7Rr2TgxLe1rkN3P0hmUwLWHk27YF9enw7UkRj2f9hH5JtDmyRnT2k773czZj6Sdz1CYD/F/SsHGasQeU1ov5nrpBG3TWmeg9A/wJmRCM2WFDF+EjcV3WBcS2LRk0kfdcyP+4vNbQ38B184hDD2Nzy1XTyCtY06hhBgLmBC21uGOH8KIFqp4ZIhB5bk55wfOLTLYlpgV0ZLfysfC4DgeJRF9Wo+jBah5A50muO333NDiFLxd5dml/qqCIYWrAeMj51JUG08X40XvJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCRHV7bEx6dTCSl/spG6uHZ36sQPa2lh1X5z5mtMnk0=;
 b=apdwgAzpdIKeIHAV+ROXAPEZrzDH/UMko1BfgzTNz/xGaK5Hjk//KiESG3Wpsq3iPQBRasx3PWJIgFciTXD7OkAj/qmD8Dt/msitZKHbWTc+35Wa+juWw+d/ntDoOiE5k5GfGhSBWVm6lJT1fMINXBlc3Ds2Kx5Y/CghJt8uwxCJFSif64QNurXCVRToxeZW+NX8gysDRtdFCEw/PFrWBc3Rk4esFEmkDChcGGAApzdqQrbs4C0eme0uATk66TepH+p+Qqh0xXwrxLGScMc4mDZ9gTrhohAB2JEyy4SpLGfgHxpK8xuGKhNawU8vh7DSvfmC/I9ZLBeHIaxgDcGxmQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCRHV7bEx6dTCSl/spG6uHZ36sQPa2lh1X5z5mtMnk0=;
 b=qhAIJJg6xL5kDX2sFMtK5v6vAw11GGRLcXyAs/kb4bYH5Ku43P63JyCkvUqyuXAnC0x1jmM/gvhfAqBjgEubyzFEcIGI4rTfXMc85AwOf9cMCpRIdEwCjMgfOe22/5WirtCrbcW3dzGEg8XU27k6HQLvoNiH67L7Agcd0Bd/Qpg=
Received: from AS9PR06CA0104.eurprd06.prod.outlook.com (2603:10a6:20b:465::16)
 by VI0PR08MB10618.eurprd08.prod.outlook.com (2603:10a6:800:20f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 10:25:34 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:465:cafe::e5) by AS9PR06CA0104.outlook.office365.com
 (2603:10a6:20b:465::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 10:25:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Wed, 2 Jul 2025 10:25:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xp7w+3pBw5bCeXPAsCqsqs0iKDSGtJe5KdYlySxeeaU+VTF08cqDdBHC791FLY0aOc3LrX2EmtK4UochDgUu33EWBHsLNv+dl7iFJgusgx9uGlnF8OBnG34n7DKEwTjIXavzqMnRkbdPjgSUfc6H5EI4bJ8DJWfCPjrAcEmLeHNn3plqOzki392j8b1pt6QomeCgPNJxjt6A++NSNJoVjprLZY0HPyoGo1C1XdTnJP1TRxue0svFvq3TKnNIWUDSV/uIucVx3/3Noj2y/Wf+GQGXm6U/bB9vuBGt3GlL7QGet4hu+4BEBIYmxte/utwqGcQqi4r1AaozWAgOeRi1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCRHV7bEx6dTCSl/spG6uHZ36sQPa2lh1X5z5mtMnk0=;
 b=vjAtZWtHLAAflHt3fviLIlcnsbEs7VY6mfBvZhelTxOwazp94I+HSfuUX4CcH85bWnBiBiOKHRPuC/Yr6/7ZdV4WsSQicxEb/SXwXLM4a6s5rAq55J0vnvTdT2f6xA/CDOAnQmGE87adkCVPbpQx0YYtY31reyh71grG7PfeQeH8H39RB/ecQdW6r9jASH5s4zmaOAQW/gBepCnmum9ya6xJY/ZMyiRmMePyY8P9OpUl/pE+3D1GGiTyA2He1nAKlHavTSSsD75FGKlnB0mLhl0XVnInAtdqIdZ7e/9zCb6Z1KrAabHvOg3uNbe1IRVoAmJJKBe14t+rceDkzgklEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCRHV7bEx6dTCSl/spG6uHZ36sQPa2lh1X5z5mtMnk0=;
 b=qhAIJJg6xL5kDX2sFMtK5v6vAw11GGRLcXyAs/kb4bYH5Ku43P63JyCkvUqyuXAnC0x1jmM/gvhfAqBjgEubyzFEcIGI4rTfXMc85AwOf9cMCpRIdEwCjMgfOe22/5WirtCrbcW3dzGEg8XU27k6HQLvoNiH67L7Agcd0Bd/Qpg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAVPR08MB9628.eurprd08.prod.outlook.com
 (2603:10a6:102:31c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 10:24:58 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 10:24:58 +0000
Date: Wed, 2 Jul 2025 11:24:55 +0100
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
Subject: Re: [PATCH v2 04/28] coresight: etm4x: Correct polling IDLE bit
Message-ID: <aGUI977Tj9DzKYrb@e129823.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-4-23ebb864fcc1@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-4-23ebb864fcc1@arm.com>
X-ClientProxiedBy: LO4P123CA0581.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::11) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|PAVPR08MB9628:EE_|AM3PEPF00009B9D:EE_|VI0PR08MB10618:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b6a0e5-8831-46aa-0f0c-08ddb952c688
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?tJDpCMcVuqQp0+yOssW6ZhibJtYxpm6tATHjSVZx0VakJWwqWwyMxq5JehIX?=
 =?us-ascii?Q?lA4SegOyuOf8Q3VmVLFibwNnqkbPX8Djj9bkBmKJ0M1Y37x9Dqtmn/isja4U?=
 =?us-ascii?Q?uPnPyhBzJh2xu7tUrjfUOU/dxKRa2/6CRfdGGHEhzUbTz0UND7s2a8dk+VZG?=
 =?us-ascii?Q?fVsyhzyXWmTJ/o+RxlpyDG/3FwLcnjiQ+8XwWgDnBfuABDC4FaCgrV0TrJVZ?=
 =?us-ascii?Q?HQDHFEstEXVFem5on5tBIdeCsLbca4ai9tl0NcuNILDO2RXeZWibgN/y3AVQ?=
 =?us-ascii?Q?RnmvUX8yTNWnGv8SuYmVK7PCO2TuWBz/GYoVQ4009wvKATwRUWtIjVGwHcK+?=
 =?us-ascii?Q?PWWgb3UaPqp52ap4KJCjR2GG3OE+ZQMagzpLsh0PimY/lnQorpVdyHeTyavX?=
 =?us-ascii?Q?vWsTJoR15If0eEXfOTK8de5NyAy4ihAUI50rLi4etaRaU9hdyGLr+oDDbAie?=
 =?us-ascii?Q?ENcb3Gob7UNOGzRSSMHfrbHEXUrIWG1zZooGB2Xa8c8cZM2uWFOLrTL8E+5Y?=
 =?us-ascii?Q?h/L3lNJeCeMUEDwRMno8aXju+X2mwrGYmk5jtWGF7SwYiBobChV/IbqtmXQ8?=
 =?us-ascii?Q?NPFSTPrekW643Gc1pEfazfz8Bx4EndWheazm9T/uQ7MtocKcIZSREj4y9hyD?=
 =?us-ascii?Q?h+7BxGte+8oSgdosVEKZ3mXbCYbzntbbi3HjYiBNFCFCGDCKlYHE/TRt80FL?=
 =?us-ascii?Q?mQ8q1LyVX4ZbaZp4g7T2h8GqCRmzpLg1U6+gYSmLEyFzUBNkESzYAEB+5fZ5?=
 =?us-ascii?Q?bLQ1H09B6gNaP3YdIpWs4YEbo+wGPX9Qo/9oA80JjsMg22uBgkkac7EE3PAX?=
 =?us-ascii?Q?M5nnUBrPQW/m0u1Vs9zuRcgwimPjbuzSvClyRLB4yn8caRpzlwoI2x8Ua6QY?=
 =?us-ascii?Q?uqp6Qa4MdAVw1IFeXqHQBLQuidLiCs3QA70J4WLBKrXXc1p8WJESgtP9wJ8x?=
 =?us-ascii?Q?G3cjMa3ZQEbckFEHr3vLmJlsEheQUuNlLi5IydBvBAsl8lGYYD8k0fMmOLVE?=
 =?us-ascii?Q?WwgSBYkjXEDKlvbx+N2N5SJsvHh2ss5fGxVsvEEmDEuemjjTYNomOfD6Pcjx?=
 =?us-ascii?Q?UtXDOyHKH6Dr5cpWk+69obPz4H0l8YK79u//Jw0y4R6+Lkt2A8y01Y+NHLcs?=
 =?us-ascii?Q?xbQGPzbetzxqBJNE+3PvQwu/up9rV5Gybv3rJ88ea7a5clQW65z8nbDN1hZD?=
 =?us-ascii?Q?Wa7SAk2kPfLi+mD9eXbk7Bfs/OhktzVqz4kc9bRhiEJE8YIMNhqQEkvtrR36?=
 =?us-ascii?Q?jf8urivaj1mMSHSGZY9GBZI6Gv16zqrMTRQj8YfdoToyP67ixHrhOMoaPKYI?=
 =?us-ascii?Q?fp/uoPd8w54Q/fSEhqkzd0FKveyjJe4w+Qa1obvgvWaGFiPORzJ4KYvXhMKq?=
 =?us-ascii?Q?TFowRa1cSsziWSaeF33vpIWVeSs6H6nJPCTnT9wkMzP3818+NzEt9WBHFc6a?=
 =?us-ascii?Q?AEo23LzZzHE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9628
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1fec3010-a1d9-463f-55b4-08ddb952b229
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|36860700013|7416014|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cbZfehF96NIg7GYN3oqqx7Ruqns5m1TfvABKQDcTJVsRrDexdDOxk5aGRSNE?=
 =?us-ascii?Q?K1Jlv9BWBG6F2WgHZ00OGxTypMEf3Xutp47iQpFIm9r0CyQSjS1ysD6lNu7O?=
 =?us-ascii?Q?NsMoLJcQwmzM6a4Xd/wksfvQqqA+uv/EqPWY+fO1e2kNTvxs9JhYdTv8ZHaQ?=
 =?us-ascii?Q?ShSD4ZWMqPbDqjO+mNIKMX95fDY8yL60SwgEcMaHKstmIOpGJ+JVBxbvK/11?=
 =?us-ascii?Q?mqfZAwKOyFKIYN0yuYX4wAfVHxk3tNqZx+FBR19mvOTGMiwhkHE9xYovfW28?=
 =?us-ascii?Q?0whLaqKAZ5j5TXlnwCbTfy2vXVdklE7nrwrRJHHuNd0cTXfSmUx/gfbbGVJi?=
 =?us-ascii?Q?cA74qr//vVQg+UEt1n8JP9trIgY4Tic35gtd2u+uQreFohMkgp7MJKDt+AgW?=
 =?us-ascii?Q?HUW3HFAeoG/DmR/7sqhL74pIJKpsQfMurHjzrPI4h7IX/AF9TjqCAu5WsENd?=
 =?us-ascii?Q?Zq7sKStB5nD7Ddq3duKhFe4pzA0Y3h1vvhxJwsrAq6Awcx+veFtCAu3k2+OF?=
 =?us-ascii?Q?C7jSCPu98ypv8ADbf+4gsDCeZ+dj2MSPJXoj93YC6eZZpDxePD/yklfc4ji4?=
 =?us-ascii?Q?OPT8KhY+KGEvLqZLByaMIV7aOrLaiwX1o1akEE6DBHrLnjsPgg2YTFN99BQP?=
 =?us-ascii?Q?qOPtT5kXBeczcp8w3V8AO42FWQ+WIGgtKK67rnEAx8b+eE9/navgmgjLnA2C?=
 =?us-ascii?Q?lxC5vQ4OwCgahHgjTSEkfA/eexLFbv4HQKcKdBYjuRFTYlaOul0rK10ERLMu?=
 =?us-ascii?Q?p6K36Tc+eRn2Mk1CyPYDkHgIIw/K4M2LYgtKoRNU8LLZJiz364fd0l8SCEIN?=
 =?us-ascii?Q?Egi8ZFGCuwW4+g/ZFjH1Ix4PZ1564ebuzrgcLydhLlbkosaiqiWY2jt42IVb?=
 =?us-ascii?Q?5QLFs04mcjsK8KJDkrh0KKrelgTyldW0e4Vb1H4NYYqJISOc9oCrfSHirSv3?=
 =?us-ascii?Q?pyi1NiF8OjmUeQL16pTcv/WN5uRLWmgG/yB/DDegdtNYZmaOI5PfjV45I/Sv?=
 =?us-ascii?Q?O/CV93ays7Z6j7mNc29WekqOmQhYQv3Q2Y10GbwFdOAMKIYSdw6YCV2dsMib?=
 =?us-ascii?Q?oXhnopRfHDWecB9/SNFHyT6YODLa0N6M5YSebJYGN9bpc5RCCBCW5bOYDYMF?=
 =?us-ascii?Q?v5rh93E+gA9Ii9aIMDo1gxUCqY58v386oLBOVO/ppzHrc/8yZlgmV0wZr5/J?=
 =?us-ascii?Q?LMXpOk2eF5MdvYqNBFOYSDXsRHX3tmMoJ8yDjORWhxkioZEdFTp8+JtgdNjk?=
 =?us-ascii?Q?Mq/5a9tqiVU+vLtPHe5dVqmT8QOs7uCYmNK0O4Tl6jC9QqfuglJ/OWzmTk8y?=
 =?us-ascii?Q?BA/cnhw/43YYUX+8DP4+knmI7ayKdzYhmuH77+xhn+/JGFK+qPxP/RyGnvFH?=
 =?us-ascii?Q?5EAGsC2M01T02Gr5eLxFYkcDKQjaf/m6f82AD2ejETc0h63yU/VNE9LZ/HZN?=
 =?us-ascii?Q?MmvUGZ5+GmIPA8U9JWuJ81I0djD8dWaIHvQdnjDGvi+9lzSOChnUxFKDKu5g?=
 =?us-ascii?Q?QORuHz+EHXYdnW0DtXAHSqGIxhzV44hdXk54?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(36860700013)(7416014)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 10:25:32.4842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b6a0e5-8831-46aa-0f0c-08ddb952c688
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10618

LGTM.
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

> Since commit 4ff6039ffb79 ("coresight-etm4x: add isb() before reading
> the TRCSTATR"), the code has incorrectly been polling the PMSTABLE bit
> instead of the IDLE bit.
>
> This commit corrects the typo.
>
> Fixes: 4ff6039ffb79 ("coresight-etm4x: add isb() before reading the TRCSTATR")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index ee405c88ea5faa130819f96b00b8307f8764d58a..0f2a8b8459c93ca29d270b6fa05928244e0761c5 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1921,7 +1921,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  		state->trcpdcr = etm4x_read32(csa, TRCPDCR);
>
>  	/* wait for TRCSTATR.IDLE to go up */
> -	if (etm4x_wait_status(csa, TRCSTATR_PMSTABLE_BIT, 1)) {
> +	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 1)) {
>  		dev_err(etm_dev,
>  			"timeout while waiting for Idle Trace Status\n");
>  		etm4_os_unlock(drvdata);
>
> --
> 2.34.1
>

--
Sincerely,
Yeoreum Yun
