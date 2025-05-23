Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2117.outbound.protection.outlook.com [40.107.20.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62147E1
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748029578; cv=fail; b=U+PVoVT5m9CgyzKX9104nHkEhQl3LG/0a6TVXW8f0k6CHMK1MqjadQOmP9xNvWuxS1iTsb6zeKFp3Q4pxwfxE99gXnMjrIFg4y5uOnaq8zw9k7CezaxPAmNKD5CWH5IyLVlQqaclHWfrZ5nVPhMmgIsf9PpwNiu0+xpIr72yHvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748029578; c=relaxed/simple;
	bh=djt8G8f1Y85JNiBarZPy2UXivIpU+vIu0rcKH4dXHRY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LKiens11cGKXi4JUc7zIBFGtXrbxJcukdyg6aHsr0L3Ols1lCzZZ1f6aOZj8zjiOhYMOiDuz+YLAsY6hoj909BtbtO+E2Zu7VZq3eTz8jRl01vHZznSjJeiqJnp418xwwwDu5LHEXR8HBjRo5PkdZG0FaF47bfCReLgQJk8GJ7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=00b/N/in; arc=fail smtp.client-ip=40.107.20.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="00b/N/in"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2I+OFfuSBcg36IRgE92ienR+1UcHkT18LBea+KrN8qQpQCg3si8+Tol76U7bOrvAScXwIim1LUpYa7n6A1uE/4HXvu8s+hbFr84rTHaXP0hd1A0fqzRQIuUnbwwVudhmmB9wLppc8zgk6haaQhB5CC3hz9OhUTXu/ak8+V2velxNjR6mQfqonKuCCoDS9vjjq0J5+zL4NcIKaths3BPdFSh23+W9DdWf6SMp9/W23Fh6sznhsMLqXLJbs69rj4tQ/MYRmvOCzl461OQBXlyvumyDgI16jwCxc5bxEasWmTKaKFWsDa/RKBI6P9ou8HUoBqEfYxMttaTtFvD8OBw/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO9BNsJ2L5iVTmm/67qjpY0I20QZ8vtHdzgLYRdHK4s=;
 b=NnG64jg0gEN8RxUHkkdIMEbPad6ZUosT7ZQRuVYe+nRPRjcn//RrlPSui0lvrFf5lx5KHaIpAmXjUb3fmK+MsYX2ZnlA34C7CoLdSQpkwwLOX81OIvHaTYVee1nd3YeSzle76OeWLvLI7wZfnyV+wV44F4//L2WFwABTj1aIRlNgIyOXJEq0Bk69fEcXUfStblEZOy3RRfxIlCvJ11gD4KwkUJQbB0ZQX2IOPH+f7IjF55peeqWHNArQAKFQ1YTJ77yhNH+PEKvpqQzhDos34ry2Tmm4/4w99niLPetgjzb1rNpbnBcYmWywTglrKFHlMFoPRQdpwzqpgyiEbINXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO9BNsJ2L5iVTmm/67qjpY0I20QZ8vtHdzgLYRdHK4s=;
 b=00b/N/in50YEnufDyyKETMl3t6T7fpM3dHqC2lWXz9BtJYf3TeLy09UpgypZ7jQx/tMVLP0pPfpitslSo7r57ydlvEZh7g5KL2osHkJvs0vQLur5cH0kAGNPjyw+Pbiqdw9Po66k8UefDYj+PEnU52LSFu9f2OAkfGCLguefosk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com (2603:10a6:102:32e::7)
 by VI0PR03MB10829.eurprd03.prod.outlook.com (2603:10a6:800:25f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 19:46:08 +0000
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235]) by PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235%6]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 19:46:08 +0000
Date: Fri, 23 May 2025 21:46:03 +0200
From: luca abeni <luca.abeni@santannapisa.it>
To: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Vineeth
 Pillai	 <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <20250523214603.043833e3@nowhere>
In-Reply-To: <92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
	<aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
	<f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
	<20250507222549.183e0b4a@nowhere>
	<92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
