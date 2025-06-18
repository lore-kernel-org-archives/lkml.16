Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFD41632C8;
	Wed, 18 Jun 2025 03:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750218684; cv=fail; b=DTS8An7kRZE9IVIm1yVgfAuA9AtEL8+A0fLw07sHHO07QrlUj+se3BnG1j7hViUMCDgV+InVLFG8JBVu61v4ufxy/BGIhcJ/oMQ/EqmV/dAUSzxGW+KUnZhVSz6BSuVTbDJNFIgLUbZalv1/pz12FevzhWJNOGYn07im9SBfrN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750218684; c=relaxed/simple;
	bh=c5Go5ameBrg405fYWS3BYUHgIW55l9ZZswoujmOQ/W0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oiTG23fYDPjYMyplECUq0hvHm8U+I2rI1e8gNyQM4pDojnBoSrS2ZkTmhTxRLHia0N9ywwnrN9WZZ/zFU5QJnFsgu5GYvDOpLQ/7WI53a4jmEbzNDJLUKyRGkqvzNRZlP3efqhQ++mTAHAEo+jF26mVP07gfcpEXewfIygleuMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TUU4bDav; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TUU4bDav"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750218684; x=1781754684;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=c5Go5ameBrg405fYWS3BYUHgIW55l9ZZswoujmOQ/W0=;
  b=TUU4bDavn5iaqdV18Q8NwuxCFp6Z3MwA7+/6bJfAN3g6qaIfqMBBTrUB
   jR/nGaC1pEOkA09DBf4CILUfUyWN4YhnVdnWI2Qv4JLdV7FuP+QqdT8+Q
   u25FYLMlENJI8yE8CMWgkShHEOj9zWnZG8/6azPkGYYDbViY3GluR0i/B
   EdYMyALA7Uf5eUwDkokcEALMa2myVbSGmPbKJdrHQEp7UzvxW2FUGhqUV
   JgGwtHOSv4maY+oGUm0h2Uyuay/SLPosrOd2O0AsCEbnc4v4K40Au3Flk
   mbxcnBgma7uZUXedAY/zG7fxVof9BSUPld7snwK4/ZbW8cmg80AENdPAO
   g==;
