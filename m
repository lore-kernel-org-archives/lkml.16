Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5558D1922DE;
	Mon,  9 Jun 2025 18:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494962; cv=fail; b=bGFiDeOgZWrI/gBEn+/91Pu/u+lpVuJ1GGW+fQQudsOztmtlK+tQZmEvBOl7DHHRsqHWmuC6ZH/wgxxABg/qXRZQu7kCKV/PJeq8drBpzEeIADi5rNL3PyPS8hMgsQJL7IS2pmImBFWTTVAJpcD0h5OX8MxEXxgjtSFgiyTgdfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494962; c=relaxed/simple;
	bh=1HuyAk1wutVnbprbcT3pxK3vdXIt42OC5GcYGZ1bKMM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VQOM4tuIL0u6u5GGbhyXft9/s0ARAvL+pbiY9fdagqE+OrKVP7KlM85N9TYTQttha47zJhEHWWaq4f26iVUEIgT1M7qTvxXdpm19d8Kp2mwxPrvLnrdcBR4e+TO4sueOBcK+YRdk9tHaFj31He9HHEu2PPrQ+alakyJMFk26Kik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Qv9CR1ul; arc=fail smtp.client-ip=40.107.220.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Qv9CR1ul"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOrDv+4salVrEQp0Qfwr7skqs8t8xov+RHFHWriNB5hs7GLI+pjWJplI7dlxFj8j8AgkzKOV9NTfipOYylP6/0oyVlVVeW/KIcOjsyAniAowxEaKl0iQTbq/Myx12yPy54mC/atdUkTbK893jVVeey1Md4FnenAftKyMkwJDLd/IscyMEht38L5U7ukmHGB4a7LrpiKAGtN/ADz+m53I3iOZZuuW/DZ2SbwDpLNnTfsnnLQRg/TWDJNAx4M15Uo+MU+lTZGB+no6logcx53ItaJVLxWiSGpL88IAOBrh3IVkWiHZaQmBCXHpNfgPQWGCYb0iaWqFgbVhvCNuf78eRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmfdB+mxXrR+ivPcAftEOtWMA1RzxwkTbPKB8ren2X4=;
 b=bInzWjX/psHIjLaWMi2nHcaOom2W7YhtGaYaR2a2Web2z5Cbil1F4LQOyTp53scRwOsW1UZbU2VRy42jWWCn+KFesVX8IpCs0DcpvYqenUcEhYU04FKRjWhsp3pmFtKf9U8+r7tF5SkVXz1z9nfyXO3/m1fOLsmHixbH4P6fzqXx8CqFh05Dm9IHbhhEKhkaanbAAc+oq+BwoWz+Ay10sinQaUEnKLqFM/ykYKpKJ3cMTJlk931mtirwIwQyBn9ut71J2wyE8dIKFB2hDjYl21ivW2BeAOG6QZ86JfIjyg8PBfdrxSyEWNcVGa06IUUJKElaOT0ePhVv78y9lYfMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmfdB+mxXrR+ivPcAftEOtWMA1RzxwkTbPKB8ren2X4=;
 b=Qv9CR1ulE0Z1P57y81RDoprR0gxGIQfFrh13wN/9hMEGkBkdAPkSL9AqOUC7is3CbwmSWP5YZNvMC71WJd12Qt7/Qp3kwnoq9USTK+AM8Iq/EnJktGDiozmRurQpzBazfG4JEeOxfyurkWK25xH+2D4HlSnyT2UTkn7wWD6KgRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Mon, 9 Jun
 2025 18:49:15 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 18:49:15 +0000
