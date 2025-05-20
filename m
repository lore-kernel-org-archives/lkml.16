Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DB425393B;
	Tue, 20 May 2025 23:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747783547; cv=fail; b=Fmg/NQmNPOvJbyU05NxC0LNqq/3bsjEtr14CdRyOaOWb7GeW3T1ZrMheIOAUgHfWnM3LtQ4gruRnkqu5YRqy5ZahsessFYBZC1IJuxdxCLo1o0PmHvUmDTUdTHrmm3pyVE3f4bEA8iLkzROOYfUsybkv1klysxXRfrZ1yvPL1qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747783547; c=relaxed/simple;
	bh=X8rhC8XRfHmnqevX6jB/lfW0XY5QU9xugLgCBHK2fZc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DbwtOSgW21Q4i/qV7YaYM9dxgngl8D1pKiEJ8o9fIHYGjpb41Z2fYuAGzFOMJWlHFq6PWUdwX22FUs1TcAWVzhv8elu4+qzrVwlGPV1IH/hwFU/yNgvvAcdiQwpbao1pBn1QmNGM2OzwuCFsVN1I2ScWT2QSiG518T4MiKT5aXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3khBMYFI; arc=fail smtp.client-ip=40.107.236.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3khBMYFI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+PNoFa64wIBhhEqYhzHqWkMDSRttKxeBiIs//KokVli90geHwBMFReEbpmVFQ6xcPXjUIQdHWBOaPSF60FVH8ZNp/jYDk2LYogOJohm3nbO1GAJlJX5dli1BX+GFUjZm+ZIUvt97gKsQqdUBDTzXfznEPztF141bGUH87Lsv9pq/poPfgKhl957cCfW+zAb6r8Kt1UqVZz85EBBg8fDA3Jjk1dDpvl7eT5VQX/gcXZa0OIfXmPLRBJGnaV11/1MlZqEF2DAUpSd0ElENy1HZzEEX0J1ZqWHdXSJQxLd/T492xtBv0G11X9DKqAeD2u4Jeh9qQxxBAZkopFcOvcJ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBdckqd89ZolJVR3sSmg4YfEadVC5kJK5UQoFIyyUPI=;
 b=LDQJ4CluIJbH/ps1NBdRYWMVdHYIIVufVUdZxpWStVpLALObkuNXodAtx/GFQHgylOHGG3TQaXsKWBd6ncZ0u0tBxN/YnfCFGDVRQ61MIWKMdtwuEwq2p0xBY70DJ25bbt423o160xrtsW8GDE6o4iF9E1tOzSFHNGlnXIpFQtGBG3xHx52c8sOgsG2b9E/3MdPyCvBC9ixM2hzv9ysT6uxvYNEjp8Dc4NlKWndQJGzno1Yu8fhr5nBOVrXGPtme32EKj8j7AiaQr30FVbaEYbHvHyGd4wd8uOhrx9ty8yHfThC9J4ZVJMjaekvTTinlwdDIAvC/65oD162maU5RLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBdckqd89ZolJVR3sSmg4YfEadVC5kJK5UQoFIyyUPI=;
 b=3khBMYFIIbgxQPwq62WNCln1UfJCxuM5tRAnNj7AxtozeS61VzWQdAgDRblxDLJL98r6oAt4jBmapGWTv0MKoaeFfCap/Wq+2MZPh2YMKQTabLFVyL3/hTUKLlz0t699/WW93dPJMZvoNivN6p8ksqjA5BZomulO0V7UXQKSuD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH3PR12MB8972.namprd12.prod.outlook.com (2603:10b6:610:169::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Tue, 20 May
 2025 23:25:41 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Tue, 20 May 2025
 23:25:41 +0000
Message-ID: <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
Date: Tue, 20 May 2025 18:25:32 -0500
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
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:408:e8::11) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH3PR12MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a4b56c-d600-485e-ae4a-08dd97f5a2bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U21tYWx0dEJJS2x3a1pNaUlaNCtWZjJzK2dJL1pBT3Z1QlNBKzhxR3IveEpR?=
 =?utf-8?B?a295VWRuQ1JSYTRSa0szVnhVY3ErR0FobEpNWEQyTGtOdWV6M3F3MUVtZ2dm?=
 =?utf-8?B?dzFQVUdsU01NekNjdkNFVHkxcjdJKzFSUHRZZGFmdk91NEtjd0wzZ0lmNG5u?=
 =?utf-8?B?Y3ZVOFlkUGk3eGR4QnRGcWJRRDJNbC9CN2o1My9WcDYyOFFXMXIxb3pFNGh4?=
 =?utf-8?B?bE01WVFtY2xjY0g3VjJwNUxhbTNCZDgwVGkxQ05FbHJra0tHY1JvRG4wd01T?=
 =?utf-8?B?V2d5NUpTcHdQZHViNExpZWQzejByUlpxYmxJNXRGUkllN2t1cnlHZWExNFpQ?=
 =?utf-8?B?UW5FSldnT1l1RnUzT2NnQk1adkJzVW44NHF2QUM3RHRUTHN5a1J0OTY5Q2RE?=
 =?utf-8?B?L3o2OTJpZGg3UkM1NGlKbXRFNkFYZ3F4YnBBOGZKUTJXbTZheXVwQ1A4ZFpn?=
 =?utf-8?B?N1BWWlpNZmZ3K25DMC9ZY1AxOUJEVkNrbWl3OUxGMHpyYXpVOTZoMW9pWnBC?=
 =?utf-8?B?dXp5STFVTmU4bzhucG9RbE40UHUrR01FdE5kR2RsUElNN2w2NU9hUkNUWS9K?=
 =?utf-8?B?YkRGRzVXeGxPSEdVTzQwMENmRm40a09qQkY2ZmZVQzlLUU5kMlBDamo4UDdy?=
 =?utf-8?B?NW51U2VBUEp3M1ZMZDFCWm11ZlhvVnpNMFIrOExQUmNaNUQ2VUlOYTlrQ0Rz?=
 =?utf-8?B?aWUramNVNFgvb2tkNTlaVjUxcmE2aWpIRmFJNjVvVFVxcS80d0s2SjN1cXlh?=
 =?utf-8?B?YVovQTAzYm5lS3AyZ0FPbFY0SHhTRktDRWtFd2ZFcTEyWkNpQkh3NkZrMncw?=
 =?utf-8?B?SjdSMzVhWXlENGIyaDVGQjVEVEdYcWxvb3Y4N1AwbGRsTjVmNGdNd0lDa1Bv?=
 =?utf-8?B?V2YvQzJ6dDRvR25tVlBLOGJQek5FWjdvWUF0dURiVC9rUkFleTlwTU1QN0sv?=
 =?utf-8?B?R0ZIcFdFbEMvVXJ5bExYVUJtVmpZR2xQeFFyS3drRzBjVjE2d2FCQnVoMTFJ?=
 =?utf-8?B?NEZ3L0xMVFFWb3JFODhsQ1RhNVJsc3hBUmpueTgvSldZRERnUVlLUklTNEZH?=
 =?utf-8?B?Z3VjQm1nc1NiTVB0UDcwMHBWQS8xTlZnUmhiWmNMajlIUGtDVlFEOWZPc0sr?=
 =?utf-8?B?N2FhSU9DYUk2MkNVVk1kMkhLNjAyaEQ2NndDUzViaXFkaEVLWStXV0dtOHZW?=
 =?utf-8?B?eWQ4aVc5QjhhQXV0cW5EN0pGU21HU2l5SFA3bjB5d2xHdlplbG5wRGkwWXdH?=
 =?utf-8?B?bW80NzJ5elJQbDBqbHlzdUFUcm91elZnSlBBbEU3a0d2Z09GRFhoVzB1SzF6?=
 =?utf-8?B?UlM1TVRVbm56UlQ5MXdRR3JtVnRKVlVUWjRJSmMwMklkZS93ajFNWWo2QjAr?=
 =?utf-8?B?NzJ5VTZMT0Jid1pEUzc3Si9jeVJkRDdUWUQ5QTBNN1JpN2dFYTNRbWFmZUJa?=
 =?utf-8?B?cVBuRXIxdTd0QUtvWkZlbXJwcVhRTFJ4aW54RUcxdHg3UWhSYXFnd1pxbXcw?=
 =?utf-8?B?SndBRk9NZjU2UTZXNEFTUThiVFRLMWVMNmQ4aEN2QlJxK2hMaVBmQnFXaGZT?=
 =?utf-8?B?RWtFRFhEdzJjSThCZ1dENEZOTTVOdXIzN1Q1ZXRrTStVcFA2UmF1Q2Z2bk5G?=
 =?utf-8?B?TEMyWTRMZzhCbVRwTm1SOFowSzFTb2E5WnRuWW9EZzEwU1kyVU5jVStXSThs?=
 =?utf-8?B?NkE0SU5uZVRxcTZrUGg1UFIxMkNuaTZhdnhlcXFRSmtVcC9vYVN0RXdyd3Js?=
 =?utf-8?B?MW9GWmtKVy9KQVgwb0RHeFJiVUxkby82bTFWdjNZQm9ZL2Eyd3ZXK3NjSUhk?=
 =?utf-8?B?c1RJN1ZKb1lPMlhubm5nam1Deno4elhhM2pLbEFQQVlLQ09GaDZZYkJFanNY?=
 =?utf-8?Q?Z5FFMvmuji2PU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UW5KWmRGcHpoL2ZsVjhJRCtCaWQrdzl2Wmg4RXhVNXFwRlJITFBwREZtUWt0?=
 =?utf-8?B?eVBzOGRUbnkvZ010WnlKdkV3UVljY05MTGxZZFFrREVnWlhEZE1XbEtZUzYx?=
 =?utf-8?B?cllVRFVzd3QwenVvSkNRSXIyUko3MUNRaDRUSUlML0xmNG54NDIxUERGUUt0?=
 =?utf-8?B?RktWRFdyekxNcDN4V0d3eHpheWxSQ2U1RUFDOVVoY1JVQ3BqcHZnaUpHeEFo?=
 =?utf-8?B?UVVNVjdXdThFVk5jU1J4OU8zdFVuOGFFV0JBZTRSVE1NQ3ZobVJLRDNub1NO?=
 =?utf-8?B?UW82eE12Yi9lc1dBNUh6a2tucjYxVEh3RW5xTVl1TDN1cWU3WERtTzNORHhX?=
 =?utf-8?B?eDUzYjdoRk44c3BYWVNQSmtBNUNCdkZpb2xRYm9oU05QL0JDVEZsbTB6cy91?=
 =?utf-8?B?cHdsOHZGRk9HWDRZUVgzQmdlSXZuSFVYK2twam1wWCsrV2gyMUlwUjBDNjVx?=
 =?utf-8?B?ODl5UXpkc2x1S3drQU9BRjhrVWVCMzFYMW5hYmFXRFQwY3d5Y3h1cmdqSjVx?=
 =?utf-8?B?aGliWDlvOXpjeEFSS2ZYeDBNSEkrT21oQTAvQ1FKUEdBOWNiYWcxZFgzUUwv?=
 =?utf-8?B?amhSTTV2QSs4L0trTFRBSFM1RGo5VkNwbjQ5alJuSFcrTGtpaU1CQmRMbUlL?=
 =?utf-8?B?dnJKL09OeC9EUUx0cm55VlRkWCtCRitHRHBkSFByUWZiK3Q1QWcycTBjSFF5?=
 =?utf-8?B?L3dtMGp2MHBkeTlLcWtZeW1CZ2oxdFVIRDVIR2ZJbDNIR3F3NlRrUERsdU1s?=
 =?utf-8?B?MDQ0UldPZTR1ZERZNU5pZVZTdXdSeVl0WEo5WnVJYk90UWpoS1hHSTVPL05E?=
 =?utf-8?B?dWFyWGMybFN4Z1VTb0hMbWkzeHlCRnJtVUo3dW9OdGtSL1BOUUN0S3pxbHYr?=
 =?utf-8?B?VFFyS0VTdWFLeVRxenVNY1JBbDRHZndQcU5UWGlJSXpCdjI5Q3RJcjVHUTlq?=
 =?utf-8?B?SmpleVFrTUlMRVkvbUd3Wks4bXZ3dW1OUVkrWHdxTTFnTXZ0YXNjZHhlNVpq?=
 =?utf-8?B?eXAvRzRYMklRUitoSFQvVUlvU3pOcjlqbGZ2YVZwTGdKbEJnMDIwbXhLeFhC?=
 =?utf-8?B?OXV5QU9EZ1d5bkxNajNUWFhxVHZ1azJDRUpRNjMwNXhuWVpyU3RuWTk3a3Zy?=
 =?utf-8?B?cUtJa05Gd0llU0dSZVdoNFk1YlVXNDlqWkw2M3hnRkgyVStaZjIvN1lTR1lC?=
 =?utf-8?B?VmpYbHBxTDhpZmRtUDUzR0pyZVkvaEllNjg3QUFwcW5DUW1QZXFRam8wT2Zn?=
 =?utf-8?B?ZHZUenE0Sm1QTk5sNGhBaHY4V1NSTWppYVlJMW90UTRFWUlmVUlHbEI0QTNK?=
 =?utf-8?B?cmdlalF4Tnd0VWx0RGZFU1B6S04zaThZSFpxWjBiMk4wS1Jma1p4QnBBc2tP?=
 =?utf-8?B?bUFIODl1OHNURWt3T0JsU2FINVpHRFAzSmtrYlF6RTUyZnV1MHRuOE9aWDBq?=
 =?utf-8?B?dnAyWU5NYkVySDArUHhHbUlCNndLVm9iNWF1ZVNBMjNYQkFuUjlXdVZvY1JY?=
 =?utf-8?B?SzRDcHNkcmxIU1gzMjd1Zmh4cXkwMGgrTkpXSkJlOWJNbHJBMVVkZzdKVFZK?=
 =?utf-8?B?NEo0OW5lMHpITWhCckZreDNqVXEydjZoSlFXbGdxWkhEM29vOGFGbSs3a3Fa?=
 =?utf-8?B?OUp6RGxJVSszQm1DZEdFNG9wVVAxa2ZIdU52Z1pnWklPa09NeUZ6MGRMcyt2?=
 =?utf-8?B?czFnOGs2c0JEQ0VGWDRteG1aZHRKdXhsMDI2a0hhZmNnTmZnRjRwYS9DT1RM?=
 =?utf-8?B?a09qd0tuMWZDWVZkdkZTK251VlcrRE5LK2d0VGdEM1R3ZXJiQmhyelN4V3VN?=
 =?utf-8?B?K1Z1WXZDUE1FWjNTc1JycmVnMHIyTlN5S2c5S29QYzZZQXUveU1EQ0toNTJ6?=
 =?utf-8?B?Rk8yVDA3UVY3WksvWGs3TWhtYzZ3SUJqaXRwbEFLTm9lNHpQKzRRSE9YWnQ1?=
 =?utf-8?B?TWk0OXRuVVhTT1k3S2M2b3JWOGJtcDB0THY1OHhmZ0djdWltOTZicHJOTTZR?=
 =?utf-8?B?bGdCcVpnOXQ4VlBITGNtODhvQUhPNk5wRnNEL3V3Z3gzL3FpMEMzNzdiSlVn?=
 =?utf-8?B?bWt5am5PZ0Rwa2dhL3h4QXgxZis2cWlPelh3a1BGcjU4NzhNN0FML0h0YUdT?=
 =?utf-8?Q?6i2Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a4b56c-d600-485e-ae4a-08dd97f5a2bf
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 23:25:41.2629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TW3VACuxfl8LTrKazM0t0KGxIgwJAzi+CLSsauUT2UNjQEjZePa0cRpoKprJK4n6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8972

