Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A2610E5
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749747292; cv=fail; b=bBpcaqxJr0Ai+PeLjQ/mx0xA4TBfE7skIvT/VZMJ02kTc4wudGBL4fFp5YQLNC/BmSC4luzLNsCTPr6hWcRZ0txdxriD2XEvb4GtBsU/PErtMlQgICFIEU+NG+4LWH2l3UR42NqHAARgdre51JbSojIX23XAZ6kpNRiGw+rwDAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749747292; c=relaxed/simple;
	bh=tq0+CorXY9LeaTBzKM3gebWHMAwes2d95eenPyn2nks=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pVcMI0KQbVNkkAZGSfNOMs5PBuSz+H8kFcPA501PDsrAUzzV2HXmYRE1ModI0sK3qr7HEvPe/hoccLokA1M8OBPCs1cim3oStBsAT13IpGvY4EoHDkY958PzNNxdi7/Hi2FiLffwh0k0gqGZwx/l9VDcgReFg+X/F9ITk5o7jLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lsGrcJbA; arc=fail smtp.client-ip=40.107.93.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lsGrcJbA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoiF+TetBguCGrxk7o+NQdejVQBNFLusdCywIlOLwTN7F7a31NvBydX4NBegI6cUwrJ0VQwxV2ngtxnEKQRDaPCDgUDXFv9eJTdntpbsbS78aPgmrzveAAks66jpCVNuBFZ6LP4edss5deL/voOZM6rjgxl/yRplbba2V1TQT6j7cyxS+acoPcHp31+sxx/gOTRUYAI2l2JJ/7sqjqyBgKFDJ6r+doJPfekbRjKgCR0cJ55X0ebwyW/47n5UzHtHXRVBtz+4fGvf+P2v0tJwm/NPCRNDdyHbAUaKo/7Go+uYrEcI3iinA364bZXpTWcBYXGRtfmzlJloIMw9ngwI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yClwftpvsqPrJuDZiQY/O1X+APvy68ZhTLY5lsOsWg=;
 b=r5w7VrCJF3ownF3lKFQX34KLP+UNpZkfe8vd63wm7nGo0fuYqvScMbJwcDpJV+7icR0FJMVcXW8pFECfGZv5FMAApc+Dgb0D0OgSXrTfT9pb2VQrSJ7Pp5X2rUiKrZyPlzx5dXqlVvybKdxRrGpaVoZaSZlyZGMcFmZM+1LNqTXbITZSpJaX/xxbMMT3XihujRe9BQM1qFO5R3rFLovumltWXR2xHDNfw0DRorSJ7Qxwmq2AzlyDaW81zXpZe7KZdjdRX462IuCPl0JcaNqP/B7MJkoIV+XfKCtWMwHn8S7ekK/lm9m5qL0r0GKgZCAwXyw7gQXoUxOYTBDj1+nGXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yClwftpvsqPrJuDZiQY/O1X+APvy68ZhTLY5lsOsWg=;
 b=lsGrcJbA6phxdIyeGKhtz2GFTErjj9j6iMw6/vDx/qs6E7jyaH/TbBJ7oQ1qPCfLOlaL2obInyN1uiHNP2OAhaqsWwOewijOp6N0ks62rafZcVPFB6xB1riXLqTD1V8DSKQlDeAJrY1b5oHrc+ca+/grahnS9bpcsUDCt/mIj36aL7dLo2Stxevebo+NgdIChTG7cnmZjIyhCKFdd5loVtP3MGedj/0iYmzEZ2x4Lg60CUmqDWze1lD+ex/RgE/XCdPM1Xe9f7sZG4cxRhRrbllDpso6gwED8wYPFChi8B5MAGISsyCU+jTLbZ3DulL66Yq8oLKWdZMr5uFVMYM65A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 16:54:47 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8792.034; Thu, 12 Jun 2025
 16:54:47 +0000
