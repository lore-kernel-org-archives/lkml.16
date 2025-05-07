Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2134.outbound.protection.outlook.com [40.107.105.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB2A2080C1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649562; cv=fail; b=hV80cSdo3LLJHywAaRi2kdOpqYS4zqKB/mQwGHa5gn4CmwgDcg+j1//s7M8VHZRLqcGksragEUvb6mMSvp9PSd41CmVwjAM/POu8YV00CE3mWA0lvVgiYz3Dguvnd7RlSrWzNKb/3cpqs4NTTcw+k8zpBShlW+SYmyEx2pw6mvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649562; c=relaxed/simple;
	bh=NwUaOoS9UfcWMPR975NXvUMlAK6x9YE78U7TWT29Cag=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TT3YfHrHwFaMmyyy16nswVqBP92WcmRHlKFa+qoM017lSeCbfRSj3FYADz9wl7AnMX5IuKE06v20yg7ZWL2amvMyDwzbmGQNnRCHOnu7EuZarjaplWD2FVxy7yOQquqY4u1+0MIjx1y3MyBt1duXhOhKzt7BOHoiKigs3iICJ3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=ar3gouOI; arc=fail smtp.client-ip=40.107.105.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="ar3gouOI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLTp21aqzBHSlB1YGk6BozRPF1KaAwMstfvLuX7GmEihQmXR4tAb8y2unH5v6L2SQwOKPfwJ3A7RaPdlKZ9+YYGTbejMS45LZ0ayx+HFcT6a5/fKIrFNu5AD2wNPIrkk8j4mgAmVwv20PXv2Bsv+cmQEM0a4CzykjJXuyzwLcyIzNQl8onRr9Gk6olW5XopkcrcbKIcd2KsxO5iRkeiMHEZlC57LbHIu5RXQoleS43iKfsIuprmJbweyLUL5FnSLZ5FUDPwzgOE9qG4e2mmzeG7+OBmqe9cpPYK99k86D3Y8ViWcKpqtQ3ycg4h5Mt2WIbjYazweP3yGQVdUpv06Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSg4kJv9eD0FxF7V5rKuetnB9xfAQLdXbzIpzPVPv74=;
 b=RDTS6Ct0xpoNfL7P3l9vjX6u/mD8AS+vBIMLjZhzfvwyR1rqrOPFCiR7nBaD7Aqi5xBx6eEcsu9AG43T38bEKqtZIC89o/z+LkfgutN4nI90+kMs+UX9FhU2BYvq2QAOvf2dbSQFPi4nfFrWvCI3U50GKIbI++QDobFbWBuH5QjqZuQAwStoIiZ6LLjvN0lY1wSrn8aiqlIadB9wfrmtwt2ogqbOcoc9s/Pls0L3I8OZuLTTqClinTkaYQxznL+o9s4rjsYBgzuJcwxDjOTcWTG/LsGYyAV1iwTavhZO6wdWMonJv57WSRycY4W2DGyx0K3H93AHK/SvOy+VODWkeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSg4kJv9eD0FxF7V5rKuetnB9xfAQLdXbzIpzPVPv74=;
 b=ar3gouOIve9mi8gTQ9UfUlDL3cwndTaowVFac5PWBN19lppCrKzCGJjwFZ2A7vB4a1AMx1kL9w8WMFoPiLJG0RhO4QNp1YASqxbaBv2EZ3Ycs5O8bzQtvB2UnPkVmyPu5ZbQvGDrBMtX9rBU4bM/xTTp9w/S3y8cWjrLmvJCzt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com (2603:10a6:102:32e::7)
 by VI0PR03MB10474.eurprd03.prod.outlook.com (2603:10a6:800:202::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Wed, 7 May
 2025 20:25:53 +0000
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235]) by PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235%5]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 20:25:52 +0000
Date: Wed, 7 May 2025 22:25:49 +0200
From: luca abeni <luca.abeni@santannapisa.it>
To: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Vineeth
 Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <20250507222549.183e0b4a@nowhere>
In-Reply-To: <f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
	<aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
	<f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
