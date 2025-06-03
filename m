Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB375173
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 04:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748924977; cv=fail; b=q2dm+ECQeq2iYrxfG/dPeJFnZDjnqfAn4NzyJ4gW4vt+0h+/sbL1O8Zeb4l+UXKvuprvknYfpyZWfqtAdxete6uS1bgiQjGgkSDCWdeMzVauqHidD9fxo8dzwfr6ZXZheQGv0GNjWr0mNHcWYXWV4Fd2cY7M64rBe5zLo9fx8To=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748924977; c=relaxed/simple;
	bh=Pn+SBR9hp0JtBYohRzsqwJ9v9dfwZqNEEiikt6bqNiA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CN1oF8jfknJPc6vNPiSGtYRo90Cdr3LBEAhspC2lgsGS+pLrMg5wQTL6Hr+WpPtg6zcJEByaCESxONkoUVmHtr2tvIDaMRP+eMd7xH5W/6vXdQpnB2p0rSWvazmxe6UUZW98LOrxRX5iXy9Uq955qxMWSSBzDeRm9qVExL+ZWvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f616Yfbs; arc=fail smtp.client-ip=40.107.220.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f616Yfbs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4FvRkaI6G+RDxvCZVn2NU3Ll/mWWL2ZPPv4tKZGtjz8QBB7WfNjYeI5zfHprYsgOT+T56ZSZeqda76EiLqoHvsCW0jymMpZ8SUBIBgy36E9BhxyWvDJ5Bx9X1mY+dq9qBNkc56CsSedUcGYKLq99WBniXFNqEQCs5EoloLNkQbzmZGe51yvuuVFpUg7JAQDQx//CMY+kA9aSTkcmMhMMI+3zNy8P7/0wVT9fCYGfzDtJJdr4jR0BlljZicZvNZdsJg2qxuWyuL6iy792A73lfz7rOqYElbWAZ+e9LVGbWnAWLmdHxHt29AHHGVPEtyqHAGKUrE9QJW8Y0TXMV0BGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0gUySX+pue8CBJ60Akcggx+yjjOWHB0TdOzbMixpmw=;
 b=oWup8YwRso7Prsx57EYZDRJ/NSpAVf9tPWp2198tqoD6F9PSk/u0gP56lJTPYjsMqXMSiZYQ9JxFTlbCJFOkmWZSimMuhpollgGMyBs4/Ezy/OuLMYfI1Js5G0XY0wT35lMARuDVln7QqMXqSkKBsD2c6mbyazL01Ew2blR2XRPsbPObI//hWk7eUP9qaa0KAT8KgjOprzvBha9ysn0Sig18WsXdXUL+WfDWyzYsg5DJlJOXRaHld0cspj3/i7YtHgsniS0IO1YhZES5V0p37HuSDgeATB+5MPzyUjt0CxTHlskxhE7M2nt/eDZeNbGujzqXeu1gIt+yMsvGyo1KRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0gUySX+pue8CBJ60Akcggx+yjjOWHB0TdOzbMixpmw=;
 b=f616YfbsLHBD8SfobcwrxZp/sMY5cYS9+mj7NKLn1A3lWSvgP3apOFlbcqfbRzEMtFvke875oQsRyAPEGd6BzKSDCylMKQ7+2qMMGj4o7lgdwBFUe8Ox5Fn+bdGM69d6xrOwSEugaVa5njGGe7a5UrvTxftuOq/EGxdUk9gFRpSJMfARO+sEvN0LYJgbW4wanrWTr056hZdxoXs9Lv+Qwj/Xb2FeVmXD40g9NLdr5IqTBDoQoJJSbLNNvgfgtO6Ewvxga7soCzUcBWgKmaYwNnGy8Ss/B/e9efOs+ya7SP7owCtfqQQMoh4/9272YGjL9cAud5TCfHRwoUNkBFTybw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW3PR12MB4396.namprd12.prod.outlook.com (2603:10b6:303:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 04:29:33 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 04:29:33 +0000
Message-ID: <97260b2e-3f27-4eb2-a66f-86868a44c58a@nvidia.com>
Date: Tue, 3 Jun 2025 00:29:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] sched/ext: Relinquish DL server reservations
 when not needed
