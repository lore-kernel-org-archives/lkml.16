Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2DD19F10A;
	Thu, 29 May 2025 16:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748537913; cv=fail; b=jRoDuC4JNXRbUT4a9yalbaGUHi4QKIDsxkxnolD6VAGc1ctNQRwc5o02sjFx49gEUIDkSAcy0yxyJSXxnlwp/f5XUGixNsePVy/zb8BpVHWqMI8ewXIGToArDKxSaKEayY4MZnTRcUAQsIkc1sHRsgZBco2UoJ7LB5NwunokDsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748537913; c=relaxed/simple;
	bh=kte8MYReXcxHKJLkypQrIINcTz27gvPkYNfan7NCLAQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VyL0IKle06BpfPSZPA+WSV1+RIwNRiNOkzb3lFawnlQ+2CnkcbyO1CSvs9UoBEJga/tkjQUbf6jmTqMxJoxkMwiRnbQFVTSEdkmi1erXWwlknRtNP/nG2DZZmaXUIXEektFhuEBFOy0YXIHTelk9J1busb/oB4GFHl1m+fPjv20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uyN2gy5X; arc=fail smtp.client-ip=40.107.236.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uyN2gy5X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qoxVlvKx36LOAsANoCu3hzPXTcYWGH9+7EG9nzCTYPL4KuFU1O1VDCIh1mgIyDlT/08gzgWLZ/zzm1lAXGqn8gaHQZoGL9bTPF0Xb4z1cllXE118aEV0yAQ1sx2h28E6b+PVQOcpi6ZXIEAzuv4z/o5Yhc4YBYzImLECWMl0Km5eeqo5H06lw8q5J7M9Itj6Ux5Hgq3d+HHdJsMt2zW8OTDlE6tqccPFV/6tRm3Bj//bgfRCBbH+K1tf9+PDTEdz4Tb9cIFwwIWarH4hoLD3HtbC5ekMkBmB5DdyOMsNbWKI3S5xXLEQwNHz+3he6/XyzSPIKtkyAaPtuLjPuA/O4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvgI8c+7WV86z9ePmOk0GzJ5Fc7cfiYWL7b0IUrOM5A=;
 b=Ep2qFDUgen698qNEalME2omCY2aWnHbG/TB962XQDI57OzK0UHB4+t/jWCqJMxlvKc5XaRmw8drS1mmPfIClPX7VZ2Uz32DzuBDY6HV/FBrMpEUb80Eb0An9/xGY1HJw2zlPYU5RGpYD5JkTdQGWyRaK0ukb7uWaphgHUZqhi8YvfC/bWy/oIk+8iEtwhKJv3/7Rf65qrnMKKMszoRT8PpXWlthfKsjPHtqhsYhDULzQZiqhtEINmFD+IXkEVNiHLW50x9xghXCDKPBlW7fiwBnsOwzhvNiJoLUDYoHX3m/d58E5Jz8zsHgsmHBR3wayJcAECvndFx4LsbC1GxdToQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvgI8c+7WV86z9ePmOk0GzJ5Fc7cfiYWL7b0IUrOM5A=;
 b=uyN2gy5XGT9vQc/rvvnSi/s77DP9eO9G0xzLSVhyt9Uyvd1EyFyDlyfj8FVmn1zG04iKUz+S3iBE3W/Cm/pMuuxIBHklbMW8xaZ6+0MEDJ61abNq9I2EWPapFGTiB+GX2WbVvyc7R8583OMd6rS4vHF6Gu7OmYNZlfALm48Lwa0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 16:58:28 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Thu, 29 May 2025
 16:58:27 +0000
