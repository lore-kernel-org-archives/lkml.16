Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E77083A
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746134634; cv=fail; b=U+Iyee7lSk0qNHoUSVaRGMD7XxiS3TakZDLYV1G4t2VGxm0GsdSAy4TaGCb638MN+Upe7b2zIaVZCZ/YpErxret77MKkvtX3mXEShN7YicoDwbjo5e0af9ESwZzgJvmtKhVr2g8Wub/XtXymcluFAxFsMFp/f2vLMvK4bFRmvOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746134634; c=relaxed/simple;
	bh=Xh3D4w8d00SFMtDZCmx+Jy0hruT7gRG1VTjBzFGJ1ZI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SjWS7dGt+WV9uaXc8b0nwin8yUqEPIwr/QUUvuDbl8ajb8AKmBDWbu4UD+Zy92Ve8ARv29shNziMYlCPMMUz+Aom2XWB5plYkLcvOjK8swZ/sfdXffNHKeKTm7g3MCWfRMxo0d7hTzEY/6e5XkVUmCdrhyDnVxTpwzSUu5MoVGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUS+42v9; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUS+42v9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746134633; x=1777670633;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Xh3D4w8d00SFMtDZCmx+Jy0hruT7gRG1VTjBzFGJ1ZI=;
  b=RUS+42v9UEU3qysjKgjrqjpdPldr7FYjZCRokUctzP7D8qqcyiY7eNv5
   19FmZRR6bcMdJT91PQ14gZInyucyjbgEY1jyJFTbEPo+F4rIhWDe/tYF3
   voHblpqFFvfGcjUxF5fJDGTlERHflBq8RQROQ3XeL8udzvkjWmVQoP/zV
   e5QeOX/v2JAFPDXNrn4vs4G67cV/btgWEyuPbEahE/1Ov6BFHM2dsEXXE
   1zSSpc598YEttTsWR1CtyFe3uukVevcI36gnF+QxYYQK34ye2pJpIxU/0
   1XfhVRqS/Ovjgb/OHB5aldM9EM16Yk22lO5fR45LoJ4HFTfO4xJ87brYG
   g==;
