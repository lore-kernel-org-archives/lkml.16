Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661BE5A79B;
	Mon, 14 Apr 2025 15:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646208; cv=fail; b=A3DYDdw/Ag5u3LCqdlOGSYzbtZxbci19FSEemX/VieqHFjfeKUlrdu4/gd6/qjskvRiz6DBsPa4wpbhNp2+ahcdNkUBCj4G10BngLQhRCzlwLdrRxQeETI6c3nPP99SSAn9jVwpb1dP+TTFzkbgsSO2kTbxaVYHxCIH541GNX9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646208; c=relaxed/simple;
	bh=VDBsQOqcv0H+Can4TmJYax3z6Ta2YeDwU/JhfFTGWog=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NfaF+y1ljAk86dBA0tccFf1FvPEe7KTN8gtU2a9KfQoCiK7NGohiTzmzY4/L/4b0ktzZsWzx+wTjaw0PL3HE2a4Z6s4sSgaeFIEDg4E3dWqvIeW+uPQchD0gDr1W3MB3hGXji9E6sZ0y31gNs/OCzn/epmzU1nFs6QTi+OcN99U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nGlheunD; arc=fail smtp.client-ip=40.107.94.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nGlheunD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTARfl/DqHOY6E7A+0uPNikB3b3qhmXAdqPMQStLurAmJj0aKCMOSc5AdjrzIiiHOwj6EccIBm+IIi5HqHSesKkV4UskXRiHCmPz+Dr+oGG4/4lkGdHxd5BivmynPl7b/3bGzH61iNiqg/uhVN3eiQqu+swpakMmX5SoDU8YjaR19HUlfriSrL+u2Cn7cLHUApeA9/89wsE9Pbo/RZ705qwJNfOxdRnbJA8W6tfsY5pTsF/4Z8am298FkFE4bg9q0Qrgnym2dIrF24NtQJCAPpJ84D01wI7GFUzMSEEcb39NWOkMBj++Ig+V4KSVk/SuI89ffU1I1MTEMlCSybyIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNpe5wt8j0CkZXCVdCqYZhTIS6ZYcD1IJfPAfbK1auA=;
 b=wnzPnTlOJNikTqyARPhhbfzvbqYx8DEM6/+OMTs1/4g20Yzw9jNQMTWsUg7BrpLFlOfR6/e3PMABZFS2zcQNGNj4q9na5hVT5VArYYfTWNtsrnSEQ8KRdXtcMSeKg9uhjtuZlE1utEzlbdFb0UmreDi4td/X0Ejy+rXXUll6FWEhSBiow96iO1FXHGlz7IkeIfuEmx02PmD2Ah6MKJewZNe77sL4CdyCJbKnaoIOoh8HZ6xl3Zc4/tnZLL3jRctUjEuIHlJ6KrsBCv8SGM9OFPbXKBVXdVREtCeM8A3uCH3AFPEu1CWL0CrRYSCF8teHeX7X62JoF51cJbdxBVgxHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNpe5wt8j0CkZXCVdCqYZhTIS6ZYcD1IJfPAfbK1auA=;
 b=nGlheunD/5hBK0WHZdAOht1LgUkJ3CJiPDN5RbLILhbEbFVtuxoyDYmZar/I/kbFsNTgKUvRq/WIOMqrrDarFVp+iYfpSSnX0GicXoiqeZQse/4J7m/G3PuE9qje0YlQlBfWAyMASvXSrDzHWfiFc1nvsz8dwy0jMw0jKfKwfVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH2PR12MB4056.namprd12.prod.outlook.com (2603:10b6:610:a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Mon, 14 Apr
 2025 15:56:43 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 15:56:43 +0000
Message-ID: <eac72b71-1441-46ed-a3cc-e2204b7eac07@amd.com>
Date: Mon, 14 Apr 2025 10:56:39 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 01/26] x86/resctrl: Introduce mbm_total_cfg and
 mbm_local_cfg in struct rdt_hw_mon_domain
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 peternewman@google.com
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <bbe371a2025d6f0bcd9151a9a4311f504c5a6a21.1743725907.git.babu.moger@amd.com>
 <6faaa78e-d269-4391-bb42-5e9b936734f9@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <6faaa78e-d269-4391-bb42-5e9b936734f9@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:806:f2::14) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH2PR12MB4056:EE_
