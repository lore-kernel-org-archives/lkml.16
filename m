Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBF728980A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 22:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658749; cv=none; b=P6J4yA4PPozPxKByWuRLv0FelcpPTTf/9mK9Cjprp8FwgwpoDN24cDgya2AoDkaiY4s4lF8RFxZ7TpfrN9PgvF7RSAlWCp+Sf11sLZVyGjH7LUjm9VMxhlPDo5OVC7TDfMX1LxNwPT58AzcJMVp8yNnQhsSgwoXT+f43MUNJYFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658749; c=relaxed/simple;
	bh=4qznrIQd9heCD85pUFAjDNFme4Ro9HM6p9y3geLJfT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEQzPRqtThfLMZGD3mPmD1KSw+p1ravywgbGpvfHaViG3IX0AblY5Cl7vnNuR8UdWpIVKHmas6Ktttl2JKFzyGfrhznMrd64zbgi2QGisXFOrP6v/nLEG4sLul15XSPGw/p1qLMwb4OBH0NQPOs2SOJM+vO4WDllVVbfVURH1zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sugdTwtC; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sugdTwtC"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5fab85c582fso4478a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 15:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746658746; x=1747263546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qznrIQd9heCD85pUFAjDNFme4Ro9HM6p9y3geLJfT8=;
        b=sugdTwtCFYvGjVFdweSDSrE0kpQ09IL+Jip36nQTXjB0TdLKr/tZJIlN7jt8ukf2DY
         w5SO2yNGzy7Q4cVWIoqnlLt/nAwaSgVFsKijS2XZ8MFyTKTZvkSX5hm9qVvpmzJ6l38q
         tVrBuI13GAl/r2paHdv1EaskwPtkqV5GUMdcoitnQ7YNAH0+V/u9R7akJQwpV+dRHlwE
         qpeStstt3hwxwfGfcjBu+yAEOlRFfmAUcKDLNJzA06JHw7OGCF6GQM4Eyn+9huMvoL7d
         Ff1Va48luWQMwjfeOJJfDP3eCLkFedKXU72xcNr4DvlzCKuPO5PFfbcgbzl0gvlLFEWT
         aQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746658746; x=1747263546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qznrIQd9heCD85pUFAjDNFme4Ro9HM6p9y3geLJfT8=;
        b=qiufZNWB6gghf1/in+4cfmYxHj/Ytm0nuPXrhcQNAL9cHbC3MpE4jOZAv1fbi3mI5j
         klSIBdn0PN0aB2JgGWtZP81fjgmbxglKgBkIjiiWU9wisTpPhmkLZ5ia5P65pzyT5ZdU
         +4a9N7ovlXwfUlJ5WCky7Ja0sljoL1F+SQEISBSJPqXl/VIGxowyTDOBpJclsgKwYaG9
         E9tN1WqBA+vp/4kbpjuuwrAQ/WqhmZ0v1NYhGA24llOY1BGAz29BZN5zCROxlZYSAPCE
         /Oz/dnnHTOFRYQ2/GLW8a2a1zKqQj2zuHQE3NTNH13KbyXzmVwpk+sPKRBLAMYaudd1M
         IpOw==
X-Forwarded-Encrypted: i=1; AJvYcCXky46CGFm/wHXRhEjoTvoQ+PqSp3UwJNL6jHBR0KvzciR04b46fz0PohNsOmP3h7ycxV7BCSfOIXmqmxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGifeldubYBHmGpktEUPBbzGWJ/5jWhLyjVNA7S5LAelnp+dy/
	s2dTm/BP0JVJQeyT38YPff7qAGKcqpOMbcfM+mrrWDO9qp3NyJclKnT+SSjSPxhmYlFgb6MUuMR
	wRB6lNQXNrPpveT3lI1Bx2bikt1O3txjPdLWA
X-Gm-Gg: ASbGncsNL3JmWh47ptFEORhVuCkh/e/gy9pGoGbz9tSI4V3HlKnAx9DfP9Y3oB3xxNC
	Ckdd7A59hye5xjdGddVVZyZ1zYCqHwrXRsKRdv4/x5DnHGMAG1uVfh03vS4iu+WCA2WdwyzJEBm
	rQEmbxXRZSQ277MBrA/NU5GwCfaU6ac+dTpVM/3jX14np0hcrZJw==
X-Google-Smtp-Source: AGHT+IG5UM76A79+IbRtPyKJbFmyzXpMUKCWJ9hqDVsiMGpyhjFhDGSChhn6i9wySXk6B9CqU0BGHm8UgBUgVRm87Zg=
X-Received: by 2002:a05:6402:1a27:b0:5fb:ee5d:b5a2 with SMTP id
 4fb4d7f45d1cf-5fc6d4d522dmr15802a12.3.1746658746142; Wed, 07 May 2025
 15:59:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505212401.3379699-6-samitolvanen@google.com>
 <20250505212401.3379699-10-samitolvanen@google.com> <CAK7LNAS0Obe-ye1ba06EfZ+mgmc6ter+xMa+mKCw6aRM14L35Q@mail.gmail.com>
In-Reply-To: <CAK7LNAS0Obe-ye1ba06EfZ+mgmc6ter+xMa+mKCw6aRM14L35Q@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 7 May 2025 22:58:28 +0000
X-Gm-Features: ATxdqUH75sjGKquTsxZiAfvNfjaDztMLHXgmmKdCV2-0xtfGeIwBKHIdY6DuK4s
Message-ID: <CABCJKueJ2+TpUyJsLOuy3_Q324iOhmKm50vf4UvRot51Hbi87A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] Documentation/kbuild: Add new gendwarfksyms kABI rules
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Wed, May 7, 2025 at 12:28=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Hmm, renumbering is annoying.
>
> Maybe, better to stop managing section numbers?
>
> For example, see this commit
> 1a4c1c9df72ec266f94631edc59f9f2a9dc5aa8c

Agreed, that looks much better. I'll send v3 that drops the section numbers=
.

Sami
