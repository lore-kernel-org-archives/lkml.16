Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C631DF246
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 17:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739122020; cv=none; b=U6Ah2k4mRpsCWjHsTcY5118R6Ld9uA/XwZYBaQeWVOCpXIvsHIO789RgMvliUuuBYSRGX2XDbrTdZVPdRfQS1PICCG+KxOwLHxb1m8Oo1kMc6MStEwIQoiaSKZT4dhZeYcJYZ4i1sbvYRiMAN7NoKiB1UpevoOjM50JQJv79+Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739122020; c=relaxed/simple;
	bh=3KG+Y83CXLaEOM15Q6WqOTQa9qBNTdeztebI0QCGVQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YmzzMl+5quP+vhEcBrqHSg6v2cf28ONBz7cjCADkdMpqrPSKzLG24F+UQRLFbq7kUv+sLct1lK+iobm7Poyxl20USD7pSACDgudK6n/99S7A/rgxi+cX6bZl1L6EOF1ozidu3BKcGHqDwr4SWY+H09A74PUOuDwjJJhcMcv/P/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=D/3trxRp; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="D/3trxRp"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7b7250256so81469566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 09:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739122017; x=1739726817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T7rWMyHpSr2s52jssq674Fk9xNbqQpwV6kSeNvyIkbA=;
        b=D/3trxRpVeZFZG/wfrIgj9tIJH3kCxbld7jP6JutWzWlg3dDD3rSNDaj+8M6/Zd71b
         QY+fICXdRoGLF98VNeIz8OZw1hgCdbLfqijVATvfxDhvew0AAmIA398z2YwUN1pnTvsE
         c3ooq/0Ga6uZhx/O2DYnUo/L1dwWSd80xubOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739122017; x=1739726817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7rWMyHpSr2s52jssq674Fk9xNbqQpwV6kSeNvyIkbA=;
        b=q+o+jOWBFaiLEdg1t845XZW8zSD/AOdVrxsfgv2fcWc4BCexdU70DgOIPnt4xmcajE
         cUmJhokG9lHI/VhFHUs2X94uViismM3MuDTH+JQp9Tntn+a3tpXJ5eHiZNOF+HBoLwKy
         onEyPccHGtdir7Sju/QZ+BXHKIj3IrkcPQt3M+eCHsjygprE5X4DvGQs+WCFQlI23qJn
         /IsHmSc0XXdDs4I5WXDjV1qOijl7TZRwZbmNjhV2ZCuXMcPEneD6F21JFemRlCo/gMjO
         MRa0tfQOhG47V5HyxP1X9Mpde4nCIL1pc7NHhltiE2Yr8z/7Oppt97WQ/6Zn0e/TEm1R
         kwHw==
X-Forwarded-Encrypted: i=1; AJvYcCV4WSa8JIeYjz8mR8q683zkI/B60eIc56sv7yy6loH9Fd9kkcSqFuYZvXx+ULUNl+2GGenalqPyY9A+vCE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza0O+JLOmeshC+m0T4hrLqFTZbCVvYwzuSJWCoc7WMmvkzxHSS
	fljmoLKpZGoJcJRA6n1rqjECs6NlirRjT8/U8UjzIHKEFo2dSXmlTyOtRJo/sqUEdg6HfLTIRuC
	4rSI=
X-Gm-Gg: ASbGnctgsn8598KFHYQ+LBV/mIZWYMA+PH8UUMlga8ZrOSgztcz3NN8yXAgeaptmCGk
	xbk6dYymSHgICHkJBZI0N0PzXfZcefpagHKpxIlCT6j56Xb8DOtp0EI/eo4l4SoswIfQXVJd0ps
	NyUKsrElqKeR31Nrxk0YyIDJ774DihTsGqzT5YlfKauqiMHDxsvh80R8s+/w8V1zHymEDJU0QM7
	Q02sQcz0KVSe5G3MlaK+MK3HZ9ukfPm2Kc2GnXLL9pXPvPoD47B0iArM2dRhLAWczm5s117VrcI
	SettC3mtote1YbqVgp6suHCQvaamOiPt5PKyNMk/ONXLfbKd0xryvEFo+Uhg0mKTXA==
X-Google-Smtp-Source: AGHT+IFXOIEEVUxZh5U0fSOyk2t30eYQ4HBsO5v2Gjc6p/sJ6S/chlRIZjbMa1f7zY7a0Heha3MeOA==
X-Received: by 2002:a17:907:3da7:b0:ab7:63fa:e4ab with SMTP id a640c23a62f3a-ab7897b252amr1163516166b.0.1739122015594;
        Sun, 09 Feb 2025 09:26:55 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ba97704dsm115950066b.107.2025.02.09.09.26.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 09:26:54 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de6e26d4e4so1258183a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 09:26:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3EIBqDR0ua2TetR1EzHGod7X+DzWt3Q59+rlOjeEiEGp1IrQOL9pGj0EM4iTRNRducaSDv/gk1Onx1Ss=@vger.kernel.org
X-Received: by 2002:a05:6402:3510:b0:5de:5947:ea35 with SMTP id
 4fb4d7f45d1cf-5de5947eab6mr8104437a12.25.1739122013840; Sun, 09 Feb 2025
 09:26:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209150718.GA17013@redhat.com> <20250209150749.GA16999@redhat.com>
In-Reply-To: <20250209150749.GA16999@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Feb 2025 09:26:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgYC-iAp4dw_wN3DBWUB=NzkjT42Dpr46efpKBuF4Nxkg@mail.gmail.com>
X-Gm-Features: AWEUYZkyMQnBA56VTx9VYyWlnOLvTM7NZ8JOwLDkeKyPyeGtE_WZK30npEYLfzM
Message-ID: <CAHk-=wgYC-iAp4dw_wN3DBWUB=NzkjT42Dpr46efpKBuF4Nxkg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pipe: change pipe_write() to never add a zero-sized buffer
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	David Howells <dhowells@redhat.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Mateusz Guzik <mjguzik@gmail.com>, 
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Oliver Sang <oliver.sang@intel.com>, 
	Swapnil Sapkal <swapnil.sapkal@amd.com>, WangYuli <wangyuli@uniontech.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Feb 2025 at 07:08, Oleg Nesterov <oleg@redhat.com> wrote:
>
> This is no longer necessary after c73be61cede5 ("pipe: Add general notification
> queue support"), pipe_write() checks pipe_has_watch_queue() and returns -EXDEV
> at the start. And can't help in any case, pipe_write() no longer takes this
> rd_wait.lock spinlock.

Ack. This code all goes back to the two-level locking thing with
notifications using just the spinlock side.

The locking was removed from this code in commit dfaabf916b1c
("fs/pipe: remove unnecessary spinlock from pipe_write()"), but the
"pre-allocate" logic remained.

This patch seems to be the right thing to do and removes the vestiges
of the old model.

But I don't think you need that pipe_buf_assert_len() thing.  And if
you do, please don't make it a pointless inline helper that only hides
what it does.

             Linus
