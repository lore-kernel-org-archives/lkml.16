Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020108.outbound.protection.outlook.com [52.101.195.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AB017BA5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858788; cv=fail; b=CsC1VP9fJ1antETjBhbUG+5LxiiJRsflrdgYUww7Ltbpb5i0NEJk8WTLGSj898y4RIH59jwZUA0edXP7zKuIuC93LLcKf355scyfnfBFaII2ck4rCpJPYmzcW37lizYKXYYhWkAudglYGsk8yes8Z3zsFtCR9MutND5gxNRsufs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858788; c=relaxed/simple;
	bh=y7+iZ8ZTF8z69SGqvF6x9w+4MdMrdiqjaEm1uT4/Iug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f7ervVmsP1HdAND2PRhBOjefzAoxqfAofAI+oXSwW2LOLSg54pSnKVwu1BLkkZREmZJU9RPT8NGAqUrKwMST9Z3s+iS9Ro+NQ9koEjBcxo5+Kr6N1+H51T5oakQQhT00YWzKZl/h+th/H46fMKaOomfy7KCv58+60GLbRkUGcXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBc9fHs0x4gn2fTzOeQN6ZyZuHwCGS+PYk22oiZSzTm8LfLONOaM6ZRMN7GnMnPS6lviGM4f28I4yB8EUHQlHoT9tAMlO0cdcIz2UVjZoIqhGJBiP9AeCrnXLD81TiyfQWPguxBaJa0WpNajDv7iX1iEU3udHQjx3QfVUWtRGwt6LhDVWWiBfAu5ERwfXAEjJBiwvuuCROx9yGIO477EscFNoIPeTFKcx+fsHD26Bts7pN9sD299bxpAYL0vJDWmfsXNMDmy51YZUbpr+B18VHRA+OmQunlzk08Laan/JNS0DLUbr3wNEPc2elJQiYApjlrA19r3FCfWk9K4yVV4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3IlONtmic0tIraUAxl0rYJRiC1LMIWCt13hN2Izqv4=;
 b=IwI9jYRFB/KqI/Tlt4EzWz3sPcydMGGhfj3dGZzoYu0YU8ASayqiTaQZ+PIucdl2o4hPVAHaJVtJj0o+2+anjZH+AlOeAa+6uyQ38qL4wf7C93Eix1WCep3T1Lu41CPTIYThqZsX9arYEyW/wzJBebcR8p+cEBTYn9GpBwsQMwPk3axfO/URI8i0j1m7Wak0I0+KwdSBA4qKgVhKgjfTgZZ7MKcllx1kqC8DI+lvVFhi6zomvsfZYRI7vSPcXi6UmwVL4kMvfpCGLpeoN1MNpRo6zvzC0hqf++OgnpbB9ZlpTXiUCxbivp87B6pkh2sdNK8Iv8CdT7xT4fd0mRoNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by CWXP123MB3319.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:87::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.32; Wed, 25 Jun
 2025 13:39:42 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::5352:7866:8b0f:21f6]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::5352:7866:8b0f:21f6%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 13:39:42 +0000
Date: Wed, 25 Jun 2025 09:39:38 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Mel Gorman <mgorman@techsingularity.net>
Cc: Peter Zijlstra <peterz@infradead.org>, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, hpa@zytor.com, oleg@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] sched: idle: Introduce CPU-specific idle=poll
Message-ID: <ybkahke5mxzrmt4stzpfzmspasrdsbazsttajaoo76bfkkydys@smdsjhy6is7d>
References: <20250621235745.3994-1-atomlin@atomlin.com>
 <20250623102334.GP1613200@noisy.programming.kicks-ass.net>
 <7n6zmi3aaxrwfpvkzbugt3e3274zw3qb2kci4yyq2q6gojb3ku@zh3g4rvnyqzi>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7n6zmi3aaxrwfpvkzbugt3e3274zw3qb2kci4yyq2q6gojb3ku@zh3g4rvnyqzi>
