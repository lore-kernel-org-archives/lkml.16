Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AF4139B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745782508; cv=none; b=uSkopRNfgOiGN8P/R4Zzczi6bLLfpuUTq78MxcwNJTdrAHPIrFSZlLGzww6Ti4SQJYifna6c/B3pn4hmwt9un+6REVhuDr7EK7D0MLkVlmxQ8fIGdxWlHzhP3POWX2ctvl+Jc5TG/xy0ndEGz3JhDZyxfGLp0KCsgle3FrAQVBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745782508; c=relaxed/simple;
	bh=mVu+eONeeQwF4eqyGItHismHzlmGpzqBc6AEoNiczUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d9JmPVTti71K9wbsZJO/dn+obpfF3Lb7JUacZmneBTnnTOwKDWUzyJtPND+Z3S7R6ZkbsWNx6mEm9gibaCnVlmN+GJlRQL+MIk0e+OEdPcXKunoJfRF0KbECOPek37YhfHVAD7Pr61a6JppkIjhLMxzMAZwVCrkyQoubLY7VquU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WMP5gXTN; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WMP5gXTN"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so6648331a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 12:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745782504; x=1746387304; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5rN1yxa+VmayTbEeOUM6CUkhiAacZjPAguEXDsRJf1s=;
        b=WMP5gXTNjEZdtrdgby2TkkhAHU7PVLNTNYlDk444nOuprusbI1/WA2Tf2ONKxmeCAm
         Ajbpe6hu6o6nbrwoGSknUYd0xxaFWqQBkIJ9CVRlhlo2SvhXU7Z9cL+a10ZpZr19zwo7
         5BUas2p1kwRroJgk7vaE+igwXVulXI/gJyyCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745782504; x=1746387304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rN1yxa+VmayTbEeOUM6CUkhiAacZjPAguEXDsRJf1s=;
        b=lH7Mog80P4WaIu/7wNufh0IxVERaI0HcacgqItcKrlekwASF+dpHQDS+0Qqya8PXqi
         pe2QfQQzG4dlz7CAS6QnchGShSUx1Vyr8PnvyLJv1hrI7M/Us+NaufOLF3VaFEQKIqIn
         3S0u2RKzXJ6686T31oGCKfoi8KpOFPgm/ISulgsQlLMn5393ibDRU8lJVO6Ahxh0lEEo
         966snHKMgDr+OullUXjJ7psT2brkaYNhAVNVwtCV2yI1pH2CfgogBlw9HHv3LGUUw9Oh
         Y+vlZsSwU3ZGuQti/WaIsO0CV6JJBE8NnsJzNcQCUaIySh7ZnabYSxA727PaxtTync/q
         C55g==
X-Forwarded-Encrypted: i=1; AJvYcCVuL69uvbNnQtghbSk2k8pgbquOXtrO3BtyK4vG8j/NzFOD11gzvHoMc+6+BcPypgUmpCOKsrB0o4BJA54=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzGGniXjb6doOIsmc5Hco9d9temwbIP6GedribDGlQ9rjxx29M
	0/mI5yIpoWHUC+vDjC20Ac2jprpRNXV4+nPn4AAPX0f58/a/obvJociROzNJokqpTsv4WB1zCE/
	H+SaiLQ==
X-Gm-Gg: ASbGncu3NoazZfkQVTtFANeIBaUry2qkY30UqQHTXF/jBnoJYG4NGVBFXDGaAiG+jY5
	QaKfHm9FDGD7Ts11i7NJIs6vK7CxtOWWC9sTa9UHfS2ALUakEipTO8eRRSA/AHDqkQw0l2ziehx
	o+A/FJ7B6mi3Dg2LhMUIB3R82CJ4dI5feRyStUnuYdC6zGJye6oJ5pEVIoBBafVceOKuGYS6Yc4
	+0qsF2ZQUMajpCsMOsmyFRle3UwkQdt8550LqfktkxIVFneebVhaXnxQa1R96bYQq1HqvsuyG6w
	gt7a+5/ATXXmXR+Z1IasMJut0peJKdCCVkMDyR/YjQuXZQSPogUYycKpHoYA3uN0bO488afubk+
	sUMDBz6l4UOXFSZ4=
X-Google-Smtp-Source: AGHT+IF+SHJxWjyreuU9au19e5wRI0xnFbQdtYUjmmdGR4G5ayJH0ai35DGx5OC2QyZb9OoFsPqZRA==
X-Received: by 2002:a17:907:60d0:b0:ac3:c56c:26ca with SMTP id a640c23a62f3a-ace7104d403mr722938766b.8.1745782503635;
        Sun, 27 Apr 2025 12:35:03 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb0becsm485234766b.167.2025.04.27.12.35.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 12:35:03 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso870838266b.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 12:35:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyKIny1onr4+9puhBtYTW8QpM0U+NMqlHHAPFRvk8CZe2thGNJwplIwYcQuZKO1nENNBJWrc3z74dBFEs=@vger.kernel.org
