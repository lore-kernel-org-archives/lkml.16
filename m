Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE4B21CA1D;
	Mon,  7 Jul 2025 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885372; cv=fail; b=tIpZ/fdBYgsVw7W7+McdnOIESV67cdTIbLzVrVyXXM2VANywsI+RHzIqby3x3hpbuc05WDkQXcF+1/gMWA6z/HhUMKtOV6wJzhzrx+OFACJKVg4CJwOnhD5pPQQSEAcF8W2kzwrcPzSQpGLSih/g1+quTzeJUaUVXS+IxKjaZig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885372; c=relaxed/simple;
	bh=Lx749txcijxcwsVJltJIXHXuCyXtLbtkYNCqdvN+eGo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K9GXOlLrUHi8tH4rRBKvWMcGFpLHGowpatkNnU4z7gSako1WZPU6qvg/1CyjrODWGHigKCJngy23BnEGAhmWH+/rvL4TBcxGoetwrHK21FAP/p02wJv00ZamZ0d3iNDKWqg7gY26tskE/jLso3YJWbTL5ZuSV/SQAKIWPi7EsSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m9LMdsYf; arc=fail smtp.client-ip=40.107.237.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m9LMdsYf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnyZU2OEBg+dRloH6bmNhgRxv0o9VR8KB929D1We6PBuNe8V6T0d2ppNyPQfVhDyXg7rNQc+io3jp/P+GvX+jOK5MQM54XJ8P80zP3R5Pp+NiLSI0Z45AHHa1zWhxkrmbIQ3kklv/TFQKdP7vq0Aehcd+8FS5jGMvINeBQujxLX4x4F+QwAH7B71XIflUvfAl6Bf+6DPBOHHkZDf5bx7WDko4miauNINKrkSyz2dFRIWXZ2em+cLtoa1j9VMClk14gMXTGdvkuzXCW5Gr7JOMmbbDJdAjp+Uz/33B0GadxADs14Jt04A67cY6w3ss5A+2rVkieBpLDVVAitPh3jJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFuTfg2TjB4905F6UcsAG6vCQr6m/XKqOW6oFBLZ9VQ=;
 b=qkVEEUwBv/O9zEk1Wb1M/pTML+fZeI66rgo3BJIVGoO8qmeI7Du/R4hwkCrVSX2Eylngs+3oH9wwdeV3bVSZCRwRKtKpDqS2XHAtayTWO4+CuqGrzz/0BIDBxlWmxmlSZNXQyzXaH+PvzKA9/of3XxwoCnU/8F3Uu+XdEc2wmL1HDv8LwdISOeNujc2nm+OJLa+w443izzYEYml91NCndnAPRyIAoUGV3sdYun+kH4WOzy5nyzroUZuOrY6l8XyIM6ICL4j9eLytdzJyKuwyjl/UovGdE7H1yHMQkytn5VbR/9qzCfm64KwNARfUHPmkidyA68iHZ9hA7n60kiVCpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFuTfg2TjB4905F6UcsAG6vCQr6m/XKqOW6oFBLZ9VQ=;
 b=m9LMdsYfPg8LSlp9dup9glAJ760DclyC8ZXDX5uuueWRQblk7N5bCIaQP7Anyi1lhEkIQg7pDv0drx75cfLJ+vcjALu4R6vmb28OdVwslRJ+sJnvVkE6z/+7cSqDuL0D94gJfmfdy3QBMA2z3UFGc4RHE+RJ8AaH2qe6pYyRSdE=
