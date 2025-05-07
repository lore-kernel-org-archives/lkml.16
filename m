Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com [68.232.159.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA61D202C2D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.159.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619298; cv=fail; b=pBGdeyZO2MmkrIIW41kbcEHga00PpyUhdmgBFanU6xETPUaR06JbB25gMVQg4hhXbdJOYJibHDPjWtvBebFXgDBn4wj6lPNUtrkz/94q3rofKynhzbUEt0GD0Nb1BxUN8YMKcyygH7Y//tCxsp3Sp6ig3oGKOguTjMkwrmLrvl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619298; c=relaxed/simple;
	bh=FlkEcD9M7k6MnK6RXvCPqs1sTypmLMAuxlAZEpvRQ7k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OUVK/bIpmShKG068XpnfgxOzCdJytXVY09x16zes35OR8YShvbsUgY4k40m1EJ7OcRKTF4AH642ARZsX8M0qASwEWOk189H6svrlHFG50Pt3+R2lL8T0+vMtvh0B6UK3DwfTMaVBYObrTdgGAagRdL4t2Ov8JRz7upRbQ+vczbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=t35pSgHq; arc=fail smtp.client-ip=68.232.159.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="t35pSgHq"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1746619296; x=1778155296;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FlkEcD9M7k6MnK6RXvCPqs1sTypmLMAuxlAZEpvRQ7k=;
  b=t35pSgHqIcKzGcn0Y2QhtoUn4tFNRocE73TVjNrgkBbsax+plzFvUiVT
   gTNC06cBYKI0s1o+oMdCuLQe/kYk4r0/2m8cxZC2GdPPd+C8vQZ7FQixE
   Er7anLu8srwsf9fmBFOscMmKnz1yOzXeBhNszz9Wznw8Xg7EjRBwj3mpD
   8K4BIceLyRJ4D97FKlafZZ8c6qBdJ9U/buhWocHSagn+dzUHuaw0WQF2h
   sRI/i7WTYvs8uQAo3Xl/ZZG5tkj1GYUAkQfu/5GcpP4M2kNJfktS9MOi1
   emZ+T9OVPltIV6ZL8DbQGKDdzWOLgKVscscza6h11bCxm42OsQ1mT/Xsj
   g==;
X-CSE-ConnectionGUID: gsmSYXWXT5Cb3sGgMHS5KQ==
X-CSE-MsgGUID: hAFsrQEqSAebAZ/vcRMdfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="155175630"
X-IronPort-AV: E=Sophos;i="6.15,269,1739804400"; 
   d="scan'208";a="155175630"
Received: from mail-japaneastazlp17011026.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.26])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 21:00:19 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGvuCiPs7j2RkaD9xNUlqcCF8PpLIShgbc2Mt/0jMCCOyQaq91Ivs4DljYBpnsKdR/yX2mNv0NgK6lHToeehmOYbeEfGEBRwz3m5/TMlVXtZ9PRQCuFjo8xjfr7WdMvjMsAQ55I7axe4BZKGTke6BjiuS/RsVEUy+tfwLS7LhGVy2O+1MCmINpmoByPJDezdQGXp5N8M1735i3H/T34vUtlJ7uKvIai57zrmWvY1k15+vv3OMyGNBLO65lmLAtYDPTREpp/d/qkPRjEP18Qv0IXgOtPrCWdLwggxstH7ANNs2DJWuCRa5q6vIbp+OhBDJvc9sZQxFOOnWabNHlXZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlkEcD9M7k6MnK6RXvCPqs1sTypmLMAuxlAZEpvRQ7k=;
 b=hOgqV5nOrcx/mtf3Ps5RurHijJebdmRwOGjOof0Zj/jS7k5TZl69hM9c1IhiEWMZK1H/PnS/ozd+Bgm5dKttyAKkxCvb8HVgZ3I+0PeGm3OhjlNBrISUWKI147oaPtcSAffpiX3hSsJ3lnVVfvUqngkgiLEQ/8RNAo2NqLyUCbiaLevHFbUANl+zJQ2+uqJaM8j3WqjNG5dnx8AoY729c/B5J206RJX3j+AdAYPHwYIxA4WOrBkvmU5dqPsR/q8nJiMpbJAOvHpAk3ae9sZqtfYQxJCtvx6sgreIV1DzrljZdvIs4Nn+j44HJNWk6SoahZtA1hdEkxyNO4UEt0DChw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by TY3PR01MB10319.jpnprd01.prod.outlook.com (2603:1096:400:1aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 7 May
 2025 12:00:15 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672%3]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 12:00:14 +0000
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
Subject: RE: [PATCH v9 00/27] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
Thread-Topic: [PATCH v9 00/27] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
Thread-Index: AQHbtgjf266msh/4pUuMKxSdZWtwPrPHIEyw
Date: Wed, 7 May 2025 12:00:14 +0000
Message-ID:
 <OSZPR01MB87982E5190AF6B1C8B35D3988B88A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20250425173809.5529-1-james.morse@arm.com>
