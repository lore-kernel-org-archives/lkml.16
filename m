Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369E3647;
	Thu, 29 May 2025 19:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748548479; cv=fail; b=WqlEAZmH3nlOuiLw3hQ4ea6NIO0fBX+/l388znObkc0tPMs1cjyCQNBZqilBuGgXZTHPguDQd5HsQS6BLg6bmozLYiQ3REEgjDeOTbFTR1YDBrEMJg6QaB1gEvWEQIvIHWLTHyki0523qGzzuSDKhLas+Rh9f5yQHf+O2jpVrnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748548479; c=relaxed/simple;
	bh=2OKOs8d6IawkPXTBqSJOMNFzJm0kmVQAQwtBuGiG+Ts=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sz3TLOWZMWyoHeyuoNo5+FVQgxvrfWI54wawH/RBaaqbBvzfCiJdafegRszH4NGXcUMM1ozJjr4MEjLwtB1zqc9gkpIxO5IHLyY1V6dIDqJZO6bqnVIFR1h+Zeiimb2Laq8FT6mDKes6OCy1Xd/Gb1367IyNd4avTEggnzWwufc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XbxLwjx3; arc=fail smtp.client-ip=40.107.236.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XbxLwjx3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOW91olFmUpAeNuws+du/eBI7W1VVTU9hPZxSnv/G9F+loOllkl4ZvarQL1AYTFK5/LxTg6zp1pmU3gZvZA12eyknEdo+Gz3o+xHafGjRpyYJt+LeeovENM0gVP0YiObC6kr734zjnol6kTu7JvPZS2cicat3vA1paIFCKYqEC5r7WHLWep9fByq9kdxlKekB9ZSeIs8NnVhPuMzo/lY/3INlpAxi8f4Epg9ygGl/F0BYG2PF5Ng0dx/PV31vorhuz2ckBnHmc2DtiPH7HAqNZPwimESYF+CCCVQyyXrOPgl9KhUJtO1WlDPV+prJwO/5jw4iyBcO6M5aLxaRrzbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bs+68a7QQZ4HlmRmWdSm7lPZcjKbju9sHx04nVqUIns=;
 b=y1LdcH//pGkKnucMT3Dwa9Fhr1y2FnPS4AxvknxDncAjPE1sKnoaIFR9VWkNp5+z9s0Ak2r/Kq7Xajh/7mPR4qhxEo7cVdUZvIaBaOY4EGxkpebQnatJ086rpWjWZVirRJB8CeydKxKPb+Mxlw8fkHu3PAPaRDxuao6plVPbFmPMNgn3GXeYg9ZrtLwju26PHfeSG1J8LNmdrSC2/V88Q+cNZj6YC98tumlZWE6hgRkqlTf0EKyPuQwzF8MlqhTL2DoV+EfrMNMsrn1ux9fDZd0INXBYpmr7+kYZnY8+v12g16+qo6vRPKiAbHe6amu5KgquXRGQHY+OUTlYVWaQ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bs+68a7QQZ4HlmRmWdSm7lPZcjKbju9sHx04nVqUIns=;
 b=XbxLwjx33mx6XPEcpqxKXOr6p6HJ4VFJkPAsXiilJymlqlOXCNoUQAaNMiBIR5toRNn21Z2ktCgBdphAEveBXxcuGipUgrzkZiw7DnPHAT06R4Mj/53LAjmFTKpSLqKGw5x2VtUng/eMoua/IhxCi/+k7QysTODFvoEWYV8fRJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BY5PR12MB4113.namprd12.prod.outlook.com (2603:10b6:a03:207::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Thu, 29 May
 2025 19:54:33 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Thu, 29 May 2025
 19:54:33 +0000
Message-ID: <5351d9c5-5b1d-4ae5-80fc-2a3ee7af6f11@amd.com>
Date: Thu, 29 May 2025 14:54:27 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 19/27] x86/resctrl: Add event configuration directory
 under info/L3_MON/
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
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
 peternewman@google.com, maciej.wieczor-retman@intel.com, eranian@google.com,
 Xiaojian.Du@amd.com, gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <3e7ae289622f9ff019604f2e7b78de33924c2a65.1747349530.git.babu.moger@amd.com>
 <d3105a62-e5e3-4f38-884b-5130fde38d83@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <d3105a62-e5e3-4f38-884b-5130fde38d83@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::26) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BY5PR12MB4113:EE_
