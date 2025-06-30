Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306984A0F;
	Mon, 30 Jun 2025 22:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751323676; cv=fail; b=Od6pb1jxUq0e4ZPdVSpDmiv9kGar9X/BLACT7LzEClcliTHupvX4Eg6qudiUMFq241nYqX70zyoMsK5evGVcvsDKp17WOizhS0J6DfagE6eebWzs4Qw8gTE5c9OuK6/0AF0jTi+7CMYOZwLOdI8CByb8UfWTKUzot4YPAVou1Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751323676; c=relaxed/simple;
	bh=pwdB2Iet0INYX9PVo7UDvLZeBAS+cLAjXRZ63aKM9tk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I62J41coSdn3URPqm2snPL4LIkOTjhCpfmFBm656Fe8HvEDKwEF++YA9DLN/mwXsxRSoBYkzXr0goQRl6d8sMYGWk3XDUQL/UnaoeOQAnybd9xl9e8NNbRt5rVLXZXpeB8C15NmHIGFP+SXhFsgdfKrJGlz3W0tle6dF3bWWaGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=y0uZXycF; arc=fail smtp.client-ip=40.107.237.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="y0uZXycF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMerZ1lWF/ncP68qIWceGAfT9Fy9f2Zuhu2tc5kDyWAPGaXLECjc6JR+oB1pr/QHijNn1O8b+1D7f5F9ePN5NIJ6J7AJv59jiZ7/qpHAMW/9pZiti2EuzahOrjp+pTlwtxg8QHCCVwE0V33FxJTp2Rz8LRuAcfbrldV7TY7g6gyDw/itDJcHRkQgEV4epIW0cIhU2LcMCYSZwHWuZ0winBI95mMGLiF+gQ+uPN9gNHGyhLo3E1sZab3PqY12ygxZYidz0ugQroGi3AatGSO53fS6PNUgzLYoFpOsD/aSQwdzI4jWnmeOvnon7hLPMHk0WneXy7xNNJPcJoB98tuYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoa4tFTii+SV0aryJ5zYRvHzCzlU9bYFAeKO8XcfMkk=;
 b=mBH+rMJ+F/HOrBkkvQS3XG9hQ7QsnrYgfoNNGdg60PO/hTPcAYazvzqwZHyhtURcs1Vt7UVTB2WfAZf5Hapqw/0x7eKdCtMbGO2VtsSxMOuMd2lW2KuoSqVibDqmYdT0V/b2bQYJ8SkYuICM+I4mKBmRquFc9cJWH5opTnIrsN3q0X8Y6biZPZD95PEYXY7kUvsfrgyX3LYkH/xGPsFApT+8OcLd3sIANx9QmD6um1u393B952AeAkXF6oyqxY7q+Kuqvz6ncHpc01P41shZnVBLo+cAi5VDvw2C5DDuioHumFDkTXgV4NMl9ypLdggj2G8fEVjxT1yNMVpAqgbwyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoa4tFTii+SV0aryJ5zYRvHzCzlU9bYFAeKO8XcfMkk=;
 b=y0uZXycFeDpHu1b24vS8dm5DBxcwSU/GwzmEdUsVxNXyqXAU6Mfrei44aPlxAcH7YhYAUrUiCFy+jVC8HVwzcoZ4KMqr8+0REJKBYQm8MFgH5StLeIP3iO3pVbcpEBkcjKWjztGUhUjE52fy8K8gcZGbxSERbgwlp3IgX+dNm3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SA1PR12MB8844.namprd12.prod.outlook.com (2603:10b6:806:378::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Mon, 30 Jun
 2025 22:47:51 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 22:47:50 +0000
Message-ID: <533cab02-10be-4f31-bde7-874063f124b7@amd.com>
Date: Mon, 30 Jun 2025 17:47:45 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 21/32] fs/resctrl: Pass entire struct rdtgroup rather
 than passing individual members
