Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD159250C16
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286378; cv=none; b=qt3gl0M5IgnkwvfdjYc/UtYLQigbwA5fdljHmohQW4EeY0WXkZFNbz1h4znAyE28hmJnMZn/d6NoeC2jJKV+8VgS1q2m6Lx/a14NGEDepGxMSj5Mr/hmQO1FyYU3njw0SnK26zUmvnVd6kqhuMcAZW2u+GwUZaf2ZHY9gu6i77I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286378; c=relaxed/simple;
	bh=eQUBMAs0EV6tlo6I+OyUdUQv/tsj6z3YQwVOgFcZyGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgjYlbM8WJisSAyn+IiZ6mYx6iHgXM0SGVPsAYMV/r3Sc7tkaihgDRPiyx5Jk2ofJd3MgTh/fvccIL9AglaG3ayUogq05/prp4vQB0eDQbDH2wcGLLHPMNVhpnjKpq3t3KwDyi3T7OXK1YbDbZUxO9XnEjksN9ynlD6Z74InDK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8lTvnpr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8lTvnpr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40449C4CEDD;
	Tue, 11 Feb 2025 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739286378;
	bh=eQUBMAs0EV6tlo6I+OyUdUQv/tsj6z3YQwVOgFcZyGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B8lTvnprJygSeeHpSnEmNI8TnDchVje/h6GK+3kZZYiP/E+R0l9Sopp6QH5t1jXTa
	 zLJirTetGiSftwsKigsvZAg6lk+EkTKFvmr6NQR6yQSKLP27G8Ro/xXGgJ7u85Q16U
	 p9jCAJdSdXak5L8jJxo7GnaqNgcO2musmJiPbgPc+yJI1hfsDhTFh893HA/X7iCrri
	 U4fxMOBfRTkvYDwWSp5Gx7hlOpQOHn/TuT1DwcGASSCctbzLCc4wgykIDNOYduq5RE
	 aCAftCRnQ6/O4Wyb+fPlBkV41RH/u8CysFKe5CmQxfwzxsgeJWZyCNfTUH01sxCXjP
	 gbfJ5aom1rfpA==
Date: Tue, 11 Feb 2025 15:06:14 +0000
From: Lee Jones <lee@kernel.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: lkundrak@v3.sk, linux-kernel@vger.kernel.org, zijie98@gmail.com
Subject: Re: [PATCH] mfd: ene-kb3930: Fix potential NULL pointer dereference
Message-ID: <20250211150614.GX1868108@google.com>
References: <20250120190720.322926-1-chenyuan0y@gmail.com>
 <20250210173358.GI1868108@google.com>
 <CALGdzuqnAtyWSfgqpFbw-fVGvYnYHRGbSH2v8BUSJnpYPXR5Sw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALGdzuqnAtyWSfgqpFbw-fVGvYnYHRGbSH2v8BUSJnpYPXR5Sw@mail.gmail.com>

On Mon, 10 Feb 2025, Chenyuan Yang wrote:

> On Mon, Feb 10, 2025 at 11:34 AM Lee Jones <lee@kernel.org> wrote:
> >
> > On Mon, 20 Jan 2025, Chenyuan Yang wrote:
> >
> > > The off_gpios could be NULL. Add missing check in the kb3930_probe().
> > > This is similar to the issue fixed in commit
> > > https://patchwork.kernel.org/project/linux-fbdev/patch/20240114143921.550736-1-andriy.shevchenko@linux.intel.com/> >
> > > Fixes: ede6b2d1dfc0 ("mfd: ene-kb3930: Add driver for ENE KB3930 Embedded Controller")
> > > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > > ---
> > >  drivers/mfd/ene-kb3930.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/mfd/ene-kb3930.c b/drivers/mfd/ene-kb3930.c
> > > index fa0ad2f14a39..60824d847bf0 100644
> > > --- a/drivers/mfd/ene-kb3930.c
> > > +++ b/drivers/mfd/ene-kb3930.c
> > > @@ -162,6 +162,8 @@ static int kb3930_probe(struct i2c_client *client)
> > >                       devm_gpiod_get_array_optional(dev, "off", GPIOD_IN);
> > >               if (IS_ERR(ddata->off_gpios))
> > >                       return PTR_ERR(ddata->off_gpios);
> > > +             if (!ddata->off_gpios)
> > > +                     return -ENOMEM;
> >
> > I don't see many other call sites checking for NULL - why is this
> > different?
> 
> It looks like other places using devm_gpiod_get_array_optional do
> check for a NULL return value, such as in
> drivers/iio/resolver/ad2s1210.c, drivers/mtd/maps/physmap-core.c, and
> this patch commit:
> https://patchwork.kernel.org/project/linux-fbdev/patch/20240114143921.550736-1-andriy.shevchenko@linux.intel.com/.
> 
> > What about IS_ERR_OR_NULL() instead?
> 
> Yes, that sounds good. However, I have a question—what error number
> should be returned in this case?

I just took a closer look and don't thing returning on NULL is correct.

The call is *_optional() meaning that NULL is an acceptable value.

I believe that this is the correct solution:

diff --git a/drivers/mfd/ene-kb3930.c b/drivers/mfd/ene-kb3930.c
index fa0ad2f14a39..9460a67acb0b 100644
--- a/drivers/mfd/ene-kb3930.c
+++ b/drivers/mfd/ene-kb3930.c
@@ -162,7 +162,7 @@ static int kb3930_probe(struct i2c_client *client)
                        devm_gpiod_get_array_optional(dev, "off", GPIOD_IN);
                if (IS_ERR(ddata->off_gpios))
                        return PTR_ERR(ddata->off_gpios);
-               if (ddata->off_gpios->ndescs < 2) {
+               if (ddata->off_gpios && ddata->off_gpios->ndescs < 2) {
                        dev_err(dev, "invalid off-gpios property\n");
                        return -EINVAL;
                }

-- 
Lee Jones [李琼斯]
