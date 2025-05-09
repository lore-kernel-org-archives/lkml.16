Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com [68.232.159.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEB54B1E5D
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.159.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746791227; cv=fail; b=VrSgiNe/PIeu2ZLt/9gDrm/EUs28CDnRprMji7zkY4JphRFCTnA08fcYa10bYJecEL9hi1BGSWosKNnizlR8IvOqY7EbFsZ6uV1PYH9mVYCUIlaoYvCnfl8G2sP+dCVYZxI2/ARffj3Z9eIFOHf3jHt4XjBiEyetyWhkiU748DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746791227; c=relaxed/simple;
	bh=mj5pzrwTrlHrfQHp/pc/T8I3ISVKZpUBGspofunyrA4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H5u6DuX02Twry1w5ENxW2nhc176iirmpw0e72KDyj/coNqAbDHiPxJuPOx2w0qld4NWGLqe9lLgvbCFcfLL6jzoYPyp3EMwffw88kLagpHabXBLT0y8njt4Kyj30+JNEDPeC6DBqsJOhfPXYOHvBIllT87u32vqhdJpw0bDRmiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=sJPW4Wwi; arc=fail smtp.client-ip=68.232.159.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="sJPW4Wwi"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1746791225; x=1778327225;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mj5pzrwTrlHrfQHp/pc/T8I3ISVKZpUBGspofunyrA4=;
  b=sJPW4WwiJgsarJlQRX825SnKIcIoQZmrQOAWISK5OPfzCcf/uQ81DNB6
   h4jygxjw/M+wDYei70vWpX+TQrjZRfZuaxfx9IOy4Xg+FimoDsmMfYoPA
   sPhpy4eNMvwaxxKqJtz6YGtv3ffqGtOJl75WOdDd2cR+lL0CiqsKW7TxG
   F8bv91kQLseqERXG3a7lDaFlfgLtXSw9DMr5jb+Mb4pR/DMAwKS2VFB92
   EY3N8RoEFN+IQLNJdIGHuCQIIqno2SjTAv3oMDPe/+ENljlAvQQICliQA
   YahFbh495A7QrWGWX07UD+rXImxKht3usPtvumaNTJWSbkfacOlriqLGp
   A==;
X-CSE-ConnectionGUID: xr4rCQ6LTRmJWl+Ntsaifw==
X-CSE-MsgGUID: Ewmf/dmmTxmB2jkACHObow==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="155427284"
X-IronPort-AV: E=Sophos;i="6.15,275,1739804400"; 
   d="scan'208";a="155427284"
Received: from mail-japaneastazlp17011028.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.28])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 20:46:51 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MI0ZMejgdZ6GJjU1fbaCp8JTNgSorfdFKEMzPKDR383vEqo6+LAOukDRrzFOch9ibPqk4W5gbiUrgZjRo7MyD6XjMAaZkwKGUDBYnkJ+nUTTJWtALjZ9HZq7z9Z3I26ikJ/0Un8z6MUA9Q1VKTpKJE7Fq0YOfoiVd4MovhU9/zl/ACmgwJxObFNtdt64k57/KvoIx1SinXjauFDktTHBGKef0Gnt8aA2PQNTLEF5nvdr49MP8Hnkd6aaVISE0IASMoloKrSFPCGhkFEQluRFJjyc4CnqgylbrtG6uxyAbFQDvyrDfYSavRPBS23wfo16VvnF7g1Z5yFrPovOQdsm/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mj5pzrwTrlHrfQHp/pc/T8I3ISVKZpUBGspofunyrA4=;
 b=pM92Tcr/m2ALrzMhNqzP5rxF/VeWXagjaRZkwbhcqX+UidRKcqBKp2HFhrTci4/SHK6KS7UBpduqhRWJVmveIaoug6wVPtaAoI6lpdnDxgQcNdofsuFs+HC9vh/1Yp+v+5VDPVsVxi8kOfQj/ILuq/cl4sv7i1GNIMO4AfdKwQagNFLlKI4QhOgezfHWSjmsTw5GJ/gjLVnpiBCDb00jbBtbDq3YkIUBstEIQ6ZYGa+HT4JJwHCOiueXk+dcAVwp+6RmhWQsBzUiZ2p+KRIp2yIdaAvGB5t9YM0/Z8Oqu0N03OPHJTMOQK2hRNUIBN8p8uux1AcJq2XzH1m5sgnx3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by OS7PR01MB14952.jpnprd01.prod.outlook.com (2603:1096:604:397::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 11:46:49 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672%3]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 11:46:48 +0000
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
Subject: RE: [PATCH v10 00/30] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
Thread-Topic: [PATCH v10 00/30] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
Thread-Index: AQHbwD1Zl8jVlFYx5katptrjpwO/P7PKL0XQ
Date: Fri, 9 May 2025 11:46:48 +0000
Message-ID:
 <OSZPR01MB8798D800E2AEFF81132D856E8B8AA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20250508171858.9197-1-james.morse@arm.com>