Message-ID: <e68f33de-fdec-4448-840b-79f0d987b2a5@nvidia.com>
Date: Thu, 12 Jun 2025 12:54:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] sched/ext: Add a DL server for sched_ext tasks
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
 Changwoo Min <changwoo@igalia.com>,
 Luigi De Matteis <ldematteis123@gmail.com>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
 <20250602180110.816225-4-joelagnelf@nvidia.com>
 <aD5Ai3xJdnV5SxG0@slm.duckdns.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aD5Ai3xJdnV5SxG0@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0219.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::14) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e29873-3596-412f-5a86-08dda9d1d687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmNPYUkwRDJxd0pCTmVYUHZxbm9IZmZVVXB0SCs3cW5yS2pOVEl3UDBhbjZI?=
 =?utf-8?B?ZkRSaHB0MjdSSzBNc1ZkM1MrYlRodXJRS0JMdHVHeWxpTkhtZXZPWjk4NEdS?=
 =?utf-8?B?Y1h0UUtlVFpLbUJnb0ZjK0tIdktJSm9rMTEwMTA2VnROZWpuNk9OaW5Td2xa?=
 =?utf-8?B?ZDBQZXhWY0k2ZEwvcGJCSkYxMmIrSE1jbW5sYWFtWVpHWXpkRkJSekVWeUE4?=
 =?utf-8?B?VWdNYWZwUDFvaHNUdU04S1lkbUhEanBuRFRTT253UlpEcmV1alc3YnRiR0tx?=
 =?utf-8?B?RldrVkcrRGt0RDZ0ZytZN3NVY1VoL1BDTUpzLzRpM20zZnJqOXlub3lEUFFh?=
 =?utf-8?B?bUNYY3d0TU1IV3kxY3ZpalMvK2VqV0tRaUkvUTYxbmpLR1pVb0oyZ2piSzVz?=
 =?utf-8?B?RHo2bGd2Tm1jbVBHVGZ6cVFhWEh5QUZMakZDVm5xcm9oclBqQ2ExdGJjR2hL?=
 =?utf-8?B?U1M0b3pha3YxNHhGbjNndDRkQjdnNS9OTmpjcVFSZWtXcnAyTXlOZlNGOHB6?=
 =?utf-8?B?U2QvcXkxM1hPVUU2MUQ0ZlBlYkY0dzlOK2RtM0dWM1R1cFB3ZFNyeVNOQ200?=
 =?utf-8?B?NE5DYWhrNVNrbWs2VjZWakJ5aFNPTlFnWTkzUGtERnFrQmMwd2JjQ1Z1NWpE?=
 =?utf-8?B?V1hDTEVCZ1pvSFE0V1M4ak1RVUJlREtnNTIzZVBZM2NoWUF3TXUyUFNZTUtW?=
 =?utf-8?B?YjMyYnZWU2pUSS9kRW9xN2JWOFFRR04rRWNBYVllZEw4RkdTbjlDN0tqeUtx?=
 =?utf-8?B?b0lKeG9NYzVPZG90TURmeHN1MXplNXBEdXQ3UDErTExRNzc3dUUyRm5KNFor?=
 =?utf-8?B?cVczdHBjb0x2MVQvSVNEQmJPVUZYYlRpZnhOaTVHZ1JqT1dmamhmcUhyNmhz?=
 =?utf-8?B?RHpidWRrZVIxWVNIRzdEUURXRDEzZTUrY0RTNkJ5R1g1dWFLbjVzalRXdTJl?=
 =?utf-8?B?eW1WMUttT2VIYmhQeUxHb3NPOUdPVHdwY3A0MzRTK2tQOTNzTnAwVFJYTmps?=
 =?utf-8?B?anVkMGtTV1lNdTNiTGhQTWlONnZMUXcwWnR2U1lWRkhGMEZ6WUdRU28yU1pU?=
 =?utf-8?B?YmIweGF5MmFzcUUwaVBpRGtxVlVBeGVCT3Bmc0tZaEFaMTd1ZEZoTTJrVFl4?=
 =?utf-8?B?SjhTaGR2b2l6d2tYZkhsbkdQQWI1VDhwbUYxR0NDQS9GbWQ0QXNhSngraU4z?=
 =?utf-8?B?QTU3UGVNY0t2cXgrQkpOcW1RRjUzaWxvNkZiSExqbkJ0cU0vR0hPUW83Y1JL?=
 =?utf-8?B?bjhiSGcyYjE5bWJwUXJsZDB1SVpTUVYwSUVQSkdwREJKaFhPY3hxMGYxLzZx?=
 =?utf-8?B?RnowRmpkc0pMbDJ1NDltb2pOcnZuY0pmMktrbnkzMlBDTjlJTFRMazlzNEx5?=
 =?utf-8?B?MXVGTFF1djczZ0xYWGtzSUtxN2NWd01OZmlidmFvWHhueGpTS211N0plTXJG?=
 =?utf-8?B?ZWkzK0ZDK0JMcXlTQlFVOWVHZlZJL2tQMFZkTGVqNUt1YWZ1eDV3SW93MjAr?=
 =?utf-8?B?MWNVUTV3WlFOc2Q5ZlhOUkNtOTdmaXJYTWZvYjVkdGdBOUpVenYvcGh3NWVE?=
 =?utf-8?B?MlhtaWErWGkzcDQ5NHhEb3NuSXBERDNnanU2STIxUDBhYnNDK1E3US9IcVhE?=
 =?utf-8?B?WmlxdlZYM1ZSTm9Ic0toRmtPQXp0eVhNMzJwazhmNWxYa1ZiQ3ZnNy94QURS?=
 =?utf-8?B?TmV3b0ZDTXdPc2JtVk53bVBLaklLczEwYm9Nb1ByZ1prcUpqR0l2Z0VZNXYw?=
 =?utf-8?B?MEZodkk0eDJndng1NU1HOVZIMVlCZGFMUDhNT2tTYjJDeCtFdkNqRmltdlds?=
 =?utf-8?B?aFRVUUxsbktBYzJrdEJHM255dEc3dnRrYzY0a1VJQmF5L3BnVWQ1RngrUDBV?=
 =?utf-8?B?czB2aWI0Rzk2ZS9QV2F0a1FPQUVjQVpMbFVpVE1xSzJjS0lZY05wZlowUFdq?=
 =?utf-8?Q?OawNEbs/LDY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm0yL0xkbGU4UFZJcXBmYmQ4VWN1UmZXTmVZb3Nib21TUDR3UXdLNFVHYkt6?=
 =?utf-8?B?U2t1NjA2bHdGZmFlZWlzdlZmVDAwR2srQStPdmhMajhFbURkWkM1UmVJb0RT?=
 =?utf-8?B?SU1Qb3o0NlV0d1FheUxEQW9uZVdYZkp2UjBvRjIwRmU5Nk1IQ1NmTUdNNjIr?=
 =?utf-8?B?SW9OYkhqWU5qUGRBSnlIMkJCWkcwemVWUVFHZ2c0Snlma1RibVc0TXZ3eGZr?=
 =?utf-8?B?TVJJc2hXYjU2RmpSb0FBY3dNRmZxaGUwUmhpcEF4Sk1CZUpKV3RYbk1DandU?=
 =?utf-8?B?L2dCK29sSStnZjdoU1k5TDd6UURsNEwxUitqazN0M0c1RUZFTUc2RkZuNGsv?=
 =?utf-8?B?Y2hHZG80UDJxTGdEYStrSUhYcHFkNGZMZWxhR0xsY1ppb09yRndEZmU1bU11?=
 =?utf-8?B?Y2VyWTNEWHNlR0REbjN1ZWhVcW1GaEtpUm1KbG5MSUV2STI0N0wwbEx0YVlv?=
 =?utf-8?B?Uk53Qm9jbTBvdUZxZHRVYWlpSndsZk4zd0hUc1U5Yk5ucHR2M2FNdGtRYkhs?=
 =?utf-8?B?ejBPUUtrK1dWUCtRUTViRUhyTWFRWEdyaWcrL1Q5NUd3UGpjM21lOGw5bTNm?=
 =?utf-8?B?cnE5eXVYd2dtTHFRN3N2SnhLajdycTJXWU53LzI5bW5JV2FUd2hKa2loVmM3?=
 =?utf-8?B?VmNDbmxUNXM3bkYxTGtkSjRmdjRzY0cwUDNNQnFpRzVxa0VXNXFWK0VHc3JC?=
 =?utf-8?B?R2ZCVWNhLzZJK0tUcU5ZUjFIYW5ETlFNYzBySWhTYTBMWjJndGdPbVhVdlBj?=
 =?utf-8?B?T1pvZFFTRjRyM0krTXl4MzRMNlVvK1VwNUJzMld2Qys1SVRyOTIwbC9wOWo1?=
 =?utf-8?B?NTBPZWRpMjZjTWlnYlZJK1d5TEgxL3NQQzlXME54S0t5QzI0Um9FMU5PdnNM?=
 =?utf-8?B?SXJoVkN1VWZYY29TNHNuZWY1MmpLZjFTZXUxYVYxVlowdmN3NjdDZXAyNGor?=
 =?utf-8?B?NWhyTm5TU3lIQnJrakdHQ2hTL1Z5elFZRVoyYU5tbytZNlJ4Y3RaME1rRlJz?=
 =?utf-8?B?THJyRlhaL25BWGQ4YUozSzZnTkxLU1lKN0VwRDlYUG9hUm1mc0VjK0tqWlFy?=
 =?utf-8?B?QWpYMi9ZVVpJMlBrVUZBOUV4Uk5xL2dYS2VqSU11cWJWemM0RTVjR2hVZFNR?=
 =?utf-8?B?VTVidGEvVzhoc3QxWG5sMDJYRDNZdGQyM0x3cDZPV3VJUUZMVVpPMlA3dWp4?=
 =?utf-8?B?TGhSQmMyYTZnVXpFTG9ldEg3R1diSW16dlhJMXBpZlZZcno1cm1WOXZjQzJh?=
 =?utf-8?B?MHl4TDl1TGdidXJ3dnpwSDNpK29rbUlCakQyczJNWGdHYlE2SHFwTUoxNlJy?=
 =?utf-8?B?VWlJanBDWGlPVk5mSEcwTksydHZXa2VPQ0FobGYzSWxEZFJFdzVVVWozQmFq?=
 =?utf-8?B?cmg3OGg0Y2Zub3hoc2cwQWttMlVSM3VOd0VLMURJVGltdjVRb1NibWdFbEhN?=
 =?utf-8?B?cFBxQTdGRzUvalRqRmxOZmt3ZDcwQ2xFRUZIbURwcjlzc3gzWWl5WFZzejJQ?=
 =?utf-8?B?ejgzNXQwRnh5YjE2YjZScWtSbEc2OUFod05XZnhwOXMxZ0JkZmFCWi85aGdo?=
 =?utf-8?B?STFycmRlblFIQkNwdTJzdlQ5WDlYekgrNGxHRUNJaE5JMUVqK3pnOTRtT09C?=
 =?utf-8?B?NGJ2L1BQaFJ4TGZFdnFGazN5dmI3ZFc4QWozQW5VNGFETFhkZmxVbTUxNm1R?=
 =?utf-8?B?RTkrMWkzN3BwMXcwbXBzcFE5ZTlvVWN4WVJWbWs4alFzL3ZqUUVrUXJGQlMy?=
 =?utf-8?B?STZINFRNVWhJRG1KNUtmRjJna3RsUXgzczZtY3pBWlRHNkZlTUg0NkhyQTNJ?=
 =?utf-8?B?Y3ZsYTVWVm9iSmtZSVBxR1J2MkNqOEhQNnFzVXpMaW5rdFRvTXNMS1grWFpm?=
 =?utf-8?B?L2t3a1dmRzFINlBuQ1Q0eEZ1L3hzUXdiUXNMUWdoMjQ2NFA2RVNIQWdpNTlS?=
 =?utf-8?B?SjFkQzZKbDlXMXFKVGhWMHZlRUtTdEkzaE5WM2k0ZWhnWFp1aXZLeHZCbU5S?=
 =?utf-8?B?Q3VzZDRYREZVa3M0RUdpTFFUai9QQmF0ajhUYVFuQUVWYncxN283dnVCMFV6?=
 =?utf-8?B?ZytRR2Jka1c4MHc2Ty9ibmtuQTRBVVFiMndmVGdZeXNPOTBYNy96eVU0dFFU?=
 =?utf-8?Q?nuRjq0pGl+p8SWTGz7dXvasxQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e29873-3596-412f-5a86-08dda9d1d687
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 16:54:47.0439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZC8APSJUqEOdhDHyVYreMLljgCfz4IUMB5E1FarKQMx/thyYt8Yl3LZyJ38Vhbp/CskLWXYJwlPPtaoG6BEcmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650



On 6/2/2025 8:23 PM, Tejun Heo wrote:
> On Mon, Jun 02, 2025 at 02:00:59PM -0400, Joel Fernandes wrote:
> ...
>> @@ -2308,6 +2311,15 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
>>  	if (enq_flags & SCX_ENQ_WAKEUP)
>>  		touch_core_sched(rq, p);
>>  
>> +	if (rq->scx.nr_running == 1) {
>> +		/* Account for idle runtime */
>> +		if (!rq->nr_running)
>> +			dl_server_update_idle_time(rq, rq->curr, &rq->ext_server);
>> +
>> +		/* Start dl_server if this is the first task being enqueued */
>> +		dl_server_start(&rq->ext_server);
>> +	}
> The following patch from Peter isn't upstream yet but SCX probably should do
> something similar. Otherwise, the start/stop overhead can become pretty
> expensive:
> 
>  https://lore.kernel.org/all/20250520094538.086709102@infradead.org/

Right. If it is Ok with you, we can do that after this patchset can be merged,
that way we can use the 'dl_server_idle' addition to 'sched_dl_entity', from
that patch as well.

thanks,

 - Joel

