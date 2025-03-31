Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2121.outbound.protection.outlook.com [40.107.103.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2F324B26;
	Mon, 31 Mar 2025 06:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743400993; cv=fail; b=a/oG8xZpWwrpt9TV6dzzttWU0MlsUZEBtg8SWOz7mgBXjDFb3zJZuw2EtpkxHlOutGYo4zIT5JZpuVSmurnCWR7GkljI1qohPZqOcUyboPbs/0nTe0OhfIiokTQQP+KuTIRKPnxflo5DFYzWvTcTjlAbazIMZvSqj2OQkfKmP4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743400993; c=relaxed/simple;
	bh=Va5jgNu29Yv/iyb2r8JMq3uKCzVeFhEJDMo1ktVYYcU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c4lo4FWOZoerni/UV5Bh6DVR3kRVBSnLXHeXqH8ftwoN8IU9xVOKcIIE9RDFGn0gKC8gN7ds2MkCJJzW/3EtBRa9dUEDoU+2QaqivEetKyYvF1ggtH3LB7Rq80HlrDfhW8Q6T+3XEGRgAGDPAAuxGkMedN0UdgDLunCNObVa8Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=bUbzDclR; arc=fail smtp.client-ip=40.107.103.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="bUbzDclR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+T3tc7h/fiMI7NMIEZvilzNc7iQit57BhdU1FzlG16/A9H3D5FtdynSQ7HttWpsHd7gKaAzsLeFxcZGFn5V3Gsb7FWxkqDIx5rtEU+ZXVEjoaVgwJrXfJINICjUvBFJ092ZlA2TtUpKk5NS9kaVQpFGXu9qHChNtlpS1+nkBIU6Y/H8W27+Lepf/REY8Q+rLo3zCVuLeoI9qSxPmsjswPS2D7V3rcTdjZ/YpYynDulMfXQH10LXJCZ4BKitBm9pZ9WWSMM37tsFPGLUyobGeegBGGGboux5lFFkxJ2gGxmQHu+6mAF0Q+Vy80LhKOchaTvT/vrah63NnW2mNkg1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Va5jgNu29Yv/iyb2r8JMq3uKCzVeFhEJDMo1ktVYYcU=;
 b=eCIq8Ald9E4P7EpB/d337ENptVZsULpw+LYp/sh8HqhtgOmK14+vZSswqRQjnp5Dv7YX2BXYSu8e+RqXJwgYbg9PTSPtbAQcECxBOGYpXDChVbSM+lNeNimx7Q0d2K4InItQe8zXmsAUzXEa+5hP89WWLQENA1UjR472gSdUswqXPK2Z/KTqSgXZy0j0WMMYoPu9SknAFvhclDZt4zPTdgR90+C3/NO79YoGPMDsMdaAJYNLNG/cmTGnhtw1q7rWCyL8EuRUl18e1MpfgsSHMmNujPPet9TcOmXhjfRqrqZS7KDiXltq6Ss5zT1OEwB71uSfyfCIboW7SQQ/59vYPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Va5jgNu29Yv/iyb2r8JMq3uKCzVeFhEJDMo1ktVYYcU=;
 b=bUbzDclRexbzytgMjLPlw/rPPGFYBPkI25QRzZCDPyo4VhcUQGi/KCRjFGWYv0IkU0Cym7lLHTVhv3nsgQaxsrizeJ6Q+jFJpJUyxjnQKNh4EJm2+YO9Fx97IhWzfqLqBykWuo0AaAecHrotvBzyrM7vyBbR6LzqECF3GKg7+LqtR7nOcmfeAKSgGbXU6UsIeLDX/+N6ZMAUfBbtjIVwobSbuTcsskwdD6uzTCqYFrtyLTWz9ehui8/3sDGQx6EDSFF39WhW3ds6cVaUPyNLVQ4odqWypvEaOj0VstHsyjByFwnlWYuoIgwJcFhb6LtGyYdHrRMjUYzuap05lOD3WQ==
Received: from AM0P195MB0386.EURP195.PROD.OUTLOOK.COM (2603:10a6:208:b4::32)
 by AS8P195MB2213.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5bb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 06:03:05 +0000
Received: from AM0P195MB0386.EURP195.PROD.OUTLOOK.COM
 ([fe80::3f8f:9315:c279:d35f]) by AM0P195MB0386.EURP195.PROD.OUTLOOK.COM
 ([fe80::3f8f:9315:c279:d35f%6]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 06:03:05 +0000
From: Yannic Moog <Y.Moog@phytec.de>
To: "krzk@kernel.org" <krzk@kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: Benjamin Hahn <B.Hahn@phytec.de>, Yashwanth Varakala
	<Y.Varakala@phytec.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, Jan Remmet <J.Remmet@phytec.de>, Teresa Remmet
	<T.Remmet@phytec.de>
Subject: Re: [PATCH 1/3] dt-bindings: add imx8mp-libra-rdk-fpsc
Thread-Topic: [PATCH 1/3] dt-bindings: add imx8mp-libra-rdk-fpsc
Thread-Index: AQHbn+IXjghHnLXC/kS8W1MVDYh/QLOIkxSAgAQySQA=
Date: Mon, 31 Mar 2025 06:03:05 +0000
Message-ID: <4610469e0002796fb0de9feabd3fe328d5bf7aa9.camel@phytec.de>
References:
 <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
	 <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-1-28324c7f81fa@phytec.de>
	 <9a8635d8-631e-483f-9d31-33cf0bea7daf@kernel.org>
In-Reply-To: <9a8635d8-631e-483f-9d31-33cf0bea7daf@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0P195MB0386:EE_|AS8P195MB2213:EE_
x-ms-office365-filtering-correlation-id: acbbc23b-0387-4cc2-808d-08dd7019b3ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZFc5dnlZZk9qYmZYM01FRi9QaG1rTVV2cHFiV29Wa2R1Z2puR1IxVm1QNU01?=
 =?utf-8?B?aXdaMDA0aGJ5TkFNdUh0UEJhb0x1S01TRTdOeG5GS09rSjV3Z3VuMWRGcE55?=
 =?utf-8?B?czZCODdKYjFiYjg2QTVmK0dXRHNkSm52VmtCVHM5Uy9MQ1psZEcvMHI0ZTNO?=
 =?utf-8?B?SGpoTWNnbDcrNUxjWU91czR6K2FOU2dsR3ZocW5YU0F6UUl3cFFXVlZYSFlk?=
 =?utf-8?B?RVd3bHR5OHRMTGNFU0twVHpQVklFZzlNVmU4Rk1pN3BPQmRRb0JzZm8xMTZz?=
 =?utf-8?B?K21GcWVlVmR5MjAyUm1UTlY1Z0Z0TTJ6R3JiMnFkaDdROUMzQ2ZDMzE5VWhB?=
 =?utf-8?B?bjZ5cTFrSmh6NXEreW9RS0NkV2JtTTFMUXA1Q2E5dmlucFpvWk9DYWo5R1Zz?=
 =?utf-8?B?dFlTV05hTlNQTVNKZlB2RTdIY05lUi9hZHNFelFiRU1wN283dWlGTWtEemNX?=
 =?utf-8?B?UDRWZ2xMbk43MU51SmVJTG5FcDNseWhxaVJlSjRnZHcreXBpSk5ZWjdOdDB0?=
 =?utf-8?B?YWdadGgyaU5FUlhFdnRXNzVSTTBUc0JpNG82ZVBWMncwZzdnMjdBbXY2Rmt5?=
 =?utf-8?B?WlhHOTBDMVhpVE83dUZLZ2JCZmh6SzI2TkZyVFEwVXFvZ1hjYkd4eUp1cTBQ?=
 =?utf-8?B?MFJ0K2pwQ3psL3IzWGRXK1VsTXRNbzJrRndMNmpQMlg5OHRmMkZ5cjFFRU5n?=
 =?utf-8?B?WkZUcXFFd1FMYlluQXBEb0ZpZTdqQVBrYUE2ZlBGSlNXdGQxTUtwU1VGK0ky?=
 =?utf-8?B?NVpZTm4wTjhPVXVrcE90RU5XUk55MWswVytwSEhvS3hoQ2llT1h5WlRCRjlE?=
 =?utf-8?B?NWZ3R3Y4Y0RJWEJUTkxxbW15emJ2WU8wWVVsRzhVbkk5eWN4cnQ4Z3F2cUdi?=
 =?utf-8?B?emZqc0ZKQWVZVFdYMGVVeER1eTM5VnUzMzEyc2xobWFlWXdRKy9wNnhnQjdM?=
 =?utf-8?B?ek5pS3loMktQdzFRWmdLc1VUM2lQSG9HTEFrUTF5Q0lNYkJqTjFmdU1pVzdM?=
 =?utf-8?B?R1VyWHU3eTRZTG16dUlBVXU5d05wTHljM2xSQm1veVUrUUprYlhMV2NySVBC?=
 =?utf-8?B?bEFXMnRNanZpSjhNT0RTZHUvbjFVNWNCeUdnK2J1UjB5NEd3cTE5V0N2OGs5?=
 =?utf-8?B?SkEvOFh5blNpRjNtejExRUJsTURCYkR4RVdkWTZUZHk4aGJqMnVqdkhSMCtM?=
 =?utf-8?B?S25qMzVxMHZYUG5OWFVaQ0RUb09EZ05Gdk8vN0picE5BTFVRb0twelNuVDBS?=
 =?utf-8?B?S3drRUxoZmgwakxGYnVxb1JNQVUvT2V0WkwxTEs1WnYxYWExbk1yVElvQWN4?=
 =?utf-8?B?ZUZ4V0ZCL3d3b0EweVRKN0FsM3ZIUUhJbFFlYnpTdmgxbldhMGgxeWpqNmJG?=
 =?utf-8?B?aDl2YjE0YUd6TFJBTFZQR1dEbk5XdFlIV3JNRlh5cDgybHFRekdieDFxZlBv?=
 =?utf-8?B?NU5WeUdnekt4aTE0Z2p1OTJTWE9TWFk1U1ZMaHNncGZEQUFSTUNFOFQzS3Ru?=
 =?utf-8?B?SUxDMGloeHplWGJTc1lLdmUyOEY5TzJPMFVLa0VOdVVFbEJ6cmhPUzAyRy9v?=
 =?utf-8?B?VUpNOE1QbTBSRU5XUXBCeEE1TktDVjZHajVmM3FkaE5EMEpkOHUvQWEvVjdw?=
 =?utf-8?B?KzhpbitGMEFmNDFKeFdYQzJteTZwNnlxRCs1RmVtMTMxOEh1WHRjUXl3Uk1o?=
 =?utf-8?B?WnMzTWFqUC91RHo5RExEM3lSUkdpUWxxdUNXS0U5RDdxV0RWclFudDVZTkZt?=
 =?utf-8?B?Y1I0am8rNGoxTGViNGdCdy9nRmx4cDlWd0F0amY4eWhzU3liU2JDN1Jlc1gy?=
 =?utf-8?B?RWdNek1WUDc1S1haalg5MSsxc3VCaEdQNlg3enIybWU5ZVVDMmRrQktXQzkw?=
 =?utf-8?B?VGJza3FwTmwzZUx6THc1Vk1lMmExSmcwM2w4bVBkcGVPY1hSYlBGbGRQaVFB?=
 =?utf-8?Q?ZjECHhIbijX3lEWLHGhW1B/Wlmj6MyM9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P195MB0386.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y2xIckVuQzdMb3dnbk1DREdsWXQrU3RBNTJEVTJIWjdFSkVwUDVYbVFiK21R?=
 =?utf-8?B?eEpaZlNSMGVwQkxEZ0c5TXNzTStSQmU1V1VsWDVIanBXVk0rTGVNeEt0ZzFH?=
 =?utf-8?B?MzJuMmhlNmVnLzcyTTJzNk9NTWJudHZDZFc4V3FtNk9qVUcrbmJZNSthTlBu?=
 =?utf-8?B?MGVWVjRSaTFPY2UzSDN4Yi9NckI3dEJyOHBSaGdwZU5oMGxRUHc4THhXT085?=
 =?utf-8?B?VTV0NlQzWjBKdUNpdjVLdEg2RjUwR2MzN2l2NFhlQjZ6dnAxSm5iQ3kxaGh3?=
 =?utf-8?B?UFpvRnNRT0ovVk8vekFXaUtxVzYxRXA4V3ZoUytmeGlLemhCSjI1WGVMU0FS?=
 =?utf-8?B?UThEYkJBTndTQk42Nk5KeERtTVBRczRTSHFHRGhCRlhyeTgwUy9Rc3NjTWdw?=
 =?utf-8?B?czFNQkxWWEM3cXZnV1cxWUNja0hHejJtLzJHaFl5ZDdwTjBVUlZaZ0hEWjJw?=
 =?utf-8?B?akhONUpTRklwV0FmTjdzeUFHOWdZRzRZWlVDNk5yZzc4R1g2dC81TCtHa3hy?=
 =?utf-8?B?aHBCUWx1QTVtaGt5aCtoVkt6djBkbDk2WnJvMVVUNnVUdG9WeTVSOGRaOTdo?=
 =?utf-8?B?Rk5WT0VVNlE5NXpVWGEyZ25oV1BUYlBqTDVrb3lFVytUSC8rOVNZK0F4b1NT?=
 =?utf-8?B?OTlhUmF5K1pJM1U5T2QvUGlKVzdNZ0puY2pzRTdzdlhUTDhiMjg2d0JTQjZD?=
 =?utf-8?B?Y3pBUEg4NnlWaTYvSmJRcEtlQ2dNTjhySzVYWkJ5UCtDcU53OURVUzRzaUMy?=
 =?utf-8?B?Mk5Xa3JCK2JwaVFkWkdjN2RWdlpWb256Q3RxR01XYjNOeS9JV1RiYXhBT1N5?=
 =?utf-8?B?czhrT0FsRlk2VUlqanRGcHpDUU1CeDV2ZmlCUmh2eVVCN3oybFdVUDNSNVZL?=
 =?utf-8?B?ZWNwOUxHaFlKZklHTCtFZUl2d1A3SFFCajlSSGd2cGZOU1liVmw1bnk2bkRC?=
 =?utf-8?B?bW9xZDMzdTFydWxlUUpnaGs0d1Jaa2lxSERTRVpNUnlOMHZ1SjNZUEp3VTNJ?=
 =?utf-8?B?Qm1xVGVmYmRRcmlHN0ZubUM1WDUwZnQ2bVZSdy8vNFVwRklxcmZDbG5VcXNN?=
 =?utf-8?B?ZGJsclAvQUdxMTc4MTJIR2pyM1g2ZmhZRUFWQnRoQm5JVEQ4NVd6QTRLRy9M?=
 =?utf-8?B?ZVIzVnNqRjFVSUQxNExVd043bjVkR0E1ZldVT2YvN0J5aG8wbVJ5NGxEamZo?=
 =?utf-8?B?NE9iYVBJaENVWFVOVnVLQUZhVVFHbHZZMDc5Z3ZGMUNuTHJMWFRBRG9ZdGhy?=
 =?utf-8?B?aDlweDQ0eUNva3cvZkFoSGxIY3l4NnNJWVRiWnE4aVlmWk5ERDRJWThrWmdI?=
 =?utf-8?B?RWphQ3h1aXJqS3l5L1FoTkErc1k2K3pWWjJaZHRYclk0T0dWa1U0ZlFaQ2RQ?=
 =?utf-8?B?MytCREMySks3OUp3U1ptdTl4TG1CdVlNK2hBeW5VVUlKZHo3TFN6eVViOHJC?=
 =?utf-8?B?NDdvV053NjZNaEl4K2JVb1V3bDZQWndjblIxQ1plelJzckpobGYranhlSE5t?=
 =?utf-8?B?ZTFEeWlFSDR2dUY1QlFZVzlmM3oxLzNBL3lSRGJUZFB0VEt1eVJ5RlhWZWZt?=
 =?utf-8?B?cDJXZVEzYmF1Wjkyd003eitMMWEzZVFoWWhTZEJUTE1mK2pYRE51aDZBRzZQ?=
 =?utf-8?B?ZVFWb0w0Z0llZHV4UXNjK1NYNWtaZkEvNG83Y3FleGNBVFdkbW0wbWplTGxH?=
 =?utf-8?B?ZnRPMHB5MUE5OEp6elErTndPZzhlQTJLYWx2bXlYNzFlU2QzQ2o3SGsrVVFt?=
 =?utf-8?B?dnRqYTVTZDRHT3JKemNqZHVUVG5CR25mTjUyeW8rTy9FOThCb1dlT2JiTTlk?=
 =?utf-8?B?dFZkSWRyalVMalV6ZitkODZXZDExTzQycE0xR04yMVVCMzhncXVUTWM3c3lC?=
 =?utf-8?B?Z0RMdVdPOEJvZTIyWFgxYUhINm5NeVh0dXF6VTk3aU1SMUs2YjdIVmpCRThN?=
 =?utf-8?B?NVdkV1FOU3JrdGkvRkFQQjlFRWRtOXUzQkh1TjkrZUswTlpWZ3Joa2kzQUtB?=
 =?utf-8?B?Vk5mdHN2UWt4U1RNdzFSK3AwbU9BTWtqNmx1dkFaTzRQbWpGQlhLNkFJK3RM?=
 =?utf-8?B?ZU1SRTN4ZTh6UUhOVFhGS0J6YkQ0V2hLRGtJNEtuYnNkSHdQWmFtOWphWmF1?=
 =?utf-8?Q?waeViMI5JAxQIfdKeRxez910t?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC075BCAF9F3B34E8312BF2C9FEF969B@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0P195MB0386.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: acbbc23b-0387-4cc2-808d-08dd7019b3ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 06:03:05.1117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nHtcPv2uLVqQ7iNDPDiQxUAWfh9BJnJvbe433llgE95qyx09kOVZHPMsl7SiR0q1TmtmxtvCLDi8WUnsOrW8dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2213

SGkgS3J6eXN6dG9mLA0KDQpPbiBGcmksIDIwMjUtMDMtMjggYXQgMTQ6NTggKzAxMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDI4LzAzLzIwMjUgMTQ6MDQsIFlhbm5pYyBNb29n
IHdyb3RlOg0KPiA+IGlteDhtcC1saWJyYS1yZGstZnBzYyBpcyBhIGRldmVsb3BtZW50IGJvYXJk
IGJhc2VkIG9uIHRoZSBwaHlDT1JFLWkuTVggOE0NCj4gPiBQbHVzIEZQU0MgU29NLiBBZGQgaXRz
IGRlc2NyaXB0aW9uIGFuZCBiaW5kaW5nLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFlhbm5p
YyBNb29nIDx5Lm1vb2dAcGh5dGVjLmRlPg0KPiA+IC0tLQ0KPiA+IMKgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mc2wueWFtbCB8IDcgKysrKysrKw0KPiA+IMKgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZzbC55YW1sDQo+ID4gYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZzbC55YW1sDQo+ID4gaW5kZXggMWI5MDg3MDk1
OGEyMmU0OTM1NWRkMWY5MzJiZjNkODRjZDg2NGI1Zi4uMjJmMDVlNjcwOWZkNjBiZWYxZDIyYTM3
OGNmMGJkNTcwOTA3NzRkNCAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2ZzbC55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9mc2wueWFtbA0KPiA+IEBAIC0xMTU2LDYgKzExNTYsMTMgQEAgcHJv
cGVydGllczoNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBrb250cm9uLGlteDht
cC1vc20tc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIyBLb250cm9uIGkuTVg4TVAgT1NN
LVMgU29NDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogZnNsLGlteDhtcA0KPiA+
IMKgDQo+ID4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogUEhZVEVDIHBoeUNPUkUtaS5NWDhN
UCBGUFNDIGJhc2VkIGJvYXJkcw0KPiA+ICvCoMKgwqDCoMKgwqDCoCBpdGVtczoNCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgIC0gZW51bToNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LSBwaHl0ZWMsaW14OG1wLWxpYnJhLXJkay1mcHNjwqAgIyBpLk1YIDhNIFBsdXMgTGlicmEgUkRL
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBwaHl0ZWMsaW14OG1wLXBoeWNvcmUt
ZnBzYyAjIHBoeUNPUkUtaS5NWCA4TSBQbHVzIEZQU0MNCj4gDQo+IEFuZCB0aGF0J3MgZGlmZmVy
ZW50IHRoYW4gZXhpc3RpbmcgcGh5Y29yZSBzb20/IFlvdSBoYXZlIGVudGlyZSBjb21taXQNCj4g
bXNnIHRvIGV4cGxhaW4gdGhhdC4NCg0KWWVzLCBpdCBpcyBkaWZmZXJlbnQgdG8gdGhlIGV4aXN0
aW5nIHBoeWNvcmUgc29tLg0KSSBleHBsYWluZWQgdGhlIGRpZmZlcmVuY2VzIGluIHRoZSBzZWNv
bmQgcGF0Y2ggd2hpY2ggaW50cm9kdWNlcyB0aGUgZGV2aWNlIHRyZWVzLg0KV291bGQgeW91IGxp
a2UgbWUgdG8gYWxzbyBhZGQgdGhlIGV4cGxhbmF0aW9uIHRvIHRoaXMgcGF0Y2gsIG9yIG1vdmUg
aXQgaGVyZSBmcm9tIHRoZSBzZWNvbmQgcGF0Y2g/DQoNCllhbm5pYw0KDQo+IA0KPiBCZXN0IHJl
Z2FyZHMsDQo+IEtyenlzenRvZg0K
