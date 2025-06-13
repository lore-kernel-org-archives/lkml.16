Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1137D2DA757;
	Fri, 13 Jun 2025 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803454; cv=fail; b=iePIRFRMMYJZow77g4aG/Kn9Swg1/l03q3liTrPONKcswzXzNd4DhK1fjHk4ns7Nh2n6mBtd/NkKIqm1v8EEequvTmhEE/qiA9SitAqa7fl4Tf9pWHJ1v1ruIn8RBTGXH2g7nFKQMIXM7bJUXIAyVOL08oHrgeJQ28lT0jjJv3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803454; c=relaxed/simple;
	bh=CPGcO8nbw9Xo+Jw3cCxy5RGAqlLHUlH2TO7+6C+lNv8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LRcAhj2SNLRf0nB2dQTplHDxeVCQuQ+2/cM2p05reRuwoLu9I2jSRymU853dM73ejWVpft+h5vNJbGMPPPXlqiIu8SazfkFZul855kWTi7CwXZOhBEqMocfuWZQqPtCMkvWo4jZ4BdkapSQ3pjhgY67pHb6GDIy0tVs2sVMXyDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gmvrGpWj; arc=fail smtp.client-ip=40.107.100.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gmvrGpWj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8FiWDxLZ+M6G3jzwFioHuKLjU1Q4KrG6vfDcUBt7MIim+19j5o9RZAZZ2lMV3ZDpuV7BRzR3P4N0r69UD7EHIqiZv1Z31/XzMPaI88Du3QqP5R8T9eewP2UHK0vHwQ4qLMnNRpbmculykqz4G8ImwKQ3z/+yJ2jqisFZjEEolFK5361RFbTM8N+7vW1gLx1AgnGxhrN7sDZZvbHpX4anreJFf56nTLaIS+/rG/Fxd0bdW6RGF47nPu8hJRTYn6+2+JsC/ropMisoouaxJlvVNfwIIdv5ydnZdNgQ9jbZNdEafXgiwIghTW7z/9KZfoqmVstSCOcuauFQYYc8XeTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sonAr6LoQI0sRRfZ7vZCvyC7zhChonm0HfmtqWqj7Ls=;
 b=Iqvnd1klxW4sTPGR3XbXLiOIIzyTKL0ETn4Q8T4aFIItgLaVysrsDiwS1RoVuC4bMwitfZMATbW3/jiHPqcPhD1AQPbCwB+pAEdfn9/WPDaGxjFejbQ9CCosUwQ1PKrJ7pdMBQiW9yHvj1YpZ5KOeEdqCWOdglQdm6c13tDTk85sqm/1a02DnEeb/wlmH3ibMM0PrvC78A20pF6xtRjV5SSYx5OW/NYaKj9ubuuVnzSJyYOfpdioDd4A6TJomrZ9O8GI8OOLxCq4aex02Dch0qWcRCYw+fEN2BWaqxcjE1xEeeyn1UvDPXZd/5L3OpP3NBt7iaeKjLjbiWUoYWrfbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sonAr6LoQI0sRRfZ7vZCvyC7zhChonm0HfmtqWqj7Ls=;
 b=gmvrGpWja/caTyLhlZKTSQZ2lHqEfDoUg7Ye1B045r9X0WRxBABk5qCVpn5jK20xBru8bJYF8kYzoIUKCV0HgJlUAevC83BcWlQVFnlayOkq2XMuXdbC9uYh2lQ2H6fpCVNpdEav9aqcTzHgzOptUXKH2NBVLG3KX+PR3t+D7Nk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by PH0PR12MB7009.namprd12.prod.outlook.com (2603:10b6:510:21c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 08:30:46 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 08:30:46 +0000
Message-ID: <4e411c30-dcd0-4ef9-aa89-07808df1017e@amd.com>
Date: Fri, 13 Jun 2025 10:30:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: microchip,usb5744: Add support for
 configurable board reset delays
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, git@amd.com,
 "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>
References: <1749148171-1729610-1-git-send-email-radhey.shyam.pandey@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <1749148171-1729610-1-git-send-email-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::31) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|PH0PR12MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bde208a-c5c4-4bb1-d06e-08ddaa54983e
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGhnTTU3NDZsQjh6bVJPenRRek1CMGtkbkgxNnN5RDBJcXFvKzNtd09DU3ln?=
 =?utf-8?B?azM4OS94T2NOY2EzdGV6ei8wdlAyM1pwMEsyOFVRb05rWlhid1RGa3hML0ww?=
 =?utf-8?B?dHJrQVZ3ekhjTGV6VzlkL1FnbnZ3MWhXSXFVMGl5WWhIdjZ0TWRNUisyMFNL?=
 =?utf-8?B?b3FNaFE3U2xaMzkvV2xad2FpdjZzbitMcUo0dnF5MlJZUzNFcHFpTVJaU25r?=
 =?utf-8?B?RHIyZHJFTEorMkFvcFEvRXNseENtTE9rMTl5Z3lwblFhZTVQWjJ0Vmc1dG1G?=
 =?utf-8?B?TGZrWnFuTUtyckc0WWlXUUJoUDlKdk5HTzFqOXhETm05ZFhZYytJNktCSGJm?=
 =?utf-8?B?QXBTYmVmeER3N3EzUHFpcWNjYnc0UnRoYjJUK0ZjVUh1SFpERkJ1NVVmTjdG?=
 =?utf-8?B?NjJiVVZaVGQ4UWtRUlhKbDFIT3hBcDJVNzZTTmZPTjU0Z211MlJzRjdWdXhZ?=
 =?utf-8?B?VUk5RmIxclFWVmFNVXZ6WVdxOTFQbXgzSjQvYmhkOFBWZVRNWWkvMUFKS1k4?=
 =?utf-8?B?RmdhWW5JeWx2ZWVEcHhncGI2dzF1VjhyY3NwcldJQmNoTThTTmdpdnBRZlRM?=
 =?utf-8?B?OWRsQlRaYllTWjE3czRrT1lQdHJlMzJzSGh1RHI2ai9XSW5DVUVDQ3dUSEJV?=
 =?utf-8?B?M0M2VXk1MHNLVlZvTVlHS3VsL1V4VDdOQlNxanlYS21EYk95WjZKTDZhREZ4?=
 =?utf-8?B?OURaR2MyenluNzdIaFMrUFl6TEV1czlEMVFpQ3ErTnRrL0xJeXQ5VUw5M0g2?=
 =?utf-8?B?U0ZxZC8xL0dWYit1a3Z1R3VTYjFSNlV5YkxiV3JiTExoMzAyTGlLdGRYS2sw?=
 =?utf-8?B?d3FLNzdYdzAxY1c3dlROMmlpNXI4bXVTUCtrakJNQzF1U1Z0eDhNN1FwY0Vn?=
 =?utf-8?B?T2dic09vVmt1SmpMYWNGM1pkSEtCank3NnJLb2tDeUliNzBMMlFoUFFnRkV1?=
 =?utf-8?B?TGF6NC9Nbm4rdEZWcWJqUFJFT3hPanMvZFRhTkRJb0VzbW8yTkU5dG5rb1VH?=
 =?utf-8?B?cDJaSWhtbVdPRElMbUJaL3VMR0Vyd210bkt2U25UZElDSUZIZTlZajJzTzAr?=
 =?utf-8?B?SEJmNjVmY3o3dFJpSFpOZHpLT09BQmlGc2RLbVh3ZDJoK2lpQnFoaTkwZmd0?=
 =?utf-8?B?bFVPNUpHS2kwZllUTk1oNEtMc3hqRDFza2dIRHBrTSs5b29xVXFGZHE1MjRa?=
 =?utf-8?B?cWZpbHB5Y3JqOE8zVVJwMnV3RGlHTHJ3ajVCVFE1eUhxWGxmTEFhbUVnQzdC?=
 =?utf-8?B?REY5dE5DVExNam5hdkRIRGdTVitOWUlNUnd4MWlTNTMxK1lEZVc1MGxnczh4?=
 =?utf-8?B?aUVMZzVWMFErcm94dmtDR3ZzeUoxRzZyQXhmVCtKQUV1dDlRNzlyYVV1TXRK?=
 =?utf-8?B?R1JLOWthV2YyeExYS1Y3MnV1T05EcklhM1VNcklDWlBFWUU3MUxUMmZOUXZZ?=
 =?utf-8?B?NUp2a21iSktmVUdQYzQ3ZnAvS243a3ZpbzlwOUdpcGV4QkRzNmhBYXNBTEpt?=
 =?utf-8?B?RHZrUUhEeVl6ZHd0MnZIRzlGT3hxWVJqV2VqTmRwY2QyMjFtWEU3MjBRK3E3?=
 =?utf-8?B?VWdRc1BTbDBKcUxMYVlCUmsrZ1U2QklxbEwrdld1T0FTRnFwZWJkWi84VC9a?=
 =?utf-8?B?NUNxZk01a2dnYlNHRzVUQURuQWdHWGR4NHkxa1hzSndiYndYMFZGbTgvNmNi?=
 =?utf-8?B?Z3l0N2ZFeEV4VVdXbkNydEFPZHM3WER3UUhPRS9rWVl2OTlsSWZQa052dUp4?=
 =?utf-8?B?NThqZnV1U1NyQUhvV2F0MUE1WWRLY3RnMHozMTZpWjNyMkQ4b2ZVRTZ6dnFS?=
 =?utf-8?B?aUxUS3RUUGczbk81ckdqV24zUFdIUEdtMEdNMC83YmpsYUlZYW8zYTlndGhZ?=
 =?utf-8?B?OElHdE96aDdZUEJZL2Zzdkl2b2x5NlBKbno4LzFURk9XY2J4MWsvUmVUZlZT?=
 =?utf-8?Q?hS3pTYj/Vdg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEtuS0RRYUh5ZkpvOWxWYlF0RVRkMldrZ2p5NUtyS1ZrZ0tZcThPUmU5R0ll?=
 =?utf-8?B?bVFKaUdFS0hSUjF6enhwYmVYTFVab1NuSWdUUWNqVGppcEhEMlo5bzJYWGsw?=
 =?utf-8?B?QUMrWGJ2Y3VpM1FqdlNCdXhDYkYvdzMyRWwwajFqWEJVRkF1bDVBM1RuS0VI?=
 =?utf-8?B?V2ZQL1FOWjRpNUJZazJ2TUVqQzZPYUJ4amMvMHo3SVRXZ3J2MDUxK1VOMENq?=
 =?utf-8?B?YktwTzdrSkZ2eDJiK1kwOGpYMDhHNE81cjY3dHNuKzBjcGxYK256TG5paHYw?=
 =?utf-8?B?MGZVcUZvWE9Va1BxbjhLUG9KQTIvZXpYOUJXOTkwY0ZiRm9qSnZjWkRYaFdE?=
 =?utf-8?B?QW9ZbkR5dlBDTVduQ1N0NlpDcEwyQlpyckM1Z0UydXZ2YkhnZWdDbllUMDNV?=
 =?utf-8?B?Z1dsT0d5dVFrcDlPR3JIV0l0RCtWTjRVaHBFUUJudVVyV2xJWlBPdldpQTEz?=
 =?utf-8?B?STEzaHFvNWZ0SVI0MCt2ZUEva21JemtCR2IwQzB3NThBQndEUS9uQmx2Qk1x?=
 =?utf-8?B?UHhxZ05PYVlmZ3EzenVKUjhMT2NPOVZuVU9ScWZFQ0FRZnVqQ3lkY2FpWDJk?=
 =?utf-8?B?cjIvZWhnM2JZSW5CY0J0MlZ5LzAya0w2aVFRLzRIQUwyd3F2U0JVR3JVc1F6?=
 =?utf-8?B?Y1VoakFZVlNQMzc0bUxOTmtTRzJtWnVZOXgwd1QxNlJvVEVhbG0xRkErU25K?=
 =?utf-8?B?MjFpZGxxbW53RVA5NDdqRDVNNWpMNHY4aDRranp0a09wbnhEbThaWkFGVlpX?=
 =?utf-8?B?VlpkSGpROUw1WXpON1N5OTBtODhXUmxGRFkwU2NEK2hxWTBna2FOb05ld29Z?=
 =?utf-8?B?S0ZqSHdKVXVCbCt0UktTT1EyQXk1dktoMHRKYm5jbFFZSC9QQVVJUzI1SlJB?=
 =?utf-8?B?RS9COFhsTUlSU1RpVXRXZS9LM0F2UlpUc3J2THV5MnFoR3pSYTNnY2JZdmEx?=
 =?utf-8?B?bWtESjJHa2cyYytQY0ljdHFVbTIrVjRUNDVhSEZ1Ky9EUHFLV3Q4OHduWWRY?=
 =?utf-8?B?eGFvZ1NaRER5RFM4S3JiRmdBNTJXRjZYNzdXdDFOSHE3UXE3UEU2ZEwxWmZ1?=
 =?utf-8?B?b3ptMXF1UnFzbnRMUzJ0NHkxZnQ3S2paYUtmcFBxc1VIRU9lV2dDZnBueFdJ?=
 =?utf-8?B?SU4wdHJCUXF3N1dhQjNFbjRSSHYyYUlueGxNUlVtNHc1aE80U3lqS3lTTktx?=
 =?utf-8?B?NFlMRWhTdWp6YVh6WVJPanhubnRwS3FUK254Z2syMFg1RVNYZGdtdHB6MlJV?=
 =?utf-8?B?OFFJRmFFcWc1VFpGZmZPT3psbEJwcSt6NW8vRlJ0VFIyazdBNDJ4YURwQ1pn?=
 =?utf-8?B?eTMzOXNxWmRSd0h4OGFDbVBEam5vaUNDVklQUkJxTUlQVllOMEE0WWlWK0lY?=
 =?utf-8?B?TERLdm1sMmRxejROd3h1V1c0Yno5Y3owVDFLUVh5UER3OVpseUIvZWc1YmhN?=
 =?utf-8?B?UFdTTXkxRmJJMFJjSGIzTi95RFU4L1J2djRKTjB5ZGNsZzdzT1d2VUdPL1Nm?=
 =?utf-8?B?aVYwZE5HMURuajlqcWRYTlRaQnlveStjbjV4NStHN1pQREFMOGlueWtHNnQw?=
 =?utf-8?B?T0dhVzNGSlVxQTJkK0VURlZPWDdoaHlCdGE0TUJ2a3V5YVplUFowVjNPOVBZ?=
 =?utf-8?B?cWlraUMxUEVlNTRkNjhLZ2N2a0tDYTBjMkVRNjh6TUtoR2JpUkFtODQ2SWNJ?=
 =?utf-8?B?RElJOEIzUVFDUklJWWVCTHFoVCtueUxBeXBYbUUvb2JPUmR3a1ZjOVFMUWxV?=
 =?utf-8?B?UUFobUlNcXdQV21ZVEhSSk1tZ1FXTGd4Q255ZnM4WTJFaHBZdmpWQTVjNXF5?=
 =?utf-8?B?OExpU0RURUEyekUwemFRN29WbG9MaWY1N2xXbk1CNHJMS1UrbzN3OXJIMitI?=
 =?utf-8?B?eHhSTDhHSW5pM0VTTjdBcmxBWllENzJwTEZwN3U4bkJEZW0xYUVPUUxPNUpj?=
 =?utf-8?B?eDc0KzlKN25tZmdGOXB3YTUrR2RzS2U3R3duUjNnT3ZvUldGMkVMWVVnTEpB?=
 =?utf-8?B?ZGFudVNaV01FcUZ5QkZyeHFkNFJyR1R2NEhNQlRGQnJqQXo1OEZQM2FYQWtu?=
 =?utf-8?B?THdiTWZHWndsMC9QQUFFZ1NZUk5BbENHVXlncUVFbkpOY20wK3RSODdlMFpD?=
 =?utf-8?Q?k3hdjG9fTUOEA3WqDB0m6Hdzd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bde208a-c5c4-4bb1-d06e-08ddaa54983e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 08:30:46.5924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZN2Yp9h+N5WpTvNI7zQrtjtGFUfHEvdX5mF8HfJ1Xicyqfky3rv7pVRlNwBQcC5X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7009



