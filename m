Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F521288C8B;
	Tue, 24 Jun 2025 11:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750763571; cv=fail; b=r1oL/jBKCciXJTD18sdfcqQH19gzWQup7T2ZDqkC5F9lMVxwKwjjh0tsAbdwaPeRPPH/vuz8weSZD6bwNCHttwIPo04HdGcNX31S2sG0+iR8/1xWQoLtJZiObzgdEBYLXAj+1q2pdJXnU87UWWFf5wWCDA5iiGFbzNX5jFC0mPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750763571; c=relaxed/simple;
	bh=oj4GNtO/PqhGIkXb4RdAH0cu0IsJfgwqzGgYkSv7U+k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D2q/TtkGCHP6+ap5s1Mv165ePAxaQc1vrQLy74CZmdoGkCXM83AIZ5TbnoSiyDDpUG8dXO2Qn0+l6dwVGUyMg+DTIQv+7EDfZ0lYIf8e9XELGZ321+Bgnj2JwY/3FnPllNjQ/XUzvcNJFkKI4dJrQYowAhwTajq1My21VvSkkds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=gER8GOgy; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="gER8GOgy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3YLzHJ46gGz4lZwil2wZ7wNME3D8A68bR9YEtTS9If9dvHzsYOQAeg5PHU7bTy9RFZP5/VH5N0n9yBus3JrKjUV6y3VvpKy78lolCqBbITsRUFHF9NRubLj95wyD5G3RAN97EtCOX0otplWDkM25q5GqWvxrl2EiKzyoyubWd/tcehxBUmgjnDiSklZqv62/HvHB8s36isbmc7SCtorzUH4WE9UxMvww8/r0hs14UTpKAPiG95Wpgm0lQxYm/820KSxfL65T3YxCp9rYjVH7EeDm6F6n0K8UISAA1A5TTJ+ob3W/OdotegZ+58PW3YPwBoLvDVLrJdCZ7JAXo9GdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Le5vGmyZA1h+5Sm8OjkVwDwbiGbANwZbgmpHNqn5Isg=;
 b=dtDzm89RC43zmb5dq8epJdEWdeckSolQoLXalxS2yb+SJfDd/6ryShTtHMJUDnOCVtf9KcWJ0rLrssMwkZVCQHZuxAGcbez+isnzURFkUsmphanVxAnt2ZeCrjECVNBYpTlthw01w2xVF+NwhpUBGbQgcKsWJuWsVT18zBb0otZIuVLgCoCaf/67pLitG5eMWSKc65p+qpcadnl7AWD/9CLK0dljasSBB06G7J+Q5o/iXIstKqJ9R0CBIx5JX1An6nH5goLntnl2UXrXZRNnSylZd/f/Iizp6J0rHQpheXICuU2VxCH4up1uZwQs5c5qQ5PSG7t19NDT553JF0NcxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Le5vGmyZA1h+5Sm8OjkVwDwbiGbANwZbgmpHNqn5Isg=;
 b=gER8GOgy1o2KtXrOCkiPWZLpiVPvTGDyTuvwoxSXySUeNrl9z/rgWZFBRNkF7RGKdvIUIjzK5ysioPyNylAoVrouCUr161Fl1dHOAANF07GHdoSaL1Tc9VO3VaAKaa4iz891PxQwYX/9cfd12XDgW2lZlHFWhLMQanBiXsxg6sw=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by PR3PR06MB7097.eurprd06.prod.outlook.com (2603:10a6:102:8a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 11:12:46 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::1797:2a6b:ecc5:f7b8]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::1797:2a6b:ecc5:f7b8%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 11:12:46 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH v2 0/2] usb: dwc3: Fix TRB reclaim regression and clean up
 reclaim logic
Thread-Topic: [PATCH v2 0/2] usb: dwc3: Fix TRB reclaim regression and clean
 up reclaim logic
Thread-Index: AQHb5PZBeagS3RTNW0GOo6iHVRl/KbQSJu+4
Date: Tue, 24 Jun 2025 11:12:46 +0000
Message-ID:
 <AM8PR06MB7521B4FD884B6DBAA33F5B47BC78A@AM8PR06MB7521.eurprd06.prod.outlook.com>
References:
 <20250624-dwc3-fix-gadget-mtp-v2-0-0e2d9979328f@leica-geosystems.com>
In-Reply-To:
 <20250624-dwc3-fix-gadget-mtp-v2-0-0e2d9979328f@leica-geosystems.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|PR3PR06MB7097:EE_
