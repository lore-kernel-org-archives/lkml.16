Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2048.outbound.protection.outlook.com [40.107.101.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC301DF73B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743489503; cv=fail; b=DYLlInUOSY+WTXpq93LoNfsh8E4NuuwMlYBWOjmpddSqKVhnYOxrp1jSnpz/YTm6Z43+pymiAHqvLqSKhsex8B2AbYGZihkw9kurkKhkBbsd5I0QZP2gQLHWk7kGGCdc+Z2x6zHl/tdLs0koneDahNn+UL6lw0PsaZuRkDwwFA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743489503; c=relaxed/simple;
	bh=YB+IE4m9Gvs2u+ReMfZeUUZnr9/BvhepYGVOgAIGMWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZePAzPMzrpu23a6XawoNnpzzAMYUOwApsBRHR54MG5l9r2tK0WmxXg4ey2+scjO96jO8Eg03Ejjngf8C59DncL3LkkFoNCjzVVkl2/pHflwW2CGIpheYvoclb0taLG+pAPqgXGVa8Bz5ZF5HO8fM0wwhRAJCKd8CzoXiw/3UyRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QkbyWk3U; arc=fail smtp.client-ip=40.107.101.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QkbyWk3U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgbdRGbT6WG0gcqHTUSy2E+lp0GgJ6cHXZXXdojLpZ0+PIRvwyYZ5Mn/M0ZkkO8I8SNOsK6rkYwoBaOr8oaG8GO08nOQEzbw/oLWMYnY/yNwTllGw3fhrEFF674NcyrM+n7QmwrTcbDaBCssZsXl3nnbmHW2W2QcdiMiGwvJuoVmDe9yDByFUMIlWbBsPMPVDxuBBH0dMVqBcXQ/shVX50F4U0HHw4iTOHg8mc5prtXouMVNgbkG4JoT9saX9lV3/p+zS0JSXJwYECimUUv7HJHYlQ/38drZ3rm4rwt0ml7rFFKj5AmeiHu0wKexbNfmH+Mg0zBsV7a08QVDEL+WIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PS64bhlx0b2A3SmllP54jg/y4hz/Y1LokAdkxCJgjw=;
 b=o6vYQRaetOgkiuLinA9GpsPf11WGV0wptZ8pdTI3FrDGhN8H1ao4axkuHdto/Wz/jD90H6M+SGTDIbtrpyURRvw6/15cbNlFRe4GBu78DG3WxWMKYlhtnbOcTzjPeVufzMbG3gAJQQVOWr7v4vIm1q6Y4HIrE2ddSFeuMa/eXau6pzc7HoLxVXA6VF+Uic5/JGzD3pfPOp+03WyK5oH0kYdu5BSc6j+NkUMMsjMgYiELUCPS2cYwVOaU41j+mH4q48JFh4wchRIaU7oOEx7nGLn0NHjukWjePm7Ob68g4wkHs3DXIc+oL7lnJCfX78PgeXMEr3VCXvy5p/HCSEhlYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PS64bhlx0b2A3SmllP54jg/y4hz/Y1LokAdkxCJgjw=;
 b=QkbyWk3UKmXRJ2cvwtgKNmgTwnR6BJ3KjJdLULhbtdaKLgZ3XVsd+Axy0V1GCPmFpSXVvNZN0kNIhx9duZhbLfaGakfjjLEYAJSNv4MrCmSo+Z2JU9nHbOETeRxgC9zTP9ujjQ0HlapG6hx3U78Bh62YBWoJ0ubabMMRmqZBjWQ7FmMyR9E19JTdKTv0/b73HyvocX9OoS+Fjk/Ucr+uITFbIHWL9GSRkFftVXbSe8/Lrr54xANzy6kax+A9ATyZSpXefqe9Ygc1GGu7gPw1BSn1m+BUCSw2yoYLd4tQDGSfJcCZdoUK5CzcIeQAceS4jKgvPH57SVSz2jdTd6v7BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by LV8PR12MB9112.namprd12.prod.outlook.com (2603:10b6:408:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 06:38:19 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 06:38:18 +0000
Date: Tue, 1 Apr 2025 08:38:10 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] sched_ext: idle: Deprecate scx_bpf_select_cpu_dfl()
Message-ID: <Z-uJ0m_bs4VXoDqQ@gpd3>
References: <20250321221454.298202-1-arighi@nvidia.com>
 <20250321221454.298202-7-arighi@nvidia.com>
 <Z-sQsqt6kKLqJfJf@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-sQsqt6kKLqJfJf@slm.duckdns.org>
X-ClientProxiedBy: MI1P293CA0019.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::16) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|LV8PR12MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c6938d-f81c-42f3-9df3-08dd70e7c9db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4dIZ3J1JVO1Ulo/o6bniSSOSGPhBt9lLh/jXVcI/MIqrFlH/RLSjQboMRRKD?=
 =?us-ascii?Q?2dHMzGwVgh6kPeQyd20Gu9R7vLm9izpXY1UAb8pTzKbq2qAiwPtrm5I8fAMI?=
 =?us-ascii?Q?TKdK12bIKGdFPewoOG+rnKc5DI4RniQAjAbNh5dPmvPzWUpEVURgFuFI4mNq?=
 =?us-ascii?Q?xNZ66oH1nBVFkOLai+P8ghQAXiF1WG7mIrZbAKRst/QoQNQoYCPD/Djn8DYa?=
 =?us-ascii?Q?b7fDrcAyK909WEa5EXKshUKhAERnMMDclyqwEdSQj0vnVkCrx6SfEhFXK4TE?=
 =?us-ascii?Q?a9kLXjZ/muXBMfVErjxOWUnGKHb9+PQyfm+ZLRWVAVQtN3UkjV7ZQ/nfyXdY?=
 =?us-ascii?Q?xNx6pqR4o7KgH5EBMikoxvjZcL22Wl16X13yQfvIoJmAPfJt05aOESjIRys8?=
 =?us-ascii?Q?GRrjz2GHzBMmfEo8fp+atl6hpPhblTrchPGrDIB9LD0WdSN8+nR17YKccuo3?=
 =?us-ascii?Q?nrBwSvoAA9GzRtKsLfEiAP9LEQcZ1aTUA3ZZK2dBy+fBmm5TJi0ipQOEOFgs?=
 =?us-ascii?Q?+uu8C6Yu1Xd32m3dpqqvwzlQC2DdzIpq9aWEwsJQNUeMuvodkpNlLFwAqbWh?=
 =?us-ascii?Q?MQgTiTCrnHHSpCGE3FIZkt5yGAVUJKrIS4JNiJATgb4eFKTNR8q413932xAz?=
 =?us-ascii?Q?XVUpQ7+Ud18xPJu4YLoRuDsAyQReVv8x5LlHi8pG9OagMs13KKsCs9McqaDe?=
 =?us-ascii?Q?6KQdScfLmZhiYE9wYTYCbPRpa0+r7y3T3cxk2gJ4rcY+q3HUCdjyXYjDdIJ+?=
 =?us-ascii?Q?lZMX1hOqhpP3fzuAfejKX0u23T8Yu2kEjdTKfCInFNLgp/tKd25xF3K6Q4bq?=
 =?us-ascii?Q?ozPRq7rsl+XvKx8yira2YuQFxEasPgvEI6uVPSbLuQBH84l5GBrm72sVTFBz?=
 =?us-ascii?Q?tuJ+xhHcZBR9mZ3Mdt1fjx84sulm0QVUHioC/x7YgmJINCAxR1zIoxugrMAr?=
 =?us-ascii?Q?08956CxAhMK8AHXwvCmxA0L5rVttom/fLoI1crG/nq8apeivlqUvOPxIlZIY?=
 =?us-ascii?Q?guZL1IANJsrN5/Ytf5OLxwWPQBwI5g9R992asi1/NQrTlbWwrgHmyIaIUJI8?=
 =?us-ascii?Q?gevAgJvDTPw+j/DY2vfxlJYvrzKqJ0a6vmuZeILKKT5zZ1uLcXqFJFDG+5pr?=
 =?us-ascii?Q?kX5izGqZkzpkaTa9fkr2fWfOBfKm155+OB6ItEmQYezBmoZKjCCksCYhsDK6?=
 =?us-ascii?Q?Yx3bEYfA21QJj4Ct65w0ojHm4mpoYjsuQ3pjVJLREOn0aRHvD1ihpL+j1Gt9?=
 =?us-ascii?Q?5Glk1ikTFtYbTvlvEkSv836ZIVXUKB6DaRG3vN82Zsxp78VBwDs8e1CZBbkX?=
 =?us-ascii?Q?1tvBlyafQbGw0AMoeh0sK5tyqN8dEYs26gZXmzZkNDinBa21eerT6+GYAPgr?=
 =?us-ascii?Q?elBnlEAIGFP3YUSNrSzIsYN8F3IZbnVskFpw7v99ctcvkpxNZ4GnU9z5MwP4?=
 =?us-ascii?Q?76mfac1jwZ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LsFEbGNJh9fkuNfajDu4rLorBCv54PwXkdxFZ7GTpWiqUF3xV7uEmE2wq8re?=
 =?us-ascii?Q?k32C7tvhGxsKGl+VLW/LjR9QCT5J3w7ftvT+Av75Y4gecu/+qfhLnrN6Oq4K?=
 =?us-ascii?Q?d4LS0CaXgZ0LbitHTmriF3eQi9QzT9lvgiIF0396i58kx5I7ZO4VzNJXBDGT?=
 =?us-ascii?Q?TOE342d3SIjReBIosTONRrZaEanLouebI6vuPtzHZUTHrWGZYZX8vUCmLZHR?=
 =?us-ascii?Q?4iIjD/9yHA28SbVJlhyCHBufvrwl8gaogcwXAhZ50xCb6EQ/EcUkUzAFTiZd?=
 =?us-ascii?Q?rTWw32FOfVNJ11TeQtVh1ZeaIbeYuCOh4SB85vGOQ/MKslRj6r+wFJaFk5sO?=
 =?us-ascii?Q?r4GVgpWSvqPXxI1zcBBUFc/rYSsp1Vj5PFF1a/DuE4c1l7eLkBG/eGjvTx5g?=
 =?us-ascii?Q?JcUaCndUOrn/iO7+HTZd3mG+vrha/IetPMjkmflMU60vR+jh6YVgrDWsh+Sm?=
 =?us-ascii?Q?HVwS5+6VDXEgDaMMNtQrrhplMxd5bSAYpERh3qh80pTc41CFDAEsamSQ6pb8?=
 =?us-ascii?Q?sENT3PpoGgjCNONSVm+uQ5y3LWcWzgwHwyudY0iunUoqvp2+/ajwuzI/DlIc?=
 =?us-ascii?Q?yu3iI1dviVkd1h8k1T0/MyfwYEWgUpW9kj72t2OxIOhIze3fe1r9VcD2ExD/?=
 =?us-ascii?Q?ko1QUQnP6UMwZuRhDpg5ydJAwsaf0f6jgwKKN2/+vTVbdmGeX0GcGxvOT+xj?=
 =?us-ascii?Q?G43CsERwu5WyfiqHPf1MDnkQHqjSCknZYEjTfjdY1JIdDMiO89RHvGe8eDR9?=
 =?us-ascii?Q?xvtYYs4spDdmBwd4OLhewEv/5OmFkH3jw+ra6XqMgTaLld7lJexlfYvGFbXi?=
 =?us-ascii?Q?OFGtWiY8HDQcjZu4ZXX195GdjM78WWJ9CNYlkhLVPkAhN8B+1KgYZu6VWdIh?=
 =?us-ascii?Q?xtgJ5DS2ccrHiALIeKVsG9lKPzCUp1k03B5O0xhN8JqNkxcB2tPS82pNVSxC?=
 =?us-ascii?Q?KZCjyiEBkmgcMkrLpzwoihT/jUYLRm1cH6Wm/Vts+4Gwxb/UGO7GE6r1W6HJ?=
 =?us-ascii?Q?93EIcuXHWFQOvraYbjx1UMofXkR5WDgO0x+u56JCO83C9SY629Rr/PPQGZ6R?=
 =?us-ascii?Q?PWG9/V/BywF5V8LoPb+TV0Kn5fB63/ZuKtNvKsaxGZHr+eZMOt8Rdmi0wf5Q?=
 =?us-ascii?Q?306WLTq6H88pQi/SOdBw/MaF15V4wZ0y42evENyZzEr+lzhl74oS5hBuG6K0?=
 =?us-ascii?Q?TgSvW0d2rHsnKcI1JxKticrRA5i6rhWmjIE5kDoq0RL6Ojv1UP5u4vMX1sZC?=
 =?us-ascii?Q?do2Y8/yskyLmA+hxGPtvDzR6HQzBvkAFvSQFaZIf2qCVi+9K9wn/iJZSP6ib?=
 =?us-ascii?Q?dwMDzcbKw4jL9OQ+9hZjNC4ZIg+qznzhA3Bh53m0lyKV3ClsrPEmslCb9Fsq?=
 =?us-ascii?Q?pO+MLh8uYgBdZENMTj25HBZHUUUEcAZojY3bUnFUxV8mY4kIWSZ3IQVuTbYJ?=
 =?us-ascii?Q?EI++XfVO4ik7TS5HnWUoJpYldPEOppsHwVQYB3pAMpY/gJyKlcDsOrccFaFc?=
 =?us-ascii?Q?fa27WpEHGFYWuywoKGtX3t+4bAuw/YoM8/PqR5dcNNoXi5ZN5Jqz0lOn5rI1?=
 =?us-ascii?Q?hQEsLUmlPBgaE7XGttiwEZFxa6Iij/bRmLKcBj9q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c6938d-f81c-42f3-9df3-08dd70e7c9db
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 06:38:18.3704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDbbNF0rLucIU7+QuCQp/De++fo3EmMCdBwvq5YX+EeSHA2giZBvSsvsLyRGUVgveowX/zzjdl4BtiZX7+Fmig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9112

