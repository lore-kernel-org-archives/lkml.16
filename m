Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F65C224898;
	Fri, 20 Jun 2025 21:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750456647; cv=fail; b=pgdp73YNw64gQYSzv7J3Mlg9DP1a5UoFbL3eR9rhcVhojL7xPNmsXk2JYeVk/0RVxrk9RUMBXaLeDnIXz7tEXSJlFLK/idAGWwq2mcHkGtIUNnmi0lTiB+q5be+w92beajqTNpS4y3tjYwV6zUp7KgoFSMpVwUyZWGjewrplalI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750456647; c=relaxed/simple;
	bh=wlvi7PO9R7Rs7Ffbw4OeMvFD+Vh5yKear3wOgPjh53w=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FhHuiyE/exNGwfeNNLZdiu00tpbRZk8+/t2O3aOebVFFKGx6Ob0bue3OiLIzKX086NYh9Nbb4QyRVzKyfTlGbpmmi+yYiZT9faU4Z2grxERhFLRuhrwzrHYvXoHiN+upi4PUFHWNA4BhRcHrqD5A0jmC7yHg3YNA6I4vGUkiLJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LDVx4H/2; arc=fail smtp.client-ip=40.107.223.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LDVx4H/2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sxo09WAz2pqdXXqiJyKjvpb60Eptj29bF0hAMr0nO/li7D6jx8SHv3A3dHdv4mChGyJ4Cpwl9b2i9qtfXb61SAY9AJKzjQkRAaI/RnIFuIIRFn7gyI173jXhXNopq/hVj2yy3DHy07t+Z8iaOD/wWWVdm8DiQD1FREQBssqnL+2sN6yE7ha9pjYCfVd17SbyQveGRo8P2vTP9I+bEa6Fh2Be3EhaD4c6F1aqPsKKjRnREhOXLax6lHmAn2Frmgve/7B/d0hhqBVlBzUkIPpl9NlHQCvjJ4bGMGP+X11KbUDkBOXN2lzoczRS21PHdblX4lh1B6ti3llXpVwZBHPwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6D/jCa/BsowZRzCPuErlle+/U4GPIZAJJThGraRKT8=;
 b=fRA9XMcZ/K4pot6tVOYU26pdWH1HXe0VHORnQ8DBqwQKN97jumRyRp8dU0zwMfTPqw1w6i3cChyqzfEviWDMt9oWpzXBItOOLxR3KKU0VlGRsrfUBJ5ezIEV9UT/38iRngTEXEy63BsXRgO/S740rOcnJeaI+UwX+r6ZcQs7MSD7+bjjImJTk7Cqbe3/mL5UuG9vl4SKNvVwGxCioBZOkFj1p4HoCI/sjPPbxQ0Q916XDYAUpd0wOsmgvgHbF2yOwemg6wLIO+vCLTwwXj2sUb2G3cKacLd2043x+2je/I4EA3Y0+y/F8XwkGcY5r/utuREDjb8HPVy2By9PJ2oFAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6D/jCa/BsowZRzCPuErlle+/U4GPIZAJJThGraRKT8=;
 b=LDVx4H/2uUB51HJ6kuPzEDKvelNfQOtJQ9lrzvoonhyHTi9vkpKteW8vMzKsc5Eo3+iYi0ZLueD8fCECF6+YTX85LgaIeDDQjVuKqZM/9PWZWgeFqrSgHHifCnF36w6/+Ix1Yy9i2j+fmMy1ioorGH9mlbmTn4T5kiHWb/Qwa+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Fri, 20 Jun
 2025 21:57:21 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8835.026; Fri, 20 Jun 2025
 21:57:21 +0000
Message-ID: <69950bd1-d0f8-42f1-9aeb-07afa2cfb155@amd.com>
Date: Fri, 20 Jun 2025 16:57:16 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <bmoger@amd.com>
Subject: Re: [PATCH v6 5/8] fs/resctrl: Add user interface to enable/disable
 io_alloc feature
