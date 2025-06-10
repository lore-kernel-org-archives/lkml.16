Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0D61494D9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=156.147.23.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749517596; cv=fail; b=WLpmeTm3AIpv0kgEUrW8vjTGEbZgY0MuVkImwBkSwwuoelUiLAk9Ua1NIJMXdnNhdwceFDUIdrc2RauocNprKebnKeFLOLFFuoFeZs6p3RLH+fPnyF6yCF+Drz3m04IxzlwN1eXuW6oMNce2qG9Tce2f7cmosA64InZ78hHkTgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749517596; c=relaxed/simple;
	bh=kl+B0Ys0CUwz+4MwgppJgXq4kzQDfMcci89PwHeZjtg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BeYv6j3v/0A4KS5e9byxDgfYHp+YDN/JzGCvo25RcbNzLP/92KOvN3JtcLMXiAd3Y9bq5GcqGIlj38t9yMq/hWVjj/aNPX3sDdKCgCS7eJYZCD4MTbf6IaZ5XvU2n8ICIPCSczhuNY7elhilIKlwvlTVegn3FufOdwufYGfHrkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=fail smtp.client-ip=156.147.23.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.52 with ESMTP; 10 Jun 2025 09:36:30 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO sniperexo3.lge.com) (165.244.66.183)
	by 156.147.1.151 with ESMTP; 10 Jun 2025 09:36:30 +0900
X-Original-SENDERIP: 165.244.66.183
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO SE2P216CU007.outbound.protection.outlook.com) (40.93.138.29)
	by 165.244.66.183 with ESMTP; 10 Jun 2025 09:39:38 +0900
X-Original-SENDERIP: 40.93.138.29
X-Original-SENDERCOUNTRY: unknown
X-Original-MAILFROM: chanho.min@lge.com
X-Original-RCPTTO: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	soc@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xegq5YnqVC2/CDVTM/Etzor7Cw+ppmOHPwSV15xodQmHjVWJxzBIgVJL8V0X7YivI1V3fA+VmjbSoDwyrW1WoLscUD+URmn6kRsvwyUcEDanY+j4Ogh4JMiOIvtIdePlAyoCCg7gOXAoRN9lU4G6uCYJER0nDaFxdz/kZJr/EzKw2psSCvqxnYNiwVbz78ugK1ppCQ2qSRGxwUGy0BZ1E+kwe7vko7Y96gK4Ate9C3dmbI014IJqkNhikoGiBmqOzzQHM3MVwDeHSHsGylSNGygSEB0CFnPQscBw6lKpT7nEtYaBxKjgojdmKTZ3jQDKgf2fMdUPLC1ICdCaWEKnjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kl+B0Ys0CUwz+4MwgppJgXq4kzQDfMcci89PwHeZjtg=;
 b=vI35U+jdjorifglb7dWzxkrtyfn8QgCfQvNlMfHXLLG7FGRkHsDFAlvZk5hgI37eXN3UlbRRdXDcvNz6ek2eCBDMDNeO2NZBocQs/lJmVkiM3/XjfUHIy5JznSzdZr050GTTosYbnMxOV/AAMsRhpOZ0F89Ex7MZhG/lO4QtKb7LLKYy3ULXXQ0SzEBaz3jWaEY1Fbmv+ff1Y9bRr+CCuNnQ+mjM3pKESkbuVBRpW+NiyGHu5JkXRZmimxHZL2rtE8MyXNFwYESDstR9D75KNpvlc3MpZnjnV1MGLx2DgPkUsADit6sRWKKdz0O+spUh0n4q586I5LKTrUVri4Lk6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lge.com; dmarc=pass action=none header.from=lge.com; dkim=pass
 header.d=lge.com; arc=none
