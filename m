Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619EF1A5BB6;
	Fri,  7 Feb 2025 18:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738954346; cv=fail; b=kzTPnHEpCMIO5W0JztibSOB+3+RBm8P9fpdNkL1LvNUtgxneQwcE8HKg4ytRPT2nCAZPkqPax1gKXLtMUJr8qd8J9blJioDRA24AkGRfYQty3lZeP4urmY9CB9fmUGo2ZjYSvS6gT3A+m+WqXCRnAJE6i5L4ibAUuxX6SlIPYTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738954346; c=relaxed/simple;
	bh=7FV9XQD/y1TNUsmNvSkr2FcYrcXDv/vOlIGltm/gMYI=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VshGzbJsI8oFeuFulvAXP09pURACAZIqtgA6sDcWi5csasbQLtoFc8KjyRWdO7BCET5/ifIfOVdc/TPH8H2Sf4/XlXIB8u5xjpLtCe4WIzmYP3LzejAl6xS7nqf7DZqinPRyTjKDaLp3pUTeLWUlioXCC5ph2HbtcNAMcVANIX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2PVItWUm; arc=fail smtp.client-ip=40.107.101.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2PVItWUm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/8ZiC9yJ27NixYRG708iBtS3GS28V3J4C06T4EBZiQuKrP2nmwMi1yc8M3hCy/sRh3uMsyTaSOIytRgH5pCIEJ9fGqEiQ9lTFmjt3oFdXVKkrw+6dNoHpZqxbJs07UekfFXqyIngfeiDShEr5NBxpi6aN3RvXn91p4HyT5GnNBYki4MBB2B5UCumEQher+o2qYbj9brJ7ULOjo9I0icfz6KCFaVUXICGvRjBtf7tCvIPrknVzGs8Bs/Pkx+aLEP9t1D1WWhOWNQ9shjWPD9sgHsdxed3EoMYek9Jm09o602wu7Ipj8N9O0q3W6SYpSfcgj9/2dCl4NIcLhDaoP4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sW/rHxY9LmEZmiF0PWQ35fEFTLVHSBREM0Smp7NHIWY=;
 b=rTDe2e/vCj7jfJfFcYwmB+TWGsyk8DYhpdiqf0J/i7RmHTGQ+4pzaQ89ZEDYP8344cYQ6CjA4hz+ZeN2UmuVZ81zDejVK5XwLxEY5o1TRlZ4OoruZvwJ7S+pdVrdzWIO4MasdhATRKz3/rRXK6/iGeSZf6qUdGNyXJBL2Cs8VhW//Qec8/+XJ8cu0kt9Qi/PpuKFUV2uLQvmXuD0qjJVig68hpx98HpodOZbXwv17Nw4gLAjlG7qZAvrDdXQ0kTQ8vL24Zeg4BJCRKL+7uW/7H6xOxdFYf86aGouNBbP5rm6+snZWvRoTB903cAk1nBlMtmyoJrNOVyjm96wN3v1XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sW/rHxY9LmEZmiF0PWQ35fEFTLVHSBREM0Smp7NHIWY=;
 b=2PVItWUmP9jklJ/Q/8FNP/A23wOBwM+wtEkpyIUWD+G2UCpeg5CjTyHyLd4lpC0GbtZG/E7Q9pI67FMaBz/51XMK9PbtkUmlJo6tnYvNzi+9TZoZr2zknog9soWsRD1ihkRmXo/O4+ljtIVMXFVVr66DO+W8Ct1y7uo84Q9NGx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY5PR12MB6297.namprd12.prod.outlook.com (2603:10b6:930:22::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Fri, 7 Feb
 2025 18:52:20 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 18:52:20 +0000
Message-ID: <11da060c-fb57-486f-bb8d-4ef830a2addb@amd.com>
Date: Fri, 7 Feb 2025 12:52:15 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/23] x86/resctrl: Introduce interface to display
 number of monitoring counters
From: "Moger, Babu" <bmoger@amd.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 tony.luck@intel.com, peternewman@google.com
Cc: x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <80457612b98078bd7786c73f83775e4de86c699e.1737577229.git.babu.moger@amd.com>
 <6376ea35-4ce7-4ac1-967b-97f2728228e3@intel.com>
 <a6120ad5-c9fc-48cd-b2a6-cfb7ac33100a@amd.com>