X-MS-Office365-Filtering-Correlation-Id: f8be5c4d-8939-4b0d-b409-08dd9eeaa179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjZKU0dpZXNsVjhwVE1MWS9yMFNSZC83M2NmaGlOTGhnZCtScDUvREhrazAz?=
 =?utf-8?B?SmpUNnlWeGd3R2dQNzdTc0hTczlMOGlOMmh3a0F6UmVIbjFQTUdmMWJlNjdU?=
 =?utf-8?B?MllXRTlNbHhLUzhNa2ZuTEVncWlwejI2NmlWWkRaWGNIaUwrZ2VqRjV0LzRw?=
 =?utf-8?B?WDR2aUNzNmVVMHlaNml0elVrdFZTeFhjVGVKaWNEalB0R2g4MlJOZ3BXQmFH?=
 =?utf-8?B?K0JMem5uWjIvS2trbGFESVdCcmdWNHVsY0VlUUNBbUpldmFNb0tjNndGOGNx?=
 =?utf-8?B?MHJoR3BpbG5HdUdrSFpzK0pjQUoreU9RdjhiSmMxeHVQdExiMGp6LzFPa2ox?=
 =?utf-8?B?eEhtTFZYTjg5SHdpdUU1cjZDNE0xRnpNZDlGVHlRaUFGcHRMSFRMQm9PRU1w?=
 =?utf-8?B?MjNRT2hkZGdUaVNCTGQxNVM3b1FGRGZMTFB2Qm03Y3diUDFWMWEvRDRnR2xm?=
 =?utf-8?B?MGhMVEhTdGw2MEhidk14dFRTNWozcjdkbGhxbmFXU0kyRDFvai9yUGsxcmcy?=
 =?utf-8?B?Q1NjMFlUeHJBYzYveEhsM0lVTm1DVzU5WGRaYkIycG1MYTJ5UjEwM2ZlZUQz?=
 =?utf-8?B?NEZDdDFnV2MreUNkYWhydDNqeUlNT0I3Z2MyT1l1TFFLcnZjSWE1SWRObmpP?=
 =?utf-8?B?UzA5MU1EbStBNkxFbVBQNzdubDBTQ0dhUVZKcFoveUFjU1lySU9XZkJBNmlw?=
 =?utf-8?B?a3c1ZlhzOHB3OUhEemdhOVdvcDVEQ0hFN0tWMHJteDZzZitIRW9XQ3NSMTk4?=
 =?utf-8?B?YzNldk42eDRxRWk0MTh4ajNDTllVMnJDS0g4UTRIMit2V25mclAxY1k3U1E5?=
 =?utf-8?B?QmtGY3phdi9jNkh1emZxak8vNGl1akdjTlEyMnBZWkNCakxrUm96dVcyMjVB?=
 =?utf-8?B?S3dTcjVEeVhSNXAzUm9HZjBydCt6eG9UNzIxc2NITTZHcGFPRnUyMEJwY3R4?=
 =?utf-8?B?UkR4WlFFMWVrWGF3dy9mQWFTVzVTUmhSUTZIQnMxYlFHTVpmVkpGQ0lUcmp3?=
 =?utf-8?B?NDBBcEZiZm02QXZEczF4MnEyMjMyanE4bFJyZm95dm9RQVhwY3g3a2pvTExw?=
 =?utf-8?B?eUdxRjE5WFJnYmx5dStOcG0zVm5ySUpjY2JJWC9OUzlpeXdJcGVxYVlWZjUy?=
 =?utf-8?B?amxvRDFCOUVPS2luaHlXQ1E3R0xDb2FWNVZkbk41b29aRmxrZklrbnZvSU9a?=
 =?utf-8?B?R0dobTNUUnlWNmsvZDYwbFI3YXV6YmV1ZlpyUVFCaTIyYlR4V3pGZzduRXV1?=
 =?utf-8?B?bU56MjhFa0E2TnRUQUtINVR4Rjh1Rng4cENwdGVrL01LZll0MDJ3M1ZYN3NW?=
 =?utf-8?B?bHN1UU5vK29zVTJZcjEwSFhHOTFkRTdWcG4ybmNmdWU5V2VQRmIrVXgxelFv?=
 =?utf-8?B?OWc1bXg5VVE3bldkaEdqaWs0QUEvQkVUZkZZa2ZjRTZJODZGSkdwU0RHU0VJ?=
 =?utf-8?B?SHZjMkwya05iUkZpU2VFZ3pJcmVDMHByQ2ppbG1pZXlNdUJja2FvVGZFTHNa?=
 =?utf-8?B?b1Nja2FUdmxvUXQrUGdrN3M0UHcvVFRoS2lrVnEwdnJOQzhGdUhZODgrcE9H?=
 =?utf-8?B?b2VVcGF6akdrSHF0MkYvSzU3dmk1VXNOUnBqQU5wYVNUVlAxZ3F2My9IOHVY?=
 =?utf-8?B?aVk1TmxkVFNLejFycmtRZzQ1a2UzZEJKRlRBN2cwazdxN0N3em8xVUV6aWxn?=
 =?utf-8?B?b08vVElaWGdHKzBIckIrUVQxUzl5aVRscVlFQkhkenpGSVNIZUxUb3NrbVdT?=
 =?utf-8?B?aHFtZURJbTVKb1prSmlVZm5MTjJXdS9sRXFyWllaWGpDMXRUaHc4ZUU0R0lV?=
 =?utf-8?B?bmpNdVZBV0xtVEcrL05KV2NKU2crK2gwT0tKTmp5ZlFSMVYzaTcvS09qRlpK?=
 =?utf-8?B?U1FCOThjZjBNNVNsck42Vmg1WXl2aE1PMjhRNjBHK3RDRlBNcFhDakNjVDAv?=
 =?utf-8?Q?lnrVcHUzoTo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU9BV1BORHNYaU5jdEM1OTJxcXFjcVBIY25MVjZ5azFZaVMwaWd2OHE0Rlgv?=
 =?utf-8?B?YXVQaGYwNFRzcU5iQzBwaEJ3U0FaSUJ1dTNXNlpMTm1yaThKMmpCVEN4bExv?=
 =?utf-8?B?SUV6bnZsU1JUaHhQZXk5VGw4emR5bjlIOEZVOEVFMGdhSk8yUnlkZmJzRjhh?=
 =?utf-8?B?R1VlRmRuWEZvRWtqMXdZVDRlbm9jOFBSelY2L3J1T0Z1VVpXSTJvSjRGM0I0?=
 =?utf-8?B?T1kxaXZLQ0ZyWXlEdU1HTUNQOENZU3BBV1hVV09RQVFaaU9WTDBNWkF4bGVW?=
 =?utf-8?B?aWlXMXFWdzFXVHU0STYybGRySUdzSEs2c3BIaG0yNjNBOFZhZm5YeDA1cHhT?=
 =?utf-8?B?QkM2RWF3NUlGWGF4UUhhR3Y0bTlVcGxhUDA1VnVrRUJlNkJpZ1N0TWE2UXgr?=
 =?utf-8?B?OHMvdGpWbHVZWWtLZTcvdndvenM1YWphSklNRFhNcHhCT0Z3WG81Nk82Z1pr?=
 =?utf-8?B?Wllibk1TWi9ScG92ZXQ0dWJkenhsUHpzL3Qwd3RGdUtTVHdFVWxnNlE2TFFV?=
 =?utf-8?B?TEt3ZnN3RUxocnVxQ1BJdmFDa1N4OENQTG1qczJBMmw5TlZwcmpNZCtaVnQ2?=
 =?utf-8?B?cERCbFJPNG5VQzJIdXZpbHh2UklMcVlsOVZ4TDN3dEFzdXZIRHZIT2dwWmUz?=
 =?utf-8?B?Ry9GRDcvWnhWa2haQVVWdW42TlBvV3B3b29WRGJqRjRyWUpZNitBZ1ZTcjd3?=
 =?utf-8?B?aUZIeXJVUy8wT1RINGdOZ3o0RDNpcm93OTgxdnZZWitBbFAxNEFod0hMaHdC?=
 =?utf-8?B?OWpLai85SEdMM3I3MVB6S0hWdjlYZmpjYXhxblpRQjFzbjgyUy9vbHVTenVU?=
 =?utf-8?B?YnhNQlgrVE9yTGVmSkpBeEtZUDRmTW4wVzRxaU5VSFYzY3BCalNadGltN0xw?=
 =?utf-8?B?cDRHZkdEZHkxYWxDY09Dc0N6WmN5cm5IMGQzNWk0MmRKYlFXVk4xU3pSVkVO?=
 =?utf-8?B?WklLb2FLb0I5cnQ1MGJTMy9Kak0xYWpMRkNrbE9xKzFQNGJoMEpWYXg3ODRx?=
 =?utf-8?B?dnZDSkFxbm96TVlUN0c3bWVkUUY4Z2paM3NhVUFpUDErOTMzQjV0TzJpUlIr?=
 =?utf-8?B?U1JobUJwdWNzNWxRUHIxcUw0a1RSSUl1MEtIUjExRGxqU3ZFNmdkU3RmZG1j?=
 =?utf-8?B?YXg0blVEbmhLajRhK2I5c0QwUmRxeWZYWkY1MGFyc045dXV5WTZrajl4MnpH?=
 =?utf-8?B?QVN1cy92NVZGSU14c0tiRXFDUnRmOTYrZHgrcFZuZEZTRDBFK25MeTdOdXh3?=
 =?utf-8?B?NEJ4OHVKa2M0LzV3Rlk5Z2JocEkvOXdGQTFaUmxsNTF0OXRZUTkxTVVlc3hM?=
 =?utf-8?B?cHRya3FTcHl1NTJBRXFIc0JUb0ZJNDZZdGRXTkxoaThwTEg2YWU1MXRRZ1NL?=
 =?utf-8?B?VzV0SURqUzZ0dndQMzk0VHU4YnJhTFlxZHlEbDhidE5NZm10MlQ3Tkx3c3FJ?=
 =?utf-8?B?QTRaQ1JtbzBKWHFiVmVCb05jekVaRkx1ZHBNZzY5NCtNS25qdDBzTWJ4WUlU?=
 =?utf-8?B?T01acE9UZFgyVFNhdHJIODU4OHVWejN0bkdxUXc0ZWR5Q2pNN0tuZDloYUE0?=
 =?utf-8?B?MHJDMnRmRlVvc3J5N29pVnQ5dDh1Y09xVXFuVDU5YUY1QXBkNjNmY1VZS3dW?=
 =?utf-8?B?SXF3RzI3SG9wREVnNnF2em5GZ3h5TVdOUlRsM0NxRTQwQkkyeCsxenRnTnZk?=
 =?utf-8?B?bTJQVmNkWnhZZ2lSRldWdU1ZbTZYN3JBK2hKWWZLMitRejNSMlpOWlVHUnpK?=
 =?utf-8?B?cmZ3TXMwdjFzalFLSzdpNzErdGpWR1UvMGtCeDN0dkRDZFFxbG9IalVSWUFl?=
 =?utf-8?B?WGhZaDV3b2Y5TW1ZQWgrNFdzRmprTC9nbnBnZlpIN0hEREZXekVJSExrdXdm?=
 =?utf-8?B?M3BiT0ovb1NHUjdrSmd1OXRPR2x3Zy9UUllUMCtsdEUwNUUrL0NybUF1V1Nv?=
 =?utf-8?B?Q1dYL0x5NEFndUhHSmt3Ly9CUzhORE1xclNOdDlxU3p0RWt2MklZODZwRnF0?=
 =?utf-8?B?K2xHYTI5cDdQWkkvZnRhc2RlWnBxTzRyY1hpTnljbWp6UTlaU2pjb01reHJV?=
 =?utf-8?B?NjdHNEkzaU5kMjBZSXlsdi81bnBRZXhJQ040cVZySzBJVlBqVWxveWg0L1g5?=
 =?utf-8?Q?G/j8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8be5c4d-8939-4b0d-b409-08dd9eeaa179
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 19:54:33.0087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWmhkc56eH4TPr/fFPoegzinwd9B+bedH2e2JYcOJdFlUc2N8bw9oyVSYlT31Hrg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4113

