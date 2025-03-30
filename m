Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452061DA21
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 20:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743365342; cv=none; b=LokH0YvsWlaYV88VTtkLm39cwUfsBZh4348Wh76pm8vyecy8G5FxQDug1VtVqDQh5f/5ZtwG5P0raFaygt/I2YFZcY5TeImDU31L8WdVOtkVthqslG1wvCaLxUUMqu+1zTj7yerlZv290NsKwhuOl3qsXTdBtBjMeRUlGvLI4QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743365342; c=relaxed/simple;
	bh=9VI/A1wQaOhkd7eZpmAwmNPePm6byaoOQzgCYHgz/Qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhVLDTHjxjvGGSYLJ9NMAQ/QmlITJ1zLTZQEHtMjp1VAa8j2errcceH0Dkemk2Fuh6wBjDZMs9SJrp4sHzxFHtFD+llxPBTwfusJ+4hhjFN1qneMcE/tnuA8CbStpN7suDvAlCkRiSkrtnj4bjbJHiT4VJO/NBvlJGTPq+qK7qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=I1g4ZzJ/; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="I1g4ZzJ/"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so7278079a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 13:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743365338; x=1743970138; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FQdIPIBIFPsMXzbqA6bIdMRDw0puL1K2JM/M9dMbXWQ=;
        b=I1g4ZzJ/bBpUY6AOI3ey3/ZwtbFO03prl27NomzzYDAvB+GOEje3YrwH+YhrNMTxQw
         VEQoqvwsFgV6eKY0gWL4m6nPRbqbNWxYOJduoMUw13OPoBoQ5dFc0WxCrMMBqCmC/Gzd
         mEwce05We9MIdXmkyRyepZLirrervwBTeOhyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743365338; x=1743970138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQdIPIBIFPsMXzbqA6bIdMRDw0puL1K2JM/M9dMbXWQ=;
        b=ep2M+KiU39GxJfR9yuh2k7i5CBaCo46xHVEWW9KG+ct06Jy6NorLe3zg67/90TqKJa
         ozYHAPpA8vnpqkRUgsI9eUyULooFILnQjuJVivosazcTHTC0ooqwQzm9+PB+ZJBkCYPO
         CyTUyPIR4P/JV9PyLMpFLVBz3AhJgOShVpXglTmH24IQ+uqFCaqsyJHOlXE54AO+mLOS
         uWd7Yu1/f/QOADpoCSy3V1b/rr7J0O4wC/gwmphmOXZ4HBXS8/Z61u9cNiLeKrJDsqKo
         2+DkkRPzb3kZc1ejk8uBqf6sNitiC2vrAxxmNyKChbVm9FTEOxYNTUxXqykOEgLyo7fg
         ppgg==
X-Forwarded-Encrypted: i=1; AJvYcCWRFZXSn3REJCF38NoFBlktyLjGOEgrClEWfl0CRgAx0t5k/fePeAAAZ+n5swDirf2C6aM3pUJu3isgFkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKOb60RUtLMHuVZofnDX4IoZaXg/V/mLlINH8j6jIjiPtQ8lPq
	NYl7CfRYuUi4lGwmymfn5TfuSA54D/MIxxv3bWvbkfbBdJFcrI9HTq1iGWKVB0N3PuEvJb6BUs3
	ctcQ=
X-Gm-Gg: ASbGncs9RaSKrBRZArXsc5W6XD2d994INKh+tSOB667ZztsiwJ9NPR/0xLjsFqZo1e6
	xVcSHk7H5bpQvv2EsG1/yl0sL+r5g+Bckit23E+NuSzQ+6kU9nYnVim6mDXKR1gcG+SuOBYWYTM
	F1qgvKZRqtWNHFc5bLg/30ptY00J6Ci3EU+UCMh2duVlZ3C9PIdxpEngrWwIl7Jx212hiqEOolw
	SAHl1vqwk2B6MIeohoD96R78W772TGfNQ2eO7Y6Oe49TFVnbYEFn6rCymELf2owMGNlYr8KQBJe
	EGz46Q/3vle8IuXPXy/HyJwNNnueHLeRff/OZcnQxkSh/N5sNDEcb/Q++2wafUhXIvFviGfRwXV
	NWsUGQsExZpIMUiyo2VbuauCdiEPaww==
X-Google-Smtp-Source: AGHT+IEGY9wfHI7/ArQgG5sOCRDyT0MIYyV/m/7dMc+AVfJYQ6p7NoMiDJHT4X7sD6HwAelP0+GNng==
X-Received: by 2002:a05:6402:2709:b0:5e5:ca1b:c425 with SMTP id 4fb4d7f45d1cf-5edfd101725mr5404230a12.17.1743365338340;
        Sun, 30 Mar 2025 13:08:58 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16d32d6sm4604812a12.18.2025.03.30.13.08.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 13:08:57 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso674833166b.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 13:08:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhWMC0RAWYVSwbXAiFzQhP9s59PF/3Q5OLSXOP+YE+fIQhrOpUmciFhmBNHG1yXh35mDcEdkx9SUEctTM=@vger.kernel.org
X-Received: by 2002:a17:907:3da3:b0:ac3:4227:139c with SMTP id
 a640c23a62f3a-ac738a5064dmr549397666b.24.1743365336889; Sun, 30 Mar 2025
 13:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327144823.99186-1-alexei.starovoitov@gmail.com>
In-Reply-To: <20250327144823.99186-1-alexei.starovoitov@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 30 Mar 2025 13:08:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg+nyd6Cqnw-vVxvVTTW31zOyBOHO0ak1xPFX5C0qut=w@mail.gmail.com>
X-Gm-Features: AQ5f1JqZpY881qm9M5vJvGClsN_VOWkQMfOTIJY-M64XcTRU-qfDU4LkUOiqPUg
Message-ID: <CAHk-=wg+nyd6Cqnw-vVxvVTTW31zOyBOHO0ak1xPFX5C0qut=w@mail.gmail.com>
Subject: Re: [GIT PULL] BPF resilient spin_lock for 6.15
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@kernel.org, peterz@infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 07:48, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> This patch set introduces Resilient Queued Spin Lock (or rqspinlock with
> res_spin_lock() and res_spin_unlock() APIs).

I would have loved to have seen explicit acks from the locking people,
but the code looks fine to me.

And I saw the discussions and I didn't get the feeling that anybody
hated it. Merged.

             Linus