Organization: Scuola Superiore Sant'Anna
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0047.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::19) To PAVPR03MB8969.eurprd03.prod.outlook.com
 (2603:10a6:102:32e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8969:EE_|VI0PR03MB10474:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d9a1f67-cb0b-4773-b7c0-08dd8da55d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tPvqThaJppp4c2LE/t/yzWrdoKc1z42V8oX+G9soZ7In5sf6/JL/hKEpLzLs?=
 =?us-ascii?Q?B/gv08efyO18MyhkoHyZaqM6OwwUkSzp/k6HkE5nsPxk87oyWVPapEpzqf7B?=
 =?us-ascii?Q?XtzAZgXCdr0WDMxHYUm3iMHSzxX1YM7OjLZZw6deqlIiZ/sygEZJc4T1pXQQ?=
 =?us-ascii?Q?fKdNPyxIxOYQShkJPWuG4ejxKzEDLxM44V5UmajpKk62DS3/URro1WNX1ZmJ?=
 =?us-ascii?Q?YUVBXLnIQLm+MpNeAjnP/1WhmnUhP9cK/dj0X9c4AXJD+/5JuSNm+OBle1im?=
 =?us-ascii?Q?nCmdtlncVCqNu3bI1DvLbYZhTxcRIT2QjJETtCKB0uiY8AdZJLDqTSbHbkUh?=
 =?us-ascii?Q?8m0lbvub6Hiw/xjH8PXls6oQAAh5JjECX031qxCxQGgcPfj5/2pyo1uGev1x?=
 =?us-ascii?Q?1RXxlX2gPtUFVyBiOzON0urhG5J1uak5COK1og6Ycn/9mhfWnIAyzG4VD6/y?=
 =?us-ascii?Q?kSO5TXjZmC6Zdcu8fn6+ZdR2d9Tcc1endeyjdUSmYDAQYqi/til/FE00FIkC?=
 =?us-ascii?Q?nHpRgG+r+4MVZD6jcVAjzI5vPTt34tnnR20dM6LSF1K/AM9VTsjYtPg6i+Te?=
 =?us-ascii?Q?WNf/YH45GPIiugQh9zzuD7C8sZX9oGmePgbeu7BQEfej6P59OmNZbIORa9Rv?=
 =?us-ascii?Q?YXK0RFDmBknVoPEnLiNgaoJ8zp2kB6D5OSjLXOJYxtBGzMDCf4VzCfoUq7Fh?=
 =?us-ascii?Q?r1T0oPrI5y4LL7FX2e+qEcBrrkU7xXsiy8xLf1PDk6lbvDfbvq87uXftiRls?=
 =?us-ascii?Q?2rvNP3cFGmyBSG1lvqgpyw/HitKlLF0ZBo0RKM6Zw8Br5BQlZcTXyktE4jxv?=
 =?us-ascii?Q?G0o3Mtd+n1/W4kApQnMsT2niqoS3YzjwW/7KMBYsjx5ER641rm1ixGF+1MoA?=
 =?us-ascii?Q?yyZZs+lJgEFUBk1PX0uzpjt1FdOtNkarIjGd/58flhKvS+kLMdAqxBRKPyuh?=
 =?us-ascii?Q?dcj632flJjYmCJ/84S8OGJmXmP7OIRCM40qOKR4VQaGAe/dKRGLdVICLbxcP?=
 =?us-ascii?Q?dTF2sWaeatTPsN377vs0mkfCMcKtY6Ghu2bDKZIvkxyUf+Y9zMC//nYc8XkG?=
 =?us-ascii?Q?J9ZhBpV9V7irly2p5TiJ9fvStvTBCUOUx/ffKgeMoqiE9mvliWT6tpaMPddV?=
 =?us-ascii?Q?/sDnehHTplzmew/iKWMu24tMYkNzoRJUzF4zGDf1jRwIPvG/UwHxfVXNT9Ok?=
 =?us-ascii?Q?lDF4VrUSgN7FPTXt219iA7SG6BDg0U16Km4sflzIUNCE1C5TEWQULQiX5Kpy?=
 =?us-ascii?Q?1f9ZRYPhtsP2ad0Xpn9gTfpaIiwvAXQlcTDO6YS+IBYYEBN6/htjqVXS3g1T?=
 =?us-ascii?Q?djdIwNWYsxGsYfFaBoqEh2U+Chd5by/S5pFVX0Dx1AlTNijURzKHwsdxWuCa?=
 =?us-ascii?Q?ANyuPpVBDFf4C+z4hjK0aSUSpVo3WmwQhu9CxgsldcSy9QfSlGMNefJQKi/q?=
 =?us-ascii?Q?ydLdqSqCJA8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8969.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A0zCi/ToULUmTEjvVSzXDOsEOt++nR7T/8S0b1sDrmt7His9auyEiV2LdROa?=
 =?us-ascii?Q?0s8EX3bCrq4wVYxJZq+JS/IZ1aL6PLDxQyvy0vdQPhGyOslU4CrGZ7Qda8qT?=
 =?us-ascii?Q?aWSXzmy6a116cKbQ9Ju0ifpAWxU4olsOH5f6U2e3wc2xRtk4/8mJ/T/IWlGp?=
 =?us-ascii?Q?bqKBTxBxv/jbOEGk3rB7/noKS2utuxV8/87W+MUpu1plO6ZeWLsSYe7puvE/?=
 =?us-ascii?Q?RUhvvLGTOd7O4ERzg6Fzn0UKI6chI5+8d+m/9byyVNQKGBgr7KYItLAzqrd2?=
 =?us-ascii?Q?qA5aAsjsYX2WQSKqW7/wPBht/X1uXlJ6rBZ9KEpqigM0aGMyW1GkpR6npj49?=
 =?us-ascii?Q?TBupi2yNSz2eZxy9nCs2efP8DRPU1CM6mt9iimsn4N8MR9pigEa8E+Gxviud?=
 =?us-ascii?Q?yP97WfNXcS5sgVP8Qi7fxEnJ2vJX+38YzexxZI4FUhjW+0pcUseiUCRl/dUc?=
 =?us-ascii?Q?a6eyvJJxKIo44/n1I+sVQL+ySpMg/lpmbkY5bkktxkLwDeqC3JtpEc+FheQJ?=
 =?us-ascii?Q?LDo9pMdyjB9qjABkxdwsFzg2G2iudcVUVByaBU7FkQMkT57mBC00WvwG/etq?=
 =?us-ascii?Q?Pu8SO5Cx138o0xYwM5nNttRCHB/LZ0B3x9Nf6sH9tAIWEuQNXl2ygh5C2HeP?=
 =?us-ascii?Q?h05E+rsvMd0RpkRjUpuQ2LfBWufo1TR6O/DVs3gQXj9FE+dCWbTLZdZ8XZIo?=
 =?us-ascii?Q?seEMrs9FmBGldSa2ZIEKTCso8ym5yO0ZbMl48stw/uhevfb1U1aWrD/A+EYG?=
 =?us-ascii?Q?idAB0UKPi5YHa4b1RDH2iGTSpzNSNn9uRRoRT6EcpPbg2D8ZMBgJBB7QPGpt?=
 =?us-ascii?Q?X6DsloHswdsB/4ls/qZagz+dswm8Rwl68RpRqMy10Xk4Zorpxryul2pQPnfp?=
 =?us-ascii?Q?5zaygRojzPaILK8UhhuyUaVZkqvBsxzDYtqeFcjfgnQZ7HOLQJrL8EcvzMtP?=
 =?us-ascii?Q?kjfHeVQruwPzRxrO39ajyjQ5paAjdBiwnonkAgiGBkrg6ltC49IYUt5A7MjV?=
 =?us-ascii?Q?pkkiE1aP/YOdkcNUdMBS05x67RtJTBLJYWDwtNnGfat9e91nRlROEb2NnrDk?=
 =?us-ascii?Q?9oQrgb/f68ESx9Q7T0adXABhEZBN7POx2Ait99yssJCEcDIehbk+0w6bPC+S?=
 =?us-ascii?Q?ccRv6CHV+JfioVjPIB/cADnH9lMAJN88TZmkfmdWVyrcSRZZbQ2CFkNsMUBR?=
 =?us-ascii?Q?OQ/+8JI1AtINeaodnHbQ46qVoxLqnTmIaUmIi2q7R8T+dp/Co/BkGfnIGZIe?=
 =?us-ascii?Q?YYjrWexGjKvx4InrtLInwf/tGM/VTi8gsNtr0Aq8qQKKh2+xQbinwNd0nLuo?=
 =?us-ascii?Q?kyZtPkTRKF5qPlVGe7KkcpSdsTSeG9O3VApdzk8NerWUZyok3hDdI20EeQtH?=
 =?us-ascii?Q?HUiU6HWStZKjPLRcrTYcKBYaQHL+f3ByC0A5Kui6P58ghW3Qzm6itCaTzIpj?=
 =?us-ascii?Q?X+AA9MYexaUFNj1CxNu4e3z/75ydqsE+//oXgAChFdVkFloP6U98AIELZAL4?=
 =?us-ascii?Q?o2MgEvYiFEaR3Yj4VgKVIn5msZiqCltHv1o3dYkzF8vnlWvLfEecCT1qp6Ng?=
 =?us-ascii?Q?YsWkRHV94sOJDiznEUf4XOPrs2zNWy2sBd8Q3mLQtKgLJ9ByMxGnfTmk227d?=
 =?us-ascii?Q?pw=3D=3D?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9a1f67-cb0b-4773-b7c0-08dd8da55d0c
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8969.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 20:25:52.8965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RR/znnWIba6PZqoxACgNGw0QHfC/xAF67Aa4TEXJR+65Ag6Rfr/pS5Xcl5EutrD6vo7+cVdKVRy5FwgHAs6Ft0pjfFk+ZV5u/VbZntJoonA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10474

Hi Marcel,

just a quick question to better understand your setup (and check where
the issue comes from):
in the email below, you say that tasks are statically assigned to
cores; how did you do this? Did you use isolated cpusets, or did you
set the tasks affinities after disabling the SCHED_DEADLINE admission
control (echo -1 > /proc/sys/kernel/sched_rt_runtime_us)?

Or am I misunderstanding your setup?

Also, are you using HRTICK_DL?


			Thanks,
				Luca

On Sat, 03 May 2025 13:14:53 +0200
Marcel Ziswiler <marcel.ziswiler@codethink.co.uk> wrote:
[...]
> We currently use three cores as follows:
> 
> #### core x
> 
> |sched_deadline = sched_period | sched_runtime | CP max run time 90%
> of sched_runtime | utilisation | reclaim | | -- | -- | -- | -- | -- |
> |  5 ms  | 0.15 ms | 0.135 ms |  3.00% | no |
> | 10 ms  | 1.8 ms  | 1.62 ms  | 18.00% | no |
> | 10 ms  | 2.1 ms  | 1.89 ms  | 21.00% | no |
> | 14 ms  | 2.3 ms  | 2.07 ms  | 16.43% | no |
> | 50 ms  | 8.0 ms  | 7.20 ms  | 16:00% | no |
> | 10 ms  | 0.5 ms  | **1      |  5.00% | no |
> 
> Total utilisation of core x is 79.43% (less than 100%)
> 
> **1 - this shall be a rogue process. This process will
>  a) run for the maximum allowed workload value 
>  b) do not collect execution data
> 
> This last rogue process is the one which causes massive issues to the
> rest of the scheduling if we set it to do reclaim.
> 
> #### core y
> 
> |sched_deadline = sched_period | sched_runtime | CP max run time 90%
> of sched_runtime | utilisation | reclaim | | -- | -- | -- | -- | -- |
> |  5 ms  | 0.5 ms | 0.45 ms | 10.00% | no |
> | 10 ms  | 1.9 ms | 1.71 ms | 19.00% | no |
> | 12 ms  | 1.8 ms | 1.62 ms | 15.00% | no |
> | 50 ms  | 5.5 ms | 4.95 ms | 11.00% | no |
> | 50 ms  | 9.0 ms | 8.10 ms | 18.00% | no |
> 
> Total utilisation of core y is 73.00% (less than 100%)
> 
> #### core z
> 
> The third core is special as it will run 50 jobs with the same
> configuration as such:
> 
> |sched_deadline = sched_period | sched_runtime | CP max run time 90%
> of sched_runtime | utilisation | | -- | -- | -- | -- |
> |  50 ms  | 0.8 ms | 0.72 ms | 1.60% |
> 
> jobs 1-50 should run with reclaim OFF
> 
> Total utilisation of core y is 1.6 * 50 = 80.00% (less than 100%)
> 
> Please let me know if you need any further details which may help
> figuring out what exactly is going on.
> 
> > Adding Luca in Cc so he can also take a look.
> > 
> > Thanks,  
> 
> Thank you!
> 
> > Juri  
> 
> Cheers
> 
> Marcel