Message-ID: <2d75a21d-e444-43f2-91a8-35fcebb68799@amd.com>
Date: Mon, 9 Jun 2025 13:48:56 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH 0/5] Latest version of initial patches in AET series
To: Tony Luck <tony.luck@intel.com>
Cc: Xiaojian.Du@amd.com, akpm@linux-foundation.org,
 alexandre.chartre@oracle.com, andrew.cooper3@citrix.com, ardb@kernel.org,
 bmoger@amd.com, bp@alien8.de, corbet@lwn.net,
 daniel.sneddon@linux.intel.com, dave.hansen@linux.intel.com,
 dave.martin@arm.com, ebiggers@google.com, eranian@google.com,
 fenghuay@nvidia.com, gautham.shenoy@amd.com, gregkh@linuxfoundation.org,
 hpa@zytor.com, james.morse@arm.com, jpoimboe@kernel.org,
 kai.huang@intel.com, kan.liang@linux.intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 mario.limonciello@amd.com, mingo@redhat.com, paulmck@kernel.org,
 pawan.kumar.gupta@linux.intel.com, perry.yuan@amd.com,
 peternewman@google.com, reinette.chatre@intel.com, rostedt@goodmis.org,
 seanjc@google.com, sohil.mehta@intel.com, tglx@linutronix.de,
 thomas.lendacky@amd.com, thuth@redhat.com, x86@kernel.org,
 xiaoyao.li@intel.com, xin3.li@intel.com, xin@zytor.com
