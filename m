Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597BD2750FB
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718330; cv=none; b=AHXrXNmasnMtY+8/ubZuG6aUSelNq1vnaChKJ3okl9MVWBwQoUStt6xhIcyTZlhp17CEAwP2v1P/KGSbb/AKPF0txfU4nSexauvn2fm0WuYWotCihUAwaVzsGzm5dNxioZhSe/QH7nVsTEVw2UOzWvZv+uIvVMOeqjxDllN3maA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718330; c=relaxed/simple;
	bh=xNhonwAocJs9C1f9NRY6o7AYqvVvovxsjltl2JTndZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXTDvk/z5AAWe7hzFY7zKRLmoE8pRaOTnXty82Yid1yc/8/HpdPvSOuqRuGcDkWq79ixnIPa706fzB5wPFL4dubU+9sAFOSyfcBJ2r/NUGHHvd6ZmZmjSz+8fNBt7qUAJJ4mVcYSWCEClGj832GZCuKQtplWlo/wJNJyctps16g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDSRaxFC; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDSRaxFC"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3106217268dso9864561fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746718326; x=1747323126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bQZHXb1pTNUO6rytxFVfXNa5F5gCKvG2R5WDZSgU62k=;
        b=hDSRaxFCkwAd4qVzB9z/BaVf9hQfUDui3D5uqRYmXCQmVV6OBsGl7nYwuqMjsC9fBS
         PiR5JfLX3nY8LmzdO/2nbg+OVqJPMBiP/Fd5Ru9yxQur57U2LFDxObm3459S0cUdiSx9
         3AF7e7gzauFnRKj/4C16u4DbrInoRLLnG8wYQ5P1Sa5E+D5lvr7UNjxe1psDzitgtXbi
         OyETrGLeaRGAVNGtEM61myrUMCYEhXlMa2Xx5sOoAn86fICpkR5UPnyfnvSi3hEjJZwn
         Av96sFCW8Xu2mNpBhp4u3Wt3ZIRpUttbdiQshdkXK5T5M/PAjH0qXVUjOyEyaMRIuvbX
         RghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746718326; x=1747323126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQZHXb1pTNUO6rytxFVfXNa5F5gCKvG2R5WDZSgU62k=;
        b=JMCI+4vfZfvSIVWjXVKAIzK146qUF47uy7SIdYkSgrcmQGOuLoEu99Fp5yqiomZsEb
         49MwxI2ZhVdH1ANFzFNth1lux+bhZcF5M9uApwkwCRVbMGpkjKwA7iFmOmrCQXPjAcMq
         nqBsf0kE+MUImKBpsQUV/uOicqWdmhzEMw9oSIj4qdKCdskMG0sfxDePXNuueGlOXk5p
         xVsZJ8yBhMyaMJWrjTzn+aHo74wQZ2Q4FFUwlHHvYBuBHtMtAn8uL31tQA5wZsg4ZClF
         ibFPGJXbyAPtXzYe0wimSkE6driqguSJZ6aeOseIKobyEgcoDHccfuInl7NpR+cw8tlt
         Oh8w==
X-Forwarded-Encrypted: i=1; AJvYcCURcahu+szIUG67UG6n09HvyiNsexTi0iDkMTY8acDIrrIIAluUSt28ijGbN8Q3KqhHRLODt52GY8T+SN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEpmRuA3PZvwD7ID1qhfkFgKwivgYK+nfa0KVJLzuzJU7mjr7r
	Jp/QrFDlDYINW7TOBZxW2sKY1t9+dKpM2ltgwLsj5bH0xnMMTjx0B5apLLQr
X-Gm-Gg: ASbGncvMhk8kltYp1hy4PD4aERlkaIlpsA84fyVJ98fb1Mtsdz3yEuhf+1yqZ+Q1pPC
	4rxxNra8lSeN80UnRQ/zZfUBfM8tWpOCfKmsOSSO8VBq6fjV/wSey0/PwSDMuFqRKnsQb3i7FPz
	XKJQkQ/Hdhge8CJeTdgYbSKOiS4In3bKWa4FzjcNtHpZkmasPDeS5JtNCu8nycYQx70KTqUPy8s
	TNnr8Wc5BFsBwKZV8oTX1/VfUU7VPETjR2BYlWNH7stlLzhzo6SSm+QioOlv846M9lqw7cCfjZA
	Ai5LLjtSnwlkPJIrZtIAD0wFKKrt/6ODel8vvkYmQwV2vUIxBpKS1+h50WfVKnRHdFh2qnOKDHm
	8JwlaltsTwqmOO/onFgosMlMtcEtmARDLEF6KAKcv5T0zDXE=
