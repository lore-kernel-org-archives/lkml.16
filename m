Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2127.outbound.protection.outlook.com [40.107.21.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E194189903;
	Mon,  5 May 2025 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437423; cv=fail; b=jlxVRAJKHPsQ+nHzRUJC90KWUdKcCI/Mr7W6HE5d2rNPY8r+tP6JWnCBynNQhWTpHUri+wbgwy1POzDNVMQ+4FDiG/iWoTlUj2VTFUqDGEglg244H9Mh8RkwlAAAu2ALXqC36pbDvTuVpIf7hILgEMu1RkmHW0baCYqYa4Z4B2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437423; c=relaxed/simple;
	bh=j2fEYterckXASYMI4oeC128vzKCigeWV5bZxaHPRr/Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ntoGhqVSKqc1+Z10ztAotoPvyIgrCpcWufyD7RKr2OZxzjhjErWsTdQq4x7eYOfRqoB8A+xMr7Komg1eKO4ZI+mgQ4rCh4SyrVwIHeL6vzCcDmZFcxs4URq8X/6craJ1cd8MhihMZmQOMnxTXNOw2rU7LTg/aKFcoA4tVjw2Dgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=YmJZVRGE; arc=fail smtp.client-ip=40.107.21.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="YmJZVRGE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIQyqb0tNXOVbwXO8SA7hdX91eBXF1EuM2tJPJ4IE3MfwrA9wxdpFIx2awo8OFJDUCy4atWQRiYpl9qOiGbQmncfp9mfaIM9tw0xz+8DVzHmrU/T3c2ZWOJHVr5zbBGws57OK3uHXN+S/x5YPVBO50ITNLLw2AerC6aJxC1ttTA+n3TSBVEF2/09XpmRVZW0O4kL8A8gNA3sz0nxwNMS+QPaG/ooGUzuO8OPBpBEMFycI1Srlv4q0UJymGqbwvIV/DhNwgLJzPOy1wGN4/5+vRXMdLuJRzXTgD96t3YBmBu6Ggu6mXmV2L1BaVg4sNMMMB5HkY2pCCsuVPYTh1xLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKJj6Fk1pWCewTYD77e7tsd5pwNJqI7emZo3ABJY0LY=;
 b=jL5Y2mVRTO2Q87N6lYWU/VnIbA/6unI1zE3ezOwEePMDIbRuT3c0Op/hvm3IAEo5nxAM4z8yh7JwyVT/dN1mCCNxVMfrOFbv1SdpT1n8RjdRyCAyqlBgI9v8Hp7Ccm5SvO162zVlxATmxZu4n+oNsLF7I9EJe8Z6s53duo3gKp9/81JZOuassqxag3wMUjnuqlXz9idpACJSr4ORj2YTjoOCWyNjStp9oyVAus4Uxl4JjmMeL8RQHSrF23nk/6cA9sDDJTjEx0xjRSElGVgUTzaU27ZOxOKG1u9RpRNc9voDwL+a3ilgsEPNjayceeaubaskA/KvdHm7mXKlN26poQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKJj6Fk1pWCewTYD77e7tsd5pwNJqI7emZo3ABJY0LY=;
 b=YmJZVRGEsT+kOiQtQKXRntCXIm2z77DpqAeB43Gv//nDCDXXdfnf0RmMUGRN+UAUX2ZtnBbYPIJMnBapTpfxSI5EEirDtufJRDslbsd3RY5yIesxBBuq0wkfGPKHTWF/xfiVLbXxKo+XRU37pIKg1D7OBalInUXt1h0Y8Jp/hhLFtHqwBBu7+OVrJ5QlFPiQ4TVGMcubFilhtHpVJdjrR6WLL6SxXqXFR58aD6bk34s9wo1/FLL62MYXse5VTrR+qKHsvUqU3h03j04wzRaV6Or3ru8zn0n0uPu3TnzsgCNFYMOTcy2G9+N99Z9dpd19e9xADR3ixxkUIhDBUd+WLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by PA2P195MB2494.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:40b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 09:30:18 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%4]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 09:30:18 +0000
Message-ID: <c09b4c9d-4665-4971-8cbd-7546d3bf46a9@phytec.de>
Date: Mon, 5 May 2025 11:30:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/11] arm64: dts: ti: k3-am62a-wakeup: Add R5F device
 node
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Markus Schneider-Pargmann
 <msp@baylibre.com>, Andrew Davis <afd@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502220325.3230653-1-jm@ti.com>
 <20250502220325.3230653-5-jm@ti.com>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250502220325.3230653-5-jm@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0123.namprd04.prod.outlook.com
 (2603:10b6:303:84::8) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|PA2P195MB2494:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2eb6f0-cd48-416a-4089-08dd8bb7732b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXdWNFZIaWdIOHZ5cmplb2pOUWUvMDBVaVZBSnFHNWZOb2U1Y2VhbmlCVU9H?=
 =?utf-8?B?T0ZLdHNSWURwb2NwcjB0NXd3TS81MUdwYWhVdUVrZjY0RnZBbGs5clJXU280?=
 =?utf-8?B?RWhZejZjY0xsbU1RUDdMVzVGWjNEUkVUSFlTTEtwakVCNmY3VGVLa3ZXdWJX?=
 =?utf-8?B?ZEJCQ0FIWWF3ZXJ1N2xoZVA0aUwzOUN6SGhhTGNOeThPZU5uZzlmZFJVdlpa?=
 =?utf-8?B?ckQzZ2hrK0dMSjd3YyttYmhSdkJTVjBuNzVueSsxMlo3RUVwVmtPemdmcnIy?=
 =?utf-8?B?eUlKL2lNV25HTHVrckhOMFV6UnEwdTduS0dlek1PdjNrTEc4a2Y4WkNIV2RI?=
 =?utf-8?B?bGV6TDFMbUdSRXh5RkxMcDRoeDJZZzk3RnpMM1MwajFhZjNNOEFHbnVPM214?=
 =?utf-8?B?azVxcWpCUFFRU2dvRXVQZ2pQUU5iejJ3Ui9UZ1dpNitWU2pNN2FYQWhETFlY?=
 =?utf-8?B?bTRPbjN6dzFWTy9TWjN0QVBwTnpHTGI3Z1FtU2lkY1M1RVlJZ2NrankyZ1lO?=
 =?utf-8?B?MWZwbWJvanlUNG1Ic3IrZmN0eFZOdzZDV0xKNGQxRmN1TmNhQ1FCVWh5SnUr?=
 =?utf-8?B?YTVHOVh1TFdpcUM1bHlQVzlicktYWlF5MVdqeS9SZE5hcHI3aUx3VTY3UGJJ?=
 =?utf-8?B?eWxQUVlOWFZla0J5Lzl4QWFZYU5sb2JHZmxWckt2c0R5M0xVUzA2TW5WNkNk?=
 =?utf-8?B?SFB2TEpWWDduOUx5Y2d3VFUxZDZuWnRMOUxTd05QaFdSbEZ2V1VQV3ZQOS9j?=
 =?utf-8?B?cEgvRXZaeVRTRm1vcGgxK1U4aUpMTHJDVlY2SFVTSXN2UFltN01YTzhrQWty?=
 =?utf-8?B?dXFpN1F5VGtCRklTVW9qaDB5RWFCZ3BUTzZnOUEvNFNWZS9JMW90VktLeURS?=
 =?utf-8?B?eDJyY2hkaGJ3K1F6d2d2eG1oLzFlWjJCcHBuNCt6MEZZY3V3MjlpM2FhSjZv?=
 =?utf-8?B?WkpWMlpXaDJsaTNVdVU1ZHFUUkpNeTU5ejJrUlJqb0RmSHdWVEVnQkthMUh6?=
 =?utf-8?B?dTZ5NmVyaGN2Y0RJVG56L0cva29mRW03dk1ZUjk4Z1hLdm0vR1NMampZUTZG?=
 =?utf-8?B?SkRCeFpQNW9sMzBZbHo0cFVwTDUwNEtpWitNWkJlUVI0b0pyNVZySFpzejlV?=
 =?utf-8?B?VFovNDJ6U0VVdStYZmlvWmszdm1CaFJiZEJwU3FMcFk4NEtkWmJZdVVRaWdy?=
 =?utf-8?B?bnlZNWpydTk5eERRYTFxUzVmTnFSREU5eU5GR1U4WHYxcWEzcXhVVnJoaVFt?=
 =?utf-8?B?V0pSNXhSelNTWHZubnJyS3VDM1ZzWkovRENnTWhCQVRDU3NNQlVmR2JacXBW?=
 =?utf-8?B?RjBVWmJCY3pVcXIyRlRzTWZoSHdSL2FHZGdQSzhVc3IxN3pzQmJpWnpQYWNt?=
 =?utf-8?B?bStGODU3Nk9wMElQUEVRbkZRMWJ6bDl0RGh0dTJnSUh3QjZPY0hnQTg1Ymx4?=
 =?utf-8?B?cG9SRDNBQUtPZE9XUFNaWGF6UmtQSmxSTVFZbzQvVkQxWGlxa3dzc2dNckM3?=
 =?utf-8?B?cVNkb2VVTWR0RzA5ZkdDRVFLcG03VHhyMnlaL2dzeUpYb0NOMW1va0g0aE9o?=
 =?utf-8?B?NmoyRThhNUxZZU9RalV6NFF6RkNHVm5LK0ZBMVIySHV5dEFLaTZpNHVqZ25G?=
 =?utf-8?B?RXppdXo1NVRmVzFaRDZPVzhiR1lmVmM3dFBUbnFML3ZYVkUyTzBpd0JYaVVI?=
 =?utf-8?B?YUNHRzgwSzJxeUdQYXRwTDM2NHJPellxem5RRlpSU0dERG00YzZEenlNZGlG?=
 =?utf-8?B?VmtzenJFTWQwWm5xeVJIRXdVZDZoTElsS3MyVUJSUXphNENvSG9URFhJYW1s?=
 =?utf-8?B?cXJHVXBhYmloVXJtS0sxbEVxMHQ5RGh3SFNJbk9FbjJsZytTeDVOUUppSThK?=
 =?utf-8?B?SnYvWjlpZUNIOXIzRnlrT2c0L2lrM1ZNd2M4bVhlamY0WGkxWW85a1oyaHBv?=
 =?utf-8?Q?p9Nev7TQWaw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R05MMkRjeDdIT0NZaU5wc29FVnkyVk9KQkd4TG5VNVRGdEg5czZOMktRUkw5?=
 =?utf-8?B?dkxnYkpZNDJFeXBXcVpRM0FZdWxaeUtzdENNL0hVODNqcDdlRm1JNmF1T3l6?=
 =?utf-8?B?czg2dWllVnRkdWtYUlg5c0YvTnRLOFlQNzBJMHdBQnVWOU5uRTZqL0Q4SG1S?=
 =?utf-8?B?eEtZN1pBYk96WjRjTThHQWltVWg0OHZtaUNZVkh2U0l6dWl2NFdJRFl5RHdW?=
 =?utf-8?B?SjhFam1EVC9aemN2ODdid2lMbExTcWNWUmFFYmw0RVpHTzJtc2RtWEhZQmRx?=
 =?utf-8?B?cWtNdHlyUVpNL04vZzUxcXpJK0l3MWpPS1ZQUWNVR1Q5Y3pqWWJlaGQzdC9X?=
 =?utf-8?B?RTBITVpQdklZL0hGVGxrSGJXZXRrT3VDcUt1a2o4K0VnQVhVOGswdTV3cXM5?=
 =?utf-8?B?VGYrWWZxUTdxSDg3aEZ1dVNheDFSWWJFb3JEUHRZcXk2bXhMenNVNTJPVkJu?=
 =?utf-8?B?NytMQVJoeDMzYTBMemZacC8rRlVyMWdwZmU5QmdQY3hMU2RQOGZ4akJPR1po?=
 =?utf-8?B?OU1JdTVKaHNHS2VCdzN6eklLeWJTN0d5eVRPSjJ1YktTSndNOWF6UVF5RHBE?=
 =?utf-8?B?bVBMUUt1ZUczRVM3N3ZrWHBNMG11U1U1MmVJYmo0L29SU0VGMHkrZlJHY2U0?=
 =?utf-8?B?ZGdlOUxXOTg4eWx4cjh6L1lCMWl2Q3lYUld3ODZaU252cmNtZmJlWmlyZm8w?=
 =?utf-8?B?RysvWlRpN1ZuMmx5M0Y5aDRCNGFNMmg3Y09haFUxYkc5UUFrbVhYcXAxSlU5?=
 =?utf-8?B?V3NYcjJ6a0w5YVNNZDIxc0RpVWpaLytmYzZpck10UlpadTRRczFTd2NxNnRT?=
 =?utf-8?B?YzVyUkJDTHNEZWlmY3BiNE91UDNhVE5VNS85em5ZNkY3eEhWUklkbks4dHJj?=
 =?utf-8?B?ZXhCcXpqbm4wc1lsTjdTeklHd2pFaUZWSVVQMUNjYWg4R2txdFBGOTFIMkE3?=
 =?utf-8?B?NXQ5cWkzN1dpeXJYYXV2MUVPT212ZXJsUXVFWXh3WlljTFlBcldSN3RaT0V6?=
 =?utf-8?B?d05DNGtrTHlybDA1VE9rbDgza1VFSjlZQm5FM2JvTUxtd1h3UmttM05ybUwy?=
 =?utf-8?B?aG1EYjFZYzl6SGFpR3JiNFJrdmVKU3BRUE53YVc3d3E4YzhDV2JJbjcrVERN?=
 =?utf-8?B?cjBuSEluRG1iR096M0F0Z0xHQUc2TGRFNTZ3UDZ4MEM3QTZQV1RYOEJiMEZP?=
 =?utf-8?B?WERGbnZKd2FKcVFRM2ZMSUJKSm8zUW9MQS9CK3V3WVQxdGFlWlJMUEVlaWI3?=
 =?utf-8?B?Z25zYnJ0ODZ3enBoZWd5YkJNK2dxemFWMkhCRjBnVjdCUndad0JNYkUvN3BG?=
 =?utf-8?B?ZVJZNVpKLzhLeUQ2VWdwOTA3SG1lWS9GUUU2U2NWdHdjNDVabyswbzVIVHFK?=
 =?utf-8?B?VjBUZldXNTJ2WjlUUVIxQS90MkNPd1ZZaGJRNHBXanl0TVVRMXRpdWFVRzR0?=
 =?utf-8?B?aW04UkhmSHdPRVhXU2FKUXhLSlVSZGFlam04T3J2VVlXd0QrMzVualJJWVVK?=
 =?utf-8?B?dithME1yZVV2ZFZURVdvREl0aS9qMTFYdlUvVXo2aGtGNmFjZXU1QkRRbXJT?=
 =?utf-8?B?WjhTMU1BekxuOUdWWmdvTFBCVDVTc2pwVXN1U2JrVU0wU0lralpJWG1XNWlh?=
 =?utf-8?B?N3dUaW9qL0lDaysrS3BuYXNmZlRvUUxmSE14M0F4a3U3bzdrZk91K2l0U01o?=
 =?utf-8?B?YnVwL084ZDZsWlZpWVQ1LzgwR045dkUySXk4QU9OeGQwMjlUVmQ0UFBWSXEy?=
 =?utf-8?B?Ujk0N0ZNOEkrSDRpcnd2MkdyVCt1bk9Ra2VBNFFDMUhuc0JXNEY1ekROdStJ?=
 =?utf-8?B?dVBPaElQcTd6d3Z5YjUxQTN4bzNaTlhOSnVXY1Zna1JkNS9qNXdEWTgrQ0F2?=
 =?utf-8?B?cHVWcXYxNENvMkp3ajRFbXJOZlVYTGVGSmhiSm9IUWVQS2lEL0kvYW1qOWlx?=
 =?utf-8?B?T2hlRmZ2K3E3YUtLNEI3MERYcjVpM1ZNUjg1S2hrazE4MitoZm5GMjFxSVhG?=
 =?utf-8?B?Q3ZZdW4wTm12VGxFejE3U0ZCRStTbHlxUDloeWFuZ2gyblI4UFVoSklOM2dE?=
 =?utf-8?B?YVRGY0Z2Q2RBTVFBZkY4R0EvelJqUUVLYkNtRlpJcnc2YUg0Z2JUdStWQjN2?=
 =?utf-8?B?c1hNYnVyZ2N2alB6SFI2cGpHL0FDb1Z6WFhoR2djQkhsWFFJUE43TVhva0Ns?=
 =?utf-8?Q?lObxZb1x03GCuJw3JrOFO1Aj8QkSreVMB8HIdi9rwlcB?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2eb6f0-cd48-416a-4089-08dd8bb7732b
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 09:30:18.7392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: deZg/qesNhSvVboGB6Fg1dduaFmfXW6QwpWE8M+qFquLpUZIwhxnWIG7rg3aFzbtruRB3lODYpamM+C04e2eWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P195MB2494


