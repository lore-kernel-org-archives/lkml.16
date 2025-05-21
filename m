Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710C4191F66
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829694; cv=none; b=TAoaNb9PQjoxGjZzMYi+zHvGGEOsor0ejUpPAqPjR0MDHD9WM2XBjAmdY1Z7V/lZndLePPioYUj5NhZSFvKYrvPumXlav4hRDhNTdYFbfjEBHFGlaVapELlpT60mfa1BiVPjqoKR5yHridDkAiW4x5TkV+koHCuilAgHZHrPjIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829694; c=relaxed/simple;
	bh=BdhtNrvIIR1Xpfw5qOBVBR2RXJfcMOf1eiADP+2GF9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWnUqgaEqtnyMHwLQ/Q018+CGGEY6E6zgib/SSYaphTBPQKbzHqFRayIPmJANV+bE/hekdOy+6f/vp81gqpq9BJ+QMBu6veNhQ+TYKD1Jb8qz975ZUxWqZEiiyPYdIM9tTI0SlBVTgLRLTm7ZDh8w2+wo4Zaoiajq5y1Wux1qY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oe5GKIVS; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oe5GKIVS"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f8b2682d61so55212316d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747829691; x=1748434491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdhtNrvIIR1Xpfw5qOBVBR2RXJfcMOf1eiADP+2GF9Y=;
        b=oe5GKIVS2XJXZdKHs7xLmeXIb6AyEGrC/pU9ESr4GvZT+6r3vu09nXDroqfbevRi1v
         rJeDeG+42pHnpORmzjbI++SatnE8o0F+lE2Pb48ir4WKme6mWASPa8p1HGFTH3cKEbIF
         /9ryM1wTkbWfaRdnkSCJZgHwAiAQy9VMxl9ZjFvEzfRDDP7pvL9emaBw5vN6CsWOK5/s
         K1pEJNZ7/pqqg9usaLDAowjisCK57UigbcXTvMOxb3GgIF2uXCt9OG5B7UkwOcU16cko
         OrnksIU+Vwz/VLtiRxjvLPHBhSQmGs5/M7BdE5Ne/V/2FjBkFtgOHyw5xL+euyJXtWBQ
         730g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747829691; x=1748434491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdhtNrvIIR1Xpfw5qOBVBR2RXJfcMOf1eiADP+2GF9Y=;
        b=KMYRUDUW4fvnyneKwixsxSYJaGe6rw/nosEmXzXxM4WNzOCn7eoABRbyTTv4vEMFCq
         thG/S5Vyy9RFFYxd09bc0jln76wW++YMriNEKkGx+uX1lCIWUrpHDH4Q/qrlZHPjdqmA
         T0/ActooDSUAg1xqsw9xTgLy4NoBvQVNMFJkahvbCT8RvvD6tOjabS9biRmW4gkpjrJM
         t1IURr2whrcAk8nXnmn5lRbLb2Slim5y1DNi0PvW4v5MzBC9pCTclz4nxL9GU28+svjQ
         OcGCPIcU45RVCG7d4aDKgwLv1G6YlslhHfO/Ud9HieErgQqv3QS4vz6ethdMHCOcAF5n
         coiA==
X-Forwarded-Encrypted: i=1; AJvYcCX1tJMqICiVIvooVANZ/wvzY7DEFaZB4Gcq2HFblDzc94TiKashtdFoHvrPD0VhoCuI8kt+OMVvs4QpkVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTB55r4Z2eYevR+rFR0n7KY7nq3veJ1/M8m1cnIp2qqWk7alFy
	ryWxXHqOPufdok0anQ9GPsrHB2DhoXpFDbD38Ej4+JBHrESPDJcxSa3dnxqVhJZ1ihWm7C5b/5r
	+2lGTHWyUZMpcAu7zOt71xaykwmOQ4hIOwKIbP6J3
