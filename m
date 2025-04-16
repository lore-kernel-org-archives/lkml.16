Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA292F9DA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744770694; cv=fail; b=hsHi/v1s3G+mK+LdmS+aVkJUT9CPQjxWblQJfPKwyCSYmmye74lIB8AlAO69LYltLnpALRDfPuY+GbiNS3AdKT/qbzdf064+cpul1v2oVqkBb4chEE5KG+DMMQK5v2zTb5L8Ewg/zx8x2jixlpzUUgXQk1AuRuCC9JZhI/1o4EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744770694; c=relaxed/simple;
	bh=vuNaSgNLfaV0ENb31rJJLGH5rOnEytM0DwdbvZV5xRI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kqRSvA/P4GC6XLCyjovkogJwUASD9F721Fj7xRM37+Sr6GNJX17WSOxA/iFMwMFYgLlKJ2xPYbnn224GBHeLM5KtrgAwA+HOGFyWz50wNrJxbl/5wSgyvOC9Sd1YoAwbXH3cW/TVnWjFHekVGcvPuHzTjXhqb81lAC1OXFsAR7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LG3sbDOH; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LG3sbDOH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744770693; x=1776306693;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vuNaSgNLfaV0ENb31rJJLGH5rOnEytM0DwdbvZV5xRI=;
  b=LG3sbDOHNCNfH40OFJ3qmws4uf9XR7bjaDcKgT5yYm8zk3E8HoCnRJYf
   O9HYBZlT5rCxdcYn9/s5t2p5QJeO3zjn3I91HutwpKWG21Uq9umdCFS4v
   Hzpt5RvcjyaMKm2MHiQDDsEbl28hw9wP8pPUNdLMsYmK5c3HvmcrMb667
   m1oRYK/WWdtMHtZr/Yv/EkIjoIsB/c61IOwXwTE5KOwuEsHR6p5Nl3r03
   hFdGoQy2FRPlSgE74BOnbupPkn/uPgN44FpW2hdrJ+Uysw4CDTOUE+bmc
   AdMLNMJMPeTrdiZxcMC14TQBtkhn2agVTJ1d19XmM9ZveSVyUiiBXi60/
   Q==;
