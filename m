Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED73E25B682
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747332717; cv=fail; b=V2lTj/4GqIbs+7T4QMGj0RGUXAhxsgCoOmX4U9dmOquaDgPJDMzoyFKEpx4IMINX8Jof0pUuy7IGMxTKRlIJetXIo4hTg9s4Lf0Tut/SMxacT9/1PwyllsfuESWMDKoEht/7KMIPMKuWiU0GtgJO8S4+H2wmySKXu5RZKB+j9DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747332717; c=relaxed/simple;
	bh=pQjJ7ECCchBHN3uEmYdzakh9ZOfn75ZFvcwS2ZpA+ek=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=poQw9M90JBmsQ0+0+znlsdcY+jFCB/rc+hul3mUiUHOS10D6Ip1FAOZBCSNB6fd7WacDAraY534jM3ki+dCHVtROb1WLsQIKRIpzomVwL+cyCSqPLTfK2akBIDS0h8+Lt7K8/75FFkTiVFjFkcbb5UgLXHo5MLuP/1pOuR+B+6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FwU85Czk; arc=fail smtp.client-ip=40.107.237.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FwU85Czk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LentYmpAJQ96BfArQTGIztygoAH5t/kNZRrK2RMpLxk+Os74HisB2fUgxHmY4ArumLscYoT8QrrnXHFOTDk+ab9C0DDzfRVG/0R5DvX9xCeNAbQDL0tQGCrHiEZPfVJ90LSjI/dOhCCAWGnYlkOb3G11YgcqU+xt5P1G7XbV3Efa7MkXzoCiCg6uON83yxRQiCZWIKJWuvyghhYRfpT6DXfRrTbDgFmxhFIDoJtQYz3QlKCjsefTONejw0IH5HpZeBX4cbSIoi3YXjVsbj6KVulmnBAFNFQxc105wpzeTtgJuMIrs77enG+E2uXKhEztTlmZPXsS47WunLtSJpwjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQjJ7ECCchBHN3uEmYdzakh9ZOfn75ZFvcwS2ZpA+ek=;
 b=FJy11mMTDZuNQLVhP4IHXkpX5dHdhbDyCPAAPwBTcmZI7a6+Rlmiw6KaNFgMY+Z6Q0NwwWCdfMX4pht5aWotBtU6RG6khDZkj2EIM3Hkdbri4jeFGOqOp0MQ9LeQmwGrZo5EWfpvuWYy9Tr2ro4LH8tSQWaIW1Y+/eCRZ4TgvSxowPqAmhtvCrD867Mo9M7hn9tNAHiiyXZ4a32nd9F3kfq3e4IhvB9hbBPC6gLHXpNwOABecFs+80lAbsLYSKRbFacL7fzeOBf7waVxreUiGHP5K34tKbQILQVjeW0p3U4YyHxAx1ogdVUbzRU3NHrWr8s2qsiC0Zs7QuV+q/dJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQjJ7ECCchBHN3uEmYdzakh9ZOfn75ZFvcwS2ZpA+ek=;
 b=FwU85CzkQyOPRbPc5368KaC5gy+CiVMVWPVy2CZulztu5p3qF2Lb057OCjWHwuIcYg/2n24pL3LXw8dbYMN4moWBtjMMMwaU0MC2fvjsiJ4hyjT/5qdnWHnp1R0HcY2QxuCRjnPqlrXUYgGHfbq01vjK1QEIbrXrvAKUC5HryyU85lIu+pfw7XJQ0bQ9OBzYfrI//dnMPAiOCsAy1RKwjQi4laArQrdjvRLFg0r2o78XBfnoYyD7rPr/Scn3DimMiQccYLJMU2Tb8xXgD+QMqXKxhLsCSNBchTFiXwL3ERZtSYncV9U37fBbXcYrlEZlzm7wMAK69OqGc5Ex5xQCjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 PH7PR12MB6467.namprd12.prod.outlook.com (2603:10b6:510:1f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 18:11:52 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 18:11:52 +0000
