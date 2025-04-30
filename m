Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2089.outbound.protection.outlook.com [40.107.102.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA0420CCE3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003991; cv=fail; b=uavn/3wXWSQszGV+su3a49/I5L2tL9XAcC91BnCCw4ovX6GpQPn5rSLp2RXJWNwrBNxwPIBz5Sx0GQIeLmcSeFVYq6NvzDGD09/5cRic62/6GHcCY1J8ECuDA1ob45AqTX8M/Ze2kdm+Khjz2drB1cfZz1GKRIoIM9iyV9KzcGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003991; c=relaxed/simple;
	bh=N7ye0Y6mzlI8IhJPgkpzykHUr6gQMWUEGiPfhdOQyMs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C+ghj+dKmbQgCkGp4mkKgXc0H3Vxm+pK8vaKDG16oFp/0rtdRSObJeILvURj2z/fCK+qpcwMj560XeUDJxFs6qzChmytlbLCzWmKsLS3ObYS8QtCoeuSv75PRk2LipK9ydKAsjkTSKnxQfYsFuaq1YuDOK7out9ksgITjB+lyYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0rI/flOT; arc=fail smtp.client-ip=40.107.102.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0rI/flOT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouDzVuuZdQ9LzgmopB0+Hx3cuHqY1uH4DMxl/NGrHzLeoyl0N4yT3XuJWPEgfN6fOCHPPHQqyE/r0Nbhtm50qMPp2OHdU30qesEuJhzTNueL9e3sEnCujgV7kFQBz/kPgCRSsojdEH4rm2Egc/0ATRCx+vERB2g7MJqsHWMt+oSLEt7JncleGlevo975Q6+AuKNXGmf4DNITiuO3jmw5luzBsVSbCt3jNAhIZ9wkEcCMlMunLZ7baLcc3xEYmVdSOhZ/k/ocXU5VdOQoOFcELICdBkC5/+8GPxcUG6WR3uIMAK63nAQ1vNRnEVupxuL9uPHlz+eszAQgzbMiwKIpjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aC40QZ41zAN0Z6v7QyLl9g/jBVZT9U4Vbx49VSlPXps=;
 b=g2rtqF0s12eba0xr5ih0vq24UEnK0DApzu4GnzzIM96vqjeRe4kpPT8PsowZVgiX4eAIbYHN1oFMXGf2TWQsIqVZE0dkDja01ksgpd4LCgxfohOTb4D20TK+Tr1mEX4OEeK4hHZt5VqSW8m22m+MW/zACe3YLMadmSlye3xMYjoYr7UUBdjxUPKq9l6+AgjrIkeoOh293te/r+B+DNcT9eYSHy1v41RjHSRiLfx5Jv1FrSO83krfGbupN4as5KweTS5somM8wPfpCsrxo0+Yq+T+8GEjknng1JD+Lp+XQ6toAC+V5vC57D9LSFV2ewEbnNQNQwAV0x2lf1Clgni50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aC40QZ41zAN0Z6v7QyLl9g/jBVZT9U4Vbx49VSlPXps=;
 b=0rI/flOTX7HPk3sPFR8i8/hvvp57+gogc/ielBuWF6tcOFvSI1jyoTg9F7zCLXbntuhwHi69mefJRfQx+6IWrv5AuDoccpqIz/vxrTTNBtSSjDl9vIoMF9tyhRxjXPXMVXWav9Ve1MyDcqIxvMZicjVKtjJMB2B8a9j1RsesRPA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by DS0PR12MB6462.namprd12.prod.outlook.com (2603:10b6:8:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 09:06:26 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%7]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 09:06:20 +0000
Message-ID: <30fb5c18-932d-4270-88c7-4180083b9652@amd.com>
Date: Wed, 30 Apr 2025 14:36:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
To: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6811dde6.050a0220.39e3a1.0cf3.GAE@google.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <6811dde6.050a0220.39e3a1.0cf3.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::7) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|DS0PR12MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 3042fff2-40a1-414b-8985-08dd87c645b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFIzbmFDM0hmK0ErL0RCWng3VE9YdVVBMWE2b0k1b05FS0tja3oyOURBdXhG?=
 =?utf-8?B?TGYrRUdqRnpsRVE1RVVJSHVmaUMweVNpSnBDUHVjOGp1R3AzbmpoaldrdlE5?=
 =?utf-8?B?U1JJbWpsTElVYjV4NEdxSGprMFNTcmlsdklySGhYa09IcXBZWkZyZFNiZ3dj?=
 =?utf-8?B?MGZ3Tk4vWFBPUVgwbHNjRUFINjJuTnpQdjdUUjMrdVZPK3FJaHBCdC9xMnN5?=
 =?utf-8?B?TkNxQm1yNUlFY1Q5Rmp2V0dCMGtUeWhhRnEraGFzMXgvY3RndFVxM0FlOTZ0?=
 =?utf-8?B?VTFZckkyWTVmQWYvSFpQcldtOVhQRHJ0SEJlRVRabE92MzVHejA0bms2WGtr?=
 =?utf-8?B?Y094dFVnSVd2QWErdnU4SEpRR3VMOHJaOFh4SXZ4VUZEYlJwbm9seTNhdWRp?=
 =?utf-8?B?M0VuaVJzcXJIY1NyOUs3SFZCOU1sZHFndmFMTXlnRG9Lb01uYnpERmQ4M2hS?=
 =?utf-8?B?OUxyWis5a1Y4STY3bVpqdTBIMU5WcWFNTFVhWnI1NmZ3cXUrVzRaN253Snpy?=
 =?utf-8?B?VEYwUThxeEY5SEJFeWpjL3pYZXNub1BuY1lZL1ZSWWE3dlZKTDB1c0d0NFpX?=
 =?utf-8?B?ellhSE5HbjVIYTc2MmZ5ODdtTjNZODhlamxsQUJOLy9rdXlMdmhVT2tnVlV3?=
 =?utf-8?B?THBSdndJdzIvcDk2eW0xbEVmcmh4RVJhN1RYNm9ObVhmTUl3TlpGQlJDK2Iw?=
 =?utf-8?B?OHozSVcyeGtiT25kU0RXSHdQM0JqcGVvblMyMEt3aVY5NS9oZC8rd3o2VGwz?=
 =?utf-8?B?V09OMmxDVmlObWM5U0IybVFBWDhOdkNNbTdkSHkwa1NBSUpKOXpyWDhvY0Zp?=
 =?utf-8?B?WXNvQUR5V3I3L01sZXFKbW1kVTFwbGdOcWRuSHJNWDk1aTd3UWxPRjRsQlJQ?=
 =?utf-8?B?a3F3VW9QdFZlWDRoRDhWU2NKY3FFc2huU0U3ZlRCMVVVZWE5OFUxVzlMRHli?=
 =?utf-8?B?MjhUZ3lHVU80eW5mMzlIaXprcUFzZlJnU2J4VWFvSUFnQ2lsQzVRS3RZKy95?=
 =?utf-8?B?M25nRjJxL21uMm4rU1lERXlhMUFsdGdYN2trcktjNE5Ya284c2RwMXZaR1Ju?=
 =?utf-8?B?NG5wSytORmNBNnZNanJ2Nm1mekdZVWNPQ21vZ1o3Mys1OFNQaGtLY29SK2tz?=
 =?utf-8?B?cDhjWnBVS2g1TG9oVnkvM2NBeTRvRjRDSjE4S21WYU5kQTBxU2lNY0xZc3VZ?=
 =?utf-8?B?T3lYaW9Sd2xTa0FocUZBbkIxc013NENFVnVkZjFTTjZzSjRMd1IxTXpGaE9x?=
 =?utf-8?B?cEpUZmFwVENvQjdvVjVHem5JaHZET3pKU21TZlZEMzRxTEZ5bTZsamsybk5D?=
 =?utf-8?B?TFdZQmpNZVM1OHZUeTF1aGwvY2RIaldyajNkSjBwUEdKVWVsNTBoc1p6SWdt?=
 =?utf-8?B?MWd2L3ZMMkp2UjBnWFp5bkhUYk1aMkpQbzlLOW5MbW5XUHRUamlQcEd4eUhU?=
 =?utf-8?B?SkY3WVI0OWhwV09FcjFqTWtoVXdBWDVmRGhxSzZqZmJNTDlmL0NkQlpWd1h0?=
 =?utf-8?B?RmU3TGZBNFVtNW4xWWd3Smh3QUl5WU1TbzV3TE5hbUhYSWZWNStOTk54VzIz?=
 =?utf-8?B?Y3M1OUs0akJvTHNSUFRiWStGbnFUeFVRTmZHYnU2OTU0WExxd3F4L3poWGtG?=
 =?utf-8?B?cnFPYWxtM3IwaWNmcEx5YnJQakNCcjB6RGlpUWN6QlNTYXliODFZdHNLSk1B?=
 =?utf-8?B?K3JkVHc3SGFOUm5QWUowYlFOZlFvYnBBc3VTcFh1Z2NPblJnN216aG1nY3R6?=
 =?utf-8?B?VUxUTEJLc1l3aTFjV2xHUDhOZ2V2NVJUZ1lFZWlsWlBadzlCWnRrWnNHK0ZB?=
 =?utf-8?B?Tml6Z1VKZytNM0U4QlFmVWFFUVR4ZXZIc25NVmlldzlaWndiWU03ekY4Tzly?=
 =?utf-8?Q?SmdVE+DcGWOTg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmFWbDkwaUtvZXJKWW45cTVnZjRZbzZXSDFqY2FTR1VWakNWZnl0NS8yQ0ht?=
 =?utf-8?B?N3kyTkErZTlJa25BdVh6aU90SHpNVWFkZDFQWnJBUWp6K0M3Qy9tQk1GYlhw?=
 =?utf-8?B?TVhwZjEzOTJpdVdwODZneExCTk5COU9zTUV1UGFMbXl3TXlnWnpTV1FhSTVC?=
 =?utf-8?B?ODlEbDR3N000b3JOSkNGa0NObFpPbHlIcjQ3TGhNTmdoblJRQ3NxcG9tNXpj?=
 =?utf-8?B?MjdhV2dlOFNWYlcwVDVZV203czVMRGNYNlU3VDNxTWdUL1FGRTBMeU9nMldi?=
 =?utf-8?B?TnB2WEYvMHBKQWNLajM1eFpNV0YwT25ONFFKdnY1MDIwaXFaQmhPS0tnK2tB?=
 =?utf-8?B?ZnpMUkhkS3lZK0JjK0ZwcHZzV2FoU1o2aC94cUNDZW5XaFRyZ04yNGpLSVJh?=
 =?utf-8?B?bHNCMUpQZmlZaXcra010SVE0MmdyUnpYT0hwRVFVTC9XaGNNblZ6U2hJNk5m?=
 =?utf-8?B?NE96VEJmMk9TaFpHMW1icHlVZE1NOVdVY3BET2ZFUDlwNW9VM2ZTZXZDNEkw?=
 =?utf-8?B?R1ZjRUlpV2dXekU3K0h0NXVXNHZWblIybERLZkhZaklHVzJHeDZhMjBpcjQ0?=
 =?utf-8?B?b2luVUxNWnhkRlZ1OVRVTnVBUG9KeXE0QUFJZDhVMFpFU2FSNkRJd3BwY3hN?=
 =?utf-8?B?djdmUDcxOHR1cWRmd2VqV3RoTW9LTFlvK1FqRXpQQTB1UkNwSEw3eDY1V0pv?=
 =?utf-8?B?VExpRUdIR29qS1ZWZ0hUcEkzVzZvcFpRWXA3SURnQWFhWkNGQnMyV1VodURK?=
 =?utf-8?B?NUIvQlBFcmVycDFTeENBelBwTDJjcGpkMWhYQ1MwaCsyQm12bE1GS1llRGtl?=
 =?utf-8?B?eVhxMnI2bWZkZGgwR1N0bXZYN0JWOFNtWHdVV2ttZmtxTGxITFNJbWs2Q0N2?=
 =?utf-8?B?SjY0WnkxWVhwOHhraThnTGxVYVhwU1JNajQ1UjY4VG9ObjJ6dEZaNkVmUklY?=
 =?utf-8?B?OG5lVnBicG5uZW5RbHlEcmdLWWJTdUVsSmkwWjNLZDhNRW9vUEhPUzRCaFcy?=
 =?utf-8?B?dWxEYTJuRmQwakdUOERReUJaOGlHaEVoR0JZQTh5TXlVTDU2dVFCSkFYLy9G?=
 =?utf-8?B?UytqQ2FHQUdDcmRFT2ZYMk1VbkxrSlduZXo5Z3JCVVN2U2ZMQWlOTEVaMWVM?=
 =?utf-8?B?cXN4Q1hKRWRVQjNQSjZnZVZCVEdDeDlIdnBDRlg0UTZycG1ER1hoMm82YTdD?=
 =?utf-8?B?ZHZiY2NuNzFLUU9wdUdyUEpWTys5WEhjRXVBTU1kcDNUeWJlcnFmY1NaVi8w?=
 =?utf-8?B?emZWUUxieGVoa2JVUjU3ajZqaFhBWFRpdXVOM29Vb1d4a1N2MFV6M2FzaXdx?=
 =?utf-8?B?dXBPclhRaEZCOHpsNlJVR25jblAvMzcxdVlLRWJ5TXdURGg1UXRMcGVZZnZS?=
 =?utf-8?B?eldaUmxLbW84S2gyQklJdU5Gbm1EVFQ3eHoyc01uVWpvbVRlR0pDR0x2ZUZy?=
 =?utf-8?B?OWx0WmIySU45VmRsL2xiNE00UXplUVZIUmNPRzFGRElQN3lmWUxzSzM4akhx?=
 =?utf-8?B?NTdTb2hiaUE5SlVSZEdzRWNlNnJUWEdZL1JDci9ISVYxK01qUEh3WC84eCtX?=
 =?utf-8?B?NGQ0VEd0M1FlY3B6SXVFZkh3VEwvQlpiblpiK1dyWVJ6Y2wza3p4Rk1Salhk?=
 =?utf-8?B?cUoyanM1dUNPSGFSZ3RKV1duYVZVNkhJQ0NaMzdNZmdqN0JobXljNHU4Y0NI?=
 =?utf-8?B?RHhSY3A2dU9IMHI3c2lsd0QwZm9HTUNMMmdFYlJHM3BqN0pidEU3dE5NeXRy?=
 =?utf-8?B?cXRJRXBwVTh2cEJQaWRrbDE1alJvbmdwSjBTVWNZdkx6SEtUVWx1Tmw4NXlK?=
 =?utf-8?B?RC8xNUo2Z3RqUGhrZ3J2bW96aGhXNytwR2xaSlBLUWpSU3cxV01ucnZoZ00z?=
 =?utf-8?B?a0ZhbWg5T09hbXVhcG9KemJIc3VqQllPWGtwOW1USjRoc04ydmM5Qk5TYzZI?=
 =?utf-8?B?WkVxRHZ2NnV4dUV3UFo3czJkWUxWZUZaYUZTVks5Nk5GcFdMMzNoR0FWRHJj?=
 =?utf-8?B?VDNhV3FjTkIvekZWK0dHajJxU0FBWXhtZDhBc0VWQmk5Zk8vQ0V1RW1uaXov?=
 =?utf-8?B?Rm1OMjZ6bE9GNVUvNmRTNWtRUW1Oa2sxdXZLSlFkM2JGWUUxRTJGcEFaT3Z4?=
 =?utf-8?Q?SmrgLdrwxBNueZt2zqHMI1Vhd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3042fff2-40a1-414b-8985-08dd87c645b2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 09:06:20.1449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sya27763968iVu25h46O8GkivoekiL6VSWvZgYP/TcsfeNxXRk1r4KE5aB5YGyrRck7cD9yewFHMog17wTakXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6462

