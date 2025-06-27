Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496E9EAD0
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750999956; cv=fail; b=TdPZtdd8wNa3roH5asHYQGwGB+6kAO14HOxlr7Qx+kExSkpIsJjYp4Fs7huhOsOxDxwaTe4rDone/yZkXT/mFatgTOaCqDfEFiCsVYsSv+cnVVancXuQweDAUxswMqA5zHFctpNOkIKt7e+2FyJqW4cdcqSFT8hCi8qe3BDNl9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750999956; c=relaxed/simple;
	bh=WdZpcgbwZni+8hw/qAzHZhIFVmJEq55d217UsCt7gJ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aITwbnxUHWLSd8w06quW564cXfGHneUgxim7YUfHYPJMe/Ox3SMRhV37mEUwWFoc95maO82rtkE8C9T+Y8DRQJVSkHF0+RvNjDJWwpVUWz4YuLQ9OfrPeoZowJEMUUB0gmmW9u4GC0Gc4i24WjvYXRcrXKz04Dmytc7jkVy9D+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NDZC0Oyo; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NDZC0Oyo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hP36VL1LhaA/zvklg1EJJMECGJOTLsuACukGuXRZuOYLeN/erflv2QQ3xacvs4AErI7bdhzp3MCRcBKKWc8JpPzAZbiWB4JkWj4ATZGeQQPXK9eKnrld5Ljmffp5fU7AzqjDj+XnnbquvKOmae2BHWkc2OKFwdyq6CWY2XZL7u6geG5eAmC+cxXDsOSRXDg6qkjTZzeu20zR0EVrsfDdVSsc8SBHFjTMZPiKOuhm3pl3edXVfhvjwGY0OM2+yThGT1I0iDJ0HrWJfzJ1Exttl7tDtfJlaSlak1qbI/I3m2XqJFb1ac+QpOYkGa0XxK78oUUl2mFF2PSRrCzkxujnFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DDjxyeBKImDzw9xh6AGx1+8rPWRDpNBVrFACoWSbOY=;
 b=f3/ksKhTSS0iyQBeiGbJ2SrqE+b7t11+J7x8phSFO0TO2nJd71yZG4QIiXyWCDkLWOsDoZq1teh/oVvtxRCEuRBxeohrwqNtyLZXb81bVAxRnNUd9gOjS38cLqHTbff2XfXxR6sv2F18kjcnTAmTkV1BaXnnh6GibWzLZlrOIHbdVwh0owpjeMgi7MWdlD/KLLso1ntQNDGCBQ+4TsE9P3WLcJIRkP2TDWNedcwTXj489rmCKiFjlJwhX0UPW3uS5aXlDszb7x4XoxN6k8Pn/JmKiGuE96wEIza4dE9puFUt/MZUPJ1mQqXhaMgGbTuyIRNM8naYuCFYsizrl4pcPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DDjxyeBKImDzw9xh6AGx1+8rPWRDpNBVrFACoWSbOY=;
 b=NDZC0OyofIMcvxQ0QP2wTCaCzz6M/lApbql5FVAjji4Z744TnOGHsxdeo69RvjpT4o+sUMLher2RnGhmP/jE9eUJVXbOaHIBcPucDwePUUWB+BnFiPf+fqmgWjNyVO4GrpBrwzckfj09fJZuyYoxFFaO+cOtNEZodnSAHo5/Eug=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OS7PR01MB14882.jpnprd01.prod.outlook.com (2603:1096:604:39a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Fri, 27 Jun
 2025 04:52:31 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 04:52:28 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Kishon Vijay Abraham I <kishon@kernel.org>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Uwe Kleine-Koenig
	<u.kleine-koenig@baylibre.com>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 0/2 RESEND] phy: renesas: r8a779f0-ether-serdes: driver
 enhancement
Thread-Topic: [PATCH v3 0/2 RESEND] phy: renesas: r8a779f0-ether-serdes:
 driver enhancement
Thread-Index: AQHb5nLHBZp8vIQSbEWglXyRyngmqrQWDtmAgABhEEA=
Date: Fri, 27 Jun 2025 04:52:27 +0000
Message-ID:
 <TY4PR01MB142825081D5279CA2D8251EBE8245A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20250626081723.1924070-1-michael.dege@renesas.com>
 <aF3Qp730y_Vusb-z@vaman>
