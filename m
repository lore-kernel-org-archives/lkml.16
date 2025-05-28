Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F083220FABC
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748427504; cv=none; b=MXY7PrisCvGBarzziA/HiLMz7BAXrW3f9TNMI+GljCWR+Jj9HMLaANX4fVQ8Wy6cI8Jmw5hSLz21BGJzaAX+mrQ5QzadcexS3Mlbb58eKizOoAb59Ll9sYWAbWAeYYjQYZ8H+MPidh8lK5XtWRFucbr3U4f6Ae4VSPDvkmFrmW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748427504; c=relaxed/simple;
	bh=A0xb8zh27S93Eetp8e9L6f77n+tEtjFUeeIM8YlkTkI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Eo2Qr4JKGRpOaZkIcFPr62+B5ahVMYIfjEFbcLq7/n6jIIvas8PDj/9FcX1M1z/IuqkyKaaOX8qOKgzuIlS8KShvPLj/pYao/akExMP5XZ0UP2cN4WxzKWOePttaEomk0NRf5LuBlLbG7weWjoinFIQ8kqLtQmJJcXbx1hvkvls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pJPFUHQE; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pJPFUHQE"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so25032315e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748427500; x=1749032300; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8NINXg8J4QmaW8sPWc6e+ws47cGsufUBr4Yz5V/EO6s=;
        b=pJPFUHQEn3WIBV0/p3yjBolM7DbIugyFbQA9a5cPBLSH2NwW6ttsXd7NThCtu057NZ
         lDiMBTTPK4faNbNOQ7pzXXU7jS+SVWag9YMfmJeopLaQZO2kCw87Cy9clLy+kejdYNgh
         X9ZFGBh8us/U2QMmhVJ5hOm/wj+r1BFdGMoRFxZyKuSsRT8lmZKV/sdyFlrg7lmpOfmZ
         WiIJtdIrCendbCOOsgIePtrhuQf/hhjpkYL3m65gGK2E4fmawODsw6TDhVbfRFLB6T7r
         Zjwiuej5wLEx0kqq0XSNWj3K5vftEIrutiVx9eYvIpWpNZiOe5fmjGsuBchqs4IsnFlq
         m2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427500; x=1749032300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NINXg8J4QmaW8sPWc6e+ws47cGsufUBr4Yz5V/EO6s=;
        b=ckN5BIVFoHXpzDqOmLlriH1Z6uFi49vy4WXjjcObDGjAqq7EmXIY/MDwAzNqEG+eJv
         z/jHN+gul5t0FofVdCdV2ZHA3YOhRNK5iptHAo8WJoBQRK1uBhMfwGybGgFdIUIPdbuU
         1V3ByfoMsRxOwQ11ZARE9PIq6ZfSiOhEz8H1Ma/sjBsS8ZQO9q8OFwP+2UxbKnN0AE11
         9QDK6gEuJQgvSQcVKxZ6EcEsAg25FX0d25zLvUT7nDN90B+141R1Kbq67vy3tyktGUFH
         fkbWQmB3ZHpF0k/0YKlJmIZNEEnoXBzY3gv6MiC7RyfKjnuVTt8vpR0byuCHlxB/nJOC
         l63Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBTO28Q2+q79vVxIPxhUtH2T6Y86o7JTdrLf/74cYKuEXsOsx0FA6woZeS5Faifgiq7y0Ph1kN02f2K60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0l+qwKHZwIk96XTTJDidtbyrdIsQdKtQmcw5jrfwU5TW8GgG7
	pPy/05wmNyib5qMrSNx73+p1u2qgWh/+klqmPoGxCu8r748myDguWkMJrvJq/PBFXrP2YHkItdF
	gdFkVHQ/VAVhGrQrQkQ==
X-Google-Smtp-Source: AGHT+IG9PGBM2TysjUwYmOEWzK8Ty36GnkdiP9d5JzUPAfuLhTCZs5RZuwULClsLB26imfDnECTaA8g9RXT0RAo=
X-Received: from wmsp39.prod.google.com ([2002:a05:600c:1da7:b0:442:ddf8:99dc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e25:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-44c92a547bbmr142010215e9.21.1748427500382;
 Wed, 28 May 2025 03:18:20 -0700 (PDT)
Date: Wed, 28 May 2025 10:18:18 +0000
In-Reply-To: <20250527-idiomatic-match-slice-v1-1-34b0b1d1d58c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527-idiomatic-match-slice-v1-1-34b0b1d1d58c@gmail.com>
Message-ID: <aDbi6i9xWWRHaBGb@google.com>
Subject: Re: [PATCH] rust: replace length checks with match
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 27, 2025 at 12:09:36PM -0400, Tamir Duberstein wrote:
> Use a match expression with slice patterns instead of length checks and
> indexing. The result is more idiomatic, which is a better example for
> future Rust code authors.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
