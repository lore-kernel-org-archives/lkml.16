Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74201FDD
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751251517; cv=none; b=ACNV6+ro8YoUEuCIGaOyrH5byOCgqVO/Rid2f6aY0LnjnGWMOsIXwbOr4zdnQKbQlxoVDRLl5yYBh486aqoL3pM8Wf9eibl0hKIBfeyuS2Uh/xBU4WsS1HHGnsOA866h4OfomnLSCYxazo+tja3ZZURKOdHkNTdYdIqv6u0D1ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751251517; c=relaxed/simple;
	bh=Vo6W5GRQ6H3qzWX3UombAMvAKBGTLOzp6x+XKizs6RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuSJarqtK0P0MSHoponZJsHKAzbSnlePYQB/xU5b9Uk7oX6XRzdxA33sVJ8ohkBfccwqrJo4qUkIAyEMtRQjHlSZsQ2YwfWS/2oVq/Yu50d07WSp81JpyIjmmDzdRyM2jmo0gAb9cOFPxKUHh2yEs2I4td2LIUzNBIwxqV20jLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEsPsqmO; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEsPsqmO"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso3871224a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 19:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751251515; x=1751856315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1IpcXOgS4DRYfBKMIVCF0qH9xXAuT76wTmWAshDnkkU=;
        b=DEsPsqmOdbhPwq+vFadQH09JYUyAtTlA7AqNuo9rLEWLt5aqUC3jwgrtQlBLlmgFmG
         s72fIVM4J2DsVwABTWeQS3qz5xouOPp03ekCPtYx7gwF10Q5WgO+X0cNpEWldNOt1XnU
         4kK+JkTqDrR+ifRWVlbho2ei6SBKcjxvI7sAKTmS9BBCxCLhr2HNVIUWzlx7wTn5NVS4
         42t0+QFJ21dVtOXs43c7uJTFp+frZzUZR5G1tNNm0ldT9IPZ5D+nUhAPkYMNw4JbZU3M
         XVbtxfQbHVTuaTBzIVGPM09UE4keqfeVumaE1l9RHHQPHA3ISgiZ3+F8uvEVAEZU9At4
         b54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751251515; x=1751856315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IpcXOgS4DRYfBKMIVCF0qH9xXAuT76wTmWAshDnkkU=;
        b=K3AFQ+6MUI+glHz6KlYyxSHx8bprZ9vZH5K6uM80w3TjzUEyiFbXsmyw9HZu4yX2SA
         6iMHZLOZ6ZQqHxcl0RkYCScBkReml3q1gVP1+v7x9ulrLURZYI82+Qzpb9aQQ9InwqKt
         6JD+pzIiCxtndDVmHWUnGRADhYrfxRfGNo1aKsekaMP86rhQ0VOY6Ip/jP2NODTnUWr0
         FS4JZJvIoMHIHapfANZ3oJmGmDh8DUS8a58XimPFKFs0iSAJKsZDYygrh/SshGqNX+SA
         zJy9qLeh0WcHkAZ196gZbfnsHNNou45bV4aJGmJKgbEGJ1yE1It3aDD7FrD5IUSjnw0r
         bF5w==
X-Forwarded-Encrypted: i=1; AJvYcCWLhmE8fxz8mmiAVMcxCAyfbLnxlcXY9b3BXE5COnnAjJzwbRnxd4C16A8Ox9+KGFrBBYA/qqJKZJ1Ig3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP99EVqojTZkhKMzZ1y7/r3ClDnzU3Qm0Hlo8VkNez73DirQMI
	hQV6v+UqjPYHbELBkEE7a/x+S0ba2IgMCVPs08hTFJ0Mb2Wgthg0aiGL
X-Gm-Gg: ASbGnctzwaaRIPkTX5HqNOwsVSqvniT2G3NLbX8BjVqSBYmHJkiBG+rqsVPO6U9O2f+
	bARSyZJIJ2hbEnWiYZ0n6TP4Kb1T8X1H4NsApC0nQlELWCR4R1vAuHcJ6kXcwuUW6c0tCvKCq42
	O8Wk2didqTG7wZ1f8u0m6HsP+qE4c2Wq4P17s2tBqtxfBWyQJ3Ewp9ryndnnsCKpQwX2baWCdxC
	odQ94k0A2y6O6f09QUASlwW4sDrFAjOkEPBT8hUjtvnpj06vyRcQXBlYBJaqUv3A9ybL7QYyTnT
	7ql63NjqbUNAkMoFSHAF9OFc32wOwmbmDrZqkyU2vWhi0/QwDkhdkIBC4LtAY4I7mxdOFNkHoi2
	VDD2WY3RnsYfw
X-Google-Smtp-Source: AGHT+IGxYHOEoC7d9V3SX/9r0y0UZ4hPGyESGJPZAar/1QHd0h4+Cd1lUvfxijoo2AT1Y37w59s1Hw==
X-Received: by 2002:a05:6a21:6d8f:b0:220:396b:991e with SMTP id adf61e73a8af0-220a16c98efmr17264682637.32.1751251515038;
        Sun, 29 Jun 2025 19:45:15 -0700 (PDT)
