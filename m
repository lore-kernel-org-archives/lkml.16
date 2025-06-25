Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C5829B22C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842783; cv=fail; b=uvubUAoYtah5yDCrJ5DkTIrY21NltoIGBnIOoocJUgQCEw42C5M2AsokxmxolN/JQYutJ6eXQCPBib67N93yyvi9dx/vQZWUUMNICmgaYyKWdPJAmo5nfmqNBKeeOcrAp8DPI9SFRpaZU0KafvgORwa6R3dd71v+tHvlP4YBNh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842783; c=relaxed/simple;
	bh=Wd147xRdp3oebJyDyPLcNTgWtTPLd/0IsRFJZ85hEYQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EflFDIWiVXkGMM3J2ETx1yYDHTCNiZY28LKpOE+DKdegvyACbHcOuM1d//yBehgUf+DXlIUWsMAMhTjBRD14xdu80vWekLOtT7E/Ux4cscs6CSri92EkLqEQELLEe93F3avT9JuWfu4zwFAGWSTEvZ1/rf9jBt5jwG3p8motPGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSLzDomH; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSLzDomH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750842781; x=1782378781;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Wd147xRdp3oebJyDyPLcNTgWtTPLd/0IsRFJZ85hEYQ=;
  b=CSLzDomHx7PyVHT0nSylIMOYQx+eEh0H/NXZD0hCY5w29K02O8doUM0D
   tK/SVHmLQWv2ZlRQ6zf9DnjUYG5Z+qgD4MOf2Z4217gJzrSLpHZVg9f3x
   uLJYH1lYvf8cxl9ffQ9+nNKgeJ+IaVvW0dW9LaxC2nKu8Q1BtwUvnFezZ
   ywQHDf1pTu7TyAdJN+aMH9Mv8s3S2HpGh88sKqWkDoMSkRS4CQbY9AlQO
   CvkvJdxwuu1U65jREnFNcp/uqYJVM5hHBLLQSeooIEOCZOoGQcKktcwee
   AGWQyw21i35/hMsHhkcXEoMU734TS8eyNpQjfL9Dm0WbQbd7+dM3u887h
   Q==;
X-CSE-ConnectionGUID: mUgiqYqCSK+ZsZGQzCFTFQ==
X-CSE-MsgGUID: WVD/lAKQTiSzxQP5SWqsYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53037073"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="53037073"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 02:13:01 -0700
X-CSE-ConnectionGUID: /J4D1ysQRxezmX0JaL2dLw==
X-CSE-MsgGUID: L/KRD1MhSoeLK7oAqFEWfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="175818095"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 02:13:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 02:13:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 02:13:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 02:12:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yS10kyW+ZRUsq8NJG88Z4cE4BdwCCmr0PniWsc2TZgXhjyVZnHMeaVL/dT1CiCiBsElWU4GSeSKmKCOdTOaqWuOwNXDnYNlwlWpDwg9ITfybIP405Lwc3Zvle8AIzfunq1r18ysMbqDia/RUXqO2XBnQ+UN39oRWDorrXIhErAzjesbwi7ub4DjMv247cabd3aHmUdXxStxUv1k3hCn1yFU0R0nUhqI/yEsUZ/qf0Bpj8tg9J1LshI9bpkSZ2n4qbK1SIcSgw8hZAtzzxQVseeL8gm7uPHN+suIJi73U2jlb8w0bpW3mTvP9hc93HBBbm4atS+aCr6KXkMNV4r2UGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wd147xRdp3oebJyDyPLcNTgWtTPLd/0IsRFJZ85hEYQ=;
 b=B6QM6TZstrjDV+I9P9y/GJoKRv9Innk1byqeU67oa9Wh4Q+CY5jOcaTtWRTo9gndYDCV6n6r5AmBB8DLUe6Oz3oFvK9wRqK6kZdigYnYGDC4GMUxg5qYQ9WlE+XmJqu60QFGtEIy1a9EnMKgdWFC2pZCl89JzYHYO+otWOhDBXrq1stD3VNdb9qMetChpp+QzV+6q2uEC3kNmc20YtRkZZxqUC54IZRDuOOjKE8G+uP3bDjfX1uqcx8hbCuH8GPYYslfQjE3s3ZETxMCgUylMfFIalnAsyeA6k2IqmR4LCy8yGBzcpgy3o+2HoTTxSklEcNzN5VqCImuLuGuNRREMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 09:12:53 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 09:12:52 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Stanislaw Gruszka
	<stanislaw.gruszka@linux.intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 06/10] mei: vsc: Event notifier fixes