To: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
 Changwoo Min <changwoo@igalia.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
 <20250602180110.816225-10-joelagnelf@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20250602180110.816225-10-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0P221CA0029.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::20) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW3PR12MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: f509a3e5-9c8a-4a7f-df58-08dda2573d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3pvYnR6dFR4dkxzRzU2RHpubWFKQTYrWE5GTXQwMVBuQ0t0VXd5WCtKeDAz?=
 =?utf-8?B?ZWxnVG12eUhoVjVBYTYvanZkYlAxRXIxa3VzNE1EZTRVaVByeFBDSS9xWkR0?=
 =?utf-8?B?dlpSMWtXQTNhZjc3R1BDck1aQ08wb3dEN21tZzBuQ01tU21Jby9oVEQyQ2pZ?=
 =?utf-8?B?dEhCcEMrMktMQnZsRmtFRitVY2h1MFd1K3BsTXpMUU4wYWQrWnFIbU5iRW9t?=
 =?utf-8?B?OXpXTGZqYzJnS3pXcEpGQnFMVm5oNUhwcUJPa2VRVGNqZTZuYWU3eUJpV2RC?=
 =?utf-8?B?SCs4Z3B6YWhyaksrREVOYnZpRFZ2RVFpR0R1SzZIVVhUNUpsVjJ4WHY1V1B3?=
 =?utf-8?B?TVFBYkdOb3pBZEVBUUJwdmpVSFA3bzh3SXJ2L1h0N2pYMjhHZUNKOVcxazhP?=
 =?utf-8?B?SWMvQUdwVWJWN2NUSHV5NWJrN2dlUEswY0Jnb21WQVd1bmYwZUJBaXo2ME1D?=
 =?utf-8?B?VVltbFl6ODQ3a2taTW15emtLMmU1aXUzbWkzVnBSRy9HTCttWHZTSEU3S3BO?=
 =?utf-8?B?SmZFUCt2SlV6S1BwWStJSDVMYmNKQmZrNGg2MUgva1ZXTlVadjd5STZ4bGNH?=
 =?utf-8?B?S1psWGtQUTY2eFZjUjhOMVpGc243QkFUSzVGWmNER3FHN2RKU3N3UXlJa0Qw?=
 =?utf-8?B?RVFIRDNvN1dScmwxbUNLZFEzR0ErbnRtbnhWb3R5YU5sK0Frd1dOWUZxNGFT?=
 =?utf-8?B?eXdLRDFHSU1rSWgvZ2grcmEwRzRiRmRPWDFUUGxnOURmYUNldGt1UVFad2tK?=
 =?utf-8?B?WEIxTnlzdGpnV0h2TE5GUC9mUUdLcksyMzh0MzhqYVpwa0U1Qk9jL0RZYUkx?=
 =?utf-8?B?T1BEVWY4WWJyckt6VVRUazM1UEJ2dGhjektRTjNjNkoyOWFpTUZmSjNjQ2dW?=
 =?utf-8?B?SmNBZ1NNc3A0eDNDMkcwVGY2VDhSclhsYWF5TnorNWExQWJKNDA4SEhDdEFp?=
 =?utf-8?B?NHR6NThOK01pYVNCSXl0L0hTcTV6NGFKcmRoeEtyTWNkRkd2U1N3VWdzRGNB?=
 =?utf-8?B?Zm9MV3BrdzFwOTlSZmpoRUZ4cnk1ZFh0WExCNXlIUW9VdllEQnNDTTFQZE8w?=
 =?utf-8?B?TVRsdUVRdTQ1UzRFS3pZOVo5cFNWaDhMTWtkdjlIRzlLbW1vdS9pbUVyYjIz?=
 =?utf-8?B?UVNORnBHVWtBWEVSeVJlVEhXZHR0VERzcDUxM3pONkkyamtpSEFUVVdYTkFp?=
 =?utf-8?B?VEtaYnNBK3pPcE5zTVA3NytJb1FteEl3WUJEUWtFTllqeHdBcEdySzYrWjM1?=
 =?utf-8?B?Rmp0Q2pLWWx0RjJKNzRpQTJlMmFRY3NMcThUakVWRWMzZUUxdy8vRG9Ud3Yw?=
 =?utf-8?B?RCtYWWlvSEgweGo3V0hyc0JQWExCV3ZUNjhCK1h6VWVBaDI2Q0YxWlhPL1pC?=
 =?utf-8?B?YitsaGhObmEyYWNXaXNSd0JpNTlWL0pjSDRYR1ZHcWk3SWNISXpmby8rb0pH?=
 =?utf-8?B?Mjg4a1NuOVI5NzlQVC9pTlJNVnN0YzVqbGVPVDJ6UHlqdEFOdDU2bGhEaENS?=
 =?utf-8?B?bHZsMm5ZaDJWcFI5dmJzaHFrSnplbFNYLzNDSjVRb2hxN09MdkFwZ1dkTGRJ?=
 =?utf-8?B?K09XWklkRmx4c3NCNk4wR25sbVl4YXFCc0gzak5rdWtuZkM4bmwyR0lVbWRP?=
 =?utf-8?B?WU5LU2JDdTZuWEJuQjA1c2xHL3Zmd0NlRlZUOUZheVJxa1VLQTYwbDhhcStp?=
 =?utf-8?B?aUt6dXdwQWN0M3hZejN1Nld3Rm5jMlNEQmo4Ykh6Y3hVOEUwSEtoa0dQYkVY?=
 =?utf-8?B?QnNJeEVsN2xHU3B4bkVSLzM4L2RzSWtXdlJLUVJNQmRadlZBd05Gdy9oUVBM?=
 =?utf-8?B?dW1PdUVxK1pLT3p5NFQ3K0ZRUUZrSHhlNXROdGFpaUdHV1dyMlM4QjZDNlUv?=
 =?utf-8?B?NXY5VU03SndhbFdZN0tBQ2hMMUpLVHZLaGljNm5EL1UxeWxWT2tJbFMybnRT?=
 =?utf-8?B?R2R3RWVNckRwMnpqK203dzVDSENDV2IyUloyVTRFVzNSU05ROWV0R0hld2lx?=
 =?utf-8?B?RHRqZjNlQ1lRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmJaVU5iSmNnUndpaS9ZTCsrbnlHa2VwbloyUUdaT3hUbjhuTHdkSXdkTUxH?=
 =?utf-8?B?elNPMWRuY0NKWEx3eW4yOHVlbC8rRDZqL0JWVlowWW5Qdk9YeUd4RHZFazlX?=
 =?utf-8?B?OXRKYmRmVUo3TktoalE1bXdhQ05yQVRIcDNnWjBIS2VnSkJLREFXanFtM2J5?=
 =?utf-8?B?b3JCbFMvU1pRTUwxQTZGMlg0VThrck1YSjBYZzF4ZXR3TGpMckhOK2pKNlhH?=
 =?utf-8?B?aFVvdG5aNmk2L29VWFBjNW9Ic1l4TERHTXlKSFJocFI4OVAyRTViTW5LV0Q5?=
 =?utf-8?B?RW5SS1dYTjVqODRXNmpaQ3c3OVl5SGZ5T2tDc0U2dzF1SW5vK0V6OFM0WXZ4?=
 =?utf-8?B?M2s4RGpTSS9DNlV4MmNmdE9yWDk5d2lnMzMxMHNkWFBYQk5jTk0vSXJNbkxE?=
 =?utf-8?B?S1plRjVBY3RGSVV5ci9uSUJEdGVhMUwzY0xOYnlkb0loUmNnaTkweXM5NElr?=
 =?utf-8?B?RDhsRDFkZ2JKbHhuS3ZBQWdJeHFSZ2pMa2l5ZmZ1U20zejZGTVJzd0tKVmpI?=
 =?utf-8?B?RDZsd3FJSHJhaXlIL3g0TGVuUnBvd0RIZGlIWDZKNElKazkvMmN1SStGbjBx?=
 =?utf-8?B?eitpSjBmY0JrMjl5clg0UFRtdEJuTDhqT0l2MTdZMVRLay93T3RIMUNIYzZI?=
 =?utf-8?B?ZlVlUUJDTkh5RzErWC91THFXMndJMTVKd1YyMmp1c1F1Z3RnM3l6TG5Ua1B2?=
 =?utf-8?B?K29MMEUydzFhR2J2cDRxMnNabktvdDcvckMrNUwrM0N3VXEzOUJ3L0lFQ1hi?=
 =?utf-8?B?dzMyQTIyZWUvNGxDdVpTTGdoUlkxK0ZpZWlhVGF2TmhTOHQ5SFhyUmtIcFJU?=
 =?utf-8?B?Vm9HTm9Td3V0a1NiRXd5bXVUdXJsL3h6Um5LWDhUMjZta3VXZWdCc3plcng4?=
 =?utf-8?B?MXVXVEFENXU0ekIrNTBDWEZmRGtoM2w5ajdqdHRYejdWMTdUdzZtcTMwQ2FM?=
 =?utf-8?B?cVdmUzdVbk9vZG9TZEhiWkhKZkE4azZYalVFZlRncFo3d1BUNUYwY1U0M2J4?=
 =?utf-8?B?cVQ4WkI2SUpzNHdqNVV5aUtKcUI0L0VDNHdVNHV6SjNPaHZsdzlDdUFXWVBF?=
 =?utf-8?B?eUxXRjdCTUVDald1eGNzbklNdHhmaHN3ckFTd1VzNE1nMGlncGhrNFhaSmg5?=
 =?utf-8?B?VUVuYTBkL0V2dHVxdFY2QTh5YmZHRDdTRjd6cXlaUlpUcHU2NVdMSVlUZDVq?=
 =?utf-8?B?dUNIR0VyTElwcklVb0N1RTJqUUNYUi9Wc21XcUhDNDNSa1lYQXlIUWs5ZFli?=
 =?utf-8?B?SXFnT0VaVUJPTmY5Ty93TGhnQ0pVbE0zZ2ZJRVM4cWd3bG5XdE01dFJtM29a?=
 =?utf-8?B?ZEk0RHNhRWtXSGxzajhlc2paQzA0TjNSNkVPNEdoTWNLeEZUaG4wOCtacktt?=
 =?utf-8?B?RDh0RVRRb3g1eHlmdXB2R2puSWljdDBkQTVjV0pRT204M1ZWbFNKdzViS3VD?=
 =?utf-8?B?VTU5Tm1mTnRHaXN4OVhXMmREamZrTzhJRng4UkxUNjFwdll5MGt2enZTSFdl?=
 =?utf-8?B?dWpDRXh0Mys4YVNZZzFSazVmZi9rdlViemRGRmI2VzJEU1k4YWh2T1hmUmlC?=
 =?utf-8?B?WGMrZnFrT1AwTTlsMlJobmtveUtVdTk2SG5sUlFIZDVOVUhhbEgrK2MrQWNR?=
 =?utf-8?B?bTJndVd0aG9vY0s3UXBQdHlEV3E5RFQ4WW1HNUkyR1V3TUpxY29COTk4WDhl?=
 =?utf-8?B?UFMrYTlSc2RSNnRheTlYcDBMd2d2MUVkN1JLMG5qdTA1Y1RmZTFmRmcvTmJI?=
 =?utf-8?B?YmMzSDVaciswaUxYWnlVanBLMm5qSTdnNmdPczlxbXpkMFYyV1F3czl6RUUz?=
 =?utf-8?B?blJiZmUzSHRiNWVTU3VCbmJMRzF5UmVIM0hIY0Z3eVZlNGFIK1NBbDQzajFN?=
 =?utf-8?B?NDlvcGNFWDQyalRtcjVFUVRyb00ranF2S3Q2SjVOWjd5NUhoSDZTSkF6T1Nw?=
 =?utf-8?B?ZFBNVGdId1VKUC9RVksxL2NydklyRGIvNTdmZDJLdTRwcE5Iek5NOTMrWVA5?=
 =?utf-8?B?SVhIZVhpZTNNdUJzL0tPMFgvR3B2aTV2eTBZRjhFeVljT0djek5sUkQvYk1z?=
 =?utf-8?B?elhjSTE3ai9ITWZmTmlnTXZvZkdzV1I4VGRheVB0WkJLcXNWUzRoUkdDWnRO?=
 =?utf-8?Q?mjtnoQeSc9Fm38ghFAPl7Ocju?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f509a3e5-9c8a-4a7f-df58-08dda2573d4b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 04:29:33.2738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LxzXIzEXsvDMZLAyYw3hA82NMWch9ZbM58zrZK+totxIQOgPQQWxN7NHbXtjG4JA6cUfYKmxv8uvEs2fjUAGmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4396



