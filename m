Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2067.outbound.protection.outlook.com [40.107.247.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B652E62C4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 21:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.67
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743800963; cv=fail; b=r7HX9h0hijm/lWGt8XbiVj1qomOAP2dkJQCfrJTUBdSYFoheq8+azuv0Un/Cw93NGTiY0OObsToNGpB0gU8ua43qlwqEVbtGaYbx04PphGlGJebYKat5Xjp5M/zjalqwQskHyUWhVxT5rFUrpAPv201rPm3mdtls2BwZB+BvyI0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743800963; c=relaxed/simple;
	bh=1se25FxBlHLn/owqSgWS67LFOwOUD7HG7ksg+XPwG7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a3GwcTY/rmaTyyflBWRCyrHnGgONZ+pO460d5l//5elMmURUbbKyYrE2nkbGh2gIj44YEDnnx6FqISmH1WlZBARs7x9IUWpaoUZwSv61mdSEUVqqZLze1aZdpI3mIF0DqjU/bCmdYB9IC7qEIGo2RkTRadp3mhVYRHXrJdQh+aU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eih/Rsrm; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eih/Rsrm; arc=fail smtp.client-ip=40.107.247.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eih/Rsrm";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eih/Rsrm"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lA4NEjGxwSqx0XjyHFQStcLwRT7ofvY5inToamXkx7HBLNID2CQuhutI/5MSoG7QvlttaZb1NuRgFw02U5U3q4yOyf7SxyuwnwuDQKLN6nc7s1C61NhEoTKL/7ZHqVS2qtrFfdCylAmyDZ5GTUL+3xbVx1NonPGuzqQdV8WsSSflMSOmWCADpX8H3oZxh+Cnlq3tVtH+RujfYdgHCr0WI15hUfZXAwpU2pzN25xQA917bStKGcPL/KW1jR+nvzNYJvKPWeMC3nhKXMecIfFvdNUEEx6nPJhjNivPTmrzIErX8DsaArpHmEFvji+xOgiYIe01t8E4eruHR7lFbLjsZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1se25FxBlHLn/owqSgWS67LFOwOUD7HG7ksg+XPwG7g=;
 b=Qrmub2DlFJd1mfgQISDcmU+3lJKi9rJvaj8HaTHOyu6asMYCN30adk0EJjGRV6Pg9Ez2JBCZ+echVwTrvTzzgiV4Q5PPRt357d3w07rXXinF3Ncpb248yWw8xwvGxkIjtVp6vwCxVg48pVpQBUlJOVVfjdwir7NJx4a+SwxRuToUIffAFdzCBYyQG/VVwn1Z4E9GyRn3yRUr/I2wcfRGdjvwTrxK128M6ZrZ8bp7tcAcVak+bjIZCXgsK7FUFx66QfJQZjF8kr6tN9ZIyUbKitKfc2YAEkyjB24rcPI+j6ltb8S3ffNaiOhD+dQJ1zSvRe+gcy9G+FUxUjGlJFlEZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1se25FxBlHLn/owqSgWS67LFOwOUD7HG7ksg+XPwG7g=;
 b=eih/Rsrmym+3JUtm4ZFFEF04rt/H+DHXCIsdIWnQKkTM1uJCWZAGbI0fR/WJgNBHqpJo5MpbDY3xyek+WcPxVwnRr442zjixTFYPRLrdzG82hu1oxde4sXCaTPkbWoOZHOUqTY2FCezWXXRq0kv76CgbxnCWjZcE5I66E59x0v4=
Received: from DB9PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:10:1d9::14)
 by PAVPR08MB9745.eurprd08.prod.outlook.com (2603:10a6:102:31c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Fri, 4 Apr
 2025 21:09:13 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::45) by DB9PR02CA0009.outlook.office365.com
 (2603:10a6:10:1d9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.27 via Frontend Transport; Fri,
 4 Apr 2025 21:09:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Fri, 4 Apr 2025 21:09:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsrbCNw5+fOIJEDDQ282ZkO4fAZgdbta3+tB+EXxTJVIie5D6Z5I9Jnng7bU35PBMwa5sagjWdWWtfTWdiHO8LoNnDbDbBy4WR8oM92koQ71jquTdAOjmI87GTzd4b83pp5Id0YJ/FGG6tLAKlGI1nZCy/mYwjt9LIaLDivaczkzB+w7tyY3r1Foj3cHBwv13B1dVKWLzRgnFtkbjp7ZQeVEbZKlyuIX7LyKRzn16uDtOXwEXG9NXUiHVsxiYswYf/dsB24YYQfRdYdLuM9eQdi/E5N9B6lP3kSkCgi3PTB3Dw9HdRESjri8zG3sWNz954XuqlGmR8bjeBytjULUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1se25FxBlHLn/owqSgWS67LFOwOUD7HG7ksg+XPwG7g=;
 b=OBNfx8+RZN24OIvvSyGtVJQUupE/cEE1aAvMUftUxt0loHyR4dUi1vZ6ObXkLtpizJaf9nHg8v/7waASXuicFd6NVxLnbsOjDBhjRJCMFQ6IPpUWNYBn17/tPt0zMnWpJYP4mH0MauiYJc2HvIEgAkUQWW/OBIDzpdAI5QLRAs4G7u1RrO09/71AhSIW/mz6oBqbWfACM+CeY5CUv9+X/iKcO4mVGZRDDPm93u/TyGNyA41TQp+LEvUGbfog0Ply9hEgX5gBG6W3QfV7Zh37gw1MzMjx5bGult5UQJr346kU7ykS7J4jKCCJ/Rdk1g3d21gJ0vGJ5k17A9KF2I3LXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1se25FxBlHLn/owqSgWS67LFOwOUD7HG7ksg+XPwG7g=;
 b=eih/Rsrmym+3JUtm4ZFFEF04rt/H+DHXCIsdIWnQKkTM1uJCWZAGbI0fR/WJgNBHqpJo5MpbDY3xyek+WcPxVwnRr442zjixTFYPRLrdzG82hu1oxde4sXCaTPkbWoOZHOUqTY2FCezWXXRq0kv76CgbxnCWjZcE5I66E59x0v4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB7447.eurprd08.prod.outlook.com
 (2603:10a6:10:36d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Fri, 4 Apr
 2025 21:08:38 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 21:08:37 +0000
Date: Fri, 4 Apr 2025 22:08:34 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v2 0/4] support FEAT_MTE_STORE_ONLY feature
Message-ID: <Z/BKUrYIlNCj48hA@e129823.arm.com>
References: <20250403174701.74312-1-yeoreum.yun@arm.com>
 <1618bf36-7f7a-4d32-a6a6-242323007d67@redhat.com>
 <Z/A0HJNtUkL+THCk@e129823.arm.com>
 <b9bef969-249a-41b6-8a28-a34be4318be7@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9bef969-249a-41b6-8a28-a34be4318be7@redhat.com>
X-ClientProxiedBy: LO4P123CA0503.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::22) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DB9PR08MB7447:EE_|DB3PEPF0000885D:EE_|PAVPR08MB9745:EE_
X-MS-Office365-Filtering-Correlation-Id: ad97e2f7-7024-4045-1c74-08dd73bcf281
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?NsJcZzK+iBBdG5Ef91JPDLUbxT3dqg+1ne6YvcZ+MGH/IaFz3Qjnek3iQbvW?=
 =?us-ascii?Q?TyZ6BjrBYU9tYj9I0b7hMgpk9sizPQFq3il2MvDbn1xmr4gPCxwEzXsFbrUa?=
 =?us-ascii?Q?roND/A7Pu9vCdLsp15wgAjILDsrjbDvkwBN2UyD/Ro4OmnWkgha6hdYnBABs?=
 =?us-ascii?Q?384DVMNYrfk2DLus/6S14zj/E34EKAyzFKERhztWb7b9e9s3YEwn02ouqkk3?=
 =?us-ascii?Q?63s2tr7haSy91+MFwsCAc0uN5VYkBsK/+0k4Qq8A65jA8HiRyh+5havUYmu9?=
 =?us-ascii?Q?G3a9OZTR25cV4TkFXWwQMlLsYOwavSIgOBn1IC0MKOwL44tlJOCLlw9mJz6T?=
 =?us-ascii?Q?HaxVHlZNvAgc4wStFDmEax/dIaRtaWNQ7Y2y5eG308jfuRYI/DiPCc4roqJ9?=
 =?us-ascii?Q?mjEckX1OC3ETfp073SPsUvkyUe/dJs/TNqBJEJGNp9Z8qxJqoUZxy6ToJBFs?=
 =?us-ascii?Q?7svwUj/R4uNp+lVq2e7BEmiqziVbRKg/KvhV33ncpqE1Jt5ojjvaoQKie8SD?=
 =?us-ascii?Q?G4csDCfidIe1m0RLsZyEaIGOviGr1xnjS2h2mjQUzAOwUtcFKnI8WtSAktDP?=
 =?us-ascii?Q?JutmDQme80t7zL9yadvC6VbJFqxz5vWJa18RopWwDFhLPtSENoY4WmMXAkI6?=
 =?us-ascii?Q?fFTytWEbi7Ip1eJaHOw3h0oWz1vUOG86g+7wRfpdQtL/drRmyzDnUF7L6PrN?=
 =?us-ascii?Q?YTXoi+LgkNAjCDpY+AHZOnYxjkeVu+D6W5Igxf2KfIRXT6evJ++oOKDuz70Q?=
 =?us-ascii?Q?PYcGU6OUgrhflXqnB1fq4q40WMWQJHToxe3N0pgu9hk0+6+Tz+G7AUXcPQNk?=
 =?us-ascii?Q?u+86NRlzPRtlPqMYNHVpqtIZsxBZ11m2rWvJH5L58VsyHmbmWFi0UpiUiTxK?=
 =?us-ascii?Q?e3Zbv7DBw65HMgv07VxlqRrJC/O7j7p+HErrQ4339b0W5ocIp135E7SSXcJb?=
 =?us-ascii?Q?4s2/zX+MymMW2RFinGp3lNqVWZLPrnX0i0sCXsZJfFily6JiI5vk1d9WN/W0?=
 =?us-ascii?Q?98pb4J0zp4kQYjw3EQRBqUu/ZG644SmytKaf9AtXvnSndD3C85OcUj9+f/v9?=
 =?us-ascii?Q?JXxdyKD4kwjLTU06GFX3CDScq01zHRoSsWzIgFqFl3PKrqjDiE/hE4p2QV8W?=
 =?us-ascii?Q?Bs+Hf9Po5g1kTEJsNJSXPgApFkQavMbxKyfFjLAe+CHLr7t9p0JvElYwdae+?=
 =?us-ascii?Q?PBGOtn4ch4DBd+juPlqmaSX2xlpnRNM/uf5WGa1oq17R0Atp9QIqwui86fGF?=
 =?us-ascii?Q?Ixrbzen6tAS/zfIzYAhT9Md37jUqkJOnQsF8mNel8Y6aTnbK6kVlwwLK4rQU?=
 =?us-ascii?Q?4oYkvn+SRLiHpZ11tARlyXyCGDG70oteY9Zja8UB69jcNw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7447
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6f2029ed-3cd3-4516-336b-08dd73bcde24
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|376014|82310400026|7416014|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5IOOb1QbJi1BLZiHMiW6Uue9x7w5FPssLcdZNBZi17BxrsLN1xO69EaYzlJW?=
 =?us-ascii?Q?MBvrrCYBBA4PuIPkL5KOtAEBiWAwVn+OiUqNQtcfrSl4DUtQJ+38KyZqNjfz?=
 =?us-ascii?Q?LOFZ0IIDd6H3V7Hqph+jryMkz2bgQA+GWxo95+uk9Y0BZAFUEjAB3giGuexc?=
 =?us-ascii?Q?Z2q09zIhF1j/cC0JKY5wnTqBIxFHnCJ8fAcRWgk02hVUSFXwdIMmyc318zSf?=
 =?us-ascii?Q?CxWuLYjVDg5+XlUXuWtubDqcqWSomOhMdX0SvQOIK2jxmQm7e7qFd+1CHqrl?=
 =?us-ascii?Q?Xh5+qNLDhGZedEjH9t4Q5VAgtV+MZ0PpVrLO+1G1Sv6aAl0ghSjq0F0wYIyo?=
 =?us-ascii?Q?9T3mLcYvEpG0NArMxWNGXjpP4zbZmEj6ui1tZe9Gp9nlJ4BX+mp5anQACzUM?=
 =?us-ascii?Q?BpH33ElH52Wg6DSAqe1D9mr2zTXGfsphUMhdLj7JCHLc2gs4myIvYzUgV/b7?=
 =?us-ascii?Q?U7VwWcs/DbZ4wbT1gBp51xIdrewOJKyMXXp3RAa5Ju6GGB29Al2qQpij0QOp?=
 =?us-ascii?Q?jPY2m4gbaiMIUSQOWkk1hG7msXGmacdVUrU/arwRmEI+BiSeIFySVWwT3jay?=
 =?us-ascii?Q?TVlJScoLciWq1DU2veiZvK2l69LFjKFxGL1B4ulpYeXl5H0ErAJ0S/hNmTUP?=
 =?us-ascii?Q?aaZldbUfl4yrgWK8xv9X0xnA4M74hf+WaQDwfeM767ShColFj/vKsQMKs93x?=
 =?us-ascii?Q?D2Ro1NZrXY5ii+EpIu4hO17zw65yjsn4bP1LelYn4vZMpIVDfmCrMlm7nhhz?=
 =?us-ascii?Q?ERQmAA3tZRHjRdPiBzPhDIR29HlEZTkJTgXhJsqT+QSzvNSwhvD8XqgJczmB?=
 =?us-ascii?Q?m3HiZRbMcp2yhY1S/Yhlj5MzQRpE5z7LEdInDA3IyWq1ZPkZqZwH5wPuVmSy?=
 =?us-ascii?Q?qNi3bsdlRz2A2W2Z5/7HWF+LpVYCdwjya5IxqNV7Zwi9/OPqSOWAlUV5ND+C?=
 =?us-ascii?Q?m4H1OjgWEDjWN2bd08dsh7A1CkB/Fvf566Je4qhbSwtxtJkC6T/nQOAWk2A/?=
 =?us-ascii?Q?SeTEAkG2Y5bd9ICOLjoZHH8XTwb9JLTIwI3qxOW9mbJzLhzwQ65avBfVip02?=
 =?us-ascii?Q?BCtZJwkx/00wiLIl8a/Fuoqak4VvM7qEw30JEFG709DRIStOedcvojTjV07D?=
 =?us-ascii?Q?SuxMZ9pdyrSWLVKErKIE60QAejx1koe3Tp5/bYX2nzRvo+8Ecmzn+cNzMJn/?=
 =?us-ascii?Q?6Mmj45LphO9HxRUTWcLvCN98udwFI3G3grB/mO2mtuacmj0UdOLXt5oKqWBP?=
 =?us-ascii?Q?Vmwbs26F3pBFK6cFQyu8jkiN/mq+E2F4PFr9mR+tjDvdIGSQHuoIWHOvCUuc?=
 =?us-ascii?Q?xbyAp7vn+ZYrs6JUCS3Qqrmys6Jve6Ka/Txljd39IkCUunkFcNcO3sKClCSt?=
 =?us-ascii?Q?qghTGlOzw+d2WC8Av5/13di2aZvUq4GVcVjjjgJOQoLtEafJj2e8GeFo7XnI?=
 =?us-ascii?Q?ur201P5/pdQ=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(376014)(82310400026)(7416014)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 21:09:11.5134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad97e2f7-7024-4045-1c74-08dd73bcf281
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9745

