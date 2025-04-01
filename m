Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B532C84039
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535956; cv=fail; b=fQwH2iquM0CskURIt0XAQp6E+QozJgzXRfdgQp6pnOEHzksAg8tW9njrTSsRmpidkNzcSrOLcJ+AHtpJ2k8OBbR/9cYWirhAXjDZiiB1ghLg/aQTEax8Kn15V8mdF5gy6uf8SZkOyN5lne50YUE/iFCPJ7JfzIXHiNjwLuTvNjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535956; c=relaxed/simple;
	bh=mCjJxazpt71ITakgqRpUqVj5rl8FuHPQpNVqWOTLtYg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=POc5We2xglznQIysCYQP6rncPiA3df0UmftPrH/bpzawUoqBfLYVINTZwSbMPAKiJ+tmfFKofNU8OvnGr3wkrbSfkk6t7whdmPysyUn1ZDBp8E/L+7R+aKxAAJS0l9w0fpvK0NGz1rJGV5l9gYkTXhCZbQqLL9T3/vQMoE8huEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=httRwTO/; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="httRwTO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743535954; x=1775071954;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mCjJxazpt71ITakgqRpUqVj5rl8FuHPQpNVqWOTLtYg=;
  b=httRwTO/fpOhPhQusPFUH6WarxyaEoCPi0RXUvMT+OdZQ/MfGCxZ5M+M
   LxLv3PiQVx/si1w9VqDrlxY9ZDsY5XUCgrd3FMsQzxHzdBuRkWJsr176S
   jepGGsARfvl3+eOAQHdVLhMcsl4aPy7Os49pO1dureBkeCKFi5NymHDWu
   hlFGO4WTj94E5+iV9Xz+JEmcoRtDmqLAXoDBX1Efn5hiVqvkRMVAg2ZFg
   /bN6eZ3rYGG9EjAZX9xK7Y163jw8A1EsTsWAqcuI+tHamMbTwat2Exa6u
   1ri+EkV1faiBov04s8pHGsEzBp4LRjJuKPQGgh202UBpo4uOXKCRf4DLr
   w==;
