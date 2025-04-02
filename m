Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A15A288DA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 22:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743632962; cv=none; b=e8sFcFJjvEJCX78HOH2oRiTEigiQnCYKIbBB5J+g8INcjo3nmqiKkZj91x3rCLHWuDiZ3MmNcUs7zT42T8hDBqpYHArsein/adID2r2KaZutnIWaWHgN4GBmbwyVVIEFq1gS+zAzwc/PgBuhHE3mUOdUtSu0vtRZftkCPwap18c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743632962; c=relaxed/simple;
	bh=YyY+13G39SyUN/nlTWE3d2saYTRiVoes9KFMv1fyfP4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=idgH7MCLr0fIxiMmvlfqPASorJc8ci0IFPdz1G2GtWR+jkxMzDZHt4SmKNo5w29zfGEoPsx1yvMasHAUyfvSjTQRMGXhtTBGhI6czlKmHE1rtKmV8eHMVWx4oCC4QoMREBRo90c8qaQaWKwH0jLyoDGjKC/pb/vg2TDc+AZBGFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxSsm5Zx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxSsm5Zx"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso977255e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 15:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743632959; x=1744237759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/s46Xa10sNmv45AaXiBiw5lvTQTbz6bpLFuXnPXI7AI=;
        b=RxSsm5ZxzHtUAn4ZJgmsDPbGUZQ9Eo2WyXqBSN/h3ETKXAAZkpvgrxQFRHlvJI7j8B
         iAMG6DHwqQnSmh3eLbr5jbcbEphKgLx/ZYCp52obNVjhnsfo99fyhA1EYtsZYJB54rI6
         zVh2kKthnmqJYdPm28hZ2g24J7XYWBqoCvuW5YpFBg44wSAUcdZH7NxjeOhj/bYEKITA
         jLpCU31lEmjHxaQ+WAymVKQzaU7P1w+uOIRz9yXKnPqCseMewmTI50rFqAgNtgkxuGhM
         77ufj92XUi9Mmc7KtAcciYzI/TJ2PNjQietOQ2PIoufok75rWT0B8gcPZ6lGIzRCkKJ0
         A5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743632959; x=1744237759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/s46Xa10sNmv45AaXiBiw5lvTQTbz6bpLFuXnPXI7AI=;
        b=BNHets/UOrRep5nsZqPQm6POhUQm+fpA1Tk1WqSWCenpqP1a0nVOLT60OpU7Cen1cg
         SCwi2umDKgkCuFIffm/QNkcwQtnrNYOYS825QCeRurnv3o9YaoApV1mVeTZFQWaQUzAd
         VVPW2vEDnkQfd7bWE2fF9g/DKSzacGNJUfbfonlNHu3bca5f7sftw7RQ4atGsiasBSBO
         L5/mglY6Kj3kkmEcHx9/AVvaNYux7XFm5OGNY3KbiaC0hno2N9G6i0DzZEVpv+hCrZQ6
         ugvz7EzvZ42UyXqoviQkLzHFTjVDMhfDqPsyC7/50bKh5GDm9vjT8tcPGe03xWb1jABR
         hizQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9g7FeGd4f2u/WDdHlLr/wKi6ZPpoliCS06PJiCCxrB67Jez9rMzDIjc79scU/wumWQdFt+BrJ6CA78sE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcKtH3B0ZhXS7pI4BqdUSR4xTiS3639/UI69f7SpjeMaTUbzSZ
	46tM7RR0kxIVFmVj9A6XB9xBxN6ShicccNkKWpFfhU7Ep5OBuNjw
X-Gm-Gg: ASbGncujwDNJKeeWekSC0ZQNchTb4Ou3brSrflWAIoUsSc6LzEehBcdzVsk3ySfie81
	utmdcPm0fFVW39AD2mi7ZbDOcwe82Dg8QfVSYBvbQGQz7hYEf6Txaefctq1oiVds4FvlXEMKp6F
	k6xgk3zIzgR9qgrP+4JKuqfkK7DYU10O/JXcVyOUcq+kvfyp01XG1VFMye/MVGeSEITzs/v6svu
	XZGN+fMJJtSD2xmuLRzYGzqnct6VJX6vyhTgiY6ZvDPF8F6LDT75SMiWs3Pi1V9E9fXW1UbZj6V
	iE2iOjzGM1BDnyFqTiYmbz5XJmVDa5vofVlJ7ZL3Vj0LV7XyTx+8XVTM/O2NwdHQKYM3XbaM3fj
	t1MsxOT4=
X-Google-Smtp-Source: AGHT+IGMwU5xifRvejT4BCu3NYPA2W1fnXDvRU7C6ilRUsTBoAlZD3RxXYzp2Rz2EDEpQZBodF4Ivg==
X-Received: by 2002:a05:600c:4747:b0:43d:585f:ebf5 with SMTP id 5b1f17b1804b1-43db61b3b85mr155020345e9.1.1743632959331;
        Wed, 02 Apr 2025 15:29:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0dbesm3723995e9.33.2025.04.02.15.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 15:29:18 -0700 (PDT)
Date: Wed, 2 Apr 2025 23:29:17 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: torvalds@linux-foundation.org, mingo@redhat.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
Message-ID: <20250402232917.6978ffa3@pumpkin>
In-Reply-To: <xmzxiwno5q3ordgia55wyqtjqbefxpami5wevwltcto52fehbv@ul44rsesp4kw>
References: <xmzxiwno5q3ordgia55wyqtjqbefxpami5wevwltcto52fehbv@ul44rsesp4kw>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Apr 2025 15:42:40 +0200
Mateusz Guzik <mjguzik@gmail.com> wrote:

> Not a real submission yet as I would like results from other people.
> 
> tl;dr when benchmarking compilation of a hello-world program I'm getting
> a 1.7% increase in throughput on Sapphire Rapids when convincing the
> compiler to only use regular stores for inlined memset and memcpy
> 
> Note this uarch does have FSRM and still benefits from not using it for
> some cases.
> 
> I am not in position to bench this on other CPUs, would be nice if
> someone did it on AMD.

I did some benchmarking of 'rep movsb' on a zen 5.
Test is: mfence; rdpmc; mfence; test_code; mfence; rdpmc; mfence.
For large copies you get 64 bytes/clock.
Short copies (less than 128 bytes) are usually very cheap - maybe 5 clocks
But it then jumps to 38 clocks.
And the 'elephant in the room' is when (dest - src) % 4096 is between 1 and 63.
In that case short copies jump to 55 clocks.
Otherwise alignment doesn't make much difference.

If those values are right you want to use 'rep movsb' for short copies,
but probably not for ones between 128 and 256 bytes!

I might need to run with an inner loop.
The overhead for an empty test (an asm block with "nop" instead of "rep movsb")
is 180 clocks (and subtracted from the above clock counts).
But I've used the same scheme for 'normal' instructions (testing ipcsum)
and got sane results.

	David
