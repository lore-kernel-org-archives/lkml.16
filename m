Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0326A29898B;
	Thu, 12 Jun 2025 15:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741914; cv=none; b=kd8KlzeH+qakzlmDpMq6KcbJKdXJqU2MjADAYp2RFMYj27c5jhTmExkCIA27/Zy+09JI+34yiWH9MXiOvKoj68sBFBGByW5RapY8Wcd98ACbLwZeaoEZpSTV/WLCOGwj1uLU3F/EVhcrl1egx099XxN/BjVLYz/pAmS4ZebGH58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741914; c=relaxed/simple;
	bh=C7a86Yhj5m8oAToWQsghVy7t7t+w/IFoVAVKpwf8HyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxW0zMozBIoqapZM77zYrjFvz9MGroxflMszerBX46FDDnAqU0PGf3P3SIFAm2VAUg/EBfb9wkNH41gib9S64PncR03WD6gcvFwFcxJ0Y6nBDKnkFjsu1No+M9zN/U5IHtMpKTbPyip8vumP/jrX1PlEMpJfiE+Ct0S4CgA8LYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxpHCNIl; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxpHCNIl"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e819aa98db9so728024276.3;
        Thu, 12 Jun 2025 08:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749741912; x=1750346712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r46XBy+QkGdSMo1M9nVj1rp34sDjOp5zH0JQOJTyWS0=;
        b=YxpHCNIlF97yTbn9jLC4mqhT9umaOc1a0LG4xyIr8wHm2B2951wEKAhxdO2ctnQocD
         gnzzC2xrBdvg5NUOl/iZHzNMjhObqoZLoIrBzC7VCtFXZeZ+hFJjrBP+9IT5dYJjPLYx
         5MqPCHqLnjhWsINAV8YLBClh5Lu3105bsM4InhMtg9jwDpX5tN33sXYZxR9RYjV69Df8
         WDsagvKwJ2I42+SW7S5BFHjGaAs+k7dtqzTWB+xOUt27mVghAIZknV+5Cni5Qxf5CDJw
         bwm0GGWjIVHv8OfFq0ORGoluT2zyiGbus1ppYqmM6RJdy4uv0ODXuDZXwexI+WVvHErg
         9pWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749741912; x=1750346712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r46XBy+QkGdSMo1M9nVj1rp34sDjOp5zH0JQOJTyWS0=;
        b=aGlYz3S1Z7ssgPNPN+Aw8yRMT8C8Cu3xErCxkOHFBSdwR++mV3xGA0BxXtYehh+tqo
         R3DZWEq1bIyCdFCPeSNtqPm92GVo6dqBI75pcp6+OPMtFg1Kq31jdz37KDkGX2/sfDBD
         WY8YzVysZwAGheWgI03cSmBCy2sQJXM53g+mFhMsYNpvK0m3cTPMaxEgNOCetE2AIduw
         B46xYFI+gb3XYSa6lv7zYgIybb5HByUWjjvRyuIHztJDRm0JCBOwOVf9pAyogR4QmI9d
         Aiz3xAFYjL8qk436GXxTnR+rjWhB2YgEtw6c2Pa81L4FB8j+w9GfhlhdmkWO3reU00K/
         53WA==
X-Forwarded-Encrypted: i=1; AJvYcCUQxna5vSJhpmaWX0Uy8xNby3yT0t8tspYz/9X/KC+CLhUwHP8ERvCeHqR+609aI4lNnlNs8EJRHeDKZ2fAMvA=@vger.kernel.org, AJvYcCW8maIDOEFms8TWoozoVeLZfnatOH1o2GjR1JkNN5z6F1llN3lmJPMgVLdLXy83n3TTDih8QkRQvE0hdeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUwiVa54fI6r+isSHn0p9Re6pWtsFiSb0f/VKL8rhm2aVsrDXv
	mM7oKD0Xw4ELKWRcrA2gi2inMlZ9vY6NgsGhoo+jzgZ8Bl+uov/fxwTWJQ78iA==
X-Gm-Gg: ASbGncu6qpN9QqYng1ra0OTnNDuNLzVgEpNaeaK+lAX5kaI5ExBLfmZdkyRZQHKIzZ6
	YOo0uJXcVzUfDdiwla0OLystUpKlhxgZvtin6OI9fqoYTX+9FQ/TmrWFpWYMktcB6Ax/1jOCeyj
	plgMBuge1OjaXYGH+7fFNeBap3qFf25GcPJTdyMSUjBl7gVlp+QHU8wEZ3Smb2xdfu/Jy/bWFIz
	x7zEkBOwc00+LGkk/Dc6GqaBKNnqQwoccmyipO8OCGyOTbfSXmqLw14O/rPzf56fuiXywKcj3H/
	eXvkZ6bPRv0fT8Fs/Cpa5ZnD4AflHgurqKiMdrS5SPsYSUec2Pri9TqI0Ac9I5X1e+ADcPOGZZ0
	QH0zxJiaGLxx8PeUHD38ocrmBwfleWLtserPGiFeyQHaX9ewv4bRl
