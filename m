Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC472171A1
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749862467; cv=none; b=eQMbX9el58q0AqIQiiA4MCS3a8nS8fG/bk2lenHOHVkEJbWm7+2n2ig+rULIPrREp9GPyUcrJ8aKOFLP5n+DP4axBarSeP13CmJx5ePyglqzbsMf+4TzjM/BO8LEwDkmDTY/E/G0IDt4B5hwvs8a/hIJ/dChDJDeX211JFJodiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749862467; c=relaxed/simple;
	bh=dbg3c1BYh2RqngzJb5eNWzqDUU5+7bNmKWGAXK29fkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ejp33bup16FDIhAV6A+nt96ICTQnXjpDeolktiKsuPkAkhFeM565wKHdLP/n7RCkHq6IxMAOtoFsrAeyNy6AGVpb23mLmJUq4hm+DMKBTcvRHjWjl8+ETegRR9Zo1fJMQk+s4Nw7HF1rZxS5dFs9N+xXKbO/28dsqm+tlm4xOU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WezgbJk0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WezgbJk0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235ca5eba8cso66255ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749862465; x=1750467265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbg3c1BYh2RqngzJb5eNWzqDUU5+7bNmKWGAXK29fkM=;
        b=WezgbJk0dtNUYgx24URetCr6EXq91Ga38mytsbVMSvQi3xAQnTtIvKvc1AjVq1GNEL
         UodO33phXhFGQouhEwYlWk2BhgrbOBJMRgN9mxMdKZ97o49a0IQIJpAv4MDo5Hk46PgH
         eAkkILbbUz1J1ezLysvMlv5ElzF6WaRVn4Ub9EiGorspTF/vytjkNvFG/RFPH4a/dRbR
         OTs+O4QmXqsqTPt05pM5jedM8u/uvv1p79t9RGpaxjhHEbyUgIcA7i9Dx+dt28KzMK4f
         MD9FQo+ZG+tOoahB+S1zTfA+8g/5vGIJ7v678WlCNtMvYytRYSO5WRzvrbX1mEyNiEsE
         P+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749862465; x=1750467265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbg3c1BYh2RqngzJb5eNWzqDUU5+7bNmKWGAXK29fkM=;
        b=G0DqjIaYb3UhI7GNUPDn3SI5WBWoLD7aRJINkxfUsXOQc0Nhxy4zTsH/OuMlLKRPqE
         C3YQhmkfoU4EbBNoJxoWtVO4KrE/xRqA1uK7hEt/pxoJcZikrZswCe2TG5Dza15WjL0c
         dq4Is7CFnG+BLzpwKNG+SeLyyYGQauwKi3eelWvydZFN3lbxDYLqOC38E2vSzeYqk4+3
         PDmt66+297hWcE2eSLl8tX2KpDn7542V354Tlh8hPO08hkb8mxyLwZ3HT7Vz9ie86rhK
         2umekmaZmMFXv+7Qp7vgmWHQQH2EbEFCGyVz4im7aZA3ATzwJ7O6JkC88cRh/fW6qQSz
         Scjw==
X-Forwarded-Encrypted: i=1; AJvYcCVLPBZGS2Sd8OnZbHDDUcapN3MvrYZYMCNOtpeNOQ4KCPrYcenL3eW+4APOY7XepZQEuwVUwimHNd3SbdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6DbbuYak8yOuJsf2PfV4pfFPHTKnmfiDzIJo8me0z0+XSQGYK
	VA0/M5Pfu2t9p6AvaHaLbAH/TuTuxjSAAiRo2MaonC7trpQs3K9pKNtFu2zsG+B70EN8BdCHFW4
	/IlzIAjkTq5lbkjMp/5FW3HZ0A6NLKtniWSGJbJYD
X-Gm-Gg: ASbGnctqOwXs0nfOwAHbUa/F+NAYz+lxtyQK3YfieFYWwnNL9x52JcG28LHu6anexO8
	9185TKsCeuzVZ5xYEib2iSic4Pfj8I57ivPIrPN7XLxirapFAtk0XyWbLFC2g4rKLzAoebU3wYC
	NmRcCn+/eHrXjDNxa3DuL4D15A3oHZOTEz/JpT0eNRlMO175y9BeI=
X-Google-Smtp-Source: AGHT+IF5JrVHVbiN/102jVBcJgf8pP7Edb6rcI75OIdKcC6Rl/eoRwukBdcUmUcOznU3bQiIsNg7MVhxwBLn+Nvp0Wc=
X-Received: by 2002:a17:903:1107:b0:234:afcf:d9de with SMTP id
 d9443c01a7336-2366f01c6f8mr325645ad.29.1749862464820; Fri, 13 Jun 2025
 17:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609154926.1237033-2-samitolvanen@google.com> <dec42b04-b76f-4a2e-b060-9ac999fe1462@suse.com>
In-Reply-To: <dec42b04-b76f-4a2e-b060-9ac999fe1462@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 13 Jun 2025 17:53:47 -0700
X-Gm-Features: AX0GCFvhflmbUjvvF_yAMLbU4RfChKb2aHfDzBXIK7IMhzB8uMQ9kdWUKlDyi7o
Message-ID: <CABCJKuctMAeD0HjnH5D8ji-g1ZKoev-u6ni-UiDL3qtQhpfbZA@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: Fix structure type overrides
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Fri, Jun 13, 2025 at 12:52=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> w=
rote:
>
> Nit: This code was the only user of __cache_was_expanded() and
> __cache_mark_expanded(). It is now possible to merge
> __cache_was_expanded() into cache_was_expanded() and
> __cache_mark_expanded() into cache_mark_expanded().

Nice catch. I'll send v2 with these dropped.

> Looks ok to me otherwise, feel free to add:
>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

Thanks!

Sami
