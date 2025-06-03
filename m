Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F940236A79;
	Tue,  3 Jun 2025 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958078; cv=fail; b=Kg+8Ejs8jEDuvTGjHtAaVaKSwHVBI6VODh2bwhrcCsUqCo+OZQmQBXP4KNoe8MCed+xeabsClRNtUT3UWvrIAtbv+sMT45wO0cetzRMCMgGDUSuyrISFyKGf10cUigusSOYVf/orNZljSEWqzj0wvv3bO+NlV4WaQDK+QyUiYd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958078; c=relaxed/simple;
	bh=jtylvG2mzEATZ0QZa+wTzUBICgxRc1Kgfs+A9oxi3Sc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oaNjYxJ07G0st67NEFRFZpY8/WvxdXZZ4r/VE21Kim3u8y1HK+gmsEQazTuNkGeMdRs5j9SIgCw5p1TsMfM6SV5XgLRO2GH2bHAiqZAktLFotyj8n7nnOBYQxwi1G8z+upkBpFvjFX0fHBn0DiptfkOIF9JSlOpzCrXNxygttj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xdF0/YiL; arc=fail smtp.client-ip=40.107.101.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xdF0/YiL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrxgvINhOgUASn7Wv62Vmxm97g4ucbq+5tR3NEBmVuQo3YdtdcXRGY2S3gOdqnhU2cBPKbhGnoWRsTfISAu7lWW4nMlDL5JcW6I7Tq87RzgXIw6LKEQUiqPHqaJyCfQjl+C5/1byMy1ybqXWmc4dKGHSrStjQlOTDmayFX10OhM5G4ptO+h5SNjscAEv1RU6wGqmndZDX9g1Q71xEMH22Me6sEl2dMXxTxf9NgCGltZdTEHPL1yV+5dgND8tuzFxNlA5W1H8NOphdPIKRXA6T3kQMrdpLFgcpETUuCThCqzzFouQm7tHr7YwNSNercrwcWKuIRu9SPhU9Prvl69Myw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pHPpejMmNAkNNzt9zX4drtRP5OEl5PWDsIFahe6zVA=;
 b=ezdm52RfH+F/xGnafXpsVvRI1Epm/EXDBWeg99SlXPAWn+QTx5jlc4su4IHlvlqYDHQH8v4zlvWrnx6URSORQzkrITcs4qheC34BW6ItuwfS5+RQSyjhna2nzIKKyf4aJyJzLD6O16LFiKFHRpFsWyWq1jukBOsEzxznzeRIjiYxky0YY2kqCjaTnRSryalfbEYHrziJey+mRahwvogMqjt/HRDAvIUD/5ulVoKxllNw1CBLajwuNFqyTmEgDNt+JdJk2nEy5csG3c6N2NZLsE/iivFR/BaS7jhn2nt7+PrUjAd6olCoRdXdOpGOI2APWzER6amyb/1nLRnq9LmSNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pHPpejMmNAkNNzt9zX4drtRP5OEl5PWDsIFahe6zVA=;
 b=xdF0/YiL+BpFPoGN/+9zqJD/rE7v70jClQr8OFWIcK6n1MqYQIuLhbZKyyeQYRsLHQdXlvf70Y5SZt8t+y46fvBQ4drTDW+ZDSpz80XFbX7Jkfrut+JSsHp7Cxd+p/25olvpJ/bz/AxsaV7aBm/WZbA8rH8HYyPQvdAAsKcV3d4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SA1PR12MB8163.namprd12.prod.outlook.com (2603:10b6:806:332::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Tue, 3 Jun
 2025 13:41:12 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 13:41:12 +0000
Message-ID: <f65a8e91-fb70-4af0-ac47-180b97ed0e6e@amd.com>
Date: Tue, 3 Jun 2025 08:41:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 18/27] x86/resctrl: Add definitions for MBM event
 configuration
To: Reinette Chatre <reinette.chatre@intel.com>, babu.moger@amd.com,
 corbet@lwn.net, tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com
