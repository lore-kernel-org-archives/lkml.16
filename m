Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E312459FB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745742162; cv=none; b=CVCwJT+UsjlYv2A7wa13qBbLKRWhCAIp+TbJ/WbCV/yhjNZain8oRelDLapF2S91ND/MyV/8iG/vSxbbiagXgcLlUB2T65scTPTAHOjyW9oEaOj07FVD1kEyhyttcusOSIrrCJuD6DAgGk1g9mff2AZbrCkcr8fjrLBxF4ZVLgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745742162; c=relaxed/simple;
	bh=0L25wEiQssTYSH6eSXJsKyO2SIYpD50tWVdcG9F8j/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBgVGSoZ97E87bpHSaZQ+tLm0vAU05j10HoZ6homiwj9EfSeIbswgicVMF2k/VfOD9NDHfCV12+uNFjsaogqYE3RkOGgNNoET/PSOj96p3mmNE2ik4Y3phUHhA8OjCp8QDM3+Wh7bpQN+ZoVnyjCBMLAyU+kutG2f3OUvTWUDQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeLIWBWe; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeLIWBWe"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-875b8e006f8so1390244241.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 01:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745742159; x=1746346959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4h8c7e+cymdjFD3ucWmNNmHi1d8T/80DiXJKDW8+DUY=;
        b=BeLIWBWeXSkJM95/Bj91vvx9NpIYeDuUJACWWaXRW2HInKnGyDVT1XAuxt3FWI9FOw
         Wyw8eNhI0JM4Dv2QkQrp8HoCaKEsU0zvYevO80fW2zN8NVCQukES6b5FQ4zbq3goKJNV
         UNEeoXmxVgJqYhxoeR8P6YSq5K23BbNH14XXSh7CuXGg5ZsKrlKDfAjAuqicj+1rjD5K
         DjOgO9gw/xkdaHEmRgLft5C83qppx0m772tsNA5umR3wpXXVViXrpDqP5+Aehqf0NiGX
         czB5Zz/gs9Fd2imxqLI9djo/ehyC0Dy42AVqSPeU5tY8/6gLSnk7XmKUEaPNOP8W5fjg
         6j4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745742159; x=1746346959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4h8c7e+cymdjFD3ucWmNNmHi1d8T/80DiXJKDW8+DUY=;
        b=CYWt2IOEmvnBEmE3qqF9QeWiOVZRIcFjSuTmMPh5aHocrV4bWtaOPOpwmgb2XMXDVz
         ZNv/HTrHa251x49jvawnBzToZ1MWoBwiXll+PzzDI5qz7roR1OxAJ5ql4CQiQott6Bb2
         vahgcTlOHA/P6wT4iNSIV2HBL2REtj0x1Am8qAJZiEABJMH8HDm0T6+wAzodIJBJ22rx
         2uFvmHaTM9TS3Tja46bbWgoQFGjvaNtOHGwMN7tN4wFzfMvQ2rzXu5cVpyfwjcierMFq
         dr7xi+jbiZoJTBoRgZIrPU1wEM27NeDtIHPymyeU0RP8qI0WsdrokLKQ6rML034uGihr
         i1wA==
X-Forwarded-Encrypted: i=1; AJvYcCVwQklPblprfXc4uqS4Dk0Gb3qd4H+99tXnGFZb9ZEW2usZzHzNQqrBDtcqQYro2QV/qiwrcr3E0uvls9U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg4qJU5iHUfCDE0ZwK1jk8oGCmbzsFzqJGRSD83sHJk/tZkYX0
	ZPWDyXnyDrZtupsQtZeoD2fJBxYjER8vlVNST52sPX/hO0hF1IiPHXH55h0TChXhL97zWsaPPwA
	pmp0yCDbU8AVLnHNH1YKpot3oK24GUr+IQTw=
X-Gm-Gg: ASbGnctGEXjeDEpfG0nqVbHc/RMXsswzaOgKgG4me9obpJWHVa5fR8i3AURO9sgN+9e
	5cICYvebjkS0rfL7/bERHCopoodoabW3gYdQ7s0haluyoIfY+VE5IKZIqEvm6YRydY50J7j5zWH
	xAYl/wKUtPm3EpdRHS4yIhgeQ=
X-Google-Smtp-Source: AGHT+IGSgatN5rOkXyO+HN0Mtf/qXO/pQBgpbwiJoE6D38kBMGUqLjlOsY1XJqbYT2jhs9MnT6oDsoRtvkAVXQEKdm8=
X-Received: by 2002:a05:6102:15a5:b0:4c1:7ac9:9f67 with SMTP id
 ada2fe7eead31-4d5432eee76mr5100595137.5.1745742158757; Sun, 27 Apr 2025
 01:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_C263C0783702591C464F887E3D3C496E6B08@qq.com>
In-Reply-To: <tencent_C263C0783702591C464F887E3D3C496E6B08@qq.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 27 Apr 2025 16:22:27 +0800
X-Gm-Features: ATxdqUFnaRdo-2KvhWOLgf9uTEGuk_S8fFlHVOz0WBUNzslknZgG3h9DGpZJviI
Message-ID: <CAGsJ_4wWK6B8GSc=cxPGnPU0Jt_o0YB55yk4+VNOm_hY_iditA@mail.gmail.com>
Subject: Re: [PATCH] mm: remove useless code
To: Feng Lee <379943137@qq.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ryan.roberts@arm.com, 
	libang.li@antgroup.com, peterx@redhat.com, maobibo@loongson.cn, 
	lance.yang@linux.dev, anshuman.khandual@arm.com, trivial@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 2:16=E2=80=AFPM Feng Lee <379943137@qq.com> wrote:
>
> Remove unused conditional macros.
>
> Signed-off-by: Feng Lee <379943137@qq.com>
> ---
>  include/linux/pgtable.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b50447ef1c92..47c5a54b7551 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1164,9 +1164,7 @@ static inline void arch_swap_restore(swp_entry_t en=
try, struct folio *folio)
>  }
>  #endif
>
> -#ifndef __HAVE_ARCH_PGD_OFFSET_GATE
>  #define pgd_offset_gate(mm, addr)      pgd_offset(mm, addr)
> -#endif

Do you know who else had pgd_offset_gate() before except ia64?

/* Look up a pgd entry in the gate area.  On IA-64, the gate-area
   resides in the kernel-mapped segment, hence we use pgd_offset_k()
   here.  */
#define pgd_offset_gate(mm, addr) pgd_offset_k(addr)

btw, do we still
need pgd_offset_gate() given that nobody needs it now?

   1   1168  include/linux/pgtable.h <<GLOBAL>>
             #define pgd_offset_gate(mm, addr) pgd_offset(mm, addr)

   2   1112  mm/gup.c <<get_gate_page>>
             pgd =3D pgd_offset_gate(mm, address);

>
>  #ifndef __HAVE_ARCH_MOVE_PTE
>  #define move_pte(pte, old_addr, new_addr)      (pte)
> --
> 2.49.0

Thanks
Barry
