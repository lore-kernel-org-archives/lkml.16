Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB6327B4E1
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149150; cv=fail; b=JnpaGFRiIELPqu1QDUlXd1sLCnNCOxH0qKidWrwI0SVP/TwLBp6EMFWMpxSK7jWGQz301+uusqJ1ppWH45JuXMO3QCBLma9Ii3an43dK9e2joddtfeyQgdjkPwKJVGxrYM2hUZ2fztctVynEX0TC5IQ/Ruc+g0paoYe5y7BbTx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149150; c=relaxed/simple;
	bh=w0h8UkyOjpCKwXU91HdCOY0sW5LQaeWcJk0Kfc97NO8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i4Um8ozeAAaEi4pBgVsP4+jaKuoFDWEHJDMQ0t1mKAGk07qI1/qvZ6XnwZVkjvVOjTrbg72So7g5Wo3KMbnstib7+yHrrAgQc3DKuxWNOAa4w1M0s+5sTZTTpc1bIrBcVSgEorfwhrcST7c7J5Otu7M0rO6AaVCEZ3JnUX8ftyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c9A3s/uo; arc=fail smtp.client-ip=40.107.220.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c9A3s/uo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v56NxW7zd2n+U6KSYs7fQAsInirR5qfK3Lyd0YcHnlbVH2cXQN3VClpC6cJbQ94QMWSmpGb3LR+7H9Z+2JxD8/q6QFkMUzKnPpaJCHS0G0YYbaEp6PsdOkuNvkC55E5fngB+tk/Ore0dZHyZ33MOGIUr3+xEcFihPylvUBt19Ln1XbjxOokgEeTMCSljsNIi4YHb3vLLzsmg9QEEBYbMHsavHtD3MGDNhMc69muibTArAfsWaqpoe9pe+QimUp1cDTCGgpH5dnjmbko5QC6eaAmQVXwVTLIVn2j/HOtjFyPTwlFZ/8UF0Ms0McE6XePIe9Bl1J93xd0FOGtuNIafRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHvk9gmk+nJRtIY5mRRjGNvMCHUU7Yjc72Gpt5agYBM=;
 b=fWcA3sXlR/L+Ff51ZMMlczWHZE+IyuXpd8CIjSdTGU+ikybTv7mgvb2Gqw4eA7pkar7Pwr2OXOnQLk5WFxV6X/ByO2aTJHmFTbP0o81OsOTyLptyYy0Zs9WKW8uohbZ1kOQLOgICj9vg2Ovar1VhFHyZ3zpDd67lESch2lz0ZUPtKGWFBdg70zqq4405O+sj7yiSaXqacPVVg6XMRExHuMp+YfQVRHzD5WVsQuO/ZWVBYEgosjs0KHkUmwtgaY4SAnE4VR3ORcVU3jDhWSjZ8WJuRZbUJ8AapCvARaJM1IWe7LXWytur/zui2oXsQnLv4SsOm7G6C0eME19NE2Hwsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHvk9gmk+nJRtIY5mRRjGNvMCHUU7Yjc72Gpt5agYBM=;
 b=c9A3s/uoaaFGroMNVAJ5e9zqtF+U5f3T9qGW2SnL82Lm9cIvaeI7TdTTYCEph9CmcsGYyLIa3t2e1e79jTJvQD4V9gVLq1qxOmwjTQy1wQuBwbeZshj/2aXiXEJ2dB/r604yOM00VH5K5vZJ+uyEVCxwcu7QVGUvzLOucI34ZDLZ9iP4le6k0lXN2UtIjAUmueiXdEoxcRvAnv1tAywKnRtAZoQf+fbfeVpfV90+zFfOOjFAJUln7JwgC5NVvYD8PgkUbmn4oxye7zMWpiwhJSR9e5CoqmGu2jR0s5DzftiLCjWwKG0ioe+LK+1KR7JRygIEF3ylS+H9xPinzsm2Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Thu, 5 Jun
 2025 18:45:46 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 18:45:46 +0000
Message-ID: <04215f6c-8f77-40f0-ac61-d004a166553d@nvidia.com>
Date: Thu, 5 Jun 2025 14:45:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] sched/debug: Add support to change sched_ext
 server params
