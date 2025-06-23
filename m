Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB01233722;
	Mon, 23 Jun 2025 09:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672117; cv=fail; b=iWguBZgKN3LMfZY6DgeQ9zHYeXI+G04J96TocwMc4BJxbSGnn7IHUsc7TPhighDrM5QmKENxPe2+gKLF2CzJJGRGFB/YRgGk3OrjmCPA+BYoxcZOc865j/bChO+f0mPHEDZle/bRR/YuA0QqrPjf+7CRgno46SVATbCwFMaLOvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672117; c=relaxed/simple;
	bh=VwE6zyeutlAkcfaAbyqORC+A6eVLuSEEQklVdP9+ukA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BFEKJEEcPiO5fmj+20El47ng79BrP8gcT7gbW434neQTD/sEuNiCZ+dEmdNud1c9zzxG1YmmDFDZcrA6Qn56tw9r+KFGsQtjKq1HXhnht8iQSJ4vGnFntcm6vQ9wl2RsmYG7QRVjJ1nZa5jsxFm8t2531viIXvGcbbt4R9eRkXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Qudzo8tL; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Qudzo8tL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDguRsyHfn2RIjtVoSrI/AljXY/knVODc0y1K+tkX3CvMzR1zqxKqgvwyqFONJDTOi73P1nxE/RDR9UZkdXuLtVUDDlOUXnb/Bkaz2xrhQDbil0K83T3SgHtHQVe+YcY5YZq5vRn+BsjMfBiYTmX9dI6O9rBxFW9TzVvzakevalGEH+MzewSGjG/OsJaRfUcCQ58fJtu17xnsOIxgtjFThxPOFaNdNS0aO+JBha7s7TTzvdX2dGIGnqwaMJa4HSw0EhvVa6JBhefuOPoW0yoPNeo1nBMdfPhwX0hoih+GhCqxy/Ql3Nu7gkIsS07QR9SQIcaEkF8PL8vHlBQaf2Iew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJyZjPBYu2epxsSHsbCGqldfnDJGgL4Q6skpZkKYyPg=;
 b=YdUqFvR6oEtqJLlasr1gVLJAXLDuAKB1F4QagZRh5f7+Dv4NvAJcPsIVVXeGRw5/C/Wl1hNae9TE0xeCSeZB9NWIbellBAtsFg8z8ycEnMtb7rebcjTMVyaRev2WKd39jpNaUlQORkZkKpIzPYGW6HzGlXNccvHBK6vMUSXSNOok3DpJOpbm4bc7h1K8ZwfO2SUilAbZ07Lo6ZYmm4ujXfsseoVnSvhzuH1TIiYvfZcNlsmqTZWCyiBdSakc+uXpZN45f0hBIMykwfgqGo6ufGkFJPKFsKsse4LXDGAQfIoBO8WmS4c/qsrWGhLH4GKLjlUxAKup1IHC3968J0CwTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJyZjPBYu2epxsSHsbCGqldfnDJGgL4Q6skpZkKYyPg=;
 b=Qudzo8tL8O4aVNUpsSDi/CharGP+yCwHlqVVYJggBRfUaCqJgvDxOduDdpJipu9+xaf6yVQDHdEMDZ+UVuigDGWVw/lFGPQykKCOERhHo08/Jdkg3ZOry06UTXc2gWiNq4UgSJBdeSPwrjMsx8Lhg0VmW1LgxTFLSuIaMjkOCfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB10552.eurprd04.prod.outlook.com (2603:10a6:10:58f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 09:48:30 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 09:48:30 +0000
Message-ID: <7149b6a8-7715-4920-829d-5b416d40fc16@cherry.de>
Date: Mon, 23 Jun 2025 11:48:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: rockchip: add header for RK8XX PMIC
 constants
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Daniel Semkowicz <dse@thaumatec.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
 <20250618-rk8xx-rst-fun-v3-3-081f02d3d348@cherry.de>
 <t3wbjpbw7phqvip4yvxm5kux6hor5pehzamrw6hjv3hq2b3j3n@zuf2vuhgpdpp>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <t3wbjpbw7phqvip4yvxm5kux6hor5pehzamrw6hjv3hq2b3j3n@zuf2vuhgpdpp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF0000452F.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::358) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB10552:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e943c92-190f-4217-6d77-08ddb23b1bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUtNT3ViWldJRHhaSHNlZU9XQk9ITi96Mi9mbU90OW5TZnRRMkJwcExpSWcz?=
 =?utf-8?B?ZVBvS0VIRGsydjdiZVVMQkRpUVFqNVl6dElOdGVXRmsvdVpMbXQ4bXRYbVRj?=
 =?utf-8?B?RkxmOXlxU2ZLc1dVbEwvQ2dlZ0xZQUxKblZDZXhybzBlYUM0Q3l5WUVqV05v?=
 =?utf-8?B?UkNvY0JveElGdWx0OGcySzM3U1FCajZ0MDVhZnExbWxBSjVBV0tkRUFSZGVq?=
 =?utf-8?B?Ny8xdlNpZ0FtSFJXcldKSmpwUGgxR3YzaG9qQk1tNnl1b1VBSHI3ZGpQWDR2?=
 =?utf-8?B?NlJReHlEV3JuWGo3VG1BOGp3ZWJtM3QxVlhEUExDUXZJazg3aU1TTmZidXdm?=
 =?utf-8?B?Zm0rWDFWYkdvZWZIVG41dHAwbkF5RHlmQmtKa3FiOVcyT1UvbGNGZ0phOVdp?=
 =?utf-8?B?N0J6ZmdEWkhzeFNsZlVHbFBXM2w2MzVNWnRzdXRNMXdvWTNXSFUvVXo5R1NT?=
 =?utf-8?B?MnhLSTNyWW1IR1hobS8xM3AyVGUwRGMrdnhsSzJyNlJFbmlGTHE1TTdsRFJY?=
 =?utf-8?B?dzNCaUY4ZXpYa2c2K0F5RFJRakZPZUV0MFVTVEU0NUFJT1FSMlY5LytMZWZG?=
 =?utf-8?B?b0duRFBMS2dwdndqM29iT1BQeS9RWURYOEt2UWhkMFZLbWFjZ2xLT0FQSWR1?=
 =?utf-8?B?VFdiajlLNDY1R0ZZQktzNG1mcGdPVEdLSklqcWQrMHRjQWZvZEJaV3h2VEUy?=
 =?utf-8?B?c3Q0ZmxnQmJkTjNUb242eHNFTjJVR3MvRnlFT2Q1UVFlbnV4Q0t2a0ZHejN6?=
 =?utf-8?B?OUF1Z2QweXZaYmR3czJKaFJwZFg2d2hzN293VE0zNE5OcjdHcGZpU3VXMlgx?=
 =?utf-8?B?NGE1dEx0Vnkydm16YXRRWVFSOVVaY0pvOGRPOXZCaHdJT01OQVdYQWxxUjln?=
 =?utf-8?B?UVFjSFlNTXhxVGluRVBBZHREMXFET0xBSDh6RlZxdHNoVXdkekQ4Yi8raEsy?=
 =?utf-8?B?b0lIY3RHeWFBT1RranRoeWZaenU1OUNVNFlGT3lqTUlwUUdTVm1oWEV2UGdO?=
 =?utf-8?B?YkhvckVRTEFiYy9IaE9MNEVUWGxjaHhMaFV6Q09Ndi9TNGcyZ09CSmViL1Ji?=
 =?utf-8?B?a2JtOEM0S1VSME9BeGhyTHM3VlljaFJ3NUV2dzlNK29ISkd4QjFPOGZ4U0hi?=
 =?utf-8?B?OU54L2dTY2gzcndhcWYySTlHVnhIblZSWFlBMHlzaWtOSnJOaDQrUGZhZnVx?=
 =?utf-8?B?RWFTQk1WdlFDWGlCckhQWUlWMW9ZbDJRL0ZZcXA5M3MwNXkwaFVjbW1YTUp6?=
 =?utf-8?B?NnBlbGJqOXlzd1pJaWhwb1VNN2JUSlVmZGRrME1mc01pSFNlYnIxWjdCOStS?=
 =?utf-8?B?ZkNITS80TmhRTVFROS9SekNDb3VCdDlOb09LWmdZd1IwdGIzM0d2OEFFYVZH?=
 =?utf-8?B?RER1eEM4NThiMmN5bHU4bk5nVUxpaHcwZDJYdWQvbEhOQzM4Nml6ZU1Va1hL?=
 =?utf-8?B?MHd4eUF5Tm1RRGVCcXd4dTlYalZJNUpKQXpIWUR0QWpCVlBySjdZVFZONWdx?=
 =?utf-8?B?SWJiV2lORnhCeGFlbHNHM2MxTE5HcmxQZkpmUUxUZkZyNDVjRmM5TFlXYkh1?=
 =?utf-8?B?VG9ocE13cVdxUUdGYnFvUlZZUFZlS2J0Sm54Nnk1TEdCK3czYTFTUjNsV0Zv?=
 =?utf-8?B?eDI0QzFpN0laeTFtNXpWUUFZSyt5dlpqdnpud0FvZmx0Sk4yTy9zdVI4Y2kr?=
 =?utf-8?B?UFRnR1dRbU52WGhKVzZKWmJrVlVERDh4TW1acDBFNGZaNndyWGpmT0c1ejVm?=
 =?utf-8?B?YmRNYVgzeG1UdEtRNERxY0JPNlNmSndpb2xsajBqdkZ1QVlVWFo1eExFTHBX?=
 =?utf-8?B?ZlVKZ01KOEoybjFwMVRpRmFWOW1TQXlFMXovWnZ1THlPdU91T3QyMmxTUFQ4?=
 =?utf-8?B?ZUV6cWplUC9QaEtYUEU3L3FuYmU5TURSSTl4WEh0akdVcnFHUlZLbmtGQVk0?=
 =?utf-8?Q?3tDbVG6ny6c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2VMSFlTelQyVlJtazFXbzB4RWRXamJtMXZ1WkRqTjgrVyt1dFRwTDFRTkZj?=
 =?utf-8?B?a3dtVWp6ZnIzVGg3d2h4QVFuOEY5Wm9vUDBRSHpCQTVCWWJOKytFb3V4SnZv?=
 =?utf-8?B?cVE3UG1qMFFkZUdDMVpSbkd0RUlidFAzbmoxeHpGYmdNclNQZ1EzQW0vakZl?=
 =?utf-8?B?VHR5dmFqWkxIU0lZdk5JOENFdlQrQ1RRQno5QVN4QnMvSkc2bzg3UzdXRTJa?=
 =?utf-8?B?SHA1SzMvRjJza0ZDaTZ5Um1hNmRDNHRGOHlwZ3ozTVdjL1hHMjZwOXZEalMx?=
 =?utf-8?B?TWJvRDZoMzNQVmU4WWpTNUdmNk4rdGRNY25GODUyNnN6LytQNWd6bXJOUWx2?=
 =?utf-8?B?ZWJkSHRVREJMdFB0RE1wdXRsQndZUVBGT3VHdk5YWDB1aVRWNlNCdWVhamlm?=
 =?utf-8?B?bmdTVTcvV3RsSmNDamN3RmpPcldOL0U4UWZLY3N6Q3BkU2NKR01qSmZEdzN6?=
 =?utf-8?B?MmhqRzh0dUczV1Zmc05YY2tYMEhJUG1SOXR4OFkyTlUrMVMrQzFkem9wK3JS?=
 =?utf-8?B?c2RSSW9UTmRWUDhJNldpVHpFZ3h1ZFpPUkhLNHVlSFNvb01aY0Y1aFR6cTZs?=
 =?utf-8?B?WTRuZ0F2Sko5OTVkVklYZVpmVWRIMmtQN3lnOHVOTXl4andxaHRzckdrK2Iv?=
 =?utf-8?B?d3hCRDVCTFJQeVVudzB2bU5YNlNkQXZxc1UzM3ZUbXl6WTZzMjNmWWhYZHpD?=
 =?utf-8?B?RWVGUmcvZ00vNDRnR1BscHpUaS9mWUtIZGNXT0dLWDRHVU1PUEZWU1VvN3NI?=
 =?utf-8?B?YTBBeUV0T0s1RDJPamtIYm5TQVkyeWVubnBGYVB3ODBsbnh0ZGNjNjBnU2lM?=
 =?utf-8?B?NDJLbHZ5Y1o0T3FrZ0oxelZmTXFHVVFnbFBUQlh4Nm9pZW43VmhXcTRCUENR?=
 =?utf-8?B?Zzdab2xYRFk5OGJtcHdGdEViUmdwZVJqQ3p5Y1RXM01jRDhKM3NIWGNFN1U5?=
 =?utf-8?B?L09jd3l0Yit4Y0xDa1lab0t6RDBYSitsV1JVU3NtcGNuQlp5R25lYUM4eUlZ?=
 =?utf-8?B?cXpvVHhmL0dJd2J6cnp2ZzU2Q1NqbjRZbUk5UHlFbHhnbVFFSEgzWWcyNk1i?=
 =?utf-8?B?UlJBSDdNQkEydHphNnJmbTl0aDdWZkxTaW14T1hPN09RZW1wTVp6eWJRRjFa?=
 =?utf-8?B?YThOQUlxZlVUK2VxVmt0M2NVZTdYTGtUSWh2UTZYV2hobVJLRTNrdWU3WDA2?=
 =?utf-8?B?MjZNd1JqNytWL3YrZEdLSVk4TTBUSnJ3RUEyNGsrK0owcklpM3RPYnZSbFJJ?=
 =?utf-8?B?U0ltc2pkWGd4OXlZdUhIdEhydEFkalRUNnd4QlB5NVU1MjhaWDB5cWllTjhX?=
 =?utf-8?B?SmpIK216NWJvRmNqbTBadUlIc1BhOUd5TkJxWm1XR1JZK1ZJbXpEK2Nremls?=
 =?utf-8?B?OFdaNHJOd2R0cGY4OHc3OTU3anZReVhaQlg2TGxYTmJNWnVZRU5aNzByRHQ0?=
 =?utf-8?B?anV4cWZneGhob0xIYXpMSTZkM1NRQzRNQ3YwMlIrd2RTN1NkSlBPc0hYczdq?=
 =?utf-8?B?aGI4S2JmcjVJNmRHeElqQU8veWI1STl3ZCtsWkxwblhqdFU5a3BmNmpqQ2sx?=
 =?utf-8?B?U2c3TTNsLy94WEUyL01sYVB6VDNLNkJJQUJYcmdCMC9XYkFLYkhMOUNIUkRx?=
 =?utf-8?B?MnlxaVl5L0tWVFhoSkxRRnVDYXJ3VUp3ZGdFa2hVS2RRV2I2eEZIV0wrMk1R?=
 =?utf-8?B?cjhQbmRCSC9UbFFOV2ptYzIrWERKaGFaaHBFMWpaaTZqZktxVExsVGl0ekUr?=
 =?utf-8?B?NVZtbFMzdFd4ZkZDdTBlUFVDem5PTHRsWnBnZm8xMFZkcmVValdnM2lPdXJv?=
 =?utf-8?B?ekxrazBsa2tuMmVVcVFDa09zbE9IeTl3QStuM1ViaWJFeWlicXpTNXEwMm45?=
 =?utf-8?B?U3hiZ3VlallnQ3l4SENkdU1vbWpiUW1lcmpCbkcya0ZrWTBIYjFSdG1RYVd1?=
 =?utf-8?B?OWhMYm0wcGFCZzdmbEFCS3RIYXM5L1l0RzE0ZHhEMTVyVktjb3dVMXRTaVNP?=
 =?utf-8?B?aHNrTzd0Zjc4UFN1d3Y2MDBIbS9XNnlMT0NRaGdnVHBlbndHeDcraEkxdHlz?=
 =?utf-8?B?ekgwVmRqdWcrN00razAzWXQxZndPY1R4bzg5bkhRVnRkbDE3dHEwRFZ2Q1pl?=
 =?utf-8?B?djhrSytyYy80K2xUcUU1QnhRRkwyekJNQmJoR2Uyc3hMc1hqZE5HclB6TjAz?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e943c92-190f-4217-6d77-08ddb23b1bfe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:48:30.0510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0assZxwI/cjvTkeNwKudfoZu7PHWjDPg6G10RMmPlaz0UcuEWIMO7POxpBxX84iRriOM+Ev445kmJfkbV0SDIVpFL9SyfWcr4bfJn20Y4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10552

Hi Sebastian,

On 6/19/25 5:51 PM, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Jun 18, 2025 at 12:32:42PM +0200, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> To make it easier to read the device tree, let's add constants for the
>> rockchip,reset-mode property values that are currently only applicable
>> to RK806 PMIC.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk8xx.h | 18 ++++++++++++++++++
> 
> I think this header should be in include/dt-bindings/, otherwise the

v2 did that and the feedback from dt-binding people was they didn't want 
(as far as I understood) unused constants as ABI[1][2].

[1] 
https://lore.kernel.org/all/704d75df-a484-4da3-9bcb-85b480e2ecf0@kernel.org/
[2] 
https://lore.kernel.org/all/a9baf6b0-b668-4d10-b9de-b63eb3fd8f23@kernel.org/

Cheers,
Quentin
