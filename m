Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4585227C159;
	Tue, 22 Apr 2025 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338972; cv=fail; b=eRULqvYbijk1AWgFbmd5jIMBG3oWPzyGDrEfIk+3V/NRY27qZL8nqpw9Y5sSksORB6V7uhO5AlycUQtermGwE110b25v20jWklJBNm+9pBfcdSgxijKLbrsQh3ZU+/SAreAcJskRDsJA/VqojSnh+9H4tSM4krbXWnu4heW4ri0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338972; c=relaxed/simple;
	bh=Wp0oFWtpko5FoGE7zxTh7yI3A0+0+rXRuwGtvfMfoLs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WHiYNjz8XCmnpjnC33+wk5whIRzOdESBzJb5g2tc26q+WPiFJZQddZNk7Dfl4m8IO+3kLRZZCEpqguSCacqgz0ou4+JweMHhWqrFWNr5WxoI1Mp1ou4oyZUxSPWt2bIHf7Q92C1nFSlLDSLXcJuY/5JFfIqCuXY9kDg6mkIzXME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=w0ySqwqZ; dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b=oXWt4lS6; arc=fail smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="w0ySqwqZ";
	dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="oXWt4lS6"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MEeIIL021492;
	Tue, 22 Apr 2025 17:22:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=dk201812; bh=hs9oUkZ6f1j1fe+zFviWtzgOE
	l/Hbh7TVlOiFofU3JQ=; b=w0ySqwqZTEtqS0wBDFYkGgzZx7xjQr2IFS5K7lMeA
	5gD7e2ydcFRRx7SRUThAjGLbJbqkcCNg1K3yXKaLKT+gCRM2jiu17bXSju3xP4IU
	K8hh+EegfY0dVna+9MhAxBNoOJNzblC+Hj3NHC8HMKRrJfkMj7Wrdrq4/KL/xfd/
	5FzMZbLdBGRQcPs5kD5S1MmSdLS+6GkcDq0gmneJjsNhintdRt8lCStNNsHqqo6y
	coRjBLvDEWtk9KGTu5S9Bo447qw6D0i7K980e6+CcFp843Nm7azwKQZi/6l/RXeV
	y4Gcz0ghPWAvJ0nMzOKdVSq7pANi+CDqv95zvOJ16w30A==