Received: from PUWP216MB2640.KORP216.PROD.OUTLOOK.COM (2603:1096:301:13b::13)
 by PU4P216MB1933.KORP216.PROD.OUTLOOK.COM (2603:1096:301:10b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 00:36:29 +0000
Received: from PUWP216MB2640.KORP216.PROD.OUTLOOK.COM
 ([fe80::cebe:6aad:6fa4:dbf9]) by PUWP216MB2640.KORP216.PROD.OUTLOOK.COM
 ([fe80::cebe:6aad:6fa4:dbf9%3]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 00:36:29 +0000
From: =?ks_c_5601-1987?B?uc7C+cijL8OlwNO/rLG4v/gvU1cgUGxhdGZvcm0ov6wpQWR2YW5j?=
 =?ks_c_5601-1987?Q?ed_OS_TP?= <chanho.min@lge.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, "soc@kernel.org" <soc@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	=?ks_c_5601-1987?B?wMywx8ijL1RQIExlYWRlci9TVyBQbGF0Zm9ybSi/rClBZHZhbmNl?=
 =?ks_c_5601-1987?Q?d_OS_TP?= <gunho.lee@lge.com>
Subject: Re: [PATCH 0/2] arm64: dts: lg: DT cleanups
Thread-Topic: [PATCH 0/2] arm64: dts: lg: DT cleanups
Thread-Index: AQHb2YkuOxbca0O3J0e9Ys9P/v4zlrP7f/tF
Date: Tue, 10 Jun 2025 00:36:29 +0000
Message-ID:
 <PUWP216MB26405E1AB53BD624610247FF9C6BA@PUWP216MB2640.KORP216.PROD.OUTLOOK.COM>
References: <20250609-dt-lg-fixes-v1-0-e210e797c2d7@kernel.org>
In-Reply-To: <20250609-dt-lg-fixes-v1-0-e210e797c2d7@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lge.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUWP216MB2640:EE_|PU4P216MB1933:EE_
x-ms-office365-filtering-correlation-id: fbbe31af-c090-4aef-0006-08dda7b6d735
x-ld-processed: 5069cde4-642a-45c0-8094-d0c2dec10be3,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?ks_c_5601-1987?B?UUVvd29KNGRtU0Y5NEZ0VjV1U1BqSWlmSlBOZFhGbU1nS3hSNFBz?=
 =?ks_c_5601-1987?B?bTR6d2NlUU15V3FQMGVFcGExM0lJa0l6VG10ZmMveWtuOXpsL1J0?=
 =?ks_c_5601-1987?B?aCs4OHNlV1o0R2hiUUtMZ2hzSzZzVEV6N1ZRUDg4RnJocGRHRk9J?=
 =?ks_c_5601-1987?B?ejhPWUphS3lhVTZrWlcwWFhPMzYvZm5GZEpzdndsQjdDRko4MTZE?=
 =?ks_c_5601-1987?B?VDF6c2NTb20rOWF3K3FNZWp2WitKZDZZYVJtTmNYMVRVajFqd0F3?=
 =?ks_c_5601-1987?B?ekRWSmlxaUNDS1hNUUtTNzl4ekxRRmZkbGxRdU5LYzhsUkxCV1Ax?=
 =?ks_c_5601-1987?B?bEpwaisrSnA4c1pzVmZzZXp3YlRFM0JpV1lydGtXVGwxRDlPQ0xY?=
 =?ks_c_5601-1987?B?V3NzR1d0MEN0eFRnaHdxNnhZdW9DQ1Q3b2FXTS82MElIczlqWmJi?=
 =?ks_c_5601-1987?B?cC9aZXVKUDVsMW5QT09OTGthZ1ZVWnNXa2pDVTYvMWlxMXdYa1VG?=
 =?ks_c_5601-1987?B?dWEyM3BFU1pkcXl4NEhuOEJ4MFRoSFk1ZG41OFhNN1hJMHFwUjln?=
 =?ks_c_5601-1987?B?ckY3SXBtNXROdzRZNlpNMmpQVmowL1FWUS9taDZOWkJCUURYRVNL?=
 =?ks_c_5601-1987?B?T0ZVSEk1WldxUXVwTW1McGdyL0hEM1NtanAvTTA4bWxqUGVSbWRN?=
 =?ks_c_5601-1987?B?YjlhcEppSUpKUnR5ZTNacmkxTzZPRnpQY2pxelV4TzhkTnVZWHJL?=
 =?ks_c_5601-1987?B?c2dUanpIYm02L2hrWlNFd25BMVNvUDdOcDRmZnIzL1BXejd5czJ2?=
 =?ks_c_5601-1987?B?RkY0aktDNk1Dc2VqeEovdTJ6RGc4eE9NckhQVW1uZUJMVEpMWEZ2?=
 =?ks_c_5601-1987?B?andZRVV4V0F4Qmc4Vko5VENuWFh3WVJsSU1QZ2ExMUcwaFVGWlVl?=
 =?ks_c_5601-1987?B?dldNT2RzSVNISjVUd3dUaTRMQk9mMjQxVVk2WVFRbno2YVpYbENW?=
 =?ks_c_5601-1987?B?VlpEczR6UndONTVqSkNCbVFjakc3c08wclM1OVNxRkIvUnBHZ1Vi?=
 =?ks_c_5601-1987?B?akpBUEY0cURWR24xd1pudlUzMmZhbG1sNjBGZjVlNjFVNVgxcW0x?=
 =?ks_c_5601-1987?B?MDN2SWozellwU0ppM0NwNHlQemFaU0xTczVvZHBOTzhpdDM3SDNr?=
 =?ks_c_5601-1987?B?WHJPRUpxamlTd1RsVENsSzhYWjJ2UjZ4MGdxQlp5S3Z6eHhXL0Rz?=
 =?ks_c_5601-1987?B?NVc3dEpLMlZ5K01ES0RXM0k1OFZ0QkRSekk4ZlMwZHB4QVZJcko0?=
 =?ks_c_5601-1987?B?VUNWaWgyZnFoVUVGVWFJQUVQN1V2Z1BabEN0STV5bzdSc0dYQW1v?=
 =?ks_c_5601-1987?B?QjJ2ZGxuY3FzeXVqQ1Z2MzFnWVE0Zkt1dUIwdVQxTXhMWlNFVnlq?=
 =?ks_c_5601-1987?B?bnRCdUhxL2ZTRWw5d0ZUVThUTkJidnhTbitrd0V4ZUhaS05qcWhY?=
 =?ks_c_5601-1987?B?QmNqQTNUZUlxNUJkemYvTkFCQlhOZmxvNi9zdEUwQ0xaZGZneUpL?=
 =?ks_c_5601-1987?B?dXMyQ0JuczlENnJzWHRlZG9YSDhVc2xva01TVHlsQ3ZoSmpMZnhO?=
 =?ks_c_5601-1987?B?Y1JkeXpoSCtKWWxzVERSWTlCazEwTDVnVTBkaSt0Wlo5dFliT2dB?=
 =?ks_c_5601-1987?B?bCtPdERBNDhaTHU3VFpLRXMyYk56eDhTQ0hTdHZncU5panNHTnNJ?=
 =?ks_c_5601-1987?B?Rm5EcU1GY1hXK2YzNDJJRXd0cjF4QlQvRysrRERmR0lHOU5jRGdj?=
 =?ks_c_5601-1987?B?MnlDZ0UyQkhPTGtwZ0xhOE9Ubkp3d3ludDBuZDZzMUN1UGNpbitZ?=
 =?ks_c_5601-1987?B?b2VPZUJQVkJyZXBOeVVFcSsrT0cyS0x4VjZQWHBkU0FPMFBLNlB5?=
 =?ks_c_5601-1987?B?V0JDOEdMV3B1MFU0WEgvWkVkRFhlUGoyYUVKWjZicVRCODRuL3Vo?=
 =?ks_c_5601-1987?B?TkJxY05ob05IR0VFREJNV3hKUWNkRG93QVVLcUkwV3dxekFKVjM2?=
 =?ks_c_5601-1987?B?b1BaVnl6UUgya3NjajRBR3ZkbHpRYW5SQjlaUnpTQ25TMlM5THk0?=
 =?ks_c_5601-1987?B?c3U1NXE4ZDJCTXBpUFcyZTBIblYwSHBkSDlUOFFSek1kdStVdStJ?=
 =?ks_c_5601-1987?B?Tk1qOTh1c3lmT09hbVdsNGhHOVlHbit1U0JFWWlxZzhGQ2RBajUx?=
 =?ks_c_5601-1987?B?YXBFdnFXcnB5cnF3ZWl5dXVtZG9zYUtzbXZObTNtR2JkM3NoNDlX?=
 =?ks_c_5601-1987?B?RU0xVmluM3c5V2x3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUWP216MB2640.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?ks_c_5601-1987?B?dWFoK2VoaEZ2TXkxWHBTY0dFQUdYaG85Z3IvdVZxRGlGRVdlbGxY?=
 =?ks_c_5601-1987?B?RXpkWTNLeUlxSXZwVHJxYXdGOEI0Q3FxWU9BL1R4bnBIUWFQRWJU?=
 =?ks_c_5601-1987?B?LzU1UHgwelI2eUZTMWl4Q1FZT0tiUEVGdFFjZmt6dldTdXFYOE1O?=
 =?ks_c_5601-1987?B?WjZhQ2x5RVpXc09PUGhGMitZWmd6bjRJVnNMVnY3QmI0UDA5czlQ?=
 =?ks_c_5601-1987?B?Wmg4ejFmWGluclpVTzJCVDd1bkdyVGE2aHVtdXROcmFLVnhUb0l4?=
 =?ks_c_5601-1987?B?Qk5LWGUvUVdodWU3QjVKKzVydklmS2o0MFAzMnAwb1NEVk82b1FT?=
 =?ks_c_5601-1987?B?S1dZS0QyT0lRWGJ6UFF0S1FGcTQ1amxYejlJNldNbVVQK1VNUW5o?=
 =?ks_c_5601-1987?B?aGY4WHVuaWNBM1hYR0dTbHZmOG40WDZZazJRcm5FbElCNFcrZHZN?=
 =?ks_c_5601-1987?B?cmpmRndyRTN3NWRlbzdRU3pvNXFmN1J6T1NZU2NrOE5PMHY2UFp6?=
 =?ks_c_5601-1987?B?d3BXaDgrQldRN2U2WWxvSHA1NVVxTGo3enMzNlJ3MnFjcWVOQmhk?=
 =?ks_c_5601-1987?B?TmlUTVl1ODAzOHdBWHhGRS83V1ZtM3R0Zk1mQ1JTbXFvUDF0UXZI?=
 =?ks_c_5601-1987?B?V0laUUxLTTdQUDhMY2RXaU5MUlkwbW9OdDIrd0RhdGdkVFFxQXBU?=
 =?ks_c_5601-1987?B?Qk1wZDF1L21oWlhJcFprTkhuNC9KSmNPOHArbkxVeEh4bkt0V2lW?=
 =?ks_c_5601-1987?B?K3luSFJmNWc3VWFwOWhsNTJuenNubXZWTkp3QnQvanphc3kvRFFi?=
 =?ks_c_5601-1987?B?RTFibVJHdVJINmZTSnhHMjBmeVZOdXFwRy9lUkc4dWFQN01MVlJq?=
 =?ks_c_5601-1987?B?UXowZnFjUjVzT1k2OC9CZEI5M1JmcmUrV082UnVjR3JzaHVBbGNm?=
 =?ks_c_5601-1987?B?M3JwWHl5UW5ZanQyMUFoY1YvSjhSS3lnY2k5ZkRIdDNEZE53TEtY?=
 =?ks_c_5601-1987?B?V3U0NW93amdSRzcxQkxtaytJYUZYeUk2b1AvOU5xSUVqOEd2L1dB?=
 =?ks_c_5601-1987?B?bWp3QWtscCtDdVZaNUIxUFlUajl6dllkU1VlNUw1Tks3S3Z5YUIw?=
 =?ks_c_5601-1987?B?U2Zya29pWkdDRGJlMVVON1hYbG9rb0JGUmZTc01LeE84cExGSGVt?=
 =?ks_c_5601-1987?B?NDhFSW56elVXdkVYQkhZUkdPUTdBaXdzenBZSTdKa05Ib2hpcjJB?=
 =?ks_c_5601-1987?B?bVBGNXQ0QmM2UjZ6V1JLM1BOazY1Ni81OE5rUi9heDRlN2FYRURK?=
 =?ks_c_5601-1987?B?NTdKTyt6UmRqZ3I3OFREOFp0TFJyd21uU3Rpb1JGOUp6ZFd6WGlh?=
 =?ks_c_5601-1987?B?SktDWEZUTFNEM3laZlBOSldIRThrMnp5NVFGVjZreDFTTFRLQ3lN?=
 =?ks_c_5601-1987?B?OU96UFRwSGtzdkZWMDl0c0t1R09ROWtYSEdUeGUxY2tNNXFvMFR3?=
 =?ks_c_5601-1987?B?RHdFd0E3bjVJWVRjei9vS0xSaEx0c05NbE1WVURMSDVGek5saWw4?=
 =?ks_c_5601-1987?B?c05mZjRJQXZIbENNaGlvZzdKdlk1STRoOEV2NjE2ekRoblR2MjNH?=
 =?ks_c_5601-1987?B?V0REZVpZQ1IzU0xkSkVuYUkzTEhQRzZzVUNUbng0VHQvRHE0ZVFm?=
 =?ks_c_5601-1987?B?c3Q4UGtzeXc4YWx0b2lidmxHVzRPZ3A0b2YxOFN0MHBIZFY4MXZX?=
 =?ks_c_5601-1987?B?NUxEeDRPdXE1aGFqTE15RWp5bENxV3Z6aTQxZU5SYnVOOTdrRUMw?=
 =?ks_c_5601-1987?B?ZjR2dEU4RjhOOENQdGp2dG9aYjBzeTZZQ1hGbVJJTGJaZG1SUGVu?=
 =?ks_c_5601-1987?B?am5YdnVrRlhEdE5LNENVYTdVZnNvV1owWU1aSVVUcmFLa2c4UXpS?=
 =?ks_c_5601-1987?B?TytsK0tjaTRnTytkVzRDWDF1RFNoUDlsZGZNamlCTjlWQlpjU0ZD?=
 =?ks_c_5601-1987?B?U1VHL0R1bVFIeXlDSE1ZUVN2M2taUnZjN3gvWkdaRENxOFZNNGJP?=
 =?ks_c_5601-1987?B?dEtsSHZwK1I0eHlsaGNMOHMwTEMyRjh6SXgzWWxpZURrOXlJLzlM?=
 =?ks_c_5601-1987?B?cWpvOS8veCtVWmRsd3EwMGRrLzNrZEloK1B2ZjhnZmFuenhPc2xL?=
 =?ks_c_5601-1987?B?NEFxN3lhRDRsaGZ5Rm9CN1dKLzBiVXJTbVRQTG1uY2VoTjV6V2ZX?=
 =?ks_c_5601-1987?B?Q25FVGp5d080TGJWWU1hdFFoTjlmZE8wQm1LN3NUTUNnMXpmQ3M5?=
 =?ks_c_5601-1987?B?dC9DbndQL2hjb1hvTUZrRjRYaEJnMXhwbXAvcVBSeC9ERnpGc0tZ?=
 =?ks_c_5601-1987?B?TkRDS0plOXZqdW0yblZ4ckFWU2lKS2dqQmFUbytLU01tU3ZEalJ3?=
 =?ks_c_5601-1987?Q?JddYcPdlH4FwSdkcU5z7KGJviB7BL7tpFFanobeM?=
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: lge.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUWP216MB2640.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbe31af-c090-4aef-0006-08dda7b6d735
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 00:36:29.2168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5069cde4-642a-45c0-8094-d0c2dec10be3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ME+CEMAnZidRSMZT/bdOXMCUwKuWlj2u030J6noXsBwWoGnwRSA4yFTCy6n1Ke7fVwe/4MfbKptkGWOQmxMTYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1933

PiBUaGlzIHNob3J0IHNlcmllcyBmaXhlcyBzb21lIGFybSxwbDAxMSBEVCBzY2hlbWEgd2Fybmlu
Z3MuIEkgbm90aWNlZA0KPiB0aGF0IHRoZSBsZzEzMTIgYW5kIGxnMTMxMyAuZHRzaSBmaWxlcyBh
cmUgYWxtb3N0IGlkZW50aWNhbCwgc28gSSd2ZQ0KPiByZWZhY3RvcmVkIHRoZW0gdG8gbWFrZSB0
aGUgZml4IG9uY2UgaW5zdGVhZCBvZiB0d2ljZS4NCg0KPiBBcm5kLCBZb3UgcHJvYmFibHkgbmVl
ZCB0byB0YWtlIHRoaXMgZGlyZWN0bHkgaWYgTEcgbWFpbnRhaW5lcnMgZG9uJ3QNCj4gcmVzcG9u
ZC4NCg0KQWNrZWQtYnk6IENoYW5obyBNaW4gPGNoYW5oby5taW5AbGdlLmNvbT4NCg0KVGhhbmtz
LA0KQ2hhbmhvDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCrq4
s70gu+e29zogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4NCrq4s70gs6/CpTog
MjAyNbPiIDa/+SAxMMDPIMitv+TAzyAwNjo1NA0Kud60wiC757b3OiBzb2NAa2VybmVsLm9yZzsg
uc7C+cijL8OlwNO/rLG4v/gvU1cgUGxhdGZvcm0ov6wpQWR2YW5jZWQgT1MgVFA7IEtyenlzenRv
ZiBLb3psb3dza2k7IENvbm9yIERvb2xleQ0KwvzBtjogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZw0Kwaa48TogW1BBVENIIDAvMl0gYXJtNjQ6IGR0czogbGc6IERUIGNsZWFu
dXBzDQoNClRoaXMgc2hvcnQgc2VyaWVzIGZpeGVzIHNvbWUgYXJtLHBsMDExIERUIHNjaGVtYSB3
YXJuaW5ncy4gSSBub3RpY2VkDQp0aGF0IHRoZSBsZzEzMTIgYW5kIGxnMTMxMyAuZHRzaSBmaWxl
cyBhcmUgYWxtb3N0IGlkZW50aWNhbCwgc28gSSd2ZQ0KcmVmYWN0b3JlZCB0aGVtIHRvIG1ha2Ug
dGhlIGZpeCBvbmNlIGluc3RlYWQgb2YgdHdpY2UuDQoNCkFybmQsIFlvdSBwcm9iYWJseSBuZWVk
IHRvIHRha2UgdGhpcyBkaXJlY3RseSBpZiBMRyBtYWludGFpbmVycyBkb24ndA0KcmVzcG9uZC4N
Cg0KU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4NCi0t
LQ0KUm9iIEhlcnJpbmcgKEFybSkgKDIpOg0KICAgICAgYXJtNjQ6IGR0czogbGc6IFJlZmFjdG9y
IGNvbW1vbiBMRzEzMTIgYW5kIExHMTMxMyBwYXJ0cw0KICAgICAgYXJtNjQ6IGR0czogbGc6IEFk
ZCBtaXNzaW5nIFBMMDExICJ1YXJ0Y2xrIg0KDQogYXJjaC9hcm02NC9ib290L2R0cy9sZy9sZzEz
MTIuZHRzaSAgICAgICAgICAgICAgICAgfCAzMjQgKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQogYXJj
aC9hcm02NC9ib290L2R0cy9sZy9sZzEzMTMuZHRzaSAgICAgICAgICAgICAgICAgfCAzMjQgKy0t
LS0tLS0tLS0tLS0tLS0tLS0tDQogLi4uL2FybTY0L2Jvb3QvZHRzL2xnL3tsZzEzMTIuZHRzaSA9
PiBsZzEzMXguZHRzaX0gfCAgMzUgKy0tDQogMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCA2NzIgZGVsZXRpb25zKC0pDQotLS0NCmJhc2UtY29tbWl0OiAxOTI3MmIzN2FhNGY4M2Nh
NTJiZGY5YzE2ZDVkODFiZGQxMzU0NDk0DQpjaGFuZ2UtaWQ6IDIwMjUwNjA5LWR0LWxnLWZpeGVz
LWFkMWY2NmUxYjUwNQ0KDQpCZXN0IHJlZ2FyZHMsDQotLQ0KUm9iIEhlcnJpbmcgKEFybSkgPHJv
YmhAa2VybmVsLm9yZz4NCg0K
