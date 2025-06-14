Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F933D984
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749869058; cv=none; b=JtvxIR0IGGlivzwlcJe/ICTgKhIY67QQUJ7Ksnb4KJxPBjAeg9hZrD8kB62W0CqO7qsqUvTU4yDE5X9aeCnzmSwXUVKFoipvW1k/tFs7+KMBCbbQjLwy3TpebKUBddBlImsXN6ISlbtIAkDFDP5B87+1CafaSL0HiHq7OQY8rrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749869058; c=relaxed/simple;
	bh=O4Gjahtz+bxdj0DKMQ4kZN+PrAiDLTI94bb1mdd/Cbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpaEmoZGJdHp7akxFNP/VUUk1lXAUPTZgwl5aLS5M9TquIl68rjd7repfaoG1yiHMuJykUWplKXcHTviwfosx/GoX5OPJkh5t/8+GdIrB1la1R2lUv7O08NfPJIvg5gyu9hB3PHJdmQLULI/sMfKhIiZtFzSA72AlITC7xnWQKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E2XxgT1H; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E2XxgT1H"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b5165cf5so919940e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749869054; x=1750473854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+VVpcsl+muuyX4iIii+C7p1j2iHR4sQbFNMEzoTLU4=;
        b=E2XxgT1HxT7FSUpEn8ysa1zHdHbZi5M9fNCN3RbK7/WGW1e0+PC7/pGxJnls4o0UV1
         sccHriYtwK4E6JvHhXqnZCt926LobA350QLKmu1gqM0PswAKyMQzO4Z33s8LP4/LhjPr
         xEE1ruOc9Hh8Ef6QOVwTl60vzP3ss0ZFd15jb6JBJwUW1E8pCN/aaobHIWUHao9nKP1M
         DLhbqKY+fMrB9WNdImUSszEcCDVsq8pkGWfp6OhvIIKJYlz7jJgV3FCbKtltH4T1cjUk
         9HgfLs9B9Fp5Q05QE1jeqHrR8e9u1sgZDOQua6xn5yPId/wUDcgyMrCZc3BhX4AlM8AP
         yDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749869054; x=1750473854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+VVpcsl+muuyX4iIii+C7p1j2iHR4sQbFNMEzoTLU4=;
        b=hr+OxkfBIbRb/GFujzdx3Po96Ks/braXdqr2chDHL7iAB4skJn/h8ew/MGc1jCDNwt
         T/i4lyAtNMoMK4B3zPLIUZbqxfNxaIho1sanaNQHTf0DYlXI7gtnCJRUQeSFZWQlUJQ1
         8b6pglbCjMrquf+6Dcw069m6NZ2TzoUpaANJjaWeddZ6d/BIfSL97rvXPZySXww4vOp6
         gHuY7eNLAZSLKk0PNi5oHGJ958uNzaiONz+7Yr/tFKDYY6JWlUFUmYhNA0MTD+35+lkJ
         4973JpuZe9KRsYxwpU2rQ16JdBaXUJB3uuwcbenORX3cAJMFVVzyO0LO9FD8KX5e2uOl
         1PIw==
X-Gm-Message-State: AOJu0Yws1cPrlmkvoLfxEv5DBS9NNLsiKCoY6Rs2/6tV0BrXSolA6s17
	IqYM/4l2jc3qWQwsKWYpfFfqdJlVMHgC8yEeyZDSu3XpVZXjIMY+YYU/FK1f3E40799AaqXtie4
	ffWeZN4TQMHvdablnXyTYnsAsjJrIgIENKeWWVSmiejRfGuJKnElbHL2lRw==
X-Gm-Gg: ASbGncv675f0zXOItZvok0NzGpKN/7snYuPAJ+7wiyT/TvpQAZqt7Ox2xfSfE8QJ1bV
	M9g4wY43HIqx/nBOAfGUdH8D/dV3bAQ/t4IM4D0LYqaW6i0F/MMbmUjfvadWhbMSXfWiwKuTKki
	NLcv7Hyb3pVpk86aMy0B/1m/ggYaxHVpef/hyCqDd8QovepdccDMxaX84wbNZBDy03/5vBAUk=
X-Google-Smtp-Source: AGHT+IGbFFoZybtkp0Y/GQQp8/WX/yBotzfDB3op3RjVDqzFnitxh+FqmA8M91LPnefNN4doUzykzHdc6tkb9Ck/vSY=
X-Received: by 2002:a05:6512:1110:b0:54b:117b:b54b with SMTP id
 2adb3069b0e04-553b6f48f9amr321300e87.54.1749869054018; Fri, 13 Jun 2025
 19:44:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519082042.742926976@linutronix.de> <20250519083026.533486349@linutronix.de>
In-Reply-To: <20250519083026.533486349@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Fri, 13 Jun 2025 19:44:02 -0700
X-Gm-Features: AX0GCFvPx10G5uykSJcgREAWzXpCFlb93ccf244qqpPfz4iEKngJswaZ55LDR8k
Message-ID: <CANDhNCrMBaHhyrr3=kq=nyAp2iGhkJgKMqwO8+KeeYaZdbSa3A@mail.gmail.com>
Subject: Re: [patch V2 15/26] timekeeping: Add AUX offset to struct timekeeper
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, 
	David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
	Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 1:33=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> This offset will be used in the time getters of auxiliary clocks. It is
> added to the "monotonic" clock readout.
>
> As auxiliary clocks do not utilize the offset fields of the core time
> keeper, this is just an alias for offs_tai, so that the cache line layout
> stays the same.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  include/linux/timekeeper_internal.h |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> ---
> --- a/include/linux/timekeeper_internal.h
> +++ b/include/linux/timekeeper_internal.h
> @@ -67,6 +67,7 @@ struct tk_read_base {
>   * @offs_real:                 Offset clock monotonic -> clock realtime
>   * @offs_boot:                 Offset clock monotonic -> clock boottime
>   * @offs_tai:                  Offset clock monotonic -> clock tai
> + * @offs_aux:                  Offset clock monotonic -> clock AUX
>   * @coarse_nsec:               The nanoseconds part for coarse time gett=
ers
>   * @id:                                The timekeeper ID
>   * @tkr_raw:                   The readout base structure for CLOCK_MONO=
TONIC_RAW
> @@ -139,7 +140,10 @@ struct timekeeper {
>         struct timespec64       wall_to_monotonic;
>         ktime_t                 offs_real;
>         ktime_t                 offs_boot;
> -       ktime_t                 offs_tai;
> +       union {
> +               ktime_t         offs_tai;
> +               ktime_t         offs_aux;
> +       };

Probably could use a clarifying comment similar to what you have in
the commit message "auxiliary clocks do not utilize the offset fields
of the core time keeper"

Otherwise,
 Acked-by: John Stultz <jstultz@google.com>

thanks
-john
