Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DFF4B1E7C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 19:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746733529; cv=none; b=CkWhuMdNnzgmxB9VbDyzf+09w5EhklJY1vTt+PsvjRye7qWLvFuOt9psXf+UExgUZecKTjBQ500S06JGLcIDLuocIwpEkEnNw3quP76ml1bVtM7PrnLWPrg7uBKlH673QZKus0tXhk1o1NbdpVzMyW0VN/2eHUeNX2KnzVI0ix0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746733529; c=relaxed/simple;
	bh=pguFaXSOweA1byLOB3ZHhnyggZ3hgMXck3j9oR/04fQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jM7MdV6g57UdW5GlkTwY1clgXO5IBd41IQZY2M6I2KaOiiNKCCd5Kt1gUMjzJRso45r+lLUcl8o3BNkJ4HxcUMhOnyHF07MFKbHFcr7TF4IA7XUNY8aGJoWNR6Ja2VlVeHponZOZyPNwA8KxpFwvytc7yeA+0QKWXaUs7/JYsic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=crSL2PGB; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="crSL2PGB"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30f30200b51so15283921fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 12:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746733526; x=1747338326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSfroqsALVgqIGlXCEl5UgfAVNQbIJkbrNzFpiBwsj4=;
        b=crSL2PGBwnvQ9ZqkV1aam4PNbouta4JCFWH1jzwpL+Mm3xqmXmN4oxEYUxcxVFR732
         5+hLoPLU8+lryOFPFDv/P2Iamyn8fOHbDsxRom9xO/e9dmDvWYBhjwFbwASzrx76xxxR
         h/QDBj9783s2HXc42wwYXN7XPvH3Hyv5cRf7OXk7rmTvUIkGoh6lHVq3QM2PVJhKKpSW
         +D6NBPf7xHsZBdPU6Zl/I8rFNOqrQTBY1A7HUv8L5oRYlHJ1ZzYAiGqiD7hgOcO3xOnr
         gcuOGluN2fJfFZoljMu2aJmxLf0Pd2vLsDBJtXIZ4lHnmRdGVru0jlhko2RCxNawPLsb
         29Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746733526; x=1747338326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSfroqsALVgqIGlXCEl5UgfAVNQbIJkbrNzFpiBwsj4=;
        b=jAyGV4kFqrqGfL2Yc7r3OlynViZrostJMIjY+L2ZDCHpcVBpHz4HIxT2QkFn5rpJL9
         T2ouQPVBi94OVhVR8n8YSbDVtPA9fQ92Wma1gNsaHoS/daJNMHiEZSNxNFfkFDBThTKD
         4CZ+42ZnXuG79528HKJxwoF56ZjtSIDb9TqtwqGNJWr9bF752qLGV57TCnQkDTECLt/Q
         ApraXUGVezb/eRo+EFTgmO85rH6eyWoIB89In2A4IvbaMD5DBH3pC0NMylj+HHtBxgr3
         Ztc3COuFdBM2Dos+zNSlbvV1zKyGfLGppR8v/UaC2iz4Mo4BQqv0BqZQUeOYK2MLgL4i
         VHSA==
X-Forwarded-Encrypted: i=1; AJvYcCUAS2DjyxBI8BdF+jG2x0O1Kmrq89DZ6EIDyEUfHiFFRAurA8P4w3A69x+Sj/LRP1SyYLA8IP4yjrLhvLk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrw5crHAqHfAOQPE7MxaKz55ufsi7a1z1krztD1eV8sw+fjFny
	TcRxXa2DXipDC5v4poB2xBbXQPouXRIZq33FXCZGPcri3a8oV1v/pmWqHlVAgBxoJHcCpHSdlV2
	m0GnFMsDBSVRKWPLuq5bMCxLG4VVQtY1CJAA=
X-Gm-Gg: ASbGncuffy+4JJuB8z1a7Mdeun50SOTJhDM8WQf3k9U82+n5ZUfmARph3w1vKSRn73f
	c1L5UENTAnzmGYRQWyDulbXjFg3DKqPSwT039ebO/BF5i9EfJGzRA6H6fTe8dl+rLt4BcPZnPrf
	T3u92FucqG/eSJUQpuC6ZtfVDgBcbSuGNqG0B6ULI1J9ZUrC4=
