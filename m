Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D154425484A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748341472; cv=none; b=fkyI5PxPCia1EefD6h5qZQwt9eCN9nDQZOwtVWzJPWAfRyOcOnhqm/USa7TZUm0bqmLGDTxftKIS6mUwWvgyQoKc/S8uD/+7HztEIb6aK8NNKAYAeWVoIDBita0K4rm6Fiu0mpAC0O0aGphIdQBr7Z0AROLH/mB4grmGzgkZBSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748341472; c=relaxed/simple;
	bh=27OSCqxRS2C9sInzte7GiYuMMWrrPgXfGfxxUJWieAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWquVa+z7LOwhg4CIf7OnGulC+Kq5DQGjCz0rl+LxirOwMimm/PFhfsfGST9zy4iw3U9CAcqGXOLkqyX/OFIwsksud3GVuAXJsgSH0/bBQMdgR8lLottyY7/a4tKT6/2RTpoEqmLThiVYm7MJzNpQQ5EJavSPywuUYinsX8t8ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Xy0BzDId; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xy0BzDId"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12CDC4CEEA;
	Tue, 27 May 2025 10:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748341471;
	bh=27OSCqxRS2C9sInzte7GiYuMMWrrPgXfGfxxUJWieAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xy0BzDIdHO4xJZMnaDjHy90tr2PPuF/oSW1XiI+T5apGZjEw9+C6qGrHAMPdU0p5b
	 6c4QHhkOD8BBypNrZQcKmH25hGEIZPBpot7hcx+454zr+VXQN5ht1C/RkjG0ovgwey
	 468ZPNgxY0fY3e6bA+0MF2OPzkDMV0et3nle8+Do=
Date: Tue, 27 May 2025 12:24:28 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: "Farber, Eliav" <farbere@amazon.com>,
	"Chocron, Jonathan" <jonnyc@amazon.com>,
	"mschmidt@redhat.com" <mschmidt@redhat.com>,
	"calvin@wbinvd.org" <calvin@wbinvd.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pps: clients: gpio: fix interrupt handling order in
 remove path
Message-ID: <2025052712-friction-sinner-42ec@gregkh>
References: <d6358648c5b9420d8202bb9c23ac1824@amazon.com>
 <20ba69f0-7ed9-48e7-8239-74a55c993c0b@enneenne.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20ba69f0-7ed9-48e7-8239-74a55c993c0b@enneenne.com>

On Tue, May 27, 2025 at 12:19:16PM +0200, Rodolfo Giometti wrote:
> On 27/05/25 11:11, Farber, Eliav wrote:
> > > > @@ -228,6 +228,7 @@ static void pps_gpio_remove(struct platform_device *pdev)
> > > >    {
> > > >        struct pps_gpio_device_data *data = platform_get_drvdata(pdev);
> > > > 
> > > > +     free_irq(data->irq, data);
> > > 
> > > Why not just use devm_free_irq()?
> > 
> > As far as I understand, the main purpose of devm_*() is to provide
> > hands-off resource management. devm_request_irq() is intended to
> > eliminate the need for explicit cleanup in the remove() function by
> > automatically freeing the IRQ after remove() returns.
> 
> In linux/kernel/irq/devres.c we can read:
> 
> /**
>  *      devm_free_irq - free an interrupt
>  *      @dev: device to free interrupt for
>  *      @irq: Interrupt line to free
>  *      @dev_id: Device identity to free
>  *
>  *      Except for the extra @dev argument, this function takes the
>  *      same arguments and performs the same function as free_irq().
>  *      This function instead of free_irq() should be used to manually
>  *      free IRQs allocated with devm_request_irq().
>  */
> 
> > In my opinion, calling devm_free_irq() undermines the benefit of using
> > devm_request_irq() in the first place. If I need to explicitly free the
> > IRQ during remove(), then I’m no longer relying on devm’s automatic
> > cleanup - I’m effectively reverting to manual resource management while
> > still using devm-style registration, which I find unnecessary.
> > 
> > That said, if you still favor devm_free_irq(), I’ll revise the patch
> > accordingly.
> 
> Since devm_free_irq() works exactly as free_irq() and can be used to
> manually free IRQs allocated with devm_request_irq(), I think it is less
> invasive. Isn't it? :-)

Not always, no.  irq handling is tricky, and devm for irqs is a huge
source of bugs as how do you really know when your irq is going to be
removed from the system?   If you don't want to use devm calls, don't,
there's no requirement to do so.

thanks,

greg k-h
