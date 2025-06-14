Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871DE2C3263
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749905987; cv=none; b=oCEiYfKzGLanOD/UdtRRzuC0+/jdFMLaH+98qBJHtLgs1sXF5JJnCSiYAFsEHgqPB/S8ZOMQL7aJof6JZEUbpc1o+VNzX0kgKoQn3rH5UMooOHLS/uVYzf4BfK14Z7Xg8jfpUgp6kHrg7qCrP0x/ZQrKo6KX02W9q2x+vCKI6Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749905987; c=relaxed/simple;
	bh=Fa1v34NYwVPURsnllxM03C1WeGFbGnvhY/Z8Ver7IqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3udiZaY06J/1olGKkVl1JnGpL/Yk7W1bcRb5Abkgf6ZxhxBRl0rdDjTx1xKOowoL25Yjw9B6NtpXolIbJVLSkeEjGh4bZvwg9uY5IgzPwF70vBLV0epjHmos7McMGnk1ZIMfTSriFoUKuFwzsFCMPhwiQ5yhMzL2qg1kd/4+Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=eOvIDpv9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="eOvIDpv9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4532ff4331cso8092815e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1749905984; x=1750510784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iPGeQJRJ+PPx0D4Yz/DGi/Ua0wsy2Tt7cdffwC5HRfY=;
        b=eOvIDpv9Wq13jnyBO5/9sXNcGP6w9uJ9af6I4VfwGrKn/CZRF9oi3zRSmqXlrfIZNx
         /GJibzcbK6PhUGCRIBo/91wVTPz34sEUxgS1s7zYaW3rl2SJLFgrVe0aDqKx+4+iPzRh
         FxCjqCWP8b9BZSdErgfESyvVfo4531YmNYPMEFQOQcK9FUKhnofZ0yR7+BqVBlFZk1ER
         qMReGgBlHUC39l/k3+1kpn/yCB7mYHDqDcjtkOd6fFlW2ehux/hrmDp9XXMC+z0tSIbT
         X3gCey0zfkBNXWWrEVoEu1xnZgSwqgLDxdM+3Arn01tAuttBEHaL0Mtn0FyENjc2I6Dy
         eCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749905984; x=1750510784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPGeQJRJ+PPx0D4Yz/DGi/Ua0wsy2Tt7cdffwC5HRfY=;
        b=U33veVMv9rLzij6hkbRVodpLOlw3uBaanlEgwateDbUxJ1Jzj0hNpNj5JyRlTQfQMG
         hPgHKSFtC7BxRScSs31KtGyDq7LaVfzti1I5H5+mtVw6kx7vrP4eOlH4kUJKFqsydtIK
         HpK80gNtH2tBDvekn1EHck3DaxM+UojuaA9+x7jjRgfjVAZAzmDJXDdE2zuqni24fIFN
         Nr3SuXhj4YCQPaaT6Wy2u82JEX5S+HBN6VgvUzhSGCofs6qDc3ZlVO8QvAPH3/NnOUSj
         wXhOahx92cEBIqf6Z6uAG+iUd54aG3NMSQD/gTz7F8RLO1u4Y3aCa4oASBH5lavMJCCW
         O7Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWzCjcYr5qLiirvkSwlnDDoY15IXCwisbaj+ziBHUw/cm94IVhlGb2ZnFwK2UCLmu38u7VnRRbwdrsRi2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhxPdZPIRXTobRGksfrYRudubG1m58mcMiqlrwAUKgiusnLWaP
	F5p6Sji5cZjHTn2wYQIvlk1EDggoQcmm0QvwtCL4fC2Ie8rdAH8/xUx8g9OSQMmZ9w==
X-Gm-Gg: ASbGncvfpTo7tYdxYLFhekj1albd2+8X3o8sC1KSs04j9qrjhDHw45A0DXbMkyZ1i5H
	96HQpMdN8tsdRqjRI6MJukCyndtRFY896D3KfwiTQS1FWxTYDWGdxRuunB1o4ndME4D4vZ5Pf/h
	pbjVim8in2zIxYwQFGBvBPssxG7A3YJ0FWgl4h6Hz4H0jxxjJGSD2x70qkauFbTYTvoFl2JoZnt
	FI9xkNHq+Pmp6Kqi/j80MSEAgk0OFLPzFeQe3MSHCwgRy4bs4hiv+imXYzjAFMbkRZwJkNYPgha
	NfyvhuCM6jQ5vGLHOKjU065oH+TVcDUtXZBj9e3TdIhQDbALidU8kXsX
