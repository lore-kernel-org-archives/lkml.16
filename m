Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1444F5E0
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748940902; cv=none; b=jbK0gCsT61ci3UIZps1CRyZF7QbDrIyPMuuZCiiSqV/5zyeCXClv42l6h03N3ylRMUEpLekx3LsUO/lNrA1/zzwdPO+ERnokfE6Zf+f7mJFAFworLuYbt4+zCpRObw94dQKutds5mi8jlSTiqdFI2MqAiNFBHZjWfNxd0ZDFR8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748940902; c=relaxed/simple;
	bh=8zkH6prdGTufgqEid7ToNXi9IZnD0KdhH/6nGwT9UYA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L0nTeL1sZTbAR05VQ4m4YxASYI7P++dspPQTO27VFQtbavQ1Dmxqlr+RwoxrCfJhfmeoZsC16dLcOPF+LgKaC4TkvaybbrsG5L5Mu8S9wnV/Kb9sIK+WPby/SCbXOaK2FeywIjwaY4N8iSFsUpzD0TG6OiJq6MCPLtHwmZsrXuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1q/G7tjJ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1q/G7tjJ"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so2955644f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748940899; x=1749545699; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L4v74ZSV//uCzbQ8L34+E7FaJ0Q0XlOyVQs25eQfNuw=;
        b=1q/G7tjJXseKfzRYme+hOCT9FxKYDx+kX/xeyLHutElgsKqj6qxCl0o2spt3CHj6PK
         g03sJZVjK6mhAMen1JTxcvfF1lbxYmhvTFZ72xVanocIxuVp6KddOUyMMd/qhUMNTU8s
         PIL86PJQUG/hQ7hUvisIRV6N3AqMD708wHUVL2ZbErdwZrsbFjZCR8pG56BrwfkDTInO
         HdlZlWZcNhGAW7YIy6Kx1/nT9/vcnPCqFHfmquDpLo+8lOEcivVl1qIVfsRb5lKmNewf
         QfkycwVrL3i5+16oJIOLNh6nA0nVe46Ex1KTWm1TtgkubStHgsyYh71pZq097hZrwb8s
         BDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748940899; x=1749545699;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L4v74ZSV//uCzbQ8L34+E7FaJ0Q0XlOyVQs25eQfNuw=;
        b=jjgBbP15bCeL5LmPvGpvF1dcZn9DIMkKPx22CEjoJW7TBVjeYcnO7sLm5/NKMaWeVW
         aY8bjUakEWuYK1ryz7QLDJw4M7x+xpXxPNWVagHTgVAbOYJ5BRGS/oIgMRsoXgQfGAjO
         jCmh/YH/mzAv6aCF2ZWfksbbPuqayAr2aTr2PTywu1Zn40SlRSAduHiVpwIq0WrC8UUZ
         ZsxmoEqNhtFLC3NgktiXQgsWYbP6SHDvBJFenboKDkzKW3r3rbq0kEBolMveHPyjJ+8l
         bInCJxOUoQV3h4ynipNJWAl1INdEM9kmnUYIQ15p5hc7FLVEwDTiEhGzAeIUiQt+BERg
         SyZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjkKLSUg1MC4joF2UXKVavbYT+egbxMdQjlUWHT3alyr9RysGhRf9gbyymQiIRS/LW9k/h86bl+QGGgbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YySJ+5JG/WZlUdWneOrzhR0n7T6SeTjhQrAm2peTTatWRNygHlQ
	lfCg+/Ic5Q6OJEatYfagIfqAydPX/YBE+SJ2zLJ9lwrLNMfqOAROnYC32eRchiIN5HKqb3wVf40
	6Hpc1DqvY1AVFzUOPsA==
X-Google-Smtp-Source: AGHT+IGgUOqa4CrSOnbtUYHuRz1fa/zK1YaDVpN9MK4313d/Fuh3G2QB+JXlrr/oG7qhBAQqXlWPkLzWC1K3t1E=
X-Received: from wruv2.prod.google.com ([2002:a5d:6782:0:b0:3a4:e4cc:e53d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40ca:b0:3a3:655e:d472 with SMTP id ffacd0b85a97d-3a4fe395a08mr8666308f8f.47.1748940898874;
 Tue, 03 Jun 2025 01:54:58 -0700 (PDT)
Date: Tue, 3 Jun 2025 08:54:56 +0000
In-Reply-To: <aD62ZGBwqXxTroeX@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux> <aD3PCc6QREqNgBYU@google.com> <aD3f1GSZJ6K-RP5r@pollux>
 <aD6yOte8g4_pcks7@google.com> <aD62ZGBwqXxTroeX@cassiopeiae>
Message-ID: <aD64YNuqbPPZHAa5@google.com>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jun 03, 2025 at 10:46:28AM +0200, Danilo Krummrich wrote:
> On Tue, Jun 03, 2025 at 08:28:42AM +0000, Alice Ryhl wrote:
> > That optimization sounds like something we definitely want, but I have
> > one question: is free_irq() safe to use in atomic context / inside
> > rcu_read_lock()? What about the threaded-irq variant?
> 
> No, free_irq() must not be called from atomic context. Hence, it's not valid to
> call it from within an RCU read-side critical section.
> 
> I assume you're confusing something, free_irq() is called from the destructor of
> the irq::Registration object, hence it is either called when the object itself
> is dropped or from the devres callback, which is called after the
> synchronize_rcu(), but not from an RCU read-side critical section.

Ok hold on ... I guess the issue I thought was there manifests itself in
another way. What about this situation?

Thread 1                 Thread 2
device removal starts
                         Drop for Devres starts running
                         devm_remove_action() = 0
device is fully unbound
                         free_irq()

Now the call to free_irq() happens too late, because there's nothing in
the devm callback stack to wait for it.

Alice
