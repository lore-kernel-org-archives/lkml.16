Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074722BE64A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 19:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751485904; cv=none; b=KRUVg+PkPbuub6Dkou3IS/AkE7PtHcNR0fdu+vbn2p/Tl3TGokU+qy3A7e+Jn2fD02i0mbmFev8VW4BjzYSVHt3x6qhX31nRfdNIKcdjy9DiZV2XpurUcLPTa9ac/orEseGiauBuPIloK9SLc+FqoYjnXWfY4gBbOScmE3R1rPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751485904; c=relaxed/simple;
	bh=s084wtR88k+Zm0T48J86wDm0Hr7gnC1awK4eSCCArW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dLIjefWXU6K2RRu4hJAY22cFvvaKg6k/gf3O6CxNbRblFLkmedX4BvNEJEbMA3k/7WPsQaZ/4+hQvPh0bf95jwZjOgjObb3KrR/Sz5PepLIMcPtydhUMS6KxVfdJtcSJbPYW8k0Zaae7e1wrH9BjOtuBH64NREnNT+odvUTa404=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=QUHkN5Iy; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="QUHkN5Iy"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-237f5c7f4d7so8618445ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1751485900; x=1752090700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FztTel//e5oyaa7vSr+Ve5ZZ9B/kFDNC6EmcHFeFbgE=;
        b=QUHkN5Iywct1or5wb2t3ssdRk8eTVsaWTmsS4Ap4npa7wXD47/p1UC8VpWb7s/t2pk
         jWUU0xjgQdLmyVbtVcsOBKatgYYT6keeN8X8E0812GQ/wC+iWbxzPTzGwL6dIDL+NHrN
         hzJO3Q7ibV0Hi0MrNNcHnrIwfWxT6gGKs/EvRVgSu/doAFCHmCsyQ6Il5307C4hu/JGu
         leDzC1nNzwrSesoWI/JtgcfiDgUWCldox/r+vXzmS2EM0na8OB4SFSILY7Q4PAGVLis+
         RnsMFvcp+rm4FhqTIe6bD+YAJuhyX9mRvt0Q15/Oxu+ocxqx68bd7dywHEaZp8RWp7g4
         oVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751485900; x=1752090700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FztTel//e5oyaa7vSr+Ve5ZZ9B/kFDNC6EmcHFeFbgE=;
        b=rIaiogq9HouyvRpHbgVxV/LTILRlSRgGDog/bPNsV47Z7zlRKENQ9RyFLaIGHpkwv+
         +FRlykphktnOudlaGIa0TG7QYo9R75eq+6mCWpg47or8qCVxbFtaa4pGs/wruNkdrwJJ
         6rUFn+jov92QA7u1UKbk7xATiW6nhByj+nDJH8PUoXoo8fPAWz3dttDMGAZ2N8QNhX/r
         I6UzY9znuf8g0SPuXMwoSWx4F2AMv3qYrfeLqZ9XuoEgt7tNHl6r8yzSxwncu5T4ZjON
         F73D9eRVnXltHW2qmCQCbTl2QaiAJ36Hle2RMD9UdSz1CURrlD08XwmVc2B7l3Uz1oDB
         kydg==
X-Forwarded-Encrypted: i=1; AJvYcCUpnGwp3ZZBwxi0a9lR+kFrATCBrPi52oCv+1iQk8tQGwm6lCjRPcPFqmfNdLAwDIfyir8OI4xl0ChBfgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwByPoSzeXtTb6sxVv2KFl+JsZgC4GQ4xWQn7nziMkxMqTGmIPN
	wQeyEpSmkN2mBtIXOap80QCMIhi5kmA/JmX0ELha4IXSL+cA9kvcn/9o3CnAdZ4w42JSnyLmFQx
	p96/KH5MvpRfqu7/lTtbwduuF6Qg5UT5onFj8tW+85Q==
X-Gm-Gg: ASbGncsxt+srZSSyiezJm4pY5fJAsYJX9ymStwp1Fhv7dPscEy6TevQcKVLrMksm09r
	wC5+D6ykvsW9JTTMlAwVMsMY3COkWXZzgxDHm7MIwP9MDVtahzApaEKQPXwEBN/TzKIHhfKTypV
	CSKb5krOFSMePaVR0I+M8hCzm0XEea7XjUaIIcrR9DHQB/7f7js2yQNQ==
X-Google-Smtp-Source: AGHT+IHzKax4rWzgTagFExREvUdZKzP7gz6GIK5OKEX/A1gv3DbccqXrJXg9Q79q2ToGLz5xqYGJ7FpbAJTwCWI+3ts=
X-Received: by 2002:a17:903:124d:b0:23c:5f36:46a6 with SMTP id
 d9443c01a7336-23c6fcea87bmr20535465ad.12.1751485900234; Wed, 02 Jul 2025
 12:51:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619192748.3602122-1-csander@purestorage.com>
 <20250619192748.3602122-4-csander@purestorage.com> <c83a2cb6-3486-4977-9e1e-abda015a4dad@kernel.dk>
In-Reply-To: <c83a2cb6-3486-4977-9e1e-abda015a4dad@kernel.dk>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 2 Jul 2025 15:51:28 -0400
X-Gm-Features: Ac12FXzYvCEJprNA84OmEAiR_yc-BbACnKsWI1JFO0q24cJQIzcr5F8BHED8eZ4
Message-ID: <CADUfDZr6A51QxVWw2hJF6_FZW7QYoUHwH-JtNEgmkAefMiUjqQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] btrfs/ioctl: store btrfs_uring_encoded_data in io_btrfs_cmd
To: Jens Axboe <axboe@kernel.dk>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	Mark Harmstone <maharmstone@fb.com>, linux-btrfs@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 3:06=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
>
> > @@ -4811,11 +4813,15 @@ static int btrfs_uring_encoded_read(struct io_u=
ring_cmd *cmd, unsigned int issue
> >       loff_t pos;
> >       struct kiocb kiocb;
> >       struct extent_state *cached_state =3D NULL;
> >       u64 start, lockend;
> >       void __user *sqe_addr;
> > -     struct btrfs_uring_encoded_data *data =3D io_uring_cmd_get_async_=
data(cmd)->op_data;
> > +     struct io_btrfs_cmd *bc =3D io_uring_cmd_to_pdu(cmd, struct io_bt=
rfs_cmd);
> > +     struct btrfs_uring_encoded_data *data =3D NULL;
> > +
> > +     if (cmd->flags & IORING_URING_CMD_REISSUE)
> > +             data =3D bc->data;
>
> Can this be a btrfs io_btrfs_cmd specific flag? Doesn't seem like it
> would need to be io_uring wide.

Maybe. But where are you thinking it would be stored? I don't think
io_uring_cmd's pdu field would work because it's not initialized
before the first call to ->uring_cmd(). That's the whole reason I
needed to add a flag to tell whether this was the first call to
->uring_cmd() or a subsequent one.
I also put the flag in the uring_cmd layer because that's where
op_data was defined. Even though btrfs is the only current user of
op_data, it seems like it was intended as a generic mechanism that
other ->uring_cmd() implementations might want to use. It seems like
the same argument would apply to this flag.
Thoughts?

Best,
Caleb
