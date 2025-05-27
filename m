Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851201DE89B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748372874; cv=none; b=YTh6lReZJxLGccxtsUConH5SjiFCGLrp9GrvcwZDgbiRG4XGsVqLx0WYrf1EpW/NaO/awOPE+JZSkLAdsiLf6BajTRAkTgEME15JHeNxAI9p/no8p+s0c+hA6w7VZ4IpaUWnEdOnZTOzMyyrMG7+96OaL+MrAYHfZTNgNMRAgsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748372874; c=relaxed/simple;
	bh=STt7N3ZsRLDgwMrtU7HVGndjJG0h7iOlUn1hAUBFkJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=It9VXIaDgLFG8JlP86ouSbov1O9iVzifvzboEtdYx/7WJQZFO8ZpL8gG3Oal6+Sr3SvGEoOIS7s4OnRK70yid3iBINp6YYzi7wwcnS5y41JzCOT2ckq48p3l35pylfimWJGGvGoPUkdEp/RlVF8157x/KOTNcRk/WAQ3SHB4UBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BFpuTqhr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BFpuTqhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748372871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/kgB3HWrM3JfdOdr2OpeMYZM424A8pWTZk1rn9I1hkw=;
	b=BFpuTqhro/5POp581lI0sO/L6MKSiAIKOoMpEAitoRbB7YhmBpQfGCJlUBGwpLIepYR+Nv
	3u+kgG0wyoY8FWg7KGKmIdnflXgECW6ClP017y8YX6n3jQbvcAUENgDbFNejTxe7dYRBjh
	NIKLwVm1aCprJbIaP6msJfx11+N23ls=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-XmUOkoyBORCWCSdpN9SR-w-1; Tue, 27 May 2025 15:07:50 -0400
X-MC-Unique: XmUOkoyBORCWCSdpN9SR-w-1
X-Mimecast-MFC-AGG-ID: XmUOkoyBORCWCSdpN9SR-w_1748372869
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caef20a527so991758685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748372869; x=1748977669;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kgB3HWrM3JfdOdr2OpeMYZM424A8pWTZk1rn9I1hkw=;
        b=T/sgdGtfjK2YggtwXVKXq8oVsRaMXfJSGYiQb9t1RT3T9KskISF0rt5MR1oWC8ut/l
         TDDOarumX5R1O/oDp91oYFMLhkUkwR2kknsQGXv1IeA7/pGWdp2NNDr11vWOtJ9F258T
         XXEigBPMgydrV8rFPdRNKVpUgacx2u7IWJeMvXKfMnZB1U7UCR9c1cuJupTUghb65MUx
         /ipBQaHdsCTX75pjQ/QOfYDZyUchCA19qXhOCT3RzC12QnkgPZStu6D/QNzXqnf+QGEP
         9rLJ2sIfTPR2Z4Gg7JwhHOsW4j9UJRgeQnpv9hLPVh+MspQclLTMcX4eFaUi65EpPt7U
         JY8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdPgj1ssaPbU9gzzCVVzbTLxayCz0wiQ7Fma2sLJ0Ll1tiRE+Vt1cCM1tJfggh4cqR3ZizoYJO9rx1F/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdgMWxMAnlNNpXFrV8M8d5k/MayfwusXq/wrdWP5C32YDRn8md
	L7fywgzQuYDkgcxTH5oASkKLeq1JSq9ctFpnRlASiTXf8OVg0BDQUyIFzfKMHK7HCyx8DH5CoXF
	sokWgdMJOEsxKa4dROBq30NM/fOtabVoa1L87d4POjSJezDt8LG2yfjxYShWaCCp5egMV3Ve0aJ
	Tt
X-Gm-Gg: ASbGncvauG021AZb99RNqbgDki5N8QwcxDsJxU0rj50HtYnCsijooW82Ah1dCQe3E6T
	w5RFvvf1RU7jb6c6mS4IjbUn0x3Ro40UJvSWr2yQi8lnELUBA+Bh0/KGc+qw6kbTBr9mvIF+CFC
	wRadS5EXE8bsfB9/lGrF2QZUe+E+GUo0ow3TfYtusLd4iCMXFoK9x4Z9sMf4H32wCIu01nHxy3s
	SjEqTqK2Fe+WR80h5coQEPr13XM7+26tGDOjZzFeAm8N43P7LaRwxpMOwJLauDXQ/NbEW8+wnuU
	G5/ant/9B+B2koSfImAfoD9sdUwXd757wL8=
X-Received: by 2002:a05:622a:424f:b0:476:a6bc:a94d with SMTP id d75a77b69052e-49f4674dcd6mr282151341cf.19.1748372868742;
        Tue, 27 May 2025 12:07:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpXkO+vqVtcmxMyP/jKg8oA/IFxkebuAeQdewH08/R8xFYavbI5QSU4V3+60jqg1v6fEpsPA==
X-Received: by 2002:a05:620a:44c6:b0:7cc:fef2:51b9 with SMTP id af79cd13be357-7ceecc4597fmr2165248085a.52.1748372856895;
        Tue, 27 May 2025 12:07:36 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468ca5c4sm1761633085a.90.2025.05.27.12.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 12:07:36 -0700 (PDT)
