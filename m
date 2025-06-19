Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011056.outbound.protection.outlook.com [52.101.70.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAEC1624FE;
	Thu, 19 Jun 2025 07:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.56
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318811; cv=fail; b=sDWHdMJBWvYvwhzwW8PWFv19z+gJlOsrIMd3oG7ayup8N2WE83S4dCFY7TpbpwysgJvDznZKsXNAgMRrLbGAxl/BhUY0C1oPVDTs20vOrwK+ZbCifDWCgGbiLjHc2ejMpSUbMklXIZPlFOjRWVuWXD3L7mkdou1IQIxeUcoM+Eo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318811; c=relaxed/simple;
	bh=6HGqcYYxcBeZ5gLPxAnlSxIxzs5J/WdtT3f0DvfuiaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hUSrpO1BInRLigxe1vZuEjagjSK/WFrFP7SEzIHTtBHlv4jW1BfurxCBQPNsSECyxu6bzOkYUVIlzhmAb156KjG+DJeoIo5+3HM+YhLzUxYMhFqpGu5BklyGrHfNKxGXFETCluuKoXygFBemyrU7N5YhL3vY59cTFw8S2aQwhkU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QBMj7Hej; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QBMj7Hej; arc=fail smtp.client-ip=52.101.70.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QBMj7Hej";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QBMj7Hej"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=X49AYLgBsJ8/nxilWczzm3BZjg4Gme+ULCQUCD4Qy22Sl2Lvsm3XLr213jI2Zss4zETxnvHG6GnzKsT5SQ88HE+4mMI7ZHDBnPDLPSXlNVRtVqcQIMF6pjxWQDQ5jgpW+reLv8NDkGUxnubkLmdXf7a6t/daWBA0ljIivey5Xj3J9RbUuYxGlL49NEDE79p4IQuhxw1Lwny+stAfkmovVHsvr38HI/uW8Cl6c4dksQiMKMwZlACaQBzRdFK6rxjl95iCwzTXY2g67WCpyXJHpEZWuOlYzvCw5U9nJusUlgyMF01hvCOtKR57XWruceKGoidSuV7F+5jcF9wTkNEIJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4L+JIDJo4ogdaiBIwnreIDrKD864ym0vhnjEyldfag=;
 b=qyIoEfSAcyxcVmfywP+5kG9BJ/ZV3EC1XyrvxIkrxJ00hVKLbJN4DPrz7rIdCEKBnbMkuccChnj4UfM+Zf/f0VPVx0RUoNzs4Qmw0baaMmFdYgeXLVpg2rwPGx1XcJU+SW4EE662FNHFHLc+gTdTgJtyS7cf1R2KLbuNlSrelPvHkubX8DzdTngTAgtJASiLJAy2vEDoKBcjNhT8GKyjPPfBRlySRsSWfY+W63/QRlQWB/yaM8Wi7C6wQnwTyOJqCR+PIhK07CYuiylAC6W3uL1Mhn2g9VvHicm/o3p+7UHGROvHdvea9aHhmtU5rwsrjA/m8ngUraoeM1yULd1/4A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4L+JIDJo4ogdaiBIwnreIDrKD864ym0vhnjEyldfag=;
 b=QBMj7HejNTPjidhUF8iDOcKMLdBwVl99HoAaDBLtSvGgrSmlz4N+qtAMC4lPUWwVXXlxd0fi/lTFoIZlgQQv1b23gtvGWn2EeJ3ADjA9N8RkffYnY1xzhHRR0U1RpVqfGYRnMHMK/tDOqMsPULG460zYRqfEkMJaRQe8jlHKnsE=
Received: from DUZP191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::24)
 by AS2PR08MB8717.eurprd08.prod.outlook.com (2603:10a6:20b:55d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 07:40:05 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::c1) by DUZP191CA0028.outlook.office365.com
 (2603:10a6:10:4f8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.35 via Frontend Transport; Thu,
 19 Jun 2025 07:40:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Thu, 19 Jun 2025 07:40:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPQbHAAsK6TviESFpEKeyItsRI/oZZoLFTB3r6lpy5TdJOR6+i1P1CENNbJSGcKlUNs8odc6WCdcgj0FeoEdm2D4wU2fV6R/LK1/WeIm6AGh+wS1Hh4B1gcJz+WO0YbHPHVWRdKXqrS44QuFDHON+BfcNaVDX6vut6hUI3Xb07tm32rkiBRS+8f22CswUCGZ4C4rnr+q0TG5KpdbPgzO/rS25tKseNEmC5K/pQdzN2hQA3ZKlZADKTYauwSmGD3fnxwVw17Zf7BM6dg5n+kzOa2mkYS57mEuhVV+mrB1F3O/NWpeuyqip65OYzOTpR8172P4JZdClrFOIoCXyjapuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4L+JIDJo4ogdaiBIwnreIDrKD864ym0vhnjEyldfag=;
 b=MjSlwkXvUkRGRAOfYEg9V6fJZGOYVuQxzfhmTj/E7ymD00IuLLgBecvhSmwP3ocooYEfY2TKVjhrWZNshjIxHFDMJ96MNrb6t/VCfuGXt75iEgXB/VnrqOUvqm204qkLc4e77gceQu1LO4I0XcSQObcuQZAdOC/H2zrZpcugZnz4JudkkAdE4xbpH+s4V0f2Yt8JO/mp1Bj6gHU78DqLGgyoZe+woZd/+BUtN9b/AcejFWVIaM2AqX1uJuVGllJo6q94KikhCk2BEtZhVfVS9Y7lUH3WEZdlYdX904+VNvwlz7SUdnI3soZjtuZA4TO/9GsrDajyv0HLsYoBgWMYwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4L+JIDJo4ogdaiBIwnreIDrKD864ym0vhnjEyldfag=;
 b=QBMj7HejNTPjidhUF8iDOcKMLdBwVl99HoAaDBLtSvGgrSmlz4N+qtAMC4lPUWwVXXlxd0fi/lTFoIZlgQQv1b23gtvGWn2EeJ3ADjA9N8RkffYnY1xzhHRR0U1RpVqfGYRnMHMK/tDOqMsPULG460zYRqfEkMJaRQe8jlHKnsE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS4PR08MB8144.eurprd08.prod.outlook.com
 (2603:10a6:20b:58f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 07:39:32 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 07:39:31 +0000
Date: Thu, 19 Jun 2025 08:39:29 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	broonie@kernel.org, anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 03/10] arm64/kvm: expose FEAT_MTE_TAGGED_FAR feature
 to guest
Message-ID: <aFO+sfuxQlpXtGvH@e129823.arm.com>
References: <20250618084513.1761345-1-yeoreum.yun@arm.com>
 <20250618084513.1761345-4-yeoreum.yun@arm.com>
 <86ldppc86c.wl-maz@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ldppc86c.wl-maz@kernel.org>
X-ClientProxiedBy: LO2P265CA0179.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::23) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|AS4PR08MB8144:EE_|DU2PEPF00028D0E:EE_|AS2PR08MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e655c3c-e031-4344-1b9a-08ddaf0481b5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?uLcwWHAaJiNKG3p+FJQoBZf9pDF5jbP10z7lUg7Lg3+B0BftsR8KedG2ZpfZ?=
 =?us-ascii?Q?DdXttuccTvduDJ+JlqkgQwb8cEUkvUZj2UgOTR9FCHjl699B0q9S1FkFzQ22?=
 =?us-ascii?Q?fI4cCNXtp1EAbU04fTcyLwym8D+Xngbw/dsLZFkTnElUI6jc1kjDDvCVmZSb?=
 =?us-ascii?Q?PXCCJ7nzorrOqIp0XuwOr3ywxKiiQKKpGBj/BNvujMFfK23oHy2PeVAKjWRd?=
 =?us-ascii?Q?fsYjW8+xX6ISitTbtUBq050ZKiRErFdWc8KdHwnorLIMwI5/aX/CpGX+Sb6t?=
 =?us-ascii?Q?qR+wga6mFPEkl8vJQRzUAYRrXqsD5R2zxn3KcvR8cQXNj2ih0uV0vXF6rMGq?=
 =?us-ascii?Q?w6zIGn+zAtVwx5DHuezgDzKW2VfFUSbMGAPk5EOZr34jY9jz3YCbo3fQN1Zg?=
 =?us-ascii?Q?ZCqoev9NMwACxLLMNUS5ARpRys57aG4q7yLHWOd9yw/ompz9+4BhchYILCBd?=
 =?us-ascii?Q?8CEIDTozdd//x5W/sf9+ighuceHh4NGDEkQcPFFpnHeV/AC6e0YDPXHq4c1C?=
 =?us-ascii?Q?O64ts0dFApjjM9Ny4RyeChKyjcxR/66wYGmKMYpo4moYHwxaYUJa7Lw680ex?=
 =?us-ascii?Q?pBRV+ZuRTqkcfqheDMOwnQ81PlpANbr/WL1G/+20L34lr/u7BmJyBr6auq3y?=
 =?us-ascii?Q?WQ1HBk3rwCjBvEpDy3rsJ8RCMESFFS5i4KnTvFlzwbKjMn86rwgege90iuxt?=
 =?us-ascii?Q?4BecfvqG2mGxb0Rsut9PdeHNaOJZ9TnQBIkEg13DnZd7eJpj9yhN4LRj2jiM?=
 =?us-ascii?Q?9Q//OrasKg6bXgGlliSs3wdsO8ZTJfTUsOW4hUycX5aGjkKvcSrT2C1sNCbn?=
 =?us-ascii?Q?DuRbxgMIXxu8IX9TQttpByW5aHISN6SfZXbUkY6tojsk16BozzeMaGcT6DXs?=
 =?us-ascii?Q?Q/JqxyxdkI1eVxCjh+Ub1gKvLGRmY6+AD/Gk7IxxnXRMVOo5OO2VdXtCwW1A?=
 =?us-ascii?Q?60+7sWyPMFnuQ5ZX3JWX6PrJL2RQtJlsuDW9hBZAvMjcIS7GsV/M4UG8C0ag?=
 =?us-ascii?Q?PCutcOPXG/gGm4hzQxea6uQpNpxTY/h00CrfP7RQndTMwTVuRi+2rQxMKN/K?=
 =?us-ascii?Q?BSysKrNg9BzZed6KOwo0xcq98xQJP9Um5MM2pXJom1yPcFALA9apMN8YmjoQ?=
 =?us-ascii?Q?P6KwbYdtDo9stIBwXa0lwwMUM63eMLs8sQzLqoPRgZI2ycB3vqxsyBzA475K?=
 =?us-ascii?Q?/x5zC7WThKAkaWX3y/k3vOytGqD39BIA7IjSeU2S/H/8P+iPABt67oto5JMD?=
 =?us-ascii?Q?plQFqZead7hj0jUay8XTCApCmdOWeo+fAEMZ6gM2/80R7wIrqSgYrmaSYOmM?=
 =?us-ascii?Q?PziAzJ66lp08fTpLeO+whU/JRwgTCr7oer+dflpoMAn1fCMremDw/hN1uRI4?=
 =?us-ascii?Q?q5un5K9EbFwlIlFU4zt1UOLmi71hQcAKqUmR0Fz3Ofq67nqAK6WCqx+7O4dv?=
 =?us-ascii?Q?ZaF12sOUfhw=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8144
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7931ebc5-302e-4492-f5d9-08ddaf046dfc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gut5AHBUMJmm2NSURv+4KnLWbEpdjUUPl9Rn8b8ND4FpgsSaKPviBox4ug52?=
 =?us-ascii?Q?VpvpetntyBkqU0CL0J9LKZQPgVHXNHOU02CUULR1CYyAooLUp5QntGcznK4O?=
 =?us-ascii?Q?Z5C4k2DUu3LrzY2an+PTRo3PRaIWt4kRDigTC14mP9NE1PWUDkk67is+AD0c?=
 =?us-ascii?Q?lhCVQWn4i0BgGTUEWRF9H71GevIXArg7DbnOLmjUhwOdaXlWc/OLIgua13kO?=
 =?us-ascii?Q?oqGY0Zkedhm1wOeyDisv7szp60pHPrFDO6jXCmWbLT1X2hKYJa6ALa9qp1l0?=
 =?us-ascii?Q?rJ6ABHOuNhdMxSz85a61Cy+cYSQWkKhcErnTlepsBQOnqrYG1d+SJJhvmB+E?=
 =?us-ascii?Q?TtKxfnbuQKwIOxDUwfURjba7BOvIfk7Sc76v1FiD+LkP9oQ2go5QvPF7tFv0?=
 =?us-ascii?Q?jCxWoiG6HZLxGLInBvFbgGMeEuJ/+ehMghGcy65xapzAFZQkxB1UTELEo9hO?=
 =?us-ascii?Q?//gQWjcsvnHX4Q9dZi+KGE16LG9MHkgXUd3dWqfvdP6mmJCkZStBExnnzWXv?=
 =?us-ascii?Q?lh9u9QwdC7GIg9hn6SdDM2aHpRGS+qhqORpgk4We6I1nXGSMa8U4gyXwAfob?=
 =?us-ascii?Q?Cbu+XyLa5C5hzIR57QZWm5LTDsrSaHGrucGes9/fDGVX8amvxrpaRbGJP3jT?=
 =?us-ascii?Q?j2SeEPln1IssQisgoOD2EDB80d5ohYKJPmlrgJ/MshO7tMfhT2OLaWZ8uNKa?=
 =?us-ascii?Q?rY5gLx02GUW2p7CXZVS/UZ/zVLJejRqieG/FCJu7XyVpZd8Vib5OUOLPIFw5?=
 =?us-ascii?Q?rRdx0cnTuS1wI46TvkcW1SpCQ3JJyBrgcZArv71AE4Qz1xY4oNpMA4b5ASYH?=
 =?us-ascii?Q?vghObcFM7l41vTi1JUrOD86rlcIwo/QelVF9aBAV1U2SyXlQNZNfNFqwdzmc?=
 =?us-ascii?Q?6zXu64ym2bRq3KATqDnBTR3t0JDceaFtj2Hr6YE6GJr2wTkxMyNKAPhWm5Fu?=
 =?us-ascii?Q?D4+J67w3mPTGaKN+9MsAUJSDkpneO+jWz+3j3M0HFZQg5BhYbHTjVExu5ZqM?=
 =?us-ascii?Q?2+NZ9Uo8jrnGDxkYQYeWsAsd6ZXuZ1a9i/XtvVmGD7neZOLaGkkGsGctXt7O?=
 =?us-ascii?Q?pzzeP2gc9F5hTIFwxvu2U9BGPMy4RTaTpcgb3xMnzhY2mamljA37E3cOL0+X?=
 =?us-ascii?Q?cUfkHnmIZmbVjZJB4NOjljDgnLjqp/MqyMGe0cxyp4ip7lqeZeIrwOGSdcAJ?=
 =?us-ascii?Q?osadD4+DWn7KZW53xHYeAYJ9SoqFv2zO6BY8xjiRXGJHh7tt4Rqb1z3dExpD?=
 =?us-ascii?Q?8jwm+wUVIBPjq29f+YMSLCz2qKMpSD087xfaxvP1hGWFNcGT5jgpHoFdemp1?=
 =?us-ascii?Q?TuxH8GZgsJzoBA6VFti321EoNygsY/K2zpYTphJTQBwXwiO4blXYKSW84bgc?=
 =?us-ascii?Q?DVgAYx4/cgIzEwPgHZh2xs07TgO/eR+2NJzvKHIzoIocwfKkv78c/kf6+yEl?=
 =?us-ascii?Q?BgnEM72IQcWM+ukLs+H7swpGN6G06bIdkc8EU4iPMLi2XV2WZ1bICki02gdm?=
 =?us-ascii?Q?Q8HKX4B6gYxBs05TLGZCzYH4xhXNqfNjhIkn?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:40:04.6373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e655c3c-e031-4344-1b9a-08ddaf0481b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8717

