Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF089AD5E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 00:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744157716; cv=none; b=KmFwtR8R4ZfvJ65JjD2deNor/0uLUE1eOdzGKONg4lc67Ve2VegFMsMzKgF6+ISEazW4ccSClZD8+F+6lBp/xMMq0dCDHmY7lY/CANDZax72A7abPjPwWMbcd99PU2f3wqdTPyylNYj3eoBRMnsYPlhpcpbPkXPCSptRyyv1IlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744157716; c=relaxed/simple;
	bh=kzUr1f5PApCyyaQsNWZA+8T6s6ncUwpR5rXya9vt64M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gbsHWin7Oy8pc99+F2PeR6BmzcByF/HyaTYtpkfbEZmVBcw5oFOrl0iaTLK1tZ+3zsbrVXKyGq9wM72af5cC0PayEwc+rccoCVRN3u5lY7kNwLYVvNQ4OehFhwU+Q+w3qtj1HlnD90UD4XmsHjwKSjHzM8oQ9pNiSQnIyCsV1T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MBBs2D71; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MBBs2D71"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so414140a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 17:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744157713; x=1744762513; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y7RB+y2EUGP8TtBqM/TIRDMB8wrdZCpt37v8TqudoNA=;
        b=MBBs2D71AJl6WTQKMKdVGdS1R8zBW/LlW5+PaB5EBRbatJHSMfwWiR5ERWCXqTHP2U
         G9ejgBj9Qot0qCQHEqP6dBzKP2BVr4YKjjSEE0AcUlAvmYBCdbgF9ZqYH8r+gipN7WLd
         HEHydea6/tNc03GnmKM4cDF9iA20BU/YXlQDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744157713; x=1744762513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7RB+y2EUGP8TtBqM/TIRDMB8wrdZCpt37v8TqudoNA=;
        b=fLFRcU2CBKpHFUd0Ah8pNKyfacY+EQ4OQsrCWpMuxQqttwhDuBn6O99IolA1yOyunW
         iprXDsAN6aAyNkM4J53XLROBsd3VBoCq/cHb5vsnOOL9Xbj3QYRk39xCliG7S+vHc/gT
         /v5PrcsiFb85N27ho03Rtx1PoPbI0F+epmmy4goL8S+cxsdPM16iXggpXL52vtfG7/dT
         HMEsgSWKofivd9vX3njYxGYjUK+3oPIoQaW+AX2uKxRlv+Ct0jLFhQgsz5cqJtEdtY8U
         NT3RELDMBh/ceYUdy0+6aqUBBIyo2Ymnw8EFmT6wpxknVxsaBcCTiAx5hfsCJsLVwDiV
         lh7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7nSOonhBGWlcc8VyJaiqbfojd88w7kPr7XVfz2lKkGYjh2iygIhusje0u8/qzHW4Gll8um7E2qiSzw7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvlde58PZwoaH+ixLcMiO74go6R1hY9QvGIu9gU+ezRjaqoFSH
	NL09nMCtzyB29AkNVekW/aRK01hfh/mbhJPAO7uGkqxr3eKyP9wtPIs56QBMUzMww0gqkA/lOL8
	9StU=
X-Gm-Gg: ASbGncvxiyuqM5rxCSac40k73B1n90rZsa+K6G8AlzKjwyHFaOdQn+iiDtwJ4yHEsDU
	2Y4iU117p+Fqt0RmZnl61WqQwAdsN4ubySjCgSce1ByoNNdvOrTUiUAg7DXX9migtk0eurcQNv+
	mz3myIQvQXrdWNT4LbzLbcWVSQPCzBYbQa0IGjoCuOwgyo51qYJSK4iUcOPCYs644+IwklPLVnJ
	VhyC678KjCRUNwwr9inGW0DW/93pM2hqRn8BGt8A1GkTF6MOa97hjfEEfgzSABNZC7+tPX8+HHX
	XhfaoMfbODNAoVbZD/LgS76HZqHtGv58S4m6/OxDsXJsn1XIvuE3FvpML3UsmE8WqNvPHExILEZ
	DJ/MGQGvOvKw/BZ14yW4=
X-Google-Smtp-Source: AGHT+IH+5tdjf0CgAn5+dh+lBPa1b4hV+s8UYOcKhHd6g1zNDqkfQmqVF1gYXwn7CMrZQqkGGpb46w==
X-Received: by 2002:a05:6402:d0e:b0:5ee:498:76e6 with SMTP id 4fb4d7f45d1cf-5f1f480911amr4915100a12.17.1744157713225;
        Tue, 08 Apr 2025 17:15:13 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f088084e49sm8679162a12.50.2025.04.08.17.15.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 17:15:12 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso36352566b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 17:15:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwHkQWgTkgKP6mGjC53aaWWdZyp9b4xkqm0mp3rDi8v+69hg4Dnmng+8vGZlcbmIiPhaOsgFalyusX/5w=@vger.kernel.org
X-Received: by 2002:a17:907:97ca:b0:ac3:ef17:f6f0 with SMTP id
 a640c23a62f3a-aca9bfb0d37mr81837666b.5.1744157710814; Tue, 08 Apr 2025
 17:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-fno-builtin-wcslen-v1-1-6775ce759b15@kernel.org> <202504081632.00837E7921@keescook>
In-Reply-To: <202504081632.00837E7921@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Apr 2025 17:14:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiN62aoWPkgRutvjKpxbXJdvgNNY0DqDc=9_r5FGUjfNA@mail.gmail.com>
X-Gm-Features: ATxdqUEzxdv_c924M2x5edBsLVmXTsnFzfYKX1p8a7EiZ3toGIQu_4WxIx108FY
Message-ID: <CAHk-=wiN62aoWPkgRutvjKpxbXJdvgNNY0DqDc=9_r5FGUjfNA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add '-fno-builtin-wcslen'
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 16:33, Kees Cook <kees@kernel.org> wrote:
> Since I have stuff queued for -rc2, do you want me to snag this too?

Well, since I felt so strongly about this one, I already took it...

           Linus
