Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CC621ABA6;
	Tue, 29 Apr 2025 15:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745940401; cv=fail; b=nGYDSRD9uKEObRAYFEupItnzZcDyyg27u7yirI4HPO+RnhL+MQJ8eD7nnS09ao+++QyliWVe6r09qJfUTrUxkCzskaKHbRRY2quseNxMdpHQZu4XAKJVhQJEu+If5Qq6GW6QkG+hs60STYf4rtWZvUK56RyuosDxELvsRsRegas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745940401; c=relaxed/simple;
	bh=Thefc6Ba9sxiXB1QZHT4CZhjZDDytte5xwVi0JOLJNY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UeNnp7MnPln5VZt0ViXGOBd/zOxrpOFzv8wXvRc9qPozdWz0Ih5+VCh7admV7PEd+smSNGMCLd+mh/n7tgNrj2khsqSBuLIZany/5N23mO2t/hf8U+PT7u3MxqXsVimAPWe7xp0QmbfPav1ZZnB6QKafPR393oM6WWOSQAviEwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlmrbHgN; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlmrbHgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745940399; x=1777476399;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Thefc6Ba9sxiXB1QZHT4CZhjZDDytte5xwVi0JOLJNY=;
  b=RlmrbHgNbH/Gh1Z7Y3IvSQf9WQDUJL84zcVp58YWgBbxjQTMyS96GhPe
   t76fJ+9Q1l90CnodwIgcq6TZn42uBeOYhc+IaXcFzednMIGG+nRa3tPDo
   DlZw5d4ZsYfbIGpx34CITVaITISTjC6jEVB5X+b25Ec0jiuTI0lvBJ4Wv
   XaLJXm7YGs1ZBKybmn5TxWwWZWkr1wsXjP7j59WOB+axRocDkSUd+uwo+
   KCVqXUJ0JVuUHx+2RtnyupItuLr4PXyfxd0SJlnjPGLvTSbn4yd+GY/rl
   95GhMBXVqGC+uK9J6/CghdrO2qaUwwZs4ZpGHVSgwGSrO7UG/t8RYl5YD
   w==;
