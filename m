Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C18D271476;
	Tue,  1 Jul 2025 11:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370159; cv=fail; b=inrMFgHPB2q7oMR5i9lZfybw1KE8jPsCopFz50IgT1D/QkZlYE6c2sV4eyyF6K9DxApB7lBoS0onZqLKvyxC1kVw2JRfHIJ1XkEksMbV0j+szDkrX7wtInFwByaFyq0t+Z8t7rooc6/QbBbTsbMxMsHUh9pu9qfU6nW+BhPQhGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370159; c=relaxed/simple;
	bh=LwAbL3xg8i48h9yl972QpJRE95IHNX5POxVxPKENjYI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V9YHVuLWukaTFZlWKHVh6cpJnwIgQ2Fym1uDbcvCcHU42Vunn0BYDZ66V9p2pGanoBmXTIshLXXhdw2vj+p/b2RgA042o5bSTmXp1QVBBXioEd/kItQeKL91edq7aTkh9HMAERKE4BTf810l1LLFZ3i2MiEHm+nLrut5QlMzJZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZS01y7H; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZS01y7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751370157; x=1782906157;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LwAbL3xg8i48h9yl972QpJRE95IHNX5POxVxPKENjYI=;
  b=XZS01y7HEhB3mb2RwbFiy5j54jkSy7aLy1La7eoMSpgYSi7cYvuwAIon
   91fu/IkgsgqLpxagkL9eDwSHKhAcnQlsQwtFz9YPzr8xSlz4p7CiJWVoC
   yFzS8Zs/fusDm8q6+42YqnpgUGG3R+0D4nJAMGCHqVF9OACIidBRrBeLT
   AVZBn78dzbpGtBrzCyskqgUhHdBEnjDyrAn2BkAP4EJBF+L3iyIfccIJh
   AZLRarGrboXoJFhtly+1dptEjKOTf8lDgFtkPr4l/CzGyip4m5s3bH39v
   SyAiVxh0lin/kXIiBd2xYQFEcUwb0okCnFjWWL4CxCihUZgd1bKOml/9d
   A==;
X-CSE-ConnectionGUID: eGovsc0OR0GKP3P7FnAz/w==
X-CSE-MsgGUID: zwj/Ge9XRbqVltKrjqruNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53774073"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53774073"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 04:42:36 -0700
X-CSE-ConnectionGUID: 6ZfGEtQJS4ejtEH52y/qCg==
X-CSE-MsgGUID: Tf1R3lAiTEG3FPuYMT2jvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="154474312"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 04:42:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 04:42:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 04:42:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 04:42:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Na8farSk/DX6kjBCIw2eIpLqZHg6y5AO5IrnkIn51pjmt/6V7qD64Es8kLXEU6az7CkwsNLljVGX2EHOyzW4jqR3cuZz4EoDYuDs3NvFYFyJqD1YMMvD9q4uGn94EWm/jDWIpzfcI1hps2JrCCWdig3Qtg7myJ2IzoioHq4NIEmsIrrwooHPrjFA+i773TPDxGCCTmPkPkXE7GqVXl0jK0jZIa4xqcizT/DsUaJgB+FIYfJoALM1X60E94CLMNwIQ7/7KGGCtwUntmy8uC9GJFZ2AxZGaOgDxoOybIojT6U6mnJAYd4qeYpC0phjtNzMNNz1SXeu7UZIs6+aFP+Aqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwAbL3xg8i48h9yl972QpJRE95IHNX5POxVxPKENjYI=;
 b=ycyg/SvGCl5FKnGsjct7NHhoBdUpuHRZWR8KoS/y3sNBnoT/9QYn3LeyUwyCIxKv3XFQ1CbeNJk7XgJCEYWHkGGPhKfCQFLf42Li5A0W6pjxYGLDOx1KLL/kcKYYSejN3KtAJA3V7Do+4ImAL/k5FpaXjpVeu678xWo2bW67K6P324JxPsFAAsmyFnYObp53nV5gYHONkADXLEUQMriNJxCqRCa1m8+MYn/tbfR9VMQfYl1lZjkaEZPAVdR9gCERyQJP30MRxVqtJe7QZ4pcEY9vYHIw4cCnnGNQvqPCj65UrCSSjJaYfgGaePx/sYMifV9+OQo1fT6729+U4IGHow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SN7PR11MB7068.namprd11.prod.outlook.com (2603:10b6:806:29b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 11:42:33 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c%4]) with mapi id 15.20.8880.015; Tue, 1 Jul 2025
 11:42:32 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.de" <tiwai@suse.de>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>
