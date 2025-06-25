Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DBE2F4A0D;
	Wed, 25 Jun 2025 23:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893771; cv=fail; b=TcLXuVFd6ev2ZE1zkCAxEnoobRUZIDGgWjc97ovAWcJFGqh4Jk0NxrW0gkqAMA6zzF71AAXzDaHfEfdW9ioFDLuAYJj6+xu/bxEvyI395r3jAgfa4OdR1R8Ra7RGFR5BHHBY60bXzZgWgonHOfINWciHal6yKz0VHSfeemzqoFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893771; c=relaxed/simple;
	bh=Db80GiOIzrkPXj2LMq8oMKlCWSEByn8pLfu9IyRNp0Q=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XKUgMKw8Z2+z6d1FqW0nLE5xRv1Dqj3HIRlsdl+qizA5qCJHyssmd4EevE1KhK1hpG0uIOAkm8CEyMH7fpvZ4ag6Rvt53QbwEwqwMMefcjZ3VrMSqS7smoh64FOHvxYe9ZxAnmKh0uk/mK3V2SEGWQaY3qGBCpJES57Q6+U78JA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3yC1YDV; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3yC1YDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750893769; x=1782429769;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Db80GiOIzrkPXj2LMq8oMKlCWSEByn8pLfu9IyRNp0Q=;
  b=T3yC1YDVq6xmrKppHhruNT+2c//ihQ2WSckJmQ2rH/ChK8iK5a0zms6s
   YpVnuB0UXsREFpiPt92+xlyVJvoxpYGVe1Iyx7FdRo8HGFsuy7eV/+CJl
   5YBLDTrs/lgSmGmOoCLhiA3twJXa94/5j+KWSk/rVllSUVxaq02+gH694
   MEhSSXCLCt0IpBKHUVj+EXsux3cH3ujmoFlkYEYZEgvtw/AAxX/5MtBRC
   NorSh9wFk+LNd7jQID7lB/fJP/4Laqa9SBMPDVu2chOmoCX7Y8R1hsQu6
   dHtQA7KpbW4aeehwwfoYg89KycifWjU8S+B/m4Nql0pdP/Mu525Zej/id
   g==;
