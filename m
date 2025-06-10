Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB77178F34
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749595520; cv=none; b=XLxZLrlYqZNy5i8txPvLUJyHRWHWS0+LeWHnliSlNFxuckUab/gKj+qo45SLmKk+Rd0EvX3e/W98tTuMCu+gln+EjpHasN4iCEh1js6SWQZePMlnNctfBHZp8wDJLb+Hl1upqbvTYbK+LJ7hqT0qQ8lCg+aJ1JNkA9VcYKJ9KE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749595520; c=relaxed/simple;
	bh=P3Kb68R1Z70usEnSE/SHL7A0xnBfjEoj+PnoUkVhR1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sk/YKcVcSCUn8YZ1YAaKB6GWwTkvr1L9GBf3bj7MtPegWwHxakLnv3r4Saf1+Nh9HFeIoB7ScZwdTGZGsVGC3bK47YwMvgO3QUsNZ1vLhAi0fMzypYo1yKrCEGf25aduHgHeXDAlnY8p9Togp/mdaH0MeNQGfPHxnFBQPC+VwAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=0ConQXYz; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="0ConQXYz"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a5ae2fdf4eso3683481cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749595516; x=1750200316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3Kb68R1Z70usEnSE/SHL7A0xnBfjEoj+PnoUkVhR1Q=;
        b=0ConQXYz9vgabrP/h0wNseLrNGhjBlER7i0j7l81wn7PvoGs5GfjJ9ZD8iGvoigdXw
         mEprP3sYjqmn/fCcluipg2aSotCQDX83XXUk8dEjs+DnEU0aYCcuisix34sciqs9882S
         nalLFv/kF0dDnmfytEQZTswI46JMSsF/luNJDDoLV23L4d9zfOIOPMOM9n1mYk4BmZ2t
         hoKytzRMfWsu40GHY61XoWueL7Z3wRj31C+EyY2tK1DFOgTjy966vSSG7/xM/OiR8M1K
         pkFb4v5f+2k2QmD01HBXr1lFihRkdnyIkrUOxgaAbo/VaiZHFlIjTaOBzgE6TZuFXFEQ
         M3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749595516; x=1750200316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3Kb68R1Z70usEnSE/SHL7A0xnBfjEoj+PnoUkVhR1Q=;
        b=mXphjeGSwbkO1YfChel6thNlpxnv290GS6644MyE5khglCxVgzXFfIDVmSzNBdpgdp
         L6BUMshqSSFDyIlFDtLumxxJRvCNENp1eXvJyC4TxF+z20GodhnMtm2NuU9cHYE5GJ6J
         WJBhMXET7FsJhbGjOAOhMXijpYkMXDzUEQlvu1N9aiVbyPMX91TDHM3kKhcBvqu2uwxR
         VXwekPzkZG/nM0R2Et46U1+a6vG2whVI1VUCZNxZSydkY9Vi449N8WNUpzdP/mrnY7XO
         ZWcdleF9Dlx1zRXK7wNUvTO8N/oKOr0dqFFRHBWzKeZt5ngwg/XC75Y0rRBXHItKnx7e
         lSKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeFH4VzQ6rmXD2wPwxLJLoElBBLORA94TulSGDZb3x7VWLJCxqK2DiafEsa2GsBO8rbcpEJq7XBWIt7TU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf08fVyisE5DqWSgfmRefcPPcaziIXNVfMyZmJfQrXJloUIHqz
	h7imcFw8Tok485wd060IgYFtSqMDWBt7CCRridhotoPnLGjGOw/CMkMebyMZJIH1+SI6TBTZVfy
	SsrP7vRMze6kq1crl7gfd/Ig+7ggVuMwc4gu8Ow0QtA==
X-Gm-Gg: ASbGncukEReoC6+oz6WPG+mdmgneXARA8rOS0DDw7uduD/nmYbsrGrf2hD0t2MGg21B
	eP1p0O6I7ruJB8/ENBdMDCn/nbtOfg+drhAB5kpRNFvlI+E+ym+2tZA/C2xZizF/WytsvozBD1k
	2xb4sOrurcaYeu++QF0Esfb1bG+wSZKvmYdIxhlzQt
X-Google-Smtp-Source: AGHT+IGJBCoY2BSTgZVJ9PJPU9ONDD7Heq2g8GGzNzWCWXXG69HepYVSefbdNRPd5nytDpdM+XQwjF4VCWLZ42gOlww=
X-Received: by 2002:a05:622a:1f09:b0:494:b1f9:d699 with SMTP id
 d75a77b69052e-4a713ca3022mr22642371cf.23.1749595515969; Tue, 10 Jun 2025
 15:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610214140.2775339-1-mclapinski@google.com>
In-Reply-To: <20250610214140.2775339-1-mclapinski@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 10 Jun 2025 18:44:38 -0400
X-Gm-Features: AX0GCFtNzdj1Q_Sh0PElEUysz7r0FEmwXQtH5NSQLtcg3vWsni8v23ZtIRM1yPY
Message-ID: <CA+CK2bA_HpaZCeRgrBMWE+_1XCnu+Of7OEMg59CDBZHtaNGTsg@mail.gmail.com>
Subject: Re: [PATCH 1/1] x86/boot/compressed: Fix avoiding memmap in physical KASLR
To: Michal Clapinski <mclapinski@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Dan Williams <dan.j.williams@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 5:42=E2=80=AFPM Michal Clapinski <mclapinski@google=
.com> wrote:
>
> The intent of the code was to cancel KASLR if there are more than 4
> memmap args. Unfortunately, it was only doing that if the memmap args
> were comma delimited, not if they were entirely separate.
> This change fixes it.

Fixes: d52e7d5a952c ("x86/KASLR: Parse all 'memmap=3D' boot option entries"=
)

> Signed-off-by: Michal Clapinski <mclapinski@google.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
