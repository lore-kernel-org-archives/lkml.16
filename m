Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57E5189F43
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867978; cv=none; b=ZqXuBzXAqHY/XZYneRrKdtL0om81q9dSNWkcWb2CVqlnMDP7falyKMCbSzF52NDrdJQq1TQ2oYvS0O2uk7NblyJvl1vBUs+fAuTBrCwbNSwuJQSI6QRniFd7CJ6zOmvAuyjKdaetPKI230byidW6ApnZZoJ5b1Kpdfup6pklFdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867978; c=relaxed/simple;
	bh=RMiNvzTmNQ6uGQUNTW8VoGhR52Bb9FCblhjSf+W7ab4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GAR2CBPcvTUws96VN44yoLfguV3RpP+VzoNEX1myAwZALj2PUgfkjCpdXrQD0WDg6cuVwFz2z7M0FDfrdsUjSOnF56WoDFGAwWGFmll4UUbHG8dg4h17KZhDf8pvsbLGlmwSxQXMtJJ62Y0Zspw7yD+3O0ojeI+bxozl/SW07JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EbLzvMFR; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EbLzvMFR"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-748d96b974cso62444b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750867976; x=1751472776; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lgTQMEzvYm9i1XdJKwLwAM5nfW1WsYbVr2cAlDFSC+k=;
        b=EbLzvMFRdjPLDrlwvqXwto8aU0Xym3blFt3kYzt4Nee+YMtr4tAXiKavbvDlxq57c+
         aewZDE2rsEEMGo6mrDRBWHgggxjuVksde/I6qQ7ZMRUpSM6MfbxFwAnhHGWmhqCQyfTb
         nsuO0SkD0qX/Yb3e6+Bw/79FnMA8ZoQILQPzuW0inrhEiBGlakNXmRgycf/kaVJTXuAC
         gW/w/du0vQ0CVJWgACK3Lw3GBkirVvUPwK/wg4Z/TDmspdW9HIU665IPILd6NCMvKHdH
         3tfnxL5Vlg/9LP3KLAvCIYnKx2ocpPiMpfDFrTo3wigUqWt4mKzxyuZ96ep7VWHnuU+6
         4yUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867976; x=1751472776;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgTQMEzvYm9i1XdJKwLwAM5nfW1WsYbVr2cAlDFSC+k=;
        b=IxkRZEu0mqiYM9Jmn2G6h0Qg7Fczn/PoNqOHWuQrGiWYGL5oniuZWcNqKddJmGy0ft
         yl0BHmqU5NgIiHIfLfkmMnwLdkOSp9lWYVACQtDeGYz7tDGNCQFPVEYF13ntwmhOWCE9
         /MY0uBMC2j0m5VUhWAlha5tUdSwgQCd1/GbOUcn1AwUuIncZzilOSKeumRML/7i7WVmw
         1O3UTbiZk3GpBGnhRvNwATaQNP0FPUiAbiHhpBWn2NJepaAzpT0bFrHe+P6vFpMdlDnr
         9KsVHzNZW27fK5lhupbQa/me0W+cGpOpbBT5MxgCEYZ1LQmauV7O6M04ZaycHXK9L6EX
         PbYw==
X-Forwarded-Encrypted: i=1; AJvYcCU64r57LBaz0iitIofGCmdQU65kK5uBO06PrO3qB7oZjUEsOoauzkudzB8xakDVCHlsyKWPmK3nX9Lb0Mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI8EjocxMwObHLz8ywDBzrdI5X6GIkcHipRiroYbHQkH7NNKwg
	UmGFomaIJKQfIW8xWZ3L1SXrBK0hUGB5UrCrgq4CLb3QBNvil3jKeH6OsAd7d62NGTIP7fS+x2b
	pEu/sIg==
X-Google-Smtp-Source: AGHT+IHPfmLt7+7XMJQuLzEkKxOsf28vsWzElmisjOeqLOeHoGCN67LZ+qxnj2nNyKOR2Qy/uJXYVvmjBDE=
X-Received: from pfbhx20.prod.google.com ([2002:a05:6a00:8994:b0:748:dfd8:3949])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:210b:b0:220:92f:4d97
 with SMTP id adf61e73a8af0-2208c08a9a6mr687075637.4.1750867975980; Wed, 25
 Jun 2025 09:12:55 -0700 (PDT)
Date: Wed, 25 Jun 2025 09:12:54 -0700
In-Reply-To: <543bcbd5-c217-41f7-b478-e32e6dcf66dc@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250226181453.2311849-1-pbonzini@redhat.com> <20250226181453.2311849-24-pbonzini@redhat.com>
 <543bcbd5-c217-41f7-b478-e32e6dcf66dc@intel.com>
Message-ID: <aFwgBs2Gdvcj98nH@google.com>
Subject: Re: [PATCH 23/33] KVM: TDX: create/destroy VM structure
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Tony Lindgren <tony.lindgren@linux.intel.com>, 
	Sean Christopherson <sean.j.christopherson@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 25, 2025, Dave Hansen wrote:
> On 2/26/25 10:14, Paolo Bonzini wrote:
> > +static void tdx_clear_page(struct page *page)
> > +{
> > +	const void *zero_page = (const void *) page_to_virt(ZERO_PAGE(0));
> > +	void *dest = page_to_virt(page);
> > +	unsigned long i;
> > +
> > +	/*
> > +	 * The page could have been poisoned.  MOVDIR64B also clears
> > +	 * the poison bit so the kernel can safely use the page again.
> > +	 */
> > +	for (i = 0; i < PAGE_SIZE; i += 64)
> > +		movdir64b(dest + i, zero_page);
> > +	/*
> > +	 * MOVDIR64B store uses WC buffer.  Prevent following memory reads
> > +	 * from seeing potentially poisoned cache.
> > +	 */
> > +	__mb();
> > +}
> 
> Hey guys,
> 
> This ended up in KVM code when we already have the *VERY* similar
> reset_tdx_pages().
> 
> Could we consolidate them, please? There's no reason to sprinkle
> knowledge of movdir64b's memory ordering rules all across the tree.
> 
> Adrian, this is probably something to go do, first, before you try and
> poke at this code that probably shouldn't be in KVM in the first place.

+1
