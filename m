Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32E624466A;
	Mon, 30 Jun 2025 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291833; cv=fail; b=QbYdc/VCHeI7LWZ9fbePdpc4heYVrqgFTnCkLWVklb8H//SrZq61y4DBUjDhz9rJL2csGOltD69U7ugZjUY2eUQFgCbGFC7O/86ZauGCjwkrk5svjcjZHzgMW5uQqPsHox1ZWx9KMTFxP4lQu+CCV3ySkaiFdP88F9mT8TswL9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291833; c=relaxed/simple;
	bh=vpMElSSnkpmIBKOWhu6IAKvK/8xMx9C7tT2JscuxFn4=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tm4E3gDtnJDU4f4WV1thTOfCPuTdVkKqfy1ZkmcS2svFncNWc4x+jO0Ez8gCJfx5woH5wpc1bSMgAIrFTBAmP8l9UsAxYsKfRd5sfFOksxEyFSkFExMAqVBxbXzN+weo8rfsib1AxFD1RgWWomPLrA9cASSxpEYM8XOK9Fi8ids=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ai8rjPrr; arc=fail smtp.client-ip=40.107.223.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ai8rjPrr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvxSktR/LH5kuegHv48QOCbesZZMdxZAowt7HUdWTeDH3A/01d3gplBPPD7pyd2vxPmM5tPE54PCKEyM3hjAIZGyvMnaG0H216TQslYzc/WUpeXHo5xajwUgMK87WPr4nRiJihQIiJVSO7WgxZlh9xgMnFveJBS+Ewfe7zPaMcg/tsHJeJ/QORk3Jn/iFAk8xE6i9wW0vrXJKo+e/KOoCsHH0w7L6F9lKULNEt+FyXtmz4IcbC9677s1JNnkhcc/szV4kkiwCKpffJzO1ovFHNR6hbLwRjJqHVwSqcN5xzrkxnra4azmlYo6V8zrIsTOvoRFazE0kbmQy2wis70tow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPn3Q5LqEA5XS9BFAfkGsLJdAg9bE9lxa5TSIyJOSVk=;
 b=Al6RCwd7u8dXge8jw8GFpOywfWVD6C5SctSQwnOTrEXmk5BnG8LLIkEq0bcoztnXpbQQA36XXVj+zmTUjJ/5pqBMFxTVjig82jnDJyzX4dDA38+19VM9gxOAqX6IcMfMbSxbOziiCyHvifSxwTEO3vdcUyPWVzGMRdic6nP8F4amH8tJDoTiB7MhgzU55KWbuxCgzJ8bXQP2NgDAzFhAIM+K+79+LdVTPn5HHJRBBEXHQPCA26F8dJHtTHj4tuqCe4IRNqbAy2EZQbKxTe2lj3Gf4c00cFGWTb2+PrSW/tIVnKz3K1dWoUGjP3Ecd+EYUyY64DZlLSjRGmnxTf8z3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPn3Q5LqEA5XS9BFAfkGsLJdAg9bE9lxa5TSIyJOSVk=;
 b=Ai8rjPrrFCGpHyTrUIWs8wXvhMvNmO2L8rbw/oy56K1U+S1bFZ7+AvDZtODq9kSwjNu2KRxBkgDbAlkwJepevYi0m6y1nMZeoldDkxp+25eXXLo3z9sRiuStOAsXuPTlwOw420Kce+CdeypIcIe/Wera57JWLFcQGhsnI1X6sM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH1PPF4C9628624.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 30 Jun
 2025 13:57:07 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 13:57:07 +0000
Message-ID: <ac378dff-3eb1-498c-8b01-b7c5146c96bd@amd.com>
Date: Mon, 30 Jun 2025 08:57:02 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v14 21/32] fs/resctrl: Pass entire struct rdtgroup rather
 than passing individual members
To: Reinette Chatre <reinette.chatre@intel.com>,
 "Moger, Babu" <Babu.Moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "tony.luck@intel.com" <tony.luck@intel.com>,
 "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "paulmck@kernel.org" <paulmck@kernel.org>,
 "thuth@redhat.com" <thuth@redhat.com>, "ardb@kernel.org" <ardb@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "seanjc@google.com" <seanjc@google.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
 "Shukla, Manali" <Manali.Shukla@amd.com>, "Yuan, Perry"
 <Perry.Yuan@amd.com>, "kai.huang@intel.com" <kai.huang@intel.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "xiaoyao.li@intel.com" <xiaoyao.li@intel.com>,
 "kan.liang@linux.intel.com" <kan.liang@linux.intel.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "xin3.li@intel.com" <xin3.li@intel.com>,
 "Shenoy, Gautham Ranjal" <gautham.shenoy@amd.com>,
 "xin@zytor.com" <xin@zytor.com>,
 "chang.seok.bae@intel.com" <chang.seok.bae@intel.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "maciej.wieczor-retman@intel.com" <maciej.wieczor-retman@intel.com>,
 "eranian@google.com" <eranian@google.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <84e5cffb2b3f8088f77781babe89b0cab513ed79.1749848715.git.babu.moger@amd.com>
 <918e2679-9778-44ea-9755-270658578f76@intel.com>