Hi David,

> On 04.04.25 21:33, Yeoreum Yun wrote:
> > Hi David.
> >
> > > On 03.04.25 19:46, Yeoreum Yun wrote:
> > > > The FEAT_MTE_STORE_ONLY feature provides support for
> > > > tag check for store operation only. read operation is considered
> > > > as unchecked operation so it doesn't raise tag check fault.
> > >
> > > Can you add/share more details of what the implications are, how it would be
> > > used, who would set it, etc.
> > >
> > > Just from staring at this short paragraph leaves me rather clueless.
> > >
> >
> > Sorry for my bad.
> >
> > ARMv8.5 based processors introduce the Memory Tagging Extension (MTE) feature.
> > MTE is built on top of the ARMv8.0 virtual address tagging TBI
> > (Top Byte Ignore) feature and allows software to access a 4-bit
> > allocation tag for each 16-byte granule in the physical address space.
> > A logical tag is derived from bits 59-56 of the virtual
> > address used for the memory access. A CPU with MTE enabled will compare
> > the logical tag against the allocation tag and potentially raise an
> > tag check fault on mismatch, subject to system registers configuration.
> >
> > Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
> > check fault on store operation only.
>
> Oh, so other operations (read/fetch) will not check the tag.

Yes it is. the read operation considered as uncheck, so it wouldn't
check the tag.

> > For this, application can use PR_MTE_STORE_ONLY flag
> > when it sets the MTE setting with prctl().
> >
> > This would be useful for debugging purpose
> > i.e) finding memory courruption point, use-after-free and etc.
>
> So what's the benefit of this relaxation? I assume it's faster because less
> memory access has to perform tag checks, and the issues you mention here can
> still be mostly caught (not all cases of use-after-free, but at least the
> destructive ones).

Right. but as you mention, the to reduce overhead by omitting the
tag check on read operation (sometime this overhead is too much than
gain some benefit) [0]

[0] https://www.usenix.org/conference/woot24/presentation/jacobs


Thanks.
--
Sincerely,
Yeoreum Yun
