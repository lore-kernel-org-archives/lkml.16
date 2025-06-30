Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B2E28DB48
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297182; cv=fail; b=SJRm+cBhlWWmBAf+gB8Qj8IEYuHMbH5H6ZJYhSouV4rhHshuwO7/vmh8+xYApziGXkaYrWshOuRNEdeFPAsMk8Io1qxIEvhtxMzJdVFlS4CJlcc1P1ZMkJGZ/Oo6TkO3nSTGHdFyhne5E7mCXHZCXocQCq3OzyMa/7f9hhyNDII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297182; c=relaxed/simple;
	bh=FMjTnKvC80JaEuPnw2dXJn4ngCi3NoGWCuEb2FtTN20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RPKj0meZyIjPmErRZixYuH1oOrDERSVEsWRDNe3M37lo4t3zL5HyfTcEkmiNnb0Ahi/qzAWLXxQIfH0HMGFWN1bbge00lPEVe5Gj1AGTqEqQzvsV2Y9nFopiUy8Rv//umsyGOIrh5YiBPzzAyf3WhAVoAy5YtVPR6Y77m5QXzkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HsuGZrxJ; arc=fail smtp.client-ip=40.107.244.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HsuGZrxJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQBC2USdQO9bAAKV+0MGLJJ57IDKV2xCA/NLexF12zCVW9+IM3jMo6CET/Gaw+xcaxDFtG6dAsbyFGIwtPhYYOHaczBM3lF84REmYnK/eyJA9rDbxU43GgOcVBJ/xd4VImNW+drF/HxTMasNBnt+//0HexvG8VAVK/9Is/Gtbgc4izOkRQ4UqFPWl1KxIIOMoB64Xw7+o19W0Bh6IquFd1197OGeVwaBjaNWa9hJN3LzePWvdeZjpL8UmchRdZXKm+GqJEF2iOX7NUiZF58OWikxA9BH+E/I227KBwPG6dEtl1K81xPSXJhd4iUMezs9XfuzQ+muQO6AF3MkLWt6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVil2Q1+IE2C+0OJwVZ9BTBtQhYgYWUrsoiKp7aqZ+Q=;
 b=N2+DMWxZOeZrN0uxJLdmDhFgjngLquVVit55M3mJvPohSvKOZabBjZ0EkwfAglONpOQRmanQBpOqi64KkMsuKKxZlRBLHgbmvdd0j2lOpuvb813ZoZSRVAPtL63rdZSGXhw43fPnueCL84YByh/oKYon9LyScjg3xiCc6CkJ8PKi/YzSgpfc0oqxC9Sp1WF4GcHIeZmJzPKrQ5g/Zd8SHBwodr9j1XEqAvnqXtOk6SYjPUzzOnfVaJPeYpXDF7pgZTf3FpOYEgVQuQXfudkSj2MNoVKaCBub33t6dboKeIj2a2a785MbNpnYk/bvVYyaHy14l8GRnRkN3ZuqIV6F6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVil2Q1+IE2C+0OJwVZ9BTBtQhYgYWUrsoiKp7aqZ+Q=;
 b=HsuGZrxJXgmHnAJy7aDSBs+ToIvx0NEsfeFeRQKMbSHzfA0kvvWz1uybeNh8sRXY1Q9mhO1ONxkqTev8Tiu9DNtI5SYs5b1HpJe4nSOzxPQ23MnnoG10JAQMcH6mMRJPPdGqlab8A6ZhsaoaWgGubJqRthvom95hwwZaIuVlHMT8CwolLfkaJ7iN+m7RZIHpGZYPni5PLZrGqLuzEd2dF9QPGlgcTu1qUdzaaiomApn7gzBaNDL9jrzaKR+xdvCqz5Aj6Fg0qcJGzpMJPQP8BkUzgNHh+p15Gw6cWeLPChRCHO9DhYlsrYZmkuCwj63vRtYEMtzQEeIqWy3g0CFyFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB7771.namprd12.prod.outlook.com (2603:10b6:8:138::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 30 Jun
 2025 15:26:18 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Mon, 30 Jun 2025
 15:26:18 +0000
Date: Mon, 30 Jun 2025 11:26:16 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v5 09/14] sched/debug: Add support to change sched_ext
 server params
Message-ID: <20250630152616.GA2447467@joelnvbox>
References: <20250620203219.4135196-10-joelagnelf@nvidia.com>
 <aFnRUA1oY7BsBncv@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFnRUA1oY7BsBncv@slm.duckdns.org>
