Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E7E3596A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825153; cv=fail; b=FE/gnOKySTMXzAnAJb08jr+OCN504usBJJLp8run36r/g9VJLHS93K2WGPtdAs90E5g2KzpWK2tua1Ex8G304qlF7qZ5X5XUbXdIoumdCNEDajy/6e0LUxqIHpfcNeQS8cKrUORF5lQ0pZuLUni10uCTl5Gtd2gNFp2Cj4ps/QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825153; c=relaxed/simple;
	bh=XYsf87QEmXGNcmEYtuPW3YsAAkDrp7bulJPlgaGJ6co=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nJe60q8VRca1ppYPLJY8IfCR0dBt0CiUwqWamO3n1UTcv4yLdAdGGUG1mtsMo32zPRO9OrDLFRUFMwqxQNgsO7DBbFTRNREvlh/PRiwxhGScZo22pUDAf54KTNkPWuo7D754UUImRaukkPvlSU04vORZrSR/QNqIm4gUtFnCKxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CyRH2Z4M; arc=fail smtp.client-ip=40.107.220.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CyRH2Z4M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HoL8bEWq1nXQl4CVHRTem/kI4j5Q6Gp6Z5r2KbVnFROcNGAg6QYSzPusEVOO9h7rUnT+5dYsh1q54Wlli/l3QN4hLpW0iZJQUZTdogiU7a8Oi2wpFpMFxY/AAtWOUJYT4fxR0WABMsPtAol7npoJ56RrAxO9qImm/JOEeG+HwNdkIabl3IZEx4K0k5kmdMCYeg50saZg/YZi850ezKCe7MI1ORNQQNM5JTVUry5ub8H0fqVUZn54HEUylVmc+Gw88dG7OcUxwcOZsAPkqDLoFnoLyOF2YeiKQ0vnds7DTcxrIy/oLGedmt3aRyU/VnGkk89cD4+iom7BRUr4sy0p2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKjwvbCNiSdLRkRCyeFzCiVD/lIh4XyKdm+hSxvkxyE=;
 b=qgGWPK+TKgeiSuIRVytQIJo+ojj5V9KJdzDapjp8rwye0FLESufJqGW1ek7d7QaWTwx7ZM3PFN5CuBo5pSaq1FJPdIX/Pexot/5ugCjB0T6b6iVeDQpIP9aoQtBNeZ/lTsH8l1obhM47Lo4OHO54ZC5DDAQK1SqG3BjXmMLHE0FF9P6PW8DJJMDrjtpTvIW11Og0Hf9Fo2RrHPen7+nLpy3XGA58d2ZFnq3JYXT38eflATJhTMpbKqKaz2YICyynYHnWfzsgrW85SSbOgKCZ+TUyIzqL/PfYjUF2hWeaiaj7X3uVvXM25unZcN3+DeoqwgZSVmbOGzXJrXQ8G4SzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKjwvbCNiSdLRkRCyeFzCiVD/lIh4XyKdm+hSxvkxyE=;
 b=CyRH2Z4MUtTMfqXxtPH9sbXKfczoo+qilvto9xZWPfxKwPk93huUNqr5F2PB4SPFu127F1XiX+K0JGB3Ja0z+06LVUpFdWuHGNJXA0BXTLZ+3eoBd0IzSpmVCeDBPJY5ZY93WyHGV+QZ83XU5bYvyF5pQJEdafkBWcGPATHZxws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by PH7PR12MB8054.namprd12.prod.outlook.com (2603:10b6:510:27f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 25 Jun
 2025 04:19:09 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Wed, 25 Jun 2025
 04:19:09 +0000
Message-ID: <dcb83693-d57e-40d8-baeb-fb49b61d7750@amd.com>
Date: Wed, 25 Jun 2025 09:49:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 00/20] Cache aware scheduling
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>,
 Abel Wu <wuyun.abel@bytedance.com>,
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
 Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
 linux-kernel@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Gautham R . Shenoy" <gautham.shenoy@amd.com>, Ingo Molnar <mingo@redhat.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <4cde5b36-4ef3-4dc8-a540-99287d621c7f@amd.com>
 <1dd0ea0b-4515-4507-9b50-75de87fee377@intel.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <1dd0ea0b-4515-4507-9b50-75de87fee377@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0225.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::20) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|PH7PR12MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: 36946192-d0dc-41fc-f953-08ddb39f6e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1dtakUvNkJLT0JpbjNjUFNNWUtxUlphbFcrcnNKSTVPODFsWkl5RVJaT1FL?=
 =?utf-8?B?SmtTN3hVZEJkZ0FjamFGcVJueDFNaUdpZlNydiszQjJzQ2F6OHI2eXVpNnNv?=
 =?utf-8?B?bXFyNGRFaUFHVHhoWWRRK21KN2s4OTh6Qm9OVkc3a2J2TEVlMk1EUWU0Q0lx?=
 =?utf-8?B?TWVpNmdQZUkvamh5cjhqTWk4YWQxcFpGUUxuM2FvV2VWdjd2d05NRWd3UEt0?=
 =?utf-8?B?bTFGUGZ4cGt5VXI4R2FDUUJtMUYvOURNMkpUZ1dNVElLc201bHFidGhYZ2Zo?=
 =?utf-8?B?QU85NWhtNVhmc24vUkQvUVZ3TloyVDhkZHpaaitWV0MwMHQ2L1ZvQTJqaXFm?=
 =?utf-8?B?ZngyWGNNNWNna0NQd0MyTytNbk5BU0dVanl0cVNMOUJOL2VPN0kxRnExWHdP?=
 =?utf-8?B?ZTlOWHRFSVFuL0g5WGlhV2c4MkdwQXZSOERBVUNqRmk0TmlTSWtCSVE5YlJE?=
 =?utf-8?B?ZFlwOVYyRDhMUmFDbXVkdnRCY1dncDVUajBXWm1qOGQ1dUZFRnNYb0MzMWUz?=
 =?utf-8?B?T3lrQTdTS05ZQld0MVpZYXNXQ2hvQytjejlZemZzemhGejVQQmZITkVIV294?=
 =?utf-8?B?dE1sUjlRQXA3WlZoa3NqRElzSGY0VUxoai9sRzlqNmFZL2tmSVpXczJTNTFl?=
 =?utf-8?B?cmxPaUFPYVBKUmFqQ2tjZGU5aW9aaWZiVGN0cDdTek9XcFhtVklPdTVvNUxO?=
 =?utf-8?B?eUllV3l2aFUzczNXb2U3YWtNdlIzUTF6ajJoTkFHV1hSaXBoL0VOc2JqRGNR?=
 =?utf-8?B?MUplUlMzNmc4b1JSVUhMTkNudjdmR0VzSzR3cjEydFdjVGNHVDBmdkxOMjFP?=
 =?utf-8?B?N3JuRDBRemd3VHhMSFRON1NrbHhNRVBGV295c09hS3kxZndVdEtRdENzbjg5?=
 =?utf-8?B?Q1o1RGNWbHVXY0JmbjJUVElabkNyS2ExcmRvYzROdEN6SjN6YVdieEE1bmNP?=
 =?utf-8?B?eVBNUEhnbG1vU01XQmRCUjFSNWdkSUF5bC9WTk0wQ29WdzVkZ003S3plVFFs?=
 =?utf-8?B?dHlrY0pQalF6RWE3WEF1WnBOUTVWbFZKbnR5TXpUN1FaT0hTYUVOcndJNjhq?=
 =?utf-8?B?T0FtR0ZKUHpZTHd5RWV5SUpWS3A3L2V6OE12Q1M2VllDMzluT0Yxem5MMXo4?=
 =?utf-8?B?NzBzSnZtdXVXdWpOeWlwN2xKSzNsN1BwTHI5YmJrUDRyc1dUcUFTS1JTeFFG?=
 =?utf-8?B?N3A3dHJJM2EyVlhqYXNWbk5UK0RVWFVuSU1LbzVsbUhKQnhxU1ZVMjZ3Rm9J?=
 =?utf-8?B?T0FKSEJ4Wk5xK3BtZHJXM0EyVHA2VXBDbEFtaXNKelZpMUFFaTVnQmRxWFVQ?=
 =?utf-8?B?OFUyYjZ4YUh2TjhBSy96a0Y0OGV4bXNLZ2hKdVpGekxRR0J5THNaeldoeVp6?=
 =?utf-8?B?aXVXVDlLdHkwZzhtcTNWUDZOVStKY0drTXQrOVRSeEMvWUhmWWV0ZUxXQlJl?=
 =?utf-8?B?SzdUeXlaNmt0Ukw1VHdyRWowOE1vSlNEYk1WRXpPZ1piWUFWK1RzdXFlajNS?=
 =?utf-8?B?L3JCZldWSE1aeXRZbENNUmQwOFd2OWdXTEwzeTRnaytVUzkzTU4rSGlScExI?=
 =?utf-8?B?V2M5UDhCeit3ZThhK3VIOVRjTjl0S2VCRTlicVUza0R3QjVvMWxHeWtTeXlj?=
 =?utf-8?B?RFErc2pVNVhoMkYzbjBFQjhNVm1EZ21sb2lNWDAzckcvZjZqVEU2VVJBK3V2?=
 =?utf-8?B?Mjk1QkdVSG85MmxCeDBlTWRFSEZ6b0JOeExkYkpNcUE2MlRCaG9rUS9CcTVw?=
 =?utf-8?B?R05vUFAwWDVSUkwwZDRkKzRNUHNDb1BEa2ZuRDV3OWJyd2FPcTJqZGFXQnU0?=
 =?utf-8?B?dTlFZ1RqbmhZM0hnc21seXFjdlhQOVZXaHd6YW4wUHBWNng4a2hhR3BTc1BZ?=
 =?utf-8?B?MWxmVUg0alo4L3ZrL1Z3YkNPUlJaRC81UDBySjh1SU5kbjF3RFkyZmFRcVRY?=
 =?utf-8?Q?reMZKWdgQts=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWRTY3pPekxVMXB6ZGVkMzhHU1V2Vlg0K09WUmZBVTNJYmlpOTQyRVQyWXdN?=
 =?utf-8?B?MHlsQlNteTBucVBZNWhOcTJGdXNiMXhaRzRwQ0Z5aFpiaVBKcWZNalNHdTRJ?=
 =?utf-8?B?NjhOa2RzZWpseWRFcGhKOVBucVBRUHh5L0FuVVpiL2JMVUdnSHYrNzBRNitG?=
 =?utf-8?B?TlZEQVp1K1JXMHNCN0N1TlFIL3h6UXdjN3pVeFFpVG0vanZQTzBhSWlDSmN6?=
 =?utf-8?B?RitRSy93NmowUlliUUZVN1pTTXBwR0gyRW5CUTFWQ0l0QWdlclY4QkJQRk55?=
 =?utf-8?B?SGNrME5jMXROcjNtdC82VzNUL3ZjQ0N2bngrRXpVUDV5Z0xwWVBSK3VWMG1v?=
 =?utf-8?B?ZWhhYXdkMzlCQ05NeUtNbmdYb3BBT2gyRERxbk5YL3BIR0VWaHArblJEV2o4?=
 =?utf-8?B?b2x1NzVtL1pvTklrOW4wMGliWkhDQ1IycTkxNlBFckdRMURSanJPWC9aUHB3?=
 =?utf-8?B?T2JOeU9uSzdpQ0lCbDJDazRwUUZHK2dKbWJxS29hSno5RVhQS0x4UmNVS1VZ?=
 =?utf-8?B?czh5T2RoNENlVDZUWG93dkR2OEZJZzFDMU83WUYwVnRBZy9TUHFmd0VFS2FK?=
 =?utf-8?B?bi8rTkxSR2ZSWGVoVVNoWnQrWDNVVm5SQ1NGbUFHclM4aHZzRy9mdHRTejlh?=
 =?utf-8?B?RkxzaWVVUzJiM2dVZXgrWXR6VGJMN2NFSFlkRnB2SkRYRUY3WEx0TnFPSWs2?=
 =?utf-8?B?MkR4WnIxODNtb3FTOW9xVlVndnUvam1Wenk1VFdaSXpGcHlzKzdlOEdRUGt0?=
 =?utf-8?B?VkdoR3lPRHJ3ZnNXQks5a0VTSVJMVnN5aDFISkkxZnJMS24wV3hLVzdBNVgz?=
 =?utf-8?B?Y0pHV2EwUlBSZ2pWREYxWlM5Y3hIcElBSjVsRnRubmI5R1R5ajNFL3BHbTh4?=
 =?utf-8?B?NVFvSGpnK2lBTlhDZHhwcGZYWThZb0xQaUREa0xZVTUzUUxTWXdzemFONHlG?=
 =?utf-8?B?dHdMR3Zpa1V1QW5rWWkzNkdrQnNXWDZvSG5XRUgwT1NMT2NMblNDWHhDUmFr?=
 =?utf-8?B?YVllaHdpR25wajEzNHFtbjdBcEw2ck9zcGpFUm1rc2k0eGdDcDZMbUlGSkhX?=
 =?utf-8?B?ckNOY1hUUTIzM0dpcnEzK1BIT1NETEdLOFR2WFJLb0ZoZXBjK3ZKSlpjTFVq?=
 =?utf-8?B?MGNibFNKc3NlSE92NGIrdDNiR3h3Um1JMzFCR1puZm02aTg1Q0hGUmRuaDNU?=
 =?utf-8?B?MUhqQkF1NjVRYzBicWpkU2xpTkpITlNQaDNpYnRCZ1QzbEgvQk9RcU5UbkxB?=
 =?utf-8?B?NVJIYUpXaTlDL0tiRDl2U0pveVQ2S01xZXdTYWJWQjFVWjY1UnI0aTBpbEZJ?=
 =?utf-8?B?Q3JYSFRPbDB2NDZvUzF1cG8rcWZIckJ0MmF1RFI5Q3htVWF6ZkpVNVdRclpH?=
 =?utf-8?B?aEdFLzcyNTFydFhMWnpzVkVFckxTYVZ0eEZsZEdOcUZseFV6dzJoakhicnAz?=
 =?utf-8?B?VWpQMXZNc05MQzYzNXJLelU1d0Y4VEhIM3ZaV1YyNS8ycUI3YTBLMlNUbDgx?=
 =?utf-8?B?WnV0ZnpTamtPcjhKNmk0REsyVEtXSDI3MzUzVnU3RFljNlFqdURGOEh4YmZF?=
 =?utf-8?B?QUNnNmxNYTdQQW92RVFkSE05QkpBdWdkK0RrK1FLSW9nWDYrTWtFVDdZVDU5?=
 =?utf-8?B?azBCRnNNb2V6RCt3WWtrak0rRGdmeUs2ZzgvRmtJRkI1VXdxalpMempOZEhQ?=
 =?utf-8?B?dkxpR0tobnphRDl6aFl5dkdGTnFacjgyTjBRMGRQdCtUTHRScHU2YWE0T2VI?=
 =?utf-8?B?ZUNNdHhVNktRS0hOdWx6elAyYko5STZKVFdjSmJBTzZsL3hSaWt3QkV3N2NB?=
 =?utf-8?B?NUZrU3VmY0s4MWYrSHpVR2VIeHdFdE55TC9aQXdkYjhJQVM3a0x6aUpvMm1X?=
 =?utf-8?B?ZVovWWhubU44QWJwL3FkUTlxaXFXc2F0Rk5PYkNVUGlNSitueHV6UjNRWGVn?=
 =?utf-8?B?UkxmNEQ4Mk1lWll6M3N1WSs2VzFkUUZYSThKWldKQ1VlcWU1akpTS2hnQ3U3?=
 =?utf-8?B?dzFWUW5oZzc2TU5haDFjQTYrY1hoU2VSOWltWnRwWmxSNldaeWdUQjI4THlv?=
 =?utf-8?B?QWo0azIyS2Zmd0kwbkM4ZyswKzk5ck1nL3hLSlBobzZPMCtXc0dBTk1XVHZu?=
 =?utf-8?Q?PCLk+mL9ZXxTepj5I/ej1m/j5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36946192-d0dc-41fc-f953-08ddb39f6e47
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:19:08.9831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66bWDqLRceLRqm1DlqeG9rhPDfiuS7Ppo9aBhACnrs9ooWCErfIwKdH3iExF+MJz1FgklWub9sEPeOcoUqYLDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8054

