Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2055.outbound.protection.outlook.com [40.107.212.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F247A199FAB;
	Mon, 14 Apr 2025 17:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652949; cv=fail; b=h2iDmcgaWnyGz0V/aAWgTXyqbgXxQWcIpHJ7YrMsXCzEknNfhDUDYYG8qFnAvq1cVRCY63WFk4lUxBarx/wOS0rk/9mr9O2Z0C1ERqOem2R3iLgGagMAORQc76tR4zyYS+QJtj3B0iYwpVCjwm88aY/R8vdfMtGC6K+J8fDPPCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652949; c=relaxed/simple;
	bh=laFh8p7sKes8ZLV1W4THwES/EAZaG2PIyadJ/00xJPw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZtlOsNiKvAFEk4RoRuIyOum6DGs1JolqfOI1UMLJY4DfbobvlR/FhnG4eS0ASRGfgFMp0CR7y5ToNMgC3L4EfC/Sb+gKlgSBVv/30ZXvfryAdmZkSJcvY9JEDkXs/XId5KFQe5yRuBZf6KEOUmrTkLMWZ5JQ8Q6TZ31b+uX1jpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ak4pSDoa; arc=fail smtp.client-ip=40.107.212.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ak4pSDoa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgyDD4OzfyrhW4zTWqoYOAGDISTClyx0r8B76217Q13ihOp2WWUVWDXeDmk6cRT6d2ctcINmLsVg971IePfoguK5eVoflN6P81jsLnapOe1XQdGyvCYTjW+TVfg61RRIQp+Giu75M7cQ0Lr4JGOOd98KVbdvcOa68Kx3WPeIGJU3m3XCXaSqD7xWVwnD4KL5CCW6n0ff3hv1UzcsqNTdK5qgO9X15SR+fokK3I3prCtUC0aF5lDhvt3WAqW13qchhh0nwZWf6pJU/zGbGhj3N83qtamwa32vzvLmjradX9x3ofijjWNOT79WvJHVVyHIUD9yZq9tQYy7HJIbopKShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jckPSAas8+LfU277umI6QWRSxkCbNr7Jw7WZSIA1os0=;
 b=oOs0ESVcoWV0eefX+srf3d1/z7zYKzYU3UMpacR1FOmu9FRmvdn9CB00Wh153SRBfDZqHKzeSIlE9jIJAoehX0ataDgakDOmd0Nt2Yd3cSyVBTerwOBKb9Jaar9I7YIg00NgI3ucFzwgGPSaHW2Rfqp8jPm6ooncKh81Q2L4XTO/ijx/0t4q9YVRyokXQuZ77ZwAbBwpc15DHDgnuXtYEobV0bS+PzKJqnhPEQg4vBU/Ybnk2443mp7rr91jtQ0srZXKTZf+twx6cmZCNNYO6+wjQSPQ+udbEMwIv6bQewL/PV9A7D5vyeLc3A8sgsSCX8FRyRxadrkUDzppf5A3Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jckPSAas8+LfU277umI6QWRSxkCbNr7Jw7WZSIA1os0=;
 b=Ak4pSDoa04cSL2hVrGhC5VRsfiIQMkNaFHJkkfz2erEErDu4CVS0WSExrLwF2yDgkDfDK7R3Qwv+VnrTfvy5KNnNnPmiVw/40nX0e875YcYvo6S44OcXzqUXM+4TWN2NknUyf1lyMIkzUig65XP6SVQvce1uRxOaIaCqkWQWTv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH0PR12MB8175.namprd12.prod.outlook.com (2603:10b6:510:291::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 17:49:03 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 17:49:03 +0000
Message-ID: <44c82df0-30e7-44d1-8759-c8f3df68e538@amd.com>
Date: Mon, 14 Apr 2025 12:48:58 -0500
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
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <74255838-47dd-4e18-b458-f9488b38b9e2@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0126.namprd11.prod.outlook.com
 (2603:10b6:806:131::11) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH0PR12MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da0f383-aaa8-4476-3235-08dd7b7ca53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3pQMUt4akFDbENwNCs5ZUdYRlpLWW1sbzlFNFVqQzVPVkE3a3cxbDNLaUx3?=
 =?utf-8?B?NGcycnI3VjBweU05UzZVM29vQ3ZKMStiZWZHZUxuWjBpa0pVS0J4bjkzTXBG?=
 =?utf-8?B?SVVtNHVRTGxheWhqUlRqYk9wT2padWRIMGxhUXBLa0RXWDRwZWRrR2tQM3dm?=
 =?utf-8?B?eXdUS3QrKzZHRFF3S0tnb1FNUkNKeUE0TW1OOXBmdVp5N1dTamhKdkN3KzQ4?=
 =?utf-8?B?bWtmd28vemROblRTMTBzN3FoWUpxUVd2WEo4M2JwR0VJTUpTemNGZURCR0gv?=
 =?utf-8?B?a0FHOFRMSkJWSGREeUUxVXJDSzZUSVVPZlRGZStWKytFWGdnNU5RVlZ2NFo3?=
 =?utf-8?B?VC96T0Z1OEJhZ0FYU0E3eTUzMWdmbHI5bytkTWg5b3FqR1ZVTzhVb3pBbVdW?=
 =?utf-8?B?b0w4VnRQMzB1d1p5VjNxMy9Pc0hZTmF6ZWJwNWVBQUxhUEN2TUFCUXNSd1Zz?=
 =?utf-8?B?QS9aemN4UDRNTTdvUlBmZDM1bXZBTjQzVmczcytaV0E5aEI4blhYdlZTeTJP?=
 =?utf-8?B?WUw5cnhvTVovUGFMbHZVSXhLVTl3MG93Wi9VWVc3S2dCSXdGcFk1V0x1aVVp?=
 =?utf-8?B?TGhjdzFzUkNxTG15eW95Z3NXWE5DbWhLVmlqbWtZemNxWUZzUURYaFlZV3FF?=
 =?utf-8?B?K2NpZ2xJZlhyRCt6ZytJMjZidndKSkJ3L1RteUYvNDhVL3hTYTdERmxTTENI?=
 =?utf-8?B?SUl3aTZxR09CTDV5Z24zOUZUaTZnZkY1ZDdYL1Y3dWo4dWd2YUI0UXMrWVgz?=
 =?utf-8?B?NTRoZHlSd2NQWDNaKzd6a3pwbjdpaHhZOWNaZkxKbWJmUDNsRFRybHRrN2lH?=
 =?utf-8?B?UUFxUGN5VGNYTkthTldoaUJlUHVuMzZXbytEUHZVYW1JQ1NybWt0WkNWZU5x?=
 =?utf-8?B?aUMyazRYNlorM21wRHUwN280VHIwWHNXMUdoNlZwYUZpUi9IZXhPd3Q5M2Q2?=
 =?utf-8?B?aFRWdE4veHdTQkVNVkFOMDdwanFLUm52OWp4QUVJcHRXSFNaanZiQ2hCK0tp?=
 =?utf-8?B?Slc2WFVyMU1JYkowT2FDMEI1UC9ZTTRlTTlkL1N2M0VKdWtKbE1HcUJOdE9t?=
 =?utf-8?B?ZzFDSkZLb2FiamNZN21NWG16QkxlcmVXRGJFMm5KWXlLekR5ZXpvcFZRRXVw?=
 =?utf-8?B?ZW5GcHpJMkUxNitqWUk1MStjQzhyQ3hZYnFCWmVSQSt5SkhxSGNYOHNBRHpm?=
 =?utf-8?B?WHc1Q0FNRHJJaCtiMC9tdE10MjNWc1hSS2JTZjgwUlF0dmxvTXU5akllWTND?=
 =?utf-8?B?WlAyck9IeDIxa1F1a0FzMDFWZloyUmwyRVFrcS9CQjFnMlhMVEhJekRPY2ND?=
 =?utf-8?B?eGxVWE9MQytzZngzM3U4MXVKQkNnMUIzeFl6THp0SCsva1k5Z3BSandUclRH?=
 =?utf-8?B?TmlSYUp5M2wwRUlEV2ovN1E3V3B2YnRhV291S0dFbzJEOGFxQjdMdDVIc0FQ?=
 =?utf-8?B?WWZPRkUrOER0YjRPNUZXQU8wcUV6Q1hxSzM0WUw3ODJLSDFBSXNrNlR1M1hG?=
 =?utf-8?B?RS9XdjFQMzhGVUtPWGxmUXNLUFRqNGFaanJGNFlYTjQvNkZ4TlhNRnUvblBR?=
 =?utf-8?B?Y2xFM2tJWG5tTE0xdGEwMlluQjZGRTFIbXNiTi9NaytqWGxhMFlYYWgxbjhY?=
 =?utf-8?B?Q0lKWVNPM3dLcjBEVnhDY3V4c3BENGkvbkdmQVo5VG5ZMkJodEVWaE91WWdT?=
 =?utf-8?B?V1h5VUtnR3RyMkZEbG5hN3lXdTlhZDhQTmx0REd0NzMrRWFtUDRqTGtaanA0?=
 =?utf-8?B?cC9pa1paVVhtYzE5SUVxSDA2akZrekpnQXRZS1VxL0VCekgrQ1hzcU10SG9p?=
 =?utf-8?B?TnUzY3dDTUJUYjZadk0zU2Z1bHRxSkpjMkk4QXRJZHA2RHN2bTlJOW1Fcm5u?=
 =?utf-8?B?QXFuNE1TaFlwZU56UTVYZk12MU5nZ0wvTUowT1Q2ck5CMXVBM1ZuY01GQzQ5?=
 =?utf-8?Q?UCUD7/YQBRI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUJrbXNWUHc5RUZJRGZBQk05QXc4ekpBZUVRSzFUaCtncWQ2NEJNb3JnbzVm?=
 =?utf-8?B?azdUMVAxUEVpdjBTdnV4bHBYNlRLbEMxaU5SY2VCUmZRaU9wM21jaXNpWTlN?=
 =?utf-8?B?bkRGRDFFYXE1cmpiVTNUdjU1NUh5RFdhNFZ5TlNGcDVEUHd2OU5WMExKaUU1?=
 =?utf-8?B?Slc1MUhxbmttZzY2Q1NtQ1VNWDM2YkY2OGttemp5VTlYT2IzNkZoUm52QUx4?=
 =?utf-8?B?Q1R4eUR6SEZxOUJFeDVwcEo3QW9ZVmVjMnJVU2djendyMmN4TzlTZ1R0T2RW?=
 =?utf-8?B?UGVZLzlWTlZlUkU1b3N6NDJNK3lKUkFzT1NXSnBlMlYvc2k4UTFYS2xwTVZq?=
 =?utf-8?B?UTlBQUVVSWFmbmR2Y2p2ZXBKc09GZlpKTEE0dXdmUnRMU1JsSHNqdy9PNUNV?=
 =?utf-8?B?SlZUWlBpUlFkS2t2c0FQNzJYWWtTUzEwSWRBOVNVMHpSbnJYb0RTY1g4anRu?=
 =?utf-8?B?cVU0UmhFQjNWbEY4eDFramw4cnlhZnZQQ0J6SW5TQ0JjSGsrK21HU2xaTFdv?=
 =?utf-8?B?QkxVVGlBRS94MlZBcTA5N3hwNWRkakJVczUvOE4vVHJFbXovVzN6UEloVFVU?=
 =?utf-8?B?WUVxclJ6Q0VuUDBjT0dudzNUZ0RZeDhhaDlpRGxWclFCM25rUFd6eDBaYlc2?=
 =?utf-8?B?RmpBMXF6WHA0UXlHZmppbzJQVWxRQTNQVWczOWNkRDl6TVRxQWp4eWc1U0Yv?=
 =?utf-8?B?dXF1clg5QlFZZFJJbE5CM0pVMlIxU1V6MlVmZWNSemduVnpmWTZNcDNaaWJQ?=
 =?utf-8?B?dERwUlFKS3FRVjVnSEhpMGZNVnNOanFrOFF5OG9weVhLbkZnSDEzVmRoaHJK?=
 =?utf-8?B?Z1J6bnRnbllheFo3UlVJZnpzalFDUXI3RlFWb2ptQXphY1dTTFk4U081Ri9t?=
 =?utf-8?B?ajNWMnNGVS9LSGVycFNNZElzczE0MUFtMkd5VTlkNlZsajVuQ01Fd0lhanFP?=
 =?utf-8?B?endBQkkzY05jN0xYb1ArN294VnU3VTcxZVhTbjVKSjVUMzl2Ull0aEtKS1g4?=
 =?utf-8?B?YnRCOVEwR1hRMGV5TlBCOHpkVDcvMERNVVVwSlgxYmNvUmpvZlhTdU5HTC9h?=
 =?utf-8?B?TnQzZk5wdUdSUGlNem5sRXJYV2EvTlNISUpPNm56TGZNZUdzdTZBV2MxQ1dH?=
 =?utf-8?B?aVk4MGJUeUhpWUgxMzVUQ0lxZXNPcFdLYUtZaExsR2ZESjNhazVBR2d5VHdC?=
 =?utf-8?B?TXQxWTB1MEo5bVl5TEVhSytVTFozTVkvQ21hbkhPeDdhMTBaODFSdTBKMVVu?=
 =?utf-8?B?b3Z4aFNXMjVUUWxmOTE4dEE4KzNCOU5jU1B1QThoanN4NkZXdjZUdUVZUmZu?=
 =?utf-8?B?RGF2N29pVlQrTjVwWlFDVTVYaVhWTXI1YTU3SnJONVpwbnFwTXBKSlRrVWcy?=
 =?utf-8?B?NGFEN0VSSlF6NTZrSnZNUHpwbG9Hdm9Oc0tYejFvZVVHaER1SHdyQUxHdEdz?=
 =?utf-8?B?OUFxME1BSHJBTmoxZ3hlcGlXR0ZldnpvV2pKRUZVM0Q2WTlvUW01YUpLeGQv?=
 =?utf-8?B?c3pyMS9ncTY5aGFxazZoNUZ6MUFLbUM0OHJnSmRFZFpVd3lYSFdCTEU5VUJn?=
 =?utf-8?B?bnNZeURpMHltMU1rRkhGZzZMZFZlOU5xMWwvNXdtcmkzYXBhUGVTUEtOTHR5?=
 =?utf-8?B?S2tocDRPM3hLMVRDbzVSRkFmc3lCSkZzaFBySERhTDhKU0h3dDUxdDFVU2hm?=
 =?utf-8?B?MVVYbENITHFJcEd0YnM3SktXMXZqZSt0RzZzSXUxK3B3bWwwa3l6cGZFdUFj?=
 =?utf-8?B?UldCYXhFMFljUWdGdllnVFREdVhGSUNvT0EwQnBPZ0xLVDVnYXRUbmErdXRR?=
 =?utf-8?B?OGdON2pVWXBTRFY1T3JmUzhIdXNrUHdaN1dTV21RM1c0SUV2N1p6NjJIRTVV?=
 =?utf-8?B?QUlRTllqT3dGWFFIZ1dHZUZmQ2o5cnN2ZEpjNndFWXV4TWt2ODd3UVhYOWRE?=
 =?utf-8?B?ZG05ZWs1NEFEaWhRMWFtbjNrVEEraEFKTS9UNldyOUw5a0licnBkbk1MbXRi?=
 =?utf-8?B?SGdRWTZwTjh4MUcrb2F4YjV4ZUExeWFJc0FWbmV4c1I3aHpkMkVSVlpYSEVN?=
 =?utf-8?B?MFBjSzBKQlVSUmRFdGtrbHVmQW4zZlFsNTg4WHZNVG1QZ1RHMHZlMmtPTjhi?=
 =?utf-8?Q?dw8M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da0f383-aaa8-4476-3235-08dd7b7ca53f
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 17:49:03.7585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vB4rw+rFanhzMNBRLytzGS9zq3C/KwMpdDp2pTWKomsFtieeJCmsI+E/3C82egG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8175

Hi Reinette,

On 4/11/25 15:52, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/3/25 5:18 PM, Babu Moger wrote:
>> Users can create as many monitor groups as RMIDs supported by the hardware.
>> However, bandwidth monitoring feature on AMD system only guarantees that
>> RMIDs currently assigned to a processor will be tracked by hardware. The
>> counters of any other RMIDs which are no longer being tracked will be reset
>> to zero. The MBM event counters return "Unavailable" for the RMIDs that are
>> not tracked by hardware. So, there can be only limited number of groups
>> that can give guaranteed monitoring numbers. With ever changing
>> configurations there is no way to definitely know which of these groups are
>> being tracked for certain point of time. Users do not have the option to
>> monitor a group or set of groups for certain period of time without
>> worrying about RMID being reset in between.
>>
>> The ABMC feature provides an option to the user to assign a hardware
>> counter to an RMID, event pair and monitor the bandwidth as long as it is
>> assigned. The assigned RMID will be tracked by the hardware until the user
>> unassigns it manually. There is no need to worry about counters being reset
>> during this period. Additionally, the user can specify a bitmask
>> identifying the specific bandwidth types from the given source to track
>> with the counter.
>>
>> Without ABMC enabled, monitoring will work in current mode without
>> assignment option.
>>
>> Linux resctrl subsystem provides the interface to count maximum of two
>> memory bandwidth events per group, from a combination of available total
>> and local events. Keeping the current interface, users can enable a maximum
>> of 2 ABMC counters per group. User will also have the option to enable only
>> one counter to the group. If the system runs out of assignable ABMC
>> counters, kernel will display an error. Users need to disable an already
>> enabled counter to make space for new assignments.
> 
> The above paragraph sounds like it is still talking about the original
> global assignment of counters.

Ok. Sure. Will update it.

> 
>>
>> The feature can be detected via CPUID_Fn80000020_EBX_x00 bit 5.
>> Bits Description
>> 5    ABMC (Assignable Bandwidth Monitoring Counters)
>>
>> The feature details are documented in APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>> Monitoring (ABMC).
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>>
>> Note: Checkpatch checks/warnings are ignored to maintain coding style.
>>
>> v12: Removed the dependancy on X86_FEATURE_BMEC.
> 
> Considering this removal it is not clear to me how the BMEC and ABMC features
> are managed on a platform. Since this dependency existed I assume platforms
> that support both ABMC and BMEC exist and after previous discussion [1]
> I expected to see that BMEC support will be disabled when ABMC is detected
> but I do not see this done in this series. From what I can tell, looking at
> patch "x86/resctrl: Detect Assignable Bandwidth Monitoring feature details"
> BMEC and ABMC are both detected and enabled while I do not see any
> interactions handled. For example, a user modifying the BMEC appears
> to have no impact on existing ABMC assigned counters. Could you please clarify
> how event configuration works on platforms that support both ABMC and BMEC?

They are mutually exclusive. If ABMC is enabled then BMEC should not work.

I missed to handle it. Also, I was not very clear at that  on how to
handle that.

Here is my proposal to handle this case. This can be separate patch.


diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index d10cf1e5b914..772f2f77faee 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1370,7 +1370,7 @@ static int rdt_mon_features_show(struct
kernfs_open_file *of,

        list_for_each_entry(mevt, &r->mon.evt_list, list) {
                seq_printf(seq, "%s\n", mevt->name);
-               if (mevt->configurable)
+               if (mevt->configurable &&
!resctrl_arch_mbm_cntr_assign_enabled(r))
                        seq_printf(seq, "%s_config\n", mevt->name);
        }

@@ -1846,6 +1846,11 @@ static int mbm_config_show(struct seq_file *s,
struct rdt_resource *r, u32 evtid
        cpus_read_lock();
        mutex_lock(&rdtgroup_mutex);

+       if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
+               rdt_last_cmd_puts("Event configuration(BMEC) not supported
with mbm_cntr_assign mode\n");
+               return -EINVAL;
+       }
+
        list_for_each_entry(dom, &r->mon_domains, hdr.list) {
                if (sep)
                        seq_puts(s, ";");
@@ -1865,21 +1870,24 @@ static int mbm_config_show(struct seq_file *s,
struct rdt_resource *r, u32 evtid
 static int mbm_total_bytes_config_show(struct kernfs_open_file *of,
                                       struct seq_file *seq, void *v)
 {
+       int ret;
        struct rdt_resource *r = of->kn->parent->priv;

-       mbm_config_show(seq, r, QOS_L3_MBM_TOTAL_EVENT_ID);
+       ret = mbm_config_show(seq, r, QOS_L3_MBM_TOTAL_EVENT_ID);

-       return 0;
+       return ret;
 }

 static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
                                       struct seq_file *seq, void *v)
 {
+       int ret;
+
        struct rdt_resource *r = of->kn->parent->priv;

-       mbm_config_show(seq, r, QOS_L3_MBM_LOCAL_EVENT_ID);
+       ret = mbm_config_show(seq, r, QOS_L3_MBM_LOCAL_EVENT_ID);

-       return 0;
+       return ret;
 }

 static void mbm_config_write_domain(struct rdt_resource *r,
@@ -1932,6 +1940,11 @@ static int mon_config_write(struct rdt_resource *r,
char *tok, u32 evtid)
        /* Walking r->domains, ensure it can't race with cpuhp */
        lockdep_assert_cpus_held();

+       if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
+               rdt_last_cmd_puts("Event configuration(BMEC) not supported
with mbm_cntr_assign mode\n");
+               return -EINVAL;
+       }
+
 next:
        if (!tok || tok[0] == '\0')
                return 0;





> 
> Reinette
> 
> [1] https://lore.kernel.org/all/4b66ea1c-2f76-4218-a67b-2232b2be6990@amd.com/
> 

-- 
Thanks
Babu Moger
