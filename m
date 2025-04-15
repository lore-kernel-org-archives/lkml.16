Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A1F238173
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744743733; cv=fail; b=PuovcR/vss6Q3qOXXS1ehtBXMJztQyXmLZMkgMbt9NpjaEAuYl3na4EVhbiOZT1aQ/XvIGvCD6wgNeTKsJVJyG7UJd3iSPlPjvNRNkBW7TkMq7oI0zJTup8UgkfV5R+3jbRNcEnHuFDrr3rIQGZ62/LOjjTeoD/rIewwlkttyRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744743733; c=relaxed/simple;
	bh=N31sWf/RZ8i9+koRM5SSKAXbpOCnxofUWFuwO4qksxs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TUHvnEo+oyh05Pvmrq/iTgnxIv2akkAqghXOpAD6GTJzClm1zpFIANmRG5tfdek074gxap/B9fHF3w9EkdBlrJ+jv/JVk4/UJPMiBkHYPaY/XLv46QnujouJ2cqpBTU2BI6gTWV2QvoqUA2voHcOvosnIqeduPODkBT3GAcq0p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WYWBtYWV; arc=fail smtp.client-ip=40.107.236.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WYWBtYWV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2Bv9a7IUOod9aAF6Gb+2chR6OS14nuYhHTlCMvGTxWI95RaqxqyY/whkR/UbmACh1HsOtpwEQH+L+4nxz10He0KtgmTpf01ZDKroQfHah0K0xVJng8Q92JmhONnzB2ZsO8a51LP8O0dFL1CLVOK6obuty51JEQomyve+gjGNC2hL+an+HnI4rMFRWOV3hGGcVY0RhTi3yK0qnCU74EO5q/xGYV7iCl+FnlzYCAltg1KIVUXeGFxCgZu3Dm9M/ukvJHTw/yGyCFmyI7jlDiFyR86QGEYFviWaRIy6pzIG3++zl5Q8uFhhFqPAzDlOuN0NPdbX6pTxxjGrCmvImT36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3A1EVu37AA1UpFvR80V0hCHI+j2SGvYncq7vJVPvbmY=;
 b=zOEqLbRP9uzBBeJPdZ0353UIgUF+JH8HuaVET4GC3lOIkYEuuB5/iv+1qbL+PandvRu0zPEhYJG6dCozFLtnuaWD5XpVpD0t6+wZbqPmSAClb9Z1GYudFGMOgBG0TdY7pIXsJb8BLDRBbbj/hMyGqcyMN2nH8oXgP9PlQNzMDMp4EfjHPpPKhP14dJ+FwKPiHdpKWNZYM5QVODWUiQ1lVDxrjm2EQnYt8A69QuQ4sIfDhXPg/2xvWQSbnPUy6LrqDncpVuzxgMg6PrFNsy1mx++Rw/XH391YF89gWeYfk+deFguJ3EyNolvG/pn0WN8yx2SV24Es6hXjF4aEkhXQWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3A1EVu37AA1UpFvR80V0hCHI+j2SGvYncq7vJVPvbmY=;
 b=WYWBtYWVwAuE2u7cAx9VZ+CjbHyd8DnUI5znf5Na1fn3DtHpcGUFvw8dRPzvKsLd0jnoqPjF8DuJ+ZLa8omeauCGE56XpmIaPFS4v+ld1dvvBlOKZU3DML3bcUlUYWdwSuYb/NuMxoHBrtgiiLNtIQnzy07bdZgEgup2wxm81nE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by SN7PR12MB7909.namprd12.prod.outlook.com (2603:10b6:806:340::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 19:02:06 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 19:02:06 +0000
Message-ID: <5d5b7a6c-9a06-4c44-bd21-28e7f16d79b2@amd.com>
Date: Wed, 16 Apr 2025 00:32:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] mm/vmalloc.c: optimize code in decay_va_pool_node() a
 little bit
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, urezki@gmail.com,
 linux-kernel@vger.kernel.org
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-4-bhe@redhat.com>
 <8d83441f-9f67-4094-81b6-70cd5db88acb@amd.com> <Z/5nkPp3dlZYx2ls@fedora>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <Z/5nkPp3dlZYx2ls@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::22) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|SN7PR12MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7c283d-df2f-4751-1dd8-08dd7c500405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djRPdldPaGZBN0pnUHdTVmdyazk2eWllQng2eFlDUHk5Q1ZkU3lsTnFiTmpx?=
 =?utf-8?B?VlhWMGVZeVh5cWV3QVJ2bnBOWnIyb2ZEdDdac1Y0MUhIeHZrVnRjdGNpMGwx?=
 =?utf-8?B?RlFqaUdibk9SUzdHSHI0K2h0SVViaXpnL2dGL1NBcE1aVE40djNSbURVVGV0?=
 =?utf-8?B?UTVsSWp2OTF0dDlHUHV3eTRodU1aZXZGVTI3eG0wYjMwTnJGVTQyL21YcTZS?=
 =?utf-8?B?RnhNaGRCcktZNTBFVm1pZzM5WHcrQ1VibmVLL2I1cHhLM2M4Vy9ZQ1NYOWlK?=
 =?utf-8?B?MDhkMDl4d01jY3o1aWsxSG9ORTd1bEJQZTdaZGdwR2huRkVGUTIrQXZoekpU?=
 =?utf-8?B?MmtVZHIraFJuTFhVL2ZWa3FyMGpycEJPb0pYMmYvSTZXR1BZRVdwcTdwemZ1?=
 =?utf-8?B?dXA4djhMRFVqelNpSnU2VWMvM01KNHJsV1U1NHFJSm44S0g2RDdIZlRPZnJF?=
 =?utf-8?B?dzhlMTIyV2VpOTJoV25DTWlaWmhDYk1rQXBZdEU1T2J5YU5JUzZ2WEQ0dk1L?=
 =?utf-8?B?V3FFdlhkb01BSGNTWFhIVlBINHBabWxUOXJtcGw0ZExDMzZ1eEpncnpDcUVC?=
 =?utf-8?B?RFdOTlY3aTVMV1RvSngzZTBrR3JMbGtCYkxlNHpiQmdUdXBYS29ZcGVnMmZv?=
 =?utf-8?B?cTlsYVBFYy9NcDBvaFBsTDcvcVFoTFNKT2EwVFI3U0FYWHhQeUdmOGZlY0JC?=
 =?utf-8?B?SXYxdlQzK0hGTjFhMTYwc3VGdndoQ1RlYnVFWmMyZXlpZUNMTVEwakczanMx?=
 =?utf-8?B?Z1JpQ1N1bHRVK2NwaFdwVVA1K21kcHdSYTNYWjFkWC9aN2VVS3J3QUVMaElk?=
 =?utf-8?B?SkcyTGMyNnlLWHliaVRTS3NmVm5GOSszS2lXRFZDb0pjNUlTUEp5RThLY2Nv?=
 =?utf-8?B?Q1BocUZKcjBnVlNaRVFYTU5kNWRBNllaNE5PSnp5KzVFR0ZDQ1J4VHMzN2Ny?=
 =?utf-8?B?QjZPT3Azb3pwVmVvSytKQmVmNUFmelJLRC9abWdzVWFFZ3RDUFQ5ZGkrUTU1?=
 =?utf-8?B?SzFFK0o1WEtsTUtjTUtpQWdIQnVnd1N2V1FKcHYrRStMVnVBZC9OYkoralFD?=
 =?utf-8?B?QXhxM0NJZDZURmlTSmJLUnUxL0FXdk5iRlpISFpHejdabDF2RWhObVNoaStm?=
 =?utf-8?B?SUpuTUZ2YTBidFB2cGJvZ08zbjdjTjR4Si85T1BaYWg5eVFCenNybTVHSFI1?=
 =?utf-8?B?c1ozcGltTGFrOEtHOTB3RzVCRVZJbm5hdE5zbGo5Um1MWG9TV3crOENNbUUr?=
 =?utf-8?B?N1drT0dTdlJpV3pnb0xMUURHbWxMcVBPbCt3VCtrY0c5c3VnejBxcnB0OHBQ?=
 =?utf-8?B?bzhvc0c5dCtCaTNseVlKQXRXVTBIVlhVVzBFUkRXcUg5cU1tV0o1UmZac2N5?=
 =?utf-8?B?b05ja0cyN3BhUm5TUlVyQkRSTXVESHBXeG1xa2R0dC9tSmcvRHRsNXp4N0tD?=
 =?utf-8?B?a2R6SVJMVkV5bTR0UkJ4ZU5DeWdOQ1l4cG9hT3cwbEpiZHpaUzRNZ3g5YjJv?=
 =?utf-8?B?b3h3NmdWV0RIblo3TkJNeGNXeE96SDFLVnBWbUh1RlBWU0tvMks5WHlnM1Z2?=
 =?utf-8?B?Tnh2ZXpJL2hCeDFRa1BuQ3kyVXZ1a3ExZGJaSUI1aC9XVFRldFgrVmgrRlBE?=
 =?utf-8?B?QjZ2MkJTQ0pibFN5bGhsODd4aEs1TC94KzRONkJWQWtaMHFndkk3SGFidnM2?=
 =?utf-8?B?OU56QTNEd0s0UnBCV3pDa2ZvNk1vaEpOZnlzSjVnZHFOaEFOT01qcDdxSytN?=
 =?utf-8?B?TmJ2Q1F5UUFHaElUZEZXWXVkTkxUVXNOaEtIVjhabUZnQ2NnZnNrOGpuU2hZ?=
 =?utf-8?B?RWNqbFFBeHpRRThkL2dZdkxqNGg0RHcrL01JdFd5a1huOUdaOXo5NkhLYlpT?=
 =?utf-8?B?bElmeDhJRkc0KzE5cFQ0enpmcjJWY0xjR0RiOWxpd0JxSUp4TGxDQXVKREhR?=
 =?utf-8?Q?HfHF1ZQTYwk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWJLNlJBWEQ0TktkcWdBZCtjRWxRc2RMNzA2RHozQkx0YmxFbkZ5VkNEQ1ZP?=
 =?utf-8?B?N1BRcCtiaVE5UWZZMXJqMmF5NG1SVy9GSEc3MGtTa2Nrb3VzUk0weTVjUmE5?=
 =?utf-8?B?Q0I1T2Vjb2pDcXROdGVqMm9JeXlVZ1IrTHhuSnUxUzlQWS8vamZvUExZRGg0?=
 =?utf-8?B?aHd6WlJnc1lqN21xVENPYXF6cVdoRVE1bUxYb0JCSzFWTUFsVFF5OFpuZXY3?=
 =?utf-8?B?djNoTXZmSnBDYU1iMlpLL2JPVktvaW1zbkpsVVJOL2VmVmJTalF4TXpoUHRq?=
 =?utf-8?B?a2QwU2Y0MXhWRkVCY2FnOVd6ZmJEZFdRbHpsTmZpaGVVMW1sUlluVy8zd3Jx?=
 =?utf-8?B?amNKZUd6ZHY0dWVVaXJNRU1DQ1BPN29TM091emFRKzQ2bi9ieWVlNm5RNkxm?=
 =?utf-8?B?d2lwRkNRMnI2VHlEWUNzbkZvLzVzaE5WOStidk91RVloWGxvTHNtME5SVlNP?=
 =?utf-8?B?TEw1emlLQklqM0s4dklSTWRURFp4WlVoS1pNWWQ2Mi9WZmxlanNJTFZaK2ZH?=
 =?utf-8?B?Y2xPcXp2THhGMmY3cWZyWFp2cmdSWEpMSWtmckQyZHpIUUlIQmZhTy9nVFNT?=
 =?utf-8?B?VEZVWGZSN0YraThvQjJKalNTeUxTVGlKVm9QUmMyQ1VITzBuVVB6YXF4TWly?=
 =?utf-8?B?SjAwbElOU3B3Mk1ORFdqeGprRG5JZmhQYW1ld2dqeE9HaG42S1N2NTF6enE2?=
 =?utf-8?B?UGFHb2Vna0FONkhrUWNjbXpBTTZUdWlxMEZuU3Jmbmxld05aeTQ5MFpXY2Iv?=
 =?utf-8?B?dTNBMWoyR3BWOS8xNTZHNkNnVGVhMXRERnVCNU0xUVFiVU9rbFdxWWRCVXlC?=
 =?utf-8?B?VS9zQUNpZHdMdzVPdWxveVFXbHdyQldHOVhhblN0K3V1VWxSbXE5WlFRWU9l?=
 =?utf-8?B?bGJkb2Q3ZTF0d0ZOUmV3dFJXaDNJbFZUaEFxY3ZCN3hQQXR4ZWxrU0NnaGFi?=
 =?utf-8?B?cGFxamFlVXdLVm9wRkxxRjFrSDdPSEZXLzNzcFBuWG1NVUxuOERSQjVVSzZN?=
 =?utf-8?B?S3dCTFR4czc0cnd5bXdEbTUwMFNXRFVWV2pzMW1XUXY3NnhselU2clhNNjRh?=
 =?utf-8?B?cUhsbFF1cG5oVUNtSVRmRzdnVlg4VnpZRUdQekc2Vkx0cmsydWlsS0MxSXhG?=
 =?utf-8?B?bGtUNEtORXNvYnRXcXM2eXlqbnMvN200UnVuM3Q4RmV0UzExTENyOUJ3ZitK?=
 =?utf-8?B?RjZRV2dHUUYwQzZHMXVlcGJvdlViUXhmOU1rQ2NMTzBRTEpHOFZCSzBWQmxG?=
 =?utf-8?B?T2JIbTZpSkJNYVdiNGMzWlZraS8rOXBqUVBvdnJvVlVIeVorL1Vmc3lGRkhM?=
 =?utf-8?B?R1JoTElsbVNMeDcxT1A0OTJwUGdTOXVLZ1VBNjM5S0Y4WHhvRkd1c252YW5D?=
 =?utf-8?B?ZnFFc3I3aTBINFRqYTB2ZlV1ejRNU0k5SWIvRXZITnMrb3lHS0R2V0J5VlRq?=
 =?utf-8?B?eHg1VStWQU1HUzUvaGo1MVlISGY1bDRsWWNkeUZQcTNscmdCaHprWGZldDJQ?=
 =?utf-8?B?UWxQMEJoYjBYVERPcDQrYnJneVBuVHBzeG0wQUhkN0FQcFNxYTY3cVpKRUVE?=
 =?utf-8?B?Zlpnc21HbnBKQjB2cWxMTFkzazhScXdDZVYveVBWSVhtUW9sV0tTZEdXWVV4?=
 =?utf-8?B?djJwVUJDWmVsV2lXaGVkMHhKcVc1azZJSGNwbm1ObFRUWVRMdW9ZOHFhbkJj?=
 =?utf-8?B?bmNaNWI4YVBRNXRNTGtueFQ2cUlHY0ZLdDVGNWFPTU8veWUvaStQT0huVkZL?=
 =?utf-8?B?SVFCejZvZEQvZ012ZnhoNjFMTlBKUTFSb2c3eTJQTW9iVzJIZk1EYUFOazhv?=
 =?utf-8?B?dGZrZGFaRjIxN3dxay8wTHhSUjd4a2VNUldnRU90V0NaUWpqS3dMa2hEdDFR?=
 =?utf-8?B?QnhZd01rU3krci9MQVdmN0piWm1rSFliVUtreHozVDVKZjA2amxOYlE3MzE3?=
 =?utf-8?B?dnRuYmExOWVkN1paS3VNaXFFV3plb0hsZ1dCcE1qVzQrSjdid3ppSXpWNDJO?=
 =?utf-8?B?SitTUzJqdHAzVkZiVUdYZ3FmTCtGN2dYZU5XMWxZaUxBck56b0MxZE1EMDFQ?=
 =?utf-8?B?Tm8zdytFNWNqOUZZQkpXdXZaMnFObFRsaHpKcEZBUGlxZmNyUlVhemNNbDVt?=
 =?utf-8?Q?EO3YNR5XSeoZZ9jDF6TH1mXRT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7c283d-df2f-4751-1dd8-08dd7c500405
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 19:02:06.6413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpQgsHEOPGF+bZxxIoDyuTTDnjQP8HHlFOOW/8fbHDyyvU+r9wdCQ1qlk2eFXIoboBDsxcelpTmWbK7zE3ubBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7909



