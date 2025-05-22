Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E6C51022;
	Thu, 22 May 2025 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747928661; cv=fail; b=c2bZkTqDha+N7pBZt3SqFLmTbZeH9iApgVstwy+xUcd0g9PhjYEDUo3D45ETaeClzSPQv69M2/E1sgfkmoWneFrkcYktzc8qkzCjf/NZ7wzWC0GiYKYGtaGusxz0xp/t0oHqXQ1U6TZ9eSgjmY3E+82oySTbDQiUrS96S3rdWmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747928661; c=relaxed/simple;
	bh=2v3wMEtILeGiNt+//WWa2dfcgSkJgfJ5SP8toPeYtfA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P+nw/Hy+10zGpWM5cr/D2Cim/P4ao9ENuHAxBE5h/DJA8wVptcYIwdPHGXRScYI+VT9eqVdD9bAfbRAuCSyitAXVo8Eu+ttnm1xqIBs3U91yhu49/+WauDkRFZSCPVoxF8LkNbf77Tz1p2yCDUdWYWVsJ5TwPrm9J6VhTbGyLT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GwqcxXU8; arc=fail smtp.client-ip=40.107.223.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GwqcxXU8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GM+fgLE4HtanIquvgqZ6kvKbpl9OkR2uXMOdPuD/bBuLC7Gvjy2rMK5iNbavwa4rbXaM5kIOOsDD3VnQah9pebB5odx2IsQ+nz/vPPmWzezTvhC+I33h2VikemZcQdwibAcakMqv+/6CSWdIqpqXBLu0lAANN/QEyKsHLzXFjt1WIj0yEtw65oHR/bu5F6zNxZ6KRr/RUKEyYk+rQzSKFp/pI13dVfdRGpS/60mdRTgrVg+VxvAqeNzKT6ByRq6+04NM03Z4guu40WS/nDBULA9uRS7g884uka48PFQe0168Tuo6NWtlYd1uzSiBQkh7g3nq6IBGXWyqW73TFWoGcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9jDj6Lrq2vqBmo+8jJlxULMttSvw97F50PVC0o7NYc=;
 b=JzHEzJ3zhYI7vYaJjIfdyfImpIAayvdvlMdfhQ5+5VJYHbUnHKWyfkhcpCLGgVw3SEZxhSEQvmdmGsHq7eP26hzxN6/+T70hvOtTKJp6AtxmDMO5louceGvfWlqs45V3Y5l7STVh1zNVn1t5RonmEbAE2bO/gIMgv4wMcCRdMHlv+1G3ginjHVX8D34mm44m0IzXGBOuaTmAO4bXwHMsqxQNJXjL4HQDcD/M/9Dv9KSdIDazQHfMV5o4rcCq8nNgLEWn3L9XvM1h/DY2RJoZvi5TlTASaxlKXV71s1h8JNNEmzMBmFNLfpEwByweijIGt1+Zt60sttMrg5Gvgt3brQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9jDj6Lrq2vqBmo+8jJlxULMttSvw97F50PVC0o7NYc=;
 b=GwqcxXU8tDOSlQKZBVfadE63tPQY2R7Z1mtap23TpWH/TojrgVgk9fuxLz6F9VhE1c38R26au01BFqNxhzfBtT0FBzCnZxeyVxfxWXUA35SghQ2ynh22HVR0e6rkyWLykZ3F3CHit4ztxedIaa/OR5B4aqoVl3eWuqsZeEVt9Js=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 15:44:13 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 15:44:13 +0000
Message-ID: <7628cec8-5914-4895-8289-027e7821777e@amd.com>
Date: Thu, 22 May 2025 10:44:07 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Reinette Chatre <reinette.chatre@intel.com>,
 Peter Newman <peternewman@google.com>
