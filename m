Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2514124FC04
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208427; cv=fail; b=XT4t1m3s/ELjR/Z6cxq/IRu/0BjTtwXogwzCcLoEcOX7tGnQBLZmryC7amhpyRqYCYkR8rCxkg40dn30qC/h/OiywWaVdAuxPbEKKZFK409TlMZYWq03f+QUnQIOvZC6foRCr/5DoDSI/Eqk92IHPj5pB2Wtrjm4bQwZIYj4R9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208427; c=relaxed/simple;
	bh=hnLjPbo4/X3p9F5yYntE71CHTZiNiuWJ7O38RJMSq7M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bjTUk1WReGijngXiS27Oqk7iAy1sjCiG/lOaK02ToBQgiVWp4JeNmT9E+vT60yO1nNlRk3tX2sWH+5nhG+wUsjQQPbzQKP7R3oBA3DeuCmPHLD3Y20V9tB9eco0khXr0Htd+3J8EUZsZ0FwQiPkB/gJ10o6IvfkT4WwFTKM5J5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iPlNgmZn; arc=fail smtp.client-ip=40.107.94.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iPlNgmZn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmODwqjNehOjG8hbPzBA0FA8/rvX+VL8yo0k8h86BMnc3N/ZBQcqvDQskmsRapy0MCOT395CrlKn1MtepjQ19QlajtraOmwxN1z9KMJRQM4GJAnZk4NhSzkgU0GDJHojRTnePVHNcr8E/mrv6t63/KkUrrN6UhC3hKbIzDXU6FnfbnX4Lw3j1gzh16gKu9UpBmp5LLOHKkPbaye8sUmp2UB01WjjA1W//QnV/kNfPxyEzwH7O983LgC96Ht+zcAzeLVF06Pur68smEndnRNU6i0GQ8mz8ABElK5egEjN+QDiG6agJ5v8cdtyYOnBXAcB/R4ajD+AdORhRH51djUnjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnLjPbo4/X3p9F5yYntE71CHTZiNiuWJ7O38RJMSq7M=;
 b=LjER9wQDUDJAbJt4QWSc+QOfHp4gApHazzv/WhBytkA8NKZBwcXxuOfxB3r3zAIhr8g90meRHo1lyzM1sWGwKb+GU38exRjIfAFW5fLJmRcfWoCtsjRwlmN0lDn3kdc+wB4pZuvp6NGCt8AdGgMWAU1AtqcsVweu1UmdOHnMmhzYzPJjIVH78a0acxOhnnSNOXY9ygfjI1HnK0tM5WsQvtIfaLKd2F5pns87xNSXq0L9c9RRlu+4e2i0S6gP9r6/IZBsPEMl0DP53k4EiH3w5Ero2DgIvU1cpbeEi9f+X4nKMm5Il1f4BiiPpxQYGB7I9ba5mmuB2Vkhn3aZ7fgysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnLjPbo4/X3p9F5yYntE71CHTZiNiuWJ7O38RJMSq7M=;
 b=iPlNgmZnmDcr7QCVesvXPFmMZsT2XJ6mFZkLZXqIMwxYcBaVDKo9QUnnv3vstOeIpgOpHGTwYQF8YvCO2u9K4sirDiDHngu21jyUOqheWayTIxyTtfb7hLn1KjR8pCTpbncrtcw4wRn2/y+Ix8YhFJWU/ayFEHbTQBxRZCLHBzc=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by DM3PR12MB9413.namprd12.prod.outlook.com (2603:10b6:8:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 17:27:02 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:27:01 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Brendan Jackman <jackmanb@google.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 10/35] x86/bugs: Restructure gds mitigation
Thread-Topic: [PATCH v3 10/35] x86/bugs: Restructure gds mitigation
Thread-Index: AQHbe94ougT1ZdFfDUe0wp2agygcN7NAyVHg
Date: Mon, 10 Feb 2025 17:27:01 +0000
Message-ID:
 <LV3PR12MB92653F0B1D1D814A47591DF594F22@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-11-david.kaplan@amd.com>
 <CA+i-1C2LD1A-QjTmGv-ONB-1+jmecZSU7i__G7gf=81VUNMKCg@mail.gmail.com>
