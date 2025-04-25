Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA79217F26
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745554877; cv=none; b=r7EmNOJFOnBw/SCx/51Ouo+IKq2D5tJrjJHjBt2P4DytWxhqJ0GTjyMX0G6+GmmABQx61G+cFs8/jIfLvWA4ateEF3PqhnVrAET3yhwvLKwi4uePLGh/GO5X1YKO2if3pWlkRCjsH2ClP9puxoSXaNMSmh9t+h+L3s5AvTtAyO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745554877; c=relaxed/simple;
	bh=2ek74mNNFIgWcZk7Q8YaK5RG06y977D4eT9YNwdT+O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCc4DeuLxUi+3xOcVm3f7P9aTsn6tCKwYxv3wo46c8wZVBjbYEv9+LTL69+SV3BXFhd+KC1ZiHaLx/3hF/RDgErgbG5thIjEr/YYP8ALIBb606iMRq7+sZI4ymByQfca2kPNIxLC3ZJRP6+HF0mMsYbaD2WWO2gHVV02iRTdfco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aUB3I9Fo; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aUB3I9Fo"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so917021a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745554872; x=1746159672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NAE0ezuMYS7J5WA+bsYijLDvptHGpv+uu1oCrM7N5E=;
        b=aUB3I9FolXVtp055ajjCkQRz5aWwZ+wCO3GJiFavr7spI6Y/DZhxm7xQeo5oajUs/f
         SEbFwLrzs5UFaurJP5tRtjfsSR5Q+fwktglworPune4ayiAsrqTgu676dOsv9RO1er7U
         CH6XF7lKDlDSoAbKx/wgu90q4axYFD4fnk/78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745554872; x=1746159672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NAE0ezuMYS7J5WA+bsYijLDvptHGpv+uu1oCrM7N5E=;
        b=WddzBCWtzOPTqAu1TkfbkqbiXZCiDCWiM1lRpmqatY2mrSmSK0aicPeLcJH3yOuX0h
         tsQbJGDmgVZTdqfgRtucVO5UmoUFr8XIHIesA9zH4Jf6gyu13nV0jzUoNhWsRsKjeTv3
         LQj53Tojk2cj3YZQ5YkWqMXHTc/5/ATEzK1bp0E1OhvM+88KLkfwWA8KDSkuN+ZwGC1W
         Iwl5OfDXfkzD+qc65Axf8dG+ttrdCrn3ImwgDa8+IR5slkA4ho79gux3LSPFjctNWqR5
         uVnfw0IqGPMjyKYvShRDWcx2kg/RFR8hdj2pK+kLvGtPD8gZ8VgMJ7HJaAGU92FEWQBQ
         m4YA==
X-Forwarded-Encrypted: i=1; AJvYcCVcMTUV9Ai64oI/SfohNpbV+nEhJhp9Z4wSHlZkJMtWvOZ+y12nYXJTNzwHNHMHrrrfya51yzAXL/VTkPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK9QFtpuJQe1E56eZv7pLMhcfAo6f3Lozzhyxi7v+YagpFvp40
	GwGeKv1oYoD8q/r1OTXFahcJ1Tw7Rk+ejbXm7t8p64KKAut0SW7q+VHh+olp3DXlBGiOm8cmHB8
	VmE61Lw==
X-Gm-Gg: ASbGnctRXP5Cu7usOtYoPtPcA2WWeEZ0GG3YH/39gEwspgj4A9ng1/aN3w1bUNyBHUC
	8/7jS+kzt283q7b0D4j7g7tK9UYaALGEIFPH5dtScSJ03gmqtLbDuD7vojnl/VIlgGuHO4n0yMe
	xSgCmkZTRlRu9N389NUadNNJ5YMe+6RrQPSyBY3CcJMEEtKOEf6LyylsuDPYZf4bG3AzB3Dd0Q5
	zzu0OPaH43XXZKH6b3d/WOOIw6cjSJHuSY2Fd3OOnr/Vy3BoogeyOAZ4+maloWDeW9rmHMGb4Ck
	dFtVjvyx5uX3U4m35GG0408fNZCW41VYSwxI/oQFSlGsmze08wdny7ZfuDB9RmIHFmGm+RP9M9b
	/hb1Q3LpPpclqdsg=
