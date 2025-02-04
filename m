Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CA12080D7;
	Tue,  4 Feb 2025 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738663986; cv=fail; b=FoMPzfS7ALi/Ev1A4Ob2Zsm/puEo7CDPJOtlfSV2u29CoAjh2cSX08VmVCdxMq7B6A8pfnBnOHSUNs19chLYhesRpEr/pSLyN1PVHOA8IfHsRhanwODRYD9zfBYySKtvdj8AfgW71IqAriPWu1MV1YT7cvEXTPml0rxsJgxwSnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738663986; c=relaxed/simple;
	bh=/N96sPIqAbzJlpsJqAgTgG2OvcZ4uztLkiInt+EA+cI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LNiHraZ3jg3Ub5mhvnKoC6mSR54odX3bZJTI2QY8Tib0kV7Xh3HP6d3eQoTEvEtRd9rfdziIZYcMd2Y4wZdddipplTaA86L+yfFaNWEspVhZNtlta9OyBBzhlFf5m9xXYqp/9G3Z1wu+Q52bV0C2ieYQWJx5+aZGE0QdqIwrGBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PSXCyfZx; arc=fail smtp.client-ip=40.107.21.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PSXCyfZx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmzddAgLqIecSFhDdKnRaA9j66VBpesqwf1LshHFNN/+HUS6SyI2ETixhUblpm09zNKyj3KXl34qKLQ+ugHzAF4GFxzMXTo5qNzUQKEIOzQFh9ZhTpY4fTGjBfCqOQ+VuyS8zh9Yp/WlZN9bJ9k0KX9B2pjX5rCmdr7zhVHeVpHFjNXWvXdmdGJ5Aau2FQBY8Becs9AR9FdTLaVVi2ADCyi1WXVkG/RW/9t4UWgIhAFd6hNdHUXQxpuA4QVyq11BKQc4Lx+B+WnnxvwQvAZcKym6CwUIcSWl3TDp5iMcKUjPJcB10gxx9JcpQOwjKczqMA+iXMkjMEuGwQIhRSK9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kukJwsVJAfA7nEhqrf7PLdD7fs5rHhblMYZ15xAj8Ns=;
 b=HTYboPpdkSpM94ps/vp0b4B8GC8PpRlfWZDmyIJjRpg+ZitjQ2vMVHDeQNoPMZ1bFqYBYsYoeXiBlCgU7lE7nq6AYeaI02KFuLU+LQXN7vWgXF3kaapwc54lHlYTzLqYX7xsFVRUZtyDPRE80fVZk+MjKIBthrEYEf/Lr5LlK12nH6BlyYT0/DJKgRy6KiFlGpkEHHytTUWe5z32x/jALNHTcG77IzsUNVUKlIIDgQ1tw1C6b4sMWhBqe+U0tXJpT5uf/00AmaC5C28vN9Qkyqs4RXXU/BOS6A62ZcwidbOtRLsIszYjZ2tz5uTIv+RO6HiEOID3dCvueBXtvlMhdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kukJwsVJAfA7nEhqrf7PLdD7fs5rHhblMYZ15xAj8Ns=;
 b=PSXCyfZx6xBjS240rh0L63MR+NyGAG1ndtdlw+63PCqGUe0kuXfbNyMXmtrSiALUulPd6Jw7FMQ6ui48RPM/s4sdJMyGsIUzdrCrbQvE/dpwvdIzSxP3xtz5xo9i/5+bMX1p1EesGwqyIQ4zfqyTeUhoYqo0JqqSiv3MafQ5t7bBb6klLNKnthnWOUOcZBpzje2MafPZUi7My5eGNrkoHPXm8FBHew9rMPu0KZOYMUlNi6aDMREPu9kKUpoke+CGLUw0mSmcCFygH+FYJupjrj8zyRvQbAArBHFHXtIJJOLrjDNFMzjqF2TM8sZSEzjwQBYNXFz9IvuNXQ6IqzJ8QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA4PR04MB9270.eurprd04.prod.outlook.com (2603:10a6:102:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 10:12:58 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 10:12:58 +0000
Message-ID: <afde74d0-b4d4-4907-bfd0-59f68861245a@oss.nxp.com>
Date: Tue, 4 Feb 2025 12:12:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] add I2C DTS support for S32G2/S32G3 SoCs
To: Chester Lin <chester62515@gmail.com>, Matthias Brugger
 <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
