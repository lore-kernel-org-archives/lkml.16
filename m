Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012000.outbound.protection.outlook.com [52.101.71.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E796284681;
	Tue, 24 Jun 2025 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750762080; cv=fail; b=Ae+ubsLNdoZPmnAMWCRsnfR2Wpda7u4Qf8rf0EBg/AQS3rVnenzL8FtZ2fs78DMNM9JDIyjRnge/WDh+YdUykD+urUPYaxqYDj/C8Bft1XLtXrEUt/FREVuYxokTCTbBBU69djW3Kx/xIAWs5H9fj+P6z6JG5gZUfUv9YSBdDmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750762080; c=relaxed/simple;
	bh=BSrCqyvb/pJsYOJ9Jre2LNlT80B8tq4KQluXxUDEIwE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MhCCpoaX0hkInGb5bNLLJb33C3G4RzfZoVUM17phhjyvWsAfMNEPujg89nOnCkSHa6mgiJzmSwy7t1R6Euy6oWaCdS5snoFH9d5YJdL0z9xfreZOujEEQ31T5WXZ6jp1X1xrr95Px/qzeL7S2N0VE7JraPczZD2kqshCbgRv6ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=OEfi+A9z; arc=fail smtp.client-ip=52.101.71.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="OEfi+A9z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPkU3fhCf7N+DB+IBy9Vv1HRi6rsV9H1p/xEYlhspgmEnbz82vH8A2p9Y8y3FdwxemnPTORO+b2r8usy41N+uFPxRE/0cCRCiDo2p279dnta2mKu6w7K7UaNf+OIKWAInIF8f1E0AItdMGijDVIYdlMC/asdFW7lb5JePSziVnHsRsaKSGbPE/ivRNJ9XmMQdGF7DK9dKqdkfMy38I+3JIyWwrKov2+JJFC+Q6DYy8TN8CzeDzFA63qCEncU8tkSNNT6/juw8OQ9PnNNmFKDQlAtJ4v/HOj7ViQf4+/7bx4YHwn/hHAQKLP/yZVbwYI0eEApDspFcj/nNgQAGDunTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4DpphsqQaLHgsj5EcIPXgPwugDqwquia97TDgY0UiI=;
 b=ZwjXxIOBQpTgxIFKz1DUJ4Zkft9nRdIAff4TXYRwCbTNkXJqzc51AY0TQH6h5MOBCiF59b2P7ZKNNNYcGR8GQmHuLuFHRxrXCL+FSQLYjEvj0kegk5gMKOyvcpm6AxruDKODVKH+g35ic5gtx19GATHygGl+WdGsZ7e5bTtgIc3FCC5pKJcRsXUMXR8AHQWr515OMTvGAU1CFwT7nQny3PmhSodfhLQxnSotAkABi/bTiPWyZgMAN0LQcQdzWe/H3rcUqHWWyDT6qSMe3sPQ/RAnqUy3fZeNtSFvlZWw7nJ+jYyBVtbTVAaJw9eFeZL2+dFdXrM0PG2Tjjln80ClcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4DpphsqQaLHgsj5EcIPXgPwugDqwquia97TDgY0UiI=;
 b=OEfi+A9zGllIZ9tJcFJiSFkS0q/3VuA+rxmuNd7XvxrhxUTl82tnkV8EriLAaSl2zwsN4pg8g1p8QINwJnAL6PiMUo/LgcrG8IcaBznTvrJKNTJKCiy+HfITgHn09coYcDByymbyJ98FdNE4GCv3dq7YACWaDFwymU8uorOhtlA=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by OSMPR06MB9906.eurprd06.prod.outlook.com (2603:10a6:e10:6f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 10:47:52 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::1797:2a6b:ecc5:f7b8]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::1797:2a6b:ecc5:f7b8%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 10:47:52 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH 3/3] usb: dwc3: gadget: Simplify logic in
 dwc3_needs_extra_trb()
Thread-Topic: [PATCH 3/3] usb: dwc3: gadget: Simplify logic in
 dwc3_needs_extra_trb()
Thread-Index: AQHb4t+8cTHEpSmpsk6mXfyIJUXNebQRV3OAgADMr8U=
Date: Tue, 24 Jun 2025 10:47:52 +0000
Message-ID:
 <AM8PR06MB7521CFF1CD8A93622A537EEDBC78A@AM8PR06MB7521.eurprd06.prod.outlook.com>