X-ClientProxiedBy: MN0P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::13) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|CWXP123MB3319:EE_
X-MS-Office365-Filtering-Correlation-Id: d04f0e55-1b74-4f6d-4466-08ddb3edbd1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0kvQW5wSXRtdGxwTFBpMm9ocHA5VzE2MGFheXJmYVdSbHVQTlNLK2dHS0dS?=
 =?utf-8?B?d28wdjdJbzVwK1FreG9LUWNLWFJaN2ZvTU5sS1kwdWVKbnp3elVORU0zTERa?=
 =?utf-8?B?UmRTL21UOVZiTy9xTHJTVUJZVmduVU9qaXdGeGhvY0Vid1JOSVIvaklLa29S?=
 =?utf-8?B?aHpvc2JTa09UREZKc3hlbjJERU50ZTlpT0JnT21uSUtlNEtHdER6MkJxemd0?=
 =?utf-8?B?NW8vSTRiSDV5ZFJuWHZSZG1Yam9TcTBWRzV5MDYrbG9ubW9obGlwMUhzWnV3?=
 =?utf-8?B?bzc0WHZWcFJnS0pqaFh5NUhqc3Rtc3I0cjFDOCtpUzFTN2hmV3dXNlpHTmds?=
 =?utf-8?B?MzBDSjE4UGdmQUJyWWM2cllqRi9QUXN1VjVISlFxWHl2OUxIajdFUkphb1ky?=
 =?utf-8?B?a3FDd3d3MVZ0UEpjbFVhMUFWMzFCaDE3dFJXcjVhQ1hCRFVWTmVmK2oxWTdO?=
 =?utf-8?B?aXB4UExmeFB1dUxxT0xFaWhFUlBwZWR2cnNjaVRLRXR4aXFnaFBnaUE5SU1m?=
 =?utf-8?B?eGpQU01oNWtYU0R1aGlaSi83SzhpazFGYXBxWlY3RHI4ZTZFTG5GQ1FXbnB1?=
 =?utf-8?B?Q1g3aSt6Yis3RUhiUmorSXkrVzNhd0Y0b1pOZFlFUFlFc2N0STB5NUNVR2Z2?=
 =?utf-8?B?YUVWU0FFcDNEdGQvWXVZdTZRdUQzU2M0aWYxQ1gyeHd5UG83ZEdPQ0N2Wm9E?=
 =?utf-8?B?RDgwT0ZCeDhtT0llaEtpQlFhc2xUalZFbWN2eE1hY1FpUFRrTnMzTkRRNGZW?=
 =?utf-8?B?THA3SzhjSlMvbG1nQnI3aWtUMUUvdGZpNGNIKzNXOTZNVDVoL05LQ3B0NVlj?=
 =?utf-8?B?TU1QQSt5VEJTeTIxa0dIaWlrc3E3LzA4aXhyQWdwM1hOV3BaNkVFRTV6WHls?=
 =?utf-8?B?QUFzVmMxZmoxT0RMN0ttUmZaTEZDTGw5QnZtZVhWbXlualArU0VvSlJZMHFL?=
 =?utf-8?B?ZnZiRWZwdUY1SnFXZDJQUzQ3SGJLcVdRR1hSQ2FMSEM1UFVRMjVURnkxeFhQ?=
 =?utf-8?B?OGI3MWtLMlp4RE55bm1CUktHTzlBckdlaWlselA4UEdlUTc4Qmowa2JCSzBy?=
 =?utf-8?B?SzZ1VzBubWVxYUhQSUFIU2Q4a1FBRVFRK05ScEdmRlJRT2l6SlZ2emxFQ0ZX?=
 =?utf-8?B?MzYveXJwYWJycElZMGtVVGhQYnRhdm03MkJiTjhTckFUUWM2d3FiR0Fybklk?=
 =?utf-8?B?eitRWS83UjBxZHlyV2JUd0RGamgwelhkYUpjaEJtSXp1YWgwdUV4WlY2a3RT?=
 =?utf-8?B?MDM4WGN4Qm9KZHVIZFZLdjQwcFlIVHM3eTNISlNic0ZIYTY5QzZLTTI5WkhB?=
 =?utf-8?B?dG12SG1XdDJPV0JVMkVCYi9QbEJrNEtXVVo1SjlWaWJBazVnTlJNN0FzVGt6?=
 =?utf-8?B?N3Jib3pGVVgwNHFHYktHRVpTVHBoOGJEQTZEelRQZ285NW1OcjhqUjdjdVY3?=
 =?utf-8?B?clVIRmFKMWR6b1hJQmFiRkVVc0NPNTQxU3EwU0l4OVZDUUs2aWJHK2ZuU0dE?=
 =?utf-8?B?ZElQTVFaa0xOczJmcytMK0dQWDBFVzRxMDlteDN6Y0F5SEZReDRvSU5WTEg2?=
 =?utf-8?B?d3VOUTVlOHRObnVxMXJkdm9QQU1mNEtXMmNZblpyMmNsQ1JONkNQVDhaYUVK?=
 =?utf-8?B?dzgrN1FYckNBSFZkNXkyN3hJd3RGVU5yZnZzczFkZlBvMVBJRXhqRHJISmtU?=
 =?utf-8?B?OHhZTGF1MmxNeFVmRi9jbGdGaDQxVVhLd0Q5VjRsTlNwQWJnSEdEZkhBRzc5?=
 =?utf-8?B?cDVHdW5ydTRER2pGc015RjB0RlExdkxnZVZJdisvZjRhWkRCSzNtdmR2QnhG?=
 =?utf-8?B?aWZYQ1hxV2N1eXdqcWtIenRRTWZ6UGhlaFJ5M2RHUDhscXYyQkVpcmgwb1ls?=
 =?utf-8?B?VVBOZWxISG1lZDIvZWRQSmNVcENKdlNyVXhNOVFNazk2alJZeVJ5eWVwUGdU?=
 =?utf-8?Q?FoUXW8iHgIQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?endXZzZ3REdxcHZjVi9ZU3ZMVUlFaGRVMFFUVUZlcXM0bmprMENJcTN6MkEv?=
 =?utf-8?B?am10MmdzaFltOGx3TTZ6MnJENlJpdTZyVzdqcjZ6RFNkQWg5VTFoOUt6aUJ5?=
 =?utf-8?B?ZHBDYm10Y3BZdFVnekpBNVJpRkZSdWdGVStMakIzUUwweEF5TnhEaTl4bmJt?=
 =?utf-8?B?VWhMNEU1RVhUMUdDYWs0VGZhZHExNXMyNTE2OTgyQ2IrMXJxQjhCazZQa0Vn?=
 =?utf-8?B?NlNsUDRDNFUvVloyVnhJazllS29ZV3hEcGRxWU1jeFM2OGpIQ1VlR0FJYklm?=
 =?utf-8?B?TExINXh5dVlISGlwNkdOc05wcFFBVENPOXV5YWxwbTc2QVhZWEZsVE92cmZO?=
 =?utf-8?B?NmI0YXE1YUtWN2tRU1NPTzN1QWlienhxYkI5bHlQNU5jQTYrTVYyTEs5UTRG?=
 =?utf-8?B?ZkgzeHhSNWZxdzl2M2U0THJzWWNjSFhpOFpsbkpjOEQzMy93dlJqODUyWFlo?=
 =?utf-8?B?Z05rSlZqdVk3NVBicmFBYTBQZDYwcktyZGw2U0JQaVFWU2tnQ1F6REg4RnI4?=
 =?utf-8?B?YUtTbDQwM0VNeDJoT1orWExRbUoxdm1ncnJkRVVET0VSNzVtcGxEUDl0RDBH?=
 =?utf-8?B?K2ZZOXhSSUprMTdiMVVwMWJWYkp3UDViUWJoL20vSExPeGwwdGx5MngzVi9w?=
 =?utf-8?B?bGpOS3R6L1EyTk1iQnhpV29Ga1hPVUN0V2d4Tjd5cEptS3BJUXdRRndDT1pn?=
 =?utf-8?B?WTF6NW03ZUZkaXdWd3FiV1pwNHU1UjhEY2FRTUtnZDUrcEd2bUhWWFpZbjVP?=
 =?utf-8?B?ZnlZWW9mRmE2WmsvNXlmN2IzcUhhVnhtaFlBRWFVelhBWmh1Sk5MQlE0dkdq?=
 =?utf-8?B?akh5Rkg0ZFlIZVFoemxFT09EQTRQclZlMmtvVkY4K2RmV0o4bnFLdkNzR2sv?=
 =?utf-8?B?RnYvMmxNVWNjaFNxOS9VVTA4aVNuaWt5eEpJUmVzRHFhcHFVVkNKcFdtaWVQ?=
 =?utf-8?B?c3ZDbWYreWsrUlI1NGU0dTFFRVdPTktoUVlDbENaSUlhZnVmcm9tQjRTeFNR?=
 =?utf-8?B?MTZuQ2dWTk0yNTl0Q2RTck8zblNvU3hXQmJ2SnVFSzB2K2pCenRrQWlCR2tm?=
 =?utf-8?B?bXR0clBpZW9KTXpWTUxnd3pFSnpYbzhvUzlmenBJcFZuclRzam1sTHJsaDE1?=
 =?utf-8?B?LzA4Ty9wWXpDcG5OaHYrYTdnaEFsYUZWcjJLS3p5MFZ4MkRjeCszSEsyUUZu?=
 =?utf-8?B?TS9uUUhsdExXRm1YMDdPb3prcFZ1RU50UkFWUzdyMW50MDM1cG81OGNtQXlV?=
 =?utf-8?B?WVJEMmhSblpYb0llVUdrbldJL05FQmpGdmR1eEpaZVRCQ3pPbDlTSVZFMGpJ?=
 =?utf-8?B?WkZlcC82VVNFbEdDSEdTUmc1TFJyWnE1Yi94bFFVcnNSOURNVmUrc0pSNzZP?=
 =?utf-8?B?V0hxYkZZbTRJQ1FaZnRrdFNhV0M1QWp6aXFuT1ZMWUZnaklTYUJEblgzcEd6?=
 =?utf-8?B?VjNsMkd1V3NIYjVpdEJ3clE1SVp6ZnhtUTRmT1lxd01aS3pmUnRJQXRpQ0hQ?=
 =?utf-8?B?dlZ6N1Qrakpxb0dPbkpqSTNXdTBVMmxLMzUwYk01bmI1U3BxK2Y0UGFBTTdG?=
 =?utf-8?B?Q0U1R0s5Q0QyendYYVdxNmEvdTNXK3d1cW9DZGcvcS9LS040amhEbTEvazJY?=
 =?utf-8?B?UDVYTncwM210RDJ5VXh5aFY2ZGplWUpWcjVKTVJNVDZHeWdSYnhWZlNMV3JT?=
 =?utf-8?B?RHhwMTNXMlFGNkl3d0pSS0dtYnJNNWRvRllYK0JhdTkvZUIxT3o5Z1VNTU44?=
 =?utf-8?B?YlhtNVN1UGJRYlhFZFdVYW5rY1N6VWMyOXVtUktMRGlDTkhtM2t4Y29RbDYx?=
 =?utf-8?B?bVV1N1BrcGx5SnBMbk4yZmw2UFVaTVVuRk5ET0F2V0ZnSExxM0NZVHBoNnhu?=
 =?utf-8?B?Y2ZxRzJ6cHdrQmFPYUZDVk1ZWUlaL2FTNjloajh6Z3hKcXRKbkFDYzlJdnhS?=
 =?utf-8?B?ZTYyTC9HMk9kbVNTRWExS0hJbEZGQ0thUEI0bGN2Y3R0THBEV09hT3Z6UWJI?=
 =?utf-8?B?bks3Wk05cWc5YWQ5aUNLcjZ4cW9Xdi9SU045TTZvOHZiUXFvaTVzaU5udkJW?=
 =?utf-8?B?dDhydUQ2L1BLT2hNK1BIU0NOUUNKNjN1WUhjN01IOFRRejcvSmN1R0R3UzQ3?=
 =?utf-8?Q?ruxvbW1YmdPUm/H3WlKdxtBE+?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d04f0e55-1b74-4f6d-4466-08ddb3edbd1e
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 13:39:42.0600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4jKY0YnXbLwBKdW5gx+uz3J9ULTQEKdr22Qh5zamO5FlX+WjdzB6vBEhB4eiT6z6S7uoQ+pdwYaeQTBtSk6zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3319

