Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B921B6547;
	Mon, 10 Feb 2025 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739180907; cv=fail; b=NO5otO+MC8EFBbHXFSMm2wW6iVuht9IrLBnyE8PSsV6TAHVvM2aUH0d8PpTxEgZoieyP+iWb3NbPmeLvwoiN/fgsS3DhT9B6epTGUU67lwhuk9xzMzSCkgpy1Yl70cnkB2D7djXQ6qYjRAjQH/T9O2ja2KAGv2og9r/trHa8RDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739180907; c=relaxed/simple;
	bh=oPysMPgbGNQVaXvro9mYkuqqatigLfp1kywU8vdNpjE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PzWIh+bmQuoP3rHF5oT9xPRv2LD3SJvKSCPLplPY/jRdnVL11DOedLZmNZdNYvke95WjWibO76xy4F/Z+QfPvZ0+ApxtN2uY6c/D+QACHHP0ltY7pSNkpwJBzLS7r2oAM9/tAFhmRy6N0bWRTbOAxoFYFX8qvrR8k9vgaY3xIoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edDaoQCk; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edDaoQCk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739180906; x=1770716906;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oPysMPgbGNQVaXvro9mYkuqqatigLfp1kywU8vdNpjE=;
  b=edDaoQCkSPmEd98IFmCRnoQMNxkFolTnApYhUcVelVxTi4Bc9grj3fR9
   h7mOXdQkKbEMqEjBJfmszq5nF9TN/+c6VxDdOS15JsnsOOfoIvhs085ED
   iXhqrLM1vEinAwdB1yG0h2w1SDSpFNU7Tpf6V3tytZPhqxfb4mLT48v/x
   3hXFzbHGudymZmIRcrASX39Shdo4fwBnz41R3T3dakHRg8ASWTdani2Sj
   rYDW233+TuW4TzdEilCAbx/OP9xqhtQ4lyVRqk0ayP0072XnE+xYJHQ9u
   FRHT68lrHKU5R4rtUL+fCk6cl4/EJZjq49iP8aQNDIJFMIF6fac5vOooE
   Q==;
