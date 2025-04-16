Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCA028373;
	Wed, 16 Apr 2025 19:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744831790; cv=fail; b=ccRdaE40iAsNKdsrrADSHE1GOyXFZLhHlM1oX3BPwxi0NcabWXp3nhbloGADMgx/S9sHH3eYkyT4jwWFvGO60gQUdgDVkdgGkzfGHdnNK1/h/WD/kgB/teufiu0AYMmRm9QxVyPnh6omravWKtObLVVhluL9YE4hpXv81JdGYGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744831790; c=relaxed/simple;
	bh=K+w2NdO1YjmHGy5tqPN3JD3keDmvn9yoCT1ie7YWI2E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PKzbEXi6hrVy6S+IR/WqAdujCNuYVrW1QvIbkrrpkmjrx2joaIxUUgG3IDcCnsOCipqAg6vJe7SuS5wkNJ/7EpdudoHq4KeDAV6O6kAofyKR5j3bkeV5Rw2CNDYOdPY/bp4F5W88gqHxD31/IsW7zEZap8QKJkAZmWP3fNd5jU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JmYmYnq4; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JmYmYnq4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksx0xZI7FGPl90R3+y6Bo9Ng7wwwo6u2HVvh0xZ8wkpAaO4xXSlx2kiGbl+V1VB3EsfeiDoja0F1CpwO+l2gVNIcoHTB8GrmJAmHhXxQSjX0453v6v0j9Q1kBVrOf2aIfw4yA3nGEFtL4AoUoezaYJB/+R0E2FLQEx7WYkAD6SoEGIwYxXiaxpRoj73/Jko0J5+MNLFgWNCL7RNsmP954caFqvkmeNjDK5h/MvCxRdCVc9sxlb5bqplV9O0MQ4hRWUyLeS8ycZ9PNCgpdFgqmYjyI/4LUl4RwyY/5qsbW8XDrkrau0M8BbbCDTlfonad+2xTJj/JKsnXYFzpfn97GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOmOQKsv+UlbmaCcWIom+YUpSqRfRqX0IoGl3VZ6eRc=;
 b=FX4odNZxv01e0n9i5km9kwOmtZviCB8hjmItrnLPd7yvv5izQDfQ7o8VwmKPpA0mRPH1ymA8HTg+muV4dedIyWov6RvrjfrhqBFpkiAVkhDMUQq1lUtGqCMzL6FhzSqeCO2dlA5J7lv9Ttg5A3Kwa28U0ZDLIVi7u502Me1LR/Uuqg+b5PeXqmCplBPupP4svHeN1scOvP5CrjfL2EqA24p56bKLe4jMhU3wamsLzL2k7Afr53iEs90WaViUOf0Z++kwkvImf0x0ieqFt6FRQwm0nPjwwCG/Vz9X0q3Lw4hzU/EkzeEssaSLWB9OY/R7COZKkxRD9ZyRNVkyZY8Egw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOmOQKsv+UlbmaCcWIom+YUpSqRfRqX0IoGl3VZ6eRc=;
 b=JmYmYnq4fGRkc4NRAR+cjpDTXqsk82yix2lT1TQ1zJWUy3GqLeugbCb5gN/z3c3FX42zC+AquLlt6ZNjnZ9FFWY82j5gkqqOPkBh6tqsTWpDk+oIlQoimW5I7ObUsmCs0tzxNfOleZ4HOPzYJQWeAZJvmT5KnClEcxm/eQLRhOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA0PPFC855560D7.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 19:29:46 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 19:29:45 +0000
Message-ID: <1bfdcaed-35ae-4754-9b1b-f86ae10f9cd8@amd.com>
Date: Wed, 16 Apr 2025 14:29:41 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 14/26] x86/resctrl: Add the functionality to assign
 MBM events
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
 <22889d46484b2393d701ce83c82f253c1454216b.1743725907.git.babu.moger@amd.com>
 <59fbd325-04e8-459f-a724-ae0c4536b1a5@intel.com>
 <3d31259c-cac0-4b96-883c-6d2e8e427988@amd.com>
 <efa7aee8-d1f3-4d15-9a6e-09b19c296e47@intel.com>
 <b8ad6ebd-405e-4ce9-99ed-1658c3b94f73@amd.com>
 <da854bef-a69a-4d61-bae6-3e6aa51a8081@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <da854bef-a69a-4d61-bae6-3e6aa51a8081@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0112.namprd12.prod.outlook.com
 (2603:10b6:802:21::47) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA0PPFC855560D7:EE_