References: <20250609162139.91651-1-tony.luck@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <20250609162139.91651-1-tony.luck@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SCXP298CA0172.CHLP298.PROD.OUTLOOK.COM
 (2603:10d6:300:14c::19) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 4815cbcd-dca0-438b-3082-08dda7865518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VU1wd1M2ZWZoUlZSTUNTeHJ4ZjRLbE96QUl6ckRFeUN0Tm15L1UxaDU3T3hN?=
 =?utf-8?B?aEQyeGdMdC8yOExFUmN3ZkJMSlFVQkJjODIyL0xzOUVrSXZzSmthc0hLUTQ1?=
 =?utf-8?B?ZjlnU3VoUU51TnltOEZQWjJCOGt4bktrK3Nyd25YTHUvcEtPN095TnYwMTl1?=
 =?utf-8?B?OFVmR3ZMRlA1M0FudDhrOEZCYnFKVVZaalI5Q2V5MEhCSWg0VGpFQ0JFblMy?=
 =?utf-8?B?bTRqL2I1V0ZYanIyTkdBRm81c1pnK1U4WE5aTDNOSVVGMVF4ZlowNFRKTEx4?=
 =?utf-8?B?eURObjdiUEY5MkF1YTc1aFlBa3hPODZUaWJEamRHL1lBYmNWUCtGMFBqYWNR?=
 =?utf-8?B?ZU8xUzJCT3NQa0txbmE2VmFMT3NSU25WRTdpeURxUENjUC82T1kzOE92eXFU?=
 =?utf-8?B?N1FsTDlCZnUwdnRkYXRieFBvMUFSaCtaMUZLNHpHZFo3c1B6TjAyRVlhQXhV?=
 =?utf-8?B?ZHFrbUNncUtWY2lBYWp2eDh6MjMrWjV5dzZtOWRQc01YMnFrdkxpWjMzaUlP?=
 =?utf-8?B?ZWZ1UmhJNm5Yd2pVd2UxUVgrM0t6cUFKdi9nSjA3WDlkdVdZQXh3c2I0YjhX?=
 =?utf-8?B?TzZLOVF2emVCdm92ajY4Z1ZMY0xBVFYxV1pCL0trR2g4aTVWWTQ0c3BHMWZp?=
 =?utf-8?B?S2x6enhiYk5yaFB4SGwybmJUZnZsbmo4TVlETERFUG4xYmhYZnpOMTQ5S0dL?=
 =?utf-8?B?QWsrMWFZWFBacVJ6eFRwRGhQV0pqRGtmZDREc2xmQnhUd3ZpbzZHNTJmYWZ0?=
 =?utf-8?B?WjZFSFBJd0Z3aUN5dzJ4SnlWRm83S2VaOHkyYmtvc3BnWTVocFFuOWQzK0J0?=
 =?utf-8?B?NmtNWURGb09jcUJMY0tHTFZPRjViNURpd3p5czBGVG9VMW43VW4rdlRTdXZM?=
 =?utf-8?B?ZFA3M2trM2plL3hHWXc2Mlhycm5qTGN2ZldPRXdQc25iaVl6K2JhNHYzZXVw?=
 =?utf-8?B?Wmp3U21mcW84emVhbm90TS9MMmdGQUNtaDB0M2NOMVBvK21jTU9RN2IvOFl2?=
 =?utf-8?B?WVBlSE5zOFc5czNGb3h4SjhmZ3dRR2xMZUpoL2k0ZXE0d0ZvWHEyS3AwN25P?=
 =?utf-8?B?SDlGQVpKUDNraHkxUC9MTVFkMFZzdFRjeG9PY0lpanNhS2NLeGJKRUJEbEZI?=
 =?utf-8?B?TStqM1lOL1RSRmpmZHNBS0czdmNnbzk3L1RWdU1xcW1iT2J0Y3JacjcxYURH?=
 =?utf-8?B?Tk51cGgvYzdoVnpRb0lURFdWNVU3Z1JoSHdiQmdqMmplc2pscXlIRjFIdTdF?=
 =?utf-8?B?UkRIUDBPdVlSdC9OOGR4OXE4ZVVRTmpFdFVqSndRQkdadGpXcEN6bmdOcHYz?=
 =?utf-8?B?bjFtZ3d5aE5uU2xmZ21VRTN4bTdPcVA1SzR2L1p6dmhKNEI0KzcwbGVXT29N?=
 =?utf-8?B?c3l4aDhRMW9qY3ZSRDRRQkJMTVY0WVFNa2xTM0RRbXRjZmZpQ0U3eUIzT1hD?=
 =?utf-8?B?MkVVNFVaT0l6VWFsN0JuNXNqQlRFZm5QelFoRVVqQ2UrZ3Qzbk0zaXFTOWhW?=
 =?utf-8?B?U0JNRUM1cVhmM3dsYmx1NFhtNm9lbjExYk1wdTVCVlMrcUxvZ3pDN3pDTVZU?=
 =?utf-8?B?OEgrTzd1SmEzQTlHd1VDN0lYc08zbDZHTmErT1lVbGhXTDZwZDhVeDc4SVVM?=
 =?utf-8?B?YTJ4MnAveDlGMVdUa2VlSTd1UEwrbGhwNUU1TWprWWRmWUc4Z21NWG5IQkla?=
 =?utf-8?B?anZyalZ2VkNIMVFVK0hwK3NHamY4ZS8veWZUMTJFdjB4K1pNb0poQ3RRNU9Z?=
 =?utf-8?B?bVpvTjRSV0NRd1VIdDZ2c2s4aTQyK0RwaUIzYWVDZXhzbXVGbjF6OU9FSmUv?=
 =?utf-8?B?WkZTdzVIcnFlZnAySUduVzh4aGk2L2dlcjdzekNEcC9tc2kwM3MrbU5kZGdl?=
 =?utf-8?B?YzBGSnJ6Ulp6RWpqTFlYNXhXTVRISWpUUUtkZC9EUHNBOGkvVk95TzNXUXBx?=
 =?utf-8?Q?JaSKYb9M+uI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzF0Skt5RGNCTTd0TUF3SEZUbGFEUmdwaGZ4cFNZbWZDWmw5WFdKbXFQMVIz?=
 =?utf-8?B?V01GNmw3OWV1d0drbW56VHRQWmFVeUY4UE9lUTRPZ1d5d0YzOUkwUG1xV29D?=
 =?utf-8?B?bHJPdUsrTERhaDlyVkgwWUFmaTluWUFidlBETlRwWjVKVlpocURWOFBocnV0?=
 =?utf-8?B?K1dWU0I4MXNYMDl2MXhuc1JRN2t3UmJDQWFMalVLakhWV21KbzFVYXozNncy?=
 =?utf-8?B?MmQ1Y05SdWVnd3JZOGtndWpPbHZQakgwMmtPQWpLV0VpaFNtRnpSZWlIQURz?=
 =?utf-8?B?UnV1TXRVekFvaENFZXpMN09JaU4xbFZOYzFMWG01clcvMTJ5RFYzaXBWQmJj?=
 =?utf-8?B?T1cxbGVVcW5hM05hR0dPZVFxOXVpREhodWt3enVZdTQzVUpyRWtEeDJYMXZO?=
 =?utf-8?B?NmkxQ2ZXcHF4K0hRaG9jdU5wWDFLZHBxYWkremdHbnNkTzVUay9vRlFpb21C?=
 =?utf-8?B?T2g1cUJpSUs2ZlUzNUlKS2NIK0V3U1FJNEJNOUZMR1dzMDBadUdTOHZISWRG?=
 =?utf-8?B?dk9wY1JiTlYya3I5RWFPeW5zNW56a1EwYUJGZUZlNGRKdGtRbzJCbFVkeWNW?=
 =?utf-8?B?SHBhbXdwM0RBUFcxdVBmRm4rSk5UTkwyek9hWTRlN1I5RlJhTWNRcUgvaWJr?=
 =?utf-8?B?U0VZdVVKeFhJMUdLelcrQnAvT21CWDV1WHlMSExsVGI0OW5OM2hsQjN1eVh1?=
 =?utf-8?B?S0FxR2NOL3FhTFlvcUprTVVKWUxFV0VnS3dEY3YwcGlpV2NNd2l1QS9FUHJs?=
 =?utf-8?B?cDRlM09seklVK3dyeUlIQksvUUNCQnozVnBYYkpEQWFrRC9iNXJhV0FFRVZV?=
 =?utf-8?B?TlhKdkNtQnBDWGxKT2pRTHdhQlJrdWk1OHMyVmczbVM5VUtHcFlRQzc4QnRB?=
 =?utf-8?B?MVpWd1ppYWtLUFhuQndKbnN6dHE2U2NGMlBXYnp2bTRzL2JZZ1dNN3NMa0w4?=
 =?utf-8?B?cm1YZDcxNTl0by9IVGo5dUhwZnUzR29JdTNoMHovYUVISE9aYWpzcE1zSnNt?=
 =?utf-8?B?UjI3UU5YZVhIY05SU1hjWVlpQUY1RXZCeE1veU9hWTRQbTA0R2hmTm9ML3d2?=
 =?utf-8?B?TW1yVXN1THQ3d2xmWHZ0WlRvWFBPOG1iNVNDYytCZjVVR1hEaGFOSVBEYk4v?=
 =?utf-8?B?V3laTFNFMEZEZUd3QXdXREtwT29IRG0zaDZZV3ZEMDFIWWJrMzFNM2s3c3ZE?=
 =?utf-8?B?ZzZIVVM5U2Y4WDVOSnNwbDhobHFNc3I5REhWdWVqNzlTWlFTZjhlWXFFd1RV?=
 =?utf-8?B?anRnMXV4OEZhZ2ZzR0ZNZ1hibkpOMm1XK1ZzaVdPeTRjZ0xNLzJlMGI4QndN?=
 =?utf-8?B?LzhQMUNxcUJuY1E3d0dnWG5XWjh6ZzZDVXZKRS82cW9mOVZmUHRyeE1tSHpl?=
 =?utf-8?B?Ly8wODBKVzR3c3BqeURaRW1oY2lCUXd5aHV3QnR1dVJKT0xuV1VxbGxxdjhy?=
 =?utf-8?B?UVR5cnBhSytsNnluZW0yQmNGbDVOMTF2WW5NZHZRZ0VFUUs3NGtKSGFGdW5D?=
 =?utf-8?B?K3pEZ0IyMGJXV2FOTnNlY0FaT2JVV3J1ai90YzNvQTRTNFkrMCttaGxYeXl6?=
 =?utf-8?B?c0ZGRURaRDB6UzlVazJRZUJ3aGRTQS8vNmQ5U1o5Mms3UTdjbmVad2IrOExW?=
 =?utf-8?B?VWFsc1pMdm9JZGFrSk1NVFY0c0FrZ3pwVXFSWWhFSWlHSnBIRHRIRkZFNUtD?=
 =?utf-8?B?VjdjMXhWMFdOeCtubGFHeVoxMCtCWDdxUlB6aTYxb1F4M2VlaS93NzN3RnpF?=
 =?utf-8?B?RVR2SEFJc3llNXJnbzNXREVmcmRyZVNUUzVobDhTYUpPejVxS2xkNmZKamJI?=
 =?utf-8?B?RWNUdHFOa3ExYmFGL2s5L2xpUTR4YlltNGlGSWVjTDRDZGVQVXhsSDR5ZDFj?=
 =?utf-8?B?cGxFd05iU3Y5d290aGJuYk5OcndacmxDa2tkRXZWdTF1ZVpVcVdyMFA3NExS?=
 =?utf-8?B?TXlWMVRPK0NWMUNtRDJsVDA2eTlocGUzbWFXaTVyTzRzRG9Hak9nUDd3NDBn?=
 =?utf-8?B?WGNOeUVvSnV2VWxkdjZPQktWdHZrNXZyYUl0N1BEWGU4K3NnZzM5NlRRN3Nt?=
 =?utf-8?B?VDIzTzdOWVBwWlNlSEFGOHoxNFdEM2pIZkdBUlRXZWVwekJ5M2xkd2VUVVQv?=
 =?utf-8?Q?XjPY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4815cbcd-dca0-438b-3082-08dda7865518
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 18:49:15.4752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hU3qE2uu2ljD/jDsYCCK4IUT+GuisslKE+rVu6O7rYjT2y57d+sjt7ReIGSdoJR+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428