Cc: "Moger, Babu" <bmoger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, james.morse@arm.com, dave.martin@arm.com,
 fenghuay@nvidia.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com, Xiaojian.Du@amd.com,
 gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
 <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
 <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
 <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
 <CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUve8ptsfFTw@mail.gmail.com>
 <7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:806:a7::16) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA0PR12MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 46df9124-d48f-4b39-17ed-08dd99478011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGpyVUVza0Znc1BEcmducm9CRExGOGxpdlRGb0grT2lXZFBaOEZ0QnNHeGFu?=
 =?utf-8?B?YUFIRFJXc3pOTmhieHFTVFYxSkNTKzNTRjJMcVJ5UkhRbnEva1Q0RXJ1cGJ1?=
 =?utf-8?B?b1Y0OGFEdU1qSXJ6OE9EdTV3T0NjemNZT3d6S2RYSkh3WUJOeWpZZTRGTDl3?=
 =?utf-8?B?ZjI0dWxKc29qSjh0RTI3SXgxc1Fydmx0a2duQkc3UmNOOGs4eTBnelhzRXE4?=
 =?utf-8?B?T2V6U3NTWGFlNG4wOCtOQnhUcGZoWGE3QjhGTkVHRHkrR1dwdW1xcUkwTkN2?=
 =?utf-8?B?NFlnTkJBWmtibU5UUXR4eDN1NzZST3lrUnpmR3RzdXNBWDc4S0s0M1NoajN0?=
 =?utf-8?B?VGx1U0VmbUgrZ1JrSVh2eExrd29ETktzLzFuVlhQWTQ0Ryttbm5tN2xhaVl4?=
 =?utf-8?B?cithQjlITkNzRyt2L3BTVEdSQzVTalRTM2NTdkxsRDZpNUhnQXkwK3JRZi9C?=
 =?utf-8?B?NVovM1UzeFlGUThwMzRzb3UwbEtYU3ZiNS8wWENyVGNrcWpkdzhNUFY2bjdM?=
 =?utf-8?B?amZqNno3ZkVNUDZVZXNxNDB1ZmtTV3lZc2h6N3JYVWR0aHhrZDY2ekF2dTg2?=
 =?utf-8?B?NUxvVXdKQ2ZYRzlsREo1N3Y3SFh5eVFmZkJBOWZteHBKUjV4dHdPYmVVZGpz?=
 =?utf-8?B?UVo4RmtxUk1IRXFFNGMvWWU5SnJMZFJuSi9LOXpERzM3aGdsQTQyNXprcmRu?=
 =?utf-8?B?NGFzWEF0Q1FFQVB0MWFVT0V2WXZVRmkxckUwNk9hbEY4WDRzVWkxZHh4RzhR?=
 =?utf-8?B?cTREWUxxeWhmd2ZqOGZOU1VtRzFOZkdEUGdGRHk1U3dsRzc2T2o2Ym9wZEhi?=
 =?utf-8?B?UEhiQ01KamJCQ1p6eDhScDhEbmlOdW1HWEIrY2VPRmd0emZzMjcxTE5YVkMy?=
 =?utf-8?B?cXdSNnJDcjBaSDRXWlprMkVPVk1VZU1jSXIrMzd5c1VvRGh3emlmV0RDWFc5?=
 =?utf-8?B?d3h4MXllRnNGMkY4REVnNm52c3NVTVAxdWFLWmNWTmRIc0tYcWFERWw2eDZL?=
 =?utf-8?B?TEhNUUJHQjg3S0YyMWE3RDFmQzExbXJkeVdCWVRxejhnekUyTk94dk9qVTVZ?=
 =?utf-8?B?Y3Mrb0duNnQyZEdob21FNHYwWW03cGplRHhnMlpTZFZyWGh5Z3dyVms4QmRH?=
 =?utf-8?B?NkRmazVaMWFwMm9CRjhMQTZLc2ZXSXcyc2VjUlczZFhpbDZwbjdDUzlYQVlN?=
 =?utf-8?B?a3VhK2g2MzNPS2JMQkx2VERCVWxDb0kwbk44VmVOYnVucFJtNVd0ZVE3SlVK?=
 =?utf-8?B?UHcvUmdpRVJrRHlld0pxVWF4czBkTkRtSGYraTFqdEdySW5BMDZQYUxTb3RM?=
 =?utf-8?B?TFBId2dzZFZCanExOUlnUENTNUh1aWVNN2ladlBDU3A1YzE0U09lbVpnWE8v?=
 =?utf-8?B?WmF0Z3hYN1FBQjhHdU5pQ2tkZ3ViWkp2OElYNkRXcGtoalpZNG90NXEwR2gw?=
 =?utf-8?B?c0ZhdiszbVU1THZUNXozTWdGbEVkU04xR2lMU0QyQnlXc01na0ZhOCtCTHhR?=
 =?utf-8?B?bC9iczJqNE5pS0dNMEVSWnJ5eUJQM3dVT1Y3c0hpb0F1T2tGOGFwMTNwcHU5?=
 =?utf-8?B?d3lHeXphaDZDNDFPQldHWG5jTWhFMHExcUdPSzB6Ujc4Z3k1UUJnMFhTenpC?=
 =?utf-8?B?Q3JhSTBXbmVvVGF5V2kvRUtMNEswRFJiRWcxVFQrd2VJL05wbVh2S2FyZkpW?=
 =?utf-8?B?R3VMWElJREkwNVY1Z2tCdFRSWVBkczdhaHN6UlpVeFRjNVFldnZYTWpxQkpS?=
 =?utf-8?B?UWg5T0dGd3JYMERxbjVqQm5NdUtMcXo2MlltWGgra0dWT1Z5ekNHOU1BRTJw?=
 =?utf-8?B?VTZnM0k2alh5M2lkU3QwRGxNYTBWSU5vYnhmaE1vVnlmeFJFZit1bWpuNVZa?=
 =?utf-8?Q?8C+vd/P63fdgl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXNpTGhIaW9PaWJ0bjNueHRLKzZIb0UyVHFERFJjR2lPakNmR1lEVy9tV2RO?=
 =?utf-8?B?U3BLdFdNSk1DZnlqZGJDSENsSjJQcHNRSmNlSEFRS05LU0wzTkdZeHg3UWtm?=
 =?utf-8?B?UkVYUVhNd1lvOVE0MWJMZGZlM0lIWDRQMktiZzBKOFhNQXJmR04zb2xqcENV?=
 =?utf-8?B?b2JHYUcrTjBrWWxzbWV4VUFrVkFqREtrMHdsbWVhdDJhaUlWY2h5OUIyTldt?=
 =?utf-8?B?UzFZSHhYSWxrYzVndUI3dzRZVWt4enJXcFJ5a0Z1WnQzRTNER3k2aTlNd3B1?=
 =?utf-8?B?VGtWSWN1d2J6cDdTTDVZakx6RTBVN21PQjBEV2RXckN2MVROcFZrdWJXRWZr?=
 =?utf-8?B?NStKNThCcnI2SGp2OFhwdSsyU0E0b3U0d25jMk91ci9qZWRodG83YzRhK0dD?=
 =?utf-8?B?d0ladGE0dFdoT0FGTm5YUnRua1BhaERsUEdIWFRiRVFBekNpeStpZU0xZWox?=
 =?utf-8?B?SzJmVUhxUTBCdW9PMU9TMjU1dW81cXZ3WUowcW9oa2VKNkJTeE1QbzFQODQ1?=
 =?utf-8?B?SWlXeEFsRCtPalpUczZRS0JPQUt6cHpvYnBBaGFHREJIWHpPaVZtQUpObGE4?=
 =?utf-8?B?bWdzYWxmK210L0VmVnZrYUpXNFhFNk1ua2ZIVHQ2THBQdkpKT1FWa3IrUldY?=
 =?utf-8?B?WENMMzd2T1UzbXRvSGVDRW1TajFRUU1zYmNYcTFzZklkOGRiOFhqd1Z0QnJQ?=
 =?utf-8?B?MFdHU3g1d3R1dFlsUXEvMm43cGIrb1FTZWhZQmhITWd4UWVtL0RzV091Y1Nx?=
 =?utf-8?B?RnV6Wk45dDRyK2lUTmFJZUFLZGp0QUpxOGlqYTRQRWVGR0N2bXg5QkhiNkpx?=
 =?utf-8?B?MzFWclV0KzFMdVI0clVuRzVwQzkwSkt4d3lDNWRGVVFtM0tWNVlua3N2WU82?=
 =?utf-8?B?V2lyc0o5dWdzN0RGVy8raER1NEtsY1JQQnRQVTZuTTdyRVlrcDVpckRINzJn?=
 =?utf-8?B?ZmxuaE1FVytOdE9kUjIrS25Lc3R3RXVYNkU0UjJwRFFtR2FwUlp3eitvQ0pD?=
 =?utf-8?B?bjliNDFKZGk2emNZRzRBVjJ5bXNEOUxYOG1USE1MN1RxSnpDZ1BJVWVhMFM3?=
 =?utf-8?B?d21OYkFPWG1uT3JwYVFtc1crUHRXVy9qT0dubFRPL2V6ZWFndVlLVk12RzBw?=
 =?utf-8?B?WksvUjZIWUc1VzR1OGMwL0JtOXFTUzlPekJiaXhSYUFIOHhFSW01ckhnQzhS?=
 =?utf-8?B?UnA4UTBvK09NY21nRmthZHRycFBpSHVRSXhKWjZVb0o5QzRpaHM1OGVQbGNt?=
 =?utf-8?B?VHJuMjZWRlNoYUVzbDVpTVh6NGh3SDlOeHBiRzVwTWRZMUFENjlRQi9qZElD?=
 =?utf-8?B?M21TSWdwSU11WWNVY3JWZERNR2VCR0RyOHIzUFQyRU83Q2FJSUlEQ1BQU3Vm?=
 =?utf-8?B?WEN6UGhyR0VUU09pai9pcC8xRU9aR3NvY0dobnRHV29iVnhzcFBqTE0xWUNX?=
 =?utf-8?B?N29NT1p0UnVVWTNXWnV5TlU4aUdkMER2WkJxSlNJSE4yZ1ZGUHNCQ0YwZzkz?=
 =?utf-8?B?NVV5ZStodmQ5bWFJYUlsbHZsSk5PMjAvd2krdTFpV00rSU9iandLS29mZTc4?=
 =?utf-8?B?MmZBM1AvQTByNm85dGFJV2RMTkhPUWRLa1FXcmsxblhoSjdLcXJTS2tWN3NY?=
 =?utf-8?B?UWZDRVE3aVIwaStIS0pXOUlUaksrTkRySEZvT1VuUERPVGlheGxzMVVWY09s?=
 =?utf-8?B?cjJMWDgyWTE5Tkhaak5zWEpucHFLb2pEdmtGaWRKbWNOUDh5Z1RUY2hQL3RT?=
 =?utf-8?B?RGV3Y24vZWYzM2ZoN1VBeFVIOXBYcGNGSWErRG1wR1lqZUpJTGxZUVdoYTlS?=
 =?utf-8?B?WjVxeGhWQ0ZaL0kreFY5WFVkV1VBOUFXNUNMd2RiMTFGWmdZQ3JtSDNjSkpQ?=
 =?utf-8?B?dFhXVzgxc3NCSGRpZXpGR2hkOHZrb2ZsWGlTM01vd2pxQXQrQTRDVEtHZUtL?=
 =?utf-8?B?RFlkRndMdGxkajVzZVlpbUlPNmdUanVnMTgySzBFT0NDVnJSU2VGL0dGZWxH?=
 =?utf-8?B?Qzg3K21LOGM3QTlOWStDM2J4V2pPVmcwNXlqZ2dhbHVwR3RHZWhzTjJxV3V5?=
 =?utf-8?B?UTlaTlkvN1h6ZlNlRGMzcmF2cnBlMTQxdU44cll6OEVCVU9kYzdFWnpUMnRz?=
 =?utf-8?Q?UVAE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46df9124-d48f-4b39-17ed-08dd99478011
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 15:44:12.8979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFP6+eQfDv7dnR1FX5axMP5eeT3/2ciCJkAHauOAGqMq5VVabbKbXq7FIWbadw/j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7697

