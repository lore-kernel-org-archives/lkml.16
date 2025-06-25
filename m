Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E41285CBF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750844190; cv=fail; b=ZPrTiVaHAeMd1sWT5geTv+BtgUhydF1Mh7ffBuTcLjWxB1BA4vY/MVnyylgWgQjpthCVYM4DLaBZBCWx32jtUQPkycdYu54VCUtAkZf5MqaFBJSTXwj5p2unbODdjfToHZnEHBlhUpg8dLjlF3wAmpKC6vX7INWBdGAigCWeYTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750844190; c=relaxed/simple;
	bh=XCGh53h94FI8BaMq/sTiWgxU/hYGYixkPy7UNPlUZJI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UtMOi4GHpUGPhLTd1FraY+amO7AnfMGegSzRh844j4vjFmUveNu1jU1UC29qRgS906viEkQt+Yq0yNyjhduRcqMVDL8pAFSbCJIBwZSGXl3FuiEihSMaPEir6839Qq1fXcSD8ZLl7C7Hw/hMFtFLtYA1N5aii3eSOhTT8FRvhZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBrkx3ey; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBrkx3ey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750844189; x=1782380189;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XCGh53h94FI8BaMq/sTiWgxU/hYGYixkPy7UNPlUZJI=;
  b=UBrkx3eynAQPm6UEGLDPDXY8Y48QBD+YbEHPXl48+mECMBojo3fL0Fss
   pw5wi9Do1apAEFWkCOc7+hkIcIVzYXmHy+uL6mDNpw2X9bJEQVxyATp8S
   0Wo7NIYyG7le0Pq288iTpZoKsvA2K6flauTkgzyijmbDKnMHs6uWUIhbL
   Y7P5ndZTMBL+VFXg2Y9uw3oPMnXRPxB5o/zt+wsuWkW7TUSEEFHM3FSBO
   oekParo+9yQzE5F+5cSQyZKoj8blhJpTy3RGypGPfHebhYbvMmITj5Nfa
   vnF8aBqNQQqWZHsgrAhvtj2TJvoyjcTSqhs21DVuPUT/Hmiv1oVRYYMRK
   Q==;
X-CSE-ConnectionGUID: 3/sFZjsHROStAzgKoPirhQ==
X-CSE-MsgGUID: CLO8dl7eTG2zDFbetl4TaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52221949"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52221949"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 02:36:28 -0700
X-CSE-ConnectionGUID: O4QnoqUkSx6QDspZsW4GzA==
X-CSE-MsgGUID: yIlJMpgyQcK4KpZUan+aWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156200827"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 02:36:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 02:36:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 02:36:27 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 02:36:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzCuaLG5QivmqFL/cWwxlbaseAKUTMiHXFFFVDN0HGu7HK+rUpgZT9r7B9mEJWz6UX7YWWvyqpAoQs/+hqBLgoGAauJBYDvcR2dn1a8jv4WlYF0HYofT/K4B4Gxqtx8DuIyFUSKePg20O5sijH4YLFoBpokHh4AM3NUFlz0I9bLd225e9yb+PYxO8P6kMyifxDFQmKFvVs8IjqOmruyzMrr9NrBvh8mSB/4DPyvJUt8S5JP2NyAepKGa6tTzRhsH+GXuTAHrNniNBy1BBLtctUlr4dBCRutrxECHk4syPDV0+BmXI2TGbi4OuU0k85E1pcyYxgVuIUeT2T7d9Nr1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCGh53h94FI8BaMq/sTiWgxU/hYGYixkPy7UNPlUZJI=;
 b=Qb2bw7jbEdEd1Hn2S9xzpPArDAg45Q2KT982BAaNAqM4lvnjDlozzfIrs8IyALaYufTmOdY8juhobMuKdzC/ZtmqmZZvbQyu1ltKus0QJDNSLT2rVY/4dKCzdoHPoRvBuwUT9G+lrgRkk0K3Zs1Mjq3T3Xxh8QAW8O5o0SchAjcoOeykE+0Qrpl635J32WNt/yFhfDSNS1IB80k3ZRsund16HI3JHy3DQp8WpXdNP6I5GerbnTQxKoSSSxadOjTS7PI7NOb0/rarTHsjU4ZEpZiMjQ3Fu3jEgWHcbWuGSsnUbl/Q5yL5Pe7+/7uhCyuR+HduyF2LTGv9mpCqNyXn3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 09:36:12 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 09:36:12 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Stanislaw Gruszka
	<stanislaw.gruszka@linux.intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 06/10] mei: vsc: Event notifier fixes