References:
 <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
 <20250621-dwc3-fix-gadget-mtp-v1-3-a45e6def71bb@leica-geosystems.com>
 <20250623223134.mr4lsbrl73ita5gm@synopsys.com>
In-Reply-To: <20250623223134.mr4lsbrl73ita5gm@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|OSMPR06MB9906:EE_
x-ms-office365-filtering-correlation-id: f309bbb5-1cbf-43d9-8440-08ddb30c91ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?prqpMhoIjUiWowL06EkI8JU0se0+/uXGwGy3k59NzlfMlTeGrZId9Kr9dV?=
 =?iso-8859-1?Q?1hq3bjeu0QXax01XZWfvl0JTdHrS/XGe6mfliZHztUWfuretsWsqDkerXf?=
 =?iso-8859-1?Q?f1wRAktMXyOiVq6cdxT3fJlj08hfxQ4lmZCefiM3cJ781rMdbTZrY4iKI7?=
 =?iso-8859-1?Q?dWHt9QhoLXoUDuGncpNuSd5pIdJcczx1Mu8RAo/7Vw1w+J99b73bK+PrAy?=
 =?iso-8859-1?Q?6oMlP0Wdy69upJ60aO/gqJfoRoSWzB+vty2rqC1TajfcvuI1lwzXCmxwRW?=
 =?iso-8859-1?Q?Upb5tv6cjhDihjDopNZJwHOkLS0pVMTPw5NvuoAjTJggyEF0Har0+Kry4A?=
 =?iso-8859-1?Q?m4UzNO7MLvJuh161Hyud54pkOuqjk2UgGdtF5M8UI3DhZ05OD8PwUNLbCc?=
 =?iso-8859-1?Q?NLPtsFagJSMr/qPfBTZvaPGP9S5t9eF3hxgPyMOJSCoGoLAsZR4ZoQ7Fp8?=
 =?iso-8859-1?Q?N79bUpCTvCwPCX3Y76p3+vtzqaZdqORbVGzlSsjsPRiJu4ygA0CLM1uWMt?=
 =?iso-8859-1?Q?hDMnfNVIFlwB0fmfBrU8yOylM0y9yoJoEkRKSB+gF+o8oMJEqptE1jPfS7?=
 =?iso-8859-1?Q?LGg8R9cHyUH9PbGVDc0Q5nip+MFWHyNe3WLsFlI9HslwvW9zKptzhxPgKC?=
 =?iso-8859-1?Q?yFzOU1rRJnGUsIzcz+o3Ee5kUsaMpLid10896S1uPpyhtAtL95tD+pAVOS?=
 =?iso-8859-1?Q?oTwAFDGOROWiqtoO2obfPFt6TJF2WcHGlDCVGBBA/didLlgwGNjTUOZPu6?=
 =?iso-8859-1?Q?4jPB3Dr8cxtfPgTimV2ASpIYqeOR9DeSr82qx36uKu5Fh8hKr8VpKhpLQ/?=
 =?iso-8859-1?Q?WNKiHjzGWsOEVQHpIB77BOPeFF2BjfOrYZWRJdYa0kTcPMJrmriqdLYpcC?=
 =?iso-8859-1?Q?XfSAxmPc5/x3savxABQWwJKT5joXTjyYLbDGEUi8O6JSkejhpfsu7VcXN3?=
 =?iso-8859-1?Q?4+ltl4D3Sr242NRFGftY+eTXtpTAd0pXpbpCNzSFw7aIBUkV+snAn/uLJi?=
 =?iso-8859-1?Q?Ar2cTjAYquEAK+H34nspmuGhq2xEyd/dyh+gjfWyhhnx3ZLoR0gAwhLg/y?=
 =?iso-8859-1?Q?nhd3Kk1NxJGaGZ9irrePnSSpLAzpD3r1HynVQ7eO77JzONubwgJLmA8jz8?=
 =?iso-8859-1?Q?Wc56t7tc4EwCnJxlPo+y8f1Y0vcveS09D3AvwmrxgyLxcnyCcvFAoXln/N?=
 =?iso-8859-1?Q?6xikARJl4wiZv0sJWQy9AouA8mhzJwrE87oJDcvsldYEs4T2AryHrEyK6O?=
 =?iso-8859-1?Q?6yYvbOZwuxXHRcxsE3us/9FrDyCTBfNB56WURiBf0vmd3xa5D9pTyuLDLd?=
 =?iso-8859-1?Q?ShvpKwNdokfcEs/0O6zoSVEFt/fU77+FZ1qKyfYa8pGuU0o0hZC2JY/c4T?=
 =?iso-8859-1?Q?E42RStqUALBcVjWyBFGepVXYffDgdagLuilJZ2vaWjLODyIxxXse8LdPoH?=
 =?iso-8859-1?Q?EoOxgvJH3WYbSCIHUFBtzL33OVAyMwn2Efw8uHrFt0WPW3PUvLoTucwech?=
 =?iso-8859-1?Q?00Sm1BBhhDvhLmtR/JktDvIn/RA1HhtGYGQ5ucYdYg/1p2FBQPVSla9KpP?=
 =?iso-8859-1?Q?yo/Q8cU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?So1fnSdt1ls6pfYk1OOQdjOVTea4z0xT5kOcmhTUekCybmQltlYwdiWOo/?=
 =?iso-8859-1?Q?IpEhwEeGDIG/brTeLUbFA+e9S6oDd33OTpgtNgFr0IHoBSPIr6aVA4NCDZ?=
 =?iso-8859-1?Q?0E5ISLbPqRz2oRNeB097Ret+OHFyJUSoCIbZctf9+vWRF+edByxmLr2V21?=
 =?iso-8859-1?Q?zMx7ch4KbGzNxhiqIePyotiWj3Exnh08m7vbdkOUFvb99e61Ow2RdLoz88?=
 =?iso-8859-1?Q?Sib/BTIwbzD+xcOOKmPzV481oO7TfvTIv06hSEYGWtsBeiPEWq6HD8jYRc?=
 =?iso-8859-1?Q?uIBO7kApLGpIqnmKTgPSTcbQJL7eovkydFZtnycdrkFOtlI86Xm5i6GPG+?=
 =?iso-8859-1?Q?wgd3gbho4yNcfzDXU6oB1HWbpqm8uOjPhepSOQhbah+MV/z1UFpLwHsK8V?=
 =?iso-8859-1?Q?FIrgxuOY2638ZiXskjCEbuQO+KQ9MIhE9F034uPK6RZe7axIEcD8bEiCub?=
 =?iso-8859-1?Q?lk57mrHdl4Zfsg4qvL+PmGc1XdKDTaZTcdSzpA3tffg4626MNOk6GFiy5/?=
 =?iso-8859-1?Q?1yPdaVEsnNOtY3SE5n1Fz58U0dc0A20av2IUXkR3db9818jXj7+rB78fyq?=
 =?iso-8859-1?Q?AFGthG5lZBo3sh1Xqt0eA2+b0DIq4q9tS/t9If0ZWdvttQg20uI2igHpEK?=
 =?iso-8859-1?Q?hiVN7u05pKRS/lVrWNk97uE7jhrPNdB/IgOk8oUT6etcrhG773e3d9dRjr?=
 =?iso-8859-1?Q?5IiGRyFLVFDKWnUhY2fPRtj9As78AJP7JMO8BAvvydKg6mPqznfd0c1cL2?=
 =?iso-8859-1?Q?7OCxHb0oFyIpBggf1BAw8L3Ur5pZ/77KHRqX7TUkq5Z+xrwhftgpRGoDID?=
 =?iso-8859-1?Q?AAHY0Tl7iPG9cjuWQnUkPfRqlDt1EseKEQkMQOvVUvZ1Dg6DZ/tfmmycO7?=
 =?iso-8859-1?Q?XHerNoH88mdDPp9ib6Pjwe7IUje3+WT8k/8RQefmMCcyLYsbFx0PksVF+o?=
 =?iso-8859-1?Q?TYCCkALt3ZFxQ5bH0/abwdXidJybDan4KeEgDFNeLGWpO6glYOOm8wOBgr?=
 =?iso-8859-1?Q?79U+cbFrxTFZ8ah6OGFDJH0nhRjIzbtTLmrHZsCV/dTJ68G/WbkK9g/AVJ?=
 =?iso-8859-1?Q?3uYf+AACMOenWu3y/G69gRHCcPTW1OVv31hUgEQ71CU4BMhU0/7BR2lIsR?=
 =?iso-8859-1?Q?KIuSWXQOh0kSWmwX/5dI2l57dXBbYJwKfQCsNzD6lOLHqbAPrB2iq1q+m+?=
 =?iso-8859-1?Q?A7hDVjmcAykBwDBry0mqjVKngpHcCFAoRrFDLO5pIeZJ3zwfqbdTPLXWaO?=
 =?iso-8859-1?Q?a0K4rvwJK9P/jD4sNpYBXUDJhTev9NrqZ5WDdyNsaWcT+WH3EbNINWD4Lj?=
 =?iso-8859-1?Q?FKjPeQO/YYDu4ykrge3arXy4Qm8HB3M4xuezADKZhWNOzvo1+kKWAZvMTH?=
 =?iso-8859-1?Q?xFWcj8QalQYNQk/lmn5XeRps1PnnDcOk12Mjkpa6BxN0gF91CIjG27+7q6?=
 =?iso-8859-1?Q?s7g3i0ksia+ISfI1rmu62WzQUyYNbmnHS1JCszSAX3EihtCPMq4qPxCNXb?=
 =?iso-8859-1?Q?SOgWd3L1K1opNcpYMh4+SQP47bU2li+tOWF1/JkCH2Jbz7kLY8hyiseTF/?=
 =?iso-8859-1?Q?wU9++XWoKa0op/GplTj9pecWwUqg4+44wK0BAs5n0DpP/qy/T1xSGJh16T?=
 =?iso-8859-1?Q?7TX0hugMVjN3l4bSrcRIR0YwErR6xfilQHQqsEDwS+3QxjRG4P/VEPL5Hh?=
 =?iso-8859-1?Q?2ZfjLnvq9yjNH04X6n4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f309bbb5-1cbf-43d9-8440-08ddb30c91ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 10:47:52.5176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6DQJ9NDMpZKPWo+3StTJPo6uqFZemKyXMORawcau3vNdhqRhJWfRWx/4JhK2HQ6gGBA/Qb50iTvCmLC+c8RMyAdvZSnibyYSr5UXSuKbhVVD5tGV77nEjUJtunDN36XW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSMPR06MB9906

