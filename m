Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4381F94C;
	Tue, 15 Apr 2025 19:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746193; cv=fail; b=uLPEqwvJ9TybYpn9rZUDDv8RcTRcf/OKCdP/61nhxdPHFaWIllVq5+QIuHSFYm2A4qzHU3F67xBraoLJ2p5i7Pt8+al+cLTVLCHVqidWz9boysrIdBRBCV50R12AA8pNL/t/g+3Y5A5OLTvHvmHvFl3fNpK+dYBfpgksdjFwzHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746193; c=relaxed/simple;
	bh=VnzleuNwYdksSuCvvWhVWdRx/IPJUKNBWFC5olwuRX4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W15Kcc3CXZVnAIOa60KK+IgMAKRGaJntgcw7unhVGuk4soev1fOb0SgxwcvG8AgeJcIFEdDxG5gIWpDEoBdAeNYrWPaZk7JQy6hgGsjcVNSCDFzI0QzulyUHSJXFT1m/+tsQWtW/lPe4iziPwrafKb5Zu3YUR3gBOPDFHhlsyUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QKmjuxXA; arc=fail smtp.client-ip=40.107.237.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QKmjuxXA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4IhvXzsgCYHcmciRtx0S5ih8RXuD1DkWDF2BdQBmm5dLeoznMYdK5VPBHx2bOwiCQ+Ll8vhwg4mvSAtrkT3z3lgplKki8CUZ1st02m1wpl2lQxSB3+eV5aMgLrTtVHf6tD9+k1t8mXk3P6F36rcvPEEXKRkCWL01UBUH+T88TQT9uMK5gmt+icmD5vzZhPleWLUwFvQrQ9nFVNF0ixsIk0/sf1ALpe4yRCY7npgIEqJ4u1Wi5In6M9nKwoKBfRiEGPVvAZ0lCy9t3duCFu2DvwOZ/+fYfsv0uiZuEWKRkEwW2T6DwpHTGS6Ycq1Fn4bEv9VMbFLFWOEcdl50r27Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmuX4A5ScHcGlhlX9fuu0z7IRcQwoBWnLmzdY1MCNUs=;
 b=hzhihpEAuK1dCeJ2KccXRjIyikr7nk5EiP/OpejcIsRtynvCLgoAB476zqcWfbSTw8cA6HC409CbgBXpdA2DbKjKuEILZJ8VJ/qbDXMIG4iR1iEK5HBbRJEI+owvNa/T6XQEQO+Z+XxfR3E5lOadMXaQbp6hpyGW1ItZdW2jpk0ry68V0TTC2f/l/lni+0JMbGHEifCvA1ou/LkH58gbtWdn8XMm6U7Sv2EShydJAf9IO2HP7VG0R8rd307p1ZnYzVEDiIxrTnf4zme4p49jNK2nNQ85BH80ooVceJfMsm8vW9fQm3M/vCiyxozvNxpEOTvIkx8wK4itSKgxYriSbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmuX4A5ScHcGlhlX9fuu0z7IRcQwoBWnLmzdY1MCNUs=;
 b=QKmjuxXAqHS/1x2pz/cZINS7B1idwuOF2vm5KKituvq/IqnPc3vhLEfXe6gZ9sv/hDMugMuvN425RxhZ6IvQCMLlqRzdEDzSdqgIajJza5xFKl0LLMwmbclLUDGmerSmZA+as4Iv8DoZCSZJTrhjoVjRQtUmZ30P5SPklNYG27U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BN7PPF0FD1DEA27.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 19:43:07 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 19:43:07 +0000
Message-ID: <600224e2-2c0a-410f-9812-80dd1da9d7c1@amd.com>
Date: Tue, 15 Apr 2025 14:43:03 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 03/26] x86/cpufeatures: Add support for Assignable
 Bandwidth Monitoring Counters (ABMC)
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
 <135e452ba38426487e143bc4661883e4939d502c.1743725907.git.babu.moger@amd.com>
 <74255838-47dd-4e18-b458-f9488b38b9e2@intel.com>
 <44c82df0-30e7-44d1-8759-c8f3df68e538@amd.com>
 <dc736f74-ea47-455c-b27e-254277aa4022@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <dc736f74-ea47-455c-b27e-254277aa4022@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0064.namprd16.prod.outlook.com
 (2603:10b6:805:ca::41) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BN7PPF0FD1DEA27:EE_
