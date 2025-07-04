Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1242D77E5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751634477; cv=none; b=mStxFziHWjV83kwIN5RlIdQWQjU82JhKP/cN96V7U0qiEJkfmgketFrbTNIlGNn0ffjPwkezU0MJye2P9r18FHFKN20GhUH3yEEFmPq+RzaWHZjHWxlhgUSdCy9pBUuch8JcBQ2vEdWkb7CZRq6QWlAaRs5zHKeUWBqs2WVln5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751634477; c=relaxed/simple;
	bh=extDsVbb9anmJOT/i+066iso1LSucl2pzA4ay2dJ1j0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzFLSOZsDFIGgTdX96euir5rbgIdEshoAnmL7U31QLhhc+9SYPvfcVuhoToLcJFIB1UlkBNPWjBUyw26OCXWPy2KFnK6CuZa67WXuhzrIDKfIbnSwXTQy38QbE1+rmVApGoydkXSB2I6XjmAEKAOadWo1hvqMwFJ4tNqgef2HWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 564D75Qd002650
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 4 Jul 2025 21:07:05 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 21:07:05 +0800
Date: Fri, 4 Jul 2025 21:07:05 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <arnd@arndb.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <soc@lists.linux.dev>,
        <tim609@andestech.com>
Subject: Re: [PATCH 0/8] add Voyager board support
Message-ID: <aGfR+Vx0dseqgmKW@atctrx.andestech.com>
References: <20250704081451.2011407-1-ben717@andestech.com>
 <cb8891d4-de4e-493c-9914-0391b3baf212@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cb8891d4-de4e-493c-9914-0391b3baf212@kernel.org>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 564D75Qd002650

On Fri, Jul 04, 2025 at 11:15:43AM +0200, Krzysztof Kozlowski wrote:
> > Also, there is a patch dependency in this patchset:
> > Patch 2 <- Patch 4 <- Patch 5 <- Patch 6
> 
> How? These are bindings. How DTS can depend on the binding? Do you have
> akcs from their subsystem maintainers that you are sending it here?
>
> Sorry, but no, this should go via their maintainers, unless they did not
> want to pick it up. Is this the case here?

The dependency chain arises because each of these patches introduces a new file,
requiring a corresponding update to the MAINTAINERS file.

In v4 [1], Rob and Daniel attempted to merge Patch 4 and Patch 5, respectively,
but encountered conflicts in the MAINTAINERS file. That's why I specified the
patch dependencies in v5 and this patchset.

Now, I understand that binding patches are typically handled by subsystem
maintainers. To prevent the conflicts again, I think I should gather all
MAINTAINERS file changes into a single patch. Is that right?

[1] https://lore.kernel.org/all/20250514095350.3765716-1-ben717@andestech.com/

Thanks,
Ben
