Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD401E1DE9;
	Tue, 15 Apr 2025 16:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744735301; cv=fail; b=KlYj5KKSVVHwWjepcAx7N6saeHntQZZH7sAZ2xofNIlJnqSh8ZXwwtFjjMZuTbF0+gW4lh1QdISpbOdoiKCUxp/DIyaixGjA8osQULQroK0FvN+3ydrypG+K3oJ0qKGgHFRG5wUNrcq1FJH6vDYr2RczE+B58z8qd1YM1ktvd7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744735301; c=relaxed/simple;
	bh=BYPjjXBmiYG0PwnQ7lSBBG7AxNPXJPjc8bhUML80zSo=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XThg9STPqTB870N3dzfs6a9v2fV8RyNcDCjOaaByPwDjTimMmcOHbN0lT5iR5uPrP+TFXgsgk6V/S4QtQiRXwsIEn+BctEvLMoYyy9Df++tf2Ec7K2c/88ZXgFEn/eu4TMlA1x1R2IyjswzUidsipUcw2cSWCKaYH83r9k+0TXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fu9McTKQ; arc=fail smtp.client-ip=40.107.92.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fu9McTKQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqMd5P6tBFzysK0f6I9HQM0EsX4rZvPTobc2oElR43iBcUvrEONZCyw+dvd+g+limK0fdpAS2NZr1YnFwrrH+Uj9/lNG1BRXxIkwxsVPG1UwXxtwUX/p7WvHp4mXbS5i8sxM6QTS37kkzpFHgUbFU17mxurtaL/yec6O7ZAPEdDeHYvpb0FTrP5JjRK5qZ7m4W5FoWS+Tt3SiJcKEG0lGAOoaw9892jMQrwWyVg1+maBSsPEPIpGOiOdqtxTfOgl8CNW9T7Lgour3Oe6aatb1zM4+Rv4FzGuaFZ30ebxc/6PZGGzuSe0nwtOCstRF2duC3wzHhixrP0VdSNJ78OUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhXY+8FvkIde2hDVA+B5xlMjUUJHbIuCwIypS7NHSFk=;
 b=G2P8IrY/mmvES6FeWaKrC/X8aoFSGtbsSMeXsTkPZ3cfFlNhipxfPTlDQKHzv+CBbSBV1WyaY3xSJOAG0VZ1oEQtINGfsWYmulNgMTrukLgNeH9BD2v25VCBGYFqKJ2Vq6gw5KHs0odQPVTWvuhQ3vdTdOMezpB9KEGIa5/JExuKi9RX+GFPITtIEzsFwvfUAhRbJTWE4L6mKA3J4P3yUDsTWokCSxc7oZJEXYW0OqWn42Jnfj4xUbUbhupKfcHx8bOMqpwFQrBshjXV0mm4BTSpHjvvwJazxPNCe893iNaGfaovEEl2iHJvne5Zg9TmRYOERxh/J2G4fozsAtvfEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhXY+8FvkIde2hDVA+B5xlMjUUJHbIuCwIypS7NHSFk=;
 b=fu9McTKQ33VTLNAny0cALa42nv89XkkxazNSU4aO6hpk2hlamemqGhzOKTMbUfFcefkWuucc75v+RrglrLAkDjotvc1tH2zKr74VGh3AAoImzm3h0S5sfmiWfrjJd/lJ0GSWH9+JVhWQ1KTMaBM9t5IKO3xx3rKWUncZO+mdYuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by LV2PR12MB5749.namprd12.prod.outlook.com (2603:10b6:408:17f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 16:41:32 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 16:41:32 +0000
Message-ID: <550037d8-b311-42b6-85ab-66aea8900c95@amd.com>
Date: Tue, 15 Apr 2025 11:41:28 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v12 17/26] x86/resctrl: Add the support for reading ABMC
 counters
