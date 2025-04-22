Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FEB2571D1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309428; cv=fail; b=F351TuuKVKnfUVFv30lfK3t6dP681JmQEX993CH/Deo63hUNH4Uqu8yABzSJ9mEv6b6fEW5mJBEO/55tsaQE0c3GA55vVzmUnnBx999LI50Bq23fPgwlcWkpyx/4cTZgM+4guRCO0R90qGH75gYXEkhp7/EjkefydXahFElkQcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309428; c=relaxed/simple;
	bh=kCmARXBD/fKrsi0pim8tUNY6DjZN0F2nQm3WOOazIFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LQXCGr+EYRdIMLfTCS4emelAsCRCisi92ZfEV7kAKnzGLUzm6HzcdrILPcgNnzQJGGzr2uuc4wuIhT2se7fQciWn/8vkXrdaUZpA7sBRkX8fgDYZVqz869HGDW649b+rNHSP0hkKX6noUDM0BEavNqVpVYcCYBNe5Yka8vIidVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WInOBLPS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OzUrKMT8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WInOBLPS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OzUrKMT8"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7MwI5006163;
	Tue, 22 Apr 2025 08:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=49C4IEW9mDvC+0A+Ji8uvlehZPCs4Q60woSqBCHMaRo=; b=
	WInOBLPSZHEgXIc76JAAx88fYa1cbbqB7pZNdzeyCw2Yt8duGnc0NLeccDxpIah5
	Ga3UyEq7FbvwuJ36gVVYi9A/Hg2OS9b0ps6nyu8TIEiRc+jluBh46E3B5bKflv/z
	RMTEt0Ud6YIwKQfDtOiSZMWQpC5mO2RKego9O4TutetHpLKxFog1orwV1wq6EfTM
	cYFbSzHmcx1EmsQawlj3uq+7SxsqdAGzlesqHl580AZTTvwDFygdq141mrj00KTA
	ngYNtL8l4ZtDTpyH91O7d/NC3N6uIbK7u/uyJPVJLdF7LbCL3vKJUKobctXCb3P+
	KachlaxdYFqc80ZkKDjUkg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4642e0byt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:10:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53M718nY021110;
	Tue, 22 Apr 2025 08:10:10 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010005.outbound.protection.outlook.com [40.93.10.5])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46429fhsts-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:10:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VW5SgdifCgNS4eg4Jf/n8gvFpPtmUXhtnY5QoqFu+R7zH6E/RO1vibh2WTj7yhxcenq8tXXJ+rQWiyssdXuv1fc7ypX0i0zq+6lP8vkE7WYweSSWvnTUff1RlZLlreDrHk4+UA5HV1ab4HqLKUG12h3DVsrm+P3Tiss9Wjx3HqMFvAbUYDk5mPsqQZC7bhUWEQoCzkOHBDqluod7TAp/UzphrAQLX7aQZRocaAlrEk3yj+CAlHG9IaARmTBxl2W5du5acrMMDP+zX5NggsiN9faiFZcPL2lFofiLn1fb3YyrmmThqjIjiAj9zrzx9NaN3MhPn3XndZ0ouEo2W0eMdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49C4IEW9mDvC+0A+Ji8uvlehZPCs4Q60woSqBCHMaRo=;
 b=RwbRZQJPPYQSETPvLLG3aeLhGw3rUO3ofB83UhrHZNljxiYpwPEU12KjeN5KurN3TAqdibGNwHyP/BpSIBaZQ2qQSOwRq9fBcgWtu2soDtYCgXG9GItG3BnT9etWHN4UxN4cYd4IGG3I8dPk/Qmk1Bw2i/OCefyMqq0DJidWgG0rKrXRkoPPrK+XBqEfy1v1BULzG6IJOZ6zEFZbKY63ANOSdN4W7J5NDxZyLpuqpDy7PMQXjMkGno46hqqrI53Q0zPbN6RZZMJXeYmOP82uIipQ6PJVhByWTS1Y1D8xbD/Io7oLjnxgCP+h97H3WvrM9QR+Nw440s+yWIPPLg6J2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49C4IEW9mDvC+0A+Ji8uvlehZPCs4Q60woSqBCHMaRo=;
 b=OzUrKMT8aWeP2hLCpcJNPad0Fk5a8+LbFY+Ov6FFU55ShQMwlHUaCfQd7CcQ60tM6Y59x86C5DsKf4TIt+Nn2gvgashLm4pzPO65lR0xJk76QFRJVK0r3HHvc0qxr4bG0e7wCiFLg0PEEsOw/D4yN7cjPphF/JxvwqBofTPKbbo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4587.namprd10.prod.outlook.com (2603:10b6:806:114::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 08:10:08 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 08:10:08 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 10/10] tools/testing/selftests: test relocate anon in split huge page test
