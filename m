Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2046.outbound.protection.outlook.com [40.107.247.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A235D477
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.46
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746702937; cv=fail; b=ZbpjWDp1uRqHb4hWBWMrukUOAW25duYwoXjGvdys6Pr2fgwnVLz1eq+KbKTL1hBEVrdTagv/a9Hxvqu9vA77jnGU7QXjjWYev3eknqbjFe2/rIr5czGEWSghcrPoG/IMdYwJqlr18swhFmAPCd5UiccmXaHqDjz1zZ4iZnMbIWQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746702937; c=relaxed/simple;
	bh=aFjNGGAZ0tBnqeeuEl5aKv2GDDCGeY1Qh25V9XPOUdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rlN8LKKXR7yP9pz832rGUuAfpU2fF0YEPGnUy0UtpDAXhwr+7Cy6J6jlveA07szLpRhqZr2G7C1X21Q0U5GBH9oJqLvIMrflcH9PWp8z1S2TQ8RPM2kY68rNqzNOaGAUYu83wemWoIEsPaKqTABxJkfj9Q18KOybwUVUn6GZh64=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Lynq//np; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Lynq//np; arc=fail smtp.client-ip=40.107.247.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Lynq//np";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Lynq//np"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uYhZJCzIMZeGAHJcRQx5ZFwxNy2uaLHaZh4soYqARdFnxlZq6KzTUwILqnJaPMGexAmvcGMB9CxkLYwszRu9t/9/JZmNo/mR8RcD6uwFZrcgxbjDW3TgMm2cvmauQVPoSQCANtVFhtJQOzCQ6ReGxlvBw1MstFBtyNgHwc0sHhJDRDqdnjvbLJYsulk1zJZeAL/MwgMlWNxDVcWEwn4yj43YK5qoHzrqH+lvPy06K5ECKh17yoTEvyib8ZVOHGCVkgmOYr0oGwKqv0W70pcR3XGg9yxIEGJ4/BeYgYObt0cLZfiefegQ+sXho40SyBmGjPoYVxF9B/DG97vLuJb53A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFjNGGAZ0tBnqeeuEl5aKv2GDDCGeY1Qh25V9XPOUdw=;
 b=H6uG7tjYFLoF6awpwztvwvTI2DbLPL5R1LKE7v4lI4NhXlwTbBe/vT4XoIGa0zMb7ga1BvfIg8WjckCp+5u7GkDuJePDVGcKazxMFm4bVYz26ViMOvSn19oCEwu7lYwi8Qa51Rq3StmQRyCZfZCYEdGMeIef104qA7b1ppaE95Xghlhl4Y7xGiGFSN4/98x3fyCC4dIxEHo1qgeQOqLZMM4c1eyIbY+orXFf0o0lZvXpp8cyqGIFCdda9XvdfR9W0Agqj5ikRu1rpSHDms+i9zTGYsjBwjmAuzB3KQGNoMCsK1XyTxA8jh1fqBkMYY7FbqaePyCA0nW+z+hB+zXvEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=google.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFjNGGAZ0tBnqeeuEl5aKv2GDDCGeY1Qh25V9XPOUdw=;
 b=Lynq//npQBcA2LuHlUFbEx08YIAikX2khhZ1dLNcyhO7nfreMS5pgva+V1ZuOL19H0PXdf4CcSTMMf3Nj3Lpb6fvfbQnk9Jtq4WBU3Z9SUYUPXpO7nfLscq5Yz4Q40uIzf+QSoYDwzn14aYDiIXxcTWpgd0XA68NNK2BiYPPhWM=
Received: from DUZPR01CA0287.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::29) by GV2PR08MB9375.eurprd08.prod.outlook.com
 (2603:10a6:150:d0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 11:15:29 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::9d) by DUZPR01CA0287.outlook.office365.com
 (2603:10a6:10:4b7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Thu,
 8 May 2025 11:15:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Thu, 8 May 2025 11:15:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKGnckHvryr1JLxCgPziMfymJgS5jY558jwY7rxdzYCsQ0p4a6iBmZKWdoNKdc/ifhwlzKoc5olwRYH+hH7ilAEaKRjW/WB68A6NfNEZuRQ90g1+EcWN9E0aFKFmpdv+rFbln/TCKoF82JVVze2FmJ34Q5ABDY59HopMxxeeAM+TyyskzRYuR1ZzXdPKHjaK0TJSKISrLEssZ+UBVDImL+X6pf/K4Szbroji/CwMm8vXZLteDjukjaoN02lSj+xZYu75o/Lk8Jp+pYHsXONos6+cOFwG6STPssST1JsiW8uCh6DrtvRC7QhzIDQm4kgSIaPHaKuQ4llxX3tvl6J91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFjNGGAZ0tBnqeeuEl5aKv2GDDCGeY1Qh25V9XPOUdw=;
 b=txGcHxK+k9PzepzABPp7hlYR6XIpNWjx7O0rG+96J8bHzhaQdudpkF7ygTIT6z3R4SBP6vDEJvdMdTZOUQgTbu03pCyAX7L6MGV3EuN6FMELq5JusA/Ht6/ocqV25iqDRjukGIuSSgNODby19obqKV+8lL4fqYYa+p8TFPMGT1gCiRv1ZJtKaj/96JF8XitWdI/x59c+dW66IWRjDz0wpQ+FtDwI+kYBLyDbXiKoQr5thbrSZbO4IkxEXPmnF+D1QT7UsOFIkhSk/j4msM8GXFsvvABEJZFS88toSEOaO8S2pPzrt4bjyg7w51TQN2Ud8EC1SM/ulbGlbl8faazpLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFjNGGAZ0tBnqeeuEl5aKv2GDDCGeY1Qh25V9XPOUdw=;
 b=Lynq//npQBcA2LuHlUFbEx08YIAikX2khhZ1dLNcyhO7nfreMS5pgva+V1ZuOL19H0PXdf4CcSTMMf3Nj3Lpb6fvfbQnk9Jtq4WBU3Z9SUYUPXpO7nfLscq5Yz4Q40uIzf+QSoYDwzn14aYDiIXxcTWpgd0XA68NNK2BiYPPhWM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DBBPR08MB10601.eurprd08.prod.outlook.com
 (2603:10a6:10:538::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Thu, 8 May
 2025 11:14:56 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8699.024; Thu, 8 May 2025
 11:14:56 +0000
Date: Thu, 8 May 2025 12:14:53 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 0/3] arm64/boot: Forbid the use of BSS symbols in startup
 code
Message-ID: <aBySLQ/MLhiXRqEl@e129823.arm.com>
References: <20250503112137.1962910-5-ardb+git@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503112137.1962910-5-ardb+git@google.com>
X-ClientProxiedBy: LO4P123CA0434.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::7) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DBBPR08MB10601:EE_|DU2PEPF00028CFD:EE_|GV2PR08MB9375:EE_
X-MS-Office365-Filtering-Correlation-Id: dbfbe3eb-7d7d-4a44-710a-08dd8e21a3ff
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?3s+Xe0QMlnc39Ir3FWJKt0AQMybtdhfpepX/fw/KJdgX1TaS+8FBQgTDui0q?=
 =?us-ascii?Q?OgulhpUJWBjl1Lub2bTULmYUnEP7f9Ab+DZT2LpX+3SuJ7897QLAF6io11By?=
 =?us-ascii?Q?jKUyJVHZ2My8nAPOeN+cpqBnaI0AFtBNtEBqVSOtgVyAOApe49gp7JfF2WGO?=
 =?us-ascii?Q?WFGETBvxVzm33pBib+69tZytKOCnbHdcYXbInhJTQFeaiSEuMIHkmv3XAKQ4?=
 =?us-ascii?Q?aIoTdyNQXWKSGmS0bXFF83deBDU6KgL+blnu2MQmeQV8pGLvXotQ/RBz+0Iv?=
 =?us-ascii?Q?V5YRXzWAjCfgZEndB8lttDP6USZHdryIaZp/LFZd3pLCyegoScTGQB1GuRt0?=
 =?us-ascii?Q?HuvFIcs3l1BHOcWIZyG7wAdUlAKcIRDLTSigc3efHCZyEbPGbUrjY6ktTG5W?=
 =?us-ascii?Q?DSxvPVrJXLh7/cCVGdLqirlLeSH92E/xZPJq3BQpxRThxdX1vp/Xm6hg9kXt?=
 =?us-ascii?Q?npT6gEA/LImqI3jPglAnY7E6NFS53EFkl7Wot5fZe0EVwW1NA8kZk0bGSD+n?=
 =?us-ascii?Q?bIgdxhZMW6AoV6ED1xvGZ9yU2cvfc9KVG/kHApcb2SuhjlVmywdSSxkjY4Hs?=
 =?us-ascii?Q?7ILIUjZEmU77GBfeKM/990apJpaY1TNuLn85xTjyu+G9ixMzeXV0F4/dG5vp?=
 =?us-ascii?Q?d2wdw+P61aEVt/1sO4XuQ0pxkGhwqZmnYLA9qUIM9hmDH+JilsZY6xbkUTef?=
 =?us-ascii?Q?A5sjVze8NhaIiUEYfd5I/ckBhVhy8mPKb4bEGKtwkatzw+xwhtwcVE3taoO2?=
 =?us-ascii?Q?YgHKi4bsw8HJKqWP5lvSkBKlRs08SvPCrHOzUaKc4yaMlNVMbkgUNdKugNfh?=
 =?us-ascii?Q?lgpaGyYXtAc9P7iJyB03NxyRvO9T37FL7nZZbwe/VWLIM4f0q5CMl5sJIgnG?=
 =?us-ascii?Q?0MH9Q23GjLCn1jJg510COJszreVHJAav9A/9X1cd5iYx6fU5OjUtYgJNha1S?=
 =?us-ascii?Q?UKblWTvBElIzNWzG6Jlsj0MNkARcW4sQZwMpes8Wn7qSyXGbP2VB1qXW2Nd7?=
 =?us-ascii?Q?hZa3C1FuOzY2aQDH+lXKO724EIYq4f3YerCk5hnli6UExuYyjwg4Nw0eW8/d?=
 =?us-ascii?Q?eA4fVgS6Yj8y7MvBHqyd5I2m0jOoVq0fGZ6Znj5OFG5ARkrTKeZA1XkSPPtq?=
 =?us-ascii?Q?Ji68MheMSRjAwKLZzf7xZYbvZZDs5LeP7LpPA/qCHoPFRwGCx0la5Fq3YAFm?=
 =?us-ascii?Q?dopl2SN7DElu+ng/pBJSNljePhuFkpHbpnLLw/FmUvZuR79BQZypvQCxeSLA?=
 =?us-ascii?Q?GVtQ2UW846Q/tRTCTszcJ2JoTfaWrr1MvhUrDftii7/Yz9HaCPPtCWx8yXod?=
 =?us-ascii?Q?wWEwx3pBSeI0kCXtrySITWF+POkOaEwYiGAsuXIsIZorro8ke+iOLvb8k7T7?=
 =?us-ascii?Q?ciUBYQ3RPpHoHvEigzULPqKRG1Ch15JMd6KtcX1DxdImBr6jhuXknn3cAWUY?=
 =?us-ascii?Q?f8us8o7nvPc=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10601
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47866c98-c69d-4eee-49d9-08dd8e219023
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|14060799003|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gYy95ir9XclDRcvy4GbpWWX17dZyFVu66p/8wW7l3YzDL1M3SjSEb5hAs0/5?=
 =?us-ascii?Q?nBNBlyLlUBC5fK0oYplqQRh1vIm+fhVqvjCxPTiRL3Gk5IJf9HhPw8JDYbS/?=
 =?us-ascii?Q?vRNzw3mkxbpTNp419cbPYmBgVcfjJ4uWXkPqgR0SbpgLSbx/O62R5MkObFJN?=
 =?us-ascii?Q?/BhH77oiikY6DEGLtD4KBHFOSf6hgRtY2rwbKHqDXhL+0z7MxCyOW8vMP/SL?=
 =?us-ascii?Q?EyMAV3AGTB+pNhfviVwBnMIutlefLs28eN0cYr6mz1OM+d7Pru9WtvsEy4xN?=
 =?us-ascii?Q?tOH7GDMmpu3K9heYCkyIcAf7X0yOUWDcEae3n4AjgwTjb+uLopUsT+o7J7Xk?=
 =?us-ascii?Q?FMAoY8jx/ldkpA0c70jnkfODofsBinp5uP9K3Tky4D5GuECdt/1s3MI4XMb6?=
 =?us-ascii?Q?NoFf1w3ePk9gDvr0bMgOWqax/J8KpZ83V3/i4bECPefugWZFTnZcSYyuUeRg?=
 =?us-ascii?Q?algR+6oOAJAPvIvZlVAbf5BH+ffCDghx/h2ZAfc+XuXa9Me5a9HumA0GwQlv?=
 =?us-ascii?Q?3GO35LNib2VfppqLd0CZjWFQ9/BFVgGf5yqxsaQal8FKv5CbPG6yLurtWCs8?=
 =?us-ascii?Q?HbZ0WrLBG4PVztZBXhwTU9OcqBoTvzt2IsORO+h9cfJWStI8xl63DZLsbSzU?=
 =?us-ascii?Q?PgX6wdBxIWDr/9ASAPA7kLMvSRce5TfJGBBjOBZllbPjL5ukwOSo/6cW5izG?=
 =?us-ascii?Q?0IGlkjeojV3D/7hOga0wFKKTdrAVU1LZXb4GalJRGqYVaYADTu4SU1G/5Zw8?=
 =?us-ascii?Q?32/vMsMDxg7G1mE1bymElgC7shGn0soDqlwNmkBVOM45Up8Sd3u7SAqABghV?=
 =?us-ascii?Q?UHFIcvp/u5Z/lV3crpaKpSb1k71YVgY7EpW3tHoZB3UqTU1tOeslD+himL4t?=
 =?us-ascii?Q?a/Y2pp1dAeWrRfGQxMDZFj1b9d5XkBebuUK7tdKAgqAbCi8iU0ncgEUvZ+aS?=
 =?us-ascii?Q?yVAVCBLR8/JCAt2/SHn6coFJNjH02u7rRCcoI0vprH8R1EQ0RzBVPidvD4nQ?=
 =?us-ascii?Q?mp2mw3aTuWd56bHH9Ght8d1y90Kw9Gr8zjBAfSh052BH5to/U0pHHZK5PXzi?=
 =?us-ascii?Q?ggdkOUSZTt2dPjSByE5xjlYv80ayW1+yQo/XScIDyfAbRDMjTvP0HlV7Nn+4?=
 =?us-ascii?Q?eYUe0ih7lndyRcpAtXNEeiRn5ln+N02a8TCzeXsl8/PBWtc70YWhhaJhPHta?=
 =?us-ascii?Q?YcS7tFnamwgho1cbKQMLU0XXPsywRxYCMG/nPY8PDPYQreJtL6td8z243KUg?=
 =?us-ascii?Q?Psnar4MeHGw/rdkwaiGvkP9zplcaYm9adhnPqr0EhWJe/WrDnFGKj0f+kfjl?=
 =?us-ascii?Q?bL3PbrDILJN7JfPRGZguJ6oq30j+vats8t8fK9onVv8PZyR88AP/NuvRMW47?=
 =?us-ascii?Q?GPjRmBpwq3Z3jDtKcWgxjOl3EeJaOrAueQDzFdwlp3jTx7oDce9OKps8up5W?=
 =?us-ascii?Q?jAxU1KRkRhE1mQknII8HCxZuHck32vJ1mdUcwWBzvmtEZw0hm52vqQxbAMHG?=
 =?us-ascii?Q?x2L+Sk2BG3qO8HjdAR/KQCwMkxEa+X2ei45Y?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(14060799003)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 11:15:29.1912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbfbe3eb-7d7d-4a44-710a-08dd8e21a3ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9375

Hi Ard,

> From: Ard Biesheuvel <ardb@kernel.org>
>
> Move any variables accessed or assigned by the startup code out of BSS,
> and into .data, so that we can forbid the use of BSS variables
> altogether, by ASSERT()'ing in the linker script that each symbol made
> available to the startup code lives before __bss_start in the linker
> map.
>
> Cc: Yeoreum Yun <yeoreum.yun@arm.com>

Thanks for ccing me and with the your fix it looks good to me.
When you send the patch with fix, I'll test it.

Thanks.

--
Sincerely,
Yeoreum Yun