Organization: Scuola Superiore Sant'Anna
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0146.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::7) To PAVPR03MB8969.eurprd03.prod.outlook.com
 (2603:10a6:102:32e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8969:EE_|VI0PR03MB10829:EE_
X-MS-Office365-Filtering-Correlation-Id: 472f407d-84d7-42e8-b8fa-08dd9a32766e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C/9eRj1IhZlJiQHqHVnxepzeGmFhzHfJAbHTzvuEbXJnh2MF2zADIWKYQXvn?=
 =?us-ascii?Q?4rimb7hK0nYYctuIv/8hocUH5AnmUlPszOEaRUFBDw/JNDWG+QeHw3+aDRcp?=
 =?us-ascii?Q?QkjRlvD35OyRa2BpncD4ckgWMszMYI0+4vD3bTFshG4GmYWpiE9syJT12MZ1?=
 =?us-ascii?Q?FnMVM7Nilfpmr2vj9E0PpyWucSjjKrmGQ8CZO0EWiiTYapD3gtbJTFXDAzHK?=
 =?us-ascii?Q?EZ3Y/jUQyjarR34yhK23V1iqJi3HebnVzucVKZazo5cEo4/uTOm5wxdimk/K?=
 =?us-ascii?Q?aa5aDZtqICPAaRX7DDpIVlVdaBOshbqjoWf8Mb/NsSnfdOgriGkTd+g5Auqh?=
 =?us-ascii?Q?tPL9V6FJxC6MDin7vpjsbMIYOcJ0syOIIF5/0U9+GQofSZpYyJ7VJW921byk?=
 =?us-ascii?Q?aW120MGOo3UebUSxorTuz85dgz/82+KUCJvRtTlAgv+L51W+hwUwYyb0o6NF?=
 =?us-ascii?Q?FDd16ZgY9IVMgUryOOYpjuA8PeKRl/W36HZoDj2FPW3EulTpduKolk29+YBA?=
 =?us-ascii?Q?nMji7xcGbXjm/7UXRn+EKgi3Pgckvmdafdz3Qv/9ycTIku6w8QBGHOKgiCnh?=
 =?us-ascii?Q?wv/YtQxzumABNf+1mrq41ZCedxiNaKVa8wfMiGDc4q5f1CM0pFg3QfQkrpLi?=
 =?us-ascii?Q?Dsouza+d1gEnRCLnoCASbaYPDPhWWs/sn1z5fRUAWVbNqkyJUTVyXkLwgd8/?=
 =?us-ascii?Q?Sz7CnzMfPRklXbcixYgGoz/mM3qMc7BY1LSnEhNTYydeI9c9If/O/jIAnZIb?=
 =?us-ascii?Q?S2jIpn5leYNFz1v2hAmIIGbn7ApFRSwGiSxLOSJQ4JUEa8tfeXz+1TTp09U9?=
 =?us-ascii?Q?JocAwKFVhR96ti4r2Prya8kuWtHbz3lWlIxC8l9AECdeBVxcxnfX75MoLmr0?=
 =?us-ascii?Q?3vEqaDDfzNeqJX/c2gl1Df8iQfAmA2eem/fDWzVV+x3WlmShuumvHnlemtpu?=
 =?us-ascii?Q?D3tLGOnTmCZxKJn+MBgzEqRKw7y4N1rsvrV/mLPAiEAzQAZqKr/zqe++2ALm?=
 =?us-ascii?Q?oJ66M1gTP1rHtsIMv0o9nQDIhi7eIAhUbFu8pM3aLzOmLqE6dOINeBw8JR65?=
 =?us-ascii?Q?Ab4E8ejoyn2nBLCPSIY4E2GdFraHW5haQS5GZXEqmJe/R9dBzVuZvh7CpmpS?=
 =?us-ascii?Q?OKEiC69l8UyCRAzkk/3RNpql1r4y/2zjmsw12Fz1LHAOg7U1Qcxq2YQWNZEo?=
 =?us-ascii?Q?EdL7k4iX/PNFbQQTH74l7jzwQJIR11aoGUgpjZQAyS+WGUd7G2ZOaWpk8kfC?=
 =?us-ascii?Q?cgLpW+F9W/7Ds4GmeQno1O0vq2KuEqeq0AKVVBN0mL+vKbkjKsM7fbHErp9a?=
 =?us-ascii?Q?u3L3MDF87tdI0+56hdmrxErZQEQlOeD4ICcxqANGFlpbl0l5Q6GRY6EQq7Ow?=
 =?us-ascii?Q?dBAFxXIb+jtl2G3B0lqv8ywnUAnzVK6GykmoOckj23UKZSOGiiEI+StudLqJ?=
 =?us-ascii?Q?m9QIU96J2W0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8969.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OA4NB6XH+lKbH/Z3Dh6ffZH2SCaTAt6x+obTRJLctwXbjMBdEWWLDQuysOaY?=
 =?us-ascii?Q?ododXc4PePeSoiV4S95ADD0VeCdCLz4P1dZqlUY+bDvzyV4plfb2iEEI8Tpx?=
 =?us-ascii?Q?FmaIMt3gEZoF5a9glNk1TtYcpNsZIfn3ChzOibFa2JDmZSq7G7pSX9IjUs6s?=
 =?us-ascii?Q?7G0QtCtb/lqVfD6RwqyJ7baA5YHEiqUc1gisFg9sdhcfCEI54WF+OW4ncoQM?=
 =?us-ascii?Q?880cx7tiyJJaGm+IfYufxlF1IjPv3MIDZdPKiSFZlSO+IhjziM8pwJlgNdNX?=
 =?us-ascii?Q?2TLvkctm/zR9kqiysmU9C1/g7MdqD53ONas8p2rtAp43d/pGbOZw5TGsZ7mw?=
 =?us-ascii?Q?/cTgfrqF6Z+Xk9kuOVvFavgDIt5eLBLs4KWZ6P3F5E1de8IJ8IY9a808bmOn?=
 =?us-ascii?Q?199MGK37gf17iN+ryQeryzrpszp+Fc4Kx7XrkwdQBeWlFl7nVimTuAHCpX13?=
 =?us-ascii?Q?mWtxxRamOP9/thtagro2S+bKjTNShpVDEX52LmWlGJ/F1ESSPOdH9XYgUxr2?=
 =?us-ascii?Q?L+koPi+YkEc/msBIwPXMhYH32zM9rO7K1sovfOnC4CJA5LpomhqR6xrPDdKy?=
 =?us-ascii?Q?TiqCYPsVTF3+jwEroPLWua/84bKqykdGMZ9FHvlL+/EZiKOnqW6m9kMlOY3n?=
 =?us-ascii?Q?RetZwOaXo8ksvTP1Xr3cgqs5oXzb0dFrLnwIhpgmGar3exlguXJcyCo41Xjv?=
 =?us-ascii?Q?IP9YmrOD3R4tqAkBty6sNxjnByG1iah//A/UTqMkbkgXmJuG9G/hkm6w9eEN?=
 =?us-ascii?Q?qbFohO44k4or1+xFRWsKHLCCKuclHSLFoPElbCvMDiVW8a0hpsBf/5KJ8hsm?=
 =?us-ascii?Q?t5oqoSUVOXpjyPzflZMe6ojZllOd47hK+1ZS8QnFmzM1ZrUr9ppep8COvwmR?=
 =?us-ascii?Q?wT5jNwfL6GA1mdX9M/EgOUtpyK41OZmU2r4b4oZLup8Zj9bcsWID05YTPG/L?=
 =?us-ascii?Q?4+b4aerv70fngyNcj3fupRPGFS0+r2vbEgZQovJf0Hlb3NtjZV3T2HttCOhe?=
 =?us-ascii?Q?DXpvBrC22mpYobEXzLMF9k3PSnpyCe18lQA7v3tN9o6/F2fGnA2bHr91CE2f?=
 =?us-ascii?Q?bmX9Pw6xOnjsroh9ffbp8GD8h9G2LcLnsOEFO8TSKAAE8ifZNnEPvGigB0sU?=
 =?us-ascii?Q?AYwGCw2Lp8fYbo8cKFXRMsEaOo8B13wGxVwK2RMhHSP4UQIvCHWclAFfxF0T?=
 =?us-ascii?Q?aQzdpPnZmkCAA4hJB4JznKBoy9daaCKvj5UkrKPwBcn0hBavU1mga7lradbG?=
 =?us-ascii?Q?QE8aEO07nPgDuwBwQXezou6Bpa4iyPTYj/kbTTfIaIuuQTRagd9QKtsmhFBP?=
 =?us-ascii?Q?TiAL3FiXEWC4sJx22H0YB9WLpSBoogaVuDhK7ZWV1Ep72AyLU7Iv0Sb3D53H?=
 =?us-ascii?Q?xHipasiY6sV1sY0o7VY24uPVsuL6PnSFnt3KJUzLmruH6Bmp+hPiI3DKLexv?=
 =?us-ascii?Q?Mo39k22iYXghE+WpiPrfbpsnza4U95VhcA/x4GVJe+UAi7GjzrvaiyFwms4I?=
 =?us-ascii?Q?vv5ANgwaxGfKz/KyhPwjz2sXZPNyD+pG11YeAsQoV13Bn40Ng5Awz5dNkypn?=
 =?us-ascii?Q?Ujw1/lkfdVpw80Kjp24r1cwWhvWRHrH2VE/I5li7AppbdDWFEXxJF492JVz9?=
 =?us-ascii?Q?Ww=3D=3D?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 472f407d-84d7-42e8-b8fa-08dd9a32766e
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8969.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:46:08.4918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEnMXSAizaYYMRoerMa/OkrfdsUmqKZbIQqLzdj3YRd78VHntVmy7c6MuoPoGb6u2x6p1Z5WFjRf+o7t6v7UFJmaF60F66o2N2d8+ZDXHmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10829

Hi Marcel,

sorry, but I have some additional questions to fully understand your
setup...

On Mon, 19 May 2025 15:32:27 +0200
Marcel Ziswiler <marcel.ziswiler@codethink.co.uk> wrote:
[...]
> > just a quick question to better understand your setup (and check
> > where the issue comes from):
> > in the email below, you say that tasks are statically assigned to
> > cores; how did you do this? Did you use isolated cpusets,  
> 
> Yes, we use the cpuset controller from the cgroup-v2 APIs in the
> linux kernel in order to partition CPUs and memory nodes. In detail,
> we use the AllowedCPUs and AllowedMemoryNodes in systemd's slice
> configurations.

How do you configure systemd? I am having troubles in reproducing your
AllowedCPUs configuration... This is an example of what I am trying:
	sudo systemctl set-property --runtime custom-workload.slice AllowedCPUs=1
	sudo systemctl set-property --runtime init.scope AllowedCPUs=0,2,3
	sudo systemctl set-property --runtime system.slice AllowedCPUs=0,2,3
	sudo systemctl set-property --runtime user.slice AllowedCPUs=0,2,3
and then I try to run a SCHED_DEADLINE application with
	sudo systemd-run --scope -p Slice=custom-workload.slice <application>

However, this does not work because systemd is not creating an isolated
cpuset... So, the root domain still contains CPUs 0-3, and the
"custom-workload.slice" cpuset only has CPU 1. Hence, the check
                        /*
                         * Don't allow tasks with an affinity mask smaller than
                         * the entire root_domain to become SCHED_DEADLINE. We
                         * will also fail if there's no bandwidth available.
                         */
                        if (!cpumask_subset(span, p->cpus_ptr) ||
                            rq->rd->dl_bw.bw == 0) {
                                retval = -EPERM;
                                goto unlock;
                        }
in sched_setsched() fails.


How are you configuring the cpusets? Also, which kernel version are you using?
(sorry if you already posted this information in previous emails and I am
missing something obvious)


			Thanks,
				Luca
