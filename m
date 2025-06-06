Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4262874E7
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211544; cv=none; b=tObzMBlECd7G7fW01IgRkUtOkDDUtZ4ae7tV1GY4lpLiDCKr1f6cupem2Jr85hHKSGjsw4fjaiRZ+vu6ZEAMEedTbYzLeYjlBv+P1DP42cxjfLriYMSJRI6U5wDTY51PVaO3H9+F2H6sNCqA/a1fCnyA4KmhDeJpJRB+PiyWgAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211544; c=relaxed/simple;
	bh=pw5DxZusOl5EtI/08fej6vFmQVNmSEMstPXZfIOtxuk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hhT0yKTotVY4VlBBlvJRYYOtBZ23QTJSkofJBpW6f7Fx5fYrpthJgsMurIaJ8U6gtnyljxSBdsRCM+gWLYSv3cws73d00c+8T7D0twMwF9ldC8dM7iz+YakVeFhu45Zmxr61sjdcKvSLIqruj2kfrGRDsY1G8Rzm9LmrFoqKmSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZejPF38a; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZejPF38a"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-606b39b19b6so333739a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 05:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749211540; x=1749816340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blUSLQmy9t7rc+yhzKuamiyJu/iQaaFL9KW6gmT2m2A=;
        b=ZejPF38a0LqdVW5/zknx/22KqHXfdBq7g//umrB2TA9L5St/eYMe78bXc/x78Xy5N0
         J16ZJCaK+xqUnmasqNlkiUNswBlzvtpD/qUpWk6bMXNWZLygWOKozueAdGOrqb2CeJdo
         7h1HNScLvL/yqZACikq/cA/F44dH9Krerw6R23ZrBCugzsOZgzP/uqAglYsa494ohvuL
         JEjU+ys5rCcDadQUzfdgTQ0vMYCMTgrwY7ggSTLakfMy/lR3NwmXQT/X34EOLvIG7SaQ
         X5q4ME2BQqBUwd4wXiyrUtqmj1pIcIqdR1+3M9TQQcf7Iu/+rsK/qUZBwKER45/r92Wj
         cqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749211540; x=1749816340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blUSLQmy9t7rc+yhzKuamiyJu/iQaaFL9KW6gmT2m2A=;
        b=T8qSZmZ302OT3e7BA07XMw5x85ZgNNDqncUHNSYh92sde+QukMsgfNSi3RJbiX9noc
         sGdpaZfbKM6xG9DwbXMDyZmeEKBrXtv9/wZPoqmKqCMe9neIncUZXcVYoyCCKdm5a1dN
         WqZpC/ppZjPbA0XeauA9AoK9LwaSsG5+BGeGQH6uEkTbFXtZzcA8YM4TNEVh8ox6+S9y
         i45C9dOe3VypTeNn1bfp82zSC43r+Qlw/ulAl3jXfOfZmQMIacVQBW1wna6jOFJtUooF
         F8mMJlF4u22gO0hb676dMcog1RqZ6zvqDhGi8ANeRZa8G7l0W4jAVhwkIX47/lPW7Uj0
         cUQQ==
X-Gm-Message-State: AOJu0YwPtClahZSLMgMFdAwMcTeJ14ZErshf1CRCvlGG52uCT/Scj22H
	wq91YMsuwnL3Uoq+aQ4CyMITTuyd2Hla/3ENtzrWx7Qww4pH9yOujHdAJVAhnh+K4Ms=
X-Gm-Gg: ASbGncvaCdwt+3nynCNQl+FlnJby59iBqZpxK7c9wkBmGA4PzkAaxWGUDPQ8irtkGVx
	emqP4H0PnS0ukYuFAhaN05BgKzTpuGpUyblukV1fvntl4rN7RM/IVR5pi2ameHW/UfqZFb9ROWV
	Jbp0iNZ1r5N4jbSWKOGu073lmC3cmaDKOckePQnxFAmXcgg9Tl31iZWPSCOy6ibq/PiBNdOmDH2
	Vi7leGkP8icwYR1nPPQCCvUwvWIvzTLTs8M+XKA7fjlDBpsX/nI/BKJFeE/IHnvT3HLagM2Oxzy
	anK9UvQT7MJlFNdGiGR77KSb85DPR1snu3w6WznWVBaA4lJT4q8XpTN+3gsjKkvABmoAbarhjjL
	4wOBwHygRHF3Bne8C4FLf6crNsK+Ckzi1/wZWywHzHknGcp7H+l4KqPAB
X-Google-Smtp-Source: AGHT+IFEWMIzPeLiuWhp169aIeLqFwqJdP4I0BLMQjvCWLHGJqq5NI3ba8l22k9bFyc8ukNwi499Gg==
X-Received: by 2002:a17:907:3c8c:b0:adb:2dc9:ad4 with SMTP id a640c23a62f3a-ade1ab952f9mr87524366b.14.1749211539636;
        Fri, 06 Jun 2025 05:05:39 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db54c3esm106606666b.39.2025.06.06.05.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 05:05:39 -0700 (PDT)
Date: Fri, 6 Jun 2025 14:05:28 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] timers/migration: remove an unneeded call to
 find_first_bit()
Message-ID: <20250606140528.2b17567f@mordecai.tesarici.cz>
In-Reply-To: <20250530132539.234792-1-ptesarik@suse.com>
References: <20250530132539.234792-1-ptesarik@suse.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 May 2025 15:25:39 +0200
Petr Tesarik <ptesarik@suse.com> wrote:

> Use simple bit arithmetic to extract the least significant bit from the
> active bitmask, because the bit position is not needed, only the bit
> itself.

There has been no reply here, but I received an out-of-band
recommendation to wrap this bit-twiddling trick in a macro.

So, you can ignore this patch for now and wait for a respin after I
add the macro and convert pre-existing uses in the kernel.

Petr T

> No functional change.
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> ---
>  kernel/time/timer_migration.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
> index 2f6330831f08..0f40727b6cac 100644
> --- a/kernel/time/timer_migration.c
> +++ b/kernel/time/timer_migration.c
> @@ -1277,12 +1277,12 @@ static bool tmigr_inactive_up(struct tmigr_group *group,
>  			 * group is idle!
>  			 */
>  			if (!childstate.active) {
> -				unsigned long new_migr_bit, active = newstate.active;
> +				u8 active = newstate.active;
>  
> -				new_migr_bit = find_first_bit(&active, BIT_CNT);
> +				if (active) {
> +					u8 lsbit = active & -active;
>  
> -				if (new_migr_bit != BIT_CNT) {
> -					newstate.migrator = BIT(new_migr_bit);
> +					newstate.migrator = lsbit;
>  				} else {
>  					newstate.migrator = TMIGR_NONE;
>  