X-Gm-Gg: ASbGnctREVrs/35N1zSNbbCMZlRSiOKDIxvZPJFphPpm416+rcQrL0hr0NiqCPf8h8E
	d8TiLLIeZQC4j9REcCK1MLY5wDMvd/Nkq3OFKjTyo8kH/oiXp+varT4Cm+o1ivBOBacC3/pORaI
	dXhz9Ii+nM4NbutQ9dIZv+WzCTNWLzjhPdsmBX2fVBAN5cDLZCbb0VT3qQnNQh9RGf6B2UKEAC8
	mGhPaaGNew=
X-Google-Smtp-Source: AGHT+IEXiWjVWeop/NA6z5yuHpe3/MseMO8D8a1wSQhNEjBsJTCyvpPUj5CHc9RROg8Yfw/OkqJZuauWe6K6Ho1zkN4=
X-Received: by 2002:a05:6214:1c8a:b0:6e6:5b8e:7604 with SMTP id
 6a1803df08f44-6f8b125afffmr336152846d6.12.1747829690691; Wed, 21 May 2025
 05:14:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYSPR06MB71585D5693970E3C090A1DA5F69EA@TYSPR06MB7158.apcprd06.prod.outlook.com>
In-Reply-To: <TYSPR06MB71585D5693970E3C090A1DA5F69EA@TYSPR06MB7158.apcprd06.prod.outlook.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 21 May 2025 14:14:14 +0200
X-Gm-Features: AX0GCFtEeG8v-71iddYaXA_4cRfmrKHgShl_UAokmhXXjryKvZi_7DXf7ZWAHS4
Message-ID: <CAG_fn=VT5=PcD5-bFY5LQ7SHhGg+epUAM5HGLBEFEaM55UVi2A@mail.gmail.com>
Subject: Re: KASAN: slab-use-after-free Read in bch2_btree_node_read_done
To: "huk23@m.fudan.edu.cn" <huk23@m.fudan.edu.cn>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"syzkaller@googlegroups.com" <syzkaller@googlegroups.com>, =?UTF-8?B?55m954OB5YaJ?= <baishuoran@hrbeu.edu.cn>, 
	"jjtan24@m.fudan.edu.cn" <jjtan24@m.fudan.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 1:50=E2=80=AFPM 'huk23@m.fudan.edu.cn' via syzkalle=
r
<syzkaller@googlegroups.com> wrote:
>
> Dear Maintainers,
>
>
>
> When using our customized Syzkaller to fuzz the latest Linux kernel, the =
following crash (104th)was triggered.
>
>
> HEAD commit: 6537cfb395f352782918d8ee7b7f10ba2cc3cbf2
> git tree: upstream
> Output:https:https:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.=
15-rc6/104_KASAN%3A%20slab-use-after-free%20Read%20in%20bch2_btree_node_rea=
d_done/104report.txt
> Kernel config:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc=
6/config.txt
> C reproducer:https:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.=
15-rc6/104_KASAN%3A%20slab-use-after-free%20Read%20in%20bch2_btree_node_rea=
d_done/104repro.c
> Syzlang reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.=
15-rc6/104_KASAN%3A%20slab-use-after-free%20Read%20in%20bch2_btree_node_rea=
d_done/104repro.txt
>
>
>
> The bug is a use-after-free error in the btree handling code of the bcach=
efs filesystem. It most likely occurs in the bch_btree_node_read_done funct=
ion (defined around line 193), when processing a btree node and validating =
its contents, the code attempts to a radix tree node that has already been =
released by the RCU mechanism. The root cause of the error could be a memor=
y management or reference counting issue, especially in the complex of oper=
ations during the filesystem recovery. It could also be in the btree_io.c f=
ile, around lines 300-350, which handles btree validation and reading.Espec=
ially in the call or implementation of validate_bset, validate_bset_keys or=
 bch2_drop_whiteouts

This is a known bug reported by syzkaller at
https://groups.google.com/g/syzkaller-bugs/c/Q4Vjvpe9ab8/m/e8jpti-MAQAJ
(dashboard: https://syzkaller.appspot.com/bug?extid=3D92e65e9b7a42d379f92e)
If the goal of your research is to provide AI-generated explanations
of kernel bugs, you can probably take the existing bugs instead of
duplicating syzbot's work.
