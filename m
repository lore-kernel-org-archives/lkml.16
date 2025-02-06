Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BD132C85
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 01:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738803973; cv=none; b=AMKNvRZux6mARViEmFsjipZZx2wjZiO9zSrH8bO4tzSypqlDqVd1lId1ROtShYZywKeZEbFRZET6Rt/VHdyOnctTxehu+gBuzCUbJ/ve0QBAq1mO78Lk3xZyKSofO1CuAk8unlksNd6cS5bxSEKFJPcIzuaX6xphdIIy1Yacc88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738803973; c=relaxed/simple;
	bh=IXC13o6D8+SRcnZ4bUuI8mYmE2RIqCqJ9wgb+sl11jc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=uYY93XVYN+w0utVmgCvpKCMBbyYl9nQ3TINRenlpHQJvDnEcObCPeVSdbS8blCd+qljzUhmeorG0xYRkhAhoB8PIVtjoQ03a/cjzp+PC8N4GYZgsZdCtGVfP34yIkabwOaReQNefkItgj5IWPjCZxysPREXa/c0VLYZd58YNE2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=ioCHvCoI; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="ioCHvCoI"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so136399f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 17:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738803970; x=1739408770; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXC13o6D8+SRcnZ4bUuI8mYmE2RIqCqJ9wgb+sl11jc=;
        b=ioCHvCoIHjgIxCOm7Fu2bDZ3vrCuFmrV7l7XhRtTqLkdDXqFdoHCra5rd/ZEtNGTpf
         yJk2oNbTsPQjTYyusPKhNhHXNaEf490k4oYL8d1o0Mm3/FkhuANbwc9WVgkx8wTlPLeV
         8FLckQCuFPd3YT9tmTHy4wrn7JSWML8ZbmePzdfcVxoIzm38sZvppJPejGy4FAsYcRBd
         0qwHZU3xJpUABEdWIFGSAjk+3MXTTZ0DhZsWm1n7eN0SdCQd8QX6fSDFYUVxkiWv7X7Y
         YsQEIG51xhktfbJV45XtNj/naOxc6NUMdfJXi2yMjuUWluX/QcI2LC7tpZZNtQv+kFZH
         QQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738803970; x=1739408770;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXC13o6D8+SRcnZ4bUuI8mYmE2RIqCqJ9wgb+sl11jc=;
        b=C4Duzus+dyIoXdlEfY1WsxpyZvSbBZDK3aNEy1iivikiMrBosRw/7SyZFGSPzHOMxF
         wRdS6HNwIO0FJUQ23OJ71JKupBLoTqvbTyWgyuXTaUXOp8OYUWFHowPoVvHY83f5a6TR
         kRGpZ3I5JJSEhKbDAXOLf0na7BR+WvCoDBnlnjsBiChGOkTeLSZSXyvRdZo0+lnf7rgb
         qo3HzN3VF+ZBnlDQISmslN9XFtXfK3LIVCpEgIbZdKA0o2oc7SYJ8Q9ipGP0eiUf5jTj
         dxAKHinB8UPD+Bz458vmn9OLE9R+fjh43/02j0jgLvLl88h7rzLBei3VdraCbdJrkyin
         6REg==
X-Forwarded-Encrypted: i=1; AJvYcCVG6U1PZOcW984uKAncOC+T6ZyaxpquOqZr9ibe3ucpBigrlqtCGQQW01u6A1ke6iyzhU9IKkW8rXul/KU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWNdpJarCHExLy3S5g0jDxxeVymPHLVFFB9/V+eBChpDi7GUz4
	yA3YFywaj8ltBeGNafoTqoWa2cwnXtHKu0rAH3wbXZforXJvrpEt0eUGbHgjFgc=
