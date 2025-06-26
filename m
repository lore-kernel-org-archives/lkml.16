Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA2D38FB9
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750924645; cv=fail; b=JMhD1Ro9t319xdzSpB9HAw0hqqHDC5SgY9c/DDqDIty6wXG2mElFBD5FTDPMRZchK9TrB052K/Aqf1mFR6xOHK2bK+3hakSKdmEUqvho0Ly9ueS5fTbH9dciMauTjLvzwM+HGhfkbJjxCzZqhMyP1La2Wc+Aun8dqslGyoAqP5c=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750924645; c=relaxed/simple;
	bh=0w14Z9HkrYLtiSSjmaOsvX5fSVhVgITrsm5IvTi/Mhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JRlFeWrco4oYIMAsqOU9Ja31E/PiRq/lAmMnwzVXyuimjYP8UBYTOrLfEehth/F1ap/2uSrGyN33zfKhs4LPEM7RIGFr/p6YveFwq1G/JFrk0QGZrEQb33W/DvHriltPdTW7hS0I7IEsP/XWvQp7kaqTxmt9NOpQceq5++JpkAk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dyEEMKj/; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dyEEMKj/; arc=fail smtp.client-ip=52.101.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dyEEMKj/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dyEEMKj/"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OYyVt7BETviNrbFbG3jcl++B8hvusABxss/fFLQNJcO2n8QIrAJtvShU4Ec3+c5XAo8bZzYcXRBX7/2ZK5kixkgbrsc4XPtgEpj8Piz+KJFtGXleM6JZBBO0S/nRwkB0Ddo/x9Yf8+l50fTgOBoWvFJsyWSfdQ5m8fYtAd/RtwKHwx8Jkqg9axmG6i+gy56TuRhXC+Q0FVhN4//DzYtLDCpddeiM1+Uiii9lPgtcAONG76Eh0hflSIozX1BhnFvaPLGBgeGSf6f+x1WK58lTEnTryfBdSna3dI7RVWVA/MosxfOqXjb4d1qGVvV1BEkyhK58uhl80Sa7j3CI2EMBrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZW9dsIGHFJfv/qmJCOV9v0AKtFxYQVqMlAE5Jk6BzJQ=;
 b=Fl9U3XazA+oIcaa7PxrQW4juoDHm7PpkTIPgHVdhe78F5MRBF74x4uYKxmwp+N/Fg+wPTJncHEHjZq1qPLSUVpfYC94RTIwrWKXXWckj8S+gjZSN7s2uPnL8zmZhPs5OfJeBDQbXyDaiTF19Up9981wbYzS+2vVY3UPaX1IAgA3mVhQOMYQ5SVvrWfDNCVx5Cl/AJjtppF+ykhNlRzcScMk1MSRnmrVKOUbRP2QPCcsKifutzkoMXeclxQ0FMxZvMTLKC6zAdrSBuiGb0lEcOoS9Pf96isFrTRtL/xjNaZtThr4rU+yXrhxh/CbMtlMSoVkfbl31NXZzv71QJldNbw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZW9dsIGHFJfv/qmJCOV9v0AKtFxYQVqMlAE5Jk6BzJQ=;
 b=dyEEMKj/nLfV4oGe5w76q6hytJLaEJCiEujmG3Fb1tYw07RzwlMfXEWeoqqYIjlRQoDhI95mysoEkNYsMfMBi1I59aLRtIaExhYmtOozhCDevvMJdK2+JUOZhOIHP/AJtNL5m2Jf7zVHKsYTKmoiD2xIkOObc0/n6JXuvWtR460=
