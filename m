Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C191184E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744930037; cv=fail; b=VHyx+EgAGk/WRKVyy1wSXXrBc8wzKH+LycbE8XMAjjr2PU0KyanuZi7KZCMo6aXd//X41X+jnrm3G+mhd0JPeG3ZS6iTQk0+48E9p5XToi0lMWLNcxX8DDHuK7XXE5xizaYQgTZHPfaCCOKIVqjGFwoDGqEXfFNbvUjm+6BS898=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744930037; c=relaxed/simple;
	bh=2zYXiRd4tsgq305XQdU1HvMXRO1KiOZZH+wqX+CYMgw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RSPiTOJptn5o+lDu/Rk6V+Ei5M+vDjd6DTC4+Ud89TbQxkRTwU8fMXZgKmWspI4pzboYt56b7KvZCQZVoZy3kprCFI4/7be7SdgTqUQuxiqJuTPXecx2nnqNu6I0QUI40UxCgFFK59MsekNuFHKb81n+SbQPvJZw8QeUlzHSVdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CeXRUL7v; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CeXRUL7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744930035; x=1776466035;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2zYXiRd4tsgq305XQdU1HvMXRO1KiOZZH+wqX+CYMgw=;
  b=CeXRUL7vrlpdUuJ9SiSlsQCqB7SQDseUo7Uyj8BFh4ML+VbvC0wmUgDl
   G183OyBagfdJvT/HIulb2IFzgf1SY64m19ocFE7fkkJpBVWOrMyirgIKD
   zqkg6+Y+32mVQFT5tNTBAQBE8habZ/M32E2bcmuY07dA8x6axJYLGOxAn
   P6yUqJcR595dx6+XeC+J1oRbuQYzbC6TMSY9iyUGG/F6oagdg4flw9m9M
   KWwtL1S4iSobyfFa6N1l75IXv6NAzvBxSXaIsFbr+CD2TzAPJUZJFBylK
   0O8o92i+8M0GOwiyq/xvhTsb/WNKN8Cse+AXWBSemrclhr861RmvDdC+9
   g==;
