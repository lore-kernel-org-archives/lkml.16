Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC131F5827
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747123701; cv=none; b=qaBdWaIouAhDpRRmAyIEW+rzLosv4tOwJ9fvAXBt3M5HaORwcs5hLkuVcW60eJUreK7SYEteOpzN90w5zP3QlQKqDKAWIH72zYAeJG6N9xlU2HffZUMgCL6ybMzQV9Ylm3qYLa11We3KUIqp7Yur8GW0DgVE14Yy/lbDFHORNB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747123701; c=relaxed/simple;
	bh=L2fUONMvwnW8yiHGxt/Cv3eCXBmSe0K4+Yn3jlPnreU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKqYD13yNpa1zBG3qJkL++isLN4sdM4XbwhVYrGha1hw7rlHTaN4WUP23gu4jGWUny3S31Ua6K9Klh6CbEoN/IjW2YlOh0Jv3mhB71sbbdACltQTSQhtDF/Bhfds2+fHdYUwsHHN4Kev3EqRalJ9NzZxKbsZ9kppluhQG6xm5wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KXEI0iAX; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KXEI0iAX"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fbfdf7d353so7031055a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 01:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747123695; x=1747728495; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L2fUONMvwnW8yiHGxt/Cv3eCXBmSe0K4+Yn3jlPnreU=;
        b=KXEI0iAXx2Zj4xumoxPw7G6SuLVZzZGf5ovqJlrs/fx9weVgXtah8kMNbeIq9XwWjr
         tAeHUDLhNXypPU8lACn+aBn64nS4lLhM1WVDz1x21x22whp5YxnmiquD8JEEYvXkHd5e
         PJ1nm36zNjF8v0+rALqQ3h5UebhL8v26qbPbzdtL2fk2IjqEYeSJPnpnMN+NXsS8Q2Vg
         JSgCYi2Rnu53hU0+0rrdCJtNNDPg1UawvqlUrYwRDBKMqNYImr63e7ME8iPnjKy5p+N4
         x9fuV3/GzL6SXxWaEtSw8WqSn2vP8HWzQ8LhMYIKiQu/Ekrg4XMqxzNPXygzP0E/hG2M
         MqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747123695; x=1747728495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2fUONMvwnW8yiHGxt/Cv3eCXBmSe0K4+Yn3jlPnreU=;
        b=PfJ1+O5+OhXFkZWdGELU1ZvzFjuR8ALZ9iNE3e39saHpjXKOfeE2v5NewUGUp0glnV
         bE/bSz3+OXPznXUGuDoOMUPDFwsE2LAaC6MuqgdqlSBjneGR/kQbt3l+lTnTqZKjmpck
         7nNteIrdikvugl+QSJKAOcqRbA+OlY9xIh95JC5HmtexWFQ3IV7IKZVcBZeQGd7pwKLa
         VPZkdtFSmLiWmFtrh0zaUStggu7cgGuUewQ/ugGkAPYK9+iO/o9isaDHqPEquJSBBwtd
         C4ccWih8FVMzfK0eMlyV/eBacOhEE83bNMRxpm6mpVbiQUu8gIyZDlwA1X8aVF17rvt6
         1DnA==
X-Forwarded-Encrypted: i=1; AJvYcCVFG+Sh2og9iIXfaAD1mkoycziorWXQyZJ+tEzXjIY4p2Phl+SRZpv4Du6jNxGBufXMhNN61ufGn9eTNb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5uXDpItuiL6MxYo2m0T02UR4OOxC8p3rmb39D4MDzNu7cPuIO
	73o7JPWDsPEmmNHI89h//2sKk5wmdwcdYILc/XMQzo0s+8TdX8pXRJi6ePfyEqcH65EufCqfV56
	TmGj5Z7AkizvD8d3VUb+u04r79Pof5kp53twpug==
X-Gm-Gg: ASbGncuRt5UjFsUUkMKbnTNZ3m1TpY8y0ovpgoVQDGrUFlHEXVIlesSBq/80SYu0mbQ
	OdXURj95qH4KzbFIbFh64HfAGeTlZvcGS+CAO1Utyzmg5+ue38u+tBw7Q0cGOh/JhIiN6LVs50A
	oGz66OUZdJZPTifKZ/NGf1S7sPF2g/aHBZ+cU8vCEgAw==
X-Google-Smtp-Source: AGHT+IHads4QlEtEqDY0AcLA2qwd9nCVGS/i83MACpvcqYx3SKhyrTWngOEajmlG/EhswkvR+dusb++aWne7YfpHpW0=
X-Received: by 2002:a17:906:adce:b0:ace:d986:d7d2 with SMTP id
 a640c23a62f3a-ad2192b5c89mr1251560466b.49.1747123694914; Tue, 13 May 2025
 01:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512172321.3004779-1-neelx@suse.com> <20250512202054.GX9140@twin.jikos.cz>
 <CAPjX3Fe1izCGUJhTWk1mB=9uK7kNHeCOj51_TZQG7DOe_aooig@mail.gmail.com>
In-Reply-To: <CAPjX3Fe1izCGUJhTWk1mB=9uK7kNHeCOj51_TZQG7DOe_aooig@mail.gmail.com>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 13 May 2025 10:08:04 +0200
X-Gm-Features: AX0GCFup9GV-6iFM44V2E1_7oBRjVed2wfgAv6JSFREeDOMW27ll8odrJ9yyM5g
Message-ID: <CAPjX3FdBCqDLyOyoQkm16-rQLGbPu-3mdesepd9KbpCa=mPxwQ@mail.gmail.com>
Subject: Re: [PATCH] btrfs: index buffer_tree using node size
To: dsterba@suse.cz
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 09:56, Daniel Vacek <neelx@suse.com> wrote:
>
> On Mon, 12 May 2025 at 22:20, David Sterba <dsterba@suse.cz> wrote:
> >
> > On Mon, May 12, 2025 at 07:23:20PM +0200, Daniel Vacek wrote:
> > > So far we are deriving the buffer tree index using the sector size. But each
> > > extent buffer covers multiple sectors. This makes the buffer tree rather sparse.
> > >
> > > For example the typical and quite common configuration uses sector size of 4KiB
> > > and node size of 16KiB. In this case it means the buffer tree is using up to
> > > the maximum of 25% of it's slots. Or in other words at least 75% of the tree
> > > slots are wasted as never used.
> > >
> > > We can score significant memory savings on the required tree nodes by indexing
> > > the tree using the node size instead. As a result far less slots are wasted
> > > and the tree can now use up to all 100% of it's slots this way.
> >
> > This looks interesting. Is there a way to get xarray stats? I don't see
> > anything in the public API, e.g. depth, fanout, slack per level. For
> > debugging purposes we can put it to sysfs or as syslog message,
> > eventually as non-debugging output to commit_stats.
>
> I'm using a python script in crash (even live on my laptop). I believe
> you could do the same in dragon. Though that's not the runtime stats
> you described. And I don't really think it's worth it.

Eventually you could use a systemtap or bpftrace script. Though both
have their pros and cons.