Content-Language: en-US
In-Reply-To: <a6120ad5-c9fc-48cd-b2a6-cfb7ac33100a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0137.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::6) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY5PR12MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: e63f975a-f642-472f-2921-08dd47a88d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTVDeUo5ZjFnQ29HSlBndXRNQXpKVGgxN0o2cEoza21aOXNNaUF4Z09SZ1hu?=
 =?utf-8?B?d1kxYjZjbXI3NlhPdWtIdWswYjFHMkJSSVUzek5GZ0QrS0NFOUFZc3U0M3dI?=
 =?utf-8?B?dzg4bVBvZzFiSWNBRk00WTlIWlF2bHBzN3FWdzFFN3E2R25IR0JjekZNUy9h?=
 =?utf-8?B?bWZtc01MZUpnUU1JbFNHWi9ncGpMZThBeTVMbllNMW5WZERuR1pUbnl6bVFq?=
 =?utf-8?B?SzZBWU54Mmp0UVJiRlN1S1VtbFF2S2cwQXdNM1pib1oweDJqQnhuRHpmaDgz?=
 =?utf-8?B?TUJPbmNGYTNlM0pzenlGU0lQSkFRbVpyc2JnT29wUEY2WlliTEJaSTdBdjFN?=
 =?utf-8?B?STE4L0szdUl1d25qd2luQUJ0U3hHUUpWMUlrQTVPZHlsY2VyVDlJSjd3SUxp?=
 =?utf-8?B?UTh2NWNTR0ZFOGMyV2pCVStJL1lrckZKb3dZT0VNekg4UHc0M0l0VU1oNUo4?=
 =?utf-8?B?T3JtbnhzeVVranBwajBXTFZZL2xpdEhKdXpVS1ZRd1REY3VEU1pBVXNmWGZq?=
 =?utf-8?B?aFcvdm43NjRkaXcxRlU3VTdUSDVRUjFZMll0U0tCaVJKOFUrV3Frb1RZakhB?=
 =?utf-8?B?bCtNeXZuNWw2MUNXVGpUOFBBcHpBRG14ZzlEZVZrTElNTTd5Rlc2RkMydjlo?=
 =?utf-8?B?WmxkZDFGR1VoZEpRY05WV25sSVRGNHdXWXFDR291bWtmOVVVTGpFUi9OcllP?=
 =?utf-8?B?Y1BEVFhaUmpZRDhFcEdWcTNpWFJKbzhwQkc1RHRvcUw2TmJkOHpWakhkZHdO?=
 =?utf-8?B?dVdOL2NBZGtGQTVHZ3JxR3RxRWFOVUk5SkFNTTVGNHlVRmNKNUhNQlgrd0h0?=
 =?utf-8?B?clZaYmJlZjdSUVFJWk1LbVg0S2FBYlVsbCs3cmdpeDlOLzAya2xSOTBhSE5B?=
 =?utf-8?B?OHhVSmN2S0gyVTVRcWJmZmRSUjJFM0xLMTM0K3VwbmhFK0NHdTlnbjM5L0R3?=
 =?utf-8?B?M3d4QmlJb2k5eGFybmw4SDBwak1nUW5XbFFoRkJ5Q0ZPRE5rKzlyRSt4OGdq?=
 =?utf-8?B?VzZMSFZzVnRNemt4QXRGSDc4N2JTM2x2dDhDTER0SjVEU1YyOVVnRU1EZjRs?=
 =?utf-8?B?NC9aSEFPbFJlRFpvOHA1V3VjVjROMUtnL3N6ZitXSU16NjBLMkVobHN2VTk1?=
 =?utf-8?B?cnBYWUVrejFtUmJqUHpsSW1GWWVLRWVSNjlGUmY1Z0gzWmoxS1NRalBnZVF6?=
 =?utf-8?B?MWVVRTRMNFhubXJPRko4MmF3K3YrWjVCMVAxQml1V2FTQnNGM3NqSXZQZUhM?=
 =?utf-8?B?ZkZaUnBUd3pNZkF5ck9peDVpM293eXJDMnVZajF3NUNTTXVCZnBMMDZ1Wnpi?=
 =?utf-8?B?QjJYY2FJRS9ERXh2SHdhWThud3RLMUFXeDFjSlFVV1l0T3V5RUtPK0xkcmhX?=
 =?utf-8?B?NERVT2VvZlp0Vy9ONStNRmpHc0pMODA3TENnaFNrZnJoR3RvNW4zWDF4bDd1?=
 =?utf-8?B?dEJkWXpkRTdlMzcyVVIxT2pzaWxqVW9PMmhqYlZlKzVpT1o4b2FWVzJ1Wk5n?=
 =?utf-8?B?cnFGOVJiREEyMHo0d2NXV2c3VlBzZG5mUlQ0RmUwVUZNRnFaMjQrMzUxb2Vl?=
 =?utf-8?B?Q2tBVllEWDBFOUt6OFZVTmlRZTdLRmRDUnZpQ0RpTzd3QncwMFNXbFlDRUZ2?=
 =?utf-8?B?SXJjSUlhUmRUdEpWSnZSdU5HNXpDMVpQSWpCK0k1Wnp3SzBaRmFTbEo1TFpy?=
 =?utf-8?B?ODlPU1kwUWdkQWVQdndqeXFoek9IenJyVGt2R2hZa0xkL2xuK2Urb2dOUzVz?=
 =?utf-8?B?OTM2Z0hKUnZ2QzREU2FIMmQxR2hSL3BPZFJlTWZ4emxGcDgxRXQxWDVXMXdR?=
 =?utf-8?B?VFZJSUZueXlTZ3hyL1ZSN0plQXRWQ3hzeFlvVU9sb2JZNVJvN3VGV005TTA3?=
 =?utf-8?Q?3VF1hlCEyYw/Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmE4Zi9tVGV4aSsrVElYVWJIQ1ltQUZuVXE0aWNLWS9Pa2lvOFI4V1JtZU5F?=
 =?utf-8?B?RnQwZlpwcWRxVE5kM2wwRER4ZGE4UjE4OWYxZWFaa0RSSzFWVndCVzlEYU83?=
 =?utf-8?B?MTMvU3dJaDVERC83c2dtMnVZSWVrcmVOTzIvTWdZcTJCNHpxYktWUE02WndP?=
 =?utf-8?B?Rmd4Njd0K2N5ai9FRHJXRktsUkhtZktlLzYrSU93dDVVVDRhTDd4SzJDc0Q3?=
 =?utf-8?B?Z0FFdXVWMkNFNVA1ZHFFdGMyMHRQR0QwYmpCSForbXpDZjdqWVJPSisrUlFS?=
 =?utf-8?B?c1JvU1NEdzhGTm9PcDY1L2poKy9qMG9VSmpEWnhPdTJydGsrRzFBSXh6YmxV?=
 =?utf-8?B?K1hpMFRKTjZHMUhsWlRTbUROaVh5eUxZYnBqKy92M0FTQVI1MHFjNGhud0Ro?=
 =?utf-8?B?MGZXTjJwK0h4ZGtDeTV5S096ZXRWbjRacHJoNTBYem53T2dpMmdqb1Vxb1BG?=
 =?utf-8?B?cFVSVnZCVS9Gc0JtYnplQURpK2RkeG1mOE5WL0xsRHhmYnozRzlPVnpSM2NY?=
 =?utf-8?B?dW52TXdNRVFPdzVIMU9TcmFtL2dGaFpaNFlCMmdWUzVkaXhIRVZIQXNqbDhM?=
 =?utf-8?B?aitHSUttTFRGSWNlcDFaMnZabjFqZ3R0WWhCcmIxR3JTK3VudlBNUklKT0Za?=
 =?utf-8?B?aCtyNDFyUW1LVllvZU5jM3h3a0ZFd0VOV2xWT3NxYi9qaFVHS3d0NG41cWJQ?=
 =?utf-8?B?K1lsaVBuM1lFdlppbW5WdUVyYlpHdktrRTduT1VXZGdLV0ozalVXZE42OThy?=
 =?utf-8?B?c2NqZVp2dksza3BIRGN2OEs0QVd1SUJjNFh0eUtBejVENW05YlFEczROZzds?=
 =?utf-8?B?MVFWN3hyQjluYWZkYnZWWC9hYUY5MGpUbjRSRUNSNzZEa0Q0UUJVUGt4Zkw5?=
 =?utf-8?B?MHl0M2tpc0tTQThPc0I2SjhRQUY5SVhUcUxHMERGT1RxTzEwRVExNlREWUl3?=
 =?utf-8?B?eWFIbWFERkE0cnN2b0ZUMWhsSmVaclJvQU9RSHJsQnc4eDNwM0I0ODhraEUz?=
 =?utf-8?B?SnZxdTM5WXdRYWtYN3dTQzR0dXVVNjRRSC80UTg0YkxleEIwV0JrRUZtL3pi?=
 =?utf-8?B?TUFLUVlVeE11aXpETDQ1K05iS3VzNmwvQVorc3Q0Qit6VUJiU1VEVW9tNWxo?=
 =?utf-8?B?RDN6K3dvdkliOWwzVHFMVWJFSzRlWmFOU1dUdkx5dmVNV0JHVE9DT0E4dHg5?=
 =?utf-8?B?OWdaL1h1TWV0eE1scmR4UmhQa2FhaUhEdk84ZkxtTTlxSGlzd0Q4UEJCb3E5?=
 =?utf-8?B?K1FDRW9rMlRQVDhnSzAxTk9Eclo3NW5WNGVCalZRNEw3S0ZRUzdScmYwU3h1?=
 =?utf-8?B?NHpmd1B0NW1yVmZHY2R5S1ovcXVPeHhEVWo5WDFQLzJoakNBMk5Db2dZbHRR?=
 =?utf-8?B?OG5NaFdtN3dSbXprSXBxc1FwTzl3TkhVaHBySG8wcmdHVTAvazZSeVFnSnF5?=
 =?utf-8?B?UW1HV0tlZmp4MFFRRzRaVzVIdUZZT0luODhjQVZka3JaZ3JVTVZtMkFicGpU?=
 =?utf-8?B?VFpIMWNvVWUycHMrMTU0dlN1eDdUQVJHK3RMdWRMWnNGdHprdzVQcFhhZEN3?=
 =?utf-8?B?SzhQb0xQSUV0ZHRaVUlTOWFyd2oxYzlhaWgzdDk2ME5Obld1bUtzakR0Z25q?=
 =?utf-8?B?NEJUVklLYnBKRTZGNS8yMll1Um9iWjhoZEZwT2d1NjhJMjNvU21md0R5cWdO?=
 =?utf-8?B?WitjVkVKOG83TnBTdXU2MWVNMVBVa3VSbVNXQ01FZ3V0bER0MDJON2Z3c0px?=
 =?utf-8?B?Z25vR1YxOFFqMG1heHNobWZaMGFkbk1PMGd6dXVvVFY1Y0x6c1lhVXRHZHp1?=
 =?utf-8?B?aDA0VnJ6ajRRQ21jU2tlWXF2V0h2TXFLWlRybUhldksxMWgzRlJrdURZWVBJ?=
 =?utf-8?B?SkttaGx5ckhzYVdMWFJVcXhwQUtWYVg0b2VQcFFGcE9xK3hZOVVWY1duUGs1?=
 =?utf-8?B?UnhjTy9ZQlNRcXZvQVFIMHVHdk1KN2Q5SnBSWWdlWURSdm9qcmc3NFZ0cmdS?=
 =?utf-8?B?cXltNkc2SVpMUDZ6d3UyT0ZIRXJLR3l5Q0JVcGJ3YjF3UWF2WHVFYlNLMDJo?=
 =?utf-8?B?Vm9wVkdmTnp6SHRCWFE1TnZxdzBaSU9pMXBJYXB6UHE2bzNtTUxjM0RjMXFa?=
 =?utf-8?Q?7BzK25i9+CXfJpgA2brT/El5L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e63f975a-f642-472f-2921-08dd47a88d0e
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 18:52:20.4523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3o2CJq50GPd1DmCvJjCy3B0n6XRtIgG9m0d1EWDGWA8xRG6Bgh1Lpz7tt1Unly48
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6297

