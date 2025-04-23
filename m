Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F911465AE;
	Wed, 23 Apr 2025 16:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425474; cv=none; b=HfMk1aCr/mC8MTadIQGkkZHcGuyMEj+9anjd8Mn1RzmS0XVpl1+ADviP+qg5rJIK31bVp2UKZTkI9YmJVdHzgiaavpZPu5Oy6weIN03/goXSH+7R81FsBWACNCbENZN8MmNIlkOMMedlI52GSaAEwPDcLCJrYudLKHYAiASWCOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425474; c=relaxed/simple;
	bh=G++E0BbS8a2hLlYRQNjKfQSgLliGyf9HwygxEobBzkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8X/X0ByW7zRl4cs0eIe5Ez+/yTRQQsH9KDhF58E5waJYG9nCn4J+8lyKyuCCJ0cfaL9HVi+fD1FrVM0afSfYUZQ3p38XqoKZFL5cbm1lI+eDU7V9UaWaaEhmhDRNs4u9TL7v0ujGfrdcmbN2gODKF3A8pVEx4c0I2C110okPE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsantKmV; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsantKmV"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ff27ad48beso1310787b3.0;
        Wed, 23 Apr 2025 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745425472; x=1746030272; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G++E0BbS8a2hLlYRQNjKfQSgLliGyf9HwygxEobBzkw=;
        b=nsantKmVAF2XQiMdY5CFwQEXdouqTpCjHWeIX8GLGOybU20xYSQ6Xgc+R6hCTS27l3
         YFAwyzZ/Pt+T9KpqFamRVdd/CJfGaqHzROjPtHvnQ117aWxtPZlYZsxui26ml3MnUui4
         fhetK7sHMKNO04rPOlh75S9gHS7zK+cknE4J6CkxmNu4+FwLo7WzttYChJxTr6Jguzep
         s0xfINFUZSMIYOveis1qDEpPpyLpJ6rFu1fyFybX2jkFL3JdUj1OknRhRqxz9wT+yO1Z
         8aSQ0Q7ARs/cZ7yHon8Zdjh3ar2D22TnI/6r+RxsiG+Cp8JmBWEkiFRdc4mJj6L0E5dj
         UO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745425472; x=1746030272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G++E0BbS8a2hLlYRQNjKfQSgLliGyf9HwygxEobBzkw=;
        b=vxEwMvA/AaKtGfvg2unXW8TkEfghPTMgKsUxrC6e0CEBremHRmaeRlAjwUTnAk4P3o
         LmXU68m22cXT8LqSHnsMUc7JQKAUg0V9GhAVzCDbmhiSMbLGALH/dfEG4idvoPrANhMe
         YNBSBQY5wKJzalvjUS4VVEqMGvijYfZ8aN4iaG8uB+n2l4+9wL7CkBIZnJvLp/aa8I51
         6G8CR6n28Iwb00cREjQ0FOkYf6gvP0nkSgmx7OUPrLzDfdNfKucjRGjKWoklpwg1eXvi
         kRC9wYnOjHUvHsqFFnbm5BsEnrXlvUXwNqw/luJ+8zC0rDuKn47FL1pc+O5gwC83gq/z
         X/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCV2n4lyM4CXpwctmdl+SC77pSEpfY40uxpe3KOMy9F/z6xP0mVioOGG3uU9GfUu+v0PJhCGdVsE1tDQ@vger.kernel.org, AJvYcCWEHqiAKBa39u50SCl2BsEtLW5QI2RWkMiXYOGgNqEWV1INKrvIXMi4Y2ZXIDKOphF2VLA4kmo3jJyxpCxb@vger.kernel.org
X-Gm-Message-State: AOJu0YzaYwFKQuD1AeXN6o/PlXMLCsA2pEo5KkzQDn9/6OdvpBRx3Ef1
	F1B42c7bMHCffA0GjgUUt6StAEQSaejvVofIdz/W7fne5vAaGUs1YIbGG1BdVVMkNZIi6mi75fk
	c1OFgDrWqBk/BMmDSeWXZAKBE7yY=
X-Gm-Gg: ASbGncuPN8pAEr1Uc297kCObR7HUed7m18jKEKn33a0q3CEmMy25yaH61s44hSmwhUc
	6ds7EdKhH/vN9PG9/3/lGxt79PsRMjlOEjJRIL8n6Ein1FUjYenDX5hDlNkD35Fsz0j41Zo+OVE
	3FnmaHjLiUwKn+A/m1vUWdEEW1nTgKqL6eQg==
X-Google-Smtp-Source: AGHT+IHs7VB0iY6Hw7N5rvnV+mLaMrJKNgLLnkV8ud2KiERF243U4X7v8mCrDhf5Lox17WfhwqI4Z2HUJBZfiX1i/DE=
X-Received: by 2002:a05:690c:370a:b0:702:72e5:793f with SMTP id
 00721157ae682-7083c566db4mr2968467b3.23.1745425471982; Wed, 23 Apr 2025
 09:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com> <20250422133619.GA1095169-robh@kernel.org>
 <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com>
 <e4159c2b-4081-4a4b-9a53-d6d559a3196c@gmail.com> <CAL_JsqKwASbUtpO=wU-16v=y8S_wLyBxnFUmQqsE8GkzCz0hDg@mail.gmail.com>
 <aAkLY3TYIPG7ojwx@blossom>
In-Reply-To: <aAkLY3TYIPG7ojwx@blossom>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 23 Apr 2025 18:24:21 +0200
X-Gm-Features: ATxdqUG6yRu6Z589SiaPf7hPYu4E07bIBQRBOixmyYz2zFeCy4cnqCijifN7bws
Message-ID: <CAMT+MTREnfB2MH=i84ZPa0LvgdYz6a+aRs+Nb07Ck10y3wstmA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Rob Herring <robh@kernel.org>, Nick Chan <towinchenmi@gmail.com>, 
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 17:46, Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
> It sounds like the path of least resistance here is then:
>
> 1. rename the bindings to be apple m1+ (at least for now)
> 2. keep the driver as-is (no mfd, etc - at least for now)
> 3. land just that (at least for now)
>
> Evolving the driver to share with not-Apple, or evolving the
> bindings+driver to share with pre-M1, can happen in future series
> if/when somebody wants to do that work.

That is precisely my plan for v3, which I intend to send soon-ish.