Received: from DUZPR01CA0275.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::6) by AS8PR08MB9742.eurprd08.prod.outlook.com
 (2603:10a6:20b:616::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 07:57:18 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::21) by DUZPR01CA0275.outlook.office365.com
 (2603:10a6:10:4b9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Thu,
 26 Jun 2025 07:57:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Thu, 26 Jun 2025 07:57:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoesTulT5ul63owqE7WCwF9dMJJLKFdIGWJsviCWQAkXSyM/Hd8CgZzXLhbRl2oEmikmM/73hjfYWg7nwZvsaihJsoSAqUJKeJdemRdQHnWFefHAkeov6NsHkQbyH1RMz90PR2oDs+4B592yfz+Qc37iDRqVtnOh4xTL79CAMa5VM4KWSSudg1IFvR3qKbtaYKvc+3FYBs8cQtlJVh0GQ+nJ6IqRewRPlNz8S3Je2DMcv0MMUQt915vYSN1IhczaXmYvWPj5VYY43Un1etXDzz3iQU43of/XbEqGfq5ucp0c429MVC9ZWbCchU7vntJy5Ux/XfobDFpmg1E0VYdXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZW9dsIGHFJfv/qmJCOV9v0AKtFxYQVqMlAE5Jk6BzJQ=;
 b=l50z+eNs2fT3iL1aZMISO07enMdjOChZmGt/nALaMv+jW/7ruXuVFLoqa57npEUqxvy0cj5kQOKxveL198pKl9b5z29pl5ODY6l+I8RsnkU2bX27kQhi8oyycoEJ/jOKApP13qnPi2ecN/mYkyg6WT8WRa3HwZT4h9VS1vhP0eewCz52InJCCm86EJ2KqZE94KXFXYUdu1pxhAUlUbdQC3YcLDNsHF08VQOG2uQ1crj7mjYUssLfUJcxzUF5cqlMZXNZICnt37OGPULmUbBvT+Ids1m0U4eNjLO8Q1v4wFcQtl9kkOPhXehYFCtBGWcY3zKz1KTZtTVrN859pFRthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZW9dsIGHFJfv/qmJCOV9v0AKtFxYQVqMlAE5Jk6BzJQ=;
 b=dyEEMKj/nLfV4oGe5w76q6hytJLaEJCiEujmG3Fb1tYw07RzwlMfXEWeoqqYIjlRQoDhI95mysoEkNYsMfMBi1I59aLRtIaExhYmtOozhCDevvMJdK2+JUOZhOIHP/AJtNL5m2Jf7zVHKsYTKmoiD2xIkOObc0/n6JXuvWtR460=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by VI0PR08MB11041.eurprd08.prod.outlook.com
 (2603:10a6:800:256::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 07:56:43 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 07:56:42 +0000
Date: Thu, 26 Jun 2025 08:56:39 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, ardb@kernel.org, frederic@kernel.org,
	james.morse@arm.com, joey.gouly@arm.com,
	scott@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] support FEAT_LSUI and apply it on futex atomic ops
Message-ID: <aFz9N1Bs6Y5f1sCT@e129823.arm.com>
References: <20250617183635.1266015-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617183635.1266015-1-yeoreum.yun@arm.com>
X-ClientProxiedBy: LO4P123CA0109.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::6) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|VI0PR08MB11041:EE_|DB5PEPF00014B96:EE_|AS8PR08MB9742:EE_
X-MS-Office365-Filtering-Correlation-Id: 2643da22-09d2-46f4-0de0-08ddb4871273
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?UhiluCxDysAmpoTjZ0nWs9CD/1WrIwwa+DFBt5NjgSyLn8auOJ6kry8GCir8?=
 =?us-ascii?Q?IDuUuoOlOPfjBE3uJdhk3MGNEGJlJfCWLA56KEWLiYaiD27MYyqdKINMinJH?=
 =?us-ascii?Q?312vm/hHZ2uAURBhNujFYf18FtTF1y4kBqcF1a9NAEeEb5zX+kS4NnZ7TG7L?=
 =?us-ascii?Q?OX0KK6ErHKb+gCrylCRwi8mDkiHd/mOC6QipRjpwOi+HeKRAFORrFj67clSL?=
 =?us-ascii?Q?OyG81xqvouhAY+RQ6rUvfJfTaLPKEBJp+m5Ffe0OURQV9/Ndu1Ik7Ql4oIdU?=
 =?us-ascii?Q?w9SGF4RBcrDya/1IFsN23SFeaC/ElznkV+zREWY6xdepY7kn2WuSlprQNWDV?=
 =?us-ascii?Q?pexHJ93IyGjcD8S30DRQ85/u3fDs3deCo8KQRu/Dn2eeubyG50BS8jcxV7TQ?=
 =?us-ascii?Q?vPMbmmKugrBflNAZ0hTQ8TJWWQE/DkOYObB6MtefmYUwxkx1r9v6Iheqq3T2?=
 =?us-ascii?Q?duiVzD8Ltg0IDx9nDfiS06ChVciFkm3uijzWzTWfi4DWEJ3qzerKr5kWlFFP?=
 =?us-ascii?Q?yk8BsQRy2zSzU3smhr8Tg4i76J1cqPFRbvm3dmPW3W7IQhTskqLVEGaW5RyP?=
 =?us-ascii?Q?uY/jYo2jdYWBcpvnGDgpyH9Su7ZfEWCQY7w0T29oqSprXJiLBsFcFHhLfLWh?=
 =?us-ascii?Q?lqyjpTauklf8I/piKD9U4mz3GwE6DcaLfGwKUOC/nTdEBRp03hNQJV9moGio?=
 =?us-ascii?Q?GILeq1QBEamQnC94xfCFtvLpHvLZZT1keqMn/DOZ+tCWJvdQA0WtE6/fLTtI?=
 =?us-ascii?Q?KZ4PWbc/9LOEg/WhBsKxH47DlgzqeV3X9/6sttiig1/I0gcM8nq7QkMszeCH?=
 =?us-ascii?Q?lnJ4U1sqEE41IFwd4czVWEb4l383dQTDKKLplWrFxs1JLtLsM1SzuPGoaPWI?=
 =?us-ascii?Q?Eqy5heP+Tnfyr+LDAHyHUWW2DMNI9K8Es4R6wgdjNmo9QPQejPgygEBbWjb9?=
 =?us-ascii?Q?ooO6pmQiSDTx5rrjIFtIyuSa5AHHT7VPyJJNQRpm03vsyNg8wKT5kaPsAbz8?=
 =?us-ascii?Q?7fyxGwg/P4jJxnfzKIWprFKIn6Lwj5WxK3f96maPL4JhoaXYL4QOWHddI9pr?=
 =?us-ascii?Q?vernmUfFVAVDecqJqQ50uwnhPJgMt+UpgI6rIXIyDjf9x8gvzuxNgtJetNEy?=
 =?us-ascii?Q?ClHpGnP56uJ1Rl9TdcyWoNALeGfes3NE6HMf9DFLd23rREa+K4uYrdo40/Wp?=
 =?us-ascii?Q?kz2bCubnZwu86Rstp+DzlbH9Awcq0uXt78HG19fC9kaUj3+GYA4JSBIp81yu?=
 =?us-ascii?Q?EaCwAxs7vVBOz3uWNCx9PSyohtaF7I63oIXvPu4lDKD4kTqwQX4i5NQOn7QO?=
 =?us-ascii?Q?7MTD37b4ijf3i4qe7K67DSJ1vXghnb7nscmJftRM0tuU36/VWRw0e6I7gXlb?=
 =?us-ascii?Q?7EOcgYsgYiU67KeFbAtHsGqNHUv/PVuHJobHBrIwwMbZOW0HlyzhJeo6Aswk?=
 =?us-ascii?Q?qKEQNSQI6lk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11041
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b30e1ff7-3db7-41fc-2553-08ddb486fd3d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|35042699022|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?49EYZZv3J13CWct7GYAn4fzi6Wk7D63Dszi7O9wpHYxV4zNqdiNIH9UDwhvV?=
 =?us-ascii?Q?ft6eYgIT1dmADnkh28NwSvH3nbkHGkhrDs2rYj7iqvZTiHExkB6TaljjDtnH?=
 =?us-ascii?Q?n0qyMt4JaOuyKnT5D0z4wu2H+RKovvh1vZXp8D1KCz/BVjSrY8RRV4xS5Rds?=
 =?us-ascii?Q?nmAoX3T+vfd45tLOPzxwLnEYJsGcS6X7isPOpkrf5F4nHKvB2HDQKK6Y6jfH?=
 =?us-ascii?Q?S2piBFiN6XfTLOfceHgcfHAej0jUov9rb4tcKhbNLFvCprk9POh7qOyJHZGA?=
 =?us-ascii?Q?rtCy4DQDQuHfz8FoLKtJ8K2dXmWi88OCI1hwDH2lrGMKq/BqVz3r6IKYsPJM?=
 =?us-ascii?Q?DGwLW0byM5M54cX60drublkdzGUinzR343t5x7Asbzhy8ywJSw84Db9boJrC?=
 =?us-ascii?Q?6M69w9H5Mz+P95oCXsUCEBurxasbu9NHZjF5eAjOCO8redfUkqPptmTEw4hA?=
 =?us-ascii?Q?HFmGb4d5xgsZfo+g+HQDHq+a7CrzVmYtrZUXluWXheiXF1WuH5m/1kPJNbJi?=
 =?us-ascii?Q?4+185gxYKh6vjwb3MCT7XyK+gqwTF8563ZeNjA6A2x2ZKikoAVhC/mBxkTMc?=
 =?us-ascii?Q?9fMNvSEjadZEOqHvQHH87kRwk+WgYaLKD3TzU7PlfzF0bPIb/yX6lo4HeI6M?=
 =?us-ascii?Q?9/16Z8Mg/yL7z0qXK30E5HtVJvO7fqo85hYtj5n820cdUhspDqaaI0UExplD?=
 =?us-ascii?Q?5WowHuPiXVDGwQ/nXYQ78qLE3hhlWGs0Ce7lWhP8YTyXJUVvaID0DFvzStXb?=
 =?us-ascii?Q?S5ofqfKh20BvXm2YyUUDY5977wkIOBuvSXDyv1Jd0h0htuhKBLBMgSUyEARI?=
 =?us-ascii?Q?oWbIWIl+2nX4V5ksps52OjX5avCIjklthJSAaR++IiMDN6IvdwnUoSmFgjpz?=
 =?us-ascii?Q?tcvxANaTM/yVl21UOSFavvaUXtmB/ghx4BJBQpuTlnBKA8dVkPvidwT+aZHK?=
 =?us-ascii?Q?JZphehxbvSKV6Ar3w5P5f7lsloYDqnWMfzwosipsHhKB1uoCpwHFPKG2hU3y?=
 =?us-ascii?Q?YvkZtm5xiBU0vg9PLQQn6svm74gS+hHXm+k0vP/gJLi+8lcrRk1XgQWKwYHl?=
 =?us-ascii?Q?p0wlJPXN4hP1EbGPxEpRxkU3yd99UvmuJsBL3PmbpU8DRQ0sgs913RvT5Og6?=
 =?us-ascii?Q?EtjjegxISLhDp5Uq0uHdgG+qTVH8qWKxTlb1+rOx8dXpfYpHQXAK+RG72dgP?=
 =?us-ascii?Q?574gbiM4AU84N0YWdcBCZ+gnBm0vmNlHs1TmFsSU80lGAQQWYzrelrsvNRsM?=
 =?us-ascii?Q?IEsnMDitC4vPH9Pc6HBnnwsGC6+CE5+haHWsqzhGKG4Yk08DjG6663v3mVdg?=
 =?us-ascii?Q?0SgJ5aQV9ZvzkcGor4UN3qgJMud9aBEViIShwaxYC0782322PERjjP0ODrj5?=
 =?us-ascii?Q?nOp4+o8oVJORClSgtTuqLtU+5DiYPlFktwMvreJeii9IRbHUOQh1ZLax3XW6?=
 =?us-ascii?Q?ioOyMYeTEBcnRaF9ql3+ICgNsk+XoiBRRxZ9aD4Rrca7u35e3dBXajNUl6vp?=
 =?us-ascii?Q?Awo6kUhQVOvEsOPDFzqixnh+dyudugELIOt73jFxAUHO6NeFnut7bzduaw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 07:57:17.8616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2643da22-09d2-46f4-0de0-08ddb4871273
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9742

