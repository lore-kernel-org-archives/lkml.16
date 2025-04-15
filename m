Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EF7296D1D;
	Tue, 15 Apr 2025 16:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744736006; cv=fail; b=jxnEYdDemS5iFhNnq/O2UAjLsxK7i6rIXzRj0k4OZq3SjTI5WEoYTjgWQ1yCbolS1Y/zICt1SqP0li5ZRg37I7EOLDm8ZF3qY6iG6E3YiO/FFRwAkQRh26y1DXvuNBViHYZ0TQQZo3uZcMxCrwQxt3D5dan3dz0vZ+ZaWvGZmMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744736006; c=relaxed/simple;
	bh=D+XbB1tonvCq6eLhXLWEoZ3jPAUN1xYv1MLD02rFR1A=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DUw5wBlITqQDca/LmlX3tp7EoqRJ7rKa5d+WgheRk5GO/LcyKmWxBJiDVwWZbi9IeByNr/aBwSEZemY5wepu/3Ad4lAhUqqEx9mc2mzLBZzy9Nbab+DTqNlj7/q96f0aqZ0ZB8caiPV/Ndb1QHNxdHjBavgjR/cWmUyrM60EvpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKQyIxxI; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKQyIxxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744736005; x=1776272005;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D+XbB1tonvCq6eLhXLWEoZ3jPAUN1xYv1MLD02rFR1A=;
  b=dKQyIxxImvuUfFb2e5IgTt9C/U69RG1zael0j0h3GXS9/IC+IPMzlCtq
   UXdNYGNs1oCa0o8nB4V9fXtZbzq7XymWwuUnufRHjG7elH5lP8dRx+xlF
   OIlSmB34n/HYYurI3q+tJmItjnh38NI/vDEtE6CiIRITYtnaCcDkCAE2C
   H0sZDQmIYQcCtF7C+1P54AfUGwHFByvk4zkYPT3ScAy7TwZSLC3NWQUwi
   nzXZFgDShCIwhjUW62v2ubxMSdVS1DPenuIGKeik6Jm1+EDfONxqACcdx
   NSHxnvFpni/8/e+HmBQ7u/pHOqPQUaBJAnWymWw3UnaCvl76sD81J2V7r
   w==;
