Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B821DE4E5
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677723; cv=none; b=VoTcCZG5myBtOEAmAWrPvY7e67tFgAQnJztDxuKsnYO8q8A5MGLE8mvcGgHptvK/Vbihh2PTfQds5mAcBreCwU6D5lUgD9RPhuba8A4a2AkBwEaoV+Rne5h1Nj/+B17z4vfObznLWoEp12A6Q6hfsmKHLcSnXpxoKF83s3wMqI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677723; c=relaxed/simple;
	bh=fmV6e2SoApJL9fZft1h0EhXTTUFZizOKyTsHJ/sJGdI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bG+dgGEoZtLjTN4SQGazqzYbCB2KRxqZrQxe/r4VJ73757lAQtKCJo2/px5qaQ5vIqIjWbp4aPIUCyZKwE69Cv9ZdnBoEl/QvHrvQmrmQ1ipYw1RS3U1Zavpy9iZxT8Pt0iL2Gs7hYyFZ2gu78+obdab/nb+2NMDl4Xo1e53ln4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VlK2aIKl; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VlK2aIKl"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a364d2d0efso1433979f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747677720; x=1748282520; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7VPWSW12tztpw2CQM1Lke535S1u5tfd//R9jqCHi/nQ=;
        b=VlK2aIKlPEYWf0lue/teHTQKQwZQJF/69Eng2VF4AT/UqSVCy6GnrP+rIumvQ6wlkr
         3KWjcr00Rz8Eat2yrRd+KXBJmMShoiimMbGgJO1svfHnIpa6ziCvyEjYBfqv76hGdeWc
         C3RE6/Or+vIB7g+/XvxJQThLbfy8yAdZwnqZu/QL1IKG6KMNKsMvC4X8DfDS/YUbTz10
         /BJNroaVFwiTaC7zJC+gReLTtrP4vcn932PmJgtnnReAfiW8kL/+B3JfNNREz/QhqrH7
         C5Z/Ko4ZRdZE9cXsdeQFL33TOD6w7exFy7soNtC855nYhFJNAWWv52GEhP7/2VE0CNPr
         3Y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677720; x=1748282520;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VPWSW12tztpw2CQM1Lke535S1u5tfd//R9jqCHi/nQ=;
        b=fDOifGEO0T2h2iDUpuG9lOQKDlJrszybY4ocGPvL3EJoMCZCE3PxuaFSpbvZf974Sh
         60bVb/Z74UOIcZnqVvN5yXjops7rmKq94mtNwVxlz/CH7LxAVCnHHZ8N3Rnyp6fI66E4
         llSQ5vcE64MtxpXfY+34nid0yCTiXGIXIw3cUnbhRknqSExgF9MRj0j2DZ/CTOZ4zmta
         oPrnxEFkVRIhCZGjPlshQ1DMUvxg/J3cMhf44oA5a/rezGeViHeXPp/mVOsDzSsicMm0
         HnZYTGIrkdhCeEd3lMWMvu8jvmKeGWKOH8bB2Aloj91qFs6xpTUP0i5OoGeDXNLGXlX0
         zn3w==
X-Forwarded-Encrypted: i=1; AJvYcCXEvQkdeW77KkiHEqsuNe7Y5iNrh1bME0o2Xcyw7IzkVmmrJg2eiK5rMkc1weOVJxBkbrLIGXPUHRbG7TU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKHonv0CFDQUAhB0Q+o7DdV4Q7Ynfq5qigLbGG2g6LWwtNMVMv
	gGPg2YxjJwumEissKzXc20LVDr/cbrkr7iKJYK0d4e44enBBq8LyvrwlxOD8ybWqExXWpc9vCqQ
	es94L8ug+z2pwi+Q5yQ==
X-Google-Smtp-Source: AGHT+IFJS5J+PnbHa1RGDDnQqAtZtergrw5iOIz7IkL3LlRlfJiUovmWWT/ojC2/wXOc/jLurPsAKI6k8uRKjLA=
X-Received: from wrbfi18.prod.google.com ([2002:a05:6000:4412:b0:3a3:5c04:8b60])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4310:b0:3a3:69ee:f4ad with SMTP id ffacd0b85a97d-3a369eef6femr6547198f8f.22.1747677719934;
 Mon, 19 May 2025 11:01:59 -0700 (PDT)
Date: Mon, 19 May 2025 18:01:57 +0000
In-Reply-To: <20250517085600.2857460-1-gary@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517085600.2857460-1-gary@garyguo.net>
Message-ID: <aCtyFZwt4jGXrL54@google.com>
Subject: Re: [PATCH] rust: compile libcore with edition 2024 for 1.87+
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, May 17, 2025 at 09:55:59AM +0100, Gary Guo wrote:
> Rust 1.87 (released on 2025-05-15) compiles core library with edition
> 2024 instead of 2021 [1]. Ensure that the edition matches libcore's
> expectation to avoid potential breakage.
> 
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
> Link: https://github.com/rust-lang/rust/pull/138162 [1]
> Closes: https://github.com/Rust-for-Linux/linux/issues/1163
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