X-CSE-ConnectionGUID: ly3ducfOQiyyGZ/A2hvHdA==
X-CSE-MsgGUID: PS66kp+nTsW4g0Rhk1+2pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53248382"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53248382"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:22:20 -0700
X-CSE-ConnectionGUID: DOl6RbA6SeSvWxSt84JONg==
X-CSE-MsgGUID: zkQQgjKuSzq34yc8eePxdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="151874018"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:22:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:22:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 16:22:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:22:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPPxkP24XdB+bw7dcmOqlUl8G/qhSZcZJ3rMREq4V2D12eEHI+5Y8vSNvwyjUcln4xOrKvp3jHMMUjs38iqLhTu28YxDaAl6zotX7EZQtaaAUpQXloGBq1Q/w5kogii0o5ENfcj+cWOs3VYU+7HnqX+LC8KW4FsZMIDauLZtjYo5khqp6REj+28HyRIK3Cln9gnBvgRjLsm7qAisqT1X+JkhIoRRYXX+3xwAZF5D+Yf1TQBxnKW5AyRH0uuro+fHstEykgM8oOOUgwhZvjCS/z3o7w0VULKYn5rdAYo+15gaqzJl4s68PiVHdgQmH8XUfPTER0LjeqX8pI+FJBaapQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCrMPy8FTaFyzQ+RpVi8aSeHJqDNcEkC+SaRxqJhQHU=;
 b=QYOmEiEJ8BEsBqSOvZG7/7jdXawqy1Bba/wpD8vHqFZBycCMSiwnSLjB3iJI6RgaWuihY+HXxli2H4EW/Ik4tYCDkhH7mjpNFmHX/cuEGYzbWXWdOFNa+CSZkZH19QscFlNq850CH8NIr06zulFs7u6cfUj0sNtz6Ngb3uRQgAEkGKU+k74wxg3Q6Sk8KAF6rHaaBPz4mEjzkF8l3yHPwK56iSR48ImUZXoIZGIL/yzr0yn42VvsJYgE6fbU6DlliZ3ChVRBpbVtEjkDpnbuP9GwAdeO05ds2Y/qbyufPKHAu93oPO9exHJ1WIaEXYk7H4/VMYvrYIlmCs1l6JgJYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA1PR11MB8858.namprd11.prod.outlook.com (2603:10b6:806:46a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 23:22:01 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 23:22:00 +0000
Message-ID: <de1e1946-15d2-401e-a974-cbc86d08a78c@intel.com>
Date: Wed, 25 Jun 2025 16:21:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 25/32] fs/resctrl: Provide interface to update the
 event configurations
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <dc097e5caa1c7df42c211fffb67f8d860a6b39da.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <dc097e5caa1c7df42c211fffb67f8d860a6b39da.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0067.namprd16.prod.outlook.com
 (2603:10b6:907:1::44) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA1PR11MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: a902fdd3-cc34-4fce-d3b2-08ddb43f164e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVdUY2tON3RacWpUWHNYaVBHbG9xY1RKM2plQkpsMzlwSEdmdktLeThvdUYx?=
 =?utf-8?B?eW82bkJndW5ncEpWeTArdTVSc3M5b1c0M0Z3emEyYVUyT0NVb0ZXSWRSeUgx?=
 =?utf-8?B?Tkx3WXptTTRqdkIzemZlYmNFbXpJbWlNbjVmNy9HbWRVN2RyaWRLSXhQT01J?=
 =?utf-8?B?all3MFViYWxaM3VoQXBFU2dQSmJta2tJU3hPTkJKWDF4b1BwYUxSbFgxOXVw?=
 =?utf-8?B?Z2NaOUpKZ1BYdHpReUFUaDJzTlAybjNoN20rQmhxa3U3Q3FtbEVJQjNjaEZ5?=
 =?utf-8?B?RXJtV3hvdjBYdjczeHZkR3N3RVBrVGNMemM5Z01SVGJFMU9VTmpOakxkb25n?=
 =?utf-8?B?bGhwOXUwZVhYb1c3WjlxcDNBR09zRkRJYUtEYnZmTmp5bEpYRUkzVE54ZUNv?=
 =?utf-8?B?eHBkWFdXQ3RPZ3NNa3MwS2w3VE1FZEl4Sk9GZm5ETnFadlNWRXN5RzVIZlp6?=
 =?utf-8?B?cGpGUkE4OXBMcFZ0WTlOczE2RExac3p6TVhCcTNqT0lVdWRmalFYT1VsSURS?=
 =?utf-8?B?NmNqNVp2YVcwazRkZy84U3BuYlY4em81NHJ3N0FWdmlFR2xVZ05mSlMzMnVi?=
 =?utf-8?B?SUNmMElucFN0YTJiamxPZTZYRy9waUtFNS83ZEpRbm9kRW0ybWZHb1M5bFBO?=
 =?utf-8?B?bGo3RnpGRU5aOTZsQks2OEgvUG5GQSt3UjZMbldLVVZ2OWZYVEEzYnpGR3cy?=
 =?utf-8?B?YlpVRHhTcEJOVlpxUEZlQzJ1bG8rR2ZLWVlma2pGb0pQRGVlUXB4aGJyYlVN?=
 =?utf-8?B?L3gvc0hYaWNxamZncThNZnlXb0FseUFCN0JZK2xQUStIb1QzQm43d3BrM05z?=
 =?utf-8?B?d2NMZHhCR09QYTlpaG1XcEhEUU5qTEV3clhHTmw1OGtWcjVJWEh0elBNMm1n?=
 =?utf-8?B?bDZaRVNrTlhIKzhoLzM3OU0rT0VVRmdSTzhkckZkZUJaa0tBNDFpeXBVUkNU?=
 =?utf-8?B?R0pobEFiL1ZZdUE5bVVERVFpQUc2RWp5ZTVBSDNBUXROeG9NV0J4dW5FaGRj?=
 =?utf-8?B?Q3VPdVl3Y1FDUk5PRFNGaW1qUmZOaGhraUJNUi9xbEdQRWVzL2kxNSt4eml1?=
 =?utf-8?B?cWFORjJjdlhMSm02Z242NmlnNzN3bXpQM3JmalRDUkdreEp4S1duOUhJTmp1?=
 =?utf-8?B?YXFIbFVYemF6eDBnN2NKQ2liWUg0ZGdMVXo5Z29UNTQzODRUZ2cyNlJHNkJX?=
 =?utf-8?B?allDN1B3RkU0RjhtMTRkNUt5M0dra01aNzRVcjUvYklqYUorUUVkNEFFeno2?=
 =?utf-8?B?MTU3UDBFVDlSd1dYVnV1N054QUJoeDVmQTRXYmlYTm14aktRNkZrQnM2eFNY?=
 =?utf-8?B?L2kvYlJVMVZiTFNGRDZpUDk3NUdYNGoxVW42VFo3UFd6M21HNGVqaGhuTU13?=
 =?utf-8?B?MHhZK2RrampUUitDd2pFa0RVZTNuWmQzdjNtZnpOZnlMQ3gxQnZPUlZHcnYx?=
 =?utf-8?B?OXVNbG1zN2kzQzVkYkRQdEZtM2piYWRxNWxsUDY3NU9qYVRodHdoRWs5aXdn?=
 =?utf-8?B?Rjk2NkZsYnRqS0NqSFlaMG5BMXdYa3dVMnZabFJ1RFVYR0luMTlLMXVXRUE4?=
 =?utf-8?B?RFhKRGk5TG8wUkZrWXhxQUQwRUN0Vld3SVY1MjFEbzR6K1lWSkZqM1Q4VXA5?=
 =?utf-8?B?VlIxcVcxZEdjRTZGUWhDZ3R0ci9zeVdCQ3c1ZmxmWk55U0tIdmJ5RHVaeTFG?=
 =?utf-8?B?L3E2bzd4c3ZWV0VGTkM4aVgzOUxlb3huckhzV0VjUUJaNWxKOXFYQnZuSm94?=
 =?utf-8?B?NndLMVVZeEQzbnRBMnpEb2ZWbFhIcFhML2RTdWRISXUrZkNQVFhKVkV2SlVp?=
 =?utf-8?B?dXdkVThRamVHbFh2K1hSVmo2a2o4a0d5L0pRWVhFTlhxaWdaYXBKQXZFZEhU?=
 =?utf-8?B?MG1Ya1loQ2dJS1VMUTM4cUNYeGpIRHlBOWVvOUFET1VrWlZPVFJaaFZ4dlJM?=
 =?utf-8?Q?so/CXX0jDgE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk1ZM0lkUW5Lc2x1VzFBbjdoTjNOZHgvQVhzZnIySm5JYlRJUU9WMGt5Q09T?=
 =?utf-8?B?NzZSUXpPSFV1bmcxTjFuMzJTcDJ2WnF5WTJNdEJocjNWOVZ6QVBrcWZEc0xy?=
 =?utf-8?B?VlFOdzNqY25GNHp2U2lSYkd4d095SGQ3dk9qamZUUDVYMzBnbW9VZ1V0YzRW?=
 =?utf-8?B?OFF5aHE2eW11bkNZU1BGdHJIWlFLTGZyamhsaTU1TnRvSVpPcERXVW9VdmJW?=
 =?utf-8?B?cmh1d2xiZnYrTTFLamMwczJZd2VyUU8wV25YamdXMVFmRlRqVzJmVk9EZEtv?=
 =?utf-8?B?SjVTWDFMTURwVTNCRWVyVmFLaThTQkcrRG5aTVJ5OGIwN2wwWWoxb0lXSUNH?=
 =?utf-8?B?NVFIR0Y4T0U4eGZjTmt5cGQ4dHlzdFQxZXhMN3ZHOU44TzY1d1BYcFIweVI2?=
 =?utf-8?B?aW4rdXZZcGtEbUJybEVqNURnTHpVU2RXd3V3ZFJvY2NmaUFmSGwwWnhKYXhR?=
 =?utf-8?B?dFoxNHlzdW5CWmxUYktrZTJzdTNrcmR5emgzd0tDajRRb3RTNkw3b3pBZFVR?=
 =?utf-8?B?V1M5ZERma0lHTE9oemxvajB3ei9tZ0FDV29nN3YwUThFS2lGK2RKWHRuOTN4?=
 =?utf-8?B?ekoyS09sRElOUlZFVWcvSWFqWkR1REZiQndENWxUWUErNndJazlQT1IxclhE?=
 =?utf-8?B?TkRiWEFIT1I1KzZrT01kSDlIS0VtcUNFUFkxek1PeGhlZVFjSnUwN0dDQk4y?=
 =?utf-8?B?Ymw4cWRHRFpOcG9uelIxdW1qTXlQaEpLSTNqUUhZRWFoSmg0UXY1aXZUWlZL?=
 =?utf-8?B?OEhSM0MvV2huUndWZEJ6azlVTG9sdUozMERoQU8yWFZnQ01oZHJaTC9zamJq?=
 =?utf-8?B?cXRETnZDVXNXSUx0Nm1oZkJYR0JyNSt4T21JVFZzQ21RYnFBODU0Z3hIUXF0?=
 =?utf-8?B?aDZKV29CZG15SjFZcmRGcXRxUlRKbWJNYnY0UmgzNGI3N2VxTktZc2xIK3k2?=
 =?utf-8?B?SWh3ZDB3Sm4zNlFwVXllczIyT2NGR2VBMmhISjE2MHJjVFN0bFBEcjNTdklJ?=
 =?utf-8?B?b2tkR1JML09zUi9aNDQ3L2RFQ1UxaExEZDVJaUIrZWNLL1g0cCtrWmg3VEtW?=
 =?utf-8?B?ZEQxb1ZNNmRNbUpwd096eis0UDBJSDkzZ01QU0d1dS9yNUcxUFN6U2w3MExl?=
 =?utf-8?B?b3M3QmI5MktVeEczVWpVWFdJV2RzNHl3cjV6TWFpWjFXWkdDcE5CQ1FHQzNq?=
 =?utf-8?B?ejF5WXJBZm1OMDdqbUpqanVKVVdsQWN2Mnk0R0s1c0tScTFjYzlGS0dYellx?=
 =?utf-8?B?Kzh1bnBsUzB5M3o1dXNrenkydHg1SU1EQ3BkTmZpUFczSmpGV2VhVFNRaTdu?=
 =?utf-8?B?TUZTWld2VEtVaWV6NVJydHo1aXRXN21HQ1RVdmRFWkZNRzNNY0tnbkpNL1Nm?=
 =?utf-8?B?dUdoTFVWc2RhN21GYjlyWktaaUU0aVJlcHIxRHlXclZRaGthcERvT3ZKd3Y2?=
 =?utf-8?B?NTI4Z2JFTXpKeDJ1ZDFyNzl0aGhrVVZ5UlA0K3JhdjlQZFBwK3JHSE95OTRT?=
 =?utf-8?B?S1NuVTBmd2VyZmk4M1plajcySmtyV0gva3NLckpOYUJrelROR1luR2ZXYjBL?=
 =?utf-8?B?RnBZT2htK2JtckVuWDk5bSt2M1dnRFBmWVl0anJiZjNJWkZ1cURBa3h2Qk9H?=
 =?utf-8?B?UktkM3lIcGVvenZJTHpRaC9DS0ZUMTc1SG5scnRpRzVJUFg3Zi9wK2NPQ1pN?=
 =?utf-8?B?L2lMYk5QTmpLdlgyYWFXRUtPYzcrdTAzaE9NeXhKVkV4VUZQc2Z4bVNQRTI2?=
 =?utf-8?B?SVFCdGFnM2JURmRRSGNHZWQ3NEg5YzBwd0JadTEzdXI4R3hMKzBnT05LbXZK?=
 =?utf-8?B?a3lGU3lKeWpRMjQzUi93NTRiYTdrdnA0ME5EUU9pbGpXeVhaZVZYRnVPZVJF?=
 =?utf-8?B?cjQxaUNqRW9HdlBFZityYnR6aUZWNWZjSWsrSmlqcXFnWWVSdEk5ZjlpTXNp?=
 =?utf-8?B?SkQ5RDlBWWFTR2M0V1VORStRR01CNU4rQWhZa3g5eXdraEpjRER6WS9haEx2?=
 =?utf-8?B?aW84NWI3Q3k0c0Z5b0NGT2p5bDZiWHFuZ3hvOG9nU0NuT0J0dWpqeW52YUdh?=
 =?utf-8?B?YlQ5bDJJdk9CeUd1UGxFT3RwNmxWcnYxY3l3aFBiQWo2ZFluVnY1eTJjbUpJ?=
 =?utf-8?B?M2tFcWNMcnhLNWlCK1drT0p3T1Y4cUlwZld5ZFN3MFY0VkRRSjFuc29tQVdM?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a902fdd3-cc34-4fce-d3b2-08ddb43f164e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 23:22:00.8290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUW1TMKvdq7cm22o49MMonvOQzRoJqCW0aotXpHC4BZ8+SoEvlRbkhrEK2s22QtsgkVTUY6BeBWDq6uR22bWVqxHJa90eG0ArUYuAGFBxNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8858
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:
> When assignable counters are supported the users can modify the event