To: Reinette Chatre <reinette.chatre@intel.com>, babu.moger@amd.com,
 corbet@lwn.net, tony.luck@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, rostedt@goodmis.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, perry.yuan@amd.com,
 yosry.ahmed@linux.dev, kai.huang@intel.com, xiaoyao.li@intel.com,
 peterz@infradead.org, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, sohil.mehta@intel.com, chang.seok.bae@intel.com,
 andrew.cooper3@citrix.com, ebiggers@google.com, ak@linux.intel.com,
 xin@zytor.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749677012.git.babu.moger@amd.com>
 <b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger@amd.com>
 <3bec3844-7fda-452b-988f-42b0de9d63ba@intel.com>
 <93d010d7-4fc2-46ee-965b-7606fd2cd5ee@amd.com>
 <93df95f2-b37d-436e-9872-b64f14256914@intel.com>
Content-Language: en-US
In-Reply-To: <93df95f2-b37d-436e-9872-b64f14256914@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0152.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::20) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef22aad-9a44-40aa-8cc3-08ddb0456eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXRuOUpXSVNkemdYdWZYck12SkV2WEtSL3IwR282aUE2ams2eFltcThvWC9B?=
 =?utf-8?B?WHlWNzVqdzJHZjhrWUxkLzBYakJ2TFhjbXBZWjQ3U3BvVk1VWmhXalBvRU5Q?=
 =?utf-8?B?VEJhYWZnSVFiL0t5eDlkZ1JNL3lXUzlNYXRRak8rZktuODZkbE5wWUpJYUN6?=
 =?utf-8?B?MzZBM1REempYTWVFRGJEeGZSeVU4OUdjZ2FrL2tYblVvcDBRcGpLcTRGLzAx?=
 =?utf-8?B?RlVjV1JsRGt0eVFpczE2djUrZVlheFBaYVZLRE5WM1lTL2YrbDhENDJ5aktm?=
 =?utf-8?B?UFhvd0FTU2FEbkUvSjRndFBZb3NndXgzVHgvVkcycElib3V0cTBJZTF4Y2pB?=
 =?utf-8?B?Z2JIMGIzNTNZUkNkeVVEY2t3VS9BTmxqb0xrdXRCaU5nNHhsSEZXd2lXbVJs?=
 =?utf-8?B?ekkvYS9TY1dHR1pOYW9QdE5ucS9yNFphMkNETEN0UjBZdmZ3UWZpR3NGdUta?=
 =?utf-8?B?N3pLeENReCtud1BQalVrcUZONDc2TnlSYUhDYyttYk9yYzZEeW9YcmVoQVNF?=
 =?utf-8?B?SENJN3A3WEUveWJ0R28vczdSWVYyb1laK1FudDRYNlU3VkJ6Q1BIUUpzaTZQ?=
 =?utf-8?B?Z0FrdVhjOW0yZWtiajlzeVBvQUZaRmtIYkU1RlpIOFFqSFhBWEd6VHNYcytH?=
 =?utf-8?B?Uyt4MWVtQmxoakZ5NTQzWk5OYmtrV09HakRyMDJlSnV0dGNTaTVZNWc0QVc4?=
 =?utf-8?B?T05XeUQrbmQ1RmtuOVc5VGFzemRXenZiVDBwdzFVcDltbVJTMWhSbTRPblBp?=
 =?utf-8?B?bHFURmQwK3kvOTdkRTNTWXBETGpkSXJGQmhndDlDVjZJeVNYVzk3Z0ZHOHlC?=
 =?utf-8?B?eGhxZDdzR09paW1OU3ArV0FYWHdSRklkcEF6c1NQcDJqbUxoc0RxWXI5Z1Jk?=
 =?utf-8?B?c1NKVTFaZWFndVQvcnJPMG9WT1JxN2xNbTdZRmFWUStLSWxmVUthZytVQmVt?=
 =?utf-8?B?TjRGclRKQzJtODV2THJkclJoazUrSWtxekNPNWtpK2MxTU9FRlZ4czBzMzJu?=
 =?utf-8?B?Ykt2anpUamxGV2o3Y0N0dDhDZjlPK25hcHI0bVNOL0p4SzV3UGhza296Zytz?=
 =?utf-8?B?enpUVnhLVTFmaHpqdlhkc0hVUlJxSkZ1QlVpb1RNRVN1V290QmM2eEZGOHRT?=
 =?utf-8?B?dVM3Y3lUUTBDZ2dkU0RSVDgveXllVWNoUmtBL1g4c2NSUVdtczgyNnF1Wm8v?=
 =?utf-8?B?Rld3SGVrQlUrdWtJTnhVSUo0aUN5K0VpdzVwTk9WS3NKQ2RvYzJCQjNQVlYx?=
 =?utf-8?B?ejBNOGZhWkczbWt6aElpMnRNRFRlL3dYUko5QWVwcVBraVNIaWJwQjNiV1Nl?=
 =?utf-8?B?N0NkdW44QndZZHFnUnlPamloLzdqZ3gzZ0d4M1pWNHQyTUVVckhWd2xYeklw?=
 =?utf-8?B?N0tmT09aZnhVNkJEZlkxMGVmeFBWL0ZZTkxFL3NleWZ2TlBveUJtWFU2TEtB?=
 =?utf-8?B?cDZjaXJnQXRsNVA4UUhXMDZ1cm5yRDRJamdNaENnY1dpZVRNb2NMRTNHRld0?=
 =?utf-8?B?TEVMd3VzVDBUQSt2UTZqT0NJTE9yWElhY1Z2cjRra3VKL1VMSDBQQ3d4V0h2?=
 =?utf-8?B?elpwN0RZOG1JL1pZRUdqdUxVaVBYUlNLT1VIN3J6cWs2MFFqOHU4RlN4dGln?=
 =?utf-8?B?RDUyekVld21VbVZ1RDdDQk5jdHlIUTRVY2p3VjdBNjRVYitUL3h2czEzcmw0?=
 =?utf-8?B?ZWdtT1phSnowMDFNd3R4bVdQQlFuMEZLa0pTS3hEMVRZRnIvWmVPRnZGek5K?=
 =?utf-8?B?alRoY2NZRG8vMThrSHdtSFRGSkFvYzBPYWlpMGdwbGxmeTBiM05VSzZtZVFo?=
 =?utf-8?B?d2pGVnFlVFZoOW1wNTZqZ08yQlBlZ3RGZkJaZDBSUHVjRVJHM1dZU1h1VVJI?=
 =?utf-8?B?dFE3N1NRZHlUY09UQmQ5TkI3Z2IyY0tuSUF4bytiYVN6ZWg5aXJJSDVBWDZ4?=
 =?utf-8?B?ZXo0YkxRNGd5RzR0R21SQ01XWlVzcWhrek5McVAyaUVyejd0WnhCTEg4OXZX?=
 =?utf-8?B?RC81Vi9JU2JnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1BJaGFqeTkxRGN0MlpQbVRTMUNaTHhuRXRmRlJlV1ZqRldQSkN5ZFdIQ3dC?=
 =?utf-8?B?VTREbDhaQjVvWDNQZTVUVHdvb3MwdFNTN0hjRDBJWUZqblVRK0hEeG9aZDlW?=
 =?utf-8?B?dWJaeVMzT285RzBXbGZ2ckFPdXc5Mmk1Uk1lV1VMbkNXWUpyTzNVYVFaZVBu?=
 =?utf-8?B?UTdlcThlUGJjY0NzZ3FLUm1hR0NzS0JRVjNpa2kxdGRlYkFManVpT05rc1k0?=
 =?utf-8?B?cjFMOCtxUnRRTW11SWRaS0daUGRhZ1lsNjdYOVE0d3VpVlZWNnRjNW5Udi9P?=
 =?utf-8?B?QVc5S3psTEtQcm1jZVZNdzNSOWFHajlIN2ZQOHNseDhHZElSSEVhaGhxeGV5?=
 =?utf-8?B?Y0JYdzBpUVNtZmdMc0luMXRNNlF1QWt6S0dzQkdJdllxYUUyV3AzYm5zdUdm?=
 =?utf-8?B?dWY0dVNtS21pN3ZSRTBrK3c5MVNXSjI2VFNOdzA4VS9Fek04eGhKSjZBVkx2?=
 =?utf-8?B?SFlOVk53a2I1UW5aSk9vWTR4ekx1ZnpUVXdaOTE4MzhXbEFaaGRraHBZNGdR?=
 =?utf-8?B?RHQyc0x2L2txaGNxVC9OY1p3TndvYk5IZ3pjRU1MWTFETE5OR1FXT3RKQkpL?=
 =?utf-8?B?Mjl6ZWtBZFVOSTRlTzJ6MGdTOU1kaXpIaENzTVVjWFBxbmFqS2lVZ0ZYWEZ3?=
 =?utf-8?B?Z0F2TndWTUUzWkk2ejNITk9iNUlRMCtGWHZwZEt0QWt3ZThPRnh0Zm16UkpN?=
 =?utf-8?B?L3N5SmY3LzQ1R0dyZ2dZQktqSjVmTFRaVndHLzdzRWJjVnJUVnV4ckNZUzNH?=
 =?utf-8?B?a0FYQlppYXRHcnF6NGEydGh6T3I3bUEzY2hHS0pGUWxObTJISzh2V2loYkZj?=
 =?utf-8?B?UXl3Nm9RQWtUa0diS3B5cmVQS0Q1c2x6MmlBQ2FTYjhuNy8zV1ZUUDg3MytB?=
 =?utf-8?B?S1BuUjFudlVBV3d3VFBmSzZuNVMzRUJxekpMUUlKS1VsZzlFRkl0NERhMDQ5?=
 =?utf-8?B?L3JSV0wvV3ZpUzhURk9aL2JuR2J2MU1FbFFOa1RnTVVnSUovbXFrUjRHYmo4?=
 =?utf-8?B?WVdmVjl2dHpqR0taWUh1eDJnUWdsSko4K2RQaU9LYWEvV2NaOHViZHNwM0NF?=
 =?utf-8?B?RVZWSFNMTFYvQmp4S0oxQ3ZZNjU3SGw0SUxucE84ZzFGOUw1N05zNGZrWEg5?=
 =?utf-8?B?dzdBUk40QmF4SjUxUFBYdysvb3poY1hTem5SVFZKdy8vTlBGOGt0TkRaVnFI?=
 =?utf-8?B?MnNZTEFyUlVjMG9MSUozOFF1WUNKYnIyUUk4VGRCTmg2K1RoMUR1UFpKMkxn?=
 =?utf-8?B?MW92MFRlRFJZM1EzT2NqYjhMbHZPbjhvelkwbURSVEVHNlJpZ2FHaEtHd0lQ?=
 =?utf-8?B?MnBqanhkSFhrQzhkeWhuQmtGRXROdDlrU1VGMkFkNVBHejduMjVjRnRLUDBJ?=
 =?utf-8?B?NkpBZGlqRHVIY0VhR0pCWkxBbmdhSVJlTzQxR2pQUVFBcEhNQzhPWkFHcDB0?=
 =?utf-8?B?WkswWXUzb0JWeTJVVGJiRkZFd0ZtcnE4azA4ZjkvUDRJY2xocTdZaDVJSU9q?=
 =?utf-8?B?Rjl4OUwxS2g5TjBiWTNCWW9EVkV2S2lRUjBpK1BzVVh4L2o3U3VvWDArYVVp?=
 =?utf-8?B?U2g5bDhSdVBucmFWNkNDWTZ5Qlpsb2dRWTNmRm02bHVvaGFGT3BqclpQZDhU?=
 =?utf-8?B?SEswS1VpRjNQOVF5eUZRdEhhNWl2YTFJdk9RREE4M3RYNG5VWGNSTzdpSjdE?=
 =?utf-8?B?N3dlZ1FSNTcxeTRQWGVyM29vZm5zMERGdHB3UUVQVWt0c3FHdForVWlxSml3?=
 =?utf-8?B?UGgyMGUvQTh4VndJRXVMcG5CWUxVT25WVG9xMlJraDhraXI2b2pEVCt6QjJz?=
 =?utf-8?B?K0RFYWFYZW42aFVVS2MwUTd3Z3RIUnh5S3lmZTVvUmtOcDRBUE9tcTNXN0lZ?=
 =?utf-8?B?VGx3cmJYZWFsMjFTM0x2ZlZxWWJ0WTZoVjQ0NC9HSzF2K3FOdHRocGdGMGd5?=
 =?utf-8?B?M0dKMW1jYmZvYWFMQVJtK0l2SDhBU0czcncrbkFwa2x0RVNuTHoySVpSYzc4?=
 =?utf-8?B?K0J0amhyU1JCanNIK1FobjRlbjRvYy9OcitzTDlBdjE3UFZZV1NrSTY1WWM3?=
 =?utf-8?B?cWJUM09XTURPQzd3OTMrcko2Sy9FbUxKRWNzeFIweENrYkJjWFFJNnNPWWgx?=
 =?utf-8?Q?k1/k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef22aad-9a44-40aa-8cc3-08ddb0456eb0
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 21:57:21.6350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Jz7g5vGaOtumf9+nuu5kjQdgHQhbP6v4FQz2svLG3Vu9tPtudkyAacwV8lFdoNA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104

