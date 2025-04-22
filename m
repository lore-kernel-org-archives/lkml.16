Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A7C28C5C6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332810; cv=none; b=MrvsF29AqGe5eL+1zW/qMcNgMmzrJU/fpraYn4TgYcbE9oa8usMhJK05s+B4p3yzZF+GyWmYPJ4ZBe07xLUhI1VoHU1mLV+i9oY1WVeBclr9nGEdiNYF+FBoOJb0e0bJxbLfpHYl5ZhAnMRW34IfNxZIiF9s3e4P9mlFMXbRb28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332810; c=relaxed/simple;
	bh=H6SmG8zfZRpF/NNqVIU+UMtU8feZniQBwXGO2NIJxnI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qAoQtKq+GcaiPuqEiNcH9ilTY79SETbltj0eLcF4gSMLoRtAc3vr8hQHnKFTVc3J/CZlyVG+YdYTdFMBFmUNZdVmFXgVgMCkUhSyXzwPCxCcvE7ewisngsvJpBNWATCVzaNNhxEYSjRJOLQ+BUkgbBLd+6I3P2DqEeKIoKlobl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xvXnzesv; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xvXnzesv"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736d30d2570so4449999b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745332808; x=1745937608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kse3i/9a2wXrwb5fWBr/bq3/Gxj8YgN5EpIYvK3Crk=;
        b=xvXnzesvHWT/qlP1TLbvjkE4GSmpWLvuTlXNUaJC/YuXFkpIW8mmmsIrXTYdUJhYep
         Rvz1SJEJu+lJadVid+8bcN6eOiEooQhqRy3pWE3bdJsv/9ckXiToNza4vLVnVMlj8khC
         XSG0vBB97OASdnelxP4pwe/k3p33sXRzRsDuG/FglT9Hm7sWqdLtrJzVoUgWgOjjhx7N
         lUtu0HlhI1x6Nf3Ad1UPiEJ23HBI+mHlPpNl1MML6HXDH7gHShw+XOTN7pqrh/CthvQb
         48gbAZnB0KfIUPjP3LNoyHDxa+CwIwMdlUzhv1pqDktGSqHqbVMJfs5zNWLL5pxg7o5X
         l5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332808; x=1745937608;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4kse3i/9a2wXrwb5fWBr/bq3/Gxj8YgN5EpIYvK3Crk=;
        b=JlmdXaElya8vIN3BF1EjdRaz6Xk24P4+wFWqfAlxoWqZ8pCopZpz/oYlcPH59LjVr0
         +Y503+92MY/7JgUcJdUpl9/hza/g+xhPCkGnNgClnf3LENPF/U3ccATGIUYmbevN98cm
         jULyGMxh32/Ae2zXfYMCy0eaOgevfVSoToWziCNhCyNFzvaQ/9kOdvbdpCa3Dbxatd7+
         EVE6fgbDYR1LYNbScZolLBBeubasJy9JZ7ugymZnUNlZQEDe4VVjIzxJclOnrJHIoJEp
         EbcLC6CvV9cTMVAfuROHC/Lo7TXX9N+Sm+Bk1Uyaaa0pSpTLugit8NdSIAqWOHz461dp
         n2eQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuMxKFlRq+r4pfL8FANjpCFqFg7PGQfxGdFjDprZg1VSYvVub6MPdkzRLcDPnm25ODY25OXVartanJkHk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9SaLB0fIFxF0Sc3roI+Dz0/FXEHKw+S/UAF49FKKzX7mvCGSH
	m1VjT9rKlfS2tOzNAoZxrseSo65EcqOFuGJppZTOMi22O+8Tv/uVEWOOs6VMsc1yCPyXQpHOZTr
	NSA==
X-Google-Smtp-Source: AGHT+IEqJub0IjABqAHfS37ByzLd7WwIavXyDFMuCxLJ5z8Czie0a5FeUJW/ZUjHDlbSCiXqb7H4nSjCbvU=
X-Received: from pfbgq27.prod.google.com ([2002:a05:6a00:3bdb:b0:737:6b9f:8ab4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a62:f24e:0:b0:73d:ff02:8d83
 with SMTP id d2e1a72fcca58-73dff028da0mr4353385b3a.3.1745332808429; Tue, 22
 Apr 2025 07:40:08 -0700 (PDT)
Date: Tue, 22 Apr 2025 07:40:06 -0700
In-Reply-To: <a82f4722-478f-4972-a072-80cd13666137@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <a82f4722-478f-4972-a072-80cd13666137@zytor.com>
Message-ID: <aAeqRk8fk8mvutw2@google.com>
Subject: Re: MSR access API uses in KVM x86
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025, Xin Li wrote:
> It looks to me that MSR access API uses in KVM x86 are NOT consistent;
> sometimes {wr,rd}msrl() are used and sometimes native_{wr,rd}msrl() are
> used.
>=20
> Was there a reason that how a generic or native MSR API was chosen?

I doubt anyone knows for sure; that'd likely require a time travelling devi=
ce
and/or telepathic abilities :-)

> In my opinion KVM should use the native MSR APIs, which can streamline
> operations and potentially improve performance by avoiding the overhead
> associated with generic MSR API indirect calls when CONFIG_XEN_PV=3Dy.

As J=C3=BCrgen pointed out, they aren't indirect calls.  Though IIUC, there=
 is still
a direct CALL and thus a RET when PARAVIRT_XXL=3DY.

I agree that using PV APIs in KVM doesn't make much sense, as running KVM i=
n a
XEN PV guest doesn't seem like something we should optimize for, if it's ev=
en
supported.  So if we end up churning all of the rdmsr/wrmsr macros, I have =
no
objection to switching to native variants.

Though if we do that, it would be nice if there's a way to avoid the "nativ=
e_"
prefix everywhere, for the sake of readability.
