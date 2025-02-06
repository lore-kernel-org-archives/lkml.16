Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68CC2AC17;
	Thu,  6 Feb 2025 02:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738809645; cv=fail; b=QcwR9SLyfypyl86ySM8drIqXhJeinQhdotC4KBEz71vG1KpgcXR44/ArWYQsO7ThqEHPE/tXZwkK+l4eMN7WBYH8LsUpwo4YnjktiHU2PunF30OqzjQtWscHoS5iDlHLQ0nBQt8rWuUVIg7Szy8pgEy2Ht56tEWJY1RXllkVWII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738809645; c=relaxed/simple;
	bh=iwcSpC+RtjD01adeO6N6W27LGvxhCSH4pKqUfW+JYXE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y8L5DEOdPXjhDzXxfjqh+3aaXOU05Yw2t2xugrr9iKLeFugi/oLkNC/+N42SfxA5znh99fGJUQ3DjSxHssX2TQOuY/DsqR214ZkLhbz8cKdMRbb/YxUGfxr7tZ3l6Mj52KRaw6NXjD+R7LSBt+R1xbb4NTDvpVos3OhA2SEtr5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JA9tAzi4; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JA9tAzi4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNZtw3t+vuNYzvVjzwKZkWspBq8rfk5ry/dUlDXMdvK1YrGNvA/mFQ8dF20EjeZ9szfBatR3gckpvwvWcRbucXeDv/bxkz0FUh1kB+8TQjfktIEkgQRNlN6OBpWv2Jmv24NSSaXgGF5BMKnQGwFpIcUr/YnhGVUIyz1M/97qLEB/A+Ejaox7L5IqEMNUp7W7FRnQHkfm4ZXOR+h+2ULuEFXkIC33xS7EOuEJK50trTyPqw/yLYkg47MIXaK3TWohmf1sX9hnKsk43BLK0tPmUG+tP3vRlr/4iqATd2YbZJp/tCMMPnJkKIa+PBEJ3mn3uRojkapiAssX0bcLIvIuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwcSpC+RtjD01adeO6N6W27LGvxhCSH4pKqUfW+JYXE=;
 b=qAeWpsjDrh00CCKqQey507Mo4QQq0MfzjwhN1scE7uiv9/PIYxYKcGwLHPILw0dSrPHOW7PKPrUsSonOrTjB112ul9MtDESArzeTMv3jaDMg6XExREsNAdtMB6dekDLFrz/3sOoHVy5apbB38SU6YgCwJGMbI05ZQbqNkUPTDEYnZDoHXRe2aznwCu7bEiBVhJPAxMj2QQUBZyNxGtKqgTJvP3LIQYfG1KWgCeLsiz+QDtNsc8C4zA2lGNy35h6ihUu1M7go1QJU5bGiphYqRJlTSgdXMjI2m8gpNjbLx5oOn6P7Uy9f+VTfdQaC6vSYyWsx3CGdfMiCdx6nJVwWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwcSpC+RtjD01adeO6N6W27LGvxhCSH4pKqUfW+JYXE=;
 b=JA9tAzi4hpQn0bGJZYsqous/AehB9iNDlVTNvykxOUuhknNLFBfApn2hlStLiKSaEvQsUubhJPjhTkTnTPBqUI+m7rW9a0wyPHPF0UpZs2CrFDenTupUK6RXxPn+L9ffC1Mqgj1BlHUBk6UHZr3qsSLcR2oE6SphMQARG0keilbv1/NKiV/oog2LVA+rXleUVTyu/iA6ryqvl1clDcsC1CAABhspsHlERIXScLuThtqssch5bb8+LxIgh0+Ui2MeAOoiOiT7kJcaow6xMgUoMz1TXgs37nPfa6ogU1Sxw1PUqRmiy9jW9SIjnhqxZNnY4/eLziRbti7LzclVJvwZFQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8344.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 6 Feb
 2025 02:40:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 02:40:39 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH 0/5] firmware: scmi/imx: Add i.MX95 LMM/CPU Protocol
