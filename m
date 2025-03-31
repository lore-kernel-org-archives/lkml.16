Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DE010E3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 00:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743379654; cv=none; b=tt3UZ5MyCsqEl5tMQHlAWPWwvzPphsqOlLiDBrmYaqUUnF1rp06ZGY7GS2EO15flIczuahwnHRxK96Gv6IW2w1Z3OjqInWpcL6RgDs2FGd4780Q+hBdWXeduMFi3OuWvuItyZoMA91S0dAgXa+VNPRiEjLpP/605x8ysMtDcDr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743379654; c=relaxed/simple;
	bh=QeWzRvs4mUn70gMMNCejW9cBbyYLrlw+6qM4ca4Tdjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aI7MRvl7yewOGlENjavQYWiX1bP/wl1Uzm7ihw+08V7l6SMq2sxeSuDkC914HjmgDNHFWhdsvhOlfikZ+tVHdDCxjp/feqljmn0chVAnpsuU4VmCpCTY2r4TqOECpjMiCXoN6KLzpH38NAt2pDrV7lDXqk4N9yvup78UYyT6xyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GJYW47SO; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GJYW47SO"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac345bd8e13so664893866b.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743379650; x=1743984450; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5WwU3ZZjvC3SjVsCAB3jUkV4LMy/pxS3elhdnZLt7Oc=;
        b=GJYW47SOg9J/ImY7LjFssS1Y1030tmPDi/56epJjpdyAtQUWWpWI30YWTf16l4+e05
         f8xt9+77cSFCw4huqh2BDQB33mWvRQGkl2gofv+LPR13SgZX61WlES1MoOgkUfHXZYH5
         QhYHxiY1udgAf7kR+hKOQc3WPce6J1uYaLvJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743379650; x=1743984450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WwU3ZZjvC3SjVsCAB3jUkV4LMy/pxS3elhdnZLt7Oc=;
        b=lp2FVu7hQ3wRk8bq5HzSezLghb2ujrelhaw5be41P5MCFUxtkM9jVLPIB0iiV8iKkP
         2iqXdU6QhrAML5Y83ntnB0lXr9G04cX2XPlJszKDU5oMIL1vkXiEX3sWLDFNCJayK1kH
         fgTtbJ/mBPxaRoaxAmUXrMBP/VOgP8++NqXWizMKOOvtIB2aYugMXmWNSIejAkKI6xuD
         hUGwH3BQ3+BVZZLX35B8ZDWIMiZV+S6wEL6Z/FenpQ0Jq5HX1o04xO0YuvnSH6q9gVCX
         cuYCBWK0D0Ec0GzgroHtt2oNZq78qoCSyRBtE/SbJS65qihhzKm7okbi7RYDfs0aD0Dx
         OwOg==
X-Forwarded-Encrypted: i=1; AJvYcCU6aET7C7PkdGV5qdu6JN38ZZNQPglJ5fI3YOrTM7nSfU8F03ofFPJdajixTlmB6AyINneGfKa0qKFuLq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX/k9vyt7F1B8dWRMQPHTeVC4bfOElnENkkwKxAlEi/4RecjRZ
	mVBlhdLhUCSmGv/ziNc4SDOiQVTXnNagElrrX13Ykunqtsf9ZWly7Im89cHxSkuhb71cc97eEcP
	KXbM=
X-Gm-Gg: ASbGncuG7zdc9jm+pjPAp+CL6+puwG7Z1/tfWcH+gy/frG0p3/sSHvaX8C/kozJfdbf
	ivvE84qgDdD5LBW2oJoAW3aIDzCbsCukO8+LjWNg+LbZxT85wgH273TXQw4sPGMrtQ+DxIMKz35
	kZkm0JTsrUIDD94UQVmQvzYcrpQaSoj0idjZAxoEMsGN5b6P71+mvt/fgnFDOzq0HUIFS5keCNY
	w8Mz2p0H4qGXcD9rik6ZLGhSyEx8RwISK57PUC+l3epSFl/LU7fjKkcWcuwaWVaw3KknxU84sN3
	nLuV2NRYctp+E/va6NzuxeaQEO/KN1jcNBm3D64p/pKhXAuTkMbpNtejrqlFeWt/nbMgWNI67wv
	fEf+QC8ampkq4f5ciuMc=
X-Google-Smtp-Source: AGHT+IEnpeyEggBbRjrFSlfp4xchc3OPX9C0xsktHA9DxThh36NoT4eFKIENMIiqAJvcJqAJqilrFQ==
X-Received: by 2002:a17:907:7d8c:b0:ac4:5f1:a129 with SMTP id a640c23a62f3a-ac7389e3c61mr742986266b.15.1743379650323;
        Sun, 30 Mar 2025 17:07:30 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71922ccc0sm542881166b.26.2025.03.30.17.07.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 17:07:29 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso6412026a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:07:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVW2xwSSHe7f5M82TBxlE2ztQPAULfug1azK6UOmGVGs8nl6O6uZqPrEvccS4978kg/4lrF5/eUAQLArXo=@vger.kernel.org
X-Received: by 2002:a17:907:6092:b0:ac3:c7c6:3c97 with SMTP id
 a640c23a62f3a-ac7385ec8dcmr643913266b.0.1743379649049; Sun, 30 Mar 2025
 17:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330170535.546869-1-ojeda@kernel.org>
In-Reply-To: <20250330170535.546869-1-ojeda@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 30 Mar 2025 17:07:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjpDpK0cd=tBk2t005nrddL0hXRQ+h+iZPHfVsi6qQY+w@mail.gmail.com>
X-Gm-Features: AQ5f1Jr4MnCw1Ik4xYg0StGcIJ_tUfwA7pQAW0iRnq6hvBG4t9EoTLGk-5o8sIQ
Message-ID: <CAHk-=wjpDpK0cd=tBk2t005nrddL0hXRQ+h+iZPHfVsi6qQY+w@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for 6.15
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 30 Mar 2025 at 10:07, Miguel Ojeda <ojeda@kernel.org> wrote:
>
> The second is that there are non-trivial conflicts, in particular a
> semantic conflict.

Thanks. I decided to try to do the merge on my own, but failed. I came
close, but it was good to have your example merge to see what I got
wrong.

The pin_init becoming a crate of its own, but 'pin::Pin' being in the
core crate ended up messing with my "monkey see, monkey do" approach
to Rust merges.

I'll learn eventually, in the meantime please do continue to give me
example merges and I'll use them as training wheels.

               Linus
