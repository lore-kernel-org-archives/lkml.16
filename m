Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1770E1FB3;
	Wed, 16 Apr 2025 17:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823402; cv=fail; b=YGjmNCsUOTrjt866ZWIQ/nVp+v/7NQ7d3gf2Gd6yVihu/eKKea3lz6h9/lRIkMdZwgvGwfGzf9FLVriN+3YGfniccQkkQSwBysP4xxh920O7qA3bF1i/JueuwRK4LVmi+/O1eNTVuKQnV3K8cNB9bCz00X61NrvfbClthFL8Z5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823402; c=relaxed/simple;
	bh=SNsShttJz5OMdlB2yAqdpel7hhV9MdEHn8/tfADDmtQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wx74z//37uh3p5g+HOeVnJtiSIAKz0tL4hYb9OsxusLrt/ZehI/SbxNknFOPPCoJG5j6eYZQbBAzrjT/yECDqtrOxarQdaHQPbPsqzAlWnTrLYloiqZS5Cmp0SBjArFohPvfDqATTiqssnUpQJ7U/v9FVHzgj5zhtRdygSF0sw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CTVJledu; arc=fail smtp.client-ip=40.107.237.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CTVJledu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7RY/bJE/XfyN7ltH66HPFhSvH6wv/GanLNClsczM73V61n9kM2kybgKVy7e3Zp2Bf4mZQkJ/xEZltEAWy+8WuM9jcBOUGXNCiFQjjVcss7gkD28WSGXli2uBXsYrmG2oUCSCezq2GDohkh1M13tk+9I/MmX9VWyu8KunJ9D1ury91CMMSzP5YfWQD5Ko1df1n8bfGQrHUxI1aRRV2+hgOI7ImMYHzHgn2ZOMiWqro7WAD8MGWU13SRnhqJRPPYAngzu7mqk2BFL322yFO8B5qEykN43FpXtPPpafy7mTr5whScqVCb45jo7e1ZsVqyakjVpuVHZDs93snwqJyRVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3J0OTBqBtnw5iB3l1RWy17hzwOJpQxNi8Kad0AywH2Y=;
 b=KsxOI7UMh4F0KsXILlSmiQgPwL6IR/1j1VO8a7VEi6+0Nz73AY9UOcSZZ/jNTac/+tylw0RiqehTLM0iIhRmtjpUouDc7u7SH6jn3FdvLq5IpdAiF+y0KnhFjqvswydi3bHVdqh/HQOz+I0+zs/fzB4kb8XofzhdsoAS6nVl1o/HfK5rJBXv3Sz/i5M2Bjvh7LxtS0bdMyvCFQ+bDOCm8UfLTYS0uP6i20Dr0GMrpaYE8UMBH7fLcYtgQYVWUXd349XiHJRjco1TpiYTDFHGzvUtG1I/OXfB5OtJlthuu34kaU4/QuzjB51zRWP5LUk8NJ1vuBesm05pPZToOd4Ppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3J0OTBqBtnw5iB3l1RWy17hzwOJpQxNi8Kad0AywH2Y=;
 b=CTVJleduW1jrPCUvEsry8b2FK7dpsoPEtOtbHt4SnVgF1LJmSm8ucZcmv6O1HZtNOD6PDCOJKbEgULD8bQsedDqRk+f38bTAsBnxLZNPWu6IM8oX5V1NmlUrnywpPeHQnE2hBRfZUj8ezneiMsFWjScoWVoIII604ehfBvA+t+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BY1PR12MB8446.namprd12.prod.outlook.com (2603:10b6:a03:52d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 17:09:56 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 17:09:56 +0000
Message-ID: <b8ad6ebd-405e-4ce9-99ed-1658c3b94f73@amd.com>
Date: Wed, 16 Apr 2025 12:09:52 -0500
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
 <3d31259c-cac0-4b96-883c-6d2e8e427988@amd.com>
 <efa7aee8-d1f3-4d15-9a6e-09b19c296e47@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <efa7aee8-d1f3-4d15-9a6e-09b19c296e47@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::28) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BY1PR12MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: dd70d700-de84-4a17-fbba-08dd7d098309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTlhZ2o2OFhLNjVFakFDVW9qNUk5TklqOTFGQlBQa1dqc3ZFN2dSbGxZZ1BW?=
 =?utf-8?B?QS81eXRMNkswODFWRlJ0TG00czNhcTlMN2psd2NLRHhBRTMvTWpYcEVabSsx?=
 =?utf-8?B?WlErcUwyNGZxL01teVZRN3VwSm9uVHhxZVYvMnBoSndXQVUvSit1K21OY2hn?=
 =?utf-8?B?Q215cEpVaGpranM2c1Z0ZE0vS2UrYnQ0emhpeGZvSGRLalRQcGlmT1MzQ1d0?=
 =?utf-8?B?aG9YMmR6bUY4aW5VWlQyazFuQVBtUkMvSXdLL0IzV2dWYnkyZkxhRFdJNEdG?=
 =?utf-8?B?bUM5YUpnY1NrY2JPUmRnaWJBelF6YWVtVFZHbVc2TlRrdG03TTd2QzZoRjgr?=
 =?utf-8?B?ODFPaVZVOXFJcmJLNGpZelpvQ1h0WmhWaFFTQmFUdm9XM0ZidlNORlh3Q3Bp?=
 =?utf-8?B?TnppRi9xc0RaSXZobTFSVUVNVW8zRHNUcnZHVHVyTEZCcFoxaXBObWlVbnQz?=
 =?utf-8?B?R3dTY1pMOG9uaEpacGZNYU5NQ2hobmFMUE5JOGV4WThqR2lGTTUwUyt2S2NQ?=
 =?utf-8?B?Z0N4T0wzdFZpMmZrelhWRVNOL3ZqME9vQkl4UnhNSWxucjA0R0RSbUlRM2Q2?=
 =?utf-8?B?L0srMHpnaUdyL2d3WFZDTk51bEkvb1h3bmRSbnZoN3hDdUZRVWFmQlFxMEhp?=
 =?utf-8?B?NnB5NmNDV3pZY2N6WmVGTWkrd1hGRWRQYmF6aC9VdUw0WG5JU0Y1cEdXa1cz?=
 =?utf-8?B?cW5NdWs2UElYRjc0bXdOMHNzTkIycll2RG96aE11MW15T1RJd2N0UTdlWHIw?=
 =?utf-8?B?Z0NnclBzMGQveW9qckZmWjJJRXVsN0U0QlNHbFVJeVdLYnJDRHFZQXd2NVFB?=
 =?utf-8?B?NEFQRWMveFJVQVZsRkYwb0IvU3lWUUI0cExXY1hsMHp4Z0NVME5ZcWhCd0dH?=
 =?utf-8?B?dFNtNVNUN0MyWjRZTXJoUUhHUk9nNy9zeGl3Mm96OEUySHJaUkpucVh0bGxE?=
 =?utf-8?B?N3Z0ZFJua1BLckVlZit6TlRuc0NsSVRrM1EyQS9hYWJUMitwcmJacGs2NGhN?=
 =?utf-8?B?Tjhxd0IxcG9PRFNmTXErMC8yZHB2ZkdTQzBSaUU4dzBzRHBCb3dYZ1BCK0Nh?=
 =?utf-8?B?czlGaVB1bkpiNmFJSGxSampFakNCZ2ZDZCs0K2RvWEtrWnhWMFpON0RLUUU2?=
 =?utf-8?B?ZWlkV042OVVCMVI0WUQwYUpYTVlxMUdOdXJVdldaVFZkeVBFbldOUVRtby84?=
 =?utf-8?B?VmVFeWVwMmhaajdHZzRPWE9mNzRIR0R5SjNxdXhBbXlWS1FROHpqVGovOHRO?=
 =?utf-8?B?YVFxMkwyWW1RVEFnYWJ3akQxc3FGeFJrOU9RQmFCWGFGTzhiQUNNelZjOEZw?=
 =?utf-8?B?RjNVc0NGYTU3bnltc3ZSczNxcFB1ZDlmUktRcDRDeDI2UnpRdzBPelpCbjlm?=
 =?utf-8?B?alFXWUVBVjNrMHNnM3pHUS85TmxLcFRYUTZhMC9ITDNGdTZnVXZVWEo4akdO?=
 =?utf-8?B?S3dyaEtrKytZOEFabE93Z2IyR0R4cFdCVlI1RUhBVWdWSW1ud1h5a0JMc0Jr?=
 =?utf-8?B?a21JcDNIVGpnSnpLNWxuL3loUENhNEJjRE9VUjErK3Q1MmRVYThWcDNqMW93?=
 =?utf-8?B?RDM1RmlSQkE0Y3VHMHVEVzNYWldUdGRTWVFpaWRFVE5ZQXpwRTFkRHA0TjRS?=
 =?utf-8?B?cEZaMU1SeFlsQ2E5dFRuTCtGNjFGQ0pvb2RsMC9Dd09mbFJWdHhPS1h4c09q?=
 =?utf-8?B?TVFEZ0NtV1NiNjV2cW5qdTJrOHBYakdwS2ZiVlpLOFM5ejBxYThTWDZMTVgr?=
 =?utf-8?B?T0t4aVZnMmhVa0cxYVZWSTU2QVVCMnZES3NlMDN2N0lERHFOOEdKRllsZEF5?=
 =?utf-8?B?ajV1NlV6b2M4YTJmK05wTzJjU3pwNHBreXZxZ1M3TytEbDV5RkRjOGVOQUor?=
 =?utf-8?B?QmVSZ1VNcEw0Y1F5VzJCaElob0NUUU5sdFZ2Y0JRWU8xSVVTOFJYWGEwT0Np?=
 =?utf-8?Q?aqXyIg6OZT0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDVGS3FEeG5FTUVhM2pRaE03anI4OGFUN2VnKy9DTXQ4L21GUDlRSTBYRFd6?=
 =?utf-8?B?cC9hQzJTQ3dVZ3BkY2VieEo4b2IxTW5oR3JvaEwybjQ5MDM1L2RNd0JFUjd0?=
 =?utf-8?B?a05rTGpldlpIUzdRVHZXaFVaQnVBclJUNXRERlV1Z1V0eG5mVDBPaldUOUQ0?=
 =?utf-8?B?Z3I1cFoySTJ4QTlkd1BkcFBsWVV2RmpNTjQyUHJ2UEtmb3NDOTlIaUIyNDBt?=
 =?utf-8?B?ckhHRFplTmJkT2h0RzZVelBySlJod2I1dDV2bWxrMkJBeS9hc3QrQjVXekZZ?=
 =?utf-8?B?djFpakZvcEpOd0ErVS9WUk0xSG9JMHRycWc5UlY3UnNyQU9iRzRVRHlCNW9O?=
 =?utf-8?B?YXRQRjlIU1loOHozczlwMk9WallUUmFreHRCY09jMkdGWWU4aTNOZ1FrZkxs?=
 =?utf-8?B?TThRay9iZmRoMHQ0cnpFVE00Y1JKR3Q0SXY0OHQxa2RjRldGdk00M0pmWjdF?=
 =?utf-8?B?T3U5OXFWeWp5VmJzM3NnL2UweHdzejdkYkhWKzJxckQxQkhWRmlRcDcxanJj?=
 =?utf-8?B?M1dWYnNLaXY3aUZYbHVScDZ2RUZIS3d0OWE4RnBiVzZoallEaHJhaU9zdWN0?=
 =?utf-8?B?amRJaWh2dUt6WmR0MVJxR1ArVWx4UGJEUUFobU85ODF0VFJKc0Z1NHlsdUs1?=
 =?utf-8?B?Qjcvby9xM1VtY3F6ZEkycVQ1S1pJYkg1anN5K3JxQlA4dDZqUUpuek83YTFq?=
 =?utf-8?B?Vlh0ZEhGVnZXVFZ1RlVWeVRXcVJlSmlsS1lLK0xJYnpYV0xWeWdLMUIvdXI2?=
 =?utf-8?B?bU5LVjJmVE9qTlV3YjVPN2grRW1pa1lTOHZURENTbkhUb25SMzNmRXpJektI?=
 =?utf-8?B?N1FLTGJqR2JoZkRFYzdGSDRBS1MvQjBKVGJvR1dQYVRNc01pR0hqVTNzQ0p4?=
 =?utf-8?B?WUlaZjQ1KzNOUkJ4cDJnRzEwRFNiU0dxdWN4Y2JoS0NnSmNCWVNCdzVJZkVU?=
 =?utf-8?B?TXhPSmJiQjBpR0xtOXh0Sm1EcUR0bXpFUzlaVkFJUThiQ2t2dklVbG8rakN6?=
 =?utf-8?B?T3REazI3aGQySGVvS05OT3Nac1N3d2ZPcFJzd1JBN3JjNlRKWnp5Sm9ldCtx?=
 =?utf-8?B?NEZRSFlnQ1pUN21ybnEzcWt1UWxrYkNZTS9zb3BjRTVzNEgyS3VhbThQUng4?=
 =?utf-8?B?TEg1SnNQeUY0clBYWXQwaTc1amV3Z2NBWGpXNnFWVWNXc29ETGtDaVkxdEhS?=
 =?utf-8?B?RTRwMXFJV3FkZ1RWOW9nZ05RK0dFY0N3Qk0zcmlTa2lJZmNPKzVQMnFoQk55?=
 =?utf-8?B?eXlRbTJLYzYwcVdnSCtteTZoaUtINVZJMzR5aW01UFM2ZU5taGluT241NTYw?=
 =?utf-8?B?Q2ZqUGt3R1dDZWRST3MrVmhsNy8wbXBFTlI2dWZCekVNRmtnOVBGWDlpU1Fo?=
 =?utf-8?B?b1RvOHAvWlIxc1FONXQ4QThuNlVwQVAzcXlLQXlVSFlJc3oxZ0M4UjVtSnVw?=
 =?utf-8?B?Y25Mdlh2aVdScng0WFlIOFVKU1VSangrS05tdnpDNC84TlBSMnAxZnlTRDY3?=
 =?utf-8?B?S1VBZzVZTFpVczl1d1MrNksvdS9QZDFqbDNsY2F3M1pQTG5MdFVZY0J2dkdi?=
 =?utf-8?B?RG5YZjVpNnlsT0dpcDdXd1MvdldJYmYxRzBhM2FzRjF6S1AxS2NxZ0FUZGZl?=
 =?utf-8?B?bjcvc0YvY1VNUG1aaEFHRVVRK0tNaWk1eUF3L21USGVzR3RrNnlkMzRudkoz?=
 =?utf-8?B?clVma1VhMlZBRDJaTW02ckhBSWNEaDJXRGxGUEd2WmNzS1Z3Mytta0diZ2ty?=
 =?utf-8?B?UVVKb1ludDJPRkFuT2pOWXlGVjlEcmJIL3BOMmtEcFBQUlJqMnBnTjRSZkt2?=
 =?utf-8?B?NStoY0tPbC92d3VRRzZmV2NoTnVDbGdiQWVxaVczL2V1czgvdXF6Y0tSL25j?=
 =?utf-8?B?UkJVNGE1MXc5MzhMayt0aEliTSsvbXFMV0R2empjOUhySndCRTlFUDRLY2JY?=
 =?utf-8?B?eTQ1Y0l0Y2dWaWJHckJWZ20wcHQ0M0pBeWFnVzFCa3BCVzF3VmVWSDc2em9E?=
 =?utf-8?B?ZUZSMnRsT1lhaTlRWVZkekRVbHpSMStaYkRoUysrZnNlLzMvUlMvb3dTL1ha?=
 =?utf-8?B?VWRPQ3N4VFk2UXhwWTdlUnlLb0JRRWU1N2ZwMlB0dkl1MTlJWUdZK3BzNzBT?=
 =?utf-8?Q?kUX2cVNxozQ1R9jC13u+mtIFM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd70d700-de84-4a17-fbba-08dd7d098309
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 17:09:56.4734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+mKLnzL8DlgoOFUivU27SWMZv9lh7hAiSAN4VmYxC3KnCeijpz60QXVNBgDiHau
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8446