X-MS-Office365-Filtering-Correlation-Id: c86ce06f-9740-42c2-74f0-08dd7b6cf3e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUtqSVhoVzhvREliZGlzSEJWWS9qcW1ZS2FCcGdlOTVUWHhXR0xBVzhvd0o0?=
 =?utf-8?B?M0xRWWthdDZyU1k1a1d5cU1UYkNSNUN0dWRITGtCZGRVZUdBNUtadURBVEMy?=
 =?utf-8?B?eEl0SzJIbVp3WTNQN09lNmNhOGZTeWV5dis3anMxdlpuOXNUc3UraXdwQkVK?=
 =?utf-8?B?b3RDSllvQjJmUGcvazVMVndESmhnaU1pTXNCWjVGSFRKQ1VIUXQxRm1wVGpB?=
 =?utf-8?B?Q1RFdXBKSHgza25teG41anNVbDF3TkZZNDFzS3I2K0pUV3ErZlZZT0xrQlJt?=
 =?utf-8?B?ODhrNThoWjAvblFQbVJtQTJiR25TRnVKYXN6NXpUMDdNWGJzNDdoQ050U3ls?=
 =?utf-8?B?eCthYnBZd2QzQk4vTFBZMFhHelNSSzFSeENYT290ditmcTgycjVKY1djS252?=
 =?utf-8?B?UTBKSjVDYWpOUi9FOG50MCtaS2gxN3FIdzV2eGVvOC9HenJNUEJlMVkwZ0RI?=
 =?utf-8?B?Tk02cVJ5ZW9SQ29wb3A1ZFN4QmpnTnJ6RkNEMWp4TGgrS2NnaHphMUN0cUdu?=
 =?utf-8?B?WVlhUUhRSGxTMG1tY3oyQkcwYzlwN1NRUU1BdGloZ1dWaFFKUUdId0FFQkFY?=
 =?utf-8?B?MkF4ME03dFMwSVVNejhMWHM2LzhDejRUeEluWW5WdWk2UXE3ZFByZkJVdnJC?=
 =?utf-8?B?ZnB5TGE2dkg4NjZPVDJOQ1FIdk0yS295Z0o2cmU5dHJZQ3NETkhqNXhHWGM1?=
 =?utf-8?B?ZWw3MzExQUhIRW1NSmUyR0ZnV1crQlpybWpVdXJ3a0tTSFZ2aFVUNW1URnU0?=
 =?utf-8?B?MHhaN1ZtN0lVOFpheHVUODhtaTlZL2VWR0l4Y2dPQzhNOVowOUJnOGtPaGor?=
 =?utf-8?B?VXU0YVpRelFYOFU5dVZGTVVNRW1ad09jN1RDVTJybWprSnB2Y0FVMSt3bGUx?=
 =?utf-8?B?bTdPdkRoRkZJeFNpUjVTL2x2NjVqVEh2OTB3MUdoTVZJVUV0bFVWalJNdnNI?=
 =?utf-8?B?UFdSUXkrUkhZV0NEWm5sSDZTdVlzMU5MSWlhemgvck40cXNWQ25CUEptaUUr?=
 =?utf-8?B?eEJKSDNuSFF0djBOVjk5NE9FcjBDWDB0eFdFRDBHV0tDOW42R3gycG9DV3RT?=
 =?utf-8?B?cGRucUNjK3d4TVh2Y1Uva0EvMDliOGU4YW5VOFFsQ1l0SVRuT3BJZkt1Sms0?=
 =?utf-8?B?dkFRRFNjQkVCY3J0MktOZ2xRV2doMzJDU3B4eWprZjA2c01xZ3FSUDBJeXgx?=
 =?utf-8?B?V1M4QXlVbllrWlJ0N2JENnF6cG5MaFdKeFF2emd2S2tZUGMzendlQ0RwWEQz?=
 =?utf-8?B?OHM0MURoeE1QRHlNQkxsazNHTmNGT2xzd2Z2L1RwbXZFb09VcFhYVUJUTXZl?=
 =?utf-8?B?dmdKL1RqOWE0eGlMNnRMSy9ua2hXQ2E1NklXUzlTRUtNdFZkSkFtMVF6aDdo?=
 =?utf-8?B?alZmeS81NCt4TVZuVVdrczlTSEV5R01MeDVqSkxIYmpXZkVGN2Q2U0lFUDhP?=
 =?utf-8?B?d3I5Mm8zaHcvN0x1OGR3ajVJVFRFYlZjTjNkN002T0dhanZraTNIa1BVdlVF?=
 =?utf-8?B?TEVGYWdGRW9zZ0I3RWw1OXp4d205enNHcGhmNGRoYnYyckp5RjB2Uk0wZnc0?=
 =?utf-8?B?VS9ZYXpwemtBN29EVFBRMzA5YmlwTUgyUkxocWlMQ0gzSm9Ya3ltNkN3YlMw?=
 =?utf-8?B?SDVucmlBUHEvRHR6cy9SRytnMGpzWndVMFNSKytBcFFNY1NlUGFGSis5N044?=
 =?utf-8?B?Ny9qbHFlR29PNlMyVzVpdmlPam5YU0NWNmtPM2lCRWpPdkdnQW54RTVRWFlY?=
 =?utf-8?B?VHhHK2JEbUgwNmN5QlZ4U2sweWRweE52SmYyUmFUMnFubnhhZlJKYnN3U3Zj?=
 =?utf-8?B?UkZ6TG5iZ21NMXNPdlZrQ09qajNZSHVJQkNzMFhlQ0JUZG9DZHBpQWRNdGFS?=
 =?utf-8?B?U3pSVGRCTlZVVWlIUHA3bngxQzhhMkRLUFRwanlwNlJaY0I5VTRKamwyc3NM?=
 =?utf-8?Q?sOrk5UGdnGk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmtpZTZVNUR1Vk9kRmVNMkxRUGh2QVRSN2huYUlvN2xoZjZuVzVxUmd1RzNE?=
 =?utf-8?B?aEkxOWxCOWNoeGtidEhIcTkrMnJwN3VPRFhpaXhrNkVyVENaSlNONDVaMXpz?=
 =?utf-8?B?TjZmQWRMT3FuZFZKckxDUTgwck1qTnQ2RjA5bTg3bnEzOWdmTVlvalNybkI1?=
 =?utf-8?B?WjBQM3YrcTBzczhDaTlqTWpJS0tVbVRuZXNUN1pZTDE3ZG9Wb2xJYVFkcW9l?=
 =?utf-8?B?cnNOamM3dCtreWdXS2FxTWVoWHVrSTJDR2d0ellrUkdHYW1COEkrRGx5bEpi?=
 =?utf-8?B?UzR1LysxNWplUnhEY0I5aGVHQkJLd2hmd3haT3JvZDJEMTBiVUw3dTZUR01Y?=
 =?utf-8?B?Z2dzUmlhcEFZdmFYWjZTZkgyQ1VzR3JOZDNzQStUbXVKZEtKMmprNWxrL2ZQ?=
 =?utf-8?B?WlJhcHhyZVhHTUt6b0QxUTBQNGF1Tng2d1NZRk1MeUsxMzh0bEFNd3pNNUNn?=
 =?utf-8?B?VjZqOXBaNUd4YkwyN2ppNHNvV0FhcGN2V3poT0piYWpKNmZvc3ZqcGo5K0hr?=
 =?utf-8?B?djRGamRNcVRZTW5WOGxxQ3U1SjZRN2RvamxTZFlBMDJYSVhnMkhqTlB0ZG9a?=
 =?utf-8?B?eVF6RGxpeDlXaXpsZkVWTDhBaGxnNzlLalZqeDVDa0xsUENiNXZ5NHU5VzJS?=
 =?utf-8?B?RHRmbXhXVkVaaFU1UC9oUW9CTkVxWFNVUkdrSlB1YU5WV0VOazZXYTNjS01J?=
 =?utf-8?B?T2oranBXVTlPVlBCWmhOd2RGb2VkdUpjdXFDVzd5STg2RnVWRFhseWRHSEpU?=
 =?utf-8?B?NHFtSzFtekw0MTdMZjlqN1QwMGR4b0tFdS9WbGlFWFRoUWhpdW9Nc251a1NH?=
 =?utf-8?B?V1pPYnFQNWkxdlVkeGNxOThxajg2TEliYjQ4SHQvalpDRGhWZTNmNE52eStl?=
 =?utf-8?B?YlhBR1NoODYrUUFWczAzQ3cvM1IvYUZSVE05cHNWNGxpRmlMRHRKTXNrYUc5?=
 =?utf-8?B?WWtRWGlhMkVOWENnaFliVDBEYjhVdUVQNkVsN0JMUUZZbVh5b1MyT1BiaUJV?=
 =?utf-8?B?VDhNL1RGbHZNdkdJTHBvdDFiUEdtTlNtVjNybWVYZWkvRGtRbDYrZ1NWaHRB?=
 =?utf-8?B?eEk1WHpoSmdMdVRjYytRMW1aQzRrVmIwNnY5M1Z1QjBTOFJkbHdydGVCY2c3?=
 =?utf-8?B?SVRIYUs2WStiQ2t4WHhPTlNSVHU4a25ZdDk5VFp1bjBNREZ2VHlaOW5id1E3?=
 =?utf-8?B?L1dNUmtKeDhWR3B3ckdoRk9BSmEwZXphQ0VibjliZWVyRWFPaU44Njg2dTNt?=
 =?utf-8?B?a093ZGZWSGk3R05VcWNVTVVhWjN6L296OTdEVG9kSnZldmhCMmU4VmV0ekRU?=
 =?utf-8?B?c0JyaG5pd3ZncTcyL1lMcmRMY1JVUmJIZ1plb2tuenZwZXpwSDZ5aFQxb09x?=
 =?utf-8?B?ejlHeHd0OU96M0prZVpyZFU2VXIrNGxwMytSbjFWSXV5M0pTTWxNZUMwaGFW?=
 =?utf-8?B?QVVxcmNsd2syVzdXeVJVbFVMckhsQm5CLzFvN1BwZXZzZngvWVdoZEtPbUNM?=
 =?utf-8?B?OWxGbTlLRmt2NGpMVlhmM29VY0tjRDhiNnNWc1JlUHI5UC9PSjJoaEtXRW03?=
 =?utf-8?B?YXV4ZG82TVhHdnlSOWJXRklFb2pJUDdrT0xKRWVyWlNhdXB4Vndlcnp0eERy?=
 =?utf-8?B?T2lIOXNoWWhnUHEwUC8xS21BUW5lRHA0emxMakdzY0lJc2VZL0ErdFJpMXo4?=
 =?utf-8?B?MVZwYnpnaVRsU2tGUktVbU1OeGZNZTdaLzdGeWJveEx0YVVCYnYyVkg5ZUxY?=
 =?utf-8?B?NFlYLzIyN3lBbXYzUnUzZzVBdE9PckZHTDFTMjczY00yZ0ZpSmZKdjVFYXAv?=
 =?utf-8?B?TW9scTNOdmpWaVRLdkdEZTRxL1AxODNVeE1Gd0FmejNVQ2lEcmFSZXdEZG0w?=
 =?utf-8?B?S0JPdXBGYUViWW02UkIyYkNCWU91R3g4YXFiM21XdmJKK1EwVHVHNVBDK3dl?=
 =?utf-8?B?KzRCN3R2V0o5VGRNYi9mbXhmek5LLzZNbVNEcDE0RWZhTHNYWURxZVN5amNi?=
 =?utf-8?B?RTdSVmJ2Tk5qd3NVaDJjenR0dGQrdWlueUE5MGc5aVR3SnZPaTVsb0ZZc3lx?=
 =?utf-8?B?ZWdZTUx0ZzB0TWJLSk5wTFpDOVFhTW1HUjZrSDkweGUzUExXeHhZS0FaNXVC?=
 =?utf-8?Q?nrRg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c86ce06f-9740-42c2-74f0-08dd7b6cf3e0
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 15:56:43.6579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGUk0Gyl+uJTmAx3AUhNL7zX9hjhzBoF0QlyVRJmkqWyXlSW9Ea6R+SRpaG6S1zO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4056