X-CSE-ConnectionGUID: yjh3UD4vQ2e6r87vr2om0Q==
X-CSE-MsgGUID: oQFgMilIR4++ZLm9CurT2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="63657877"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="63657877"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 09:53:24 -0700
X-CSE-ConnectionGUID: YHQ0sj+ATkqssR6sS+cYqA==
X-CSE-MsgGUID: IKMb9uUbTRm+WfSi8WM6DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="131077540"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 09:53:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 09:53:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 09:53:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 09:53:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLWijhUu6en4fCglk25fh22SMYOUUd14oxd5no+9q98c6FL8ubKQ9ZTXu9QqUfvorBKVpI99c4l8CIB20zZhBykarTk6Y2e/ohRF/TnqlG6IwCNeALzlg9nOyjMQRzKGlQE6/9oBLM1FmmVIuaVtzL7C8Pi3WUbBSJIrTS2+48x7ugrxxo8PWedbXVTr2bMlmkW8UjEwoduzvYd4WSWGnR4LCn9/er2e1gWOeRZ2eNDywmD7DQZS6LrKQchXlqGeJV0tO9emtSlhAyIzaN+n4/2qsbaY+4+6QxcToMJAoLZXm5tDRIOM0X9guXmccZkrPFmHkWHRiy8GF1XfH4htvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWRcDCRYjkTdHGzEH8NzGn0Tl03cRp7U8Mno4CfJLNI=;
 b=wE08tqK3wpbf+xje90EslR2gOcheN+BUQTxwNEdKrwblq4uRS0rnSg8BdNmVXDJ8H7lg8u0gcrZKnaAXbRb+5dHnf6PFe/pEStBRyzmHG93YaCg27W/vzhtbDAo7c3uEiFAJMxSeCgIadh6/HzNEq1DxI0qYjI6fv00KN6O36QD6t5r1WtMLAV4OkVy5kbIksmdJbC2as0rmh5KFLGjLzZTCsQEZBCovMyrRDOCopxZKkKeRutRZ2ZwyEMhY8gmHhv5YAy3znyOX444l6tZ3dDtMGvsLPuIzOwtHQSUE+5AjDM9Khof1yPl+dI5awVUqYGjlMUxcuIg1GUJq2mWErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM4PR11MB6192.namprd11.prod.outlook.com (2603:10b6:8:a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 16:53:15 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 16:53:15 +0000
Message-ID: <efa7aee8-d1f3-4d15-9a6e-09b19c296e47@intel.com>
Date: Tue, 15 Apr 2025 09:53:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 14/26] x86/resctrl: Add the functionality to assign
 MBM events
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <xin@zytor.com>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <22889d46484b2393d701ce83c82f253c1454216b.1743725907.git.babu.moger@amd.com>
 <59fbd325-04e8-459f-a724-ae0c4536b1a5@intel.com>
 <3d31259c-cac0-4b96-883c-6d2e8e427988@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <3d31259c-cac0-4b96-883c-6d2e8e427988@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:303:b5::6) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM4PR11MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7f0444-92b6-40db-f4ed-08dd7c3e040a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tlp0STRqM1BqNG9rRGF6TVVFb1hoeXpYNWx3LzIzbHh0WGNXcUxuZEJJVnVO?=
 =?utf-8?B?VmZ4NGhhS2gwZnA0WCs5Yk9XeC9oclliTWxQWGl5d0wxa1FLb2ZTYjF0ei9U?=
 =?utf-8?B?cWdUd0VvaEs2TytaU2VrLzkza01IWUF4Q1Z0bEJkZ2JZanJGcHB6WWVlT2dt?=
 =?utf-8?B?dU41ZjJsYTFHd253YnVyS216WjlqMTZ5dGRYdkFNbTBWNVYvTWxFUzJlT3NE?=
 =?utf-8?B?UGVOZHZZZkZTdEs3UmtONVRVcm1NZm9HMUUybFlOK2RoSVhBdVhCSUMzN3lZ?=
 =?utf-8?B?SnV3V09UWGROWS95bDJRVXJmdnhQZ0JkVW1EbFRSTzRjVkJDNFVZSVJVemFk?=
 =?utf-8?B?dHVLZklxRGVXWmQ0RTlCdjJiWmN5cTV0QnhEc3RRbU9aaTZ0QmlyRXRkMXNi?=
 =?utf-8?B?YU1qSEhXdTZrNHpNSEV5V2VzdzJFcW4yWmlyYXFVSk5yZ04yQmlDb25DdnhV?=
 =?utf-8?B?U0J4WHdBR1UyVUxuK0cwWmEwWWNaL3VxY0FsRURNZWNVbnpnVTQrVE1uQThX?=
 =?utf-8?B?TTZ4NytSYjAxSHozR2dPTXh3b0JxaHZkYmpLWEgyb0kyWjNHTUxzaXVqb3Vs?=
 =?utf-8?B?Uy9DYTVTV1prQ3ZhUDNSL2dqNFNvVEdCZUVtRk9VaXlJU2FUR2sxUU9UWXpY?=
 =?utf-8?B?MDJVNDBzZE0yNnBzN0dYbEM0TVRkbnZ4akJsSmN4WTNCMllzV0wwMWNhMFNV?=
 =?utf-8?B?MFhNQXpuSC9KQ3huT3ZwQWF6OGcrMkJQVm5NNCtqNzVlQXBzWTRtSjNBbWNh?=
 =?utf-8?B?dzN0bzNzYnExWDBYUEFUYU9ZclBUejBQWUZGdHdoYjl4c3lsWkVhM3I4YnZX?=
 =?utf-8?B?N05vcHJnYkFSbTlDdDZ6aXVPSW9wRXBPSjdzR1hzWCs1WjdEampjTFVQUU4z?=
 =?utf-8?B?ZnNNTmxsaWhhWHhPM2ZKRXAydXloekhETzVaVjJucWZLeCtLYXdZeFNjc1A4?=
 =?utf-8?B?TTFVSk8yUkZNMlN4UE9xTXRVL2JQMUZXSHR1eEZDTll5UDh5dGQ3UmZYNU9N?=
 =?utf-8?B?Mkc4dmZMT3FzY1dKTE5XVVp1Ky9BaStKUnhHOU0zOTZRc0lJRWkxbTYzNDRM?=
 =?utf-8?B?OVJQT0RhVEluYi9HVis5Zjc3V0ROTVZVWlplYVBoanl5VWwrUHpCcnUwZEdn?=
 =?utf-8?B?c1J5VXlFL3l2UGRCdVdDcTh6OUxKcFlFZS9pSEx1eUlzeWVsRTF4OFFXcWwv?=
 =?utf-8?B?WTlsMlV1Sk9SLzVsaTYyTElwSlVNSzdFeWJFbHp2NVVVaFJ6WllWVURZU2VM?=
 =?utf-8?B?bDhjY1g4RTJ3VzhqUVFFNHE3eFljeElMVUF0UjhQejJZeWV6RVpBZmhPaS9q?=
 =?utf-8?B?Q0V0NFpRdFcxdGJjK01KVXNDYkhhcjVaNjJmUG5DL0VSemRwNG1qRjBRSnRt?=
 =?utf-8?B?bUpaZHFJczBENXMrN0RRdnNUQTMzUjlSR3VZSjJja1duYzJxVlpld3RUTGtt?=
 =?utf-8?B?T2VMbzZveDVEVG5hWEpPbW1YRGxNSndEZUU0ZE9iT0xHbm9KclJxdkoxMGpm?=
 =?utf-8?B?VjhqZ3FCejh6cStpanpxQWU2d3hIRVpBSVM5SEJZUnRQdHA5dVlETXVEVXJN?=
 =?utf-8?B?YWlaa3hROXJQUGt1Ym5CQU92TnU5a1BIaWZEWGFCTzJiMkFSRUV2VmptbGg3?=
 =?utf-8?B?YldnVHI5MFF4dDg5S1ZnMmpkZ0lQSkJ2RWV0SnQ4eGQrM0RvWHJyL0QyTmtK?=
 =?utf-8?B?aGZuU2lzWWFnVXdQME5UL1ZUL0I3MzRwbUFHR0VRbEpyMklpK3JZSmVxbTBH?=
 =?utf-8?B?V01tTzk3b0tWem56bUgrNlYyK2lGbXYxWFpaMzBUTjYwRXJJUkZ5bTVDQ1k2?=
 =?utf-8?B?WVNjd3VqR3dybVNTa0ttS0dNYXdxR0l3dVNMVGJucis5dkd3QzA0cHFOTk5i?=
 =?utf-8?B?VGhhY0EwVVBLTU9sd2pnaTdadXNKM2VWVjkyY2RTQTZlZHIxYkRYc2lTa1FS?=
 =?utf-8?Q?4f4Moc9Y0A4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVFRWGExYXV6NHdGckRMUkRTOFN4NHdpOGdzbjhQOGp1ME1wR0gzOUZQOEtT?=
 =?utf-8?B?U1J3YnEvR3JGWFZ4TDhzK21mbjcrOXl1MnAvQ3NoWVgzMDA0WFQ3cHpjSnVr?=
 =?utf-8?B?aTc3eS9LMTdwWCtNRHVLVDlwcUl4R0tYcXJaNmdnWjg2NkNHK2N6a1pBTFk0?=
 =?utf-8?B?Tk9FaGJtUU9FU0RQZUYrK0NmS1F0MllaZEdtWW1QWFNWVVIwdW05Vmc0WUpS?=
 =?utf-8?B?NHMrSHQzRytNbWhocVJjVmdDVmdMbUdWenZ4Q2RMUkcyUFZNakdWZ3dKejlm?=
 =?utf-8?B?R2E0RkMvTVdpTmRqL0wybmpNMUdLS1ZDQXMyN3krRzNoQk0wdEJIblpsNXc1?=
 =?utf-8?B?UGpVdk5IcnBydjVXM045OTVLR1FKd1U2ZW8zUEord2JqYVYvR0NtZy8wMVVK?=
 =?utf-8?B?MUI1Y0FOKytaMHBSVEk5U3JYS0U1SDVkNXFUU1Fsbno0Y09uQjZGVEFnTEcx?=
 =?utf-8?B?bFN1T1RXWGc5V2lrbERTQTd5YjVmeGYwR2dzc3c5RXkxc2VUcGNlbVE4SnR3?=
 =?utf-8?B?VHNRaG9BUVMwZGljRWh6S1hIYWRlK1F2bHZqZ3dFWmR5R0lGZ2VsYnNWN0tK?=
 =?utf-8?B?NHRSbUxUM0p1TE9iWGNBWnA4OUZBckhCSXV2ZEp2S2NtMVJFcjlKdG81d0RG?=
 =?utf-8?B?NDJzTXp4engzVTlmcE44WDBFMCtNU1VUNHVsaFcyWU9yWWgrQzV4blBIMUM5?=
 =?utf-8?B?VTN1ZmpzbmlITndaZ01nb3V5UTA2aUJadXAzeVd6NlhTcWxpUENKVy9KYnNl?=
 =?utf-8?B?enplSjRtT2xLMGlvK0dOMURxSWsyR2FTL3ZEZnoxUS8xZ01CTkFMUXZyUmVs?=
 =?utf-8?B?SFZUOUs0SFZFaVZnM3J4bFlrMlV4czBhTlZaRUVFcFZaWHlqc00vcWRXZ0kx?=
 =?utf-8?B?RlhWZ1J2bHdIRVFiQVlpMkM0ZFNOc1UvaXlMVnJTbnFFVTVPUmtyQnZaSEhD?=
 =?utf-8?B?ajlpU3pxWE9vSkNNQ0krakwwaG0vT2Z5d0pkaUJHMXZMRDhUZ1pSa3YyY0dD?=
 =?utf-8?B?ei9zVVRzTlhoMVMyelk4Uk8yZWQwSnJIWVJQZDVET1VjN2QzNnJHYmdqcTQ1?=
 =?utf-8?B?V29nUnlPSWJkaldENUpnbFpXbTRYejRadlM0UkZZdHVHeDQzc0tFOWl4eEw4?=
 =?utf-8?B?WklpZHlKTUVBK0tZVVZuMmQ5TFBQK3Q4RDBxTzdmZEplTlJRdUVDVWlRZWZ0?=
 =?utf-8?B?TXFWU2Z0ZlVaN1BkTzRDOGJtcEJBRm9Td0VzdkMxZHV4VGZyL04vcnVNNWlG?=
 =?utf-8?B?eTZTZS9zZmh6MDFzMlc5c3dXZTZFeGVweHg2WmVKQmpLTEJKbmdrWGFGUG5n?=
 =?utf-8?B?bTBUenBCL2JNWUZkcGhHTFlQNU9TcENFN2c5ZHY5YUZlVkZ4bDB6ZGJSQXpW?=
 =?utf-8?B?Tno5MUJTOVFSMUliTUV1TkRNTGxmZFpYdG5oQmYxeGE4ZWpZVUhnckR0cHow?=
 =?utf-8?B?UTJVT2FSM3ZoVTlMWXB1SEhCdXpQeVQrR2hyaURUbmVVNGk5ZXNFeElVTStJ?=
 =?utf-8?B?aTdOc1B6TS9ndG9tNDd5b2NqQUQwRmJMQmhHeFpKRk5vU1dJSXJxOUJjUk9h?=
 =?utf-8?B?K05SWHJhblQyTnhOdFh2WWtpTWptTzNGWE85MmFBcWhIa3N5M3BZMitZZlNC?=
 =?utf-8?B?OE9HUC91YiszZ3Q4THY5dndLbnJ0YUpLOEhETVpKYUZPZVVTK1NQQnRrZVh1?=
 =?utf-8?B?L04zbzZOOHMyNG1JRjFEdnZMZmpLQzFtbzBkVm9meFcwa0VsaFRjWVR5UXBV?=
 =?utf-8?B?dXhiNkFxMFdwWkxrK3VPcm9uY0RXdE1MZVJIeDV5SEpLTGFISkFUL1duU2wv?=
 =?utf-8?B?SVNpVnloWGllTHFPZU56UjVlRStPbCszY014TklHK2ZNSjlWZVpucXk3K3Mv?=
 =?utf-8?B?RllrTzcyWngxNTY0MTI0cGw2amM0VFgxbFIvSURTNTZTTlVNQ1BPZFdmZVJp?=
 =?utf-8?B?KzcwYkZiZStaNDVqWG1SQUMyZVNoU2Iwc3dmeCtBZ0I2SjJkT00yekdSVjJ2?=
 =?utf-8?B?b0d1a0UyTG9RTGdZeHpJSWRBSzNLOEdjSHJSSURCeXVnTzRrR0JHVDhoZ1Bz?=
 =?utf-8?B?Q1hsNXZNc0duMjdJSU1aNjJkNTE2MFgxN215cXp6NDM0TEgyUnR3bFprekV3?=
 =?utf-8?B?YjM0Y3lRbXRQSitvRjhZTmlsZEpvWlFERFo5cU9IRW81S1UrWm9NZ0Y5Q0t5?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7f0444-92b6-40db-f4ed-08dd7c3e040a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:53:15.5868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZV+hbJyfLcLF8b8mHgN4sskuqNZSLvdPiIklJiV55ITi3NaWO6SJM2I5jvBJRMJdGpOmMGiPIg+yYDTMNM1Ls745gQq5zp5uY5kJ/YGkWCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6192
