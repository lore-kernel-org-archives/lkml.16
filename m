Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43AA38DE9;
	Wed,  2 Apr 2025 15:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608345; cv=none; b=X7TAT/HJtSPb7ZuhEdFxw3aLqFj6+3cCDcCnGxs3SKY/b5/pcS8NEnHmxprotl+vrauqkx9kStmrYCRKq9S/3RN0MK5FuVW62aSx8CR0AVmeaxlrruuYRrgkHpPd3pYH+M2u1qGeSCLyFJkcki3m+JrDwRPbtZgjZTkAkHIvChM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608345; c=relaxed/simple;
	bh=n19qXT8nqVA5II3UQenm/27pEjVplbcXGXaSK8/JcBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmSUCuDNy6M7DcDsAmkuk1/m0ALyZpqF935JtHNkBMN74pJQNA4MlDZjijuaDEB2kj0aggNfyxcXL+XZZEVxT0P8DtYwp901KcynnHAaPQMCjjsKHpjjti8Xngutt3ZcaoXYPKdXE67wsv62ZPOACGdHWuh1kFMTil2ql4+PbPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/BVGD/R; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/BVGD/R"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so1520960a91.2;
        Wed, 02 Apr 2025 08:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743608343; x=1744213143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n19qXT8nqVA5II3UQenm/27pEjVplbcXGXaSK8/JcBo=;
        b=W/BVGD/RNuMmip9QEiTzWDySbA/eyZaUPTLNrR8moPsDVqkjwjOVGid4gaLafuBzp2
         PfBN+T1uFyS4mM3o83UUVRn6PFalkRH2JkXK5VAnMWih0RMdBPysdgxGCuTWiCmWQ1ZJ
         WWPNZX/FJL2wXqeFd96zngcFRXF4FZ447NAzxCSj31+w8qj1X3KfmYfkK6zOuHQuj58m
         d9vxkaRAu3IFoprMuZfepIyGM90vq9hJIv4qteHtXNg7dhXZHBNy0fkPbpp3hZf77QIg
         KWRnFxx78+JkHPtXUnK9QIvVuXlhK3vgYBC/FW+nu8Rkf6WL4AxhpavRhxZG2pZp+Rpx
         CUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608343; x=1744213143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n19qXT8nqVA5II3UQenm/27pEjVplbcXGXaSK8/JcBo=;
        b=b66hv/NPKiyzU6kHSX+gpPROK3SbKTqaPIuyE9zC51epeeSyRHggHf7aerCho1DFTt
         8ELuCDMVhOUpDppRXsR0TSDJqMM619dz9iSzJJOhtI+qipRfYG+saKz1Myi6+2bYTtZD
         t+dbFyfiTXo7e799NvjeigINMsp6iUgW2SP7qo0zM1M7R6oRbyr05xlqi45JmR7HfRyR
         9jPMmaSgc5a2VY5cCrDeKMRW0hRV/kwRDPgnILCTKyoP1C6TIBwqhGn+dGOqKtWAi33z
         o4wxFVIgiwvTd8bJDUenJ0fZXIKndfCl/LqCJWVUFoVJBchQn8y2RHKidHmbv+peyTZb
         GjFw==
X-Forwarded-Encrypted: i=1; AJvYcCWO5D/Kau/lhjCXs9egjel77ySKiv5vcuF1o7KgjWCnHtMFoGUI4PEMLZAPcodDCcMeg5W9ucnycnurzjk=@vger.kernel.org, AJvYcCWxsr9yrjNyXntOavW45vX2XClByhp88zfDwsqSJ7SLrGPM/qsU6bgKd3cusUyMMowd+i9O4KtWYamZIZL2NNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0hKbaPtZ+LQ8kwelqPGPx/UAQqHu5C1MVCL0JcNLUBmE9O+9M
	0ycJ0QUqrHm9qLYtZLEN/czz3P/N+M/3WKkeSYGhcxTeJ79nd/PdfaWJyWafep2h//xLCUEA+Wd
	Ro58WYs6JLEScCGM63vRKNbU1j/8=
X-Gm-Gg: ASbGncudxhTDhDbme+fliXAL3drr2qHjSqyNNZt3hoVCDEr0QnBU+W0OAUqD+vwmHxO
	MGjRuKdY+NtQXpCsZ2LHkLxGLdb0OmvH2ta5FPxsUH1aRIRnvCBhtd39fytpUIiOqsTNbG8/Ptg
	JwJR0vqq8fuMui+2TCM0f82kxIbw==
X-Google-Smtp-Source: AGHT+IGdThBbT9D1e9wo9cxVw9M26jf/z9aLIXDefwgYqy1gKujpsooGwG4juvAqcqihwDWT7uQzoZBOdiFux++8toc=
X-Received: by 2002:a17:90b:33cd:b0:2fe:b2ea:30f0 with SMTP id
 98e67ed59e1d1-30532139e41mr9850519a91.4.1743608342843; Wed, 02 Apr 2025
 08:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743572195.git.viresh.kumar@linaro.org> <bf2d798034e5f2c6fd5fbc561a8bd19431e6a9cb.1743572195.git.viresh.kumar@linaro.org>
 <CANiq72nzrjh6S2bh0GQOKtjFqMcDzrBbtSVhaL-i1kja1zW3HA@mail.gmail.com> <Z-1RLYyTE7pxAyzk@thinkpad>
In-Reply-To: <Z-1RLYyTE7pxAyzk@thinkpad>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Apr 2025 17:38:50 +0200
X-Gm-Features: AQ5f1Jq0_68uMmsY0SSg0Ry1X7VIm2Za-NE5vBZfdCznf3G-qgMseLSQBocRwE0
Message-ID: <CANiq72kimyQHyYWtpMF5GcQ2HcT93gXhzBhi8LU5efSOYrTSag@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] MAINTAINERS: Add entry for Rust bitmap API
To: Yury Norov <yury.norov@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, Burak Emir <bqe@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 5:01=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> I didn't plan to, but I can move the bindings if you find it
> reasonable.

That would be great if you can do it, i.e. we always try first to get
the maintainers of the C side involved.

> Yes, it is. I'll add the 'T' section.

Ah, nice, thanks!

Cheers,
Miguel