x-ms-office365-filtering-correlation-id: 3065bbdf-e6ba-462a-a2ce-08ddb3100c4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?VKgZmw/Yo3Q9j55XxsC3JIKHMPaJZz410JSBGnrFI+OOyIbJuuM/DP9E?=
 =?Windows-1252?Q?jItzvTjMyPXqGAV+cP+Lvx2Vwaw3yIbAAuB2/E0MryPKri5Vux3xlkr1?=
 =?Windows-1252?Q?7n1Ivg4tIrBCrrWlnJz3YiSIRi3muortniMxrbEKYcgv2gS+wIHa/Vjq?=
 =?Windows-1252?Q?X6oOE9XOfM/yHohiXNnJrB+ZQ0FkQdxR4hG2nVqraGLIl04XykLep50p?=
 =?Windows-1252?Q?naorXA5Nk2kCFhmEbv85HNkpYKTkLxkX0/7SfFU54ucdlQ/vLjycrp/W?=
 =?Windows-1252?Q?cPW5IsZSxfK3MIR298nVI6uS85Qy6xPon+5/n1vCOQydhnkfNoP40Hkm?=
 =?Windows-1252?Q?b2VKaj6bxWW6VsX+24U7IPTWXyfdOTsAE2Cs9X1fla0gpW1tPzv3tGMu?=
 =?Windows-1252?Q?P9GLWAnV4WHk9I+qakXDWiJjriqaP5nK2sIs/Sev/aakWbiFITF5FNCh?=
 =?Windows-1252?Q?whVsUP8f/vnocIiZlHgO41yisweXsmzVlikT3Ove4iUTq525Hx7xu3Hm?=
 =?Windows-1252?Q?SWod289UoRMKqqe8fXWVTG/yRhXCyjeKbqGPsF6VBvNSThJ5WOiIQZLC?=
 =?Windows-1252?Q?qUUo+vvQ+BXKzm+T7MY429V0sch3z9tf79xQZXXyIXO54oYBvrBDgRW6?=
 =?Windows-1252?Q?+2UPJumL7ws7n8ddpbXAwcVIBm4g8jht5Sd9dQ4Tf5/KtLaAVga+myl2?=
 =?Windows-1252?Q?skRyFtSJP2LVABjsmLIwar8+SeGNwZLHQc5Snnpq61nVTfsnWq36cQAT?=
 =?Windows-1252?Q?f0NPoJuOQKyIv5i5mxTnVKVH4OXodoHvytZFf/A+zSjX/I9JhXsya3EI?=
 =?Windows-1252?Q?iZqgY4RsHcMXUbYwGGfgXKvURg+shuvQSdH1NLCIuNZtVbwmgQUSBn+W?=
 =?Windows-1252?Q?I3S+4vCCTilHDkok9Ce1wdDtVNHiz0WZit9RpyhwRV+QYxglPPhUxK8o?=
 =?Windows-1252?Q?n6Gv1N+g9Wq3XN6jQKJ90lSqWTSjc56uLw4bvvNtYw2OUVUyO24Bv54c?=
 =?Windows-1252?Q?2wHNw1f4sThmf6hLOTRHky8zwrMIUEDjRC9D5EZokSJfQEjnFuMe5lgz?=
 =?Windows-1252?Q?0s39IUSgYtadUAJpBtesvcfPxV3Gd9eAv5boB9ieLp0G3R148mW2vitu?=
 =?Windows-1252?Q?RQTLUOJM+3Ay1I6WlQDsWJ5nYRtuhaTwOG7q2DYD6g9vEJq9HqU5+cxI?=
 =?Windows-1252?Q?lwFtdDQ06uUFR9/iARwhRsaN1+gn7UQORC+8naQBmXySxdSbB7zhcPX3?=
 =?Windows-1252?Q?NIDB7QJsEf/ksOZy9u6zv/Rg8WT4a9dWdfwrr2ctjTa6ekEMn9zz7na2?=
 =?Windows-1252?Q?IEwnMWNdJ9RnYJmqy+x1DdueRr/PK5Mqd2PnmKbaMKl1P65VsVcxrzj2?=
 =?Windows-1252?Q?CWeKkm09cF2uaBuDKQoojGEFt07UZB3dzhEG43DgtXb4Lg+glMv822hn?=
 =?Windows-1252?Q?vthEVQU3dEWkb4f3khg8lbxBDtMUZ2v8zZdelKwEfgGUmcjgpyKm60gn?=
 =?Windows-1252?Q?D1anRC+WwJ71CIh97+jcnkAadky0Ko+ZzeUvEHRWhfFMB4zuNfjaWrhG?=
 =?Windows-1252?Q?FLm5fgRot39Spmnr1U+/yKq1ZLQSl8joztMqEldG/txskIvOYoMmIp+3?=
 =?Windows-1252?Q?LuI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?St/+k8E/PWcp4uxqDNHknkjJ/bxcKcDt0EeTZ2T9AlGDyFPKYhLdHdAR?=
 =?Windows-1252?Q?l0gn/IJoWuH9TpDaac7+KfOxLdOa1F6lTTM4rSRz9Cm3mGi4+mNFaoMj?=
 =?Windows-1252?Q?7fAkTsIsPgsua97GakQHfzzIJAQ0uKvp67BCpqWWMtnqy/t5QnB7JIsq?=
 =?Windows-1252?Q?TlN0eHy8lnLLqwFdPp8zaevLRFvwZqCJ/5Hsj/Nqe6sGO1jAwNJCf2iv?=
 =?Windows-1252?Q?Ux1+KvU0rn0sxWwmk2kA2+so+FpFQb5ZJ49wlnit0ls9JDZ0Rhm1Mweh?=
 =?Windows-1252?Q?6kPhdF5RpFJ29wyoaYC1f8T3Nl+vo0nqK7RxdFJCeK6ne9jgrYDE2HpO?=
 =?Windows-1252?Q?Q//oDP5rKVfp2rVMn+21e9fAA5Hz6u22w3nCm4kM5wMZMnrs8L1kBq0j?=
 =?Windows-1252?Q?jSTbfzpOOwfhBtwmQsxJueZxFkz6cvwNTqNeHF5IZmnWVpUGQL3uoeRH?=
 =?Windows-1252?Q?X9V8iHXM+mjqkOwmhzZ+V4gS86nnplQk1X05dDJlp6nUnaxdtUNUd2Mn?=
 =?Windows-1252?Q?auh2/W+8oYIIrJ6zNBMpvL0fdgj+uxCH8zXXzaFkFuBFmixrbcS4iCev?=
 =?Windows-1252?Q?F6umtQfrPmlEQu6jutUM6kClodjfwGAmInwOWSf1qYohqOP4mxNhZf/a?=
 =?Windows-1252?Q?l/bKizHCkYCP5SL81GNq37CjtMtkg6jxhaqkQ+141wRb3nvZr5K/Mpmu?=
 =?Windows-1252?Q?LazZwMUOOaPFfZdYlFsEXfpWYJDrJljxU2HjDCGT93NimsjIl34iGyIm?=
 =?Windows-1252?Q?W73mbWY97xiQCtAV5gJS4RwF2egHoWMGregcWql6pkBZQMoQMr4IBiSY?=
 =?Windows-1252?Q?oBZqJdl16sJMYKkuuSTiRgkvLqqloYE0ourJoNARBitfYtNwbWvylB/w?=
 =?Windows-1252?Q?P5ZM1Hz1TTf+H2+jIQDZFLjU9PEoQj2FYDj1icTN9EYuLPT9t1vY69P5?=
 =?Windows-1252?Q?YzRN6VENZQoNMlbeuEzBeqZmM3j0GIiAlCT2/t/QCeVSSXKgW//9VaEa?=
 =?Windows-1252?Q?L94pM3nY54Gkcxt6TljVZ1xjZX7CIHheVZp1oZRAcFXMHnkRj0MpBCrY?=
 =?Windows-1252?Q?JwtZVJ3fuGUJZiBT5WGpUorVi4N7oFVQvtTfxysFH3uNIknrnlqQ7apm?=
 =?Windows-1252?Q?wZu2G/FhHWnWypYOytO64zXNuXNXvzdt8I2AGE3qMdOZuzEUjekb3bB7?=
 =?Windows-1252?Q?QQpzQHgqF819/ZFUmlfwZSLicWE2ayMoaD33opFf404AcdfENuBW+DoR?=
 =?Windows-1252?Q?9Uoqf5lLQ9+QO+JgDFWreb+JUKKEcofe5sifoI5rb1h34GaujkYZvJ2k?=
 =?Windows-1252?Q?g9jgQcB8XZ2LBz0eWLVrxqLMrZrMst2gsweR2R1nBKVl5BT8Y8GeXUqa?=
 =?Windows-1252?Q?vGpBeGlHFrMXJSMQvTSP2VNyxspcd7kdiyXL/LYU6AbYpm7lcOzQqa3w?=
 =?Windows-1252?Q?3kwPz8i+5+pqmpozAOMJIOWtKdbnDsjjs9NLqESt/8AJyinoirIk77dm?=
 =?Windows-1252?Q?KE08FntApAgN1iIUoM8SG0+XkEJOc3wunQGrBbhxwFF39PKNiP1PtXQ+?=
 =?Windows-1252?Q?5UuUmrLlA4NV78J3fIGJQqEb53YMQIX99m78ysBarKFMkZt4aZQha+Qf?=
 =?Windows-1252?Q?Zebvo7qADjULjnXXw8RFjq1vhhK6OXUAkcKHUWdngOG/cDy5IAWW2ysJ?=
 =?Windows-1252?Q?vTu/AO+Hm26ixXVfXAELgG397sk5Nlmh3cSmxIBnh3knuu3JKJwhEbNT?=
 =?Windows-1252?Q?LYFrICN9tBT6ySUVJtw=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3065bbdf-e6ba-462a-a2ce-08ddb3100c4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 11:12:46.3224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQ2y9tZ8wh9+zcRW43BoLIDSmmeXb3PM/DzWThFbGccrXU9xpmIaKEVYqzne57nYgmxg6anH/yNVhduzJaKuzaySgxLi/yKewG1RJrTeeJHsEZnrv7q4J0qQTzmCvUoc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7097

