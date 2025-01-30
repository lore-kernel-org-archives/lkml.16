Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20951E8840
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254354; cv=none; b=gIiF7CPHIx5IEp/ny19PPAk0574W6B911d4FmU3Qu9t7xrAGZ+CJ/7EMePhkvyBVU58AhkBdJAwAeWYcq7U7YkS6C5dkKPxH/TZZtVLi74B2vdgXXMLo7U1kDQK4lKBPZKEDFEkzmm609XSsJsBAdIqi8yNJPR28/kA8uoF9HPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254354; c=relaxed/simple;
	bh=7MbILsjhKj2s5zvjXYe+wMzspmEdlv0lccPETbKTUcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pYrT/p4WLt7sFtjNKp//54K17Z870lmGZje5PbqO2gydEK6NlSGqRHDeE1HMKs3RL7F77fFnNepfIAs8j0lX3QUfreaYl/0KwFCue+IRsTEAlHIu9MUct6/3EfpYN2v8Qfsb9xGvPMmQbPDxR7T37HjmWYgzFepzja16cor+gZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v8GyktGu; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v8GyktGu"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dc5722eeaaso8296a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738254351; x=1738859151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1VbyvNf60Kf8EUF9uihS44Al/9bqOoO9TPYohytuLs=;
        b=v8GyktGu3oIdtVizEDSzsTCiPf0rD2ziPEApSJVovnRL5RtWb2OQwpIrZcouqZgnDH
         IPEkFDVFAo9T6RCr8wAmaTR6PKbpdNk+cpCuTNPE9k806yfnCLz6oIt9ewZupH5qYJtq
         nGrxuOQByHILujq5FWguDCN6R4BLVUXPikBILiPhHRXkCfmI7pII8d8HXlfVfG1IwkyZ
         vrwZk870Ad9xYvRWTe3fooLuB2QQM53k3Ho1KiiJAJdp0wdS+b5rW+G5GYm9NTkxg49A
         UwHYsLNNHh7BeZFo+d0z9oD13E/dRZleFNrTd50ChC8bFEEUEKGeQjbuWkpqVJh4RYep
         MWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738254351; x=1738859151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1VbyvNf60Kf8EUF9uihS44Al/9bqOoO9TPYohytuLs=;
        b=ZaGNtRDtXBn46xMi610Bou3SMt7VX2BMo7SgyHONaGz9lTZmVxZMblY485durn9kHY
         Fuh7LPeBuS7AeH6VaLNLxK2vnFML6FYRhvdWZmCrnC7F+sNXMoDPfVsxMAIrsWU6nbjU
         TtoGy+IWIDXfKj6hZP6Ba3EF/gZ0oDXWwwQrGpW9qLSVghuVckbXJFgy+xTr7vv7RPPU
         veoaXlk22G87d+TIx2hAzac3y2TuSwX0UVJOtVPb24JYMoEZR8M2QtpjX0vpF+8h51UH
         GVD2gIJpqHxoZQzeZOzK+xjCaCfXHACS0u1o/Rrm7PCR3P/lY/YKL/zHaJCNIlVyDiep
         LxzA==
X-Forwarded-Encrypted: i=1; AJvYcCVxREWHfXqXZfI/BfSG8moxvUWlOE8htLEazzKAJdYdhHj342OwSyRsSVtTCS+RybCAofgloNgyT/ipaP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwZVKMytPShNRUfIXNuBIDrRt6JDbs1VYVak/lhnqGKEblLheF
	zWOnxLsH7+15GWtUDyCKCyb9AQOCTK5C1oyElaIX73FqEXl07cBTkitPBvZ/j8TzAD4+oNWmq89
	/saYnVotWJVgU5UNiQlFC1hSFS01xFDq9zTTM
X-Gm-Gg: ASbGnctVt9+K3Z4xkK3xb/dDF5b8lh9fh6Az+kiZCAlKM98Hh9Y8IOzbnpfiDAn5s+c
	MTNpIyjmzRG7leCur+M1+zeEB4Ce9cfYSxiA6gY/zHT5zZxrQKo3uyjoe+Jw1M/oWrJmx3A==
X-Google-Smtp-Source: AGHT+IHhDr3WLmHS020qYiDGqruH/H5KWsGKCNm6bAmGyAHM/dAndCBO2vfKx9M5/upYX5fbRvFEKaH+41A2H/O8RSI=
X-Received: by 2002:a50:cc94:0:b0:5db:e72d:b084 with SMTP id
 4fb4d7f45d1cf-5dc7f8f2eb1mr6594a12.0.1738254350731; Thu, 30 Jan 2025 08:25:50
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <679b7c95.050a0220.d7c5a.0014.GAE@google.com>
In-Reply-To: <679b7c95.050a0220.d7c5a.0014.GAE@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 30 Jan 2025 08:25:13 -0800
X-Gm-Features: AWEUYZmrBV1U2WTS48Ggt1n7BFcW0T5BPP0zexNotres2EAXXsig32k122LDFns
Message-ID: <CABCJKufpND1qvBhUMwpJ4OE7Umo9EuaNTLOi-GmAXFdXRqhoFQ@mail.gmail.com>
Subject: Re: [syzbot] linux-next build error (19)
To: syzbot <syzbot+62ba359e1dfec1473c57@syzkaller.appspotmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 5:20=E2=80=AFAM syzbot
<syzbot+62ba359e1dfec1473c57@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    a13f6e0f405e Add linux-next specific files for 20250130
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D10221ddf98000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D3445081dab637=
16c
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D62ba359e1dfec14=
73c57
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Deb=
ian) 2.40
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+62ba359e1dfec1473c57@syzkaller.appspotmail.com
>
> scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: dwarf.h: No such=
 file or directory

gendwarfksyms depends on libdw, so on a Debian system, I assume
libdw-dev would be required to build with CONFIG_GENDWARFKSYMS.

Sami
