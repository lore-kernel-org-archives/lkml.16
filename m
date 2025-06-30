Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021114.outbound.protection.outlook.com [52.101.65.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7182878C91;
	Mon, 30 Jun 2025 10:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279557; cv=fail; b=sW0X08BihpDQrjoLuWB42k6GW1uAPJC02mhBnOWg6fYRXqkH20jM+2u3jUcrzZcXOctDP68/53bVMYQuMMdJ5SOOGzKC0j6q317GL3SN0L4fZKLD14IWW/zrsxVgTA/ge8bq5J3CQAsKQA8qM38BKtmCfDJDUh/WBWjYlkYsqmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279557; c=relaxed/simple;
	bh=qkG4EgSjkQ7S8t9UdFR9mo//a4zZnMD6G2hzt5agBKI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B5cRysncvIpr5j48XEOuhqez20TzcyGnuGf36g9w4LXEpMG7sgaFV2IKDYA8OlPs7d9ZDdaKeTjtCIdbE8FtdOYmmWy9U+AINHnBZX/8FqM5bMM0Y/pf9U4FuV2zYiU4CWD7J7v8+XGgE0lRq+4/SNWzpIHYFRwZ4ECrNcC5gtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b=Bo9AEzAj; arc=fail smtp.client-ip=52.101.65.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="Bo9AEzAj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mh6s+gbvZ+WHYi956xpuGVVMWF46zzTrMYMJX8ztGgfwIZVnqYGFDHbH/lfKCBAtpGBu6pXrJ/ylxtVRA6cNeUP1OJPe1kF/3OsrflM4JKKqpm9G4MIuA/PNtRY0JB9H8ScN0Ec3xYWoN212tf/ovOwsaHIU2MoCWLHWo3ntO+eAbm7VuVsH7XMu/Ab6ss9AUPNs4uAuUbkaN4tX61aES0SbMtKYqADCEdn/1C5rF9OLg+yGZP0Q55ew3ylQ4mUO6kHk4LDZgJvXD/7R55Zxtw2D7sM+VFtOqwMdsGlffUl67/44gu7CbEEb7i/evp+LNFbUMRVbYc9S7uk9nqprgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSuDmVicfzD/tG1JesxgmwwoKBosm6yu7gRk4wBoGvU=;
 b=BO0Vzdp//SIIBk4Ym/sKh9Jq1ieczkqt9Uc7BhNtV+lvt8GLqWqeW4n5d+j0d0NC+5S/fRT11tXhmUu3UrV3qnWLCoHzNdsNx/j0fItkiXwV74LsZvoXOicG614O84a4gaOX6WASu8Z/33DmoWB+aBHYv6m9Er+crs+TnSFgBhMPoGnzRy4v7wqYCt+8xA2/4d8OdMm6BGipVA83J5e4SY80F60KesV+6t69nRQ9xA4GcWgsEvVqdRg9JHa9JeAkA5xu7muH4hSa0LPycLNM/YuRkg1CN4WmCCi7+fZ2Iyf8FK2S0VwjE6L/cF0vnT2Ey6MJRS5E/yTey8a/JMV6hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSuDmVicfzD/tG1JesxgmwwoKBosm6yu7gRk4wBoGvU=;
 b=Bo9AEzAjRN8bP/aqPskGo7HR5fBxXai8ozVqaqBDghoC+cptotECnoJeezLEcbrFa/npGn7mQAffIJ8jGcs/LuPdiAnO9XMPKgBoQZYidNv7O7wejvhcr1Vh2ZmUPVeJJZVfdUmHsN0uRK/wR0/iQtrvdruInSUiKvdtSQ97WRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS5PR10MB8204.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:678::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 10:32:32 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%7]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 10:32:32 +0000
Message-ID: <b02055bb-0995-4fd8-99f3-4ca5146eedd4@kontron.de>
Date: Mon, 30 Jun 2025 12:32:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v18 3/7] firmware: imx: add driver for NXP
 EdgeLock Enclave
