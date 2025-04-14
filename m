Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4922DFA22;
	Mon, 14 Apr 2025 20:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744661569; cv=fail; b=WLFgGB6H//CtDKktlsHWj1Gkiw5BHuSz0op/6AAtV2V9FbU/CRzwHOE1fSKZBgjVP0Dkh2dT42+g5yjpd7w97D2GjmvI23LRmGN0shRidsOL3yw5kGN2HXizhymYvkGiO8ilkUp4pwh3UX+0EeF4FeZE9aRIfJcds0qWUbY0dr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744661569; c=relaxed/simple;
	bh=dFPaEoiNm1PaH6g+YijfSGl4gtJGIqnHZawKGlgHZtI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jXRkinEdIUwYSiPV6nJikCz/SXHEVMX9d7I1FdyGv3oU6E5rpIsW8v9HE81emQCnhuekfIyyhQNs0ZLlIeGVFM+bpqTsfxelXIJQ+6bg3gGt9xcBJ1jmhWt4vm1OErBBeIdL+F/oCb8yUEZeeXbRg9OIFlor2e/DouiY8kHKir8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2WWrsNpQ; arc=fail smtp.client-ip=40.107.237.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2WWrsNpQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/OcJZV0iolbzclglHZpazilUGVioEXagPKX9aKysGQzZOi55JNCB86Id++9u8+Rc4S+OUZ1gsoXzdYimiXLoWgTarJQUOFyRArUDVyLpLhJ6mrS2gqmBZPLVyClt7n4cjx4kOi4n66RHU2nNpX6n1nso8DTj4EpsZ/t0Soc+7lig16WNzrUGxlBw39m4D4srNfjtCfW0XrTx81I+QlVH86qn/n2gOW4Q/6Sm4Yr9UK+1rnw6m6OYWyAmFbpbtM2vh9oPh0jjqOg2LkhWrWPYUtqk0w8EZswaswuLU6RKGCmlkT5VZU+A4b6Sd35+eJNFG2Af93ivF2zyyxUu1Q93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJ1pdc4fP4/WPWBqm21cPptFwRt1FQ8at+ftsnpgnNY=;
 b=mSJIlZ9de7nfLSw0pmKor9xNEomaNwXARgMUlm749qrOSbFkm/39osUWW9la2qpEJwnJigsT2LiXQgr3LegpPxM7/cF5FoqQBVfIFjOTDpffINw5HztpH8j1rjmCXJ/lx4w6c+3d0AZqvAUxFSkEyIv+mtvSBQw0hezvMWsH1C9lZDODroUxsHnFu8PAe/ftN8qeoyS+gvGEL7MUeqCYJBmXi46X0XwxhOzNIlMMK/3EiQj2ZJsYpWFAKQ9gXwoNeZKrIG8kCtlOCutbpgg9NR6NiSLfCaLHhCMYkqWfSVp3PP3ChhWJTBA4CgojKozIjL6MQ5aTM/MAtoOt0jKZ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJ1pdc4fP4/WPWBqm21cPptFwRt1FQ8at+ftsnpgnNY=;
 b=2WWrsNpQEag/Ys8iWJDa36UfsBgSVLZs+2bE+a45Kgyi7u/z/o1FX+iFIuetTdR8V0PlQ+j48NaIgx45l5MU0DgUweGVGMAoX5cefyU8M8q2+ru8L0YsfO8leQL7+y/UG2Z4ngZ7WFXTDtWtasPdF0LDvD07qrYHzi/iCMM9EFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SN7PR12MB7299.namprd12.prod.outlook.com (2603:10b6:806:2af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 14 Apr
 2025 20:12:44 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 20:12:44 +0000
Message-ID: <d9f58494-4561-47c6-b87b-44e2853bf910@amd.com>
Date: Mon, 14 Apr 2025 15:12:40 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 09/26] x86/resctrl: Introduce interface to display
 number of monitoring counters
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
 <e27c71eddda5884e9dd3bbf28c53be8a5b78f62c.1743725907.git.babu.moger@amd.com>
 <c149c6f9-cb72-4737-b4e3-34ee990fdc9f@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <c149c6f9-cb72-4737-b4e3-34ee990fdc9f@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::12) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SN7PR12MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 9098d0c1-bf00-4966-7fbe-08dd7b90b7a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUpOV3A0NFh5SVJ2ZWpHbmJtYXRBZHp3di9lcnRYaml5Z2tuSFJmUEtLVUVE?=
 =?utf-8?B?STVYeTVIdXhGL1lLWm1ZbnJpam5UdktWaFJCUjVLRmNhekpvb0V1Mm4yRDBT?=
 =?utf-8?B?cCtRcVBLcXN2Tit3WVJrSWNOQmZDTGZzZmI3RGVnTzJnL3p0ek5aUktEVjk0?=
 =?utf-8?B?Mld2c2s3cVpYUUpRMkg0Zi93V1pjQ3ZrWEJZYlB3VmpXVktJckVicGEzUzV4?=
 =?utf-8?B?UUxvT3NRZ0Q4Z1dhdU9xYkpIZ3pnbXlDbzJVRTI3ZjFOdjZzZmh4ZVNnNlVM?=
 =?utf-8?B?TjZlKzVkL1JLVjhRV0NZZDZBYk1vb285N2hhOWZrd21oMFNnTlN2ZG5BWlRt?=
 =?utf-8?B?ZnNtc1VJZzAxUi9ORjhDUmlTdi9LL1lPemhlVWpDSXJIWXpmaFJPZlNHL3E5?=
 =?utf-8?B?Vm9abmZQMFp1RE1Bc1BWMGkvbXVEa2R4cU8vcUUvNXJTQ1BseFlBVXhTRXJa?=
 =?utf-8?B?ckIyVUJSaE9ZRmcrdm9obXkyN1ArQjFJeUlPSHRRVzEwNXVDb1lJOVQ1UEZW?=
 =?utf-8?B?N055UWZ6MHdLbloyTzdwRGRqZXRielNlQS9Ha2NUckhldysrblBMRFQ3YVho?=
 =?utf-8?B?UkhieUhDVGxqdnd4ZG90MTFXRzJrYytoSUU1dXBsM25jZktjbktCN0cyVEtQ?=
 =?utf-8?B?a25JbG5aOVc0QXN1NUJxZ1piNjJ3WTFCZDg4NHBGVmJXY2lGa2txM3MwMEs1?=
 =?utf-8?B?N0E5Q1pDb3Qzcm9Rei9OakducFBPTnhkRStLaHNNTmhIbm9qVS9uZWVUSDZk?=
 =?utf-8?B?OU1DUDdKNDcrdkJtc1dpUUNjNXl1VXc0dHRqUU0rWVhOSk83UFBMMzB2OVhK?=
 =?utf-8?B?NWNLMVdmTlRIbTNkamFyM21XSm05clBya1Rzb054QWpJVmhtTkVKa1VQUWlm?=
 =?utf-8?B?THl5ekhmei83M2RaRzBMaWRGa2g4MWs5d2ZPVkozMEwrbDNYZ09IR0tXSkFL?=
 =?utf-8?B?S3V0YllIQnczZzM2WFZNRU83eVAwTW1aVEg4S01OQ3JKTWgrVjJwUWZmdGZ2?=
 =?utf-8?B?S0ZrNytDdGc2Y2gyZHVGbGJNSjh0V3lLOXlKcldmeHIrelJBVWs5aU1rTXo4?=
 =?utf-8?B?WXZhbyszdVdrWFpIWXYvbnU1WkdiVUxNTytjNS9LQ3d0NjFGWTl2WTFyc09l?=
 =?utf-8?B?TGt5M29DMXFvaU9JYmxBVk1jbThLTVlFd2Y5VG5DbC9YTGQyUFZITU9kRDZM?=
 =?utf-8?B?U01iandCdEtpQjFacnVSdVU3VVZvRTdFRUdWbFUvTmNUQWg0Snc3SEpvOFdB?=
 =?utf-8?B?NTNSMmI3Q05tNVM4OG91Qy85U3JWYzFqZTJqN3hQUDl6bS9VbFNRbzlaRGZW?=
 =?utf-8?B?OGo1VEkzZXQ4THB6VWw3bDgyRm9xQ2JUTExlV1ZzYXNROXJ2aCtZNjJYWGNz?=
 =?utf-8?B?Q2V0QmFhSExpZjJlK04wazBSTTBNRTJ0NjQ3NHlSQkFod0JMTFYzM3JVQnJa?=
 =?utf-8?B?S3djYnp4MnZYTnlxZjZOU0FoNVUzZm5jUXZDRWZqcTM0Q3FWRW1SRzNDcjlE?=
 =?utf-8?B?V0llUkk5akFSRTJjSWIzTmJIb0RwL3pwSWhEU0swZGVnN2p6UTVMN1UwU0FQ?=
 =?utf-8?B?OS9aNzNEeFg1N1NnYmlSc3FMNnB6VGtnQW9sWFltdE91OHBDM0h0TGtuR3JP?=
 =?utf-8?B?aGM3YVhtQlZmbm14VnNpNFZXVE4vdHdkNEE5TitDZlN2MDBJRmhJa2Y0b0wv?=
 =?utf-8?B?aWd3c3V0Y2ZzcUM2OHI4cTJITWRXWjJjNkhTQVdUanp0UGQ5SkFzK3NNWGpz?=
 =?utf-8?B?MmtYR0d1dFU4eUNCOG9EcnAweGcyMXk3NWNmUHJWRUF0aXVERFJxeUlzVFM5?=
 =?utf-8?B?M3RhOHRCUkxqUGFBUnZ6eG5YcEpzWWNqNGY0OEE3dU56bWFRNmk3QVBlR2dh?=
 =?utf-8?B?OVRWTUNMNVQwbmRxWGFpUGxXa1lYbmk5UjQ5UjBWcDFRSkcrVjJlUGNqdXhV?=
 =?utf-8?Q?eWka4A2e/N4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czNGOGtDZ3RmNGJzL2VaRFlZU0JhckMyei9TdXFKNnU0TDA0a09nTHNjUFg3?=
 =?utf-8?B?QVB5azJNcVBWVHdhWmVPQmRnbDFKUjlFZStISU5pc0MxeFB6V0ZKcXduQXlv?=
 =?utf-8?B?b3dRYXZMbmVzTVZNejY1UkZJVmwvenBVMktvOHlRQnlGSi9DWU5TQVdBRXl3?=
 =?utf-8?B?OHVrSk0wMmZTcERMR0lOWDAra29Pcm5CZkFyZjRDWTZtbmJoazFiaDdVLysx?=
 =?utf-8?B?RW1jdDcvbHZHUnpVOUhDNzZ0MXpkKzhEcFZoNThWVjZQdE51NmVoSHJYb3pF?=
 =?utf-8?B?a0tLczllRU5jbk5XdlRPM25KLzdZbEhXcVljWTBPRGYwdllzenFpM0xDQUVv?=
 =?utf-8?B?VlhObkZKVE1MNHBWQ1R0cDFmN05QQnBQK1RjeGhycHFieis0NnUzT0lEOUtG?=
 =?utf-8?B?Q0NJYi9uR3poMzRTcVVGcFVtdXNTQVlxdnRHUXlYb1hlcmFtTDFVKytKZFc3?=
 =?utf-8?B?QXhBb1l2WFFKaUJGTnlaV0hSUlZuMURVNjNSdFkxTlFpV09YZkVpQ2RtaStS?=
 =?utf-8?B?RE5JcDZrMTNIdEhrNFFOWmtibkpyTXdXZk5SSHBxNUppYXdNejdyZW5BMzZT?=
 =?utf-8?B?cXd5K1FlZ1M3TFhHWjVrQ3c3RjY4WmwrUGZkWDVPamthOG5DakxpbTB1V0hX?=
 =?utf-8?B?SWJQVHRYYzkyaGxUZDRuTlNoMHFaZjk4Z2x3aGRNU0l6VmVaVlZycldaWXFK?=
 =?utf-8?B?WWlCMS9oZ3FzZ3JPcUdTdkdmOEFMRXFNMnBRWS9GRVdPSE5Kak0xMlFTbFBw?=
 =?utf-8?B?NXI2SUpDL1RvL2lDb1A0NEdGYURYNGo2L3hKK0dvWGtVclVmRThvY1RBUlhz?=
 =?utf-8?B?Y1Y3S2ZkTjVsRmgwYTB5ZlRrQnRMR1FxdWEwRUFzNVhSVlB1Mi91ZmlLbzNs?=
 =?utf-8?B?ZktJN0U2M1BpdUY0eDJXcndoM2d1NXZwRjRIcGlIRmh4aVlrZngzZ29OQ2x4?=
 =?utf-8?B?TERRZ2F6dEtBQi9wZnhlcGxOcWhGOHJMYlltc2VNU05IUlErM3Y5dFBoTEhP?=
 =?utf-8?B?N2oxSVJ6QTVRMDgvWnk3dU9acFpuY1ViVlg3M2pCditPcFg3SG5mc25kQ3p3?=
 =?utf-8?B?M2NIOElTM0R5QU5MZlBUZ2UrblVzbGJ3NXZIL3VWM0RoSnBVSkRocEt4QXU3?=
 =?utf-8?B?eHRVa014d1QzY1BDdXUwQzJPTGxVU1NOcVNyLzhoV2xpT0VrV2FXK0hNakhy?=
 =?utf-8?B?WkNZTjR6S0xWQ0dHQWZnL0UxeCtSNlM4NWI4bkxDeUFEUER6dkM5SHRTOXJN?=
 =?utf-8?B?MElYeTFiblFuMU5ZK3lSVGhsU1R3S1dRWk4wZWZFNjNZZTBNbkdjMFBYVi9O?=
 =?utf-8?B?RHlISlM4b3lqajg5YisrV2RnMGJMZDE2YnZ2aElRMTdMbEcvNnJLbWwwTzJI?=
 =?utf-8?B?WE80YlFZS1YzRkZyYWg3ZjB0SVl5Kzc3eVNxdzlUR2FmY1FTSm5hai9idGxv?=
 =?utf-8?B?VXRabm9uaU41Ky8wV1dvTm1abEw2cVJsS2hrNDFQS1NTZ0EyVG1iUVNvcHdT?=
 =?utf-8?B?RGdnRVgweDlGMTZmYzJiMktWR0FTdFNqbFl3NitTUDltT2thVFp3V05zSndp?=
 =?utf-8?B?TG9QVENGcEVaZ2hCci83R3RmWURhSGpwcGszOFplVXFqdzRMbXgxVjJ3ZE9K?=
 =?utf-8?B?MmVSQ2MxU21SRXpaMjFkNTNRSmJzWDB2Wm1MQWhVZzNjVXFTNWRiL3ZScm9r?=
 =?utf-8?B?QTFMeW0vNmRnWHBWYyt1c0Qxblo2S3hQaU9uMldDNlAyQWlSRzcyOWdBQk11?=
 =?utf-8?B?aDZtdi9KTWo1YUg4NDQ1TFVSSk5xeGNOZGpHWWpaNGh5MDEyKzYzZGhwVmtG?=
 =?utf-8?B?MDJySnNnaDVIOVJxd2Q5UTlGYThQcXdVUzBjS2N2UHZTcnFzRWZUZ0MxSzR3?=
 =?utf-8?B?TEc4cnNaVkNwRVNFdTNHN3Z1YjVtckNDZjlvdHBMK1BBMXUrd0NGU0RodVVD?=
 =?utf-8?B?UTJ2QjlMTGhlS3d3L0JWa1dCV0ljRDU2d0VqcFZUcEd4eHcybGs4SkNRUzNN?=
 =?utf-8?B?TjFNTDBLMVBzc3h4MnB4Zkp4L0hNWTVzYnkwVzB1ZG9qM0hNNEcrSXFQcmhp?=
 =?utf-8?B?eTM2OTRucG01WEJ0TzQzNkludysyVlNka3QxWnVST0syNjJRUW9LaUdPOW96?=
 =?utf-8?Q?ivwI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9098d0c1-bf00-4966-7fbe-08dd7b90b7a4
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 20:12:44.4482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvENczvVXg7ujui73SI9BxcBqmcoff4ESdShrMuyDeCSCsSXQIGsUwrzaKXSI1pO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7299

