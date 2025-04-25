Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59995252286
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587699; cv=fail; b=U2xQkgmd2RZsAIVrMbGKFKVaNL2aoATcwcfhazANjh2ENeax01yF3Mu4KLTdWRwji4EqRcCLziGgzXUlPWP97F8yjEoADPuy0D3kR/IM6zxCNVQ5tqjpkKkUdPaKOaRlYzVQ2QhnOkuu4O8Ouo1Rq9SEeqvLdyOt9WlOX0quS/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587699; c=relaxed/simple;
	bh=LWZ7cDCim+rbB4bY4WoQhjiFsg5VVyYTS7YsLphxT8A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kx8LRV70RCCmrD7GeiBihunooAfZsuaBaakyQCuXfTs8cZRHBfZPccVoIL4MwnRDFomFy3zyYrEpXSi6a6N7RFk5uLaZJ1EkbEfyTi7EP/S++bx5rKNBaHbt6+axTxmGnn5GrM5Ib4qy9r35NOXta0pC0uhNXcRc9d+7KQv8+M0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mKjYn/Zq; arc=fail smtp.client-ip=40.107.220.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mKjYn/Zq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtMPwKc/yewOKOehdtsmdFTmQ4XVMG2DEvtEfsozTl8Fy4ReoKwwYqqsICHJxvQvdh3AuhUt6PN0T5rTViODwJINLXZhDF9vxi6mKf/Qaa5V5KoaP46doLVAZmrl5HvkVMMGjtpEBkzM53FYkdw8x53WI0Qmm3IMc27Lb6/xoO0bcr1EbkovfnUdwWaMkUljN/17LOwIGBUkuVIMRDfRI61YyrQj8hvbvpMGr32hb6g1Fa4hr+k8M+9+eoiJelG3VcFMPlxca/yKQxThY4Tj1O3qe4BbUXX+dNTHDpaMV+0MeTHwjn1GsUZv50SLnuM1s7VKASIq/BJNSi040HJgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWZ7cDCim+rbB4bY4WoQhjiFsg5VVyYTS7YsLphxT8A=;
 b=w+OuWAoP+19aeLL6ISIaEfU/nyr9bOQxgH/k2vikrISKRKqDKruxX0K/LkAD8OJdY7Q2Qbb/vcGIjrAmwX0NdkCGjkK/Mk6RWDGNZ+WARO5Zi733Iny+hOG4wa1iGTH1oAB0PhxPN7Xp6R2MDzYUb2d5j5RkICqKCZ6m5JSYZRGS8rrKqyrOv7i14pTyVX2y8FM9LvBBJyTjqO4amnNMwxBamhGxbu5Z0yUCdAIPAGRbqp+HLXRo2mv25TyHzmShtWQCKCGUuQjEZJD+6x4OGG0qArN6LmDiifTffrwFfyTak3by6yyVC63ZoRYxkaKp4I/DFrwDbp9pu71C2DSqxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWZ7cDCim+rbB4bY4WoQhjiFsg5VVyYTS7YsLphxT8A=;
 b=mKjYn/Zq8Jca7sWNS150zVJKvMnStDuPIG6eD3Zg4WD57Xf8vUT7kMUQv9HvEASdXhFJqaaxfhgcp1uoeMECWtVx6HlAWkjY9X+kxx5Ig04woG3QalHu0seDlQ2xzUs6eb+KnLmCPxqC8WrfVsVm59/gD5MO0phwqzwOZnxM5Tw=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by DM6PR12MB4217.namprd12.prod.outlook.com (2603:10b6:5:219::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 13:28:15 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8678.023; Fri, 25 Apr 2025
 13:28:15 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
	<peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 03/16] x86/bugs: Restructure MMIO mitigation
Thread-Topic: [PATCH v5 03/16] x86/bugs: Restructure MMIO mitigation
Thread-Index: AQHbtVYZe2tLds1K7EiPZ/ePuOYtaLOzQstggADFWQCAAFbwAA==
Date: Fri, 25 Apr 2025 13:28:14 +0000
Message-ID:
 <LV3PR12MB9265EA487C377CA33F2731F594842@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-4-david.kaplan@amd.com>
 <20250424201918.GAaAqcxqFV0raTOOKP@renoirsky.local>
 <LV3PR12MB9265795E7CF35195B7FE02A594852@LV3PR12MB9265.namprd12.prod.outlook.com>
 <20250425080946.GBaAtDShGzNQqi30vr@renoirsky.local>
