Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A79D14C5B0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 23:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750116552; cv=none; b=lhWGsAXoujKJIGfT1NUOHWVSVakplPqXHDAwIgYxN3RPthw3XtPy9DbN1FJRO50ccHy/5zJM0mQw/5bFtdQyXml8MFaqEV1fYJZM7/h3QWfIZAPhpoB6BHdk28Y1bsfmsnqBpxxKx4YfOf9sEESMrZi52QKmScficDrx8ucf1qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750116552; c=relaxed/simple;
	bh=pt1V8iqg5W3Nwn2slxWeqlBq4NigilnhZOu7+2l5E5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5HPUYYKLRB/zbA7r85t2MJjFFD2vv8t+JFvI0S+j7CSS6H6gLCjTVbt++Mfza5eBTa1009cekcNCW4hl0dprw3YwJg53+E9kd20x0YZ8waE8xhEpkEihEUOQ/HSIugIEiPA/aGT1Lea2vKtsDQ2Bsf1SGe+Id+Ltj3eHFgWVnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=noa-labs.com; spf=pass smtp.mailfrom=noa-labs.com; dkim=pass (2048-bit key) header.d=noa-labs.com header.i=@noa-labs.com header.b=LRqBOQJu; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=noa-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noa-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noa-labs.com header.i=@noa-labs.com header.b="LRqBOQJu"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e7f04d798dso839785137.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noa-labs.com; s=google; t=1750116550; x=1750721350; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pt1V8iqg5W3Nwn2slxWeqlBq4NigilnhZOu7+2l5E5w=;
        b=LRqBOQJuF+azuImWAkedUYqunoQgwQClnbqiRWnznEUK6Qq6vKbhGXQ/5QY7srDzR5
         /vMb4vDuTl5cnuLot6dh3fxyW2ImbTs/TFltJJBHxTckvAN1u5NKNYZRT27h1HOIk0hc
         e4tYONTwMnAczWDN4t95zZFGAIpR2Wglrohj4uleGTnkJUBGY+KuxApK3hzBOPRHaikq
         cYwIxzS2JVPzZ9n/lmfPggtDPANqJxoATaaPtmWolxu0QnLN1VLmmA+kHytUqi6BfIjU
         UXBCeH66XVa+Mh9RWF+EyaOSfF8u4YRBYjM4N1ZQtPYw9paDBG7NZlbhGXHk/adZJAFH
         tFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750116550; x=1750721350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pt1V8iqg5W3Nwn2slxWeqlBq4NigilnhZOu7+2l5E5w=;
        b=tMuVizYOdeWxtFGtrbGPDzWGk76bBug/8wasdRjDa2jT/4uxAVB35+Nz/BAMZ0jkxt
         xjkc/nWK0Ybt2fHvKT5lvGjTwwVOnDVn/Al+GGXkGtnwyHCyDfdeGdRPEjM/bOc+tvRh
         ub19oZuJK0skbEP0iBg8WS+y3OK8cSFFIBRywBULZiUiCiasR19n4MfkBUH6Zig4Ttk+
         CkXgpkWfoAw7zoe2iugcNlLJlZj86E9rTIyGgs/tM0BzYpojlCprqWwANebukxQAQDpG
         GP8V7N177ns5pdx8iodYTQKJ4MVXbekpqfLd55RkyyE971kCB7U0igVOBVuSh6OxG106
         zZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGh7JAZ8Cko6qwnrR0plzGzIW/WUhH6rBoq48i7errhTupvx4I3f1Oz0MWSX41zbvfkSAcC4D7zxS37EA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCbc1G+LeGm63jk3pt2XZ+1YtarwYuMxmANR0C7WHD1e8aa1hE
	hSLwlX0N2M/8H7Hr9OcK9vCcFmv32SYxIJ72F4NsS70K5fhjGxPM4UzO78Ist4E/Kz6ktLIhgFb
	05g90CRGKkfoHizedwKeS9qW7+8riLc85qYFPfGchIA==
X-Gm-Gg: ASbGncuHH+E7f4gGJQw4S9Gd2Flz2B0VnFW10++QLs1bEt2g7jH5oDJ0TeAzCP698qC
	Yk2pctLQE2O2WbNfb1CFNEhxzsqQM0nN5ki5HdhUQ9rXoSj7EuJz1Ep28jTQXqbW+4penX272Yp
	xqXww/l22zF/tE4rh9DJscgHn3S0dItOSlAf58csPIZKpUZQ2f/va7aFAHS9RmuklTiMha46Rwc
	sVO
X-Google-Smtp-Source: AGHT+IHBHv6q7qIyuqejdMfh4iYw0qvSd3hPUeU3BQ/FnvSoKbSp0zH+8g8+j0XPpo2zKEj0aPmHcCJpQIqZz668Eto=
X-Received: by 2002:a05:6102:4a86:b0:4e7:b338:5352 with SMTP id
 ada2fe7eead31-4e7f616472dmr8082569137.10.1750116549964; Mon, 16 Jun 2025
 16:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603053120.3985-1-pavel@noa-labs.com> <CAMuHMdUyX-7Qh7RcdrFPmL++OSVFuUqXks6NArsssQvHX_Epog@mail.gmail.com>
In-Reply-To: <CAMuHMdUyX-7Qh7RcdrFPmL++OSVFuUqXks6NArsssQvHX_Epog@mail.gmail.com>
From: Pavel Nikulin <pavel@noa-labs.com>
Date: Tue, 17 Jun 2025 03:28:59 +0400
X-Gm-Features: AX0GCFuDjdCCze9u9HssaaWM8nT0-0M0IP9pgxCluDCnT23Xyvt-9Jkl8SIaxPI
Message-ID: <CAG-pW8HipspfiekB-h=Y6iObrskWzThExpkK2K-SxBxoXVTXSA@mail.gmail.com>
Subject: Re: [PATCH] Fonts: Adding all Terminus fronts from 12 to 32 in bold,
 and normal versions
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I have also made both the config name, and the CLI name to match the
existing 16x32 font, so the existing users will not even need to
update their kernel CLI parameters
