Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2139.outbound.protection.outlook.com [40.107.20.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1AC2040A8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275189; cv=fail; b=udXyyZ1AtqSGi0H0s/bNSpwbuL9xkSQ38TXN3tDMcY1pRMolF5efXBoUfoCsUNZ1RU8jlDBfTWRc5Ml+VIy+0rQfM5zoCEmd0IW2wrlj18KSNDiJCo0eITxqRQClxzDuYcUV2zwW1wyJQ3nU9yy60jskFEyNW8ngLso7Hf2c+yY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275189; c=relaxed/simple;
	bh=TfQCXpgMHBQ5cOb0gs0LCEnZrYN0OQA9CZj9WsQ7SXI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Fcmv06UhvR03m0pFfMeyqE5PLDRA5W8wby9a0F5oOtc9zWBJ9jMjwGU4fJBLp+EGTAyJlwlRvSz7J2vEaoHX41FTaJY0jWbkSs5D6i0gB81OxgkD0xrsM9Rpnt1UzVp7BpNMyEGEQacIEc1bBFNTlJwVMh8Tpcwt/xGhHJnLWzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=FN4wST11; arc=fail smtp.client-ip=40.107.20.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="FN4wST11"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7pbwxW7F01/xEnniEcEhD3bXmZMnghjWV5V128Q5k9U/abqiAvXNMVkuvGnIi0YGgmN4seSmY+qNMpZm/fkDFpYN11aSk+2dBWZ/5+FYso0v8sVN+y1+8Zt0UjA/K1h1R2WlXE0byVpQCcX/EIuh/6zSpDqHwy89qVBuAmkvxOeT2cck2jdNJHqUEjd3glloDp13Iv8i8zgW/TJv1ArrRMNcznC28kErnrANJNsc9WKZFNZO+1HY5Db/+lwqg8i+K5z55CW6nf9c0NFlEu8NXN5FK+qC64PeW5ooMMecG60fcov9oAQQTiJ4tVO+Xfh7sMotmHsZdPGcN3KB73hDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfQCXpgMHBQ5cOb0gs0LCEnZrYN0OQA9CZj9WsQ7SXI=;
 b=FtPCPEmmc3wAU4kgfewyidlrv1oyIDtpGwRfqsYcd59Znl15lmOMygTjp6AhGUvgTMoRE7a3Ca31YP996MgA/tZK5DEcV3in6SjOKZK8pcYSVN9farLHjP22MrwX3GZEYVqjWqYr46sxJmMxRnFnkx1KYsho3ItqZhrkxRvzBVVNmdDTwWJcW/KVhXnk9p/0AS+CMJI1L+dTs9A87YJB2xGC5oLaWyW0likYghhFHfueoEph94ru3Hna0l0eVCajop6z9xrRuUZoJ80GJZplTOhBVNuAfzvYhDfLT9m/PEbcimwABT+D7rm+Aq24Im0ZKu2KFdSePkZfwZ4hC9hSlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfQCXpgMHBQ5cOb0gs0LCEnZrYN0OQA9CZj9WsQ7SXI=;
 b=FN4wST112PyCpzpqWS4upmftmdyGbJm6AWqV+DE9GqD/zQadfFD92qM8b8ecDEgvxnLongNbDR+gwaqon57uYOrOjYuWd5mnep8Hj9cz1uc5OtO5KFUyw04q77RbFDgVX1xw5CL64ujtQM3ncf4c1+Rh0WVQ1uUgmdsfMSw6/eZvD6n7Yn2xu8OFKh+J2zB0AI2emTV/hgMdIt5fWKy7Bp78jZG4s8kXr3e0xNhPhp/JfAAe/+kEjbzxxoiAAcL686vzwwXnKEn4Gk+Hs5QoT0CHk8cJXjPpsVW64c+U1zAlIi4Ro7dE6gzAbdOgumyTv8jSeBhf15K7nzDG/XePFA==
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com (2603:10a6:10:47f::9)
 by PA3PR09MB7960.eurprd09.prod.outlook.com (2603:10a6:102:4b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 08:53:05 +0000
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95]) by DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 08:53:05 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>
CC: "arikalo@gmail.com" <arikalo@gmail.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"Dragan.Mladjenovic@syrmia.com" <Dragan.Mladjenovic@syrmia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Access time mmio instead of rdtime.
Thread-Topic: [PATCH] riscv: Access time mmio instead of rdtime.
Thread-Index: AQHbWHAplWwM/I5kv0OkDCB7QxW6B7L9VlyAgDu+2oCAYtf5OoABTd0A
Date: Thu, 10 Apr 2025 08:53:05 +0000
Message-ID: <30f60428-920e-4861-835a-722d80bae8d2@htecgroup.com>
References: <20241229-cogwheel-kebab-3cc2b21096c8@spud>
 <mhng-2dc5552b-3c35-4469-b511-3c6dc257b610@palmer-ri-x1c9>
 <AS4PR09MB65189D22F46A6A6CF73325A5F7B42@AS4PR09MB6518.eurprd09.prod.outlook.com>
