Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD40928F520;
	Tue, 15 Apr 2025 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726814; cv=fail; b=CL2hD0kcXlmeLemU/62IzUpbAmM8fyP9ytICjLANK+XmvHBdymD6Xp9JgXeqnvn4uvW2gXSTIsX+in6RNIq7I3t3F8SFMFY4Um70RBYpz++X/NlcEJJq+C5hp0rlfch/oIK/KE/rfKRv0OmqAEblx2NkS6K/kV/LqSCrWzMO4Gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726814; c=relaxed/simple;
	bh=YWKM1anMECec/gKXDxirUgyxOnIWgsyUR9t4rx458qQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lq5+J5QhoEmjIBZrbAL8AEYOE/v2b3PNaHKV89HoIvvW0Eb8Lk8Ed0FmcoV8HkJecrciQGl/7sx6GceHYd0fr3y/8WRvWfx4Uz/2xnQsnCeSri373bYCEZuMn/PPYuPfs7i3aHU8riM2kgv+rF9yi4N+qBXXruqUifnGELRbdUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SY9br0fe; arc=fail smtp.client-ip=40.107.237.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SY9br0fe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAdaONgK1PMOJqaWVb42kdQiq9INydNFIahShCJ2G6eUVIJ7TWoIYksffIPQg3fEwywb8C9qCrhoI3p0IPcPLP/esmMvUHVmdD5kKcLlkZFmZs3s3eUXFuhMRYVeXd+E9VhAm2fA6Tw/62DGp4zRdaH4QDbxo1NdjTNB37tnBF+dFBA1boiwoZupWLPAm+nrMt4sQTFbo0TFJZ9jVckJSaNNS0gbcMBSaQcQCk3tV0fkEtntoAKTrATObXxe5ocLF9lu0nFjlacjIgNrLuS+U+IDQqXnxwXhg0ywIOiNdU1CPovfFaJctGIACTE6zYQHOTzU04A/vSXvRa3FN90uWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MZwxKcmCBTuYgWP2NuWdH5Eyce1LJX63WTvgFFj5zk=;
 b=ngFMH1dsJCJjRSk8QNmqSOlFfFcUUL/XWOWV1b8JWxqhSW7RbKO74FEttE35oNHE3hWEqh2ieQKeTL7GobaRhacobai/w7qSNdEkxMqDT/7PiyGQcTSbj3TdxBzSOsSPAOL0wOv1ZwLTNobFevUNkj9zKP9weudxCOuJcjzngJF8Kgw2xyfRJemL/D0fLiNoXKMo4HX7SFVrjcmUksbPpGIBlTe7iAk2ysQLWIIm1NuvqpKMpZupwzocH6K7cmZhNzQj4tJpWEj36mC3qvrNHPV7awx8iGWyofe6F3cHU1Xz62znhgFn+7UVSGezAwUyS6g3WXGMpVOyUOlsfn58MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MZwxKcmCBTuYgWP2NuWdH5Eyce1LJX63WTvgFFj5zk=;
 b=SY9br0felGeNA8vx2mZa5MkrBjluUZ6QK7Ymd3DB2x7IvjHdQEpwTBYnhE3I0UrtFNDLfpfL17xtmKz5RYqHQfubyhgmRioTqZ3g7kv/Wjv5TD23SePXrh+qbOI9a4wAgIikzg+DxvdOK9osrXUl/VLXNKl6Kw9VuYW6nYpX2cw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 14:20:09 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 14:20:09 +0000
