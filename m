Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AC93C0C;
	Fri, 28 Mar 2025 14:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171343; cv=fail; b=VHEiyml7Occvm3dAQr4A3a4nMdZ/K7J/8QQCHFKZmKZ0Wb5ttt/3RCCOa0Z9oi6JR8Ae25EiUb3YekciXIRpPgH9dyOv3VoC1ujSctT++/x4AGK4/n6NoGl+W9pX/0z/zmtbtXdlZyXfIH45fvn9AZFgwgrECMVKcULI/JkZVuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171343; c=relaxed/simple;
	bh=DiQV2LzbIALpj2lFcl2ajtUj9aO/Ip2WvXkzVbPy8to=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g/5KsoDXUmZ3+639mwwx3mtYZPemq6tFKStzrrIMl3YHPteEHNGCHY91+GkMLHYiKw1GZJWDQ5G0u9nMMCz1FgQW7qCjuP/iPaGTgVtxW6V4gD+IvB0oNCK6ynJERbcRCRHZ+wrRJ74TVId17qOgqP5N95T60S2+KLTh9v86w1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUSSUBt6; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUSSUBt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743171342; x=1774707342;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DiQV2LzbIALpj2lFcl2ajtUj9aO/Ip2WvXkzVbPy8to=;
  b=gUSSUBt6kAiCpKML6e34zYyMZjCh9XHBR8rHm3n+06mbazS0KDDoe/QK
   Bn83H3e2OnyzFWOtJZUQGqlx64ZFHuqG+k6nBxQvJe+7btRIoa+KpUrOX
   Re6tQg9+DPoTwurycNcufDnLNRlOwz5iGS13O0lTVuv1VZaiBTi19tNt2
   3x/dT0MRPAhLIZ+oblieHFCUV27qWxrtMOrQ4dTtU9pqaZL0dQKgTjGfs
   +3YMm/FKiB/y+XWsrKn1pMxvGMZQnY2j3ZWcLGZwWxkacD3TuIKnUTJpl
   ZAlJc/DY7lFkxeRVAXi9UMdD/Hqj8XHyN53BYVAbJoF44rw1q9dGMMMtW
   g==;
X-CSE-ConnectionGUID: LpMSkLPGRlSf7RXCI7/P8Q==
X-CSE-MsgGUID: FklTZV2TScW0SaQ1hpSzag==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44416012"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44416012"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:15:41 -0700
X-CSE-ConnectionGUID: UX1Y11VFQ/uA28uQM0SuXQ==
X-CSE-MsgGUID: kRQvKwrkTHSgtBtKCP+GcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125683022"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:15:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 28 Mar 2025 07:15:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Mar 2025 07:15:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 07:15:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTXpX5wuZ56spg1Le9Lp8U2eCrJLfpNnSTG2jLBl42RHD6IKKc+nr1LWPWw/VN+2ZOvJvOALUBn7pKeihqiSpyJNQM0KL+TFQIt/Uouyv4PJPrLjL4RbvGC11geD6dQeg1QSeL9maEkuoUZQEEJp70KG6K1y5v1OQgXJp4D0WXI5k8kNgvIkQdOZbEP5YQwlmR5BjEH3BIqh+Xsq9DZecxcoglN+qj+4CQWeZIofzTl/VsJt1eFTtpEJ6jqct0Y573q2eAUEituxhRo0ohvHwmd0kru7EUBSz3flrrZ1PBJ3SX6Ff+gAwGaJpU2kaQR1iFyfahfB2RXUPPGajOKIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ii5Hv33XgeGTb+GdW979t0Fe6gSSlA/fdP9gV8Jcy3w=;
 b=guT7ngIpk5+gE7jofUubvHKHIjbf1KB3TQw0XvpkDzSPzBFIlQSzaao7r16XbWcVszhB4xWmvh6LMox37oGxDKbaLEYCfRP8yWiMCtqqtXP8O/KOolJTUdArEX9h56ezF2tdzev2X8I0EqjIlRVusKzwQ34CELExEN78ouIhbHqOXNUBxWFk5fLIqBs7mc9gsq6rBLGf6LfagWoO0uqG9AnwBSLruxayjHlflsh4SZPUs+tEzm5w9jKYSUPDR/ozAFiCRjf53xIREgsvfgYSQD75Bo3pc9tOWmkTqnH3ASEEd5UDm0k639vd8wh47Hd2uuh6zvTBiWNTNPxtVbE4eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 14:15:37 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:15:36 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, "sound-open-firmware@alsa-project.org"
	<sound-open-firmware@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] ASoC: SOF: Intel: hda-sdw-bpt: select
 CONFIG_SND_SOF_SOF_HDA_SDW_BPT
