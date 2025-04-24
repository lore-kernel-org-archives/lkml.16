Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5F61E633C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479708; cv=none; b=NnnzDEKQtjMCX1YfcCi+JUzlnJHaCnbJt6HKRYndBOL0NNMe103/n6w+lL1z7vyWdSKXv42jw7pz7HvqFH0jQncLgU5DEfU7ZYUf95zE0UEbfv13msdABRB+kpud61eoJhS9lKhnKM1TMAbCeB7B2memyNy+60Qge6WX+6FWMLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479708; c=relaxed/simple;
	bh=rrafsmQRgHakfZDjK1w6FolouhAo42wX9rjQTJYVUM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XX61mk4hAsOpC4daVSl/ocGBwPxXhyUA6t6AYEwjxKtmawcqunjQHsNJiozPk8gKSyMsCQliEbyRvVHBr7Z11XGFVWNa6jqQ9qeByJSlf3LLWPrvO5nw2ym2a8zSzt4ucwPBFAhIEccTfdpzkw3l/ajhYIp4ioK5+xiHcZsrQ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5241abb9761so319333e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479704; x=1746084504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9seCpacsNWkUEqB++ORNCS6Ujo5QbBvcFa4UL8hXrKk=;
        b=JO+xgWJjlVLE4RY9mqXfpIuqerdyB+hc9M8MAx3VJlBvRQ4ecic12kG50JxAQKFUIT
         QfKlxrCrygI4faXe95p9y10Ino0iAwww8YAZbq74o3WAQ8j2Id0cVlgY1p2BnMDLY/NU
         2BPRa8Zq8Caw/N91CloKn0wVwrT/fdYNu7Em3M1mhVnoNYpeZ6SZVxU7CySOCoBYNcRn
         KPeoeKMLqPX016EROcMOGRQnLlh8eRRS7ctDsLcIjfjYb2Lj2pr5FnZzIeYaEQCCgmiI
         fxWVHB2C0aHctk2QVvkXsTPY8jiIb8E7mkUrKlpsvQ6z0gWPS0oU/zv93zFSRfqSEeM0
         FW9w==
X-Forwarded-Encrypted: i=1; AJvYcCWGSzB1h2aKBKXwWMZCjGysNiLy88GuI7oPQVcDZPrSVW2hTb+Z+R6HAMW8pTl4mHN3X6SyLwjls8eDfto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7UTbLImuggzr72esUrJfqhBOhzAx3XYTCP8SpRzk9jsUliN6b
	KngXkUK84BbDm6MNoRb9SRTTzhM8I2olvcmMvpiYNG0A5ujwYEVC9pdRavQj
X-Gm-Gg: ASbGncu7hUcCQ02gqBubVcX4BRo6Ts8FmrBHw1Q9scxEKwBnIGv9/WOtZtn83H5iKb+
	8HbswpFI0WeiQQNOVQGksZrAvYJtcmsXUMcwM3TRtYR9zbc3Ez2QqwTddFM/YPCEQS30+g4Rjpz
	yt2jZSL3JhoF0jSIJeVUOFZmOqCN8IesH0IULba8jQwGwwFbqFdrGzZMMaOpNH+s7oUecgRAs18
	ZTYPAF6mi7gwcQhmgLztuhk0PigVgRMX+qTgV/zfpQ/5PyHQJf0Iib773VtknytG/4oDfc1dHJP
	vcMmvGXUqW3XVG4niBx8giLnbdlwj07VLIoJGxdrwxDRwUSdpyVlBoxpre2ksIU02v6G1MUuC4w
	3+FA=
X-Google-Smtp-Source: AGHT+IHhgZawk5Y3crT6l9NQ7aX+wSZieSsnIAXyuHkKbhGsDyx1dpzk61/t9/NwGrSDiz6ID2Y5IQ==
X-Received: by 2002:a05:6122:325:b0:52a:79fd:d05e with SMTP id 71dfb90a1353d-52a79fdd0aemr367805e0c.2.1745479704202;
        Thu, 24 Apr 2025 00:28:24 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52a79f93e90sm152165e0c.22.2025.04.24.00.28.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 00:28:23 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86feb848764so293897241.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:28:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7p4drdHoplzvWk9OjlVw0SekHvY7SL1rUOd2E0Vp9Kw6cnvtq5//9hL7PtJJJOmRDJx5Krrk622DonBk=@vger.kernel.org
X-Received: by 2002:a05:6102:94d:b0:4c3:9b0:9e6b with SMTP id
 ada2fe7eead31-4d38d2231b4mr1364322137.10.1745479703504; Thu, 24 Apr 2025
 00:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d0f30a551064ca4810b1c48d5a90954be80634a9.1745453246.git.fthain@linux-m68k.org>
In-Reply-To: <d0f30a551064ca4810b1c48d5a90954be80634a9.1745453246.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Apr 2025 09:28:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWD6GXLiKeOQRUT9BSPzXcMKYyk-YonvodZvTia2VEzHA@mail.gmail.com>
X-Gm-Features: ATxdqUHeMyl0vXyqZGyuC_hoFBTwBf9LswSSeAvstppnbqazV4KiNo1iFAwzm_o
Message-ID: <CAMuHMdWD6GXLiKeOQRUT9BSPzXcMKYyk-YonvodZvTia2VEzHA@mail.gmail.com>
Subject: Re: [PATCH] m68k/mac: Fix macintosh_config for Mac II
To: Finn Thain <fthain@linux-m68k.org>
Cc: Joshua Thompson <funaho@jurai.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 02:13, Finn Thain <fthain@linux-m68k.org> wrote:
> When booted on my Mac II, the kernel prints this:
>
>     Detected Macintosh model: 6
>     Apple Macintosh Unknown
>
> The catch-all entry ("Unknown") is mac_data_table[0] which is only needed
> in the unlikely event that the bootinfo model ID can't be matched.
> When model ID is 6, the search should begin and end at mac_data_table[1].
> Fix the off-by-one error that causes this problem.
>
> Cc: Joshua Thompson <funaho@jurai.org>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Nice catch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