Gentle ping in case of forgotten.

> Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
> previleged level to access to access user memory without clearing
> PSTATE.PAN bit.
>
> This patchset support FEAT_LUSI and applies in futex atomic operation
> where can replace from ldxr/stlxr pair implmentation with clearing
> PSTATE.PAN bit to correspondant load/store unprevileged atomic operation
> without clearing PSTATE.PAN bit.
>
> Patch Sequences
> ================
>
> Patch #1 adds cpufeature for FEAT_LUSI
>
> Patch #2 expose FEAT_LUSI to guest
>
> Patch #3 adds Kconfig for FEAT_LUSI
>
> Patch #4 separtes former futex atomic-op implmentation from futex.h
> to futex_ll_sc_u.h
>
> Patch #5 implments futex atomic operation using lsui instruction.
>
> Patch #6 introduces lsui.h to apply runtime patch to use former
> implmentation when FEAT_LUSI doesn't support.
>
> Patch #7 applies lsui.h into arch_futext_atomic_op().
>
> Patch History
> ==============
> from v2 to v3:
>   - expose FEAT_LUSI to guest
>   - add help section for LUSI Kconfig
>   - https://lore.kernel.org/all/20250611151154.46362-1-yeoreum.yun@arm.com/
>
> from v1 to v2:
>   - remove empty v9.6 menu entry
>   - locate HAS_LUSI in cpucaps in order
>   - https://lore.kernel.org/all/20250611104916.10636-1-yeoreum.yun@arm.com/
>
> Yeoreum Yun (7):
>   arm64: cpufeature: add FEAT_LSUI
>   arm64/kvm: expose FEAT_LSUI to guest
>   arm64/Kconfig: add LSUI Kconfig
>   arm64/futex: move futex atomic logic with clearing PAN bit
>   arm64/futex: add futex atomic operation with FEAT_LSUI
>   arm64/asm: introduce lsui.h
>   arm64/futex: support futex with FEAT_LSUI
>
>  arch/arm64/Kconfig                     |   9 ++
>  arch/arm64/include/asm/futex.h         |  99 ++++++-------------
>  arch/arm64/include/asm/futex_ll_sc_u.h | 115 +++++++++++++++++++++
>  arch/arm64/include/asm/futex_lsui.h    | 132 +++++++++++++++++++++++++
>  arch/arm64/include/asm/lsui.h          |  37 +++++++
>  arch/arm64/kernel/cpufeature.c         |   8 ++
>  arch/arm64/kvm/sys_regs.c              |   5 +-
>  arch/arm64/tools/cpucaps               |   1 +
>  8 files changed, 336 insertions(+), 70 deletions(-)
>  create mode 100644 arch/arm64/include/asm/futex_ll_sc_u.h
>  create mode 100644 arch/arm64/include/asm/futex_lsui.h
>  create mode 100644 arch/arm64/include/asm/lsui.h
>
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

--
Sincerely,
Yeoreum Yun
