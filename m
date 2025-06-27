Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011032.outbound.protection.outlook.com [40.107.130.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A7F187FE8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.32
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032204; cv=fail; b=b21BuRDrgFXceHi4kwTL6hqm8myhASlq+XashNf3pn4SNTjGRIyVHGOsdFrCqbGgKe9C9XEFn6q5nzgyXzwf7WCgVqOfJel4D0si6N60eWTPz9P/nvViWAgjwSYdZFrKhqG5vh2q6VraD5dDLeBmdfIvEtSRSL+r85oIh24I/Cc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032204; c=relaxed/simple;
	bh=1n9d4TrlvPdB3O9KtU2LdkSZZh+dOJ8YtUpX9OsmrjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n/rQBzi8zO21FfuPF0CPs9awXZQbLMFOWgZVaSsDz1V0PKDaUyuAMeX4aSiaoebw25mhNdMjIuXKGC2cL+2ERf4AWs/NLjan/ddNLJMMysBr4FfxDQ8oZx9erbnhv6pqH9hpWXxdFOopBWGkOCWte5a7Apgk1v36VrjKRoEzx1Q=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ixij1dIC; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ixij1dIC; arc=fail smtp.client-ip=40.107.130.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ixij1dIC";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ixij1dIC"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BZA/is1olDPALl0l9em56bJrzybKAbPp9yH47DlYjnUv3rkgBRkolv8SPOkELXYbyr6XbHRNC9FrrjhVYujemwaMmDRacQsJJzkpQo5ZBrVz5dYAWbIgIPtWlzQzIiIvHHweEmlRPXASsDygWloOo6HXS++GQEWIt74d4QTjlpHXIA3R84BwnxiXR5NuKx9UMgNlFp+9QH0HYY/0p5R1OV0VN7lrok6j+AS2Y3d791yfQQmjxeCKdrRDFcBka1mtGJva2DRb+W4mETm1QTRsEiJ9HystFdqYk83Au2L/AEmKlfaPU/9FDSxWs1Z51oHp8hEFegxTWrU2oNNwMsibew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJkB+uqtxWbuJoNNM/1IOe5pBXkdaXL6mydiB3RCky4=;
 b=vclkyeIhE1aU1Cy1t7xNqYmrXhXP6Ph0yQQDhgjQe903IRIEo7M9Hkl2Z/qVmbRuNL/J+pVw9qWo/fIzOpU1M6BjbEhv34tWFOJ9ZTqLcnagOZn6kff2HmCroMMrtXYPXscmivBfBf6/2k2bfXOxpIrQpbg+VGfmV4mgr/ZTu8tKtjlXl+nLWolF5SV+aNHkzB4qsnGX/CDRvfn5n/sXhyqfmDzUXCJWiJnO3JYhCgIo34yo3O7l4lukZ4tEKTmSi2XoUzOlvXONmR3tIIqoscbqWfZhLPZST9vZ6YX+R2KND+poTk+hlrxLxXtHjrvrfKoipdqVzf6ashqIQ4LTNg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJkB+uqtxWbuJoNNM/1IOe5pBXkdaXL6mydiB3RCky4=;
 b=ixij1dICUUyvcoPyjQhY41Ku/Uix8McFTJovQvH2D6I5zs1pTFj1tDsHxEUSUJt+bQ/E1l0+prstqm6cxZY5/Vz7e45hkSVVqNuCiTpDLqvqHCK99iLOiaN+ahTb293YB8Y3qDSFbxES2w463H0zn06fa5sd6SIG7ntsnHdZwLY=
Received: from AS4P195CA0004.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::19)
 by VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Fri, 27 Jun
 2025 13:49:58 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::8f) by AS4P195CA0004.outlook.office365.com
 (2603:10a6:20b:5e2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.23 via Frontend Transport; Fri,
 27 Jun 2025 13:49:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Fri, 27 Jun 2025 13:49:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNnx1Up/ZBscn9WbG1wa3noGGmpWZXTdAi5b0DsPxP6tiBukTG9Zr5dENd4gnuFCIcQnbr+ZZolSSfDkb35OwCakeCbR2p9QqmiYnQ63woj6oreQnHgbxZcMUT9Zuu6wnCVYLmWLrsHe7Anl9rGfj+zJC3YQm2xvB0flAANuY1Lxqv+KeH53MNk0lEMjxYpMzmZiK04DN2mfk4+e6EJnnFA51QNK8Ho1ZwW+h77++QLBws551vlqiQadglunhMJeA5roxHsIT8IijOkp6z/FNZ8DtkAhfuk1F40EmbLKIxMB32CDHE3FbBpwXl+vda2TbnU7iCOP01seorwcdANI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJkB+uqtxWbuJoNNM/1IOe5pBXkdaXL6mydiB3RCky4=;
 b=BnXGyDQc3p5+akv6gDjfoG1BXNqUM5epGaXvM2MGOeB+VC64H7Hm9+TeZa/DCC6CvghU7jwEoETxJkZR5m5G7WgO7kLgUa+LZZzLMCpojFVTYLZL5HzkWZBVsbK3ocpWJXVh8r1Af1/IpWHEJuSeZ0LW03Ei8h/7N6ev7BrhRDSGizwldheiJ1UGf3yXAS4Cu0SaSFgp4+YoaYPSfmI5xMASRzX310L7KQvg5w6fMK8YTJwYEDXe5DP753F9Hn0yBurAeE6v2e/QPl6Qv2n1XgiFDtN7zlmuR+vdS1ypCl6gV0N9MftpMfnHUX0x/ADGnMJ7UGrYZ4x0iQxYOQvkwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJkB+uqtxWbuJoNNM/1IOe5pBXkdaXL6mydiB3RCky4=;
 b=ixij1dICUUyvcoPyjQhY41Ku/Uix8McFTJovQvH2D6I5zs1pTFj1tDsHxEUSUJt+bQ/E1l0+prstqm6cxZY5/Vz7e45hkSVVqNuCiTpDLqvqHCK99iLOiaN+ahTb293YB8Y3qDSFbxES2w463H0zn06fa5sd6SIG7ntsnHdZwLY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV2PR08MB9376.eurprd08.prod.outlook.com
 (2603:10a6:150:d0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 13:49:22 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 13:49:22 +0000
Date: Fri, 27 Jun 2025 14:49:19 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/10] coresight: tmc: Support atclk
Message-ID: <aF6hX511YW3540Jx@e129823.arm.com>
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
 <20250627-arm_cs_fix_clock_v4-v4-1-0ce0009c38f8@arm.com>
 <aF6cVFA7NpN2S273@e129823.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF6cVFA7NpN2S273@e129823.arm.com>
X-ClientProxiedBy: LO4P123CA0232.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::21) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|GV2PR08MB9376:EE_|AMS0EPF000001AC:EE_|VI1PR08MB5454:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b0463b-da53-4963-d6af-08ddb5818102
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?jMZxKj2S1i/8bO5qprCGetGEkyqFcpn8In0jRBTK0XW0Jw9afHMz6zzjG1Tc?=
 =?us-ascii?Q?9g9Dlv1QWipZMe0GFi77LU6o7qZFIblU/xIeWEc4P+G0WZ/UVmn8FiJiMLW6?=
 =?us-ascii?Q?szx1RVoGAIT/Xi2MpVMa+3kJXIX33QOxJ7jVp3smqTIxAlOaDIADjLYvelJN?=
 =?us-ascii?Q?0YjCW1oXHmg0U8WK24B5H+f11WZT0aFmRUDq9kOxgaOBaOFboJC9sQqeaRGY?=
 =?us-ascii?Q?MwB59PQxPWk5d2Z1YG+HFJJ3fMBw/EqlizsdrmmGNpByXu8Y1EyhvA+ooIHc?=
 =?us-ascii?Q?XSpBnB7lwGFen6ByfNnC6Sqe+HS0WwKCU6dY3+/0dVIqeyztXojicaZEsH2+?=
 =?us-ascii?Q?WhsjIBP+i2fbFK2s0ABV9TSUDMhMtbiAMkxf3yhUwqH9usrQ2YcGWEKkI3bG?=
 =?us-ascii?Q?57b+DtDGXcxG/6gAJJ9k65k/kx3CGdRKcPc9tTLZsoXrEbPJXv30abJWOOFZ?=
 =?us-ascii?Q?ZZQ0l9qaYuuYgpP/WUu3NJY9DAZ/4i+ZxAMHv0uryNB35fdtdjjLl9j2BRZ0?=
 =?us-ascii?Q?c27dEhhJMyLLkg97tLbNYybOTClQ/vvOhZrc8CE+/LBRDury7aNSVBHM75De?=
 =?us-ascii?Q?fCGtHrEiyI6OJI/w2AWhVP0fqblNAfaeLDz5rxFOUP/o43DQKvbtf5ENN4kV?=
 =?us-ascii?Q?A3q0fD/uFn0l2cbPmPLLliXeUYSnLQQPZghl3+gEEhDtOHcKtBAlWFdU3uo5?=
 =?us-ascii?Q?242KGg6wVVGpZYBsmX87tPVlpgEAasJgxOXBLMVNHdPo1y4Jmou9IB4/Axj+?=
 =?us-ascii?Q?Pa/9rlqaWRY4Gh4mid8j4cBHbPRq0NKOQ+q5uiR/aF+HFY07Fs0zX5TM2gsx?=
 =?us-ascii?Q?6tK9orxmYJWksG9QaaJPTTVoofFp1vWOsB9sY0Ua6gx/jmBa5y17tPKYED2Z?=
 =?us-ascii?Q?Y8RxtPB+N394FEccwyDHxJgdRKgYg6Cq/qg++ddIRaVGClC3bxVY2PJvjScF?=
 =?us-ascii?Q?AzHU14TcjzGdmvLnGoeEE012fmplq+L5wgSlgkItu8HeOjWLVV3s205Y5L9d?=
 =?us-ascii?Q?BN1YJ5lDYV1rarST8MTDbgewgaPV72oH6B1qdYKpBLmoswZlp1x7VO26An+9?=
 =?us-ascii?Q?4CmjL1soADaVMj4NUUjmcPZ9usa+KLkh4ocOgeNgHiJCQsEnZOLuicgqoz9L?=
 =?us-ascii?Q?pZvNkYaYVFZC3soVtp1R7Y6gXeYW+k8GCuzFrviEGy/zGL+MaJSL8ApfkGRX?=
 =?us-ascii?Q?h9jWAlKp26j+cfUR0JpLp3SM99P6GQG6xIyMYciK+BSNx+XTGk9mkdp4BcmP?=
 =?us-ascii?Q?CRrD6ldIXIM6QTtLIPOjPW1gioJpmXiQog6fmRcMt2tQiPeriTdExXd7MRwu?=
 =?us-ascii?Q?RboKd5ttd9+Pok5usRZ/fJRLCUaaZHp3p2PWinoSjgmBgpDSSfoiQKqx8pHO?=
 =?us-ascii?Q?TSu7XY450s+4aY2h3znaQyExjtJ3F6LI/dZhAbougvERNfDsEPq5P0Gu1nMh?=
 =?us-ascii?Q?CxJAjH66awc=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9376
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5dfaebed-116b-46d0-e98e-08ddb5816bf2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H8JkDNUvVAlWOzlcvGMhHO0hfcY6nZ3XAuPTc+YCxhMXaUj6b0RA8FGr4T1X?=
 =?us-ascii?Q?pChZ3P7PmpcBZ2P16jw8D8HQfz7Qx3wrKXiPeFq+aiWrbMGApLxkHRVulnas?=
 =?us-ascii?Q?YdCGk9Y5j/UHlWSEpb5U7Bl9x4+nFg50r3zKc549IGH0HCMZEDR8JEqxyPXK?=
 =?us-ascii?Q?xwJu5TYNrPna69xjb8LeIWgVCsjpK6+k+F0KEFPIG/jGsVZBI0SFpJcY5MjD?=
 =?us-ascii?Q?f6jJsgJoCTrdosVo+70RhDhfg0ezY1kcEaNvpT0FwrHXt9dfEQlKrevPLcZ3?=
 =?us-ascii?Q?y5QLWNoUDE5B7Rk9lhQ5Cg//38gkl2xv+QFspNBAWT8XueWTP1GNJsfS4z6n?=
 =?us-ascii?Q?HAIM5DkePVzmHHYWwIYHPvDGN2kFy8LNIeGArXsqAEh7lPy75laUyl8gBJen?=
 =?us-ascii?Q?GM5J9dST4h52M6upe7Y54u3927QC98R4X5XuR6oudkMwYqzxwUlf+ML6Udll?=
 =?us-ascii?Q?IJh9uw521ZmamehhKmwg5Oa1igSNs9hWIv90rQL7SRWy91JEPEI+kI56Z5cl?=
 =?us-ascii?Q?t2dLURZLbsXWMctrzDn+f0Y706/kzpIMg+YKzy0h1eOTu2A5O5gmzdR+OebP?=
 =?us-ascii?Q?EhWgj/TDWjv/2ukGpjkkkCrbzsE/z5pnm+n0hclVYfw+6A+NSN7YDXeL/bNL?=
 =?us-ascii?Q?ki9dDnoMSEaRnHgAqk91emekI92WIwhnZhVqrxjhauL+SixOVvPdRhrwJL+9?=
 =?us-ascii?Q?1kT3pV/+cf252TovcIvMjEZHhY5pTRcqCiv5MrdPyxpIbTXajrAeBF/xMl1d?=
 =?us-ascii?Q?ij7rsov1+zuxdeoaQeHItRKhDIaUQFrhjuPi15eAREQtLn32/JYd2+f7sl10?=
 =?us-ascii?Q?Lo1/Q65lOECTAJTHXc6JCKHgllKqSbkc2PLCO4A8uBqJoyGbIDJj/KGy+VXm?=
 =?us-ascii?Q?J/W2hsU2RT6TBldkWn/A+61WpEv2SA/s3jubpIIbBjE9Tjs3GSLs+/ZhBw9o?=
 =?us-ascii?Q?xN/3keEF/CqFGHU7TBAJO3U+FvTc9VYkBDnM/fcZXls6XrO6uWLlVCILp1Dp?=
 =?us-ascii?Q?b9Gr+uamBo/xS6mexwn01z9UmdjY+pKsCLyHs7HcYTm8cvC5g7PPVBAiXm/F?=
 =?us-ascii?Q?cssvxmLYC9454O7TDJTcsvH6Jz9WTSXCnyjQ1upzv+4UKFFs1poltRQqtGb5?=
 =?us-ascii?Q?tNDT36s5dastyJwFzNsbneibdBV9pYF+/m0TsusayF+cF2vQE3MvKb8nUDAd?=
 =?us-ascii?Q?HcD/sVUkpo5JOxs4C+SKY+x816hJkmBzDvDUR0YlvF7bnPeJkN99bdX/7tZJ?=
 =?us-ascii?Q?fyTC29ki317pJotWzrnEPCT5qu8sihE8FAJSrILT9hlinMaGPr+j2jKGJdBT?=
 =?us-ascii?Q?EoW/v6PRwIcKthWsqyw+1IbjIERLdnDW49vVaQtxiiTOQRvdR4gZ3+T4OH28?=
 =?us-ascii?Q?YIjFMoBx01L4s37YqOQPOFTjCV6W83rBEGH/dKMtCdtoP3Ah4WanYlzj9dk/?=
 =?us-ascii?Q?pwFNm9TTGwKsnf5WHVNZVr6Q8u3NqyjSq8XFTgV0E3HDPkzbbANE/PK8Lkq4?=
 =?us-ascii?Q?edcvgy/r4D81gq4VGvsoEjZHGnXfeKmPRkwA?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 13:49:57.5470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b0463b-da53-4963-d6af-08ddb5818102
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5454

>
> > @@ -789,6 +789,10 @@ static int __tmc_probe(struct device *dev, struct resource *res)
> >  	struct coresight_desc desc = { 0 };
> >  	struct coresight_dev_list *dev_list = NULL;
> >
> > +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> > +	if (IS_ERR(drvdata->atclk))
> > +		return PTR_ERR(drvdata->atclk);
> > +
> >  	ret = -ENOMEM;
> >
>
> Just another quetion.
>
> If this function is called from tmc_platform_probe() and failed,
> should it call the clk_put() for drvdata->pclk when it failed?

Sorry, I missed the Patch #7.

Thanks

--
Sincerely,
Yeoreum Yun
