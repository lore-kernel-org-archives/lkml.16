Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE3026658F;
	Fri, 11 Apr 2025 22:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744409270; cv=fail; b=V3MaBOhQAVknKoZDXPd5QLbORF8kVvMgfGTkk+i8CsnApVR9pMtvZDNQ0Zb1xyDlOb2BvSeqlnYbEsFvMFnR57GZJl+JLqWk6wXVQrBrk34pNKTWertlUEsXd6tge9N8jvFa5+8p8mcjE4Vz4Ov34uSpCMSGRh0SrqFPJuD8cQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744409270; c=relaxed/simple;
	bh=eFcK/NQMcp4c7j9JddW1bwQJl80VTFoOpp72mweXs3s=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=icbj/Xs4p18HqpqIOKIoNMxmPmy6Dg9LxX1ioMFI6k4fAY1FwOi7uTQw49FCcPNjXhTHEwFfe8arpP9demwC/oQpDNo8k+1uy7z+lO0udBsqmtQ8HWmL7pfGLlc3gQPFMkjCzu+yHBkU2GFkabfEuy3X3ypuZZ3MT9nP65wXDdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iY+E+eEF; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iY+E+eEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744409268; x=1775945268;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eFcK/NQMcp4c7j9JddW1bwQJl80VTFoOpp72mweXs3s=;
  b=iY+E+eEFLzZLDYCLbGx+g0VlK+PnwNbwwV0P+3BksT87b+eApoIDgL9j
   mDurc7K2NU7as07C3VSuANmZxkfTqsEnV11ArokYn4VB3+qYWpv51lw9V
   1xyLlOnUnS+UYLtpISSv1ja2EyE0cLP9Z5B5vgY9z60ddfSL+G4/DQJwi
   2bSjJJtYkbHmH+0oU6+uMX6Qdi2RCjmLZPCgk6LFP1bEgc9Ew2E/k13Nu
   pfQIqtfl6rcnu5gM9oQ5WM4rkXxs2Nm7A3hR/p0QruX28q41gonICFUcK
   SUyssMJo1ipW9XvuCyJPIY39W6OVyFKd7lZL/hIoMkbO+OpfAFqeRr3Ib
   A==;
X-CSE-ConnectionGUID: 1uE5rS6fQrqIUVNfzP906Q==
X-CSE-MsgGUID: i/OvmljQSoeiOxiHtSNrdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="46060895"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="46060895"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 15:07:47 -0700
X-CSE-ConnectionGUID: XZ3fXSF7Tc2IfMxf31xk4w==
X-CSE-MsgGUID: XUjRD20pQ12YgajShiteng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="134288288"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 15:07:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 15:07:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 15:07:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 15:07:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnMvRIXKAPa61iUWIhQVT8vTfmwoDCK99jvykTDGAN90u6td0WT8cXkMYdoLDVgs62fjXxzzKbSY4wspJ8ldZnmqrpLMDvCIPXFcyNv8tNUqhJA+JN2EjEDnm1cELMQ4aSugySZ5mQPvMuoTgybl6q2NuQFDSMb4m9tNY5aImuDp7lyKEBVKcQL5sLdSU9wzqGWS6eNjO3xrv25854hQI5ouOmsO35tG7ZrQHTRFoX7nFfS73qs9jVgPtwRMImUMxESxj1IX2PrebwvsBDt/XeuTV6pdXY0kw2BlkR43Ejji1geoEgTG0bomL/Tvk86n0mnLzjxN/CVbzZEmd030JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18IeN6gTZ//odPultyiPAep+M5Kkly0KU6XoGpSqV5k=;
 b=C4C8GDIc8lrcwSnwsPk3Fm3PqX7AWwVUTynLKEzP64yQlVmdMlfMbiY8jsNvPVsgzlTLOj2MzSMjVfjo/Y7Y4U7T2x4BOd/K7tCTtUAkopXkI2JquEEKY82oiZ5EmRjPeuXaf4p3YEo2Di08sGLnuQVph8KrHKEz5xcmn5KIJI3lrNN1sTO7evVeDUOaqkaP3t1EopPKWXyF3+GNqyrjxqipe40vx/hH5Q+tigSiJyDuDcLnvdSCyoFx8rFmh82ZwMFwo/V01gmBppNQGygOoaZGn0imEAovsLEVdA1qrYLPqwykslH5Rlhcj7+n/qIesbc65HVH6EBtnAtVzq1UOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 22:07:43 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 22:07:43 +0000
