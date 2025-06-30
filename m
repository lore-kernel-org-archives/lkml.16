Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD75523A987
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288561; cv=fail; b=h5jNExPzR4peo7eZELR5ANDiiBUe6YKEDRLZvowJ9WnEXRrEKeSWtoBtDXtTCgEMKF2NfY3qCYTTl4D6SLfXZDP6nuL39gG1jWxFesf4jPUwqLau1UgekGXHJ1eyYt7sEcrzjFfC8vJFVXV5PxfGz81qaQ3zUFdVEts9fGmu9Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288561; c=relaxed/simple;
	bh=nxlwpBEcuE7UMMXYTpw2+SRnD1PO0cDFfaU3FfQ/0gg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CetTL+f+0QyJxFJrrUAWztQrUA1AM/tFmc8aSnI7IW0T0Q+dpbuwHxbGmBfQxaC0SeXoE3q5BN23i4QjeVm6qyC4Z7uxM/fKzRxfCiuAUsvkiKmXCZzPof7u/y4b4sCex/O1zYYnqynJ1uAp5oGMSSxJEKiPNd6eqQl4A4Xziq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZJEfUUb; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZJEfUUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751288559; x=1782824559;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nxlwpBEcuE7UMMXYTpw2+SRnD1PO0cDFfaU3FfQ/0gg=;
  b=UZJEfUUb5YdvQlSx/vHAZ9d4Ov2GyqTDloz8WeIh9QiSwzJqBII+kpDS
   bhucwW38M7P6DiN1Zn5vLFWChKJLIq/BXJVPlrH+xFBe6zLeRasXppDRj
   fn5pYVWiX1ATmFWw0GqOKbR45iDwFHB77mfdbI/VOZoIvmA64+khc7tVi
   KuAdK1H9sY1AwMkF9tsSk6jxNKT1KcT9n/Qweqqz5J6snwPFsr/9rDMdl
   ypkKXH2gWbZ5rBSxppZPAwaw4t1W0OaIU7L1xCG+D4RxU7raRKtgNIQG1
   qZJK/KCqHeGNcN1m/p9RvVLipMvfAImc1WKYk6nl2r6sVkxqtbbD5CdVe
   A==;