In-Reply-To: <aF3Qp730y_Vusb-z@vaman>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OS7PR01MB14882:EE_
x-ms-office365-filtering-correlation-id: 6c357c49-fa4a-43bc-a166-08ddb5366abb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?E3PAT8eT8/vwVHIxVMpe0uyKEsgTi36u69CesgYTCjf5/xhm+iDLEh/ZA7v2?=
 =?us-ascii?Q?sscCY12914dFUL7ygZSYTnnlhIkRxF6mmyKKfLcV6eToUOBNU3YLN2UIkxop?=
 =?us-ascii?Q?LftKHtZf8m9iZu8Sf3lV1JMCpCmryB8zFYLx5sJr4bBLdp68K69WOAH+nlvW?=
 =?us-ascii?Q?Kh4Pvl9uiMpGH9OIA8F5kJV2g85KoKopgSf2NBvhkN11djdU/kcDtSgz9RwW?=
 =?us-ascii?Q?/9GBq5Ed52qjVoGLyxCRLXOsAtRbsnqiEk6z4/xTluB6FXi+EXX84YmPN+hN?=
 =?us-ascii?Q?c0Xedyq8FSKRRHOfYiPu0JEM33DF1En4JMTVKrpF9I47jDB9ldLczKd6/x9C?=
 =?us-ascii?Q?pRuGD4OI0uh8WMIeK9X+skTwrkB+5W2PM0XBZ8cxEgXQimwPsZepZ5G78Bfz?=
 =?us-ascii?Q?FtCIxa8dTipF/bsmlJilY8FlOPT2gRcfnFWn33/RFE20IfXC5pOAvJZxAfQA?=
 =?us-ascii?Q?HvBtWU5YV/3xgkyapC0QPC6ryFFlbrXadDECyjDLSA3G++/YolTa/uIq6ca5?=
 =?us-ascii?Q?d/YY7SCXNWDyW8c81A61pmBumwGQ1B8iGKs/cUtuG8TznxXfNFec1mXJWy1V?=
 =?us-ascii?Q?7MrlblL/vDGYG7l7/pnXtwgIwEByYQNbnP73klV58jHBA7nBBe1kyin/8GLB?=
 =?us-ascii?Q?IHNhBtuFLEw0dBwuv8HrI1X55KWRROKkPshKInj+AUBzZegvtck3X2TfKfNP?=
 =?us-ascii?Q?QBJjuQ5jAfqCm5jXscsspwUY9BgZZF+m/8ZIBJgF2QrhhhtK3b8kKGcY5J+I?=
 =?us-ascii?Q?UMjdX3FlsPetTwVc4q2OQEF/d/fBDkLFtLbc7iD/KlI6wcyMotHrOr7a2a41?=
 =?us-ascii?Q?QIn+0J+fhpe3Ao5bNN+C8k9BJce8TZMOStvqFIvmhvwB7Q5yU2CaYzp+Cz62?=
 =?us-ascii?Q?A+JBKwI6gLv3aAEYHilhf5PWZftlQfYj+FkAj29ubVdBwuBtxgUD+lEHb/+d?=
 =?us-ascii?Q?SwLSaRDojQqUESlPdxt2EOWeFeyyW79OJsvJ4FAeGiBJGJ9pSgdfVtXe8I1o?=
 =?us-ascii?Q?nVq+H/iHl9NZqTqLhn51ml2F/08Okp24EzpKehwFjNgf95psKJ5Ivlwo68cF?=
 =?us-ascii?Q?oDd2UoDXvTxsHVpuJY5JhhLw2had3Ittu5TcCLwaUB99Pg6AJCyT5Fo4I3Tz?=
 =?us-ascii?Q?vh6l13I828ytAXPIJ0DmPgcGPJ9YYx77bNWcqVWsiq9qR2hvacbilWQp+4FI?=
 =?us-ascii?Q?P3zP+xy3CqSBQLpm3jYTtUU41dY/utNECbp4672YjlvKAPG+wQKPxVjF23SY?=
 =?us-ascii?Q?FCRUVOPCB3Yr2DPzRGQmHQdFUYXYJVBBd1k3XC7aKxVLbKJRGAL109ul+mfa?=
 =?us-ascii?Q?taw1l0WQ8w+Ew9YoRC2dtJDBteYBBMGjh25CKRJK+ClX7TMOGh3SDo1/Exn9?=
 =?us-ascii?Q?jefCW7gMVZq1roIszGoG5TkeBls2Ijc1dJQ2tw2ePJB0cHiQrrDPqDPAOsT8?=
 =?us-ascii?Q?7M3LN2MAZepudZyOmgSnL6Jl3d3EEtt3wvaKgOpS4oGiTpr5V0hDGw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rfuiYqBf8js47Fyt/1oSMX8KoT/M5SJ/UrSp1QQ6kqFARf3pIUMJEM5oxyC+?=
 =?us-ascii?Q?efDzK9MZuNd/wt5xuwwaha5c6GMyqno9IU3iqT0VgCNCYdafxiDl6Z9MEJqJ?=
 =?us-ascii?Q?YVjgC7+kB0x1udajyRlu1R2Vbp6iqiPzBMUs4V3yFDRppBLHcqknMkGl7IBL?=
 =?us-ascii?Q?7JT3AfNfauBogyzN1LpsLzcYo9Hq5IFiOX/JthCpQViH1+bj4zg3LfY5eTsu?=
 =?us-ascii?Q?Y6QX9FtpnbuduedxSHiF5IIuxXKU4A4WR26SToZoLofKBmG3zxjKtUBUjrXj?=
 =?us-ascii?Q?2Ti74TxVAimx3Q4BZW2qjpGAQ0EeYXzfCf226X9F8mqMzPx02M3bqVbKLAxO?=
 =?us-ascii?Q?QnLwYKZUt/0qXUnkcCKDJQbxSf0UEuWVJu8AUzZxqjjxxN2XW2aKfQ7NSddz?=
 =?us-ascii?Q?t0ZcB/j+VORkd480Mq75mEk1mMmu/qaZK8h5WIUvTudY/2nInNfzyHw9Bv3E?=
 =?us-ascii?Q?UAxamEng2OKaLb+vFnMQpFj3NlCSSOKqLc6rMzvUxIPJ3t7OrlVCQU+CBNAf?=
 =?us-ascii?Q?gFWygz5DI7OARJsm5ZMbUvAQykZMMjtGd5BSgmUubWJSOOAIMEvuoLivRUbu?=
 =?us-ascii?Q?56+hCYaBiLohyoHkjfuw0hdLcWDdpfMrYvU6/eXo2JUIfufvlNRnQ6kByIOw?=
 =?us-ascii?Q?ZXkFd1ckAbAw2NQx5MVyeCZDcMaz7nCKTn6jnRhYeN4iwr4bkFvpPtvDmUEN?=
 =?us-ascii?Q?9iO5pOQDjZ7zNM54+OT4Ya8UvNSvJQlrfks8uA9rIS26xyz0bo1LdD0S54cp?=
 =?us-ascii?Q?ZhzxI7LrgU4silLjxdu9eAJOioHjdCRcRCdS5GevYR2o5s86e0p+SR2wUFNO?=
 =?us-ascii?Q?fWPUKei0KyXKVIn3YKUIUn5My49fFExr9xRUScr5Gl36RPpcm4405RNaj+Z2?=
 =?us-ascii?Q?D6AE3UvpHzGIhTkLbieOS8ppjEsu98cWDV+OgoHH6nfhEql30DgChwV+INoK?=
 =?us-ascii?Q?n3a9HaTXj/BrX7xO8y/GcjdEeWAT5pUTKEzu66jhPt+Ws9RXxSoIUnAu43ec?=
 =?us-ascii?Q?SLu+21OZevAG2QmBe+LDRHoJtXxnHdp+0k5mZB0hUpujKwM1Bt3T0T/qsaRv?=
 =?us-ascii?Q?cs3uZKTbOzfLM1A6AUdrYSEoeEafYTFv5MSSXkE08M7SEL555OY1ag6PMoWR?=
 =?us-ascii?Q?TkQpulzNr/51CSYkeZDXOuQ+IvKG5uufQsZHKJ60NyAXVYO7bRcWf0jDOLoL?=
 =?us-ascii?Q?db9gNrAVqzhDx2LnXyK/jFGJpynEf0vkHfV91YG5vWi/viRzpwlMJ5BTGxT6?=
 =?us-ascii?Q?imCUaejbU4j5BGe1NxPQg42/9/VIlfigqAkmx01mhCQMM5wZYVn9xpUopwqd?=
 =?us-ascii?Q?vB9mGNPdK75QEcJg0zBD2buda9RurkPN+rT7rUU9Q35Lq9q7xoWpPvmV1//T?=
 =?us-ascii?Q?uKLkKnQz4F+RZRIcjP74EYavIdP6QfFNkkKf0qpx6Saz/n3YBbA7dkXErQHG?=
 =?us-ascii?Q?SO15be4Bo88x86kgLAi3FKfG8OiKgn0zu97W5UHFrfcEP1+HvXUoz7iS6kUC?=
 =?us-ascii?Q?jOa9MP2D4H/VSHaeuUQoFAiB+Fvnq6ksmuBkLtHOlt+sKIPZVoflZ98bpvXz?=
 =?us-ascii?Q?9nIuIKyfRwS5XymLxZPnz/ihtZSxZVsLop92DT5i?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c357c49-fa4a-43bc-a166-08ddb5366abb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 04:52:27.9416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y/1mCX1ju6+YW5xdq2IrO3xm0CLppO68WqmN+qS7qv1o5Zvx2duqeQ5T6uw578aaFB3VzWj3ytTOS7PJuwQmygfmGJLkr3FlIf9xlK3raFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14882

