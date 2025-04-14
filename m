Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022115.outbound.protection.outlook.com [40.107.193.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618C61E1DEF;
	Mon, 14 Apr 2025 20:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.193.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744663911; cv=fail; b=UT/+2VqJXUhjz8sr/GzkuJClRb37fOLiNYbeI6iF8SyS7woVzLOa3MhxAzy8xUBZPIs+JoS9O086ueKTMODuuO5ONtkM+bBnK9VcATiAKDSOWZoRd4RNuXm95pc7lFfr40vb0QMc9bo2Nsg41uF1L+/nmbomvYpu3UEHQgK0dTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744663911; c=relaxed/simple;
	bh=12Q52nrofSiTPeolmLs8Iu1zj1jqxMKCc4I72YFxhX8=;
	h=Message-ID:Date:From:To:Subject:Content-Type:MIME-Version; b=e0JtfC6Pog47n1Hi/AVT18xYUmR25I5/FhwSv99G111q8j4nSTJ1UwHHeJoPLOkmGQQtnaAPGDQgGBueFQ5GoXTjdQV4+XodpiI+KjtDAS7UsaeVtPDrISIqsYFnQjI8QHkabKmZdJ+iKhm5yl9etIbhJPOL2vmD5+dxG0+bjfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=pv5t2c48; arc=fail smtp.client-ip=40.107.193.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="pv5t2c48"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivbvMzY9P1Fz9x+AYmVM1zcS416IsyoMb2juNo9rSOoSDd8smvl12uVR0wGG8prVZTMM1G1aiK1fgzS6Qu/Ha0YbDM2doGbFg4YgY/iVqY7wA2uhCEunCfKqoNiLowRv3za097UF8Hh9WJyAD2i67X3uizr0wjGUcIzKY/ur0eJvUd+ipeeJ46+hXBwtB4pbuoNQOT9AxAhMkWafggAWoq3uKwptGSTz4mxMdBUzP/KiwstUiVtUSlPes9Ll19o9o60zcti2GY7KFq+v6MeHHwx5HOTA0QmXdO8rTajg8wSb0DvgRwVCjWbp76WiaUOxEZYTTMssR7vu71YV/l0QoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+o/FlzSGHZ9o4QJJJInT2hQ6LZTL30pHJbRiEpQOqJM=;
 b=l3iRjyzlL0gHU3slImkataI00se+BQYiBo1JaBBOxb77M5DfLEE/hdqBGy2ETXv0ygVCFJq4mWy3OibIbTeEUQWnaJVgz6YFKWeE9ewHOy/nRI64+b0WhJWg3dpka/VuumegfWcaTDe8vJrVy2BJoz7uv3hmXn19D3QSNj4jDwvJbEXqEibaPOr93MoErSJa/vUW4bXKp/3ax4exPTUIBH0ZC5t4qfWdIyhrRnd08vzCxJsto0u9F8CnHnL5fhWom+7DOWjM9N1YZyoeo4pg7AXtyaDDvw4tD5DUXbQvBczvZ7YY00ufXIrvHcJ2O+yJXEwd/k34900V7RA95Yawmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+o/FlzSGHZ9o4QJJJInT2hQ6LZTL30pHJbRiEpQOqJM=;
 b=pv5t2c48cVX7G9jHYwor0PzQAJg8k2e12XgFpbzqIsoAHFnaumRPVZp4nm6ImjRxdhOlDhYDQklaNLqbjU+kGYCdEULyH6YL5kJ78Pl9mHSRLn/XUh083hqQNupfjKbZ2IfKub6nWgkDgL4S3fQA/cDIUyhtwH6Jc4MfiwKGeXQ0zrlwXIc3hmGhTohugtE1Xvw8uGLFFfpqFeU9/ZL5KVkiISwimIGH6Qui4ENsMZweKIndz447OGzqJzBhtIYltRk8ot2hQ+4cm0v6jEuwNvOQ2UjIbGWHSnBH/zVDeNhKtIVUAZpgwazvTQTSrqxNLUDisrZYykCDr3H+qPoKsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT3PR01MB8450.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:9f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 20:51:42 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%7]) with mapi id 15.20.8632.035; Mon, 14 Apr 2025
 20:51:41 +0000
