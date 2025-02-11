Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B6B26BD95;
	Tue, 11 Feb 2025 03:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739243892; cv=fail; b=Ynuz/xmukAMZleAxfqqcR4HBmsl02KIM1DS6f07/cdo8Mbdm79jg09T/TOTzeVmWJqf5o9WsJw6HeWn/w4o3ELwRcmQVKlzUCOo1asNjl2WXnH8rvUtjXDQAUuPJNGImE4JViN2vhDgjiowO6Oy0+JQfOskN0cWwuDTLZkIkjGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739243892; c=relaxed/simple;
	bh=qcg7LocwVSB7n5Ea4k9arQvWO2jVveO7iBFC2AD7n+k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VmMgfFUdMn2j0j/nPH8qWQUVETnX+ose7ANl5mni8Hnze70lNQLPo2gs6e1zp7ckffLzB6wf1P28B8BY732knnaq9oP/nVJwR+rtv6sfSxlwyCmGryNt/i/wOfSTjKz7mRXbscQZTAqFhweXbFi5qv1oAQGh58EbZqjI1jbVW5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZS6luf8l; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZS6luf8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739243889; x=1770779889;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qcg7LocwVSB7n5Ea4k9arQvWO2jVveO7iBFC2AD7n+k=;
  b=ZS6luf8lFAbP8Hp40s++KBlOYjLC5VocMDOLAqL3jwqnDjuZcQPWdFZT
   krVMn6a37qXjxh7/fjHTR5JfpeWrEETvRi0H0dFvWy4/nsj8DWB86zve7
   t1hOF4Uq6BCB3f1Bx2+BiEi9QeJJ/ZRkiZm35pIUFniTTlR3Z2xm1CkMF
   ODk7bnwmi1YLguerV1CgU2LaRZX2mLjLHlNmwkh15tsqJE8876QDhtLCz
   nbKBigEafTKoxaqPRIMql1lwzs7eQ+mRiW8S6tvOqDkTglZC0YxWUFFUP
   epWGWWW7lwiRTmO+qohpyhYd2u12FAsEsrWXGxR79yJl3JitlpLLZoaL4
   w==;
X-CSE-ConnectionGUID: NRY1ykO9SESlQypDyzP22Q==
X-CSE-MsgGUID: kC9OMiCqQ6GBPdS2d+zBuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39977448"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="39977448"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 19:18:09 -0800
X-CSE-ConnectionGUID: OPCZzm6VRryMUSNgEuqZTw==
X-CSE-MsgGUID: GHNuLDAIQE28elcjuvH5GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="112325850"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Feb 2025 19:18:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 19:18:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 19:18:08 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 19:18:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQRgblDi26eADlGNgtZUYIf9XHZB9S3F/oJ3F7IfWq2Ut598T13YB0wLH8H3zsEH3D4aenMB19JMyEY/m5z/yl8pRQMVvnFK7zD2/ltB8BFgWCC82izPexlOlurImnBNnG8mMIv/qgQHQn/Vg/tJb1YDiYmAlOo6lDQkSFyqaATErQmgM1BuO8OHW2pZdEni0VyeDbovaILIWLicW1YdKZbWrDMI11lBonYK3Ex1W2oyHXCHV1oQsDVJTzCdegjyLVaFdvcOJ8eW9Hr/X5alstHrrSXC/Z+GPFZqsDZ1TkWssd0K/eMtIvmTxYQOt8fisn65Z8lOeUtGDYPrciL6ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sz6PFT1iBejEhREhgtZQCrwH0zxxG4YWzGOhl3tZySU=;
 b=n+rXSvmQboIsdGZaI3LQ0CSuL5LIs+X25TdtAccCFYVKy2xY6rwJgZx0axmIzrszjQOIckM6rUedTSwZ/BWhGRH7gqQnXj60lyK9UKtUyEomV/aaNhp6cmdaYrahLUdMnGYOzRxceRS0r59O+vy6x2+gMLLhvIsGO/xux1WYHK0eTN+z/xsjxpNHOLOOfaWVYs8jXS1xZC6XefN0fKLUFoB6rJRw1WZo1uLvWxIKfhV+PhtyHU4QVVzV2SUk0wpJP6UtwxxkeFbbeMRqpQYhu35RV7sxbFwNU/jKfh7dQ7SiDOUJy/l083Fy3h6LdnyrdREWsJbioZ+oJlEAjPDTjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 by BN9PR11MB5243.namprd11.prod.outlook.com (2603:10b6:408:134::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 03:18:01 +0000
Received: from BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f]) by BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f%4]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 03:18:01 +0000
From: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: lkp <lkp@intel.com>
Subject: RE: [PATCH] ARM: dts: socfpga: remove syscon compatible string for
 sysmgr node
