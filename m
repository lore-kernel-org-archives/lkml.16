Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B99C133;
	Mon,  9 Jun 2025 14:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477682; cv=fail; b=QF6yCMLl96njZhWNYqnb4gS5OYxQRZrG5GFHNGgoBFw+amHmONx4Vfg2ijIU1zhjbmrYRxDjBLRBzCwQa9ejWSEokRiI/2iVRrINUV/6je2FuAENswz1AV818gEFKN/AKwLnkDCp1Jfc0uNBxqAnLZl+0jGNEZ9aK21XxBDQ2Lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477682; c=relaxed/simple;
	bh=bhJgGnNc1eWYagvDOEpEIuVUPQLfnDy8ub4iVVIAOjQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YT6/ZaQK6twV3etYNYVexcoA0OIT3dCHp7+v7eyIgTFNWzdUbxsU05GU/najI0BtYDN626dfHoKLJYfr94cW9xskwc77Z51NUbGo4Pv09KhDq2SgQtU2rznwzz8LRVD8AvZDU2L/XWM2jlvtSlwwhjUp/gm41rodyHD/RkTTifo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1Wzf/Vjd; arc=fail smtp.client-ip=40.107.102.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1Wzf/Vjd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPfzJcvpo1XpStjeToFokzMa5mQJyGDOu9HdwGMnXzMewnty9a32VslrgEzXMv9kKdNksb2yl4R2qQ7cX1JV86RkWmEX5tmxo7Fa7Yxlv6xiXuC7RAPs4Ka0Oubhfu/PoHo+3qfB08J5kHHvp0OmtgpGP5BuZ4UE5PPqe8wJEzsVuIOkbUx9uJ/o8iSdO0rExX0rDIif4GeZcFeqW3D6ko6BDYycRBtJ9wpiNxOcF0XnGzvC+tcI4sRfUwBYdtNFKh7nbKE566zd53RrGvw341x19YulZDNGN8H45oRTurz6BbTpUzMy5xmQJAFA/zgAzBHjeIRR8bDbGKWwVdy1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+PLeahEKz4tsLMD7dZ1tpEUBbJRm6d6FVXM02E5Y7M=;
 b=TTuvdrYY6j+4trte/Fzj25vRRYyMbPVw2ZSVrZlTD40VbnT2/+8z/JsABH+PQse9hiOqNS9kgi9c7CBILEc9L2qSx2en+LO8TD813NYiIw2F8MWTmO1b3GP5sXYQy7DZDa9Bny22zk8LZb3WSw5lBunyg49P9Atk1gMu+CnyKYaj0ObbNUtH4Ij05wo/ve9wFFV4+s5mFfgi+nDpH4Ii81jU6oB6lS8er8WQfv/fO6ZbzcOLhgLMWt3jSgxv0HYHb9VX2rgEA7RY6ssimzjh8kfS5S7kWqSHJp/bc5OKGzxn8FwvqXoYKtGityu9too3QmeVxH952ic+s1CWkb5raw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+PLeahEKz4tsLMD7dZ1tpEUBbJRm6d6FVXM02E5Y7M=;
 b=1Wzf/VjdVxu/wzF48ko4zI0jrRIBY0Oy3n1XHfkQ0HKwhqQE4RJDnnESOE8Qx+/zQgbtegppIdLX/1Gkogo4N7aQnCcxQeLYX7lrgIiue7JLfLzKnAGwSaNPv90GMh0i6nM0jpq1uz5EIx8ticCuB7F2bWTecGuiiSvnGzeatFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 9 Jun
 2025 14:01:18 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 14:01:17 +0000
Message-ID: <00d1f3c0-4d10-43d8-b33d-f9bbeb111613@amd.com>
Date: Mon, 9 Jun 2025 09:01:12 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: RE: [PATCH v13 11/27] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
To: "Moger, Babu" <bmoger@amd.com>, "Luck, Tony" <tony.luck@intel.com>,
 Peter Newman <peternewman@google.com>