On Mon, Mar 31, 2025 at 12:01:22PM -1000, Tejun Heo wrote:
> Hello,
> 
> On Fri, Mar 21, 2025 at 11:10:52PM +0100, Andrea Righi wrote:
> > With the introduction of scx_bpf_select_cpu_and(), we can deprecate
> > scx_bpf_select_cpu_dfl(), as it offers only a subset of features and
> > it's also more consistent with other idle-related APIs (returning a
> > negative value when no idle CPU is found).
> > 
> > Therefore, mark scx_bpf_select_cpu_dfl() as deprecated (printing a
> > warning when it's used), update all the scheduler examples and
> > kselftests to adopt the new API, and ensure backward (source and binary)
> > compatibility by providing the necessary macros and hooks.
> > 
> > Support for scx_bpf_select_cpu_dfl() can be maintained until v6.17.
> 
> Do we need to deprecate it?
> 
> ...
> > @@ -43,10 +39,13 @@ s32 BPF_STRUCT_OPS(select_cpu_dfl_nodispatch_select_cpu, struct task_struct *p,
> >  		return -ESRCH;
> >  	}
> >  
> > -	cpu = scx_bpf_select_cpu_dfl(p, prev_cpu, wake_flags,
> > -				     &tctx->force_local);
> > +	cpu = scx_bpf_select_cpu_and(p, prev_cpu, wake_flags, p->cpus_ptr, 0);
> > +	if (cpu >= 0) {
> > +		tctx->force_local = true;
> > +		return cpu;
> > +	}
> >  
> > -	return cpu;
> > +	return prev_cpu;
> >  }
> 
> scx_bpf_select_cpu_dfl() is simpler for simple cases. I don't see a pressing
> need to convert everybody to _and().

Yeah, I don't have strong opinions on this, I included this patch mostly to
show that we can get rid of a kfunc if we want, but we don't really have to
and it's probably less work to just keep it. I'll drop this patch in the
next version.

Thanks for the review!

-Andrea