X-Google-Smtp-Source: AGHT+IEgQn2ULLvewzT0FRnyIp4vuTqYKiY3bdRt4hXPx8AJzOuNN7bjf+FUMEGeWYszvdvCgntL6w==
X-Received: by 2002:a05:6214:cce:b0:6fa:fc96:d10a with SMTP id 6a1803df08f44-6fb3d2b2084mr1096636d6.27.1749741899634;
        Thu, 12 Jun 2025 08:24:59 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b20fc8sm11301856d6.10.2025.06.12.08.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:24:59 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id CB6871200043;
	Thu, 12 Jun 2025 11:24:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 12 Jun 2025 11:24:58 -0400
X-ME-Sender: <xms:SvFKaAunp1UeEn64kuH43XeQALy8baCkbQfxwc8Auyt2vZdgdi1UwA>
    <xme:SvFKaNcdkOiLtuKJCb5gJGEuCItNHaK3o3bitKR7vw5E6hWIBkbPExa5m3RPchXqx
    UdhXfYl4cQjm8g6ag>
X-ME-Received: <xmr:SvFKaLw2wGs_z-9nszOZxO7xwANsvtC0Gw6ETMeKXeIfgntKZVfpxH-APSI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephfetvdfgtdeukedvkeeiteeiteejieehvdet
    heduudejvdektdekfeegvddvhedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhn
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejje
    ekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhn
    rghmvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhn
    uhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrh
    ihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohht
    ohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhoth
    honhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:SvFKaDOiN1QykfXWJJGrfA41ePZBvCG3p0DlKqrFGtQhQFqLK1I2mA>
    <xmx:SvFKaA-msdQhIpIP3GnNH8ElDhn0lbSJ2ajVAlrv9aWVDxlDLxL9zg>
    <xmx:SvFKaLXKj8O9RQCLST2j7D6-j9PBVyPWfo3KgYSfWxfLUkVyoa84AA>
    <xmx:SvFKaJd-0bt1-cbbcW9pgF7Tvp_Qok964NSqhyflA6CaE51bsU_d8w>
    <xmx:SvFKaCdd093rbJ_SAO7iq9KRXV8MJkW-z0cK0hPyW5wTgLXVbx8kgMDw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 11:24:58 -0400 (EDT)
Date: Thu, 12 Jun 2025 08:24:57 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, chrisi.schrefl@gmail.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] rust: devres: fix race in Devres::drop()
Message-ID: <aErxSYp0AsHGWt0E@tardis.local>
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-4-dakr@kernel.org>
 <aD-EiRChuScS5TK-@tardis.local>
 <aEAWwnyP4zwwrccX@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEAWwnyP4zwwrccX@pollux>