X-CSE-ConnectionGUID: MYjMJH1ESG2F0eOvoWQZQA==
X-CSE-MsgGUID: sQXUvMvpQ/S4pdKT7TkJuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="43414243"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="43414243"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 01:48:25 -0800
X-CSE-ConnectionGUID: mcRd+HclRW2UfWXXKdLNUQ==
X-CSE-MsgGUID: xw5tVOBVQA+jX+NZA1+4Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="117076607"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Feb 2025 01:48:25 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 01:48:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 01:48:24 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 01:48:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uw0DOv9YKinqlRmHULxAz7PKTbpNWn0cw6N0OebweBbiTUCnv/IaaHW1Tn4CZIQBX6wZzY5m72GcCX2z6LtM1uW33ma6f2fuJrgASHaq8NgP8xmaJEJkybreOkszAav7UrT2LeTTNJ+jT6i0b+oilPwdInAdA0tHfp6pvG62Hphj5jq6oTaoAaJd3R4cm1lmd2FOeK1DB10uPq0azxbxAWX42NmDV7JkwkZtp5tzmamLOECgOJQkHlmxB6DR3nfEnj6i89BQTz74vyImvwTcnouSf1eHS2+Al4lHV4oE10RYkf5ZLJ3xRfrVLdbk91ljNQ11+eE7bF1j6sKY9tgYig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPysMPgbGNQVaXvro9mYkuqqatigLfp1kywU8vdNpjE=;
 b=LeHl6MC+3hn7xkXi6SARPfOGK3lgXCesdF2aDmrQQEzkFdN49AzBp3DwoawH6rvY44XuTxktW2ZbowVYM0PTv+kVc2arNV/l4D/6hLzuXzcmdpmFuMWOx4i0xXh9iRkrZnBVZEtt1cFU6QRckQCnwo4OdB4jyZE2T4rXbF7FC4AY3vbtigkFt9Nd+pXvQp93GsNRz8a4kpgJJHCwuv7Cf4iJovA9Ftvgz40K4HFCFyypKBGJCrjsJjft9t1mVb4YTPnkPZR+JoUIWhBirnwYzLFdm/+UJemtec2ZbTKFyV3TXixEasJD5NvC5fb6FGzLlQyZ5RWUoVp+XBqI9CUPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6)
 by SJ0PR11MB5791.namprd11.prod.outlook.com (2603:10b6:a03:423::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 09:47:41 +0000
Received: from PH7PR11MB5862.namprd11.prod.outlook.com
 ([fe80::7d59:aa70:2555:e6fd]) by PH7PR11MB5862.namprd11.prod.outlook.com
 ([fe80::7d59:aa70:2555:e6fd%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 09:47:40 +0000
From: "Mohan, Subramanian" <subramanian.mohan@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rodolfo Giometti
	<giometti@enneenne.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "corbet@lwn.net" <corbet@lwn.net>,
	"Dong, Eddie" <eddie.dong@intel.com>, "Hall, Christopher S"
	<christopher.s.hall@intel.com>, "N, Pandith" <pandith.n@intel.com>, "T R,
 Thejesh Reddy" <thejesh.reddy.t.r@intel.com>, "Zage, David"
	<david.zage@intel.com>, "Chinnadurai, Srinivasan"
	<srinivasan.chinnadurai@intel.com>
Subject: RE: [PATCH v13 1/4] drivers pps/generators: replace copy of pps-gen
 info struct with const pointer
Thread-Topic: [PATCH v13 1/4] drivers pps/generators: replace copy of pps-gen
 info struct with const pointer
Thread-Index: AQHbe3lJ37kSM3ghgkGNNQu4RC11+7NADHuAgAAgNgCAAAHLgIAAGpPg
Date: Mon, 10 Feb 2025 09:47:40 +0000
Message-ID: <PH7PR11MB58621C37FC5D9CF1A389901CF7F22@PH7PR11MB5862.namprd11.prod.outlook.com>
References: <20250210050421.29256-1-subramanian.mohan@intel.com>
 <20250210050421.29256-2-subramanian.mohan@intel.com>
 <Z6mXC7loE3qRYpUQ@smile.fi.intel.com>
 <73539b96-fc89-48f3-81e7-53af0066bc22@enneenne.com>
 <Z6mzkWxOYtFXyZL6@smile.fi.intel.com>
In-Reply-To: <Z6mzkWxOYtFXyZL6@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5862:EE_|SJ0PR11MB5791:EE_
x-ms-office365-filtering-correlation-id: a87176ad-89b3-46e8-d979-08dd49b7f5dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?kfFsFFf9QxSZGnbxwGdcI3aEP1sH/RX7BofDI3yZTBhPqE4u9QwS5Afhi/0H?=
 =?us-ascii?Q?0lOEVNUXdCaAfOMxV6rlDawobw6+dgvMMPQjC5JveRfJLKCcsGFRgwtDm0Yr?=
 =?us-ascii?Q?zvuuuL3dW1C/hKpGLn9Ikc/IaPehAPdZGX1h7SoptLs7/gojX9O+Bkjf4ebO?=
 =?us-ascii?Q?8Z33EjWIe2mHcu9DAz4C5eFFm6u1H0WjxS8e11bk3g5JMCA8CufL2v1ktIGG?=
 =?us-ascii?Q?6u16N/VGryKokWjuvcQ53IZenNtT9MiX2qIpKs8rE0v3OzxeT3qfflLs0rBk?=
 =?us-ascii?Q?BeJ0CbGaRd9Wx5za2MBST/27f/8+MvHftuXOu5A+M+9lJFXXtXM5gws4H3ac?=
 =?us-ascii?Q?Qzhac9n0frIM1UBRSuKTbcnb1jnbGRABSJIBjbzJDFQ1yuiE/GRzXPwwonGf?=
 =?us-ascii?Q?VZo9FVUHHym0WbnhkVqpvZ4IYceAep+R/6R9fRx4fGpnnPbnF1bgub5BZSV+?=
 =?us-ascii?Q?w318imPN8NfHrPkRo6RbCOHIitfxopeE+xvwK0Eg1BlOXeoKJ6OC/cZwYsU/?=
 =?us-ascii?Q?vuiDHDgGlcBXTYKGpws2CSL3Z/eAfnIK2IBOItbuMLE2xLYOWzmp08Io4Bqr?=
 =?us-ascii?Q?ME5cREiUODXUxd/UvzHNRlh0IyPw4PWCkz1/JaAwANffgs13IMxOottt1z5O?=
 =?us-ascii?Q?UTdztsIZ1PPkIFRkDz7Xj5KERzHWAXzx+1NHqzzpnMWoNFziqW6P4doRZ6y4?=
 =?us-ascii?Q?FjiQ5OSQ6uhwat9hc7pntgzbMT1MOQNeJXXAU1wThn1SQ681KEi8f23FEE0V?=
 =?us-ascii?Q?oaarl7RTbw0c5QJuprDFiI+mu0LdotEIpGQ6HbuqHddl2q4mS4w6KkFPCwfB?=
 =?us-ascii?Q?9Faccgqjvl+RFbeo/iMDP+AK0xwtUx9KML/G49euArcTaag2+oJNxKpEPDyF?=
 =?us-ascii?Q?78XIWMZS9VcR59f1p1O+HOV2SLbkjLIG0g+g9tdRTmpEclDk6fNeB6tUM2Dm?=
 =?us-ascii?Q?Ci/O3YBtdGPGTVbAqQesW6dDYRJa2MX9z1Iua3+tP/9Cyz5rEVJT+LHRtYAm?=
 =?us-ascii?Q?5zk+gCAsObTYhcwcnzM9zYxQRz8kS8W1w3aVNtblzZoQ1cGlExWoEVEu9YZC?=
 =?us-ascii?Q?//vQu4Qbj9L+LDdnMen5P13HQsinjyRBWsvdF2qcoWkFmD4zUwiCEr/fkqLx?=
 =?us-ascii?Q?IBLpewrQkKoF38Plr/+NdHSA6mvOgrOZ242C2RoNEMLLVKEYU1njiIXnjiXW?=
 =?us-ascii?Q?6eW6VxKhN4vAYE/pzqcTQnzxBRKOFrVpJx130Jzw5X9BbJrUKRi/hD0n7J7M?=
 =?us-ascii?Q?q2bMTs0SuwzMPxFI2CdkdTtrUXcuZbQH7rDvccTZHdX6lhfhvD0p1AO6M/K/?=
 =?us-ascii?Q?x0ATAkqlHRMW2aWmfJJp/pB/Y5E+O7T52Dw/tYoS0o5Ecbp+EtpQnI6cxrdn?=
 =?us-ascii?Q?EW9br0kJ/nbgxhajtnCrTw1E64nHSv8KQnlvs/W5PFfPqF6httQXgAy+fI/4?=
 =?us-ascii?Q?0nuxxVNStozmN5iMHC2UxdD5E23H626d?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5862.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5LgjHJnL3AWrKW31H3p2MZdbGDKvyg0Z560HCys+wXg89x6XrHjsunvpO3jM?=
 =?us-ascii?Q?5VsTRc7obdVutGX0XsSzSG3iLPQdDFhbXot5gheqStcZ3dWhR9he2COVRsvr?=
 =?us-ascii?Q?LBTt/hiqvTJCaWQMtmvOSfLQsDpPPWsGZEOpucI2naHyUo+kw48nWRfWmdoZ?=
 =?us-ascii?Q?fomWWUfbFYaa+dFrc4iFrTDbvDbOecvzstXNlh8Nb7PZMphIu9dO3k2b5gOH?=
 =?us-ascii?Q?DRcTItXphuXM2UZ6GQ5XFMaLsCJgIKc/R0hhFqzsEL5elO8mPM5zNPTYYzOa?=
 =?us-ascii?Q?R5Sej3X+SdzkAxGwYGdzBFvjyxUt3yT8NwA1ZXAlhG8IfUoKzPgHq3X/Jm09?=
 =?us-ascii?Q?xK4AQVI5mALgKyqOiK3stoJp818ydAZJZ9kRpUOxSShkb4mDVByApUO2qcKp?=
 =?us-ascii?Q?oW0G/XNfkg/FN3fLNoR+M4/ybJjDjtzy67qZneYGDvjY1T52TCl0SxnLvp8Q?=
 =?us-ascii?Q?xMCKplP/z+kkPd7eUiyHbW/f0SVOqQa2Qrg7WWYQcTy68C6lFxPoIvRUjtHC?=
 =?us-ascii?Q?diqSrianYe683HCroRJ9awGdmV+QZQFckvW+nlg85/9MkKO8eNEyFsGksE8v?=
 =?us-ascii?Q?iTlfdvrZ8UPDwowRCIPp2N91eUH40VnaomhAo9zRd1O9SJT92bZ+AoOlPghH?=
 =?us-ascii?Q?OGBg3JKYzZw6F9yxLaLwwEFGMFBa8gIIXQCvU95d6bUCZeBskXpy1Ig/MGfr?=
 =?us-ascii?Q?XgEuxyANJAzDVP9FyuAKIDehINcuciKtMraqTKeoJiJchXfEAb/Kj5y7ByMe?=
 =?us-ascii?Q?cbBxqh8GY4og0FABUi/j8SVSAsus8+rZ5eVJjGz8BS2kHsJR39ZLqjQ5RAFh?=
 =?us-ascii?Q?u/Yd/rYcLY1aM6TSiquLI4DX9jJaDBSgdRn9FvpPLDKiXpkaTjYIpN4ZuSXH?=
 =?us-ascii?Q?+sgtt8DUkvv0ko0tsJ5Jsx23YjfNqFH7v8EOB2z7aVzwWr6EDSRGYZ03otwU?=
 =?us-ascii?Q?IQe9fsOBN71+57VRrZekXNXCRZQVetKxY6H/G2CibC/Om/a/P8HKYYUfUcSL?=
 =?us-ascii?Q?DrTzDhmbuy0NfBb/e60E+y/cY0Shtg+dgIn0PDVH8w7AkR1bHBuZfbTscIpc?=
 =?us-ascii?Q?D3Spdj0n+P9+jqT3swOXXGXak5JlX4ek3G9Z/UZkBCM6rnO36aGWQH1/knxL?=
 =?us-ascii?Q?ip06Zq78gBlRFrEhLsxjW8zJsHWw20B0ICOqk4TtzevyDpNMULjvaiHU4jL9?=
 =?us-ascii?Q?4gEZojPUxvc24YceZ/3jOm9dFQDV3JdetYpxa+MkacO95mVgrI/Q4LdTIA+L?=
 =?us-ascii?Q?p3GMCbTdkOZrWjV05xBX3AnsHKqQjDtiLnPPgJZd8yO3oHWCTkxyQVyCtjlD?=
 =?us-ascii?Q?z7HGrZTigMlvPRCGn7zttnxzGOXp7yN6En73kU+lPjdSloKiaNlpX6t3UhyH?=
 =?us-ascii?Q?b/u8COTZOG1peWvzExvFPPka8LjDrPWV7H1iKsOjGDZLT9z61s0w0MSToUy+?=
 =?us-ascii?Q?r6hV8oAaR0qdcb3L0zRCgMsm7CAsJgoTT8tXpGCupZaFX7SFv44d+PWlEyfX?=
 =?us-ascii?Q?8OSGMJwuvzo8zxhu7cJPxglft8dhxp2VHX8YRjuU8OHKMFp7XSXV+u/2ffpR?=
 =?us-ascii?Q?g7AdZ1/tFlrgPnm0KrJiqaD7lhbJ09IDCcFoHBzq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87176ad-89b3-46e8-d979-08dd49b7f5dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 09:47:40.8654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n4W8k20wGUsO+t2gSyZaWTrvmmI5B4wVtQ0IUFSNsQF3o54Md2DFnMaAsPThztJE7gUuWIVZIgyHMSpvbzX+g+Nct1ScSVH6Wsz/chhhchM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5791
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Monday, February 10, 2025 1:37 PM
> To: Rodolfo Giometti <giometti@enneenne.com>
> Cc: Mohan, Subramanian <subramanian.mohan@intel.com>; linux-
> kernel@vger.kernel.org; linux-doc@vger.kernel.org;
> gregkh@linuxfoundation.org; tglx@linutronix.de; corbet@lwn.net; Dong,
> Eddie <eddie.dong@intel.com>; Hall, Christopher S
> <christopher.s.hall@intel.com>; N, Pandith <pandith.n@intel.com>; T R,
> Thejesh Reddy <thejesh.reddy.t.r@intel.com>; Zage, David
> <david.zage@intel.com>; Chinnadurai, Srinivasan
> <srinivasan.chinnadurai@intel.com>
> Subject: Re: [PATCH v13 1/4] drivers pps/generators: replace copy of pps-=
gen
> info struct with const pointer
>=20
> On Mon, Feb 10, 2025 at 09:00:16AM +0100, Rodolfo Giometti wrote:
> > On 10/02/25 07:04, Andy Shevchenko wrote:
> > > > Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
> > >
> > > Hmm... Is Rodolfo indeed a correct to be mentioned here?
> > > I think you wanted Suggested-by with somebody else.
> >
> > Honestly speaking, the patch was written by me, tested by Mohan, and
> > suggested by you. :)
> >
> > Then I proposed to Mohan to send the patch with other patches in his
> > patch set, since this patch is logically connected with them.
> >
> > Maybe we can put:
> >
> > Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
> > Tested-by: Mohan Subramanian <subramanian.mohan@intel.com>
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > ?
>=20
> Sounds good to me! Whatever you agree on.
>=20
Thanks Andy and Rodolfo.
Will wait for some more time for the additional review comments and take th=
e above changes with =20
review comments by Andy as part of v14 patch set.

Thanks,
Subbu
