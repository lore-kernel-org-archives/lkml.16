Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com [216.71.156.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99FC4A21
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.156.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751003749; cv=fail; b=ThfgCi313KCX1+p/0gOcbQxP2bINU/JZfp1a6F4y99oA3BZ0nRUJgsj1cYLNn13LPEsbFrMO30sGs2gCi5ORH022x7VqQFB9tsLphZPOePadP9aAqHEQSmI3w9q5QqwDgKA+x4Ftoys54uP2/g16MjQSfWehqvgZKTllt4K8Vio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751003749; c=relaxed/simple;
	bh=hjnIigFJrrp3ciJmFkLTd2uxh7oOA9SfkvtJJDsQ8ik=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VyLbVdNAVJlnN99uydC8rOZ2WW3bxt9GFNgMfjPnR8xOksjhNHO1Dg0PZM96ZoqDQ5zhrq4vi7nPJG9P5w6jx8rtpTMltDIduuM7Q6QgZF+yHFrw9DZ+kBl8E+YQvFrGGmx2wpsZs/ajvQZacM06+2Vct3q4Aq6RgfBMBRCsE4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=D5wT15B0; arc=fail smtp.client-ip=216.71.156.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="D5wT15B0"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1751003746; x=1782539746;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hjnIigFJrrp3ciJmFkLTd2uxh7oOA9SfkvtJJDsQ8ik=;
  b=D5wT15B0s+FVi1OK0tkbRhDc80RKSWbZuls4EjveCJCO4aM1xQ4W6ycp
   oNHop6Ml4XAosUB7sn3kNFGPSmhPUAgdk4tRhZuOY+Wi8raMUnxkeWLHy
   mt89DTXqqi1BTYap8omIyiEj07XtXDwE7+CHYPFdjgvlollMaNQnDjFTZ
   X9L61PtJ9s8u1MiQNDT2c0OS4C5RbNFU17ZTL1C049uFSTM+rnKV+0+bw
   VC2507idnXtZRm3NLKN0jRfYHPr3IIupJbVqt+tVMF8SVOqoDa1ivOPNR
   dMx7dPs1r/+vsVQbSnMu9k0iUYlP+PQ9ebaLGVSdV94MqcJZWsSU+Sxlm
   Q==;
X-CSE-ConnectionGUID: hsdp1kxUT7COC7e+UGBiNA==
X-CSE-MsgGUID: klDXvdmGRBmTQhCGjUpMMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="160863445"
X-IronPort-AV: E=Sophos;i="6.16,269,1744038000"; 
   d="scan'208";a="160863445"
Received: from mail-japanwestazon11011009.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.107.74.9])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:54:33 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvDqwfbSn7FNhi0Yp1pvXfJZOaZjEj/00SlbtUwLC0INvq6M/3XbCCYodMId6+kqcW8LAVmjXX2rJf0xWFI3jMHIM8DjvgfyWM2SEQMtW7rzRlM6ShFTyMQuE37/tU7Jx+FG1y4NT2jsikhznIW9UUayiprILq6QYg38mT1ApH3TtrQlsyF8CdWzS3xo/N5Hdr3FtEG4zjJXnuF5FqY3m3ErMrJMUyC+shgoHcMHARep3WfB8Lg2x9EZIpjW0Plin+DKyRqHZ7uoU6FeWgkzsnohRskXZcr87Hdkr71ssdUdLCH9RA+R57+7KoPfUllpnRSjxeeQDq+gQv808LDjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gigk7tM0nbmaLfX80XfOgUa/+zE146wo2no6+mGBA00=;
 b=jnCogULp4OpLSf5HKKcHA3vxX+KWPGCATHCs8CXM/L+FDOPqk9CUAr0DKyPLhGUqzk5KtIoJK4CzgV8mkrtJp0v6DyhVwh6pxRFgTG98RA1Au0PVEOJet2PYchpkE8U3ZpXY4NxwO13a3OKnODMgv0IPnE4KWJOQu7JsqjOfM4G503cET6FOjUBTDlQobPdDxDgvziM17JBNkG5sBCCpM31FvzvtyZqOYXYpNVJ9ZuVNCQDSD8sdXEoICYiCipmZzLG2wueiR9VspdTSbu9d7uqXJ4cI0Ghb8Ve1AkyBYxZ9TFodazBWamnE/n6lVsluCDsaXRHRUXLXHa1jTta8Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by OS7PR01MB15115.jpnprd01.prod.outlook.com (2603:1096:604:36d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.19; Fri, 27 Jun
 2025 05:54:30 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672%6]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 05:54:30 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: 'Jonathan Cameron' <Jonathan.Cameron@huawei.com>, 'James Morse'
	<james.morse@arm.com>