X-CSE-ConnectionGUID: nRh+SrPhQK6PNcTwLF/D8g==
X-CSE-MsgGUID: F1OOVfUQT9SHurC/HED9vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47704806"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="47704806"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 08:26:38 -0700
X-CSE-ConnectionGUID: 2iz2l6QhSaKc2KXKcydDmA==
X-CSE-MsgGUID: JrxWlzgYS3q2pS1Dzne1sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="133755932"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 08:26:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 08:26:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 08:26:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 08:26:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tijuTKkmxpLf/EcjuAx8mt4cd+xyn0ZbnJJ8s3+gfBA9qhK8HnUCjbZ4dMTWWPK6wwWpbTU37/bE6Uqdx3Nl4NpkkmihmS4D1q2bxM3ziuyi4MTETcSdCG0qI42wdlnt1KVbLUrmDOlnEABWh5DrrekrZ3NBF52qA+kFe2xHx9VCwGyMrk+JpoPE12Rvaf6AckvVAXL9NSF9GYt6hDKeMn5UFzMVohk2j4IECrVwvdVoIEXmLpe2lua+USWpFaZrVOHyqUDqTw5QG5+VhcMb8XHjxkdqs5HKZhlLG9JkWTbI0aZR+V3NMMj/Gw7DoGZH4yuEaxmX7YL5YWeqCIfgGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2cXNmNsbtClbaxeCT8HAMgpurDjumbR3QtnGg6J8T0=;
 b=vSKI8OBXRZ3ePvl8/gL8cyxviPU8JyX8NyuYvZGVHIcMUlYoX5wZBqupoS3ag55h7rcVDQQKseCEtRmYH1dn+taU+lFQafEz480qqSqiWxfExegXcDG1Uxxe4jyDxmCjWenndG3kw74+/lwlqDcWHqBMDljXTtXGKcJytHOlXIbz6cSmOLwWQP7XGGz2N7JTRQPd/NLp2mr15NNfT1aB9vJwH/dCo8n5eKEEcMTXrudUuWYNJ1QSe2kNkBTj3AWzGYxvMqvof4RZ5cmJfIu8hxtSitgJEUbKCOr3tFhBkw5cGvjFmXjwztlUWNHfpZLraQ/UEuY9F3pyXRN5CdXsJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MW6PR11MB8390.namprd11.prod.outlook.com (2603:10b6:303:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Tue, 29 Apr
 2025 15:26:31 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8678.025; Tue, 29 Apr 2025
 15:26:31 +0000
Message-ID: <82d02705-46d1-4748-99e1-be80c06644fc@intel.com>
Date: Tue, 29 Apr 2025 17:26:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: catpt: avoid type mismatch in dev_dbg()
 format
To: Arnd Bergmann <arnd@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20250429073545.3558494-1-arnd@kernel.org>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250429073545.3558494-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0308.eurprd07.prod.outlook.com
 (2603:10a6:800:130::36) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MW6PR11MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd7da6c-418d-4e0f-1a11-08dd8732381a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0pBYjd1WXV6d1V6QlBrU1hncXN6N0lwekcvVTNRUFVwMjZOTVl0NFBodEhk?=
 =?utf-8?B?T0srWDhwWE5Ba1BHMXJlaUpmOVFzQmhKRzdLSTRBd0xWOTMyakRJQ3Q5dzYz?=
 =?utf-8?B?cHg3UU8yeWFLSE1YVTNaVDlidDR4QTVJSnRZMEEwUllkelN0b1NVZFZsY1N5?=
 =?utf-8?B?YzZoRG5VcnNQa1RtOWMvVDE1UWRFdFRLNDNpc3hGU2NrQkVjeXFnb2xPY1N3?=
 =?utf-8?B?RWJpdmFSMTllemRiaVpuVW16aVE1cFFMMGpwUE9aMXhpTGRGTE96N2NoNnpn?=
 =?utf-8?B?cGlLV1U2bkN5OGRXczhHRVpLMmExdnpoZzNoNm9pWTdvbkJNUFBJSDRaRXl4?=
 =?utf-8?B?MmQ1OWtVajdvTnRuM1VGWlBxbXZFTGJPVzlGZWJUODR6bk9FOWpNaHpNMnlW?=
 =?utf-8?B?Q04vaWU1VzBremxaUzZWR3h6VmRHSVZRRTZPcDYzM1g0b2l3ZDZtcmVEeGtK?=
 =?utf-8?B?eWFLT095ZDhPSEJEU0RpcldkV0s1ZHBybW1UWlRCNlg4TkVpVEM4azYwYzEv?=
 =?utf-8?B?TVJ4ZncyL09MUjFBdE9vMi9IeW4yYVIyc2R6MzZ4UGZyRW1sWnFjUThYRzky?=
 =?utf-8?B?eDBJRDhXTzdvcThkWWJ4WnVlbW52ME5vaDZnTDhUelp4c21hTXFwKzRDRWtU?=
 =?utf-8?B?ZXROdnFTejk1YzE0K0xvSFFBY0lza1VpYWhQU3ZBS2ZRbHJ1RzlzY3RPSGdw?=
 =?utf-8?B?NTdkaTFIeFI1QUV4akl3Tmp5RTM5NjJNYSs5Z2RjWVd0ejYyNTJiSWsvWHJl?=
 =?utf-8?B?MmNJVHg3TldFOWlMWnI2L2N4WmdqeG1oMzQ2cFhVM1Ivb2xhMVF5bnNyWTgr?=
 =?utf-8?B?QlM3TjNxTnNkV1loU2R0cWhwZUU2dDV4V0FKdjdwTGc3ZmJkNGh2NHlFM0th?=
 =?utf-8?B?cGE1empjR0N1WXo4RjdHMytqNWlTczQ1VVlZMXNDN3RFanhtS1lFWDhDUHZj?=
 =?utf-8?B?Q0dpNTdLZkxlbVBYajc3c3pEZTg0MWtLakh6RksxVWVjcTRpV1ZzL1REcVBR?=
 =?utf-8?B?NHV5R3F0dXBlWFVOQmdoUzRRRkFSRlJzQUdnbE5GYjYzdWRoVnBNcFFKRk9o?=
 =?utf-8?B?eFhXTVZVNWFWUFk2SVVzT2FrZ0Y2MjkxV2l2L3g4S1p1N0xaN3NQeHE0RktK?=
 =?utf-8?B?OWdBMVB1cmI1aURCYWRTczZqQ1Y5dFlseENPSTRIMDhSREFNOGNVN2txWkhD?=
 =?utf-8?B?Q1hvaW00TnNqdEtLY3hmWVFXUUtqSERWVmJhNmtCc3Q2NEtvRWorQVc2UmlT?=
 =?utf-8?B?SjN3bGRMNFVJNTVNM0NnMFRYSU9XKzZwODV5T1cwYko1V2NXR1hMY256UXlr?=
 =?utf-8?B?K2pSRHRrdjBVbWtVdW1uaG9vNDhsWnppaDJVVThJOE13My9WM3RuOEp0dDZh?=
 =?utf-8?B?cG5oTzJtOXBkanJhbDF1WVl6NEg0SlZzaHI5aEkvYWhIYUJjSnhocXpwbWla?=
 =?utf-8?B?U25ubDA4bjlsYklPdGN1WTNiMjc3S2NLU0NTSU5NdHRZRlIvMUJKbGdDTmtO?=
 =?utf-8?B?VnMyZDNScXhsMktrNElIMmU0TUZ4MUR3WVNjNVpTSERSVjVRVTFaV1pxOWkr?=
 =?utf-8?B?bTF3WnhGd0ZSVVRuTDhoMUp2cG5GR3Vnbi9NVTJ2eHRMb3BZZFJ6TFZmSkR6?=
 =?utf-8?B?Y0t2WFlpQ2tQajJUdHdORVIvbGlQL0ZlbUk2TG51cHQrNlhlN1RTZGhuOUNK?=
 =?utf-8?B?RWwzMGZPaWRwdEhJRmhQSHRBaURSWkNYaGt6cGR5Y2MxN0FqTjBBdEFKeHNx?=
 =?utf-8?B?VTN2eHZPcXZhSVBXS3JTQWhTekxOelN3MTU1SWduS2FPM1dMcFZkTnNydU5x?=
 =?utf-8?B?bHFYSCtwaUZUN0paMDhzYXdURVZpdXcwQURjK1F3ZXFodG9HeTZoaWZmeHZS?=
 =?utf-8?B?aFN6czhnS3F1Y0VkUjkxcVFwd1hEdDk2clN4RGRlaS9pcGIyc0VjTDlkaU5J?=
 =?utf-8?Q?cfecEOzlDcI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnF3MmFJVjBCSkh0MTRpQ0VSdE4vdWpxUVFJTGVtaVJXOXhCdHo5WXcwaFIr?=
 =?utf-8?B?eEo5bm1mVyt2enZ2RVYzWnl0R3NidTIxYXE5Q2FPL0hoKzBYaHRUdDg0ZVpX?=
 =?utf-8?B?ZDRLSlBueGJZYWxtYmpWVURHR3AxR2c5L1RZUzhDQnlqdlYreVAwa0tVR2g2?=
 =?utf-8?B?V1VxK2M3N1k2SE1PTElieUJ4eXI0c1ZuWmdhRE9VZ2hMaVVjek9LeDBYQU5t?=
 =?utf-8?B?alhPRWdMY2Fad1J1MGxURXNNRDJWektvaGxjZEpORnVMQU15VHphakJGeVVK?=
 =?utf-8?B?QnFUV09PWUJNeFg2UFlpbHNDV0lMVW92Si9YZ1VtaDRPY3hXY3I0Q1dSMDdR?=
 =?utf-8?B?aTVEQ01xdzYvSGltMnpPamJiUmgzQmgvdzRDdXpFcEJuZGIwNVVlcFBucEsx?=
 =?utf-8?B?NlU1UW5sRmpKZE9WWVdhZEdmOFI2TGZDcnI0TjJTZ2x1ekpVaWpyVGlEbFVF?=
 =?utf-8?B?aVBBWUZZcWhDdUx0QjN2V29YcmJlS3piZGR0RFVJOElUbFdaMmxoemowallQ?=
 =?utf-8?B?ZDJzMjBEUDFrQUg4MzFERzdjK0FhR2JOSG1TYUxTOFNCK212QzN0TjRQRjdJ?=
 =?utf-8?B?SklENGtqcDZxc0VNN0RZdno0RWt6d1g3Q3lzZm1HbW52Nkw1NUY0cDBYTDhD?=
 =?utf-8?B?RXB3RHJwQUl1Q1lkYk5ZZDFPNjQ2WDhRWThDVURJNWgyc015d2ZVdXVzbit1?=
 =?utf-8?B?a1NPZ1BEL2JHbHErR3BabFhOR2RJY3lYWlBkWEJuWXhPblo2a0pRdnArMEhE?=
 =?utf-8?B?bzRjZVhjTk0wTEtDYW4vN1UyRmZjRHpSL3YxWmJ6ZVdEYklYaFdPbU1IVENP?=
 =?utf-8?B?aVE3OWhPSXBwd0Zxa1RSSldhaFFDNjBwU0wwbmZPUVViNU0vOGNpZVExUVIz?=
 =?utf-8?B?TnRjWWpLc3g3ZUpycFE2ZzRpUmp1VmVSUnVXSDN4Uk1jMWlBbHFkUVYvN3JP?=
 =?utf-8?B?eHhXQWhiV3l3cS9xZy9KUTZITGN1NEhFV0QraGt5UWs0M1NNOXNiVnRCQzI2?=
 =?utf-8?B?MDA5RDRtcnRVTG5sNTFMSnpmRWl1bEZJVWY2NXlyWmN5Mk5XWnhRcnR6Qm04?=
 =?utf-8?B?T2krMGlGLzRBM1g2ZG1RYkdCdUlmaDl5U3pVRFVLRFJYdy8xWktxREduNVZl?=
 =?utf-8?B?dGdyV3JRM0hMRmprOUhxb2JNdy8yQjBGUzMvTGZPbXF5TWxRR1NQalI5Y05j?=
 =?utf-8?B?UEc0eWFqMUJOZzFnbVpRUXZLanBtRW1NMWw3ZXdQYnNRZVEyUnhDQlltZ0pa?=
 =?utf-8?B?UHVmM0ROdFpEeDVCcklrbWU1N04vdWpMNzhPOWc1MTFBWUJ2U210ZzI5aHk5?=
 =?utf-8?B?M0dYbjMvcEFqMUR1b1krWXN6WEU0QVpObCtOb3NEclhQOWVzQ3dyYTllMVhX?=
 =?utf-8?B?VTVkWWZLSXBYYUtXSFBlYkFIdEJZL003bXFRMHdXaGd6dU5yeFhvRXhiVFY2?=
 =?utf-8?B?QUxvdnJxOGEvenpOby9aYytScG04UEtteFAwQi9kN0RZLzBDQmd2NkRwYTdV?=
 =?utf-8?B?ZG9BWHhoVDliSW9JNWhPdEtzam9iUlVJdWNSS29NbEpFR0cxQVlLcjZFa3RS?=
 =?utf-8?B?Y2Y3eXNTVTVicFNjaDkwV0lySEhSekgyUzk5QVdjYVFzOGNla3lUd2g4ZUdO?=
 =?utf-8?B?b0RCNmpVL1pNOTNtSDhxODBHZkZudmt4STExVS9iTXpIdUhrd080T3BDd1l1?=
 =?utf-8?B?dHVjazQ2eTd0RlRlMlRvdTlqTktNZlR2L0hXelRqcGRLaTFKNTJYT0Rod1FH?=
 =?utf-8?B?QVd1clQvcjJMS1oyRXRGaFpncWdpeThjYUF5VWVnSCtLeGp6QnVDVWJNaThI?=
 =?utf-8?B?OW9lSU5Lam9NQU5SN2ZxdzUxMVB3R3FHeDhhUTlGbURaSytSU0h0RGlSYlhB?=
 =?utf-8?B?ZXFTMHZHVDdNMUVmVm1MSmdlRCt1aWtMbUtnTHJsQUpadzBDblBKS0VDOEUv?=
 =?utf-8?B?a0dEaVRobSthWUpNMmx2UEtaMXdhb2VKNTlqNmY5ZzloWTlmMTBRRmp0SFU0?=
 =?utf-8?B?UFkyTWFEa3ZneW9ZQ2ZlRUluQVZvTFNiOVQvczJuZm9peitpZ1lCUlBza0xq?=
 =?utf-8?B?WmxIM08vK2prb2ZiNlRuNVE1Y2dwWno4Tyt2ZVVrM2RVMHBCZzNOeDF1Nlp0?=
 =?utf-8?B?ZnBjeW5yRjBXcVBEYWozWkFjakhRMlZUY2FuaHJheklYMk5sMUtGVUNLUmpV?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd7da6c-418d-4e0f-1a11-08dd8732381a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 15:26:31.8733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRu7B+Gdy7IbUx8e/85lACgDqT2Xh7NYMU6LHrhdRW2XzXVgbm0xBF1BmA9Ro1QlKOTzlvJSBefoZzbZW/uJN7vN9BBXdLboNyOmHnN7LZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8390
X-OriginatorOrg: intel.com

On 2025-04-29 9:35 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Depending on the architecture __ffs() returns either an 'unsigned long'
> or 'unsigned int' result. Compile-testing this driver on targets that
> use the latter produces a warning:
> 
> sound/soc/intel/catpt/dsp.c: In function 'catpt_dsp_set_srampge':
> sound/soc/intel/catpt/dsp.c:181:44: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'u32' {aka 'unsigned int'} [-Werror=format=]
>    181 |                         dev_dbg(cdev->dev, "sanitize block %ld: off 0x%08x\n",
>        |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Change the type of the local variable to match the format string and
> avoid the warning on any architecture.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   sound/soc/intel/catpt/dsp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
> index 5993819cc58a..008a20a2acbd 100644
> --- a/sound/soc/intel/catpt/dsp.c
> +++ b/sound/soc/intel/catpt/dsp.c
> @@ -156,7 +156,7 @@ static void catpt_dsp_set_srampge(struct catpt_dev *cdev, struct resource *sram,
>   {
>   	unsigned long old;
>   	u32 off = sram->start;
> -	u32 b = __ffs(mask);
> +	unsigned long b = __ffs(mask);
>   
>   	old = catpt_readl_pci(cdev, VDRTCTL0) & mask;
>   	dev_dbg(cdev->dev, "SRAMPGE [0x%08lx] 0x%08lx -> 0x%08lx",

Thank you for this contribution, LGTM.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
