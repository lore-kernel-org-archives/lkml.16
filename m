Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54F61F1936
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743628744; cv=none; b=CrEl2PuZf33dYR3PVAbcy/S+jcx2ByveXYIeNbcyWLpSxWJGF9bhSW0WUXK5pzGWjw+VT6Sk0hM4w1HqCsmBNJRF798IlLhDlM0iq98eZboKG17GXwFN2TAFUE5sjrqOYF18Gofqq0ZGlg+vaji7iDaHdFWfTDPDpcVsFRXTc08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743628744; c=relaxed/simple;
	bh=dXZiBEzCPR8zIhSJ/3EQzcjD2Aj3iZGZmtOt3Co7nV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jAENbswdVGLj2TI12xTwoKqz+yH5hPETCssaV5YcwkItbGQvtBYEzvuBLwDjXVIOK8Ir6A1lOBa5e+9wj50ALvfaLvY2D9szQcLCQXjA1LDBEnepODI1tFOGwno1gk92cZT/zvS5jiCEcK5pLcfXdKXiFO6NprhHn4M263AVxps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcGdIPdE; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcGdIPdE"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54acc0cd458so330962e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 14:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743628741; x=1744233541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQs975IggfZ0tiYBcKSuTM1eOZ7bH4aXf5Bdj66xDSY=;
        b=AcGdIPdEkO2r3nRWzLl5aY1VI66Ty3MNpYk63qNEK+gr5rbuwcNqjaZ/HDMrwKEYe4
         S3U5Jn3EA/X2mg9rWVDJ/WF5qqozC9iL+l1ur88uaXhGI7ZFs2jpwBdLa/uGiNI4OaFo
         5/3BXZRk6L75ldP9b+p03fLV8YlU5b0ScdDfrye7Bsv0zAIqQ9iNt1ktHYHvF521OO1K
         8Hwj8Y+gSZyqA4h0I7nQAzZW5iRKVQWOa4HF4189ixBATRlNPP/8OLsHVgF4VSsx302e
         GWYgeGLRspmTTo3CjCWx2NLrEDWFLr2zSIcyed+H8Gzmsiky8VjmP7mmPZcHC8A7ESwv
         iHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743628741; x=1744233541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQs975IggfZ0tiYBcKSuTM1eOZ7bH4aXf5Bdj66xDSY=;
        b=AhKKZvC+OQsNtlIKO7vUBC6X0YPCaKaOE7ehSe7hdvqsv/tkQSqDJH0MMKAxoihOF/
         n1TAOo+may0zgWzbxLsVjZNS9iw4NjPWJDpV3t9HMcNehCb+n/mYglKYTgtanfQUJQkP
         UoW7jJeIjKJv1SD/bFVBR+MnqHpdkccjtEZedpMilSf0RoAHGy4RR9rbh1qHmTlHG4No
         5NHjbkNjX77JdUmGV+4/1TJXP9i8QmAkuqZ/xjdmKBRwo7byXEAtY+D5YkFWebBzGw5r
         m2cJ3QK49jBAqf1Mf/EXFS9hu7CN76+kOy4Xnsoc/atFxuYBXlfT/vjZ2pdcVmVxzDHr
         QdXA==
X-Forwarded-Encrypted: i=1; AJvYcCWv3bauH+789C4NR96kRWIboxUP37x9DCYX3mm5Xwk4Y3FMsU5W6SV05VTGZapC6VXepy85HGsda+hA3JI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgpxFqR96f5YfBTugmvq385zivxL1p8K/nn8RIo/csxldbLyA0
	IrH5hYAz4sJSwACU0mG++KmbU2hCNUvHbxnqshSk4vNAHdoSpHVew+LivoJ3ZS7z8QM9FFveLpt
	qDE5oMVJIsTGOtWBIMg3puUlMBZAx/tYd4kQ=
X-Gm-Gg: ASbGncsA+J6NnCA6zx1aLoJsZ0zPGLBhQQartngKBxsOQTPXNCPLzOvtBmKtwWalg6A
	q+9reTJgnMzeRQTOhScKsS63f/rQH1gQLxclvAe9YAHx1R6RqZ/5ttYC7urWRUD2vZTNnjZzHNC
	q+HqKOFCLpFcb0rUvdAS9j7q7coQ==
X-Google-Smtp-Source: AGHT+IHpxLqiEUZVkxgBhrOFVSglejZSFFGJJFqmchJakstMzsH6oxrpYouZ0C/aIEksX+7cdD3rMRnufjnf+gtSsC4=
X-Received: by 2002:a05:6512:118e:b0:54a:f6e9:2c04 with SMTP id
 2adb3069b0e04-54c19c6af75mr1194851e87.26.1743628740438; Wed, 02 Apr 2025
 14:19:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402180827.3762-1-ubizjak@gmail.com> <Z-2ii-KgGSsMMTvB@gmail.com>
In-Reply-To: <Z-2ii-KgGSsMMTvB@gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 2 Apr 2025 23:18:48 +0200
X-Gm-Features: AQ5f1JosY90Is0A4FOjBBnk-SgVXM0u55VBbaXfxlAZtFL4ng9w28AtjgyGR6Xo
Message-ID: <CAFULd4YBRcWhjwg_kMcDi4rN2rL61hAOwbe=b8FJfhxaS7VDhg@mail.gmail.com>
Subject: Re: [PATCH -tip 1/4] x86/idle: Fix argument type for MONITOR{,X} and
 MWAIT{,X} instructions
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 10:48=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wrot=
e:
>
>
> * Uros Bizjak <ubizjak@gmail.com> wrote:
>
> > MONITOR and MONITORX expect 32-bit unsigned integer argument in %ecx
> > and %edx registers. MWAIT and MWAITX expect 32-bit usigned int
> > argument in %eax and %ecx registers.
>
> Please always include a 0/4 cover letter as well for such series, which
> gives people a chance to reply to the whole series, instead of having
> to awkwardly pick a patch to reply to. :-)
>
> Such as this general feedback:
>
> I've applied this series with edits to the changelogs, note in
> particular:
>
>  patch #1:
>
>  - Changed verbiage from 'fix' to 'standardize to u32'. There was no
>    bug to fix, using 'long' instead of 'int' is at worst an ineffiency.

Indeed, but when patch #2 introduces insn mnemonic:

asm volatile("monitor %0, %1, %2" :: "a" (eax), "c" (ecx), "d" (edx));

then the type decides between %rcx/%rdx and %ecx/%edx. Assembler
checks arguments of MONITOR insn mnemonic and fails compilation with
the former.

>  patch #3:
>
>  - Provided much needed historic context behind ;, \t, \n beautifiers
>    used in asm() statements. These aren't just random noise added in.

Please note that removed delimiters were at the end of asm template.
The compiler adds \n\t at the end on its own, as demonstrated with the
following example:

void foo (unsigned int a, unsigned long b)
{
 asm ("foo %0 %1" :: "r" (a), "r" (b));
}

gcc -S (unredacted dump):

foo:
.LFB0:
       .cfi_startproc
#APP
# 3 "tt.c" 1
       foo %edi %rsi
# 0 "" 2
#NO_APP
       ret
       .cfi_endproc
.LFE0:

Please note that asm instructions are perfectly aligned. So, at the
end of the day, the delimiters at the end of asm templates *are* just
noise.

Thanks,
Uros.