In-Reply-To: <20250508171858.9197-1-james.morse@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=bf987791-e92e-4516-8fd8-2c8dc38d3c11;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-05-09T11:45:35Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|OS7PR01MB14952:EE_
x-ms-office365-filtering-correlation-id: 431181f2-e73d-4e42-8b3f-08dd8eef2e83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?Qzl4bisrM0k2Sm5zQW9HczIvSmI5OUlMSS9LeHlXN0YwckxRZkhUQURq?=
 =?iso-2022-jp?B?bWl4ZmhmbTNZQVJ1TDhDdGJOcHZpTXlxR2pxTVhVbi82OHNlbVNSTHJk?=
 =?iso-2022-jp?B?QXRZZWxZMHZhN2VWZlUyZWZPbTVzWUpqSUpZVkhxVUZLVGdYcDJabVYz?=
 =?iso-2022-jp?B?bEhNdVlCMkQyVktWK2pseHZGdWoyK0tzZ2d4WXRGR0JyMzNVM2hGeUcx?=
 =?iso-2022-jp?B?UXNKTXRObENENjZHRDZPTktmMEd2YzRjQkZYZExHYWg2akdLUmcyUEhn?=
 =?iso-2022-jp?B?Rm96czdGSDI5RHdhaWVvYjh4YXFLNG9NVHMrVEhmd3hCaitTclZYYmJm?=
 =?iso-2022-jp?B?YWVEQXRLaTVyeDB2a1hHZHl3NzdJREM5MDFGaWxoNW1MbmliK29iNXl5?=
 =?iso-2022-jp?B?SnhWN0FRa0ZsNWJRQmJRRzBCMUpnWnVaRjJnZE50dnZ1WW1ZajVaMFVI?=
 =?iso-2022-jp?B?QTAxSVNWWldRVi8wNmNUakV1RFV1NkNIdUZZN3g2ZENNS3lEcG9DaVR4?=
 =?iso-2022-jp?B?MlFxR2ZudlJqVTE4ZzlWVWJLSjVUZE9leGRtM3JYeG1HbEhFNDJ3d3hG?=
 =?iso-2022-jp?B?b0F4U0JWTE4vRXJvSWlyQ251SzdKeDVoaFZya3hxWDc3WG83UDVLQS9J?=
 =?iso-2022-jp?B?UjltZm1pZUsveStmeVhtSlN6ZHczNWdPMVdOV1RMZG1saG1GbjgzaExG?=
 =?iso-2022-jp?B?elh2eDFnWlhNVUpzZGlqWXJ4c204ZzlpVG9sTjJZdTlEa0R0T255eEZo?=
 =?iso-2022-jp?B?cnJLZFlwNElSV2wxaFEvc0lsUUh5S0xVTmJ1TUJDT1NUOXp2R2NGL0Nu?=
 =?iso-2022-jp?B?SU00Q0ZNSWVSMXRkSU5vblF4SXZxWlJ5amdVR3FMN0F1dmVLZDNDRTc2?=
 =?iso-2022-jp?B?dFhlOTROTjB2cDJCSnUrY0ZpZmRiVXcwcXB6TXJSSUl3VmNVZTF0YVVG?=
 =?iso-2022-jp?B?MEdjM3R2RGJUbFJpTGdpajBuNHNNdWh4dWpWa2h2ZjNDZW0xT1NYMnRH?=
 =?iso-2022-jp?B?ckd3aXNzZWtaTnVNOWVRcGxJZHZHOHRVc0RpUVUzLzBlZUNuNENGem9H?=
 =?iso-2022-jp?B?dFlMRC8xYndsaWFLb1RjV1VGOVFsckNxM1BIT1owdzZiaDNGaHZNTFBP?=
 =?iso-2022-jp?B?dWZWTUlqdUMxdkZlUEZUSTNLallGajFidFlZa3V0enBwS3RwM1AzZ01I?=
 =?iso-2022-jp?B?c0g4UlhDeitrM2ZML1ZDQkNJUnJhb2NOeUc3YkJhZkF5S1ZmZitpbVRM?=
 =?iso-2022-jp?B?ZjNaSXdNTW9KMW43czdTV0tjeE4yMXpraHA2Y285eVdxd0lWUFEza2l3?=
 =?iso-2022-jp?B?SUpjellscXpvV0JnR25NZHNaYnNpbnRaUnR4ZURYRU5WVlhUUnZaNVJh?=
 =?iso-2022-jp?B?QU9DeG1CeW12Z0ZOam5IY0M0UHpFWXo2SUNkWklqZFNBcGNuZzBzTjFO?=
 =?iso-2022-jp?B?ZytneUg1bzNUNGg3SlRwMkpqWVpNOG8vUERyWEZtcWJJZHBWeGtrcldn?=
 =?iso-2022-jp?B?YVJDb3N4a2pRTDJZK2IzWFNFcmJxRUUwVGxCMjlVZzFnUTNQQTJ1M1d6?=
 =?iso-2022-jp?B?aFNhTTltOUlhZ2hiTEZ6d3lEYi9oU01sSTd4WE8wWUVKK0VWTkt2NGdR?=
 =?iso-2022-jp?B?T1VtSnpqM0pjeU9JU1ljTDY2WGdzVlg2Q2NUaVRMRk9Xby9kaUtqM2hZ?=
 =?iso-2022-jp?B?RjBCQWYvWlZkVHVxajE4SUJ3UnAwZ3FzcjJrdHlyb1ByRUlhUFJ3TkZJ?=
 =?iso-2022-jp?B?eTAyNUNhWWhyME4vTGdvSGtJb3JIUHV4YjBVbVMwbG5ZSk56NFkyNFJW?=
 =?iso-2022-jp?B?elNPcE9ZZlpTci9mbWxXZmJFd29zbk1PUGkwMlE2VDVDR3JFbVpFQS9j?=
 =?iso-2022-jp?B?RDBJdmU1M2ltbDhXR0FCc1RRVngwU0dXWUNzWnQxRXhrNi9wY0oyZnpF?=
 =?iso-2022-jp?B?Yzl3T2ltTWxqMzFQVXFmUFNob3BpMVhVLzQxbkZNOUJYdDBWMmllUXVJ?=
 =?iso-2022-jp?B?NEREQldKcWY5Q1FoRHcwcTZweGk4NkZxbllwdEUxSEZOa0dBV293bG4z?=
 =?iso-2022-jp?B?TExKWkNDcFczSERhYVBqL3p2ZW9BSkp5bkl5cDFEL296My9DWVY2UDV5?=
 =?iso-2022-jp?B?ZmI5dmNqOVZYY3JzSHBLaGlWTFYrbVJxU21scjhqdFVkbmdUc1RCUGkx?=
 =?iso-2022-jp?B?OEFJd1pxMVZSS29WQld2bXIwdzVZYmg2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?R3duUThYSkJTSVp1U2VnVzBvSld6MzhpdU10ZUFqR2dqcVhoUG5pWW5J?=
 =?iso-2022-jp?B?ZU9IYjNEaXAwc25QTFdnSGNWWm5VMitZajVwOVo4aEJUbjRXdWcwa21s?=
 =?iso-2022-jp?B?WGNUeU9EQW5GTTRwTmRUY3VnMEs0eHRKalNPNi8waWVTTkdqNDNMWUNt?=
 =?iso-2022-jp?B?OFE1NVB6a2k1M0pldWxCU09RSlpJWnRLVzZmbzlUbDIzRENhUDlnaDEz?=
 =?iso-2022-jp?B?MDdqZHU1cEFoWWVPL2NXYmMwVmdjRTZXb1dsdkpVWHZJUTVEQTcwRDVI?=
 =?iso-2022-jp?B?aUVwOTdzQXRHMHRWZFl5Vnp6Z3JDRjlOdE1DeDN3WkZld01xOXRMdVRL?=
 =?iso-2022-jp?B?OTk4N0Nxenc5c2xLRXF3RVFZRWRadlRORENmWGhtWGdyUXdxWUpHTkg2?=
 =?iso-2022-jp?B?c0VvQmZhbzRRL1FSeEJDbDZMZWJxT3gvL2pZdVR4QnA1cVl2M0ZMbHI4?=
 =?iso-2022-jp?B?S1JOU3p3d1RQSUtEKzBZaTc1WTI4ZnNrQlBGYUNIMU84KytNb0FCM0Np?=
 =?iso-2022-jp?B?bHg3MERRcmlHZ0ZlS3hoQ2NQamViTFZ0Ykk0ekVFVnZMWStxZDFSTFZW?=
 =?iso-2022-jp?B?NTc3V1pGY2ZiYTJkMmlJSkRZcWVyMGIydnhUT1VVYW9aclcvcFRmeVBi?=
 =?iso-2022-jp?B?WFNJS01qMGJqazR1bVRteFVIU29aakRlVGZ2V2xNRm02L0ptbGt6cTlL?=
 =?iso-2022-jp?B?VlkzcjFCNXl4eGVQZ2Z0NE1rbmJIOUg2RUNxQUNMUklOdEhCWXJTREpo?=
 =?iso-2022-jp?B?cTA5TVQxejBEbEIvcllONXFxL0JOdHY2QmRIaUtwelVMNHI5RFpJbU9X?=
 =?iso-2022-jp?B?SWZPYU1Cc1JQUTNxNXFNakhxeEYxdnR3QjlIMUxVV3I5M0wySTROWDF1?=
 =?iso-2022-jp?B?YURpQWowV3I1OWVtZ3phUXFyaWUzSmhTcUt3N1dTWThaYzI3RVB6aHRU?=
 =?iso-2022-jp?B?aEZPWDNFT3h1eGVFbW9mdWZRRGwzMjVVSzBTOVJjSG9qTlgxd1doK2xz?=
 =?iso-2022-jp?B?Vm9DWVpYOEdsQ3pZc3hOTzNRRmhreVptNkdCK3NQZXhpQ1JQSzZlWEEv?=
 =?iso-2022-jp?B?WU5sZHNKQkpFcWt2c3BRVDVneDdiRTUySHZzVlQ1Y3h4bVhnZ3hTZG1q?=
 =?iso-2022-jp?B?bWNKSmY5OU52SlV3Ulo5a3c3aktSdFVvS2l4d1QzYjl4aktCUGdVUHl6?=
 =?iso-2022-jp?B?QUREb1hRdUFoSXpaUnQxWitvRXVzVHJqaTFBK1p4dWkrdllXOG1tdjJI?=
 =?iso-2022-jp?B?MXR6UTlFYnd2ZDkxT2hqVE91OEZKalJqUHV3d0hBZFNWcEpNMk5Db1Nx?=
 =?iso-2022-jp?B?SXhqSnNxSDlnbVJTNDEwNThpWTFWazIzV1BxZmtjc0Nnd0ZzVllmamh2?=
 =?iso-2022-jp?B?RjhwMGU3aG54dzROUjlYd0c2K24xZVNVOFhhSVl0TTZGZXA4ZUJaKzla?=
 =?iso-2022-jp?B?eVE1ZEtqRjlOUkFIZ2czTVN1bUgzdFMweFE1cHp1NW10RmVVclVKZ1Ns?=
 =?iso-2022-jp?B?YmhwU29ObGRFdTV3UlRRMmpMMWtBMHVHYVZjb3pzRG9Cb0tUQ3UreHJS?=
 =?iso-2022-jp?B?SFp4blh2K05iREZrNDEzbUlYQmdhamN1cXBiU2UzNTV3b215OE4yZmpu?=
 =?iso-2022-jp?B?bmtVWnc2THVqeFRpUWtkZnpLaHRkazBBT2ZYcTMyb0VXU0JGRVBOcVZR?=
 =?iso-2022-jp?B?OGZaQWg1dUpEL0dQLzBXRkdZZ0FXcUlvTFVxMWVxOGY3UmVFZEZIelZ0?=
 =?iso-2022-jp?B?azVaL2kySkdaRXRBK3gyVjNzRjRobXl3UmtIMFFUY3FvVGNWZUVoYXBm?=
 =?iso-2022-jp?B?TitwZGFVUDM5Z0E4b0R1eFo0ZFJ4RkFacjlLTXJBVWFJdlIzL1A0OU5Q?=
 =?iso-2022-jp?B?VHFZc0RXaVJpQmZPMGxzYWxycGpFM29kSUJQTFRiQ3Q5Nmo1Vk9QejZ5?=
 =?iso-2022-jp?B?MWxiL1JjRlB2SEo3Y2x0eTdIRnJPNWUxbk95R2tFcUFQd2pWNVdmYmpY?=
 =?iso-2022-jp?B?bURlQjFSTVFpbkVIVVdRZndHSnVaVjY5ZldRVWJuTTZoS0xacnFhemkx?=
 =?iso-2022-jp?B?czZXQ3FxTXhnSFNqMCt0UWJZYWxONzdJc3REclpLNmNnWU56cnkrWlpx?=
 =?iso-2022-jp?B?R1U3WWJqb3l2U0lrQjh3TC9Ib253b3dwWGtmOHhrQk5Rc3lxQ1ZjOVEy?=
 =?iso-2022-jp?B?OGdaUjNYSFlXeHNYRnIwWnU2UU04alVGT1hvem1TUkg5YjRTSVF5ZmJD?=
 =?iso-2022-jp?B?dDlQelhaVjg3T2c2RzFpL3lEM1dib01vNE1LdnZYZnF1NkZ2WGhhRkpx?=
 =?iso-2022-jp?B?ako1QTZPQ3M3NTNudWlacUlCY2lab3dwcVE9PQ==?=
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
	K4SAEuTf8UhwMhBntiSqdB1rZxI2okT15FWYy7BEcChlNr23RMzkE+WZ625pFgqEEI7jxpfhCQbdsZmDRNt7njg/ayPV1glVxCNEnl6iynHV071YSIUbr4V7KkfJZolQgZANnL1nOQFHgzV9ge9ZQFAGXJQkJ+MEvZrQ1rSUf42gUFBruECSJX6q+XvvKuZktijBrFfea56MVLD7yjuVXVd4FicukHaCx/WS8D7CW2bJubU0NMGab1/BRTW8KpbJC2SAEAGhlGeZqKkl6lq+4/FVMsW1zNERwUUvFFDlTxUS7J2pAJgrilDOW3/k7u7BLLvcq+LGj6pVzkCCSHVf4Y+5vualx80+DSSgSZEYoz/jb21F1yu+Augh0BMKSgpEby3hqsXtpPIkP62xU+WOWuvHHrnYgcKQV8JSMSpJw/0fGfdClIjyC3xOi40NxGiwuUPjrQM7qRmWd0BgmndgOmch+WWrEhuRyArZ1ZNSn63PXQhMOVo0DcY62DzTSb85Ikolwxp5OdK+0GRhSoDA/CCr2y4oKS2yjLFZXWM9nT0Bfbh3YiLIdL/Qa9ANEYUE9hn2kF40gYpeu1JM/UJiUOfJQPi+C2KqVWAk2fGH1ikFArVGOHP8j5s2fIVmR7Px
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 431181f2-e73d-4e42-8b3f-08dd8eef2e83
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 11:46:48.4670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EuhA8h28fiRBh8Z2WBycfR/arh0hkIeSHykGtErgS0ywrfNtg8KJAu0+P34Jfr6mZk9R/TxTncfEUs4/moIYykmETRILRkKZQg7Xt2MUzVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14952

Hello James,

I ran tools/tests/selftests/resctrl on AMD EPYC 9454P 48-Core Processor, it=
 looks good.
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

Best regards,
Shaopeng TAN