X-Received: by 2002:a17:907:7255:b0:ace:3be2:bde6 with SMTP id
 a640c23a62f3a-ace713ab817mr839196166b.56.1745782502956; Sun, 27 Apr 2025
 12:35:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com> <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
In-Reply-To: <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Apr 2025 12:34:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
X-Gm-Features: ATxdqUG0Iakpe0wsIdSBOIf6OimwvL9XYTZUODPdBy5LQnvL_Hn8VAMvhzggDyc
Message-ID: <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="000000000000f1ea350633c7a98d"

--000000000000f1ea350633c7a98d
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Apr 2025 at 12:17, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> ffs/fls are commonly found inside loops where x is the loop condition
> too.  Therefore, using statically_true() to provide a form without the
> zero compatibility turns out to be a win.

We already have the version without the zero capability - it's just
called "__ffs()" and "__fls()", and performance-critical code uses
those.

So fls/ffs are the "standard" library functions that have to handle
zero, and add that stupid "+1" because that interface was designed by
some Pascal person who doesn't understand that we start counting from
0.

Standards bodies: "companies aren't sending their best people".

But it's silly that we then spend effort on magic cmov in inline asm
on those things when it's literally the "don't use this version unless
you don't actually care about performance" case.

I don't think it would be wrong to just make the x86-32 code just do
the check against zero ahead of time - in C.

And yes, that will generate some extra code - you'll test for zero
before, and then the caller might also test for a zero result that
then results in another test for zero that can't actually happen (but
the compiler doesn't know that). But I suspect that on the whole, it
is likely to generate better code anyway just because the compiler
sees that first test and can DTRT.

UNTESTED patch applied in case somebody wants to play with this. It
removes 10 lines of silly code, and along with them that 'cmov' use.

Anybody?

              Linus

--000000000000f1ea350633c7a98d
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_ma01tdqy0>
X-Attachment-Id: f_ma01tdqy0

IGFyY2gveDg2L2luY2x1ZGUvYXNtL2JpdG9wcy5oIHwgMjIgKysrKysrLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vYml0b3BzLmggYi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9iaXRvcHMuaAppbmRleCAxMDA0MTNhZmY2NDAuLjYwNjFjODdmMTRhYyAxMDA2NDQKLS0t
IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vYml0b3BzLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9h
c20vYml0b3BzLmgKQEAgLTMyMSwxNSArMzIxLDEwIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUg
aW50IHZhcmlhYmxlX2ZmcyhpbnQgeCkKIAlhc20oImJzZmwgJTEsJTAiCiAJICAgIDogIj1yIiAo
cikKIAkgICAgOiBBU01fSU5QVVRfUk0gKHgpLCAiMCIgKC0xKSk7Ci0jZWxpZiBkZWZpbmVkKENP
TkZJR19YODZfQ01PVikKLQlhc20oImJzZmwgJTEsJTBcblx0IgotCSAgICAiY21vdnpsICUyLCUw
IgotCSAgICA6ICI9JnIiIChyKSA6ICJybSIgKHgpLCAiciIgKC0xKSk7CiAjZWxzZQotCWFzbSgi
YnNmbCAlMSwlMFxuXHQiCi0JICAgICJqbnogMWZcblx0IgotCSAgICAibW92bCAkLTEsJTBcbiIK
LQkgICAgIjE6IiA6ICI9ciIgKHIpIDogInJtIiAoeCkpOworCWlmICgheCkKKwkJcmV0dXJuIDA7
CisJYXNtKCJic2ZsICUxLCUwIiA6ICI9ciIgKHIpIDogInJtIiAoeCkpOwogI2VuZGlmCiAJcmV0
dXJuIHIgKyAxOwogfQpAQCAtMzc4LDE1ICszNzMsMTAgQEAgc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSBpbnQgZmxzKHVuc2lnbmVkIGludCB4KQogCWFzbSgiYnNybCAlMSwlMCIKIAkgICAgOiAiPXIi
IChyKQogCSAgICA6IEFTTV9JTlBVVF9STSAoeCksICIwIiAoLTEpKTsKLSNlbGlmIGRlZmluZWQo
Q09ORklHX1g4Nl9DTU9WKQotCWFzbSgiYnNybCAlMSwlMFxuXHQiCi0JICAgICJjbW92emwgJTIs
JTAiCi0JICAgIDogIj0mciIgKHIpIDogInJtIiAoeCksICJybSIgKC0xKSk7CiAjZWxzZQotCWFz
bSgiYnNybCAlMSwlMFxuXHQiCi0JICAgICJqbnogMWZcblx0IgotCSAgICAibW92bCAkLTEsJTBc
biIKLQkgICAgIjE6IiA6ICI9ciIgKHIpIDogInJtIiAoeCkpOworCWlmICgheCkKKwkJcmV0dXJu
IDA7CisJYXNtKCJic3JsICUxLCUwIiA6ICI9ciIgKHIpIDogInJtIiAoeCkpOwogI2VuZGlmCiAJ
cmV0dXJuIHIgKyAxOwogfQo=
--000000000000f1ea350633c7a98d--
