Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE39D154425;
	Tue,  1 Jul 2025 00:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751330593; cv=fail; b=Di2qnPx5pTr7gb7d7gjV+jz1kr8mYd0NKpSdt9vJPDH4BMykFS7fcQEG5v3GWww7EPzMG3JRRpBY4+R+1iexOYQLFmZL2QnGjMejk+MfhMpRf+eKC7lD9dNHGIIdY7k5zSpS9L4PMtMCObdEU+T8C10nRNKYscEnmVvlGAXlRMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751330593; c=relaxed/simple;
	bh=YbszPkj6HDXfVci3bVMAlZyv6rQLyX/OsFpBwAzRCqY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fBTHU93cLT++AWhJdNPEiS2rl9OcL2Gp5wZVhhCGB8SjD/WfQ0CYmqFeQ28aPZi236PigVvlvkocMI09SyIh56zxyY2yI1q4ZQ7+g/S7zSBy+6u+zm2jDuqvDQXD7p4ym2vYKZr3+hu44yBIytZMlSm6fJ3dJg031BHqABelCZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jTU8P6QD; arc=fail smtp.client-ip=40.107.243.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jTU8P6QD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7E/667N5tIdkVgHvlfKC3WfhiW/KP/VgHo+b+lDULOFtz2rlEMyHtef3krl4pPfencZ0Fvhw+qhTUfSAkzEktOVMTFLSqiLfFvLiys1ibIvS/SRKsM1YvIlP3DkAFPvnuc4ldQi75sgLkaKF+tkzL36/Qfny+WxtReqjxy6lEsgeE7aWMRI32ek1Eibc70YIGgLNvNCfiulh0G83sMR5Uw4h5qBeE0+l312H6efHIgHKUa+j+9P9NDB+R5s6tyXo1Gbm5VhFULqeloDitzLyFTPQVvDuXKxm/rJkNw8RFifzvcCA0FiR+WPzRRwDaWq8Xk1IL4k4lHIQOv3tWuKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGwAn/4K7JAhCMIXKJIQwJ5Exz+2CF97cT6+ypFBqi4=;
 b=fgNEXvhQh90pZV7gWUWoed2OUoWb3uJZi+j1yopDtrlrcp5n0ZW7/zXSl1Nz/UL9ujej8boZJiZ+VnI/WwxOm0isGbLYQjIpkJJppbIRCX6YhPFVgYq+S0NqjNKMjEOAlkufT5Q46RIZngh8l9DtasOXfYX+E6VyM9e72kuxonkF9s1TzEZw1LaHrmaV0w5CM/pNxZUeE18jcIfPSGQRHh3Ss9dhIYODHLOl2udJAveSY2zFfMf3n6TN+9P0YLFW/37/xSuyZiCKewJSTl+CrQhkcspHne8Zs/VM/XzwDeMy/hyc6P0Hl+F09KG9wzMYFmTbq9Sp9GRi5Zl8g3rbaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGwAn/4K7JAhCMIXKJIQwJ5Exz+2CF97cT6+ypFBqi4=;
 b=jTU8P6QDzYlCMIBDqXlbQSnC1fA5LCueSzv7B5prKv4Z1I6Be7O8W8C+Oq5uiB3XLDwh58GWS22nRtVXh/jCsMeGjcjWMmultNy8Ri7128yC5Bp/X8F445fNzaOJUXX1wv4DoKNI107VuBQ9np3CdSncWG23HwpDCmGIMEk/gjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.35; Tue, 1 Jul
 2025 00:43:08 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 00:43:08 +0000