Date: Tue, 27 May 2025 15:07:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: preserve original rate when a sibling clk
 changes it's rate
Message-ID: <aDYNdvQTBSDdyE0H@x1>
References: <20250520192846.9614-1-bmasney@redhat.com>
 <20250520192846.9614-2-bmasney@redhat.com>
 <20250527-incredible-shaggy-stoat-8a5ba8@houat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-incredible-shaggy-stoat-8a5ba8@houat>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Maxime,

Thanks for the review!

On Tue, May 27, 2025 at 02:36:49PM +0200, Maxime Ripard wrote:
> On Tue, May 20, 2025 at 03:28:45PM -0400, Brian Masney wrote:
> > @@ -2264,7 +2266,14 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
> >  		new_parent->new_child = core;
> >  
> >  	hlist_for_each_entry(child, &core->children, child_node) {
> > -		child->new_rate = clk_recalc(child, new_rate);
> > +		/*
> > +		 * When a parent changes it's rate, only ensure that the section
> > +		 * of the clk tree where the rate change request propagated up
> > +		 * is changed. All other sibling nodes should try to keep a rate
> > +		 * close to where they were originally at.
> > +		 */
> > +		tmp_rate = child->rate_directly_changed ? new_rate : child->rate;
> 
> There's something I don't quite understand here, sorry.
> 
> new_rate here is the parent rate, but child->rate is the current (as in,
> currently programmed in hardware) rate.

There is actually a bug in the section of code I posted.

Let me step back and describe the problem further in the clk core
since the bug is in this section of the code quoted above. Here's a
call tree and a description at each function call about what happens
today prior to my patches with my div_div_3 test, and how a clk can
unknowingly change the rate of it's sibling:

clk_core_set_rate_nolock(child2, 48_MHZ)
-> clk_calc_new_rates(child2, 48_MHZ)
  # clk has CLK_SET_RATE_PARENT set, so clk_calc_new_rates() is invoked
  # via the following block:
  # if ((core->flags & CLK_SET_RATE_PARENT) && parent &&
  #     best_parent_rate != parent->rate)
  #      top = clk_calc_new_rates(parent, best_parent_rate);
  -> clk_calc_new_rates(parent, 48_MHZ)
    -> clk_calc_subtree(parent, 48_MHZ, ...)
      -> clk_recalc(child1, 48_MHZ)
         # BOOM! This is where the bug occurs. This invokes the
         # recalc_rate() op on the clk driver with the new parent rate,
         # and the original divider of 0 is kept intact. The old parent
         # rate is not passed in to the recalc_rate() op, and personally
         # I don't think it should pass in the old rate.

Here's another version of my patch that's a bit simpler and fixes the
issue:

        hlist_for_each_entry(child, &core->children, child_node) {
-               child->new_rate = clk_recalc(child, new_rate);
+               if (child->rate_directly_changed)
+                       child->new_rate = clk_recalc(child, new_rate);
+               else
+                       child->new_rate = child->rate;
+
                clk_calc_subtree(child, child->new_rate, NULL, 0);

So for the case of !child->rate_directly_changed, clk_calc_subtree() is
only called so that the grandchildren and further down towards the leaf
nodes will have the new_rate member populated.

Once the new_rate fields are populated with the correct values, eventually
clk_change_rate() is called on the parent, and the parent will invoke
clk_change_rate() for all of the children with the expected rates stored
in the new_rate fields. This will invoke the set_rate() clk op on each of
the children, and this is where the divider on my test cases are updated.

So let's take your scenario:

> parent->rate = 24MHz
> child1->rate = 24MHz? (it's implicit, we should probably improve that by setting it and using an assertion)
> child2->rate = 24MHz? (Ditto)
> 
> then with the call to clk_set_rate,
> 
> parent->new_rate = 48MHz
> child1->new_rate = 48MHz
> child2->new_rate = 48MHz? (probably, since we keep the same divider)

Here's a new test case that shows that the rates and dividers are
updated as expected for that scenario:

static void clk_test_rate_change_sibling_div_div_4(struct kunit *test)
{
        struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
        int ret;

        ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_24_MHZ);
        KUNIT_ASSERT_EQ(test, ret, 0);

        ret = clk_set_rate(ctx->child2_clk, DUMMY_CLOCK_RATE_24_MHZ);
        KUNIT_ASSERT_EQ(test, ret, 0);

        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_24_MHZ);
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_24_MHZ);
        KUNIT_EXPECT_EQ(test, ctx->child1.div, 0);
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
        KUNIT_EXPECT_EQ(test, ctx->child2.div, 0);

        ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_48_MHZ);
        KUNIT_ASSERT_EQ(test, ret, 0);

        /*
         * Verify that child2 keeps it's rate at 24 MHz, however the divider is
         * automatically updated from 0 to 1. The parent rate was changed from 
         * 24 MHz to 48 MHz.
         */
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_48_MHZ);
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_48_MHZ);
        KUNIT_EXPECT_EQ(test, ctx->child1.div, 0);
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
        KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
}

Brian

