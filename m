Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378CA322E;
	Sat, 29 Mar 2025 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743251312; cv=none; b=mNZZquvH7+EMhJoBgVZgsFq58DXNPU9dSo0fTX0Fb5UdR77vDsm8GzWBsYzgq/BAzXc3nwDKOtBp1+99w9xu0jR9G8OTPIVbJzlLIf9cpl5ghZY4mDsZbCdbdmLRKt/jLORu7EUbOK8BZqR971BQ+rVWGmfaZhVBrhn3rDTGBmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743251312; c=relaxed/simple;
	bh=PvmhWHr39Mo9LteRFuitdUW476h3nNYAKH7O+ohtQzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUM0vm74Y9+4EWeiZoZ0y7Fsk+tIulyJcVJgGir1iy0pEhONq4Kd3i6SxhZWkMRBzvj+z4zhZ2t6DQa5PoQPNYnTsqmPQAVytyXuMYN6yLe4FMd+q6RFUk4GETitsx9Uq+qsuWpsfm3DJczicdSHNdSDpOGv3ch8hrfpGuESOgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Imga+EKM; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Imga+EKM"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff7255b8c6so676839a91.0;
        Sat, 29 Mar 2025 05:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743251310; x=1743856110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AxA1h7cQa26N8tUW3BUNSo01ynobv95EWSNtTwXMGg=;
        b=Imga+EKMJ66BBRxsE6TfWCE3pj5UwLA8TJ3y/thcy5agIO4wCaLe+W/IXy/FcB6VOo
         vzIe53C9n5JMdwrc5BwR6Gw2jwZkmFhBqX/2irI8fdaKdHZyVNWQhGs2biaI8B6NT+GY
         u1PaOCIknwMXcuVPDuu3WsCFhlAoeSndh21t45f+4mFI8L8knsbXspjtVZlsvC8yM0+/
         MzieHx3OZoqgXDfu9vVE3lopkXKdaK93/8oK7eYQbMYkOsT+fg9aSCGRsbveUYUYehLF
         wGC6c1ux4sSrrOblH9Byth3/JcaLAOUlt3etJUhdWcxrpAaAcBTznfH5/hgVHHpX8PCD
         Mc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743251310; x=1743856110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AxA1h7cQa26N8tUW3BUNSo01ynobv95EWSNtTwXMGg=;
        b=bpcqS4T7r7qr5evv8We8sEwynAzCibCR2PEdohB0hQP5+ADsaYN1ctrYHWsYAsWhIn
         mtMmpqZc+Su96dqdlQQ2H2H8UPof+Q1t8XDb79wjNaqoa5oP9TZJqzpSNHLIBDFXrVgC
         SjvO/Sb4+wXj0A0ANUH6Msxo0SPxVsLa/fNjseqpLTzZqdxEAxNuqglKfppAIE+0vS/c
         3jfkn7Nx7V3AAK1/sXXvD1HjhxCVtlGLkdLCp3HdXDUwN/y9aD0JWezS69+hJh4JgBX2
         zmmf2l/ijkMteWxz4FMa0sp1dDC7h1BNrBbIbzLkh13U+Otbk6iJiQjKIdSBQtbeCgEs
         5pTw==
X-Forwarded-Encrypted: i=1; AJvYcCUH3Xx3NYWh1RqylWddp60J3dQ7L9EjersSFipQD7/BWchjXfdZRPqNCK+PsqQD/G4kZgi9a7Tav3BrHD4=@vger.kernel.org, AJvYcCXwqyLiK1WekmvV63LBTZARQAY0E66CPE195OxhUTM4+xOHS1361HylO25AOPxn3NgqE8YxpfsOyrbgMwPVBVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJrFFg/CaVPwvHvKbqRLHQJ1j7Ehu9gz7TKRZTlzl7voxH2yvn
	elvi4JQCurIx+tqwPB30pfPdJkBaDmXiZZ7RulubJxKTtt0sL5MWXjq+rjpR0vR1IXXKVu6TB28
	EBtCRFbFLNdGYPDZPY/uzmmtZdmd/UfICV/k=
X-Gm-Gg: ASbGnctIR/bcscDixe2hb7duRN2RlphDIT+grjgFZSIEhmaNniEFHRxAAVJ6/sqv0tR
	KCP9rNvby4X5wZigcWR9ipGNncuz9xDdPjKYGdRAZ6Q/c9v9vO3K3k3t9vhJrEoVfCSXlVoTFHP
	yRqJdIT27q6I6Rqwndj3RKLgt4Jg==
X-Google-Smtp-Source: AGHT+IGOUa/z3Zmva35QsaqmZ/grESEg3B7h3enALpbAH01LE3WjhkxCfu9kNG6WbWeK2jOH8cAK/RjUjH7ayIvongE=
X-Received: by 2002:a17:90b:388b:b0:2ff:6ac2:c5ae with SMTP id
 98e67ed59e1d1-30531f7bef6mr1750076a91.1.1743251310403; Sat, 29 Mar 2025
 05:28:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D8RHIOTYBFI5.3ETKTDNGZW3FH@proton.me> <20250328180312.2025317-1-igor.korotin@yahoo.com>
 <20250328180312.2025317-2-igor.korotin@yahoo.com>
In-Reply-To: <20250328180312.2025317-2-igor.korotin@yahoo.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Mar 2025 13:28:17 +0100
X-Gm-Features: AQ5f1Jox9z9e5HaKJM0O4QlsDlvy8x2WYbBtw8TPagaAdOpzzBRW8h0wI2is-kQ
Message-ID: <CANiq72=JPKb1D-SXaSkRTCQ=xcNuVZv=dsfBO8ND=ATq9it57g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] rust: macros: Fix macro referencing core and
 kernel crates v2
To: Igor Korotin <igor.korotin@yahoo.com>
Cc: benno.lossin@proton.me, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 7:05=E2=80=AFPM Igor Korotin <igor.korotin@yahoo.co=
m> wrote:
>
> Update macros to always use absolute paths for crates `core` and `kernel`=
.
> This guarantees that macros will not pick up user-defined crates `core`
> or `kernel` by accident.
>
> Changes since v1:
> - Fixed paths in auto-generated code.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1150
> Signed-off-by: Igor Korotin <igor.korotin@yahoo.com>

Thanks for the patch!

A few procedural notes:

  - The title has a v2 at the end -- please do not add versions in the
title of the commit, the "[PATCH v2...] is enough for that :)

  - The "Changes since v1" should be part of the non-commit-log part,
i.e. after the `---` line below.

  - If you send a single patch, then you don't need to add a cover
letter necessarily (typically you just use the place after `---` in
the patch).

  - Speaking of the cover letter, it seems like the 0/1 patch looks
like a reply to Benno rather than an actual cover letter, and does not
follow the usual cover letter format. That is quite confusing.

  - You should send the patch to the relevant maintainers and
reviewers -- you can use `scripts/get_maintainer.pl` or something like
https://rust-for-linux.com/contributing#submitting-patches.

Please take a look at another v2 to see how people normally do it. For
instance, this recent one looks fairly standard:

    https://lore.kernel.org/rust-for-linux/20250325133352.441425-1-andrewjb=
allance@gmail.com/

Thanks!

Cheers,
Miguel