Hi Reinette,

On 5/20/2025 1:23 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/20/25 10:51 AM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 5/20/25 11:06, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 5/20/25 8:28 AM, Moger, Babu wrote:
>>>> On 5/19/25 10:59, Peter Newman wrote:
>>>>> On Fri, May 16, 2025 at 12:52 AM Babu Moger <babu.moger@amd.com> wrote:
>>>
>>> ...
>>>
>>>>>> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: Reports the number of monitoring
>>>>>> counters available for assignment.
>>>>>
>>>>> Earlier I discussed with Reinette[1] what num_mbm_cntrs should
>>>>> represent in a "soft-ABMC" implementation where assignment is
>>>>> implemented by assigning an RMID, which would result in all events
>>>>> being assigned at once.
>>>>>
>>>>> My main concern is how many "counters" you can assign by assigning
>>>>> RMIDs. I recall Reinette proposed reporting the number of groups which
>>>>> can be assigned separately from counters which can be assigned.
>>>>
>>>> More context may be needed here. Currently, num_mbm_cntrs indicates the
>>>> number of counters available per domain, which is 32.
>>>>
>>>> At the moment, we can assign 2 counters to each group, meaning each RMID
>>>> can be associated with 2 hardware counters. In theory, it's possible to
>>>> assign all 32 hardware counters to a group—allowing one RMID to be linked
>>>> with up to 32 counters. However, we currently lack the interface to
>>>> support that level of assignment.
>>>>
>>>> For now, the plan is to support basic assignment and expand functionality
>>>> later once we have the necessary data structure and requirements.
>>>
>>> Looks like some requirements did not make it into this implementation.
>>> Do you recall the discussion that resulted in you writing [2]? Looks like
>>> there is a question to Peter in there on how to determine how many "counters"
>>> are available in soft-ABMC. I interpreted [3] at that time to mean that this
>>> information would be available in a future AMD publication.
>>
>> We already have a method to determine the number of counters in soft-ABMC
>> mode, which Peter has addressed [4].
>>
>> [4]
>> https://lore.kernel.org/lkml/20250203132642.2746754-1-peternewman@google.com/
>>
>> This appears to be more of a workaround, and I doubt it will be included
>> in any official AMD documentation. Additionally, the long-term direction
>> is moving towards ABMC.
>>
>> I don’t believe this workaround needs to be part of the current series. It
>> can be added later when soft-ABMC is implemented.
> 
> Agreed. What about the plans described in [2]? (Thanks to Peter for
> catching this!).
> 
> It is important to keep track of requirements while working on a feature to
> ensure that the implementation supports the planned use cases. Re-reading that
> thread it is not clear to me how soft-ABMC's per-group assignment would look.
> Could you please share how you see it progress from this implementation?
> This includes the single event vs. multiple event assignment. I would like to
> highlight that this is not a request for this to be supported in this implementation
> but there needs to be a plan for how this can be supported on top of interfaces
> established by this work.
> 