Hi  Reinette,

On 5/21/25 18:03, Reinette Chatre wrote:
> Hi Peter and Babu,
> 
> On 5/21/25 2:18 AM, Peter Newman wrote:
>> Hi Babu/Reinette,
>>
>> On Wed, May 21, 2025 at 1:44 AM Reinette Chatre
>> <reinette.chatre@intel.com> wrote:
>>>
>>> Hi Babu,
>>>
>>> On 5/20/25 4:25 PM, Moger, Babu wrote:
>>>> Hi Reinette,
>>>>
>>>> On 5/20/2025 1:23 PM, Reinette Chatre wrote:
>>>>> Hi Babu,
>>>>>
>>>>> On 5/20/25 10:51 AM, Moger, Babu wrote:
>>>>>> Hi Reinette,
>>>>>>
>>>>>> On 5/20/25 11:06, Reinette Chatre wrote:
>>>>>>> Hi Babu,
>>>>>>>
>>>>>>> On 5/20/25 8:28 AM, Moger, Babu wrote:
>>>>>>>> On 5/19/25 10:59, Peter Newman wrote:
>>>>>>>>> On Fri, May 16, 2025 at 12:52 AM Babu Moger <babu.moger@amd.com> wrote:
>>>>>>>
>>>>>>> ...
>>>>>>>
>>>>>>>>>> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: Reports the number of monitoring
>>>>>>>>>> counters available for assignment.
>>>>>>>>>
>>>>>>>>> Earlier I discussed with Reinette[1] what num_mbm_cntrs should
>>>>>>>>> represent in a "soft-ABMC" implementation where assignment is
>>>>>>>>> implemented by assigning an RMID, which would result in all events
>>>>>>>>> being assigned at once.
>>>>>>>>>
>>>>>>>>> My main concern is how many "counters" you can assign by assigning
>>>>>>>>> RMIDs. I recall Reinette proposed reporting the number of groups which
>>>>>>>>> can be assigned separately from counters which can be assigned.
>>>>>>>>
>>>>>>>> More context may be needed here. Currently, num_mbm_cntrs indicates the
>>>>>>>> number of counters available per domain, which is 32.
>>>>>>>>
>>>>>>>> At the moment, we can assign 2 counters to each group, meaning each RMID
>>>>>>>> can be associated with 2 hardware counters. In theory, it's possible to
>>>>>>>> assign all 32 hardware counters to a group—allowing one RMID to be linked
>>>>>>>> with up to 32 counters. However, we currently lack the interface to
>>>>>>>> support that level of assignment.
>>>>>>>>
>>>>>>>> For now, the plan is to support basic assignment and expand functionality
>>>>>>>> later once we have the necessary data structure and requirements.
>>>>>>>
>>>>>>> Looks like some requirements did not make it into this implementation.
>>>>>>> Do you recall the discussion that resulted in you writing [2]? Looks like
>>>>>>> there is a question to Peter in there on how to determine how many "counters"
>>>>>>> are available in soft-ABMC. I interpreted [3] at that time to mean that this
>>>>>>> information would be available in a future AMD publication.
>>>>>>
>>>>>> We already have a method to determine the number of counters in soft-ABMC
>>>>>> mode, which Peter has addressed [4].
>>>>>>
>>>>>> [4]
>>>>>> https://lore.kernel.org/lkml/20250203132642.2746754-1-peternewman@google.com/
>>>>>>
>>>>>> This appears to be more of a workaround, and I doubt it will be included
>>>>>> in any official AMD documentation. Additionally, the long-term direction
>>>>>> is moving towards ABMC.
>>>>>>
>>>>>> I don’t believe this workaround needs to be part of the current series. It
>>>>>> can be added later when soft-ABMC is implemented.
>>>>>
>>>>> Agreed. What about the plans described in [2]? (Thanks to Peter for
>>>>> catching this!).
>>>>>
>>>>> It is important to keep track of requirements while working on a feature to
>>>>> ensure that the implementation supports the planned use cases. Re-reading that
>>>>> thread it is not clear to me how soft-ABMC's per-group assignment would look.
>>>>> Could you please share how you see it progress from this implementation?
>>>>> This includes the single event vs. multiple event assignment. I would like to
>>>>> highlight that this is not a request for this to be supported in this implementation
>>>>> but there needs to be a plan for how this can be supported on top of interfaces
>>>>> established by this work.
>>>>>
>>>>
>>>> Here’s my current understanding of soft-ABMC. Peter may have a more in-depth perspective on this.
>>>>
>>>> Soft-ABMC:
>>>> a. num_mbm_cntrs: This is a software-defined limit based on the number of active RMIDs that can be supported. The value can be obtained using the code referenced in [4].
>>
>> I would call it a hardware-defined limit that can be probed by software.
>>
>> The main question is whether this file returns the exact number of
>> RMIDs hardware can track or double that number (mbm_total_bytes +
>> mbm_local_bytes) so that the value is always measured in events.
> 
> tl;dr: I continue [3] to find it most intuitive for num_mbm_cntrs to be the exact
> number of "active" RMIDs that the system can support *and* changing the name of
> the modes to help user interpret num_mbm_cntrs: "mbm_cntr_event_assign" for ABMC,
> "mbm_cntr_group_assign" for soft-ABMC.
> 
> details
> -------
> 
> We are now back to the previous discussion about what user can expect from
> the interface. Let me try and re-cap that discussion so that we can all hopefully
> get back on the same page. Please add corrections/updates where needed.
> 
> soft-ABMC
> ---------
>   soft-ABMC manages "active" (term TBD) RMID assignment to monitor groups. When an
>   "active" RMID is assigned to a monitor group then *all* MBM events (not LLC occupancy)
>   in that monitor group are counted. "Active" RMID assignment can be done per domain.
> 
>   Requirement: resctrl should accurately reflect which events are counted. That is,
>   we do not want resctrl to pretend to allow user to assign an "active" RMID to
>   only one event in a monitor group while all events are actually counted.
> 
>   Caveat: To support rapid re-assignment of RMIDs to monitor groups, llc_occupancy
>   event is disabled when soft-ABMC is enabled.
> 
> ABMC
> ----
>   ABMC manages (hardware) counter assignment to monitor group (RMID), event pairs.
>   When a hardware counter is assigned to an RMID, event pair then only that
>   RMID, event is counted. Hardware counter assignment can be done per domain.
> 
> 
> shared assignment
> -----------------
> A shared assignment applies to both soft-ABMC and ABMC. A user can designate a
> "counter" (could be hardware counter or "active" RMID) as shared and that means
> the counter within that domain is shared between different monitor groups and actual
> assignment is scheduled by resctrl.  

