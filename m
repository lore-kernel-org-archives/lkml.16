Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB1021CC74;
	Wed, 16 Apr 2025 12:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805570; cv=fail; b=ssY1n8sXi2a60KOCo1F2wsnQzNaf38O0rCDsEc/zlEv4fAskCKAorhczWw3xDX1Rjid8YpDK1PFg5cpb9+Mvw6d30gpiIeJZPWFFDisCUcSRpuzmDiUavT4WnSNpLBfst47/KESpIyiZOpROBx4xdrsDID9fWcQiWN1l/Jee9HE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805570; c=relaxed/simple;
	bh=JpsBlSxZ81yn1049RSpQjXfiOS3OZmDE2fhuripk3QA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bC7eeRU1QQgmfkWuNgVHR+3gxeVWFVSXnCxdPTXn7ZgAlGhrojxDbfs0hse9wGtH5vnimVgOxpIP9X5mE7XX6EJjTIPXbMUMOojbndQfmgRVcG++fUZ7YmJx5nm1+cF4ZBQF1oOsOU+QC3HWWWd+Fwlikc//gsKI9Nx3noE8lZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=w/UET+SQ; dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b=QYTJruLl; arc=fail smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="w/UET+SQ";
	dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="QYTJruLl"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GAtbDh025742;
	Wed, 16 Apr 2025 13:12:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=dk201812; bh=8KpllZPaHlsUUvC1yV7Tkw2JS
	Kn88ZOkyCPVAdP1Sug=; b=w/UET+SQsNt6VkRTxKqOZ+IFuiew+b61YXDKrJsvT
	x5oqkljDDw8OYDfLUd6BqqF0QLJTFDh7tKcRcnhzDFXpqLWEUWjg327Mm8Gr1hNy
	EbyBFkRB6QKum7bFHjcy0RGb021EqmmG0lFlbjukxUswXIJ4t1WbaKT2WEnmk9EC
	tomdXqG1fANZz/sQukdZJZdEuZXsBF8DNFz9aM5rDAZdA5xeUyQjtVqdLo+NfCjB
	QJtiW91EXzlWBeIPCtKrX9G6MS3HMSQExYPpuss7Tlh2CdROa01hHXJpWhlGBgjU
	93vOZH9xYMAhpiuQl6dzzoBuDkBjKp22LI5siSv/mMPuA==
Received: from cwxp265cu008.outbound.protection.outlook.com (mail-ukwestazlp17010004.outbound.protection.outlook.com [40.93.68.4])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45yeeuak88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 13:12:34 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2o/cZ6cpUjQ5BKcF0y7AkFVc7ob+wyLmCvtd24PEn756ZIglzzkOmxTjvL3i3rD293iabvzjbEen7TZg8o559yE/U/2bla8cjjLCaTyMj4p5XLISkeYqt41PGpszZUpxMzRGw/Qb1PnJ2fso76tH1S9brXUUacHY/kRQ5oQOiYNEkEWL6eaI/NbEiJJ4Xejvmggy8xEsk+DH+yCeHv1gCUb43pk1o+QW0sLGGQA/TZ91hyyDq+7dsSwj9J7ZKYhRvFfQnB27ho5140Ia4IrrRGTdqli25cxACijrZWFmGfJN8oA12FiTuH8uYShilSw+nl2R9f6GfZJEj+2gZURYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KpllZPaHlsUUvC1yV7Tkw2JSKn88ZOkyCPVAdP1Sug=;
 b=wTNbgwZWi9IlqbDVM29UtMpbmsnkACSkBTvVQzntU93wjRon8R/q7vX21+PGhsp04ijLFZrPEPbNllR/AfmJE7kflpTIp7p7JnjkDlefR55i98Cj9Yaw0CTRXw0m2SBI5CpXqX8ptn4ont7gkTMvmjIsZcsHGRVoimEyJatMuclPdvPjHXAY9YqhgF8fQao+OUDTosjxrNJEmhGF8GMnsxj25cjdZCNpBffpXWrLlY+E5AAS6USyjluFHVYF7f0KItbwrkI+pj1mgLYBJYg+Oa4ODBICyIJ+oS0xOuPAGb1vKZd007WDsZb6vOTswIG1L/Ec432andt85cimcK3LQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KpllZPaHlsUUvC1yV7Tkw2JSKn88ZOkyCPVAdP1Sug=;
 b=QYTJruLlkX7of7ryLjcmqWbP7UpWJb1nqDM0+G5aQBwZjNL9IJDreNA9KFTfi02M9FrFr7Q0xm5XzRIzHCRBbY9HYA3baOV+Ftj93o7HaN43NSdKAc/60NY8T2jyIFPT6ZyLc35T5qn6C33t+k7eCwDeh/SsqXMK/7BOmGCbke0=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB6163.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:24c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.19; Wed, 16 Apr 2025 12:12:30 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.8655.018; Wed, 16 Apr 2025
 12:12:30 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Nishanth Menon <nm@ti.com>, Randolph Sapp <rs@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Frank Binns <Frank.Binns@imgtec.com>,
        Alessio
 Belle <Alessio.Belle@imgtec.com>,
        Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
        Luigi Santivetti <Luigi.Santivetti@imgtec.com>,
        Darren Etheridge
	<detheridge@ti.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