Reply-To: babu.moger@amd.com
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
 <0389f4beff82ded90aad4bd670210c56cf1f799e.1743725907.git.babu.moger@amd.com>
 <99e8d014-35c4-4bad-b1f7-a6f8eaee57a2@intel.com>
Content-Language: en-US
In-Reply-To: <99e8d014-35c4-4bad-b1f7-a6f8eaee57a2@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR04CA0080.namprd04.prod.outlook.com
 (2603:10b6:805:f2::21) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|LV2PR12MB5749:EE_
X-MS-Office365-Filtering-Correlation-Id: 96110b9b-09d3-424e-ba41-08dd7c3c60ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVhFR1IxK3BWaUhwRXkvNDZrVzJNbnl1Sk9BTnFKb1ZlRDFKUGN4NmJmQ2lH?=
 =?utf-8?B?VE9vVkI3S3BTR2Q4L2dZU3pTamVvMEMwejdleWRwdElNN0J5U0pvMFlEemw2?=
 =?utf-8?B?bFhPV2RKeXhEMGNUSStvWkNoM0FCNDFyekwyMVViVWpJZFF0U2VMUTlRM3Fj?=
 =?utf-8?B?RHN6QUxmVWZYZklSWUxScWpUemhWWlZSVm5EOTZtWThHTlJLK1I0OXFud1gz?=
 =?utf-8?B?WWtjcTdUUGNCT1BDajJKSWRQZzdvWVowdFVHK0JxbEF2ZkJGaldGRkovVFJC?=
 =?utf-8?B?MTQ3VE0xV1dhZlJ4WHZscmtoR0MvTTMva29GUkoxNFVtQnBTUkRrRkFDaHBV?=
 =?utf-8?B?VE1JbWZva2lmYnE5RFlXRkhJRjFjaTdwaXZaY1Z3UENhd2ZDbktBcVhZbi96?=
 =?utf-8?B?OEd4bGxadjZxQTVqbVF4Um0rUzgrdzdVWmxtOWQrOVNYY0dxVkV0cUJ1Tkx4?=
 =?utf-8?B?MDRLWklLckxzY2dSRFRjYXNDREJWQXYvbzlLSFFicTJzQ0tXaWNScUVTM0w1?=
 =?utf-8?B?VUZEQ2dKVGFTZGVrK3g5QUVYb3lVYk9XUWVmRmIyTkhXdElENGp2Z242L1FJ?=
 =?utf-8?B?TG9YSlJPdXBuRFFTdUFrRGxidEtmayt6SnZjalp4TDltODNTVzBGZUl5b1Zp?=
 =?utf-8?B?Q0pPWmNyTlZCWk1jQlpielE0OVA3bWpoNllZaUFrMnErS0ZPbytDanJMUi9t?=
 =?utf-8?B?UE14bnpTdURTNVBnMnNQMERUay9IanlUaWxSQk9uODVnU3cvcjRLRE45UjFi?=
 =?utf-8?B?NTFvRGRTNnczVWVMODJvNW00OXVjL3lPMjNtL2Q2eldBSyt5OHkzU3N0eFY4?=
 =?utf-8?B?UWZab3o4QmRsVnArZ1pqandwZ09aTHcxdVlqRkU3OThQNGJJQVEzZFpXMGJT?=
 =?utf-8?B?R2IxSnFUVnR4V0tIUjBqVVRBS2FIK0VGWlNXYmsyTHNVanVVSFRGTEdOWFVT?=
 =?utf-8?B?cGJoelZjckg1b1NtY2NjdFJ3eDFmSHVLTFFpUUVSYU1SdWE0QXZvalBLU25C?=
 =?utf-8?B?TEM2SXprUENEVXRTc0NkcDhTOTRrWHoydURWcnVObXltSkdEaWhOcEFaN3F4?=
 =?utf-8?B?Ujc1ZnFNWWFCeDJGNTU3b3pCKzdCY1ovMU9Hb29CT2VHcUlYcUw5ZjFXeW0r?=
 =?utf-8?B?ZHd5NGsrYXhRR0ZvckRsMEx4SVZpdHRCeGFEeFE5VjdJR3NGMjlpOVhybGw1?=
 =?utf-8?B?U3JxNEFwbENROEdNUVBtNHhUcm9nM3gzNWlNakJOdWlZQUdsWkZ3WEh3b01D?=
 =?utf-8?B?anIzaFZlNWtJTmpqTUFib3ZDL0t6SDFyN0RKWFg5WFZEUC9lVyt2R2hQcUhy?=
 =?utf-8?B?WlJieXlRUmtlSlRZUGYzcEVoS000cEhPdHpMSm1qbXFnVlQzelVNb040VFNs?=
 =?utf-8?B?djhYWmFVMGduVmJrcHJ6VjF4V3h2Smx5SU45ZnpFQzB4d3JFeTJFbElZeDFw?=
 =?utf-8?B?ZGEwRE5TbDJISE1tT3BaUGNwWHYzZFVJclROa1BDUVNObll2QnYrZ25UNEF3?=
 =?utf-8?B?Y3RsZ0pXSCtaNHo5ZGRkOXhHUnVjaWtvNHo0UjlKbmdNK0FQNWU3TEYwSnR3?=
 =?utf-8?B?WVdLNDNmTkV5THE1d0lLczVYaE9MTndpWHVMZ01adEpLUUNtT3g2UmozQ2l2?=
 =?utf-8?B?cVY1UHRHbUpQNFFLZENEQU01NVNlQzVtaW05WEphT2xrajJkaXpSMHU2ZmFK?=
 =?utf-8?B?NUt6OGpGcS9qZEJOQU1LUUVaTHFmdFVGYU9HRzhUaW9sVi9xQ0JEN25tSWwy?=
 =?utf-8?Q?y98aCj2xj4Lb7XSANU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFBreTJvOWxtcENKL2N4VmxjZGxPZlhsQS82TCtiQU9zN05lOTZDOENSSlda?=
 =?utf-8?B?OU16eDJCUEVWVzVCejhKbzRXY2xpUnJyeGkrOUZyMTU0QnRFYkhiWEhZUk9m?=
 =?utf-8?B?UTM2enhXeWhGSFNEelVvZTFpdloya3REY2ZwdXRuNk5uRGE1cEdSRDh2dEpt?=
 =?utf-8?B?TXJ4NS94SVJSRmt4ejJlZXp5K21pMnhPUmVkRFJXZzBXcTBWN2w4dDNNYUNJ?=
 =?utf-8?B?N1FrUGxhRTcxcURCMGNwQmlPUDM5TG9sb0FhTTY1OWhINkhYMjdYczQxQnFQ?=
 =?utf-8?B?UkdQZU9IR1I1Sk1pTWpkaGJpK2xReWJuUkpYWWVvK0gxOTlBTnh4L3BISnV5?=
 =?utf-8?B?aHRzSVVRcWZoekJEYVI2ZkFDUXhoQlZzL2tHa0ZvQmVpcUZUS2krWVozRTBP?=
 =?utf-8?B?N1ZscVhYV0pUTWRvL2I3TG8vOTN3bmdka0lmQ2ZjQ3VkOG42WGZFaGZJY3Iz?=
 =?utf-8?B?d0R6bWtOS2p3SERZa0dFWXFURTZnckdnTXJod2xFUEMxM3ZWMmdldTNsOXNj?=
 =?utf-8?B?Nm5WTUw0UEZ1TU93Y3ZWYW91cVd5MWZKT0lUMmVibVRPOWJLVDI5c0NocVlJ?=
 =?utf-8?B?aWtKamk4cmhTc0NHS2FkQWZFeVRXTlVrWlBRM1JyRE5IOXhRMFZXTnIwUUM0?=
 =?utf-8?B?eVNMYUdRYzNERlMwMnhHQlorWHB2QzUxa0QzZTEwWCt5SDVXNjBVVEVpWEZE?=
 =?utf-8?B?TU14c1VqWVg2dEM2Y25ydHNnVXlzTWgvL3lKMTZPRWRSVUlGZHFoYW9DMWlk?=
 =?utf-8?B?WmwzT0JxeFc2WTAxOGZ4dUtubjgwT2Zac2FYWTdZOUYrU2c2dnhuYjU4ajJV?=
 =?utf-8?B?SXo4Y3hUekZoNTd2WlVYSEVPRmZpbUMyNksyVWllVUtqMDZtcVVHUStVdXVS?=
 =?utf-8?B?OVcreUlwb3VvZ2FWS3BjTEtyREREOWtTNFhrOWhTVmxWOTRISkYyanJBQTRq?=
 =?utf-8?B?L1A3TTlPSzRsWEdjUTYwbmUwTVF0djhoWTBnR2pWUFdMUWttODJGeXlPRHpY?=
 =?utf-8?B?eWQyTjRyQ1l5Mnl3cFhDRmdtdEh5MExibUxPTmdyMWJDalRUR2ZEcUs4NGJO?=
 =?utf-8?B?azc1VlV5WjlXUk5TazBxVWdlNTk2bEE3YkZ2NWVxbUQzOU9INE9uUlNoWW41?=
 =?utf-8?B?ZDJEQnlvWkR3eVVaWVFBWGdpbGRTTCsvZmdPcGhweUxSQSs1TEFRRlBPUEho?=
 =?utf-8?B?Z2VVMEo3ZzYyNmZJRnd1anFLanF0cDRVanllbmtTZEpiZmZnSUgwakVjYkFi?=
 =?utf-8?B?dlQ5UENUNG5MQlpXTFNyZWdWRGFka3pFTVFSWUtRS01uUEQwQzcxVTNqcTZT?=
 =?utf-8?B?Ym5NVnJYQkVBcHJjOHVqOVdDWjBEYjhxQ0dJTEdDbVpzME1QbWtVWjRTazZJ?=
 =?utf-8?B?c1hYY3FNZ2syMWFlNkNkeC9QSUFUeSsvcFpxNHJVTlhUUDlMK2tDMmxFbU4y?=
 =?utf-8?B?V09jZjVOQzVRb1ZVaWdZMCtra1ZLNzJ6LzI1cEFjbG1ZV0F6dzJsMzlla1JJ?=
 =?utf-8?B?TEFtRTREYkVodENhVmR3V2o2ZzJsUkEvMk0xTWd2eTNSb0g3ODNzYVhwalY0?=
 =?utf-8?B?ZURyZDFHelh3RE5xc1hHbFlQaVg2OXNLbjVHQmV4d2FITTd6YzF1R2h4UW40?=
 =?utf-8?B?K2pvUXJPRXIxTDE5dGc1QkxwdFI0VkZLTmF6YlorSVJBa0dGd01WRW01MWlW?=
 =?utf-8?B?YW9Fc3djb1YvM1RTVll3NEZMM0NpRHVPaU5jWkxZT0ZmcGlvdHJSS09OVWU5?=
 =?utf-8?B?VDlHYmhmNmN0dFNvZzdNL0xLQWFIdzQra3ZnQTdJd1QxbDlGOE5iQnJoc2pX?=
 =?utf-8?B?SVhZM2Jpc1gvWnNCUXR6ZEd0UXlXV1F5dm5CajByL1BpU3hhV1BrdnB6Q2lU?=
 =?utf-8?B?OUJwMmR4eFptQW5wWlF5blQzdTl6aDFYU09lbkt5d2RuUU55TEtQWFBXSVdY?=
 =?utf-8?B?eWpsUDBhekVMNTlzVG1zUkMzTmc5SXk4YVJVdjlkNFJxaVpFbnRKNTRKRFRy?=
 =?utf-8?B?RjVnOWZTMklnMFhyRmpOME9rKzhNSW9wRXVvSmhzYVNkWXI1UmtoNTgrVzNO?=
 =?utf-8?B?YkVpVTZtL3lyRWk3bUdVTFExVW1YcTNITlEwU25sWHgvYjhwUWh4OVovR0pL?=
 =?utf-8?Q?LKbU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96110b9b-09d3-424e-ba41-08dd7c3c60ec
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:41:32.3852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4UEa9cfLlcxgynF7kQQybPYz0C38/1ne7nh3zQgWc2Sx4drofqViqau0PdBvjkF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5749