Message-ID: <8e0ee203-78a3-4bb4-ba7e-d5a886d6eff5@amd.com>
Date: Thu, 29 May 2025 11:58:22 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 15/27] x86/resctrl: Report 'Unassigned' for MBM events
 in mbm_cntr_assign mode
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
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
 <df408cca8a500713b8a7e49ed5a95d9ccc54c48e.1747349530.git.babu.moger@amd.com>
 <a2c09a35-6d47-43cc-b014-a834277de591@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <a2c09a35-6d47-43cc-b014-a834277de591@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:5:333::34) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BY5PR12MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b06f5a-f802-4695-0028-08dd9ed2083d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkxEUjNoK1gvNU52M2ROUW94TjBmNkZrVmdnVi8vNzB5amtwaHJDaThGeXd5?=
 =?utf-8?B?dnFBQ3NKWlZlM3NUK2dEVm50c0M4WnFtK3ROeXJlamN5dzBJL2QvSGRlZ01V?=
 =?utf-8?B?SFdGcDluRjFoL1BFS0J2MVZUVnhGQW9nd3h1eWp5ekhqaUtJa3NqZG9GVjFm?=
 =?utf-8?B?SjdxMEVDbi9GZEFiL2s3dUI2RHRyM0NTTllmUDdUSnhiMzcydzEvY1MzeDhY?=
 =?utf-8?B?WnhpeERmSEtUQTF2OENTd1A0c1ZsTVNKN0RKZnZSZ21UVndQTmQ4Mm82ZTdm?=
 =?utf-8?B?WVl0ZUU4NnZUY1l2OUZTMDRraXErd0RqTlZ2eXQ5MHArMVJkY3ZCdVhiSlhw?=
 =?utf-8?B?dXVLOUJxRG11Z1UwU0haL3FCbU9yemkrQlRTTUJzUFdJaG51d09qTzBRTVhj?=
 =?utf-8?B?dkhTL1hvK2UydTJiV3JQaUhicUlYYnJKM1NGZ2JWM3lqbFI0dXZDZEJhM20v?=
 =?utf-8?B?d3hqbnNnMjNYVlRxdEpWSjEybkxmQkJJeWtHQk5GcURyMHRJYUVBMEdYd1BH?=
 =?utf-8?B?TTBXS0lRdFJvUk1GV1Bnbkw3R0M0NmRyOFUwb1NWUWFTeENINHlnSXhZdUJZ?=
 =?utf-8?B?K2xCbHBydFEyUXJqV0xSNGFtQ1MzNjlURXNnZmVxWVhNb0hvalVQQnJuYzE0?=
 =?utf-8?B?L20xMlRxVTlFTklaNTV1THI1QlVqOFpQQm9RVDF6c25wcndkaHZYVUJLY1pi?=
 =?utf-8?B?c1NKa2NNeXVsdTdxcFdTQS9IQWFVclpHUUljdGtqNWFCeDdQMWdFSU9yVjZH?=
 =?utf-8?B?VFJJVWRhZWFIa3dCb3dZdFlBTjVzckhZbHZkeEVGZVc2aDlubDlvYWc0Vllw?=
 =?utf-8?B?Sk9BU1M3VkFTNFRZS05GbmJ2MW12VEg4MEtaMkVPUVRkYThycm1sVmpHRW9O?=
 =?utf-8?B?dEdqQ2VQUUYyYzI4eUxJV0NncDhLbGxPY1pTZHM0L2liVDJhbWdpZmFLelZp?=
 =?utf-8?B?N3p6RkVQSTlWd1p2VVVnbVVTQjZkbjA1MXFZb3VBZ3VTV05FRkxMbUkwR1Fu?=
 =?utf-8?B?K2JLOGdyT3F5RDdKYnhHTFUwRy9EMituME9RZFJ2TDhCeTc0M085dDluZXZ6?=
 =?utf-8?B?OGRyODdBMExuLzFhdDQ2Z2g4cFVoUXF6R2J1QURxQyttbDRGeEdQRFdsc1py?=
 =?utf-8?B?NWRWL0pOa2hQUlFXNEkzU01sNXZ4d1JzazZaU2NrMlJZdDRraFBuOTYvbCtM?=
 =?utf-8?B?Zm1ZZzM2bi9zMEFGUWVPYTUxZThHRklGVVFrN0tCUGM3ZWZWL0Fob1B1TjU1?=
 =?utf-8?B?UVU5cEU2SkhwalBoelA0NzNMcm5CWGY4NHRvejg2OXk2anBNYmhway81YXR2?=
 =?utf-8?B?ai9UR2laV0QxdjNWZGtVT3oyMzBudUh0SS9IS1FsbDhJVngvZXJ4YkpPV0JV?=
 =?utf-8?B?WGlwZHB1ODgwYzNjWVk1YytUM295dXpjOEtnVzBxaDhZZzlURGdlZG1ZeXJX?=
 =?utf-8?B?UndEZzMxOEY3VXdWK1czT1dIajVZMHdxZFMwWEJiR0R0RWxDMFliRmdVQkdP?=
 =?utf-8?B?d2V4enRkckk1QlJCeFlPR0tuUk9IdDBoZUdzdk5BSExJa1JiMzJhRUxVUDBG?=
 =?utf-8?B?WHhlQVluQy8zb2lIbmt3MkZRVlhMdkd3UTBBeUExTnlvZlUzbWhsR05xckta?=
 =?utf-8?B?emQ3cHdFYlZhRWtVOUxBTDVIbVh4QTF3YlZKYVBFYm5paHdZa1hpZ09mWG44?=
 =?utf-8?B?S1JBS0hyQ0VuQnFBRlZGV0tiamZoNjJYT1orblFlY2V0a3FaeFZvdXk5TjR4?=
 =?utf-8?B?dk0zeUtRU3lQNHZJUHdBdFp1YTFNWC9BeHJFR01YN0F5UTJzRXNSR2tha3Vz?=
 =?utf-8?B?NkgwaklSNk01Q2hKeTFheTk0Z1hqL0tqNTU4SDgxNXZZQS9ac3JLenhlS2hK?=
 =?utf-8?B?clJubkJPN1h5S0dRTW1RV1ZRTHVLeUZvNW5oYlQyRzNONFVmQkozcStNcVd2?=
 =?utf-8?Q?s4TlMrepcAI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjExOE1zbTUrdW5pWUNXUDJCRThmTXdKYjFxWmdxT1pZejN4bjhiV3lKek9t?=
 =?utf-8?B?NWhMa3lsZ2NTNGJvSjNhbUh5bGVoWDgxa1g5VWwzQ2JSazhyMGNjMDhZY1d6?=
 =?utf-8?B?V2lNb2lJeW9jSFZLR3JGaENFOVExQjYzczZXOHJMWS95NHFkS3JqTmR4am1H?=
 =?utf-8?B?TEZOblB1Sys0OE9Ka1dzcEdVN0NmU3kxRzBIOUxsc1lEcExtZ0NsYmlJakFl?=
 =?utf-8?B?dSsrK1YyM3pHZDlUZlVhUWs4cVVEQkNUUHpvU1BvQ0VXdmEvdVV2dFhobm1C?=
 =?utf-8?B?aVUzYS9FSzIxdmJCRXMzTUNPalhBNkxHTzhVOU4vbGQ3RERrN1hsVCtNeUJo?=
 =?utf-8?B?d3BpVmU2OFJoRlJseFRIdWJ5ZnRRVHRrYmlzekVnYm9XQ2VLdm1pWDNlUU9D?=
 =?utf-8?B?MkhVdVk0QUdoVExyNi85eW9BdVBxOUxoMGJ2RkNwaEpOWndjOEFxM1BTS0ht?=
 =?utf-8?B?dzA4cFFrb200djNWVUE2RzQ2V2Q3dll3QjhYc2JOWW1ST1Yra3NzZVlFMVRK?=
 =?utf-8?B?dkdTVjFueE9DMEJDS1RobXBkZVRSNTQzcm9mRTVpbXlwdVBnZkljTkpkdk1S?=
 =?utf-8?B?UmJLbzdEdlRsOXFrTDBXMy9GMHVEejFyT1pDQ1cyTUFveWxTL3R5cGo1UXE2?=
 =?utf-8?B?c3hzZndTWVNsS0VaZ25EQkJlVEpWZFh6R1lMUVB0UXl2b1dnNk9PY2NmUExZ?=
 =?utf-8?B?TTE2L0lnbkVzaHdFek1GcllYeXZ4SHJseGZVcXczQ1l4QVVoZ21yU0Fzak1l?=
 =?utf-8?B?UjhUbGFPcC9nY2txUjBPWHgzUERTL01TSVlzQ2xqUHJoNXh5cjF3dDFQYTRV?=
 =?utf-8?B?alFwU05mb04yREc4d1JjR2o2bVpVcUl0bCtlM1F4ZVArdmNTK2pndVQxUzBn?=
 =?utf-8?B?ME9STlZHTUhFSUFBeXlMNVNGVy9iWnJROWcrRXVBckg4STU5N1pSanM3Yiti?=
 =?utf-8?B?WmFyN1FISU84SmVRSTFhN2MwQksyY2hQcDRuWWdpeWZBZjJZaWtKNklZTVJL?=
 =?utf-8?B?bVRBcUhRcHVwM0VrN3djTnJWMFQzL0l6QkRUeGpleFhmZFJQeHpIZWtUaUEx?=
 =?utf-8?B?bTVQYzB3ZkFXekd1ejFPT3c0enMwVDNIUW1EdUsvYUlaZmV5bExCVnNEMGp4?=
 =?utf-8?B?ajRNNUNGS1RuY2pUSGIwRnFDVnFxNjNIR2tyTmlRemllQ2h2VFZ1Q2pyblVD?=
 =?utf-8?B?eE5GWllWVTM4VjdpbTF5a21tWVFwbnpIbmVSTWExNkZabTJmNXU2RThZc3Zj?=
 =?utf-8?B?R3JRbXkwQTBXcFp1Nm9GUm9UeVlJWGNxNzluS0VNbzlyUURITkF0dHRTOWhy?=
 =?utf-8?B?bXE1VGg2L01RMklldGFnc29XREQySkNIVVlGV1BRNG43KzRxczNxZGVyT1M3?=
 =?utf-8?B?aU9FdEdpb3dhRTZmTlVKbmIyN0JyQlc2bjk4dUU1eWFRajd2cjluTERWV0sr?=
 =?utf-8?B?VHRnQWtmd3QwSTBLQUMzZkY1azRWaWNveGxObFRBVEttZHRGQVVaZkp4UkMy?=
 =?utf-8?B?bkIwQXlZRGNEK05VaThtMmtNWTUxUlFLbW5iU0pRYU1UMDZVZGxPSWxSWWhZ?=
 =?utf-8?B?aGlhbHFyU2d6OHErSFNES0F0RzRIajFtVUludnF2T0MzOHd6RE9MRngvMmps?=
 =?utf-8?B?WTlWMm1VTjVnYmRFVm1OMEhscHBhWFk0QUJwTnVNYXBUQjNMMnVISFhzYVRY?=
 =?utf-8?B?VHo1aGM1Uit0azhHYlJNY0JEcnFlaUc1RGVxMU13RU84MXNJdTNUUysweHBa?=
 =?utf-8?B?S2k1U21hSGcyem84Y29wRjBlOHp5cncxbWROTVBNSTIrUitHQitWbk9PTy84?=
 =?utf-8?B?akVZQ2Z3NUVNUW9RVjB1YlRFRXppSW5GRjlpK1pSbjlkU1pVemUrZVBrU2ND?=
 =?utf-8?B?dDVSYWhocDliRnc5c3h0MzhBRGkxOThXWmdOeG9lRXFEWXdEc3Q4R1d3NEFu?=
 =?utf-8?B?cDlkR29jdFlUOTNFa1ppTmxUc0JIWXZINmc3Q0hvOVBHak42akEyMFI2SlRv?=
 =?utf-8?B?eXJzcDF4Um9JNlBUY20zOEpod2RYMzBFRVJHK1R0M1kwYUJ6TXJONUhSeGdn?=
 =?utf-8?B?OC83WFpNN09TWncxMzlmZitqK2hFYURselBUQ1JvM0VxTm1nb05OSEJlVU5m?=
 =?utf-8?Q?DD08=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b06f5a-f802-4695-0028-08dd9ed2083d
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 16:58:27.7456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpYu1pfxTefwprdNPAGenbUQNkkAgxwS/s7wlaRi03RO04vfaAEEXifs48YlR0aH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132