Hoi,

> This patch series fixes a subtle regression introduced in the recent
> scatter-gather cleanup for the DWC3 USB gadget driver, and follows up
> with two clean-up patches to simplify and clarify related logic.
>
> Background:
>
> Commit 61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling") removed
> some redundant state tracking in the DWC3 gadget driver, including how
> scatter-gather TRBs are reclaimed after use. However, the reclaim logic
> began relying on the TRB CHN (chain) bit to determine whether TRBs
> belonged to a chain =97 which led to missed TRB reclamation in some
> cases.
>
> This broke userspace-facing protocols like MTP (Media Transfer Protocol)
> when used via FunctionFS, causing incomplete transfers due to skipped
> zero-length packets (ZLPs) or improperly reclaimed short TRBs.
>
> The "offending" chunk from 61440628a4ff:
> 80                 ret =3D dwc3_gadget_ep_reclaim_completed_trb(dep, req,
> 81 -                               trb, event, status, true);
> 82 +                               trb, event, status,
> 83 +                               !!(trb->ctrl & DWC3_TRB_CTRL_CHN));
>
> Patch 1 fixes the issue by ensuring the HWO bit is always cleared
> on reclaimed TRBs, regardless of the CHN bit.
>
> Patches 2 and 3 follow up with simplifications:
> - Patch 2 removes the now-redundant `chain` argument to the reclaim funct=
ion
> - Patch 3 simplifies the logic in `dwc3_needs_extra_trb()` to make the co=
nditions easier to read and maintain
>
> All three patches have been tested on a imx8mp based hardware, with
> userspace MTP (viveris/uMTP-Responder) over FunctionFS and resolve the
> regression while preserving the recent cleanup work.
>
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>
> ---
> Changes in v2:
> - dropped Patch 3, as it did change the logic
> - CC to stable
> - Link to v1: https://lore.kernel.org/r/20250621-dwc3-fix-gadget-mtp-v1-0=
-a45e6def71bb@leica-geosystems.com
>

please disregard v2 - a colleague (and the kernel test robot) pointed out t=
o me that this is not the way :-)
-> i'll split the patch-stack and send them separately to mainline and stab=
le as suggested

sorry for the chatter
Gru=DF
Johannes

>
> ---
> Johannes Schneider (2):
>       usb: dwc3: gadget: Fix TRB reclaim logic for short transfers and ZL=
Ps
>       usb: dwc3: gadget: Simplify TRB reclaim logic by removing redundant=
 'chain' argument
>
>  drivers/usb/dwc3/gadget.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> ---
> base-commit: d0c22de9995b624f563bc5004d44ac2655712a56
> change-id: 20250621-dwc3-fix-gadget-mtp-3c09a6ab84c6
>
> Best regards,
> --
> Johannes Schneider <johannes.schneider@leica-geosystems.com>
>

