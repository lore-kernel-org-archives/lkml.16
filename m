Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F001B4247;
	Mon, 16 Jun 2025 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085344; cv=fail; b=MhkA0ejqNhlA/EUIuGzcUP5iWdxfQ5iVImHLCnaAAgHIgdRbMoUUojbmW5ipAcf8hhWfuHnezfOTbykL9o9pI6AoCVjM9AlyoaXDicHFReshCKLCoZbahbRSoBwOX8TyKr2EpgEvcN2/FeMDZrwJv5WJ0KnNSKHn/EDLaUtbJR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085344; c=relaxed/simple;
	bh=72e3h35XlCoFmbd+ytrehNI6zQ9rUXowmVBjJHTfYN4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nB1ewtE1fieR1vahPGI60dwxgmR8eJRrgB0umFApXRteS9tZ4LlxETx6SwFMbQ+C44eieRGPtM9kzp9ONpjJQjkuTrfdY/Wjw4EoA/fK0UWllEoFbWWyg0kNEiUIub35ywVG1/zBnAPdmSnLJpZoCJKZZDcJSbbh0XsRuM/e9oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=NTqdTvyU; arc=fail smtp.client-ip=52.101.69.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="NTqdTvyU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okDqiI8bKBjeUe/qE7TVMUoocQRmPtnkvCZUL0YqbAe8D3uc3DEpKi/swoVMOudnaLuZ04szGEBuQPXahN/r+vcEsIM85QjM6ESrAjFnI1sdwQKEKbQ0OdwA5nT7LzvujS5i1kV/+1G/CUvZPWvhKqXH19KD2FZzfIEuVyUoU+9w4/KKq07ZgQXbbYvb0sDBtxfkFbdWfZngUvvFa0koaYAr6pih2W/atY9Wm4USsGuhGUqEPzGorx6PCd8bYeCW86ZUsGsfv4/o0B7XMJnAKRZFpRRzwLafj5D9y7eiQio8dHjlDf4w28elc3Pq8+YfkStggL6GDTZh7uHKwbQkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72e3h35XlCoFmbd+ytrehNI6zQ9rUXowmVBjJHTfYN4=;
 b=gKVBDH6Kk11+4b9EJyTyQZ5CzpwOKlQGNiI91f5Q4c+FdLRCH8MosH2+BUFXpN8P282LBTPb3bHmPC+184f5BQiJxZpIkiDTOB29DMIecFcSvmU2hHV6xhuE3Tv9UfTduVdoe+L9A2A4ACitNcXG60Sa7GFxkpg3ZdKkt6c69Ah5UJ7pqB09WqpQWWD1ND7tTMi0UKjaOkU2Lg2lGEkvDA3sOYliHoD1XqtFkQcKgXoFu6toLZSPDnDzA2ln3AZktsy1yq/g9mI8rZBaxUT0t/97f6sxNkdSYJv6omoFPTT0e3FStEkzDDXmyVql7EGhYXzXYuxc/BIVJty9IVkliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72e3h35XlCoFmbd+ytrehNI6zQ9rUXowmVBjJHTfYN4=;
 b=NTqdTvyUULPxG0eFjlcacnb2B2+DZX5wRT1PBV64Yk9a0JE0c8bw0VYZnuLv24IpEbxxspE7GItoDLjfghdzuwRlqfVvT1yo9VDLlnJDl0x4aFYTEHOQINAaFHOt+TCdF+ipZwlY4ynA3zqunYQhp2Wtp7j7iACRo5wk4/jB2bzl7RTfa2oJfmOibmqcOXZfzjiLQ5U7p/gMyOa8CU0qrw84sJEYwVLmRXF8qGKFlKHUrD+SQx2uitFU7Mh8sniMUMQarkWd+YztKW0A3/qGPyFWO6j97C9Hr05fApjMcRkDYwSFWL4cdJlnHU+syjO4Bs6c2ImxhzpWOgf3idYr+A==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AS2PR10MB7502.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:592::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 14:48:59 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7615:5a22:34bf:f079]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7615:5a22:34bf:f079%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 14:48:59 +0000
From: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To: Guenter Roeck <linux@roeck-us.net>, "zev@bewilderbeest.net"
	<zev@bewilderbeest.net>, "jdelvare@suse.com" <jdelvare@suse.com>
