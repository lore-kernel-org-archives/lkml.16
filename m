Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA682820A7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841780; cv=none; b=siIKyEH5JYMu4KVGcRyhHDMp61dyVAcyLLCOIgoFcJwBx2HWtEsn3sWFdVsSvadvB/OeRJef855OuB1Jz6no89j19ixCYPTAKoo9b3T9h85kOYcEIw9DleelLgcMjcesnZoa7LBrwCFoFIrZtkoXY+9vObQRNRPYKuUZMXG62XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841780; c=relaxed/simple;
	bh=ol6hG/xIb5bYbNO2SBhx7LVEvxidce1MZgkT1Tx5R7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z56UXzuE36vIT2sgrhmgqBPXwkoVkjzNn7D50GuS1RNN0Q86Pw43vpErLLeyG5dpcQ8rB5aSdpdNBazwFmj/mHWfUM9SQQ83NRIrl7fXYnVogmp5JKZSU6OOjXGghc/dv48VnneSXelvMIOqvxJWL8f3ECeWHsFaGtsm5hpED7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=op7eE2Zs; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="op7eE2Zs"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30f30200b51so78266991fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750841776; x=1751446576; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ol6hG/xIb5bYbNO2SBhx7LVEvxidce1MZgkT1Tx5R7U=;
        b=op7eE2ZserNuvP4n+qRg601caRgmSUFYOiJfvSqdH9Q3uUnh4tTL6C9KwiwaKq3R6+
         5cbdaWLIEazToB0nDTwb4V2rBPDAXNR0h6VtOVq4YZnxPOqhb7xk4BCb2At4K3FjQHDf
         vZhclGWu6AMbMEmzOBPbCJ5o7dOUpcMHi2wlad+6oE5l+HM6GtDfH8vjtJn2BXGK18vI
         +5lt2kykNH0znZ20fnOttuGuUPwZ6/ZkqZMYbg69uzt0OkBtqN/4wjvzfd6DyTXUASbQ
         6XlOKxAeu+Nq4fELwwmTLCnSyXrusKZ+4rmWcAdiYCMrXv1xIZ+T9d7g4KVIOwIMm8yJ
         4Pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841776; x=1751446576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ol6hG/xIb5bYbNO2SBhx7LVEvxidce1MZgkT1Tx5R7U=;
        b=FX9wnssPM+KhJgUrOjeOX8m8fz3kmWD29G4r/tVdi+DcKuWFOSbNgJlRCaPa49lnAd
         AHmpPGhMWYcAUXjcoeUXuG69jJ9PvB5GYirOJazSRloCmkic7n+5pobFEwDgH8fl8NJx
         PgZU8cSKnYWIEBjONfSH2HewqRgGKUYAGS8cFOKmZ7PP/JdveoZ+Tc4sm7QeIeN8clHN
         QswD5W7yc+lntTjen2FNxPtqETGjZlnYwZLKUUCHr9C5IQSghx3CcR2gr+TG2VijNZ6o
         c7Sc7cAOlGQGzg8mwyhTyQUpEp3iF/JD4MNRIlrW//5EhQ/iSRID8/ZRDQQPc6rCdMLd
         fLxw==
X-Forwarded-Encrypted: i=1; AJvYcCV+rokftqlqUSF6JX85KYdYBgFOoUqye08i6NlXCWMAFowpK/aj3PBHXQGnl/e0CWfXG3P4a4/+VJw/wZw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp3Dk8dsTdRYxVFrQb01hJGjojmX/vjyMEdU8BTDec2xnwQwpW
	Zo+pa4h38UxUGu8ci2UwGG51VQp3sJVlwfKfPH3Pe8uMs/gQUsKoVqzc2XWeEa8nM4RnN43iq5W
	sISlgi+/Lf70lMDwHVHNaQo3rlp+vnW2w2y+DHkMP
X-Gm-Gg: ASbGncu/ljGfB/JHeCofelMw8+jI0HKB+72A/yIPIGgMbn9yVrPJsr8fwwW0dpsfQTE
	CQhQhFyFJQGf0CpacNSjHJt+sjgBsxjy+FmLIK9XFo4rDkrHYwiyPxOJl5mWo07bJAb1i8UKfnw
	z5BN6a80GO/+M6nKHYxg1BrQ0FvnKSzpwy5Lw89pBqSlPApsWtKCX/tKsslnSqbEpE1/2rJO5cM
	CT8
X-Google-Smtp-Source: AGHT+IFpgMsBCJNfJjNTqTcRqyvaAq9toiC+ROW42NXwQoaO1HLVScBehwrjaxIyE7j0rk+vG9CVwK1uxS5kBraTZEY=
X-Received: by 2002:a2e:8a90:0:b0:32c:bc69:e91d with SMTP id
 38308e7fff4ca-32cc6591e04mr3745431fa.39.1750841775748; Wed, 25 Jun 2025
 01:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFsE0ogdbKupvt7o@lappy>
In-Reply-To: <aFsE0ogdbKupvt7o@lappy>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 25 Jun 2025 10:56:04 +0200
X-Gm-Features: Ac12FXwcV14oy7Lg0QTHJjjjHfOFa5hONjjoyvSSHa4vsJdvjxnzlzXvHlNTG4A
Message-ID: <CACT4Y+bV-3HgNOAd+f7W0RBU2-qoocpMCepKhLEb+BcyiJM5Mg@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:
> >9. I see that syscalls and ioctls say:
> >KAPI_CONTEXT(KAPI_CTX_PROCESS | KAPI_CTX_SLEEPABLE)
> >Can't we make this implicit? Are there any other options?
>
> Maybe? I wasn't sure how we'd describe somthing like getpid() which
> isn't supposed to sleep.
>
> >Similarly an ioctl description says it releases a mutex (.released = true,),
> >all ioctls/syscalls must release all acquired mutexes, no?
> >Generally, the less verbose the descriptions are, the higher chances of their survival.
> >+Marco also works static compiler-enforced lock checking annotations,
> >I wonder if they can be used to describe this in a more useful way.
>
> I was thinking about stuff like futex or flock which can return with a
> lock back to userspace.

I see, this makes sense. Then I would go with explicitly specifying
rare uncommon cases instead, and require 99% of common cases be the
default that does not require saying anything.

E.g. KAPI_CTX_NON_SLEEPABLE, .not_released = true.

KAPI_CTX_NON_SLEEPABLE looks useful, since it allows easy validation:
set current flag, and BUG on any attempt to sleep when the flag is set
(lockdep probably already has required pieces for this).