To: Tejun Heo <tj@kernel.org>, Juri Lelli <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
 Changwoo Min <changwoo@igalia.com>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
 <20250602180110.816225-7-joelagnelf@nvidia.com>
 <aEAZo3_g-OMVEgc-@jlelli-thinkpadt14gen4.remote.csb>
 <aECTCyILPeWF1gvX@slm.duckdns.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aECTCyILPeWF1gvX@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:408:f5::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: eed6116b-d9bd-4411-05bb-08dda4612ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjNYdHQwSkcvcVQ1NkZqQm9nanAxclBNdWdMNksvVHd3THZZaHlXcEIwcThL?=
 =?utf-8?B?Rm1IdWZ5WldyekNhYTkwU2QyVjRneXdXQ0c4TWVMdFdNSzhvT0VQcEFsZUI4?=
 =?utf-8?B?blFkdmFKczh5Ris5ZWhSUXZKMUJVeUE3RGtrMWdubG93QStvcVV4UDNrTnVD?=
 =?utf-8?B?ZDgyWVpLMko3WjdZNmV5MnhTeDRoV2FMU3ZuazNPNURQLzJKQytnTnk5eEtE?=
 =?utf-8?B?MzJCdmJraVpDYjMwSUx3RGJPU05CVnQvZWUyQTZLOWdUODYzOGN6K3BqOEdP?=
 =?utf-8?B?YlQ5elBPcG5paVRhL0EzWi9BS3RaWXBxMnZxdk5wWkVnaDMxQ21ERUloeHoy?=
 =?utf-8?B?b3AzOWExdk5NM2JKTWRlNFZKT2ZUUHJkZWQ0NncwT0Zkei82dmMwcXlPbHBE?=
 =?utf-8?B?UlhQY3NwS3J4ZUh1ck50RHg1QTZ4MnYyRHJTUU11LzNLdGZnNEZHRG5FWE9I?=
 =?utf-8?B?NUZHUXhMSXM5YkRjMms1TWk1SG1YaDNua056YlBkMDc1aXJualRlL09tSTli?=
 =?utf-8?B?eXhyZkRjSk8rWXdHVmxvUTVzZWs0aXE4cGNpWFAzejFCWDQvWFY1N3pKTGwr?=
 =?utf-8?B?NlVCWm1BczdLcEZkWm10cjZneWVDRjhHTEkxVmN5MnJDNnhoTGNaMnBYU0FU?=
 =?utf-8?B?VXg2dktUZzR0TFZtK3pWbkN5RVU2bnIzQXVtek1iZFQvTlI1L3F6MVFmNjRv?=
 =?utf-8?B?b3pLVUZqeUkrNWRFSmR0Z2tEanQrZGpMQnVPcVd3dlNzTTNGMWEzdDFtdWQ5?=
 =?utf-8?B?ODFDNTlLTFZIR0Q5L2JLWHdiSTJkK0Y0T1dBcGRvTGx6dXExL200bk45ak15?=
 =?utf-8?B?S3hVa0FYUTlZMmZNR0taKzFuenJaMS9rd29BMXZjSzl1TlJPRTZ5b285THpn?=
 =?utf-8?B?OTMyUlNrOGV6R2ExOE5hY3pJaFZiaFJkNTBtV1ltTmo4RVBNSEt2aE1hWEZU?=
 =?utf-8?B?VENib0h5U1BMRmNRcTBCVzNNSDRxeUpyOU02eVJyR1FBYVJIZk5RLzJDQ0JF?=
 =?utf-8?B?RVY2NlZyNkkxdkswUURSNmpoM214a0xxUDgybkRjYjNLZEJITDRiRHVjUGdT?=
 =?utf-8?B?M0E3elZWeWIwVSs0TjN0M2R3MG9Pc3pQU1hWbDZwY3RpR0xUekdHdnZqK28z?=
 =?utf-8?B?a2dHZEJKUngwSFBFTGtpcFE0bjM1dnFZdjZtbUpqM1NvZkdTNTlWRjRBYUZu?=
 =?utf-8?B?S3JDSk5hU1c3Tm43OWJUUVMyS3A5RXY2ZlJoOWJmbDVkZWZyOTRNZkdZcFB2?=
 =?utf-8?B?aVJTMk12cFZyeGYxQnZHcnc4TWowVXQyOXBzYWkxL0VoTjg0UTVLWENtK0w1?=
 =?utf-8?B?b0l6RFJaVWJSanJ1dWFrVGNYY3FVRHJXa0h6T2hucmdWV0s1RjFNdjNsUmc4?=
 =?utf-8?B?YXhEY3A2Q0sxR0RINC9ncW9XSTh6andKdXFlRXZVNEh1UlpsYmdoaFhXd0Jo?=
 =?utf-8?B?MFJpN2svcytGNXNCU0lPTzhDbkh6cnk5ZjZhdVhOdWlBdlJBcm1lNkdUVFkr?=
 =?utf-8?B?S2lKWTEreUwzZkk4MGd0a2NjMXNYRnNBQjRPc09McDE3bUNOa2N2c2tzS1Nj?=
 =?utf-8?B?TE52VlBWei8rNk9zZ2NnS25oNjRQK3A5V2ZBb2s1eW1xak95ais4NVo1Y1Q2?=
 =?utf-8?B?eW9Jb0Z0TGdGZVkza3dzbGhzZUM3QUZqZHpLZzYzY3V3akxmczBnNk95WXZK?=
 =?utf-8?B?cWlEYUV4TDAxRHczZDN5aGpza1RKM1lRN2lSS0FDKzhGMmM3bkwwSUQ0cndR?=
 =?utf-8?B?L3o4djhJcFFHU3VxWUYyak1ESkRTc3V5ZnFqS2tkNjNqaStQdVZwUXhIL1Zx?=
 =?utf-8?B?NS9ycnRSNzNUWGJxVFV5Rnh0VkZGcXRvRm0rYVhuYjdRR1BqMG5HWlNVc0cx?=
 =?utf-8?B?RXJQQzVzU0tKTEZHQThRMDRGeVdwSWhWdVZUdnZDd2VYSVZvdExXM2RvWjg3?=
 =?utf-8?Q?HJ+SB+j5R4E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmFwNi9KT2FwbG1obnBreFJmcGxiazVzc1NraVBqb3orOU1pcjRnWEVjSXhK?=
 =?utf-8?B?TDJqN2NWTzFvVWtDeXNsYTN3Umw2Nk5rcWtiY0g1MFpNZ3pxKzI4NkU0YTZ3?=
 =?utf-8?B?bnEyK3NzSjlKcExXTUo5VUZvRnprUDFkcjU0L2ZQSEorWHV4SENST0hKQ1FC?=
 =?utf-8?B?RkJHTUh6bGZxTnhabTc4NWNRNFptYmJ5MG5MMnhoU05ZUnFxZjJiWVh3Q1ZQ?=
 =?utf-8?B?TzBHVVd5RHpVK0R6UGw5cUNJMGdEMDgvcEJRVEtoOU5FWlQvcDdXcjFtT0hF?=
 =?utf-8?B?UXlrY1R6VlR4QWdBWVpaTkp3S3Y1MXVSQWVNMTFEMDhiN3c2TlNaNkljWHd3?=
 =?utf-8?B?OGhaMGlNREt2VEozYXZkV1pRM0c4cDh2OHh2MExHdmRXQTJmMkdXMXRtZlFh?=
 =?utf-8?B?K1AyT3BldjRibnJzNkhIU2xtakpMaVl3bFVJR0NiMUR6VVRoVEJpQ1JlMDVU?=
 =?utf-8?B?b3JBVVVXUzhrMGhYOE05SW5SSHY5QmRnNkoyVG1TY1lUM3ZrR2xpV1FLZXB6?=
 =?utf-8?B?ZGMxcC9ucHBNVXp0U0ZlV3ZPcmhJOCtldXl2VVJnclpVblczVEJYZldQMXhy?=
 =?utf-8?B?c0NlTFFqdU9mTnBtRXBxcVJaYlZ0UkdnWUx1dVN3NjhmTldDU3ZRYU9XUDVP?=
 =?utf-8?B?YVdXNW9IbmpTZ1FBSi9XY0FDMHkyUy8xakhzeWtVbVhaZ2RrUngwWXUyL0xN?=
 =?utf-8?B?dlNSN2d4MlYyOWh1a0ZtWk9wbVRpd1VMd080Q0pRSVBVdnVyMzFqejZON0kr?=
 =?utf-8?B?MWFxNnNoQ2IveE1kZEN6a09vTEVsdzcxRG85SFhtcjlJbUtvWlM1NWJCcnAy?=
 =?utf-8?B?Ri9hRUFsMGcvSVVpb3g1bXlTOFRqaWwxRGtBUDR2R21COGd6RVBBVEp2SXd2?=
 =?utf-8?B?NDZJdFovcWJnRnNJVktVMitNNjRoV3RGZDBVcitWakFBd1RHM2ZHVTB2Wm02?=
 =?utf-8?B?R1R6ZjF2L0hiQTk3RERNblVFMGRBU29nMEtVWkdzckxNMG93Zll1MUkzR2xS?=
 =?utf-8?B?emlZbFF4eFpFdWVpSGtwVUQ5OGZWK3oyOStQQXJpRjdpckI3V3F6VWJnMTVi?=
 =?utf-8?B?S1NMOWpYanhuSHpEVWlYZHZFNjRDbG1mbjJPNHFpRnpBQ2QyWitEb2dtZm9Q?=
 =?utf-8?B?RXBCK0lwZ3praUYwMWQ1TVZpY1Q5cEh1R0RuOHZHMFRsa2ovYWx6VkFSUGt4?=
 =?utf-8?B?czJSZDZkcC80NmttVFJyWUZHVDJHam1UYzNzemZrRGxaank4a0JFMnFadlow?=
 =?utf-8?B?OXY5V2pHWWNyUU41T24vWFJTN3MrYmkyeWRhNkhSa0FIZVdIejQwUjlRSHhR?=
 =?utf-8?B?Z2lkY2VBNjVzVm1kRWpQYTJTRmtCT3YyREZDaCtHL2g3VWJCMlZ6VzdJTDJK?=
 =?utf-8?B?WTNJaHhJMlI2Nms2MTdTQlVnSldLOW40cFFhL2hVVGlrNTVLVDd6a085REpJ?=
 =?utf-8?B?OStCaFRTVkZoc0ZmVENDUkJrcGswMlFwUzU3bUN2RFdLZ1pBRER1MjRqWjRS?=
 =?utf-8?B?UlMrazVoRVM2N2lRQjVwdG51M0IwenB3aC9EanVmYS8zdG9MMVFVdjJMN1kz?=
 =?utf-8?B?a3hXVWM1dE9vT2hjYTJtTmttMW5rMUlmc0M0QjBHd2ZqaWIxVS9NZVhyeUpk?=
 =?utf-8?B?ZE1xUjJDb09qTCtUZVg4bmc4bWpZaWpyYk82YStvN3poNTFEVVByRkZQYjhK?=
 =?utf-8?B?M2QvVzhZYWcrYTYvZENpZnU5TFpGSFJWYTYzMEZVV3FyS0ZzWUk4Q0ZweDk4?=
 =?utf-8?B?TlFDWXp6bzBwUmxFZFFOMFZTVGVUSzg3M0NKNmFUQ1VSRVVwTGxiUldLMHc0?=
 =?utf-8?B?VkJGWDRlditlTXlPVExuM2YwQk1CQ3UrTlJ4eHl1S2NVUjFSeDNsdGxrU21k?=
 =?utf-8?B?NEZOcXR6eEp5WFNPQkFua3NoYmlrZll3d2xpZTZIU3dzeWEwZ29XczRjRWVT?=
 =?utf-8?B?dVQ0U0VCeWtWSVNRcUkwYW5HV05QczRzV2E3MC9JSGZHRTNpek11eEk3N0lv?=
 =?utf-8?B?WnBKVG1tb3g0MGovcGlxRDJkYTdZTGpZejd2Kzh1cEhiY2txd0VoWC9wMHNK?=
 =?utf-8?B?cVJMUTJGVUdySUJGdHpkRk1jYUZkS0w0RDZCL09oT0Z4Y1RLdFZQcEVrS2pP?=
 =?utf-8?Q?d0JJs7tOG3YupcNELSOf5dGRE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eed6116b-d9bd-4411-05bb-08dda4612ed6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 18:45:46.3225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fuxeloF6slGL4aA0JPv6qul9tyjrp/SH59Xdl/c+kyBoViVEKXNmPdMXqIw2X0/u7w26gpmVNfA9v+12PAlV2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154