Hi Reinette,

On 5/22/25 23:43, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:52 PM, Babu Moger wrote:
>> Create the configuration directory and files for mbm_cntr_assign mode.
>> These configurations will be used to assign MBM events in mbm_cntr_assign
>> mode, with two default configurations created upon mounting.
> 
> This just jumps in with what the patch does. Requirements for proper changelog
> should be familiar by now. The changelog *always* starts with a context.
> 
> Sample:
> 
> "When assignable counters are supported the
> /sys/fs/resctrl/info/L3_MON/event_configs directory contains a sub-directory
> for each MBM event that can be assigned to a counter. The MBM event
> sub-directory contains a file named "event_filter" that is used to
> view and modify which memory transactions the MBM event is configured with.
> 
> Create the /sys/fs/resctrl/info/L3_MON/event_configs directory on resctrl
> mount and pre-populate it with directories for the two existing MBM events:
> mbm_total_bytes and mbm_local_bytes. Create the "event_filter" file within
> each MBM event directory with the needed *show() that displays the memory
> transactions with which the MBM event is configured."
> 

Looks good. Thanks. The directory name will be "event_configs". Will
change it in the code as well.

>>
>> Example:
>> $ cd /sys/fs/resctrl/
>> $ cat info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>   local_reads, remote_reads, local_non_temporal_writes,
>>   remote_non_temporal_writes, local_reads_slow_memory,
>>   remote_reads_slow_memory, dirty_victim_writes_all
>>
>> $ cat info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>>   local_reads, local_non_temporal_writes, local_reads_slow_memory
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v13: Updated user doc (resctrl.rst).
>>      Changed the name of the function resctrl_mkdir_info_configs to
>>      resctrl_mkdir_counter_configs().
>>      Replaced seq_puts() with seq_putc() where applicable.
>>      Removed RFTYPE_MON_CONFIG definition. Not required.
>>      Changed the name of the flag RFTYPE_CONFIG to RFTYPE_ASSIGN_CONFIG.
>>      Reinette suggested RFTYPE_MBM_EVENT_CONFIG but RFTYPE_ASSIGN_CONFIG
>>      seemed shorter and pricise.
>>      The configuration is created using evt_list.
>>      Resolved conflicts caused by the recent FS/ARCH code restructure.
>>      The monitor.c/rdtgroup.c files have been split between the FS and ARCH directories.
>>
>> v12: New patch to hold the MBM event configurations for mbm_cntr_assign mode.
>> ---
>>  Documentation/filesystems/resctrl.rst | 30 ++++++++++
>>  fs/resctrl/internal.h                 |  2 +
>>  fs/resctrl/monitor.c                  |  1 +
>>  fs/resctrl/rdtgroup.c                 | 80 +++++++++++++++++++++++++++
>>  4 files changed, 113 insertions(+)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index 5cf2d742f04c..4eb9f007ba3d 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -306,6 +306,36 @@ with the following files:
>>  	  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
>>  	  0=30;1=30
>>  
>> +"counter_configs":
>> +	When the "mbm_cntr_assign" mode is supported, a dedicated directory is created
>> +	under the "L3_MON" directory to store configuration files.
> 
> ? it does not contain files but directories for each event, no?
> 
> It will help if the text is specific. For example,
> 	"event_configs":
> 	Directory that exists when mbm_cntr_evt_assign is supported. Contains sub-directory
> 	for each MBM event that can be assigned to a counter. Each MBM event
> 	sub-directory ...

