Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4BB24BD0C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207963; cv=fail; b=cN74xZ9tqxHJvNo0K/6+Bo6jwU2Yb6EqYgPABTN5cDNPFSbnO3z+UPUTUDT+wG3OA8wdpbBx4PEsQS8b0u6EQHoNSF51s5vbnrJIqEdzpuI8PtNNGiJVanCM3fLWmqxT7ruUObROFq8hJohOvDHYEY2chfJaM2SxhxAwFrifAmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207963; c=relaxed/simple;
	bh=sdni2xfV5jorMW8vwl3RMRU0XhcFIW1PPoBLEng4+4E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z1QGJ9cVRc4CIysRt6VcffKpPWVHodBdVJLUYTWIaR2aKCzfnxb88r5yguDOK2Eh3WA1+NVNByx/Ot0w9Nl/1jab6KbAr5uHpBl+KoRMbP14EkrOk5yJd5tAaYYWDgvMM1haIyhmfA/6sMcviNO10KOr6STNFW593smvD5rTOyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uRCkv3UD; arc=fail smtp.client-ip=40.107.220.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uRCkv3UD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6SamJC7nv/HaVbdvRdF/GytS8ysZg344MxaILMTYXyl/0PZrtf5rarcDgi3zp8WtyBsSf2/EQkrN5kDAxsCWOMJWs8lT/A74yAUL/RI8W9/cWIC6ug/mcBGwK9Aonas/ruweJpvoaNppEOF3jzfOHzyhaX1993fI99x1xqO2NZNnL8lak6pw6zQIkCHNWMlU8/acg0ACn3Rv1+TqN91rapPLeUkD3YSysfSGa2wPGQR3lFAzn1ETQ078SxvWSwPbqlTRmPCb9ZdPNGev9aWYQPX4jVWfbvonfPiO7zA5lozRJPQBN9uNPQc8B2s4jJ+OlHTVTRxZ22J2q6QXJA6Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdni2xfV5jorMW8vwl3RMRU0XhcFIW1PPoBLEng4+4E=;
 b=jOWDAaBGa4pMKSbiy8IH2NnPICIPoicKndyB52J9c5zZH6sXB4jDouZ1dIbGbFO3mjRDS6njPY6q3VcPk0Or3ZBopPYyFXZ1phdf3/Nfgn7BsGrSeidcxWOTrornT96ScS7Mtbj2SWrqY0Kaijjn1LvKn0ELHktra3Iw36+0P0EMuri8ASceNeLCqImlbWJspty4FQVhsOrB020llxcYRmDJnUG1OUGvf3KNjCUWs7zy6suriW1jbv/BrIM2mcFreJKsMgYJi1jThh2nphn3jvWDSoEWhKjjeJzFcstfpO3dni1T5F3ZuXH+3Vc2kkttTHuma0pEykPtrcuON4UmcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdni2xfV5jorMW8vwl3RMRU0XhcFIW1PPoBLEng4+4E=;
 b=uRCkv3UDGCKYwdEYBVOrjwPWgJ897DjG0xTa55pXnUN+5OM5qF5ZBww1OnA4YQMpogj5sYi+KnPFwiwvI8m6HincRwi6rHKv+fAXczu/B+pAJcpvSYEqWBV3s+NkZLUQOLq+ye/O15uT6ChqTmD0Wu06xAo3OaG1NtiniudvF9E=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by SJ2PR12MB9209.namprd12.prod.outlook.com (2603:10b6:a03:558::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Mon, 10 Feb
 2025 17:19:19 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:19:18 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Brendan Jackman <jackmanb@google.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 05/35] x86/bugs: Restructure taa mitigation
Thread-Topic: [PATCH v3 05/35] x86/bugs: Restructure taa mitigation
Thread-Index: AQHbe9hey9zuLka1r0eSeaCd5k3O1bNAyA8A
Date: Mon, 10 Feb 2025 17:19:18 +0000
Message-ID:
 <LV3PR12MB926537C7108632E3C5236D1294F22@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-6-david.kaplan@amd.com>
 <CA+i-1C2g=8ALQ6nazX1P7Cpz7PmSC49yMAFO69EmjhAfDv1rCw@mail.gmail.com>
