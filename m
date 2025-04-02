Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D1E2F4A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 05:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743570953; cv=none; b=ISSZBtAVfuQWORrqV/kPNKpWRSnpgmdv9Zs6C39CfmZ0uQRPiksry5w62cllRMqubMHFPlRFtkGr8i8Ed0v7Nr/cPepDguxCrKQzygJo6ag8X9LncSSE+qYuhPUKOPI29j3IMESBNqj4DLZ0So8RR216wPYi8Xak7u+ttiOJKpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743570953; c=relaxed/simple;
	bh=bWPpUkos2jEtKhkovyKjA7nDv4oSfAEjB/EGeL+mVxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdignwblNg8riqoEw9dWq4sG0KlXAt7Sk8XcxqH4n9yaKEek+ZtiOg0PMSoBaFKPnOx1rNAOS8oJtYGAOhYFR8YqoGbMj4e527Nqf/sA7Uwkz2CY5XBgJUV4iVuXDhpUpMEfpERsrhCChg6HHBcXrRaQqeD9iVwklx+zLNcIsBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ttR4NMtK; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ttR4NMtK"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4775ccf3e56so5458661cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 22:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743570951; x=1744175751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UBhayhNwyrGVLnHnARpnBOXHL1gt/zqo/tr6FDds1oQ=;
        b=ttR4NMtK/H38eDS2tIfHaLqhIIo3Oti6v8VEKq5Io1WU2NZlPSQfkFRUH0qvHyD1ac
         PiTyO44Gb12u/k4tqBeOrwqjmcqOmJU9jVhjv/BdYS325APoRrpaoDKcJGTSm0AAL+P5
         5ZADdMGFInd9iIXtQ4Dw2nM9FfP7/c+5TDIJ+G+jbB/lFFGUEh46UavhKN3jETpUc9U1
         CL/bJaO594zN6McEiTaiYYyCFOpOJHrF8D8pHHK/NVoX1TAzxQmIdFtFNTEgLr70WixV
         Y0+IKSCp8Z1kMFrfDX7pG47hyVA2810jGfi6BKm7xpXHvHh7Cl0t9qivUVfwFUmqH2B7
         gtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743570951; x=1744175751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBhayhNwyrGVLnHnARpnBOXHL1gt/zqo/tr6FDds1oQ=;
        b=NkhwxRX36Mg3Bm4gv0XFUcjCUm9O8fss+epYVa5kpzytl8Ks8OJ8JxrmCN63G5x5+U
         kMkaKaPK7RlVyVN222UFzQn81MoWYeLW94KTn99lMouHZiP1Dr92tXotqs6faHxCyllu
         S7XrMyfZpLrcwjvsN8Y63SaIe5x1YWnanFJxlNdG65AqJ9ijwZnGVmrKavAhkDqvcR06
         FEHI8INoWOgGzMH+W6n0WZOcyOBUc/FF7LVpHCVBy6k/HpP/CeJbmxQhvfkl8uRP/j8X
         jpvf7PkIu63NWrO79Xx39C6PzqyMQbkPr5aRkqLLTZDSCRytHetbn+wsXRcr4BKMd/dX
         KirQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbjHx02owfVP0jlJt3hXsDhsmhEK7bJHwBR0TTge3X/gkuxohM4ujItG2VecfViMIBWXUUaLlPGOzOdr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaBi8gF/yUBNlpDap6OnMZJxCR2iIR1EVER387spDRMoXql5lx
	JMlmJ+n/LlkcfJelt7TcwrwRCy8/64XQhnzHq8HP9VGwnkLWLEnzcdgNoCUvZ58=
X-Gm-Gg: ASbGncuZ+U9DYkoKOXkzb1dUuYR0hiCInqKHTS/WbcBM0mPoBvwGf4NbHyK/4ZgLu5t
	noWaewC50nMsSWRCScJsBDxeaLLcutEANo5c/azrxA4ei0vzScaJdpOpFwEOSXAzXTucx71gTsx
	BjmzlWdCj5oL19bdpL5EEVWvJlWPnTZ80HRZSnmCvXnj+SbhMHNPjIZuHXliGRuePQHSCRL5xx3
	HQtLgXenQK0sV2t2XHprJIjxQqv6jDuKsDoVX64+8a1qxtzD2CCKOlyDfxiiAhzIBxA/xYs5WPg
	tBo03Nn5buhQuKMwWoSzUG/eaHSivlcPvArs03XtUsSr+ViIGOT7TKQJ/tL8kscl9grt3z3SPYE
	DoRIid8qUACi5qtVmVZ4znoi71zI=
X-Google-Smtp-Source: AGHT+IG6cFDdBCUhJIJPUwLByZqnNAE8mx3kaNaRVSOgKBueJYVr4mwPJf5fLYFzpV4zids7Bu+0/A==
X-Received: by 2002:a05:622a:24a:b0:477:1dd7:af94 with SMTP id d75a77b69052e-4790ba8bf68mr8502081cf.2.1743570950681;
        Tue, 01 Apr 2025 22:15:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4778317ba85sm75550481cf.55.2025.04.01.22.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 22:15:49 -0700 (PDT)
Date: Wed, 2 Apr 2025 01:15:48 -0400
From: Gregory Price <gourry@gourry.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Honggyu Kim <honggyu.kim@sk.com>, Rakie Kim <rakie.kim@sk.com>,
	kernel_team@skhynix.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	joshua.hahnjy@gmail.com, dan.j.williams@intel.com,
	ying.huang@linux.alibaba.com, david@redhat.com,
	Jonathan.Cameron@huawei.com, yunjeong.mun@sk.com
Subject: Re: [PATCH v5 3/3] mm/mempolicy: Support memory hotplug in weighted
 interleave
Message-ID: <Z-zIBM4zQ0LbGPYZ@gourry-fedora-PF4VCD3F>
References: <20250402014906.1086-1-rakie.kim@sk.com>
 <20250402014906.1086-4-rakie.kim@sk.com>
 <5462e706-5b29-495d-9af9-1945e8a5445e@sk.com>
 <20250401213439.4e7a124d94aa42603d31d45e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401213439.4e7a124d94aa42603d31d45e@linux-foundation.org>

On Tue, Apr 01, 2025 at 09:34:39PM -0700, Andrew Morton wrote:
> > I'm not sure if this is going to the final version but could you please add this
> > patch to stable with Cc: <stable@vger.kernel.org>?
> > We might need to bring the whole series to avoid conflicts to stable tree.
> 
> This is all rather confused.
> 
> Do we need to backport all three patches into -stable?  If so, all three
> should have Fixes:.  Preferably they all have the same Fixes: so we
> aren't backporting untested patch combinations.
>

I'd just as soon leave the entire thing out of stable backports.

Only the first patch actually fixes a bug (very small memory leak
during system tear down, so it's not even a critical bug). This could
be added to stable.

Patches 2 and 3 aren't fixes, they're desired behavioral changes
to the feature. An interface being confusing doesn't mean it's broken.

~Gregory