To: Reinette Chatre <reinette.chatre@intel.com>, babu.moger@amd.com,
 "corbet@lwn.net" <corbet@lwn.net>, "tony.luck@intel.com"
 <tony.luck@intel.com>, "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
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
 <ac378dff-3eb1-498c-8b01-b7c5146c96bd@amd.com>
 <f8e15067-401c-4644-89a3-fd00cd59d58d@intel.com>
 <f80f254c-af8b-4d7a-96cc-e8aa569b6d45@amd.com>
 <9def123d-d92c-4e79-a5fb-f8761b15200c@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <9def123d-d92c-4e79-a5fb-f8761b15200c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:806:27::9) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SA1PR12MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d043c25-a779-4bce-107f-08ddb8282460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0NjWm5lcy9qS2RMbjBIY0RuQU40cUdMWUZ5OW9yR2lLMENhak9RQkp6S0JD?=
 =?utf-8?B?cTd0VElsNjZESDVNTXFZWThLa0pEdkRNUCtWY3dOMDRPUVhQQm5lT1pSY2ZH?=
 =?utf-8?B?TUxLMCtlRTlxVDZTd1lUdXJzREFrYWxUZEIvUzRsa3BVVVEvS211R3QvT1lW?=
 =?utf-8?B?RW9hUDdKZ2lXdGE1T0xQRU9ZaHNtaVF0ZFl2Nk81a1JCaHB1Y0hPcjNKQnFv?=
 =?utf-8?B?cE9JdzhxVG91blNyTFg4NzR1a0dkRXhYT3NrbllXNVRpeTh1by84Y3Ird2lS?=
 =?utf-8?B?OGVNcVRiYW9rMzdRdFEwamZlbUlpRStvZFM0TFNXVWdDZThjcGJDZk9LUUQ3?=
 =?utf-8?B?Z2FpbHVFcHovcWl1WGtIWWtTMWRuWmwyb3ljL0ZnclZXQ2lpbkFrcHBZelly?=
 =?utf-8?B?cmduek9OQ1k4bzlwWUNJbnZKdDltU0hNb09YNWF6QkZtcThqQmc2OGZGOVRy?=
 =?utf-8?B?VHh2ckpxbkNsL0I4TU1nYThpRTN6dE41enkxSkpvRklXejVYajVCS2R1TE9R?=
 =?utf-8?B?TzJNeVI5c0U4Zlg1YUZxN213WUdTZ1VjWVVIMmhqeTFaeXVTSVNkTHZPT2gv?=
 =?utf-8?B?NlNsQndHeHQrTC9mdEFYdVladlpJVGFzVS83U255NUthSnY3NzZteGg0Z0dE?=
 =?utf-8?B?R3R5OVdYdDRlcEQwTDdDSGJkaWYzMTRUaEVqQ3lwak5BMXNMMUMreit5SHpM?=
 =?utf-8?B?NjNROC9hdlFzQWQxbitPZnlvcGtxYVQ0aU5iZStscDFxMDdvTFhpTGppZldL?=
 =?utf-8?B?eWk2YTBEQkhwOGFwc0hhcGxxNWZtalIzNzVoRzRTM2lrYUZna3gvSUFQSnZO?=
 =?utf-8?B?WThjeWZaNE9TRkVyT21VY2NKNkNPdGg0NU5DSG1VUmJNT1pzdWU2SjYyZVMx?=
 =?utf-8?B?RmYzTFU5VUpqYzNaVlVUakxiYkdtV0NxcmxXbHI4QUZzOU5aeGJRaTFyS1Rh?=
 =?utf-8?B?VjhrZHNNeWM3cDE1KzYzSWJQSXdsa0ZWRFlBSmtQelM1OSs3KzNtOXpuTzF6?=
 =?utf-8?B?eXdCczBYOEtwZU9uUjRLdW0zUFVzbTR2VmhuelRwSFVjeFZrenpmRWVsYWVy?=
 =?utf-8?B?VjB5eWFteDJPSXpKR0tQY2tESDBwMjJ5VFBiUW5ncTYwcElkQmNlUitBWlFv?=
 =?utf-8?B?QnpaU21za2tyVmFkbGM3RW9icG9Id1FDRmZkMGFzZnRFV1hVa2MyQUtVU3I5?=
 =?utf-8?B?ZFd0Q3VTM0RqZU0zcDY3SThxWHdLb1ovY1ZRUUtuazZZVm9VVk94Tng0TXl6?=
 =?utf-8?B?d0s2UjBwN0d2UHJDYTljeGJ3RkQ0NjRBUjNXM0hlMjhaQUNMYUdjQjlReXJo?=
 =?utf-8?B?eHg3MVF3ekNwOWc3WnFDL3ZZQWhKb2R0NVJmK2taaHhqZk9mWGFneFlMZG1B?=
 =?utf-8?B?SmVBd29RWVE3d2FoUkVLZVgyWWtGMllIZlNQbTZsbVpPd2hFL1Jjc1htakhG?=
 =?utf-8?B?VG5YeXY1Skx2QksyekgxTWsyTWVXcyt5SU02b01TRktwRC9HcUJDUXorNDZX?=
 =?utf-8?B?elRLWlh6OFRHVzhiTWdHTzNkRDNkRkRQdG91aUJIYzhvejdvU09nSG1PTUZ1?=
 =?utf-8?B?TDRKQVNQVk5saFlKVFJoZTNlUlJvKzFXWTdneWk4Wm9MODl5Ymg0MFJWUXpD?=
 =?utf-8?B?Nm9jWjBWVkVPaWE1T3Y1YXcyNGVHWlVlV0RtaDNUMXNET1N4bzRTZ0FXRDlG?=
 =?utf-8?B?SzZZcXI0K29TTzB1VWw3dnB1MDZ3NzNyRWZQQklsb2dYa3JFUHdVSEtSQ3l2?=
 =?utf-8?B?b3d2OGZqUVRlNER4WEQ0QktOajAvQTZKRWtaVWloRjMrV09aOUZvTkxETWEv?=
 =?utf-8?B?QmNpU0tCcDFMUmlJeWg3Z0l3bStYRkVETDZvbXlTYWxWOFNJY1AzcmFSQU1u?=
 =?utf-8?B?WE44N3BlZlN6dmw0Yi9sa2FDRXBsM0VKTWtySlIwbjJxNFBWMkQ3U3VhZVU4?=
 =?utf-8?B?M3gvQkJGbkg3UmlCTWtRWTB0blJRUWo2aUlaVGhxeVNUTHdXcnd4cE5qZmQw?=
 =?utf-8?B?eWdnSUdjaml3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWRUcURkREpTYTNTODhuYldCWWVZZk5wNFV5TVFqQmI5bGJnSEdGdWhNd1lh?=
 =?utf-8?B?dTVRNDVTUDJvWFh4VERYSEtHR3JRNXkvbWRDYkFqWWlRM2hPTitjSUZhU21n?=
 =?utf-8?B?RkZOS1NabGJCcVFQTDVXK2tnNFR1aHRJenhkUk1yVTBmRU5CWE5jbWcrWHFX?=
 =?utf-8?B?bkpsbFRkV3NLSGltMDViaDM2S1hrV2RhSzkrVXBCWnpBMzR1YVg5VFRzZkcw?=
 =?utf-8?B?UzQ1dzVwYkRVVGROdTZLMUtmYzErSnpEZHduek1iSGd2UTJMR1lBQzVJMUpN?=
 =?utf-8?B?N3ZpZVhpV1RSTzE3SGpDaWIyTDhYTkRSMGpZNG4xczRKU1ZxL2VjNVMzZWJ5?=
 =?utf-8?B?SXllc3VZT0tZSGk4SkE3RzAwTlZsejhlaUQyY0FNdW9FSWoySUpIY2pVM0c3?=
 =?utf-8?B?RXhWaTU4aW94VnRSZG9XQjd1NFR3RUhHaVdjY3dhTUp6dkcxcTdSTmtCUTZp?=
 =?utf-8?B?Ty9leHhRN05GNnRDZ2dpRVhKK0N4MmxsTzM0SmhiNU9pWGVUdFNreUZ1SkJU?=
 =?utf-8?B?cC96a1dmenc3TTQ2Q3hkV0JaSFBzNTY0MUNPazFtclg0ak5aZGhpRHhLaVVB?=
 =?utf-8?B?UEUxMkxOWTBuNkJxdlZzNTIxZzRGTm40RzJ5RTJ6MVo3NDVJL2QvRlZEdEcr?=
 =?utf-8?B?Sk4xSnNINkVkRDc1NitLM012cG8vUk4yUTh4aFlMak95Y0RpOWpueW9pM0Ey?=
 =?utf-8?B?REJkUG4rakE0MDRpd1VmYzhHSk9nT3BtNytSbTFNUEdzL2RrUHArUzEvdmZL?=
 =?utf-8?B?Sk9IYkhyaWthRUE4MHFaMVhVNG1wUlVyZ0lRY25QNHVGSXNFWTY4ZWx4Njkz?=
 =?utf-8?B?dFFBZmlFcmFEa3RqNFVwT3Fta09VSmo1bkk5cTA2OTJlUHhyM0szM0pJZ20z?=
 =?utf-8?B?NDYwb3dzSUNhV1RPMnRlTW8rVzVMRGUydzUwaWVkMDlkNkY5SkFFekVPL0U3?=
 =?utf-8?B?RnVDc0RpamF1UlJEeDEwalMyaUVWNGN3L3FJNnBFclhITUxvQUVrTjZsOHdM?=
 =?utf-8?B?c2M0UFlXbGlOT21ucmFnblg0YXZVczNKVVRWeFV3WGdoRHF6VjVyRUN6UU45?=
 =?utf-8?B?eCs3WFRxUkkwQ3hnK3FMUlJXVlV0UEVWSGVUcG9CRHFXQWJiMm9FeHBHbTdG?=
 =?utf-8?B?QUlDOHB6cjZ2UUgxclhONlU5dUxBWGhtVnU3bGRjeTJtN3pUVVR2UlIranJ3?=
 =?utf-8?B?UGFEQm1SMDJLQmNoa3R0OU9vT3A2MXJsVjU5S0djUmRrR1c0YzBMZEljUll2?=
 =?utf-8?B?WHNaaUdmV0dyRm9SeVhhQUNLblpwb0g5Y0NTVUUzYjBvRVZyL3JqNkVXYUJE?=
 =?utf-8?B?azY0cm9WdGs0RGNCVTJ4YktoSDNpMzg0NUJlQXFqMFMyT0tzOC9UUlM5ZS9I?=
 =?utf-8?B?b1UrUjlsZC9Kb1pkMGd5ZmlWdmJRTjdFbVJDdTdXOTZQdytmc05wTlljMjFO?=
 =?utf-8?B?RW8zL3pROXZkWDUwZTFvbTl0SjBiV3o5bnNnbSs0YTJnT082UTgwbS81NGk5?=
 =?utf-8?B?K3lsMTI4WmZZdk81b3lEVk83cTVtZmdhQTk1ZnBBSmdzMCsvVVJOc3FiSWFz?=
 =?utf-8?B?bFhxbDdWdjdmVjFjYnF1VWtPQ0JyZVo0T0Y3R0I4YllmNjQ1WEJYRHM3RkZS?=
 =?utf-8?B?MDBzYWVFS3dLbnB3K3BpckE0YTl6VTMxa1Ezc3g4TlFuMjdSYVpZSW9XQTk3?=
 =?utf-8?B?UjlBUFpUZzZVMkpvcGxjdnkwMUVHYytaZENXejl4VHgvQ2FNa1Y5a3l6aitF?=
 =?utf-8?B?VThCenRkejZwdkdzQjlnRWRpZTk0Nlptc3RwekpRUWRHUm5WdnVRbHhsNVRC?=
 =?utf-8?B?YW9IMEJQSjdCSVVtQUNHSCt4WlVjZ0c2bGN6bHp6Q2d4ejFvU2hIdkk1NkhF?=
 =?utf-8?B?ZW9aWE1zMDUyb1F2SjFsWXRoMTZET2diRWNpVit4djRjTXZocU1peFlDNkor?=
 =?utf-8?B?K3V2QlF6QUpiampCOE9lRkNCeE1nWGlHUWYzVHpJVkFLMHNocVJ4TUtrTHVQ?=
 =?utf-8?B?aGdnY1B0Q2NuTktscFVKdFlxL2FsRldwdmx5dVlPazNGdkRjZ0hJaGxmZ0t1?=
 =?utf-8?B?c09pUjJtSkFFOVpwVThmcHBtaHBIMm1GVHNFUkIyQVRxVU81VEphM2x4SXZ1?=
 =?utf-8?Q?QcDk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d043c25-a779-4bce-107f-08ddb8282460
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 22:47:50.7674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1ghKbI2N6WF+ChKHX77TsMMS9c3xBt2FpwFUHUh/hjoNSSq5sjy/OVbEoWoRhQJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8844