Message-ID: <8fe36fea-d2ba-4e18-bd60-39c57ca74319@nvidia.com>
Date: Thu, 15 May 2025 11:11:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/25] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
To: Borislav Petkov <bp@alien8.de>
Cc: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 H Peter Anvin <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250515165855.31452-1-james.morse@arm.com>
 <20250515175054.GKaCYpfoCe0b7QyIqL@fat_crate.local>
 <f42b0165-092a-4e58-abb4-a8d59bba5cab@nvidia.com>
 <20250515180623.GMaCYtH84bauHWs44X@fat_crate.local>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250515180623.GMaCYtH84bauHWs44X@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0056.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::33) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|PH7PR12MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf6a2e3-1eea-47cb-7082-08dd93dbf7a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWl5dlRxbUJPTlBZditzdXpvdVRsMEQ5ZTNpNmlnTFA4alh4b3FidFdlbEE1?=
 =?utf-8?B?YnZKOW42eTY3cGFyZDMwenBxTmptcTVLR1dhazlxWGhNc0Rsa1dxT00ySkxF?=
 =?utf-8?B?YVdBdWtOMWh5bUJuR1E2N1p5K2JXV3ErdjRRQ3JSU0t6eHVCakxDS3paNm15?=
 =?utf-8?B?dEpWNHhka1hTR2pxVTBGKzVhSjZMWVRPSTQzYVFjNW1lZGtDeUhQcFRhZGgy?=
 =?utf-8?B?Wkk1Y0Vsc0grbS9pMGtaNmVBdWFQNDVZMEU3K092bDU2TUhHNGpzRWtTQ3Vu?=
 =?utf-8?B?aFkxWWl5V0lVUFRDdVN1U01sRzBGWmIvMFFpclA0MTJSRzFXeExTN21tcnEw?=
 =?utf-8?B?ZS8zekwxRkJCL0ZTaGdISm9LTUZzdC8xSER4S2FjR0VNUXpnRDNEeEVUTlp6?=
 =?utf-8?B?U08xc010RmF0TjF4RmZmOTNTSFg5LzZ1K0REK0thOW44U2xGYVJySlpRT0Zp?=
 =?utf-8?B?WjlkelMra3M2S0I5UW8zTFdOWFJ6Q01TbkxVQzJMZXhJT0xnTWsrblh5THMz?=
 =?utf-8?B?bDdrMUdWMmRlQ28vdWRJak9DTE1JdzI5SWpKemxzdlpyZFVteGZ1alBrQnhz?=
 =?utf-8?B?SnFIN1JLaDVXM09FRkx6N0k4c1RERjBldk9qZUhqd21PM1dDUXI2cVFmclAz?=
 =?utf-8?B?UnRWcXVRTDgrcFowZXFHZTRuMVY1MlVwSjMyZ2NtK0t3VW5xUS9OaHBmczJi?=
 =?utf-8?B?dGFxVkt4YkFjOUwvOTk2UUZ0bGMzR3lma3BsemJVYktKd0wvRCtQekgvdytU?=
 =?utf-8?B?bkFhREtuemFWQzNsdUVISSswR2NOVzYxNXcyOEdvcC9UZ0pNYWFqanJ4VWRM?=
 =?utf-8?B?TFJoQ0tHbWt0L3FhZjBNemJYNWdjWGRpRGNrWWNibnV2ZGhwOHlsNGZTcHkr?=
 =?utf-8?B?NlE3QmR2NlptQXE4bW42TUFmWTJZY3BxcWlqSURrTS95ZEhVbWptRnExbEEy?=
 =?utf-8?B?bCtHaTRwZ3BvdGEwUzk2OWh4Nyt4OWpuY0h3VDQ5b3NMOWJONUFweXJoZXZr?=
 =?utf-8?B?QjJ3dWRVMFZTaEVTbkFFUHhFbUg3VHorWDJZaW41bVFzK1NMZ3ZTK0QvMWtR?=
 =?utf-8?B?dmpvYkVJUTFFYllYMHZBeHl6N1UwNlJoNjhXeUw1SEd2R1pFN3BSMXVGZ0Nn?=
 =?utf-8?B?SHc2Z0tzMkZpbmxpcUdZVTMxTVdWZmVhNFNieTJ1RTV4OWhwMFBhbnhTb1VN?=
 =?utf-8?B?NHkzbDlFaVJQa3hybk42M2REeWFHaTBNK0w1R0doK25jR2o1blZWQkJsZ3VN?=
 =?utf-8?B?SVBYY0d4U3BsT2k5TlNwMzRacGlhMGw4dGxjTUZxS1hzOUhrQ2YxNStwb0Zh?=
 =?utf-8?B?a2IxZXVJNkp1blVrRTVTRlJDdGpFeFJFdWNGd3BJNnlSMjFNMXVxaUxxSDBD?=
 =?utf-8?B?OWVsSmNTMGl0TjFCaU42Q2YvYzJXMWIrdFl4N1cvUGk1bERNOFNtVS9wbjhL?=
 =?utf-8?B?QlFyb0gvQXRmKy9pY09ua3NzbEtmR083ZnVSSEJ6cDV0N3ZOeUNUSDhVdy96?=
 =?utf-8?B?TkV5dnYza3ZOZWxGY3R5b1ExZzNRN2Y4aHJmUzhOb1BXYXN3YnRXS2ZlRElE?=
 =?utf-8?B?SVhqelJISVFRb21nc1RRbXBSdEVpT1pRTUdEY2w3cElYZXF1bVVGM2ZmaExr?=
 =?utf-8?B?U2lXSGJZSmZNMWV0MHhWQ2xnQThXTmJKMWhQcnQ4aDZ5ZzVFVnlWRlNVK1N6?=
 =?utf-8?B?SlJOZVlTK2VmNlozQkhmaWhlNkNISWMzQlFjU3U3eVBsMElKcVJqeHRDb29M?=
 =?utf-8?B?L1UrcWhXU0tJZi82elRJU09uZHBwcVhQMlhaRzdZb2hJUUdoRUVDWDRBVEhB?=
 =?utf-8?B?eXQ1NGYzbFdDb2JPTmhNeU55cXd1TUM5Ny9zMlFyQUxXeVpoYmlVRjg5bzg4?=
 =?utf-8?B?N3BjanE2aVlpNzJMZUNCVGJlWHlLMU82WFVZOTl4T0xiZTcxMkRnWVZSUVpS?=
 =?utf-8?Q?29cX+304IZI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHEzbXhieFdRVjBtRmpCUU41akVUMEN4S2N0RHBuQ0hOQXZjZTZtMXoyMVd6?=
 =?utf-8?B?WGZiZzNHQ0c2NDhxTng0NkgyZzd3bUlVTklvVm9qNkI3YU5WMEFiRlU5Z1Bt?=
 =?utf-8?B?TkZ3dDN1Mk5nbEJNTTdIK0NqaVBweEQ4dnNwVlpYWDNDQjZ2WldTckcvKzZy?=
 =?utf-8?B?SHdnQjJReTBvek8rYUpsVkt5WUpONVJLSzl6NWJubWlxZ0JjcWpCQVM4Y2s3?=
 =?utf-8?B?R3RocDRqVnFPZUJwVFFDSDZ2Ti9qcEVoNkpJNEl6K1l1bnRESDN6MXBJbDhS?=
 =?utf-8?B?K3NneWtydFNaeUovNVhkWGplbHNLK3hnQkY4UzJ2K3VjekFockZ6VytMcS85?=
 =?utf-8?B?TFR0eUE0OWtLTHBqZEFaNTZ3NXFnYTV4dnVvSVAxSUhROGN1ZkNHQndndEsw?=
 =?utf-8?B?SWd0cmYzSFFkN2MrMzRCbkFHME00WTB2RUd6MzlCQW5ETzk3amY4Y1hYaEZW?=
 =?utf-8?B?OEF4bXdUU3NYd25DZ1NmTHphNnliUWd5RjdvRDA5cEdUMFE1NlJ4d1V6clpj?=
 =?utf-8?B?TXFpdllzYmZmQ0E3NlJ2R3Nadk5VamFPK1pia0NaOWZJV1AxOVlCd0VpWWlp?=
 =?utf-8?B?Kzhrd1RYWEk2cmR5dGVJY2FYMkVaTEVHRTJIMFJHTVhVazkzMEV3MWVMdCtp?=
 =?utf-8?B?QlJudFo3dHZUYW83QnZhWUlnS2JzSDNDVUlyWlp4UkZYWFlWd2I0NXk3b0FM?=
 =?utf-8?B?R2NUVnZ3bFJETzJtYUJBQmZYczIyU3RyeWpqVi9JelJ1RUhKQTk5dUh5KzhE?=
 =?utf-8?B?ZE1DRHc3dG1EaGhoSFJIMnI3N1FBZVZxbk0yUUtXSGZiSzY0MFNDbWFQZU1O?=
 =?utf-8?B?bkZyeXFTU1A3bTF3UXNGSXhuZDgvbkc3UGdsSUlsWWhlSE1CTWFpQzZycFpz?=
 =?utf-8?B?eFhjUkhybXNhWU96YllLVVVPU2dVLy92NDg3TkoyMHBwY0ZtWDhGR1Fibkhr?=
 =?utf-8?B?dURlR2YxcXhmbU91cThkNzBWUTlrVG43WUFvNVRtaStMV3N2N2cwUjBXTUZn?=
 =?utf-8?B?Yy83L25wZ1IxL0Qyc3MvZDJ5dkswV0ppZTVEQmFydnlyLzQyRmNKYzRRdW1S?=
 =?utf-8?B?QWpLNkdnZ3J2ZFhybWk4a0RHYis5bnVMRTR2ZW1xVk1wT05Ra3JJN2Jod0o3?=
 =?utf-8?B?Zm8yaWc1eUVMaDYzVUlxR3Z3ZXZyUVJza2c3WmNEVU5rMlZDSWJ4bFQrMncw?=
 =?utf-8?B?cGpZNWszR2djTURuTnA0d3FpMWhlUVd6djlTNVRqNzUxbWlBWmFrWXZzVzlZ?=
 =?utf-8?B?ZkRrbTdXc2R4TFhEeXRxK0xQRzdWZU83NksvY3ZCb1dMajJaTlVZcWN5c21W?=
 =?utf-8?B?Szc0TnBWdkF6c1RTektEdjNGdlpqNDBJV2xnTGJtUmZKaUkyM1N3bTA2cGx6?=
 =?utf-8?B?a1BRRzhMK2orR25yM1h3Z0ZoZW9lbXlwYWxYT0dZeUdlVHRId25zSlNtRTNy?=
 =?utf-8?B?YnMxeEkzbXVzYWFBRURxR29UNkZ6WDl3ZldjeXNiQ2lDdXhzK0VSY2JpMHNJ?=
 =?utf-8?B?cEh5YmNPU3NEZHp0VXJWbk55ajJRbjUvb2ZZMG9YZ0x0WFRFd01YWUFLMS82?=
 =?utf-8?B?VHpzQVdZaEI0djVrLzRlekJqNEpUdVVqR0JmVTZEcjhvRzdxQzNnWUdmQUxM?=
 =?utf-8?B?S3NkMTE2OXVnVUdXVFBNc2RTNFYzbm15TDg4RHI1dy9nUytxNzJSZmwvUjY0?=
 =?utf-8?B?UnNpdnp1QTRRUDVvYS9uZVN1VlVVSnJ0N01OR2VIbGRIRWhCYjVLY3l3N1No?=
 =?utf-8?B?WStXdkpYU0FJeU1EbmNYMHVaeEg1WnFOL0doUTV1ZmhKRFhTSjlRdVdvQldW?=
 =?utf-8?B?OHZnTTdpeUF5cVhNQnE0UG95R0N6RGtoanBNcUVhc25CTGN3VUNLb3VRTThs?=
 =?utf-8?B?WkgyWlhiZXgrY3dGSitqSFhFZVhvOEQ4eFhTVDZrZitYUEgzbk5YUkEyMktw?=
 =?utf-8?B?bDBCS0xsWWpUMExQNGgzTjJkNnhUUkdSVGVVZUozNDFUZkNjL0VIWCtXL0Rj?=
 =?utf-8?B?TU1oaHFIaGx1ZDZma0R4bkdUNkJINEQwejFid0Y1TDBXS3dJQ2d5eEFXYzVp?=
 =?utf-8?B?L2RUWUdoalZ1TmRya01EclpHMi91NTFCdnNXTHNZV0VZSTBmZnhibFNibUgz?=
 =?utf-8?Q?Ttse6xdzMv0MO08ZWg1ynxwEO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf6a2e3-1eea-47cb-7082-08dd93dbf7a0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 18:11:52.0033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t30xMYG+ApuYAZTl5vHZhBKkpid11QiD5lu1UbVUMO0RSFA89BfitXgcVU0H3yMTEB/DHWTQpCpv9+VhOH//aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6467

Hi, Boris,

On 5/15/25 11:06, Borislav Petkov wrote:
> On Thu, May 15, 2025 at 11:00:04AM -0700, Fenghua Yu wrote:
>> On 5/15/25 10:50, Borislav Petkov wrote:
>>> On Thu, May 15, 2025 at 04:58:30PM +0000, James Morse wrote:
>>>> Hello!
>>>>
>>>> No code changes since v11 - this is the 'final' form of the series
>>>> with patches v11:24-29 squashed together. See [v11] for the breakdown.
>>> Thx, lemme see if I can queue them...
>>>
>> I build and test this series. Everything looks good to me.
> Is that you giving a
>
> Tested-by: you
>
> tag?

Yes.

Tested-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

