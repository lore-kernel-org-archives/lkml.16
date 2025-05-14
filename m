Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC0F274FD8;
	Wed, 14 May 2025 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223981; cv=fail; b=gjsL5kXZzZKnvqIhTw7CmNjxRU8bo4lEbjMOuRG2TWZY9YS48u3PgT2JujgGVeBTdF2EMMdBx4PWhDVuEXycCueLMR54SU2LlfH/3pYjs7RfMGNB6w8hReJ7oh/VJPAz94xTDfJTJxdYZqwFUxyS7nPjCNf1fiIQRHUneB4T3Qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223981; c=relaxed/simple;
	bh=h2U8i1m2AzgaD+FmPrL9PKSY3XJUkSRIHbK9j/U/1hQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GhMGsyndcc5sCS65oB2z5kdO3970gxZwGfIw/LVxIDBg63vRVosnrHaLhPiQ2HWqV7TqD5m8KQd6WSHVW6+S1ZmcwZJGQwB+Z+JjKt68CtmQ0FMfl7MzC/oQthWBl7oJGjGoaeWd5ORppCzxjrLirKg932E+TRCuCHwAe3tYoIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmsCFgTI; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmsCFgTI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747223980; x=1778759980;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h2U8i1m2AzgaD+FmPrL9PKSY3XJUkSRIHbK9j/U/1hQ=;
  b=EmsCFgTIIR/C+quNGlKvXXGs1by91XMIgcdBbFARPbmvBf5qYqs+spf6
   TvZCEUVabhCwSQDcjsLR4Uv7gS6wEiERyK8EaEO6oGCNOmibgHSOqZtPg
   7bJJF4AhpPlZFkBQmNGi9H1SLc7PsYSl/l643VAd+jO8wi17zNzHPiCxX
   xh+sW/iMIinrvEyKcopvQKmEa7H6zOvSOvwAGiEox+BCG3fBDYtOlNWYg
   EqammEfuH629lFGyF0ceGOwLOxj+b0nzk4cEbznIBOEvmCTOPDNR+1ZBw
   Fq2X2h63mjJdJIQWSL0MAYHOJJiMi97VFstUiTZrAOHTRGWG1jAOBk20f
   g==;