Thread-Topic: [PATCH 06/10] mei: vsc: Event notifier fixes
Thread-Index: AQHb5Bv+ycDvZe7IoE2AVk3LNrtdvrQTmR9AgAAEZYCAAADJAIAAAkdA
Date: Wed, 25 Jun 2025 09:36:12 +0000
Message-ID: <CY5PR11MB6366D541BDE4C76FC24AE18CED7BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250623085052.12347-1-hansg@kernel.org>
 <20250623085052.12347-7-hansg@kernel.org>
 <CY5PR11MB6366468BAEADAB94B7286AF6ED7BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <9836099e-1162-4965-bf77-cded23fc811f@kernel.org>
 <54f17c19-63d0-41a0-9d31-aff5fb73e99b@kernel.org>
In-Reply-To: <54f17c19-63d0-41a0-9d31-aff5fb73e99b@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|DS0PR11MB8687:EE_
x-ms-office365-filtering-correlation-id: 63488d63-44dc-46c0-c847-08ddb3cbb94e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VUpoeXR0Qms2ak1aL1pub2srZnlVR3VBZkVDVUFxcitWdHYwWHhsVzMxaDVx?=
 =?utf-8?B?eGFxOHRabkR5UTVCRXl0RXZVOUVWS1RZc3lVWjNZU0VnY3BNNjZJQjdIaFls?=
 =?utf-8?B?b1hibmJKMWtRYnlqQkprcFpRNEtsZURRajFJTHNQVU5rV09VbmJhMk9MaDRu?=
 =?utf-8?B?Rk1FdElpOHFkajRMeCtNQXE5dkdvYlFSTXliUVFjcmYralB4R2RSckVJdS9Q?=
 =?utf-8?B?Q3RMbzl0bjFLNk4zMjN2S0pleisxc3RKUWcyL25XR1R0cWM2K0VVbWdtaW03?=
 =?utf-8?B?K2pjemY2Y3I0cTNlejVoM1ZpSmk4S0dURy9oQkJ3MS8xZ3FPUXlVaXVwZDVu?=
 =?utf-8?B?SkJzaGZYMzVtTHFMWUgybXdXSTZVOEh2S2lJNU5oLzVYckMrMVV5QmFXdDRn?=
 =?utf-8?B?YmtFcWJjaTlzcmZrZVhJOC9CZk5wVnY3NHpPcVllNG1aMGRiUzM5YTJOODky?=
 =?utf-8?B?UzlpQWhtSitIU0pUUmRVU2FzYzNCeGtMNVcwYm55Q0RCdWtzdlhuWm1NZnJ4?=
 =?utf-8?B?SVhqQmZWZTQ1Mm5sdUdoRklHaGRrcGxoemp2dnN4NStLenFUN0MxQlJUdnM5?=
 =?utf-8?B?Q2R6aE43UEpJSWk3b3JCS0xsY3ROc1F4QmxqYlpPSjl4R3RIZTZMeTJjQy9y?=
 =?utf-8?B?WlBQbU94emJwS3NsNWEzODhHNnkwRERtQXhDSFpreXlBcU1ad3RralpGWmZs?=
 =?utf-8?B?cXlHUkxyc2VaTmNvMWxDNEM0OCszRXUzSWFJMjZwZXZvRDB6MWZuRUh3ZUNJ?=
 =?utf-8?B?Sm8rVWMxOXQ0MzFseGg3b3BobGdPN0E5ZGtqTUczMGFUbi8rQ2lMZFh2L1gr?=
 =?utf-8?B?UGFqZmZxazFleU5VMEtxR3pwUnhvdnhtWHF3RG9MVUd2STg5TEdSaVgycFFI?=
 =?utf-8?B?RHNvV21zNnA5L0hQc2p6ODNTdmxGVVBabktJemt1anVkUzJVbGpUSkY3SGVX?=
 =?utf-8?B?bGNLR2Y0RlZaM2xHN1l6aTdLWFZRVmV1OTE3a1FmNEVPN1gxUG5wSWx0TnFW?=
 =?utf-8?B?NVhMeUFVejlCN21QK2ZPTGd0TmZ1ZU51MVJNOUVLbjhNRnk1RlFCcmtXSWx2?=
 =?utf-8?B?YWZua2pBZFVWNm1lYWRkVENNWmlzbXF2cDF3aklMSlNTRHVlMU96ZkR0S0hi?=
 =?utf-8?B?dnNwM1pxanVLei9UR3dEcEszQmd6OFh5OE42dy8xOHppU0JIVllheGR3cTJJ?=
 =?utf-8?B?ei9tT01CYjN1OThYUjRjLzlrZlJkWXg1QlNhQWJWZWtFY3dPTkhKdm92TFc5?=
 =?utf-8?B?NkNXaFJKQmt1SE5mSG51ZXNhZVZXOTZ5a09MczUybkJTM2c4RU96NVg3NnND?=
 =?utf-8?B?VGNtUWhackdFMDFYYkF5QU1zR0lvakcvQUFqaFZrd0FCZUViTldpZ2lDSTVz?=
 =?utf-8?B?WXlGNzBxZWcweS9RQWlDYmticG5OR3R2aFVaS2FPM0FscEg1VjhmVGluRHov?=
 =?utf-8?B?Zm5QaVpMZ0FNK3lKbDMvcUVkVEdKSEhxVGs4WEpJOG9sS0xGckRhVCtrczh1?=
 =?utf-8?B?OGxuRHN3MktURXFMNjNhWEhhVEFoTTNudDIrQkVTaW5yb2NzdzV3b0YvVWox?=
 =?utf-8?B?TGt0WWllajdWRy95MHYzYjhJaXo2WEdZemYxeHVhbW1GbTErdCtIcDByQ3gv?=
 =?utf-8?B?Zm1odER4SjVCOXRVNFBpVlBVNnlXOGNaWitEZjg4OFpUekFsNkZKN0pOOTAz?=
 =?utf-8?B?ZTZ3SWVndTJyQWV5K2hSTi9IODI5RHZzU3ZUUzJ1OXA2d29waWNnUHhJYk9T?=
 =?utf-8?B?S1FGQ2RibXlnYWMwY0pwZ0d1bWdZQkdvNW5lK0JtcEFoNGRPNTJzZXc1Ulkw?=
 =?utf-8?B?Z2lLK1ZOb1N1LzQyWjkzQjJzQVJQUGFIY281ZmJWTkZYK3VTQ2lwUm9haHF4?=
 =?utf-8?B?aEUvNHdaODVZV1lDNEZPWkFxUzR4ZCtvRFJaTVBwT1RuVmZFZ0d4Qkk1MnFR?=
 =?utf-8?B?dm1ud1RSVDFhT2tNT2oxbFNGWUEveGVnaTFZeS9ZUWhmTUNKTys2RTJEYmZk?=
 =?utf-8?B?RExXWVJ6L3N3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czRhVHAwYU5MMGljK3dEZ3o4WmpPR284KzFrL1dGa2RDcXo2dG52eFVLMkVp?=
 =?utf-8?B?UFl3Mk16d2FTaXlaaFVCMFE1VHdIQ3BEdi9rSDAyRHpFUjUwbW9mT3ZuOXhI?=
 =?utf-8?B?eWpKNmVCc3U1Yy9qMGE2dmxPQVlnUS9XTUZ0U2tkR0dWSVFRVHdiNG0zN0gv?=
 =?utf-8?B?dU1URENTZlcySTJwSDJibjFyb1FhMHRKU3FZU2Joek9KcFl1N0pJay9iYjJq?=
 =?utf-8?B?Vjk4V1FpQ0N4YytLYXd5RjlmS1NUWjlmVmM0SHlOMmphQ0lkNStOWUJPTlJR?=
 =?utf-8?B?SmxldmVXK2xyNUpBdS91R1p4bU1qM1c2MzZlOHdaZkdVcFhMRlBsQXdEUG5G?=
 =?utf-8?B?aHlOeCszZTFKQ2JUNHlDbm5RaWtGbXZjY2xBaG9UUmU3QkV6alB0NisvZ0hl?=
 =?utf-8?B?bmpTcXY0bUxxdDcrOEVNblowNFhUb2MzUFJxQndSRStxNlY0OWY3YlVZbW9S?=
 =?utf-8?B?emtxRDFRcm4rc3NXUGVDbWw3R2hUSXpweExvRG9qdGphMC90WHhVbTFzTEtK?=
 =?utf-8?B?SERISnBhS2ROZlhZQlpTc3hXdU9TUDA5a3VVVkdMZld6NHoyUDQvck9jbG0z?=
 =?utf-8?B?S0NyQmNCSlIrd0cwZGRCaTJmWXQ2SldMbmtiMFgrY1FlOHFnQ2xkY1c4TjUv?=
 =?utf-8?B?Vlg2S3F6VjdqdkkvV3RoTVczRndrdzYxbjB0WE5OSTR5T0xueDVnMU8xaEdz?=
 =?utf-8?B?QTBWN0l6b243OFNhbTBSQnBSNWd0UFA4a0xUOWYvT2VZTXJRTTVTTjNzNzcv?=
 =?utf-8?B?cjdHMXJtbFpiK2hUZzNmUkJUdU0zTFZlQUZxZm5VVjhlTE5zMUtTUjNWWVZU?=
 =?utf-8?B?U29pRG5FYWpLOUgyNXhEVXpHTEVYKzdqRkxPbFVQU1pLNzlQVFJFcTVxNUM2?=
 =?utf-8?B?aENwQURVcms0MzJKczJhZTZUVmZVT2s0ckpEN2g1L2FzOUUvOURRb2R4Vmhl?=
 =?utf-8?B?VGJ1WmJNVGtlRlJVcVZ2eG9IQnNUeG05MWdVTStsOXlkZzFwS2hHL0lHNXpB?=
 =?utf-8?B?YWxLVkdrSXVmaUlTV25DL2YyUVNFejJCRGpSQUZiWWljbllzMUw1a2syblF4?=
 =?utf-8?B?Z3FrY0JjMis5Yy9lam93VE11cnRtR2hlTDk4ODVnVmlyZjYwME1WdVgvQmxl?=
 =?utf-8?B?OFVaV1k1M2RkQmhtbTg2MXlBeUpQc0dic0ZxQnoxb3JESFF6UDVoMVZ1SW0v?=
 =?utf-8?B?WXp3MEpoZzN3VFRQMzhBQUJzcUxqcjNabkJ3L0liVkMzRFFLa01yWE0wcTIx?=
 =?utf-8?B?Z0Ztb3ZrdlMzdnV4RHlkdzRqOXYzTlkvbmtkcUFlZXVkTTVXU3lheWRJN3FY?=
 =?utf-8?B?dDlUK0VBWHhnNnlYVWprdE5YcjJLUVZUdlk3cjRsaGZhSCtFQTVsbVlVSk1n?=
 =?utf-8?B?QkhvczJiS0crT2p2Z2VHYmoxeXVhdld3aU53UFpyenk1UUNleUV0NXFZWWNN?=
 =?utf-8?B?SkhzMzIxTDJFc1hrZmk1SnhnWXBJUmlRMjB3SmFmcHh2Wmp4T2wvWSt2WmFk?=
 =?utf-8?B?RTRJYmlTdlp1WVJMejdwZlI5enU2STRMZXBYVDFydURTVVhVVVl2Um1jVWxK?=
 =?utf-8?B?K1RlYmlWTlBVNjZ0WDE0SUtiUUFqT1pTMnVncm5ENnVPb3gzWnhIRGFkdi90?=
 =?utf-8?B?WWRKNmFSNFVFMGEvMDhQUjNxeGdkWmJRVDhodWRoOGxUY05JOHl3dktuVUcw?=
 =?utf-8?B?MFYvK3VPd2libHI3a3ArMTB1a1pBQWViQ0ZEbXY1Y1RYYXR1ZlhQUzU0TkxN?=
 =?utf-8?B?MEw3TzVvL29DTW4vWEthNXo1Qm5RZ3RQQWVjeUx6V3ZzdW85ZUNqNFVNVE1a?=
 =?utf-8?B?OWtxVFdUTlZGM1NQc25pSG5salBNY0hNRENGcWRWSE4wRVFtb1R5K1M5bXF6?=
 =?utf-8?B?QTA1Tk5SNXVXVWEwaE1JUHRyU1htWWFaTWViRy9iSks2V1J4NjNDbFErL1BN?=
 =?utf-8?B?UndBQ1I4d0tnVXZpTDNKbVdCcSsyRWF0RmxJSWw1bFJ4U2RPeW5PMG9ZMjNE?=
 =?utf-8?B?R285YVpyc3dTYmRpTG9HSlBIamc1TjB0M2ZYMU1Ub09ZeWtTanltS010V0dD?=
 =?utf-8?B?MWJ5aGdkV3B5RzUrZGNxOGZkUXpIMDY4bFFlSXpRdlFON0FYd3RsbXlXWjZJ?=
 =?utf-8?Q?vxSXj8NXkbr5ArO0w84c1bbaA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63488d63-44dc-46c0-c847-08ddb3cbb94e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 09:36:12.4994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysjq9/mTf2nmGPzavUblhKhMfiJTwGTpXv9eEF58p92QvgLt/bRt9Vyd0re0mo6+XxxyJCX56xGmVi73TaLclQ1tRogRPRmfHrtE05cSxjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW1BBVENIIDA2LzEwXSBtZWk6IHZzYzogRXZlbnQgbm90aWZpZXIgZml4
