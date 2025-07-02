Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38701F76A5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751494374; cv=none; b=PSHeLcoji8TiZbDafWzggeDWOEz99ly5Qdvzm44rfV2l4/Szcn4omqa+KMbceqoF0SaIhu0bzhEgghaUhqeGeEf2qf2L1vgo/jqm1VFoqroc9F/NDGbfyaRm0vec52HdzEeFrNecBK/6ecvX/ovK8l4B1XZBsMGOTBRm5uh/MdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751494374; c=relaxed/simple;
	bh=ejp0caJQ3WEaYSVo1TClujp7w12QndGpyPscnLV0j+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBaXc9RueRfY2a8AxLPPxo07aUWsTkKsD7FWGmlS5MPRPSji3UVLWBY/Jxv2VnY696kCCLaquMVv5gTM3nh+54vPXStdmDhC2iM3q0VNO1i9GoJ3Edd0/tYStDWmDfBY2/h/VZL3ep9ti2fKGoxE+jdRg+1DwvZVWnaisC8mD6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GALU4Y6O; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GALU4Y6O"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23636167afeso47632815ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 15:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751494372; x=1752099172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2gvG0skatZuESQkTeB9J6O3N9cUawjArh/0jsC9sDSo=;
        b=GALU4Y6OdKChz83fB48Lqda9pIl9EXppeXph+VjOVjonw+73O1yDQP1esC3WOUP3OZ
         6CKmJ+RJhhZzHba8QzvmLuLo1MUONRj+oNqpxFVhdcdnytnO5s0lK2Skj0HalNlyZ8b1
         5hj6auFc7YJVIGST9Mib4fiQF4ndhDkMZOl/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751494372; x=1752099172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gvG0skatZuESQkTeB9J6O3N9cUawjArh/0jsC9sDSo=;
        b=wqQJKKDz9Cr9nwi10wIpNFQDsI0nAe3X5gc0f4mpyD96ioQZu9VWuxWe81vzn8cxCl
         4Y6Fro9M1ozH6p1AziYQAW5c4B0ISEIjjLSatSDWhbDskYG+vmmlYE49iJRM796wgjyQ
         IFB7ZMGXov/iS39D6GfhKLcxuJD7jlaSwt6mm+6BqBbx9X4YoxC1VJ5pLeaqQ4w8JD4y
         jl2rhqifzvLgJI02fyN4g1fOdCGMuvxoaHWvY40Kb1ZvG52MlCfPaLvN9VkatRib11DB
         U2nchVvhgxIqdAWXJyeDV1mx03T9gCcNS61+Bb9EL5A3se250Pdkw4mSupgRmTTKiIFE
         0UrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVl3V9pXUrFi47zArR7nGmdMi9WuKddFAS5UHB7+SkAS1qZHUp8ua3u+jJJnKXBHYYZof6ZQBlCx6msCk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5BYfy7WPpv/+fLikqa3UPjezId1NAy9mT1zou52KGMX73Thuv
	Kr0NwUxMqgI6C4IcV7jekt/mEHJxvGGTCCZXte4t6PxRX2yBOXIfdP1e72HkwlDpAw==
X-Gm-Gg: ASbGnctADPYWfR2Boiq7tvWWIGT7ZpKich6clFilvlyvJxaxOVdxLf7wL+XTzBrC9wg
	F+t1EHoP6ta/fWxZtkLcYiw7O0mHkux6FZMFaZtR/F3xAq/RpYDyR1dOCrV26J8kmY2HVUf23nA
	XtaH9VmdFdERB1K4PvITf5xqz/L0cs9LfyPCRH/dKDmfNHhhFU6ZHafLrZAlrg3FaQbOJ/Q9q4t
	Z2uBFb0V/bic34vKIg+kjH7GgHdwfhDBS9Jr2q93RZZaxCnmGfNqFcrY0rgiDFJUFoeYWnQWZ+p
	Vy35uJjF4apcW0ZV8ZTRZ/tH1wwCDR28IDt2ic+kmhgOBcpTXTNwc8Vdy0zT3bC2KoKyDz7p4r7
	c8QR0X/5mDvNauHI+bFlO3z4=
