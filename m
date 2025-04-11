Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4331D1C5F09
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362712; cv=none; b=Jys3G71eGO4ying+Ie+cm6ZBJvxcD+z1XwZUBk70ttd6zgDNSjMa86hHQ75uU93OZCK+gKD0fcRC5eUStNzwuqmik59kU32lAv0CYisS87b/Y7+ewkwsx1SZRXYo8DLgRzKmN7ceWJsCDt3zjaWFM1hWvWhPiquykA3wbdrYZrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362712; c=relaxed/simple;
	bh=gAZvl/DaOljYQvLbZyj1Aqor4TLX1CMBfFj4+/m1Sks=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ee1Wfko9cTtYl0AMXQakswadkc9X7M0uE8Vb1sIM3jAiwcJPtFqStSaaCDhUL4Ocowh2Rjeiz/8aO8nT5hpWiWODkBP6D4J6l261R1UC9DZNvWA93fVaxKzREArNJ/iTmYo55cLUDlMVvv8zMUdWJFmsZZQWEaQHZY005T9T61Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wJzEPBFa; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wJzEPBFa"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3978ef9a284so704510f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744362708; x=1744967508; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wtHjRHXFVscsRp8RZd9/bk5n+pzbeXXVGPWrgj5RJKk=;
        b=wJzEPBFalVvn+0R4xEo5IVttssP/2COSMEORHKeV/lZCypZW4kGiQnTo460Sukqgg/
         zRD4enU/FSe6iDj1srJ914C0gZKuE/kaoSK8jV3YpOmrq4rUr6r3pDXNvAW2TF4XLePN
         +PgkOepO4f/R4/qbOHUdj/pZ9SCVblv0KqGp3yv/j7bNJVpGeYJ6TmXBMQeSjDfteA5W
         5+rKnMUwz2ZoSNkJ+kCJXlUfS6z47WII8AK8tTGQRvLNmD3wrlyhQ7v3gwhjmrDI6jRN
         oX0RmKJyS/EkUTU/zgCQ81trAJ1UabzCaJZnvCIygsUe5eGCQZa9LdVCGxjOzzplFqdN
         0PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362708; x=1744967508;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtHjRHXFVscsRp8RZd9/bk5n+pzbeXXVGPWrgj5RJKk=;
        b=dwN+6GfcPD4/RSYuFBp9z4z5NtU6Mq/1OthozGrF7zSXlGuc7XXVMdoFXzQN77BcL5
         P0gauq6zXUGxVB8M7v7viBTx3iQiRAvVdni422kFdvlBffnBu7+vGvRy/A0ob3GsAASO
         9KurDmZAafCs+k+wGq3HToVBGIyq+/9FsIqcvHWmkmF+Q2JWHDGlBBOvTdmBkKIvBf0m
         LMs9BVxDLiJUpyB6cs3h9KD3CFH3etUXWx3npr2COR64xSklunx6C5BBSKOtJ5u6LSvl
         KkaL639kXDAn10tUFdSilCkjHKMnul1bQPaB9Puo/JNIy3tbGHpSuiWP1V7bevehGG7e
         +K9g==
X-Gm-Message-State: AOJu0YxLAdKpWDdQzv4vmfDg7nmyVYpptHFmcZaL2xWvDh+59Sp7X56l
	Aklsq3rDpaba4lzdjc+XdzN6+CcWSBuGs/TmHpggD6hwecNBKc1140lRryz/QbHxzp8zHou6eCd
	EjXhtuqpuproM9w==
X-Google-Smtp-Source: AGHT+IFmPqT5nyuRDbyNRE7tkIsN0LjnBOLCerUako+DE9rPENWe6gVZ3/VyaRuq0Z31vztid24ppGEI8txFJR4=
X-Received: from wmbg3.prod.google.com ([2002:a05:600c:a403:b0:43e:fada:96ef])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40c9:b0:391:4bfd:6d5 with SMTP id ffacd0b85a97d-39eaaecaedemr1421448f8f.52.1744362708680;
 Fri, 11 Apr 2025 02:11:48 -0700 (PDT)
Date: Fri, 11 Apr 2025 09:11:46 +0000
In-Reply-To: <20250410225623.152616-3-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250410225623.152616-1-fujita.tomonori@gmail.com> <20250410225623.152616-3-fujita.tomonori@gmail.com>
Message-ID: <Z_jc0nFyQpGui9xo@google.com>
Subject: Re: [PATCH v2 2/2] rust: task: add Rust version of might_sleep()
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	boqun.feng@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, tmgross@umich.edu, dakr@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com
Content-Type: text/plain; charset="utf-8"

On Fri, Apr 11, 2025 at 07:56:23AM +0900, FUJITA Tomonori wrote:
> Adds a helper function equivalent to the C's might_sleep(), which
> serves as a debugging aid and a potential scheduling point.
> 
> Note that this function can only be used in a nonatomic context.
> 
> This will be used by Rust version of read_poll_timeout().
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
