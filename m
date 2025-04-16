Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C140235354;
	Wed, 16 Apr 2025 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794905; cv=fail; b=L/31fhI/RdCZmHWvMcatKKxF9oxHikV/DeDV+DlVPOwmWATyACFuQy9cph3W6VbEWtjGCx9KW+MMpOw/GlgDZH4++ZZFvAEXk2D2eSocn7IyyB3eZYO3CHWq4hTAIPHfGbuRNhocFi9Y/6883AH873JvoJlCXhkDbwHtYUX+Zsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794905; c=relaxed/simple;
	bh=ey57WhhR8idjN6v45Ti202As9Ux4rfduS0OS8QnS4GM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lF08oH+BCJw6Gwz/E8qiBhZh+pnIq0KcKd2RxPoiAhfi0zhiJNd7FXA7qsfF71/aeIeHTvl5iJRkig/8wcRD5JcGwpQTZtOrYxJQt0zrKnTdC0fr+V6CRW+/gfM6KvpQ4glkmHBOylQEjjA8viUJfQBPwOcTy7rewTJvQ0BDKPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=UPFdL4YD; arc=fail smtp.client-ip=40.107.22.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="UPFdL4YD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARXgZpaXUBnYwJ4rqEt2MVF2GWBT5RdbuFG7O7mROc7YSyN28rp+Z7rx7cEH5YSyWb0M90gq8lgWYnrI4JrAbJiPb5mHXA+6UkHCIAW0CLl8H4H1sUtGKmI97LR7hILOWuV8xru8UBBzaR/RaWuJa+DKYREBvQboqE48aiQr04I4iBopKJERudzy5OA0hmU/7pb0q5m/GuHcRf5ucLQ+PY6Hn1N4TmtNFQEMYAFSftDC8l5r7/EGm5xnDNkcG5j+62c/AaKtsGReQRKjZKrN/nd6eb8EZO/ORHh68yOGdTPzdhtcZiC+VTNf0i2wAjk8bFHnYTYyltx7NUauJLor1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5qx+haD7+N4fIq1K0HphF62m15+mL1P/2huhG5UbOg=;
 b=Xp6WaCS22HjLyBSSsF+rgejJmyM9G7PQc3ul8NVw2RWoimTtO7f5lcBHTxvGyaERbifiiD4CoCJSNnbdAuSrDtnRLle91q6p16wyMvWwkuPt9YhVNfuQDYiUycoD55CVD03FHvG6KBl1PVs5AtEwKPMYqz9ix/TRT59K6jtCbrRl/WDsbBhdsBXv2eeNTdRAaCZfUUP52i1IFmP2xfGct919NJUgGjeG1wFKjQT870WZ+oBEO7YvAmrZoqEwJMPFmXHKxEIwiqEUCO4JfKDjsbuH5HJCEgE6YasFeneGJd9Ij8QHjx3zdk2KPVR46jCRAAXvn/P3hDiopG3mkFciAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5qx+haD7+N4fIq1K0HphF62m15+mL1P/2huhG5UbOg=;
 b=UPFdL4YDzrXjrAW7GSyq0EiYWTPkLY7Fp2lgJMraq+wMAIacs6H0VJ0M7pySXxCYgoxaj3I+kw5T/Oy6YPnYYYAXSJgMwU3frHA5KR/i5mwya/qhRepCk5m/RPdIOrvcYrE1FHjUdS2f0XW3GT8Qg+lD2w5Bqa9kl6nRosJqi54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS4PR04MB9313.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Wed, 16 Apr
 2025 09:14:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 09:14:58 +0000
