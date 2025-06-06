Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E811C1741
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224184; cv=none; b=tSKFj17MgqXOUBNdSF0DrRfw7RvGy1oNRI8O5xBtOLeec9WAZgF2ZlkojcBMnV7Sf7Vz1jKbOyNqwwd8FcpYXnGrvfnqJhcGexZFzLD8seQGGHEim5/cXi9TaRdkYSvd1cHHOHRJFIlk7Fi144trED/vnn/Nr/ceOK9wOl75Q2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224184; c=relaxed/simple;
	bh=H3Hs9P+dciQUXHnhHSgkXcGE66Hv/GWrtUX1VrkIyyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhanyt9WvdlUDleVV3Yd3dIo6bwHubzicF0op9iVeMv+9PXj0ErggwTPa82pqo4BbD7EgemvJ1cz+mAKLzLHCMamzEp9NbuSCqdZcgP+03MX6JfkPfsxCPpujp2JvF9UfTEYlyCW9qyzG7NbRMqc1u1/pDLNSim9g7pvmXH7J3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5dcNJiu; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5dcNJiu"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acb5ec407b1so398604766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749224180; x=1749828980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8EDbgSSHh5vY5XHHz5Ly91Fa77ndpTfrnTlTnw+Etg=;
        b=k5dcNJiuqYWZ5SalFcWUmgQiOpUskTp4UBJlE+FZnC5PHhwfueaKDlbFKiNEqaRxE4
         nk7zq6ccSIgbsfrBIxAHZXS/4C5QIHVrENApZRuXzk9ZvmLh/ht6VTCjh95QIOA0d06m
         GIcHZ5QS8qFlgBVPn2qECqhuGkYOVj2+dfkafOducPhGgcT7e+j88EJUZ1PpnYCSpLv6
         EU6iNOx5lZmvlQ4ztGcvNh5DpsK8f2hlTKcOWl2DYR5e27CfI1O5OUWjU+Mwf8sXK1MF
         bE1ZIDR2SS+jDFO7ayTGdLsU5Voi0ySf1O/u7/Z49dyPomoXaz15Lr0Plj9M0eao4oCT
         h8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749224180; x=1749828980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8EDbgSSHh5vY5XHHz5Ly91Fa77ndpTfrnTlTnw+Etg=;
        b=KdRa3jatjgaOyNQzm3OAHllZVDLzmk3tryNmPODPK3KfVIJqQIXbFBHh5cCLp/uPfo
         U1XYinXiF8RlH5YuFyCtg2c+nfTL0uqyZ5G2PKcMttUmyX9FlbwjTXF22VP7ykICS/kW
         R9avzOsDwBGJBSRCDNCsvmNHJgHXF/AEFMBe1GtFo+vcVX1flrBrGoq1PcOKkwCoIQVX
         0+mmQ9piXaXDg3gjoKho9tp4sfO7wYGml5hCaUiXDt9E9SyzMJe1gQ/LQXvk1GDzO76N
         R2AJujFX3ya0vr69f9Qhi/ddoQ7O/L2R54ibo6G3WGlwwtX1yOg+lebdeA7NGOD/qF2J
         82rw==
X-Forwarded-Encrypted: i=1; AJvYcCUn9jOntKbmpxX3EyPCQ2AoN6XpJEXKPLvBTL0Ve/a1oW7DP40rqQ+RA7kJTLdDgF8jgsSbPrpxlzUznV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn3UNdk9RMVszjsDdKlaULlGgfmbWufZRVjmoYsX0P5bW+0fkx
	1PVRtmxaaO2CqEOC+Djb1R9qGqYfHKcUdu2uelPHc8PJJZ8uL64xBnKP6bTlSG6TXTtAimt/WBQ
	ihEw1SKPtHOjp117GiHww2W2bEN5hXMU=
X-Gm-Gg: ASbGncunhSDR96ck18qkc65GZI/nv8wijefTWU0w6MLFWklyY4hzy3q+vuAwbqS8/Qz
	ubE4keeqf496Fsm7yKSqlk3khOUnFImCyFojzA++O0YdqN0Eo5pMJQ4XTzWbd1vUqNAffdEV8/G
	YVR/LnST84U8oFNXlTbmw6wT3vnKXmXJTyKzFWqkWqu9A=
X-Google-Smtp-Source: AGHT+IHGVGxv21OiSj201XMJYK0towMU/A2+e7txxouqDZMOhuq2OOLQjM0BzOGN/q7EiP4FLVSY/4uy1TSnjZMYOsE=
X-Received: by 2002:a17:906:9f92:b0:ad5:27f5:7183 with SMTP id
 a640c23a62f3a-ade1ab87a79mr344410966b.39.1749224179557; Fri, 06 Jun 2025
 08:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605164733.737543-1-mjguzik@gmail.com> <20250605190054.GH30486@noisy.programming.kicks-ass.net>
In-Reply-To: <20250605190054.GH30486@noisy.programming.kicks-ass.net>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 6 Jun 2025 17:36:07 +0200
X-Gm-Features: AX0GCFvN2zdZaUP8lMkHPpvB_2_XuvzHoejq8kwdaj1gaJoWb-QBH-HRbbQzc3s
Message-ID: <CAGudoHF1yh2CoO-jzt=M7z_114g_Zw3-gy1yBW56tAsjb0k_wA@mail.gmail.com>
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Peter Zijlstra <peterz@infradead.org>
Cc: torvalds@linux-foundation.org, mingo@redhat.com, x86@kernel.org, 
	linux-kernel@vger.kernel.org, ubizjak@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 9:00=E2=80=AFPM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Thu, Jun 05, 2025 at 06:47:33PM +0200, Mateusz Guzik wrote:
> > gcc is over eager to use rep movsq/stosq (starts above 40 bytes), which
> > comes with a significant penalty on CPUs without the respective fast
> > short ops bits (FSRM/FSRS).
>
> I don't suppose there's a magic compiler toggle to make it emit prefix
> padded 'rep movs'/'rep stos' variants such that they are 5 bytes each,
> right?
>
> Something like:
>
>    2e 2e 2e f3 a4          cs cs rep movsb %ds:(%rsi),%es:(%rdi)
>
> because if we can get the compilers to do this; then I can get objtool
> to collect all these locations and then we can runtime patch them to be:
>
>    call rep_movs_alternative / rep_stos_alternative
>
> or whatever other crap we want really.

Even if inlining patchable rep mov/stos is the long term solution, you
still want the compiler to emit regular stores for sizes up to 16 or
so bytes or you are losing out.

So you would still need custom flags to dictate the policy, which is
the bit protested here.

Per other mail in this thread, gcc as is does not do what you need anyway.

So if any patches would have to be written, how about fix up gcc to
emit better inline asm for these to begin with. ;)

--=20
Mateusz Guzik <mjguzik gmail.com>
