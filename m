Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106F213F434
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658728; cv=fail; b=fPu0D7ABxbY+coB+pjTWlIrBuYsTWWHFAwd/82DW2iLp0NcjojbY3uq4xNVS+bDheEt9Ayf4EyqRYN87PTccOdDQtvZl/XT1A4XvBqcYLVBu9kfZA2Lxx7SLLRhO6kiALGZEfXW/V6YdkoSZ54ArhWiblW3oxeYp37tm5rK/gLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658728; c=relaxed/simple;
	bh=h/A57Qt5p1XEkdI3EJhPGOyjMabQhyfrFXKsrzR3FlI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rXba7/UYzt0EsFj8YKpnJzIevbODznwnNU6nEI4edsH1ZIZVDhIyvjbKXD3T4lrtfjMtLv3r2XiWWCX3yr9NuLd+tGPBypyi5BFpW57/tEddBKM5jyW7k/OYxZHO3KbzbgZnTxJMTQF8N18AguS8QKbdyxsfFtM5JhfJK6UPxm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Mq+mnOS9; arc=fail smtp.client-ip=40.107.100.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Mq+mnOS9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWRpae9t9/4pv/Mj8c3yTCesmMX4bqtYnxma4uukcoTPD4toWBpZlJ+svIa8bPZzh/NLpmP042dfqgSj7Zv1T8utYRiQZaOACpPEZFe9BZnu/lz5pYAOVawDD6ZCtd3p7DkiKfdH3fGjzcwBhlgh/fCc7gYrYjxWPf9z0vQ6AtXzd/by7QI2hnQNXNhvmxeAIvez6nQODBoeMZW+JCIErPlVmLgJmkdL7l1pgrHgEjNGtfEPEwpPqHwJtuTKyx7VXHR9BvWwU0ziWIdNGCxLlUUSIieFdsajQLp8BHcsn9Bi7jw5yyHIHDnmU03lDyMv6k2AjlKnqns6e91D4smoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/A57Qt5p1XEkdI3EJhPGOyjMabQhyfrFXKsrzR3FlI=;
 b=NTNq4RtUGxPMqIKe6Te1q7Do4u97V2jsjhg5O+u56HNmSJAubu1FjcOBHsygrBzuP+tzWpYgdS/0ydZeCoGyo+yEFBxT0xSWvN7zmgwYH1zcVIrkOBfr+uHbwaTZSB7L9uhW3cq4kbKwqAfnnrdmjcV3rG0mQE8DunjGUGZTvRZ94mAFv3t7CiUI7qdeKW6yPtkDtnAlNfBEj+dj2t8t95cZJFg2XkSkV5Yo2oAG1Cyhc4nV7Ol7SQBcHE47dieRZuPUP+WA3TtV979I4mz2/m07Sm4A/nRrfMD2W3Z0Varh4/hDvtvZhPR4fpyQgBvT3PKRpo+8zvUu7n1wLEOlFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/A57Qt5p1XEkdI3EJhPGOyjMabQhyfrFXKsrzR3FlI=;
 b=Mq+mnOS9kdAHyfzqkNVV9Uq2Hig8NOJZeGiRY2gME8FoHCaCgxi1vYbRMcPZHA4GWIWlwrIkGCJ+92B6iaCHpFDkmLB2TGdq6O862WYQtmGwH6L4+ZqBvNp60t/BKqRvPQY5lCsmcG6kYnSQvXEo6es2V8Cd3VuTtSii7mQoQkU=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 19:25:24 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8632.025; Mon, 14 Apr 2025
 19:25:24 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Brendan Jackman <jackmanb@google.com>, Derek
 Manwaring <derekmn@amazon.com>
Subject: RE: [PATCH v4 13/36] x86/bugs: Restructure spectre_v2 mitigation
Thread-Topic: [PATCH v4 13/36] x86/bugs: Restructure spectre_v2 mitigation
Thread-Index: AQHbqjs+QcdFVo8ub0uzWu0uLa947rOjkWwQ
Date: Mon, 14 Apr 2025 19:25:24 +0000
Message-ID:
 <LV3PR12MB926554E1D48C92AB2FF9CE3D94B32@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-14-david.kaplan@amd.com>
 <pl56rfs34temiqmi5guqcnfivrpc7eeq2435btjimtnhaawj7t@2zqh7eufl34c>