X-OriginatorOrg: intel.com

Hi Babu,

On 4/15/25 7:20 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 4/11/25 16:04, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/3/25 5:18 PM, Babu Moger wrote:
>>> The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
>>> can be assigned to an RMID, event pair and monitor the bandwidth as long
>>> as it is assigned.
>>
>> Above makes it sound as though multiple counters can be assigned to
>> an RMID, event pair.
>>
> 
> Yes. Multiple counter-ids can be assigned to RMID, event pair.

oh, are you referring to the assignments of different counters across multiple
domains?

> 
>>>
>>> Add the functionality to allocate and assign the counters to RMID, event
>>> pair in the domain.
>>
>> "assign *a* counter to an RMID, event pair"?
> 
> Sure.
> 
>>
>>>
>>> If all the counters are in use, the kernel will log the error message
>>> "Unable to allocate counter in domain" in /sys/fs/resctrl/info/
>>> last_cmd_status when a new assignment is requested. Exit on the first
>>> failure when assigning counters across all the domains.
>>>
>>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>>> ---
>>
>> ...
>>
>>> ---
>>>  arch/x86/kernel/cpu/resctrl/internal.h |   2 +
>>>  arch/x86/kernel/cpu/resctrl/monitor.c  | 124 +++++++++++++++++++++++++
>>>  2 files changed, 126 insertions(+)
>>>
>>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>>> index 0b73ec451d2c..1a8ac511241a 100644
>>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>>> @@ -574,6 +574,8 @@ bool closid_allocated(unsigned int closid);
>>>  int resctrl_find_cleanest_closid(void);
>>>  void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
>>>  unsigned int mon_event_config_index_get(u32 evtid);
>>> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>>> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid, u32 evt_cfg);
>>
>> This is internal to resctrl fs. Why is it needed to provide both the event id
>> and the event configuration? Event configuration can be determined from event ID?
> 
> Yes. It can be done. Then I have to export the functions like
> mbm_get_assign_config() into monitor.c. To avoid that I passed it from
> here which I felt much more cleaner.

