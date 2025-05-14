Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2050.outbound.protection.outlook.com [40.107.102.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B5E19D09C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253038; cv=fail; b=CrAsQZW8IK7jkZ8ppWWNf4oNUqt7E7rUaS4sn0vCYZ6Ir6D+nPi1AP9KgW+sR3Raj/G0xqYW2Dp6tQiQsCjIExlSWhiXlJqfm7h0dHrj5rF8b2UdjfGDaXJ/M3jSqV7dXQRXwgorjPuqULZefMFfTN8pxcWhFesyhNS+GXOtO8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253038; c=relaxed/simple;
	bh=eFoi7DSKaCv2c91kGauBIsHfHC7qvOazteybMHd5zao=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AxTbIw3C1C9DyfYxTi7MAmeFsMeQ33N66ZR4X3+ZOzxYZgWylsh3Ajzou2CCK4eRFE+xYLCVNkS5cOguabQLNZo+pHNc78hzAGJlHQPpch4HuqZUeKSrsRhVtgBNkukS3eFvm0Uiu4eQo5DHSstbR5fAV9zvEvC/TOXfyUTCnC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RuhG4kPm; arc=fail smtp.client-ip=40.107.102.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RuhG4kPm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SezGcF5Mw3IaFj/RXynd+s5mawNsxBT1dKNmh9kKiOlkGsLLmwr41nEaW40qoiSbDZEipTMcw0cHt19HkI3vKlLHhd/aeLFGUMNqk9UImgpbC35cSIZHkWiN2Lleq6thspbM9xSMuqm7cglr0Mh8XAb3k0SBh87hP9TJABGsSiD6NW/1/SIVB7sUAtnVLr/hbFBAK60nxrMbvWwShJdG5jo2tTfXUAUpkJyiKf3TtfdNm7VXlQ8SME7TBo1h42qhifpJEDQjMWXSc59RR4/OUfJsmCaFERz7U2RTQuEBUMjxln+XbM8OVUMi6qtg3jrEzDYxGOgY/IhCOPg1jcuQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFoi7DSKaCv2c91kGauBIsHfHC7qvOazteybMHd5zao=;
 b=MKQLtQkSwjxS2EncE8DgD++jy8E8vZ7gP1zJugBRrrNI1htjbe9iTFzJ4GBZ91AW+8SCLMvyzhHsSfcz+u+FEJJUJ2U0epMmYtTNyi5pcSGz9ItbQojpl34+Ot+vIMGUl8bOxoeTJwROe+rC958O7I4Jb7B50F1b5EhM+K6hp+aFha2sDqwbDvvQvSjbqjRMIIhOGQqHuzHhBbp8cHgjE914fBBtqyqANluBgB2D1mqrhiYI7mlXb3cJFME/+J/a5OfOWFG4FXTFQGOMdEmWpS97cHJQrh4lZwfrpB/QUK7LQyFQEJQNpbC29/OfFfKG5vnwZSmBVRUJc+8YLaktJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFoi7DSKaCv2c91kGauBIsHfHC7qvOazteybMHd5zao=;
 b=RuhG4kPm6Y7Lys+KS7tKE4Ie7CcdK9abPGIeYA7G3gSjz8Xnywa4xzHPpo46V7Bd1NGi0jlY2C1Vn6uWD9lkigeyFZKgcBdjsKop02cvGzESZO8pUZybG43gvX2qbjitakX8Rxg/QjjsmghNydVbaMTLPuikG4Rdg7YqiupFxb+NgREz0ZqZgWRGWYDZlp5hHJTJYHc+1Cfq2cF9YCVdIkEM3IZ7l7PPRtTEcD2GrgPRs7UtF4mUzV3TJ1pdF+yeL3PYU0Bu8dIzHArzmM5aFanpakrItKs2nIIUp+plyG7mUBy2SEmguGLhGtjjT9+1OWY+OMZRmFy07GCtWiSiaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 CH2PR12MB4104.namprd12.prod.outlook.com (2603:10b6:610:a4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Wed, 14 May 2025 20:03:53 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 20:03:53 +0000
Message-ID: <ac56999b-eb41-47a6-bd7b-d5880bcc646b@nvidia.com>
Date: Wed, 14 May 2025 13:03:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/30] x86/resctrl: Optimize
 cpumask_any_housekeeping()
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 "Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-5-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250513171547.15194-5-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::32) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|CH2PR12MB4104:EE_
X-MS-Office365-Filtering-Correlation-Id: a62f52a2-9f01-4374-93b5-08dd93227373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0xYdGFzdVhQRXQ5bzhZTnZaL0JvL0dkdHpiNHJKQTNwUHZBMlhZck1TOFMz?=
 =?utf-8?B?SkcrY044d25sM0dvcHFmU3FQY2h2TDVscmtKTllmZjczSjJ6UTlzODQyblEx?=
 =?utf-8?B?alRWekNSY1ZMbGpQRVNnSmpnbEdiNytsMVArYTNkK0VHTFRWQzQ5eUNhY2dU?=
 =?utf-8?B?UnBmODAvQW9kWmNSeGJLM21Na0JURTZoTnA0bWFhVlZGcHF2YXYzNzNSTkdi?=
 =?utf-8?B?K2FpMm1PYWVrcDNUcGJtenlLWkNwd0c3VHR4SWhDY2NGWThjTTNvb1JlVmJY?=
 =?utf-8?B?NHNZSHJRL3pndkdxRVhiTElpQlI4cG5ZU1VlRWp5QUd4R1dTTS9idkprY2xk?=
 =?utf-8?B?eU0xcWJIMmdTRUVvV0k1akVJRW4zaHdNU1pCeXlWWnppRy84bEgyeVhoWHoz?=
 =?utf-8?B?dnp4VEt3alBXdExOREhzTVM0RWJCazc4NStta0MwZndwUk5aZjZ4dDFOWkY4?=
 =?utf-8?B?RVB5eHRVa05WaFBNbUFyT05RZEJLNmdsZVA4ZDZTZ0loYi9WMGlkckFrekZF?=
 =?utf-8?B?ekVHMlBscnVSK1JURTl3VVBuTXRTQVFlWDdFeGNNR1pBN2lmRHo3SE9INTNk?=
 =?utf-8?B?cm0rTzZKUHVpOWdQQUlRN09pbWJzbjVXZi91N1ppOEFLdW1xSklQZFA3L1BT?=
 =?utf-8?B?WElHbHZhYVc1cXIwaG00dkl0L2ZqdkFEUER0Y3V2QjRuNENuVmhISTAzQXBO?=
 =?utf-8?B?SUMyUUpaSWdST3VLb1Rhc05uWHZXU0gzQmlxK2doMmdhSTk2MDUvd3NKTlB1?=
 =?utf-8?B?cGV4blBIY0NzbDcyc0tDeXI4YTVMSk4zMVNzNzFQTTcraHJGWlV1bGIya3Nw?=
 =?utf-8?B?WXg3L3Fqb3hBS2Z3ZXpNa0pVU09Pb0hiSitMaGpCVWgrMDFCV1o2K0w0ODVz?=
 =?utf-8?B?aEJSNXdWMi9kcnRoU2p3SlFyb2dVSE9uZHl1WWthTlZwdXE0K2NncGROVW5S?=
 =?utf-8?B?T2F3clhrZXJPUnhEb0ZPWVl0ZElWZUZoYVlpTjBBVDdYNW1VRVVLN0JFS2I2?=
 =?utf-8?B?RkxBVmFPY2lHanVRYk1YeDljZVA0d0ZiZGN2Qm41TkpVKzBENEJsNFUyL0sy?=
 =?utf-8?B?NlpWbGFvNEpIa0lVTUlkc2taMU55WC9Dck5XQStDcjhVTnREUEhrZk1BQUE5?=
 =?utf-8?B?L2lIc1BxT1lWbm5JVXZhUW5McG9JeVljWnNLa0JxWnFLYStwNFp0Zy85c0lY?=
 =?utf-8?B?WHlyeXRzZTQzWXJEU3krZy9MWW9SSU1rbE9MNi9WWXZGYlh0aDN2YzRlRUZP?=
 =?utf-8?B?dy8rY3RYU09WM3VEQklLYmV1dmlLbnlPQUs2ajJwMitNa1pxVHlrS0Y2T1B5?=
 =?utf-8?B?MUNMdG1LY04raHcrOUZjNk1LSHZxbHdQVW96dE9nVytqSUtLdGxCMWdLb0R0?=
 =?utf-8?B?N29mTXJUeEZpK0tzWm94K2NNcnpzbEM2a2EyNGVkdCtqaFBQWFA0RC9LSU1Z?=
 =?utf-8?B?cGc1a3hQaUJROUJiTlFXTEwyK05qSGk0QUlwcGtGcjh5QzVrMXl0M2NSZEJB?=
 =?utf-8?B?OUJyUzlrSDlMa0F5ZmcvN2xVRTVVTXYvSmVWQVhjQzdFUjNoLzNGdVNuYm9K?=
 =?utf-8?B?eGE5YzJUN2l6TVB2eTFmdjdGK1pvQUVJZHlqSG4vbnBDRFZ1cG5OOEJrL1Iy?=
 =?utf-8?B?dGZWbkRlc3U0T2wyQm1yOTZYZ0Yra1lPblRDYWVzcmxoMXRPM0xEOVFJanFa?=
 =?utf-8?B?UENaSVUrenQxYzF0Y3BSdG5OVTVOZmxlb3RqUHJST0RiTFFYRXBOcTlRWDNR?=
 =?utf-8?B?UzFrWGUzTlNHekN5aGk2ZHhXcHpNRE9JaTBJNTlVNWNmTHZ4REFhOG1wVVov?=
 =?utf-8?B?RVhvRllEanVaMG5kbjE4eFc4ZDBZZUNNa1JWd3k0Y3dKL2tSaFpvcVZLRlFO?=
 =?utf-8?B?WmVHeW9OSy9vNkxHVWsvaUp0VDM4ZkdjL2xxSTErOGxUcnFGYThiNVVzVmpB?=
 =?utf-8?Q?r643hIHHmUs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1BuaUN4OUhxdG0yS1oraDVLYnJFUzNwdFJzWUhPOG05TmJhcWNlZVdLZVd5?=
 =?utf-8?B?MVVXcVVHK28yb1pBWG52ZVc2bjVFb3dGejVIY3ZDY05xVnhMd0pUc3IvSmZi?=
 =?utf-8?B?eW9leGUvYTNCOUxNaFExRHpwNk5idUhpSEEwRkVDdldnMTZBRms5R09JNXZT?=
 =?utf-8?B?Ny9XSjNrNGMxN3Irdm1PbkVNZUU2bXVDZUlaSmVacFM5dzhHOE9sMzM1ZUI4?=
 =?utf-8?B?aU5XdXFhWithWDlNLytXLzNuZG53d3hkcCtsNnkzSzRkQUwvYVlOU0daNUY1?=
 =?utf-8?B?aEVUclVobnhzWDdrakNpMCtkVVJ3cFhoTzl5UUtwOE9yTnlRNG9hcGNZQnEy?=
 =?utf-8?B?R1hVUjFCNDNRUVJJbDdWZ2Vmb0xBdzZLbGRZbU1NTEVtS2dpWDIyWC9QN1JE?=
 =?utf-8?B?YlNORFZjUEVpdFdZcXg3YXhTclNzYVdwWFdRei9tV3AxSEhyK1JETU10N0Fo?=
 =?utf-8?B?VzBpZVUwdk5hSnd2MmhSb3g5M1o5S2hzUldiUDdCNGZxekNtcWtyaW43TmZn?=
 =?utf-8?B?VFVWUzJIZSs3a2JBMmlRaFBjbnJoSGROSDVES3ZIZzM3OWcxRTB6alpBTXNV?=
 =?utf-8?B?L3ZoVFlNdkhLY2xCQ0E2NkY0RExjUVJlOXR0WGhMUVZ2ZXhSeGZCbTdrZzVW?=
 =?utf-8?B?ZHNoUTVoZGhSRzAzYm4rQXBpUzdWMkxlUXRCTWU1YlcwU1JXSndxU2owWDZi?=
 =?utf-8?B?c3ByYk82VXUwK3JORWxzQ2UrWktsRzMyd3VGTkdLRnZmMFRGcTZTdCtlZjlB?=
 =?utf-8?B?ZXlQQ3dzTW1rNlJoSy9JWTN4ZFVuTDVCdGJHMnBNalhNdnR4RmJYMVFTR0VB?=
 =?utf-8?B?blZqSEVHcHFGRFRPSFpwSlBTTHFJVlVzZHNHWnBpUzY0YXdFMWRaeEtGb293?=
 =?utf-8?B?K2JndXhtOGl1TWp5UXR2QUg1RGF5ZXhKQzV5NVZQUDYxWWQwa2taMk1zWDds?=
 =?utf-8?B?N0hkaVR6L0tva0ovTUJGQVdna0dEbFllZExnZ1dJQ2pabXdtV3FmMUI2MzBD?=
 =?utf-8?B?a2FLWER2UFoyTGpOVnpWQWxtbGFuVE91Z0hJSTNZdEVkaTgwbHRRd2lEY2hi?=
 =?utf-8?B?MGdhV2Q1bm9ZVzgrYXRweUhMczF3a1g2eVp5dnZXMW5wTXoyZ082bVYrZnZT?=
 =?utf-8?B?akFVSi9Wb2Rxay90K2NOOEpPcWZpTzdITmZjZXp2WW1DcTJXMjUvQ3RCazMw?=
 =?utf-8?B?d0FwdDV6NmRQT2t1NFdxc2d6SzVMOUJINDF2QU5JRGhBRFlpVU5xaUlwcy9S?=
 =?utf-8?B?Q09ITUgvMXk3YysxYUM5UUd6akRaWEJ1enNkU3JpVVNwaXN4SW9XOEFxbytR?=
 =?utf-8?B?YWVYVVRLTkJqd1BOeVlWNysrVElhcEZWbWs1OGV1enpjb21VNElJTk0yY0Vv?=
 =?utf-8?B?ZWdmbDNSem1iUTRKdTRPTnZ5NTgrb0owdVQraVFtYWRZalRnTkNQdHhHcGtp?=
 =?utf-8?B?bEZtQUpxb3RKRTB0YnUrbWJiT1RwVzJrdDU4RTFMOC9ieUZNek43VjZNSSs0?=
 =?utf-8?B?RFVxZWxjZmlPanJOd2poRTlKRncyZkRkd0NFMjRYdEhQdHRvei85cTJQWWNh?=
 =?utf-8?B?Q1NrNkc0WFFjK0FKSlZodGJaRHhUQW9TT0ZhNzhOeit6WFRuTm9VSldIMzVZ?=
 =?utf-8?B?c09OVCtUTnNCUXM3RzFXVlo1dVlhaDAvN2ttR01sbVBFbk94L3NqdDhKS3k0?=
 =?utf-8?B?YXgyYzVGYXdJTCtBZkR0TDhzZXp0ODZXOXlNWjl3UEJ2eE5YSFRJcXR1bUtI?=
 =?utf-8?B?T0kvckxwbnA4Vk1ZT2hEL2w3WnpBYkRPdnpMR2RSMkF3UGZRT0lxSDBjcnY1?=
 =?utf-8?B?dUo4ZXlsSnZSVmJtM1pEVElDY2ZvR29rMzB1TUMvZENLemtmSHpHZnZmYW5n?=
 =?utf-8?B?M3VySzdIN01wdkd6YnNKb2RuY2tWVkRCNS9rTGdFdHVOTHZKL0FYcndkZnl6?=
 =?utf-8?B?RnovL0h0bkNlckhaK0FwU3VLQWpmNkY2akZucmFRQ1FCZXlMSkJmQldLZFJK?=
 =?utf-8?B?N3lCSFpXeUpuZkV1TDVCRDlrS3gvYlVrZ0dWTnVLQWdqNDhqbHZXaDJuMlMx?=
 =?utf-8?B?UVR0UXppcXFkRFZLM25QSkVVRkRCeTRpSzBRb3Q0MUlHRHZOQlRhUXVXa2ZT?=
 =?utf-8?Q?wDsUnmLB+YVAQGeBo9uS0Tjav?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a62f52a2-9f01-4374-93b5-08dd93227373
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 20:03:53.4245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iePU7GZwzM+RP01Fc9chD4w0tvnIIA0UgVTi7odJL/Yt3JCDLtYzu4Q7HJVx0itT4rj/fPxXA8e5NdV/sLp9wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4104


On 5/13/25 10:15, James Morse wrote:
> From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
>
> With the lack of cpumask_any_andnot_but(), cpumask_any_housekeeping()
> has to abuse cpumask_nth() functions.
>
> Update cpumask_any_housekeeping() to use the new cpumask_any_but()
> and cpumask_any_andnot_but(). These two functions understand
> RESCTRL_PICK_ANY_CPU, which simplifies cpumask_any_housekeeping()
> significantly.
>
> Tested-by: James Morse <james.morse@arm.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: James Morse <james.morse@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> Signed-off-by: James Morse <james.morse@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