Message-ID: <35238a5e-fa04-4e08-97ba-7e206c36bf4d@amd.com>
Date: Mon, 30 Jun 2025 19:43:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 25/32] fs/resctrl: Provide interface to update the
 event configurations
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
 perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, gautham.shenoy@amd.com, xin@zytor.com,
 chang.seok.bae@intel.com, fenghuay@nvidia.com, peternewman@google.com,
 maciej.wieczor-retman@intel.com, eranian@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749848714.git.babu.moger@amd.com>
 <dc097e5caa1c7df42c211fffb67f8d860a6b39da.1749848715.git.babu.moger@amd.com>
 <de1e1946-15d2-401e-a974-cbc86d08a78c@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <de1e1946-15d2-401e-a974-cbc86d08a78c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:806:22::35) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e0cadf3-698a-45e6-a19b-08ddb8383f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlFxUzV1SkkxYjA0RDA5YnkyaTZEeU5RaHZYNjMrNlh1RkxwL2NXV01QOWt3?=
 =?utf-8?B?aFRJd2x6c2J2WlNXd2RCNUZ5eDRjbDlVd1BIOEk2bnBhWEtydjVUK0d2eUNQ?=
 =?utf-8?B?ZXk3UkxaY0IwOXl1ZEtqbENyNnZPa2JpVEhRS3JLRTEwMFNTK3I4NVVxNW5Y?=
 =?utf-8?B?MUFKS2tYSWFRQ0EySGtyQnF2V3dlMGdUSlM3WFFlVUt4UHZTNGpPaUtwdkp3?=
 =?utf-8?B?aVh5RlpIakxEMzJEWXZnVE1mQlFtaUZ1VDM4QWRDM0FiKy9kVExPaEo4d3h6?=
 =?utf-8?B?c1JkOGNHemlJeWNjNlBSOFU2Ky9hZGFwQndGSUxheTNPTGhPNDBUL3lBT1lF?=
 =?utf-8?B?ZndYQ25yREJjY0Q4dTZrZjUyUHlyaWVndXRUZm5MUG9XdVlWU2xoYzVLVHJJ?=
 =?utf-8?B?Wmp1T0dmcUI0a3FqN3ZTVGkzbDFpY2NIcGw0a3JjRk4vbmNsMFBqaHBSN2Fv?=
 =?utf-8?B?cVlXb1FBSm04d01iNTA0MEhVRnBwVFljT1EzNitvZldZSkNQb2dlYkR5VHdO?=
 =?utf-8?B?ODUwNktKUzFQbERYeWJGRlJaTXkycEFzQkVjYWRBYUxWVzJWQitnVEdnc05l?=
 =?utf-8?B?NmplS0JzdkUzQmFCR09aamx1NmRod09Yc3pTdzBRSDMyNWg5YnB2VFUzRlIw?=
 =?utf-8?B?QVF4QnBoM2g2YkE1dlBRdEo3TDI3WTN4ejIrUk53YlpkQ1hlbG12eTY0SXFS?=
 =?utf-8?B?TGJWcVB1M3VHL0UxVDdDa1NQODFReWNXQkkrNDAwSkdCWVVmVkwvWk92Q0lM?=
 =?utf-8?B?eWdxeVV3cDRRTDJnOUpGcENSVjRveVZjN0tPdGppUStkZXI3VjMyRGdiRE4v?=
 =?utf-8?B?V21rOFVLWnpzNklMeVlRWHdjMlgxVm1vRFBvZE9kdTRQLzdpVjBtS1o4SWg2?=
 =?utf-8?B?aVpJMHdHOUxNU21aaXpFdEhKbW5EanR2UnFGbC9OZnduOEVBdE9TakdzaG4y?=
 =?utf-8?B?U2ZyRW1Ebmo5M3VjdGhTUFg5bFNuR0JWRjVXM1pqaGQvTTFmSG5zeXlQWXFS?=
 =?utf-8?B?Szd4SjF2WkNRcThrRFY3ZVdiWDBSTVN0UVBEeThGT2JsL2NRczZuclNzK3Bz?=
 =?utf-8?B?cXRYTk1TVGdUMWFMdXEwcmd3MzNXY0ozT3NvR2x2S2grM1hUNEpvWnMzK3Zu?=
 =?utf-8?B?MHExWS9Na3lqdnByWWUrNWwrbTgvcWN4dTF2Z3RkQ2J5blJneDRGejF0VzA2?=
 =?utf-8?B?SHNiVERMYmlkWlZMbCsxd0I3VGt2M3lUa2diYlR1VkFyZHY5UHVQVnVQMXBx?=
 =?utf-8?B?OG9oREwxS2VnZ1dwWDBZT0JDMUM3cEE2TElWazkzUmhzc3MxQXliRjJ5d1BB?=
 =?utf-8?B?cTd3Rm5ydFU3OFB5ckppWVlpQ016RW9oUmVmaGVnSVVGcFNkblJ2Y25WUG9O?=
 =?utf-8?B?bk1LODU4UHFDbUZSeWxsVkxFSy9PMW5PaGZnQm9MTWwzUHpvQ3E5Z1RPeWgw?=
 =?utf-8?B?d2FCRjBpK0grcHB6MUVzRyt2UG9VejV1MWFibm1weW5sMTJSbllwbGhRWUdr?=
 =?utf-8?B?ZDFwaVFVYUw4a1pWb281QTEwV1lsQVZmcWRxaldtK1VUaEo0cmx6ek54Ungx?=
 =?utf-8?B?WVR6THY4RVUzRXVzRWRkekJWU0MxY2hJd0lCVmcrRlpYSzhzNVMzeVNhT0s1?=
 =?utf-8?B?S2NGSmVQZlF1NFJVOFN3clM4M0Z5bll5NXg1ZzNZOXcyQ2Qvc0dvNWc2RUxJ?=
 =?utf-8?B?czFvSkl2ODlseDdFRk9VYnFwZkV6NVVlQmM3NVhMM1ZuWXlJZ2U2Q25PeXdV?=
 =?utf-8?B?ekI3UVdWR3Y0ZWhUc0NIaXd6Rk9PN3h0M0thVnVISWI4bjVsbFd3MmlEOTAy?=
 =?utf-8?B?S0pvNm9IQ2lZeHBYYjVXQnFJYW42VWM4V3R3blFTejh2ZTY5Nzk5TDcwRmM4?=
 =?utf-8?B?UXJSNHhGVk9vSkNnajVwR2x3M29DdVdRU1B5S2tmVDhncmRCeWs2eFhXS3dZ?=
 =?utf-8?B?RjhKc0xKR2tkSzRrMy9BYUJWcFVaSjZ5ZkNEQ0t1QmUvU3JYOW9pRU44RmxE?=
 =?utf-8?B?TWFWd3BNQ1RBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkRqcnN5c3ZMdndCYTk2UkpSa01MVW4yZ0hmeUxTbGNXSVJsajA0U2lCZG44?=
 =?utf-8?B?TWI3UWtYMU1uYWVlM0prd1lIYnhvUk5JT2ZCR2t0VEN4OHRVVmRITzE1elg2?=
 =?utf-8?B?RW16YmtmdnNTRzdqWjhjMjBldk1LQks3TUtRQmRJdWJaS0w2Wk5iYW50UTdp?=
 =?utf-8?B?eDJ4ZVY3SVErck1aUlR3U2RZZ3dGVVp5OFA5aWF2VTBiQUM5bTl0SDBYZExI?=
 =?utf-8?B?alBERzJOMDRvK2hPYXh3dExuVnVXR2VNR3dqOXQ2S2wwY0I1NEFEekRrdERm?=
 =?utf-8?B?V051cndGK2YwM1NCZFBBQkJJcDZ3aTd2OFVpK3dFcHprUTFxTmZqSk1mOVc2?=
 =?utf-8?B?UDVjdHNvbjFxSm9WQWRKVXd0V3dIdEdQTllMZTJUekQyNUN0U1Rmc2hwdXF4?=
 =?utf-8?B?TmJWeW1ad2xPaGM1NkMxZkhMRStwMEJtSUc2L1hHQ0RaMjYwSXBxcEYzckd6?=
 =?utf-8?B?NENNUCs3ZEs2RjZmOUs5bVFBQ01BWnRxYjhpcU53TTNPczY2R1U4YWhZblow?=
 =?utf-8?B?RU5SbmFhYWFBY0JBWUlTMWVQTEdYZUZhbzZoa1hadmk3SDZrd2pOcHE3Z2R2?=
 =?utf-8?B?NmloMUNxclFCa24xZmIweXF1Skovdm93RXRJUy9oVXpXUXduTzBTV0VNWEtj?=
 =?utf-8?B?NTNuZDA1bjVVdklwZDkwVzlRdkQ2ZHcxOW1meHFhWmljQ1ZzNDlVZHBqYjVX?=
 =?utf-8?B?bElPNFcwU2RGSk1YYkJGcjU4Ymw0eENtTzdNTlEyUmpvOUUyWGNCYWNJa2lQ?=
 =?utf-8?B?Y3NOMU9BRGJIbXZHSktFTjJiUEVkRFdVblNTbXZTN01EVlpjc3VZQVhZZnJY?=
 =?utf-8?B?UFZydTh1ODdmOTV0VVNmUmE0WHpLQVlrVTcrZGRUSVM5V0o0dUI1ZmpFTmVM?=
 =?utf-8?B?dW5sRnV3QmVsekJ0NytvOUszN2k0YnZqbkJaVkxaZFZ6K0JKbzJ0REFYd1hV?=
 =?utf-8?B?R2hMdW5oeGNPK2dmSklGdkxhUGIvUnpUWng1Vkg4Qll5U1dMOVRRMWJ6Wjl0?=
 =?utf-8?B?bk1UeHZzbTg0ZjNuckRTZlJRSlQyVVl4SXRuTkZkRUVMOWV5T2NhbUhQVkhh?=
 =?utf-8?B?TE9HeXlnVkVRWkFIZUprUVlhTWVaMGhmaXBiMWhOMUVDcytvTVgwQ0VCSmVS?=
 =?utf-8?B?OVpHbnBYekhucmljUlZtY2lQNmc4NVJZbDVQektxOWdBcXhiN3NmWUhCS3Qr?=
 =?utf-8?B?QjVCZm1UUUhjRWxOZzVCLzhnYVIzUFJldnJQNGdHdDl0YkFuSW9BdXJTYjZL?=
 =?utf-8?B?M2JjYzIvenhRU2hCeEg4N3RPVFZLRHJubFU5cm8vZUUzUUVmY29iYkRGaWZJ?=
 =?utf-8?B?bjI3MVQrbG1wTWgwTGh0N0lDTHdkUWpkV2lKekZLa2R0K3RwN2IxQ2hTWVZG?=
 =?utf-8?B?NWY1QWc5eFR4dUttYjFhVzhqcGlIV0hQdTJ3TzVDU29ybXU0NFNPNzZSUFpa?=
 =?utf-8?B?U0VuRTdSTXJiN3FCY01hM2QyNi91bHErTngwbEdOVDFpTmI3LzJnZEcvME9Q?=
 =?utf-8?B?Yk5tc21DRDJ2QUpyVE41bHduYXNHM0lqQnhHWmdDNE1La3VESm4wZWhtL2FR?=
 =?utf-8?B?WUIxYlBDdUxrTU83MGpjcG1uTCtweXhkaXpRenRxTlNZVjErZHRUVjhxbVlO?=
 =?utf-8?B?cGQwVXVCVVhqQ1dqek5rbFZsS3hhNmlma1VlZUMxbEdQWTlNeHpCWHhyaHBs?=
 =?utf-8?B?QThNK2hGcEd1b3FNT3doRzNpK0Vhakc0OUlWNnZnUmpOaEtKUmMrR3l2Y085?=
 =?utf-8?B?aG9QNlFEVXdkMHZycGUxSkxHY1BaMWFscGlYUENKdVpWaDMwc1N0cEp6QmZV?=
 =?utf-8?B?TE5lTi94b2todm9rSjVsRHhHbUUrY0dtcU0zRVdjeThrZkZnRDFWVlp4WllT?=
 =?utf-8?B?cmJsbXRnYm5kbkZIc3l6M29IWkdrUzgxTlNYZ1VRbThFeXdyY0NlbnNwY2RM?=
 =?utf-8?B?aHVpb0JEVE84c2pQdVJiZXNoOG9RQ2ZVaStWZ2VvaDQ3RnJEWTBURVBaakov?=
 =?utf-8?B?ZlREZDBDMk5lSGJEU1BqQXlkNFNjc3JCclJnZVJVZDgzb3l4Um0xS1hCL0dL?=
 =?utf-8?B?Mjl4N1pEWTlHYm5xRkE2aCtka2Vad3JrL0FzMnFGQjBiL2ZpMXhoSHFjcDBH?=
 =?utf-8?Q?Z1XI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0cadf3-698a-45e6-a19b-08ddb8383f84
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 00:43:08.2335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qImIxiscLMq27Ww42ns936SGvJw4Tv98sxrFcefvIRc/zTl9/2cET8CQgKMJQCpg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805