CC: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 00/15] ASoC/soundwire: Realtek codecs: wait codec init in
 hw_params
Thread-Topic: [PATCH 00/15] ASoC/soundwire: Realtek codecs: wait codec init in
 hw_params
Thread-Index: AQHb5pFpstZZcKKX3k2MtQWa73CvFLQVW/AAgAEnekCABpDlAIAABZkAgAALg5A=
Date: Tue, 1 Jul 2025 11:42:32 +0000
Message-ID: <SJ2PR11MB84247FEBDB94949224315ADEFF41A@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20250626115625.536423-1-yung-chuan.liao@linux.intel.com>
 <f95f6777-7445-46dc-be53-b3ae5594bf39@linux.dev>
 <SJ2PR11MB842425A1CE631E71E4AF26F0FF45A@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <6e9878bc-856c-4319-b535-ab8f565f2460@linux.dev>
 <fa12aacd-a8ef-4f3f-9d1f-3ae42c25b7e0@linux.dev>
In-Reply-To: <fa12aacd-a8ef-4f3f-9d1f-3ae42c25b7e0@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SN7PR11MB7068:EE_
x-ms-office365-filtering-correlation-id: b8faae81-3302-4e92-8a14-08ddb8945e0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aStRTjE5RWlsVVUzQmdpTTZNUERsUjIva0ZNMjVZNDlhUE8yejVTRTF2R1Q3?=
 =?utf-8?B?WktBZGFyOTJRa0tLOWdjTlArR0M3MHNkcXU0WXRkK29qQzFiMXZ6TjhUWmxK?=
 =?utf-8?B?SWVYQTJHTjBseGE0QXRIYlFydERVUVVoaUJTb0lSL3RHN2M5TnRsMitxYm5V?=
 =?utf-8?B?S01SMmxYRHFuQ0Vpa0IwWGIvZ1FhUXFKb0tQRkswNFZUVzFuSHVnczZSbUp5?=
 =?utf-8?B?OU5WZlpjYU1sYmorRmlRTUlucXMwMml6NTJGUXBwYmZjSmtrVGRNQjdhZzg3?=
 =?utf-8?B?K2tlUUw0SGIxZ1JHejVrbkc3dEVMQVRzYmZKTDY0VWRTQThCYnN5ZjNBbjRr?=
 =?utf-8?B?ZXZVZ0M5SHNndUR2RWx2dmh4dnVGKzBTd2h3ZjlpekZoWklPc2twbjZlS2s5?=
 =?utf-8?B?MDVOV0pRSFg4SXdabEFpRTUxRjFiNlF0L3RKYmRZVXd5MGxLQjFnWjlaZWFK?=
 =?utf-8?B?QkRMQ2Uxb1BLMUNyTEpoUm85UmRTWHhRcXJLd2t5YVN4cDd4VnFwbEpPbkhU?=
 =?utf-8?B?eE1Cb3NPNVpDeGw0WENHbVRpVm0zOFpQa1BNa24rV25RcC9MWmpwMU0wMEJO?=
 =?utf-8?B?SEhDRHRNWEFuWTVKUlRCbkFaN3hvQUVUQzVObWM2SWlVT3FMM3BkZTFZdzJL?=
 =?utf-8?B?NHltM2tIa01remxlWGo2OUw0MVp2Zy9JaEQ2WDg3alJtZms0SFJuRFFzR2J3?=
 =?utf-8?B?VHNOb0xnRENHSURNTGZGMFJpWTlPbjlkdVhkTzBTQWYyNGdOM1p1TWdtczNL?=
 =?utf-8?B?eTFLOVUxTHB2YkYwaW9tcXNyV1dKMFhGK2tyUFhIem9qZEpjMzF3SFdhMjZh?=
 =?utf-8?B?dXFIUjlhNCtxS3VPSTRiTUxKWTBxbFF4SE1YWXFiQnE1UUdGYkN2enNieUJW?=
 =?utf-8?B?cmphNWljS3E3SjFOVG9VZmxDUEtVbElBR2VRUWRYOU5jdVV3OEJ4dUl6L0kv?=
 =?utf-8?B?SnBCaHFtUWRDTGs1MDNIYytRTlQ4eGVacUNKM0xpS3JIcGZUaFE5ZnpZNjFk?=
 =?utf-8?B?cVFGck1WdXc1L0hqSWZiaTNCVkZpd1lUZlM2d1VkRHZ1ZTIzU0VCU2ROVmht?=
 =?utf-8?B?dGtUOG00akk3SWxXMzJTQWZvekpzZVA4S1ZZUEtJbzFnTWhKYVprNzhWejRs?=
 =?utf-8?B?K1hkY0JnV2w4RmU4KzFFZ1NrNzhCZjhoWW1HM2piTHhGcmhPc3k5T3AzWlp3?=
 =?utf-8?B?Rkk4Q3JvQnh1ZGJCVHFiM3ZYOHBKdXdZL0JnZXMxOUlWckgzc2F0cWNKajZL?=
 =?utf-8?B?MUxzT2s4WW5hdzNsa1NyN3IzdjBJU2MxWEZITnRaeGo4a3pnZ0NYdWgxQ0Jv?=
 =?utf-8?B?TURTVE8zZStZVUNmaVBKSDEwdURJdHBTdm80OUx5SE5QYUQvWjkrMVBTOWlx?=
 =?utf-8?B?djE3cVQrbWhiTEdQV2JQQTdOdTJlSkJ2WllQRUtVbkxWRDlSMXBFUnI3akxM?=
 =?utf-8?B?WkgzNUJhWE1aeFA2bEJKRVZIc0xaOFNXbEdJTk9BcnJZQmJwdW81S0NRZ09P?=
 =?utf-8?B?Z0hkbDV6RXBZOFJhYjhKU2VMVHIzWU9wR0JONlBaWE5rbXZ4WW5KWEVkcktR?=
 =?utf-8?B?UjZMM3dxaE5DNmpJNEwvT3NJczd4aVBaRWtiaGpEbkk4QXNxdU8rSnJkT0t3?=
 =?utf-8?B?b01LWDcwZmVqVzdjVjVTM245djkzRjErS0wzZkV0aTBnM29QaXAraVYyeCtw?=
 =?utf-8?B?QlFSUmhzS3JuWlFGZXE0MDZ2TEprWHdtOEdkdmk2WWhiZW9oU3hOZEpCb1Ri?=
 =?utf-8?B?YldDR3RaclA1WEdCVFc0Um9vSUVHVGlDaVZHazhRaWdLZDVxalJ3RW05c2VW?=
 =?utf-8?B?YzErVG5YaFhwd3BJQm1FeHRuNEgyNDZFT3RUSnZwQWM5NzJIV3h2eGdwc3BV?=
 =?utf-8?B?K0pacjVaL0kwMExYS0lXZ2JvT1hENmp0RXJZTEd3THVlY1lrY3lSTS9aS0kx?=
 =?utf-8?B?UUdCRy9tcHZJMEdjQmQ1YnBQMXFobSt5Vk50cjRCaFczb1NTOURCbEtrNW9Y?=
 =?utf-8?B?OWFxTGcyaFlnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUZ6bHkyL1FPWmpPWXAvMWZTM2FsTFhPTzc2R0pVVCs5WlVCaHVjWlp5VDdw?=
 =?utf-8?B?OE1KWUd5cEpkdjJ3NVRUQTR3SENuOHNXUG5FeFRhNHZJZk4rLzliNVlDK2JK?=
 =?utf-8?B?b0U3SCtFYjFzcnNhdHRWQUxOdnNucUQ4TXBVRXRMNVN2aGpLYkdqdUl4cUMz?=
 =?utf-8?B?RWZ5c1AvbW5oU1c2a0dYaVlvZmhkSUJrOU9vZ3lwOXZMd1lReVRYNmJxcjBj?=
 =?utf-8?B?bFg4UjRzaGQyY2tEZjBVVllQQjNxVjZKalAwYjJnK2hFQkJGTmVoaHF0VGdC?=
 =?utf-8?B?dkN2T3oxR1lkS1BwM1Q2QktMbkRuMFYycUtza2ZncGt5dWJrWDR2S2pDSFJy?=
 =?utf-8?B?ZzNnUmNXVStqSGJoWDYwUGYvL3hjR2ZRVGFWSEk0dGMvTFhZc0JwL2pYZm9n?=
 =?utf-8?B?MmQ0aVlxMmQ5bXF5Ui95d0gvRVdqbzNtU2lOTzU2emtTZTFXTHpKSm5xMVV0?=
 =?utf-8?B?VWczaWZCYnRET2ErbTRkWG5qOXFlVlBPTWFQOW1PTlNlbEVjS3BCUVREaVVj?=
 =?utf-8?B?Syt4QTJrZ2lHVHRubDJIbzZBSWp0MVFWUFlyNXhPNURMRkkwZTFUSWtpSW5j?=
 =?utf-8?B?QUc3K2ZTZGlOMTYzTDI3b1doeTd3ZktLU3lJNFZJdzF3eVA4eStuMFJwd2VV?=
 =?utf-8?B?N25OZVNraWQ4SUVpNUZKekFaZmNhUmpGV2VhcExpMUxaa2VpOTZSV3pYbnZQ?=
 =?utf-8?B?RjdaSHVjTmt6cE8rRDdJaUZzQTQwbUhtWkQzTTZ4MHBscVpGTTY3eWRmUVJB?=
 =?utf-8?B?QVdRQStqaDhjRjlIVHQ3TDBPeXI4WlJreUZEOEptaTlWMit0eE1ycWZuU29j?=
 =?utf-8?B?Z1BpTlRkTW1uRmVOcnhjNitUSWhXZFR5dkt2d1QyNTh2K29MUzRzTXZ2ajZI?=
 =?utf-8?B?ODVrdlZwSjZYQ1lHaXFoLzZYK2p0SndiZ01kc3hla002TTdOdm1yaVhBeWg4?=
 =?utf-8?B?R2lKRCtKbXJLeHVuRUduMFZRazM1eExQU0NQaFpUVENjSVBpNE1nS09tRmR5?=
 =?utf-8?B?N1Rld2RjbWFncTI1YWJUVjZEMWtkR0hNODB1ZUFDR0xDWGJTMUlwNytSandu?=
 =?utf-8?B?NFBJZCtTK1RaRU4rVS9sdGgxZVRkdGFua0VvT01ZcHpEeGsyT1IvU250WG1H?=
 =?utf-8?B?NGRtc2MrSVQybURsWXhZeWE2bDEzaXRyWGx4MWFLUXZidlBJMUQrNXl3elIv?=
 =?utf-8?B?eVVxNE9ueGxiOVRZM0gxV3h5dG9XZzRqNXZEcXh3ZjllR2p6K2hEeHZPcFNW?=
 =?utf-8?B?TVhpeGM0ZE1zZ2ZZVkZVZm9pMGMvYXdYN2g4QVhidlFTRlJwVkVmRGM3N2Fx?=
 =?utf-8?B?UEJCOG4wRmkxcnpmMmQzV1pHbFRnNUllUGY3OFJ6MnYyejh0NHBMM0hSZUZC?=
 =?utf-8?B?ZzFxS3dZUmpHYkVWUUJyOXl5RlBGakl5Sm1aTURzN2Z0QS9GZkZkMGRHVUlB?=
 =?utf-8?B?SDZ1VEFIU3NTcnkzZkRwMG9hdExZSWpNaDRVR1RRMnJhVUpwOVZHM1VyUVNm?=
 =?utf-8?B?L2h1R3ZVNHRLa1pidzQrMGdkUU1xN1QxeUtJbmpraHJvQm5nVi9sY0dhU0NR?=
 =?utf-8?B?NmhVR3cxcDVjTjNsQUxNSmpZU29BaVIyemlhWHRtN0U2bStidnVVbFhyTU44?=
 =?utf-8?B?QmhwS1ErUHhCd3lJQmhxQ0ZObjVjSHZ5TGN6ZUh5QjlIamU5UzhHOE15VkMr?=
 =?utf-8?B?L2Nmb1FZRHBPUGRCbjlLRTdOZVdOdDBSZC9lRjZsN0tqcDhqeURVM2N3UE1j?=
 =?utf-8?B?bkNXc0pnQXBRUmpuWkRFUHpwK2lHbWhJUWpKWVdDMFU5NTdWVFpsSzFZY09K?=
 =?utf-8?B?azR0MjJzYUVyOWIvNDFyZ3hrSURqbFlqUmtOUEVLQUxiUDk4eklBSjVTQ0tr?=
 =?utf-8?B?S1Z2c3lTLytyQUl5WlNpOXVJV0pMT1Z5S0tqeUJCREs0N2d3aXhnbmJYRmg5?=
 =?utf-8?B?VDdjZncwb2FjMVcrWFo0dXFOMUx4LzlEUGdsZ1hoMHBCajFucE9aNmNQUkNw?=
 =?utf-8?B?OWNQQzQ2TldlWlUxU3BaYklsdjVjTEtmT1BiWUZUQytNSEdxTHF6THJQQnJh?=
 =?utf-8?B?cGxwVSs4LzVkcDhxQ2l1MGZQazJjYkdLSmlaTjJIZldRZkUyZ3ZROVVmQjVu?=
 =?utf-8?Q?EOYs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8faae81-3302-4e92-8a14-08ddb8945e0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 11:42:32.8688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0fe8mBSoGGT7lxvpspDQ/DT9MROayx9e/oVPqfG4GzqdWgYg5CWgzQEnsjX41Ul1IYLXisc93nvpO7wkHKLDPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7068
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4NCj4gU2VudDogVHVlc2RheSwg
SnVseSAxLCAyMDI1IDY6MzMgUE0NCj4gVG86IExpYW8sIEJhcmQgPGJhcmQubGlhb0BpbnRlbC5j
b20+OyBCYXJkIExpYW8gPHl1bmctDQo+IGNodWFuLmxpYW9AbGludXguaW50ZWwuY29tPjsgYnJv
b25pZUBrZXJuZWwub3JnOyB0aXdhaUBzdXNlLmRlOyBsaW51eC0NCj4gc291bmRAdmdlci5rZXJu
ZWwub3JnOyB2a291bEBrZXJuZWwub3JnDQo+IENjOiB2aW5vZC5rb3VsQGxpbmFyby5vcmc7IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwMC8xNV0g
QVNvQy9zb3VuZHdpcmU6IFJlYWx0ZWsgY29kZWNzOiB3YWl0IGNvZGVjIGluaXQNCj4gaW4gaHdf
cGFyYW1zDQo+IA0KPiANCj4gPj4gVGhlIG1haW4gaXNzdWUgaXMgdGhhdCB0aGUgY29kZWMgY291
bGQgYmUgYXR0YWNoZWQgYWZ0ZXIgdGhlIGNvZGVjIHJlc3VtZS4NCj4gPj4gU29tZXRpbWVzLCBp
dCBjb3VsZCB0YWtlIDEwMCBtcyBvciBsb25nZXIuDQo+ID4NCj4gPiBJIGRvbid0IHJlYWxseSBz
ZWUgdGhlIHByb2JsZW0gaGVyZS4gVGhlIGNvZGVjIGRldmljZSAoaW4gdGhlIExpbnV4IHNlbnNl
KSBpcw0KPiB0cnlpbmcgdG8gcmVzdW1lLCBhbmQgeW91IHdhbnQgdG8gd2FpdCB1bnRpbCB0aGUg
aGFyZHdhcmUgZGV2aWNlIGlzIGZ1bGx5DQo+IGNvbmZpZ3VyZWQsIG5vPw0KPiA+DQo+ID4gTW92
aW5nIHRoZSB3YWl0aW5nIHBhcnQgaXMgYXNraW5nIGZvciB0cm91YmxlOiB0aGUgZGV2aWNlIHdp
bGwgYmUgcmVwb3J0ZWQgYXMNCj4gcG1fcnVudGltZSBhY3RpdmUsIGJ1dCBpdCBtYXkgbm90IGV2
ZW4gYmUgYXR0YWNoZWQgb24gdGhlIGJ1cywgYW5kIHRodXMgYW55DQo+IHJlZ2lzdGVyIGFjY2Vz
cyB3aWxsIGxlYWQgdG8gaW52YWxpZCByZWFkL3dyaXRlcy4NCj4gPg0KPiA+IEZvciBleGFtcGxl
LCBzdGFydGluZyBhIHJlZ2lzdGVyIGR1bXAgdmlhIGRlYnVnZnMgd291bGQgZmFpbCBpZiB0aGUg
Y29kZWMgaXMNCj4gbm90IGF0dGFjaGVkLiBUaGUgbWFjaGluZSBkcml2ZXIgY291bGQgYWxzbyBz
ZXQgamFjayBzdGF0dXMgdGhhdCB3b3VsZCBmYWlsIGFzDQo+IHdlbGwuDQo+IA0KPiBleGhpYml0
IEEgZm9yIHRoZSBsYXN0IHBhcnQ6IHNlZSBydDcwMF9zZXRfamFja19kZXRlY3QoKS4gV2UgYWJz
b2x1dGVseSB3YW50IHRvDQo+IG1ha2Ugc3VyZSB0aGUgZGV2aWNlIGlzIGF0dGFjaGVkICpiZWZv
cmUqIGNvbmZpZ3VyaW5nIHRoZSBqYWNrLCB0aGF0IG1lYW5zDQo+IHdhaXRpbmcgdW50aWwgcG1f
cnVudGltZV9yZXN1bWVfYW5kX2dldCgpIGlzIGRvbmUuDQo+IA0KPiBTbyBhdCBhdCBtaW5pbXVt
LCB5b3Ugd291bGQgbmVlZCB0byBrZWVwIGEgd2FpdF9mb3JfY29tcGxldGlvbigpIGluIHRoZQ0K
PiByZXN1bWUgbWV0aG9kLCBidXQgaXQgY291bGQgYmUgZGVtb3RlZCB0byBhIHdhaXQgZm9yIHRo
ZSBlbnVtZXJhdGlvbiBvbmx5Lg0KPiBXZSBkbyBoYXZlIHRvIGNvbXBsZXRlKCkgZm9yIGVuZCBv
ZiBlbnVtZXJhdGlvbiBhbmQgZW5kIG9mIGluaXRpYWxpemF0aW9uLg0KPiANCj4gSWYgaXQncyB0
aGUgaW5pdGlhbGl6YXRpb24gdGhhdCB0YWtlcyB0aW1lLCBpdCBjb3VsZCBpbmRlZWQgYmUgaGFu
ZGxlZCBpbiBhIG1vcmUNCj4gYXN5bmNocm9ub3VzIHdheSwgYnV0IEkgZG9uJ3QgdGhpbmsgeW91
IHdhbnQgdG8gZXZlbiB0aGluayBvZiBhIGNhc2Ugd2hlcmUNCj4gdGhlIGNvZGVjIGZpbmlzaGVz
IHN1Y2Nlc3NmdWxseSBpdHMgcmVzdW1lIHJvdXRpbmUgYmVmb3JlIHRoZSBkZXZpY2UgaXMNCj4g
ZW51bWVyYXRlZCBhbmQgY2FuIGJlIHVzZWQgZm9yIHJlZ2lzdGVyIHJlYWQvd3JpdGVzLg0KDQoN
ClRoYW5rcyBQaWVycmUuIEZhaXIgcG9pbnQuIFlvdSBjb252aW5jZWQgbWUuIExldCdzIGRyb3Ag
dGhpcyBzZXJpZXMuDQo=
