Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403E83D76
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825854; cv=fail; b=VioOhVSO+kLNLHtCuUd1nGOsOcqGdCGMeJNvfPNsSOtXDrAuEMoClqLVPhKOcUXFf7VxOXB1fz/Oru+2tyR/NKBCbLj+xqSpyMFA2KK6kyfbz/x4vA935izPtot5o6R/FLsmzHTg+S12qG1tdZmTZ0nt2guvHPOSZKzotD4Unj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825854; c=relaxed/simple;
	bh=PNwTMsrJu99nRtQFxuj0NuswSPs+JIlOGo1Rp9yoFMM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hUT6IGuQ75Rpb5KQPa3VdAjD+/dJqF3LMr2ZTenqjrvq602t1aUrEbCbfwi+OOdyd+vGImOwEb7sOMhn5DpEiVJtZGyQqX7+BpniZegftUr0kPgmsUEiesyfVNEdUkKdsj7lDMuD2aDBlWAfX26r1WmGo+IxUOuNfajvlxPlIDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ALy8Dg5s; arc=fail smtp.client-ip=40.107.212.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ALy8Dg5s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HU1RICJqTW1Fqma3dPbnxIutcmmAtRJx2rP5yIJwLu2YESa5EJi129ZMun177Dvhp5joT91xAljjMdVnPAuDAnoybxT9D5mucExFrokZ1c5SZIWaXBVndiw/kQBtIwkY3nYY8qmN4RjvvEZNiVw0uN3eDwul0ObDd96ySKA6d6pWL85YZUGkhE/SivLSDWKFC8e4hzWbuMhwqOc8Mzf0QIEfeE3Y1/y+QeYxyHnIIILcVrOo3+y3ltjez6HVits7maaG+dm8sEY9cg6yqQ3t1hrBDHZ7zQeEanw7ObAaMIVznrfP5SnXPxlXFSeKaGl21nQ8/s6KhUtZPXSadxZpdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wsJv3zlkzpVUagBhavmd3y+fViCbmo3ut7rDVaNxBQ=;
 b=YZqbBQuzQ7gJ3OEh9XgyGRN26YrMX4crk7pMGiQTecR2dFpVzPktL5eFqjzbpOtKpni6w1TZQdSLo5C4F5+QsydRTxEveWr5xUZ2/PxB84zFMLM092ATXdv/vWVn0Oexe1qQrUPcUdp2WUmVDRx1Wi87Z4sLVgKsm1agLDtiWXObYHccUjQCvoUVKxdsitFG3hXnntYw1HCA3bZPNTHVVrwkE9GjS/gExdqbkE3zQXKuvbRWd8OsoLf25y1I9C4Gus3aI2aQQdAg10d5y7X7VTC3G0morMW7EG97igdd2AbJlHWYAJq7Ho1GG7qaoi69Pt5PTgh3/+/KY7YY2swpmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wsJv3zlkzpVUagBhavmd3y+fViCbmo3ut7rDVaNxBQ=;
 b=ALy8Dg5sJdgilzrRYwQeRrxpY4HnJBEJ72mVwNKD87lWkTAfjOMN4W+BsjOBcm5xZ8RVqSRnnG9xn5PxPlyfNPQv5ZVFdeDelylN7U2+UwC4xLTea1LsKbOwJW7E/3qnzy+AXxqOarSaYhhtE2oV6tj6b+kswfugRGvYrqWpQhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by DS7PR12MB6190.namprd12.prod.outlook.com (2603:10b6:8:99::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Wed, 25 Jun
 2025 04:30:50 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Wed, 25 Jun 2025
 04:30:50 +0000
Message-ID: <fc6a2cd3-1425-40de-99a3-605d3215c0cd@amd.com>
Date: Wed, 25 Jun 2025 10:00:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 00/20] Cache aware scheduling
To: Tim Chen <tim.c.chen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 "Gautham R . Shenoy" <gautham.shenoy@amd.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>,
 Abel Wu <wuyun.abel@bytedance.com>,
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
 Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
 linux-kernel@vger.kernel.org, Chen Yu <yu.c.chen@intel.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <4cde5b36-4ef3-4dc8-a540-99287d621c7f@amd.com>
 <2c72e2ada1bcc86053c01c67ba4a03cf1b4f132d.camel@linux.intel.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <2c72e2ada1bcc86053c01c67ba4a03cf1b4f132d.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0066.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:267::7) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|DS7PR12MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: a67ab74b-cd18-4bf7-33e7-08ddb3a1100a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1VNSXI3Q3BpSlhZWkRvR1JhRzJOOGlhcFQyN0E2b1VoSWhTMDBHYnJNZ2JP?=
 =?utf-8?B?S254UUlZeTQ2eVRlV1FJOXFCM2Q1YVFBS3RodDdTRXIveXF4WVpQdHNGSERE?=
 =?utf-8?B?NXdFcHdaQ1hnY2VteTg0eEkzMTZVbXh6V2p2OUJpRG56VVpJU0RRWE1zMlk3?=
 =?utf-8?B?VHZudklwajJoM1UzWStVU3c0MElwakd4eG9EbjZZc2hPWVhTcjBld2RVdWVK?=
 =?utf-8?B?UTIvRVYyK1U0OG1pN0l6V2ljZEtSMTVJaGpYNFRUampvVnpJWVhXWm1LTGh6?=
 =?utf-8?B?VlQxTmU4LytkY09XRDFOSUY0Tjk4dDZhck1GcFEwRHZKaTVqVWdhU0pzeG5C?=
 =?utf-8?B?dWp0ZnpBSzZFZnZKcUx1cWxFRzFEYmNmTmdIQ2EyZWNLZEFiV3dYeW9sUVEw?=
 =?utf-8?B?M3dWZXBNOVFUWnMrRDFOSnZWb2FGaUNTRG5Cdit6dEVheFkwQS9PV3J4U0VO?=
 =?utf-8?B?TkFhMmlBeExldUVSQlk5Q3RiVkUvNDVaT2xWYkNiRy85WWNTcklta1VLZmEv?=
 =?utf-8?B?ckFPSklaMkl0RWQ2d1JaOXJZNTJXTVRoQmNMeTIxQXUwclVaZDBtYUdMd2V0?=
 =?utf-8?B?MkhrMFBiR1ovcGQzaTFycFB3RFBIL1Uyd3FQaTNoSS8rcDNsRWl6QlNCaktY?=
 =?utf-8?B?Q1pXTkoxTzZTM1R3akpGUzJFMWNtY0RKVWIzeldJekdtYWhXWHBGTGJ2MThs?=
 =?utf-8?B?Zm5rTVNMa3JTTktWT2pIVXV0djk1SCtIYTJtY1RLRWFua3B3UnVIdDJRZVM3?=
 =?utf-8?B?OU1tcmFuS3R0OGZTd0pWQjIzdTIxSjFaWUFZaVNVS1hjaFJQcVFnZ01uZ2Jr?=
 =?utf-8?B?c2pRSk4zekUyMXpucTIzWFRwNWEwZVdjQVJxTi9qL0F0S3NjWXRTTFhMK2x3?=
 =?utf-8?B?ZkNveWxQa2trMTJiVzRlSGdRT01ncjU4eWpkTHZ6S3V2ZUF1czN0Zkc0TUdk?=
 =?utf-8?B?L0RJNklFUkwwakoxSHNjdktrTHNycmJzWEpUcGdFQlVSNHpIcmVFcXJNSmdR?=
 =?utf-8?B?M0lSNnJkRXUvRWVTbGhJcCtoR3lSa1NqZmJta0ZOUEdkQ2pHOU0xRGpWR21P?=
 =?utf-8?B?UnRDRFBBbVRQc0FGYmw4Smo1eTZodFFxaisxWUlpUEdWdlZwdFBXZzJrVU9i?=
 =?utf-8?B?NTRCN2wwMlBkbURkakIzQzE1NmRvYll1a3JpNzlDY0QzN0xxcXAxc1orRkF6?=
 =?utf-8?B?ZWZmRGlTbVJBdThPYzJlWkZxUTl2dGQ1QXk2WlNmTHB4U0l1SFZmTkpoNGov?=
 =?utf-8?B?cWdSaDl0eVZhYXRmV2VkK3kyamFUaVNJUlJQTDFpK1lMVWhkbVFyNUs0OTQ2?=
 =?utf-8?B?NWl4SjAxcmRsL0ZYRnY0Z2kwM2E4UzlERFJ4dVZLNE5IajJGQUhqbFlreDVV?=
 =?utf-8?B?L3FzekxUQm5ReVF0blNVdHRYNDE3MzViZm94ajc5TEVFbVRIaWlJTGo1TkFH?=
 =?utf-8?B?ekpJZFdMb0IrSzdvQjFTaTVGY25ZSlhkL25BLzEySGE2Z0IzMVJBcFM3dzd3?=
 =?utf-8?B?Rk1wZElKNGI1Rk54VU5oQ25ERXY0eUFxMUkzMHRLSmNIM3BqV2JwY2tVbzJG?=
 =?utf-8?B?cmJXdU96ZjBNK0RlQ1I0UlQra0lyRzFCam9iei9rRnd3dWNQZlZuNnFCOEt0?=
 =?utf-8?B?SUF5SkRpWVJFRTJCWU5PNGNDMFpPbHE3MTN3WUlMZVBOVXlDZFBYWk52WWFo?=
 =?utf-8?B?RDVMVG14UUk5cndjNTVrZWtUR2VZalVFcEFBQ1Y0MzFNdERqaS91Q0lNdDhq?=
 =?utf-8?B?bU9CV0ljN1FVTFNWSGM3ek1UUVNRbzQ3UmdLdmRRVWJsaDB3cmFGZjlWMWZl?=
 =?utf-8?B?Mmd6ZUl2aUczUzEvTGFXQUo3OEZQZnpneWtVQ3Q0YmJ3Nm83OE8rS2x1dTVP?=
 =?utf-8?B?WkpIakRWOWxjbCtucjNwclphVHdvN2J5VlN6YlU4dEU3U3JvRkZuMWx6UDJ1?=
 =?utf-8?Q?BZ8haH6TLyI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlJQN21qV0svQ2c5V3Jyc2p6RW1VUEF3Wk4zNVJuT0o1c2c2Y1ZqcnRDTmNX?=
 =?utf-8?B?b0NORlU1YXIzeUwyWDVkRHNreExqZ2IwOG1IeTNSdTI3ZXF1aTl6UzhmdTJQ?=
 =?utf-8?B?eHhCTDI4eHRHMDR6NUZsbWd0ODFRT3dMMmM3WGQ4OTU3YmJMZzhFRGpDK3Rk?=
 =?utf-8?B?RStIalk3TUZyUmZOQnhzUGg1N0NoTm5XU1ZMN3FEbnl1NWRiVWhmeTh4anZT?=
 =?utf-8?B?UmZNT3hZTEtTSHF6SCtMNE9iV2ZMbTcyUG5vN2RsQm94eERmK0Vqem9CK0Vv?=
 =?utf-8?B?bFM0TUlENUlmeVpKV0RFbzBDaUVXcXRWNHpkbjIwWCszaTN0Vkt3ZzA2WlFw?=
 =?utf-8?B?TnBxcDlpQnZ6SUxCcEdmdkFjSDcrS1BERnB1ZFdVZ2hNWlNyaUpXcnlaaCt2?=
 =?utf-8?B?WVRCOG96ci8yMWlnMUlWODAwZ2R1V2NncituZE1tNWtoaGhLTG9BR0YxQkc2?=
 =?utf-8?B?dC9jeWhkTzhGNlVoM2h3SDl3RUhVdDVKN1R4bW9xSWNmelpMOFQraXhLN2ho?=
 =?utf-8?B?N3VwWEdibVd0NzFvamFVRVFLQzJscVpjWExGODA5S3llNU02dDQxaUFTV0Vu?=
 =?utf-8?B?WDd2NWMwNnBadEVBU3kwaTREQ3J1TWJONnhIOE91R1VWTjlQVGk3U2xUazFx?=
 =?utf-8?B?UFdOa0NMVjB1b3hzcldjbklDSGJEQ2swWTJWazJpUU4wN1pucngwM0dFM1hx?=
 =?utf-8?B?VmsyVzEwSTVGUkM1QlcyeG4yZVBFckNoV1pQTXpLZmJWOEVsQmVQQ1pocUd2?=
 =?utf-8?B?bFpickhPdHZBTXlDaVVVNnNHbmZDQlhITWt3WFk3Rm02N1c0SWFxNmRZL3RD?=
 =?utf-8?B?MzAzMTVOcDBVejB0Z3pSaXpRSXd6dEpHR0UyL1Jxc052YWNCc01ldzNOYTRr?=
 =?utf-8?B?L0Z5ZXhiSnpxaCtXWS9laUpoZUs4dldpUXI2VVlLZStWVTE3aEkzSHZZQ3BV?=
 =?utf-8?B?REMvQlJ2d1VEejZiQjc0YTJjRVFzRjRwVTJ0UUE3MGswUmN4ZDdrTVR0S1I2?=
 =?utf-8?B?T3RXN1JlRjhKSWJDVUpMb3l0enI3Zk05ZzBCUzlDc1lmNHlHQ3k1eGZlQUww?=
 =?utf-8?B?djFpNkJBd1RPRHg4RmhCdVdOcS9YSnBWTGFmL0xwRHpwcU5xUStockc2Rm1Z?=
 =?utf-8?B?Q2kxTWRGdDZuOFBWRWphdWU3VUJ5aEg2a1Q3QTlKVnd1ZC9FQXUwWGZsYS91?=
 =?utf-8?B?aG1jTnowNTZMWjhrbjVIdENHalpneW5ndkZ3TlpZMEZUYW1hbjk2NFJVYVlH?=
 =?utf-8?B?VzN0TnpQRS9YVVpRTEhVZXRiNVhuMm81eHc1SjdBa1pGQzh1SitkOWJHNmNW?=
 =?utf-8?B?dU5hQkp6TkpEWkpLZjhEQXB5NzRWWlIvQkl0bzhISU96UjVTa2VzMFA1Vzc0?=
 =?utf-8?B?NGRqb3RXUEJ5SnNUQklpZ3gzb0FJYXVGcUVQMi9uU0c4WGZmQlRIOWdkQjRu?=
 =?utf-8?B?UWxJRGRRbTg1cGN5di9pQmV4dm5XTlVQYW9MWERIV1pCSmJZSTFXazJlOUtR?=
 =?utf-8?B?emNRRmI1ZlcrUkZ4RE9PTllNS3VteXMrTnBHSWswc3R1cEVtTm5jZkwrRUxt?=
 =?utf-8?B?Z3F1VGtQd21IME05Skd2WUNrRGFJb1MzYVR6QmIydjAxUWNaMmlOamZJbUIx?=
 =?utf-8?B?V0NsWU9zZXZxQkY3NUdDdmRGVXByR0lhdllNSWFOWHdwQ1NoUGQ5TGVhTURN?=
 =?utf-8?B?enFOaW1KNDBwckJyOWQwN2FRZHA5em1EdTI2Q3p6NmN5T0dkNkRtenFkQ2pC?=
 =?utf-8?B?VVNQQ3hHcGgxTGdpbFdZN29MTWxwclhhZ2RqSnJKUnNSRkxjbGxsa0I4R2th?=
 =?utf-8?B?SG0wZWxSTzkrb3FrYitZZHR3Wld0alhvSjFvakZtbUQ5cmx4WjRvOUV3YjE1?=
 =?utf-8?B?aWJIR3JuRjNmakEyMStVWWxkd3lJcDhXWDZxVFMzMkM1U1UyRE43cERuSzBV?=
 =?utf-8?B?RGF6cGFwbXJZZFp0STZxM1FnSEVrWlMweWpuZVBJcXNKQUtaZEovR0hzV0Rs?=
 =?utf-8?B?K3FYYjRLNzU5cHRMRms3NG5Ga1FTRWFQL0t5dTU1UWFvZTR3aUxPYnZuV09C?=
 =?utf-8?B?ZitCbCtCSDJIbjNORVBwSkw1QUZmN1hybzV5OHhPZk5kdGU1cjZpT3ZaajRT?=
 =?utf-8?Q?BoGA0h0LGSxCeGy5QkxMvlXbG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67ab74b-cd18-4bf7-33e7-08ddb3a1100a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:30:50.0628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Lu8dCTiAFDtdTZm21ie/tFxMLs4zQwixEiSNK/RTWs6QwBJeEufMnnlZ3StA/QMYJwJIgpGc1wKoQVd/iE43Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6190