Hi Reinette,

On 5/22/25 18:01, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:52 PM, Babu Moger wrote:
>> In mbm_cntr_assign mode, the hardware counter should be assigned to read
>> the MBM events.
>>
>> Report 'Unassigned' in case the user attempts to read the event without
>> assigning a hardware counter.
>>
>> Export resctrl_is_mbm_event() and mbm_cntr_get() to allow usage from other
>> functions within fs/resctrl.
> 
> Please clarify that these two functions are exposed differently, resctrl_is_mbm_event()
> is added to include/linux/resctrl.h (also note similar change in 
> https://lore.kernel.org/lkml/20250429003359.375508-3-tony.luck@intel.com/)
> so not just exposed to fs/resctrl but instead to resctrl fs as well as
> arch code
> while mbm_cntr_get() remains internal to resctrl fs by being added to
> fs/resctrl/internal.h.

Sure. Will update the comment.
With Tony's changes(
https://lore.kernel.org/lkml/20250429003359.375508-3-tony.luck@intel.com/),
the resctrl_is_mbm_event() is not required in here. It is already there.

I will have to update the comment only on mbm_cntr_get().  Will do.

>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> 
>> ---
>>  Documentation/filesystems/resctrl.rst |  8 ++++++++
>>  fs/resctrl/ctrlmondata.c              | 14 ++++++++++++++
>>  fs/resctrl/internal.h                 |  2 ++
>>  fs/resctrl/monitor.c                  |  4 ++--
>>  fs/resctrl/rdtgroup.c                 |  2 +-
>>  include/linux/resctrl.h               |  1 +
>>  6 files changed, 28 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index 2bfad43aac9c..5cf2d742f04c 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -430,6 +430,14 @@ When monitoring is enabled all MON groups will also contain:
>>  	for the L3 cache they occupy). These are named "mon_sub_L3_YY"
>>  	where "YY" is the node number.
>>  
>> +	The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters
>> +	and allows users to assign a counter to mon_hw_id, event pair enabling
>> +	bandwidth monitoring for as long as the counter remains assigned.
>> +	The hardware will continue tracking the assigned mon_hw_id until
>> +	the user manually unassigns it, ensuring that counters are not reset
>> +	during this period. An MBM event returns 'Unassigned' when the event
>> +	does not have a hardware counter assigned.
> 
> (please rework based on "event" vs "group" assignment ... not intending
> that "group" assignment be documented but the "event" assignment needs
> to be accurate for "group" assignment to be a simple extension)

