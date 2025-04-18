Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012063.outbound.protection.outlook.com [40.107.75.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA8214A62B;
	Fri, 18 Apr 2025 14:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985315; cv=fail; b=lXqocS5qXW9XBSgJdC6GN7+n5Hsca2X4cX6JsosMa8JGLOcz95CraF+wog1uGibZn812m9sdh9xyWuPn1rKJQM+xe0b6MzMpc33flOshNWmKsczyZEqfUvQjBILHoMLIhq8SYjMH7XqwsxUHPQt2ROG6WHV2j3+SiX3UkcD6IeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985315; c=relaxed/simple;
	bh=206BqdlajjLRZ6wJSnRmr2hOjgBS9A9c/YBmkhzZ5P0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KVH9vbGM/kRfxVxwxWMa1a4fkJm2Uv4xmAEGByzSZtO3dDxW9aYhFFoHI/HG37WalAndld0oQTfqQHvuUXF67H3NsU4ys3+MiuPYxDrEPQUwdg3Pc4ZOmybZ0SDF9/0TkQMg7n2NZ0ZvG/oheTTUq2DPXe1re3MJbRe+d3m1QvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=Z7WwMvWc; arc=fail smtp.client-ip=40.107.75.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="Z7WwMvWc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QeHWkXHyyFjc7cZ6UkAU+/MYTeRwdXdBAww+XKmYes9NqNMECCxM7UBbO99H/uYhd6J6vmIhnYGqOgWzLPpyA+NZGCtE0wnctAmio+d6HhKj+6SbK96/hA9/8DZccIaDBKEbdvsIFl3Uygaj6v0JIVf/Z95qciAhIaWD5OZQKZjKXWnvBgB10dIoMhuNtKFOCgp8xKlkRD/DUDuC/rm9KFYC3Bbinhh5lC9cqa1dshVxO8l2sKMrgJtWF5WBzJUMOhXy3MrrDe/Pq1WFNCCC9I9QuHuYZO8DWbp+aPtkfZWEbhImszNKj14mLfO2aOkyIiyLx/ZDnm3B3rGH86mYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=206BqdlajjLRZ6wJSnRmr2hOjgBS9A9c/YBmkhzZ5P0=;
 b=igrfIFkvZ4EEKRLnmfewfspdIepttRVJXD256CeunyYpHL9NmmHxdkiuuV+qWn8bK/4ZJpeWMJHkSNGNLLTwbBI8CJ82c4wIF5HAoeI5OOhiLUb4lbLDwr3sQhvpXs4APBz6ufDs88hTyPKXILPJqq0ZBRIZGugT3/Gw0vi5lL0PXdDYA/hVZ+k2TN8q5CAha9mDJLfH8Rt5w84mKtBnVC5QLo1B8Wml2U8GWhiuoqLVYBU9wKtXydV50W5JrTYdS6rRDAUfRZ7qrnBg5ecTXVAJJx/G3nhwz8XPAlugJsidAh20QeAX5dJDkPdOiEodLzoyDGp5RvVk2KMR17EQFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=206BqdlajjLRZ6wJSnRmr2hOjgBS9A9c/YBmkhzZ5P0=;
 b=Z7WwMvWcyVJjGoQ/iOmhJnhf+ITP3/m0pwuQmBr19jvKgxiYTABGnBReE2Ed5+bHYz4t/L8Q25uU1EncfR0dyW4hBRZMnBiAVTmouGUep8P1N36xGDBf5hUI1RXOSVNkdkMzxrPDFcTLOoaQj9jegizrreP17PD46n/391Hu9SpMRznZKL9P0h8inyH7FdlpFUhNwb7+Jx9fP0LXaJociZog2CfKSQtPrr0my9x4sYwBcqzhy5TkAPPEfjlxy5ilN0SV6WnNXRy3eOKRQyE+EKU2Oah834WjjUdpK1V3jZot7E26cHpcKCaBbwjR8SFvxhfpOj3sm3QQXmyxwwLELA==
Received: from JH0PR06MB7294.apcprd06.prod.outlook.com (2603:1096:990:a1::6)
 by SEZPR06MB7023.apcprd06.prod.outlook.com (2603:1096:101:1f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 14:08:30 +0000
Received: from JH0PR06MB7294.apcprd06.prod.outlook.com
 ([fe80::6bd3:c327:c5c2:bbbe]) by JH0PR06MB7294.apcprd06.prod.outlook.com
 ([fe80::6bd3:c327:c5c2:bbbe%6]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 14:08:30 +0000
From: "Chen, Jay" <jay.chen@siemens.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Shao, Tzi
 Yang" <tziyang.shao@siemens.com>
Subject: Recall: RE: [Bug 220033] xhci: Compliance Issue - avg_trb_len not set
 for EP0 during Address Device Command
Thread-Topic: RE: [Bug 220033] xhci: Compliance Issue - avg_trb_len not set
 for EP0 during Address Device Command
Thread-Index: AQHbsGtclQARBO8c00m2qxvCfCEeGg==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Fri, 18 Apr 2025 14:08:30 +0000
Message-ID:
 <JH0PR06MB7294C9054DB4408B46E7AC1483BF2@JH0PR06MB7294.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-traffictypediagnostic:
 JH0PR06MB7294:EE_|SEZPR06MB7023:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aff81819-6f0a-48e3-6798-08dd7e827f52
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?03ra+Ttqlg02q9ivnjJVJyqj4U2L3j6WH5c5+zrf+EmuTYbONKKkCSqt/jbz?=
 =?us-ascii?Q?LqtCYbKnHcK9HYNBZWYtD+mjDG0xvcreHeM36TCavZxdiCEbH7Gl7hl3LhBK?=
 =?us-ascii?Q?0Lxj7xsnGjxZt5tOPJYSIEQhTMD6FuUzi26slDFtux/KXIWkGiY73VI5V6hg?=
 =?us-ascii?Q?B6oUbvaZgGW6NBI1TKWLWZimWJf+upn8VG+Ecu7rzlnnp5MVAW1bzVsU4wWN?=
 =?us-ascii?Q?Bc2mtToA5Zh0KhtkdXrjCvndIaMBb4kKV2NoQHnbolgjpEcxfnLz5BFst1eT?=
 =?us-ascii?Q?VzWLIbDN2A2GcBOuRCEUFHPJhQN7svXYky7j0OIH7qPgNFvhcs15wTLMxkMb?=
 =?us-ascii?Q?V16ESIrOiFWU4o/LEybWJo4xuIfSo2aDuKOAKx2NDfxhjOO2Bl9IA4w3HPpO?=
 =?us-ascii?Q?8ehLiXgUVIAjeAWVGEARVZ3N2uk3XXHpIBmdre/NlEvejOe1vmllwH+ow99n?=
 =?us-ascii?Q?mj7mMKOPNhzMMYjItJSc2YNuZ8iw6+SW3sDlCmtyA3gPvkxutNlTPR6VzEcb?=
 =?us-ascii?Q?iA1mQaSm/oyUVqtY1BnAYCcyqk/d9neSo5he+OBX7NrMhYaCAA+k9TIid6yM?=
 =?us-ascii?Q?1ezUbrHZam3m4Ve7rZPwhCtfEjj3BsZ84t/Af1E+l4MUZ/wTXkvmAa2ryvNM?=
 =?us-ascii?Q?o7E/2k6r694OuK2pp8E3OQysr1BMx/bqk1Hq7/OwmOTcL0q+q4l645XIiBDF?=
 =?us-ascii?Q?wOPXT3bIu4gW70m3afGn1/bO1T71vLOIy1PSQXDpzHBa6Us8sYbkRgVK5LTP?=
 =?us-ascii?Q?7UX5LkGlnZli+kx8HDSc5D5tT3pTnrVWICgUfyqbU2rYJXFTE1NDXwJvDKJ+?=
 =?us-ascii?Q?bQLru8vpeu5c/LBRYsd0c5qfYredJ8/jEd29FLmeiTYgkHK8L7KEs5y27wn8?=
 =?us-ascii?Q?ssrb6x5klXd0L4uXqaIaMnjBJk+R5/RfWbHMlJt+Isgv6fH1mo4mR1gMPrwF?=
 =?us-ascii?Q?o7iQH6+hijv69QFVwVQbdazHuWXKI6BAmBR5neLWlW+fFOyaNwCgIlSg6Kug?=
 =?us-ascii?Q?jSmyO9vucm43cTJczFSsKesw828ME2jHn2KGTZ65V8giB03NIJIP8uehYZWm?=
 =?us-ascii?Q?j3nTZuWY9IAKuu1cJIDrvwwcsWvWrstIuWBVOo2z28OGxZe8JsBigDIHHGOT?=
 =?us-ascii?Q?3ml/GhQ7FSX2R/iGyPAvKWrcgWhqWY0/VVEPr1EJK06SPf7yWtmHbeexA9ot?=
 =?us-ascii?Q?qzAtG5CSYOa98ZtCSX5jElzmnan16VBkE4Od54bZfThSeMIYV9XEbPQRv5bk?=
 =?us-ascii?Q?AqdjHT3KO9+c4g9EUFlwkGNbgJkRsGKh3J2JK53QTfesKh/2hqzkpqUEA3PH?=
 =?us-ascii?Q?4Nk3M2xVhy1NxoyOVQGiA9FrpkeFc+nZ2pSMijpM9PUb5JEoZjUsqx7Qt4ps?=
 =?us-ascii?Q?Z5LTTK0QivEtROYAcCwp2WAiGduGb2Nx5jkL3we19rRDHOkdkZVspbSwZ2CH?=
 =?us-ascii?Q?yWq+shnwcbO7tRJdNIL54iucqdfqvVURkexmIubYIDboi3+jFJfrKMIM0wOW?=
 =?us-ascii?Q?TAn3qjaXDh3Wi9Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR06MB7294.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pmVQfEOZFVpEh+kPKihtG7htAFbugqkYwbht4NmqVrDqsgUMZEQAxK68pETi?=
 =?us-ascii?Q?CL99pj3dU7dKuWDKBYS50l6B9qifeATSG6jP7oCKgFjGv4n45f1n26GQEo9L?=
 =?us-ascii?Q?1n4jKPn81LiGOud8yMiN4wMV75AYfAPajIpyk3+6d98mbmU4wROv3p6yaIUG?=
 =?us-ascii?Q?l023zNENgELA2rqyyEAwzpjLBkDDEwenv78zTfTaTw/9P31dcQhGJabxJe4M?=
 =?us-ascii?Q?6Iw7kAuw+83kj2O4mCt6b7sWV5IJXsQD/9LYWXwuEWbV6/gBXP8OtpNhYCFd?=
 =?us-ascii?Q?uND6smNTYw498pWB8e7eqQV+tua1zDK1NhygiPDibTIrMNI3TG+mIS4gpugy?=
 =?us-ascii?Q?wh4Ovk4WcavwUnizZldZX1CPP3+6uEkSGhDPrOzCjlgGqBOUh8A4LkADS6fa?=
 =?us-ascii?Q?0QY1Dy4gInzracQrejMe3BdtMIZTXmKjU3JoFmOnPrhZSQyafSDywoi3utKC?=
 =?us-ascii?Q?cKxuXsVQhpHUnBFAjN+DmZgl8ShUm2ndJXCKA5EUO9unw5tQe6iC7U/LqVUy?=
 =?us-ascii?Q?Px6ZBZwQzPm1tRwjX5dSyuwGdlH/w+gSbNLoGk0Brz+GjqQ5YR9oPEjCNUDy?=
 =?us-ascii?Q?IN+iMoy+ZEM1kI9HxghK+0avHhaksppIREtXg2RjFg/fsdaJF62SfrPQ0pUT?=
 =?us-ascii?Q?T6kROwrwQ5Oa2yM0JBZJTMyL8sOEBV0tyr9e+X5LDb4m5Rb1WFmXAGciQs3I?=
 =?us-ascii?Q?1Lt5YyYsZMhBFBbtO7nI5WtDSaD+kMJm34/9AcLJVTLAGQO/QuKbOtrDdKD6?=
 =?us-ascii?Q?0VTFM+dmykUkdYtrTIY98F4JSHyvvgNzHYmF5n8nL29H6bZF8r7dURzRbHA2?=
 =?us-ascii?Q?/YS4WWeA3bn9UrWDqfwtrRyNvdd2O/y5N56mB8QRuRa9ln3+fL6M0OGYFk+7?=
 =?us-ascii?Q?1YrDF9+AH24W0RqDCEd+LhIxpBIKRgVWTfudjt41QH6SjpQ9NLMaXZMPP/iW?=
 =?us-ascii?Q?RZUSZyJm2UdF6hZtCm3nNoqCFz6BfY8WULlj6tcw57t1KY34ZS9nELO9T5bm?=
 =?us-ascii?Q?IH8UlbqVrRMs0bFesBASrEaXvg6RM3LoqiNdShUuSB/2xfkpaxWkzjiEB00D?=
 =?us-ascii?Q?bnBzpvpjALplvL4tO8iniyyShynJJdIBSmYs4OpwPnGN6l6XNFGDZ1STi15Z?=
 =?us-ascii?Q?eimYyC8kY2wuA7M9QzDv4MNv5A3MsagedEiL1rqQANBXF2nOeiQF2khtNCT9?=
 =?us-ascii?Q?o0jvAALTWkE6DbOxZ2HZTQ2uXsiBhEen52a5djLI5bB1AMRIDLVrHZ93lL+x?=
 =?us-ascii?Q?KE8Fev++mXPzc7rwLNNZ+hl8bWUmbwVMPRdB+0/SBE1AfvJ+OPyFvIIKX5f5?=
 =?us-ascii?Q?ozwMNo0oCM64ruGyHqhNLxnE2XxhcEmefWwiQ771OplCjZydGjwGFjNmmDam?=
 =?us-ascii?Q?u10g2XJyibrT7JUF6YKoI3tR0Q+C+cY0qBlmd2UpS8E3kAZPCIHfHOczx3WK?=
 =?us-ascii?Q?zccwSZ61GabsAhYT9ryPKmjowh7y63vel1hyYYrcD655I/xSBZ5m6K3FHhwX?=
 =?us-ascii?Q?Nbw9mKv7An6EsGFBCjnB1SsFfTVVgdguUtb3gACAL+1FADyrsku2V/zwlDpz?=
 =?us-ascii?Q?djcuSrGFeaYJaa3ogCGS19KxIx2C6+9zSpEHhmsf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR06MB7294.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff81819-6f0a-48e3-6798-08dd7e827f52
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 14:08:30.3085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZHgObkhGqS0JWVeJvf+X5c43ZZZvffJC1NTpOAR0W6j+P21w6OCR8b5VimLkWDV4lJ268W8itK+L4M8IDEIAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7023

Chen, Jay (DI SW EDA DVT RD IN AVE US3) would like to recall the message, "=
RE: [Bug 220033] xhci: Compliance Issue - avg_trb_len not set for EP0 durin=
g Address Device Command".=
