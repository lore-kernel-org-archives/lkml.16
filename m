Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DB92D540A;
	Tue, 10 Jun 2025 23:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749597579; cv=fail; b=Hr9Ruiv1vMOR2Nj6oILNCSGZzg2gqXLZFKRDiDD0jypOrolC7njaIQBHvW/xnhy8KJbHHsiXTfafKzHtg0JTUylv+f+GnQUr70aLsllRzARjuetgkfaXAF9Zp7+0H4u7DSNQHZVg8HIx/NWdso0e9n4U7Kg1qa716kAkhh9bEs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749597579; c=relaxed/simple;
	bh=GzpbCWP/RYwORRssnOuP2YJe3OzoB0irp/bfE2nYLk4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kh+VXDptcUKZS4YDQkQWGBpdFAUtoCRLV7ujQiGHYUyiPjhnu8OrWcvQuI5aWEIL1H+uFyE3fWi0YAT2WoqC/yGFNc3W0bKCqLZgwEBRJKntkPhSIceCayigOHh+XCeWoP5NdcFDOVKgcF002yyn78FPS8OejP/9vvGiwOg5s9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G8lcHDky; arc=fail smtp.client-ip=40.107.244.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G8lcHDky"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBfMkN7g63tWggQPWfzBsRbSjyF0mz87iGDUErAZy0BZxHAn89c9THnNrD1jCCGGTuTmVjY4JCO7UchOoqyNoRfdy8cZ3Cj/mG5IeQ7I6Lk08/ZURTWbCA1QoQfBys3aMqYSsr+zcE8oifKoE44WfxyQAW6mE9iuMUgrXlB/bihuEEvGsPqKDc9Ujd9ROmTUG8YVcw65RA6zAorYeYtbtnNkgHrvJB47j9jM50vCQsnwTZ3bbwo2jWAvz0/dyVCfx1DtQcOZoDNq0p1Ag0gl9vn4j3DoTleZgjyApgl10gVbHIhVmDqOm0BAAZMBBwroUIxw52p2g3DswFkwWKUtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuI0ifr5r9QO+AtVKJGIN1FqHUBlw5je9NHlV1kvQ4k=;
 b=CBVklV4sBEZOr4FUdquL6D/OKnpi9uVobz6ygv5P1ReJ3xpvc9YcyLQeHHHqQalwSetzbujpn+ofs04TknJNy0OQ3aTT1pS/NmzPArzSdOV8NHblaI/5iVUfehxPF9nX3xuHt24JVLq7Sq4d3U5NSybyUKCYn2ZnkaPPNYxoET8pHYyOg6gFn2gpEG7cZCtg+6utQy/UjNgi7tpLj1yZ7MoamEap1U4jiEVMglLa8Tcs3qqzH2G2Oka15J+Aafdt25c5NSUeO5QvOpm0XuGezHHwj9CKs1YVWAhvxmRlMbZ/XJdaFTKeZo0tIcyv0oh6pSHC7qmrBHrwNb9pyZRkSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuI0ifr5r9QO+AtVKJGIN1FqHUBlw5je9NHlV1kvQ4k=;
 b=G8lcHDkyQuyYIQwnEKVBJCgP4th2hCPo4BckQ2i+qqspC30T1sg4VflF9PosB6UPrbFinAcffhSnXlGLyucKS1yzRLehBIWG+I7tQV9IDesv9Qq/OxChxy5s39Ueq5PWpZyhbHdHf56AHpGo8Juy71fkENG31tsxckN5GhWmMsU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN0PR12MB6295.namprd12.prod.outlook.com (2603:10b6:208:3c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 23:19:30 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8792.038; Tue, 10 Jun 2025
 23:19:30 +0000
Message-ID: <9b08ab86-22d2-40c1-be20-fcc73ee98b3d@amd.com>
Date: Tue, 10 Jun 2025 18:19:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Reinette Chatre <reinette.chatre@intel.com>, babu.moger@amd.com,
 Peter Newman <peternewman@google.com>
Cc: corbet@lwn.net, tony.luck@intel.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
 x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com, Xiaojian.Du@amd.com,
 gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
 <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
 <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
 <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
 <CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUve8ptsfFTw@mail.gmail.com>
 <7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com>
 <7628cec8-5914-4895-8289-027e7821777e@amd.com>
 <877642a9-cef0-4b80-9053-3ecace9326ed@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <877642a9-cef0-4b80-9053-3ecace9326ed@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR05CA0098.namprd05.prod.outlook.com (2603:10b6:8:56::8)
 To MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN0PR12MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 8134edf7-d8c9-404e-6151-08dda875409b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVcwMUlXcjBnUjdtaC9IcFZWNlNTL0pqTVVIYUp4dzRja2lHbkMzL0FXdDE0?=
 =?utf-8?B?eWNoVXJxUXlWMFd4dUxsdEcvOUlvL1RGY3NXek5nb2duOS96S0I3eE5PMm1J?=
 =?utf-8?B?Z0c1NU9GVS9oeUVNUVF5UDFIUE9GUWRMQnpjeUJSZExtSjhtY0IxcWdFanVp?=
 =?utf-8?B?Z2NUTTkrNEdyQmhmOVFZKzRsczZFcFIzYnJrdXBBQmhVKzVjaUhqd25QVnBz?=
 =?utf-8?B?V1R5OWVsWk4wYnM5Z2FYVDA3K04xdFpaV2JrcldlMnBCZDhJdTBsTkJZZC9F?=
 =?utf-8?B?dEsvek9rRE0zMVRpVTRlK1ZSYVQ2bnNONFNyZEJ4b2hyZlhHbXZTZ0pQQjVD?=
 =?utf-8?B?S2F2NVE1RUlkSzV4Qmk5OTk0WEkxUlA0TjhLdHN5T21rdENKR1l1STNISXZV?=
 =?utf-8?B?VEZkcThtVkQ5RWZWM0pzWTZTMmQ1bFNlaDhweHVmaEcrb25EZnVKSUlWTXJK?=
 =?utf-8?B?Ry9JS2FMOGhNQzRaZ2hTLzhzKzJoRmVEL1FhQ2liY3phOWFES3dkMURmTXRT?=
 =?utf-8?B?TWlHL3pyNmRMdUZ4RmNEOHc3bnlaMDJHNkVaT1U4VWIzOVBxR3FKSSs0NGJ6?=
 =?utf-8?B?ZDRNVkRXY1NKOWFFRmQ3Q3lNMXF3clpiZ0w4SERZWkkzUDl0U0haVUYrMzB5?=
 =?utf-8?B?WFhCeXlFazNXdms3V2ZqTnBVQmVYbjVZOEEzNlJ1YmNmUlhkYmN1VG92d0Ry?=
 =?utf-8?B?NG9Uek5jQXNFY3pYZkRGRjVFNnVaMDRtUnpwMTJHanpJK0tGS25KRCtRMGdT?=
 =?utf-8?B?Q1BNK005d2FlV0IrOXNEQjJnemxVblBEV3FueVZaakxFeU1ZeHM5ZVYrdE1t?=
 =?utf-8?B?L1FHeHFiQWRrMUc3aGVZS3pCK1FIdlFxZ0JBTjBZa1g2SnhQbElJOFcwOURO?=
 =?utf-8?B?UDBWZnFFL1pWVnV3d2tkbkZCRjNIODZPdnpIdEtZWU1VQnVrTVZHTEhJZmhw?=
 =?utf-8?B?ZWdsNmFpMCs3VDZaNEFuYVRSb2c3RTFuaXFocXRpYWE1aWRxSUxySDdJUEtt?=
 =?utf-8?B?Nk5TOW11MFNkTU02Z0x1dkczWWhkQS9aVEEwZENod3NPaWR1Rml1OWF6TVRF?=
 =?utf-8?B?S3ZuTGozaGVSSUFPbVd4cTRkQ2RyUFpGa1duRkdVYVVMR1d1SGlsWlNRUVh3?=
 =?utf-8?B?bGJXYm1YZW5CckZRd2k5Vk56VVBwOHh0N1JqL3pvOFNXejFXUFJMVGF2cnF6?=
 =?utf-8?B?VG5uUGtsZVV3bmMvVEZQY29GV2ZSamJZaCtsV29FQVNETXptSzNSOXY1OFFj?=
 =?utf-8?B?TFhpWEVad2dWWUltaFZVNTFXRGlRb3RXN3dPL0JyTFFRdnNEZlM1MnR1TXkv?=
 =?utf-8?B?R3c3SysxaDVKazd5T2M5dE5MLzQwb29sZEZtZ0hDWTVYQWJZWGczRk9SaTRX?=
 =?utf-8?B?Y2NCOC8yeG45YWdhdXptaHh4ejRJWFZIaTMxMmdLS3g5MTNPWHU1WHliUmF5?=
 =?utf-8?B?Tjh6NmJFVVJvUytPV1NnZzNSSWN2OVlGSzNEWnp1eTdDbnBjdnNZbWJPMEZw?=
 =?utf-8?B?OEZPVmxwQ0RlSzhsMmE2YzBlMmgzc3ZwcUdkZUNXcVlCTkM0cXdrUndTQnUz?=
 =?utf-8?B?TktNbnN6dWw5cEt1andTN1MwajRhblRaNm1hR1AySld0a01wcEE1cHF2MzNS?=
 =?utf-8?B?bGNpY0pKQWg2Y3RpdjdxWXFidG5abVM3NEZicVRZUmlhRmxib09hdDRRT1RP?=
 =?utf-8?B?TnJCN1hZR3RkbS9YMkhYMzhyUVpPcmM2Z0h3ejVvakNRWGx4TDA2SWdNak5V?=
 =?utf-8?B?Q0gxNFJwSjljbkdGdFF0UDVIWVB1cUQ5YWt3b090emtqQ1JyK2pLWGtBTi96?=
 =?utf-8?B?UWV0NXo2TG9SMXJiMjg1NHVqVHFiOEpGR1hrWHZJMGxrSWppSVFORFBGWE9O?=
 =?utf-8?B?VmQvVWFnVW9rTHdPbXN3TGQ1UE43aHhSNzBkcEg4SnAvdXBtNFJyOTExWHJC?=
 =?utf-8?Q?XAoviI+VgpE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1N0ak4rWmg1OHBCZEprRXdTM2JOeGFqQ2FSK2Z6NXlTNnhCb000SzRGelZq?=
 =?utf-8?B?YUg0ZjZ1TmhqVktNYURZQzkvdUVYcFFOUFBvMXFwWDd6SGRpRitjTUI1QnZF?=
 =?utf-8?B?b0dSdWo0cUhTLzlBZkpSN2JTMnZqcHA3TWgyVnpkbXR5ejEyTldYV3NKRk9Z?=
 =?utf-8?B?Sm5YaWVhc002T0dqMlF5N2JqNTlpNldsLzNidU5SWmExMVVaUVhzYVdUQ2dj?=
 =?utf-8?B?QkZNRmU4VExtTTBvVFVnaHdRWWVJU2lxbTdHd1JNaFpHQnd1TXl6Sno1TUlT?=
 =?utf-8?B?Q0FtNFMwWVljQW11VVdkdjh1Z3R5OUppRUhjSmVlYlVWNGtaSE56bXM3bkNr?=
 =?utf-8?B?R0NlYmV3NnRjTWJzdlRJbWJKbjRsTmpHVXNVVmx4SEo3TlVodys3bDZHQ0pm?=
 =?utf-8?B?YlJlVEUxTUxtbmd6NDN3NFMzUktybXJSdDFwY0ovak1mS21FV1NlK3FCazdW?=
 =?utf-8?B?bk9SK3Nqay8yT3A5ejgva2RQOVFCTHZ5Y3U4VnJCWTFmU1ZkNnIra2hQbUZ5?=
 =?utf-8?B?RkFCaDh2NjdxVmdCWDdNZXJXUnFmZEVOMmtEZmR5V1RlYUsrbWI2dHFxU1N2?=
 =?utf-8?B?alZLdXpkRDNTa3pHbi9BYkNOaEJCT3JHVWVrV0Q3U2xWMGNVS3Q0QlhXRU85?=
 =?utf-8?B?S1BjNDZNRnFWL0t1L0dpTWQrWWJVakNsWG1pN2ZISjk0L21VMnNGN1NjT1ps?=
 =?utf-8?B?VDkxNUZ2OHVqUmFaRVE1Q1M5enp2Qzk5WWJhcG5wTGRiWmhjYnVtSHR1Qm1o?=
 =?utf-8?B?QUxySUZvaGhkRzZuOWtXOG5kYTdMWFUyVWZVbXZubnVTa2wzK2M5VmJwUG1k?=
 =?utf-8?B?OFRseUZReGlXU1d5STRQZ3R2UmJZeFRuakRuT3hSQzBHV3BrTWNtbW4rVDlC?=
 =?utf-8?B?QkIrbk5iWWo2YUhqYzBFYnJpSm1iV3p0Q1Q0NmZleW5FamdZdERKVmZ4OGFL?=
 =?utf-8?B?bWtWNGRKazlTbmJvdHZ0Ym52b2ZWTUxZRklaanZVaVBYOTUyQXRqbEgrM1Y4?=
 =?utf-8?B?VU9BRFhBbmdqUVRuVDlZUENqU0FIcVNCK2tIZlB6QUFxYVR4RGc2ZnBXUjlR?=
 =?utf-8?B?b25jNFJNbnNnSllsOFAxNGpDQnlSUzRVQVNyMTgyRGZhSG93WnMwVmxyVUgw?=
 =?utf-8?B?OVBFZkdYaVlTa2d0bGptNFVTazRMWUMyTGJiUFlWcmo5dTdGVmdxRXdkcW90?=
 =?utf-8?B?aFJOemQ4d0J3RGlXM0Z0VGFCVE90dnlvQ0hTbkhKWTNLc2Qwdkhpb0QxaGtW?=
 =?utf-8?B?b3RZRk5LVUpzdDFOWjJWcHFQUEo2SWwxbFFuNXFPY3I0Q3lVdHo4dWpGUFFv?=
 =?utf-8?B?RllIaVA2Mmg0bmVXNlI3Y0tuc2NsdEgrK29EeGNFZDVKZGd5VzlXVFFKLy94?=
 =?utf-8?B?RzlNR1lTeEppMHg4WnBMc3ZoalNRWE45a2I3V20wUTdPOHZ3V0RPN2hjdFBI?=
 =?utf-8?B?ZjRvRGlLL3dPeHNIeXFPVWR5eFdVYkdwOEZTOEhDS1pTalRMUzRNUVlSWHJ4?=
 =?utf-8?B?ZWpXUHNYekVONk1rTTRlZ0lCNEJNTEZNV3FtZmJsMVlJSU1WRHNlY1NieU1j?=
 =?utf-8?B?c1dxNEoraVJseFQ4SGFPaytxWDl1U0JHa0lKcnl6L2x1NEVyNXVRdTc1N3N0?=
 =?utf-8?B?WmhiZEJSREFobmZjYWlxd1YrVzMyR2JvcHpXdTB6L3ZsUEh5a1gzK3MxVGNY?=
 =?utf-8?B?d0k5ZHVXVFFIc3NZMkllVUJySjRiMHJtVUpZMVpTR2VmVTZaV2VhMFFkMVBB?=
 =?utf-8?B?K0ZMbmdta25LMTZRcDR6emJTV0ttSFQ5cTBBMm5xMG96ejBIMTZUTS94cVl2?=
 =?utf-8?B?LzBQZCtlc1haclhSUS9keVlTWmhaWHpiUzBUOUREYUw3Tml6ODZ3QzFzN05v?=
 =?utf-8?B?ZkE1WGY2cXB2Z1Y5WnN2eE0zSnhPT2RTK3pEVW83Q0JIRU5hL2w4RmYrbjNM?=
 =?utf-8?B?TFl2STBCVHJlbVFtSjZMWWxTOHhQWDJ0aWQvR2RzTGVSZkRGa3NPd1lqdWZ1?=
 =?utf-8?B?L29KSUZTQ2kwSzAxUVVhS0RINE9qMkoyOVE3VHg2VE9Pc3crZmdTT2VFSXFN?=
 =?utf-8?B?dTFUTjYrV0tnS3kxdkQ3c3hma3hBM2JiRHN4QWN3ZjB1azRQbWlkYldzTk9s?=
 =?utf-8?Q?qgfs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8134edf7-d8c9-404e-6151-08dda875409b
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 23:19:30.6724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFQu/9dwy4sREci7TKiSHjwJiG1hSQF/6eXLrMR7gDYDjNtuBq2gji+AqS7D1cLZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6295

Hi Reinette,

On 5/22/2025 11:33 AM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/22/25 8:44 AM, Moger, Babu wrote:
>> On 5/21/25 18:03, Reinette Chatre wrote:
> 
> ...
> 
>>> This is why I proposed in [3] that the name of the mode reflects how user can interact
>>> with the system. Instead of one "mbm_cntr_assign" mode there can be "mbm_cntr_event_assign"
>>> that is used for ABMC and "mbm_cntr_group_assign" that is used for soft-ABMC. The mode should
>>> make it clear what the system is capable of wrt counter assignments.
>>
>> Yes, that makes sense. Perhaps we can also simplify it further:
>>
>> # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode:
>> [mbm_cntr_evt_assign] <- for ABMC
>>   mbm_cntr_grp_assign  <- for soft-ABMC
> 
> Looks good to me. Thank you.

I am actually ready with v14 series. I have good feeling that we are 
getting closer to making these changes final.

So, Looking back again, it might make more sense to rename few user 
visible interfaces.

1. # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode.
    [mbm_assign_event] <- for ABMC
     mbm_assign_group  <- for soft-ABMC

    This looks much more cleaner.  It matches with "mbm_assign_mode"

Similarly, we can rename few functions and variable names to make little 
more readable.

2. mbm_cntr_assignable -> mbm_assignable

3. resctrl_arch_mbm_cntr_assign_enabled
  -> >resctrl_arch_mbm_assign_enabled

4. mbm_cntr_assign_enabled -> mbm_assign_enabled

5. resctrl_arch_mbm_cntr_assign_set_one ->

    resctrl_arch_mbm_assign_set_one.

6. There will few more functions. I will look into that if you agree 
with approach.

7. No need to change few of these below. These are related to actual 
counters.
    num_mbm_cntrs
    available_mbm_cntrs

What do you think?

Thanks
Babu Moger