> On Sat, Jun 21, 2025, Johannes Schneider wrote:=0A=
> > The existing logic in dwc3_needs_extra_trb() checks multiple conditions=
=0A=
> > in a compound expression to determine whether an extra TRB is needed,=
=0A=
> > either for a ZLP or to handle short OUT transfers.=0A=
> >=0A=
> > This commit simplifies the logic without changing behavior:=0A=
> > - Returns false early for isochronous endpoints=0A=
> > - Separates the conditions for IN vs OUT transfers=0A=
> > - Makes intent and flow easier to read and reason about=0A=
> >=0A=
> > No functional changes intended.=0A=
> >=0A=
> > Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.=
com>=0A=
> > ---=0A=
> >  drivers/usb/dwc3/gadget.c | 11 ++++++-----=0A=
> >  1 file changed, 6 insertions(+), 5 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c=0A=
> > index a4a2bf273f943fa112f49979297023a732e0af2e..32d0fb090f4c2ffab61ae6e=
ee29a02efd32ed032 100644=0A=
> > --- a/drivers/usb/dwc3/gadget.c=0A=
> > +++ b/drivers/usb/dwc3/gadget.c=0A=
> > @@ -1420,12 +1420,13 @@ static bool dwc3_needs_extra_trb(struct dwc3_ep=
 *dep, struct dwc3_request *req)=0A=
