Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE7122068D;
	Thu, 19 Jun 2025 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326210; cv=fail; b=lNzmfvVrujPjiLP8pIKGQ7XgYZoNIFBSGrgkHUS/EprvyV8iapD9ZzqJZ6GN8PCzefdOHmLBQvBqA3ACLlQFxBxEk+TMlRU7RnDHMs0SDdsrcmkoT49XZm17HysObiksOOi8Jts1I7Ksh9QC7OsWSzlUZaG8vBmsVHy9HOtasHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326210; c=relaxed/simple;
	bh=2tO8aTzn14tKellQINtahYpqjkEvmM/oQERpDvYaww0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s1H5r2S57YibL7m+I+Ouo8OGggwcyJkTEv0GWpOMOfFBC02DrnhtOjvNxPcPoTTYpaja9Hmsg2JSkvsqtGOUaPIq+gwZFLGO8KpiEP3598JfQY9NbCkM/R7juvLkUh++IyzWmQMk7AqG14TDc4utMroGLs7dNOo6qnd2jVcrcBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XvXyyxST; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XvXyyxST"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZWq3ebzxDz7eWmeXFH/cYu2+ofd1WW1FidaLYcmbMTD5uoudZh/AYWO7YHS3xWYlkFN/qStt5O9ZF1r6Wa04eNvasZ0gRw95igqR+EUkL5ZeyP/VKStcFtCFktaUqx4K1aKRttCokE3Mhx4v9YkBDhE0opOStXhTrMhps8G4aUry0QRc66KxF8tIieVgCnRcGwWKp5ZyE264lVNT+HyHvIhMe3Rl7EYbK4Du3qyiBHul4J8NWXsZKGqexcOJNqJv5bewCTvHEXse3H8Gx4uYbzy+s78Jtr4+PxnHqcvDTj9Dvsv1zhnJys/EvQvhI8X4lIohDPrUYnQUe8di9/WAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QcmHx/Co+HaHMGUqthg9KgaH7H+4cupTCuUQAqpTshk=;
 b=kafZkOIlV5mC2n7idPoER+f0M0CRiX+hhASUszuujdVJt0J57XJ+8jnnH8VWlYISV22OLwAEiEA9doIcHKTk/o9eGdVEJGm7yOHkT/6TVaKbycjirTLegom3Kl2z9nqVNAJ98/oNM5lML7Tv3BTEaSeX4sLfcsVgFEouUB/xcqiqDJF9MvHLTpLgHNiCUpQFI2/V5JQRT7KTwVdRvIWIF5x/a4XP1Qi83NSM04tSdif9q9lZLudWO68TRHo0hG2akMrnrvxHSp/q78XhO2xiPpMPI56TnC4aFQhSMrtAq/HMNxGM9guIG3Izv6Xk0aLtAm58QlPyvaZedE3C6Hhb8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcmHx/Co+HaHMGUqthg9KgaH7H+4cupTCuUQAqpTshk=;
 b=XvXyyxSTrhrebwywyadaXzr4FG2yr33VWBuGaIkrKl8ptuLdw3mMHktGv66JqxQUp/0A2mKstfcaVqLWghc34k9mY7Z/Tni2nVzxbA2xwGhShFFSWfTyIzDvoSeaWoBrYL2Z2g5yAGagUhGKNW6JE2JvOvOgZru2787gtboqtAmmIjFzmP7WAQHbN+beF4VUuWYQn7fcaNM396O38XaUD81TooHR6zPtUrDsC/ZTv/Q1dyCVbMwUvMM3FxsX9IyK2yz7zuS5N0svKedQYy02mAusvvvMxxebWXAyZ7i1RWdv/SJml4O9KsiZhGEm6XpGtSaNmM+JbJV0A1oK5Fzhog==
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by PAXPR04MB9007.eurprd04.prod.outlook.com (2603:10a6:102:20f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 19 Jun
 2025 09:43:25 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.8857.021; Thu, 19 Jun 2025
 09:43:25 +0000
From: Joy Zou <joy.zou@nxp.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	Frank Li <frank.li@nxp.com>, Ye Li <ye.li@nxp.com>, Jacky Bai
	<ping.bai@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE:  Re: [PATCH v1 1/2] dt-bindings: regulator: add PF0900 regulator
 yaml
Thread-Topic: Re: [PATCH v1 1/2] dt-bindings: regulator: add PF0900 regulator
 yaml
Thread-Index: AQHb4P6aGFYrfcch60mCvnSQdyUuDA==
Date: Thu, 19 Jun 2025 09:43:25 +0000
Message-ID:
 <AS4PR04MB93862132A8A97C63FF43C096E17DA@AS4PR04MB9386.eurprd04.prod.outlook.com>
References: <20250617102025.3455544-1-joy.zou@nxp.com>
 <20250617102025.3455544-2-joy.zou@nxp.com>
 <d948dfe4-635d-4ec0-a89f-2e77134c3f75@sirena.org.uk>
In-Reply-To: <d948dfe4-635d-4ec0-a89f-2e77134c3f75@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9386:EE_|PAXPR04MB9007:EE_
x-ms-office365-filtering-correlation-id: 76611c29-f613-48fc-f5ca-08ddaf15bcdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?WYUsSo5TO/2Przm5n/G1ySddABN+FoyX5a9YcNcWc63ctePz8FlAcgWlrvYG?=
 =?us-ascii?Q?EBTq8k7d2Rg01C7BA8RaIE7ik6EJvU0qgOMSOqCzdLpLClpG8seDbr6at7vU?=
 =?us-ascii?Q?l+DJEYwOjJlPfJZcATLuOY6o7wTMvts+lPByar4BXNMT04FnlZG/DRs5CDED?=
 =?us-ascii?Q?C+6apusyjhfNnpEL7TPWeM3TwomN5vMcIgFoVejcVPxfypHHSbxzgS7xr8vR?=
 =?us-ascii?Q?FkX9epeedqcrr7uLP7WDVtuNrhGzPOgJvlhWfna4GokFIZlZwCuWSodWBjJ1?=
 =?us-ascii?Q?XAV6bO+M1dzgE+kcM1TQFYKs6/+1K+/yGOfW+bb4iWFv+yWH3PMmGGHUdtq1?=
 =?us-ascii?Q?5h/ymH5Nihqlfi/WlltabO0NovVl9G5gAXKjgs1d9x4Ktuns7Mdx1YIKW+AC?=
 =?us-ascii?Q?zzbpaKW+X90pDnaFza3DnlaYUSIcEYo0rrGNeB0p5XvV5MemAOAumTs0HnQ8?=
 =?us-ascii?Q?hCEn3JC8pQJIxCyN7zxc/ecMgG0+iVV8fSGd8T1DQ5tAFag/B4WULNa5FlYd?=
 =?us-ascii?Q?bm5wEGGJ7shlVrhQoN53GTbqfH0SiswwV4djoDcz1rfPL+OSHJ16vr/5Tlxl?=
 =?us-ascii?Q?wdcip5F8txTLaHU2wFYcXrex76fbzbSccuzATOA8GqSUvAf38dfgT1i8dvLR?=
 =?us-ascii?Q?tPSUQ13GRQ1vOgcmvGu1Srw7lk/sHkKbXRtDaRbyy52ZA4QzlYX3WV1prRzR?=
 =?us-ascii?Q?5rGfHR6e2TfjC9WKjnwC6jm+vp28rqu1yqCediTOhT0dZrtVmeFcWIXTb8kG?=
 =?us-ascii?Q?7EnZU3YVAtZwAdSGiItQoHYM3Tx0BgtGN63RIcTm8CTolYCS348BUniwxbrM?=
 =?us-ascii?Q?r1yuJVtR962AIL03pFEzNLdfC4raucpIzDr2uVgN6rZZrFe+L/4+/fSksMdD?=
 =?us-ascii?Q?hdhMaNWrf57d4ku/qCL/8xv4g6wrmAA+HVzICj0rNh0ZycdwNZnbp1Xp7BAV?=
 =?us-ascii?Q?ydB395ra+xsbVRhyLPequCZGn6BDvTX5+YQ4z2eGGKrfU/LbNgSPIb+DDYi8?=
 =?us-ascii?Q?HuGh9R0Db2om1mCShaAxE6UYZ/hUEcXxGwL84KaMdRl2NuEAEmU0Fpx6M4y1?=
 =?us-ascii?Q?D41j1jLxJeqx9QyDcKKbZFIDDQK0KAAwIGl0E+Tuf18Uv7/LrUavcrtiNt1b?=
 =?us-ascii?Q?NFgW+cgJ9le8XhjX/SVDA56u69Kzo5wJxhmICLE6h/vFJwfNWotFuHgEe/jC?=
 =?us-ascii?Q?3LJiR9+AgvpwgSMe02lwBDyk/MSiWDYQ24hIcBqENY2B5YFkpEPsPihMLoiE?=
 =?us-ascii?Q?jx1RtAWFHmK8w2hIbvsHbKsyyHcmk6Ud/RuJ1L4GGmde0Vx7RHX4Mct4wJt4?=
 =?us-ascii?Q?Yy/f4L6kLRkSlbQbVljfPMmF+iji8in6xbMAjLC4OCSI+Jlxeosqj9sKe3TC?=
 =?us-ascii?Q?KX47oKS/Eobon7ZyrpiEZHxDUJQ00JPhXYyQJqb7yILaew2q+B3dksgiuNmD?=
 =?us-ascii?Q?P4YxloClPv7JgbhmF6SQeu8Q86QvOKnX+Ubi2lsJ1jchi0Ok5c2wRlrDDMmT?=
 =?us-ascii?Q?WoenjigtU4CMkU4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4qO9q+RtXGM1oav0R8mX6PoljxGWZUMmqcNUvxVLRKCed7JG1uWS1IAFVEIH?=
 =?us-ascii?Q?HbnOv2Ryk4yG56dnF7wrGjtRsGCPzvyWAHw8TZWo1OeHb6DR43VLUxqz5p5H?=
 =?us-ascii?Q?ARUIcAMt99jgy1GLhwJGeksVrA8ggkYvGa0aIJYSbpDopBEuDHEIupODuncP?=
 =?us-ascii?Q?d9I7WIYXAPfa5ttDwrv2VvUGEDjcIR1AqXLDev1e3sdKrOct6glW4YvE2LOs?=
 =?us-ascii?Q?m6A17CQ82TB6t9dmNRr9RPGagA2Jugyjef4pRIi5AhQ0k7NwW6ORVes3X/ai?=
 =?us-ascii?Q?CoEGMU41efzz0IEyHz6YoblMZVb2n1kyis2TO2eq9/ZP8R79lbsMMuQMlc2I?=
 =?us-ascii?Q?M92uuIEL7rzG2Ujf8At/rDiNGyKkE05q2jIR+iHwL4WElWGRM/VMzFp3HgfR?=
 =?us-ascii?Q?IhlvCuVcrB+w3603tu6UUXl8+yUFED94Ru7OFW/uc+IS7TtcgjYLJwu7EoUk?=
 =?us-ascii?Q?Ck/9Ba/UdFGXJRzZMgXGKhIvc44DcEp/X6J45rpmVcgLn4imQC5WP7m7I08j?=
 =?us-ascii?Q?wQMxYeyt3hUv1goTRH5PMLrjDo/9ESr321dWnsKOjkLslX/oBI5cRgtRJ4ae?=
 =?us-ascii?Q?jOoKG34UcgzTdikFMViCjoxEnzkiTLhlq5H3TnkV/bmUer40IkhreLyBA1eq?=
 =?us-ascii?Q?oUzjAy1GcHqm1KVsSS05qm9ugVlD2BGqnn+XX+dJXvqdJLIw1ZqObZZD6Sic?=
 =?us-ascii?Q?C8SaCDzFcPCnJTL9ePwWYDXNdD4Z6RmRN0SJeC84u0J8DX5EPK1Xz4b6y1iV?=
 =?us-ascii?Q?0sSKaohZ9uwTNminZFAP5tLy7zoA9RdzvHDcqmp1HDAZumYlH7sRFRX0fxI5?=
 =?us-ascii?Q?5ihLlCd9YMvSYs59VYG9c952ZA9AvGU3opkqi7Zin1jJSppuWPjRX6poQaUi?=
 =?us-ascii?Q?BU04v6fGVZ6+d3gpBg+IhjqsTA6q79ZA08/c/rDNnRLa2IbwibMtUw0DbDwD?=
 =?us-ascii?Q?3SIb3aB0pCaZGU4V6X4cDBKHEHOfeq5XgyORCgDOMMgN7zRM+HawaKglUxqj?=
 =?us-ascii?Q?r+5do/ddDJEjgJ8o7FKnr1fleApO3sKJIYj4nCZ0jV1SSYgfe3Fm+SmltYeG?=
 =?us-ascii?Q?ZppqBu530fOYo5R2SWtnjNcNgDxAcAzQl1/IVNU861TSKc8upQOmeWkujRbq?=
 =?us-ascii?Q?FntHJkjTTmnGB9G/Zz1JqfKdo6LjMo6J1qxnnN48uttf13YwbHg5SIzyOaly?=
 =?us-ascii?Q?yS4hu0oUaAJPyM0SS3ZjR9hVm0IuPxUqxRyKmJ+mSapO+xbqz0fCe1nw+VFS?=
 =?us-ascii?Q?FG3pv5DGK1r0Rdxp+eQTACuKFlL9wNTAmhamt75D+FIkqOy0ttrhPC+hPG8W?=
 =?us-ascii?Q?6huMQdew2R4f3e7Ys9CLTuiXN6tZ1CqdpPhN2xT4kh+/U5XmkyGcKZ9Vigwy?=
 =?us-ascii?Q?Fva+FZbAmZecAOBlBGow6R91vysYBqimOfYhKefMld0kDS3Q4iPPFrTkgnXS?=
 =?us-ascii?Q?ZPwSD+2wY6VbRk0d2585o6uo3dxz8Tr/ShXYRU8/57tmALWZf5d76DXiecn3?=
 =?us-ascii?Q?suEDWCAvmN+h/6myWvHRoRkRvHxURaVFoU8ZEOEam7MIpsPUdjQDBvTHwOuu?=
 =?us-ascii?Q?3gYD1rCXbyOfWQEIFRk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76611c29-f613-48fc-f5ca-08ddaf15bcdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 09:43:25.3940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EM+gSLQXLOW7U1s8eTRFZ4UKFeaimHklX5mnInorlC+TFYc+Sq2w3IqozV6VDviJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9007



> -----Original Message-----
>=20
> On Tue, Jun 17, 2025 at 06:20:24PM +0800, Joy Zou wrote:
>=20
> > +        properties:
> > +          nxp,dvs-run-microvolt:
> > +            minimum: 300000
> > +            maximum: 1350000
> > +            description:
> > +              PMIC default "RUN" state voltage in uV. SW1~5 have such
> > +              dvs(dynamic voltage scaling) property.
> > +
> > +          nxp,dvs-standby-microvolt:
> > +            minimum: 300000
> > +            maximum: 1350000
> > +            description:
> > +              PMIC default "STANDBY" state voltage in uV. SW1~5 have
> such
> > +              dvs(dynamic voltage scaling) property.
>=20
> What are these states exactly - this feels like something that should be =
either a
> standard property or discovered at runtime?
These two properties are mainly to facilitate customers to set their run an=
d standby voltage
according to their board in PMIC regulator initialization.
BR
Joy Zou
