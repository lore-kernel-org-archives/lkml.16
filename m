Received: from esa18.fujitsucc.c3s2.iphmx.com (esa18.fujitsucc.c3s2.iphmx.com [216.71.158.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6171E4110
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.158.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747104159; cv=fail; b=D0FwXuEhEP01kM/vLQx2VqaSPRp/U0uAFQO0rYsPc/R4HibPo0HwiSJcorPXx7vbDHw2MA1Jz9XAmoW+3yfmniQtDWaLbn7Lihs4dUIaPwkvhpPnrzEJWAy8xQdzk78YLmcn9VZjhLYuJ/PqwWuo2ZF0N279uunYmXu92TFXfHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747104159; c=relaxed/simple;
	bh=tuOzelBYBdGYRq7CF32fgUuGYAWmAf8lTBUszvLO2To=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V9pXkwjtKsrgR60l/2eXBLaFwJYCPrRBG+u3S+gEV9sseYrdclP5kNf0vMHm9JictGKytNJQ18bC9B+JJ6SoJ97i6YHZ6ahLTtrfS9GeMTUnXpD70bBI/RG3h8BgV3Pu1LfPpn7Hn4yjckrNi8wbpYKRMCaZCjBBEfC72EDzEXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=hv4VpX00; arc=fail smtp.client-ip=216.71.158.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="hv4VpX00"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1747104158; x=1778640158;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tuOzelBYBdGYRq7CF32fgUuGYAWmAf8lTBUszvLO2To=;
  b=hv4VpX00NynQzAao34wWPBWpGRQc/q2ndOCcYp+kh2n/e/ge6OXAvqhp
   F86M6pUtsUKvfceJBxQqX/QxaIfs0MDlByZQr/s9MJgA3UngePwlvUwYe
   IZy8XqfTFZ1Btm/QBkGaxV9meJyY46rOqcAe7pxj0ZqOJLx/4+57+MUAI
   PxnVJwwgjRdX8I7ZHbIZyMx7kJE94x+Vf1lWhwkebJ6gOMrKu/d34vt9C
   a3wl6+6b52o2gtPeLIDG7Y1NhN4vOlpzz893KOG/PH4HoF6Rb6H5mtsZ3
   RNIxZWjubacdZsAiNKD/a0BJesXXvMAAUaq+qHDsecLyObNjusBkO/OMt
   Q==;
X-CSE-ConnectionGUID: P+w2OxUKR2yzl/BVXkkSxA==
X-CSE-MsgGUID: 7igtrwhFS/6sepcp+wvhAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="161904023"
X-IronPort-AV: E=Sophos;i="6.15,284,1739804400"; 
   d="scan'208";a="161904023"
Received: from mail-japaneastazlp17011029.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.29])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 11:42:24 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIjexGpETxCRXggvcKwgZenUDsOljTEyue0+ZX/mcrBCSIifpvr6haT9sIXaC5czDOhwU5uh+B1tC8Hw0NVXKCn+pREX00k+aVHzzEzODSAMnmBM6NDoh8cMkmz4Mi2HlSVbzGHqkLbsisicFw0jxNCAU+SIU5jTSuWNHVueE2S9LwSQhxqwdekEEMaVvKSHcck1H2XsSSokeWkrICEXVn3MUUW9QQDcDRerA6xrY9Qf6pxAB0W/Ys1H9gfDRmzS4Eti3oQ1OsAbrEu7N2r1pzdfvgZsdXg41zbnQbHzGLeUCJ6pjRer8ozU+Qy2+OegaCyxvwkjq3gZXJFpjR5xcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh2gxDWnefB6RcUMwMKP/v7QmUEVOeuM9kaE0/Van+4=;
 b=tNV0ObK2ZXY5HtJ0ZVU7NBSEyWTCIjCxq13gcmkhFqcAVca25rpb+dLfnoTeYhkypRVPeEGtvwDHBZK3DJLYRpWaf7WWzvX6D7eOWuLjLDbb4yGwLgxg1CmUNogf34SHnG0R8j6ME2oxbCYD/XLL9xXAzxxgzJYtIx99PSft1cVtYWdT3BDpOz5RO7UDN9w8ddKYZWyXg6PriU0YyryDyOePvNK5KNa0isaNA9F0wVGngZpqpV6PSkEJHFmcZmz3rbuoH1HqQ0viPtCEi/ePHLis+3daepoIrKYCOHfDAaY45KBRRPIBpZbOTbh2M/Jv10BGJiX7MdPcdoRm4RCecA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by TY7PR01MB13607.jpnprd01.prod.outlook.com (2603:1096:405:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 02:42:19 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 02:42:19 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: 'Yury Norov' <yury.norov@gmail.com>
CC: 'James Morse' <james.morse@arm.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Reinette
 Chatre <reinette.chatre@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, H Peter Anvin
	<hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
	"shameerali.kolothum.thodi@huawei.com"
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
Subject: RE: [PATCH v10 04/30] x86/resctrl: Optimize
 cpumask_any_housekeeping()
Thread-Topic: [PATCH v10 04/30] x86/resctrl: Optimize
 cpumask_any_housekeeping()
Thread-Index: AQHbwD1tSsbvK6HaG0qFhWR7x4BRbLPJ+bFwgAB4nwCABW2TUA==
Date: Tue, 13 May 2025 02:42:19 +0000
Message-ID:
 <OSZPR01MB8798309112398B9D78A76B8D8B96A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-5-james.morse@arm.com>
 <OSZPR01MB8798F324AB66D9B62495E9088B8AA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
 <aB4jHPsWVNqrSG6W@yury>
In-Reply-To: <aB4jHPsWVNqrSG6W@yury>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=681f4a96-07c7-4792-9d1d-232ea58c9504;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-05-13T02:39:01Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|TY7PR01MB13607:EE_
x-ms-office365-filtering-correlation-id: 33354add-669f-446e-9402-08dd91c7c7e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?ZTVFRlZEVVlnd21pZTErZk5lOExZcThRTitVeXBQOUc1aEJoeVlMR3FB?=
 =?iso-2022-jp?B?V1ArQzRwTXhYQzB0aFU2dWhOc2x1QWltc2xBUHM3ZkdhN2VxejVEUkNj?=
 =?iso-2022-jp?B?Myt4VlhmaCsxMVRGdzdxa0VFa3hlaEtoMER3Z09JOEc1dWNUOTdmZ1I0?=
 =?iso-2022-jp?B?RUJuemc0TStWNmRvY1o5OTVmSXVqRVJQWnREL1NucTllK25ldHkyTEln?=
 =?iso-2022-jp?B?Y015amQ0bS95RWQwYWdVWVIrd2lPNDBxMG9MZFZKNmROVjBua3cvZTZy?=
 =?iso-2022-jp?B?ZHF2QkpLdEN3RmRmZ1dzZTZDSGM1ajhSR1l0Mm1LTFovSWhJcEFMTkFx?=
 =?iso-2022-jp?B?NE5lbWlQQklQMWRWZlVEREZtRWo1S1E1OXRLcE55eFFPSHpBRWRkVDVR?=
 =?iso-2022-jp?B?Ymx2WlF3WFRMays1OFRXQTVNdFlEQ1B3c2lyeENDVEMvaHVVSGE1YlpN?=
 =?iso-2022-jp?B?cmQ0MzJvNXAzVHQ4bnF3NzNMTXJXNis0U0Q3Wm03akQ2V1pOeE1ZRlFy?=
 =?iso-2022-jp?B?cXFHaGkzU1BJOVhRSE9adzJ2dzFNSmZhd2J1Q1VwemZXTnp4RkZUNkNJ?=
 =?iso-2022-jp?B?SGpwU1l1NFFVSUxLK3k1Zk5CeXF6elo1a1JMbHgyWDk4K2ViamxLK1Rx?=
 =?iso-2022-jp?B?ZzBNNG1WREZWZExiVGUydnB0UlFWVXVqTUZPRElLbnhKSURMZGUvbFN3?=
 =?iso-2022-jp?B?SVE1OFZwTnVCR1JxQmhaSUlZOHE5VUpwemllSXJkQ0JqYUN6Z2J4VGk3?=
 =?iso-2022-jp?B?bFRndWt2Z0svbDZGTTd0VURaT1ZJOXZ1RTlSYzRJU2FYMWpkcnpsaXBR?=
 =?iso-2022-jp?B?bzYvdWU3ekxjSjM1NTZrRXBBamk3R3lTVURXRlQ0cmlpZXZmd2c3Yjg1?=
 =?iso-2022-jp?B?MGtPMjkxYXJaNmhOYWpvKzJKc3NUTmpxVFh5SG93Sy9XUWVuUFA5Uzk5?=
 =?iso-2022-jp?B?UG5LbjVLR0pZWm5ERXY3MUQvQURzd3dKRkE3bzBxdVR6WVdLYXdQR0tt?=
 =?iso-2022-jp?B?N2hPcE5ISFdYN3U0VzFpcE83ZWdjRjNRNDl1dmYzZW5INWxVL0M2R3h5?=
 =?iso-2022-jp?B?TUN4YndGT2pkWUMwaUg3ZnFReklhN2c0aDRsU1pTTWpid0ZqdFpJc1RV?=
 =?iso-2022-jp?B?anBPYyszdjFjZkZFcU84N2c1cjU2Y2UvTFlMRmorc0tqckpqSkdnQ1Q2?=
 =?iso-2022-jp?B?bkJuTmFNV3VVNUZubmMyOC8vcUNvQllsUUdiMVRQQkxmNVBGT0ZVR1JT?=
 =?iso-2022-jp?B?OGR5WFg1TVZpMDRmWmdRWHA5aU9nczBRbVNvbkpaeUJ1S0lXNjltMXND?=
 =?iso-2022-jp?B?S3I2RXJMSjUyemkwR3J4OWdPYmdFZDFqT09rS3haSUtXV3BXSVFTeEMw?=
 =?iso-2022-jp?B?RWZYSEdjT3BKWFIwSisvK1diQlpjZFhRUnNpbXFtUnFJSzZISUx2d0dT?=
 =?iso-2022-jp?B?Q0FWZlFqak1YMzRreUlDby9mK3ZRRkRKeDFMaE4xd04yb0diZTlLanht?=
 =?iso-2022-jp?B?ajQ1bk9CaGxtU2tyMnROdEdYb0VyUzFUZUtqQkREWlpOM1daZ2FEMTd3?=
 =?iso-2022-jp?B?dlh0SmEvc2ZaMVBQQjd1UGRFUTdLMmNzQnBaNTIvZVljVFpjKzIzdHV6?=
 =?iso-2022-jp?B?T0w2c0lHUmVkdzUrNDFtRWQ5KzBrdGcraFlQVmhmTUc0L1h1THpzZGp4?=
 =?iso-2022-jp?B?anA3OHpKMWJvWC9ySHpReC9kdjB2eDRkc2dCejFFeFpNbU9BTE13RVN2?=
 =?iso-2022-jp?B?dWREUVRoYVJGQUhDZlpJQXM4SGtvU0d0bHphK1l6b0Y0Ny9KdmY4Z0Fu?=
 =?iso-2022-jp?B?RldwZWU0VzA0dGRTd0JEeE1GY3AzRVoySlAzalN4Z2ZmcmFKb0p0WjNY?=
 =?iso-2022-jp?B?SXdaMGJYNlVSSUsxVzh4UXRMRHdlTDB4UGEwTWtxZXQ2R205aVFoclhF?=
 =?iso-2022-jp?B?WkRsRCswTkFFbHBOQWJQZHRhNkwxV2lJeC9YdmdSRStOaEtmSnJUT2Zz?=
 =?iso-2022-jp?B?Q0hUb1NVV1FqWlhFQXB5QmlCNXFTMUFGYTFIb2QrSXhIaG41aFBEL3BP?=
 =?iso-2022-jp?B?Vk1iVEJscVdxYUh0SDliWUE4RkN5NG9qcC9aNldFZUZVWVhtUjcrRElv?=
 =?iso-2022-jp?B?SGpjQTlhUUpDb25QTzFVZ2VmM3RvMk9VblVEQzZqOElvNk5VREMvNGtr?=
 =?iso-2022-jp?B?UmRQRDFWV0hzNXo1cTZXYVR1RmY4dTJQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?VkNidU9Ba1BFR09Sak85a0hlYzNma2FZSWJUN2I3a0FHeDRPK3dlaEQr?=
 =?iso-2022-jp?B?UjZZN0swSmN4ejJGQ0p1dmNMTzFJdVExRHdzWVNodWlIbnJKUVRRY2FP?=
 =?iso-2022-jp?B?S1JUek1XUyt6UHFwV016QjNxRkNYdUc2NmpzUGdJelltOUIveXpiYjJG?=
 =?iso-2022-jp?B?UVg4dm5MOURDVDJacjJLaGJyZUZXS1NMTHdCVzVUdDN0MUNaWENSdHFY?=
 =?iso-2022-jp?B?TXFDdnBxU1NTSnVBTEYzeVBkTVcyRGk0M0pxQU5CRXJ4V29ycmZwWk1L?=
 =?iso-2022-jp?B?bllMR2JocThjSXVETUlXS0JYSXFMS2k1Y2JBVkIrVjg0Y1BJNkZoV0Uz?=
 =?iso-2022-jp?B?V1kwM0Q2bEhYVUdnR2Q1aDQyaWhNUktzcmJoU2VmNWZQQURxaDQyeWpt?=
 =?iso-2022-jp?B?My9zNFBEdjlUMGlYNm82b2diQlZnOExZR09SOFZLYlhWaEZZU1NNbzln?=
 =?iso-2022-jp?B?cGg1OGxRTGJoWjl2My9FZmxaT2JUOFN2by8yR2JZSHdMZ0pPUTNFZlY5?=
 =?iso-2022-jp?B?QXpJa0xmenlFcDgrN25FbEQzSTkzblh0NnVNM0xlc2RvbUVTU1JJRW9w?=
 =?iso-2022-jp?B?bG1sMWpWc0FkQzNlV3RZNmRtS2NMMGcyUGZGb1lyUytKSUJTa0lnN2Zi?=
 =?iso-2022-jp?B?M2tDZ2JGdVB0eDdPYkFGVXl4c3c0SVhtcFA2Z1M4b2ZXQXhGU3JoWFR6?=
 =?iso-2022-jp?B?UU1mMWNVMlcvMmlXQXJMNVBkZDJ3c1ROUlplbDZ5S3VPQm9YV1dPcXRl?=
 =?iso-2022-jp?B?MlQxSVBHNGZNQXBnLzFvOHpHdnBOdE1sN0JzdXBHd0JOdEp4aGwzQUp6?=
 =?iso-2022-jp?B?RzVjRmdpNlVUWUhtdHVYU2FPbjN6Z25VY2g5aWhsK0VZNWh3bm1yOVdo?=
 =?iso-2022-jp?B?N0dVN2J1WkJ5U3dRMG1udjh3b25RNkZYdHpnWStHWTRBYnMwK2FsNXhm?=
 =?iso-2022-jp?B?dVd3QnZwQldUa0FQT0VzeXNJTWZZK2Q0SEZzd1NEYms5eE5aYTZ6Ny9U?=
 =?iso-2022-jp?B?aGowckJsZi83RFFMclB1SEtSdU1xTng2NUdIY2NtS202WmhxdlBtTENW?=
 =?iso-2022-jp?B?TWFsQVVMeVVCVjNxUnMwazdScDNWZHZOdmRqQlVQeXZVSUp6QTJZdTZQ?=
 =?iso-2022-jp?B?aCt2VVFKWWMzT0xXQmhkNXk5Y3hPS0NUbW9STUxCOWVqNWpwVVIzOHY2?=
 =?iso-2022-jp?B?Sy9tc0Eza2kxZysyak5ldm5FZWxHYncvVWZGVWpPN2x5RDJhbHJqM01m?=
 =?iso-2022-jp?B?eWJUaWp1ZGtSYUFYMFFOY2diaWRaaE8yZHRLTXJiYjhnNmtuZlRCNGho?=
 =?iso-2022-jp?B?dlhLVjloc3JjWnZpdlNjWW96b1ZRWHd5NHNwQ0k4VWZvaUdVbDVsUG5D?=
 =?iso-2022-jp?B?S0pMejdxZ1kwZEdsb2hKS2JHOHc2MkFsNUR3QlMxTDZReXhIaHZUcklU?=
 =?iso-2022-jp?B?SmJ1THNlSW1KdUFhdjBiZW9IRkc5TkFSS29pa3BXT3NmeDFvbUJoQ1RQ?=
 =?iso-2022-jp?B?ajVjL09VVlp4Y2VDbmRKS2J1OVRITW9LRmkwcEhGWSt1YlVyM3VzQXQ3?=
 =?iso-2022-jp?B?Rnd1NWQ4bWxKRnUxUzBtNzhoeE5XbjhxaCtPUHdTMjV3NmUvM0RxSHZ4?=
 =?iso-2022-jp?B?SkI1b2hBTFZnOWl4WGpxY2p0RzEwTTRvNW9NRXpaY0RZOWhxZURZUVJK?=
 =?iso-2022-jp?B?MWhMeEJHOGRBdGRWUVVyMzFxRWVobUY1Y2FTTnh5cGVoUVlmZnFnN2Ez?=
 =?iso-2022-jp?B?TDVqR050S2lTRXdFdVI1L1R6bmJGK1ZDZDhZT3hsRkJUZHpudWoyalRU?=
 =?iso-2022-jp?B?SUh0bHhQTFRHczZzTkEvRDhRNWZhZkRUcXhidzA2SHFieVZGY3JnVC9O?=
 =?iso-2022-jp?B?dDAzK1dNY2d5Q0ZsanhsWDN3N3pZM3RkK2tpZ1kyNXRqb29SRjhRbGxu?=
 =?iso-2022-jp?B?M2NqS1MzeHZmY3lvQ2Fad1VPZnVjSHNUb1N1OGZndWw5d2xzZy9CdkNC?=
 =?iso-2022-jp?B?WUMvcGZyZU8zREw4bGgzRFF5cWNiOXNGRC9zSFhHamNBb0pocWM3RUo2?=
 =?iso-2022-jp?B?blk2NzlPaU11MzFsYXBObG1yS2ZTL2M1ZnJoNnF0WDA0b3lpMUlQaEMv?=
 =?iso-2022-jp?B?NDBEaGpKbDZjaGsyMytBMlhSV1NqS2o3c1ZqclNIZCtPSnhDQWZUTWJC?=
 =?iso-2022-jp?B?Y1BzVkVjY3cwSi9aYlFteURzQkRpWlVZM0xJekZTdXErbUpqeWMzYmxr?=
 =?iso-2022-jp?B?THBPT2Jvd0VRZDZTdXdZNTNsT04wVzQ4Mnk1VVJoUFVuNFdXUExjWkdC?=
 =?iso-2022-jp?B?ZmN2QjVsSDZPSy9xckh2Sm85SW0vWitZYkE9PQ==?=
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
	VHpuH+fA2ODT6F1oJoRR/lL6xzCoAcpKlNK2/gEIhNtUsBE9elHSgjuG+azPsTQy/jhrkFKJLhoUVQFQU4aUpSANZk9buSdVfezl99LBFAj0N6phis8EDKBeUYvpW6T/TlqDB9sFRRTVEgV8UDMQADoxV3Un6O/nL3Q+gDJR6LuZlOY3tALjj9zu+Eh+3Sd6drfdZzFEgtnc/8AjHuT5AW9org+6NmrTVYnwTJUNIFjfxD0QDExigwPypPADvjm/xihwhF7PPlIR9dMGmE76Ts/qOzSRnaLyRUoEaP9WmzlZFkW9BMuEOkIZI5tLNWDnUKuUDDr4iaLa9JCLQkT8OBWtE5v862o0w1T2+sOM9/H/nucmiVfq1FWIE9ThdNXdT8HifWR9uGliJ+ZZzhHuwDjccCGy49GhAz8E6CgKk8v0m8YY3Sk4stdya2YR1yYputo6voyo4DdxplEf6+3FbajhRAr99cK78ezutbDQUi5Z3aYg8NRcerbXm3x4YSfUCAECzEF3f04JNMw6uaN6ebR1JNlKHaNMtxfXA5jyZ13qB0+rX0mmgK/AujX3facMPWYzXols0EuoaM/mU77VTfUXhOGb1pX3GRaS9OTBUTHOVipeGrsfI05mfG5aA2bq
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33354add-669f-446e-9402-08dd91c7c7e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 02:42:19.4675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: db6r3Mext5zNW7pIYdlG7Gea8DgDf4IKwExigjJGiPz2cxybXDkgsWyheJbirJElQ+S9zhiXdn8J0UE73CI1Z7H2hUt07xqgAS0q556BN4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13607

Hello Yury,

> Subject: Re: [PATCH v10 04/30] x86/resctrl: Optimize
> cpumask_any_housekeeping()
>=20
> On Fri, May 09, 2025 at 08:39:51AM +0000, Shaopeng Tan (Fujitsu) wrote:
> > Hello James,
> >
> > > From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
> > >
> > > With the lack of cpumask_any_andnot_but(),
> > > cpumask_any_housekeeping() has to abuse cpumask_nth() functions.
> > >
> > > Update cpumask_any_housekeeping() to use the new
> cpumask_any_but()
> > > and cpumask_any_andnot_but(). These two functions understand
> > > RESCTRL_PICK_ANY_CPU, which simplifies
> cpumask_any_housekeeping()
> > > significantly.
> > >
> > > Tested-by: James Morse <james.morse@arm.com>
> > > Reviewed-by: James Morse <james.morse@arm.com>
> > > Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> > > Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > > Signed-off-by: James Morse <james.morse@arm.com>
> > > ---
> > >  arch/x86/kernel/cpu/resctrl/internal.h | 28
> > > +++++++-------------------
> > >  1 file changed, 7 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/arch/x86/kernel/cpu/resctrl/internal.h
> > > b/arch/x86/kernel/cpu/resctrl/internal.h
> > > index eaae99602b61..25b61e466715 100644
> > > --- a/arch/x86/kernel/cpu/resctrl/internal.h
> > > +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> > > @@ -47,30 +47,16 @@
> > >  static inline unsigned int
> > >  cpumask_any_housekeeping(const struct cpumask *mask, int
> > > exclude_cpu) {
> > > -	unsigned int cpu, hk_cpu;
> > > -
> > > -	if (exclude_cpu =3D=3D RESCTRL_PICK_ANY_CPU)
> > > -		cpu =3D cpumask_any(mask);
> > > -	else
> > > -		cpu =3D cpumask_any_but(mask, exclude_cpu);
> > > -
> > > -	/* Only continue if tick_nohz_full_mask has been initialized. */
> > > -	if (!tick_nohz_full_enabled())
> > > -		return cpu;
> > > -
> > > -	/* If the CPU picked isn't marked nohz_full nothing more needs doin=
g.
> > > */
> > > -	if (cpu < nr_cpu_ids && !tick_nohz_full_cpu(cpu))
> > > -		return cpu;
> > > +	unsigned int cpu;
> > >
> > >  	/* Try to find a CPU that isn't nohz_full to use in preference */
> > > -	hk_cpu =3D cpumask_nth_andnot(0, mask, tick_nohz_full_mask);
> > > -	if (hk_cpu =3D=3D exclude_cpu)
> > > -		hk_cpu =3D cpumask_nth_andnot(1, mask,
> > > tick_nohz_full_mask);
> >
> > It seems that the cpumask_nth_andnot() function is no longer used
> > anywhere, so it's better to remove it from ./include/linux/cpumask.h.
>=20
> Yeah. Can you send a patch after this series will get merged? I'll move i=
t with my
> branch then.

Okay, I will send a patch after this series is merged.
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

Best regards,
Shaopeng TAN
