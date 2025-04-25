Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com [68.232.159.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F0828DD0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.159.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745548424; cv=fail; b=GrQc66DzKT/CdoFQ2rbkj+ZV3CW1mmDDxSzinaerAcbBXPA+CKS6oi4c1P2n7Cw1CKvaPON7s1DTOXxod+/4ImEfD5mhd607qSGNtECM5BNqD7tfa0nYbdLvnyLENvODvdspDf3PoUzmVFGUibfxDq9Iu60elnlnPSHiQBIhgiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745548424; c=relaxed/simple;
	bh=fv0YDcoTqVZST2yJdymk9ohXJZ0V0RmxhIrk30f5Ocg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dGBPCwQaY++OFsSqUuGYtaiUKqBnwJcViUwCLylcxb8eWrII0Btj1dxDNukB63EHwcYrwCuGwxbOji6OmkgKpXZzW9z/VWgspXS4enEhzEJ1/WI2kh+OGYjnQ78wZS9mu39iAk+JUXqNgO4XOxhE2dzIlkqGcUhxIItunLChHx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=VO4bHzVC; arc=fail smtp.client-ip=68.232.159.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="VO4bHzVC"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1745548421; x=1777084421;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fv0YDcoTqVZST2yJdymk9ohXJZ0V0RmxhIrk30f5Ocg=;
  b=VO4bHzVCSBhcHO5V0rwaTAlrsSuXH07opCbNSwmqeUaPNMHy5qgq2CV1
   Q7vmlaCjUTBadkNFV6Ey0FSGNuc6lbVs9Us/LZIc23CoQJxBXonrpYpRr
   TJL2gqJh4+6mtTTlg7rWCF+Cdc2WhNO0FqanmcmBRxJcdp1mOxw7SFYQB
   Zh9Vxk5zHFNQW51znXsh9Per0P1ULCykpxtjMV23May4J57nX6JGitZ4L
   4Q9C527wOWiBm10kGHmkc7886n0jilEqX68uv+bqR1gw9TT6TXwUYBumf
   2F+UueDHBvt3tRBijNGi8ERdM5ekQEZ3JNm0KQOkyG5jLL4rtzDxLNTsI
   A==;
X-CSE-ConnectionGUID: PAns5NlsTXCOt5E7mbBASA==
X-CSE-MsgGUID: M7IVZgXdSdK38xPDqfNPyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="153904993"
X-IronPort-AV: E=Sophos;i="6.15,237,1739804400"; 
   d="scan'208";a="153904993"
Received: from mail-japanwestazlp17011029.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.29])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 11:32:23 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGXaNoY5gDunvZvcMhITwVFwdLd6e9dpx00WBp3RfatDWlcO4pLhPtCTahK4YQr6seUMOYsglmkXyjtnW6Ui1irhdTboCAIYKR5zAHVsSPC4Fqg4PqvlGCjHXoh7azAr9RQbNQRexUl37yuH9Z0IHON22qhwt4oHPe6ZY+qlu/pE+Ur42R4VQ9uuG0/EKTYMRlG30EIrZma5PinZ6D2hUa1E11C3/myMfyhnjrLm/EzYvwbjmopnGi9p0tmNMG5IPsrfH7+sBikJ5snGYj6WQ/pL4aos69RQ0ZFliWjuKP6W4RheLjyyAzvIQ6EGBjVGojsfHy7RNx1Nyol78Q4D8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jP7hV34ciMyM3ipMfZG6gh+JpFwZpf0igObIDfTAz1A=;
 b=aWiJ00ySVLop+vqWz4lvRgKTtSjZpaJ3Mqgy3Ywv7U9t+Odx41nkMuta7s05vqtKBycSR0wlhllZvut9AmYpTmf1eO7MV9KCjZUKdSFbZSrbTjvnStiXmOmlBBXFfUWx8EsWTfrRzSkUpVjJZOJKpkEp/xvPEAzpEXC+Wf4g9LVT2K6jvhFaewMCQ917Bge1BXgsSWkPVn8p5ktf0y1UndzyqBevU3C3FLKq9JAqXPTP5ZHGpGW3UKrR7wMjohWgnAdcpaRfxU6CdPddMi2b6lFgbM7i9LejK4umGLKcSeRqEBJ+pRrJbWkhnWn57fps4dwBD/FCTKx1Ay10QWSQCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by TYYPR01MB12160.jpnprd01.prod.outlook.com (2603:1096:405:f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 02:32:16 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672%3]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 02:32:16 +0000
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
	<sdonthineni@nvidia.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>, Babu
 Moger <babu.moger@amd.com>, Tony Luck <tony.luck@intel.com>
