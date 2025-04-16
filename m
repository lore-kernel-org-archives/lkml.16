Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453E51E5B7D;
	Wed, 16 Apr 2025 14:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812359; cv=fail; b=jbPM5u/5ripFmtuMkJcErfl/CJv+CdMYOi53Ony7ZLjdVC2iqoPBYl/Ol+NtSAXGYIsjtaWaPq571tqC2KbLCEB7t0tJLPtfRTGGDRTIzEZxdo7wJI52AsCwolyO6UgwkWg9Kg1D1clTPCaBA79DlsvrfLjdK43Suc35Oy2U8sU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812359; c=relaxed/simple;
	bh=WL24eyNxXSXINUUhrWvBtjdemMHfKmvaD4ozZxtEFcs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kEChxhELc7vPcTQV9Ypg0+AYckILv8htfh1IKqcWkX773v4kVF/iog1Zle/HX3+DQfU5gbe3JvRu9AObIunQy92923mlVi/4i3BXUvLgBlIatI51KPIS/f/oO16ZdJBdSrNTa4LGagvC/YuedYTA/bpW18xQXiPU/BoqyTkTg5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=k96ruHHE; arc=fail smtp.client-ip=40.107.237.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k96ruHHE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRnVSQppaHxo/s6NbaHz1uq2tXKZxWIauyCpHu42ICTcVcAjTh+AovjVaE3et2WGyos6Px9WTJa8CvTSkoE/XPZ09O7uYu0pfGMt4MpaheqAiWTjONTlV1f06QIbb9t85HDItZ/PWMp9RepY8X1s/2XNLK5lQdFdLSlwWmvx96kNWQ/6vWT8CkSH2q9+4jQczY05NPPrEeBYqV43waQnQzs/A0+gcm4jZoRA0l+SxN8jzNoQUhEvH+96sutR3KhZIBel1xovvEK/zvBGYwkKPU8z08PFdgtXo1ZrnSrutPCzW7KJUpt7qlHQ2HSeba5+zp5K1UjHdSWtUFXIOBBSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4u93gwgMWipxUu/nG3RutVKxsqqVsPoU8hg8uqa8dI=;
 b=C/Zn1pC1BmY/QYW6Soa4rs4Peo7GtA3tUoRUn0TptI7PEtq3npdAqStCaBlNedEgedd5VDNtSiQLI8PDac7rQS6YpzntxVAkRqspBQ1e75sjt0pspIJQ5SadHzuSVoHP8SzALkdOX/tBE5BYj/HWj9nHIalqO/Ulm2z8o8Cg3M1JLtBMAMN4that6j8hL+4t4T1OurMmgva8aQsod9LYMb228SkozwF00AzHxfHbwXMk+pg3aOVmBS3vMejRz2YOvtszsvLTTlhSh8ZSuu7hV9Q+7ToZEzTPdrfplXMeHCrkZTx/4+DBCun1DVnwZeoYQxrhE6jy8hWYIVvv2fRiRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4u93gwgMWipxUu/nG3RutVKxsqqVsPoU8hg8uqa8dI=;
 b=k96ruHHEIiUTH2SOD+N7JdDxZj8H5wXEgsrmfxD96LviHDt3vjy2ufZOZnY6OHfqy1Q7XIEADB/7Qg0zpNAaU0B/2Is895qBsyMKMjCiYHBxsZuvs9Qlm5GvdjkrGzEj833jhXNZbfZ6ntyW8mYiUFhnrjnxfWSbuSCYQjyd+ZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN0PR12MB5740.namprd12.prod.outlook.com (2603:10b6:208:373::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Wed, 16 Apr
 2025 14:05:49 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 14:05:49 +0000
Message-ID: <07b00d5b-6db2-417d-8b1e-865246aa4b39@amd.com>
Date: Wed, 16 Apr 2025 09:05:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 08/26] x86/resctrl: Introduce the interface to display
 monitor mode