On 5/3/25 00:03, Judith Mendez wrote:
> From: Devarsh Thakkar <devarsht@ti.com>
>
> AM62A SoCs have a single R5F core in wakeup domain. This core is
> also used as a device manager for the SoC.
>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> Acked-by: Andrew Davis <afd@ti.com>
Tested-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>   arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi | 25 +++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
> index b2c8f5351743..259ae6ebbfb5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
> @@ -103,6 +103,31 @@ wkup_rti0: watchdog@2b000000 {
>   		status = "reserved";
>   	};
>   
> +	wkup_r5fss0: r5fss@78000000 {
> +		compatible = "ti,am62-r5fss";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x78000000 0x00 0x78000000 0x8000>,
> +			 <0x78100000 0x00 0x78100000 0x8000>;
> +		power-domains = <&k3_pds 119 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
> +
> +		wkup_r5fss0_core0: r5f@78000000 {
> +			compatible = "ti,am62-r5f";
> +			reg = <0x78000000 0x00008000>,
> +			      <0x78100000 0x00008000>;
> +			reg-names = "atcm", "btcm";
> +			resets = <&k3_reset 121 1>;
> +			firmware-name = "am62a-wkup-r5f0_0-fw";
> +			ti,atcm-enable = <1>;
> +			ti,btcm-enable = <1>;
> +			ti,loczrama = <1>;
> +			ti,sci = <&dmsc>;
> +			ti,sci-dev-id = <121>;
> +			ti,sci-proc-ids = <0x01 0xff>;
> +		};
> +	};
> +
>   	wkup_vtm0: temperature-sensor@b00000 {
>   		compatible = "ti,j7200-vtm";
>   		reg = <0x00 0xb00000 0x00 0x400>,
