Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182831547F2
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748892935; cv=none; b=bLKQh0xhREt/+RS7JAOBIyXBNsEbX+jCtyFe4ev8Dv9DFbgXufEUHvdzUuqM3lPLHQH1Zy0bA7p+Hyut21Z0OVtMbKXoaH2vodu0zG+3U0EqaECBp7bBp8hp3JFP+iEe1XNNjnEkDMRrCCqa1bvAdpZh/tq5iqR+0Ahf2oUDObk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748892935; c=relaxed/simple;
	bh=Fg08d64b5ePUnruuQKUCUSH/VInppwAdwj8gY7IPTSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7BM4Qv3nUV5Htyw8sp6x+I3cTpeBgX8qq4pWbp0DEFI/7smQOrjYUeH18ru5v9UpwoeKsgDqaLbI/SNz9JRCSjByCldONtfNOfl8pOS5ZLX1XE7Od+gnVC5CjEABKq5sUthTKT6NWIm/5gszL7XVyyL1XNH2kdZKI4kGuwNzog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XVX0QuL2; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XVX0QuL2"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so2548a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892932; x=1749497732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xq5vMjsqAUNangGbAlIpkpc5137EXp7JGDYqS/RcZw8=;
        b=XVX0QuL2nCuzio6zZcCkYlAlMnFzxjVYXApLDezvC2CyEK8IyAfHRAXuGHMV4uI6Rs
         xeB1Ci+YyQIIsnP2qOivwzvL+BdqhU/MKxdb8W0lOFi5/8DaXW2meOe9c/JtC1dOddWt
         HZwNWus+I5ZOJiGSV3xc00YSbOKT6/er7KXNObWhjY/StTQ+YNRnxQ6ZRd4T5aKGKYwC
         EcrgXXeTP87TyS4xBfVUQBd6vLipRyTmRtKlqAOTfNSJLWdf6jPwNcFtzRscxlUABIam
         Ycfx8CXSwe5NA2l9jdP94YRrt/l7HzCtc1samGucL7H5yNRsNvb/uLKfamIRDcP/jCJF
         IOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892932; x=1749497732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xq5vMjsqAUNangGbAlIpkpc5137EXp7JGDYqS/RcZw8=;
        b=DR7gOvP8rbROmfa4CdInn7KwxdzFUYc0SFbXUxj4dNWMeJiA/I2AtrbWpzV9d/M5P0
         oiZ9UwSYzfCA1kUuR9TXP4ekQbiOkX1IJk+6ZALpgC1YVDLMadg/hDlqDQ0APLXMopq7
         34wrGhP5Fiy8H1SF96oXdN7TXyzRUmpg0dWblCLI5r1wFKYjbKGa+amWArdNcX0V0Ye5
         amStKYvOnmD/mvUQ5imD2tB5NV4o6tZ4zylEfh6QwdS1jYgTahXhAcrfK2Z++DYg3G5c
         dAvwgsLP9jKplznAjTC/iPHpXTIzDz/3Jp8ZyEDnrMrVnd1z+dpids5XyN6W7aQEAoPs
         JTNA==
X-Forwarded-Encrypted: i=1; AJvYcCXWqGrLcAuI14E6oQ67nFrhkVWon6l/Q7O0CbfdcIX49LE4NJUBsQs3IaDa+OYZMZYqKRuI5zU18KjC3kE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwR+ueZPRxCJ06uoToCsbbqKibxhuGxCy325cMxHojmgEau1vf
	BXWqu0Ter88tGvTGrv2xK1XepIikBqnxYBopaULM+pejH/vw6UVbMCcm1DeEWPzDLxFsIS2PIbn
	4R84CDmZap/Ndc2HNFR9th5RDP33Kv06SRdj56b3S
X-Gm-Gg: ASbGnctllEo6Uij1T0AzGEgoGitxeWC3ms1wc2RbLM+FULaegJSVZ3eK6m+OLuxNiAH
	oZa7GTgBHBJ0tmTXIIdMSdceb6QoqW7kb2rWWGGP9NF1Nth0McW5i1FeSabMRInoXDW5PW4v4+I
	NaLNQO0QFEX8YJq37PiYzYVH6OVAqmlsA/LwNtbLBx58XCqkiYFB2NQA2+zgxKuft3yLTNS4FA
X-Google-Smtp-Source: AGHT+IH/OfyeabSFfBxmGtqCZD31NM2l2uVsn+0dyvf/XN8aRWzTWDtW1x5ZwP8piDACek9NUiwnpZIDCWRy98uG9PI=
X-Received: by 2002:aa7:d748:0:b0:602:3bf:ce73 with SMTP id
 4fb4d7f45d1cf-606a957be48mr16288a12.1.1748892931922; Mon, 02 Jun 2025
 12:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602174926.1074-1-sj@kernel.org> <CAG48ez0cysRfJ82UKH39Ns0gYOcmn7HR=UVRDo74w=uwm6pcTg@mail.gmail.com>
 <b3783c64-1f68-452d-ade2-1fc44cd8f080@lucifer.local>
In-Reply-To: <b3783c64-1f68-452d-ade2-1fc44cd8f080@lucifer.local>
From: Jann Horn <jannh@google.com>
Date: Mon, 2 Jun 2025 21:34:55 +0200
X-Gm-Features: AX0GCFvNl-0UEi8K7w4Xh_QBm_v4ESFeF-ysLJPT9_tjiwJjA2Xpjf0BxgDgNfI
Message-ID: <CAG48ez2aqd3gYV-6fEjhNpQ05_16htPZX+aGZk-iVh07HpBbTQ@mail.gmail.com>
Subject: Re: [PATCH] mm/madvise: handle madvise_lock() failure during race unwinding
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, stable@kernel.org, Barry Song <21cnbao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 9:28=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Mon, Jun 02, 2025 at 09:20:14PM +0200, Jann Horn wrote:
> > @akpm FYI, this looks like it fixes a security bug in 6.15 (probably
> > leads to UAF of VMA structs and page tables by racing madvise(...,
> > MADV_GUARD_INSTALL) with concurrent faults)
>
> Hmm MADV_GUARD_INSTALL / MADV_GUARD_REMOVE require only a read lock, so
> madvise_lock() will be:
>
>
>         if (madvise_need_mmap_write(behavior)) { <--- nope
>                 if (mmap_write_lock_killable(mm))
>                         return -EINTR;
>         } else {
>                 mmap_read_lock(mm); <---- this branch
>         }
>         return 0;
>
> So for guard install, which is the only thing that can return -ERESTARTNO=
INTR
> madvise_lock() ignoring the return value is essentially a no-op no?
>
> Am I missing something?

... you're right, of course. please ignore my needlessly alarmist comment.

(I think it is surprising that the write lock is killable while the
read lock isn't but that's another story)