X-CSE-ConnectionGUID: DT4V2cP+QG+upysSRZ8Sfw==
X-CSE-MsgGUID: Lxp5L8ksRxeXTzBlCzUKtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46319488"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="46319488"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:31:32 -0700
X-CSE-ConnectionGUID: 0aGNBiCbTFqI6Ant7Hw8BQ==
X-CSE-MsgGUID: tbgoBQJ5TI6EX2ucgXLkwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="131262600"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:31:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 19:31:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 19:31:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 19:31:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVNckLSRJ9S9JlSoRz9+JJ9tntBhOjfePhYZhVKwWLJDRLL4eUbluI6bK3Rrgzey91oImSrmo0m4oGWk7SQP3ifSpOmpi6DdKdfMrbiVNRF6i36ISTQ/FQO+7K39oENQLY7xl+cb+lQY+/tanQsrFHDJKuD24J4yJaF8M22lLZvALD+cWbAr2P2Y/BiWRZVF6NYeZwv0doqeXErMtgiX4SjDW3iJAe9Why97gBtfrIlQ12eBr+qh+MNjUN6LvQkkUKOvGcTJZFFuY23O3+h7yKII7hXXDV9qELXj9xsmCMyZ2J45E/T+UVVie+aHB09ELKsSlZrzcMhTFff2csN4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IQ+LfGvkH6lTCO7NrMhqOYutd+qeKN+JH0nx58nxyU=;
 b=aN/c8lICRu1qmapquvKFlXxBaJFffpwo9G0Ar3G3oRXHPdCZqgbH8gcgUqR8BwO42+BFRrplfbEMtDlxpAjcZeHiE3VrdOmh16tpxKAl2lvQL8E8A5W1qXI5JQ/1ZXxMq63dVzPP0gd5C8RjyskH5x0RE22UUrbLyzhGf0tMFMOQbSd5/jS10ZE9uVahtqebopyHyoOM2dd5J0st4CsY/ZlOrNGZ4jTQBc89wzffx2qn/Hi/r+g0+X7s/+N3wLkW00w/rUneQp28Ykx787LUaIrT6KKF5/sZi6jaSgDmh+hFKfYev1ZMy/KkVK1ToQJzKTnJUYIs2UGjk3PQWXSCAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ1PR11MB6179.namprd11.prod.outlook.com (2603:10b6:a03:45a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 02:31:23 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 02:31:23 +0000
Message-ID: <48c4dc43-a963-4d6d-8d66-021e96ce3c58@intel.com>
Date: Tue, 15 Apr 2025 19:31:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 21/21] x86,fs/resctrl: Move resctrl.rst to live under
 Documentation/filesystems
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
	<tan.shaopeng@jp.fujitsu.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-22-james.morse@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250411164229.23413-22-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:303:83::33) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ1PR11MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: dd8f2b4f-bfff-43b5-9ff7-08dd7c8ec7a0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SE9sMCs1VWw0TGdGU2IyOGpRUFdqaXRueW5ZT1YzaGJVSUV6VEVvNTZGbjdv?=
 =?utf-8?B?dUhxUUJtMlR1OW82d3ZYbVVScmZUWkJYRXp6eVBlRS9UclByNHQ1OW1TN2ZT?=
 =?utf-8?B?NS9FU1MyNi95Y21vR0pJQU5NUWxvZFhrUVhxOE1RaUR0b0VMM2hsWklqME1n?=
 =?utf-8?B?ZVZNS1Uzam43VjJzaXkzREtValJseXYzeDByaldqWFpYdHA0NmJUT3g4a2NK?=
 =?utf-8?B?V2JHY3RuTzBEYWtpZFc5MkpBVmFVWmNBb3BheW1iR2NQNVAxTmxVU0QyaXdr?=
 =?utf-8?B?VFZvZEp2a284SlRnWFVObnFDemQ4MjlqWUlTVWlocnFZMGVXcXlzOXRuOUJ3?=
 =?utf-8?B?eUNYdzFGZkhTZlQ3YW40bVVSbXRmbE5EVVByVVZTQkZSMldHRkc2QXY4SjRQ?=
 =?utf-8?B?ODRmcEs3bWdJZjB4UFdtZUkwMlNHNnZHa0JTT3Q0T2ExNmNTVEdCU3hKeDAv?=
 =?utf-8?B?UEthWWFwQk1vaHF6UVJ1VmFlelZRNVY1VVJFL1N1b0orc2xMTEJPUlZsQkNQ?=
 =?utf-8?B?S0RGaVNrQmlacjJZQ1hmT2VwTjZCeWN3NkRFd1FxaXREY3JuaEJ4YzRibHZj?=
 =?utf-8?B?WVFaaGgxZTRoRWxqd25WSU9tVHFINlNCU1J3NjJPbmtVWVhMem12bUYzMzJQ?=
 =?utf-8?B?Z0hvczBYSmpzN3ljUStzTEoxU0VmTTdhYWtKVlJtZ0NQRXgyN3ZmUjJuWjM4?=
 =?utf-8?B?aThhcDNjdEJqWEVXYVFwcG1zSmozQkYxWHhCYkJHcFZkWGk1TkNBN2VSOHVz?=
 =?utf-8?B?ZFcwemx0czc3WWhaSWxDM3ZaMWNXQm1ONWhhWEFoYXdxUS9GSzdWL2ZjNERK?=
 =?utf-8?B?aTBRSnFhdEtCQndzbDY4cFdkYlpFdFF2bXovNDBzeFJUam0rek5FWEp4SzNW?=
 =?utf-8?B?Wm1LSFR0WHFaN0g4dnlwTlJKYk1lc2xzR29GMTVIdlltQ2tzWHBCbjVDdGIx?=
 =?utf-8?B?STdBL1VqbUtCUC9UbFNqSFBXL2NGcEFsUFJ4TWdqTTYzZktnUXUrMEYxL3Va?=
 =?utf-8?B?WWpOVnZnK1pyUzhBd3YvSTNaQlE1bnR3SzlXQURoeXE3L0RSbTM2WUJKbXg1?=
 =?utf-8?B?ejRibVF4U1MxdXpDZTZybC9XeVp6QWEva2hhMFlNV3Q0bWtuT08xbFRXeS9Z?=
 =?utf-8?B?Q2tkQitMeU9KZDZDdU5ycXRCdFFHa1Q0bGtieWdlV0puNitibjBWb2plQk5P?=
 =?utf-8?B?YWdnM29BVG04WG5hemNobjlFNXVpYVVVUnM5ck9panllOEROWHdoVnd3N21k?=
 =?utf-8?B?d3lVYlY3OHI5cnQvYkxQdDNXckhYR0ZOREJvR1J0MlhLQkgwZDMvaTJEMkNB?=
 =?utf-8?B?d0I3UVdCUWgrUy9lQWVHYzJDRDg1Tk9FS1FvNHFjMUl4QWJjODdLRHZxaEw4?=
 =?utf-8?B?eU9GNnJpTXMyMUQwaHEwbHVrdXNqU0hGbU9Ja3NXNWZwcTlVazZCd1R1WUpW?=
 =?utf-8?B?cE0xMUQ0V1hZeVpzR0h6S3hwYS94VSs2RHlTOW9aa0MwY0drc1kyVHBxNkxL?=
 =?utf-8?B?ZWNXUFBlWXhqMjVvRXplT1NGcFlUYTFsZ0dxeTdlL0tBTExsaVozQWlWSnpo?=
 =?utf-8?B?SnZqRkd2cmlpZXRCN1BZTFdiL2N5SFFUbkZ0OHNHdFFBSGtXL2RERnZBaGhz?=
 =?utf-8?B?elp2ckpMMnN4K1l2VnpwN2hJb1B3K1A3dytVUjlwenROaGVCNG5NZjhBMTBw?=
 =?utf-8?B?bDBGZHIwYUpUZmREcmtjWm04cktDaGQ4cWlIR1d6YjhzUFZ0M2dlTXRJMjR2?=
 =?utf-8?B?N2FGQWx3b1ZsajBTVzF3ZXFwT2duMlBkTnRTRVNCeHVYOFZpSXRyenhiWXVR?=
 =?utf-8?B?VGh4QzQ1Zks0Snd3ajVCMERYSElDZ1lwazl3cWgwYk5hSW1EeVNSdkJ1ejAz?=
 =?utf-8?B?SHpIMWpEMXlsSndsOTg0c0o5S3dxUmxRT3J1dUEwejNRNnBubkpQbDV2Y0FN?=
 =?utf-8?Q?Q7Er6VBctKM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXExWG9hR1JhQXJReFZsYXJNZVN0aS9HenEzUk5xRVk1U2VMRlFEQTY1QmUv?=
 =?utf-8?B?Ym41ZDR3RUVRamZkOFQrNGVsU2h0VW5xK05qcmI3Q3hpeGVQcUhjdktKQ3Jp?=
 =?utf-8?B?Z2RvR0h1UENFVkFKT0V6cS9TOGN5R1I0dlJCdTgrRklaYlRaaDM1VmpmYW4y?=
 =?utf-8?B?ZE5nTzRsbjFvOGdQV2FZY0Q3c1UvVVpkODVwdEt6YW5NN1R5TmRrVFpDTHBx?=
 =?utf-8?B?NjdmS3pZZU9WNWJKYkloS3U0T2NCdm95dzNtWDVCMXY2Yzl4a0pubFhrUWFD?=
 =?utf-8?B?MDNpaDhZaW80algyVmc5LzIvbEhtVXEvS0xhOW9xbFI0V25DVVB3NjZnY215?=
 =?utf-8?B?K2d3TWlMUktzK1BiRkhjZDVvU2RqV1M3cTVsVXA3OXdkQjVBYUdvYWU4TGQ5?=
 =?utf-8?B?VFc4VVpZUndUK2kzVExTbURPc3E3WWdoMWFUeHZ5VVZWNFJxU3hHOGpvQk9W?=
 =?utf-8?B?UVBWaHFJSDJ2VEpDNWZzTjdhTHc0VC9NY0FWbFkxNUpkck5CNnpFNTByZklm?=
 =?utf-8?B?QXNKS2VKeUhXV1BTVDBGakNIYjgyTUlnNUMzSjZnbnVYRkl0MEFlT3VuNkEw?=
 =?utf-8?B?TURsZWNPZ3UwQTlqYkh4Q3VnajBYMytkUGxicWM2RGxKUDZyb1NiNTRPNkZF?=
 =?utf-8?B?amxEeitTRlU3SVVRYlMvSWZFZ2p6OXJQUE5yVTNUWTk4RE55Y2xuMzRXWlNK?=
 =?utf-8?B?SVhCUEtnZzRvZWV5UHFyblV2RjdZd05xMytPMEtrMCtabkNNK2ZKdVNibUc2?=
 =?utf-8?B?b0tUaldSdituZFhabXpkTWY1blMzMEI5UWx2aldrSkRjOFc2QTRuckxGaHJu?=
 =?utf-8?B?Mm93UVNGZWMzamFldEZCZ2owd0FXd2xoVWU3S1A4T0FPbCtSa0R0b0VoR1dP?=
 =?utf-8?B?bUREZjdWWUxONUgwVURzMFgzL1FFNjVJcURBZ2NjMlJ5WkV6V0lsNUlQTkRX?=
 =?utf-8?B?VU9WZm51TUpLRHNxWnljVmFxOE9vQ2FzNkxMUGNmSHc0Mk5IOHE2aFdTYzdJ?=
 =?utf-8?B?WmZQcUx5OXRmVGFNZU9mYmFyV1g3MXpqL3dZVTI1WTdvWTk3R2R4dFAvRkoz?=
 =?utf-8?B?TVFMaStpQ092RmlnaThxTHF3c0ZhTEt1b210WXdpNy9uYkhZUEJZdmxKWGFl?=
 =?utf-8?B?M09PbFVzUWlJQjBGYzFGSHZsRHE5c2dZUE40Nm5zVllERk5sNzUxaHN4U0NE?=
 =?utf-8?B?Q3JvM2x2ZU9qUVNpeWNpQ25ObVhLa2dKZ3VwM3ZLa3RKV3JMRytZV2JJU1BR?=
 =?utf-8?B?SnowYi9FMkJYYmZTMnpaN09hUFFFcDdQazNNRXFXT2NqNzV0NjNEZ2p2Qlgr?=
 =?utf-8?B?SjZSVXZlTzhnZE5Mc1RGQ3FON09SNTJWMEpBUk9PRmZ1Vnk0YWQ1UkxDQnNw?=
 =?utf-8?B?K1JqdFhiL2tuc1h6eXpFMTE0STFCRkJmbG8wYVJtMDh2ai9yN0Myd2JiMW4z?=
 =?utf-8?B?VGl6MUo0WWhsbDN6ejdVdm02RzJicFIwbG90bjFFaHIzd1hhMGJBS3JjZTRl?=
 =?utf-8?B?d3Q4SExQaG1kVVVrREREUE4rcHYvK0Q5N1NmaUtJN0lDRGlTbWo1TTBFb0gv?=
 =?utf-8?B?ZHlNbmFJbkdydnV0OCtVN2x0bU1FcGU5V3hlOVhzNE9NakJOSXV4U3JpQStY?=
 =?utf-8?B?WEhkVXc5aXNCNCtBWTROVGpJT3c4cy9qdXFGNFhPbitoblo5TEZHcXBhVzgv?=
 =?utf-8?B?bTU2OGhScyt0dU50eTZ5VVJveFRydjZyTjlTaTJTMi9SNkZtUVptdkt2d0F6?=
 =?utf-8?B?c2FtZnNodkIvb2tPYzlvdVZyQm1xaVF1S2FzdjlPaTVlekFzcEFJNHcxT1VK?=
 =?utf-8?B?alhLMmd6YndPeEJRYURqNjM4c1RRVENkQTFJc0hTN3N1UmVnSWdvK3c4eTNT?=
 =?utf-8?B?YThtL2tPV2VJSjhmcG4xZExoc29lQTRPM1NwUjYrMFdQTEhZZXZ3SVlkT1Y5?=
 =?utf-8?B?RDVIK1BaRkZiNk1vYkRBdDZ6UmJpK0szTTNGOVJMcnlNaVZjUGRKeHFveDRT?=
 =?utf-8?B?YzRDWksyVmlZNC9zYzV0bUwrK3dQV0Z0bldrbXZZNGJnZ1loeEdJWnhRNGgz?=
 =?utf-8?B?aElGOHdncWxUQzRyaysva1R1ZGtwWnc3M3hzRjJHaEZuTm5FT29Uc2xrRUdW?=
 =?utf-8?B?dGJ4djBkWUhqZEJ3NWJiK000OGpUSEFPNkRndnhCcmRHaHUwT1M2NG5uTHpQ?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8f2b4f-bfff-43b5-9ff7-08dd7c8ec7a0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 02:31:23.4312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVZzGuwKJ1cefxyykXDxCZfx2vhF6XvWSjXk2/bWk2klx++I16BY4ITioIZIYW7Mxj3pphBYSp8Ko/7eUsBR/KMmpgKjZLWtP2tDeJs5VtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6179
