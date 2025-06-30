Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905331D63DD
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 18:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751309961; cv=none; b=qq5taep2R6MtlXYMlxv4BTuQqpH34+iFnIQugXa2IGMpqb4oZjt/DBW+RE/nXZ6xGp+IRSWb58Ins01JuSgSKNUcm6paUaKQ5Ngip6hGSRcpC4TtFCeELENL5csj2ATp3HIz49fsgH7U8eqxjmzaUxoHDnn/WPfUpIoR6k7t7sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751309961; c=relaxed/simple;
	bh=jiu0+hMEGOVBbPvfArelw7aUGG6y6JNsAsa0sxGu4qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uj9AGpQVW5VoaQDejvaYX5f38bNIlz8NDCMVqG44PZ0HapurYB6d9SXVucfFIaFr8xvSjC5lgpdmDT8H307S1m22wm5WV6OXRvXBWLe187DcQRtDwvmvchnJvhoSZfKQQjSY53J2v3G9Y8R0jvTdBhwsueoqWdrxMxyUx+Uap1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vNcGMPnf; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vNcGMPnf"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-31329098ae8so4055245a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751309959; x=1751914759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiu0+hMEGOVBbPvfArelw7aUGG6y6JNsAsa0sxGu4qE=;
        b=vNcGMPnffJnhjm3fRDaHSDYxYoAWrEo4yKxYmFJZcAf5fUELU2C7u1j19aCQwAVSV4
         BNKQ5zkh9mKdJshesoPr4cCJLL+IB4E8Vo/Qx+PfHDa7zChlA6VZ/0rjGboggA/J9uwT
         IvwkUA2cj4gNcjFjYHCLNx6v9W4QUfE5AqUJj1BT2eZERyoP+5oKV7wyIGTYDpOkiAq7
         f6ogmf35XFKqiSDESLbsOJ4jI/sWAYcZ9la8ycxdQnOckFJVeGFJ3k4A5tAOipYsXAV/
         jhwvo/GfFDqNn2bOGzEYFFj16nIDWW21rdIAYBdx7HtPLuhUjWiW4sryUU9dWf7RwZLU
         V+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751309959; x=1751914759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiu0+hMEGOVBbPvfArelw7aUGG6y6JNsAsa0sxGu4qE=;
        b=dw6n3oi+hqlLLK4fA1PN1AowfVdnafu6mFXz5/kZtwiFolodYPChNzO3cOl5A7jyuP
         dAE9mvlU1RvqYNAdDdQpg97P1EEi2kYlT8wS/QlrA4wm7sYvmGnC7QOCKKYWGO5b9qkf
         s045cz1azOrtslA/So814RK71B3LZ2vcmWCxl7Rh/9yIUD4bNoteUAP1pKz1zicteh39
         7o8IqlHp8+WwCH5o9C1e8soGKtZIMk1m+Mrb8vLIjBQMki0mTWEATKGo6zBZqG/3zemS
         eZT7eLwl/DXbnjzM7DEaThuLwCYy6/lLxwuB3PkdmxgeFx5c7qNlLydso7OGnE6LJgBH
         PyGg==
X-Gm-Message-State: AOJu0Yz4hNrMygf2eafFUJlU3USClhUxviPy5qqE+Bhxy7LxN7dnomg6
	MRei5XF2DO0EXihXqc7vKXrAFBZJdfaOBQmvDFFMKBRd29rZ5VtM192L5/joxw7THFr9SQkYt/h
	8fMqPsuj6E81b4y9LaybNrhuzr0Ne9R4caWH/KPzACFOnkydzLp3nbHz0lGKeMw==
X-Gm-Gg: ASbGncvebYlnLjXPtqgtatr+RayTRV89nFa/ggjmbXaZcnB1Y4l7HdBrCQ0QDoPf7u0
	eiiwCxBT+AKjDN1BuvxQZ8/Z05TfNTyuoSl/2ivjvPc6m8eziVI3gdAYEt0VkYbyHbJsTkkMK88
	Ze2BH1bQxuZ9PyzJkOpp0/zR+Lr2htbkfRU42neEcnFNh3daCKpXeC+pVdQKkEjqIt3yslNNmKr
	w==
X-Google-Smtp-Source: AGHT+IEHeRuWilp8GcPNmBTSkqpOEL9X9afdNRP8SzPgcgvaVfsEoIRowf7+dqoEoXi5E8+rYSgYulvRYGYg8UIREt4=
X-Received: by 2002:a17:90b:2e4a:b0:2fa:2133:bc87 with SMTP id
 98e67ed59e1d1-31939ad7d19mr832328a91.6.1751309958529; Mon, 30 Jun 2025
 11:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629214449.14462-1-aleksandr.mikhalitsyn@canonical.com> <20250629214449.14462-3-aleksandr.mikhalitsyn@canonical.com>
In-Reply-To: <20250629214449.14462-3-aleksandr.mikhalitsyn@canonical.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 30 Jun 2025 11:59:06 -0700
X-Gm-Features: Ac12FXx8h6qFKS4tZCgWPmiRsjQA12jiJH52womORS_f6_CKqpkkAAOXlUIFp3c
Message-ID: <CAAVpQUAOwF5a63hZ6hK9ffLixpYN18PzaGjquNgNnG5++iNhqA@mail.gmail.com>
Subject: Re: [RESEND PATCH net-next 2/6] af_unix: introduce unix_skb_to_scm helper
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, 
	Lennart Poettering <mzxreary@0pointer.de>, Luca Boccassi <bluca@debian.org>, 
	David Rheinsberg <david@readahead.eu>, Kuniyuki Iwashima <kuniyu@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 2:45=E2=80=AFPM Alexander Mikhalitsyn
<aleksandr.mikhalitsyn@canonical.com> wrote:
>
> Instead of open-coding let's consolidate this logic in a separate
> helper. This will simplify further changes.
>
> Cc: linux-kernel@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Cc: Lennart Poettering <mzxreary@0pointer.de>
> Cc: Luca Boccassi <bluca@debian.org>
> Cc: David Rheinsberg <david@readahead.eu>
> Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com=
>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