X-Google-Smtp-Source: AGHT+IGFstg7zkt30V5+VwImj1Q3JA1WiB631WYiOnm0dmuUBFgMYyKg2e/vV+yf+BdgZpbIPFqSDg==
X-Received: by 2002:a2e:be84:0:b0:30a:4428:dead with SMTP id 38308e7fff4ca-326b88d5d11mr13463441fa.27.1746718326032;
        Thu, 08 May 2025 08:32:06 -0700 (PDT)
Received: from Lappari.v6.elisa-laajakaista.fi (nzckegfeyybu021f2us-1.v6.elisa-laajakaista.fi. [2001:99a:20b9:a000:e167:89b0:e98:2534])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33b809fsm264731fa.44.2025.05.08.08.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 08:32:05 -0700 (PDT)
Date: Thu, 8 May 2025 18:32:04 +0300
From: Heikki Huttu <heissendo88@gmail.com>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: hsweeten@visionengravers.com, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] comedi: drivers: adl_pci9118.c: Edit file so that
 checkpatch.pl has 0 typo errors
Message-ID: <aBzOdFXd_TwYrhd1@Lappari.v6.elisa-laajakaista.fi>
References: <aBoz0MJWkKk7zSZg@Lappari.v6.elisa-laajakaista.fi>
 <d12145a2-6a84-48c7-8bb7-39ed25598432@mev.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d12145a2-6a84-48c7-8bb7-39ed25598432@mev.co.uk>

Wed, May 07, 2025 at 10:04:05AM +0100, Ian Abbott kirjoitti:
> On 06/05/2025 17:07, Heikki Huttu wrote:
> > Fix errors produced by checkpath.pl about typos.
> > 
> > Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
> > ---
> > 
> > V2: Removed all modifications done to parenthesis. Edit Patch name and
> > only typo fixes remain.
> > 
> >   drivers/comedi/drivers/adl_pci9118.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/comedi/drivers/adl_pci9118.c b/drivers/comedi/drivers/adl_pci9118.c
> > index a76e2666d583..67c663892e48 100644
> > --- a/drivers/comedi/drivers/adl_pci9118.c
> > +++ b/drivers/comedi/drivers/adl_pci9118.c
> > @@ -32,7 +32,7 @@
> >    * ranges).
> >    *
> >    * There are some hardware limitations:
> > - * a) You cann't use mixture of unipolar/bipoar ranges or differencial/single
> > + * a) You can't use mixture of unipolar/bipolar ranges or differential/single
> >    *  ended inputs.
> >    * b) DMA transfers must have the length aligned to two samples (32 bit),
> >    *  so there is some problems if cmd->chanlist_len is odd. This driver tries
> > @@ -227,7 +227,7 @@ struct pci9118_private {
> >   	struct pci9118_dmabuf dmabuf[2];
> >   	int softsshdelay;		/*
> >   					 * >0 use software S&H,
> > -					 * numer is requested delay in ns
> > +					 * number is requested delay in ns
> >   					 */
> >   	unsigned char softsshsample;	/*
> >   					 * polarity of S&H signal
> 
> The patch looks fine, thanks.
> 
> Reviewed-by: Ian Abbott <abbotti@mev.co.uk>
> 
> I don't have commit access to any pulled trees, so could you please resend
> with Greg Kroah-Hartman <gregkh@linuxfoundation.org> in the Cc list?  Feel
> free to add my Reviewed-by: line above when resending.  You can leave the
> patch at version v2 since the patch and description hasn't changed.
> 
> -- 
> -=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
> -=( registered in England & Wales.  Regd. number: 02862268.  )=-
> -=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
> -=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-

Thank you Ian! When you have the time, could you please take a look at
this patch Greg? Thank you!

Fix errors produced by checkpath.pl about typos.

Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
Reviewed-by: Ian Abbott <abbotti@mev.co.uk>
---

V2: Removed all modifications done to parenthesis. Edit Patch name and
only typo fixes remain.

  drivers/comedi/drivers/adl_pci9118.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/comedi/drivers/adl_pci9118.c b/drivers/comedi/drivers/adl_pci9118.c
index a76e2666d583..67c663892e48 100644
--- a/drivers/comedi/drivers/adl_pci9118.c
+++ b/drivers/comedi/drivers/adl_pci9118.c
@@ -32,7 +32,7 @@
   * ranges).
   *
   * There are some hardware limitations:
- * a) You cann't use mixture of unipolar/bipoar ranges or differencial/single
+ * a) You can't use mixture of unipolar/bipolar ranges or differential/single
   *  ended inputs.
   * b) DMA transfers must have the length aligned to two samples (32 bit),
   *  so there is some problems if cmd->chanlist_len is odd. This driver tries
@@ -227,7 +227,7 @@ struct pci9118_private {
  	struct pci9118_dmabuf dmabuf[2];
  	int softsshdelay;		/*
  					 * >0 use software S&H,
-					 * numer is requested delay in ns
+					 * number is requested delay in ns
  					 */
  	unsigned char softsshsample;	/*
  					 * polarity of S&H signal