"the users" -> "the user" or "users"?

> configuration by writing to the 'event_filter' interface file. The event

nit: "interface file" -> "resctrl file"

> configurations for mbm_event mode are located in
> /sys/fs/resctrl/info/L3_MON/event_configs/.
> 
> Update the assignments of all groups when the event configuration is

(just to help be specific) "all groups" -> "all CTRL_MON and MON resource groups"

> modified.
> 
> Example:
> $ mount -t resctrl resctrl /sys/fs/resctrl
> 
> $ cd /sys/fs/resctrl/
> 
> $ cat info/L3_MON/event_configs/mbm_local_bytes/event_filter
>   local_reads,local_non_temporal_writes,local_reads_slow_memory
> 
> $ echo "local_reads,local_non_temporal_writes" >
>   info/L3_MON/event_configs/mbm_total_bytes/event_filter
> 
> $ cat info/L3_MON/event_configs/mbm_total_bytes/event_filter
>   local_reads,local_non_temporal_writes
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  Documentation/filesystems/resctrl.rst |  12 +++
>  fs/resctrl/rdtgroup.c                 | 120 +++++++++++++++++++++++++-
>  2 files changed, 131 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index b1db1a53db2a..2cd6107ca452 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -342,6 +342,18 @@ with the following files:
>  	  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
>  	  local_reads, local_non_temporal_writes, local_reads_slow_memory
>  
> +	Modify the event configuration by writing to the "event_filter" file within the
> +	configuration directory. The read/write event_filter file contains the configuration