Date: Tue, 22 Apr 2025 09:09:29 +0100
Message-ID: <74e3cd0ec7af1e874a247d9551d759bd3113a08b.1745307301.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0586.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 297ea37e-f209-4fc9-1be6-08dd8175189a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZV5Agexf4XK/2ejwVPha2YRZVRFroC4CNyrhM+mIztF24E0GsW9E1HSHnIvs?=
 =?us-ascii?Q?Cc49kMKeJDLfbqsd+/+ipUB6NsGpk+pU8R7GkD0zMSNA+xNubsZDJ5hXDOON?=
 =?us-ascii?Q?71/jPiw1uIBksGJXH7VBLPYVgfmxF1opp5rNkjkSA8FdGGK2RsNcN/NkY9KW?=
 =?us-ascii?Q?rK9InOyILucctXeKnnNssVxinZRKn9DRo1oYOQd7zkHBhW/5jK7VFcdhx3sV?=
 =?us-ascii?Q?ENHoqJ6B3UL1VfmgjnWRk7f+BJuREkpLXEu70Gg7Of0mvtwlAKnR9njQi+we?=
 =?us-ascii?Q?0+rLu1CR/2InoWZzp3Pjgsc5hWKCY/AquLmvequw4GU04HDCjJOmB7r8OdOz?=
 =?us-ascii?Q?wxJdYHGmMUlGqXC9uP8ndZR+Z1knY5BrDAFQ7GXlMX7olc9A3Xb57oqu3S5P?=
 =?us-ascii?Q?Eh+rGXwx6bdGqVv4tP+h7KCOUxkU13/tPCRhiCFfCT+3K6UVCkPA6fUZhA1V?=
 =?us-ascii?Q?FRCnqoxAv7tI8ephnKMdjeiPt86Da0oFhfm/0MRuE/WOta2JtgUwNa60vhQw?=
 =?us-ascii?Q?RvvDUyDh4SzD91dPNzM7GJkfsuIFr9LNHXEnFzWSUcFNBsODSR0PuQcLEr00?=
 =?us-ascii?Q?WwTlNFXgq5JVxq7i8owp7bjRQUAjiobwW3REhcsgZWKwo1c8JLy/RXpcbHEq?=
 =?us-ascii?Q?zqmuwVJD+KlrEst2qffopS85L9vy/njavV5B5tWxI3rSzjp07AhKzqG6BE86?=
 =?us-ascii?Q?8/GjXvJmq31P43cbtzcyT1qFv+GqCjL4pTM8w8jWrgrKqeVgI4Rnl2SNr3UD?=
 =?us-ascii?Q?aV2N9KdwVW7eu7pKWyKjIVJBZ/sHJMeTD3R1W7hOJ7ljxKG2viYGv4vx2Reo?=
 =?us-ascii?Q?vFhsknEfYp/mnD62r4Bk6ULAnHlQLN+cUHvdlL+/U6tgsgN/4ULyPnfX7bai?=
 =?us-ascii?Q?oayd4i1G6m/EuyVv43Xa9ejFrfEuBETfBkAyDhTjBTxbmLO+yWAXPcVl3Yzv?=
 =?us-ascii?Q?s81MroVtlC7Zr+1PaB/4RP7/5fMQXBy32RWcCIA0wYuW4P/2luB7LiMok8TN?=
 =?us-ascii?Q?vyrOItWP2eA+lH+0+DJ+p+E1vq6qvh2dG/vuw+YYqQVxDanMIbGfs2wPph9H?=
 =?us-ascii?Q?tCMRjSdNhxHUMY1VbEnT5fz6VjVO50sZV7sk9yWtrmh3Gr7FmwTA+PWwxlS0?=
 =?us-ascii?Q?u9Tn+X0OJZq/2vlW+RKyonEQJQ1yMiD7ujRdJcq9Z+c4t75bqNW24FZNtAEz?=
 =?us-ascii?Q?YUDVecnbuDTL5JLHrSidsle1fyUahENjTYf0jlGq+erR/9SGhC4A2omXeDxi?=
 =?us-ascii?Q?MmBx88ymdO/taGEygdqkYwdApRV8TDAmUL0fWNciVmXg51LtXBYoonoZnyfy?=
 =?us-ascii?Q?8/u5fkhI3nX84L5i0L8PTPIl2RWhWl6c1qtd/ne+NlleFrWwuxifa1aLjCOy?=
 =?us-ascii?Q?9PIMwyEeOjjIrtJbHPmCDRHfm3/lj8KwNVSEEYCzCY+fWre9240V9sqhh2M5?=
 =?us-ascii?Q?6GtqGETsemw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tv4vsEmFzOOo+EeIjSnvtnxbeyf83nvGdCtRrMxW/Bxf7Ch3lFJvKhBdrVsS?=
 =?us-ascii?Q?h5zE/NBzdUXmYzbvm+l6j+kRc+FfPCt9nwSal3qGR1iTbG8u0DGj7AYJLCuC?=
 =?us-ascii?Q?MazDVWYGsc/ZRga98ZH2rtJuI/3U4m4HTTEx6xZFOrfPFwXr+TZk0BqQAXc5?=
 =?us-ascii?Q?lzQvx2hOHDbRWKWfD2dE+3SW5oU/wwk2LPn2MYHylGB8F6jC9zJuJmFP5TTF?=
 =?us-ascii?Q?Z1F1sl1mXxUSs32rsOEzLGmkiUBON5+I9z6CPbKArV111FzwTUCNiLSDY3tj?=
 =?us-ascii?Q?bvWEzzUWQ+Q99x0ik00uDw0cLRlhy6BRkebTeFbPMlkPp+dPWtJjTZNFi8mG?=
 =?us-ascii?Q?0gd8WzFtmGMxOmNCtd+pDmBEuVJVLIHBTAjNLRpEe25tNXtw/agqOC6AAem1?=
 =?us-ascii?Q?4oCclAxKMM1wR7pKYXxA342nAMy1f+zoNSeE+6wG/Kto9Tp1X3by41nI8M1J?=
 =?us-ascii?Q?KEj0dgo4brQbG38TsTc8A0P2GYmu+EYH1BklI7TR1Pcc0CYZId2zMs6t9Bno?=
 =?us-ascii?Q?ABFQm0MtN2LnfsJTHMR42p0snjPAl8lt0c3Fs1vzwPXo1Mtv67+Umz7gSexl?=
 =?us-ascii?Q?QuDsXbuwxzBtuxq9hkzQSUrrEQqcOmwAxCiA4GMmDtziQ+46ErE1b+gxuydG?=
 =?us-ascii?Q?tguSWChSUVfg3qs2+ayIwmJ7afSlT/SuuCIjrpEvMJcczG7WxQP7M00uyXRw?=
 =?us-ascii?Q?vCXFx8LN4zJIMiEHgeBdc1NFcGy4CtxcNVX8Xg2t9vvPdzGPM43/I8KJ8QFG?=
 =?us-ascii?Q?r1rHVlosst6Nvl1Zh0IQNde4rKAEiRYcCxE22bwHWPL7jlLpkipauTnhaGLm?=
 =?us-ascii?Q?WOaTv+PS2bCa3PfOJiX9uEHH5/kznc5zQQKcaQ/mRzB+V0W4D/BFVq5J1ear?=
 =?us-ascii?Q?4yEgs39FjFhCuTiBqdVXDY5N0Us3/9e09CMwukRVLRFLMpn347koSReuvu0k?=
 =?us-ascii?Q?jfR4Subgo2V2jgKXpdjkP9NV3znhROlwfT4mFNWkIw4+Jlfqj5UKYaNkqw4N?=
 =?us-ascii?Q?jrdBfWtdxOcqcR8TGQZ5TMONVSGJFezEwXfFgaKnljlg2jzdPCVjtxyddt0b?=
 =?us-ascii?Q?F7w54StA1M3/k6m7G9iuGfrr7FrDMeEIZxMpN7TT20gp2Jl7QLl1esEhOA7Z?=
 =?us-ascii?Q?vTLSCJYNs6E8silSOrpgEoURPmas8u/E0wgQ1z/RJHIOc/Ki6wvy/Zus6FgP?=
 =?us-ascii?Q?hiZcZu23lMsjCRQoMRnik0+Ql0Ii7bz4tjxxZCW03dTb6xfNplkkmMGhl2Ca?=
 =?us-ascii?Q?Q05EpIHm3oNS+AOr1HAQkPSWF1lFMz6wJJ+lYWNjQWuTv3lQIl6pJ/6Zt6QH?=
 =?us-ascii?Q?RGILwb5fD0wy2RXu+DtOGAPEIGNZEP30UWyEu9uEf4oxdJC0hIuO97rbtdpf?=
 =?us-ascii?Q?LlLqksDDUBKLPnouJ/wj0jdJy7B5VZil643dScUu9kV+IdWrbEPAQWGg9SY5?=
 =?us-ascii?Q?qZKA4iq8OWEmfEh9sP3NthOsUD54rMk6ybSkxdBP/SG0/qIOpdzmodq3Ot8g?=
 =?us-ascii?Q?yElw9Gv0j6AVr8dYUVXUq+X7es6WBJFMW5kJ23Fdw144LNIEB6jWkWjgT3VR?=
 =?us-ascii?Q?NFnaKf43ctys4kBp0JXnV/d5ZEJGuC4/5LRRQkaSweRWJ80ixcsV3M0Q4jHk?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DpsPBfnWsqaB3JLiNVRCrYjA6cVmD5tmxo3/2Rs2V6JY9EPOomV9l32wIJ1Y8XhDJH+Vb42OkVm5+RdUJi704Gw9p0Yc8nScSVcNv/r/d4V1Uh9REAIQZ7uhufB4M9ovIQ2JDndwdlBJzHm/tD9z5NPZE/vdTxKJHc48k4JauKOsRwpEBeV4+cEvnqCB6LoswgOR/nG1aTG/0SOzU50JD0+0H+vNDYPWGFVFfK5/l91IWYokr87C1Nf3Yxi7QpQXKlkLq8isxuyNuLut27aLALnRSmK5Vtmgw8Hfdwxn0+D2+mizMrcPuzEJIjmXiQoVMd8q2/Ln6FwS+oEoESjao18bvmZCQIKAkdx/3XnvwUQXDAsabniSOau8/+okus4fHR8nBcD1Kvlr5gt+dNsdfQvSGmtALO/DjdRf3Ruxog156MFhviTH6xQX4oWIMtElDzvAsTw4W7QMPaVkRTrr/FD7MPry/eUTVExoUT3tdYJb1PSeiDT/M06Eeg3iWbwC/aDJaZMSNUpAb2qMh9heyJzrSfRBUl1HrbDCOBgTD9LxPEyfBtY8uPtM/EsqGP3EPUhnIsqT0qpzX2s8VMA5Md0ww0g+18jTcC2aGoGxltI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 297ea37e-f209-4fc9-1be6-08dd8175189a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:10:08.0960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEVh/zROo+kjwlgRfcc2o4QFgqIiaIL2GXvYG3PEDYEbGmcUdK3AfdYy5Pf+0oFddj+DgTlHwux2oB0VFR6aVzSJNvaCyjF/Zyl4vgQfLGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4587
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220061
X-Proofpoint-GUID: T8dIJ1G483FnEFUZkrUeqTqktgJJ1_ny
X-Proofpoint-ORIG-GUID: T8dIJ1G483FnEFUZkrUeqTqktgJJ1_ny

