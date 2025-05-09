Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6E428FFC9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794745; cv=none; b=FkJr0ITcP78uQDv21B0o8yU/nQApQNcRIS827ce4qPxvfF9+Crbs4CSVFuJ38gYWGubeOUGszeDdWNerKDMibD0husTz5dfFBW9Yv58szl2Y3yOQxXRhNeZu2VSczof6bFa6RIEn7xORPCiCEheBnaXMQAIbO0c8zCG0A8dgtKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794745; c=relaxed/simple;
	bh=fafBjPFckJBsy+LXj+8XoakBi3lyvCE3X2Xb47nw2KE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NE9J4JTri9oefKkWtVGBNjeUWO+BMCo9YBTgcGLQIbTGDCDr6/Bbyuq9YkjwUgcKD5VONBuEjeFbwB8HiYwau7ptbZmr1EpsInz1lXuudn0UwQeuOf9Tsz97Pxs04CUw0liGaxjjf9hf/5xfMOP6JepZIFu+nRNBcRuu9ekuHNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ta79ctUq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ta79ctUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746794742; x=1778330742;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=fafBjPFckJBsy+LXj+8XoakBi3lyvCE3X2Xb47nw2KE=;
  b=Ta79ctUq1Ic1a2O6Z3dHnJSZ560LcBr5hpkU+RvP2ZHzh0XfCyUdeAka
   KqTGthIOmg9ttU//dTPP+8OxX8tSJTfYDQ3/goQsDFx2yplMkKj9LmKxT
   ItxVqIx4eL92VhiIdT/rhIhdFVWBQ+YEdt09/8kD5QajF9ljAdbZZjzC1
   HcCBnklXyr78w4COMVK+1ayBgTkPjjGwb0VY5YYoRHsHkvSVtfhdFMQqj
   IMJTS94V7QfwRLVBrZ6iL2hpVRzoS7Z4rS3VzBE+pf/2pWG5kpVWU9lUx
   5NmBzIdiucoIPCi9Eh1eDSwELAFN+SYN2St+UZaUpYBsSrUOnOZoFSrPG
   Q==;
X-CSE-ConnectionGUID: vcoOCbemS9ym1ROrnAQAnw==
X-CSE-MsgGUID: TsrMS7K5TTSHrstX0rUGlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58841264"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="58841264"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 05:45:41 -0700
X-CSE-ConnectionGUID: K1pihnn7T86fJPAFsE+GSA==
X-CSE-MsgGUID: eFy/w32cTfGh3U1Ym5Vldg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="137104760"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.201])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 05:45:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <20250509-rapid-flounder-of-devotion-6b26bb@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
 <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
 <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com> <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
Date: Fri, 09 May 2025 15:45:36 +0300
Message-ID: <87r00yj6kv.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 09 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> On Thu, May 08, 2025 at 05:27:21PM +0300, Jani Nikula wrote:
>> On Mon, 05 May 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
>> > On Mon, May 5, 2025 at 2:54=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
>> >
>> >> Hi Jani,
>> >>
>> >> On Tue, Apr 29, 2025 at 12:22:00PM +0300, Jani Nikula wrote:
>> >> > On Tue, 29 Apr 2025, Maxime Ripard <mripard@kernel.org> wrote:
>> >> > > Hi Jani,
>> >> > >
>> >> > > On Mon, Apr 28, 2025 at 07:31:50PM +0300, Jani Nikula wrote:
>> >> > >> On Mon, 31 Mar 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
>> >> > >> > Allocate panel via reference counting. Add _get() and _put() h=
elper
>> >> > >> > functions to ensure panel allocations are refcounted. Avoid use
>> >> after
>> >> > >> > free by ensuring panel pointer is valid and can be usable till=
 the