Message-ID: <27cd48ed-1a05-4619-a8c6-ddc07163bdd6@cherry.de>
Date: Wed, 16 Apr 2025 11:14:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: usb-device: allow multiple compatibles
To: Rob Herring <robh@kernel.org>, Quentin Schulz <foss+kernel@0leil.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?=C5=81ukasz_Czechowski?=
 <lukasz.czechowski@thaumatec.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250415-dt-binding-usb-device-compatibles-v1-1-90f3cff32aa0@cherry.de>
 <20250415190125.GA795139-robh@kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250415190125.GA795139-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0307.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS4PR04MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: 414477b0-7a17-4657-31be-08dd7cc728e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHRYK2p6K1labFFYUHhlTlp1WTQ3bzUreE1IaG1JT1dPQU9EdGxxa2VhQzB1?=
 =?utf-8?B?c2NNdHRtYmlUamhYL2R1dTR2UUtXWi9vRmk5T3dyNDhsTmxPZmxDK3FPcWtS?=
 =?utf-8?B?a0JrWVhuTG9nR29tOVZqY0tEK1hkTk1MdjR0Vkl3Q1R5KytzUlVCMzRNTDJ3?=
 =?utf-8?B?c0I1YVNMdTc1c1JxOUk3VW9jV05Rb1hhVGh4UUh3b2xHa0xiTmcyWjdLS1NB?=
 =?utf-8?B?bUltRVRjSEUyd2FQM0ZlQ2JjT1ZoZGZKZ01QSE5NSnR0SDRaU2g3YWFQVDFF?=
 =?utf-8?B?SGJrOU5MZU1LdHVqSzJXVkppK3lWZHdiK3g5S2ZBYlZObEVWZGxxWG1Sd1NM?=
 =?utf-8?B?QktNdWZrZDYyYzhFTm5FdUhnMCtDdzBmL0U3MzJidzBSWkljcjFwa21GcUpB?=
 =?utf-8?B?VUxXUnFqUnFPcmw5UXBWd25RRmtCNU5TWE8vaHhVMlViWUNkTXlndUJiT0xL?=
 =?utf-8?B?eUxsb29YK0VVQzFRSEhjVUZ5aVdsL08wbWczR3NCTTdSK1pJNkNCTFBIQXJ2?=
 =?utf-8?B?dU5vSGhQR0hlM1VQb2JwSVZHakdIQTkzNDRsaStNS0tmN3hVSmZ2WE9qVFE4?=
 =?utf-8?B?d05rQVJkTDB4RExWUCtJQ3lOL24ybFU4QllReENjZTVGZWo3R2V5VmJEL3Fr?=
 =?utf-8?B?M2VnRlFrOHprZ2o0QUVoOHV6Ykh6czNIbCtYZ25RZDFzaXFwbUJGc1lIWFNu?=
 =?utf-8?B?MmhUU2l4SjMyWGJtRGoxZzdNUjZ2Wk5MWGsrTGpzSHU0RUM5bVptTnp1KzRl?=
 =?utf-8?B?K0hTVjVHU0xabVlaVXN3Z2kzWjhMZkxnSXFDbXFnbE9sQWRMU3c3RnQzQnJu?=
 =?utf-8?B?d1RBYU9GaG1lL1ZUSlZMWG1vYVhDY2MwQ0UvRmE4Rm5reG9LWkdRa1d6UEx1?=
 =?utf-8?B?TWxhMDViYmp0MVVDNFVjMG5mTVNaVnVjUmJUWjlSTmg5M0R6Vi81OTRaS2lo?=
 =?utf-8?B?b09aSXhTQmlaaTBrOXdnS0tKYzE3dnIxOEVmZTVkQ0E0V0g4MnorR3Y3ZzZB?=
 =?utf-8?B?b0tQbzZhYVZVSW84U1AvVkRJVlpabDlXbDArK3RxTTBpSXNLblVNQ1FmRnlu?=
 =?utf-8?B?eXBYM3lvVWdHWVBIakV3T25VZHFnMzVyMTArMjEzZHdwek5WMTh6YWlYMGE3?=
 =?utf-8?B?SjVtQjVtQUxWZHlWZG5FNUZuMm1Zb1Y1R0tNSFJTejdQR2tabEh0K2lKWnY0?=
 =?utf-8?B?MTZDYlN6OWdIblk3TnRNNTZjNjBEMUZwWWFNcUJ6d1hWMzZUbE5QVUQ4eVlv?=
 =?utf-8?B?aFQyY05uYzVmQlZ5aXk5YkNmT3FOR2hNbC9QeGNYaEVpRG9VT1JRZytYd3lD?=
 =?utf-8?B?WDdoelQzUWtvdHQ1Z1U0SkVLT0JmbUhuV000RU5jaml4cWRUT2FDNTBLTWRJ?=
 =?utf-8?B?TnF1VWpvVGhmUmt4MFZlT2FXV3g4bCtON3RYQzdaRm8wdFFMSDQ5ek94YWg1?=
 =?utf-8?B?dm5aY0xiWkozdTU2YzNKTlgwbnF3djJLRVIrUXlqWnJidTdYTUlUUUtCS2NV?=
 =?utf-8?B?VUxYWDJpdUJLeEMydW92ODYwL1dvNUJ2T1NwUE9obFBpVFFvSVY3dHJabkR4?=
 =?utf-8?B?RHAwcG02U2kxd3RYdVFmZDlqeHRBTkRDYjgwblc4eFA1bGZLUzRhaTFFSGF2?=
 =?utf-8?B?dHhSM2xRazFHNEZQVlNTTFd5QUpLNG95WXpWdnhKazdtZHFGU0V4LzkybWtX?=
 =?utf-8?B?R3F3NThOTWt5THh3V2FBVWZHZ0NHUXpaaEhvKzBoMHRJSXZ1SzBXTWJPa2U5?=
 =?utf-8?B?aDI1T3k1OGg5VEc2RGk4SFZCN1NtNEhLZ0x4ZStueWY1QnpsamcrbFNXNnJ2?=
 =?utf-8?Q?ERIvf7vmsu81ufpW/04Ybk0umiBJKzBcn7tHU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU1kc0J4ZTNNUmtRbU9UL2V5ejVNaDFDRTE5Q0V4NGNtckNld0tKUWtNcEVU?=
 =?utf-8?B?TlkzeHBMT1krWldvZUNWQi9iQ3Y4QWU5bFBhK3hmT3VQdlprSWMrOW5IOVI3?=
 =?utf-8?B?RnFlK1Z1K1VLejZMeFlPOElIMGxIWk1UbmJCZXlXY3lxTzhQWFBMRHpSenp1?=
 =?utf-8?B?Q2JkRTRIRWpsYjQ2UGtXd0NVNTBwRUYvNzVaakFTVU95VnlweEhkQUZzeCtr?=
 =?utf-8?B?Y29WVzNEdGRyWEhQTGlmT091Y0oxVDRPTG1hV3dmSkRJV1ZTdWtYS3o5YXJF?=
 =?utf-8?B?TXZrMzlnSEcwbkZUNXBFTXZaYzhDSGJ5WnNiaCsvVTBGM2ptRVp4a2NieGZ3?=
 =?utf-8?B?YkZrYXZCYlJIZW1RZWQ2Zzk1TnRuTTJhTjFabWViTHR4NFUxS04xVWJ5QzIx?=
 =?utf-8?B?Q1FBdUUxZ3BqSHZ6ZWpGOVQ1V0FDRURSNnBFNWgrTWRoOUVIQ0VnNXVvZmhs?=
 =?utf-8?B?OHA0VGw5SDZ6bldXSzR0OFJ4QVp4VkdCUW40REsvR1ZoU2VBUWlBT1pZTVBm?=
 =?utf-8?B?OVM2Y1lPS29jNHF6Q3dlNlZHWkVmb29PU2NqVThvLzNmTmF3SUVZRVZIMzBY?=
 =?utf-8?B?ZXZkQm9OSWFGbnYvU2E0MzRVcjA4RUZYZW42RjRUbmZzeEp4bkFucXJEZS9I?=
 =?utf-8?B?T3NtUGpIcDVtQzBCQkRZK2JiVkZITWl5ajBQQlpMQ3doV1hNTkJCeGhCRjJT?=
 =?utf-8?B?dWx6eVRuR3JQclI3UnI0WEVEemFpcXJTSXk3NktvL2RWK0QvbGxSU211MUhv?=
 =?utf-8?B?ajVua1E1ODhoZmFNUjZaVnZPZFIyTzJzNDMyVWlHNnA5OUtFK0F6SkZseHR4?=
 =?utf-8?B?TnhYTWFlTWpsT2pTU2pmQk5XV2ppcSttQnlubkpoYjY4TEU2RXZTTk5CNXB5?=
 =?utf-8?B?dnEwcGhBQ2RWVy9ONTZlTUhnaUd1c0pGQTUvejdybGU5cEZyeWN0R1p4Y09w?=
 =?utf-8?B?MURla2E0eG92OWo2VzRXK3VHZWlPdFhUcnFVZU13ZWpFa1hRcGtKNjNTUnoz?=
 =?utf-8?B?OUh3MkpBTWxHNG40UUYySEhEZWF1Z2JJcS9xYWpqWG5jZkxCRmVHemIveENW?=
 =?utf-8?B?eHNVR2pYL0dBc25QTWJndkhKUFZBU04yV25iMHdmOGhwOEh5TlZnS0lsRnJK?=
 =?utf-8?B?cHpMUUhYYzFwaXRyeDhUWkhqalgyNGhxUkhOMGFSdUl1VEtqMjFwbTlzb2Iz?=
 =?utf-8?B?TmFJdGNpanFPOEFmUzNnVUt4czZrSTdXZGNBWStwdkNYYjRtZzNIRHp3ZnRX?=
 =?utf-8?B?cG8ySjYya0xORUNYK2Q4NTZQNGhza1N0RWZWYmJ4enV3K0trZ1NpaVBVbnlw?=
 =?utf-8?B?encwYitjbmNSWWkrLzE1bTJLV0c3VzBFTDJmN21OMGxPYzVCZm1rRDdYL25k?=
 =?utf-8?B?OTlCNU1IbFB6aktLNDVZL1NRVkYzazVZd3ZqK0dzL1g1QkV3UVJNa3JNMjFO?=
 =?utf-8?B?azdjMG9jayt4UjJLOTNwQXdhdHpsSmFxdmZQc0ZnSE5qeFdtSGJXbGxuNlIv?=
 =?utf-8?B?UlJXeU84dU00d3FHNUpVNjh4QW1XOHNWajB3Z2pJVmxvTHF5c2RFUkExS3Jr?=
 =?utf-8?B?MFRqNStuQ3BMV1ZrcmNuTkkxempkdTdsazQ5Rks5WkQyTXhwT3crdHRucUxT?=
 =?utf-8?B?UVJoOUR2SXJOQVhtcnlxaVZwaUZ0UE8wQ1dlVktNaU1UVTRjdDV2VzJBL2pX?=
 =?utf-8?B?RXVHclgxSGthb3FOREpzZURMYUFtcEJzZVZKejkwekpsWG5wTm1pSUFDeno0?=
 =?utf-8?B?S1RlSXJPKzRPSzBLamhGRjE4WU1ZUExRTXJlZXg5c2EybXpvNFdDM2t5cFdz?=
 =?utf-8?B?aXhHUEN5RVFiNmIxQjRSbks4ZWJlRytKbEpEbW4rdFdLeUd0Z1FHaHkwdXh2?=
 =?utf-8?B?K0xZNndVZDFwMkdNZFFkOGJMMmdoc3RJcFV3cEV0OWxhblJPMHFBU05Vb1Nn?=
 =?utf-8?B?V2RVaC9yRXZSTnVNM2JqVWVQV3NmZUJMK1lQZERYNklBYXVETk9GZmtIRUtz?=
 =?utf-8?B?YS9FUTVEU1VIRFhlQmYwSDZ1NEhjU1JZWGJwME9sd2h1YnNuVTVyMjA4RXh6?=
 =?utf-8?B?RHhhdkVZVVZsTVVNRHhZUlFySzNWVUNycWZSWEdyQncxYWg0QXZZcVgwZ2RL?=
 =?utf-8?B?N1FjN3A2dzFnYVpOWVM0K1dPMURBZ2lmeDdTbE52QW1XSmVuVnRRbWtDWXhv?=
 =?utf-8?B?Snc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 414477b0-7a17-4657-31be-08dd7cc728e9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 09:14:58.4747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIyAJK6NVp1N6+VV4seOQkPnWT9dvXtVvYUwd31bKCXfXX5zRsWnTqmAOBnRMBbb7LOqXDaAlMsaU27NbLAR5jqxhTgfZy1MP+gH8UVuXF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9313

