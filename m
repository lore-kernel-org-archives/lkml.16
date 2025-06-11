Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A3B27C844;
	Wed, 11 Jun 2025 12:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644647; cv=fail; b=rwK1QQlz8zpslQAYNoqufE08gohz/0HbdjzwK4XLVdAcmxS/kzW3WISpLuFvZbZtMMAkkiL1OrIYJ56/3pp0hY1pNPBC2doj4a8DJ1bkH9cdgWIrMbGOqtS6M2kQUURZ2fn98VtmEy0LLQHibcTSj8ew3dVCyvC468MNNJRZlGE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644647; c=relaxed/simple;
	bh=+3fUVQcrli87utk+ftRBb49CJjFxqbu6I40QgAun1Xw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NzZm3Stz8Pwm8HUT0fufmyVtgfC9Ytpyg024pJVwO0BkzesPHjqpZNY/Z//BFLy+DO2kyZVcdZK7ii2jhHAS8Afby8ghZOZcZDg/0IdQxe3l4cSZh/c36g7G5ISNd9r5MRXT2vOrOQwxiC/3x7+oHkMpHsf//1AnI/rQ5QiujTk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gnoWfSVT; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gnoWfSVT; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gnoWfSVT";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gnoWfSVT"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SJvtT8jzdkTI+Km5xljfBIsgDTSkuGkzTeKX4/B6isEgu0NnEfAVRvBPIahkwDn4Uxws/UWjxgg3jU8CFrPEO184p1VaaVy8WgINnozsFSX3vvCndeNxH6l5OtA4wLyyQZ13T6ZqGRROPKlxBNqbTcSn0efNTBPE0pdHYB7Ky1C7ElH1OJt3qcOkfp4O3HJZISkY72xgQl44wIoJzGFy58Ce7LUzWMYPTeXOrYGUgN4KFukal8Yy4BK77pZuZRIPyGacwuaFGS4GRAOQgtmO1bYUjkbALSuvavHXLX097HjFIyLFWspz7crkGAw5U+9j7OXVDHV0ynANIj3k7EEA8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3fUVQcrli87utk+ftRBb49CJjFxqbu6I40QgAun1Xw=;
 b=p21msfmNEuz36SuPGasm6LZgsOgdd/SrXKNVi1kjXPv8RUvL0wKbWr4e1tosN4LxvqWjRbtcc7zWj4+FEYWdp0l2R8EMFscYLsAXAG3kGUrIx9Y2rA7Xnw+cVIu7ojUHX+b06g6LlFCBipe+VQ8SzQgChDDGVIGsGhS7BJwMRS3ixeuJxs5PvrahszwxfmKeF8LSyXkpJdy95Rl0Muy4DrqNbF6RxbYdjcekj4rTVn1lOjnKfdeqzsJRHHitFk/sQ+rIiPFUCsybesu6NkWsptva0acXMS/g4N+7aKFElg5whW+D+5uL5r4a59snPTG+c1MNbLY88tgDZE+AUNeoXA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3fUVQcrli87utk+ftRBb49CJjFxqbu6I40QgAun1Xw=;
 b=gnoWfSVT9PG4PybRuEe9Ca9pA9H4EcENMWVyR3R0BkSKEIWXaM1db5xOryLUYtXXUq/trfLEIBN0doMCX17jGLso9gut0w8whJGLKJmx/Dg/CE8YrKkd+bCYIzpjRnNBuwiXG6GO7lhsOyvbHhQBLw4Ak7U9VOjgGlaeOnhACXM=