Received: from ipravd-Nitro-AN515-55 ([2601:646:a000:5fc0:84f2:7459:db60:b146])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3008e2esm6899030a12.16.2025.06.29.19.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 19:45:14 -0700 (PDT)
Date: Sun, 29 Jun 2025 22:45:12 -0400
From: Ivan Pravdin <ipravdin.official@gmail.com>
To: Heming Zhao <heming.zhao@suse.com>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, mark@fasheh.com, jlbec@evilplan.org, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: syzbot+20282c1b2184a857ac4c@syzkaller.appspotmail.com
Subject: Re: [PATCH] ocfs2: Avoid NULL pointer dereference in
 dx_dir_lookup_rec()
Message-ID: <f5qcns4xuba3r52cmqoiwdfveyv3xez7zhohq64ktcswjw2otk@qoqlu7ui5yp4>
References: <20250627023830.150291-1-ipravdin.official@gmail.com>
 <d6c72ab8-d600-4cc2-9609-8b749b61703d@linux.alibaba.com>
 <d6a11613-9763-4d9a-b4ad-5f451f770b70@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6a11613-9763-4d9a-b4ad-5f451f770b70@suse.com>

On Mon, Jun 30, 2025 at 10:32:35AM GMT, Heming Zhao wrote:
> On 6/30/25 09:26, Joseph Qi wrote:
> > Hi,
> > 
> > 
> > On 2025/6/27 10:38, Ivan Pravdin wrote:
> > > When a directory entry is not found, ocfs2_dx_dir_lookup_rec() prints an
> > > error message that unconditionally dereferences the 'rec' pointer.
> > > However, if 'rec' is NULL, this leads to a NULL pointer dereference and
> > > a kernel panic.
> > > 
> > 
> > This looks possible, but syzbot reports slab-out-of-bounds Read in
> > ocfs2_dx_dir_lookup_rec(), not NULL pointer dereference.
> > 
> > So I think it is because it construct a malicious image and set a wrong
> > l_recs, then access this damaged l_recs.
> > 
> > Thanks,
> > Joseph
> 
> I think this proposed fix (at least the fix method) is acceptable.
> the crash occurs at ocfs2_error(), where the pointer 'rec' must be incorrect.
> look back at the previous code lines:
>         for (i = le16_to_cpu(el->l_next_free_rec) - 1; i >= 0; i--) {
>                 rec = &el->l_recs[i];
> 
>                 if (le32_to_cpu(rec->e_cpos) <= major_hash) {
>                         found = 1;
>                         break;
>                 }
>         }
> 
> either 'el->l_next_free_rec' or 'el->l_recs[i]' has an incorrect value.
> we can do nothing about this kind of error, simply returning errno to caller is sufficient.
> 
> btw, ocfs2-tools has a similar function "static errcode_t ocfs2_dx_dir_lookup_rec()"@libocfs2/dir_indexed.c, which sets ret with OCFS2_ET_CORRUPT_EXTENT_BLOCK and return.

Thanks, I will include it in v2.

> 
> - Heming
> 
> > 
> > 
> > > Add an explicit check for a NULL 'rec' and use an alternate error
> > > message in that case to avoid unsafe access.
> > > 
> > > Reported-by: syzbot+20282c1b2184a857ac4c@syzkaller.appspotmail.com
> > > Closes: https://lore.kernel.org/all/67483b75.050a0220.253251.007c.GAE@google.com/T/
> > > Signed-off-by: Ivan Pravdin <ipravdin.official@gmail.com>
> > > ---
> > >   fs/ocfs2/dir.c | 16 +++++++++++-----
> > >   1 file changed, 11 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/fs/ocfs2/dir.c b/fs/ocfs2/dir.c
> > > index 7799f4d16ce9..dccf0349e523 100644
> > > --- a/fs/ocfs2/dir.c
> > > +++ b/fs/ocfs2/dir.c
> > > @@ -809,11 +809,17 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
> > >   	}
> > >   	if (!found) {
> > > -		ret = ocfs2_error(inode->i_sb,
> > > -				  "Inode %lu has bad extent record (%u, %u, 0) in btree\n",
> > > -				  inode->i_ino,
> > > -				  le32_to_cpu(rec->e_cpos),
> > > -				  ocfs2_rec_clusters(el, rec));
> > > +		if (rec) {
> > > +			ret = ocfs2_error(inode->i_sb,
> > > +					"Inode %lu has bad extent record (%u, %u, 0) in btree\n",
> > > +					inode->i_ino,
> > > +					le32_to_cpu(rec->e_cpos),
> > > +					ocfs2_rec_clusters(el, rec));
> > > +		} else {
> > > +			ret = ocfs2_error(inode->i_sb,
> > > +					"Inode %lu has no extent records in btree\n",
> > > +					inode->i_ino);
> > > +		}
> > >   		goto out;
> > >   	}
> > 
> > 
> 

	Ivan Pravdin