CC: "Lopes Ivo, Diogo Miguel" <diogo.ivo@siemens.com>, "Kiszka, Jan"
	<jan.kiszka@siemens.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: Question about nct6775 regarding MFD
Thread-Topic: Question about nct6775 regarding MFD
Thread-Index: AQHb3qovOgseGSZJBUWtccrQ59NOv7QFsy0AgAArFIA=
Date: Mon, 16 Jun 2025 14:48:59 +0000
Message-ID: <edff3ca7-b2f8-45fc-adf5-539d25e1de32@siemens.com>
References: <a0164db0-e234-44ac-8584-a14f0b625181@siemens.com>
 <074a2561-1c9b-4138-9ade-bdd1b34825f2@roeck-us.net>
In-Reply-To: <074a2561-1c9b-4138-9ade-bdd1b34825f2@roeck-us.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|AS2PR10MB7502:EE_
x-ms-office365-filtering-correlation-id: 5be92823-9a5e-43cc-b1c8-08ddace4edb9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U0tuSGQvTmtWdm51blZQVmZNNFpKWFlEWUhWeXJYK2VLdnVrcElucnRzSXRq?=
 =?utf-8?B?RUZBMkM0a3lmV0tHL2NBakpFQnozYVJQVnJ5cmpVblVnZmpqT3hybjNQRGs4?=
 =?utf-8?B?bExweUg0ZU1VR2dUSnlWYVBCQ3dLQmVNRks5NGZ0WVBvaHNva21VcGpLeGJN?=
 =?utf-8?B?a1ZUOC8vODNLNGlqL1JnejJ0WGMyNURUUGUrK1IxSDM2eVovMkJVWFc1dUNs?=
 =?utf-8?B?Y1dKNllyNFVTbG9rc3dkMjgvZzlVREwvZDcwVVlEeEdMQUh2Wk9nQ01KS3pm?=
 =?utf-8?B?eFpVdzFTRWxxN2FCM0VBektSbWxUTFgxWVE3bE10UHVRRW9Td05vRStla3RV?=
 =?utf-8?B?TVB2ZENZME9Fc1UrOWV1ZnNhMEg1ZndvTEpvRlZDcWUvREd4V3ZrVzdZdXFt?=
 =?utf-8?B?L05BcHJUcDRUSjRna2dSRElFdElpZ1NQMkx1bmdmZ2hPb240cjFaZmI1aFVK?=
 =?utf-8?B?ZDRFdFhaK3Y4YmhjVjRDUmQ4Tk5CL0JQSnlSY2ExZFhuempHd3R2cVR2a0FD?=
 =?utf-8?B?MmhBNHJMd2s3UVl1Yklta2owNS9TL21jQjlUQkFLQ1VyZEYyUVRxb3B0NE9k?=
 =?utf-8?B?YmtPSiszcGgvZmg1VDVLdUNRTU9zbzBFbC96V2YyM3lXZWFjZW42V2dxWURa?=
 =?utf-8?B?SldkK1JIYlRmZEJOSHlza2RmT0doZU9WVXh1TGdITC95UmkrSW5IcTBqbll6?=
 =?utf-8?B?ZHFkZUkvRXVtMU1PMUJ3RlZTSkk5ang1R1dtV3VOeDQxaUt1ZFlTVUkrZXlU?=
 =?utf-8?B?VGR3a1psVndVZTBYcWNYeGEycWhHZnhLUnQ2NlU2Q2JhdnM4K1NodklNSnU1?=
 =?utf-8?B?eHdQNlJub2w0Wlk4MmxIWFQ3RE1teWtHeElVL1pHRXdaVHEvTTVXZmF2T3Rq?=
 =?utf-8?B?Mk5SNHNuUTYyWFh2RnBkTFlGeGxXWFBvNnZaNjJod1RIZmprdnFBaTBQZWdx?=
 =?utf-8?B?QSsySGFrbE90SFg4QjFFdXFDUHVDdVBrRG1DNFN5bEJFMUh2aDZRdXlmLzV2?=
 =?utf-8?B?aFNUZHFaMHdnUUF0eElCejh1bEdRNUs4dFNjRmRicVM1dFQ5b3BpZFZ6OW5D?=
 =?utf-8?B?OUxqTjNyZmE1alBsUVg2ZEdDeDY2MEFHd3BCNUo3SnQxcHFSLzk2SzBsU01v?=
 =?utf-8?B?M2U3NThqSUZXTGtKdmJXd2RuTitWbVkzN3I1WWIyYU54MFBzWGhTUVp2aHNy?=
 =?utf-8?B?S0VocFNCWmdTdDVjTTNWMHBPZ2hTczZ4MExLSUNOTXR2c1dmR1N4RlZyTk00?=
 =?utf-8?B?S25meUZyUnIyeHhhRXNHVlBsa3U0NzNpZUFKQWQxUUU1TCtOdC9peXhqbVpZ?=
 =?utf-8?B?eEllVGRvZHByYi83dmdZQmVuSVZ2MW14WVVCRGRnaWxRWWRRL2psOUErOGhM?=
 =?utf-8?B?dVN1WWVXUG1nZ0FtRzlFUG9sU1QrOURSM0ZiekV2bzBqTUZXdTlGVFlxdCtI?=
 =?utf-8?B?NVQybVROUnRFYThEWnV2dHFqWWhaaXBuMndTTHE0UGkxVDB5MW5XaVA1azNW?=
 =?utf-8?B?dDNtbkt5bnhVSlZuTkxjZlF4Q05VVHFkcVZlaXpSRC9kdFNna083UEtFUDhI?=
 =?utf-8?B?OHdwU3BGMjhubS9VZEkyMzlUUVhTd0ZzTGliTGVFbUJZNHV2V2Q2bGVraUh6?=
 =?utf-8?B?RVNvanhMd0g0M3ZLWDNYWEZhU25tZEFsKzV4QVBMZFpKVnc2TkRCcmpIeFdu?=
 =?utf-8?B?MEFWQTZ1TkxZLzlaak5wbVg2YTNmYUlLWXAxSlYzTGR4RWRaYWpDMmpiQlQr?=
 =?utf-8?B?L2t6YnBrRFNMUFQzbHMzRHYrOVZHQ2R1emZjaG5lS0VDY2RYYlhrSm1DWFcy?=
 =?utf-8?B?N1VleWU3VlFSYTFmbTFLYjdaRmlINU5qWTJka3FYTXoxRGJ6SmloOFRMUjgx?=
 =?utf-8?B?ZDZ1S3pWeEh2T2F5VlR3bEx1d1dXWldBblJybllyOHNadGNuNFdkUFlBWlBu?=
 =?utf-8?B?YXhYZ2toenlwSTFWQWlPWC9BUldLaGZOTWZqVC9DbjhXbC9RSmJTbG1jUGJk?=
 =?utf-8?B?NVo3RFEvUU9BPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TXFDU3pVN1d2OXdUY3ZpK3JPVFF0cnlraFFMNGkrMytyd0lmME83N0NuanZW?=
 =?utf-8?B?dmd1ZWdPWWp0ZS9hTUhQSmRrbFZRTk1MK25Pb1ZQVk9jZ3Fmc2o2VHhvRGUy?=
 =?utf-8?B?VjIvVnBWNlg1SnlkczdZWXIzVCtrbWxYMFpWSE5wcEUrd1FuOFZnaDVYbURZ?=
 =?utf-8?B?UnBFZ2J4bE44WXh4U1JaMlZsNStVOWZyYk91dVR6TDNqcU9Zb2VadDZBb2lW?=
 =?utf-8?B?eDZIdVZEOW4xNmpqMDZja1QrVkt1WGoyNkMxY2Jya2VQKzVWYVRXT2xkbHlS?=
 =?utf-8?B?SWlJN1VsM3UwSVJUdFQzV2p5ZGgvbXVGQi9RcHNBSFF6Mm92RWVJb1BXbDd6?=
 =?utf-8?B?aloyTGZYeCs3OWxjTS9ETk52NkxsSmxiam1qdUFsdjlCUFRWSXdWczVjMEs4?=
 =?utf-8?B?enR5OUQxeDRzSC9nVWlPTWJYbTJOck5sejlOM1d5cmNMaUh6TzJFSjZKbVlz?=
 =?utf-8?B?M3Z3d3BEOWQ4TWFza1RKNEFZVnhWT1lYQ3JjR1plQThnZXR6RlFvMWd0Q2NB?=
 =?utf-8?B?NlNVaFZmTTMwZkxMdzcrd1dFVmJDYStQSEpUOEdxWjBCTWpWN1BtZTRqY3pZ?=
 =?utf-8?B?VjV2SEdLZytPZWMwdEZRVE4rQ2NxSHFkcU1hQjNXUGkyajR6M2pVeGhCRmVY?=
 =?utf-8?B?RUZyWC90aSswSEFLU3Vqc2llRnVKaXJ6ZTlWaFFLY085cHYvOFl6T09CWCt0?=
 =?utf-8?B?NHBlQzZCelE2dmR0REgxVDBtaGpxeFdaa0U3R3oyTmJjdEUrWkhSRWt4S2dP?=
 =?utf-8?B?dm9GS0NwRitUaVBGcW5HVWhkbkJOQnFaUVo1aUE5UTFveGZzODNCcjF0dGVE?=
 =?utf-8?B?WVNnNGN1RW9BbjA3WEdaNlNpclhNanRxWDVTc3RhdWRjbmhCbVBLdE5xdDhD?=
 =?utf-8?B?N3JRMzVFckR5UTkvdkg1MjF1bVpIYlNReVpZdHFaV1M3SEpzUjlrT0J2V25v?=
 =?utf-8?B?M3YrRytROE01YWpZTzFMTElCeVp0RHZmaTZrVVdkdjhOMTRBR1cybDh0Z1BU?=
 =?utf-8?B?OWdWVnphTDEyeDhnajg1YnNpeDVRZDlmOTJQMkNKR01qaDZqL1ZLWGRFTGRF?=
 =?utf-8?B?MXJDZnUrU09MN0hsVEc5MFI4Yy9xSlBsdjVMR1JnY2l4MmJFTm9uM2Y3TFNk?=
 =?utf-8?B?eDlpYUJTdEhXSmQxU2NwbzkwSHFRWkwxZFZBK3ZVYzVyY05jYXhpQVpPQzBB?=
 =?utf-8?B?M1NsUC8ydlVzWndSWlZoUm02cnNzczFzR1JBRnBjRnE3cXpJSUI3UXZYTnlI?=
 =?utf-8?B?Ukl4OUMrOVB5SFU1aTBnK2xXaEhkY3l1eldEcG10WUtnb0N0emo3NDBKSSs0?=
 =?utf-8?B?Y0RjdXkxcHNIUEdGVFJScjVsK3QzZGZrN1d0QlpMVGJQR0JhZWlWMk5ZVkpT?=
 =?utf-8?B?dGRRQlc4MnUvYmQybTl0VVJqL2dneWh2SWpvK2ZLcVpCYnZUZFlOMzlFUXlQ?=
 =?utf-8?B?UDJRZk94TW9OZ0UyUW9GOEE3WElZbmhPbjJaMVJuTUExUzg0ZEk2TzNMcUda?=
 =?utf-8?B?K09TNVZYVTllZkxYanJNVGYxaGFINVJqVys4Vk8yVVBoYm5HUlFNM28wSm9k?=
 =?utf-8?B?Mkd5NXZmanZuY0htNHhnUzlmRThMUHA5SzFaMENYeUJwYXo2eURadDhyemRp?=
 =?utf-8?B?bWFidE5QMUlrM2tRMzlCZjVkS0d5d2VMU0Fxc1VlUVhjNXBFbnlFYnYzOEd0?=
 =?utf-8?B?VGlnd0FTS2IvWnJrWnFBZ1FRT2hGdHBna1lSVDZqRis5eFIwSTZMUzdMVTJH?=
 =?utf-8?B?TGpxUUZXNGFzRnd5bjZaa29iNmhZV1NOYUVIK3NDRjA5SlplcURPeEIzU01Q?=
 =?utf-8?B?SFByN0dwdnNZQ0JhSkNJK3NIbGdzQWZOdGxhc2wrNUs2ZGRHZmdWVjdoYlJr?=
 =?utf-8?B?dFlGeWcxalhvdkVMYVF2QXcwZi8rRzJyL1YvTDJRcVpTOXZJMTlPQU1XSEls?=
 =?utf-8?B?aWR6enFvRzdJUVdCUm1TazdHdGJZK1VCRUtneFRMYWFHc0Qzd3RJNzI4K3p6?=
 =?utf-8?B?TTB2UWl5RXhkOGlHaVlNcWEvbEpkbC9TU2NnYTVTbDJPRm91ZGVDaDRwOHg3?=
 =?utf-8?B?YkdMemJyY3dORWtLU2NQclQzNjNlQ0tYZ2QxWnVnTUJWQ21YQnpyb2hXaTRj?=
 =?utf-8?B?OFlzTHhYZ0RncExWeUVxZFpja3lTUUkrRm80NXJMR3Q2MlNLWlBMVW5wM2xQ?=
 =?utf-8?B?ekE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA6D24C214560545B404D367C7A43976@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be92823-9a5e-43cc-b1c8-08ddace4edb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 14:48:59.7289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltFCaX+RgM49xk+ghyrqIMiusgTp2xI92YOWLsCnK7UzdmMb3GeGRiomdQFPZ/Spq67z0FmWW/UrvTEXYF/DlMrVtQWQXyqCjPcNRQ0l3aY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7502

