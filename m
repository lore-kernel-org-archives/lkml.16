Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF73A26A0EA
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746771349; cv=none; b=AbwJZN1aU50XDQo4f6NrMaZGiKTRVY3VC4hHRV0ITIQGsrzAr+vVLM5U8WP36C+XkqW+0i5IBezdKy8bAvCwJfIeh7u1SC6Sc3y6VZeH5hxF304ydVZpRCE2+qtOUrQ0TA3jaiIAOV6w3UC4vzHsH1Ryshi8/w50r7LjfrPEAHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746771349; c=relaxed/simple;
	bh=PAlJ1N0OBElbwoLPQZepjOk7fuV1wlJc+kcVBuypzLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gae7Iw3qsWbbVywhuHW0tC9sWf0ao556phje/h8JBh2L6KCejpGukN4DPZ4Euk+ZO8QpMlJsZjfLAGWfY+ij5re5Lz7SL/8s8ABQT7EgWJU+e8kLzujs105IEp+ihBT8KK+4xRGNFis8grySf4jvZOw96D2BsjqyzUPflVqTt6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=O2HyWG8S; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="O2HyWG8S"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fbf52aad74so4396130a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 23:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746771345; x=1747376145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAlJ1N0OBElbwoLPQZepjOk7fuV1wlJc+kcVBuypzLQ=;
        b=O2HyWG8SRdQH/kQUJgYpI416OkBkmkGch1UGYTPtJlD6WM1Q4Jq4AOJEew++EUiztx
         S7cSb1rkjJzNoir3djYzt/QAroREVr2gobQjISsThNeftkWrtORtIMdrEb+fKSKgofJ9
         GueUlJ8FllRoxRi/BCvMUgG/LJhT9xKW0bmlwpRqvU3BlENRy+dzVcTUwahv+ZNihb8l
         7cPHDmPSH9klMa4p0ejMnJKN4X0W6CTUoGJFN2C+um9I5j3D0u75pbOrVZIC2kmIjBVE
         RqgOnOnWxMuZZLgwDtLXXw2bM6g2zCfpn9USxeQ9kRp0+G8deuJRDe3JqSnDixJSomTy
         M2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746771345; x=1747376145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAlJ1N0OBElbwoLPQZepjOk7fuV1wlJc+kcVBuypzLQ=;
        b=hxmuXhR5obMfvqqv1DV3A/n6d8cA20wz33fIwGl4CN2zneRxZidgOzIEzWT9CibVqh
         dNhJ1WFcK9QfmgncwVEbNKZFsR3raJ1ZFQUlVKillPlzIBCX9JUUcEpar1vOfU9wYPxe
         YMOR+sl5a0BvagZz/Za1Ysoid9COvgr26VOcyPwPZMQ8LPS4a4Eic7iOf1LNgKAkERfb
         06LOznoJj8nMT/Bc+Y+xsv754/+0We06Z8O6Bq6Vuq74KJv0VfPj7CRYHQoxheI4jB1a
         U7u4sUDZ5XADMhqylBGjXZXMccL9EGQrDU6xF4y4/3w1DRrqduGfosTrcdImlSvTH4ry
         wO1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqge8DJKlAZx34xKm3ZxxlUB5JGt0RAt5bocYVImTF1rp8cmJbGRwAO4Cl+k+9wRh/6awayzb3b/Q5jrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDTEDW9nurInxPu32Ra114iQGw69sx9zfPhe2V8GigJIZtAfuO
	xSH+THkZx5M6NxlhBnvmi6X6Uo1x6Tgd1TDOavS96Mu72bUPHXuT29pzHbIyMNmxjCaY4A6f5sz
	P8ZzY3deMAvjezMT/GN6DiDcLA81hXQICxXdCtw==
X-Gm-Gg: ASbGnctLfx+dMchtJOtkmqcExhvwZ+LYFDbhf3d06et6rZZnkBJhNTdK+iVQh7SWkhb
	wOY9PkNbo+GS22zy4T0jcSlMOiB6ZltWU37vnvKkWYLkpyvMgIqb76L4sMjjGPfN7bx6ZvVqufA
	p/1RuATr8lIcNTEGZxLJI81+KumNuou1peJSG7dkRPU0XlDQJc2Wk=
X-Google-Smtp-Source: AGHT+IF0CBsOt7Qgqj1ORjsMePCn8z/Lp6AtC3pVYi28IKbuhseZj7dfMYhwnXl5elvyVwpXTWGA6njyn3NSQjMbJi4=
X-Received: by 2002:a17:907:b11:b0:ad2:242e:fe9d with SMTP id
 a640c23a62f3a-ad2242f01e9mr35364666b.10.1746771345067; Thu, 08 May 2025
 23:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306082615.174777-1-max.kellermann@ionos.com>
 <20250309151907.GA178120@mail.hallyn.com> <CAKPOu+_vTuZqsBLfRH+kyphiWAtRfWq=nKAcAYu=Wn2JBAkkYg@mail.gmail.com>
 <20250506132158.GA682102@mail.hallyn.com> <CAKPOu+9JCLVpJ-g_0WwLm5oy=9sq=c9rmoAJD6kNatpMZbbw9w@mail.gmail.com>
 <aB0sVcjFZaCVEirH@lei>
In-Reply-To: <aB0sVcjFZaCVEirH@lei>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Fri, 9 May 2025 08:15:33 +0200
X-Gm-Features: ATxdqUErNzFir_a_9Z4P_nbDzGXuxiEZBA8G10NYVaeJMVl3oDEmeduioWXwZGM
Message-ID: <CAKPOu+89=+SFk1hKGLheMtPq+K47E9FRCo1DBQo9zGMwW=Tr2w@mail.gmail.com>
Subject: Re: [PATCH] security/commoncap: don't assume "setid" if all ids are identical
To: sergeh@kernel.org
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Andy Lutomirski <luto@kernel.org>, paul@paul-moore.com, 
	jmorris@namei.org, kees@kernel.org, morgan@kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Eric Biederman <ebiederm@xmission.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 12:12=E2=80=AFAM <sergeh@kernel.org> wrote:
> ABI stability is about the most important thing to Linus, so yes, if
> documentation and code disagree, then we should fix the documentation,
> except in the case where the current behavior just really is wrong
> or insecure.

It is insecure indeed (can be abused for LD_PRELOAD
attacks):https://lore.kernel.org/lkml/CAKPOu+8+1uVrDJHwmHJd2d46-N6AwjR4_bbt=
oSJS+sx6J=3Drkjg@mail.gmail.com/
