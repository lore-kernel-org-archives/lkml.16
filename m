Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EDB1FBE9B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574271; cv=none; b=hgNJ8yVuf4voby+KYLPBYl+plEOr2Nk+SvIIyFObsEwUQVj3nitejsP7k5xvBvwB8ScZ3z5uGm8cQzEn6BYVQA8W2v5iU1158erdAeB8DdFnPPXBqWr7qPXZIOgc+9TUZ818qjpWAx98kbXRZEP/aATsHhZxPao6axPzqod39iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574271; c=relaxed/simple;
	bh=YZvdJoCzVjHsxT40ttPflNqCtnquMUzEPyDKK26T2pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRI+4MAorFy5JAGO31yWjz0Mgr/opGl4S7JmxaPGwqxZYo5pPF6Q86vASsEy6nAzZh/0nKm+x4rG6VCw13KLuqdLWmsWXHH115MlCnEcOQoKtjeUSRzcLcSqbc4NdGsOAR6vyvzvhG+5c6FUj/g3zX5lwLSxAaDKIylWXPEVAZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TWaOm3sA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TWaOm3sA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so41572545e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738574268; x=1739179068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZvdJoCzVjHsxT40ttPflNqCtnquMUzEPyDKK26T2pw=;
        b=TWaOm3sADXTGfvzGFsMxr+eezFyQw1Q+mwViUSw1TI82eYl4lPM7CSa1LAR75Z3B6Y
         yPzP9qQ7vjBszuEUnlCh+Uhc3fazv9xzSCVXjRvjXtA9FYxDyKrG7XUKS/m9Y3ZWPM+U
         Zk/qmvd5Bjm8xRPFeTtkigT0oElAGTe+zK72THHKQrxaSCTRBxNJuDH8+bp9WBJTZIQj
         jdbsbk2OVOijKoJz8GyausqItd7wT9TAOdVElD3XTsPNv25t4EX3RYH6fln2GxBhFaOK
         /7bpO+VaBmpx8JT/uQxmA5DqUA9X/hnyNw95FHqlv0xsF4X0zcVnG2dSSAWHQATvzhoZ
         wSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738574268; x=1739179068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZvdJoCzVjHsxT40ttPflNqCtnquMUzEPyDKK26T2pw=;
        b=OkkgZ7AHzHgU1AA6pvsahmQkikYAEI29fAcBwsC3pKQc6boqJcVTzcSSnG8ksSpcNC
         kuI6m2QLhyjdKE26RLsasNQQ1ybwhDjsGxwuDF3fD8ZGSV7KtGcA2HhUK4gOqOYfup7z
         03rcSQBho/TuHx2RqEy2ou2R8o2KpS2KhQUtK64G/ZyyGoCYyK13F2AfAl6eOcobzBmZ
         8/8pHW1nDSuTb13dIxWnh3rrXPWwfNKPW7z94plgoFFaS6MGmID1Vt1nCnkXFoyOPOLu
         3fe5/V9pywdsCp88nPrJXVD50eWMtFUY5DjW0LdEsyRVsnKz9Uc0fZdh8dht+cnl0hVC
         CAKg==
X-Forwarded-Encrypted: i=1; AJvYcCXfERhHbNaula9SqSqxYm1NVjsOVBG4DIaTXjAB7jMp/LUpXyb3UlyxZvZrDRE4H/SL6d/ZDityFtotQEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUhSFV0aIt4F0cU8RzwA7uC//3GhYJ3YodkgHdN0zT7lpbCsQu
	HQPjYOwrec5mO/tEAgzNP+E692uSwhppgWPUwuEIvhnZF85trq+N12otCkvMt5UBuUVOxT9grM1
	ZfwFL8vIvJsOpY2MrNKsVTh9ZP3lIxL+UP447
X-Gm-Gg: ASbGncsBYSvHN+eaNDXRZMCTOvkPNjAlO3mB2+0dqDynL3hfpPCB/wU5kAFnzISGu+Z
	wNxNyDG6oZ/329Qp0uXa1xvuoGISnKidpwCfjA0CfugU9ePyFCfLb7YMECM4bF+wGe2AZxefFl+
	UAzF+o19AKI2WLOb+8prlfRuhv
X-Google-Smtp-Source: AGHT+IFc/1AuykTGw2Qq96Tvv03ntnD9n7SFRLhjQXSqvolNCxvTm+SCCbwciWNaqMmYnD3m8ACiqaA8EI8pP0CLNkY=
X-Received: by 2002:a5d:6d86:0:b0:38a:873f:e31f with SMTP id
 ffacd0b85a97d-38c5194d20fmr16306574f8f.1.1738574268194; Mon, 03 Feb 2025
 01:17:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net> <20250202-rust-page-v1-2-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-2-e3170d7fe55e@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:17:36 +0100
X-Gm-Features: AWEUYZnHBKgHkqPgFSXj_rkUh31XGNKQXaliK-ukOAh1dOlV4j6E8lRPRejB3OE
Message-ID: <CAH5fLgieTeYJ_prMX7K6eS63ctDwT+NBYrzmOakbNGBjuXA0kA@mail.gmail.com>
Subject: Re: [PATCH 2/6] rust: page: Convert to Ownable
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> This allows Page references to be returned as borrowed references,
> without necessarily owning the struct page.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
