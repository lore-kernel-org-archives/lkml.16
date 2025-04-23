Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425392BAF7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745401697; cv=none; b=YW+yKcyAO+l5phPsGpd5WcaaAfMhZA0xG1mkHbVLMe9HHB2ZXV6ByyOxCT+8XFa5JaQ5ORSPoUYq4MPlL/F+FQrWTBeBaxApTB2gYGqrXpMD98IyvrFIZUlyPjl/EzPtcmJiAnN/RUm939/EWcJjNTM01cU11tbOD19eSX2MXKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745401697; c=relaxed/simple;
	bh=CkYe7KQz50Vk5hVwM4De0HxlJ6l/u7mNP1mNAfjOGrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoRW7NwYcfPZ9INSLnuB+t6OgHzCldC9XjO+Qf7AJBMuO7rXsjLfF6q8AzmsMnWiWXI5rLQvdMgXourxBaUeP+46CwLhhjygRdgPamBQ2/0Q1X3/4j1xOtEjpnq6uKQuXprpjOs0TfXa4jSl/Tf6K0s7AMmvklU0XEBiickguUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Pygl6aTV; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Pygl6aTV"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso1414843a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745401693; x=1746006493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgKA9pbsvNPBxBjf1g70tKPE1M+bS/FmY4rPNG02f4Q=;
        b=Pygl6aTV7U9v4W2dprD2mc1cWVtL9+4NVQ3vMrCi75xRrylGLb5joQf7n7b/DIpHn2
         7B6MjMNZwvNVw0XnSR5Ev67G23kvw9Tfedqa7BQ1kWLgy89Q/+XedxgbHiRpXxjzc44o
         G6k68arsHzCPcsDFDvHzg431/ILtZhY8TT+E4v6CqMLgJtAVMz7VZLxobgf9ivgDKg2T
         kIuhoUI9QyDL66lhnSyIKKRhk02rkW56zJX5K8qAS22JhLVCCsKO19nO9r12nJsqB+fP
         UraqQX8mdKIHMuMK/i/VSVa7f8/IcgLxUkIYAGIWEGVAWuNTZdwx/YVwfc9NhfhgGuJV
         SWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745401693; x=1746006493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgKA9pbsvNPBxBjf1g70tKPE1M+bS/FmY4rPNG02f4Q=;
        b=IKPmYnppumY+9+efxSGobJCOkecenVTBWWR/7OtSvrpuvxnFqBekAe8asl5QoxbF89
         KCqKZmfaUgLKOMmifp29hscI+yLpiFXxYV9V6rINn2b9UQ0gnB0FbxBvAHMzMOc8sMPv
         WYXhOGKGA7fYoWKXOYaYkKSLY+pNvINPSvt0CoCR0Q/mAZFXmifpYMQXZtUDpjaojMBC
         dr0uj/Hjbsjg/HlMfBPesTwkuHQNC6vuQAEC+hyN5MuNhfqocSJJiiOYZi6FGFU4zcgQ
         vaOeJY3t1qkwlyi+BJNKkxB2tERCaRnKoibPJj3kGoUu+0QFXLFfwfTE014/2UaofyM3
         AqLw==
X-Forwarded-Encrypted: i=1; AJvYcCXkE5r5GcPnEbxjoFC/jdhoux+oHM02qBPbsOOkQqHzBK5hPaYRg0CNigVqEk0qtDlJEajs3cnFo0M2+Y0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDeevrXVLLMEkS8Qw7MUsy0N+RXOMd4LlotpeWjKw1GZ5AoIN2
	glZykvLrhOFEpkC2itHjzH+cpsdMBvZXKkUlusp+s5U5Wxus/2e3O40G5B4JBKLlbwGP7bQnWlf
	OSPTOraTxFSTFfpzSh9TcMwLYicRaNArDjUpRnA==
X-Gm-Gg: ASbGncujHUdEmy/ESQ6hqny7TWeHM5psW22S1pr23HcVeQbXG/ZV6Kna5Nm6xl7dp0T
	YvftqymUCndpbXHpOVj1AbhDMc6OTy7BPtOxFmQddNKxnrGxRlvjYjxSJdS9OJ161PAT23gJU0V
	diy00vCRvpEEFf709Gk3YIZ15/yVSC5YQ=
X-Google-Smtp-Source: AGHT+IE+8bYSke4FP+p6PQMgiRcJuZXFwIGogu92r+zEM6Bmo3Q+Idw1dhZWveMvN+FH++UzViCxM7RmqkVA0x2IHms=
X-Received: by 2002:a17:907:1c8c:b0:aca:c699:8d3c with SMTP id
 a640c23a62f3a-ace3f254e7bmr220960366b.2.1745401693592; Wed, 23 Apr 2025
 02:48:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423080940.4025020-1-neelx@suse.com> <CAL3q7H7A_OnTQviZpCgzrGUFe1K=VfMiWXaba56E3ucPHnVkNg@mail.gmail.com>
In-Reply-To: <CAL3q7H7A_OnTQviZpCgzrGUFe1K=VfMiWXaba56E3ucPHnVkNg@mail.gmail.com>
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 23 Apr 2025 11:48:01 +0200
X-Gm-Features: ATxdqUF3U4FzwbWeM5rcfOACcVKfWJgB7wLcEF0eM2OaXd5lqZeWqt45UzCmIy4
Message-ID: <CAPjX3Fdor0TgkQtb2meJD4PFerOQV1Qcjs5HEyBCt5TNt8-vsA@mail.gmail.com>
Subject: Re: [PATCH] btrfs: fiemap: make the assert more explicit after
 handling the error cases
To: Filipe Manana <fdmanana@kernel.org>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Apr 2025 at 11:04, Filipe Manana <fdmanana@kernel.org> wrote:
>
> On Wed, Apr 23, 2025 at 9:10=E2=80=AFAM Daniel Vacek <neelx@suse.com> wro=
te:
> >
> > Let's not assert the errors and clearly state the expected result only
> > after eventual error handling. It makes a bit more sense this way.
>
> It doesn't make more sense to me...
> I prefer to assert expected results right after the function call.

Oh well, if an error is expected then I get it. Is an error likely
here? I understood the comment says there can't be a file extent item
at offset (u64)-1 which implies a strict return value of 1 and not an
error or something >1. So that's why. And it's still quite after the
function call.

But I'm happy to scratch it if you don't like it.

> Thanks.
>
> >
> > Signed-off-by: Daniel Vacek <neelx@suse.com>
> > ---
> >  fs/btrfs/fiemap.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/btrfs/fiemap.c b/fs/btrfs/fiemap.c
> > index b80c07ad8c5e7..034f832e10c1a 100644
> > --- a/fs/btrfs/fiemap.c
> > +++ b/fs/btrfs/fiemap.c
> > @@ -568,10 +568,10 @@ static int fiemap_find_last_extent_offset(struct =
btrfs_inode *inode,
> >          * there might be preallocation past i_size.
> >          */
> >         ret =3D btrfs_lookup_file_extent(NULL, root, path, ino, (u64)-1=
, 0);
> > -       /* There can't be a file extent item at offset (u64)-1 */
> > -       ASSERT(ret !=3D 0);
> >         if (ret < 0)
> >                 return ret;
> > +       /* There can't be a file extent item at offset (u64)-1 */
> > +       ASSERT(ret =3D=3D 1);
> >
> >         /*
> >          * For a non-existing key, btrfs_search_slot() always leaves us=
 at a
> > --
> > 2.47.2
> >
> >
