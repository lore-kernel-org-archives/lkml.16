Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36BB1F03EF
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122994; cv=none; b=JMwByXd4Yb3mJEEBOyPDykwZrycjNUrC0gmaHUwt4oWYXHdQqr+kc5/HI+HaMtWYDvqEsb3C7NrC0ThXck+t/AZBzFOm+izXfg5QymXn5NPqV2SrZ9VGb9HRHUhSXO5jbDn1JFmzKOrGp5Uaeeat/c7TAG1qVX8jRK4erv3yf6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122994; c=relaxed/simple;
	bh=cnkMu5oCFMiSzBa3AVjuxOSKMNcAcYdkL944p7VshLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEcvehyA8iOmFM1nwz+9Q5cUucJVhglwFNikOJP5FurmjohQDpu9TVzg0v8Cv5Fa6RwC/kt6GKjKjnmScIuljTODvF1iqkZ6WT8BI35oDps3XK8wZsNJf3+ibvj3Ohs1osjg7EryJFN6M9BFoBzO4WKFniLjBu7j6yiJoEUDEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gQCGUuIA; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gQCGUuIA"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad257009e81so282534366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 00:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747122991; x=1747727791; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cnkMu5oCFMiSzBa3AVjuxOSKMNcAcYdkL944p7VshLo=;
        b=gQCGUuIAB0vckebO/YAhntEg8kp/jBIELOynZWR2Gj6AmTUMD+eT4Qf+avRu2nrXsx
         Mzcpfs2rB+vjMe7HVmvN2vCH0XmsX3TLhq2ftj78xyLrchaVwqKb83upCj9TzKmhtkI3
         WKWGKaNOjp6UmJvmNXhciSK9CRYzb5qoZVgRsJDsYU9MWCh3bt/1JsOa3QdkB/3ySG6U
         wGSVyz4mJytG8FxbTYmlhZFlGK2YJHvnExqu+7XCAENTOPVgUtkNUyjn3ThBLvwqFaEE
         sn1CdtkwPqUt8XH3mfY8cDQritZ5ZpKRYbwqQS0mHgr/55x+nqarcA6wWp5sual6XXI4
         lNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747122991; x=1747727791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnkMu5oCFMiSzBa3AVjuxOSKMNcAcYdkL944p7VshLo=;
        b=pmL9Uykk5pTjQz2T/+8v/KYwJ8ytOcAaU2QLQ5COYpFIuvG+s74soh9C7z2bfhyFcs
         WT/Hu/GUX7zY3t6VV3zKaomTVhQw3ypKgczL4N7h0crPzVUT2bGck6H/HVN5ea7kXwLS
         T8CFM+XNWNHOXLbQAb4Os/hbpe/URHxRbAAg4cLqcEcH/eZYzo4PL2y3ib3fXU8jEL95
         F20Y2kWdUuxuXkOFy5DW49IzDcuknioUIZuSXylN4vU6HqaoJJMaS+APu+srRPZqA2Px
         d0hHiL2LkhxVdhZOxF8Fr3IsdwyTPs2xRmdvNpZk+HhjI+6uXBIhxX2cB7OBM378tjkU
         lblg==
X-Forwarded-Encrypted: i=1; AJvYcCW/hc0UHRfRO+FRe2ylYYeL3JnIL0exyJgsj80SUXXoojOmXGNXLR0m5qoreZmfGMUjHOvyt+7g/oIThvc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9wKmzpM39ksLBPHeaNpG0IC2FFV15o6Vq/+OKkvRYffKHJNio
	WshfNRRUk+0aFgtDOCSFXyOrvYEXJTDy7UMU9VieEdGR92pq05cTpjdMnDO7sJuA+ANUyMbnk/r
	maI/zwwzEasxlpMPv/9YfmxwpfQz7NMdtDmBRfg==
X-Gm-Gg: ASbGncsMRAuB0p2mh7dkYrcFx8Ve4VONqzePlFqgcAA3Y8My5EdsEP7MrWVGT6AnIc9
	DQWoKbT3RddtjlqMs0DnkqHD0WH60up5qhdp34+EfH9lVcMvSxzDafokzNg/vJNMolaetdPC/Mt
	BAK05I3rfzFvEZjK0WmwRxKNNOLFsX568=
X-Google-Smtp-Source: AGHT+IFJI9hdMV6hAewKZftLl2SoQHSQnEdKlwrGjnbITK4p/PXnm5IkDzMqjMhrmKQK9w7BHsbAuo0j8X+RoKl2tuI=
X-Received: by 2002:a17:907:7f9e:b0:ad2:411b:589e with SMTP id
 a640c23a62f3a-ad2411b5dbbmr1156939466b.43.1747122990887; Tue, 13 May 2025
 00:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512172321.3004779-1-neelx@suse.com> <20250512202054.GX9140@twin.jikos.cz>
In-Reply-To: <20250512202054.GX9140@twin.jikos.cz>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 13 May 2025 09:56:19 +0200
X-Gm-Features: AX0GCFsbgj_0szCc91JboGYVfsMCwSyO2B3kcMKbZ6A7qCjASns5X9FYdSjlXAM
Message-ID: <CAPjX3Fe1izCGUJhTWk1mB=9uK7kNHeCOj51_TZQG7DOe_aooig@mail.gmail.com>
Subject: Re: [PATCH] btrfs: index buffer_tree using node size
To: dsterba@suse.cz
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 May 2025 at 22:20, David Sterba <dsterba@suse.cz> wrote:
>
> On Mon, May 12, 2025 at 07:23:20PM +0200, Daniel Vacek wrote:
> > So far we are deriving the buffer tree index using the sector size. But each
> > extent buffer covers multiple sectors. This makes the buffer tree rather sparse.
> >
> > For example the typical and quite common configuration uses sector size of 4KiB
> > and node size of 16KiB. In this case it means the buffer tree is using up to
> > the maximum of 25% of it's slots. Or in other words at least 75% of the tree
> > slots are wasted as never used.
> >
> > We can score significant memory savings on the required tree nodes by indexing
> > the tree using the node size instead. As a result far less slots are wasted
> > and the tree can now use up to all 100% of it's slots this way.
>
> This looks interesting. Is there a way to get xarray stats? I don't see
> anything in the public API, e.g. depth, fanout, slack per level. For
> debugging purposes we can put it to sysfs or as syslog message,
> eventually as non-debugging output to commit_stats.

I'm using a python script in crash (even live on my laptop). I believe
you could do the same in dragon. Though that's not the runtime stats
you described. And I don't really think it's worth it.
