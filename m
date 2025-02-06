Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE0B2248BE
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738830814; cv=none; b=JyOp6t3NQmakrRnOnxDH2C4k4nfR5UD8RA5K0/HvbkcwqQekiZYHWDALMEMVh/9C++i+pkgzlAqz0qDBluq0YE0tGV9uNk17DvG+MfMN6VDR3/QGhflyPtRD4FGqQwsc+1IikjDN2LifhVJhCtKa/+d80oZVaIUwJTbZsw+tGzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738830814; c=relaxed/simple;
	bh=9g9b7hVg1k4pXSTZtAUsL9yHZfplVe0rwP+E/mjt+6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GoXdlTO4KVzO4SdzyaU19LmXDzYad/Y4zH0VqDQ4IEBHQtg9HxEjP/t9cbkSV/wpxX500uopUL+0GW4NkPtxKbkhIsCL2b1hiofDNjLPlNNFGD8WJqd4swFqwFAHm1EKKDdB7r9VX6wdA/8Ai4MyPrjuNSJFTzsIYxNKD7sGkCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=vuKM3SuC; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="vuKM3SuC"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f0b5d6c6eso9558155ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 00:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738830812; x=1739435612; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zFa4VDutdaAqwxVE7IcEmL8yhkUm6WYSGjjVCCVP30o=;
        b=vuKM3SuCH75Yd3OYODa8Q9XgL5gE3G2nCFl4g3YGf39Yxvty/KeQx8hwhHThWoV0iW
         XLXAv14cd2Vga8hfDa0krw871yijOV6ziYxlOJJl7MI1D5XT30Uz6yRUVkCgXKkpmOa9
         gla1/fMNOyqD+R8JXmJouHWO1JmVbQl//Aa94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738830812; x=1739435612;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFa4VDutdaAqwxVE7IcEmL8yhkUm6WYSGjjVCCVP30o=;
        b=CUpn+FxHrXVREZM51O3sYF41mqXMmrwNyRw+WaJ/e7LOjKoIICfOzbVIxST51H2/YH
         d9nymrFKt1YUavyo0r87LxMSEZtJgbQFT47h8pJjxvcpoYxqdiDwJDy9DA5R5DNZw/TN
         yK/DWqt7X4J9Dgr/lLPiDE+1ZA3p8CftOvLeJ5nKbuMJFw947Abdyb3zKVFYcgazbWyQ
         E7Khw9mfLjnbPQ084+YmwQ7UAJiwFNvMam0FBAZ2aAT07Hrwf2bFxxyx+qWSYiYcxWiY
         SD/NymWSZRxbJyHUkyISWjvmoz5/qHvjfhUHcoIgQ5XKX0FzpvONE9DFkIvPeJYSFOfZ
         DhsA==
X-Gm-Message-State: AOJu0Ywe7U2pge5SLDmeaNwxywQ0a1jtGaMbmNS4lfa323EZOZJLqmJO
	+YLIrf+WRuKuD5ENmXHzG9AFxIIYrBKSCTzW/5qGBTgbrrmm9/AnLI1nlfW/WNQ=
X-Gm-Gg: ASbGncuLDRFWIYaMVBhI3WqFyoqbRudXYpE4kFERmJ/GuqM5BcvPk7toeqv6cAPxVnZ
	sUC20xA20C6Qc8PB5cTHPkSTQlxHvmNM4F7bWjhQJHfCVoSuVNzwpyyVxy7xpBu5utHkQrOO1RU
	uan7/yj+RFEWG428rQcUN1GKr2AJ8cL2rvgJprzaRtp8uVDE1kD/Wheu7wO2Qv5SOl6kd9MyhjI
	xK6srahGOy73y/o5ipsVZOToq8bn1aJZ10UV/w20ytIA4yEonIa/jV+zkq+zT89epzwJNOe8kmC
	0lqafKwWwvKUCkJCIL/L
X-Google-Smtp-Source: AGHT+IF+K06oAWXkF0s7xGk9CXHkZ3d4umQ124gCDvUWBbfXf2qnmgVpjF06/0gYCP3LpXrycYtCTg==
X-Received: by 2002:a17:902:e80a:b0:215:6c5f:d142 with SMTP id d9443c01a7336-21f2f1b4759mr41887255ad.20.1738830812389;
        Thu, 06 Feb 2025 00:33:32 -0800 (PST)
Received: from localhost ([84.78.159.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368da60bsm7040865ad.258.2025.02.06.00.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 00:33:31 -0800 (PST)
Date: Thu, 6 Feb 2025 09:33:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bjorn Helgaas <helgaas@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 3/3] pci/msi: remove pci_msi_ignore_mask
Message-ID: <Z6Rz1o3CnnuUiaoI@macbook.local>
References: <20250114103315.51328-4-roger.pau@citrix.com>
 <20250205151731.GA915292@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250205151731.GA915292@bhelgaas>

On Wed, Feb 05, 2025 at 09:17:31AM -0600, Bjorn Helgaas wrote:
> Please run git log --oneline and match the subject line capitalization
> style, i.e.,
> 
>   PCI/MSI: Remove ...
> 
> But it doesn't look like this actually *removes* the functionality, it
> just implements it differently so it can be applied more selectively.
> 
> So maybe the subject should say something like "control use of MSI
> masking per IRQ domain, not globally"

What about:

PCI/MSI: convert pci_msi_ignore_mask to per MSI domain flag

Which is slightly shorter?

> 
> On Tue, Jan 14, 2025 at 11:33:13AM +0100, Roger Pau Monne wrote:
> > Setting pci_msi_ignore_mask inhibits the toggling of the mask bit for both
> > MSI and MSI-X entries globally, regardless of the IRQ chip they are using.
> > Only Xen sets the pci_msi_ignore_mask when routing physical interrupts over
> > event channels, to prevent PCI code from attempting to toggle the maskbit,
> > as it's Xen that controls the bit.
> > 
> > However, the pci_msi_ignore_mask being global will affect devices that use
> > MSI interrupts but are not routing those interrupts over event channels
> > (not using the Xen pIRQ chip).  One example is devices behind a VMD PCI
> > bridge.  In that scenario the VMD bridge configures MSI(-X) using the
> > normal IRQ chip (the pIRQ one in the Xen case), and devices behind the
> > bridge configure the MSI entries using indexes into the VMD bridge MSI
> > table.  The VMD bridge then demultiplexes such interrupts and delivers to
> > the destination device(s).  Having pci_msi_ignore_mask set in that scenario
> > prevents (un)masking of MSI entries for devices behind the VMD bridge.
> > 
> > Move the signaling of no entry masking into the MSI domain flags, as that
> > allows setting it on a per-domain basis.  Set it for the Xen MSI domain
> > that uses the pIRQ chip, while leaving it unset for the rest of the
> > cases.
> > 
> > Remove pci_msi_ignore_mask at once, since it was only used by Xen code, and
> > with Xen dropping usage the variable is unneeded.
> > 
> > This fixes using devices behind a VMD bridge on Xen PV hardware domains.
> > 
> > Albeit Devices behind a VMD bridge are not known to Xen, that doesn't mean
> > Linux cannot use them.  By inhibiting the usage of
> > VMD_FEAT_CAN_BYPASS_MSI_REMAP and the removal of the pci_msi_ignore_mask
> > bodge devices behind a VMD bridge do work fine when use from a Linux Xen
> > hardware domain.  That's the whole point of the series.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Needs an ack from Thomas.

Thanks, moved him to the 'To:' field.

Regards, Roger.
