Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6E42D323C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935776; cv=fail; b=mEOHcfVTIjxRacoiIgcP4MCCbdP/btgqvQsMS9qeSHq4+rE4c2BOoSQ46r2++62Z5JUEldvxWK7lpbBOxx/aQQRfmBwDwvVD9oYtA/jqNUUCbU2xrC9x5UHw1VHoX12/4xKrgUsb5JTvOc0wN1C9JFSzTmWbnxT4gE+mJhija7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935776; c=relaxed/simple;
	bh=tDZmCAvB3fdq2tM7Jj6FIO61yD18fAaK8ekidtoMDaQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cb1s9Qd9eqUIWzZpnnBDhevlba5xsjlq5cIxSwoi7RHJeUoNhN+/2ZkV/fIUSsUqKSr2EDjZg9OzBGkmK/vWVL+zzsP8NjFYn6FCg8yzetqROOviUGVctIELp+AR2vX/eutg+u5rRrKYXkHvwKGtgB0xB15pPvlc90g9t8vC/vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=taTrQzuT; arc=fail smtp.client-ip=40.107.92.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="taTrQzuT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhq+5HdlnzUt/KW528CI9BYuBdPTRcq/Jcx2fbAaXo0+f6aEopjhTlo+DPJKsZIXy+7L9+Qfdura9oCwAJ7vMVBUVPx4V2zGWphmsJPTQktCBJzyimzvEkif2i1oJY8BWjgjDfQkMhxLQgsogCghWJhFiwKbMbznFlBUmlDnuA9NC7q1C3BtGv7JJtd+y40OxxaGp2dAWO9euWM73laBBQGIpq6RVSd2p4OedhbusgOQYcKyO70O497IoB39VuK2541VuvHsBiEf6kfILuGoBHbfl+dSkC5ZOPZRvkmpHOQ8Fixkuld+nC8rEeNNkk4HIVB5T79kxELNjMz9OU9gYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDZmCAvB3fdq2tM7Jj6FIO61yD18fAaK8ekidtoMDaQ=;
 b=Z9WZpgWjCum8JpSoq537cYmLTXdE6t4zQ3C7mjoFpoCkQ/p9kic9pj4qZimnMWu1btBxoOUfJE4z302FKWKj3+Aq+yuXkJqt4ycIBLHkK4Djyklao8To7NtlmruNz2Lb6gpNqmhR4Z/k9v6/rTMsEe3TCrzi1R4o4CpSonoXLes4SpdpxVaaUmOAiWk3EpAkWLSzJFSlGB1GDQDZj5ZhREAHkrFwbgLocBg8HIoR52C1S/trH2bn+sJdJGKg8BNfz2l3oaEn8C//SjqEqffxcI9Sy8T8CcHiRkpZ70nAxX5Hv8rDfk69vigCajuN8IXAaXx/pNnV1VU1Ep1SVAbApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDZmCAvB3fdq2tM7Jj6FIO61yD18fAaK8ekidtoMDaQ=;
 b=taTrQzuT/g3PwpA1rqK6aXsuihjs5S2/O0NCOEks3ni6uPbjxPuWm9ivY7yvaqHpNm0bvdRX2ndB7R1WtDg8dVDRHOTjEguTJt+62AV0cZCEKupKcYQkckQCZ8IqIpnprGxvTKCCo1uGdrB4A65iCfvLSx14PId+gfZmiWq08kA=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by SA1PR12MB6948.namprd12.prod.outlook.com (2603:10b6:806:24f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Tue, 29 Apr
 2025 14:09:29 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%3]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 14:09:29 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
	<peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 14/16] x86/bugs: Restructure SSB mitigation
Thread-Topic: [PATCH v5 14/16] x86/bugs: Restructure SSB mitigation
Thread-Index: AQHbuQXbRjzPnYfTj0SVYfxPgcSiL7O6rm/g
Date: Tue, 29 Apr 2025 14:09:29 +0000
Message-ID:
 <LV3PR12MB926510A74AEF92143C83828C94802@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-15-david.kaplan@amd.com>
 <20250429125405.GGaBDL7StMBtnkuG3S@fat_crate.local>