Cc: james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
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
 peternewman@google.com, maciej.wieczor-retman@intel.com, eranian@google.com,
 Xiaojian.Du@amd.com, gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <8e9f18e1bba578d74fc3e3cb887c5101eb73e1d7.1747349530.git.babu.moger@amd.com>
 <ee5b9df7-d087-455b-a782-027d117b2178@intel.com>
 <da57734e-75c6-4fa5-9cc1-89376184d9c3@amd.com>
 <d8216838-aa71-490f-809b-127bad909f1e@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <d8216838-aa71-490f-809b-127bad909f1e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR16CA0020.namprd16.prod.outlook.com
 (2603:10b6:930:10::16) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SA1PR12MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a226777-9279-4e89-19a4-08dda2a44d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDNYRHpzQU1vZVZ4blRGL3BtRjdvTmF6SkNDVEFweUZ0ZlpPNHpGQk1BSkZZ?=
 =?utf-8?B?NmxuN3FWbXZzbHlhaU1QVmIxNkdFU3pJcHk0NkovazhVc2JlU2prUGVLcE1w?=
 =?utf-8?B?M1lrTU0xK2RBZ3I0LzVFem0vWk54dTJyV3pOQTJUNVc2clhjMW1hSWFyN1ZC?=
 =?utf-8?B?RW1XNG16L3VET3NDSUV5d2tPMWltSmJZZ3J5emp5eXRoc0NnbDh2YkhmVGcr?=
 =?utf-8?B?V282Zlk2NG9UQ0Y1bFdhcTB2STRXTzdnTVFPSGpweVhaaWpxSVBnYWt1Sk5O?=
 =?utf-8?B?ZkZEWGNybXZnV0lGMWNMQmlnZGxMaXRBYk5kTGE1bEdwbjdYRDFVTERnaThn?=
 =?utf-8?B?aGIxdVBtR01ocWdkVDlWWGM1d3hOMUN2L0RxRkNRQ1dMRmUxN3FnckFPdHps?=
 =?utf-8?B?S1BReG9NRXd6NThvaWhUTlhpOTJ5R3kxSHlOY092K2I4enhmd3VhSCtuOGs3?=
 =?utf-8?B?K2ZMdkVtVjhkVVh1SnpDOXdaVTdFcEZrUmxpMnlmTDFIem1GNE9uK3JzMFk3?=
 =?utf-8?B?SzRWN2RNYUhrSTkxMTBYU0pSZE8waUNybGJBbFBiY2lncFJxb0I0RWlRZkI4?=
 =?utf-8?B?Ti9wcHIzWC9scktGNjRkRWlWdjhJWit6b3NOR1RxeklFbUw3eDlLcWdmVlRD?=
 =?utf-8?B?N3RtNm0vQllXWG5JdHp2ZjZvbmJzS2ZPUUxselFEQWJiaTdIdTBmRjYvcWlq?=
 =?utf-8?B?aFFCckR1MXQ2S0ZZcjlXRHNxL1FrRUJKVWhHa0ZLaTBYWko2c3FWd1dpK2JK?=
 =?utf-8?B?TndOcmZWZ0JZWnlWMjZwS1lDZGRobjlneVJ4Q2d2TkpLWllUdXFQSEd6K0lo?=
 =?utf-8?B?dE9rQ1BOMGRMYytZUzZ4NnZESG0wRjRXYjVGcUtsTmVYSXNVN3RlUFhvZFA2?=
 =?utf-8?B?b2QzZHVHSUErNEkwM1Q3L0kzdjQ1WHRaWGRzdVdnN3l4U0hLSjliR1QwK3Av?=
 =?utf-8?B?NitpTEgwb3ZlZDVPVFVXTFJWVkpPMHJGRG9rYXh5TjZUNDRBZmtxK1owd200?=
 =?utf-8?B?ZVQzUld4R0ovUk9Ic2hSK3EvZk1uYXUxWkQzLzBMNU1BV0xFQlc3UTFKVFMy?=
 =?utf-8?B?Y2Z5VjcrUGxZMXpIeVJFV0hXUncrT3dtTC8wQ3IyM3Z5MGg5SnFHU3JmR2JI?=
 =?utf-8?B?ZHNsa2sxZzJuWkR1cDhVdWFPUC9qOFhSWTJ0SGQwdTEzeUt1WFRZdWgxMFNi?=
 =?utf-8?B?SWtacUFVMWU3NmVGOTdqUm1jRUUzWFVKSWFKaXkzMWtmNE5pR0pBYkFiak9N?=
 =?utf-8?B?aHJYeTVqbDlSL1MwQ045N05Hd1VvVzNlOXBFRUt0WmtMdzVISmxvWVNONWow?=
 =?utf-8?B?enJLaGRrOTVac0dhblpLRTZsaXhtMlBaekthZ1I3aGRBdml0SWMvYUlKNDVB?=
 =?utf-8?B?d1lHSHhZMEVOTkF5ejVHVWFPdG9adERNZS9pdDJuY1ZHQzVHWVBDc2JSSThH?=
 =?utf-8?B?VzNKTVVhMGVIVjVvcVQ5T2NWcHFVTXl0MDlGSTJSV0tXUGY3cHFyMi9HcEU3?=
 =?utf-8?B?MmJYUmdsaXE5aDhBaW45ckh3blJxWVZYTXRRMnJGVVphV3M0Sks3ZWJYSlBK?=
 =?utf-8?B?ZUI1MWhlb21CaHFURS9GY1V1bDkrTWtKbzVYSDlnbVZsTDc2a1IrZS9hdTFV?=
 =?utf-8?B?ZXdLR2Vsa25PY0dkOFg0cElKVWFZcys4QmZGeCsvWG5TaEI0SUdwL2FBK055?=
 =?utf-8?B?azBwSFUxbk5pMDNFVHpuMm9sRW5rT3J2cEd2Qjc2bjlJNmhkUER5VDk3aGlG?=
 =?utf-8?B?ME11eTUwRjNpVUtZdVRXYXJzV1JZZnROWllYTmRYbWZLNFE1cjRuek5tYnYw?=
 =?utf-8?B?cVlzWFEvNzRiL0ZsekJGaHpraE16VTJzdGdVMG5LellONm9UOVhvem1ac1JN?=
 =?utf-8?B?dW5CMktDdTJRQUVzYm5wamJ5Uzd4V0ZjZEtoVkV0dnpDQlNpQWJwZjJPWE4w?=
 =?utf-8?Q?CSMpeVZFx20=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHN3SExVRGE5ZjJNWEgwVTE3b3RrUjY4SE1WYm9NZE1abzNKUjkxUG8xbkI3?=
 =?utf-8?B?RWNOd1ArcGRZaWc0K1dnNUU5Njd2aVBBbUdNNEJlcjFnQnZnYk1aUm1icHZB?=
 =?utf-8?B?MFlOL0Z6elA0dURNZ3FmUmpmZ1NwVVlqSVpWSFVPaW1WZi9FenFCTk9MNUpO?=
 =?utf-8?B?VU5KTjVQczlKcUs2Vi9ac05uMWllRVlXNXBTc21PVEo2RkNTNDYvZjE0Qmow?=
 =?utf-8?B?KzZwMEkvUWlaa1Z1UmFjMC9jNFErWEJNR3dJTGJlaGZOM0dKVnRxYWJ3MXB6?=
 =?utf-8?B?U2FaVlVzK0NtaVZvTVBoMUc1Yk1SdkFhcm9kcmd6QTJqUUVYUXFDR2Ntcm4v?=
 =?utf-8?B?K1NETTJnTmhRQWVQMVNQamdNZWxXQ2RmWVlPdlM1MmdlbmgrNnU2dXAxYTBr?=
 =?utf-8?B?VGp4TFA0a0tNb3JKd1hBTERXNVdZenhsZmI5L1JOajBjbXU5Q2tGUkhidWZ5?=
 =?utf-8?B?NXhTVXYrNXc5VG5lcC9VKytjZzdRdmpGb1djRlRha1dQSE9WYmlLbmdNNnpm?=
 =?utf-8?B?dDFqMVdITHVjSTlxbzJZbXBlLzJwbjA2ZkxkVFNrR2cyWDc1YW5adjl4RndS?=
 =?utf-8?B?dld4alZZUmJZVk1kVzZDaXZQSmpNQ1Z5c1IycnpFaGhaZ2EzZVYvUW0yYURw?=
 =?utf-8?B?dmVHRG44UmNjMTk1cmtvMjA3bGorSW1NSnFaMFdyK0RpOEVJZ1V1YlZqRHZv?=
 =?utf-8?B?U3Y3bUwxMHk4RitXa1JPLzlCSm1nYlBwZ2UwcXhvMjVEQkFxdENNWElGdXZq?=
 =?utf-8?B?eGNiUm10a01STXFPTjlzNjFOT2svUXh4MDhIdU5JVUsvcjhXWGlXaldqWmVZ?=
 =?utf-8?B?SXRXSVFqbzAwWUI1S3ZUZXhEUVk1NG9nM2RXdi9OUnlnTnZEM0RiWlRld0pO?=
 =?utf-8?B?eWgyQ3Rja2pmUjU1aGpRTithZ1RlRzlzSFc3Skt6RVJIUDRod0RUUHlYeC9V?=
 =?utf-8?B?cmFFYXZnaklUbDVTeG5oU2N2RER5UGhOSmh1c21aSW42L3I1SVR6V1U3NjFN?=
 =?utf-8?B?Unc2UVNTRGN2SlJZVk9Od3V0V05VN29OdFRzK3ZNejNwWTc2WTEzSmR4Zk4x?=
 =?utf-8?B?U0g2aSs2THBRbHU4NFA2WGVOVGQzLzVFMXoyWVhBVVZTc3RqaWRZSm1OcS9V?=
 =?utf-8?B?Vm1IbjdWNjg5Z2hkZUpBbjJZZ2ZFemZTNGxtaW55Ymw1S3RSNnkvN3I0eUJY?=
 =?utf-8?B?Sy96MDcyRFBXTmtRbTNnakpwaHhqcFE2R1RUYjNjYkQvc3hxb0pkUk9QMzdF?=
 =?utf-8?B?T1NSU243MEQwZG9HRU1GZ2tnb0owMTM0Q0NIcU9mS1RucXJsMXpnUGhhRi9M?=
 =?utf-8?B?MUNVdVF5WXcvb0JRcTJDY3I3V1NVS3huZHpYUlFLODJCdXZOOGZBVWVwUDNj?=
 =?utf-8?B?dHRxcDNpRXdUbEE4c3gwa0FiUlhUK2FpMkhRaUt6Ni9YdU1xOFRxNTZmd0RS?=
 =?utf-8?B?MTBtdisxTUdjeUI1MDRIMTJ2a3RSRXhuaUFjZGY0MU5VUWg5Y2p6QmFTTnBT?=
 =?utf-8?B?QWNuYmdGUXFyWjlrWk4yU2pqaVFpOHRpWSsrWmdWY3g4SUYvZjZneVl0TGln?=
 =?utf-8?B?NEVXY25zVmhoSndiVnFzTTl3UkkrYWFjRFB0RjM0SUJTR3hHQ3hQVzFURlZI?=
 =?utf-8?B?eGVkeHozTXU4ZWZKNFdBUDZoL3piaW9iNmVaY3hqK1Z6ZnhZMmVLcmtSNER0?=
 =?utf-8?B?UXRjSkpIbzRid3ZRYnF5VTlmOU5UWFJIRnlQZTc1amJZWVlJQVRPdExZdkIx?=
 =?utf-8?B?Y0taL1FJcDB4RmNQWDlRWlpDYUV4Z0RQOXp5VGRUOEQyN1FibG5od2dNcTFt?=
 =?utf-8?B?M29lUXBjMU1obkhXKzJBd1dxUWpscENJQ0E2NTRWeFFsQWVxN0hOV3l4WklY?=
 =?utf-8?B?bGJxN2dQZm5mRjFhVHEzZk1ZV0tDcEk1eG5xKy84NnhLS1pTRDU3UGxXYjhp?=
 =?utf-8?B?Zmd2RHRpYlF6aFQ2NVhCN2syWXY1VDlIQVRHL3NzdFlYdllzWFFhTkpwVGo2?=
 =?utf-8?B?T3VDU1R3NG5sZEVRM1NKVndWUHdkTXhqZjUrWkpuM0xHKzZkSkVGdUVldzAr?=
 =?utf-8?B?R3k0TnZOcEVYWVlDekIwUTNqRVo5a1lzeW1rWGk0OGNiUHVhS3BOVVhoU3FS?=
 =?utf-8?Q?t+wY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a226777-9279-4e89-19a4-08dda2a44d8c
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 13:41:11.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4xmscbzTmp4D/krVIfh37u0pWnzZK/VOhmaJ3kwdaMGK5/0AXPwJFMwHlkGC1c9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8163

