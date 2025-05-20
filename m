Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2083.outbound.protection.outlook.com [40.107.212.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAF9262FD6;
	Tue, 20 May 2025 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754937; cv=fail; b=qV4ES7IfvKQWjNKlQlIwLkQ8qsV0CycqUY9O2xU+i7DUhSbScxVdLkJC7pyxFr5XiSL50j1aET5o/KdLkuA6NYKpatucnjsPAq3/rJ9u1mGz55GcGCbZxnTdldWomXM3jl3mzPfdKmH0OOp7xDFa42knu+MZZNw4OUShPruMumo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754937; c=relaxed/simple;
	bh=1QOgI9j1HkVQoA+r2Zd1DkWp5XX59AC9gu56sDCiK8k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A8XzSq0qw9qRyzL0yMVb/opzfToweITuz3I+aRi9a6bNWUyVdg/QhypaXmKzfZxppqxNsxQTJ3ovSBL9GwyE26Gpi45A7coR+nM7F8ipbk6M6y3kBuJLn/1/ctG779NYajsXAW6xBbeDyXJdge6iE+Sr5eOHW4C/N3DqHB8pWX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Drw1eP41; arc=fail smtp.client-ip=40.107.212.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Drw1eP41"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2ek6PYt9jAeR8oEusr4KXFXUgr2VRgRxziV4Zav0yD5b6hfHAdBPxtfGmUxF/3fdVYWW4HcUQHw8dHVmqmZe8AsII45TkOkHacl7rn1Tup9nCsciTeFHwenannebFQFe96KZWdo6rBNRUCUXHtlp7/iZkjkpHDFbksgldPHJONjnnk7ORtLuk2mnORo8Qzo4DiisTrit7YM0dlIQkvh+oNOpulid7kN19jW3Y1Ypf+5gO8Kf4GwiqyHzojS880O4CEJ+IFIGPUmhHbVZArgRmDCLpVkpzewNICKeKTp2B7KeRpZEX/jZ8O+uq2exL+hF/pU8HGobiDY7lbCRXTV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKsdogSj3w8OfYxpCgECBM31PQYr2vqHVKs8U5PTbZk=;
 b=pglAj+bCOV18KLQubZxXTlLRyzPiN5cLm/nRCaRLfjkzX+e6hx5BLPPKE0hkINlWisvxSkZCzQljsu+aJOLUD54ND6Ydo8MlyAMSmaFpKgA6pIIiEhFZxlG8z+Twx7AQ2WjMhpn5L4AqqLyWXQjIfK+uSaF9libEUy90aFc9FtK3//ZiGoQ8pIjV4WkiTBQcQh20MN/NmGH0j1tSHeSn8ulXhTZyJ8i2v6PUvoE7WAS7j54IRTvXjkx8jpn3UXZKQXAwIc/HbrZsYnwAqRU2J7JOACs0fzecBS2lhUjQ6mw8VpqNNJ2CpJgOnCRsxarkeOMp4csnXStdSbtli41GUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKsdogSj3w8OfYxpCgECBM31PQYr2vqHVKs8U5PTbZk=;
 b=Drw1eP41PNPgcjz1ZftcTfK74VcwsJVMnPW7A2cGabfkpUrSJkNY9ZiAsIr26UQLZWLRp0D34OlKARXAYPF2p/2f7RHEY20kwxhDgxM+lGuYsRqr4aYYY9+IlMIAAydmxmE88AfU6InZy2KDLNUonL9x+QmrtqOKbGvqPOGjPcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MW4PR12MB6876.namprd12.prod.outlook.com (2603:10b6:303:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.27; Tue, 20 May
 2025 15:28:47 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Tue, 20 May 2025
 15:28:46 +0000
Message-ID: <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
Date: Tue, 20 May 2025 10:28:41 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Peter Newman <peternewman@google.com>
Cc: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, james.morse@arm.com, dave.martin@arm.com,
 fenghuay@nvidia.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com, Xiaojian.Du@amd.com,
 gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:806:27::27) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MW4PR12MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 00308e3e-4b80-4e63-43fb-08dd97b302e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rm9JVGl6eFZleGFjSXFpRTJldU5qRWlkVlF4MFlzUlJ2K2o0aW5TRUZSeWRM?=
 =?utf-8?B?b0hCem9DQ0xteFViL0pKOHVMc1dLYk5lQjVMUFJSU09xZ2o1dDNZMGhOSUNp?=
 =?utf-8?B?OU1mc01yUGxhTkJLVWU2SE1lNWVwek1obldLZys0T3FIcDA1dkVwVlJEa2h2?=
 =?utf-8?B?YUJvMEE1OFRBT2M3anp4a2E1aGRqWmVtQ3Y3VytTZHhTMU9aS2NyczB6Rk1T?=
 =?utf-8?B?Z3pZRktjeTZpbDRDblhsT0dDQTBSMi9BV1BCcHQ5Skg2TTBMYXEraFJjZk1S?=
 =?utf-8?B?eTBUamhNZ1BPYjR3N3VPZG5KQnczeWkza2VVU1h3RUtHZVlmelZ3OWZ2N3VS?=
 =?utf-8?B?MjVFWFp2TE5WNVFiOWVkQWN1QmFwbjVndTdNbGhjWDBUS2U3c2pBeWdad2hO?=
 =?utf-8?B?V3BpNDRBZzgyZyszL3VjZTRSbThaR2QvaTcvdTB6eWY5YXZPdk9zZTVpZ3RP?=
 =?utf-8?B?cTg0TEhraGRzdjJjaTVIRmNseFl6aTBsdVVGcWdYVTYzSjM5Sktjc2wxb0dS?=
 =?utf-8?B?VGJkQ0FrZldWMUNrZmlOajJSUXRrZm9MRjYrcTNkTDRDcytSOE4rR1I0MXpu?=
 =?utf-8?B?dEJ0cUkvUE83QzhWMkpBZG8yLzUzdHQwWmxsNGplcEdMU2JHMGpNKy9SOHQ1?=
 =?utf-8?B?dnEySG9OQ0VyZHNYb01aQkdlbWFwL3dDNUN0UmRWSEYxbitYRUFWTjhDMDg4?=
 =?utf-8?B?ZDlmU3VrRW4wQjhNNTR2SnVyQWpkV201a0xId3dGdzNFSVRjbjRPeWhwSUs1?=
 =?utf-8?B?VEl0dGFBMlpWT09NM2daMFF3ZUttVlliM2lkd3dKT1p1bVZ4THBuYlZ1SVJs?=
 =?utf-8?B?WGM2MTR3ZTE3M0V3VlpUN25pbSs1d0FkTEZvdVdFbDQ4UW9IRWpFdjVuOWtv?=
 =?utf-8?B?aHkvUEZhN092NytXRHZYTGo0Y1BPdWtaYmxpT3Z1S1U4U1JjUXJBV09EbFJV?=
 =?utf-8?B?WVhxNDBlcnptOGxVSGtvL1FrZ3ZRb0pocXFXQVJpQlB2d1JtTU9MRXNmQzNB?=
 =?utf-8?B?ejJGdllQTno2MDFQZHFSSlVDZXRHY0EwNm96NE1BdE83Wnl4WmFqVlNvK2tS?=
 =?utf-8?B?OE5UenRHcnR3Z3FyTXZJY2lteXFKUU1PZVhadnpzSXlvY0ErRVRTeUVERWNU?=
 =?utf-8?B?ZEVFUWtWVmIvREh4dlUxb0lJbStUSDI0SEt2TUhFTmRuUHBMUEF2WUNhaENj?=
 =?utf-8?B?VWJVdGhCaCs0VlBGUDlMeHg1WTVkMDdTVHB2MHpIcXZqQTAvZUl1eUR5NGp2?=
 =?utf-8?B?L0cwOUsralRVV3hjMDIwTVAxUUM1MVByU2hCRFZWUkR5QzB1OTROSDcvajNn?=
 =?utf-8?B?K3ZMMS9oT2NaNmVvNDJTMHkrYkxxc3VYSEFxT1JpN1ArQlcxMVdkM0ttRFVV?=
 =?utf-8?B?RWRLOERqMU1TYURDYUVPQ1U5Q1VJRlo2akNkMVFzcDgvVjNUamVkWDFqR05J?=
 =?utf-8?B?bFRqbmxNbDc0MXhWV1FiN3htNnlEWExjUWovUk05dGlWWUdTckdFSHpDSWNn?=
 =?utf-8?B?YVA1MlEyankycDNBVDl0S0NobGJ2VU5qTGhsMGpwYmlzcGxrc0cva1RrL29D?=
 =?utf-8?B?bWFMazRlcDQwUy8yZTliOVNremExcnVITUllU0ovNHdVWEhFcVZBMmc4NzZD?=
 =?utf-8?B?Y0c0anhKdEhTZ28vVnA4SFZtaXZLRGZFeWo1dExBZTZSL1ZFa1lYTWNDYS9Z?=
 =?utf-8?B?eC9NM0lmN1I5dnBGQ2lXY05yMTlQREhwZGxJQ0tUb1hqK0VrMU5zVVJwZi9I?=
 =?utf-8?B?NlRiVGRVd2xSbXV1S1IzMFFoeklLejFPeU1nazNxTk1tRzEwZUdvSzQxK09v?=
 =?utf-8?B?OTdQSytFQzJpOHpKb0tuRmtDNHh1NmNEL0xueGh0enBzdHJlOUk1eHJaVlBQ?=
 =?utf-8?Q?h83BW/JhGzCNv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3AxT3Jxc3lmQWZiSlN5RDRsUTZmS0sydHNKdXhaVk1PaGNnSEx0TC83UWNk?=
 =?utf-8?B?L0pHY2xJOVNqS3VUYlFmZUFXWk1Vd05CbjJIZXlvM3ZZREw4RWhSZHhlZ0ZG?=
 =?utf-8?B?NHFUek5xZXpFTS9MZDI0VldLOVVqeXRaR05LUjYrTm44RXRYM1Fzd0IydVNP?=
 =?utf-8?B?eVd1N1VlT25jTE5VYnMwTUlyTlNSK29yTTY4b1RleVlobmNacloyS1d3VjF2?=
 =?utf-8?B?eUxDQnZ6SFlHdldmdVhIaW51RHE0ZStNSWhEakNYR1dSQXh6N2k2STZoWjZu?=
 =?utf-8?B?SGkrM0w1NjgxZEp2cEtxQVlZTUREZU9ZVXR0UWpBRTNvMzF4OGFMdGZPWlll?=
 =?utf-8?B?dkdTbk1HWG5BbjkySjlzcG5GWVZQa3krSlJ1Yk1SeGpaalNmRVd3SGw3OC9P?=
 =?utf-8?B?RUFPTFJCQzlNQVpOcnNvMnNEMmQzMVZiaktDeU00MDFUUGY1UHBQbXpjc05J?=
 =?utf-8?B?L3REazVBS3preE1kRzQ3RmNtd3p0VUxvV2lPcTI1TUFqRDJUbEJUdVduQ0sx?=
 =?utf-8?B?NEpiWHBWdUtDb056N1RCVEJYNXA3MjFoM0pOeWJWVHlWT1k4eWhoNXBVamRq?=
 =?utf-8?B?dlVTdWhBelY2LzkyV2NURFRMekdhVER4V05VUW9NcEkzSGNoKzJabHRpM3lj?=
 =?utf-8?B?R0xPVEdBazViTnRNTHY4YTdrbGM5aXFsZjFCTnpGbTgyVXpXK0VKU1A5Q3dN?=
 =?utf-8?B?Ym1rWUdEYjNhRWZLYnZxS1pLOXJsQ1NaeS81YUxyVnBMK1ExcS9LUVdhZGp6?=
 =?utf-8?B?Z1hBcGY3QW82UVdzMC9VUG9WY2ZvdHlUc0svcUd4d0NqWlFrSEdTeHh5NmlM?=
 =?utf-8?B?Uzd6MTJpL0FROXc2R0RLdTJlcjlvWjErKzZ1RzZWd1ZtRzRjb0NHbnppallG?=
 =?utf-8?B?WWVRWElDRFByQWNFZXNRNGpJdU1iOGxUdEJ1WmFtUmJuUkhKN3NqRHQyM0lp?=
 =?utf-8?B?MEk1Q2RsQ3NHMUlkUXlpYkVaNk41ZEhQUXFVN0FZTWRNcG9UNWZGbklGcEZY?=
 =?utf-8?B?WWhGUmlwZHVMUlRUTnFPemhjdllyb3JySDZwZUNZN1VaUVpzazB1UGNsSWNl?=
 =?utf-8?B?SlJlNCt5aHJ1WkdYcDBDUnlyWDd2Wkh2OTJRdzlWdlhKcXF2MXhod2ZicnhV?=
 =?utf-8?B?cWV4Zk0xdSs5Mk9HblpSTitRR0xrcHFrOVJwcy8xNDJsbHRvZWo1VldWczBV?=
 =?utf-8?B?amZQK3BuRUNyemltU1l3NGNPSk1PL05VMFMyNlNTTWUyZDRaS1ZrTUJnNGlJ?=
 =?utf-8?B?KzVBaXJQVEgwY0dPQ095Y2o5KzYyODdEenVMMjhIMXFjMVY1NlBzSDVzRDZq?=
 =?utf-8?B?NzU0ZG9IWi9FbzdKMnJ1RER4L2Q2ajlLZ3hQajNEQk9mVnNxeUlJaldIcTZ1?=
 =?utf-8?B?Vk1ZbUdpcG5NTDFWUTJ1azFWa3hjemJKZmMrbU4xNEFuVlRiWHdEVjJJNjdC?=
 =?utf-8?B?Q1FuNis5NGdtUWNSeEVHVFNhb25SN1pjNVZuTkorVTg3WG4wckZPcjlRanM1?=
 =?utf-8?B?L2hPdkdOKy84RXlXdmVNMzJDam1sL010bFlpQzZ4T1NLRDNYNEhlYTRsYWYy?=
 =?utf-8?B?NEVBaW1ScUltaVkzcWFmRjI4Z3gzUGtIdFpDVGVWVy9uM2I3eC8zOFlaK3RI?=
 =?utf-8?B?Z1o1Q2ExaWRvUmwxZ0FTTHJNM1cxMFVHQ0J4eEpSRkx6RE5NbDhibG80RkpI?=
 =?utf-8?B?TGNzOUJCTFVHd1B0a3E1cHBRc1pWUU5XZFQ4SkxIUWJMaWJWTHJwNUJLYzJJ?=
 =?utf-8?B?STJqWE1GZXUzdXcvQ2U4TkVQTndJK0pXN3RnelRFbEtaWVo1VzdrUStKMTM4?=
 =?utf-8?B?eFU3b3hVcVArVXNzRjFPSXVlVmpZVVcyRHFHWGZtT21PcUNuQzdmbkcyYzVG?=
 =?utf-8?B?Q0pTN25QK3dsS3BCRXlZd1NIOVE3b3d5cVJiN1VHQ3lOeFVhWFBBR3k1N1JH?=
 =?utf-8?B?MVd2V1dpUjA1WkVPU2h3MzE4cUxWWGoxQkdyYzVtVkp5dCsxVVo2N2NHTDlV?=
 =?utf-8?B?cGVselZuTGIxajRjQzQrbGN1bUZWSk1uandyeXFPczgzb3lRU3M2dkhNSE8v?=
 =?utf-8?B?dS9sWkZWNWQyZVJBQ0RONFY4bWlOTlJUeFJabVFRYlBleUZQSmNFLzY5NXdP?=
 =?utf-8?Q?7DuY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00308e3e-4b80-4e63-43fb-08dd97b302e7
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 15:28:46.1750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bLOquAtiSbIoMT33mPGEvr47Kwy12ZHRBgpskmpyn0y4gnn8Eondc3tA+Xgx3AB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6876

Hi Peter,

Thanks for trying the series.

On 5/19/25 10:59, Peter Newman wrote:
> Hi Babu,
> 
> On Fri, May 16, 2025 at 12:52 AM Babu Moger <babu.moger@amd.com> wrote:
>>
>>
>> This series adds the support for Assignable Bandwidth Monitoring Counters
>> (ABMC). It is also called QoS RMID Pinning feature
>>
>> Series is written such that it is easier to support other assignable
>> features supported from different vendors.
>>
>> The feature details are documented in the  APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>> Monitoring (ABMC). The documentation is available at
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>>
>> The patches are based on top of commit
>> 92a09c47464d0 (tag: v6.15-rc5, tip/irq/merge) Linux 6.15-rc5
>> plus
>> https://lore.kernel.org/lkml/20250515165855.31452-1-james.morse@arm.com/
>>
>> It is very clear these patches will go after James's resctrl FS/ARCH
>> restructure. Hoping to avoid one review cycle due to the merge.
>>
>> # Introduction
>>
>> Users can create as many monitor groups as RMIDs supported by the hardware.
>> However, bandwidth monitoring feature on AMD system only guarantees that
>> RMIDs currently assigned to a processor will be tracked by hardware.
>> The counters of any other RMIDs which are no longer being tracked will be
>> reset to zero. The MBM event counters return "Unavailable" for the RMIDs
>> that are not tracked by hardware. So, there can be only limited number of
>> groups that can give guaranteed monitoring numbers. With ever changing
>> configurations there is no way to definitely know which of these groups
>> are being tracked for certain point of time. Users do not have the option
>> to monitor a group or set of groups for certain period of time without
>> worrying about counter being reset in between.
>>
>> The ABMC feature provides an option to the user to assign a hardware
>> counter to an RMID, event pair and monitor the bandwidth as long as it is
>> assigned.  The assigned RMID will be tracked by the hardware until the user
>> unassigns it manually. There is no need to worry about counters being reset
>> during this period. Additionally, the user can specify a bitmask identifying
>> the specific bandwidth types from the given source to track with the counter.
>>
>> Without ABMC enabled, monitoring will work in current 'default' mode without
>> assignment option.
>>
>> # History
>>
>> Earlier implementation of ABMC had dependancy on BMEC (Bandwidth Monitoring
>> Event Configuration). Peter had concerns with that implementation because
>> it may be not be compatible with ARM's MPAM.
>>
>> Here are the threads discussing the concerns and new interface to address the concerns.
>> https://lore.kernel.org/lkml/CALPaoCg97cLVVAcacnarp+880xjsedEWGJPXhYpy4P7=ky4MZw@mail.gmail.com/
>> https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/
>>
>> Here are the finalized requirements based on the discussion:
>>
>> *   Remove BMEC dependency on the ABMC feature.
>>
>> *   Eliminate global assignment listing. The interface
>>     /sys/fs/resctrl/info/L3_MON/mbm_assign_control is no longer required.
>>
>> *   Create the configuration directories at /sys/fs/resctrl/info/L3_MON/counter_configs/.
>>     The configuration file names should be free-form, allowing users to create them as needed.
>>
>> *   Perform assignment listing at the group level by introducing mbm_L3_assignments
>>     in each monitoring group. The listing should provide the following details:
>>
>>     Event Configuration: Specifies the event configuration applied. This will be crucial
>>     when "mkdir" on event configuration is added in the future, leading to the creation
>>     of mon_data/mon_l3_*/<event configuration>.
>>
>>     Domains: Identifies the domains where the configuration is applied, supporting multi-domain setups.
>>
>>     Assignment Type: Indicates whether the assignment is Exclusive (e or d), Shared (s), or Unassigned (_).
>>
>> *   Provide option to enable or disable auto assignment when new group is created.
> 
> So far I was able to reenable MBM on AMD implementations (for some
> users) while deferring on the counter assignment interface discussion
> by just making shared assignment the default for newly-created groups.
> Until they want to upgrade assignments to exclusive or break down
> traffic with multiple counters to watch a particular group more
> closely, they won't need to change any assignments.
> 
> Just pointing out that this turned out to be a useful first step in
> deploying ABMC support.

Thank you.

> 
>>
>> This series tries to address all the requirements listed above.
>>
>> # Implementation details
>>
>> Create a generic interface aimed to support user space assignment of scarce
>> counters used for monitoring. First usage of interface is by ABMC with option
>> to expand usage to "soft-ABMC" and MPAM counters in future.
> 
> I'll try to identify any issues I've encountered with "soft-ABMC".
> Hopefully I'll be able to share a sample implementation based on these
> patches soon.

That would be wonderful.

> 
> There's now more interest in Google for allowing explicit control of
> where RMIDs are assigned on Intel platforms. Even though the number of
> RMIDs implemented by hardware tends to be roughly the number of
> containers they want to support, they often still need to create
> containers when all RMIDs have already been allocated, which is not
> currently allowed. Once the container has been created and starts
> running, it's no longer possible to move its threads into a monitoring
> group whenever RMIDs should become available again, so it's important
> for resctrl to maintain an accurate task list for a container even
> when RMIDs are not available.
> 
>>
>> Feature adds following interface files:
>>
>> /sys/fs/resctrl/info/L3_MON/mbm_assign_mode: Reports the list of assignable
>> monitoring features supported. The enclosed brackets indicate which
>> feature is enabled.
>>
>> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: Reports the number of monitoring
>> counters available for assignment.
> 
> Earlier I discussed with Reinette[1] what num_mbm_cntrs should
> represent in a "soft-ABMC" implementation where assignment is
> implemented by assigning an RMID, which would result in all events
> being assigned at once.
> 
> My main concern is how many "counters" you can assign by assigning
> RMIDs. I recall Reinette proposed reporting the number of groups which
> can be assigned separately from counters which can be assigned.

More context may be needed here. Currently, num_mbm_cntrs indicates the
number of counters available per domain, which is 32.

At the moment, we can assign 2 counters to each group, meaning each RMID
can be associated with 2 hardware counters. In theory, it's possible to
assign all 32 hardware counters to a group—allowing one RMID to be linked
with up to 32 counters. However, we currently lack the interface to
support that level of assignment.

For now, the plan is to support basic assignment and expand functionality
later once we have the necessary data structure and requirements.

> 
>>
>> /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs: Reports the number of monitoring
>> counters free in each domain.
>>
>> /sys/fs/resctrl/info/L3_MON/counter_configs : Directory to hold the counter configuration.
>>
>> /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter : Default configuration
>> for MBM total events.
>>
>> /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter : Default configuration
>> for MBM local events.
> 
> IIUC, this needs to be implemented now so you can drop BMEC with this series?

This series hides the configuration files (mbm_local_bytes_config and
mbm_total_bytes_config) required for BMEC when ABMC is enabled.

When the user switches back to "default" mode, BMEC becomes available
again. I believe it's a good approach to keep it this way.

> 
>>
>> /sys/fs/resctrl/mbm_L3_assignments: Interface to list or modify assignment states on each group.
>>
>> # Examples
>>
>> a. Check if ABMC support is available
>>         #mount -t resctrl resctrl /sys/fs/resctrl/
>>
>>         # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>>         [mbm_cntr_assign]
>>         default
>>
>>         ABMC feature is detected and it is enabled.
>>
>> b. Check how many ABMC counters are available.
>>
>>         # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>>         32
>>
>> c. Check how many ABMC counters are available in each domain.
>>
>>         # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
>>         0=30;1=30
>>
>> d. Check default counter configuration.
>>
>>         # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>         local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
>>         local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all
>>
>>         # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>>         local_reads, local_non_temporal_writes, local_reads_slow_memory
>>
>> e. Series adds a new interface file "mbm_L3_assignments" in each monitoring group
>>    to list and modify any group's monitoring states.
> 
> To confirm, would we have "mbm_<resource_name>_assignments" for each
> resource where MBM-ish events could be assigned?

This is a group-level property—it resides within each group and is not
related to any specific resource.

> 
>>
>>         The list is displayed in the following format:
>>
>>         <Event configuration>:<Domain id>=<Assignment type>
> 
> For soft-ABMC assignment, is there just a single event configuration
> representing all the events tracked by the RMID?


I’m not sure about the details of how soft-ABMC will be supported. It’s
not available at the moment, but I believe it can be added once soft-ABMC
support is in place.

> 
>>
>>         Event configuration: A valid event configuration listed in the
>>         /sys/fs/resctrl/info/L3_MON/counter_configs directory.
>>
>>         Domain ID: A valid domain ID number.
>>
>>         Assignment types:
>>
>>         _ : No event configuration assigned
>>
>>         e : Event configuration assigned in exclusive mode
>>
>>         To list the default group states:
>>         # cat /sys/fs/resctrl/mbm_L3_assignments
>>         mbm_total_bytes:0=e;1=e
>>         mbm_local_bytes:0=e;1=e
>>
>>         To unassign the configuration of mbm_total_bytes on domain 0:
>>         #echo "mbm_total_bytes:0=_" > mbm_L3_assignments
>>         #cat mbm_L3_assignments
>>         mbm_total_bytes:0=_;1=e
>>         mbm_local_bytes:0=e;1=e
>>
>>         To unassign the mbm_total_bytes configuration on all domains:
>>         $echo "mbm_total_bytes:*=_" > mbm_L3_assignments
>>         $cat mbm_L3_assignments
>>         mbm_total_bytes:0=_;1=_
>>         mbm_local_bytes:0=e;1=e
>>
>>         To assign the mbm_total_bytes configuration on all domains in exclusive mode:
>>         $echo "mbm_total_bytes:*=e" > mbm_L3_assignments
>>         $cat mbm_L3_assignments
>>         mbm_total_bytes:0=e;1=e
>>         mbm_local_bytes:0=e;1=e
>>
>> g. Read the events mbm_total_bytes and mbm_local_bytes of the default group.
>>    There is no change in reading the events with ABMC. If the event is unassigned
>>    when reading, then the read will come back as "Unassigned".
>>
>>         # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
>>         779247936
>>         # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
>>         765207488
>>
>> h. Check the default event configurations.
>>
>>         #cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>         local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
>>         local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all
>>
>>         #cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>>         local_reads, local_non_temporal_writes, local_reads_slow_memory
> 
> These look like the BMEC event names converted from camel case. Will
> event filter programming be portable?


Yes, that’s correct. The event types (reads, writes, etc.) supported by
both BMEC and ABMC are the same, so I’ve used generalized names here.

As for portability, I can’t comment, since I’m not familiar with how event
configuration is handled in MPAM or other architectures.

> 
> Thanks,
> -Peter
> 
> 
> [1] https://lore.kernel.org/lkml/b3babdac-da08-4dfd-9544-47db31d574f5@intel.com/

-- 
Thanks
Babu Moger
