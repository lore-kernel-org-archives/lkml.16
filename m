Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5196B248F64
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611090; cv=none; b=lD9i3H9JiGaRkFMl81iLlZsq8puBz1P0loMyfTpgOfJa00P+XzZXM1RpXJ4GUvRrttPhoxgjmPvz2Okh5ikCggRoW8TRLYPp0QNGEKg5VFxv4Y65qgOD6rSc60OHXPv7OhVbY3PrbQpmvam0pAUdbZhbA+j2EdTI62sz51h3TaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611090; c=relaxed/simple;
	bh=vAlKMziY97tQDFNI6wEVL+T7PwCEQ8z9jOG1JX0Q9Lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fR1uPVdf33C+Rtx0bL+y2uFR9po45o2L/AuERoqLRFGqkZ9KvO/UpAvB0HmaYwrbtBTyTNdjLo6hCpFBV/HYC17eRLuViu30XxLfjNki5AQGWbEA8F30VuGcfGmKZGOLK+IiVMyBCteaFi0XNDzd3erQtDJ2O6b1HZ2VHMrPjJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ywvWQp6I; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ywvWQp6I"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b350704f506so532699a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751611088; x=1752215888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAlKMziY97tQDFNI6wEVL+T7PwCEQ8z9jOG1JX0Q9Lk=;
        b=ywvWQp6IpfBP/i9GRXd82KuAojHzn1K8zy9RQuUZb5aEbFb4glbjGxjXm9OvZ4Iqgv
         7KMC38OiOqbcthAXKfCn1xNriXMD1x5BWPKBbPZrSVFNJOYgJG+rPkHuuuEem4QtXvWt
         YLNaNjc4XVFDnGe52VTIA6fjQ6Yn78zCTmLYeCsKeOH6uavYITYmJqJtLQ5UpVBpdpZ8
         +IqEXnKyCk7DXQ3Geu5+g3E31sGzT78uwBfiX4QBIkACVTFbR1VIqR4RQmYJ9xJfHBxR
         U883sEWfKMA84tLAJoL9q40b92jaRt9GZVLzKiQQzEHyQQvjAlwFXqB6GODg6dTlqFIp
         zB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611088; x=1752215888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAlKMziY97tQDFNI6wEVL+T7PwCEQ8z9jOG1JX0Q9Lk=;
        b=FQ7o9fCO9oV0E2vUOTbIKe0J4j5KP3aWh6NlsBd80xi0dxMKGz8d3uBfsuiH04nmfN
         WIPzUV1S/np3ncsGUCYsvNLX0kvVEybOYUJjnBs6MY8wRu4GHZo1KMo4/lWFZZAS97tm
         RKPMpXIPGsO5F6dkm9S/JHHMPp/26Awk5eGfLfk8E9aWeqanFxr+s19x07zxamlPFUey
         uf3UKG4zWR1k3JfMppCdutK4gwMqIHJxoR55Sw8f8iIdVlkOYy1D8R9GZLfqLJHLj0w0
         cJrsneHXo9H1ZNDF6MzM12+qEBYFuvDpBcviuRjE0/msdT6Dg9SIottbVgy4airpKQPL
         hYDg==
X-Gm-Message-State: AOJu0Yw4GOpnJ0Z7NTb6csTWyXjTc6Cdbxdl0YpEdZwi3Ae3VUI05F5r
	qiGGts2kYkmR14SnWHpCWo5WlbGur5yVneYLcUAQt+Mfvnu1kDQVFHw9eWOWANvTUT1TLBcZHsS
	C8+OqKoszBev9hraSTLUPN5N/eve65SLCnWe7TQQU
X-Gm-Gg: ASbGncvYPF3CZKogELMCPJv3d6QhZKrsCItvHfPPJaGSNF7QbN14hz/v5xsNpez9RIK
	RhJ/Dwt/YhZ9GFBsplNvLM/LDC7H41GUFfQUf904H3YfXVssJlcv8+dVm7o64RF0SNKOJyLssYK
	P9EWK4of4CZhBfVajr/0AGXeCJfdnGq05wF+gDV8m1vH+C0XTiSYSLRarPtjGwWf0e5TKXLw/D9
	w==
X-Google-Smtp-Source: AGHT+IFMCdF8tTp7y1tnqm5p+NZdaM89rR7Ng9JYCVKhOuaHRvzY9V4rVI8evYgKl1FApkbd8ERvKt4XsGHdXsQz8hg=
X-Received: by 2002:a17:90a:c2d0:b0:30e:6a9d:d78b with SMTP id
 98e67ed59e1d1-31aab8cc9d7mr2586494a91.12.1751611088395; Thu, 03 Jul 2025
 23:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703222314.309967-1-aleksandr.mikhalitsyn@canonical.com> <20250703222314.309967-7-aleksandr.mikhalitsyn@canonical.com>
In-Reply-To: <20250703222314.309967-7-aleksandr.mikhalitsyn@canonical.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 3 Jul 2025 23:37:56 -0700
X-Gm-Features: Ac12FXyjUGL9req4-D1NwQM5jn8O2JvTQBZh9oyXfeZy7QyRI7yyeuci7HH_Aj8
Message-ID: <CAAVpQUDn6vjd2SpwZj8v9KM=yzmC6ZjB1sf3xO4fc=sr4s367g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 6/7] af_unix: enable handing out pidfds for
 reaped tasks in SCM_PIDFD
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Lennart Poettering <mzxreary@0pointer.de>, 
	Luca Boccassi <bluca@debian.org>, David Rheinsberg <david@readahead.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 3:24=E2=80=AFPM Alexander Mikhalitsyn
<aleksandr.mikhalitsyn@canonical.com> wrote:
>
> Now everything is ready to pass PIDFD_STALE to pidfd_prepare().
> This will allow opening pidfd for reaped tasks.
>
> Cc: linux-kernel@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Willem de Bruijn <willemb@google.com>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Cc: Lennart Poettering <mzxreary@0pointer.de>
> Cc: Luca Boccassi <bluca@debian.org>
> Cc: David Rheinsberg <david@readahead.eu>
> Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com=
>
> Reviewed-by: Christian Brauner <brauner@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Overall looks good, thanks!
