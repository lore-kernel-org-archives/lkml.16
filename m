Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775BC2F29
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750639168; cv=none; b=UPeb5EZK9cfVEh+YBxOYlipePrDPj+V0b64k4NcYf8fZq6QALM45Zs1kE4JSHEY0lxIb00uMInwAQF8g+Hf3seEyo6DXIPssa47opWafK59k/2UtBUDhyY786xO+RR4cvvlGblepXrYb+cPW9FlpHtdqq+olpGxc4ll1NVK0hFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750639168; c=relaxed/simple;
	bh=jtNOJngJoBLgvYCX7nmdLlEpEGpjf7HgKEm+BRvuGAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxFlOmtFkq2TkAwOLMy07vPDYKI9n+VznwVwNMAVKnwQPK9bbDNZgVsbbjj58pAyVFfXMEMsYrek2T8VdW+XKwSsDlb7lewMv7e4eC0sJnRu3hcbGnOl1oPluj6pLJPSWYGXR9a9NccnylYr/12hTSJU+FIVVAyiPQef5a1YoeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cR4a9IRp; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cR4a9IRp"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3139027b825so2679490a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 17:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750639165; x=1751243965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CcQGXn95YN4kqRLmGGJq78o+QgH8CBAG+ZCKLPSsNY=;
        b=cR4a9IRpwkoYUbKN2RMa2rQiyQRCBvia5cEgl87x6EimsCCW6uZNi6WD5MDmVcnyct
         63XxAoVyH0cSyMlfkHvXijWLz/9sTzGSxI2X+bBTkjSeZ+s1TgcqWPVJgOja8kWrjRMw
         cO/Chf9PItcp+xhhs7cLSBpzttAsoB7PGlwEfvglLET6TWJAu6Z/LvkWoy8BY1gJbkun
         Uj4Rk1bhMuuJBhjPJbkXDlMtK8LARPwC/FORMAB/Q3giZ18qLBet3VmHzKP+g04Xii3/
         itQyfS5rNz2lbXz+1jV3l2VHN19Elc3P4jmH56Nmrt+qnF5U81KzCvCBfBwRNNaHIg4X
         TYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750639165; x=1751243965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CcQGXn95YN4kqRLmGGJq78o+QgH8CBAG+ZCKLPSsNY=;
        b=N5EpwDs97W1FHpkp4K1gcFpnk91yTS4ejZM535KUFAZI0qae2ziH6PQ31Kmnil9Kl9
         kUe+TPq/mEHZbjXK/2aORFaodhND75/i7mq+C6Yyumm7+Gyai0TXk7STkwcy4OpOHOfq
         3ncG0sJlaU25pq720gWBVKb1CwN1OW7f9oVjJSPqoij8G1pNl0l9CZWPfCT2HcK6iq7M
         MT+DA2qFc5gRb+NBZOVu+dUHptNcki4DukOt98GUSnELhxYiQvhKuCLOS14Sdx80d4zV
         sXJq0FyrU0fE8OQr+nZ5RSfAkWb1YuEzCDk00+rJZzu93JiI2EocbX4Z3/ZK2SkTb41i
         PaAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwMmBXPPYrMuWDO7Z3Z2PUEAEc0hH3l9t29joP9MCQVNcEJ+g1SLkBZyaWtCQKLFsaZZt0oSPL/3dY9N0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnv/4TOhcWL/GhodSPYn4K3VIZFrf3+/nGl0HX+bjdtlvKVmpM
	k/bN2oJC1G/1JGCBRywkGRd5OtGLqf7R2VSvMwXMGq6f1pz4eVviL1hN
X-Gm-Gg: ASbGncsVqwzC1ftrHB/ZlbcYSxLgbAR9fytDDOnSu3LBaXw/l939CGtJBi/BhS2dzes
	a8GgI/4L1Y14GSzKK4ZapARO2mpoGUMiEICl0iJVOOlkdA7Wi3Oxlu0+/4ELFR++luS9OcG+fGN
	Xwjz+1LVa6THAS18MdT5jSAd0UiAxba1Gvjobbf3FKMKXtrGt21rR+ni9CTKPPDk2sauSOOEBBR
	TgA5Qc+4ZHNL7nmm8N3/PUPCK5UZ2dL8d6yLJt1vJJGICR9/rq5rU9lqvXvl77ZHGJc4laTEo6O
	q52qjEiAX8p+OcnHg7bbKl7ePV+iufVMRRFbIAJ1wXqUBtdU1Aoms70TkruEdttR9VnUjVLLdFg
	=
X-Google-Smtp-Source: AGHT+IGOciCKMqMGYJOZ0jRU90QGJbnFfhCdDzsV32W4ieI/kX14WMkUTKYzK5wjkTM7nT7ZDP0DEg==
X-Received: by 2002:a17:90b:1e53:b0:313:31ca:a69 with SMTP id 98e67ed59e1d1-3159d8c8f6cmr19982476a91.18.1750639165479;
        Sun, 22 Jun 2025 17:39:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a12c9b9sm10171086a91.0.2025.06.22.17.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:39:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Jun 2025 17:39:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: Linux 6.16-rc1
Message-ID: <2e7b74ad-b308-46af-9edb-59c0ce416d89@roeck-us.net>
References: <CAHk-=wiiqYoM_Qdr3L15BqJUyRi6JjR02HSovwwz+BXy7DdVeA@mail.gmail.com>
 <241b0829-5fec-4d88-866a-ba59e2ca748e@roeck-us.net>
 <CAHk-=whDM950+cCgmNH2edB2edCaktdpvBLGjFESAZfYZ3ZpRQ@mail.gmail.com>
 <mafs08qlluuvj.fsf@kernel.org>
 <CAHk-=wjYB7tvFoqsL3aED9YZ2eusi9dMc=ckPzF-dnrRsERBUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjYB7tvFoqsL3aED9YZ2eusi9dMc=ckPzF-dnrRsERBUA@mail.gmail.com>

On Sat, Jun 21, 2025 at 08:59:46AM -0700, Linus Torvalds wrote:
> On Sat, 21 Jun 2025 at 05:44, Pratyush Yadav <pratyush@kernel.org> wrote:
> >
> > I don't have much idea of how people use qemu for testing, but since you
> > say this is important for testing workloads, I can take a deeper dive
> > next week and have an answer by -rc4.
> 
> Thanks. I'm not sure *how* important this is, but if it affects
> Guenter's test coverage, I assume it affects others too.
> 
> But it's not entirely clear how much it *does* affect Guenter. He says
> five failed tests, but those are all accounted for by the master
> device thing.
> 
> Guenter, maybe you can clarify?
> 

Sorry for the delay; I was travelling.

I modified qemu to make the flash type configurable, so it is not a problem
for me. However, anyone using upstream qemu will see the problem. My qemu patch
adding the option to configure the flash type was rejected, so those affected
will have to wait for a proper qemu fix.

I would suggest to not make any changes in the kernel: The qemu problems should be
fixed in qemu. I only brought this up to raise awareness that there is a qemu related
problem, not to ask for a change in the Linux kernel.

Guenter
