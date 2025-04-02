Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A315018DB3D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743612301; cv=none; b=Tp3TqDgriIkN5xocMmwp+8A7YN8Qcn1BEEtjrNrFirIq0kXi4UfODFdGn/5eysfZsZwCOrhC5dW5hbSZjgyoN2nBgKXewUT7v//cAKMHVg3K10gIN20ZNUA1OhphkFkW4uRulqf0eHlzmtdbVxBInAAwhSHjxkePMic99k7Tyuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743612301; c=relaxed/simple;
	bh=VuzG4R3fGEOVCAcfPoOTUO+6ntcv0bfx+Pvn/LkzyGI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iU1lRslfVIpaQy2R3HiF++krA31Okvh2iFjE3lVBHhTsSDqjKSswlsthULPKQRtxecLW+riHc9VVe/84ixUaQ8/qI6OaiQ/3oFYSvD4pd2FUJfO6O4siPDlW0bZYE3MOAE456SKqKZShU7eQD6WI3xKSNPRQ+DemFRAj6qu6wpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ke9bkLUu; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ke9bkLUu"
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-72a0de193b2so63084a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 09:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743612298; x=1744217098; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VuzG4R3fGEOVCAcfPoOTUO+6ntcv0bfx+Pvn/LkzyGI=;
        b=Ke9bkLUusWnEJOUAsBBXpRSTnV91FmPVZUpeXNAFTEdC1hzQOD3NUB5snuJ2smG607
         ZmTG+YPY9YpsgzXYw9V9iVPh/AuVqFDckPfwM4QRCyDeroF3nbY8iRYFhi2pxOCr8clm
         +EXNdy7nh/no4wSK/OcfOXfFxqw4Mne6ni/KfOpmmT1JP728EuzLslHfySLB0NF+uwmX
         YxiibwJyp24uR5wh7v8iOX8OxeF+6KcxVZ3mr5c9X2CumN6egDDERbbYkpDzgIjK6ndQ
         yZNs5c5Ho9mM5xHJ+5ZpQ43p/7nh2mM2yZyb9k0i0Ii5fArlBP0XSFTzcTiPQbpmrMXJ
         hLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743612298; x=1744217098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VuzG4R3fGEOVCAcfPoOTUO+6ntcv0bfx+Pvn/LkzyGI=;
        b=ZWwJ3urK6tZeHJcF83S3fQAPT09veoKpMXeR3DTF6qGtJW+6hrtOeDQDkmC3ht6bap
         Iw0vkWGeHAeVob7zuq2sUbEc39DaCzMlk9qQGay3AyyuMklGjwqsRWHuap1hKxlGu7uz
         QRnW5e75+R1Eek0xtQB6DR+bNZ1vyVYv0oCXZL/UI5ialtA//0wGG8y8KRpG/w/7nyK1
         qWm0F3T+Lnjx0psOF5JK/7H5KADOr7zaVbdLp40o8Eq1KynGYwWjWn88jMWCKr/h+eL4
         yHh39K+l4CXXSQJrlMa1kmjZgRNxaRJp4aC2MsRDCvCx4CJgXkrmyG4CVMhIPiH8ipFF
         7R7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIl5M6PYnAqLTOe50USr+j0Vk9Ue0MMK0I96TDlkfP6JoFURBiI/VnBKifzM+3BTxjClUhnBIC/9bmEeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFe//1RPWQZzeD8eagW7zf++PIChz9FeLpHEzhLzAZpTihuTKR
	IzmkhjO2SsOupj/MnvC1T495n1EITKOVWiPsw03FpgeXyU6VSEahv37Hp19jOd8s7/UAECIeHnI
	UZW01ebaIbRhcu4l8bg==
X-Google-Smtp-Source: AGHT+IEtfiQ81dhFjIlo1nhzzYpS6z7yTo9b5I2hiuFriTAYh9htxtNtSS00ENc+Qm/R9+CszjB93qxoNQJ5CKjh
X-Received: from oacpy11.prod.google.com ([2002:a05:6871:e40b:b0:2bc:6c19:c219])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:2902:b0:72b:9f90:56c5 with SMTP id 46e09a7af769-72c6382cde9mr10771860a34.17.1743612298587;
 Wed, 02 Apr 2025 09:44:58 -0700 (PDT)
Date: Wed,  2 Apr 2025 09:44:53 -0700
In-Reply-To: <mafs0tt7eqt6f.fsf@amazon.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <mafs0tt7eqt6f.fsf@amazon.de>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402164453.2470750-1-changyuanl@google.com>
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory preservation
From: Changyuan Lyu <changyuanl@google.com>
To: ptyadav@amazon.de
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, changyuanl@google.com, corbet@lwn.net, 
	dave.hansen@linux.intel.com, devicetree@vger.kernel.org, dwmw2@infradead.org, 
	ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, jgg@nvidia.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, robh+dt@kernel.org, 
	robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Pratyush, Thanks for suggestions!

On Thu, Mar 27, 2025 at 17:28:40 +0000, Pratyush Yadav <ptyadav@amazon.de> wrote:
> On Thu, Mar 27 2025, Jason Gunthorpe wrote:
>
> > On Thu, Mar 27, 2025 at 10:03:17AM +0000, Pratyush Yadav wrote:
> >
> >> Of course, with the current linked list structure, this cannot work. But
> >> I don't see why we need to have it. I think having a page-table like
> >> structure would be better -- only instead of having PTEs at the lowest
> >> levels, you have the bitmap.
> >
> > Yes, but there is a trade off here of what I could write in 30 mins
> > and what is maximally possible :) The xarray is providing a page table
> > implementation in a library form.
> >
> > I think this whole thing can be optimized, especially the
> > memblock_reserve side, but the idea here is to get started and once we
> > have some data on what the actual preservation workload is then
> > someone can optimize this.
> >
> > Otherwise we are going to be spending months just polishing this one
> > patch without any actual data on where the performance issues and hot
> > spots actually are.
>
> The memblock_reserve side we can optimize later, I agree. But the memory
> preservation format is ABI and I think that is worth spending a little
> more time on. And I don't think it should be that much more complex than
> the current format.
>
> I want to hack around with it, so I'll give it a try over the next few
> days and see what I can come up with.

I agree with Jason that "nothing is ABI at this
point" and it will take some time for KHO to stabilize.

On the other hand if you have already came up with something working and
simple, we can include it in the next version.

(Sorry for the late reply, I was traveling.)

Best,
Changyuan
