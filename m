Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088892EA474
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621854; cv=fail; b=sw2np7sBRU9w77TLZ5WpeCr9xEa5g+dmtQeM/5WSXfUhPoawDoDfTTHqVIoCsXNIHmqfJpa5X9qN87p6mXegLLANVnL0Yj+76xZHzP3FLfBVADWCWvyxeoQmUaxd7uY0su2NZMB+NZpGALxupLPcvS+2gnxUXiKvDHv+qdQuO58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621854; c=relaxed/simple;
	bh=VX8If/N3+6AR0QtRqy3Pcot2geJ6NHKDeTz3MZJNHUg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tbdusWatDYbkti7WhALslkCvKok58/a+KppaY02r+nKM1PkE2xzDT2O4ndwViA6BNpcdiPOYbvHXkjb69p5eOnsrIsvqVqTjd2ZYSADioF5urdPbKjl70drAldSzg4yEtX6l6ASJTOJVXPchTFWCAI32f87Fg6fP6PfvFeRxQzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mx4wTJyB; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mx4wTJyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751621853; x=1783157853;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VX8If/N3+6AR0QtRqy3Pcot2geJ6NHKDeTz3MZJNHUg=;
  b=mx4wTJyBwoFe18BKKtGKSHG/BmNH8eDFhMmR+jUHLeqa1/girye+nWhW
   L3Qu5oBp6LK4kZL3geryj4x0kgK+z34eO+DG4GLEXTEjW9v2tfMqghKlP
   4OhwsgEgrPqUtpozNAPL/+Xozer5cQnyVYvhE68/VLwWI31RM45spiJcx
   nOHcudtVzyXhXx14B3omYYRaY4kgKc7Lp4lAPl52dtmmYZwRlzy0kSkOh
   5j+K3syxuFuTbYGInWM2SZmhWZlW19g4geNWuMUqvgXkzSiYUu+JCT7Qe
   yiCYTfFvh5X/DXYx0XsPz750BX2atoP6FepM1emVymZpiDwH3YQPSw2li
   A==;
X-CSE-ConnectionGUID: AsgGMPnoTXaKR9wUgsyiUg==
X-CSE-MsgGUID: QtfsWuxzThOljHkRpRBNfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54054322"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="54054322"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 02:37:32 -0700
X-CSE-ConnectionGUID: FIfV1fAaSTKmURFYeUcveA==
X-CSE-MsgGUID: lqM8+5ZSSwKvq0jF40nXVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="159157590"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 02:36:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 02:36:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 02:36:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.42)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 02:36:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVjky5gqpXdUB4onbAYFKgy6RJ87bPG+KQdorC0auHXeZerZOooIQmOTB7/FBMXfxeYAMOHekGjNylRxdjcfjD+/1hU0B2pfVZBcCMJICm4g5vwxoxVgmjJApr0gZ7jmXmrmC4CjyrKnH1c2DkDZCWNW2C51jDBxq8ZfDHiHe5ofSqeWVW9pEIdwdwYsawwHcGYfIJwXrCQnaXY4pHh1F67UaiLh2IIIta5ySA88DQXAmCzL/fAwDEmFkiI633fYyVRq1ZpteKDzBvjukpMQLad0DJW9x5hI49wXH0TgJjzvN1vxm8la+ItJ1jwqiiiYo0BDeeuLCgGmT0y1oiQsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1oRkmqy93UIMRb/zTUFR3f3Hrqdb7eFgonbsIq/nos=;
 b=QdxZU0k7xtsE7gDOaUvN+I01jdiI25wHQbYb+H5hlln9BrF93OLxxZQiWSQe+h3z0PuSHzIqkm52Zh9UruuLJoeJoYdMxvUqCnpY1PD/eweAiFjkjQjIxvowoZLn+ZkHn5JNoMR8dlLrX1DAuW09FlICi/JRtRB1mLNpW7Ky4DXZc/rYI1SAc9H0PoGLJHyv0uIzn+V9Rb29EyS6OUDYQJanxCNZaPLjHjq7FmCas/Bwg0BFJcaROAlkuFkTwZviO0cLNxLEz6f7NQ/0J6bxLz2zBI1o2KAkts+jLfcjMzE6X5NyMhQcqLKG+rMMbuoa/H8CAi31d2FrvMqUNXchUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 IA1PR11MB7176.namprd11.prod.outlook.com (2603:10b6:208:418::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Fri, 4 Jul 2025 09:36:16 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Fri, 4 Jul 2025
 09:36:16 +0000
Message-ID: <e92d0ccb-733e-4104-bc32-743771bfc2b4@intel.com>
Date: Fri, 4 Jul 2025 17:36:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 08/20] sched: Set up LLC indexing
To: Shrikanth Hegde <sshegde@linux.ibm.com>, Tim Chen
	<tim.c.chen@linux.intel.com>