Thread-Topic: [PATCH 06/10] mei: vsc: Event notifier fixes
Thread-Index: AQHb5Bv+ycDvZe7IoE2AVk3LNrtdvrQTmR9A
Date: Wed, 25 Jun 2025 09:12:52 +0000
Message-ID: <CY5PR11MB6366468BAEADAB94B7286AF6ED7BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250623085052.12347-1-hansg@kernel.org>
 <20250623085052.12347-7-hansg@kernel.org>
In-Reply-To: <20250623085052.12347-7-hansg@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|IA1PR11MB7269:EE_
x-ms-office365-filtering-correlation-id: 9c670168-6ffc-4ec2-acb2-08ddb3c876e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dmVKdHgzOUZ0RGRQczBwSlNYMWJBNlh6OEk2V1lzZXlwSWtYWk9ETnVhSzc2?=
 =?utf-8?B?YWFYZmdGZjhkZW13Z0tIekk4Y1dTRTZGb0RXMDdXaG5udy8vNjZ3VWFXeEpi?=
 =?utf-8?B?dUdWcncvaWJ1K2FKaGprNjJka2w4aUhyM0FJSDBBSEp1dW43ZU1kNXlZL2Fj?=
 =?utf-8?B?dysyb1lKTWttS1dmeTlwcjJRS0JlQWNLcXBIQ1cyaTB5Ynl4a2pvTmlpU1JO?=
 =?utf-8?B?ZHpYWnRyNnB1TjNqbUdISFlSMkNGeFQySkxmZjhtZGxOZkFvbzlsN1RMWjFO?=
 =?utf-8?B?a3pFQVB5S1VtZUIxVG1ta2RDRlFrQjBTa25aR3ROZmNUdEd5dG5pT0hiMHYw?=
 =?utf-8?B?SnBZMUhXSmlFWXlLeGNYMEZ2d1ZwNTdPNFhjNjZsWDVydVdxalRXbUwxUjBu?=
 =?utf-8?B?eU1FaEMzVHRISmR2amM0STdTSHJvUTVndjdlbndRdFMvWTJjS2lZeGlVa3RK?=
 =?utf-8?B?R2lTNTk5cGtIbnd2ditvTWUyT1BPVExVVDRtWnFsV3NidzJYMTdoN1cwUWNN?=
 =?utf-8?B?akw0T1hVMmdvMlRiTC9nbDRoS3dGRURNZC9hY0ZyK25Lc00rRlE5V3pxRjRK?=
 =?utf-8?B?akpnQ0FMR2JDY0hseW5uam9VVDZOc0VXNGRzaUkvNnNoWnlnVlVIOGZ2Njdx?=
 =?utf-8?B?MXNtc2h6dHlja2xaSWhPOFNOeDcyK0tQZmM4b3hpVFVzYThPSWRSYUI2YXFN?=
 =?utf-8?B?L1AzQ2wxeHFRblJaelNMejlncVJNZ2F1MHp3Wk9nMGs5ejB4eGRDRG1nYkQ5?=
 =?utf-8?B?OTg1R3k4S0ZMMVZHZFZmK0Z3RjJnWXRZdlJtRkhCT1VSQ1NwK1FrS2dRamNI?=
 =?utf-8?B?YkdTVFFqV1Vxa28zUFY2eDZtM05Cd1hVTm82Q3hqRmw4dnVjVXdYSGxKdWhl?=
 =?utf-8?B?TkQrUGhqNHBpY09UNk4zM3VPd2JCZG8vNXVZWWV4YnVqb1NXMjZWNWt3YUtD?=
 =?utf-8?B?TmpreGVTYzhMbmFnbzZPSzJvTzBxTCtqSUpJb3NIV25xMGpoSXpxbG5LaXRj?=
 =?utf-8?B?OWwxSGpQbndSNE9MMVpqcUhpWms1U0Nyc0k2aDh0NnB2L0p5Y0ozYWxlQ3VC?=
 =?utf-8?B?dWttZGxKOHIrd1VHYUhYUzNSOGJRUXRhZ3FORnRDUHE4MVlkV0JSeHlOUDI0?=
 =?utf-8?B?WHQwVEcyRFFLMXNOZlN2YmphREg3bFl6SVducWV1K1l6eXNZbDJHQlhtb2dl?=
 =?utf-8?B?RmppRyszbXY0RzFhUDZtWGg3L21Hd0hPaThreVQzS1U3cWhqaEpyengxUU1H?=
 =?utf-8?B?blBOaWQyZFowTGl3SFRGaU10UUtTNTVSTnZlYlR1K0Q5Y2ozcDNMbGZRRk03?=
 =?utf-8?B?SEFtQWcwK2EwR3JObVUzZjkrZUl0WFRnQlhFNGdoNnp1Y09QdktGU3ZBNVp1?=
 =?utf-8?B?K0trME1yQXJPU1hVK3M0azdSVFBZRS92c2hpYm9uMjZqV1dURG9KbFNqYUNk?=
 =?utf-8?B?VWpCNWYwbnVsSEVYQXluRlhUU0x1R1hFWDBkTUh6ZUoyZENBNyt1WnlJcGRI?=
 =?utf-8?B?M3FzZktqUnpNM053RDVVSGREQjhCTlFNNFVoZnlNSFh0bWVIcW9OcUNOeGgv?=
 =?utf-8?B?WTNzMkxBRktuWlJsMFNUZHRMSjRTb1RHbGdCNDIxS3ZBbEVsWStYdkZUK3VD?=
 =?utf-8?B?N1NWZlFRQ1pVMCtrSFlxL0o2SmswMTlnWVVnTlFLZTgrL09ENTVWcXB5Z3NM?=
 =?utf-8?B?RURUY05lcHNLTWdEdFR5ei92NVMyZytuQW1PZUZDTVhpU2tnWGFSMncxam5P?=
 =?utf-8?B?TjFmbUtSMkdEdFJJdHo5VWtjSS9ETHVtTEFuM3hOMEtUSVZuY0Y4My8rNzM0?=
 =?utf-8?B?dnRWUHFzK3N4czhKNlp2UzhvYmFSVmRpQ2RyVDh4YkZFT0tLYWN1QmxoYktX?=
 =?utf-8?B?OEFLSWlBcXUwbmw0VGg5a2RTa3FnMmxUTVh6T2kxVG9henhUV0ZXaEFLTndM?=
 =?utf-8?B?elhXY0V5S0o3VUFlOHZBb3dkN2NnSktQMWplemFEdzJDcitoY1hoKzQ5RU5J?=
 =?utf-8?B?S01LdnIvM2Z3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3VqL1YwU1NraGx4M004aGZ4d01HZFcyS2dad2d1V0FrNFhYUTNWVWxjd2ta?=
 =?utf-8?B?R3k2azFRZWlmaUpHTklpVFl5V2x2ajJITVc0R3BHYlQ3RUVLZzA1QUVod0pK?=
 =?utf-8?B?MXh0Q3ZGM0dyWlY3MHk0SE5hb0Z3eWZ1cG9kV2xEYnl4NnVPVWd6anRuWjJE?=
 =?utf-8?B?MGZHWm9oakd6UlErZjdOdi9YMXFZcDVZclYzUStBUXQ3YUFuR1R3dm8ycDF3?=
 =?utf-8?B?U0QvZUdQdUZZamMraEZnV1R2cmhFTjB5RzlHaEV0OGlWNk53MWVJRXp1RFVI?=
 =?utf-8?B?OWdFUlZ3VEFFNVQybUpLek9BTFljci80UzMzQUlzYXZxckRmUlR3a21vbXJO?=
 =?utf-8?B?TExBRHJRRVV1dlNzV0IzWnkvTUpubkl5bkp5dXZxdjV1eWwvNTFGZmh2ZzVi?=
 =?utf-8?B?ZXhmSVJGNTZoZTA1S2NPWFFVaWZaMGxCL05SVXozNjdkWWFFUmR0M3I2OGll?=
 =?utf-8?B?NFpkaWwxL3dZRWg4NEJKa3BPR24yY1hHVzQ5Y3VnU2xqVFB1VUFlYUZ2Tm01?=
 =?utf-8?B?V0paaTJYenFWdEUyMVNwaWxiTGJweDBITnZtRjZPbmFkWCtkeUVlVVpVeFRS?=
 =?utf-8?B?VFE1MzFraW5tR2tXd0xjU0NSR0VNWWxLNGROdVU2REl0c3lkMDNiZDVBUDgw?=
 =?utf-8?B?TmZqdDZ0VGRsZ0hhS2VPSW50NUllRlNYOTZUV25LdzBCNVpxUm9vWERSbWxs?=
 =?utf-8?B?S3JCRmhmU3Z1NmZxQm1naGppelZic2VBSFQwMEtCcWpFWVlGTVd5dHJ4ZUhG?=
 =?utf-8?B?VTAxaHBVRnRxYjFFejYrQlZXN2hyMlVrRjhEMWthblpvZEJYOUlSazdoeDlL?=
 =?utf-8?B?VGxjTEhOT3JNRVhoRS9KN1hyNFZyaWw1T2xKRHc2UzJOQUFnVDdJZCswM0V4?=
 =?utf-8?B?VlpWc3I5N040Ly8yUlh2NnJUNXVQRFBYdUxGQUlJLzN2MHFJRlI1cGFrVHlP?=
 =?utf-8?B?L0Q2YXVPOU9BRXFvM3Vyam5UMno3cUc5UWtGd28rRm9nZ0w4Zm9la1BYZFFJ?=
 =?utf-8?B?ejI2cGVESkRwZWJqQzIxcUZpY25UbDdjK2VJTXBFZEMzTEFlQkJkRmNydjlF?=
 =?utf-8?B?WWgwNE4yYm9DZ3o4dTFRcU9YL1dLK2t1T1hEWlpvWGRoeU9TMlNvZ0xqaVRy?=
 =?utf-8?B?cmFSU013MDVvVlFRYlJpTytlcVJaSzdscDN0SUVPK1E3VEZVK3dtQU5oK0sz?=
 =?utf-8?B?NEdDejVGVkkraXFyMzUyKzlnQ3cxdjA0UHU2VElCZmsyNjVLajByNjdxQ3hG?=
 =?utf-8?B?bzEzRHBxbzlxMHQ3SHFzVW00UFAzMHRraU5DNzBHRkkzcGNONVFCclpIUi9m?=
 =?utf-8?B?SEVld3VQbTlLT05GcjhsVjhReXYyQkZNMUpGWE5UdlNhRXVZV0plZEhPRHF4?=
 =?utf-8?B?TldpbkR1d3VhQ29qTVdodDhvYnVTTFl2N3RSRDhKT3A0dDM2WW1EOHNOZXdC?=
 =?utf-8?B?RUl6SWZtNnEzNkN5UXAxN2lwdVJ3TDhWbzVpQ25NMFA5YXNpaDNoZXJnYXJk?=
 =?utf-8?B?VU5SS2ljaGpKUkU5b1FJWVQvVmh3d1hHT3MyUXZFQzBpVkRPQ3FJL3NaWDlY?=
 =?utf-8?B?dWVFQTBMNEFTOUVqR3MzOXd5dkd5RWhOdERhOWUxbGEvWVE2QWFJRjRpMENN?=
 =?utf-8?B?ekhSbGNBV3VtTHZZbzRFRVRIUTZGdFR5cytiRkV4TzJRTmtFeUg5VU1QcE13?=
 =?utf-8?B?Wi9Sd3ppOWVHSnYrMCtCczY2NWp1d0hhdk5BdHV5N1Y5R2FYa29PTE5VdGU3?=
 =?utf-8?B?L3BYMWdKdE1POUQzMzkvU1kyKzY0RHZ5bFlueWNnZ2lEZkpabFltdk82ay8y?=
 =?utf-8?B?RDc5N1NLa21XaXg2cmk4TXJyeThhZjRrN0NOVkpXYzlpci9FODBLcStVMmt0?=
 =?utf-8?B?TXBmVFNDM21jWkk0Y0JlcDJjM0Y3cHNROUQ0alQ1eDZmckVCcmtmSkpCREw3?=
 =?utf-8?B?NmJCTVZZNU4xU2dJc213M0NIUEZnVW1FdlB6UitVd0tuclpCMXdzYy9ibWZG?=
 =?utf-8?B?cHl4ekRkblNhaitERStDeFBYQ0VEbWZJcFFjZVlpU3l0UDgvM2NhZXdadXY5?=
 =?utf-8?B?OWFHVnpFc1c2c044a3hJN3FYTzZOYk9XRnlPeW5sckp3RXRudkhpUm5Tb09y?=
 =?utf-8?Q?65dDYdUf6SRGTokWHMDKvwHED?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c670168-6ffc-4ec2-acb2-08ddb3c876e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 09:12:52.5655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilLR18787P5uN0QZhuj6DfmlhMeUnTRnTQ8VVLqdzMfoJJ58AMp3EXx8aufQs6S57jvkYoRb88UX0n6fT2RsMaqooaUHP0yZyAYPOc5eEOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0ggMDYvMTBdIG1laTogdnNjOiBFdmVudCBub3RpZmllciBmaXhlcw0K