Hi Reinette,

On 6/25/2025 6:21 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> When assignable counters are supported the users can modify the event
> 
> "the users" -> "the user" or "users"?

"users"

> 
>> configuration by writing to the 'event_filter' interface file. The event
> 
> nit: "interface file" -> "resctrl file"

Sure.

> 
>> configurations for mbm_event mode are located in
>> /sys/fs/resctrl/info/L3_MON/event_configs/.
>>
>> Update the assignments of all groups when the event configuration is
> 
> (just to help be specific) "all groups" -> "all CTRL_MON and MON resource groups"

sure.
> 
>> modified.
>>
>> Example:
>> $ mount -t resctrl resctrl /sys/fs/resctrl
>>
>> $ cd /sys/fs/resctrl/
>>
>> $ cat info/L3_MON/event_configs/mbm_local_bytes/event_filter
>>    local_reads,local_non_temporal_writes,local_reads_slow_memory
>>
>> $ echo "local_reads,local_non_temporal_writes" >
>>    info/L3_MON/event_configs/mbm_total_bytes/event_filter
>>
>> $ cat info/L3_MON/event_configs/mbm_total_bytes/event_filter
>>    local_reads,local_non_temporal_writes
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>   Documentation/filesystems/resctrl.rst |  12 +++
>>   fs/resctrl/rdtgroup.c                 | 120 +++++++++++++++++++++++++-
>>   2 files changed, 131 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index b1db1a53db2a..2cd6107ca452 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -342,6 +342,18 @@ with the following files:
>>   	  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
>>   	  local_reads, local_non_temporal_writes, local_reads_slow_memory
>>   
>> +	Modify the event configuration by writing to the "event_filter" file within the
>> +	configuration directory. The read/write event_filter file contains the configuration
> 
> (to help be specific)
> "within the configuration directory" -> "within the "event_configs" directory"

