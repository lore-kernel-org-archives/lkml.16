Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752A98C0B;
	Wed, 14 May 2025 01:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747186519; cv=fail; b=Rh6tji2mpm3/tkYEa/r1ghXug/qcch557cgqny685U/JXiP+KZYosT2BquTi+4dCjvxvw/eXz95VblrY3cRjJKEPOApz85jGq8p2AdR9sk5SbD2UhSOoGR1pdanGYUamR567T4ljmzaPcMcMgl816CuJMnTSXiYUTySh3U0JGTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747186519; c=relaxed/simple;
	bh=uVOQHjtCtYzhW6LhYNtCwfknwhBDCae1V+MTaUKMrs0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FKNwInWMcg1i0UrzkWSr+YRPckAKIReAG5DEw3chSkUuxb4c52/qtrgs2KWgS+qtqRJXqc9/8z8bJk8Mc+5+jwRGsJZE+PCP1Yp3Uyx45morw3Qmsyp3wW3H30qanubXF1K5WAFyQ2uxAMmkLiSAB+gjIo1uPirF+UbOzTLWjk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E0e38G018891;
	Tue, 13 May 2025 18:35:03 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbca0e77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 18:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXSZ/FdT7A93opuS4fXd3ePZnINeJLnoc+P4j5VAtEE8TEREaD5kokcdjaYJ59uePhwwsW16mJXbKTHMZKnexcVF8cOWN6JnaQbLoqBWU9FfpZCQzVVCeSf9bA8g9SMP/zbyNVjY+KitBC+RZX7qVHjFXPpLfV8ZkOcoLFmXyi+UbhrxUJyrkQ53g+JX+qI6e3D2aR5bL9bWlF2XZmzxdd3QRSQrik3XivkRDlIPeDj5GdyCHbDBJ3UQeP8VsZ6Hz/E9GGi/gh8zmZwssrt22PdxfqjrdoCuI/nyXHBDuIoevrTQOssTfNkvtgPf4kzIt7WWqnvG5oWy7X1cz5YAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Qnz/D2rMs0MNmweqxuAWDi3C5CwDL4Yn69dnLStVXs=;
 b=pT21mKhewQbUZjw2chfuB7R9AaSjis8qDh8rKczFdZRBnSkqNrQlBl6P1tzcNyAiyi23qHze+sZpe7I4ngncZ9WFsWRylR4K8TCdzkS/Z5ckgvSHaQoYZnReHSC4qJ+57gnl3fILl4Kf4L84blEtmdg31ILXkUSdrx0l51UJGIcY6cOjCUL0/9MCJCqJL4klaVgqt7aXrXkhsKrnLShWU5NhnxOrD1Nz8UyQx4c8+8I4jiuvQzueGZnF42OsfGHUj2xs9WOHm59RDB5HsOei0dsg6YNbi0FgwOPco+ZX283g449hot6hBbduJDD4fWTwuXZXs7AO6TqDrTIImlPONg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB6566.namprd11.prod.outlook.com (2603:10b6:806:251::6)
 by PH0PR11MB5831.namprd11.prod.outlook.com (2603:10b6:510:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 14 May
 2025 01:34:58 +0000
Received: from SA1PR11MB6566.namprd11.prod.outlook.com
 ([fe80::f252:fa20:5468:df48]) by SA1PR11MB6566.namprd11.prod.outlook.com
 ([fe80::f252:fa20:5468:df48%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 01:34:58 +0000
Message-ID: <101d3fc0-0cb4-444b-9c67-9142610ad1dc@windriver.com>
Date: Wed, 14 May 2025 09:34:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: fix slab-use-after-free when
 clk_core_populate_parent_map failed
To: mturquette@baylibre.com, sboyd@kernel.org, dianders@chromium.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250425052358.684022-1-yun.zhou@windriver.com>
Content-Language: en-US
From: Yun Zhou <yun.zhou@windriver.com>
In-Reply-To: <20250425052358.684022-1-yun.zhou@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0021.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::18) To SA1PR11MB6566.namprd11.prod.outlook.com
 (2603:10b6:806:251::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6566:EE_|PH0PR11MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: a54fb547-a599-4894-7787-08dd92878999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHo4ZXZZSHR4RjFhamFyaGdRUDdsNTNsQ0lXbW1Nall3L2JpWmJWTE1KVVZl?=
 =?utf-8?B?K056R09kWFpJZlVpS21pQTFUMEt4YWdrWWFTcjJlTHJ0cjBXSVpZUUQ0SG82?=
 =?utf-8?B?TnJCQjBxYlB2Sm5iOVRDSkcrS0ZZa1gzVTlaZnNnc0VzRkRaSG9USWlTKzRU?=
 =?utf-8?B?TTJKUVAyaGdIM2VTeGFPNUtFbGpVMDhXR0FxSElHdU1QOGlqcDd1aDlmTi9h?=
 =?utf-8?B?SDZ1bm95akRJZ3NxUUcwbGxyVktVTzVXZUY3QnhOWDNUUHNvM0tEL2ttVE9X?=
 =?utf-8?B?OWltczhzbld1YmErNEFLdWJLRm8zdW13Wm9TQUFpRmhOM0ZxblJZVlRNUGUw?=
 =?utf-8?B?N2JiNFYzQTBadDlHZnRmNjBVVkJqVEhYVmtJQWlYOXM5TUo0S0REbjhlSjBK?=
 =?utf-8?B?bUpNdktsQUsrV0JhYkdqajQ4QWVobGM2UnJTVU9hYk9SUVZ1ajB0VE9FWC9q?=
 =?utf-8?B?Mm1QZTFISHBUNFN2MmJIZGR4a3d1QWF3UERuY01nWVA3NVFXdkdWSTFqZWhC?=
 =?utf-8?B?eWc5emJHS2h0VFg5K2FqRkxGUGh6eHV4Y00xdlhKYVZHd1NqeEMvVXJUa0lw?=
 =?utf-8?B?SXhnQk0wVXBpcEJ5RVdZWGRzdFIzZW03L1RrclFiS1F3V2ZtaWZXenBnUW1F?=
 =?utf-8?B?VmNxem9jVWlQRXpvY0tmam80SUJEb2c0ejdVeEE2ODlWeDJuaVlDWjF2TGgy?=
 =?utf-8?B?UzFsQjg4K3pBTU5EVXF1SE16Y0RUTDdaS1BSWENwVmhjSVVsak5OditCU1lp?=
 =?utf-8?B?bFp6U1YxSFYvQ0thWSsxQVZxMXRsRTlPNU9Tb3gwWHFxV0ljdStFallVNDRz?=
 =?utf-8?B?Rzl2ZDRack5nKzBkcERmK2FTcXJwVlBTYXVVZjVkUXlwK1owaGR5amdUWDM5?=
 =?utf-8?B?S2puSUJmdUtXUDZUSjNPTHVaZGtsa29za2R3c2Q1dW91SldyOTc3ZDF1OG4z?=
 =?utf-8?B?Q1BRRUFtRm8rTVZ1V1hUY015bEhJSU0zM21PdE0zajVhTDRFY2VzOFJ5TEMy?=
 =?utf-8?B?Z3NrSTRPdVgyZlYzVGZDZjZrSWwvMm0vUGs0N3pWemlEVUx4YlJnSm14QUV6?=
 =?utf-8?B?VWxSNStxa3hveURKNDR1Wmh2dDhhUGZ0b3ZsbWZwa2NPUUxpQ0EyUWltRld3?=
 =?utf-8?B?MVNhbXptanlHRkZvRzduSGVGc0N4aDE4d1VlVEFxRUc4cGpzZmxGZTZXNFVN?=
 =?utf-8?B?YmVNaytNTytubVZ6OS9xeXVaSWJTdFA2NEFYMFp0VUc1T3BrMWVtcEoyaHIz?=
 =?utf-8?B?ZGd5NzVDcnptTXhPaWVVY0lMM0F0dG5JM0RTQ09XVjhkM0pHd0RHNUtsZXF4?=
 =?utf-8?B?SmhHbmlyYTVrMTV5Wjhwc1N5bC9EcnZsTS90aDRQcmFYZ1R2aEZMUGIwMXo2?=
 =?utf-8?B?azdDQkNUUGIreU5WdXUxQlBoT0ZqUWR6dWloRHZGVWNUbEROZ2QxVHpPaVRi?=
 =?utf-8?B?enRFdVBlN3h0UUZXdlNhc2Q5RzJvYndqYUJGY0ttbDM2czFlOFlGVU81aHpk?=
 =?utf-8?B?YjJPQ3U0Ylh6cXd2RXpJNXVvMGY3MllGQzJpcVlWby9SREZ6SWRhSHdUalpY?=
 =?utf-8?B?c2swcW9aYVZuUjZ0RDIwd3NPNHk3Q0J4T0xmNk1BU1UwbHNoMzZkdUcvUXcr?=
 =?utf-8?B?ek5vZ05wQzJGZ3VZbDQ5TmJieHJ1NTA5RmcyVGcyd0srczJpU0FxZDYyTUZu?=
 =?utf-8?B?bmFGOFl5bG5SUGp1dzl0RVBScGpKeitCWisrY3hQZlExUEJ0K21YYTBualJW?=
 =?utf-8?B?cENWeVVyMDB0WUwvSzVjaElPeXJuVy9Nd3g3UWRvbnUwK3E4aVRwemhkSVg5?=
 =?utf-8?B?NjBsMGFXWjlEbDJWbENqN0dmVkpkMUZNY241Y2U1VUpvaDdYQzNrbjUzS0FI?=
 =?utf-8?B?S1dpVk9icDRNOFRJWHVkWVhMdjJvSWJveU15ZlNiZk9heTZhQzUrekNFcHRU?=
 =?utf-8?Q?aKntzpBbD8g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXRtVFJ4V0RrYVBDQklobnVwS3N0Y2pkUk9USkZycnBKQzlxZXQ3NzQxL1hG?=
 =?utf-8?B?VlFZb0hTcm42Ty9VVXZCOFM0SnpybkM3UkZTSll4eGZoVEJsM3JKa3pmRUto?=
 =?utf-8?B?YXlXNXhrRlh6TEJlejFxYk9COCtsZFRqKzh6cEJrS1E4UEhQdThXYVhUYkJS?=
 =?utf-8?B?UmF2VGRQQlBqL01ld2ZEZ0prbkt3ckhSaU9odGVnc2xtRW1qRVdYTUhXTGMy?=
 =?utf-8?B?cEFYOXJJaVk1NzRoZFpFNW5aTVYvSk9lY2lBRVZER3F6R2R6SThMVlhYSmt2?=
 =?utf-8?B?SGk1eEs2VDlsQndiZVF1MmlQTmU4Uk9OaE1TZFdYeldqR25vRnY0VzlmS1NW?=
 =?utf-8?B?YXVzbHJlaDU0Z2Jkb3RWNkdmWit5SHo1QmViVU5KSHBSQmw4YWhockpKcmY0?=
 =?utf-8?B?R3lmNlpNWjZLUzg2ZjRmVjdQQ1psSWprZHNPY0I0RW5mSk4wb1RIRmRNOERK?=
 =?utf-8?B?VU42dDk2aWYxVG80UzBPTnRHTm81eGZjcFdQS3RnSjBRelJtNTVSR0RQb3By?=
 =?utf-8?B?anMrUEZnRWZPOEdDN2JwU0Q1OGxpc0I2Vlh3RndqcFVsMWRhMDJYTDZiQy9G?=
 =?utf-8?B?K2lhbXhOR2dYUVRaMDJ2ZEY4OGdHclAzbGtpbjJMTHVkbVdLZzdWNk1ZUjBl?=
 =?utf-8?B?Sy8rZk9vK0xGczZYV1dJZ2E3ZzkyVE9sa0wzcFdhSGNORWpCVzRyV3JqV0t3?=
 =?utf-8?B?MStMYUQ5V3NoZWxVbXp3Y3lsMUVxZTJWdDVhS1JHZ2piUkhzWjltcGwybjU0?=
 =?utf-8?B?K0pWYU04aUFnbmVia0M2bWZ6UERBNG8yeUkvZ05JN0NpZXMrR2pER2hscHBk?=
 =?utf-8?B?ZmxkYkQ2YXRPdUxOZmZTYmpGRFhkSkk2dWIxR1hpV2JQbVluMjBPbTZvZzFU?=
 =?utf-8?B?TWRuWThwNnFPemR5QmY3dlRwWDhxNXByWFVJb3J5TVFRWW9tdXNKTmRRS0ZZ?=
 =?utf-8?B?QzZJTEl5MTV0ZFdSdWRmM3dkQnFJQ3hmYmRkL2RYZVE2TGlQUmwyS2FDYW5k?=
 =?utf-8?B?UFNNcnVJKy9WUGdMYnE2YXlJYmhGTkhRSGtZcGM0cFQyTC9iMTVuSUtLSW5Z?=
 =?utf-8?B?Tjl3UU9LQXQ3SU13MlVtNlozYzVDNjZJekpWRitWcEZEaTY3NVlkMmplTW9F?=
 =?utf-8?B?ZUp6U05TUytycXlsS1BpYmJOUnl3SzF6ZnBpNytuUnNZSTlMY3RZbERTWHJa?=
 =?utf-8?B?UG5UU0VWaXVDUlhZYndTYzd0c2N5M3RzUnJUYjEvMTNJbmVuVWZRb2FtbGZM?=
 =?utf-8?B?eUpNeEg3d05DM1R3VGRkS3ZjRnlrYmFTOTgxNlNnZmx3WlNNT3NNZ0hmYTcv?=
 =?utf-8?B?cXpkOWtYOWVBcnF6ZVZackE2VEJVZ25tZk9Mdmw4b1FZRmFKYTBCNng5eXFa?=
 =?utf-8?B?TDlVWnVpU1lBQmJUMElkZ3V0THZQSlQwQ3JZQ0dTU3ppNDI5TEZGd0FTRmha?=
 =?utf-8?B?SUpRa3M0RG51RGhEMnFmK3pySGJoQXNuWjhlZE5TWldBWDQ2Z3ZUVi9NeEkv?=
 =?utf-8?B?M0kvZ1FGUFdqbHduQXZidEFFdXZwUWhEL3JIUEs1QkRMVWFZbFJ5YkpGTUdZ?=
 =?utf-8?B?M0piTG01eUhIbnpkcTk2Rk9NMDFMRmIxbkdVcm5XY2x5V3lYcWVKNmhJQWFq?=
 =?utf-8?B?eTdaQlZ5T211L2hTUC9RWEFDdzJzZnhWekZySmNBL2VhSGRHV21hQVZUV0VO?=
 =?utf-8?B?SGt1WFZUakNlbGNmQW9vRFVLOWFoN3BMeVJ0K1FRdHVxOENDb1RNWmwrQ08y?=
 =?utf-8?B?YTVuWC9aMmRjdmFOaE9mN01rTHVOR3JRc3RwSFhjdGE2WUw5dkhVSlNDdkt4?=
 =?utf-8?B?WkZtaVBDMDhIWWl4UUFUMys5b0xzQTNRazNINFU1MUY0UlpDWC9LQTh0SXkz?=
 =?utf-8?B?OTRXdEl4QUdLaXhKZVZ5SXNyV1c1RkxSTTJ3VldJa0JOa1BrWHEySnVjM2hS?=
 =?utf-8?B?VTZjV05BbTljUW1ZazhWL1J0UW93ZUdoSFlkWFhkT0FEc05GYldQTHBSZDlS?=
 =?utf-8?B?T2hpbmNFN2N6bnJFTzNBeE1YU29vQzdaQ3FJTXdobFh1M25yTWU5aW9tNGQv?=
 =?utf-8?B?c3VCZExLUmZNTGZYYzdjaHZYNE5GL1RaUmlzVkF2MDZTdElKNWpHeVNjTXhp?=
 =?utf-8?Q?NrGTrpbK36gfE4PnY44gEOBSF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a54fb547-a599-4894-7787-08dd92878999
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 01:34:58.5189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vUj2KCGRyxbmKDydRJmKl0Y/LhHSu6xf0FwHGn5IqipenQsk8RP2A8ObvDHzf6zjIXbXOxvO4CpsjtC93vu1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5831
X-Proofpoint-ORIG-GUID: v7m7silA3QnLDGXhBXuHckxbdv-SowvC
X-Authority-Analysis: v=2.4 cv=P446hjAu c=1 sm=1 tr=0 ts=6823f346 cx=c_pps a=G+3U1htxrnhIFlrbIuZW0A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=2vv1v26NUIOuIaJv1hcA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: v7m7silA3QnLDGXhBXuHckxbdv-SowvC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAxMSBTYWx0ZWRfX9idKSquyMTAY 7DZxDC5iAHV/nyUByIDI3vq774tp0n0NJzJcmcG7NhUzC1TuOATkz9EVv9juBW2vnTRKiL5SxWc EYslrUfgBn6SKgUf6KVfEsZd9WKJ/nRycaMBjeLTXCOn6Ri2hTKDscutO8ypfLLqz8ORnPKjoMa
 2oiPxhSBEKFMKqxLsCPLq8SEmrZ6zxU19IBeKub0i1diHUhKVd9j7M1IBDmxAK016MC2LWMZkQx SZ83NZSCPwJYdP13t8eD2VQnIxiaAE1NDXptnrguOq0w2IY7d2/MjMmTz6sxm700dvwzJ+8InIO pyGP1704x9b7J9bGyTw1VB0TJ2Nlh8jPDpDgiRVKP0b1NWewkEGdRl5z8cY6XrbS+qB1S+R3kw8
 97++nGOQgfDp6LzaMh+61I6wmidtdmXqX/WN66efbAlMryRWXnLWGowZ80uRThxGcN4hgp9v
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505140011

Hi Michael,

Could you please take a moment to help me review the patch?

Thanks,
Yun

On 4/25/25 13:23, Yun Zhou wrote:
> If clk_core_populate_parent_map() fails, core->parents will be immediately
> released within clk_core_populate_parent_map(). Therefore it is can't be
> released in __clk_release() again.
> 
> This fixes the following KASAN reported issue:
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in __clk_release+0x80/0x160
> Read of size 8 at addr ffffff8043fd0980 by task kworker/u6:0/27
> 
> CPU: 1 PID: 27 Comm: kworker/u6:0 Tainted: G        W          6.6.69-yocto-standard+ #7
> Hardware name: Raspberry Pi 4 Model B (DT)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>   dump_backtrace+0x98/0xf8
>   show_stack+0x20/0x38
>   dump_stack_lvl+0x48/0x60
>   print_report+0xf8/0x5d8
>   kasan_report+0xb4/0x100
>   __asan_load8+0x9c/0xc0
>   __clk_release+0x80/0x160
>   __clk_register+0x6dc/0xfb8
>   devm_clk_hw_register+0x70/0x108
>   bcm2835_register_clock+0x284/0x358
>   bcm2835_clk_probe+0x2c4/0x438
>   platform_probe+0x98/0x110
>   really_probe+0x1e4/0x3e8
>   __driver_probe_device+0xc0/0x1a0
>   driver_probe_device+0x110/0x1e8
>   __device_attach_driver+0xf0/0x1a8
>   bus_for_each_drv+0xf8/0x178
>   __device_attach+0x120/0x240
>   device_initial_probe+0x1c/0x30
>   bus_probe_device+0xdc/0xe8
>   deferred_probe_work_func+0xe8/0x130
>   process_one_work+0x2a4/0x698
>   worker_thread+0x53c/0x708
>   kthread+0x1b4/0x1c8
>   ret_from_fork+0x10/0x20
> 
> Allocated by task 27:
>   kasan_save_stack+0x3c/0x68
>   kasan_set_track+0x2c/0x40
>   kasan_save_alloc_info+0x24/0x38
>   __kasan_kmalloc+0xd4/0xd8
>   __kmalloc+0x74/0x238
>   __clk_register+0x718/0xfb8
>   devm_clk_hw_register+0x70/0x108
>   bcm2835_register_clock+0x284/0x358
>   bcm2835_clk_probe+0x2c4/0x438
>   platform_probe+0x98/0x110
>   really_probe+0x1e4/0x3e8
>   __driver_probe_device+0xc0/0x1a0
>   driver_probe_device+0x110/0x1e8
>   __device_attach_driver+0xf0/0x1a8
>   bus_for_each_drv+0xf8/0x178
>   __device_attach+0x120/0x240
>   device_initial_probe+0x1c/0x30
>   bus_probe_device+0xdc/0xe8
>   deferred_probe_work_func+0xe8/0x130
>   process_one_work+0x2a4/0x698
>   worker_thread+0x53c/0x708
>   kthread+0x1b4/0x1c8
>   ret_from_fork+0x10/0x20
> 
> Freed by task 27:
>   kasan_save_stack+0x3c/0x68
>   kasan_set_track+0x2c/0x40
>   kasan_save_free_info+0x38/0x60
>   __kasan_slab_free+0x100/0x170
>   slab_free_freelist_hook+0xcc/0x218
>   __kmem_cache_free+0x158/0x210
>   kfree+0x88/0x140
>   __clk_register+0x9d0/0xfb8
>   devm_clk_hw_register+0x70/0x108
>   bcm2835_register_clock+0x284/0x358
>   bcm2835_clk_probe+0x2c4/0x438
>   platform_probe+0x98/0x110
>   really_probe+0x1e4/0x3e8
>   __driver_probe_device+0xc0/0x1a0
>   driver_probe_device+0x110/0x1e8
>   __device_attach_driver+0xf0/0x1a8
>   bus_for_each_drv+0xf8/0x178
>   __device_attach+0x120/0x240
>   device_initial_probe+0x1c/0x30
>   bus_probe_device+0xdc/0xe8
>   deferred_probe_work_func+0xe8/0x130
>   process_one_work+0x2a4/0x698
>   worker_thread+0x53c/0x708
>   kthread+0x1b4/0x1c8
>   ret_from_fork+0x10/0x20
> 
> The buggy address belongs to the object at ffffff8043fd0800
>   which belongs to the cache kmalloc-512 of size 512
> The buggy address is located 384 bytes inside of
>   freed 512-byte region [ffffff8043fd0800, ffffff8043fd0a00)
> 
> The buggy address belongs to the physical page:
> page:fffffffe010ff400 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffffff8043fd0e00 pfn:0x43fd0
> head:fffffffe010ff400 order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0x4000000000000840(slab|head|zone=1)
> page_type: 0xffffffff()
> raw: 4000000000000840 ffffff8040002f40 ffffff8040000a50 ffffff8040000a50
> raw: ffffff8043fd0e00 0000000000150002 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>   ffffff8043fd0880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffffff8043fd0900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> ffffff8043fd0980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                     ^
>   ffffff8043fd0a00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>   ffffff8043fd0a80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ==================================================================
> 
> Fixes: 9d05ae531c2c ("clk: Initialize struct clk_core kref earlier")
> Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
> ---
>   drivers/clk/clk.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 0565c87656cf..3f89ed51d4a4 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4242,7 +4242,6 @@ static int clk_core_populate_parent_map(struct clk_core *core,
>   	 * having a cache of names/clk_hw pointers to clk_core pointers.
>   	 */
>   	parents = kcalloc(num_parents, sizeof(*parents), GFP_KERNEL);
> -	core->parents = parents;
>   	if (!parents)
>   		return -ENOMEM;
>   
> @@ -4283,6 +4282,8 @@ static int clk_core_populate_parent_map(struct clk_core *core,
>   		}
>   	}
>   
> +	core->parents = parents;
> +
>   	return 0;
>   }
>   
> @@ -4290,7 +4291,7 @@ static void clk_core_free_parent_map(struct clk_core *core)
>   {
>   	int i = core->num_parents;
>   
> -	if (!core->num_parents)
> +	if (!core->parents)
>   		return;
>   
>   	while (--i >= 0) {