X-CSE-ConnectionGUID: QojxNWR2SI6GSY3v70J2XQ==
X-CSE-MsgGUID: a9lowLwKQHWqK2PTiaLoug==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58026191"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="58026191"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 14:23:49 -0700
X-CSE-ConnectionGUID: 3qSGbix0T7iQ6/zj3j/Maw==
X-CSE-MsgGUID: 9DMAjTuuQnqcLKTvEExp0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134379520"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 14:23:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 14:23:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 14:23:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 14:23:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2Xlf/GZ2kGbQWD2k47m4eG9gwpYZAT8bFJ3HOAYTbhkUVHM0Xyk1bXTLIxJyT0Racd+MqWjoWV5xS45gA3I1WoOqL8t4s9+djO0HklNU2h6v/gIl9WmnsJg0kg45BfoQw/o2ajnq4emCVk48zX8Oh/V99+oOpcK1FRqqWqhuuO3+PFpy54gAi7cTc/i0y7jD9spqcI2p51dfcbnSArvKtmhr2ldHdw8HhcVP4rFDnulcNWZnhNzn4bkV4ZSurc2Xqo7ghXCRD9tKjCkkhJXK9GmxgwQ0LW0e4ighpQCGnZwEk/+TSYvKtpswrxKa3/oZO8fb1GthRAkfkj6T08HJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7G01xIJ+2CP0ldBEVJvFhMqONa1oItAqw0aSRFrRm0=;
 b=i+79GCujVbW7i6XYtjQ+0W9NgdAY7wq0CX/QFo154gAI9SxZzX6NayqzT119gc7+InGrYsge8E5SmDH9tq0sgxj5CC3PziGTyILDmKnNqhxQ8LfPrA/826pdelUoevo+cbZXeyx3HeXVH/RJY9tFvXb+WdSqoJnVdxgoF0DX74lsofj3BpnHeR6BxqXKtpUvTJSeiDJcJcaMaAHIE2G5wtuSpAan3DxwzQppXFH3r+KSaFyCWd/WBLQRk+Az+4dk5ZE9UadrJCjxgXV3F91SscK78cH9QMLOX7J5BuzISfUiPPHfMO7EbCmWD461SmI2Ci+tF9/kFIdaBwfCnWO+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH3PPFA07D87DA6.namprd11.prod.outlook.com (2603:10b6:518:1::d3e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 21:23:46 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 21:23:46 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>
Subject: RE: [PATCH 2/2] mm/gup: Remove page_folio() in memfd_pin_folios()
Thread-Topic: [PATCH 2/2] mm/gup: Remove page_folio() in memfd_pin_folios()
Thread-Index: AQHbuWuZ/PaOBi8+/UCWCuiN7fnD2rO+Sh8w
Date: Thu, 1 May 2025 21:23:46 +0000
Message-ID: <IA0PR11MB71854F7F2A30A7004FA28D5BF8822@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250430010059.892632-1-vishal.moola@gmail.com>
 <20250430010059.892632-3-vishal.moola@gmail.com>
In-Reply-To: <20250430010059.892632-3-vishal.moola@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH3PPFA07D87DA6:EE_
x-ms-office365-filtering-correlation-id: 25a60cf3-4bb3-4af9-680c-08dd88f6750d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Qw+v/P2W3qWhX8ZAC7m+GlthHHcOF+SwMJAovObMWgZsT6AFk17oUcI0n1Rx?=
 =?us-ascii?Q?lVaZ1l48tT32PE+9A3qCdp5mDxOT7/REV2uVJZ8FfVns/LFibwsY3IqG4OFD?=
 =?us-ascii?Q?WN8tIF3mSPqAhAMnRHdnYZU0ZoOD2vpBhVKREDb5qa6kOZmIoJiEJVBh3j9W?=
 =?us-ascii?Q?9KSmDPABCOm4eThz96HmPF07kRZL43y66oFDr9450qnyoBCyw+HwIPn/OKr3?=
 =?us-ascii?Q?6vTCBVRFYinsq6qoReBpQGqKa6qmj8YRQazXggHppq1ZMaPjvfNyNtUQ0KNu?=
 =?us-ascii?Q?sU2xqMgjVOS+mOPn/YPeFGrpms7uzOuj/PLivg+EbAkcYCRegna6Yt5LnACr?=
 =?us-ascii?Q?Q3tsCELghBjbqijhCWwjZzpsevys3PKTBJbzs+jeL7velbEtw+giUV+bVHBQ?=
 =?us-ascii?Q?rQR3y4weqZt5+C0A1R6R9MQ5SZQ/w3ASbCA1ehXa5Wj+9R86JkqN4FoXn6XD?=
 =?us-ascii?Q?Pb4pe0Cvm1jHMV2lJQLIEegzYNTO4/aAqW7KaQUmSbCnIme1zPZ642q3rvuC?=
 =?us-ascii?Q?XhsN5plLWwb0h9SorXHPcyUNEPkIfjuPKf68iuOMC5/ZpaAfdX0octDW2ahy?=
 =?us-ascii?Q?ko8lmLcRYEhTPFzxs+S5jEADeiq+wxo+d3/UAHudrS+Pf0KykrD+06Esj0kn?=
 =?us-ascii?Q?kwjMRAnME3/T9NpgOsGMh922RX1qydScPeOioO3gRHc00XbT+BAa7LZWTYCN?=
 =?us-ascii?Q?dQIAOs7wnvmOKAOkYhUS07/eUey4AdrBim2QQOZjyfbXYpObrzhy3rTHTGrd?=
 =?us-ascii?Q?S6jeX5shnH2LdBy1+ce2mPdgU9Vtu1Z2ankBJXsEqMQN3E0Bp8/JrIbHzld/?=
 =?us-ascii?Q?OMeHyV1cbhjY5MU4kpXJPO1WZ45tWzVR32xgbNQF05ph+QuAY6zJMG/HVhLF?=
 =?us-ascii?Q?n0Gkk/s90RL1iZs/9dRlZd9cqdzIW4tBm3F5ZlzSpM3Sa0HO1/LAgRJh0Rft?=
 =?us-ascii?Q?/J906FvUdAzs7ZGkRt6+Nr5cAm8GupWlUelePspwF+gkPzn+sBtzNGTZnKGx?=
 =?us-ascii?Q?YJxMtEjQNRguRT46I8j+ryUgd/hrl0o6QCdB/bL0S7Ruyc5hX9al4H5DjnpX?=
 =?us-ascii?Q?+LZy6JbbNrZ70eKmX6gpXp8FAMt2/QJuxaNYcJ2WP2jdvPcEsImyV6FJSgQ7?=
 =?us-ascii?Q?HSx9NaqvBaxOYv7AASFlGKBLKjJAEd7KJOBbOOOhRK7poXiLHeFIaXq+L05a?=
 =?us-ascii?Q?qUFjvHyDbe2ZVUAiY8WN05g53WWAZyvwsdcQXmMnzXi5Vew1gTDYtPKTIEgk?=
 =?us-ascii?Q?N8pJt+v5h6I+4A3kp0bW73Lj9bPtBMNiofIDqC7m1Lez6jhEXTkMlbX89e/G?=
 =?us-ascii?Q?HOLBjAPZjwQHosr6ncNx4r+INJfMcqmn/G7ejT2Z+gsyaPY0DTwxdbARbWQL?=
 =?us-ascii?Q?vpzOHBdNrC6W61zzckFSs9j/gRS0EMEFUS2zAUYspIl6ic9Q0cPLXycpkZ+k?=
 =?us-ascii?Q?rxZ6UDOnepdEyOGJRJh8hgRhfaqKNIvtAsBJOPGwzWP9FmBL73OUKA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7185.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uNpgdPv2pcoi4Bep7TKk3rqiMkNKyEMTA8vw2Gt0Mq1bi36l6FzQtnwHzKIV?=
 =?us-ascii?Q?xLSh7C5rPLPxGrjbk/k7b4IDgKqAQggZIifxNzSilE9+VSs/dMaM4XZts+PI?=
 =?us-ascii?Q?1NGo1eLOmwqR0HJfsGogqjCjM9pYZSLAoeibtb+y/X4gto46nbZtJaClHFG+?=
 =?us-ascii?Q?jQ2h/xL/IJkQrSwjpVVveS30E2AF+9KMEqzNPxSa/mU659uvLHccckAxwunp?=
 =?us-ascii?Q?m8MZ6XU6jCR8w5yUqvf7FMicNziDnx/sEbUMnK96ceVqmVqQcYoQTJezs1qO?=
 =?us-ascii?Q?xZu+uPq/xXekOiw+PHbY2wjU0gwUcoZv8Jy7YqVjBqJ0aSfOQH9CVJ82Sw3O?=
 =?us-ascii?Q?UnF3vMI6GWuAKqp8Z/VL/ru7Sq7stEYT459uCtbaMSL5Z0c10vtg+c+cD58b?=
 =?us-ascii?Q?6rQCNySfxW6862o0ZHD5xyQiYneY8o9+m0qJjmGXm0DsExtlKvfdct+qH39V?=
 =?us-ascii?Q?2vclREh6+TvGzjYs+Z6il0/4x+D2WeVKZCrOSAqVtOcaAPZ8P0N1v4fdyBPr?=
 =?us-ascii?Q?DgS/uvyaZQGZETXwRcp9x7qkQ5idR6s7UHz3FEKip/ff+UaXVGExaULitaqe?=
 =?us-ascii?Q?VVGGaMKd1hdyD/p/rBUpDj6huz+fRWgCBVspMYyY/2uZz8wrrSvpPS8qHd/p?=
 =?us-ascii?Q?/8QcrG65OumTpMgo6/mz1dUFCA/aICU1hh+6mfZHuQetoliAaui2mwHRgkWo?=
 =?us-ascii?Q?+tvIevXbo1+xOmkLBOPyhEJT+hW0K5JdlQ2pKLL+8trLMog++N2Rpurgvqo2?=
 =?us-ascii?Q?Q01EAN9mTw/+Q5nWvt8c9hgdHuEyUifVt5J61GayijGncyxfDoNDtPGlIV7f?=
 =?us-ascii?Q?tpekfwTyospaHxmodQ0ekVpJRaHxyVRMYjk96ZFuOztNwIqE3ialG2XXI1iF?=
 =?us-ascii?Q?R+/GQ3BK6obx+Yv8ArzLI8axsIhywt3f6dNBGdvZRaEyQ45VxGAas7leiuX4?=
 =?us-ascii?Q?nyHGoFXZ7VL0EyR4CUHrJTRJHVrkHdZ8Fuq60untR6SmNXbB+EeVipAPE31s?=
 =?us-ascii?Q?TVlnFCEve87CYd6C7GQM0Wx+g1HajXME3YYSHrFU+OkRfPxe96RCFfYWf9nP?=
 =?us-ascii?Q?dXFSScIcZ0Lm4k5+khZ1jKNlM87Br4rKLGlIuhaESbDhpOgH0fl83sGUHSoR?=
 =?us-ascii?Q?SdU0XMeixft2rgq0zyOFXWoxgXN0SAJBomgTfJAiLw+ynQ0MA3ZaEP0vBJUO?=
 =?us-ascii?Q?F4tr1EYFoyGD/Dd28vpGxAcSSbgPef5kvEiYZ87MTXmw69aEKvYxYQC8alZ2?=
 =?us-ascii?Q?Cf/ECPSf2X5WDYzIkICyCfM6QH1MBWEFzhhupgc+bWQF391JE4aBsxOU8Paf?=
 =?us-ascii?Q?0bZmwFIId5nAD841iCVXoYjG7KcvwP9/r1DlsdpR9GQVpofnRxSFMUTbLpGy?=
 =?us-ascii?Q?qhMMwEB0Xq4z3rAvXGTYwXvyHBUNQB6NUzry3Q0XBA1wlS7rlBEHm2MG1PCA?=
 =?us-ascii?Q?zVgzAFNPKMHiQlqpuz/+6skS7ovFGApoKszJeYd6ZoeUW16VD0npitC+zexR?=
 =?us-ascii?Q?XjJIMXkA6LYD3ZW43GYQagfpdhNhN++2i6rQzk9VOvWSEadp/FC1pSvfQuOa?=
 =?us-ascii?Q?d+sYgqVYAKWngqyD/ZoaS1miAvf8wFTn1wlNQIjb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a60cf3-4bb3-4af9-680c-08dd88f6750d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 21:23:46.3068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fWceUyqkz8JoVHGUBoUTuRPPfUYiftQF+WifNXjzoW5G3l2pWRPv7aqXeR3pXLJJjU3x5a4aKWVgLLi1FbptIVN7V8UASGnazdHoKYQDA9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA07D87DA6
X-OriginatorOrg: intel.com

Hi Vishal,

> Subject: [PATCH 2/2] mm/gup: Remove page_folio() in memfd_pin_folios()
>=20
> We can get the folio directly from the folio batch, so remove the
> unnecessary page_folio() call.
>=20
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  mm/gup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/mm/gup.c b/mm/gup.c
> index 1fb8f3b9a493..795fd94f379d 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -3640,7 +3640,7 @@ long memfd_pin_folios(struct file *memfd, loff_t
> start, loff_t end,
>  			}
>=20
>  			for (i =3D 0; i < nr_found; i++) {
> -				folio =3D page_folio(&fbatch.folios[i]->page);
> +				folio =3D fbatch.folios[i];
I don't recall why I chose to extract the folio in a roundabout way. LGTM.

Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Thanks,
Vivek

>=20
>  				if (try_grab_folio(folio, 1, FOLL_PIN)) {
>  					folio_batch_release(&fbatch);
> --
> 2.49.0