In-Reply-To: <pl56rfs34temiqmi5guqcnfivrpc7eeq2435btjimtnhaawj7t@2zqh7eufl34c>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=8eec483b-8819-4cf5-833f-a02f498e3e30;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-14T19:25:12Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|DS0PR12MB8501:EE_
x-ms-office365-filtering-correlation-id: ca157a18-1ed6-4e53-febf-08dd7b8a1aeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RzZ5Z09mQkJnK0tuR1hXeWFoRnNEUFh3S0tVNTNzM2tFQnN5cHZ6dGxzY3dS?=
 =?utf-8?B?Uk9tUzhoRE5peFF0Z0tKVjNvTUV1Z2Y4RnQ2Z05HWjUwMFpiVVh2Z0owMmJi?=
 =?utf-8?B?UTdwM3FLbDgvYTZiKzZQMXpJVDJvdmVQdDVBMFpFc0FJUHozMXNaQzJpcjhl?=
 =?utf-8?B?cURpWG4yWUhtem9adUZ1T0lLdkE2SXJYY0pVb0RTV1dQUEhWeEU2ZlA5eWpl?=
 =?utf-8?B?UDQ4aWNnS0x0WldMcFFQZklNOE5obzdFYmNWbm9lSUh2MlNoMFlZZGQzNi8w?=
 =?utf-8?B?Ry8xTFY1QTJKcEpSamY5Qm1XRExqUE9ZUHJRR0pSWVMxRVc5TEN1a2w2Q0tr?=
 =?utf-8?B?MmRTV1l3U0QvUXhQSGtpYzNBQXkvU1lCRXVLY1FWOXdzbnNveHV2NHJjR05W?=
 =?utf-8?B?bzNRN3RyL01lTnZSRlU4eWZMS0pCWWpvSnptZjhlRndLZ1FEZy9UVEVNOWtz?=
 =?utf-8?B?YWEyOUFENnc4UlpweDFBLzBPMmc4UmRBNmRQL3B5bUFVVU5MTllmWnh3U1R4?=
 =?utf-8?B?M1VzWWxwRWlZLzFzLzJKZlZPNFFCYjRzbFFqNmZhVUlWMHJMVGg3YTVCdTFY?=
 =?utf-8?B?ckZpVjh4OGJsUmtFVkNXOFQzdkZSWkZxTFo0TzhvbHZma1pzS3RsbGtGMzZI?=
 =?utf-8?B?bUFEZTVLVWxUeGVNbkpyK3ltTWw3a2ZxODNOa056R1lraTQzbzkyY215L1NG?=
 =?utf-8?B?Nm4rVkRDNEZNNWoxdVVXNng4Vjc5djNaSTNFTVE3RnNGdGlJSExFaDVNNmNK?=
 =?utf-8?B?UEY4VU9yY2haVlA0MjlUcjJjemU1a042dlVYOXNpcEpjYWNvbkhPMFlMeWN6?=
 =?utf-8?B?ellFdWlFb0IxL0liVHVwN1JJeTRiZXhHbno1enhtd2RyTDUwb0cwZlc4b3ZY?=
 =?utf-8?B?SXIxNnhPdDF1T2tBcmZQcktyT1JTcElZUmx6bFZ6V0hHbmIvR0NuT2ZOaWhU?=
 =?utf-8?B?VnlEaE9SR3IxRUhXUDQyZERUSmRTUnpkNFQwTTlpdDJnZ1k4ZmEyU0tVK0Fa?=
 =?utf-8?B?WStXK3ZwZlVXWE5sWTYwY3lPNXJuaUcrUUZWNC82UHVYZDFrWHQrMzBROG4w?=
 =?utf-8?B?aU5hV2c4d0Fhenl3eUkvajFXdEpwcFdScnplUGZoeDE4L3NFU0Z5RisxUmF1?=
 =?utf-8?B?SDY3eEV0L25pMnBqUEZDdVNKSnptRXIrVWF6Qm9Qd1c3RkNuYXNoNVlIUnFO?=
 =?utf-8?B?K0o0NDRRWVFqWHFiTytGQy8zTFpoUVpiUHYrVGJYdUFxYVhrbGlQaHpTMGtz?=
 =?utf-8?B?TXo3Nk5DR1Z3ODdHN2xtSXppUDZhQThvN2oxZnh5OCtKSmJJRU5xcHltNFl1?=
 =?utf-8?B?Z0lwdjVONFl1d3NhSnZKTEMwd0RNNWpPYTc4Y2ZzK0dqN0pGYjZNMzFZYTM2?=
 =?utf-8?B?bjhHS1IvMTZoK2ZvR002cDF1SFhqby9EMXJ2M0l0S29XdWZIMkxid3EzRHVX?=
 =?utf-8?B?SFlGWjR5b1lUK292bVF0TExqc1RTQ1N2d0s5bW5aaHFtdjd6MUdYSFlDUnpu?=
 =?utf-8?B?UzBPS25KUGtRSDZTaFlNRXhhNHl0ajNMUUpzNXY1OXJtZXVvNkpxUWV6UUwy?=
 =?utf-8?B?dGlCVXBTay9JNXlkODB0dGpCcmU4RWFOWjRKRHJockVyU1ZpQ3JMblg3bTgv?=
 =?utf-8?B?RUhVVUhhYVBVQlVtSTNja1dOT2prN1AzTUxLOTE2clBsL2d2alNTb0pEcnhY?=
 =?utf-8?B?d2M3OHVyNjNBM3krS0plM1ZNNjFTS0hHT1F2eHhPZ0RLNHByeS9OQmRwTlYr?=
 =?utf-8?B?ZGFlNVZPUWdlQUFDSjdMUFBtZGxVNVpZaytzNmh4b3VZL0ZFanN0YjhWQ3pO?=
 =?utf-8?B?Y2NqU0drUFo5dTBTN3huOXk0OGdib0pNekJ4bnkydkNsOHgrbzhycG15M0Nq?=
 =?utf-8?B?OWJRZVpUdVFFQitCRW9MYUhZZnpvSWJ3a0lqMFR4MkpZZkNLY0NROEJRMFRr?=
 =?utf-8?B?RjNoQ3ZsSVcyNGNGUVErWVNyVkhYQXBTcENnaGtRMTc3dmNkT1VDTHJQd3VD?=
 =?utf-8?B?M1BtNHkxQXZRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFd3a3dPeUF6QWt4ZXhuUjN3MGJHU081MUgrakFrM1ZseWloK1QrZmtjWGs0?=
 =?utf-8?B?MjI5S2VHajdVbXpCS09ZMHRzU2s1cDhTc0pwSVFsWXZrKzIvL2tXQlN6Vmsy?=
 =?utf-8?B?TkE4eXB2dHJXUmNuZmZyczc2cFcwRkU5Wm1Ma0V4ZjVDTDlzRDVxSmpoNEhD?=
 =?utf-8?B?OTFsOXA2SXhoMi9rNzRVK1dNenpsTmdhejk4L01RWmJOUGNvR2h5Nkh0Nzgx?=
 =?utf-8?B?b3A4UjBzUzBnUWp3WlF1Y3BXeGZPSXFKanVQanJ6T2NBcVRuWGplbkJuWE91?=
 =?utf-8?B?a3BtSy9oQWNydG00UGx0VlVCcHpFQVpMaDFqSFd5YTdXL25sRW96amhqODRB?=
 =?utf-8?B?YUNMNWpSd1FjUUVxRWs0TURnZ25hYXZBaGxMTFNydEFJWnNwdWJDQmxQM2ph?=
 =?utf-8?B?UW9id3BPUHh4K1A1bkZYSndtd1pOenBvOHdIMVc2MTBxcmJScEV6RlVFTlBy?=
 =?utf-8?B?WXAyRDZFa3l2SVNXa3dPWFB0QkJIRHBpdFUreEwyMUJlbm0vLzg5dm0rSnVa?=
 =?utf-8?B?bUxGNGlRN2NEbTN6K29YWmRWaWd2SEtpenVmaldyRzVPMnNOSElnUUJZMkJs?=
 =?utf-8?B?VFNzeS8wT2ZlTk41Wmg1N0NLaWhOZTUzNldkWlk3Mk9hK0crNGt0b1ZucFc0?=
 =?utf-8?B?SHJlUExCUFJ4RXQ0U3luWnI3TEt6US93Y3VtNVA1d1VNWEY2MWpwOFZwL1Rh?=
 =?utf-8?B?Y2dhQTV0ZHhYSnovSk1SbFVVMHg3cGNJc0JHelRSOFgxckF6VnhCdkRlMjNy?=
 =?utf-8?B?TmhJb2s1MUw4OWhUYldiSlpJclpTUUpCK24vVkVYdUh5b1NOTE1EaE9nR2VD?=
 =?utf-8?B?eTdtb0FtRFdHcFN4cVB5N3RPR3RlS1JRUmxKUjkrOTRYSTFJU0VBYkoxTmZU?=
 =?utf-8?B?RXFlVXJDWHI1SEpsY0FDRWJnRUpUWXZ3c1lSTjYwRGdydDY5MFBNeFIvT0ls?=
 =?utf-8?B?VU54akZlbWpIV2NaOXFuc240a1RESFZnL2o5TU10U1B0QkVmdmdTdVpCYTFY?=
 =?utf-8?B?S21CS2RrNFNjWXA1T2lFRjhYU2NpMDZXc2NMcEtweWJ0VTdnQkJNSUNKYUZ4?=
 =?utf-8?B?dmVYNEE1TU9WT0x4YndHMmFLVUcxa1NMSTlzWHZ3aWFkVDBiYm00UEpjaWhn?=
 =?utf-8?B?a1YwRjdiY2djcjduWVpybkRUQzZpd1VDckhSb0gveHVvR0VwbDUxSVAzOCtx?=
 =?utf-8?B?bXkzRExINCs5SmlFQy85S0c5TzVNMU1GbC9tUTBQVUt0dmErRmZXa0lUY3Ro?=
 =?utf-8?B?dTVEZ2h3NDBCM3FSa2ZRc1E1OE1DbVFRL3oxMkpYYUMwTTB5c1ZRRnh4VEMz?=
 =?utf-8?B?VHlKbmNWRHVzZ3VybjZoeSs5L01CQkRja21jVDgyZjllWXUza1pCWGJCeDVV?=
 =?utf-8?B?SHMrUCtNKy8zMDdOVlpOM0NvZk9GQ3dmdUw5T1R1OXZnU3JrKzMyZXZ5K1Qv?=
 =?utf-8?B?VjFIN2UyaVU3RFF6S3hKbnQwWVlLVThqWXUwdFJQTENNQ2lGTjc0R0k4S2Na?=
 =?utf-8?B?Y1gwQjd4TVdRd20xWFZIS3hTT1pFdEFBRHFzUGdieVNpcFljK2ROUXNaWnlh?=
 =?utf-8?B?U0M1blZ5RFluN1NHLzNabnZnLzlpMU1EWDU2U0tzeVdpSTRZNlJ3Qk9menda?=
 =?utf-8?B?SkdHK0RpaUFZeWpBNVFjdVVzMmtYVU9NL1pIMExZd1BTZklmMC9KWnoxTzNL?=
 =?utf-8?B?U1Q5QkhYUVF2ajB0dnlDdnRnZWVnQTJhdXJjYjVzQi9USnBZUzRFNmlkVVlW?=
 =?utf-8?B?Y3ZwMGwwOHg3aTF0RFIwd0tNNy9vUEdxZ01lS0dEOE1GaGFSNURYZWxHUGpV?=
 =?utf-8?B?RmdZMG1CSERWTG9aNHJTZHUyMWp6T3l4UE9mNDNuTHlaUm5qWXJYblFuTmhE?=
 =?utf-8?B?TGtCV2VZb3R6ZWRrM1AvcytTWVpkK0ljaEJySys1Q0xIVy9jMUtLRWVOQjNI?=
 =?utf-8?B?VENlQ1pYWXRxMzl2cEszSWNyN1RtYXFWZDlGbXRKTmRZSXZwNDJEdzRMNmkv?=
 =?utf-8?B?UjNZNktnN2d3a3VCZStFT0NJUiszQkpSTVZkNHh4R0tWTGJHN3pJd3ZCb1BF?=
 =?utf-8?B?Z01UdUxaaWVzeTA2VUsxNytkQnpmaTVWa2pIYTk4YWZzTWdKOW84bkcrUTZM?=
 =?utf-8?Q?ErQU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9265.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca157a18-1ed6-4e53-febf-08dd7b8a1aeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 19:25:24.3569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1K4r4u9dbIrABjdxZSRl7PfykJzRCARsRut1Rcq2U9qR7vsJb+dyt0s79Btx3Jwj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIFBvaW1ib2V1ZiA8