Hi Marc,

> In general, please use a patch title format that matches the one used
> for the subsystem. For KVM, that'd be "KVM: arm64: Expose ..."/
>
> On Wed, 18 Jun 2025 09:45:06 +0100,
> Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> >
> > expose FEAT_MTE_TAGGED_FAR feature to guest.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  arch/arm64/kvm/sys_regs.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > index 76c2f0da821f..c8c92cb9da01 100644
> > --- a/arch/arm64/kvm/sys_regs.c
> > +++ b/arch/arm64/kvm/sys_regs.c
> > @@ -1586,7 +1586,7 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
> >  				       const struct sys_reg_desc *r)
> >  {
> >  	u32 id = reg_to_encoding(r);
> > -	u64 val;
> > +	u64 val, mask;
> >
> >  	if (sysreg_visible_as_raz(vcpu, r))
> >  		return 0;
> > @@ -1617,8 +1617,12 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
> >  		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MPAM_frac);
> >  		break;
> >  	case SYS_ID_AA64PFR2_EL1:
> > -		/* We only expose FPMR */
> > -		val &= ID_AA64PFR2_EL1_FPMR;
> > +		mask = ID_AA64PFR2_EL1_FPMR;
> > +
> > +		if (kvm_has_mte(vcpu->kvm))
> > +			mask |= ID_AA64PFR2_EL1_MTEFAR;
> > +
> > +		val &= mask;
>
> I don't think there is a need for an extra variable, and you could
> follow the pattern established in this file by writing this as:
>
> 	val &= (ID_AA64PFR2_EL1_FPMR |
> 		(kvm_has_mte(vcpu->kvm) ? ID_AA64PFR2_EL1_MTEFAR : 0));
>
> Not a big deal though.

Thanks for your suggestion. I'll apply this with STORE_ONLY patch too
in end of this day.

--
Sincerely,
Yeoreum Yun
