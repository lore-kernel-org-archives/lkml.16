Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC7C254B14
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 12:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749470836; cv=none; b=DIHx/3sSrmqtxMK73RU3LnbRzp6P+eWXnU6oUZPWs7LVl8Uff5En+t6nAeU1G3vEdQI/QqVZB1gCbjUoPYHYOnxVCiZ5gm8uoIEUJqvFIeTxCEZpzGbU8EGyhDVhH2EJsh2R5z43SsmcZDv4a4WUV40G68Y+T48Ew5ngzHhL4sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749470836; c=relaxed/simple;
	bh=sgkv4aiTTTlOa25f+2o8tc6D1nl+uYbgWoVrUsSkE8o=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTZVICOOuQciytpzRk753/wLIBzDBygpb3I9ajOMkmgQ7VeNCjYEjEdL/o3fnPiGfk91/uug+eSK0/LUtXphtO9trWbDCcgo8J1ntgQTdHZzllZsiFto7CaHgyGY9yEGfJDX2KWMEAHJVhlWrdSvwYDG7aKNdGNGiiNS8l9ohzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 559C67ue032205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 9 Jun 2025 20:06:07 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 20:06:07 +0800
Date: Mon, 9 Jun 2025 20:06:07 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>
Subject: Re: [PATCH v5 0/8] add Voyager board support
Message-ID: <aEbOLztcBsKs84pn@atctrx.andestech.com>
References: <20250602060747.689824-1-ben717@andestech.com>
 <20250606-booth-icky-b416c1827a43@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606-booth-icky-b416c1827a43@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 559C67ue032205

On Fri, Jun 06, 2025 at 05:00:06PM +0100, Conor Dooley wrote:
> [EXTERNAL MAIL]

> Date: Fri, 6 Jun 2025 17:00:06 +0100
> From: Conor Dooley <conor@kernel.org>
> To: Ben Zong-You Xie <ben717@andestech.com>
> Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
>  alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
>  tglx@linutronix.de, daniel.lezcano@linaro.org,
>  prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
>  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
>  tim609@andestech.com
> Subject: Re: [PATCH v5 0/8] add Voyager board support
> 
> On Mon, Jun 02, 2025 at 02:07:39PM +0800, Ben Zong-You Xie wrote:
> > The Voyager is a 9.6” x 9.6” Micro ATX form factor development board
> > including Andes QiLai SoC. This patch series adds minimal device tree
> > files for the QiLai SoC and the Voyager board [1].
> > 
> > Now only support basic uart drivers to boot up into a basic console. Other
> > features will be added later.
> > 
> > [1] https://www.andestech.com/en/products-solutions/andeshape-platforms/qilai-chip/
> 
> Ball is in your court now, after rc1 make a tree and get it in
> linux-next, and then send a pr to soc@kernel.org with this new content.
> Perhaps the defconfig should go separately, I can take that one if you
> want.
> 
> Cheers,
> Conor.

Hi Conor,

Thanks for your guidance on these patches. I will send a PR to
soc@kernel.org as you suggested.

For the defconfig patch, I'm happy for you to handle it. Just let me
know if there's anything specific you'd like me to include.

Thanks,
Ben