Thread-Topic: [PATCH] ARM: dts: socfpga: remove syscon compatible string for
 sysmgr node
Thread-Index: AQHbaPbzWg4D8Cm6jECFhWM3cdrsNbNBRJcAgAAbKACAAC9xkA==
Date: Tue, 11 Feb 2025 03:18:01 +0000
Message-ID: <BL3PR11MB65325F279FEA579D19EFCF7AA2FD2@BL3PR11MB6532.namprd11.prod.outlook.com>
References: <20250117154244.4079614-1-niravkumar.l.rabara@intel.com>
 <45276881-11de-47c9-aa9c-488df537a596@kernel.org>
 <d78ae428-6139-426b-bde9-e3ce5a4008ac@kernel.org>
In-Reply-To: <d78ae428-6139-426b-bde9-e3ce5a4008ac@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6532:EE_|BN9PR11MB5243:EE_
x-ms-office365-filtering-correlation-id: 04600094-06fe-40a2-bfb2-08dd4a4ab0e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?NKqgpBXMvWD9s31q2eYiNNxzbuoIxmJx2NTj27SbYUk7FuOCEtdhGpIidw?=
 =?iso-8859-1?Q?+cwHfpjh4ac6rMWq1ikVys4Bo4ZRF4pe5NpqdZow7ts90S8gT5TiV+kPbz?=
 =?iso-8859-1?Q?igiQZ8+YCpUfeb2jnlu1Xi64lOPH7jknBxgKEjtMegCN4BlL8wXCTuAQc8?=
 =?iso-8859-1?Q?Yb4dTG2RofKESYEP8nueze9iW0gsPkRn2+wrGIRy0ZvibGZQQdQESjnKVz?=
 =?iso-8859-1?Q?oIoLc7b5ahx9dAImvqhaHJExnHfvIq87gVAkXLgib5YsUGiCD1Cg9DNq4s?=
 =?iso-8859-1?Q?FXmE7wFpAAAUzviEvCCZ7kTkwhB1blr2KwmTEiK4zGPhmvWyc2GlADRWWa?=
 =?iso-8859-1?Q?iGfMM4BXFl8AaGm0JgJi6Idb+s42ky6hw5sQyV28FBpauolD5tKxjiidcs?=
 =?iso-8859-1?Q?B4OPdh+UWOrvp0HITEttJlhKbYlef1+eqNq+W6NQThoORE4u9dArTtLyC3?=
 =?iso-8859-1?Q?GquwiEkz6dRucUHdSjbxwH6BBhr9C/734d+Aj028F+KXlWPUcRTwfdJTrP?=
 =?iso-8859-1?Q?oMOCrofUT0RQtmWUC7y7im9Xqo8bYwEUr2tLA1jjElJ3Rcgu0gQVD+q2pt?=
 =?iso-8859-1?Q?16xxwih3QgyChlBwAi7ySsF+ed185jSyD+H1hzu9dAdOrFbmPZ6OkzpJJW?=
 =?iso-8859-1?Q?blFp7ypi7lDjGF8hpQH9+MMFc/sFwr6hUy3jtggQKX6wemEjBQUMOJAWqU?=
 =?iso-8859-1?Q?7MmVygWJrNX9gVoZIkTwcBk3/LhJk04Gd1sLiv0TimMrmZBu+dvS+0/2fS?=
 =?iso-8859-1?Q?KT4CBNAq7PxPY1+WQVnCtGOLOWXR+DsYVHhFjs13MtxGRxYcFtbO1YregN?=
 =?iso-8859-1?Q?kYXHKA48+OB5gIpnSYH6gZBV8ti9VfK1Ex8QYrCp0fMbiWoaP9TmSpUGnS?=
 =?iso-8859-1?Q?iQpB2I/7go8Jes7OSPtm8eCan8aC0Elk+A1mtIX9+RkJlPq7uLE3kkKXHF?=
 =?iso-8859-1?Q?y+DDU60gHyq4zLEPljYYsY5P9Sc/AxDf/LMQOrlGsnsGamVPy7Z7LpQdbx?=
 =?iso-8859-1?Q?GV6RK0JrSOxGDROxUFz//XmoSUQHYMxBctZtFovVhzL8AwGXAEgT99CBo+?=
 =?iso-8859-1?Q?tYQ+iV7H9je/h/coUk5xzrAs6nK6773sdrz5//1D3V0hPBCIVER5E07pal?=
 =?iso-8859-1?Q?mFbcK2opdnrpVmTY6kfZthMeeiOLN3GzOpfaIezlsc8sDXqjjGe9bwf5kV?=
 =?iso-8859-1?Q?idqE8ziIMGmFKwGDiKvsd8EtH1M8z3CaxFaf6QVVi4V/jNHEPetn+xLCgr?=
 =?iso-8859-1?Q?O1QhKiiigbZlBIjuj5GbmtVnpUaeEd7pHh6qzyHfukPiNAz7myF66YwZQk?=
 =?iso-8859-1?Q?X3ZyFw55V6Kf4TDPlhEiiPa0oFrxZ27zQSbGPey/Q7h8wsusKN4XRIPCbF?=
 =?iso-8859-1?Q?ulUOxVevRF46XJVOoAiOlXlsov6cByYt3HBV/J6Bv0UFj3RY4NJtwvL48P?=
 =?iso-8859-1?Q?mkU2+qC3o5NJxNKYpkToKfMJ6t2/rtm/X6MbGA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WFxdoP2gQXuMp7XN5nxBALQdK/wW8/RuLFR96sJjblYxulCmW9kkn+DlmY?=
 =?iso-8859-1?Q?yOpvR8o4gEkx1aj1lpKzsZLcAJI9umVhvhI9WGLvCPQAWMAoqGvempAY6T?=
 =?iso-8859-1?Q?xt/P6UU1L3rx/q+u0aKveZGtz0iZUV6s72AB/Sn9jKTzATG7jHUsMb6p5a?=
 =?iso-8859-1?Q?a/4DQUE0G72soCw/xU6/Zz1y7UNy51r9p3NUZ4PWTfSGIadlpfQbwxgxtI?=
 =?iso-8859-1?Q?Fw1ODJpUwMBDDdTa/MlOgZY4wNCn6E60YYcuXidaHShs6JCPS49zSqogRC?=
 =?iso-8859-1?Q?2RemOZB8bGr7yebUDd40noqrFYSmnqEkyzVvX4mgR1OvVkiCUE16zenNiE?=
 =?iso-8859-1?Q?gLJmzyMRR+ejyPSdV6rwEhmmfC1ALFq8YIB1xRipw37PCMyUsNAzG8VGCp?=
 =?iso-8859-1?Q?/eVcCH6GzyzLR6Du3fIlnQuTGKSWJTEM4IoG/zFWqMfYXEeIOW80dQATmU?=
 =?iso-8859-1?Q?+Pz0QjD4DlreKgJ44UvpZJeqdLy3K2xvsVIppF4r3WkJU1sUfN4Yq/Ukbr?=
 =?iso-8859-1?Q?uqee+Gy3//rOm6k0Pbh3La4exQj+bbH214TQd3y0FoVF5i1t+iHSi6eYvg?=
 =?iso-8859-1?Q?4P3qAs31fsrk/CeyB02lH+CKCSTWUoTVnNRU8XkAavBqUdXYBKzKzasDAY?=
 =?iso-8859-1?Q?lkQ9bweUpXYFhxLnx6Xns2D9tIKa8wbMeRy4pWyApcQKu6aV0O7a+xmx2v?=
 =?iso-8859-1?Q?DNIuYHRAROYmihTtt2Z/YOQ1bIniRsw07/bM50rHQwyFTburO/2vDSwl0Z?=
 =?iso-8859-1?Q?C3Y30N9aSik2IlzMhsQFFeaMtbozRxy6mXbf5ySztsPmrkMZS5eFHpVuKB?=
 =?iso-8859-1?Q?DZt8zTJBIGPMlKX+SPt8zkQswcGruJDv2UHtpbyXFnw0gwZzyhGJBftx8G?=
 =?iso-8859-1?Q?6WL0mKKlE09l6pFdtjGk8zCqaESstuaXfFGly5CEZMwkzehXPfXLHm5tSM?=
 =?iso-8859-1?Q?YJiGOAn1t1vdLrKLOFRNfInffRSNdnR9a5aDwdNa8UG3n2lgy6NPnD74OQ?=
 =?iso-8859-1?Q?CYOsLgkRHoyjuG9/R9Axp2rIJazU6sBDDyXdrLXqH9fe/Ov4BrHU9GgbOz?=
 =?iso-8859-1?Q?iOSJ+ipnSoOJJpq9JAWoVPj0JF4vb6s1vOoBc0+xKelOT8Sg8fXXJVdt6d?=
 =?iso-8859-1?Q?/Zm/kyaFmioBUwVTnSM/vjQ8eVwMzAYlxZf0xmTVAjE0FnOtGPx+EkRv1W?=
 =?iso-8859-1?Q?a4lAez9IHeyzOPso2Ak7XYbLMo3iGcpbq4O/0KdIvoArRshTUeMIE+P6n8?=
 =?iso-8859-1?Q?3QjrTfQ1A12MLV11E7Zzpl3yvdgJBRW1EhgD758qAxRomaeFzgsMW/S9k0?=
 =?iso-8859-1?Q?98VC93RETFID5GKMJl5w8v89Va7hgIhUjror5mIk4unnqHVRGCkr1pJqIl?=
 =?iso-8859-1?Q?APM9q/SpXCnNEIxIBuJ5adyusrTZrt9n+gNhA+SWyaMf55Z2tOM/0zOjHH?=
 =?iso-8859-1?Q?zcCpRGIRXVfT0gKJcT3Tx5bHKG4tsQi3dZxDI7bkHJoA1Tc+LTkxmj0Wkz?=
 =?iso-8859-1?Q?fSOii2dJDC2ah8Iwjx2uzv3ASjxzbfnc2dGXvrCGuFcTAxF47wcMxJY9qD?=
 =?iso-8859-1?Q?dLonBHNar7XmViJ2QZrOGfbIrPBX9k6XlZ32F9qW5Sfld8Rc2EIhnhJlCa?=
 =?iso-8859-1?Q?Vi8D+ZEXi4Q0Df4OHi/Fscnr+zN+yVCNV8nKIbKa0JZSkCBablGZVEtY1a?=
 =?iso-8859-1?Q?xddF7UdE3a6+DPX5HaIfbJzAN8f0vRjw8t8s5FRTPbYnW0M0/ubhX7RQ7E?=
 =?iso-8859-1?Q?pgMQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04600094-06fe-40a2-bfb2-08dd4a4ab0e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 03:18:01.2106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LuSdPRHMYH6TJaaT5rAQvKBz7YKwH9zyXarsCghwyA7p6+RJ3wuNrOL1twbBcavFQowxo2qzb0uqc3hbQbtrV9p+/xdIo1RrQETnVIZf4dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5243