Hi Rob,

On 4/15/25 9:01 PM, Rob Herring wrote:
> On Tue, Apr 15, 2025 at 04:34:27PM +0200, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> The dt-core typically allows multiple compatibles[1] but usb-device
>> currently forces a single compatible.
>>
>> This is an issue when multiple devices with slightly different productID
>> all behave the same. This would require the driver to keep updating its
>> compatible matching table and the bindings to include this new productID
>> instead of doing what is usually done: have two compatibles, the
>> leftmost which matches exactly the HW device definition, and the
>> rightmost one as a fallback which is assumed to be 100% compatible with
>> the device at hand. If this assumption turns out to be wrong, it is easy
>> to work around this without having to modify the device tree by handling
>> the leftmost compatible in the driver.
>>
>> [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/dt-core.yaml#L21-L25
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>> This came up while working on fixing USB on an RK3399 Puma which has an
>> onboard USB hub whose productID isn't in any driver compatible list
>> but which can be supported by a driver with a slightly different
>> productID matching another variant of the same IC, from the same
>> datasheet.
>>
>> See https://lore.kernel.org/linux-rockchip/20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com/
>> ---
>>   Documentation/devicetree/bindings/usb/usb-device.yaml | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
>> index c676956810331b81f11f3624340fc3e612c98315..9d55be4fb5981164cca969dbda5ba70ab3a87773 100644
>> --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
>> +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
>> @@ -28,7 +28,8 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    pattern: "^usb[0-9a-f]{1,4},[0-9a-f]{1,4}$"
>> +    items:
>> +      pattern: "^usb[0-9a-f]{1,4},[0-9a-f]{1,4}$"
> 
> I would use 'contains' here rather than 'items'. That's even more
> relaxed in allowing "normal" compatible strings, but is aligned with
> what we have for PCI device.
> 

Thanks for the suggestion, makes sense.

Now, I'm wondering how to handle that on the actual device binding?

For example I tried the following:

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml 
b/Documentation/devicetree/bindings/usb/usb-device.yaml
index 09fceb469f105..20a6c021ebdba 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -124,3 +124,15 @@ examples:
              };
          };
      };
