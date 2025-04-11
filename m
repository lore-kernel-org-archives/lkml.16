Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0153A20B7F1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 22:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744412079; cv=fail; b=GYQExclM6Ns+qAkuNQGTOy1DokdwgYjhNBFuZAkoA3rx4Z+CaH0MfPdGS+RtY/KbAoYbQ/x/6pi8atSkGtDtj5+o0EK1qMLGJ9SkcMDHOEc9bSXeshB0pnZdBabOtjwiL2/dCfVDSBezM9/vWDSkSRtRjLKcQycuN2R19UKGtmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744412079; c=relaxed/simple;
	bh=ragpss9Z77NzI+4jGMMBOqpMTcL815gpfjvwRsGWjFs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GCUFzq+1xMlV2r2lMJN+Y0zJLhfEYVfWCXQpcdIyOie8A0UYNYOglCe4y59EiLhdYyDPQ0VLjjZDXxlMspusvYO6KImbCXmsZnpAuI9GKjtlc4y+yoGv3Wqex/s8eNxS90S0eeRAWJKcPaL7WZcgwqc+FLjkpCvkkhtfdcbXJ3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1zzyQCp; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1zzyQCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744412077; x=1775948077;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ragpss9Z77NzI+4jGMMBOqpMTcL815gpfjvwRsGWjFs=;
  b=S1zzyQCpwagIo77wABqEINgPd4ztT3NGpLNAWq7WOFuaONPiZpxOjcmR
   TnP9uPUbFIj2wEoZuVnCJXINsMc4qLtBX/d0e6AZxlRGOw928BXVvXs4X
   Y9LHYKXgNwGpoAkqskq0ZXtP6W8YNvI0pSliacgM3gmx6RurpM5WrMzx2
   +MNo22nylbMDvZ244mCpiOMnzaohhSj6oZzwhXYoVCUuKDb/wbaJdWt87
   hncd1UkjCwP5Jkx1uEGumZufTU2802HqzWlJ4SWELTBfROUpbO4I1CY/F
   Pqx3RKGZLzfN+F/yHZC8t6kOOUiSLF8+PBTBRXIVKSnwwWiqO/+eMHu5D
   w==;
X-CSE-ConnectionGUID: sY2OVsGkRlyQ4WFJhjgVtA==
X-CSE-MsgGUID: 1FhkJWTtQQO8YJEHhchltw==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45984686"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="45984686"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 15:54:35 -0700
X-CSE-ConnectionGUID: FNtUvoqQQq2IQ+luuhLoRQ==
X-CSE-MsgGUID: oaqXUljnTIGKGQlODAnXrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="134296039"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 15:54:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 15:54:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 15:54:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 15:54:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghGd91tkIemq8oMcQKaA3th+JEp2DDswr3ZQPunfBreKdfxBp1ytVmOkLDcq1IGO9KMCts26O3I8iCS3ClKytViZkh6ojskCfQsbH2enZTJ60FSVwf2j0aUa+t1oPK7mkej38ZEzkOFjQcH+p1IMfyebRSbOtIsB0kq87CglFWiMXaQ4Y3NQvDZxvWemInBQ5z0dxCKTmGxi0mfHCtTcl4jSnauZgicSOYQgdz+PY3vXBuVAgyNzok7ER4SxV9DRXAOgCtNrSU7kJytrLx2rLCx3nEwj0zHXYAp2CJNoWW451s2AYn/rmd9SqJf6T2zU88k/dcCN8dvTC5qrsHInrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZaRYkCJpo9XG6jRd/zklvKpg14q6W3pyTUw2VG7mvQ=;
 b=prxDd8tUa1TEKL9tspG6YMyyrFTTlzersYK7a35QvzloSv/ibMRLXIXRv+s/VOm83QGkCllXs0W11ithchbI3ZfnXSnySGlMAr58BV0Tfrpd7dXNIp/VJgqZDjTpa3bgRWxY2aKVxmg7d9gHVYfzFdDX8hN6aTkSOIyU3+9yy8/BJgwb6MzjIM0UeTNJrHbcxguFuHbFuE645d9fDi7g92skn+Zwt9ZY3Yw2O5O0suNPClcgF/EqJw4K1C0u8LuAmwil0AaInLo1kDqkOEWucIxKzOHBuS9dESBcMZi5uwNh1cxUO1uBWuvPNCQL/xqloJlEECLSl1TSWc2BJenzFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by SJ0PR11MB4893.namprd11.prod.outlook.com (2603:10b6:a03:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 22:54:27 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%6]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 22:54:27 +0000