Good summary: Thanks.

> 
> 
> user interface
> --------------
> 
> Next, consider the interface while keeping above definitions and requirements in mind.
> 
> This series introduces (using implementation, not cover-letter):
> 
> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs 
> "num_mbm_cntrs":                                                               
> 	The maximum number of monitoring counters (total of available and assigned
> 	counters) in each domain when the system supports mbm_cntr_assign mode. 
> 
> /sys/fs/resctrl/mbm_L3_assignments
> "mbm_L3_assignments":                                                          
> 	This interface file is created when the mbm_cntr_assign mode is supported
> 	and shows the assignment status for each group.              
> 
> Consider "mbm_L3_assignments" first. The interface is documented for ABMC support
> where it is possible to manage individual event assignment within monitor group.
> 
> For ABMC it is possible to assign just one event at a time and doing so consumes
> one counter in that domain:
> 
> a) Starting state on system with 32 counters per domain, two events in default
>    resource group consumes two counters in that domain:
> # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> 0=30;1=32
> # cat /sys/fs/resctrl/mbm_L3_assignments
> mbm_total_bytes:0=e;1=_
> mbm_local_bytes:0=e;1=_
> 
> b) Assign counter to mbm_local_bytes in domain 1:
> # echo "mbm_local_bytes:1=e" > /sys/fs/resctrl/mbm_L3_assignments
> # cat /sys/fs/resctrl/mbm_L3_assignments
> mbm_total_bytes:0=e;1=_
> mbm_local_bytes:0=e;1=e
> # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> 0=30;1=31
> 
> The question is how this should look on soft-ABMC system. Let's say hypothetically
> that on a soft-ABMC system it is possible to have 32 "active" RMIDs.
> 
> a) Starting state on system with 32 "active RMIDs" per domain, two events in default
>    resource group consumes one RMID in that domain:
> 
> # cat /sys/fs/resctrl/mbm_L3_assignments
> mbm_total_bytes:0=e;1=_
> mbm_local_bytes:0=e;1=_
> 
> What should num_mbm_cntrs display?
> 
> Option A (counters are RMIDs):
> # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> 0=31;1=32
> 
> Option B (pretend RMIDs are events):
> # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> 0=62;1=64
> 
> b) Assign counter to mbm_local_bytes in domain 1:
> # echo "mbm_local_bytes:1=e" > /sys/fs/resctrl/mbm_L3_assignments
> # cat /sys/fs/resctrl/mbm_L3_assignments
> mbm_total_bytes:0=e;1=e
> mbm_local_bytes:0=e;1=e
> 
> Note that even though user requested only mbm_local_bytes to be assigned, it
> actually results in both mbm_total_bytes and mbm_local_bytes to be assigned. This
> ensures accurate state representation to user space but this also creates an
> inconsistent user interface between soft-ABMC and ABMC since user space intends
> to use the same interface but "sometimes" assigning one event results in assign
> of one event while "sometimes" it results in assign of multiple events.
> 
> wrt "num_mbm_cntrs"
> 
> Option A (counters are RMIDs):
> # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> 0=31;1=31
> 
> Option B (pretend RMIDs are events):
> # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> 0=62;1=62 
> 
> Neither option seems ideal to me since the interface cannot be consistent
> between ABMC and soft-ABMC.
> As I mentioned in [2] it is not possible to hide ABMC and soft-ABMC behind
> the same interface. When user space wants to monitor a particular monitor group
> then it should be clear how that can be accomplished. Not knowing if
> an assignment/unassignment to/from an event would impact one or all events
> and whether it will consume one or multiple counters does not sound like a good
> interface to me. 
> 
> As I understand current interface, user is required to know how ABMC and soft-ABMC
> is implemented to be able to configure the system. For example, if user has file like:
> 	# cat /sys/fs/resctrl/mbm_L3_assignments
> 	mbm_total_bytes:0=e;1=e
> 	mbm_local_bytes:0=e;1=e
> user must know underlying implementation to be able to manage monitoring of
> events and assigning counters otherwise it will be a surprise to lose monitoring
> of all events when unassigning one event.
> 
> This is why I proposed in [3] that the name of the mode reflects how user can interact
> with the system. Instead of one "mbm_cntr_assign" mode there can be "mbm_cntr_event_assign"
> that is used for ABMC and "mbm_cntr_group_assign" that is used for soft-ABMC. The mode should
> make it clear what the system is capable of wrt counter assignments.