Sure.

> 
>> +
>>  "mon_hw_id":
>>  	Available only with debug option. The identifier used by hardware
>>  	for the monitor group. On x86 this is the RMID.
>> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
>> index 6ed2dfd4dbbd..f6b8ad24b0b5 100644
>> --- a/fs/resctrl/ctrlmondata.c
>> +++ b/fs/resctrl/ctrlmondata.c
>> @@ -643,6 +643,18 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>>  			goto out;
>>  		}
>>  		d = container_of(hdr, struct rdt_mon_domain, hdr);
>> +
>> +		/*
>> +		 * Report 'Unassigned' if mbm_cntr_assign mode is enabled and
>> +		 * counter is unassigned.
>> +		 */
>> +		if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
>> +		    resctrl_is_mbm_event(evtid) &&
>> +		    (mbm_cntr_get(r, d, rdtgrp, evtid) < 0)) {
>> +			rr.err = -ENOENT;
>> +			goto checkresult;
>> +		}
>> +
>>  		mon_event_read(&rr, r, d, rdtgrp, &d->hdr.cpu_mask, evtid, false);
>>  	}
>>  
>> @@ -652,6 +664,8 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>>  		seq_puts(m, "Error\n");
>>  	else if (rr.err == -EINVAL)
>>  		seq_puts(m, "Unavailable\n");
>> +	else if (rr.err == -ENOENT)
>> +		seq_puts(m, "Unassigned\n");
>>  	else
>>  		seq_printf(m, "%llu\n", rr.val);
>>  
> 
> It may be unexpected that this is treated as "-ENOENT" but the function returns
> success. This can be addressed with a comment when comparing the return codes to
> other hardware return codes.