Hi Reinette,

On 4/15/25 11:53, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/15/25 7:20 AM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 4/11/25 16:04, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 4/3/25 5:18 PM, Babu Moger wrote:
>>>> The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
>>>> can be assigned to an RMID, event pair and monitor the bandwidth as long
>>>> as it is assigned.
>>>
>>> Above makes it sound as though multiple counters can be assigned to
>>> an RMID, event pair.
>>>
>>
>> Yes. Multiple counter-ids can be assigned to RMID, event pair.
> 
> oh, are you referring to the assignments of different counters across multiple
> domains?

May be I am confusing you here. This is what I meant.

Here is one example.

In a same group,
  Configure cntr_id 0, to count reads only (This maps to total event).
  Configure cntr_id 1, to count write only (This maps to local event).
  Configure cntr_id 2, to count dirty victims.
  so on..
  so on..
  Configure cntr_id 31, to count remote read only.

We have 32 counter ids in a domain. Basically, we can configure all the
counters in a domain to just one group if you want to.

We cannot do that right now because our data structures cannot do that.
We can only configure 2 events(local and total) right now.

My understanding it is same with MPAM also.

> 
>>
>>>>
>>>> Add the functionality to allocate and assign the counters to RMID, event
>>>> pair in the domain.
>>>
>>> "assign *a* counter to an RMID, event pair"?
>>
>> Sure.
>>
>>>
>>>>
>>>> If all the counters are in use, the kernel will log the error message
>>>> "Unable to allocate counter in domain" in /sys/fs/resctrl/info/
>>>> last_cmd_status when a new assignment is requested. Exit on the first
>>>> failure when assigning counters across all the domains.
>>>>
>>>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>>>> ---
>>>
>>> ...
>>>
>>>> ---
>>>>  arch/x86/kernel/cpu/resctrl/internal.h |   2 +
>>>>  arch/x86/kernel/cpu/resctrl/monitor.c  | 124 +++++++++++++++++++++++++
>>>>  2 files changed, 126 insertions(+)
>>>>
>>>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>>>> index 0b73ec451d2c..1a8ac511241a 100644
>>>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>>>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>>>> @@ -574,6 +574,8 @@ bool closid_allocated(unsigned int closid);
>>>>  int resctrl_find_cleanest_closid(void);
>>>>  void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
>>>>  unsigned int mon_event_config_index_get(u32 evtid);
>>>> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>>>> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid, u32 evt_cfg);
>>>
>>> This is internal to resctrl fs. Why is it needed to provide both the event id
>>> and the event configuration? Event configuration can be determined from event ID?
>>
>> Yes. It can be done. Then I have to export the functions like
>> mbm_get_assign_config() into monitor.c. To avoid that I passed it from
>> here which I felt much more cleaner.
> 
>>From what I can tell, for example by looking at patch #22, callers of
> resctrl_assign_cntr_event() now need to call mbm_get_assign_config()
> every time before calling resctrl_assign_cntr_event(). Calling
> mbm_get_assign_config() from within resctrl_assign_cntr_event() seems
> simpler to me and that may result in mbm_get_assign_config() moving to 
> monitor.c as an extra benefit.

