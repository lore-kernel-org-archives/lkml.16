Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E229E221D93;
	Thu, 19 Jun 2025 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334876; cv=none; b=Fsq90lgEENQruPEd37mDvCoYnLwLbryfueaHCh9Fy/lvGuqyTE2wC6p23h5N9kRJBvphwRMMSYEwTLlFekMxQMkdtjznyTYfOD3YdxIzSkZ3IT20bxxGzqEtDqr2CPUQmeLBDDFmFOP3+6vDGSglBFokxSj8tG+AxS5RonuwrLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334876; c=relaxed/simple;
	bh=gHMcK5FXmhzyrik19qB7bBfBSgqYIFyvtGRWEL15uTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lahY/Ethlh5JlSri+qpbJVdPTMJUERD6S1PobxITnWn2dL95KJ9loaXwf68nJr4XSBZoLDzVT58L655b/GMKdehi2WuvumAWWiZVLSnFyljA7X+4zD9dPRi35uLGnF0bhohHN+H0bXcFOgbnYaGB8JUBmVeY9qAtkEpnt1K1AZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qb4njTXl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qb4njTXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21257C4CEEA;
	Thu, 19 Jun 2025 12:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750334875;
	bh=gHMcK5FXmhzyrik19qB7bBfBSgqYIFyvtGRWEL15uTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qb4njTXlBRdKnJZpfl2+ni+KlTxDgPty/Jj+RuE3M2mI1M7ryKK0SqGS0QN9yT4K/
	 0bfC3CYC93oJZRh9aBDoH7nAf94xizMrMGhNbTaSROnqhfqqrj9EKxlQtmCAyoCUCW
	 xI28sVgB+JcPyVFWvdV+l0uGXhpuQf/FHLDz6/zviybDDKwBRwbNHbk0xQk0K6M7B9
	 nVf7dIo1hHj8mQldXy+cSqwdczeDQzGZG61tx13gNJDN+mFZosLyeCURqcYPmU9wYw
	 8XKNvX4PM6/TXG1BdoU9zLFCcfGRh+OWs1kOrXtv6OU/LZ0YBEuihOCbfokpwF8J+8
	 qQEf3s0El/isg==
Date: Thu, 19 Jun 2025 14:07:52 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Francesco Dolcini <francesco@dolcini.it>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Subject: Re: drm/panel/panel-simple v6.16-rc1 WARNING regression
Message-ID: <20250619-ubiquitous-annoying-tamarin-bbfdad@houat>
References: <20250612081834.GA248237@francesco-nb>
 <CAN9Xe3RFEXZuWTZB5E1tJdjXc9o_hB1ArgA5SvqbDUBkwYea8w@mail.gmail.com>
 <20250618105158.06e42668@booty>
 <20250618-fantastic-brown-elephant-df0ae4@houat>
 <CAN9Xe3RpkBx8k+=VqDFh1n+-35gHM_L3UQvCJH58bBPF6pPuuA@mail.gmail.com>
 <CAN9Xe3R96sTf911-n4iX=PME1zfO4Z+XojQSyK4OF8qw7vL7hA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="2h5cadptvtmbwers"
Content-Disposition: inline
In-Reply-To: <CAN9Xe3R96sTf911-n4iX=PME1zfO4Z+XojQSyK4OF8qw7vL7hA@mail.gmail.com>


--2h5cadptvtmbwers
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: drm/panel/panel-simple v6.16-rc1 WARNING regression
MIME-Version: 1.0

