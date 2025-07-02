Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD6D242D98
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.58
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751449785; cv=fail; b=LEYpwgxV4v/nvuks1qRTHG0XvvOPYmiu6FULpFFyQxkgguhGLHdrMVkcmuMn3RQt+xGXIsZuAlAfBt+u5gE3skTAys2PB7LmEliBNmVkikAYw+XZRe+331Amj7UnteWZdu+mH7Lw9agSEXs9dbNaR9aWB7lKNweZCEV8FtLMo/Y=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751449785; c=relaxed/simple;
	bh=ycxaJccBudLlx6MbBEk4MXQhG3jisjq7ywJCGThu+Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oWgdhuz3wmJUGXa2Jtt1OFZOGT7SWkGBFGkHna46KJytbAH4bDhDW3aqQd6dfoEej+kTo5q+Z8aGMVj7qrCzozWVpuYA7EGvf4PUnrc/qZ+8sNY8Xh9oIj7FYeshK8f+7r0u2oVrEhFhynH7i2UkOukNpErM6bnRF2vY02BV838=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TxhyFg8M; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TxhyFg8M; arc=fail smtp.client-ip=52.101.70.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TxhyFg8M";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TxhyFg8M"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ezv5GH25BrvN6FQUC0ZypEwRW4LC0uiHXWIoUeXpmyAMDYUyvUUtkD45eJIzFLnXJHg1S3wz0Ff5RpML/QZrSzKOzMZBLOnGXhTcJcbEcTThqwT80gGpN06kY/DMkDjoNwqRuNCUt0wgvKgQXGKYzbEIlAblUsbiMqFCHGWGzqK5mBy3D2RC1xLUPzbwqQ9aKUP239qeIWWeXtyqp8b7H1g5rcemgvdEHG/Nhr556yWZmFK9PjM83V5SrNpl/MBZTSP+DmlnDNy8DWQeAfSHgIS8BhYqn1mHKZ+DQpyuhpsrxj+no56loIFlPH6b0ssTyvEENsE8L9Z1VJv5DlgraQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18ZHPFZFA6tSd9dBtj/PrJETNCETC6W91tgrLA+a1ks=;
 b=GwnWiInNz2/vo4XF+tQCO6NTNOUmbFxnxtUBlPUAXN0edy70SGISKsNweTSo92AcrZsPkiviGSXuGoufRPDxqnMZiOhce0/pjma3tVh3nq5GBDV+a7RdZpOEiXSlA5GnvDulrAM/Dc48mXzy4qo9Lqfu9qjmLaVzb5S+loGry/U6pC0QELUm4CwqX/BVrEK3w8b06H0X4tH1Ux5dx0knTyTraFbBIH2bIYFs8eFMkCh8vzGJP6kGMR79MWKKS+2fGkaUz+4YIvE7shD8/cx1mh+TI5RBsoTNkdGKffgK8kGD5FNEBHfu5O9aCmfDgeGa+krSwiZm5DqQsodD+fmAJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18ZHPFZFA6tSd9dBtj/PrJETNCETC6W91tgrLA+a1ks=;
 b=TxhyFg8M2EoaB/OzIcELsK+RTxW9xvgbz8KEnLM4iXnZo5xA+fRENCdHTmG+Quzwe9e0UUVgmY8qmsyE/zg3rMoK0xD2CzDFyWt+yBqbggnex/uado6wlCHGYizAv+hTdQDoeC81/xwizLMmohv9D0EjrzfMe/5JFvLfO/9vWSg=
