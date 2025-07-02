Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926B610F2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 04:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751430745; cv=fail; b=Z7/fkAbkEvyUC73dGIBgCHmdzNr5hQ5jXjOq1lVrcVi/+VspVWPB/1oM6y3qhp0LtWQGyX5SvPD519II+n3676DYT686c4W3jlT1yl5brvjMKRQ7hH3mOiaLLLg09aasNlJvhYXwZRlorTVyjkyot1AuGwsSN6thVfFeB6QP2iY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751430745; c=relaxed/simple;
	bh=W/BsuPQN7ZKGSRSE6VQLQYgtLBlZEx75oY9bdtiELkE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Kz/alxPiSxJ22zB0MRnVBVSMDl3r01e56myWALrE834WskGeFmULyir/ALzXVnLmbFSIoiw06MHwivCVzQf5/585FVqXWHP7a6osxC1BSqz9855aq5nDESCSBvR3mf4sCBViK2xgeiCDbpZke26pvRaJqVEbPhwTILCOMdwOLDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ndc+Yr2G; arc=fail smtp.client-ip=40.107.93.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ndc+Yr2G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXd3yaSua8h4ytrmWhr3uHdvSMfI0ufhsxAv3il3QVfhPoldrDWvWdRO0xMk38L8YQzFnsYG2PK1QSP1JuEPf+OXOEDMMrwBnZXS70sYtWJVxdcdH6APwSpJtfohEjdpY+mE8CcHkhmypinyMaRG7F8XTWDQwMD3QAe++x7bs8kCI921Lw6PX5+jsc3v9CnMdX27FZa3OZuTjW/xT9EeLS8WrMwlb9rl+jt30JSOFMxAFtaUOFtttnaMbCYag9TNkqgNEmdspVNzWGFkwhjRZPCPOKI2M0ug7ad/pbV8nqnVR01NPDXyMVu3LfH0SKjqqsZtgBQ4nHDWGka8+3jIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqNWblbUOXzfzYFa1cJNy/eHuHpz9R9+4gimBOk0Mlw=;
 b=ZcwBmVFKqoxQjG7LxcEwsZxYKygLZMF7ls8xWBjTAgcwOwE1819vd3zCdysYueUy1YHMFzDz9On8R4xNMrXCwA+XDbXAGSutPMee1drRQHdG5pNDA6CsjeaihyKS0ADC5e4h5M4gBSr3NEm1UW80oZUreELqn8j5ZrxJCT7qJXbHCiDv2Rjlabj1KGibKXZD3glpJOlHMhSh4t9wqe3QpoaiGScZ63yn6DNFPPTn8sF/aEjUvoy0i+Q9wnF6mbI+T/n+JhpChF+1R3ZnEku/4iyQqUiRJ1VFzb85cVynyGtXSVXtf5Ojdz5TubJMjHCVfMytkMS1+A/3NSPqxahBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqNWblbUOXzfzYFa1cJNy/eHuHpz9R9+4gimBOk0Mlw=;
 b=Ndc+Yr2G5yhMAlpm3mXkdregTkSHCwdOVZhUclDTIlKqbGgPNjWXEi09cdkjeCEnZiTOVpv0DRVlijnVQM7crwLGvZwRIKuTEVeTjDFuaGp/TOudEiy5voh8FVG18jaW79Pl5rpM58Qkf+G31a8WNmviw+xcr6MKJWquZGd5LV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by DS7PR12MB5909.namprd12.prod.outlook.com (2603:10b6:8:7a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 04:32:20 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 04:32:20 +0000
Message-ID: <e9666935-f7af-4419-bb85-e1f041c64ea9@amd.com>
Date: Wed, 2 Jul 2025 10:02:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: "Chen, Yu C" <yu.c.chen@intel.com>, Jirka Hladky <jhladky@redhat.com>,
 Abhigyan ghosh <zscript.team.zs@gmail.com>
Cc: linux-kernel@vger.kernel.org, Suneeth D <Suneeth.D@amd.com>
References: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
 <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com>
 <CAE4VaGBQnMp953tsv13s=CiaaiW+EZNuvh6dCuRA7MWbyU_Hsw@mail.gmail.com>
 <CAE4VaGAak=U-oLwXvPZsiNRnRvNL_ROKL8AJCSkCm+zPOjf2qQ@mail.gmail.com>
 <31bd3395-cfe3-4af5-bc1c-fa8d26629b93@intel.com>
 <d0b7b52b-c370-4ad7-8a03-d785f1505372@intel.com>
Content-Language: en-US
From: "Aithal, Srikanth" <sraithal@amd.com>
In-Reply-To: <d0b7b52b-c370-4ad7-8a03-d785f1505372@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0132.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::16) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|DS7PR12MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: e6302662-fbd0-4009-1ee3-08ddb9216ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vm5CeDZ5cmRkTVZIVW5La3hGNjA3YTRIWEJGc3h0ZnZTajR1eW5DN0JyM0lE?=
 =?utf-8?B?NlFYSGZINmYxSXVqZmpCNE8xcGpGMFNzaDRrOUsxcnQvUFJkbFhPMng0NTNl?=
 =?utf-8?B?L25UMVFsN3krYjNDK250azE1VnNja1FYbDNnejZCbXdQYUY5YU42eFJ3cmpp?=
 =?utf-8?B?Y3dXdzVNbTNVcHJEVnlxN2MrSldrd29hWm1lSU5mUGh2dVMyVEhhcEtmSVJQ?=
 =?utf-8?B?WHBpWlRud0xyYWVCaGRFR1gxMldaUkM2SXI1bEZhcGd0TzFzMGZHaFExMGs2?=
 =?utf-8?B?R2YvTGU2YU5nZWZrOXU0eG1ZL1JGWk92UVhpam4reGdaSEZYMGo3d3NFQ29k?=
 =?utf-8?B?bFY3VFFKSHNTMDBQR3BJbTdIdnhNelVGTmpTZVVlWm1mNko1TXUxQXZ4RVNY?=
 =?utf-8?B?ZUw4QkFtYTUrMzBEY2YzenhzekJQazZvcEtQV2Z0TDJkbXZwL1F1cWR5dlRx?=
 =?utf-8?B?WmgxbVcxelpZNk9wTzk3ekgxNUxWTmpPcjJpUXAvZW5QcVBCM25aSjU4MS9Z?=
 =?utf-8?B?Q3VFVndleFA5aUE1K1V5cEs1bUc2MndpdmhTa2hZT0piSHpvZUFlb2xEa2Nm?=
 =?utf-8?B?TkVVSjIwaW9yQlJ5RUtRalJBYjJqZ3dRMWpjV0VJSFlvR08xRE1YN254MWRY?=
 =?utf-8?B?VjJLR2hrc3BxSlRZYTJ3WWEwOHE5ZCt3bkZoWFh3eWJiejIxSUxsYW5XejYz?=
 =?utf-8?B?V1Vidk4ybytQa085RTc4RWpJNDRDV1JtUTJLQzFCclBUeGdya1dndnFKWTdT?=
 =?utf-8?B?UGE0YUhLckZlTkpBc3ovRXIrWW5DOWMxOXJhZ1dVWXNseS8wT2VFcEphRnZa?=
 =?utf-8?B?cFBpYlAzMzZILzRYZFZiaWVyU1FmZ0M2U3RxamFaT2lLNmUzSkY4VERXZ0dB?=
 =?utf-8?B?b0VXUFYzcHNLNEFHYUJlNER4cVB3UWpDV0FUZ0wvRWpmS1UvRUZQdjlQQTNV?=
 =?utf-8?B?bDJOWmVyTEQyS0h6TUF0Y2JsRUpLa1JxeXFFTUFuL3VlbktnMWJoVmxGdW8r?=
 =?utf-8?B?eHBQUkQwdHFLZzE1RFp3eUdpK2U5MURIL2JUR0U3dnpQVjFORDkrblFWTUh0?=
 =?utf-8?B?cFRnM0VMVzhVdW9ucVVvM29pTjdMM0FSd1pOOEVoY0NOQU0wZjJuaVg5Y2Yz?=
 =?utf-8?B?dVlpZDkzZXJWQUhIb21KL0t6dkpLbHo5R3N6TWhWaUpVa2o0TzJINVFCV3ZN?=
 =?utf-8?B?YnV4QXQ5TWZOTmlSQ1JOMk1YYnlnOHFBangyK3Rsc3RoY2J3UklNVkE2WGdx?=
 =?utf-8?B?WjFnZXRDTkxPOHRzTUd3QXlET0ViN2xmbEJoMmZkMUUrMzkrRnB6eThHaUZu?=
 =?utf-8?B?L1FOSUhxeW8zR0hXemtKSXR5dzEwMFZMMksvMkZCZy9IQm1LUFdvUHJnaGQv?=
 =?utf-8?B?Z2RBUHBMdG5oSWd2elY4YTN2MG1oODVFLzBoWms3cjVha280ak0zWnhKQmdX?=
 =?utf-8?B?dXZmZjVvd05HZ3NUcVBLdjN2THZXYjNTOWFRejlUbnpNUEVMd2FMQzFOQm1J?=
 =?utf-8?B?OVJwZzNQS2t2SjN0UlRIenhRMENyS1dOUE11SmQ4aDZzL0o1aGtlV0EyVThZ?=
 =?utf-8?B?TGpFZnhNWEVVNS9iaDJ0NnpCdCtheVRIVXdPUTJ2RHVNN1lmc3k0MGxoSXc3?=
 =?utf-8?B?UW5NVWtxU0FOWnl6S0J3Y2dPUVR1TnpIenBLTHpRSHlPT2tyRWdmN3NmZHl1?=
 =?utf-8?B?b0tUNUUvdXRrcHI5K09INlljaGtGRURLeElZRExOcU0vekhhMENHY3ljUk1E?=
 =?utf-8?B?TlhYcnR6eVBXNVVmaWNNdzBUaExMckV6WjdKeS9UeDRiWHZWUFRuZDBGdWdv?=
 =?utf-8?B?UlRVci9hd0RtTWN4RXUxQ3p1eUdEdW5DMjhMOG5la2hpT1pNemEvajVmdW5x?=
 =?utf-8?B?R2FkdXZmUWo4RHBkdVBEbjc1NnNpYzd1UnFnNzZHajRFay9mQmhOZHhPbU8r?=
 =?utf-8?Q?X0LizvAfnVT/lVqPYHZsDbMHVmXRTTFF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3pzdDl1ckxLaXNPaVE1dGk4aStsd2wzVnhyVlhORVE2Q21JM3pPVmRjVFAr?=
 =?utf-8?B?TjN2eTlkMFZtTkJyQ2xrM3VNTS9Ib0x5ZTJCTC9yQ3ZIL2VPRE1zL05LRUF4?=
 =?utf-8?B?a29yekQ3VW1Ta1Jac1RYbmVSWEhWeWNsTDRjL0xjVkxqV2VCWXNsVVBHN0RT?=
 =?utf-8?B?cUFncGdhMnJCWlBWZElyOEg1aXJZNEdsVWg3QWFjZFhuMjdURFpzMWVwWXgv?=
 =?utf-8?B?WGRPYlg0OXRBbUZNMkpnOXRya21zU2VRYmVwNSs5QTVRVVBUdHpwYkdXcUFN?=
 =?utf-8?B?cU9yWjNQaGprSG53UmEyeFZ6bHRTdldRQzZqYmgwdTJrQkpCeHBXVGxSREF3?=
 =?utf-8?B?d3ZuelVYUXdGRUVZM01jTW9uVFFOMDdabE54NkdkRVFvc1N0YW5KdXdPQmFL?=
 =?utf-8?B?T0hZSlZuUjdSNHFDeHNDdzVydGY4YXlQemFVaXZYRElUOU9RWGc2OTFKSjdY?=
 =?utf-8?B?T2RJSWUrdGFReHRLczVuY1RvMVMxbitMSHF1cER3WVBSWlJ6ckhFU2hFKzJO?=
 =?utf-8?B?Tk4vZnFvWWFWS05yMkJjNVlqYVBOenROYUFTalJoK1E4Y0JTTzlZQVNxYmtk?=
 =?utf-8?B?TWE1aXYrREhaQWdySXd3Y0txM2ZHZ3pNMHFxOUhGNHFXZ3FsQ1JNSUo5T2hC?=
 =?utf-8?B?NTBQSUJGYlVRK0Z4Ry8wQWcyTTl3K1RwbHRoK09aci9DZjZiaVN1S1FPSmdL?=
 =?utf-8?B?ZnRQRFkySmpHcXpwaDVTd1J4K2hTaWcrdkl6MFpDekZSbjRGalV3T3pBU1Rr?=
 =?utf-8?B?dFZCMEVIR1JUaTVOWjJ0OFl5bE5BQmhWR3M0bENHZWZSVXZiRnZvRDMvZmpG?=
 =?utf-8?B?QzZnNE9KbVVFeVNwcmd4bUNnODJoL3VMYlZNaW9aSGVtYXdnOC9oZUV0UERa?=
 =?utf-8?B?Rlo4TDdWWThwR3dyTzVwTXZDUTFEZGpQTkdCNXlWTGd3bGdud3AvVmp0ZERJ?=
 =?utf-8?B?NlpxRWZnamZhenlPN0dPWmp4NEdQUXZDSFB6amtJckZQY3ZxRGFSYzl0WGF5?=
 =?utf-8?B?WkhtUy96VnE1UStGdEZ5b25QMU1lM3RsRUlWd0NtL24xN3liYlQrYjhGeUNJ?=
 =?utf-8?B?RFZMMytUMVBDRm9weWQyczd5Rm5nM3ZWNHFQRnNpeXViakFEeWY0QWdHSit1?=
 =?utf-8?B?MExHdmk0Z0NrNnBra2Rid0Z4ME5uL2Fob3NydFNEUHhEY2ZOaVpwUStWR2J3?=
 =?utf-8?B?LzZ1ajU5bGlORVRYb1hsaXRVc1pTdldpb0pYc0RYMUNCamswSzRPUzBLckIx?=
 =?utf-8?B?VTFkQjVkbVZDRHF5YnpuRUF6dE5DYXBkWTM4RlUyeU56blBNTy85VXlCc2Z6?=
 =?utf-8?B?Y2VPZTNzNS9WM1dsWmM3eUE3RUxtODlpR2NZeGY3WWZ5ODJEcU15OXg0aGx1?=
 =?utf-8?B?eXpFWU9yQ2Y5ckhTV2hGT1d2Vlg4cHdqczdlQTY5bU80VXIyQm1tNlZlSlJQ?=
 =?utf-8?B?eGxRVDdvaGNkazBIVGQrbGxWTkFyTXNYTTJ3cWdOaHh4cU9XaytDNVFWaW1z?=
 =?utf-8?B?Zy9hWGlQTG42WGxxY3hQcTFId2Z0ZmV0VGhCMXNwd3Bjd1h0SzIvOXFVV0lo?=
 =?utf-8?B?N0VBVFhvbVhReldTakFXNGFBcWUzRnY3bXUyQlcwcGR4WGF0K3E2Ym9CUlg3?=
 =?utf-8?B?MFhLRWR0VGRHVnQ2TkhWR2ZJU2lxYjZyUUxNUWVqdGZsNzJwSlQ5ZHlMdnFT?=
 =?utf-8?B?U1ZXUWtrTEFzUTZTaUtBOVZmWmdlSWFnY3BNbXVyT0cwVlBwaXRobHhWWXBq?=
 =?utf-8?B?SEswRGp5ODVPZDNud05FOUJaaTJITlMrMWNxYUROUldsQmdRM2I0akNEQ0c2?=
 =?utf-8?B?UTFjcHdXZlQyYjdDZ3g4N21ndG5kaWMybUc0M0NKWEc2eEQ3RFRXdFBycWRX?=
 =?utf-8?B?cXF3aS84TFlpYmJoeDZuWkZXYS93NkJkVWhyY2IwdU1oYm1iZCtnbzFOanVM?=
 =?utf-8?B?bXZzWHBjZnE2OWs5RkIxZnhFaUZQVUJaNzN4cXFtRVhValdWU1hGek03Vzgx?=
 =?utf-8?B?K0lnMkhWYWY5d0dBKytYdGE3d3g4elpKT2JQcXBkcFRIZWhOOXc3S0UxQlVV?=
 =?utf-8?B?bzZza0F0UmlJbCtEdjJqcXRNRXdKY0hVMnlBc2NvWW5uc0NXYXdEZFFWOWFO?=
 =?utf-8?Q?QNDrX+qe3bHl39TG6HUy8dal4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6302662-fbd0-4009-1ee3-08ddb9216ea2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 04:32:20.2642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnkXWS5vVOJJrkZgmX5ZSY4ceDLh9YtA7ccAtOpiqdyIy3pnoJs3F2JRuDFRxB/q2sKW5SG/dMbIUcAxCGyaOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5909