To: Reinette Chatre <reinette.chatre@intel.com>, babu.moger@amd.com,
 tony.luck@intel.com, peternewman@google.com
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <272948ba495f51acf707d48ef60d0ba35b4417a1.1743725907.git.babu.moger@amd.com>
 <59829882-20e4-4b94-ba46-8fa622841857@intel.com>
 <4fc02936-237d-4060-86af-79efc28a72e5@amd.com>
 <ab9dd51d-eb22-4295-a11d-2dc559fb72a6@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <ab9dd51d-eb22-4295-a11d-2dc559fb72a6@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:806:27::31) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN0PR12MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: bff8c768-bf66-497d-b095-08dd7cefca4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWdvM3VqQTg5VlIyZjg3aFB2WjZpUnZQNzhYdGptS0ZkQU95UG8xdUV4R3Vk?=
 =?utf-8?B?bWJ4MkErdjFJU3YwVTErNDdVMDBZallaQWh6a3FqWjJCOUoxcWt3enFEZmN2?=
 =?utf-8?B?dVJueE9qaHhmNTdMRzdLYlpISFFHZytTb0lsT0gwaElGN2N2ZE1tQUFmVVpP?=
 =?utf-8?B?VktmZTV3eU9FSk5HVkZwWHZMSm9Qcld4U3lvREJxbWdqZm5mRERsd3VTTTZw?=
 =?utf-8?B?T3FycDYySjhYMkI4a3ZWV3JiYWJYclAzcFU5d1NBM0VkUjZMYWlIYi9ETzZF?=
 =?utf-8?B?TXFrR1E1bFVWRWFRWStDS1h5eW9YeFhxT0VxTlRpbmZWZExMaHZSMW0yRWFh?=
 =?utf-8?B?QW5oVURNNlRuN2dKbC9FTWxwbDNqbmZ3THhDNitaWmxEOHJKZ3BSVjhpbnQ0?=
 =?utf-8?B?V1BON3g4SThobFJiS0N0K1VmdFZNWUwxTWdRNHI3M2ZId1BDS2Nld2JDRGlJ?=
 =?utf-8?B?bjlwWkU1TGpySTFlU00rN1dJRW5GZVlWUHE5elJ6bTV0N1lyNUFwVm5idFBw?=
 =?utf-8?B?WTJ4dURZSSs1RndINW1NTXhxWkdOVERXQ2NyQXJVNmN3T3NzZ2ttMFArODJU?=
 =?utf-8?B?WmFhNUFaaWlKOFk1SkdPQk05c29uSi9EUmdUdDVhNHpSVmhleWUrWXFKWXFJ?=
 =?utf-8?B?dUY2YTVhNXRjWTZleXU5d1loa2d3RnJXelRON1RpOFJ6ejBrbGRRMVVzOHpQ?=
 =?utf-8?B?OE1mUzRUbWFMQ3dSOWJHS3J4bGpVL0hpSmo5bXFZTWJUSE1xR0Mvb3c0NlRo?=
 =?utf-8?B?T1A2dC93S3premZwRTd4RUhOeEdGWWRpYlhTTExmZlUwWWVncFRIRzBXazVU?=
 =?utf-8?B?bXhXaEFRL093UElZMDh5cHFlc0lnOWluOENIQUUyZFdJTko0THdnQW5vL25h?=
 =?utf-8?B?Q3YrOXdFSmhmblBzcmFFVkd6RTMzVEYwUFlBWEdzTHN6bWRCSG1VMWFpTTEw?=
 =?utf-8?B?eUhzSEVqNTBCMUhDTHpDL0NUSThPdkFVUzI4aysvK0NxdTdwcXhibnhKdDBV?=
 =?utf-8?B?YThKOEswSy9pSExxZThYK2ZlSnl4QjJCQmlZU1d2TXlHcFRGZ0xUK2hHN0lm?=
 =?utf-8?B?enpwa1VlWUJadVRWSVVSOHlTcnU1dFJMR25WNXlKWWl2blVrc0Zxc3Y3OHBG?=
 =?utf-8?B?L1BCWkNPbitMRmJxdVExdTZtSEVvVXNpRW1nQjdReXF6NWY1Qno2aXFlS3FC?=
 =?utf-8?B?T2lPRUowUlZwVjMrRlgwTW5OeGpGdjNpelpIQmg3Q0loNlBING52ZEFQRFZP?=
 =?utf-8?B?RE5JREZPS2FRUFBmN0R4Q2hoUEtNbDZVd2ZjcDJZVnFlMFM4QzBuMFFoeGkr?=
 =?utf-8?B?M0gxb3hlN2hHaDNub1hsQTBCeVV4TnQwdHVaYzJuODRObnFWMWhDeWdKQ3VC?=
 =?utf-8?B?ZVBlemU2WXI5aXlVaHZIL0ZVWEJpSkVUMmVBdlp5VlByZVRZWG9oYzFFWWY3?=
 =?utf-8?B?eUFSN2hhZWE1OVhpL0pYSVhBQkxPb3IyUVBkQWYzK2ZFaVVLaVBHbU4yRDZ6?=
 =?utf-8?B?dzNmUVNQcHljZ1UrRXdzOWRlT1JxdU40QU5zK0trdUJtZXdVUnp6YkFkc2hj?=
 =?utf-8?B?cEEramtpK0Z0RFozY1hEVWlKV1g0TzlSVmduS0hHVTVvSHprK3k5VjFzb3Zs?=
 =?utf-8?B?Z0Vwb3JHY1AxUk13eit4blVITDM2dGhDSDlmRlFFeVFrbjhHNWt5QS9JNDZs?=
 =?utf-8?B?ektKVmRTN2FiTkJ1Y3cxOEROMEdjcVY0UXM1UWttcmdIRVJyVWxEaWpZb3FV?=
 =?utf-8?B?ZXV6S1VEM2tCZVhmY290RzhNQ3NLbkdMQTVMdU1sVDZUQVZTQXBnZWpSUlFU?=
 =?utf-8?B?a3FBZU02dFg3cFpyejF0V1doTzBGZy94UGRldTVNT0YwWUlYSUgrL3dSakg3?=
 =?utf-8?B?S2ZjSXE2dC9ZOGZFaHlFUWZHem9sR09GNmRDS3ZtYkt5a2dNVXVJcVhCays2?=
 =?utf-8?Q?tbRQ+WsPSRc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHdFOEFqREJqN0Nma2oxUUtEdTV2Y0xuY0wxd2s3ZlNuUnFVSi84enlGbFZv?=
 =?utf-8?B?bmJ4TVZhZy9WbG9nSVZoZFZRdG1CMGptOWhiYkd2YzZyWjNRWjY5bVoxUzRK?=
 =?utf-8?B?ckhKbDVvbVoyWFBBc1NjWjZpQjhHKzVlYUhwRXdwL3BUTDRHclpwbDA1VlpT?=
 =?utf-8?B?a3pOd2tCeHZmbWVrY2dQVFV1MjNVbHlnYWd6RVlmUTF4dUZ0NitHN1R3SXNZ?=
 =?utf-8?B?SlF5bHZIcStVSEVwVDlBSHJXSEpXSVVxUEh0UVovYitVY3RSeVZEWlp2eUR6?=
 =?utf-8?B?OXBGR0p1cWZzT2xPRGIweDh6YnJRaWlMRTQxTnlWWUpLajJyTDRFekUza0hE?=
 =?utf-8?B?dU1IME9wQm01cFlaZkt0NHBHMS9QYkFlQkVaSXpCZm1tKzZqTEtyV3dqa3hu?=
 =?utf-8?B?L3Nxb1p1cTNOSnlHWHN3ZjFyd0lhMmNvbHRuQ1dybEZRaS9adU9LR1BYZm1z?=
 =?utf-8?B?RStrZ2V2anU1Vis0SWU4cGR0dUQwZmJ6eTkxRS9xVWZkVGMrYlJ4YitYWEFl?=
 =?utf-8?B?L3FQU05HUWdoYmVwOThJS21KNUNRTTVSK0tEMklZM3lodnRORnV4YzNCbVZk?=
 =?utf-8?B?bjRrcDkycitSWWUrODdFeXN1b0t6SlF6dGJTV2FLRDd5V2ErNjhtVXg2QThS?=
 =?utf-8?B?TCtJbzNGd2lRTVFLeHErbXZRYjRGU1I0RWdENGhVNTRYc2FZUWZpcTZmaEdm?=
 =?utf-8?B?dk1EakRlT2wwbysrYUZQVE4xSFY2RHpjbk5jeXdwSmR6NXowL3NxNk0vWmor?=
 =?utf-8?B?T3Nkck9oanNQcDhiV1hxOVdKbGthUjBPejlsY2tlR1l6bU4zSGVIaHZneEJw?=
 =?utf-8?B?NmpEb1Q4MFBmcFNUeGVtTHpNTng3THoxaml2c04yOVI3ODZsT3FWNDlsdi9K?=
 =?utf-8?B?d3R4QndSemZoSE50UHY3Qm56Q240ZWZVUytQdnZPY3VjdGxDTWdZc0ZuVEJ5?=
 =?utf-8?B?ZkZ6OWFaZ0FRdzQ3empiSEhWakJXU1hjbFZKcTRsSW9KaUhVMkFmSU9xR3o4?=
 =?utf-8?B?ZFpRUjZJaEVwUU0xVzhrSHlkYnZMUUZQRHRzUUpJUndqdFF2WE51VEE2eW9U?=
 =?utf-8?B?L2xSSEZObzlZK2pvRGtjVWJBanl3ekFHUDlkNG1hdjlJbjFyL0thZEt2RE85?=
 =?utf-8?B?TTFNbVJqRW1hbGNYVDIvSzA3VW1ZQ2VBcHpiU1hCNkdKQ0xIQ21ncmtZYVBH?=
 =?utf-8?B?ZUlkSm5UcGRzMGROWDJzdUp6QTdrMEx1Qmd4V0QvblozbVVvQTBsdXZrS01W?=
 =?utf-8?B?S20wdk1LYlZjdWlXa1BGQXQrbTlGREx6Sll4WHRkM1dGcUF1eE9uZWpFUk5F?=
 =?utf-8?B?UUxycVhKa3FKUFVqYXh1QVd5OUZoTzBDSkZjV3R3THE1c0JsSGhScVA3d3FM?=
 =?utf-8?B?WWRqUkh2UTRXUFpmUGErZ2xzZVVDOVh6THA3dWNleENaa0xtbkwzd2VVVW43?=
 =?utf-8?B?aXYxSzY5UUZLZEVIY2Q5RVlMNld6UzRvSzJ5aVo3NTErRzhDVWg0cnlLSG9W?=
 =?utf-8?B?cnQvc0dzaHRSU3ErSzFITnA1QUtRNmNqTGZsdS9CY2Z2ZGVPczlxVXdJY2hq?=
 =?utf-8?B?RDc4bnc4VXNJWjVPV0ZpQm5sKzRjVitwK0ZMUUZRZ0lxNDJMWElycmszdUNu?=
 =?utf-8?B?bjBTaEduaTFPTjVpTUFzNXpWQ1NOMzdWMDNlcEFHeWdyL0hjb0poajU2OVhY?=
 =?utf-8?B?MXlCTHQ2a2MrSlJaMFVmS2Ewb1B5TFRySlNZaitITGp2Sko1MkRaM3NxSStw?=
 =?utf-8?B?WFRBSGZtYWtSVFA4T1ZuMCtMeWEwMzlOMVVMUE9XVVBPcGZNb0VyeVEzL016?=
 =?utf-8?B?bWRGUW1veXJiSi9ydHVJK09Dd1VJR0RJV0hIS092Q0ZjRXpYdkRDSzlVWS81?=
 =?utf-8?B?OXdFRWZidzdaNUh1ZTcxTVFpUEowand1MUhHM0RxSEZGL0dCNk9zRHM4clNk?=
 =?utf-8?B?alJxUi9VcmVZYWZuQXBrcDNmUG4wL3l5TG9pRTVoQW9oS3RSSnhuWFRBQjBN?=
 =?utf-8?B?Y0d2NS92SnB1WFo2UjNoTU80Y3FUeGFJSXdlSjcwQ1JRN1Y2VlJvQXFCU0c1?=
 =?utf-8?B?S1A5VVNLRHFXWUpwZktJZGtuNEtXLzJOaEovRjRUVDJ6aTc1elBUaXlhWmxY?=
 =?utf-8?Q?5fnw6VTSekS+5sYdMBBKO1ZVO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff8c768-bf66-497d-b095-08dd7cefca4b
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:05:49.1671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJ27UjVByrHkepUcTEjIFaPsAWMkOFQ7zuBreElen4Mo8hrszLYK1d64Db9WkBw5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5740