Yes, that makes sense. Perhaps we can also simplify it further:

# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode:
[mbm_cntr_evt_assign] <- for ABMC
 mbm_cntr_grp_assign  <- for soft-ABMC

> 
> Considering this the interface should be clear:
> num_mbm_cntrs: reflects the number of counters in each domain that can be assigned. In
> "mbm_cntr_event_assign" this will be the number of counters that can be assigned to 
> each event within a monitoring group, in "mbm_cntr_group_assign" this will be the number
> of counters that can be assigned to entire monitoring groups impacting all MBM events.
> 
> mbm_L3_assignments: manages the counter assignment in each group. When user knows the mode
> is "mbm_cntr_event_assign"/"mbm_cntr_group_assign" then it should be clear to user space how the
> interface behaves wrt assignment, no surprises of multiple events impacted when
> assigning/unassigning single event.
> 
> For soft-ABMC I thus find it most intuitive for num_mbm_cntrs to be the exact number
> of "active" RMIDs that the system can support *and* changing the name of the modes
> to help user interpret num_mbm_cntrs.

Sure. The option A: fits well here then.

 Option A (counters are RMIDs):
 # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
 0=31;1=31

> 
>>
>> There's also the mongroup-RMID overcommit use case I described
>> above[1]. On Intel we can safely assume that there are counters to
>> back all RMIDs, so num_mbm_cntrs would be calculated directly from
>> num_rmids.
> 
> This is about the:
> 	There's now more interest in Google for allowing explicit control of
> 	where RMIDs are assigned on Intel platforms. Even though the number of
> 	RMIDs implemented by hardware tends to be roughly the number of
> 	containers they want to support, they often still need to create
> 	containers when all RMIDs have already been allocated, which is not
> 	currently allowed. Once the container has been created and starts
> 	running, it's no longer possible to move its threads into a monitoring
> 	group whenever RMIDs should become available again, so it's important
> 	for resctrl to maintain an accurate task list for a container even
> 	when RMIDs are not available.
> 
> I see a monitor group as a collection of tasks that need to be monitored together.
> The "task list" is the group of tasks that share a monitoring ID that
> is required to be a valid ID since when any of the tasks are scheduled that ID is
> written to the hardware. I intentionally tried to not use RMID since I believe
> this is required for all archs.
> I thus do not understand how a task can start running when it does not have
> a valid monitoring ID. The idea of "deferred assignment" is not clear to me,
> there can never be "unmonitored tasks", no? I think I am missing something here.
> 
>> I realized this use case is more difficult to implement on MPAM,
>> because a PARTID is effectively a CLOSID+RMID, so deferring assigning
>> a unique PARTID to a group also results in it being in a different
>> allocation group. It will work if the unmonitored groups could find a
>> way to share PARTIDs, but this has consequences on allocation - but
>> hopefully no worse than sharing CLOSIDs on x86.
>>
>> There's a lot of interest in monitoring ID overcommit in Google, so I
>> think it's worth it for me to investigate the additional structural
>> changes needed in resctrl (i.e., breaking the FS-level association
>> between mongroups and HW monitoring IDs). Such a framework could be a
>> better fit for soft-ABMC. For example, if overcommit is allowed, we
>> would just report the number of simultaneous RMIDs we were able to
>> probe as num_rmids. I would want the same shared assignment scheduler
>> to be able to work with RMIDs and counters, though.
>>
>> Thanks,
>> -Peter
>>
>> [1] https://lore.kernel.org/lkml/CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com/
> 
> Reinette
> 
> [2] https://lore.kernel.org/lkml/b9e48e8f-3035-4a7e-a983-ce829bd9215a@intel.com/
> [3] https://lore.kernel.org/lkml/b3babdac-da08-4dfd-9544-47db31d574f5@intel.com/
> 

-- 
Thanks
Babu Moger