Thread-Topic: [PATCH 0/5] firmware: scmi/imx: Add i.MX95 LMM/CPU Protocol
Thread-Index: AQHbbBZjcHLLf8FX10So5eTusHGTcbM5qJng
Date: Thu, 6 Feb 2025 02:40:39 +0000
Message-ID:
 <PAXPR04MB84596239145AC289C3C815D188F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
In-Reply-To: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB8344:EE_
x-ms-office365-filtering-correlation-id: 3297fcfc-4f14-4df0-0d30-08dd4657a498
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Rkxpb3JIWnlTWENReitodlIvOXlRUmoxTlNYR0l5Z2xsQXZ4SFEvdnFVN3lC?=
 =?utf-8?B?WkVZbDZQSDByRm5lZklrVnJBclVEMnhDSENkV3NNL0NadHlzclRmY0paai9H?=
 =?utf-8?B?K1hjM2JFY2x3OHZ3OHV0QTViWHdMUk1ZaURUNEVuTWY3VEFDOG5YOVFmdlFJ?=
 =?utf-8?B?ZFBhK3V4czdMRFdoRlc4aVBJTzM5ZHJrbitZTGg5dEdOaDlpTFFFckhSZGl4?=
 =?utf-8?B?V2pRNlZnVzNYbHVCT01JWkpDeDBwT3BoODlWNlRDMUtVRDM3NG5kcVFJV1BN?=
 =?utf-8?B?Kzlnc3J1VFdlWVRSa1RqN0xmTWRwVy91dGlicCtmSmZYdC8yZWxnMnRSUHF4?=
 =?utf-8?B?NDlUK3dPTHQyVnBBbE83K09LRlVXRmo5SGUvSWd2VTVEZGxrMTdYRi80K2tJ?=
 =?utf-8?B?ajIxUzZ4dkI0cXkyeENiTGZGTFF2UUxhdWk2NVhSTUZkUjNtVnBnc09GVWl0?=
 =?utf-8?B?N2V2VXEwY3JFdGdNM1E3T1YvM3Y3RW1TdVNYMDMrYkhSaEM4WEh3cVQwU1o0?=
 =?utf-8?B?N3gzWmJxdnBaNWlRYm8wMVVwbTc5Z0hvdW9iYVhJNnpwcGVLcUc1akVoNUtv?=
 =?utf-8?B?VFBIdStLaC8wSU1xQk1LNW11S3R6b3hweTlHN3NZcHlXcmtaWVNGWW9TcWYz?=
 =?utf-8?B?dVV1R0duUW5mbU5BKytjWDZxL0tucnROTldKSnB6MmRIYWpCOUNqRHJOb3Rx?=
 =?utf-8?B?OFc4VEF4WFNDaXlsYUFxNUZDN3lUeTMyeXN6MTVtSThlcG96UlBwZ0NXQmgw?=
 =?utf-8?B?eTVyZS9lTVlSNEFXelUxWGxGcy9HcVRyc1pSd1JKdzduUHpRMDFvMFREblRD?=
 =?utf-8?B?TkJzNUJVaGtPNHJwT3BqWnYyLzQ2MEpNUzhPMmRPU2lhN1V5ck9rQkVYaTBV?=
 =?utf-8?B?TmFaYndKK3lUSkVZTGdPNEpKaXc1YUJxOHdRNjVMOXFyVjJacjhPV0V2NkE2?=
 =?utf-8?B?R0lJdEgxN25EM21leXlJcnh2b05jenJNN2lOeE1sandJOEhocno0QzdYRUVZ?=
 =?utf-8?B?TEhUVzBWMUlKSFZ3RGtrVThmWWpkMm15Z3RyMUJnL3NNcnRSS1UwdUdNMk0v?=
 =?utf-8?B?MnRWeFZrRVZQY2ZHa0xuN3NmRm51ZncrUWp6b2NzQzlZRjVLWVVGL3Q2NUt6?=
 =?utf-8?B?Rm1oUjRqaXFaZEYxVnBLUTZhTEpZd0l2ZHkxUG5LbFFmVGRSazk2U3NldmU5?=
 =?utf-8?B?cWNScGZuSGo3RkpuYlVDWStRbVZnRG95VzdCZ0xJS0pwdys3bGZHSng2RWph?=
 =?utf-8?B?dzZlT1A1bitEcTYvTlMrZzFBSWlXbEJGUE1vU1BwMUh4RlhoZGMraXJaNFAx?=
 =?utf-8?B?Q3ZOSVd0WFZEK0pDSEVRV28zOVVwNjZQb0sraDh3UkU0K0taVVNVYTdDZktw?=
 =?utf-8?B?ZFgzTzhpU21FejdZN1NBWG9Jam95ZVFSTm1CUGMxa2RtWHZaaGpZbkFnZFQz?=
 =?utf-8?B?USt1K3ZxeU41aU1lZTVERXM1RFp0Z1NINkFrMzVxTlZUTnF1ejRFVktUd3VF?=
 =?utf-8?B?UndIZTU4L2c2N0RJN3JQRlR5aUpOdXVtQ1JUV3REZFNsaThXV01Ka0VuaUNP?=
 =?utf-8?B?Uzl3bTgzT3JsZ2FhOEhzKy8ybWd5cXBQVWdoeWZueHZHbkRMdFRDcm5BNEIw?=
 =?utf-8?B?NkdMQXVxVzJxb0NEWVRDL0FaZGt5d1pDdzRUendkbWUwSElZdENsd0NOZWZ1?=
 =?utf-8?B?eGZiY3A2NnA0T0dqcXVFSFVwREdLNkNNUGVlWFJvZVJZVCtYTnoxN2ttY2hH?=
 =?utf-8?B?VkczOWR2ZHJOaHlEdnZKZ25zS0xYY0I4Ni85d2J1cS8vY1c0RmV3aG5HSnJO?=
 =?utf-8?B?R3A2RUdOWTdLMGlKaG1zSkJpSEVkdS9mWHhoQzgxcDg1NTV4a1FRTGZBQVZq?=
 =?utf-8?B?b2Fxb2p5bURLNXVPSmkzNS92NnFIeXVIRi9UR011ZlZ4UTlQbVZQYmNQdXRx?=
 =?utf-8?Q?XJWu6WuWsMr5xG6vBHclQskHHukWp3p2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTljT3kzSmoxZHdEazc2TE40TzV1M2dwNm5Ma3VvSEEwRHhnOVdGa3lhUHNW?=
 =?utf-8?B?SFpBVnZzYkl1WmgwT21MMXU2dlVIRWRMdGJKM0YwOUI0UzNYeU9WRldtOEE2?=
 =?utf-8?B?ZWpmWmJUVkJtdjlUOEdlbG1IU1pvZ1RzUlhSQlFRbkhvZHJnQ3ZBWU5BNFhC?=
 =?utf-8?B?anM5SVkvL2s4QXJoSTRheDdTMGx1ODhjaWZReXArWmpRY0xWL0JJL214Rlgz?=
 =?utf-8?B?alFvQVZ1Y1JZMi9keEQ3Skl5M0ZkMEl3M21oZ1ZWQmIwS0MyTkF4Vm5Vc2dx?=
 =?utf-8?B?RmlWd215TldUcUdTU1MrNVF0ZjNIV0RxTWlTeUZEOHoxYUxmWVVyZkM4OFlx?=
 =?utf-8?B?MFY3VGU5b1Y1T04vNkFFSWx1Q1l5NUdPR3orVktzeGVaaitqOVBFamNVaVlv?=
 =?utf-8?B?UGp4SHRHcnZFcUU3akRyam1TYkEwdnpLMzllWWVORndJTHVFU1NzR2ZrY3JG?=
 =?utf-8?B?TDd4RU1hUERsUndGUzNSQmZseUIxVHdGNDVkZ2VGM3grNnk5NVNjM2tIRHVy?=
 =?utf-8?B?TUZpNXhaVzA0aGZkZHVJKzkwNXFQaWZ6RVpSa25pdTZMZE8zUWhLTkExaXJ0?=
 =?utf-8?B?OUE1MHdtbWNtaTFCN1d1K3lEc2QvMkZPYUs0L2ZzM0Fqa1Zzc0JvVmZPc1BQ?=
 =?utf-8?B?NjRDQWJ0MjJzU0g2NjFBUEkwZmlGMVVjU0NJR2hVMFhjSW04anYrelpHVU9V?=
 =?utf-8?B?Q2dGTjBEeTkrS3E1cE1XdnV5Z2VDb2FqeDIyQ1FxcmVQVG9DaWVuRk9QOVRD?=
 =?utf-8?B?bjB2NkFld1pEOUk4TVI3ZjhRNllvWlRqWnNidW1ZREZNY3FPRFdOM1djTmtR?=
 =?utf-8?B?bmVWSHczZmFqL3ZYSlllZUxIdEtCQTQvK21CMDB3VkpwbmtHNlNTaytWK2ky?=
 =?utf-8?B?QU9ZcnRkOTZETzRLNmhJUy9zSlFYMnVWVFpsVEwrTWpsZWFwSlI2bHYxU1ZV?=
 =?utf-8?B?RWoxRVFZdU5nOFJEN0NMaFFVQjJZQzNZSXhXUS9pSXZjSXZrdEVRMCtqbGV3?=
 =?utf-8?B?NWNxTnNUWG5pVnUxdTRoUmZJRTBZNEoxSEVJZXMrcmFwaThTUThqWUlqRmM1?=
 =?utf-8?B?N1BMQm0wRitORGNwcXdQaUtXbFY0TTJoMGMwZXVpTFZHMXBsYlppcHBDNjc3?=
 =?utf-8?B?TnFCUVJQNVp3QkhEU3B5SWdGem02RVAxemh4SWVqUEFZN1l0R1ZYWDRjR2F3?=
 =?utf-8?B?dnRnRVB2LzRqYkdqUFlkUERMZ1hsdFp1THhVTHQybjEraTRaRnBXL2R3Slg4?=
 =?utf-8?B?VXFHUjU2MUNVVlBwa3lva25MS24zaTNSZEkrOHZRREl0bWRUNTFYdjVlNGVF?=
 =?utf-8?B?VEQ1Umd3THQvanVaL2szQ3lQSngwajdsR3o2UGZQZ0UveVdoSEJnKzB4V0E1?=
 =?utf-8?B?NE9FWGp1TGU3STdJL0J2MzBYL0lBcTdPUS9WMzc2VkkxOW5VbXRVZ2E5Wjdl?=
 =?utf-8?B?anRkMTF3NThEQjY5K29Md3BIYVVxZXdQcGxZOHgwUGdtTjU2OXVoeXl1ZlV0?=
 =?utf-8?B?L1NXMEFSd2s3VTlNMWpHMUNQaXV1YnNNWHZHdC8vaVp2RHR5ekVBTmt2ejk5?=
 =?utf-8?B?UE9hMVp1by8xMGtYMzVYOVFCN09OUCs3blZaRmtXbkRvc1ZQcXhCdC9GWUhD?=
 =?utf-8?B?Z3dNMVdNN3NmNzQwTlFJcDdMcWx4eE81MWVxczZobzJSS1FacVZFMnFNNGVQ?=
 =?utf-8?B?ZGpRdTYvQjQrajF1QWI5SUNQeHBXR0M0YjNBWkJpNDlIcXlZdys1TTEvdHF5?=
 =?utf-8?B?eE1CRTJKV0FZSVRQZWdpTVpsVjc4a3RDMTZDTWtsRWFRLzR5MysybjNaVU91?=
 =?utf-8?B?SnhEaE1XR0w4Vmw5c2xLTmZPTWtyTHJwY3RwUlptYlNYWkpEeXE0YUFFNmxD?=
 =?utf-8?B?VTY2M1BqUnAwMjg4WWgybCtmRitUMkQ4U3dSQ1J5T0J0M3Y4dGVwMTBsWmdF?=
 =?utf-8?B?YkhtZkhsbjlvUGRCVmkzSVVMY0FsU2hQb2Q0b3cxNGM0S3RlUFN2ODFuL0ww?=
 =?utf-8?B?aUNsR1M4SHo5UjR4UmU5dlhPNU41QSt3em9SUSs0eTRmdncxWk1VLzNBcmFN?=
 =?utf-8?B?cytJQllMcDgvTzN5alkvYlhPeVpXMnBXWHJYc3FiUjEyNlJDMVdCQzgwTHBq?=
 =?utf-8?Q?XzbE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3297fcfc-4f14-4df0-0d30-08dd4657a498
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 02:40:39.3648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D6qFxTrIC25zHl98jpg5CqShqeuHYj0TswC5DX0NctxFUKfJ36oTQ6okJ6SXPcjoRgZGbRJ5lLtO/MyOOt9TuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8344

