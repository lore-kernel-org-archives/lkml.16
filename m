Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77CE253927;
	Tue, 15 Apr 2025 20:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744749470; cv=fail; b=vEONWy9Lp7dLU2FGIEsfRRgZs33Dg0J6DpWweEIe8dp/MnJFSU0q4pp3E31v1QKrMMpWWggqzZDb7xtF2QdAFHxj1mLmJW+zTx0ms5cisC6vA0eCwzpiaEUeNQeWM2v9oGapxuO60lI+pavq3QYmdgU+PxOj6G7z8njC8SHWtGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744749470; c=relaxed/simple;
	bh=ZASsWxgumEDidSbM/87PX1h7CciKm67Ro03oEZsstI0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hvCThZ0tsOLpcolmJbIipi39YfsYbnNq6TV7v47Zo19n2wQl/yHZy+LuASQBvqy2e1AxQk7hoKy28Zz0EYUlJpOvruwIXxmzOiYIRiNDLmreLQ6sV6/nYk4xE9BeT0o87yt60ypS9/k9e2Q0ZvrnhVaaJT8SZ0Y125Y8qCmKvCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vvubA/nn; arc=fail smtp.client-ip=40.107.92.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vvubA/nn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQzDzc84ydqkosk9vAsB07wY/t1IPCHJGUnHyBO0GbmyehDim2u5lhDl9htpSXZPQHGt84oJEX4HcQ+uSCXEBwo+qf2mm7drn27JVq8cmsWPXHZF/J/eDAQ8xEUA28EECG9ZBHcl2OfeVDEeqD8uKsMFKOr9v11Fja3QzGsFcOoz/sZpFTliuSs8nLrLAvzer33gJQ/fudBJhr28itT/iCZ4SMdm9N+bi72vaCHbvhazjWCpaM80LG80mYYT0PUE4iLoZyAlK64jGpuHDTHGG7TO42yZi8G6Flp0k5e+NJwsLcWGCtJfsmLB42N992Js/0DGWfm6mo38BUr1mkN81A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dD5ZahYPlplSMKJkBLuwWKDVGr5h7vSEkAdXwOUdo3U=;
 b=YcYJ1gxMZTND6b0NS904MuY5JjyN5SBXXaH2snxh1UxdvzhiT6hmYKQFm5vlzwWctmIQxr1ZFZ5w0D/Prfry+aWxO0WzSBfytzdj+YNxqGY73cVXSfGZ1/FlRzOKs+Z7jrTzYBaRKiHq0fev5MZWbOuLFV4uyTpCl4Dv1s4AWeaX3K662Sbb6boYA6/u5kljeo1sl8GwvRFJ6AGxWZBQ6VgEQn7rWpjA3wBbDjM9gZm+qbq7hLPIj4GpwIFB1ERSIv+1kJaw/Mj+VVwrXQNqsnkj1RC+jyMd7rg01lVw8EUCJw8B+JarFVyL8K0eMO152F1nSOo8czU7isOnjlty4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dD5ZahYPlplSMKJkBLuwWKDVGr5h7vSEkAdXwOUdo3U=;
 b=vvubA/nnf2JWAyfLA0mCkYP2v07o1xuSC1OQDKevrHykyGz0TGqo1cKbOpX1JcmGw+9NLeYkipCcXX69yB691cBgF487L21C2wuuFCy/C5z/ngtl3xm6a3hfAt7R7wLbDZDlbiVaKwno51JowfxGvF7oWWf82hSnJfqLnW9i3iU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DM3PR12MB9349.namprd12.prod.outlook.com (2603:10b6:0:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 20:37:45 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 20:37:45 +0000
Message-ID: <7423145d-7de7-4414-85be-b7325c01b437@amd.com>
Date: Tue, 15 Apr 2025 15:37:40 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 20/26] x86/resctrl: Provide interface to update the
 event configurations
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
 <d18beb9ca31eb013405677792377542e609ea693.1743725907.git.babu.moger@amd.com>
 <7be35258-f913-4111-b5da-c4173615cf18@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <7be35258-f913-4111-b5da-c4173615cf18@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0138.namprd13.prod.outlook.com
 (2603:10b6:806:27::23) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DM3PR12MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: d528a09a-07da-4293-d33d-08dd7c5d60b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0YvZlFrNUhKSnc0S3ROa3JsbFJGWm1NYTNPNWNRSWJkdXQ4aWViWnQ3SWFM?=
 =?utf-8?B?K3BLV2l6ZXBqeGlRbzJ3cFV5OW9zME16RUd0bTN6a2hHSUpibXBpWEJ3Tkw2?=
 =?utf-8?B?NTc0WXRyMHJLQzZHY25wZVUwK3ZtS2drbExhSjhlZ2FNOUxWWHZCRVVxVE82?=
 =?utf-8?B?Um9XRWFxUFY4M3c5enQwRU5HUWE2aWtwS2c3V09KaFpjK1N4NXFHZkRrQnY4?=
 =?utf-8?B?SGtaazFZQVd0NjZUSWloRFI3am9XWkoxdHB4Q0lkR1o5S2VBeGh2VVR6WCsz?=
 =?utf-8?B?ZHV0cEJHSE56NVNzU3RUVHBVOEZCSGdKQmhTVWVYS1RoVnp0OE92SmlreHYr?=
 =?utf-8?B?MmZBTmM1UkQ2M2Evd1hvQ05ML2JOV2xvMFZuSFlhM2hNWVNCR2NhNCtQZDRs?=
 =?utf-8?B?dXpRWmpQbTBkUVI5MWUyVmZVNDNZRXdlbnRPWHUwY3dIdTZpOVZvNERlMFow?=
 =?utf-8?B?SlRmZld5SzNxQTRmem9wQjlqMDAvT3Y3dkFYNTVFcWJNYmV4QXhCdE54OTJY?=
 =?utf-8?B?TkxRS0JLVEpGdVdvWlF5cGtCOVpwSENJV0IxS2xpRnJoRmRYSWszL0tjS25v?=
 =?utf-8?B?Q0hvaWZZVmhDam5TNjdVZTA2T25raVN6YTRUUUs1V29KZVZiUDVoSkV4OHJL?=
 =?utf-8?B?aWszcU9mMTVVSWtOMzZLYlZ5dXdQVGxrWVVHVW5FdVRsR0pDM1VFYkovWWNH?=
 =?utf-8?B?S0x0T015Z2FpeU5ldk9yM0RBRkJCNW9lQ0ZrYngrYlR6eGladE1ubXAxU04x?=
 =?utf-8?B?V0xBWkpNY1dNa0p3YWd0SnBwMm12d2U3RjZ5UlF6dzNDYVpKZ1JHSlFQNjRi?=
 =?utf-8?B?d0Z0MWcxeUU5eExMTEMyQmtwdG1IdWZxd3liYVY1c2hBK2k3TW5IRDFGZWVn?=
 =?utf-8?B?bU96NTJLV3BDckI5NFI1a0czNDVDSXpXMHpsYjhDK0NTMHNrUytiRlc2eVI2?=
 =?utf-8?B?VXZaZ2VyTnpOQmpVYno3cWZUQUg3elZGMzN1elRiQWJ2NXVuWUVWbmlMdlgx?=
 =?utf-8?B?MEZxa3IvYVVEMXQzbjdqWHlveFhYTnFLQUxSNm1jVzRXb2tvNXk4VFhJMGVm?=
 =?utf-8?B?Q2FQbmUzTUtlRDdpaVR6ZEVDRzdyZDQyaFJ4d0R3bDJweW1jQ2VsZEdpZTMv?=
 =?utf-8?B?Vk9mcUROaElyb1hoSEN5VTh2MmtuclAxelhYcldPUlhzeUtpOVlzVDV4ZzZh?=
 =?utf-8?B?M2ZxWXk0VXNMQVFnSjVCcGU3cHJpbnFwcjg2cmNIaWtPVmxUMElmODZVU0Rh?=
 =?utf-8?B?WXhjcXA3SHcwRUhweHRoSUVBTnh2djNSd0E2TDhkdjh1RWdkaXdjUDhFK2NR?=
 =?utf-8?B?Y2FpRUpNQW1pZTd4VHdIZnVFVFpXL2hBdDlqRlFFcnE1dktzRG5naVJtY2ZY?=
 =?utf-8?B?cEQyNUk1UnRkYUw4QTI5VlZaUWhHVzM3b2JNekN0UndlRFAvRTFkQ1lQNHE3?=
 =?utf-8?B?TWg0ZjU1NXNxMVk5d2N5WTJORU9tMHdpWTFkak5tck51cnpnU2pVdFBMU0Rm?=
 =?utf-8?B?KzREcm1Eb0NKNktyQnMxWHNDK3lpWFgwMjNRWnJKVkprUGtMMHJaODZNV1hq?=
 =?utf-8?B?S2xDZi9EVDA3SnBrOGVOVS9leXFhTDd2Q1ZsOFIrUzJsWjY3UXZtQVZ4aWVR?=
 =?utf-8?B?TVdhUDJNekY2MEN5eld6bzF6SHptcG9sZmh2OXAweThNc3Y0b21OcGlzZ3Fl?=
 =?utf-8?B?REVRUHB5K3FQeGJtL2NBbEcrYU1ZSitZMUxQQU0wK1J4YTg4Nkw4YWZQTC9L?=
 =?utf-8?B?a01HdFBlNHowQmdnby9BdW1kRDlBdU5IeDl4c0dhd0xIZERVc3VLdVp5S084?=
 =?utf-8?B?eURlQ2N0VjhQeGtiUXVkVy9DVmt6aTlpTU9hTXhucHpVdDlVN0F2UFFubmFv?=
 =?utf-8?B?aEJTSkJpeDRMR2VNcVBIdFhleVEwbWhIdW96RDZoZjdsOVdNNlFnelN2Vmlx?=
 =?utf-8?Q?VDX6B7/prCU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S09PM216bitWSW5OU1NkVW9XNlVTRUxuQm9JTVNCOUFubktTS21JNGxaaDhi?=
 =?utf-8?B?emozOVpVSGRqUEc0SnFmdnFQenYvZXo3M0tzWXI0MTJvK3ljVEo2Rkc0TzhC?=
 =?utf-8?B?WmZ4eWQ2MzNzdm1vSm55Sks3YWNLeTRFTEYyeXdRYUxQMHMvZmRDbTBBVXpp?=
 =?utf-8?B?WDBNdWppZDlaSlBTYVZDdjFIQVF4OHI1Nm5aOFZhY3RBai9qdTRwYTdmZjF2?=
 =?utf-8?B?WVhIMjkxeDFVd0ZpekY5dGJXUTZrT29JeG5uQUVodjJpRjdOSmVCUS9GUnli?=
 =?utf-8?B?Z3Z5Z1RTdmR4Sy9FMk8wWDB2RmlPNng1TFk1cnhsRHB4QXptbVI2ZVVQSldI?=
 =?utf-8?B?UTNqcDNqM2s1L21ocENLczBkSDZXbDlLd09CMll2M0NBN0VjbGdhWDc3cVcx?=
 =?utf-8?B?eVZvdEVsekFhdmZWTk9RTjBSTk8yeGYxcjZtZVI2Z1FVVEhHOHZGK1VsKzdu?=
 =?utf-8?B?UURDMlhMNngweGI4ZTJUU0M3Uk5nMFlTLzlMR0FKTXF1Z2o4K3RQRTIySHVN?=
 =?utf-8?B?bTZlK3hBbnpscFVJcUpORC9Hb0h0TmU4ZE5DZWtadzJsWlpJNk0reWg5ZjZE?=
 =?utf-8?B?SkJvTFVTekdrd2s2YU1CODBHZURVYkxIdE1Ld1owRnRUakkyS1M5dmtuUHU1?=
 =?utf-8?B?YXQ4Ni9ZRnNMMVlFNVd3b28xNGlaWmQxMzY4T0Zqc2pJVVNhaTlZUng4WW15?=
 =?utf-8?B?bGxCUFhGY2pVVGhIV2s5NlBhUGtka0NBU3NOVkhHdEpaMlZOZXF3Ti9GaFIw?=
 =?utf-8?B?TUQzT2NQaWZkYktGd2RYUk1zTzlEKytnb29rVVhtRFpxbjRRSUdVVDVGTklH?=
 =?utf-8?B?dmVCZGRQWlA5emh1VFFabVQrOUZKcitWd2wwZE9sbEpabVpHbHNxVjN0WURD?=
 =?utf-8?B?TGdKcWlBM2lPRmR2ejJMTDE1K3ZDWnlzZDdmZ2g5aWNhMXZFSnl2T0NqOHBm?=
 =?utf-8?B?WDFRWng5TmZWM2xiTG1KdG0zcEJJdDQxRXBwNGhkSjM0Q3NvVCtWeWRsOVJS?=
 =?utf-8?B?N3VLb2U3dXFHckNvblRjVnI3RUJNWTIrazBOSjdrUy80WUpzWXpyOXA0SnQ1?=
 =?utf-8?B?WURzVzhHUTl2a1dDVUtZTzF4VnVVd01ESndDSk5DYnJjRDlBbi94emlJNHlu?=
 =?utf-8?B?a0h5QW1kZ2hsTFFyZ3hTQXZIb3FydDdwU2xGMlYzUE1zbmp5UGZnZExia210?=
 =?utf-8?B?V0V5UVc3WnIwOUZuc2NEeEVwQ09lclVzYi9ZWHMyVWp5RzNFaGJVa3BKYjJQ?=
 =?utf-8?B?Y1V6eHA0MEZ1VS9YNldJdkF4NjFUSytTRnlTbUlhVWt2b0FHT01oMko0VXVH?=
 =?utf-8?B?T3RzMGFiQmxZN3NlemVRMUJONTFEMkw3VmJPTkJVOU52MmFQOFlvenR5RVQr?=
 =?utf-8?B?S1pNMDdYYUpVeEFzcUQ5TjZDSURXdjRnWWVkN1gvejhUaFBSZnlsWTVZVUMz?=
 =?utf-8?B?bjdoWlFZTktKYlVLT0gwYTI4eTVGQkdsRm5KUVBOTjJ4M2E3TVB3bStTN0FH?=
 =?utf-8?B?VjY3RHNZTkZjaGFLREtXRVg3bldvL0JSbEVLWmY3TVZLbjhncmNuSUVKaUx2?=
 =?utf-8?B?ZU9VU3V0QkpRM2RPNFU5ZE5UN0lmK0Zkb2w3UXUwc3ZlbklwekxuSm5xd2dC?=
 =?utf-8?B?M3FyQnJEMHJKQ01RWjYyTnBDbGlOa0UwVTlaNWVKbk1Dakg2WjVVcnFmNkl1?=
 =?utf-8?B?cFRxUnE5S293SHNWbEI1Q0JMVzNaYm1ENlF2L21MM3RDNGdyeFB5Sjdyd2tq?=
 =?utf-8?B?T1RqSTV1WFlWY1dQc1Ewc3ZIRW9jaXhCMnZiOEs3NGNaVGMxNWkrc3l0U25r?=
 =?utf-8?B?SkhHNm9GSGYrTEdrMTRvSWlHY1hhWGpjUGtuQlpVRE9qbGpsck9rWXhiYnkw?=
 =?utf-8?B?bk5pejJHaGVEbWdsVFhnWStDTklRQ0ZFL2hkNURtc3dtQ0xmSVNaKzdFSFBy?=
 =?utf-8?B?Z3lySTUzMEZDVWpZVERQRlRPY1dWNnowcUpNU2s5SG1QQ1NFRXNPdGludVBV?=
 =?utf-8?B?WXU5VkFBQ1FFQ0lNWFRzTVZ5VGFObzlRRTBkSmZUc3dWOEZ1SDlPVjU5ZGtp?=
 =?utf-8?B?cDJVWEZCa21zSEpteUtsSngvWStwQkIvQ0pCV1p2RDltdFJVWk5ZTGRWaCtH?=
 =?utf-8?Q?CZx0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d528a09a-07da-4293-d33d-08dd7c5d60b7
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 20:37:45.4976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VnrxxbMJ2u4d3a7mdxHSe7YKFnxoJiwkhdn5k5k4CxqZDpoVYt4KTtzWTywEpiX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9349

