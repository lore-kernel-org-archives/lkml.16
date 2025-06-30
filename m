Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418B184A2B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280748; cv=fail; b=SlUHRY9lRHH+YoFfAZWswYUAGlRI1/6Q5yd4Pr8QsFrvLVuWm7JB9YGgWIEGZajx3uzaypziAMBBnFzv3QAft0TjtnbZdu3Ns5SBk5YnCXUkT3or+VvcLaiErzpOwBCyVb3vb1OIuGBhI7EseKEbwUvMLPz11gR0Xx9W9MTYkHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280748; c=relaxed/simple;
	bh=2Snk9TTIlBjFidgUrvGA31ZfUf0QPfSW864SqJvSZGE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iR8c+Stp6Aw3LeBQJHvzaVUxZw1PPSG2G0Xh/hLIGetx/ZN5rycPnaKLdJ9WICmpgZ8Z/TKETh167WHjSvjFpmOR15pXHx/bjPMRk39A31STOtB4syGy2hzCJ7xkKffQvBrjbyIu11StY9cLYj3s2xtgfHZvRqIavQ5Zb/wafNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwchmhM1; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwchmhM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751280745; x=1782816745;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2Snk9TTIlBjFidgUrvGA31ZfUf0QPfSW864SqJvSZGE=;
  b=TwchmhM1LV/Htzxfme20vNuuc9GO+rKC/oCl+8nk48zk3cWHXBNilMk7
   OmDRvvG+LbGn8gUDhpZl0ltLfbxXc0yvSz/mplyC2JY/8+Cn12qs1KrJX
   rv4UauTVFw/gP2246XdMhLtFob0VbFgk2O6bN7U+ss44876f1SwmhLQD6
   vVm6GR+PWZeLfWJWsjigFxUaSOZD/rSOSXlh7kHBDxk2tazty1xydnuUu
   JNFHw/sH2r0RbiKtBMARZUYIFglqacLzstLupiulsMG0jlzw6bM8Jptfy
   ZSlp5oc4wRmpyIP5U3ohnG0y47iQCt6pIkv1EzQe8FcLDptcR4Py36IbE
   g==;
X-CSE-ConnectionGUID: aUMvF4xaTTi+SwbHFTR7fQ==
X-CSE-MsgGUID: 5MxzCaqDTkq3Cbk4HpooMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="63757403"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="63757403"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:52:25 -0700
X-CSE-ConnectionGUID: ujKUg7ovS/OWzA7sO8qehg==
X-CSE-MsgGUID: /ibf8X9WRpqJJeMcW86Z/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="152903751"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:52:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 03:52:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 03:52:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 03:52:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fI4PWODYWw8uNgaRf3DMS6axVWciKLg75eTURy3+z/uXBg82LT6dv3NX38lJwLnUxwRug19DHaL3nDG3T6duqX9j8Txf2W6V9exlzFJ7UrO3fj7Q33TDqd4/PyO8jRZvx1UJCEjcCuKF+GMD5YB2N/SdX4qfuiA8yD50zSbhX79Tr6OAUkIb9om4D1q24v9677A0jEJQ+NXJyrjgS7KnLzQMiuiPrV9yCoR8ZgcAlYrRC2GoD491w+i8vuOSyIRFtqGGqpElx3ZuyKvedRcgzQV6i9WJpzvOyYat1aEqGoA6F/FhO4r+oXYP2Ny7r6BsLCZgstfP1KWwe4g02ztBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Snk9TTIlBjFidgUrvGA31ZfUf0QPfSW864SqJvSZGE=;
 b=Ihm83r1sL+tlHdMVDFFRh52Xeb6wVTPhNMltZptiJOyevX2tyNpBb9wW0TD7GqfLk54tCTrt3I1qU7aA9BDpLpczjRXeEDaLNuo9rQksKbznt+t5eJJuhybdP+N6SEMIUsKJxqGCaZ1M3L7j/WFyw2D3UVI7rcI18IxtSIWVUACXy1dwWBwvUmv224xAN8j8CO1+jKPLqQDyHsvR6JfmnpNpjCuBSOrVFW26dl8RvXJ1roYo/KZiK8VOG4MxGaUvO9CRoO24qIjalG5GN/pxqqG3LUqP63ougoLsVf3f4xiJmU9Ick+HVv258fzQpF2glAtq42ohN9e/2n8RzUQ+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 10:52:08 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 10:52:08 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [char-misc-next v2] mei: bus: fix device leak