Hi Reinette,

Thanks for the quick response to the series.

On 4/11/25 15:49, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/3/25 5:18 PM, Babu Moger wrote:
>> If the BMEC (Bandwidth Monitoring Event Configuration) feature is
>> supported, the bandwidth events can be configured to track specific
>> events. The event configuration is domain specific. Event configurations
>> are not stored in resctrl but instead always read from or written to
>> hardware directly when prompted by user space.
> 
> Why is this a problem?

I mean it involves an extra MSR read every time use asks for it.

> 
>>
>> Read the event configuration from the hardware during domain
>> initialization and store the configuration value in the rdt_hw_mon_domain
>> structure for later use when the user requests to display it.
> 
> Why is this required?

Minor optimization.

> 
> This series is about adding support for ABMC while this appears to be
> an optimization for BMEC. Even more, as I see it, this optimization makes
> resctrl support of ABMC and BMEC confusing (more below).
> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v12: Fixed the conflicts due to recent merge.
>>      This patch is for BMEC and there is no dependancy on ABMC feature.
> 
> Why still do it?

Ok. Will drop it for now.

> 
>>      Moved it earlier.
>>
>> v11: Resolved minor conflicts due to code displacement. Actual code didnt
>>      change.
>>
>> v10: Conflicts due to code displacement. Actual code didnt change.
>>
>> v9: Added Reviewed-by tag. No other changes.
>>
>> v8: Renamed resctrl_mbm_evt_config_init() to arch_mbm_evt_config_init()
>>     Minor commit message update.
>>
>> v7: Fixed initializing INVALID_CONFIG_VALUE to mbm_local_cfg in case of error.
>>
>> v6: Renamed resctrl_arch_mbm_evt_config -> resctrl_mbm_evt_config_init
>>     Initialized value to INVALID_CONFIG_VALUE if it is not configurable.
>>     Minor commit message update.
>>
>> v5: Exported mon_event_config_index_get.
>>     Renamed arch_domain_mbm_evt_config to resctrl_arch_mbm_evt_config.
>>
>> v4: Read the configuration information from the hardware to initialize.
>>     Added few commit messages.
>>     Fixed the tab spaces.
>>
>> v3: Minor changes related to rebase in mbm_config_write_domain.
>>
>> v2: No changes.
>> ---
>>  arch/x86/kernel/cpu/resctrl/core.c     |  2 ++
>>  arch/x86/kernel/cpu/resctrl/internal.h |  9 +++++++++
>>  arch/x86/kernel/cpu/resctrl/monitor.c  | 26 ++++++++++++++++++++++++++
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c |  2 +-
>>  4 files changed, 38 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>> index cf29681d01e0..a28de257168f 100644
>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>> @@ -558,6 +558,8 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
>>  		return;
>>  	}
>>  
>> +	arch_mbm_evt_config_init(hw_dom);
>> +
>>  	list_add_tail_rcu(&d->hdr.list, add_pos);
>>  
>>  	err = resctrl_online_mon_domain(r, d);
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index c44c5b496355..9846153aa48f 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -32,6 +32,9 @@
>>   */
>>  #define MBM_CNTR_WIDTH_OFFSET_MAX (62 - MBM_CNTR_WIDTH_BASE)
>>  
>> +#define INVALID_CONFIG_VALUE		U32_MAX
>> +#define INVALID_CONFIG_INDEX		UINT_MAX
>> +
>>  /**
>>   * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
>>   *			        aren't marked nohz_full
>> @@ -335,6 +338,8 @@ struct rdt_hw_ctrl_domain {
>>   * @d_resctrl:	Properties exposed to the resctrl file system
>>   * @arch_mbm_total:	arch private state for MBM total bandwidth
>>   * @arch_mbm_local:	arch private state for MBM local bandwidth
>> + * @mbm_total_cfg:	MBM total bandwidth configuration
>> + * @mbm_local_cfg:	MBM local bandwidth configuration
>>   *
>>   * Members of this structure are accessed via helpers that provide abstraction.
>>   */
>> @@ -342,6 +347,8 @@ struct rdt_hw_mon_domain {
>>  	struct rdt_mon_domain		d_resctrl;
>>  	struct arch_mbm_state		*arch_mbm_total;
>>  	struct arch_mbm_state		*arch_mbm_local;
>> +	u32				mbm_total_cfg;
>> +	u32				mbm_local_cfg;
>>  };
> 
> This introduces an architecture managed per-domain event configuration while
> the rest of the series introduces a resctrl fs managed global event configuration.
> I see this as the start of a source for confusion about how events are configured since
> there is no further connection between this per-domain event configuration maintained
> by the architecture and the global event configuration maintained by resctrl fs.
> 
>>  
>>  static inline struct rdt_hw_ctrl_domain *resctrl_to_arch_ctrl_dom(struct rdt_ctrl_domain *r)
>> @@ -504,6 +511,8 @@ void resctrl_file_fflags_init(const char *config, unsigned long fflags);
>>  void rdt_staged_configs_clear(void);
>>  bool closid_allocated(unsigned int closid);
>>  int resctrl_find_cleanest_closid(void);
>> +void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
>> +unsigned int mon_event_config_index_get(u32 evtid);
>>  
>>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index a93ed7d2a160..abd337fbd01d 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -1284,6 +1284,32 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>>  	return 0;
>>  }
>>  
>> +void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom)
>> +{
>> +	unsigned int index;
>> +	u64 msrval;
>> +
>> +	/*
>> +	 * Read the configuration registers QOS_EVT_CFG_n, where <n> is
>> +	 * the BMEC event number (EvtID).
>> +	 */
>> +	if (mbm_total_event.configurable) {
> 
> Please keep an eye on where things are going in the arch/fs split.
> mbm_total_event is private to resctrl fs and arch code cannot reach into it.
> There is the arch helper resctrl_arch_is_evt_configurable() but I also
> think that this helper needs to be reconsidered in the light of ABMC.

ok

> 
> Overall I think this ABMC support needs to consider what already exists
> for BMEC support and ensure that both are supported coherently. For example,
> when a monitor domain has a "MBM local bandwidth configuration" then it should
> be obvious what that means.

ok. Agreed. Lets drop these two patches. Lets address ABMC in this series.

-- 
Thanks
Babu Moger