X-CSE-ConnectionGUID: tH+MfnWlQeKVTYTgYF8f6A==
X-CSE-MsgGUID: Loz/uyDRSYOyNfClKbzJ5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46435945"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="46435945"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 15:47:14 -0700
X-CSE-ConnectionGUID: fNNncJmrQfWxbn6ff4RuOg==
X-CSE-MsgGUID: AhfZWg/9QpWNQUeGowMClg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="168155289"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 15:47:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 15:47:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 15:47:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 15:47:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKhdNheO5MpztZ7OCpE4kPkqbY3vAWclUTnujoDCFLXI316j7oyhBmHArpxvgFk1E+GJwKbiOHefFJcqoWltXMymTL62TuJu/JGWAsxPakucukKCjxPpMX3fh0Nq97sdDWs4J8+oEhaZ+V4taOqgRvh7FsySyk+HkG9tZWaCwd3WaAYLzk2/YeX7OgknakF0CGKS1YivXZN51Hhg1cvv9S/AflN+1GSuLLI6+qWup9cElNW2YK66NAkbufPtb2yRKrYL4VnOIImk5f6c/zAjygRWDMz9KKspgT3qHXXj53dPp9P+ENkfPP7PNYZj9ldgFp63tbRFun1mcL9b+eVSbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmTAFvTWJSUQWvqrBOEg7UEWRQyaHLZK6FSOvrwvXQQ=;
 b=xPcNsdHuclE2hnzq0qDMRh/eJ4Ua9fyx2NsTWT3awDe4DHBUaGV0F2z7NkiysL5VKZeFPspTZSU2vBHin0N0xXREvDzaGqC5RWEoKBZ0pFLhg+6avfz4pcOL3T4WBfT8sgmdusx84jTpOhhuiX7FCtS3BAeCH9edUi/iQnR41bcyeIA4Q42a2pYiL9ghaWgJ1oekUqs0YK0MMI6z0pj4jOCOn7qpMjFlv5ANhSiVANmYPaLrI/puYg2paigQXJmld4SlhkfJdIh+rQq9cdJ+Xqo5eIx5A7wSjirNJfvM+7hcZ7fCiIBihBnoEsLGJQbOEr6ZjJNGCO6jvrVtQHa8Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS4PPF2AD6B04BA.namprd11.prod.outlook.com (2603:10b6:f:fc02::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 22:46:57 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 22:46:57 +0000
Message-ID: <b87f4c98-ef7b-44e7-ad25-8b2003bea5c3@intel.com>
Date: Thu, 17 Apr 2025 15:46:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/21] x86/resctrl: Move the filesystem bits to headers
 visible to fs/resctrl
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Shaopeng Tan
	<tan.shaopeng@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-13-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250411164229.23413-13-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0050.namprd16.prod.outlook.com
 (2603:10b6:907:1::27) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS4PPF2AD6B04BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa4fb05-d519-47b5-e0c3-08dd7e01c207
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0FXQ2Q1VHlLK25xcXJ3N096VDBNTGs2NGNCZm5qYmg4WXU1Q3k0YTgySmlW?=
 =?utf-8?B?NDNjODVsT0FGMTB5UlBZaVlnWjYrUXlXdWU4d2llNUZVemtzcEVsUm4zSkp6?=
 =?utf-8?B?SGdRYkc5d3RTb0pjbUJNVEM1cXdmdzliRDVkY3VUaEw2VnBiL1lTdk1hNE1o?=
 =?utf-8?B?K1EyTFV3Y2xTQVFuRXovY3BPb3FUNTE0ODM1RGF6a1gwRGhsbkpTRVUzenZR?=
 =?utf-8?B?amtvWG1aME5BV1BQVHc2QUNodkloMSt2UnVxMndBMUNNV0l5c1draDBoaTJN?=
 =?utf-8?B?NnhDKzN3bGNtd1R3MGFSRWxsNDQzdHBwYlY1Z0ZnOUVZWkk4OFNsdE5NUDBN?=
 =?utf-8?B?N0ZuRCtrSmg3UUVFTXMwQ1VEdW5CVFcrNDRYS2xJL1p2K1ZFS2NzZ0FjWmoy?=
 =?utf-8?B?cEhMWWVhcDRFLzBkM2Z1MTNobGxZSkJ0a2l2Ui9LTWtpaUgzRWxFUm5xYjRI?=
 =?utf-8?B?a3dGT0pUUXN4bkVTZ0I3SUVURWFxY0QwcEdYa05FL3BaRG5xRWw3R1ZDMTNY?=
 =?utf-8?B?Nks3SmhTdUJyY2s4QWRZZi9mZTJ1WDFxeGNoMlhvU0JuNG5hd3pKd0FPc0FL?=
 =?utf-8?B?VEk2NDN2N2ZlaXBqS1JCckc2L0dDWTIwQy9rb1hNQlJxZzVpVkZGZWVvaU5P?=
 =?utf-8?B?dVhieDd6K1A0bWZnb1JnVmV0aW1XMUJ3eCtmTnpWOGs2NU01TXp2ZndLdUFS?=
 =?utf-8?B?a0lBdEV0SzVqdjdXYVZDK0wwUjhiM0dGSVgva2FYU2ovYWIrdmFVVFNmTjVz?=
 =?utf-8?B?NUhRakt1bXZVc1NPL3Q3VnpPaWVOM3RtTm1nUDlpZWRBUjNEZHRRSG02Y0V1?=
 =?utf-8?B?QURjQXl4Z2xHQUdOMHcybnBSV3RaTlE4SDNDdU1aWnVtQk0wYmpWQ0JZWnQ1?=
 =?utf-8?B?b1VjWVdBZWMwZ2IzUHJKV1pHZ1NnLzdFTDdlY0xMSWVLSVpFeW4vNjZxbXdw?=
 =?utf-8?B?QXhhOXNsYkRsSmwyR0tYaExzSVNrRW9WM2lkTWl6djRTTUJ4cnBCQ1RpdVNW?=
 =?utf-8?B?emt1bnVCSWhycERhZ29Xb21UcEE1K05BSnEwWFl2QlVYSVBCdVllby83Y0F2?=
 =?utf-8?B?VkcxZS9SNm1kNVFGcnB1VEg0QlFXa1dldXNpTFZkYTRoa2U4SS94UXZXamFn?=
 =?utf-8?B?RDhZMmNrY3Y4SGpNY2dWRGR6R1Bmci9JdlpJS1g3SmQzK1ZmcXZ1VkFmNnRP?=
 =?utf-8?B?NlBNaFRtYTE2cFpCUHVnQ2VUVXZlSDNKZE5MeVIxRFZSQnkrSVZ2UGo1QXJ3?=
 =?utf-8?B?bHk1c0Z6ODRkbUUvQSs4ckF4cS9wOCtNZHdiQXR4NE9mMU1kSlo3akMrSmdw?=
 =?utf-8?B?WTNxSGhhRXJwL1pmajlGUnBmaVZ6SXN3YlBZWGpWZFRVTGhiT2RGMWw5ZGt5?=
 =?utf-8?B?OUk2cUlxNXBWWTVZUHRHZFd5a2pidnlySkIwNnBTM0R2MWp2N3dKRWJDZTJT?=
 =?utf-8?B?Qit5U2E5b28yckhDYmFta3dHdjdUTE5KZTFEa2lmVTlkWnZMTTdiRUJRa1dk?=
 =?utf-8?B?UU0zMW9wY2swWVNQTnNiWklYdm12VDV1ZG1RZGp6UEZ0T3FGNHJsYUpyalZj?=
 =?utf-8?B?b2NtVEVvYlVNUHhaT3NESUNUbm1EeHJBZ3pjU0hlS2w3ZE9NWFRJZysrOVRj?=
 =?utf-8?B?SnFDeE9QV1ZvM1FSMnlVdHpwemQzcTlTRndMMjZPeVdrcXg4b2VDMjFlTkps?=
 =?utf-8?B?TFFzeVFSZmlTZ29aSVZ3V0YwMGE4VUVSeTFZWW1aNEFoeUNpK2k0TzZlbGt5?=
 =?utf-8?B?V2xSdFZVWmFqeUkxdDVtTnViR0kwZU1ybWF2NmczejJISGttSmhJMHpoamto?=
 =?utf-8?B?Yk5Kbk9kaVRDYTdjUVNmZXQzOEIrU2hkY2ZUcUZ4bGh6M0lCNEdHY2NRQmx0?=
 =?utf-8?B?dlhGRXpoZ0NEZmgvUEY2VThiYmluSXZsNWJydkkyc0dmV2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGpQKzBjeVo2K01ybXkyTDVTZnhlbi84YzRPMzlFRGlsOXdBNFdzdks2Nkpo?=
 =?utf-8?B?RzVkNlRRMDM3RCtEOWZ1TmlERDFtYVNJQzU1a3BvWHYzSGdZL28rQXVaYnQr?=
 =?utf-8?B?Z0ovNWt0ZHo4TmZlSWl5UGxFYnQ1RmNIRHE2OHVMcnBPeGZSZGplUStETms1?=
 =?utf-8?B?RGpscUdhZ0NVUGo4RTJWYVBmUG5DWDhSMjBOTmJIOU9rc3ZVZDZqak96NGFo?=
 =?utf-8?B?UHZJaFBPZTBINVpyNTV6N1ltR1IvQUxucWFzZWM3R3krU0ptZWcwdTJpc3R5?=
 =?utf-8?B?K1RtK2YwTks2eHAxRFF5dGpHRlZ5aitZSlhvK0dJSk8rakM1Tk55VE1LSk15?=
 =?utf-8?B?RUtMdHdTSzZjWUdObENMWllSNm9OMUwycDN4a21HZm1RQS9qM3UyNXRFbmlp?=
 =?utf-8?B?N1MxTmF4SmJwU09VSEpIRWhSd3liZCtQNURYbzlXUUlxWW1JY1dqeHhrNHFh?=
 =?utf-8?B?eGl4MUxNK0dKOU5ZUGZJOHRVOGR2K3hLZTNvcU1Hd0lULzkydVZUcks4b3lJ?=
 =?utf-8?B?QVRGaXJmNGJqTFVCQnNGVm1ueld3WUk5aExsUG9oU0srT0JqVU1kZk1HK2tn?=
 =?utf-8?B?S2ZLNDJiZE9SOE5OcFBKNDkxbDJINVRzZnFMc0ZMcXRpZHNuUEVrbzR5MEN0?=
 =?utf-8?B?M3Z2c2xzZm4yM3BHTzN1WnZFT0VZZ3J6dUJ6SmNZR0wyUHVReDBJWXVYNjJr?=
 =?utf-8?B?cUJxcnM1MGYrYVYwTVRuMjEreTBLSGIwYWg5aGlyMkpSZHRxRnA1WE01YjY3?=
 =?utf-8?B?Yzd1N2ZrSkowVEpqQ1J4VnF4YWpiVlQycHlPOVcxbUIrRkNzdFZSSXYra0VX?=
 =?utf-8?B?ZUE4UWQ5anZCYittbmFiTnU0SjFsdmJJWXphblZ1ZE4zSlp4TWJiRm1ReTN6?=
 =?utf-8?B?UkZhUk5jZkR1Qmc0WW01RVM1UXhMdE5RWVJBMk9iTlFHOXJaaVdRWW1MU1c5?=
 =?utf-8?B?VGh0ZFY0VnN4MUtUL01IVUhBdnIwMW8rTTdDQit1Q3ZocGxHOWlMcUVpVGlL?=
 =?utf-8?B?S3hwQUlQVzhEZnFuaGM3MWRUVGd6eWtFRWZkblUyNVZEbVkvQ1laZTNEVWhJ?=
 =?utf-8?B?Qy8zeEdtakpJZ0loS0REeEJjMHJCK2k3S2dST3Y1QTFydTVRTkF4QW45dWtF?=
 =?utf-8?B?TXBnUG1ETlNoaTFOc1J4cFJlWDRWcHpNWDdGaU9raitsblF3U05DL0VNZXR2?=
 =?utf-8?B?QStkcmxROVpwbGpXUGEvcUFNcFhQSDdXcllQeUdxVW44d2czck0waXdkRzE3?=
 =?utf-8?B?bkFTQ2N2OGhPRzUzejZWUVJmVHVFdXR6NDdtWkh3RDRHL0xPNkt1Mkl0OFhv?=
 =?utf-8?B?SGR1aUVUbVlXQ2d1MXlINHltQ1JXYjVOWEtBWkZBeG54T3k2WG9Mb3RuSWcy?=
 =?utf-8?B?eTRQMEpXcWhzS25rSWRTcnVCN2VRN3JRcjA2YlpwS0QrMEdSMnlqUVJMQUly?=
 =?utf-8?B?V1VrNEVHdGp6UE00aktJaVlVdDhZTTFQVmxLc2RsQ0h2NXR4L0MrMDVNbnpx?=
 =?utf-8?B?azRNUk5FV1pVT1lHRTY4ckdYTzVSbjhIWmhWc1RZTzN0RnJpYlNxdWk4MTN4?=
 =?utf-8?B?bFBTU0c3d3lYVnRPVDZ3cUUrMncyRUhaNmJ5TmN4WFVOUlVlZmdqWHdRNlda?=
 =?utf-8?B?K3cxV1NRWjNBTXp1eG1vWFlxM0JJd3NFL1lCdzVqVENlWmRoRE9GWHY5Rm11?=
 =?utf-8?B?K1FOUFZJNnRvWGdKSnZCc2hzVUZNS0NuSldKZWVZNlBLL1crRjhmMVpqRDZk?=
 =?utf-8?B?WjdWWEV0eHIvY1BNbHFrMEFPbjBVM1pWN210TDF0NHhqb3BPbFNwSjdFald0?=
 =?utf-8?B?ckE1L3JFOWlzNUhJOU51Q3ozTzhraFJWYzBOWWdYaktPM2lyQ093dFFPVkIw?=
 =?utf-8?B?cUdZUDdnSGZFTnV3ei9iSUNxdDZSVFRWQ0RyR0xDM3ZSN3hOd1ZZU01ad0hG?=
 =?utf-8?B?WGxOcWo5ZGNkNVRZWWh2R0hxeFA5VUp1NnBaQk9QNlFLT0xxRUZJRjRxZlZD?=
 =?utf-8?B?bitTaHlQVStlcmxoR0JLQ0FRWi9uU1h1WDVtUyt4Nklyb28zbWFUZGhQUi9t?=
 =?utf-8?B?STg5eHN4eHdleTZoaGV6Syt4QzN5dGNnbThxSjZaQnFDNmdmYnJuNG1LSkc1?=
 =?utf-8?B?ZzhZUDArU0docmJKNHRYR2dCZzFTN3pwdS9Sa3ZrWXp4RHpXRDlBU01Sakhs?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa4fb05-d519-47b5-e0c3-08dd7e01c207
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 22:46:57.4011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbp2AuckPgGqqmSf859jwMRcsj/IBoDMjaszMVuiNpMd7bqiOKN4aMiIjhheP3N/GcWD17oDWwZg4CFeD3wjdMn05ENq/aJNfsqHqLp4Ptc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2AD6B04BA
X-OriginatorOrg: intel.com