Hello Tim,

On 6/25/2025 6:00 AM, Tim Chen wrote:
>> o Benchmark that prefer co-location and run in threaded mode see
>>     a benefit including hackbench at high utilization and schbench
>>     at low utilization.
>>
>> o schbench (both new and old but particularly the old) regresses
>>     quite a bit on the tial latency metric when #workers cross the
>>     LLC size.
> 
> Will take closer look at the cases where #workers just exceed LLC size.
> Perhaps adjusting the threshold to spread the load earlier at a
> lower LLC utilization will help.

I too will test with different number of fd pairs to see if I can
spot a trend.

> 
>>
>> o client-server benchmarks where client and servers are threads
>>     from different processes (netserver-netperf, tbench_srv-tbench,
>>     services of DeathStarBench) seem to noticeably regress due to
>>     lack of co-location between the communicating client and server.
>>
>>     Not sure if WF_SYNC can be an indicator to temporarily ignore
>>     the preferred LLC hint.
> 
> Currently we do not aggregate tasks from different processes.
> The case where client and server actually reside on the same
> system I think is the exception rather than the rule for real
> workloads where clients and servers reside on different systems.
> 
> But I do see tasks from different processes talking to each
> other via pipe/socket in real workload.  Do you know of good
> use cases for such scenario that would justify extending task
> aggregation to multi-processes?