X-OriginatorOrg: intel.com

Hi Dinh

> -----Original Message-----
> From: Dinh Nguyen <dinguyen@kernel.org>
> Sent: Tuesday, 11 February, 2025 8:07 AM
> To: Rabara, Niravkumar L <niravkumar.l.rabara@intel.com>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Cc: lkp <lkp@intel.com>
> Subject: Re: [PATCH] ARM: dts: socfpga: remove syscon compatible string f=
or
> sysmgr node
>=20
> On 2/10/25 16:29, Dinh Nguyen wrote:
> > On 1/17/25 09:42, niravkumar.l.rabara@intel.com wrote:
> >> From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> >>
> >> The SoCFPGA System Manager(sysmgr) dt bindings do not use the syscon
> >> compitible, nor does the Linux system manager driver rely on it.
> >> Remove "syscon" for Arria5, Arria10 and Cyclon5 sysmgr node and fixed
> >> dtbs_check warnings like:
> >>
> >> socfpga_arria5_socdk.dtb: sysmgr@ffd08000: compatible: 'oneOf'
> >> conditional failed, one must be fixed:
> >> =A0=A0=A0 ['altr,sys-mgr', 'syscon'] is too long
> >> =A0=A0=A0 'altr,sys-mgr-s10' was expected
> >> =A0=A0=A0 'altr,sys-mgr' was expected
> >> =A0=A0=A0 from schema $id:
> >> http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes:
> >> https://lore.kernel.org/oe-kbuild-all/202501102323.Xnte2yhi-lkp@intel
> >> .com/
> >> Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> >> ---
> >> =A0 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi=A0=A0=A0=A0=A0=A0=A0=
=A0 | 2 +-
> >> =A0 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 +-
> >> =A0 2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
> >> b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
> >> index 35be14150f41..f124fb72e260 100644
> >> --- a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
> >> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
> >> @@ -853,7 +853,7 @@ spi1: spi@fff01000 {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 };
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 sysmgr: sysmgr@ffd08000 {
> >> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D "altr,sys-mgr", "sys=
con";
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D "altr,sys-mgr";
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0xffd08000 0x4000>;
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 };
> >> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
> >> b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
> >> index 6b6e77596ffa..015120fb4b02 100644
> >> --- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
> >> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
> >> @@ -792,7 +792,7 @@ scu: snoop-control-unit@ffffc000 {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 };
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 sysmgr: sysmgr@ffd06000 {
> >> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D "altr,sys-mgr", "sys=
con";
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D "altr,sys-mgr";
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0xffd06000 0x300>;
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cpu1-start-addr =3D <0xffd0623=
0>;
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 };
> >
> > Did you test this patch on actual hardware? Unless something has
> > changed in the system manager driver, this will probably cause the syst=
em
> hang.
> >
>=20
> Actually, it will not fail to boot, but you will see SD/MMC fail if the b=
ootloader did
> not set the clk-phase correctly, or you booted from another source not SD=
/MMC.
> The SD/MMC driver uses syscon to get access to the system manager to set =
it's
> clk-phase.
>=20

