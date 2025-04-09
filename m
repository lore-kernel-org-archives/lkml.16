Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A7A38DDB;
	Wed,  9 Apr 2025 17:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220738; cv=fail; b=EfMYjAJzl8Po4vsSODzbpvZLSlVserVHfsiRwTHpDTur30usdz7Ul1M9aAcHqQ7jZIJ4vA9WHhowB6q0Pz0WhyWT1PS8VMUj6OhB7pSzHMMmvEYmt79Lb3dZEz+Xf2Ljnoe5ckqjKKXMlFt296/VbRwkBkA6sThP0SU4n9K+KiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220738; c=relaxed/simple;
	bh=EuVopNo+STB6NYdT7sZzaLvL410eqdSW+IyuWi8u/q8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KEuGkoSUioFFTt/xEYYyyv734sAWJM5UryywTkNYo5zhSCwD0vgw4WhdW1/t9E25suhD/kuCjy+NoSGag1xKL/ZuZUY8HFSocBIognoGQFPqt6TjtjMEoeAKAhlLH5nvvTUqyJOGQv4uoYxFPlp+8zYMx5B/Ce0VectxFFAqMNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=p1FvgNzo; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="p1FvgNzo"
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HDsam030251;
	Wed, 9 Apr 2025 17:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=EuVopNo
	+STB6NYdT7sZzaLvL410eqdSW+IyuWi8u/q8=; b=p1FvgNzoUXT/fOdm2m59Isl
	BHaxz1NnKdB6sQle/Xs07JF+u54QlxpkB1IYzUF1PWD5gsjvY689n4cxVPqJA8QN
	kQD9RFpu9dLyt8VJRfw32r5+i8y81AIWDjI418CN77ywwGx6jCSz8HER0AqRPHpS
	pZ6mdCVTHn6/Vp14idAAE4PKsZFWXpemuftLABy0Q+W9uPyKSgmd5H67rM6Wd/SN
	yH32nfXs/b1b+uRUQKrmL0PPBwEtGlIpm9dnJLQ8/wSynbZ+Ep/QWPccER8yPDKR
	Zq59p9NOyaWDZARKyT5odZsF6PMMXOSvexaJGvIz8m4kXBFUMgeVGcXj5wzhfRw=
	=
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 45vps3hwba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 17:44:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZg1rM5Yf1tjvseJ5nOmOlnfPHIKkOCH2nJhdUFxGgd4/V5rTT0aXgBTyZR44j0D8n9jIvK3+xeY2QG/Vq54TfyXZ5Wp4O3G9R1ZQs94UlxW9UEnA5ViW7mNNElSPWJ9m9Vzkkf5gF1yxdj8B4eRSbviySrYtTw54m8Hj1XfarMsVMkoM3GD4/vU2aNfxUmTnCEcrLjyo8VRwaaG0Ng6U5dkpNeeRHLIA6ffTUtejhmw6Rh7jPR5yr9Y4oqPt3r5cwLOHbWjQUBf5Rj0+u37m2sCyjC/YYFE9WqKXinP2KRnObDKrkDh0h9wigfEiKwuLw8VwoDlqZJb/oP+mF663w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuVopNo+STB6NYdT7sZzaLvL410eqdSW+IyuWi8u/q8=;
 b=FBTfLgjppqEu1vc95GM6G7zEkjWVxhfjnos5WC13rMFkJqaof70AbhlRIDGteXZwv8ykg2T7/WB/6WQgZDYv7+w/z/a/cU8t1dwqmMiN3fnvFU2ITupWXa8sggvGmQWt38RKvl3BNdSj+L2rwhbLDocW2E+AKfbYdHVvDwUY/2w2iPRH9uWodFylfpH58gZB4L/zZZdGsGB9K+yP57AoBBG38GMVnA6K+rbpqeLLLXbrO1Qb1KNCgd4JVebF7d2YwO3r7NnbrA56BSipo8mWPwPLOInruxbX85sSoYBXEJvCCwpyUcbaFAj3Dt9sHMWbZj4VjSUUHvwnrMTFocL5MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by PH8PR13MB6248.namprd13.prod.outlook.com (2603:10b6:510:238::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 17:44:51 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 17:44:51 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Thomas Gleixner <tglx@linutronix.de>, Gon Solo <gonsolo@gmail.com>,
        =?utf-8?B?RHVqZSBNaWhhbm92acSH?= <duje.mihanovic@skole.hr>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ricardo Ribalda
	<ribalda@chromium.org>,
        "linux-spdx@vger.kernel.org"
	<linux-spdx@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: spdxcheck: python git module considered harmful (was RE: [PATCH]
 scripts/spdxcheck: Limit the scope of git.Repo)
Thread-Topic: spdxcheck: python git module considered harmful (was RE: [PATCH]
 scripts/spdxcheck: Limit the scope of git.Repo)
Thread-Index: AQHbqKx1GDhWhmCw5EOcmzyPeer6C7OabgkAgAEpqHA=
Date: Wed, 9 Apr 2025 17:44:51 +0000
Message-ID:
 <MW5PR13MB5632440E0CA2EABD11B79F3CFDB42@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20250225-spx-v1-1-e935b27eb80d@chromium.org>
 <12647854.O9o76ZdvQC@radijator> <Z_Tgp8L_8goc63K1@pampelmuse>
 <Z_TtXaRnaU1zXbXv@pampelmuse> <Z_T8OiLQzKDGhOJs@pampelmuse>
 <MW5PR13MB5632E13F8F5B0B2B6DE3D16CFDB52@MW5PR13MB5632.namprd13.prod.outlook.com>
 <871pu2usq7.ffs@tglx>
In-Reply-To: <871pu2usq7.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|PH8PR13MB6248:EE_
x-ms-office365-filtering-correlation-id: 02392bbc-0c8e-43bc-ed90-08dd778e3ab5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?akpZcXNIRmQxclZYK3oyL1V1TitESHl5OUd2NEtHK2ZaSTk4bERJREZ0d2dS?=
 =?utf-8?B?QUNvcjJkemVCR013UCtYOE5HakkxT1h2endidDlJTTUzNDRkU25lRzJPSGo1?=
 =?utf-8?B?TDJiSHl4d3dEYmFvQThQcTFKNExYaG9sK1VuK1BMNkV2c3lDeFhiaGl5R1pt?=
 =?utf-8?B?YXFReEMwdE1JbmVSWkdpS1lRSGFqOGdLaEJEcUZ1Q1J1Uk1SNkdsazFQYjZO?=
 =?utf-8?B?S3AyaWI3YnJFejBsdkZZMTlYNGlacytOZXRwbWhtejFZZ1MxTTdjTVlMbnhM?=
 =?utf-8?B?UVhqbTkyZHJRd24wbVFQUG90SUdpMFllNUlocTRaNDF6Z1F0emIxdGRHSWk2?=
 =?utf-8?B?c1Z0bXJBZU9wYkZOazhtVzRpWWNvekgxS3ZmQkNLMnR3cWdCUVMxbm1GSlI5?=
 =?utf-8?B?VndjVjhhOVkwU01WSGd4TTV6YTU5eFQyZFM0UnFtb0NnMXhlMVc4ZURFMm5G?=
 =?utf-8?B?VzZMbWxVc1RjS3d2MFYva3gvWXFBM2xSY3FyelJ1SWlqN2tKbmp1VitGS0RO?=
 =?utf-8?B?ZFZlZkNRZis1MXlrbVpLNHQ5NVFmdGtRYjBJTmM0akNNTXNtaVFSQmhtRmlj?=
 =?utf-8?B?ZUFnUlNyUHBEZTMxaUY5bG5nNy9zRDYyN3M0aUE5WHNxZUJBSmVBOGROWmlw?=
 =?utf-8?B?QzNPT0JTcUVsdW83czVvcWRSLzVLNzcyN25SbTRLZ0l2UDVod0swaW5NQ3Nx?=
 =?utf-8?B?UFRESlR5elBWSTZVR1M4bDJRTHdETkI2c0hiOTRTOTNBQS9yOTB6RjRMWFJp?=
 =?utf-8?B?TGt0OFQ3Vy80MmFob2NvNmZiMlBGQjBUSExtamRMSEdBN1FHZEhJanU0bTRi?=
 =?utf-8?B?QnFmYUtCSDRiUEk0cjNid3RXZCtsQU10bVl2Zzc2UFVJQnErc3dMR2VVUW93?=
 =?utf-8?B?L2g0cDhialF1SjRhYVp0NGhYTElaWVNwTzd0KzJmOE1rNERqV1AvTTRKQzlW?=
 =?utf-8?B?MFZ3Y2xIQjdZTEhBMWgwNnoxUlovamxHS2dvaUx3cEc4MlVSa040MEtScE9i?=
 =?utf-8?B?MGZnR3FkWTFBWW0yd203cE9naEI4VE9ENG4vVmtKS0FqOVUzQTFha2E0RkZ0?=
 =?utf-8?B?UXJaR29qaWZnTkhPOTVpWnlqU2M4K3BxQkxRZDB3U1hVdXgrRlF6aDgzd2tB?=
 =?utf-8?B?bm1JdjBnNXp5b0w1RVNkN2RCVEJKMW5MUGFCSWNwSGptZm1tYTh0Y2JZMVZk?=
 =?utf-8?B?YXh2Nm1rYnk5SHhCZXRlRXAvSTRzSjJDN1hMcXhqL1NGMXg2RDlMWDR0aUhi?=
 =?utf-8?B?bGpDSm5CUExvOERBRVZXcEwyS0VEWWk4MU9Kc3hSZ0F2dTNlM2p1V0dia3dp?=
 =?utf-8?B?amZBV25idnRNZGZyR1dLM3lUMFA0L1ZyenlsU2IvaEY4TmxySGNjU2JhcmZN?=
 =?utf-8?B?cVV5UkZ5YnlOQXRPYWR4eG5kcW45bGk0c2JxRmhtdUFHVnc0WFJ3SjNKcFFn?=
 =?utf-8?B?eEtLclRQdVhXcXpYTThzVXhXbVd5SFZZN2pES3Q1dkdjNGh0R05WZExKNjgy?=
 =?utf-8?B?bVRwQzlqeWRGL2wzWS84ajZvMmdoRUJpWk5vK2ZUNHRBSEI5UHQ2V0Yxcklt?=
 =?utf-8?B?TW91cEJ0cTNlUURsREdIRFhCMGtqSWJqL0hDd2Z6TFlZWVd1UzY3T3d0cGR2?=
 =?utf-8?B?RWNmUlo1ZTlWMlVtL0Z6VjM3aEVVNEhhWExxeUtvd3JhQTB6WWRyYmRISm0v?=
 =?utf-8?B?clBDZTBMWGp0MjlxQVpYdHM0YzVDUXZYNVZlcUNxc0xEd3FsaVIyUjRYQjBE?=
 =?utf-8?B?dnhPMGp5dUNYUU1tTDJCKzNWc1A4ZEcyVi9paUJyaTNtbVh5UW03KzVDaFdC?=
 =?utf-8?B?QWpDT2oyanBMV0tKOGxUZy9MWmRBeUFTZllndFJwNC9KVEZOZzdhSGJMMkZR?=
 =?utf-8?B?bWJFVllDalJoTU1iQ1d3ZW54VVpuMU13ZXBUK0VaVDE2UHIxWkV1NWxudTFy?=
 =?utf-8?B?bFlLZHdoaEdVSWczNzJkY0plYjRPSDNNdDY3NHBDS0lzQS9wV0Q3REQxNHor?=
 =?utf-8?B?RmJHR0t2QUxBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGRlWDJaOVg2OXZ2Z3ZEajgwWTdnTXRhS1ZnY25uK2t5Q0Juem5SSTVNOS9h?=
 =?utf-8?B?K2tUSVJzNi9JYWdXOFZIQmEzV2Y1Uk9OTm0rVGtzNDV0TXk3M3B2UTVvY0dq?=
 =?utf-8?B?b1pLdEtHOHdnbU5naVBIUVZRWmpPRDRDY0hFdnlta0pIbFRuK0J3OXRFNENI?=
 =?utf-8?B?Z3M2cHRPSWx3ZFN6alUwQXpac1UxbUNkVXh3dEdjdDlIZUdhZlFvbllFUFFE?=
 =?utf-8?B?ZkhkUEVOLzQvSVlyKzNkY1Z0VzRQZHpVcm1RSGRyOWNrVmxnOEoxQ04wL3Nh?=
 =?utf-8?B?SE9yM0w0QmQrcEttSXdhUHYyTWZWdXFzdTVtMElobmMrYlFRY01YUlhnWUVQ?=
 =?utf-8?B?NlJtQ1dNT3BWMkR2Vk1idm4zL21DTCs4UHc0aklTMGk3cFM2SlFiWFk5MXZB?=
 =?utf-8?B?NWROcDFPRWZjWXVQQU9uVEtEbUFIMGZ2bkM5VE91cVl1VzB5SThybTl0Tldh?=
 =?utf-8?B?ZC84bVlMMG1IUzR0NHF3QnNjQTluYTgzaTgyWTNZMmMvbjN3L2VaTGkyN0VS?=
 =?utf-8?B?M21iUE1tQXpwcVl0THpYMmN5aXRNV3h4NGQzdEpxeWFNTG9vQUR1TnFxUDcy?=
 =?utf-8?B?RkNnbFFkR0dKUXNxVDFzNXV5VndRWG1nODV6Z2JQYU9BdERva041WjBhK1RD?=
 =?utf-8?B?OTNYcDM1QXJnK0RVZW9IcXJjS0VWenZ3bVZ3K3VRUDM4UURPeVZ3Z042Mkxh?=
 =?utf-8?B?b1RCdElUTXZHZzgxVmJ4UkxDWlNXUHljTG1HMnczOTQrM3FMcm1NVE9IVjJT?=
 =?utf-8?B?eWVqdmtjREppNWVaQUt3Q3UwOXNrVlJ3b1BIeVRrbm13WDNCTnJNTHErMTZB?=
 =?utf-8?B?QUJLZlEwZjJoVEtxU0E4Ni9kQUJnZ3JuV29tdTQxSlozZHZFZGZzT2NsTXpo?=
 =?utf-8?B?dkNoNHB6OEdpYVNXdU8zOGgvVGlSbHNiV28rSXN3YUowT3B4WjNlUTVXY0FJ?=
 =?utf-8?B?WkFLdlJOL0ZwMmVyc1g3cS83Z3FGUTkrZ1FqQ0JpV0QyVFc2YllkeUlJdmwv?=
 =?utf-8?B?TS9CU2d6MWNCaVc3citsc2Q0ejB5RXZmbUs4OHBaemdOWDBpaGVQQ1p5VGxV?=
 =?utf-8?B?dExqekFnWTJaOUtDSWozSzRpRExES0E4VkYrYXMvTjdaNTh6c1lBb3ppMVNH?=
 =?utf-8?B?WGVWMGJhT05XT3M0citjbVlsTk1hSXBIK3ptYjRlZ0xaN2pmMmc2Q0paVkxF?=
 =?utf-8?B?QlNZZFo2VkFmdDZHNUswVThQRkhMLy9WYTU1clNUSWNhMUl4dUV5dDQ4cEZL?=
 =?utf-8?B?dEtuNy95RXdIT3NZa09kZzMzNi9LL1F2aGhOdnFTblJmV2JKZjhsWmVjYzZ6?=
 =?utf-8?B?TE95QnprS2dQN1ViTnZRZjFEUlNEYjIwNWNOZlB4OXl0dlEwSEJtckVaeUVT?=
 =?utf-8?B?Z29YTWlkME5tVnZIRC9seW5SK05HUTRzR2JreXJaWS9EcGh2eC8xOFUweGdu?=
 =?utf-8?B?WEtXeURQdUFDNnM0bUxZU2dOdUhvWVhGeWlMR0NFMU1ZeUxvZjNnT2cxckh6?=
 =?utf-8?B?N3NZc3h2eEdkbDM2dUVwdUR1TGV6Ykp4eUxXVGlsNUMvR0tNUzlOVWM0bG5V?=
 =?utf-8?B?cFFGMEdZcmxNMEp1dXdPd1FGSTg4bGRmdC9QK1Q3M2ZEdkVhNVJtcklPV1hY?=
 =?utf-8?B?ZUlzKzAwQUZxTkJKcTZUZFpTOXpzWnhrdFF3Y0JOUmUzOVhuMk1hVzJHck8r?=
 =?utf-8?B?NlNISXVueFU4WTVDWlhCc0NBWEVIMEZDczRGRjRnK0JSRjc2d1JhMTVwNzln?=
 =?utf-8?B?aEhlMjhwb0FYUmJWNTgzWkNjYThHQm02bTNQRTBaRitzMW1pMWZPM2IxajZn?=
 =?utf-8?B?aUppNG9za1BZNk9KM0lMcVpBVDJKNWQ1anIzbzdEWmltb21sbVRtaTdaMkZM?=
 =?utf-8?B?VmE5Nlp3K284OCtPNlBwcC9sY2dWVDBYcUlaNmdWd2xFclZScm10OEhUeCsz?=
 =?utf-8?B?QUU3MVN0emhaRjZaWFZYMGNYUWFGZkFtMWZ4UUNuWlEwUHNzMEljNTU3ODNq?=
 =?utf-8?B?ang0b3Bld01ZVlh0S21GY0xoM0dPakZuK1RCU015R2lLNXlOTnpoOWowbStw?=
 =?utf-8?B?aWdidEppU1RrRnpTTXY1OFNtRldiL3JqdVRUaVN4R3QwT0k4UTB3ckVveWFG?=
 =?utf-8?Q?ASxU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K3S3EdhjZPiPSxxTntoWBzaW0CtU4wlW6LcE7hf1JIhkLmZaLGDsqtCFV/7Fg7NS571AhEBZlLb73QtRxpJAlQDU6kaciROnHC6ZCAaSIpwbIG0Q6fvXvZle2WTN3FQoX9L39kExWcUUlURVqMhbD5pY5B+kjiXg1UyxA05x5fEAsOLImidRXnmRKlqB8CAIWv0h5IFsKPuH8VsxEDuL9QxAkWJTpntC1IEGFQkNMwZCwZ4O1lR/v0VfJ7cwBh5CotzhQOE7NyMim/KND6cA9eI7zFCCAtbyBGxuBhEcMKJreKvmGXD1pNEmiXl6bkL+Ny6Sulj9a0vZ8oNQuxP//nYrBSbV70vy9qD6NiAkavPxalcMK8tfSmT88OIGHPw/4xgpTRQIHZQ1qYTjVTNHA8ZcjiGPrqP+H0yIuIXo3khYDQ+XsYBF/B0cBHk/Q7kWAu5RdSAEcompFCuL97kk7v6uUvfSBF6tOgjDCmlB/eQLnIQNysyprWtw7+b5nnXmOLq3e0t/W9qpq+ET+/QoR7va1DyZERYRs4wDpLgYWbt2AmBR1CFfM5+GKbOfxm4eSqWfez4x6HrdoD/eT1blXXWhpiTacM+bHWl6isEr2Qv2TAg96S3YJcfuWD/ohyLk
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02392bbc-0c8e-43bc-ed90-08dd778e3ab5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 17:44:51.0423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Kmgv1EAwSTIFIQwNEDSMoUlAVi5/8V7lKsbNgzf7c77wO+7WLiWRXMjrOA4WP5QZXfsKaZ+xrBNh/orwT2pdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR13MB6248
X-Proofpoint-GUID: Nt4aM6DsXjBLY387TvloZCHZ5sUQX8ao
X-Proofpoint-ORIG-GUID: Nt4aM6DsXjBLY387TvloZCHZ5sUQX8ao
X-Sony-Outbound-GUID: Nt4aM6DsXjBLY387TvloZCHZ5sUQX8ao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaG9tYXMgR2xlaXhuZXIgPHRn
bHhAbGludXRyb25peC5kZT4NCj4gT24gVHVlLCBBcHIgMDggMjAyNSBhdCAxNzozNCwgVGltIEJp
cmQgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRm9yIHdoYXQg
aXQncyB3b3J0aCwgSSd2ZSBhbHdheXMgYmVlbiBhIGJpdCBza2VwdGljYWwgb2YgdGhlIHVzZSBv
ZiB0aGUgcHl0aG9uIGdpdCBtb2R1bGUNCj4gPiBpbiBzcGR4Y2hlY2sucHkuICBJdHMgdXNlIG1h
a2VzIGl0IGltcG9zc2libGUgdG8gdXNlIHNwZHhjaGVjayBvbiBhIGtlcm5lbCBzb3VyY2UgdHJl
ZQ0KPiA+IGZyb20gYSB0YXJiYWxsIChpZSwgb24gc291cmNlIG5vdCBpbnNpZGUgYSBnaXQgcmVw
bykuICBBbHNvLCBmcm9tIHdoYXQgSSBjYW4gc2VlIGluIHNwZHhjaGVjay5weSwNCj4gPiB0aGUg
d2F5IGl0J3MgdXNlZCBpcyBqdXN0IHRvIGdldCB0aGUgdG9wIGRpcmVjdG9yaWVzIGZvciBlaXRo
ZXIgdGhlIExJQ0VOU0VTIGRpciwNCj4gPiB0aGUgdG9wIGRpciBvZiB0aGUga2VybmVsIHNvdXJj
ZSB0cmVlLCBvciB0aGUgZGlyZWN0b3J5IHRvIHNjYW4gcGFzc2VkIG9uIHRoZQ0KPiA+IHNwZHhj
aGVjay5weSBjb21tYW5kIGxpbmUsIGFuZCB0aGVuIHRvIHVzZSB0aGUgcmVwby50cmF2ZXJzZSgp
IGZ1bmN0aW9uIG9uIHNhaWQgZGlyZWN0b3J5Lg0KPiA+DQo+ID4gVGhpcyBlbmRzIHVwIGV4Y2x1
ZGluZyBhbnkgZmlsZXMgaW4gdGhlIHNvdXJjZSBkaXJlY3RvcnkgdHJlZSB0aGF0IGFyZSBub3Qg
Y2hlY2tlZA0KPiA+IGludG8gZ2l0IHlldCwgc2lsZW50bHkgc2tpcHBpbmcgdGhlbSAod2hpY2gg
SSd2ZSBydW4gaW50byBiZWZvcmUgd2hlbg0KPiA+IHVzaW5nIHRoZSB0b29sKS4NCj4gDQo+IFRo
ZSBleGFjdGx5IHNhbWUgcHJvYmxlbSBleGlzdHMgdGhlIG90aGVyIHdheSByb3VuZC4gUnVuIGFu
DQo+IHVuY29uc3RyYWluZWQgdmVyc2lvbiBvZiBzcGR4Y2hlY2sgb24gYSBkaXJ0eSBzb3VyY2Ug
dHJlZSB3aXRoIGxvdHMgb2YNCj4gbGVmdG92ZXJzLCB0aGVuIGl0IHNjYW5zIG5vbnNlbnNlIGFs
bCB0aGUgd2F5IGluc3RlYWQgb2Ygc2tpcHBpbmcgc29tZQ0KPiBub3QgeWV0IGdpdCB0cmFja2Vk
IGZpbGVzLg0KDQpZZWFoLiAgSSB0aG91Z2h0IGFib3V0IHRoaXMgb3Zlcm5pZ2h0LCBhbmQgY2Ft
ZSB0byB0aGUgc2FtZSBjb25jbHVzaW9uLg0KSSBmb3Jnb3QgdGhhdCBtb3N0IHBlb3BsZSBidWls
ZCB0aGUga2VybmVsIGluIGEgd2F5DQp0aGF0IHRoZSBidWlsZCByZXN1bHRzIGVuZCB1cCBpbiB0
aGUgc291cmNlIHRyZWUuICAoQ3JhenksIHJpZ2h0PykNCkkgYWxtb3N0IGFsd2F5cyB1c2UgS0JV
SUxEX09VVFBVVCwgYW5kIEkgYWx3YXlzIHVzZSBpdCB3aGVuIEknbSBkb2luZw0KZW1iZWRkZWQg
YW5kIHNwZHgtcmVsYXRlZCB3b3JrLCBzbyBJIGRvbid0IG9mdGVuIHJ1biBpbnRvIGJ1aWxkDQpj
b250YW1pbmF0aW9uIG9mIHRoZSBzb3VyY2UgdHJlZS4NCg0KPiANCj4gVGhlIGVhc2llc3Qgd2F5
IGZvciBtZSB0byBhY2hpZXZlIHRoYXQgd2FzIHVzaW5nIGdpdCB0byBleGNsdWRlIGFsbCBvZg0K
PiB0aGUgaXJyZWxldmFudCBub2lzZSwgd2hpY2ggSSBzdGlsbCBjb25zaWRlciB0byBiZSBhIHJl
YXNvbmFibGUgZGVzaWduDQo+IGRlY2lzaW9uLg0KDQpBZ3JlZWQuICBHaXZlbiBjb21tb24gYnVp
bGQgcHJhY3RpY2VzLCB0aGlzIGlzIGEgcmVhc29uYWJsZSBkZXNpZ24gZGVjaXNpb24uDQpJIHRo
b3VnaHQgdGhlcmUgbWlnaHQgYmUgYSBnb29kIHJlYXNvbiBmb3IgdGhpcyBkZXNpZ24gY2hvaWNl
LCBhbmQNCndhcyBob3BpbmcgeW91IHdvdWxkIHJlc3BvbmQsIFRob21hcy4gIFRoYW5rcyBmb3Ig
dGhlIHF1aWNrIGZlZWRiYWNrLg0KDQo+IA0KPiBBbmQgeWVzLCBpdCBpZ25vcmVzIG5vdCB5ZXQg
dHJhY2tlZCBmaWxlcywgYnV0IGlmIHlvdSB3YW50IHRvIGNoZWNrDQo+IHRoZW0sIHRoZW4gaXQn
cyBlYXN5IGVub3VnaCB0byBjb21taXQgdGhlbSB0ZW1wb3JhcmlseSBvciBwcm92aWRlIGENCj4g
ZGVkaWNhdGVkIGZpbGUgdGFyZ2V0IHRvIHRoZSB0b29scywgd2hpY2ggaWdub3JlcyBnaXQuDQoN
Ck9LLiAgWWVzLiBUaGF0J3MgYW4gZWFzeSB3b3JrYXJvdW5kLg0KDQo+IA0KPiA+IEkgdGhpbmsg
dGhlIGNvZGUgY291bGQgYmUgcmVsYXRpdmVseSBlYXNpbHkgcmVmYWN0b3JlZCB0byBlbGltaW5h
dGUgdGhlIHVzZSBvZiB0aGUgZ2l0DQo+ID4gbW9kdWxlLCB0byBvdmVyY29tZSB0aGVzZSBpc3N1
ZXMuICBJJ20gbm90IHN1cmUgaWYgcmVtb3ZpbmcgdGhlIG1vZHVsZSB3b3VsZA0KPiA+IGVsaW1p
bmF0ZSB0aGUgeWllbGQgb3BlcmF0aW9uICh1c2VkIGluc2lkZSByZXBvLnRyYXZlcnNlKCkpLCB3
aGljaCBzZWVtcyB0byBiZSBjYXVzaW5nIHRoZQ0KPiA+IHByb2JsZW0gZm91bmQgaGVyZS4gIElN
SE8sIGluIG15IGV4cGVyaWVuY2Ugd2hlbiB1c2luZyBweXRob24gaXQgaXMgaGVscGZ1bA0KPiA+
IHRvIHVzZSBhcyBmZXcgbm9uLWNvcmUgbW9kdWxlcyBhcyBwb3NzaWJsZSwgYmVjYXVzZSB0aGV5
IHRlbmQgdG8gYnJlYWsgbGlrZSB0aGlzDQo+ID4gb2NjYXNpb25hbGx5Lg0KPiA+DQo+ID4gTGV0
IG1lIGtub3cgaWYgYW55b25lIG9iamVjdHMgdG8gbWUgd29ya2luZyB1cCBhIHJlZmFjdG9yaW5n
IG9mIHNwZHhjaGVjay5weQ0KPiA+IGVsaW1pbmF0aW5nIHRoZSB1c2Ugb2YgdGhlIHB5dGhvbiAn
Z2l0JyBtb2R1bGUsIGFuZCBzdWJtaXR0aW5nIGl0IGZvciByZXZpZXcuDQo+IA0KPiBJIGhhdmUg
bm8gb2JqZWN0aW9ucyBhdCBhbGwgYXMgbG9uZyBhcyBpdCBnaXZlcyB0aGUgc2FtZSByZXN1bHQg
b2Ygbm90DQo+IHRyeWluZyB0byBzY2FuIHJhbmRvbSBhcnRpZmFjdHMgd2hpY2ggbWlnaHQgc2l0
IGFyb3VuZCBpbiBhIHNvdXJjZSB0cmVlLg0KPiANCj4gQnV0IG5vdCBmb3IgdGhlIHByaWNlIHRo
YXQgSSBoYXZlIHRvIGNyZWF0ZSBhIHRhcmJhbGwgb3IgYSBwcmlzdGluZQ0KPiBjaGVja2VkIG91
dCB0cmVlIGZpcnN0IHRvIHJ1biBpdC4gVGhhdCdkIGJlIGEgdXNhYmlsaXR5IHJlZ3Jlc3Npb24g
dG8NCj4gYmVnaW4gd2l0aC4NCg0KQWdyZWVkLg0KPiANCj4gR29vZCBsdWNrIGZvciBjb21pbmcg
dXAgd2l0aCBhIGNsZXZlciBhbmQgY2xlYW4gc29sdXRpb24gZm9yIHRoYXQhDQoNCkkgdGhvdWdo
dCBhYm91dCB2YXJpb3VzIHNvbHV0aW9ucyBmb3IgdGhpcywgYnV0IGVhY2ggb25lIEkgY2FtZSB1
cA0Kd2l0aCBoYWQgb3RoZXIgZHJhd2JhY2tzLiAgSWYgaXQgd2FzIGp1c3QgYSBtYXR0ZXIgb2Yg
c2VwYXJhdGluZyANCiouW2NoU10gZmlsZXMgZnJvbSBFTEYgb2JqZWN0IGZpbGVzLCB0aGF0IHdv
dWxkIGJlIGVhc3kgdG8gZGVhbCB3aXRoLg0KQnV0IHdlIHB1dCBTUERYIGhlYWRlcnMgb24gYWxs
IGtpbmRzIG9mIGZpbGVzLCBhbmQgdGhlcmUgYXJlIGxvdHMNCm9mIG90aGVyIHR5cGVzIG9mIGZp
bGVzIGdlbmVyYXRlZCBkdXJpbmcgYSBidWlsZCB0aGF0IGFyZSBub3QganVzdA0KRUxGIG9iamVj
dHMuICBBbmQgYnVpbGQgcnVsZXMgY2hhbmdlIG92ZXIgdGltZS4gIFNvIGV2ZW4gaWYgSSBtYWRl
DQphIGNvbXByZWhlbnNpdmUgc3lzdGVtIHRvZGF5IHRvIGNhdGNoIGJ1aWxkLWdlbmVyYXRlZCBv
dXRsaWVycywNCnRoZSBzb2x1dGlvbiB3b3VsZCBwcm9iYWJseSBuZWVkIGNvbnN0YW50IHVwZGF0
aW5nIGFuZCB0d2Vha2luZywgd2hpY2gNCklNSE8gbWFrZXMgaXQgYSBuby1nby4NCg0KPiANCj4g
SnVzdCBmb3IgdGhlIHJlY29yZDogSSByYXRoZXIgd2lzaCB0aGF0IHBlb3BsZSB3b3VsZCBjb250
cmlidXRlIHRvDQo+IGVsaW1pbmF0ZSB0aGUgcmVtYWluaW5nIDE3JSAoMTUzOTcgZmlsZXMpIHdo
aWNoIGRvIG5vdCBoYXZlIFNQRFgNCj4gaWRlbnRpZmllcnMgdGhhbiBjb21wbGFpbmluZyBhYm91
dCB0aGUgdHJpdmlhbCB0byBzb2x2ZSBzaG9ydC1jb21pbmdzIG9mDQo+IHRoZSB0b29sLCB3aGlj
aCB3YXMgd3JpdHRlbiB0byBoZWxwIHRoaXMgZWZmb3J0IGFuZCB0byBtYWtlIHN1cmUgdGhhdCBp
dA0KPiBkb2VzIG5vdCBkZWdyYWRlLg0KDQpJIGFncmVlIHdpdGggdGhpcy4gIEFuYWx5emluZyB3
aGVyZSB0aGUgaGVhZGVycyBhcmUgbWlzc2luZyBpcyBpbnRlcmVzdGluZy4NCkJ1dCBpdCdzIG1v
cmUgaW1wb3J0YW50IHRvIGp1c3QgZml4IHRoZSBtaXNzaW5nIG9uZXMuDQpJJ2xsIHNwZW5kIG1v
cmUgb2YgbXkgdGltZSB3b3JraW5nIG9uIG1pc3NpbmcgaGVhZGVycywNCnJhdGhlciB0aGFuIG9u
IHRvb2xzIHRvIGFuYWx5emUgYW5kIHJlcG9ydCB0aGVtLg0KDQpUaGFua3MgYW5kIHJlZ2FyZHMs
DQogLS0gVGltDQoNCg==