Hi Reinette,

On 2/7/2025 11:18 AM, Moger, Babu wrote:
> Does this look ok? Just added domain in the text.
> 
> "The number of monitoring counters available in each domain for 
> assignment when the system supports mbm_cntr_assign mode.
> ::
>    # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>    32
> 
> The resctrl file system supports tracking up to two memory bandwidth
> events per monitoring group: mbm_total_bytes and/or mbm_local_bytes.
> Up to two counters can be assigned per monitoring group, one for each
> memory bandwidth event in each domain. More monitoring groups can be 
> tracked by assigning one counter per monitoring group. However, doing so 
> limits memory bandwidth tracking to a single memory bandwidth event per
> monitoring group."

Revised again:

"The number of monitoring counters available in each domain for 
assignment when the system supports mbm_cntr_assign mode. For example, 
on a system with 32 monitoring counters:
::
   # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
   32

The resctrl file system supports tracking up to two memory bandwidth
events per monitoring group: mbm_total_bytes and/or mbm_local_bytes.
Up to two counters can be assigned per monitoring group, one for each
memory bandwidth event in each domain. More monitoring groups can be 
tracked by assigning one counter per monitoring group. However, doing so 
limits memory bandwidth tracking to a single memory bandwidth event per
monitoring group."

Thanks
Babu