Hello Vinod,

> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: Friday, June 27, 2025 12:59 AM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Kishon Vijay Abraham I <kishon@kernel.org>; Yoshihiro Shimoda <yoshih=
iro.shimoda.uh@renesas.com>;
> Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>; linux-phy@lists.infrade=
ad.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v3 0/2 RESEND] phy: renesas: r8a779f0-ether-serdes: d=
river enhancement
>
>
> Hi,
>
> On 26-06-25, 10:17, Michael Dege wrote:
> > Hi,
> >
> > This patch set adds the following to the r8a779f0-ether-serdes driver:
>
> I have a v3 and v3 resend and both are not threaded properly, Please post=
 properly as a series which
> is threaded and not broken...

Please bear with me this is the first attempt to upstream a patch. I used b=
4 to produce and send this
patch series. I did have trouble when I tried to use b4 to resend. And ende=
d up using "git send-email"
to resend.
I don't quite understand what you mean by threaded and what is broken. Coul=
d you please give
me a hint what is wrong? I am willing to learn and would like to get it rig=
ht.

Best regards,

Michael

> >
> >  * USXGMII mode support for 2.5GBit/s ethernet Phys
> >  * A new configuration step suggested by the latest R-Car S4-8 users
> >    manual V. 1.20.
> >
> > Changes in v3:
> > - Fixed wrong macro (reported by kernel test bot).
> > - Link to v2:
> > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .kernel.org%2Fr%2F20250527-renesas-serdes-update-v2-0-ef17c71cd94c%40r
> > enesas.com&data=3D05%7C02%7Cmichael.dege%40renesas.com%7C7e7e33dfe98345=
c
> > af5e308ddb5050507%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6388657
> > 55354137682%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLj
> > AuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7
> > C&sdata=3D9sa0DnmyB5rRb4DSOlzz4%2BguzMxaMcP8W40OVS1ABZU%3D&reserved=3D0
> >
> > Changes from v1:
> >  - Modify this driver for the R-Car S4-8 only
> >  - So, this patch set drops the followings:
> >  -- any dt doc modification
> >  -- X5H support.
> >  -- 5GBASER support
> >  -- Registers' macros
> >
> > Thanks,
> >
> > Michael
> >
> > Michael Dege (2):
> >   phy: renesas: r8a779f0-ether-serdes: add USXGMII mode
> >   phy: renesas: r8a779f0-ether-serdes: add new step added to latest
> >     datasheet
> >
> >  drivers/phy/renesas/r8a779f0-ether-serdes.c | 97
> > ++++++++++++++++++---
> >  1 file changed, 85 insertions(+), 12 deletions(-)
> >
> > --
> > 2.25.1
>
> --
> ~Vinod
________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.