X-MS-Office365-Filtering-Correlation-Id: c4452876-c1c9-45e4-4b6c-08dd7c55bebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RExHTXhrRUx4L1ZjdEg2Tk9NUEFBelVLQ0R5NzY5Y1NOMmMvSEFaZjNtTlhy?=
 =?utf-8?B?aEgvZmwwcVBaRjNNK1NiYS9uMk13Q3ViUHRqbHJZaXBZTWxUSGZOYnozSG5t?=
 =?utf-8?B?UTFHVUVXU1FPbGZYTk9CRStXSzZZcHpqaGF2QThYWFRobnY5MC9KdW5ibjg5?=
 =?utf-8?B?RjJmMGlkdWpyZGhJUWRMOFhhTzVIUlBuVS8vejlJSUdUK08yVTlrMnBZQS9P?=
 =?utf-8?B?MVBuOXEvd2g4OWc3Z05RUVBJK3BGb3RBbjdoaW1qTGs0TnZqZWRDaDYxdGpU?=
 =?utf-8?B?Q0FIVzVmZVJUeWpFSkRIZFJRNytnYjRTeE9GalZvdkR0RlFuV3kyTFlnQXJr?=
 =?utf-8?B?VHlpM3A4dHptOHJJY2xVbGl3WnE4UmRxQlR2UTFvcFVtWVdMK295cUpJR3Jy?=
 =?utf-8?B?bzBoMVc3SGVNTmh1VmswRzhvSG5wOGx2aHN3REl3Q1dqOUEvSlM3aWUwMkpm?=
 =?utf-8?B?MFRSN1htV1VUS3IxUzhjdGszOVlnZUhQK3JYZmNKMU5oQlBjdmhJQVoyeStW?=
 =?utf-8?B?T0ZQY0FMNUs0UXB1eC9jZnZVclVUOGZ6SVlZSHhiV0ZYbkhyeTN2czZUL0Vr?=
 =?utf-8?B?MkpQcmx1cTU0OFNjNjhwSW45TEFIWVFJZjM4SEkrWWZQOVY0ZUdMTGpHK2FI?=
 =?utf-8?B?TDU4T3EzUUFYOUk1WmdDUElVdis3dFFpczd6SmIyclhwVHJUQUVRa2krblMr?=
 =?utf-8?B?TnFhRGxaNUpqL1d2aDZMMlR5VmxNbkNFSUU2bXJwYitnZXJ4QlJGd251ZEt0?=
 =?utf-8?B?MjlZcmRFcTNtd0lsRmF5V0dWcDRvYzc4eFVjaTNPcFRXa3QzUVRCOWtyV3lk?=
 =?utf-8?B?VHRPK04vYXlXM0lBNDNBc1dFMFQvYjRUTGFRbGl0bm81TUlrV2NueWtFMWU3?=
 =?utf-8?B?eURTSWkranlkOVN4SlRVeU9vVTYyZW4wT2Y1Mzd3MnZkT3E5c0J6ODR6NFQ5?=
 =?utf-8?B?ZitVdFRNNFFudWkxWlBMLzI1azRvY0hJRGtKbUV3QnE0RkNkY09vVTRhczNK?=
 =?utf-8?B?V0c5djVFcm1jbDIydXNXWjNRcURJNlVHRzJNSFV3VXdzY2M5N3Q0SEtEYzFT?=
 =?utf-8?B?eFNyWTN4STBTYnlkNXlWQjUxeU0vaVFWNlRQNUlBZjBQUTQ1N2gxZWJvK1Y0?=
 =?utf-8?B?OHdscEVvYjV2NG4zOCttNHN1UmlzLzZMcEtJaklTWHNwUjRPVFdiNGc3RE5w?=
 =?utf-8?B?OGFkTVB5NFlFZmFiTDlvaVdmbWh0ZGZldmt5bFFIajAzR1QrZUNPdG5INmVj?=
 =?utf-8?B?L1Z2TXJKdExMSENMOHdsYjRzS05jS0dKSVJxa3dtemlUM0xFQWtmc0FtdFhk?=
 =?utf-8?B?V2huYzY4RkljZVZvVEFnMzNqZHlWaHArM09zOGhxL0w5SVRiS1lON3NpMHJr?=
 =?utf-8?B?aExpSXBBeWZWNWpCbGdlbjFuUHZMRFV5bGhZUlU4NDNsK3RQWkRXQ1hLOWJE?=
 =?utf-8?B?eHVvTkY1OWh3aVZFVjlYZkhpT3ZpbTljbWtlTDcrd2NTSGNXTjNRNXdicUh3?=
 =?utf-8?B?eTBuckl4WDd0Mm9CdkZoNzFaVWhoa21qejZaMmh6Wnl2VmtCZUtvM0NlZnhh?=
 =?utf-8?B?elh3emJlRnJqY2pGRUtkbnkwQVAvRGxiTDlUeHlFVkhNczNkYzArL3VIMUpt?=
 =?utf-8?B?SXdUNXlMUjZBQ0dPcFFGU2NPckg1NjEwRmJFTEdPOHRCSHgxMEZhVG1vMlhk?=
 =?utf-8?B?ZlhRS1p2WVZabGJ2RFNEakNSRkxtRnYwcDQ5ZXRXVUdMejgzdldld0JobVhN?=
 =?utf-8?B?V1RqRVE0N2Q2dUQ2bmQ4OThSL1dTa3V0SGZSMXhIaU50Z0NFUFpiNXpESmcx?=
 =?utf-8?B?Vi9POXVXNFljZU5KN0Q2UWZOVTdNTkxSMm1FYzV3b2JOTnFHZGpEQ0FTdUx3?=
 =?utf-8?B?S1RlcFpHMXFVV3lOOUNjT3ZOa3ZHbzNxMzhSU2ZhclRETTRQNVhMclp3QU9w?=
 =?utf-8?Q?7EuHkswSEh0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym5QVDZJUENINyt1R01zLzJhTzFmdTRtY2REbElQNDZCRkN6RTdhdmlESDdj?=
 =?utf-8?B?eG9NOWRRWWY0MndXYkNVOUp6c3R6ZG1PVHZLNTNIbWFQUC9BVXN5NUtWRWN0?=
 =?utf-8?B?ZE5PSTY3OGxFeWVRejFqWktEUUUza2xKR0dkVjZaVzNjWmpaN1dibnRqTE9N?=
 =?utf-8?B?OGxlQllVOTgxRXdOV1hpUkhMK3NpSnUwdlltNGpOU3pUSlMvck03N2ZoMG9Z?=
 =?utf-8?B?NzVTd0dWSkZQSkR6QWNKS285VjN4TndhQjNkdCswcW5ITHhHeDZVU2tEL3d1?=
 =?utf-8?B?N011T0ZYbWluN1NleWd3QnZHRmhlS1JFNGk0QmU1dEhjcmdLaGlUQlVOVE83?=
 =?utf-8?B?ZjhFNFhlT3lSMkhNQ3hFMGVNbkRheXJLbGNFY01ZRTFRbGt1RTh4Nlh4V3Fu?=
 =?utf-8?B?bFNmc1FIK3ZYeVFCbjU2TEphNlVzaTRIUjdrMlBQQlVCeEtMeXdKamNheFBJ?=
 =?utf-8?B?Q1RPcmlhVUxBMzUwQXFnenZnNEIyd0RpRFp3UVN2cnFWcElhS242Y2VMMmdw?=
 =?utf-8?B?a2h1WDJwakpicTRWS1BhaExGaHBrNU1xYWE1b1ZBWUp3Q1I2NGdzb2NJYU44?=
 =?utf-8?B?ZWF2b3RXRVZaN2FRczVid01JMDVFdzVwMHNac2x5My9icHBwT3dhTHVQek1l?=
 =?utf-8?B?L3RIVHVpeG9LWXpmQlpIOExDZFVVcHUraDU0cHlXMTRobnZIakNnVWswL3VP?=
 =?utf-8?B?NWlWRDdDNHFWYUhhUTUzV1cwU3BpMTBwS0VUb3JWQ0hEYXJDQ090SW5aNXBx?=
 =?utf-8?B?dVJFY2FHZkE3N2prcFVhZ01rUTloMUNWMjVLbE5jaGtCdmxyM0RDaXNHZ1I2?=
 =?utf-8?B?ZlR3OVBudHVzR1A0Y2lZRUZKay81NHJnNi9yUisveUNicW1xaWpLWUFHOExJ?=
 =?utf-8?B?a3pMUlp6THNiQ3F6cGlrN2JUK0lLZHVXUDVsN1FWODNiRHJiQ0YzK1pCeXNQ?=
 =?utf-8?B?Y1F1dDRPY3h5MEhsT1EvNE95c21XS0Z0S0JJSVJINEdSeUlpWHp3d3dYQ1Jk?=
 =?utf-8?B?V1VpM1JRRzFmMVk5cFhlcFF3SE01ajQ4bGtNSXVlQnRnQ0Njb3o1SjVGRTho?=
 =?utf-8?B?TWkvL0hTSEtndFM0b1R0YmF6UTRTeSsyYjBlWTNRZGhIbUMxWEllc0NwakJm?=
 =?utf-8?B?MVRRUTE5SjRRS0E0dHdmNG43TmNQY0d2ZlVUK3V1R24rUUhJTEpsY0FhUWg5?=
 =?utf-8?B?ZTJPTXoyMXBKQjZWQS9KdUtxbGxXQ3lDVncrZGQ3UHM5VmpVcVUyUnJqZ2xF?=
 =?utf-8?B?bnU2M2RWQldFR1hTWlVVeGhGV1p1MXEwNHVxSHlPZUF0QTVkTGNhL1VpZ3da?=
 =?utf-8?B?QlVCSkNTdVVGbkJ2YTI0UVdLdkQ0RHZYSG1UVTRSNWhWV3JmOWV6MVNhWTJR?=
 =?utf-8?B?ZjZ1TE96R2FQdUtrbXlsenByNmhRUGhyOVhDZ2lBVWd5TG8rbFRJT0FYbktF?=
 =?utf-8?B?T2g4ZlhpckozY1Vod3FwMFZXaW9TZWJIaWV1eC8yOU1jRElQZWczT1lJUHRG?=
 =?utf-8?B?emxnUVZCQUNLTndQUzViZG9pQmtoeWJXSDRMSk5XbTk2S3FVZWg5bnI5ZERx?=
 =?utf-8?B?T1pyVkphMXNqYm5abVZmd1ZQdml6aG5ucmEzN3h5MjhlMmowTnYzSktaQjFP?=
 =?utf-8?B?Y09mNllQcnkxWFpQSUphUFBiZ3N1MzEyM2dkMW5YZUh3WDNnUitHeitnVVl0?=
 =?utf-8?B?UEMrbFhaSDZIcUtzdEpGS3JWVWNaUi9HV3JudHZBeHByODJqWGdYcGhoandh?=
 =?utf-8?B?V0ZSSlMrbWxib1pKQ3hJdk5laHBETGhQU2c2WHUxTHM4MURnTXpKcm0zNVFt?=
 =?utf-8?B?THVTc09zSmFYMnRKNzU5N1lGZnhCVnphWjFzRGVFZ0JNQUxKU0diRjl1aFdq?=
 =?utf-8?B?RlQ5NVRoTVNVcDNyWjR1QldTYjlrSkgzQzdnWDh6UHdmQTRLNC9ETytGeHZR?=
 =?utf-8?B?Qk9zUHI5NS9JcE9BbGI2bFhNNy91eXY2TG9nUldXSWpYaTJMWEFGT25CYWhN?=
 =?utf-8?B?eC9hRnNKTnI4TUVzK2h1c2ZQMEtYcDRJY0Ruai9ZRUhoSFBqR0w2K2VvNGN5?=
 =?utf-8?B?a20yRDR0aXdyVVNlT0xyYlMxOTJ1ZXQ4NFdGNDZXV0F2aVNIOWxCNzR3ek1C?=
 =?utf-8?Q?4MLs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4452876-c1c9-45e4-4b6c-08dd7c55bebe
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 19:43:07.2747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEhLSq+DIavIL28oaXbbiymwRPNkb8qSOrks6aNujBJPuDoV0NnjNRhehLvAHVpK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0FD1DEA27