In-Reply-To:
 <AS4PR09MB65189D22F46A6A6CF73325A5F7B42@AS4PR09MB6518.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR09MB6196:EE_|PA3PR09MB7960:EE_
x-ms-office365-filtering-correlation-id: 27b1559d-9791-4e6b-8a48-08dd780d1bbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?emN4aXJoWnQ4M1RNMmI2LzVvc0M1NDYrcmRSSUJCbGYrYXJRMkFwa3BEOEsy?=
 =?utf-8?B?NFRGb2ZIVjI2dTB4bnYyRG9yblpmY0pGKzU2RmRBOGxPbFExNWVHR1ZWMWtT?=
 =?utf-8?B?NWxBZW1UYnVBeXdjMFRQQ0ROTTRPWUFMRjRJZFptNWI1VXJKR1BCQ0ZHN2I1?=
 =?utf-8?B?Y1k0Zmt6OE51bkkvK2NhdFdaWGhHQ2RXS2ZVZ3I0REp4VE9DcTNnQUcxV1Bl?=
 =?utf-8?B?aXp5ZGZ3UnZpQUdwQ25ZS0IwWURWSlN4aEQwRHk5TDlrcUJIWWZFMjBKM3k5?=
 =?utf-8?B?ZEx4bU1KZmtHRVJDNzQ0ODY2S1dhanF5YlAyTmFvZ3ZVRlZBZER0aU9Bb2JL?=
 =?utf-8?B?SWUzTzJ2MStqZmg2WmRHanQ5M29JajNvVzVjYkViUWc4QVI4NUxabVU1cWYv?=
 =?utf-8?B?My9HTFB4a0JsbzdVS2lMNnhYMkxCTGFlVnpkRFBsZHk0U0V2N3NBbVZFMmxw?=
 =?utf-8?B?SUZMeFA3TW0za2lKa2EwRmlzVFlQQmdOa0ovaGNic29zeDV3L0hMeTA3d20y?=
 =?utf-8?B?eDhwNnFWQTZza0RLMWhmVTY5bW9qN1owSjQwMGZsYlFtMGEvVjJsTk5sL1BV?=
 =?utf-8?B?K1pxVUJydHYwZUdlOXJBTVc5bHdzM2Y0WDQyWWw2aXFQMm9RL2lhOFp3NG0z?=
 =?utf-8?B?akFoUW5pS1JxZ3FpcU85OGhFbHd6cWw3RHVUN2F2TWFFRXpCci9sSkwwWTBK?=
 =?utf-8?B?YmxndS9tc0JaUjVndjJyV2c3N3BlYTk2YkxCNjEyMXdLUDkzRjFtUFVTNDZo?=
 =?utf-8?B?TE5yaEdHdUVUNjcrMWpvdzJiVmI3V1BodkI2NjBiN2d1dTFOV3drUUdnRjFK?=
 =?utf-8?B?bndYZmRCZE5PaURsMXU5YXpJOWNJUDNHVGZQb2owNlh1dTM0eWl1UUJkRWY5?=
 =?utf-8?B?QlpjeHZJSFRwdDkrQ1ZLSTduY2dkN09iMXBDbHVIQWwybVZBQjdOaHc1dUN1?=
 =?utf-8?B?RGMxblFHTlh6WEU3REVZditoMlkrckJjOTRON3ZXa05JeVIxTEs4N0lIMUt4?=
 =?utf-8?B?K3RiVWxOc2ZuQVB0dUU3MmR5K1FFbTlpRFFEdEdlMjNyY3BhNlE0azNHbjhn?=
 =?utf-8?B?WnpIUitoQTRyVHZFK0ZSS3UrR05jS01pQ2NSczBaeXZvUlZZd0RIR1dLWE8r?=
 =?utf-8?B?RzYvRkx4Njk0WVNMMVZOTTFwQUloS2IySjlXSGU1eVFQTHkyMHZwZzlGYlBj?=
 =?utf-8?B?RlhrWVBzSFNNL2hyS0RudUJlaEZZVitIaFltSXpGL0tqRldUMnhkbUhEZVRU?=
 =?utf-8?B?SjgrSnAvQ2duSXZXY2UvWmp0dDdSZGFsWkhQdUpzY2Q2c29WYUQrdFo4dEpt?=
 =?utf-8?B?SmwyQ2VYWFZJN0pPRGx0RzZ2bk03RkkxcmFBQ21RUnpxMndObmlZUnI1Q3h2?=
 =?utf-8?B?dHBnSDB1aEVxZHN1emRRRkxPNTlJQnRMU3NQOHV0NTFEMlNZeTVDaWppTmVR?=
 =?utf-8?B?VFpBb2JVbDkvRitsYUhKWmVtUk10N2ErNTF6c20wQkxhUVVGNHgrNmlEVnZR?=
 =?utf-8?B?Q1IxUGluYlA3UDRqRllHSFJzOVdHT3g3eWhlSUpZZkZTLzB2eTlsYTJ2U2ly?=
 =?utf-8?B?TXBaOCtxclpsbFdtc0xLMDR6Qy9JdUlrRUJ6SUlHcGkwSzJwQ0JDYWQwemJJ?=
 =?utf-8?B?eXRSeFNoQjRNNGRiRWE0YzdSNmpNVm5CSjNDV1N4K2Raa2psamNXUWZ1OEZv?=
 =?utf-8?B?TGJoelNSazVJSWRXYnpHTkdnM1gxQmJLMXNacGJodHNzb21VRmRUV1pZSUN1?=
 =?utf-8?B?a1daL3R3dnhqSXh0cW1Dd0MwS3A4bzI1N2ZDcGlLb2ZySlBDZU1YbGN1WFpF?=
 =?utf-8?B?RHBVMEVBVjVhSVQwNGhxbzVLU3F5Y3R1RFhaSFUxZU10NFBiQnFQZnFvZWZ4?=
 =?utf-8?B?c3VydGwzbTFLQWp4WFJVRFV1OEFyZ0s3ZWs3cUlVcHhXWWpOSUJxWkxCZjUy?=
 =?utf-8?B?MlQ2RVhEMC9NWndjVk9rRjFqRW1FdlJpSFJnOVY5SGVRRGM5UFF6T3EwRTAv?=
 =?utf-8?Q?k+Lhei/FDhFalJAgs2Z9s4TY9hLp4c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR09MB6196.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZmJpR21lbldJRjJ3QXd0MmdwVlZYSzNmKzQ1T05NTTQyeUx6Z3AwSjBaK2ZG?=
 =?utf-8?B?cWdKWTRMRGtKb084OFFCcXdPbGc0Yk9JRmtVeDUyNVdwVllZNGphRGhVOHhz?=
 =?utf-8?B?WjRha2ZCTHpCek5WMTg0Qk5VY2xwTDRQREh6VVhqd3orUy9SWWJnWDVHTWNX?=
 =?utf-8?B?eDk1emNhc2NzOWZzNlhLT2lpaFJGb2VlS0V0TnExRUM1Y3UvRVd5QVg3OVRJ?=
 =?utf-8?B?UzBhT2tnYTBVeUFOZHRnSnNrUUk3blZodjllMVQrdWZ5NUxoZFV1QTkxYWdT?=
 =?utf-8?B?TjVBKzlPNzFHQVR6b2hwTHhlbWlraGwyTUc3TWpHTFB4K3VBUXBNSWJ5eXFO?=
 =?utf-8?B?SU55V01SN2JNdkowVkMwR3B6SFNQdjRUSEdhc1hGcFJjNEhQc1RHU0U0NktC?=
 =?utf-8?B?ekNEODV2SmlUdGJQelB4ZmttRnJPUTJTRm1zWkJ4ZG4zay9lNTNxZC9wUzVs?=
 =?utf-8?B?STdyT3EyYUhiZDVQZDB5em8rNWc4Z296Tnd4aGRDblZpRWJuRVRienFKLyt0?=
 =?utf-8?B?eldLcGpOS294RkgwWEQ1TXd2ZTBMSlE2U25ONFVNOERWSkVjK2pjZkdlOU1k?=
 =?utf-8?B?TENjZWZpdElPUTV1MkFTeUZFSE9neDJERHFITUpVRHY3ZC9kaStmdlBZc1RS?=
 =?utf-8?B?SWZydHlMQWpzSTZTenpIQ240SEE1NUg2bWpLM0Z4b2Iwc2N6RVJyVXloZzFw?=
 =?utf-8?B?YTVEK25VY3RTQW5HSjFxSDFicFVidmI2UVBQa1NEaEJRTzhGd1NpN3pMZlB2?=
 =?utf-8?B?cDFhQXFwMWZOYmhaWlpDM0RrRGgxK21iYm5nd2JMRFpSa0drRWduSFhSekZm?=
 =?utf-8?B?VGp6OHd0THdmcmJ5cXk1clBaRmo0QzUxbUEzK2ZEM2wrUXFXQnZGcTU2VFNS?=
 =?utf-8?B?TEw2NUMzdkFYNHJQeG96OFU1UjIvNC9ZcWMxNmtiak5KY1lqc24rcXZxRzhv?=
 =?utf-8?B?YnBsMTRhaFA2TGQwU3BGL3V4V1MwTGQ1SGJBMDhFNHZOVVQxZ000eTR5MHhK?=
 =?utf-8?B?RUlUeGYwemN6MEZHYTdUT3pUc1Myb01jQWdmYVQyV3VhaHBzdVJ3dEVjQmVz?=
 =?utf-8?B?S0hFUloyZDBIK2JsbEdnZmV6dW1lQmgvS0UzUlBlT1BPdG5pRHFXRER5UldG?=
 =?utf-8?B?bGl3YUlpYWM4MEsyRWtzdjloRStoaVQxc2dzbkNka2tkb1RwQ2RCYVJPdERI?=
 =?utf-8?B?ZU1ERTlsanBPUE5ZdmZjakxJWDVyUmd4Z0p5c1ZVS1lQbDRwd05Ma3UzWUdw?=
 =?utf-8?B?QlJ5SjRJWHkyb0UybDk3aG0vb0dzUEVCMnVaUWpJaW5YZkpCK2EzaVorNkJ4?=
 =?utf-8?B?aUJEaUlQTm16enViM0kvS296aERZNmo2UUlSeVgrd3hEVXp0dnYvMmYwV2FS?=
 =?utf-8?B?Tm1ndFEvVU1NSklYU09XekY1MDFVQ0xjYmVGQk5JaUJEcEV5SHV4M3M0ZU92?=
 =?utf-8?B?UXM4SFNWWndOQit5eWc3K25GdEt0TCtOM0xUMCtYTHJpWGs0OHZhY1FOTXB5?=
 =?utf-8?B?TEJPNG1jQmJOZzN6emU3WndESzV3WHJCNDdXMUNydGVRenljVHp3ZUIrdDlK?=
 =?utf-8?B?dUFPVlpHZ3BjUWk3anFZakp5cS9GWEZScEdia3JpUE9GdCt4SFVZdml0TVBu?=
 =?utf-8?B?MTA2eldZUE1FNjUySUlRd0NrbkNaUGt0c0dVN2E4MHdKNXJMRWh6QWZ2eW9C?=
 =?utf-8?B?K3VXSStHV2R3SENVL1FIU2tZakZMZ1VVNkhrZHpqeDZoTE1SeWVRYW5jYkJU?=
 =?utf-8?B?WWdhNjlPUzFPTTFGU3NZU2ovc1NBdHVlOTc3UHFGVFRRbGhJS3AvNXFOdml1?=
 =?utf-8?B?Y0dJLzJBZGQ3dzlWb0R2aGdaQkVFSWlCU28zM1NFWGV2d2llR3VWQ1diVzIw?=
 =?utf-8?B?a1VjZ1B0TEJzdUVIY0tVdGN2NEFiajlmaW1BWHdyaE5iZHR2dWRFVzVNZTdF?=
 =?utf-8?B?VUVNMnh1NmU4ekRtQUFEb0szTWRCcEVTRjl4b29rOC9SY1M4UTZZd0FsYjl6?=
 =?utf-8?B?VTJiNkdKYURoSy9FLzhkZDlrTC9FLzJIbGg3RXdwSnc3Y24xQUNObnZ1NFpt?=
 =?utf-8?B?aFA0RWFCOEJ4SThMc2oyQjdpaUpjUnhTYmsrQk5ML1poajBoRGdEV01seUNP?=
 =?utf-8?B?cHViZnNSUjRCZFNiUlRlMmZRcE5UNVp2YzVvMVhMVlJDaDNlRUVyK3pUMzlF?=
 =?utf-8?Q?deUk0eUch6ZFiSrpMh9Z2iY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <586B50131F6DD147A8D85C67FE79504B@eurprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR09MB6196.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b1559d-9791-4e6b-8a48-08dd780d1bbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 08:53:05.1350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h4NVDD6NZv9WdMEOMjmM50x0bG2FbY2U6h2ugJcaVTvQSxtw1OjJ9SK02uszRlnWWTHhMc++4/QVBudtmLlhwcQ86R+LII1SiJy8SoMeaSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR09MB7960

SGksDQoNClRoZSBuZXcgcGF0Y2ggdmVyc2lvbiBjYW4gYmUgZm91bmQgaGVyZToNCg0KaHR0cDov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDQwOTE0MzgxNi4xNTgwMi0xLWFsZWtz
YS5wYXVub3ZpY0BodGVjZ3JvdXAuY29tLw0KDQpLaW5kIHJlZ2FyZHMsDQpBbGVrc2EgUGF1bm92
aWMNCg==
