Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6A0190057
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745731908; cv=none; b=tVfe+fLajDgRVLVWiVTY976aldOp082+zHyAXfGxRp88ZJ4XtMxEkfUUuaosLABQJsSGjnOZJUjUKYD7a0pfGyq8Eej3RcHJwkVGq1rTXmTADoOcu3ePj9nBBG2R6whkehoMxlyoGHV+mCL/prjHZulxEg/cq6j2A5aBiZ/E4R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745731908; c=relaxed/simple;
	bh=ChvuVFcTle+bdz4TLuJPKItVHIzpD/9WsikcUtPWufU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=uL7nYl/YfOHuWD92KaFtsSyftS23FdH0wd0HYqz0RAeUVophHKxs4iFfFNgmKbGL3Qx45ys1hehLrV19kkq9zrvI5on9u/HWxN51T9UbWF454Kh22psD6jU5wjupmSl7pqoIypGjaB0orx0YtMlAmj7Kqh4TZgvbAIbwQ1erBJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSQX5FjR; arc=none smtp.client-ip=209.85.219.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSQX5FjR"
Received: by mail-yb1-f193.google.com with SMTP id 3f1490d57ef6-e72cc45d99cso3293537276.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 22:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745731906; x=1746336706; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FpfcE1hb7qHzAzOOl9Fxh623mfRW3LeNV7JV5Ct/whw=;
        b=kSQX5FjROtXdPFgXoevFt0vD/BqGdSI3QN82VNCNsraFd5q0uUSJxXr8iMC/MWvLkA
         06IebDLy6mCIXicMNcBpM5r1BWpFKftGMjkLXsbfQWeCPbTqrEmeE7AAHKxobO5epRCP
         TaFAd/E+PWlwN/AEnFa1HUAoEiDWz2oXejrjQsQnRvQuYfaK7C3F5PuWFKrQQlx+xJF1
         KMlIQmUEOD2Kqyw8lfn9P0o5tg/kH30bJ+dj5qE4ajrF6G89o13aZxoKJnkhOsLR8ULl
         9pcdwlw2Fbu+SIDRA63KOoB8NDoq2GZeOysuC2dDRvajLn3EfX54bqDH8/kDXvL2tOor
         ROdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745731906; x=1746336706;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FpfcE1hb7qHzAzOOl9Fxh623mfRW3LeNV7JV5Ct/whw=;
        b=GRcdV2W/BnjP7dAsBpwL/0ygs13sK0cQSQ8E17BJbUrM9S1lT+PwLzDZwheImshjYb
         UO0GCX4OutJwt5p54xiO1dt254U6YU3xeYoVmLu2XUgG6qPA/U6DGUoAiCWqEJ27AAKX
         a7AfAKSI4MSphohtSdBdmzAiqmV8Psp9ZHui1Q94HIo+XAVaSbzJDvE+Vv7Z5yJPRC8u
         PF2B4LtvItCh813dwvOCCBE1CbQ5LhEIs2hhNiE2NY+NQd+3uxzdGw2focNZcFzlhD+e
         MtknAUVEwD7bBeV5Njnm0ly+AR789Q+UWF8TV04Hsr/b1v3oMX/nuXdsT8K5PqONNYo6
         dvCQ==
X-Gm-Message-State: AOJu0YxEp9O9wSLlQssE0PcaG40sL05tM0/h+sX4FBHV3Gez89EVQN1V
	TvwZbdmHY1Z/cCA4xprM7IhNEcXRCna2J2WuKrzxyok9/VQua4DW4qNju99580JTPmdAt2OQXVa
	KxQUImL21gIpE1goGbIlKPRLVAV1bEuAsDv8qVw==
X-Gm-Gg: ASbGnctMKV5BOAcHhvsdaH3f4vtm0HKFKi22RLQ3dWtfq/rB+rXOOddEXrkOKGKQ7++
	i0GTi85JAJKH6NtIJiPninm1xEp+oPl4vIxjFoLR4Th7Kj8QxmMh+R73ERGHIAK/zE0IoBiPjfD
	t3JZaQeo+6LXtLRP8bOtH/2l+fL4TQVfhHbIkXyqVyfV/Op9YiPYpDPn8E
X-Google-Smtp-Source: AGHT+IEZMx/q2OGqlYZXnqmKxPp9QRcahWMIShHxWqY0lwCz5cojld6KsRvkYWKIaWifCxaU288Z06IIGptnxWP4Ojc=
X-Received: by 2002:a05:6902:114a:b0:e73:3279:9fd0 with SMTP id
 3f1490d57ef6-e733279baa6mr2201493276.9.1745731906148; Sat, 26 Apr 2025
 22:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Sun, 27 Apr 2025 11:01:35 +0530
X-Gm-Features: ATxdqUE8TEbahtB9kU00mMgQp1xrKo4MjxoutVqsl7dCy1I4LqDEMI10dtyoAvg
Message-ID: <CAFf+5zi4JSZq=Y2FkNJyPUTFuvwa5UJmn4zd6ve=VO8aSK9FOg@mail.gmail.com>
Subject: Some useful bash aliases (file .bash_aliases)
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

===========
.bash_aliases
===========

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" ||
eval "$(dircolors -b)"
    alias l='ls --color=auto'
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

alias ll='ls -l'
alias la='ls -A'
alias lltr='ll -tr'
alias l1='ls -1'

alias grepl='grep -n'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias vi='vim'
alias vimdiff='vimdiff +0'
alias sudo='sudo '