X-Google-Smtp-Source: AGHT+IE2b+r0MiC4hkLLS5+lJ+OXSHprJROondx3DVwSLOtLhWguP0ZvoQY2U9raxw1pEGeqmdscvc3BW/z5KE+oMYQ=
X-Received: by 2002:a2e:a5c2:0:b0:30b:ee78:79d2 with SMTP id
 38308e7fff4ca-326c4699f04mr3691291fa.36.1746733525805; Thu, 08 May 2025
 12:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4a6f1494-c6fe-4f66-a376-b6389538ef9f@kenogo.org>
In-Reply-To: <4a6f1494-c6fe-4f66-a376-b6389538ef9f@kenogo.org>
From: John Stultz <jstultz@google.com>
Date: Thu, 8 May 2025 12:45:13 -0700
X-Gm-Features: ATxdqUHN1Wl4Sh3k_Rn0z-xRvWT4NeDHDjCJBt3I0s8cv6CXxewDWa-3iyHrfug
Message-ID: <CANDhNCpQLN0j5KBp9OB4LB-YJGCCexFG+v5Zax2wwBn-3Tv3Tw@mail.gmail.com>
Subject: Re: ntp: Adjustment of time_maxerror with 500ppm instead of 15ppm
To: Keno Goertz <contact@kenogo.org>
Cc: tglx@linutronix.de, zippel@linux-m68k.org, mingo@elte.hu, 
	linux-kernel@vger.kernel.org, Miroslav Lichvar <mlichvar@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 6:56=E2=80=AFAM Keno Goertz <contact@kenogo.org> wro=
te:
>
> I've been looking into the kernel's NTP code and found what I understand
> to be a deviation from NTP as standardized by RFC 5905.  The
> documentation of this part of the kernel is pretty sparse, so there may
> be some motivation behind this that I don't know of.  Perhaps someone
> with more knowledge can explain this.
>
> The doc string of `struct ntp_data` states that `time_maxerror` holds
> the "NTP sync distance (NTP dispersion + delay / 2)".
>
> ntpd indeed sets this value to what RFC 5905 calls the "root
> synchronization distance" LAMBDA.
>
> In RFC 5905, this LAMBDA increases over time because the root dispersion
> increases at a rate of PHI, which is set to 15ppm.  Running
>
> $ ntpq -c "rv 0 rootdisp"
>
> a couple of times confirms that the root dispersion reported by ntpd
> increases with this rate.  Consequently, so does the root
> synchronization distance LAMBDA.
>
> However, the function `ntp.c:second_overflow()` instead increases the
> value of `time_maxerror` with the rate MAXFREQ, which is set to 500ppm.
>
> This leads to standard library functions like ntp_gettime() reporting
> much bigger values of `maxerror` than ntpd is working with.  This can be
> confirmed by running
>
> $ adjtimex -p
>
> a couple of times.
>
> MAXFREQ *can* be found in the reference implementation of RFC 5905 and
> is also set to 500ppm there, but it is used in a different context:
> MAXFREQ is an upper bound for the local clock's frequency offset, while
> PHI is an upper bound for the frequency drift of a clock synchronized
> with NTP.
>
> At least this is my understanding.  Can someone explain this?

Hey! Thanks for reaching out with your findings!

Looking back through the commit history, we used to increment
time_maxerror by (time_tolerance >> SHIFT_USEC), but all the way back
in the git history (2.6.12, and seemingly back as far as 2.3?)
time_tolerance was always set to MAXFREQ.

So, as it predates my involvement, I can only guess this was due to a
misreading of the spec in an early implementation?

Have you tried a patch introducing PHI (likely setting it to 15000 as
MAXFREQ is represented as nsec/sec) and using it instead of MAXFREQ in
the calculation? Do you see any behavioral change in fixing it, or is
this just a reporting  correctness issue?

Adding Miroslav, as he might have more insight into the potential
impact to existing applications of slowing time_maxerror's growth.

thanks
-john