Thread-Topic: [char-misc-next v2] mei: bus: fix device leak
Thread-Index: AQHb5PnBD41lwh8Xa0K5qwLV+EJSerQYgVYAgAMMHgA=
Date: Mon, 30 Jun 2025 10:52:08 +0000
Message-ID: <CY5PR11MB63664DE1B93F480CCC199D8FED46A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250624110520.1403597-1-alexander.usyskin@intel.com>
 <2025062836-twentieth-kudos-1148@gregkh>
In-Reply-To: <2025062836-twentieth-kudos-1148@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SJ2PR11MB7425:EE_
x-ms-office365-filtering-correlation-id: 57abc87a-a01b-450f-7aec-08ddb7c428c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RGJBRHVFVnVFQTRxWHNpdnltelZWL2JCWmJvWlcvR1NMM1k0NEtvTFQ2c1Jr?=
 =?utf-8?B?MFdGQ2Y3NzJjQXJSdEtDSHNFRXZHSlFkTlNYeEx0UGNNbld3MHZCY1FGd1Fs?=
 =?utf-8?B?SGx6eThad1NtRmhucXplRFJMOFpWRjZnSDNsVVhxbWZUeDBmZVRqNFhlUFZW?=
 =?utf-8?B?STk2NldBejdkRzFyMnlpZEh1K3ZOM09QVStoQkdmeTVKRTE1anYrNWt6bytw?=
 =?utf-8?B?VXprUmZGVk16ZTRhNHBibHVTK0V2b3Y1bzhXbHlVRi9Eb0hPcmRKQU0wb1Mx?=
 =?utf-8?B?UFBVSEVtYlJOdkprblEra2Z6SmpMNVhIbks3dERYU2VLS2Y4RlNuQS9vZmtx?=
 =?utf-8?B?bUtPRjRHemI3NWh5eTFKdlpTQkdKbVhSWFFTYjgvV2tURTU5Q0d3Z3Rsb2ww?=
 =?utf-8?B?VkNxNER4QVpScDlDaE1DUkFHNnVEcGVHWm9WMDJIMHd3Q3FiSm9kVEZORUl0?=
 =?utf-8?B?dzFxdGpPckp1Z3lYOW8rYWdPVzJ5dFZ4eWJqNFl1ekJKcU9VL0FFNHBPTDhw?=
 =?utf-8?B?bHRFSXl1SnR0OHBtTUhQa1lnelh3TFBUUGN0K3pEVEo4UU5Tbk15bkd0NnJl?=
 =?utf-8?B?N0ZUejhZdm0zSmIwQTNac05sMnkvRU1WbGk2SW1QUUoyTGhsUHhGalVPMmZR?=
 =?utf-8?B?c0FicW03SUdvNTZoMksxL241Z3dLbW9jNlpFYUpmRHVQMEtEQ1JuVDdtMENm?=
 =?utf-8?B?VTBNdmhFa2YxcERGMFVhSy9TR2NCYVlYdmJHajFxVndvN0RjTlFkaXoyS1Zu?=
 =?utf-8?B?UVJnSWs3YTIxSGdISTgvbjRWVDBOa0creW9kemVRYXYvbVdtVXNkdG9SL1RS?=
 =?utf-8?B?aDRxWlRieDZFV1F6TTZqYjZUdEZzMElKdDFBYmpBcFVHYVAzWFdiaE1ZTk1Z?=
 =?utf-8?B?Z2pZRkpaSWpnWjZMcVI5aG1CYm9ETUtnQzNLVVFiRzZpSVB6UDJlaU5ZcDNR?=
 =?utf-8?B?Q24yMFU2RDJtb2pycUVTREYwVlBHRndtSmdIbmNleFJtbTFmOUxldUV5cko1?=
 =?utf-8?B?UlZZaXpMTUZ3dnBMbFJvbWFaSHlHUUpFZFY2cWxyTXdHMndBd1ZSWHZmVVNK?=
 =?utf-8?B?bDIvdDB2bW55SW9EcW9tVU52cktWaFpBb1pja1NQNjFVaUpTWEZMMGVVUk5v?=
 =?utf-8?B?cFI5N1dYQ0thWmZNQkJuV1Q4ZGJYVlRoVS9NNVFJak9QdmxZZkpOWjJaUXFT?=
 =?utf-8?B?elFrZCtZU09DbTVPWlFONmQ0dkVRK0lSMkFEWE1aNURzOEFuanRwcHZNZGhr?=
 =?utf-8?B?aTV3aEh3M2ZlOTZnK1NleXZQdFlWY0UrZElLSzVBQ0JncE80TXc3TFlrNExl?=
 =?utf-8?B?VXllVGRFOE5xMFFCS2ZMWE5QVUxoYmw2WUpNSzRlUUZ3azBBdWdlY3RUZklQ?=
 =?utf-8?B?MExGWElrRkdZc1BGRldMMnNrV1ZXTk8wWjdBNE4vZWQrQkxpaXMrczJ1T3c0?=
 =?utf-8?B?WFFVQ2N6S21vY2x6b3QvcGs0M2UxOHY5OFM4Vnd4T3pWZnd4VU8zT1QvODJq?=
 =?utf-8?B?dnBGRGNORCtNSnMwbkViYm9XQkFhWEVSRVduUXJYakdEVzVmSHUxRjV0dEp3?=
 =?utf-8?B?bnFNOXgySURMSlFBbUtaTHUzZ1lVakNreUc0Z2h3N2YwZ2I4ZzBOTE11eExl?=
 =?utf-8?B?Mkd5T2FBVVhjdkFyTG4zS2JaNCtMUVZqM3lWUnFYbkxhNG5NRTVucnVQRGN3?=
 =?utf-8?B?T2hLaTNpOE9FQmU4UlZZS3V3UDdhWmxORE0wVnkvaHFBWWJNaDBJdjVvMFNB?=
 =?utf-8?B?SFdmNjQxRXBHL0w0RFVqeVNhZndIN09LWFE1Z0RQSEQrZlNuNWJmM0NXVlJv?=
 =?utf-8?B?clVyRWxoQ3dpb2pjMGZkZElOV3RpZjJTYk5MS1YwV0tEYlNwem1raEdsUmdw?=
 =?utf-8?B?UGhRdStzRTNBaTBYSDVRTXJVenQ5VVJ6MURzK1l2U2NqWmIvOXdGWTR3SVJ2?=
 =?utf-8?B?N0V2OEZQM004ZVJIZ1hLRmRLYnRFc0kvLzdzMmV6VXlnMkt1MnlGRzBFUkJV?=
 =?utf-8?Q?q3kyP7hHYZMku11DBL0kbp3T0JaO9E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3UxY1VEUnNuMmpUdWNTcWxEWnMzUGJFMytQVjNPUXFWNzg2bk90SjR4TDgy?=
 =?utf-8?B?VlNwVnVnWjRiSFBkVHIyZmZROHpkL3EyYVZMN0lRcWFTSUZIMXBjYWt1eXNZ?=
 =?utf-8?B?c0F0Vjl0bTkyM3BIcXBJOXU0TGM0N0hHTjJyTU8vZEs4ZEF4cHlEZzVyYWpu?=
 =?utf-8?B?SGdlS0c3eDdVM0xwalJ1RCtPTDhCQnlMdU9iVmRBQ0RkaW5ydmZzUDV6SkMw?=
 =?utf-8?B?am1MeDJweXUwMzBlR0ZoYUJ4ZzZXSUhmS2trVlZyVjRqSFZjM1k3czV5YXhp?=
 =?utf-8?B?T3RBb2FuVFl0aDdDV0JZLzhWM1NyZVRMMy9KS3VyeXpFWG8xek1ocWI3ZVk1?=
 =?utf-8?B?K0ZJdGZ2UkpBM1hNTHA3aGpvQndXenVYV0UyRG5ndWttQzNFQkpQOTlLZTZM?=
 =?utf-8?B?S2haQ09oTFQyamlsT05SNXlBUmREOTNIY2MybjRLNjkzdUM4eGhFTmNhNjgx?=
 =?utf-8?B?bWxwR2dBc1BuRnZUcktXSmFiLzBIQ2lOd096SXZxNTFsQXZ0d0R4d1NlanRh?=
 =?utf-8?B?bjV1aHVSUXZuQWN1Rzk4OHFWYlFwNFdBelVONlNaQUJVU3pjb1VoN1RlWmNt?=
 =?utf-8?B?WHRvYlE1RXFEbXZYRk5DcXpxdHQxT2xNM2FlWEJIL3liWDVHMnU0OWR4aGd4?=
 =?utf-8?B?b3VJdWlORXNRbUZKaTVaUDFwS3NDQVJRd0hoZlVrQkJiYjdRU2dNdHNHVEtr?=
 =?utf-8?B?RmlEaFZtUklpYzV5U1pXejM4bkxMdCs2YWdqSldIeEZDOGU3ZmNBajJrQ2No?=
 =?utf-8?B?WEJVSnJaZEtzT3dZcjZuQUdxOVVRVXdldEFER210VnRMZmhpNkdRUFlNUEpV?=
 =?utf-8?B?eEZxMXgvK2hqR2RCOW1UNkxPaTliek43Z1pxZXVRUC90NDRDYVpnNk5mUVpC?=
 =?utf-8?B?TjFCcU82VGU5YW5Rb0VSQjd5KzJDc3JpN0Y0SUp4Vyt1NUNtUW5oZStvSS9V?=
 =?utf-8?B?RUNMRlRsVlEyZlg2WlRaUUh3K0Q4VVc2d2xjbUp5OTM5aWQ4clFTMDlHdUlV?=
 =?utf-8?B?VEwyN2NFeFBQSUxEbFNmRFdrYWxZb1MrbzV0WkNWeHlDbEk4cEIzSDczNjQz?=
 =?utf-8?B?UGoxNTduZmJYVWVFM0tMYmNNY0RQbE4yUitBT1gwOFN2bDdpdFFGYnVnTzJK?=
 =?utf-8?B?anJXNTRNMDVMeVdBTGllUVBaNzJPalFybUdNZXVqdS84bHRjbGdBbkdwTExL?=
 =?utf-8?B?ckdwWjZaMzBXclBKZ3V6b0ZheHpVQXNlSGhZZjltaEpkbnErM3ZwMDNvSVBK?=
 =?utf-8?B?dmxwZ211VE12cUsxMk5oaEF4UVY5VmlqWHJycnU3NmRFZFZYU21iNXNZY3lF?=
 =?utf-8?B?OUpBRC9OOU01ZFJFQisvd0J5ckxKdnVvMGp0U1ZTdHhMK0hBUkZ3eXpzUzFW?=
 =?utf-8?B?WXRXMTBYV2J2WWU1aGVIMjRTeTI2R2VGOFB6K3g0OWlrYUdBUFJLNHlZUENw?=
 =?utf-8?B?MWR6SlZWZkFHVGVMUlF3SXpGejh2cWtYcGRHYk1hcnF4Zkh3OGZGblR0SlEx?=
 =?utf-8?B?NHdHMHU5cmZtZ1A5VHpNUGZ2bDBnckFodmdVN0NoUjNxR0lsR0xBakljTVZS?=
 =?utf-8?B?WTF0N0FDMUU4WnAxT0tXSmJpL0R2VHJ6UlR2WHZucnJiZGs3NjVtYURwMWFy?=
 =?utf-8?B?Wms1RFo5NUYxdjg2MEZ4MERKZ3lqd09rdzZ4M2xOYWpmcEtVOUVpaENrejkz?=
 =?utf-8?B?ZGt5NnU3R1NvR1VvWG1pRlZIY1hGU2xEa1BZOVI0UWlySUs2VUJsNWNNdG04?=
 =?utf-8?B?OVJVemZsTkY0a3hjdVZxRGdYT2ZtR3NEMytXb0tBLzVabU5HK0xacGtCUURy?=
 =?utf-8?B?ekp5NXNCVGdjbjBLL0twSDBjNDZndkhyODFzV0pYQWxNMDF5b1FJckpQN09p?=
 =?utf-8?B?RGdjZ1k2MzBVcWdMM055dHV3M25NY2k3azVaK3YwSVp5THhOOE5DQWFncWRq?=
 =?utf-8?B?TnhMQTl2U2phaVJxbUNhaUdBVDJieHIyMjk4NVNXdE9IRTZoS1BJN0srMk1t?=
 =?utf-8?B?YnV4WmloTnNQWXcwWjRNOXRHaXRGY3BkS1d3dXlTcWhFclF3SFpTSlZWbWR5?=
 =?utf-8?B?MDV1bUNBVitpT1hLSHJ3SFhBRTNLVllVenBpMlhpazh6UVNaYSt4M2p6RDll?=
 =?utf-8?Q?E151wvkNU0okp+qOl1AlgZwxj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 57abc87a-a01b-450f-7aec-08ddb7c428c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 10:52:08.1479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5nOvPJ2br8f1Es/f7T++5IT4ANyk0gfCj/BFJCDVTny0IvNvIRlUiLtsKfINy5m5KVQMXmu5nSh6tt26Bsz2ZiZv6vgQRxKZ2uC9bLBcNAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW2NoYXItbWlzYy1uZXh0IHYyXSBtZWk6IGJ1czogZml4IGRldmljZSBs
