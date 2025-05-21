Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4853D239585;
	Wed, 21 May 2025 12:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831127; cv=none; b=KqCGgqH+ESnw0Dkqp9GB9UEhNttMGn6ZQtajoY8CulqTwSJOiIEUtQcTwZSrSW2lveG8p8pe35KR9wjLM2OqB4hTSjjqtc75XfTm4VJvPpxeJCSVVcte9rFX+ZPxQZdH68yNFXBmJpgIrcxlCWnRIv/dYltinHzEdL8xF9CmY1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831127; c=relaxed/simple;
	bh=6ZdXiZbut2vssI7XE0CnLMkSqRY5CuZmJFRIYDBsgog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1/RQ13uPUB4OpatUry0Ft/+z+GXnTs2tTbknNFjtdRtptEbt4vhLgcgbyZTg4fYDKiaPbHP4pCflSoaLJLlsV7hdyBb9HFpcwq8skdmPAHMFqRHn5diNOyao8DQa/7UIkL+oszCXEaUqHkgsPXTXIGoZI6HLL5VKbFKVwgtPEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsMDijDq; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsMDijDq"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-231f39b1b7aso3299735ad.2;
        Wed, 21 May 2025 05:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747831125; x=1748435925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uT5IgsoihHLoaKQJwjexXAnLxwaDn/aaHgL5HJXrkvI=;
        b=SsMDijDqPZH1d2K5HjNOpTaqexJRM3MK9ptxFahNF8iqFU1I0f8zkvrzX3DIQkuZUo
         KPqcGAXswhUMe9Scyng+mkjQW7DTVv1IcYsR6UfaeQ79vuva+lva/bTQcTngzLAx/V4T
         CFYPJdFENfrERThBjrDH0Zq6O0j61hhPs0lsm5okwZPMLml8BwVKDCoqvWGnQDufmL56
         9253pJ0jfQhCWUnzgW6s/+p2kV0oDoTVXfXAwW2i6iqW3DgmDV596vyhRo0qTfdqe8dm
         3qWkSqma0ajw29aee40qnpJbItgx2FZv0lTQ1+CoxIkSY2KUSKX/7plIri89mE61SVbz
         FDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831125; x=1748435925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uT5IgsoihHLoaKQJwjexXAnLxwaDn/aaHgL5HJXrkvI=;
        b=KZXeymub0cHuWaXZ4Eo4Z9xaSZQN3Oj7bxINOmm3yFY7av/Pa4IZvXZwtL29vkxPxF
         bIDg35XIHihNFNSXv9P7vHeyh1yGyn1PPmoy2VCseunO8zl0t7hpItstm3pf3w4UVhvQ
         4cu99mIK9UbEW3aVIf5uauczPEoUbrl/fNAia8TvqWUie10JhZMZdTxwFhFJA9IYjf0i
         4brnMy1KtqAtjjGP2rEGza7C8evLqOMh8gAt9BEdvLblpj36ZdYMT6BjS9whfG4Ewk5Z
         hWU5bOzPNPnqqD0emHfyHjuqDG3DU2mNIYoz+pBr8uve0caNd9SQbQXMuJCHT30tjYkT
         V0+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+Sz00nVXNyMHNOpDVIeXMKAEBhtln8x3+JshwbuQnrM3ZNF72lfIuN1NCtXOzdNss2R4c7hPPdxoH@vger.kernel.org, AJvYcCVl047wXtckoUQ1Zaa+7YTfFEd9yNHIRl+3dq067al2nCGH7Lja9xQlH4SSWa9CzGjR1YhYCBdQVdsg+qp7@vger.kernel.org, AJvYcCXyXLOKNcJPqfgq4UJvNVnuB3YPIZ7X4QHIx0Png4ILlWtb9hbwqUE0UonFtWv/++SenVrFVDrtJ6QkEu3b0+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA+gm8K7f4YVkVnSHMiD52DgoedB+oZQgUbqH99CoNPZpuAtKd
	646X6cgbWHTsuwGYbZEkwIY8wFmtcIZZcNgANigWsGhWqpAA2Vgmw2W94niFaFaqKL7GvT4K/CM
	uKgaB/++C3++2//G5Fno6BZlUuvoXYBQ=
X-Gm-Gg: ASbGncvPZzcn/+odFQX7zYWiiMdzFJbGFOCu8a51c+RVC7kpF1t0PTdpOk5s80NWPa6
	5IBbuh8D+ujTqqYjX+7DK+WLRYW6I/qrVQ1uyPaeKfs4BUJGuFyaUySCJJf466lwkFGmYl7vX4G
	XSG5nEs7jxB8je3upXzkT2d4lPemyfyxQr
X-Google-Smtp-Source: AGHT+IE/6s3DdduZE55s6moLpMoOVLOUu/sACPI69W8T+jPZcb/IICwWsq9GTLLp6Y1Z3+rRCNPJl3YXQCsmdv8B7xQ=
X-Received: by 2002:a17:902:e80c:b0:224:216e:38bd with SMTP id
 d9443c01a7336-231d43b7fb7mr109835215ad.5.1747831125323; Wed, 21 May 2025
 05:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520200024.268655-1-remo@buenzli.dev> <20250520200024.268655-5-remo@buenzli.dev>
In-Reply-To: <20250520200024.268655-5-remo@buenzli.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 May 2025 14:38:32 +0200
X-Gm-Features: AX0GCFtICJ0nwR5mFfsQRZVtsOaw0r6Cl2-RwxXHJ2xg1ZDnBuWKs5x1GfTCc9g
Message-ID: <CANiq72nJZw=iGnetGSU5g6UpnfTkfYGJtHteG-BH1xdAObbzmw@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] rust: device: Enable printing fwnode name and path
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 10:01=E2=80=AFPM Remo Senekowitsch <remo@buenzli.de=
v> wrote:
>
> +                // SAFETY: self is valid by its type invariant

Please try to be consistent with the style of the rest of the code,
e.g. use Markdown in comments and end with a period (you do it in some
cases, but most are missing).

Thanks!

Cheers,
Miguel
