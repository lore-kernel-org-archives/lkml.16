Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E320152787
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 19:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738351918; cv=fail; b=GCC2hQZDV71usct8KhqzPeAfEekJzTkIz/htA7DqpQ3u0JvnMHX/DvIJe8yTKi/Sg9gfGLjRUV0Gyi25jNw3RK1+nkPhdTWCyerUB8jd1P1fMs2k7yzPcX3hq5uho/zdSQWN4HhokyAhqSpOhcAxkPpWdcgYtVifiHyb1yOUytg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738351918; c=relaxed/simple;
	bh=QcwgCI7BrCZcU2Bw7hw4tgtS1NO7gU7s12NoED4ve7E=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n8LwEnmEB1xA2ZuXRnGXlUA5q96qbHYE71GzLDwrr0FIMDk6C73y+n+83vSNVw1+9XINdd0L6XjQ954do4eO5bSgdiN/wQcfII5joeAdmBkn/nCm1ymgbLi/7bQBQLJ6W+8oIFLGQRl8EfVTyrmz4FaC3Hb5mXG2NlsMFZqDgHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hza27oVY; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hza27oVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738351918; x=1769887918;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=QcwgCI7BrCZcU2Bw7hw4tgtS1NO7gU7s12NoED4ve7E=;
  b=Hza27oVYITk0TMdY5iYFDumJlDmcOdQoLoelz9PcbGg6+7g0LPtV6/mH
   32CYfkXX5HhKf84IG1rNClswOAgGO67sdYOFTFvbk/Gv32og6JBCv1CxO
   vEFgozQUzvrKw1pagu32chmVz4HnzP5qFeb9PWaFPg+gFuflu6QDnTpyQ
   cxDEUomxRPecf5Zp2oC7AL4m1njXs14PEtzGDngAMnm9nMDfI053mbYO/
   x4ppdftXuG9/flifobziXP9f2T4wXGN/Obkcg//ltE0Fn5bWqOmciAj5r
   1fsEtYxTBo3Pqe0tt7Q0mvJNul3n3a5WGdt0tyzEPkHX620OdgXsfNmNQ
   w==;
X-CSE-ConnectionGUID: IknAm7VyQbC9J8cGDGF7xQ==
X-CSE-MsgGUID: Dxd8k+6WT1e+5nAS7uI0wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="56356208"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="56356208"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 11:31:57 -0800
X-CSE-ConnectionGUID: 0CqRezk+RCOkimC1FKvLQg==
X-CSE-MsgGUID: iWk9MfSBSJG37/3i1cf2Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="114708288"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Jan 2025 11:31:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 11:31:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 11:31:55 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 11:31:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkzS0FWOcIkudMZXfcQ4X0diteVJNkBAXLD6GzCjyd1lbgOtZEYzeSkLZQJh96724IZTzyIJi0be2P8Hq2HEkc5Dqgm2E62emRQP+gMH/be2HNyTWhVYs5Yzt41BeUUt+b35K6qB4EmU6ppblo5VcdI9KnuKw6z3n7W0VU/PCYDvJBBZmZL7BtvtGN68uZVHgBl0shXeGSmj5DxqDXKexmN8RgYutesjVS8K8olpRTMwWw4/XF4wVml8Ay7csa5p3nr5LXI6D69cYZmIqeZjIcxeouYKVG3gYystDJIyQLYk11R3jAnCWtnBJwvJcAxo7QsK8NUrA1cOQqbo6NHnWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8nC0KHLhMgjWTV0bSTdLhiLnbPSlwNcUfJ9xtIm260=;
 b=Pr84BcDZJ8fuyiiUm4LSpovYydv6ujUebNHCblcSX2H/oLqGcaeuoHWkvnDnyG6LOCRFGUrBnDxdJtv/04BaQj3PstGGudX248y0OjPP3qPXwilk20O33bim8Hc/ImXQyJ5oW23OR/U+nz+kacCzCeXoNx0GHu0U4+BHZPFs0IS0+qyx8bdTNHKzLNwWrTkirHAa604S+74eEHblYlWXXJ3b10nZ3H2blDCOtCCGJA3hReKRBwRLfrZxtHBcpnS7xmKFn56hRFsBJF1v472vI3UBMIkofOydPAQrt7boT9/hngnYOIYWPQisn4jFthFOu+A+ztsvJiy7rqI/AhmT0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by LV1PR11MB8843.namprd11.prod.outlook.com (2603:10b6:408:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 19:31:52 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 19:31:52 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Yu, Fenghua" <fenghua.yu@intel.com>, "Chatre, Reinette"
	<reinette.chatre@intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, H Peter Anvin <hpa@zytor.com>, x86
	<x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] MAINTAINERS: Change maintainer for RDT 
