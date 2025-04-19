Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9219136347;
	Sat, 19 Apr 2025 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745054758; cv=none; b=syqSzor+vW7ZmxB1RDTnbJylMdUItrWDeSOuCmvCG2z26OGWs/zRjk7sYItpQFIICISMAuoIaUvZw30cLbqTktmyHRNt8Z5wKpuR9Yxnq4R/Fs9sqA2XMZxqw8p7vAmGL9lrfD5QpwgcmXqEJR68hHc4xjvvsmWyZ27O5loWqM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745054758; c=relaxed/simple;
	bh=TZdoNAYahEWYzR18GBeCItLCg4i9XGlE7bThwgobk2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AM7yhjR/9aOCJwTcjmAomNwcszrkWCbx5rSnkDE/4d39LBkCUG1GwuQohjydrKBIJNQaApUPSbV5ZtsQTLeAOIusUzWUhDD5D6/59Cu3vqoFMBVN4sB8oFAP+b/cqlJ/DvKFObwVbmwGyUtg1xBDqNJBdWdqjERzl+IX4zujc20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQkLRe6I; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQkLRe6I"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22c50beb0d5so3885345ad.3;
        Sat, 19 Apr 2025 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745054756; x=1745659556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZdoNAYahEWYzR18GBeCItLCg4i9XGlE7bThwgobk2s=;
        b=eQkLRe6IOGLF+TCk6YbsOkIfX6PD5tYtY0OfB+hFcpD70LKIR/8VLTzpnD6bXaAOdT
         YULJEwosHuIt54Ugmd/eLlVQ+bgEfrAkdtAf+RzyCkwEW6d81WpE8KfTBNxLf2OdGk9A
         Yts9P5LIk/fJLwvXZooF0Fm5OE0uQAQcftBe7aqRU/70eVtNebUZZn5eqODUIpWRuGjw
         qVHaa1ao+Xx9JQN4i+Gg3GdDVR8ikk4rU32a8hMqIe/D/VNN/xA8fdmXIV4BwzQGTBRA
         Y9+MFvzO2uWD3GZO0u8XMuuL18coGcsWPrz7FI/M/ALFye8IUYw5T2JyVEF5Ef4VOanm
         ogMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745054756; x=1745659556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZdoNAYahEWYzR18GBeCItLCg4i9XGlE7bThwgobk2s=;
        b=k1pX6JBuy5UxfocFEFjs9kif3bG+EVd3cD7N/sb9uBDRM8iFcfkWfYE1pI7nAOO7wO
         oLVvL6SSux/c6mqb6h0gBBOEPGxVqQ7q6vBEORM83QnDqlLgywhA9+sO8RY6/3iR7NlT
         T0VaRAZRfmXjAGuaxWXXT2XnxFLTRGO4nk+MVbDkhKN8phfpTHbQou8aSHOptDBtLNmc
         WABF4/BetUUJNEOb05DH1gyQQRXp4iB9lVExZ6yKUmCNvItFfzR73sUzbDr16OHiVGaS
         5TiXQhSO04ngNvJua4O07Dj464NHnZmBj8gqv84v540SkorpgGS5Sam40yH6B7GEdhZt
         dZFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh7Xgoi6Q6L6PV3sRi7FE5ePabpbfZ9z3dexX4M/6vMsRzsWezHHCsUDFfyLRzx88Oxnwj16doKKIEzjo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4kyOz407hkcdkjFrWQhxWnvDUgw5awIxafsN7f7PcWcCVyq+0
	14SdP0cvlpp663gjIwTjfD2jqmv1OACBUgLvSeBFwwMeSdQSBKRh9BYnjXINPp7iiYvUZrss9yU
	9fW6l+2y0lfg/HW5kjw92wMfeKNE=
X-Gm-Gg: ASbGncsw0wSYdYOK0mECqgxtYQMGqamaxzw9nKXqsJpYFkLcWT9AxJ/tgUbkhxII0xY
	qmlteDp8azZLuMno9bwy/FZ6Fm3x7a0AioBNCOl7agNHCcEQ3v1a+dGesxnrM/uhd31m0YAUDwB
	Yo+QSP2dla6gmoPDzCa/Sd9w==
X-Google-Smtp-Source: AGHT+IG4hXPazy3P91oc9gvX5jFUflCiyLF66NXifpcx/r3mguV6YMs0p+VbxMefTz2lh+Cl1ZrP/T1Dkko0V0cHB88=
X-Received: by 2002:a17:90a:e7ce:b0:306:e6ec:dc82 with SMTP id
 98e67ed59e1d1-3087bde2b2dmr2951668a91.6.1745054755969; Sat, 19 Apr 2025
 02:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1745019660.git.mchehab+huawei@kernel.org>
 <9bbcb399f6b6f68e6525131fea41dd0fc9c6978d.1745019660.git.mchehab+huawei@kernel.org>
 <CANiq72m5YW1aL+mAg4tcUwB7bKFC_4ZSGyeD8Z+mKzyPYG830g@mail.gmail.com>
In-Reply-To: <CANiq72m5YW1aL+mAg4tcUwB7bKFC_4ZSGyeD8Z+mKzyPYG830g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 19 Apr 2025 11:25:43 +0200
X-Gm-Features: ATxdqUF7mDawrB7wa9TuHojlEPRSvy76Ra7dLTYWbpkh8U1lDrXkcyOBVjxVDSw
Message-ID: <CANiq72k6YQ8p7Rbzpr7sCwLdLAVE6ZfNWhzOMVa3biTc_ytaoQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] .gitignore: ignore Python compiled bytecode
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Li Zhijian <lizhijian@fujitsu.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 11:17=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Should `*.pyo` be added as well?

I think this one is a no, given even oldoldstable Debian ships new
enough Python.

Cheers,
Miguel
