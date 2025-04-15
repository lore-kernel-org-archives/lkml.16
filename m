Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2046.outbound.protection.outlook.com [40.107.101.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980CA932
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724442; cv=fail; b=r1N9lRT/G47+PMR/r4kTCQ88uWGADaTw1NuexmccDSVp6y2Ad8v1dG03X2EnefV9B0TcZ4brUx7D9y5z7P4E5CrERajoWbrB0H+lTHWI2pWGA/VWE6zFyJ0+TrFNZLKmleU2CSPxhgu9DsMs9DwP5rexqLAaj3RGLxxcqOnMs6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724442; c=relaxed/simple;
	bh=tlpVMnuI7KCjbo7qu58CM7JhkzykkXZhmMbD0va1GSM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BB3Sq6hgS81WrLuNI8Sj0vUoHkrg9ZB2AENInktNc5+pKz5VPdet1yzYeANOeuVDgpk1O9Q6/6LNoSz449bOlCMzHU3SE76ABM4aEp9OPFfyHaV+CwKk0o4JYrKpcJbALLK6OgNGxji5kgWU19vh39gQFJk8SrBY0uXYVbYrmuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CXniPVq2; arc=fail smtp.client-ip=40.107.101.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CXniPVq2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIzm9ml+M6j0XtW8a/UsA3gQyi2cVBMs7hruoiarR+2FK/pqaiFz1uYuRW3C3yY1hMSCeAgL3B807gR/bj6SzYGmGFLaUNwlmvlTX4hN2Pliuql7KKSeL6E6gu3Pma9H4ItSVS8VJxTdK1DPhYAxDZxSO6SB2Qt8JFZY1vZ12Gkdm3WIARyqxmnBcF/SSQlt4+Sjpw+Gb6iuoy+LT80FtKCH+uidkTo11TfyQGl+jLTTMmO/A+lTQREswUY98H06DxNrd2msaphJ6lpPpp+8nK3Z4eoRfgp14908d0s2c02V+hbRrGTGJGxUWTgSHZzszZJvoThO4gVNVOPzy43Okw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFUim8zwFvyyntaERaNdvquboR65kD0zU4lV20zL4Kg=;
 b=X+diWQeRD9OSxsY2uoIllRIVO+SHImUwCQse+IPU6mHNmGz65eSqCPBtK3hO/R7SIzmvSUuiKbf7Ql3L5eC2V5Grmgkx8pO/MdvSubpGHlIDbR5AOqDFRGGc2ReFQ+pxlcHHyFW+o/RBbT381lKiArx491jE13BpyMHJ5E4QytUKLZWk3h5pubOtv+X117f1+n2qKTsiahyN9l10yWBNhAgTi15P5T5v1E5fExzCF9RDZwnGKBJnGWZNOu+URvfD1dH/mJx5LN5JsWWx4hP4doX9ltUVuqrRqUOfWYWbMTZzD6xA7OeOLvUeU7v2im11bSrlW23g3Ojx0WPLwWyp9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFUim8zwFvyyntaERaNdvquboR65kD0zU4lV20zL4Kg=;
 b=CXniPVq22MsKAyRC14twWc5Jspx8IG+im7YJlGQJIXKb3wk1lb3j97UrZ/cp4PmmpYMD4mnHAsV02UhC6kkqyFZIG62LJRP0azLQTC2FIg3imggAXBQzJJRgKfr1zl1BrPqYNAC72qQIwpcQaUR+ymUMFIsfloziPUovE4Xvt7TqvzlFTuAl3JU3xix/vri9ZZXSBdyGqJTwzpSr0naXXyJHFV8JWAo8wgtVdCPzaZk2v+PMNvAgrsCwNZRRkvkdVOE7YdIHAjijthXAowajr2gRLpCUQ0J8QUvbkgFPnZPKq9YO/T2jSEXDYloTiuswn/dQXHv5c+a/D+xQN/qsWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB8540.namprd12.prod.outlook.com (2603:10b6:208:454::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 13:40:36 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%5]) with mapi id 15.20.8632.025; Tue, 15 Apr 2025
 13:40:36 +0000