Yes, I have tested this using NFS boot, however I didn't observe any issue =
with SD/MMC
driver. =20

=3D> fdt print /soc/mmc@ff808000
mmc@ff808000 {
	#address-cells =3D <0x00000001>;
	#size-cells =3D <0x00000000>;
	compatible =3D "altr,socfpga-dw-mshc";
	reg =3D <0xff808000 0x00001000>;
	interrupts =3D <0x00000000 0x00000062 0x00000004>;
	fifo-depth =3D <0x00000400>;
	clocks =3D <0x0000001a 0x00000024>;
	clock-names =3D "biu", "ciu";
	resets =3D <0x00000006 0x00000027>;
	altr,sysmgr-syscon =3D <0x0000001c 0x00000028 0x00000004>;
	status =3D "okay";
	cap-sd-highspeed;
	cap-mmc-highspeed;
	broken-cd;
	bus-width =3D <0x00000004>;
	clk-phase-sd-hs =3D <0x00000000 0x00000087>;
	phandle =3D <0x00000029>;
};
=3D> fdt print /soc/sysmgr@ffd06000
sysmgr@ffd06000 {
	compatible =3D "altr,sys-mgr";
	reg =3D <0xffd06000 0x00000300>;
	cpu1-start-addr =3D <0xffd06230>;
	phandle =3D <0x0000001c>;
};

.

[    1.095784] mmc_host mmc0: Bus speed (slot 0) =3D 50000000Hz (slot req 5=
0000000Hz, actual 50000000HZ div =3D 0)
[    1.105692] mmc0: new high speed SDHC card at address 0001
[    1.108238] at24 0-0051: supply vcc not found, using dummy regulator
[    1.111817] mmcblk0: mmc0:0001 SD32G 29.1 GiB
[    1.118872] at24 0-0051: 4096 byte 24c32 EEPROM, writable, 32 bytes/writ=
e
[    1.129186]  mmcblk0: p1 p2 p3

.

root@arria10:~# ls /dev/mmcblk0*
/dev/mmcblk0    /dev/mmcblk0p1  /dev/mmcblk0p2  /dev/mmcblk0p3
root@arria10:~# mount /dev/mmcblk0p1 /tmp/
root@arria10:~# ls /tmp/
extlinux                         socfpga_arria10_socdk_sdmmc.dtb  zImage
fit_spl_fpga.itb                 u-boot.img


Thanks,
Nirav