Hi Reinette,

On 4/11/25 16:01, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/3/25 5:18 PM, Babu Moger wrote:
>> The mbm_cntr_assign mode provides an option to the user to assign a
>> counter to an RMID, event pair and monitor the bandwidth as long as
>> the counter is assigned. Number of assignments depend on number of
>> monitoring counters available.
>>
>> Provide the interface to display the number of monitoring counters
> 
> An interface can also be a function. To help make this work obvious
> it can be specific:
> 
> 	Create 'num_mbm_cntrs' resctrl file that displays the number of
> 	monitoring counters supported in each domain. 'num_mbm_cntrs'
> 	is only visible to user space when the system supports
> 	mbm_cntr_assign mode.

ok. Sure.

> 
>> supported in each domain. The resctrl file 'num_mbm_cntrs' is visible
>> to user space when the system supports mbm_cntr_assign mode.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> ...
> 
>> ---
>>  Documentation/arch/x86/resctrl.rst     | 11 ++++++++++
>>  arch/x86/kernel/cpu/resctrl/monitor.c  |  3 +++
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 30 ++++++++++++++++++++++++++
>>  3 files changed, 44 insertions(+)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index bb96b44019fe..35d908befdfb 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -284,6 +284,17 @@ with the following files:
>>  	misleading values or display "Unavailable" if no counter is assigned
>>  	to the event.
>>  
>> +"num_mbm_cntrs":
>> +	The maximum number of monitoring counters (total of available and assigned
>> +	counters) in each domain when the system supports mbm_cntr_assign mode.
>> +
>> +	For example, on a system with maximum of 32 memory bandwidth monitoring
>> +	counters in each of its L3 domains:
>> +	::
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>> +	  0=32;1=32
>> +
>>  "max_threshold_occupancy":
>>  		Read/write file provides the largest value (in
>>  		bytes) at which a previously used LLC_occupancy
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index 6ed7e51d3fdb..028b49878ad0 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -1234,6 +1234,9 @@ int __init resctrl_mon_resource_init(void)
>>  	else if (resctrl_arch_is_mbm_total_enabled())
>>  		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
>>  
>> +	if (r->mon.mbm_cntr_assignable)
>> +		resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
> 
> Missing RFTYPE_RES_CACHE?


