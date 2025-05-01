Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3238E1A38E3
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746120726; cv=fail; b=V/c5BQr037mVAZA/KH8LmVshJqoZCubza6Khh8lXnQIFzqCb+gwjOtjea6VQzgsvDFJ+eCxY/wDQt0lXO6RCB/tSwlmamzEBdgN/OwQVGaSHapM5kR0YCvP3eVFqVB/1E5GTxn3xD8e4H8MI7o9F//IHHvuXMaNSlDN7nG4hX4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746120726; c=relaxed/simple;
	bh=aAw69eWeffL+DLqt2SxWRHnI898bL/px1LXUDFY12Gk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A8wbP6cwsR1V661wSTObRNbUlqT2dKYj/C66I9sVQUT29RFVADvEK1V+O8YdVNh8n0KRPRtZIYwUMED0DVM2b29uT6AdCJSTmwLhgoxNiHrjX3bRjXsgF7eUIW/yPn3WR6eHW2yAVK0j+J42MMfGVrat+uZXWcjxRvfFwAkr7PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdjUbyAh; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdjUbyAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746120725; x=1777656725;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aAw69eWeffL+DLqt2SxWRHnI898bL/px1LXUDFY12Gk=;
  b=OdjUbyAh5RbEx+6pjgm95DRZXftPKiHh4hrCwFD+hRDzUOF6xbllHZo0
   yiuqNoG3xmzGirQahQijKn8scuQqUB6HETp4BKJ1lrNs3isf6GcnxITPF
   Ps4yYQUaJ6Yz9n+dEFd1zOhzmLXdL+3GGLAt3BzUliDASIwp6a4QHonuf
   PUgsfHOcrq7q7CS6cL6fNe9lSobUu9RdShOmXvMOTzkU52ftrBcjsQJM+
   OlEzUb9Vr34zkVJt6sqgQP97/ajIT7hUbSnHdn69IrjHbCkfwn9qbIeHh
   LdPBBXRFkX2pWrKBGIB4KOoDvPEFV5X8idaeMNqecvVH7yNmnZMAq5n7j
   g==;
