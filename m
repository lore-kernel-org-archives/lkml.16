Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E852E2AE6C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 23:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748908377; cv=none; b=P5bJoWgL7Oxp/3amwozjYPatKGfXZHni0XLUTKCLx8mDpYxPuB6DLPkfT++pFp2pwpNj3zbspXgzzK36I7XJn3Khh6Wm6Y6BX+rmFnsLOmGGVTfi49mnZ/7DXxay78Qhl0Ddz2yNJ+529gTFwJQUimszybTVFeBOiIK+gm/cLLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748908377; c=relaxed/simple;
	bh=E9Cr7rCexPvBxy5mvPSpd4AhyD0wvL0ebqAxN2eADKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sv+GnaKgHLykXIOCZ803B2ZWypBPV7XHzhKPCfp45DPyDZDJbE0KBu8fgZ1m4gHN6gsZjjGTummDIP+SeFdAWa/fBEzeJHI81C7s1jzewIv+P73W8QZ3TPxhGdHHf3HqkXRhLJBJOghJOBrjuv5nDhqfLBNt0/9YZMMKPv3pvXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkAHgzYt; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkAHgzYt"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so41378626d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 16:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748908375; x=1749513175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71OGQu0v8kK9mvhrodlAKtztrZBjUaK68Iaa+xn6kFM=;
        b=PkAHgzYta+7VlBNXaxr0uIucBPNaSjKX+yYE8HvdhCMvWqbOOrH3bS/++DW6sdCtTo
         261hpBs6T20pMcmYO7Nvd6GlWXeXmKBDBKn7I6gad4vpZ1usPZosXhFPsXKaa6CiQA0Y
         8sQ+3bACTEP8+h6rxDum9cs5l7hg2Uz8RMGBR4ENCQahWApWbGtNZzpezvUV0wuwDRox
         L4c3wND67EaRU85qAUQVInVHgzhgGJq6wbM2KDOyQAhFXboQhA5/oSrkiRxK0ZWI+DcW
         +3zVIE4XP+PzjmSTmnYPbPhQN19EhV0UbU53vfFymwGgzjy2P+PoU781gv48R6JHWx74
         RNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748908375; x=1749513175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71OGQu0v8kK9mvhrodlAKtztrZBjUaK68Iaa+xn6kFM=;
        b=Qr39wSqUJa51MR9BPpn6Y3oL4b8R7tXOR6KiKTz6wghYA+E5/yimtOcg0+OPOX3gAk
         VaIAQCPLTcgF2f0zfvpHnLeR9q8f2cQpvfbQWLSk3NiGm3TBn9Um+idwa+7k5UL4f7eX
         kmQpkDofw6wtBljyROf1zaOz1IMRnKxPke3AEDGE3hT5YkGk0GrTufcVOH1y5MFbU9PS
         5YGOsupxSBn0oBL9ZeSjM84bB9JfPHzNRpCw+Fy1Yrj6b/PHKvXTrwGZYhwhCAXNyTvp
         eUG1WHLce4cHo495Sprc4eqna86U8Iy7QAlNoAkEXoKoXUtOINOEkVCYb8ArHxnWig8d
         Wf8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbrDI7Gh/1G+uCjsSUgNLydUcERjG2jR1KvgR6XMXMkgsRPbg35axTBlY80h+oiGpHGVwQVdd4Kyr/8BY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIUKWUF09N8kqoLYZW/FAB4QDzA2UKKthzB/0rbfKNWDRHHg4K
	VBEJofBU98T6Rq4by907YeWKnFP7oUr7wXthMiz5fiZjbLpdhsH5NqK+W/TowqW2jUzPYsSAukv
	blZToRNea29FcH2J2tjLTqRQ6wk0TotWtwVCB
X-Gm-Gg: ASbGncu5/MFX+bLM+/O17+VamLm+b7YB6iTw/CXctK3qbQ2rW+MB1yinjHoOflNe/N1
	FcNQnM6hGJYeI8DXIWAAHWvkmUQeJXGhBpQJzT8GvgaDRfMZAuIIMBz14QSTntjZPZEjAhFtltb
	Cdmr0ADbH2B1WvkHSyxGl6NYvY9z9B4WrKTw==
X-Google-Smtp-Source: AGHT+IHYloArKqMvb1ZAjStytUw+W7lASqAhr7+f6KeCOpu8nQihhVkmQlx3zL8v/TnOn9hhpjEWeG4o0kM/vP/dpdc=
X-Received: by 2002:a05:6214:d02:b0:6f8:bfbf:5d29 with SMTP id
 6a1803df08f44-6faceb61b39mr235492096d6.5.1748908374684; Mon, 02 Jun 2025
 16:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 2 Jun 2025 16:52:43 -0700
X-Gm-Features: AX0GCFs9IvnWF1QeJePnKQX7tVHEMQgBT1cjkhbjCQng-Tt5KsVx2eHo8KS_F14
Message-ID: <CAKEwX=OVMc1__uNzwfk+DBU4zLF+KQQBG-STWF+h8aB1mdCBLQ@mail.gmail.com>
Subject: Re: [RFC PATCH] MAINTAINERS: add mm swap section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yu Zhao <yuzhao@google.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Kairui Song <kasong@tencent.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 8:20=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> In furtherance of ongoing efforts to ensure people are aware of who
> de-facto maintains/has an interest in specific parts of mm, as well tryin=
g
> to avoid get_maintainers.pl listing only Andrew and the mailing list for
> mm files - establish a swap memory management section and add relevant
> maintainers/reviewers.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> REVIEWERS NOTE:
>
> I have taken a look at recent work on the swap and chosen a list of peopl=
e
> who seem to be regular and recent contributors/reviewers.
>
> Please let me know if I missed anybody, or if anybody doesn't wish to be
> added here.
>
> I also realise we have a bunch of non-swap stuff living in some of these
> files - we will have to address this separately :)
>
> Thanks!
>
>  MAINTAINERS | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e66460861bdf..3386272f6bf4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15674,6 +15674,25 @@ S:     Maintained
>  F:     include/linux/secretmem.h
>  F:     mm/secretmem.c
>
> +MEMORY MANAGEMENT - SWAP
> +M:     Andrew Morton <akpm@linux-foundation.org>
> +R:     Yu Zhao <yuzhao@google.com>
> +R:     Kemeng Shi <shikemeng@huaweicloud.com>
> +R:     Kairui Song <kasong@tencent.com>
> +R:     Nhat Pham <nphamcs@gmail.com>
> +R:     Baoquan He <bhe@redhat.com>
> +R:     Barry Song <baohua@kernel.org>
> +R:     Chris Li <chrisl@kernel.org>
> +L:     linux-mm@kvack.org
> +S:     Maintained
> +F:     include/linux/swap.h
> +F:     include/linux/swapfile.h
> +F:     include/linux/swapops.h
> +F:     mm/swap.c
> +F:     mm/swap.h
> +F:     mm/swap_state.c
> +F:     mm/swapfile.c

BTW, should we add mm/page_io.c to this list of maintained files? All
of the functions there are swap-related.
