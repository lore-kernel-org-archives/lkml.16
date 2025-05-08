Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1829422AE76
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 22:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746744306; cv=fail; b=aVofRpt8Tsu4rhtmbmAC1FbpsW347ZF0yULXby2/rT/uvdFWrZgrD5ap4c7FFtdQvZZkIFLMkwDRy5+yTKvviWzlQ/UdTUXxptr3PQjdJD2qryNAymaV9HqW9oFCPvKfs4vgPMxR1Agl38HngrOquqkp6Nb4mkVuqsrgkuuLizg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746744306; c=relaxed/simple;
	bh=gr0kONXUSJzTF9njKRIAAkhIVx3ZQQyqx35YBF/1iFA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nYjnN44CatgjtxBlcLl96WZpNOleIWbLIqaAVrjYUw2hzW2uyse++COFOFfyrmELVXkoYU1zdSZjTssmoXBQfTFWVGtcx1yDr1AciHzlhNlGUt3bw3yPdV7o+C8vr1xKDflm9cW5SS7AedhXHajMgwCjkR3i1c8dGXE9gjCEB2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=creB/6wQ; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="creB/6wQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746744302; x=1778280302;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gr0kONXUSJzTF9njKRIAAkhIVx3ZQQyqx35YBF/1iFA=;
  b=creB/6wQRFeSa2ltpV4sxXSxV/YzGEWCs/Q2djIQB00jB7iLauRmLWaI
   42RGdaEk6Hv0mtbChN3N9Z1vKubXyjDB1+F3UCvzaHiXS/h0pabHhFDJf
   c0tPJGSofj3rHJE2ZSY/exHYM8L/Jp7Jy4aGvrV1Mona3FyIje2AZU1LP
   xQVrLL+ovYHtBdPZtmNUOv8lORj51B6+BIevwZNAO6rkMhn7J8xaPoO18
   FUxpyjU6CPv48xWDbA8tBze0zqL2aribxMtnkNc2ZPFzXDIEZP067y+N/
   6Hh6U7suRcOxGvuEd7Zy9P6e8gYz8+MrSFmu98o/bd/FWUdsu4XUTNtJn
   A==;
