Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023104.outbound.protection.outlook.com [52.101.127.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A94E22126E;
	Thu, 24 Apr 2025 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489698; cv=fail; b=RgM6WveV+rJDWx0pyqMLmwEU298nLS4BNqVt+rimCAn9j8SG9RaOMq8CPKyVui4wwSkGD51e6SOuDNXXvXC93NynCZIFqaNGEz1rAs1l3P9A/iuR2ZfElq8qTk0OgDHKcd9fFvo8W+SeoY6seCywr/Q6RG+lvO4D1QJ8M+G2kno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489698; c=relaxed/simple;
	bh=QtdcQLJq70xOMbxZyg7ESgtWo3ZDpCBqJkqBqLaa0Jg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Uq9FrexEYKavJI1kVUZBogU5C/WL5qy2MWy5WvYTRn4Hd2iMPz9spC7rFb/VPh9vfskaYwHKLgLg3P3NZ50AcuGQCDkF+yHvClNSUGFmbDCGYQ5vta82e98vmloBe0118zrVJNv4atTaQN0vrulBe4BctLCQyxpUGTR8Z/C75RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com; spf=pass smtp.mailfrom=wesion.com; arc=fail smtp.client-ip=52.101.127.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wesion.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjIGliwJLZOKB8Z5LS5XL3uChMIVZRbRelrwabzspIdjYPXlk11dZZtKs0jPgU7s5llafxmE1I3Ff9PSTC++mV1+vyp5MAQ57/gUxMooGgWsb3cdeZYfMd/Vc85FWrzXI/W52qL5dx+AvPxyT/TEthU1z47B8kc8ZhzN7CkdfCZ/bD5VzwokKYBZrVYY4jxR4Kn7Fgrc2zV8GI9LbLnnfgbKv25w7RKe8drsprNysUeXdAVe8vXNEq+I189pqJV/d7m9lJKQ3c14+MEYwkOBbrXmkWa9Ro9TrXV9IJH+G1i5UCa1VaEyReTdaMAMUEQVwVd1kVQ8gERiCQhDJ+wjdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ndmCuTrlC7fkBhHk7WTEgHhAFtqjJX06fAu+SgDBbc=;
 b=xfwAb4x1GnlwZNJHaY58R+33Z3av1a6hm5iOGCd7OWaTd+3i1bvLS9vaV7CrWuCqkgFHK6IYO25irNMuDU98qiGyfJALFbblxhd1lIGmVd6HTEVWbqwJF43ljL5qRf7eMXetLDNcYlIAPi0A+hEZFmdQqtelxwuboSEgN2CVl+ef4VIUdgc05E2YEH7lOH2mL+Bt51N7XOa69s5Wi7AgGgVg1Ol4sVk7oqsY2yimDENP4L7WTHM1M5WLiDJ5YsM9GT/QiUC15hpfhYsjAg4u1tMqLB4gGLhAkRMdgk3Q/Ba015rlUhP2QSpF3s6l03tYIajQK22CYMSB4FkAAjkfQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from TYZPR03MB7001.apcprd03.prod.outlook.com (2603:1096:400:26a::14)
 by TY2PPFC1C818470.apcprd03.prod.outlook.com (2603:1096:408::9e8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Thu, 24 Apr
 2025 10:14:52 +0000
Received: from TYZPR03MB7001.apcprd03.prod.outlook.com
 ([fe80::78dd:5e68:1a9c:36c0]) by TYZPR03MB7001.apcprd03.prod.outlook.com
 ([fe80::78dd:5e68:1a9c:36c0%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 10:14:52 +0000
From: Jacobe Zang <jacobe.zang@wesion.com>
Date: Thu, 24 Apr 2025 18:14:40 +0800
Subject: [PATCH 1/3] arm64: dts: rockchip: Add bluetooth support to Khadas
 Edge2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-edge-v1-1-314aad01d9ab@wesion.com>
References: <20250424-edge-v1-0-314aad01d9ab@wesion.com>
In-Reply-To: <20250424-edge-v1-0-314aad01d9ab@wesion.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 nick@khadas.com, Jacobe Zang <jacobe.zang@wesion.com>, 
 Muhammed Efe Cetin <efectn@protonmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496;
 i=jacobe.zang@wesion.com; h=from:subject:message-id;
 bh=QtdcQLJq70xOMbxZyg7ESgtWo3ZDpCBqJkqBqLaa0Jg=;
 b=owGbwMvMwCXGEJfeJ5AmN4HxtFoSQwYXv9jOfq7v1yYG3dsaceTB18IH1rV8NyWzf95Sqtsw4
 b/dgwCzjlIWBjEuBlkxRRapZaJSEe68aVuXx3+DmcPKBDKEgYtTACayNoWR4e+sf2d+yDrqSl7q
 e/KA4c3OF/F+035tOvax5zpvmH8evyzDf9fH4UJdRmmVD54acUi0xz8QDuXk6v2xlvn5094YVgY
 BbgA=
X-Developer-Key: i=jacobe.zang@wesion.com; a=openpgp;
 fpr=1AA6151A58470D66B5A75FF6005E678E10661E90
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To TYZPR03MB7001.apcprd03.prod.outlook.com
 (2603:1096:400:26a::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7001:EE_|TY2PPFC1C818470:EE_
X-MS-Office365-Filtering-Correlation-Id: fcce8712-9b54-45a1-34d7-08dd8318da63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnhXMFVhMGl0cTRxeU43K0JpSEVvOGtpNjNOdHZJRHJ3aFZnMG1oZEhEV0Uw?=
 =?utf-8?B?cHJKc2svOXBVaHRjYjBDSGRuMUh6TWRMa1dhMzZILzA0N0RqanZ2MFRFSW0z?=
 =?utf-8?B?V2pBZUpTbXNDSlYrRzhQZWFuV2lLWkpIMWZlekJra1BnSTZDMGtsQVJNODg2?=
 =?utf-8?B?bGRiWkk3eVBBMk9TeWlCTG5DQXY4aStuWXM0Sy9aRmFYY2NsNGdQTklWT20z?=
 =?utf-8?B?ZEpiK2x5Ui9ZdkpYME9XVUpEMERWcy8xK2hjREFnbVpwZ1FtcU0zZ1dMYStu?=
 =?utf-8?B?ZlNoU1FVditCaThFL3Q4bm95V2l1bEQwTzlqUE5mM1Rpa2lQUGh5WkFRS01s?=
 =?utf-8?B?em5TaWtIWDQzY0U0V0wycUNPVloyaVFmR3JkUXZLZU05ZWF5UlpZU0xWcG1p?=
 =?utf-8?B?aEU5dlhUTTRHcWFBc3BvcUFSOE5BajA5bG5OOE83MVZLMGJnR2lNZGt2emxQ?=
 =?utf-8?B?eVVsRXhaRjhrK2F3REJFVnkxck1VQmNzVFBmMEsyYzBZOGNqd3NLUGFWaEp0?=
 =?utf-8?B?OE5mZ2UyK3RSVnBNRWpvMnR6QXpILy94amJwVy9PNzlvSFd2VThVZ0xGd3Bx?=
 =?utf-8?B?TU8zOExJaWdDaHovQ1pvQ21CbHc3UE9oZ1RTY3R6dXZXTUU1bGkwVGJZSFVI?=
 =?utf-8?B?cjhrdDZzbDZSa09pcElJUkhBVkd3MjBYNEFNWkVPaGlLOGQzUUZxdDB2TGVK?=
 =?utf-8?B?M3BzRTNDSUhBUkV6MVFEUmtYYnVmbXZ3U01uVXE0dmRLQStvaGlXdHN1NVZS?=
 =?utf-8?B?R3Z0Q3IrNmFoWjJ4aVk3NHF3cGtyQld2UEJnQW40c3lDYng0OUY1L0lodkxp?=
 =?utf-8?B?aXhjeFNZam9COXhDc3h5czdURkVSUFhzU0tqYnpvdmJuR0tQMnpkSGdMWlJz?=
 =?utf-8?B?eTR5Sk1QUGJTUlV6UFEwMUl2SnVwZEFwRUFDU1pUOTFWRGZ0Sm1ESldwVDJz?=
 =?utf-8?B?M2MzNGsrVkhGUkZQbzZST0JtSGxNU2JQU05lVitYYUoxMHpRN21ka3NHc1B0?=
 =?utf-8?B?U2NJQXJKMCt4UlBibk9mMXpjbVUvdFhzZ0RLdFRRY05qMlc0Q2xzV2tHNEV3?=
 =?utf-8?B?Y1NIY2dDdWZYZXlCTHZmVTYvMjhCRmZ1bWVPVWlHR2NGQ2svdU5FS2xMQzFK?=
 =?utf-8?B?bXdTTno3TUJsNHNFMWNQZndhTmVTdUpxd2ZFMXNkWjB6ZVhIQy9YOVFXVXN0?=
 =?utf-8?B?NUpvckw4TnFhcFA2NjFLWHYwbGJyU1I3SkxFcDM5YnpmMU9pbXluVFhWK2g0?=
 =?utf-8?B?ODl2T1JSaHRoenE4WGRkNW8xZmhheHpEQm5IbncrclcxbWJTSnhJaDRrWFFN?=
 =?utf-8?B?aXRMb2FUemtnNjJaYjJnT3hrYWJ2b2VoWFV1bHlza2hhVnM2dk4yQjlGM0sr?=
 =?utf-8?B?ZXFsNHNxakRVV2RUQ09keUZDQmVuS3h4dXNYTnZnSGx3YzMzbkY5L0hpZU1q?=
 =?utf-8?B?cmxPbW4zaTRGSGxIdlVGS0FiYU1aVGVCbEVBV0dOK1E3aGFOU0xBMy9iLzFV?=
 =?utf-8?B?MDBmTXVzRGptTDUvV3hLUjh6akk1WVd0UzZTazNGdmtrSjc2Mm03bkNTQjNr?=
 =?utf-8?B?dE93cUt3WG1KNnhpV2k2OEJMZDNRSkxaZUYwenpjRFVmZkZJSHh1MjFHODRF?=
 =?utf-8?B?b1B5bEdHd0t2RGpIRmRuZjdoUUd2WGJlTTlCaGh5SVNnVGtZT1F5VVBnZm1W?=
 =?utf-8?B?cXMvNkhtSWhjTW1rR1U1RStDUllNNmRGdUN2dUJiZmZiL2pYLzdmYjFES3dW?=
 =?utf-8?B?T2tTWUdTQlU0Z1VISzFqV0c0ekZreCtYT1l6eTBYQmNCV2U1NlZ1WGZ5dHRs?=
 =?utf-8?B?Zi9ZQVg2N0hnZXRydFBhMmtlcHpveDBUOVNMeHczYmlXTEFabTBnWCtkVnZq?=
 =?utf-8?B?cVMyc3ZGWUc0bjVTNFJjNWl2VEN5TzVkYzRWZCtqWVpiSE9QOEt5NStHN2FV?=
 =?utf-8?B?MmJrR3pKVVh4aEkzMlYrclp5Um9yYjFpTmQyaFZCdWt3bmxUbHRSNkI2b2Vy?=
 =?utf-8?B?M1czaDhtSFR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7001.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnRML2tqM0N0VG9GY1ZPb01yOFhsa2NjOVRBSjMyN05UU0htWE5UN1hnN0pu?=
 =?utf-8?B?VXUweHc0bUFJMGIvbWRKZ1BkT1BNV3hHYzZFK2p3MEVrUnJQdEVEeVFoMElF?=
 =?utf-8?B?ZzNNQlpYTDFZYUR0QnhwcWlyajhMWDdzYmpiNXBld1Q0WiswVWgybkRLZDRZ?=
 =?utf-8?B?S1NYVHpqUHNKYWh5WmxYSHlGYmhUY0tQSktmUU5QaWpwR01EejE0eENQT0ZX?=
 =?utf-8?B?UnptTWZyWXRoT1RrdE5ybG9BdnBtcGFiQXJwVFhNNjJvZjgwMGNKRTVRb0cy?=
 =?utf-8?B?ZWc4WFJKb1lBQVpzQ2dKK0RSZGtTUnpnTjkvaS9USmY4NXZReldKVUFEMWIw?=
 =?utf-8?B?SEIrbjl3Y1pjWkZiSjhHWWQxSmJqbnczSndINlZOeStLQkV2YkRrSmh2Qmwx?=
 =?utf-8?B?NWx2TVZpbjNRSUV4b1I1VENSb3F2VjZscks0b0krODRoMGFnVTd6VExRMm0x?=
 =?utf-8?B?ZEZ1aU1RRjFNcWJCS0tpZ3A1Z2swV1pnVWNlYXBiN09DaHBzaGZaN3N1Tnli?=
 =?utf-8?B?cklBSmJ4b1UyMFg2aUkyaW9HNVNYUnk5dHMwb0NJNmNheDhGcXpNSXE3Sjhx?=
 =?utf-8?B?ek55MWVTNkRselBZSFNaKzA2Q3pwMWN1TVhSRkJERVc1VEpZd2dONkdhTG9o?=
 =?utf-8?B?a0xBMGtYUm1SN1NSSml6aGxqZEtlQ2lRMzZaOU9jeFRQZUhPWnNNZ0RVOVlZ?=
 =?utf-8?B?Uk9jd2VLVU5DdkJQeUVCSmRBcTRJR283cCtweWdHVTdTRkFFc3dQczAybUFw?=
 =?utf-8?B?MU1UV3R5M1dST2NtNlhYeG96N1F2dEpxWktNNTFkR0RLUzhZWUZYYWkremtO?=
 =?utf-8?B?WlAwMml3SXNBZ2ZJd04ycituU3lhZUVyY3d5QWVycUlEb0JMdFlQdGhxSkVq?=
 =?utf-8?B?S1pxZFNvQVBWUGRtWTRvY09DWVdCOXlQVlo5YlBwOUYzMmRpRElET0Rxa2Fk?=
 =?utf-8?B?UHBKeFh3M2FPV2ZjbjlKTTlGWllkTmU3R0krR1RKaGdSemJQM2FxSmFGUWYv?=
 =?utf-8?B?NTNBNlNXckQrbVhCVVdreC9zOUxwS3hXR3VpM3hMNzVuTDVrYXViZFJIQlFr?=
 =?utf-8?B?cTNsbTVkZFIxSXdxV29BRHF5V1RPbmpFQjlBNkFTdGJrVXo4eTVadlJiWWpD?=
 =?utf-8?B?eENYZ3BqK0diL282ZXgwR0ZQeUpnNDkxYkVLZUNlOGl0Sko5YkVwUEhLN0sx?=
 =?utf-8?B?UE5ZdUZWTXFYVnBBZGN1TC9tbjJVd2h4bDBsSHowSWZ3VFZsWE9RRGkxdTFz?=
 =?utf-8?B?MEhtNTJCK3FhQVJPZjIrK2tYV1FKZ1hxUVI5QWJ1c3dKR3ZHZW1PMlo4ZDh3?=
 =?utf-8?B?Y0JWdWN1RGVRZlVMTWxpbUVqQWxtaGZvbzJIK0FmdjViRWQwd0Mra0RZVWtB?=
 =?utf-8?B?SkRqME1Mc1JZLzhSMTNCQy84OVpUZHBoN0JDaDdoQjlIYVVyeE5Zc3dZMEMy?=
 =?utf-8?B?QXN2aEF3aHA1c2I2T2hQbDBYemlpQ0tKenZKTC8vTVhvNDlSb3hPcG1TVWVI?=
 =?utf-8?B?TENpMVFLdytwb2d3ZlRDTEVPb2dNVXMvTVBaZFhtY3dzR3U0dGtJOWtUcys4?=
 =?utf-8?B?eGNRay9LenhBalRrNmFGckE3clVlTHBUOGl2SmJucThyRXk1OFBMWUtPTEda?=
 =?utf-8?B?aXBlK1ZYQTgySVJURGV2czdMaXBKTHp0em5oekp4S1FqeGZpWFE2alU3K0pY?=
 =?utf-8?B?cGF6RU5FY294RmlxS1krZWtYSjVhWUFPVHM1T2kvMDRCNDBUNTI5cExkejl6?=
 =?utf-8?B?aGhYRzVBUjNsOE5TTE45a0ZuTUlic1lZKzdnNDJrbm5JaTBMRERWMlhhZk9X?=
 =?utf-8?B?eWF6MTFkYUgxN3VnWHdlRTZvZHcyYjVUUzVrN2VhV2Q2SGZBSkV3QVJBUkJj?=
 =?utf-8?B?KzE2NENDNklicDhIT25jNGxiK3dHSk1hWGY4TzcxK3ArRFU5K3dJVXhzbTZu?=
 =?utf-8?B?QzlRUGdJK3BqSit2NVZ5VHA2eE9jbEdhdk9FSG9Fc3dkVXo4NkVUNVlKQ0Iw?=
 =?utf-8?B?THc4SzNZVHNqQ3IyV1o3ZGJ3UC90Mm9tZVlGU0tka1UvamkzOXhRNlE2RGhU?=
 =?utf-8?B?R2ZEUGs3Ky90aXoyN0o1SUh3OVQxTmlJWEpMbUpEN0Q1SE00YUNPZ1FwSk03?=
 =?utf-8?B?Y3dOcU0zT3BQUnovU3JuVHk4cDlwWG00Z0Z0c1ZwWXJ2ZEh6RTVvWlRidmpv?=
 =?utf-8?B?c2c9PQ==?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcce8712-9b54-45a1-34d7-08dd8318da63
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7001.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 10:14:52.3962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWAm3lPxXwMBiuLP/ZGLMwzNyA6bMg0NLoxlINS6CRwSmIxj6XC+qEuF+hWpSrLw6LYAL4RuA6DcIYvUO+o1sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFC1C818470

This commit adds the RTS signal, specifies the compatible Broadcom chip,
its clock source, interrupts, GPIOs for wakeup and shutdown, maximum speed,
pinctrl settings, and power supplies.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
index 88a5e822ed17..afa16aacee00 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
@@ -697,8 +697,24 @@ &uart2 {
 
 &uart9 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&uart9m2_xfer &uart9m2_ctsn>;
+	pinctrl-0 = <&uart9m2_xfer &uart9m2_ctsn &uart9m2_rtsn>;
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wakeup";
+		device-wakeup-gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
+		max-speed = <1500000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_wake_host_irq &bt_wake_pin &bt_reset_pin>;
+		vbat-supply = <&vcc_3v3_s3>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
 };
 
 &u2phy2 {

-- 
2.43.0