In-Reply-To: <20250425173809.5529-1-james.morse@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=607493ee-afc0-474a-bb12-e4efe9ded1be;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-05-07T11:50:09Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|TY3PR01MB10319:EE_
x-ms-office365-filtering-correlation-id: 3e32bef7-52c6-4584-ecc6-08dd8d5eba23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?QTRCYmxsaGprbmN5cEhPdlhyRVRzTTVDTjIyNzNnalprMkF6NHZoUGp0?=
 =?iso-2022-jp?B?MHZVK1RxTUJQL3YxNEdqcGxrR2NVSWdpY1liUlNOUnB1QVZycE9MaGFG?=
 =?iso-2022-jp?B?UitnNEp1S29NOVo2UDAzc0pPYXQyOXZFaGJGVndheXJQdE5oeE5CUGQr?=
 =?iso-2022-jp?B?N21MRXQ1Zm4zOVBGWmdvNDlYaTNkc1AxOXdFZUYrQVR1RHN0cFB4MjIy?=
 =?iso-2022-jp?B?d3M2ekZFUzhWWUdVbFhSOVQ4eTBzWXU0bkw4aC9mRW5COUJFMWo5RWJI?=
 =?iso-2022-jp?B?NEJJSkxNZEVxWGhnQmlCYU5JRm9HUktUTmlYZGRuclZ2MDV6L1hUeE1x?=
 =?iso-2022-jp?B?b0U0OXltNDgrZjRBR1FDRmFsZUFINSs3MjJvQ0krS1hiWHh1MGI4bWQr?=
 =?iso-2022-jp?B?dWoxRkpYeTFqT01tTTg5aU9qbzAxQzF3UUw3UGp6NzJ1QlBYSGlXdW9p?=
 =?iso-2022-jp?B?bXJMQzNVck1mMk8zL1JydGhqVUFyR2FyS3N0WE5rMzlOM2dEWVVPdXRR?=
 =?iso-2022-jp?B?enlVSGNOSUFpR3NIay9vaHN0UkMvR1B0dy8zVENtMzFoYStjQ3JoTG02?=
 =?iso-2022-jp?B?cU81K3JVaHY2THRScVhrMXp4TFFXdkw4VzRyYVhMZlArSExpVkVuSDBr?=
 =?iso-2022-jp?B?b05YRmowR3hvNC85U0pSN2V1MG1pRTVWeUcwNFhyTmJmWEZyTTNBbGJ0?=
 =?iso-2022-jp?B?ZXRKQjZOQTdKTnA5d0JtNHhNUDAwTk1TaHFqcVRYNkhHRHREQU9XMFlZ?=
 =?iso-2022-jp?B?eC9IdmhidzBJWTByMFJPOFYxZUVjamV4WTR2ODNRcnM0QktpWFhCZDVs?=
 =?iso-2022-jp?B?TytOcE9aWjVGTjRlNjM1T3EyRzZkMDVUL3JscFhZZUgwZUo4aldtMHVa?=
 =?iso-2022-jp?B?UTFKU0dMK3c3ZDlWc1ZvblhTbG5ST3drM1V6MVE5dStMaTNFZ2ZxMFEx?=
 =?iso-2022-jp?B?R3pVNHF3OVRLbnJRZjRkcW1IeVVKcER6amcva290S3Mvb0lFMFBZbjJx?=
 =?iso-2022-jp?B?VnpRUy9hT1g4ZXRaL0N5ZXpTdzJiQTdNWlYzcUo5c2VDaGFUNlNkaUla?=
 =?iso-2022-jp?B?VGxWYnNYTGR6eEFVS3ExYTgvaXU3aXBxN0R4Ym5KSG1WQmVJcG5WL0xl?=
 =?iso-2022-jp?B?K0c5czRBMHE4RFdhSFJnWGJJNGtVWnhnSXFsMzZ2V3ZTWFNucDJlam9N?=
 =?iso-2022-jp?B?NWVQZWQxL1lueGxzNE81OUtIaitUbHhkbHpGUUpZb2hTQW9RR1owMklt?=
 =?iso-2022-jp?B?aTAwVTVqL2dFUCtFQlFKRDlVN3Z2YkVWSUpKY2UrdWloTEZJNk90Rmlo?=
 =?iso-2022-jp?B?aUlMM1FvRTUwSWxGUHVGclpta1BkbjdjOXdCaldRcHA2bXFlU2ptRzg5?=
 =?iso-2022-jp?B?ajhjeHNMbGY3T0VTa2s3Z01DT09iOVAwcW43c0I4d2hyMVFKc1cycDJq?=
 =?iso-2022-jp?B?dlF0cFMxUVlHRHlDc3FCVWVzZUtzcE02ZE5VN2s4TlRJNVpoLzB3SVE4?=
 =?iso-2022-jp?B?TmxWWkdJQmxMSWJDS3l6M1lKVHhUSkpFZ1kycWF4RU8zdjV4MVY4RzRo?=
 =?iso-2022-jp?B?aFZONGd3RzFRaUdqaVJxTnp0c2QyNnhXK1Z2VEZFeHhrdlJWbmFtWlZh?=
 =?iso-2022-jp?B?VWpHU1ZxNHV2aU54dzNxbEg3RUdiR0tmSXRqazdQWFc5K3JaT09adVYz?=
 =?iso-2022-jp?B?MEpnMTZ6bWFRdlk4Y2xBVys5RC9tSnpGTDdwNnlxUUs4WEtXVDhNUURk?=
 =?iso-2022-jp?B?Qk1TVkViN3pOK21OV0E1S2VjUlpEbGxUVTdXcEVPNlExS3Zyc3VSU2I3?=
 =?iso-2022-jp?B?Zkx5dmg3Vm4wc0lDbWZFSllRSENqRStCa0V2UkJXRXdBaVRubHlRdE5M?=
 =?iso-2022-jp?B?SmJkWm5ESFFIaDBvY1g3clF3MVVObFozaGVvQXZxdVhKSU5qTHJienJT?=
 =?iso-2022-jp?B?SmZFTVVDbEpxN1VpYy9WalFLVmY5SmkwV2JydHBYOXJtUWJzQWc3Z0dh?=
 =?iso-2022-jp?B?VUNsNHp4Tlg4M3Vjd0VzQnUvT2FUY3lVaTM0OWFTZ1oycGJVQ3lJMHJv?=
 =?iso-2022-jp?B?ZTB5OUZzMnJqbDkvdjVoeHVzNEIvZEx4UGYrdGJ5am1OZjNJblllbnVF?=
 =?iso-2022-jp?B?UWszRHYyYlc3OEE5cm9xQ0lsbDVFTjZRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?ak5FY053Tkp2bFN3Q25aMFcvdG5xQXV5NjNWWGp1MnNmZlBLZ1FjaEpl?=
 =?iso-2022-jp?B?WTJsRjkrdURrZ2RpQ3dmaURlSW5TR0pBTjdFQm1vSWRidWRDNS9mRTVy?=
 =?iso-2022-jp?B?MUZYWFRqb0FtenF1bGdZSzhsVFM2ckdKNDhXbUxFRS9HNlFvTkoyYXB6?=
 =?iso-2022-jp?B?SUdZZVRTdXFoV1NzdXNON2U3VG5pM3VrSXQvR1h3MWhqQ3dxMzk1U3Ux?=
 =?iso-2022-jp?B?TWhSRUZBaXNoZnlNdnNHS2RrWWgxZnZ2aC9KZDhWemJKWmx5cDlZbEVQ?=
 =?iso-2022-jp?B?K01NMFNXSHdjbXk3NFhBK1hWZDF2K2NwclJybFladlp5NzczNjVhbGtu?=
 =?iso-2022-jp?B?cmZnMENQZGpsZzNPTlNhMEpwWDZUNDFoYktKUHJHN084bHAvR3M1REdq?=
 =?iso-2022-jp?B?bk1WT3NSeTZqN1Fvd0YzNG9rSnd1UlRxTmtLcWtYZkg3ZFh0Tk5xRHNO?=
 =?iso-2022-jp?B?ZnYrSVg1UE5MK0VQKzM1dTZuajlJSFFFZnBYeXI0dWlaZ25DejV5WS9T?=
 =?iso-2022-jp?B?UFpCNW9sUzZ6QTZFNnR3ay90eHM5WnZ0NEJlOUt1NUk1SW5lRHpPamNt?=
 =?iso-2022-jp?B?OER6MzdqblhRLzU1THhLSVVNamdtNFFzSUZ0SWFhaHViYk9qWHdCN2Jz?=
 =?iso-2022-jp?B?b1BXdk1xcTBucUM5eU1rT3p2NnVEZ1ZycGxEaHp2QmxPMSswZU9CWVpx?=
 =?iso-2022-jp?B?WU9qRzltR3NHRXhOMEU3QVI3K3hqOTFkWi9tNmRyb2xaRE9Wb09HWkRU?=
 =?iso-2022-jp?B?K0NsU1VMVDcwTEYyRldSK2YwY0dPSTdmbGJ2QUxScWpNakprWVEzODZZ?=
 =?iso-2022-jp?B?a2lBUHJkSm8valgyWnVYbTAyazVrUzIyTFVvMnd6UjFwdThFTE1QSmln?=
 =?iso-2022-jp?B?akNpTDRhYk9GbXhleFlLWGpueVdNbjhxWkN1M3FSaTFIbVhaN0ZZdndp?=
 =?iso-2022-jp?B?SkVzVmJzaXp6VUgrSGFyRU1vVmNLUXl1TEUxRFZnVnJiNHF3WS8vaXYr?=
 =?iso-2022-jp?B?RGVDd3lSVGxvdXV3bjUyZ1F5ZnI4TnhTMnY3WXJsWVJIelZBdnJjNXNU?=
 =?iso-2022-jp?B?UzBRamswNFMvRmc2SWFkZU55UVdUdmJNTDJCakloaUhLaGl2dnFyUjB4?=
 =?iso-2022-jp?B?WjF3TVZCcCtUVENMVEZXWEZBRmJobHppSGozcFp6NEVGdVlMcFFEZW1i?=
 =?iso-2022-jp?B?VmFRUjFRNjhIUnF5eFZPTnlrbGRvOXRiR1VaMlpOMlFjaXd5TmM2dCty?=
 =?iso-2022-jp?B?SWtQR1NSS2Vla0ZoU2VyWHYwMFU2ODFEMWhKT1R5ZGo1Z0o2enVQTmlF?=
 =?iso-2022-jp?B?QnV6blJSS2E5UGNEZEhDSHhUbnlCNFNnR2ptNmRmU2llMmlBLzBjNGk5?=
 =?iso-2022-jp?B?S3JMVms0VU53Vk12eE5pRE1uZFhJK1Z5RXY0Y0IwZno5L0hqYnJpcDZM?=
 =?iso-2022-jp?B?V3lwcEdpMlFIdjhxNDBNL3piMUp0cFA3UjV0M1N4RHd3UnkrNnlCRUg0?=
 =?iso-2022-jp?B?U1V3WHJwTzl0SzJoMytjcWduMTdiZG5tNlgrWVZPWFZVbkF2UWFwRWxB?=
 =?iso-2022-jp?B?d3RYZzhGZGhQdFR3cGp0aWhWOC9Wa2JJS3BVZzdKWGZBMENhM2xYUDl2?=
 =?iso-2022-jp?B?VEJtOEt3TDl6dFljTjU0aWpvY1drNS9yNmJhK1h3Vk1aUWVwQWx3Q0Ew?=
 =?iso-2022-jp?B?VEtxeFFFVEcyRUdMRTRxS3BYdmxrMEVablJHQXBjYmlpU3RHSTlHN3Ri?=
 =?iso-2022-jp?B?ZDJrc3RyZmZXL1FRZndscnZGMW5yeWhob2l3L2tUdi9WOHVxVU5vd05z?=
 =?iso-2022-jp?B?cGZFMkJhdURzWktDeFBraitmZTArUnAxKzVSdTBlMkF3bnhMcFlWbkpK?=
 =?iso-2022-jp?B?ZkEzT2Rnb2pDSkk1QWlhR3VuZERhKzlNQmxnTjlQRnFwRUxlVGRJbWhS?=
 =?iso-2022-jp?B?d1dnNzNuTzkvdEx5aWlOMzk5UURSeTFUd1Q2bUEvSUFacUlWQ0ZEMXlw?=
 =?iso-2022-jp?B?RTMwdmtCL2JmNUdHeW1pYjFQZ3ZTaS9KOFlKOE9hbWdlVEVvNkk2V2RJ?=
 =?iso-2022-jp?B?TmJHZ2M0QjdMc1R5eStGT2poZUhhRUJ3U3QzNndZMXBaK1BBRlRNLzlL?=
 =?iso-2022-jp?B?STk2VTJPSUNQeDZMME1Zb3k4MjdjZkk5TnIwMk1GVzBsSVBYTjA0QTVj?=
 =?iso-2022-jp?B?Wlc1QzRTQVUrZmpxMnFiT0JtaEVXWjNxWDhSTnltaFhzaTVrKzJ1eTZ3?=
 =?iso-2022-jp?B?UHFBZnNqR0tQUHk0K0puQ09hZUx4bk1PbDNlNUU4Y0hoNnNqUDVON0No?=
 =?iso-2022-jp?B?S2NzTzRkSStyNCtYWjZOdGdXL1pYVGprUVE9PQ==?=
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
	ZSYBiV2NzPxnrzMBILCnnuE1sA0QcMGg0xpTsVxZ6X4VyBkX/TCm9+rgDjUhoAdXCdhlYSUkY6/3O0utYnKwUTU/VzFkVZsOgExNNhi+lXMsZgRESIMLHA1jI6I48qx3Sl7MY1X3qKyGHL3fRdyyym4Ebj/NJmq3h+7E6EH8dIhoLk+rSBsC1ECWXWfvsXgevnAgLM2s9ElXIooi5tbbn3bXwzhNf1BeAAOuktJ6JHotiDG0txslQyVDXWjol/qAvMLTL8Nefsu/no2tzGcWlqp7gWQsFb/JtuIQBRYNCisoPWDpItp9Ahrk13nDTrrAICojswPc1g8PdJwDd7NEyUnFT5p6kKCy2c07rzypAPq9QR3GgQSB5HMWhyD8VKB4bgJGvatw8oCNFAIMmT9sAoCW6/7ByDGpzu/48tD/MSl7dyKai5R6F/1HhR3X475SpfLUwoR4TPHztTrZibat1Yh/03nbOjEquGYrsL14EdqNiG+nX3rMeQOiBnMH6Gl4vZ3gBNk0slkwJ9x7yeUYOs7jzB5FP4X1ncd9cd20SWOZjqyt82iy6IFBbeN4YXKjyXbwjBwJJDmYjFyeHXJ4bCrclaEcoKXn8Rwx6sSmbdQvB6QuztIjP5Ws0PmXmMLW
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e32bef7-52c6-4584-ecc6-08dd8d5eba23
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 12:00:14.5274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bnBG4dTLNtIsCb8iWUYD8oO5dD6QL1ht+YdC3btaBQ9Xlmn9uO8LOGVbmbY2cYoCvjhsxjMRptbkK+IalDTopVi4oYXYMjWmyuTIx4OBxw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10319

Hello James, Reinette,

I ran tools/tests/selftests/resctrl with the following patch on AMD EPYC 94=
54P 48-Core Processor, it looks good.
https://lore.kernel.org/lkml/cover.1717626661.git.babu.moger@amd.com/#r


>> https://lore.kernel.org/lkml/96d276c11e69cfb1e29d50a12c8043555c06b404.17=
18144237.git.babu.moger@amd.com/#r
>=20
> It is strange that you needed to add this since it can be found in v6.10 =
and up.
Sorry, I made a mistake. This patch is in v6.10 and up.

Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

Best regards,
Shaopeng TAN

