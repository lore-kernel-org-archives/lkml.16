Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118711FE474;
	Wed, 19 Feb 2025 16:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739982907; cv=none; b=TpbmIr0KINcU/lB6RGdZT2sIz5cjfRh8QeDHCxa5AtYRBUuXwhEXckH6txzrbVcQ/GsnhXlU0Vmi94ixR+tdxdCFM+r4+Tj0RSzN+bhTNb+WmBphNaQnatGqL+iAY9aUzfzwkeP1Mbs0NViMrcto4uqjWqMfrzGTGC7QJhQgZ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739982907; c=relaxed/simple;
	bh=QOnyyDbk3m368f2B7KjCgHPy6ztjATeAHN+IwKg8vvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0k2XbdEgRUbiq8Qx7/AeLxOQMSyhIcR3qLGJiohvAPb4r0W68ZiA2QF6kgU9HB6j0v4K1Laef+8a+LlJJHyUlpXCJXyGtj4hVa4Q6HR8WzkQH0pNg55/LvOD301EkIT+I/Nvj0RaH9TaxEfm4sdwfjUyZDvO3+hlRS46vt0dhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 51JGYpXl023163;
	Wed, 19 Feb 2025 17:34:51 +0100
Date: Wed, 19 Feb 2025 17:34:51 +0100
From: Willy Tarreau <w@1wt.eu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>, David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <20250219163450.GJ19203@1wt.eu>
References: <b7a3958e-7a0a-482e-823a-9d6efcb4b577@stanley.mountain>
 <2bcf7cb500403cb26ad04934e664f34b0beafd18.camel@HansenPartnership.com>
 <yq1mseim24a.fsf@ca-mkp.ca.oracle.com>
 <c1693d15d0a9c8b7d194535f88cbc5b07b5740e5.camel@HansenPartnership.com>
 <20250219153350.GG19203@1wt.eu>
 <e42e8e79a539849419e475ef8041e87b3bccbbfe.camel@HansenPartnership.com>
 <20250219155617.GH19203@1wt.eu>
 <20250219160723.GB11480@pendragon.ideasonboard.com>
 <20250219161543.GI19203@1wt.eu>
 <20250219163211.GC11480@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219163211.GC11480@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Feb 19, 2025 at 06:32:11PM +0200, Laurent Pinchart wrote:
> > However I remember having faced code in the past where
> > developers had abused this "unlock on return" concept resulting in locks
> > lazily being kept way too long after an operation. I don't think this
> > will happen in the kernel thanks to reviews, but typically all the stuff
> > that's done after a locked retrieval was done normally is down outside
> > of the lock, while here for the sake of not dealing with unlocks, quite
> > a few lines were still covered by the lock for no purpose. Anyway
> > there's no perfect solution.
> 
> There actually is in this case :-) You can reduce the scope with scoped
> guards:
> 
> static int gpio_mockup_get_multiple(struct gpio_chip *gc,
> 				    unsigned long *mask, unsigned long *bits)
> {
> 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
> 	unsigned int bit, val;
> 
> 	scoped_guard(mutex, &chip->lock) {
> 		for_each_set_bit(bit, mask, gc->ngpio) {
> 			val = __gpio_mockup_get(chip, bit);
> 			__assign_bit(bit, bits, val);
> 		}
> 	}
> 
> 	return 0;
> }
> 
> which is equivalent to
> 
> static int gpio_mockup_get_multiple(struct gpio_chip *gc,
> 				    unsigned long *mask, unsigned long *bits)
> {
> 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
> 	unsigned int bit, val;
> 
> 	{
> 		guard(mutex)(&chip->lock);
> 
> 		for_each_set_bit(bit, mask, gc->ngpio) {
> 			val = __gpio_mockup_get(chip, bit);
> 			__assign_bit(bit, bits, val);
> 		}
> 	}
> 
> 	return 0;
> }
> 
> In this particular example there's nothing being done after the scope,
> but you could have more code there.

I see, excellent point!

Thanks,
Willy
