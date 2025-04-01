Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2046.outbound.protection.outlook.com [40.107.96.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52F61DB55C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743489204; cv=fail; b=k3jmWslhqsbzqxSFcXnqxudQlippHskLEkCq09g5VTi6VMNXsaCFq3+c0bkMFxuR8SEAO8bzxFssuV75UNCv9WVgsSEJNS6IppoVTGgAF6Fqjy/jv+uhvRhk60vC9V8H0xcFij3Sm9WOJSAnulXOd7aFd/FjpVs7v06Lwhq4jAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743489204; c=relaxed/simple;
	bh=eNAKiB+SO4nJEEDc0KzKvOCyfxBLTmc5LpM1afWzy7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q55utzpE3Ph0Q2yjZJ4pVQzDT/7ddApEd8E+W+5Sqq6uvn36Bv4owoDiKpcy5BlW5GMFc1PYjGc1bM8p36S1fG4WI/hhMHJKZOAvsVtIkeA6t6VCJH6OYXQbix4B7KlJ2lYqtaAN+VpBDFMIqlGpC/ur3ZCSW1GnQWJkUUQuBnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EDOCml1+; arc=fail smtp.client-ip=40.107.96.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EDOCml1+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAeX42A+gp1xNfP2w+X8RQ58ZdgrHibFH9ssa5ISEp7TBoYMnamEQ8cbU58159j5UYKs3GGkU118Hp1ZyseQW1EFrhYiXuGwR6uCiBpEAhbfvaroJftU9+EAVdhM0kS+fz4+YeMJ/suKuMvxTZfxnfLIhZ/HHts8dIt+FNvOnz3R/9XrVsdADCHuwNKyHVT6bbAecL09QURXumb7BILsK5aF1xjOrNm290Kb2+D9OcwfxrczI30iESyO2V3wfDYK7wDYzMp6My3ZIS3bL+FsnaNmeDarStMmyk5SJgy0NKzHybZ+/Z5v7KHDn3M8kpMwMO3GSp1wcIEhY0vm2e6EsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXqkqp2jy3rHdhp9AcHWFCwckNJCRDXCSNSZxViB0k0=;
 b=jBH6sM4rPwrJBJtEOB6jowz65iUsSKzIqPzAxtBLwjSIEBtEzTBbtmqikc0HwoV/+wtPrWSyypgG3afuiP3De3FhimIMHymZH8C3t8H44YganfWLXmD/1vt2CnttIt1Yc4ztuTH0WLP4kWTk/rFa8iL93CbtQEthNsDBaLlBfVYLKnpFbK9sglEn4GMev13Z0A7Dx88oS6xE5wJuIPR8fwoPpJtXuqBuB99lQq9X7lPpVHtTEpFwtjeaDyPqRH/m+xGhqC75J8r7OpblKUPanygmaJNbKBOJOUyisfEURYj9Na8nRyyn8bPHH3kCClj/7TEn5+16NSsOkLdSLVmQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXqkqp2jy3rHdhp9AcHWFCwckNJCRDXCSNSZxViB0k0=;
 b=EDOCml1+WnaUn3stYa67AL18uYzTLBWt0TuX8Q2vFTV5pc6LfMZMRzdu6O4zXrsfJ0BFcCtr9cOso4iEtvA7QNoKYNGtGUbs2fK8LTyadp7ytgLtT2ReAgKivqou5ABX2JTY6dumF30ElVuCcQNw35q/1C/OFb/t8qPoUW4UNuUxGNYlEHyzVtzhA03RqTXzg20+t3x4o4FQkx26dkoANrgUsUmUBPGqfpskasmPWrF1S/MhIq4TJ0q3cIHjoHIikDy1manDcrkxRp1Y3srTujOWQLj6K56VxJ70zs7wgwrnClYPM67U+WlHsV0a2dHL22uJg2KCVm3TS93dhXrlIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by DS0PR12MB6560.namprd12.prod.outlook.com (2603:10b6:8:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 06:33:19 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 06:33:19 +0000
Date: Tue, 1 Apr 2025 08:33:10 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] sched_ext: idle: Accept an arbitrary cpumask in
 scx_select_cpu_dfl()
Message-ID: <Z-uIpnfjWq6LXSX7@gpd3>
References: <20250321221454.298202-1-arighi@nvidia.com>
 <20250321221454.298202-4-arighi@nvidia.com>
 <Z-sPlB3ih10SS9w0@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-sPlB3ih10SS9w0@slm.duckdns.org>
X-ClientProxiedBy: MI2P293CA0007.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::7) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|DS0PR12MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: a2436bac-7fbc-45ac-fab1-08dd70e717a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fJ8U42oEiiOCe4sYfZrupDT4Lcghj5bW0vJsA9HpYQa6YQ6ZwSb0CYlmOXFR?=
 =?us-ascii?Q?ZOMpHqW9725j1Rw53/IfSzFYmdJwrhzXfZouBGtFJqX71RrAsVSwE3Lwbl0n?=
 =?us-ascii?Q?j5SLpEnc3x1booGRwT7crjCcOxDDXuyI6ZOC2AJVMYvgMJPbwsHjRiYyqW3U?=
 =?us-ascii?Q?kgzAZqE4qdaFIgU2/2ijseGBc83mr+kyW3dX8YW+wnUBdqpJQjtSMSCelsae?=
 =?us-ascii?Q?8r/FTZ38tyOj7LNFZ8j6yV5k/HM+SeSElx85Os3yNf148w8X0KVHhS5HQq/f?=
 =?us-ascii?Q?+9ajkcorMpMveCzAOe1Rtp/zM5nC3wlkkXW5TI3D7taheVep/e09cp9A/dOM?=
 =?us-ascii?Q?2nhpbux3oxl18FLdQaPjIIkIdB4vGVzfTeCEFEy7IjOL8aAsL48GjIpMW5s1?=
 =?us-ascii?Q?fAA5Jr28LGlEoniedjWR3VwAu43IlWGmtsTvTFd0kTG1r3BTYskXI21LTClU?=
 =?us-ascii?Q?BP8OYJhBpaH4B/X833EHDqN79e6Pvhs5qg4ugeqqk9mw0zxX47vno4mSn5dJ?=
 =?us-ascii?Q?7Enp633K/qfNhwCWmA4i7cHlaR2BsXUBT8NN/AJlN2BDHCsPmZTFYMqaIHLS?=
 =?us-ascii?Q?rBz2anYpP+chLGF37MVe8efRvq/9e9VZ1f5UmrbemQ0krNy+tg4kbjjqSyx0?=
 =?us-ascii?Q?QmXIlRq9/b60554sZ4qCZoyD0/fdTMKT+UhBDCDwpbCSdpzM4FOIECi1H6SJ?=
 =?us-ascii?Q?fPajRq9Ablv5H+ESdXqmP/B9w7WKy1W3ExAvChOFK4NJb5HPsBRSboGBnOcv?=
 =?us-ascii?Q?rR61KCsBZpm08h1jBRHHRIaa8Nl0plSSZcRpi+5NOnawZFsh3O7E+PRivxm5?=
 =?us-ascii?Q?/4kkpe238OQRNtJxbw/qolvvkE1JGv3gibiLN1hPg49S/mrqIwkrXvKTeuVl?=
 =?us-ascii?Q?xLCaPp0W/1oG5YG08d5XYUR996eQlG7moklcALxc/8Gyvsyu+u8zU3YowAGJ?=
 =?us-ascii?Q?AWFngDiXgARnhmPuWyBapMuYKXGEeu5wqkG/OtoaSerT1hZLALB3szoHbzCE?=
 =?us-ascii?Q?NufZljA/tTcnPRPmkESbxo9OOVeVnKPGOrrfbu6ftxF2F+EvjWqjimiUIpPH?=
 =?us-ascii?Q?Vys17bx2zq8RY151rapjVooAp8gYkHfbQsPa77OZY7DbzMkxU/3+jfOBVD0c?=
 =?us-ascii?Q?PcDaYGFq0EY2mLpiXB6j4ReOSQ74+85YKo6sxzvnOC2KPk/04bq4pb16FMR3?=
 =?us-ascii?Q?MwLm+zagz4avg3iOqY4LdYNe2h0iz0EElBe9nqUk0EgX5ger96Kcla+gianY?=
 =?us-ascii?Q?lWJRWX6/GcEa9sGDAt/13jaFck7t/tdWuRfI5jfaAvo2QDScO9tvLeX508n9?=
 =?us-ascii?Q?FfEeDdLGPGS93uj1DGfQ9lWUQtPWa0MuEV53quRvA+poYV59hsM6+iOJkMLy?=
 =?us-ascii?Q?L6M+tkE87fxfr7qD9trMkuKpNlei?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OwzsOOgh9wBfexNw39JXWny4pui/4zfL+6unWwPROUPX3Rpw0kICBp254j/M?=
 =?us-ascii?Q?iJWbx4hayjB5hyq80uPv5qFRFwkluYBz19NiT6IdJUB7JS12gy5x9BuI6Ely?=
 =?us-ascii?Q?dtS1NJuOtLgSCKHUZ5rOmbhcpMwiodrs8NRfcGZHy8wD9crsawGCHdCc8IZg?=
 =?us-ascii?Q?Dgcqro4nicBpTsqa2rT5K8gKo2MetR3y0zn9QF6swtrmrSwSelUxQKYBUYl4?=
 =?us-ascii?Q?KxmfSe1s3C/e4NqhFN/2ePTIYwUo8SPSf3WcXOB1Ek9ix8hdOh3nGcLFE2Zv?=
 =?us-ascii?Q?jVmuFGdVfnXAYhCucDvjxzXRCHQNGc2hcPQ8WP/Lp0qqOHXMIINsdZ6gmH3O?=
 =?us-ascii?Q?dqqklHRdjn6mz5Nl7SpzBCfvIZ1DAwEGfRFMSMD7sN3J4i3nnMF8SSzhYkbc?=
 =?us-ascii?Q?RB275TRTJGdHqpeiTTykhlI4DbvReUcIsFLvT2KwpfjFpGimDSMaWXWxdOX8?=
 =?us-ascii?Q?NntRfG4ZoGi3+kXIli2EkgEx5Dlae6NhrRTvCrHciiVRnbXr+1GOL5q5G6fK?=
 =?us-ascii?Q?6MJegg9E+Eri/ZAr9S/K7dxm1uBPsM3CCjxFupWSmKyy/ppGwgS8s5646zC9?=
 =?us-ascii?Q?XiAaARKfpp+jyr9xxMoQz6tKGxEYdQqk068SWoKZD3Nv7l8BrRqqhe0+aID4?=
 =?us-ascii?Q?KGlRy5BCDejrMtrahHFo1ZwESBhxFwvGPFNg3vOqfzGaSxQXXXRcFPFX8fhH?=
 =?us-ascii?Q?g7p3WhbKNylwM/CSoTe0N/48oz8iSJNh1cmTyUpZOcfVhVYoOU7AIaxI57nN?=
 =?us-ascii?Q?Mi35fe0Y79CQ5jCq6uA6rz7yn163Q5jqH63GNpQM+PM5oQPcf8AkocftonBY?=
 =?us-ascii?Q?28MncDO3GUVPOd9u6KKFCV4PFV7C5tZzoinMSfCDbTjsPX1bP0ecQjJ9JzND?=
 =?us-ascii?Q?sDodOWJ6Ai4l8nzLCfYqurh6MWC13gsVXzIxkVfc6zJcpw4MkTx+7SrnBDrq?=
 =?us-ascii?Q?GB0IDkEujQZRaA14Pry8amCR+mwtIhqcODBPBiCmPw8r58hCDgQ6SnYe1Cgm?=
 =?us-ascii?Q?LNqkKllPInqGMsj39pUlPDTis8IQudLtXgqf5hbrEuIfz/J1FJWX2XJrHY6z?=
 =?us-ascii?Q?U1348uvxJtr371og4nUCg0QGO1CzUg2XXKegqdasRVCKC7kSA0oakAG1utP3?=
 =?us-ascii?Q?5xD4qWYszJJht+RzlamRw5W7fOsazGpxcA+/TWngyU40yM+Ak45hQBehMuyB?=
 =?us-ascii?Q?PylIMA8dzr+sPhBf/pRompydjE9CvCssabPIVFSWfM3o4mxvJwcooNlMjtIB?=
 =?us-ascii?Q?4IgmW13L0ZECK0OLiZ4WGgIE7DCDRewKess+BxKaGTpntR8kz6psaXQtbjCG?=
 =?us-ascii?Q?TuF+2zeIwv0rB+ZgyL+7E8Hy2Ih4pZAWXUe8JMbcNWGBxdVwAiZKAcjWbBHz?=
 =?us-ascii?Q?FUYYR+TxBRswDPN/WnJ/OhCQsoSPsQzDy3Y5AO6XQb+tSlOg3BN/6zpGi8vE?=
 =?us-ascii?Q?Xtdmj0pFtEGWm0ZYPsSHNFwxSBGomLde1jXvcnjfAQtlfVRPlJWhB02u6feR?=
 =?us-ascii?Q?olCl221BnA4ROF3nNA7kh/H570sOfBJi4WnFxFsfCQDvTn0PMHVtyxQLxS76?=
 =?us-ascii?Q?2xB4lO/52phbCWvEsEmhh67NMEyRAnnyBe/Of5l5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2436bac-7fbc-45ac-fab1-08dd70e717a1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 06:33:19.3762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJCmBa8hZ/Cpe8B0Izw8IfmHfZxoGznCJ7AuZs2zG8C75zLVpQQTu4F9rM4zcCRKFwTt4WR4e8Zzcz3gsbSQYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6560

