Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481591E98EF
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.23
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745737434; cv=fail; b=hejv6iPyuQlSM0LCiMrcF9E2337p69pSCdUwr899OQdfdywZQJn/9T5YK9l06n6vaeV+ymXshuk5W/35/LV+aH3ImhjMGtqyuoMCTeEjsH0SuA15IlR+414QisnoZF8GzxW+P3I4yrNIctYKfYyyhV3nygjOcXgbQ3sB5RLU27Y=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745737434; c=relaxed/simple;
	bh=/HghYBAACbHweNNFTJQaY+8WtEAAftsqvF9W+w9K34w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s1mP/bQj+2yrfqchmtqv2VM4fcp21rjimk0ULEnAYZAueY9j4KfSab2eJhsiXNbVzqVmnV5MFZVLJnlv3p54DqM3QikOFvQmwVCnuahhYy4zmIkEIw2skS+tbo8kg0PjkxlOogeolr0/yhnvGy0hxEQehnoBeYFbhi1s4t6aG9c=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MFjAmCTt; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MFjAmCTt; arc=fail smtp.client-ip=52.101.70.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MFjAmCTt";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MFjAmCTt"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PqoogYAIUP3YDZBuo7Yngy/N2R+xuJ0/Oz8PpnFUIoNZpWD3VxHmeDvvQBwRonTw29p0j8qEaUZis5UiVw6hqBPx6TKQekInbKgx5L5ypqx4lm05mMBVafDYn3u1ayDSsIY+AV8LRItD9nB2pn3v5R1g08TfFHA52zS6QiyIkBKo7oJOi0uVjcXU8Ls/D+aDnDQ1c9xgb93GwoaQbPNwliKA7/ozu4Iix0eXJt/qx/sDO1KcCzsPrindCt273X2o5ppBA/DB1uDA88L8+Hp3dNjGAQux7H+hIrAwBQExYr9T1l/ASkzNjleJW+PcAM6wq/nn6o9rbT23pLCAUMVaGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqiOfG7awBp8QACRNcnoQNaF7HETdKA8bp9hqhJayF8=;
 b=q85dsM/qStzZKPl6zxXjAFnmv1ad3Wb6YbRyGm7BLN4VteRxoF6w4a4nh+c9/U9dhHVTLzRrUcbVl6BgrrXn7C2q+5M3bcFymeml9sr7ym1bKcDe8m4hzWiBf3rABT0TtIP47DIZccE2xwWoH7ADHMGkHL5cpvZdwTlk5/Nz1J7KiKC2QsqMd6eNR4v5bHc9Zznvceqg9rf9OiR0LPPs07wgbxRE+fz7jBZ/VoPXXwWGL3EhluvOD0yNcHJgYH54rC0ZFtF42I9vL525ow5QIOZn/1On+Dserbw5q7WxLamOdlvQj0V/ueZP7xKqEjxyxC9LPeFixgtlN13autKSiQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqiOfG7awBp8QACRNcnoQNaF7HETdKA8bp9hqhJayF8=;
 b=MFjAmCTt/W+STRLrqwqlil/YQt1KlGKfGHCiYg6ulRtDcShdRs/GJDCiy0wbUk++EG/4fAsDZnDSHOfvUdd9DRe8twk3qS77XXvB0HNbrI73VnshSgaxd3dujPKQiwVCJRASbaNz50dZNzdVD38b4csJ5RLgqCM8lucMJhqD0ks=
