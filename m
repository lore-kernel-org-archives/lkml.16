Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2401E5B90
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747113855; cv=fail; b=so118SMwG+eXOskEubauvy7NYdsSRgfFEPuc3BpvB1lq3aBEzR7hpDCep4lq/ry4hxZqan4GjcIJ8fCxJoI86/o/AlLRSOWh3kb0eJvxrrJKtJSM+OwuSZN/aRBPCLiHmqyQwzIas9vRPiWacY9lHJVa7WLm/Kk/KYzik72gBDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747113855; c=relaxed/simple;
	bh=eWihH9Q8q5Zab03pxR7xACRcXFk04KxaOJWNXzzzWnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u7xSlAE8MfeinU45DsW5j+Xrs/ZsXvY77RHp8BPdt1zS2qadLzM3TyYrElE649Z6RlGK+SvKBGKnJlNEsWnwtzXqHbNvOatrzUO7Pj+8g0uN4cVRpRpTrV4BtKMmaPK9LC1OzBjER5bwiq9OIgyaNn2gBUdpwU6L9lGUT2xFHeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H2B8RO5x; arc=fail smtp.client-ip=40.107.94.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H2B8RO5x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yc8XzvHute+agRNQiipUhJICKymdb9wp/MbqBhR48B6yzr/1sqVUlItzcRbF8rWEmZZKxsPF4Bjo4Bm168fXJ9oIMzu3HGK8sLBhfaoskJe8yOW2eZYSOj2dfXLDInDz0nlPQuS0yNIUIenSzCEKzx8y/p69olZO+ptyjEihqK1TlyVlW5+ls5NXtgHdAYb1Bf1wBKzzWo9JVlZROtv88S8+27WO8/qSH2KRq6+bVG68q3pRKwVQA4VSYx5ZXZZm1BBvdDsJGjeVX2hBkdNnO5ybQ2QqE9JlfLZbYkD2Vxeo5bt38RlSZx61Ec0eLeOyQtEOR7ibdv1k7viWCG7kPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRi0nYiRrgSakeBrOuIEnaX2EoxY1NhWAEOPugqNAcU=;
 b=Gga7Sh50NpISzEleAzZ72+gcvagdx8YIoObNrGYGUtByOEDGMnpws7ZFe2YOHU076IYDQ7kaunO2phLzpO0QoW0YEy+IlEcPSpjBNeUmdt+Eo85psHaUbP9ebx7oiXDlSqpKe7ZET1FWJBc5ZALPpJVT5XSOpC2JJggDDVGc6trHixxhxcT51/wWq/bqpamu092LrMgSGkieqq+Fud3ajbxMAFDNIdNYD8rNlineIKdIdRRDnG+2dgtaBcUMThKAqhn9pEeiAs5i1aIrgit13tT/kXHbGHuAGy7nNgPS9RA7Im81G45XhheIWW9jTa+OGTj3g4nDoBmvq4ZRa/GLXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRi0nYiRrgSakeBrOuIEnaX2EoxY1NhWAEOPugqNAcU=;
 b=H2B8RO5xa9RxtMUQ/bgx93yDGfySm89Agq7IoE4icuC/P1rciza8wVGDSlP31jXN+U2BKrTch+98bu6F6CkKTMaC2/cR3Jnh01ocG6l8vpNy25VC9A0V3VuIuvv35RTz5Tnk01nSKW+2znKvbg0ddgphiJiC4hGaL3V8K1iDierodCw4+eFaEVSiN1zFhIBPi7ei2GFF5+Ieo1WzGtI5SE2wJjiuTdy2nKOWtcDL66f+sT9AuFh/I07NoaUvcfJB1D5HIcDEDYVe2IJpjK5ww4liKuc8q6Sp1ve0ShGZ1ARdKyUx9Mmmp3ndADuPgKKzhRRhHzAl8whxwF2oYyoTPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH0PR12MB7908.namprd12.prod.outlook.com (2603:10b6:510:28e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 05:24:10 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 05:24:10 +0000
Date: Tue, 13 May 2025 07:23:59 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched_ext/idle: Make scx_bpf_select_cpu_and() usable
 from any context
Message-ID: <aCLXb-wGipqKbvXE@gpd3>
References: <20250512151743.42988-1-arighi@nvidia.com>
 <20250512151743.42988-3-arighi@nvidia.com>
 <bylpnof6h3mmeaovba573fer4ikrr5zhr53htbso6zzuw5czzj@tihl7ajm4eaj>
 <aCI9_GBpky0cowH9@gpd3>
 <aCJHBSmb0mjCbiQ4@gpd3>
 <aCJTU1yuc61zdxVA@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCJTU1yuc61zdxVA@slm.duckdns.org>
X-ClientProxiedBy: MI2P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::9) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH0PR12MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: e7af5a8a-946d-4936-5ecb-08dd91de63da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MR4pmiWT3gUANuRyUEzzKyW5vq5zKF9wduiGUuBxNmdGgifmPzVaHgqvVquj?=
 =?us-ascii?Q?CT2pqlx9wbome7w0tPHroXZ0tAtwptSOEREJS24l9a4H8YBmziag3Jsas6l7?=
 =?us-ascii?Q?+qAY2TeTTyevyjStvbtl6ItE7YMIjW7LdKu4URWBC3/dfyTjcX2yfmLY7fHP?=
 =?us-ascii?Q?cPRXDCBEtxRDEr3f3BYl2hf8p2s9ugpTFDZA2J56mwNP3WxUgR+wtehg7R7Q?=
 =?us-ascii?Q?hes4UhrLRZKCkgEPdqYl7W+GPRIM069g9kj0eNxLkbiLOFwNtfhAi+Cujojw?=
 =?us-ascii?Q?vFdffxnueXDc/lDbYwQ2DDEh+PvWaIbR6LVUfdJ0pkA636i7UzfhnUXOYIQc?=
 =?us-ascii?Q?7nSCeDWqmE1LLe7A1kCX4ybHh3YV+Q0k2Jze3X/9cTrA7wviYLuN+usC1nA3?=
 =?us-ascii?Q?ijfr2mr3d+uPBWNE0/xtoLOYqJAKGyS3sbIIk+ykQPd20EF9KwT55QS6lw/g?=
 =?us-ascii?Q?r1Kht0Em0QnqtOt5KC9BAr+C8JNVJeGyweZR9QPunp6ilv0cW57Qx/vGuqZC?=
 =?us-ascii?Q?GFxGm7RoY0RYZoclBsFQsvW3v8hjjRsRQ3yqE1IR1hRbm7cHR8xVtdrj+5p1?=
 =?us-ascii?Q?poDzQ7khj8kQLyIArnHP6EhmIoe13rAaDWR2ru2tS/EGMzGLptne2jws6fSc?=
 =?us-ascii?Q?hvv6SESUzhbT2I/DXr6u/LDF71UYbyCb3HGgW/zjUSktGfc3YTt9iyykI2ZL?=
 =?us-ascii?Q?w93IDjlYTdFCIbaux5iFF1fBJssD7V31SzetJuI0RZFh8I4GROleN7thKbJh?=
 =?us-ascii?Q?4baoNAVZvzxEC+Rn6ja3lhhZKe9OHuhMPNBe8ug0GtqJVJnoRA5dWVDU6UUS?=
 =?us-ascii?Q?2AGfOmvPtrMknghdkxLVImBKpw0Ji6coFIDIVS6K6LIY6pfAP/NTakW9IYZu?=
 =?us-ascii?Q?AhV1MBV2JCv517KwOqBShGA6N7SErMRa3pwAkLJmiIh9P5Z0wyg6mKbLs4/9?=
 =?us-ascii?Q?2cAhQNmNV5h1mT5tyrOM2D/P1zKZo1vhd5hr8EiUy7FuCujLlasyqbDr4b4L?=
 =?us-ascii?Q?x0AYk3Mru2PEd/qpiD5x5BB7ySrgGACsxt++ORaArA1BLUVp6IFJrK6Hwo37?=
 =?us-ascii?Q?qJq844IuXic4BvrpzCkFkOdHn27BFTUF15WRBtcQ5RicOyocvoGZVT5VVuuy?=
 =?us-ascii?Q?DHEciRQHgzIvHjd1+/VTcBHWYru9AfaP3DE6arIVmmjHXZ/ysJ6Kcr2v5Ysw?=
 =?us-ascii?Q?A5sU4gc/dcyIl9kkfL6+HhLwc6ULmBTCbOdAnaEC80N3VztPYd/6GmBoM4aC?=
 =?us-ascii?Q?c8TKz+CjrPIXug8BJLR0hPlXN2ouZg/nxyD52mKdnGCotvJ5/RFiQ5QuR9Yd?=
 =?us-ascii?Q?TN8x2IR1pBmj6sKRD8ANKlUchoa4raIREWYOWbq4gcLMUhcViAkM7ZZ+GpmP?=
 =?us-ascii?Q?mD9tUX8Y862ZtDmf67rOL3EtcrN4gfdSJsqWxZBTTZnqmg+jJIal2Z0jCT/8?=
 =?us-ascii?Q?Tr4YAsOL0rc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MLftTeKk0Pg2CPKxQOXtSMthnr8YAxDAa5AapgnTX8UYjWCUML71TQqpih03?=
 =?us-ascii?Q?MWirf2afYTPWWPUFO791GQYXzPQpLWoArZMJwtwpgxXj1jRizw1xB0/krBbR?=
 =?us-ascii?Q?WLoWCE6MQh/27BI9/m9M155Xe2JDgDycJZnyyzLwUNbGQZgLhOjyVWcsSUZQ?=
 =?us-ascii?Q?SyNDqgycLhDjVm8ID6CnUVDoUT9TFTq03llOsb4Hqtw7qb3VbFiyfcFS1e4E?=
 =?us-ascii?Q?l2hK4QzxcFWLAxxlBjQPz8bgAQN7t4FGN2kXmmUDKL4N8hrq8zmxNbvYFx59?=
 =?us-ascii?Q?m5pjhhGZP8aTieMt+ScZc0FRQpmOfOmgzXW/wnmqHyZcI7h+5Fjdf+3pRH3h?=
 =?us-ascii?Q?I3gTiD4DWeU4qdseGELQrE8WwRyiBnjiAH7GNXoYcBw7KbysJPyXpQarkypL?=
 =?us-ascii?Q?BsDrZoEjW1B+9+f4+qUjoZjFgEY3AO3xK180CF+gv3lYEef97dfaXXiqfHbg?=
 =?us-ascii?Q?o4/G8Su8sCJSe0oZP6MW9FiB+PhGyM9ld9RfYxv3J3wJ4tl0Xn/xZ75AV2zS?=
 =?us-ascii?Q?RF1sQOwwoLSI2dRK5hQfELQ8yQcRIP1QQVl0Ds9BPG/HPG4j705cLF3zhKVo?=
 =?us-ascii?Q?gdly/hNhl3ZPfiY5LjN8P0k53gfnP0v0zsndVJ68B5SWyMDfKcCJUw6Z5Z7z?=
 =?us-ascii?Q?tu4q/bSCPcF2uEc2U1GPMKWuzqSweMW02x2lrgzmAfM/ZZ5HgKpJP8+CEbHm?=
 =?us-ascii?Q?DByE2VRvsRHBCWpnnbBqBJHluk2OYJcPoxQ3sFu9AYypKwrVOERHYe3GfxGB?=
 =?us-ascii?Q?1wAZaa7ovRUOohqcKb+D2/Ny797DuIl9RcCCb84AK3ovKrS1fCNTwD8AYSKG?=
 =?us-ascii?Q?Rc2uuNNguCZN/zU47Ab9rfLCclowplDultr/BHS4bUxUfL30dbBCoynq4Ve+?=
 =?us-ascii?Q?MvF19pv/Kg/1lX6cPxATN6MuvWfZY9doHod82Bu2QDtIgBI5bb5q/hD5ev1J?=
 =?us-ascii?Q?QrkCGPNSIJ9AvjRdFhtLrjAxvSPLOCMSXR+WOUR/efWptUAnlTBjZ/BtcifR?=
 =?us-ascii?Q?2P1TWGA0QkVjZOyuwYfh2rO1qPywPuybpkxLSYge13f82kChE7E+pOJetjpG?=
 =?us-ascii?Q?4wBsqgdW3gRihzLItv2roe9CrJ772cU/Wnb5y8eEfKZG7TvfIOk2lZyZ1iqZ?=
 =?us-ascii?Q?Mn4DziCtQfEStweRRVMZRVfJWNCstuMGrWU12KBRwwMfih2I3or6WqLaSqe3?=
 =?us-ascii?Q?ofpqPEhdUpxUUiPMd8k5m3g56C94sGTqDRj329TQebijFUw62Syz6jC7XnaS?=
 =?us-ascii?Q?cl9+sKQWI6arPtSnQreFLeJQJ+m07/40rWa3jj8wGyISlBJ9VmjwQixooIFr?=
 =?us-ascii?Q?4kd/R0WNBxON+wKL7uvuAyPk333RH/ovmk2xQfFJN6vpEj6J/6j3TpoJBcTw?=
 =?us-ascii?Q?ApXnueHgZIOOZkRd55aXG+VuOecg+/D66yLWscPZilYIkNib6lXBW4SgxB6S?=
 =?us-ascii?Q?0AMSCVQVG6xbbDhNX9gLxkFBr7mAzJN8P7ES/2JdUMmtCeLkqF57QyiJwzOH?=
 =?us-ascii?Q?90uTPUgrNy01CqWOMPq99xgTWhkmmKd2Fgrts/A6E95wb8X8B2aAZDTFAM/w?=
 =?us-ascii?Q?klYaUJz/X21BYqRATwB6Gr0YVJZjr4QqmiQNzgsR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7af5a8a-946d-4936-5ecb-08dd91de63da
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 05:24:10.1936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZ9ioUJ9epM6EvwvPWq2LYuLXNfLqHXIYDg7LblRJkG43puSnikoSb++YDGgXAYG2P0kiuc9AUAzeSqg8+RX6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7908