X-Google-Smtp-Source: AGHT+IF0R6StwMi+gqSqIZGDJoYaaEsiVSzkb5KlFhnwWsWNc31y9s9tF6ZXfa1/3zHUrGhLNZ0R1w==
X-Received: by 2002:a17:907:94d2:b0:ac1:ecb0:ca98 with SMTP id a640c23a62f3a-ace5a48320dmr384456366b.26.1745554872417;
        Thu, 24 Apr 2025 21:21:12 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf893fsm65919966b.96.2025.04.24.21.21.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 21:21:11 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acacb8743a7so302101966b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:21:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLIb91RORKKhlWa1J7HNBx3SWz8yn3OeAFoOfU5mCvnuOUoQ6LHZkE65TUglAZIuVjSOW6FtTE3yg0I2Q=@vger.kernel.org
X-Received: by 2002:a17:907:94d2:b0:ac1:ecb0:ca98 with SMTP id
 a640c23a62f3a-ace5a48320dmr384453966b.26.1745554871324; Thu, 24 Apr 2025
 21:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <l7pfaexlj6hs56znw754bwl2spconvhnmbnqxkju5vqxienp4w@h2eocgvgdlip>
In-Reply-To: <l7pfaexlj6hs56znw754bwl2spconvhnmbnqxkju5vqxienp4w@h2eocgvgdlip>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Apr 2025 21:20:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjajMJyoTv2KZdpVRoPn0LFZ94Loci37WLVXmMxDbLOjg@mail.gmail.com>
X-Gm-Features: ATxdqUGW6PrSoybEs-CBS2CL_qi9B6hsp2y203CCwxZ62Ilhm4qWIq-GEHNl9dI
Message-ID: <CAHk-=wjajMJyoTv2KZdpVRoPn0LFZ94Loci37WLVXmMxDbLOjg@mail.gmail.com>
Subject: Re: [GIT PULL] bcachefs fixes for 6.15-rc4
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Apr 2025 at 19:46, Kent Overstreet <kent.overstreet@linux.dev> w=
rote:
>
> There's a story behind the case insensitive directory fixes, and lessons
> to be learned.

No.

The only lesson to be learned is that filesystem people never learn.

Case-insensitive names are horribly wrong, and you shouldn't have done
them at all. The problem wasn't the lack of testing, the problem was
implementing it in the first place.

The problem is then compounded by "trying to do it right", and in the
process doing it horrible wrong indeed, because "right" doesn't exist,
but trying to will make random bytes have very magical meaning.

And btw, the tests are all completely broken anyway. Last I saw, they
didn't actually test for all the really interesting cases - the ones
that cause security issues in user land.

Security issues like "user space checked that the filename didn't
match some security-sensitive pattern". And then the shit-for-brains
filesystem ends up matching that pattern *anyway*, because the people
who do case insensitivity *INVARIABLY* do things like ignore
non-printing characters, so now "case insensitive" also means
"insensitive to other things too".

For examples of this, see commits

  5c26d2f1d3f5 ("unicode: Don't special case ignorable code points")

and

  231825b2e1ff ("Revert "unicode: Don't special case ignorable code points"=
")

and cry.

Hint: =E2=9D=A4 and =E2=9D=A4=EF=B8=8F are two unicode characters that diff=
er only in
ignorable code points. And guess what? The cray-cray incompetent
people who want those two to compare the same will then also have
other random - and perhaps security-sensitive - files compare the
same, just because they have ignorable code points in them.

So now every single user mode program that checks that they don't
touch special paths is basically open to being fooled into doing
things they explicitly checked they shouldn't be doing. And no, that
isn't something unusual or odd. *Lots* of programs do exactly that.

Dammit. Case sensitivity is a BUG. The fact that filesystem people
*still* think it's a feature, I cannot understand. It's like they
revere the old FAT filesystem _so_ much that they have to recreate it
- badly.

              Linus