Hi Reinette,

On 5/29/2025 3:58 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/29/25 12:00 PM, Moger, Babu wrote:
>> On 5/22/25 23:41, Reinette Chatre wrote:
>>> On 5/15/25 3:52 PM, Babu Moger wrote:
> 
> 
>>>> +/**
>>>> + * struct mbm_evt_value - Specific type of memory events.
>>>
>>> I am trying to decipher the terminology. If these are events, then it becomes confusing
>>> since it becomes "these events are used to configure events". You mention "memory
>>> transaction" below, this sounds more accurate to me. Above could thus be:
>>>
>>> struct mbm_evt_value - Memory transaction an MBM event can be configured with.
>>
>> Sure.
>>
>>>
>>> The name of the struct could also do with a rename to avoid the "event" term that
>>> conflicts with the actual MBM events. Maybe "mbm_cfg_value" ... I do not think this
>>> is a good name so please consider what would work better.
>>
>> I can change it to "mbm_config_value".
> 
> Looks good, thank you.
> 
> ...
> 
>>>> +#define NUM_MBM_EVT_VALUES             7
>>>> +
>>>> +/* Decoded values for each type of memory events */
>>>
>>> Please be consistent with terminology. In the above lines it switches
>>> between "memory transaction types" and "memory events".
>>
>> "Decoded values for each type of memory transaction types"
> 
> I do not think "type" is needed twice. Could also be:
> "Decoded values of each memory transaction type."

Sure.

Thanks
Babu