Received: from AM0PR02CA0015.eurprd02.prod.outlook.com (2603:10a6:208:3e::28)
 by AS8PR08MB7693.eurprd08.prod.outlook.com (2603:10a6:20b:50b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sun, 27 Apr
 2025 07:03:47 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::a0) by AM0PR02CA0015.outlook.office365.com
 (2603:10a6:208:3e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Sun,
 27 Apr 2025 07:03:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Sun, 27 Apr 2025 07:03:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XB/L6+v3vIaE0bsqqpFbFIY7BfmmyekSOb+9aMYe/RFADViqL/YIHLTs5sZLQ0VUaJufCBK/TjLu9SEflWxmYuGxB/qSLz4x9hE1TbJVxB3EaBctJYxaNSweyzIlHjcAiLKF1biC9+/Q64toWzLe3lomjGSW59TIo7UsvwiR6MPHKtJicAgMlmHZ5aY/LN3YgocU108S8L37GvAT/Nbn886KxosfHdwzFwmFfSafX7tIZfrz3L3bpolaOUs77hwCcXUFgYUsAcsb7U0S0Lgc3d2pIHJ6usTFVCImDAVQ5mYygAlMAozSz8FOxfKT387Q9aoKwfK5G4bvEiK78AUW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqiOfG7awBp8QACRNcnoQNaF7HETdKA8bp9hqhJayF8=;
 b=KW9MQBbjXDV2CgcoK03/GAIlBgiI3tJajDUhPt25D5WHYP3Fnh5N0ZbNsmNnz/Y+d9nhKKinAIYOUqVIIQXSXkD+F1faBdzZ/3SEmEc19w90vXm8XP+VbCUYlFg5jgYIph60qdi7KWVr+rvZcM1HlrHuk6LUnkO28FNnRF0F9raImDI4XMv9OOYe8M0SawFgRjss8voSHcQ1eILKaUipaZII17wk1BMwpG/7FHft7UKI92Mr4K9m2JzEpFvOWAYtsuI0HUQuBtgLmIWH2dCzd7yedRjxnYEySuhccej7g0luVHEVxqNSEfR9J+eBurwUedvFmjki9ATqtB492NuoMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqiOfG7awBp8QACRNcnoQNaF7HETdKA8bp9hqhJayF8=;
 b=MFjAmCTt/W+STRLrqwqlil/YQt1KlGKfGHCiYg6ulRtDcShdRs/GJDCiy0wbUk++EG/4fAsDZnDSHOfvUdd9DRe8twk3qS77XXvB0HNbrI73VnshSgaxd3dujPKQiwVCJRASbaNz50dZNzdVD38b4csJ5RLgqCM8lucMJhqD0ks=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by VE1PR08MB5837.eurprd08.prod.outlook.com
 (2603:10a6:800:1a9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Sun, 27 Apr
 2025 07:03:13 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 07:03:13 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Leo Yan <Leo.Yan@arm.com>
CC: Suzuki Poulose <Suzuki.Poulose@arm.com>, "mike.leach@linaro.org"
	<mike.leach@linaro.org>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] coresight: prevent deactivate active config while
 enabling the config
Thread-Topic: [PATCH v4] coresight: prevent deactivate active config while
 enabling the config
Thread-Index: AQHbnPFwTPg9POyxs0aDmE6nXWCAq7OD+FGAgAEQy4CACy9xeoAnEmdD
Date: Sun, 27 Apr 2025 07:03:12 +0000
Message-ID:
 <GV1PR08MB10521D3EAE6192A79365921FDFB862@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20250324191740.64964-1-yeoreum.yun@arm.com>
 <20250325151803.GD604566@e132581.arm.com> <Z+OuATAe31GbcKZ2@e129823.arm.com>
 <GV1PR08MB10521AA4C5A9DB3CECDD4E36BFBAF2@GV1PR08MB10521.eurprd08.prod.outlook.com>
In-Reply-To:
 <GV1PR08MB10521AA4C5A9DB3CECDD4E36BFBAF2@GV1PR08MB10521.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV1PR08MB10521:EE_|VE1PR08MB5837:EE_|AMS1EPF0000004D:EE_|AS8PR08MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eef035e-aa80-446d-48fc-08dd8559a742
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|7053199007|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?gtXN0Y0hz9zc+ObizTR44eLLacVpGCYIkh1Di/d6C3m1BeaNNCdZQvDS1JcB?=
 =?us-ascii?Q?Rr346wmzoVV0y1s1n8YNV0pdtafaPP852tt7ef7QvXT5mWllVD9jYw7qqsMs?=
 =?us-ascii?Q?nD/nRvyHlqxOVdwIqRn52HOaiHr2gfOGaVTrqeP6LcCNDdo8XlTHctju2hec?=
 =?us-ascii?Q?b8v5JjnVopmIxMi2iJ+Iwp3iv7NEaLB/jcB/v+eZXMBISJJDxq93/8rIwPex?=
 =?us-ascii?Q?dXv20aRdwKvcKrbfDvDT5yxSwWTOgJ/beOTBBU15keWvBCni/sSwLdsa0CMo?=
 =?us-ascii?Q?Zp/l89W5s3qzv0bCX4kwBEDi7sPDdUhX6SRa1qfBlo9jJEpLwuPSWncjIRp7?=
 =?us-ascii?Q?B5luwYSb5O/XwbevB5nhZboVrJ7tcSTFtGTm0emESeLAy/cdMeJzyP+7Zzpv?=
 =?us-ascii?Q?unbp1GDCs9Nq3cW2RGy9YkkYb+aJdYIp6wQRNE0S07gXw4KFsaHLCQ5DtJIc?=
 =?us-ascii?Q?K6UY9argH7GOX9T21WuaGXtUgzJekABCwisNGRlp6tpBAxBy4V2mvpqQgUb/?=
 =?us-ascii?Q?YJlBk6y20CGCh0skwUE5L6/Ky/klUEHjoI0KIVlR+33TbouoFWIhr7o6e92q?=
 =?us-ascii?Q?Asl9F7ZJxqEr19U2PS+WloD8WjS+QkPbGIdW3isduELTNe2LGyW/zzZIstF5?=
 =?us-ascii?Q?vvHhfn1hl2KBeEHOpg2ITaqt9X4DGyg1sEGwNqP6iaxtlWAvsHl+iqMu0M6e?=
 =?us-ascii?Q?iY3MaHML4wnc01xQ8khJcTSVj5UKRu5ufQAGPeA+Duoxbs8ZG92X2GZMuPwM?=
 =?us-ascii?Q?YOx3pCqzxpQAf0H6JsVEFv8mt6cHoXnnyQoflsgnBwLBmf42q2TbiLuM8lB4?=
 =?us-ascii?Q?2/x8IQj9Ytd363npegsCWCH5YXKvZB66mRLdlKUxAW4/ayWlmUWqcF+PtAvn?=
 =?us-ascii?Q?DPQA5aRgBI1pDRy0oQSmfOpMbMbV9r1nLZnor1fBlVsYD6yN6QQ02lDBZiPi?=
 =?us-ascii?Q?UAaN3o5C4Hj0p5O7jQvL3YX4LYNcTeDCRE0jNWpLCY0qyFe1xlDH1SaOaRRS?=
 =?us-ascii?Q?nq+/VcWh1autTsm2louib8uMrloyG2b0KwYjaGWzk/qiiKZavWJN5h5fT60Y?=
 =?us-ascii?Q?e1DpIbPfjCkFQVCt6IJN0u81FbuGU6AyKqKFmcPY0v66utxO39rp5QxzS+Gd?=
 =?us-ascii?Q?r3p+8Oyb1C59QvqWnW1I6246Fw1gPU086iIrS9M69BCu+gb5AQweQpC+Dsbu?=
 =?us-ascii?Q?DhH/mAylNlWXSiocyuc+ObBnhzTQce4Rvz8f4ZuECHbudcn0tZLW8dnpw/9B?=
 =?us-ascii?Q?E4kZQfVAQg+PstcaDWLd3Mm/02T84qqiL4+tWaFttwh+d5qBWQvli+7VWoG4?=
 =?us-ascii?Q?nkUDbFmZaTmqni7D3xsiG83aq/Xh9GYa6Hh4XhtDH2kiti2YUNykNie1QjYm?=
 =?us-ascii?Q?09ILWityMqNJvMpgvG0btVa4kUJYdXizXMjQYPiWm0hcVd+KWigoJ2rduZWg?=
 =?us-ascii?Q?N2yPPZsdvK93PZaBuX38XQNAHkzujTkPjczKy++jW3kJPmxDCitz0wMye6WR?=
 =?us-ascii?Q?EPQx6wxNFAX3Gfk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5837
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	916f62cf-e9ce-4491-9f9a-08dd85599369
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|36860700013|35042699022|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YLQPb3IBM+7L7lBB+lo55akxBZdnnUwF7JNoTDybF/tDoDHHKNtlV0RPLw2y?=
 =?us-ascii?Q?8HzJe6akNDNmJ99uyORVvOePdgXBniyJd6WOTxN42OZt/HH82gTpVxgBNK3i?=
 =?us-ascii?Q?Emrd2lkYnQgV7IWa7dlg17XtBjYO6uJxFwNIc7B0lM3P09+9SRaJXQd5Td1r?=
 =?us-ascii?Q?+JWCb8AIL59SWipKgZpflYZ09LwiKf0aduDHdR3Y1v2NeulKasEHu6TQ4fo8?=
 =?us-ascii?Q?fXVh4qYp2110qkNfHVHqlXLWVkplt3EnW6YihpRVvzsIxtBBA7D5RedoGBfA?=
 =?us-ascii?Q?/3p5X1vZ/hn474q6QvgjKHtim/NxDU2tMRK+gewDtry8Puo/8D5n+Z5szFcq?=
 =?us-ascii?Q?ZmwqpbQMcioKE5qD6hOJxQ/dLmqXxfVKGvRt0s/3DC9nrWHybEnG84VwqgrC?=
 =?us-ascii?Q?tk4wKNmMqJy7me6RqIxZ1+MDj/kRrYkvCqKSUiF1OXdxMRIZC/mcZdJb0Q9b?=
 =?us-ascii?Q?A8T3yA3kIkvLdueT3G7tqWxclK2/i3+kJvnmOTdJgW8i9kyQl927yEjU9Ux/?=
 =?us-ascii?Q?tGRJmR17tHvjjCTmbeTC6eKfAA0h0H7Bqbu+JUm//5uDE+0eLLqaBwnk2St3?=
 =?us-ascii?Q?eCaarI3kYhH9LnJe6VlXJlBbsGuK9KE8AIdCYfkKWd8lc9ofI7GpUH3aiOwo?=
 =?us-ascii?Q?nvdmuIGLh7gmWfky6ErFRsawQCb+Y79aMxsGNmDqI2WkhKh0NlaUIYBbk5Bf?=
 =?us-ascii?Q?U7F5uDJPkNUmol7s9eK91vD68sZ8fl+crBJBb/fHl3/hdv5tlMbNCeADLj8G?=
 =?us-ascii?Q?vAFRbA0BljtKoPdj/jHxIQ+w3xsNUGXKXDH+v8wwA/TZvSmzBL8h/rCafZvr?=
 =?us-ascii?Q?WYBsnPKLUqIAy/RME6BczvzKN1FcFrnkJsIvfwhZ74vrywiNyl7ILhmi8yg+?=
 =?us-ascii?Q?o526f5lVSklYhQ8BAUQkPdjYpq+JjF0XqWrHQlvVF9LOX9JbssNUBSc29ZU5?=
 =?us-ascii?Q?BjfTJeDsXSu6JQ5eN/Bgfz5tvuvYQ8xEI797QjFmcmy6jxp26+Drk/e5HZEa?=
 =?us-ascii?Q?mNCJG9oYwBMXGRlBcJ5jMHdvvhuofc6a8m7ur9OYZmCsGtsS1wmtfdGuh614?=
 =?us-ascii?Q?v6qpMXDuzs7hM7kIPvzM/6E6GrCK5qaKRbF2hX/+aV8FbGohePiKeG5W8JqA?=
 =?us-ascii?Q?6uU+OWRvD2IlBwmAEToiixUJ9VhPV/orDgYgchKfuVRC7So27MaJ5MEl8ar5?=
 =?us-ascii?Q?jLOz48dKqj/owkAwUP6Y1ojt93KjsO73jXbuirQhBYDBDApUOeEZKk8hKJ2c?=
 =?us-ascii?Q?BxdfhznFLDMRhEUNfbZe6bf6fTYitLuGKYSqq/KWinQqMVzu54KuYlsLjJ6U?=
 =?us-ascii?Q?SuyyXwJU+XfIO73f+QUwC+NVJQQAY7bAEUKtAvc1IYxGBCtEiUmcEZt1RMg5?=
 =?us-ascii?Q?mjjryMBbWP8VZaVUg0Q8bOiFMFaN4f4D41Pj/CE/QYDNKXhawM4NlY8tsHT+?=
 =?us-ascii?Q?LktboSZI93b5aDdV5gnaXEoc4bO0gRqtPnpoP8eBI9OYEBa5IrBb/vwx98FM?=
 =?us-ascii?Q?dqnhiQXGEy2Iu5pY18Htprh4vxJ0XEJ8seGX/ic6vjrTGO5fp/ORzxWXOA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(36860700013)(35042699022)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 07:03:46.0263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eef035e-aa80-446d-48fc-08dd8559a742
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7693

Gentle ping incase of forgotten.

________________________________________
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
Sent: 02 April 2025 11:23
To: Leo Yan
Cc: Suzuki Poulose; mike.leach@linaro.org; james.clark@linaro.org; alexande=
r.shishkin@linux.intel.com; coresight@lists.linaro.org; linux-arm-kernel@li=
sts.infradead.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] coresight: prevent deactivate active config while e=
nabling the config