Message-ID: <22a47339-efd7-4df1-9b0a-14e5d6f59b67@intel.com>
Date: Fri, 11 Apr 2025 15:54:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 6/9] x86/fpu/apx: Define APX state component
Content-Language: en-US
To: "Chang S. Bae" <chang.seok.bae@intel.com>, <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <20250227184502.10288-1-chang.seok.bae@intel.com>
 <20250320234301.8342-1-chang.seok.bae@intel.com>
 <20250320234301.8342-7-chang.seok.bae@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20250320234301.8342-7-chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::35) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|SJ0PR11MB4893:EE_
X-MS-Office365-Filtering-Correlation-Id: b5239dda-aed0-48e6-991c-08dd794bcfc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2xhZ0ErQXZZNGFURWJXSTBSdHhVL0RJWWxLK1NLeGNHN1doTlpYRE5Yeldo?=
 =?utf-8?B?WjhzdUJ2TXdWQ1l5bllnd2Y2Y2g4NSt0ZTlpUlpvZjBlRWtaYnN0Z3NtRjQz?=
 =?utf-8?B?d05rSXcyMGFRdW1xM09VTUk3QXBNU2JMeUk2cmh3Tm8vWkdBSmRUUjlwVEt4?=
 =?utf-8?B?ejBwVmpjQ1Q3RFVTUjZ5SG1jdWllbEl4VnNVVmt2emRxdFljL01RVHYrdlFK?=
 =?utf-8?B?Zy9OQjc4OEEwWDNjSzdmZkQ0T1IrZUVvTVBMdDVyR2dOQVl6Y2VTQkVCK2dF?=
 =?utf-8?B?Vi9iWThZcXdrYzZLZUFyNGxqOUE0VTBSUCsyYkM0VTM0OTNWK2lVY3VrdlBK?=
 =?utf-8?B?OC9QOGE0b2FwckMwQk83dGlyWUx1QmZuVEF5UzRMTDdITG9DdS9HS0pxb3Nz?=
 =?utf-8?B?dms5Rmp0MVpneHI2RE0xOEtiSzBDSHI0aEYzakUyT1dnSDEzb2JLQkVKdU8w?=
 =?utf-8?B?UVNwa1k4WU9UYzAyS3cxL0lvb0UyUkdUQ3A3bUszR0tJNkpiTHhhSXdkTFF6?=
 =?utf-8?B?VWFHRTR5Q0FPR0lFL1EycyswQzZiaGtSUW9LbCtXUlNQbENsVUJMZExHdjNS?=
 =?utf-8?B?Unk5NjlyUHl6ODcrVGtVbW5vSTgwUUVLSElyQXp1aVpuVFo4RnlCOTRla2Y0?=
 =?utf-8?B?N2dhUkZDdG5SbmUrSkhqblF6WS9oUFU0cjAxU3lzYXRUbTlnNVJZREVCeWlJ?=
 =?utf-8?B?NUFzaHllUGpWdWlOTFZCTGlHWDh5dkMySHU3OVJHMFhiazBzaWwyWXh6WkJx?=
 =?utf-8?B?ekNxVkRRVHFyeC83cm03M216emNSMms4aU5YY1JoTmtqVGxqellXZHQ3ZTlv?=
 =?utf-8?B?a1ZvSjVBQXZnaS9yek9FYjhoQzRHTDlqNkNkblI1UTFNWXVoSjlkMml1c0hm?=
 =?utf-8?B?cmR1cG5jSENKRnZsZCtaYzFkc01MRDF5cVkrTVFOcHJLRnpFT1QrN3R0QjhC?=
 =?utf-8?B?aG1qNDRTQStRZ3J4bkdUY00yek1CNzE5ajY0U2FYTE5ZU2lnTVVzTFBrSis1?=
 =?utf-8?B?Y1lHMWNQMVVyVU1hUkN2YWNSd0tobmFPdWpGWkhHdXIwVmFXaXhIbUczUUVT?=
 =?utf-8?B?aVYzZFdJbW5DdEg2RVYva3VFSWJZUU51T2xpNmRCU0gzL0NEam1YS3hzbGVz?=
 =?utf-8?B?OGJXcE5oNzZSWXJJdEJpK1Y2STRHS1JqYmFtZVNndW1qbDJaYXhFS01QWHJ0?=
 =?utf-8?B?bnh3QXQ4K3E0aWJkSUhMVCtuVUdJbUVsbEl4WGlRUWRGM29yU2RUZUkvRWY0?=
 =?utf-8?B?QkgyRTZWc0RUQTV5VXEvUmNQRTY3U1ozdHpVQTJCOG1xWkkvMmh6Nkdnbzcz?=
 =?utf-8?B?WnRnWTZDTGg1M0c1Y1NVS3QrR1EwME5WZ29Pa2d5Q3ZvekNTRkdtRFBmamRH?=
 =?utf-8?B?Q1ZSRmtRTEtteEFtdVRCa2UwNTdQR2lPQmZPbnZmQXdMZFFkbjF4TVQ1MTl1?=
 =?utf-8?B?RXNHYUFTMjVIYnZzcGgzUS95UlVBV1JJU2J4aU9YRG5qWi9wNW5CVGp0VlFN?=
 =?utf-8?B?YlkvVjEyNElJUUE3LzNhSkkvS2VsV3p5VktYUmJMRk9URFVhOVZ0cHM3UzdV?=
 =?utf-8?B?K05YOG54WkJ4aVBIdXN2WGhoNzBPb1FRb0s3QXp2Y21tR1lsOGlnaklYaUFH?=
 =?utf-8?B?NFliQXA1R05NTE1nUTVObk1oMU9DVWhaK0h1cjV0ODlwSzBMSk9CMDhGOFhx?=
 =?utf-8?B?NEIwRlZ5TTEwUTRPZkdkc2FFRmV6K2d2U0lNVWFTQ2RPTDFrS05rWnpPSEx5?=
 =?utf-8?B?YlNMdDJjU0FhUDY3USttN3N5OU9aSVlPdjM4VVcxdU0zeU5PV094SU1MTGYr?=
 =?utf-8?B?UkoxcEppVkN5RTEvOUhlVlltZFVMdUg1RDgrK3RkQUxhalVvRTJpcTJYcE1y?=
 =?utf-8?B?b1FYcEgvRXZSNzdnRkp0RzVNS1NkN2wwYVQ5Q2dnay9YR1QrT0hjanZ2ZjNJ?=
 =?utf-8?Q?87o1RXyru2c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amJFb3BPRjN4U05LU0lSdm5oZ3A2UW90b2REcE8xUnhJeTFnVDJhWjg5c0hS?=
 =?utf-8?B?Q0t1STZCdU1ZWVFpa1FNWDRjSytTTUQrWVdKZ1hSUFdKWG5sRXJydkJ6UlR0?=
 =?utf-8?B?TXc4dkdwdjRLR2ZjL3ppZ09waW1VNGUvQTVJK1RoZkp3blNyNDRYWUFEZjEx?=
 =?utf-8?B?TFlxSFN2QnJxS3FyVGhpVFEyODEzRWVhTCtIY204ZDlxeGNST2lTbldYUjNh?=
 =?utf-8?B?ekZJU0RzOGlsWStmcjF5elp3ZnJsd1hOcXR5M05EV2JEck80OUN1RkVrdlNi?=
 =?utf-8?B?Y2xUMVB4aW9yK1ZmSFR5K2dUNGoxTURSZjUyb3J6MVRZUEVhLzJUSjVVam0v?=
 =?utf-8?B?V0V6dUhXaUtJTlEweFU2UWpORjJLVDY3K3lwZzAyaDBUYVhBWm10WEhVbzR3?=
 =?utf-8?B?SkljZ1pTM1FCK2k0MFJvR1RnbVY1dFBKWVg2ODFxWGg4bkNGUk1RY3BZRmY2?=
 =?utf-8?B?Vk9YdFZDMnN1dTNiZUwrNDlFanZmei85dFV6dDB0RmVvWFNlOHZYNWttUVkz?=
 =?utf-8?B?ay95dm52RjRKSnlGdUpCOGFMSEppRkU3V1I1aVF3M01DbTJ5QXNBYytRZVg5?=
 =?utf-8?B?eU04NXE3Mks5NWRvZFY1Vzd2TjJwY1lTQ01nRVlWUEN3MHNiRjIxS2xKTjVk?=
 =?utf-8?B?Q2JkK0I3MjZ3czAvVThuenFuSFN3d1ltVUtkOC9GaFNPOXVyaEpIOFpkdlg0?=
 =?utf-8?B?bGtsN2p0OVlRRERCb2p5VDRmZ3N5QStBWkUyR29JSUluMTlQSlEvY1AzUDlm?=
 =?utf-8?B?VlhBN2FKZThPQnJWQzRMdkFvdzJWa0xsNnZYL1pETkhVaTROYmxoWFoxVDMw?=
 =?utf-8?B?Szg5QW9iU2w4K0RMb1N6S3BvQjdVa0F3MUd5bXFEZkljeXp0MHFNTjRweGxn?=
 =?utf-8?B?a0txVndwdUd2Uml4OFVjbmk2MGJqZXUxWUVScDVhODBuSDlJKzdEOTVuVHpO?=
 =?utf-8?B?cFhEV2xZZkxxem9kbURDdkl3cUVNb3VDUHlNdGZDMFNWdysxQk0wdUtGMjlv?=
 =?utf-8?B?SGJzYm15MERaNnlnNkcrOFNZdkJrcVJac0d1WXpGTHI5dFhJVk9RMU1sV2lv?=
 =?utf-8?B?VGZKR2JzM0hvVFczaElpN0tITW5IK0RxVHNUakM2V0ZHdmlIak5abW9lZGhw?=
 =?utf-8?B?OHBwRjB0N1FiV2hnOWNuMGtCelE0SzkzV29ES2NITzl5bWFwZHN6eVBQVFZs?=
 =?utf-8?B?akl5c05mTFNCZXExVDQ3MFYxZFNDZC8rNklzcjIyVlZqeEZ1aUVFd252M1Nz?=
 =?utf-8?B?M1J5RW1HOU1YLzAzS3FKZFVOUjBkTHlWcVdzYTZ4R1czUFF1NlBqeHQ2NUEw?=
 =?utf-8?B?dkNCbFdKVy9QcmZqTW0rSEFIbnV2TjhyeEJUeGY0eEoyVWpRSmtEZWU1V0dU?=
 =?utf-8?B?eVJyL01vU2w0TmRDTHphbVNKYjk1MDVseGNvdEwwVkJGWlFsNmhRRktvaERG?=
 =?utf-8?B?NUdOMVhBNW5rK1Z0U3lyWTFpSzM5OVNZOFpkVkZHT0lWanhkdDJsUmdXTDZq?=
 =?utf-8?B?dmp1a0RWbjY3VUJWSFp4RGNzVnBtOHJISTdWTVdkVTJ3SUxXWWNiTmo4c0lz?=
 =?utf-8?B?MGxGM3Y4UmQ0aGxDMUFsMDJUK1BtTTQ5eCtTR1dxTzhYNHk0ZUdtOHgyaE5G?=
 =?utf-8?B?L1UzQmVjSjExVkl0MG1ydXEyREg5R21hRHpRdUNQRklKOG9iR1hQeE9JVWVE?=
 =?utf-8?B?RkVCMnlaOGtkM0J2Z29EZVVFd3NJcmFUcitLOEkxd2F0OHNBdk9XOERzMGo1?=
 =?utf-8?B?Q2lYaXhaZEdaOVh0TWpFSDlYU0RVTmZJSFVXSDJ0ZWwySFJwV2FKM1pMa3hR?=
 =?utf-8?B?d0UxQmJGTDF0TzQ2aFU0eUUzeUNIQXU2N1NWcDRvZEwvRlVHRDFLN0swSWl4?=
 =?utf-8?B?ZE1Ja2hJN2V3WmxtbVpuYnp2anFvYzJvN3pScFlVa0crTGp4OWlzQVFvN3Rz?=
 =?utf-8?B?cVZUZjMydktub3JCT1dLRmhWZE1BQm5DVXFOZDYxQVlZTmdpMUE1elczN0Iy?=
 =?utf-8?B?eUhNRDZNdFlPLzVHVXpndUJVTk1KL0FlcVREVXU1UlBFMHc5TkxDT1E3VVlk?=
 =?utf-8?B?WGRpMm9OTVYvK21QV1M1VFVQYUhjUXlJck1LdVZQTCtSWGJWNENJZ3FnUyt2?=
 =?utf-8?Q?gD9lp2EudZOJF+N3Gis2Ihe4G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5239dda-aed0-48e6-991c-08dd794bcfc9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 22:54:27.3204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhuX73fKwQs6/n5GwfByQscJz3YeiGMzBOhVuFtk4htFZT/E/jRq9j+paTOBDb6r34vmiTRKAILxpOziVZu37w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4893