Will add the comment.

> 
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 64ddc107fcab..0dfd2efe68fc 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -381,6 +381,8 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
>>  int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
>> +int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
>>  
>>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index fbc938bd3b23..c98a61bde179 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -956,8 +956,8 @@ static void resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d
>>   * mbm_cntr_get() - Return the cntr_id for the matching evtid and rdtgrp in
>>   *		    cntr_cfg array.
>>   */
>> -static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
>> -			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>>  {
>>  	int cntr_id;
>>  
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index f192b2736a77..72317a5adee2 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -127,7 +127,7 @@ static bool resctrl_is_mbm_enabled(void)
>>  		resctrl_arch_is_mbm_local_enabled());
>>  }
>>  
>> -static bool resctrl_is_mbm_event(int e)
>> +bool resctrl_is_mbm_event(int e)
>>  {
>>  	return (e >= QOS_L3_MBM_TOTAL_EVENT_ID &&
>>  		e <= QOS_L3_MBM_LOCAL_EVENT_ID);
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 59a4fe60ab46..f78b6064230c 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -441,6 +441,7 @@ static inline u32 resctrl_get_config_index(u32 closid,
>>  	}
>>  }
>>  
>> +bool resctrl_is_mbm_event(int e);
>>  bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l);
>>  int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
>>  
> 
> Reinette
> 
> 

-- 
Thanks
Babu Moger