Please see my response here.

https://lore.kernel.org/lkml/4fc02936-237d-4060-86af-79efc28a72e5@amd.com/

> 
>> +
>>  	return 0;
>>  }
>>  
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 626be6becca7..0c9d7a702b93 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -912,6 +912,30 @@ static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
>>  	return 0;
>>  }
>>  
>> +static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
>> +				      struct seq_file *s, void *v)
>> +{
>> +	struct rdt_resource *r = of->kn->parent->priv;
>> +	struct rdt_mon_domain *dom;
>> +	bool sep = false;
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
>> +		if (sep)
>> +			seq_puts(s, ";");
> 
> seq_putc() can be used.
> 
Sure.

>> +
>> +		seq_printf(s, "%d=%d", dom->hdr.id, r->mon.num_mbm_cntrs);
>> +		sep = true;
>> +	}
>> +	seq_puts(s, "\n");
> 
> seq_putc() can be used.

Sure.

> 
>> +
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +	return 0;
>> +}
>> +
>>  #ifdef CONFIG_PROC_CPU_RESCTRL
>>  
>>  /*
>> @@ -1945,6 +1969,12 @@ static struct rftype res_common_files[] = {
>>  		.seq_show	= resctrl_mbm_assign_mode_show,
>>  		.fflags		= RFTYPE_MON_INFO,
>>  	},
>> +	{
>> +		.name		= "num_mbm_cntrs",
>> +		.mode		= 0444,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= resctrl_num_mbm_cntrs_show,
>> +	},
>>  	{
>>  		.name		= "cpus",
>>  		.mode		= 0644,
> 
> Reinette
> 

-- 
Thanks
Babu Moger
