Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com [68.232.159.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCC3221F07
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.159.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892415; cv=fail; b=ruzo1sxOtS1cY7XrbVglJ21czL2A/h75ZM+PoCkMrKCTtzUTtwHo4DwYGChcUuhbD7eQlQT9kSkEiU6uqENoCOOrcnbcqekSXV2iLmyLi0SgJbfAlTN6fpDNOpbglcoh1y0TsP+DlIDk2tYylbB6Z8vrK1S3W9vR5Za59ZIZlu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892415; c=relaxed/simple;
	bh=e++fsFqd5hwSitzMyfhf5yEdeoYJmyU9bJFeOCZiBus=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GdLHdi9QR9iKe5QHR7VltMQGnsblLMf7oZ9RnaKTAJ3A8aBpV6qCIgpIxslroxQCtC7Z/CC99572tQyoKCzFG7GUcLahdrJkaMMj4tgT17FxA90LFEiPn7unkKovxj1wfl4RvmyFnzOW5y3V05uF21hqKnfmClLdKjDaiNFgDB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=Kjd3uqso; arc=fail smtp.client-ip=68.232.159.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="Kjd3uqso"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1744892413; x=1776428413;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=e++fsFqd5hwSitzMyfhf5yEdeoYJmyU9bJFeOCZiBus=;
  b=Kjd3uqsorFT9gItDNgP7Pd5F3D1fTgqfh5icmBc61MDjfrt6YKKCQh/a
   YVq2xaD/Nekp4q8z6GLGO9R82bcCbtrpczWwGSgmflFyPNe5RrMSwrfDL
   AaOqPmolaIV2C6aKZzeadrlxa5RDn+x8pYHzOenhMHXiyuWwyF3u06NO3
   p2itx8k0/+453PCbQi56klLImsA5qM2AL7NczGVMrmTX+Eb9LvC/o66Hj
   qaqos+WSlCRes4sy5tN88rK3p4/vbI+MoFq83Vet22ei7iGDlneKXQNAp
   c60tDX9ABiCUuamxJzspbSFf2rtEBFrvCztpEqJISIbVlvDtqLh+4TUmZ
   w==;
X-CSE-ConnectionGUID: yO26y1L3Ri+Af9aH3q8/dw==
X-CSE-MsgGUID: O669wlR6RLSN0BNqLc6f+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="153047881"
X-IronPort-AV: E=Sophos;i="6.15,219,1739804400"; 
   d="scan'208";a="153047881"
Received: from mail-japanwestazlp17010005.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.5])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 21:18:56 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOSM7N7tigCgT7tOYP55+vHL8LrJEWxsz8ZIcgtkq/O38s9J4Xp/lQxRRorcAEpOBjqNKuIcXfd+gTNV0xE1Ueswxnr/Ap81cOGXAVTM+7ZOXNoSckM6l+IM0Xo7YLyM55Xp52RTNxaBof9SQ/aSwILD2yP/tz1RlaqkmozKhBKNmrnBuwJnhvsoAS5CEuFy+7rQX3V1xM3JLfoaqE06sgi+bb1/bBW0Kz26apx7rdLPELgH/HyOSYStCbtoG07og6jsmVMrI/LtT9KMBS0mG9ZWRVUnf/pdixjOfijM6X/huqF/UvdQIdnksl+suRtmBtAbpNaiohv3Izlwh8SkTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUKNWtDlSPFLQrFQkDGvmKLsh8UxvamIAjn97rVKjy4=;
 b=IVqwCsxu2v+Jg18fFsy/jF9/hC/20Ukmwxq4XjQvJgR9Ourb5IdA1HB8wG+yGrf4paO4Ov9GphWMxf+9Pk22tLUcLXR3bHmulwSIs1bn1EIj2ZLe9mxP9RKLPCqvLxb3PWm+e/B/BxbkFPf4qcpC+ZMkTMCBNyRgWj57p/QEOBDJIk74xzeGz1AI1OzkLneEPOIOAnFmiRDUdWTmYTdybrQcC4cg/nlVZ+C7dxdWeJW6uphREFP0cASsJ2uWNKd/pe6wVGzVC9xiDGoiZRP8Zxxre187sWZvSCuam4k30vIbgbDR5YxwAtr6tB+TYL/aidi6u/yznPE9ebQ72cnRvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYCPR01MB8804.jpnprd01.prod.outlook.com (2603:1096:400:18d::10)
 by OSAPR01MB7375.jpnprd01.prod.outlook.com (2603:1096:604:144::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.24; Thu, 17 Apr
 2025 12:18:48 +0000
Received: from TYCPR01MB8804.jpnprd01.prod.outlook.com
 ([fe80::b2f6:161a:adee:a32c]) by TYCPR01MB8804.jpnprd01.prod.outlook.com
 ([fe80::b2f6:161a:adee:a32c%6]) with mapi id 15.20.8632.025; Thu, 17 Apr 2025
 12:18:48 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: 'James Morse' <james.morse@arm.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Reinette Chatre <reinette.chatre@intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, "shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, "carl@os.amperecomputing.com"
	<carl@os.amperecomputing.com>, "lcherian@marvell.com" <lcherian@marvell.com>,
	"bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	"peternewman@google.com" <peternewman@google.com>, "dfustini@baylibre.com"
	<dfustini@baylibre.com>, "amitsinght@marvell.com" <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>, Dave
 Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker Donthineni
	<sdonthineni@nvidia.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>
Subject: RE: [PATCH v8 00/21] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
Thread-Topic: [PATCH v8 00/21] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
Thread-Index: AQHbqwDDproYr9OSz0yqirHmTaFBULOnz0nQ
Date: Thu, 17 Apr 2025 12:18:47 +0000
Message-ID:
 <TYCPR01MB88043F4EBA7A338ADBDC23D48BBC2@TYCPR01MB8804.jpnprd01.prod.outlook.com>
References: <20250411164229.23413-1-james.morse@arm.com>
In-Reply-To: <20250411164229.23413-1-james.morse@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=b8522c4c-af86-4519-8843-4adaa2bbed2f;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-04-17T12:17:11Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB8804:EE_|OSAPR01MB7375:EE_
x-ms-office365-filtering-correlation-id: cdfbb85f-e3cb-4ec7-9dd6-08dd7daa0134
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?SHVDemo5V3ZDTVl2M0VNN00wTlRrdWc4ZVZkVjhzR0FDcm1QZDlTYzNp?=
 =?iso-2022-jp?B?eGF2dVVTRkluZXFYN1dtQ2s3ZXo5Z2hNa09zbTJWM0FwUG1rRVVnOHBo?=
 =?iso-2022-jp?B?NitIbUpVblNDWTJ6TjZsM0oweDhaOHdOSXpNdXlETzV4QkZhblAxcnRq?=
 =?iso-2022-jp?B?RUZBM2NxbCswU3Z0bWI5dFlFcnZFRFVKWDlOVWRjeEtxdEZMeFh2OFNq?=
 =?iso-2022-jp?B?N1RqWEMzcXZlT0NDMUxXYWZCL2NRVmo5ZlkxcFR4UDFGNjlxTGZhSGJF?=
 =?iso-2022-jp?B?WkgxeWlHSjNnVndlRlhjVzZyVEFMSGV3WnNURGNVWTg5WklMSXdSNnZN?=
 =?iso-2022-jp?B?MnE3ODEzQmFEcXo1YVlwSmhGK2dETmJmYWNWK3hmWS9ZbnZIbjFBcDJE?=
 =?iso-2022-jp?B?UTluRzEzWkFkZnk2OVNaaFJ3M2R2Z1hSZXpzN1ZhK1gyaVZPdndING8y?=
 =?iso-2022-jp?B?UWtSNGd6K1BHclpYcjkzdStoR1UvV0VKZXJKOWFtQWcyWlAzVXM3d1pB?=
 =?iso-2022-jp?B?c2hadFBQMWJhYkNMM1RqQThoVnJRQ2ZKWTg0TzJBVFNNTWt4VmNmRFFL?=
 =?iso-2022-jp?B?R293YVJNSzNTRW9vQ3lEakNEVmNFd2JtQTNoUWhYUk5YZ2lCSXRNNWJ1?=
 =?iso-2022-jp?B?ZlZma0FIQkY5bWlXZjJzQlcrUDJOUE85Z2tlTHY1cWEyL2VSMjBjOTZX?=
 =?iso-2022-jp?B?UlhlRzdYNzZXM2h2Y2tnMmlURzB0NEtNZXFISTlVRzh2YXI1OGtZSk1C?=
 =?iso-2022-jp?B?Mi9McXFmV2JDY3VaZTUzckxxcUMyWGdnSmtEZWh4VVNFdFFKSk1FUzhs?=
 =?iso-2022-jp?B?R3ZKenBkQlVFcExmOEFOL1dBM0dpZmFLam43amczSTlTUVErWkVCNCtB?=
 =?iso-2022-jp?B?YVFONXBPTmlhUytkTU9QcXBkOGZKTmFyK0M4OWEveTFmeDJGclFwZEcv?=
 =?iso-2022-jp?B?aHBHSkgvaFE1SEtmdGdEay9YKzcvMkZibVBrZkdTQ2thcGhycCt3U29z?=
 =?iso-2022-jp?B?VzBoOUpGSjZXRVR1cHE0YStEZFlQNXEvK2JaZVVrUjR1OERjOEp4b2RD?=
 =?iso-2022-jp?B?RGU1TDI4TnBrOS9TUVh3VXpjSmEwRkxKNWQvS2JmelIzKzNFUkFickVr?=
 =?iso-2022-jp?B?ZTl5bi9mUEVSQkk2SHVZeUd1MVhuVitCNkVEMmFDNkh4aVo0NFc1YitN?=
 =?iso-2022-jp?B?aVBWUWg3TXkzczB5ZFh4OVphTHVXNi9mQ1lVWTdLeWZXWmRGV0JueWdH?=
 =?iso-2022-jp?B?bHd3QnJnZnd3N3UxTkRnMVNiQ3BWNzNxRzJmaUVOaDk0dnlWb2lzd3gy?=
 =?iso-2022-jp?B?MXFsQ1FPbFRoQzFnaU1UbTZXNlRZQWFHQ3oweUtzNzFDQ2tRZDBLNmhW?=
 =?iso-2022-jp?B?bUxQZGF4VysySjVBYlFmdFFWbkJTVWpLaC8vblVVVXpSQ1NWM1Z4b2ZJ?=
 =?iso-2022-jp?B?eG5YYmZiSUhxbzBDRzdlYk90MWoyZ3dDSEZYWDl4UzlmcmJPUzF3WEFp?=
 =?iso-2022-jp?B?eVF2VE1XeXZrdXJMZkJObE8yTnQwY0Z6akRaMTQ3ZXlXVVB1YkdvcW0w?=
 =?iso-2022-jp?B?d2FIbUR0MzJyYTlGQW9Fdm9nN0YwekdqSE83bUh4UHU1WktVY2pPWFFP?=
 =?iso-2022-jp?B?UVU1VW1KM0RnZE5xc0xsNTRIQlhUZno4VS9CQVZVN0pIWFlFMGc4Zm1E?=
 =?iso-2022-jp?B?eXdHL0RjN1BzeW9ZbEdpSVF5aWZDbDFEU2VaTDNLM05qWXRleWYzSGpy?=
 =?iso-2022-jp?B?UzFDeHFkY3JTemlBY3RmblppbHk4eHVQYS94ZjZna3Q5UGlWKzR5SHdH?=
 =?iso-2022-jp?B?UitSNWp6NXhsRnl4N3FxSFlrVWxaaHpWL3phWUROT1dGMEo5d00rbkVt?=
 =?iso-2022-jp?B?a29FQUl6UHh0dGpRSnNrN3hXamVhSWxwdnVOOGhYeWcrdUM1UWZXRW4x?=
 =?iso-2022-jp?B?dkx0ZUJKOC9rMFQwaFZ5Q2EyTG5VUy9yQ2sxSk9hK1Vhc0c4VjlQbXps?=
 =?iso-2022-jp?B?ZHl6VXZVblI5eHUvNDN1aXEzZ0NwQWR5TjJaQU0yMU9nSHk4Vm45Mlk3?=
 =?iso-2022-jp?B?cWZ6clp6bGpBUWl2WVcvVDBFZnVKakpQdTFvMGZDSjBYVnc5czB5cFFB?=
 =?iso-2022-jp?B?bHBqRkhSaVNrK1hiYUp3c25BOTQrVnN3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8804.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?VUllN1hjWlp0UTJ5U09SMFZSRjF4OGJBSVM3aFZJeUVDMEdvSU01ZDJp?=
 =?iso-2022-jp?B?dWc2VTNJSnAxdHZvSVBHTThvUDhNOThFT3lPbm9EMEswSUlPWHBxa0F2?=
 =?iso-2022-jp?B?aHFGWm9iNWVaeWZTRGM5WmxxV1NpWElYTThkWEVTREdvK1lxTWduaEps?=
 =?iso-2022-jp?B?RDFYdFU5VXZ0MW9IVEU5TkZxejVMY0FkTFUyMUlWcExGNi9kYmVlU044?=
 =?iso-2022-jp?B?NFl5ZndEVXY1RDVsSGtQaCs1Q1BtbS8zdS9YV3crNGNlN24xdW9McTQ1?=
 =?iso-2022-jp?B?MU04TXdzVEJzb2VkQVdMT3NoeU9jdTNIUDFIRlZpVm9IWkpZUXJWRUlG?=
 =?iso-2022-jp?B?bGxid2xLc0ZqanhNL2d2WE53UWY3UFp6WWtSVHRScjY5eTRhem9QTEY3?=
 =?iso-2022-jp?B?aWhYTHF0bDVjYVltY1hXZnNjaFEzVG1Sbi9HTGVkWFJLSHBIV09YOXJ6?=
 =?iso-2022-jp?B?a09WTUxvdzFrVktOZlhMNTBoWWEwTHFwVXNXYkNZdWV4eDV5OXRSYVlp?=
 =?iso-2022-jp?B?Y0lmNFQ1ZHErUTltcHN2QzNjRVZUbW93K2RxNk5vZFNXMWczUytZZ0tZ?=
 =?iso-2022-jp?B?Q2diVWdXQXFhTUVuRWRjOERZOXBCSVRkKzFnR0xVbHdzSjlZZkZic3hV?=
 =?iso-2022-jp?B?b2ppMjE3QmIrNkpTZERLUzNPbFUyMFpGeDBQdnVqQjR5MEF0WE9OalJU?=
 =?iso-2022-jp?B?dXE2QjFvR3NJa3NiL3RxTlAwK3dKV0dsZ3Z4SUF1SjZwb0x5TjhDWmlz?=
 =?iso-2022-jp?B?KzAzcUxSa29tSEtjT0hiUmZpYVFVZUFXd0ZNRFF2aXYzMUwxekUvRnNn?=
 =?iso-2022-jp?B?UHQvZGE5VlgwMHR3TWV0ZjRNaWI5YW9CdkNUVjc0WGVNRnBqbEZrZ2xZ?=
 =?iso-2022-jp?B?V3cwZ0Z4cGdtTk1mT0RPT0hDWmI1UTQxQlBFb0FhUWwzZSs0UkpheDRy?=
 =?iso-2022-jp?B?cHEzWWJPWTFBQ2hGQ0pxMXljemVadkpwbmdwbVlJVHM3Yzc5Q29oMTNk?=
 =?iso-2022-jp?B?bUVyWEZIVUgrTWJDZWpDNzJEVXIySG9oUXIvdk52bDYrU1g1L2gyRHNn?=
 =?iso-2022-jp?B?MDdUTkpnSUJzRzB0bDRCSndGRSs5VERGNUxTVi9nYnhuRmIyY3V2QzU2?=
 =?iso-2022-jp?B?c2tjYTJLTEV5Q2VQelJMVnduV0JSU0VTNVp3dFJnYWpFUHEydHlHZ1Fj?=
 =?iso-2022-jp?B?aFQ3V2dwZHNxOS9nOEptZXJ4d2JoL3FqT3lUc0x2bndEY1BYdndUSGxk?=
 =?iso-2022-jp?B?TUw3dGlZT2s3MzRYMWJnV3NWeU1qbkVIQXRFZjIxTURpdWtZSTUvTHVX?=
 =?iso-2022-jp?B?UDl0UDVOTXNmVENWVDJUYkIvbFV2QkJNcEg2ZTEwLzJUR0s5SjRlT0xL?=
 =?iso-2022-jp?B?aENXQ1Nmb1hiUVpranZqVGh2V3VkUDY4WkhqQ3VCOWkrZGg1NFBtUVcv?=
 =?iso-2022-jp?B?NnQ4YTcxTXlOWWw0TkRaUDRLelRrOWFNeWlxQjBFbForbzZVMGVrL0JY?=
 =?iso-2022-jp?B?MW16RGJzZHYzTnB2TjEvOVVTNDIxZkc4MXNxYU4rZEVKR2U3M05GVHZE?=
 =?iso-2022-jp?B?Snp3aTBFcFpsWWlvTWlrUUJIRmQvSGowK1ZXdTZsYXNlbDhuSUFESkFJ?=
 =?iso-2022-jp?B?ZGtOUHJVQ0ZXb2lpeDlpbkpPMHhCYVZEeWwxQ3lwaDRlYXpNUG1yeExo?=
 =?iso-2022-jp?B?NitRRzdlTXRUZFZ0M0UvWTNDdDZXeXlnb0k5clNxM0loeEtUbWU1TnJO?=
 =?iso-2022-jp?B?R0djMXdmMWhkMURaZnIwMjBwcnVuUnl2MjA1ZnJGOWdQYnRkOHJJaUNH?=
 =?iso-2022-jp?B?aUUzQk5rUUNLaktjYVpGY1k3SVl5MkVkVUN3ZHhSRDVUb1ZFemp4eDZv?=
 =?iso-2022-jp?B?amdNWi9DVC83MjZrSzFoa28yN2dzK25PUmZBNzh2VWFTV3VGc3NMeXBD?=
 =?iso-2022-jp?B?NTBsYWRGczBkd2dDdTJnSllsemE5bnhKQk0vbTl2WDZiOW9HM3BYcy82?=
 =?iso-2022-jp?B?cFhhQnNkckwyS0Y2cW82cGYwYStkcGRhbUwzcWVDVUk5czJwN2lqOXR3?=
 =?iso-2022-jp?B?RklvRU9KWWtad2o1d1ZYT0U4alhzb1NCV1hLOGlSeC9LSUVkQ04vMVR6?=
 =?iso-2022-jp?B?cU5HM085L1ZwbmxGSnVZTnYzVkJCTWVJV3U0SUlJaytEV2VxVEFuSXF1?=
 =?iso-2022-jp?B?MjlWUCs0UFVDZFp6d04rTG1GZGFqODRFTWZadDFhNTF0UkhoUmdIQjBF?=
 =?iso-2022-jp?B?WnlmVUkvVXJSbU90aEZ3MzRvRlExSitzcHFyNlhCOXZzUU0zZS82UVNF?=
 =?iso-2022-jp?B?dkY5a1psZjZrQVNHajE1Ym1RRnFnYWhBYmc9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VVynLu2w3wcEFkadyrFvmfT7cmAmSCL7+TlOzSNqVDM30RTIhryja5MrqMrGCla23KLLOT8xA+TKK2ImMeKurjkiJJtVsD3S8dkEJLAcRjls8sIvBtRoN20xM7cpvpl84J+PNvbyR1toBuMJKzmoE56nMcZckOUZcPcgcgW+NUGGNcINnl0zcVkd/Vh4sgOqWQyqLJ6WYhmQsZnLWlKubdoD1s2rLhtRF1JolTSjzSGilwdfXufLsqQ/T08vkP3YQuBt8MmYEihtnZTuPPPBm1/BVvWv48zddEAO8eezY2Tw4qtSpOejRyWb7G5HIG6FstbSwoI9zPgHScGPLdFierqPSqzmEv7bOJhm/elHRjHwE6GApXQxq1ubsfXZiK2hm/lH4f9YhWuaZfcZ8TskSukBpmS0+Yyc6L7WeKobq/5oUGJTGHb/pGwZX/bxqy1JZB8f1mEXjaPIv2J4+xWoLPGdYwkJGnhMotahnnBPX/dVpKlV/+QxTFzQMUs1sVlSzEsMCNoDxHV/IW9R9xyFf4WWGSeLnQBoaGyKLLYh0G7BNbd+ZGpVeFYbV7uYFCsIi1gTWndZPS3EZ/ahcDoRuK4ZnZYHjGps/iYz3ID9anUIIrAgzt87G7AjbFCm2lpx
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8804.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfbb85f-e3cb-4ec7-9dd6-08dd7daa0134
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 12:18:47.4489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LQuyEFgncOn+sEzwBUWorWZa+yp3mXKFlod5XzrMIFXGkOt8sYzqMmcY6CLntOBScN2f2zkQFlj/IFoB0tXjXBPWHhjVwBnHI/pH5peOqu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7375

Hello,

I ran tools/tests/selftests/resctrl with the following patches on AMD EPYC =
9454P 48-Core Processor, it looks good.

https://lore.kernel.org/lkml/96d276c11e69cfb1e29d50a12c8043555c06b404.17181=
44237.git.babu.moger@amd.com/#r
https://lore.kernel.org/lkml/cover.1717626661.git.babu.moger@amd.com/#r

Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

Best regards,
Shaopeng TAN

> -----Original Message-----
> From: James Morse <james.morse@arm.com>
> Sent: Saturday, April 12, 2025 1:42 AM
> To: x86@kernel.org; linux-kernel@vger.kernel.org
> Cc: Reinette Chatre <reinette.chatre@intel.com>; Thomas Gleixner
> <tglx@linutronix.de>; Ingo Molnar <mingo@redhat.com>; Borislav Petkov
> <bp@alien8.de>; H Peter Anvin <hpa@zytor.com>; Babu Moger
> <Babu.Moger@amd.com>; James Morse <james.morse@arm.com>;
> shameerali.kolothum.thodi@huawei.com; D Scott Phillips OS
> <scott@os.amperecomputing.com>; carl@os.amperecomputing.com;
> lcherian@marvell.com; bobo.shaobowang@huawei.com; Tan, Shaopeng/=1B$Bk}=
=1B(B =1B$B>R=1B(B
> =1B$BK2=1B(B <tan.shaopeng@fujitsu.com>; baolin.wang@linux.alibaba.com; J=
amie Iles
> <quic_jiles@quicinc.com>; Xin Hao <xhao@linux.alibaba.com>;
> peternewman@google.com; dfustini@baylibre.com; amitsinght@marvell.com;
> David Hildenbrand <david@redhat.com>; Rex Nie
> <rex.nie@jaguarmicro.com>; Dave Martin <dave.martin@arm.com>; Koba Ko
> <kobak@nvidia.com>; Shanker Donthineni <sdonthineni@nvidia.com>;
> fenghuay@nvidia.com
> Subject: [PATCH v8 00/21] x86/resctrl: Move the resctrl filesystem code t=
o
> /fs/resctrl
>=20
> Changes since v7:
>  * Switched to Tony's alternative for having a structure behind struct
>    mon_data.
>=20
> Changes otherwise noted on each patch.
>=20
> N.B, the disk in my machine recently died - so I've re-done the feedback
> changes multiple times. Appologies if I missed something on the second pa=
ss!
> ---
> Patch 1 has been posted as a fix that should get picked up independently.
>=20
> Patches X-Y should be squashed together when merged - they are posted lik=
e
> this to allow folk to re-generate patch N, then review the differences on=
 top. Not
> squashing them together would expose a ftrace build warning during bisect=
.
> (but who does that!) That would look like this:
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
> mpam/move_to_fs/v8_final
>=20
> This series is based on rc1, and can be retrieved from:
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
> mpam/move_to_fs/v8
>=20
> This series renames functions and moves code around. With the exception o=
f
> invalid configurations for the configurable-events, there should be no ch=
anges
> in behaviour caused by this series. It is now possible for throttle_mode =
to report
> 'undefined', but no known platform will do this.
>=20
> The driving pattern is to make things like struct rdtgroup private to res=
ctrl.
> Features like pseudo-lock aren't going to work on arm64, the ability to d=
isable it
> at compile time is added.
>=20
> After this, I can start posting the MPAM driver to make use of resctrl on=
 arm64.
> (What's MPAM? See the cover letter of the first series. [1])
>=20
> As ever - bugs welcome,
> Thanks,
>=20
> James
>=20
> [v7]
> https://lore.kernel.org/all/20250228195913.24895-1-james.morse@arm.com/
> [v6]
> https://lore.kernel.org/lkml/20250207181823.6378-1-james.morse@arm.com/
> [v5]
> https://lore.kernel.org/r/20241004180347.19985-1-james.morse@arm.com
> [v4]
> https://lore.kernel.org/all/20240802172853.22529-1-james.morse@arm.com/
> [v3]
> https://lore.kernel.org/r/20240614150033.10454-1-james.morse@arm.com
> [v2] https://lore.kernel.org/r/20240426150537.8094-1-Dave.Martin@arm.com
> [v1]
> https://lore.kernel.org/r/20240321165106.31602-1-james.morse@arm.com
> [1]
> https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.co
> m/
>=20
> Amit Singh Tomar (1):
>   x86/resctrl: Remove the limit on the number of CLOSID
>=20
> Dave Martin (3):
>   x86/resctrl: Squelch whitespace anomalies in resctrl core code
>   x86/resctrl: Prefer alloc(sizeof(*foo)) idiom in rdt_init_fs_context()
>   x86/resctrl: Relax some asm #includes
>=20
> James Morse (17):
>   x86/resctrl: Fix rdtgroup_mkdir()'s unlocked use of kernfs_node::name
>   x86/resctrl: Rename resctrl_sched_in() to begin with "resctrl_arch_"
>   x86/resctrl: resctrl_exit() teardown resctrl but leave the mount point
>   x86/resctrl: Drop __init/__exit on assorted symbols
>   x86/resctrl: Move is_mba_sc() out of core.c
>   x86/resctrl: Add end-marker to the resctrl_event_id enum
>   x86/resctrl: Expand the width of dom_id by replacing mon_data_bits
>   x86/resctrl: Remove a newline to avoid confusing the code move script
>   x86/resctrl: Split trace.h
>   fs/resctrl: Add boiler plate for external resctrl code
>   x86/resctrl: Move the filesystem bits to headers visible to fs/resctrl
>   x86/resctrl: Always initialise rid field in rdt_resources_all[]
>   x86,fs/resctrl: Move the resctrl filesystem code to live in
>     /fs/resctrl
>   x86,fs/resctrl: Remove duplicated trace header files
>   fs/resctrl: Remove unnecessary includes
>   fs/resctrl: Change internal.h's header guard macros
>   x86,fs/resctrl: Move resctrl.rst to live under
>     Documentation/filesystems
>=20
>  Documentation/arch/x86/index.rst              |    1 -
>  Documentation/filesystems/index.rst           |    1 +
>  .../{arch/x86 =3D> filesystems}/resctrl.rst     |    0
>  MAINTAINERS                                   |    3 +-
>  arch/Kconfig                                  |    8 +
>  arch/x86/Kconfig                              |   11 +-
>  arch/x86/include/asm/resctrl.h                |    7 +-
>  arch/x86/kernel/cpu/resctrl/Makefile          |    3 +
>  arch/x86/kernel/cpu/resctrl/core.c            |   31 +-
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  635 ---
>  arch/x86/kernel/cpu/resctrl/internal.h        |  397 +-
>  arch/x86/kernel/cpu/resctrl/monitor.c         |  909 +---
>  arch/x86/kernel/cpu/resctrl/pseudo_lock.c     | 1092 +---
>  .../resctrl/{trace.h =3D> pseudo_lock_trace.h}  |   26 +-
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 4426 +----------------
>  arch/x86/kernel/process_32.c                  |    2 +-
>  arch/x86/kernel/process_64.c                  |    2 +-
>  fs/Kconfig                                    |    1 +
>  fs/Makefile                                   |    1 +
>  fs/resctrl/Kconfig                            |   39 +
>  fs/resctrl/Makefile                           |    6 +
>  fs/resctrl/ctrlmondata.c                      |  660 +++
>  fs/resctrl/internal.h                         |  440 ++
>  fs/resctrl/monitor.c                          |  929 ++++
>  fs/resctrl/monitor_trace.h                    |   33 +
>  fs/resctrl/pseudo_lock.c                      | 1105 ++++
>  fs/resctrl/rdtgroup.c                         | 4311
> ++++++++++++++++
>  include/linux/resctrl.h                       |   10 +-
>  include/linux/resctrl_types.h                 |    5 +
>  29 files changed, 7731 insertions(+), 7363 deletions(-)  rename
> Documentation/{arch/x86 =3D> filesystems}/resctrl.rst (100%)  rename
> arch/x86/kernel/cpu/resctrl/{trace.h =3D> pseudo_lock_trace.h} (56%)  cre=
ate
> mode 100644 fs/resctrl/Kconfig  create mode 100644 fs/resctrl/Makefile
> create mode 100644 fs/resctrl/ctrlmondata.c  create mode 100644
> fs/resctrl/internal.h  create mode 100644 fs/resctrl/monitor.c  create mo=
de
> 100644 fs/resctrl/monitor_trace.h  create mode 100644
> fs/resctrl/pseudo_lock.c  create mode 100644 fs/resctrl/rdtgroup.c
>=20
> --
> 2.20.1