PiANCj4gdnNjX3RwX3JlZ2lzdGVyX2V2ZW50X2NiKCkgY2FuIHJhY2Ugd2l0aCB2c2NfdHBfdGhy
ZWFkX2lzcigpLCBhZGQgYSBtdXRleA0KPiB0byBwcm90ZWN0IGFnYWluc3QgdGhpcy4NCj4gDQo+
IEZpeGVzOiA1NjZmNWNhOTc2ODAgKCJtZWk6IEFkZCB0cmFuc3BvcnQgZHJpdmVyIGZvciBJVlND
IGRldmljZSIpDQo+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhhbnNnQGtlcm5lbC5v
cmc+DQo+IC0tLQ0KPiAgZHJpdmVycy9taXNjL21laS92c2MtdHAuYyB8IDEyICsrKysrKysrKy0t
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvbWVpL3ZzYy10cC5jIGIvZHJpdmVycy9taXNj
L21laS92c2MtdHAuYw0KPiBpbmRleCAwZmVlYmZmYWJkYjMuLjc2YTZhYTYwNmEyNiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9taXNjL21laS92c2MtdHAuYw0KPiArKysgYi9kcml2ZXJzL21pc2Mv
bWVpL3ZzYy10cC5jDQo+IEBAIC03OSw5ICs3OSw4IEBAIHN0cnVjdCB2c2NfdHAgew0KPiANCj4g
IAl2c2NfdHBfZXZlbnRfY2JfdCBldmVudF9ub3RpZnk7DQo+ICAJdm9pZCAqZXZlbnRfbm90aWZ5
X2NvbnRleHQ7DQo+IC0NCj4gLQkvKiB1c2VkIHRvIHByb3RlY3QgY29tbWFuZCBkb3dubG9hZCAq
Lw0KPiAtCXN0cnVjdCBtdXRleCBtdXRleDsNCj4gKwlzdHJ1Y3QgbXV0ZXggZXZlbnRfbm90aWZ5
X211dGV4OwkvKiBwcm90ZWN0cyBldmVudF9ub3RpZnkgKw0KPiBjb250ZXh0ICovDQo+ICsJc3Ry
dWN0IG11dGV4IG11dGV4OwkJCS8qIHByb3RlY3RzIGNvbW1hbmQNCj4gZG93bmxvYWQgKi8NCj4g
IH07DQo+IA0KPiAgLyogR1BJTyByZXNvdXJjZXMgKi8NCj4gQEAgLTExMyw2ICsxMTIsOCBAQCBz
dGF0aWMgaXJxcmV0dXJuX3QgdnNjX3RwX3RocmVhZF9pc3IoaW50IGlycSwgdm9pZA0KPiAqZGF0
YSkNCj4gIHsNCj4gIAlzdHJ1Y3QgdnNjX3RwICp0cCA9IGRhdGE7DQo+IA0KDQpUaGUgbXV0ZXgg
b3ZlcmhlYWQgbG9va3Mgb3V0IG9mIHBsYWNlIGhlcmUgaW4gdGhlIGludGVycnVwdCBoYW5kbGVy
Lg0KTWF5YmUgaXQgY2FuIGJlIHJlcGxhY2VkIHdpdGggc29tZXRoaW5nIGxpZ2h0ZXI/DQoNCkJU
VyBpcyBpdCBwb3NzaWJsZSB0byBoYXZlIGludGVycnVwdCBiZWZvcmUgY2FsbCB0byB2c2NfdHBf
cmVnaXN0ZXJfZXZlbnRfY2I/DQoNCi0gLSANClRoYW5rcywNClNhc2hhDQoNCj4gKwlndWFyZCht
dXRleCkoJnRwLT5ldmVudF9ub3RpZnlfbXV0ZXgpOw0KPiArDQo+ICAJaWYgKHRwLT5ldmVudF9u
b3RpZnkpDQo+ICAJCXRwLT5ldmVudF9ub3RpZnkodHAtPmV2ZW50X25vdGlmeV9jb250ZXh0KTsN
Cj4gDQo+IEBAIC0zOTksNiArNDAwLDggQEAgRVhQT1JUX1NZTUJPTF9OU19HUEwodnNjX3RwX25l
ZWRfcmVhZCwNCj4gIlZTQ19UUCIpOw0KPiAgaW50IHZzY190cF9yZWdpc3Rlcl9ldmVudF9jYihz
dHJ1Y3QgdnNjX3RwICp0cCwgdnNjX3RwX2V2ZW50X2NiX3QgZXZlbnRfY2IsDQo+ICAJCQkgICAg
dm9pZCAqY29udGV4dCkNCj4gIHsNCj4gKwlndWFyZChtdXRleCkoJnRwLT5ldmVudF9ub3RpZnlf
bXV0ZXgpOw0KPiArDQo+ICAJdHAtPmV2ZW50X25vdGlmeSA9IGV2ZW50X2NiOw0KPiAgCXRwLT5l
dmVudF9ub3RpZnlfY29udGV4dCA9IGNvbnRleHQ7DQo+IA0KPiBAQCAtNDk5LDYgKzUwMiw3IEBA
IHN0YXRpYyBpbnQgdnNjX3RwX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpDQo+ICAJCXJl
dHVybiByZXQ7DQo+IA0KPiAgCW11dGV4X2luaXQoJnRwLT5tdXRleCk7DQo+ICsJbXV0ZXhfaW5p
dCgmdHAtPmV2ZW50X25vdGlmeV9tdXRleCk7DQo+IA0KPiAgCS8qIG9ubHkgb25lIGNoaWxkIGFj
cGkgZGV2aWNlICovDQo+ICAJcmV0ID0gYWNwaV9kZXZfZm9yX2VhY2hfY2hpbGQoQUNQSV9DT01Q
QU5JT04oZGV2KSwNCj4gQEAgLTUyMyw2ICs1MjcsNyBAQCBzdGF0aWMgaW50IHZzY190cF9wcm9i
ZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQ0KPiAgZXJyX2Rlc3Ryb3lfbG9jazoNCj4gIAlmcmVl
X2lycShzcGktPmlycSwgdHApOw0KPiANCj4gKwltdXRleF9kZXN0cm95KCZ0cC0+ZXZlbnRfbm90
aWZ5X211dGV4KTsNCj4gIAltdXRleF9kZXN0cm95KCZ0cC0+bXV0ZXgpOw0KPiANCj4gIAlyZXR1
cm4gcmV0Ow0KPiBAQCAtNTM3LDYgKzU0Miw3IEBAIHN0YXRpYyB2b2lkIHZzY190cF9yZW1vdmUo
c3RydWN0IHNwaV9kZXZpY2UgKnNwaSkNCj4gDQo+ICAJZnJlZV9pcnEoc3BpLT5pcnEsIHRwKTsN
Cj4gDQo+ICsJbXV0ZXhfZGVzdHJveSgmdHAtPmV2ZW50X25vdGlmeV9tdXRleCk7DQo+ICAJbXV0
ZXhfZGVzdHJveSgmdHAtPm11dGV4KTsNCj4gIH0NCj4gDQo+IC0tDQo+IDIuNDkuMA0KDQo=