CC: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
	"'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>, 'Greg Kroah-Hartman'
	<gregkh@linuxfoundation.org>, "'Rafael J . Wysocki'" <rafael@kernel.org>,
	"'sudeep.holla@arm.com'" <sudeep.holla@arm.com>, 'Rob Herring'
	<robh@kernel.org>, 'Ben Horgan' <ben.horgan@arm.com>
Subject: RE: Re: [PATCH 4/5] cacheinfo: Expose the code to generate a cache-id
 from a device_node
Thread-Topic: Re: [PATCH 4/5] cacheinfo: Expose the code to generate a
 cache-id from a device_node
Thread-Index: AQHb5ySh5G6irViRj0qGfV6qVsLL0bQWfqlw
Date: Fri, 27 Jun 2025 05:54:30 +0000
Message-ID:
 <OSZPR01MB8798CDE4E2ED8E1B1B40E6608B45A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20250617172132.00002844@huawei.com>
In-Reply-To: <20250617172132.00002844@huawei.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=6c54d70c-aaa6-4ec8-80c7-eafb83860147;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-06-27T05:43:57Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|OS7PR01MB15115:EE_
x-ms-office365-filtering-correlation-id: fbbe3aa1-6e7e-4dda-613e-08ddb53f1581
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?dFdiSURkSkxwS1JoNGtXZXpPM2xFQmQyRTQ2bjJUSmQ4M1lmaWZ0bXBO?=
 =?iso-2022-jp?B?c0RZOG93dDlxZjVkMURKWElzcGd2VGZaZ1ZlM0JqR3BXSHozcGV5Q2l6?=
 =?iso-2022-jp?B?cVdmaDYrNFdwWk1KVWc1WitnMDhlTmEzVTNsV0NFeTZxS0FBQXNGVmMz?=
 =?iso-2022-jp?B?UTNPS2szcWxCZFp6YzZrMThVZnNXZWh2cWNMVnJTdkZhdlNjSFYxcXVk?=
 =?iso-2022-jp?B?dHRZNmxJWndxbW1FVGYyWFQ2ZlQ1dmlWZUxsVTY0R0dQOXNYZUpScGg3?=
 =?iso-2022-jp?B?SEhhUkl6UkV2aXdVWUNjRXVSa1BhcXJGQ2xRbmNVV3d6T0cycXdpMDlV?=
 =?iso-2022-jp?B?bG9NY0VQM1BKejcwU2tMMUJYYnJCSk5Ja1NiOVBhTmVTaUo2Ny9oZlgz?=
 =?iso-2022-jp?B?VWgvTFo5RHNwRjJlYmxuQVRNVjRZMTExVVpwbTNFYzJCaUpERy9waGtl?=
 =?iso-2022-jp?B?WTlWTmZNcGhxeW85eUwzTlMyNWZwT3BPY1Z5Wk5pamJDQmVSOVVXT3ln?=
 =?iso-2022-jp?B?dDJRZllPdnRxVkpUdkU2SVZjbCtWMDZvUWV3QWVYL2VSYmRncnl2d2o1?=
 =?iso-2022-jp?B?QlJIbytJUWtJakF5bXRzSnhZWEpEK2VMNCtEd1VXdG1OVHpEQ1pCeVRZ?=
 =?iso-2022-jp?B?TXNBcTBuMmpHUUliU3hvWDNZOVdQOXdoYmNuUE0rTmNRbXRFQlR2dVYw?=
 =?iso-2022-jp?B?Q0Q1czFCamxtdnhjVGpicEs1NmxheWkvemZEQUErcjFDQTVBUUY2SGRp?=
 =?iso-2022-jp?B?bGVBNUk1UlJoWWxKRk9YQnBjYjhLbnhqbzc4N29TUGVlTHdyenpZOXJF?=
 =?iso-2022-jp?B?bm1jRnVGYWNKK25vczhKbG55ZnFxdHQrTThMWkZNc1hPNWZvdFNaQnIy?=
 =?iso-2022-jp?B?OVc1MVp5TElUSUxrcVMxbEY4NUJqRTk2K1gzVWpFcTZGdWlwdzRLMFFj?=
 =?iso-2022-jp?B?TVNTdS9tWTdpWVZ2V2JickVEcUJJT3BsSnN1d0pMRmthc3JQaG5YbCtC?=
 =?iso-2022-jp?B?TmRXSVdTbkhDUldNWERSbDQxdXcybXZ2cEtZOWwyemRlTUZTRmZ4ekw4?=
 =?iso-2022-jp?B?ZkoyU3poQkFwb3JmOFlzdERjZjUrOU5iUFFBRU9pWGNxWUJoWFR5ZFhK?=
 =?iso-2022-jp?B?aFhKdmk2NDExZGJtSzlZQis2Z3RaVWN3bDg5R1MvSWkxNE1kOUhCRjda?=
 =?iso-2022-jp?B?d2wwZWNaU1hQbUlvTm5oYnl5dllIYlZIYVBpWDVIMVBZOUo1TGVOTDJw?=
 =?iso-2022-jp?B?OHhzUDEvZUx2RXEzd2lPTnFiZ3RVR0ZoMisycWFQd1ZCRjJ5K1ZPWTNZ?=
 =?iso-2022-jp?B?QVU5cVBTdkpBcE5DR0RpL2Z1QmtIQjAyVXZaUGdIMXJMUnowWlhDaDFq?=
 =?iso-2022-jp?B?V1RoaVJORGJKNndrOW1RSlk3VXoxK1NYOTF1cTkveTdveTF3ZDkrTTVw?=
 =?iso-2022-jp?B?OE55TWdVaGN2RmRuRU5Ta1BPSUxkQythN3ZLbkt4b1o5bUxteE1wRlhs?=
 =?iso-2022-jp?B?aHJwaXdLR3k3UzdLWHBlU1NWVUN3T01QbzIyVVBUanRTUFlPdFBra2ov?=
 =?iso-2022-jp?B?cnMzRjBhUGhoZTZtZ0loZEQrMDdsR3ZMWk82R1BxSG10VWR2c0wyVG5p?=
 =?iso-2022-jp?B?TUh1WjlEM29yci9OQ0xvc2NoTWNUc0E0QkhsQ0FrRlZqNWVlc1drN2p1?=
 =?iso-2022-jp?B?bFJFVlN6ekVhMnEzd2RsQ2NSR1NJNmRmckx0aUp2S1VBK3FuaDNEUnBu?=
 =?iso-2022-jp?B?RTY0SFdFWU9kSDlPTzB5TU9haCt4ai9wcGhnUzcrZE5ZdnJ6NVZCd1Vx?=
 =?iso-2022-jp?B?TlF5S3ZkbzFLcFVCWVBDVXhjb2FlUWkrcUp4dXZIYUlXbWY3cW9uY0t6?=
 =?iso-2022-jp?B?dzdHQnpUeVZac3BhWi9QemppUlEvUjJGcUljSk9qMFFKOG56WnJaWWlK?=
 =?iso-2022-jp?B?T2hORjFzTzhHV2YwSm43c3JaRFdmRkI2cGhqWitoTzV5ZEEwRWNrK3py?=
 =?iso-2022-jp?B?L1dLVm4zV3lqek1qcVQ3R2hqTjNJYkFQVHFzM2xydnVFY1QwNHM0aVd3?=
 =?iso-2022-jp?B?TklLVmx5aXIxZUoxUWtKYm9JUVAzRWtlcGhlcFZ2NWp0Qm84YlhtbVdQ?=
 =?iso-2022-jp?B?dHBJNCswZzdieXRhb25XNXlpazUwWnpodjczWjFhbWlrSmFuMmNPbTlz?=
 =?iso-2022-jp?B?ZlpCN2ZCclBybFlCT2dmKzlXKzliVGpz?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?K1p3eTNkc20ySUxtUGZrQU9USUUwVWFFWlZsNHViZ0dHSlhaR2xiS0ZR?=
 =?iso-2022-jp?B?eE5yTWZ4RllMVXdkazJyTU1UbEJoTDFwbHQ1VzFYWFhYcHFuSlhTbzF0?=
 =?iso-2022-jp?B?ejlWN0pGTE5Sa2g2bG5Nbk02MUlqdFpXelo4RE5xZytrUnlvZlF2T1RF?=
 =?iso-2022-jp?B?emN1QjVNNDJKaHoyMGh6VVp1MXJRME5DYTl1d0xxMEFIMXl6V2Y5K1Bz?=
 =?iso-2022-jp?B?d20yY1F5ZUtLMWVnVnpIWkFnVUVsRWxralcxOWw5SFV6Z2Y4Tm5IUTRn?=
 =?iso-2022-jp?B?dFlVOGFvMnNoUENyNDJvY2ZJcmRIdlUvaWxnNjlPV2doRmJkeWNFdTZR?=
 =?iso-2022-jp?B?SkZxYXBpbnN6VFJ3TzVTWWlTUzBPSGoxbjNqV0RqWHBVbUJKdmF3aTdV?=
 =?iso-2022-jp?B?bHhrdVZBT2VuOE9YYXFIYmZVaitYSHFaWmNXM1B3aWpnQVdhazFVWk54?=
 =?iso-2022-jp?B?a25lNW5tbFJGT01WYitaZElVQmZzK1hZUmxyOU5jcjJFRCtYdkxUV2pk?=
 =?iso-2022-jp?B?YmxtV3oyK2IvTDd4SHJaL0Y5VFQrTzZjOEFkZ1JhS1V2cDhxNi96S1Uy?=
 =?iso-2022-jp?B?UTROc05HZWRVZ0k5UVU5UG1oajFzUk93NW52b2drM0lMb2U5aStBV01s?=
 =?iso-2022-jp?B?dDVQK1UzbE8vTnlxT0xLbGhXTFZTU0w1VGxsTmtTZWpDMG1IMXpiK2VG?=
 =?iso-2022-jp?B?RzBFR1pSWW1pOUhnS0hkbkJZTUIyV3lpOWZYR21RQ0tPbVVvQUpPMC9V?=
 =?iso-2022-jp?B?M0k0WHp5MlVhYXNpWnFUeDZvZjRqbjhMN0V3cVVtVnhMa3hxNi9ZZ1ZO?=
 =?iso-2022-jp?B?Z0tHODQzWWZJV01XU0xvRVJkV0JiM2x0OTZjNk1BVk5BWngybitkdTdt?=
 =?iso-2022-jp?B?SWpYWEZCYjB0U0VheTZBbHkyczJwWm5YUzNmd1F5TzVieU1tZ1N2YXV2?=
 =?iso-2022-jp?B?ZDNObUJHWURHUzdSZ3dlUG5CRi93M0l6cTFTMWtacEpvYlhDTGVRdVlx?=
 =?iso-2022-jp?B?YjVnb1JBQnFISTJBY2JkQVRDTkt3S3dEQ1N3czdQNWZBUW5xOWh5akU4?=
 =?iso-2022-jp?B?M2szTFhIY0dycHZaRktvdnVSTW0vTG5BS3J0bk42c1JTdE9iOU9uSEJw?=
 =?iso-2022-jp?B?OFcyaXVnSE1QaWVSVkdSaUttTUpNbk9hdUZ2T1BvZk5SRjY5eU9LdzRw?=
 =?iso-2022-jp?B?QlRUOXY4SkNtTjc5bmNMQTBxaVNlTGRxT0JjclMrdDY1UUF5eW5BTERK?=
 =?iso-2022-jp?B?TU9LdSt2dGREYmRKRUhSMlRoRWZiKzN1S0JTV3NwSW12WUp3bk9HOEpL?=
 =?iso-2022-jp?B?eGUxcG5McXpwbUtnZE5UQ2d4WFZtVldqNnlsUGFoNXN5WkFpVmZuU1Mw?=
 =?iso-2022-jp?B?WGV1SHNWOG9odDU3c2hlQXVHYWxLWmRpYVVBc3BWV2NNSTFlU1h5WFNp?=
 =?iso-2022-jp?B?ck5KNEtDeVZWWkhlMFpHNGdHdEovbVFNVHUyZWY3T29GeEhTSVRLdXF0?=
 =?iso-2022-jp?B?WTUvTHZ6N2RhQWUzY3pBOGJuL20za21yRVVkSURpY3gyWUxnd1piU2tq?=
 =?iso-2022-jp?B?VENNUytWSktmbDJrWU5GV2VJRE4zQTA0VU5HSlp3M2NVMGtlazg1RjYy?=
 =?iso-2022-jp?B?cm8ycWtkQVBzWXFjdkt2QU42dWRWMy9XeUFOcWg1RnA3NGdRcDhNR3JZ?=
 =?iso-2022-jp?B?cVdub2dGcVRwS3lzUkNCT0xKbFBLakJYTjBPVy9JNEFTd1lEYnlsdUo5?=
 =?iso-2022-jp?B?Ty9Fb1dJelNST2JTeG5Bd0VnbGNIWlRBYTlxRjRGRFh2WnJldlpmRzE4?=
 =?iso-2022-jp?B?QzI3cU0wTjhDSFpGbUQxUDdHREF3VkNKSHRmYytkaUkwbnRycWk5K3lr?=
 =?iso-2022-jp?B?U0tIRWNncWU3UU1NNWd6WWVsUTRuSXAzeHNyYXRBcXdwZDBjU1NDQTNt?=
 =?iso-2022-jp?B?Zy9ZTk4yRWgyckVKL2JNWk1qV2NKWEdMNElEVGVYR2VrZXp1WGo0N3cx?=
 =?iso-2022-jp?B?NitvcVJIUm5wTzNrVjhoVG9BTmRKSzlYejQ5VGV0cHZkbjNUT09jNHhD?=
 =?iso-2022-jp?B?RW5MK1lhbXZYZFI0alRjQmZlN05GWEFqUXkxdXlMaDlJRkY1R0JSQnlm?=
 =?iso-2022-jp?B?b3A5a3hnNUF6eDNtei92ZExKcWJHazBsSHFWWFVTZ1ZZalU4THlaL3Ez?=
 =?iso-2022-jp?B?aEVRRGxuUVNscUdEM3phV3M1ZUJvb1pCZXBVSFVlYWsrTW9kU1dXVW1r?=
 =?iso-2022-jp?B?cStZZGE3a2hkZmU4N001UWNnTE8zcll0UUt1UEx3TWtrSlhIL1Izd2J5?=
 =?iso-2022-jp?B?SnJkeWhBa1pSSHc4dGRkenRWdzhOY3Q5MEE9PQ==?=
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
	YPNTKD6fqH0NMI5sIQvGJJXRvbQGn999tutB5C0PNxCaRATKtZGzbMm/FJ5Pt1XLmNumlH4RnvfzkvXgZYZqg3PTw9/fMVGoQqzIJfsWwUI9ZoSbuUfhWgkkvP2mRFwf+qRL8xkQ/QG/fVNRlPQKTRjtUFzbYr6ag7B8UGl8NRzS0KM1Z/251Cm7O7DywrZUkMCHTMe51TWem505q4Sn/cbxMNTqPHkffZTYPNqenPq/MfFaT0mMMTDLp3mNluCspalKs6fi5uJ2TJs30eVBerdXlbPP9vLaYM3lGZr1RqW4Lw1cgJa7rSgN/BgJ8nVNa/SElZ/IeWutrAaO+JLjvN9Yt8TDD2MdcIIZSmrlqYtmbMqP0DnymvIBlXERqWVoA6Gfu3pqDcPakA/QFubdiOUNkboCS9YkcgqtSmS9+mnZYTpS49N/Zc7TTCq3IqmxXz1wBWs+PUY4T4c+ShNXVjichBh+aSKUp5SE2hDjXZqTGTdhn1FcmUAmz6RyYGSSY9NBBRQfhEtXvhDAXIJ8dWwaOPcw00KpMmF8PrD3lKj8FLxbfpQNxnxWLeiip+J589Z+DzjkrmT1Us4aDosobQ936gQ+NtIrvak90yZsV6CIm1X0+M4jS54DcAoKClyt
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbe3aa1-6e7e-4dda-613e-08ddb53f1581
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 05:54:30.4343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFVMT4E8B6Yf+JWqV2cgbPQsD/ZkBAsUS6RAXg0Sib+i7aalSIU0jj/9tN+XZl7o4tCrzzfColcfccJWTMxw3Hfd1V0GzZxsqOupx0G1Nys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15115