Sounds good.


> 
>> +
>> +	These files contain the list of configurable events. There are two default
> 
> So confusing ... terminology is all over the place. Which files are even talked about here?
> "configurable events" ... are these the memory transactions or MBM events? 

Should be "memory trasactions"

> 
>> +	configurations: mbm_local_bytes and mbm_total_bytes.
> 
> "two default configurations"? These are not "configurations" but "events", no?

Sure. Should be "two default events"

> 
>> +
>> +	Following types of events are supported:
> 
> events -> memory transactions?

Sure.

> 
> I am unable to parse the above.

The following are the types of memory transactions that an MBM event can
be configured with:

> 
> 
>> +
>> +	==== ========================= ============================================================
>> +	Bits Name   		         Description
>> +	==== ========================= ============================================================
>> +	6    dirty_victim_writes_all     Dirty Victims from the QOS domain to all types of memory
>> +	5    remote_reads_slow_memory    Reads to slow memory in the non-local NUMA domain
>> +	4    local_reads_slow_memory     Reads to slow memory in the local NUMA domain
>> +	3    remote_non_temporal_writes  Non-temporal writes to non-local NUMA domain
>> +	2    local_non_temporal_writes   Non-temporal writes to local NUMA domain
>> +	1    remote_reads                Reads to memory in the non-local NUMA domain
>> +	0    local_reads                 Reads to memory in the local NUMA domain
>> +	==== ========================= ==========================================================
> 
> Why does user need to know the bit position used to represent the memory transaction?