On 6/5/25 20:29, Radhey Shyam Pandey wrote:
> Introduce 'reset-delay-us' and 'power-on-delay-us' properties. Default
> delays in datasheet are not good enough for Xilinx Kria KR260 Robotics
> Starter Kit (and others) so there is a need to program board specific
> reset and power on delay via DT.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Taken reference from mdio.yaml[1]
> [1]: Documentation/devicetree/bindings/net/mdio.yaml
> ---
>   .../devicetree/bindings/usb/microchip,usb5744.yaml   | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
> index c68c04da3399..94a2bebd32da 100644
> --- a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
> +++ b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
> @@ -52,6 +52,16 @@ properties:
>       description:
>         phandle of an usb hub connected via i2c bus.
>   
> +  reset-delay-us:
> +    description:
> +      RESET pulse width in microseconds.
> +
> +  power-on-delay-us:
> +    description:
> +      Delay after power on in microseconds. USB5744 Hub requires some
> +      delay after reset to get to state when SMBus configuration
> +      data is going to be accepted.
> +
>   required:
>     - compatible
>     - reg
> @@ -69,6 +79,8 @@ allOf:
>           vdd2-supply: false
>           peer-hub: false
>           i2c-bus: false
> +        reset-delay-us: false
> +        power-on-delay-us: false
>       else:
>         $ref: /schemas/usb/usb-device.yaml
>   
> 
> base-commit: 4f27f06ec12190c7c62c722e99ab6243dea81a94

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
