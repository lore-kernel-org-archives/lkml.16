Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BE029CEB
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 01:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746582737; cv=none; b=b/zgZNC7QSvFRTY9dYRrloDhoJBCh2g5WeIJUxQP2H9pCh06j9HBVlZzSwhMND03V+pV2+9prTyxhds6CEVsePooqu4yjMsEal5N7uhRYnXq8rpcLCIB0rbyvsaB2xhEPv6CTEuk6FwXykM+NuZ1XzbbwfG48NBNd3c72aS4Clk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746582737; c=relaxed/simple;
	bh=zkDJw9GvZlN+rb2GUh2GDAIlyl/U+0gEGbTsPhY4Cuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZW9/quSMaOjW42kzJE7gpeVKsivHUaRkxSj65xuNlsQ5lGX5nRkEccFMHrmbU1XWTpfd6u70jcgGK20TqWn9alKZXHJw28DLVljK3vYk2ocfEorqqByboygB9FITb8ZUQk6PxbNRhKW3IFqKNf37OIIqKV74y2I81DIJy3ks5K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRoc9sph; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRoc9sph"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-523de5611a3so1836638e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 18:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746582735; x=1747187535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wX6DqnExx/DUQA6URdGCU9AcixoGmyM3nBuzLQT2WFY=;
        b=TRoc9sphDvGvY6Pm1gw0zkQi7ERf5tROv/Z33ySfvkNpPl9Us3ADFAoT5C+kirEXlA
         uW83YS4jETI4KJH2pjoht4NwZ5EOZ5jsmy+MvvofTIusObFYW6Sp4tGSZOPLzMgpNKZ6
         4o+lZ97WPX3FmZJ5k+5zUW9SgCyFA5NeKT8eYuTzueJn4QFyFJwAkKO1TC5e1MjrFmhz
         f2HwWIXKRK3uNJlQsTJWlXsfaoNFxuU+1eN1IDguALF07IW/MFPJbbIDym3GO+HoNIFY
         YLq/qsrJ9MLfFylPkZt3sieqleBJ5e5RvBRffpp9lBLNUFiW0VPvubLMHWsb+gba8qY8
         Cs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746582735; x=1747187535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wX6DqnExx/DUQA6URdGCU9AcixoGmyM3nBuzLQT2WFY=;
        b=NvznjBcwxZrGI2zniJ0BvpnGHVCWY9RxCMrtTqF4vfst5j6BqTgER2DdDj+ZhhDKb0
         o4LhkM7C3ezNNm8Rd8m5taX+d6tYkfzbfS6it4+TMtCXZCGIt6gZ3CZdHsrxOsFGUZsp
         NZocFhn6GWKcA+qb4zeu6DVmPAMliOX5wKIdifYQPMFQJutcnDL6UOnbSx8vTzjl+icF
         qkhj5N/YK7OPYR7dGwQC1tNRV6s0H1WSixOxfe+iBBnlShhEfYL2DzRYUxJw6T+52e4V
         HEzl3No1kPstWicFpxkGoz+inkZ2oyL47PidtXguFJMepOoliQUFWGmk/3siovzetZQZ
         WniQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj44kXUkBqD2+00xMaHipwUEFyaLhnQFOiuQmgTzRQlK16Iog6w2qq3CnXm9QDQc531icqJzjRWCkgBO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE41Z7mZMhX/DvG656yDP5Oi8DPP7RwL7TsO7e75EbskfIyRds
	N5fJwKia8rdEIY3r9SmggCOcBNmTiryvRdEpybYC7G96Mrw6saWgd3ico2tee/gMLWi8uvljrpK
	fRIs2Feww4L58WCgGlStPQp0dqNNeKw==
X-Gm-Gg: ASbGncuthMV0SJGlK9SBqEdM/CEQWUTkpqynUzS4DfPGbFVC4NGMZecHfBKStwUZPLH
	JwJCssygh1sUi/Mo018U98SAsFLt5FqDy08u0ESPHQwK1KY4vjtzrBfxdt/rGfCEik+1I5es7YK
	F9hzsqVkLIQvjKhXqWxRG2L0OSVT5PpubM
X-Google-Smtp-Source: AGHT+IHOly4zsMcU5xSwf/RTn890WjiHWEE+LXhkKE4dZQYH5w3dRH7T3JdglvK8E2gyidpry8SS3vNJ4NgWivbqw0o=
X-Received: by 2002:a05:6122:2202:b0:520:6773:e5ea with SMTP id
 71dfb90a1353d-52c37a8710dmr1203653e0c.7.1746582735020; Tue, 06 May 2025
 18:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506030100.394376-1-xiaqinxin@huawei.com> <20250506030100.394376-2-xiaqinxin@huawei.com>
In-Reply-To: <20250506030100.394376-2-xiaqinxin@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 7 May 2025 13:52:04 +1200
X-Gm-Features: ATxdqUGX7CX82MmtEw1YibULEZk4DjAH2OOZCyfYNg35wWYStr5-60vTNSo0xKc
Message-ID: <CAGsJ_4zBz0oZGpP3dTzsjmw0oJbWm=vkKRS_kjBso7cvKJGjuQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dma-mapping: benchmark: Add padding to ensure uABI
 remained consistent
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: yangyicong@huawei.com, hch@lst.de, iommu@lists.linux.dev, 
	jonathan.cameron@huawei.com, prime.zeng@huawei.com, fanghao11@huawei.com, 
	linux-kernel@vger.kernel.org, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 3:01=E2=80=AFPM Qinxin Xia <xiaqinxin@huawei.com> wr=
ote:
>
> Fix a problem about commit (8ddde07a3d285a0f3cec, "dma-mapping:benchmark:
> extract a common header file for map_benchmark definition") accidentally
> removed that padding, which has completely broken the ABIs.
>
> Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>

Please add Fixes tags and cc stable.

> ---
>  include/linux/map_benchmark.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/map_benchmark.h b/include/linux/map_benchmark.=
h
> index 62674c83bde4..2ac2fe52f248 100644
> --- a/include/linux/map_benchmark.h
> +++ b/include/linux/map_benchmark.h
> @@ -27,5 +27,6 @@ struct map_benchmark {
>         __u32 dma_dir; /* DMA data direction */
>         __u32 dma_trans_ns; /* time for DMA transmission in ns */
>         __u32 granule;  /* how many PAGE_SIZE will do map/unmap once a ti=
me */
> +       __u8 expansion[76];     /* For future use */
>  };
>  #endif /* _KERNEL_DMA_BENCHMARK_H */
> --
> 2.33.0
>

Thanks
Barry