In-Reply-To:
 <CA+i-1C2LD1A-QjTmGv-ONB-1+jmecZSU7i__G7gf=81VUNMKCg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=0bef1459-6df7-4b96-8937-839ea51afa51;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-10T17:23:40Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|DM3PR12MB9413:EE_
x-ms-office365-filtering-correlation-id: 66a3b324-7005-4635-cdcb-08dd49f8214d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YjlaVWxwejE0U2l4RUFBZVJkekFaUDh5TVBIbW1Wd0xsNTdSZ2xPNVB3WXZW?=
 =?utf-8?B?YytMNU5Ga0lDRVdhVUZiR2ppTVh6cDFudEl0aVhaVll6eVNQaHgrZFlxM0RJ?=
 =?utf-8?B?YVZxRUE4bllHUk1yTkJ6d2JZcmlLWEgvcHJpT3lQNDFjYUNwYlljWE4yRmhM?=
 =?utf-8?B?TDhNUkhjaEtMVWJ0U2pnV3k5U1cwWmMwYndka1FIOE81c1dJWGhCTkthL25x?=
 =?utf-8?B?ZCtaRkJPSDBpMTB5QjdMYlFtSUdPWm0wVEVJOWhMOFBrblZPTXhSNjR4WWl0?=
 =?utf-8?B?bjVkTElveDNhM1RhcVFxczVYWkhIQjdtVmRKTnRwSDNOSzRhM2RGL1pQTkJT?=
 =?utf-8?B?T2F6cWRuTlY1QmE4UE9sLzlOSFhtL3owL212YTRRdnVNUVU0MTkyelJuem5H?=
 =?utf-8?B?K1JmanZJZUlwc29NMngyamtDTndOOWhWRDk1QWcwQUZvc0gwV1JFOC83Nlds?=
 =?utf-8?B?cVRteStSd1lzZnREM3FZL2kzNUc2anpFanNMQlBWMUxSUFM4WXArVXBCczd6?=
 =?utf-8?B?enMxWFNkTkZ1T096Z2RUeldZV3FXanZMWm10Z2xoVUFNNTQ4WjZIb0czSExU?=
 =?utf-8?B?ZkpyVzYvNjlUMGlkRWlXRGFab3RmeVl1UWczcWpPd3l2WGMyc2xFMEx4Zjg4?=
 =?utf-8?B?bGMwbHluMzhWSkxTTk1yL2pKTXlzTnBhZUUrTG1OYmt0ZWhNSkhieXFUelRn?=
 =?utf-8?B?Q1BLUi9ITmI3QVZmQ3JPRFB3NDZlSE5rQTBsUWpVa2xlTnl4ajArSFhxdWNH?=
 =?utf-8?B?ekNPSGlOcU5jMkt6Y0ttSVEwOEVTZGtiaENWWG1wYis1SG55NUdkTDgrVWY0?=
 =?utf-8?B?SFFnM0hoUTlNcEJOeTNEci90SmFWS3BuQktTZms5SUFqdndwMzdFcXVIRk5J?=
 =?utf-8?B?ZURDRmlPc1dXanNjZi9MVDh3NXV2WGhsMlkwQU50Q1pGb3h0Z2o2V0lHM0dD?=
 =?utf-8?B?UnYyV3ZxdDRCczlJbzlHV0ljYkFpN3FhVmVOVzBpejFIM2UzM2RNR1drelk3?=
 =?utf-8?B?VGpZRXdtWFhqODJPQ3BhSmlnLy9sZzZnUzdMdEpKNTZtck9LeHZscU4wRWlM?=
 =?utf-8?B?Zk9FbDIvMS95SGI2NCtrQ0hNUFE2SUcxZDhvSXplUHlSSjhDbmhYbkhRUnF4?=
 =?utf-8?B?TW84OHNtaGRYTUlUV3UvOXQzTDhYR2t0OUdFWFhVSUdLc2FjcXoxd3FGUnRa?=
 =?utf-8?B?NGRsQ2hpM1NjbjJIUVhZM01vNFVOODgzRG92YklqVmlBY1prWDRXMDFGRlJ5?=
 =?utf-8?B?RTVYNVVualhnczhLM1JDMVpQSm15TzdwdFNqSHpBSnFtbWEwdkZJVmxrVm1X?=
 =?utf-8?B?WW9JUW5YZTFleEFiT0thZllLQlVNK25BVXdFdVpXa01LOUpESnRCVXhwZXFU?=
 =?utf-8?B?TVk2SzRWSHkyRHlaVUdFcmlVd3poeWpuWC9ybXcxbGVZQWpRcjhJMDhucURq?=
 =?utf-8?B?TWVrZCtqbU13SDVMc1dZd05NaWhXVHd4ZU1YOVViN2lFMXdRaStTcitvN2NS?=
 =?utf-8?B?WGFRYVJoUEluREtPUE0wWEE3UEoySndYWDBObU5XekhHbU9La3UwTVJHaUtB?=
 =?utf-8?B?Rm1XUVdORHRTNjNDSDVIQTduQXRUSGtZQ3BRMFJaWEl6QnVNQ2QzYXYySndO?=
 =?utf-8?B?MlRQdEphYnQvbkVBc1htcGg4Y2dkNmF1RWhJa1RwSmMyeENHTUZvOEd6dGx4?=
 =?utf-8?B?QW4xUFVIdldqby8zSWZvdXFnZ1p6NVJKeGVxOUh4T09hblUxZFJndjVjckpu?=
 =?utf-8?B?eXU3Q1NMN2RnN1NORGkxS21xOFFicEdhdlRGZlVZWjRQbW0wdlBnWGs1aTM5?=
 =?utf-8?B?T2N3bDZPNHh3UitBeEJFVHU2Ri9PbmFocWxMUXpiMlhWMTBvMnBndGcrVFN4?=
 =?utf-8?B?ZTJYZzBiQmJJODZlaWN6Rm9wOStEY2FuMTA1RitOdlErUE9NaFZBSTM4UnZo?=
 =?utf-8?Q?I97Z471IRUWsNir41OCibjRuLTQDjLyM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzZMWXhDbU94RGFwVnc5ZXYyYytPd3BFeEtxK3JVNE9rRlNLbVNSMTRGL0Jo?=
 =?utf-8?B?a1dVb3pXRUN0ejZtS3VQTmRaWnI3RXZGZTRPWGdZUUJEUFVXR2hDMzJ2ZVpo?=
 =?utf-8?B?dURJajM5SC9zVExhZ3dGS09XdnVXdjJHVkxENVlQWTVKcnZ6OXREZlFXelZY?=
 =?utf-8?B?dXYzUG9XOFp2R3ZLenF0R3EzdWVJMUhwZlZyaEZLOFEzdXVMc0NveDA1RG16?=
 =?utf-8?B?a3RKeGV0VUxjRUhYVWtOdmg2VnJoZXduR3dobENuT0gxTVBaT0FGUnpDVmFX?=
 =?utf-8?B?NjRRUXVHNVRubER1M0RIVGEvUEIzODZKNDh2MkMxTitETDl3am9FUEhOeFNW?=
 =?utf-8?B?UW9PS1N4OVg4RmxOVWVOSDUzN1ZxTFAybmxuL3Y4OENncUljaXgxaDFEcnJD?=
 =?utf-8?B?eStBRmJvdTZvQkNuSHN2SGtPTThwUXVGVlM5VWo1cmFIN2x0OWZCeHYwVnRR?=
 =?utf-8?B?bnBCZjlxQm1aOExOZ0ZPajlYWHk5V2tnOXNNKzJSWDdYQ3NsaVovcGhrcElG?=
 =?utf-8?B?R3JHbW1mMEtCY3RSdWpjcFBBN0lxdnpHS2xpMnhLR21PQ3luTXhUa1J3YTlu?=
 =?utf-8?B?NDZyOGNvT05kTkk3QkY5QWFuY0ExaThQVHBjaWlVeWltVU45R3ZVREFWZFFE?=
 =?utf-8?B?aE4yRmZlSC9NM2lqRFpTakc0aTRrdk5GeEtoZzRUaFJMNVNXUDlRMEJYNTFo?=
 =?utf-8?B?aW5iaHFib3dieFAza0hFZ1NyNk1qTGdrczU4bXZaTm1TUTZwdHNHbDVYc0Nu?=
 =?utf-8?B?cVRydnJZcUFTWmtCcDZ6dGJiRXM4K25rU0xpdTRxaFYyazNrMXdUN0dXUlJ4?=
 =?utf-8?B?Ri9uZ1lLMVlvSVJWRHdCRlUrekxPekV3eWZWUjgwNjdHY3BQcEs2U084eDZX?=
 =?utf-8?B?UGppaHpVejlheHVJRFJTcmJrZXRZTjdBcDVDQk1XVDNFY1JhcHdIVmtBK0tu?=
 =?utf-8?B?eUVmWmRpL3UzT0xzd29Kbjl3UkdGNndsM2pZMjNyVW8wemlZRVhHWHdBTUNn?=
 =?utf-8?B?VE9UMkdyWCtsSTdYaEt2RFhXQXpBKzYydXJFbi9ubXlxNjg5Q0dVUjBRNUdu?=
 =?utf-8?B?Z3NxQTQwRFZnbVZBN2tQSUtXUlB3ZDRJR0Vzd1BsN0ZMMzVOSjk2U3VPaFIr?=
 =?utf-8?B?R0wvQlpid1VVZmlIQjd6VlR3Y3QySTdLUXd6anZBQlBIWE82S0RYdXV3M2p6?=
 =?utf-8?B?ZHdxeEZnZFdOZ1V4TkQySjhrZkpyVE9BOWlyb2JSamNVanlYNG0vck40UUxD?=
 =?utf-8?B?TkxLcGhJVW1Ec3IrUkhkYVZTeVQ2VHZna1VFWnl1cnorNjVJNzYyUWRvV3Vk?=
 =?utf-8?B?dEc4aEs1Zlh5dmIxakJTcEcyNVVDM2hXYkVGQ2VLa01wZCtIQUh4QmpFZzdM?=
 =?utf-8?B?OXNPeWRkRjVSdzZDUVdEUDN0bU9jOUtDWm1ZWkpNODFIWi9pYVV0M0hMeWJN?=
 =?utf-8?B?UW9YRDJqMnFwMWR3bWdSS1MwUWxyYmxTRkRVcFNHZy9OVXhWKzdoSWhPZmwv?=
 =?utf-8?B?cWVLSTROL0JHalJwTThpZzZRdGdacWEvRE9vWWtmS1MxK3lRdjhIdE1XQjU4?=
 =?utf-8?B?enliTS9UM2NZZ0kxRkZUSHA2MlY4UEpqZlFLWlgrQTkzSnJmTGFHUW5WakNU?=
 =?utf-8?B?Y052YUp4QnFmUFVVVWkwNlZSQzE5dW0wNHI1WFZLNThackh6dE4wYmpSS3Rk?=
 =?utf-8?B?bkgxVEVNZXNoZElpTG1nM1NPNER2SUNYbUdNYllDYWFqQlJMWVFBZWtIVlFF?=
 =?utf-8?B?MzYxVGNaT3dNQWdabklDZkdjWlpOMWRzVDdSYnYxbDdNQm5seW9jSk1kS296?=
 =?utf-8?B?ZEQvSXR0Z3ljOXJUdU9iRFpzd25VSnp4U3Q1cVdaM05WSTg1NjVjMjRYMGls?=
 =?utf-8?B?UVhvN2YxWXlLSW5nekZFTVcxVEhDVVNwTzY5TXE4a2UyR3NuRGJwZWNFY0tD?=
 =?utf-8?B?eG5HKzRTOVpkR0tOdmlPOThzQVhLZklJUGxyQ244K0pKWlBRWXp6Y3JMckp4?=
 =?utf-8?B?K2VLbXNXYzRMWjBzazdEWmJsYTJ2VldnRFJPdVVwODFyTHRHOWxnOW5MMDRP?=
 =?utf-8?B?TXludE1NZllselE4NmZTbTVZVi9icjNuNmhLMjBwdytyMG8vczdGbDBROFVG?=
 =?utf-8?Q?e2Zw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a3b324-7005-4635-cdcb-08dd49f8214d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 17:27:01.5586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1KWhoLvj/SCcTVxdUt8yBi6mmCxDaw4OQkhwK1YUrg/TpZZGKG6wwOXD/pq51H7u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9413

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcmVuZGFuIEphY2ttYW4g
PGphY2ttYW5iQGdvb2dsZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgRmVicnVhcnkgMTAsIDIwMjUg
MTE6MDYgQU0NCj4gVG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBD
YzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT47IFBldGVyDQo+IFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz47
IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBrZXJuZWwub3JnPjsgUGF3YW4NCj4gR3VwdGEgPHBh
d2FuLmt1bWFyLmd1cHRhQGxpbnV4LmludGVsLmNvbT47IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRo
YXQuY29tPjsNCj4gRGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4LmludGVsLmNvbT47IHg4
NkBrZXJuZWwub3JnOyBIIC4gUGV0ZXIgQW52aW4NCj4gPGhwYUB6eXRvci5jb20+OyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMTAvMzVdIHg4
Ni9idWdzOiBSZXN0cnVjdHVyZSBnZHMgbWl0aWdhdGlvbg0KPg0KPiBDYXV0aW9uOiBUaGlzIG1l
c3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3BlciBjYXV0
aW9uDQo+IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3Bv
bmRpbmcuDQo+DQo+DQo+IE9uIFdlZCwgOCBKYW4gMjAyNSBhdCAyMToyOCwgRGF2aWQgS2FwbGFu
IDxkYXZpZC5rYXBsYW5AYW1kLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBSZXN0cnVjdHVyZSBnZHMg
bWl0aWdhdGlvbiB0byB1c2Ugc2VsZWN0L2FwcGx5IGZ1bmN0aW9ucyB0byBjcmVhdGUNCj4gPiBj
b25zaXN0ZW50IHZ1bG5lcmFiaWxpdHkgaGFuZGxpbmcuDQo+ID4NCj4gPiBEZWZpbmUgbmV3IEFV
VE8gbWl0aWdhdGlvbiBmb3IgZ2RzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRGF2aWQgS2Fw
bGFuIDxkYXZpZC5rYXBsYW5AYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgYXJjaC94ODYva2VybmVs
L2NwdS9idWdzLmMgfCAyNCArKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC94ODYva2VybmVsL2NwdS9idWdzLmMgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L2J1
Z3MuYw0KPiA+IGluZGV4IGZlZGQ2OTNiMjIxOC4uNThhYzk5Yjc0YmQzIDEwMDY0NA0KPiA+IC0t
LSBhL2FyY2gveDg2L2tlcm5lbC9jcHUvYnVncy5jDQo+ID4gKysrIGIvYXJjaC94ODYva2VybmVs
L2NwdS9idWdzLmMNCj4gPiBAQCAtNzYsNiArNzYsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc3Ji
ZHNfYXBwbHlfbWl0aWdhdGlvbih2b2lkKTsNCj4gPiBzdGF0aWMgdm9pZCBfX2luaXQgbDFkX2Zs
dXNoX3NlbGVjdF9taXRpZ2F0aW9uKHZvaWQpOw0KPiA+ICBzdGF0aWMgdm9pZCBfX2luaXQgc3Jz
b19zZWxlY3RfbWl0aWdhdGlvbih2b2lkKTsgIHN0YXRpYyB2b2lkIF9faW5pdA0KPiA+IGdkc19z
ZWxlY3RfbWl0aWdhdGlvbih2b2lkKTsNCj4gPiArc3RhdGljIHZvaWQgX19pbml0IGdkc19hcHBs
eV9taXRpZ2F0aW9uKHZvaWQpOw0KPiA+DQo+ID4gIC8qIFRoZSBiYXNlIHZhbHVlIG9mIHRoZSBT
UEVDX0NUUkwgTVNSIHdpdGhvdXQgdGFzay1zcGVjaWZpYyBiaXRzIHNldA0KPiA+ICovDQo+ID4g
IHU2NCB4ODZfc3BlY19jdHJsX2Jhc2U7DQo+ID4gQEAgLTIyMCw2ICsyMjEsNyBAQCB2b2lkIF9f
aW5pdCBjcHVfc2VsZWN0X21pdGlnYXRpb25zKHZvaWQpDQo+ID4gICAgICAgICBtbWlvX2FwcGx5
X21pdGlnYXRpb24oKTsNCj4gPiAgICAgICAgIHJmZHNfYXBwbHlfbWl0aWdhdGlvbigpOw0KPiA+
ICAgICAgICAgc3JiZHNfYXBwbHlfbWl0aWdhdGlvbigpOw0KPiA+ICsgICAgICAgZ2RzX2FwcGx5
X21pdGlnYXRpb24oKTsNCj4gPiAgfQ0KPiA+DQo+ID4gIC8qDQo+ID4gQEAgLTgxMSw2ICs4MTMs
NyBAQCBlYXJseV9wYXJhbSgibDFkX2ZsdXNoIiwgbDFkX2ZsdXNoX3BhcnNlX2NtZGxpbmUpOw0K
PiA+DQo+ID4gIGVudW0gZ2RzX21pdGlnYXRpb25zIHsNCj4gPiAgICAgICAgIEdEU19NSVRJR0FU
SU9OX09GRiwNCj4gPiArICAgICAgIEdEU19NSVRJR0FUSU9OX0FVVE8sDQo+ID4gICAgICAgICBH
RFNfTUlUSUdBVElPTl9VQ09ERV9ORUVERUQsDQo+ID4gICAgICAgICBHRFNfTUlUSUdBVElPTl9G
T1JDRSwNCj4gPiAgICAgICAgIEdEU19NSVRJR0FUSU9OX0ZVTEwsDQo+ID4gQEAgLTgxOSw3ICs4
MjIsNyBAQCBlbnVtIGdkc19taXRpZ2F0aW9ucyB7ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBlbnVt
IGdkc19taXRpZ2F0aW9ucyBnZHNfbWl0aWdhdGlvbiBfX3JvX2FmdGVyX2luaXQgPQ0KPiA+IC0g
ICAgICAgSVNfRU5BQkxFRChDT05GSUdfTUlUSUdBVElPTl9HRFMpID8gR0RTX01JVElHQVRJT05f
RlVMTCA6DQo+IEdEU19NSVRJR0FUSU9OX09GRjsNCj4gPiArICAgICAgIElTX0VOQUJMRUQoQ09O
RklHX01JVElHQVRJT05fR0RTKSA/IEdEU19NSVRJR0FUSU9OX0FVVE8NCj4gOg0KPiA+ICsgR0RT
X01JVElHQVRJT05fT0ZGOw0KPiA+DQo+ID4gIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgZ2Rz
X3N0cmluZ3NbXSA9IHsNCj4gPiAgICAgICAgIFtHRFNfTUlUSUdBVElPTl9PRkZdICAgICAgICAg
ICAgPSAiVnVsbmVyYWJsZSIsDQo+ID4gQEAgLTg2MCw2ICs4NjMsNyBAQCB2b2lkIHVwZGF0ZV9n
ZHNfbXNyKHZvaWQpDQo+ID4gICAgICAgICBjYXNlIEdEU19NSVRJR0FUSU9OX0ZPUkNFOg0KPiA+
ICAgICAgICAgY2FzZSBHRFNfTUlUSUdBVElPTl9VQ09ERV9ORUVERUQ6DQo+ID4gICAgICAgICBj
YXNlIEdEU19NSVRJR0FUSU9OX0hZUEVSVklTT1I6DQo+ID4gKyAgICAgICBjYXNlIEdEU19NSVRJ
R0FUSU9OX0FVVE86DQo+ID4gICAgICAgICAgICAgICAgIHJldHVybjsNCj4gPiAgICAgICAgIH0N
Cj4gPg0KPiA+IEBAIC04ODMsMTMgKzg4NywxNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZ2RzX3Nl
bGVjdF9taXRpZ2F0aW9uKHZvaWQpDQo+ID4NCj4gPiAgICAgICAgIGlmIChib290X2NwdV9oYXMo
WDg2X0ZFQVRVUkVfSFlQRVJWSVNPUikpIHsNCj4gPiAgICAgICAgICAgICAgICAgZ2RzX21pdGln
YXRpb24gPSBHRFNfTUlUSUdBVElPTl9IWVBFUlZJU09SOw0KPiA+IC0gICAgICAgICAgICAgICBn
b3RvIG91dDsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuOw0KPiA+ICAgICAgICAgfQ0KPiA+
DQo+ID4gICAgICAgICBpZiAoY3B1X21pdGlnYXRpb25zX29mZigpKQ0KPiA+ICAgICAgICAgICAg
ICAgICBnZHNfbWl0aWdhdGlvbiA9IEdEU19NSVRJR0FUSU9OX09GRjsNCj4gPiAgICAgICAgIC8q
IFdpbGwgdmVyaWZ5IGJlbG93IHRoYXQgbWl0aWdhdGlvbiBfY2FuXyBiZSBkaXNhYmxlZCAqLw0K
PiA+DQo+ID4gKyAgICAgICBpZiAoZ2RzX21pdGlnYXRpb24gPT0gR0RTX01JVElHQVRJT05fQVVU
TykNCj4gPiArICAgICAgICAgICAgICAgZ2RzX21pdGlnYXRpb24gPSBHRFNfTUlUSUdBVElPTl9G
VUxMOw0KPiA+ICsNCj4gPiAgICAgICAgIC8qIE5vIG1pY3JvY29kZSAqLw0KPiA+ICAgICAgICAg
aWYgKCEoeDg2X2FyY2hfY2FwX21zciAmIEFSQ0hfQ0FQX0dEU19DVFJMKSkgew0KPiA+ICAgICAg
ICAgICAgICAgICBpZiAoZ2RzX21pdGlnYXRpb24gPT0gR0RTX01JVElHQVRJT05fRk9SQ0UpIHsg
QEANCj4gPiAtOTAyLDcgKzkwOSw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBnZHNfc2VsZWN0X21p
dGlnYXRpb24odm9pZCkNCj4gPiAgICAgICAgICAgICAgICAgfSBlbHNlIHsNCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBnZHNfbWl0aWdhdGlvbiA9IEdEU19NSVRJR0FUSU9OX1VDT0RFX05F
RURFRDsNCj4gPiAgICAgICAgICAgICAgICAgfQ0KPiA+IC0gICAgICAgICAgICAgICBnb3RvIG91
dDsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuOw0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4g
ICAgICAgICAvKiBNaWNyb2NvZGUgaGFzIG1pdGlnYXRpb24sIHVzZSBpdCAqLyBAQCAtOTIzLDkg
KzkzMCwxNiBAQA0KPiA+IHN0YXRpYyB2b2lkIF9faW5pdCBnZHNfc2VsZWN0X21pdGlnYXRpb24o
dm9pZCkNCj4gPiAgICAgICAgICAgICAgICAgICovDQo+ID4gICAgICAgICAgICAgICAgIGdkc19t
aXRpZ2F0aW9uID0gR0RTX01JVElHQVRJT05fRlVMTF9MT0NLRUQ7DQo+ID4gICAgICAgICB9DQo+
ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIF9faW5pdCBnZHNfYXBwbHlfbWl0aWdhdGlv
bih2b2lkKSB7DQo+ID4gKyAgICAgICBpZiAoIWJvb3RfY3B1X2hhc19idWcoWDg2X0JVR19HRFMp
KQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm47DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKHg4
Nl9hcmNoX2NhcF9tc3IgJiBBUkNIX0NBUF9HRFNfQ1RSTCkNCj4gPiArICAgICAgICAgICAgICAg
dXBkYXRlX2dkc19tc3IoKTsNCj4NCj4gSU1PIGl0J3MgYSBzaGFtZSB0byBiZSBsb29raW5nIGF0
IE1TUiBiaXRzIGluIGhlcmUgaW5zdGVhZCBvZiBqdXN0IHJlbHlpbmcgb24gdGhlDQo+IGRpcmVj
dCBvdXRwdXQgb2YgdGhlIHNlbGVjdC91cGRhdGUgZnVuY3Rpb25zLg0KPg0KPiBJIHRoaW5rIGlu
IHRoaXMgY2FzZSB3ZSBjYW4ganVzdCByZW1vdmUgdGhlIGNvbmRpdGlvbmFsIHNpbmNlIGlmDQo+
ICFBUkNIX0NBUF9HRFNfQ1RSTCB0aGVuIGdkc19taXRpZ2F0aW9uIG11c3QgYmUgRk9SQ0Ugb3IN
Cj4gVUNPREVfTkVFREVEIGluIHdoaWNoIGNhc2UgdXBkYXRlX2dkc19tc3IoKSBpcyBhIG5vcC4N
Cj4NCj4gTm93IEkgbWFrZSB0aGVzZSBjb21tZW50cyBJIHJlYWxpc2UgbWF5YmUgbXkgZXhwZWN0
YXRpb24gYWJvdXQgdGhlc2UgdGhyZWUNCj4gZnVuY3Rpb25zIGlzIG5vdCBhY3R1YWxseSB0aGUg
c2FtZSBhcyB5b3Vycy4gSGVyZSdzIGhvdyBJIGVudmlzYWdlZCB5b3VyIGRlc2lnbjoNCj4NCj4g
LSBzZWxlY3Q6IExvb2sgYXJvdW5kIGF0IHRoZSBoYXJkd2FyZSBhbmQgdGhlIGNtZGxpbmUgYW5k
IGRlY2lkZSB3aGF0IHdlIHRoaW5rIHdlDQo+IHdhbm5hIGRvIGluIGZhaXJseSBhYnN0cmFjdCB0
ZXJtcy4gUmVjb3JkIHRoYXQgcmVzdWx0IGluICpfbWl0aWdhdGlvbi4NCj4NCj4gLSB1cGRhdGU6
IExvb2sgYXJvdW5kIGF0IHRoZSBvdGhlciBtaXRpZ2F0aW9ucyBhbmQgcG90ZW50aWFsbHkgY2hh
bmdlIG91ciBtaW5kIChvcg0KPiBwZXJoYXBzIGp1c3QgdXBkYXRlICpfbWl0aWdhdGlvbiB0byBy
ZWZsZWN0IG1pdGlnYXRpb24gdGhhdCBpcyBiZWluZyBkb25lIHJlZ2FyZGxlc3MNCj4gZm9yIG90
aGVyIHZ1bG5zLCB3aGljaCBhbHNvIG1pdGlnYXRlIHRoaXMgdnVsbikuDQo+DQo+IC0gYXBwbHk6
IFBva2UgdGhlIGhhcmR3YXJlL2NhcCBmbGFncy9zdGF0aWMga2V5cy9ldGMgdG8gYWN0dWF0ZSB0
aGUgZGVjaXNpb24gd2UNCj4gbWFkZSBpbiB0aGUgcHJldmlvdXMgc3RlcHMuDQo+DQo+IExldCBt
ZSBrbm93IGlmIHRoYXQncyBhbGlnbmVkIHdpdGggeW91ciB2aXNpb24gb3Igbm90Lg0KDQpZZXMs
IHRoYXQgaXMgd2VsbC1hbGlnbmVkLiAgQmFzaWNhbGx5IHNlbGVjdCBwaWNrcyBhIG1pdGlnYXRp
b24gYmFzZWQgb24gdGhlIGhhcmR3YXJlIGFuZCBjbWRsaW5lIGJ1dCBub3QgdGhlIG1pdGlnYXRp
b25zIG9mIGFueSBvdGhlciBidWdzLiAgVGhlbiB1cGRhdGUgcmUtZXZhbHVhdGVzIHRoYXQgYW5k
IG1heSBjaGFuZ2Ugb3VyIG1pbmQsIGFuZCBhcHBseSBwb2tlcyB0aGUgaGFyZHdhcmUuDQoNCk9u
IHRoZSBBUkNIX0NBUF9HRFNfQ1RSTCwgSSB0aG91Z2h0IHRoYXQgY2hlY2sgaXMgcmVhbGx5IGp1
c3QgdG8gY2hlY2sgaWYgdGhlIE1TUiBpcyBwcmVzZW50LCBiZWZvcmUgd2UgdHJ5IHRvIHJlYWQg
aXQuDQoNCi0tRGF2aWQgS2FwbGFuDQo=
