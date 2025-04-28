Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2074.outbound.protection.outlook.com [40.107.249.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCE12AEFE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.74
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745855218; cv=fail; b=hL3JGWOiiBW5KS8SdXK1LpUDbNcAa4Qjolzml0+ggv32HGDBlUokkyhA+y0zaOiC7tKlZiRdXSOFmJtcFS+roN94DVcBKJ7cuqpjmUDovPwBm2HCkRSsq3n9sPK65PDA6vaZtI7uHcKWunxCq8MNZISEeGyNYwT+UArlWYj1tvk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745855218; c=relaxed/simple;
	bh=hLYDeChxzTyE4B9qnaXZI9kNGRT7aIYCoQGRjMpgJ4Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ku4oSCpKHHHuILV7SySmxVori6AQKeDOyZiB5hP8TJRx0lgN8AeNip1fP4WvTK37aQTyRh/HynvN/q51oFePpO9Vr+PIChQtUGahJ1mehmNjlM+m0hPnEm5Por0pAd/beuc1esJGaeEfmIUHe6cCc4Rc+DXYFIdZBBQc2x7bh2c=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lmdVZdpn; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lmdVZdpn; arc=fail smtp.client-ip=40.107.249.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lmdVZdpn";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lmdVZdpn"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aXCRRqMNAwc+QCQty/fK8i8Bm0JtN39ZHVQ4lONHCwZemU5QF8JQAkISZfx7WWHUz0ca02K3CQaC295OCM6+dy4pW0cbe0v74l8kXjMOALwryOcWcs16HWNgA8JyphEFoFVKhvz8MbY9M0PPc1w2jON8lwsk86Wd+HLknJQ2dtitVIoSZ2KLRsKrN1MZS4peOZizbw0OBn6ElH3zxkIqSnXAJoBS12ex/ivsc7S4D1bVJqzkYI+LIUOG/Z95MZuzJCkOP7hV4r1GVBXouNNbkFXt2IkqcHSL0uSCey5kPVPhZdvJru5nwRThZ7yRyX8qdDTyucWkYSgvn2Yn4wAU+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sci4zNsJXDj4J5tp8nODVX9k9vJmu3btOoqvSc66mE=;
 b=OnCbExo523JwgvH8G/+cevLOE1DDIvojBdHxSB2OwEPunfVxUbqOXNu6wRDqLBawjNuYcnOeFnwCArWt3TK01sShalWyVT9UmvYbbJ3P4yAGWoCAX259kZDs057PAoOut5/GJYEckxMKWCxgi3rEG7GQEwTiTGU+HOuAuhVPhMaEOSg5QdsoeZon5WkeYHpgO0QfW8MNufMqTNBh479moZNpY5wlShvYKtntBrfqyYZrKuxkrULH4doXOEfRhlWfgMp7Gx/KNz5UTsVVPfNYzan/7G8ESkM3TuLuDp+4Buk8JtRB8mgFwPf4K7lmAOtTm6zm73QocGiv4j5Z4kOf9g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sci4zNsJXDj4J5tp8nODVX9k9vJmu3btOoqvSc66mE=;
 b=lmdVZdpnWUBMeLDy8PRfAz2uvoTvvMYebfQ+QWbI2RgrtAM+FgydVEcmD+0dwkWqBStAnwG3yoP+7dU9c3zM1IVFCkgwX9GaOAad7KJLgEf5rSijP9L+7O0OSmgJzUpvxHxOs2PGWTv0Ya75ffeQxh4bJUo7NWQcWd9zVjAQ/dw=
Received: from DUZPR01CA0293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::7) by DBAPR08MB5656.eurprd08.prod.outlook.com
 (2603:10a6:10:1a2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 15:46:52 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::ef) by DUZPR01CA0293.outlook.office365.com
 (2603:10a6:10:4b7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Mon,
 28 Apr 2025 15:47:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Mon, 28 Apr 2025 15:46:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKDR2M1JciOvLrd0poMkdFogrA72OqthrsSS+ulut3/y/MkSClqbhSsBoYyH8aizHl9AL5/E4+wL941zMXhUZMKVZpTgBI851hvifN9bsoLPHC4CBU9Bori3YqZ0kXzHXCnQoE5EtEACNbfdXkxqmBC/vrYno57EPlYmepTu312QomuO8gVXweew+vQtWZp3vfgxvx3GjeNkBjybKY+NE32POJvIxr2HEXBkMbRRrq4MAMLlojeFXoQ4Mo9oswK5PvVuUhSaHKNJfHpnmC+J0C4Ax/5GzphfLFpSGdYQJasfXrhWiq0BAqoDNxfK0wKcWZhNVaSZ+PcCH6qbGid4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sci4zNsJXDj4J5tp8nODVX9k9vJmu3btOoqvSc66mE=;
 b=wggOT4ECu6DtgE37F1yGfdwlrEDemIfmUEF5xY5xjymdjfrI4+sz05bzG85gleAq6d+I+1MHzX2EdWs3nSKYzidQY4ccvuZz+/dmmayvamUmGaX5dTe6ewEA771QDCSmtFCb5FAsF6UMssDeGarxYQ7zmYemjfwuOenDzjDDjN2quLdQG0bjr92xzDF/Y9TODBgfcFLxcdPw0+N3JIQuUz+SE5s0pAMv98Qv0BdGlJ4noaKsz4uzxX59ZNhmEIESGjPtGjhJKTNwPkNqcYz2mePfCQnh/vPpd1sUic7+WdY0dGHIxfVaZbgCJ2jiTx+nOaN1Q75f72WwAl+NIhXWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sci4zNsJXDj4J5tp8nODVX9k9vJmu3btOoqvSc66mE=;
 b=lmdVZdpnWUBMeLDy8PRfAz2uvoTvvMYebfQ+QWbI2RgrtAM+FgydVEcmD+0dwkWqBStAnwG3yoP+7dU9c3zM1IVFCkgwX9GaOAad7KJLgEf5rSijP9L+7O0OSmgJzUpvxHxOs2PGWTv0Ya75ffeQxh4bJUo7NWQcWd9zVjAQ/dw=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by VI1PR08MB10175.eurprd08.prod.outlook.com
 (2603:10a6:800:1cf::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 15:46:18 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 15:46:17 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: David Hildenbrand <david@redhat.com>, Catalin Marinas
	<Catalin.Marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, Anshuman Khandual
	<Anshuman.Khandual@arm.com>, Joey Gouly <Joey.Gouly@arm.com>,
	"maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "frederic@kernel.org" <frederic@kernel.org>, James
 Morse <James.Morse@arm.com>, "hardevsinh.palaniya@siliconsignals.io"
	<hardevsinh.palaniya@siliconsignals.io>,
	"shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, "huangxiaojia2@huawei.com"
	<huangxiaojia2@huawei.com>, Mark Rutland <Mark.Rutland@arm.com>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"palmer@rivosinc.com" <palmer@rivosinc.com>, "charlie@rivosinc.com"
	<charlie@rivosinc.com>, "thiago.bauermann@linaro.org"
	<thiago.bauermann@linaro.org>, "bgray@linux.ibm.com" <bgray@linux.ibm.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "puranjay@kernel.org"
	<puranjay@kernel.org>, "yang@os.amperecomputing.com"
	<yang@os.amperecomputing.com>, "mbenes@suse.cz" <mbenes@suse.cz>,
	"joel.granados@kernel.org" <joel.granados@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, nd <nd@arm.com>
Subject: Re: [PATCH v3 2/4] prtcl: introduce PR_MTE_STORE_ONLY
Thread-Topic: [PATCH v3 2/4] prtcl: introduce PR_MTE_STORE_ONLY
Thread-Index: AQHbqe+ilprKLvmPak6kl/nA7+Nv/rOzXNCAgAX2o/c=
Date: Mon, 28 Apr 2025 15:46:17 +0000
Message-ID:
 <GV1PR08MB10521255DDF2BE9AF745CEF7AFB812@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-3-yeoreum.yun@arm.com>
 <390f3d5e-8da6-4286-b8a9-72eabcc3abd5@redhat.com>
In-Reply-To: <390f3d5e-8da6-4286-b8a9-72eabcc3abd5@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV1PR08MB10521:EE_|VI1PR08MB10175:EE_|DB1PEPF0003922F:EE_|DBAPR08MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: 804e35e9-27fa-4260-8eb3-08dd866be4a3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?sJKioM7LIWdJIrwXyMB5Ym8t3Yfm2pYY6VlC61JOsdHhLp2VcdwcW9yRLc?=
 =?iso-8859-1?Q?Kw29l8FNxXjniVcz+6buKxpXW6USSnST+RUbYEwDpp7MgkjvFeXZCy54Pu?=
 =?iso-8859-1?Q?BlRwMrJqWO9fk7pSQiuQQYb/4KuvfxMr00pBoe6pUs+N0aSzzmXyWlwMnn?=
 =?iso-8859-1?Q?SC8Ww6hB1UsSoAgpzw2P/bMRtCFd/Uo74xylqdhoG9HGUiPIl4zkxVK2YG?=
 =?iso-8859-1?Q?wZohChvJXmt0dI4H9YkK+hgWLTWyGpUYc0gU7jLM0nxFh4LLveLotMcUL0?=
 =?iso-8859-1?Q?CQcVCMYZ4mN3DYBW9kCzHK0c/r0Mr12xF2RZx6HfVT3oJgk8Rw5QPvTnwN?=
 =?iso-8859-1?Q?0t5mBzZn/OAuIEmpB+uSvAQB+UchH9N1U2Xtkyy60UUn4xSpn8cTA8lqSd?=
 =?iso-8859-1?Q?/mkQkiGpNaIPipPQbBc0keXWnhroBbsjuKdDmOWMp2OcrVARtQL8sRl36u?=
 =?iso-8859-1?Q?YroY95RiC2EQbBGvL6xICeWlzX9eGqsezqwlPIveWj+IrTg8sB0w0AcR+e?=
 =?iso-8859-1?Q?n5TUUvaklNn2kJFKGnWhliZWTGJDJllYgmhNErMbuFBP277hrH/9TBaksC?=
 =?iso-8859-1?Q?VD2mGyiRichT0O+B2EwUsjgXW7/rUbMgobkL2BRdrJ5P3vfH8jPRdyAwqN?=
 =?iso-8859-1?Q?gR3cB/lmQcV/mlTW0Cst0wW8p0ValjRu06afW4EZiI9AX+8VRngZS4Yy6n?=
 =?iso-8859-1?Q?Zz1zhFqMQyiAQsT3EMRKTW13DiBxVz2yYiyDjkaV7e2uQfFQz/5xDdId53?=
 =?iso-8859-1?Q?HUmjYUaHpcW+Xoh6J1RlT+jm5rh0xKmXCa2nUiKA1Az+s5/b0/HJfWpIf7?=
 =?iso-8859-1?Q?0OMNT8ikNOipHySO1+m/A2K+JI/vNNZv+BJ7nreM7f1dk05Lc15vj/1PuB?=
 =?iso-8859-1?Q?7mG7cWlJ8QLkfPXHY4gHq1Oo9Og2KDaOBcuNfl8LmqHBkcbz6z9HxeI+47?=
 =?iso-8859-1?Q?4tlyUN+F2GeZ/yeuiQ+QuZkzjN14xcVDeBdMWyunxudnNgnRDA2JOMnueC?=
 =?iso-8859-1?Q?bazlNQrIlt3EUCkjtgJieGcuWLuo2vUNOwva875XMNMR6psjSUqBIqFQoU?=
 =?iso-8859-1?Q?wy4WhhJ/beNDslNti4/61yxHoM56eNy4ugtu8cSTLUMznRrdlKmsuSTy24?=
 =?iso-8859-1?Q?a+KAjyOlXGAS9liZl+u/KWC4SvU4yZxCqpknx2baHkGz9aDExwlXFePuYd?=
 =?iso-8859-1?Q?h7Jfzk+xLOOMoz9e5iBcEnrTUL/Gn4VSN9LBixMVc55DKyKnTQy9l07tmo?=
 =?iso-8859-1?Q?sQ1A5HXifHLuE5PkxHZaaoXis30Rmk7Ocv4LU5oAbS1cTE3JWjE8oPjCk9?=
 =?iso-8859-1?Q?VI0MF8Nk5DaaD+zC7w/Nlx7eQ8QBSx7M1xdNdofMTdVkT0QddZ3QsCBZe+?=
 =?iso-8859-1?Q?+Yh4Wt0CSVsbyKqpPSC0cUYGM0e7sabWjC4n5CBeuQJSigsS0kJbIjfAvd?=
 =?iso-8859-1?Q?8h4PH110wBfPEtUChH1LpxMFApTspvNMZZneb37V29WptD47eXHBoomxWZ?=
 =?iso-8859-1?Q?H8jaYZyl3BfN4c2wBZYtZS4k1PZzuOZopEL16/QF4aCEXRU8Pbmjk02n3S?=
 =?iso-8859-1?Q?1rv7MqQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10175
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7eed2e50-4d2e-4d6c-c56e-08dd866bd0af
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|376014|36860700013|82310400026|14060799003|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?47xiwg6NWDmy9rRHjfemv+WWWkH8CYpjKk7wk6z7mlRcHshsMlCKrWe4Lk?=
 =?iso-8859-1?Q?uZJcHS2Yv08OOzSu/85dMOiDUKIT2TS7RWCuD4ht0LEm+cKifuJCr040Tn?=
 =?iso-8859-1?Q?hfhJ0/pfCOTOhSd/w67JViUHfw7IQeGMtMspKp45JlUuLTuvQFUKC0iTB7?=
 =?iso-8859-1?Q?sr/oktM9qP5lSXBPWhKUY9xC8uDPRBI4T7/ESAiVyp4nsDmOHk4YnMv7QI?=
 =?iso-8859-1?Q?XpyFTJ7tjqqAwU2aNJfLjnq5OPaTddJ2Zxl+ReBiAoBrLnVD75oeuzGLuJ?=
 =?iso-8859-1?Q?c3HlPqFGKmdJHI+9o1tw8kCyWRs7yW60vkJUjqWwuEM/DyIJRSmUhYvKmg?=
 =?iso-8859-1?Q?+z4RqMw2yQbRVr0jYcmmnHgfHuOOHhDv7q4ZNHYTmJqmnsLI/c/ZEAqHbQ?=
 =?iso-8859-1?Q?GaJCSj4JBdkNM+rzzbd5BGdZC5Cx0RHDiF7XTPYEZ3meB7uPKcHVyH/bld?=
 =?iso-8859-1?Q?HhyDPoXkyhQ4O1S5nSXSJN+YqQXg7s99vJ7YVRSh4C3v1XDBG3Cl7LbIZq?=
 =?iso-8859-1?Q?GXa+GCw7eYdH2RGeB/O3zxL1KkNFUGNwGX4GmOPqp72cZlovagy7rk2lhH?=
 =?iso-8859-1?Q?7mvbQHJJzq6QTvN6EW4BTgLri3otsezjzRNCipzfkRZsgJcf+k9otBStec?=
 =?iso-8859-1?Q?3Gok4OJPwdVzwXnWE8A8+TFbxITlI9mvZJLTuVjcc1TRNobIRSD3IgM/uY?=
 =?iso-8859-1?Q?O13T09ZumXRdc+IpS7rp1rqfZknv9HTsbfqxzesGs59xCBFJxbqssLWwIe?=
 =?iso-8859-1?Q?kp4n5guw1XnwbYvbTxtOg9ga1Tm8EcawQfMRCRunjYRIaewwrfnmtO4tXI?=
 =?iso-8859-1?Q?htiqZQfWv4DNMDUP+hhJ+fK1rFVwPQgHeOp3mLkGTz+blmruNWyIqFqiUk?=
 =?iso-8859-1?Q?ioSOCTlWESWW3zIvV9oDheoV++CNbdKC/Z8M+HCu6uJ47kt8OpO5tHGZxw?=
 =?iso-8859-1?Q?1HhujUagKJijmD0AXd+SWlf6T8lsk1vKOCN7h4n7v9lkppmy8O86+D8qTo?=
 =?iso-8859-1?Q?fmQrcvrLimp5uNb4SHckeXL9tTNkHx1I9DgK4+BTHMoIX/T473LGHfIOaO?=
 =?iso-8859-1?Q?eIErWl2r5eyzi/vILqjVsPmNfZMqdRcmSa6ZozHtNX+txRuH+fXMVSQUAi?=
 =?iso-8859-1?Q?FjF4BiKA1HGAKxdJb1ExZ1uxbIxerB8m5KbyZjixUjokEq4uiBndx0hhlD?=
 =?iso-8859-1?Q?GLAKeBqJTHYtx9YUK9bBz8IfrASatK+FomjZz/EYGaWNO2XMuGf3nFQlCZ?=
 =?iso-8859-1?Q?NQ4VtWMEzG/9lrtA9CYTzD54Ow7HzpOWj1RApM/rwkSgqgAV9G8Y6IUfXR?=
 =?iso-8859-1?Q?8xFc2bjBdKrWnSCOWASYNFaun2/awfUtzigmwrUmxR0PqvDmONBN0Wqlpk?=
 =?iso-8859-1?Q?GG6GRL8qwWD9pXo0tbR2KrtUmSWNN03HDv0ylvqj3ZpXW5U6lqMrkkjJkL?=
 =?iso-8859-1?Q?scuvhdWVvJKvxaaU8dRAB83Lc/jLiIHY3vVnCDNNAsDJmIvTgRdYxIA7RQ?=
 =?iso-8859-1?Q?jFZiE4rMMjTFKEKUuuWofwSwjUvNVSPMi8ZEpj4uFG+3VDyWsL+QDJ0W7m?=
 =?iso-8859-1?Q?D5owYF8+dNkBICoUDREK1rvrhBarm4HXgcfevvm/xfRjnjx6uQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(36860700013)(82310400026)(14060799003)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 15:46:51.1055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 804e35e9-27fa-4260-8eb3-08dd866be4a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5656

Hi David.=0A=
=0A=
> > PR_MTE_STORE_ONLY is used to restrict the MTE tag check for store=0A=
> > opeartion only.=0A=
> >=0A=
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>=0A=
> > ---=0A=
> >   include/uapi/linux/prctl.h | 2 ++=0A=
> >   1 file changed, 2 insertions(+)=0A=
> >=0A=
> > diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h=0A=
> > index 15c18ef4eb11..83ac566251d8 100644=0A=
> > --- a/include/uapi/linux/prctl.h=0A=
> > +++ b/include/uapi/linux/prctl.h=0A=
> > @@ -244,6 +244,8 @@ struct prctl_mm_map {=0A=
> >   # define PR_MTE_TAG_MASK            (0xffffUL << PR_MTE_TAG_SHIFT)=0A=
> >   /* Unused; kept only for source compatibility */=0A=
> >   # define PR_MTE_TCF_SHIFT           1=0A=
> > +/* MTE tag check store only */=0A=
> > +# define PR_MTE_STORE_ONLY           (1UL << 19)=0A=
>=0A=
> That is the next available bit after PR_MTE_TAG_MASK, correct?=0A=
>=0A=
> Would we want to leave some space to grow PR_MTE_TAG_MASK in the future=
=0A=
> (could that happen?)?=0A=
=0A=
Yes it is. But I don't think it would grow up=0A=
since  GCR_EL1's exlude field size 16 bits where PR_MTE_TAG_MASK value is s=
et=0A=
and the next bit is used by other purpose. =0A=
=0A=
thou, exclude field would be some bit filed in GCR_EL1=0A=
AFAIK there's no plan to add new exclude field to extend=0A=
and when new field is added for this, I think it would be better to add cor=
respond=0A=
MASK for the new field.=0A=
=0A=
Thanks.=0A=
=0A=
---=0A=
Sincerely,=0A=
Yeoreum Yun=0A=
