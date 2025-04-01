Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1491EF378
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743546828; cv=fail; b=QBjeKmS/OjVEys/NfzV3ujafgRe30Egl9iaFZdP9TC7+MLcsImpjwtrtPYRiawZhqBBSBHUGkb7S+pNMsVFwTMmi8R+ASUgJupnNubjj4NIjyV1HWHWSHHzUkwCcOU3V9Vw0pzIHF8pXyf0oBDQtpCuOs2XgBNPtZmbHrGUWi9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743546828; c=relaxed/simple;
	bh=Nlwau7dnKESdba6xNl7XYQtNbeSP7wQ+KCtlik+fraA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AZfyn0C+bDh5ivBXdMnfCQonU6yWEk0xqrNjSiSxZqjKtv2xGQcfCz//XRtBLjpkBhW+DNDEqC6ppmtAuQsCIFuAI/RQBedLEwUcNQHWj2lem+nwBdwDlZsUZd9nTTCbtT2NRQndIFbs+4eThvfP6qgXrR32qJa+QlZdbdB01N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XyzTRoH/; arc=fail smtp.client-ip=40.107.244.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XyzTRoH/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPUrUspxgCS6uRef4x7vtn/tdoyMddixmk0hsRmD+9OEVUjLjp+UerP5Wii1XVZDqCWYwoBKV6Dbvzr/gG5FgMvPSRgqJpUGRhAQoQ0OAqbAsvvAujEGf2sR5uipHJ94U59LIWTPa7fVZXlF3rJkazyqgZaKTLbZVOiFdNGVoaUB17zn7gEJdlo7GB+rV5A/w653LsbFa1LtyiaLKWHTZnJ7eBKMYwsHmcopcgT9AyURaHbKWGd5RQ2n8TlO4t3Gz7gwGdDax8ZPIvgaAFKK7jixIQvxJewfMj2a3QkxHH2vVNHyQ0jY1wkG0lt9HmtT6MuVYs5ePA6pQWukA5krfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nlwau7dnKESdba6xNl7XYQtNbeSP7wQ+KCtlik+fraA=;
 b=YdnreoX+hOcT2Dmg2RTw2jbkUjtXBGClvJLy6h+PtospEu1zsfREJj8YBIiTZpr1/4L+408arazmjobYAD5anUZoGlSR99t5K57csH6hjnBbb8K0YoMLiF17EuksxTMWJnvClY1KAGdc3mWZI390WtCs53/wrqjPaqVKFCounvDvH/TSMvW2p4mPrSzkzcL5I6aMOydrmow/0x1Tpa6LhMfRadZmXh1Pb6+crb2dLlzOZfhbO8czDwogaVgxYe25v124FFELVgLmQvfQ8iQ+weHoupbmF+3W1vTNJlCw6CVieP81RpxiXmBWz2YdJ0y/31dRyEEav4FGcslaM1tJmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nlwau7dnKESdba6xNl7XYQtNbeSP7wQ+KCtlik+fraA=;
 b=XyzTRoH/FjlhqlW/NY/a7rSLOJ8qavIxQMDGg541VsS7cKUrmeTMe39frseDlCN5yt9NEaFY+Qukvt5GyUBGGre3obYxpzD+BU/SrNnweJwWxev4nj830zYMHdCNtXiTtkfhJSj8F1CUIcV9iVELCQA5tyz8ZdetcvC6ndbamR0uc4G08EaHtb/bq5/t6H43SSjDdP05Bc2sc/0wnkUODjaGUHsfevwDIG7I2EXLjcBUWZwvTpDQLuAsTpcj515i2hFV+h12d9YErsoJosyIrfkTET68flYVuCXGJVWozMxYynGN8znSEhSGdK41ZGm2f5NLNyTucUpI2gg4V+Bepg==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by CY8PR12MB8364.namprd12.prod.outlook.com (2603:10b6:930:7f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Tue, 1 Apr
 2025 22:33:43 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 22:33:43 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Yaxiong Tian <iambestgod@qq.com>, "kbusch@kernel.org" <kbusch@kernel.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>, "hch@lst.de" <hch@lst.de>,
	"sagi@grimberg.me" <sagi@grimberg.me>
CC: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yaxiong Tian
	<tianyaxiong@kylinos.cn>
Subject: Re: [PATCH v3 0/3] nvme: Add sysfs interface for APST configuration
 management
Thread-Topic: [PATCH v3 0/3] nvme: Add sysfs interface for APST configuration
 management
Thread-Index: AQHboueSjxNYEVh1k0qAfyRRW6EiG7OPZm4A
Date: Tue, 1 Apr 2025 22:33:43 +0000
Message-ID: <525d312b-0a59-4623-8640-e83a1231e100@nvidia.com>
References: <tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com>
In-Reply-To: <tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|CY8PR12MB8364:EE_
x-ms-office365-filtering-correlation-id: 6ecf81e3-6541-4095-0db2-08dd716d421e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OFNUaS9Hc2t3WXJYZXN5QVhHZG1pZU9DUGxmQmNodkdNV3JSZDFFbEJtN28r?=
 =?utf-8?B?cHBYRTBncHBBODZBcEtJK3ZzYWI1YXI3RWllVkJ1bVlqSlZnQzNnTlJnaUg2?=
 =?utf-8?B?TkZianVWUXRaUVNuc3B1bzF2b1BaZ3VyajhJUFBYSHNiZC9yMDhqN1ZiU0t2?=
 =?utf-8?B?WlZSaEduVkJiRTVZWnk0UGg2QnpnWE1XYjhjY2ZiQ2ppTGRrZXN4MHZoSkt4?=
 =?utf-8?B?KytheXNoc1J4ZFNlenZwZjZjQkN4cVVHMG9CUks2bGxEUDM1bTNWN1NGTXhq?=
 =?utf-8?B?V0EzT3hQaGwrNDBNSWlmUGF2dkR6SkROSHpVemFTSVF3MUFWS2daSVBWMFZk?=
 =?utf-8?B?Nm56SFl5a0ZlOEM4VjNzc0w3clo0SnNUU08xZlJCSEQxWWNGY2F2cE8yNkxw?=
 =?utf-8?B?dXRZWG0zZTZpeHZaU3RJWjk3cGJCTXRHM3h5TE9teDFienh6cHg0aVpQTTRL?=
 =?utf-8?B?WDFwNE90T1BhNHB3MDlnRkdRNWxnbms5ZUpHSzRyNkhpNDd1Vkk3RVRpcWdL?=
 =?utf-8?B?bXNXdjIrUzZHS0QwM2M3QjVCdEJWTFg0Q3ZOd2p3WFlOelRhUWtoQkN5OEll?=
 =?utf-8?B?MUpZRDZGUExKd1JacVJHQ01ybnVpQ2w2RGdXTnhOd0RlTTBqRi9acVczdXRK?=
 =?utf-8?B?N1BmYk5VVFc1dFczNEFNcWtydVZ1bTJQQm40b1F5Q2VaaWxoRGxUTHRoK3cv?=
 =?utf-8?B?WVFSQ1FEVW5qQjRBQjJWNHFyS2pkQWRXd0hUcThFM1daQVV0MFJuUStZQnJU?=
 =?utf-8?B?MFQ0S2U0WTFEcFBiMDV3d085aUhuNWFGZkJWVDlHa0toSXZwUVYvUDI4ODNY?=
 =?utf-8?B?aXk0aUd1dC9DcWVWempLeWV3ckhSL042NHlCVkhqZzZZQUZiRjlnRFc1ZlZF?=
 =?utf-8?B?SnRIS3FGdGxiak56TEY5TE04ZittTXJQUkZJbkcwNW1qY3E1OVpobHNucmJH?=
 =?utf-8?B?MkE1RTdsbmo4bGRlMzMva2NVQ3dVNzlNazIzWi9aRGR1NFVkVzZxMmNRN2ty?=
 =?utf-8?B?a29JelV3Y2FwMXl0VGYzUkpVTnVRTEw1U1A1ZFc5RG1mSjdlcDhickcyNFZt?=
 =?utf-8?B?dkR5cWRlL0ZsU0l4RmZnQzdGclFVRmlLR1pEMytpaHdiMTRzcmpsMkxMRnlh?=
 =?utf-8?B?VHRjTDFUSFN5S3pJUElUZ01HYWplOExrS3JreWVmK1pucjhsU1UvT2t3dk5z?=
 =?utf-8?B?bzRuWERiWUN2MUdUZ3Z3c29NNEtnV0FWQjZzcGwwbmYvMmlRdnR4aHhheGJm?=
 =?utf-8?B?eVhTLzZiQ0dPVkphNkFRSVU5NWZlM3h2bUMrSkxGT3pHWWJTRm9NdlVqQkRG?=
 =?utf-8?B?Mk84bFZPZ01KbHVQM1R0UFlEQlUxZFdFMC95OGpkVXlId2hmcTQrMmY3dGpF?=
 =?utf-8?B?eHRlSFo0eGROVDcvNGVrRDlVd244MU14dzlQS0ZHbm9IZ2xNOW1Mc2pjSUZ5?=
 =?utf-8?B?a0tFQjJlNE4wUXFBMUN3TGd4THBmYkgxak5YOUJPTDQ3clFIVFFVWXEzbXdU?=
 =?utf-8?B?YzdUZndDZ0pSZHppaGoxYzZBb1ZZTm1iQmFPQ2xZMU0rSXpoWEMrVUR2Nmo2?=
 =?utf-8?B?WVFOKzdtQmhBbXpYMTdWMHUrZW5pZGgyTFQrSzlDMDYxN05tYUdEY1A0d2V4?=
 =?utf-8?B?K3lHTmE4RUtpaXRUczR5Mk1NUitKYW9DUTN0cXdMUkZnWkZ2Y3dDNktFY1Aw?=
 =?utf-8?B?SElPRlA4QXBEenhCMnJ4RHBaWVNQdG1iSlVPbzlIdFNDd2xNUzV2blNuRXNN?=
 =?utf-8?B?TmNxTGNtMUgwSXpRVDZON2ZhZ3JEU1FzNTR0WmFWUEVxZm9uNTFTenNJM0dC?=
 =?utf-8?B?bHNnS2VDWGlOZE9KcWlkaUhISTlHTm5rRTI3amZZaG8zSCtRQXlveFI3U1JK?=
 =?utf-8?B?dkQ0SzBLM0pOYWVnYXV5NWkwMlE1TUN4VDV3TEwwRGtrYlFBSlMxM2dCZVQx?=
 =?utf-8?Q?IJYEjmy3hp/Xl4eU5R1intBWcQ8rHjLa?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9404.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGZ6a0Y0V2FCanY4Wm8zSTE0bkEwcWZ2NzN0anowcXY3NFRoWU9CNzRPVlVu?=
 =?utf-8?B?amNxQkpXaVVTcFRrWUgwaEJFY0lFVFF5SlgvMFQvTW1uTmxhdTFVRUhyVzdD?=
 =?utf-8?B?ZjN0dHJCUXVvcnZ0MUI5eTkzN0RKWVNrVUdTRUdVcnpZeEM3RVpiYm5laXM5?=
 =?utf-8?B?SDZld1ArODdBK1BYY1dMY2F4YnNqeVJxb1RJZWRtcjhBajVZajFyak1rQXlo?=
 =?utf-8?B?eEJiWjErNUZkem5UUFU2eG9iNjVrNW1aUGlhdnk1amJDT2JBZlRCVkdkeUhm?=
 =?utf-8?B?eVgxdG1wV2MwUWNuMlBReHR2WGtQZW04VmZEQXVjUGpBaTZSUVNVZUlJSFUw?=
 =?utf-8?B?SS9EamQ4eFhkQVpNajhTNGFuK1NKK1MvMHdFVGRNSGZ0MnFWZU5oRG1VTXlY?=
 =?utf-8?B?ZndjK1Q1bXhMaXNCYkpUTVU4T3BvRkdUQnRieWFIbHpDV3BqdG1KSWd5TlRJ?=
 =?utf-8?B?YldGWFNrUVJHTW5WQUVuZ2pubWNUOUpCRTNiWEtSUUZLY3hQSG9sZDFNWjh1?=
 =?utf-8?B?Tk0yb1dUMnVSY05RMm9ZckdwSkJ3ekkyakk1bWtzUkZmaWdZNUNpQURYa3ZS?=
 =?utf-8?B?TzVJQjh3WEFtYzJvbzNXbDROZmdVR21JOUNvOEdZaVYxSnhSNWNHWk1Ebmda?=
 =?utf-8?B?WmRTY24vTHgzTUZjclRPd3ZKdENKOGxUUGxXUGloTkZzVXNlV3FBaVdhdzJm?=
 =?utf-8?B?d2pkWmtxbTZEM21HZkt0ZVpIZ2NRQWVLQTkzYnkxQmRWblZnNXd6TDlrUC9y?=
 =?utf-8?B?bzN5eWNQcFFhODYrUUsyb2ZJdG5BUTczajVWeitxZEQxd3NjTUhJbEVFZUUw?=
 =?utf-8?B?a3hXM0JGVXpSSU41NzVsd1ZpdEpDWXdDOCtqQUVMdWRYSmo5NFdFRDZBZUpG?=
 =?utf-8?B?WTBIL0duajYxeVk3K0x6dDJVRkQwVUNZeFNEYXVqeHFLOXRRK0JIOTlxdEpE?=
 =?utf-8?B?aDJJa1cxZmRWTlRWQ2lPbUs4R0EzY0htZDlud2dmNTJ4dHFKYS85N0FmcG1s?=
 =?utf-8?B?WktOVnp0WVdyRkVuNVNzY2dDaUFRRWFnODdFQkYxTzVEY3RKN2V5TUNTV0cr?=
 =?utf-8?B?Mm95WEpkR0RjVHlGSSsvL09VL3YrWkhFcFZrUUFNVUVMbERDc2swVTUvMU45?=
 =?utf-8?B?TXZFN0RMcGFiWk04Y1hhU2JKdUxXMXhWZ3ROVUt1VjQ1aXBlRzZybnpCWVdi?=
 =?utf-8?B?NEM0TFJLcTNXSTE5OWgzSHpVTVBVVE90SDRzaVhyU0FISzFKeDhSUlN4aWNQ?=
 =?utf-8?B?WDR5bE9UTzJsYWw5ZUgzMEZDN1I2YmFOS2JkTDlZdDVGbTArZ3FpUzl2S3Fq?=
 =?utf-8?B?N3NBVEtUSTk4akNZSVpsVUVReXlhMWNaaUVKSUE3YTE0MHFqY05MVG91M3lR?=
 =?utf-8?B?dXJkYnNxTG1XT01JMDZiREJmN1VWUmRoVGkyYmpCY0JDTmVsTHBrOGtPZmR5?=
 =?utf-8?B?MDNCcUZhc0FLdktqQWtlellTbm9pV0szZkFtRG11Qmx3ZUZRVmQwd0UydlVk?=
 =?utf-8?B?aTRKeU8wMTNvSko2cTBtc3E1ZCtEK21qVXZWYlhwNWNROXN3dmFwdzBxZjIr?=
 =?utf-8?B?dFZFQ2xwREo5MG40QlpRWmVWT0F1ZnFORUlZMXE5SE1TTW1MZ0pqUXptak5t?=
 =?utf-8?B?TUtkUERISXB2VUh6dXVzcHYzcUJUS21xZS94TkNqbGljdzgwTUtWbTNxRWsr?=
 =?utf-8?B?UGRJVkRodmVNcE1vSEdIL2hjZXNkUjdRWnliYlU1L3lDZEJCUVJXZjVESUVS?=
 =?utf-8?B?aXczN1F2Sm85ejYzMG5hVlRuTE5kQ2MxaVBSOGZOblljc09vN1gzWXRsL1lq?=
 =?utf-8?B?RXphSkoxc29uRDR5elZIMjAzNVNDM1I1WUpTV3N6UDJNRUFNS1BmZThqTWhU?=
 =?utf-8?B?VnJyVE14V2QzMWlJNnpCZ3JQOWNmdk1ReVY3RXZ3b3BlRHBMcVZhaytyMVFO?=
 =?utf-8?B?ZUJBY0dqSDg5cW9nekwvTjBHUlJYVllSUC93bGgwOVlnYVNqcWcva1IrZXRX?=
 =?utf-8?B?MWpzUDlncVpPNXNHWTYxeTQwaElrK3QyL3g1NkRhR0hxc3BydTlRaE9XRSs1?=
 =?utf-8?B?aHd4VkhYKy90MFlOamd3Ujk4aGRGczlmTno3SkhPVTVwZndHaGxXZm9uTGNC?=
 =?utf-8?B?NDdTODFTVXQyaTRMbEp2cHJsNEordE9mTmdtQXlEazU2L1JlcWVWaVhDejZy?=
 =?utf-8?Q?fYpr9V6sLpYCSRMVaodDGMZEErUv4RalpLlLBxPG8hJe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6C2F05A6DB24F46B649BF6FF8428C16@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecf81e3-6541-4095-0db2-08dd716d421e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 22:33:43.1000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iCfgZV5DHD8s0zAMm1Z365Vsl33v9s9TsW30Chagk+NOlaDJtWWujeZFp/k32zr8NWpOpdA0k5p6XXmT0hkOTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8364

T24gNC8xLzI1IDAyOjIyLCBZYXhpb25nIFRpYW4gd3JvdGU6DQo+IEZyb206IFlheGlvbmcgVGlh
bjx0aWFueWF4aW9uZ0BreWxpbm9zLmNuPg0KPg0KPiBUaGlzIHNlcmllcyBlbmhhbmNlcyBOVk1l
IEFQU1QgKEF1dG9ub21vdXMgUG93ZXIgU3RhdGUgVHJhbnNpdGlvbikgc3VwcG9ydCBieToNCj4g
MS4gQWRkaW5nIHdhcm5pbmdzIGZvciBQU1QgdGFibGUgYWxsb2NhdGlvbiBmYWlsdXJlcw0KPiAy
LiBFeHBvc2luZyBBUFNUIHRhYmxlcyB2aWEgc3lzZnMgZm9yIHJ1bnRpbWUgaW5zcGVjdGlvbg0K
PiAzLiBQcm92aWRpbmcgcGVyLWNvbnRyb2xsZXIgc3lzZnMgaW50ZXJmYWNlIGZvciBBUFNUIGNv
bmZpZ3VyYXRpb24NCj4NCj4gVGhlIGNoYW5nZXMgYWxsb3cgYmV0dGVyIHZpc2liaWxpdHkgYW5k
IGNvbnRyb2wgb2YgcG93ZXIgbWFuYWdlbWVudCBzZXR0aW5ncw0KPiB0aHJvdWdoIHVzZXJzcGFj
ZSB0b29scyB3aGlsZSBtYWludGFpbmluZyB0aGUgZXhpc3RpbmcgZnVuY3Rpb25hbGl0eS4NCg0K
DQpGb3IgdGhlIHNlcmllcyBsb29rcyBnb29kLCBJIGJlbGlldmUgaXQgaXMgdGVzdGVkIHdpdGgg
YmxrdGVzdCBhbmQgdGhlcmUgYXJlDQpubyBpc3N1ZXMgLi4uDQoNClJldmlld2VkLWJ5OiBDaGFp
dGFueWEgS3Vsa2FybmkgPGtjaEBudmlkaWEuY29tPg0KDQotY2sNCg0KDQo=
