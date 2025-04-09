Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023123.outbound.protection.outlook.com [40.107.162.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBF3256C66
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203617; cv=fail; b=HL5nM1k0uB6MAZC3cqqFPSsRxTaqSfewOhV+dyyzkYmwpQKlBZfbi6FHchG92jTNszJjYDmstCbI4HMoexQPyXWt1yfV5Vj2qD+cnAOI+mg+Z9iC8XXWL74p8jAmP1UEEHP4bOPknJAlih1/du2ECNmqXI6LYecYY1ive/33bAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203617; c=relaxed/simple;
	bh=WqFF55uiv/Dpa0zt6XRH3H+Y4mdYvP/0Akx0Ld2L5cI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ihRTOrE7zwLM2ihKFHsuYpf9PJmbxMQUxaEwcJWCrf2yNHSL3zsmUYGdtd6/ANBP5pQUm2kwPhqokKrBsdi73bhu5X9P6NW9jYziF4h2emF5rRHa/FCEIPYe+r/SSpKT2X18+z7kUntBMxEpK8RTjuBboRKx+Dv2kLwpjU/RQO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=b1BWcNc4; arc=fail smtp.client-ip=40.107.162.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="b1BWcNc4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTt83PvEJRZxEcHvD9x6SZqs7APaq2gNljjeH+JypijIME6eHQweBLls8P3EARn3B4SuTHvttW8Gl1EkRBHkxLaS7jLlM9AWxxu/CyysYgJ1XDzboQnzWLNNWa5Bv7mIXJjnFLvdQQmHJot2dWQGLcBQZ14zAVLIrGwAxtQIgpLpymDItD6MfHAdcG+of7CcA8rkJrxrkV+OHJvETlA0yaXEbwOqY+WRRYmMiy9P5KBL1gFsl+Sw89wXlbjJMGB84WJTW3dZmTmaJxx1TzmaF9UVnwyPhjm48fBC0/FYO6E+KIW4U7nrhTtJN5z9y2DE5YoH6MovJG9Sh4AHnXb0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Jf0cesc4iwCbtYxtRHV+2C+eDRxIoDjugJmhc9B4SU=;
 b=YrWqVF1r6q1sUoCgVnGjt0ZkEwChtQ0KJwwEB2CJ2CE3xmtyMYmdPYwaEK2xLwD0geqtb2LJPKW0zy5GqxMSPl4D+O5kUuE6XeGF9K7Csbc1+Jqm5o3KiQw8k8h2HxqN9m6K2dqwB5AJ7OzZ8krlfuZ03iiERwDvOMPVB2249eqDOKGRvf/ntYoa9x2kA8GLzK7JHDOHaYSl3vJzfldfLV8sAtm0LnZwC0otN/6HwC8KjDjAuOSXNfp0nbtEs/PUf7lR1gWJIiUkBBcOU4v457URHmB3lPoInu6G7tdnepcKTLaMPLtcK/ObZAlDpIWspHPNKbgfqLu7jQ6Akpo2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Jf0cesc4iwCbtYxtRHV+2C+eDRxIoDjugJmhc9B4SU=;
 b=b1BWcNc4ZZlF4Jc/38O0sWKtAySwHoUmxDhpBi4qSH7fcs3rK8iKvsY64VnF9p/EveWmKQBW8nvCXjrduWxct50Wk/dpRB1ENLfbG2fCs6uC3bHGyAh9X9xqKgNi2PREuxWVeKwUP7X/uja9U670KI+PCMW/JeiH2+xPW5Y2JXmHC9TFDmxApya/ZfCoXJVs20jkkmnetLT5czuJGLWjibPBHCZifuub9YfZ8vlgIpSlA9qBRFDkX7hq+JQwOORWpO/c+4YNGXA5MbKw8IEt27A9AA5kS05JhqdKF+jo+bhWIpiEQH4tpsilxTNGC6rHkBs9sIBcOw1slpNbNtdsdw==
Received: from AS4PR09MB6518.eurprd09.prod.outlook.com (2603:10a6:20b:4fb::5)
 by AM7PR09MB3750.eurprd09.prod.outlook.com (2603:10a6:20b:106::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 13:00:11 +0000
Received: from AS4PR09MB6518.eurprd09.prod.outlook.com
 ([fe80::ad50:891a:847c:580a]) by AS4PR09MB6518.eurprd09.prod.outlook.com
 ([fe80::ad50:891a:847c:580a%7]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 13:00:10 +0000
From: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>
CC: "arikalo@gmail.com" <arikalo@gmail.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"Dragan.Mladjenovic@syrmia.com" <Dragan.Mladjenovic@syrmia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Aleksa
 Paunovic <aleksa.paunovic@htecgroup.com>
Subject: Re: [PATCH] riscv: Access time mmio instead of rdtime.
Thread-Topic: [PATCH] riscv: Access time mmio instead of rdtime.
Thread-Index: AQHbWHAplWwM/I5kv0OkDCB7QxW6B7L9VlyAgDu+2oCAYtf5Og==
Date: Wed, 9 Apr 2025 13:00:10 +0000
Message-ID:
 <AS4PR09MB65189D22F46A6A6CF73325A5F7B42@AS4PR09MB6518.eurprd09.prod.outlook.com>
References: <20241229-cogwheel-kebab-3cc2b21096c8@spud>
 <mhng-2dc5552b-3c35-4469-b511-3c6dc257b610@palmer-ri-x1c9>
In-Reply-To: <mhng-2dc5552b-3c35-4469-b511-3c6dc257b610@palmer-ri-x1c9>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Enabled=True;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_SiteId=9f85665b-7efd-4776-9dfe-b6bfda2565ee;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_SetDate=2025-04-09T13:00:10.240Z;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Name=HTEC
 Public;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_ContentBits=0;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Method=Privileged;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR09MB6518:EE_|AM7PR09MB3750:EE_
x-ms-office365-filtering-correlation-id: f0b8ea62-cc7d-44a0-b0aa-08dd77667621
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?27AQ198hjsbNF4UxWuF20ASBIiuwerxB5URvJBE6egWv/SBJcH0qIDl/gN?=
 =?iso-8859-1?Q?S172BRoUL+P0tquRtpoNKLg5OPCKmTkztn7cPkM50slCfet6Rij/eN0UJF?=
 =?iso-8859-1?Q?Gfi/JQM/fNuKPpalyJZ2POvdPWK0fPnF33646qdwT1AQCLvV23fGkJ1bLQ?=
 =?iso-8859-1?Q?RnAc4bRQoByfkNRUFd0WRDx16oC5IBQjFGuDvXWLGoxnwk1tYzNAIHxelg?=
 =?iso-8859-1?Q?y+blg0/GkcnAr+6k+p/2cG91OgskhnVi2QDxcobXZiRsFZGSBwQ0W4WFHJ?=
 =?iso-8859-1?Q?lCtRNy/ax5CZ/dx2PH8CytIjcEGvoYG0jquRLlkgGyxpUc17f4JwNbiayI?=
 =?iso-8859-1?Q?2htHYNz3yA4mT53hEkNYoxmeVLQ7g9Tuac0ghkaLG/YhnbucH51p4a0z3c?=
 =?iso-8859-1?Q?Xa5Ykwsq+JKFwEAgOSLMiq8sYKLOq+kdJ3b7PRVIiJTrmEe/C/o3Pki+Ne?=
 =?iso-8859-1?Q?sD5kDDdXQ1rHZNCtTDfOeCKkCfGWfkN5vL1yD/D9yV0n105UIjR6I1V4fW?=
 =?iso-8859-1?Q?XfPfZZgWS1y5HeJyPiVj1l5uyJFJZ/eucuDzlhKQI2xnRzG/zXvg5+3iOh?=
 =?iso-8859-1?Q?jszkCaJa+XN6yVFNlLegIB3DTE1GP9dxS68Q4lG4eR3JNCE/3HmFiz7Hjl?=
 =?iso-8859-1?Q?0I1gmX7LsXUVsHmd56YOlVC5TUq5epVJAfjQnUHmjgU+yGC5dx7EEmgqdW?=
 =?iso-8859-1?Q?V5H2ipMhct5b/zNl+2qLEs/5yDnOuQn4uXRBJtfV1SnL8m9H7RErmFaTaP?=
 =?iso-8859-1?Q?t0DNbK1ums7N1P2I6K9W9TAbzgCEnhCjVFTjwM4LLad/yvvDVCKLStyrB4?=
 =?iso-8859-1?Q?XGdilMhNes9O9/3mHkFpWEZ0X+yf0JZP6whPF1/vNJcPuWa7IS4WIsdQ1A?=
 =?iso-8859-1?Q?SYMb1+QwLqXsTj4wRojnR1bSubD52yGDq7gVA+Pq1R2hTPeA89XZlaLBtS?=
 =?iso-8859-1?Q?UiF5qyQgvizkh2b+hxsI/Zj2aLTBc3NzpvfSA6l5d+Rgjp5LRb4xA0Zlzk?=
 =?iso-8859-1?Q?UiYx+kpN313b88mkX/ml3RFNwzpmve2bpUTGaPcV6BpBPs09wsya+2XGrz?=
 =?iso-8859-1?Q?yBtUw+MFhmxd2vmsfDBbXCQeAS+FkeU8cjje4V1QksTRMoqcXnPY0M0kM0?=
 =?iso-8859-1?Q?brNwNpu87PjyNDaDglscc9cbH6vjL4YCagULqtEzhTdP1urCKXPZJ501T/?=
 =?iso-8859-1?Q?cmk8EgHxubEWlLmX9xuKiFoUh94oZ/oDmS2hCHf/1fikyJ3Ag/WwKCZkQK?=
 =?iso-8859-1?Q?p6zo9zydBDtl/JNRdBfPq8lJksBhNQ+rdWMdlI8ogZigupd1W1BV6ZiIxZ?=
 =?iso-8859-1?Q?5jlJLoUPJI/uAR6N4By4EZieiV0a93m8vAt7PhNqCjFdQPBsVbY1l9+qzB?=
 =?iso-8859-1?Q?h1EvG/OxsWU4AHBtosavs/YfLpMxDtitfkHm1s6FmZX2NlAlWozk9qMQsW?=
 =?iso-8859-1?Q?tCSnW9keqsUs1PlvgEkcUA5CEU+TiOf62af3yxOyQzdoTgyLKeO4aPh+Bo?=
 =?iso-8859-1?Q?T+XBkMU4a+0f6Hfo1YA/ks?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR09MB6518.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?t6I8uBp8z4yUGGaDdAfJrbl40f0prTnH/pMdb0/ptToRRy7TaR7nf1MbRP?=
 =?iso-8859-1?Q?K5OqxBvsuA1NTP0Xibvlw5ouuZzwybX1iMhRbNCE17bK/+VJxc8NwM0dFP?=
 =?iso-8859-1?Q?ftGFcfb9GzPyX+/Ucx4y652wZ4m06DoQa3stlYjXQ9UC+7KXfUnD1ccf55?=
 =?iso-8859-1?Q?qFBnLjeMjhlACMW8IodEIIclocjkNntx4vQeXp5vb8mxg5Tf5I8+G4/792?=
 =?iso-8859-1?Q?qqsDYBV7Rf4IzNZResyxBxwXNxvnpHyy9Ksdlaqtjg+2V7Aob/bOPMH+fR?=
 =?iso-8859-1?Q?BznNvropjddRO9pG/sK+B+ikMg3tNKQvo7Y9JiQoNH1WGxpW/IxR/0s2H/?=
 =?iso-8859-1?Q?ytNXiU6qebDfaaIuOBFeHWZ5GfZxZRQQj05PD6xC9R9zYtx+I316mTZiU/?=
 =?iso-8859-1?Q?LXOVG1mhFXpjNkuQCmvqGOcwWdDE31sdoeNSTHrKtOxaY1M+B81kMQXUBw?=
 =?iso-8859-1?Q?/TV5qFds/KWcCq2rc5oOO6lf+3CwxgkMl42sv/KAh6RQ+eDXd6a3BKHfjC?=
 =?iso-8859-1?Q?o99RBw7okuA5J7e2oTpnv2PDFFVGurWxgAcdE+bKEIO4lzfl9OXFEhhAd6?=
 =?iso-8859-1?Q?HFzLJ74jDdgciAa0DvLPeHuYffsuKAN5tSiYd2vdrdjB29MxljK2AWnKfJ?=
 =?iso-8859-1?Q?fwa0VlKITvAWhkwOrns4TLEmG/N40kQShJToXPf896e0kYSqMW9dNhk57B?=
 =?iso-8859-1?Q?zxt8fYuSbr8Y6Ny2eiHHL+4PrkydMLvvxfRt/K3fV0ChMh9yDXGbXYhoOH?=
 =?iso-8859-1?Q?pqD9mfu05tRuMwj2nDUBDUuBq6SYZvMsV2gEa91jVz90Kn4aKSPO26Om1Z?=
 =?iso-8859-1?Q?3rLvNmUihxx203/0xI1AvXIublPNT2Q3UeIh4789hKtpTDRJ/C6WJkhx0V?=
 =?iso-8859-1?Q?hvVdmfa1NxSMXbhvjhD71BPQ/4ntw58WmbvRPkJQneOZjibQJs9bo2HKHb?=
 =?iso-8859-1?Q?LTn4AlO/E4qrVHQMulZPc02mptFte0ZHhlCukCu9o9D9OPjEBHKGJWZpNO?=
 =?iso-8859-1?Q?18/r9Ueonp8Xg1frgarm3gn8+wL11gvNwkgHHJymn8TIGB3seOBHI5YXBR?=
 =?iso-8859-1?Q?IYP+AzMD5c0z1oqh4Qq6LNWHHlXQCjCCG2anw5l0KaCbRz0J6ECcLeD4zs?=
 =?iso-8859-1?Q?w/nxZVdcspTMWQuzwVjR7Up1+ZDNCN1JSCBpS6UmDKSAbStIQ5E/bp2eYk?=
 =?iso-8859-1?Q?BHxtIXB/lGxGlu8NPRbso8lYPOkY5wT41bCXpsxGcb0+wHCi+R6I//gsqz?=
 =?iso-8859-1?Q?Yji7pAFNX4Ta9DDEiLAO3Fp6r84TDHMh/eZWhOqBT1T2+wFb5/4ovXXwAu?=
 =?iso-8859-1?Q?sFSwuZilBcAuRre2eJ3CsUNy63sYkrrsHiD5gvDr+ZZwqmocd429shvN+Z?=
 =?iso-8859-1?Q?xE8K9j4y2A4WZwIgONU4zxrvWUlV57ntOWe2dGWtCN0JVoQ7UgAWEye5Ps?=
 =?iso-8859-1?Q?/WKAby549lLwgQBsr78T5WYL3RKN7ClrxU77OVWNwmweJ5vbHAhORTyc0r?=
 =?iso-8859-1?Q?uPZ0Q9MbmOhHJ152WDMcXnUg/8QClKQQmfwlcjpFKcVSL8NYfyD/lYsY3X?=
 =?iso-8859-1?Q?2Ly9m3dXZPtKEKus461zjEq6epA+Ih2mzdq2dqz1Itu0Z99Mpzz2cGJNaZ?=
 =?iso-8859-1?Q?VWGbh4Xk+B9ACfZU9tUp42bUxl1BgwkwBqfBly49hgfYpnyVRMDkTyXA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR09MB6518.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b8ea62-cc7d-44a0-b0aa-08dd77667621
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 13:00:10.8210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IsYWsYGc+cae556WMbE2HsLPYKzesaz54Ai6+Y/cjdpl+YZwTEzTBR7E8hq0mSwNppzMkQYTfPNdSD2PFbd2K9IYCdvccweQqvgX44am5aM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR09MB3750

HTEC Public

Thanks a lot for your feedback. We will address those comments in
the v2 for the change.

Best,
Djordje

________________________________________
From: Palmer Dabbelt <palmer@dabbelt.com>
Sent: Wednesday, February 5, 2025 4:31 PM
To: Conor Dooley <conor@kernel.org>
Cc: arikalo@gmail.com <arikalo@gmail.com>; linux-riscv@lists.infradead.org =
<linux-riscv@lists.infradead.org>; Paul Walmsley <paul.walmsley@sifive.com>=
; aou@eecs.berkeley.edu <aou@eecs.berkeley.edu>; daniel.lezcano@linaro.org =
<daniel.lezcano@linaro.org>; tglx@linutronix.de <tglx@linutronix.de>; Djord=
je Todorovic <djordje.todorovic@htecgroup.com>; Dragan.Mladjenovic@syrmia.c=
om <Dragan.Mladjenovic@syrmia.com>; linux-kernel@vger.kernel.org <linux-ker=
nel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Access time mmio instead of rdtime.

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


On Sun, 29 Dec 2024 07:09:13 PST (-0800), Conor Dooley wrote:
> On Fri, Dec 27, 2024 at 04:00:56PM +0100, Aleksandar Rikalo wrote:
>> +#if defined(CONFIG_RISCV_TIME_MMIO)
>> +    if (!of_property_read_u64(n, "clock-reg", &mmio_addr)) {
>
> This is a non-standard, undocumented property. reg & reg-names are what
> you should be using here.

We were talking some in the patchwork meeting.  If this system has a
CLINT then it's probably best to refactor the timers such that MMIO
CLINT access is independent from M-mode (as there's some patches
floating around to make M-mode use rdtime on systems that implement
rdtime).

>> +            riscv_time_val =3D ioremap((long)mmio_addr, 8);
>> +            if (riscv_time_val) {
>> +                    pr_info("Using mmio time register at 0x%llx\n", mmi=
o_addr);
>> +                    static_branch_enable(&riscv_time_mmio_available);
>> +            } else {
>> +                    pr_warn("Unable to use mmio time at 0x%llx\n", mmio=
_addr);
>> +            }
>> +    }
>> +#endif