Hi Reinette,

On 4/15/2025 11:22 AM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/14/25 12:52 PM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 4/11/25 15:56, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 4/3/25 5:18 PM, Babu Moger wrote:
> 
>>>> platforms. On x86, CONFIG_RESCTRL_ASSIGN_FIXED is not defined, whereas on
>>>> Arm64, it is. As a result, for MPAM, the file would be either:
>>>
>>> CONFIG_RESCTRL_ASSIGN_FIXED does not yet exist anywhere so this motivation needs
>>> to provide stronger support for why it is used before it exists. There is a precedent
>>> here with RESCTRL_RMID_DEPENDS_ON_CLOSID already used while it does not yet
>>> appear in a Kconfig file. I would propose that this is motivated by noting
>>> how it is already understood how Arm supports assignable counters this was recommended
>>> by James to prepare for that work. Since this is user interface this
>>> work is done early to ensure user interface is compatible with that upcoming
>>> support. Also set folks at ease that IS_ENABLED() works as expected with a
>>> non-existing config.
>>
>> How about this?
>>
>> Add IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check to support Arm64.
>>
>> On x86, CONFIG_RESCTRL_ASSIGN_FIXED is not defined. On Arm64, it will be
>> defined when the "mbm_cntr_assign" mode is supported.
>>
>> Add an IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check early to ensure the
>> user interface remains compatible with upcoming Arm64 support.
>> IS_ENABLED() safely evaluates to 0 when the configuration is not defined.
>>
>> As a result, for MPAM, the file would be either:
>> [default]
>> or
>> [mbm_cntr_assign]
>>
> 
> Sounds good to me.
> 