X-MS-Office365-Filtering-Correlation-Id: 478158e2-a5b2-4145-70c8-08dd7d1d0b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGxRNVZ4THByUHF0bWlReXJDWU8yc3lPWUxiYlUvSTNKOVliL1RLK0piSGNK?=
 =?utf-8?B?ZUFRN0NKYS9GamxYZTZLSVZhb3VyaXhpcjBXU2tXS3NIZGZ3d3lDM2Uzcy9x?=
 =?utf-8?B?R1RCSWY5Y0RUckFiUVhtaXBrRnI2U0J3eWdFNWlrMU9PNmp1YS9HeUliRlNp?=
 =?utf-8?B?eGhPa3hOa2JSSURiQlNYZndteXdKWVlQSld6LzdDMktTVERjZWFYcEFEKy8w?=
 =?utf-8?B?NzdPdXNxWVdURGcwZE96NTlTeW1XeTZIQmI2OXVZVkhmZnBpVWlTYmd0SFpr?=
 =?utf-8?B?UnR3VjZydXBYdnROMUtHc2VBM0MvNUlnTi82SXBKNlNDTkVMelB0M2RtNTEz?=
 =?utf-8?B?ckdxZkVvQ3RCNEFmcnNhTHBjaVdKVit5bklmYitDckpISk83ZDZYZjFsZlk4?=
 =?utf-8?B?REZSc1ZNaEp0SklRWUNOTEtDaDFQRXB2aHZTUnhyc3dXR2cvaVNEajhhbEZV?=
 =?utf-8?B?K0IvNGkyWHBaMmdnUmhyWDNjQ1Q2NFZMOTNSTEtEOGNGWWlZa2dwTTd0eHp1?=
 =?utf-8?B?WXZsMGFXaHQydU15OTEyUTQ1QlNZNzFvV2ZwY3NTUmt3NVpyRENCQ1pKclZS?=
 =?utf-8?B?d3A4K1huMkdROXN1T2Ezb09NbXlKNUY3dkxOWk81cExhS2dhNTF1Uk1udzJV?=
 =?utf-8?B?eGtGQ0VNWWdPMlBIVWlnU3ZpeSt4M1VQcFJPREdza1JIaTliNW9hZEhIYkVp?=
 =?utf-8?B?WUFyV3IwVUQvSXVZeTdsWGNhcURVTGNoMmtjSlV0dk9FOTAwM0xXL3ZEanZt?=
 =?utf-8?B?THVqSTZhaGRQMElGVHRoOTBFZXhybDRqMlNGdVRhWTNUbm5LMDdUMnExQmxD?=
 =?utf-8?B?QXFSQ280MGczdXlpZWlyNXFvZTRBT2dpVWhCU21CSm9FbG5WMWprdHZkQldy?=
 =?utf-8?B?M1pFcTVtdm96ckFJV0N6bFVmSHJYb0gybXJDRHpsMDJIUCtqYmFUVHc0WGJV?=
 =?utf-8?B?enJraDJLUzNESExyOHJ3TGVTNEVkNE5RWm1URVVxcllpcnhMS25kczAzbGRz?=
 =?utf-8?B?VnIvOXVsTm91dUFYUFg5UzI3QnozOGlKM0kvQU8vOFB1aFFlaXVsQ3N3OVpw?=
 =?utf-8?B?VWNZNUNpSkZTVDhsQXpIbHJPcForYlNuL3QzY0pBNS9QY0JsRFk5NEluMDZK?=
 =?utf-8?B?blFGdjQwbTg2eUdXQ0lzMmt0WUlKaGxrZDFybjRUbXBveDBTNmQ2WmM4R1V4?=
 =?utf-8?B?ZGpkdnJxMGlVYWpuaWRENm9rSHQvL25Cb29HenNZMnNRWGpKUDVTbGpoam4y?=
 =?utf-8?B?QVNpQ29sQW5CY2V0MGJvSW1aOUJQTjFUUkZVYllIcytpUmtVVE5UVDBNSHd1?=
 =?utf-8?B?UGxmaFd4YUl4My9PRjRlZXlqcU5rQTdmeTVpOEp5dnptSjkycjduRnNLbWtZ?=
 =?utf-8?B?K1JpZVQzNGRqTDl1SnU3U0pSNnVWWlhDK0JDRG9wMHY4WDFxdUVBbzlodHpP?=
 =?utf-8?B?VmQwZjJJNjVRSHVvaGE2eWZPb2lhTlRkSysxWXlXRFdoUnJrVGt2TWI0clpk?=
 =?utf-8?B?RnVRaURyb3VGRE1LUmlNQ0lLcStHeWhOWGd1dWRacEZnbjYzWjBxbkYrVGVk?=
 =?utf-8?B?WkpoOWZJazA1ZFIrUEdhNHltWjlMdFVGWmF2ZVhFMEw3QTQwUlNRL1M0dzli?=
 =?utf-8?B?STFFajZ4bXNScHcxWHZ4RkZFSVRUblJUNmJQWDh2TC9EL0dkc0xkUTNWdEJO?=
 =?utf-8?B?bW1SVVVHcDlCL2RQSmtpcDFwKzAyd3NkbnpnOUJMd2RYR00xU29wWVFjY2V4?=
 =?utf-8?B?ZXhKaUNlZi9BOGwxL1Jhd1RBNXBQeXFBZHVFbFFDNUVnZG5UQVNPaUpta3Fv?=
 =?utf-8?B?RUlJdzR5MGRaOWo2Y09TbHFiOEVtSUx0Tjhmdk1qbDNndFpIUDdBaEZGdmZy?=
 =?utf-8?B?ajlIdGNXMThnaUhtVzRxU1pYdkttMFpZelBJZEdNTXhlNVc2YmJvemRUTjZq?=
 =?utf-8?Q?OPukynz6FQw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnM1enJxd1JyUWFRa0VJYkw5UHJKenlwRlArSWMvaEV3Q05hS1pHaHBoOU02?=
 =?utf-8?B?cWZaOXZzM2lxWis2WWxvYXVLZ0h2NzkycWpKd2psQ0orTExYVDFGYnJGeThk?=
 =?utf-8?B?aWQ3dURGMUc3c1k0K2syZTJNc0F1M1c0VEJuNVV3TmVaSklXRDRWS1cwTThr?=
 =?utf-8?B?U055TXJLQ1Q3bFVTd1c5UUVBMzlieGxwNlMxV2hWZE5DR3JSb3loN01tZ21X?=
 =?utf-8?B?b3MxYUg0MzVLaG92S1F3QytGSDZkNTkvcjNrZTdHZmhqcUZONlo5aGh2d1hx?=
 =?utf-8?B?V3AzOE4vdFJwWVVMakhacFlKdUMwOUtGUFIranZvc1NlRU0wSXMzS09BaWti?=
 =?utf-8?B?U0Y4MEhwYnBFS3FlY1o2cDUySGRMYlkrOHlQcWZyZDlxWTJ1M0hUbFVzUk1u?=
 =?utf-8?B?WVU4UTI4YXo4cVdMayt0VEJxKzBzTEhDaDRVcEJlQU45Nk1sS2Z3Z1lYSmJp?=
 =?utf-8?B?bjJwN2pWTEVDelhsa1kvWjQ4VTkxZFhFUUxQUThXSTc2TUswUFhyaGMva1g5?=
 =?utf-8?B?RDlPNjRadmkxamJJQzdXb0VQY0pFOUJra3FpRXRCNUN1aS9vQU9WZzR1aUQr?=
 =?utf-8?B?TjZMaDZyb2Qyb3VQZkUxUGliMUJGU1BHZ21xQnRsNDBWQkd2b3RVeUtrT2ZU?=
 =?utf-8?B?d2ZrU2lNMXZSREMyWFRlMXNrRVJCZlowQkV6QlozMmlkbFMwaUd4N0VEQzIz?=
 =?utf-8?B?RERod1Y0NWt3NUdVU0pXV1RiWit0RUpwU05NaFFjNXJDdDMzTXZ5MVFRU3Z0?=
 =?utf-8?B?ejNJZ0g2bFBNaFZacm5NS2lMYkRFZXdDcmJGd09WZytmaG9UNkRWQTQzTDlY?=
 =?utf-8?B?bEM3Wk1sSmtZdEJkNkdIazlWYThIUU50UFhPNGZjcEszZmUyMTNqZXNSdERZ?=
 =?utf-8?B?a1VucjlrQS9GVm1JZ3NrZlB6ellMQklxbG1IL2h5eHJYSWVrVTJ4TXdZVXIv?=
 =?utf-8?B?NndoYnVVYmlBSDViVGlPcnhERzJrVkpNdHdMY3EweWVVY3E5NE9mZnZFMG4x?=
 =?utf-8?B?eHQyWjVBcVlhVEtadWoyUTZCV201UE9LMldYQ014bXRvdncxQmtSZVhJWnF5?=
 =?utf-8?B?aHdReVVRQUJCNytLWUUyRHN3NFpjWC9sZ3FhRHRXRVl3ZjBvNUZSMjIzaWQw?=
 =?utf-8?B?OFlXYUxmWVNSMWdhVEVGTEMyZXcwZjFKdFoycnFPZzl6UWc0Yi9XcExERXVV?=
 =?utf-8?B?anVWTDNkWjBJSEhFL3Q5T3dQOEt0SEw2cHNyZnd0NlBHcFg0MEd6YjVsdE5n?=
 =?utf-8?B?cjgwZUhHMURXdzQ2WG9pOVlYbzNRNkgvQUl6ZlBJTmE0dUxCWUdtSWhEaWUy?=
 =?utf-8?B?UDVMRTZrcmVlWVJjNVM4WDhwT0IrcXZ2ZyswZ3dMUmV3UGxHa3dnYjFyVUR0?=
 =?utf-8?B?WHZkVWlBaFR6ZmR1c2RGQVdEWmVwVzRidzB3MXlIOHBrd1lTRDg1NTdkaGRG?=
 =?utf-8?B?UUZLYndkU2dzemk1YkJQdHdlL0tUVHdmRGFJN3luLzc4Nmtpc0ZBK0kxMFdk?=
 =?utf-8?B?N0hkakZzeUtqNytoWllQa3B0V0p2b0RtZ2JubmZkSjFzL1F3VXRkUWR0a1M1?=
 =?utf-8?B?QUk5U3JGVkZPSDhjeFRNWjZCc2l1dS9zeUZJSWU2MVBjbGNVdm8vQ3dhb01a?=
 =?utf-8?B?TEsrb2s0aDVGMTFrQ0thQ1pseDNMbGRjTHc2TXFPaXJ4alo3d1hSSFNqSTFk?=
 =?utf-8?B?TzFBYjE2a2s4TlNuMXFDTnp5MWxSQjMwMC9pVEUwTWRKbUpCMUkvRzFXUW5i?=
 =?utf-8?B?SE5xRGp2cTdrVnIyQndPalExNjN6aWZIN1NoM08yT3ZqcjVmbmd6bmtlSFBV?=
 =?utf-8?B?TVh2YXRjbnhGTG5QbVVQb2dORms5cG5qN1NEQ2xmd1ZwbW1PL3lEdUpnTTNV?=
 =?utf-8?B?R25sb29McWZUbkZ4T21HYzYwRkY5WVZLMytENTdrdVdBUllYSEVvbmFGdkow?=
 =?utf-8?B?RUpuVHdxYlRqOUFuUjh4aldqLy9McEZNbGFkK1dNb2NXTkdPWEtyQ0VTeCta?=
 =?utf-8?B?Uzk1NUwzUHNyVDkrbVYrV2dKQzZqYy8yQUlJaDh5WjRXTnlWdUNvdFNnZ05B?=
 =?utf-8?B?ekIvTVJUbE1YdjNsYUpBV0hDSzdZc3JPejRPS1U2UVRLMHd6TzR0WDUwVDRV?=
 =?utf-8?Q?+qLMlz4eSoYfxkZvRHW10GIFO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478158e2-a5b2-4145-70c8-08dd7d1d0b82
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 19:29:45.8727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyTPz88d6dI7bPbFlG2WtThlPdhga/zSibtikW6QUQDrvUQfoMUV0Bim3BCgm0Si
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFC855560D7

