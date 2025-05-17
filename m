Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C3378F2B
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 04:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747457124; cv=none; b=DpqluBi55V65e4AfCFAmHX90+SiSVfUVONr0JB8k25JxG+oeA/mBh/4YM+sHF1C7FTbgPl+jBJUBC7nPk7r4ua/kzxRyve/oRBQo3+ZhAWYqqbjoyDh1hERSq0wS3yJA4pVrtByMy21vdSD8tXl7F/M4SXMtbzpE2W3IttAOU6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747457124; c=relaxed/simple;
	bh=h3ZYJmqY7lKWKGqXThCZRIoL+dx9Q1Lr8144Hu2uPO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOXejPXH2G7zgWfORas4wwhEq4wsDuWm1caopwT3lgqDmSx3InPxqnogHogPiYujDUti/SoAcJ1AyHrs39sqNWZSPP1ro+QrAd9fMlrzaKm3+eg/Z6558BYJtyhiFrLsoTMnUr9JbZIMy9BPJA7Dmsk4zKXanwlJEtGXVcMjOWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I0m8xkr8; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I0m8xkr8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-231f6c0b692so77995ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747457122; x=1748061922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3ZYJmqY7lKWKGqXThCZRIoL+dx9Q1Lr8144Hu2uPO8=;
        b=I0m8xkr8BaGUtWjcJ/gEKmim/6kEPktM1/4FBoQzHIEctVrFUWxMIQ3pBSC8RFo1UL
         klPYYu6m2QzhPiQ0uFtXYK/GXayDoTsnAtxxnMSNEXRqYQuf1xlTZ8xW84BT1+VLw4Sp
         1lRnVgSq1VSYKWXDFNPftO84fkwRigUf1bM7I7W/s2sWL9VGH/hOXx57KTkeWgIqwMyg
         hxbB+B3YKrKfqh05/MG694BgcVpxZ+7SOkroumc69O2zoFoaJuAjYK41XVRDBrJs63wz
         ocOQOXycRiVRYIWXrWTVBnHZLgOC72QpItzwQtIQlEFNC/lSdakJZX82zo2+w+0eLg+L
         wJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747457122; x=1748061922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3ZYJmqY7lKWKGqXThCZRIoL+dx9Q1Lr8144Hu2uPO8=;
        b=VYSYEA+hzLhrd5SPYxeNx7Yrz8oIQ272DXUPhMN2Z/4URUR3iyQ7VKzMaryn01R5YM
         VYOvju3slb7vO4KZUW0zQKTa5yRW5R6aFAHjlKKwOMTdcLcLs5n0QB6vehPaWE4tBbvD
         Os+Vh946tsIJ3klbqoVe5UqUQBL39STAdGIwbZN9Oq2cV3dUDRdqY7y5SvfrV69z+CCe
         8pYRdWrCisMAYeO+yZv3uEkzy2sa8R6Ylbbb0j3qG3ditNvEC4TtO5i2j5RfhicX03lm
         E5p879mBEsLRpWHJTGMt5eKPa0Vql/mM82pSc3uP8ehXKt9y84/KOBZfGzuiqf7sJqXl
         zfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2W2CX7GZGMR1zu0AsyVlHC1l53/wGRSs4g42ghwFve5CLIWNt+2SfnV15dL51MjRM6U6vvBoEKkocEuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLfds2ApuPz1kx09Zyk8EVbYBp+vV37jGzqIQOBLjIkk8rP7OB
	2HkrND5IdSmZWNfao48Au+B1y2/9f/SVwRyr3AXaq4qQEctgiQgi5IdgYCEfv6idpO/d4hzNsMc
	+je35JSU49KhCy/gzNNJPkZFRyeIjGLeWnOgFNf7d
X-Gm-Gg: ASbGncs+BPC+jpJ868wiu9XmKgf5eFzf0cxuHSaN3daz4jA26V7GR9dnFJUBAx5YdqU
	UidGeyeDHh77bb5oBCF2Dit4HvfacDnnc+I17wbUYMDzJnlnq1vNbmNBk+SIqKGY6yMydgB0D0/
	gNA4RqKCnDlMWnU+VlOH3sn3t39rzXnCliRA==
X-Google-Smtp-Source: AGHT+IG47ua4RGzCDfg+w8Ijsg7WnHcjk7tEFoY1lo4vF9JcyfIeu5XX3tD1NT4GKXYgDzl0jsiNot54rheb+4oDP38=
X-Received: by 2002:a17:902:ce92:b0:216:6ecd:8950 with SMTP id
 d9443c01a7336-23204154576mr756045ad.19.1747457121758; Fri, 16 May 2025
 21:45:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516225441.527020-1-stfomichev@gmail.com>
In-Reply-To: <20250516225441.527020-1-stfomichev@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 16 May 2025 21:45:08 -0700
X-Gm-Features: AX0GCFvpwNq82-Ipf2wTz6WnI0rg_QpT_IhTLHQNdP619TT0EiLrBt8Ze8gGkDk
Message-ID: <CAHS8izNJQFGFjVr42VVh2zHJ+PxfUYCupEdHka2dd0no_b=GHA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: devmem: drop iterator type check
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, sagi@grimberg.me, 
	willemb@google.com, asml.silence@gmail.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 3:54=E2=80=AFPM Stanislav Fomichev <stfomichev@gmai=
l.com> wrote:
>
> sendmsg() with a single iov becomes ITER_UBUF, sendmsg() with multiple
> iovs becomes ITER_IOVEC. Instead of adjusting the check to include
> ITER_UBUF, drop the check completely. The callers are guaranteed
> to happen from system call side and we don't need to pay runtime
> cost to verify it.
>
> Fixes: bd61848900bf ("net: devmem: Implement TX path")
> Signed-off-by: Stanislav Fomichev <stfomichev@gmail.com>

Looks good to me, but can we please bundle this with the fix for
ITER_UBUF, and if possible get some test coverage in ncdevmem?
