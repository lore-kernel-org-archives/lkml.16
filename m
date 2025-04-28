Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C99519343B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745855318; cv=none; b=H/GWXPgs371YcCxy/XD83cOy7m951zExDHqWyc041+7pOYjqmBwnvDKolh9NMhgQ3Zpt99CpYP8QvjDNSTk2hbkenPvm9YeGyJiu3e9GtXk0Hw6y0uu9q58F8DgNJ4YDdsBput/zAgviM67qznrTcvNPTWYOY+5wnyilCLd0Iio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745855318; c=relaxed/simple;
	bh=Oc2BsjsMwgLoD5XEewehoYbq0a/17WumRr5giysjpjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hq7AHm9aAWDGevVT8ShDY3j9G/Gsh8FKhkVpBsYsci2DUBpA/wY16TRWwsiyvOIGLtvCtPQTpafSJSd4a5IHBl/nuRaDW6vCYLy4iDEio/SsgZFxp9p/di8wcZE5Gu+W6FDjd2CGcY/frQXjCOhVXNJdcvQTfgQ4drX62EQ1wpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cwEMt0pW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cwEMt0pW"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf848528aso35511435e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745855315; x=1746460115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oc2BsjsMwgLoD5XEewehoYbq0a/17WumRr5giysjpjI=;
        b=cwEMt0pWCifC40wIPfaD3r5GT8gFGn+be4Ck8tRTeLG0vYhP/CLhook+cYWDXavvT4
         JxH5uTqBxe8xApNNIouQ8gIKHISaY1HZiDmX7bjIiQjsGe7tQFrYlQiWKT0v0NbQzLEN
         RJuIvkjK4IL3045HvRGcnYmbZhwMhYnEFhfp/nbluEFBQfAUTsfNmCUGxRmmZhWoe0ig
         oWXEpuy9Z3xX62ZfH4iygRz6UUrZhE9xwTLqRGVrGd/IG+RsYs0jd/PGQK1HyOsYSgCg
         xYLuqhvZczVXfgYuD2/0rQM7wGrjP/crwhAJzCZP1W4bgR35EH+ipFCCajG0c2RPt3tS
         anGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855315; x=1746460115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oc2BsjsMwgLoD5XEewehoYbq0a/17WumRr5giysjpjI=;
        b=QmP+dbHL/G2I6I62eoTtzvD+cqGZdpRQ04vjxRULT+6zcTryubk15KOI6VW9FrFX+H
         9Q9ll6vwqcCp6s8FDHLRcbHc3n1vw3LD0jXdSTjz6NlC0NdfJQqkZBjKdtZOorebWG4B
         bmySqSnR22ev4Bm9Ba74SJiILKpGoc/N5+Mv7O/DGkaJCA3WzJY98S1QkrsHx0VBWghO
         p85i5BoAJFNsauL82WGSb6PqnxRvSFwsdpcJPDzcFDYWSsvLe8hJw9hqFoYZ2++TTYfO
         BipT6gkOb+N9wblhX4MpgxX7azrhmA/X3PRS8QdK/x6nh/GyoK6xZMT5zFkTfBLbi4Ad
         mL0g==
X-Forwarded-Encrypted: i=1; AJvYcCXTo4hp1fV91Ae+8Zg1XUC7YKtxB6phjh0ojwiVaSgFqN5VQn7v3G3LcOUzvpH7iCS8G6tUkfmOtA/KNLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYDt76rC1zN46y0o8nGEF+IYwGeI/fSDi9OSSgGf3RfQIwWwui
	koF0tLU1Oors6bJnq/C2aE76VO/OPokP0WgMpzmJwV+KCluP36tNxvIh/a49yAHcZfOsis0GvfY
	AZYqxzbJWKsq0pep5+Wr+oozy83jQNrQJ2y4n
X-Gm-Gg: ASbGncvjdfCaSKQG+mdJ1Si/NclrjGUatBQfEyUbMnxE/FP7K+Vpgp0FPSCOHqavxxt
	SVrIsJzcnSzyciv3gpDGrp2MshhjKFRS99zD4DfC3QIZ90vlAE5HdSoOrdRt/E/u/lk6AjdvFal
	3x15gE5iqsEGiJH/2q0zaApvzm3hFBLUyl1SnNsiC4lyUdKXG7tZ8=
X-Google-Smtp-Source: AGHT+IEBIX0s48PYMYc7ZAlkpJ51AqlhXnnrtXNl3j1AB6qplVBQOPQcuk1wi9rMT4KwloL8RHijaKT7JBlAdq1V32g=
X-Received: by 2002:a05:600c:3b0d:b0:43c:f332:7038 with SMTP id
 5b1f17b1804b1-440a669994dmr95026445e9.21.1745855314637; Mon, 28 Apr 2025
 08:48:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426024810.3876884-1-bleung@chromium.org>
In-Reply-To: <20250426024810.3876884-1-bleung@chromium.org>
From: Jameson Thies <jthies@google.com>
Date: Mon, 28 Apr 2025 08:48:22 -0700
X-Gm-Features: ATxdqUGLnoEyfsnKxMr20maG-7vwqQ4ey0dYeEd5XwxkmwS8PcuhP05zb5tlI_Y
Message-ID: <CAMFSARdg=p71wWoUT4G8E87bLNvxQ-JhaLbeAL6D0aUfAs-jUg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Set Pin Assignment E in
 DP PORT VDO
To: Benson Leung <bleung@chromium.org>
Cc: abhishekpandit@chromium.org, akuchynski@chromium.org, tzungbi@kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	sukoo@google.com, bleung@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 7:48=E2=80=AFPM Benson Leung <bleung@chromium.org> =
wrote:
>
> Pin C and D are used on C-to-C cable applications including docks,
> and for USB-C adapters that convert from DP over USB-C to other
> video standards.
>
> Pin Assignment E is intended to be used with adapter from USB-C to DP
> plugs or receptacles.
>
> All Chromebook USB-C DFPs support DisplayPort Alternate Mode as the DP
> Source with support for all 3 pin assignments. Pin Assignment E is requir=
ed
> in order to support if the user attaches a Pin E C-to-DP cable.
>
> Without this, the displayport.c alt mode driver will error out of
> dp_altmode_probe with an -ENODEV, as it cannot find a compatible matching
> pin assignment between the DFP_D and UFP_D.
>
> Signed-off-by: Benson Leung <bleung@chromium.org>

Reviewed-by: Jameson Thies <jthies@google.com>