SGksDQoNCj4gU3ViamVjdDogW1BBVENIIDAvNV0gZmlybXdhcmU6IHNjbWkvaW14OiBBZGQgaS5N
WDk1IExNTS9DUFUNCj4gUHJvdG9jb2wNCg0KSSBhbSBwbGFubmluZyB0byBzZW5kIFYyIG91dCB0
aGlzIHdlZWsgaWYgbm8gbW9yZSBjb21tZW50cy4NCg0KVGhhbmtzLA0KUGVuZy4NCg0KPiANCj4g
aS5NWDk1IFN5c3RlbSBNYW5hZ2VyKFNNKSBpbXBsZW1lbnRzIExvZ2ljYWwgTWFjaGluZQ0KPiBN
YW5hZ2VtZW50KExNTSkgYW5kIENQVSBwcm90b2NvbCB0byBtYW5hZ2UgTG9naWNhbCBNYWNoaW5l
KExNKQ0KPiBhbmQgQ1BVcyhlZywgTTcpLg0KPiANCj4gVG8gbWFuYWdlIE03IGluIGEgc2VwYXJh
dGUgTE0gb3IgaW4gc2FtZSBMTSBhcyBMaW51eCBpdHNlbGYuIExNTQ0KPiBBUElzIGFuZCBDUFUg
QVBJcyBhcmUgbmVlZGVkLg0KPiANCj4gV2hlbiBNNyBpcyBpbiBMTSAnbG0tbTcnLCBhbmQgdGhp
cyBMTSBpcyBtYW5hZ2FibGUgYnkgJ2xpbnV4LWxtJywNCj4gbGludXggY291bGQgdXNlIExNTV9C
T09ULCBMTU1fU0hVVERPV04gYW5kIGV0YyB0byBtYW5hZ2UNCj4gJ2xtLW03Jy4NCj4gDQo+IElm
IGluIHNhbWUgTE0sIHVzZSBDUFVfU1RBUlQsIENQVV9TVE9QLCBDUFVfUkVTRVRfVkVDVE9SX1NF
VA0KPiBhbmQgZXRjIHRvIG1hbmFnZSBNNy4NCj4gDQo+IEJvdGggTE1NL0NQVSBBUElzIHdpbGwg
YmUgdXNlZCBieSByZW1vdGVwcm9jIGRyaXZlci4gVGhlDQo+IHJlbW90ZXByb2MgcGF0Y2hzZXQg
d2lsbCBiZSBwb3N0ZWQgb3V0IGFmdGVyIHRoaXMgcGF0Y2hzZXQgZ2V0cw0KPiByZXZpZXdlZCBv
ciBpbiBnb29kIHNoYXBlIHBlciBNYWl0YWluZXIncyB2aWV3Lg0KPiANCj4gQnVpbGQgcGFzcyB3
aXRoIENPTVBJTEVfVEVTVA0KPiBUZXN0ZWQgd2l0aCByZW1vdGVwcm9jIG9uIGkuTVg5NQ0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+IC0tLQ0KPiBQ
ZW5nIEZhbiAoNSk6DQo+ICAgICAgIGZpcm13YXJlOiBhcm1fc2NtaTogaW14OiBBZGQgaS5NWDk1
IExNTSBwcm90b2NvbA0KPiAgICAgICBmaXJtd2FyZTogYXJtX3NjbWk6IGlteDogQWRkIGkuTVg5
NSBDUFUgUHJvdG9jb2wNCj4gICAgICAgZmlybXdhcmU6IGFybV9zY21pOiBpbXg6IEFkZCBMTU0g
YW5kIENQVSBkb2N1bWVudGF0aW9uDQo+ICAgICAgIGZpcm13YXJlOiBpbXg6IEFkZCBpLk1YOTUg
U0NNSSBMTU0gZHJpdmVyDQo+ICAgICAgIGZpcm13YXJlOiBpbXg6IEFkZCBpLk1YOTUgU0NNSSBD
UFUgZHJpdmVyDQo+IA0KPiAgZHJpdmVycy9maXJtd2FyZS9hcm1fc2NtaS92ZW5kb3JzL2lteC9L
Y29uZmlnICAgICAgfCAgMjIgKw0KPiAgZHJpdmVycy9maXJtd2FyZS9hcm1fc2NtaS92ZW5kb3Jz
L2lteC9NYWtlZmlsZSAgICAgfCAgIDIgKw0KPiAgZHJpdmVycy9maXJtd2FyZS9hcm1fc2NtaS92
ZW5kb3JzL2lteC9pbXgtc20tY3B1LmMgfCAyODMNCj4gKysrKysrKysrICBkcml2ZXJzL2Zpcm13
YXJlL2FybV9zY21pL3ZlbmRvcnMvaW14L2lteC1zbS1sbW0uYyB8DQo+IDIzNSArKysrKysrDQo+
ICBkcml2ZXJzL2Zpcm13YXJlL2FybV9zY21pL3ZlbmRvcnMvaW14L2lteDk1LnJzdCAgICB8IDY5
Mg0KPiArKysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZmlybXdhcmUvaW14L0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgIHwgIDIyICsNCj4gIGRyaXZlcnMvZmlybXdhcmUvaW14
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsNCj4gIGRyaXZlcnMvZmlybXdh
cmUvaW14L3NtLWNwdS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDkxICsrKw0KPiAgZHJpdmVy
cy9maXJtd2FyZS9pbXgvc20tbG1tLmMgICAgICAgICAgICAgICAgICAgICAgfCAgODkgKysrDQo+
ICBpbmNsdWRlL2xpbnV4L2Zpcm13YXJlL2lteC9zbS5oICAgICAgICAgICAgICAgICAgICB8ICA1
NiArKw0KPiAgaW5jbHVkZS9saW51eC9zY21pX2lteF9wcm90b2NvbC5oICAgICAgICAgICAgICAg
ICAgfCAgMzkgKysNCj4gIDExIGZpbGVzIGNoYW5nZWQsIDE1MzMgaW5zZXJ0aW9ucygrKQ0KPiAt
LS0NCj4gYmFzZS1jb21taXQ6IDA5MDdlN2ZiMzU3NTY0NjRhYTM0YzM1ZDZhYmIwMjk5ODQxODE2
NGINCj4gY2hhbmdlLWlkOiAyMDI1MDEyMC1pbXgtbG1tLWNwdS00MThkYWFhMjU3ZTINCj4gDQo+
IEJlc3QgcmVnYXJkcywNCj4gLS0NCj4gUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQoNCg==