Message-ID: <3d31259c-cac0-4b96-883c-6d2e8e427988@amd.com>
Date: Tue, 15 Apr 2025 09:20:02 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 14/26] x86/resctrl: Add the functionality to assign
 MBM events
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 peternewman@google.com
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <22889d46484b2393d701ce83c82f253c1454216b.1743725907.git.babu.moger@amd.com>
 <59fbd325-04e8-459f-a724-ae0c4536b1a5@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <59fbd325-04e8-459f-a724-ae0c4536b1a5@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:806:f2::22) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 5909dda0-429e-41a1-2f18-08dd7c28a0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TSsrQ2xUVVJ2bUFDS3AyMjFkeHFrbmNLUzBLZjBPMHQ1c3A1clE3T3VQQXNX?=
 =?utf-8?B?blc0amdNQlJOZHZUek1zb2txYXJsaEIzUC9nL1RCV3ZlemhyT3dGNFpaQmE2?=
 =?utf-8?B?L3B2cnAwa292NWcvSFlyNWJLM1pWajR6dGF1cHQzbzRudFM2V1d6L3RaaEpu?=
 =?utf-8?B?bmFaYkNtMWlXb09uR2pYUTR3cW5pRFhjNFMweGtMekZqZkswYWxyQ2lwb0Vi?=
 =?utf-8?B?ZE9zVE5wV3NTMFQwWnFUazd5MVpNWUZxRlUzY01IQ3F5MFlqc3ZuMnZvbjRp?=
 =?utf-8?B?b0gwc0J0eWMxdjV3RUY0azBGMUNkU2gzeDRtRGMwVXUrck53cGoxNnpxam5G?=
 =?utf-8?B?aW8zRzVrUGt1NFBtbU5TSm45QnRwMTM4dFAvU0N1YlpiQVdOd3FUd0pOTVBZ?=
 =?utf-8?B?NitGUjNNU1NXREtyOFNtMElzUHJ1WU8zWkJkdjk4UjRiaHhPbFJnR2Q3NVZT?=
 =?utf-8?B?dTl3ckZqUHdpMFp5eHF4M1RMUkxaenJyeUtKZGRLUFZVdnFaL0NuRWdpdHpj?=
 =?utf-8?B?eHVkeUpYbkh0MXhKdnJZUmhic3dMazl2MjZpc1hzRWZsUDBJeEhhQ0dkeFZ1?=
 =?utf-8?B?cGxiR1FWVzVvMUhmRmtXQjRic0lFM1gwTkJjTjRMMlV4NEUyRHhuOFpWTFVk?=
 =?utf-8?B?TEx1ZFdvT20wdy9zQ0pnenB5cFFtbUlNQlprSEc0bWQyRFlUMVYwMG16T3dl?=
 =?utf-8?B?UFhabGRMclU4KzczUmdXK2hBNmtkc01FSmhKN1VZd1pUZW1FdCt0MlExK1Y4?=
 =?utf-8?B?VTM5c1hBSDZRQjZ3U2c4N0ljZWpzZGRzVVhKK0RVTFoxSTRwK2pCc1ZkUjBP?=
 =?utf-8?B?Z0xZMVpZT2R4Y0JxWko0dks2R0pIT3FGRGZXSTZTVGZaaXpPYkI1NC9RUzAw?=
 =?utf-8?B?V0N1WHRzWUFZK1RwNnl5aWlrRy9KRXp3aXViUUFOZGlEZmY3T3dBdEJBdkJO?=
 =?utf-8?B?UnZPeFZaaUFBc3dtR2l1OVZVU2xiY085dzJLcE1EblRnaHBKZGdaU1p5QVI5?=
 =?utf-8?B?TkRxNzVMS3h5bUpFOS95UlNnOE50SUtpQ0VRMVMyMGNucjRCT1BBTHVoYmhK?=
 =?utf-8?B?OHI4Y2I3ZVpERUsxQm5GY2p0TC81NW5Qbzg3ZHpiT0tXQzJCZjFmQmx6a1ZM?=
 =?utf-8?B?NzIzL05ESFBSL3pkL0pKamhVOTdIcHFDSExDZVQ2amRiVlhJSGRWN0VmajRP?=
 =?utf-8?B?SG5FYnAvczBxY1RIV09sRFZKMU9rUG9tZWZQS2diN0crNUd2ZlU2SWkvSmI4?=
 =?utf-8?B?d09Pam5iOC9TeU9SWXJiNzZ6bzhSUUhuWFl4bkc2MU9EMDJKbFpBS3lwMFgy?=
 =?utf-8?B?SUtpZWlCNFBGQkZvcndCb1BPck1reXlyMlEwS3lkaFQvNGhQN2ZPU2tMd3R3?=
 =?utf-8?B?eHpQcGVWS1lQR1QwYmVZdnBuUVRLc1dFUlA1R2Z1VUI0MVhMV3JkQTRLZm1C?=
 =?utf-8?B?a0hxMmM5YVN6Qm84UStGYmxWSVRRR1F4UTUzQTRuaTRRN2pmenhKWWFzT1lq?=
 =?utf-8?B?Ui94bExFcHZCRXk4VS90bHR1bnlkVXBoSWs5ZVBLM09NK2hnSkNQMFFaZ1Vw?=
 =?utf-8?B?Z1dXM2N4NGo3bGNJS1pMRW1hRExwUDdpZzZ6bVd1S1JBb2EzM25wRmM3ZFl3?=
 =?utf-8?B?TDhvTmEwMTY0eDllb2NpWC9RQndyNHpQYTlrN3RGTkMvMnNicjVPNmZCV0Qv?=
 =?utf-8?B?N2k1c05NaWpoVnVmSEE0UU41NXJFN3phSy9OSFpkaDBoRUludjlGZE1mQ0Vx?=
 =?utf-8?B?MSswY0xHR2lYMWo4VUxoQlAwVDhFTUQrS0FsZVZydW94anNiRTU2c2twc0M0?=
 =?utf-8?B?TlpYT3ZXZjRzcUhvQ2JyRU0razZpa3J2dUQxTStuT1UzUGZub3BibS9ISjJN?=
 =?utf-8?B?ZDFaTkVaTFk5WlkzY1U3c3l1UjhoWVliZU94aXdOeWI3Zjd0VVNCeTl2Z1Jt?=
 =?utf-8?Q?XbVssnH9FCY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3NkT2d6VS9oNERySW1HckNoamdmdExZeGkxcVhSdlRJbHFNcGU1T3NRZUh2?=
 =?utf-8?B?aCsvaHBhVnJlY2hoU1B5L2xzaDdjU3VRbURzc25IK0kwZGZKaWtDZnVaQWVl?=
 =?utf-8?B?d1RoZFhTV0tZbU9OdHNBbEtaT0Z4eVpwbjA0dXcvR0JTb2laNjExUThKTTVP?=
 =?utf-8?B?OHFlditQV2JSZUgxUC9UVG5mSHk4K3BxS1JQUGJBYndOaHhVZys3elJ5Q0FJ?=
 =?utf-8?B?TEsySDFFYVhPTlZzcXBoTCtzZlFWdU5NUHFXVlorUXBvY0RuaCs4aXVsaWg5?=
 =?utf-8?B?MmxjMmtzVGd3WHVmSFY1TmNiMkFlT3RUMFFVMGlaekViRFJtVkdSdm5tZFdj?=
 =?utf-8?B?N2RwQy93NGZNUVNtNXVnNXFVYWFKWlhib0tpQ1Z4Zi9OMkxCRjJDUHQ5d0Qz?=
 =?utf-8?B?RllMT0IzOU95aUFwN2hKMWIzVjVwV21acDYwWWxqZXo3TUF1WTJUWERTV0l3?=
 =?utf-8?B?a0lrZHVIUWI4ZXBOOHJnblplOWVNUUZ0dHdyTnhBbFU0bHVIbW4vR0tteEVZ?=
 =?utf-8?B?eDhocGNUWXZ2MnBKdmhwRll4SytHS2crdmYxdHp4a1lRZVViTnhMTjBhMWd6?=
 =?utf-8?B?RmxQTnpkQm5ESUVhRkhQQVNDSUI5RjZNbG40ZHhrNjRuN0NlYjRYSUVhVEF3?=
 =?utf-8?B?MHFHOCt1bVhXaS8yRTEyUVdGM0w0dVAwR0xPcXNaSDI1ODUvb2g3RVpDdUlp?=
 =?utf-8?B?a1FvVkREN3A4bXJ5NlNjbzBaTTJMVEFpc2VHQy9rK05DUTlTdEkyeTNMdXJz?=
 =?utf-8?B?NjV6YXBpOXVMRWprbHV1L2lWMUlaUVRYZE5VVWlJck1LOTJMQ1JGK24wVUtR?=
 =?utf-8?B?K2Vka0w5a0JRTnpPczJwWXlIOHRYTFExNCsxbEFnb0JxRnpZSmhLTUljOXps?=
 =?utf-8?B?MmtaZ3dtd25WWUdLMm9GWlFld0FYQXdlM25jVVN4eGZiYkFVRFVSeDdEcjVx?=
 =?utf-8?B?RXppZzVYcUlVSFVOamZ4ZllnNmc4cnBwWVBNSlBDUk9qL0JVN2pNMko3bk5W?=
 =?utf-8?B?bTlkMDdRd2lWdHZqUDhHYmJGV253S3dGdmpZYmNkKzBiUkpaS1l0WEVTVTg3?=
 =?utf-8?B?dTlMNGUvYkRnZDFRMWtyUldTdTZtUTZkam8yOFE5K0VpdmpRcE9sVTJhci9o?=
 =?utf-8?B?OTB6OVpmdGw5M2UzaVAvMXJuNVF4dXQ4WHl3eEFsdWFod0xXSklPemVIWDRG?=
 =?utf-8?B?ZlkrOEFOVnpQRzZkOURoNnl3aHJkdjM5MGdDaS9DdHZOSGtCZGJIdlRiR3Rz?=
 =?utf-8?B?V1FjL0g5K1ZCSkwzMDdWWFRsejVMMTFIQ3ZBRHB6akVoU2JISnhSbVF4ZnRI?=
 =?utf-8?B?bkJGdmpvWGlLMFpObU1QUThVL1BMcFBNNGNpRnlRMHRXUk1FaGJ3TG9MbjVJ?=
 =?utf-8?B?SjNFQjE3NkwwWEFaTXhhMm1qTDd4bW9qVzVGR1RxOTYvMGJIdTVjdkdneVdT?=
 =?utf-8?B?MUo2Y2NHYTNVMWN1NUVOUGpiNUNtcG9hUUNPQ09IWkxJSiszbUorcVVTRk0r?=
 =?utf-8?B?SHJaSjFPQkVaVTRUR2g4UjBucTZSOWEyMmhEUVB0d2NVWTRaRy80aG93ZWs4?=
 =?utf-8?B?eXNZT1pIUnJZQzdDd3dvdE5SYUd3NWo3NDFxUGJlWVU5WGc3cGNJWk00WDIy?=
 =?utf-8?B?TkNMbGFQTnQ3RmhnOG1MOHJBU0p0TFhHbVg2YzVWaDVyd3NacEZGdm5PTUpv?=
 =?utf-8?B?VWQrcEVON0RNMytwbVRJMHQxSVpxcUIwN1J1a3l2TTl5clVsTnRNZGJLZWI1?=
 =?utf-8?B?ajZ3ZlhxQ0d4cjhnSnRZOGJUYmk5VTR5S0MvR2w0NUFUa2dPYWJuVWZkWFJl?=
 =?utf-8?B?M21lRUVJaHJRVGpTU0drUkNsSThHSnhOSWw0bUp6UU5SY2RDdFJjQ0ZqMkpY?=
 =?utf-8?B?RS8wREM0d2dBaVM1eEdvZ0thRjVTa1JTT3pDc1JMbW9pTHdiaVdTNkJFcUVV?=
 =?utf-8?B?YlhwREdxUUZuMzgrQktVVVUxK2xSbWNTZjMxQWZ2bERwYWo5T2dNcDUrbHQy?=
 =?utf-8?B?R0x0aWR1UHB6VlgvL1dmZDNUSmVqZDFLMThaSEFsMEtCRnlOa1pwT2E4emNm?=
 =?utf-8?B?VkZEQTBFZEJNRWFyai93RnhQYVpkVTJoSHJicGVtZzE4UGQvOFhxcU1Jd05M?=
 =?utf-8?Q?YOuo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5909dda0-429e-41a1-2f18-08dd7c28a0a8
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 14:20:09.3954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsljvoRQOQhkwsV1yraN6khIv0O1g1VM4K+gMrMc/BNT7SfctMwKns7mr54PaZqm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831