Sure.

> 
> ...
> 
>>>> +static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
>>>> +			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>>>> +{
>>>> +	int cntr_id;
>>>> +
>>>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>>>> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
>>>> +		    d->cntr_cfg[cntr_id].evtid == evtid)
>>>> +			return cntr_id;
>>>> +	}
>>>> +
>>>> +	return -ENOENT;
>>>> +}
>>>> +
>>>> +static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
>>>> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>>>> +{
>>>> +	int cntr_id;
>>>> +
>>>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>>>> +		if (!d->cntr_cfg[cntr_id].rdtgrp) {
>>>> +			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
>>>> +			d->cntr_cfg[cntr_id].evtid = evtid;
>>>> +			return cntr_id;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return -ENOSPC;
>>>> +}
>>>> +
>>>> +static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
>>>> +{
>>>> +	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
>>>> +}
>>>> +
>>>> +/*
>>>> + * Allocate a fresh counter and configure the event if not assigned already.
>>>> + */
>>>> +static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>>> +				     struct rdtgroup *rdtgrp, enum resctrl_event_id evtid,
>>>> +				     u32 evt_cfg)
>>>
>>> Same here, why are both evtid and evt_cfg provided as arguments? 
>>
>> Yes. It can be done. Then I have to export the functions like
>> mbm_get_assign_config() into monitor.c. To avoid that I passed it from
>> here which I felt much more cleaner.
> 
> Maybe even resctrl_assign_cntr_event() does not need to call mbm_get_assign_config()
> but only resctrl_alloc_config_cntr() needs to call mbm_get_assign_config(). Doing so
> may avoid more burden on callers while reducing parameters needed throughout.
> 

ok. Sure. Will do.

-- 
Thanks
Babu Moger