Message-ID: <7be35258-f913-4111-b5da-c4173615cf18@intel.com>
Date: Fri, 11 Apr 2025 15:07:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 20/26] x86/resctrl: Provide interface to update the
 event configurations
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
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
 <d18beb9ca31eb013405677792377542e609ea693.1743725907.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <d18beb9ca31eb013405677792377542e609ea693.1743725907.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:303:dc::14) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|SA0PR11MB4750:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8b660c-bb62-4448-5722-08dd79454840
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlZ1WjFDS1pCdlEyZVd0cFRqMGplZUlTd3YyMHRRSTUrUkpKek5XYk01NTdI?=
 =?utf-8?B?SzJTT3hRV1pDMlYzbW9YVDYxdFIrdmx4SHJPNDVEUitpNlNWY01ZaTcyWHhN?=
 =?utf-8?B?OC9Od2RMNGFFS0EyaXZ4QWg1VFgwaHZKTlRzVElYQ0R2bnhtQjlYMStZNDln?=
 =?utf-8?B?NjQ5U3lDdGp6Zzh5bXRXTlMveUpGQVBIU1NGWmMzSEs1blNCOWFMWmdBWVQ0?=
 =?utf-8?B?K0Jjbm1DZFZhVWZ6NXpEYUluNDRzc2hqNm5LcWswNEx5Y1F2NFlENGpuUTFm?=
 =?utf-8?B?TzBTb2cwQk9zeitIdVllalRsL1BlL290djBweGNtSG92RUg2SkpZVkFMRWpl?=
 =?utf-8?B?clJqdmtGYVUwOVFqWU8rMVlxZ0JOelEvRXpEWTkrbXd4TWRKalhJcjJDNEFi?=
 =?utf-8?B?dkY4UzM0dFlGc3J5TjRBSGdKbi9qVUZUZVdFVi9mTldOU0dlclJGSmhMdnMv?=
 =?utf-8?B?WTE0c0xydW11aytrNlVRbmJOVjFYR2NmTnpPS3o2V2pIVHBjeExEc3F0Z25t?=
 =?utf-8?B?T1FjRlhlUWZQbVlIczltQnBIQjBsSDhyanMvaFlJMm45MEw1cEFFb1o2b2Fw?=
 =?utf-8?B?R2dRS2NRRkh3VjcrNi8wMDE3cC9BVSt4VU01V1Rldm5pZkhOUk04MnhSZ1JN?=
 =?utf-8?B?UzRFMkVaY2JPbjlMN1dNTVF3YjVRY0l2Y2NVR1ZpdHA0bTB2ZW1zQ3pTamlz?=
 =?utf-8?B?SHN0ZWpzd09TWmJSbC9BN2ZUV1VpWnp6aFloWGZ6bjdGVWdhSXFWUFptWVZW?=
 =?utf-8?B?RUtjUUdsZFZZaHl6Wk0vbnRCTEErSmJpNmdnSFMwc1JSZm56TXNwYXhIZis1?=
 =?utf-8?B?a2FDY0t4R3BQazdMbEx5SlV4SjFYeWV3RVVTZXdkclNOa3c4RlJOejB2Nlhr?=
 =?utf-8?B?eWJBTGE5WlJzZW14YTY1RjNFdnJ0UUF5LzQzMXZidCtjaGJzVkQyeGlBK2Rt?=
 =?utf-8?B?aU1HSXNkZ3EvUUFTZlVzTk53R0dvMktvdHJxK010b3llSFRiQkhkei84QVJ3?=
 =?utf-8?B?U2U3b1ZkUFZLTnBmeDhpVWNrRmczUCtYVEVaRWhvTjBsc3Irb2N3R2gvcEpt?=
 =?utf-8?B?eUhOREFuRXNZVi9iNFU2V2Mzb2YvS1RpU0dQQ2d2S21uYjI1eFNjWXRTSFFz?=
 =?utf-8?B?SzhscFArekwrOFhVUzhUcnlDTkJNWlhRenFNMHYzSFY2MVhvMHNtRnFSeW9l?=
 =?utf-8?B?ZkNReEw5emhHTjYrRW95SVhrMVBiTGlneTczbGdZWTdsZ3loOGtmL3FMUm90?=
 =?utf-8?B?NHkwaHl1WFZ3aWt1VklhaFE1dnpScFFpMHNlclJwNVZ0MXVIN25OVTB5ZUo0?=
 =?utf-8?B?MjVIUjBLQ1BtOTFRRFlhR0pmOTBZYTFqQmJVU1ZIOTJEY1VoMnFnWTFSWU52?=
 =?utf-8?B?Y0xWZHZmRGlwdDNwUzUzYm8xRWxCMCsxU0FvTE5TeWRRS0FtVm5zbU00cVFL?=
 =?utf-8?B?ekthWFR2emhkbTVJL0ZqOXVBUDcxTEQxUExtMEk2c09Yb0Nsa3VpM3NERzZ4?=
 =?utf-8?B?TWVMRll2MklRYm14aGhOOTFVR1ByWWJFRHRzc2hpaE8vMFg2U3BCcTE1V1lr?=
 =?utf-8?B?WWI1VXVyUndiYWVCdm9Ob1hPSzdxUDNrWUhlN1NZVC8zUWw0ZWtZUXJNYUxE?=
 =?utf-8?B?UjQrN3ZQNW1UNWNlVTM3YnlLVU1mdzdsTG0vd0JEMW9CYWZNZVFseW13RllN?=
 =?utf-8?B?ZzVFQXkybGZPbHo2WCt5SExYbURNSWhic3ZVSURhZFZWNzVkRjBqdklhSUVx?=
 =?utf-8?B?dFVMOXAzU1NrWDRRMmZnMWJZT2pJbzVwMHRSNWRvSm1LL2YyemhtekhRc2R6?=
 =?utf-8?B?RXZ4TE94anYyNWhIeVFRYmFDTmNTMjVLR1lFRUxCWEgwN0J2UDZzRmxkSGlZ?=
 =?utf-8?B?azBoVm1SUXNrbVhXR1pmSjVublUrTEt0RVpFemNDOVNBUEdZb3VsTklNYlB5?=
 =?utf-8?Q?LC2+DSbluoo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1BLUHVJeEc0Q0VVUUM3QS92NDZnMHJmNXRyK1VEaFJUY2dqL3ZLOHpvWTQz?=
 =?utf-8?B?WlZkLzlnRUtoMVltK1k0ZjZwRncwWFdTUzhQNUxOQjlzYVp0SHJlVSt1V0kr?=
 =?utf-8?B?ME0xTGNJcS9GK25XTTZ1Zk1udFE4QU5sVjdMcGlaTnIrRTEwajZGYmpvcHZx?=
 =?utf-8?B?V2NKaURFS0tMWE5IQ1hReDBZOS9tdHhXNWhBdUliSU55bEhGa09zSzFOTDlT?=
 =?utf-8?B?dm13TGd6bjF2RTJSbkVvNUhJaGVCY1F0d1lCUXBKaThwZFNWUkY4VGtxS0Yz?=
 =?utf-8?B?V0dOeFVoWGpoME5heHU2QjN2MVVNcXVBYkZIZVBFQkU2T1V6OU01em0raXVy?=
 =?utf-8?B?ZjZTNng1anJPYjdNTmVZNGJqNmZHaGUyMWdIc3NSNTljZlRpdkFSUGVkT01S?=
 =?utf-8?B?Zzl1SHhjb1NpMHR0Q3JoTHhtVy83SDROYUpQb0pmbjJTRW5PM0Y2dkdCbWRX?=
 =?utf-8?B?RWZXakJpaUl2TGs5ZGRUZ2VoSllmamVxVmQxTFhVZTdCeFNEV2ZHSDY1K0hi?=
 =?utf-8?B?Ti95ZDExUEpYY0t0RDI4SlR3SU9XSytBeFZNVnBBK2RFSGVQeXFHTnVFclIz?=
 =?utf-8?B?WDVIVGljSDcyRDVVNU1vdXBuajFMNnJHU0lGTGRPMERHY1NucEhTejZKOUl5?=
 =?utf-8?B?VXFvZnVjcDEwVGNYMFdGemg1L1hXaUYrODlEZzlObENBRGIyVFJQeHhjT3JM?=
 =?utf-8?B?TDZUV1RYTlh0bnh1c2JIMGg3cWJuTjR4UVcrbVUxZDFmd3hkV09UaUo3SC9t?=
 =?utf-8?B?eVQxM1FMS2hkbnlvL2ozWVNuSEdNN0UrV1kvekcrWjM1SE5laDV3Q0RTTzNw?=
 =?utf-8?B?Uzh1YlN0RzFqZTVqWUd6Rm5rak8zRU8raFI5QjFCUEppMnZPNzBONUkrWUlh?=
 =?utf-8?B?d1A2RGs2bjY1c0F2SnYrZXh1THZMbUdXMmFkYU9WeWVJSGpVaVVhZ3l0Q1Y4?=
 =?utf-8?B?VFZ4QUlRMzlOVUUxeXNwdVpFeS82UCt5WHBoZ2tyRUtkeDlMaUFNUjFIUnZa?=
 =?utf-8?B?STdXYlI2OTkyRUNlbThuU1JqdEw0YmJYSUFCYkZETG5mZDF5V3ppcUQ4Vjhh?=
 =?utf-8?B?RXJWKzdOcDBrL1RvaVN1VTl4NWIzRjY0djhwelN1VUc2SFRMK2xaMmxmMjRL?=
 =?utf-8?B?QStQaTFKOG50dHdOUlNBcDR1MUJzWTBzK0VEMDJ4Y1dyZUxsay83a3VkVDh2?=
 =?utf-8?B?bHBnTm5ZM3orSnV3VmFyQWU4ekRZSTNSUmM0emx1SGRYRGZnc2VFMDl2QlUz?=
 =?utf-8?B?SytFQ2RsNjZKbVpDUG9pS2ZKVGg3c0s1bWJYcmV3MmwwWG8xOFM4Mml5MzFv?=
 =?utf-8?B?RFI4UDBWTXJOUGNrbUNES1FCUUNuY2d3QUpsRStWc1h6SkY5WWF0ZmorOGtR?=
 =?utf-8?B?bW5ZQU9FcSswV1Zmd0tHTTdnMENwVVNnYTNkL3lEUFoxb1BxU1BDVVJZdzVa?=
 =?utf-8?B?eHFGTDdJc3VNTUlnL1hGdW40cWlZYllCM2RUT2ZpVTFUWW9mNWhwWDdsc292?=
 =?utf-8?B?R2ZYM2pSbm9jL0VLWXpsdjYwOWQzMFlmdnEyNTdNSnNNSTdPTloxNVhMNzdD?=
 =?utf-8?B?My9MOHBlRUtkbkpBKytYeEFxeHpkNFhzSWhVK0Mwbm0zTitqM293cXRveGVs?=
 =?utf-8?B?VERrUmsyL0V5eGFEanNXUkxSV0xVUGgxR3BXWHBLcU1rbVlMQldza3c0QWFP?=
 =?utf-8?B?SCtENTVnMVZNMXErc1JqTHpiRFpEcTBQbDBONmJQcUt3Sy9LS08yTnFNdVZp?=
 =?utf-8?B?dkZSeG9ZUElONG44ZFdrOStHZW54bUZZK2huSjg4RnB6cFhFYUFyajlzeTlt?=
 =?utf-8?B?cS9DeTFGa1cwVEE1d1R5Tnc4QlIyZHRtcWpYUXlzQm1nS3A2bWdDWEtPNW80?=
 =?utf-8?B?bDNIdWxROHQzRmN4M1ZSK0hxVUtTSXF3RktSNFpjbVhHZjFSUURjcloxWDhu?=
 =?utf-8?B?U2Z1ekZVOEZoTUtUTlBkL255blpJQnNHVWZxUFJ0bVNwVFJaSFNlRWp2THVC?=
 =?utf-8?B?RHQ5WWloQ2RqdFV6aURrSXNUdCtZcW9xY3orUGUzUk5PQW02UWFJbVlmUDVr?=
 =?utf-8?B?QjVocTZZK2YxUDYzTEdWcDZzZ1ZCM21OUll1aFd1cnJ0YjZNTUcwRzJvcnR6?=
 =?utf-8?B?T2hkUzNUK3lwTmZOQUc5eDY3S0kxR1M5VmtIOEtLWktFT09MYm84M1d0MjY0?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8b660c-bb62-4448-5722-08dd79454840
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 22:07:42.9928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/cTLNQFXVj/056MLVGwN+cPTQ4L2f4574xPGugy8JhVOVeN4ErmSeCt1GbqeLnj84Ndm63QoyBUfQautcqtny7LW6cu6JyLldZrDt6iLXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4750
X-OriginatorOrg: intel.com