ZXMNCj4gDQo+IE9uIDI1LUp1bi0yNSAxMToyMyBBTSwgSGFucyBkZSBHb2VkZSB3cm90ZToNCj4g
PiBIaSwNCj4gPg0KPiA+IE9uIDI1LUp1bi0yNSAxMToxMiBBTSwgVXN5c2tpbiwgQWxleGFuZGVy
IHdyb3RlOg0KPiA+Pj4gU3ViamVjdDogW1BBVENIIDA2LzEwXSBtZWk6IHZzYzogRXZlbnQgbm90
aWZpZXIgZml4ZXMNCj4gPj4+DQo+ID4+PiB2c2NfdHBfcmVnaXN0ZXJfZXZlbnRfY2IoKSBjYW4g
cmFjZSB3aXRoIHZzY190cF90aHJlYWRfaXNyKCksIGFkZCBhIG11dGV4DQo+ID4+PiB0byBwcm90
ZWN0IGFnYWluc3QgdGhpcy4NCj4gPj4+DQo+ID4+PiBGaXhlczogNTY2ZjVjYTk3NjgwICgibWVp
OiBBZGQgdHJhbnNwb3J0IGRyaXZlciBmb3IgSVZTQyBkZXZpY2UiKQ0KPiA+Pj4gU2lnbmVkLW9m
Zi1ieTogSGFucyBkZSBHb2VkZSA8aGFuc2dAa2VybmVsLm9yZz4NCj4gPj4+IC0tLQ0KPiA+Pj4g
IGRyaXZlcnMvbWlzYy9tZWkvdnNjLXRwLmMgfCAxMiArKysrKysrKystLS0NCj4gPj4+ICAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4gPj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvbWVpL3ZzYy10cC5jIGIvZHJpdmVycy9taXNjL21l
aS92c2MtdHAuYw0KPiA+Pj4gaW5kZXggMGZlZWJmZmFiZGIzLi43NmE2YWE2MDZhMjYgMTAwNjQ0
DQo+ID4+PiAtLS0gYS9kcml2ZXJzL21pc2MvbWVpL3ZzYy10cC5jDQo+ID4+PiArKysgYi9kcml2
ZXJzL21pc2MvbWVpL3ZzYy10cC5jDQo+ID4+PiBAQCAtNzksOSArNzksOCBAQCBzdHJ1Y3QgdnNj
X3RwIHsNCj4gPj4+DQo+ID4+PiAgCXZzY190cF9ldmVudF9jYl90IGV2ZW50X25vdGlmeTsNCj4g
Pj4+ICAJdm9pZCAqZXZlbnRfbm90aWZ5X2NvbnRleHQ7DQo+ID4+PiAtDQo+ID4+PiAtCS8qIHVz
ZWQgdG8gcHJvdGVjdCBjb21tYW5kIGRvd25sb2FkICovDQo+ID4+PiAtCXN0cnVjdCBtdXRleCBt
dXRleDsNCj4gPj4+ICsJc3RydWN0IG11dGV4IGV2ZW50X25vdGlmeV9tdXRleDsJLyogcHJvdGVj
dHMgZXZlbnRfbm90aWZ5ICsNCj4gPj4+IGNvbnRleHQgKi8NCj4gPj4+ICsJc3RydWN0IG11dGV4
IG11dGV4OwkJCS8qIHByb3RlY3RzIGNvbW1hbmQNCj4gPj4+IGRvd25sb2FkICovDQo+ID4+PiAg
fTsNCj4gPj4+DQo+ID4+PiAgLyogR1BJTyByZXNvdXJjZXMgKi8NCj4gPj4+IEBAIC0xMTMsNiAr
MTEyLDggQEAgc3RhdGljIGlycXJldHVybl90IHZzY190cF90aHJlYWRfaXNyKGludCBpcnEsIHZv
aWQNCj4gPj4+ICpkYXRhKQ0KPiA+Pj4gIHsNCj4gPj4+ICAJc3RydWN0IHZzY190cCAqdHAgPSBk
YXRhOw0KPiA+Pj4NCj4gPj4NCj4gPj4gVGhlIG11dGV4IG92ZXJoZWFkIGxvb2tzIG91dCBvZiBw
bGFjZSBoZXJlIGluIHRoZSBpbnRlcnJ1cHQgaGFuZGxlci4NCj4gPj4gTWF5YmUgaXQgY2FuIGJl
IHJlcGxhY2VkIHdpdGggc29tZXRoaW5nIGxpZ2h0ZXI/DQo+ID4NCj4gPiBVc2luZyBtdXRleGVz
IGluICp0aHJlYWRlZCogaXNyIGhhbmRsZXJzIGlzIHF1aXRlIG5vcm1hbCwgZS5nLg0KPiA+IGJv
dGggdGhlIFNQSSBjb3JlICh1c2VkIGFzIHRyYW5zcG9ydCBoZXJlKSBhbmQgdGhlIEkyQyBjb3Ig
d2lsbA0KPiA+IHRha2UgKyByZWxlYXNlIGEgbXV0ZXggZm9yIGVhY2ggZGF0YSB0cmFuc2ZlciBv
dmVyIHRoZSBidXMgYW5kDQo+ID4gYSB0aHJlYWRlZCBJU1IgaGFuZGxlciBtYXkgZG8gbW9yZSB0
aGVuIDEgZGF0YSB0cmFuc2ZlciBmb3IgYSBzaW5nbGUNCj4gPiBpbnRlcnJ1cHQuDQo+ID4NCj4g
PiBBcyB0byB1c2luZyBzb21ldGhpbmcgbGlnaHRlciBJIGNvdWxkIG5vdCBjb21lIHVwIHdpdGgg
YW55IGxpZ2h0ZXINCj4gPiBzb2x1dGlvbiB0aGVuIHRoaXMuDQo+IA0KPiBwLnMuDQo+IA0KPiBJ
IGZvcmdvdCB0byBtZW50aW9uIHRoYXQgdGhpcyBpbnRlcnJ1cHQgYWxzbyBkb2VzIG5vdCB0cmln
Z2VyDQo+IHRoYXQgZnJlcXVlbnRseSB0aGF0IHdlIHJlYWxseSBuZWVkIHRvIHdvcnJ5IGFib3V0
IG92ZXJoZWFkLg0KPiANCj4gVGhlIFZTQyBzaXRzIGJldHdlZW4gdGhlIHVzZXItZmFjaW5nIGNh
bWVyYSBhbmQgdGhlIEludGVsDQo+IENQVS9Tb0MncyBDU0kyIHJlY2VpdmVyLiBTbyB3ZSBvbmx5
IG5lZWQgdG8gdGFsayB0byBpdA0KPiAoZ2VuZXJhdGluZyBpbnRlcnJ1cHRzKSBvbiBwcm9iZSgp
IGFuZCB3aGVuIHN0YXJ0aW5nL3N0b3BwaW5nDQo+IHN0cmVhbWluZyB2aWRlbyBmcm9tIHRoZSBj
YW1lcmEuIEVhY2ggc3RhcnQvc3RvcCB3ZSdsbCBnZXQNCj4gYSBidW5jaCBvZiBpbnRlcnJ1cHRz
IGJ1dCBvdXRzaWRlIG9mIHRoYXQgdGhlIGludGVycnVwdCBuZXZlcg0KPiB0cmlnZ2Vycy4gU28g
b3ZlcmhlYWQgaXMgbm90IHJlYWxseSBhIGJpZyB3b3JyeSBoZXJlLg0KPiANCj4gUmVnYXJkcywN
Cj4gDQo+IEhhbnMNCj4gDQo+IA0KPiANCj4gDQo+IA0KPiA+IEFsc28gbm90ZSB0aGF0IHRoaXMg
aXMgbW92ZWQgdG8gYSB3b3JrcXVldWUgbGF0ZXIgaW4gdGhlIHNlcmllcywNCj4gPiBzaW5jZSB0
aGUgdGhyZWFkZWQgSVNSIGFjdHVhbGx5IHdhaXRzIGZvciB0aGUgd2FrZV91cCgpIGNhbGwNCj4g
PiBkb25lIGJ5IHRoZSBoYXJkIHBhcnQgb2YgdGhlIElTUiBhbmQgYW4gSVNSIHdhaXRpbmcgZm9y
DQo+ID4gdGhlIGludGVycnVwdCB0byB0cmlnZ2VyIGEgc2Vjb25kL3RoaXJkLy4uLiB0aW1lIGlu
c2lkZSB0aGUgSVNSDQo+ID4gaGFuZGxlciBpcyBqdXN0IHBsYWluIHdyb25nLg0KPiA+DQo+ID4+
IEJUVyBpcyBpdCBwb3NzaWJsZSB0byBoYXZlIGludGVycnVwdCBiZWZvcmUgY2FsbCB0byB2c2Nf
dHBfcmVnaXN0ZXJfZXZlbnRfYw0KPiA+DQo+ID4gVGhlIGludGVycnVwdCBnZXRzIHRyaWdnZXJl
ZCBieSBhIEdQSU8gY29ubmVjdGVkIHRvIHRoZSBWU0MsDQo+ID4gc28gaWYgdGhlIFZTQyBpcyB3
ZWxsIGJlaGF2ZWQgdGhlbiB0aGUgaW50ZXJydXB0IHNob3VsZCBub3QNCj4gPiB0cmlnZ2VyLiBC
dXQgd2UgY2Fubm90IHJlYWxseSBjb3VudCBvbiB0aGF0Lg0KPiA+DQo+ID4gUmVnYXJkcywNCj4g
Pg0KPiA+IEhhbnMNCj4gPg0KDQpMb29rIGxpa2UgYmV0dGVyIGJlIHNhZmUgdGhlbiBzb3JyeSBo
ZXJlLCBsZXQncyBhZGQgbXV0ZXguDQoNClJldmlld2VkLWJ5OiBBbGV4YW5kZXIgVXN5c2tpbiA8
YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPg0KDQo+ID4NCj4gPg0KPiA+Pj4gKwlndWFyZCht
dXRleCkoJnRwLT5ldmVudF9ub3RpZnlfbXV0ZXgpOw0KPiA+Pj4gKw0KPiA+Pj4gIAlpZiAodHAt
PmV2ZW50X25vdGlmeSkNCj4gPj4+ICAJCXRwLT5ldmVudF9ub3RpZnkodHAtPmV2ZW50X25vdGlm
eV9jb250ZXh0KTsNCj4gPj4+DQo+ID4+PiBAQCAtMzk5LDYgKzQwMCw4IEBAIEVYUE9SVF9TWU1C
T0xfTlNfR1BMKHZzY190cF9uZWVkX3JlYWQsDQo+ID4+PiAiVlNDX1RQIik7DQo+ID4+PiAgaW50
IHZzY190cF9yZWdpc3Rlcl9ldmVudF9jYihzdHJ1Y3QgdnNjX3RwICp0cCwgdnNjX3RwX2V2ZW50
X2NiX3QNCj4gZXZlbnRfY2IsDQo+ID4+PiAgCQkJICAgIHZvaWQgKmNvbnRleHQpDQo+ID4+PiAg
ew0KPiA+Pj4gKwlndWFyZChtdXRleCkoJnRwLT5ldmVudF9ub3RpZnlfbXV0ZXgpOw0KPiA+Pj4g
Kw0KPiA+Pj4gIAl0cC0+ZXZlbnRfbm90aWZ5ID0gZXZlbnRfY2I7DQo+ID4+PiAgCXRwLT5ldmVu
dF9ub3RpZnlfY29udGV4dCA9IGNvbnRleHQ7DQo+ID4+Pg0KPiA+Pj4gQEAgLTQ5OSw2ICs1MDIs
NyBAQCBzdGF0aWMgaW50IHZzY190cF9wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQ0KPiA+
Pj4gIAkJcmV0dXJuIHJldDsNCj4gPj4+DQo+ID4+PiAgCW11dGV4X2luaXQoJnRwLT5tdXRleCk7
DQo+ID4+PiArCW11dGV4X2luaXQoJnRwLT5ldmVudF9ub3RpZnlfbXV0ZXgpOw0KPiA+Pj4NCj4g
Pj4+ICAJLyogb25seSBvbmUgY2hpbGQgYWNwaSBkZXZpY2UgKi8NCj4gPj4+ICAJcmV0ID0gYWNw
aV9kZXZfZm9yX2VhY2hfY2hpbGQoQUNQSV9DT01QQU5JT04oZGV2KSwNCj4gPj4+IEBAIC01MjMs
NiArNTI3LDcgQEAgc3RhdGljIGludCB2c2NfdHBfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNw
aSkNCj4gPj4+ICBlcnJfZGVzdHJveV9sb2NrOg0KPiA+Pj4gIAlmcmVlX2lycShzcGktPmlycSwg
dHApOw0KPiA+Pj4NCj4gPj4+ICsJbXV0ZXhfZGVzdHJveSgmdHAtPmV2ZW50X25vdGlmeV9tdXRl
eCk7DQo+ID4+PiAgCW11dGV4X2Rlc3Ryb3koJnRwLT5tdXRleCk7DQo+ID4+Pg0KPiA+Pj4gIAly
ZXR1cm4gcmV0Ow0KPiA+Pj4gQEAgLTUzNyw2ICs1NDIsNyBAQCBzdGF0aWMgdm9pZCB2c2NfdHBf
cmVtb3ZlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpDQo+ID4+Pg0KPiA+Pj4gIAlmcmVlX2lycShz
cGktPmlycSwgdHApOw0KPiA+Pj4NCj4gPj4+ICsJbXV0ZXhfZGVzdHJveSgmdHAtPmV2ZW50X25v
dGlmeV9tdXRleCk7DQo+ID4+PiAgCW11dGV4X2Rlc3Ryb3koJnRwLT5tdXRleCk7DQo+ID4+PiAg
fQ0KPiA+Pj4NCj4gPj4+IC0tDQo+ID4+PiAyLjQ5LjANCj4gPj4NCj4gPg0KDQo=