CC: Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>, Abel Wu
	<wuyun.abel@bytedance.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
	<linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <71e251a086be786fb2a0480bbab69142d14bd22d.1750268218.git.tim.c.chen@linux.intel.com>
 <1f7e5b4f-a3c3-4505-ae83-bf7dea918571@linux.ibm.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <1f7e5b4f-a3c3-4505-ae83-bf7dea918571@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::22)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|IA1PR11MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: 103239fa-2f79-409a-a1de-08ddbade390d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWo0Njkva1pnSGp0YjBIT0xmQnh6eWtuckkzeldkckR4K3FWc0o2WHQwRnRx?=
 =?utf-8?B?V0Q0L0FuTFJFR3plSUxrWTU1d2tBbzY5RXUwN3dtcXhlencrbXBkT3B6R1NL?=
 =?utf-8?B?a0lnRkY5V0JTeUlUbUJpaWNZZ2ZNSVZlUWJFUThnQlltajRFWng2M0tpclNh?=
 =?utf-8?B?djYxa3dWSmtyNDVlb2pMS1o3dUh2RWNrQ1ZrN1NEVDU0WURDckw0bUJGL1VU?=
 =?utf-8?B?VFNqZC9xd29SVGRxNXNtYWZlaFNjZTFsMzZCTFAweHVhcVpIdVJuZS9aT1Z5?=
 =?utf-8?B?Sm5MR1lwOXN3c1NhZm9lbnZRWmRFWDFLOGhycU5PM1BuK1JtVEJ4THU5NlNB?=
 =?utf-8?B?UmkzbUdna2YvaDdyMlBnOGgrTUdSUjR1Mzd6dUVBeFF2aXloYkZPTm5TYnFj?=
 =?utf-8?B?ZVlJbEM3aVc0R08yRVdiWkttZHNEM0F4aFNpd1dMelN3emNDaTBHUWcyUStk?=
 =?utf-8?B?cmZkcWFEdG9QLzdYQkk3WWFGMEdxdnBxam1oSE83UXp4RU1UaWxpK0U3RnhB?=
 =?utf-8?B?Y0RmTzRUeXBWUEZIa2hZVlczVVlLdjNhTkp2dnV2TEdvSk5XSzh1d0xlTmR0?=
 =?utf-8?B?a3ZqUWxRdTNUQW80ZUlZVXVydkpNZFc0VS9sNnVRYUxadXV5VHJ1WkZxZ2pJ?=
 =?utf-8?B?NjhYYm1BVVl1a05qVFFuak9GY0NXcmVneHVhWmdKdG5YbFErUWIvYVdlUktQ?=
 =?utf-8?B?cnhNTURpaTFibEhCM3czZndFR21WanMxb1VqckNNNUNRNnQ3aHZseDBCSVVt?=
 =?utf-8?B?Ym5IeXRrRFgyWVRyNVA5dnJMcUdXNkU5QUUwVXpTSEllSVBORkJrWnRlblZn?=
 =?utf-8?B?N3JyK2lkUFB6RHZGREw4VXByYmVuZ1hoaFFZUjZsd2U4UHZrbnRFL010RHE3?=
 =?utf-8?B?ZDNZKzV5cUNPTTM3YVFkdVBHYStZeEdCTkhWZnlYcmR4Y09ONldYM3RQK2Zi?=
 =?utf-8?B?Skx1aDErdmtJVG5KMFFZSUQwL1F2d0l0NlBFS1pmalBpUDVGV0FCRDdNMFNW?=
 =?utf-8?B?R2YycDJJbG1DaHZIL3VhV0RlU3pMaTliSHJNOU9HYTdLcjNkZHAwSzlOV0k5?=
 =?utf-8?B?MkFoZ2wveTJVWXJIalhzRGxMY1lKN0hyK1pxWUtTYVQ4NXF5V1RaSlNyOVY4?=
 =?utf-8?B?MlMvNzByVGRHOXRoeXJXMUJCMVVLeE1iTnhVZXk3K3YvN1lhSHFLcmt5SmRv?=
 =?utf-8?B?S3Zac2s5ZDAxN0EyNWVMSXBVV1N3WW8wR2dIYnZra3lwOU5SMTcrUzlrWFdZ?=
 =?utf-8?B?SUtRZklNRlRETkRpWE92WlZ0cVR5NlVqUFp1bmRyaEd1eVJEVDM2Z1ZVMDg0?=
 =?utf-8?B?aXd0d2xOSXFkeDJuQUp1VUhrYk1PbU9iQTlOZlVPWWFySHZYdTZaa3ZqZkth?=
 =?utf-8?B?bU1HOUIyVU1BOEFjcUYvQnRKaWlHUk1pOHFxZEVNOCt3NE9KbG1wMWNGMjc0?=
 =?utf-8?B?czFXQmtTSlhiaTNEbGtsS0crV3l1eTMwS05DNDBhRVREbzVBZWpPMlFzRzVX?=
 =?utf-8?B?Ty92TC95WjAvMSs5dG9KMTF5WmEzaG9XNlMzWkpsZ2JiaXFnQ3dBY0ZuMFdC?=
 =?utf-8?B?S1FJa0UzSEtDUHkrOWJuU2RGeGxXNjczcitXeGYzeUo4UFhaLzZSamFlcmd4?=
 =?utf-8?B?aERPQUwrRzZRVlVacS9neXpId0d4Y3pQYzZycVBSRzdsWFZINDVPZ0g0U0pT?=
 =?utf-8?B?ZUNMUTBlZUdUL3YwZ3lHR2E1WmE1ODFQV29XMHgxYk1LS3hxMnJZRXJaSFEx?=
 =?utf-8?B?QW9jSjdrbXNzNUorYzgyVE9SZkxjTnlWYzkrSGdXT3VJejZ0NkxqMmN0azVF?=
 =?utf-8?B?bEJDWkx2bHU3cExUelhpVjVsQzdXa0Q5bVRQMjBzYXNjSEdlMGlTMkxWS1Yv?=
 =?utf-8?B?djAxcC92SmNSNk9pN04vbTl0OTRKOS9HeDYvWHlEZ0ZyM09yZm11dEFXcllX?=
 =?utf-8?Q?5poNHBM+ang=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHlyUEFncFluL0JESE1NaTlKbXBLV1FMSTdXQTZ1N2dxR1JKUnowckZWYmw0?=
 =?utf-8?B?VktXT2E4UGlZVGdjYmdaL3hEd0RxSjVpeG5tZUxqTTJkeXhXS2dibGdFYzRI?=
 =?utf-8?B?RE1DN0JBQlY5WTVDbzhhMzJzU043cHF2Sy9uampiM0pQSW9hcFMyVnFQNGpq?=
 =?utf-8?B?bUFCZy80SllWb3I2U2w3RHVqaC92c0VCWEVlSFgvVWhQcVlYZE96RGFYdity?=
 =?utf-8?B?TWloZmMyaEUwdWdVUUVqc3JzdnR0dUxYeUtUei83UWJrNVNkL3ZmS09ORDJ3?=
 =?utf-8?B?cTFMSGFkQVVJdnVrQ2hDL2xuSnJhMEd3SW81UU1nSlBtbkFqbUhjdXFTVXRV?=
 =?utf-8?B?amxDYW4wbHFmY3JkajR0cGQrSFRUS05HRVVjNmF4NmNpMDFpSTFBcDNxd2dt?=
 =?utf-8?B?cjdIajhDK0UxMXJWeUcwdnRjNnlnVE92QlZsaGkwSDBELzRnd2ErY0lWa25o?=
 =?utf-8?B?ZlNLanBNVGJORWllS0pVM1RtNEg5dlJYcmJQQkpYUGY2M3ZSb2VrOXNxeUZk?=
 =?utf-8?B?S3d2bTFTcFRDbTlGanRQM0RuTDI5Y2E5ZSt6TWFRc2puVGlzbXN3V1N0dmxN?=
 =?utf-8?B?SE1BTnRUZ216QUNoVDJWWVlqRDB1WnZXdjM4azlJTXdXYktIdlpsWmIyVklS?=
 =?utf-8?B?T0J0Rm01aTNuWklwNkpxMWZqUHd2Slh6bVNhZnpkczBTRWJTYVhQS0FqRUhH?=
 =?utf-8?B?K2RVTjA2eU9SRHN2SitTSkpKY2g2VzllOEQrTm95Q1pDVVJCSWw1aGx4cjJJ?=
 =?utf-8?B?ditFb1B6VW01OWRrcWNnUFN2eUo2QkN3d1FhUVp1RDdCbE92MkNjZ2M5ampZ?=
 =?utf-8?B?V1dOTUdHNklmV3FHbGhwYk5IdVZCcVdoMUg2RURITGJlSFdhUm5mSGRIbVg2?=
 =?utf-8?B?QnlFZUFJQzR6Y3J2aTcyZ0paRFIyb3cvcDlYWlVDMkx3bnFaRGtVOFdZMzRO?=
 =?utf-8?B?eXJQbFgvQURRbENzQ2pzT29IdXprNVZKdnRqcmdnQmcrWUtORkUrNEN5cHcr?=
 =?utf-8?B?VW14aXc1VnNyanI3c2plcTBGMUh6Vzh3c1pCM3RCTm5FaSs5cmxKM2lJWHdu?=
 =?utf-8?B?bUtEbGFnbnM4UVlBaDM3SUdtWkpxSnE2QnQvdGR0bVFBenlMNXBUZ0JWbSs5?=
 =?utf-8?B?akp6cDd5LzlGbitzV0RFc1dnL0hUSGRFdzIvY1NtWHBlc3pmekJrK2UyaHN2?=
 =?utf-8?B?bHFjSWlucE0wS3RYSTZKbU9QVkxYTVNIVFYrWHNkbmFCZFB6eUgwVVR1SlRp?=
 =?utf-8?B?R3pRL2lCYTQ2NjlxTjRPc3E1WmtXaTNnZDhUN2Yyek1zMUZFWGYvRnhQeWt3?=
 =?utf-8?B?MlBVK1g3KzZKKzBMZCtNRXl1MGNXMmJFakNUMm5Ic0lNOUxSWmU4ZHQ3NnRH?=
 =?utf-8?B?Yk52S1FZUGVaeFo0MlFnTTRuUElZT3VjUTNSd0o4NDMyaTluVUJUbm1VbGpN?=
 =?utf-8?B?bmY4MktsdlpXTGNiVzY4UEFuOTBnT1lXVnVyM3RRS1F6N2tZYm9pL20vWGhZ?=
 =?utf-8?B?SE5WUS9IVk9jZlpNTE5PSjg4RkRVcGk2d0kyL1BVRDV3Wm5abGdXTldqQXVW?=
 =?utf-8?B?RkM1dEJPZHppTllVZFZmZmF5T1YrT1hYVlNDTkVLd0VwTzduVEIvSW9MQ2JU?=
 =?utf-8?B?ZkttUTBqMEVSUm42YUYySU5YSVdFTXVvQ05OYnJvdzFUK1BjT2pFWTNIL2Rp?=
 =?utf-8?B?RXhEaEF4bEcrc0U0aklXT2wyZkJ0Y3FRM2p6WmdPbmx5OC9QQWR2QlFwZ0Vt?=
 =?utf-8?B?OXVXRWNudlAxbEExaGtZOW9iUEdZYVZVM3IyZmF1bXFiTzZDZzVnMjZqNkhu?=
 =?utf-8?B?bE1pSHMxVmgveEpvZFpQWHhQQzNwY2Z3TTFNSmM4SU5IbzI1dGN5TzcyTHNV?=
 =?utf-8?B?NndYT3NMVGNVTGxZcUtBaGx1dTBFV3RXN3hnK3o5YTV1dW9Gc2xTR21FT0Yx?=
 =?utf-8?B?TmdBcmZ3VEVhZTBaWjgxbW5YVU82WFE2RHFOZ0RIUFloMGgvMEUyNzJodkVk?=
 =?utf-8?B?L0d3Y1RXbFIwaXIrdXMyRTNIR1FDcGJZU1FXd282V0ZrSjA2d3ZGcW5mOThO?=
 =?utf-8?B?d3RxMDRLbkV5eUZOcEtuS0pKOEZJRWY1OFkwRjlZbVowZEJPWFZjTEt4SG5F?=
 =?utf-8?Q?WukO3Klwgz5G68GlXh4NDafHE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 103239fa-2f79-409a-a1de-08ddbade390d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:36:16.2935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PH4tYMuhQZnP4pkhA9FnIR+CSXJVvN4JMkhVl0ZpidRw+3cK4b1KollN34ejuE6X0E87ISe0Fl5H0Tb7JyiJhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7176