On Mon, May 12, 2025 at 10:00:19AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Mon, May 12, 2025 at 09:07:49PM +0200, Andrea Righi wrote:
> ...
> > 	if (scx_kf_allowed_if_unlocked())
> > 		rq = task_rq_lock(p, &rf);
> > 	...
> > 	if (scx_kf_allowed_if_unlocked())
> > 		task_rq_unlock(rq, p, &rf);
> > 
> > Or at least it should cover all current use cases. The tricky one is
> > scx_bpf_select_cpu_and() being called via BPF test_run from a user-space
> > task (scx_rustland_core).
> > 
> > If we had a way to clearly identify a test_run context, we could restrict
> > this to BPF_PROG_TYPE_STRUCT_OPS and BPF_PROG_TYPE_TEST_RUN (but as far as
> > I can tell, the latter doesn't exist).
> 
> Shouldn't that work as-is? TEST_RUN isn't gonna set any kf_mask, so the same
> condition would work?

Oh yes, it works, my point is that, without any restrictions, the kfunc
might be used in problematic contexts, for example if it's called with
pi_lock held it could trigger a deadlock with task_rq_lock(). Limiting its
use to ops.select_cpu(), ops.enqueue(), ops.dispatch(), and test_run would
allow to cover all the use cases while being safe.

Thanks,
-Andrea