In-Reply-To: <20250429125405.GGaBDL7StMBtnkuG3S@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=759e722c-b0e1-46aa-85d4-8e5385f28197;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-29T14:08:54Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|SA1PR12MB6948:EE_
x-ms-office365-filtering-correlation-id: efca014c-d02a-4ccb-83c4-08dd8727752b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZkJmZ2FjejQ5TDB1YXV0Zm8xRzlpdGxSOVNpMG9ia05OQ0NoSjNHcFo2elBC?=
 =?utf-8?B?RE92RlZUcFZac29CS0tkOStiWmdKN0JQU2I5YlhWdHpyT3I0QnEwdG8xVS90?=
 =?utf-8?B?MGh0c080Q3hUZjhPdEVMMGFiZFgrL0ZqVE1OY2t4NmU4dTR6Zlk1Umw0ZG9M?=
 =?utf-8?B?TnN4SEdRLzQ4c1NMVWw5bi9Ra3NGUE8zbUxQUnlsVTRBbVhBMDd2TWd0Zisw?=
 =?utf-8?B?dW5OVmRXV25xbTR4bGFTT3UxUlE0WitCZDJRQ2poSktMTEYxSFhZVlFyOTA2?=
 =?utf-8?B?eDlBZy9scExRbWZTYzJSVGRrS0RpbVB5Q3FUOXpZdVVybHZKKzZlS05LdFkx?=
 =?utf-8?B?bUsrT2JhQXU0Rm9PVXFYWlhaM1MvOVhCaGFYNUowV2orRlhUVVowU2k2ekJP?=
 =?utf-8?B?MEhqem1sUERZRXFoZkU2RUtaL3k3WWJpTldFNVhZcHhGeFVrL21hZEVOcDJw?=
 =?utf-8?B?MDhLRlI1TDQ5cWE2RXpsT3lrSlRSaFc4bUNLaW5hYVFSaUhML29kUUxvZGQx?=
 =?utf-8?B?cFZQTVdIOFRtdW5NSGdPR1R5YnIrTEMxNnQzYXpraklabkhjZlBVSFpwRWNs?=
 =?utf-8?B?djU5dXRzcjl2RTRBUkQ3NzRWNU1Ed0FXL3dadFlkVU9qUHRnbjNFeFJ1blVD?=
 =?utf-8?B?cTBKanNiUVhmSDhNMDRaLzBnTWxFNFJOU0tSOVAyWCszbUxIaDhyMVZGWElm?=
 =?utf-8?B?eGQ4WHR4bHNlQks3MzJLbW5YSEJUTUQwSlluODZHN3FmMXRhRG0yY2FtZHM1?=
 =?utf-8?B?S3dJMnJxcFg0cXR4T1daVDZHV3pCTUZ0bzkwbnNlOTVjczBoZDVtMVQ5V1RG?=
 =?utf-8?B?ZHUzV3dvWGVDZ2dNRFdWb2JoU0t6dFI1VS9ERVhFdUNaTjMvbGNZTTQ4T1ZZ?=
 =?utf-8?B?NWdIK2pSWjBFek1XN0ZPbitHS0w0MjV3eUZqdkJqY2NWc1k5T0VIUTZhZkFu?=
 =?utf-8?B?OW5TTGZHekNRRVI2WkU4emZQelFQS2ZadjltSEtNS2FFbFpGbzdwM0NBVHhQ?=
 =?utf-8?B?UERZS3oveXozOVpFamZha1BDMzg2Vi9UUHRKZGU2UG5IN1d6dFBPWkxuMjI3?=
 =?utf-8?B?ekg0MThzSW1GREs1bkF4Wnh6WE1xSExBNE9rSC8yQi8rckZkZTBRVUdiTGg2?=
 =?utf-8?B?STRaRVFkSE5ORkJUN1lKbW1ka2kyL0N2K0xXaVplZU1EU0ZjSGY5Y29rczJM?=
 =?utf-8?B?YjJsa1d4ZFVVcGREczMrUUdLRlhVS21FemI4M3FQV3NscHZtTklvbTBWMWtM?=
 =?utf-8?B?WUFCQzBaTWN5K0ZpZW05Q01HbldHaTdsc2J4ZUV1T0JUalBQSlVQSkZ0SE1y?=
 =?utf-8?B?TlRxQUpHaE1nZmMzQ05oZVZ0MW1sTW1NVVRTV1BNZTE3Z256SUdjWm9vVW5x?=
 =?utf-8?B?eFRMWEhnN2JYRngzelZDOVBoOGcrdXZPQXRiT213ZmxuK0hKTUVBUGZMcUJZ?=
 =?utf-8?B?NzZYWmVkZ2Nibjd3ZFZtYUh3TCt1R2J6QUJLVk05czUzTFdkdTZENXAwN1gx?=
 =?utf-8?B?bmNoelUybTNhUFhXVDlDQ1BzdndHT2JEdzJ4ZWtUV1o0NzNPcGxyNGZwU1Yy?=
 =?utf-8?B?V2ZDVU1yWDZBUkMvdmpKS29sdWxHalF3ZVJJL2VmclBwY1NpYk03ZzBUSlVU?=
 =?utf-8?B?MzFpSzZEeHk4a2Z3UG1EWkNCamdCbFh2ZVdkeS9adC8wRE4rb2ltMDhKdDJW?=
 =?utf-8?B?QUY4cTBHeWN3UkZNU29Pb3l2SjRXVys1ZGdlQWd0Zjc3TDRFZVhwYXMrMFBZ?=
 =?utf-8?B?SnJVdnBWaWt2YldmMEx1S3Q4T0lwdi82VysreGsvNzIyUWJhaWdBOVh3N2Nm?=
 =?utf-8?B?ZHRsQUZmTVIrR2UwaHBaSk9FaHZPckZPYml3di91aU0zUzgzQ0N2TDJmcTNq?=
 =?utf-8?B?bDQ4TXA5dmVOVi9CRjVIS2ViTFp1NHlrWVZrZkVEQ21CQ1RnNktFbElhYjls?=
 =?utf-8?B?RHI1L2FGY1RFZVljR2JkeHorVVRtMld4dmtUcThHbXJaQXVhUmd2cnVBYVFp?=
 =?utf-8?Q?q3ZGrmT+D7Z7qlgqNjz7udefqqnWf4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZjhsZzQ5OUZERDVvNldjRkZsb3J5Nk1EWnNJVlJmWnFLSU4xcURiWXRIUEJU?=
 =?utf-8?B?ZEMzWXhKMHZvd3Z6Mmw3M040Zmgwek90Ry8xRmU4cEpTcGlSc3JUOGFodHFz?=
 =?utf-8?B?Wm5sSGRiQ2lQY2tGS0FaNjJmZkpXRUUydXNOMUhIRyttVkd1blZiS08rYUhJ?=
 =?utf-8?B?TkVaQXMvVHoxYlR2TExqK0FiZXN4TVlrVkM3NzFHdlkrdzdSZ1NOdFlFQlVI?=
 =?utf-8?B?aUtOZk5qYjJJQzZFZC96L1pOenQ0TlFxeVBqb1BteVIvbGtOZlRWTytlNnZB?=
 =?utf-8?B?ODhIYzI4Q3Znd0ZNYkRTMFZkVXNjN2RPdGs3RWEzNzZXdS9hdjJJL2NLQmFE?=
 =?utf-8?B?ZGZhSHNvMU5YZ3JaZ0I2QURrN3AyeWZTeGJXU1R6bkg4WGI4MERyV01wT2V1?=
 =?utf-8?B?VUkzSFJIWHNCUW1VV2YzS2d4S3ZNSUtRU2JiVjR6OGNIQ1ByZ0hSMWh0am01?=
 =?utf-8?B?R09manhJaFhuTk94aUJMUXdsN3AzaVNTQ2NLVytQSjlWNXRKR0lGNjZUS21l?=
 =?utf-8?B?dmhuUndzSmtjb3A0YUFYd01TSDhDOVdsTmo1c05UUHFxQ2RpSVlLem5MbTc1?=
 =?utf-8?B?NDZCMnZzTlpSaFcwRWNXaFBrV0ZWc1N4RXh2U0lXd2V6UnZEbVRnWXo2U3do?=
 =?utf-8?B?L3dtbDE0T1JJMXNXZGJKTyszV0g0QzB2YzB4a3hha3NyZmdoMzUwZXc5R2FU?=
 =?utf-8?B?VDc3bUprakh4RGc4L3JRNnlXTGdSL2ZyWHRCVDVta0V0dXFSK1V3L2w0b0lI?=
 =?utf-8?B?ZjdYZjFBeGllK2RXT20wVUtoUmVzOStzb2pKTExBOUpYU3prQUxWTUNGVllY?=
 =?utf-8?B?YXpCRkR3TmJIWXlNVnZWdnFRbTNIZnp3dXlDTE9QTzJMa0I5QUJqNVFscUI5?=
 =?utf-8?B?UkplMGVjUHBCSTNqckNPUVdLNFdtcW1oaC8xb3ErRmQ0M0hwbXlnR2pLMXdT?=
 =?utf-8?B?c00zTEd6a01RSkxuS3RoT1M2OVdGOGUzV0dZWkxIOWlvQnFTS205S1YvUEdj?=
 =?utf-8?B?NU1YYlR1alFCOC9kR0MzQ2JRWUNGblVwcW9CYmxLb01FbDdoVGdlYlQ2VXYr?=
 =?utf-8?B?MzRiRVp3eGNrRUkrWnI4MElEek9hUzNDV0dxQkEzcXBQcGhuMEdJZldEUm5B?=
 =?utf-8?B?anY2dzZ6eHUzQlFrN2hmQUl3R0tJT1lVZ1VHL2xHMStXS0hUOERDb1lrcUZa?=
 =?utf-8?B?T3VYV1BDejc4NWg1cnBLb3JWREE3ZHdHcGdDanpMejRRUVovM25GdmEwazlL?=
 =?utf-8?B?T2oxRk1uR2d6WDlOWWJ5YUJXKzhDRDFrTUdpdTBIV3BJRjlvbHZkYU16dE50?=
 =?utf-8?B?aWMzUkRHcjZrOVJzREpPS1FqRUU0WjRpZ3FpNVc5aXlaZFJYV2pHbnh1eXF5?=
 =?utf-8?B?S1VRQ3cwcVdJeFZlcTdUNk0zVWNCZU9BUVdYTyt1SW5Oa1NhMXN6cXpPTGxG?=
 =?utf-8?B?SUxhaU9MZ1RlQnArUEk4NnJidmwvdHpvV2pmRExyTThDSjcvaVRMM1NLQlM0?=
 =?utf-8?B?SVhab0ZUOGxRMEgxcG1mSmdxeTlYRXZDS2dtRVRzakVGOFNTRHBkQnI3VmR2?=
 =?utf-8?B?NWRJRVpEZE00Q0dxY0pueEtra2N2NU9TeTN5ak55c1pKWmZtSFlwcTR3aVRQ?=
 =?utf-8?B?WW1pL2s5eENKbzRCdUxyVU5WYVRuR2owNDZKSUJVTU5NQ1NUeXRvVEQvL2xo?=
 =?utf-8?B?K21oTU5nQ2M0ZGR3cS9qd3pxWlZSOXhjZ21pSjJyTmlNVkdQMHNhWStGL21k?=
 =?utf-8?B?N1o3Y3hvL0hnTnBJcndDRUsvdjExTVRZWnZiTjZ0U3pldE14RCtYeFJTUDBD?=
 =?utf-8?B?WXdtcWRyTzYrck51bnBzT3pJS0YwNXlBNGZhd3hJS0pKWnorYmdmSzRVamNn?=
 =?utf-8?B?SHB3TldKcmVMaWZGRi9TL2RteC9HSHNaY1RpeVNKcDY4OUE2ZFpGc0k2Slgv?=
 =?utf-8?B?eWszQzNNRTFzRnFVQk84SGwwa2lkbUJCTXZDYThSNFBQYm5sNU9leXJJWXBP?=
 =?utf-8?B?T0RhOFNNY2wxQW50ZFNRZWYra1Vnd3hDaEwzSnVmdnFmaWxINHh3NUZvZ2xY?=
 =?utf-8?B?WkhJalk2OHAxMTBzTU1scXY2UkFBSU5oTmJncWo0aG5XOEwwOVpkN0NrNjc1?=
 =?utf-8?Q?NABg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: efca014c-d02a-4ccb-83c4-08dd8727752b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 14:09:29.5299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wG+etBiKxGZS13aTRb2o0IvyulGYqXTH8dk9hW6heC4VrfIa6oN63EwLpoYSqxMI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6948

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT4NCj4gU2VudDogVHVlc2RheSwgQXByaWwgMjksIDIwMjUgNzo1NCBBTQ0K
PiBUbzogS2FwbGFuLCBEYXZpZCA8RGF2aWQuS2FwbGFuQGFtZC5jb20+DQo+IENjOiBUaG9tYXMg
R2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT47IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5m
cmFkZWFkLm9yZz47DQo+IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBrZXJuZWwub3JnPjsgUGF3
YW4gR3VwdGENCj4gPHBhd2FuLmt1bWFyLmd1cHRhQGxpbnV4LmludGVsLmNvbT47IEluZ28gTW9s
bmFyIDxtaW5nb0ByZWRoYXQuY29tPjsgRGF2ZQ0KPiBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4
LmludGVsLmNvbT47IHg4NkBrZXJuZWwub3JnOyBIIC4gUGV0ZXIgQW52aW4NCj4gPGhwYUB6eXRv
ci5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjUgMTQvMTZdIHg4Ni9idWdzOiBSZXN0cnVjdHVyZSBTU0IgbWl0aWdhdGlvbg0KPg0KPiBD
YXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4g
VXNlIHByb3BlciBjYXV0aW9uDQo+IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcg
bGlua3MsIG9yIHJlc3BvbmRpbmcuDQo+DQo+DQo+IE9uIEZyaSwgQXByIDE4LCAyMDI1IGF0IDEx
OjE3OjE5QU0gLTA1MDAsIERhdmlkIEthcGxhbiB3cm90ZToNCj4gPiBAQCAtMjIyNCwxOSArMjIy
NiwxOCBAQCBzdGF0aWMgZW51bSBzc2JfbWl0aWdhdGlvbl9jbWQgX19pbml0DQo+IHNzYl9wYXJz
ZV9jbWRsaW5lKHZvaWQpDQo+ID4gICAgICAgcmV0dXJuIGNtZDsNCj4gPiAgfQ0KPiA+DQo+ID4g
LXN0YXRpYyBlbnVtIHNzYl9taXRpZ2F0aW9uIF9faW5pdCBfX3NzYl9zZWxlY3RfbWl0aWdhdGlv
bih2b2lkKQ0KPiA+ICtzdGF0aWMgdm9pZCBzc2Jfc2VsZWN0X21pdGlnYXRpb24odm9pZCkNCj4N
Cj4gSSBkb24ndCB0aGluayB5b3UgbWVhbnQgdG8gZHJvcCB0aGUgX19pbml0IHNlY3Rpb24gaGVy
ZSAuLi4NCj4NCg0KWWVhaCBsb29rcyBsaWtlIGEgdHlwbywgbXkgYXBvbG9naWVzLiAgVGhlIHBy
b3RvdHlwZSB3YXMgY29ycmVjdCBhbmQgaGFzIHRoZSBfX2luaXQuDQoNCi0tRGF2aWQgS2FwbGFu
DQo=
