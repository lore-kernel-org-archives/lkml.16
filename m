Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2125.outbound.protection.outlook.com [40.107.20.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D848B1EB1AA;
	Mon, 26 May 2025 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748250559; cv=fail; b=ORQtF+B1IbuQdLTt+waxQqZFp3ImRAWIUSNcz4IQHIuICwQiL8g5F6f92Hv2PjO+NQnCxm9pTiazoVr3hi5gJsBWFGj+KkzhsI81bZqphxuSJTqjrzq2aY8x/l99btjGKfrpSO7U0Nzbrz1AKr7KymZPJXa/Fh4gnYjVl2bH9gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748250559; c=relaxed/simple;
	bh=YkxxkhJrPZQ/tnXiTvIWe6iQ1MVvLiG5Co6S5tx04x0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pzmxpIF39Q/OboDhH/xuDQbkorwf3vs153SR5lxddXLDi52sk8JWjy/kp4CDgAnlXTJXvMBPyyEFbrBcckn++vn4U+J46EIjSU30oTTJJtjWjTn0KtBur2D91s6guqkE6JR4Nhxn0unwbA9SCPNiytTo8LwRBXflOJN0yWWcq6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=OotwCqAK; arc=fail smtp.client-ip=40.107.20.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="OotwCqAK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XImp+Y/hCYCc+FXW1/Z7r9JcUas4FnqP5uYjlvi++fDbENE6EeZhse4BxOUG4y1xp7TEtv3W2zVuBephDAGw8YFbhYX7Gz6s6Fhe1pduytf/7mgI1q7Vh0s6yQM/TeNHAgpIkrcM4hmqaN8RtPPEdwUGGfrRvY92irFzY9iu8JfSxPacSEKPoSF7j8jb1ZpOnLm8x/IUtMefwHUmYjBy+hPzndyflu57Wqk1BNHDqb1sviMP9/zdOLPkzKfFP8TZh4B7SmYblDM4XPrkSxLYWnKTjzRJDmzq8rSQ7YNwGCBoeREWhY4mNca1uCGe3i2f9JoM/W8MTtiAH1fyn9IOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkxxkhJrPZQ/tnXiTvIWe6iQ1MVvLiG5Co6S5tx04x0=;
 b=jt3Lgi2Xfk3e/IOfrpE7C37lOZeeJIL21WLobO8kFkjS3VvvH00Z3erswgyYB3o2aUt9lh8uxFicpwo2cFEqbEfnsIE9mG3j4GaOALAyilL8Szl7JQWGTPNsKf0zh+I9bAY6/8tdaxh8Puzc1SXqHTXNR49ldmySdtwBelH4Gt0VOyz+HSy4ZfzTLZCB7nP6u9TGd8EoVUKNyl5PRBE0bjEnaWo7w89LtPOcowMjplEkK/4Y8e2E5XRHNt5BXRDfdejMKMW6IbnHKMctt/Cx3RE4bUE6NAqjR1d+2OYENAtRixTQMpqkVT3APNe8FFRzslsTdieL3F2dzJnlZXkBPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkxxkhJrPZQ/tnXiTvIWe6iQ1MVvLiG5Co6S5tx04x0=;
 b=OotwCqAKXlVlJ7QIPjCJFpQcu16wfH05JHeHNHxIelnZTvEqCL/y1fYhH0Oop9XQiSA98lQO/q5fb30YcvqkwKwqe0PgSUjhNSDq1EhhGgadtCVGU1QqoDNv4405yGarF+egTWCKirnI+pQbrFbqMaUBwQ4WfLv9vV4BsYKk03ycmr8ZG0ummu2BNOTOv6w8OJbLn51groccR5H8+jkU32uL4H4uEbCn12xD9cBERNey3mUizG6MEqeDNuB5FWMxQAKpdipJibuZcKJQMRIFN4feguGraWw/Ir0KRm3WNtW9DP+nb/2JZ6lF++qBkKRNhSROuJ//pTSHpUKDOh6KxQ==
Received: from AM0P195MB0257.EURP195.PROD.OUTLOOK.COM (2603:10a6:208:b7::25)
 by AM9P195MB1329.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 26 May
 2025 09:09:04 +0000
Received: from AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
 ([fe80::9b92:3cc:22b3:4c59]) by AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
 ([fe80::9b92:3cc:22b3:4c59%3]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 09:09:03 +0000
From: Christoph Stoidner <C.Stoidner@phytec.de>
To: Stefan Wahren <wahrenst@gmx.net>, Andrew Lunn <andrew@lunn.ch>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Thread-Topic: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Thread-Index: AQHbzJ5IkKiCUrqPH06p42f/+549BbPiDcKAgAJsSwCAAChcgA==
Date: Mon, 26 May 2025 09:09:03 +0000
Message-ID: <34a4441d4b4ed8db7cac585ce93ec2357738cc11.camel@phytec.de>
References: <20250524112315.695376-1-c.stoidner@phytec.de>
	 <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
	 <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
In-Reply-To: <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0P195MB0257:EE_|AM9P195MB1329:EE_
x-ms-office365-filtering-correlation-id: 52116976-06d1-4378-870f-08dd9c34f631
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K1ZRZWhnRHgvSy9rb3ZvZ2NaMDlCMlJhOW9xTit2cG14Ky9sNk05MmxXakZ6?=
 =?utf-8?B?RlpKVEg4YVJ6S2hwK2FDTk1SRkU4Zkx0UmxpN0dBenoyQ0pIQVhENTZCUlUv?=
 =?utf-8?B?T20vVlI1RE1nZzM1UVBzYTVXM09KZEpJbkMzOVYvU2cyZlNlRE82UmJkWkNz?=
 =?utf-8?B?Y2pMdzhwcVFUWXMwd3dKOXJlNkhiUFpNSmhCVXBNaTNrNU1Wams1VjA5U1Bu?=
 =?utf-8?B?K0RZcllETUN6aGY3VThkcndnYVBkQTQ2dVJsaG1mWGIxUlUrbkJWOWZUWHp5?=
 =?utf-8?B?WlFmVDRpTkhlVTI3eEd3bXZGaE8xR2JONXNnNU5PeGxZUzJLUWM5SERDcWZt?=
 =?utf-8?B?YnNPQ3ArOVZxa0FBUDB4SEpMTDJXbklXaEUvTUVFSmdpbm04SlZ4Z1V3dDhT?=
 =?utf-8?B?L3plSisxc2ZBQWJTVFZDb01XZ1J3eDMrVnAzL0t0dTFBK3A1K3MyeTlOcS9H?=
 =?utf-8?B?eEpNV29vb2VmaXk2Wm9PTGVjUlpCRncyZVYwbk1lVnMzQWkvZEsrcEtmbk93?=
 =?utf-8?B?TXlwOVM1ZkxFQW93eTd0Z0hzL0RsTHdwVGF5VHFMNVFzTGwrZzR3eElQbk0z?=
 =?utf-8?B?T3V5aHlzRlVYeUVINEFUM2FzYnM0QUR6alVsckNBN3g1NVpCUjI1NEc5WTgr?=
 =?utf-8?B?N1AyZWNwdEhtNGFxL2l1M2NiNEFRRHVpaGQ3ZWZmS3ZaMUluR0pVNWZoMGNI?=
 =?utf-8?B?U2k0RVlObFVaWCtDdEUxVUhUVktYL0xwOUVSRFFGV0RUOE12aDN0QTVtd09j?=
 =?utf-8?B?R21RcE9uSWNtMDhjQ1ZHWGlWaWluV1dSNnJWaHo0NEtIUUkyMUN0cWxVbnly?=
 =?utf-8?B?UmRGc3hOdVZzdW90ZWZ5MGFMWUtOSkNVMkh1eDJxVkJ0UmRHNG02YUxtTUdC?=
 =?utf-8?B?VlMwQ3luL09RcDJyRDlQRXJtRjg5T2FqZHZHd09NcTN1MEh6MUdONjlpd1ha?=
 =?utf-8?B?RUNLZGIrQUs3d3JTVEc5c21vWVBoR2U1TnJVM3hzdlhUa1pYR2Y0dkJjdER6?=
 =?utf-8?B?dUVncUIzSWMxbmI2aTRUMXFSVGZxSWFJOFhlL2JwSTRwSFN6c2JOY3ZVK0pP?=
 =?utf-8?B?YlprelN4ZjRpNit5RWpjMlVvUkVqdGc3Z2l1dVVvUmNLQ2hlVGhWTG5IeFl3?=
 =?utf-8?B?Z1pjWE1pc1FGa0NxTU5QckZpc3gzb3lBL01EZVF5SVZ3UG1HVXlkbUhkRlEz?=
 =?utf-8?B?bUJ5c1RKVllJOXZiK0YvRm9mcGJiMitWbUdYYThkbmh0R0pLdGgvZm5jU3FB?=
 =?utf-8?B?Z2k3MGhhSE9DMXY4ZDMyWTA0NFFZZy9MNmx5TG1JVlI5S3dZTWo4T2dXY1hu?=
 =?utf-8?B?TDljRnhMM1RJcWRMWTdCM0RuaVJDV1JJSUhUZnB1QzJmM3l4MCtBWFgyaFNW?=
 =?utf-8?B?SUVFbE15ZGwxdVpiNkxLZENUNm4vRi9OUVlXUE0yR3IwY1BpSGxNYVF2VzNm?=
 =?utf-8?B?WVVLZjF5enQzMzhDUUpIWjhCdEFad0s5L3RTNFEvRjF6TGdFZy9BKzV6a1F5?=
 =?utf-8?B?OUIvcWRmd1l6NTBvMWxhd0M2bVpKdkd1eTlWR2UyQ3lVTUdQZ3prOGxFQXlG?=
 =?utf-8?B?bFlhZmw1bmtCNTJnemQzeHV1Z0tuODYvWjhJbDgvY2o2WG12NE8zbk5IV2xl?=
 =?utf-8?B?dVU2ZldXd0pJK09mamhwMnl1a296QTcrbFhGZXBSS1A5dTA2TGJEa2lzUEpa?=
 =?utf-8?B?dHo3Rk5hUDBLdkhXSkRPTE1CYnI4VFlJbjFXa3g3RHdXYWROMUc1eUgwakRW?=
 =?utf-8?B?aGtsSXpLZkN5OWlYK3l4TUhVenpYRnBwWmppTTBaNlA4UG5ydEJxbDlQd01j?=
 =?utf-8?B?Z01XMTI0dWRmVVQ3dWQ4Uzc4M0NaaEZML3ZSVkRBR21sL0VrV3plby83MWpO?=
 =?utf-8?B?a1E1ZWw4VGlUaUpVcGNvcUNYdkZBdUZ6aEI5K29uV29IRy9pcjlPUVBhWnpi?=
 =?utf-8?B?a3RoY3FUZDdTdTNJenpxdjk4YXBZQ0hkRWZtYkdZRHVyR0ZPMzVVbnIwSEpv?=
 =?utf-8?Q?aHTJm7ugU7ZwPkeT0dLuqpexnmxpaw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P195MB0257.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkxFRnpScnJqVE9CTEJBbTFZSGVJV2hNdm5JQjJCcS8weFJHQ2tjNHBibXlQ?=
 =?utf-8?B?NzNpWWI0NFNUWHVwUGRHaWsvMDAxN3g4anVLL3gwbmRkYlhCOSs4NzNycVp6?=
 =?utf-8?B?emNXU2xnSjBDcjNya29uMWNDY0o0WXA2cFVuMGFjZ01xOEtmaEFQQTMxZ0Ji?=
 =?utf-8?B?TGplSkhlbEdGcHlBQS8valhyYnRMT3BWVjJ6UnVvaU1kNkh0RXpkTVp6OTJ2?=
 =?utf-8?B?bVdYYTNqUkdtaHd4TDVhZ3JHZTRxaXJtdnhOa0FQSEk0MVExM0hZMytqb2tw?=
 =?utf-8?B?YmIrV0dSRzRlamh1ZHdkeU9jclFFOHRMVit3YzlJZlN4elJ2cU9Iem5zSUpp?=
 =?utf-8?B?dmkxVHR2QVNWSGltTkx4N3MwM2pRVmN4VHZEeDkxbFIvQlQ5WlBYclZrYjE5?=
 =?utf-8?B?UHFmUWxXNHRRVU1sT3hmMFBCOU0zaUI2THlkWUt3N2pVRTBKV1Z6R3AxOU14?=
 =?utf-8?B?c2RqZC95L2RhN1p6UnhMTml6ZFZWL1IveFgySnBrbGZRU2w3VExFUHZid0NB?=
 =?utf-8?B?NXFtdW41OFdqSW83eUNJTFdKZ1pYbmEzWTFWdE9ZdTREQ2svaVE3cElqSmxZ?=
 =?utf-8?B?aDlqWWhmVHZCZnJZVzRpaDFRckwrbW91SGRCUDExQmQxMDlwdTNDKzZ5MVI3?=
 =?utf-8?B?RXRLQks3WnlyTHczd3VORGhIcEJaZFB0enFaT3FXbm1SRUZPU0RPenMvRmM1?=
 =?utf-8?B?YWt2ZFJ3UHZydndLZmp2MW00dGVjaklQdWxrSklCWjNxamtOZlhLcW41TW96?=
 =?utf-8?B?V1RCblAvNXNZb3cyN1J3dzdGaE1ubHdPdDNCZS8xMFpmZzBvMmZLaTRkZEdY?=
 =?utf-8?B?RUk2RjhSSzNRQ3JGUm1rOVZtRlNBUmFMekk4NnFzMFZtaGJ0d3U5VGxoU1Bi?=
 =?utf-8?B?d285RFU5d0UyVUFkZVAzZ0VLSnFuWk5TODlpTEUyeEpQc3Ira2ZueXRBelBz?=
 =?utf-8?B?VENnQ1lHM0NVdVdnMmhiYzFlcEhLcmF2UjZuQVpRek92OWVXYWltWnl6WS9I?=
 =?utf-8?B?Wi9CVk12YUdabEh4MlcyNXZTYTc5WWlIbHVaMHhudXZDRGFuRnExTU5nVk9E?=
 =?utf-8?B?bVl5RHhsZDR1T1dnaDluSzN5VjlBQ0NFL0lnRlZMcTA0dXF1dDJHN0lJSmkr?=
 =?utf-8?B?SGIwR0V2MHIyZTh4S0dZYTBCelNWMHhwbzlaWW1PUk9QWHV6SmFvOVQzK2w4?=
 =?utf-8?B?UWtTM2ZzUWhyMmoxTTB2TWI1OFlpZnZlTXlxUU1ic2J3c2NGZ0pKWWh0dnBu?=
 =?utf-8?B?Q212ZnprTWgwUkU5RHB0R0p1bVRQL0lzaWdITThsczQ1cW9PeUY2ODcxOXRY?=
 =?utf-8?B?QytWVXVXbnVsUmEveWt1MlVKV0dLM3lRVzl6NDdEcWc4aGUwa0g2V0hBbjJS?=
 =?utf-8?B?cXdxYlkvVnB5Z3R0amo5MXlVVkNFUVc5c2VjQlRORUZPVkw3QWJFT3o1dzJG?=
 =?utf-8?B?NVRTWlZLSE1odDQ4MjFDWlllMFRJRENlTHgvZzRhb1NuemFiT3pjcWw0MEs2?=
 =?utf-8?B?b05jMkFTdjNiYlowbVJhNEpaR284Sk84bVp5ZGNCVEh1VStPWGoyVWdXL0RF?=
 =?utf-8?B?OTU5K1d3N3FFQWtER0s5WkNSVjd0a05JWWZ1WmNlS1c5QmhWTHZHN1BZdWo3?=
 =?utf-8?B?czRHUHh5bklnVlJPZW55STlkRkUzeDZpUHFyTXliU1UzaVVnVllhNFlDbGxt?=
 =?utf-8?B?VmVkKzdpWWYySW1wM0tFK1VIUFp4eGdDMXYzVEZVQW9qYnNESGJjK2RmTkZL?=
 =?utf-8?B?N3d6aUpmL3FNWFVvOXdWRksvV2NaTUFCWHdFOVZHTDg2WC9za2tVMWhHeWlm?=
 =?utf-8?B?d3AwSHBLQTd2QlYrWXZqZ3NZMGduOXZkTmhINUh3NFAwem9Cbk5sOEtMU1JK?=
 =?utf-8?B?WlJWQWxZTW9Ta2dSRFQraFAyM0pXOXlyNTVlbzVWYVBMdXMwaEZjT1Bkb0xO?=
 =?utf-8?B?RHFGVTYya1lDSk1yL2RZbUpRM05PVkIyVmVneEtyNStudjljNDVuY2RZZGV6?=
 =?utf-8?B?amV2TEd5TmY5TG00NUY0clNmejVQb0pTTkMyRUxrWnpjYnpnMVkyNnZDSit4?=
 =?utf-8?B?UFp2Y1lXdjVuaGYyZS9YT2R2RlVEb1I3Q04waGxhQjR1NXVtL2M2akNNRGtM?=
 =?utf-8?Q?/0tarTZOYqatK1Zk2avKAww7c?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49809CDDB8D259408B1B121FFBD110DC@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 52116976-06d1-4378-870f-08dd9c34f631
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 09:09:03.8855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uBG2PEinH/y6Wmte2CX6u5l75SQ6/QM/cTgmJojw6I9xTHeTBm8e9KYFZKoNwAnfntoZLiJjNwyyZkjVBx5Nfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1329

SGkgU3RlZmFuLAoKT24gTW8sIDIwMjUtMDUtMjYgYXQgMDg6NDQgKzAyMDAsIFN0ZWZhbiBXYWhy
ZW4gd3JvdGU6Cj4gSGkgQW5kcmV3LAo+IGhpIENocmlzdG9waAo+IAo+IEFtIDI0LjA1LjI1IHVt
IDE5OjQ0IHNjaHJpZWIgQW5kcmV3IEx1bm46Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5My1waHljb3JlLXNvbS5kdHNpCj4gPiA+IGIvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMtcGh5Y29yZS1zb20uZHRzaQo+ID4gPiBpbmRl
eCA4OGMyNjU3YjUwZTYuLmI0ODEwOTdmMDhhNCAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMtcGh5Y29yZS1zb20uZHRzaQo+ID4gPiArKysgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5My1waHljb3JlLXNvbS5kdHNpCj4gPiA+
IEBAIC02OCw2ICs2OCw4IEBAIG1kaW86IG1kaW8gewo+ID4gPiDCoMKgIGV0aHBoeTE6IGV0aGVy
bmV0LXBoeUAxIHsKPiA+ID4gwqDCoCBjb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZWVlODAy
LjMtYzIyIjsKPiA+ID4gwqDCoCByZWcgPSA8MT47Cj4gPiA+ICsgcmVzZXQtZ3Bpb3MgPSA8Jmdw
aW80IDIzIEdQSU9fQUNUSVZFX0hJR0g+Owo+ID4gPiArIHJlc2V0LWFzc2VydC11cyA9IDwzMD47
Cj4gPiBJcyB0aGVyZSBhbnl0aGluZyBpbiB0aGUgZGF0YXNoZWV0IGFib3V0IG5lZWRpbmcgYSBk
ZWxheSBhZnRlciB0aGUKPiA+IHJlc2V0PyBUaGVyZSBpcyBhIERUIHByb3BlcnR5IGZvciB0aGlz
Ogo+ID4gCj4gPiDCoMKgIHJlc2V0LWRlYXNzZXJ0LXVzOgo+ID4gwqDCoMKgwqAgZGVzY3JpcHRp
b246Cj4gPiDCoMKgwqDCoMKgwqAgRGVsYXkgYWZ0ZXIgdGhlIHJlc2V0IHdhcyBkZWFzc2VydGVk
IGluIG1pY3Jvc2Vjb25kcy4gSWYKPiA+IMKgwqDCoMKgwqDCoCB0aGlzIHByb3BlcnR5IGlzIG1p
c3NpbmcgdGhlIGRlbGF5IHdpbGwgYmUgc2tpcHBlZC4KPiBpcyBpdCB0aGUgdGltZSB1bnRpbCB0
aGUgUEhZIGZpbmlzaGVkIGl0cyBwb3N0IHJlc2V0IHN0YWJpbGl6YXRpb24gCj4gKGRhdGFzaGVl
dCB0byBjYWxsIGl0IFQyICJyZXNldCB0byBTTUkgcmVhZHkiKT8KClRoZSBUMiAoIlBvc3QgcmVz
ZXQgc3RhYmlsaXphdGlvbiB0aW1lIikgaW4gdGhlIGRhdGFzaGVldCBpcyB0aGUgdGltZQoicHJp
b3IgdG8gTURDIHByZWFtYmxlIGZvciByZWdpc3RlciBhY2Nlc3MiLCB0aGF0IGlzIGRlZmluZWQg
d2l0aCAybXMuCkkgZGlkIG5vdCB1c2UgcmVzZXQtZGVhc3NlcnQtdXMgZm9yIGl0LCBiZWNhdXNl
IHRoZSBmaXJzdCByZWdpc3RlcsKgCmFjY2VzcyBkb2VzIGFueXdheSBvY2N1ciBtdWNoIGxhdGVy
IChJIG1lYXN1cmVkIDQwMDBtcykuCgpBbmQgd2UgaGF2ZSB0aGUgc2FtZSBmb3IgVDQsIHRoZSAi
UG9zdCBwb3dlci11cCBzdGFiaWxpemF0aW9uIHRpbWUiLsKgCkl0IGlzIGRlZmluZWQgd2l0aCBh
IHRpbWUgb2YgNTBtcyBhcyAicHJpb3IgdG8gTURDIHByZWFtYmxlIGZvcgpyZWdpc3RlciBhY2Nl
c3MiLiBCdXQgYWxzbyBoZXJlIHdlIGp1c3Qga25vdywgdGhlIHJlZ2lzdGVyIGFjY2VzcwpoYXBw
ZW5zIG11Y2jCoGxhdGVyIC0gYW5kIHRyZWF0ZWQgaXQgYXMgZW5vdWdoLgoKRm9ybWFsbHksIHRo
aXMgbWF5IGJlIHZhbGlkIHRvIHNwZWNpZnkgdGhlIDJtcyBhcyByZXNldC1kZWFzc2VydC11cy4g
CkJ1dCBzaW5jZSB0aGUgZmlyc3QgcmVnaXN0ZXIgYWNjZXNzIGlzIHNvIG11Y2ggbGF0ZXIsIEkg
dGhvdWdodCB3ZSBjYW4Kc2F2ZSB0aG9zZSAybXMuCgpBcmUgeW91IGZpbmUgd2l0aCB0aGF0PwoK
UmVnYXJkcywKQ2hyaXN0b3BoCgoKPiA+IAo+ID4gQW55d2F5Ogo+ID4gCj4gPiBSZXZpZXdlZC1i
eTogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPgo+ID4gCj4gPiDCoMKgwqDCoCBBbmRyZXcK
PiA+IAo+IAo=