The issue is due to e7021e2fe0 as described below:
https://lore.kernel.org/all/SJ1PR11MB6129E62E3B372932C6B7477FB9BD2@SJ1PR11MB6129.namprd11.prod.outlook.com/

Trying again after reverting all commits of this patch-series:

#syz test: https://github.com/shivankgarg98/linux.git 69a58d5260

On 4/30/2025 1:53 PM, syzbot wrote:
> Hello,
> 
> syzbot tried to test the proposed patch but the build/boot failed:
> 
> 	Tracing variant of Tasks RCU enabled.
> [    1.756197][    T0] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
> [    1.757347][    T0] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
> [    1.758601][    T0] Running RCU synchronous self tests
> [    1.759703][    T0] RCU Tasks: Setting shift to 1 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=2.
> [    1.761088][    T0] RCU Tasks Trace: Setting shift to 1 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=2.
> [    1.898957][    T0] NR_IRQS: 4352, nr_irqs: 440, preallocated irqs: 16
> [    1.901185][    T0] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [    1.902806][    T0] kfence: initialized - using 2097152 bytes for 255 objects at 0xffff88823be00000-0xffff88823c000000
> [    1.905828][    T0] Console: colour VGA+ 80x25
> [    1.906677][    T0] printk: legacy console [ttyS0] enabled
> [    1.906677][    T0] printk: legacy console [ttyS0] enabled
> [    1.908615][    T0] printk: legacy bootconsole [earlyser0] disabled
> [    1.908615][    T0] printk: legacy bootconsole [earlyser0] disabled
> [    1.910441][    T0] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
> [    1.911593][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
> [    1.912289][    T0] ... MAX_LOCK_DEPTH:          48
> [    1.913471][    T0] ... MAX_LOCKDEP_KEYS:        8192
> [    1.914174][    T0] ... CLASSHASH_SIZE:          4096
> [    1.914891][    T0] ... MAX_LOCKDEP_ENTRIES:     1048576
> [    1.915648][    T0] ... MAX_LOCKDEP_CHAINS:      1048576
> [    1.916465][    T0] ... CHAINHASH_SIZE:          524288
> [    1.917206][    T0]  memory used by lock dependency info: 106625 kB
> [    1.918060][    T0]  memory used for stack traces: 8320 kB
> [    1.919051][    T0]  per task-struct memory footprint: 1920 bytes
> [    1.920079][    T0] mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
> [    1.921730][    T0] ACPI: Core revision 20241212
> [    1.923482][    T0] APIC: Switch to symmetric I/O mode setup
> [    1.924904][    T0] x2apic enabled
> [    1.929239][    T0] APIC: Switched APIC routing to: physical x2apic
> [    1.936346][    T0] ..TIMER: vector=0x30 apic1=0 pin1=0 apic2=-1 pin2=-1
> [    1.937802][    T0] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x1fb702bab20, max_idle_ns: 440795313305 ns
> [    1.939405][    T0] Calibrating delay loop (skipped) preset value.. 4400.44 BogoMIPS (lpj=22002200)
> [    1.941337][    T0] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
> [    1.942346][    T0] Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB 4
> [    1.949489][    T0] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
> [    1.951078][    T0] Spectre V2 : Spectre BHI mitigation: SW BHB clearing on syscall and VM exit
> [    1.952604][    T0] Spectre V2 : Mitigation: IBRS
> [    1.953272][    T0] Spectre V2 : Spectre v2 / SpectreRSB: Filling RSB on context switch and VMEXIT
> [    1.954494][    T0] RETBleed: Mitigation: IBRS
> [    1.955293][    T0] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
> [    1.956658][    T0] Spectre V2 : User space: Mitigation: STIBP via prctl
> [    1.957718][    T0] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
> [    1.959430][    T0] MDS: Mitigation: Clear CPU buffers
> [    1.960142][    T0] TAA: Mitigation: Clear CPU buffers
> [    1.960948][    T0] MMIO Stale Data: Vulnerable: Clear CPU buffers attempted, no microcode
> [    1.962237][    T0] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
> [    1.963444][    T0] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [    1.964804][    T0] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [    1.965948][    T0] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    1.966996][    T0] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
> [    2.270147][    T0] Freeing SMP alternatives memory: 132K
> [    2.271177][    T0] pid_max: default: 32768 minimum: 301
> [    2.272608][    T0] LSM: initializing lsm=lockdown,capability,landlock,yama,safesetid,tomoyo,apparmor,bpf,ima,evm
> [    2.274518][    T0] landlock: Up and running.
> [    2.275138][    T0] Yama: becoming mindful.
> [    2.276037][    T0] TOMOYO Linux initialized
> [    2.277498][    T0] AppArmor: AppArmor initialized
> [    2.279855][    T0] LSM support for eBPF active
> [    2.286597][    T0] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, vmalloc hugepage)
> [    2.291139][    T0] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, vmalloc hugepage)
> [    2.293046][    T0] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, vmalloc)
> [    2.294572][    T0] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, vmalloc)
> [    2.301308][    T0] Running RCU synchronous self tests
> [    2.302327][    T0] Running RCU synchronous self tests
> [    2.424383][    T1] smpboot: CPU0: Intel(R) Xeon(R) CPU @ 2.20GHz (family: 0x6, model: 0x4f, stepping: 0x0)
> [    2.428981][    T9] ------------[ cut here ]------------
> [    2.429388][    T9] WARNING: CPU: 0 PID: 9 at arch/x86/mm/tlb.c:919 switch_mm_irqs_off+0x640/0x7c0
> [    2.429388][    T9] Modules linked in:
> [    2.429388][    T9] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.15.0-rc4-next-20250428-syzkaller-00003-g5d98b45ab9df #0 PREEMPT(full) 
> [    2.429388][    T9] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
> [    2.429388][    T9] Workqueue: events once_deferred
> [    2.429388][    T9] RIP: 0010:switch_mm_irqs_off+0x640/0x7c0
> [    2.429388][    T9] Code: 84 f4 fa ff ff 90 0f 0b 90 e9 eb fa ff ff 90 0f 0b 90 e9 84 fe ff ff 90 0f 0b 90 e9 18 fc ff ff 90 0f 0b 90 e9 cb fb ff ff 90 <0f> 0b 90 e9 df fb ff ff 89 c8 90 0f 0b 90 e9 3f fd ff ff 90 0f 0b
> [    2.429388][    T9] RSP: 0000:ffffc900000e7720 EFLAGS: 00010056
> [    2.429388][    T9] RAX: 0000000000000001 RBX: ffff88801a070940 RCX: ffffffff8173b01d
> [    2.429388][    T9] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff88801a070940
> [    2.429388][    T9] RBP: ffffc900000e77f0 R08: ffff88801a070947 R09: 1ffff1100340e128
> [    2.429388][    T9] R10: dffffc0000000000 R11: ffffed100340e129 R12: 1ffff110037d70ab
> [    2.429388][    T9] R13: ffffffff8e0467c0 R14: ffff88801beb8000 R15: 0000000000000000
> [    2.429388][    T9] FS:  0000000000000000(0000) GS:ffff8881260a1000(0000) knlGS:0000000000000000
> [    2.429388][    T9] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    2.429388][    T9] CR2: ffff88823ffff000 CR3: 000000001a078000 CR4: 00000000003506f0
> [    2.429388][    T9] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [    2.429388][    T9] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [    2.429388][    T9] Call Trace:
> [    2.429388][    T9]  <TASK>
> [    2.429388][    T9]  ? __pfx_switch_mm_irqs_off+0x10/0x10
> [    2.429388][    T9]  ? __text_poke+0x5a4/0x980
> [    2.429388][    T9]  ? kasan_check_range+0x29a/0x2b0
> [    2.429388][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
> [    2.429388][    T9]  unuse_temporary_mm+0x9d/0x100
> [    2.429388][    T9]  __text_poke+0x634/0x980
> [    2.429388][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
> [    2.429388][    T9]  ? __pfx_text_poke_memcpy+0x10/0x10
> [    2.429388][    T9]  ? __pfx___text_poke+0x10/0x10
> [    2.429388][    T9]  ? rcu_is_watching+0x15/0xb0
> [    2.429388][    T9]  ? trace_contention_end+0x39/0x120
> [    2.429388][    T9]  smp_text_poke_batch_finish+0x38c/0x1100
> [    2.429388][    T9]  ? __pfx___mutex_lock+0x10/0x10
> [    2.429388][    T9]  ? __pfx_smp_text_poke_batch_finish+0x10/0x10
> [    2.429388][    T9]  ? arch_jump_label_transform_queue+0x97/0x110
> [    2.429388][    T9]  ? __jump_label_update+0x37e/0x3a0
> [    2.429388][    T9]  arch_jump_label_transform_apply+0x1c/0x30
> [    2.429388][    T9]  static_key_disable_cpuslocked+0xc5/0x1b0
> [    2.429388][    T9]  static_key_disable+0x1a/0x20
> [    2.429388][    T9]  once_deferred+0x6f/0xb0
> [    2.429388][    T9]  ? process_scheduled_works+0x9ef/0x17b0
> [    2.429388][    T9]  process_scheduled_works+0xade/0x17b0
> [    2.429388][    T9]  ? __pfx_process_scheduled_works+0x10/0x10
> [    2.429388][    T9]  worker_thread+0x8a0/0xda0
> [    2.429388][    T9]  kthread+0x70e/0x8a0
> [    2.429388][    T9]  ? __pfx_worker_thread+0x10/0x10
> [    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.429388][    T9]  ? _raw_spin_unlock_irq+0x23/0x50
> [    2.429388][    T9]  ? lockdep_hardirqs_on+0x9c/0x150
> [    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.429388][    T9]  ret_from_fork+0x4b/0x80
> [    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.429388][    T9]  ret_from_fork_asm+0x1a/0x30
> [    2.429388][    T9]  </TASK>
> [    2.429388][    T9] Kernel panic - not syncing: kernel: panic_on_warn set ...
> [    2.429388][    T9] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.15.0-rc4-next-20250428-syzkaller-00003-g5d98b45ab9df #0 PREEMPT(full) 
> [    2.429388][    T9] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
> [    2.429388][    T9] Workqueue: events once_deferred
> [    2.429388][    T9] Call Trace:
> [    2.429388][    T9]  <TASK>
> [    2.429388][    T9]  dump_stack_lvl+0x99/0x250
> [    2.429388][    T9]  ? __asan_memcpy+0x40/0x70
> [    2.429388][    T9]  ? __pfx_dump_stack_lvl+0x10/0x10
> [    2.429388][    T9]  ? __pfx__printk+0x10/0x10
> [    2.429388][    T9]  panic+0x2db/0x790
> [    2.429388][    T9]  ? __pfx_panic+0x10/0x10
> [    2.429388][    T9]  ? show_trace_log_lvl+0x4fb/0x550
> [    2.429388][    T9]  ? ret_from_fork_asm+0x1a/0x30
> [    2.429388][    T9]  __warn+0x31b/0x4b0
> [    2.429388][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
> [    2.429388][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
> [    2.429388][    T9]  report_bug+0x2be/0x4f0
> [    2.429388][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
> [    2.429388][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
> [    2.429388][    T9]  ? switch_mm_irqs_off+0x642/0x7c0
> [    2.429388][    T9]  handle_bug+0x84/0x160
> [    2.429388][    T9]  exc_invalid_op+0x1a/0x50
> [    2.429388][    T9]  asm_exc_invalid_op+0x1a/0x20
> [    2.429388][    T9] RIP: 0010:switch_mm_irqs_off+0x640/0x7c0
> [    2.429388][    T9] Code: 84 f4 fa ff ff 90 0f 0b 90 e9 eb fa ff ff 90 0f 0b 90 e9 84 fe ff ff 90 0f 0b 90 e9 18 fc ff ff 90 0f 0b 90 e9 cb fb ff ff 90 <0f> 0b 90 e9 df fb ff ff 89 c8 90 0f 0b 90 e9 3f fd ff ff 90 0f 0b
> [    2.429388][    T9] RSP: 0000:ffffc900000e7720 EFLAGS: 00010056
> [    2.429388][    T9] RAX: 0000000000000001 RBX: ffff88801a070940 RCX: ffffffff8173b01d
> [    2.429388][    T9] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff88801a070940
> [    2.429388][    T9] RBP: ffffc900000e77f0 R08: ffff88801a070947 R09: 1ffff1100340e128
> [    2.429388][    T9] R10: dffffc0000000000 R11: ffffed100340e129 R12: 1ffff110037d70ab
> [    2.429388][    T9] R13: ffffffff8e0467c0 R14: ffff88801beb8000 R15: 0000000000000000
> [    2.429388][    T9]  ? switch_mm_irqs_off+0x21d/0x7c0
> [    2.429388][    T9]  ? __pfx_switch_mm_irqs_off+0x10/0x10
> [    2.429388][    T9]  ? __text_poke+0x5a4/0x980
> [    2.429388][    T9]  ? kasan_check_range+0x29a/0x2b0
> [    2.429388][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
> [    2.429388][    T9]  unuse_temporary_mm+0x9d/0x100
> [    2.429388][    T9]  __text_poke+0x634/0x980
> [    2.429388][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
> [    2.429388][    T9]  ? __pfx_text_poke_memcpy+0x10/0x10
> [    2.429388][    T9]  ? __pfx___text_poke+0x10/0x10
> [    2.429388][    T9]  ? rcu_is_watching+0x15/0xb0
> [    2.429388][    T9]  ? trace_contention_end+0x39/0x120
> [    2.429388][    T9]  smp_text_poke_batch_finish+0x38c/0x1100
> [    2.429388][    T9]  ? __pfx___mutex_lock+0x10/0x10
> [    2.429388][    T9]  ? __pfx_smp_text_poke_batch_finish+0x10/0x10
> [    2.429388][    T9]  ? arch_jump_label_transform_queue+0x97/0x110
> [    2.429388][    T9]  ? __jump_label_update+0x37e/0x3a0
> [    2.429388][    T9]  arch_jump_label_transform_apply+0x1c/0x30
> [    2.429388][    T9]  static_key_disable_cpuslocked+0xc5/0x1b0
> [    2.429388][    T9]  static_key_disable+0x1a/0x20
> [    2.429388][    T9]  once_deferred+0x6f/0xb0
> [    2.429388][    T9]  ? process_scheduled_works+0x9ef/0x17b0
> [    2.429388][    T9]  process_scheduled_works+0xade/0x17b0
> [    2.429388][    T9]  ? __pfx_process_scheduled_works+0x10/0x10
> [    2.429388][    T9]  worker_thread+0x8a0/0xda0
> [    2.429388][    T9]  kthread+0x70e/0x8a0
> [    2.429388][    T9]  ? __pfx_worker_thread+0x10/0x10
> [    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.429388][    T9]  ? _raw_spin_unlock_irq+0x23/0x50
> [    2.429388][    T9]  ? lockdep_hardirqs_on+0x9c/0x150
> [    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.429388][    T9]  ret_from_fork+0x4b/0x80
> [    2.429388][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.429388][    T9]  ret_from_fork_asm+0x1a/0x30
> [    2.429388][    T9]  </TASK>
> [    2.429388][    T9] Rebooting in 86400 seconds..
> 
> 
> syzkaller build log:
> go env (err=<nil>)
> GO111MODULE='auto'
> GOARCH='amd64'
> GOBIN=''
> GOCACHE='/syzkaller/.cache/go-build'
> GOENV='/syzkaller/.config/go/env'
> GOEXE=''
> GOEXPERIMENT=''
> GOFLAGS=''
> GOHOSTARCH='amd64'
> GOHOSTOS='linux'
> GOINSECURE=''
> GOMODCACHE='/syzkaller/jobs-2/linux/gopath/pkg/mod'
> GONOPROXY=''
> GONOSUMDB=''
> GOOS='linux'
> GOPATH='/syzkaller/jobs-2/linux/gopath'
> GOPRIVATE=''
> GOPROXY='https://proxy.golang.org,direct'
> GOROOT='/syzkaller/jobs-2/linux/gopath/pkg/mod/golang.org/toolchain@v0.0.1-go1.23.7.linux-amd64'
> GOSUMDB='sum.golang.org'
> GOTMPDIR=''
> GOTOOLCHAIN='auto'
> GOTOOLDIR='/syzkaller/jobs-2/linux/gopath/pkg/mod/golang.org/toolchain@v0.0.1-go1.23.7.linux-amd64/pkg/tool/linux_amd64'
> GOVCS=''
> GOVERSION='go1.23.7'
> GODEBUG=''
> GOTELEMETRY='local'
> GOTELEMETRYDIR='/syzkaller/.config/go/telemetry'
> GCCGO='gccgo'
> GOAMD64='v1'
> AR='ar'
> CC='gcc'
> CXX='g++'
> CGO_ENABLED='1'
> GOMOD='/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.mod'
> GOWORK=''
> CGO_CFLAGS='-O2 -g'
> CGO_CPPFLAGS=''
> CGO_CXXFLAGS='-O2 -g'
> CGO_FFLAGS='-O2 -g'
> CGO_LDFLAGS='-O2 -g'
> PKG_CONFIG='pkg-config'
> GOGCCFLAGS='-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=0 -ffile-prefix-map=/tmp/go-build1460608260=/tmp/go-build -gno-record-gcc-switches'
> 
> git status (err=<nil>)
> HEAD detached at 0bd6db4180
> nothing to commit, working tree clean
> 
> 
> tput: No value for $TERM and no -T specified
> tput: No value for $TERM and no -T specified
> Makefile:31: run command via tools/syz-env for best compatibility, see:
> Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contributing.md#using-syz-env
> go list -f '{{.Stale}}' ./sys/syz-sysgen | grep -q false || go install ./sys/syz-sysgen
> make .descriptions
> tput: No value for $TERM and no -T specified
> tput: No value for $TERM and no -T specified
> Makefile:31: run command via tools/syz-env for best compatibility, see:
> Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contributing.md#using-syz-env
> bin/syz-sysgen
> touch .descriptions
> GOOS=linux GOARCH=amd64 go build "-ldflags=-s -w -X github.com/google/syzkaller/prog.GitRevision=0bd6db418098e2d98a2edf948b41410d3d9f9e70 -X 'github.com/google/syzkaller/prog.gitRevisionDate=20250411-130225'" -o ./bin/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
> mkdir -p ./bin/linux_amd64
> g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
> 	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wframe-larger-than=16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-format-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -static-pie -std=c++17 -I. -Iexecutor/_include   -DGOOS_linux=1 -DGOARCH_amd64=1 \
> 	-DHOSTGOOS_linux=1 -DGIT_REVISION=\"0bd6db418098e2d98a2edf948b41410d3d9f9e70\"
> /usr/bin/ld: /tmp/ccRsxVxg.o: in function `Connection::Connect(char const*, char const*)':
> executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEPKcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
> 
> 
> Error text is too large and was truncated, full error text is at:
> https://syzkaller.appspot.com/x/error.txt?x=11c3d774580000
> 
> 
> Tested on:
> 
> commit:         5d98b45a Revert "x86/efi: Make efi_enter/leave_mm() us..
> git tree:       https://github.com/shivankgarg98/linux.git
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5748169cc3be99bc
> dashboard link: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> 
> Note: no patches were applied.

