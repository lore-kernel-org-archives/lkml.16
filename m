Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB851339A4
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 14:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749220108; cv=none; b=HLPr8SwL9r4SQaXtgT4k1D6MvSJI5GUG/62C/f0tjFsPXzShPHwm3ywkIoKjAj18Vw+KyJ5LkJG2IoVlsCd/OSdmp6pp7/DsTyEnKWTspLqXsK+3WZOAOqo/iVjA6BudTOPY4x4pI5Jzdiwu7XCGMM4P665AZtpy7G8PYPFS2Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749220108; c=relaxed/simple;
	bh=Li7ibbFp6IAWaPGC1mntaG/QZQpQuadYqbXM0mDxQQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oh0DHUG6Z/+QkRTGVFwiVrhLK/kE3uAE3LHSGaiwwVW5twS35d04+kwcDYRtNxsTINlB98mQ90VRIUSzVcvxv0gUO6KGEKMITJIv1MM1DSs7aEURVv/PVmo2xoDCKOs1+p4otLQLWnWx5KQgz1WftvpNiFHAabbtjmJfKizEjn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gfDu4XLW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gfDu4XLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749220105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ALf2A6SSvV1hHGniFOaJAJDOmsxkAraK1tIfpQpNucs=;
	b=gfDu4XLWLl0z4fMm/klMntI9JPTn/7LBJC6sswgmbonYWTCZytR6apJoYXnIUgpo7s+60r
	VQTWJVapvsc5ZxoKROOi3mX25UJIt8WB3rkfa+LwmcaFy7QMgvuSsXBUYQ5/f4P4g7imT6
	0HInieiFxiv4jZTOQNU3VSkeJFGNgKk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-d35b6AMVObyaxqtBs5WkEQ-1; Fri, 06 Jun 2025 10:28:24 -0400
X-MC-Unique: d35b6AMVObyaxqtBs5WkEQ-1
X-Mimecast-MFC-AGG-ID: d35b6AMVObyaxqtBs5WkEQ_1749220103
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47ae87b5182so36990871cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 07:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749220103; x=1749824903;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALf2A6SSvV1hHGniFOaJAJDOmsxkAraK1tIfpQpNucs=;
        b=vF3HnuB4pN+BgY8jIFj2ciuxQji1s4Gr45t8gocdgF5jmZPBwgD9p00h5Z1BkA4v23
         mU44P7CHYtUv1j6Nz6mvT5rmfIKIVvpK72Cek4A52i7iboC5/Ni8r4KhIQKdHwzovUjP
         JV9ZOL2RZRAoVHZoFLSkhr71sQ4U6gOP53OkOVHAN/FdN3nZCqvL7LMgvM8TdXSZjdO5
         /mEGmT/TGRogG6VmKNwmxX9KwAgH953pV/oLbyG0Wl0K1DkHV2XtIREEVqS9YWiDMVmq
         kt+vvN+/O974YFYrdMBkNriCZqlAtkxmsuOK1g8q+NIxDs+22PPrxBGFzxk1ERe34EIv
         NjBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC9BOnyqqT2X6EdgoL7B3rT9xdwRlAEXWgZkVOaKBEddprMWc5qQcVUbhp71pjA7q/RoxIEuOAxvzgBCw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz4uGKsNU3jSctcz7IUy9EETS2LjaTCdMfu4TsxyM3nBwtFRjS
	VI88kA006Oe1UA6A9wjxsssmrzK47O1C99waTLGdzDHKZQ3tx14I/gPPbdeiDyo627Vh114YyTk
	MlzWypAKKDRPYgZplKhlOoAnDp2SnoLYmBJyPMdjteGrZITuqsvRf2MA5ieza5Vo4Bu8QclRCCg
	jx
X-Gm-Gg: ASbGncsegzR0gQPPltRlmeR6cTllYSUE/ag5nv7n+iIEP+on97bTI/0lOD616obd0Qw
	Mr+XFLfbbKueXr2aedIwHoKPcOF17LDwRpcFhkFxwaoC01P6jf2yh0sbC3X3ltuBb+p0fhcKg/t
	+7d9L2SW2m4ynKEtIE4tZrqgH1SIymTS5sXi2MFbtanfDTQ0YfQ8wmXv7TNhoqLf764yKgOd2Y5
	Ajo84jpyNeZ5bC+hgVRLgYk61pjjDPevwtmak38sMAJRgP8o67hGNN9wvPzQy8Aqjgx/bzuorpd
	Pa1+x/HDJNCL6KPYdEiTl+t0GdEk+CmHnkLWSLqB4GV2Ew==
X-Received: by 2002:a05:622a:5c95:b0:476:8f75:b885 with SMTP id d75a77b69052e-4a5b9ece0f5mr63062251cf.44.1749220103132;
        Fri, 06 Jun 2025 07:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpf4O45y7/LqbcN4g1foJ8Kzb9sFSBSPTzamnMml1OhKOozVnoN1sS1mY/qb2zqIL8mkLT4Q==
X-Received: by 2002:a05:622a:5c95:b0:476:8f75:b885 with SMTP id d75a77b69052e-4a5b9ece0f5mr63061841cf.44.1749220102756;
        Fri, 06 Jun 2025 07:28:22 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619852fddsm13548021cf.40.2025.06.06.07.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:28:21 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:28:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Alberto Ruiz <aruiz@redhat.com>
Subject: Re: [PATCH v2 03/10] clk: test: introduce a few specific rate
 constants for mock testing
Message-ID: <aEL7A_YeC8b4Wj48@x1>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
 <20250528-clk-wip-v2-v2-3-0d2c2f220442@redhat.com>
 <20250606-fabulous-fortunate-chamois-ab4c98@houat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606-fabulous-fortunate-chamois-ab4c98@houat>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jun 06, 2025 at 10:56:57AM +0200, Maxime Ripard wrote:
> On Wed, May 28, 2025 at 07:16:49PM -0400, Brian Masney wrote:
> > Some of the mock tests care about the relationship between two
> > different rates, and the specific numbers are important, such as for
> > mocking a divider.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> It's not obvious to me why they are important, actually. The relation
> between the two is, but a divider (and our tests) should work with any
> parent rate, so I guess we can expect it to be opaque.

I agree as well.

> Can you expand on why it's important?

I personally find that having specific numbers in some (but not) of the
tests make the tests clearer that specific functionality within the clk
core is exercised. For example, assume we have a parent that can do any
rate, and two children that are dividers. We could have a test like the
following:

    clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_1);
    clk_set_rate(ctx->child2_clk, DUMMY_CLOCK_RATE_2);
    KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_1);
    KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_2);
    /*
     * Make something to figure out what the ideal parent rate should be
     * and test that as well?
     */

So if we set child1 and child2 to 16 MHz and 32 MHz, then that exercises
one path through the clk core. However, it will currently fail if we set
the children to 32 MHz and 48 MHz. I have this working on a WIP branch
and one of my new tests looks similar to:

    clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_32_MHZ);
    clk_set_rate(ctx->child2_clk, DUMMY_CLOCK_RATE_48_MHZ);
    // This should test that it's a multiple of 96 MHz
    KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_96_MHZ);
    KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_32_MHZ);
    KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_48_MHZ);

Based on the work in my WIP branch, I think we need to make some of the
divider only clk tests parameterized, and have a table with various
specific frequencies so that various edge cases within the clk core are
tested by the frequency combinations.

I think that instead of having a list of DUMMY_CLOCK_RATE_XXX_MHZ
defines, a single define like this will suffice:

#define clk_dummy_rate_mhz(rate)      ((rate) * 1000 * 1000)

Brian

