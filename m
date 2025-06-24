Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B2E29994C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773742; cv=none; b=K6GuoQaOYwuxlZY9MNapFkxgG8jyYJ62aoFJ3nXQtYAJRVurI32rY5qp+KDEBWiT7wkLJ8FCpKuETfSW00YPVOfGSPXjnNYoizhWyz+3DOSgt+fNFE27LDezqqF8r9KcUw/yqw2l/DQsFN6RO5xn5FBbsIracw6DN5fpJGXJrOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773742; c=relaxed/simple;
	bh=V4OKSfi2JlQP9gCOB1g33RXWpet7pQAnqDSDRV/9A84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiQJ4xzhXrlkVRmtZrr1JGJK5+T3Gp/ztkiheRFHBVcfruIY/1TYsfkUQwsIZXKf3AgGa94eY8nIX03BVI3maHeJZMEBo9mO0KG48yGBvEBqAGC1UtAZDXvQA989Jg5rOBFp2hPGPAjsLKzTHyUri7XwnYcK6RBJnmrU+RGwc44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPELsXvK; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPELsXvK"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-adb2e9fd208so84100466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773739; x=1751378539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4OKSfi2JlQP9gCOB1g33RXWpet7pQAnqDSDRV/9A84=;
        b=TPELsXvK1GxmowqY9kYJD1TScs2yH5kEuUISU5PdpdFkYuwZQjEyRLS9K1SCfIO1F0
         /A2urGl8EGsO3JsXP4W2FLRQMgBLgifH0wFrDxNAwF0obxPaBYjoHCZKMQhDDHDGFXYE
         FCDO4Cvn9w/LScXn3AgpaMdbKELfImriD2m5zmqUVk3fthjR17d1BWs8yHhnTxGXCnkF
         HcmmxI6R9A7CrKTzpHwU1m4Dzl0vrxflOlD2eoiM3rC0WsIu5lgabZfQeiOAHdlYwi88
         iNXEP9h8Ewdc30DwdwFo3WE0Ld1C1zUjPr+2+l8vdZIJtRtfJKw+uRA+s7q0TXVH9Fy8
         gQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773739; x=1751378539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4OKSfi2JlQP9gCOB1g33RXWpet7pQAnqDSDRV/9A84=;
        b=dPjM2npArOLaYv+ES+mONk20NfC9NuyF74eeder14WMq5LmeQzfCMQDQLzgkzXCbye
         6xeW/c0sZx08rDYtqUk0fmbKFsHB4DsdXNX4cTsb7rNk1EZ827/ATusrwNl5kdV0AmZg
         CUC+5Xgy0ztLh3wZ0NRzpFkS4jR1F7/pB110tkspKImGEjSHyhfYmX1rDTnu/WNwAT73
         fSqFxaRiu5uyuSAVkGIhrarSz0wx3lsJoEXWduedR5bFAJcTUTdPG8sPeol4DKtwhbJn
         hCo856FfZlqwa6yY85obkxueuQv5KwCmGD+U6X/eHr7Fs5OKW6KQkLITnoxQVYz0r7hy
         b7+A==
X-Forwarded-Encrypted: i=1; AJvYcCV+3tL2312tuo0IprRu7UtVQ1wv7AuClMaLOg3LJnTzfBWYdpjBeZ4c1QL5IrsKGVCDLzj3XY8kwgAfWlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY7TkuSJWbGntqpGRkeGG5XdjAjaz3T8GvZVLRbqgXtDmrdTqF
	i/TCqyRFzwrz7Pn0DCPVmwDa8oSzMKUDV6vzntGM1fPn1UUi2WO28DpeOrocq1FIwUiKDyxYtyR
	YOb61vV1jjTwfZ/VInNF+U9HmHKblblg=
X-Gm-Gg: ASbGncsUXrQ7XU/OU+jCLIUkW+9ZRudDEGP73VlqZWXxqlykqpwFYS3FOU2lOQ0Qnh0
	pwEVwXSlGmkawDz1/7+pv51G63AX+EnYLl//RyBrzXDBRe/xuwGhkeCHdZURlu0m3bZcQgOI6bn
	+oRuL4mpqMiDrBQwLKwl2JsgnsISqpnSIER6dAaWaqvuQ=
X-Google-Smtp-Source: AGHT+IHvYdE39EACJnF9L4Sa6mOr/QWcWxmXCZeLqDnLCkc5ExYvVVhUmUjlf0Ams2hNBk7cPyvbicFqdWi87MZP4js=
X-Received: by 2002:a17:907:da16:b0:adb:41e4:8c73 with SMTP id
 a640c23a62f3a-ae057bbd05fmr1741628466b.55.1750773738471; Tue, 24 Jun 2025
 07:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250510125948.2383778-1-xavier_qy@163.com> <99a0a2c8-d98e-4c81-9207-c55c72c00872@arm.com>
 <CAEmg6AUBf1wVjXSoqBseWffLbixUV7U-nY52ScKCeNXwrkBcqg@mail.gmail.com>
 <225fd9dd-2b97-4ec6-a9a6-fe148c4b901e@arm.com> <CAEmg6AW0ZoKf_8XK7EjA2sE6HEL3Tneg7-CKakTNdgZrd585Ng@mail.gmail.com>
 <20250622153410.1f74305615cbd089fcf943bb@linux-foundation.org>
In-Reply-To: <20250622153410.1f74305615cbd089fcf943bb@linux-foundation.org>
From: Xavier Xia <xavier.qyxia@gmail.com>
Date: Tue, 24 Jun 2025 22:02:07 +0800
X-Gm-Features: AX0GCFv3xGvkBtHxkXsYG0Ch3iAgAYZu6lie4hi2FnohKkQq5kO8wLkkg-uO8OI
Message-ID: <CAEmg6AXjb08+6f0YQGi=p72PWJJWmpGNeXU5Nm5rjr3RRMbgug@mail.gmail.com>
Subject: Re: [PATCH v6] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Xavier Xia <xavier_qy@163.com>, 
	21cnbao@gmail.com, dev.jain@arm.com, ioworker0@gmail.com, 
	catalin.marinas@arm.com, david@redhat.com, gshan@redhat.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	willy@infradead.org, ziy@nvidia.com, Barry Song <baohua@kernel.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 6:34=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 20 Jun 2025 15:56:55 +0800 Xavier Xia <xavier.qyxia@gmail.com> wr=
ote:
>
> > May I follow up: Does this patch require any further changes? Is it
> > now meeting the merging criteria?
>
> I think a refresh/retest/resend would be best at this time please, help
> people take a fresh look at it.

Okay, I'll try sending a new version. Thank you for the reminder.

--

Thanks,
Xavier