Message-ID: <e30fec58-25c0-4de7-8d03-23c1f6a903a1@efficios.com>
Date: Mon, 14 Apr 2025 16:51:40 -0400
User-Agent: Mozilla Thunderbird
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
To: lttng-dev@lists.lttng.org, diamon-discuss@lists.linuxfoundation.org,
 linux-trace-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RELEASE] LTTng-UST 2.13.9 (Linux user-space tracer)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0021.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::8) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT3PR01MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4e2c99-d330-4d62-be99-08dd7b9628c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bURIQzZrZ3paZnZpUVgxT1hRSlpUOUVicU5pNlN3OGVSdEsvWEZxNXI0bVBH?=
 =?utf-8?B?OUV2MlBlaDdQNFBSWVNOSEQ5S0NsYVg0RU1qSzNycTVSMFRNTEhMZjdaaGho?=
 =?utf-8?B?WGxvWVBkcW1iS205YnF5UmQwaDJYTTJRTjFuaEUxMyt0cUovUjdhUnhKeVov?=
 =?utf-8?B?dVRWMkZoTmpaZG5sZnRUZXBNbGVuVnZpZzJ0a2hSTlNVQ3hObW45OTFrZHQ5?=
 =?utf-8?B?S3Q3ODc2NXdpc2o2NWJFN0s3blArcUZoMjdFeVRCOHZDcElhZ0t2M1JQKzZL?=
 =?utf-8?B?R1lkQTl5MElNNkRsbC8wM2JYY1lGbVFtTFNPbGIwQ2ZXK0UzQi9KZVlTSDND?=
 =?utf-8?B?T095WjFWYVJnUTkraEoxTlVYK2x6NWIraEV4QlBiQ0dINFAzcmN0bFh6WUFo?=
 =?utf-8?B?c1FGN0lrdzRvYnFoUTA4d1RFZW5kdVc3ZGxHVzZ5SThycHNnZno1VGZIWmVE?=
 =?utf-8?B?UVRGbG5qV3d3VC9kUS8xNkN4Snc3TnVKWW9QTVpDNS9MU0R0R0o1SkxtQVZ4?=
 =?utf-8?B?SGtRa1ZqZjRGaEhwTE1Jc293VGpxd29xNklaRFpHSWF0cGRlem1HWXdsWWtW?=
 =?utf-8?B?WG1hWnNhWmg2c1hFVUp3TzZTcHA5d0YyT1puSngwRHVlZWNRdElmNm5LTk1q?=
 =?utf-8?B?UU02VEo4QmVtZWViQkVLREMxejR4WkJsdjYrV0V0akpmNGlYT1ZXTDA4eGlW?=
 =?utf-8?B?d0xYSDNMRmlCNUJHMTlIRVBWNlljUXZjY0xLK1VJckVqbS90Vlk3Q29COWxH?=
 =?utf-8?B?R1ZocXNab1pxT0pLVWd1bVl4Q2tKVDljS1pEbGZtczhxV2NvL213MVBrTjNQ?=
 =?utf-8?B?cncrUW45TGdiVjRrOEV6VXl4WmJNcWp2SFFrNTFVckduem9ZUmh0QkwwSzlQ?=
 =?utf-8?B?SlgzQmExdEMxc2JaK0JuS2QvZDlnUGRyNHB5ZG9pQlRaaWU2OEV2aEFOaU13?=
 =?utf-8?B?VFMvU1BHSFZZaGc1ZEJDVFhsaStzVzVOdVJHSzNxTmpsTjVTT0RhNWsxcTEv?=
 =?utf-8?B?TnYycEk2Y3hvalM2MXNjV2ZxWnFTVkNPTit6cUlraFdoS1l0MWVzZnNxdk5Q?=
 =?utf-8?B?RG5sMmM5aExyRjVDQy84L3RMY0J0TFZGd3FMVXphL2QzZmRFYklHYVNVY2t0?=
 =?utf-8?B?eElNYmlQT2FmVHdJaDE0Vk5rbWt2bk5pMmthT3pWM1VDeWlDaE4rSUJiUzB2?=
 =?utf-8?B?ZStERzNYQ0MzQXljTE9BUkwrQkp4S1ZkUUpOTFVzdmhiMlc1enpUSDhuTnZS?=
 =?utf-8?B?bGF0eklOZmVXcUc3ZktvQ21hVnFtRmlXODVDazV4SjM4UXFndlVRcmx1U0Zm?=
 =?utf-8?B?TG5iSHpVcFR3Z2phZlBhMThqZDJZdk1pN29UZSsyaGY2K04xU0thOGNWZjNw?=
 =?utf-8?B?ZFhqS002MTZGTlRCelVuUlJBL3pETzZ5N2djVEVJNnZXd1loSGtXUCtuYnZB?=
 =?utf-8?B?K3pVSlZiMXk1eHgycDQvQ2pOSFFwQ05yckJ2L2FMNGVrYzZ4c1lsaHZ4OVpP?=
 =?utf-8?B?R2JlZG1mZUp4dFZJODF4M3puWkhWUXZpdmEvNnhuSi9MSlZVWmE2bzU2L2E0?=
 =?utf-8?B?NnBmWFR1ZGhRczBsNXhBOWx5QkRCTU1NWllQejY5THVIdngvRkVNUnlBNDdQ?=
 =?utf-8?B?RElyclZrRXZPdFArTUYvNmFtM0kzVWlvR2ZaNE83TEFKMkRTU0tyUUxhaGJv?=
 =?utf-8?B?dzNZdmxHSUJtRlgzMlZtcVlzdzZuZEpOcVRGTWlEWTVWSHdtRTVVRUhvZEoz?=
 =?utf-8?B?YmhZQWtkT013cUNGM3ZiUUhhdzBVQ1FiOGtuck1wQ1dNaFdzRkllUzdoVmoz?=
 =?utf-8?Q?TKBuT3QeTFVBL/jpH1F1w8+9lgbPR5dZnNtNI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGZmUTFDNlFjWmw1dHByMmxzMmhFVkZWZnE5SVp1dlBnNEpia1doVjZYRkRL?=
 =?utf-8?B?T1lxRE0xdDREY0o3V0ttVzh0cTRSYUxnaDVzb3MvN2o1N3pMK2ZuQzBBRXlv?=
 =?utf-8?B?M254RVQyWFc5QkRjTVh0dXFvcWJVYXg5OE1hZmIyWkNyQlg3V1p4elZPS2dZ?=
 =?utf-8?B?ck9LT2JiOXQvMlBQc1dGVEQ3WDlUcTJFODh4bkhkZU85TUZiR2RONGRYeFd0?=
 =?utf-8?B?c2o5ZVFLWXJ0SEttalNwZE9SNVkxSEpTaGFFdjJnM0pyK0huUzE4VVJpYXpZ?=
 =?utf-8?B?cVZHWjI2Sy9GVDNUTXJYbTU2aGhvN0QxaktKUlgvR2Z3ODJRbTF6aHZlUENv?=
 =?utf-8?B?MER4L1lnTk42NlRZWHpNeE9qeVNmYVdtaElBelRPa3NrZzNtSUdNcHUzWTBk?=
 =?utf-8?B?c0RYcGdGNndlK0RsOEZSejBVVXcyam1jYUEzWHZzRzBQRHBvRXJHV0NVMEtG?=
 =?utf-8?B?QStscnk4RW1zQ2hHNTBOU0l3TkVwYXBtYnVEL1JYZDczUGNvWWFQcndkRUQ3?=
 =?utf-8?B?MlpKRlErRC85NjE3Ly9POHJGRzgzQjV3ZFdDRWlDcmlZaEZnVUl4ekM3dnV6?=
 =?utf-8?B?VXVJdzMzVGROeVN2blE0Zlo4YnI4ZWFSK1U1WnNtajJOOHd3Nm1Pd1Y3SlBp?=
 =?utf-8?B?RXMrdXJEMjhYNmtKRWlyTWplNWdzbHdQUmhnR2lvTnpETkxXMS9tNnJqSTRn?=
 =?utf-8?B?ckRhTVQyNHc5WGxGZlVydVV2cCtCTFpvY2xrb3dqb3pDdnQxZ3E2aVVpSFNC?=
 =?utf-8?B?Zm9SSFBYbXNqcm41UFQvVFdWcE9xcWFNdWJDNDVDNjU0ejVqTk5Ob2NZMXFF?=
 =?utf-8?B?cVc3TlFNeHJ4eG9IK29zQUxwVm9RdEMyQlR3blpjMWRka2tqYnJNZzVROVp3?=
 =?utf-8?B?M0p3WmZJOGNUZE93V2sxRThEM0JJcG9EeTR6a1l6dWJjdVJsYW1lMlVTTTVN?=
 =?utf-8?B?S0tIamVQYjdrMHpVazJXRXd2KzR6VXN4N2M4Z3c0cFFBQWZyWHlHOFNzSGVE?=
 =?utf-8?B?QjZyTUVmUlpxVFZSc3BkNEgyNzkxUFpQZkttelVOSFJVMGNrd1pzT0FnK1RE?=
 =?utf-8?B?VUZRWG9yRFVFQXAyNHNvOERNbXZhNjdITUk1a0ZDS2JTSS9XNzV1eTFNcGlF?=
 =?utf-8?B?bUxqKzErdFZxbVVSa0lZQjNhc2x5VFBndlNkS2pYWkVhVHNMK3Y0akd4andV?=
 =?utf-8?B?TE51eWxZM1NkY0VIQzEvazFlM2FtK2pERXJrZ0hIcTh3b3pYTlJjSVhoMmpP?=
 =?utf-8?B?MCtERmpkVVdYS0k2RW5XQXBzTTVuVVprbmE2UVJrSjVYOVVjYXpBN3NYYUpG?=
 =?utf-8?B?amZOT1doZzBaVDIxYTJCNEZqKzdJanVTeDVDYUcwaElEK0JBN01FbjZ3UzVD?=
 =?utf-8?B?S2c2UVpBOW1EM2FUd0IvYmtEQUNnWjFnNEFhbWdkSmxjYmttVEFlaUdnSk50?=
 =?utf-8?B?dkJyb015YzQ5OGZqb05FTmtmKytQZmhMK1FFUENuNmVPMVlsRXRBS3N4VnZ0?=
 =?utf-8?B?dENsT3gxQkFCNmI3TVZVTE1Zck5haWpXNDZEVlZnU0FUUldURU9kMEpkL3Qz?=
 =?utf-8?B?WVV2aFBaVnF6TmR6Rlo4TjIrK3RLNkFVMExvbkp1YnZHYUE4TFdISktBQzIw?=
 =?utf-8?B?Nzk3bXNvYWJzbHErRVZsZSt4a21mVUhUMmxlaFl6TWpoU3NPU2tQVWcxTERl?=
 =?utf-8?B?TEZqemZsMlRQSG1FQWpCWGVwa0ZRRUZCc01hdzhWT1JRWCtWTmJmRmVIclNH?=
 =?utf-8?B?U050dUpuc0t6VklXQ1NQUnFJUklzZDBGSW81SVdUdHEyaUhzRE42eEJtNmhL?=
 =?utf-8?B?UHBWeXJoZWhGZHJGd2g4RFROdDB5cUV5TllPWFJYZkpNNm4xWW1KMHpnSjBT?=
 =?utf-8?B?NmVsZW1pa3kweEJDUkF5T0NUZXJHMmJwQ3N5MW5kRTBUVERRVEZEdWdOU3BR?=
 =?utf-8?B?czlBT1dBYXNpY1FYMHFHckVmR2VhSThycW1BWDhiNXdVbitKK1dmcmMwRU9W?=
 =?utf-8?B?eGMxd2p4OHdVNE9tODI5b0h6OHNDZUVjRU9rbzQ4d05CYWYrSnBBRW5mdllk?=
 =?utf-8?B?LzZ0U2pPTmJOUGQ0Mkt5MCtIV3FxYjNVOEw0cGhWc1p5L0lSalRUOE9hQ0RE?=
 =?utf-8?B?eEFhQkRjUFpFQTZFOXNmRDk1UkYvdyszeTRsMnhwMmYwZDc5RFo3dDRYOVN5?=
 =?utf-8?Q?BRxzHigzG00yLnBHHKv4nY0=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4e2c99-d330-4d62-be99-08dd7b9628c1
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 20:51:41.7195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GdFMe0A/Yx48fdm8rhSxWwehDnsy9CMRo4VMqCOQ4U1vfYpSfXZYCbWMYSzUbA5mbiVZbfc3Be66Zt5N4M+YAHLYOPkKySR8Fj4LbWTgJDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB8450