Hi Reinette,

On 4/15/25 11:09, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/14/25 10:48 AM, Moger, Babu wrote:
> 
>> Here is my proposal to handle this case. This can be separate patch.
>>
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index d10cf1e5b914..772f2f77faee 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -1370,7 +1370,7 @@ static int rdt_mon_features_show(struct
>> kernfs_open_file *of,
>>
>>         list_for_each_entry(mevt, &r->mon.evt_list, list) {
>>                 seq_printf(seq, "%s\n", mevt->name);
>> -               if (mevt->configurable)
>> +               if (mevt->configurable &&
>> !resctrl_arch_mbm_cntr_assign_enabled(r))
>>                         seq_printf(seq, "%s_config\n", mevt->name);
>>         }
>>
>> @@ -1846,6 +1846,11 @@ static int mbm_config_show(struct seq_file *s,
>> struct rdt_resource *r, u32 evtid
>>         cpus_read_lock();
>>         mutex_lock(&rdtgroup_mutex);
>>
>> +       if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
>> +               rdt_last_cmd_puts("Event configuration(BMEC) not supported
>> with mbm_cntr_assign mode\n");
>> +               return -EINVAL;
>> +       }
>> +
>>         list_for_each_entry(dom, &r->mon_domains, hdr.list) {
>>                 if (sep)
>>                         seq_puts(s, ";");
>> @@ -1865,21 +1870,24 @@ static int mbm_config_show(struct seq_file *s,
>> struct rdt_resource *r, u32 evtid
>>  static int mbm_total_bytes_config_show(struct kernfs_open_file *of,
>>                                        struct seq_file *seq, void *v)
>>  {
>> +       int ret;
>>         struct rdt_resource *r = of->kn->parent->priv;
>>
>> -       mbm_config_show(seq, r, QOS_L3_MBM_TOTAL_EVENT_ID);
>> +       ret = mbm_config_show(seq, r, QOS_L3_MBM_TOTAL_EVENT_ID);
>>
>> -       return 0;
>> +       return ret;
>>  }
>>
>>  static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
>>                                        struct seq_file *seq, void *v)
>>  {
>> +       int ret;
>> +
>>         struct rdt_resource *r = of->kn->parent->priv;
>>
>> -       mbm_config_show(seq, r, QOS_L3_MBM_LOCAL_EVENT_ID);
>> +       ret = mbm_config_show(seq, r, QOS_L3_MBM_LOCAL_EVENT_ID);
>>
>> -       return 0;
>> +       return ret;
>>  }
>>
>>  static void mbm_config_write_domain(struct rdt_resource *r,
>> @@ -1932,6 +1940,11 @@ static int mon_config_write(struct rdt_resource *r,
>> char *tok, u32 evtid)
>>         /* Walking r->domains, ensure it can't race with cpuhp */
>>         lockdep_assert_cpus_held();
>>
>> +       if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
>> +               rdt_last_cmd_puts("Event configuration(BMEC) not supported
>> with mbm_cntr_assign mode\n");
>> +               return -EINVAL;
>> +       }
>> +
>>  next:
>>         if (!tok || tok[0] == '\0')
>>                 return 0;
>>
> 
> Instead of chasing every call that may involve BMEC I think it will be simpler to
> disable BMEC support during initialization when ABMC is detected. Specifically,
> on systems that support both BMEC and ABMC rdt_cpu_has(X86_FEATURE_BMEC) returns
> false. 

There is one problem with this approach. Users have the option to switch
between the assignment modes. System will boot with ABMC by default if
supported. But, users can switch to 'default' mode after the boot. By
disabling the BMEC completely, it will not be possible to do that.

> 
> I would also like to consider enhancing mevt->configurable to handle all different
> ways in which events can be configured. For example, making mevt->configurable an
> enum that captures how event can be configured instead of keeping mevt->configurable
> a boolean for BMEC support and handling ABMC completely separately. I hope this
> may become clearer when using struct mon_evt for ABMC also.

Sure. I can try that.


-- 
Thanks
Babu Moger