Subject: RE: [PATCH v8 09/21] x86/resctrl: Remove a newline to avoid confusing
 the code move script
Thread-Topic: [PATCH v8 09/21] x86/resctrl: Remove a newline to avoid
 confusing the code move script
Thread-Index: AQHbqwDoeH/JQtwfoU6l3kJPDnr8sbOzviUw
Date: Fri, 25 Apr 2025 02:32:16 +0000
Message-ID:
 <OSZPR01MB87984AA2D054DD6527BB99DE8B842@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-10-james.morse@arm.com>
In-Reply-To: <20250411164229.23413-10-james.morse@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=75f23f59-2bbf-4ffe-9296-a6f9448cf8aa;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-04-25T02:30:57Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|TYYPR01MB12160:EE_
x-ms-office365-filtering-correlation-id: d84cadec-1f59-4bc3-cc2b-08dd83a16503
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|1580799027|38070700018;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?M1ZFVjJLaWxaRndaaGRFY2haa2kzdzhaa2hwb09pZXJkZ0FLaUJUZ2I4?=
 =?iso-2022-jp?B?SEREdTgzLzljNDQ3dE1uUlFnd3c5QXdmbTN5NU85SHRLTm44VTFKOWtL?=
 =?iso-2022-jp?B?OUxZTUl5NkhIYWJHVWVqYlI4b3VFNFErTGRuNVBnVWRhT2FVV2h1Z28z?=
 =?iso-2022-jp?B?TFhJV1ZVR3Rzd3V3M1JZVU0zNCs2bjAvVTRkblJtelB6Uk9QN2xqYzJC?=
 =?iso-2022-jp?B?UGtDUHB6VUo5Vzk1Ym5ldlRiemFnTjdMYnZ6bmVsK09TRllHSDdsK014?=
 =?iso-2022-jp?B?QUZ1QTRWSzNTYmFIZlhCTDlSbmt2ZTE1RHZVM2VuUU84dkdKSkdDaGts?=
 =?iso-2022-jp?B?ampxRzlmMWdDRGY0MVZIak4zZFA4aUI1ZmFZd2RQZklIV0pnYllVbFRj?=
 =?iso-2022-jp?B?VERaVEFRRXB6Um1TWkJkZE1zVzQ4WnlaSW5FMmZsUlNzZ0dPZGxSSEpj?=
 =?iso-2022-jp?B?dlY0bm83YzFpQ0dUS3lrOTJSMXhZSGFXNkw1YldPUjlieGVMQUJhYTZo?=
 =?iso-2022-jp?B?a3ZVbUpaVXVRaFBodEVybFp2NnlLOXdPWm5GSEgwZHd5ZCs4YnU0VW9Q?=
 =?iso-2022-jp?B?OFBTdmFSd05lTWlHU0haTFZEcDZyOXpMUmUvODhzeEFCTmgvVkhxaXB1?=
 =?iso-2022-jp?B?cm9aelRGcW45RlowNTRYdHhrdlVoLzMwNDlKa3MrK2tYMEFvNmFlN2Vu?=
 =?iso-2022-jp?B?ZW9yTmNQdG9uUTlmY1hUc3JkekRmR0tuK2VSK09IelphTURmSkVrK21F?=
 =?iso-2022-jp?B?VzdFMnFpUUdYZlVQTk1GSTI1ek9IZFVOc1crbmdHV0hBSUlkUlp3KzA1?=
 =?iso-2022-jp?B?TjJwQ0tjc2t6blFHbTJVNTl4a2tDSDFaTnp3OEJhSlFCTUNGWWJZNGhi?=
 =?iso-2022-jp?B?aUVORFVZT3pCdVIvVU9TNHc0YitBKzVwYW5HLzJCdzY1SHlaVWk3ZTdw?=
 =?iso-2022-jp?B?VjhUQUpZNXRIU1FGYmFYV0FmL2s1OGlqeURzb3NWSHcxTnN6Q3hjYW5H?=
 =?iso-2022-jp?B?dUNPTGlGcEEyZXN2KzdBaXM5QldwSDlLWVFuY1NTeDR5a01tNmk2b0Zv?=
 =?iso-2022-jp?B?QUVlREVERE9paFRMOFIvSmFSbVI0T01XNGNBeHJQbGl3MURVSG5ZZSt0?=
 =?iso-2022-jp?B?QUt4M1FEeHgzT1hJMGxCUWF3YmVBeHo2bzZadEFxWWVoZ2d2TDNlcnp3?=
 =?iso-2022-jp?B?djcxS0diQ25zTEJjcUpvUzhrSXpUSUNSMGdxSnJlS2RObmJjZTVTTFhU?=
 =?iso-2022-jp?B?S092YWd1YVJXL1dOcXdxZ2x1UnNjZW8rRWxKN05pT2xkWEd1MmlPaDV1?=
 =?iso-2022-jp?B?K3BRM21jYU0yUVBWWWdBK2pMU2Rob0xNYWpMSS9sRE1LendDV1hzMWlF?=
 =?iso-2022-jp?B?YXorOGpKaUlnY2VqYjBpVGF4cldEQmR6SWg0SzVNZ1FwOTBsU0R0bHdL?=
 =?iso-2022-jp?B?N1pNd1NKQzI4VEZ2MDd5M3dBeVdhV3Nmd1VFbG1McTdvSXVwRFF4SXlx?=
 =?iso-2022-jp?B?SkJRMFdoTi9EYkE1azNvRlhhaGI1K2RIblU2aFppdDkvcEdXaStybzFD?=
 =?iso-2022-jp?B?Wk05UFh0WHpCMDhFVUhxbVBqZEdWMnNGbkhjZ1BpVjROWGIrVUxXa0h5?=
 =?iso-2022-jp?B?MVN4VXhOVmVUQ2dvMm1EYzd0R3l4V1VaNHlvV0JhdHdrRkkvclF0N1B1?=
 =?iso-2022-jp?B?YjJ0QUc0QnlFWllFcWRFd0h2a3pzQ1BOOU1IZjRpTFJzVW9Zb2laa3lV?=
 =?iso-2022-jp?B?QUs2VVVHb205ZGZ5eGxWSnZka1BqK2RxTm5RQllNVFozdlBuUWpHZkVX?=
 =?iso-2022-jp?B?WUNxbUJXQkxsMHRmOFJWNFl4L3ZLTldQSkU1WWRZUE5BWi9lTkozVU95?=
 =?iso-2022-jp?B?T3RpclJXdC83cldpK3I5eGUwekY4KzZYOCtRWlNrcHhUcDVhVHRhYXQ2?=
 =?iso-2022-jp?B?bkI0ZGZIeDFtNmRwZW8ydWZUV2RCQXgvaFFHMzVtdVRZZDd1V3JQZGk0?=
 =?iso-2022-jp?B?dzZxa0FPVmtYRjFBZ2J5enJ0VzVLbkxOQnlxNmxoMnBET2xqUDgwSm5E?=
 =?iso-2022-jp?B?TTFRb3BoQTBBZzBKK0wvS29SMGxFZ3FmeVU4SEJOWGFtbFhIT09oalkw?=
 =?iso-2022-jp?B?cjJ0NEhob2dUbVd6N2RJcGFyZlVDemczcEV1d1cvR0pVNnErOVpCdGw4?=
 =?iso-2022-jp?B?OTI4YjBQL0d6TkRSQXZkQXVJOEhOcDFJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?S3pmVWxMTld6MzMvVGRMTytXVWorVm9Jdk1WZjN2R1BXS3RNbjJPWkx2?=
 =?iso-2022-jp?B?TTJGNjlyQjZmRDBIS2ZhdDJ2Rm94MjlHODFTbko5SFpVd0JNZ1JrRHV2?=
 =?iso-2022-jp?B?Mi9CWHVsWmgxL2ZiRDV3UjZhbkoxaFdNa3A0YmFydDh2N3lncWxOU1po?=
 =?iso-2022-jp?B?T01sa3R1VzRFcnZwRk84Wkl4c0MySVJnQkZjWHlhczJaemhobU96ZEw4?=
 =?iso-2022-jp?B?MmtJbzVNZm96ckxEd0I3RTVZWGVua2wwdWZTSThSNjRhRS96bmk2U0tx?=
 =?iso-2022-jp?B?cjJROVltd3o4K0Z4cmIzT1dOUmJRTE9yMlJMd2VSdDNkT0tTZWlHaDNr?=
 =?iso-2022-jp?B?YXNmMUQ2RkRGa1ZTa3RsUnVINGNPbGdoZndpbjBFL2J6aHFObEJpY2lN?=
 =?iso-2022-jp?B?Ulo1eTBTZUVramU2cWxPRXJyUTlXN0FBOHNiT1lhQWJ0Q2s0cFpzTWhE?=
 =?iso-2022-jp?B?QUhnekx0eXR3NGt3KzVPaGExZERRb3pNOVJ2WXA4bEcvbExVUnMyOVZX?=
 =?iso-2022-jp?B?MXRWQSszYTh4MXc0U1JBeUx3ZEp4UTZObERLZnBFSTQ4MDVJcDdOQm0y?=
 =?iso-2022-jp?B?enFHR1A4dTdhVFhBSFVyZDVTWmFDUlltbGh0V2xJbEhQYnF1WWdsOHRH?=
 =?iso-2022-jp?B?SFM1eGRvc2d5R0NGS0ptMUZSejl2SjNjSEYramtKNSsxS2NFTUJYRThh?=
 =?iso-2022-jp?B?NnFxRWpXSXViUzBtaDBtRit1VDVrWW02QzVFRVZPVHBGSlVhSEhOaFlp?=
 =?iso-2022-jp?B?TUNoaWsrblJWVHVXK1hTa2VDRDBrS2k4VGlaT3pJN09Nbzk1aXJac2Uy?=
 =?iso-2022-jp?B?MG1qMWc1bU84YWQyZi83RDNjbk9TM0EzYnh3Si9uZitxWHNHS0hjSzhL?=
 =?iso-2022-jp?B?eHN2d1VVYzBuN0ZXdDQvYkhyY3hOdjg0OUdZSkdGRzRIdGg3blc5bm1M?=
 =?iso-2022-jp?B?MzJoUWN0Q2lRNjh3b0p6dnc1VkhYTk5BVWxWUHkzbG5QVkxBZkFMbGZI?=
 =?iso-2022-jp?B?UWc3L25hdTBjVExnS3BjcGJkUFZwZ21OL1lDbHUxeTFldSs3RjRXVC9B?=
 =?iso-2022-jp?B?VURIK1YxTDJSZlMxaDBLSGt5ZFZ4SjIrR1VOdU5LaWZCUitod29rd0U4?=
 =?iso-2022-jp?B?RWo0OG1PdXdaVTNvOEdMVDdWL2ZITEFPcjZOMmtBZzhzYXgxSW1pd3Bp?=
 =?iso-2022-jp?B?dlVLaTQ3cG1VQTZ4Wm8zU2dseXh2cHJvMXBVcmxkWG1SMW1YSGFrM1hR?=
 =?iso-2022-jp?B?MVg5MnFDcGNURUZQUDdTUEYxSDJpWGU3NUlRUnl0ZGQvc0lZWFljZTk3?=
 =?iso-2022-jp?B?enJueWJCTEFSWG9hTjN5Mnl0a0FBUVpaSXhsU1pFdGdtaDliZGprQTVQ?=
 =?iso-2022-jp?B?SU9ZUXBIS3NZTXJCRzdqNGJPSEhrV3Z5eTlHcFBNb0VrNHNJaGF1aG90?=
 =?iso-2022-jp?B?MXUvb2wyZmgwd015U0lzRzNCVmY2UXlmV09ReWx6UDdZczcwdnRWWWRC?=
 =?iso-2022-jp?B?QXBvT3FpRWdXdXFtb0RtRFlWd0FvTEdRMEozeEZiMTRTMmpIT29IN2xU?=
 =?iso-2022-jp?B?SjRSeUpEcmhUaExoSkIreENyZFltbEhyNGZTVWt6YmZ6QXF2Y2NUUlRP?=
 =?iso-2022-jp?B?VWppaVhGMkNLRXVGc0V1SkthYllFNWlPZWNkZ05RcW9ndTUySnI4NnQ5?=
 =?iso-2022-jp?B?aE9EZDJ3a0w2dFMyQzZZSVlselBHWVk5QXBTYXJKV2Fzc2F6NnIybTNt?=
 =?iso-2022-jp?B?bUVIWWkxd2xUeUJMQ005Q2RDalF2aHN2LzZrRWRNcExDNm5NL1pkZFVl?=
 =?iso-2022-jp?B?SlBVc29sdXFBUlQxS21Oc245eEQ3YldMNE4xWE5rOTJtSHVrN1lQTERQ?=
 =?iso-2022-jp?B?bjdBNXNYSGNCOFl0TU5LZ0JBcHhwckRUN2VGRXhvRFJxMW9wUFd0UjQ2?=
 =?iso-2022-jp?B?QnBFVkRsM0I4WWFqbXhMNXdoYWJKWkZ4WFNtZEpEYzVxbmkwNVZVQ2E5?=
 =?iso-2022-jp?B?VWhYMXZHSEdZYUwyVHB0OHNqMEp1ekxkMjFPSTI4ZUJTNzJPQ1Nrajhl?=
 =?iso-2022-jp?B?TlU5OWxSMkh4bUFaZ2FsUTE4Ry9DeXdCak9JdUJNUnVTSTZPczQ3SlRs?=
 =?iso-2022-jp?B?NWtISFdzbU9jcDVzd05sS2tTZ28yUVM3WGRiVnpERktjM20waFRqM2xR?=
 =?iso-2022-jp?B?Q1dLZWVvWnVENkdTREV5Zm1wNEJQa250SmRPcHVRYVNQa0t3ZFRCck45?=
 =?iso-2022-jp?B?TEFKNS9jeGlBWmxkUjNXRTJDVzIyeXB3NmZRQVNtTGhmalF3Z2ZxMEJ2?=
 =?iso-2022-jp?B?OWl2VzZaVzN0WlNxaFpabWt6VGR0eU15dVE9PQ==?=
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
	7uWWyAaXEsVXW9eup79K7bXOx3vEt5dc1JvheSfDoNh2X/sIBBeRbph6E/SQH/x8YOjq5+5/cgujnHGl27e4HDmLhRjSkrChD7iz/jz16KQ3fDujYvesPn9LHg0obdyJpyauBSUlUZUuw/BwFTl4/DsZkFOJLi/9Q274Cti0AVbg2p6Rz1iaOkHN0klmcRB+XiWhLghndfLcie8mI64e+5GtkNDsoXcnOXvOpm8HMd5G8VmChdZF3+xQ9HBgo8qt0wfOktYWPQhAuTey2esDQr5VWuF4Q5GEOhhH4T+WA6JSqoYjlsBCGBB7WprQY/iZ2ljhGnRCV4xB5l/X2mjVJmXuihsl9FQx2MkTKJIUcdkpkDGE1JsGdKnYsToUpEsGkZjpJ8h+qktoQcxakWvBnB8i35+ABQRWnYia4T05f+NQmvB8qkScV7G1s0ITq3lDRoEUjDk5EN8CanqFsgoLfIUeb1pTDSVXn9yBLc7CBK7QaDXZ5ygAMogQqArkjVq2u5kocjJrzQ7IcEQX4AS14HlUws9Ja0G6cPbtsJ9FGwdusr/seF0oBgfXERwvmwvh0sx4ycY8BJGck/WPNN5Y1rN0SgKxSdpYxjTuWzH8+VUMJNbKeFf2fTCqLKU/N2r9
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84cadec-1f59-4bc3-cc2b-08dd83a16503
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 02:32:16.3958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cqnT993kwsUD3zI9ULDQtKXmhQoh9MOrH8jh/+gfqHeU7eMbWRRMJYtcaplyPqFSQyEzoJ/J6RNqCdiS1bqW7Zmxukvc/ZLqjG7wAfVRly0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12160

Hello=20
> The resctrl filesystem code will shortly be moved to /fs/. This involves =
splitting
> all the existing files, with some functions remaining under arch/x86, and=
 others
> moving to fs/resctrl.
>=20
> To make this reproducible, a python script does the heavy lif^W
> copy-and-paste. This involves some clunky parsing of C code.
Is "lif^W" a typo?

Best regards,
Shaopeng TAN

> The parser gets confused by the newline after this #ifdef.
> Just remove it.
>=20
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index aa0bc57e1c7f..d61b7137f443 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -899,7 +899,6 @@ static int rdtgroup_rmid_show(struct kernfs_open_file
> *of,  }
>=20
>  #ifdef CONFIG_PROC_CPU_RESCTRL
> -
>  /*
>   * A task can only be part of one resctrl control group and of one monit=
or
>   * group which is associated to that control group.
> --
> 2.20.1