We've seen cases with Kubernetes deployments where co-locating
processes of different services from the same pod can help with
throughput and latency. Perhaps it can happen indirectly where
co-location on WF_SYNC can actually help increase the cache
occupancy for a the other process and they both arrive at the
same preferred LLC. I'll see if I can get my hands on a setup
which is closer to these real world deployment.

>   
>>
>> o stream regresses in some runs where the occupancy metrics trip
>>     and assign a preferred LLC for all the stream threads bringing
>>     down performance in !50% of the runs.
>>
> 
> Yes, stream does not have cache benefit from co-locating threads, and
> get hurt from sharing common resource like memory controller.
> 
> 
>> Full data from my testing is as follows:
>>
>> o Machine details
>>
>> - 3rd Generation EPYC System
>> - 2 sockets each with 64C/128T
>> - NPS1 (Each socket is a NUMA node)
>> - C2 Disabled (POLL and C1(MWAIT) remained enabled)
>>
>>
>>       ==================================================================
>>       Test          : Various longer running benchmarks
>>       Units         : %diff in throughput reported
>>       Interpretation: Higher is better
>>       Statistic     : Median
>>       ==================================================================
>>       Benchmarks:                  %diff
>>       ycsb-cassandra              -0.99%
>>       ycsb-mongodb                -0.96%
>>       deathstarbench-1x           -2.09%
>>       deathstarbench-2x           -0.26%
>>       deathstarbench-3x           -3.34%
>>       deathstarbench-6x           -3.03%
>>       hammerdb+mysql 16VU         -2.15%
>>       hammerdb+mysql 64VU         -3.77%
>>
> 
> The clients and server of the benchmarks are co-located on the same
> system, right?

Yes that is correct. I'm using a 2P systems and our runner scripts
pin the workload to the first socket, and the workload driver runs
from the second socket. One side effect of this is that changes can
influence the placement of workload driver and that can lead to
some inconsistencies. I'll check if the the stats for the workload
driver is way off between the baseline and with this series.

-- 
Thanks and Regards,
Prateek