On Wed, Jun 04, 2025 at 11:49:54AM +0200, Danilo Krummrich wrote:
> On Tue, Jun 03, 2025 at 04:26:01PM -0700, Boqun Feng wrote:
> > On Tue, Jun 03, 2025 at 10:48:52PM +0200, Danilo Krummrich wrote:
> > > In Devres::drop() we first remove the devres action and then drop the
> > > wrapped device resource.
> > > 
> > > The design goal is to give the owner of a Devres object control over when
> > > the device resource is dropped, but limit the overall scope to the
> > > corresponding device being bound to a driver.
> > > 
> > > However, there's a race that was introduced with commit 8ff656643d30
> > > ("rust: devres: remove action in `Devres::drop`"), but also has been
> > > (partially) present from the initial version on.
> > > 
> > > In Devres::drop(), the devres action is removed successfully and
> > > subsequently the destructor of the wrapped device resource runs.
> > > However, there is no guarantee that the destructor of the wrapped device
> > > resource completes before the driver core is done unbinding the
> > > corresponding device.
> > > 
> > > If in Devres::drop(), the devres action can't be removed, it means that
> > > the devres callback has been executed already, or is still running
> > > concurrently. In case of the latter, either Devres::drop() wins revoking
> > > the Revocable or the devres callback wins revoking the Revocable. If
> > > Devres::drop() wins, we (again) have no guarantee that the destructor of
> > > the wrapped device resource completes before the driver core is done
> > > unbinding the corresponding device.
> > > 
> > > Depending on the specific device resource, this can potentially lead to
> > > user-after-free bugs.
> > > 
> > 
> > This all sounds reasonable, one question though: it seems to me the
> > problem exists only for the device resources that expect the device
> > being bounded, so hypothetically if the device resources can be
> > programmed against unbound devices, then the current behavior should be
> > fine?
> 
> I don't think that such device resources exist from a semantical point of view.
> 
> We always have to guarantee that a driver released the device resources once the
> corresponding device is unbound from the driver.
> 
> However, there certainly are differences between how fatal it is if we don't do
> so.
> 
> Complementing your example below, if we for instance fail to release a memory
> region in time, a subsequent driver probing the device may fail requesting the
> corresponding region.
> 
> > For example, in your case, you want free_irq() to happen before
> > the device becomes unbound, which is of course reasonable, but it sounds
> > more like a design choice (or what device model we want to use), because
> > hypothetically you can program an irq that still works even if the
> > device is unbound, no?
> 
> You can, just like for every other registration (e.g. class devices, such as
> misc device), but it's sub-optimal, since then we could not treat the
> registering device of the registration as &Device<Bound>, which allows direct
> access to device resources with Devres::access(). Please see also [1] and [2].
> 
> We have two (safe and correct) ways to access device resources, one is the
> runtime checked access through Revocable::try_access() (which implies the RCU
> read-side critical section and atomic check); the other one is the compile-time
> checked access through providing a &Device<Bound> as cookie for directy access
> without runtime overhead.
> 
> Wherever possible, we want to enable the latter, which means that registrations
> need to be properly guarded.
> 
> [1] https://lore.kernel.org/lkml/20250530142447.166524-6-dakr@kernel.org/
> [2] https://lore.kernel.org/lkml/20250530142447.166524-7-dakr@kernel.org/
> 

Thanks for the explanation, and sorry I'm a bit late for the response. I
was trying to find a place that we should document this, how about the
diff below:

------------
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 0f79a2ec9474..c8b9754e411b 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -31,7 +31,8 @@ struct DevresInner<T> {
 /// manage their lifetime.
 ///
 /// [`Device`] bound resources should be freed when either the resource goes out of scope or the
-/// [`Device`] is unbound respectively, depending on what happens first.
+/// [`Device`] is unbound respectively, depending on what happens first. And if the resource goes
+/// out of scope first, [`Device`] unbinding will wait until the resource being freed.
 ///
 /// To achieve that [`Devres`] registers a devres callback on creation, which is called once the
 /// [`Device`] is unbound, revoking access to the encapsulated resource (see also [`Revocable`]).


Regards,
Boqun

> > Again this sounds reasonable to me, just want to check my understanding
> > here.
> > 
> > Regards,
> > Boqun
> > 
> > > In order to fix this, implement the following logic.
> > > 
> > > In the devres callback, we're always good when we get to revoke the
> > > device resource ourselves, i.e. Revocable::revoke() returns true.
> > > 
> > > If Revocable::revoke() returns false, it means that Devres::drop(),
> > > concurrently, already drops the device resource and we have to wait for
> > > Devres::drop() to signal that it finished dropping the device resource.
> > > 
> > > Note that if we hit the case where we need to wait for the completion of
> > > Devres::drop() in the devres callback, it means that we're actually
> > > racing with a concurrent Devres::drop() call, which already started
> > > revoking the device resource for us. This is rather unlikely and means
> > > that the concurrent Devres::drop() already started doing our work and we
> > > just need to wait for it to complete it for us. Hence, there should not
> > > be any additional overhead from that.
> > > 
> > > (Actually, for now it's even better if Devres::drop() does the work for
> > > us, since it can bypass the synchronize_rcu() call implied by
> > > Revocable::revoke(), but this goes away anyways once I get to implement
> > > the split devres callback approach, which allows us to first flip the
> > > atomics of all registered Devres objects of a certain device, execute a
> > > single synchronize_rcu() and then drop all revocable objects.)
> > > 
> > > In Devres::drop() we try to revoke the device resource. If that is *not*
> > > successful, it means that the devres callback already did and we're good.
> > > 
> > > Otherwise, we try to remove the devres action, which, if successful,
> > > means that we're good, since the device resource has just been revoked
> > > by us *before* we removed the devres action successfully.
> > > 
> > > If the devres action could not be removed, it means that the devres
> > > callback must be running concurrently, hence we signal that the device
> > > resource has been revoked by us, using the completion.
> > > 
> > > This makes it safe to drop a Devres object from any task and at any point
> > > of time, which is one of the design goals.
> > > 
> > [...]