On Mon, Jun 23, 2025 at 10:49:59PM +0100, Mel Gorman wrote:
> > > Full Dynticks/Adaptive Tick feature (i.e., nohz_full). In such
> > > environments, only a subset of CPUs might genuinely require
> > > sub-microsecond responsiveness, while others, though active, could
> > > benefit from entering deeper idle states to conserve power.
> > 
> > Can't we already do this at runtime with pmqos? If you set your latency
> > demand very low, it should end up picking the poll state, no? And you
> > can do this per-cpu.
> 
> Yes, we can. idle=poll can be hazardous in weird ways and it's not like
> pmqos is hard to use. For example, lets say you had a RT application with
> latency constraints running on isolated CPUs while leaving housekeeping
> CPUs alone then it's simply a case of;
> 
>         for CPU in $ISOLATED_CPUS; do
>                 SYSFS_PARAM="/sys/devices/system/cpu/cpu$CPU/power/pm_qos_resume_latency_us"
>                 if [ ! -e $SYSFS_PARAM ]; then
>                         echo "WARNING: Unable to set PM QOS max latency for CPU $CPU\n"
>                         continue
>                 fi
>                 echo $MAX_EXIT_LATENCY > $SYSFS_PARAM
>                 echo "Set PM QOS maximum resume latency on CPU $CPU to ${MAX_EXIT_LATENCY}us"
>         done
>  
> 
> In too many cases I've seen idle=poll being used when the user didn't know
> PM QOS existed. The most common response I've received is that the latency
> requirements were unknown resulting in much headbanging off the table.
> Don't get me started on the hazards of limiting c-states by index without
> checking that the c-states are or splitting isolated/housekeeping across
> SMT siblings.
> 
> -- 
> Mel Gorman
> SUSE Labs

Hi Peter, Mel, 

Interesting. I was not aware of PM QOS. I will look into it, thank you!

As far as I can tell, the function cpu_idle_poll_ctrl() is used in a few
locations to ensure the running CPU does not enter a "deep" idle state i.e.,
use cpu_idle_poll() only. I do not see why cpu_idle_force_poll should
remain global. Perhaps I am missing something?


Kind regards,

-- 
Aaron Tomlin