Not required. Will remove it.

> 
>> +
>> +	For example::
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>> +	  local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
>> +	  local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>> +	  local_reads, local_non_temporal_writes, local_reads_slow_memory
>> +
>>  "max_threshold_occupancy":
>>  		Read/write file provides the largest value (in
>>  		bytes) at which a previously used LLC_occupancy
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 019d00bf5adf..446cc9cc61df 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -238,6 +238,8 @@ struct mbm_evt_value {
>>  
>>  #define RFTYPE_DEBUG			BIT(10)
>>  
>> +#define RFTYPE_ASSIGN_CONFIG		BIT(11)
>> +
>>  #define RFTYPE_CTRL_INFO		(RFTYPE_INFO | RFTYPE_CTRL)
>>  
>>  #define RFTYPE_MON_INFO			(RFTYPE_INFO | RFTYPE_MON)
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 72f3dfb5b903..1f72249a5c93 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -932,6 +932,7 @@ int resctrl_mon_resource_init(void)
>>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>>  		resctrl_file_fflags_init("available_mbm_cntrs",
>>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>> +		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
>>  	}
>>  
>>  	return 0;
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index b109e91096b0..cf84e3a382ac 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1911,6 +1911,25 @@ static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
>>  	return ret;
>>  }
>>  
>> +static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq, void *v)
>> +{
>> +	struct mon_evt *mevt = rdt_kn_parent_priv(of->kn);
>> +	bool sep = false;
>> +	int i;
>> +
>> +	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
>> +		if (mevt->evt_cfg & mbm_evt_values[i].evt_val) {
> 
> Still no idea where mevt->evt_cfg comes from. Patch ordering issue?

Yes.
Need to introduce evt_cfg member and also need to initialize the default
values during the init. Will order it correctly to make little bit clear.


> 
>> +			if (sep)
>> +				seq_putc(seq, ',');
>> +			seq_printf(seq, "%s", mbm_evt_values[i].evt_name);
>> +			sep = true;
>> +		}
>> +	}
>> +	seq_putc(seq, '\n');
>> +
>> +	return 0;
>> +}
>> +
>>  /* rdtgroup information files for one cache resource. */
>>  static struct rftype res_common_files[] = {
>>  	{
>> @@ -2035,6 +2054,12 @@ static struct rftype res_common_files[] = {
>>  		.seq_show	= mbm_local_bytes_config_show,
>>  		.write		= mbm_local_bytes_config_write,
>>  	},
>> +	{
>> +		.name		= "event_filter",
>> +		.mode		= 0444,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= event_filter_show,
>> +	},
>>  	{
>>  		.name		= "mbm_assign_mode",
>>  		.mode		= 0444,
>> @@ -2317,6 +2342,55 @@ static int rdtgroup_mkdir_info_resdir(void *priv, char *name,
>>  	return ret;
>>  }
>>  
>> +static int resctrl_mkdir_counter_configs(struct rdt_resource *r, char *name)
>> +{
>> +	struct kernfs_node *l3_mon_kn, *kn_subdir, *kn_subdir2;
>> +	struct mon_evt *mevt;
>> +	int ret;
>> +
>> +	l3_mon_kn = kernfs_find_and_get(kn_info, name);
>> +	if (!l3_mon_kn)
>> +		return -ENOENT;
>> +
>> +	kn_subdir = kernfs_create_dir(l3_mon_kn, "counter_configs", l3_mon_kn->mode, NULL);
>> +	if (IS_ERR(kn_subdir)) {
>> +		kernfs_put(l3_mon_kn);
>> +		return PTR_ERR(kn_subdir);
>> +	}
>> +
>> +	ret = rdtgroup_kn_set_ugid(kn_subdir);
>> +	if (ret) {
>> +		kernfs_put(l3_mon_kn);
>> +		return ret;
>> +	}
>> +
>> +	list_for_each_entry(mevt, &r->mon.evt_list, list) {
>> +		if (mevt->mbm_mode == MBM_MODE_ASSIGN) {
> 
> I do not think this "mbm_mode" is needed, resctrl_mon::mbm_cntr_assignable is already used
> earlier, so would for_each_mbm_event() from the telemetry work be useful here?

Yes. Will remove mbm_mode and use Tony's telemetry work.

> 
>> +			kn_subdir2 = kernfs_create_dir(kn_subdir, mevt->name,
>> +						       kn_subdir->mode, mevt);
>> +			if (IS_ERR(kn_subdir2)) {
>> +				ret = PTR_ERR(kn_subdir2);
>> +				goto config_out;
> 
> "grep goto fs/resctrl/rdtgroup.c" for naming conventions.

Yes. I see it. It should be "out_config".

> 
>> +			}
>> +
>> +			ret = rdtgroup_kn_set_ugid(kn_subdir2);
>> +			if (ret)
>> +				goto config_out;
>> +
>> +			ret = rdtgroup_add_files(kn_subdir2, RFTYPE_ASSIGN_CONFIG);
>> +			if (!ret)
>> +				kernfs_activate(kn_subdir);
>> +		}
>> +	}
>> +
>> +config_out:
>> +	kernfs_put(l3_mon_kn);
>> +	if (ret)
>> +		kernfs_remove(kn_subdir);
> 
> This looks unnecessary since caller does kernfs_remove() on error return. Compare
> with how rdtgroup_mkdir_info_resdir() handles errors.

Yes. Will remove it.

> 
>> +
>> +	return ret;
>> +}
>> +
>>  static unsigned long fflags_from_resource(struct rdt_resource *r)
>>  {
>>  	switch (r->rid) {
>> @@ -2363,6 +2437,12 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
>>  		ret = rdtgroup_mkdir_info_resdir(r, name, fflags);
>>  		if (ret)
>>  			goto out_destroy;
>> +
>> +		if (r->mon.mbm_cntr_assignable) {
>> +			ret = resctrl_mkdir_counter_configs(r, name);
>> +			if (ret)
>> +				goto out_destroy;
>> +		}
>>  	}
>>  
>>  	ret = rdtgroup_kn_set_ugid(kn_info);
> 
> Reinette
> 

-- 
Thanks
Babu Moger