References: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0010.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::20) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA4PR04MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ed0645-336d-460a-fa49-08dd45047f95
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RE1IUStFM2RZbThYYTE5ckpaREN3Vm1zcnR6MW4ya0xHd3NOcGlLSWdZekdU?=
 =?utf-8?B?SUlTdnFmZHBvVld5dTdoZVBDZmdKcHBPTi9vYVdXajNSM3IrMk91aGVaWXVF?=
 =?utf-8?B?eWcwaHlZVVcrLzlkQ1JaejczWTVlNVpmMFdycFFoT291L3pnSmVyS1JSSHht?=
 =?utf-8?B?OUVWSElPYldzRWk1U2czRWR1SE9YMklGeDQ1eDdPQ0cvOWxDU3ZpbTFLLzhZ?=
 =?utf-8?B?QncvTldyam5jUVhmNlc4T0UxZkdKV0traUtYSFUveTcwWWRjeFg1dWwrUllF?=
 =?utf-8?B?MXcvMmdxdE12SlNONlVycitzWVh3emtuOUZBQ2xZZXR4b1BCQ1U3T21QbGxK?=
 =?utf-8?B?N2VDMFVEdDlVQjhGNEk1aDVibURFaFlydmxTM1diY1ZHUEZ3aXJCUVRwTTBN?=
 =?utf-8?B?My80RWZRdFZuV2k3d1VuRlEzdDVjVno0OVJzNGxBV1Fnb3phbG1PUzdUSkVj?=
 =?utf-8?B?QVorSHYwV1FHSS9QUVN3SDBiM1FPa2Q4Ujc1NnBJTm1RQ3FvM1FYbTVUbTJo?=
 =?utf-8?B?UjFhRDBSVndRTzJSdm1HeUN2RmhJNDl0RFNSVGUrQ05ZaTBJWUxva0RhZ0tW?=
 =?utf-8?B?WTdTZzhIdmY5MDNPTFlMZDVtN3NKRGc4ZHBqKzFpVmExK0JicmJKaXNGdWRk?=
 =?utf-8?B?UVk0YmlYUC9iQ3pwWGFhaTNKUmJNc0p1UUdMV1k2bGc4QzFqMnBJNk5yZUZZ?=
 =?utf-8?B?eitZSWVHUUd6K05aczI1bHBYVExQZWhHNG9MN1lUQSswNUU3MHdHQUx0M3F3?=
 =?utf-8?B?VXl2amNLTG92NkM3d3ZDVTNkSlJ6ODBkU3RmYnFkRWNPaVBIZnR1WEN1dEtw?=
 =?utf-8?B?NEkrYXREVjZGSHZWYTBIUlBUUERKQStFeEIwNTF6dDZvY0FlRFNYNkxVWDVw?=
 =?utf-8?B?NmR4SndLVVkySTRDUHRScVVjV0R0Wm1rVGZOOENPVm43R1pwMjhrQzhuNDk2?=
 =?utf-8?B?RVlQUjVWVVNHRCszcVdlNUpUdkJRaTI5K0E3VTc5OThlOE4wK0dZWGtQQ2Zy?=
 =?utf-8?B?R1BzNHFuMkpTclg3VFVRRzNlVlBiTUdpUm93YVF1QnNZZ3hZaEp2WEFpa2Uv?=
 =?utf-8?B?TlhBUmpaQ0QwVWFhTGhyYXBYM0ZlcmdHeW5ReGg0eHc5QWpZdEdmOGV1Rmtl?=
 =?utf-8?B?bFVwNzZPRDlEcEZZZEFTVTQwQ0FxRVoyVzZzUjFsTjkwQXlLUGcxVTVJdEJR?=
 =?utf-8?B?VVZBcnZLckZFbkdrY2VpdGpRc3JCYjAxamNSUUZUOEVzMTlBeHYwZUt1YTM0?=
 =?utf-8?B?RUdZNWlPQXVwZ0kyMGxiY1dPR2FGQjRsaFZkOW15bVZGN0QzUXlVUkdTc3Zl?=
 =?utf-8?B?c3dEdlE5b1RETUR1Unh1c1lYbVZLODQzeWx2dzNlYXNYdG5DUHZDclF0SWM2?=
 =?utf-8?B?Y2hGYnNiYUNHbklSM1Nyb291MHV6WGYvOW5mQ2R1ZGFCS2dXRWZlZzFQZGY4?=
 =?utf-8?B?S1MxdzZJZkJONnBPMWpmT2hTZXgvSDV1U0hmSmJLdUJ3aVo1S1FzQ2pUVkdV?=
 =?utf-8?B?ZDZjMVMzSmY0SzUxeTh2WENZY0UwaXArTWNEYUpkdjVRUG1KMjFLdGFjdWdJ?=
 =?utf-8?B?L3lVYk5mQkc0R3RzQUhZWmFUREljcGlJUTZMYk5kRnlSNEFMUEdrNHNVeHp1?=
 =?utf-8?B?eWRXTWdKRFpKM1V1NXZYZS94bzdOZWxteFVCNjNreGh5MGNJKzlkblAyU1JP?=
 =?utf-8?B?WWRPTG1GTXdldTh4eWd1ZUdJcU80cXJpbjV2UnJJVFQ1SUJsM2g4YlpHOGJP?=
 =?utf-8?B?YStUcWcvR0tiSTFBbVZib3J5YVNnN2VYMms5SUFwVFRobmVtY0pTWVRIUnp6?=
 =?utf-8?B?VnVIMlpTQ1dmaTBiU1lGcmNIRXpSeXdFVnl0RUg3aHhhMHdUTXkxdjV0OVJ5?=
 =?utf-8?Q?/QddcbsjS/cSP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEtDZUVSZlpGa3pmT0cycGE0VnV2N1hIRWVaUUpRVDNaZjFWd0dWSFpNTUc3?=
 =?utf-8?B?ak1FRk4vQ3lDSzRNRTQwMUhJQXczUGE3V3dOakRISFgzczNQQWxsNUNnOWVM?=
 =?utf-8?B?ZVlSYzVEeTVWQTdoczVxTjNwejY4Yk8wT1Y1U0l6Q08wd3ljcnd3Qm4wc0t1?=
 =?utf-8?B?T0lmaUszbTRLRUhMRTZCM1ZNWHBCdmN6ZitDVTNRRDZ6Vjg4MnJ6OFRVL0Vx?=
 =?utf-8?B?UWdOb0JQb2h4UjY2aWNkeTlLdElNTUFZUXVxNXFZSWRqZzE2bEttbzdmQzQ5?=
 =?utf-8?B?TWYrL0syZzlaSnZtb2F3WWRROGNQMzdmdzBSM3NSRU1Nc1AvZFNrczRlU2Y5?=
 =?utf-8?B?WHRYSHlzdXVZMFpMc21KUmdLRWtBeDlRZHlScjFCZjRWMVBmei9RUXN0UktX?=
 =?utf-8?B?bUdXVTBkdS9zS2tHeGwzZXExL3lFU0xGOVlYNUtiVTR0MERlcGVCNGdJS05N?=
 =?utf-8?B?NnZOWkp3ZXJidER1anNRV2t1TEo3bXFiRnBLY1JCYVlsRmZBWmphUUJkSjRz?=
 =?utf-8?B?KzNiWHEyeWhFL2lvd0M0Z2VHSFhrL0tlUFg2enh4WEtMUGNkSEhRRDVpZ2Za?=
 =?utf-8?B?OVg0cGhmeFB6dmZSZkYrVmMzU09HNE9RR1VELzhBZ3U1cEg4SVM1VVV2UGdI?=
 =?utf-8?B?dURrRitZUEtHSzh6djV5cWk2M3dPUS9ubkJSK3kzUXZDN0ZKNkN0dzFRZkhC?=
 =?utf-8?B?bDZIZUt1dTltK0phdmpkWXZVSi9weWhGRFR0STFQa2hzaDdMYzkweWc1NVZx?=
 =?utf-8?B?RkRMa2Y2VlFsOEFZdTNsampNaVNMWllRWWF1aDJFRWpKYkZBRk1FUWJFT3Rv?=
 =?utf-8?B?ZFIzMHdQL1dYOFBycTdtTkxGcWVnL0JCMTFBNkpVcHhac3o0OVFycnV5VGJJ?=
 =?utf-8?B?YXVqVnhPVXVHZnEzcGFRa3pidmF5bWNjdmxjaFJXckIrVlI1VEZNazluYmxv?=
 =?utf-8?B?VWNvc3JJUmhVTHlHWVpSKzZzNkMyeitLTStFdEVNT0NUUm5tOVV4QThIMFBa?=
 =?utf-8?B?RGQzR2ZVZ2w0ekJKdEFMUVFsa01FVXhENXFnYzUwUzB2M2RUNUhpbkdIN3Q0?=
 =?utf-8?B?OW1UcGpZNW1uK3dSRXIwRStDVWtlQkxkS1pBM25CaWtzbTZUaEgyY3NuOGFK?=
 =?utf-8?B?c0tPa1ZKbGllUlVaTU9rNTQwdVBveU9lSkEzeGpSNzdBTDlrYXZhSFZwa3JQ?=
 =?utf-8?B?d29XRzB0WGEyZU16YWpmNUJibXhCMm02NVBMcW9NUUw2SEhiV1ByS2d2UVNU?=
 =?utf-8?B?VldtY3lOViswT1pEdFUvUVVvVW1iNG55QUNHMXBPUzNXb2RKcDFVQkQ2S1Yv?=
 =?utf-8?B?U0FackwwdzYwcmYvczJTZ0ZQYis0TDVtaVJ4Q0xvblVSamNOVFBiWEJ1NVFH?=
 =?utf-8?B?V0dsMVJ0alhLdDRzVG9wNUh1RW9KK1hpQko1bVJzTUhMVmNUMU9IenNRV0sr?=
 =?utf-8?B?T0hhV1lHT0RiYXkyOC81TS92Q2tKd05YcHg2NW40TzVWdG1YZ2ZWQUo2ZUR6?=
 =?utf-8?B?am5JZUdEV2t5QjRBNWZYbVNGMU9BZ0N4eCtWY2RCa2RsZ0g2RS9xbDFQRWM2?=
 =?utf-8?B?b1VucXBaTkZtM2tma0xkQ1VRODh2NHE5M2F4M3NUK2JucjhwSVRXRm1SNThs?=
 =?utf-8?B?WHRPbHB5NTlmeGlMaC9kWGkybXJHckp2ZFA2NHVoMGY2bjBmeUhYM2J0MlA5?=
 =?utf-8?B?SFQ3cVllQ3JrRDIvSk41dXlma0ZXZXBYZ3B1RzZONUJSeGI5TWtmdHQ3Y3Va?=
 =?utf-8?B?WGloUlhMc1lIbnVWVkVraXorTktOR1Bjemdka3F5NzRiVGV0MTRJMm0wZWwy?=
 =?utf-8?B?bWtqUTdlZS9NNTkyblNmTTZKWk1jZjY3cG82Q0k1ZUEyeU5FVC93QzBLdmc5?=
 =?utf-8?B?b3ZXR09EcEpnOEMwZkRuWURYVUs4VlJSUnZLVWRURTd0WWZYTmZHM3l4Y3ds?=
 =?utf-8?B?d1VlSndKM2xNSEdnTlErajVkM0JjOTdpNzRCVmtmTEd2c0NjZnJkdlpJbG9O?=
 =?utf-8?B?SFNUUDhzUjBPM2daalNpV21SV0FYaEEyZDNhTmtIaHZNNGQ0d1ZDcXpvMi8z?=
 =?utf-8?B?MlZBenFqNU0vT3dTSitEb0dGYS9uaGtlUUQ5V3M0YkhiRFJ5cGora1NKemdi?=
 =?utf-8?B?U0NWY05xTEZ5UFVsQWR1RDNPTnRYREQ3VkFzV0ZTMm8xV1NyS2Y5cmh6enhP?=
 =?utf-8?Q?jdHhjDrZaiYzbzDhb+rX2xI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ed0645-336d-460a-fa49-08dd45047f95
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 10:12:58.3137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQMzss6VoUSNiWKWF+p3tIJlC1bg4MWNW8+tLdPNn49Up0ZeyqX0UHpO8MxHDhLaYaOOMsK72MUb+hagx2YDeqm7bSBwGwRqAxGJzXdF5Bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9270

