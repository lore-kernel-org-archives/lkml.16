Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB7F1B87C9
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 20:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747169983; cv=none; b=KD9N64fJ0gn0x9jKWjvzYe7Ox2zAyeAAiM1ARiL8jfcFEeJx+I2sStDLZDCtRPfPj3oJabdNoMEKEOaH3xB+3QDOqWX57GDxWfMBMHFvqzbyro83drr+qmdM9sVU1xNP9WWvdMY+Gv0m5/gJP2EldK1n9sMd+HxJFzSYQouHJRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747169983; c=relaxed/simple;
	bh=kmoujT613lINq5POisBnj8k0q5mR078aRV2JQyCa9YQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X1PlElgnl1FGJKKqiGo1d9zT0/mFwXyE5eGnEHNrb3IiDDwV0la8zEou+WLPxlV8tjYCC0fEVd/3PUgEJEkll/lU+INU7ECvNDyosBK9UKM4CJt/JQyQw0D+GhT2+UMtIwXDPpgrkT7u2Jyf4EosxMOjBeGddpm+8XgQ3WjibMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1xt8DBBL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1xt8DBBL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22e1eafa891so56535ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747169982; x=1747774782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmoujT613lINq5POisBnj8k0q5mR078aRV2JQyCa9YQ=;
        b=1xt8DBBLFGEBCEhH71EydtNAsD83WdywTFTFoY6FohMH5yq1hxQyU0d6uD/WnhQDVR
         usdJuNiuuCSIhFFacoODenw/7xjoZGc8KwyNPPYJaYKwccDNYiRXWu0YM9PKB2Bon3Lw
         nbK1wUiYmyE7uTppEf5j9wO3tntLiHj9x3r9HFhMkkFRwDb9xaLvZ1LlknrJQAaC+aju
         M4FNAezG5OYfYT2imMZE6VeEe6BogL6f5UXl23XB6XuYLYe+YVwqiRgt28F9hTwuNng1
         Wv4TZZlgEWJljq6pkr+FzK2v1UEunHKibO8XkX7kehrirLnR58JPTUyJ2U23WwcenzIH
         V2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747169982; x=1747774782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmoujT613lINq5POisBnj8k0q5mR078aRV2JQyCa9YQ=;
        b=lxJHw/isAb9LWE7c3lp//HxRLQNbimzk93/0CyHgm26UZvqzqY1IZdHMeVH3XiHj0Y
         0LjTpLvAfZnxJEDkJJqed40z/pMdDZc4PBdQLzUkhPF0C2LeIzdJEsQ4lvhQRBG39y7A
         TL/Fu7lFDuLEEuUQIBDLXf/i5r2yIpyx/H5XbFIlY+Zv3pncoMPvXFhCMDkUs+v0OZQE
         JXKeD43l6jj7HgUR05kbdBNxH807W4c8Ts5TbLOPjTCl0yZ1/uD2N1SK++Td8eOM1aPi
         OtTQ5TYKjqIWYAT2yKacJX/E8r7OSmbuo8Or0IH1u5NeAeagAGLNRbjuXRaFxU1yphsH
         lXZA==
X-Forwarded-Encrypted: i=1; AJvYcCWgIDvv1w87ywue6V9TV4bGT7HpVCWqTn6/UpxIlndWdqpCDJMrDgQF4SpOFvV+9CtYhj5WbYZRG6NRMa0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDRpuDRGIsPJhmSk2DAn/dYHFhElKtAGhcls41Xn3HxYujNBlj
	wQeU1Cj5DElB35svZ5o2Ejve47TCTz0LVLVxs30RDbXX9ASvntX0R7257e9r1JXRKkq+xGKyk/J
	3Q4u9SokiFmHJGDBXqmGNV2l+6TVVXbZ1fD10O34AlARs3gzreBNBwUDE8z4=
X-Gm-Gg: ASbGncsNwQTOy7q0qmDnGtktlJPUwB+SZhli87zzel6AdDZ97iINCFxP0EfQKhXAacP
	Y66kQcC9y2L6N1xgFADbChgoKz/cgEz1VzS86j7spM7LsE+z2q8QaDhxIZlBsXjlGL7bqjn85Bc
	3QKpgYfMrNwCjnXkh2kDRX2F+EAc2KKcoJZyy/dByNTFLb/ZxCbwkJvM4NcKdb7Q==
X-Google-Smtp-Source: AGHT+IEHJcjpKAtOS86nQV+xU9mV44SrVY+/XlpOPb9EojLJPjbR4OqS16VP12w9iA5csSFCoG51WilhKP4l+phrj0U=
X-Received: by 2002:a17:903:f83:b0:21d:dba1:dd72 with SMTP id
 d9443c01a7336-2319ab2117amr121865ad.15.1747169981479; Tue, 13 May 2025
 13:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512055748.479786-1-gautam@linux.ibm.com> <20250512055748.479786-5-gautam@linux.ibm.com>
 <CAP-5=fWb-=hCYmpg7U5N9C94EucQGTOS7YwR2-fo4ptOexzxyg@mail.gmail.com>
 <aCI0oDBSz86S9fz-@x1> <CAP-5=fVYXRzQjRzcDX0aJv5yg3bwDO+PWHfP-Laig0s3cnzcaQ@mail.gmail.com>
 <aCOwnUUVKx798Uza@x1>
In-Reply-To: <aCOwnUUVKx798Uza@x1>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 May 2025 13:59:28 -0700
X-Gm-Features: AX0GCFsVt-eZ2CzDOIaHjUDdhu6L7-cbOlm1bATvBY8CUXJTAsFZBElBTukfvfI
Message-ID: <CAP-5=fXK9Jru+ZqeTSuaTmOTmpF3JDHDswUOcmdOyLSP1Go_Gg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] perf python: Add counting.py as example for
 counting perf events
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Gautam Menghani <gautam@linux.ibm.com>, namhyung@kernel.org, peterz@infradead.org, 
	mingo@redhat.com, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maddy@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 1:50=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
[snip]
> Right, I like the effort he is making into having perf more usable in
> python, and I encourage him to think about the issues you raised so that
> we can come to some good abstractions.

Thanks Arnaldo, can we be tolerant to API changes in the python from a
"regression" point-of-view? Like avoiding the notion of indices?
Presumably such a fix would also need fixing in all the perf python
scripts, but the external users I worry about. My sense is the number
of external users is minimal, for example, toplev I don't believe is a
user [1].

Ian

[1] https://github.com/andikleen/pmu-tools