On Wed, Jun 18, 2025 at 04:45:31PM -0400, Anusha Srivatsa wrote:
> On Wed, Jun 18, 2025 at 11:48=E2=80=AFAM Anusha Srivatsa <asrivats@redhat=
=2Ecom>
> wrote:
> > On Wed, Jun 18, 2025 at 4:23=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> >
> >> On Wed, Jun 18, 2025 at 10:51:58AM +0200, Luca Ceresoli wrote:
> >> > Hello Anusha, Francesco,
> >> >
> >> > On Tue, 17 Jun 2025 11:17:20 -0500
> >> > Anusha Srivatsa <asrivats@redhat.com> wrote:
> >> >
> >> > > On Thu, Jun 12, 2025 at 3:24=E2=80=AFAM Francesco Dolcini <
> >> francesco@dolcini.it>
> >> > > wrote:
> >> > >
> >> > > > Hello all,
> >> > > >
> >> > > > Commit de04bb0089a9 ("drm/panel/panel-simple: Use the new
> >> allocation in
> >> > > > place of devm_kzalloc()")
> >> > > > from 6.16-rc1 introduced a regression with this warning during p=
robe
> >> > > > with panel dpi described in the DT.
> >> > > >
> >> > > > A revert solves the issue.
> >> > > >
> >> > > > The issue is that connector_type is set to DRM_MODE_CONNECTOR_DP=
I in
> >> > > > panel_dpi_probe() that after that change is called after
> >> > > > devm_drm_panel_alloc().
> >> > > >
> >> > > > I am not sure if there are other implication for this change in =
the
> >> call
> >> > > > ordering, apart the one that triggers this warning.
> >> > > >
> >> > > > [   12.089274] ------------[ cut here ]------------
> >> > > > [   12.089303] WARNING: CPU: 0 PID: 96 at
> >> > > > drivers/gpu/drm/bridge/panel.c:377 devm_drm_of_get_bridge+0xac/0=
xb8
> >> > > > [   12.130808] Modules linked in: v4l2_jpeg pwm_imx27(+) imx_vdoa
> >> > > > gpu_sched panel_simple imx6_media(C) imx_media_common
> >> > > > (C) videobuf2_dma_contig pwm_bl gpio_keys v4l2_mem2mem fuse ipv6
> >> autofs4
> >> > > > [   12.147774] CPU: 0 UID: 0 PID: 96 Comm: kworker/u8:3 Tainted:=
 G
> >> > > >  C          6.16.0-rc1+ #1 PREEMPT
> >> > > > [   12.157446] Tainted: [C]=3DCRAP
> >> > > > [   12.160418] Hardware name: Freescale i.MX6 Quad/DualLite (Dev=
ice
> >> Tree)
> >> > > > [   12.166953] Workqueue: events_unbound deferred_probe_work_func
> >> > > > [   12.172805] Call trace:
> >> > > > [   12.172815]  unwind_backtrace from show_stack+0x10/0x14
> >> > > > [   12.180598]  show_stack from dump_stack_lvl+0x68/0x74
> >> > > > [   12.185674]  dump_stack_lvl from __warn+0x7c/0xe0
> >> > > > [   12.190407]  __warn from warn_slowpath_fmt+0x1b8/0x1c0
> >> > > > [   12.195567]  warn_slowpath_fmt from
> >> devm_drm_of_get_bridge+0xac/0xb8
> >> > > > [   12.201949]  devm_drm_of_get_bridge from imx_pd_probe+0x58/0x=
164
> >> > > > [   12.207976]  imx_pd_probe from platform_probe+0x5c/0xb0
> >> > > > [   12.213220]  platform_probe from really_probe+0xd0/0x3a4
> >> > > > [   12.218551]  really_probe from __driver_probe_device+0x8c/0x1=
d4
> >> > > > [   12.224486]  __driver_probe_device from
> >> driver_probe_device+0x30/0xc0
> >> > > > [   12.230942]  driver_probe_device from
> >> __device_attach_driver+0x98/0x10c
> >> > > > [   12.237572]  __device_attach_driver from
> >> bus_for_each_drv+0x90/0xe4
> >> > > > [   12.243854]  bus_for_each_drv from __device_attach+0xa8/0x1c8
> >> > > > [   12.249614]  __device_attach from bus_probe_device+0x88/0x8c
> >> > > > [   12.255285]  bus_probe_device from
> >> deferred_probe_work_func+0x8c/0xcc
> >> > > > [   12.261739]  deferred_probe_work_func from
> >> process_one_work+0x154/0x2dc
> >> > > > [   12.268371]  process_one_work from worker_thread+0x250/0x3f0
> >> > > > [   12.274043]  worker_thread from kthread+0x12c/0x24c
> >> > > > [   12.278940]  kthread from ret_from_fork+0x14/0x28
> >> > > > [   12.283660] Exception stack(0xd0be9fb0 to 0xd0be9ff8)
> >> > > > [   12.288720] 9fa0:                                     00000000
> >> 00000000
> >> > > > 00000000 00000000
> >> > > > [   12.296906] 9fc0: 00000000 00000000 00000000 00000000 00000000
> >> 00000000
> >> > > > 00000000 00000000
> >> > > > [   12.305089] 9fe0: 00000000 00000000 00000000 00000000 00000013
> >> 00000000
> >> > > > [   12.312050] ---[ end trace 0000000000000000 ]---
> >> > > >
> >> > > > #regzbot ^introduced: de04bb0089a96cc00d13b12cbf66a088befe3057
> >> > > >
> >> > > > Any advise?
> >> > > >
> >> > > > Hey Francesco!
> >> > >
> >> > > This mail reached my spam and I hadn't realised till today. Thanks=
 for
> >> > > bringing this to attention.
> >> > >
> >> > > Thinking out loud here: If we called dpi_probe() before allocating=
 the
> >> > > panel using devm_drm_panel_alloc()
> >> > > then we would have the connector type. But  dpi_probe() needs the
> >> panel to
> >> > > be allocated....
> >> >
> >> > Reading the panel-simple.c code, the handling of the panel_dsi
> >> > descriptor feels a bit hacky, and the recent change to
> >> > devm_drm_panel_alloc() breaks it easily. Perhaps it would be cleaner=
 to
> >> > assess the whole descriptor before ding any allocation/init.
> >> >
> >> > You're right tat panel_dpi_probe() needs the panel, but it's only at=
 the
> >> > very end, to assign the descriptor:
> >> >
> >> >   panel->desc =3D desc;
> >> >
> >> > I think a good fix would be to clean it up by having:
> >> >
> >> >  * panel_dpi_probe() not take a panel pointer but rather returning a
> >> >    filled descriptor
> >> >  * panel_simple_probe() call panel_dpi_probe() early [before
> >> >    devm_drm_panel_alloc()] and get the filled descriptor
> >> >  * call devm_drm_panel_alloc() with that descriptor in the panel-dsi
> >> >    case, or with the good old descriptor otherwise
> >> >
> >> > As a good side effect, it would get rid of a case where
> >> > devm_drm_panel_alloc() is called with a Unknown connector type.
> >> >
> >> > Anusha, does it look like a good plan?
> >>
> >> It is, and I'd even go one step further. Like you said, panel_dpi_probe
> >> kind of exists to allocate and initialize the panel descriptor, and is
> >> called on the descriptor being equal to the (uninitialized) panel_dpi
> >> global variable.
> >>
> >> We should also get rid of that hack, so do something like creating a
> >> function that returns the descriptor, and is indeed called first in
> >> panel_simple_probe. It first calls of_device_get_match_data(), and if
> >> there's no match, and if the device is compatible with panel-dpi, then
> >> it calls panel_dpi_probe (we should probably change that name too). Th=
at
> >> way, we can get rid of the panel_dpi variable entirely.
> >>
> >>
> > Thanks Luca and Maxime.
> > To summarize:
> > 1. add a function like of_device_get_simple_dsi_match_data() which calls
> > of_device_get_match_data(). if the device is compatible with panel-dpi,
> > call
> > panel-dpi-probe()
> > 3. Change panel_dpi_probe() to return the panel descriptor
> > 4. call devm_drm_panel_alloc()
> >
> >
> Looking deeper it looks like I have some gaps in my understanding.
> panel_simple_platform_probe()
> already checks of_device_get_match_data() to call panel_simple_probe(). At
> this point the change suggested is
> to have to call it again to check if it is compatible with panel-dpi? If I
> understand correctly panel_dpi is a fallback
> and the only place the decision to probe panel_dpi() is with the hack.

I'm sure you can figure something out. And feel free to send me patches
for a private review if you feel more comfortable that way.

Maxime

--2h5cadptvtmbwers
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFP9mAAKCRAnX84Zoj2+
dmGUAX9lkPTmSof8rdAbsqbqutnR0VMhpMXTErckzdIjfn52jPzCi2lwkEdOTSO1
ciYHGK8Bf3UtW+YQPLiStMW75b+Py0Ditlm6IFforxt788D1036NSLEgfof4TYKB
e6xyo+RzbQ==
=tCEP
-----END PGP SIGNATURE-----

--2h5cadptvtmbwers--
