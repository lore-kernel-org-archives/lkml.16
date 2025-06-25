Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCCE1A7264;
	Wed, 25 Jun 2025 15:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867037; cv=fail; b=I49KBleuAkwygyu5Fj4bnQBbhv3V2nMxTVjOHXTrBk4v3eR0qRFlgHnol5p+1OYqkxCzbYIe0l+5ycByAcRTXFES78zwkAhkr0tREoGTo5pm2WLuY6Mahu1HWN3DDnKx4JQ68/WD+9DIDqr6terQXxWxeEwkI9dpgakRbCkDoOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867037; c=relaxed/simple;
	bh=TlYJcDIRcy8Vg5FELaGS8i878O638qAZzrtXM7E7UeE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b3zOXe9zNW5UIWFTGiotCwHGJSI8n9f1RypMduQ0zbpk5MF6PdBx29NsjuIdhhyAzr3vOHvuugm5YKfF+HB32kJ9HBd0BvtsZjcpzoKkNCZc0pXIuTstVpcJsub7aTOqO7wt5hGBi+AgldHRXC3MBAb0ua34sKOmVPMykw8NHLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kNyLOp1U; arc=fail smtp.client-ip=40.107.94.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kNyLOp1U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOmz5aW9FKbYOCcl6Wfya1qVkoAVJJbUSMqCLEFy7CdMtBvTxhDrH6mJ8b9NzEkUoE4tCMeQQcJxA/Z/OYD/wXHHR6sy0Dev+eZHjEF/WeEgq8jkrdx72ZzUnyPPPPHy/fi5oEOvS4Xg8+bZECfwEB/f+8PFAbJm6pNINnsSKeHP4LBI4ci+7gHJYdh0PKulv6W5XQ5jmLXzVzawgMLyqj9B+wmggy9vfuEYbe01T30+QOwvNcVIk+p6BEsvkkD+ejR5N5g4Uzghemt64GmIAIGPlZ+OcEkF9Q7FoFqIlAqPnWbsh9V7x26S3ZGMXpKr4LPDwoaBqt6RiM18rH5wLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXv1j5NkAIGkFnlNMpnIgzS7qqgZV8xX+ZqLBhqUo3Y=;
 b=K1r9qmOZXNmdbjrmzF37+2nawL46hGJsI7SWDWYFrBRSCv12XcUKhH2sDjygPXAL4qLypUHUUeQ6UVABjgGxU9CoSIljzcPIim0OluywkiL6tVY72WvIQozCWfBEbdM0WgPXw8B0vTZxQF6B/mylFpXGxLYGBWtvB8gmv4jjleO9zQp15fWYIKyRJ6VF/5i9DhcXaF/Kclr8h9zWz5clkSNTPj8W4CbuQkwE5khW5/4v1tyoDP4gtGCHW5WbDmses8iegi+hbhJjRZulG8N1Y96ewzXUOlvrr8dPZJMRMpXeKdUgvML7SG7T7COI2yRCk/GDgoNOUoZvNMRb5QTruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXv1j5NkAIGkFnlNMpnIgzS7qqgZV8xX+ZqLBhqUo3Y=;
 b=kNyLOp1U9ZPk0cPBwigvX8Zyd5EKFkekIA+ZCelDERsvum2ZfVuzGE/Oe2SW0lSeKZ1NEqgjeeHScAy0234nUqnD2PNXOXBjLxA4xlIr4sbY126osjxtb5zanKEuMcQpAt7KRmDAL10LPE1H9SDmgmCs/LurkruhgS27hmNN6vI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SJ0PR12MB7068.namprd12.prod.outlook.com (2603:10b6:a03:4ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 15:57:12 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 15:57:12 +0000
Message-ID: <09c1aa33-08f7-456e-9c15-323a29877302@amd.com>
Date: Wed, 25 Jun 2025 10:57:06 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 02/32] x86,fs/resctrl: Consolidate monitor event
 descriptions
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
 perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, gautham.shenoy@amd.com, xin@zytor.com,
 chang.seok.bae@intel.com, fenghuay@nvidia.com, peternewman@google.com,
 maciej.wieczor-retman@intel.com, eranian@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749848714.git.babu.moger@amd.com>
 <80689a762e59137f0d0297ee4ce0d31f070a3655.1749848714.git.babu.moger@amd.com>
 <e9eb906f-d463-4c1e-9e15-5ed795fe5366@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <e9eb906f-d463-4c1e-9e15-5ed795fe5366@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0196.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::21) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SJ0PR12MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 80dfa0ef-829d-49d6-f239-08ddb400f272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0puZGxPUnJ5K05vcmZrZXhKNkFiamt3YmhuNlNMeUw0OEFBbDk3SGxUWFpX?=
 =?utf-8?B?RjlOWDFSWmR2RUYybXUxNDJPcTlVWWx6NzZCaDRNQnNZaWJldGRFVmFCa212?=
 =?utf-8?B?d0grYUdBYVg3bk9zbmt4RmtIeXpWQ2pFUmZrTTByTElmTDI5TGIxRWZVMXNk?=
 =?utf-8?B?aHVIRTg5azduWTBSallEeDIzdDBaNGlSS0lMQ0IyOW1CdU84Z2RxSEM4MjV0?=
 =?utf-8?B?SFpEUTNWNmhIOEx2UXpmTlpzZkNzczFyRzVMcENHRzM0RWNiaFRGcXUrNE9M?=
 =?utf-8?B?eUZzLzg0TUFSUWlrUkVqQjVBQm5PQ0Q0Y29LbVhWc0tKR21GNy9adjNyaWVn?=
 =?utf-8?B?TGtObGh2WFhyR0t1TVJUaUF3QzEwSnhjQW1jTzIvVUl6amxoMEVmcjlqOVoy?=
 =?utf-8?B?SWNMWXRIbWtaejZxVWhSTVVpRFloMW9JRUFGdWhuU09yU1FYYkxvcGc0dWNj?=
 =?utf-8?B?TTRVa2lYSWQ2b0NNY0V1cGE0UCtKRGdleTY1ZFlBdVhkaWc2b3hmaTAxZjJq?=
 =?utf-8?B?cGxXVUJHOStUT3NNSkk2U3J0SDJaeitCRkV3djdRYVFGaEJlMDJmQ3VqMlB6?=
 =?utf-8?B?TmY5MUtKSU00S1FXWlJpWGlvMFY4MXJvT2Z4am5Lc25pVlJ3dG9PNHkxT0J2?=
 =?utf-8?B?V2gzb292Kzl6TkNlT1ZWY3haRU5DSWxXbmpYZWlRajR2aEczbkpsWVg0TmlF?=
 =?utf-8?B?MFFCeTQxSjl5dnNoZFZmeGc5VDFZZ1YyMGt2dVZ1cDh6NVVKVTVldENvOWMx?=
 =?utf-8?B?TzhJbmg0TWFEMU5uVUlaeWg1K2RnclVrUHFKN0JxWWRDYW5jTnJ4SnpQYlN5?=
 =?utf-8?B?ZFA0RTF0dnFUbU5UaUVmQ2JvRmMwaTBQNlJteUxFNEpUb3Roa2JiTHV0MzN5?=
 =?utf-8?B?dGg2RWllUHlVWCtGTFgxRExnWDVkRitTUklqZTZZd2hEMC9uUE9Jd3BOWUdr?=
 =?utf-8?B?ekphcWJCdlhrR08xL0dvYmZBeFJHaU8vVVpRaENYYWxsRFBCWit4UUlaNmFI?=
 =?utf-8?B?elpUUUtXMGVDOGc0UjZtSXVxeW5WQTdUbU9CaDczMVphMGEvd0FvcTljRm5x?=
 =?utf-8?B?TjlMNnpWZ3FNa1F1by9uUUd0ckV3RmhFQWpWY3dWSVZCa3N4aVlDdEwvNDY3?=
 =?utf-8?B?bm9RRkFmL2dielJxblZFUHlpaXp5MXN0b2srN1M1K0ZXTExMZmhLdkx1dzhR?=
 =?utf-8?B?WnVXNzljOXNCYUI2aFRxNXhLOGVxWDlFeVNodW1Ic2tyUTdaQjBzZ2NPdkFo?=
 =?utf-8?B?WGx3Y05pZVNsY1FDb21PS3RVdG1MNFJmdGxuMVlrbktUeTJRRXJkM1VmMkhi?=
 =?utf-8?B?VjBZY1VDSjhuOTY0U1RldGJpdjU4R2lkeWJaa2JCa1QwUDdBcndmS1FNWTY2?=
 =?utf-8?B?bEdCNFp2emk5Q3huMmYxSXBqbUpzNzlBR2VKZ0VWWE1DcEttdDVyRHErQVFQ?=
 =?utf-8?B?bGZKY3RrWDZEOEgxaDZ6eDVZY0xJVUR6cGhrNVdPUUIweWZXRVJrb0ZrSklH?=
 =?utf-8?B?eCsrNk45bEhHOWFNNnowNW1uUEFNUFZXT2ZSVmZDWXF0MitRM21uY05FVnJh?=
 =?utf-8?B?TmVYUDFySXNNekZ1bXkvcHJYOUNWdy9ZdW9XOGUxSk9TUWx1Ym9wckRUVG4x?=
 =?utf-8?B?V3ZQU2FyYkxJRGkyVHF0RlVuK1ZtU1ltejZDZlpQcFA0NW14bVNOaFRLZFU0?=
 =?utf-8?B?d09DaUQyYkZJMVgrVzljRm9STkM1RTgxK2hpZ00xYU9MNEt6K3hGOU1CRHU2?=
 =?utf-8?B?ODAyelVSVWJEY1N2U213ZFBTdXo2djZPNHAyQU0zQ3dWZU1PeXI1SldXaTJn?=
 =?utf-8?B?eldrb2N4VjFQL0lxQlRyUFdlZUFmZXlSaXRnZ3pxZkhHQ28reVZPVXhibmdQ?=
 =?utf-8?B?TVZIci9KcjVmTDRwYmlOUEs5TWVka3ptblZMWVNuNWVrb2tDS0tiTWhrVGE0?=
 =?utf-8?Q?eqfMXSRzKKo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkgrMGkwQ1lkTDJIU0daSERoL0VmMGtNdGpZTGZSVFJSYnpLOE9DRGp3d3dk?=
 =?utf-8?B?anVpeGwwT1IvdklobU84YUZGekJDSk5SYk5TLytNb3ZtNXY4WkhseXB2S24w?=
 =?utf-8?B?K1F5Rk9Xc3F0VVlOVXpaTWROVm02VkhrTzJMRVhIN09mSnU4VWlpb09kNmVK?=
 =?utf-8?B?OU1KSVdnR1hFaURMTmFDa0tIajF0aVBYWnhmKzU4NVdtZW5JRWJxenFKNDBU?=
 =?utf-8?B?ZnBvQTJLeE1TYlBmS3crTkhiNzRIaHZjZDBGVFJxeGJ6ZXRyMEhJcjJtM2Vw?=
 =?utf-8?B?ZUJmdEpWZHE4Zi9GN0ovaDNxQ0ptUndNVDFseEEzZFNUZHdyVExENFY0bVQ5?=
 =?utf-8?B?SXhNZ1Nrb2ZHWUErSEpPY1pHOXdNOGh4blZZbnAyc2ZzQjUrdkh3ZTZ3N0dz?=
 =?utf-8?B?R2Zya1lKVHhUdUZqU2ZVMzVvVWxITldFVFJNQVJLaTUyc1Z6aW8wbytmdGxD?=
 =?utf-8?B?SlJtSENLR3N4ZC9XOWJGV0FzVTkzWTUvWDdmZkVHYzE5UmZxa05WVGd2U1N6?=
 =?utf-8?B?a1BGcGYrTUhJcFRVT21CeEVDRzZpYjNueEJqNEsyMjNCSUYyY2M5bTJPWWty?=
 =?utf-8?B?ckJvcjhNdiswaXlhcFE4QnlIR242Wjk2dFJNenNuY2FWT0YvS3h1L2VkZWx1?=
 =?utf-8?B?VUN3NmdJRFVwd0hxbFE0V3BkdWFnSzRtRmJ1amMySG5VUG1EbitkNUVRRFdS?=
 =?utf-8?B?TkV4NE92cVV4K2hMTGJzWWxzU1pzcUx2TCtpTDRXZnVxcWZCaWFadWhhMDhK?=
 =?utf-8?B?a05ISHhVK0p4VnhVT1NZakFXczVER1BVZUNUWE8xcWlPZ0dXeCtteGc5Z0FZ?=
 =?utf-8?B?MVhPY3Q4SnFQelNPWUNzemF0a0xManN3SlVjRXIvQnBray92bWxEY1R5aGpY?=
 =?utf-8?B?R0N4ZEhnMjRnWlAvbndDa1g4aFZ6Ukkzc0h5VUV0VW8xaUZVcU5jT1BVV0tY?=
 =?utf-8?B?akorK3lXbm95YzZKQm50QUVMamJibW5NOEZ3dVJOSFNNNTc1aEkwRExxSklt?=
 =?utf-8?B?cHh3bHEwSDNmQ2w0SzhRQ1pFNStTNDd0Y0k4SG5ZOHBGMWhDSVM3SnRnN3hJ?=
 =?utf-8?B?blVlY3FkU3N0Smd3ZktFaDY1Y1A5QVhyM0h4ME9SeXVyamlidmV6a1hFd0dG?=
 =?utf-8?B?VGVQVU9XdEJLYmZXNmhBNHB6TUxCbGpKeVJyemthdFpKSlN0ZytxVU80WHZB?=
 =?utf-8?B?anRvVGNMcTZtM1JOUmQ1dDRSRUwycWtBTWpZRzRjaXkrVURjNFNoQTFFZG1t?=
 =?utf-8?B?ZWpHWXFWLyttMm1lRFd5amtrVEl4UktrTmdoblEzamR0YmRia2FBSkxKSnhs?=
 =?utf-8?B?TU5KcUN1NnBTRFhCdGcyZVFzUkN6Rk5iaGRmVzJBZmlmNHlKUWRubnlrVXBG?=
 =?utf-8?B?bDQzM24zY0gxUTVMaVJHTGZwZ3FrMStJbUJONkh6akVDMUdlZDdJWHNSU0pk?=
 =?utf-8?B?Z0p5dlhDWVRxa1d1bjRIUzdyNFhDMHErcExVa3c0WlU2OXV5aldOOWk1dEpL?=
 =?utf-8?B?ei9iNVhkb01MZlJVcEoyWHBVMkRvY0tBdWtzMmJRSUovNHlidExYM0JZRWNY?=
 =?utf-8?B?VzR0OGtpejMrQVc3cXhSMloyMGkwTTMvTnhrNGRVNEt6VGJYRFBiK3l4cHBN?=
 =?utf-8?B?R0h0WGFveVVDNVRTSDhSdmQ2SnU3VXBrdzIreHVXSnQ1ZTNRSVlGbUF0UHVP?=
 =?utf-8?B?N0JkTVVUQUoyZ2pLemtWTmF3cXoxNEZxYklKZTF4WTVBb0J1TE1sMlBzMzlq?=
 =?utf-8?B?T1dodVZiUHFMcmJsaURTalVvNGhWZk9rWHdLNFhIQkFLSWxvYXM0d1BUZnlC?=
 =?utf-8?B?UjkyMU03TzRqUnBzcmg1MzluZ2JQNU1tY2JFLzlHWHZpUEVtSkcwbEs3aGMy?=
 =?utf-8?B?OEJIVjU3cE9FZ0F4TzlMNTJaSDFRSlIrSlEwSitVYTgvcU12b3hYdG42M3Ur?=
 =?utf-8?B?ZWtoTDVnNFNRSmVtMmwwQ0ZreW94NmIwWWxYd0xQT2hyYU40UVE5Y2N4NWVM?=
 =?utf-8?B?RE5NUVh4cUlCeTd6SHFpRTdFSE5KV1hsbDJ2REFROVBRclA1RHpkSzFkbGE0?=
 =?utf-8?B?d0VpdkJsN1krNEFxQTZGdWxjNXZGaGxtQldsY1ovRVE3VllOaVo3TXdMdFRH?=
 =?utf-8?Q?rrBI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80dfa0ef-829d-49d6-f239-08ddb400f272
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:57:11.9805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSUbWOsFF/+GtOKOOls2I3XOvMzrytUBi5fK+9MZQcmwEqleZhCACUzzJmkx/gsg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7068

