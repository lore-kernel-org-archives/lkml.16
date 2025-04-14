Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686DE1A5B89
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658465; cv=fail; b=fP/ocAYb2j+j8n3odW2T/QkgxqOJ31Hq0xD3XrXkmzSTEJ1FQ7QqdFdmzUQ65TStwSGgW6gd6UWFo6phAlCdKLIiaVYVKcpgvYpXcqOLxGuabKMHjsnOEgYDaC8oKCqY0A4tV0JwpJ6vPNrPAgJzjtq4WXaduroxsdKV//KhNrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658465; c=relaxed/simple;
	bh=UgZPT75kkCsY9b8Lm8oIxdcS+zHAOuG7FvWjlh2p9Ug=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oxe543pSQVJHGXcE9du0p7J/UVUIn+IkaDpniG1JF7G4pFsu0bXCfKHX+OoSHQxWZvRkJrki2KVj5AgL8N48lErA4HEf4p2IKtQvGKzrGyGFOjNg9gSLl5Zp5bom+WBMart693Ja/K47fjd1YFEXp2SUx2GZByj9goyVh2SNhIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Vz2SDspU; arc=fail smtp.client-ip=40.107.220.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Vz2SDspU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdKzWnoi2hHTTKvi1JVGZ9Lbb207OD0rYyTFX3GDxVi5kO6YZRI9kKTNFxgHQOT20KCB6v1OjpQeJZjf+s4IJypP2mIElXMJNgLziSTpgxc0IFkS+pI4fIjsRao/n1X7PyRp6OSb7IfX4WmSRO/syjqC745u1ZTqOZi7FgTjEPAZCkRS7ee+99eWSTPaTGy+DCD09wpFT8oABrH9+EdxOfV9O1wyDA3XGylgKmMlzkIurYEl2qZkjRcKvC1OReq6EKp5mryrSLBAZg+NwhHk+1bsrRk5o85Mgf/Vh9L3oQmK80ieNht5ILifmInVjPTByJR8pmWl/BUsWIFF5KCqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgZPT75kkCsY9b8Lm8oIxdcS+zHAOuG7FvWjlh2p9Ug=;
 b=Nuwqxo7Bh02SF0iw4YeorqpUieEPmX9vVXPgNt38nfo4idJhnP8mnO8S/fVSA2BuDmXwb0VO52h/dbSPBRm6qRBg2j5rMSjsWFqKlFwwYzaNetosaUOW16WJtJJyjyMXR3F5U5Uu8BYin4w6cT6E3QL4nta20hRAiRhN/76slPfNi+8OE/zBUfsbkj8ipvgnmbB2eqwS5syjPQTSxt2JDHUUv8VEWFu/UPiIXYNwZbS4iuP31oFXeYBDVAaElSD1ePALbq8aXCy9UqCxT5fBWBXAU8OXE5+HTcA6yQBI2ezCYv4I6/vxIz4Iminz0CnXLxn4fCp0Mmzu8QJvXsVRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgZPT75kkCsY9b8Lm8oIxdcS+zHAOuG7FvWjlh2p9Ug=;
 b=Vz2SDspUA9oZXaSdrcxBtJuIDJuOik7qzYf9KY7Wm4nJ6Vsi9nbvkQkyKy7XUqrB6fiHM5lNzGYIrT6qrq5sustxIc1/5nXURPTRURWLiBSQRYz51eHazGOQZ8e6/J+smjo7RKo2Y7iJgiZMxeSzDU9nEv9OROODhVCVTwGpHd0=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by DS0PR12MB7826.namprd12.prod.outlook.com (2603:10b6:8:148::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 19:20:59 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8632.025; Mon, 14 Apr 2025
 19:20:59 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Brendan Jackman <jackmanb@google.com>, Derek
 Manwaring <derekmn@amazon.com>
Subject: RE: [PATCH v4 11/36] x86/bugs: Restructure spectre_v2_user mitigation
Thread-Topic: [PATCH v4 11/36] x86/bugs: Restructure spectre_v2_user
 mitigation
Thread-Index: AQHbqjdc44GkGReAIkKZskuMNLm5L7OjkBmg
Date: Mon, 14 Apr 2025 19:20:59 +0000
Message-ID:
 <LV3PR12MB9265359D4950ADE05B0E181494B32@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-12-david.kaplan@amd.com>
 <pruotxsn2qn5gdxzeiowx4wy75xtlbiarpqyqjt5timl3sui5h@uiareopp3xny>
In-Reply-To: <pruotxsn2qn5gdxzeiowx4wy75xtlbiarpqyqjt5timl3sui5h@uiareopp3xny>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=dd71bc1d-0543-4d7d-b83e-3f143a726eb5;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-14T19:20:21Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|DS0PR12MB7826:EE_
x-ms-office365-filtering-correlation-id: 7fc769f0-c77a-463b-f516-08dd7b897d2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UCsycDE1OGEwdVYrY3ByR2ZpRlgvUUorZC80VHZlUlc0TlVoeGNZdmI4cjVx?=
 =?utf-8?B?TVNlYmtickxwZkhCYVhiaXpYZUl1UG5xVVp6eDZremIrV0NMSU8yd2N4THBG?=
 =?utf-8?B?aUZ6MFBUcE1HVmYvbzdrM2UxSWxKY2pVQzZHM0VoaGdhY2g4QzlPTzhCdUNp?=
 =?utf-8?B?WnRGL0hLdFRnQlFHd1BvdTJGNm5yYTlaZWdUaHlCc0VDTDJNbi8rdFB6citY?=
 =?utf-8?B?VHlQb0F0U2FIWmhDYnZ1cHNDWW1DR1NFSjIyZlBxZVBSaEdReXdHVzRORW1P?=
 =?utf-8?B?TStUNEpsODZIM2ZZV245a2xpZk9NUERyc2dhRXpLV0lKSkdXdUZsa1dBa3Qw?=
 =?utf-8?B?SFdZOEcwTVg1OEhjUDFVajcrbmNYamx1Rk9wdmtwelU5R0dlOTVndmpGSTRo?=
 =?utf-8?B?QWJpbENISVlFWlJ3YXFLNTd0VHBEcjZPV1lnZkM3ZDB6UUh3ZS9UVlZLa0RM?=
 =?utf-8?B?RzBnUkFaVjF1VFBxSVRRNHVTYjFKOGFwdmRHd01qUVhsSGpBMytJVyt0cVpB?=
 =?utf-8?B?ZFZ6Njk4UUJ0TmoxMVVzNU15NWNSRmtGaGJtazQ2WUs3b1NmaEI0TzlFT2NB?=
 =?utf-8?B?UGxwUkI0ZE5ZazlpWDF0aHkwZXdKWENvQ0ZBZTJFTWxrUm0vV2hPNG9qcERw?=
 =?utf-8?B?cU9ncVk3OWZYS29EVHczcUJjR0gwRXU3VzYyN1ZERGxZU2RCd0E1Yk5aeloy?=
 =?utf-8?B?T0h2dnExdjFpS2xpZkhQMHFSTkdsMVBPakE2SkhZazFlYXk1VVYyUjdjZmhu?=
 =?utf-8?B?QUxkeS96R1k4akVUelpJbzU1WFF4K0UxUXVzeURRVDJSM3F0VFBkUVRGLzdh?=
 =?utf-8?B?eHdRWFlhM1hpVXh5bWp6dUR6VXhqbXdSdys3M2NmZjVwU2swdHBpQmN1Yy9R?=
 =?utf-8?B?Zy9lcU1tY2tTVHJaaVdQZ05lTmh0T2dxZ2o3WWpVOEZEcXZNUS9nQWhHZE1X?=
 =?utf-8?B?anJYTG1XQVRGS3dYVG4wNzhqZ0h4aURISUlSempsZHIxYmovYVkvMThMZE5R?=
 =?utf-8?B?aGFpWnBXUURyRnNqa2RUODBtRzE3ZFRUWkIrOG9ORXY1TjBHYzZMK2E4OHpL?=
 =?utf-8?B?cjBpLy94cmJjeisxTkFQbDBQeFNoUC8zdVlZN2p2b1p0RVlpMCt6NGtlMVRH?=
 =?utf-8?B?Uzhic0RaWWhjbTNqQlNsL201MWYxanczS0d5SHhGODJsNFVZUjl0OE16UUx1?=
 =?utf-8?B?cGtpcEtVY2MwMlNJYk1NRGRmQjhQS1UzYUxiMjVUTEY3SCs2bmtGRjJLS1ov?=
 =?utf-8?B?V1hBZE4wQVQxVDA5WDRXNTh6TUl4ZEI1T042VVhGU1lrVjBLVzh0WGRuNC83?=
 =?utf-8?B?TjRSWFJSa2pjaTdOWkhTckUzWVN0OWpQTWsvT0ZiOXJLaWFSZUJrYVZ3ZzNq?=
 =?utf-8?B?bkdIaEZ0cGdjMG13RHBwM1lFZThpTXFzZzk2aVJhMWlSOWl3U0NGVWhuOHBX?=
 =?utf-8?B?OGYrT2ovVE9VZkEzTmI1VWRIQk14MmRMS2I2eTFWOXR5Q3I0WktoN1doZW9v?=
 =?utf-8?B?QWRlWDBabW9aUFNNWGdxT00wOUlmb1l0K0F3eVJOOW0zL3VQalFFUldveGgy?=
 =?utf-8?B?WlZWVmNUcURuQlo5ZzFFTzF3ZzIrQ2ZKWHRyK1FOQXdrTENTZUVrdVFKM2Fw?=
 =?utf-8?B?ZDR1azVjUlV0MXR0MDBjeUFFNGtFcDZRckNVZEhHaHJGcmJCcy84UnVuSXdB?=
 =?utf-8?B?d3hPOHN6VmhmK3ZDRHQzeG5Ra2dlQzlzVzVSazVDOFhIZ2JrQmNSYWY4K0pr?=
 =?utf-8?B?VXpkM2xGMmpsV2ZxU0RyN21WaVNJdW9tZU4zeVJ2WDBESzZNMktZYUpmZHN0?=
 =?utf-8?B?UElQbmd2SjhxUmpkalo2UGV6VExqY1dXRTB1RFRXTC9MOFJmVXVjZkttQ0VU?=
 =?utf-8?B?Ty9XYW1Mb1FXZ01UWUhjYlVOYmo0M0trMzh1RDhzQ2o4ZTBoT3pITldpdVRi?=
 =?utf-8?B?QkdJYXk4UzJXelM2VGxIckU5enZLYklzazliOE9pQmU0T0tRdnlaRmVxNTFw?=
 =?utf-8?B?Tk8wTDI2SmhRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c3hROEZ2WkFZVFM5ZDZwNUZ0NWVVWjdTYWFuWU9yQlROZkZaUWloRE00VWF6?=
 =?utf-8?B?R09mVm9WVERjZXl6c0l1ZFVwRFI5T25uMmtSdmRUNmhMZllpK281dEZJVUcy?=
 =?utf-8?B?SkM5SkhEK0c4bmNCNm96RitPWVZIb0lNVG1aRzYza1NXaVJmQ290bnc0cXpE?=
 =?utf-8?B?RHkzSFpxZjhBc0RYZndwWXgyTkM4aktCaEpsZitvZlV5a0VCZFIzMTJKQWds?=
 =?utf-8?B?bGJWNXpuTithOTFLRVV2S1BUNmg4SlM1dlNLL05VZFVwTk5VS2d0UGxNaWF3?=
 =?utf-8?B?ZHpHa1JqdCtySmN3REFqWS9tUTRpMDVJZjhiRWJpeDlEbFFKSWR0VWZlSXdh?=
 =?utf-8?B?MksvUEJmMlo0clhJTFo5czdzTlJKMXJjUGFRdzNtVFdTalNCa0xub1ExMUVX?=
 =?utf-8?B?dWo4TllkSlVNVldJR1gxRzdDemxYeWJWV0tWRXFHSFdueE9iLzkvL0M2djBr?=
 =?utf-8?B?U2V5SlBqcnUzYWJEYlNRODRyN0FTaUVOTktxeUkwTDA0VEhFbExETUd2bDJD?=
 =?utf-8?B?Zi9HRnp5R3pZV0hidXdHRkZ5K3dDRmhIRjd4NFNtdHFlRWt2dWhtTUhtTDJS?=
 =?utf-8?B?Y291NUdvdzM2SXhNM1NJc3FadDNhTzdVWndSOG1Fakozd0VwMjc1QjdBd29R?=
 =?utf-8?B?UWF3UFZ1bEhMSlp2M1pNbzhKQ3FZV0NIYnFhdVZEdkdoaUxjditTdjFvOWlj?=
 =?utf-8?B?Qk8veDJYTW1raE15eWE2KzYvTFo3c1IzTnJxNlFQN2tJSG8wQXRBSXZOK2Fh?=
 =?utf-8?B?ajRHSHUyaTdzMklyV0g0a1RBTWRPZWhncFh5ZnByWWs3aWhXbDlsTkNVcHdG?=
 =?utf-8?B?bk9KeEppRWpUU0hjT252eG1qTmxvTmtmdHVwNWZLYmY5bjFQc2dTM1FmNjZr?=
 =?utf-8?B?YmJFcjBSNHRROGZLeVh5RXJTMFNFZ3lMQVk4WG1HYlhtWXh1WUFUcjJyTWY0?=
 =?utf-8?B?bU5OWThpRktpTWJCN05VZ0xraEJtTnRQZTJ5dlFQNU1YOWU3RVJ4T2dtRnhu?=
 =?utf-8?B?VFE0eU9nZVZvSERQa0pDaTZRZkJCeENPeHNMSzhxTDdsbURpdnlXb0laV3hK?=
 =?utf-8?B?dmpRcnpXcHhvVzkxSE5DQkN2T3JwV2YwMTQrVlBHRlNDZmtBRnc2SkYyZk45?=
 =?utf-8?B?cE13aTUxaXg3aFhqZ1NDUGF3dEF4MzltMytPYkUvZ3B0NG9lYnloc3IyQjYr?=
 =?utf-8?B?U0JGcXNQNm1HaEVkZXMvV2R1WGNqWTdlckt6VXh1YW5rRi9XWTdLM0RTVllK?=
 =?utf-8?B?b3VmQktMS3VKaGxzQXkzOGUwK3dJR2RPdXNxNEFCTVNWdzErTllPSG9rSW1o?=
 =?utf-8?B?WlFVejd0RStrQmdyQkR1cVFacVU5Ynd0aFZac2tWemhidkNJK25aNXF6M2tL?=
 =?utf-8?B?VS96UzVQaFp0UWhJMDNDOVgvRmlkelNhNzd5MC8xMXlobmUxenJQYWtzOEpV?=
 =?utf-8?B?Y2VCZlpvYVBrT2p0dUJ4d0dvWWVqNHdldmJuY3FQU3ZXQzNZRGVwemhoLzhp?=
 =?utf-8?B?RGtYN1pkOU8wOVVqVi9PNC9Id2FGQTNiaVV5dHRnZ2RibDZtSTdVV05Udld4?=
 =?utf-8?B?cDRlUFlDVHVUWTQwRmhIYTlZK0JObHdHakZkVndHZVJNbTQ0U3B3b3FJK09I?=
 =?utf-8?B?RmJ5TXhieEd0d0RtMUZwOUFlTjRwNmlaMGlGUEtZYS9OSTFqMm9kOFFsc0dX?=
 =?utf-8?B?MldZZVhpR3RyT2VBK1JRcURIamkxSHh0UzU3ZEJTSEdPdGRNcmlmajJFRWc4?=
 =?utf-8?B?b0hnbUx1NEUybzBkSWhxZ1ZHck5UcUExUldCWlNZMlpxZmdNVkZyRURlbjIw?=
 =?utf-8?B?d1ZCczhtSDVQYXl4OGhUVlhiVm5tbnc5TVJXdlNiMkZqeEdMVytJbTZJMWo5?=
 =?utf-8?B?cFR2cExoTFl1aUVOQUU3eDk1SlFtN3BHZUdmeDB3djA1ZjNEVDJCYVlBM0NR?=
 =?utf-8?B?MUUvKyt3MEM5Q2VLa1AwWVpNNHNYQnlyYmxwOWlPNTJwcnBGSmQrSzAxNG8x?=
 =?utf-8?B?d3ZLSDdKSVF3eFozSEZLNDFUME9KTVpNR1hRQTdxd0p1QUN6SGhneGNTTVVj?=
 =?utf-8?B?VjczZy9GaTdTcUtZU2Jvdzh3c1UvZkw0U3JiVjJBYU5jU2hyeDY5aUNnL1lF?=
 =?utf-8?Q?tUzw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc769f0-c77a-463b-f516-08dd7b897d2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 19:20:59.7172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sOgKMtjKjLJHtDYPQLxnyU+tCWk/bwxJj8ynV7qHS5o10PaZKYmFM93k232opoUJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7826

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIFBvaW1ib2V1ZiA8
anBvaW1ib2VAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDEwLCAyMDI1IDEx
OjQxIEFNDQo+IFRvOiBLYXBsYW4sIERhdmlkIDxEYXZpZC5LYXBsYW5AYW1kLmNvbT4NCj4gQ2M6
IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPjsgQm9yaXNsYXYgUGV0a292IDxi
cEBhbGllbjguZGU+Ow0KPiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+OyBQ
YXdhbiBHdXB0YQ0KPiA8cGF3YW4ua3VtYXIuZ3VwdGFAbGludXguaW50ZWwuY29tPjsgSW5nbyBN
b2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+OyBEYXZlDQo+IEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGlu
dXguaW50ZWwuY29tPjsgeDg2QGtlcm5lbC5vcmc7IEggLiBQZXRlciBBbnZpbg0KPiA8aHBhQHp5
dG9yLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEJyZW5kYW4gSmFja21hbg0K
PiA8amFja21hbmJAZ29vZ2xlLmNvbT47IERlcmVrIE1hbndhcmluZyA8ZGVyZWttbkBhbWF6b24u
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDExLzM2XSB4ODYvYnVnczogUmVzdHJ1Y3R1
cmUgc3BlY3RyZV92Ml91c2VyIG1pdGlnYXRpb24NCj4NCj4gQ2F1dGlvbjogVGhpcyBtZXNzYWdl
IG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXIgY2F1dGlvbg0K
PiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5n
Lg0KPg0KPg0KPiBPbiBNb24sIE1hciAxMCwgMjAyNSBhdCAxMTozOTo1OEFNIC0wNTAwLCBEYXZp
ZCBLYXBsYW4gd3JvdGU6DQo+ID4gQEAgLTIxNCw2ICsyMTEsOCBAQCB2b2lkIF9faW5pdCBjcHVf
c2VsZWN0X21pdGlnYXRpb25zKHZvaWQpDQo+ID4gICAgICAgICogY2hvaWNlcy4NCj4gPiAgICAg
ICAgKi8NCj4gPiAgICAgICByZXRibGVlZF91cGRhdGVfbWl0aWdhdGlvbigpOw0KPiA+ICsgICAg
IC8qIHNwZWN0cmVfdjJfdXNlcl91cGRhdGVfbWl0aWdhdGlvbigpIGRlcGVuZHMgb24gcmV0Ymxl
ZWRfbWl0aWdhdGlvbiAqLw0KPiA+ICsgICAgIHNwZWN0cmVfdjJfdXNlcl91cGRhdGVfbWl0aWdh
dGlvbigpOw0KPg0KPiBGdW5jdGlvbiBuYW1lcyBuZWVkIHRyYWlsaW5nIHBhcmVudGhlc2VzOiAi
cmV0YmxlZWRfbWl0aWdhdGlvbigpIg0KPg0KDQpUaGF0IG9uZSBpcyBub3QgYWN0dWFsbHkgYSBm
dW5jdGlvbiBuYW1lLCBpdCdzIHRoZSBuYW1lIG9mIHRoZSBmaWxlLXNjb3BlIHZhcmlhYmxlLg0K
DQotLURhdmlkIEthcGxhbg0K
