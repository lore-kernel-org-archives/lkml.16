Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E3A1E0E13
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743446034; cv=none; b=lLX4FRBqUs7Ue4SDeQ2q8iqw42buUVBaH80w2FnRZTQc5SDtZ04l5glQgxHp21f8tm8UMfRgec+re0FcvwmRmf6mS6mgxgLwjPnuiV8/yXFHrc7S117p9nIYKqYIuJ4G0wa99NpVM5F4KXcSk5D6rXHhuZpNZFLw0OpNZnQTHiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743446034; c=relaxed/simple;
	bh=vrNk5gWMw7fslC/aSH1cmMvB6VpmLM4R+bB7EgWYcKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5CgCZddNnMDiudO7ZWFMXxI/z6Bj6tnJ9/ziFEt3bRcxs53uTCY6LER36VTvuHSncglU9QeOY7/sK32vP8ePNSoAe+ElBX8Yw5Nn7519ScRxJcEYpOYWZ8L6BxA9oIoj2PDPtGycKMFUiosZPkjbsgoMRYvPYnS+3yCQfzcZFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Cg6p1tLk; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Cg6p1tLk"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2aeada833so908589666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743446030; x=1744050830; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qm1O3MAg26LYGeV9+5npvrxVPsd76nUJvpjvmTv2VoQ=;
        b=Cg6p1tLkJR2D2vx01K5nBQTu4tFFyfVL0kOeK+K0z0AlZP8U430PIRNdSQMl5qnfCA
         UXE+1PoaEY7dBg3k8Pqd1BlrTQFavuqbH1j4DHk2BKb4DUqcga+rDl+v2meqYwX7jO7Q
         y76MYRKx79gnIi4ArI7iFQH42zY6Cuz/fE0Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743446030; x=1744050830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qm1O3MAg26LYGeV9+5npvrxVPsd76nUJvpjvmTv2VoQ=;
        b=iWgPFeufCwPtXSVrLYcOrZC4MYeeaka9ZxVNpX3uqRDsfVWGt9ORr+b6Wy5/T39cvc
         WUj20fLsekh5ClSNa4KS2UANgveEBmKyxp7FtXbR5PEOFxVLPE/NbBqrY46/6olhFmW6
         N7vWa/MJeFd3wE5phsTcFzua9QZbfZqhfYBrE1xjJY6nuqEaCZdn8xBSgjRYerLVSiJj
         YpYEPIyN/5QjmjSdfvtsKATyxYnZidqHW6EBApk0gOj94FUhePLSFBFdksLzgCVrPyJD
         a4iuunw4JTU+vVaSsT8YrEOQCoUxyZJ0pVRRBS0AhloeorLvwlrjsOXRrNBHwaWL6+u1
         kpMw==
X-Forwarded-Encrypted: i=1; AJvYcCUMvxEGISUiaxWC+iWebiIpOXZH/lcpaveY9DbE04wxo9qUM6hGeNDHzE63E40cQ2OtSAR3Uj3CPLyRjeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YztSSnwIEaH+VrzzynSYIU7kAmQ48syAZfcqIX6Ja9aiAiNyTpV
	6gUSFUiwe4BzvLSZcnF1basix0aaIJtcoeFzYgp1A+/RQwoxCGuXkcok6blXxLSU9q+7TwRHE3w
	a70U=
X-Gm-Gg: ASbGncuemZ/ktHf5N6hz0iIr4jnmLFtuz6Axj1dxHMSfzvRBPWhyh7PhD2rO5s9HTG5
	dGkhSfHxAWVx7ZSoCIRPEqURHsQpysjQqBeiuBuq9AFpBwnp0xCSUi6OcnXMudpuRrAi7AuUww3
	x9J6DwMpOpzAnDrhohoirf1Jv+l7z6P3ETP4uPZdndcU6E3wl9bdEyiSfDAyLUwq+l2hoAUBoKM
	lQANOXTHJLt9WC30NazoAc6j8hwipdde6zMx3s5mL3hUtuy5DCk3GJKB0CcmmXtloWkg9MDOfVN
	W8QaJDazp7kVtv2SggSKBqnQnu5g4bpXAvj6h+ppYqanokInANWhFhc6Z/I95PM9dCL7/giYhMG
	qV4DOeDJmlBx+JcvSx6s=
X-Google-Smtp-Source: AGHT+IH43otZg2CzpF9O6Sdc1Ut6tCGsCsh/EOCHzqw84QBNKEsHPbXNE/B5WkgT3jpYqGWc0h0H7w==
X-Received: by 2002:a17:907:9808:b0:ac3:c6e:ffcf with SMTP id a640c23a62f3a-ac71eac5a2amr1254759766b.3.1743446030614;
        Mon, 31 Mar 2025 11:33:50 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196ccfdasm652532566b.153.2025.03.31.11.33.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 11:33:50 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso10984671a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:33:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXai2pmYYz35SDeph3bzAXpfM1+v7xqK+qPJi1sMYZWpEpLVHMI9WVdKFH6O7tHJxxA/vDAEGsPI77bo0U=@vger.kernel.org
X-Received: by 2002:a17:906:6a1e:b0:ac2:3a1:5a81 with SMTP id
 a640c23a62f3a-ac7369c1867mr725809666b.26.1743446029615; Mon, 31 Mar 2025
 11:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331122926.607374-1-ojeda@kernel.org>
In-Reply-To: <20250331122926.607374-1-ojeda@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 11:33:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgyOSX4tbq0qhAkk0OCZqwiCA4EtwKZOBXAdkBW6FOANQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jq4JU66PPrn8dDycOvivpUoHu2ypgpPWx05AnaaKLgbL8gGe3Xow4zKumo
Message-ID: <CAHk-=wgyOSX4tbq0qhAkk0OCZqwiCA4EtwKZOBXAdkBW6FOANQ@mail.gmail.com>
Subject: Re: [GIT PULL] Rust fixes for 6.15 merge
To: Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 05:29, Miguel Ojeda <ojeda@kernel.org> wrote:
>
> A small fix due to a typo during merge.

Well, duh.

Sometimes I have too much copy-paste, in this case I obviously didn't
have enough of it, and just fixed the conflict - incorrectly - by
hand.

I obviously didn't see any bad effects of this typo in my build
testing, which means that clearly this rust-analyzer thing isn't
getting exercised by my normal build.

Now that I know about the typo, I can see the error with

    make rust-analyzer

and it's not like I'm going to add this to my normal build rules, but
maybe you can give a list of things that I should be doing when I see
rust merge conflicts so that next time around I'll notice these things
rather than have silly typo mistakes.

Thanks,
              Linus