Hi Reinette,

On 4/11/25 16:21, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/3/25 5:18 PM, Babu Moger wrote:
>> Software can read the assignable counters using the QM_EVTSEL and QM_CTR
>> register pair.
>>
>> QM_EVTSEL Register definition:
>> =======================================================
>> Bits	Mnemonic	Description
>> =======================================================
>> 63:44	--		Reserved
>> 43:32   RMID		Resource Monitoring Identifier
>> 31	ExtEvtID	Extended Event Identifier
>> 30:8	--		Reserved
>> 7:0	EvtID		Event Identifier
>> =======================================================
>>
>> The contents of a specific counter can be read by setting the following
>> fields in QM_EVTSEL.ExtendedEvtID = 1, QM_EVTSEL.EvtID = L3CacheABMC (=1)
>> and setting [RMID] to the desired counter ID. Reading QM_CTR will then
>> return the contents of the specified counter. The E bit will be set if the
>> counter configuration was invalid, or if an invalid counter ID was set
> 
> Would an invalid counter configuration be possible at this point? I expect
> that an invalid counter configuration would not allow the counter to be
> configured in the first place.

Ideally that is true.  We should not hit this case. Added the text for
completeness.

> 
>> in the QM_EVTSEL[RMID] field.
>>
>> Link: https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/40332.pdf
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v12: New patch to support extended event mode when ABMC is enabled.
>> ---
>>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  4 +-
>>  arch/x86/kernel/cpu/resctrl/internal.h    |  7 +++
>>  arch/x86/kernel/cpu/resctrl/monitor.c     | 69 ++++++++++++++++-------
>>  include/linux/resctrl.h                   |  9 +--
>>  4 files changed, 63 insertions(+), 26 deletions(-)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> index 2225c40b8888..da78389c6ac7 100644
>> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> @@ -636,6 +636,7 @@ void mon_event_read(struct rmid_read *rr, struct rdt_resource *r,
>>  	rr->r = r;
>>  	rr->d = d;
>>  	rr->first = first;
>> +	rr->cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
>>  	rr->arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, evtid);
>>  	if (IS_ERR(rr->arch_mon_ctx)) {
>>  		rr->err = -EINVAL;
>> @@ -661,13 +662,14 @@ void mon_event_read(struct rmid_read *rr, struct rdt_resource *r,
>>  int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>>  {
>>  	struct kernfs_open_file *of = m->private;
>> +	enum resctrl_event_id evtid;
>>  	struct rdt_domain_hdr *hdr;
>>  	struct rmid_read rr = {0};
>>  	struct rdt_mon_domain *d;
>> -	u32 resid, evtid, domid;
>>  	struct rdtgroup *rdtgrp;
>>  	struct rdt_resource *r;
>>  	union mon_data_bits md;
>> +	u32 resid, domid;
>>  	int ret = 0;
>>  
> 
> Why make this change?

Yes. Not required.

> 
>>  	rdtgrp = rdtgroup_kn_lock_live(of->kn);
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index fbb045aec7e5..b7d1a59f09f8 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -38,6 +38,12 @@
>>  /* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
>>  #define ABMC_ENABLE_BIT			0
>>  
>> +/*
>> + * ABMC Qos Event Identifiers.
>> + */
>> +#define ABMC_EXTENDED_EVT_ID		BIT(31)
>> +#define ABMC_EVT_ID			1
>> +
>>  /**
>>   * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
>>   *			        aren't marked nohz_full
>> @@ -156,6 +162,7 @@ struct rmid_read {
>>  	struct rdt_mon_domain	*d;
>>  	enum resctrl_event_id	evtid;
>>  	bool			first;
>> +	int			cntr_id;
>>  	struct cacheinfo	*ci;
>>  	int			err;
>>  	u64			val;
> 
> This does not look necessary (more below)

ok.

> 
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index 5e7970fd0a97..58476c065921 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -269,8 +269,8 @@ static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_do
>>  }
>>  
>>  void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
>> -			     u32 unused, u32 rmid,
>> -			     enum resctrl_event_id eventid)
>> +			     u32 unused, u32 rmid, enum resctrl_event_id eventid,
>> +			     int cntr_id)
>>  {
>>  	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>>  	int cpu = cpumask_any(&d->hdr.cpu_mask);
>> @@ -281,7 +281,15 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  	if (am) {
>>  		memset(am, 0, sizeof(*am));
>>  
>> -		prmid = logical_rmid_to_physical_rmid(cpu, rmid);
>> +		if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
>> +		    resctrl_is_mbm_event(eventid)) {
>> +			if (cntr_id < 0)
>> +				return;
>> +			prmid = cntr_id;
>> +			eventid = ABMC_EXTENDED_EVT_ID | ABMC_EVT_ID;
> 
> hmmm ... this is not a valid enum resctrl_event_id.

Yes. I may have to introduce the new function __cntr_id_read_phys() to
address this.

> 
> (before venturing into alternatives we need to study Tony's new RMID series
> because he made some changes to the enum that may support this work)

I looked into his series little bit.
https://lore.kernel.org/lkml/20250407234032.241215-1-tony.luck@intel.com/

I see he is refactoring the the events to support the new event types that
he is adding. It feels like his changes may not drastically affect the
changes I am doing here except some code conflicts between both the series.


> 
> 
>> +		} else {
>> +			prmid = logical_rmid_to_physical_rmid(cpu, rmid);
>> +		}
>>  		/* Record any initial, non-zero count value. */
>>  		__rmid_read_phys(prmid, eventid, &am->prev_msr);
>>  	}
>> @@ -313,12 +321,13 @@ static u64 mbm_overflow_count(u64 prev_msr, u64 cur_msr, unsigned int width)
>>  }
>>  
>>  int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
>> -			   u32 unused, u32 rmid, enum resctrl_event_id eventid,
>> -			   u64 *val, void *ignored)
>> +			   u32 unused, u32 rmid, int cntr_id,
>> +			   enum resctrl_event_id eventid, u64 *val, void *ignored)
>>  {
>>  	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>>  	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
>>  	int cpu = cpumask_any(&d->hdr.cpu_mask);
>> +	enum resctrl_event_id peventid;
>>  	struct arch_mbm_state *am;
>>  	u64 msr_val, chunks;
>>  	u32 prmid;
>> @@ -326,8 +335,19 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  
>>  	resctrl_arch_rmid_read_context_check();
>>  
>> -	prmid = logical_rmid_to_physical_rmid(cpu, rmid);
>> -	ret = __rmid_read_phys(prmid, eventid, &msr_val);
>> +	if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
>> +	    resctrl_is_mbm_event(eventid)) {
>> +		if (cntr_id < 0)
>> +			return cntr_id;
>> +
>> +		prmid = cntr_id;
>> +		peventid = ABMC_EXTENDED_EVT_ID | ABMC_EVT_ID;
> 
> same
> 

Sure. I may have to introduce the new function __cntr_id_read_phys() to
address this.

>> +	} else {
>> +		prmid = logical_rmid_to_physical_rmid(cpu, rmid);
>> +		peventid = eventid;
>> +	}
>> +
>> +	ret = __rmid_read_phys(prmid, peventid, &msr_val);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -392,7 +412,7 @@ void __check_limbo(struct rdt_mon_domain *d, bool force_free)
>>  			break;
>>  
>>  		entry = __rmid_entry(idx);
>> -		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid,
>> +		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid, -1,
>>  					   QOS_L3_OCCUP_EVENT_ID, &val,
>>  					   arch_mon_ctx)) {
>>  			rmid_dirty = true;
>> @@ -599,7 +619,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
>>  	u64 tval = 0;
>>  
>>  	if (rr->first) {
>> -		resctrl_arch_reset_rmid(rr->r, rr->d, closid, rmid, rr->evtid);
>> +		resctrl_arch_reset_rmid(rr->r, rr->d, closid, rmid, rr->evtid, rr->cntr_id);
>>  		m = get_mbm_state(rr->d, closid, rmid, rr->evtid);
>>  		if (m)
>>  			memset(m, 0, sizeof(struct mbm_state));
>> @@ -610,7 +630,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
>>  		/* Reading a single domain, must be on a CPU in that domain. */
>>  		if (!cpumask_test_cpu(cpu, &rr->d->hdr.cpu_mask))
>>  			return -EINVAL;
>> -		rr->err = resctrl_arch_rmid_read(rr->r, rr->d, closid, rmid,
>> +		rr->err = resctrl_arch_rmid_read(rr->r, rr->d, closid, rmid, rr->cntr_id,
>>  						 rr->evtid, &tval, rr->arch_mon_ctx);
>>  		if (rr->err)
>>  			return rr->err;
>> @@ -635,7 +655,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
>>  	list_for_each_entry(d, &rr->r->mon_domains, hdr.list) {
>>  		if (d->ci->id != rr->ci->id)
>>  			continue;
>> -		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid,
>> +		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid, rr->cntr_id,
>>  					     rr->evtid, &tval, rr->arch_mon_ctx);
>>  		if (!err) {
>>  			rr->val += tval;
>> @@ -703,8 +723,8 @@ void mon_event_count(void *info)
>>  
>>  	if (rdtgrp->type == RDTCTRL_GROUP) {
>>  		list_for_each_entry(entry, head, mon.crdtgrp_list) {
>> -			if (__mon_event_count(entry->closid, entry->mon.rmid,
>> -					      rr) == 0)
>> +			rr->cntr_id = mbm_cntr_get(rr->r, rr->d, entry, rr->evtid);
>> +			if (__mon_event_count(entry->closid, entry->mon.rmid, rr) == 0)
>>  				ret = 0;
>>  		}
>>  	}
>> @@ -835,13 +855,15 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_mon_domain *dom_mbm)
>>  }
>>  
>>  static void mbm_update_one_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>> -				 u32 closid, u32 rmid, enum resctrl_event_id evtid)
>> +				 u32 closid, u32 rmid, int cntr_id,
>> +				 enum resctrl_event_id evtid)
> 
> Would it not be simpler to provide resource group as argument (remove closid, rmid, and
> cntr_id) and determine cntr_id from known data to provide cntr_id as argument to
> __mon_event_count(), removing the need for a new member in struct rmid_read?