X-OriginatorOrg: intel.com

On 7/4/2025 3:44 AM, Shrikanth Hegde wrote:
> 
> 
> On 6/18/25 23:57, Tim Chen wrote:
>> Prepare for indexing arrays that track in each run queue: the number
>> of tasks preferring current LLC and each of the other LLC.
>>
>> The reason to introduce LLC index is because the per LLC-scope data
>> is needed to do cache aware load balancing. However, the native lld_id
>> is usually the first CPU of that LLC domain, which is not continuous,
>> which might waste the space if the per LLC-scope data is stored
>> in an array (in current implementation).
>>
>> In the future, this LLC index could be removed after
>> the native llc_id is used as the key to search into xarray based
>> array.
>>
>> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
>> ---
>>   include/linux/sched.h   |  3 +++
>>   kernel/sched/fair.c     | 12 ++++++++++++
>>   kernel/sched/sched.h    |  2 ++
>>   kernel/sched/topology.c | 29 +++++++++++++++++++++++++++++
>>   4 files changed, 46 insertions(+)
>>
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index d0e4cda2b3cd..7ce95a32e9ff 100644
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -810,6 +810,9 @@ struct kmap_ctrl {
>>   #endif
>>   };
>> +/* XXX need fix to not use magic number */
>> +#define MAX_LLC 64
> 
> This number needs to be much higher. maybe keeping NR_CPUS wont hurt.
> 
It will be replaced by xarray, so above restriction might not be needed
anymore.