X-CSE-ConnectionGUID: aswUIB73S0yS6cqX5n9ddQ==
X-CSE-MsgGUID: Ds8645AjSV23MvzzbNRUOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59218093"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59218093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:45:01 -0700
X-CSE-ConnectionGUID: 1kbKjYW1Sa+f4SZu4aU2ww==
X-CSE-MsgGUID: +ZMQC16qRgyQF5hdlyM+HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="159731613"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:45:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 15:45:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 15:45:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 15:44:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/BaG8gM6LGfsWdu3CiF/8fA2N1j9T3VTb1RQhITLGANUkdHny7WEtkkpy7QRcDbslEDDXsRrMCJYsQ9tJFSib7dF15L60wCJoFMXO//qcnstJSF2hLJTr1Ud9U7RQeqeqYV7Sb1PyquZpzWlNPzDnICzrafxF0UiCwEGYTleIGXXp7/k3e1H2aCc65NE0Pdc+XuGRW9sT3XuprhiJTMBmh1VGemP2ZZUtoOd9BYPno9tjwdak3gwJ86HuEafiAjTbnSwwcRXt8nojezdxwdAevQq0rwMpCb7VNDUC1jv8h90m6cra9q/J0RhY86gAzoM1j3ZjgTpuhiNGXv1W8pdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbACKfzsv3uiTyYcc7j2UlDmQCEdQ97AIgQQUycJ688=;
 b=SY7e/WMHNpUoBvmtG8ClUIxI+tXfoy+r3C4w/9041TLw48FV9uzbncIBlaDcbR5IqcLtJlmryf6Aj/te9QgXc8uZ+2Q2Kmt87RhsMdTyDtYd7O9DXBvjBTJK42CIzXxnEYNcpZjtXXiQYuXjMoOqjgFIQFVT9lIW+PUEyUAql36dK/+IhTIKglBMKWavq6Pa0f2cQtZWbSBH+GO+N1dY8vPAowYIM55x+2ESt69hZzDc8kmJ4YVsoU3+T/kCvypURT4Ebg3C9uU8LrzBgSHf5E9YioD4V58GrKHkXvKU50Sjt9HoOXe5/JomS9YOag/nKLdmGd40+jnyJa5Kbf3IOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB5007.namprd11.prod.outlook.com (2603:10b6:a03:2d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 8 May
 2025 22:44:52 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.021; Thu, 8 May 2025
 22:44:52 +0000
Message-ID: <ee3567ee-584c-4994-bb7d-cb0d054e682b@intel.com>
Date: Thu, 8 May 2025 15:44:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 12/30] x86/resctrl: Expand the width of domid by
 replacing mon_data_bits
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
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Tony Luck
	<tony.luck@intel.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-13-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250508171858.9197-13-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:a03:334::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB5007:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d83e06-8a95-4528-71c6-08dd8e81f209
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUVrUTRZR1FXdGpGVXo2R3pydi9KVkNFUGVweENkL0xoLzBYRDhtNXI2eEk3?=
 =?utf-8?B?Q0tWa2l6ZUNJRHlkUDBZWWpPeHNyMnBjell4bWU1WWg4NUhtYTlNVEpzVStx?=
 =?utf-8?B?aFZnWEFiTHFXWk9HQWhHeTdSMCtTNHV1L2V5WDBnWFpUM1ZEZWFmK254UnVr?=
 =?utf-8?B?azJFZHhtV0RsbXVsQnVEK1pWQTdwYS9NV2lXZ1cybFdqeUpENjF0WHM1WVV5?=
 =?utf-8?B?dENsK2xnZEZnYzdjMmQzY3RkRVJpZEd2VWNWcVpnRkhtekR5eFpKTENGcm1G?=
 =?utf-8?B?NHd0Zk9XZlRMNjIxRUpjVS9Sb0gxd05MME5mS3F2TE40bkZrTTB0Ykg1U29L?=
 =?utf-8?B?bXQ0bXB3SEJoTFJLbW5NaU5nZ2F6cFk3OFJ5Z0FCQXJWME5kbm5maXAvVWkx?=
 =?utf-8?B?R1NlMGxzZnpHVGJ6RFZoemZWQW8ralZSb3lQUVJhRmNZbjVBVzFLZDF0RExp?=
 =?utf-8?B?QkVWaGFSVTJodUFZYm5yM2oxZDR0R0U5VzA1bldrblpCMXIxbzZXY2JENWs1?=
 =?utf-8?B?SG9hVHBNbUNqRFk1a0VhbEpLMGZtV1EvMnBxNklNL1N1SDhFV3FKVU51eE5B?=
 =?utf-8?B?TzErQ1pWZFdHbWRrRFovZElUbU9zRUtsS1MwU3ZpWllPeFJ2S29LUTd4QWU1?=
 =?utf-8?B?UWU5RXhwWmpvbTd6NDJsOVNicHhUMUtzZ1h0VHo1cGtJNE94ZU81RFoxK3ZD?=
 =?utf-8?B?SjNxdFc1Wjc1T3RSRkpvb3NOeU8xU3JaVk4vbzAybWkrV25jZ1pCWTFxNUZq?=
 =?utf-8?B?cm02ZmNqQkZwT3VlZzFCWk5qSUxtcVpLYzRMcnFuclRyTnZsVVVscVU2VjJG?=
 =?utf-8?B?ZlRPYnpNaGlkVmFjeGE1WFhuYjgzQk50L2NqdEtXN2FzbTkzRWl6bEtKRDNC?=
 =?utf-8?B?djJTdGlXU01adVJQOEo4d0xyejJ5OStqeEQrdHVuVkg0Y0RTazAwSHErVmY5?=
 =?utf-8?B?b0VFbjAyZjlWSGFFMmFHWWRMWHhtbVovTC9ERXRwdnhUWVc3eWlFUVljTUdW?=
 =?utf-8?B?U01QbS8wTnJzdVZZQ2Z2b0FyWllpQ2UxdXpCTUxxZ2NqK0Rlb3F5MmVrYlF2?=
 =?utf-8?B?R1I2eHgyRnFlN0xyWk9sSTdwZWhXd2VlRW8zLzVvekdFcngzODBBSlZja2FW?=
 =?utf-8?B?QXM0dDhKSFdLczhYZ3I1R2ZOVjNuMlVlWXVGc1ZyeEEzL3gvYzBTYUcxR3N3?=
 =?utf-8?B?M3kzeVJXQjFVNW43MVY5c2hsMFpxd0NhbXYwOHNlWTRmTjJQR3FZdlg0THV2?=
 =?utf-8?B?MkwvYkV0QUw0bTIrV0lvWEp3ay96WCt3UXZIY0hEaVM5OWM0dzNzdUxpWDc0?=
 =?utf-8?B?OTloVlNWdzBYZ3RTbDhUR3lRRi9hdGkvUm9zUTgxZCtXUis2czFhZHp2YzZG?=
 =?utf-8?B?ZFlwVUhFeGJNUFcwQmYyTTVKUHhnVVFwUVplZmpVWFRuWFVDTm5VK01CNmYz?=
 =?utf-8?B?T3dCQlg2RVVVV1UwTjlxby9idUhtaStNaUhnU0c1MlorT29UbXd3aEdhZ2Zu?=
 =?utf-8?B?WXE4bW5ZM1dQSS9lY3VPQXYrZnN2U2FnYzBSbTA3bjhvbzkzUkhId2RwdTZN?=
 =?utf-8?B?ZzFPa0hGQU13dVkxb0phTmtHWEo2SG9NaFJjRUNMc0pudnhVSzU4azFxYzRY?=
 =?utf-8?B?TGFMOWVaSUVwQnptYVdZWmZmVi9SeWJkbEFoT25kTGI3ZDBPaWxob0dKeVZs?=
 =?utf-8?B?YmVIN1BIMlIzSkZmQ2lHSlpWTnhuR2FCMExpdHk4S2hmcnVQRGh3RjBBYWMx?=
 =?utf-8?B?RXZ1TC9FeGNyZkgySXJWSlhJRVFITVdKZFFNcEwxNXJ5aHd2aU9rVjEzeURO?=
 =?utf-8?B?aXRLWHBrNVJmVzloaitSUy90b1FRU2I1QncvRm9zZENDWjhTN0JpVTdaaUJn?=
 =?utf-8?B?dzEwdGJSQzRCc1o0MUswR2gwQUFDc1Y4R1crL0laZEZ3aVBNcGxpVitzM1o5?=
 =?utf-8?Q?W7ii70Y+fmc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VngvYjZJYmNxRWF4VGRlYUxON3dmbjExTDdwOEdzRUxqMzBNODRZanpvakY5?=
 =?utf-8?B?L3lQOXF6WlJyaGRNODNLU3NGS0hUc0V5Q1NJeTVYREFvdVhxZm9XRUwzTkNv?=
 =?utf-8?B?aW9DT2NIenNNSWVWd2JJN01MMC9hWDY1aU05U1pKZjR5N0ViQmFyUHRwdXZm?=
 =?utf-8?B?NzA4K3BLeENWd1J0U0xpRm1uL0RWSFhDMkxvWFY4V3JhbDRLalJVc093SHZH?=
 =?utf-8?B?alAyZENYWU9zb3psZU42bnpSdGRZR2dJMURKTDVjY21MS00rWnZmSkdUOFpp?=
 =?utf-8?B?eDBuWFJlY2syT2ozc1JNZ3UyVENxQURyWFpuZlY1cGdlcEZCelM1ak5mNXFR?=
 =?utf-8?B?b2FFMTJJSThjb3lmbVVBVkVFOVc4Z2hhS2RQQmMvRFNCVHJVTHFockVPSEl4?=
 =?utf-8?B?d1JFV29oc01wNXc3aTdCYUdsOWZvbGV0NjZIM1NHRjF2R21HZGRkUjFJd3BY?=
 =?utf-8?B?anhkOGpINWRiZFFEdmRyNnVZZVZTWStRdVNxWVVLeklmcllONURhM091b01S?=
 =?utf-8?B?c1dhZ3NXZ2pyaG5VejZPUHdBM3pSVnNPd1ROc1FwYS9TWXNoc0xhVFkvRjVr?=
 =?utf-8?B?WWpaaXF3YnNwVTBTeTBRdjZJNHoxSWxVNWpKOUI0RlJZa1Z6RUtLdnRLVEVR?=
 =?utf-8?B?QzFxLzVWSE9acnZBMVNrMkcveU0ybDJaZEo4TjkxU2dUejYxZlc4c3VWSVB6?=
 =?utf-8?B?QXEyZUptQWF4VnZjMmtJYkFSRlhuN0FHYUx6ZkpSOFFlcTJEL0xWNEpLeWc2?=
 =?utf-8?B?VGdkR0dIUFNnaWFvZVB6cnZUSnFFTXNwTW1NTU00Y3hWdDU1WW8rMnFzRzUy?=
 =?utf-8?B?cG9Rdjc4eEFiaG96YWxXcWR6cmZTU0NteU5zdUs2MGkrTDFKZ1J5YTgzbmp0?=
 =?utf-8?B?VUpiVFprUi9LaDNJaWZwSytqUlZmQWIyTTNjTCtldG5ldDRyZHZPRGdxZmh2?=
 =?utf-8?B?eWh3eFZEa05VY0NIM01DbnpBWG42cGc5TlV6aGZtMTVSUHNPRWZ4citVVCtR?=
 =?utf-8?B?WXE0dnJHeDN3bGJUTVd2b0l2aGllOVV2cXRneVJvWWJiOUc1L1hRQW1QM0xa?=
 =?utf-8?B?THo0R1UyNm0reXhucVJNZEx5eTNxaFZKNzdJZDRIdDAyMUNFV3pEcFE4ajJY?=
 =?utf-8?B?cVBDZlRteWlJMFNiQmY0bXZRaUNCam9sVnVxMUdjejNrazNFblU2OU9LeGtp?=
 =?utf-8?B?KzZwTkZWQ0krVi8wdm9EcjhOQ3NWa1F0bEtTTVg4Y1pqdzAwM1p6MWFGdGNo?=
 =?utf-8?B?aTNFamdtM2dlSk1kMzRsVXluK2F0QWxCaHBkNnp0STRiTTYxTkFDNERrc0xN?=
 =?utf-8?B?Z3VlR3NSTW5nS1dGc2dCTzNsaE1aZzBQM05tdDNrWHE4WElDdHcra2pvRTdG?=
 =?utf-8?B?RnhRbjFBaVQ4WHlKek03aXUyZ1Q4NGgwc0VsUkVqSWp0NFVwNGtqbmJCLzJZ?=
 =?utf-8?B?dFZSQ29PdENVOUN5WkFUTHp4YWI5Uzk4ZGh4cTVPVHFnZXhxOG1BYzF5bk9H?=
 =?utf-8?B?OHJQQ01sbHZiVm13Zkt5MEFuNno2ajJ4Ukh3SHByZnBldjVrL2JzRGZrVHky?=
 =?utf-8?B?UUJaREFkK2VtdEt4UGF5R2E0STBpczJDQVRycldOckp1dGdvd2RMdjdITFhS?=
 =?utf-8?B?Y2ROU3hIdk0rNWExcTRZNEFuNkx4dkJMSVhiMHI4Mk1scDUxYUtnU0hxZkNs?=
 =?utf-8?B?NkNQN0RKMW13RVhUbGt0aTdNc3IxNWlNZUNWUk4vSzRNa09OT2wvY3IyZEN5?=
 =?utf-8?B?ZFBPeVVGYWVpc1ZEU3ZudzNpTCtOQm12QU94UFZiVUtQNG9hV2dzU0w3K2xT?=
 =?utf-8?B?V0RsZFA5a0hLOFplM3NxellRdVRCRWtVV2VVVmhaUjVxbW8rYU54cGY2cFQ1?=
 =?utf-8?B?dHAyRyt4eWNybFZXalZ1NWtJaVlOOUVxSnFkRmczT2JNeExrclVpSkZwdDd3?=
 =?utf-8?B?OUt5S09RY1oyWGN1eWFPdk01SXM4aWR2bmNWRjBHYjJvLzVQM3VCVHgzbHJi?=
 =?utf-8?B?U25MeEg5RFR1K3FTUzB4TW5YQ3ErdHpIN0xDNDd4NDZnRmhodzVMRERaaTEz?=
 =?utf-8?B?V3pVdmNBR3AxTHV5Zzcvc3VGUU56aUxOY0Y5ZC83c1BSakdrdDlUVW5QN2hD?=
 =?utf-8?B?MTZ0NFJia1I4VFJlaUt3S0JZLzNJY3dZclNWZmVwdFR0Nys4MDJlLysrWEhW?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d83e06-8a95-4528-71c6-08dd8e81f209
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 22:44:52.0205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdv33P+meWvDz7mD/ZrsIdSgntWV6QbOyJ6ay11v2Lnl8xBkUXBw+Ihh4qLbvql3Oy4sfWeIjy7aprekEmqc3JQn1tY1Fm/i9TOTHlx3Weo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5007
X-OriginatorOrg: intel.com

Hi James,

On 5/8/25 10:18 AM, James Morse wrote:
> MPAM platforms retrieve the cache-id property from the ACPI PPTT table.
> The cache-id field is 32 bits wide. Under resctrl, the cache-id becomes
> the domain-id, and is packed into the mon_data_bits union bitfield.
> The width of cache-id in this field is 14 bits.
> 
> Expanding the union would break 32bit x86 platforms as this union is
> stored as the kernfs kn->priv pointer. This saved allocating memory
> for the priv data storage.
> 
> The firmware on MPAM platforms have used the PPTT cache-id field to
> expose the interconnect's id for the cache, which is sparse and uses
> more than 14 bits. Use of this id is to enable PCIe direct cache
> injection hints. Using this feature with VFIO means the value provided
> by the ACPI table should be exposed to user-space.
> 
> To support cache-id values greater than 14 bits, convert the
> mon_data_bits union to a structure. These are shared between control
> and monitor groups, and are allocated on first use. The list of
> allocated struct mon_data is free'd when the filesystem is umount()ed.
> 
> Co-developed-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Babu Moger <babu.moger@amd.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> ---

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