X-CSE-ConnectionGUID: 90KM7tsGTyinb8/+kDxkyw==
X-CSE-MsgGUID: x09Yj6KSQMK1RWY3VzESSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53388213"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53388213"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:02:31 -0700
X-CSE-ConnectionGUID: 3OenJ7hyQ22l7zZnalju/g==
X-CSE-MsgGUID: PffQG1svQwWrwEh/WYcLHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157843395"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:02:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 06:02:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 06:02:30 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 06:02:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POqKOai7kY9OGlvLMUBap+eyCzkfQ7ArEBsSbvBOVGvHTJtwKSG07l2dkFx4P4R01CK5IlfS4VEMORx9bYhEPZxtem3f54lB5U8MjzHQuC5FJe+VhC/CPzPNdbgah10gK1MbeZzudjlAJkrzZxeCcfbYrFulNf1HmW3+F2zyXbhL7vtlJxvbK4XDb4PlLKkNmdwqjSapC2dxUWLmhBRYvS1NtRciLoYRsisRRiNHKNmzPV6YJyTd00C9AE5ZDWsQYTeZDP6uPEeUrcK9++yqWowPZpIeHZeAuunrV7lRHWz7Cw/mrigyuedy04JzJ6b+yAkGw58LL0ryPbk5oPGVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxlwpBEcuE7UMMXYTpw2+SRnD1PO0cDFfaU3FfQ/0gg=;
 b=u4MBUKKuugZLUb5G4RVHk0LKdYZRwTLA4YDzqU+DofLFWmftdPMMenjh1hrh8lg6cIcum1yTIk/zRwwU8a3wCVK22nuRBkjs+WFD3dZKuLBibFnf7dnSuOKHN1tWfeFVzV/rLmL/EaXg0JAXlw+H9Tm3DGObNEBmh9h++J2+Y7Vr15kbn6FpxyBtLkX50fWxjwRXe8VqxJ5CHJrl9v4CDP7QByg3s/P64sckw1rnrTzKmY/AYBKrmJfM48B54/W/DE+yTJEmYXAAMGq1hMq4p4Qh6GK6L8ehu54yt3LPiYuD7ORV+IvmE8aHL3FvmKqMvpIK2aZQfCAkjnLCpc7Oow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DS7PR11MB6061.namprd11.prod.outlook.com (2603:10b6:8:74::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.31; Mon, 30 Jun 2025 13:02:12 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 13:02:12 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [char-misc-next v2 1/5] mei: set parent for char device
Thread-Topic: [char-misc-next v2 1/5] mei: set parent for char device
Thread-Index: AQHb6aIAxk3SG64BwkqkjQJzl4tXULQbeOuAgAAqNDA=
Date: Mon, 30 Jun 2025 13:02:12 +0000
Message-ID: <CY5PR11MB6366307E6C7330B44132C6D7ED46A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250630091942.2116676-1-alexander.usyskin@intel.com>
 <20250630091942.2116676-2-alexander.usyskin@intel.com>
 <2025063036-hypnoses-ajar-fdb0@gregkh>
In-Reply-To: <2025063036-hypnoses-ajar-fdb0@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|DS7PR11MB6061:EE_
x-ms-office365-filtering-correlation-id: b3640071-af98-40a6-6581-08ddb7d65492
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SHJGVHJ3eEc5emlHY1JDb1N0NEZKMjRKWVhUa3VEaUc4dTZSTmVaQVNueHdV?=
 =?utf-8?B?ZnF5c3ljMUY3aXNsREpFVG1kMlJwbmFLTzJLaGluMnM1STZQUmxQL1kvY2Vp?=
 =?utf-8?B?SXZKcHFNZkptME1PcWs2TlVQMC9XYnlSVFJXWUgzMDBDU09ZVVNpa1lvQjhw?=
 =?utf-8?B?K3VwM2VJeEE4QkthLzRiQ1N2WlRpR3pCNXdJUmtiODlYQ2dCTHRSZkhVU3Y3?=
 =?utf-8?B?dzdubDk4TGJQMGhVYlVJc0x5ZUQ5U2VibEgwTElsNmNiY05ldjVnbUNzc1hV?=
 =?utf-8?B?cTZwa1dJeC9SRzJVYWkxZm5DUlJoK0l5ejFZWWlvd3hnaEF6aEM2eTNNc1l0?=
 =?utf-8?B?ZDdPa3RHeXR3K2ltM2I4U2pvSUgrNmFRbklVa2JPVDJoTXBKbXVuN3hMWWVl?=
 =?utf-8?B?ODdKSWUwb01SMlBxZ0ZHZHdaekpFL2VLOC84TVdnTXVud3lwZXFWNG8vUzlq?=
 =?utf-8?B?ZzJoY1BHbWFGWlFGdmFud3pBcjZsbWFWc0xJblZQM1U1OWRVME9JRTFSLzBC?=
 =?utf-8?B?L1RYejJFbTg3Tm4rT2ZVUTgrb2F2MlF3YkQ1dGlkc3drZlowU3d4K1JzUnRq?=
 =?utf-8?B?T3VWb0pYem5mbTNNNzdJZTF2VVRqaHZiYWZ0YkJETUg4b3VyeHlTQmxlRFFM?=
 =?utf-8?B?UFAwdG5nUEViTUFFcHA4OUloNXpjOHl4SUxKUWRPdXlkeTJPbnA0bFMrOHVu?=
 =?utf-8?B?TVpPNXNQaGlDSksyRy9rcER2em14V3pMUlVuNzRCTUd6cUl4eXVRVTBqay8w?=
 =?utf-8?B?U1J0Rm5rTnp3YSt4Q0h2VThJS1h1d3o4anMvcGVsQ3d5OW1DWHFuYTJiMFhC?=
 =?utf-8?B?a3JHSitwQmxTNjRjZ0djV01JM2F6djh5UVVUWXNVY0dBV3BRRCt3WUREMlVV?=
 =?utf-8?B?aUZ0SmtXTTZjZUFOUlh6eUhMVWg5NmJBQzNJVnZUQUdpT05na1dWaklBRW1p?=
 =?utf-8?B?Sm9PVGNpd3k3bWkrNUNpSVhmVVBlSHAvUExURCtJN1Qya2NKWGdGVjRZZHFr?=
 =?utf-8?B?ckF0SmZBZXQ2YmNwSjI1ZlQ3ZVo4eTF3WEcwYUgrYlhHNS9ZTitCQzFPaUtN?=
 =?utf-8?B?MzVKSDZSSXU2OHpNdkwrR21RV0ZaWXRCRG96Zm1sNmI4em1XNXFvTit6K0ds?=
 =?utf-8?B?L3dVZTk5eUxYZmMyYTB4bHNyaWJxMnI2Q1dkUHBqcUN2NWlJK2FTQjdmR3Jn?=
 =?utf-8?B?KzdScnR5aDdGRFgrMDlkV1E4UmNDN0VEYkZZb2J6WTZqZGMzc3RyaWNQYlIy?=
 =?utf-8?B?a2pTenNHZ2VzUDhwOHZJclRrTnYzUldxUEtmNFpsc2I5RGN5Smt2Z2tzMjBa?=
 =?utf-8?B?bUsvcHJaS0RBMVZ2RXNPNS91NHZSYWtLY0R3aElhQkZhY2pTbVNQTzN4WEha?=
 =?utf-8?B?eXltYzJuSG5PK201M3BsSGlBRGhZZUh3a240bWsxZ3dKMENKdUdwWjlFQTFy?=
 =?utf-8?B?RFozdDZyM3JSS2ZuWE9FTVI3Z0lQbTVUemhpUHZXZU9mWEUrTWFzTlpQNmFv?=
 =?utf-8?B?S1ZtWEwza05NTVpwdzNSbDVZR0pNUWNKRFQ1U2xla1pCL2FsMzRxeGFDWWRL?=
 =?utf-8?B?Z0RmaEthSEg1U1ByNEhkV2NqR0RBMXBVTi9LUkxOUGlqbi9CaGViaWVWeUdK?=
 =?utf-8?B?eEVXdWFyWlBHSkJ3b2hKVjVCaE1KNyt1bGJTMENTRm9HeitUWU1wR1drS28w?=
 =?utf-8?B?ZnB6clErTjZMRTFUZmMvOWljTEhZaEZ0TWZSTGVJazU0a1VUMXhIcWx1UEg1?=
 =?utf-8?B?T3ZOcnFqVTVqeWtvY1FEdVFoM3dkWmplakE4cHllTlExbk1xY3JFYllzY1ZI?=
 =?utf-8?B?ZDUwYkdMZkFCNEZ2YmhFbEk3M3FjWmdpV3BySjg3Ym5seDQ0bUZoRmhwRy9i?=
 =?utf-8?B?UmlDS2lqQms5YVdMUjdVbFZzRkY4Y3hvYnNIUzYxdXJodys0N01WbTlhZW5j?=
 =?utf-8?Q?hf33sM5Pi6g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bElYb0ZZdVQ1OTROWTJWQkJTUkdTL3VoSjNtMXRwRU9YTkhtR21Gc0dPYk9T?=
 =?utf-8?B?OE91Q0tVNmNsdXk0SVRldmJzWnZOdU8relB5MjJvamVKeXBCYm9lVFBLQ2FJ?=
 =?utf-8?B?U09rbEV3bVpKcXhwYVVMTXZVRUJJdmdybHEyTVgzcVZJS1hlamRkU1Y4bHpx?=
 =?utf-8?B?UkYyY083eFNSdzdabUY4NkhJaFRRZGNDT043RXFVamlOSk00MjNDbXBQMWty?=
 =?utf-8?B?NkRhWmVkUEJobk5MUGl3TWhvdmJPZlNIeDhOMHV0OGtjVnh5KysrM2Faai8r?=
 =?utf-8?B?clpWcjhkNExRNThSbFo2R1FNeVZnanI5SGRmd29OVy9LdTUyOS9kcFArRU5m?=
 =?utf-8?B?a1dPcW1Qd2lBTGdJMmZxOVE3MEVCL0ROaklXY2gwQUpDa3plS1pOUmJ6Uksz?=
 =?utf-8?B?ZE9WUEtrVVhTc2hTUTNDWFJKZ1lPbXFpcmlQaE5ncmEzeWZWeHJkaWUwZVpr?=
 =?utf-8?B?QWJPMVVFcWlFaW5qaVhIK29qUG5HNE9uSVdGdm01bXdaaGVyaXBLOEtpdU8y?=
 =?utf-8?B?RFVHZ1ZnLzZvamtJcmNWTnNQbWNNcVF3aXo4WVpRSkxEdnNSUjBhUncxU3Bl?=
 =?utf-8?B?Q1BLTEhSZWV5NGRTKzNrek92c29FcHEydWhSZFkrd0hIUUpLd2pnL0RXeVVB?=
 =?utf-8?B?eUNDUnJNVUVYZ0YxZWdPcXVIbHovU0IxVlQxUEhxaXpxSE5TeWgxZnZYWmxK?=
 =?utf-8?B?OW5MOFd4eG9INFlLdVltNDNDUStsN2xBdHpNMDdnbVFNMjV4ZVoxb3VnZ3NL?=
 =?utf-8?B?aHZVTitwKzgxSFhtd2VLcy91bE81Q2UycUpkNGxucFVUUFcvS0ppMTN3cGU0?=
 =?utf-8?B?QXZCTW9jS21tLzB4NG83RDIrT3JsMkc5V2tMRW5ycFErQ1ByeGJIK1lUR3hV?=
 =?utf-8?B?RWwyU1lzOWkycDZxRE1QQWZkRGRUeDh0akxpbEg5cFdYVTVUNE8rL003MGE3?=
 =?utf-8?B?bG5uU3RPNyt4aVNZOWpEdHptYWptbzJpczdQYzlZRHJtRWlQOG1rd2p4S2Ra?=
 =?utf-8?B?dmhNSTFtMlV4QzREelhQQnd1ZlFuYnFGSmVpTXJpMExzVFZKNTlKTE5rOStE?=
 =?utf-8?B?THBMTmtXSlc5ZERWSjNJMW1iMWlMamRySklYQlpTRVVMMHJuSWRXcnVsWFd3?=
 =?utf-8?B?NmVGb1p5ZDBLRHMxV21hSXQyWjIwZyt0WFRWbjJlcU1WNm43TmZoOWcvWFpQ?=
 =?utf-8?B?c0VXaTdhMFRXdzJMSTlERjB5bFBPME5sb0dRNm1GNEI3TWE3MWJtOU9FblN4?=
 =?utf-8?B?OTJac2RXTWZSSmFUcjU1bE5ZU0RKQUJGUFlDbTFiT3d2aC9uQ2hXVU9va05D?=
 =?utf-8?B?cWhxc0FLck1WSURGMUdseW02Y2pHS01CUFo3YklvMmpwc1JnTndjbnBMSi9u?=
 =?utf-8?B?cWg1enpVcXdFeXIzMEFnMVMrTElka0MyUHA4eHRNZWd4Y00zSGpqV1hvZnVq?=
 =?utf-8?B?cnBQN1NtZnVBODljSUp5VERvYnVIQ3NORDZRZDhWSnBlSkRBT2dpcGthZmhq?=
 =?utf-8?B?bGJMeUJnaTNVUW1pR3lIS0N5K3JZRHBDb0xyVC9ZMWsxSkVJRHVaS2hjcWlP?=
 =?utf-8?B?eUx0NHlnR3UrNUk1aVNmWFpJRmU4MWhKV2VmT0ljak0xK3BwMGhtVkdvOGU2?=
 =?utf-8?B?dlYwZElsZlB0RHZwOVlUZktyZTFYTEtaMXB0aW41MU9zK05rMWpiK1RzYnl2?=
 =?utf-8?B?WUtVWENERDBGQWd4dVZza3BaVTJ4QjdyaXVMa2tyNG9JSEdPNGJ3QVFrZFE5?=
 =?utf-8?B?Ukx6WlZaMHBLMVhQbFFkQklwckV1aHREZytGOXdMZkJQQWJBVHpFc0tMMytN?=
 =?utf-8?B?WFRMbzhuVVFsQjBManE4SytiS1FEcThlcHdSS1Fnd1d5eVNTOEZkQnNhRDlQ?=
 =?utf-8?B?TXRqd3crWG9DRW9SRk4yRHlMaktLUCtGMllIbVl3b3ZPUjNSMk92K0IvSkNv?=
 =?utf-8?B?MjB1dnNYVGxVWnBPVXZLcWVXWm50bVVwLytuSysxbkxJOHNob3hkMHVNemQ5?=
 =?utf-8?B?YWpEMVZEMmxpbDBvRTJ0OVJuTXhKWEI5ME54bzIxNFU4Ky9wUlc5dUFiUHd4?=
 =?utf-8?B?Sjl1dnY3MmtxUzZMWXl6NWZRQ2tDa2dZaG9ERkVObGtDRUIrdjd6azQ2ZjdV?=
 =?utf-8?Q?/WmU2VsAOjjc8pqIWN7zE6CQN?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b3640071-af98-40a6-6581-08ddb7d65492
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 13:02:12.6141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DkrKXTaDOuQTQByO+c7IBnjGiBRUO0U1Pl1m3epS/cXXKC97XJWyVj7+p4/qBThuiR1kVxDnrxtHkkJ3GHbRn+3HMuChxksL8oKTmEa02no=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6061
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW2NoYXItbWlzYy1uZXh0IHYyIDEvNV0gbWVpOiBzZXQgcGFyZW50IGZv
ciBjaGFyIGRldmljZQ0KPiANCj4gT24gTW9uLCBKdW4gMzAsIDIwMjUgYXQgMTI6MTk6MzhQTSAr
MDMwMCwgQWxleGFuZGVyIFVzeXNraW4gd3JvdGU6DQo+ID4gQ29ubmVjdCBjaGFyIGRldmljZSB0
byBwYXJlbnQgZGV2aWNlIHRvIGF2b2lkDQo+ID4gcGFyZW50IGRldmljZSB1bmxvYWQgd2hpbGUg
Y2hhciBkZXZpY2UgaXMNCj4gPiBzdGlsbCBoZWxkIG9wZW4gYnkgdXNlci1zcGFjZS4NCj4gDQo+
IE5vLCB0aGF0J3Mgbm90IHdoYXQgY2Rldl9zZXRfcGFyZW50KCkgZG9lcy4NCj4gDQpodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNi1yYzMvc291cmNlL2ZzL2NoYXJfZGV2LmMj
TDUxMQ0KKiBjZGV2X3NldF9wYXJlbnQoKSBzZXRzIGEgcGFyZW50IGtvYmplY3Qgd2hpY2ggd2ls
bCBiZSByZWZlcmVuY2VkDQogKiBhcHByb3ByaWF0ZWx5IHNvIHRoZSBwYXJlbnQgaXMgbm90IGZy
ZWVkIGJlZm9yZSB0aGUgY2Rldi4gVGhpcw0KICogc2hvdWxkIGJlIGNhbGxlZCBiZWZvcmUgY2Rl
dl9hZGQuDQoNClRoaXMgaXMgd2hhdCB3cml0dGVuIHRoZXJlLiBJcyBteSBpbnRlcnByZXRhdGlv
biB3cm9uZz8NCg0KPiBBbHNvLCB3aHkgbm90IHdyYXAgeW91ciBsaW5lcyBhdCA3MiBjb2x1bW5z
Pw0KDQpPcHMsIG1pc3NlZCB0aGlzIHdoaWxlIHByZXBhcmluZyBzZXJpZXMsIHdpbGwgZml4Lg0K
DQo+IA0KPiB0aGFua3MsDQo+IA0KPiBncmVnIGstaA0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0K
DQoNCg==