Hi Babu,

On 4/3/25 5:18 PM, Babu Moger wrote:
> Users can modify the event configuration by writing to the event_filter
> interface file. The event configurations for mbm_cntr_assign mode are
> located in /sys/fs/resctrl/info/event_configs/.
> 
> Update the assignments of all groups when the event configuration is
> modified.
> 
> Example:
> $ cd /sys/fs/resctrl/
> $ echo "local_reads, local_non_temporal_writes" >
>   info/L3_MON/counter_configs/mbm_total_bytes/event_filter
> 
> $ cat info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>  local_reads, local_non_temporal_writes
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v12: New patch to modify event configurations.
> ---
>  Documentation/arch/x86/resctrl.rst     |  10 +++
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 115 ++++++++++++++++++++++++-
>  2 files changed, 124 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index 99f9f4b9b501..4e6feba6fb08 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -335,6 +335,16 @@ with the following files:
>  	    # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>  	    local_reads, local_non_temporal_writes, local_reads_slow_memory
>  
> +	The event configuration can be modified by writing to the event_filter file within
> +	the configuration directory.

Please use imperative tone.

> +	::
> +
> +	    # echo "local_reads, local_non_temporal_writes" >
> +	      /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
> +
> +	    # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
> +	    local_reads, local_non_temporal_writes
> +
>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index b2122a1dd36c..7792455f0b26 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -1926,6 +1926,118 @@ static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq,
>  	return 0;
>  }
>  

Could you please add comments to these new functions to explain what they do?

> +static int resctrl_group_assign(struct rdt_resource *r, struct rdtgroup *rdtgrp,
> +				enum resctrl_event_id evtid, u32 evt_cfg)
> +{
> +	struct rdt_mon_domain *d;
> +	int cntr_id, ret;
> +
> +	list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +		cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
> +		if (cntr_id >= 0 && d->cntr_cfg[cntr_id].evt_cfg != evt_cfg) {
> +			d->cntr_cfg[cntr_id].evt_cfg = evt_cfg;
> +			ret = resctrl_arch_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
> +						       rdtgrp->closid, cntr_id, evt_cfg, true);
> +			if (ret) {
> +				rdt_last_cmd_printf("Assign failed event %d domain %d group %s\n",
> +						    evtid, d->hdr.id, rdtgrp->kn->name);

Please provide the actual event name to user space. The event IDs are not visible to
user space.

Reinette
