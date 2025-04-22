Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62A61F1818
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315333; cv=none; b=tz//9LtmmL26ulLzjRUXbut+FJYXV0PR9IwBdtDWF2fmgA+Ni8PQwkDsavhb5Q7Umvof6wQq3tzZtEDBeaOKxcm3nAgRiADguumzNBaP/GrwCCCatY6RBOTjgZE3h60pq+PLCYGO8POl/klLrFJhUTqjS/2MFBAX9z519MQYoUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315333; c=relaxed/simple;
	bh=WVQDv1v4dOOQG6+a+SR4K8DVpKda75Ekqgvdi556yzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYBMJUQ6EHTQj4pjjXC5r5/2Pncryy+Teas39TIW9n4BgbZgwlckynkuEphICyVv0NXeqcZ2SSTdxQLTxmQbSZ2NrK9Hm8ABzyvetf2RFCA2cMU+n4v0CfwhnuBJok7SskyK9hGWYuDNLjnOPZc/JdFT8onZqx1Snq8ctzowyZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LAQdd6ia; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LAQdd6ia"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso23256105e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745315330; x=1745920130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVQDv1v4dOOQG6+a+SR4K8DVpKda75Ekqgvdi556yzM=;
        b=LAQdd6iauLwtGptgU3EaXluyARpqNNwEx0oriBBfFPUMlx+FETr1u9iUGn0FyvSRu0
         7a7nVV52rLycwCipIfCy3TjnJGjxdWmr9BJrHdNTRuR7slyRVTb6lV2lu0qGkWqaC4ut
         Kq5yamyH9LhgzSnZVd3VedBFQ1IWImF5HH6/a8suBiPqtOkz0LbcSzUmDjouzPw5VeiI
         /z5Mu2XLOzHwDtaf91fiyQdjgon6xj5Y29VIDy6vhg57Gv8xWGYkEukhTkj6l7p1VLfU
         sJtXvLwQceKsDlKB71W+sO1b5ybu+41b4VzC+HQ5oJvEk9UgsmpUxXuXvT6OXfS4vweA
         HWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315330; x=1745920130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVQDv1v4dOOQG6+a+SR4K8DVpKda75Ekqgvdi556yzM=;
        b=p6J59IMtWKRXbikODilhh/kjhvzuQlRjdiyqPenNCXa20eLJ4O604ut41L2uplnOKN
         fIPzPbTXXgNDsw3L0YIiz9Vgb0LCV2aAjObvXEQ95htECE3gOyYAQAPzyRYnci+IRLoM
         jtCEMyORi0CmFbwmwb23OK8IQn5TItaTCEiVCEjdv5IXrQuKnzxpx+ihkDBK8hIdmAWt
         8E+coF1wYz4+64MWBqBMuQgsJ9G1cGbNf46swj4t7hismVWCha0/RTVORmZ+6iGRFO+r
         AZ8QWhGNngtFzsjK89NBrbNQ8jGcHNdyCs+5u/xdXJSn0RJ50Z+zp88blpZkoMCFf4iU
         f0DA==
X-Forwarded-Encrypted: i=1; AJvYcCX1K/TkHMJAJUPZMfgks3cPgADm2Ku8dlCCS2LyS9inObtZllbNmsaAuhQRfGSmiYqwx4Vgc+J0fJP9Z0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTPm6SBvTyt2uvSac+peH3zNxvQT72hAPYAOatfS+KFAkZQ+Y9
	clL80kbxMu9JwRtQb7j6Fvpjzbl6PTK1EESy4XjFOadcEZNuXr/kJQIG2GEmQTSNmtElEdG9Aef
	+cgR3lW+mZ3EaV/6G+m4Y66A8gPpe7mAYTsJx
X-Gm-Gg: ASbGnctBVjY3+9laa6PfcBcoaVcOZsvNpJ5vKNvzga7YkJs6Vc/wCfq3AugppyGcC82
	+vRKYVm6YFcnwMUOI73CLTyFXM6x2pH/rSFoXesKi4gqORId+gE0b4gQYMBo0teJVZ4X5I1fHG5
	pdp5xvUHnGpGD1aFPQmsdxVxQ1frT2Ils+953cK2X/xUEqsK1ji+6r
X-Google-Smtp-Source: AGHT+IEgzaZFAKrzkmmSeUf1lXEalL9tzKY7I1llBJA0Efnayt0Uc3PwpU5QMYlM6qieyM/pL0GWbg3KPU1y1RnS3Ro=
X-Received: by 2002:a05:600c:4706:b0:43c:e9f7:d6a3 with SMTP id
 5b1f17b1804b1-4406ab97d53mr125391395e9.13.1745315329911; Tue, 22 Apr 2025
 02:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320-vec-methods-v1-0-7dff5cf25fe8@google.com>
 <20250320-vec-methods-v1-5-7dff5cf25fe8@google.com> <CAJ-ks9k=SxS_zAATadm8SZkfcY2OciYNaty3=WEs2iv5nFJRyA@mail.gmail.com>
In-Reply-To: <CAJ-ks9k=SxS_zAATadm8SZkfcY2OciYNaty3=WEs2iv5nFJRyA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 22 Apr 2025 11:48:38 +0200
X-Gm-Features: ATxdqUGsZpxo4hTBeVYFDjAT0FzOV2AQ03SSUmYtR0Xpk0I7nXbuFoofvKRGnJ4
Message-ID: <CAH5fLggaw7itWuUCHG8KBE4epTdWy3y+wtVyUk9AffM+DOTOyA@mail.gmail.com>
Subject: Re: [PATCH 5/5] rust: alloc: add Vec::retain
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 4:25=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
> Now that we have kunit in rust-next, should we make this into a test?

Unfortunately, the test uses the Vec::retain from upstream alloc,
which we can't call from a kunit test.

Alice