In-Reply-To: <20250425080946.GBaAtDShGzNQqi30vr@renoirsky.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=8e8147cf-0d3e-48e5-afdc-e0261f5cf696;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-25T13:20:55Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|DM6PR12MB4217:EE_
x-ms-office365-filtering-correlation-id: cccc853e-6777-499d-5450-08dd83fd0894
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eVQyU09VTG9wMjV3UzA5Q0xJbm1oNjd3RGNVME1ZS0NqMU4rdTIyZDd6RlNk?=
 =?utf-8?B?RlZXTFJneTlzeC8zeVMvQ0QwZGZiTVJTckhwVHE4b1FuT3ZiQUhDU21TY1pw?=
 =?utf-8?B?V05kdWZ0QWZVZlptL0dpTGhhTE5iNGc5bXJLemdjZm5jejJoS1FiZDBpOTFq?=
 =?utf-8?B?aEljaThkNFdkY0NacldtTU4rOFpQcWRBSzVDcGx0cEtoVG5UTHczN1lHMHBM?=
 =?utf-8?B?czV2RWZJY3ZqL0dvWVFaQk44em15TkxYalk2ZDdDbXBHb0txR2YrV2NGdmNr?=
 =?utf-8?B?eUlRSkJaQkdzWlRDQkNMMmRaQWJaaWp1ZTFYOTJtV01LZGRLVDZPZUZnS1Av?=
 =?utf-8?B?dDFWZTNnK2J4VlErVnFpM3FQWENGZFRyTDlyRjBEVXFvaHJPdnJlWlN2b0Ux?=
 =?utf-8?B?eThXQ043QS9jcDY0T2NFbTdHc3ZhcytYM01WN2xEZDV5VzFYUjBKSUtmU0Jl?=
 =?utf-8?B?YkYzTDZObjRPYlR5RVRSbnZocEZ3UXJsSndVemRtL3lWbFZMOURJcXNsOUZ4?=
 =?utf-8?B?VWQ3NDFpaWZBR2kvcTVMenlDVGZaSTdXZnMzMXBUNVVFYkJ1Q2FyUVZRWEJ6?=
 =?utf-8?B?cU5FUmpNcWFVd3FDbkZaaEZFSzRpa2NnblhJVlRodCtnTCt3VnJxRFJYVWRj?=
 =?utf-8?B?bGZoekg0TEtzV2pVUTEzUEtnL1R1SW9HZVdPMnAzWlFNNGlrOFYrQWFsM2pX?=
 =?utf-8?B?bjZaRWhncVFFV0tLMkJ4TEQ4bS9qTGh6ZnFRR2dZOTRtd2U2U1ltWk5lZTFQ?=
 =?utf-8?B?dkJhQXZtci95YVBwZ2l2aGhscGJpbSt3aVBhM2Y2LzNRdEhTcDgyOGhvU3lu?=
 =?utf-8?B?MlpnNUtNbkdlZTFiV0U2Y3YxaXROc1ZHeFFUdC9la2J0RzRROWhYalRuWWNV?=
 =?utf-8?B?UGwveXZUKytmdkFINzhIUnhJOWpWaGFiWVVWbk5rK09WUWcvblFLYStOaGFI?=
 =?utf-8?B?Y0hubER0ay9MWTA5Nzh5Ri9TZWV5SUlvbm1MUGRXVEd2ZDlnMDZLMFVEZWZm?=
 =?utf-8?B?UEk2MFYyVHh6WjBPMktSWUFqL0hndW44ZUtjYm5ESlFURFA5RXpOY2ZYeUd5?=
 =?utf-8?B?ZTlmSjhrNExUYjNxV1lwS0x2VThZV0hCWnRvdkZMVDNjN1FycjE3M2dnVS95?=
 =?utf-8?B?d3ZmMFRWR0duUTVFSVg2cGNVcG5FY2FSeWt6SkpOT205eWk0UVRMWFZtUmlP?=
 =?utf-8?B?OWtnNnIwRURkc0l3U2FHOEtGbnJseGZyNHlsR05hQWZFdFk2WW9Ed3pEajZT?=
 =?utf-8?B?K2tOZDhYSGdoWGlzRGhqV1hselFJeWFickFkN01OU01oaDFMdEY0N2U2bEJs?=
 =?utf-8?B?VVQ0RFdvNGZ3bjFkR2lkckQxZFBBS2pSRHVYbStvcytXVXBSN29YaWd0anlQ?=
 =?utf-8?B?YjFTLzRPY25FVHpUazAxSDZkVHZ5eThDQ2ZOOURrYWo0cDZsa1h2dVF0UWpJ?=
 =?utf-8?B?TGRNRVd5a01reHhKb2o1NVVodkNwL2pJdDZSanFqN1hnaG5FWE1vOXJOVHZr?=
 =?utf-8?B?eGlqZGMzU20wNlcvcnBpTE9GUjllQThMaC84VkJpSzZjZVdyRWJUUFlTWXZw?=
 =?utf-8?B?Wm5iK0pFa3NnS2NTRktqdVhxRlhJRHZpWWtRNVhYSEFUTSs5dVZCRTlCUzF0?=
 =?utf-8?B?YjBFRjhSRytPN29ZU1ZvSkZ3SEdpN2xxaXJ3blcySXZ1SkNlTVUwUGY1dzd6?=
 =?utf-8?B?ZUE0b2YyQ3FXYllIRVlUZW1UVjk4R0JxbUR0V1ZlbUJnSXR5NWVrKzI0S0Na?=
 =?utf-8?B?U2ZJY0xDV2xnZWNKRFdYMGJxVmpZT3VWNGdMdXJxR081NlVRZERhV2VnWWtG?=
 =?utf-8?B?TysvdHhhNjJMekpLMmhXOFd5VExHQW95aEJMVXpFaXNCUWtyNmJGNzBCWW1l?=
 =?utf-8?B?OGlmNEs4clZQYTg4cEZDSGZEbGZrZ09XQnorTEd4cGZML2tzZU1uLzZxWGFW?=
 =?utf-8?B?MFRyZ3B2cG9UaXRNbTVUcFgzbXRaNHBoRE9Wa3pmaUhHbDlNT1hSRnNFV1RW?=
 =?utf-8?Q?9lxOt7KOBy7KOzAo24hMZvShDCAGo0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?blpzaGpraFpRdXJST21WTnFtM01pdXlaMmxGMlFxb1A1VmpHY2dsaXp1aWtt?=
 =?utf-8?B?bnM0Y1V3dXEzVjdhK2NNcHh3MWl3Z0lNMVFvdStqdS8wODdLRFAxelpWRjBF?=
 =?utf-8?B?d1cwME1CV2RGUkF0c2NkdjBMZUFCTGlYU1lGOVVGMW05UUxmZi9aSEp4eTd4?=
 =?utf-8?B?UGpjaVdlL1h6UzNtV2VWb3ppWU5KaVE3Ti95YVNnVjk1cnVwSk5RNUh0NTdT?=
 =?utf-8?B?Nm5OZFdJYy9kVDVaUXJkS2RBZUk0TnROa2liNFhRbDdJakpOT2FWMUdTSFA2?=
 =?utf-8?B?VEY3YXFqT2ZCRnRHa0pMRWtTSEp5eGgxSlFyNzNIbnpWQWNrWHZ2YVlvb3M2?=
 =?utf-8?B?T0lZTDdMYk9HeUs2M1M3WWh0S096M3FrYlpDUmJ5azZHTXFMcGtjUHFNVkZ4?=
 =?utf-8?B?RktzQmpIakZqbXFlVlJvdXVSeDBLemxoU2tBWWl2WDRRSEVlcFAzN1ZLcExy?=
 =?utf-8?B?bEhlVjdPd3pWTjVmNnBXYnRkbWxTdHZSTEF1STF4c3RSTERyMUI3bXc4WG9B?=
 =?utf-8?B?dGRObmNQR2Z3T0RUeGwxVGpEeWcvUFNWcWlWbnlNZUdrY3gwVXdsSG13cHEz?=
 =?utf-8?B?N1RvQ2sxNW41UXNjQ0xmTkRvZXJzdk9XdnBuNEM1WGlqV0lXMmh6bG83ZVBw?=
 =?utf-8?B?U3d4SlIzZ3diWmJNL0RrOUJxUmI0Si9UbDZ4TkpCNUhrck5RLzZRNUFlaHlr?=
 =?utf-8?B?UDh1STA2b2FYd0RBUE84TlBVWkMvcU9LZ1FrTHc4em5LcnZicFhjcWFESG1k?=
 =?utf-8?B?OHpDWGIzbUgwWnVaWkxidjFQQ056eWRjbFh2azNjSWtHVmZtUmhNbFdmeGlr?=
 =?utf-8?B?NGRyU0FtN1B3eGpyKzdGTnVRSHlNSWc3cWsrdFV4ZFArMHgyNXFyclFoRVhm?=
 =?utf-8?B?MDZ1V25xUnppN21NaTdpYWRLUXpDZDRodXBTR0g5d0JrdG9KSkw5bjd1YWxK?=
 =?utf-8?B?NkhGWVZUeXFwam1IVGM5RVNlR3BXZEhJSGJucm9Gbys2UCs4QVhtUjB4N0dh?=
 =?utf-8?B?cFRXUmp5YVU5cWtZQnZkYXVZVTc2eEFDcHpmdENYN1VPUlY2b2lBa3RFbFEr?=
 =?utf-8?B?NTd4RG0vY2syZHcrSUhLVmx0REFQeDJTWWtGb0RLek5FbUk3ZktJck5XdzIr?=
 =?utf-8?B?R3ZUOENVWHFZTEZGTEdSU3d3MDN5Y1RBRWRYVHVSL3FDOVhLOHc1NXZld01t?=
 =?utf-8?B?anEwekkwcWx4Y3NJUGQ1aURoYXV0Ni96bFJSSFJ4OXVNczZxbDRjY1FvWjJH?=
 =?utf-8?B?eHYrRzRwRnVjTk1DblowYnlyZ0dhNnA1Y1pFbDBGRHVoTnJnTW4yelJVNmxS?=
 =?utf-8?B?bkphdzFZd1pGaDZHeEtYTjFQTzFTeXE5RmdrVk1PWVhuM1l1VWUwTEdkMndX?=
 =?utf-8?B?UHJqKzdFQjNMSCtRK08rWDZya3c4WWtkZnk3L2tXZ25MSVRkM2cvWUJ5ZWMz?=
 =?utf-8?B?dFU5OEo3NUxUdU9PaVJrT3h3MXZkNm5ldi9ZWUZlanlLaXRpbE10ekFUeWEr?=
 =?utf-8?B?dDVaMFVtRVE5UmNWRjVJS2JBc3pZZ2JEYy9FQXhnOEt2YWZkdTJLcW8yVzhw?=
 =?utf-8?B?Tml2NmpGbmRXYkdIODI2alNnbEFYbis4VDNBNTVRZkx1T2V2Z3c4UitKd2h3?=
 =?utf-8?B?cElGRmNDR2RTemwwTm0vdk9FZE5DcENBcW1aSVhaNUo0bXc2ZVhxVWRHbDdZ?=
 =?utf-8?B?K1ZvaU83RXZaYmpjenNSUHpidlZrS1BYcFhmSzdCRkU0Nm1qOU1NSkZsTGpH?=
 =?utf-8?B?a2haQTRFbWxxdGxZVnpwL1daMStkMFBndlpDNXlHc29LUWNRbXpob2FmblA0?=
 =?utf-8?B?RTZrRUhrekJOUEVHZ3Z0eTRlekprWlV2MXN2Ym1zZTY2UENvc3ZrS2dpRjc4?=
 =?utf-8?B?UjlaYVdKV2JEcy9pbmdVVDFnT3E5SkZLbTFVcDZCdWRrNCs4c1Qza3FxbUdh?=
 =?utf-8?B?YzhCK0F2bkdlZnR6eTBISHhIT0lUb3RMcmN5anpOaFJuVWdtdDJoRi81RXhw?=
 =?utf-8?B?VFl0UmZhblFwRHBYSnQzMC92Wk14bE5VbUtBN2wycUowdXpkd3B6eHZWd25u?=
 =?utf-8?B?cDh5VU1ycmZXci9yY3Y2WXYrQUpwU2NmZlpOaGJzTUZ3WXpCM3VWZTJGenBl?=
 =?utf-8?Q?uFlI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cccc853e-6777-499d-5450-08dd83fd0894
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 13:28:14.9880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jb/oVUbYZwk82Zzs2Fxa7Z0FKfNr0BW1i4gQBa2F6GqmLl1cfX0Ozw4nQM39Qe1z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4217

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT4NCj4gU2VudDogRnJpZGF5LCBBcHJpbCAyNSwgMjAyNSA0OjEwIEFNDQo+
IFRvOiBLYXBsYW4sIERhdmlkIDxEYXZpZC5LYXBsYW5AYW1kLmNvbT4NCj4gQ2M6IFRob21hcyBH
bGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPjsgUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZy
YWRlYWQub3JnPjsNCj4gSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9lQGtlcm5lbC5vcmc+OyBQYXdh
biBHdXB0YQ0KPiA8cGF3YW4ua3VtYXIuZ3VwdGFAbGludXguaW50ZWwuY29tPjsgSW5nbyBNb2xu
YXIgPG1pbmdvQHJlZGhhdC5jb20+OyBEYXZlDQo+IEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXgu
aW50ZWwuY29tPjsgeDg2QGtlcm5lbC5vcmc7IEggLiBQZXRlciBBbnZpbg0KPiA8aHBhQHp5dG9y
LmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NSAwMy8xNl0geDg2L2J1Z3M6IFJlc3RydWN0dXJlIE1NSU8gbWl0aWdhdGlvbg0KPg0KPiBD
YXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4g
VXNlIHByb3BlciBjYXV0aW9uDQo+IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcg
bGlua3MsIG9yIHJlc3BvbmRpbmcuDQo+DQo+DQo+IE9uIFRodSwgQXByIDI0LCAyMDI1IGF0IDA4
OjMxOjI1UE0gKzAwMDAsIEthcGxhbiwgRGF2aWQgd3JvdGU6DQo+ID4gdmVyd19taXRpZ2F0aW9u
X3NlbGVjdGVkIGltcGxpZXMgdGhhdCBYODZfRkVBVFVSRV9DTEVBUl9DUFVfQlVGIHdpbGwNCj4g
PiBiZSBlbmFibGVkLCB3aGljaCBkb2VzIGEgVkVSVyBvbiBrZXJuZWwvdm1tIGV4aXRzLg0KPg0K
PiBEb2VzIGl0IGltcGx5IHRoYXQgdGhvdWdoPyBBcyBleHBsYWluZWQsIGl0IHNpbXBseSBzYXlz
IHRoYXQgKmEqIFZFUlcgbWl0aWdhdGlvbg0KPiBoYXMgYmVlbiBzZWxlY3RlZC4NCj4NCj4gQW5k
IG9ubHkgaW4gdGhlIE1NSU8gY2FzZSB3aGljaCBtYW5kYXRlcyB0aGF0IGJvdGggc3BvdHMgLSBr
ZXJuZWwgZW50cnkgYW5kDQo+IFZNRU5URVIgLSBzaG91bGQgYmUgbWl0aWdhdGVkLCBpdCBiYXNp
Y2FsbHkgc2F5cyB0aGF0IHRoaXMNCj4gQ0xFQVJfQ1BVX0JVRkZFUlMgbWFjcm8gc2hvdWxkIGJl
IGFjdGl2ZS4gQW5kIHRoYXQgbWFjcm8gZG9lcyBWRVJXIG9uDQo+IGtlcm5lbCBlbnRyeSBhbmQg
cmlnaHQgYmVmb3JlIFZNTEFVTkNILg0KDQpJdCB3YXMgdGhlIGludGVudCB0byBpbXBseSB0aGF0
LiAgSWYgeW91IGxvb2sgYXQgcGF0Y2ggMSwgMiwgYW5kIDQgdGhlbiBpZiB2ZXJ3X21pdGlnYXRp
b25fc2VsZWN0ZWQgaXMgZXZlciBzZXQgdG8gdHJ1ZSwgaXQgbWVhbnMgdGhhdCBzb21lIG1pdGln
YXRpb24gaXMgZ29pbmcgdG8gZm9yY2UgWDg2X0ZFQVRVUkVfQ0xFQVJfQ1BVX0JVRi4NCg0KTWF5
YmUgdGhlIHNvbHV0aW9uIGhlcmUgaXMgdG8gY2xhcmlmeSB0aGUgY29tbWVudCBhYm92ZSB2ZXJ3
X21pdGlnYXRpb25fc2VsZWN0ZWQgdGhhdCBpdCBpcyBzZXQgaWYgYW55IG9mIHRob3NlIDQgYnVn
cyBhcmUgZ29pbmcgdG8gZW5hYmxlIFg4Nl9GRUFUVVJFX0NMRUFSX0NQVV9CVUYuICBTbyBpdCBp
bXBsaWVzIHRoYXQgc3BlY2lmaWMgVkVSVy1iYXNlZCBtaXRpZ2F0aW9uLg0KDQpPciBwZXJoYXBz
IEkgY291bGQgZXZlbiByZW5hbWUgdGhlIHZhcmlhYmxlIHRvIGJlICdjbGVhcl9jcHVfYnVmX3Nl
bGVjdGVkJz8NCg0KPg0KPiBBbmQgd2hlbiB0aGUgbWFjaGluZSBpcyBub3QgYWZmZWN0ZWQgYnkg
TURTK1RBQSwgdGhlbiBpdCBlbmFibGVzIHRoaXMNCj4gY3B1X2J1Zl92bV9jbGVhciB0aGluZyB3
aGljaCBkb2VzIFZFUlcgaW4gQyBjb2RlLCBhIGJpdCBlYXJsaWVyIGJlZm9yZQ0KPiBWTUxBVU5D
SC4NCj4NCj4gPiBTbyBJJ20gbm90IHN1cmUgdGhlIGNvbW1lbnQgaXMgcmVhbGx5IHdyb25nLCBi
dXQgaXQgY2FuIGJlIHJlcGhyYXNlZC4NCj4NCj4gWWVzIHBsZWFzZS4NCj4NCj4gPiBCdXQgaXQg
a2luZCBvZiBkb2VzLiAgIXZlcndfbWl0aWdhdGlvbl9zZWxlY3RlZCBtZWFucyB0aGF0IHRoZQ0K
PiA+IFg4Nl9GRUFUVVJFIGJpdCB0aGVyZSBpc24ndCBzZXQuICBTbyB0aGUgVk1NLWJhc2VkIG1p
dGlnYXRpb24gKHRoZQ0KPiA+IHN0YXRpYyBicmFuY2gpIGlzIG9ubHkgdXNlZCBpZiB0aGUgYnJv
YWRlciBYODZfRkVBVFVSRV9DTEVBUl9DUFVfQlVGDQo+ID4gaXMgbm90IGJlaW5nIHVzZWQuDQo+
DQo+IFJpZ2h0LCBleGNlcHQgdGhhdCBpbXBsaWNhdGlvbiBpcyBub3QgZnVsbHkgY2xlYXIsIEkg
dGhpbmsuDQo+DQo+ID4gSSdtIG9rIHdpdGggdGhpcyBwYXRjaCwgYXMgbG9uZyBhcyAnZnVsbCBW
RVJXIG1pdGlnYXRpb24nIGlzDQo+ID4gY29uc2lkZXJlZCBhIGNsZWFyIGVub3VnaCB0ZXJtLiAg
SSB0aGluayB0aGUgdXBkYXRlZCBjb21tZW50IGluIHRoZQ0KPiA+IGFwcGx5IGZ1bmN0aW9uIGRv
ZXMgZXhwbGFpbiB3aGF0IHRoYXQgbWVhbnMsIHNvIGlmIHRoYXQncyBnb29kIGVub3VnaA0KPiA+
IEknbSBvay4NCj4NCj4gUmlnaHQuDQo+DQo+IFNvLCBJIGRpZCBiZWVmIHVwIHRoZSBjb21tZW50
cyBzb21lIGFuZCByZW5hbWVkIHRoZSBrZXkuIERpZmYgb250b3Agb2YgeW91cnMNCj4gYmVsb3cu
IEhvdyBkb2VzIHRoYXQgbG9vaz8NCj4NCg0KSSB0aGluayBjbGFyaWZ5aW5nIHdoYXQgdmVyd19t
aXRpZ2F0aW9uX3NlbGVjdGVkIG1lYW5zIGlzIGJldHRlci4gIFdoZW4gdGhhdCBiZWNvbWVzIGNs
ZWFyLCBJIHRoaW5rIHRoYXQgdGhlIGV4aXN0aW5nIGNvbW1lbnRzIG1ha2Ugc2Vuc2UuDQoNClRo
YW5rcw0KLS1EYXZpZCBLYXBsYW4NCg==