On 6/2/2025 2:01 PM, Joel Fernandes wrote:
> I tested loading a test SCX program and verifying the bandwidth both
> before and after applying the patch:
> 
> Without patch:
> Before loading scx:
>   .dl_bw->total_bw               : 1887408
> After unloading scx:
>   .dl_bw->total_bw               : 3774816
> 
> After patch:
> Before loading scx:
>   .dl_bw->total_bw               : 1887408
> After unloading scx:
>   .dl_bw->total_bw               : 1887408
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  kernel/sched/ext.c | 44 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 52f98c3944ed..c938a19cd44f 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -4784,13 +4784,28 @@ static void scx_ops_disable_workfn(struct kthread_work *work)
>  	scx_task_iter_stop(&sti);
>  	percpu_up_write(&scx_fork_rwsem);
>  
> -	/*
> -	 * Invalidate all the rq clocks to prevent getting outdated
> -	 * rq clocks from a previous scx scheduler.
> -	 */
>  	for_each_possible_cpu(cpu) {
>  		struct rq *rq = cpu_rq(cpu);
> +		struct rq_flags rf;
> +
> +		/*
> +		 * Invalidate all the rq clocks to prevent getting outdated
> +		 * rq clocks from a previous scx scheduler.
> +		 */
>  		scx_rq_clock_invalidate(rq);
> +
> +		/*
> +		 * We are unloading the sched_ext scheduler, we do not need its
> +		 * DL server bandwidth anymore, remove it for all CPUs. Whenever
> +		 * the first SCX task is enqueued (when scx is re-loaded), its DL
> +		 * server bandwidth will be re-initialized.
> +		 */
> +		rq_lock(rq, &rf);
> +		if (dl_server_active(&rq->ext_server)) {
> +			dl_server_stop(&rq->ext_server);
> +		}
> +		dl_server_remove_params(&rq->ext_server);
> +		rq_unlock(rq, &rf);

I am sorry - this bit also needs to use the irq-disable locking:
		rq_lock_irqsave(rq, &rf);
                ...
		rq_unlock_irqrestore(rq, &rf);

Otherwise the sched_ext self-test hangs. I have squashed it in my tree for next
revision.

thanks,

 - Joel


>  	}
>  
>  	/* no task is on scx, turn off all the switches and flush in-progress calls */
> @@ -5547,6 +5562,27 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
>  		check_class_changed(task_rq(p), p, old_class, p->prio);
>  	}
>  	scx_task_iter_stop(&sti);
> +
> +	if (scx_switching_all) {
> +		for_each_possible_cpu(cpu) {
> +			struct rq *rq = cpu_rq(cpu);
> +			struct rq_flags rf;
> +
> +			/*
> +			 * We are switching all fair tasks to the sched_ext scheduler,
> +			 * we do not need fair server's DL bandwidth anymore, remove it
> +			 * for all CPUs. Whenever the first CFS task is enqueued (when
> +			 * scx is unloaded), the fair server's DL bandwidth will be
> +			 * re-initialized.
> +			 */
> +			rq_lock_irqsave(rq, &rf);
> +			if (dl_server_active(&rq->fair_server))
> +				dl_server_stop(&rq->fair_server);
> +			dl_server_remove_params(&rq->fair_server);
> +			rq_unlock_irqrestore(rq, &rf);
> +		}
> +	}
> +
>  	percpu_up_write(&scx_fork_rwsem);
>  
>  	scx_ops_bypass(false);

