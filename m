Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ABF2E62B0
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 06:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743922103; cv=none; b=AKut9YhML7Nulgo0c1QvHk7YwbOYyi7wFeraPC9JFoZY/6zSj3OEbq+0gKvosUaMm0CY8n6TgdK6Q5N7eyyP+LJQMcTIm5qYCSq1MLUR8bdNVR+NKecsADYMsoUELyP4+p/pNuG2eBOFW6EW7mjdR5O3FgMb6kEVt1Ay9n2SKWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743922103; c=relaxed/simple;
	bh=iMICzxd1P+u/Qa3sQqcyBvzc2aEVnrNNe86fC9LmAfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqNNTBlg6aYwScUfoOvCLF/FVOza91/VisZGSIcAjRK0ZVOBgzXKxsHCihpzSP9+YVAjvwefD8dsueErFAgranXfpgKqTxQl32rKwoncnlGNV9Zun7YIjsfXiQgVaNVRQBDi71XCBRmVbMNsjeznL4/IYDZoasJnvpysung6UZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1IWfNt8; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1IWfNt8"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30613802a04so36198421fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 23:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743922100; x=1744526900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXpap6S8Raqb0GYzHr0IbbUTR7Z6Tf2dWaU3zAsj7bU=;
        b=X1IWfNt8kWsbeN+VOXTnHba2O8WSw+p868EaduVTB5u25u8U+9wPOW341E4A4PzrU+
         Y8mzWhhyyPN/at+GmzU56FzPRZHE3MbvcsHomvt7bvlSDDt0qZwKicU0xfuv1Vz94Rgc
         ZB4qfpcrkaol17YZ5YfdNWqfV6jprOc26VLrBFbSU5QCkOhEBfQkAqw+GyUexbN/b0Sj
         LGVkPPFc7hdOszmUgxbz1xMsM26S7WtT+o4sgxmYnjJT87MP2RZT2yh0c+qYkuBmy8S6
         woaTOwNPwPew4/BDakx3sAqWx7E3iPV4OEGOaT2cvXEvBkk2f2kneH2mKPiDbD16FA+E
         ry0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743922100; x=1744526900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXpap6S8Raqb0GYzHr0IbbUTR7Z6Tf2dWaU3zAsj7bU=;
        b=BYnx5a6pTbfcdzZuDbmhYVWBqoAY1prhQNi6r1LP+jAbfBNHu3Dn+xQslWBDw8jf/5
         fcUeK/MyahFDsHrkR/vJy6Lpoa4wfjqcjsjzf5u0IZjcEI4lExlMm8s5yT/fx/OTVUKE
         FcTk5jCEhOwDtRunLRgl1SmxIBGFX6EVOH8U3Aalfif1NbIbWm79N2T7xl3uo+VYV6Zh
         ptF7WCFqYBW7lxO73+XhCdkrgdl8gFMff6H5dgqShvseaVRRK9kIy5V+vPf5/Ht2BtIy
         GEbPnzychQvmtBlGtrBSgyNVCcclY9rFVRU7AJLbtX6VUzThunMPLstEttbcetPY05eL
         3SSw==
X-Forwarded-Encrypted: i=1; AJvYcCVzNKf3lexhW0XsAY+4JUJ0MYt8SovoI21vNNBktk/E4eCVklpKTIA+j59Zh3IcP3gV1MlIqntJKwwpst0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdIXbwV7g0J9JKPRFaNGF9Mf44BGYRYSvYKbr8MgfQw3T1M4JN
	tWII3zU4Ml2Mc0mMFsR9RIgJ/o+Uh63z/ejrx33N14qfMdiwgCLafNKOjOw4USHPU07xLRJqYsM
	728YZgWD2cHhuiE3iLdWvouymna4=