Thread-Topic: [PATCH] ASoC: SOF: Intel: hda-sdw-bpt: select
 CONFIG_SND_SOF_SOF_HDA_SDW_BPT
Thread-Index: AQHbn+Tf7FhwGAWUVUmqRNxrJ9JBvLOIlhXg
Date: Fri, 28 Mar 2025 14:15:36 +0000
Message-ID: <SJ2PR11MB8424B5677C548803F2F2A513FFA02@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20250328132438.1024742-1-arnd@kernel.org>
In-Reply-To: <20250328132438.1024742-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|PH8PR11MB6707:EE_
x-ms-office365-filtering-correlation-id: 94abf547-87f2-4b26-b17c-08dd6e0302e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?us-ascii?Q?kMrvZfJyQRmHDe43C/+C3Gaplo6MB5i3FvdtJhUsxGffjWgudGfTzShHYqjR?=
 =?us-ascii?Q?JWE0qbxwcbmgHhx+3q3vK6bIaFAZfOpn7L6G5WgqO2rF2UAXdnYCwMDdEQt0?=
 =?us-ascii?Q?FPxytT1Le1GlJUZb1zElNp7Wyj0h4ygprht7ImKF4EuyXhIW/9I2Pezzx2rA?=
 =?us-ascii?Q?5f4k59Yu7Qf+d/Efcpz9zvrf9OOx4GuWKnzwI6XOgzUhZPGhwegfBLqHdi9S?=
 =?us-ascii?Q?d6CHp6p+wpOJdHiuwiISrhQtANkPXHhVfWNSoqmRUzjTfsNnAwctuRtpSNwy?=
 =?us-ascii?Q?+NJ2hw4EUN4el93qViNznh9qvMSdCHVq4lOm6JX64QFmdkj/Zkpf95Y0i3Td?=
 =?us-ascii?Q?AR2zRkyHAsIhc58EbKEll/lREvjd5NQl6j0i2JBQQjc6gUoZc7U9af5xJx7f?=
 =?us-ascii?Q?qyjIaCgByverFmO6iro8YRO7qI//Cb/YuO0fXL0FgUYpmizjRz9gRIrtMrmD?=
 =?us-ascii?Q?0xTMvM6TRyI+Om/qQjSIs2A4er/dIsM/NfS2WFqmq5Zs0CdZGfKoAH0tcqoz?=
 =?us-ascii?Q?gSHU0aM0ChuUNXV3mc/gBxj2a5vTaJdYBNZB6VvGu3uudTc6gnPNTT/6Rx06?=
 =?us-ascii?Q?WyHuV/RmtYu8UbfOZKnS6Tc6edX76pIMEHkr9jts5pcjWP5oPyr9ZfOm1mzC?=
 =?us-ascii?Q?Wzf0X5dajN3QA6xN3EDdM1aPvxYAtCZF6kh3hhBcrZpkLCkRj9aabYkz+sfB?=
 =?us-ascii?Q?3C8f5swPclVrrGRBDtqTEo66Cah/9MUJ8YyYUrIiHsenz9yFA5qqkXVfKAKP?=
 =?us-ascii?Q?JxGn8oBY18X7ElLQtcXwF0ML2TQ2PDFM/pZmQq18F64DF7S0wQsSFyjC9jOd?=
 =?us-ascii?Q?AHRgrkXsQo5PuTQn8ORIHy5uryEAVAkSkNS1NyqorazEyzIo4ixgJtH0Pj2A?=
 =?us-ascii?Q?ifzaSFeZ8Prxbg3pBDXRrEQrZ39HgRTtVgMmlhaIsgq9tIiinn5Z5KmuAvos?=
 =?us-ascii?Q?uIgY5f1pJVO5hy7RccK88uHyRQap2VTfyGwkjuXQihdRd7/YvLTcjjK86tY7?=
 =?us-ascii?Q?CW6idnDLU6zY7BnVlqzy+GXwIv+SX3bYov6aJLsHbTRvyWrHtR9+HEdU5ycM?=
 =?us-ascii?Q?Roujf9r5682bIGL38zt35+iHEdq5PAzrk70fSnUn1L5Q2VlGUyN3Sw65GtAW?=
 =?us-ascii?Q?uuVIcSsKvBvppoEuLWKRXPaQaNDBZ7DRMBloo3OYQ4WDuu1X5tl8uTQrfe9o?=
 =?us-ascii?Q?l1QryfAPjwyvEGyeeLPeNJFEqYyS4GcOL2PHqwfTjL9zNACSXgdNctSzBZc9?=
 =?us-ascii?Q?qm8plBC5kxws456nGA4CeU4I6hg8xM7KVRQ7idO2sb5eJCmKQeQk2LzEtA2h?=
 =?us-ascii?Q?Gbztfy5+iQihXW0O78cHQf9ZnYq1EqkKctNt8flplYSDMgPHiXejiZzqSice?=
 =?us-ascii?Q?Pp2h8T8Gss5FUqVyw2F6HJTSoTadT/BQU+VY0GQHEI8y84FqVjbG7HGR6YXp?=
 =?us-ascii?Q?84n3KGx+LIWW3476nTICZIgrkU9sFQh6h8g6EJujJd9a4xo7xI/4TA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZyeKwKdX55IUqWNpkekSrVHPXzqMKGMD9TiiHFmU/UOdFG8EPnBpQy2WZHdb?=
 =?us-ascii?Q?pPgeNPTQav0EMd1oaYLBeszvQYZsegHrfLSxMz5B4Xe63GsHCcl094wLRA4q?=
 =?us-ascii?Q?ZvhRA1Ux0ELf3NvdK2TK9N3v2LrEmTVCW2lCo9M10o9Yw4z9y5oIKpBCundt?=
 =?us-ascii?Q?MzOQY8sczA/8K1Ku5+PIWpM2W7piwvizt41GtjE5k9lASJ+oB0jbXZb+6vUu?=
 =?us-ascii?Q?cpGUcM+X3QotEXmErEgJGM/Z4dCqIM32Xh6QUWXy8E/sf4VKAqjVJvzEUvko?=
 =?us-ascii?Q?pNeMkG/L5vXRhZwpCyPzPJFVHxcbXONnLtXfYkdS2dIpZz91xhz3nGx/DJhp?=
 =?us-ascii?Q?e7MiL3tasfuPF2j4dxHVa/X3CwbNeUgfZjGO19VmOipo49i0P6d1bKTtV125?=
 =?us-ascii?Q?7A5X/fgqHpf1zALQ8RIr9Tr14I39T1Ik6sDOnRqMPVrqCTabsU9HurQh4QbZ?=
 =?us-ascii?Q?dO1DS3Rya/q7RF9fFzL6boH/av7W2UfIBlcFcKRovxoPDIy23RFa+zydfZnT?=
 =?us-ascii?Q?VJUVKU0IzPjtyaX7y1hCN+4bbUEIq0OI+LWcpjntHt3lTd/e3R98oORfn/ia?=
 =?us-ascii?Q?+o1thSQ3R3j5Npvd/TxLexR6pM4v1s6BBKjH/EkqOp7bZCID3fIChpkmZbR4?=
 =?us-ascii?Q?DUiVNEUS00+mhnjzXkWEBljdNyUZZNb4rDNRzvQqAcU/379uA10YCUSvlGNA?=
 =?us-ascii?Q?gg3Q/COxdgwCy3y1ZRjW69UpMcDEpU8v+iM0JjoAXQEhmPjP9l+RSgybxOl7?=
 =?us-ascii?Q?r3+uGvChLHYEc8TRHx7mhHEUQNSCNev01IbsRK8LFLFOcWrGppKN6VjnVaAj?=
 =?us-ascii?Q?04gOxUPq7JrthtUudsTGYZAj9kowj3vB7spTUW04zCD8KNQk+HdqSrzX5ckG?=
 =?us-ascii?Q?U90GHp4SYjrUOUWwpjvXNlABk1nAKQyHwx7Nssemtpo+Jj7oxzrCM/AvaK+M?=
 =?us-ascii?Q?mCha/IQmeCkhifml/L2efPIE4JTjfJgMAuzhNFzHgYjgYEQ+Fw9LvkLI7UCO?=
 =?us-ascii?Q?e+K2XEmPX5FwxkmN937DvuwX2Wrg3hceU6ku081hqrYNln6UcQ0NvtWoZ1Dm?=
 =?us-ascii?Q?XNaqYk6gJJEiJMMkpI8duv3BUcwLVFCt5qbrSr99EXBO+YJM5qaBBvzk6L5d?=
 =?us-ascii?Q?d1P4REePQPHkzzlj9NAHkz7jc+1aAjYHD74ND7maiGfuSgct4GpgzaM+KSdH?=
 =?us-ascii?Q?Hn6UIFIZLmqSVQnZhK3BiT7KvJUq4UIQtydOGyO+70GKL7KUd8r3v9gKxfqr?=
 =?us-ascii?Q?C4cm91oCa0/jYCcrQt1W+Jv9FijY/ulBspRGxulNNFKdM5tG8/C625tSi5GD?=
 =?us-ascii?Q?9DGTxhOdrlWM/FvGWFbtd5vpEoWk68NH4HSCE89fU55XvfN82VXd4rrvf9rf?=
 =?us-ascii?Q?57sOjbAErXiArz+g4vHg/x4bMoserA0vfsTEy6ZLsKNLhJQYvqp2oQ6I46Uw?=
 =?us-ascii?Q?G1TwmuNhK05ryTvNhSnAX6aHM2Uqmv+ITy90dS1xQo4gzAc6sfyjM6+HH7pU?=
 =?us-ascii?Q?u50UHqQ7gcckHHM2Fbj1u+2UzQAonCvYn5cU+BqjkFcZuy4+Ofvfpqr8aUIh?=
 =?us-ascii?Q?wzgnlPRQkRy0H3gx1/g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94abf547-87f2-4b26-b17c-08dd6e0302e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 14:15:36.8595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WvWnZ1e9MPAb7LUlPQpKtM8p2ZjGOC7AiGsnuULLZtullwI02qbrJKYV6yDUC3ecVhuYb8WfXif2p+UQy8jx1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6707
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Arnd Bergmann <arnd@kernel.org>
> Sent: Friday, March 28, 2025 9:25 PM
> To: Liam Girdwood <lgirdwood@gmail.com>; Peter Ujfalusi
> <peter.ujfalusi@linux.intel.com>; Bard Liao <yung-chuan.liao@linux.intel.=
com>;
> Ranjani Sridharan <ranjani.sridharan@linux.intel.com>; Daniel Baluta
> <daniel.baluta@nxp.com>; Mark Brown <broonie@kernel.org>; Jaroslav Kysela
> <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Vinod Koul
> <vkoul@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>; Kai Vehmanen
> <kai.vehmanen@linux.intel.com>; Pierre-Louis Bossart <pierre-
> louis.bossart@linux.dev>; sound-open-firmware@alsa-project.org; linux-
> sound@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] ASoC: SOF: Intel: hda-sdw-bpt: select
> CONFIG_SND_SOF_SOF_HDA_SDW_BPT
>=20
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The newly added driver fails to link without this:
>=20
> ERROR: modpost: "snd_hdac_ext_stream_start" [sound/soc/sof/intel/snd-sof-
> intel-hda-sdw-bpt.ko] undefined!
> ERROR: modpost: "snd_hdac_ext_stream_clear" [sound/soc/sof/intel/snd-sof-
> intel-hda-sdw-bpt.ko] undefined!
> ERROR: modpost: "snd_hdac_ext_stream_setup" [sound/soc/sof/intel/snd-sof-
> intel-hda-sdw-bpt.ko] undefined!
> ERROR: modpost: "snd_hdac_ext_bus_link_set_stream_id"
> [sound/soc/sof/intel/snd-sof-intel-hda-sdw-bpt.ko] undefined!
> ERROR: modpost: "snd_hdac_ext_stream_reset" [sound/soc/sof/intel/snd-sof-
> intel-hda-sdw-bpt.ko] undefined!
> ERROR: modpost: "snd_hdac_ext_bus_link_clear_stream_id"
> [sound/soc/sof/intel/snd-sof-intel-hda-sdw-bpt.ko] undefined!
>=20
> Fixes: 5d5cb86fb46e ("ASoC: SOF: Intel: hda-sdw-bpt: add helpers for Soun=
dWire
> BPT DMA")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I have the same patch which is pending review/apply.
https://patchwork.kernel.org/project/alsa-devel/patch/20250321023032.7420-2=
-yung-chuan.liao@linux.intel.com/
I am fine if we go with this patch.
Acked-by: Bard Liao <yung-chuan.liao@linux.intel.com>


> ---
>  sound/soc/sof/intel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
> index 41cb33fe98fb..7e92aa2f7e39 100644
> --- a/sound/soc/sof/intel/Kconfig
> +++ b/sound/soc/sof/intel/Kconfig
> @@ -351,6 +351,7 @@ endif ## SND_SOC_SOF_HDA_GENERIC
>=20
>  config SND_SOF_SOF_HDA_SDW_BPT
>  	tristate
> +	select SND_HDA_EXT_CORE
>  	help
>  	  This option is not user-selectable but automagically handled by
>  	  'select' statements at a higher level.
> --
> 2.39.5

