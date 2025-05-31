Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A94D380
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 00:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748650274; cv=none; b=VtbkkNxylbazI9SZeOYethjcuwhxr0B5geUGesrLyfOJBP/GbI9Ft2Sotqtloaw3k88P63iHUTZyEQerUMoOq40wFvPfUtF86a+wcfRb6GlHSk0/Mr42tWPONwfcnhmUhPI7EQGsTLq1PoPFGAcsU9vu5ThfX1DnX22y/vFD460=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748650274; c=relaxed/simple;
	bh=C7yaz4RAuS1yTrnYRUAI5TqmPgiceLDnzKlSpPtg4II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eoMEcnqcMYLKPB0pCYEi6T+yRTZtTobHaBv4m2oMlxGu8/O7eR7A3AmrfitDiplFv2lls6gz71KSthrGFg9WpJueumKYOAsv7+rhPGyk3Wvtar4Rv6c+cUnxNekUn/eWrVhMTRCeGbPqA+6Aqhu6Q5B6eJGGifeYuZtSpeq5G48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U0Cd11OR; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U0Cd11OR"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5240a432462so1610727e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748650271; x=1749255071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wu1nBa4ilpJemQQpGyZMUSIJb8sM6APaQUaM5CiIuUM=;
        b=U0Cd11ORgexX+iDtERdvPIya0CKhSknU1XZ7U32543xbhPs9ey/1qfv51GElVGbtkp
         7bParYfo+TwvyWlrfqd6W96Eh4U74kZe51iIe6znMnFfyUZx4dDXu5/lC9rOfZZVoKdW
         jfUblFDSQml5UQPZRU3Xayn87vhc+OYpxCyQeShOZ1IVrbD9XATIQoxQJPKjYa1dXkwZ
         E63a2Vo5+p3nVMaLbVxkT/l3pxARnxfdBrypnnqqmbOTspHg6jD/evgZrnupbKI/UHuH
         v+t2Ii5/Asio5SKp8iI8JBueTmHPlOWC7hHvjT1+Qr/9ZItA1euw2cxtvLCup9gky8Zv
         IguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748650271; x=1749255071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wu1nBa4ilpJemQQpGyZMUSIJb8sM6APaQUaM5CiIuUM=;
        b=OVQgXkWYjUQRxtBoCYbVrqFsvI2zNgers2TncbgIJHJOprBIbzKL/D/pDlp2YWNfiV
         NPVX25pY9SNXbowDMZq5B5TyHdjiyQd5ujRqIFjqky+ogilx7uZ8DZveywZ5B2I7Tg1t
         +GvkxLBeZh7tsrc2RVujhD2QDsFkQ38leCPGa+SMwU2wipuaEvz/KKEi7ahDKTjuUuh9
         i5j9j802iwc4uWWbwvaih0s7IUGWdDpZIks3cBDh2bCuazTaSIhcNPgBfQNnhUy2k1pg
         0AS3ReXguGB075tesGUe/Zr6KD1N0DI+4517Cblzd8gQ/UMm8DIAQcrx+NxsAqLljbxl
         WC9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjFTDDM5KuIZ/SVIAsQLomhQPWrEiwXe7+6e344T90ODPfo6JhUeVTgh0Htt+XgzfjrT4PU+iHwKfOghY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFLhnhC9zeLEugDsQQFGhtgkIJmUl/UEsfMZmEHsMsn/E6ma/p
	NngUYs8VaMkTBwzLCnOf0368iuVg07OGFbKrUIKIq3lcW+biTTkWUeRMlGmwmuCJ+NDubmoBIUl
	pTp/mEOYc76pQiGd4DgDyiukjXFhLz5GEWSFNPR2/
X-Gm-Gg: ASbGnctLitkicX/962m/bFswwWkUnq6H6JAVdmnxsv75Q5RPCK43Gd170eFdhT4ZkVK
	JsPBM0mS7G6coG4mVmQsjmQQnozlw9TUdDftCwO144DDf2jMS9PV+qPxMtIOo3Vji/NcZS0ExXG
	g4tM9If7hPA5SAxdyF/PxphtGBby/qtRytwLvb7tsEgYg=
X-Google-Smtp-Source: AGHT+IF1bYdXHRblo7zBFr6k+2FDjQ0Rocs0mQmpNa4kQY5J8sVxiRZbkV0jwf69ghtoDETnkE6jAefBn8zwr4Afp0k=
X-Received: by 2002:a05:6122:2a15:b0:530:5b1a:2b98 with SMTP id
 71dfb90a1353d-5308126ac52mr5230059e0c.2.1748650271440; Fri, 30 May 2025
 17:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530000044.341911-1-dylanbhatch@google.com> <20250530141325.GA30733@willie-the-truck>
In-Reply-To: <20250530141325.GA30733@willie-the-truck>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Fri, 30 May 2025 17:11:00 -0700
X-Gm-Features: AX0GCFtsaV-SgHOlpiJeUGlpj9g_QHSPyIu2zUGrlxbz3jfTMw7drPnQkTVMUTQ
Message-ID: <CADBMgpx==FnFj4okXs1n3NPngh7Os1YpnGrDDe8z_t2X7bzOOQ@mail.gmail.com>
Subject: Re: [PATCH v5] arm64/module: Use text-poke API for late relocations.
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Song Liu <song@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Will,

On Fri, May 30, 2025 at 7:13=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> and this would be:
>
>         WRITE_PLACE(place, cpu_to_le32(insn), me);
>

I'm seeing this part give a build error:

arch/arm64/kernel/module.c:158:2: error: cannot take the address of an
rvalue of type '__le32' (aka 'unsigned int')
  158 |         WRITE_PLACE(place, cpu_to_le32(insn), me);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/arm64/kernel/module.c:56:28: note: expanded from macro 'WRITE_PLACE'
   56 |                 aarch64_insn_copy(place, &(val),
sizeof(*place));       \
      |                                          ^ ~~~

I can't think of a clean way to get around this and still keep a
combined write helper. Setting an intermediate __le32 in the
reloc_insn_* functions would work but we were trying to avoid that.
Setting an intermediate value inside WRITE_PLACE would also work but
then (I think) it won't work for the data relocations because we'd be
converting a signed into unsigned value. Making WRITE_PLACE a function
instead of a macro also fixes the rvalue problem but then the args
'place' and 'val' have to be of a fixed type so we can't do the
typecasting on 'place' and 'val' has the same signed/unsigned value
problem.

Do you have a suggestion here? In the meantime I can send a v6 that
uses an intermediate __le32 for the instruction relocations.

Thanks,
Dylan
