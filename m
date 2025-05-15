Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680BD2949EF
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747279557; cv=none; b=lSJKGEs0KE5snl66/jyoSgxJdWWkQoAHsTcXz978W2VWFDg1u/r2JD1MeehwKgk5OsagoAtl73BrbFVJAR36aiDtp+lYlyQjUEs2jk+SKCmeaeVZ5PQZssiDjIkVFuzQEUXg6key2SPFuCn0NQFJb+KbxhdcTc9TV8jzRGiypMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747279557; c=relaxed/simple;
	bh=c9FOqSmy+dz5v5MPKHqrj/nnkAEXt32yKE4f9nKCPeA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9xAVjqG1s8IYCwDreFX6uUtDkywkB5e73q8GnadQQA8qJAtd4USdRICVg/8zJjTAOYOd9rlQzADKaeyQv4YRWqAsGS7yxnAPSYMfWpwapj4JXatAS9Xm4AWAbYkV6iF9x3HsZlPIDxjFUUdS0qGzgJb2D/px+JgkpYCtjSpcYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 54F3PIfo056447
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 15 May 2025 11:25:18 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 11:25:18 +0800
Date: Thu, 15 May 2025 11:25:18 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Rob Herring <robh@kernel.org>
CC: <krzk+dt@kernel.org>, <tglx@linutronix.de>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <paul.walmsley@sifive.com>,
        <alex@ghiti.fr>, <daniel.lezcano@linaro.org>, <conor+dt@kernel.org>,
        <aou@eecs.berkeley.edu>, <devicetree@vger.kernel.org>,
        <tim609@andestech.com>, <linux-kernel@vger.kernel.org>,
        <geert+renesas@glider.be>, <palmer@dabbelt.com>,
        <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: interrupt-controller: add Andes
 QiLai PLIC
Message-ID: <aCVenXTis5Hq5Uek@atctrx.andestech.com>
References: <20250514095350.3765716-1-ben717@andestech.com>
 <20250514095350.3765716-4-ben717@andestech.com>
 <174723438154.2170160.6461910184012543621.robh@kernel.org>
 <20250514150134.GB2180131-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250514150134.GB2180131-robh@kernel.org>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 54F3PIfo056447

On Wed, May 14, 2025 at 10:01:34AM -0500, Rob Herring wrote:
> [EXTERNAL MAIL]
> 
> On Wed, May 14, 2025 at 09:53:08AM -0500, Rob Herring (Arm) wrote:
> >
> > On Wed, 14 May 2025 17:53:44 +0800, Ben Zong-You Xie wrote:
> > > Add a new compatible string for Andes QiLai PLIC.
> > >
> > > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> > > ---
> > >  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> >
> > Applied, thanks!
> 
> And now dropped.
> 
> Rob

This patch was applied but has now been dropped. Could you please clarify
the reason for dropping it?

Thanks,
Ben

