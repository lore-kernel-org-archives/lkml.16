Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7D5264609
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220662; cv=fail; b=bT1vUyqS1jmKsH7GyxDXhTcFRo4lfbvTsB2JYZ73MVbWzUTycf2ilVOjLug/0eqCydPmnsqY9QY5t+D7U5lnFjKj+NvFuAIAUlLJwEmWX55ON78hYY/1FY60MyqdoGoRiEBKyRRdOuwvVhNw/4dA7EXzMkx9FWNS3b90f4P2sVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220662; c=relaxed/simple;
	bh=k3dJ79dRVTe8Q9ZgaJSdv+A0U1n5Ec1Tf7HwhHDOUp8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=an6RoHs0Vps3cpV9lhB3KTyS9aZfmFS8BYX40cpW30175WVo+H83KI8x0F3M3hTkaOmuDS1L9U6Kwzg408iFoUm/rUSPMzdnKpzhQ2KM1gL1TnOBcKO4Z3tTeIXXYXTAS/0pbZ6O8P+v2EFxJVO4lx76jcLsHE5zyqg/LmqKHIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bnnTQwto; arc=fail smtp.client-ip=40.107.223.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bnnTQwto"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOT/vsn/RzI7F6q62eo040M9iLm2Gz89wHGYQVdpymi1ZIceW1cMg/vQ18kOSnhN0AnqmW5uW8/rE9zce1A4a2NRM8JSVhJBXlegvwaTI66v3sgEvHWazcMTqoYc+q1c5TVdUgadzjKWMjeyR/g3w3pegppJOD4IOwrKHPppPMl/lEjNQWgG87uAi4z87/PbW2kq9fvFwUhAe8ClvPXMNjiOTT1wl75tng7JpT3mgFguaB34696DZWUyJ7awU4bsyEEm1VcRjz1KkZ/MrCdJaWOD0SdesBVQMxiUjoPtqj2RwZtbNl6IkkY3ll7pMUWMPRfaSBV6RIelt0rHFI1QyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3dJ79dRVTe8Q9ZgaJSdv+A0U1n5Ec1Tf7HwhHDOUp8=;
 b=yIoRH5JODOUur3lTq8hDlMfiintypU9wBJ6FRJky8e8NEJ/rsIm3kkf8cwJGYIwRo0HruiD/xnVv8zBJhC6tJIYCZdpZ4EOODfq5Z47w4xV2lBOjm78SENsF4Kt5VngCg9RUZ4MisLpq20sp1cSaOwtNjSB7CufDgWdSpbADzUmd4mQGLyQUXn/zGJQHnyMtfh8V7VpiwYUf26ItxaFp4jJ+6seOCNCKOzRBy1nXWs9PYAaRwdHXENMG03XDgf1gu4HdTVNxGWADYaxxSsmwRAROxPBrbXSe17238B8yr3UqLCeJhQXAuLDpQ8FLcbO7Cik5psrIJWTEQWIDmDYIvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3dJ79dRVTe8Q9ZgaJSdv+A0U1n5Ec1Tf7HwhHDOUp8=;
 b=bnnTQwtoj7orfBYuY4Zs/q4s6ErJxs2v9HQwfu3vmst2wmV1ZftQZXmSIFFmWxn0rBR9nxMReOovUIer3HokIV0K4sbWRzyVKNKuOcxHQZpB2k2pky85wp4h4v5T+5aYDsMn5r57RcuPgN6Kyz3SFK4KyViD32QM1weiV8pA/Ko=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by MN0PR12MB6032.namprd12.prod.outlook.com (2603:10b6:208:3cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 20:50:58 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 20:50:57 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Brendan Jackman <jackmanb@google.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 12/35] x86/bugs: Restructure retbleed mitigation
Thread-Topic: [PATCH v3 12/35] x86/bugs: Restructure retbleed mitigation
Thread-Index: AQHbe+qB3Ck15bnYr0WhdCCvTJhtL7NBAhCQ
Date: Mon, 10 Feb 2025 20:50:57 +0000
Message-ID:
 <LV3PR12MB926577552148346FDB2CC83794F22@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-13-david.kaplan@amd.com>
 <CA+i-1C0KpYA3BaPQb--AjRcZU5mi-Mk=kxpG3jy_TKufn+rk7A@mail.gmail.com>
