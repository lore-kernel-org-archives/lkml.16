Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB6C1F5850;
	Mon,  7 Apr 2025 14:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037674; cv=none; b=WR8AbY6dMyfkqkFHMmiMF80TWf6YB/Lz0VOt2RL+G0XetqeoD28/z5mk1a8r2mcVMNFfHpM4pwMLGPq4xlRLppzBGJKA8UxIJZU8gy5ebJxcYLwTHZGs4Kp2au81qFgLk+cM/KDTL30eyL/voehYDuOcvWncUdvm4lnptdIR+7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037674; c=relaxed/simple;
	bh=djx/lkobo8tUlwcO3BW9u3dE+Zph7Qrj48+ZuppEceI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AaaGqvf7c0DfE4cbK/VHj477WdUGmRSN7mD5SGHJ2cksZPQSkeUq+FfaQlv+Dm3eVJs7lVgh2C8ptHXL94NoZ6X+sggJWW2i6HyR60ybayidTTV/DYV6EjpK2fM+5X282C7UJz/Id7H0ulcHq5c9QONrankJARx1SPkwV6MIThM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZy+Qku8; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZy+Qku8"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499614d3d2so5134103e87.3;
        Mon, 07 Apr 2025 07:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037671; x=1744642471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djx/lkobo8tUlwcO3BW9u3dE+Zph7Qrj48+ZuppEceI=;
        b=VZy+Qku8/OtiaFp9JAlU2YTzOji7vJe0eZvSktTJbQex2/J5qFfRCQ4sNSEWTIYwAU
         1loHHd1MjqkRNko8jS4sa5F/wRgMn5GgX7ZbTh0sPV96PjmRf2Lo6pBiGDXPs7JMN462
         rvz6BqqakI9Ktz3TM90ZjCCB15tMqjnITT0Nktcima938b6RSNPH+fBfW6YBs+Zo7PGf
         X0EKNO09XNmIri1uViwfnpbz49sA0nlrsF2h1wLj+BKzS+pb3xt4G4G2VYaNYgrvmtnk
         r9eXaxV7yg01z2QMo6Yz1yvKpHvARTcJwNRYblFlKhCx2Lt4B2w+lUOjds2dyhT/1pyY
         KRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037671; x=1744642471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djx/lkobo8tUlwcO3BW9u3dE+Zph7Qrj48+ZuppEceI=;
        b=ehDh43yZ0yIytejrrC/wbfR0qgmvfS7x+dpBxiaYUE80tYiNyVZdne2pRxvUW6wBuQ
         LSdLDcUcJGSTXI+kmx6bH+f08sWgPzvXXEjl2zI31m7/JXou0Yzq2TQJd1D6gEqFj6E9
         2tgBM3e+lXDzbehCOcNc6xx/wuvLR6xMm4T4XQHBltdeGCAeqrXgpS03sRxFs3WOudyR
         2PEm7BZzr1Jw6wbuxwCbS4UZ4udLxj8aKuly/T7yTBeFIhIPzgCGKHLMsXk2LYNEUPa9
         wNC8gvVIXKv6XSD0rjjKJvedDZX+UGGzmxnPssJJcp20LCCwra5cqAlDHkl32ySQpPcs
         iKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq2asxag+NRq+r+w19o2VdaFrmTGyEJBJ/8PGJ364RksXSZFNBIV4HZwrMG9XfGnzMSw1hWRjhI4JFiY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIzLPuKJVZc6sR8z29ZsQAhqHQzCVyWE3NL7EqqvZKG8ISvt7N
	YAz4he/TJv7e4U22t3fLHBHhB4eIPguElrYR2l3gXII4xdqlvC+orvHTW5AB98Ixkhil4zy7sAH
	lhFFGY79HcGFmcDznrjxhJIegHNY=
X-Gm-Gg: ASbGncvf0FqwCzumo2FOT2dsN36pL3VqWw5rnFN5c4qJ/pgWbzHbj9vqaiCdSH91hlT
	l8u4uz+RIQIOGmLEHG1ESMszU+P2tiTa1/mTmKL0ViqvOdHY+F5UFo1/TZIhdUm8MKjSFahgBwa
	kYeN4eGhlzRgh6qi7OoSTpkwezbgrb5RkBc51ZV6Gx0/hldVD5ZaoF
X-Google-Smtp-Source: AGHT+IGw4w66yWLlVDcoqUNPDHsp/rI73/jCCY+lCH49mLgHpGkwQxm2DQA/ev1yTm3bj9Or80jelc2Iwy++I20CbFY=
X-Received: by 2002:a05:6512:308c:b0:545:c23:9a94 with SMTP id
 2adb3069b0e04-54c2335c783mr3259183e87.48.1744037671036; Mon, 07 Apr 2025
 07:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
In-Reply-To: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 7 Apr 2025 10:53:55 -0400
X-Gm-Features: ATxdqUG1SPo3Wy4tNo1FRDVr7qoubaKRIp8WvHtp35HMPPueDMLmKtIWNo-vxig
Message-ID: <CAJ-ks9=3ckTSWuCWq0SV4EX75a_c70c=VKjur-+GFUHKi8+zmA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] rust: alloc: split `Vec::set_len` into `Vec::{inc,dec}_len`
To: Danilo Krummrich <dakr@kernel.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 10:52=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> This series is the product of a discussion[0] on the safety requirements
> of `set_len`.
>
> Link: https://lore.kernel.org/all/20250315154436.65065-1-dakr@kernel.org/=
 [0]
> Link: https://lore.kernel.org/all/20250316111644.154602-2-andrewjballance=
@gmail.com/ [1]

Oops, dangling reference here. I removed the mention of Andrew's
series because it has been merged.