Hi Reinette,

On 4/11/25 16:04, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/3/25 5:18 PM, Babu Moger wrote:
>> The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
>> can be assigned to an RMID, event pair and monitor the bandwidth as long
>> as it is assigned.
> 
> Above makes it sound as though multiple counters can be assigned to
> an RMID, event pair.
> 

Yes. Multiple counter-ids can be assigned to RMID, event pair.

>>
>> Add the functionality to allocate and assign the counters to RMID, event
>> pair in the domain.
> 
> "assign *a* counter to an RMID, event pair"?

Sure.

> 
>>
>> If all the counters are in use, the kernel will log the error message
>> "Unable to allocate counter in domain" in /sys/fs/resctrl/info/
>> last_cmd_status when a new assignment is requested. Exit on the first
>> failure when assigning counters across all the domains.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>  arch/x86/kernel/cpu/resctrl/internal.h |   2 +
>>  arch/x86/kernel/cpu/resctrl/monitor.c  | 124 +++++++++++++++++++++++++
>>  2 files changed, 126 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index 0b73ec451d2c..1a8ac511241a 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -574,6 +574,8 @@ bool closid_allocated(unsigned int closid);
>>  int resctrl_find_cleanest_closid(void);
>>  void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
>>  unsigned int mon_event_config_index_get(u32 evtid);
>> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid, u32 evt_cfg);
> 
> This is internal to resctrl fs. Why is it needed to provide both the event id
> and the event configuration? Event configuration can be determined from event ID?