> >       unsigned int maxp =3D usb_endpoint_maxp(dep->endpoint.desc);=0A=
> >       unsigned int rem =3D req->request.length % maxp;=0A=
> >=0A=
> > -     if ((req->request.length && req->request.zero && !rem &&=0A=
> > -                     !usb_endpoint_xfer_isoc(dep->endpoint.desc)) ||=
=0A=
> > -                     (!req->direction && rem))=0A=
> > -             return true;=0A=
> > +     if (usb_endpoint_xfer_isoc(dep->endpoint.desc))=0A=
> > +             return false;=0A=
> =0A=
> I know the current flow is unsightly, but this is not the same logic.=0A=
> Please help fix it.=0A=
>=0A=
=0A=
Ups, you're right - re-verified it with a short test program=0A=
i'll just drop the third patch...=0A=
=0A=
Gru=DF=0A=
Johannes=0A=
=0A=
>=0A=
> Thanks,=0A=
> Thinh=0A=
>=0A=
> > +=0A=
> > +     if (!req->direction) /* OUT transfers */=0A=
> > +             return rem !=3D 0;=0A=
> >=0A=
> > -     return false;=0A=
> > +     return rem =3D=3D 0;=0A=
> >  }=0A=
> >=0A=
> >  /**=0A=
> >=0A=
> > --=0A=
> > 2.34.1=0A=
> >=0A=
> =