T24gMTYuMDYuMjUgMTQ6MTQsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IE9uIDYvMTYvMjUgMDM6
MzQsIE5pZWRlcm1heXIsIEJFTkVESUtUIHdyb3RlOg0KPj4gSGkgZm9sa3MsDQo+Pg0KPj4gd2Ug
YXJlIGN1cnJlbnRseSByZWZhY3RvcmluZyBzb21lIHBhcnRzIG9mIHRoZQ0KPj4gImRyaXZlcnMv
cGxhdGZvcm0veDg2L3NpZW1lbnMvKiIgd2hpY2ggaGFzIHJlZmVyZW5jZXMgdG8gc29tZQ0KPj4N
Cj4+IE51dm90b24gU3VwZXItSS9PIGNoaXBzLiBPbmUgb2YgdGhlbSBpcyB0aGUgbmN0Njc3NS4N
Cj4+DQo+PiBUaGUgZHJpdmVyIGluIHF1ZXN0aW9uIGlzIG5vdCBpbXBsZW1lbnRlZCBhcyBNRkQs
IGV2ZW4gdGhvdWdoIE1GRCB3b3VsZA0KPj4gaGF2ZSBmaXQgcGVyZmVjdGx5IGZvciBpdCAob3Ig
YW0gSSB3cm9uZz8pLg0KPj4NCj4+DQo+PiBNeSBxdWVzdGlvbiBub3c6DQo+Pg0KPj4gV2h5IHdh
c24ndCB0aGUgZHJpdmVyIGltcGxlbWVudGVkIGFzIGFuIE1GRD8gV2FzIE1GRCBkaXNjdXNzZWQg
ZHVyaW5nDQo+PiB5b3VyIHVwc3RyZWFtaW5nLXJlbGF0ZWQgY29udmVyc2F0aW9ucz8NCj4+DQo+
IA0KPiBTdXBlci1JTyBjaGlwcyBoYXZlIGhpc3RvcmljYWxseSBub3QgYmVlbiBpbXBsZW1lbnRl
ZCBhcyBNRkQgc2luY2UgdGhlIA0KPiBmdW5jdGlvbmFsaXR5DQo+IGlzIHdlbGwgc2VwYXJhdGVk
IGV4Y2VwdCBmb3IgY29uZmlndXJhdGlvbiByZWdpc3RlciBhY2Nlc3MsIGFuZCB0aGF0IGlzIA0K
PiB3ZWxsIGhhbmRsZWQNCj4gd2l0aCB0aGUgdmFyaW91cyBzdXBlcmlvX2VudGVyKCkgZnVuY3Rp
b25zIHdoaWNoIHVzZSBhIG11bHRpcGxleGVkIA0KPiBtZW1vcnkgcmVnaW9uDQo+IHRvICh0ZW1w
b3JhcmlseSkgcmVxdWVzdCBjaGlwIGFjY2Vzcy4gSW1wbGVtZW50aW5nIHRob3NlIGRyaXZlcnMg
YXMgTUZEIA0KPiB3b3VsZCBvbmx5DQo+IGFkZCBjb21wbGV4aXR5IHdpdGggbm8gZ2FpbiBvciBi
ZW5lZml0Lg0KPiANCj4gR3VlbnRlcg0KPiANCg0KSGkgR3VlbnRlciwNCg0KdGhhbmtzIGZvciB0
aGUgcXVpY2sgcmVzcG9uc2UuDQoNCk1hZGUgaXQgY2xlYXIgdG8gbWUhDQoNCg0KUmVnYXJkcywN
CkJlbmVkaWt0DQo=
