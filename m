Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2044.outbound.protection.outlook.com [40.107.101.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E7C255E4D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208169; cv=fail; b=P+myYr8tKgGycf7vnxPw25/AHu2BpPF4BM9dLnZAnzmm70l4r1C2VgT0eUJdyr4jzEUuKcBw7EVhRrZzE3WunGhp5J1oDgz5qclSWdpclawmc7FfpBEck8mmxbMDia3kHGOV/7MMMZa8HWTVNvKi4QZDWW8Gv+EG+PU/nY0oa1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208169; c=relaxed/simple;
	bh=5I7CgLWWAxRa0mJSS06AbxX9jciW+99d/XM6YB39KsE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hgMV2e/tBHWzNLZZD31fKsEox+qdf+AkfsnkmlqCn7DaheWQV/YXAYwO7xUO5lGMB1omMzpMw1nAaK4QBtPO48tIMVL31okMEEg4/fRUSNMyjXRo5XSHmOP4pnV7swGXUl0PTji0TrnfyrO1OCdVmOLunOuecA+1lgJailuY23c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GS08YFUe; arc=fail smtp.client-ip=40.107.101.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GS08YFUe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/S/3be0z19vZ+IH1F1LhfmlO8yCGfu388KXnVPPa8uJ6hS343cBRVelK9q+wVjAnc1YPOjPJ5tCUfHzrCyJb6QgiGE31p+0yi1saM7tCElcY9yWPJ/S0PA64i8naXpZiLoft/0V7biJEPJf8XzzEozBVe/rcYzu4wOnD/ejvQMCwMBCLM+BrVLCb127xXi3qolFwE4bmty8nfTcJPgF08cqlTponrMAN9c+HDyeL/qRq9fZntqR8xCvh42NBn+4br8z3atD5BwYxTtPgHsIko36E8MPzN9HMoivPmMnjNa6cpHjVnl4iWRT4j/plYSDTcpl7PbvHz/PQd1v68vkpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5I7CgLWWAxRa0mJSS06AbxX9jciW+99d/XM6YB39KsE=;
 b=n/O5Onahna/ZecE89WqgFpa8BtNGuSBXtBWg4reinEiDL9I2znr6rShZBfne8oF4QrxFCF8eLzErAk8rXs1BN6v2l6ap/UXTL3DpM7fE2kLgvyIk9gAOi77jLilRk2RGw1nwOBaeCV+Gzu24A7OHJz0U0zaMc05D23O/MM6kz0WToFuXFmJ69vMiG7jVY4/Osp1B0ERANtwyOHOl8f9MCvzMoy67/PNfUB60+aasKDeNHD5O8BoxHPgXQ7NZPX/ivpmJ2tTPMy0JOWgJZl9xLJC6HXTibejdrBJX7aUFPYzhNuQiDGR5rtaiz0cU24O5iophAyCa7VSHRciZtcJSuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5I7CgLWWAxRa0mJSS06AbxX9jciW+99d/XM6YB39KsE=;
 b=GS08YFUe90w4zOAMl+WpibxsWrEAIiR4UtQOwotM+wtgfcipm1mEn2c13CGsOGxSYz330SSGwsEi3hzpwzYvRUdQBr3O6h5xQ61YdW0uwnTuT6YHma3pugH8XmssWsZXkjy4xoFaMfMTsvRlNctbxtlNdqRGRqtV+4z4whFrSMA=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by SA1PR12MB9513.namprd12.prod.outlook.com (2603:10b6:806:45c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:22:44 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:22:44 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Brendan Jackman <jackmanb@google.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 06/35] x86/bugs: Restructure mmio mitigation
Thread-Topic: [PATCH v3 06/35] x86/bugs: Restructure mmio mitigation
Thread-Index: AQHbe9rMckoYbW1FJkubQrZxxdetIrNAyJAw
Date: Mon, 10 Feb 2025 17:22:44 +0000
Message-ID:
 <LV3PR12MB9265E77DF764A37FF1ECD79A94F22@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-7-david.kaplan@amd.com>
 <CA+i-1C2RnU0DOX0ryYMGZt8PXUD0BjBMpNDBHfX2HpDB0kBgCA@mail.gmail.com>
In-Reply-To:
 <CA+i-1C2RnU0DOX0ryYMGZt8PXUD0BjBMpNDBHfX2HpDB0kBgCA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=3dc870e3-242b-49f7-b785-ab87dfd3538c;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-10T17:20:52Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|SA1PR12MB9513:EE_
x-ms-office365-filtering-correlation-id: 0519debd-cf3a-4a4a-fdca-08dd49f787d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SWRCQlkyajlZemtSaUJ2cFBRNk5FWjUwZFJNK2pRNGMySC95YWlvZ0FjSGJE?=
 =?utf-8?B?eUlpSmdsUVJwbEs1Y28wWFJzRHR1cXAwQ2lwVUZFdENEbkVvWHJreG9iS3lZ?=
 =?utf-8?B?aCtCc2EyREE3OHhIRTJYSUIxUkNVYmhWV0l0VGxHL1JEQjROUmo2MmhHU2Ix?=
 =?utf-8?B?Q00rTytlWkdCZk1XQXNYelFmempkOVY0MmM0aUZqdkN0VHoyeHdmY2VEZVB5?=
 =?utf-8?B?ekh3VTlIZXdyb3dMdTVuTUpmN2ExZDY1dTRMUDhSQmFZWVpwUHRicEdrM2ND?=
 =?utf-8?B?R1RjSFpmU245VS9mVUdiNmpvUit6WFlwOFNWVlFISmFHZ3NrelR0YnNncnkv?=
 =?utf-8?B?b2lxdzZieUlRM2dTWmVoUUFRR3B4SDlUb1pxenhEUU8zSDdSd0dTSVl5bFJq?=
 =?utf-8?B?OEFrSVNXcGQ2c1N1cXZpb3lrcFVvVGRkT2k2Zm1BWDY4dUpqcStRcGpVZWdP?=
 =?utf-8?B?cHNCMmxVVGRJdXRxM0lEelpYWmhqbzJocUhsdk1tSmN1b2JsblJmaHNxUk9q?=
 =?utf-8?B?S2pweW9jNWNpRGJQOUtLWGhiSmJOSTMzeXpDTmtwNVpYTzhHVytHSXZ1bFFj?=
 =?utf-8?B?NllOYUEzcUV3MmZWVDRicW9qbSswN3lTa0plamlTS3NFYkRzZ0tLY2hkTjhD?=
 =?utf-8?B?V0R4UWxKUUh2VjZGMXp6ZGxnMzdQaGpCT0piZ2VmZVp0R2xSbDlzU0czQTZ1?=
 =?utf-8?B?amR6elNFbjZIUXVMdXREaVIzV2pXdWZMZ3BrVE1RZlQ1Y2c2cDRTcVZ3cU1C?=
 =?utf-8?B?MFhTNStzaDI4NlIzNDZwVlJWMFp5bTR6SGxwbDlJRkdoS0xBQWNDa3d0RzBB?=
 =?utf-8?B?RG9jV2dzQkczVVNBZFNnNzBuWXhxdzJFVU82ZVUzWmsxSHV1cGRFNnJ6T3pO?=
 =?utf-8?B?SE1HSG9MYnlvOEFBeC81Zm1MQVhndXAxZWhOU3VubVpEcW5LanB0YkE2Mndz?=
 =?utf-8?B?SHpXSXNmUkJudG5KSEh3Vjk5UnlXL0hlM1NFZ1FiUHp6QVhrbURoV1ovQURk?=
 =?utf-8?B?N3FIWWFxZjB1T1lLM1hoV21GdlQybHhIQzQxS09JN2ltOG9sUlRubFRxbms5?=
 =?utf-8?B?NVE3UDVzenVtZGdrdm03MEk1ejVoTkduYUNNWStYenVTQVlYUFB5bElkK0No?=
 =?utf-8?B?WmNyQjBncThKbEhIVE82YWpMYmh2dFVXOEF1cjR5R3E1YTA1U0JzcjZHQTNa?=
 =?utf-8?B?WTZNMnNlZzNFbnowOWRySEM4dFZTVUFaenhtNUxEUmh5OTVyMGFjWWFGeFRK?=
 =?utf-8?B?andIV09QRm9VWjlwS0N6Q0RWc2trQ2dES2o4NDVDU09odGZiVm80SXVORXd2?=
 =?utf-8?B?TEYxUnlLYzlhNDFWSjBCalBPcmJPS3kwWHBUbXNxenVnQmZWRE5TN2pjWmpn?=
 =?utf-8?B?ZFdKSGNxdFNiZjlPRU1IN3B4YStCUUl6ZmR1ZjlIdjkrUENDRnNJQUhCVkF1?=
 =?utf-8?B?NnVNUjFaR0VPQmZWMkZ6cWpqb0pXUDBmc0FJMEJnMlpWaUtoemtiTE1VM1Zk?=
 =?utf-8?B?Vzk0aHhLR0cyVVhnb1prSVNyRlRvTk9Rd3JnZmVjUzNjcXpmU2wyeXltNTZ3?=
 =?utf-8?B?V1hZVnhLS2Rzd0JmNnNTNllWeENkSE96RlhGNGRJY1Z1ajExZXlncjdoUW5K?=
 =?utf-8?B?TjQwbU5MV1l3MkcvRm56TTNsM3dYeHNPYXc3citxb0NISVVWejhKZnQ3ZnYw?=
 =?utf-8?B?RVpDQXVudEpTUzNaVExCVkN6Wmg0QWxGcHRCWWRNVTZoTHNWQkJKRjQwWjZH?=
 =?utf-8?B?dlNpcTRaUEZoaWY0R3diVWw2ZTJDRjZoK3VydVVoSy8xTlRUbE5NWXFDL0dJ?=
 =?utf-8?B?Y3B4allmSHo1R1BZck53UzhwMW9uTWdjWnhiRGZuNnhNVlJTbTFMQ0pEUVFN?=
 =?utf-8?B?QTZGeXk2S0ZkblEzUmNtazVtSER4OXZtdDRKVk5HQkdiS2QrckgzaHhCampV?=
 =?utf-8?Q?+QQnu6wQcGrJ324T9RbieYzmSbonJLkU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZHVLOW03eSs1VDdBLzRmMG1Hb1RPdkY4aFNCMXRxaXZNSVMvZ0tLSXlLZlRC?=
 =?utf-8?B?OVAvK3h4ZXhod2tuMjVyVnQ4aEgzR1QyWW5jaTlHWW1sZ3BTVWVuNjhSRDdz?=
 =?utf-8?B?QTVoOG55KzQvbzhvR1RjTTV0aTFwR0pkcUdxM0o5VTZKNkVWNXNIblVwaDN0?=
 =?utf-8?B?TytuZGhScmZ4UThsbXpYVE5vWlZMdHRyb3ZwUTdWY2UvbFBkOGFoalUvUVNF?=
 =?utf-8?B?Nm8wZDFaSTU1Z0NoV01GNGhmSVA0UURyOHdRWE56bndrc1NTcVVEalpBbmln?=
 =?utf-8?B?SXd3VC9YR3lnSHVDa3J2TTFvOEUvbGZNMlhoaWNjR2FFcjNEMjV1cHRCVXp6?=
 =?utf-8?B?RHVQcjRlNktpc3FlQ21WTmY5UVlYa1BaekdtU1ZqUlFUQkkvdWVCL0ZWZG9M?=
 =?utf-8?B?aE1CanNQaDNPSFhGdzdzQzVibUFBMUpRZnlDN2VEeE02dGI0OUhJeVdlRi9z?=
 =?utf-8?B?NGtIaXJ5UWVkZGMxL2RXL25LSlBEaVR4WStxR0kvZ2RSMVUwd3Z5RTlHcnNV?=
 =?utf-8?B?R05pMFRiMkhoOHIxNVhhRFRlTVdnWkVwd3JuUG1ZR0xwcjRaOVI3cFJmTHFi?=
 =?utf-8?B?ZWlQYUNIWkZWVFZaSVdXOUlKNy9mV2s5TGFSd3o4aWRwOEhnQ1pPREowTlh1?=
 =?utf-8?B?RGNDd3c3YnJrRElxSVVOdklXSFlpZjMyeDNSUWVUSUMrRFp3YmhiM3FpMUQx?=
 =?utf-8?B?RHRkczA2V1JjUTBmMUttR2F3cDRTM0dkS2VlMXhvNnBWaG5ZaDQyYmtaSlhZ?=
 =?utf-8?B?VTFPRnQvZzRkV1FpVGkyWnNrSDJ0T2xZdVJWb2plL2MrMlVRTXpuYlBPRHZ4?=
 =?utf-8?B?d3FiakVsakQ1VGgwOFZkMWRJQnVDRTEvbG1FaVBrNTRrREZKT0FsVlZFcE4y?=
 =?utf-8?B?dzZvYlRiNmlPTHJTN0t0REVQTGo5Y1Y4bnoxL25VN3djRGJxc3piREJpZUdY?=
 =?utf-8?B?SjFXRnJpbFhuYVhLUXJDV1MzaG5pTnpRcEFsNWx6UjAzMW5PRjF3Wmw3SGRK?=
 =?utf-8?B?S0FObUtVY3E4RmNEd0tMM05wc0xkU2xDQnh5djNJQkhqa2kvd2ZXZktPOTAy?=
 =?utf-8?B?U1Y0N2E3RysrZGtkWnVQUEhBb0MrYXVqYWU2UVVDZnUrZTRLUTF0SWpFSkt1?=
 =?utf-8?B?Y0dFSmpHZG0zamRlcmNrdVNZTFpsNDVUTTl1VnB6cmxJNlJVbGR2YlJqb1N6?=
 =?utf-8?B?Y05FTkRTcVVTZ1J4Qm8xSkNDRTF4bTdqczdweXlMY1orVG5tK21uMlNxVEwz?=
 =?utf-8?B?V2xuWVpZR1VFQisrSUpReEw5clNvUWdrUFltWmFYY1d0aFdSVTJGYWpENVlD?=
 =?utf-8?B?Z0VkN3dzaHg5UlI0azVGT0pmZDJoVFlueHUvRnNacGlPODFPRGdrYlUxcWpB?=
 =?utf-8?B?eWU1enBESm1iamRBVkhxbjZzSDdlZEEzMldaOHU4Z1ZJN0pxOWFENEVSckpV?=
 =?utf-8?B?WTY0c2s1RTQ1RWErMEhWNy85WS8zUndZSnNPUDVZSU50ZitTdnZjZXhpbUth?=
 =?utf-8?B?SmliajhROVJtR0UyVDN0VHlWdHZFZ25hb20wMndGWTBUdTQwbWZpUit3T1ZD?=
 =?utf-8?B?bzc4NU5yQ3pVUVhaRHhLMW1JeEVoUk52dVBWZTZCYVJqU3V4bXM4Q3ZJMnNG?=
 =?utf-8?B?dEpGbHBCOFFIeE0wakE1S283aUNtVFNKaldUS29QQTZXbWFDSzVLS3pYY0g2?=
 =?utf-8?B?SXhrVmZtUWJIcWdCeEg3YUFiZUxzQVZJOFh2bElRa1ArZWNIVndxTFFLU05M?=
 =?utf-8?B?ejFaRHZpSUsrTUxFcjZYNHdRMmUrMnVod0NLQkplS1ZiN0VscEtnelZhTDZy?=
 =?utf-8?B?MmdySkgvVmRvUGx1bEptTFdPdlV6RU1WMjdyRzUyMitLdEF6dmhPVEtKUVZn?=
 =?utf-8?B?VElSQVY0ZVJ0MG9hcGYyY0NUR2VhdG50Nmo4NmFZL0ZhVndhcmF1ZjlwMkRh?=
 =?utf-8?B?SGFRd1pTT0ZWTUxmem50ZDBPREpkbmFIRFJGS3djZDlSWTZQalhwSGhFWThv?=
 =?utf-8?B?WGl4M3ZMS2RCcGEvTjJUVEdPeHNxTForZHpwa0w0YS9yNmZ3akxYREZ0NmJU?=
 =?utf-8?B?dkxQcEJQQjJHblVVTG16THlERUgzdnRBWUlHQ1ZOTGtEaWpneHY0a2xtWU9N?=
 =?utf-8?Q?qKRw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0519debd-cf3a-4a4a-fdca-08dd49f787d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 17:22:44.0690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cHMpFQ6g7ZglZGNVaQB7aZBhDkB+bfTsJNkDX0zv01Ax/HnncR365FnT52123E3u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9513

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcmVuZGFuIEphY2ttYW4g
PGphY2ttYW5iQGdvb2dsZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgRmVicnVhcnkgMTAsIDIwMjUg
MTA6NDIgQU0NCj4gVG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBD
YzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT47IFBldGVyDQo+IFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz47
IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBrZXJuZWwub3JnPjsgUGF3YW4NCj4gR3VwdGEgPHBh
d2FuLmt1bWFyLmd1cHRhQGxpbnV4LmludGVsLmNvbT47IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRo
YXQuY29tPjsNCj4gRGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4LmludGVsLmNvbT47IHg4
NkBrZXJuZWwub3JnOyBIIC4gUGV0ZXIgQW52aW4NCj4gPGhwYUB6eXRvci5jb20+OyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMDYvMzVdIHg4
Ni9idWdzOiBSZXN0cnVjdHVyZSBtbWlvIG1pdGlnYXRpb24NCj4NCj4gQ2F1dGlvbjogVGhpcyBt
ZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXIgY2F1
dGlvbg0KPiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNw
b25kaW5nLg0KPg0KPg0KPiBPbiBXZWQsIDggSmFuIDIwMjUgYXQgMjE6MjcsIERhdmlkIEthcGxh
biA8ZGF2aWQua2FwbGFuQGFtZC5jb20+IHdyb3RlOg0KPiA+ICtzdGF0aWMgdm9pZCBfX2luaXQg
bW1pb19hcHBseV9taXRpZ2F0aW9uKHZvaWQpIHsNCj4gPiAgICAgICAgIGlmIChtbWlvX21pdGln
YXRpb24gPT0gTU1JT19NSVRJR0FUSU9OX09GRikNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJu
Ow0KPg0KPiA+IC8qDQo+ID4gKiBFbmFibGUgQ1BVIGJ1ZmZlciBjbGVhciBtaXRpZ2F0aW9uIGZv
ciBob3N0IGFuZCBWTU0sIGlmIGFsc28NCj4gPiBhZmZlY3RlZA0KPiA+ICogYnkgTURTIG9yIFRB
QS4gT3RoZXJ3aXNlLCBlbmFibGUgbWl0aWdhdGlvbiBmb3IgVk1NIG9ubHkuDQo+ID4gKi8NCj4g
PiBpZiAoYm9vdF9jcHVfaGFzX2J1ZyhYODZfQlVHX01EUykgfHwgKGJvb3RfY3B1X2hhc19idWco
WDg2X0JVR19UQUEpDQo+ICYmDQo+ID4gICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1JU
TSkpKQ0KPiA+IHNldHVwX2ZvcmNlX2NwdV9jYXAoWDg2X0ZFQVRVUkVfQ0xFQVJfQ1BVX0JVRik7
DQo+DQo+IFRoaXMgaXMgc3RpbGwgcGVla2luZyBhdCBvdGhlciBtaXRpZ2F0aW9ucyBpbiBfYXBw
bHlfbWl0aWdhdGlvbi4NCj4gU2hvdWxkbid0IHdlIHNodW50IHRoYXQgbG9naWMgaW50byBfdXBk
YXRlX21pdGlnYXRpb24/DQo+DQo+IEkgZ3Vlc3MgdGhpcyB3b3VsZCBuZWVkIGEgbmV3IGVudW0g
dmFsdWUgYnV0IHRoYXQgZG9lc24ndCBzZWVtIHRvbyBiYWQuIFdvcnRoIGl0DQo+IHRvIGhhdmUg
YWxsIHRoZSBpbnRlci1taXRpZ2F0aW9uIGRlcGVuZGVuY2llcyBsb2NhbGlzZWQgaW50byAqX3Vk
cGF0ZV9taXRpZ2F0aW9uIElNTy4NCg0KSSBkb24ndCB0aGluayBpdCBpcyBwZWVraW5nIGF0IG90
aGVyIG1pdGlnYXRpb25zLCBpdCdzIG9ubHkgbG9va2luZyBhdCB3aGF0IG90aGVyIGJ1Z3MgdGhl
IENQVSBoYXMgKHdoaWNoIGlzIHN0YXRpYykuICBMb29raW5nIGF0IHRoZSBtZHMvdGFhL2V0Yy4g
bWl0aWdhdGlvbiB2YWx1ZXMgaXMgZG9uZSBpbiBtbWlvX3VwZGF0ZV9taXRpZ2F0aW9uLg0KDQot
LURhdmlkIEthcGxhbg0K
