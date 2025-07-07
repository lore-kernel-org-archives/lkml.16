Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2737083C;
	Mon,  7 Jul 2025 14:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751896893; cv=fail; b=uCvD/isSkaKnHji8x9jQEmt7Rh2BN6JP0RJfCdd7Dj4MtgKkxNESlKy/ffdHWhyl1u7wQWF1kp+JREWejAySujWYuEi1VsFkH5nO2GDb+Wr2AgJgnhBE13rm+Z2kjo9jRCzu0ckyzfqX0LSjyh+90x9CaoMWECaZvc+i4dCI33U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751896893; c=relaxed/simple;
	bh=70MZ2S520J+GCyCStlhNhMHAf2dUwDdTejp3N6gibYc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aY/Bjft50Jx5jDsTdhl6XOxcPR2DlM0XFc/2/M2uBP0gRCs6pgMpg9oSRb4931uXztETme8/vuKA3+NIYH9H1mO0LNHugeoZoaaDiRp8xebqq8ghxWVlBQ18jPFUZUBrFFhzOW4uV4jIQMDS5Z4N7MUP+lW05iMWemNF+Lzt+rA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2Xzcc9vU; arc=fail smtp.client-ip=40.107.92.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2Xzcc9vU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8a1oeIPKTHLiUKeWn/bkTcqzpYJD34tU0oPRP20r7I/L1gYwy1uQDEKjF0pMku0AhXopMkUTLwFtbdF0ghU+cTZG653YHh6jVmmcl6VJKJBDa7sb8Wd64VID7NcnHVtR4gE7wg4Pple00c6miplS6A8M4WwQcVb9d7tSwCWONqIVO4YjXUPfcOXfXygAsdfi8ISg414B9oBj/gMlar+ChweeKXJ9naI6Ev6Hz76X2v0oNSEtVjtHGceV/6tyfPxOm8wFApMQd4xZGIXzfEjRHLV06OhHDgmS0ZSkL1+bq4GbUMdOiiywI6nTnTUdmCouuNPd8aE+IrO86EsEJFv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAJm77H+jnV9Izq+qVZvcfF8Hv1z+wVniGrrkGaK624=;
 b=ktfkYjDQJvWcZJ4w1ghVG/gK18jQvgv9/9ObnTpicKySBOB/MvbNb89PQCpLm9/crZxd3hkPDmz82Ki1hRPC+51kBi/K9DktDiYWLDhONXhamx0ZxTnrlaWRz9gJx1I9PVjZVX2+QsEMh21YFvugFF2t/aIhFBcKBGJ4TFnCczkXFoPHCDH0tuLwofwlH2tOXassePbZPnjG9K7HolukxXA3LLU6Nr/PSqtVM/q2z68WIDrSXe2/rM0S5HOukCfZLRoSJETwvh8LkrB7ZzOhm9r2GKnHoIV09DzgOR0t7NPu7f891d3Fni/ZuK5QAHvYuUSbI3yjDaqwsMMaafOHFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAJm77H+jnV9Izq+qVZvcfF8Hv1z+wVniGrrkGaK624=;
 b=2Xzcc9vUZdLRvSdrf7H0BVslCV89LMi2UqvXyKiHmkTaxzxsv4GuF9NTA88Kca+EgjHaSEijlhkW7cWQMyqtWc3BI+Ut7qrAcyFyMVwX9vhFXaOMNHeLu0Ve3vkiDRKM69XOXM4OUN+5keo2+2bVoNBAhSp3swpOfiMDV6fK4aM=