Cc: "Chatre, Reinette" <reinette.chatre@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "dave.martin@arm.com" <dave.martin@arm.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>, "x86@kernel.org"
 <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "paulmck@kernel.org" <paulmck@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "ardb@kernel.org" <ardb@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
 "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
 "alexandre.chartre@oracle.com" <alexandre.chartre@oracle.com>,
 "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "perry.yuan@amd.com" <perry.yuan@amd.com>,
 "seanjc@google.com" <seanjc@google.com>, "Huang, Kai" <kai.huang@intel.com>,
 "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "kan.liang@linux.intel.com" <kan.liang@linux.intel.com>,
 "Li, Xin3" <xin3.li@intel.com>, "ebiggers@google.com" <ebiggers@google.com>,
 "xin@zytor.com" <xin@zytor.com>, "Mehta, Sohil" <sohil.mehta@intel.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>,
 "Eranian, Stephane" <eranian@google.com>,
 "Xiaojian.Du@amd.com" <Xiaojian.Du@amd.com>,
 "gautham.shenoy@amd.com" <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <e7e8f489ef148a4dcd5837d71c83efad47b5b7c3.1747349530.git.babu.moger@amd.com>
 <dd195d60-3e40-42be-88e5-7f3bbbba63ce@intel.com>
 <SJ1PR11MB6083C5179F98E3873CA34C35FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aDDjs4PZxeouNJr0@agluck-desk3>
 <CALPaoCj7FBv_vfDp+4tgqo4p8T7Eov_Ys+CQRoAX6u43a4OTDQ@mail.gmail.com>
 <SJ1PR11MB60839776B024017D65EF4E65FC64A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <396dbfa9-37a5-495a-adaf-7ec1fe6471de@amd.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <396dbfa9-37a5-495a-adaf-7ec1fe6471de@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0026.namprd11.prod.outlook.com
 (2603:10b6:806:d3::31) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 91480fbe-9ad8-4704-71d9-08dda75e1af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmltNVN4WkFnQnEzSk5rZWdSWlpiQk5KeUJjVTF5WHE2aXF3Rmp6U3ZxMk9I?=
 =?utf-8?B?bDZhYVdabkYza0YxMVpNWGNwY1daTmpaY3A1Tyt1Z2J6YnRQWThsYm9HMS9B?=
 =?utf-8?B?djlWQmVPR1QwM2FwUFQ2ekROa1hlbGg3N2o4dnViT2JSa0srQ2VwL1FsYU1G?=
 =?utf-8?B?UmFUMGlyTWdjeTR0Y3RmZjFRMDJRQjlKZCtaYXh3NUY2bkJxQndZVWorR2gr?=
 =?utf-8?B?UkJ2Tmsrb1N3MGlwSjFrUnJiWlBjSHZxUFJUVDhOc05abTN6NGxUeHlOdHl3?=
 =?utf-8?B?TjhhdG9STHdjbjJ5c3o5d201ZmJNeW9IVE4xMWVEeDFKelp4OFd4WGwyTDR3?=
 =?utf-8?B?L2ZhL0duaVcybzY2QlRGTTJWZVhUbTQ5MHBWNUk3Wk1HQzRiQ01OMkxDMVBn?=
 =?utf-8?B?RTZIcGkxZGZoUW80UmVQejVzVXhaZ0tZcG9QaUIxYmM5dlVsUWJTU2hiaVdB?=
 =?utf-8?B?bEQ4TklUcElSNjRRb29jNnBzcTJOUDZ4OG9rWjZpSjJLNHFubkFGUnhOTVRp?=
 =?utf-8?B?RVo4cnAvaTN4R2ZIbmhqU2xqc2NrdjM3WFc3a3VYU293dU40WTVtUmZuR3E3?=
 =?utf-8?B?Vjd0Vlh0ZGJ3K1I0QVJXZHZCL1owNWFFb29jNVZidWdzNlc5R3VXZFNMYnBn?=
 =?utf-8?B?bFJ1OGpKTHJEOWlUanJNVktua1oybnlPNlV0aHJDNGxCYzBQQ25pUFlXQTNu?=
 =?utf-8?B?d0tlQ2FxdG5vcS9KUEQ1d05vWEkxc3JnS2hFbFFXbTIvQkkwZGM5SGJJV0FK?=
 =?utf-8?B?ZlNzekdyRG05TFNFWUVTV0ZjU1ZhU1JJUmF6NzBWU0Q5eENSU1h6REtFaCto?=
 =?utf-8?B?eC9UbTRVUVdQaitiM1RtMzhEcW5uc0VOMjRnek4yRElRZlVqcDVFNTFhZUZt?=
 =?utf-8?B?YktaT01rTFIvem54bUtlWTFBd3lBeHZEdDFqZ3NsVnI4WVgzbzVOUytRSW02?=
 =?utf-8?B?a3l5a0k2Yy84OTZKeUk4bGJrMG9adG1LWkxtKzVHUGZteis5QmxVS1QyWHpN?=
 =?utf-8?B?Z1dubHFsWC9wblVCYkl1aU9tK0dwKzB0aC93THZySURTSm5LVjdhTFN1cG0r?=
 =?utf-8?B?WkFYd0RQU3cybVBoekcxQ1pnUHVtL2gyM3dyblA3Vmhjc081QjRMdzhrK21n?=
 =?utf-8?B?aU5HblNGSkpqbWRLWGdMVmhjMkJIQ3E3cjNWcnd6WFJmK2I2ZXJyanFXdCtm?=
 =?utf-8?B?STVTN0d3ZFJ5SEtFWlZNL2d4bTJ0RFJtVWVlQUh0SDhqcmRlZEVFbEpRcmJu?=
 =?utf-8?B?Nmw5Mm1zWGhvUTh5VWRRbklXZlZjOU1SMjBrOVh0SkNkT2tKRXZGdU1mQVF5?=
 =?utf-8?B?U2QwVmtFanJVb21XNmZvYVhBWDU5UUF3dERkQ0ZHZkpYUXAvcGxySGFndGgx?=
 =?utf-8?B?RXNQcFh6VWp0eTBrSFFnKzZTRkcvZ01WL3VOeTNZN0tOU1hYK2xpb04xZ1BX?=
 =?utf-8?B?V0Q5alh0S0hOWnl4TlFidzBhei84RFl1Wmk3UnJFZmp4d3U4cE9FQ09nM2tQ?=
 =?utf-8?B?Yzd5N202bG10ckNjdXp5Y0kvNXpKWEJjcjk4Qm1iMXhOdnN2UVJQbVJzQU4r?=
 =?utf-8?B?Y1AyNCt4N1ZUQi9TRzNpT2tIRzBhdG5oSjBRQ2lSSE1kWUJtUWd4YnRzcGFB?=
 =?utf-8?B?azJCVkdyV1RTMEh0ZXZUUTNPdndHWVR5VytMekVKdVJjUnFoZmV2dGxIWG9P?=
 =?utf-8?B?cDVoc2c2RWswd0g1YUpVR2tuSWtmVThsUk1VRFdmWTg4SEJRdHE2Q0theU9W?=
 =?utf-8?B?SnRJVUEvMnlnNWtxTFdTSzlKRW5ndE5zdVBDd0lxaXI3dVU0V2o1V1l4dWpO?=
 =?utf-8?B?TjhKM0lKRElFOGwyN2NwTGJOQ1dDYWJNMWdGOVRqcXZUTEhTM0g1L1FKeUVh?=
 =?utf-8?B?K1hxck05MlA4QXh2bDgvVUpWYk5GZXJaL09GMW85VU5XSkxlMUtUTWszdkhP?=
 =?utf-8?Q?622tXUq6U1c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OU1lbHliOWFwd2xNYUhwS09rTk5PL3FZSUViaGtpNGZCei9jamVBMzFlZ0Ez?=
 =?utf-8?B?WldIcXNYblpSVndaVzl5Y2dIaUxiYXdialJQNW9NODZJNDhpM21oS1J2Qnp5?=
 =?utf-8?B?Wk9ScStMdWpjd1oyRVl0bTYvNkYyQnBBbGVQbmF1c2JwNlRGTVEyQTdqYkd5?=
 =?utf-8?B?REJpNjlUMkd1SytiWmdscGFwV2hhL0hPaGU3RFZYenFQNS96VGJDeFlCVElp?=
 =?utf-8?B?d2dpcUVrVXlIZG03ejBKSXUxVFFqR3gyVkRLSHJkbXhEdjZCOC9RWlRqM1dY?=
 =?utf-8?B?WUJwVlJ0ckkvS29WeE81U20zYlVJRHExcXBKUEFLeWcyUzVjYk8wZ3Y2cC8w?=
 =?utf-8?B?cDJSU3B1ZStDWjBuaVNuVzJqMmtyVm9UVWZzbFlmRmJuVTZSVjVPUFl1ZGlN?=
 =?utf-8?B?Y29DOXRyd3l6MmtKZTJkdkRNZUtEaDZxVlFNZVhPVy90dHlrTmp2WENnOHpM?=
 =?utf-8?B?QzVGL2hzVmRKdDZudlRvb3lTK2lmaVZWQ2RHSUVKOXNiOG5wVVZGTVh3SWsr?=
 =?utf-8?B?a2QvUjMzaGV6c3JuYlRCeFRhYkYrZ0IyeFkrQnMvSEpwSGN6N0xINC9WMmJJ?=
 =?utf-8?B?QXNhamRzVXZTZWdKQVN4aHR5bVJYaHVBVU5LNlNYREd0cmNueGlVVjNaZUU1?=
 =?utf-8?B?ZWd2dUNVUENkRERqNGJiRS9qeVZSNXlqNktFeEpZNnJ4NTRMb2VGb2NTNkRX?=
 =?utf-8?B?WDd6cDVqVDM5d0owL1B4WGZ5NnN6ODhSY2UwQ3c3NENjS2pJV3pHYksxOXpV?=
 =?utf-8?B?WUxNRHBJSDZ2Q3ZxajBCNUxiWVpuVlBQS2F0TXpvaVB1YzljN2dHa1BJdXZJ?=
 =?utf-8?B?aFoyQVgrSlUzT2ZYNVIwSnN1ZUZkenV0cEpCT0JhZGw2allhVEMvY0tIZ1Zt?=
 =?utf-8?B?Q3hmM1ZGZzIxUm11NDNOQzVOL2Y4N2pLbGdQZjBVak1yVHA1aHRUeHkxS0Fu?=
 =?utf-8?B?UzNBWDBLRnhBcVRLRCtHd1dXS0xtVlVXZDBaeGF3YTZiK1I1MTRvd2cxOFhU?=
 =?utf-8?B?S2xTeWhaTjh1NHcwbVc0WjhsU1VNMkZCNFIyL1d0Nmh2NnFzSXc0QmhReWY3?=
 =?utf-8?B?Y0RWRjlrRS9vS0J6VWpIV2VWYnplZFJocDZ2bytXTTRwQXk1amdxNTAwSDI2?=
 =?utf-8?B?OHdXTzhhbW5Uc2huQm81dlV3ZHVCM1A1YmFXR1AvQmFJNVFJdWNFM21RSnlG?=
 =?utf-8?B?bzBiOGhXTzh2RXFkeHFuVVpyVVV1dVplYnhyU2FaYzhWQi93Wmh3RHhnQjYv?=
 =?utf-8?B?SlNzMXdJV0U3b1o5NldSeUVyTnNMdEVjaGFVclB1bXJrM0pTODRCbkNDQ3V5?=
 =?utf-8?B?RjFraUU3QUJZZ2hzRnhudkpvN1JucjYwQ1JNK1VDb1VTbjNUR0RBVVBRaVpE?=
 =?utf-8?B?ZzBNZlF6ck5IZjJTQ2JhaDVBQlQvTWJoM3c4UWk2UlNaZGNTbGdGcWNyNWtx?=
 =?utf-8?B?UThTTHFUczFFZ1FNaVJ4a0RLL2hvNkJMd1FiemY0WlByNmE4L2dHMDJTVlI0?=
 =?utf-8?B?ODZtN0Y0RGRjRks2SElhVDhzQVB6UFJKeVhUME42MUE1dHNDMEZaNjZtNXg1?=
 =?utf-8?B?dXdIRXE1Qm9xVlZLbmZ6YkFtZmdpK081SUUwOHY4OUtHN214cU0xOUI3akVl?=
 =?utf-8?B?cTRucEhsUjJDb3ZoYkJGSm9pR2FBeFptcE8zMXV1ckJCNm8zTVNsaWt0Z3Ir?=
 =?utf-8?B?b1hFU3NvQW9aSG1SWXhnYXhJRSswVXdhd0pLanJRbmM5L0xleUpzQnFsUmx3?=
 =?utf-8?B?N3FweGk5b2dEQ2VXS2xnQ0lIdG4xSGpyMGt1QlVCa0gvbnZqbWhwN3I2R0Jr?=
 =?utf-8?B?Tzc5a1IyQUNnaEVFQ1NiVXNQS0w1cE5yWVBQMFZCNVBtZEVVdkdrWXcrYkZw?=
 =?utf-8?B?Umsybjdab052a1RRb1FZWVhTdHpuajl1WXFudkhsYTFWUnY4dlp6N1ZPUlIv?=
 =?utf-8?B?SnUwb2s1Y3FLd3krNzd2WHRLc0VBT05FQ3JkcHZNK1kwT3BKbUVHc1E5RDd2?=
 =?utf-8?B?YkVJYVpNbS9QcHV5Mko3NTlXdDczcThBcFQ1dnI2WWFWNWxpdmdWVDJ0N3cr?=
 =?utf-8?B?citTS0E3TkJ0ZXVobFh1VUFzRUw1REc5TjBoN3BwUk1QSTVMWlZIZE53bS9l?=
 =?utf-8?Q?KT6Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91480fbe-9ad8-4704-71d9-08dda75e1af2
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 14:01:17.8921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBnJN1/BfOTNPTG1GqcN3pvSXeCU9eIK1lzjIVbTh7kntLVz9cn3u5DpcMhZGRTQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067