Yes. It can be done. Then I have to export the functions like
mbm_get_assign_config() into monitor.c. To avoid that I passed it from
here which I felt much more cleaner.

> 
>>  
>>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index 77f8662dc50b..ff55a4fe044f 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -1469,3 +1469,127 @@ int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  
>>  	return 0;
>>  }
>> +
>> +/*
>> + * Configure the counter for the event, RMID pair for the domain. Reset the
>> + * non-architectural state to clear all the event counters.
>> + */
>> +static int resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			       enum resctrl_event_id evtid, u32 rmid, u32 closid,
>> +			       u32 cntr_id, u32 evt_cfg, bool assign)
>> +{
>> +	struct mbm_state *m;
>> +	int ret;
>> +
>> +	ret = resctrl_arch_config_cntr(r, d, evtid, rmid, closid, cntr_id, evt_cfg, assign);
>> +	if (ret)
>> +		return ret;
> 
> I understood previous discussion to conclude that resctrl_arch_config_cntr() cannot fail
> and thus I expect it to return void and not need any error checking from caller.
> By extension this will result in resctrl_config_cntr() returning void and should simplify
> a few flows. For example, it will make it clear that re-configuring an existing counter
> cannot result in that counter being freed.

Yea. I missed it. Will take care of it next version.

> 
>> +
>> +	m = get_mbm_state(d, closid, rmid, evtid);
>> +	if (m)
>> +		memset(m, 0, sizeof(struct mbm_state));
>> +
>> +	return ret;
>> +}
>> +
> 
> Could you please add comments to these mbm_cntr* functions to provide information
> on how the cntr_cfg data structure is used? Please also include details on
> callers since it seems to me as though these functions are called
> from paths where assignable counters are not supported (mon_event_read()).