Sure.

> 
> Note that "event_filter" is not consistently in quotes.

Sure.

> 
>> +	of the event that reflects which memory transactions are counted by it.
>> +
>> +	For example::
>> +
>> +	  # echo "local_reads, local_non_temporal_writes" >
>> +	    /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
> 
> counter_configs -> event_configs

Sure.

> 
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
> 
> counter_configs -> event_configs
> 

Sure.

>> +	   local_reads, local_non_temporal_writes
> 
> Please let example match what code does wrt spacing.

Sure.

> 
>> +
>>   "max_threshold_occupancy":
>>   		Read/write file provides the largest value (in
>>   		bytes) at which a previously used LLC_occupancy
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index e2fa5e10c2dd..fdea608e0796 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1928,6 +1928,123 @@ static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq,
>>   	return 0;
>>   }
>>   
>> +/**
>> + * rdtgroup_assign_cntr - Update the counter assignments for the event in
> 
> Could this please be renamed to rdtgroup_update_cntr()? Actually, how about
> rdtgroup_update_cntr_event() to pair with a rdtgroup_assign_cntr_event()?
> 

Sure.

> After staring at this code it becomes confusing when the term "assign" is used
> for both allocating and just updating.
> 
> Compare for example: rdtgroup_assign_cntrs() with this function ... the
> only difference is "cntr" vs "cntrs" in the name but instead of both functions
> doing the same just on single vs multiple counters as the name implies they do
> significantly different things. I find this very confusing.

Agree.

> 
>> + *			  a group.
>> + * @r:		Resource to which update needs to be done.
>> + * @rdtgrp:	Resctrl group.
>> + * @mevt:	MBM monitor event.
>> + */
>> +static int rdtgroup_assign_cntr(struct rdt_resource *r, struct rdtgroup *rdtgrp,
>> +				struct mon_evt *mevt)
>> +{
>> +	struct rdt_mon_domain *d;
>> +	int cntr_id;
>> +
>> +	list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +		cntr_id = mbm_cntr_get(r, d, rdtgrp, mevt->evtid);
>> +		if (cntr_id >= 0 && d->cntr_cfg[cntr_id].evt_cfg != mevt->evt_cfg) {
>> +			d->cntr_cfg[cntr_id].evt_cfg = mevt->evt_cfg;
> 
> I referred to this snippet in earlier comment
> https://lore.kernel.org/lkml/887bad33-7f4a-4b6d-95a7-fdfe0451f42b@intel.com/
> 

Yes. Taken care of this.

>> +			resctrl_arch_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
>> +						 rdtgrp->closid, cntr_id, true);
>> +		}
>> +	}
>> +
>> +	return 0;
> 
> Looks like this can be a void function.