X-Google-Smtp-Source: AGHT+IHwhrTLWcsMv4R2PjgjUIQlL7TEI+Nb/xext8Zi4DZ8YWBM5PbcaEAWEBaUYvoNOzwk5t0HUw==
X-Received: by 2002:a17:903:1a70:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-23c6e5b0fd8mr54638465ad.37.1751494371962;
        Wed, 02 Jul 2025 15:12:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:a88f:fae1:55b0:d25])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb3ba530sm136022425ad.200.2025.07.02.15.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 15:12:51 -0700 (PDT)
Date: Wed, 2 Jul 2025 15:12:49 -0700
From: Brian Norris <briannorris@chromium.org>
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH v3] checkpatch: Check for missing sentinels in ID arrays
Message-ID: <aGWu4Sx6vRA4SIbB@google.com>
References: <20250701183537.501225-1-briannorris@chromium.org>
 <f543013af300995880a3370bbbeef15a5669345d.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f543013af300995880a3370bbbeef15a5669345d.camel@perches.com>

Hi Joe,

On Wed, Jul 02, 2025 at 02:19:45AM -0700, Joe Perches wrote:
> On Tue, 2025-07-01 at 11:34 -0700, Brian Norris wrote:
> > All of the ID tables based on <linux/mod_devicetable.h> (of_device_id,
> > pci_device_id, ...) require their arrays to end in an empty sentinel
> > value. That's usually spelled with an empty initializer entry (e.g.,
> > "{}"), but also sometimes with explicit 0 entries, field initializers
> > (e.g., '.id = ""'), or even a macro entry (like PCMCIA_DEVICE_NULL).
> > 
> > Without a sentinel, device-matching code may read out of bounds.
> > 
> > I've found a number of such bugs in driver reviews, and we even
> > occasionally commit one to the tree. See commit 5751eee5c620 ("i2c:
> > nomadik: Add missing sentinel to match table") for example.
> > 
> > Teach checkpatch to find these ID tables, and complain if it looks like
> > there wasn't a sentinel value.
> []
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -685,6 +685,64 @@ our $tracing_logging_tags = qr{(?xi:
> >  	[\.\!:\s]*
> >  )};
> >  
> > +# Device ID types from include/linux/mod_devicetable.h.
> > +our $dev_id_types = qr{(?x:
> 
> [ a long list ...]
> 
> > +)_device_id};
> 
> This list seems unmaintainable.

That seems debatable to me, as we've only had ~20 additions in the last
decade:

$ git log --oneline --since='10 years' -S '_device_id' ./include/linux/mod_devicetable.h | wc -l
20

It's pretty easy to script too. But anyway, I'm not the maintainer, so
I can try your suggestions.

> Does something like '\b[a-z]\w*_device_id\b'
> match too many other non-sentinal uses?
> 
> $ git grep -P -o -h '\b\w+_device_id\b' -- '*.[ch]' | sort | uniq | wc -l
> 288

Just inspecting the tree for struct types that match *_device_id, I see
that there are 21 of them that are not in mod_devicetable.h, and:

* the large majority of them are of the same sentinel style, and
  probably should be in mod_devicetable.h anyway
* of the relatively few that are not quite the same style, there's:
  - struct gio_device_id, which oddly uses '0xff' as a sentinel
  - struct ddb_device_id, which is confined to 1 file, and uses
    ARRAY_SIZE(). This triggers a false positive.
  - a few types like struct pcan_ufd_device_id that might technically
    match, but don't have the same sorts of tables and so are benign
* running checkpatch over the source tree only shows ~1 additional
  false positive; the aforementioned struct ddb_device_id

So on the whole, it's probably not too much of a win to enumerate a list
of types, and I'll just go with your regex instead.

> > @@ -7678,6 +7736,30 @@ sub process {
> []
> > +# Check that *_device_id tables have sentinel entries.
> > +		if (defined $stat && $line =~ /struct $dev_id_types .*\[\] = \{/) {
> 
> Spacing isn't guaranteed so perhaps
> 
> $line =~ /struct\s+$dev_id_types\s+\w+\s*\[\s*\]\s*=\s*\{/

Sure.

Brian

