Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C5920B813
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746701855; cv=none; b=NyYdLRdsVMqA9G9SZzsTYjq2gp35KcfdVHnU11ug3ZoYJBTFRBr5PcS0/yanwmI4Zn3YJjJUuRfNi3M7QRN1ejIX34CoLtUM+iSw+nDmyUmiTKJxJUFe+hYLXRvQHyS0yOU+kgvQs70eAM3+aVPHOtdvEapg/yIKV853c3D9m6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746701855; c=relaxed/simple;
	bh=IpCbPk0J8bUU8wYCI9MchrlhmRARM3hwBbxgHu/gH+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvYd24QGyfcQmvOsrgFnwGbBur5cv/2stgK9VRjQCXIvmtCE5KWnksE36CxEj6OzSLSwOTIF0mj5UkT4BtH30Vf1kBcltXQJqve85LYkcqpk1WzDbb/Z6S+U/IgF9ZafX2h5IF19fvBqxheyvWSjhpIR+BLshUSGUeSf7whlSK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1uCywP-0008Ie-Qj; Thu, 08 May 2025 12:57:25 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1uCywP-001i8U-1h;
	Thu, 08 May 2025 12:57:25 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1uCywP-00AP7Q-1M;
	Thu, 08 May 2025 12:57:25 +0200
Date: Thu, 8 May 2025 12:57:25 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: "Colin King (gmail)" <colin.i.king@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	kernel@pengutronix.de
Subject: Re: soc: xilinx: vcu: issue with 2nd null check on pointer divider
Message-ID: <aByOFaMmNqWLNbYM@pengutronix.de>
References: <60721f5a-15d2-46a1-aa0c-d6d599244cb2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <60721f5a-15d2-46a1-aa0c-d6d599244cb2@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hi Colin,

On Thu, 08 May 2025 11:21:05 +0100, Colin King (gmail) wrote:
> There seems to be an issue with the following function with the second check
> on if (!divider). Firstly this is redundant code since divider has
> already been null checked, so I suspect it should be instead if (!mux) but
> I'm unsure if this is correct since the call to clk_hw_unregister_divider is
> not made.  Also if mux is null, isn't the call to clk_hw_unregister_mux()
> problematic as a null pointer is being passed to it.
> 
> static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
> {
>         struct clk_hw *gate = hw;
>         struct clk_hw *divider;
>         struct clk_hw *mux;
> 
>         if (!gate)
>                 return;
> 
>         divider = clk_hw_get_parent(gate);
>         clk_hw_unregister_gate(gate);
>         if (!divider)
>                 return;
> 
>         mux = clk_hw_get_parent(divider);
>         clk_hw_unregister_mux(mux);
>         if (!divider)
>                 return;
> 
>         clk_hw_unregister_divider(divider);
> }

I sent a patch [0] to rewrite the function and make it more readable a
while ago. Unfortunately, there wasn't any reaction to the patch, and
then I forgot about it.

Michael

[0] https://lore.kernel.org/linux-arm-kernel/20210318144230.3438009-1-m.tretter@pengutronix.de/