Hi Tony,

On 5/28/25 16:41, Moger, Babu wrote:
> Hi Tony, Peter,
> 
> On 5/27/2025 4:41 PM, Luck, Tony wrote:
>>
>>> Thanks for applying my suggestion[1] about the array entry sizes, but
>>> you needed one more dereference:
>>
>>> -       size_t tsize = sizeof(hw_dom->arch_mbm_states[0]);
>>> +       size_t tsize = sizeof(*hw_dom->arch_mbm_states[0]);
>>
>>> -       size_t tsize = sizeof(d->mbm_states[0]);
>>> +       size_t tsize = sizeof(*d->mbm_states[0]);
>>
>> Indeed yes. Thanks.
>>
> 
> Tony, Thanks for porting patches.
> 
> I can actually pick your branch [1] and apply review comments on top for
> v14 series. Hope that is fine with everyone.
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git/log/?h=my_mbm_plus_babu_abmc
> 
> One question though: Where will the Peter's fix [2] go?
> [2]
> https://lore.kernel.org/lkml/CALPaoCj7FBv_vfDp+4tgqo4p8T7Eov_Ys+CQRoAX6u43a4OTDQ@mail.gmail.com/
> 
> thanks
> Babu
> 
> 

I'm currently working on v14 and plan to post the updated ABMC series
tomorrow. I've used your multi-event support patches as the base:

    x86, fs/resctrl: Consolidate monitor event descriptions

    x86, fs/resctrl: Replace architecture event enabled checks

    x86/resctrl: Remove 'rdt_mon_features' global variable

    x86, fs/resctrl: Prepare for more monitor events

I noticed there are a few comments on your series here:
https://lore.kernel.org/lkml/20250521225049.132551-1-tony.luck@intel.com/

Let me know if you've updated the patches. If so, I’ll incorporate the
latest version. Otherwise, I’ll proceed with the current base as-is.
-- 
Thanks
Babu Moger
