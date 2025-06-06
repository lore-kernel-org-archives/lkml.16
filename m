Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B3524EF6B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749198394; cv=none; b=h8OG0n1EVd5jSwCOWCiRUnBDfwsPHprlPIY7VjNRYjcaqcRVMB/s2O3sMwYHirza8oejJWLvxxMzpTBgYjfBRdydy9a9+fUpAHRX3RnL8yn12WDlkPQAlHX3LBoULDVmAiDL8x0FT16x+HBRG0oV1gs0rkC7V5fB2piBArtvoVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749198394; c=relaxed/simple;
	bh=Lk/4bNgje+km5ELpEXzFEGafBzt8r05auPYlzNrBk8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSYUVRkrCBaBbuYOMfn6QL9gM7lI/T2InGdd9F/KHLGawhbgz6ZV9QC2m7lCjtsbApKlBzlnFyPUtM/u846vw1+Ylbv46BctXEzsk75PblUlKiy94s6SXZzD3pueRJ9JcME7l0jkOSkIFapKz1zNLd3AKvft+fBs1J8VRWieN3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=RwgGFdy4; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="RwgGFdy4"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a5a196f057so36049511cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 01:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1749198392; x=1749803192; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/82TyWvrgWW43lzxaEpfXgvxvM8+gL7hQaGtQ71+kKU=;
        b=RwgGFdy48ql4SziPDIvVyRssev0HoWX4EdXDOd1L3JZc0LtACCC9aXPEYNDg2Is/so
         KuJN0odSR/eW+FvkPrCb5yEA5EUJQ6niuiO2y3lmQfoHLJ8S7HZrvoiyGHKm6W/rFfzY
         t8ttcleLr/9tTiZuAh8SD7slLX/tFFmJp8QEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749198392; x=1749803192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/82TyWvrgWW43lzxaEpfXgvxvM8+gL7hQaGtQ71+kKU=;
        b=q0lYIwYRK98K1f0H2dWOX61EbiGcGwziBX2AFZAkeHW2PI7z97aZYM3MINHV0G93zM
         CtLcn9HYSW4MIERqfHTIO98U+MjM3+utdzI3DSf2THOWrN4DiUHApk4oQzptF8eitnMT
         Vfzs2/53teoMQE1dgDp4iIt4Co/IPTOnLGTvB3u3y+kXnIv0wqOx5sTobnQ+Xk4KqwNf
         5MOnAQYgDaYA5Qm2la6Vqdd2bmAFujga5JQDjHTt+Oqk5FJLhyiCgxTtma+6lwTocjHi
         LOQAxVi3ENA5oEc7eBEcr8knQlG9xh/AOPV9pocvOS4jJAzWvdOWXo9afr/BTgJ/ZG9r
         IPhA==
X-Forwarded-Encrypted: i=1; AJvYcCWG0BAbhDRPu08+hw6uwaxSajmHy3SW60kn7IIFGYKjp6812ICnx/WzNVZjOHTQeV0hTQZlefi1tT+xqDg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf320r++2BFRSqSeRAUmhESjOA0pdg2Nk2w3+sVExG1c+FHybw
	1hTkoMMqSXHhnRJlIYNdvUwJUMXlidWOegrm+3iGJIQCkBewq5Gz5TCDSx9av04ytxr6i/x0sQ6
	wUxG9k/WuIWOYmZj0qby1e3JmTTEhh7KDrESX9L+ldQ==
X-Gm-Gg: ASbGncs+y0EihurwaZFpgR+cn67Qkm99EhgffXPfAN26VMVw59IuvIGfnbZp2BHdTy8
	HxyPSg0djL4WsKVodITpIvOvGjyW9ywx+zu5XIk8ybfDokpP7f9Uv2srz79L6t2StEoGftImU07
	nReAnvoIpKqEOeyiaXRgD4r8iXnIr+NLNgGMXKiKtJXA==
X-Google-Smtp-Source: AGHT+IGBbi1c+tA0gmzvVBVmYU7L9J/QhtafZyTFlLLqiw79nw0P2vMwUHhQmJer78X7KJBrKFe2wFSw2pFlN2i6t+Y=
X-Received: by 2002:a05:622a:4a15:b0:4a4:3b41:916c with SMTP id
 d75a77b69052e-4a5b9a38b4bmr49387721cf.17.1749198391790; Fri, 06 Jun 2025
 01:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <jofz5aw5pd2ver3mkwjeljyqsy4htsg6peaezmax4vw4lhvyjp@jphornopqgmr>
In-Reply-To: <jofz5aw5pd2ver3mkwjeljyqsy4htsg6peaezmax4vw4lhvyjp@jphornopqgmr>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 6 Jun 2025 10:26:20 +0200
X-Gm-Features: AX0GCFsh9T8XrzmD5kl2B3MmZjfNpAHi77kyIUl6LTG8TtxdLikYxjk_YHqZDoY
Message-ID: <CAJfpegtNB22Dpi=wX8nBDx=A9SeYZKpZGniJHBBxJBHB3o0nHQ@mail.gmail.com>
Subject: Re: fuse: suspend blockers
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Jun 2025 at 07:57, Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Hi,
>
> We are seeing a number of cases when blocked fuse requests prevent
> the system from suspending, which is a little important on laptops.
> Usually something like this:
>
> [ 36.281038] Freezing user space processes
> [ 56.284961] Freezing user space processes failed after 20.003 seconds (1 tasks refusing to freeze, wq_busy=0):
> [ 56.285069] task:secagentd state:D stack:0 pid:1792 ppid:1711 flags:0x00004006
> [ 56.285084] Call Trace:
> [ 56.285091] <TASK>
> [ 56.285111] schedule+0x612/0x2230
> [ 56.285136] fuse_get_req+0x108/0x2d0
> [ 56.285179] fuse_simple_request+0x40/0x630
> [ 56.285203] fuse_getxattr+0x15d/0x1c0
> [...]
>
> Which looks like wait_event_killable_exclusive() in fuse_get_req().
> And we were wondering if we could do something about it.  For example,
> perhaps, something like:
>
> ---
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index f182a4ca1bb32..587cea3a0407d 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -241,7 +241,7 @@ static struct fuse_req *fuse_get_req(struct fuse_conn *fc, bool for_background)
>
>         if (fuse_block_alloc(fc, for_background)) {
>                 err = -EINTR;
> -               if (wait_event_killable_exclusive(fc->blocked_waitq,
> +               if (wait_event_freezable_killable_exclusive(fc->blocked_waitq,
>                                 !fuse_block_alloc(fc, for_background)))
>                         goto out;
>         }

This looks fine.  We can turn each wait into a freezable one inside
fuse.  But that still would leave core locks (inode lock, rename lock,
page lock, etc) unfreezable.  Turning those into freezable isn't
realistic...

But a partial solution might still be better than no solution.

Thanks,
Miklos
