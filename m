Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1099A299AAD
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024784; cv=none; b=aanryxFkOdQkh1ZwfFfm8He0Eobb89fbSv6ApbzN8pa2toDPNMmD6wpUHsvigFl2ayZlWFCW5qg9IEMTizd3dw6qcQTTYs63J/XxMSXTzARo1HQ2eQIsvLxn/SO94LJCMzrY7caxcO69780St2wHSqodQzwVk1WoUL94Uuhv8Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024784; c=relaxed/simple;
	bh=dcGWOSc3/Y0IeMwL83lxSdWRdQQX44QTYLONnNt+Flk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=khhmy2fTzoiK+e7brSRacSWfKT7JjdNJ9BSDV7gj6jBYqLNnwV6EKJT16l/6qoLm9Bi/lAmHKFDnm/2OjvP1Qu5mvCOEzlN0/Kv1aek6gi3e1mhZpOHSwXQlyuw65XzjzO9i6aaFoO1bG0pj8C1nuxYYgAD285+OoI73Y5lkspc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e8w7MY7Y; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e8w7MY7Y"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso1579825e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748024781; x=1748629581; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eIVsk3ZBOpVpyi6iCyVjmqPgvnJwX8qqbjIjeoqWPQE=;
        b=e8w7MY7YyhTGNNvqe6dX0ZZbKbVLT9PC0uVUJIpOm+MVozlfyR7bVZ3YCd6Z3EqEXY
         CrGD5paR9mXTGYdkuTKQfwTCSCJV3uXiZ/NpgeCDJqLNHYdUk+GnAn2PMaOx++iN7FVv
         n4eMYgZZvHcYSs+f9is1KHeSLT518fAvwdiVa/Lt4tYRFXTMI8sVuyuJn4fDJ7GMUkjF
         XRpK3I/SiLxVSlvNYJnDYgVxjN3T5evVG7wi38id8CQE4YsGCk1lPvDPFmRuGTf1asEN
         GeBO7FN2cBF1eFuDPlKIKRN8CpG7CW0i9JTeBf47Yqki50u/+mKneNAZEUURfuoNcllS
         mqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024781; x=1748629581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eIVsk3ZBOpVpyi6iCyVjmqPgvnJwX8qqbjIjeoqWPQE=;
        b=vEAfADiw53lpZs1sJtdjQ3THWb9V+4wOcYRrQbv87p0OMxdvIvYO08zxE1ndpreNTK
         YDfYV3+xZAKukueC7VgW057SVk5+HpLMipQOh+gZDAYs6wEGtIMuTuYjMuKIqyKqGHoh
         yUnfGWZ/m4t+9jTLYoyUXl0MT5mveffaakJTa940Y9AYyLaM6yaU48M7BkzajpeT851G
         eZ4GRHKWe9jGaOFgwEh9YPZRWUjS9zg2E+SPxzC+JGqsW3arinj95RssoQ3UkXr+ID6A
         JIuENyFslFUS9HsQQGLxGPC7wX6ptFlXpBQnt3Osp6oG+DpIm+3uZlm5EQGtUHukFKY7
         qUYg==
X-Forwarded-Encrypted: i=1; AJvYcCWWLD6PnW1jO15MyE2KXJNTDGWge4RGjc8wjkJEYhqMWDDf+xeGlLhju7PFVUKbTpPi08wBF/k6auSEKto=@vger.kernel.org
X-Gm-Message-State: AOJu0YxovWHxF8pU5yLmmYvbO2ZxYpQiAhHTePOvgnZvhLPzOKlf0m93
	Cw4cUxM2YBRirIEoEEbkw4hV7qdMHcQvHX1uMam7w2TjzMQ7GxcBGYxcZ3qC3M2V4HQfAtFRkVJ
	ZqIT5UCLraoYlcmye/g==
X-Google-Smtp-Source: AGHT+IHTMFU6zphaK0VjoGf2O8qEZJ/Q9FuQYgLODKApHDtc9W29A2gMyzATSuySDpbxJU3+W2HrVpuONCDqvWU=
X-Received: from wmbay36.prod.google.com ([2002:a05:600c:1e24:b0:43c:faa1:bb58])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83ca:b0:442:f861:3536 with SMTP id 5b1f17b1804b1-44c7ac30196mr4983085e9.7.1748024781449;
 Fri, 23 May 2025 11:26:21 -0700 (PDT)
Date: Fri, 23 May 2025 18:26:19 +0000
In-Reply-To: <20250523125424.192843-3-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523125424.192843-1-lossin@kernel.org> <20250523125424.192843-3-lossin@kernel.org>
Message-ID: <aDC9y829vZZBzZ2p@google.com>
Subject: Re: [PATCH 2/3] rust: pin-init: examples: pthread_mutex: disable the
 main test for miri
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Benno Lossin <benno.lossin@proton.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 23, 2025 at 02:54:12PM +0200, Benno Lossin wrote:
> From: Benno Lossin <benno.lossin@proton.me>
> 
> `miri` takes a long time to execute the test, so disable it.
> 
> Link: https://github.com/Rust-for-Linux/pin-init/pull/50/commits/e717a9eec85024c11e79e8bd9dcb664ad0de8f94
> Signed-off-by: Benno Lossin <lossin@kernel.org>

I usually recommend ignoring tests rather than cfg'ing them out
entirely.

#[cfg_attr(miri, ignore)]