In-Reply-To:
 <CA+i-1C2g=8ALQ6nazX1P7Cpz7PmSC49yMAFO69EmjhAfDv1rCw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=73effdf5-e28b-4f83-85d7-5411a3b79311;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-10T17:19:00Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|SJ2PR12MB9209:EE_
x-ms-office365-filtering-correlation-id: 9fb6b2c4-d252-4ec3-413d-08dd49f70d82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Uzl2aUgxUXN4SUphWjI2c2lOcjFpeGt0MUhHUU9UN2plSzJ2SHhBODJnL3N5?=
 =?utf-8?B?WjJEK3FUS1ZrbWd5b2xsOWpZRGpKajBiS05mcnBKa2JRcHpwQ2o4YkwybkF2?=
 =?utf-8?B?Y3BmaVl2NW8ra0xHdlprbHdzdTVTOHhRZC8vV3hDL2k5RVBRODNNbDlrOFFs?=
 =?utf-8?B?RmdMT0pJOG5wUDVtMERQZjZxQW01cytnN0pUaFVEWjl1VlorQm5iYXc3SWRi?=
 =?utf-8?B?UnYxUExIbEFmNWo4R3J0cGo2TU5pUThtdEcyRXVQNkt1NkVTTkNwbnoycXYz?=
 =?utf-8?B?UC9PdnZvOEl4eU5rc1lpZHhGbXExWXJhUWh6cGpyU0Q5cFlkcG9pQmtjM3RM?=
 =?utf-8?B?OXQ4YkEveFN0S05sVnViWklXRnRiRE5pMGFkV3BEYlZKK1FXcFN3RGkvYzJQ?=
 =?utf-8?B?Vi9ESkJvVGtnWUFkSHZpRW9hSDE1dFlGTU1zVloycW93NUxpNjAycVBpSHBS?=
 =?utf-8?B?RGtoNVQ3NWV5ampTRnFtWGhUdkVpaktMVHBkcTFKcm1JaTZKSVp2QmY0VGIx?=
 =?utf-8?B?OThodHMwUXh2dHpYM2RORkE3bnBic1JSalVuRnRkZTlNVVBuUHdZNStNMnVK?=
 =?utf-8?B?YmI5TFdsbEh1M25GU09nRE5FS2F4WnJhWWNOV2UyeUhaeDVGWjNUeGZBaTYr?=
 =?utf-8?B?RjE1Nm0xOUVDVWxSUVhyS2ZFM21oUjVUcmxLQXgxd2dVUzdoaVFCMjBjZzJ6?=
 =?utf-8?B?VlRuMjBRN3NmekNoOUdkOS9UV0pKK215Y0JsL1dycjgyZVVPc0FFckt5M0Fn?=
 =?utf-8?B?QWx4VCtlZWIyWEt4MFhxbm9DQ0Mvekl6TlZzTzF0d0tQUDRKZktneElvNTkr?=
 =?utf-8?B?aHBuek91QjR0L1ptV0dtQjJJaUI4S3FIQzYyY0p5RmVnSUpreG95RXVOeWNJ?=
 =?utf-8?B?RCsvWGE2eXlOYXR5dHlIbkRXdCtiQWhSVnhWMmdUditkSExYNmZET2s3UE1X?=
 =?utf-8?B?VkdLNUdwemFzUlNza091eXBJdHdIdjJUaFljTldVbjQ0MEtmcGpnRHFwVkdr?=
 =?utf-8?B?bklLc1NlSk85UG52bUxSaTU4a0tZRUdEclk2Rm5VRnZmdGVtTCtMRmJMUmhO?=
 =?utf-8?B?WExqRThsYWx6WmF2RXpzU1VpQ09tczkyUHdpYldTRUpQZnY4VXFGSXplN0FU?=
 =?utf-8?B?ZnN0YmRUaEdkSHZNZ2o5dWJVWEVkU0g1eHpoWkd1RjBiYW1haFl4OXNkdzNP?=
 =?utf-8?B?V0hHbHNqTWpHb2E4MW5RNUN3M3hiZFpORGx5bWlMbkFVc2FaRlFRaWE5NUVP?=
 =?utf-8?B?bHhjYnZDNU16YkNOZ2ptT2ROYmNPMzEyMTVoR0V2SWdWb1VUck9hLzUyY2Ra?=
 =?utf-8?B?UFJ2OWNtYkZBcDlFN3IyU3NrQWhZbDY3Q0JyRDZENThGM0pGYzdZL2NvZmVo?=
 =?utf-8?B?VktkWlI1MGEwY2I4Mlhvb0c4T2d4K2E2VW5Cb2hhODdkK0RKd3c1RjA5c09H?=
 =?utf-8?B?TEdGYWJySWI3N0hDWlRMVHlrZmRDd1QvcGt3Um9reiswZ2RjcmdLbUZLOFNL?=
 =?utf-8?B?S09YV2RMN3FYMUx0RG1GWVBxelZDSE9iRW9LTDlhTjJ1M3ZzV0lvaVZ5UFN0?=
 =?utf-8?B?NHZKaVRqc3ZmRWc4QnhFS2V4L2hxVVNCOTVqMExoMjhVMVhCdVJSMGdCc2tj?=
 =?utf-8?B?MUloV0U1UEdLYStyZnpRYWlvUVRMUVA1eUFnRVVNQTFRMzZudE0xckxXN2dE?=
 =?utf-8?B?MnFHSzNEaEVRUER4ak9DUnRJVURkV3dkQm1BL3E4UnRlQTNjYmptUkZ0R2k1?=
 =?utf-8?B?MHVXM09hNjJJWTZ1SDVnaUJIYmRLcDlVaGlwWGhGVm1sRmNHMnFLcmFySnMz?=
 =?utf-8?B?c21vVm1TdnlGYUxadFZpL1ZzZWtSdHFwUzlhM3hUWU1YcnJsdnRmWjdPcXMz?=
 =?utf-8?B?VzFVZG1EbmgxUGJoU2d3Sldzd0g5bWFpdmloSFdLd1hDUUpSMDJlODRrTW5X?=
 =?utf-8?Q?NNgtl5kFcW3QJJNa+3mdGSgZIk0spc+A?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ellwczZXOWc0UFlvdUc1SjRnQXhwSER6Y0pndUtTTmx6bWNyN1RldnV1NFIz?=
 =?utf-8?B?Tkk2TDE3OUcvWkZVZ0NjOSt1b09ZZ1R3aUtOU3lmWmV2bzZtU3REeVRVOHh0?=
 =?utf-8?B?S2o3VkE1WHV5bTBJd21xdk9ZcldQUFRHTDl6MW1Tb2V3L0JBWGd4ejkrNE9E?=
 =?utf-8?B?ZXJzdnlaS043YUxQa1lKK1ZrblQ4bVlCelc2QVowR3VHNnozakFpd1hjQlBm?=
 =?utf-8?B?cExNWG9pdEJXQW9zeFFqVGppZWswaEFDL1VSN1JIWHVBM2hCdXM0Rnk2aEtJ?=
 =?utf-8?B?bk1LWXVkOGc4THZNcnRVclpQWWM3WWV6eHJQd2IwczBlTFhPWmdUVzNkcm4x?=
 =?utf-8?B?cDdqNTZRNDZsWFJXOThhSjNmZCtJa3lKRkFwcVpjNGN0ak5MKy9SMTU1U0FQ?=
 =?utf-8?B?cGlJK3VaR2RDTHlCVTc2N0FFcThNY1RSSmRMU0pCMTlHUEJSZFVrL1VoNEt3?=
 =?utf-8?B?NDd0a2YxVitjTGZiZmk4WCs2OHdiYVhuYkVTcjdwVUl2NmFBc1FxTDBXL0Za?=
 =?utf-8?B?enpjRzFlQmpWK1lhNU9OeXUrbVdhbUpQUXVHcCswajJ6T1JwQ1c3ekJsRUZ4?=
 =?utf-8?B?cWROTk5NbTJSQ0VVL1h5U290NTRPL1Jld2o5aXRpekt0MzkwMkl2aUwrWVAz?=
 =?utf-8?B?YThMTHhvN0svbTM0Y0dpdy81L3dBUVV5V25rY25LOEQ5UDhTbWhON0tqT1Nx?=
 =?utf-8?B?YXNFeHc3WnNTUU9yeGM2S0JndzB3bkYzYllBSFE2dXZOSnZocDkyV2hQOHcz?=
 =?utf-8?B?eVB5SzJMekI4Vk9tWlR2S3hoZDdkay9oM3hPditMT1cyUFJ3ZDg1Nk5LSEEw?=
 =?utf-8?B?dmtlVWUvekhndlZ2SXhwaWh0M2dLeXZIVEdsOHJzV3lPdmFVczhxMDRkWnNL?=
 =?utf-8?B?Q0htNTByQWpSeWJhRlJBQUtKK0pZNFdVU3NxZDRSU3J5WjlSTVpISmZyZHp2?=
 =?utf-8?B?V2hiR3NFSVhEVGlFZThzNVhZUFRhcXpYSjI1WDlvZzVTMGNHL3E3bFh4QTds?=
 =?utf-8?B?akNuYnNzdm5vbVIyTHpWSS8wbWhZOXpkU0swRlBDaUZwbEpBSXRqWUdIQ0Jr?=
 =?utf-8?B?THc4d3VJcGRUTHhUYkdLaWJZdFdUVWZxeU05OEVrb2FTVWVxWmltSDRuTmdw?=
 =?utf-8?B?RUVzQmt4dmtHZWFvb0RPb0kzcis0NXE0UDNKaWdmZHp4WVVRenhQVEVKRjBS?=
 =?utf-8?B?dDE5STZNQXNrRU52QUpwVllvdEY2MStFZ2lhRjdkQWljU2NQbDJwUlFqSkpH?=
 =?utf-8?B?eEVMSUF6VDc5YmJkaTlLRzRJaTA3WHR5eDdQR1FQdmJwT1pkQXlaZkRGTGNQ?=
 =?utf-8?B?MGxKOTJMUlF6NVhtL2Y1U294em9qUG9Ic2piMHJkbXhmd0RYN3NtQVpES2c2?=
 =?utf-8?B?NDAxSnl2MkRKYi9WelQ1Y2VZbE1YREw2NDBCL3ZuTmVUaUwveTRwOXk1QUxQ?=
 =?utf-8?B?K0tDem5OSWtSYyttcmdoWk0rTTFyRHFiSVdHQVpVZkdtQWJ2T3JpRTF6aW42?=
 =?utf-8?B?VG56VkZBb2l6cjRpZ3BmWmdLV3VySVVhWTBzaGNXa3VjQWoyL2ZSL2hyUWVZ?=
 =?utf-8?B?U0kvREQ3MDNMNVJESUNwOEhKK1RHclFXdjNMVXE1MWo3ZVZwb1FJa3B2UG5p?=
 =?utf-8?B?U2lVLy9NZnFKckVZcVJJNGpQb3VzbE9TR0RENEZRYmNUbStuM2NsSDVJNzF0?=
 =?utf-8?B?eEJVVndIcG1mMUJWRGNTN2cxbGRVejA4UEpyV3N5WE1HWG5jRTJURkY3aDRM?=
 =?utf-8?B?STFRSlpOdVFqcGN6SkQ4ZWFPQm03K0ZnOFRsWWF3VHVnZDBScEFkVGhWS3oz?=
 =?utf-8?B?ZmdzaVRGVVdjMm45Y0VrRkIzaGE4ZGZVL01rSmhFZXFyd25maitUQ3dvRDNz?=
 =?utf-8?B?U2hlK2I3TFg4VkVEREt0UjlPVHNGMmRXUmVaVFhPOExvd1R4R2s4OTVVQUtu?=
 =?utf-8?B?dkhsZUV2dVBWZXNLeXRmR1ByalVwU09vbW1GTFRrU1NRbk9OdnJLWlZNZVBz?=
 =?utf-8?B?VExqRVNCdVFrS0I4VUVEYWpqMUx5VnVMU3dQWVVXM3YxU0FlblE0eVRYcHdn?=
 =?utf-8?B?aHdZdW5UeGRqYVN5T2lsMDRNN2FacWl3WGFsTndCaGdJWTdsL1ZmQzlSTita?=
 =?utf-8?Q?EH1U=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb6b2c4-d252-4ec3-413d-08dd49f70d82
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 17:19:18.8444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3tpuBqoPiw5OQn/9cTs2DKgSHghT1Q3CJSVkR2u4kHUgHertPm6fQy1sjkCrbt2G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9209

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcmVuZGFuIEphY2ttYW4g
PGphY2ttYW5iQGdvb2dsZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgRmVicnVhcnkgMTAsIDIwMjUg
MTA6MjUgQU0NCj4gVG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBD
YzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT47IFBldGVyDQo+IFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz47
IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBrZXJuZWwub3JnPjsgUGF3YW4NCj4gR3VwdGEgPHBh
d2FuLmt1bWFyLmd1cHRhQGxpbnV4LmludGVsLmNvbT47IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRo
YXQuY29tPjsNCj4gRGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4LmludGVsLmNvbT47IHg4
NkBrZXJuZWwub3JnOyBIIC4gUGV0ZXIgQW52aW4NCj4gPGhwYUB6eXRvci5jb20+OyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMDUvMzVdIHg4
Ni9idWdzOiBSZXN0cnVjdHVyZSB0YWEgbWl0aWdhdGlvbg0KPg0KPiBDYXV0aW9uOiBUaGlzIG1l
c3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3BlciBjYXV0
aW9uDQo+IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3Bv
bmRpbmcuDQo+DQo+DQo+IE9uIFdlZCwgOCBKYW4gMjAyNSBhdCAyMToyNywgRGF2aWQgS2FwbGFu
IDxkYXZpZC5rYXBsYW5AYW1kLmNvbT4gd3JvdGU6DQo+ID4gQEAgLTQwMCw0OCArNDAyLDcxIEBA
IHN0YXRpYyB2b2lkIF9faW5pdCB0YWFfc2VsZWN0X21pdGlnYXRpb24odm9pZCkNCj4gPiAgICAg
ICAgICAgICAgICAgcmV0dXJuOw0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gLSAgICAgICBpZiAo
Y3B1X21pdGlnYXRpb25zX29mZigpKSB7DQo+ID4gKyAgICAgICBpZiAoY3B1X21pdGlnYXRpb25z
X29mZigpKQ0KPiA+ICAgICAgICAgICAgICAgICB0YWFfbWl0aWdhdGlvbiA9IFRBQV9NSVRJR0FU
SU9OX09GRjsNCj4gPiAtICAgICAgICAgICAgICAgcmV0dXJuOw0KPiA+IC0gICAgICAgfQ0KPiA+
DQo+ID4gICAgICAgICAvKg0KPiA+ICAgICAgICAgICogVEFBIG1pdGlnYXRpb24gdmlhIFZFUlcg
aXMgdHVybmVkIG9mZiBpZiBib3RoDQo+ID4gICAgICAgICAgKiB0c3hfYXN5bmNfYWJvcnQ9b2Zm
IGFuZCBtZHM9b2ZmIGFyZSBzcGVjaWZpZWQuDQo+ID4gKyAgICAgICAgKg0KPiA+ICsgICAgICAg
ICogTURTIG1pdGlnYXRpb24gd2lsbCBiZSBjaGVja2VkIGluIHRhYV91cGRhdGVfbWl0aWdhdGlv
bigpLg0KPg0KPiBXaGF0IHdlIGFyZSBhY3R1YWxseSB0YWxraW5nIGFib3V0IGhlcmUgaXMgdGhl
IG5ldyB2ZXJ3X21pdGlnYXRpb25fZW5hYmxlZCgpLCByaWdodD8NCj4gSSBkb24ndCB0aGluayB0
aGlzIGJsb2NrL2NvbW1lbnRhcnkgYWRkcyBhbnkgY2xhcml0eSBhbnkgbW9yZS4gTWF5YmUganVz
dCBkZWxldGUgaXQ/DQoNClllYWgsIEkgdGhpbmsgdGhhdCdzIGZhaXIuDQoNClRoYW5rcyAtLURh
dmlkIEthcGxhbg0K