Sure.

> 
>> +}
>> +
>> +/**
>> + * resctrl_assign_cntr_allrdtgrp - Update the counter assignments for the event
>> + *				   for all the groups.
>> + * @r:		Resource to which update needs to be done.
>> + * @mevt	MBM Monitor event.
>> + */
>> +static void resctrl_assign_cntr_allrdtgrp(struct rdt_resource *r, struct mon_evt *mevt)
> 
> resctrl_assign_cntr_allrdtgrp() -> resctrl_update_cntr_allrdtgrp()/resctrl_update_cntr_event_allrdtgrp()

resctrl_update_cntr_allrdtgrp()

> 
>> +{
>> +	struct rdtgroup *prgrp, *crgrp;
>> +
>> +	/*
>> +	 * Check all the groups where the event tyoe is assigned and update
> 
> I am not sure what is meant with "Check" here. Maybe "Find"?

Find.

> 
> tyoe -> type?

Sure.

> 
>> +	 * the assignment
>> +	 */
>> +	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
>> +		rdtgroup_assign_cntr(r, prgrp, mevt);
>> +
>> +		list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list)
>> +			rdtgroup_assign_cntr(r, crgrp, mevt);
>> +	}
>> +}
>> +
>> +static int resctrl_process_configs(char *tok, u32 *val)
>> +{
>> +	char *evt_str;
>> +	u32 temp_val;
>> +	bool found;
>> +	int i;
>> +
>> +next_config:
>> +	if (!tok || tok[0] == '\0')
>> +		return 0;
>> +
>> +	/* Start processing the strings for each memory transaction type */
>> +	evt_str = strim(strsep(&tok, ","));
>> +	found = false;
>> +	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
>> +		if (!strcmp(mbm_config_values[i].name, evt_str)) {
>> +			temp_val = mbm_config_values[i].val;
>> +			found = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!found) {
>> +		rdt_last_cmd_printf("Invalid memory transaction type %s\n", evt_str);
>> +		return -EINVAL;
>> +	}
>> +
>> +	*val |= temp_val;
> 
> This still returns a partially initialized value on failure. Please only set
> provided parameter on success.

Yes. Changed it.

  if (!tok || tok[0] == '\0') {
                *val = temp_val;
                return 0;
  }


> 
>> +
>> +	goto next_config;
>> +}
>> +
>> +static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
>> +				  size_t nbytes, loff_t off)
>> +{
>> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>> +	struct mon_evt *mevt = rdt_kn_parent_priv(of->kn);
> 
> With mon_evt::rid available it should not be necessary to hardcode the resource?

changed it

  r = resctrl_arch_get_resource(mevt->rid);

> Do any of these new functions need a struct rdt_resource parameter in addition
> to struct mon_evt?

We need to make a call resctrl_arch_mbm_cntr_assign_enabled(r)) to 
proceed. So we need  struct rdt_resource.