X-CSE-ConnectionGUID: uelPpyYJSZ+kUzEkQE5CVw==
X-CSE-MsgGUID: CdDipidYTs2kP4DApMmjjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="59185969"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="59185969"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:31:56 -0700
X-CSE-ConnectionGUID: sg60aiPpTBK1d9a1XT3BZQ==
X-CSE-MsgGUID: Jexky09QTcG24lc2jvASVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="165361055"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:31:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 10:31:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 10:31:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 10:31:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/lj100ezElS2QJhVmmx9Gk/xK4d6Nxu3ANY/i3X9YrTGqluLTT04ccYcgHp7xqa6R6SFxyoP75h0ghTWOdL7TEsb2jhvn+02ikd+3lCDax6ceUdTE1I8NbPErlYtnSkzZOt4WmjNij7+bw7DWZmdfBLYLlJkfXIEIjwpqo+kDJFyU0YGAOIIhkAJVJ5vcSbbWekkTQLSFBIIq2A9t3p5Lh21Dqqac/h6YYYRnbwOm8Z+jtb9WsFoK9aEK7y3aRONsB4SrntCP8mZjLm3nclj/58Ae+Hb33WPNizw9r2PqxQ2SFGXDEgA0mxU/nZpvFaLB3WnFJSDk8Kd5o9QZgbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0PbLbb+RpxT0VvnqRUuPwdh3TVJMUwLwmMyfJEGd0w=;
 b=dnNBLXHm19b1rX/lH6P+uzIRxAS023Ul0y0pLU6wbTNBRAoFLqA5OmT/g9j4QUoJQWR9f596WyUl/GyGaZ607iJv0jlkCDDN3xV4IbjGj6OUTKtRgbfzpYfTtsFjP9EcmosdbJZfI5XIdXnZej7l+haG0MZP4ORt09KTyQhIFlGIPl88XeFPSNsv8BHa0EdmFm6H0gxUmybI1pAi43uZ3qr5SJLfsfl5t2Tc6MQ3UPmQDv6VWvmdsxCE+502cg7JkiFnLCTe+0cwQ9k/Nl79RvboUvgtQuRwNzN2qbzBymrMDIFT1l6e9PcYlQaR99nAqXowbWp+h/T1FDRh2cAaBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA1PR11MB8788.namprd11.prod.outlook.com (2603:10b6:208:597::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 17:31:46 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 17:31:46 +0000
Message-ID: <941faef0-eaac-4105-ac8b-72f370c5aa07@intel.com>
Date: Thu, 1 May 2025 10:31:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 19/27] x86/resctrl: Always initialise rid field in
 rdt_resources_all[]
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
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-20-james.morse@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250425173809.5529-20-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:303:b4::30) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA1PR11MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a4c1a3-44ca-429b-18c0-08dd88d60be1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2NmRDRaYVhQeXBzN1Q3VkV0WGIrb3VLWUlPMHNvM1A0c0lIQXFMYS9ZQkZn?=
 =?utf-8?B?bEErTTBqZnpTVGZmamdsQ2swVnhJaFNHK3VINXVIUlA3Q292bmRnNTk3Ny9C?=
 =?utf-8?B?c0t1K1djUmI1L1IxajN4TFJZNmw1Lzl1ZzRpRUhLV3YweDhYR0FwRzl0eSth?=
 =?utf-8?B?aDU3NE9wSUxFdUNNKyt5S3dzZjBsdE1WbWhFZ3d6SHo2T0xqRXpKMU5NTTcy?=
 =?utf-8?B?MTBlV3kxemlYSUwxM01VWXNHeVZxTHZCa3VDRFdmR1pVMldxaFF6RWxEc01O?=
 =?utf-8?B?bDlIRkdpU0ZPNWVXTmlINjlhckd4ZElSZ1VBZ2hMWG1tKzcrNTBqN3BYRWJK?=
 =?utf-8?B?VGtCa2dJKzk3R2V4bkxSV2xzMy9DYlp5Wi9HNlFUd2sxcThUcHVObnpuL1lq?=
 =?utf-8?B?bWVVSllrZ1BhRysyOXVLK2w5SkUrNWJraUZLVnA3cS80SXNpaXNKYnI5OHUy?=
 =?utf-8?B?M3pIeWJMWkk2WVVWTktnckRIRWgrUnFlKzI2ejRwdk4vOXBwOEt4am00YU8y?=
 =?utf-8?B?K3RlN2Yra1U2WTdlRDZGWUVEWXBmYVNpdnJ4WEExcUhqOGdJQ2tIbk5DbS9z?=
 =?utf-8?B?NGEvNWU2RkVwMFZMbDdjT3JjMTlhdGdUMmI3SWVsZ0paUGV2blV3MUt6L2p2?=
 =?utf-8?B?WVBRazdHTVZHZEJwRC9yUlY2bkJTQzJnTkM4QVlkMHJCdE03V0JsQlFKeWVv?=
 =?utf-8?B?NzJiWEF5amhjVjcrNURZSEt1THdaVTJTQUFoa1EzTjRIU1ZPUThmVWF1Tkls?=
 =?utf-8?B?OVA3SngyOHIzYmJTYTBMTTZ3bnhBVWE1NDdnMDF6bzZoL0haOHdGbU0yY2Vh?=
 =?utf-8?B?WlU0SWRadWxCU0k5MG9RakJjdnlSZGI4Skg5WTF6djRSY1FQREQ2QW03M3pG?=
 =?utf-8?B?M0RSZE4zN1ArVkpZK3BQUERFUG5CbTN2RDRFTDU1UUtpTExxNHozeUg1WWRt?=
 =?utf-8?B?Mmo3aHBGdThtQmxuMUl4bzR4WU5SQzk3RTBDQUFuUUhrdUZISzVFdnpKK3hP?=
 =?utf-8?B?cHhnc3RvMEtmN2l0cXl1ZmwvV2JsR3ZoaHNiR0U2djVYZlRPMXZPOVNwdGpO?=
 =?utf-8?B?bzhwRFl2VVNQaVpDS01DTFlJa2JsYWlUWGZrQUFqTjVHZEcvTVR0VWJ0SjRk?=
 =?utf-8?B?a0VxakVjYi9XencvaUR4bFp2R3NyNWt4OXEvcVVWdG53QkdzaVpaM3Q1UWF4?=
 =?utf-8?B?ZXM5aTNhbGFvMXNzN1hNSEo4a0JlUVBkYWp1cEM2Y3hiczgvdGdLQXlPU3o4?=
 =?utf-8?B?UFRZckdlWkgyQW5NWDNHQk4xQzBPL1BXNXRrKzQvWEpneitYOEt3b3hTSUlU?=
 =?utf-8?B?ZWJFS3htN0tKditNUWNOM3RtUGhSTFRPUUpEdkxWZDdDMUxmMjI1LzNOTHVE?=
 =?utf-8?B?MzBpUWp2NEZMbVU4SWE4alk4VDBsWFE2Uno0dUNLNE9aQVFwU3c3YnFnS3gr?=
 =?utf-8?B?Q1pFdFd3cEZiMHRXYkV5ZFlrcTNKWXZYdFdoemFoSUhlUDhXQklISnVPL0wr?=
 =?utf-8?B?cmJJN1QzMHlITGgzVVJmT2o2WTFyWjdWRXZQZHNTU2lYNU95TWpqYjFYTk1a?=
 =?utf-8?B?SFF6aTAwZzJKQXNCVlkrVTdmNnozZGVnR2s2SkRaOHNaakk2b3dpdWo2N2s3?=
 =?utf-8?B?TERDcytxYUlTODF6OHc2bEtmT3ZDakhWeURLU2JHTVpxSEFicG9yREMxdmNG?=
 =?utf-8?B?b1labmRxeHhRUFRxUU5mREpTZm1heC9pNEQ1cDBCT01nQTJRQWlRMFhVNDl4?=
 =?utf-8?B?azZWb3oycEJxdDhkbmxySy8zVmN2bTJYNEpZbmllci8rZEVYWitGamU0WjNN?=
 =?utf-8?B?WWUrdzZEWXFwYitMVFM1VEczakVsa1pIN1ZJTnZlR1BNTXRHSTQ5cUhtTjJB?=
 =?utf-8?B?VnVaSWNaNlhISGNtb01lUHBjMTdqdEI2M0pMMVJzQnpRVTFFY3Fpcmwxamxu?=
 =?utf-8?Q?CDR54ICx6JQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXBQUVk0TjBpTEJjZk84NFpMc0tOVE93a2Fmem0xWjlUcUV0OGlZZTFDQWJa?=
 =?utf-8?B?UGwvZGk1WFNlNmliaG9EWmV2dzZjOWVzTUdUL3F5Y0RVL091bkFFYnVvNXk5?=
 =?utf-8?B?TjBZb1h2UVMxTmVKNk9MZ2pDa0tVd3c3bDduNEJTUWt0d1NZNzBoVng3TVov?=
 =?utf-8?B?Z2Vpb1VoeERub0QxMGxQMndRZFRIZG1DTlBtc3JPVVI4bERXQTJWaGJNT2FP?=
 =?utf-8?B?S2g0Ky9OblFtQU0rSXBTdWltSTBPM2IvLzYxWmRKbmZYNzhma1Z5MmQvUVV4?=
 =?utf-8?B?YnlwYU9UMXBveGZvYTN2Zktkakk1Y0w1c0lVdzFIMXN1NW5GalZqemEzSmE2?=
 =?utf-8?B?V0x3UjI2VmxpaWNhRG5EdVpSV2dlK2NnMldDN0tRaGVLcURRTk95RmtOc1gz?=
 =?utf-8?B?Z1E4VDlWcXJkVXRFOEJZZ0xlcG9Ub1V2V3JQTmxwUWF4T0J2YVNJMnZ6SVEv?=
 =?utf-8?B?Vk5GOHgvUytLRGw5WHREdDZKbVVqVEpRK1FkSENnYVVHWjVHNlhTbGc0cU1R?=
 =?utf-8?B?TXg1V0VQS2p2UlV5VGpWemVDNUdLN3Jiak5FMGRGWldkUUlZajYzRHlxck5p?=
 =?utf-8?B?Qm9NSk5WcGt5Z3lLQlEwZThvbjJjOURINisySWVwS3IvS1YzdHQ1d2orSy9s?=
 =?utf-8?B?VnVHaXZ5aXpDMlJ4QThLTVIxWkRFWEl0YURiVnZwWXA3ZGQ4cGxIZjBUdWdx?=
 =?utf-8?B?SUxoMElkV1NyTWVTVE56ZVhGd1lDeVlhTHloaDZKYkVYcE9HeVNkOHNna3Zl?=
 =?utf-8?B?L1VIOStIZ1U1SjRsd09hV3RNT1lwMG84WktIUHJKS0FubkYyV1pOWDU5cEpm?=
 =?utf-8?B?QVpQYmtxSEMwSFRjSFRHa3dKbzFuRWZEdWdYTzZObnplWEpWcWNzWFZtMGYv?=
 =?utf-8?B?bUhLVFVqWW5DcFExVzh4YVhOM1BZelQyamVvSU5PdHczWDUvR21tbkFWeitF?=
 =?utf-8?B?MnNnK1pia21SNmEva3VseE84azJ2NldZQUNhZDJkNVVFTmFaRk4zaURLVG1D?=
 =?utf-8?B?amh3MzdtZ3NTSGVxQTZ1VWtVbmhkY25ySXk5M09uT2ZqVDFCYWt0SlU2Unl5?=
 =?utf-8?B?NXZ3UGhSQ1FlSnZqZW9TL3RZWlhrMm54L1NTVkgzbWsxcTdoRzQvV3dubjFC?=
 =?utf-8?B?by9iQ0NLTk1Gc012Tlg5YkR2Yy9BR3BYUmpRTjY0Qlh2OEl2Sy9xN1pINlRi?=
 =?utf-8?B?d3FXZXRkbWlDWitYL1QyVG9PNzdYWmFXVEdOaHpoamtLbEZRVEdBNUdDTGxU?=
 =?utf-8?B?MHk1Rk43L0dmUmtUSmwxbUFFWXplMmo0MXpMdGVFSmU3K0pMaUtnYkp5QVNF?=
 =?utf-8?B?em1PQ1VNVTFJRFZGYmNiYnBrZ2k1K2Y0MUg1K2ViQnVIWEs5cmtkV05XbEpG?=
 =?utf-8?B?OHdpT09CYkV2Z0hkWkljM2ZzM2Y5RXVLYnJxSzJSaDlhZkMySElUdFVBMm1k?=
 =?utf-8?B?T1ZJT1UxSXhHZHRrUHZWV1RiNVQ0OURXYzZpTmQ0b1hxc0dCU0JFS2VrZXlS?=
 =?utf-8?B?N0VpdWxTdndQU3FFaW8vT1Y0Si9vekdmTW1sMXJyQlQ4Z3FzVGtHTGdsaU9a?=
 =?utf-8?B?anh1c3V6NTdlYU9PU2dOY1JGOUFEeTBOMEdyakhraGlweWRBOVZFV3d2dHhp?=
 =?utf-8?B?YzhVTVZWS3h4dFdxRllub0RydkhtK1hXQVZ2Y09yUkpFQnRDcTRENVBXdTIv?=
 =?utf-8?B?elBqSVBvWnF6b3RYTFNtRE9ES0ZxQW1jQzRoRXVaQUVndzdENDNDR3NJdlgv?=
 =?utf-8?B?TmthdEFzVld6c1lQa0IwcVppazl1TnM3TThCUkUyTG1HVVBSUmVEaUdja1NS?=
 =?utf-8?B?akQvWklnczJ3cDJhV3JZbW82b2UxMW1XTlQ5TCtFY0w3cEJQOGI5ZFoyV1Q3?=
 =?utf-8?B?d0ZRbVBWMFpNSCt6Y2RPUEM1VXZsVnVSYURnbmM0Ym9UczI3OS9tSHdwam81?=
 =?utf-8?B?Q0FiY2pmT21rRzg0RDlLMk9zcnVkY21OYnRzYU4xOHhHQXB3NGhVbG8veFd5?=
 =?utf-8?B?MkdHVDg0dUY1SDA0TS9Rb0dFSWRsSkl5a2VaYTVQdVRnVE1KdmZ1c3ljOEpn?=
 =?utf-8?B?NzVNNzlRZVhuYSs4MTl2Q0lreW9UVEozQ1FudjlsbUp4eGJrUEgvYTZUZmpz?=
 =?utf-8?B?eUx5bW9mbUZLZHRxNnU1SHk1TW1pNHNBZzA1alJ5UktiNk9WV1ZtRU00bjBl?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a4c1a3-44ca-429b-18c0-08dd88d60be1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:31:46.2149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uzrlg+Q90ZGSiPaKwx4y0Ialqm2lwLaQjXovYJ+4dSzPu4NbgYNlt+xMB5RqyGAQKEpyP185WrpigLCj5EwxxPxZgsXhvi6vzsLXsZGGBgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8788
X-OriginatorOrg: intel.com

Hi James,

On 4/25/25 10:38 AM, James Morse wrote:
> x86 has an array, rdt_resources_all[], of all possible resources.
> The for-each-resource walkers depend on the rid field of all
> resources being initialised.
> 
> If the array ever grows due to another architecture adding a resource
> type that is not defined on x86, the for-each-resources walkers will
> loop forever.
> 
> Initialise all the rid values in resctrl_arch_late_init() before
> any for-each-resource walker can be called.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> 
> ---

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