+  - |
+    usb@11270000 {
+        reg = <0x11270000 0x1000>;
+        interrupts = <0x0 0x4e 0x0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub@1 {
+            compatible = "usb5e3,609", "usb5e3,608";
+            reg = <1>;
+        };
+    };


And I got:

/home/qschulz/work/upstream/linux/build/puma/Documentation/devicetree/bindings/usb/usb-device.example.dtb: 
hub@1: compatible:0: 'usb5e3,609' is not one of ['usb5e3,608', 
'usb5e3,610', 'usb5e3,620', 'usb5e3,626']
	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#

Fair enough, this means the DT binding currently always needs all 
compatibles to be defined.

Then I modified usb5e3,609 to be usb5e3,610, and I got:

/home/qschulz/work/upstream/linux/build/puma/Documentation/devicetree/bindings/usb/usb-device.example.dtb: 
hub@1: compatible: ['usb5e3,610', 'usb5e3,608'] is too long
	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#

So it seems like we need the driver DT binding to handle multiple 
compatibles too. I needed to do:

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml 
b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index 6fe2d356dcbde..e8e5f78356334 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -11,11 +11,12 @@ maintainers:

  properties:
    compatible:
-    enum:
-      - usb5e3,608
-      - usb5e3,610
-      - usb5e3,620
-      - usb5e3,626
+    items:
+      enum:
+        - usb5e3,608
+        - usb5e3,610
+        - usb5e3,620
+        - usb5e3,626

    reg: true

for it to pass the dt_binding_check. I assume we do not want to use 
contains: in the event that the leftmost compatible is handled by one dt 
binding and the rightmost by another one, in which case they would both 
match and apply their own requirements/constraints?

In short, is it correct that when we want to add a 
"just-in-case-we-discover-quirks-later"-compatible to a device tree, we 
anyway want it explicitly listed in the dt binding matching the 
rightmost compatible?

I'm basically trying to understand what we want/need to do for the 
cypress,hx3 binding in RK3399 Puma series: 
https://lore.kernel.org/linux-rockchip/20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com/ 
to be able to use a fallback compatible in the driver and still pass the 
dt checks. (Considering we will want to backport the patches to stable 
releases too).

Cheers,
Quentin