Thanks

>>
>>>
>>>
>>>> [default]
>>>> or
>>>> [mbm_cntr_assign]
>>>>
>>>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>>>> ---
>>>> v12: Minor text update in change log and user documentation.
>>>>       Added the check CONFIG_RESCTRL_ASSIGN_FIXED to take care of arm platforms.
>>>>       This will be defined only in arm and not in x86.
>>>>
>>>> v11: Renamed rdtgroup_mbm_assign_mode_show() to resctrl_mbm_assign_mode_show().
>>>>       Removed few texts in resctrl.rst about AMD specific information.
>>>>       Updated few texts.
>>>>
>>>> v10: Added few more text to user documentation clarify on the default mode.
>>>>
>>>> v9: Updated user documentation based on comments.
>>>>
>>>> v8: Commit message update.
>>>>
>>>> v7: Updated the descriptions/commit log in resctrl.rst to generic text.
>>>>      Thanks to James and Reinette.
>>>>      Rename mbm_mode to mbm_assign_mode.
>>>>      Introduced mutex lock in rdtgroup_mbm_mode_show().
>>>>
>>>> v6: Added documentation for mbm_cntr_assign and legacy mode.
>>>>      Moved mbm_mode fflags initialization to static initialization.
>>>>
>>>> v5: Changed interface name to mbm_mode.
>>>>      It will be always available even if ABMC feature is not supported.
>>>>      Added description in resctrl.rst about ABMC mode.
>>>>      Fixed display abmc and legacy consistantly.
>>>>
>>>> v4: Fixed the checks for legacy and abmc mode. Default it ABMC.
>>>>
>>>> v3: New patch to display ABMC capability.
>>>>
>>>> ???END
>>>> ---
>>>>   Documentation/arch/x86/resctrl.rst     | 27 +++++++++++++++++++
>>>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c | 37 ++++++++++++++++++++++++++
>>>>   2 files changed, 64 insertions(+)
>>>>
>>>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>>>> index fb90f08e564e..bb96b44019fe 100644
>>>> --- a/Documentation/arch/x86/resctrl.rst
>>>> +++ b/Documentation/arch/x86/resctrl.rst
>>>> @@ -257,6 +257,33 @@ with the following files:
>>>>   	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
>>>>   	    0=0x30;1=0x30;3=0x15;4=0x15
>>>>   
>>>> +"mbm_assign_mode":
>>>> +	Reports the list of monitoring modes supported. The enclosed brackets
>>>> +	indicate which mode is enabled.
>>>> +	::
>>>> +
>>>> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>>>> +	  [mbm_cntr_assign]
>>>> +	  default
>>>> +
>>>> +	"mbm_cntr_assign":
>>>> +
>>>> +	In mbm_cntr_assign mode, a monitoring event can only accumulate data
>>>> +	while it is backed by a hardware counter. The user-space is able to
>>>> +	specify which of the events in CTRL_MON or MON groups should have a
>>>> +	counter assigned using the "mbm_assign_control" file. The number of
>>>
>>> "mbm_assign_control" no longer exist.
>>
>> The user-space is able to specify which of the events in CTRL_MON or MON
>> groups should have a counter assigned using the "mbm_L3_assignments"
>> interface file in each resctrl group.
> 
> I think it can be assumed the reader represents the user space. If doing so
> this can be simplified like:
> 
> 	Use "mbm_L3_assignments" found in each CTRL_MON and MON group to
> 	specify which of the events should have a counter assigned.
> 