To: Marco Felsch <m.felsch@pengutronix.de>,
 Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Frank Li <frank.li@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
 <20250619-imx-se-if-v18-3-c98391ba446d@nxp.com>
 <20250625105546.pxuatcnfpe7mssgs@pengutronix.de>
 <AM9PR04MB8604611B8D91B5526C9704E69545A@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <20250627084653.6vgwnm3llf3zknlp@pengutronix.de>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20250627084653.6vgwnm3llf3zknlp@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0349.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::9) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS5PR10MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c887b3-76af-4719-abf5-08ddb7c16b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlBhZzErZ3M0Q1NnYVk5cFR5QUtGT3NUbjJyeFRLT0h5RFozeDFMQlNWbGNz?=
 =?utf-8?B?VmNLMVJZRFh4NGF6TlhML3FKa3VqanVodm9xeDFwb0t4eVZGT0xaN2FLd2lT?=
 =?utf-8?B?aXN4MFdwa0RHOXR1a0R4SmZ1a052T2xONVp0bFlrVHJwRTJtT2lkbml5MlRG?=
 =?utf-8?B?ck1ia0I2MWtxNlNSRkZlcDNEOEJ1RStkejg0bmpaS1lGMlF1UjNOVkUyckhV?=
 =?utf-8?B?QnBsbnVvWmY1S1NQTHNtMERJaG9JN3pmK0dQcUIyRGhmOGd1V3dqd0hmZ244?=
 =?utf-8?B?MitDWVMzR2MvN2h4VDdIeG5rdFF0Q3FJNHRyWFcwL09XeUt6T0ZBbkRudGNv?=
 =?utf-8?B?SnZNSTJyNnlPZHMwbzhqS2c5OXZ3cEt2anViZ0p5cldnVzE5bnQxdHhRS3Ju?=
 =?utf-8?B?OFZEdEV4K1F3dXQ5cGVSTlorMFV5dklya0VHYk5wamFXT2JpRzRQQnpiWVFu?=
 =?utf-8?B?aFV5c1R6Q3k4anVBMlVWN05OKzZ4NklKWDJyQWVSRGNRL1hGVk1wSllLNDRm?=
 =?utf-8?B?V0xCMFd1bWZqbVYzd1FMWnpYVXB3MXlPSHRvdWJZVnU2UTk0N3YzNENaMzJE?=
 =?utf-8?B?OGxVRVZBeUs1OHJYZXNaUThOS05FS2p3QldidnZKZmczWXdqZ3Z0NWNzNVJD?=
 =?utf-8?B?OXp1aE8ySlkrQ21kUENjMUZmMjhhUlRyaHBSVzl6b3JWbXBNbTljWDNBbHJq?=
 =?utf-8?B?a1JGTlZZZ20zazRIQmpMZnMrcWNpRmk5allZL0piUkR2TmJBNVJGNkxhRkM2?=
 =?utf-8?B?Vlc2aHZMZWRQSGswWXBDQ0RVMldpWXFOWSt6MFFnZ0I1bE10OEdZalpEUXpN?=
 =?utf-8?B?SXFudVZaUGUwTS8wMEpSVEhMb0ZSU0txQmxuOXpqdzVoaUdpYndRWTUyVW85?=
 =?utf-8?B?VWNoZ0dwTmFJZFB0Q0pRUUFWUFc4N291aXVNUW5FanRXcDYrQ1NCN3lwZG85?=
 =?utf-8?B?VzYrdndNUWZpK2ZOVTdrbFQ0ckNPUzVzallnUWZsbUtyTzJZTTYyUlUyRG9j?=
 =?utf-8?B?VHlHY1BBWHdyeWVHV0FyYTFVb1duWDhCZzFlQTBjZU5keCs4czVJTGFsNUs4?=
 =?utf-8?B?a3FUTFBuenJsWHpHQTl1OWUwNUs1ZXlsMFEwMU1lcEFZdCtOVzRDOVlsU3NO?=
 =?utf-8?B?NFNJMmhuaUFCWldkemorTXVyUUxCOTNxR2E1MWpCME1ZcmhZUkRodzZqd2Ry?=
 =?utf-8?B?NHpkaFEyb2VhbzNFTWRCK0ZKYktHakpIM0RoYTI4WlA4N3hjdEdqUVZCb1Q1?=
 =?utf-8?B?a0R2MGQ3M1g0QmNRbk1KZ0ZGOWpVMVhoQjdvSkhEUXR2YllkL3BQMzVEY05z?=
 =?utf-8?B?VnBZQWxDVDdiME1jOWFxN3BuVnRmbzFjZlVyN01ERjhIR1B0VHhpdTJDN2JY?=
 =?utf-8?B?MEVJMTVaQ2ZIcXI3M0pFcmFid2RPOEpXOVdEQmlWdGpsQS9hMmlHRnIrS2E3?=
 =?utf-8?B?TUJYV3JlREhhSDc4UHVHdXJodUJaOExTajBJOEhHcGViMjV0ZXVnZXU3Q1Rw?=
 =?utf-8?B?dGhHangyZGNndC9tRkRwY2NpbWxwQml1QzZ3TmpuWUUra3o3VkZYblBMS21l?=
 =?utf-8?B?bzlPeXh6NXgvR1A4UGlFMVQ1dEFieGhnVDgzeUdiTHV6M2VyamwxUDhpS21D?=
 =?utf-8?B?L2U3WjVXemVYeWQ3SjBpRzBmM3BxZmJ1bjdlekpueWhFeTJ0WWphZm1Hc2Y5?=
 =?utf-8?B?eW5XZXlXNWZYSmNORk83bkdIVUJKTWZzNzlsSllwMmNyNlBlSld1d1B5RVN5?=
 =?utf-8?B?cnNaT004ZjNINS9WbVpoaUdPczJnTjFnR2t5SkNoN0R3elFHN2Jid0QwbFhy?=
 =?utf-8?B?WWNtblM2RnoxUWNtVFpoM3RoVXR3clNjZTBXUGNMVXB4TmJPemd5MU43MG4v?=
 =?utf-8?B?aHR5MVl3THFCenFTcDZBaWZZZjAzR0VyeE9pMy9zdmRiQVVUUzdJSm9FTTIv?=
 =?utf-8?Q?/+nQId8P26I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3NSbHROV0xZcjJ4UnUzSTdaeEFZT2U5dnVpTGJIeUNJdG1OL0RIb1Y4TTFy?=
 =?utf-8?B?a3JFa1M4K2JhQkYrb0UyN0lxMkdTSWJOWlBGM3EydHJRN1NDV2xCQmtzU0lr?=
 =?utf-8?B?UFVwVDZlZG9YdEhOa0ZaOU1EaVRNaHJ1aU1sbUx5T0FEWmlwWWhqaUNQb2tG?=
 =?utf-8?B?OUJ2YXFub1haOHRoQVFKcjRXR2d5eGRaSlFIRjZGaHlURExwdVYwb2R2RkRY?=
 =?utf-8?B?NCt3YlhrbnllUjRjVFcyOVY3YXZBVEJnbXBXeVhCM3RycS9Odm9aR25FT3JC?=
 =?utf-8?B?d0JPTGtjL2RYUGtPVkhXV0U1MWhzUzdyOGZLbkVxTk5MRjNkT2JTTjJLYzcr?=
 =?utf-8?B?VWdMdmJsUnZqRUJRR1JkK3FCcWRQL0FQTW8xRlZSSDYvM3NzWVdKNXIzeDYx?=
 =?utf-8?B?cE95UmxjWjVReCsxKzVZWXR3d0hEc0lkaXVxNlJ5WUY5eXVHZkcvazhhN0tD?=
 =?utf-8?B?ZU9HU2RGNVlKSmhkbFduSGhaRjVzRWFiNy9nSWtWZ241cHN1U0RqcERXRjRW?=
 =?utf-8?B?U3pxTkJNbVJnL2M1aFpVTWxxbXdzYTk2ZFpxck5qWGt1cHZrVEdnTmhRK3A2?=
 =?utf-8?B?Z2R2WkJzRng1RzlObnUyNE82QjExZlVScW8zTzRHQ3N1VExQaGVDWm1la2NE?=
 =?utf-8?B?MU0rOFJwWjFVKzRhb3NWYkJ6N3JxWEVld0V1azRCUzVoUzJpVXlNZ0tGdGVN?=
 =?utf-8?B?T2J1V0RhU2cyYnlTWHJhVmYxVzRDUlREaTg1TkRtbStHOTA3dWZDREY2ZTUr?=
 =?utf-8?B?U1VUdUNxMTZ3M1RSZWdRdEF5NldCSFh3bDZRRWNXUis2VDVReW4rb052Ykcz?=
 =?utf-8?B?anZVVTdIVDNUYWRoa1V4UWY4NEhuVy9OQVR0eno0MmZuMG9DVWxQeHVJVWpQ?=
 =?utf-8?B?Ly9YS1pNb3R1RzkyNm9qcUVmTDJUOCt3OUs4czBXOXZZaHdiZDRVZXovYmR1?=
 =?utf-8?B?TlRNbHZScUFpNFdhWjhKdzVPc3dXS01mSW9COUNDYmZNYlVDREk2a293am5i?=
 =?utf-8?B?eGNzL1VhbWRFb1RkN3NjL0RrU0JUT29Ieml0MFhOWkJUODNGaGlicnlaZ2RR?=
 =?utf-8?B?TnU0QmlVQldQYlRDS29uZExjOWVFZWZqZGVPVC9nS2VkZHI3eldrZUhvZFdm?=
 =?utf-8?B?dmQvSDVYUmJ2alZydCtIOU1Fb2xVbllzQnp6cjNYRUs3MTBzd0ptS1NVbUQ1?=
 =?utf-8?B?M2VhUEN5MkRQMlYzUjZsQllDT21qWkd0cGJveDVucnJNS1Z3MlJtN0VSWUJZ?=
 =?utf-8?B?WVJhNzhRT01GdkxqYkZqcDNIeVBSQ3FOWGw2NjkwWUhXUU94M3FtZS85Q3pm?=
 =?utf-8?B?ek8yVU01VW9tU1RrdllmZ3RtYW9qMnp5anoxYmZJSmxNc0RvQTNTbWlRc3BJ?=
 =?utf-8?B?SWQzMVRZckZOSUR2UmNicUIrS3FrTmlxNzFTbTJrVkhBRW9sMkM1L2tmWTA5?=
 =?utf-8?B?MnQvYjdrY01Sc0ZtbTg5ckdoOURNOVY5c0VyeXRoWk1RVVlVd1RSckh3Y2Jz?=
 =?utf-8?B?bktJb0lxTjFCRmdPWmRQYURsUUVDYkJPSHB0d3IvWmx0a3hxSzFlVXBEeXVl?=
 =?utf-8?B?bmc4TG1wUDNaZVZCMTZEOEpnSWczTjVpK3hvNTQyamVLZUV6Mlc4dndlR0N4?=
 =?utf-8?B?czc5ZFpvZEVUeWJBUTBxaHJwc0F2dWVoajBJY2NIM2pTYmg4OGdjNmt0S0k0?=
 =?utf-8?B?Y2JRSURuOU84Z1NQU2hEMlNmL0NKakFjL1NFOTdNazM3ZXNwYTdCMkpzUmhW?=
 =?utf-8?B?cDZDZkRsWFBSaDZUUERZdHJxMkhFeHg2NkdNTTlxU2ZRWnlBek56dEIrSXB6?=
 =?utf-8?B?MXlpeTZvSjhZek1qcG03b2dMRGxsR1hFSzZzU1BtQWZubldyYmsvdnliLzNo?=
 =?utf-8?B?Tk44SXc3Z3RORk5zMnRYMm5KTG5JNjVjUVBxQTE0UnM3MXJKdFBONzVCa3lT?=
 =?utf-8?B?dkF3QmFGaUg1Vlc4cTdUS2dCandHWmVYTk1IakVMSFdmN1NhY1RrRml4N0xQ?=
 =?utf-8?B?aVJJenYzNmwxcW5mQTJvbU5EcDBodjRCakdnOFVNaG1SaEFaQTJJS1I0TFJv?=
 =?utf-8?B?c2lybDd1NllWMFRrZmYzSnFSUGRqRVo3L3hSdkJSU1F6cDBFa0J2VGpZQ1o0?=
 =?utf-8?B?MGZ4NzZFSitVWXJPR0cvSGRYNDlVb3k5MTVtNHZqT1RjSVdjWWVvT1ZORjVv?=
 =?utf-8?B?YXc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c887b3-76af-4719-abf5-08ddb7c16b99
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:32:31.9471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlEZlF/Ybax/f4bC65iWK1I9XDpfQbrhIPZUEvh2scfe7h28Fq54ipSqjEaaOHezBbtDcy6N9/FJ/jF24qF5AGr14FOT1HN3wgzl+sJTDRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8204

