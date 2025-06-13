Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0577D1885B8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749774020; cv=none; b=Y943VcMVrrWaJcIvMNz3NY6lpUnzj1Aiqrkjk3whjnnPxNMf3RDqiSnXtNk+9FuvCdw4IhDxnzjMk12FEL8mtC96lTHjrJ8x69vC7xD/wcrmi65QR6ccLbnx70vQbnjCMe9nb1nwTlWcZwM3MkG7t+v5wDNbUKYSZlMmgXbLufY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749774020; c=relaxed/simple;
	bh=WZlDFmASrocHsgBMFA0A1825qOL/T77/ZQIcSB82Jbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyVtht7Bve9M03nIoI9snMiSPLMJKjHjEbIRFgeF03J4qCScngHhwgM66HAXFaZSOMqpNXPwj4xF1gMXHcWpBMX4mDModYi7cYlp3EG5KWvs8mM9CPTzDkiGmuxbtdiq4Zkvspyn3N0bsJIDI6i6Kmk8CPNvZ9E6M3LQjdvS6EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jOCiI75I; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jOCiI75I"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b16a0e38so46738e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749774017; x=1750378817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZlDFmASrocHsgBMFA0A1825qOL/T77/ZQIcSB82Jbo=;
        b=jOCiI75I/dVUga9KJoFSPw/Td/LBB/Txr+OHp8wAUWrJt81HiCNn+pasztvpbiT7sP
         rt19klF3ki1JlgXEVFez2G5hF2buukzwRU0XCyjIEoYnML9m2yo51xHTJ3dcHs7gOWdF
         bwJto1co0bWSJ3n3RmMuGzqapDbtBB7MajC3qA/d4B1HJ10g7yTzBq+8Y07rX488TnG5
         adh0PunS9h/V1Amuhu2r1wsCQogFBNbV6KUUfIJENgsKJI/oBnSJ5nBxSo8soPvh3TVh
         pby7lBGnDw4CZADD+eGyW0miy5VdXl54jcchCnOSDATGu1JYJYgawxwoA+k1F22j9shQ
         aNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749774017; x=1750378817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZlDFmASrocHsgBMFA0A1825qOL/T77/ZQIcSB82Jbo=;
        b=szOP2CdF7sz0P9ItkSMJx6or5gzBeDOVKQpvRdLPuSfP0Lgyz9Tjpkxlh+9T20GW4J
         iA+V5G7VNE5SBRVGNB7SSvOcJZ0gdRn0zPJeHtlLIsLpF/SAEBkKmlbsZHI+bkdXf+zP
         fg2z2haxyYX1PBs2BHjGbGhStNtYUbqQVUrpIA0VNQugopaKOX8exdGGi6h8joJY8CsE
         BUV2331VC3W/PsHh+CpAh4OLswNdYr3lopaqPCnOqrMB45Wn2TI4CBKfCp1sL4lKaJAf
         kc0uxrVT5hgJ8Kv1uPtruvehkdk2CQkiMLRsvGs7QrqhNOdbWM22UCab82Eet/Quj+sD
         t4oA==
X-Gm-Message-State: AOJu0YzpIWZe3PWIgQFHsXVtsknjRLZ4IZ6iRHpOAIE1F+RG6tayF2OD
	ZTxLf8CmpbPMVU3TV0BBp7npjhqiVlsD6LuLVoTXzeyLTssbhwPWU9HgP91LelhJBhLYuvjuD5B
	7WV9r1Z8XbtkuHTIo94kLZSFFf86sjlqbU7C8MYw=
X-Gm-Gg: ASbGncuKOCwA6In7Qm0NYwBJ+jU4E+6L+tAseOjq3epq7Iiyyfhg9Qk09T1SakhpEzJ
	SPLiVxGWVWGoxuQTAK0RzHqpUgsNNlxpER8SN7qcK49SJjwe+thKsVFyH05sCh85N8OfLxLvC3L
	0jPvKDyfm8G7cTjmRGxiVvVzzcKKPCgp1j+fP61DhTEGltUqmbiC+68npq6B8uG2GPVnU7LFdq
X-Google-Smtp-Source: AGHT+IGpyU+vYa4AHJ5TrF9QSMMKoyCgsBhIqqAajnWFJBSwGiySKKfYWnqphEtQSJ7TRHqRNRR3tmhItuK+4KFoleQ=
X-Received: by 2002:a05:6512:2210:b0:553:30fc:cee4 with SMTP id
 2adb3069b0e04-553b0e1d842mr87385e87.49.1749774016925; Thu, 12 Jun 2025
 17:20:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519082042.742926976@linutronix.de> <20250519083026.032425931@linutronix.de>
In-Reply-To: <20250519083026.032425931@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 12 Jun 2025 17:20:04 -0700
X-Gm-Features: AX0GCFtORLLO_9bWzU_W_-Y94_1YZMrdP7FmQlEgdNla6qXvQHPJsbqo7ZuqNzc
Message-ID: <CANDhNComWT8NC9ZyCd4Rr0EuLj_uCxv0mj=eW-zVpEJ+EGMmxw@mail.gmail.com>
Subject: Re: [patch V2 07/26] ntp: Add timekeeper ID arguments to public functions
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
> In preparation for supporting auxiliary POSIX clocks, add a timekeeper ID
> to the relevant functions.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