On 6/27/2025 1:03 PM, Chen, Yu C wrote:
> On 6/27/2025 3:16 PM, Chen, Yu C wrote:
>> Hi Jirka,
>>
>> On 6/27/2025 5:46 AM, Jirka Hladky wrote:
>>> Hi Chen and all,
>>>
>>> we have now verified that the following commit causes a kernel panic
>>> discussed in this thread:
>>>
>>> ad6b26b6a0a79 sched/numa: add statistics of numa balance task
>>>
>>> Reverting this commit fixes the issue.
>>>
>>> I'm happy to help debug this further or test a proposed fix.
>>>
>>
>> Thanks very much for your report, it seems that there is a
>> race condition that when the swap task candidate was chosen,
>> but its mm_struct get released due to task exit, then later
>> when doing the task swaping, the p->mm is NULL which caused
>> the problem:
>>
>> CPU0                                   CPU1
>> :
>> ...
>> task_numa_migrate
>>    task_numa_find_cpu
>>     task_numa_compare
>>       # a normal task p is chosen
>>       env->best_task = p
>>
>>                                         # p exit:
>>                                         exit_signals(p);
>>                                            p->flags |= PF_EXITING
>>                                         exit_mm
>>                                            p->mm = NULL;
>>
>>     migrate_swap_stop
>>       __migrate_swap_task((arg->src_task, arg->dst_cpu)
>>        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
>>
>> Could you please help check if the following debug patch works,
> 
> Attached the patch:
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 8988d38d46a3..82fc966b390c 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3364,7 +3364,12 @@ static void __migrate_swap_task(struct 
> task_struct *p, int cpu)
>   {
>       __schedstat_inc(p->stats.numa_task_swapped);
>       count_vm_numa_event(NUMA_TASK_SWAP);
> -    count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> +    if (unlikely(!p->mm)) {
> +        trace_printk("!! (%d %s) flags=%lx\n", p->pid, p->comm,
> +                p->flags);
> +    } else {
> +        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> +    }
> 
>       if (task_on_rq_queued(p)) {
>           struct rq *src_rq, *dst_rq;

I was encountering the same issue as mentioned earlier in this thread, 
which has been recurring in our daily linux-next CI builds within our 
virtualization CI stream where we observed this BUG appearing randomly 
during the runs.

Additionally, we were able to reproduce this issue while running the 
autonuma benchmark. As mentioned earlier, the BUG would occur randomly 
across iterations, typically between the 5th and 10th iterations.

We consistently encountered this issue up to the 
6.16.0-rc4-next-20250630 build 
[https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git].

After applying the aforementioned patch ontop of next-20250630 build, I 
tested it in our virtualization CI and with the autonuma benchmark 
reproducer described below, and the issue no longer occurred. The patch 
appears to have resolved the reported problem.


git clone https://github.com/pholasek/autonuma-benchmark.git
cd autonuma-benchmark
for i in $(seq 1 80); do bash ./start_bench.sh -s -t; done
Note: The server running the autonuma-benchmark must have at least two 
nodes.

If the provided fix is final, please feel free to include the following 
Tested-by tag:

Tested-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
Tested-by: Suneeth D <Suneeth.D@amd.com>