X-ClientProxiedBy: BL1PR13CA0241.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::6) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 870af662-293d-475a-ead2-08ddb7ea75d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M2yTR1sb+mL4qgzvTR07PQFfZBnngqdO3WVdLP/F4QBGdAVLU8inhLCVYkuP?=
 =?us-ascii?Q?BX7ftAdySSkkZ4mYX0gWHy041hUYCNxdbFcKSrENXEWN02pQUi+xojlM8NCd?=
 =?us-ascii?Q?1HrRWJhmQfwS5q9v5eyNCiDa5BJkwkKsdhelqqDXs2/GV7baSCmHLFTa1INX?=
 =?us-ascii?Q?e7+DUyuKwEHu7QAFQibX6r/EC+eaGEpFPlTQyOoAFqTPuenSCpjmSrt3ZEVM?=
 =?us-ascii?Q?2lKRo1qE6w25gFeWKxffiRZqW1oWpwbqJKSh8sGXW4zr58Bk7Ofksnn6eiCc?=
 =?us-ascii?Q?wLKYaCT6DIN8nWzij1sx+feNXlan/x0Rj1/eXdQ2QSljSoKbzIVVcc2hEecn?=
 =?us-ascii?Q?jSKndHqtzKJyRlovZI3iT/AZD1KejufPFCTowBwmTMIEQkdzguTHt8oN/2rs?=
 =?us-ascii?Q?uDktBOygHycNS/7iVRVzjXxb2v7pZtVg1Rqo7U+NCEWN7tzln9xu0wt/7Jbz?=
 =?us-ascii?Q?P3e/To8Lg3/rpq/dRR+qRqKzP7221u20r5iPuLdKIfb8nhdJYensUBMo2ZQ5?=
 =?us-ascii?Q?CFrRUCTvd12YXmI+pDpg9+U6OYaOTCU/cQENHRp2GTKlx4MfvdSRdyIcqMyv?=
 =?us-ascii?Q?2maBom71VP58pLoekLAfV2IlzQqKCUvMGB3zk34fyGpGqRFKjILI+Kt1kPMC?=
 =?us-ascii?Q?BoJsY/0IBPIrNyEESF19VG+LWyT6gBu95WUeDg9nNn7bR+SyxTQA2nzV8SBN?=
 =?us-ascii?Q?+7Ukr0d7VKdNGeZmBP1W8evePMQs2URjVAS1RVXkh6RbtkYITes2Cc6GTeGu?=
 =?us-ascii?Q?E7Unam6gdeiGCGfLXI8OeAR7cAEznCVijV5bO379GCrOIMVOVsfb4vveLfcM?=
 =?us-ascii?Q?5DnvlbE6EZPlN4l0sl1BaWyI2qktViz0rZuAy8j5HUFHTPGLDHi+oF9vTZyI?=
 =?us-ascii?Q?HnvSkuEY3QJDJvRRpGQdUlV+atqV2hyv1TRCLijKJKRcQcOdDk29hwmVREnj?=
 =?us-ascii?Q?N08l0eopSASxCo6neNeXQZhnTFaG2cmatHnPFK0E3NVcU8HoXUX75upLmt6B?=
 =?us-ascii?Q?yPYUP4GMNjWfZaflfoXGenSpGxKYimP/a74BO1vP/SggK67HTOgZAZaojH6M?=
 =?us-ascii?Q?qyq6tzacKBJsxhIaHBjqCICgv4m/vUyFslj0BzVwmYMbUU2SPx6MP8Km7Ev6?=
 =?us-ascii?Q?P6C95KRY9EQEjWzh3C5/31FOkEW/kNJTEtCBp38J8Ewb+sYfU6y4nGV7sV3U?=
 =?us-ascii?Q?RmyeYp0P9MF/RBvwVjmztNLqvTrEJzTv1wH0YeKdX37tgiWYpm09sNZOzLuB?=
 =?us-ascii?Q?RGlZF5LYX/8OolBho/jZfYraAq29nSkC16h03y4DoIHADBE6FD2+c07hw79q?=
 =?us-ascii?Q?123XXfRXymU71BeMCy5IQ0Tbiv5zqwjvLpT0UmCvTj8iZlZh1vZo1BXBC/4d?=
 =?us-ascii?Q?SUdt/K5RFUZN5AczhbMJ0DdvYGg9Gn0ZcP/pelXPxNOw7uI3Bt3LLBadBQ+8?=
 =?us-ascii?Q?wNGgQLvyZwI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DpddOrF0XT76TKr4jRSwpxYzm5ke04MCJi0frYBIYOFZRaByLvgavle1HG35?=
 =?us-ascii?Q?qbHUxf+Y7H1fUZLrweB0j4uzfmBd13LpZ972HkbnOX78ZvxaQM+5c/1nJR20?=
 =?us-ascii?Q?2aTJirUudvbcjRoPV1+C2Ch1pHM2MIiwzGua3r+OmS1w/D68a7SQAJ2oo1un?=
 =?us-ascii?Q?T+3vSNspPNrp2l28+Bnkwb0AXWEaSG6lt5VJilgMTZDmShWz64eiy10flMJU?=
 =?us-ascii?Q?96EDk5uYxTvGU8fxm52MjhL4kPOBW5co6PqyaHupMOvPH7yEXBoovPYQqHc7?=
 =?us-ascii?Q?WcynH+bIyevupitJkmIOdjcMCf2+yPs34EXKc19RcQcmCn412KTB02Ibi6x+?=
 =?us-ascii?Q?YXDqbth7bQSqv6yZ61Xa4WJPrMax66WKWvrnhlAt0clQH69qbYd1QKjOJxeZ?=
 =?us-ascii?Q?oUh4N2N1IzcxO5f8KK5A32R8a1TaLFKdgmPBsptKq/alPqYGeZyx5weqXUAL?=
 =?us-ascii?Q?rtX5mYKBmjft1dRHiJ46qFpw9CX6u+tTbc0rqbU1U7Kj3d541lD2EVOw1epi?=
 =?us-ascii?Q?67CF8wYqxi9fkkyxSRDqZ97lBJ8Dt490V4rRXz3elZFbP2hUcQo10InNqXmQ?=
 =?us-ascii?Q?S01+5GvvQRpTYZaXnEZ57oH8aSVUnjcLn67AD4ipdZHkGLZVOPKatvr3/aP3?=
 =?us-ascii?Q?6xz4WomWsVnaZtMUwoSNAgUY07b5rlpVqZwfnztaDwHkjMB8dRL2SM7skZ+i?=
 =?us-ascii?Q?s3RgGc0IS9ejeS/OZ6Xv71ruovVPJyhPj3fYR7au1RNoYfwActE6jcKVdxPE?=
 =?us-ascii?Q?cji8pQkonxQ2UR/YNuKu+vDKc8RreTItd57Gro5JZgYTXSD16EyMbSTG8smM?=
 =?us-ascii?Q?yZHGfW0Tm7i8LGvuWQ0Jtt3vnakMiLaw8SY2R7ykGY3FYXc3qgu2phTx88g8?=
 =?us-ascii?Q?5FpgBDH2vjyNNNbRmCU1JXmC2gdMhyJ2uxKAWJJQsQM1iDw89ZMHG1UvtRHz?=
 =?us-ascii?Q?pC7ol/NJdd68IFUIRil7/oM2I38BhhQbu2qv/Pgwa13cp8h6kACA11COuFrI?=
 =?us-ascii?Q?/5nexF2HjDWM3AVDJo5ZMK8C5uV6X81TSdsuVDIuiRK+dWm39Cpf0MAmY96E?=
 =?us-ascii?Q?LPV16NCZn1LILMChUsdqTUbpV39fN3cJ4DaLAOzY39D20TPORjZqY9UEHmcZ?=
 =?us-ascii?Q?k2LNCHQ5LpVfVZdiQH4tovL9gXnqgYOcOfB+Xg+dWy0ACkU2rfFOck5hBWSV?=
 =?us-ascii?Q?NuKz0w/y7WoYS22my9ix3Wu1bfUYQy42pyyLk/ZAUYQo2EGOj14xQMiYZgvl?=
 =?us-ascii?Q?QVXadxjnT/ya54k1W0AHEjWQZ/cubGNcZDi6hq/QHhApUMly/Bp7KI1Qa1Vw?=
 =?us-ascii?Q?gTS5WtXx9bCyVLDvhjoQCimvO5l746Am4D19d6j0LMOzE+NgBvB0u5aDzSG7?=
 =?us-ascii?Q?AUeAtdsi/zhEG1DKw17FhrFHT7BPxH22V/sg+FDRAEQQbOofn3+9L6EN4t9Q?=
 =?us-ascii?Q?JHMoCppu4cfATVaNM0g4ey5D3Lvha/56m7jWYW1TjNw06JR7G6mciBWMgB7z?=
 =?us-ascii?Q?uOvwgJQgUElGndlIIzCnIie5ea6F92t988q43nFduhTXdGB2vH1iY9PD7wWN?=
 =?us-ascii?Q?gYRSz+C1JENwlQpIgCzqhjGP4jmxLPMg2oJTd+Gl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 870af662-293d-475a-ead2-08ddb7ea75d5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 15:26:18.5370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzLyALHgbi1QOVr/dPr5vD2VkELrT5RYaZJoB7bBfM/kgsQou++lwa7EJpSACOt30W2zSJFK4NtZPrJcMNbjiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7771

Hi Tejun,

On Mon, Jun 23, 2025 at 12:12:32 -1000, Tejun Heo wrote:
> On Fri, Jun 20, 2025 at 04:32:24PM -0400, Joel Fernandes wrote:
> ...
> > -		if (!runtime)
> > -			printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
> > -					cpu_of(rq));
> > +		if (!runtime) {
> > +			if (server == &rq->fair_server)
> > +				printk_deferred("Fair server disabled on CPU %d, system may crash due to starvation.\n",
> > +						cpu_of(rq));
> > +			else
> > +				printk_deferred("Ext server disabled on CPU %d, system may crash due to starvation.\n",
> > +						cpu_of(rq));
> 
> It's minor but the above is a bit ugly. Maybe pass in the name as an arg or
> put it in dl_se?

Thanks, I changed it to the following for the next revision, which is
indeed cleaner:

	printk_deferred("%s server disabled on CPU %d, system may crash due to starvation.\n",
			server == &rq->fair_server ? "Fair" : "Ext", cpu_of(rq));


thanks,

 - Joel

