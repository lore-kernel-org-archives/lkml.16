Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C2B2905
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 02:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748745371; cv=none; b=VP9Xrc5snWXwFRyRtifk/8V8Apr0PRY2uE4WECF0CRpEFZDERz/XH2PZx+oQsUeq7Nib8leQWcQeNZiFDDvB1s/l2KJFqnDdzhvWlNxqOFylzziKBtrUENJn0FoUcc3Y+XimBGBtgU9P3v1RzKa2Xk7+2y5Y0Ic7r3bJ2SFFIak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748745371; c=relaxed/simple;
	bh=M50G61sqw1AaNqNENCNaIhKwlyqc4HkBZL0CBEFh4jI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffBVT7FWPVNxqeG7kB6KZho+mF1ts0yHE75jmZ4VAWhAKG7zMqOxskKfdRmzpKENFGDBX9sDZDbMZW0MXhzKMgPiLx2O5JtKh+Ys2Du/JGgUOEfT+YDg1RlVSw/HLrmomiQTnp50EaX0MN4G//c+JaqasHKXupKVwwPNlPgLavg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bXSgMhyj; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bXSgMhyj"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-604f5691bceso5817740a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 19:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748745365; x=1749350165; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QWxj2jDTxp5oT7ga4QB7swClDCxNYYobU4fQPUtkDLo=;
        b=bXSgMhyj3eU+3vObzPEaBTaN+f+hBnZyTu5YdqFq/Yu6Y60yDglxjbrhTfQLHzVsme
         2WWmKavZ0hORxsHsNciQQftEBoK4kQEzLt2NMHHpbDqCbfSBruZcq54HDgG45xtk4xa9
         Mg50hHY4Fojwac+eeKmP0grPOS58a86Hup3CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748745365; x=1749350165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWxj2jDTxp5oT7ga4QB7swClDCxNYYobU4fQPUtkDLo=;
        b=YaLlPLSA4raiRzX6FP9DDOzb1IHR/NaL/3rVSoamDpy8nSd1ze2APCHQ16eOwaiq78
         wGx1z04fZOqtoYzucwv8IK4MBz/2vZ+ONERy9QnexFmkQOww5/Rey4jKB9zQ7NmNMuI9
         Gzyp3/nGdww1hGHxi6HeWMgxgPfPz6HAb6wzZmOYzddRUfIpL9v2mRaAw6woQ+DJbc6r
         wFD3PPCNTQEVYADyvQFtUCG9p022+w337E83WAZKB1V6qzm/9bb6FmBjVW437fsJ+fsE
         d9W9ZV2see6cgctL6J58jC32dmqs+IkyqejxkJR3sHQRX/8SZFhRNnPUKKBmhd0EAhtP
         HxOg==
X-Forwarded-Encrypted: i=1; AJvYcCWFtaRIGEcpwIbN1mC16Yb8jfZXnVTbfCjEkT2EzfbeZmlMCxPx/zV7BMzAI1cyWb6yMDpblqHsQX3DNpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYL0pcwpyPCCIjlZtFGjOWXmy84Iy8EJjqFbe/MjQ/hvw9wkOZ
	5wlNpphwMc4FVk0ABuhdz2zcsjFOZpWGX2WhCUTpza61Rt5pxmArfNfCtbzfp11KCRuvoWeiRrO
	KKNA77zs=
X-Gm-Gg: ASbGnctdUPOwotGvY/6Zz2jWwfklyxGSIMArL903SfsDOHU3UlpekfjLagGaace7Ps0
	b2hcwO/unm3VLMmLY1FU8yDlYQl1rxySwYMTA4xiGS6cv/tZ8+lRiCSUW4Gsr4OEcjwdHTUaCbi
	tO7lRhKRVuQsQWnpUFpRsmjTrfa1NXriPbURXM7IVi+NQ7ImpQ/lHJmMcnH/5cROWRDhHkTkfwg
	zHe7btc0/opidshZgD5QkeJ79serFIzdwwGrI+1lDTG6UBWmIDWfpr7kYkOKsM0H6U4y/uUyEUA
	CLV4GE6P1Zf9ZI8KrHpP0W6qdjuWEsSpGFzBtwUDBp8LndS7oR47cU+gyC+9c3F8440FJQOcXhK
	zRbkCtoSyOYrPOY7MzKGOTeEkZA==
X-Google-Smtp-Source: AGHT+IEFgxw43jGbnarI50FD6DzEWANiwydlUIDCVbkhtfuSy7gUwrbzW/Gw5qB8zJxJK9cdz9QRVw==
X-Received: by 2002:a05:6402:90a:b0:5ee:486:9d4b with SMTP id 4fb4d7f45d1cf-6056effb5b7mr6974245a12.34.1748745364950;
        Sat, 31 May 2025 19:36:04 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c5c5casm4048715a12.25.2025.05.31.19.36.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 19:36:03 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6045a8a59c5so5414413a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 19:36:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKtHv4vxHgpJiUDAonNZcV0PXmlcArrRD3+jxdjKNhWQ+tHFNOlkOJ9j/TxJmYKSDckyFmRooTQy5dVI8=@vger.kernel.org
X-Received: by 2002:a05:6402:210c:b0:601:f4dd:8572 with SMTP id
 4fb4d7f45d1cf-6056df48906mr8932692a12.17.1748745362160; Sat, 31 May 2025
 19:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202505310759.3A40AD051@keescook> <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
 <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org>
In-Reply-To: <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 31 May 2025 19:35:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>
X-Gm-Features: AX0GCFsdQ816tAqlfuVlCMbbDykt-U8R89k36JvlFAC9BT-BnzgCyEdeS4-zV0c
Message-ID: <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
To: Kees Cook <kees@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Ingo Saitz <ingo@hannover.ccc.de>, 
	kernel test robot <oliver.sang@intel.com>, Marco Elver <elver@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 May 2025 at 18:06, Kees Cook <kees@kernel.org> wrote:
>
> I have no idea. I had noticed a bunch of my trees were refusing to have sane merges.

The rebased history would explain that, but the reason I'm upset about
it is that I don't even see how that rebasing could possibly happen
"by mistake".

Any normal git merge rebasing should re-write the committer. So to get
the kinds of rewritten history that I saw, it almost has to be
intentional. I don't see how that has happened by mistake.

At a minimum there is some truly effed up scripting going on.

Because it wasn't just one or two commits, it was a whole slew of
them. I mentioned one, but there were *thousands* of rewritten
commits.

IThat bad branch of yours had 330 (!) merge commits that were
attributed to me (both authorship and commit information) and weren't
actually from my tree.

And those are just *my* commits. Never mind the 6000+ other commits
that didn't purport to be from me.

This is not some "disk corruption" issue.

There was real *work* involved in re-creating 330 copies of my merges
and 6000 copies of other peoples commits. I only looked at one, but it
appears identical except for the lack of source tag signature
information (and then all the subsequent ones that depend on it will
obviously then have different parent SHA1s etc).

               Linus