Message-ID: <78618417-3c33-4417-b72d-6aad0104a042@nvidia.com>
Date: Tue, 15 Apr 2025 09:40:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] My new rcutorture patches for 6.15
To: Joel Fernandes <joelagnelf@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <20250415133622.1563137-1-joelagnelf@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20250415133622.1563137-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: b641ad0d-8322-4e6a-17c4-08dd7c231a20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUNpVkVBTVJoYkU3QjlJR2p5QVBnQUdQMnhyYzN0UTZSTXN6d01lSDlkR3Fr?=
 =?utf-8?B?cXpFZkFiR3M2WHN0a1YzTjBzcTFGa0NiMzNSK3Z4Y0FsOWdMRjB2Mm4xeklO?=
 =?utf-8?B?M3htY3JhV3d1Z24vRzVLZFYvbVZMT094cXE1cnRIeStoRnJVaVJVUE1MdlI2?=
 =?utf-8?B?d2ZVUnFCSEp6eDgxaG5qNUtlckZIbFhYRmNDSSt3TWc4RFBxRlh1cmZxOXBu?=
 =?utf-8?B?MjI3RGU3MnN3ODhUN05ZR29nWFk4c0NNUFZ4cjJQOW1MYWpzOFNKY0UrZzVx?=
 =?utf-8?B?Nko5bmNIdFMyUzhXV2lKcExINGNkN290RmprWkowL3ViOUZQemFEbk5QUnlB?=
 =?utf-8?B?RFZIUDZlZ1l2TWNSZWo4RmJQaHBjR1VxbmhtSnFTcEZQOW1Pc240RkJvdjdh?=
 =?utf-8?B?TWl5eEpxZVRZUUZHRkM5K3EzUDl1bGwwSnFSaUdiTndjUVdGNnp3NUtmR3JJ?=
 =?utf-8?B?N1ByTC9DWk40Sys2NnRZRmtqN0Q5czE1aVFUeWJBc3AxQkpjYTNqcFN3TkFF?=
 =?utf-8?B?cjNFY0NJaGJkNDNIUFRtcVFqVXRIcm5Va2NuaEh3cDZEU01xdjZraTFrdmNI?=
 =?utf-8?B?VGZaYXpqNDFtd1NrazZKNE1ITWkxVC9CV3FWWERSWGdkaGlEeisxUjgyYXFB?=
 =?utf-8?B?enA0Uk1jUmFCbVk5bEQ0dWw4YUkreFlhVHBoZTEwUHRIeTE0KzhyMC85WXhr?=
 =?utf-8?B?QXZueU45ZVBWL3hNam5ZRXlGVlhxTFRzYTFBejFiWGIzR0VDS2tJNTFRd3Y4?=
 =?utf-8?B?NlRRYk5VTXUrRVROdmFka1h6VTRLaGFzMlRiaHJ0Uy9CengzeUtLV1RoYTRm?=
 =?utf-8?B?Y3BDZGR5bXJEZk9Sc2M0SFZGNkVIWDdWcldJckxjOHc1YXRDVlpIN3g0Si9V?=
 =?utf-8?B?SDVVempnQjU3OXNEZlUxdm5heVhrVjBFRmVCWVNCQ0E3UE04cWRoVERrUHE2?=
 =?utf-8?B?L0V1UjExVnFHdGxHVjJVeG1yL2VsZW1Jb1U0RkJXNDFvaCtQLzZCK0Z3UzBE?=
 =?utf-8?B?RVZWOUFQWVVwSEhpUHVEdnJDeGpNc2x1QkllSVVUOXFFUDA2ckNrdGkzam1n?=
 =?utf-8?B?ekJxSHl2eUJGK0NrL3BGMGpZVWlOeGs0YVFlT0svUlgrSjhVd3M5Mjdib0wz?=
 =?utf-8?B?aWFGaVpRaU9XZ3V0OE1iT3ZRVDFjUkg5QlNWSUk0QmR3Y01kamNndHFMK3c2?=
 =?utf-8?B?U083VkpUNHNhWWk0Zkd3WXBPVXRVbVZzZmlpSFJJZTkyQ2Y3U2JZZ1ZaZ3pr?=
 =?utf-8?B?VWp3QUFnV1N3VDBVcFNHZzZUQVhKWFF0R01HVCtUdDFDSUU5R0o0ZlNWajJu?=
 =?utf-8?B?ZWxFQTQvNUQrTCs4ZlJFNlBKUC8wc21QeWJSS3lFSUpmdWlPUCszYXpWeUhT?=
 =?utf-8?B?cEYyQmpZdkpvWTh4N0crUTlrUDBPNDdHWDl3KzZYdnc3ZG9zVFBuK0lGOFdV?=
 =?utf-8?B?UkRFSzgyQW5CR2NwNjlEUG0yUGpWY2E2dFRzMGw5dUZubFBhdHdGNWE4eSt4?=
 =?utf-8?B?RlEra05DR0VUTmdwd0JTd01wOE94Q1c4TDZFQTJJczViZmtYdFV6emhkSWdF?=
 =?utf-8?B?bXhEQmFMTUxrSmwwWk94aWlSZUN6eVE0WnplMXNuSzR3QWZjQjNlTXNncFhz?=
 =?utf-8?B?QWhtMk9GN282YWIxL1NZanJidmJkSVNZMVFhTk9YSVFxYU1nK2dsWjl1VFJW?=
 =?utf-8?B?dmlRSDdrSEFrMmFwblFXSUZIdmxYTlBGNTVsbUxHU1BPUUVFdlpJZ3ZyUXdQ?=
 =?utf-8?B?aHV3NlMvVWRFR3RSb2dtRFgxb29XUXJ6Uk9qK0xFMzVyTFpDT3dRRWQydTNm?=
 =?utf-8?B?bVhFdTVLZmNyVHlWTWhVMTJvQVlBbDVwZ2wxY05jcjVKdm5vU2lhSXZvSGg1?=
 =?utf-8?B?S2w4a3JlSzV6K1JGOHZFVHRqb0J3czByMUZuWUx6QXlOanhvL0dIN1ZCNGI1?=
 =?utf-8?Q?2qURbKYmpPw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a241R1JBbVBTcXBPQ3pqc0hlOTRUQWV2OHVoaW5QVVA5aDhCK1daaEJwalJo?=
 =?utf-8?B?VHN2N0J4Q3hFaFlsU2hNcEFsSkhWeWxzNTFDL3c1VlNLL25qV2pVRTYxcG1k?=
 =?utf-8?B?dndKemVrN1Z0elV4bmRFc2hwSVlVRGw3TzNMZHh6QU52WkJQNHZWUWRkekJr?=
 =?utf-8?B?UXBVK2Z1TjN1dzBGVjJ3VFE0c2lMcFlHVjZQVERvZ1hadzBIaUtTOVJGazJ3?=
 =?utf-8?B?Z1RQY3RIYzFqRndIK01SL1NBRUw2VEdGT1JvTEtEYVJRV2dpMnd5RjlVekRj?=
 =?utf-8?B?Z1kyTi9ZYXNSU2ZLekJQMW9QbTVrN0lyWElDdUxna3ZIMjlQYklMWFNiKzVP?=
 =?utf-8?B?M0lJNGQ0ZWZHS2RFOEswRTVNNjhCOVF5RDBvL01ua01tWFRGbTI1NUIvZG1i?=
 =?utf-8?B?ajk4U2liazZHaUlzVVlORGVDYnFHV3p6NTY0SVdMNUwrSmJGMWRnY1ZiU2F1?=
 =?utf-8?B?eDBjd3pTTkRIVHNBc0NISVZicE93TElyNHM2TGpjSFRhclN4RzVrcTA2bURz?=
 =?utf-8?B?ajJJTzIxMHZqZkxpaUkyU0hJb1RxUmF6cnBPeFdORU15aVJMbncrWms3NnZS?=
 =?utf-8?B?OE82T2c1TDRyNGpucmF0VzBGQjY3MlVvYWZiYzhpSUttSmxnUnNRM0c4Kzk2?=
 =?utf-8?B?TGFwNXJNNVRnMVRBd3lrSGY1RkFIb0dQYzBNRjAzYW1NY2ZhMXJOZXkzK0Za?=
 =?utf-8?B?ZlhoaXJYWXBDZnphRWI4d01tcFcvRFEyMU1ZWVdlcWF0akNILzlUb0Vkenp6?=
 =?utf-8?B?aGpwZ0RRUzJPQzA4ZWpzU1hLZFNjWTc1OGF0Y05iNk5XT3dma2dHRkxtZXRR?=
 =?utf-8?B?VWl2RVM5ZGxTTEhXbk1raFNENW5Db2txZFN2Z3FOelJ3bUlJTHRSRmJNelMz?=
 =?utf-8?B?aTFwUHExK2pKZzZOaGlLSmdLeXRIWE1GWGI3VXRrTnY1RGJaWVY0SXlqdFoy?=
 =?utf-8?B?b0cybEVTM2ZlbXM5WUJiWjFXOUp1UkxQT3BZM1h1S0tKQTlVdnpvb1dWQVBK?=
 =?utf-8?B?RVdxL285eE5JekgyaElnZEZqbFFwYkN5WE5zNktMUW5McWhhbGlYeDlPRTF4?=
 =?utf-8?B?a2ZyazV0ZEZGUzBpSWFCZ2puY0IxUk1VVVlBYkZzMDhXNHJCZ21leWl6aU5Z?=
 =?utf-8?B?SDZjZlZaWUMxVmJqc1JXUm5lTVU1Y1hINUVhcXIxYWQyZjZxS3U2OUh3TzB3?=
 =?utf-8?B?ZE1NVVdSUmVWTmxMZWdxbWo5OXIvQkwyL2NFVENMMDdNbEo3ZlhwSk5wZW5t?=
 =?utf-8?B?Sm1DVWUrMVd0aFA2Z3I5WGQ1M3BpM1UzbDhuKzZta2ZQUWwvMzg0cEwzYXc0?=
 =?utf-8?B?Sll2dEFnR0pyYzYxNHIzeXRWK1pHWlJZU2NXeXgzZ0dSdVFQNFdXd2NEOXZW?=
 =?utf-8?B?WlVubEJpeEZIcG5IRkpQNVRmUk9VdUFTaWRKcmcrNm5MQTI1aW52Q1BIL0p6?=
 =?utf-8?B?dFA2OFhUWkNDNHo3V2N5TlhxaWNsMWJyMWh4Vk40R01oak9UUXRJbEFKa1d6?=
 =?utf-8?B?d2swN0hicG9QSUlMdG02Wjk3bE4rNnpGZEZTZUtsc3JLWk0zQUx2OVpDcVY3?=
 =?utf-8?B?QXhzdHhrTzl6LzZnQ1pBYkhTeTJhelF1dFozK3RwN1ZuQURqSFcvcEVFZEF1?=
 =?utf-8?B?NkZRNjNVd3loQW1mWHc1TGhnOTZqNGVxNjlFRmxFUjh0YnhNeGJmU0tIM0lj?=
 =?utf-8?B?ZzliZjlrOVl5ZHRhZnVYbVpjajROaWV0Mnl2U1N2enpZNlpQenpmbXRMdDRl?=
 =?utf-8?B?Q01LTXJPVVZBd20xaWNGV2M1alhEa0llSk15RVh6Z0s2Yzg1WE9EZ3Zlbkw3?=
 =?utf-8?B?czBsYXo0VDUvb3d4UGh0MytyL3F4NUVSdnlPejhidGpIR2ZBT2d1V2psMWJS?=
 =?utf-8?B?K0YxeGVZK2V1WTR3eVhlenl1YXN4VmF0azZwUUJXa1NPdHdKdHpZZXF4ZEJ1?=
 =?utf-8?B?dk4wcWtJMkIvSGQzQjBWcGVpRktybjBXNUdLeTBXRVNZbmJOSjlIVm1XTU9n?=
 =?utf-8?B?T1VaRXo1R0QxTXVFRTZORVhuQVZsc1FWVFlQUlp6TkdWQ3VqTEJPTFlobENn?=
 =?utf-8?B?bWNabFg1UDBpYW9WUVN5enRqMnR2eFFqRWF0dG1FUXFWRUlYaDJWZjJqQkN0?=
 =?utf-8?Q?HeMraOe9mZ6061kffFGwCFXA8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b641ad0d-8322-4e6a-17c4-08dd7c231a20
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:40:36.3159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSDN1I93Xp1h6XqtD+/E3Dbngg/h95Z7PpMBw4bJLdyBLk0/qywkiL0NKJhCKQTduUAYfbgVb/zRwktnigtneA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8540


On 4/15/2025 9:36 AM, Joel Fernandes wrote:
> The gpwrap one is is v4 where I just fixed the hrtimer_init() since v2.
> 
> The ARM64 image check is now in my for-next branch, it is required to do large
> scale tests with SRCU.
> 
> (These are only the new commits, the existing ones in my for-next branch for
> rcutorture will be sent separately once we figure out which one of them is
> causing SRCU issues).
> 
> Joel Fernandes (2):
>   rcutorture: Perform more frequent testing of ->gpwrap
>   rcutorture: Fix issue with re-using old images on ARM64
> 
>  kernel/rcu/rcu.h                              |  4 ++
>  kernel/rcu/rcutorture.c                       | 68 ++++++++++++++++++-
>  kernel/rcu/tree.c                             | 34 +++++++++-
>  kernel/rcu/tree.h                             |  1 +
>  .../rcutorture/bin/kvm-test-1-run.sh          |  2 +-
>  6 files changed, 107 insertions(+), 6 deletions(-)
> 

Oops, s/15/16/ in subject :)

 - Joel