In-Reply-To:
 <CA+i-1C0KpYA3BaPQb--AjRcZU5mi-Mk=kxpG3jy_TKufn+rk7A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=0cf3e908-cea1-454a-a62b-bc78c0d782e3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-10T20:47:06Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|MN0PR12MB6032:EE_
x-ms-office365-filtering-correlation-id: b2458986-c9f0-4674-f058-08dd4a149e99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b0k4T1VpdTM2K2g3WU1jQmlzRnBIUTYzak5IZ3JHY1RKMkxnb0RxT2ltZUJW?=
 =?utf-8?B?ejRabDg0MWovVU00S1hiRDdkMVdxai9ka3pHQ1JqQW5qelhDY2x0SzlnblZQ?=
 =?utf-8?B?ci9XVGJ0OUxoSnUrSXJ5MTdaLzExR0NPUkFZc0UybS93ekJJdXRsaElzREtl?=
 =?utf-8?B?WlhPK0FIS2g3TEh4M05CcDhLemhjUjBJQUVYVzNhSEI4T0dUMkgzQnh0eXNh?=
 =?utf-8?B?Y01XR09jclFkVzdQRGVtcEtjOERGTDNmdjAvR2VSRWJQWjRTUWdqbTBjRHZs?=
 =?utf-8?B?d3VuK1kxVTdXZndvR252eEJlbnNTNi9KNjArbGhQc1h6bjZZUEhxZlkvTVJV?=
 =?utf-8?B?bVJDVmw0OHdQOXd6WkF4UkY2MUhIanRJbTZ6MDNXQkhZMnJIZkE5bUtidXB3?=
 =?utf-8?B?eXpXb3VjeW85eW5iOHhRSDFzZWRMRlJXcVR4Z1diVEx0UWdWODI5SVlmRjB6?=
 =?utf-8?B?NlM4QUNaSFovbmpaRUNyN1dVeklXVU9CWmpjK05xdGFoR1FOaWNwNFFzM29O?=
 =?utf-8?B?VFh3aWxWcWJEWGdTUlJMUGl4NnkwK3AraEs2SUVHcis4UWZjMzl0RkY0T0dM?=
 =?utf-8?B?UGNkOUFLK0k0UC92ZGpVS0lrTTRlWFliaFF4UkJXZVpyQ0RLRUFXb2xxdWtW?=
 =?utf-8?B?UHY0Mzk4UFhMelhYVVU1dERUMDFIam9RUUxKWHNiSjJTZHlwYU9hbENkOStT?=
 =?utf-8?B?VGJjQ29wS2lMcGtBTWJvay9XMnJzTVZ1bnh5SEdjMFczd3lQUFJFYjZyZzVj?=
 =?utf-8?B?aEdKazV6Y3Q4U2pKSXhhaVNiM1ZHU0NOWXVRSUo3dm5FbHNvKzJ3ZTkxbUZT?=
 =?utf-8?B?OFVzRmhvN2V4RDgzRzlQc1FLTVdTS3ZWY01Scml6SFcvNlpydytnOE5RMk8w?=
 =?utf-8?B?c213V2JjQ25ZQnlRcmtCKzNmZXUvbEQ0N1kvcTIxM0cxWVRxT2h5M3BLRFQv?=
 =?utf-8?B?RjNva01zRC9kN0srYXJqWVpMOEdCbHpHK0ZVSElDZis4a0k5SlBpc3k3aXAr?=
 =?utf-8?B?S3J0UXVlT29jbXB4clMrSTJMSDQybVhUVUVlSEZ0SmNYSEZYcHk1OFlxMk5z?=
 =?utf-8?B?MkRuMjhiZlVjYnRPVmJhMXBrYTB6WUhBZU1WeWh3M0tQS1R4TmF3ak1MV2V0?=
 =?utf-8?B?cFFQKzdON2NzMW5tOFRWMlNTWUhQOEVUWEU1ek1DZjd2bEswZU9GTkJvVDdL?=
 =?utf-8?B?MmxHdjFtSE9Yd2lIVHdwYUVhZnR5WDVvcWFsVXRJMHliNm9UZVQrMnlMVWJx?=
 =?utf-8?B?RnlEZkwxVVhDdDN0R1ZFS3ZZLzZFSDc2VVYwVXEzYzRpdkN3NlBlaG5pN2wx?=
 =?utf-8?B?U281b2M5b01ha0lXQWlNMVN3dzFrSU11Mi94dzdaUXJVVS9qM1g1dytjdGll?=
 =?utf-8?B?Z2pRZFEydi9LZnZ4MnE4L1RJMXE4NEU5akQrQ0ZuQktyN1AyTzJadG1UV29s?=
 =?utf-8?B?NTVFdU9IdlBMTHY1bCt1cFhiR2V3UzVadE5SbTRReXBoRmtXTTlmcmE1VmVK?=
 =?utf-8?B?NTZROEd5eklEY1hnbDk2cVRPS3RFbGdnTGxCalA4SGl3VFhaUWNqRmpzOHJE?=
 =?utf-8?B?UC9LUGt2b09tRGViSVlMQnE1b0p6cFlPczVpTG9LUFcwV1VrMS9VTGl4SmhH?=
 =?utf-8?B?YUJ0STBoejdQT0FVVjlrTHpEZWpUQ2RtYnlUbTlSL1hJang1QXdBWDBOWmkz?=
 =?utf-8?B?OE9tY2tyNURWVTJYbE5qQndLVXk1UGFMYWhJdHk1SXpqMHowKzlYcExpWC9q?=
 =?utf-8?B?RG5lc0d5dzN3cFVWaHJmTEEybFhpNUpEOHNtRHU4VmpFS3Y5NzFkMzhrR3hx?=
 =?utf-8?B?aSs3ZTJNNlltU3E4SUUwRGRiSnV6SjR0WnJ4Qm02Tm1CL1k3RFVJZmtOSkc3?=
 =?utf-8?B?d3Rja09NeHlDYnFkNjNMUFNsR3I3SnVQcEIreXcwZmNpTjVIY0dlNTVVV0JY?=
 =?utf-8?Q?I5UUjAilycO2O6I2A0CzkjH2q9z77YuI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWdqaUY1RS93UWlDWGlqbElodTdFamdMdlBtTE96Y29UeGg4UFYwQVY3MTNp?=
 =?utf-8?B?MkR4bXcwb3hwTENLR3dBdVZ5RzU5MEcxcG03dVp5amhSREcrUncvME5nVWZX?=
 =?utf-8?B?aFJZWXlFL0UxVmVSTGxyZUh4UmpHL1hzZmtORjRBT0RlejBRY0pkejNFeHA1?=
 =?utf-8?B?blRCdXhkWGxQRU5SQWpCUGVSaWcvSnVBZC9NODNVWWNLVmVXL1M0M1JtbUpx?=
 =?utf-8?B?RjRUalpoNXBIeFpFczVGY1RoK3BoMmNSKzVFN2JGNmJkaGdaTGExampyV0FW?=
 =?utf-8?B?Ly9Ld2RmUUFlNThtN09lSjQyZFVMeGg0YTlkdm5ybm5xK3pvVDFLVWcyT3A5?=
 =?utf-8?B?YWRvUXhQejhwSnAwUERvN0MzbE1YTkxKSG1BWFV6SjgxellTK25CRUJqSWdT?=
 =?utf-8?B?VUZjZ3FDZkkycjhDb2g2SnNSTjhPeFhMMkZKTi9LbTM5OFRXUVNyMjJiSHdQ?=
 =?utf-8?B?SEpDeGtrVnNHV0NGR01IaDNLZzYyQzdqTkZEMkpOeThESTV1dVloaHpBZURy?=
 =?utf-8?B?d2ZZNVNnQmdKaWQ2QXZsWlhMdnhHMjZLYVMyV0xBdEJ3SG9HMjRGdGRPVldG?=
 =?utf-8?B?Q3BKM21udjl1V1dDL0tUTHZVY1RnWWh1ZTlRZ3JRaERENWNHSmJyaXlUZFQ4?=
 =?utf-8?B?VGdOOFdYMTFpK1V4a3k0bXZ3Y3laZStzcEkya1hiOWo1VGNmT29ySkE4RXV5?=
 =?utf-8?B?elg1YnZ5UGZjYmxEWUgyYUpsb1pzSGJvZE1jWVZ5OS9UclJkK1p6aUo3QkUw?=
 =?utf-8?B?RlREU1FRY1hoVGhpbzJVVE9ZSkZ4dWdWcGhvL0FqMWxpOTRrV21BSDFDVThH?=
 =?utf-8?B?M2xCZ3FYcDMyMWYxZ3o4cDFuZW5CQklnVEE1Vlp5TGhOK0lQZWV4WXNBYmJV?=
 =?utf-8?B?ckdwK3lReE15SUlrNHNNVS9tWTRDV0xoSU5Ea1AybUJhZ0tFNzJuK0VYUzFk?=
 =?utf-8?B?cCtCcnZZZG5sLzNFb0dmWFNPb0JOWXhUUnI3SVN4NGFCSzhTZW82SnYxUTJp?=
 =?utf-8?B?N1FoZEg4ODBmS1RPazBnN29uaHNITDJyQzJuempTbUNnaWQvcEhhUE1yNGtj?=
 =?utf-8?B?U3F0OXdGQTYzaitSd2ZLQ3NZUkJXcEczOXUwT0pOUWxzZHlQYk4wSlUrUGpS?=
 =?utf-8?B?d2lKT2ErbVJOR0ZXOWc0dXJ6a0MxZ3pKY0xnVWlBUVpBblc5NEk5b1pKa2hT?=
 =?utf-8?B?cXY5TG9xcm9hd2IxdVhocjBqd0pHbGdlRGNQMC8vVWF0aEpiSTMreWhXSHhE?=
 =?utf-8?B?QVgwWlg2OFBabDUyUHh4dEVnbitwL2F1Z3FidStKZ0J1aDdEemJiNFJmamZ5?=
 =?utf-8?B?dUlIbWV1RXY5aVV0aHQvZlB4b1VvdU1GVGczNWNCMHRNTjI4UEtDdkN6TDhN?=
 =?utf-8?B?YWg4KzkyS2c0SkczSUFjT2ZsUlZHN1JCZVFGL1g2b1RUTVd5dXNkL1JsTEZ6?=
 =?utf-8?B?czl3UFYxdmhHNVlYK0UvRVNIV1VZa05wOUEzN08vb21TWXZEVGNWSmpIbWVa?=
 =?utf-8?B?L3ZFd1BIVmtmakw0UXk1WFYzWnE2ZFppb1VwUGR0VksrNTZYdHdQUVBzSTVJ?=
 =?utf-8?B?SlZNYmZrVGtvWGJxTStkQlBuR3RNTE1JTUxpMy9VanpkdVdTNUhLNnFlekl2?=
 =?utf-8?B?dXpBb0xreGhReEpKN29CYmVuNEFXTFFuUnZUWjdLNHlKSHZzcDRsSFJOV21O?=
 =?utf-8?B?TmZOUUE4ZGdEVUVLYTJ3cG5OMHNsVGFZMFJsL3hUN3dLelVxUis0S2FEblAz?=
 =?utf-8?B?dTVhZml2VGM4MnN4Y1h1VHlFK3MvTldjTzlmc3psR0F3VVlvM3RKUy9EUkJN?=
 =?utf-8?B?NGJsWHVQR2I4dmdzanowVy91dUNGODl5Z0x0eGpIbkY0Z3JNY3R5K2Q4d3hE?=
 =?utf-8?B?d0pQWmdCYVUvWnhPdG83RmY1aU1GazNjbnNoV21MNDQ0eW5UZ2o3dm9WeGI3?=
 =?utf-8?B?K1ptUVI5MGhkeGt0OHdRM29kdWF1WklRN3Jxc1dPaWZSc1EwTkIxVFRhSjYr?=
 =?utf-8?B?Nk4wUFQ1bDRpVE92TkJOVERtUGZYM2gxVUV4aGdTdk0wbTk1c0cwN2MrQ0Vi?=
 =?utf-8?B?a2R6cVBMMDVENi9uNHNSblBYV1hDZ3lXZnQxQi9XdlVSbC9HYmVuVGRyRzh5?=
 =?utf-8?Q?YGQA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b2458986-c9f0-4674-f058-08dd4a149e99
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 20:50:57.4511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LvXBT9NYHFkUc3dOOrnWndcviqzGeEORFgaPodbCYUSvmiBbdZ80ar1EShXCs5or
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6032

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcmVuZGFuIEphY2ttYW4g
PGphY2ttYW5iQGdvb2dsZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgRmVicnVhcnkgMTAsIDIwMjUg
MTI6MzUgUE0NCj4gVG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBD
YzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT47IFBldGVyDQo+IFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz47
IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBrZXJuZWwub3JnPjsgUGF3YW4NCj4gR3VwdGEgPHBh
d2FuLmt1bWFyLmd1cHRhQGxpbnV4LmludGVsLmNvbT47IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRo
YXQuY29tPjsNCj4gRGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4LmludGVsLmNvbT47IHg4
NkBrZXJuZWwub3JnOyBIIC4gUGV0ZXIgQW52aW4NCj4gPGhwYUB6eXRvci5jb20+OyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMTIvMzVdIHg4
Ni9idWdzOiBSZXN0cnVjdHVyZSByZXRibGVlZCBtaXRpZ2F0aW9uDQo+DQo+IENhdXRpb246IFRo
aXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVy
IGNhdXRpb24NCj4gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3Ig
cmVzcG9uZGluZy4NCj4NCj4NCj4gT24gV2VkLCA4IEphbiAyMDI1IGF0IDIxOjI5LCBEYXZpZCBL
YXBsYW4gPGRhdmlkLmthcGxhbkBhbWQuY29tPiB3cm90ZToNCj4gPiBAQCAtMTgyNywxNiArMTgy
MSw2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzcGVjdHJlX3YyX3NlbGVjdF9taXRpZ2F0aW9uKHZv
aWQpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gICAgICAgICAgICAg
ICAgIH0NCj4gPg0KPiA+IC0gICAgICAgICAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfTUlU
SUdBVElPTl9JQlJTX0VOVFJZKSAmJg0KPiA+IC0gICAgICAgICAgICAgICAgICAgYm9vdF9jcHVf
aGFzX2J1ZyhYODZfQlVHX1JFVEJMRUVEKSAmJg0KPiA+IC0gICAgICAgICAgICAgICAgICAgcmV0
YmxlZWRfY21kICE9IFJFVEJMRUVEX0NNRF9PRkYgJiYNCj4gPiAtICAgICAgICAgICAgICAgICAg
IHJldGJsZWVkX2NtZCAhPSBSRVRCTEVFRF9DTURfU1RVRkYgJiYNCj4gPiAtICAgICAgICAgICAg
ICAgICAgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9JQlJTKSAmJg0KPiA+IC0gICAgICAgICAg
ICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfSU5URUwpIHsN
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBtb2RlID0gU1BFQ1RSRV9WMl9JQlJTOw0KPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+IC0gICAgICAgICAgICAgICB9DQo+
ID4gLQ0KPiA+ICAgICAgICAgICAgICAgICBtb2RlID0gc3BlY3RyZV92Ml9zZWxlY3RfcmV0cG9s
aW5lKCk7DQo+ID4gICAgICAgICAgICAgICAgIGJyZWFrOw0KPg0KPiBJdCBpc24ndCBxdWl0ZSBj
bGVhciB3aHkgdGhpcyBnZXRzIHJlbW92ZWQgaGVyZS4gRG9lc24ndA0KPiByZXRibGVlZF91cGRh
dGVfbWl0aWdhdGlvbigpIHN0aWxsIGRlcGVuZCBvbiB0aGlzPw0KPg0KPiBJdCBnZXRzIGFkZGVk
IGJhY2sgaW4gMTUvMzUgc28gdGhpcyB3b3VsZCBiZSBhdCBtb3N0IGEgcHJvYmxlbSBvZiBnaXQg
aGlzdG9yeS4NCg0KVGhhbmtzLCBJJ2xsIGZpeCB0aGlzLiAgVGhlIGxvZ2ljIGhhZCB0byBjaGFu
Z2UgYmVjYXVzZSByZXRibGVlZF9jbWQgaXMgcmVtb3ZlZCBhcyBwYXJ0IG9mIHRoZSByZXN0cnVj
dHVyZSwgYnV0IHRoYXQgZG9lc24ndCBtZWFuIHRoZSB3aG9sZSBibG9jayBuZWVkcyB0byBiZSBy
ZW1vdmVkLi4uYW5kIGl0IGRvZXMgbW92ZSBpbnRvIHNwZWN0cmVfdjJfdXBkYXRlX21pdGlnYXRp
b24oKSBpbiBwYXRjaCAxNS4NCg0KLS1EYXZpZCBLYXBsYW4NCg==
