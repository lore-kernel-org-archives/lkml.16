Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D4E2222A8;
	Thu, 19 Jun 2025 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750329315; cv=none; b=U1EbrzFWAcwsx8Md15DdINtAl/VW/IyR7DebyVlWlY47ZWPGhX359n0SufX45hKE4ddYNKUVmR8OF92U0oDzVT4n8k1JrnrL5TTPmkS0QXW5UeZdcgtrVBEEcR806KPPvDkWp86xbadbZBjOQplbiWEQYeQJrnsaBg5k+rc/YP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750329315; c=relaxed/simple;
	bh=9n0CSCsflojbXw3RCAZurIuz4o0bkVtsAswJzgXymLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ok25ct+8TGhNlF3Pc+dToKvuZQ4nitM6o6Mzfvh7dncQe8s6F0d5VrQYhJNEB6/Lkn6ftRSWG07CHcyRhYdCQQje/o95xJsYCYL6eH6SrWo9/kCPgLLooqb2L508U7pFeaRPwSfnlJC+VgE1aPIMMQD6TCejdcMhFS/g//hAb1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZMgmDSeO; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZMgmDSeO"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso84619766b.2;
        Thu, 19 Jun 2025 03:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750329312; x=1750934112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYcSpy3fjOfl/Ld8pD/5IvIIcuWozqQniEpo/GJie+A=;
        b=ZMgmDSeO6812o3bZ16qPJtRXKaK1M8iCwynPkqZpOTSW2w/zE/yGv8O+i8rUQD1AcJ
         sMTMa6yHf2imvtNVRkhOUDahVpl0Fyk6aJM5KKx6/9VzOrniJANlToCTPz+ZufGz2Sze
         Z7u0caIU4RhYGvK+NxP+MDnB+Dw3cE8nWY2byEg6fX5DawsLA0hZsOfvUNidKsEDpkJV
         6qjLrLU0Od+7p5uF+hTksabRmYksZts1Kf8rvd6HFEWVmswr5oTqPZlCVb/8E+nYi8GI
         yWDHxK/WhF1yzoNAQK6NVIqT6uQ1+VT6/nVxz7/x0W8xOf1qUs+XzuoYgVZQiRsMg2tH
         13wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750329312; x=1750934112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYcSpy3fjOfl/Ld8pD/5IvIIcuWozqQniEpo/GJie+A=;
        b=VDrP1t+IC+APDVwsV0xrOIGi3p3/pz3IDLAvWVE5JHiBjiMZ8cxonzgbyCzxAD8l/L
         upIxOTJHSDhGoDz4uczGI9U/mdfkr2OZGX0QcMyqv11K5AzhgmjiUbetrSuAT9W0PKs+
         7HLAdzyQTS9p9Q7Pe/SyNqBazH7JKbUvqkX2kQN98ikl3yMEaoL72yq9jpL65Kqwn+BM
         BhHLBevlY5bBrQQNv7qLmw3uwYUhKoXquOqA5M+8B6iE6lqgeIF5AGUw6vZ6Hbqj318t
         4g0UbJYuWJI+L4Raad5CD1xftGipZhvVn7lFgorv8Z7Tf+M7QyeA3SoJtduFGTCC+a8u
         29Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXOP4aHXBMHoSZfi/aEB9v1OwVDN8HqaA5Wc7Gf71tr7RKvb54rPedYAd5x0JDKe+WeL1GQ5nr/ZNwI6thi@vger.kernel.org, AJvYcCXZdUJsFq/IT5IlX9duzkXukBSCx5iaYEHG3SB9uJGTz6mgid0WppX8ySRbTAAqp9sNqZYynHGEukU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDo1cXYME6dqoUr8zGjs2NKwIV9AU5x44pe+IUucY81IpYKyFw
	sw3M+pSxCJjzyV3mcA33hu0HpghWYsS00sKlew6VSEHoC0BL/0f65Q2iEUyRewbpvjh8/jn0OSI
	IcipvEO1q5yS2nRn48sgb5RitzHv6EJg=
X-Gm-Gg: ASbGnctazG+aB0bI9iJ7VuBu9nShVzzLmkSaLHafS43ueHOXfyZy9Jz/xKSG7sy0GH4
	8T1gNKhSr2TzrwsZyc8wOWArpqNmNOEB+Y/Iu0buEXA8kZNQjM6Uy2L97o0CjApn81U1gHyFVtm
	aC6QDGrxeEnhJNbHXJxKw/434+cXdrUFCuhtjWnAnRtdQ=
X-Google-Smtp-Source: AGHT+IHHWUKjyfALrzaw//PYiT1+cxeTALWpRxcAIJQOTFRjLxTFyWACQ9rEp0RDZam+4I9Xwde6H8GCZ3rm+YFu/6A=
X-Received: by 2002:a17:906:6a18:b0:ad6:4e8e:1883 with SMTP id
 a640c23a62f3a-adfad29824bmr2276520266b.3.1750329311740; Thu, 19 Jun 2025
 03:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618093508.16343-1-work@onurozkan.dev>
In-Reply-To: <20250618093508.16343-1-work@onurozkan.dev>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 19 Jun 2025 16:04:59 +0530
X-Gm-Features: Ac12FXx8wLCRzICGcke8dQ2iTjvvG_2RNf4kUGiZlyDyDEi9s0vgAYKU_9R4R6o
Message-ID: <CAOh2x=k_xje2iHdHZCZO7QaRECvRSLQEVeBPkC2oY5YdJ83kAg@mail.gmail.com>
Subject: Re: [PATCH] rust: shorten `con_id`s in `get` methods in clk module
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 3:07=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Converts `if-else` blocks into one line code using `map_or`
> for simplicity.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/clk.rs | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