Hello Chenyu,

On 6/24/2025 5:46 PM, Chen, Yu C wrote:

[..snip..]

>> tl;dr
>>
>> o Benchmark that prefer co-location and run in threaded mode see
>>    a benefit including hackbench at high utilization and schbench
>>    at low utilization.
>>
> 
> Previously, we tested hackbench with one group using different
> fd pairs. The number of fds (1–6) was lower than the number
> of CPUs (8) within one CCX. If I understand correctly, the
> default number of fd pairs in hackbench is 20.

Yes that is correct. I'm using the default configuration with
20 messengers are 20 receivers over 20 fd pairs. I'll check
if changing this to nr_llc and nr_llc / 2 makes a difference.

> We might need
> to handle cases where the number of threads (nr_thread)
> exceeds the number of CPUs per LLC—perhaps by
> skipping task aggregation in such scenarios.
> 
>> o schbench (both new and old but particularly the old) regresses
>>    quite a bit on the tial latency metric when #workers cross the
>>    LLC size.
>>
> 
> As mentioned above, maybe re-consider the nr_thread vs nr_cpus_per_llc
> could mitigate the issue. Besides, maybe introduce a rate limit
> for cache aware aggregation would help.
> 
>> o client-server benchmarks where client and servers are threads
>>    from different processes (netserver-netperf, tbench_srv-tbench,
>>    services of DeathStarBench) seem to noticeably regress due to
>>    lack of co-location between the communicating client and server.
>>
>>    Not sure if WF_SYNC can be an indicator to temporarily ignore
>>    the preferred LLC hint.
> 
> WF_SYNC is used in wakeup path, the current v3 version does the
> task aggregation in the load balance path. We'll look into this
> C/S scenario.
> 
>>
>> o stream regresses in some runs where the occupancy metrics trip
>>    and assign a preferred LLC for all the stream threads bringing
>>    down performance in !50% of the runs.
>>
> 
> May I know if you tested the stream with mmtests under OMP mode,
> and what do stream-10 and stream-100 mean?