(to help be specific)
"within the configuration directory" -> "within the "event_configs" directory"

Note that "event_filter" is not consistently in quotes.

> +	of the event that reflects which memory transactions are counted by it.
> +
> +	For example::
> +
> +	  # echo "local_reads, local_non_temporal_writes" >
> +	    /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter

counter_configs -> event_configs

> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter

counter_configs -> event_configs

> +	   local_reads, local_non_temporal_writes

Please let example match what code does wrt spacing.

> +
>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index e2fa5e10c2dd..fdea608e0796 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1928,6 +1928,123 @@ static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq,
>  	return 0;
>  }
>  
> +/**
> + * rdtgroup_assign_cntr - Update the counter assignments for the event in

Could this please be renamed to rdtgroup_update_cntr()? Actually, how about
rdtgroup_update_cntr_event() to pair with a rdtgroup_assign_cntr_event()?

After staring at this code it becomes confusing when the term "assign" is used
for both allocating and just updating. 

Compare for example: rdtgroup_assign_cntrs() with this function ... the
only difference is "cntr" vs "cntrs" in the name but instead of both functions
doing the same just on single vs multiple counters as the name implies they do
significantly different things. I find this very confusing.

> + *			  a group.
> + * @r:		Resource to which update needs to be done.
> + * @rdtgrp:	Resctrl group.
> + * @mevt:	MBM monitor event.
> + */
> +static int rdtgroup_assign_cntr(struct rdt_resource *r, struct rdtgroup *rdtgrp,
> +				struct mon_evt *mevt)
> +{
> +	struct rdt_mon_domain *d;
> +	int cntr_id;
> +
> +	list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +		cntr_id = mbm_cntr_get(r, d, rdtgrp, mevt->evtid);
> +		if (cntr_id >= 0 && d->cntr_cfg[cntr_id].evt_cfg != mevt->evt_cfg) {
> +			d->cntr_cfg[cntr_id].evt_cfg = mevt->evt_cfg;

I referred to this snippet in earlier comment 
https://lore.kernel.org/lkml/887bad33-7f4a-4b6d-95a7-fdfe0451f42b@intel.com/

> +			resctrl_arch_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
> +						 rdtgrp->closid, cntr_id, true);
> +		}
> +	}
> +
> +	return 0;

