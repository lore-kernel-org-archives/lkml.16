Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9DF256D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856119; cv=none; b=c3TEFCTtK0wJuxsVuOrDiwflIII8j3Ab0FOLtexnZ5iUkPLKTOj+juxCJoQfPABxuSkVZjQoPGCzagWxHMI2s4ltHuAu20yEEd5dbt+EaUqNRNLvwL8mYJXOO2qq5Doa4CrCEkHlM4HiyLhMETv7iHcEze+aCGNa7TqQVfGBjXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856119; c=relaxed/simple;
	bh=m/PGn7pUiGB9sf2lMsON5GbQ69RuHQHwWq/cYDL8ZTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sj1/l90Ps9HImLhPMnJVhJfekl6mVnJqgXazgEQhAA27N5s6W9ySxmdo3AxZR+COYVglHPoT55AnnpyS36WNz+SEyvEOC+oYjSMW5Igt25XnkPZSGpnEsG/RWzQIB1dmIx6+cW+NsM80x18ykYM5haCZ2EXJ8zlngFjud/YpMv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hVC7wYbC; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hVC7wYbC"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47666573242so683301cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745856116; x=1746460916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLIIjvigQhQXrt8dPynvZdFWGGT53pwln8ZlFURMZps=;
        b=hVC7wYbCsbLpbks3d9YWXwn5ZZCApLTFOQJn+cU0rhV6I4iocZKw6yvCCVgdq59u2K
         GUae46s+Ewt9/J2I/xlh+p5Y4dpPKLQurCXIbxebUa+V8+Qy1jLkM+9i+PRnoZ9+i+bb
         ozhQMSFT2Kqgmf1JyEeJFVYYYKdSpfUh0p8kYpn0V+oX6Ju/8Kihuj+Q8C83/kmNsiTc
         d1E/5jmKQC2joxx/KxZAf8VAaGpTdEJVveHfBIBghyG8GhNh9RBspRYj5nTVAn6MkBhZ
         csvHoSP797MbyiVGP/BTzpmjFK1NTX7hE4YfWUxljM2jafT7Wz8CNYtZ4+72USeOQPEi
         vixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856116; x=1746460916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLIIjvigQhQXrt8dPynvZdFWGGT53pwln8ZlFURMZps=;
        b=i+VHtg5sR8xBnmZ7WK1c5U29nhJXnu3PUmpk802giy6ISK3DAzXddZx8dgGHfAO9Qa
         LXTGu/Wq+xPemosakQEfKIz9SKBHTHS8nIK64FKBa4aB3QK+CctBBKNjVB9wkDDzBwmL
         RIywHy1ElSZh12uAkK23qGcfpLlwT0DXRk1q618k9sHA9Zumk+eMsBsoO/8nDogx6ADy
         Q9+hoQq5gzDdV5WJ6q/y1OKsLmveXEnB253duqCpCrBPZgwnAfkq8TN9dic1QNKHcbUZ
         vLYRKeZOjyvx/2YepypZDoNZ4q7VudIqsMtX5Zs+MgDdapnvgViyhvYbcEtEW+kHci25
         LIXw==
X-Forwarded-Encrypted: i=1; AJvYcCUsElAL3zcFfAOq5K5KkX93SviSac/ns3aHshNkv/zCfmiPOnhuX/ypuh0V3Gswdm7vC2d4qsPtmLvJOeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzScv3U9/9lQndeceAxD8fMmQgq3vnYGsCIsXfPiXEgcsICY3BX
	7MNbUBN1bEb/hZor0oNLkCEQkdzbrNmYlFiNMXkm/1vj4nRu2JWh8EFNcc0ZoDXyjbyTzZlfakF
	NiJI+P6kY73cFKtTbH93ToyAUqhYdkB4Oeyvn
X-Gm-Gg: ASbGnctuqWkzP2pcCegsLEYzTBTO01eYiaRMsQLj+TPA4i00l8FdldPJCGiY7RYhGBO
	U1r0aukMZR9EHKtWpoMnt0Ly88dDc7sLl8REnzYcz3zc5lr/5mooG4ScPkf4U6v8x+itSKoJYJX
	kRSII4Dm8NTmhQWWin3N25s7kuxk3VRls=
X-Google-Smtp-Source: AGHT+IGC8BcBrZ+OsNHPMrSSJp0ngSL9gh6C30RowYt7MLOBGERB0KUxUozIcK96e8Y2xwDGbe0NI8EsTveVxeRefaA=
X-Received: by 2002:ac8:7c52:0:b0:480:18d4:93ff with SMTP id
 d75a77b69052e-487fb9ef28dmr452101cf.12.1745856116221; Mon, 28 Apr 2025
 09:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428110030.151265-1-trintaeoitogc@gmail.com>
In-Reply-To: <20250428110030.151265-1-trintaeoitogc@gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 28 Apr 2025 09:01:44 -0700
X-Gm-Features: ATxdqUHrPKwca8-_S84UfHAAD1rxlHz0n8hql1KjZQSNuKge-jfQNOoEIazZNB0
Message-ID: <CAJuCfpHngGX3doDEZOCSqh0sT25q6kNutr_NO6kV0pKZNWviLg@mail.gmail.com>
Subject: Re: [PATCH V2] mm: alloc_tag: change the KASAN_TAG_WIDTH for HW_TAGS
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: akpm@linux-foundation.org, pasha.tatashin@soleen.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Andrey Konovalov <andreyknvl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 4:00=E2=80=AFAM Guilherme Giacomo Simoes
<trintaeoitogc@gmail.com> wrote:
>
> the KASAN_TAG_WIDTH is 8 bits for both (HW_TAGS and SW_TAGS), but for
> HW_TAGS the KASAN_TAG_WIDTH can be 4 bits bits because due to the design
> of the MTE the memory words for storing metadata only need 4 bits.
> Change the preprocessor define KASAN_TAG_WIDTH for check if SW_TAGS is
> define, so KASAN_TAG_WIDTH should be 8 bits, but if HW_TAGS is define,
> so KASAN_TAG_WIDTH should be 4 bits to save a few flags bits.

The title lists "alloc_tag" but the change does not directly relate to
allocation tags. I think it should be page-flags-layout.h instead.

>
> Suggested-by: Andrey Konovalov <andreyknvl@gmail.com>
> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> ---
>
> V2 changes:
> - Improve commit message
>
> ---
>  include/linux/page-flags-layout.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags=
-layout.h
> index 4f5c9e979bb9..760006b1c480 100644
> --- a/include/linux/page-flags-layout.h
> +++ b/include/linux/page-flags-layout.h
> @@ -72,8 +72,10 @@
>  #define NODE_NOT_IN_PAGE_FLAGS 1
>  #endif
>
> -#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
> +#if defined(CONFIG_KASAN_SW_TAGS)
>  #define KASAN_TAG_WIDTH 8
> +#elif defined(CONFIG_KASAN_HW_TAGS)
> +#define KASAN_TAG_WIDTH 4
>  #else
>  #define KASAN_TAG_WIDTH 0
>  #endif
> --
> 2.34.1
>