X-OriginatorOrg: intel.com

Hi James,

On 4/11/25 9:42 AM, James Morse wrote:
> The filesystem code has moved from arch/x86 to fs. Move the documentation
> too.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
>  Documentation/arch/x86/index.rst                    | 1 -
>  Documentation/filesystems/index.rst                 | 1 +
>  Documentation/{arch/x86 => filesystems}/resctrl.rst | 0
>  MAINTAINERS                                         | 2 +-
>  arch/x86/kernel/cpu/resctrl/monitor.c               | 2 +-
>  fs/resctrl/Kconfig                                  | 2 +-
>  6 files changed, 4 insertions(+), 4 deletions(-)
>  rename Documentation/{arch/x86 => filesystems}/resctrl.rst (100%)
> 
> diff --git a/Documentation/arch/x86/index.rst b/Documentation/arch/x86/index.rst
> index 8ac64d7de4dc..00f9a99689fb 100644
> --- a/Documentation/arch/x86/index.rst
> +++ b/Documentation/arch/x86/index.rst
> @@ -31,7 +31,6 @@ x86-specific Documentation
>     pti
>     mds
>     microcode
> -   resctrl
>     tsx_async_abort
>     buslock
>     usb-legacy-support
> diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
> index a9cf8e950b15..32618512a965 100644
> --- a/Documentation/filesystems/index.rst
> +++ b/Documentation/filesystems/index.rst
> @@ -113,6 +113,7 @@ Documentation for filesystem implementations.
>     qnx6
>     ramfs-rootfs-initramfs
>     relay
> +   resctrl
>     romfs
>     smb/index
>     spufs/index