X-Gm-Gg: ASbGncsds1kujCg1lH+WKxHsIFxoooc/PC3Rr85hTEKZkaa2OibcrtYbmzOPlEtrIKA
	LLVDLJttiSXJjhUet+CYkTzbd4KCQBsfa6zUCjpe3pSevN2NMQAPFDI78nYCQ7hyyQfzI4Pb012
	arZ90+zmOuvRNo+or0BZaUhIhbqA==
X-Google-Smtp-Source: AGHT+IG2H5kDiohEMrhbIMXg1UKx4Gf8cH4chSFOscSIaxQHoT9S63sBdbP9rveCyv2oWERHb26dkss79rxZUXR3YIU=
X-Received: by 2002:a05:651c:512:b0:30b:b987:b676 with SMTP id
 38308e7fff4ca-30f164f4930mr11935971fa.2.1743922099666; Sat, 05 Apr 2025
 23:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <eb3c109f-550f-44ce-b0a1-3837aef1d02a@molgen.mpg.de>
In-Reply-To: <eb3c109f-550f-44ce-b0a1-3837aef1d02a@molgen.mpg.de>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 6 Apr 2025 08:48:13 +0200
X-Gm-Features: ATxdqUEgRjJ6D9lPcJ6mWXr-FVdh3CJsvWb7c_Jwui8lE-MuxINFdg6hqlUWaXs
Message-ID: <CAFULd4ZkkMjPh++2N-TVOabVcs_HhKb-4Qrgs16vnW2LrhpQzw@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFdBUk5JTkc6IG1vZHBvc3Q6IEVYUE9SVCBzeW1ib2wgIuKApiIgW3ZtbGludXhdIA==?=
	=?UTF-8?B?dmVyc2lvbiBnZW5lcmF0aW9uIGZhaWxlZCwgc3ltYm9sIHdpbGwgbm90IGJlIHZlcnNpb25lZC4vIg==?=
	=?UTF-8?B?4oCmIiBb4oCmXSBoYXMgbm8gQ1JDIQ==?=
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, regressions@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 11:00=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> #regzbot introduced: 6a367577153acd9b432a5340fb10891eeb7e10f1
>
>
> Dear Linux folks,
>
>
> If I didn=E2=80=99t screw up `git bisect`, then commit 6a367577153a (perc=
pu/x86:
> enable strict percpu checks via named AS qualifiers) [1] causes the
> build warnings below:
>
>      $ make olddefconfig && make -j128
>      [=E2=80=A6]
>      WARNING: modpost: EXPORT symbol "xen_vcpu_id" [vmlinux] version
> generation failed, symbol will not be versioned.
>      Is "xen_vcpu_id" prototyped in <asm/asm-prototypes.h>?
>      WARNING: modpost: EXPORT symbol "irq_stat" [vmlinux] version
> generation failed, symbol will not be versioned.
>      Is "irq_stat" prototyped in <asm/asm-prototypes.h>?
>      [=E2=80=A6]
>      WARNING: modpost: EXPORT symbol "__irq_regs" [vmlinux] version
> generation failed, symbol will not be versioned.
>      Is "__irq_regs" prototyped in <asm/asm-prototypes.h>?
>      WARNING: modpost: EXPORT symbol "radix_tree_preloads" [vmlinux]
> version generation failed, symbol will not be versioned.
>      Is "radix_tree_preloads" prototyped in <asm/asm-prototypes.h>?
>      WARNING: modpost: "pcpu_hot"
> [arch/x86/events/intel/intel-uncore.ko] has no CRC!
>      WARNING: modpost: "numa_node"
> [arch/x86/events/intel/intel-uncore.ko] has no CRC!
>      [=E2=80=A6]

The patch at  [1] also fixes this issue. Actually, this warning is the
root cause of your previous report [2] and is due to genksyms not
being prepared for new keywords.

So, either genksyms should be enhanced or a workaround [1] should be used..

[1] https://lore.kernel.org/lkml/20250404102535.705090-1-ubizjak@gmail.com/
[2] https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56a-131151e1c035@molge=
n.mpg.de/

Uros.