On 4/15/2025 7:35 PM, Baoquan He wrote:
> On 04/15/25 at 03:59pm, Shivank Garg wrote:
>> On 4/15/2025 8:09 AM, Baoquan He wrote:
>>> When purge lazily freed vmap areas, VA stored in vn->pool[] will also be
>>> taken away into free vmap tree partially or completely accordingly, that
>>> is done in decay_va_pool_node(). When doing that, for each pool of node,
>>> the whole list is detached from the pool for handling. At this time,
>>> that pool is empty. It's not necessary to update the pool size each time
>>> when one VA is removed and addded into free vmap tree.
>>>
>>> Here change code to update the pool size when attaching the pool back.
>>>
>>> Signed-off-by: Baoquan He <bhe@redhat.com>
>>> ---
>>>  mm/vmalloc.c | 23 +++++++++++------------
>>>  1 file changed, 11 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>>> index 488d69b56765..bf735c890878 100644
>>> --- a/mm/vmalloc.c
>>> +++ b/mm/vmalloc.c
>>> @@ -2150,7 +2150,7 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
>>>  	LIST_HEAD(decay_list);
>>>  	struct rb_root decay_root = RB_ROOT;
>>>  	struct vmap_area *va, *nva;
>>> -	unsigned long n_decay;
>>> +	unsigned long n_decay, len;
>>>  	int i;
>>>  
>>>  	for (i = 0; i < MAX_VA_SIZE_PAGES; i++) {
>>> @@ -2164,22 +2164,20 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
>>>  		list_replace_init(&vn->pool[i].head, &tmp_list);
>>>  		spin_unlock(&vn->pool_lock);
>>>  
>>> -		if (full_decay)
>>> -			WRITE_ONCE(vn->pool[i].len, 0);
>>> +		len = n_decay = vn->pool[i].len;
>>> +		WRITE_ONCE(vn->pool[i].len, 0);
>>>  
>>>  		/* Decay a pool by ~25% out of left objects. */
>>> -		n_decay = vn->pool[i].len >> 2;
>>> +		if (!full_decay)
>>> +			n_decay >>= 2;
>>> +		len -= n_decay;
>>>  
>>>  		list_for_each_entry_safe(va, nva, &tmp_list, list) {
>>> +			if (!n_decay)
>>> +				break;
>>>  			list_del_init(&va->list);
>>>  			merge_or_add_vmap_area(va, &decay_root, &decay_list);
>>> -
>>> -			if (!full_decay) {
>>> -				WRITE_ONCE(vn->pool[i].len, vn->pool[i].len - 1);
>>> -
>>> -				if (!--n_decay)
>>> -					break;
>>> -			}
>>> +			n_decay--;
>>>  		}
>>>  
>>>  		/*
>>> @@ -2188,9 +2186,10 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
>>>  		 * can populate the pool therefore a simple list replace
>>>  		 * operation takes place here.
>>>  		 */
>>> -		if (!full_decay && !list_empty(&tmp_list)) {
>>> +		if (!list_empty(&tmp_list)) {
>>>  			spin_lock(&vn->pool_lock);
>>>  			list_replace_init(&tmp_list, &vn->pool[i].head);
>>> +			vn->pool[i].len = len;
>>
>> Current logic uses WRITE_ONCE() to update vn->pool[i].len.
>> Could this lead to consistency issues?
> 
> Seems no necessary to use WRITE_ONCE(). I can change back to use
> WRITE_ONCE() just in case. Currently, it's only updated in
> node_alloc(), decay_va_pool_node(), purge_vmap_node(). And the latter
> two are inside vmap_purge_lock area.
> 

Okay.

Reviewed-by: Shivank Garg <shivankg@amd.com>
Tested-by: Shivank Garg <shivankg@amd.com>

Best,
Shivank

>>
>>>  			spin_unlock(&vn->pool_lock);
>>>  		}
>>>  	}
>>
> 