Hi James,

> diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
> index 7a39728b0743..6eb7d5c94c7a 100644
> --- a/arch/x86/include/asm/resctrl.h
> +++ b/arch/x86/include/asm/resctrl.h
> @@ -210,6 +210,9 @@ int resctrl_arch_measure_l2_residency(void *_plr);
>  int resctrl_arch_measure_l3_residency(void *_plr);
>  void resctrl_cpu_detect(struct cpuinfo_x86 *c);
>  
> +bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l);
> +int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
> +
>  #else


I noticed this while reading through the telemetry work ... the custom
appears to be for all arch helpers to be declared in include/linux/resctrl.h
making these two stand out. What motivated their inclusion into
arch/x86/include/asm/resctrl.h?

If they move to include/linux/resctrl.h it looks like enum resctrl_res_level is
no longer required to be in include/linux/resctrl_types.h.

Looking further, from commit f16adbaf9272 ("x86/resctrl: Move resctrl types to a separate header")
the motivation for including enum resctrl_event_id is to support 
resctrl_arch_mon_ctx_alloc() and resctrl_arch_mon_ctx_free(), but looking
at their definitions in arch/x86/include/asm/resctrl.h they are using "int evtid"
instead of enum resctrl_event_id. Looks like their definitions need to
change?

I assume the pseudo-locking arch helpers are placed in arch/x86/include/asm/resctrl.h
with the implicit knowledge that only x86 will set CONFIG_RESCTRL_FS_PSEUDO_LOCK so
avoiding that extra handling in include/linux/resctrl.h?

Reinette