Received: from CH3PR12MB8726.namprd12.prod.outlook.com (2603:10b6:610:17b::15)
 by CY1PR12MB9626.namprd12.prod.outlook.com (2603:10b6:930:106::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Mon, 7 Jul
 2025 14:01:21 +0000
Received: from CH3PR12MB8726.namprd12.prod.outlook.com
 ([fe80::9532:640e:4b24:7dbe]) by CH3PR12MB8726.namprd12.prod.outlook.com
 ([fe80::9532:640e:4b24:7dbe%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 14:01:20 +0000
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
Thread-Index: AQHb7NiJoa/s1NjXRUqSEvUDsPz1zrQh+q0AgASDaHCAADL2gIAAAz+w
Date: Mon, 7 Jul 2025 14:01:20 +0000
Message-ID:
 <CH3PR12MB8726F8F10AE2094B5E94861AB14FA@CH3PR12MB8726.namprd12.prod.outlook.com>
References: <20250704114013.3396795-1-srikanth.chary-chennoju@amd.com>
 <20250704114013.3396795-3-srikanth.chary-chennoju@amd.com>
 <cf2940e3-5430-4e84-916b-608c33028a7c@rowland.harvard.edu>
 <CH3PR12MB872633800DDD386DCE8169B6B14FA@CH3PR12MB8726.namprd12.prod.outlook.com>
 <e5f4942f-4a0d-44a6-a2b2-7d567d4d0ddc@rowland.harvard.edu>
In-Reply-To: <e5f4942f-4a0d-44a6-a2b2-7d567d4d0ddc@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-07T13:56:52.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR12MB8726:EE_|CY1PR12MB9626:EE_
x-ms-office365-filtering-correlation-id: bcb6e69d-6e03-4984-6452-08ddbd5ec031
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?reOaGzIiEz2YOQLJr4hkWQGg1IqBIlLTW1Do1sLfL/fctnRT6wBGNEKcs/+z?=
 =?us-ascii?Q?VUpqq/dRsnSJ1W2a0tuc/5AxoR38AtcB0GeisuLhLlbz13HTi7KprXttXyod?=
 =?us-ascii?Q?GK2x6mYifg7BElMpuWrQTg5nsHiwWggEOGfDMsnrwG+FQNpL9bk5U4ZVwvEF?=
 =?us-ascii?Q?kQgoADiL8Z1uilxzusdKoPpE7UmYGawd4I7x2h/sKA/udxek8YtDMYpsFUWG?=
 =?us-ascii?Q?ORLhW5di4cQ9Vwdg6+MiAVv1RoUThY/fVvm1NrOdnakbcPQPurbRu+N9bi+C?=
 =?us-ascii?Q?0ZL+Uwwc8i1Kxxq2sG2d0zcGW7t9PvGcyTj2iMPcPwsYxoIfV2L7JOvqkTfl?=
 =?us-ascii?Q?qlgfvNBuVSVusJR3j9QAkAJjA5VjfHPu+sXJUyHJpHJ9YX5Db4Z8P52c/D2N?=
 =?us-ascii?Q?++bxwBgkdOne6sRxDEQzqcZXotz6nPrF137+BojteDXGFJ4SzKL+twMRyCLb?=
 =?us-ascii?Q?dhvxUq2G27BLYU2X/XS7zQBTntk0pZAnLFxAM7dIxFg6V8KDTF544O7mkR0S?=
 =?us-ascii?Q?qS0MzhGXXa/Ce1v1xvIfHOuS6+u4iwWrFqiWrW1whgi0yX+Jy7EZ68dC5xDW?=
 =?us-ascii?Q?wYMYJmwawCmQyehz0I4iuksT2OWI1oww8ztrRAfC4Nq+IeCqhVRTJE3Dl/eG?=
 =?us-ascii?Q?wpyLT9hC1et0IiSg+u7VuJa0ruBvgdv4kkfuEqN3QXwKmKNzyBfUiamq2cw9?=
 =?us-ascii?Q?q/aefvQjQYj3cjRQCmUzfSD7YUP7PWMLpkjX+iRDTIew8jjhVcG4dRoTr1tt?=
 =?us-ascii?Q?gqPkfLMGQPShIUanE8OoAFVZexLzGdNwATHncb3/UlKLliP8G9LFdtpUolaQ?=
 =?us-ascii?Q?Qq6e4m+LP/8XxW4vZl8EazKzcVlxjpfJpu3bUcdmipvmCnQs3Efic8qq9sVH?=
 =?us-ascii?Q?IiyOYiGLRhDzJnfV9syAUMyuuELBmZWIFbuaOkFCpK1MUEpEj5+7x4yUw6hG?=
 =?us-ascii?Q?j8e1BAuRbaH9ScIthMqgBrnQqYHkKI1B06ZK6NPWtk2fMhedQZafxgg6MWil?=
 =?us-ascii?Q?R6b9orVI9sVQexrdjHxvWwvpIddw23/35pJRnQl7zp953JbwK0X24rjxE+Ik?=
 =?us-ascii?Q?uLCTstslv42GwYKHI3ZgF5YI13qnGVnlPtgJPK8RnCk+sZXxWM/ob066AxT7?=
 =?us-ascii?Q?uypXTxSWFVxNlZC2FV8nLJc2M1r1UiFDq7lfZrynYZVHCksSBdb+V3c48jIr?=
 =?us-ascii?Q?PrC6zTxDtefY/mLKSjk3XAX63lshJuU3Q9n/mFTlgOnNmiWsqGpb2horLup2?=
 =?us-ascii?Q?h3vpbchC7XfybXWWlHpGpUxZPYco+3OK3SEPpQEHXsZWPWGKCK6smu30uEyV?=
 =?us-ascii?Q?7U4RqzA1YKKCvQaoMEEov3c3HEprGp9TYEE0MrlXWuK0CaDitA0smz75nWP9?=
 =?us-ascii?Q?6Uu7llHobymz60GqJeBMYFdWzEUmC09VIaJ30GhmUGU5KVJu8kFJSsbD16Fy?=
 =?us-ascii?Q?j0/td5fi50/cz8JTQLjbFEfupAqHA+WCY6BMvJgvRaCyU7xjz1bPhs9HtfXb?=
 =?us-ascii?Q?YoDJcPM/I/kZV4w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Tzt/gu2SY6GRz6o5sicaoonZj4gjj66iWWZ4/ZqQjFfiisuAjgAKQEa++hHU?=
 =?us-ascii?Q?5k+BLKH9KqnG1bZCrjiPxWsLZqADTIDo5PfV+BCZxNkkLImFR5efJU18MYz7?=
 =?us-ascii?Q?KTDhBgZerfk7youbd45dcexmdpd3ATfZ3X/rt51SUyAtafqOP9Y5ccUQDfDG?=
 =?us-ascii?Q?S1iLj6aEqhiUxVzDT983iquCSH5aRenN5RhtUbCjpK7v2G43ftnChYR23kL7?=
 =?us-ascii?Q?C7/j+IqWVC+cAu2vNFA/wwurSSQhQFQM4XK/A4wYrDkMPtm4HAynMw3TCBwB?=
 =?us-ascii?Q?kvvlQlM720LM5jcHrS+wIdGkitiDf6tKAZjrYuxekF8tDUpFkpPCHw1pCXC+?=
 =?us-ascii?Q?5iQvmeH6zbOxAJepca++1EXf/nRxo1c0DduV8K3C3ZR6MxoRrt4CDf5F+eKf?=
 =?us-ascii?Q?YN8p6SIux8aDWlYHHMO8RmSvziG4IIUgQQ52VJr7belFz7qypul40U9UGKTy?=
 =?us-ascii?Q?9tHyrVHuKlPdxArRiEXeYMJZ3cwAtfiag4q4bP1A9uHTMihQMa6dptrkh+hA?=
 =?us-ascii?Q?T0LRwsUV4OEdKrEcUCv5TIuBnvX8o89rtDjcfMG8gU4lxZDxRN9etWcRPpTn?=
 =?us-ascii?Q?pjR6bZqzureAGU1KL+sGQnkyKFx3/Ak0TBZUOtTOo94Zn2Rs8gUmudWT6517?=
 =?us-ascii?Q?BtzfdSThVqeYEidRMY+/YLd4WDumZQj7QnPgjoEuiQgVyR6a2N5F49UhceyE?=
 =?us-ascii?Q?7gzmK3zMapfU+Xe016ZjdtWMTeAXjNxfuWKN0oHNOgC9z1OmPa6wKD/3Yb6V?=
 =?us-ascii?Q?DVWjeseRnU0lfgcqT1AwQRuFSWKQkqAoMBVnHh5zN6n47f8en56Nct6yAiSO?=
 =?us-ascii?Q?nFPm+L5QuQkcLDBhpIQDS3ZWnx8zpVhhF6nx6fuByvCEm1iTmhII4CLQQdfJ?=
 =?us-ascii?Q?S1KmhP8oWggrfeeBh63Q9mCIsUgSO0UOwktU7H+hqza+v97+vcarX9FbbL3F?=
 =?us-ascii?Q?Uy+ORoTm4SZ9A+qTduoQXu1aGEjGaTF4QYgDCUl9SIQDrMhCFTgyUMwKrZc9?=
 =?us-ascii?Q?T5H1uLJhnsxG/FJK/R9o40knUhF4fiHM7woHjlCYWYtAMP1V1Uql99GMPQnM?=
 =?us-ascii?Q?oEJoo3Hz5crrKGg+Yb4xI+cm47EMestMwl8hONdi36cdTqrJaNjp9jSZqIUV?=
 =?us-ascii?Q?UeQ0j9VKTXw53gd8ihju6WAgusQXerGUNsNf4Z5lclZ9IQ/A8ImqFUcP7aSg?=
 =?us-ascii?Q?NxUqpPkfjOQYauctCSRbHXWq3q2fQ7La5EmWfgUtKHM13ZxL7fORRyshigSo?=
 =?us-ascii?Q?7ThlodAfdPcuw3is69PhrW12M4Zq+4RJh9odWieWhWp9pfvD0wtzD5jlSP1o?=
 =?us-ascii?Q?sMX37a0K0MEyki9Anv7/ynTz95FmFd0dpTPP3xlxCXL3ZlCC5LdcIyJHBHMT?=
 =?us-ascii?Q?gDMgzIwMBMmyCaRZYKHZR62sTpyp8kXgXSjGbAYzjBK2fIko5111Cm2GHgQL?=
 =?us-ascii?Q?lyORbh1VZltndmeLV1FleyTwSUudX7AmWMbUgXh2C6ocvG1iUKFCaawL99wh?=
 =?us-ascii?Q?PWHH3RBMHW9nqtG2BbHw137nI4zvItikxSyLrhZKraO9y7VJfLqbe6v/ZH0T?=
 =?us-ascii?Q?6+l/vhtOjSQ6m438e3g=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb6e69d-6e03-4984-6452-08ddbd5ec031
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 14:01:20.5156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HSt2b08CwmeIYl8ZtQyoitMu61pJ2P8X5iVjblyj4FZBeS7jcmoO3V605qk3iIBh5UXtAK9EFC3FMGXVJ6b1mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9626

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Stern,

Agreed. I can remove the comment as I have added the check for the value ba=
sed on user input.

Regards,
Srikanth

> -----Original Message-----
> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: Monday, July 7, 2025 7:15 PM
> To: Chary Chennoju, Srikanth <srikanth.chary-chennoju@amd.com>
> Cc: gregkh@linuxfoundation.org; Thinh.Nguyen@synopsys.com;
> m.grzeschik@pengutronix.de; Chris.Wulff@biamp.com; tiwai@suse.de; linux-
> usb@vger.kernel.org; linux-kernel@vger.kernel.org; Kalluri, Punnaiah
> Choudary <punnaiah.choudary.kalluri@amd.com>
> Subject: Re: [PATCH 2/3] usb: gadget: f_sourcesink support for maxburst f=
or
> bulk transfers
>
> Caution: This message originated from an External Source. Use proper
> caution when opening attachments, clicking links, or responding.
>
>
> On Mon, Jul 07, 2025 at 10:49:26AM +0000, Chary Chennoju, Srikanth wrote:
> > [AMD Official Use Only - AMD Internal Distribution Only]
> >
> > Hi Stern,
> >
> > Thanks for your comments. If you are mentioning to have a check for the
> value which user is providing, then there is a check which is carried out=
(#34
> to #37 in the patch). It limits to max burst value if user exceeds the su=
pported
> value.
>
> > > > +     /*
> > > > +      * Fill in the SS bulk descriptors from the module parameters=
.
> > > > +      * We assume that the user knows what they are doing and won'=
t
> > > > +      * give parameters that their UDC doesn't support.
> > > > +      */
>
> In that case this comment is wrong, isn't it?  You don't assume that the =
user
> knows what they are doing; you do check and limit the value to maxburst i=
f
> the user's value is too big.
>
> Alan Stern