I built the htmldocs with this change and the filesystem's index.html is quite big
making the resctrl parts not be obvious. The title of the documentation is used as
a heading so the resctrl documentation's heading is "User Interface for Resource
Control feature" that I think makes a text search hard to use since it may not be
obvious to users what to search for.

What do you think of a snippet like below that will include "resctrl" as a term
in the title that should make the documentation easier to find?

---8<---
diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 6768fc1fad16..c7949dd44f2f 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -1,9 +1,9 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: <isonum.txt>
 
-===========================================
-User Interface for Resource Control feature
-===========================================
+=====================================================
+User Interface for Resource Control feature (resctrl)
+=====================================================
 
 :Copyright: |copy| 2016 Intel Corporation
 :Authors: - Fenghua Yu <fenghua.yu@intel.com>
---8<---

> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/filesystems/resctrl.rst
> similarity index 100%
> rename from Documentation/arch/x86/resctrl.rst
> rename to Documentation/filesystems/resctrl.rst
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c30c6fbd1f7a..f7a829898344 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20281,7 +20281,7 @@ M:	Tony Luck <tony.luck@intel.com>
>  M:	Reinette Chatre <reinette.chatre@intel.com>
>  L:	linux-kernel@vger.kernel.org
>  S:	Supported
> -F:	Documentation/arch/x86/resctrl*
> +F:	Documentation/filesystems/resctrl.rst
>  F:	arch/x86/include/asm/resctrl.h
>  F:	arch/x86/kernel/cpu/resctrl/
>  F:	fs/resctrl/

