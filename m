Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5560B2147F6
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748427820; cv=none; b=uJ6v3PaEvJKAsM78v3Pl8DXQBxjO4wF5otZvRErRGqWxf/Pc4JH0lCsu6hzTE3MPuAGiUTTP60ck6hfq1hAdAKZ1aV//AMzwdgcxjZ3Cg/KjhQHlZhojNQ9KE4jwVUrakGHb2ncTHXQwn+ELQG7s0xD7bj66Lvpag4mYntc7z1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748427820; c=relaxed/simple;
	bh=MM/ozcOCXZ5d+VyTWQymctGaa9SnFX03kQYidoP+Ecs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R1YFZrXuRIvUJ3m3eVMfwTlBURLuYvaA8AGm97Az+PE5P2MnxnR8zwrZ4HYrkxR0Ykhyo0lXM3pxV3M4erHytmFmNhQjZI8ogNyNfW7SkFDgV6+/DAzMJJ4vE/P37cNXBu1OqoH0LIL1Q7cWVwt29dGQ651iLxC9hzVj3gwsHKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3pP04dgc; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3pP04dgc"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-442e0e6eb84so27435505e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748427816; x=1749032616; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOkwFKzz2wqGgEsUgo/sGUbk2ueBcmlhvGMY23/sxjQ=;
        b=3pP04dgcMEkiDubgugINoeGBlm5giD5sq58cXIM8t6lWL6AcdMc9GV7tplseN5BJEU
         MCuHbY60Pkyxahq9kuPSg8Js7WAF0V81C/47XSyi+obwk7vLskIV78ggHols7C16atfw
         5EzqeX4Y5RrCRyFX/CF6CplWu8lbEPGtGm15DmauB26SNHITEJ3qQ8b7CptiUGUgum5a
         /DtrtvlV+rAtB/pH9Me5wzKlIBeZhk3NHZJlbmV+Ix5fDExAFosoq4JZu+yPDOmogCyC
         Rb7sTQmRl5IQIF/IW8+NaX56v8YmuWY1MRbyQp7flRCt7BJ8UTgTNjdg5Zu4Wn9tmQhK
         TfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427816; x=1749032616;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOkwFKzz2wqGgEsUgo/sGUbk2ueBcmlhvGMY23/sxjQ=;
        b=UKSeWRt++8pheLU9y4CYH5ggjnU2DutBIGlW+Z+4dA62STshYsWMix8VZZrRB+Vgnw
         pXc9jGROno9sXr0WQpEa67T71NyQH2xCTjuE4hTKty8xqTkQl2hPAzNGSg5Y2HdX93XQ
         6TIQ3wnXHS2zbGeM0uXlbnoNxZhLHgLVcF4wcIeBdo6LIT+7tfTvXh9kripOZZfjhf0z
         GKsvarc6QQSd4VPhRcSyIjntnz3y4ihvNpF1fAveeTo4f+1+QcQHgNuu0A5MwQp32NiV
         ID6TRJ1MTy2Js1zltupfYNceqn4hkNivJaX89HNjfylFZ91jrajfqcxFi5brXgUa6YsU
         QGAw==
X-Gm-Message-State: AOJu0Yzm+m1zxzcTDht9ejU2QAq2J0rhM3C5GuBnLYxwXZbp5I3JDvYi
	vxha97unrLoec1YQGDUsichrbGDCblc2zPptu9yl7C3bHCPkGdXn+/02U4A8KS0mn9jqAUIah/g
	qL8vqo4lgN7b4vjutXw==
X-Google-Smtp-Source: AGHT+IE/d7QvjBd9m9AiElll2EXSy/M+uGwax68KFlLRDUZEw5WjgchZ+RZlIS0fNhH6I9/raBwqDL4gIz57Ke0=
X-Received: from wmqe8.prod.google.com ([2002:a05:600c:4e48:b0:442:ccef:e0aa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b02:b0:43d:412e:8a81 with SMTP id 5b1f17b1804b1-44c937d12dfmr114075975e9.28.1748427816674;
 Wed, 28 May 2025 03:23:36 -0700 (PDT)
Date: Wed, 28 May 2025 10:23:34 +0000
In-Reply-To: <20250528083431.1875345-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250528083431.1875345-1-pbonzini@redhat.com>
Message-ID: <aDbkJhSA2SJphO7i@google.com>
Subject: Re: [PATCH] rust: add helper for mutex_trylock
From: Alice Ryhl <aliceryhl@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="utf-8"

On Wed, May 28, 2025 at 10:34:30AM +0200, Paolo Bonzini wrote:
> After commit c5b6ababd21a ("locking/mutex: implement mutex_trylock_nested",
> currently in the KVM tree) mutex_trylock() will be a macro when lockdep is
> enabled.  Rust therefore needs the corresponding helper.  Just add it and
> the rust/bindings/bindings_helpers_generated.rs Makefile rules will do
> their thing.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
