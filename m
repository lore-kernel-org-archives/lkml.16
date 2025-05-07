Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256811A8F94
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.20
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614899; cv=fail; b=IMcrTFNB8E3e3xZ6YB2DRBgONMyJsLaQkD+A1q75aaC5KEPERepFqNmxbIiX0HBLn2x1pgtP6EV7FSn9BhbA/rPpGUTM1DZeDjiht4qIsCXjz4VE3pr/V9B9JKFNnGbK8eHAnUjNtif/Xd8dTU7gnmMYjNHGIyF26QMGmyYy/eE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614899; c=relaxed/simple;
	bh=x3MMzrEOfGYrIpwgpyo9gsqVeLNjyTzRlWgB0FYxL/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DVuKT5Fx7WCcHcSLvB5RJttVBUSr0Uc6oMoSgbmavnYSMW1XpqIXHq5nO5mB6S6eRe0qx/EX9Xgfe13TXYs19kTCVg62KqPw0mpFU/evH5RfmPhSTKoRCty9q1LT4THVW7ckjEmVCjKHnr5+4zDtbSo83uFPsTnA2lBuG+6BKNk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mZ63hr8L; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mZ63hr8L; arc=fail smtp.client-ip=52.101.69.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mZ63hr8L";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mZ63hr8L"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qZi9SR1KyZEWfHez8ZRWeryGU8ALYtsiSF1sb0nYh//adFqcSyN1JDqcY6rV1TecQdnS30di7U2oJSUL95qVPjt0rnUM4obB5wzyY7AUh4g86a/wAzK+fyxpTiNLErXzhSVa1FxFg2gZx/C4OxcCqE6XA+Bmxu73JaEA3FN/9/knPFgjvmbOtTYsKWx8ukUfCEWKJExwhLS8azfHOT77kPMvt2QwjdIG4k/My9s5Gs/VjuZuSx9k6RYXKThNUNjwY9K7Vt9ncGivF+48lZYodTQHTL5J6Qzcn3z3rCbFCqWJaaK3l2pmTUQkqdgf2gNypriPpDpWBCkrCkYDQSHw/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3MMzrEOfGYrIpwgpyo9gsqVeLNjyTzRlWgB0FYxL/k=;
 b=eK2hVbFbMewpG2R8hPyCMvK8OSmWO0TpylTfrZSmlIbNZS+xJGUn/m18abSjuqzFD+lFcscpj8abNw7seGROEX6rUZHjmZNyqlOS0AQGmpYonjSqmS/vqeMojHTz0etRkCsGPvibs4bOylSMyvrajrPspdXi/VR7H1UAb8wdEnuPcPqkPkUpJlTC0KmGYxV4TVqDcFTpSDSE1B6TLlQOBVXFuqj8RL2kNQup8Gttz4xK/VzVV4mlZ5JbSypKKg7ok2+z585qgNkFbbWaq2YFiQ61uE/XdxBq3sPXMkHwAkNIgv3INPpovxXwvSD5xhBMTG36CInaWI/Kad+1Dl04WA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3MMzrEOfGYrIpwgpyo9gsqVeLNjyTzRlWgB0FYxL/k=;
 b=mZ63hr8LbUH2zykpfE1WEK2+0aEi0HEftwiF8erBeMvt9/o6RUqxD4dBpFkOc9CvN9eq4bDMXbR3QJLI1XKjgNVEoj0NDtnoTU7q98jQxkmhUS1GkKHVtnJCMEivAP9eV9qMAa5QUuX5Bf6Gx2SqalDtscuq39STpY9SzvcRK3A=