Thread-Topic: [PATCH] MAINTAINERS: Change maintainer for RDT 
Thread-Index: AQHbdBNryCs4FallhkuEvrqfvTVa07MxRQ8g
Date: Fri, 31 Jan 2025 19:31:52 +0000
Message-ID: <SJ1PR11MB6083EBC221533C7532258ACDFCE82@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20250131190731.3981085-1-fenghua.yu@intel.com>
In-Reply-To: <20250131190731.3981085-1-fenghua.yu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|LV1PR11MB8843:EE_
x-ms-office365-filtering-correlation-id: 41ea6965-6454-4fd1-2f49-08dd422dea21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?us-ascii?Q?AyN7yYzCcuAVuy0acwMOeb5syyM6Qu6nJ2KQR4YB5QVcEBApekOJM6v9qWLG?=
 =?us-ascii?Q?H+2rH+sjarZ75AvwLAbIZ4XTe/C9QXiGukSAeMITFrmWWP99o30xz4GQ+8w5?=
 =?us-ascii?Q?hq5A2x9lxD+wEP5lLIJ7aZJimUUV4ysxt1qm3quVhmxfAaX9M4VpXrJuJoHH?=
 =?us-ascii?Q?LX5abGZ3UUL2mCM3Zk5zWLjvqObZpUAViES4u1NCnljaAZIoP/JjS++mBIV+?=
 =?us-ascii?Q?C6B8PseLHPgzP97XQ5RslfdWl3pEE7FVCxcGAq6zMAUJWSIB/noLIHz/vI6k?=
 =?us-ascii?Q?2DM790waDnW5R8AFF1m7jQiVfuG/seoYq3TsJx3MRo052hboVochqlIC9/Wb?=
 =?us-ascii?Q?RBJgTgMD/ngQWHMBD77VrQ5NjqiecrkB2fSsYyL6LJKp8zEANcqCQQin2Br3?=
 =?us-ascii?Q?C9nnTq+7ZvhIyAEMKVFF2xNFctkeFEldudlk0KohZyFqIJvU8wwcu4+1yEoC?=
 =?us-ascii?Q?/ADn1WOE/CwmmMV+uTpcOnTZmSUB4xl0yMdr7skwdXiiz3E0kpDT6597Eswl?=
 =?us-ascii?Q?ptLmEHkRAA32sKg+cLQ46KUHPrOn90cEGuttXd3bW2MHmJzFo/YpA5OqS7TT?=
 =?us-ascii?Q?uhLODipUmYHu52rFYEBP9ODv+I204EF90w8NxyxZFYhv5J7eFu83rwGHAX6U?=
 =?us-ascii?Q?Vc/cfwLDl0WQE+Rs7vWA3xSs+QoHXUQ6b3H5bQnu2YLNne7LMhJmFSxUgtr/?=
 =?us-ascii?Q?9hdtv3cpSUFzfRzLeavT5Eg+hklO/d0QsCHIJrenpJ6Yi3zzzDaCAjPynmf9?=
 =?us-ascii?Q?SUgbvKnP0vHx16KkRbEtMyUNr9N74UzmQHh9+HDMPjuB0EM2fwYrpvDTXy0z?=
 =?us-ascii?Q?uSSE12Ck+KH6YRb2wawAVjTMwoTu1NLkeKTfgQS41rH88yXQD7DR6EfnJ334?=
 =?us-ascii?Q?ORLaSG9i1+UAH+kpRGk1rDj7udRRtkIcUxIQitnJFYMWMccM/y4CHZtUPxYz?=
 =?us-ascii?Q?UzYUZ6rR1FN1dbFVVhlIW94XfDtViuk8x5RZak4njF+NItAu1BAwS3PQUOFT?=
 =?us-ascii?Q?4TBFWc6cceDEZF3c3tbjZYKy75lq+Ay9k2vY/+hf1UbUSX0Mho2xWH3ub3qX?=
 =?us-ascii?Q?aU7HzBQETH/rWJtno8aVaWUiKCrOSMLl3NzqBvZZPafHpWFE4lJMdd2Pi2iz?=
 =?us-ascii?Q?lIbXRF2gZ7IR7CPvFQNARqRqZIKdARV6vLjoL8saQ4ANWiZbD1ucf93fhTYV?=
 =?us-ascii?Q?u3ckPG6M4tJT9E1Q/vle1pD23cQA98TDBMlq6SnoMYFVQyoL96KqTAHBnMOr?=
 =?us-ascii?Q?58KtIRgLrdIrVJVm+17sC3LMa1g5K8eaCGVoRPcx4DFtkLRq2Un6qbLSTkVl?=
 =?us-ascii?Q?U1UcVkCFKIWGuBHgyb29KjTnwYBWN3Uhh07yYUAAoUpq/lfNnEAh7C1+Gbpp?=
 =?us-ascii?Q?0JF6/K36uE5+tetG+ZHeOJPsbNC6aRsQePsrbFWRbEpORfAXRewOfZQwx6oY?=
 =?us-ascii?Q?Umu06/Yg/UIiybVAFzCqKB7llXW4zIHQ4m0tSjvsH7uL8FDVsfm1Ug=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8qQ1uUO/GBa5h+Vicvk4x3VxjqiDaViAuqzRnpc+ODaguOiUNjLtHyYynKRp?=
 =?us-ascii?Q?atliQvTmQeWeVOeJ/QBfkGnp5nUYx7T4SOtbKKYWJzKdbXxd7dRcMkeWdkHq?=
 =?us-ascii?Q?VXVwltM+SLWGh8Dj6oqcM5RJG9U9GMT/s/o/udpNMMhTMBCT+hkX1ACyYgko?=
 =?us-ascii?Q?ELf3Umu1RUoHxKOxJH0NXLtu0MXHEeNi6fEZ/i6wPtyE6NLda/PAKAkEvESj?=
 =?us-ascii?Q?f/q7ivDumc3BqZS1toGDh0TUU4iA7Rpg2ts1w7BoYr7WKvaRygnUEF/tF4q3?=
 =?us-ascii?Q?26YEgh1JNbhPeFINsHGXRaL+ciS6beR08PQieeMLh5H1GXNtszLm3Qn1szGL?=
 =?us-ascii?Q?9LkesblM/jLifHz7F8unOeZG31/gLgu+YZFFUpIXu33K7D3gO7U4rp8TJ+77?=
 =?us-ascii?Q?UuDrAO13vAbQefbhebQj99EIjr4e/PKAHJvISnaIVOH1qUFISOtYEG2A+k3t?=
 =?us-ascii?Q?T+yUDxeJqxiUXxBgsbWbvsteDESY9caHxsevVOHnFn6/L8z72Rhh9Turr7TM?=
 =?us-ascii?Q?bb9+thtqUavH0H+Y318Juutlipr46KacZMhfPTPM85zBr9WdvCnHRcqSttSd?=
 =?us-ascii?Q?wEKXcN2CT3arRs62H0qYLa+6IxPcUzjOoWHQo3UN05hb3PMe2g4ifWZJ6U9/?=
 =?us-ascii?Q?AWLrAvjPZJQs2qEDXWr0IymuKsn0D0NGF4TxaSfoxUGIh6AjL+b64N7gHOId?=
 =?us-ascii?Q?2h3sHAZN9CYn1i9+sWhK0jz8SSewi9HrDcBTRd1h8eAeQqTCM2iL25BLFO8R?=
 =?us-ascii?Q?kvx1e/R2pcakCrSSgUes1LmlZfQTg5zIY5rj0OuhxTzzY223kPfDkEQyQjcH?=
 =?us-ascii?Q?PbEJ0xCRjw06uG8aLcG3jX8gcZki3wrxBIeHdKi3Ky+L98pREiZaFV9s47EB?=
 =?us-ascii?Q?O8jCUbxKWWHg/Usr2ETNCNCyVGb6lwbtpQALAV7Nj6HKD14vD03cSYydRGZ1?=
 =?us-ascii?Q?46u3CnWQXPzEfJbIcGY1MUdk6MYACmt+oGb69XgiPzjHEztwzEXFaTdnjB7R?=
 =?us-ascii?Q?1kFAQzttiYxt2abdhXlF8G0RiFcaSKVFIOvdVMeG4vic1hXwA7kFOE9Ib56N?=
 =?us-ascii?Q?lOgvQu8slVu3JzRsRYOVFDJhYkBTAQRATiHDYLXOoIPwmahABQ0FSpUMippS?=
 =?us-ascii?Q?oDGECadHuSnNZjan3ctDTYXHycLT8amRTepo8VNfOpvDXaMnHJiQ7nQyi44u?=
 =?us-ascii?Q?E6mZS7tmIFoLWZrpS7XyGZ8553iCGSumqQSOFmmamEEKGMIH8dFGDQzr70eD?=
 =?us-ascii?Q?7+zxIkf4QutVUudJYqm+XfQTj6lX50SmI16jAyHDB9wAzEyv05Xus6UbZjAG?=
 =?us-ascii?Q?M4iD4idASP3Wtz5Kx8fBVuaXENp9BRXGx0/URSCLAWGz5D4qlEOzl2FO2UQl?=
 =?us-ascii?Q?tbvQjf/WxrVmO0ecYsriqZpSgW7FbUKellsJGk0Xd+1OjC6dQliMOKknxhRO?=
 =?us-ascii?Q?FnBg89UoAoHpP/ID9+XKN/Cn2CkOPjcQ1wU2fRguSg0pb6prC9ioQsFg9yPQ?=
 =?us-ascii?Q?GvVjlCCgtX4kad/u+Ma5+qY47SAyV/JsWijcreQ7ToeH0ixYXltRKwUX5nI+?=
 =?us-ascii?Q?DOLK5AcfFmqTINj2UyBGam+/lzJ+PBEeYFy3aSEP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ea6965-6454-4fd1-2f49-08dd422dea21
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 19:31:52.5314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cWHdr6ERsVNxXHnjMLuKhSOac59FM+PHB9XPr2sefx4wMefHOWTbS7BKS/HQrcCm+m2DIbjo2UWgW6Ofn+0g+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8843
X-OriginatorOrg: intel.com

> Due to job transition, I am stepping down as RDT maintainer.
> Add Tony as a co-maintainer.
>
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 08ce00b6c1f3..427779715756 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19822,7 +19822,7 @@ F:    net/rds/
>  F:   tools/testing/selftests/net/rds/
>
>  RDT - RESOURCE ALLOCATION
> -M:   Fenghua Yu <fenghua.yu@intel.com>
> +M:   Tony Luck <tony.luck@intel.com>
>  M:   Reinette Chatre <reinette.chatre@intel.com>
>  L:   linux-kernel@vger.kernel.org
>  S:   Supported

Acked-by: Tony Luck <tony.luck@intel.com>

-Tony