Hi Reinette,

On 4/11/25 17:07, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/3/25 5:18 PM, Babu Moger wrote:
>> Users can modify the event configuration by writing to the event_filter
>> interface file. The event configurations for mbm_cntr_assign mode are
>> located in /sys/fs/resctrl/info/event_configs/.
>>
>> Update the assignments of all groups when the event configuration is
>> modified.
>>
>> Example:
>> $ cd /sys/fs/resctrl/
>> $ echo "local_reads, local_non_temporal_writes" >
>>   info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>
>> $ cat info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>  local_reads, local_non_temporal_writes
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v12: New patch to modify event configurations.
>> ---
>>  Documentation/arch/x86/resctrl.rst     |  10 +++
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 115 ++++++++++++++++++++++++-
>>  2 files changed, 124 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index 99f9f4b9b501..4e6feba6fb08 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -335,6 +335,16 @@ with the following files:
>>  	    # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>>  	    local_reads, local_non_temporal_writes, local_reads_slow_memory
>>  
>> +	The event configuration can be modified by writing to the event_filter file within
>> +	the configuration directory.
> 
> Please use imperative tone.

Sure.

Basic question - Should the user doc also be in imperative mode? I thought
it only applies to commit log.

> 
>> +	::
>> +
>> +	    # echo "local_reads, local_non_temporal_writes" >
>> +	      /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>> +
>> +	    # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>> +	    local_reads, local_non_temporal_writes
>> +
>>  "max_threshold_occupancy":
>>  		Read/write file provides the largest value (in
>>  		bytes) at which a previously used LLC_occupancy
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index b2122a1dd36c..7792455f0b26 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -1926,6 +1926,118 @@ static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq,
>>  	return 0;
>>  }
>>  
> 
> Could you please add comments to these new functions to explain what they do?

Sure.

> 
>> +static int resctrl_group_assign(struct rdt_resource *r, struct rdtgroup *rdtgrp,
>> +				enum resctrl_event_id evtid, u32 evt_cfg)
>> +{
>> +	struct rdt_mon_domain *d;
>> +	int cntr_id, ret;
>> +
>> +	list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +		cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
>> +		if (cntr_id >= 0 && d->cntr_cfg[cntr_id].evt_cfg != evt_cfg) {
>> +			d->cntr_cfg[cntr_id].evt_cfg = evt_cfg;
>> +			ret = resctrl_arch_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
>> +						       rdtgrp->closid, cntr_id, evt_cfg, true);
>> +			if (ret) {
>> +				rdt_last_cmd_printf("Assign failed event %d domain %d group %s\n",
>> +						    evtid, d->hdr.id, rdtgrp->kn->name);
> 
> Please provide the actual event name to user space. The event IDs are not visible to
> user space.

Sure.

-- 
Thanks
Babu Moger
