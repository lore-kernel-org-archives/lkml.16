Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD47328EA4C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 18:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748456746; cv=none; b=EVQUUIJbMkgoRykKUVxKYuYkwWnViIQw829HwnSn2PfTga1By3tUuoIEzbBrE+YYGWac3iUg/aHSfUjAt9Ga/qMegHleIykyLY6O06T6lwaahal8hhTJ/jOM6NU3a97FLpnITJNFhTvNomqbVz2L8jRosoO9yF3HNPGxigIIpWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748456746; c=relaxed/simple;
	bh=AcwcyGpDrfErPsyWm8xAfFlcYZSyGNfZutLD4QklKxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7TAzuNMU6hWbL9yW2WDhAwgHeCWPbKWgW/q3rs0v5mcoMITJMok7DIs8IYpmHwZdy57Sar+rArfQyORGVMqLA0zQv4qPIOslU5cBYAwH+rtiVm4hCgcZxl5fbcmrU+cY6joxWK7/lyokEgB/R0Yq8nz6afT29pzRtQg65SCEjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=bcdf9GzU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="bcdf9GzU"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2322d8316f6so234825ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1748456743; x=1749061543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcwcyGpDrfErPsyWm8xAfFlcYZSyGNfZutLD4QklKxk=;
        b=bcdf9GzUH/qkvrQSKiVwX3UGs1vEkrTQECdy0fa2oyHOgsyjRl9EharQdf1hrOxT5S
         aOgqVAhiFy38epz8gLWuFNKnZVI87uDMvm2Czhz4ACUQFWufFrAm7cNj4iMzmIstrJdR
         6SPaI1NtnmZ5amQbOuuBLlGr90UEvwq/Ox33pfIIwfce/Fa/0xkO7KIziJEhtVGxloz8
         sZDwmrFOgsPCuqm2GwgExxbVBxsf/lhbSYNJXoaAdlIhhETa4mvvzVv2CZCp95SE3KoU
         JrNM1aTQQpngAB/1d1KJdpyUyAeq7PyX/U8XqoPUhJwHvShnK5vz4AEn0LIcbBA8gBB2
         +9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748456743; x=1749061543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcwcyGpDrfErPsyWm8xAfFlcYZSyGNfZutLD4QklKxk=;
        b=H2/h9qYgIK5inm9Q0cDok8xGc8He9SXboP9J5BeEuOVmnFYcfEKo0ntWZ6AVci93y1
         ruYADKgXlzdzchfymvph89pcNmcS6adc1hPa4QEUfuOsmhmzlbeFY8RsIQtCeGTEKiZp
         mutoD00sy1HEdNArlTOh0OZnqag+JKv7omaIzFbNG7sWSTfwuh2DPdmD6Q3qPHF9o7d2
         b306p/71h2GwX17PUHZoEeVLEf41MbhH181/uTEqctKrTBZSl6MfogDbHKF3xGhHv/9W
         C64EzQHJBYTy9odQIrdt/CtnkCkM8UC7BjqlcYez5sLmVxIMQtcZTgEGTMuGw3xKVKV2
         9BvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHd+acW7tyKKmlxqVzJMYmhNHW/QFXanDeu4jnRJfq/vshZhUT4eGRQdPqJdDuPI/ViyaTmO3b9AHwEvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbeJ7N+OsXREiDzvd+03I6TcO8FtuuDBsKYXv1bb5EFzQrwHc4
	z2NjQ8L/YyuXBtg8+ddiI3HGgtLzay7aTpyVK5aNVYyIAEg5r9ubMAO9r88T9c73Him2R0YC7oG
	UqhStltv0RW9UKKuexjbSAMm44aM23VI5HRWq0a6/Sw==
X-Gm-Gg: ASbGncteOJKGDwouIUkXzFJvT5RImY8989scKzJbAqLHyxw8tUo5U4QOF9SJOTZameM
	RiKVcSuObqp11asL6B5cuJoHBUJ5Mqz68uXRN0nZO+vVxyA3jXNac/1KGHJKD0i8gUTGks4ni9x
	n6uqJj82HXG1x623ouwJgHvvIKi0O9mNEL
X-Google-Smtp-Source: AGHT+IEqPgJEvwuKzLiSxyyIQ81so3lXBN15LCeb6qSM07Ix99PnGXOOlMeJsGGG1A/YckjG2+wZSDm+qfUtj+1ifm4=
X-Received: by 2002:a17:903:1b6d:b0:21b:b115:1dd9 with SMTP id
 d9443c01a7336-23414f53285mr102307925ad.5.1748456742958; Wed, 28 May 2025
 11:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527-ublk_task_per_io-v7-0-cbdbaf283baa@purestorage.com> <20250527-ublk_task_per_io-v7-8-cbdbaf283baa@purestorage.com>
In-Reply-To: <20250527-ublk_task_per_io-v7-8-cbdbaf283baa@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 28 May 2025 11:25:31 -0700
X-Gm-Features: AX0GCFtwLbawvnl7mK2nPLXhDZ3ch13VYeZVtizo1aZXU9QSxG4dusWwjli_jhE
Message-ID: <CADUfDZpjFv9Vo1H2rzeCyYo2nsnP_k1prkTCQqTtpk1YjL==zg@mail.gmail.com>
Subject: Re: [PATCH v7 8/8] Documentation: ublk: document UBLK_F_PER_IO_DAEMON
To: Uday Shankar <ushankar@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 4:01=E2=80=AFPM Uday Shankar <ushankar@purestorage.=
com> wrote:
>
> Explain the restrictions imposed on ublk servers in two cases:
> 1. When UBLK_F_PER_IO_DAEMON is set (current ublk_drv)
> 2. When UBLK_F_PER_IO_DAEMON is not set (legacy)
>
> Remove most references to per-queue daemons, as the new
> UBLK_F_PER_IO_DAEMON feature renders that concept obsolete.
>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>

Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>