X-CSE-ConnectionGUID: p7HJN0BfTE+j7VcD8IFRsg==
X-CSE-MsgGUID: ieiWGEyTQuGSvug6mDFzFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52286924"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52286924"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 20:51:22 -0700
X-CSE-ConnectionGUID: 5RLiZ/nSRMeWqIAl1Kz8Nw==
X-CSE-MsgGUID: bUDVngk3S6mxOBswam/AhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149693059"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 20:51:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 20:51:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 20:51:17 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.74)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 20:51:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0IgGoCYcaLoZ2CZ+FLXC1OfyoTqrHNVWeseGm+f05t4YJMDVJVnromveHP03Z21U0k+i9JKrPAY9bMDE2tREV59taRPLWNmYj+XP2UobO8lzbO39dB+s+qdJPHB9L4venB+rIv5pCv65CkjB6D5SqUg9SBDlrBfDY2zidIV6hEJg9N6l7uppr002ql9JCNwZ1tFkJQ/uHLhq6ZACsf/UjmmHDPKxb/fIcLOD6nJUWrdYsWR+1rk78XBq3pVrMC8+NuFVfQMSIAYKtmEO+jGzqnRt4t+xYboSHU39nmNvJ/xXarF2GJDWWZMqS1aS6yk9w2FvTVcDGfNWDEj+TcSMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZfVQhtBVl4UE92rKvlxHLzLIkfR4dFlEMnFOPnNG9A=;
 b=MBCwpvROg0z5OFd+GH0ITr1E4u9y5WRn/219Zd+sqFvU5uNBVA05Urq43YM46b2Bmmd/qwYRRHJg5TXlk1/tpcwrp5jjzAf+W69XzUVF78icAmb025gzbS+/WFBnbFwfPCow8JwmIZ+Z8oHLCzwRxjruYb5h2Q9Ta4d+tX7XT1QL4Q1Km+9OOl0ru6PQ+2nDlmCdxs26kGQwg7WIYhhRMJLUOmfVn8QsUNBI9f5WgUIM6D4COSiDPxY+cg6UP8ZtOFHbCRaIoII4Bk5lWxGaIAEpR6FbknS/S3AUyDnnK8f7ohiPMEgtKG7Muw4cVWpWRJEOxdHJI/LKTaZxrwB5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MW6PR11MB8339.namprd11.prod.outlook.com (2603:10b6:303:24b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 03:51:14 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 18 Jun 2025
 03:51:14 +0000
Message-ID: <7521ab39-73c8-4d11-b12f-bf67a7031d7f@intel.com>
Date: Tue, 17 Jun 2025 20:51:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] x86/resctrl: Implement "io_alloc" enable/disable
 handlers
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<perry.yuan@amd.com>, <yosry.ahmed@linux.dev>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <peterz@infradead.org>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <sohil.mehta@intel.com>,
	<chang.seok.bae@intel.com>, <andrew.cooper3@citrix.com>,
	<ebiggers@google.com>, <ak@linux.intel.com>, <xin@zytor.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1749677012.git.babu.moger@amd.com>
 <548b542ff537936cc8a20f721f6f2472189c536d.1749677012.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <548b542ff537936cc8a20f721f6f2472189c536d.1749677012.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::27) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MW6PR11MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 86585dfb-3eeb-45c6-69e0-08ddae1b5f53
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1hzYlU2clVsUGZoMlg3aWdFTE9KeEFZUnRuVWdtOXhhRCtqRHV4ckJZVjhO?=
 =?utf-8?B?ODJYZDhDQTFDTk9paTVXVWhkU1dNVjBpZmM2blBMaDZmWUM5ZW5tdWpJRFhZ?=
 =?utf-8?B?MnpWYndaNlJ4MDUrMXpWMlhqakN6YlhoV3Y4cXFXR3FrQS9GU1JUWlR1UXNh?=
 =?utf-8?B?akI0cVZzazdpdEJzTVpkSzRQTGNDSVFQNk5rQWVudDhMM2NmbTFMSzRXdVRq?=
 =?utf-8?B?QkFFNTFMTDRZRnVkRGRFdTZtTWZHU21waDNjcHp5VDNKeW5jYlF4YzZVeG8w?=
 =?utf-8?B?K3ZJZDBmaE1ZRmJkUDJ0ZktVdkdSY2U1TkpIUTNud0hERXJNYnFycUp6VENQ?=
 =?utf-8?B?LzU1aWJSN0pyQm9Ja1gzanZkdEc2ZXZ5OVMvZjc2djFNbVlXcy94L3lRTVFL?=
 =?utf-8?B?N1BrMlBQTFB1VDlTSXROSkZ0K1RNVHgxM05tY2w5bnZ1U2IrcldWUzV6NU5v?=
 =?utf-8?B?NHU2VUYyS0h2K1ZQeTN3eGNGWlBiMDMvaXVpTWpRVHIzbzYrSkhiWTl1aEZH?=
 =?utf-8?B?blVGVThiTWc3KzF4cTFJNmlzUjhSRnRRY2xqZThIYzMyUU9ZYjd3RWFoODBy?=
 =?utf-8?B?TE92cStTNHhVY3lPR3lCTTNkYUt4T2xDbE9ZdUt4S1NOVU80ZDJFTzlRN1NV?=
 =?utf-8?B?SnZtK3FJak5VK0hMdFNnb202NVIzb3VoM2VHcGRjS05aVXFLdVlMVklORlhl?=
 =?utf-8?B?b2Y1RWQzYnBHTmZmcW9VNHNLZnVNOXR0Yzk2ZUttZ1NkWS9mcW81QnNaSzdq?=
 =?utf-8?B?RGhRT0Nud1VoQkpiSUw5V2Z4dCtpN2VmSHlhUHRsVmU4SnRqaStOcUdSY3BK?=
 =?utf-8?B?OUNJUTlDWFZ3UGVCaFBlUm0wOTBkakgyUmJPYXlScGZ4L0czRVNtekxaZVd6?=
 =?utf-8?B?YlBFVk5ZR0ZSOGFmME1nNlA0bGVyY016TXRPNEdSNW1sbUZCY3BKQXZOQlBD?=
 =?utf-8?B?Y2tod2Z0YlhrYm1rMnFiUm4xQW13SzdERmx3a052SnNFK2xJMmZaUlN6aDlS?=
 =?utf-8?B?MXhMeU9SWnBqRGdqNFdsZVF0QVpjWWpOZEY5alBNZlpoOTdPM01ObkFzREtD?=
 =?utf-8?B?TERTaEpPaEV1RVVLMUI5ZjNMUmk4OXdEYWlVa243YVIzMmFZa3AzWk0va0FF?=
 =?utf-8?B?eGFUTTc1dXpzUDJKK1V4RThzeVQ0Z3U4RWJQQmZQNVBnYVh2enRRKzB2dzFl?=
 =?utf-8?B?d2RVRXFKREZyRElFMkdsR0lOS1JKejFKd1ErVnQ2ODZ3YWtwWW9ZSGg4cjY5?=
 =?utf-8?B?Z1p3Z2RzY3RJNXF4cjVQMDdmcmFHUDFGK0lxNlpFZjU1cFVONW92L0QwTVk4?=
 =?utf-8?B?WndLd0JHS21ndGJMVDhrNkVucVNIOUZuWjZsSDRzSFJSeWtVbTZTdUNyV1ZM?=
 =?utf-8?B?WXR4SHFteHpmWTVPYTVSekpzR2pRWk1CSS9MYk1kUVJzWWxwL1hvSjgwb1c5?=
 =?utf-8?B?VWxSblRvYUNINTJCR0NJM2w2VlRJY0ZKZzdsTGdpVEI4TE03UFNzb3BtNktv?=
 =?utf-8?B?cTVrMjFhdkkvWmlDMElCYnE1TXo5bWxCcVBzYVFsSFZEZlArV2NpTFBEK2Fl?=
 =?utf-8?B?UnVIS1FqL3F6U09JalhiSUM3UXZiS0tQMXkwS1JTWXVRcG1SdEVwTG9FTDJO?=
 =?utf-8?B?Vm51TnlOL3FHYjBkNlFUL1JwZXRHeXh3czRNWE4zVS9qTTQ3bnV1NU9jZCtQ?=
 =?utf-8?B?UWFSZEVVbFkzeFdNak9GUTR5ZVVZR05XeUQwS1NoSXJ2K0lQMTBJQmg3Ri91?=
 =?utf-8?B?azhocm1lUXAvSnZSNi9uQ2FCcUZEQjFZRHc5TTYycW1uM0o4M1VYQWhJY3hS?=
 =?utf-8?B?dlk0cXFHci9NN3RQa2pvMVBFYnRpeXdib3ZBbXVpOUlna1AwM3U0cjZBYnM4?=
 =?utf-8?B?MTZQOWtManRJaWZzZkZ2VVg0WTF5UFd2ZW1pLzBRVVpMNWhNTXM3dnlnZXhV?=
 =?utf-8?Q?GeqtQhBzj0I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnFQdTdzZFdETFpWVlpwZkY2WmdFUXdvRjBjWHhCRmRLeCtyaXhuOXdmWFZi?=
 =?utf-8?B?Q3RqL2VscG9WNkhBYVdwNCt2aGVIck42d1NMMUNSc2xHQUpoZXZpTHZyRnlI?=
 =?utf-8?B?bXlhYm9HWGI3clpURDJOdTFNdmhXSmFvMWRRRm5yY2VJVUh5OWYzVmN6ZXdV?=
 =?utf-8?B?SFVMSkZhTnAvZklkOGFxWTF5aFNMSlljdGhmVFVINjZtNU1aMVpaOUVVLzll?=
 =?utf-8?B?aUYvSVhoSVFEY1BrV05PYzhKTy9CQjZPalJPY2NGTkFZaWk2UGlLcCtIcDVL?=
 =?utf-8?B?bWRwQVh0cUx0cHYwM2NuR01qUDF0TldzTjA5cGtxRk1uVUh2WUdhQjhuejh3?=
 =?utf-8?B?aUpyNG5CYzYxNElEcEYvQUNCOW1yTjdsT3lYTWlrUHE5U3BzYTVwNjZLNG9C?=
 =?utf-8?B?REluRXVhWWNUQWVLMCt1MkhFdWNkd2NpWEUwQy9HMm80UUQveWhHQ2NFQWZ1?=
 =?utf-8?B?N3Q0Q21xRGhKaDNVVHlSdk9mSS93YXdqbnZsTnVjamo4L0pDS25LMEYwTVZX?=
 =?utf-8?B?S05GajY3dmluUHpNSDRZbmZuTjAxb1B1T1JvMWlmbWdoNDR0M0JaUmE0b0pQ?=
 =?utf-8?B?SDdTc3FkcFVMalczSEhmdnQySTZjVVBEUlNGOGVmVHkzRlZmaWpzRHEyeG95?=
 =?utf-8?B?UkhCcGFwZDQ3cGYyUksrK1FwcklxZE1CQmhOTkhnVjdQSThiRmtjZUdEYllp?=
 =?utf-8?B?QWV5UUJ2SnU5bHEwU1pmTmNlbTRqMHhVaGNFVUxHaEpoWmpmQk11MkE3em5X?=
 =?utf-8?B?Tko2OWx5MW00VzZKOFBMUXBwWFFvQlBLN2dXendyTjVWa2VzNWw1UHUwTmNu?=
 =?utf-8?B?VVY5SStNQVQ4Yk5oWXlZY3UxSXlPSzRZRDlsSTBETmtzamdYZEVkdytNMFdU?=
 =?utf-8?B?N2lqZmo0NElUMWRSOHJHbnJ2czREU29iQ0dGcGZqaE9JVnBBSFN4K05Gemlq?=
 =?utf-8?B?eWdHMkxyWU5VdFZCdWFXNWxkUWVDWjUrbW0vZ3NiK09yM0swWHM1UmRSOVdo?=
 =?utf-8?B?VzBCa0VKd2VRZFFCMUQ4amZsQk1VUktHOW0yZlhOTC9LbXNNamFxOXdJOU15?=
 =?utf-8?B?SG1aYUM1dHFIZ29jclNzZ1NiNmg5UGgzTXNFQk5Qa3g0aXdaUlNaa0kwZDBm?=
 =?utf-8?B?MDEvaHBXYmszMW8wcTBEWW9mK0Y3Vlp1bGg0K1JSOXdzTXc2ODg2STAxS1da?=
 =?utf-8?B?aFZZaElaelZBd0t1M1NYa3NaQTJ0MXp6UGpDYTZld2J6Q0F6WElzaGJrOHZM?=
 =?utf-8?B?aTBpdVhyUW5zT29JcDFrZzRaV2JBU1ZYYnEvNWxPbjd4b1NrNzZ2amIzTHdh?=
 =?utf-8?B?K1dHNjk5M2NMME5sZ3VNTUhleGpuMjQxSWROWWUwZFNqVnZzMmh2dDhucVNj?=
 =?utf-8?B?TU4xOHBKUFZkRVlIOUprUkFUUEpoUHgxa3NJd2NVYW5zM0NRaXFtRkZJNFp1?=
 =?utf-8?B?NHNwMGZRa1VBV2RkZk42NFU0WFdsWmc2RTZFeDJyUHpzb0xWYVFCU3NGTFBN?=
 =?utf-8?B?MTN3NkJtSjJab0RobVpjZHc1SW5yNjBXSUltendvTnV6andzMktLdmFtK2Ri?=
 =?utf-8?B?OG9kSi9DT0IrbkpJOTRhb1oydCtyUnJjenNUUlVLaHdaTGVUSy9zbWVlWDhs?=
 =?utf-8?B?UEp2NFRsRklZMGc1ZHZURnlxYzZTWG1Nclh5UktKb0l2dUcxNkNCRW1NYUhj?=
 =?utf-8?B?RUZUNy9CSFBSK1JiN2pRTEZhMDhaeWhGRnZYSk50Kzh2U2pvRWM0Y3BreC9l?=
 =?utf-8?B?aEYwM2VneEQ4dVJFZG8rQzdCRlY1OGNqSTJKYVBtSFEzZGlseGZQNk0ybjVq?=
 =?utf-8?B?WXFzbmhtT0EybGpTZDdlM2ZKNzVqdnVKeGhhRUZkRUtmYmJEckZNcnpHWHZP?=
 =?utf-8?B?TkJoaGgyM0tGK3hkeklBa1BSd2ZiMTExVUh2YVZaS0hQc3JUakZndnBYbGkw?=
 =?utf-8?B?MFpQeVpyUjhQejNsTUtOWDI2RVV5N29YNGhaS0o1cFBndXpmeHBEN1FkVTgz?=
 =?utf-8?B?V2ZPUUpEcytEM3Zmb1B4S010NUg3S1ZIRjg3UUR4NDlmNTlVOVFOOUV5SmxG?=
 =?utf-8?B?UmxWNURxY3g3THBRWWtndEZKUFYxRFhIUmdUUFIyRXlON1BxRFNTQWJlaVpJ?=
 =?utf-8?B?THpMTWx4MisvSFpPS2xVVS9YMDZwVXl3TkQzT3lUVWY2Y1NPS2Z1dWhOVVpi?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86585dfb-3eeb-45c6-69e0-08ddae1b5f53
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 03:51:14.4264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /q4Uh7ZLylJmNEWoSRspT+DRFUr2A76XYb2Ueod9Wxf19vtt9Y+1PWqTpnzMRyra7nn+oIw+XS2xC1pkKGcPC512ocr2sGix+ZZnAObib4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8339
X-OriginatorOrg: intel.com

