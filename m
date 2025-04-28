Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03278F49
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745881547; cv=none; b=KPAwMqsLMG+Wsh3+eT63dirDjN1V6EVKuCa7ifbHLxZGOX3ztaYoE/JixsCFsA+GTPQcxOtaZKoTyw2GhrjXO2emHcFtRZM3fODYgtmWQRI9rQV5IX9Ha3XmxpLeX9B0S5kHOdes+aPkWXV8+GI+OkT3niqKVUhqU+5k2GBeojw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745881547; c=relaxed/simple;
	bh=0PgKhQbGjNMa4yQ9lcnfermV7YSX85o0Zl+7gzx5SiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NgkvNcsua9xOuWCaa9PoImGktfwxGlPM43xI43gNEogiUnuwLXYvNeSCyQY1VZSKzoYA9v/5vQ4Spud+gRNhFK6HnckxEV2fS0EDG+yiV+X7PIQNpJoS/ZdSekpPNFbP3Xd2GlUjbvv+rX7CEmQ1RTnlkuZdmCOtgNoPht5E46c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QtGr9xTm; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QtGr9xTm"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5499614d3d2so5697017e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745881544; x=1746486344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0R4S0korJIrkvFdB5mdwO4NQZalt4RfkVbC62YLqZVI=;
        b=QtGr9xTm6A1F24pnhsy1Y0+CnQhY5Dro3t4OV1UlOkywGkksYSs0Csu5BJfNHoxbFf
         0+m8bee6y/QfLjWVVRoumT+VkyJAi/BsmSKGOWDTGblb8FQsyqxrVfVtpv2w40rr5e6a
         s2F3Z4jtXAV3hOUOuX1z67NZRWEUA7KBJRzZVX4q7JqrLtcDZaqWKBhTDZ9Y3Y3NTeYc
         7qvX7ysbeJS6Q11e0fNNygxOCJboUqJitrHwlZDFtHHkTaqygCwgndwxgmk1owxNTsM+
         xVxYaZc2uH5cBCJOYtbVw9Naw1pIH0mJ/m2+Sf0iM6VrgSZIntZWNwav+CADtSdzFYe2
         lhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745881544; x=1746486344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0R4S0korJIrkvFdB5mdwO4NQZalt4RfkVbC62YLqZVI=;
        b=fb0s5F5BDm4Gp2Hjh2AXxA/5zGH0F/Cl7Ggd0vYQSTU45W8krkpoD+iIwXJpJzVk4U
         Co9Ixkc4rbchvp9BnDWMaGDzgJoP/G96c8qvz+/5WklTuhE5cfM1SHG4liTXmoWok8xn
         jgAUJyDyo6phmchPJcFiTDyxK+d1MLT718ERbNEnwT0mVw+I7t7XAHUVIg34c/7FXDjd
         vCrNrG6cJBcibnFdGqn4tOV8QUi8Y5oc6MyfmKQgr3DiuJzKUclJ+R41KByDP5oil89s
         AB+1hVUUCdjNVQMjS37WtidyfiI7VXjHsCoiHi6DVmjlocty6vYJnmQ3LW4sfmZ/Lnv6
         PG/g==
X-Forwarded-Encrypted: i=1; AJvYcCWZcPCZ38FkPNMknWrfZnSyfDsz2Jgp/xLBWAf+c/czrwXmsFjzBCfTZOj5GHjGwNlGHcoJ8xNXgd0qTZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpfYoaRnsj1GsNLLsmMlyJthgewBZDy8/RvRc3JTfzQ6uByXSo
	rVMfOUn2SqHhT0bSytsmfLAjhyKdX20RrdXAf6t2ZTeZEMMg/N2P2uVMAXHFN+tEMGlMLARI+f6
	/nhMfzsRsvZZXkQZx2bef+Wg2YCflY4uhf58=
X-Gm-Gg: ASbGncuErmp8LWbcHBrIbOIT5KyLRPfwUA5+TT1ANHOg1lAvqnM2DbQk/ZzgD26E9Mu
	Nk0IEQ3o+QTNAULzkJ7PwMlTCSgjXzmnAB+FDoPEFBR3l1POANVTrePjlcO7OYR4z5ewUvYoVOR
	5ZLLIU6Nb86sKTDoWdqsH6TgATRhi5Dz8uyb7uPwrrrSS0wRncV14=
X-Google-Smtp-Source: AGHT+IHMtZ2H3E9dDAX+Lx7o7uEqvP6SiH/aFQ7OE7orf6EiGXGqwg/UlqZz7z3mMAwYhKQt1ZTox86LKxCvfNL+L8A=
X-Received: by 2002:a05:6512:b18:b0:545:b28:2fa2 with SMTP id
 2adb3069b0e04-54e9daeabb2mr386730e87.7.1745881543829; Mon, 28 Apr 2025
 16:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427113529.1473800-1-suhui@nfschina.com> <20250427113529.1473800-4-suhui@nfschina.com>
In-Reply-To: <20250427113529.1473800-4-suhui@nfschina.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 28 Apr 2025 16:05:32 -0700
X-Gm-Features: ATxdqUETLThP5uo4PFWVkPRipIHv_RwOQNEBYPTINWSsM8VaP1HCUT0gsYdiilE
Message-ID: <CANDhNCpg0WRm6=7cb2pTqNswCE=3__7k6oFeGKKuZD7oQ_rmkg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] alarmtimer: switch some spin_{lock,unlock}_irqsave()
 to guard()
To: Su Hui <suhui@nfschina.com>
Cc: tglx@linutronix.de, sboyd@kernel.org, dan.carpenter@linaro.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 4:35=E2=80=AFAM Su Hui <suhui@nfschina.com> wrote:
>
> Using guard/scoped_guard() to simplify code. Using guard() to remove
> 'goto unlock' label is neater especially.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> v2:
>  - Remove some guard() usages acrodding to john's suggestions.
>
>  kernel/time/alarmtimer.c | 56 +++++++++++++++++-----------------------
>  1 file changed, 23 insertions(+), 33 deletions(-)

Looks ok to me.
Acked-by: John Stultz <jstultz@google.com>

thanks!
-john