On 1/13/2025 1:05 PM, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> This patchset aims to add two changes to the S32G2/S32G3 dtsi support:
> - Adding I2C dts support for S32G SoC based boards
> - Centralize the common part of 'S32G-EVB' and 'S32G-RDB' board revisions
> into dtsi files. This refactor will serve I2C in this patchset, but in the
> future it will also be used for other modules such as : FlexCAN and DSPI.
> 
> Changes in V5:
> - Updated several commit titles and descriptions.
> - Moved 'reg' dtsi node entry after 'compatible'.
> - Squashed commit 3/4.
> - Changed 'ina231' dtsi node name to 'current-sensor'.
> 
> Changes in V4:
> - Moved I2C nodes '#address-size' and '#address-cells' entries from board
> common level to S32G2/S32G3 SoC level.
> 
> Changes in V3:
> - Separated patchset into multiple stages: common 'I2C' dts entries, board
> 'I2C' dts entries and the introduction of common 'S32GXXXA-EVB/RDB' dtsi.
> - Added missing changelog for V2 of this patchset
> 
> Changes in V2:
> - Moved I2C end device '#address-size' and '#address-cells' entries from
> board dts to common 's32gxxxa-evb/rdb' common dtsi.
> 
> Ciprian Marian Costea (3):
>    arm64: dts: s32g: add I2C[0..2] support for s32g2 and s32g3
>    arm64: dts: s32g: add common 'S32G-EVB' and 'S32G-RDB' board support
>    arm64: dts: s32g399a-rdb3: Add INA231 sensor entry over I2C4
> 
>   arch/arm64/boot/dts/freescale/s32g2.dtsi      |  55 +++++++
>   .../arm64/boot/dts/freescale/s32g274a-evb.dts |   1 +
>   .../boot/dts/freescale/s32g274a-rdb2.dts      |   1 +
>   arch/arm64/boot/dts/freescale/s32g3.dtsi      |  60 +++++++
>   .../boot/dts/freescale/s32g399a-rdb3.dts      |   9 ++
>   .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 150 ++++++++++++++++++
>   .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 122 ++++++++++++++
>   7 files changed, 398 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
>   create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> 

Hello,

Is there any more feedback on this patchset ? I see that it is hanging 
for a while. Just want to check.

Best Regards,
Ciprian