Thread-Topic: [PATCH 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
Thread-Index: AQHbrsjThUf71wEKUkCOB8yrzSucAQ==
Date: Wed, 16 Apr 2025 12:12:30 +0000
Message-ID: <4816c493-8e30-476a-9e97-dd29dbab19eb@imgtec.com>
References: <20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com>
 <20250415-bxs-4-64-dts-v1-2-f7d3fa06625d@imgtec.com>
 <D97HVW413ESX.1EEP5D4O6HMOG@ti.com> <20250416112700.t3zqihsmn24jaiub@purse>
In-Reply-To: <20250416112700.t3zqihsmn24jaiub@purse>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB6163:EE_
x-ms-office365-filtering-correlation-id: 793f0fa8-4d8f-4ea2-35a6-08dd7cdff635
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|4053099003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SDZ4MkFXd2lycG9UUy9VaUlvbzdYblRBNFRSVDQrQU1JVTVoaTN1Rk5rYlFG?=
 =?utf-8?B?d05KUWxURE9sbzlkMTVKdVV2MUg4MXRBTnlpOW44eFdxY1NyRy9KOHJZcWtw?=
 =?utf-8?B?Vlhyek9ZK1hFczNVckNmVkFkZVB3bXlaMTQ5VnNqSDZPdXd1U3JlYkRTaXN2?=
 =?utf-8?B?VEI0SHByM1d6R1R2cGJuMTB4MDBoRzRMWFlNelZLNjJDclY0aFJwdlFQYW55?=
 =?utf-8?B?NUZSMHZMdTNtRytZa1dlWTlBS3Y4R0pvdFRoU1p2UHB1UW84ZklxRFdGWHdV?=
 =?utf-8?B?TmtscFFYRHR0OGZJTFJycDZnbUZJNExXalJ4bTM3MC9ZbDdYVGx3Z2dVeUVH?=
 =?utf-8?B?L3pkY3ZQcS84NURUMzJ6TUprRkEya0ViOEJ5ZkdhY2dOaDVFTFRWc1lNVnV3?=
 =?utf-8?B?V1hhcFpQLzVmVktscm9SekI0dC9ubnVXVGdrUzlZTm5pUUdMb3ZYZm85QzNh?=
 =?utf-8?B?ZHRBbkZMUXI5NllONEdiVUN0V3p0a1h5MDlsY2lwZVVPcjdiMzg1U1BnMlRx?=
 =?utf-8?B?MlhaUDI4bVF0NDZKUDFLZ09NVEN5UzFYRzh4NWVXZkZ6TmlPNHE2a05vQTJs?=
 =?utf-8?B?aEhPS2FlTCtDQTBZcDU2ZTk1SzJOdmQ1bjR6QkE4YkhlYUROK3ZiaEN2NmVE?=
 =?utf-8?B?MU8yRGJoVGJocHRxUWNQc25WdjdsRG5CSFZNcE9nMzE2VVY1Z1dtMFUxbndD?=
 =?utf-8?B?UmR4MWlVaXUzeWZhMGpQbXdCbHlhMWxHSk9aeU5QNVA2L2hIckxEOVliSHAx?=
 =?utf-8?B?aklhcXVpN2pwZWFtTEUzZFhsL0FtQ0xtSVlDRTd4ZkZ5UldvUVI5aFhoWjQz?=
 =?utf-8?B?ZXA3ZW8zcFhpMUhwSDZTbi9ZK2N1d1EyQTUrVVphKytSNThOMHJQNjg0bHN3?=
 =?utf-8?B?L0E0Ymx1U2NtQlEyYk1BOGQwWXkrYWFEQVFYZkdqdG52dCtDZFhaMXd4TFJW?=
 =?utf-8?B?V1hkYUhrdUp2dmFBMnZheXpDdXdNRm9rM3NDQnNaSjU0STlRQkhLLzlwSm4x?=
 =?utf-8?B?RzYreXdJMDM2aTd4RS8vWnpXVGFtVGhDRTNNSE4wOGR0MklNMU9vR0tqZzVQ?=
 =?utf-8?B?aVBkOE5uMW5XdW1Va1AvYVhpZ2RiY1pYZUpTL3E3Vk5BTnFpNmFwalpOKzUx?=
 =?utf-8?B?Sis5SmdtQ3BoVHNva3dkU1pIUi90enpqVWVqSi8vSU9Hb3ZJTHBoTjBod2hv?=
 =?utf-8?B?SVVvTHJlVEs4dkRCZFBqbGJ6eVg3K2w4N0x2cHVvYklhak5WMmNqWE93U2VW?=
 =?utf-8?B?OFBXNDk2V252V0hLWjlPZnVrVFFyWHJlQy9odUp4WUtCVStxdm9vVXZtdGZn?=
 =?utf-8?B?bnlwaEdiWW43T0FKMXhRc1JWMkVKaW56YmMwUmVTUlN5d0xrMEJjS0ZVQTB6?=
 =?utf-8?B?TGdYL0RPaE8xWjJMNGwwc0p0RnlKOUd3aU5wZUJ6Qzd4Mll3alEwcjEzdkVO?=
 =?utf-8?B?OXBrcEE3NS9NOWdtTFUzUHNHeDFIbzFtVllhemtObTg3MHR2UDhCeGhjVkg2?=
 =?utf-8?B?ZVA3dzIyNXR1UWltQW9hSEY3MFJubUptNlFMM0k3VzJmNWZNMTZuTEpBZ25v?=
 =?utf-8?B?N25WSm9TSTR5aXdnRkZFcm9GUjFSU3hyamxhV2dQZ3A2T3FKZSsyOFphdHYz?=
 =?utf-8?B?M1VFWXFna1BvZm1xMjNjVzZrS3NwaGdnQU53dXVLK01INTRQeGR6c2xSci92?=
 =?utf-8?B?RFpDOE1ZVmtLbG1GdXdyamdBdTVUOXVNaHpLMHFBcm85Mm5NRm1wb1BaYy9U?=
 =?utf-8?B?L0R4UW9tUEkyS0Y5RTQxYmJzMVpiTU0xRWlxRkh5SGxzbVVyNE1JUTluN2ZZ?=
 =?utf-8?B?WDF4amlnUFdIbHYyTDk5RWNxeldDbnRGZVpPYmRuUU10bmVZMk0rOUc0N0lw?=
 =?utf-8?B?ME1WdVhNekU1dWxuQXd5U1JUbmNhY3JhbDdpNXFncjRjSk9HM0hGRVNPRjRi?=
 =?utf-8?Q?8p7LQVKOOnk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(4053099003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UWVYaG5CZzdHZm1HNzdudStCWGtCSER1b3d5SG9lLzNJQit0WEhnaVlDZDZt?=
 =?utf-8?B?UUhpNGFGcEJWQUN4WDlQREJqSnBtbE10WFdGL0ZkS1VXdmJOMlBGTFJFS2Fx?=
 =?utf-8?B?REpnb21xU2tQYVBQR2JkSUU1OHZ4TzZsbHRqNmFCMERxK0xCdVpxU3hNZGhY?=
 =?utf-8?B?YkU2T1VleGF1aFYyeGpjOWVxb1c2K3RONHA1dTRaV0dQK243TmlZU25qK053?=
 =?utf-8?B?N3RYekV0d0dKTm80RStKZDhYRUtMR2Z1b0UzTDhod0VIT3BGeDR6Q2dPN0RP?=
 =?utf-8?B?QVRKNVV5OVdYWXcvdjFhbXFrdVFIL0NJTlNwbkFadnhsa0RtdVF2eWZPcjZG?=
 =?utf-8?B?K0FDakc3bzFTcE9rY2J2L1htQU5SbndVSmJiangwZS9DNFo5Ym96bGw4MlNk?=
 =?utf-8?B?UlV1VE9yZW9udWtrYTVHYVIxdnNFWHgrYnlXYlVtYVJlZXZTaTBnMmoyVjdN?=
 =?utf-8?B?Y3FycDNnMW8wdDZ4a0MweTU5UWlsNkpZZWkweXlIKyt1UVdpQU1ISWlXdHNK?=
 =?utf-8?B?RW5ZMlNsUmR3RTIvNDEwa2NvOVBlREVKc1R3SGhDcWtXbmQvV0FiV2hOZG5J?=
 =?utf-8?B?YTdXUktIeWZ4ZTZsdW9CaHl1M3ErQ29ZRjFTc3Z3bGdMTldzbEE3bmtkZWNR?=
 =?utf-8?B?eU5ZU1hJNzNpTzJkeElQekFIU2luZDRSVnBzekpSb0MzNmVhZ0htdm5lZHpl?=
 =?utf-8?B?enowZWxlSmJCVFJ2OW5iS1NNMVVOSUp2bDkwbE1ic2ExMjY4dzBxbFZURTVs?=
 =?utf-8?B?YmlkYy9QelA1ZS8zRnRjOG9TVHljYlBXMXZlRzJUUHllVm5qK1BxMlNyTmM0?=
 =?utf-8?B?aDNmMUJhdWNuZU5lWElCTGJTWWhWMmVvVVIybk1BSytCOU5FaEhFOHZKNnY1?=
 =?utf-8?B?NTUzRTVUaFZBcE13cHhBRnZqeVBqaUhqNjJzVEY1RlV3aFV1ZzFWcitNOEkx?=
 =?utf-8?B?akl6ZlRwZkc1N1M1b1FRUm1mdHA2ZFByOHVQTnRwNmZSWVYxWXpXYnZJNW5a?=
 =?utf-8?B?Q2M3OHpGRG04K3pCSEx4bSs0SUtWR2xvQ0djQkRybmxsYzArQnZTZ1BvNStk?=
 =?utf-8?B?Q3lrVk9FV2V6UzNhZXE5S2NGWThtbHF2ZC8wWFJOQVROcnJXUXBoR1dURndO?=
 =?utf-8?B?MkNCa0tyblpGMGo3U0NCbXpVeWFKNjhCTnNjdlU0Z3ZiOU9HMVI5YWF5VG5z?=
 =?utf-8?B?aHEvSVErMDVlU0U1MVE3SG1KWEtyYTZpWVdkaHJlQ2YwVU5QTDIxV3dRZmJ5?=
 =?utf-8?B?ZnROVGx1K1BlZnNQZnBDTUlLR1A5S3R0ZlJYdWVlUko0OVZkdmpRRm5rbmxD?=
 =?utf-8?B?Nkp6QkFEVU84aGtJUklKVElwckczWGdwSG5CN1FBWmI0MG1WN2ZISEpRc1lr?=
 =?utf-8?B?R2VQZlduWEp0eU1neFNBcjZOYzBOb3dicFYwUTFPTVE5OTVzZVRWaTBweU1r?=
 =?utf-8?B?Q3JyUXpEdkxGTktPbnJORU4zWC9iZTJ5dGFSWGhySFBwVy90cHVlZTVIS2du?=
 =?utf-8?B?WUdTbit3dlpWOVBWakNRKzRpUWRiNWU1MTA2eFZvQUZUTHQ5UnZTVFh4N1pG?=
 =?utf-8?B?VW5ZQTlDODNrcjZNMGo0aXJSbjVaYXFQTlJRemJuKytGSFRGTmVwRXZJL3pp?=
 =?utf-8?B?ZUphbE9OQ1I3K3JuOUVyTFRuSVo3L0VPZnNuUXRnZXRvcVh5Wnp2RnlPRTZq?=
 =?utf-8?B?MXVtU0M4Z0N2emRsc01TQ3JOMGZRVzl5Wk9lem5JMW45Y2ZHWmhKSkRZMnoy?=
 =?utf-8?B?YVQvbkk0Wk1IUmhyZFB2bTlWOW82anlLdEpLVTQ4N280aGxiZ2djMVFxZC9R?=
 =?utf-8?B?VWZUTUhGblRZZGVqWWVMdWIzRVBNL1AyVGVPQWlBaVZkbHdvN3dTcmZhdS8x?=
 =?utf-8?B?emE2NVZDTjlWRlVWRjBzSjNsR21Bem1uSWF4VlRDc2N2VVpUQWtaYW1xRWVo?=
 =?utf-8?B?bW8vcC9sUU96NndqbW91aVRLQTUwc0hYc1V0YWhNbDdKVE1keVMxa0FJbXRW?=
 =?utf-8?B?WG02OU83czJUUHJMR25YTi8vejljcXozMUYwRVhGL0FkTnhyOXIwS2lOU1lI?=
 =?utf-8?B?SHdWS3lDQzlIdGlMSC9NWDhaKysvZzY3elFISGMzbEYyQkVzL09YYU5tYkwx?=
 =?utf-8?B?L3NuM1FMd1RhM0o5TFI1bmN2Q1l3VFdTd0hOZlZubS80eDZUTDZIaXdlWGk4?=
 =?utf-8?B?ZkE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------HBL0Wx9kiXWPmXmh98z8xIzT"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 793f0fa8-4d8f-4ea2-35a6-08dd7cdff635
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 12:12:30.6570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sNDk/aAsjJMLCORBkatMdbr9T89b168Y4tOfB1dnYYAGyvorqg8R0radXqd/ay6UPC9w7zROrHg/1sMJGB/UiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6163
X-Authority-Analysis: v=2.4 cv=Ga0XnRXL c=1 sm=1 tr=0 ts=67ff9eb3 cx=c_pps a=tbUAc5YXJZE2aXMCunvlBA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NgoYpvdbvlAA:10 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=YqzwljCWHV2cZYy3lwcA:9 a=QEXdDO2ut3YA:10 a=S-JV1fTmrHgA:10 a=j2-svP0xy3wA:10 a=pkMzW2cF2ePL_6HmNXUA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 867sbHRbtNq6Ctk5w1fzVCBF7u6-XRV-
X-Proofpoint-ORIG-GUID: 867sbHRbtNq6Ctk5w1fzVCBF7u6-XRV-

--------------HBL0Wx9kiXWPmXmh98z8xIzT
Content-Type: multipart/mixed; boundary="------------BbPH0cLdrhweFjoe4zUEdCQ4";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Nishanth Menon <nm@ti.com>, Randolph Sapp <rs@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Darren Etheridge <detheridge@ti.com>
Message-ID: <4816c493-8e30-476a-9e97-dd29dbab19eb@imgtec.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
References: <20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com>
 <20250415-bxs-4-64-dts-v1-2-f7d3fa06625d@imgtec.com>
 <D97HVW413ESX.1EEP5D4O6HMOG@ti.com> <20250416112700.t3zqihsmn24jaiub@purse>
In-Reply-To: <20250416112700.t3zqihsmn24jaiub@purse>

--------------BbPH0cLdrhweFjoe4zUEdCQ4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 16/04/2025 12:27, Nishanth Menon wrote:
> On 15:29-20250415, Randolph Sapp wrote:
>> On Tue Apr 15, 2025 at 11:20 AM CDT, Matt Coster wrote:
>>> The J721S2 binding is based on the TI downstream binding in commit
>>> 54b0f2a00d92 ("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1=
]
>>> but with updated compatible strings.
>>>
>>> The clock[2] and power[3] indices were verified from docs, but the
>>> source of the interrupt index remains elusive.
>>>
>>
>> For future reference, interrupt maps are present in the TRM. "Table 6-=
89. GPU0
>> Hardware Requests" explicitly calls it out "GPU0 | GPU0_MISC_0_IRQ_0 |=

>> GIC500_SPI_IN_56 | COMPUTE_CLUSTER0 | GPU0 interrupt request". Subtrac=
t 32 from
>> that pin number to get the DT number.
>=20
> Now that the mystery is resolved, could we update the commit message?

Absolutely, I'll send a V2 shortly.

Cheers,
Matt

>>
>> That comment aside, this series seems fine to me.
>> Reviewed-by: Randolph Sapp <rs@ti.com>
>>
>>> [1]: https://urldefense.com/v3/__https://git.ti.com/cgit/ti-linux-ker=
nel/ti-linux-kernel__;!!KCwjcDI!y39eGiVNIkSgKr9rKR3oO-7kzxHNUBmRKuqRffQd1=
_TPpuYEAuBgmkmvSADjBNAs1XS9DDo$=20
>>> [2]: https://urldefense.com/v3/__https://downloads.ti.com/tisci/esd/l=
atest/5_soc_doc/j721s2/clocks.html__;!!KCwjcDI!y39eGiVNIkSgKr9rKR3oO-7kzx=
HNUBmRKuqRffQd1_TPpuYEAuBgmkmvSADjBNAsb0N9gDQ$=20
>>> [3]: https://urldefense.com/v3/__https://downloads.ti.com/tisci/esd/l=
atest/5_soc_doc/j721s2/devices.html__;!!KCwjcDI!y39eGiVNIkSgKr9rKR3oO-7kz=
xHNUBmRKuqRffQd1_TPpuYEAuBgmkmvSADjBNAsQJ1GE04$=20
>>>
>>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>>> ---
>>> This patch was previously sent as [DO NOT MERGE]:
>>> https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-18-eda62=
0c5865f@imgtec.com=20
>>> ---
>>>  arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/=
boot/dts/ti/k3-j721s2-main.dtsi
>>> index 92bf48fdbeba45ecca8c854db5f72fd3666239c5..a79ac41b2c1f51b7193e6=
133864428bd35a5e835 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>> @@ -2048,4 +2048,16 @@ watchdog8: watchdog@23f0000 {
>>>  		/* reserved for MAIN_R5F1_1 */
>>>  		status =3D "reserved";
>>>  	};
>>> +
>>> +	gpu: gpu@4e20000000 {
>>> +		compatible =3D "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue=
";
>>> +		reg =3D <0x4e 0x20000000 0x00 0x80000>;
>>> +		clocks =3D <&k3_clks 130 1>;
>>> +		clock-names =3D "core";
>>> +		interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>>> +		power-domains =3D <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
>>> +				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
>>> +		power-domain-names =3D "a", "b";
>>> +		dma-coherent;
>>> +	};
>>>  };
>>
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------BbPH0cLdrhweFjoe4zUEdCQ4--

--------------HBL0Wx9kiXWPmXmh98z8xIzT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ/+ergUDAAAAAAAKCRB5vBnz2d5qsNGU
AQC07h/z5n5Oscq/Ervc4savc7K5TwOSKSKiDrOEv/V6wgEAsOctGeqfErI6D8OSfroKafVTcu/L
EYLdRXBtcWU+VQY=
=iCSh
-----END PGP SIGNATURE-----

--------------HBL0Wx9kiXWPmXmh98z8xIzT--