On the topic of MAINTAINERS file ... if this is ok with you I would like to suggest
that you add your name as reviewer to this area with the goal of you being CCed on
any patches that touch any of these files so that you could highlight if anything
impacts Arm.

> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 182f0514cc88..41af0ed18259 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -40,7 +40,7 @@ unsigned int rdt_mon_features;
>  static int snc_nodes_per_l3_cache = 1;
>  
>  /*
> - * The correction factor table is documented in Documentation/arch/x86/resctrl.rst.
> + * The correction factor table is documented in Documentation/filesystems/resctrl.rst.
>   * If rmid > rmid threshold, MBM total and local values should be multiplied
>   * by the correction factor.
>   *
> diff --git a/fs/resctrl/Kconfig b/fs/resctrl/Kconfig
> index 478a8e2ad99f..21671301bd8a 100644
> --- a/fs/resctrl/Kconfig
> +++ b/fs/resctrl/Kconfig
> @@ -21,7 +21,7 @@ config RESCTRL_FS
>  	  On architectures where this can be disabled independently, it is
>  	  safe to say N.
>  
> -	  See <file:Documentation/arch/x86/resctrl.rst> for more information.
> +	  See <file:Documentation/filesystems/resctrl.rst> for more information.
>  
>  config RESCTRL_FS_PSEUDO_LOCK
>  	bool

Reinette