Sure.

>>
>>>
>>>> +	counters available is described in the "num_mbm_cntrs" file. Changing
>>>> +	the mode may cause all counters on the resource to reset.
>>>> +
>>>> +	"default":
>>>> +
>>>> +	In default mode, resctrl assumes there is a hardware counter for each
>>>> +	event within every CTRL_MON and MON group. On AMD platforms, it is
>>>> +	recommended to use the mbm_cntr_assign mode, if supported, to prevent
>>>> +	the hardware from resetting counters between reads. This can result in
>>>
>>> "from resetting counters" -> "from re-allocating counters"?
>>
>> How about?
>>
>> "from resetting MBM events between reads"
> 
> With more detail, how about:
> 
>   ", to prevent reset of MBM events between reads resulting from hardware re-allocating counters"?

Yes.

> 
>>>>   /*
>>>> @@ -1908,6 +1938,13 @@ static struct rftype res_common_files[] = {
>>>>   		.seq_show	= mbm_local_bytes_config_show,
>>>>   		.write		= mbm_local_bytes_config_write,
>>>>   	},
>>>> +	{
>>>> +		.name		= "mbm_assign_mode",
>>>> +		.mode		= 0444,
>>>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>>>> +		.seq_show	= resctrl_mbm_assign_mode_show,
>>>> +		.fflags		= RFTYPE_MON_INFO,
>>>
>>> Needs a RFTYPE_RES_CACHE?
>>
>> I am not very sure about this.  This flag is added to the files in info/L3.
>>
>> "mbm_assign_mode" goes in info/L3_MON/
>>
>> The files in L3_MON does not have these flags set (for example
>> mon_features, num_rmids).
>>
> 
> My assumption is that mon_features and num_rmids are generic monitoring
> files that should be supported by all resources that support monitoring. When
> resctrl starts to handle resource specific information then it should be
> clear what type or resource it applies to. I understand that this may not
> seem obvious since resctrl only supports monitoring on L3 resource.
> 
> Another view, consider existing code in resctrl_mon_resource_init() where
> the MBM configuration files are made specific to RFTYPE_RES_CACHE. I see
> mbm_assign_mode to be very similar to these.
>

Ok. Sure. Will do.

thanks
Babu