Looks like this can be a void function.

> +}
> +
> +/**
> + * resctrl_assign_cntr_allrdtgrp - Update the counter assignments for the event
> + *				   for all the groups.
> + * @r:		Resource to which update needs to be done.
> + * @mevt	MBM Monitor event.
> + */
> +static void resctrl_assign_cntr_allrdtgrp(struct rdt_resource *r, struct mon_evt *mevt)

resctrl_assign_cntr_allrdtgrp() -> resctrl_update_cntr_allrdtgrp()/resctrl_update_cntr_event_allrdtgrp()

> +{
> +	struct rdtgroup *prgrp, *crgrp;
> +
> +	/*
> +	 * Check all the groups where the event tyoe is assigned and update

I am not sure what is meant with "Check" here. Maybe "Find"?

tyoe -> type?

> +	 * the assignment
> +	 */
> +	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
> +		rdtgroup_assign_cntr(r, prgrp, mevt);
> +
> +		list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list)
> +			rdtgroup_assign_cntr(r, crgrp, mevt);
> +	}
> +}
> +
> +static int resctrl_process_configs(char *tok, u32 *val)
> +{
> +	char *evt_str;
> +	u32 temp_val;
> +	bool found;
> +	int i;
> +
> +next_config:
> +	if (!tok || tok[0] == '\0')
> +		return 0;
> +
> +	/* Start processing the strings for each memory transaction type */
> +	evt_str = strim(strsep(&tok, ","));
> +	found = false;
> +	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
> +		if (!strcmp(mbm_config_values[i].name, evt_str)) {
> +			temp_val = mbm_config_values[i].val;
> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	if (!found) {
> +		rdt_last_cmd_printf("Invalid memory transaction type %s\n", evt_str);
> +		return -EINVAL;
> +	}
> +
> +	*val |= temp_val;

This still returns a partially initialized value on failure. Please only set
provided parameter on success.

> +
> +	goto next_config;
> +}
> +
> +static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
> +				  size_t nbytes, loff_t off)
> +{
> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
> +	struct mon_evt *mevt = rdt_kn_parent_priv(of->kn);

With mon_evt::rid available it should not be necessary to hardcode the resource?
Do any of these new functions need a struct rdt_resource parameter in addition
to struct mon_evt?

> +	u32 evt_cfg = 0;
> +	int ret = 0;
> +
> +	/* Valid input requires a trailing newline */
> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
> +		return -EINVAL;
> +
> +	buf[nbytes - 1] = '\0';
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	rdt_last_cmd_clear();
> +
> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");

Needs update to new names.

> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	ret = resctrl_process_configs(buf, &evt_cfg);
> +	if (!ret && mevt->evt_cfg != evt_cfg) {
> +		mevt->evt_cfg = evt_cfg;
> +		resctrl_assign_cntr_allrdtgrp(r, mevt);

Could only event_filter_write() be in fs/resctrl/rdtgroup.c with the rest
of the functions introduced here located with rest of monitoring code
in fs/resctrl/monitor.c?

> +	}
> +
> +out_unlock:
> +	mutex_unlock(&rdtgroup_mutex);
> +	cpus_read_unlock();
> +
> +	return ret ?: nbytes;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{
> @@ -2054,9 +2171,10 @@ static struct rftype res_common_files[] = {
>  	},
>  	{
>  		.name		= "event_filter",
> -		.mode		= 0444,
> +		.mode		= 0644,
>  		.kf_ops		= &rdtgroup_kf_single_ops,
>  		.seq_show	= event_filter_show,
> +		.write		= event_filter_write,
>  	},
>  	{
>  		.name		= "mbm_assign_mode",

Reinette