Received: from AS9PR05CA0227.eurprd05.prod.outlook.com (2603:10a6:20b:494::12)
 by AS8PR08MB8274.eurprd08.prod.outlook.com (2603:10a6:20b:536::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 12:24:02 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:494:cafe::f1) by AS9PR05CA0227.outlook.office365.com
 (2603:10a6:20b:494::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 12:24:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 12:24:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3iI8LUYZcOGCylI1a7CagzsYLTeyTXmZG4Etdud4ZnyRuZunKQuud+yj85Jf94SMJMsr1Jf6A4ye5Wwu6ueR/LuUgZsoyehEWDloH3n+v3eFGaoLwFUIoqaC52dci8nzzk367mnXIc6ks26FZ8FquVRRf2C/CUFCycyITDFtsG2ogU2WG3UI8xfosecRbtOa4wu19RO+P5wFHF6Rmw1mNdiYkbSh+EXbnDB3WXn73ioSrg/+dvI2DjfyAGEivVRx7qIADjhRvx9G469xGYNJoKC3tgdNhe9RoXCHrfDfXHZ/utCeRE4/aIUsnX68Ox2erfscvyTyDPOExqkMHjVmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3fUVQcrli87utk+ftRBb49CJjFxqbu6I40QgAun1Xw=;
 b=NSv7L7fMeJhctXuwGH4xWXVEKIGobZ+08rXEZihFybe0oME1Glnk68lvxw9zn0kQgXYgDGH98W5BhSYzw/YyALqE9sTx4W7WI3pxgQod1L7lihzzDQc97XsQPDQQlG5JFmPWIPgKe+sC2dXbKUqkJab0s47A4L4VUFnGNY2jE594rkfSKpAOV/5fooBTn46rfW/izFQVU4k0+4wOtzcsv8k+bYF7NKMw7s9z79QYC4G3Ot+CyYc52CBHQLX5o/j54KwRJFpvlk+4XvC9Mw5aYQQb3S2p5Gz3KGi9W6PcU77n92KQzuRbaWrKTMqBidFUytgePEV5kPvcdnVxCU89WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3fUVQcrli87utk+ftRBb49CJjFxqbu6I40QgAun1Xw=;
 b=gnoWfSVT9PG4PybRuEe9Ca9pA9H4EcENMWVyR3R0BkSKEIWXaM1db5xOryLUYtXXUq/trfLEIBN0doMCX17jGLso9gut0w8whJGLKJmx/Dg/CE8YrKkd+bCYIzpjRnNBuwiXG6GO7lhsOyvbHhQBLw4Ak7U9VOjgGlaeOnhACXM=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAVPR08MB9505.eurprd08.prod.outlook.com
 (2603:10a6:102:315::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 12:23:27 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 12:23:27 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Mark Brown <broonie@kernel.org>
CC: Catalin Marinas <Catalin.Marinas@arm.com>, "pcc@google.com"
	<pcc@google.com>, "will@kernel.org" <will@kernel.org>, Anshuman Khandual
	<Anshuman.Khandual@arm.com>, Joey Gouly <Joey.Gouly@arm.com>, Yury Khrustalev
	<Yury.Khrustalev@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "frederic@kernel.org"
	<frederic@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "surenb@google.com" <surenb@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH v6 5/9] kselftest/arm64/mte: check MTE_FAR feature is
 supported
Thread-Topic: [PATCH v6 5/9] kselftest/arm64/mte: check MTE_FAR feature is
 supported
Thread-Index: AQHb2rUCQmpbZ5zoHUCP1g1iMqncarP92RUAgAAH6OA=
Date: Wed, 11 Jun 2025 12:23:26 +0000
Message-ID:
 <GV1PR08MB105215BEA5D230BFB36D86FDAFB75A@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-6-yeoreum.yun@arm.com>
 <916e2064-efa9-4b69-b561-51b0378158c0@sirena.org.uk>
In-Reply-To: <916e2064-efa9-4b69-b561-51b0378158c0@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV1PR08MB10521:EE_|PAVPR08MB9505:EE_|AM3PEPF00009B9E:EE_|AS8PR08MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: a0321570-e34f-4abc-885c-08dda8e2d883
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?dshROWQ2uXbiGfz/miKaHPNscd8/Vdj5w18eunKP7o8GbRUyEFbdjYZ5TU?=
 =?iso-8859-1?Q?xX33ZhXwM9rnil4wI7Snw+Vxtjg7BKUTPNnVdFzAASn8EKWK5+RNIXB/0Z?=
 =?iso-8859-1?Q?klTUasxTzK+sQLhnGG33KU2F6/xOVRhAhiDbtxzsLXOpdzTx0M6prgDoPX?=
 =?iso-8859-1?Q?VuAwHwB3qQe8DzxMFHfJFSUGECVrcVNefyFg3xKyKONL4Ykf63vpjq/GuR?=
 =?iso-8859-1?Q?ak0nr/bzmGDZlbE1xod5fiV50TTRmxPoqq2Q4ejdbvtQEZt3iHlchbKyCy?=
 =?iso-8859-1?Q?ZUcbTrTEYFFqSGMhnYJ3KrYHRl9oVaqsqOXQV9sWYoWd9yw1RgquW4j/PI?=
 =?iso-8859-1?Q?YKCs+5hbpWaISAjuKkNL4WolZypHaAGgQ5UDeT9b9yq6X5iAfYw2tpTgS+?=
 =?iso-8859-1?Q?gfXKtz5e5JipgsM5wGY6wA/MxXqqbQFTabTppzTmneWTPUnZtu0Bdu61n8?=
 =?iso-8859-1?Q?zc7NjrIzI3iXFKMgLIEQEnMTH5NQS+blx9xiObT6+e4hmBG8F+YRjPrc/2?=
 =?iso-8859-1?Q?H4MYpRZAm5iAE7G1VK0xqLYG/fyenJhX3rvmtNfC11Ncu7jrdwgvExYO84?=
 =?iso-8859-1?Q?FB4FGHShOsEgYTdDWuDYCkHIPPHKK1szHF9HNK1gQXwRgLO35cGolE5rek?=
 =?iso-8859-1?Q?qsE37EYVBcw3N25oi9GRif8cZjxFTVhLBF0xTkja1snGNHzvkbQ58tY3rS?=
 =?iso-8859-1?Q?RTK/gP5KOPZ2smGBXKjFYa0Y+Wd0hNMfDO+IVHLtuNJAHpWqSKtLnytm9J?=
 =?iso-8859-1?Q?UYa69p2DnWBKxc18Xjx8ZHUF8pJ72dDEZtP9wZWVLDrXkcZodIRcscf5Zm?=
 =?iso-8859-1?Q?20Bt4V/JRhRrtDcv/+etVZxws8DJxa9yDyUVZBWdzLtni1gF71m0xCKVbE?=
 =?iso-8859-1?Q?aK1nTdZOzkBCCpuxVgHFJhYdNjOOQ4g8vj5yUqTVuiwxdFh9vj/9fXaoLq?=
 =?iso-8859-1?Q?cyX13NxwsRS4FoVON7rI0NlIo2uBVgBtCxg+ToBtFpSE9I074GUznHKFF5?=
 =?iso-8859-1?Q?5+wkguNpoFfWUzSYQ+p2FaoCSW3w9p8/jZDWWCs0Bd9UWOaIloFNxmwPu1?=
 =?iso-8859-1?Q?yL2Bn78sPM4/Zr0mCqfhuFdNt/dXkzLQ3ZLNJ0YKgZswPPGBtzNHAYV8NU?=
 =?iso-8859-1?Q?q8CjGPsMZp9hiOdbPyN7h4qIdrR/cSkXj23/8F5C4IxOjCRZnK9OWrvDUO?=
 =?iso-8859-1?Q?23JFiXQrSo5+sgY+pNYgqF6l5BT6uHAAfPgrmxkG0IYlg/cQXTrVnrj4tz?=
 =?iso-8859-1?Q?F0FxtxYHL0n0bJK2wuD3fvxbQeuZDHJq18LiKQXu20wEnll5JXlhhrNz+U?=
 =?iso-8859-1?Q?h100QUpOeUzOydxtZdj9RxDGJ1qAqVhr+IuHRwX5k4iTLenDwmBTn0Sw+C?=
 =?iso-8859-1?Q?YXgKSpBciiknDnBDLQtSKtY7Z+LOA6k4dTouTKn7fcvSqEIhjwcUGP3d12?=
 =?iso-8859-1?Q?fd9aP88BQqGkIywgCiw/uzyRfOt/kRTEClW9NwTEQjsaCXJBIMPaPOzTxI?=
 =?iso-8859-1?Q?m0E0zCA62LF/N0Ya17krEKPWhUbkU4idu1lIRRNSwyPw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9505
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1475629e-c27d-414f-7d03-08dda8e2c48b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?aoI3hOEod6MYM2nuADs+6JHlCgI8C2uqCod2phr8iJx6pgKfQD2JVPFT7z?=
 =?iso-8859-1?Q?m9NSt2Tv+O9bI6YayiujO4Yv4SbJdtxNJ9HlAqNonnjOYUoDh2xcRRdR6i?=
 =?iso-8859-1?Q?iXp/a6bVeyaovaxGHQdkctqD6/hmkZGSkgK2Nfb+v3ZeYvSOFjMZHj2REr?=
 =?iso-8859-1?Q?T2JGqHYpRrChsjPTASijYGX7UpzUovokbmhq+21DIRTwiBdS/CAr3YABPw?=
 =?iso-8859-1?Q?NAIs2uLMN8lSDVGg2TYrlozc3/W0ereZzQbd6qFGkpZaHJ30iNlD7D73k4?=
 =?iso-8859-1?Q?xfBCBiXbnXr8Lj3SuDcSi/L3b3vZbaWO29vvtii6BB/hOeK5ApzEkJkf/7?=
 =?iso-8859-1?Q?7/lNp6gOVAC2P7WyZllgcAluN4prvRugQLxJznZx7F5Tri0WJBQW3SjQBo?=
 =?iso-8859-1?Q?f7nN2Q7aoqr9fSqCYNq+6uNL+IZbDLkKUtE0zjhvlslRcbo0wyE9NVQvzY?=
 =?iso-8859-1?Q?gZbQhKwEdQDan1b7mfg8FbQbyS8GmwdL3bwFH9PwywNXa5zbsFahDyokth?=
 =?iso-8859-1?Q?3zRyJIneWSCj2sj+ZjjdqWdiiiYVSISZ/3zRB88vyEE9yxW6CnLfqH0YS2?=
 =?iso-8859-1?Q?wwYlAyoyI/9r30tuHIYPtU6LBZd8ecO/cKkURwstxjTxjzla4QaN8bvEN6?=
 =?iso-8859-1?Q?xqSK3ZVlPhsAKyaFyOrMhuhzLr2Lrtc6a+1GkGZmRurU+xm6pLPc1ybU3t?=
 =?iso-8859-1?Q?8DsfSZRhjeFFsinGU8I4T2eOZYtcRmcCDar3BL3odB8Bgggty1UoNY4Ikk?=
 =?iso-8859-1?Q?wZLGcuVxfk7RH7Bc8hUoE8Jp2s++ACYe/NKLzosbKbogSDfL9DErIz+Rwd?=
 =?iso-8859-1?Q?uzQ+jrvzCSkikdTuPD8foYY9LkDIHEMptGAkTXjal4TsHxFJ7GtKBjFcWf?=
 =?iso-8859-1?Q?BI9rEhKz70rUxVq55zKTKMONwKTJKvLWQllZrv04DyqJK50NYL6B+s/yri?=
 =?iso-8859-1?Q?Zp872zBmGk4WyMzKHRwL0x+CHkXW6TXRjQHeePrcmD0t4sZh3iPhjyWD0W?=
 =?iso-8859-1?Q?5WLJAyzxJC3I4kWGDUHYjQpEpi7l7l1HOVx52YYQLoqbN12NhHWy5gCL4Z?=
 =?iso-8859-1?Q?nUTUrMfuuFSfQzzQ9DTqCfDjg+kG7aeprqVwcrVneHxW00G7PeKD3wRL7a?=
 =?iso-8859-1?Q?Oser/xmXVsCznSk0VtpGGPhuYvDh1J7KA4wyMsTVqew5xxVrHW7vYsaxhs?=
 =?iso-8859-1?Q?XyGHhqqHfy3bPiKMaDZrkto95HjvVnwarJ9o0MBT2QkPonLTKcuF91PLD9?=
 =?iso-8859-1?Q?askHP26Pj8AMhKZDlpmWL5XjFu8ffVwCUQoHVUBK44FqyZwTdnG8mMdUIP?=
 =?iso-8859-1?Q?82bEBOP6bNiNK2L9CI3WHR0tDg8HPSmGp8q5jZ0mhBMo9sFTzMa1Vpjx1v?=
 =?iso-8859-1?Q?aFQvsWig79cOg2LFkHGqrKhSmkWl7k5+7Yrg+Uzyfoyk+50LWI1RpZ+7UL?=
 =?iso-8859-1?Q?ilJwbepF+2ABQmUJMHpaAi3gZNrAQ7Xt3nO5HQxdV7+ty7lSZtisXCyo14?=
 =?iso-8859-1?Q?ONVvIEQz06hWphLoma4unews3xHygPtEE4hhoNRYRJRREfKqJ/e7KYIymg?=
 =?iso-8859-1?Q?Pjfh+B7PtZnmxubn2rluKy/173Oc?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 12:24:00.4193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0321570-e34f-4abc-885c-08dda8e2d883
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8274

Hi Mark,=0A=
=0A=
> >=A0 #include <unistd.h>=0A=
>=0A=
> Not sure why we'd be including time.h here?=0A=
=0A=
As you mention, This is my bad for wrong plcae .. Sorry=0A=
=0A=
> > +bool mtefar_support;=0A=
>=0A=
> This is a non-static variable so won't have a defined default value...=0A=
=0A=
Right, at the first write, I declare this with static.=0A=
But forgetting when changing more....=0A=
=0A=
> > +=0A=
> >=A0=A0=A0=A0=A0=A0=A0 if (mode =3D=3D MTE_SYNC_ERR)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cur_mte_cxt.trig_si_code =
=3D SEGV_MTESERR;=0A=
>=A0>=A0=A0=A0=A0=A0 else if (mode =3D=3D MTE_ASYNC_ERR)=0A=
>=0A=
> Unrelated whitespace change.=0A=
=0A=
Thanks.=0A=
=0A=
> ...this will only set mtefar_support if the hwcap is present, leaving it=
=0A=
> =0A=
> undefined if not.=A0 If you just make this=0A=
> =0A=
> =A0=A0=A0=A0 mtefar_support =3D hwcap3 & HWCAP3_MTE_FAR=0A=
> that should avoid the issue.=0A=
=0A=
Thanks for catching this.=0A=
I'll change.=0A=
=0A=
--=A0=A0=0A=
Sincerely,=0A=
Yeoreum Yun=0A=
=0A=
=0A=
=0A=
=0A=
________________________________________=0A=
From:=A0Mark Brown=0A=
Sent:=A0Wednesday, June 11, 2025 12:52=0A=
To:=A0Yeo Reum Yun=0A=
Cc:=A0Catalin Marinas; pcc@google.com; will@kernel.org; Anshuman Khandual; =
Joey Gouly; Yury Khrustalev; maz@kernel.org; oliver.upton@linux.dev; freder=
ic@kernel.org; akpm@linux-foundation.org; surenb@google.com; linux-arm-kern=
el@lists.infradead.org; linux-kernel@vger.kernel.org; linux-doc@vger.kernel=
.org=0A=
Subject:=A0Re: [PATCH v6 5/9] kselftest/arm64/mte: check MTE_FAR feature is=
 supported=0A=
=0A=
=0A=
On Wed, Jun 11, 2025 at 10:41:03AM +0100, Yeoreum Yun wrote:=0A=
=0A=
> --- a/tools/testing/selftests/arm64/mte/mte_common_util.c=0A=
=0A=
> +++ b/tools/testing/selftests/arm64/mte/mte_common_util.c=0A=
=0A=
> @@ -6,6 +6,7 @@=0A=
=0A=
>=A0 #include <signal.h>=0A=
=0A=
>=A0 #include <stdio.h>=0A=
=0A=
>=A0 #include <stdlib.h>=0A=
=0A=
> +#include <time.h>=0A=
=0A=
>=A0 #include <unistd.h>=0A=
=0A=
=0A=
=0A=
Not sure why we'd be including time.h here?=0A=
=0A=
=0A=
=0A=
>=A0=0A=
=0A=
>=A0 #include <linux/auxvec.h>=0A=
=0A=
> @@ -26,6 +27,7 @@=0A=
=0A=
>=A0 #define INIT_BUFFER_SIZE=A0=A0=A0=A0=A0=A0 256=0A=
=0A=
>=A0=0A=
=0A=
>=A0 struct mte_fault_cxt cur_mte_cxt;=0A=
=0A=
> +bool mtefar_support;=0A=
=0A=
=0A=
=0A=
This is a non-static variable so won't have a defined default value...=0A=
=0A=
=0A=
=0A=
> @@ -273,6 +275,7 @@ void mte_initialize_current_context(int mode, uintptr=
_t ptr, ssize_t range)=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 cur_mte_cxt.fault_valid =3D false;=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 cur_mte_cxt.trig_addr =3D ptr;=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 cur_mte_cxt.trig_range =3D range;=0A=
=0A=
> +=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 if (mode =3D=3D MTE_SYNC_ERR)=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cur_mte_cxt.trig_si_code =3D=
 SEGV_MTESERR;=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 else if (mode =3D=3D MTE_ASYNC_ERR)=0A=
=0A=
=0A=
=0A=
Unrelated whitespace change.=0A=
=0A=
=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 if (!(hwcaps2 & HWCAP2_MTE))=0A=
=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ksft_exit_skip("MTE features=
 unavailable\n");=0A=
=0A=
>=A0=0A=
=0A=
> +=A0=A0=A0=A0 if (hwcaps3 & HWCAP3_MTE_FAR)=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mtefar_support =3D true;=0A=
=0A=
> +=0A=
=0A=
=0A=
=0A=
...this will only set mtefar_support if the hwcap is present, leaving it=0A=
=0A=
undefined if not.=A0 If you just make this=0A=
=0A=
=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0 mtefar_support =3D hwcap3 & HWCAP3_MTE_FAR=0A=
=0A=
=0A=
=0A=
that should avoid the issue.=0A=
=0A=