Received: from CH3PR12MB8726.namprd12.prod.outlook.com (2603:10b6:610:17b::15)
 by MN0PR12MB5930.namprd12.prod.outlook.com (2603:10b6:208:37d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Mon, 7 Jul
 2025 10:49:26 +0000
Received: from CH3PR12MB8726.namprd12.prod.outlook.com
 ([fe80::9532:640e:4b24:7dbe]) by CH3PR12MB8726.namprd12.prod.outlook.com
 ([fe80::9532:640e:4b24:7dbe%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 10:49:26 +0000
From: "Chary Chennoju, Srikanth" <srikanth.chary-chennoju@amd.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
	"m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>,
	"Chris.Wulff@biamp.com" <Chris.Wulff@biamp.com>, "tiwai@suse.de"
	<tiwai@suse.de>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kalluri,
 Punnaiah Choudary" <punnaiah.choudary.kalluri@amd.com>
Subject: RE: [PATCH 2/3] usb: gadget: f_sourcesink support for maxburst for
 bulk transfers
Thread-Topic: [PATCH 2/3] usb: gadget: f_sourcesink support for maxburst for
 bulk transfers
Thread-Index: AQHb7NiJoa/s1NjXRUqSEvUDsPz1zrQh+q0AgASDaHA=
Date: Mon, 7 Jul 2025 10:49:26 +0000
Message-ID:
 <CH3PR12MB872633800DDD386DCE8169B6B14FA@CH3PR12MB8726.namprd12.prod.outlook.com>
References: <20250704114013.3396795-1-srikanth.chary-chennoju@amd.com>
 <20250704114013.3396795-3-srikanth.chary-chennoju@amd.com>
 <cf2940e3-5430-4e84-916b-608c33028a7c@rowland.harvard.edu>
In-Reply-To: <cf2940e3-5430-4e84-916b-608c33028a7c@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-07T10:42:51.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR12MB8726:EE_|MN0PR12MB5930:EE_
x-ms-office365-filtering-correlation-id: 47d0ad71-d014-4e57-8309-08ddbd43f146
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?+/cJWCsWHE4LujD81pi89qcgABZYZsc7cxPMHTEpJo4LbQXr5+C/DVHLc2bY?=
 =?us-ascii?Q?kIuWLrxQ0mdZ5kCpI/bcHxSmRTVeSzs9O4SINvcwHOg69urIYyBiw2GhgkQL?=
 =?us-ascii?Q?j66RREvwlqgSaBT1lvlr+OOaFmd7rS9KxkM1t2spWloyq88rL/cW4Lu8nmRH?=
 =?us-ascii?Q?ZXIzewtwpE2hpW6z3uv/Km5i02YA0ZyoHKRq0t4aaI546kWB1thqWz8P39PO?=
 =?us-ascii?Q?6Hz9T07Ra/PU5KWM1o1PD0qeJIKpAlbYpz6mUFgyyqnCbInFPSf9p6+ZFtk1?=
 =?us-ascii?Q?bLNMO0PSNBx0nSeIEKoqFnPRwl96Bd1RCxzwJFKN7ZEN/x+n2RgwdfiUboS7?=
 =?us-ascii?Q?On/BbwbgHX7Pezh8SDjIXpMkMR+Ivoaeo/3rJLKH4oRYqK/TxT37VAGD2NZA?=
 =?us-ascii?Q?mP2FNoc1mpLYaAKht+jdQT4NL+DsoewuToJETC/yU3jlosMXbK4aF8sfnexn?=
 =?us-ascii?Q?JjZeGNYaoX3kA4yrVBXGpxqklmSn42MDLF+AWamzS8GrFPCVAN81O+80To4m?=
 =?us-ascii?Q?d80V4UvxHXOe8g/MNqqlKCnexbL3zL8va+Nhz228PhfF59bqgFUYl3TX+gjt?=
 =?us-ascii?Q?DVPeKCOl1XWB7lXfErXJ3z8y2femox3/bCe4fV8cJcCj7JMW7fqRZU543B8r?=
 =?us-ascii?Q?IiL743CY3nUY0wDiLf5pr7ouRl1gapQdhX5A1XsdO6VlhXxYbqWWi/dt3dSB?=
 =?us-ascii?Q?D7X+i0zf3IBYh7wwzq30xn3rS9DYPKIta2AfS3se5/GOScUz5he9xB6Ou0Bj?=
 =?us-ascii?Q?PUu3ba30rgdjITQZV/wYnsyjanmi4zznbOgfid9S0OUGm0xZ+PqSWhPaMbQz?=
 =?us-ascii?Q?X1VwPWURa7HMKRIuS42SRy0gSMdYvfd1rsgsdrYXmrzC/PhXIQPVgoYcCdmU?=
 =?us-ascii?Q?Zxvocn5ebnsqvHTSoY8nmTyrpsaMJTRtOvBqYPeUBa9j40CVQtI99HU93aum?=
 =?us-ascii?Q?E0BvfGFZrzibwTbqU4bjtKC60j+My2b+qkfHfWfIf9TEWnKZgYrdjTA65iaZ?=
 =?us-ascii?Q?UXX7G3+yQP6kA8hmq++bXukSAImhMhGE/WfUKacVyzzj/H3tVfTau2XQEE08?=
 =?us-ascii?Q?dLAB9E3oVMMMXOhclf8GoNBDAYRQK97kCeNMSlXiAADB5DIxIBWrJuoJwzEk?=
 =?us-ascii?Q?AW0+DQ6ZQfoFv7ofj9w85nGYL8A46OYutzW4aSPovSdXdHxsxYYo2ps8wNOf?=
 =?us-ascii?Q?NkPbn5VD+qCeG/1v+AGaJ36N9CVmLA4yynBfv+7jNDCPc+1bIgj6OVt/qS0G?=
 =?us-ascii?Q?QaFQBO/RZMhc7OmWeHjSYQY/DejOUlzTE9JKZ/WbtujcR+LlEBBg3pEII0EZ?=
 =?us-ascii?Q?XB6qGibpCg9lFssdwQbFQNQ8tPgQIQZ2ApxSiLzflBACZZPQnQItCxR5SiLi?=
 =?us-ascii?Q?teyFfwBjo2FOf+0b1DinMzJoUFvQ1f3BoqlyJ75PpzwcCGeMzOQLrdFFzYef?=
 =?us-ascii?Q?RmeieUHzJnWPZGtPYQiSRZ/BRfXjXqbqqSacngG8N8tjrcbYNGU0mxOyCcK2?=
 =?us-ascii?Q?nwHkGW72OLqezq4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KJBuOSdkTIJLQqw1aw09f2wfwsUEiXBe9EPwI6hKkeLYgnOQK4NTr6Q/FWSZ?=
 =?us-ascii?Q?P/Wit8eIV/A3cHgYBudPK/tAIi0YgQNxkEZiTOh8iGe3/L+hGBXHp/ambJjm?=
 =?us-ascii?Q?Sq+RmAcNkin61X9cZLOnJTVPtDpyL7PdF2RAENSOggyumGDnp/kE4DgHaxrL?=
 =?us-ascii?Q?JBTFzSyhxealw0VFGMdgb11SYDHMt+cGW2te4Jo81KvbOPpNbYZz2N397o5M?=
 =?us-ascii?Q?CB5xniACNJL5HBzh6OYsUePE58O4Za8/oXeEttk7lv05dBe4lnBoaQtOJwX3?=
 =?us-ascii?Q?2HKynUrytAolvke4tIzO8cEh4eXlyoHJVJ2/xVB4DosYhJQpKksJBW58DzG4?=
 =?us-ascii?Q?UY5Jao2Y11ly2VLTm+k/kSSRlmj+brfAM44Ly5txsV9GS32IySQPnFPSFsSm?=
 =?us-ascii?Q?67cmTzwgZUkNmdZq5NuGcH9AOCs4ZlU6KoKGy0NgZq4NeNdB4BRX+1tLoPtg?=
 =?us-ascii?Q?P6PEmryA1UI+IAPAVsPSxVMLAIyDDZeCeAEVtz9PDMmefqF/SaJUsSLRlKTh?=
 =?us-ascii?Q?5XG6yMPPsDb9uRAXjsLFBhtymQv+2llTG+srPKsVc6YuIMTcH3Y13tfpoJiv?=
 =?us-ascii?Q?dSZ1RoPzaNYRAm8o9/r5GY3Qh30ffM9XTRXHYgB1Lkba4tjMtinl2HvJUg3U?=
 =?us-ascii?Q?rkpjwWkQ8rrdb1tEGyo0wi5l11E3GARpP+oHi21CsxOeeTISWzTSaXjke+BD?=
 =?us-ascii?Q?BAhQHg/D3CJzpEwHs2KQS7vGEyPwSX5AaxlkBxloVbW+2zQryUUcxZCmvxfz?=
 =?us-ascii?Q?Ssta3xoLZeyNq1REfpyvNgKTQ2O3vBo4HnLj01Vo4xSNjPuCzKoWcO2pB+/k?=
 =?us-ascii?Q?XlcSrzzvaa63XGZnOK+WHUfs01e4jL9L3PLi03R0jXpn/jldOeBR1IjtyCAT?=
 =?us-ascii?Q?cdNWlNFfEXXigQtMAyZB438F0Jyr5N0Vjg8gGxBATHykEfvGqaDLJZU1ig92?=
 =?us-ascii?Q?Do60X5Rfakp2aIA8QtsUntAMAXcmG50Lbb/hgQMyQTaKJAadBdkvudVit2wS?=
 =?us-ascii?Q?VZ3/68Ne/XVesnHB8UfEV5YkHuCXRctrYkfSDmqAWafQeKUGYFXY6OcR9B38?=
 =?us-ascii?Q?3529hVSSXiUzafAESQ2d+gk71PqUW1KQnMMlvUWfIniuZl4Qd/YqHcGthFdZ?=
 =?us-ascii?Q?YkxlHcnSvqZ9kdkzesM50zs8D8rpsCumho3m5nXW/xBLh8uSe/YnzQusM1vC?=
 =?us-ascii?Q?gQi1/ZojkfjIMAXjtIaLdqLz9W38kz2c+SOJ0khIykq7PoAfLcaESqTKkFe1?=
 =?us-ascii?Q?7cOEDEu8vC+BHH5RHlRZkxqDpMiMo3ZL6Hh9x4lfC/rgC67527kuTaBmqcTt?=
 =?us-ascii?Q?UnmTTKB5Xg+79Gk7dIYe4IKfiCv7+52aWJ3fBL6bzaEIEMIwGXkzGDwa+sC3?=
 =?us-ascii?Q?ikuhEx24okGHgYiFJ+5bRSiF70YfwKgXlcAnnTVkWbNB+2yNcQf11oKYjCsu?=
 =?us-ascii?Q?9zkgXu8F3DLssuOt5xCI9dcBKx6n0H2EQF/qA48RlDVtsNOXkQFKLu5FnNjU?=
 =?us-ascii?Q?kQe9ZuBgrH5cHaufBVQEe/55YcjGYCScuhfehJep0iCUQ6uIrhnnnN3bWYNX?=
 =?us-ascii?Q?ic2NTtjeJtiFZjC0qGM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d0ad71-d014-4e57-8309-08ddbd43f146
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 10:49:26.4344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s4D9UMUPF5J5bTrZ2Iqk/be62HAd5AbrUXN1YEyw5G9FsIquvcuLJXPJcVbvR5CaDcRhPrIJce66Tn8lW5gNbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5930

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Stern,

Thanks for your comments. If you are mentioning to have a check for the val=
ue which user is providing, then there is a check which is carried out(#34 =
to #37 in the patch). It limits to max burst value if user exceeds the supp=
orted value.

Regards,
Srikanth

> -----Original Message-----
> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: Friday, July 4, 2025 7:18 PM
> To: Chary Chennoju, Srikanth <srikanth.chary-chennoju@amd.com>
> Cc: gregkh@linuxfoundation.org; Thinh.Nguyen@synopsys.com;
> m.grzeschik@pengutronix.de; Chris.Wulff@biamp.com; tiwai@suse.de; linux-
> usb@vger.kernel.org; linux-kernel@vger.kernel.org; Kalluri, Punnaiah
> Choudary <punnaiah.choudary.kalluri@amd.com>
> Subject: Re: [PATCH 2/3] usb: gadget: f_sourcesink support for maxburst f=
or
> bulk transfers
>
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>
>
> On Fri, Jul 04, 2025 at 05:10:12PM +0530, Srikanth Chary Chennoju wrote:
> > This patch supports bulk_maxburst. Without this change we are not able
> > to achieve performance for super speed plus device.
> > Without this fix, we confirmed through lecroy that it is sending
> > packets with NumP always equal to 1.
> >
> > Signed-off-by: Srikanth Chary Chennoju
> > <srikanth.chary-chennoju@amd.com>
> > ---
> >  drivers/usb/gadget/function/f_sourcesink.c | 14 ++++++++++++++
> >  drivers/usb/gadget/function/g_zero.h       |  2 ++
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/function/f_sourcesink.c
> > b/drivers/usb/gadget/function/f_sourcesink.c
> > index ec5fd25020fd..84f3b3bc7669 100644
> > --- a/drivers/usb/gadget/function/f_sourcesink.c
> > +++ b/drivers/usb/gadget/function/f_sourcesink.c
>
> > @@ -341,6 +346,14 @@ sourcesink_bind(struct usb_configuration *c,
> struct usb_function *f)
> >       if (!ss->out_ep)
> >               goto autoconf_fail;
> >
> > +     /*
> > +      * Fill in the SS bulk descriptors from the module parameters.
> > +      * We assume that the user knows what they are doing and won't
> > +      * give parameters that their UDC doesn't support.
> > +      */
>
> That's not such a great assumption; people make mistakes like this quite =
a lot.
> If checking and adjusting the parameters isn't terribly difficult, you sh=
ould do
> it.
>
> Alan Stern