Content-Language: en-US
In-Reply-To: <918e2679-9778-44ea-9755-270658578f76@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::15) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH1PPF4C9628624:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f46db55-4d2b-46c2-10e1-08ddb7de004d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3NEazNEVnFIWlNOWDVKd25jZ1JSMjJkMHVyeTdvOGthM2M1V3hJWG5HSFN4?=
 =?utf-8?B?SWtzTGkxS3hGTFp2eVhKYzNaVjFweUh1Z1FjWkZPVTRPb3oyZVNFTFVHeHhC?=
 =?utf-8?B?SWlxbVFhMml0VHdFTDVnMUtLYmovZnU1NWQxbUdCbHh3NmNhU2hiUnhpNitp?=
 =?utf-8?B?eURvUlpOSFMrUXlKQ1RWK08vYzI5YTNUdVh3Z01QbEVIVjkyK0JaR21RNzR2?=
 =?utf-8?B?d1ZRZng2eGZKd0dPWUlkVXU3TnFGaHBIWitWSEoxeTFzL1lkRWRTYzgyS2dI?=
 =?utf-8?B?WWZLYjhTaG5YOUsxTmNZUnVuS3dIUjNuZDhIUUNFQTJFUmRKS3EvSno0czNo?=
 =?utf-8?B?U01ickFwWDQzUVVSdWp5ZWNmN1JNSTRRNzlZREo1eFV2WkZTQ2tNSDlCL1dj?=
 =?utf-8?B?MURLbU5uTHpxN05saDRCSHJ1VjlTT0FnQ0ZLTWV2b3ZKTFZUbG14dVR4VlRZ?=
 =?utf-8?B?Rmc2eEp6QU4zSEV5ZGdUa0N1TDBvSnZzSVBNOGFJMjR4OFkrbkJPWnJFczRa?=
 =?utf-8?B?MnFLMWZiRU5yYm5mMjY4UE1wZis1N0crM1hlOUV5dkZHOHdBM2hMNFVNUlNE?=
 =?utf-8?B?clBtbTNBM3RlcXc2UFpCUHEyMml4U0lGTXZjWGlaVU0yQlROOHJ6VmdOWWJD?=
 =?utf-8?B?YzZuZHhhbGxNYkZNN2Fab0E4a2JjMTBlMGlGUVRqZjB4Z2dWT2g1MzYyUzVK?=
 =?utf-8?B?TmxiNjdwSWRwYzVIL1JoUXR3RzJ2dUVnUVF3cm9xSHN5cWovYUY3ZmRLRnlp?=
 =?utf-8?B?VDVCcGx0OG95a2swdDA2YkFmV2JHZnowTFZNdk0wU0d2ZzlrUjZhcnVwckJw?=
 =?utf-8?B?eHkvc09TeXlzTWh4cUgzSnJMSU41eVl5MkpIK253VDdPTCtKZzFCTUlPeWVm?=
 =?utf-8?B?VGRlTGpxODZaNUluMUNyOTJQYnhXR1I4dW5SdmxPWW1COXNJUzczTzJiVFZk?=
 =?utf-8?B?ZGt6a0JoWmFuZlFxL1IydUg3NDdHM3k1VUxhcUc4K3hZcVNFR0hZOThMd05T?=
 =?utf-8?B?K2RhbVUycjNwWXRINnVPU0hGOTJhS01YV0RaVGF3MEdEYk5GZk1WMUhrVTN5?=
 =?utf-8?B?SU5RUzNKblNieFluellmVm9pa0lUa0FHNFdPMjRmYW1SOUFsZ25Zc294SklI?=
 =?utf-8?B?aitkejZPb1N1RU83N3djNFNIN1U0NGN5UXJoL1pxNVpVMk5ST05hdHVyalpH?=
 =?utf-8?B?bkcxWERLK2hBY3AxZnVxWi91VlAvWjVXM0F3eHBlcTdVZlFvYWdCNVB6THUz?=
 =?utf-8?B?SXNnZHFaYUd5RGdNVWdkT3QrdWt4WGFkK3hTYzdqMElXcEZYZ21qVjlwSkdx?=
 =?utf-8?B?SUlubnZaUFJDODdQRFhHa0dOYit5ZFRGWjVKWWNnSWIyY3lzY0IwVmczMXRl?=
 =?utf-8?B?T0ttOEhUV1U5TDRKS0JnMWZ4ZVR0c1RvV3pVMVJZMjA1WEVPekxzOHQrRkhO?=
 =?utf-8?B?SXRlYWlmTzYzUzZZL1NiNWlXNWlvQmd5bGhHWG9tQ3B0OFJQTDlXcEhmTE15?=
 =?utf-8?B?SVAzSXVpMVRESXo5ZmtJb3ltd280YVlSbWlZbU0rSnVlQTkvMXlGa044MjBw?=
 =?utf-8?B?ejZWYlZKaUFJdUE0ZnU4ZnpHU0QrcnNrYitTNnMxOHZEOVI5T1g5RGwzbDFw?=
 =?utf-8?B?WEE0SWFWZ3RwdWZ2RzNUMkdLeTVpMmR4aDZGTHFKTnFuM0h4Q2lvQndRRDVW?=
 =?utf-8?B?SGl3eVAyQzNERHo4NURFYkVzN3hJd1RiWFA5eXo4MGs5bFF4YXo0SFVqR0pl?=
 =?utf-8?B?aWdSUHdJa01yTmFMVTNTRVZGcVJqaFAzRXJmQnBqZ3orYmRLcnIzcUUwOWky?=
 =?utf-8?B?VnpnZlJOaEFybDZDenNnSW0vWWxjQVlmY2JXQlRtQmtEZTg4N1VETVpBNHBy?=
 =?utf-8?B?Tjd3RkVxWTZpKzhneldmaDNKRW5HVVhHSFA2MkRRbW5YcUVoU2xMU3dzUCtw?=
 =?utf-8?B?RnBNa0hEZ3JweWNOaWpOMGpFQmhneHlMTXFEQ0djT0ZYV1ZicXJzV2g5SU4v?=
 =?utf-8?B?b21kZzVWMTZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmMrN0RmY281a3hjVjY3eG9iNk9kamVKUUp6aEQ2RnA3L0xrWE5FaVJsQytF?=
 =?utf-8?B?SHJ0RGZ0eGZmRXJPbDZvZHQwYWxObXMxMXRZeW0vUUZmdWxKMmNpdUtrNFNn?=
 =?utf-8?B?L1E1RUdPd3NINDR5aTByWFpVSkNyc1hteXB5Sis4alFzU1ZpZEcwWjg1cFR6?=
 =?utf-8?B?enp2R2k3azR6QzFPaU80ckJQTjVQaVFvUkxxWEtXT1VORk02Z1VnaUtXS01i?=
 =?utf-8?B?VCtSeDVyUWlQR1BRYnRRQzNzZXk2Rks0bFM3c2VWNFBXb3dqT2lzMXd4bm9z?=
 =?utf-8?B?STRkQmhtdzFyZFRiQWlhb1hXRWhmWW9JRkdzMG9ReGJzN1Q0bjB6aHlaL2ZW?=
 =?utf-8?B?d1V3KzBpY1VOSURlbi9aRmpwcFlkK3N6cFVMSEFEK2l3dmtiOTB0bkVsMXhV?=
 =?utf-8?B?TVlKVVBkdEtRMzB0eEZ1V0pyL2REZXRKOU1BL09DbUYwYnFQQTFKUTM4d1VM?=
 =?utf-8?B?YkFNNm9KdVdCUFNzMkQ3YndKdVRYRmFXRkk3c0FDSmt1cEdjYnUwRmMweEtL?=
 =?utf-8?B?N052MmdmK2hWRTkzc1BoT21Qbi9Oa21lYUY4dDRGYURPaXZFT05JSlVYL2N6?=
 =?utf-8?B?QlM1QnEySkZqbWNGQjZ2S0lKSVJ3RUxNeitZVE4zTGJLSDNSMHVhUVVGRlFP?=
 =?utf-8?B?WHJrUzIwSzFuK2tTb3BFM0dQWTk0RzdXZEl1ZUdYZEF3cGJML25zSUthU1RF?=
 =?utf-8?B?b0xVYW5meWNwTUJSTUNVSGFWOEdqQ0c5SlN3cnNjMVBCalZ0a3lMZjlFUkd5?=
 =?utf-8?B?SHJwV085dmxsVS8xOVBHWm5CZkRLdHd5VkFvSWNqV3YrdzA3QWJCbXo3TXRh?=
 =?utf-8?B?REtmZDJKZXI0bjIyeDBBQml6NW92bUdWYTN1dmw1NE5mYm1FNmNPdWpRdlk2?=
 =?utf-8?B?emd4SjFUejQ2b2NPQXdmeElHOTdpcHVsUmRJQzRQdXMvRXkxZ0ExOXhCbzNX?=
 =?utf-8?B?b0grb1owNk9QTk9xQTJWb1BKTmNydWV2dUNMSWltdW9pbGxTblRHUHRKWk8v?=
 =?utf-8?B?eXBMbHdiL3RVZ0FJTUxOcWtETkp2UjFNbU1IVndKak9ESU9kNnRWNE80YnR1?=
 =?utf-8?B?OG1wTXBGNG85b012VmtLbWlXbXY2c1lFckFLekk3a251L21Fcm1rbEtTKzZV?=
 =?utf-8?B?eFB4MTBHMDNIZDArSVZpd2dJa0ROSDcxcXlwNnZpZjlBMVdjbmlERXkvVThp?=
 =?utf-8?B?emxYMjhZMUp6M3lJcjdpWVozUGc0VW82dXNGd1krYUU4Vm1yTFQrNWJGOElF?=
 =?utf-8?B?THlZZTNkSHphWXc3aWdKbWlEcmpqZWkzRGxNbUxaL2NVbkcyNWpFT0dzeTU5?=
 =?utf-8?B?dHNHbUo4LzBoblVYZklCekQyVFM2SW5HMWdoelFEWm5xbTAyR0JmQ0Nucm1y?=
 =?utf-8?B?Y2RCWTlZbXVEa2ZtZkVYSHlCSlRtcFNRd3MvdXdoNTY1WG95bGlYSmpjb2Fk?=
 =?utf-8?B?U3lFNUN3enU5cldHcDJjRk1uNWhpcnNPZURXS2V3M0tlbVdQaEl1cFlhN3hP?=
 =?utf-8?B?Z0h6bUtwdSs3bHVjV1g3SU1JTUsxM1VlUzJkK2dhUTFPMmRMR2M5RDdRNS9I?=
 =?utf-8?B?WDRoSHdZSW1RUXpoNHlWTTlRbDR4eWFHc25rZEs1TUVSbEdXL2xoM1p6YlNV?=
 =?utf-8?B?WUhhMzhsT0tRZzlIanlxZFN6dmphbzd1SURIQ2haeHg0VE9SUzF0TEtpRlda?=
 =?utf-8?B?TTZJZXlmWmh5bStXcThIeURjRUxBZytXNjBxeVNUQ2RmMVRRUFd5a3FzQ3h5?=
 =?utf-8?B?ZEVPYU02Yit5aFRqZlN5S2oyT3BQak1vYzVxamNXWVcveWpEelY2Y3pLeVNz?=
 =?utf-8?B?MllSM2V2T0ZINkVxeDhZRHpMLzBvQlZVZnAzOUgrOUx0TWRWakdQMnFyMWJU?=
 =?utf-8?B?dytLdGw1ZDdTeGc5bjdWQzJTSXlCelpUallnQllZeGp0a21MREM0c1pudnJ4?=
 =?utf-8?B?ME05dnhmZHdRSXk1UmFleGg2S2FhK0I0Uk9YWlBxYWZnSzBCK0NYZHozOTA5?=
 =?utf-8?B?alluMzVLeFJ0enBsdGpKRWxVNUEzbmZLYlNJVlMxM1FlSU9xSE5ObWhWRld0?=
 =?utf-8?B?K0EwVWVETC9jSFc5OVY3TTc2L20vNVNoT0psSy9VWDhEYUNRNDVTTXVJbE94?=
 =?utf-8?Q?6SH8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f46db55-4d2b-46c2-10e1-08ddb7de004d
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 13:57:07.5882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpDlzNNbMpChEcpjI6jeoKoiJBLUotdmrqSsuJ/CiVE+njM6F1xGCAJdcj3Q5SBF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF4C9628624

Hi Reinette,

On 6/24/2025 11:18 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> Reading the monitoring data requires RMID, CLOSID, and event ID, among
>> other parameters. These are passed individually, resulting in architecture
> 
> It is not clear how "event ID" and "other parameters" are relevant to this
> change since (in this context) it is only RMID and CLOSID that can be
> found in rdtgroup.
> 
>> specific function calls.
> 
> Could you please elaborate what you meant with: "These are passed individually,
> resulting in architecture specific function calls."?

Rephrased the whole changelog.

"fs/resctrl: Pass the full rdtgroup structure instead of individual RMID
and CLOSID

The functions resctrl_arch_reset_rmid() and resctrl_arch_rmid_read()
require several parameters, including RMID and CLOSID. Currently, RMID and
CLOSID are passed individually, even though they are available within the
rdtgroup structure.

Refactor the code to pass a pointer to struct rdtgroup instead of
individual members in preparation for this requirement.

Additionally, when "mbm_event" counter assignment mode is enabled, a
counter ID is required to read the event. The counter ID is obtained
through mbm_cntr_get(), which expects a struct rdtgroup pointer."


Thanks
Babu

