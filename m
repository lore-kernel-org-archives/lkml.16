Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5439E17332C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744121943; cv=none; b=rDzaVBAN8AYrtEmxKpHoiXwGU51wNpScn3LRI7hlOrJVAApMwjjVigdtkz0EBhwlJtqdEdMHu4OtwbrVemA7ih54sAO4qr3FBfDD4QAs2AuqUo1BFiml8IB3dQOeeoXMI/6Bx6MvDQyFaq5gH0prsTy3HCsixOdh4NQOjYRy99g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744121943; c=relaxed/simple;
	bh=LU9c6S8jykeOIbG6spfGjk1g+WXwLSV3Y9u1UsLCvIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKpx5MJ2ClLszzB3uFi7lvBU0wQidZ6Dn6cUkynMoMeP6qeWAwIigMXfACF4K6MWLV+ujNtLIg/1cfOCoNun1npUtv+aUpUSoKSzl5d3EzI7d7S6OeeUh9P8zbiKw6bUa92Fv0Vs0CT9wGDnShd+rxKJGE9PkMdLOUh09NMD1do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VqhxqQHS; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VqhxqQHS"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4769aef457bso57730971cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744121939; x=1744726739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUED+YsizoYtLbuUa6Mn2CGrviLGvDgEueuSE8tfdgc=;
        b=VqhxqQHSrgG0NHPDtU978Aaig06cFv8kxFpUwFtp8DJWhHWT3kCkRnNu3hLdeA85Mg
         LoDWUFXB5ZZmJKHh4CzB1exYaEAM3H/e3V8aOav5/T68W+FMV8E5m2DD5Pvz/kzIIJbX
         aH3PCFa2omAn5F4/oMt1mtqQxQqLh5n7e9EFHt/ylplbaNjTTDdBfEOnCRV3VPslFRjc
         GXQxxCQoJUBqXdgEdZRArPc2j8Ka8yBny4T4n+Ihf25RCQKBvfvIpQrglKGAxmXvDPyx
         qbuhXI0LhnstYtJd/+fa22NxiI/WFk2ZGSNl0C4lgTuD1le8zhvKWNy5CGnyDj7IFRMw
         H7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744121939; x=1744726739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUED+YsizoYtLbuUa6Mn2CGrviLGvDgEueuSE8tfdgc=;
        b=YTyw3X4eMfbN8MVu9rwx2HrILbNb6DKsNvuaWmslOJyD55HtfOHLalL62uVe2Tkr7H
         aiPKkJitPSmYlxD5xI4AqlfODYLQx0M97+npSyKumQwt6Mha3I1rqbrx0TLvNtZ9tkqX
         wlpP3lxX8NntwnJTIzTEfWnviGVOu2U2/uLScB3iW64zF0QDOc5ktNPGIjnYzIZaFBDJ
         MGGM51IHQfGZUEV0wBiXY1fKIpyY5Z7IKaO7jAATwj3KYgDJsC+nv8PFUgeAfqtwQJ9k
         KLtvdWa+h3I2j4HctkJqj8eWY/wemVrjIu04i5/IP/dgRnGcvhwLTAxkHtmmlfToHty6
         Vqzw==
X-Forwarded-Encrypted: i=1; AJvYcCU/zZhBAPtScAhaETQJtS0tLtOYjjWmnGFrx0F5gPfbdEcDR/FgDbzQvBW0uXDRDtxeVmiJPAyiLKp3sEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuq02qZbAfGwv4x9Gj7gxzC5BoIRLrWRW4u2D7HEh/OaXHJyFc
	seK8WXDGDMpgQi//EhjSLeoDp6bJxfcDpMC+gnLb/2uLsYPYf5gNOle5bTauFMz18GCf6HFiWHW
	PKy8UNq4MW3FiE8BEs9gQthhCsuzfKLmNCC4F
X-Gm-Gg: ASbGncv9ppIzrCHd4NC0WlkYRs8xpUpczrx34EXpiilhN0i1vNwkZ8q3y3fsY8AEycy
	zQEJJ18cm6RirnooQ+34xFvcEBXU282sCxhJEkOGykYpKHzfumY9c0aBIT28t3luoYuPX3E+HQH
	yBCBgA8rGal60Lo2vsfXm5QDg+ptI=
X-Google-Smtp-Source: AGHT+IFIhTvGae12W3Tf48cMLLSWVq125Yz7ZFcXjWUhP0aqaEKdzLe5CH8ZijLEEkcz+k7HaYWQTShUKE3lcrVa7Fc=
X-Received: by 2002:ac8:5956:0:b0:476:76bc:cfc4 with SMTP id
 d75a77b69052e-4792595b9acmr239939611cf.21.1744121938944; Tue, 08 Apr 2025
 07:18:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407140001.13886-1-jiayuan.chen@linux.dev> <20250407140001.13886-3-jiayuan.chen@linux.dev>
In-Reply-To: <20250407140001.13886-3-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 8 Apr 2025 16:18:47 +0200
X-Gm-Features: ATxdqUFSGvKSj3SCrZXg0qfXO62DRsoebr6pzqkdURmDkUnvUfIhjveRN8CTtjk
Message-ID: <CANn89iJRyEkfiUWbxhpCuKjEm0J+g7DiEa2JQPBQdqBmLBJq+w@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v3 2/2] tcp: add LINUX_MIB_PAWS_TW_REJECTED
 counter
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, mrpre@163.com, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, David Ahern <dsahern@kernel.org>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Nicolas Dichtel <nicolas.dichtel@6wind.com>, Antony Antony <antony.antony@secunet.com>, 
	Christian Hopps <chopps@labn.net>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 4:00=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:
>
> When TCP is in TIME_WAIT state, PAWS verification uses
> LINUX_PAWSESTABREJECTED, which is ambiguous and cannot be distinguished
> from other PAWS verification processes.
>
> Moreover, when PAWS occurs in TIME_WAIT, we typically need to pay special
> attention to upstream network devices, so we added a new counter, like th=
e
> existing PAWS_OLD_ACK one.

I really dislike the repetition of "upstream network devices".

Is it mentioned in some RFC ?

>
> Also we update the doc with previously missing PAWS_OLD_ACK.
>
> usage:
> '''
> nstat -az | grep PAWSTimewait
> TcpExtPAWSTimewait              1                  0.0
> '''
>
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Eric Dumazet <edumazet@google.com>