Hi,

On 6/4/2025 2:40 PM, Tejun Heo wrote:
> On Wed, Jun 04, 2025 at 12:02:11PM +0200, Juri Lelli wrote:
>> Hi Joel,
>>
>> On 02/06/25 14:01, Joel Fernandes wrote:
>>> When a sched_ext server is loaded, tasks in CFS are converted to run in
>>> sched_ext class. Modify the ext server parameters as well along with the
>>> fair ones.
>>>
>>> Re-use the existing interface to modify both ext and fair servers to
>>> keep number of interfaces less (as it is, we have a per-cpu interface).
>>
>> We have a bit of code duplication, don't we

Hmm, I did try to keep the duplication less but I'll give it another try.

>> I wonder if we can do
>> anything early on to prevent mis-alignment between servers in the
>> future.

Sure, let me look into that too.

>>
>> Also, is a single shared interface enough? Is the assumption that either
>> all tasks are FAIR or SCX always guaranteed?
> 
> It's not a guarantee but at least all the current use cases are like that.
> No objection to splitting the interface tho. In fact, for SCX, it may make
> more sense to just make it part of sched_ext_ops, so that each scheduler can
> specify what they want.

I am Ok with having different debugfs entries for different servers, and perhaps
we can reuse the code for both to reduce code duplication. Will work on that next.

thanks,

 - Joel