Hi Reinette,

On 4/16/25 14:02, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/16/25 10:09 AM, Moger, Babu wrote:
>> On 4/15/25 11:53, Reinette Chatre wrote:
>>> On 4/15/25 7:20 AM, Moger, Babu wrote:
>>>> On 4/11/25 16:04, Reinette Chatre wrote:
>>>>> On 4/3/25 5:18 PM, Babu Moger wrote:
>>>>>> The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
>>>>>> can be assigned to an RMID, event pair and monitor the bandwidth as long
>>>>>> as it is assigned.
>>>>>
>>>>> Above makes it sound as though multiple counters can be assigned to
>>>>> an RMID, event pair.
>>>>>
>>>>
>>>> Yes. Multiple counter-ids can be assigned to RMID, event pair.
>>>
>>> oh, are you referring to the assignments of different counters across multiple
>>> domains?
>>
>> May be I am confusing you here. This is what I meant.
>>
>> Here is one example.
>>
>> In a same group,
> 
> "same group" means single RMID, eg. RMID_A

Yes.

> 
>>   Configure cntr_id 0, to count reads only (This maps to total event).
> 
> This will be one event, event0, so one counter assigned to RMID_A, event0 pair.
> 
>>   Configure cntr_id 1, to count write only (This maps to local event).
> 
> ... event1, one counter assigned to RMID_A, event1 pair, ...
> 
>>   Configure cntr_id 2, to count dirty victims.
> 
> ... event2, one counter assigned to RMID_A, event2 pair, ...
> 
>>   so on..
>>   so on..
>>   Configure cntr_id 31, to count remote read only.
> 
> ... and event31, one counter assigned to RMID_A, event31 pair.

Yes. That is correct.

> 
> The example reflects that a *single* counter can be assigned to an RMID, event pair.
> 
> Considering above, perhaps changelog can start with something like:
> 	mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
>         can be assigned to RMID, event pairs ....
> 

Sounds good.

-- 
Thanks
Babu Moger