Hi,

This is a release announcement of LTTng-UST 2.13.9.

Noteworthy in this bug fix release:

* Use UATOMIC_HAS_ATOMIC_{BYTE,SHORT} to fix build against
   liburcu 0.15.2.

* Add a close_range declaration in the liblttng-ust-fd.so wrapper.

And other minor fixes, see the detailed change log below.

LTTng-UST, the Linux Trace Toolkit Next Generation Userspace Tracer,
is a low-overhead application tracer. The library "liblttng-ust" enables
tracing of applications and libraries.

* Detailed change log:

2025-04-14 (National Gardening Day) lttng-ust 2.13.9
         * Fix: Use UATOMIC_HAS_ATOMIC_{BYTE,SHORT} for counter atomics
         * Fix: lttng-ust-tp regex warnings
         * lttng-ust-java: Load lttng-ust-context-jni before other JNI libraries
         * doc/examples: set minimal CMake version to 3.5.0
         * Fix: Update `get_mempolicy` check to handle `EPERM`
         * Fix: Correct `numa_available` return code checks
         * Fix: test_benchmark: do not match "CPU(s) scaling MHz:"
         * Tests: Fix abi conflict test when building with clang
         * Fix: Build examples when rpath is stripped from in-build-tree libs
         * ust-fd: Add close_range declaration
         * docs: Correct GitHub URLs in lttng-ust.3
         * fix: handle EINTR correctly in get_cpu_mask_from_sysfs

Project website: https://lttng.org
Documentation: https://lttng.org/docs
Download link: https://lttng.org/download



-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

