Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A325518D65E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706478; cv=none; b=IWrpcv/4h7JcR9Bnwew/B93telgO34Kd6dvsQ7H9IQQ+5ZV00R0En8+qWHCEtn0ticpkiRj00cvYDbtAHBA+YWXco28oHiN0TC8v7eWvw62FJ8ajx/dfMcVZfCwcO2prvL/LtQ/pnlQnPDTwMnF1Fg49Aq//KOG61PxCx1O+rzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706478; c=relaxed/simple;
	bh=sFvm3RtqxguiraxwSRB7QMxvnv4/oCgDX/PU1J6QmSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syHN63+/g/+/kuvBmUTLQVzAr/cDWk4QtkQDiTbl3TjxZzI+hUT1x3AdbBAcNToUW4OaMWjbxIgYCSKrWlnZjnXiFOiT5My2k7uf0PNAAQXzWF9uh6bn2xlIN2eXOSrT9SFZc3w0I/CK9HF/yP/nI7iQ4XmyEOQNsxXOgU5irYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vJDuH9/P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJDuH9/P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB10C4CEDD;
	Tue, 15 Apr 2025 08:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744706478;
	bh=sFvm3RtqxguiraxwSRB7QMxvnv4/oCgDX/PU1J6QmSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJDuH9/PABQLF1dtJg+CLTitXeFrpR69LUsMzYRdS4h7m5RVORYgSJyHIVUQIuc4d
	 NPYC3ZfTn8RtWMzksNNoHPnTxwpMGfLlNgy9tkpvXGgaPtGrRiAR5i7JxNdhhXQeZt
	 7YG8YK6GW39QEFN3C8slLJej93DIQcZkOGJYM6Ab19ipOExb5/SqYzVhYPdsiEikn9
	 +9vru6wf6oiCHuyMCkIDpuJsl98sGtxiRVwR3F+eUceu6Rf+UAR1HX64PUQWKJ2Z/x
	 8RfRVko5RF03697bXs2j2M0UYG/6nQvfC1Of2OBGv7GDlwFR9zYT1Ew9oiVZzKwPVr
	 V4zF9amJhKGKA==
Date: Tue, 15 Apr 2025 10:41:13 +0200
From: Christian Brauner <brauner@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Tze-nan Wu =?utf-8?B?KOWQs+a+pOWNlyk=?= <Tze-nan.Wu@mediatek.com>, 
	Bobule Chang =?utf-8?B?KOW8teW8mOe+qSk=?= <bobule.chang@mediatek.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream <wsd_upstream@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "chenqiwu@xiaomi.com" <chenqiwu@xiaomi.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [RFC PATCH] exit: Skip panic in do_exit() during poweroff
Message-ID: <20250415-speichel-heften-2eeb4ef264f1@brauner>
References: <20250410143937.1829272-1-Tze-nan.Wu@mediatek.com>
 <20250410210507.GD15280@redhat.com>
 <249567d33e088a340780456c7ecd3ef3ee1433a1.camel@mediatek.com>
 <20250414165043.GG28345@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414165043.GG28345@redhat.com>

On Mon, Apr 14, 2025 at 06:50:44PM +0200, Oleg Nesterov wrote:
> On 04/14, Tze-nan Wu (吳澤南) wrote:
> >
> > On Thu, 2025-04-10 at 23:05 +0200, Oleg Nesterov wrote:
> > > 
> > > As for sys_reboot(), I think that kernel_power_off() must be
> > > __noreturn,
> > > and sys_reboot() should use BUG() after
> > > LINUX_REBOOT_CMD_POWER_OFF/_HALT
> > > instead of do_exit().
> > > 
> > 
> > Yes, kernel_power_off() should not return, but this is the case only if
> > kernel_power_off() is invoked by PID 1 through sys_reboot().
> > If kernel_power_off() is invoked by a kernel thread (e.g., the thermal
> > kernel module) other than PID 1, then do_exit() could possibly be
> > invoked by PID 1 after kernel_power_off() on another CPU.
> 
> Yes sure, this is clear.
> 
> I have mentioned sys_reboot() because (unless I am totally confused)
> this connects to the previous report from Breno.
> 
> And I agree that we should do stop_other_cpus() first, but let me
> say this again: I can't help ;)
> 
> But in any case, rightly or not I still think that the init process
> should not exit/crash due to POWER_OFF/HALT. We should not mask this
> problem in do_exit().

I agree.
