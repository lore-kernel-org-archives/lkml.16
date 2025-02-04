Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E10720DD52;
	Tue,  4 Feb 2025 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738670561; cv=none; b=rIuO1T74fJoMaiZTjhZYPUpslzjHvmeyg/QNt8olMhVH1GlKHHmiMak8d47SkwRTiKB7mMqse22YsMKOKok2rp4QhusTe2QIfR8dDQVRVIUu5Jnj12eFTlgeIdrrMdpjkyX1ctqoXfd/QFWsDoLbicAST4vdu5ABdM3w0zfwJRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738670561; c=relaxed/simple;
	bh=b+cEoHVefGrCUvtRvpWb7sFAlST2/ywNLw3gR8Yv9uo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmNcwDQ/tdnBTG/eGR3GijQVBUD74GhlcGZY2p5fZp0FFu1WYo3p2DW5zxMVgprei2JrQv77mff5rXV6GlnRZ/JmmFxyOvoEKrutSjSQkBuctXnaqjAfky/z5X3XXE4T0G5P8czFiIJVlAVCGe0H4acz/Hp/O6d+jdVDQYSDEsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=K/re6qVS; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="K/re6qVS"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514A4EqG026741;
	Tue, 4 Feb 2025 04:02:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=gfkDFBtHWxTvHgGe0/4/8GZBI
	RhWCjlf7FzgYmi3TbM=; b=K/re6qVSDi0Nxe9XtXJFQdOm2V4vpacwr4Ku2DPvm
	elFqGuQGRdg2s/Fa/CS/+OYGsoIRlAOVZhJObsq+MRMRK7hrG5eRxzRnSKNNrvGC
	2dd8fcL+4Qudt1yz/VNdyOdMOPcDIFNIPMD4TnfbzMPDbnubEFrLkWc2mrhUEjoG
	WGk8Otf/B3+0oTSo7UEtUyqmGhrdumZjHhI46Ng+qL9eS4AM8HaPnruefFkRh5qk
	wOxYE216aFG86/OuO38ufmdibGiBHmY0LJCySIzrmgaxjcHHCSfUQ7GEppdxC3UO
	DaAAp1dMmgyATOidGL3B28+g3m7H2846FeaCQdBpoH+vw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44kgtgr5e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 04:02:28 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Feb 2025 04:02:22 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 4 Feb 2025 04:02:22 -0800
Received: from hyd1403.caveonetworks.com (unknown [10.29.37.84])
	by maili.marvell.com (Postfix) with SMTP id DDC8E5B6929;
	Tue,  4 Feb 2025 04:02:16 -0800 (PST)
Date: Tue, 4 Feb 2025 17:32:16 +0530
From: Linu Cherian <lcherian@marvell.com>
To: James Clark <james.clark@linaro.org>
CC: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <devicetree@vger.kernel.org>, <sgoutham@marvell.com>,
        <gcherian@marvell.com>
Subject: Re: [PATCH v13 0/8] Coresight for Kernel panic and watchdog reset
Message-ID: <20250204120216.GB1525185@hyd1403.caveonetworks.com>
References: <20241216053014.3427909-1-lcherian@marvell.com>
 <da7dcddb-d407-41b2-8343-a0ec21914606@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <da7dcddb-d407-41b2-8343-a0ec21914606@linaro.org>
X-Proofpoint-ORIG-GUID: -mskbj0b1DmtchRN1I_B1uHBEgpempuX
X-Proofpoint-GUID: -mskbj0b1DmtchRN1I_B1uHBEgpempuX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_06,2025-01-31_02,2024-11-22_01

Hi James,


On 2025-01-24 at 17:38:58, James Clark (james.clark@linaro.org) wrote:
> 
> 
> On 16/12/2024 5:30 am, Linu Cherian wrote:
> > This patch series is rebased on coresight-next-v6.12.rc4
> > 
> > * Patches 1 & 2 adds support for allocation of trace buffer pages from
> >    reserved RAM
> > * Patches 3 & 4 adds support for saving metadata at the time of kernel panic
> > * Patch 5 adds support for reading trace data captured at the time of panic
> > * Patches 6 & 7 adds support for disabling coresight blocks at the time of panic
> > * Patch 8: Gives the full description about this feature as part of documentation
> > 
> > v12 is posted here,
> > https://lore.kernel.org/linux-arm-kernel/20241129084714.3057080-1-lcherian@marvell.com/
> > 
> > Changelog from v12:
> > * Fixed wrong buffer pointer passed to coresigh_insert_barrier_packet
> > * tmc_read_prepare/unprepare_crashdata need to be called only once and
> >    hence removed from read path and added to tmc_probe
> > * tmc_read_prepare_crashdata renamed to tmc_prepare_crashdata and
> >    avoid taking locks  as its moved to probe function.
> > * Introduced read status flag, "reading" specific to reserved buffer to keep the
> >    reserved buffer reading independent of the regular buffer.
> > * open/release ops for reserved buffer has to take care only about the
> >    set/unset the "reading" status flag as the reserved buffer is prepared
> >    during the probe time itself.
> > * Few other trivial changes
> > 
> 
> Hi Linu,
> 
> I tested that decoding a crash dump of ETM1 (trace ID 17) from panic kernel
> works:
> 
>   $ ./ptm2human -i cstrace.bin
> 
>   ...
>   There is no valid data in the stream of ID 16
>   Decode trace stream of ID 17
>   Syncing the trace stream...
>   Decoding the trace stream...
>   instruction addr at 0x140c9afc, ARM state, secure state,
>   ...


Thanks for trying this out.

> 
> I noticed that once in the panic kernel Coresight becomes unusable, and the
> Perf Coresight tests fail, with no obvious way to reset it other than a cold
> boot:
> 
>  $ perf record -e cs_etm//u -- true
>  $ perf report -D | grep AUX
>  ...
>  AUX data lost 27 times out of 27!
>  ...
> 
> I didn't debug it yet. I thought it might be something to do with the RESRV
> buffer mode, but it doesn't look like that should be the case from the code.
> Perhaps its the claim tags and coresight_is_claimed_any() lingering, so it's
> not really an issue that's introduced by this change?


Is that problem reproducible without this series applied ?

Thanks.
Linu Cherian.


 
