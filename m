Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8ACB672
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745831121; cv=none; b=UjfXLSXRuh1dwwFR7uA2b9p3nnApXh9ZGjwQciwfAt4sxoLW/2ol4/YQb86eRczSm3LvBMqZMdk8RLnZlZShDeV+yXuA6FG2B1lMuPiZXRPwEkt/eEBX8lrbZvwv+S96KfwF7drph8Us/3aD2YdwDreTZeWMckAZjDDyXKzfy1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745831121; c=relaxed/simple;
	bh=yCTWrRtiTskqHcffred3oOclu+g+/MhMweZpLbHBnEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=PIflt3tfF3ecbpqyI3TwCLPjqwJ05evjL8AH0Vbdc/vtlKu6XCb6opfINiNTTCXwhcHX2h9M/mKYMaGikX3BYEEPGLLGBlXaqhSTxeck3BYlyfqQRKn8Fi4pouX0gCET0M/BBo7qViX79OsZqSvx+eqw1XL/g2P59JDscfJph+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIIjVxOQ; arc=none smtp.client-ip=209.85.219.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIIjVxOQ"
Received: by mail-yb1-f194.google.com with SMTP id 3f1490d57ef6-e6df4507690so3490652276.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 02:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745831119; x=1746435919; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuYAeXpEzYr4uoSkFyBly/aWAiyITR6kkDoT+DA+Ur0=;
        b=YIIjVxOQj43hPXY9g3ic8Dzm2wAWVrxcQvv4086mdaWV5JKbaIY87eBgzAWVbm5NM3
         nHI1EcIF4LDvoGZW/S5f5qoFAzJHT5t4/p/V9T9aHYAjSOlfj7O3WsVUTVqxhBBuL6LD
         HaIea5LFJzY9/MMYSHo/H44ICZkOIEx7yg0hBvY1ih88ewRSzhPcQQtWyz/cYUk/vCW2
         AmFkvtoY3bzXBXiVUTahTwVAzepD5W6ci4WngmtPmX001oPRS/YRfFqcRROy5YXGJJGY
         UeCcoBrpdg4i0cRngbpEeCw1mOu6Wzk7PPp39FCK5V/1+08cww7ErUqu5lWBPt3v/Ylp
         dbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745831119; x=1746435919;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GuYAeXpEzYr4uoSkFyBly/aWAiyITR6kkDoT+DA+Ur0=;
        b=dNWcVn9GS9a+EMNToIfc/uYsrDU71jLmzmyvKvADm/+C57rT6nxXmDIs2n5bcwC5FQ
         UNZsGk6pZ55rMm7ECfK0VNfmkCHXB67AbsfKyMGhVb2aINKVe2dxr4NgJQmJnaoKe9T+
         aXQyshjOYA3CWTgz073Ch5HS2MEnw0gJw2oJBeAoNARsDDLBDhtAVSZPvkFS6rZXr+wl
         MJqCsEVrg6I+CZ2yzJO591l9UM4ayARZHqNenWGWe8nUcnv2SfZtEST0LEiJHBFWfBGc
         z0pOjvGkpX7QECyFLjEdjYUfZ/wxlcUC3TloTuH4SG8GtHo6lyLtSZ+d4wKrmNqksiC2
         IP6g==
X-Gm-Message-State: AOJu0YxnWTl4Pdb5IhAGG70Qwq5fEo9qSnyPv+XV5TZ4qikMf9pa5506
	m8LumGDEt5n3wgqWtioCn73WDwZzHTGUrswPIkYru9uJ60ihKjGlF1VL8y3La6zyYMNlB8Fascw
	IQnPGCMFe1vuf+kxjXbpDjf5tvBX82YGi+z3yvQ==
X-Gm-Gg: ASbGncsE4ogOH9dRgP896HXVOlv01fJdn+ajYxauzV0quQ4QkDH103BCFxdlsnEDTpB
	GYK7oXOF10zybxpdkSkbYWE6I/+x2fl9Qc+aZwOLmCcoejiAemAKEq8j1CYe9o+ngYWeQJtJDrT
	UQBYtaAACP91Jz/VQGWxHKUolprQsdwlaVYpe9aAAkoQtT2ZuPFibBiJHu5N2u/Q==
X-Google-Smtp-Source: AGHT+IEXl51vBqi0BA2Ho/PjwCHi9B6+fUins26zLxysfwzYdnX1CuiGfYjRfJvmdJ0rR/Ea+By7JcS2cs4c8xrHV6I=
X-Received: by 2002:a05:6902:200f:b0:e72:bc40:3e8b with SMTP id
 3f1490d57ef6-e731715de6emr16037836276.4.1745831119018; Mon, 28 Apr 2025
 02:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFf+5zi4JSZq=Y2FkNJyPUTFuvwa5UJmn4zd6ve=VO8aSK9FOg@mail.gmail.com>
In-Reply-To: <CAFf+5zi4JSZq=Y2FkNJyPUTFuvwa5UJmn4zd6ve=VO8aSK9FOg@mail.gmail.com>
From: Amit <amitchoudhary0523@gmail.com>
Date: Mon, 28 Apr 2025 14:35:06 +0530
X-Gm-Features: ATxdqUFrdNEMcrGmdhGw2aW2BIfOUPHrREwxH0lXjMukNZHx7IywWg7eTKl5XPU
Message-ID: <CAFf+5zjmySwMg1XwmVO-HfrDNLSox4AyuffWT=0uRCAhpTWTeg@mail.gmail.com>
Subject: Simple but sufficient .vimrc settings (file .vimrc)
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

=====
.vimrc
=====

set hlsearch
set ts=4
set expandtab
set shiftwidth=4

set autoindent
set smartindent

syntax on

set formatoptions+=r

set splitbelow
set splitright

set colorcolumn=81
highlight ColorColumn ctermbg=black ctermfg=white

" Jump to the last position in the file when re-opening the file.
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
exe "normal! g'\"" | endif
endif