>>   }
>> +/*
>> + * continous index.
>> + * TBD: replace by xarray with key llc_id()
>> + */
>> +static inline int llc_idx(int cpu)
>> +{
>> +    if (cpu < 0)
>> +        return -1;
>> +
>> +    return per_cpu(sd_llc_idx, cpu);
>> +}
>> +
>>   void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu 
>> *_pcpu_sched)
>>   {
>>       unsigned long epoch;
>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>> index 1c6fd45c7f62..74eb2f3615aa 100644
>> --- a/kernel/sched/sched.h
>> +++ b/kernel/sched/sched.h
>> @@ -2037,6 +2037,7 @@ static inline struct sched_domain 
>> *lowest_flag_domain(int cpu, int flag)
>>   DECLARE_PER_CPU(struct sched_domain __rcu *, sd_llc);
>>   DECLARE_PER_CPU(int, sd_llc_size);
>>   DECLARE_PER_CPU(int, sd_llc_id);
>> +DECLARE_PER_CPU(int, sd_llc_idx);
>>   DECLARE_PER_CPU(int, sd_share_id);
>>   DECLARE_PER_CPU(struct sched_domain_shared __rcu *, sd_llc_shared);
>>   DECLARE_PER_CPU(struct sched_domain __rcu *, sd_numa);
>> @@ -2045,6 +2046,7 @@ DECLARE_PER_CPU(struct sched_domain __rcu *, 
>> sd_asym_cpucapacity);
>>   extern struct static_key_false sched_asym_cpucapacity;
>>   extern struct static_key_false sched_cluster_active;
>> +extern int max_llcs;
>>   static __always_inline bool sched_asym_cpucap_active(void)
>>   {
>> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
>> index f1ebc60d967f..b7bb13045dd8 100644
>> --- a/kernel/sched/topology.c
>> +++ b/kernel/sched/topology.c
>> @@ -672,6 +672,7 @@ static void destroy_sched_domains(struct 
>> sched_domain *sd)
>>   DEFINE_PER_CPU(struct sched_domain __rcu *, sd_llc);
>>   DEFINE_PER_CPU(int, sd_llc_size);
>>   DEFINE_PER_CPU(int, sd_llc_id);
>> +DEFINE_PER_CPU(int, sd_llc_idx);
>>   DEFINE_PER_CPU(int, sd_share_id);
>>   DEFINE_PER_CPU(struct sched_domain_shared __rcu *, sd_llc_shared);
>>   DEFINE_PER_CPU(struct sched_domain __rcu *, sd_numa);
>> @@ -681,6 +682,25 @@ DEFINE_PER_CPU(struct sched_domain __rcu *, 
>> sd_asym_cpucapacity);
>>   DEFINE_STATIC_KEY_FALSE(sched_asym_cpucapacity);
>>   DEFINE_STATIC_KEY_FALSE(sched_cluster_active);
>> +int max_llcs = -1;
>> +
>> +static void update_llc_idx(int cpu)
>> +{
>> +#ifdef CONFIG_SCHED_CACHE
>> +    int idx = -1, llc_id = -1;
>> +
>> +    llc_id = per_cpu(sd_llc_id, cpu);
>> +    idx = per_cpu(sd_llc_idx, llc_id);
>> +
>> +    if (idx < 0) {
>> +        idx = max_llcs++;
>> +        BUG_ON(idx > MAX_LLC); 
> 
> maybe a warning instead here?
> 

Ditto.


thanks,
Chenyu