Hi Reinette,

On 6/20/2025 10:53 AM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/19/25 11:41 AM, Moger, Babu wrote:
>> On 6/17/25 22:59, Reinette Chatre wrote:
>>> On 6/11/25 2:23 PM, Babu Moger wrote:
> 
> ...
> 
>>>> + */
>>>> +static int resctrl_io_alloc_closid_get(struct rdt_resource *r)
>>>> +{
>>>> +	int num_closids = closids_supported();
>>>> +
>>>> +	if (resctrl_arch_get_cdp_enabled(r->rid))
>>>> +		num_closids *= 2;
>>>> +
>>>> +	if (num_closids != resctrl_arch_get_num_closid(r))
>>>> +		return -ENOSPC;
>>>> +
>>>> +	return closids_supported() - 1;
>>>> +}
>>>
>>> resctrl_io_alloc_closid_get() seems to be trying to do two things:
>>> - determine what the io_alloc_closid is
>>> - make sure the io_alloc_closid is supported
>>>
>>> I think this should be split into two functions. Once the
>>> io_alloc_closid is determined to be supported and io_alloc
>>> enabled then there is no reason to keep checking if it is
>>> supported whenever the io_alloc_closid is queried.
>>>
>>> How about simplifying this to:
>>>
>>> /*
>>>   * note how this returns u32 that will eliminate
>>>   * unnecessary error checking in usages where io_alloc_closid
>>>   * needs to be determined after an resctrl_arch_get_io_alloc_enabled(r)
>>>   * already confirmed io_alloc is enabled
>>>   * function comment could note that this returns the CLOSID
>>>   * required by io_alloc but not whether the CLOSID can
>>>   * be supported, for this resctrl_io_alloc_closid_supported() should
>>>   * be used.
>>>   * Can also note that returned value will always be valid if
>>>   * resctrl_arch_get_io_alloc_enabled(r) is true.
>>>   */
>>> u32 resctrl_io_alloc_closid(struct rdt_resource *r) {
>>> 	if (resctrl_arch_get_cdp_enabled(r->rid))
>>> 		return resctrl_arch_get_num_closid(r)/2  - 1
>>> 	else
>>> 		return resctrl_arch_get_num_closid(r) -1
>>> }
>>>
>>> /*
>>>   * note how below already makes resctrl's io_alloc implementation
>>>   * more generic
>>>   */
>>> resctrl_io_alloc_closid_supported(u32 io_alloc_closid) {
>>> 	return io_alloc_closid <  closids_supported()
>>> }
>>>
>>
>> Sure.
>>     Changed the check to
>>
>>      return io_alloc_closid == (closids_supported() -1)
>>
> 
> resctrl_io_alloc_closid_supported() is not intended to reflect what the
> value is but just check if provided value is supported. By changing the
> check to above resctrl_io_alloc_closid_supported() does two things again
> (what the move to new functions aimed to avoid): checking that the CLOSID
> is supported while requiring that it is the highest supported CLOSID.
> What issue(s) do you see with using "io_alloc_closid <  closids_supported()"
> as the check?

I don't see any issue. It should be fine. Will test and verify it.

thanks
Babu

