Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639441C32
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744934944; cv=fail; b=PhVKkKY3WCPm0S4aa2eUyWkOmHdaJbC21fkbvuTOEXQaqrvkZ8gnqeL5DEKpBDD02mBS6MdQCO2mclydXnutswTIciaI6ukwdbGyLbydDaWrjTYCELeWmJ6rT4m3VUS7NzSp7nTn8pwAYI+X6zG0MLewwKJtcYGfW1Zovu+aY1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744934944; c=relaxed/simple;
	bh=m0ZuGBy+kGb56H588qt8HyvHviyRZNl7FEF+J1l817I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HQdZ4rLx7NVjj80LrJJSkxw1Umd370CNeopxW2EgKQcQtoizmGdLe6Hca6AW434Q8STe5acLcgOI4ZpNgiNDh2hnXtjs+j/kYX8Q6d/gAlYmSzNpvMPe41CVbV3GCYHNr1qFjH48SFHEFtBo9UADy9RZE9/TNIG+LK5jfhy7pas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LYe1HK3T; arc=fail smtp.client-ip=40.107.93.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LYe1HK3T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuLarq7NQosgEKHUxZ2gRbT/BGbl9znMCSdQtoD+32rcqF8hrAVBLS5FWqjjYkJmfPe+ozGGALygnv7Ns4V0Sa44j/7TgFO1+zWdGvVfcG9jNNLJ11d0wZyuNdty87mSxnSuV+ggdw0ThzEsHXVuS7YIAnwtYOtR1jKOVYg+bI9hM1IZvrbZR72vD1n8Q8g4+sx5ws3XhmA+m/jYioe8j2orwQlDTF9kEdMD2Ul2oPhC69iLZuABpOB9TcpCuD5BoK6HFs8/2R9rHAP8mh8gDUkAdRuR54PFqWNs8Q7OyHgeAyqvaC8mL58fJB1IgFAefEJ+zS9AtGlwn7Gm2wwYDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GePijTlAFsACsW1VDuL48agVas6sn5c0JVhp2HXSx3o=;
 b=DGQffjEka8aitIUi78ItPMEJm9gHeAM58/ZHEYSiZMSlmGZgp7yxf++DHdMCXgGcOCJBJFryd+rmpdMy2OJaw1voVd0sc0iMuZJajNiNKhfp6n5NrIorU8XlmNmLrWD5s29TQ93OWVqi6mOSKqw7WekYNy//c8LRZ0z6uUrHjzmSDOKCSXo1G2cat7EvuPEZ9E3TJbKaI+pnn4Lw6NcDsQ7McN2JDxSHiOYNI4awxngtT6PZ+LHs9DTomApr2YwyVOr/Ge6h1s0jKVK0i2V7F6lnyyrDTOggYoJVvHmbsiRA/KNk7GFIDtz8PmPC4QL/58fmvNzAeplqFAZQ1x3oXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GePijTlAFsACsW1VDuL48agVas6sn5c0JVhp2HXSx3o=;
 b=LYe1HK3TvsyTNwvzbYNrq7BdB7gWHrsddUuHWZfMlmM5wEZ3xeH3j56/aQl53KFBylwjvzDzL6lav3FWMi7IQZiiN4b57t+HcafQd07hwQMooewkS5ZvE2H5fuZsJBrLlrwqIY7nZ4lWoTwhVrOxjWorP4zNlbPFfhHp8kpZhAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH3PR12MB7498.namprd12.prod.outlook.com (2603:10b6:610:143::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 00:08:59 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 00:08:59 +0000
Message-ID: <d968a33f-c61c-45fe-b4f8-58b2eb134477@amd.com>
Date: Thu, 17 Apr 2025 19:08:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/21] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
To: Reinette Chatre <reinette.chatre@intel.com>,
 "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 'James Morse' <james.morse@arm.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Babu Moger <Babu.Moger@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 Jamie Iles <quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "amitsinght@marvell.com" <amitsinght@marvell.com>,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <TYCPR01MB88043F4EBA7A338ADBDC23D48BBC2@TYCPR01MB8804.jpnprd01.prod.outlook.com>
 <4cfd5753-976f-49ac-82fc-e925c8d31be2@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <4cfd5753-976f-49ac-82fc-e925c8d31be2@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR16CA0020.namprd16.prod.outlook.com
 (2603:10b6:610:50::30) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH3PR12MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: 72fdc971-a21a-432d-8968-08dd7e0d37df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmVuZXZVRmhZWWtIS2YwdzdLeDhSRWowSHAyRUR1MHhMdnlTTkt4YTUvRXcy?=
 =?utf-8?B?Vi9UVVdKSEhxbHhrc0tyb1dqSStjV2laM2RXY1FQTkhMS1J2elFQcE1KdW1q?=
 =?utf-8?B?a0NsVzVna1c2c3lTaERvdEV1cDhsRTg5RnZYNjU2WHV2bEkwcDhBbW9XaStT?=
 =?utf-8?B?cFpPUEh5c1E0dHZTR3E4ODA1aW5xVkJnV2xER1V1eWFtL2ZUYXYva3hhTHNT?=
 =?utf-8?B?clVXU3d5TFRFSlZTUU92SXdrVUlWVWJlZ0JQbm9Vb21ISTMrWjJsWlJtWVRi?=
 =?utf-8?B?RHJCZ2pacmRBTTg3ZXhscXlBWmJCRlZadG9SOFFFaEszRjY2aGFXeGxQbTcw?=
 =?utf-8?B?ZTVnNTBUV1l5ck9EeGxLZE5YVGVqZnFocUd3cS9Bc2tsY1dRandxUjFBbHNr?=
 =?utf-8?B?UUlweXhJdFdoNEsrOEV2WERxU3pobVVnSXpuYS8rd1B1enpGK21jWHRhaHJu?=
 =?utf-8?B?MEtuektXL29vb3lnNUYvbmV1a0VjdEFWVXMyaFI4STZiRWdrditJWXRJVzdZ?=
 =?utf-8?B?cGFvZjJGYWEvdEVxVlovWWt4cmxwV0JOMm1pdElXNDIyUEhZMjdsWGgyMUg0?=
 =?utf-8?B?QisvY3RkTkRTbVE5S2tHYjI3UTJ4TXpCK2FVSlhoM2RLREVCbEF1KzBHOVNX?=
 =?utf-8?B?YlpMTjRwVDZSWW01clhVMS9MVGZUTFJhdGJjeHgvZHNQcW5jVU5lcGVsbCtJ?=
 =?utf-8?B?ZEVpN0FpeEtvNUZ6UkNzMUVDY2RMeHQvdzJpLzY3WUNiUkRMSTRuZmZxa09s?=
 =?utf-8?B?WUF4bm5adlREdUZoRVBxa1Fqb0EwQklNdGpLNUZPTkJpU25MWXRsZlNFNWJw?=
 =?utf-8?B?SVBqS2wzK0g0Z2VGVkw5Qlc5bXlJL1pNUWxYVTIwQitWSTA5OWpWT2FJc3Nw?=
 =?utf-8?B?YzAzbmV6R2UwTC93Rk12c3ZTMVB0eTVYb1lQdmM3YWIvVG4rTTdrOWMyL3Rs?=
 =?utf-8?B?SFN4d0lZUWZCdWE3YllqaFVZOGtQeDFIQmJaRHdEOFRISjR6ME1LR2Jobk56?=
 =?utf-8?B?YVNFaUN3TG1ZQWpvK0Y5R1hZenNxdm81U0g3ZzNJVTFZaHRHcVVhOUxWQkVn?=
 =?utf-8?B?UXRKR0ZLWVFhbjVDOWNCWTVGbnBmMXB1NlBwUy9raDZtSE45bmhSMjNlTVRi?=
 =?utf-8?B?RHQxa1dWR3c5ZHEvaVgweGhsRis0cHNLNW05eUZxVU5UNEVEaDZyeU8zSzhS?=
 =?utf-8?B?elRyRDhVaE51NUJKTm5lOUlWN3djTDVCL1BUS2llNzIrUnR0Yk1Kc05tQTdO?=
 =?utf-8?B?S1cybnVrMGJPVWg2ZmIvc1JjVCtDUDU1YmM2VmxGZVVLUWQ4VE5Vbm9yUTBZ?=
 =?utf-8?B?NTJzd29ibTlNTFgzQlMzbE1XakNFOWszSHRpeWlBeFU1bllKWWJ4SkJhbE56?=
 =?utf-8?B?YWFaNXRVQzNHQkpsYWFZWnVZazN5NHR5S1lnZys3N0phakR5S2lvREdPRE0w?=
 =?utf-8?B?ZkNaRHpYNjg3WjhjTVQrMTZMdjErbjFVd0Q3MFhVblRqNW44Z0tlZ1UyS1ZO?=
 =?utf-8?B?NGFmclhseFBXbnBzd0tMOFI0VSt6NmcyK1pYL0FKaDRNY1BrWlhVT29uKzdQ?=
 =?utf-8?B?VWE0b2h6Z3FzcytmUXo2MDc5RVYzTkJWRDZ3dkVSUmxRbk81b2wzdVhYeHRs?=
 =?utf-8?B?amF5T0piVHN2S1plOXRubGczVlpkNjkyU2NvZVRUUGw5SEdGTkdUK1RmWFA4?=
 =?utf-8?B?TWJ5Vkc2RFl5Y3hlTTI0M25NTCtjczFUQzJWSHNQdUhTVnpvVFBIVW52ajA0?=
 =?utf-8?B?djdkaXpia3JTbVl5ZkFlQTV4UnlpdnFGamNiM2ZyMjQ4M3FNMlRkOW1kOWVC?=
 =?utf-8?B?ZEFEbGVZODdsYU5BdG9ieVhZRmZaY241anVGQUcyTDk4enJjMEdBQ3VWdTUv?=
 =?utf-8?Q?Bv2Cl9m2eiWdD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkhrVk1ucjFrY3RpQU9LRERLTnVGV1pQWi9BTkh1UVgxc1M4NUZmZjdMZ0RY?=
 =?utf-8?B?b2NtelppY1V3VGU2VXlZN2ZsK0JCZm9nVnVTNVhuSVZXV3BGcGlTQ2hVYUVi?=
 =?utf-8?B?aTlTZDMrS1c5R1dRMjVib09EZHR1VzdMVDQyMDc5RHIrUU1tNzZicUk0QXBm?=
 =?utf-8?B?Q2tROXZoNnJjdTdkOFZ4S2p4VVI3RjJwbE1tZUovQVJDVFYzcVJieWZSRGY5?=
 =?utf-8?B?SWpTVlFlZkpCQU5pWVJhSjNORmo0UWZwejVocythUFJXczRKelVkOTIybmRZ?=
 =?utf-8?B?MFJpdXF4c2xUUy9kejltcUdPSnlnOHB0WW1ONkRXUUZVbGhqYk5GMGd0c0wy?=
 =?utf-8?B?S2t1cysvTUJHS1F2MGdpNFVVT242M2sxT3BoNVlaWVpTVnlMSGZ1SlBUaWx0?=
 =?utf-8?B?SlJkZTAwU1hQS0NhSlF0QjZxRTJ5WE5rU0Y4M1dsOFRlcGlpbEhNTWtNanRY?=
 =?utf-8?B?bThrZ0N2KzVzNnh6OG14a1FDenpRVGJsUkVSMFYxb3RSQzRZSVBSbVQ3NzUr?=
 =?utf-8?B?MjBmV0UrRmJpdU0xc2ZqZjBndnhlVTlna1R0R1U2WDZLZzhCaEdkSW9VWWxj?=
 =?utf-8?B?RC9GNGYyKzhCU1JNeFl1QWtvclFrR2lhaGNsMGRIUlNOR2h6eFpGbHRaWkww?=
 =?utf-8?B?UmpnL0x2WDFvTUhUSDRiVVR2YWptTHEvUVh4MjVXdEpCckpzdElRcDJqRkZP?=
 =?utf-8?B?OWFIU2ZOL3ZqSXZUbUxlY3RVVkNnbHp1NFc4Uk9JZTFuU3ByaGM1YldoaVlS?=
 =?utf-8?B?WHpDOW1xWGVVKzhFckNROElaOVZra2ZmNFlKd0lMbmZmcHozTVZ2OXk0NGQx?=
 =?utf-8?B?cnR3WjQzVW9uTGp4dVh5dXhGQmM4RnRXMHZlSDlnT0V3bGExdGJoZ085Qksw?=
 =?utf-8?B?ZGU2bW12WUpGU09tMXAvNVlUUnBRc1V0U3g5T1lrMmYrR094V1FpbVNVcnBW?=
 =?utf-8?B?VWxlaGpzY0svUk55Nm1IWkZUOWdnWmpDOEs5dUp1RGRPR1hWNyswTzAvYzcv?=
 =?utf-8?B?ZGxDVFkwNTFQYXBZSHUxMFdxNlJINENkSWlZTUpDUWRWUERzSlZVRXpJZDNZ?=
 =?utf-8?B?WHdETGpBV2FTeEM1TkhHN0pObnNOZGFRaEhPSktncmVOdGp1WnFGNnJGNVI4?=
 =?utf-8?B?MkpVUFBLcVBvV1NCSy9xenJFaFNBbnJGUFJaN2ZqQktFRHFLeHFOYXpLK2ta?=
 =?utf-8?B?eTBiVW5ReU5CbHlpVHFHYmpZVldITG1TbWFGL0xJUFRVWGh0OWM2eWNaS3I4?=
 =?utf-8?B?MmVuV0cxeTcrWmRabERMVkNBVTdzbmFBczcwS0E1K1VtSXEwWFlFRFNYaFFh?=
 =?utf-8?B?U1RRL3RldzQwaW9DY0VOWkZkcTBUQ3hLTGV0UDA0OUV5UXIvSzV1Z0ZpSUZm?=
 =?utf-8?B?elVvRUJPczBOZGRpNzBHQTZTOU9PV05ibWRjNTlxTWlxUFRzKzJaS3RkRXAz?=
 =?utf-8?B?bWkwbm5INElYWmx6TE0zZmlSbXkydU5acnkzY0M0bUYvMlpCaGxkK1JZOG9a?=
 =?utf-8?B?cUpVaDI4clMyOVI0UG1WY3ZmQXhMTnoraG9ESStoang2dzltbGlqOFpaQk9Z?=
 =?utf-8?B?QzBaTFY3VWpmalRhNkxSTjhYU3lYd2NuRHd6ZlNzSDF3bDZMVWdJTEdTTGVZ?=
 =?utf-8?B?d2IzblNEYkovdWEyWWJyb1dZWHVVNHBFOHo2clp6ZUxSL1YrdWdidTkwcHpw?=
 =?utf-8?B?SStLRVViTkRXUmt4QVlUZE5aVXViU0ZMc2hRdmR4U2xSMGk3UEJEU2RiT1Vk?=
 =?utf-8?B?Rjh0emkwQU1UcThKSCtwVityKzdRSHJLelZWOFpmWkxvblY0L0UyM01rMnIx?=
 =?utf-8?B?SEZiTTVpMUlLSHRrd0g2R3hTUFNMcENnd0NRamVnU0FHcjB4cWJxZFFLajll?=
 =?utf-8?B?c2plS0FJR1pRZFlkblFZbis4QmJpREFraHZENjFDYjhJUnJPZndxMjNZY2Qr?=
 =?utf-8?B?NjIrVHRKVDcrblQvRjNhNzd4cnBtalFLSGw4VkJmVlgxK3RISXp4WDI3NDFr?=
 =?utf-8?B?TU81eUZNWFRaSks4Ry9ZMUFIemlsbS9ISkhoNlVWTzkwdktaWHhDcllsNDg1?=
 =?utf-8?B?MkNyUnp2SkNnUXEvWFZhRnAwT3MxMWx1QkNpVVV1aTR5azVELzNZQ3ppeERl?=
 =?utf-8?Q?adHRskX/mZpj3x0L6KXswZLxt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72fdc971-a21a-432d-8968-08dd7e0d37df
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 00:08:59.6768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cvqz7uLOMgcEpxUzaR9SaQ66qKs44DBNzolhyBJWZ8Ce6IUJXObPAkUhG3jSj/Nb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7498

Hi Reinette,

On 4/17/2025 9:47 AM, Reinette Chatre wrote:
> Hi Shaopeng and Babu,
> 
> On 4/17/25 5:18 AM, Shaopeng Tan (Fujitsu) wrote:
>> Hello,
>>
>> I ran tools/tests/selftests/resctrl with the following patches on AMD EPYC 9454P 48-Core Processor, it looks good.
> 
> Thank you!
> 
>>
>> https://lore.kernel.org/lkml/96d276c11e69cfb1e29d50a12c8043555c06b404.1718144237.git.babu.moger@amd.com/#r
> 
> It is strange that you needed to add this since it can be found in v6.10 and up.
> 
>> https://lore.kernel.org/lkml/cover.1717626661.git.babu.moger@amd.com/#r
> 
> Babu, is this still something that you want to see upstream?
> 

Yes. I need to address few comments in there. Didn't get chance to work 
on it due to other priorities. I will pick it up later.

Thanks for the reminder.
-Babu