>> >> last
>> >> > >> > reference is put.
>> >> > >> >
>> >> > >> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> >> > >> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>> >> > >> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>> >> > >> >
>> >> > >> > ---
>> >> > >> > v4: Add refcounting documentation in this patch (Maxime)
>> >> > >> >
>> >> > >> > v3: Add include in this patch (Luca)
>> >> > >> >
>> >> > >> > v2: Export drm_panel_put/get() (Maxime)
>> >> > >> > - Change commit log with better workding (Luca, Maxime)
>> >> > >> > - Change drm_panel_put() to return void (Luca)
>> >> > >> > - Code Cleanups - add return in documentation, replace bridge =
to
>> >> > >> > panel (Luca)
>> >> > >> > ---
>> >> > >> >  drivers/gpu/drm/drm_panel.c | 64
>> >> ++++++++++++++++++++++++++++++++++++++++++++-
>> >> > >> >  include/drm/drm_panel.h     | 19 ++++++++++++++
>> >> > >> >  2 files changed, 82 insertions(+), 1 deletion(-)
>> >> > >> >
>> >> > >> > diff --git a/drivers/gpu/drm/drm_panel.c
>> >> b/drivers/gpu/drm/drm_panel.c
>> >> > >> > index
>> >> bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc3031709919564=
d2e4d8332f748
>> >> 100644
>> >> > >> > --- a/drivers/gpu/drm/drm_panel.c
>> >> > >> > +++ b/drivers/gpu/drm/drm_panel.c
>> >> > >> > @@ -355,24 +355,86 @@ struct drm_panel *of_drm_find_panel(const
>> >> struct device_node *np)
>> >> > >> >  }
>> >> > >> >  EXPORT_SYMBOL(of_drm_find_panel);
>> >> > >> >
>> >> > >> > +static void __drm_panel_free(struct kref *kref)
>> >> > >> > +{
>> >> > >> > +        struct drm_panel *panel =3D container_of(kref, struct
>> >> drm_panel, refcount);
>> >> > >> > +
>> >> > >> > +        kfree(panel->container);
>> >> > >> > +}
>> >> > >> > +
>> >> > >> > +/**
>> >> > >> > + * drm_panel_get - Acquire a panel reference
>> >> > >> > + * @panel: DRM panel
>> >> > >> > + *
>> >> > >> > + * This function increments the panel's refcount.
>> >> > >> > + * Returns:
>> >> > >> > + * Pointer to @panel
>> >> > >> > + */
>> >> > >> > +struct drm_panel *drm_panel_get(struct drm_panel *panel)
>> >> > >> > +{
>> >> > >> > +        if (!panel)
>> >> > >> > +                return panel;
>> >> > >> > +
>> >> > >> > +        kref_get(&panel->refcount);
>> >> > >> > +
>> >> > >> > +        return panel;
>> >> > >> > +}
>> >> > >> > +EXPORT_SYMBOL(drm_panel_get);
>> >> > >> > +
>> >> > >> > +/**
>> >> > >> > + * drm_panel_put - Release a panel reference
>> >> > >> > + * @panel: DRM panel
>> >> > >> > + *
>> >> > >> > + * This function decrements the panel's reference count and f=
rees
>> >> the
>> >> > >> > + * object if the reference count drops to zero.
>> >> > >> > + */
>> >> > >> > +void drm_panel_put(struct drm_panel *panel)
>> >> > >> > +{
>> >> > >> > +        if (panel)
>> >> > >> > +                kref_put(&panel->refcount, __drm_panel_free);
>> >> > >> > +}
>> >> > >> > +EXPORT_SYMBOL(drm_panel_put);
>> >> > >> > +
>> >> > >> > +/**
>> >> > >> > + * drm_panel_put_void - wrapper to drm_panel_put() taking a v=
oid
>> >> pointer
>> >> > >> > + *
>> >> > >> > + * @data: pointer to @struct drm_panel, cast to a void pointer
>> >> > >> > + *
>> >> > >> > + * Wrapper of drm_panel_put() to be used when a function taki=
ng a
>> >> void
>> >> > >> > + * pointer is needed, for example as a devm action.
>> >> > >> > + */
>> >> > >> > +static void drm_panel_put_void(void *data)
>> >> > >> > +{
>> >> > >> > +        struct drm_panel *panel =3D (struct drm_panel *)data;
>> >> > >> > +
>> >> > >> > +        drm_panel_put(panel);
>> >> > >> > +}
>> >> > >> > +
>> >> > >> >  void *__devm_drm_panel_alloc(struct device *dev, size_t size,
>> >> size_t offset,
>> >> > >> >                               const struct drm_panel_funcs *fu=
ncs,
>> >> > >> >                               int connector_type)
>> >> > >> >  {
>> >> > >> >          void *container;
>> >> > >> >          struct drm_panel *panel;
>> >> > >> > +        int err;
>> >> > >> >
>> >> > >> >          if (!funcs) {
>> >> > >> >                  dev_warn(dev, "Missing funcs pointer\n");
>> >> > >> >                  return ERR_PTR(-EINVAL);
>> >> > >> >          }
>> >> > >> >
>> >> > >> > -        container =3D devm_kzalloc(dev, size, GFP_KERNEL);
>> >> > >> > +        container =3D kzalloc(size, GFP_KERNEL);
>> >> > >> >          if (!container)
>> >> > >> >                  return ERR_PTR(-ENOMEM);
>> >> > >> >
>> >> > >> >          panel =3D container + offset;
>> >> > >> > +        panel->container =3D container;
>> >> > >> >          panel->funcs =3D funcs;
>> >> > >> > +        kref_init(&panel->refcount);
>> >> > >>
>> >> > >> Hi Anusha, this should be done in drm_panel_init() instead.
>> >> > >>
>> >> > >> There are many users of drm_panel that don't use
>> >> devm_drm_panel_alloc()
>> >> > >> but allocate separately, and call drm_panel_init() only.
>> >> > >
>> >> > > That wouldn't really work, because then drivers would have alloca=
ted
>> >> the
>> >> > > panel with devm_kzalloc and thus the structure would be freed whe=
n the
>> >> > > device is removed, no matter the reference counting state.
>> >> > >
>> >> > >> They'll all have refcount set to 0 instead of 1 like kref_init()=
 does.
>> >> > >>
>> >> > >> This means all subsequent get/put pairs on such panels will lead=
 to
>> >> > >> __drm_panel_free() being called! But through a lucky coincidence=
, that
>> >> > >> will be a nop because panel->container is also not initialized...
>> >> > >>
>> >> > >> I'm sorry to say, the drm refcounting interface is quite broken =
for
>> >> such
>> >> > >> use cases.
>> >> > >
>> >> > > The plan is to convert all panel drivers to that function, and An=
usha
>> >> > > already sent series to do. It still needs a bit of work, but it s=
hould
>> >> > > land soon-ish.
>> >> > >
>> >> > > For the transitional period though, it's not clear to me what you=
 think
>> >> > > is broken at the moment, and / or what should be fixed.
>> >> > >
>> >> > > Would you prefer an explicit check on container not being 0, with=
 a
>> >> > > comment?
>> >> >
>> >> > I'm looking at what it would take to add drm_panel support to i915 =
so
>> >> > that you could have drm_panel_followers on it. There are gaps of co=
urse,
>> >> > but initially it would mean allocating and freeing drm_panel oursel=
ves,
>> >> > not via devm_drm_panel_alloc() nor devm_kzalloc(), because none of =
the
>> >> > other stuff is allocated that way. drm_panel would just sit as a
>> >> > sub-struct inside struct intel_panel, which is a sub-struct of stru=
ct
>> >> > intel_connector, which has its own allocation...
>> >>
>> >> I'm not entirely sure why you would need to allocate it from i915? The
>> >> drm_panel structure is only meant to be allocated by panel drivers, a=
nd
>> >> afaik no panel interface controller is allocating it.
>>=20
>> I'm looking into a use case involving drm_panel_follower, which requires
>> a drm_panel. I don't really need any of the other stuff in drm_panel.
>>=20
>> And basically you'd have one drm_panel per connector that is connected
>> to a panel, within the same driver.
>
> That answers why you need a drm_panel pointer, but not really why the
> i915 needs to allocate it itself. The whole point of panel drivers it to
> decouple panel drivers from the connector driver (and everything
> upstream).
>
> drm_panel is always allocated by the panel driver itself. I don't really
> see a good reason to change that.
>
> If you don't have a panel descriptor in the ACPI tables, then you can
> always allocate a panel-edp driver or whatever from i915 and getting its
> drm_panel?

The thing is, absolutely none of our hardware/firmware/software stack
was designed in a way that would fit the drm_panel model. (Or, arguably,
drm_panel wasn't designed in a way that would fit our stack, in the
chronology of things.)

It's all one PCI device. All in the same MMIO space. The VBT (Video BIOS
Tables) contain all the information for the panels, as well as for
absolutely everything else about our display hardware. It's not separate
in any meaningful way.

Having a separate panel driver would get in the way. Having panel-edp
would get in the way. That's why there isn't a single x86 user for
drm_panel, AFAICT.

Yes, we only really need the drm_panel handle, to play ball with the
things that were built around it, specifically drm_panel_follower.

And we do need to allocate drm_panel ourselves. We're both the host and
the panel driver at the same time, and there's no benefit in trying to
articially change that. DRM infrastructure should provide frameworks
that are usable for everyone, instead of trying to force everyone into
the same model, whether it makes sense or not.


BR,
Jani.

--=20
Jani Nikula, Intel