Hello James

> On Fri, 13 Jun 2025 13:03:55 +0000
> James Morse <james.morse@arm.com> wrote:
>=20
> > The MPAM driver identifies caches by id for use with resctrl. It needs
> > to know the cache-id when probe-ing, but the value isn't set in
> > cacheinfo until the corresponding CPU comes online.
> >
> > Expose the code that generates the cache-id. This allows the MPAM
> > driver to determine the properties of the caches without waiting for
> > all CPUs to come online.
> >
> > Signed-off-by: James Morse <james.morse@arm.com>
> Feels to me like this needs to come with the user.
> The earlier patches at least expose it via existing infrastructure this i=
sn't used
> at all yet...
>=20
> > ---
> >  drivers/base/cacheinfo.c  | 15 +++++++++++----
> > include/linux/cacheinfo.h |  1 +
> >  2 files changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c index
> > d8e5b4c7156c..6316d80abab8 100644
> > --- a/drivers/base/cacheinfo.c
> > +++ b/drivers/base/cacheinfo.c
> > @@ -188,7 +188,7 @@ static bool cache_node_is_unified(struct cacheinfo
> *this_leaf,
> >  #define arch_compact_of_hwid(_x)	(_x)
> >  #endif
> >
> > -static void cache_of_set_id(struct cacheinfo *this_leaf, struct
> > device_node *np)
> > +unsigned long cache_of_get_id(struct device_node *np)
> Bit confusing to have cache_of_set_id() call cache_of_get_id() like this =
because
> they are in no way mirrors of each other.   Rename?
> (and naturally I'm providing no suggestions :)
>=20
> >  {
> >  	struct device_node *cpu;
> >  	u32 min_id =3D ~0;
> > @@ -200,7 +200,7 @@ static void cache_of_set_id(struct cacheinfo *this_=
leaf,
> struct device_node *np)
> >  		id =3D arch_compact_of_hwid(id);
> >  		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
Since "id" was compressed into 32bits by the function arch_compact_of_hwid(=
),
is this required?

Best regards,
Shaopeng TAN

> >  			of_node_put(cpu);
> > -			return;
> > +			return ~0UL;
> >  		}
> >  		while (1) {
> >  			if (!cache_node)
> > @@ -214,8 +214,15 @@ static void cache_of_set_id(struct cacheinfo
> *this_leaf, struct device_node *np)
> >  		}
> >  	}
> >
> > -	if (min_id !=3D ~0) {
> > -		this_leaf->id =3D min_id;
> > +	return min_id;
> > +}
> > +
> > +static void cache_of_set_id(struct cacheinfo *this_leaf, struct
> > +device_node *np) {
> > +	unsigned long id =3D cache_of_get_id(np);
> > +
> > +	if (id !=3D ~0UL) {
> > +		this_leaf->id =3D id;
> >  		this_leaf->attributes |=3D CACHE_ID;
> >  	}
> >  }
> > diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> > index c8f4f0a0b874..9c959caf8af8 100644
> > --- a/include/linux/cacheinfo.h
> > +++ b/include/linux/cacheinfo.h
> > @@ -112,6 +112,7 @@ int acpi_get_cache_info(unsigned int cpu,  #endif
> >
> >  const struct attribute_group *cache_get_priv_group(struct cacheinfo
> > *this_leaf);
> > +unsigned long cache_of_get_id(struct device_node *np);
> >
> >  /*
> >   * Get the cacheinfo structure for the cache associated with @cpu at
>=20
>=20

