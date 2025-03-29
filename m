Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8F670821
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 18:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743272380; cv=none; b=bxyqrdzq0KZn1l0LEne9EcFDPqSECCIlhekoLIZRQW78Em+jKAuqeeJZmVQuJd7wAFMTUTOe82EmVaY92VckuUBV90Idh9k/YWWzVnk8s2RN6ooXBWD6HW5IP1Dnhpu5vQvWRQ9NYc2ji5XY3cV90U20u7NpgJCgAT6M30DO5VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743272380; c=relaxed/simple;
	bh=sFdOZX1pb/yqN0Jss7k63caIvwp9BeCbNz+hWl1QYDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVGZSHbd6KaySBvOKCeP7r6ta3C1YXEscJuDhxlk8B5l0G5S744WBdFn8W1RY3yjj1G8kmEHubAIU4IoP99ijxBOW/0VqLoYjKZbOSTo688FXDIoRELeKTjWmKpGLxgG1soSHrPhSK/lmvL+F3FN8T0F/WgjGZgOybqiFRprT9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=B2nOg2GO; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B2nOg2GO"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac3b12e8518so609053466b.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 11:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743272376; x=1743877176; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yCy7w6bxMCSPIFn2dLOuLyXOfcR7syri8fVJ0KwW6ZA=;
        b=B2nOg2GOy9fNkhxOqV9CwS1xtOI6dlc84WCJPH310rxp7jOzd+RtoCxyRuhUYcNvnd
         vre+asSm5jI2dWTgbHOKseGdEeEYqJdMp81i+sKlJFdQkAEKMILL0X1K2+W+NyU9LOkT
         p0QGcyNGSEOTwFaOAlFD14CO+skYNH8dkVaBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743272376; x=1743877176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCy7w6bxMCSPIFn2dLOuLyXOfcR7syri8fVJ0KwW6ZA=;
        b=fGYvadvHOL14TGpS9KP9UmOH3MghLWmqHz6DzoI7Eil2fAWlGS+tYbperv/muyL0ur
         PgFwyns+/shuHlyOgnr4x+PG68LXiJJH5Nz+ORggbU8dBQKgI/a+AJLD3OQY7rRvntru
         HkhYQQYWnGtDV3IWXlYe3WpljqvpW1rfGcUPkPLXl4jJmFbIDn77Jb5xaAV7/0CJzxfe
         ZIyNwx74XG1p5zAG8Eym91iq0UscdVQFOMZUCVDOO7RO/vx/Xm/pBKmgqljPB6C9Mg8L
         rZyOLsq3+XHRzx7lu3nQS1TQe8er5YzgaO0e+po78lDnWTv1igKGGjnUe6m95xvDalD+
         TBGg==
X-Forwarded-Encrypted: i=1; AJvYcCVk6T2JHPVHhiVrq2xB/2H+DWk7EcTz7V2tnxO6ISvCaHVqSHMafDzuYuWqEmSfViBfdf9kooAquFe6cPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKuFYtoUrPwsgoW1c5ywmJ8TN0LTGERuAmpwWjlwLpHKhcROeK
	cnl5dUa8CXi4sfCEkXNBe0v7452+dwDhKJGwRQSfLs+sEHmE2QnXrCPWFSy/SbjS31udTWxJtKF
	UN4c=
X-Gm-Gg: ASbGncsajl6QK/3qit98Mq1qPry4x03Sq42akrDnXF/kDC91ntjAUiPneryLVJIJ0Xy
	rplbcMnpauk7ByI70WyTKSa4QfwV0Js64odp03XQ/IhL1lCOHJrvSaRxXaSDSC0/5c0uirUQb5t
	gaXQv5GggP2Z5TD1jFsLPBN8/btxdRezLCr+dXtAjZFKdfMIzWugxsmSLhtBVLhskP9iLcjVudP
	lzSUFQrJqJm9HNTIGO68NOBSCu3XoFv9GkszX+gcoeHH8b83DM62ckJMRaCHDL4P8h+HdJSgg+k
	BDRbxZ/jrFCCP2cAJwSwUCppUIRjAB78273oNTR2Ik/LXpvJPf4OJ8MDlNZ9YgPv06HJb4IaxhW
	plxLskL0dOY9Tm9RdYM4=
X-Google-Smtp-Source: AGHT+IFco+DaCJNTbLLhFnCauGLQUX0FemND0ojluW9lvpDy1bJC2/cjlm5H9JIaK+kWyq3ZZfMBlw==
X-Received: by 2002:a17:906:7955:b0:ac3:b372:6d10 with SMTP id a640c23a62f3a-ac738975daamr366745266b.4.1743272376279;
        Sat, 29 Mar 2025 11:19:36 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac719278259sm367984066b.38.2025.03.29.11.19.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Mar 2025 11:19:35 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac3b12e8518so609051466b.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 11:19:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgKh2vs/6frXh4jjakb/caB4RpImw8nAuN4gix9JcWzjj482B8cGerNZL8wHsQRxFkvRWdLKHk9XdW97k=@vger.kernel.org
X-Received: by 2002:a17:906:c14e:b0:ac4:76d:6d2c with SMTP id
 a640c23a62f3a-ac738bae46fmr268991066b.40.1743272375207; Sat, 29 Mar 2025
 11:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZZ3F/Pp1pxkdqfiD@gondor.apana.org.au> <ZfO6zKtvp2jSO4vF@gondor.apana.org.au>
 <ZkGN64ulwzPVvn6-@gondor.apana.org.au> <ZpkdZopjF9/9/Njx@gondor.apana.org.au>
 <ZuetBbpfq5X8BAwn@gondor.apana.org.au> <ZzqyAW2HKeIjGnKa@gondor.apana.org.au>
 <Z5Ijqi4uSDU9noZm@gondor.apana.org.au> <Z-JE2HNY-Tj8qwQw@gondor.apana.org.au>
 <20250325152541.GA1661@sol.localdomain> <CAHk-=whoeJQqyn73_CQVVhMXjb7-C_atv2m6s_Ssw7Ln9KfpTg@mail.gmail.com>
 <20250329180631.GA4018@sol.localdomain> <CAHk-=wi5Ebhdt=au6ymV--B24Vt95Y3hhBUG941SAZ-bQB7-zA@mail.gmail.com>
In-Reply-To: <CAHk-=wi5Ebhdt=au6ymV--B24Vt95Y3hhBUG941SAZ-bQB7-zA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 29 Mar 2025 11:19:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiA0ioL0fonntfEXtxZ7BQuodAUsxaJ_VKdxPrnKx+DAg@mail.gmail.com>
X-Gm-Features: AQ5f1JpE91a6ThtQF6-oBNe9LzuODVuNbOWM5dekqqynxRKsAhb6YqLAueICYfA
Message-ID: <CAHk-=wiA0ioL0fonntfEXtxZ7BQuodAUsxaJ_VKdxPrnKx+DAg@mail.gmail.com>
Subject: Re: [GIT PULL] Crypto Update for 6.15
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Mar 2025 at 11:17, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I happened to just merge the rdma updates a couple of minutes ago, and
> they actually removed the example I was using (ie the whole "use
> crypto layer for crc32c" insanity).

Heh. Looking closer, the "they" was actually you who did the patch and
Leon who applied it.

            Linus
