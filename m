Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AD52B9A9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746024022; cv=fail; b=DwdWQbVC68iO8OSgTmVvG7Ur9I/tLvbCG7XJzv/QGk3ZFcAD+ukBelQpdBm+7KgEBN/WBdHJcuGSS6ApMICD0G1ViX+A76mhNQFCkXi0dowXFLy+2wq6hkbtNOQyPnqQxZXEhCd1fMtid8KHvzQ8Z79/Ys5Oc4mUUVpBFgqcHCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746024022; c=relaxed/simple;
	bh=Jw/aB799UrAXJiporDYfedvrHoT2x726O82HRz6FJCg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OyWzsRrHxGMVRnWSIX5JjMKEV64wCRi70QXJ+4gigvPx1AWiTxC1jpRotSg493LqkSzrIuneaHwJ68Z+8d6k6khSCcA8jftejcFV/VhvIHRtRBYZTvGmWxzPo31JpkzKwNKSk3YRibPQqpZF30ajSIdEWyNfaEIv5LQmctyED1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUIQUmdY; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUIQUmdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746024021; x=1777560021;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Jw/aB799UrAXJiporDYfedvrHoT2x726O82HRz6FJCg=;
  b=cUIQUmdYUe/s5neRFLH5j797RUPnAKVNK3lcubSVpHVpbempuU5FGPMK
   bhKFoVv3tKrDOd5KWMEYWYmD9vsmb+m3TCQLRbO2pikypNc318UgXnToX
   S85QCWvoJNaurzdVcYxqS1nbFIljUqOHHeefMoMiRilsF01GuoMFpt9aZ
   QCKTpaNF+XusqIAgjRuINDEj0HNzO5RDOp2cgIpEShjYcQA91K5lYGtsh
   0tQKXcqUXPtbM0kFLXsBdSLwjR0NUpONWdJFKLKiyZHXg45am5XeCJFNl
   9066VMJfy2E9SLg7kJy66UGdUQqP8F1FweJgDw3yEiWj6z75opwMOKe0i
   Q==;
X-CSE-ConnectionGUID: iVmj6kyiT1S+Lpd5hUsXoA==
X-CSE-MsgGUID: LjuitSj2SxeQGWT/ITC3bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="50342998"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="50342998"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 07:40:20 -0700
X-CSE-ConnectionGUID: irThnF6CRtqK1mRC0GO7HA==
X-CSE-MsgGUID: Qw3Td9hMQpWcGsB78xjlow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="138971359"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 07:40:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 07:40:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 07:40:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 07:40:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEWIqHmhw0g1k+8cU5pPSwQtHZxuM8/3nl/D+xNf40O/GG+3rmGZio2m3jYG+GgdYqpfggnSXbosWHFcx+uT2VC2NyOzcHZ7yZS6XzE4mGt9b82OpKl89DfrL/h2EfmJ+usvBVNKGok9V5n8FXbAk7eYdtPYLLkKsbd2qHlKoYuFl2kov9n9cDaMRGHbNwtl5/3mV8HRTtdi4h0MlCkPJgB0ks8FwI/jgXok8m5smFfwLFOpTdDKNaClodTXokDZBp0OtF042NG1V9iYZSXyPvCQacqecnQtR9WxxnAspvfyWGO3V5PPMyXQCnh7mi3U5jMwSp6kBQK9zFgTDwqf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOH1XVaQRnZaCgttH+BigaXCSLBFyGoesF6idWqwoFw=;
 b=B/Rkv/juAkB85ulyFiILKh2WJCeaeRB/+iddb/t4ELrQONeLNvww3wOp6QXeRJ4gz+MCEURsDQUoJ9jBxX5KRbyh4UWqxUYYEWd56plqgc30D1lTuD5xUP37cqf9yMVupywz1bd0nd2CpEu6iGYr78KvE3DT+CqG6jl/KX33rMHjIBQup44hhZ/KZzNtHi0FTnFIvpdCwkQo4ewZm+AWXqSAUcuLnU4c2ZhSp9UaxOkN4tWIUHMN9uezizdfclpkmI6Kh++gQHTZoFjChfdPdKoU12EDHxeyHeL0GhWR4Iy0pcAQ6ew4r/5OanxXqwwiy/PgmuyYMDZyEKfeaCEtHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8455.namprd11.prod.outlook.com (2603:10b6:510:30d::11)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 14:39:28 +0000
