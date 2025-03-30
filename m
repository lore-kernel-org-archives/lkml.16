Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5CD17A2E8
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743372514; cv=none; b=IQllWVjK4SiS7SjJfA8v4t2D+03TKrtf5e4Z8Glo4/UazVgJHF+pqG3x4Jk63j94tx1+YnPaLq7r23X0PD3B4GRtx8IkqJcMsaxyniVjeasy3K2vyJaA4Sttv9fgl2IRcwDLg0CHVbSpS0LgX3gwSmCtWZbg7gdpjTBJQE9H4/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743372514; c=relaxed/simple;
	bh=8/up8ty56Gdo4JOnj5iSPSmEQbPaQTC9OAhfGjjhL4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OiwUs42/pcl3i2nQg/+RIEy0q+9QatMG0Cg0BNhP0GUbyH7+je0WU7t0ySmcKucjtYzDmXEFbLVvn7jo/wUld4Yy86GoyA6RLi21P+eIpRtSudpRzjcfSRbEpwfWrDmAbOWnRxZSFQoKPf5SE0zmNRTpqYvKb1za5qzs+A11aOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bOzXRLQB; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bOzXRLQB"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso7196130a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 15:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743372511; x=1743977311; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HN6VVHsTfsHAxtBYzmbWQnn6fGWAOX8tYKcrUgnCUww=;
        b=bOzXRLQBPwXv1YgZbRBzMTC/DosCmPDQuLXi/9cdkBaIguuyXaVULmgDS4izXGFUdu
         UB1zLBpYbXIyukd/dTtEWcyuKK+FaYUWEtQr0WyGjsiofHsNNuHNIemcncOCAEk7zmnc
         9Xm946VmncNkcXCd6jKFTSBGUkb+9KbGmoDvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743372511; x=1743977311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HN6VVHsTfsHAxtBYzmbWQnn6fGWAOX8tYKcrUgnCUww=;
        b=rch9JMLYTbv4R4rpQWLjPinDd17qncMWbGOeHHXWR0FsjOckrOyIfbk/bhWCKKSx5/
         xMhZxmRnldH2uyt7fOxmvEUo3PcNmJfwlx7Jr8Oz5JFpRPdotj9Pi72UIQtWpYPbyCiF
         9A+zTghGXrO7RwFo3zms/pJS/PJVQGUfEr6uukp/3QA1Gwl0x8jQhPR+Dk0nFmttUOpE
         /7xja+7cSd8YV0aQ79TCrs5AfEDWBBV6cquMqrJ/3cQ0o7HZGlYB8OnfHR+ydmhkmHc/
         vQHGpQaxk+N38VYCr2VepR8qivDShMS6b8gatNEHa6czSnITzJtnOCo10f+9X8ygFPlP
         7O0w==
X-Forwarded-Encrypted: i=1; AJvYcCXxbCUBDr1GO/NBT7FGsH2xNAMIUrbpK6p7Y0Edc1tweLAQvNkioa+7RXMVRKQDXeRVbBpchQbMHBCfegU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxIxEm9luN95PxjYX+ZjC+akeZAnl9ds0e3k5vkVjibLzhtQ/R
	mKAszcFSuN6xbg/SuwnVtM4UY4K4tyaZYisutgx4dcBObVMFqRLrJar0xfb+bqX6QIHHE5oP5z7
	42rU=
X-Gm-Gg: ASbGnctiAOC7NvomQyJIJvRjgEh5CRnoCCKrgiDokD1gKk+WmgsVdyEpaoneoQ1Exns
	L94Y4tjatw/90zf8jrHQmp/wwkAfR5uydOVbbhOOOc9YpO+g0F3QedK58cud/vWUDSER82cRr2a
	jszOaCEduteTlpDUPBmUISLwcWWk/J1U9GoZUt7/9rvSBasH/wxMKD8BxpvT9CBMhLPXXqjbEa3
	1s5exXF2FZ+KKYosLNK8jSW+k5iU62FWGrR4ta3WfRhQIxY+wX1leXNpzbdDjYcHEy+bE6g7lSs
	fNCnqdTtq7JkO0cLNZnijCyvIas4xMgbE92zLPM4RqkFoUUM/aZXRT3fLeJqZaKVK4marKrD6iH
	dfXv4/BzbZgQTwTse+0y26XNO7XXlXA==
X-Google-Smtp-Source: AGHT+IHk+/afIHpSJJ5GGMpKCKzCjuaVAeZhrtU0yIYwx/hvjqBA0znD0B34L2Kcz9h9o35WwJeqOQ==
X-Received: by 2002:a05:6402:c44:b0:5ec:cdb6:f29c with SMTP id 4fb4d7f45d1cf-5edfd9f72c3mr6518010a12.25.1743372510809;
        Sun, 30 Mar 2025 15:08:30 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e06e7sm4660570a12.78.2025.03.30.15.08.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 15:08:28 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso7196094a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 15:08:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvSlUipoWkZS64ixRLKuYZMg8Kvdaj1cMG9CniWHVU6fnMi3ZHxacb4jJNzuZ1J+eobfj9PeoTFpMl4gM=@vger.kernel.org
X-Received: by 2002:a17:906:d551:b0:ac7:333a:a5bb with SMTP id
 a640c23a62f3a-ac738bac9b1mr589608766b.39.1743372508372; Sun, 30 Mar 2025
 15:08:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327145159.99799-1-alexei.starovoitov@gmail.com>
 <CAHk-=wgRbk2ezu1TNewZQSrT1MCzP-xAXrcHXULMeW=RRSak5A@mail.gmail.com> <CAADnVQJBHPbq6+TQhM2kmWNBTiPoB50_fnVcwC+yLOtpjUWujA@mail.gmail.com>
In-Reply-To: <CAADnVQJBHPbq6+TQhM2kmWNBTiPoB50_fnVcwC+yLOtpjUWujA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 30 Mar 2025 15:08:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgpYOGdQ+f62nbAB4xKLRbxnuJD+2uPBmRzSWCo5XkEGA@mail.gmail.com>
X-Gm-Features: AQ5f1JrL0HE_uuGJo6f5HMFn8GluWXQ592_aB8vmPzkng5al8ToIkAF8po4Fdwg
Message-ID: <CAHk-=wgpYOGdQ+f62nbAB4xKLRbxnuJD+2uPBmRzSWCo5XkEGA@mail.gmail.com>
Subject: Re: [GIT PULL] Introduce try_alloc_pages for 6.15
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Sebastian Sewior <bigeasy@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Michal Hocko <mhocko@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm <linux-mm@kvack.org>, 
	LKML <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 30 Mar 2025 at 14:30, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> But to avoid being finger pointed, I'll switch to checking alloc_flags
> first. It does seem a better trade off to avoid cache bouncing because
> of 2nd cmpxchg. Though when I wrote it this way I convinced myself and
> others that it's faster to do trylock first to avoid branch misprediction.

Yes, the really hot paths (ie core locking) do the "trylock -> read
spinning" for that reason. Then for the normal case, _only_ the
trylock is in the path, and that's the best of both worlds.

And in practice, the "do two compare-and-exchange" operations actually
does work fine, because the cacheline will generally be sticky enough
that you don't actually get many extra cachline bouncing.

So I'm not sure it matters in the end, but I did react to it.

             Linus