Yes. We can do that.

> 
>>  {
>>  	struct rmid_read rr = {0};
>>  
>>  	rr.r = r;
>>  	rr.d = d;
>>  	rr.evtid = evtid;
>> +	rr.cntr_id = cntr_id;
>>  	rr.arch_mon_ctx = resctrl_arch_mon_ctx_alloc(rr.r, rr.evtid);
>>  	if (IS_ERR(rr.arch_mon_ctx)) {
>>  		pr_warn_ratelimited("Failed to allocate monitor context: %ld",
>> @@ -862,17 +884,22 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_mon_domain *
>>  }
>>  
>>  static void mbm_update(struct rdt_resource *r, struct rdt_mon_domain *d,
>> -		       u32 closid, u32 rmid)
>> +		       struct rdtgroup *rdtgrp, u32 closid, u32 rmid)
> 
> This looks redundant to provide both the resource group and two of its members as parameters.
> Looks like this can just be resource group and then remove closid and rmid?

Yes. We can do that.

> 
>>  {
>> +	int cntr_id;
>>  	/*
>>  	 * This is protected from concurrent reads from user as both
>>  	 * the user and overflow handler hold the global mutex.
>>  	 */
>> -	if (resctrl_arch_is_mbm_total_enabled())
>> -		mbm_update_one_event(r, d, closid, rmid, QOS_L3_MBM_TOTAL_EVENT_ID);
>> +	if (resctrl_arch_is_mbm_total_enabled()) {
>> +		cntr_id = mbm_cntr_get(r, d, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
>> +		mbm_update_one_event(r, d, closid, rmid, cntr_id, QOS_L3_MBM_TOTAL_EVENT_ID);
> 
> With similar change to mbm_update_one_event() where it takes resource group as parameter
> it is not needed to compute counter ID here.
> 
> This patch could be split. One patch can replace the closid/rmid in mbm_update()
> and mbm_update_one_event() with the resource group. Following patches can build on that.

Sure. We can do that.

> 
>> +	}
>>  
>> -	if (resctrl_arch_is_mbm_local_enabled())
>> -		mbm_update_one_event(r, d, closid, rmid, QOS_L3_MBM_LOCAL_EVENT_ID);
>> +	if (resctrl_arch_is_mbm_local_enabled()) {
>> +		cntr_id = mbm_cntr_get(r, d, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
>> +		mbm_update_one_event(r, d, closid, rmid, cntr_id, QOS_L3_MBM_LOCAL_EVENT_ID);
>> +	}
>>  }
>>  
>>  /*
>> @@ -945,11 +972,11 @@ void mbm_handle_overflow(struct work_struct *work)
>>  	d = container_of(work, struct rdt_mon_domain, mbm_over.work);
>>  
>>  	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
>> -		mbm_update(r, d, prgrp->closid, prgrp->mon.rmid);
>> +		mbm_update(r, d, prgrp, prgrp->closid, prgrp->mon.rmid);
> 
> providing both the resource group and two of its members really looks
> redundant.

Will take care of thato.
> 
>>  
>>  		head = &prgrp->mon.crdtgrp_list;
>>  		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
>> -			mbm_update(r, d, crgrp->closid, crgrp->mon.rmid);
>> +			mbm_update(r, d, crgrp, crgrp->closid, crgrp->mon.rmid);
> 
> same
> 
Sure.

>>  
>>  		if (is_mba_sc(NULL))
>>  			update_mba_bw(prgrp, d);
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 60270606f1b8..107cb14a0db2 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -466,8 +466,9 @@ void resctrl_offline_cpu(unsigned int cpu);
>>   * 0 on success, or -EIO, -EINVAL etc on error.
>>   */
>>  int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
>> -			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
>> -			   u64 *val, void *arch_mon_ctx);
>> +			   u32 closid, u32 rmid, int cntr_id,
>> +			   enum resctrl_event_id eventid, u64 *val,
>> +			   void *arch_mon_ctx);
>>  
>>  /**
>>   * resctrl_arch_rmid_read_context_check()  - warn about invalid contexts
>> @@ -513,8 +514,8 @@ struct rdt_domain_hdr *resctrl_find_domain(struct list_head *h, int id,
>>   * This can be called from any CPU.
>>   */
>>  void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
>> -			     u32 closid, u32 rmid,
>> -			     enum resctrl_event_id eventid);
>> +			     u32 closid, u32 rmid, enum resctrl_event_id eventid,
>> +			     int cntr_id);
>>  
>>  /**
>>   * resctrl_arch_reset_rmid_all() - Reset all private state associated with
> 
> When changing the interface the associated kernel doc should also be updated.
> 

Sure.

-- 
Thanks
Babu Moger