Hi Reinette,

On 6/30/2025 4:59 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/30/25 1:58 PM, Moger, Babu wrote:
>>
>> How does this look?
>>
>> "fs/resctrl: Pass struct rdtgroup instead of individual members
>>
>> Reading monitoring data for a resctrl group requires both the RMID and
>> CLOSID. These parameters are passed to functions like __mon_event_count(),
>> mbm_bw_count(), mbm_update_one_event(), and mbm_update(), where they are
>> ultimately used to retrieve event data.
>>
>> When "mbm_event" counter assignment mode is enabled, a counter ID is
>> required to read the event. The counter ID is obtained through
>> mbm_cntr_get(), which expects a struct rdtgroup pointer.
>>
>> Passing the pointer to the full rdtgroup structure simplifies access to
>> these parameters. Refactor the code to pass a pointer to struct rdtgroup
>> instead of individual members in preparation for this requirement."
> 
> This looks good. I made a few adjustments that result in below. What do you think?

Looks good. Thanks

> 
>    Reading monitoring data for a monitoring group requires both the RMID and
>    CLOSID. The RMID and CLOSID are members of struct rdtgroup but passed
>    separately to several functions involved in retrieving event data.
> 
>    When "mbm_event" counter assignment mode is enabled, a counter ID is
>    required to read event data. The counter ID is obtained through
>    mbm_cntr_get(), which expects a struct rdtgroup pointer.
> 
>    Provide a pointer to the struct rdtgroup as parameter to functions
>    involved in retrieving event data to simplify access to RMID, CLOSID,
>    and counter ID.
>   
> Reinette
> 
> 

-Babu