X-CSE-ConnectionGUID: rPBh5XFITnGMZQVr5x+VdA==
X-CSE-MsgGUID: ZAMUjF31QNy6pQDdHY+QEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="62411986"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="62411986"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 12:32:34 -0700
X-CSE-ConnectionGUID: azOg4WiOSfuCPFHCS+jktA==
X-CSE-MsgGUID: Wtq2qDJ6ThyyRa0v2uMsUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="131479248"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 12:32:33 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 1 Apr 2025 12:32:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 12:32:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 12:32:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGTWXukIo5khGLVFwyPsitryXcCHLTFYg7sBao2ViLOjnOvAXO92VrEonPWxnX1d8TWNPt3WicKYv9hEahdh75GWnbR/vp+A1HNmvwD6Q99idCMyEKqRDKRHnTLx5KVcTYmb4zPQkN1R97o3QKWBCOhTnDj+my3mPmYJZW+mwoVQclLZJB303XODz+FzO3Nf0spuTwdXV7qcQziVcOJ2BkKFeSIJswuYb2ClKKAikmXdiRlQRtbiPOBFDdzVPtmHF1rce3YhWvOx0I25vjJO2AApDtdH0E7UcjF0Tq8wZQbQta06SlYbVCFsPY/iBnLWtMUp3gJ4Lk/cLTl9k3ULpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCjJxazpt71ITakgqRpUqVj5rl8FuHPQpNVqWOTLtYg=;
 b=O1SWiLZYiML+KgABaCgtsFfn44S6rUu7/H3BVq0ubmT5P57CGLXUty4eaud1EWvHrav4xMDB9o3/P8fBfwdWpvSluWMVniX1Z5Sg7XOcxZuR1FX/uLiaUgwOUeL4O4CeJqe8S9Ff30m4lde/3g039sghQQfEy7Jh3KMLhqs5VrXaZOc+e093khe23UvxwUyYz9nXybkA+LeZLCjKATq/i1xirIK3/6FwKmul7LW2W3Dj5T6NiqgMNFI0l9VA5+90sz9XOybYwK9sbW9o2ax9SVzzzL6OvrBJWGAQxqhpaAeiVWYDHfmo4yyA4gIsVw7NCM7sXZ9jPBTiwW9pkZvpfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8383.namprd11.prod.outlook.com (2603:10b6:610:171::6)
 by LV8PR11MB8722.namprd11.prod.outlook.com (2603:10b6:408:207::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 19:32:09 +0000
Received: from CH3PR11MB8383.namprd11.prod.outlook.com
 ([fe80::56d4:6f50:dd04:d11b]) by CH3PR11MB8383.namprd11.prod.outlook.com
 ([fe80::56d4:6f50:dd04:d11b%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 19:32:09 +0000
From: "Falcon, Thomas" <thomas.falcon@intel.com>
To: "ak@linux.intel.com" <ak@linux.intel.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "acme@kernel.org" <acme@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "kan.liang@linux.intel.com"
	<kan.liang@linux.intel.com>, "Hunter, Adrian" <adrian.hunter@intel.com>,
	"namhyung@kernel.org" <namhyung@kernel.org>, "irogers@google.com"
	<irogers@google.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "Eranian, Stephane" <eranian@google.com>
Subject: Re: [PATCH V4 0/5] Support auto counter reload
Thread-Topic: [PATCH V4 0/5] Support auto counter reload
Thread-Index: AQHbn1HDWfR4HXXdwkyWE3gfyNvO77OPOt8A
Date: Tue, 1 Apr 2025 19:32:09 +0000
Message-ID: <a6a3e0b4f9e18d6433a26a5ff9fa0c2ff767f7d7.camel@intel.com>
References: <20250327195217.2683619-1-kan.liang@linux.intel.com>
In-Reply-To: <20250327195217.2683619-1-kan.liang@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8383:EE_|LV8PR11MB8722:EE_
x-ms-office365-filtering-correlation-id: ce069eea-6ccc-4d26-347f-08dd7153e506
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?dXlFV3I5UTlTSGh5T3JuSFRGMUxCZ2l4cFI4KzRTN00zVFNtOVVteWNhRUdU?=
 =?utf-8?B?R1hEZlZvTHR0ZFdaYXJTZ0ErblMrd0hyRDdsMnprZDNncmk0RFBPNDJHK3By?=
 =?utf-8?B?NGl1aWw5dDdlb09od0RYbjFuVHhoSDJFN0JwN3FISWt6M1BtQzlzaUdObkxt?=
 =?utf-8?B?WHJvbEYrczJNWndtd0tJUWFWVEwzL2VSaVloci9ZQWQ5UU9uamo4azVGZU8x?=
 =?utf-8?B?YmVndmU3YVRMbE9uQ2o3ZTBFY2xyNll1T2pFTGJCVndVRHU0Y2lWd2srUTg5?=
 =?utf-8?B?by9IQjRYL05FOUVJQm5FTGFweDduYnVEUnJWZHV6d3VQaXNpT01URHU3UlIv?=
 =?utf-8?B?ZUZ3NFZvNXQ4R04rMkQwLzVEUUVySEpJdVpiRzJnU3RvY3BQTllvRHZzR1Rw?=
 =?utf-8?B?cm8zREMxVTY1OVRlMGVyYUg4Y0x6SjVYcGdubERGQ2E4YmxWS1dwQUQ3bUtq?=
 =?utf-8?B?bDJLd1N5aGZGdGNOT01LZUpoY3JmZHNiVkVxSWRUYzlIMWZ4ZEpvbWF4OGdU?=
 =?utf-8?B?ZGE2RndpSVZMR3lIQTJwcHNzZ1lkaUEwZnZQQkJuYVJ1ZVBPYXEyTUtPb0Fi?=
 =?utf-8?B?YjFwdVBJalp0OGhyY3JWOWhUVFBCYlJxQUthSnNUR210bHIrNTc0Ti9acnZh?=
 =?utf-8?B?Rjg3WWJ4Rmx4aWNEUXhrbm8rVFppWWdXY2NtWnFMSjB6TW5oTloxZjAxbTlZ?=
 =?utf-8?B?dXd5U1dxdFRBMER3VTA1bWROOHNVYWRUTGxyVHFzZVpKNWhYRmNEOXFpalEx?=
 =?utf-8?B?RHJmYWEyTzhQemRPdlVhYmFTZVNoY2xZdkpoc1pEVGtBRUd0dDVld0tabmRY?=
 =?utf-8?B?a3NreGpFSGVscEpRNmVSOWttbk1wbXlobm5IdXl0UTNsRU1qbVNYekVSdU42?=
 =?utf-8?B?NzJ5bHZWSHhJZEdBS25lcXAzNjdoL094ek5CVWJYZ1lhMDNUemtsWnNVeDhN?=
 =?utf-8?B?TDRJOHRRa0Y0bEtpb2o1ME8yRldLSzF3V3hjT3lhUTR3SDNYKzlDcERUTjVZ?=
 =?utf-8?B?NG5VVkZGQTZMV25tczZqY0tDMmlQaGtzSzVuSGIvSXg5aWw5ZWVTRzBBUDl5?=
 =?utf-8?B?VWxuQUlnQWt1UXZlekM1V3h3NUcxUFRNYzJCTyttSFIvNG5WWTdOeE40c1Ri?=
 =?utf-8?B?NkNFTGMxbXpDWVRSZzh4bTFEMUJnSktzZG5MUGZMOTNGR0c2Q2dPMHhIREN3?=
 =?utf-8?B?T2FBd2hCSGhaVTM3Y2NVUkh3QlNPeWZ4ZXFoU0FZMFMxWlM0bVc2VmVGVkZo?=
 =?utf-8?B?SkxjUHkvVVk1aUNEcEVoamNWR25IMDhITHZyWEpmaXphbDNMV3hkbXpuVXVG?=
 =?utf-8?B?c1JoYWlKVmZNT0IyMmUvUVJkSzhRSUNjUGtkc2wyNXA3Rk1DS296ZSsrdlpv?=
 =?utf-8?B?bVlMVi9lTUR2djkvUWZDNDBiblVvTjhxSW56WlMzSnpwSWZlZnNSREcvRVM4?=
 =?utf-8?B?L0dJKzVJZTBNWGozUmFQS1pKY3NDdHN6dGFvNERXMmZBYnRac3BTN1IzS0gv?=
 =?utf-8?B?WHZmMFhVSUlRemRIcUFpWDJ5WDgyMlY4THZ5cnZqUzNuV2xlVmxFZzlLbTY0?=
 =?utf-8?B?L3phYlJ4NGwyS2N1b0xDOVE1SHBvNDJCbkdoanNJYUhHbTc0UEpkd25GQUdp?=
 =?utf-8?B?dUhNSHcyMFlkUDdPU2dORmVDVllodmszeHhlUGtWekdsYTYvYnpKbnlqZ1Ny?=
 =?utf-8?B?cFl4ek5lbDI0NjVBTnVnNEFXZnpJck1IS2k0SFJBbmpzUGsvZ2NybCtQZ3FI?=
 =?utf-8?B?NTh2ZjhqaGZXUnpYNE1tOStUU2VSejl4aFgyUWl5TVBYMTZVdFVVUGt1dW94?=
 =?utf-8?B?VUZCa3Rxa1E2a2llU3JzWWdPbHJHY2hzSGU3QmtiUURGZXF1TDZvcWtFM1NW?=
 =?utf-8?B?WlptOCs0Wit2dmRzVldVUmxJU1UvQkhwTUZTMmlvbjZSVFlIS0d4SEQ3cW53?=
 =?utf-8?B?MUtmUk9vbDY3VEh0ZzNYTkY2QnlrUE96Vit3U1RNMnFlYXhDa1VwNk1xbEJy?=
 =?utf-8?B?WllZbW42dWFnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8383.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmdmVlA1N0JCTy9iY1hYU2tyYXJvYTRCTk9QbERVaGM5ZVVCWjZheExGbGV4?=
 =?utf-8?B?VWlEakFkSWtZSEdxZ2lqeG0rODk5UEcvVXB2NWJlamdyN0V6eVh5bGNhNnBC?=
 =?utf-8?B?cjZ2eFRuNk9nYzNxOVpRYnRXa1RqVFQrRFZockNJQ29aL2FVTU56M2w2c2F6?=
 =?utf-8?B?T0poU0xnekRCUUZlOFFwVTN3NlpFNTBuMkxWcTN4d2ZVOHIxcHlvbmtpUVZ4?=
 =?utf-8?B?VmpKOGJjTGZGMkkwT3hIeXd3SkdXZGtDd3FIKzBqTERCSXdCT2RLbHpkUDRG?=
 =?utf-8?B?aUdDaXJ3Y3NURE1lYzVoSmFSb094TU1mdEdmVzR5Z2FDaE5pRVlXY2ovT3BM?=
 =?utf-8?B?RlJkdVJXS1o4bS9VR1MyamI1Rm5VakZQRi8ySTE5K2NuV25MVmk4TFRKMTRy?=
 =?utf-8?B?azJwM29oMWRGZjJBQ0xtYWhXOXRHcUNiazRGeW0wTGN4cWdhZGJBWVlpZ2tW?=
 =?utf-8?B?SXd4emF2MzkrS0wvSFBMY0JyY1hsNFF5T0tLMGtPbVptaWpBL3JSUml3aW43?=
 =?utf-8?B?Z3RPbzFaZjltZ24vV3FPV1puQ1ozRDRUWldnOFJFME16Q2VPU2hra2F3S3d6?=
 =?utf-8?B?N3FrdUlDQndCdlVxL241cHlCN0VHQmtCZWp5K1lwc0cxY2h6K2tnbzZDcmQ5?=
 =?utf-8?B?OHRlamxONVVRZ0hkZktnYTdDSmR0NkZrd3F0NG5zNndYUkdoWm1ZaUpRNlhi?=
 =?utf-8?B?dUNOV21mMndqekliMTNwb053eXJOQWFwSDB0U3hLYUR1L002YWxHdFhXLzFl?=
 =?utf-8?B?T2xBZy9zWWp1Z1V0N1VEaXkvRmdJaUNreUQ0WjliYlBHY1lqUFdmeTAvTy9L?=
 =?utf-8?B?MHhwcC9ZendiVVhFQ25SaVVVQ1VTUjhkNmRLNENCRzBuQSttcUpaazRNc3d5?=
 =?utf-8?B?YjFzRms2SWFMaEFRZGQwNnJKTUpveUNpdEJSa0JnK28zbEJ5ZWxNb29EOWhQ?=
 =?utf-8?B?MnpweUZTNzNqSUhwMUZkMmlBQUdLQVdKU2lKQ3JqVGtqSUttbnBIMjNEeENT?=
 =?utf-8?B?R1NQaG81NWJtU0lsdHVJdHhTZWR6MXZ1YWNiZDZFaXRjcXJ5VjNZZ05Vd0I5?=
 =?utf-8?B?SzRFbVlTcUNuUVRiTVgray8rRFNGUzJpVkgzOVNEY0ZMUGhaNGZOUUErT05a?=
 =?utf-8?B?THpveEFsNStGQU5sTU5UYUc2U3dHakpaUkwwZmZqaGo1V3loT1d1Sm9MSWFw?=
 =?utf-8?B?MHFIVUJBSnB2cWNiYlhFM3ZiU2F1WnA5STBaMjlVN0daTWRqYzlhamtnWWZI?=
 =?utf-8?B?ZmhsYjZSZG9VMEdCS0g0QWdraU1MQnZQWlZ3SjFROHZQZ2pjYXRwK3g2ak11?=
 =?utf-8?B?d2Q3MlZxZisxWjJWaTRzOGVuUlgyTi9UUjlMZktOdE5FZUpjd1BWMGt1Zk8r?=
 =?utf-8?B?R0p5QndwZno1dUpCRkw0Q2hETllCVTg3V0JLSDNiQ2JCK0tBOUtyL2JKRFZJ?=
 =?utf-8?B?d1J6NTd2WHlSZDQ5R3Iza3NhY3lZNi9TblJYanFlZG1MN1U1ODIyNEhBWWt6?=
 =?utf-8?B?ZnhnYXBvdEdyVW5NeFEwMkg5bDZiY3N5RHlxeDdxM29JNlUydFdlalM0ZmRj?=
 =?utf-8?B?K2JuMkw0UWFDcE5PTUIxVkp3V01qaWpQZUFKc0pYRFpvWUt5TE1UUWwzbFJB?=
 =?utf-8?B?Umh0eEVoazFRdXVtNXo1b1RKYy8yWUVNaHlUc05iQWx1aG5QOWtRd2VPa3di?=
 =?utf-8?B?bkxNN0Z0MGh3MW4wTW1NdkRvaWpaVmE0MmUrU3p6YUd6cStXdlRnck02RTBy?=
 =?utf-8?B?YVkxL05GdmFlb0VwUCt1czkrZzVOd2RoazVuNEtOTm9kRW0vS3FHT0JNZHVp?=
 =?utf-8?B?empMYjdZaWwzMDVoRmh4RDVPMHgvcm9YbUlDaW9hRUM0dEc0Z1pqcEEyVHRa?=
 =?utf-8?B?MGNNVk9BeHNPOVJHc1BPQTZHR0JqTEhvZE9NYWhscFRFekNYeENzZjc3SXpZ?=
 =?utf-8?B?d0JyYy9kc1l2Q3NFV3NpVEh2eld4OVo3aFdvNEJUYUE1a3p5NFR1U04zMzc5?=
 =?utf-8?B?RVd4NTl4K3BFcitBNHNnUHNTNytnZGZPSld4R2JoL0ZaQ0dnU0xMU0pkU1NF?=
 =?utf-8?B?L0p6S2o2UGNlR3NGU1FnUk9ZTkxKZWpSZThZTEtVTnRuUHljMCt2alEvQnF5?=
 =?utf-8?B?dFRZY1hXK3NzNFF1NDg5QjJqazUxaEMzQ1Fxampkd1FNNHg3cTU0RGQ1ZURG?=
 =?utf-8?Q?XwdM7bUqPfJhEVr/kxxVCF0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04CC10DED609B74482BCAABA4F8D071C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8383.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce069eea-6ccc-4d26-347f-08dd7153e506
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 19:32:09.4819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ewlE6iDg36nws75535YSm0IB8ponI7MIMSZYU4xFPz+Z3d2gzkxRSVDNLj9z7vQTauf/3vqK0fHPI+Dy3bIrlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8722
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTAzLTI3IGF0IDEyOjUyIC0wNzAwLCBrYW4ubGlhbmdAbGludXguaW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBLYW4gTGlhbmcgPGthbi5saWFuZ0BsaW51eC5pbnRlbC5jb20+
DQo+IA0KPiBDaGFuZ2VzIHNpbmNlIFYzOg0KPiAtIEFkZCBzdGF0aWNfY2FsbCgpIGZvciBpbnRl
bF9wbXVfZW5hYmxlX2FjcigpDQo+IC0gRmFjdG9yIHRoZSByZXBlYXRlZCBmdW5jdGlvbnMgZm9y
IGFjciBpbiBod19jb25maWcoKS4NCj4gLSBBZGQgVGVzdGVkLWJ5IGZyb20gVG9tDQo+IC0gUmVi
YXNlIG9uIHRvcCBvZiBQZXRlcidzIHBlcmYvY29yZQ0KPiAgY29tbWl0IDEyZTc2NmQxNjgxNCAo
cGVyZjogRml4IF9fcGVyY3B1IGFubm90YXRpb24pDQo+IFYzIGNhbiBiZSBmb3VuZCBhdA0KPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwMjEzMjExNzE4LjI0MDY3NDQtMS1rYW4u
bGlhbmdAbGludXguaW50ZWwuY29tLw0KDQpSZXRlc3RlZCB0aGlzIHNlcmllcyBvbiB0b3Agb2Yg
cGVyZi9jb3JlLg0KDQpUaGFua3MsDQpUb20NCg0KPiANCj4gQ2hhbmdlcyBzaW5jZSBWMjoNCj4g
LSBSZWJhc2Ugb24gdG9wIG9mIHNldmVyYWwgbmV3IGZlYXR1cmVzLCBlLmcuLCBjb3VudGVycyBz
bmFwc2hvdHRpbmcNCj4gICBmZWF0dXJlLiBSZXdyaXRlIHRoZSBjb2RlIGZvciB0aGUgQUNSIENQ
VUlELWVudW1lcmF0aW9uLCBjb25maWd1cmF0aW9uDQo+ICAgYW5kIGxhdGUgc2V0dXAuDQo+IC0g
UGF0Y2ggMS0zIGFyZSBuZXdseSBhZGRlZCBmb3IgY2xlYW4gdXAuDQo+IA0KPiBDaGFuZ2VzIHNp
bmNlIFYxOg0KPiAtIEFkZCBhIGNoZWNrIHRvIHRoZSByZWxvYWQgdmFsdWUgd2hpY2ggY2Fubm90
IGV4Y2VlZHMgdGhlIG1heCBwZXJpb2QNCj4gLSBBdm9pZCBpbnZva2luZyBpbnRlbF9wbXVfZW5h
YmxlX2FjcigpIGZvciB0aGUgcGVyZiBtZXRyaWNzIGV2ZW50Lg0KPiAtIFVwZGF0ZSBjb21tZW50
cyBleHBsYWluIHRvIGNhc2Ugd2hpY2ggdGhlIGV2ZW50LT5hdHRyLmNvbmZpZzIgZXhjZWVkcw0K
PiAgIHRoZSBncm91cCBzaXplDQo+IA0KPiBUaGUgcmVsYXRpdmUgcmF0ZXMgYW1vbmcgdHdvIG9y
IG1vcmUgZXZlbnRzIGFyZSB1c2VmdWwgZm9yIHBlcmZvcm1hbmNlDQo+IGFuYWx5c2lzLCBlLmcu
LCBhIGhpZ2ggYnJhbmNoIG1pc3MgcmF0ZSBtYXkgaW5kaWNhdGUgYSBwZXJmb3JtYW5jZQ0KPiBp
c3N1ZS4gVXN1YWxseSwgdGhlIHNhbXBsZXMgd2l0aCBhIHJlbGF0aXZlIHJhdGUgdGhhdCBleGNl
ZWRzIHNvbWUNCj4gdGhyZXNob2xkIGFyZSBtb3JlIHVzZWZ1bC4gSG93ZXZlciwgdGhlIHRyYWRp
dGlvbmFsIHNhbXBsaW5nIHRha2VzDQo+IHNhbXBsZXMgb2YgZXZlbnRzIHNlcGFyYXRlbHkuIFRv
IGdldCB0aGUgcmVsYXRpdmUgcmF0ZXMgYW1vbmcgdHdvIG9yDQo+IG1vcmUgZXZlbnRzLCBhIGhp
Z2ggc2FtcGxlIHJhdGUgaXMgcmVxdWlyZWQsIHdoaWNoIGNhbiBicmluZyBoaWdoDQo+IG92ZXJo
ZWFkLiBNYW55IHNhbXBsZXMgdGFrZW4gaW4gdGhlIG5vbi1ob3RzcG90IGFyZWEgYXJlIGFsc28g
ZHJvcHBlZA0KPiAodXNlbGVzcykgaW4gdGhlIHBvc3QtcHJvY2Vzcy4NCj4gDQo+IFRoZSBhdXRv
IGNvdW50ZXIgcmVsb2FkIChBQ1IpIGZlYXR1cmUgdGFrZXMgc2FtcGxlcyB3aGVuIHRoZSByZWxh
dGl2ZQ0KPiByYXRlIG9mIHR3byBvciBtb3JlIGV2ZW50cyBleGNlZWRzIHNvbWUgdGhyZXNob2xk
LCB3aGljaCBwcm92aWRlcyB0aGUNCj4gZmluZS1ncmFpbmVkIGluZm9ybWF0aW9uIGF0IGEgbG93
IGNvc3QuDQo+IFRvIHN1cHBvcnQgdGhlIGZlYXR1cmUsIHR3byBzZXRzIG9mIE1TUnMgYXJlIGlu
dHJvZHVjZWQuIEZvciBhIGdpdmVuDQo+IGNvdW50ZXIgSUEzMl9QTUNfR1BuX0NUUi9JQTMyX1BN
Q19GWG1fQ1RSLCBiaXQgZmllbGRzIGluIHRoZQ0KPiBJQTMyX1BNQ19HUG5fQ0ZHX0IvSUEzMl9Q
TUNfRlhtX0NGR19CIE1TUiBpbmRpY2F0ZSB3aGljaCBjb3VudGVyKHMpDQo+IGNhbiBjYXVzZSBh
IHJlbG9hZCBvZiB0aGF0IGNvdW50ZXIuIFRoZSByZWxvYWQgdmFsdWUgaXMgc3RvcmVkIGluIHRo
ZQ0KPiBJQTMyX1BNQ19HUG5fQ0ZHX0MvSUEzMl9QTUNfRlhtX0NGR19DLg0KPiBUaGUgZGV0YWls
cyBjYW4gYmUgZm91bmQgYXQgSW50ZWwgU0RNICgwODUpLCBWb2x1bWUgMywgMjEuOS4xMSBBdXRv
DQo+IENvdW50ZXIgUmVsb2FkLg0KPiANCj4gRXhhbXBsZToNCj4gDQo+IEhlcmUgaXMgdGhlIHNu
aXBwZXQgb2YgdGhlIG1pc3ByZWRpY3QuYy4gU2luY2UgdGhlIGFycmF5IGhhcyBhIHJhbmRvbQ0K
PiBudW1iZXJzLCBqdW1wcyBhcmUgcmFuZG9tIGFuZCBvZnRlbiBtaXNwcmVkaWN0ZWQuDQo+IFRo
ZSBtaXNwcmVkaWN0ZWQgcmF0ZSBkZXBlbmRzIG9uIHRoZSBjb21wYXJlZCB2YWx1ZS4NCj4gDQo+
IEZvciB0aGUgTG9vcDEsIH4xMSUgb2YgYWxsIGJyYW5jaGVzIGFyZSBtaXNwcmVkaWN0ZWQuDQo+
IEZvciB0aGUgTG9vcDIsIH4yMSUgb2YgYWxsIGJyYW5jaGVzIGFyZSBtaXNwcmVkaWN0ZWQuDQo+
IA0KPiBtYWluKCkNCj4gew0KPiAuLi4NCj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgTjsgaSsr
KQ0KPiAgICAgICAgICAgICAgICAgZGF0YVtpXSA9IHJhbmQoKSAlIDI1NjsNCj4gLi4uDQo+ICAg
ICAgICAgLyogTG9vcCAxICovDQo+ICAgICAgICAgZm9yIChrID0gMDsgayA8IDUwOyBrKyspDQo+
ICAgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgTjsgaSsrKQ0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBpZiAoZGF0YVtpXSA+PSA2NCkNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdW0gKz0gZGF0YVtpXTsNCj4gLi4uDQo+IA0KPiAuLi4NCj4gICAgICAgICAvKiBM
b29wIDIgKi8NCj4gICAgICAgICBmb3IgKGsgPSAwOyBrIDwgNTA7IGsrKykNCj4gICAgICAgICAg
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBOOyBpKyspDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGlmIChkYXRhW2ldID49IDEyOCkNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dW0gKz0gZGF0YVtpXTsNCj4gLi4uDQo+IH0NCj4gDQo+IFVzdWFsbHksIGEgY29kZSB3aXRoIGEg
aGlnaCBicmFuY2ggbWlzcyByYXRlIG1lYW5zIGEgYmFkIHBlcmZvcm1hbmNlLg0KPiBUbyB1bmRl
cnN0YW5kIHRoZSBicmFuY2ggbWlzcyByYXRlIG9mIHRoZSBjb2RlcywgdGhlIHRyYWRpdGlvbmFs
IG1ldGhvZA0KPiB1c3VhbGx5IHNhbXBsZXMgYm90aCBicmFuY2hlcyBhbmQgYnJhbmNoLW1pc3Nl
cyBldmVudHMuIEUuZy4sDQo+IHBlcmYgcmVjb3JkIC1lICJ7Y3B1X2F0b20vYnJhbmNoLW1pc3Nl
cy9wcHUsIGNwdV9hdG9tL2JyYW5jaC1pbnN0cnVjdGlvbnMvdX0iDQo+ICAgICAgICAgICAgICAg
IC1jIDEwMDAwMDAgLS0gLi9taXNwcmVkaWN0DQo+IA0KPiBbIHBlcmYgcmVjb3JkOiBXb2tlbiB1
cCA0IHRpbWVzIHRvIHdyaXRlIGRhdGEgXQ0KPiBbIHBlcmYgcmVjb3JkOiBDYXB0dXJlZCBhbmQg
d3JvdGUgMC45MjUgTUIgcGVyZi5kYXRhICg1MTA2IHNhbXBsZXMpIF0NCj4gVGhlIDUxMDYgc2Ft
cGxlcyBhcmUgZnJvbSBib3RoIGV2ZW50cyBhbmQgc3ByZWFkIGluIGJvdGggTG9vcHMuDQo+IElu
IHRoZSBwb3N0LXByb2Nlc3Mgc3RhZ2UsIGEgdXNlciBjYW4ga25vdyB0aGF0IHRoZSBMb29wIDIg
aGFzIGEgMjElDQo+IGJyYW5jaCBtaXNzIHJhdGUuIFRoZW4gdGhleSBjYW4gZm9jdXMgb24gdGhl
IHNhbXBsZXMgb2YgYnJhbmNoLW1pc3Nlcw0KPiBldmVudHMgZm9yIHRoZSBMb29wIDIuDQo+IA0K
PiBXaXRoIHRoaXMgcGF0Y2gsIHRoZSB1c2VyIGNhbiBnZW5lcmF0ZSB0aGUgc2FtcGxlcyBvbmx5
IHdoZW4gdGhlIGJyYW5jaA0KPiBtaXNzIHJhdGUgPiAyMCUuIEZvciBleGFtcGxlLA0KPiBwZXJm
IHJlY29yZCAtZSAie2NwdV9hdG9tL2JyYW5jaC1taXNzZXMscGVyaW9kPTIwMDAwMCxhY3JfbWFz
az0weDIvcHB1LA0KPiAgICAgICAgICAgICAgICAgIGNwdV9hdG9tL2JyYW5jaC1pbnN0cnVjdGlv
bnMscGVyaW9kPTEwMDAwMDAsYWNyX21hc2s9MHgzL3V9Ig0KPiAgICAgICAgICAgICAgICAgLS0g
Li9taXNwcmVkaWN0DQo+IA0KPiAoVHdvIGRpZmZlcmVudCBwZXJpb2RzIGFyZSBhcHBsaWVkIHRv
IGJyYW5jaC1taXNzZXMgYW5kDQo+IGJyYW5jaC1pbnN0cnVjdGlvbnMuIFRoZSByYXRpbyBpcyBz
ZXQgdG8gMjAlLg0KPiBJZiB0aGUgYnJhbmNoLWluc3RydWN0aW9ucyBpcyBvdmVyZmxvd2VkIGZp
cnN0LCB0aGUgYnJhbmNoLW1pc3MNCj4gcmF0ZSA8IDIwJS4gTm8gc2FtcGxlcyBzaG91bGQgYmUg
Z2VuZXJhdGVkLiBBbGwgY291bnRlcnMgc2hvdWxkIGJlDQo+IGF1dG9tYXRpY2FsbHkgcmVsb2Fk
ZWQuDQo+IElmIHRoZSBicmFuY2gtbWlzc2VzIGlzIG92ZXJmbG93ZWQgZmlyc3QsIHRoZSBicmFu
Y2gtbWlzcyByYXRlID4gMjAlLg0KPiBBIHNhbXBsZSB0cmlnZ2VyZWQgYnkgdGhlIGJyYW5jaC1t
aXNzZXMgZXZlbnQgc2hvdWxkIGJlDQo+IGdlbmVyYXRlZC4gSnVzdCB0aGUgY291bnRlciBvZiB0
aGUgYnJhbmNoLWluc3RydWN0aW9ucyBzaG91bGQgYmUNCj4gYXV0b21hdGljYWxseSByZWxvYWRl
ZC4NCj4gDQo+IFRoZSBicmFuY2gtbWlzc2VzIGV2ZW50IHNob3VsZCBvbmx5IGJlIGF1dG9tYXRp
Y2FsbHkgcmVsb2FkZWQgd2hlbg0KPiB0aGUgYnJhbmNoLWluc3RydWN0aW9ucyBpcyBvdmVyZmxv
d2VkLiBTbyB0aGUgImNhdXNlIiBldmVudCBpcyB0aGUNCj4gYnJhbmNoLWluc3RydWN0aW9ucyBl
dmVudC4gVGhlIGFjcl9tYXNrIGlzIHNldCB0byAweDIsIHNpbmNlIHRoZQ0KPiBldmVudCBpbmRl
eCBpbiB0aGUgZ3JvdXAgb2YgYnJhbmNoLWluc3RydWN0aW9ucyBpcyAxLg0KPiANCj4gVGhlIGJy
YW5jaC1pbnN0cnVjdGlvbnMgZXZlbnQgaXMgYXV0b21hdGljYWxseSByZWxvYWRlZCBubyBtYXR0
ZXIgd2hpY2gNCj4gZXZlbnRzIGFyZSBvdmVyZmxvd2VkLiBTbyB0aGUgImNhdXNlIiBldmVudHMg
YXJlIHRoZSBicmFuY2gtbWlzc2VzDQo+IGFuZCB0aGUgYnJhbmNoLWluc3RydWN0aW9ucyBldmVu
dC4gVGhlIGFjcl9tYXNrIHNob3VsZCBiZSBzZXQgdG8gMHgzLikNCj4gDQo+IFsgcGVyZiByZWNv
cmQ6IFdva2VuIHVwIDEgdGltZXMgdG8gd3JpdGUgZGF0YSBdDQo+IFsgcGVyZiByZWNvcmQ6IENh
cHR1cmVkIGFuZCB3cm90ZSAwLjA5OCBNQiBwZXJmLmRhdGEgKDI0OTggc2FtcGxlcykgXQ0KPiAN
Cj4gICRwZXJmIHJlcG9ydA0KPiANCj4gUGVyY2VudCAgICAgICDilIIxNTQ6ICAgbW92bCAgICAk
MHgwLC0weDE0KCVyYnApDQo+ICAgICAgICAgICAgICAg4pSCICAgICDihpMgam1wICAgICAxYWYN
Cj4gICAgICAgICAgICAgICDilIIgICAgIGZvciAoaSA9IGo7IGkgPCBOOyBpKyspDQo+ICAgICAg
ICAgICAgICAg4pSCMTVkOiAgIG1vdiAgICAgLTB4MTAoJXJicCksJWVheA0KPiAgICAgICAgICAg
ICAgIOKUgiAgICAgICBtb3YgICAgICVlYXgsLTB4MTgoJXJicCkNCj4gICAgICAgICAgICAgICDi
lIIgICAgIOKGkyBqbXAgICAgIDFhMg0KPiAgICAgICAgICAgICAgIOKUgiAgICAgaWYgKGRhdGFb
aV0gPj0gMTI4KQ0KPiAgICAgICAgICAgICAgIOKUgjE2NTogICBtb3YgICAgIC0weDE4KCVyYnAp
LCVlYXgNCj4gICAgICAgICAgICAgICDilIIgICAgICAgY2x0cQ0KPiAgICAgICAgICAgICAgIOKU
giAgICAgICBsZWEgICAgIDB4MCgsJXJheCw0KSwlcmR4DQo+ICAgICAgICAgICAgICAg4pSCICAg
ICAgIG1vdiAgICAgLTB4OCglcmJwKSwlcmF4DQo+ICAgICAgICAgICAgICAg4pSCICAgICAgIGFk
ZCAgICAgJXJkeCwlcmF4DQo+ICAgICAgICAgICAgICAg4pSCICAgICAgIG1vdiAgICAgKCVyYXgp
LCVlYXgNCj4gICAgICAgICAgICAgICDilIIgICAg4pSM4pSA4pSAY21wICAgICAkMHg3ZiwlZWF4
DQo+IDEwMC4wMCAgIDAuMDAg4pSCICAgIOKUnOKUgOKUgGpsZSAgICAgMTllDQo+ICAgICAgICAg
ICAgICAg4pSCICAgIOKUgnN1bSArPSBkYXRhW2ldOw0KPiANCj4gVGhlIDI0OTggc2FtcGxlcyBh
cmUgYWxsIGZyb20gdGhlIGJyYW5jaC1taXNzZXMgZXZlbnRzIGZvciB0aGUgTG9vcCAyLg0KPiAN
Cj4gVGhlIG51bWJlciBvZiBzYW1wbGVzIGFuZCBvdmVyaGVhZCBpcyBzaWduaWZpY2FudGx5IHJl
ZHVjZWQgd2l0aG91dA0KPiBsb3NpbmcgYW55IGluZm9ybWF0aW9uLg0KPiANCj4gS2FuIExpYW5n
ICg1KToNCj4gICBwZXJmL3g4NjogQWRkIGR5bmFtaWMgY29uc3RyYWludA0KPiAgIHBlcmYveDg2
L2ludGVsOiBUcmFjayB0aGUgbnVtIG9mIGV2ZW50cyBuZWVkcyBsYXRlIHNldHVwDQo+ICAgcGVy
ZjogRXh0ZW5kIHRoZSBiaXQgd2lkdGggb2YgdGhlIGFyY2gtc3BlY2lmaWMgZmxhZw0KPiAgIHBl
cmYveDg2L2ludGVsOiBBZGQgQ1BVSUQgZW51bWVyYXRpb24gZm9yIHRoZSBhdXRvIGNvdW50ZXIg
cmVsb2FkDQo+ICAgcGVyZi94ODYvaW50ZWw6IFN1cHBvcnQgYXV0byBjb3VudGVyIHJlbG9hZA0K
PiANCj4gIGFyY2gveDg2L2V2ZW50cy9jb3JlLmMgICAgICAgICAgICAgfCAgIDMgKy0NCj4gIGFy
Y2gveDg2L2V2ZW50cy9pbnRlbC9jb3JlLmMgICAgICAgfCAyNjcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0NCj4gIGFyY2gveDg2L2V2ZW50cy9pbnRlbC9kcy5jICAgICAgICAgfCAgIDMg
Ky0NCj4gIGFyY2gveDg2L2V2ZW50cy9pbnRlbC9sYnIuYyAgICAgICAgfCAgIDIgKy0NCj4gIGFy
Y2gveDg2L2V2ZW50cy9wZXJmX2V2ZW50LmggICAgICAgfCAgMzMgKysrKw0KPiAgYXJjaC94ODYv
ZXZlbnRzL3BlcmZfZXZlbnRfZmxhZ3MuaCB8ICA0MSArKy0tLQ0KPiAgYXJjaC94ODYvaW5jbHVk
ZS9hc20vbXNyLWluZGV4LmggICB8ICAgNCArDQo+ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZXJm
X2V2ZW50LmggIHwgICAxICsNCj4gIGluY2x1ZGUvbGludXgvcGVyZl9ldmVudC5oICAgICAgICAg
fCAgIDQgKy0NCj4gIDkgZmlsZXMgY2hhbmdlZCwgMzI3IGluc2VydGlvbnMoKyksIDMxIGRlbGV0
aW9ucygtKQ0KPiANCg0K