> 
>> +	u32 evt_cfg = 0;
>> +	int ret = 0;
>> +
>> +	/* Valid input requires a trailing newline */
>> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
>> +		return -EINVAL;
>> +
>> +	buf[nbytes - 1] = '\0';
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	rdt_last_cmd_clear();
>> +
>> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
>> +		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
> 
> Needs update to new names.

Sure.

> 
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	ret = resctrl_process_configs(buf, &evt_cfg);
>> +	if (!ret && mevt->evt_cfg != evt_cfg) {
>> +		mevt->evt_cfg = evt_cfg;
>> +		resctrl_assign_cntr_allrdtgrp(r, mevt);
> 
> Could only event_filter_write() be in fs/resctrl/rdtgroup.c with the rest
> of the functions introduced here located with rest of monitoring code
> in fs/resctrl/monitor.c?

Kept event_filter_write() and resctrl_process_configs() here. Moved 
other two functions to fs/resctrl/monitor.c.


> 
>> +	}
>> +
>> +out_unlock:
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +
>> +	return ret ?: nbytes;
>> +}
>> +
>>   /* rdtgroup information files for one cache resource. */
>>   static struct rftype res_common_files[] = {
>>   	{
>> @@ -2054,9 +2171,10 @@ static struct rftype res_common_files[] = {
>>   	},
>>   	{
>>   		.name		= "event_filter",
>> -		.mode		= 0444,
>> +		.mode		= 0644,
>>   		.kf_ops		= &rdtgroup_kf_single_ops,
>>   		.seq_show	= event_filter_show,
>> +		.write		= event_filter_write,
>>   	},
>>   	{
>>   		.name		= "mbm_assign_mode",
> 
> Reinette
> 

thanks
Babu
