Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1912528E6
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076236; cv=none; b=XPVxRq1yfbYlSbA0D7Jc0928rauOZMjuKXHMJA3YrqMoAucFKrPpcvM4qIFd7cL1vuqlLmjbWHfYnsNtw/vLsjqou0xgM6Kmbmo+YheoKyFuCAOh+ypsgUMAu7GbNsS4ZKk+7SqQ2nIBQy415UlmhZuRwsko2uH2w+a3RRlM2SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076236; c=relaxed/simple;
	bh=fbI3cjbsK0JUY5ujCpjGR4ienjUE2nrxQFRpNKrreTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwIFmNXzMIKiLB8+FJLjeOD4Q8xen7U6cW07sFJzldS4JnVii4PJGV0G2rexq7xK/t0bBWc+zTIBP3j5N/vAluqYxzJ/VqgSu0+9b3alSRiL7C0B7vqXf3SPq3xJdPsivxDJifxyuaPPiYmhL0O1KQbodsUPUzRJfAsDD/qB640=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NNtaDJVH; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NNtaDJVH"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad24677aaf6so248228766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747076231; x=1747681031; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cQkfO4hWqu1bvvz/7yqOd/ghHOaUeErpEqA6FiF+TmQ=;
        b=NNtaDJVH6I1r3prK7ruxv98hUonbLgfxIE8OaiL85t0F72rAszqkm1Evr/ynxfoB/T
         RDthxV0d8vVEzBTvG0e28mSpOzC/BSVQgMTc9/u0q2vdTbRSxLRTM/Egbr8jjmpRAEyM
         S7hhpxfVLY2LuJmsg2SThPYUkU7IGb5sfZs0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747076231; x=1747681031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQkfO4hWqu1bvvz/7yqOd/ghHOaUeErpEqA6FiF+TmQ=;
        b=FbpXXnrnvDZUayQm9BuN1mYk+78sxrN3nUBCPAk7lloit6c8pT43RJuts7RilepW2T
         PCOm4I5oVki0ZmzyllxmVHViffl4iCQzT2L22yIaHdgHHzBe3LhGV6n3L+gedHbn4VX/
         zKk9jJNt/kLR5I4txWImje64DutgR/qsE0ij3mSGuaUuSQAq0wE8QbqTdL574AhO7nCp
         3xCy6AqhrCDL54U1sWZMfHIkfO05RkwWbhzAGPyS4aM2KJpo+SzvHW34r3q5nyCrax4h
         USGIefQErgptCZywOW3sAEna/OaxHFHPx2dAfmCROuWoy8Mr33wd0J3E1hQ3Aw9C0iFG
         tOPw==
X-Forwarded-Encrypted: i=1; AJvYcCXs0clHMYpLCHjnrCPwMiASOIlr4DCH7Luo8eRiQ8azo+HB9uei+Wm93CdNnwwR7X8Pyt6Jkl3swcCAPTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVAyUd1Qt8+sw8nTQbf8cSWFuXBBz2EpCxzZTW+MH6fh+qRi1S
	sHgVHs4y8DDBFiRCdpcSo7WedZBauYtqK9GC/1OlWRfHtLyhb0Q2EUv/gh4eWCGyKOS4c1g4LFP
	lI1I=
X-Gm-Gg: ASbGnctoq+UsJeIfC5WqsxZ5pbc82oJSwSOMNXKPtTBmJPfjyicwROIIxi12r4fNr4m
	RPCwn5fv2XaBkDeH3oH/XcCATJUKBm2JhQAuEg/A3FU1wbWLvqSn7c7lfO/mcHg+WlXDu6F3epB
	UNFTbEslIaC4zxhOg/HdP4Ci8spAMMpRm4onkY6JyUeQVuI/Ok+9rCakghngtkaSZNT0N8X0GaQ
	uoenvT5CWx99tMMxoAUS7r+B5IT2VNHxiGBBWVQJnMpxCBtNeM3SAe/Mzp3shyMlaEIyoTXP/CW
	YiIq+7CaDI5yFJ8yLpaOQZPStLfobQblTWS09ofV/vAVfxxZ/jMKeu6+YSKN0OD2WEvnIkXhtjI
	L5TmdKOY/hTwg7apj9BOtGXqF88F6N5R+t9A8
X-Google-Smtp-Source: AGHT+IGCoS610+F3EgJKCLcgc4BGj/Dsu3CLC6GtBmAIh4gALMiyTyDfgSE7hX+DX0X/bni703X0xA==
X-Received: by 2002:a17:907:60d1:b0:ad2:2a2f:7062 with SMTP id a640c23a62f3a-ad22a2f7281mr1054611666b.26.1747076231198;
        Mon, 12 May 2025 11:57:11 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21974701dsm648833766b.116.2025.05.12.11.57.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:57:09 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5fbda5a8561so6738076a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:57:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJriq87xShDMdheMOefd/ZGv55T9OPdJupkBLPIorA2S8uEG0BNX+86ywRFtsvzP+G7nZlUhE4wVImXp4=@vger.kernel.org
X-Received: by 2002:a17:907:a0ca:b0:acf:b8:f5d2 with SMTP id
 a640c23a62f3a-ad219007735mr1331166866b.36.1747076229361; Mon, 12 May 2025
 11:57:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0e82be0f-a305-4aba-b9ab-79596f595277@suse.com>
 <CAHk-=wjNj0vHh9v6-LTrbgtq=o6OS+RN3u3m03nV3n9V+urGtg@mail.gmail.com> <f40c3d5c-edf8-4d3d-a50a-506c5b6d7bc0@yandex.ru>
In-Reply-To: <f40c3d5c-edf8-4d3d-a50a-506c5b6d7bc0@yandex.ru>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 12 May 2025 11:56:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=whBF_ikhpCa_uW6Ahh-2TWh=5g8WydY6P4_Fy3sT9EmMA@mail.gmail.com>
X-Gm-Features: AX0GCFuKupDElWgaZY92g6wcpisiuYtRjjFMNH5ooBdLaCB7fzmVdT_PTNET0h0
Message-ID: <CAHk-=whBF_ikhpCa_uW6Ahh-2TWh=5g8WydY6P4_Fy3sT9EmMA@mail.gmail.com>
Subject: Re: [GIT PULL] Modules fixes for v6.15-rc6
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 May 2025 at 11:14, Dmitry Antipov <dmantipov@yandex.ru> wrote:
>
> Technically speaking you're right, and I will take notice on that for
> further commits. OTOH replying with "please adjust commit message and
> send v2" could be the way faster.

I suspect it ends up depending on the people.

Personally, I tend to dislike being on the receiving end of the
back-and-forth of "fix this nit before I'll apply things", so I
generally try to avoid doing that to others.

Yes, I will do it for things that I think matter, where I really don't
want to have some bad thing show up to then be fixed later.

But I feel we sometimes have *too* much of that code review attitude
going on, where you end up with patch series that go on for multiple
versions because people keep reacting to various small details.

So most of the time, I'd rather just get the code fixed - get it over
with and leave the issue behind.

I'll point out something I think was wrong, but not fatal to the
codebase, and hopefully just make people aware and avoid future
occurrences.

IOW, I didn't expect my comment to result in any particular action
this time, just a "please think more about the explanations".

              Linus