Gentle ping in case of forgotten.

________________________________________
From: Yeo Reum Yun
Sent: 26 March 2025 07:34
To: Leo Yan
Cc: Suzuki Poulose; mike.leach@linaro.org; james.clark@linaro.org; alexande=
r.shishkin@linux.intel.com; coresight@lists.linaro.org; linux-arm-kernel@li=
sts.infradead.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] coresight: prevent deactivate active config while e=
nabling the config

Hi Leo,

> > While enable active config via cscfg_csdev_enable_active_config(),
> > active config could be deactivated via configfs' sysfs interface.
> > This could make UAF issue in below scenario:
> >
> > CPU0                                          CPU1
> > (sysfs enable)                                load module
> >                                               cscfg_load_config_sets()
> >                                               activate config. // sysfs
> >                                               (sys_active_cnt =3D=3D 1)
> > ...
> > cscfg_csdev_enable_active_config()
> >   lock(csdev->cscfg_csdev_lock)
> >   // here load config activate by CPU1
> >   unlock(csdev->cscfg_csdev_lock)
> >
> >                                               deactivate config // sysf=
s
> >                                               (sys_activec_cnt =3D=3D 0=
)
> >                                               cscfg_unload_config_sets(=
)
> >                                               unload module
> >
> >   // access to config_desc which freed
> >   // while unloading module.
> >   cfs_csdev_enable_config
>
> I am not sure if this flow can happen.  CoreSight configfs feature is
> integrated into the CoreSight core layer, and the other CoreSight
> modules are dependent on it.
>
> For example, if the ETM4x module is not removed, the kernel module
> management will natually prevent the CoreSight core module from being
> removed.
>

