Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A951990C7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744657851; cv=fail; b=K1jgZTbovehFoA5DCRtw1BCDVzkmnYtPglRXaTolhjRZtK0iYwOv/8N/UuP1y9sEptqTMSJnzksOrNpQ81YDN3gGNS9cU+wrUQOQMB4eZmk9cbmys7DOjVGpaBIOPC/jSUaP08eylOs4JJtjwulTO16sesRtnRwVackhFqp4cpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744657851; c=relaxed/simple;
	bh=GJxHwhnczwNZ+Z+AzfhQ8zp0MyMeacHMqaOaNLxAe3Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IddZ4XMu6EAYVpWeGmeTm5IjjIV0CNViE1DLG80X13XsKb0hW6AqJaGBOx3/7cyNFcvj0V9g02blvR/ZKu99PvcK6oORbX0E6ddp56VKB0RRLagoxHnyPwJI4HpelFn4lbqdf3pr35fvlcbJATJ+KfICApY2f7Gwfrm1GVf/78k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GSH3nVp3; arc=fail smtp.client-ip=40.107.223.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GSH3nVp3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goOpPraM25SUObQyks5AOQd38YQvabnpbx0DbH0CbXYCRuVojwv266kF4nKPxfF9R96zuAqsnwxat2EE1eA0fhT5SKpjpCRgdH92znZvlXtNnHRfPObzbkkgi03m8isXIJw83mI3dsiz5JX4ow2GZdKvr2/6wTMObK1CFx7pwClLlHds9qZkKFaWOpsPBTazUEoZ2Mv9Jz9M6sO/KdjxH+TdQ3uTV4c7p5/watBHL6dsOkCHWIRmkJhXXbogiDdd3fNQUFASDjjvNm8nPM4pbZAdwt5vPKEpoIr/RomzkPq5ONi7MXyB8aT0wUMwF/MqGqzm0WN83AOb6L8r7r1/ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJxHwhnczwNZ+Z+AzfhQ8zp0MyMeacHMqaOaNLxAe3Y=;
 b=UijM0L/URH7q3n7ZYFblLCnt/cq0Bi6QD6otYf6wvWvTSIEXCl8ogDxKu/QktCMMgwPflCiEljUWUKAQra6oEEEHhHMOZr2helH749hBcGV2T7lP5928MQMI+PahHeVVaqWS1KamXymslRiyPycfJa6wY0t1A48cNitFuJjQkW4VTqCP+swhPIKvtBgOXui82cLOjQ4S7ibYzNKiGb1cJQJm62mJs6DDgFkv3zElxF3+5s3hCJMh4Te2H2vCqAtO2WY5TWMnOwPUynwmtwXbNP0ejlMA3jKMmxf9QMGHa4tclbW/HtdI4J/81ysuxDrpBT81WmIpo54W0LV0MF2XNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJxHwhnczwNZ+Z+AzfhQ8zp0MyMeacHMqaOaNLxAe3Y=;
 b=GSH3nVp3uvKPd3gzIOwdgeq8/ma7M0SWXdkOtFI9s3sDq9mYwZPRThB0hdx4lVfCytFTL9UR/PO65R/CQSMmKjmJRl2BeLdzkjn/79VdzBSiEphLh84HUZ9OwOF48uCxA/zK4Bpx1TdVhz8jzdIewEoICvxTHZVIkae/8Pqp+4g=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by SN7PR12MB7833.namprd12.prod.outlook.com (2603:10b6:806:344::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 19:10:47 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8632.025; Mon, 14 Apr 2025
 19:10:46 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Brendan Jackman <jackmanb@google.com>, Derek
 Manwaring <derekmn@amazon.com>
Subject: RE: [PATCH v4 04/36] x86/bugs: Restructure rfds mitigation
Thread-Topic: [PATCH v4 04/36] x86/bugs: Restructure rfds mitigation
Thread-Index: AQHbqjUTcL4YHs9lp0aZJBI8ktP6IbOjjVHg
Date: Mon, 14 Apr 2025 19:10:46 +0000
Message-ID:
 <LV3PR12MB92656DCE365B8F955AB1072A94B32@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-5-david.kaplan@amd.com>
 <h7p644ejmyef2x6jau7wonbqufrtknyifza5ey2fjmz3bqfvas@xh5olvfqktg5>
In-Reply-To: <h7p644ejmyef2x6jau7wonbqufrtknyifza5ey2fjmz3bqfvas@xh5olvfqktg5>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=aabe7476-b116-4ec3-bb24-c8dfc76337ad;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-14T19:10:20Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|SN7PR12MB7833:EE_
x-ms-office365-filtering-correlation-id: d1f6822a-f1be-4bac-7566-08dd7b880fe8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N25WVHozZ2Q0citWZG9zN3YzWkdEVngrL0FmZGVuWVNPTTZ5VDFSWTROeXc5?=
 =?utf-8?B?K1c5Z3dJVElxK3NPMUFwZnpYMEp1KzVXTlBNWHRuQjAvaEdhY2EyeVNnZ2Nk?=
 =?utf-8?B?WlN2N2lrZUo1elJBK051YjlXNkJGT05EWTBRL3Bvd2ljSkFrWFpxbzJOZUl6?=
 =?utf-8?B?emhyT1JJckptQmVQbUlkTENndjFEcE1wZ1RXYzMyemhaeG8vbUk1ajF0L3Vr?=
 =?utf-8?B?cXVZZGtMUTl1Ymw0WGJETTZIWjhlL1UvZGgxRlJKMHVKQjZUeTRJU3ZHUEpP?=
 =?utf-8?B?T1R0clM4UHZGQXd6V1hRWVF2MVBzdURwcmxQOXp6S2p4QUUxaWZacG90a3RS?=
 =?utf-8?B?U29jM25IVldPbm5LNnlpVytHNGRQYkVEN2E0SDRrdlpnN2pKZ1pEdVFFSHhz?=
 =?utf-8?B?MW9JZEhmd1M1WS9yUkx4VHl6R3VwL1NNK3hvRG1oaGxGMTJkbGlJdUgzbjJt?=
 =?utf-8?B?eC9wQ1ZuQXV2WVQzaW15azU2S3NOYUVNeFpod0xrR21Bc05IOXB4c0J3RDRz?=
 =?utf-8?B?UVFJV2VVOFU1YTNQQUV3RzNmakVONVphQ1VQcjVTQWpIaG5aaG9ub09qQjBz?=
 =?utf-8?B?Vms2Znp0VDlRU3RsQVFSZWJYUnE2L2NBQXhsT3QrdWZmTmJsamQ4U0VzNnpI?=
 =?utf-8?B?WEdNUVJlNEhpd3dYL3pyeVZ5WXBJZWpwcDBNTFYwTzVKTW83d2tHZHBvaUMr?=
 =?utf-8?B?ZGpWeW01TDVOSjJ4TUVGcHU5eng0NlZMaWMvOEM3RUhvVFZ0alpxOUM4NmlG?=
 =?utf-8?B?WVB4REtYeVFXamtBYUN3UzMwSzlBYVA3bEx3R1RHVG44azJ6aGtMMFhtTFl5?=
 =?utf-8?B?L2RHRkpjNE1rSnYrOHJjQitkeit3SG03ZDFncm4rVkdtZzFEV2c1c2l5QVJD?=
 =?utf-8?B?RkpLM0xoSTBJTzd5SHg4cElUY0hsSENDVTUyTWlvQ2JOaTdkV3ZDZG1XeVdI?=
 =?utf-8?B?dUZzdncrcUFYNlh4UGU1WTlIenpEMW8va0FuTUxQY0JDM052WCtlbEVIWStL?=
 =?utf-8?B?SUxGZEdTNHcrMDRCVE12TWhaQlcwK3pzZHFndnpqOTBrdHZWU1NaTWpZMmRH?=
 =?utf-8?B?VXNtWEUxbDJmNDd4blZLbGg1cU5ocCthVGs1UEZXSThyREgva0lOemxrSzV0?=
 =?utf-8?B?S1doRHhZOGRQNDhGSGtGaWEvUk85MElwMUdvWkdjWnJrbjAyWUJQWWNrMThv?=
 =?utf-8?B?cG1VWXBFWE5GU29wK1JPWU9VRVh5cDhhNUN3UHRVZkkvWk13ZzR5Q0Noaytr?=
 =?utf-8?B?S3ZBcjBHVkhxV0trK0JIQm9SVmJ3QW5udEI4bm00ZGliMUpWV1ZpNWVpM21L?=
 =?utf-8?B?aGJoa2RVVlI4V1pRNHJvekVtck9pd3BvRDU3ek9EVTNBY1ROQ09ZRk54cEgy?=
 =?utf-8?B?ZGxNZkhHOTg5eUQ2S0hkQkIrUjhrNm1Wci9MUG9pZjRONUEwZTlXSk1pM3ht?=
 =?utf-8?B?ejU4ck9PaWZIR1pqSXlLYy9ncVJFamppY1IwcytxSXIxTUJqdDFYYkhjSkU1?=
 =?utf-8?B?TzFtdWhMK0hyVmE0K0FDSTVBazM1ejRweThSTDJUNHVDcjMzMW5rU2d3Qjl6?=
 =?utf-8?B?Sis2SWMrZHJoTmZoSFF4OGZDRDNNcGhFcDVBOEVaem04TWRGeFloUjhpWXhn?=
 =?utf-8?B?NFo1RDUyd3hwaFNaZDl0VlkrcUt2cytWSHE2UzlEbnRMV1ZGRGhnckdLVExr?=
 =?utf-8?B?bENVNU5jYnJaNVNLa3VaUlhnRFpnSGN6Z1o5Si9UMHlJRnhPUE55Ukt5VVVO?=
 =?utf-8?B?WFROdnN1LzdDZGlFOWRUUFJ6QlVpUmZMSXVNdDBDbmxvK1dlWHl0RmVzR0R1?=
 =?utf-8?B?VUNJS0NmVUwyUWRzWEhqeUFIUEJGU1BhTlRNQ1NRUHFqWmNMR2FMdG15VG42?=
 =?utf-8?B?VU0yT0pmd3ZMWnBQTEd1d1EvcW81bjJDN0hGN1FWVm1zQ2U0U25DcnNYOW1T?=
 =?utf-8?B?bkRBTjhwZTdZK0h5cTRQZWthTlB2UTJHeVNlbWY2MlErT0xCNjZpTHEvQ09E?=
 =?utf-8?B?RGxaVWw5b1FnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3o0UUFTcFZ0U2ltSVp1UFVrdkJjVmtkU1VNWmxIdVJsUm1MK0JFVlA1ZHEv?=
 =?utf-8?B?Z255TmhnMzNtS0JYb2FiOFdqQUpWVG5nSzFrWjhwR2pDS2ZtakJGdUpscC80?=
 =?utf-8?B?bWZqN0NMV2pTTU1IL3Z5cytpS2RJVEdpMEU5bDVlY0cxdzQzQkl1eThOeCt3?=
 =?utf-8?B?RDlXZU1qc1RZWnl2SStjWXdCWW5idEhqM3R2S0lrcWJ0S21GTGlTeVV2UFlB?=
 =?utf-8?B?dVBSM3F5dDU0YUxhbG5wbEUvbFVaMWlPdld1YWFIRHNPVEZyTUFNQVltNDZx?=
 =?utf-8?B?VkNJSjRra0o5SXFXNWZRK1NleWZLdjhYcUhENWNqbnN4WEtCeVpZaE5RVng1?=
 =?utf-8?B?UHJncjY0RDFjL01oVkZiS0xYTW5BMHlTQUREUnZsQlVON29HMkxjTm4yYmJV?=
 =?utf-8?B?aEFWSzFMNlhhV0NRRk1adjhYTTdKOUlQWm9qSEppU2xEcVJCeERuMGtXVi8z?=
 =?utf-8?B?aXZVbHNVbVdXVXJpOVEyWERzSEs4bUR5SG9kL0RWVmxBWVlTMlVYQWFGTzVE?=
 =?utf-8?B?TFBYNGxkMUdFYXFUYTdna0hJSzBnYm5wNkM4RzBxN0RlQVlwejhPWGZjbGdG?=
 =?utf-8?B?cGJrUUNVeWxqUmZEanM4V01RYWpwdkw3RDFudnRSYm9ZWlpzWWZYSEZFcmxO?=
 =?utf-8?B?UFgrN1FLNDhKdE5HdGlUY3V4ZkVwY093REgzMmUvbHFudzRPRUlOdm8zNnJj?=
 =?utf-8?B?d2YycUZpZm5ENndEY3ZGbDcrbzZ1aUZZeG5hMVpDTTRyUFNzaHk0RUR6L1hm?=
 =?utf-8?B?MlE3M1hhSHg3SGoyOXljQ3ZuZ3hXTnJ6Y0ZYTDZhTXF5ZXREL0JMSzVRaXpX?=
 =?utf-8?B?M0hNT3E1QlFLdU4raDdXQUM3cVVXNUl3NlBpQVMyaHU3U1VqMGxQYkU2djhL?=
 =?utf-8?B?TmhMTXdhcUIrYkNEb1RNZko0VmtSdGlLeDNLbFA3RFZQZGVpZ2ZPWEY4dE51?=
 =?utf-8?B?UTBWMExDbENUS2ppekZ6S3R1aXVKc0hGVmVtS1dOemlvSkRpdzRaVm9vOHpC?=
 =?utf-8?B?aUUzOTJmQmhsbHFZMjhxWUtrRzlYVFVUb1J6Rm5zckpDLzUxY3MvNFN6Rk55?=
 =?utf-8?B?ZFRWV0JyVUhhVW0xdGRlQWtEa252MFUrUm5pVFo5Q3k0ejk1N0dNdHc1MXdX?=
 =?utf-8?B?czhaMVpDUXdIU1FqcFJiUGxleVV6ZFJndzBkVUpNaU82c2ZRdmNiQkYyUFVE?=
 =?utf-8?B?UDdBY25MeFlMTXdLUHYxN2RwVWFkQXg3LzBCMW5CeVRObFIvQ093QnRwalFH?=
 =?utf-8?B?Y1NTNDJSSXpBSjVONVlZQ2pmWUQ2UE5UYzFZTWxCMXlCeUhsZ2NJUW13Qng1?=
 =?utf-8?B?a0dBTm1DVUIyRCt6WG5tMFI1ZHpPdjNOcEJYalNkT1poNGw3T1J2OEttMVUz?=
 =?utf-8?B?QTA3Y0xXU09FWFVEN0JtODkvTzZOaFMyYUVGRmc5OGo1Z2JYUS9pSUVrT2V5?=
 =?utf-8?B?dnVNSmV0Z0JpMnVMbkZ6VDFYNUxVMmtaeU9LNE4wUmtkMFJJUEpURkRDNHk0?=
 =?utf-8?B?ZzROTFF1bEFCT0wrbW1BUjE0WnlhMEs5WFRYWUZRTzZkcWoyOTZYVTJiMGRP?=
 =?utf-8?B?OElCZWZCdGwyZHdpT2tQS01ycFBxMEd0aWw3RHUySFhVT1ZpQ1FYRHcxaFlz?=
 =?utf-8?B?OWJ2NW1XK0xLNUU0OEhJVDhINmRsV3hWVUh2ZTR1Z3JIT05lL0ROY2VKbjBV?=
 =?utf-8?B?UDJRQjFDNVZZTktadzYxV0lSVWVCc3hSVy9SUk9VcmlZb1JycElZSUVCbkgv?=
 =?utf-8?B?aVBpS0l1YXJieWlEVUpvMzkyUmYxT0dYOTh3dlltWW1WeDA3TDd3Q2xHSEUx?=
 =?utf-8?B?Y1JGNTRRQjJMRnhSbEhtYTVPSGd0MXk1N0ZlYWhIYUIveTVQd1NWMXUzTkc4?=
 =?utf-8?B?cVp1WVFNSW5INnU3TkFGZWl0NlU1bTFYS1FVV1M3UE90STB3dTFkV3l6Vktu?=
 =?utf-8?B?WEY4eEFCaU5TWC9PcGkyUEtuMHowUjFZL0JzLzNsSUdVQkxBVU95NFpJaXJo?=
 =?utf-8?B?dEF5YU5FSXVnengxUTRBbEJRVENNVjQyRHppcVU4VGttY2FjZDhYcDZ1dDFU?=
 =?utf-8?B?eGdtK1lqMUI1QTdzUGs4WitYbk4xR1ltNWdwNUd3VUtRTGY3aUd3eW1RSTY3?=
 =?utf-8?Q?DpUI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f6822a-f1be-4bac-7566-08dd7b880fe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 19:10:46.8910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fEiQIUOYz3DeEkz2soNqMmqrrdDfoKBINDiWWC1wQ1nXvUgvhw307fTwK2xoA2Db
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7833

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIFBvaW1ib2V1ZiA8
anBvaW1ib2VAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDEwLCAyMDI1IDEx
OjI1IEFNDQo+IFRvOiBLYXBsYW4sIERhdmlkIDxEYXZpZC5LYXBsYW5AYW1kLmNvbT4NCj4gQ2M6
IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPjsgQm9yaXNsYXYgUGV0a292IDxi
cEBhbGllbjguZGU+Ow0KPiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+OyBQ
YXdhbiBHdXB0YQ0KPiA8cGF3YW4ua3VtYXIuZ3VwdGFAbGludXguaW50ZWwuY29tPjsgSW5nbyBN
b2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+OyBEYXZlDQo+IEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGlu
dXguaW50ZWwuY29tPjsgeDg2QGtlcm5lbC5vcmc7IEggLiBQZXRlciBBbnZpbg0KPiA8aHBhQHp5
dG9yLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEJyZW5kYW4gSmFja21hbg0K
PiA8amFja21hbmJAZ29vZ2xlLmNvbT47IERlcmVrIE1hbndhcmluZyA8ZGVyZWttbkBhbWF6b24u
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDA0LzM2XSB4ODYvYnVnczogUmVzdHJ1Y3R1
cmUgcmZkcyBtaXRpZ2F0aW9uDQo+DQo+IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVk
IGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyIGNhdXRpb24NCj4gd2hlbiBvcGVu
aW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4NCj4NCj4g
T24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMTE6Mzk6NTFBTSAtMDUwMCwgRGF2aWQgS2FwbGFuIHdy
b3RlOg0KPiA+ICBzdGF0aWMgdm9pZCBfX2luaXQgcmZkc19zZWxlY3RfbWl0aWdhdGlvbih2b2lk
KSAgew0KPiA+ICAgICAgIGlmICghYm9vdF9jcHVfaGFzX2J1ZyhYODZfQlVHX1JGRFMpIHx8IGNw
dV9taXRpZ2F0aW9uc19vZmYoKSkgew0KPiA+ICAgICAgICAgICAgICAgcmZkc19taXRpZ2F0aW9u
ID0gUkZEU19NSVRJR0FUSU9OX09GRjsNCj4gPiAgICAgICAgICAgICAgIHJldHVybjsNCj4gPiAg
ICAgICB9DQo+ID4gLSAgICAgaWYgKHJmZHNfbWl0aWdhdGlvbiA9PSBSRkRTX01JVElHQVRJT05f
T0ZGKQ0KPiA+IC0gICAgICAgICAgICAgcmV0dXJuOw0KPg0KPiBUaGUgcmVtb3ZhbCBvZiB0aGlz
IFJGRFNfTUlUSUdBVElPTl9PRkYgY2hlY2sgY2FuIGNhdXNlDQo+IHZlcndfbWl0aWdhdGlvbl9z
ZWxlY3RlZCB0byBnZXQgd3JvbmdseSBlbmFibGVkIGJlbG93IGlmIGl0IHdhcw0KPiBSRkRTX01J
VElHQVRJT05fT0ZGIHRvIGJlZ2luIHdpdGguDQo+DQo+IEkgdGhpbmsgaXQncyBvbmx5IGEgYmlz
ZWN0aW9uIGlzc3VlLCB0aGF0IGdldHMgcmUtYWRkZWQgbGF0ZXIgd2l0aA0KPiAieDg2L2J1Z3M6
IEFkZCBhdHRhY2sgdmVjdG9yIGNvbnRyb2xzIGZvciByZmRzIi4NCj4NCg0KQWgsIGdvb2QgY2F0
Y2guICBXaWxsIGZpeC4NCg0KVGhhbmtzIC0tRGF2aWQgS2FwbGFuDQo=