anBvaW1ib2VAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDEwLCAyMDI1IDEy
OjA5IFBNDQo+IFRvOiBLYXBsYW4sIERhdmlkIDxEYXZpZC5LYXBsYW5AYW1kLmNvbT4NCj4gQ2M6
IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPjsgQm9yaXNsYXYgUGV0a292IDxi
cEBhbGllbjguZGU+Ow0KPiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+OyBQ
YXdhbiBHdXB0YQ0KPiA8cGF3YW4ua3VtYXIuZ3VwdGFAbGludXguaW50ZWwuY29tPjsgSW5nbyBN
b2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+OyBEYXZlDQo+IEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGlu
dXguaW50ZWwuY29tPjsgeDg2QGtlcm5lbC5vcmc7IEggLiBQZXRlciBBbnZpbg0KPiA8aHBhQHp5
dG9yLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEJyZW5kYW4gSmFja21hbg0K
PiA8amFja21hbmJAZ29vZ2xlLmNvbT47IERlcmVrIE1hbndhcmluZyA8ZGVyZWttbkBhbWF6b24u
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDEzLzM2XSB4ODYvYnVnczogUmVzdHJ1Y3R1
cmUgc3BlY3RyZV92MiBtaXRpZ2F0aW9uDQo+DQo+IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmln
aW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyIGNhdXRpb24NCj4gd2hl
biBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4N
Cj4NCj4gT24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMTE6NDA6MDBBTSAtMDUwMCwgRGF2aWQgS2Fw
bGFuIHdyb3RlOg0KPiA+IFJlc3RydWN0dXJlIHNwZWN0cmVfdjIgdG8gdXNlIHNlbGVjdC91cGRh
dGUvYXBwbHkgZnVuY3Rpb25zIHRvIGNyZWF0ZQ0KPiA+IGNvbnNpc3RlbnQgdnVsbmVyYWJpbGl0
eSBoYW5kbGluZy4NCj4gPg0KPiA+IFRoZSBzcGVjdHJlX3YyIG1pdGlnYXRpb24gbWF5IGJlIHVw
ZGF0ZWQgYmFzZWQgb24gdGhlIHNlbGVjdGVkDQo+ID4gcmV0YmxlZWQgbWl0aWdhdGlvbi4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEthcGxhbiA8ZGF2aWQua2FwbGFuQGFtZC5jb20+
DQo+ID4gLS0tDQo+ID4gIGFyY2gveDg2L2tlcm5lbC9jcHUvYnVncy5jIHwgNzkNCj4gPiArKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NDggaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC94ODYva2VybmVsL2NwdS9idWdzLmMgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L2J1Z3MuYw0K
PiA+IGluZGV4IDk2Y2IyYWM3MDI0NS4uYjRhNzJkZGYxNTljIDEwMDY0NA0KPiA+IC0tLSBhL2Fy
Y2gveDg2L2tlcm5lbC9jcHUvYnVncy5jDQo+ID4gKysrIGIvYXJjaC94ODYva2VybmVsL2NwdS9i
dWdzLmMNCj4gPiBAQCAtNTYsNiArNTYsOCBAQA0KPiA+ICBzdGF0aWMgdm9pZCBfX2luaXQgc3Bl
Y3RyZV92MV9zZWxlY3RfbWl0aWdhdGlvbih2b2lkKTsNCj4gPiAgc3RhdGljIHZvaWQgX19pbml0
IHNwZWN0cmVfdjFfYXBwbHlfbWl0aWdhdGlvbih2b2lkKTsNCj4gPiAgc3RhdGljIHZvaWQgX19p
bml0IHNwZWN0cmVfdjJfc2VsZWN0X21pdGlnYXRpb24odm9pZCk7DQo+ID4gK3N0YXRpYyB2b2lk
IF9faW5pdCBzcGVjdHJlX3YyX3VwZGF0ZV9taXRpZ2F0aW9uKHZvaWQpOw0KPiA+ICtzdGF0aWMg
dm9pZCBfX2luaXQgc3BlY3RyZV92Ml9hcHBseV9taXRpZ2F0aW9uKHZvaWQpOw0KPiA+ICBzdGF0
aWMgdm9pZCBfX2luaXQgcmV0YmxlZWRfc2VsZWN0X21pdGlnYXRpb24odm9pZCk7ICBzdGF0aWMg
dm9pZA0KPiA+IF9faW5pdCByZXRibGVlZF91cGRhdGVfbWl0aWdhdGlvbih2b2lkKTsgIHN0YXRp
YyB2b2lkIF9faW5pdA0KPiA+IHJldGJsZWVkX2FwcGx5X21pdGlnYXRpb24odm9pZCk7IEBAIC0y
MTIsNyArMjE0LDEyIEBAIHZvaWQgX19pbml0DQo+ID4gY3B1X3NlbGVjdF9taXRpZ2F0aW9ucyh2
b2lkKQ0KPiA+ICAgICAgIC8qDQo+ID4gICAgICAgICogQWZ0ZXIgbWl0aWdhdGlvbnMgYXJlIHNl
bGVjdGVkLCBzb21lIG1heSBuZWVkIHRvIHVwZGF0ZSB0aGVpcg0KPiA+ICAgICAgICAqIGNob2lj
ZXMuDQo+ID4gKyAgICAgICoNCj4gPiArICAgICAgKiBOb3RlIHRoYXQgcmV0YmxlZWRfdXBkYXRl
X21pdGlnYXRpb24oKSByZWxpZXMgb24gdGhlIHN0YXRlIHNldCBieQ0KPiA+ICsgICAgICAqIHNw
ZWN0cmVfdjJfdXBkYXRlX21pdGlnYXRpb24oKTsgc3BlY2lmaWNhbGx5IGl0IHdhbnRzIHRvIGtu
b3cgYWJvdXQNCj4gPiArICAgICAgKiBzcGVjdHJlX3YyPWlicnMuDQo+ID4gICAgICAgICovDQo+
ID4gKyAgICAgc3BlY3RyZV92Ml91cGRhdGVfbWl0aWdhdGlvbigpOw0KPiA+ICAgICAgIHJldGJs
ZWVkX3VwZGF0ZV9taXRpZ2F0aW9uKCk7DQo+DQo+IEknZCBzdWdnZXN0IG1vdmluZyB0aGF0IGRl
cGVuZGVuY3kgY29tbWVudCB0byBhYm92ZQ0KPiByZXRibGVlZF91cGRhdGVfbWl0aWdhdG9uKCkg
YW5kIG1ha2luZyBpdCBtb3JlIGNvbmNpc2U6DQo+DQo+ICAgICAgICAgLyoNCj4gICAgICAgICAg
KiBBZnRlciBtaXRpZ2F0aW9ucyBhcmUgc2VsZWN0ZWQsIHNvbWUgbWF5IG5lZWQgdG8gdXBkYXRl
IHRoZWlyDQo+ICAgICAgICAgICogY2hvaWNlcy4NCj4gICAgICAgICAgKi8NCj4gICAgICAgICBz
cGVjdHJlX3YyX3VwZGF0ZV9taXRpZ2F0aW9uKCk7DQo+ICAgICAgICAgLyogcmV0YmxlZWRfdXBk
YXRlX21pdGlnYXRpb24oKSBkZXBlbmRzIG9uIHNwZWN0cmVfdjJfdXBkYXRlX21pdGlnYXRpb24o
KSAqLw0KPiAgICAgICAgIHJldGJsZWVkX3VwZGF0ZV9taXRpZ2F0aW9uKCk7DQo+DQoNCkFjaw0K
DQotLURhdmlkIEthcGxhbg0K