Hi Tony,

On 6/9/25 11:21, Tony Luck wrote:
> Babu,
> 
> Here's my latest version of those four patches (build on top of Qinyun's
> patch that I believe should go upstream via tip/urgent).

Wonderful. Thank you. Will rebase my patches.

> 
> I believe I addressed all the comments[1] in these four patches
> 
> [1] https://lore.kernel.org/lkml/20250521225049.132551-1-tony.luck@intel.com/
> 
> -Tony
> 
> Qinyun Tan (1):
>   x86,fs/resctrl: Remove unappropriate references to cacheinfo in the
>     resctrl subsystem.
> 
> Tony Luck (4):
>   x86,fs/resctrl: Consolidate monitor event descriptions
>   x86,fs/resctrl: Replace architecture event enabled checks
>   x86/resctrl: Remove 'rdt_mon_features' global variable
>   x86,fs/resctrl: Prepare for more monitor events
> 
>  include/linux/resctrl.h                | 28 +++++---
>  include/linux/resctrl_types.h          | 15 ++--
>  arch/x86/include/asm/resctrl.h         | 16 -----
>  arch/x86/kernel/cpu/resctrl/internal.h |  9 +--
>  fs/resctrl/internal.h                  | 17 +++--
>  arch/x86/kernel/cpu/resctrl/core.c     | 65 +++++++++--------
>  arch/x86/kernel/cpu/resctrl/monitor.c  | 41 +++++------
>  fs/resctrl/ctrlmondata.c               | 17 +++--
>  fs/resctrl/monitor.c                   | 96 ++++++++++++++------------
>  fs/resctrl/rdtgroup.c                  | 79 +++++++++++----------
>  10 files changed, 204 insertions(+), 179 deletions(-)
> 

-- 
Thanks
Babu Moger