I'm using STREAM in OMP mode. The "10" and "100" refer to the
"NTIMES" argument. I'm passing this during the time of binary
creation as:

     gcc -DSTREAM_ARRAY_SIZE=$ARRAY_SIZE -DNTIMES=$NUM_TIMES -fopenmp -O2 stream.c -o stream

This repeats the main loop of stream benchmark NTIMES. 10 runs
is used to spot any imbalances for shorter runs of b/w intensive
tasks and 100 runs are used to spot trends / ability to correct
an incorrect placement over a longer run.

> Stream is an example
> where all threads have their private memory buffers—no
> interaction with each other. For this benchmark, spreading
> them across different Nodes gets higher memory bandwidth because
> stream allocates the buffer to be at least 4X the L3 cache size.
> We lack a metric that can indicate when threads share a lot of
> data (e.g., both Thread 1 and Thread 2 read from the same
> buffer). In such cases, we should aggregate the threads;
> otherwise, do not aggregate them (as in the stream case).
> On the other hand, stream-omp seems like an unrealistic
> scenario—if threads do not share buffer, why create them
> in the same process?

Not very sure why that is the case but from what I know, HPC
heavily relies on OMP and I believe using threads can reduce
the overhead of fork + join when amount of parallelism in
OMP loops vary?

[..snip..]

>>
>>>
>>> This patch set is applied on v6.15 kernel.
>>> There are some further work needed for future versions in this
>>> patch set.  We will need to align NUMA balancing with LLC aggregations
>>> such that LLC aggregation will align with the preferred NUMA node.
>>>
>>> Comments and tests are much appreciated.
>>
>> I'll rerun the test once with the SCHED_FEAT() disabled just to make
>> sure I'm not regressing because of some other factors. For the major
>> regressions, I'll get the "perf sched stats" data to see if anything
>> stands out.
> 
> It seems that task migration and task bouncing between its preferred
> LLC and non-preferred LLC is one symptom that caused regression.

That could be the case! I'll also include some migration data to see
if it reveals anything.

-- 
Thanks and Regards,
Prateek