X-Google-Smtp-Source: AGHT+IERuJs7MZQq1yqXmSu8CjkmDe4S5bwq1oMBXLwNuLiCByoIGRKoAxD/eCMk/Zei3ARi2ebwpw==
X-Received: by 2002:a05:600c:4e16:b0:450:d00d:588b with SMTP id 5b1f17b1804b1-4533ca8b428mr27724305e9.9.1749905983726;
        Sat, 14 Jun 2025 05:59:43 -0700 (PDT)
Received: from cyber-t14sg4 ([2a02:908:1578:7a43::64fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2522b1sm80971175e9.25.2025.06.14.05.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 05:59:43 -0700 (PDT)
Date: Sat, 14 Jun 2025 14:59:33 +0200
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aE1yNZ484DcWjR4h@cyber-t14sg4>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <6cfb5bae79c153c54da298c396adb8a28b5e785a.1749734094.git.michal.gorlas@9elements.com>
 <aEtW3e7mwjTTvfO9@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEtW3e7mwjTTvfO9@google.com>

On Thu, Jun 12, 2025 at 03:38:21PM -0700, Brian Norris wrote:
> > +static int register_entry_point(struct mm_info *data, uint32_t entry_point)
> > +{
> > +	u64 cmd;
> > +	u8 status;
> > +
> > +	cmd = data->register_mm_entry_command |
> > +	      (PAYLOAD_MM_REGISTER_ENTRY << 8);
> > +	status = trigger_smi(cmd, entry_point, 5);
> > +	pr_info(DRIVER_NAME ": %s: SMI returned %x\n", __func__, status);
> 
> Don't print this kind of debug stuff at INFO level. If you need it, use
> KERN_DEBUG.
> 
> Once this gets attached to a proper device/driver, you probably want
> dev_dbg(), if anything.
> 
...
> 
> 
> > +	/* At this point relocations are done and we can do some cool
> 
> 	/*
> 	 * Multiline comment style is like this.
> 	 * i.e., start with "/*" on its own line.
> 	 * You got this right most of the time.
> 	 */
> 

Got it.

> > +	 * pointer arithmetics to help coreboot determine correct entry
> > +	 * point based on offsets.
> > +	 */
> > +	entry32_offset = mm_header->mm_entry_32 - (unsigned long)shared_buffer;
> > +	entry64_offset = mm_header->mm_entry_64 - (unsigned long)shared_buffer;
> > +
> > +	mm_header->mm_entry_32 = entry32_offset;
> > +	mm_header->mm_entry_64 = entry64_offset;
> > +
> > +	return (unsigned long)shared_buffer;
> > +}
> > +
> > +static int __init mm_loader_init(void)
> > +{
> > +	u32 entry_point;
> > +
> > +	if (!mm_info)
> > +		return -ENOMEM;
> 
> Hmm, so you have two modules, mm_info and mm_loader. mm_loader depends
> on mm_info, but doesn't actually express that dependency. Can you just
> merge mm_loader into mm_info or vice versa? Or at least, pass the
> necessary data directly between the two, not as some implicit ordering
> like this.
> 

Yep, will do that. As long as there is only one cbtable entry (and I
think this will stay like this), mm_info can be part of mm_loader.

> > +
> > +	entry_point = place_handler();
> > +
> > +	if (register_entry_point(mm_info, entry_point)) {
> > +		pr_warn(DRIVER_NAME ": registering entry point for MM payload failed.\n");
> > +		kfree(mm_info);
> > +		mm_info = NULL;
> > +		free_pages((unsigned long)shared_buffer, get_order(blob_size));
> > +		return -1;
> > +	}
> > +
> > +	mdelay(100);
> 
> Why the delay? At least use a comment to tell us. And if it's really
> needed, use msleep(), not mdelay(). scripts/checkpatch.pl should have
> warned you. And, please use scripts/checkpatch.pl if you aren't already
> ;)
> 

Long story short, SMIs on real hardware like to take longer from time to
time, and the delay was a "safeguard". It is probably not the proper way
to handle it, but locking here was not helpful at all, lock was released
regardless of CPU being still in SMM context (I assume due to SMIs being
invisible to whatever runs in ring-0). Have to admit though, that 100ms
is a consequence of trial and error. I would actually use some on advice
how to handle this properly. scripts/checkpatch.pl was not complaining
about it. It only gave me:

WARNING: quoted string split across lines
#57: FILE: drivers/firmware/google/mm_loader.c:57:
+		     ".return_not_changed:"
+		     "movq	%%rcx, %[status]\n\t"

total: 0 errors, 1 warnings, 0 checks, 186 lines checked

> > +
> > +	kfree(mm_info);
> > +	mm_info = NULL;
> 
> This is odd and racy, having one module free data provided by another,
> where that other module might also free it. Hopefully this gets
> simplified if you manage to combine the modules, like I suggest.
> 

Yep, got it.

Best,
Michal