X-OriginatorOrg: intel.com

Overall, the patch looks good to me.

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

Some minor nits below.

On 3/20/2025 4:42 PM, Chang S. Bae wrote:
> The Advanced Performance Extensions (APX) feature flag was previously
> defined. 

It's unnecessary to say this. You could directly start with. Advanced
Performance Extensions (APX) is associated with...

> This feature is associated with a new state component number 19.
> To support APX, it is essential to define this xstate component and
> implement the necessary sanity checks.
> 

It might be more precise to say what support is being added.

Maybe something like,
During context switch, to support saving and restoring of APX registers
using XSAVE, it is essential...

> Define the new component number, state name, and those register data
> type. Then, extend the size checker to validate the register data type
> and explicitly set the APX feature flag as a dependency for the new
> component in xsave_cpuid_features[].
> 
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> ---
> RFC-V1 -> RFC-V2:
> * Remove the ordering table change, as it is now dynamically populated.
> ---
>  arch/x86/include/asm/fpu/types.h | 9 +++++++++
>  arch/x86/kernel/fpu/xstate.c     | 3 +++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/x86/include/asm/fpu/types.h b/arch/x86/include/asm/fpu/types.h
> index de16862bf230..97310df3ea13 100644
> --- a/arch/x86/include/asm/fpu/types.h
> +++ b/arch/x86/include/asm/fpu/types.h
> @@ -125,6 +125,7 @@ enum xfeature {
>  	XFEATURE_RSRVD_COMP_16,
>  	XFEATURE_XTILE_CFG,
>  	XFEATURE_XTILE_DATA,
> +	XFEATURE_APX,
>  
>  	XFEATURE_MAX,
>  };
> @@ -145,6 +146,7 @@ enum xfeature {
>  #define XFEATURE_MASK_LBR		(1 << XFEATURE_LBR)
>  #define XFEATURE_MASK_XTILE_CFG		(1 << XFEATURE_XTILE_CFG)
>  #define XFEATURE_MASK_XTILE_DATA	(1 << XFEATURE_XTILE_DATA)
> +#define XFEATURE_MASK_APX		(1 << XFEATURE_APX)
>  
>  #define XFEATURE_MASK_FPSSE		(XFEATURE_MASK_FP | XFEATURE_MASK_SSE)
>  #define XFEATURE_MASK_AVX512		(XFEATURE_MASK_OPMASK \
> @@ -303,6 +305,13 @@ struct xtile_data {
>  	struct reg_1024_byte		tmm;
>  } __packed;
>  
> +/*
> + * State component 19: 8B extended general purpose register.
> + */
> +struct apx_state {
> +	u64				egpr[16];
> +} __packed;
> +

The below comment makes it seem the APX component is inserted out of
order. But, it's the PASID component that is actually out of order.

I'll send a cleanup patch separately. It could be applied before or
after this series.

>  /*
>   * State component 10 is supervisor state used for context-switching the
>   * PASID state.
> diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
> index 46c45e2f2a5a..2a270683a762 100644
> --- a/arch/x86/kernel/fpu/xstate.c
> +++ b/arch/x86/kernel/fpu/xstate.c
> @@ -63,6 +63,7 @@ static const char *xfeature_names[] =
>  	"unknown xstate feature",
>  	"AMX Tile config",
>  	"AMX Tile data",
> +	"APX registers",
>  	"unknown xstate feature",
>  };
>  
> @@ -81,6 +82,7 @@ static unsigned short xsave_cpuid_features[] __initdata = {
>  	[XFEATURE_CET_USER]			= X86_FEATURE_SHSTK,
>  	[XFEATURE_XTILE_CFG]			= X86_FEATURE_AMX_TILE,
>  	[XFEATURE_XTILE_DATA]			= X86_FEATURE_AMX_TILE,
> +	[XFEATURE_APX]				= X86_FEATURE_APX,
>  };
>  
>  static unsigned int xstate_offsets[XFEATURE_MAX] __ro_after_init =
> @@ -570,6 +572,7 @@ static bool __init check_xstate_against_struct(int nr)
>  	case XFEATURE_XTILE_CFG:  return XCHECK_SZ(sz, nr, struct xtile_cfg);
>  	case XFEATURE_CET_USER:	  return XCHECK_SZ(sz, nr, struct cet_user_state);
>  	case XFEATURE_XTILE_DATA: check_xtile_data_against_struct(sz); return true;
> +	case XFEATURE_APX:        return XCHECK_SZ(sz, nr, struct apx_state);

Can we insert the new APX case before XFEATURE_XTILE_DATA? These cases
are not really in numerical order. That way, the switch case is more
consistent and easier to read.

>  	default:
>  		XSTATE_WARN_ON(1, "No structure for xstate: %d\n", nr);
>  		return false;