It's useful to explicitly test splitting of huge pages with
MREMAP_RELOCATE_ANON set, as this exercises the undo logic and ensures that
it functions correctly.

Expand the tests to do so in the instance where anon mremap() occurs, and
utilise the shared sys_mremap() function to allow for specification of the
new mremap flag (which would otherwise be filtered by glibc).

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 .../selftests/mm/split_huge_page_test.c       | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index aa7400ed0e99..1fb0c7e0318e 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -19,6 +19,7 @@
 #include <malloc.h>
 #include <stdbool.h>
 #include <time.h>
+#include <linux/mman.h>
 #include "vm_util.h"
 #include "../kselftest.h"
 
@@ -180,7 +181,7 @@ void split_pmd_thp_to_order(int order)
 	free(one_page);
 }
 
-void split_pte_mapped_thp(void)
+void split_pte_mapped_thp(bool relocate_anon)
 {
 	char *one_page, *pte_mapped, *pte_mapped2;
 	size_t len = 4 * pmd_pagesize;
@@ -221,10 +222,14 @@ void split_pte_mapped_thp(void)
 
 	/* remap the Nth pagesize of Nth THP */
 	for (i = 1; i < 4; i++) {
-		pte_mapped2 = mremap(one_page + pmd_pagesize * i + pagesize * i,
-				     pagesize, pagesize,
-				     MREMAP_MAYMOVE|MREMAP_FIXED,
-				     pte_mapped + pagesize * i);
+		int mremap_flags = MREMAP_MAYMOVE|MREMAP_FIXED;
+
+		if (relocate_anon)
+			mremap_flags |= MREMAP_RELOCATE_ANON;
+
+		pte_mapped2 = sys_mremap(one_page + pmd_pagesize * i + pagesize * i,
+					 pagesize, pagesize, mremap_flags,
+					 pte_mapped + pagesize * i);
 		if (pte_mapped2 == MAP_FAILED)
 			ksft_exit_fail_msg("mremap failed: %s\n", strerror(errno));
 	}
@@ -257,7 +262,10 @@ void split_pte_mapped_thp(void)
 	if (thp_size)
 		ksft_exit_fail_msg("Still %ld THPs not split\n", thp_size);
 
-	ksft_test_result_pass("Split PTE-mapped huge pages successful\n");
+	if (relocate_anon)
+		ksft_test_result_pass("Split PTE-mapped huge pages w/MREMAP_RELOCATE_ANON successful\n");
+	else
+		ksft_test_result_pass("Split PTE-mapped huge pages successful\n");
 	munmap(one_page, len);
 	close(pagemap_fd);
 	close(kpageflags_fd);
@@ -534,7 +542,7 @@ int main(int argc, char **argv)
 	if (argc > 1)
 		optional_xfs_path = argv[1];
 
-	ksft_set_plan(1+8+1+9+9+8*4+2);
+	ksft_set_plan(1+8+1+1+9+9+8*4+2);
 
 	pagesize = getpagesize();
 	pageshift = ffs(pagesize) - 1;
@@ -550,7 +558,8 @@ int main(int argc, char **argv)
 		if (i != 1)
 			split_pmd_thp_to_order(i);
 
-	split_pte_mapped_thp();
+	split_pte_mapped_thp(/* relocate_anon= */false);
+	split_pte_mapped_thp(/* relocate_anon= */true);
 	for (i = 0; i < 9; i++)
 		split_file_backed_thp(i);
 
-- 
2.49.0