No. Suppose some user writes custom config module for etm4x using
cscfg_load_config_sets() cscfg_unload_config_sets() in init/exit of
module function.

Although it's rare case but it can happen while  above 2 interfaces are
EXPORTED.

> > To address this, use cscfg_config_desc's active_cnt as a reference coun=
t
> > which will be holded when
> >     - activate the config.
> >     - enable the activated config.
> > and put the module reference when config_active_cnt =3D=3D 0.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> > Since v3:
> >   - Remove enable arguments in cscfg_config_desc_get() (from Mike).
> >   - https://lore.kernel.org/all/20250109171956.3535294-1-yeoreum.yun@ar=
m.com/
> > ---
> >  .../hwtracing/coresight/coresight-config.h    |  2 +-
> >  .../coresight/coresight-etm4x-core.c          |  3 ++
> >  .../hwtracing/coresight/coresight-syscfg.c    | 52 +++++++++++++------
> >  3 files changed, 41 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/h=
wtracing/coresight/coresight-config.h
> > index b9ebc9fcfb7f..90fd937d3bd8 100644
> > --- a/drivers/hwtracing/coresight/coresight-config.h
> > +++ b/drivers/hwtracing/coresight/coresight-config.h
> > @@ -228,7 +228,7 @@ struct cscfg_feature_csdev {
> >   * @feats_csdev:references to the device features to enable.
> >   */
> >  struct cscfg_config_csdev {
> > -   const struct cscfg_config_desc *config_desc;
> > +   struct cscfg_config_desc *config_desc;
> >     struct coresight_device *csdev;
> >     bool enabled;
> >     struct list_head node;
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drive=
rs/hwtracing/coresight/coresight-etm4x-core.c
> > index e5972f16abff..ef96028fa56b 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -1020,6 +1020,9 @@ static void etm4_disable_sysfs(struct coresight_d=
evice *csdev)
> >     smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1)=
;
> >
> >     raw_spin_unlock(&drvdata->spinlock);
> > +
> > +   cscfg_csdev_disable_active_config(csdev);
> > +
>
> In general, we need to split changes into several patches if each
> addresses a different issue.  From my understanding, the change above is
> to fix missing to disable config when disable Sysfs mode.
>
> If so, could we use a seperate patch for this change?
>

It's not a differnt issue. Without this line, the active count wouldn't
decrese and it raise another issue -- unloadable moudle for active_cnt :(
So I think it should be included in this patch.

> >     cpus_read_unlock();
> >
> >     /*
> > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/h=
wtracing/coresight/coresight-syscfg.c
> > index a70c1454b410..6d8c212ad434 100644
> > --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> > @@ -391,14 +391,17 @@ static void cscfg_owner_put(struct cscfg_load_own=
er_info *owner_info)
> >  static void cscfg_remove_owned_csdev_configs(struct coresight_device *=
csdev, void *load_owner)
> >  {
> >     struct cscfg_config_csdev *config_csdev, *tmp;
> > +   unsigned long flags;
> >
> >     if (list_empty(&csdev->config_csdev_list))
> >             return;
> >
> > +   raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
>
> I think we should use spinlock to guard the condition checking
> list_empty().
>
> Here the race condition is the 'config_csdev_list' list and
> configurations on the list.  For atomicity, we should use lock to
> protect any operations on the list (read, add, delete, etc).

Interesting... Would you let me know which race it is?
here to check list_empty(), it already guarded with "cscfg_mutex".
However list_del() is special case because iterating config_csdev_list
can be done without cscfg_mutex -- see
cscfg_csdev_enable_active_config().
This gurad with spinlock purpose to guard race unloading and
get the config in cscfg_csdev_enable_active_config()
(Please see my response below...).

the emptiness of config_csdev_list is guarded with cscfg_mutex.
therefore, It seems enough to guard iterating part with spinlock :)

> A side topic, as here it adds locks for protecting 'config_csdev_list',
> I am wandering why we do not do the same thing for
> 'feature_csdev_list' (See cscfg_remove_owned_csdev_features() and
> cscfg_get_feat_csdev()).

In case of feature, It's okay since it couldn't be accessed when it
gets failed to get related config.

When we see cscfg_csdev_enable_active_config(), the config could be
accessed without cscfg_mutex lock. so the config need to be guarded with
spin_lock otherwise it could be acquired while unload module
(after get active_cnt in search logic cscfg_csdev_enable_active_config()
and other running unloading process)

But feature list is depends on config, If config is safe from
load/unload, this is not an issue so we don't need it.

Thanks for your review!

> >     list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_li=
st, node) {
> >             if (config_csdev->config_desc->load_owner =3D=3D load_owner=
)
> >                     list_del(&config_csdev->node);
> >     }
> > +   raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> >  }
> >
> >  static void cscfg_remove_owned_csdev_features(struct coresight_device =
*csdev, void *load_owner)
> > @@ -867,6 +870,25 @@ void cscfg_csdev_reset_feats(struct coresight_devi=
ce *csdev)
> >  }
> >  EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);
> >
> > +static bool cscfg_config_desc_get(struct cscfg_config_desc *config_des=
c)
> > +{
> > +   if (!atomic_fetch_inc(&config_desc->active_cnt)) {
> > +           /* must ensure that config cannot be unloaded in use */
> > +           if (unlikely(cscfg_owner_get(config_desc->load_owner))) {
> > +                   atomic_dec(&config_desc->active_cnt);
> > +                   return false;
> > +           }
> > +   }
> > +
> > +   return true;
> > +}
> > +
> > +static void cscfg_config_desc_put(struct cscfg_config_desc *config_des=
c)
> > +{
> > +   if (!atomic_dec_return(&config_desc->active_cnt))
> > +           cscfg_owner_put(config_desc->load_owner);
> > +}
> > +
> >  /*
> >   * This activate configuration for either perf or sysfs. Perf can have=
 multiple
> >   * active configs, selected per event, sysfs is limited to one.
> > @@ -890,22 +912,17 @@ static int _cscfg_activate_config(unsigned long c=
fg_hash)
> >                     if (config_desc->available =3D=3D false)
> >                             return -EBUSY;
> >
> > -                   /* must ensure that config cannot be unloaded in us=
e */
> > -                   err =3D cscfg_owner_get(config_desc->load_owner);
> > -                   if (err)
> > +                   if (!cscfg_config_desc_get(config_desc)) {
> > +                           err =3D -EINVAL;
> >                             break;
> > +                   }
> > +
> >                     /*
> >                      * increment the global active count - control chan=
ges to
> >                      * active configurations
> >                      */
> >                     atomic_inc(&cscfg_mgr->sys_active_cnt);
>
> Seems to me, it is more reasonable to use 'sys_active_cnt' to acquire
> the module reference instead of 'config_desc->active_cnt'.  The reason
> is 'sys_active_cnt' is a global counter.
>
> > -                   /*
> > -                    * mark the descriptor as active so enable config o=
n a
> > -                    * device instance will use it
> > -                    */
> > -                   atomic_inc(&config_desc->active_cnt);
> > -
> >                     err =3D 0;
> >                     dev_dbg(cscfg_device(), "Activate config %s.\n", co=
nfig_desc->name);
> >                     break;
> > @@ -920,9 +937,8 @@ static void _cscfg_deactivate_config(unsigned long =
cfg_hash)
> >
> >     list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item=
) {
> >             if ((unsigned long)config_desc->event_ea->var =3D=3D cfg_ha=
sh) {
> > -                   atomic_dec(&config_desc->active_cnt);
> >                     atomic_dec(&cscfg_mgr->sys_active_cnt);
> > -                   cscfg_owner_put(config_desc->load_owner);
> > +                   cscfg_config_desc_put(config_desc);
> >                     dev_dbg(cscfg_device(), "Deactivate config %s.\n", =
config_desc->name);
> >                     break;
> >             }
> > @@ -1047,7 +1063,7 @@ int cscfg_csdev_enable_active_config(struct cores=
ight_device *csdev,
> >                                  unsigned long cfg_hash, int preset)
> >  {
> >     struct cscfg_config_csdev *config_csdev_active =3D NULL, *config_cs=
dev_item;
> > -   const struct cscfg_config_desc *config_desc;
> > +   struct cscfg_config_desc *config_desc;
> >     unsigned long flags;
> >     int err =3D 0;
> >
> > @@ -1062,8 +1078,8 @@ int cscfg_csdev_enable_active_config(struct cores=
ight_device *csdev,
> >     raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> >     list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, n=
ode) {
> >             config_desc =3D config_csdev_item->config_desc;
> > -           if ((atomic_read(&config_desc->active_cnt)) &&
> > -               ((unsigned long)config_desc->event_ea->var =3D=3D cfg_h=
ash)) {
> > +           if (((unsigned long)config_desc->event_ea->var =3D=3D cfg_h=
ash) &&
> > +                           cscfg_config_desc_get(config_desc)) {
>
> This seems to me not right.  Why a config descriptor is get in multiple
> places?  One time getting a config descriptor is in
> _cscfg_activate_config(), another is at here.
>
> To be honest, I am not clear what is the difference between 'activate'
> config and 'enable active' config.  Literally, I think we only need to
> acquire the config at its creating phase (maybe match to activate
> config?).
>
> >                     config_csdev_active =3D config_csdev_item;
> >                     csdev->active_cscfg_ctxt =3D (void *)config_csdev_a=
ctive;
> >                     break;
> > @@ -1097,7 +1113,11 @@ int cscfg_csdev_enable_active_config(struct core=
sight_device *csdev,
> >                             err =3D -EBUSY;
> >                     raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock=
, flags);
> >             }
> > +
> > +           if (err)
> > +                   cscfg_config_desc_put(config_desc);
> >     }
> > +
> >     return err;
> >  }
> >  EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
> > @@ -1136,8 +1156,10 @@ void cscfg_csdev_disable_active_config(struct co=
resight_device *csdev)
> >     raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> >
> >     /* true if there was an enabled active config */
> > -   if (config_csdev)
> > +   if (config_csdev) {
> >             cscfg_csdev_disable_config(config_csdev);
> > +           cscfg_config_desc_put(config_csdev->config_desc);
> > +   }
> >  }
> >  EXPORT_SYMBOL_GPL(cscfg_csdev_disable_active_config);
> >
> > --
> > LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> >