Here’s my current understanding of soft-ABMC. Peter may have a more 
in-depth perspective on this.

Soft-ABMC:
a. num_mbm_cntrs: This is a software-defined limit based on the number 
of active RMIDs that can be supported. The value can be obtained using 
the code referenced in [4].

b. Assignments: No hardware configuration is required. We simply need to 
ensure that no more than num_mbm_cntrs RMIDs are active at any given time.

c. Configuration: Controlled via /info/L3_MON/mbm_total_bytes_config and 
mbm_local_bytes_config.

d. Events: Only two events can be assigned(local and total).

ABMC:
a. num_mbm_cntrs: This is defined by the hardware.
b. Assignments: Requires special MSR writes to assign counters.
c. Configuration: Comes from /info/L3_MON/counter_configs/.
d. Events: More than two events can be assigned to a group (currently up 
to 2).

Commonalities:
a. Assignments can be either exclusive or shared in both these modes.

Given these, I believe we can easily accommodate soft-ABMC in this 
interface.

>>>
>>> [2] https://lore.kernel.org/lkml/afb99efe-0de2-f7ad-d0b8-f2a0ea998efd@amd.com/
>>> [3] https://lore.kernel.org/lkml/CALPaoCg3KpF94g2MEmfP_Ro2mQZYFA8sKVkmb+7isotKNgdY9A@mail.gmail.com/
>>
> 
> 