Hi Reinette,

On 6/24/25 16:28, Reinette Chatre wrote:
> Hi Babu/Tony,
> 
> On 6/13/25 2:04 PM, Babu Moger wrote:
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 0a1eedba2b03..20e2c45cea64 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -52,19 +52,26 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
>>  }
>>  
>>  /**
>> - * struct mon_evt - Entry in the event list of a resource
>> + * struct mon_evt - Description of a monitor event
> 
> nit: I still think "Properties" is more appropriate.

I will let Tony take care of this.
Also, there is another comment
https://lore.kernel.org/lkml/b761e6ec-a874-4d06-8437-a3a717a91abb@intel.com/

I can pick up from your "aegl" tree. Let me know otherwise.
I am not in a hurry. I will plan to post the series next week.

> 
>>   * @evtid:		event id
>> + * @rid:		index of the resource for this event
>>   * @name:		name of the event
>>   * @configurable:	true if the event is configurable
>> - * @list:		entry in &rdt_resource->evt_list
>> + * @enabled:		true if the event is enabled
>>   */
>>  struct mon_evt {
>>  	enum resctrl_event_id	evtid;
>> +	enum resctrl_res_level	rid;
>>  	char			*name;
>>  	bool			configurable;
>> -	struct list_head	list;
>> +	bool			enabled;
>>  };
>>  
>> +extern struct mon_evt mon_event_all[QOS_NUM_EVENTS];
>> +
>> +#define for_each_mon_event(mevt) for (mevt = &mon_event_all[QOS_FIRST_EVENT];	\
>> +				      mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++)
>> +
> 
>>From what I can tell this series does not build on some core changes
> made by this patch:
> - note that resource ID is added to struct mon_evt and the events
>   are *removed* from the evt_list associated with the resource. I'll try to point
>   out where I see it but this series still behaves as though it is traversing
>   evt_list associated with the resource. Take for example
>   patch #24 "fs/resctrl: Add event configuration directory under info/L3_MON/":
>   resctrl_mkdir_counter_configs() traverses mon_event_all[] that, after this
>   patch, contains all events for *all* resources, yet resctrl_mkdir_counter_configs(),
>   even though it has a struct rdt_resource as parameter, assumes that all events are
>   associated its resource but there is no checking to enforce this. 
> - note the new for_each_mon_event() above. This should be used throughout
>   instead of open-coding the loop because the array starts at index 0 but
>   the first valid entry is at index 1. The above macro makes this easier to
>   get right.

Yes. Make sense. Will take of this in patch #24, #28 and #29.--
Thanks
Babu Moger