On Mon, Mar 31, 2025 at 11:56:36AM -1000, Tejun Heo wrote:
> On Fri, Mar 21, 2025 at 11:10:49PM +0100, Andrea Righi wrote:
> ...
> > +	/*
> > +	 * If @prev_cpu is not in the allowed domain, try to assign a new
> > +	 * arbitrary CPU usable by the task in the allowed domain.
> > +	 */
> > +	if (!cpumask_test_cpu(prev_cpu, allowed)) {
> > +		cpu = cpumask_any_and_distribute(p->cpus_ptr, allowed);
> > +		if (cpu < nr_cpu_ids) {
> > +			prev_cpu = cpu;
> > +		} else {
> > +			cpu = -EBUSY;
> > +			goto out_enable;
> > +		}
> > +	}
> 
> Would it be better to clear it to -1 and disable @prev_cpu optimizations if
> negative? Not a big deal, so please feel free to push back but things like
> wake_sync optimization become a bit weird with @prev_cpu set to some random
> CPU and down the line if we want to allow e.g. preferring previous idle CPU
> even when the sibling CPU isn't idle which seems to help with some
> workloads, this can become tricky.

Maybe a better strategy would be to try with prev_cpu = smp_processor_id(),
if it's in the subset p->cpus_ptr & allowed, which might be beneficial for
some waker->wakee scenarios, otherwise jump directly to the end, with
cpu = scx_pick_idle_cpu(allowed, node, flags).

Thanks,
-Andrea