Hi Marco,

Am 27.06.25 um 10:46 schrieb Marco Felsch:
> Hi,
> 
> your e-mail configuration mixed my e-mail with your answer, which makes
> it hard to read. Can you please check the quoting next time :)
> 
> On 25-06-27, Pankaj Gupta wrote:
>>>> Add driver for enabling MU based communication interface to
>> secure-enclave.
>>>>
>>>> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are 
>>>> embedded in the SoC to support the features like HSM, SHE & V2X, using 
>>>> message based communication interface.
>>>>
>>>> The secure enclave FW communicates with Linux over single or multiple 
>>>> dedicated messaging unit(MU) based interface(s).
>>>> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
>>
>>> You write single or multiple MUs are possible. I'm aware that the i.MX93
>>> has two MUs one for the secure and one for the non-secure world. But I'm
>>> really concerned about the fact that both MUs can't be used at the same time
>>> from both world:
>>
>> Yes, you are correct.
>>
>> Fix is still work in progress.
> 
> So after ~6 months no fix is available :(
> 
>>> Also how is the secure and non-secure world talking to the ELE if there is
>>> only one MU as you have written?
>>
>> Till the fix is WIP, either Linux or OPTEE can use the ELE, at one point in
>> time.
> 
> That has nothing to do with the fix. The fix is for platforms/SoCs which
> do have 2-MUs, but you also have written that there are platforms with
> only 1-MU.
> 
> This MU can't be shared between secure and non-secure world.
> 
>>> IMHO it makes much more sense to put the complete ELE communication into
>>> (OP-)TEE and let the secure OS taking care of it. All non-secure world
>>> requests are passed via (OP-)TEE to the ELE. This involves:
>>> - eFuse access (done via OP-TEE i.MX specific PTA)
>>> - ELE 23h59m ping (kernel SMC WDG driver, requires OP-TEE watchdog driver)
>>> - HW-RNG (kernel OP-TEE HWRNG driver + OP-TEE HWRNG PTA)
>>
>> There is a dedicated MU "trusted-MU" for OPTEE-OS. The idea to converge to a
> 
> Yes for systems with 2-MUs there is a "trusted-MU" and a
> "non-trusted-MU". As of now, there is no fix available for using both
> MUs at the same time. Furhtermore there are platforms/SoCs with only
> 1-MU, as you have written in your commit message. This 1-MU system can
> have the MU either trusted or non-trusted.
> 
>> single path via OPTEE-OS, is good. But it will impact the performance of the
>> features at Linux side.
> 
> Performance? We are talking about a ping every 23h59m (I still don't
> know if this is a feature or bug), eFuse write/read, and the HW-RNG
> which can seed the Linux PRNG.
> 
>> Since the fix is still WIP. Let's wait till then.
> 
> The fix is for the 2-MUs SoCs but not the 1-MU case.
> 
> I would like to have a system design which doesn't differ too much
> between SoCs which are equipped with the ELE engine.

Do we really want to depend on OP-TEE to be available for having things
like OTP fuse access and HWRNG? Personally I'd like to be able to build
systems with OTP access and HWRNG but without OP-TEE. Requiring OP-TEE
only to make the ELE available to the kernel in cases where the secure
world isn't used for anything else seems to be unnecessarily complex.

Anyway, I see your point of having a single implementation for the ELE
API in the "right" place. But as far as I know other platforms like
STM32MP1 also implement both ways for the HWRNG, secure access via OPTEE
and non-secure access via kernel directly.

Thanks
Frieder
