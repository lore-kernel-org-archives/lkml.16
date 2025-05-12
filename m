Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD29B171CD;
	Mon, 12 May 2025 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747084831; cv=fail; b=XsNHX6GeW3ykGbB2d7TeWYRDzXZYqj/lBDy7YHce92GW29QaUW4mKcK+p7nc115Nf86wg1zMYqY8PfJq8aEfVEVimS2YsLMOGifTAwvWF3HkFUUz20M7TEfW37lj3KWXfCIAh3xR2h5VIi+GyPa/XBZQQI5PnzcxOs4gSWlMXIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747084831; c=relaxed/simple;
	bh=0aX7Gi3/bKT7Qzxlz/yzZpi0Dqz9VZLkw9gshzCWGCI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fZZ2+VGVIFZNNXiUFoKdSKRNEEcM5+4kN+aJRLxSqmDdQIcQV3kbwvJjtJ0aDS5c5JbMj8jhzIqaL9hcNfCzHHqLubelSkcCPPUla90nhdO2ECHN2RodDdS0RVDVVU8lYba/1IEFxhZ11TF2N3PrFujvK/Co08pKfUcCj/q8sdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=P+thiCTq; arc=fail smtp.client-ip=40.107.102.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="P+thiCTq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sb2BBIZ7/2Z+Omjs2bzvbRsrvxz+serIEsp3R4wCJZdgQleTB75JxI4qXEz459v1ZUDSFsIIZO8leg9MNTQFbWRKGXFWjZyXu7SiwDRv0Rfzxb8AG8SIcbIKNnxocCjEet9WI92JXG7tb6LGGENiiUFo64/x/1NdtvnvEh7ZO6uiqa4O4VMFeDqmP5w+JDlFdnvP7DmeBbgOOnZajAzUiPOEpigDO2UADziOyXBDTNierRRvNyTmVj/br6JsyXwQFJ6+bfSHZoOoTj5GUKcU7tC9N730NP+FDrwph/A6iMqN6HYcoRhHFVLQ+BYXXobQPIWvV2VhHSYrLKYZANWDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qO3WAFhY12eZbf0MbQXBnULfee43GwhG44cOnWZnUdw=;
 b=O8FeX1A93wy1G//M26RU6K+TBWQocPYc8geQqssUw/pDz1MAcw1xcHiTzwNjWMcuvNm9wW9rlrBh5hTq5rcTjpcFzTiFtaCpEni4KPuD4rCfK7AsDtMHAqDOQPnKlUctTuyheJWIVOwebOwzpnVzpfR+QBnPvVdLgI8uLpEgATM/v/gRYUZQZjW55ZcqYkK9BOj2vZ5PUcTYrom+FCqyf3TbVRWI1+saAv1vt59py5ySANwZQudnjMKalh8NifKFIK4W+VtQAEsIIac5MtxlVWG0E+bPTC/bjSryEOQ5uirvjROFjvgXAvl9h3DpdlEGKA0KKcRtHKr/shhoSBIJ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qO3WAFhY12eZbf0MbQXBnULfee43GwhG44cOnWZnUdw=;
 b=P+thiCTqE8D5AwS66GYpyYhZzgzQsUoZa23XMZoFnIOOhx3zHwB0E/36rLbxQlBhk5CdLbOI67zj13hGnwzQozh8K2OlTsOF0ACfmyRsZlgqVOyQhJL5H6xrrqHvwDG6X4C6ux4eScYmLUC+91B2b9btQZQdvtnkPHGfF2fmSC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6426.namprd12.prod.outlook.com (2603:10b6:208:3b5::12)
 by SJ2PR12MB8977.namprd12.prod.outlook.com (2603:10b6:a03:539::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Mon, 12 May
 2025 21:20:27 +0000
Received: from BL3PR12MB6426.namprd12.prod.outlook.com
 ([fe80::3e7f:241b:d574:95b4]) by BL3PR12MB6426.namprd12.prod.outlook.com
 ([fe80::3e7f:241b:d574:95b4%7]) with mapi id 15.20.8722.021; Mon, 12 May 2025
 21:20:27 +0000
Message-ID: <ec702d90-f6c0-479f-a62c-d09bf13fa13c@amd.com>
Date: Mon, 12 May 2025 17:20:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de,
 mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250509181220.1744783-1-pratap.nirujogi@amd.com>
 <6b649ebf-6f03-4050-18bb-788bbb3a664e@linux.intel.com>
 <7e46c769-7c5e-4a54-a216-c85c667446f9@amd.com>
 <d2bdc8a6-1907-77cd-43a2-fb28439bd37f@linux.intel.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <d2bdc8a6-1907-77cd-43a2-fb28439bd37f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0251.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::15) To BL3PR12MB6426.namprd12.prod.outlook.com
 (2603:10b6:208:3b5::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6426:EE_|SJ2PR12MB8977:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ee30d2-a09c-4ab2-5036-08dd919ad0a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWlkVG51a0greDR4ZzhjZjRRVUdEVkYzRlRRSGRyY0MzK1Z1c3l2a3NQSUVG?=
 =?utf-8?B?TTVCam5Rc2ZnTHI2STJ2dmNCUjRKbCtoc1U5TWtiS05XUFpNZ1RZL2Rtd3BF?=
 =?utf-8?B?TXJ4Y0xHRW1XZXRWYVJHZnZBaVJZblBURHVBcnFKVEVNTFZJWmRjYkphZ01F?=
 =?utf-8?B?TllHUmdoaWVRMENaemRLVlpLb2xIYnZHS3dzS0w5NGprTVpUNkNwdzlyY0JX?=
 =?utf-8?B?Rkp1eFV1dXVRSE5CWllMUGtwNkJ3M0w3Q2I1czM4bVZ1OEh0TGtLaTNwb1lC?=
 =?utf-8?B?bUIwelF2T1VaWWxScmlObVRUcHMvL1E5enBMeVRGTGh1dFJvOC90MlM2VDBx?=
 =?utf-8?B?dEZ4UWtrT2ZIcExGZWVhMjlEY1VDK2ErWVhnVlhtako1aTBGMzNwYnhSVU5j?=
 =?utf-8?B?cmgxMUdDQzJ0YW53d3RyYUladEh5WDhoaHF4VHdIS1JCZ2xIZXF5QnlMY3ZO?=
 =?utf-8?B?YU9BRjRSWXBJdDFOQjBvWEYxZ2IzdDN6cktUVUNWM2hrbnd4cVZndFh5azc3?=
 =?utf-8?B?UVBJMmYraUhsamZhN3p5RVZMWVhwY2NOZjBvVklNUkR6ZkVYMmV5OUFKMS9M?=
 =?utf-8?B?SGJ1SEFHME16RnUxQlZOUFQvSTlhYnM5YU5NS09VSzhoS2Y3TTFMYzR5TlQ2?=
 =?utf-8?B?M3ZjNFZvQWplc1ZUSnIxMjRFOUVIUlcxczRqUFliVXE5VmxiTE85aVNBS1dw?=
 =?utf-8?B?cENwdkNYcDNaYVgvZ3FOMlJSbjZtbEhtQTdNZG5XWUlpdnovQmdvYTZSU3lZ?=
 =?utf-8?B?NXJlYmMwOWpIN21HL3ArVWs0NnpTd09BZDIwU3RHRzMrMUZLTHNQbkhvcnV0?=
 =?utf-8?B?MVFLYlJsTUJlSTExMGx0c25HNzQ5VHZFczZxSGJ3MGRvNEhCYnYrMk85Ukpo?=
 =?utf-8?B?RUFRTXlCT2pzbE44d0N1U05BcHdhZDVqelR1eUhlUDMwQytDWm1pd2d1NTNN?=
 =?utf-8?B?ZlQ4UGZyUE1ETlhjRlRXcjBVMVgxRU1Vemp1Y0JRTHlBWlV2Q0N0ZExPUHdF?=
 =?utf-8?B?MU9CZGVXcWRqNng1a3M5bS9LMFEzeVE5MFUrSDJDT3lhTWxaT2ZaaExKbUho?=
 =?utf-8?B?bGpJNWtQZEtIem4zVzBhcTR4Z3pPaTFJZlY4Q2tBWStWY3VnRlJQSFpWcHpm?=
 =?utf-8?B?V3JCNmpQUUU2ZmVVeEVxN01IZXpmVklndnpZNzdhU2RsdGp1TGNmcGRndzEw?=
 =?utf-8?B?R2dld2dqeEU0c2dwYVVxTU4yclNEVWRsTnlpTHhHK2xRS3N5SVBkN2RRYXpN?=
 =?utf-8?B?TUF3dUtLSHE2TVU3MHo3MGNqV3lma3FQUjdRN3lvTEUyVG1XS1VrMThlc0pO?=
 =?utf-8?B?WWlEVVR1dTgwbE4zcFlvaDRoNUVPRzQ2YTlnNk9iQ1VGdjBVMkp6cGdsV09U?=
 =?utf-8?B?UzI5Zzc1S2prZW5DcXhaWjFXT3VOWG1kTldEVWlDKzlwK2JHd05udE9ZaFQ3?=
 =?utf-8?B?a3M5UE1UckNKWG5PcFNmMHJiOUdVdENYWWV1UXQ4SUVwRzdMWEMvcFBkaWQx?=
 =?utf-8?B?N25najVRcFdnWkNzYjcrdTE4Uyt5by9wNDdJQ3VxZERNS2J6UUtRbVpoaHBa?=
 =?utf-8?B?WWd3T0VnazlHWUFLd1BJNlZSY1BvOVJ3QmFjeXY4b3Fvc0pqOUtnaFZrY2Vj?=
 =?utf-8?B?UmJ5R0kwMVg2bC9Wa0c1dTNOejNqbDdwSWtTZC9sRDhjWDgrVmxaTDNwTVJw?=
 =?utf-8?B?cWtrR3l6TkxnMFVnaFovK0NBMW00SEx4TSthNy84bDFFMm04OHBBRWZXZnFq?=
 =?utf-8?B?Qzc3eGFJajNUb0tpQkVHUkZuVGw3TlVKMDU5VnFUUGhiZkwyRjJ1L1BMT3pu?=
 =?utf-8?B?MXRRZlp1NlhHOXVOcXpOZjJqZTlHRTBQM3VoWmpwT1IrYytsbWtsUjJGbXBs?=
 =?utf-8?B?czlJOTZZbEJCM0hidnVBVnhyeXNFelovWVJ0d0NnOXRwenkwc2x3Z01nV2M0?=
 =?utf-8?Q?EitFCJ1Irmg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6426.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUhoNWlpYU9zaU4wb3ZoWXBZM20ySWxZSE5HcTcyWlAvQituUGxHVHdCa0lp?=
 =?utf-8?B?U1p2QmhaTGFTblpKQk4wbTVGcVh1TEFudktoaVV2K0NZc2VweC9jMXpZelJ0?=
 =?utf-8?B?TGZSTkRxeElBc1hzWDlSMG9hLzFtSENFR3V6RXliMmVxejBCTVRxdUlMVldq?=
 =?utf-8?B?Tnc0MDQ0OXJqdjBLOVlYZVZxZ3JNY3NDQlMxY0tkMis1R29yNm0yNU5UeDdH?=
 =?utf-8?B?VE5hb3BnaGx2R3JidTNUeUNtV09OSk1hR0x6ZGRKZVpPUFJncE5VMzQ0eXFx?=
 =?utf-8?B?aEQxcHhPL01kVTdjbnpGM0FUbStodjhPME9lTjBOaEZxTE5aNWRTWS8zN0RC?=
 =?utf-8?B?bGlqRm1mTzZ6THlKamYxVHNmeDlTZjR0UXhMOHlTWVBNOWU2V3FXQTFYT0gy?=
 =?utf-8?B?TnRFb2kxMDgvWWRVMzY5QklmcGFrb3FsQXJoZ3RYcHhyc05kamh0bVdLbUZU?=
 =?utf-8?B?ejV4eTIwQzZRTkhmcUYrbDA2anF4dkpXcGphRlVXamtaZzRtVVp3dGREem1N?=
 =?utf-8?B?Tk1YaU9aem85VHJBRnRodElJT243SnMwNXp1T0NLUGJ0dGl5TW1SQnp1L3Fp?=
 =?utf-8?B?djU1enRGdzR3N3J1NjBuS3pCWE5jdUw3S2FmMndLQ1g2Z1NVOXorNkJGTHJn?=
 =?utf-8?B?c0dyNktLL2xQK2hUN2NxbDFsMWxCMVNCdmlSa21vMFAvWXRyeG43UmR1NTN3?=
 =?utf-8?B?Q09EZDJnVDZ5K3BGMmZKRVZoOXRYaWU0bThYU2R0Q0ZiYnkwR1pVVHpmYSt6?=
 =?utf-8?B?VWlIWGNUeVhneCtBOVo5QzEzM2xzK3NzN1BhSzkxZmg0SHJkT2F2bUFrTTI1?=
 =?utf-8?B?d0dGTk9UdWgvZm10NlhZeitqZG5ZREFYNlUxeTdMQzNONlJFa1BucU9HMW9T?=
 =?utf-8?B?Zm5jTCtnQlRZaDRTOFowQ3FlOUtXU3JVd2x0WldyN0s4L2tpWno2VXErMWkv?=
 =?utf-8?B?Ylo5cnh3VkRhelk1SFdBajJWbHNycUpPSWhOZll1clN1c1ljMnZpVi9Db0VV?=
 =?utf-8?B?N3JERW16UExQc0V3UTlBclR3RG91RTJQNUxPTWphc1JJYkNTUXJPWmZiR3J1?=
 =?utf-8?B?dnQ1OENJRzgwTFZOTTJFY09yQ2VhQ1VXY2xzS24wSE5sbldrOVBUWVdaUGph?=
 =?utf-8?B?Vnl2UzdwcE1SN1NCT3d2aktYYTd3cTYzZmFRUEJKWU5xSG8wTlN5cjFlRzRl?=
 =?utf-8?B?UnM1K29yOUhMem41dGpGdDVsQ0hEMkwwMktBQmtMVTA0M3JMVmdTcngycjQv?=
 =?utf-8?B?OE5rTDlFREZabVlQSFd6Q21kdUF2M2pMb2o5R2tZVWdidkxOMWhWWXZtR0R5?=
 =?utf-8?B?akdOU2ZOZXJ2WVJaOUVENnZHY3BkZWlTWWl0K3ZhRmVjTUtqYzRTSHJPOTd2?=
 =?utf-8?B?QlJyTjV3MzFTQndwcjNQUlBrL2ptVkg0Zlc2WnhSSUNObTdDNE5OUkZMbU1h?=
 =?utf-8?B?WGtSVlFjQ2tTcFdFU2M5UFlRZjVhZkhrRHBsUkhuRld3ckFIWUZqRTBXUWpR?=
 =?utf-8?B?WlpYR1dTd1hZeUNkMFpJWTZuYWRDTGVZbEZjcVhacWhxTzQ0VWdkVEhyc1VY?=
 =?utf-8?B?Z1hyYVN2UzdEcVdjVzBlNEtBckd0SlE2VDRDakxGSlBCejNkMnRsOXhsMERp?=
 =?utf-8?B?T1dZcXJSZUNXdFF0emJIOWRLanJDcXYyTHBLa00wNlJTM1BvY3JaTE5QK1E3?=
 =?utf-8?B?TnZGYVd4U3lsMzBLMmRnK1hZL0ZQZVIxd2pxZ2tSU0VKUnlMb3FUY1UxbXE4?=
 =?utf-8?B?emRLMG91SGVITHFwWUhUc0trMTViYWNYTHZIQUhtbGlJcXdQTVFGclpVanov?=
 =?utf-8?B?b3RrUC85MlQvVlVoNW1QazkwcXJoODVCTTIxZ0dRa0luUGRTWUttMVNCRUU3?=
 =?utf-8?B?ajVhTTZIeUxKSGRtMjd3Z3YvTVV0UGZjRTlBNmYyWmh5RVNZWDA2M04wbzFm?=
 =?utf-8?B?VXluY3pBUTQ5MlJ0Q3A5ckZLT3ZtTWdwbDFVZTVjZURHWkhPOXR5T3ZwK0RV?=
 =?utf-8?B?cXlycE9CM2c2a3hkV0xnaU9xLzh4eEx2VWd1aEx4VUJHdGpxWnVxTDI4Zk8w?=
 =?utf-8?B?NnNIVmc1TzlLNUx2WkpwUW9JcWpBSUpUYkRXZUkyUS9idFRNR2lYazBsKzM2?=
 =?utf-8?Q?toxrBxWSBj6C/w3DJJ2VG/3KP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ee30d2-a09c-4ab2-5036-08dd919ad0a3
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6426.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 21:20:26.9591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fg6CIORxWCEV3xhrfLeHwlMR+F1T1AvDXw1gHGmShYSODpdB7eoImAK+VeNsD956jCIU0YnqaPG/ytuY37JWLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8977



On 5/12/2025 5:00 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, 12 May 2025, Nirujogi, Pratap wrote:
> 
>> Hi Ilpo,
>>
>> On 5/11/2025 6:54 PM, Ilpo Järvinen wrote:
>>> Caution: This message originated from an External Source. Use proper caution
>>> when opening attachments, clicking links, or responding.
>>>
>>>
>>> On Fri, 9 May 2025, Pratap Nirujogi wrote:
>>>
>>>> ISP device specific configuration is not available in ACPI. Add
>>>> swnode graph to configure the missing device properties for the
>>>> OV05C10 camera device supported on amdisp platform.
>>>>
>>>> Add support to create i2c-client dynamically when amdisp i2c
>>>> adapter is available.
>>>>
>>>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>>>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>>>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>> ---
>>>> Changes v12 -> v13:
>>>>
>>>> * Add "struct amdisp_platform_info" to pass sensor specific
>>>> configuration and make the driver generic to support OV05C10
>>>> and other supported sensor modules in future.
>>>>
>>>> * Address cosmetic and other review comments.
>>>>
>>>>    drivers/platform/x86/amd/Kconfig    |  11 +
>>>>    drivers/platform/x86/amd/Makefile   |   1 +
>>>>    drivers/platform/x86/amd/amd_isp4.c | 309 ++++++++++++++++++++++++++++
>>>>    3 files changed, 321 insertions(+)
>>>>    create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>>>
>>>> diff --git a/drivers/platform/x86/amd/Kconfig
>>>> b/drivers/platform/x86/amd/Kconfig
>>>> index c3e086ea64fc..152a68a470e8 100644
>>>> --- a/drivers/platform/x86/amd/Kconfig
>>>> +++ b/drivers/platform/x86/amd/Kconfig
>>>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>>>
>>>>           This mechanism will only be activated on platforms that advertise
>>>> a
>>>>           need for it.
>>>> +
>>>> +config AMD_ISP_PLATFORM
>>>> +     tristate "AMD ISP4 platform driver"
>>>> +     depends on I2C && X86_64 && ACPI
>>>> +     help
>>>> +       Platform driver for AMD platforms containing image signal
>>>> processor
>>>> +       gen 4. Provides camera sensor module board information to allow
>>>> +       sensor and V4L drivers to work properly.
>>>> +
>>>> +       This driver can also be built as a module.  If so, the module
>>>> +       will be called amd_isp4.
>>>> diff --git a/drivers/platform/x86/amd/Makefile
>>>> b/drivers/platform/x86/amd/Makefile
>>>> index c6c40bdcbded..b0e284b5d497 100644
>>>> --- a/drivers/platform/x86/amd/Makefile
>>>> +++ b/drivers/platform/x86/amd/Makefile
>>>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>>>    obj-$(CONFIG_AMD_HSMP)               += hsmp/
>>>>    obj-$(CONFIG_AMD_PMF)                += pmf/
>>>>    obj-$(CONFIG_AMD_WBRF)               += wbrf.o
>>>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp4.o
>>>> diff --git a/drivers/platform/x86/amd/amd_isp4.c
>>>> b/drivers/platform/x86/amd/amd_isp4.c
>>>> new file mode 100644
>>>> index 000000000000..27939020634c
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>>>> @@ -0,0 +1,309 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +/*
>>>> + * AMD ISP platform driver for sensor i2-client instantiation
>>>> + *
>>>> + * Copyright 2025 Advanced Micro Devices, Inc.
>>>> + */
>>>> +
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/property.h>
>>>> +#include <linux/units.h>
>>>> +
>>>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>>>> +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
>>>
>>> This is not used anywhere?
>>>
>> Thanks. Will remove it, its not used anymore.
>>
>>>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
>>>> +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
>>>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>>>> +
>>>> +/*
>>>> + * AMD ISP platform info definition to initialize sensor
>>>> + * specific platform configuration to prepare the amdisp
>>>> + * platform.
>>>> + */
>>>> +struct amdisp_platform_info {
>>>> +     struct i2c_board_info board_info;
>>>> +     const struct software_node **swnodes;
>>>> +};
>>>> +
>>>> +/*
>>>> + * AMD ISP platform definition to configure the device properties
>>>> + * missing in the ACPI table.
>>>> + */
>>>> +struct amdisp_platform {
>>>> +     const struct amdisp_platform_info *pinfo;
>>>> +     struct i2c_board_info board_info;
>>>> +     struct notifier_block i2c_nb;
>>>> +     struct i2c_client *i2c_dev;
>>>> +     struct mutex lock;      /* protects i2c client creation */
>>>
>>> Missing #include.
>>>
>> ok, will #include <linux/mutex.h>. I have not included some of these header
>> files seprately as they are already part of one or the other existing headers
>> in the patch.
> 
> We try to include what is used by the file itself but as there's no
> ready to use tool to enforce it automatically, it largely depends on devs /
> reviewers noticing what should be added. Whenever adding a call to
> anything outside the .c file itself or use of non-local macro, it's good
> to check if another #include needs to be added (but I understand devs, me
> included, will often forget it).
> 
> There are a few obvious includes where the other one is not needed as the
> path is practically guaranteed, typical examples: linux/xx.h including
> asm/xx.h or uapi/linux/xx.h.
> 
> Relying intentionally on indirect includes creates very hard to track
> dependencies making it complex to remove any header from another header
> when the headerfile itself no longer needs that include. Build testing
> will catch some resulting fallout from such removal but it's coverage is
> not perfect.
> 
Thanks Ilpo for the detailed explanation and clarifying the significance 
of avoiding the indirect includes. Its really helpful. Thanks.

> --
>   i.