X-CSE-ConnectionGUID: 1EpheUcKQo6N99joPienWQ==
X-CSE-MsgGUID: WB1cgHr3TR2GDdTGNCpc6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49260384"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49260384"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 04:59:39 -0700
X-CSE-ConnectionGUID: G2ak7dK4R1OKHZJU9a3SAg==
X-CSE-MsgGUID: /yTJOQ+2RBGUMI+pfojBSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="143222142"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 04:59:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 04:59:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 04:59:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 04:59:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=on+tQrOmQftPZxh8NVPAECRooSoO/J91tExW2fEHJcZQbz4ihBgCwyFHEqr5XBUMpYWXZ3BWVOEdwFDKC5oyjORTQ0OJxTLlAUIUWwGXwdm9mUdBSfR7X6VjS1FtkhX0A2DcZSZNxtcPW0Ly9L9huZ0aFE0wuGBWw38pWIEM5t7Ko7DTLumhdVF+PRZ5JRwkOydRqmShdJoT1/JdMkGUxjQkttVjDwDyOudmnr71zzyBTzSkkh5JE5Fpl4kbcTYH8rqIdN5ctSri7v+TMxVJWJDUZ+EP65xpr8/oFy8ykgeEbrWz1Yv//l5j31BTUEiTohWfI24rkSr2fd7LE9Pb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kv3dWzPhWoGcqprYtKBUCezFpRonPODE9evWiRI4vJ4=;
 b=ss50CU2/MDFvwB9j/tsngx3+xXBkSTw2eG+qNOLyLcI6h+jlt575P6vhXlVGAap45QdE/Me1IFZnKQ+7gCdUjfXPh9aQimnfzA+n9ysGtAUg5FJThUSPlDx+pJujd/SqEhiyibUt+Kil6nN0tD8twPs8TGGabP/rnQGm00SmNAbzTehjPtGPXxlE7DEgLk9Eq+HGuPSUGg7N68OeFP17g7jo/yWYQAgQlkYb3mtVdBvJMFjK2HUVdIiqQRLm74nnMxshv2oXOVkCHLq54HKBLU/pA5PK3wSNKA9D5T+zcmgMzgAvM1c9p8FLVc7z0Ea54zB7xwrHR1xA24GryI483Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by LV2PR11MB6048.namprd11.prod.outlook.com (2603:10b6:408:178::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 11:59:35 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 11:59:35 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>
Subject: RE: [PATCH] soundwire: update Intel BPT message length limitation
Thread-Topic: [PATCH] soundwire: update Intel BPT message length limitation
Thread-Index: AQHbuQGaZuqgLNuH1ka4jIQTYP2M1bPSGBKAgAADZgA=
Date: Wed, 14 May 2025 11:59:35 +0000
Message-ID: <SJ2PR11MB8424160CC5BD7A2973F8AA23FF91A@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20250429122337.142551-1-yung-chuan.liao@linux.intel.com>
 <aCSBQ3HbLsGSoela@vaman>
In-Reply-To: <aCSBQ3HbLsGSoela@vaman>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|LV2PR11MB6048:EE_
x-ms-office365-filtering-correlation-id: 66c5f074-4c84-4ec1-b313-08dd92decbdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?1+7YoIr4drJ+vCVjpyWkht6oSDDU/H2jQvke4Z+Z7u0HwqA17a7Ubcw/Fa?=
 =?iso-8859-1?Q?ZxcpLndyq20tih2BIwp5C3lOYt6S23vuN5O4NH2SrDHYWqHFdLgcK4//Xw?=
 =?iso-8859-1?Q?j447cj5EKRqu7G7uMpAFHtxJfnN++TV9tKx1iR0sWCpbZpnWhqPR8iiJlt?=
 =?iso-8859-1?Q?MZ9b2HICKgLZ1Qh0wb0JRJ5ycp2ojb2ECmX0nqNgM/rIVVMlYDi8XpK4s6?=
 =?iso-8859-1?Q?Y5UAi/C7+XNNide+wZyKjM9k/jgjRLpYzim8OM5QEzAi4PWkKtqm6mnt4n?=
 =?iso-8859-1?Q?fB6+SuwWtEtDPcmEFS3oufC9U2nhuYHw1aweOKdPnL9EDt1POgdgaSiqyK?=
 =?iso-8859-1?Q?6iPpGcgKbFAvy26x4BERkDmTToX8rPzvzK9AXRd9XnfFIRlhJG5THQgdvO?=
 =?iso-8859-1?Q?Xw9hI5Bv7MCZOt7LAedAwbJxEqw6vqKjUgpxvEIflwEKwmIelLAXoU4AXe?=
 =?iso-8859-1?Q?WnM8Kz5O8G74Rvx7BeqkhXwSR90rYEozLuXdD+FVNKyUJyswyB6tOwMXu3?=
 =?iso-8859-1?Q?Mh/LTC49TpqNHrZilkvU3eZ/TgjIo5bKL8AJz6vri5IgxykGPE7ldZdBy9?=
 =?iso-8859-1?Q?Wvuq9G8tL8usIYUrvwRRPLOneYMRMmVKmHOLgUf9+zfFb8WlHO9cVV67l5?=
 =?iso-8859-1?Q?hh0QYeSSr5XS3JGn36fAIIlD2TQ+1911qI40qkbMdE1Lp17lLy3veTSP9e?=
 =?iso-8859-1?Q?FeOFmPXveK+4t0YoK1f557AGcF9AWPVWosDNkJl3edCujvlfLDpUTwwvCv?=
 =?iso-8859-1?Q?euGuBoWcUBMUU1J6tO2U7C3ronSWU0QwGhV+Xx+99kxYXDUN0ggrCEaRLR?=
 =?iso-8859-1?Q?ZHQVusvJJwaZU2D0YDNa2YdeOslO0chyeliTX+qj/5ciVmuKUsJBPgUkgd?=
 =?iso-8859-1?Q?3SE/F4HYpgSFFwZsAl7Xv91KucfMeNDT8c+CMXR0CzwY35sKOc4i9B7ROs?=
 =?iso-8859-1?Q?XfkyR250mX57KqPkrsKC7rFoIT+/dUGZ2/iLpyjvh8BeorOfHhIL/ae22r?=
 =?iso-8859-1?Q?5OVhSrXfHnDm1D5Qus5R2O8JG5BbDguIYsoujgKWpdxM2gRVvLnMgEZ8Ns?=
 =?iso-8859-1?Q?/vYq086Lp853KBq1Xf4jtwbNM54LGV+jzpdHCpNYiQU6t97euU8u1sISiw?=
 =?iso-8859-1?Q?QCfcFB9E7NU/DVyMlxQCtPjeUhpvOWGWnO7M9X1lJ5/iD4SAV2tCK2F92D?=
 =?iso-8859-1?Q?IIVH7z1GfLn6X2nOv5AfZcKSnELou6J9F+zmxgJhDt7Q6O/24qFYzcFH/B?=
 =?iso-8859-1?Q?hBiYWatCv8/h9KbiU8wcqR/O7FQDOrhg/fKNO1KvRitHwRZ4W5EPLji5wW?=
 =?iso-8859-1?Q?7a7TjEBOmSFH4X/SproO9XhmcoQst8K2atwA7tKmWX8GDWkbxw6M1iiFpu?=
 =?iso-8859-1?Q?wfBO/JD7/zwmJ45er8Ts9gsdT6gLl0lZUGQ3eZDX36WEyrQSDzmFmMVkmk?=
 =?iso-8859-1?Q?lcemSfyYv+0Z/4l+e2FOwAVW8+TE9ooYNQ7QyTvNeqWDN/W8Se6guWv9He?=
 =?iso-8859-1?Q?UN/QvLJukGImuZ16yw/FWPGpvOfqOuDz07+pdGwOmJ6BmIKsYPmgfkkRJN?=
 =?iso-8859-1?Q?0+EYvUE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MH8gxhreeGBQoCjkan0Wtg91RJ2SiR0He0B2lZ/pmbeb+f12CFkjt1Ttk0?=
 =?iso-8859-1?Q?belMEWF7hbPdqhWb3gJwr+LGs59hdUV3rQohBGrGHMV6DuWLY2qP00KAZv?=
 =?iso-8859-1?Q?0hhNNNRuv2RcxH4yG5nDCKAQqtmfz5biN4h/uNrIlWjz7VEtICB9EojFb5?=
 =?iso-8859-1?Q?RbAvG405cS+IfOjd2heoNH7gmG/32CNhf9DHdbP9sttaBt0qnVJvWgS6VK?=
 =?iso-8859-1?Q?3QZm9hF8Qsqrg4HfehQx/AJ/7IzmqhLSSHA1WHwS6QPgRvVborWKpcIbnb?=
 =?iso-8859-1?Q?dg2svYULl5ogeZZoKqna/awBI7/WbfeYEDj8D7D9czAXVKYLndYWoifJsb?=
 =?iso-8859-1?Q?WhcS7Goe8YhKGLVDi+i4if9F/iBDAK2YBGsvIXyPTKZ2CMxVJWXhEZnV2O?=
 =?iso-8859-1?Q?JGAa0F4pd2c06voPEwPmVBnGeIP42ErYazto9k0PQeZ7nanpgcp85bGQR9?=
 =?iso-8859-1?Q?cItKVFPonaYkm7gf+OIUDXlWaWtK9wvQCqvgA8jEFNkQC4e2kiAL+hIQXS?=
 =?iso-8859-1?Q?gXN6ifHArYeu/mHU9TrecCFemO6cNMwL/vgea6XDuh5AfDibHpGjLEmqNh?=
 =?iso-8859-1?Q?TMnpCimJSxNn9iPOajwUH3B09KlDOgmdWigvi5oFWZ98ID5Zxc1J3PmONv?=
 =?iso-8859-1?Q?xGjjwi+TK3lNOOL+UX94qiDslTRvHp2bpYrNty40i0B9asKdSOcH9ubMj3?=
 =?iso-8859-1?Q?c2vU60uqhaF4U4XW96N9lcvz0GTBHmiHfZl50/GQ5B3xBStSp0a8+s4Kqg?=
 =?iso-8859-1?Q?WrZgQMVoi7WZy9oA8pudKYUJogKjvkuPsiFAOZ9bc4R4cDNjjfcq/yNrJo?=
 =?iso-8859-1?Q?EyGfILyaUtqAUM5HC76r/33bfttlA/PSLdmcU31GvO8kLbVci+eS2UMQBI?=
 =?iso-8859-1?Q?irQWth5iM3FnZe/U9XChvS5EtwgqETanWPtAJ8sP+yp9hYtpbhVsKx/Deg?=
 =?iso-8859-1?Q?KwMdB7g0ynLehwxzoNnlHifg9rlCkwq3WeUqP6da6AqOI/q/d2bE6AnIje?=
 =?iso-8859-1?Q?EId8pJvU5BRHqLC4TQCNiAwODUwb3P5eQojZfioO72aMM0+kn+NwyESQdn?=
 =?iso-8859-1?Q?R6x9cNaNQph83A39IJdCyuDPOSkCFvqw4twWuZspHgOofif//kbS+aaRUL?=
 =?iso-8859-1?Q?QN7m4nF8To3RPssGc919DToCQq4nIYi6P4RG2CQW2cYLgvspIDJvE+ow80?=
 =?iso-8859-1?Q?+THmyCvNXB6CBRSS/ZqbBhK3px7GOj4tUo56aqlTxSLwiirKYgFNlOOiyB?=
 =?iso-8859-1?Q?iLx8cdMMwhkQcb5ESvNDSLP5yuFZx2PwclwKiPDvYpuJzJFbQwxQEvJ8zZ?=
 =?iso-8859-1?Q?xnU1Rlyrxa0D3wKa1UalINQIyBdOVw9TV0FXRa2GmAewv0IviI4qeMiOkX?=
 =?iso-8859-1?Q?VW6F466E+Cmm64105F3h1HokqcJLAfjogu6voM3q6znQFes++8gZ/MLQcN?=
 =?iso-8859-1?Q?SlmU5go7sGoD+tn4Tk+xlb4elmJR7SadNOlTnN6j9C+7A9WO5tYWmt4HBs?=
 =?iso-8859-1?Q?1tE2JtmcJtV/U22Yt+/dhTgkMt3ZEU2ApaLAltKAcFQt62bl9z9JfdTb7s?=
 =?iso-8859-1?Q?TDJDxU9aT49Cvlw5VYWb3Djje83nFDXCG0K+qD7YhuKXFgYrzjL9MeNA+Q?=
 =?iso-8859-1?Q?exxOdRU273ikk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c5f074-4c84-4ec1-b313-08dd92decbdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 11:59:35.7023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /SxoJuiw31cnhgGcirVH7kRKIoqgVc/rP06NORNSKUDMxjRuvRQT+2FtvBpfT9bPPbrZ1uMf7+fQ5JC7N43+Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: Wednesday, May 14, 2025 7:41 PM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: linux-sound@vger.kernel.org; linux-kernel@vger.kernel.org; pierre-
> louis.bossart@linux.dev; Liao, Bard <bard.liao@intel.com>
> Subject: Re: [PATCH] soundwire: update Intel BPT message length limitatio=
n
>=20
> On 29-04-25, 20:23, Bard Liao wrote:
> > The limitation of "must be multiples of 32 bytes" does not fit the
> > requirement of current Intel platforms. Update it to meet the
> > requirement.
> >
> > Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> > Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > Reviewed-by: P=E9ter Ujfalusi <peter.ujfalusi@linux.intel.com>
> > ---
> >  Documentation/driver-api/soundwire/bra.rst | 2 +-
> >  drivers/soundwire/intel_ace2x.c            | 8 ++++----
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/driver-api/soundwire/bra.rst
> b/Documentation/driver-api/soundwire/bra.rst
> > index 8500253fa3e8..c08ab2591496 100644
> > --- a/Documentation/driver-api/soundwire/bra.rst
> > +++ b/Documentation/driver-api/soundwire/bra.rst
> > @@ -333,4 +333,4 @@ FIFO sizes to avoid xruns.
> >
> >  Alignment requirements are currently not enforced at the core level
> >  but at the platform-level, e.g. for Intel the data sizes must be
> > -multiples of 32 bytes.
> > +equal to or larger than 16 bytes.
> > diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_=
ace2x.c
> > index 5b31e1f69591..f899c966cfaf 100644
> > --- a/drivers/soundwire/intel_ace2x.c
> > +++ b/drivers/soundwire/intel_ace2x.c
> > @@ -245,7 +245,7 @@ static void intel_ace2x_bpt_close_stream(struct
> sdw_intel *sdw, struct sdw_slave
> >  	cdns->bus.bpt_stream =3D NULL;
> >  }
> >
> > -#define INTEL_BPT_MSG_BYTE_ALIGNMENT 32
> > +#define INTEL_BPT_MSG_BYTE_MIN 16
> >
> >  static int intel_ace2x_bpt_send_async(struct sdw_intel *sdw, struct
> sdw_slave *slave,
> >  				      struct sdw_bpt_msg *msg)
> > @@ -253,9 +253,9 @@ static int intel_ace2x_bpt_send_async(struct
> sdw_intel *sdw, struct sdw_slave *s
> >  	struct sdw_cdns *cdns =3D &sdw->cdns;
> >  	int ret;
> >
> > -	if (msg->len % INTEL_BPT_MSG_BYTE_ALIGNMENT) {
> > -		dev_err(cdns->dev, "BPT message length %d is not a multiple of
> %d bytes\n",
> > -			msg->len, INTEL_BPT_MSG_BYTE_ALIGNMENT);
> > +	if (msg->len < INTEL_BPT_MSG_BYTE_MIN) {
>=20
> Reducing is fine, but we should still check it is aligned..?

Pad will be added if the message length is not aligned.
For example, length =3D 17 works on my test.

>=20
> > +		dev_err(cdns->dev, "BPT message length %d is less than the
> minimum bytes %d\n",
> > +			msg->len, INTEL_BPT_MSG_BYTE_MIN);
> >  		return -EINVAL;
> >  	}
> >
> > --
> > 2.43.0
>=20
> --
> ~Vinod