ZWFrDQo+IA0KPiBPbiBUdWUsIEp1biAyNCwgMjAyNSBhdCAwMjowNToyMFBNICswMzAwLCBBbGV4
YW5kZXIgVXN5c2tpbiB3cm90ZToNCj4gPiBUaGUgYnVzIHJlc2NhbiBmdW5jdGlvbiBjcmVhdGVz
IGJ1cyBkZXZpY2VzIGZvciBhbGwgY2xpZW50cy4NCj4gPiBUaGUgZml4dXAgcm91dGluZSBpcyBl
eGVjdXRlZCBvbiBhbGwgZGV2aWNlcywgdW5uZWVkZWQNCj4gPiBkZXZpY2VzIGFyZSByZW1vdmVk
IGFuZCBmdWxseSBpbml0aWFsaXplZCBvbmNlIHNldA0KPiA+IGlzX2FkZGVkIGZsYWcgdG8gMS4N
Cj4gDQo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhlIG1laSBidXMgaXMgc28gc3BlY2lhbCB0
aGF0IGl0IGhhcyB0byBoYXZlDQo+IHRoaXMgdHlwZSBvZiBmbGFnLCB3aGVuIG5vIG90aGVyIGJ1
cyBoYXMgdGhhdCBmb3IgaXRzIGRldmljZXMuICBUaGUgYnVzDQo+IGNvZGUgc2hvdWxkIGtub3cg
aWYgdGhlIGRldmljZSBoYXMgYmVlbiBwcm9wZXJseSBhZGRlZCBvciBub3QsIGlmIG5vdCwNCj4g
dGhlbiBubyByZWxlYXNlIGZ1bmN0aW9uIGNhbiBiZSBjYWxsZWQgYW5kIHRoZSBzdHJ1Y3R1cmUg
aXNuJ3QgZXZlbg0KPiB2aWFibGUgdG8gYmUgdXNlZCBvciB0b3VjaGVkIGF0IGFsbC4NCj4gDQo+
IFNvIHdoeSBpcyB0aGlzIG5lZWRlZD8NCg0KSXQgc2VlbXMgdGhhdCBpc19hZGRlZCBjYW4gYmUg
cmVwbGFjZWQgYnkgZGV2aWNlX2lzX3JlZ2lzdGVyZWQoKS4NCkFtIEkgcmlnaHQ/DQpJJ2xsIHNl
bmQgc2VwYXJhdGUgcGF0Y2ggZm9yIHRoaXMuDQoNCj4gDQo+ID4NCj4gPiBJZiBsaW5rIHRvIGZp
cm13YXJlIGlzIHJlc2V0IHJpZ2h0IGFmdGVyIGFsbCBkZXZpY2VzIGFyZQ0KPiA+IGluaXRpYWxp
emVkLCBidXQgYmVmb3JlIGZpeHVwIGlzIGV4ZWN1dGVkLCB0aGUgcmVzY2FuIHRyaWVzDQo+ID4g
dG8gcmVtb3ZlIGRldmljZXMuDQo+ID4gVGhlIGlzX2FkZGVkIGZsYWcgaXMgbm90IHNldCBhbmQg
dGhlIG1laV9jbF9idXNfZGV2X2Rlc3Ryb3kNCj4gPiByZXR1cm5zIHByZW1hdHVyZWx5Lg0KPiA+
IEFsbG93IHRvIGNsZWFuIHVwIGRldmljZSB3aGVuIGlzX2FkZGVkIGZsYWcgaXMgdW5zZXQgdG8N
Cj4gPiBhY2NvdW50IGZvciBhYm92ZSBzY2VuYXJpby4NCj4gPg0KPiA+IEZpeGVzOiA2MDA5NTk1
YTY2ZTQgKCJtZWk6IGJ1czogbGluayBjbGllbnQgZGV2aWNlcyBpbnN0ZWFkIG9mIGhvc3QgY2xp
ZW50cyIpDQo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51
c3lza2luQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9taXNjL21laS9idXMuYyB8
IDExICsrKystLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL21laS9idXMu
YyBiL2RyaXZlcnMvbWlzYy9tZWkvYnVzLmMNCj4gPiBpbmRleCA2NzE3NmNhZjU0MTYuLmYyZTVk
NTUwYzZiNCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21pc2MvbWVpL2J1cy5jDQo+ID4gKysr
IGIvZHJpdmVycy9taXNjL21laS9idXMuYw0KPiA+IEBAIC0xNDMwLDE3ICsxNDMwLDE0IEBAIHN0
YXRpYyB2b2lkIG1laV9jbF9idXNfZGV2X3N0b3Aoc3RydWN0DQo+IG1laV9jbF9kZXZpY2UgKmNs
ZGV2KQ0KPiA+ICAgKi8NCj4gPiAgc3RhdGljIHZvaWQgbWVpX2NsX2J1c19kZXZfZGVzdHJveShz
dHJ1Y3QgbWVpX2NsX2RldmljZSAqY2xkZXYpDQo+ID4gIHsNCj4gPiAtDQo+ID4gIAlXQVJOX09O
KCFtdXRleF9pc19sb2NrZWQoJmNsZGV2LT5idXMtPmNsX2J1c19sb2NrKSk7DQo+ID4NCj4gPiAt
CWlmICghY2xkZXYtPmlzX2FkZGVkKQ0KPiA+IC0JCXJldHVybjsNCj4gPiAtDQo+ID4gLQlkZXZp
Y2VfZGVsKCZjbGRldi0+ZGV2KTsNCj4gPiArCWlmIChjbGRldi0+aXNfYWRkZWQpIHsNCj4gPiAr
CQlkZXZpY2VfZGVsKCZjbGRldi0+ZGV2KTsNCj4gPiArCQljbGRldi0+aXNfYWRkZWQgPSAwOw0K
PiA+ICsJfQ0KPiANCj4gSG93IGNhbiBkZXN0cm95IGJlIGNhbGxlZCBoZXJlIGlmIHRoZSBkZXZp
Y2UgaGFzIG5vdCBiZWVuIGFkZGVkIGJlZm9yZT8NCj4gSG93IGNhbiBpdCBiZSBoYW5naW5nIGFy
b3VuZCBpbiBtZW1vcnkgYXQgYWxsIGlmIHRoZSBkZXZpY2VfYWRkKCkgY2FsbA0KPiB3YXMgbm90
IHN1Y2Nlc3NmdWwgd2hlbiBpdCB3YXMgb3JpZ2luYWxseSBjYWxsZWQ/DQo+IA0KDQpNZWkgYnVz
IHVzZXMgZGV2aWNlX2luaXRpYWxpemUoKSBhbmQgZGV2aWNlX2FkZCgpIHBhaXIsIGFuZCBpbiB0
aGlzIGNvcm5lciBjYXNlDQpvbmx5IGRldmljZV9pbml0aWFsaXplKCkgd2FzIGNhbGxlZCwgc28g
d2Ugc2hvdWxkIGNhbGwgcHV0X2RldmljZSgpIHdpdGhvdXQgZGV2aWNlX2RlbCgpLg0KDQo+IGNv
bmZ1c2VkLA0KPiANCj4gZ3JlZyBrLWgNCg0KLSAtIA0KVGhhbmtzLA0KU2FzaGENCg0KDQo=