Received: from PH7PR11MB8455.namprd11.prod.outlook.com
 ([fe80::e4c5:6a15:8e35:634f]) by PH7PR11MB8455.namprd11.prod.outlook.com
 ([fe80::e4c5:6a15:8e35:634f%7]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 14:39:27 +0000
From: "Miao, Jun" <jun.miao@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: "Li, Zhiquan1" <zhiquan1.li@intel.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "Du, Fan"
	<fan.du@intel.com>
Subject: RE: [V2 PATCH] x86/tdx: add VIRT_CPUID2 virtualization if REDUCE_VE
 was not successful
Thread-Topic: [V2 PATCH] x86/tdx: add VIRT_CPUID2 virtualization if REDUCE_VE
 was not successful
Thread-Index: AQHbuND6vjibOZxG+ka1jAh+mtIp+LO6umSAgAC/WYCAAHqcgIAAGIxwgAAwPgCAAAdwEA==
Date: Wed, 30 Apr 2025 14:39:27 +0000
Message-ID: <PH7PR11MB84558F2095C87CF98AFBBFB09A832@PH7PR11MB8455.namprd11.prod.outlook.com>
References: <20250429143114.1724280-1-jun.miao@intel.com>
 <20250429143114.1724280-2-jun.miao@intel.com>
 <b138cb84-3a34-40b3-a23d-6ff3708dae6b@intel.com>
 <a0676c7b-9e6d-4af4-87d5-f822ab247730@intel.com>
 <sdczrx3z55vbf4jxbedjpccpdmz7h7ukhhiwrwblpozwyrqssv@ljszzrxvgoxr>
 <PH7PR11MB8455BCD71320C0C081C29AEB9A832@PH7PR11MB8455.namprd11.prod.outlook.com>
 <fpu3a5x5zhvm7n6sus5533bnub6ynf6lwvsibxhxoozeoeitxu@5vd7k75x4pzw>
In-Reply-To: <fpu3a5x5zhvm7n6sus5533bnub6ynf6lwvsibxhxoozeoeitxu@5vd7k75x4pzw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8455:EE_|CY5PR11MB6487:EE_
x-ms-office365-filtering-correlation-id: bc9d30c6-c0bf-4fc5-3994-08dd87f4cf5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?eav514sh40UepWau1omRRLoeTOL3/a5EAPg5bLB4b44Mr1ODFah/S8ip1y/j?=
 =?us-ascii?Q?fq0NqsiA2yQUtTQRJxx+DTnAnTVRCoe37zTUB4+vikAldV15NF7kK7HBfd37?=
 =?us-ascii?Q?+GmClYKx/zEXNDyN0x55NoyXQgg1K9ktI8LMIOoNbxRw3pntVKJAlMTn54XC?=
 =?us-ascii?Q?zlL+qKy0Hoa7iTk0elA9taEZFpm6/84yJBKmgC2JglnzB1V9daoZwV9a8LTG?=
 =?us-ascii?Q?RWbtKly/l6DLt/WbXX1CQbihZJWmmvuOGam8iPkWjCFs/te7hBKCN3DXg3vE?=
 =?us-ascii?Q?gJw4PiKw1FSydPbI3tKK+C7EaKUDe9zkaVz2Kk0rMcqVNeXW2OFqH4vKCpdf?=
 =?us-ascii?Q?8Kuhgyrdteo53FrCPaXQRmWL9BKJ7h4ykIEKacUbIjvgflbgiitH7+WOyr0S?=
 =?us-ascii?Q?NAVX9w/HX9cAMmSzXoSS63BAVqIzoYhrzzTX0Hn3MJ2GJX7SyUy6ud6v8z62?=
 =?us-ascii?Q?3ZGAgdJblE9WiFOirwIAH7rh+HIeyESEKaFpWW2anG34qdYRwkTSQQp9sUDk?=
 =?us-ascii?Q?ayQ5/vRRI0uATli9qFpZt6gVfT+qJ97IG4UeT11oUdpkCGKLmFqqmiCfeE2H?=
 =?us-ascii?Q?44GNrvpYsxnFju1gQ473pmFSvlSpRQj8lNCyMTP3g3lcTKzSnS8Qdx2QyWn9?=
 =?us-ascii?Q?k/mWQ0uUxs/4L9eMcp1tORPNUm+54VicT6rcw0pfQK87bbkqVJwxZuDFmqDj?=
 =?us-ascii?Q?sy7kWk6b/OYVq+HmL5bXmU5QSZFh7jMmP7ltlOO84X1fIzxJRL8bjj1pN5HQ?=
 =?us-ascii?Q?rBdpt2jt35QtkgrowBCb3Y5LBCpOPWGBoqxNtpRv/qaLeExzvfIFTv933z5f?=
 =?us-ascii?Q?pVWD2gOgYoW5mOc60Bb58cy1eYSwxEpq1eDEE6ZSz1SR9RRf+PeqegUdJTAH?=
 =?us-ascii?Q?6tOj8L7cv+hP2fdAnhX2w4hACHcGPcm7291fLyTfDLfjaEXGzfmQYt4OYz37?=
 =?us-ascii?Q?+cEGvqJkBXqgGaWR/X45In6rdmb+JKvZ78hhcv/dbRwPwhlsKWa2sQsvaEGA?=
 =?us-ascii?Q?rJ5lNYu3QoCHAeWYnaTK+A8s4zNyb/VlL0gKUu9Z1nqLs1RyqIPSBlsfnfND?=
 =?us-ascii?Q?OiYIiKd0KOeEhoS+PI1EQnr9MFqQtbHjmCmb8nVE3HPXI8jkzJhT+pY71KQG?=
 =?us-ascii?Q?jJj6MPsASx21eCZm+MklhokmMJwu6xChQI7TKHchFfGFVJyIZLZ4e/T7Dbag?=
 =?us-ascii?Q?yeXPoPsZwrGrR5/2joQ0tLDjTkQk3okXdN3YH0wL9+xtVh8jsRzGWVenyqsy?=
 =?us-ascii?Q?Hja5VD5Slopw4WaRdDHbueGDiIcdWJPQwBSDhy5v5FucG5xIeR9hklIn7w8v?=
 =?us-ascii?Q?YfBQhETBGlBKcnxS5f5YgTDfO22v7OxLRslvrI4IGU2RIJo6KLv8gqGkspYv?=
 =?us-ascii?Q?8OV/vTkbT+iH/vGt0/fMULLmcSS1FfMOgph8MiTl7UENXBUkXMjkmUuSiWJp?=
 =?us-ascii?Q?znYj4ciqIutlXjmOifL0erKgznIQ/gnhYqPvZyroNkpN5tNZmOZCKQPjkozc?=
 =?us-ascii?Q?/n8v1jZ/uI+0Dgw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8455.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H8BfBC1bTfbB+O7CpEzWivoPkerj/5AT4HazBY3Pj5Ep07DGmrDUBai6391a?=
 =?us-ascii?Q?cL5PEYl2uOjsxl4dA71EufVsPY+YB6Y6PTVvEKTmGTa08Ydq6vqOFATZqFa0?=
 =?us-ascii?Q?nlA3K/Q+FElzKGoaG8rkOjCV0hBSO1XHlyVH6/ws8tUPS7N768d5VMGUqY7Z?=
 =?us-ascii?Q?qkzNLkDwjm3OtDIDaUzZkfoGI4G/74+bc1mddrf3ivVDiAbx6MMA8ffe2/n7?=
 =?us-ascii?Q?ghOFCMXOU2ywZJjKmUzBnxTumPVhu24wkcOUuz2BODVBz0m2v9+VQkCFbOvg?=
 =?us-ascii?Q?2qkKP+zY0q8J79puwol6EEp6kK0unnDYXlFXHbcT+Hsb0wfkA02suGrtYTy6?=
 =?us-ascii?Q?iF51b1E0t00o3F3JWsrfDgblRq61A553kQAYXWRxL0WhtWm0MpfrzC23jecj?=
 =?us-ascii?Q?XlQ7MVJ1uMXhK+lSqniOkcr1RcCjTAfz7bjs1H/KhcJNb8h5Y+fV6vD6avZi?=
 =?us-ascii?Q?3OsLaWjmQoVWd07AilTecI7/DNs/7dvHehQRVtj6zOTlzDp8mssvtuivo0eU?=
 =?us-ascii?Q?lGNPNV2wi2IvQYimRzoNFY7/Z287u/0x+4D+4N0waeUkAlvMuo9Bn/rcPksu?=
 =?us-ascii?Q?5s2rW0tP751AQXr3GwDfPMf3Z/aPtLLIBpMczmQdz8Oa1WY+uyIkmM9/XXdD?=
 =?us-ascii?Q?yLGMibxH69FpbBAJe5NS5a1iqdKgkeiOefnCNExJLCdrlTwfYZxLttTe2lik?=
 =?us-ascii?Q?k+EBFztw/Hru9xa7RxhmWaBEdSBDSNXDnvwTBC7/bzROrXutJHPspN3B4erS?=
 =?us-ascii?Q?ijWAC8n0CktLyxqdt2VLnqL9ooDSb2ZV0i046DQZSouV0n6Nplp/jbxRNFEr?=
 =?us-ascii?Q?DKo+ER01ZaKB/QHJKEDq5shuoUU99QNrlEv3nMNCY9/HTxdtJZVRKb6I6u3o?=
 =?us-ascii?Q?iCZ3jdeNbP5inunkFZMJejk6+G6AjeIziPfZwo6ykxa1dvP7UoQRZM9xZ2Jl?=
 =?us-ascii?Q?mLRq6brwhVTTPyHIJcNtLM9HeMT30N00snZi562Mmzk9pr/nyr+y2p2YsOG0?=
 =?us-ascii?Q?fstkZkF9BuygpYxKc0bzTAI4fFQ235dbD53MqF6E5v+/9tJCWztQuSM6gBpm?=
 =?us-ascii?Q?+hSzuNLtiJUzzhbV9eyOxrvi49WLKWYyIIarNod1DpQEe8v9AlH5/nvHwuu2?=
 =?us-ascii?Q?eeqwV5Ug4LJSl3Bm+FNuBfPA4D16l3EJWMohAfvMlHCnz7RbaJU0CF/H7ker?=
 =?us-ascii?Q?VwG4Sbn0mdlxLoct/SI488Eo1zTxfc/ey0mpMI6NCSAd8hmwOX4nglAYBtqM?=
 =?us-ascii?Q?dmlAp67K72CCi5NJcOXVzIBdqqEFcpCIXVV2jS8M8O+Jh6yQsXXIEmtB5+Vc?=
 =?us-ascii?Q?SivJXQghMy+1tyyFA0XKPJ3m87IOhlz/1N1xpOgHxHjbgoLAknMIuIp6o1rQ?=
 =?us-ascii?Q?/osd3XYpD/H9OMSexIXlrP56QvIzVZV5rmjOB42NOG798HNjSSJqGU8cEeDZ?=
 =?us-ascii?Q?bH/adPgygmKTH5tPT+KhknpRfua3Hde7nzN22nOsxFdJwHyeU2ergIr7deEL?=
 =?us-ascii?Q?d9CVroK09mLMjOK2+00Sm9Kkp4qO99hxpbJsTsjw01F1llI6KalUDdtFTd94?=
 =?us-ascii?Q?cp8GJAWyUMnbELvs+YL1w++wtRVATNZvw1/k4Z7a?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8455.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9d30c6-c0bf-4fc5-3994-08dd87f4cf5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 14:39:27.6917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c1AfZqM+lZD8rEgzlHcjLxwOfkkC/0tEzqEHPYnM7oRsbXBE6u0Dx+xaNwX6sjWveLynrXJYqJcxdAK54O7F9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
X-OriginatorOrg: intel.com

>
>On Wed, Apr 30, 2025 at 11:10:32AM +0000, Miao, Jun wrote:
>> >
>> >On Wed, Apr 30, 2025 at 10:15:05AM +0800, Zhiquan Li wrote:
>> >>
>> >> On 2025/4/29 22:50, Dave Hansen wrote:
>> >> > On 4/29/25 07:31, Jun Miao wrote:
>> >> >> REDUCE_VE can only be enabled if x2APIC_ID has been properly
>> >> >> configured with unique values for each VCPU.  Check if VMM has
>> >> >> provided an activated topology configuration first as it is the
>> >> >> prerequisite of REDUCE_VE and ENUM_TOPOLOGY, so move it to
>> >> >> reduce_unnecessary_ve().  The function
>> >> >> enable_cpu_topology_enumeration() was very little and can be
>> >> >> integrated into reduce_unnecessary_ve().
>> >> >
>> >> > Isn't this just working around VMM bugs? Shouldn't we just panic
>> >> > as quickly as possible so the VMM config gets fixed rather than add=
ing
>kludges?
>> >>
>> >>
>> >> Now failed to virtualize these two cases will cause TD VM
>> >> regression vs legacy VM.  Do you mean the panic will just for the
>> >> #VE caused by CPUID leaf 0x2? Or both (+ VMM not configure topology) =
will
>panic?
>> >>
>> >> Currently the most customer's complaints come from the CPUID leaf
>> >> 0x2 not virtualization, and most of access come from user space.
>> >> Is it appropriate for such behavior directly cause a guest kernel pan=
ic?
>> >
>> >The appropriate behavior would be to fix VMM to configure APIC IDs
>> >correctly and use TDX module that supports REDUCE_VE.
>> >
>>
>> Yes, I completely agree with your point to fix VMM APIC IDs.
>> The idea here is only to avoid this panic by using the guest component e=
ven when
>the host is incomplete.
>> And thereby improving the robustness of the kernel code. Moreover,
>> even if the VMM becomes complete later, the adjusted logic will
>> continue to adapt still. (^v^)
>
>VIRT_CPUID2 was introduced as stop gap until REDUCE_VE is landed. I don't =
see a
>point in getting it enabled at this stage. REDUCE_VE covers much more brok=
en
>corner cases. CPUID 0x2 is just the most prominent one because of glibc bu=
g.
>
Hmm, at this stage, I may indeed be a pressing urgency to resolve this glib=
c issues in=20
real applications from the user's perspective such as [Bug Report with Redh=
at/Rocky9.2 qcow].
The goal is to leverage existing resources(VIRT_CPUID2) to resolve this pan=
ic, and we're hoping=20
for the VMM side to prioritize implementing the ability to set x2APIC IDs f=
or each TD vCPU.
Thank you for your patient explanation again.

---Jun Miao

>--
>  Kiryl Shutsemau / Kirill A. Shutemov