Received: from lo2p265cu024.outbound.protection.outlook.com (mail-uksouthazlp17011030.outbound.protection.outlook.com [40.93.67.30])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 46423t1uy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 17:22:35 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlRRB48AP2NUNMwcOVRTWxQJYqoaXSV7co0N5V2NWYydytDsMT6JeNU08tAyXDumx3FDRRyCRbWCyPArXojmYWKZkBvcwmLwc/+if0ByUZfp14KOS4BVTomyFXCiv24+GcEoxfS5Tj8qjm0XLJoP1Bn13kwMUjzlprlXV+TzqbPaBRVnE1AXCbCD2WQ11pdvBFB/wK4hWmp1J3U/HXtQrIpDD3xRNJi6I8+yE5NbrUPvra9EeNpG532kSla919q35fVhsDOVM0hRMNGdH4MdrfxBofmolUNVELXXEEpOX6VjgyX9UMNm/Bjb9ms+zGe/wg/ih80+1aKrQbwlZhzvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hs9oUkZ6f1j1fe+zFviWtzgOEl/Hbh7TVlOiFofU3JQ=;
 b=DsZoDyOjJui6KpV3B3q6l5Wr4X479o0MBAITjCBUPpoRQwvKt8Y7cg0+jA61v0ipmtUQSdtkEaFt9HlUoggKf4Y44TMfDyRgSKfnFpKZ4kafpkqTqOa2iRUwTJrypEApnl4H8Syumhw8A0s72asWRA1fT8aJ7g4rvZgVGXLX6KLZ2yFeclb/jzGqi2vco0P8BRrcbzAujEbpgBspq9lNdDSVw4hhXzQFl4A+Q3d7XKQy/EyLJHeIIigZFUsuSwpcVktKwR3rplOJnjXV863902KIFWGcl9hsKYeU7C3ny3pq8VxaC4j845czrzf9RbBgDQQ8HyWqlHkAUzOqqRc6cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hs9oUkZ6f1j1fe+zFviWtzgOEl/Hbh7TVlOiFofU3JQ=;
 b=oXWt4lS6wFp3Opw9T+Bq44teAx+W2+eLk/mew4abXiDPNTmE5pymGTGunObtKdzdX0x0x+sUP8Nd5/vLQGNmrr7AMmVV4HMymLxtlgGuqCVw6RpoMgr04Lirt2oXOpMc3uUxb7owEEJI3cQvNxfEh+S7Sbke6sn9rwHd9olR/K4=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWXP265MB2600.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:89::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.36; Tue, 22 Apr 2025 16:22:33 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 16:22:33 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Nishanth Menon <nm@ti.com>, Randolph Sapp <rs@ti.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
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
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
Thread-Topic: [PATCH v2 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
Thread-Index: AQHbs6LA4h/bnAK5zUacHxkQPGcX6Q==
Date: Tue, 22 Apr 2025 16:22:33 +0000
Message-ID: <bbfc83a5-8de4-438a-8e14-b684b30143a0@imgtec.com>
References: <20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com>
 <20250417-bxs-4-64-dts-v2-2-9f8c09233114@imgtec.com>
 <8017c015-73aa-4807-a177-d5391e073981@ti.com>
 <D9CPY0IDAJSR.39JPPAXZAUNQE@ti.com> <20250422120420.iv2hbaf4ykqazvlx@bleak>
In-Reply-To: <20250422120420.iv2hbaf4ykqazvlx@bleak>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWXP265MB2600:EE_
x-ms-office365-filtering-correlation-id: c6141183-984d-4f01-51a5-08dd81b9e2db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018|4053099003;
x-microsoft-antispam-message-info:
 =?utf-8?B?N05ETWwxKy9GYzdTNnhHTzc5M2VINUMxaUk2QUNwa2hOL3hnZXZDeFU5V1pP?=
 =?utf-8?B?SDhQOTdOUll1VHpIRW5PamUvNVNScVNmQzlsd0hvY29OMmdCbnU0M1FQVk5S?=
 =?utf-8?B?RXBBSVlTMnJZZzJSa0RCRzU0TzRoWEhVeDZnb3FTRjd1SUZGcG1HNTBMVjlu?=
 =?utf-8?B?OU5KQWZVak90TTk1VW1GS1A4NTVST3l4cHM5RU1DVmE4MHpqUUJFRiswOGcr?=
 =?utf-8?B?dHJvTFFRYUM3d3VQdC94dWxDenVMS25vcEZrMlVNZ3hNZUZTamxKc0J3TkJT?=
 =?utf-8?B?VStaUXAzYjZIQzBPY0VkaitCWTB3WVF3SFZsbVUrbVhmRFFjM1hZSWhVQ2pO?=
 =?utf-8?B?ZTIwTzhsSmp2VS9nTFJGTFI4S1lWUWFDMTFWMWk4dHp3NHo4QXVLa2ZRcVd2?=
 =?utf-8?B?RDdIbW5PKzFORmFIR2NwMW1zR0FlYnpaQXJjeDNONFVpanp4cGJSK0Fhb01D?=
 =?utf-8?B?MWVJZWMvNFp4UXpsTTNWZUd6bXpPSUF6NlBJZHVEblRpcWwvSmI4VEtMWWgy?=
 =?utf-8?B?Ujk3NjZnd2V5SzdsWjhJV085LzJyTXJ3aDNiQjZIUC9DQUMxWEl6UVB3YzdV?=
 =?utf-8?B?ZHVNTUxqT2QzRTB4YWduRjlyU09zL0hPVjFJYUNRT2R6VEwydG02cmVTbU9U?=
 =?utf-8?B?OWRHUU1peEtHditzVEl3MTZsMjJmZjNkemlYZjVQMWhDRk94YXJzT0s0bnJp?=
 =?utf-8?B?KzcvOFlFZHcvRUZlbkQ4UHZyRVFHRzJ5RnZaeFNwUlBXM2doU1NQWHVOc1VG?=
 =?utf-8?B?Tm1DTXkrRldNV2Q2NGdoSXp3bG5ra3BhUVBFN1pmVi8xUlhaZ1p2b1E0WjVP?=
 =?utf-8?B?U2JWT01aQmNqUXBlNGhEMmlOL3dPRWlZcUJad3ZvcFVDbWRNaDJZOG1rYjNm?=
 =?utf-8?B?UGdQekNTQ21pQXlEdk1oRVcwQkdIU1ZkRUtCejBUZ2YxU201aWxpTy81UERD?=
 =?utf-8?B?MDFCTmQrZSt5TmlCRGhUbFZBcnB2YXNHanBSN3JndTJLZDdnMHFSZC9TWXc0?=
 =?utf-8?B?eEFRS2dFR1VZWUlxVFJha3JlNnVvU09rODk0R3FrWVBrbUNoaFM1bW1kSld6?=
 =?utf-8?B?WnlUMFdIcVRVQXhyNUdDTFlXOHMySVVNTkdQRTJnZHBCNk9KZ3k3UjF5TWhR?=
 =?utf-8?B?WVBJMlZoaVhSdlZWd0lrSjVHZDUzSWVPL3lTREgwSW9ZNVBnT3FGSGp3SGo2?=
 =?utf-8?B?a2ZhMjBJL3MwTm9rUlFPQlM3UHVXc3U4VVNha05EejBOT2dOQlFibkhPZnVI?=
 =?utf-8?B?SXdHWWg5NVZReFY3Z2FIbXJWcUpTTVM3UTl5MUtTYzZKVFlqOWNXQk5PWnZO?=
 =?utf-8?B?ZEh0cERjeEcrMjNPM2NZZW9DQWZvSG5TSnZIY09RbTVtUkxuOEVsakFiUXcx?=
 =?utf-8?B?YjZHQ1ArcUcySVdFMzJXQ2ZReE9uYkVpemJKRjFZN3FranRxYVAzcWlkSXhJ?=
 =?utf-8?B?b1lOYTkxcHk0aDZSekZHcU95dmlWOERkUmFic2FTQm5sNjQ3Q0kza1llS3FF?=
 =?utf-8?B?RTVEOEU5Wi9zdmZZbGo0T2FERFRtTElySUZNUU9MTkF3VW9FM3FFeGZ4YStU?=
 =?utf-8?B?V3NTdXlNWTZ5dDh3b3RuRjF2WFBzYytzQUhramdlWnQwcmRyeDNCczlzNFpH?=
 =?utf-8?B?SFdySVcrZHNGOWVaMTBBMTc4STcvY0VLZTBvVGp2ZGpva283NUcvN2Znc2dx?=
 =?utf-8?B?ZHdrakhSN0Y0czRDOFhra0h2bzdVVkNjN3IyVzVKS3k4ZGZoWGxlcWtBbzJS?=
 =?utf-8?B?c1RMcERMVkpaOXhmN1MwZ3ZxL2krcVNJZTAyN0VKYWsvdWlmOWdBcWsyaVJ0?=
 =?utf-8?B?OUtrMEh4eW15emZDV1pzZzRSN0EwOUdIS3pYM2hJbUN6VlhhSmY5bnJqeEdl?=
 =?utf-8?B?Y3d0WDlnZjEvSVR2Wkp6V3ZsYTFXU0FMSlNpbWtkK3N0Skc5ODM1OUpmWVYy?=
 =?utf-8?Q?7avi9wv0bu1K8hL0EjayuzqYwhrt9UEr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(4053099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UlJsUWZreFBOUzFFMnZmNzNSeEJvNG1BS0RuaXFIMHZsTnlWOVkyNng0Y1hV?=
 =?utf-8?B?d3RzVDVpeEdxZ0txTml6UFdWVTZMa01DNm9qaFYycmtOb28vT2JBME9uNGpa?=
 =?utf-8?B?Q05ray96M3NjUVBWaW1WUXNUQ2F4S3BncnZVdHRPR3BhOSt1YlNFaHVTZEdT?=
 =?utf-8?B?ZnRxWU1GbHQ1YVBSTlVSTXV2anVFVXNON29PY2Fza2o3bHBCMUhVNnptemtD?=
 =?utf-8?B?T0hwbUVNZTFCd1FrTEZ4K2lZWU5LWTNyU3VkUDRHSytyS1dUUXhjZStwbzlv?=
 =?utf-8?B?elRFdjlzaVYwUE5EelVjdDY5MExDQVMrT05yVDlRSFA1Mzhtb0djNVlEVENX?=
 =?utf-8?B?SWJ4NDk4Nm82YmJJU1F4V3NPeGgrYXRURHNmK3RsMGtxUWx6eENIS3U1V3BT?=
 =?utf-8?B?RnVBYzZ2cE80RHlkaWd5ZnpQWEIwaHlEM3ByM1grSkZVbnpScTNQMkQzOGpj?=
 =?utf-8?B?QXVyRllqd0dJS3ltdkF5dmdacEZnTmVsTEpiclhwckFiNmx4cUs2cXYvVWND?=
 =?utf-8?B?MnQxTXlRL1N4cFozRDZPWWxQTlA4aFU5ZFdlRFNqNW1nbnIrWXZlTFkzbGJU?=
 =?utf-8?B?YmhSMEJ2ZjJtRDlqck5OcURJbEZSYWN0RENCVkFUUWFkSHF4MWwrR2JEZDlC?=
 =?utf-8?B?ZFU1RmFYdnVVTEdsTkhFWTMwWGI0TU9WMXE1emQwd2o0b1JrTGkyKytMb2k3?=
 =?utf-8?B?ZnFtS3d1M3Y1YWpMdGNRYTNBeVc2R2FpdzN4TjNhOHhRUEhqcVZKUC9sdkNN?=
 =?utf-8?B?aG02MHV4SU1RRUFOS015NDVkQ0E1WWl5MWh1bG5GbW5QNUZENUYwSm1ranFw?=
 =?utf-8?B?OWZzS0wzSXZaUTlJSUZoUDVUbWZDTEN4c2pWamxBa1ZWKzB6aVg3cTV5TGFR?=
 =?utf-8?B?VUw0YkdUanFQTi9sRHM2QVdHY1lxZXUrNFkvMW4raTNBRGRWQ3BIVVRPWnhk?=
 =?utf-8?B?d0xZbTdCYkdSWXNLb01TazhvQ0xyTUJzNDZKMXJDL0V6cnpKWWtPRnI0ZGFo?=
 =?utf-8?B?V2ExOWNNSWdhazIwbVp2b0JQU2pwSWdLZk8yZU9TMHhqU1NqMUhYNmx3c2c2?=
 =?utf-8?B?M0pEYlV6RWFnTmRpVHkrV2czYlJCamxlMjJsdll0MHJqcHlXRkNLZTBiS2JM?=
 =?utf-8?B?Sms3QzdSRkVoemVWcmVWZW0xK255NGpwV3preFYwdWJsYVFVVzZ1ZVVHVXY2?=
 =?utf-8?B?YTdWUXJEamViOGhIVTQ4RXNJeGVJeE1tY1h4Vm53dS9LM3hheTcrL3pYWWRO?=
 =?utf-8?B?R1RZNUxpblhyUnJGZkFZbHlwZ0R6cUpObzFxTWNBTmMrZ1hveURhRDB4RTJT?=
 =?utf-8?B?RzlJVVJFa1o2dTAzRkVMTldIRVpRL2hTOWk4QThPRWhrMDRaa0tYbzNscjdt?=
 =?utf-8?B?WHgyenZmaG04Ukh6WjBJRXE0N0R6VC9KcjdabDBkcXdyY0lyVzVzZ3hCVGpL?=
 =?utf-8?B?UUFid2ZTMExuY3FhQi9BaE1IRXBKNUFDb2hMYy9xakpJZ1hwbVc1UEZJQWll?=
 =?utf-8?B?Uzh2TVFlc1UrY3NQcTJaQnBIbDMyM2U3eU9hekFQL0Z5N1RpTi9uNUIxTUht?=
 =?utf-8?B?Ukl0aHg2QkZKU0Q0N2Z4MElIY1Rwd0lSbFE2aGtNU1hSRnRjRUFHRXJjVlVD?=
 =?utf-8?B?ZzZUd3U4bmc5eWdLSXc5MDZFNmpySmZJdWlMdWxxbWxXR08vdDJvdXZPMHpD?=
 =?utf-8?B?QVlKMFgxMVIrN1FNcFoxNzY0SFBoZlBvaVpHU2ZjNmtVQkI4WTZPb3BBTU80?=
 =?utf-8?B?amFzdDhiWXN6M0Q4blJCclVVamI1M250MmdZVW9LTW5pei9hYldJTGlmbjVV?=
 =?utf-8?B?eGZYdU4xNE5sY0k3OXhidGg2RVNFd2psaWJWYVZsTDF1QkRobXcvRnlYWXlx?=
 =?utf-8?B?R0s1RWk5VHRKQmIwZXpQdldFZDlyNHdUYVVYM3U5SHppRmxVY3dFaTl3Wnl1?=
 =?utf-8?B?Yzc0cHBqZFVWQndtdWpUcVlkOE5WZjNDVUhueW9wQ1N1cldSbURZYUVyNFFn?=
 =?utf-8?B?V0xJSitkV294MkFMcSs1MEZYeVBWeHppSkN5YTVGT2xFTjgvR0haNnFQbXlU?=
 =?utf-8?B?T1ZVclJhdzNxL0djTTMrM3lzWlNkQVRXSG5uR0t0OHAwQkYvNUlyTC9Tczlt?=
 =?utf-8?B?dVFxa0c5dGxaTzNaL2Y0WHcvK2RPalFiTStrb05UUC84azVMbkVyTUtRRjM2?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------ikGSlreS0gne0RtPS8KdF9w7"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c6141183-984d-4f01-51a5-08dd81b9e2db
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 16:22:33.1373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1LxUkoviGQXHynU9S9Rihe8EhG785ZdWXXERQcCIhF3IZwTIe6/03jAeEpbiFYp3NK5ekGhm0hAgDOZrGs/K2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2600
X-Authority-Analysis: v=2.4 cv=L60dQ/T8 c=1 sm=1 tr=0 ts=6807c24c cx=c_pps a=cRjhvmALJ7+JJty0Yz2dHg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NgoYpvdbvlAA:10 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=G5A8kEF_0oIvq6442tMA:9 a=QEXdDO2ut3YA:10 a=S-JV1fTmrHgA:10 a=j2-svP0xy3wA:10 a=uLziLLcTiVRfofo_654A:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: HkkfAabhddJG2TQwfq4htZe9dnduqOdH
X-Proofpoint-GUID: HkkfAabhddJG2TQwfq4htZe9dnduqOdH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDEyMyBTYWx0ZWRfX4Ko4lq8c1G80 A+rJfkrU2/knc2Y0HwLsjEo1zcjZokNn3R16iYgz04FCK/qzKjIqcC9FblN4DJhIOwlj8EQ5GTc nyQoJJSZjLeUORFWql6GqcpVUcKjHYXsBC31N8EP1h6S8ufwYomhvuOT7CBQ/+ursmjZ5bYtv/U
 RPfxcHWpe3PmB1shwtXxeTjeK3Yje4J+DE/Csuu9R6vYtfdqeovXZp1+hBfPNgAc7HO7PJGpqDb fV6M92dAl+XqBjaYnvakwF7rYaqYOi4eixfSyFfBWOOaNBeh/zYFaBzwM8O0LpGrsQjOBIwUe9P dDwTslAMhpqf7LmfI5I7pIdOKJfgQo9Bv3pOJl+baAb6su2k7EVlht49PR5wOkdFM7INY63Q2XV
 ssg0cZMkR0DL+oRbphrpfAX4x1ZVgVYiLnM2FCRwOMy0GrZbncOeBge0VeR2/yhXWmgH3qw5

--------------ikGSlreS0gne0RtPS8KdF9w7
Content-Type: multipart/mixed; boundary="------------2e20lcVcQ6jYBvXWoa2fk3Ds";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Nishanth Menon <nm@ti.com>, Randolph Sapp <rs@ti.com>
Cc: "Kumar, Udit" <u-kumar1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Darren Etheridge <detheridge@ti.com>
Message-ID: <bbfc83a5-8de4-438a-8e14-b684b30143a0@imgtec.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
References: <20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com>
 <20250417-bxs-4-64-dts-v2-2-9f8c09233114@imgtec.com>
 <8017c015-73aa-4807-a177-d5391e073981@ti.com>
 <D9CPY0IDAJSR.39JPPAXZAUNQE@ti.com> <20250422120420.iv2hbaf4ykqazvlx@bleak>
In-Reply-To: <20250422120420.iv2hbaf4ykqazvlx@bleak>

--------------2e20lcVcQ6jYBvXWoa2fk3Ds
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22/04/2025 13:04, Nishanth Menon wrote:
> On 18:51-20250421, Randolph Sapp wrote:
>> On Sat Apr 19, 2025 at 11:15 AM CDT, Udit Kumar wrote:
>>> Hello Matt,
>>>
>>> On 4/17/2025 2:40 PM, Matt Coster wrote:
>>>> The J721S2 binding is based on the TI downstream binding in commit
>>>> 54b0f2a00d92 ("arm64: dts: ti: k3-j721s2-main: add gpu node") from [=
1]
>>>> but with updated compatible strings.
>>>
>>> Downstream kernel[1] sha 5657fc069e8b3 ("PENDING: arm64: dts: ti:=20
>>> k3-j721s2-main: add gpu node")
>>>
>>> also has assigned-clock-rates.
>>>
>>> Please check if gpu node needs assigned-rate too.
>>
>> If I remember correctly, J721S2 was one of the few platforms that actu=
ally
>> defaulted to 800MHz, so it may not be necessary for that platform spec=
ifically.
>> (I don't have a board to test this right now though. This very well ma=
y have
>> changed.) AM62 also defaults to the correct value, and that one I did =
manage to
>> verify.
>>
>> That being said, Udit is right, it's generally a good idea to explicit=
ly set the
>> clock speed for our devices. I know AM62P, for example, used to defaul=
t our
>> clock to the bus speed.
>>
>> At one point though this driver was experimenting with a DVFS mechanis=
m. Matt,
>> use of assigned-clocks shouldn't interfere with that assuming there is=
 no
>> defined opp-table, right? May be a good idea to set our usual 800 MHz =
for J721S2
>> and 500 MHz for AM625. This shouldn't require any binding related chan=
ges.
>>
>> On the topic of opp tables for the GPU, I did some testing on the prop=
rietary
>> driver a little while back. These devices do not support voltage scali=
ng and
>> simple frequency scaling saw a general decrease in performance and inc=
rease in
>> power draw for the usual utilization bursts a single application runni=
ng at 60
>> FPS generates. I have a feeling this will carry over to the open sourc=
e driver,
>> but we can always do additional testing if you are curious.
>>
>> - Randolph
>>
>>>> The clock[2] and power[3] indices were verified from HTML docs, whil=
e
>>>> the intterupt index comes from the TRM[4] (appendix
>>>> "J721S2_Appendix_20241106_Public.xlsx", "Interrupts (inputs)",
>>>> "GPU_BXS464_WRAP0_GPU_SS_0_OS_IRQ_OUT_0").
>>>
>>>> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
>>>> [2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/cloc=
ks.html
>>>> [3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devi=
ces.html
>>>> [4]: https://www.ti.com/lit/zip/spruj28 (revision E)
>>>>
>>>> Reviewed-by: Randolph Sapp <rs@ti.com>
>>>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>>>> ---
>>>> Changes in v2:
>>>> - Add interrupt reference details
>>>> - Add Randolph's Rb
>>>> - Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-2-f=
7d3fa06625d@imgtec.com=20
>>>>
>>>> This patch was previously sent as [DO NOT MERGE]:
>>>> https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-18-eda6=
20c5865f@imgtec.com=20
>>>> ---
>>>>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
>>>>   1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64=
/boot/dts/ti/k3-j721s2-main.dtsi
>>>> index 92bf48fdbeba45ecca8c854db5f72fd3666239c5..a79ac41b2c1f51b7193e=
6133864428bd35a5e835 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>>> @@ -2048,4 +2048,16 @@ watchdog8: watchdog@23f0000 {
>>>>   		/* reserved for MAIN_R5F1_1 */
>>>>   		status =3D "reserved";
>>>>   	};
>>>> +
>>>> +	gpu: gpu@4e20000000 {
>>>> +		compatible =3D "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogu=
e";
>>>> +		reg =3D <0x4e 0x20000000 0x00 0x80000>;
>>>> +		clocks =3D <&k3_clks 130 1>;
>=20
> On the basis of the above discussion, Matt,
> please add:
> assigned-clocks =3D <&k3_clks 130 1>;
> assigned-clock-rates =3D <800000000>;

As requested, I've sent a v3 with these properties added. I checked
using:

$ make CHECK_DTBS=3D1 ti/k3-am68-sk-base-board.dtb

Which reported no issues. Does this mean these properties are defined as
globally allowed somewhere, and that we will not need to add them
specifically to our bindings?

Cheers,
Matt

>=20
>>>> +		clock-names =3D "core";
>>>> +		interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>>>> +		power-domains =3D <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
>>>> +				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
>>>> +		power-domain-names =3D "a", "b";
>>>> +		dma-coherent;
>>>> +	};
>>>>   };
>>>>
>>
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------2e20lcVcQ6jYBvXWoa2fk3Ds--

--------------ikGSlreS0gne0RtPS8KdF9w7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaAfCSAUDAAAAAAAKCRB5vBnz2d5qsC3z
AQCvNTs61blYekjWOkqh65W9a/mgcrord9uHp2PQ2tErZAD/bcEUFANfhjiQIM3xDkB9kjEpHBqP
tTlfeaZ0zI3sYw4=
=LdmS
-----END PGP SIGNATURE-----

--------------ikGSlreS0gne0RtPS8KdF9w7--
