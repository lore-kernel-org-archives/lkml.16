Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1C92C3271;
	Tue,  3 Jun 2025 23:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748993167; cv=none; b=gxcYf/X0OMqVaklc16VivSPLbEpu4N03GLs2U7/chXvlbTraNT7MvDPTtIfXh+Acp7CgXXVKYT45dO1dHlSAvFh/dwzRtUtYR0yJ7keRuLoTLAUjnlq5p83m1X3Ei0akMEtzVTpZUDYMKZkjjT1XV4GNPAzqfguAd7XsrA8fGtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748993167; c=relaxed/simple;
	bh=t55H9+CCM1iexCI5xCqNbPIww7zc7J5kzl4qRl4r9UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kESR1+smrVcD+JwuHdHBc163rk/evpDr1nF/FXvvQ6MW165jZ571LIlEbXR+6u9kpKmMmaFsZa0V9+1xPttgAwVVyODtOz2SbgBJLP56rrQFli3/k6oDnbvKeLHliIVuGDoUKC2EC7Ln9BbiqLKFMwCOudAILNepmjL0dw3UbfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQked4Lw; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQked4Lw"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c922169051so333189485a.0;
        Tue, 03 Jun 2025 16:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748993164; x=1749597964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a3qr4ebW99L9FDdCCaT36ed+qYvbvVbKdCj4BGtDLI=;
        b=mQked4Lwn5kWC+Gxtr3S/VGErnWU2W+1MarLKK1ZSA00X1NbPYdYZzY6DWWwfuM0m7
         LP+q5NT3iCFW9NNEUO2bgEUMw8k2d8yUWw1eK4H9barYlsyvk8P9oHy15q3XxM+44+nK
         gN9r/s3Zx3b0ZsxRycxs3u7NKNesDtysfaTXpPBKO5ngNeiTPbt4ckYS1A0jUVCvX7nI
         eQGXIbT90TRbcJopX3PDyFLqLIYMv++td0/xptk+jfNuSiQeqa9SH/G94hNvOZfYM2Gu
         dwMBejxWgFwRmHFk2Kn+1Mz3GWUkR6d04q1qvWQd04OLG6S1YP9UfpvsEi2jiYFyJ0CL
         vx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748993164; x=1749597964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0a3qr4ebW99L9FDdCCaT36ed+qYvbvVbKdCj4BGtDLI=;
        b=EDuzlmtEVgxffzNvQZ0M6kXoPkElnCie4YPMFBVo7TCJkIETD5kVGwTVFtELnh+Tw2
         qX/tljG17amZHgRL1FEsstK9/e0f+7CQWWq+VqELcRTzLOWphOxhNJ8KLBJUBMsfsRAV
         eS4KW/OHUDLuQ9Cg6R/Ph6ncBWtf3fxt8sTNvdfP9gbRvZsMAThD3zsjoHRVdv4Uw4t6
         JCWcAKoASyMjs9aqoiyCiVV/WP+jdX7o9wbq4blD4TRv0vZyQZ0FH/gVqJeJk2Su7z5r
         vJSd87GT33gbXMvx7KJx0nwa5E4rc/je1uGUkyBEajppg6O1fB1d/8xMc0kDZCNsRqTu
         sufw==
X-Forwarded-Encrypted: i=1; AJvYcCWEmCFhdYTMPOfCmKl6lNmZvPOsXgNS3SPDqvnEmn4JxRaAisPfzXa8bYketCceyDpdZfDeXPcQoHCvJsE=@vger.kernel.org, AJvYcCX8OoMnMOKkc1+zVlbMV3vzW5VUd4aPtFwjwGEc3BM+zR20uBvlapisJrLUWUMzdupya1OZwqYwVZXzDxx8tKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe4aEyipTHm2UaLjfcrHqwB+dz/Lz254rSx1O4R9ZA5X6j16Py
	IgiHlOd8IPi6HeWt7GehcfxNcGYceJwqcF0GAL9/W4gFKDSakaTKgNgR
X-Gm-Gg: ASbGncsyh+gWrqPjDAUZULy8m7werE8iV19BrgyBPSPWOpazFjnIFEFce4B2GNHAa8N
	Y6a0/WiKFQJihivatHShMNzjGGgj47Prw8djbqUYkYgvEMwrDaNfWPyPM3rEyDaIT6BuQFCOhrC
	5l3HjO9DMTD5X7aRVZfP2+PNRHOgPmAQWTg+Cfoa1cLdTAbj7+xquoSeWVPz4MUV07Thr9z9Dox
	Sqgeu3k5cYx9nHO9g2O5ShQxI3TIrpsvnO9A1Nr67wlxG4X8bh5TGUm68dWSi1sij5OcPrVkbUU
	KCsg4mZ6LS4IDZBJLqeE1g+KNvEdZB9n4r/Iylq6OhmO/kCKMVUARiC5YFCoIz1kp0x8Jgo73GX
	1BJmuNJl39BXF0mSlajFjPxGmoV33lE7rqfIfFfKXlw==
X-Google-Smtp-Source: AGHT+IFn8aUvUKppvaTXbRaXpTpaaRRw6n1scKvDByP9sRKLASnjHffP9oelLTz5kJBWC+TwOM5FQA==
X-Received: by 2002:a05:620a:2913:b0:7ce:bdc6:af03 with SMTP id af79cd13be357-7d2198b63c0mr154454285a.34.1748993164148;
        Tue, 03 Jun 2025 16:26:04 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a11274dsm927795085a.58.2025.06.03.16.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 16:26:03 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id E62BB1200043;
	Tue,  3 Jun 2025 19:26:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Tue, 03 Jun 2025 19:26:02 -0400