Sure. Will add details about these functions.

> 
>> +static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int cntr_id;
>> +
>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
>> +		    d->cntr_cfg[cntr_id].evtid == evtid)
>> +			return cntr_id;
>> +	}
>> +
>> +	return -ENOENT;
>> +}
>> +
>> +static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int cntr_id;
>> +
>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>> +		if (!d->cntr_cfg[cntr_id].rdtgrp) {
>> +			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
>> +			d->cntr_cfg[cntr_id].evtid = evtid;
>> +			return cntr_id;
>> +		}
>> +	}
>> +
>> +	return -ENOSPC;
>> +}
>> +
>> +static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
>> +{
>> +	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
>> +}
>> +
>> +/*
>> + * Allocate a fresh counter and configure the event if not assigned already.
>> + */
>> +static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +				     struct rdtgroup *rdtgrp, enum resctrl_event_id evtid,
>> +				     u32 evt_cfg)
> 
> Same here, why are both evtid and evt_cfg provided as arguments? 

Yes. It can be done. Then I have to export the functions like
mbm_get_assign_config() into monitor.c. To avoid that I passed it from
here which I felt much more cleaner.


> 
>> +{
>> +	int cntr_id, ret = 0;
>> +
>> +	/*
>> +	 * No need to allocate or configure if the counter is already assigned
>> +	 * and the event configuration is up to date.
>> +	 */
>> +	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
>> +	if (cntr_id >= 0) {
>> +		if (d->cntr_cfg[cntr_id].evt_cfg == evt_cfg)
>> +			return 0;
>> +
>> +		goto cntr_configure;
>> +	}
>> +
>> +	cntr_id = mbm_cntr_alloc(r, d, rdtgrp, evtid);
>> +	if (cntr_id <  0) {
>> +		rdt_last_cmd_printf("Unable to allocate counter in domain %d\n",
>> +				    d->hdr.id);
> 
> Please print resource name also.

Sure. We can print r->name.

> 
>> +		return cntr_id;
>> +	}
>> +
>> +cntr_configure:
>> +	/* Update and configure the domain with the new event configuration value */
>> +	d->cntr_cfg[cntr_id].evt_cfg = evt_cfg;
>> +
>> +	ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid, rdtgrp->closid,
>> +				  cntr_id, evt_cfg, true);
>> +	if (ret) {
>> +		rdt_last_cmd_printf("Assignment of event %d failed on domain %d\n",
>> +				    evtid, d->hdr.id);
> 
> How is user expected to interpret the event ID (especially when looking forward
> where events can be dynamic)? This should rather be the event name.

Sure. We can do that.

> 
>> +		mbm_cntr_free(d, cntr_id);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * Assign a hardware counter to event @evtid of group @rdtgrp. Counter will be
>> + * assigned to all the domains if @d is NULL else the counter will be assigned
>> + * to @d.
>> + */
>> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid,
>> +			      u32 evt_cfg)
>> +{
>> +	int ret = 0;
>> +
>> +	if (!d) {
>> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +			ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid, evt_cfg);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +	} else {
>> +		ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid, evt_cfg);
>> +	}
>> +
>> +	return ret;
>> +}
> 
> Reinette
> 

-- 
Thanks
Babu Moger