From what I can tell, for example by looking at patch #22, callers of
resctrl_assign_cntr_event() now need to call mbm_get_assign_config()
every time before calling resctrl_assign_cntr_event(). Calling
mbm_get_assign_config() from within resctrl_assign_cntr_event() seems
simpler to me and that may result in mbm_get_assign_config() moving to 
monitor.c as an extra benefit.

...

>>> +static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
>>> +			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>>> +{
>>> +	int cntr_id;
>>> +
>>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>>> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
>>> +		    d->cntr_cfg[cntr_id].evtid == evtid)
>>> +			return cntr_id;
>>> +	}
>>> +
>>> +	return -ENOENT;
>>> +}
>>> +
>>> +static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
>>> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>>> +{
>>> +	int cntr_id;
>>> +
>>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>>> +		if (!d->cntr_cfg[cntr_id].rdtgrp) {
>>> +			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
>>> +			d->cntr_cfg[cntr_id].evtid = evtid;
>>> +			return cntr_id;
>>> +		}
>>> +	}
>>> +
>>> +	return -ENOSPC;
>>> +}
>>> +
>>> +static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
>>> +{
>>> +	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
>>> +}
>>> +
>>> +/*
>>> + * Allocate a fresh counter and configure the event if not assigned already.
>>> + */
>>> +static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>> +				     struct rdtgroup *rdtgrp, enum resctrl_event_id evtid,
>>> +				     u32 evt_cfg)
>>
>> Same here, why are both evtid and evt_cfg provided as arguments? 
> 
> Yes. It can be done. Then I have to export the functions like
> mbm_get_assign_config() into monitor.c. To avoid that I passed it from
> here which I felt much more cleaner.

Maybe even resctrl_assign_cntr_event() does not need to call mbm_get_assign_config()
but only resctrl_alloc_config_cntr() needs to call mbm_get_assign_config(). Doing so
may avoid more burden on callers while reducing parameters needed throughout.

Reinette