X-ME-Sender: <xms:ioQ_aIh6ftfWkQlPd9qtso8FVC2fMGYZTUO5jVb54bAbE6Z1GJ7z0w>
    <xme:ioQ_aBB4RpBGT-GfkDS3P_d4PY9JnR4hJnzIc0M3CJQhbQcpY6BjDB1IPzAsOnGEz
    CmnscdaMJoKNHqoXw>
X-ME-Received: <xmr:ioQ_aAHX_0N2arXNoqEVjdepd8HAi7iEacQ6DbKl8VjYyaLv00nYPUUzy3Bp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghp
    thhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoh
    epsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggv
    nhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusg
    horhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ioQ_aJTd6CaM42q2RLtri0IeioP7Sqyc2FGiPSPn8-JGsMtWGAm2hQ>
    <xmx:ioQ_aFwU7aB070GW0Ni3H5GWfEza_wI7w57J0qcCZW8T6jTvV52kyA>
    <xmx:ioQ_aH7v8pKPU7GQGbD4RL1DqC9gWN0bc9vMwzWxrYdBhX7lq2G1rw>
    <xmx:ioQ_aCy-YFPGGhCLVUKVZEdNjvCACKpBN9JawdGOlokZKRpz6QDrqQ>
    <xmx:ioQ_aJhNTewALMSpzSDjQGqS0UN-BPwRLZ9V1Vw_EhPZytzpRdLrmfTG>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jun 2025 19:26:02 -0400 (EDT)
Date: Tue, 3 Jun 2025 16:26:01 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, chrisi.schrefl@gmail.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] rust: devres: fix race in Devres::drop()
Message-ID: <aD-EiRChuScS5TK-@tardis.local>
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603205416.49281-4-dakr@kernel.org>

On Tue, Jun 03, 2025 at 10:48:52PM +0200, Danilo Krummrich wrote:
> In Devres::drop() we first remove the devres action and then drop the
> wrapped device resource.
> 
> The design goal is to give the owner of a Devres object control over when
> the device resource is dropped, but limit the overall scope to the
> corresponding device being bound to a driver.
> 
> However, there's a race that was introduced with commit 8ff656643d30
> ("rust: devres: remove action in `Devres::drop`"), but also has been
> (partially) present from the initial version on.
> 
> In Devres::drop(), the devres action is removed successfully and
> subsequently the destructor of the wrapped device resource runs.
> However, there is no guarantee that the destructor of the wrapped device
> resource completes before the driver core is done unbinding the
> corresponding device.
> 
> If in Devres::drop(), the devres action can't be removed, it means that
> the devres callback has been executed already, or is still running
> concurrently. In case of the latter, either Devres::drop() wins revoking
> the Revocable or the devres callback wins revoking the Revocable. If
> Devres::drop() wins, we (again) have no guarantee that the destructor of
> the wrapped device resource completes before the driver core is done
> unbinding the corresponding device.
> 
> Depending on the specific device resource, this can potentially lead to
> user-after-free bugs.
> 

This all sounds reasonable, one question though: it seems to me the
problem exists only for the device resources that expect the device
being bounded, so hypothetically if the device resources can be
programmed against unbound devices, then the current behavior should be
fine? For example, in your case, you want free_irq() to happen before
the device becomes unbound, which is of course reasonable, but it sounds
more like a design choice (or what device model we want to use), because
hypothetically you can program an irq that still works even if the
device is unbound, no?

Again this sounds reasonable to me, just want to check my understanding
here.

Regards,
Boqun

> In order to fix this, implement the following logic.
> 
> In the devres callback, we're always good when we get to revoke the
> device resource ourselves, i.e. Revocable::revoke() returns true.
> 
> If Revocable::revoke() returns false, it means that Devres::drop(),
> concurrently, already drops the device resource and we have to wait for
> Devres::drop() to signal that it finished dropping the device resource.
> 
> Note that if we hit the case where we need to wait for the completion of
> Devres::drop() in the devres callback, it means that we're actually
> racing with a concurrent Devres::drop() call, which already started
> revoking the device resource for us. This is rather unlikely and means
> that the concurrent Devres::drop() already started doing our work and we
> just need to wait for it to complete it for us. Hence, there should not
> be any additional overhead from that.
> 
> (Actually, for now it's even better if Devres::drop() does the work for
> us, since it can bypass the synchronize_rcu() call implied by
> Revocable::revoke(), but this goes away anyways once I get to implement
> the split devres callback approach, which allows us to first flip the
> atomics of all registered Devres objects of a certain device, execute a
> single synchronize_rcu() and then drop all revocable objects.)
> 
> In Devres::drop() we try to revoke the device resource. If that is *not*
> successful, it means that the devres callback already did and we're good.
> 
> Otherwise, we try to remove the devres action, which, if successful,
> means that we're good, since the device resource has just been revoked
> by us *before* we removed the devres action successfully.
> 
> If the devres action could not be removed, it means that the devres
> callback must be running concurrently, hence we signal that the device
> resource has been revoked by us, using the completion.
> 
> This makes it safe to drop a Devres object from any task and at any point
> of time, which is one of the design goals.
> 
[...]
