Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CD922B8C6;
	Fri, 30 May 2025 20:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636581; cv=none; b=m2yAaR83tgkDB9Lze1phEmKytRDc4FWTle+/tolWyQpk1RTNZGQkXSvieATQFKYoK+EFqANfLz36yrtGrAKO1k8kdIPVdmlKvnLFVll1afEPB8Jo3+KolMjryli1Y8vtv4Lmt9aS0Vps1RYcLwshQGGg0m2EAXwfswVp+NO1xYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636581; c=relaxed/simple;
	bh=fjpOAmZBAdbVoTbSpMSnKF6D7WZWE7u5WiUuXNJJZSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAGf9dV2sKfbG3HSYvivlXdLxDAfzEH5L+sa4VECk8Vnn6oJolBhAh4ARwj17isYygUxue8EeBqbjve2A9P1sHE1t/d1jJx+E5YjWVM1SPg7nF0gQseuXFfdnccU6PjU5eq7WzfAokNuuz829asmtui9lZKS12NdBwugoAImRSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUVvmowz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUVvmowz"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so25482735e9.1;
        Fri, 30 May 2025 13:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748636578; x=1749241378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LPBFbYDATVBGoB/V8gk2ImwmUCtuFjEx3Hr9OaoPFAI=;
        b=mUVvmowzyn8RlnY6quiqvf7S5dNloHxTcezTjOizazT3ncyiSTlIZUQz0FY0IF7As1
         9nFuYY/662Bw+rmr7cmqUxRcsUXnYk/jJxbaJ4glhcGOZ1jvVR+kjKuNUm0JcHIXJ5eM
         +sydjCx4MPMuejY/5hC44h7FVQEnLeQnxyvo5PJcCswplMfmZx/AMR2N2tQxntq777jO
         x9l7/2P4fHx+vureohUIWhI3bgzp1bJcQieuJQ8WjUm8sOrKu5P8mX09j28/7mZXklIL
         uT6tOIu49rCd4iF2tzCDFS7DAvMsCDvpuYztsMHU70N92hiX384SwVduXywQdCApuzMh
         xTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748636578; x=1749241378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPBFbYDATVBGoB/V8gk2ImwmUCtuFjEx3Hr9OaoPFAI=;
        b=O/qwwvq92uPtMHU0QHH/hMxxF9PdoKp3ytuvfOWFOVgrVxnB8jTwok/4PH4R1j2JfR
         +mElBJKQtnm+DjveiCSC83ONZAx8iS2SLbvqsAVxjyQ77Iw3ueDcHh8i4iIqNLv46AXI
         Z9s3EroX8f874K6gnDdlABUUO5KCzo6REM1o4V0sWUdxRboz6UTW3PNlPcEs8TfEm+lo
         uX0TvI77XKPnnBAE+53gEEuI9RDidN+S27qpLhvPmHKl6ZcaxZ63rpxPrX8DVAfPoTHJ
         aJq6igTO0Eeapi9zRM7u+FykNjNT0K8aaF6gEUARI5EWLSMD5wY6zbjaTKzKG30gv1/E
         uHbw==
X-Forwarded-Encrypted: i=1; AJvYcCUuB+vzrT5PMb8/eKte/1moIkh8su2cY0foL0v/OUdeCgSyJPK7JDHLMMQQRGpc6509Hn4j9NMsUsTZJ3A=@vger.kernel.org, AJvYcCXNGztbKfOVW89Umv/K/jabgSrfA3AJOZKWV+21/HMo/gXfPe7cjhPNZNpQ7aaQUxLDBwS9hI57Vx84gCLZNo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDy00EwqAmhapa1cpMaLl6H4EhEPl0IuwGbho5/ZDI5SA6Axl7
	68EFUrENSZ4h8niqXNLTxLlbl6OMYgtGX1L+dWiZNbxWazxwh6uhXIpl
X-Gm-Gg: ASbGncuPIADD6E/RvLYfvfmEmbMGvUlaSnn8vE4+lWLZWkD0pnvG3rSkEsVXzyFdg7x
	Ci6Lqu8jcdFfRpruwFNHCSa/vZ82HeZyfKPhlCirR7AtPAIBugSaUHeIe5Tm7y7q+5IST355r/R
	7X7/LO7FM83ClhL5S7dIEPcGa0cmjoP7EcX5IHWq44DDFUYA9b/6omVL1PRJXjcCdcHH/Preldp
	7iG16CdN1cqa808f9vL7v7mTFin+vnbkz398nlsqySYtZ7nqnCMILTxlTWhyiOiZ1qIzt4OhotW
	m+09LChP/X2U4F/AlXbbNGgrKkw76hJGb1yqVWFe3XxOssgQ68LCk3jZcTe6+BCJ
X-Google-Smtp-Source: AGHT+IG8RDi2BeZKsFRzuE7h/ot3AqyMQo054BxblMbsLjyZX8+PqOO+XyTTQHOqF7v/XhIwYBsBRg==
X-Received: by 2002:a05:600c:3b0d:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-450d64cef2bmr48133255e9.4.1748636577553;
        Fri, 30 May 2025 13:22:57 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:cd68::171c? ([2001:871:22a:cd68::171c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d80136ffsm27766085e9.40.2025.05.30.13.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 13:22:57 -0700 (PDT)
Message-ID: <0dfe6958-1dc8-4e36-aab8-e83a6da4d0e0@gmail.com>
Date: Fri, 30 May 2025 22:22:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Sky <sky@sky9.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
 <CANiq72n0EcibX3Vx95tiPEkd04DA4hjY-TJQs9YSOmHj=VZ_5g@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72n0EcibX3Vx95tiPEkd04DA4hjY-TJQs9YSOmHj=VZ_5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.05.25 11:26 PM, Miguel Ojeda wrote:
> On Sun, May 11, 2025 at 8:21 PM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
>>
>> Signed-off-by: Sky <sky@sky9.dev>
> 
> Apologies for not noticing this earlier...
> 
> Since this is a Signed-off-by, the DCO applies, and it requires that
> the name is a "known identity":
> 
>     https://docs.kernel.org/process/submitting-patches.html#developer-s-certificate-of-origin-1-1
> 
> Sky: is that name one you use to sign paperwork etc.? If so, that is
> fine (and apologies in that case!) -- please let me know. If not,
> please feel free to ping me in private if needed.

Since it seems like Sky has not responded for 10 days
is should be fine to just drop their COB & SOB.

I only offered to add it since the upstream implementation
that this is based on was entirely done by them.

If you want to wait for some more time that's fine as well.

Cheers
Christian
