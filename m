Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3C425B1D3;
	Tue, 20 May 2025 17:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763495; cv=fail; b=RpAX3qdEkszD+G0Czrgh7xZu1YSDdmprB3+x7kLMWmz3tWSDGb5Cpswht1Pr9Wk6H1JOGjBQ4wiibeN8uDvg1iiTFR6nG6QLyEKLWaOhR5nKgCdkx+dP62yPwVCY6AP0x31e0Ph4nBV11jMBNabqhEs8AzCEV90+66RCMPnwu1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763495; c=relaxed/simple;
	bh=Ii8/zjTgBeXk1W5F9WVDR4LhR9+2WjFAZ8vLcgQoef0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PUdITEga4g9HCmPigiqTLfSoYYB+gDFhBnByD1uQZsD/Z0+HEdJDz2fCx3AlmowaOfbPNxg+durrczDQkuvqahNJxrLCtay6kvZ52ZadkEZwpZk8g0wFOePo2KJ66PJGRxKhBR0v0wg9s3RfbO+rs0l6YcAgsWZiOldpCjBSfQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=asAqqcD0; arc=fail smtp.client-ip=40.107.223.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="asAqqcD0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H99jOfp+D3/U6Jzri5Qq+SIKyW2sKZUXQoo/cQZMAYuD8uOpDw4xQJn2jpiAwcqjMRaN2XPFl4xX3oZlBQk+nY4FJAAvWSXq/XZmKSvSmXWE/O2iK75xhIa0wd+Y/B4q0ZXl1R86qF6YnIUOsnZe5lqBzYaDKxc5EWTC6s0ADIiPQpMJIGlMHEY7g+bhpPtHtVe/KHuKpO69I379ov/Xc6ocQqVr3btJxXa8D49sR2TBM9Vjkqw08rLZcGD8LnB0beQcbCGHyQ1VSQ2SuKbyUhlwc7/ATAMqY7LsiLqpUvVtD//ff4BG3soMfCsONkARPoOtrNWz1k4GcPTQfWaGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOK53H76dqGoh9b4iLzKAbHn5PBbMa5Nv9IX1DMIXNI=;
 b=VlqhUMCUGHpXtBPSDjiYcRWr/t6fM+gm36U29nTprU3JsnX40HeczcCjeLdl0NHDHtpsobIw0i4hj09UJ8ZOWADuA3JHEMVsa/aarrm4vyVfs+yM+0BUaENSp8o+gjQfKNfgTzWqU0q/eL3ZSANeYqd7M1zJifUBjl9nJ6HJyQIJAqTvupSQYDmeQI3XJ4gZzihDt6N4G102lMHawiF0KOmwSOA3WK19DCqBw5y7vmbKrMh7VraUVCVfmb/Y9KTMzgdTjZhupup1D0Kl9GdxvIU8mll9iRniFu7jjCZpiI2Yw4v0LZfXeT01NXZxkwyCTaaN2YrVkCKrN5XlkpkP2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOK53H76dqGoh9b4iLzKAbHn5PBbMa5Nv9IX1DMIXNI=;
 b=asAqqcD0VRhMx5JmJ1ahpjr6tf+mXSMogOrrjkOqAWa9bT2nShmL02VM3DAvnJ7hphF5WPrXZxH6GOK0x6uLdvuZUnDP2zTGBiUavCrwhkm4AxNz4VNt/PrZN0hDsee1yyt3XOd/yPnC+lCXmw6ezIPTZr6XCOnt3IyF44tgwjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY8PR12MB8364.namprd12.prod.outlook.com (2603:10b6:930:7f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 17:51:30 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Tue, 20 May 2025
 17:51:29 +0000
Message-ID: <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
Date: Tue, 20 May 2025 12:51:25 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Reinette Chatre <reinette.chatre@intel.com>,
 Peter Newman <peternewman@google.com>
Cc: corbet@lwn.net, tony.luck@intel.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
 x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
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
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
 <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR16CA0058.namprd16.prod.outlook.com
 (2603:10b6:907:1::35) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY8PR12MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a4de12-b8e8-4e41-3ab1-08dd97c6f336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEM3SFphN2hyUmZSTVJSUkFKdzdKVytheURJb0E4RkY4cHo5NXI1T1I5dytG?=
 =?utf-8?B?UkcrbEVmQWJKVkYvQ2h0SUFIRGlnVXRuQm5kc3FnVXVxeHF0MWNyM3ZBSmIx?=
 =?utf-8?B?a0h2MkJIT3VZclpId28vb3BnTGtyQkRXNHVTNkdMY2cra0VBVDVhUWNEMm5Y?=
 =?utf-8?B?NlhlTUMvZFZBN3N0bjN5RFBmVUI0U25JVVVpdmZ4djRURGdBOEk3SW5WK1RV?=
 =?utf-8?B?SEw2QTlyNlJ5dEtxVi83VzVPM1kzbkF3WUp3UmxnNmR3R1VWamU5UGg0ckIx?=
 =?utf-8?B?YXNuV2xvb2Q1NE5zRllLdGRCTTJESnFtZkVmSS95OWI0SEhNWU5BKzB1SHRj?=
 =?utf-8?B?UTNZNjVyaDZTaDB6N0sySmZWYWtYWTQrOEtseGpNS3A5TngzUXo1cHJBNFVu?=
 =?utf-8?B?RlpWZnpJOGxya2s2QXVjT3RwdURwbE0wVGt1THFXSzFhNHRJU0pFRVJ0WVZh?=
 =?utf-8?B?U0tDQ0hWMlVkNXk5SjQ1UzM2eEZnVkt2bWc5YzZ5SDNSaG5wYkhrVm15RTdK?=
 =?utf-8?B?Nzh2cjdrb1JkSnBlNWdvUFJMU0VySk5Kd1hMa3phdXVCYXBRaWxzR2NhUFJn?=
 =?utf-8?B?RnZFL0VXV0d2RXhrK0t0WXNERnJUc2Zid3pVMENoYXZudmIyR25nUHh3Zll2?=
 =?utf-8?B?anB6RHEzK2I5NHN3V1VURkl1NUMrRXhPRUdlQStzZEZUQ2tXUmlOTGo0dEJS?=
 =?utf-8?B?WG45RHE1OG1EZTV6czFYeUV1MGhUaTJFL1lheCt1SVRIOTcrSHhvWGlJdWVP?=
 =?utf-8?B?d2REQXBsZjk3TENYN3ZuZVU0OUNvYUF3SEdJT3I4U2xtVm5XajBpUDIzaFRU?=
 =?utf-8?B?QUhITnRvcGVuT3ZwSjkyZ2NESXVvMGJZT3ErYlRNMFRYVjVJajdBaThhUThm?=
 =?utf-8?B?cmR3dmNDYkhWV2xFamRqR1hvenM3U3paczZTeVpYbzhicDhQeXd1VEdzWTFX?=
 =?utf-8?B?L01vY2hWYzJGZnNnVHFJczYzWnNhRWJhV3pJdUZUT09lMHhwTGlZT3JBd05B?=
 =?utf-8?B?OHZuS2ozb2JKSzlyY3ZvczExd2N1R0JvNlpzM3pWVkhrOGtTZmNZYlc3R041?=
 =?utf-8?B?ekNUMHJYSFN5d1IwUjBydGppUG5lSHFlNDN3ZUxlbDMyd0ZvSGhLeDFGaS9I?=
 =?utf-8?B?ak9EUVRpTHg4RGNocC9CZm96L2IvU3JXY3llVmJaRG5naXRTNHN5eGpVanNr?=
 =?utf-8?B?QTBPM2UzWkhIMUlWTG80ZDAyR0hOdkt2bTU0T0FsaURyNUx1WnN5eDdmUWcr?=
 =?utf-8?B?UU1ZMVFlMmhkZEduU3l6d0tRZHRuck1RTTNVeXkrL1Q4NWYxekRUbUF2bDZO?=
 =?utf-8?B?Q0NacFMxT2trRi9SRUVjaXRQbDFPVE1QOFNPelJGRG54VTNKMzNOYUZBdk94?=
 =?utf-8?B?VnU0RFpJU3QyaEVmZVhoNTVUbmxobGRvRFJxWDhqYlNOeVhjZmdaSFEwV2hK?=
 =?utf-8?B?SjRVZytRWlcwRUNUTVJoQW9GUkdoQ2UxcWtVSVZZMkVUU05KcHpUYVZsWVRO?=
 =?utf-8?B?RXBDUHY3T280U3ZRM2VMUXhzeXBnWU9GRXFVdlRuZzlXQXRxM0QxTEgwUkR1?=
 =?utf-8?B?RElkK2F1b2RTTDkxckJrRUtnSU1PMG40UGhMMDdBcWJQVFMzYlUwT1RHY0VE?=
 =?utf-8?B?MzhsWmhXVU1udm8wRTBYSzFIcnE4SVFvUFN3MCtydWRsYmxmVktlU1h1RndP?=
 =?utf-8?B?TU1qMnhITjUzNTZlVWRDVTFsTEsza2x3THcxa1gwWDlBSDczdUp2OWoxaTZn?=
 =?utf-8?B?ODN6QjVlRldWRXAxMnY0QndYVUFCRTVjamtVcm16UDVJWVIyZno0bFBRVDM1?=
 =?utf-8?B?YjZxcWtjcjQyV0JNZHN3OG9uOXFUYWJqMmg5eVlSNEFHZElESnMrL0cvMjNn?=
 =?utf-8?Q?3YxzGebmETw9J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UisrUlRWUHNFZjU5blZvRnpjLzZGaTNLWlFDWWRXa3o4OERXbVo2VWl4Y2Fr?=
 =?utf-8?B?TUQ2dXZVaWRjVjl1Q25LMklIMU1jcGRMOW1NOGQ5OWFXQjFFdGFtUlM2MUhN?=
 =?utf-8?B?ZlFYWXVpbXpKWjhBZXVJd0dnOWlBTjRXRFd5U0U4WXF5QTNlVFFjMlZGRWIz?=
 =?utf-8?B?VmQwb1lmSjhqQkFsTE56M1Z4T0dQZWxBR0I4UUkwcHhOV2M5OVZzbmVvMTYy?=
 =?utf-8?B?WFFsVEFuRmhzdWloZkNGR0I3WUI3MFFkcUlBS0p6RGtwNTg4aVdGWGNmYzlv?=
 =?utf-8?B?OER5TDlaR0RuK0taeHpGOXA3bVp6WjJESEhYQkJ6SGZDLzVxZG5QTjAvaTQy?=
 =?utf-8?B?Z01MRlh1Rld2elptZWdIMEdwMXU0ajdsZVpUOGg1d3l3amxNQ05PWER5aElY?=
 =?utf-8?B?MDhLR2kwSEJ1eVRZd0x2Zm5NMVRRTXRWTFpZS0hYMjNyYzNxQ3VWWm5PbjFD?=
 =?utf-8?B?RXJvTDE1bVJKQnhNT0tFMXl1MjNCL2hCUElNMEc3VXFVTG8wcjhsSGE0L3hI?=
 =?utf-8?B?U1E3TGtkYUFOaU5XV3g3TTl3S3ZIOGNNcDJlZWFMVGhURW1GKzdDVHBrakhi?=
 =?utf-8?B?RjVNR1VVQ3d5VHA0RmlDdmRlZjVNbE9RbEp3alRJOWp6Mmp0QlZ0blhpdmlD?=
 =?utf-8?B?dCtMZFdtRll3OW9EYTRhTG44cWlMcXZaY3RQS01OT1h3NHRQRWt3RXA5VVhC?=
 =?utf-8?B?VmlRTFJ2Z09qMENqUEZxZnhDclNla1Zmd1VrOFNrT3JGNUs5dGZCNjhLZmR4?=
 =?utf-8?B?TTJKTmsvbFBROUdpQlBhQmtQaVNaMTRpNnJUdHZFTThhbXpocDR3eFVyY25U?=
 =?utf-8?B?WFFmYTgvVEtHUDZ0Yy9PWVZOUERmY1J1YTBoeUtUc1REU2FsZmpnZU5GOWR4?=
 =?utf-8?B?cDNUZ0VqQzl6dUU1UUQ0enM1MU1DaVFpU0JBVVdEMEpLUzdGMmE4aEFVT0ky?=
 =?utf-8?B?VGQ4VXNlS2QveC9DWGFodmxrRmI1SGhnVDJUK3hLaCs2ZytNekFNdzJJSHAz?=
 =?utf-8?B?eHFaRm5pb0JhRTJ0U1NZb3FMdEl6Q2g5Mm00emNrRFV2ZCtDaExhZk5qTzI2?=
 =?utf-8?B?TCt3eUJJODJvNUIxTG5SemJqSHZoN2UrTEFka2t0VXZ1M3MxZS80YXBCUUJQ?=
 =?utf-8?B?L3FTRmRXZjZFYWkxQTQ5RndJQ1pGMlAxa3AzTDNlWlplcE9iWFVDNkhEN2tX?=
 =?utf-8?B?REFYNFhSOVJJUXpDVll6dlYrUUpabTJIaU12NzZHR3JXR3k5RnZEckpkMWVQ?=
 =?utf-8?B?V3dHVjBPWjVjYnBzSHB4V3o2K0lXK3FDZzkya0xFNE1CNHlOb0U5aDl1ZkJ3?=
 =?utf-8?B?akFIWndoRjN5a3NiUGhETjRBWWZzUlBZUlVtYnhidmhYNlNmK0l3dE5lRGE0?=
 =?utf-8?B?TzNHRENsN1FnNDU1UzRmRDlxUytxQjNFMWcyaitiRHJrRU8yVFNZMW5rVk5C?=
 =?utf-8?B?NFp3VzBub0k1WVN2UjhieTVWZmNCeTVxOTVKTmFtZmpyRGtEeUtKSllnTVBM?=
 =?utf-8?B?L0xZT0VOa2VHUnF0aXo5V0FBYVNyeWw4aHpFQXErQzdnK2N6Nm9TYkU4N0Jz?=
 =?utf-8?B?M1VtK1h0UHlWSzZiVUxXNkhBZWVQMlpVU2pZbVRNak5vZ1MxUVRiMzdxeVNp?=
 =?utf-8?B?dTBEbTVyREhOYmVTc2xySm5YMWZWVmMzZ1J5R0JINE9acngyYXZxS3RmZFdS?=
 =?utf-8?B?THNsbVJ2UG8wdHIzTHRYTUQ5L1JPSE53M2haOS9BTFVkVk9kdDA0ME56VWZz?=
 =?utf-8?B?Qmxxc3hheVlQMU5WSjVKZDdDazlUZXJULzRqU1FKYVZETGFYWkF2M2lTdWIy?=
 =?utf-8?B?Njd1UURBVVpzWUdhMGhKa05FUEpwek9ZTGdRK0pLVFVXRXJDZHBvYnZWaXgz?=
 =?utf-8?B?TGM1YlB6a09uM04xb05qMjd0c2NSSlZIeDJROUJwS3l4ZG5RRDkvYzFwdFZs?=
 =?utf-8?B?b21wbksvNHdxVTEyb3V6RmhGNG9PdnNrMm12VEpKdnk3OEk4WFRmdnlUUWZ3?=
 =?utf-8?B?WTBleW1UakdkamZOcm9YUVk3WVNLR0FEVkE2RkJLSlNxQkIrbnVaTWphYWVt?=
 =?utf-8?B?dHJwQzNJci9Xb3FCbjBjR2NOTzhqc2RpZFZRZ0VNd3BvV3dYWjFqeWZsL2Vq?=
 =?utf-8?Q?XxQY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a4de12-b8e8-4e41-3ab1-08dd97c6f336
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 17:51:29.7695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5ewyfqQWtXwycJ7qv9CUb5qLYQD1QkNHu6rYMTQEEh4KH0pSa7FjZzIyn+yU0ia
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8364

Hi Reinette,

On 5/20/25 11:06, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/20/25 8:28 AM, Moger, Babu wrote:
>> On 5/19/25 10:59, Peter Newman wrote:
>>> On Fri, May 16, 2025 at 12:52 AM Babu Moger <babu.moger@amd.com> wrote:
> 
> ...
> 
>>>> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: Reports the number of monitoring
>>>> counters available for assignment.
>>>
>>> Earlier I discussed with Reinette[1] what num_mbm_cntrs should
>>> represent in a "soft-ABMC" implementation where assignment is
>>> implemented by assigning an RMID, which would result in all events
>>> being assigned at once.
>>>
>>> My main concern is how many "counters" you can assign by assigning
>>> RMIDs. I recall Reinette proposed reporting the number of groups which
>>> can be assigned separately from counters which can be assigned.
>>
>> More context may be needed here. Currently, num_mbm_cntrs indicates the
>> number of counters available per domain, which is 32.
>>
>> At the moment, we can assign 2 counters to each group, meaning each RMID
>> can be associated with 2 hardware counters. In theory, it's possible to
>> assign all 32 hardware counters to a group—allowing one RMID to be linked
>> with up to 32 counters. However, we currently lack the interface to
>> support that level of assignment.
>>
>> For now, the plan is to support basic assignment and expand functionality
>> later once we have the necessary data structure and requirements.
> 
> Looks like some requirements did not make it into this implementation.
> Do you recall the discussion that resulted in you writing [2]? Looks like
> there is a question to Peter in there on how to determine how many "counters"
> are available in soft-ABMC. I interpreted [3] at that time to mean that this
> information would be available in a future AMD publication.

We already have a method to determine the number of counters in soft-ABMC
mode, which Peter has addressed [4].

[4]
https://lore.kernel.org/lkml/20250203132642.2746754-1-peternewman@google.com/

This appears to be more of a workaround, and I doubt it will be included
in any official AMD documentation. Additionally, the long-term direction
is moving towards ABMC.

I don’t believe this workaround needs to be part of the current series. It
can be added later when soft-ABMC is implemented.

> 
> Reinette
> 
> [2] https://lore.kernel.org/lkml/afb99efe-0de2-f7ad-d0b8-f2a0ea998efd@amd.com/ 
> [3] https://lore.kernel.org/lkml/CALPaoCg3KpF94g2MEmfP_Ro2mQZYFA8sKVkmb+7isotKNgdY9A@mail.gmail.com/

-- 
Thanks
Babu Moger