Hi Babu,

On 6/11/25 2:23 PM, Babu Moger wrote:
> "io_alloc" enables direct insertion of data from I/O devices into the L3
> cache.

Above is from resctrl perspective and resctrl does not limit this to L3. Here also
I think L3 should be dropped.

> 
> On AMD, "io_alloc" feature is backed by L3 Smart Data Cache Injection
> Allocation Enforcement (SDCIAE). Change SDCIAE state by setting (to enable)
> or clearing (to disable) bit 1 of MSR L3_QOS_EXT_CFG on all logical
> processors within the cache domain.
> 
> Introduce architecture-specific handlers to enable and disable the feature.
> 
> The SDCIAE feature details are available in APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
> Injection Allocation Enforcement (SDCIAE)
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  arch/x86/include/asm/msr-index.h       |  1 +
>  arch/x86/kernel/cpu/resctrl/internal.h |  5 ++++
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 40 ++++++++++++++++++++++++++
>  include/linux/resctrl.h                | 21 ++++++++++++++

This hints the subject prefix should be "x86,fs/resctrl".

>  4 files changed, 67 insertions(+)
> 
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index b7dded3c8113..b92b04fa9888 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -1215,6 +1215,7 @@
>  /* - AMD: */
>  #define MSR_IA32_MBA_BW_BASE		0xc0000200
>  #define MSR_IA32_SMBA_BW_BASE		0xc0000280
> +#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
>  #define MSR_IA32_EVT_CFG_BASE		0xc0000400
>  
>  /* AMD-V MSRs */
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 5e3c41b36437..cfa519ea2875 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -37,6 +37,9 @@ struct arch_mbm_state {
>  	u64	prev_msr;
>  };
>  
> +/* Setting bit 1 in L3_QOS_EXT_CFG enables the SDCIAE feature. */
> +#define SDCIAE_ENABLE_BIT		1
> +
>  /**
>   * struct rdt_hw_ctrl_domain - Arch private attributes of a set of CPUs that share
>   *			       a resource for a control function
> @@ -102,6 +105,7 @@ struct msr_param {
>   * @mon_scale:		cqm counter * mon_scale = occupancy in bytes
>   * @mbm_width:		Monitor width, to detect and correct for overflow.
>   * @cdp_enabled:	CDP state of this resource
> + * @sdciae_enabled:	SDCIAE feature is enabled

nit: "SDCIAE feature (backing "io_alloc") is enabled"

>   *
>   * Members of this structure are either private to the architecture
>   * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
> @@ -115,6 +119,7 @@ struct rdt_hw_resource {
>  	unsigned int		mon_scale;
>  	unsigned int		mbm_width;
>  	bool			cdp_enabled;
> +	bool			sdciae_enabled;
>  };
>  
>  static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 885026468440..3bdcd53b3ce3 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -229,6 +229,46 @@ bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l)
>  	return rdt_resources_all[l].cdp_enabled;
>  }
>  
> +inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)

As indicated by lkp the inline usage needs to be fixed.

> +{
> +	return resctrl_to_arch_res(r)->sdciae_enabled;
> +}
> +
> +static void resctrl_sdciae_set_one_amd(void *arg)
> +{
> +	bool *enable = arg;
> +
> +	if (*enable)
> +		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
> +	else
> +		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
> +}
> +
> +static void _resctrl_sdciae_enable(struct rdt_resource *r, bool enable)
> +{
> +	struct rdt_ctrl_domain *d;
> +
> +	/* Walking r->ctrl_domains, ensure it can't race with cpuhp */
> +	lockdep_assert_cpus_held();
> +
> +	/* Update L3_QOS_EXT_CFG MSR on all the CPUs in all domains */
> +	list_for_each_entry(d, &r->ctrl_domains, hdr.list)
> +		on_each_cpu_mask(&d->hdr.cpu_mask, resctrl_sdciae_set_one_amd, &enable, 1);
> +}
> +
> +int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
> +{
> +	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
> +
> +	if (hw_res->r_resctrl.cache.io_alloc_capable &&
> +	    hw_res->sdciae_enabled != enable) {
> +		_resctrl_sdciae_enable(r, enable);
> +		hw_res->sdciae_enabled = enable;
> +	}
> +
> +	return 0;
> +}
> +
>  void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
>  {
>  	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 0e8641e41100..06e8a1821702 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -531,6 +531,27 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
>   */
>  void resctrl_arch_reset_all_ctrls(struct rdt_resource *r);
>  
> +/**
> + * resctrl_arch_io_alloc_enable() - Enable/disable io_alloc feature.
> + * @r:		The resctrl resource.
> + * @enable:	Enable (true) or disable (false) io_alloc on resource @r.
> + *
> + * This can be called from any CPU.
> + *
> + * Return:
> + * 0 on success, or non-zero on error.

Please change to "0 on success, <0 on error" to make clear it needs to be
non-zero *and* negative to be considered error by resctrl fs.

> + */
> +int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
> +
> +/**
> + * resctrl_arch_get_io_alloc_enabled() - Get io_alloc feature state.
> + * @r:		The resctrl resource.
> + *
> + * Return:
> + * true if io_alloc is enabled or false if disabled.
> + */
> +inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
> +
>  extern unsigned int resctrl_rmid_realloc_threshold;
>  extern unsigned int resctrl_rmid_realloc_limit;
>  

Reinette