X-Gm-Gg: ASbGncuKY+/VgW5AhnNM9ExnxBAguM24slciKcXdbnP0Z3lreZjVU0+XpdazCzyfBrp
	Y8wvcmP9DKNmGpMvnIkjgHLOldaRrWsXF6jaZt/8H5OZ5Ga0Hz8AzI9n1Ly5vqzPgZiXw9g8LzS
	yWmcN6CH3qrDT+rzH7Dw5lWtz5a2Jj/TA/HyXqoYIYNs36U1U4TatngQQbHXuAOU7EbIpTMWQ1g
	F9qTC+7vwhJRsRLy7BRCjrN0i9MiXQZREbHa0WeDxTnz13qIhhMje0Ig9qwI9LanzJF+boCyNye
	CCy0TUz+WCXZAV6twSIryQAkWcXa
X-Google-Smtp-Source: AGHT+IEwac37+EXHhjn9+QPVtQMUBZtDhAuPXBew4a2Q2YL1bLmJ4OaTvYU/Tl6sFbBaC4yuKH/eUg==
X-Received: by 2002:a05:6000:1f87:b0:386:3e48:f732 with SMTP id ffacd0b85a97d-38db4873819mr4226170f8f.16.1738803969824;
        Wed, 05 Feb 2025 17:06:09 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dcc7sm246954f8f.88.2025.02.05.17.06.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2025 17:06:08 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for
 x86
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org>
Date: Thu, 6 Feb 2025 01:05:56 +0000
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 luto@kernel.org,
 xin@zytor.com,
 kirill.shutemov@linux.intel.com,
 palmer@dabbelt.com,
 tj@kernel.org,
 andreyknvl@gmail.com,
 brgerst@gmail.com,
 ardb@kernel.org,
 dave.hansen@linux.intel.com,
 jgross@suse.com,
 will@kernel.org,
 akpm@linux-foundation.org,
 arnd@arndb.de,
 corbet@lwn.net,
 dvyukov@google.com,
 richard.weiyang@gmail.com,
 ytcoode@gmail.com,
 tglx@linutronix.de,
 hpa@zytor.com,
 seanjc@google.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 justinstitt@google.com,
 jason.andryuk@amd.com,
 glider@google.com,
 ubizjak@gmail.com,
 jannh@google.com,
 bhe@redhat.com,
 vincenzo.frascino@arm.com,
 rafael.j.wysocki@intel.com,
 ndesaulniers@google.com,
 mingo@redhat.com,
 catalin.marinas@arm.com,
 junichi.nomura@nec.com,
 nathan@kernel.org,
 ryabinin.a.a@gmail.com,
 dennis@kernel.org,
 bp@alien8.de,
 kevinloughlin@google.com,
 morbo@google.com,
 dan.j.williams@intel.com,
 julian.stecklina@cyberus-technology.de,
 peterz@infradead.org,
 kees@kernel.org,
 kasan-dev@googlegroups.com,
 x86@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 llvm@lists.linux.dev,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <29A74A26-E922-4A4F-9B4A-8DB0336B99DF@jrtc27.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
 <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com>
 <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

On 5 Feb 2025, at 18:51, Christoph Lameter (Ampere) <cl@gentwo.org> =
wrote:
>=20
> On Tue, 4 Feb 2025, Jessica Clarke wrote:
>=20
>> It=E2=80=99s not =E2=80=9Cno performance penalty=E2=80=9D, there is a =
cost to tracking the MTE
>> tags for checking. In asynchronous (or asymmetric) mode that=E2=80=99s =
not too
>=20
>=20
> On Ampere Processor hardware there is no penalty since the logic is =
build
> into the usual read/write paths. This is by design. There may be on =
other
> platforms that cannot do this.

You helpfully cut out all the explanation of where the performance
penalty comes from. But if it=E2=80=99s as you say I can only assume =
your
design chooses to stall all stores until they have actually written, in
which case you have a performance cost compared with hardware that
omitted MTE or optimises for non-synchronous MTE. The literature on MTE
agrees that it is not no penalty (but can be low penalty). I don=E2=80=99t=

really want to have some big debate here about the ins and outs of MTE,
it=E2=80=99s not the place for it, but I will stand up and point out =
that
claiming MTE to be =E2=80=9Cno performance penalty=E2=80=9D is =
misrepresentative of the
truth

Jess