Received: from DB9PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:10:1da::26)
 by DBBPR08MB6233.eurprd08.prod.outlook.com (2603:10a6:10:204::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 09:49:39 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::ef) by DB9PR05CA0021.outlook.office365.com
 (2603:10a6:10:1da::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 09:49:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Wed, 2 Jul 2025 09:49:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAFF6DGRKnt+IEwwE1kvE+GTvCMmminCfFlswcWeiVZdnAiMRFfEuy2JgLpf0aqIFfQmVUiPARGQaMKEOvfbmkuKFuUdLt4la+nf50OzArP2KkgJVrTCbBllZ0jiLjJPOVjUwMe+FaVUdGIIy5ZGm0aD2xuiNOFTO6VYJOtAaUv0pFdh6zR8ykSIpL5JQqXl7vxC68puBUfofhh5bwnOmSO6DefGAyU1AatXR2xBjFlb8uAVVspppi2+RgzRaWX3JgHaYomOha510mXaxTjUwixEssQw+7HABRGxdtMc3ac2ZoMJ4r6rDWyO3LnlZONg4yig1O+1xSsL22FMXmK9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18ZHPFZFA6tSd9dBtj/PrJETNCETC6W91tgrLA+a1ks=;
 b=i6CJaGwevIHzSDCBH6G82F4sUfy6D7Z0UxR/Vb2EKMDHFk3V3DyQDd4HoDzKsUAR6nKkST4AkUgsK0Bj7aDsM5nhq4wqGQ2bNsk1W1OB9rDFUt6746eI+MAD1B0NL0elJQ89v4orEm+J4vYGDGOcG4o2xoCnzpieQINrtKL7sOuxtoWaW6vQW+vT1+6tvS5+VyT3QZfHiSF1c61hnvtklbzqEWEZJympwynABbTjHrBqMMJxdRrWsXOuxR0V9smsJTc/C1/WkeJc2GjEdTuKwgJBr2RXxoVEgpNLvqJaNWualooKzVr4+mTMU8MY0R8kzFXogibRasUSNI5f3k3Usw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18ZHPFZFA6tSd9dBtj/PrJETNCETC6W91tgrLA+a1ks=;
 b=TxhyFg8M2EoaB/OzIcELsK+RTxW9xvgbz8KEnLM4iXnZo5xA+fRENCdHTmG+Quzwe9e0UUVgmY8qmsyE/zg3rMoK0xD2CzDFyWt+yBqbggnex/uado6wlCHGYizAv+hTdQDoeC81/xwizLMmohv9D0EjrzfMe/5JFvLfO/9vWSg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by VI0PR08MB10970.eurprd08.prod.outlook.com
 (2603:10a6:800:256::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 09:49:04 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 09:49:03 +0000
Date: Wed, 2 Jul 2025 10:49:01 +0100
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
Subject: Re: [PATCH v2 01/28] coresight: Change device mode to atomic type
Message-ID: <aGUAjcZ1elCoJ+KU@e129823.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-1-23ebb864fcc1@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-1-23ebb864fcc1@arm.com>
X-ClientProxiedBy: LO4P123CA0241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::12) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|VI0PR08MB10970:EE_|DB5PEPF00014B96:EE_|DBBPR08MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b574f9-656b-416e-2f68-08ddb94dc310
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?2JVdjoYq3dZltdXukffjAFGeirunKtoK0o4xbHj2lWafgpmsS9pS7vM7gpkH?=
 =?us-ascii?Q?4ZselMo+MRMwndb9Fjw1ev3BYJ16WtKb4Eag0drvymM6muRjtxRFC2jM0HwC?=
 =?us-ascii?Q?n8OclXql4Jhd4KWr0U0SQTho6xDyJ9xrQ4cxXNqLsYYpE5vy1rkQLLmiVj/7?=
 =?us-ascii?Q?xHjVTokT0+L7wWE8Er22/+BBaxEntnlejRzlxByn8FAYvaRttKfnlbi9d39F?=
 =?us-ascii?Q?leMVZlWB91yi7HgCoXCvrSniz/hgimtiZogaHmVcqFJPtryVUhWp/Y4V9p9L?=
 =?us-ascii?Q?EVLWW5XozRzmAHbGzRfTuAfYOFT+LrVQzYjuy8lt2ssBZK8xL4ygwnRFD4qF?=
 =?us-ascii?Q?TgalRhaiezeMEMxAkXtNHDWRw7YRzz6aLhmwMtk3UKzhi+CdyfW6TvL5ztbo?=
 =?us-ascii?Q?sw1AtNCZBdWr9tHBB1wRgqUhqHugsYxDL5rV73IDfXrUya2VhP3z57aUcUXL?=
 =?us-ascii?Q?yd33UXxANdid70ow6QJ11rdWsCXEWpzbQshELzyUXqf6xQzPJK/GIKGOQXex?=
 =?us-ascii?Q?SZsrBTbz+2ibvuOZ07PopevT13bqMzwpa0fCMpPBquIQ50Pqqy4sJzGrRyjC?=
 =?us-ascii?Q?MUJeGs97QJ7etSdfq4hdAHGazGeEh1SNQKdwggj+9M0FftMSorwpfTy9yAg4?=
 =?us-ascii?Q?kJrjDC3W1UtmnDnNOP0/mH/nx3pdVXaT/XhM604N1aJTuBqa6nZChgT4TL5l?=
 =?us-ascii?Q?JWAZF8qMiocnosuWUzDRzzG3vBnsTuK+1eZC3OV8r/BUGvJAaYgcbzhbg0xy?=
 =?us-ascii?Q?eTC5CO/sIUNEupXBhfLQb0MAyyG+Wx8fXOE3ocKyUdexpsWwfanlqpvZIfBA?=
 =?us-ascii?Q?b3aY5eBlityHQbuLqKLHLrn+++Zjg7QPFXLtT6holjD9gi9B4Jbm+hKZfjPR?=
 =?us-ascii?Q?suBeisbszenf9ydloJ4pP9yskBtYRPJUOlOx0J+IYhYgj6FbTBVa1IFqh+U2?=
 =?us-ascii?Q?+PCEQS6kFPYuNWluqUS5CX6fG4uSj7cUcprXBimnX8S4lHoQd+nJpZoGovt2?=
 =?us-ascii?Q?89z+GWQMqBIBQ8cb+Uuaxuq/5Ly3lXgQXbtgwz8QPa9ZcOfS1Vz1qaVzgRLF?=
 =?us-ascii?Q?5Cza10YZ5E8wQq6RoaRe2S4Sa9o22p/m08sR/yxw+f+5V07ZdhiCQYZzPK5L?=
 =?us-ascii?Q?JmwP/dQFuvuWi4O4k0mvJYFsaUjl5T3XGMivThUCQMIK47zQgtd52RNG7yAs?=
 =?us-ascii?Q?JwYOZKjiVPZHeRDtrWSWsV9QruPeXSZztKQnq+SWmQ7DdoVOhGukg/g0/qp5?=
 =?us-ascii?Q?I1YlhC7ez5tFm2eoE9e6tsU7tGsHr/ZvYZ5WQMUus5Ua1ALbDru0aXJs4zh5?=
 =?us-ascii?Q?b/FTl1LlK2D3x4HDx2prBNJrQUaL/qxt/45/ak/g2tbdGfnHGLSLipIh7W67?=
 =?us-ascii?Q?9dg9FBWhIBK6SkNZcXKl5yOP/Qoi5od6zJtZIffHKk603NUqSg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10970
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	148cba2a-c281-4804-bdf9-08ddb94dadc8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|36860700013|35042699022|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zP/9jcCx6eUj3exoMDdsoX0lNwo0w0/COwQw5Zin8drtbZOSkrmvnc5NVkYX?=
 =?us-ascii?Q?zSrH/GQ+wh7B303DdjF5YNbIA03HzmpEx/Setv1d8aN+qnmcnBJv54ll8n41?=
 =?us-ascii?Q?Iw5XE2/kHaxdAEw35y44acNwbNyklyhQ71sqv2wR4DESgCR4n/vTMorj6UMK?=
 =?us-ascii?Q?e6F1E6BGRX8Jn4x1Yl12Hxn2j4lCSy2tOPmfxA/W7aIsOW2OD9ER7OFdKVn/?=
 =?us-ascii?Q?Y9C4/A36kAcKNFNNhUFYohRWD0QOivW8ZxkA/Ul+55cgNIEDXxXDJDXyF/oX?=
 =?us-ascii?Q?sN64gEEG/ePPIiNrGCBjoakQ4MHNNiO2Ids5R7rGEupa7fJElvBn55ZUcaYh?=
 =?us-ascii?Q?tpJ+P1RDnPE0G1VpYGHlqHqHYZB2rq3P1gmBiQmdZk7QRfKjWJiRmgoZgM3+?=
 =?us-ascii?Q?LpJAwLSykvPjen/ik0xcYOOy6qYry68zsiTeLwQUkfYOVBt8W2a2+I6v2i+X?=
 =?us-ascii?Q?61LXVMi1JDt1ywZhIyTrLABgaG56XspyMtINHCEgS8AbRsRxu+ObRSVHoXBy?=
 =?us-ascii?Q?CKZNRI96L9nundq1TQ1cI81UMeIfSq27kX8Joig3m9q9bdY4I3/VPDrUY0X8?=
 =?us-ascii?Q?3ziHajGvI6e2VE+syg9cycVGsXkWKHLKeilAqMJ2aZl4BJecTM0j0SSgqSUJ?=
 =?us-ascii?Q?m/RnBq2XWle4dXjnon5I/k0n1Ik7JryPxIim9UFIYVTyf71nyxcg9IXFosYQ?=
 =?us-ascii?Q?MJZBMiKelh2zusBQOxJmEBJ6yinIFMF3Jzh80+/ehEnqI7jbB7c62ZQkl1Bk?=
 =?us-ascii?Q?rphtTGuMp338CSvExFJKl0A7OofPyGEoURBO1GCf4Z6KY3IZba4qBHoa7QXD?=
 =?us-ascii?Q?RdKPTLU0JeAu1vRd0+bHoUfxm9MQIPCosqSPokIvt8XYTf+z0YucaaNXIKhd?=
 =?us-ascii?Q?FcpxK7ukze34ikgU+hK3QJLzY+JWeGhFRATAic2NyGLS3A1HVVrntyWYRhYW?=
 =?us-ascii?Q?S3ljNqWvHYtwvb4rsVFVb96tCAASoiKNYHN2Lt9jEEpHKRxO4dT5QvzTfr2u?=
 =?us-ascii?Q?VT3cwQFXD5u3PjtPtiSZ89qk5Q+1AFX7ChdYri02QTLsAVvhNdSDZkzoJ98i?=
 =?us-ascii?Q?rmFnPdZL7Wv1UrFEv8vog+zOpQt1ePbu8rE+hoTM/odZjVMUrfj5KiWFt9Hi?=
 =?us-ascii?Q?f/mpaRM0n0S10ymWvT/q6q91I2dys4eWRp+Cxsmx4KMkQf5X2kMOmKFB182H?=
 =?us-ascii?Q?XY6eHWmxTpjvdVfI7usTHjeMu5PJc4OyWopY7nQSwJNpmofZQYYSFM8s0TdY?=
 =?us-ascii?Q?6k5RYSmQcJQaQqeX+HN5klUfowldiFb7wVOtt/zRuGVDatb5vKlmOLTsJLvE?=
 =?us-ascii?Q?vodVTVSxseBXdx7zTm/geVlk8mNtRcX9pgOevALi3Re+tsosUAz1r8d+aPYp?=
 =?us-ascii?Q?NjCQ2D1U2vShUXOsMIo55K1C9INwN4Bxfa8p07750pRmB6DeR9wb8NQEbKdX?=
 =?us-ascii?Q?ruST4Hl9qoa9uuOFF6OhBLnfBUe+Zd8uFkqnl5s6Ygi1szU/NoYaoBssuwKr?=
 =?us-ascii?Q?U2UgT6dv66c5pt8d/tFn+GDI10WMU2+T3QvJ?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(36860700013)(35042699022)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 09:49:39.1735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b574f9-656b-416e-2f68-08ddb94dc310
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6233

Hi Leo,

>  {
> -	return local_cmpxchg(&csdev->mode, CS_MODE_DISABLED, new_mode) ==
> -	       CS_MODE_DISABLED;
> +	int curr = CS_MODE_DISABLED;
> +
> +	return atomic_try_cmpxchg_acquire(&csdev->mode, &curr, new_mode);
>  }

Just question. why is acquire symentic enough in here?
before this change, local_cmpxchg seems to use full_fenced.

--
Sincerely,
Yeoreum Yun