Received: from CWLP265CA0419.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::14)
 by DBBPR08MB6091.eurprd08.prod.outlook.com (2603:10a6:10:1f4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 10:48:11 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:400:1b6:cafe::d3) by CWLP265CA0419.outlook.office365.com
 (2603:10a6:400:1b6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 10:48:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Wed, 7 May 2025 10:48:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcXYzwjuELaxGcjHDLQryDE7DXATVsRO6fskzYK0oTIRoQ40hizUwnyQGkGDPcc4wT4jx+nxYgJ1utJ4HqZ+7m3INej/5sjbbFADGNWo+NSrDvQoSzxMXWcmnCuddUrxH2FTxqYAYoyDQUijOgCmzFRk1ZvMxqAIh8UODjcMrp+ga8Q1HhCVY3K5HH/D5ZlrtfMFDK9mw3uYZPiihWy6xjr7Ipw/a3+MvFKvOSSE20sY7zp+Za8RZJVvu4gaPNuy1gRzDzs9TlQ6wJV6zkNqOaJ6njTJYwME9TJprn6r8s18Ce5H7prEdQp5pa1NKSMZnsycpgqzlsML05Hkr/2c7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3MMzrEOfGYrIpwgpyo9gsqVeLNjyTzRlWgB0FYxL/k=;
 b=yKeGfiVdgJ6TyBDPQh9TgsYVqrzugrRccLLGDAf792meQnqgTY0ZJ6ZcRsp7pTg30o5R/jCgElXOGSIqkfp6wVmerEgoyxUJb9KdLG7CWoY3fc8iXrT9M4BmC31evKpykQWAEdvdn88piaKVSlN8v4Uk3l7cyu9lWhSLAeyVQNlNbVd3ywG80kYBzk0sjeblpqqE+6sTQsrJ6coxF/CRsAeLH4LtmIvqTuuoS+2/NeZgqeTX/zawYu5Up/xfPGze1QfcylZZw/PRWD4VkNhfwQq+haw69D7Y93KABstv5KZVudoo/LQTesQBzJ0Vfu41PLHYyiqvoVOHlCdu75ml2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3MMzrEOfGYrIpwgpyo9gsqVeLNjyTzRlWgB0FYxL/k=;
 b=mZ63hr8LbUH2zykpfE1WEK2+0aEi0HEftwiF8erBeMvt9/o6RUqxD4dBpFkOc9CvN9eq4bDMXbR3QJLI1XKjgNVEoj0NDtnoTU7q98jQxkmhUS1GkKHVtnJCMEivAP9eV9qMAa5QUuX5Bf6Gx2SqalDtscuq39STpY9SzvcRK3A=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AM8PR08MB6595.eurprd08.prod.outlook.com
 (2603:10a6:20b:365::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 10:47:39 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8699.024; Wed, 7 May 2025
 10:47:39 +0000
Date: Wed, 7 May 2025 11:47:35 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v3 3/4] arm64/kernel: support store-only mte tag check
Message-ID: <aBs6R0Wq0nTYsJAc@e129823.arm.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-4-yeoreum.yun@arm.com>
 <aBUF6JduwlhHVR9E@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBUF6JduwlhHVR9E@arm.com>
X-ClientProxiedBy: LO4P123CA0657.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::6) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|AM8PR08MB6595:EE_|AM3PEPF0000A78E:EE_|DBBPR08MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 13cb5a59-3f67-4e24-e3a2-08dd8d54a93a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?U717uDo9CPxC3Hxooog1vUb3H9R0qiMiAtC5hdHcYzjKZNA9mV7SXs4LvjUj?=
 =?us-ascii?Q?vgMbsYtA/uMhoW6J/pgkN/LEhrBwXjAhtn//uk0pE4j4jXKOae09A5XA4SX0?=
 =?us-ascii?Q?q4xvKqUiESH8/xPaGq+DlRN1aSWIFB0HX7AkLILbzNM5SZV4Rx77ZK8gjOrZ?=
 =?us-ascii?Q?CCqBhAtEfT0aYImDCE445W3jH5AOPjGkdDem1F1GYlsBbdvBSPSXl/NARgsK?=
 =?us-ascii?Q?hcd2iiejNHyjfGay1/dJ0r74U2EZrHYffghKAieByNIs12IofUDywQPu/RKV?=
 =?us-ascii?Q?EdKHDtPAO9WNzqWfVA4k998cW0JWJ/jzwUSUra6V1/1NdY7BtiOkHhFRcV8c?=
 =?us-ascii?Q?6G9CysfdXMYH3mmJNPIAtNoS6et2+kt65K5aEwhYfRNcIqVs3KXddMS/B/Wc?=
 =?us-ascii?Q?/eWdvWhx80zYbsT86oTqCWQ5QZq6Ba59j5eUtxwhnwrVdOOugDiNM437Yqio?=
 =?us-ascii?Q?g8dxjLOo8W+JuDYjqGKgAhDEOMGFYY/semdeRzttQav2N9W2ui8qeeUsONaV?=
 =?us-ascii?Q?/Bs1UEyYzVSXvUFhhUMeQW6wrOycIl2dKiqYVAYWKv1Fn0MvSu9lwI7rzsXB?=
 =?us-ascii?Q?YcKgJdpuqYQAtxEqF/CTZ+4rxVpWvJDfsj/GucO+eKQwYvjIpXqUwpsy8VjK?=
 =?us-ascii?Q?0JmpmNl+OiUH98Ijl4eoI32iPNizJH8WiHpiWK4pGNl2KqF6qnOCo4qtqNho?=
 =?us-ascii?Q?z+DY2m+SHB7yp5Ezb/cHgmIIjJdyo9k9UNEk/GZGKPVbEnbkFCxoMtlfydLY?=
 =?us-ascii?Q?FucbGqIBPsGJHRiSXq8OFqCwmO1co0uZ8zs3TGcUMAJ7qr9qVKg690yuaBsT?=
 =?us-ascii?Q?GK+Ebhz8+pSJ56lZH0LLigZ+jYhqSnlwHFfCUZLmkhHwXJATOu5RPN2Vczkk?=
 =?us-ascii?Q?1zChTeieXksUQnxT+NTs6ygBBptJaJ3eYk3mJf+dPWzMYSrDkCiLGh8TAopc?=
 =?us-ascii?Q?NZyZduwAHcbTQ+eZp8LAu6Kl08TuwZg+/RxeaVACZ4cQlO+DJW02IpJk3xrl?=
 =?us-ascii?Q?R0s+cmYBVlkQtk6l9Sh8zu122kYei6Llhq5IBpIzGYI8p57sQRrabmdx6NUF?=
 =?us-ascii?Q?S8oWV26LctHjSgYTo21Zwz90RhFCvSRcVOhgMSxZvjfcaeIDuIMwCtC+QbUs?=
 =?us-ascii?Q?ac8A5h9iiJa4zUIl2bn/qovG8pOv08AzHx/dk6GHxUQqODXIMTkALmjtJCXa?=
 =?us-ascii?Q?/njne0ujkNsx/N7c+DhvIcpLKvLi1GSxKvpfkDi83kxMER+LDvYLpsNozBCU?=
 =?us-ascii?Q?QxoNWz9jEVpNnI5fNByg0u6tHKGuWMN7T4fCyYbgrcuh8lUbVdA3bwrURnmc?=
 =?us-ascii?Q?7hBO4WMU63r5ZWxzehdjlAwxUawppueYcK/fPxLBfpOVu3u0l2XhGTYkLSDs?=
 =?us-ascii?Q?IHKSOUyE8juwyeCHY7r/XIuLMnxClXbaD/rSS2PGUl6dUncSpXseu85nkvxk?=
 =?us-ascii?Q?zyyaQEGyfYA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6595
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3df8c44c-1c76-4790-4959-08dd8d5495e2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|35042699022|82310400026|1800799024|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nG+YEMlCwW/lFpBXSLtOEfYjkS3wBNlYAV3w1EE4VflwFws5+xDG/NsL6UAv?=
 =?us-ascii?Q?W4/2nSOQzVMypoM59I1yAvmhQh3bAA76sI+gjCeXLtkqHLklnAB4Y0O993Qj?=
 =?us-ascii?Q?HELAaTc5q6RygdRp7mFuTStNeQCZYL/uZx9mqRRi8+hSR4DWcxuvNI5a63ep?=
 =?us-ascii?Q?IMxCksKis/vr05Kb+TL71gfqpE5QKMJMyiR7fUIQSp0F4AMYDd1wlrF9e9kV?=
 =?us-ascii?Q?NQ58IXjplLj46LPXVUoqEXDBT2xblZ/8c7miCnbAADZKhgwvZXITOcUuz3+z?=
 =?us-ascii?Q?ne5Scti6Qi6Jt+Rd/luxT/BwQvqKOlHBJMTP6LPFuSaBRcbnQ4XxsNIjzuD7?=
 =?us-ascii?Q?xUGIGhrRFUvTKhpO9qzw5Kuu+BBL6vvVrC2OpqfjZ3tMI/0KbNJybmgtroY7?=
 =?us-ascii?Q?AlxxsBqmBXyWmN5itRZJQKRRVdKM0//pDnxd5c6h4lJMEK4A8YwY/6V6YkL6?=
 =?us-ascii?Q?l9/zlkIurjtbHWDu9L2qV4JwPOI/GROhdz+vYZ0aoTzg19+V0ABsFtK+Uj4q?=
 =?us-ascii?Q?Atj8pkm/Dpy/T+lkU0ewL6b8fUgj8TsghQQZsHNyaUAqDlZpoclzqQ75Ne0u?=
 =?us-ascii?Q?dpJWte/sMpZ7jPP+f2553VS7tNknkwr3J+qyAgHW9Lr7pqAJWMVkb1nCDI/N?=
 =?us-ascii?Q?kXhmA2XmZe/ASjeeAA6XXeNkGsS6eifIr1sPqfu1YanxJBaWLSYKlveBGqAF?=
 =?us-ascii?Q?v/QU4SDUbV8MkePlCXLiw7z9g3AFNxzbPrSacw9n+l3dqRiNLwWpAKl83Y+S?=
 =?us-ascii?Q?EycwCFKYygR87iwXyEs0eXdp8SVXsKAIyXS+lNqnTHvBHIvBod09eakJ7N8V?=
 =?us-ascii?Q?9CE/FvYFa29xOS/McMdZXRikKrIv9Ysr8YmVRHnFB4BXnj/TNY0Poo/jNlOD?=
 =?us-ascii?Q?ErNx87P305VfNO7TZezzNCg8wz5jGqJ41QTLDociqMdL/XJ+G7hBfFtW8aBX?=
 =?us-ascii?Q?N0XpRRrskO11sTQ6QupiKOyLQsL8+7bC0L++p6SttpKY1r16uzgDCAjlV6aj?=
 =?us-ascii?Q?9ZfX0a6vJ8tuAqjsuHaTD2vhXzaUHtG8s+6p/PzRwWak7C6+cEo5pn1wmbtr?=
 =?us-ascii?Q?BEnbWlXPcKVDKzVgCaJ9trxkuSMc3mm8Rofu/gdWgCLF+UT9QTdLCZeWc88U?=
 =?us-ascii?Q?gVYoJKXl6iVU4mMmGzicjbiiencgUJ447/EJM6k4wJdKqsBh4OyozrWQ6wi6?=
 =?us-ascii?Q?1FSLlfmWTqqT8tqttpak11FP0/yU11R2A8SA6FPSipRSk/JoCJEu4socST1j?=
 =?us-ascii?Q?owSATUCXydWD8KaHy4EFJ/4OuFbSuZf9Hd8XZSEWYJOPiLawNmU5DV1FzzJS?=
 =?us-ascii?Q?1nLPmO1zx+S32Nm0hdOMJs1Duw4TDk/raAHiX+A9v/qNCPijdQ8WPrn35Mz4?=
 =?us-ascii?Q?WZesHVC2GZe8mC0oeW1+utWfK9NAgFHavsapxmBJTTUP5pMsfafoNl4KiXdX?=
 =?us-ascii?Q?KkpNcWiS4+olo3c2Iaulzu6Tz2MXxF66XSGlPjiZ2CvZKzY/6CX2cyT9SnzB?=
 =?us-ascii?Q?2swHHdPQyJAqH/gi2hoVq16TkV3YiaFihaoa?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(35042699022)(82310400026)(1800799024)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 10:48:11.1524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13cb5a59-3f67-4e24-e3a2-08dd8d54a93a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6091

Hi Catalin,

> On Thu, Apr 10, 2025 at 09:07:22AM +0100, Yeoreum Yun wrote:
> > Introduce new flag -- MTE_CTRL_STORE_ONLY used to set store-only tag check.
> > This flag isn't overrided by prefered tcf flag setting but set together
>
> Nit: s/overrided/overridden/

Thanks!

>
> > with prefered setting of way to report tag check fault.
>
> The preferred mode set via sysfs is about whether we want synchronous or
> asynchronous tag check faults for reads/writes (or asymmetric). The
> store-only checking can be combined with sync/async, so they are
> slightly complementary. The question is whether one wants some global
> knob to turn on store-only in combination with sync/async. We could add
> more strings for sysfs like "(a)sync+storeonly"
>
> It would be good to hear Peter's opinion from an Android perspective.

Thanks to add, I'll wait for his comment for this :)

> --
> Catalin

--
Sincerely,
Yeoreum Yun
