Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2288717CA17
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747710078; cv=none; b=OGm5lIzY7s4XDIxDytPE4y+HTrziS50F4jYtyUACdwqqlryN0mwS8exfmjoHCYG/UNWTa1s/Dt37ys/TX6upBXIFLKx5HXJtqu8R6K/4ynf3cqHWK1TBmCWWSEbSG4EO0YCTs8jvD087wh3MOFmM+b7OzGOSmWaAqdnKucbKC6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747710078; c=relaxed/simple;
	bh=By7Yn2yxmnGDxuLuH0yfWAebcHTANMntBcq9/doce34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=jU/+lJ30wA+Tpm3bP0YpUOsOzn8JCx8EyT5NbAcl0Hhi5uluMfHyoBccVtHULmLAseYbrYGPL5S8/C+WaLL+2K//8WWIbH1SNJEq/NW0cAL7hDeUvLI3f8WL1dMK3Kc7VFdoYn5JkJ/TjkSesOwdgFxCtUtgIK5SQ2SXEDyy5qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZlPAvG5h; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZlPAvG5h"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so2629705b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747710075; x=1748314875; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FFTLhKAyAIq2pgDDlazli0BqEh5hG63gGYiklCQl28=;
        b=ZlPAvG5hZ23wBcRwSUcE36w6ZHf3XELMovDuuBbjxN0DgUVB2JKow/D0zjSsGToXLc
         dgbiM7RH1ZVe70A7OhD+R5Vx9c4yMHTpyrvIZ8F+/ihm2xpkAol2+ScmHj9OCGhjs2nc
         E5XAlymSQQVbNLJpyDzLx1OKC3iVTMT9YZaNfGhGho28Lu1SQHhkhQgH4V0VYIuT9tpM
         HOdqB7DLsrOzR0Wk1NhgKxg++/hTE0QPEyN4WIg5+6Uhc+oBkJMrCO2/MNMEvuWjKhUy
         UL8aIwpZadQcN/RJWn5IZmy1+jm+UDfPJLMHFuwwbvez8X78yfz4EczFfYGoiPkyyGzD
         uALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747710075; x=1748314875;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FFTLhKAyAIq2pgDDlazli0BqEh5hG63gGYiklCQl28=;
        b=UrgxojYfhPekvwfrmhu2G5hQhlNNOoHKd8UEuEbqG35Puct7wjqlvAjMR6paOY3Cky
         khmyAge5jcwr1n90WG6TOpMsaaIdwSCksL04oq/S6qCyTqdmYPoqP58avazKXfu+LfNn
         dbzZeNoXRyl3sy6UsiVz0pxJLgzklS3H+M2RYxcMmUFGWI421BgdR2LTPTsD03mM+Ued
         T0+SmMLMhy0fNypTWVtbRYVuv+qQHUN69bs+jNR56feNVAt8XVk+5X+Ff20vfTXK7KS2
         gx4XfWDUP4aOFc/Et+jos+9WbcO4MQQPldv5DsYDW3xRJZhsZKB+s2YnKDTcnYd2r4z2
         XlVw==
X-Forwarded-Encrypted: i=1; AJvYcCXpGH3YAEa6DOV8Kz4E/5cIfE3lT1GxUR0QJ8B+RraPxR9PrCayqsNtHdUWV+yOQhrs4ybf0D8B8v1qEPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtgtKUyLmqi1pemdW7pyUGZqBPnQm+JV5/hwSVlIQSG7qRRMR0
	RucTckUGGmL6Xc4oZ7wZkbkJp1/yB4i8KU7HxaG7UJY4yAnKIBVhNNIIx5nz9QEBPBF7HolBaPA
	ZnNaT4XuNm/6IcVPRm/RTgEsZVvauw+P8f3/XOBQ6MaujxFHD4qOapeNFzg==
X-Gm-Gg: ASbGncsHnV0KbpXfmRMjvO4qDMxYu8eCojIX8Py0uqRMGemknRNTCXlkhZ9DhPb03xf
	Wl0UFKyvyQJh8tGvW/hSxMD6JTP22TmVsyO+0yH0lLSNpCt8rmKuU8yFv2jGYwm1mLMGBE6EmNA
	KVPufA0So2I/1DnBNgBwXJVkq1oE5SHrP0P2xR0ZnH0QRofQ==
X-Google-Smtp-Source: AGHT+IGS+FekNktlVr2qoc5OQy9shoeTYsQUWA6b8sjkat088gtQG8oPZo0iUGir4U53OxZWqwQBEFwmJzO8EgsVoUc=
X-Received: by 2002:a05:6a00:6f57:b0:73d:b1ff:c758 with SMTP id
 d2e1a72fcca58-742a98abbecmr20097888b3a.18.1747710075339; Mon, 19 May 2025
 20:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209060422.1021512-1-zhangjian.3032@bytedance.com> <aCtkSBZfkc2k1jnb@shikoro>
In-Reply-To: <aCtkSBZfkc2k1jnb@shikoro>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Tue, 20 May 2025 11:01:04 +0800
X-Gm-Features: AX0GCFss8Ye3lgycBlu2I0Xeul8aS9tVUxjI2p9D-d5f_PAKqa10XuO8-j7pvfM
Message-ID: <CA+J-oUvJ39Sz6Yt-8N33vJU=W0K8nN1oBwGwEDyHbhh+=BZpRQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] i2c: slave-eeprom: add latch mode
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jian Zhang <zhangjian.3032@bytedance.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 1:03=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Mon, Dec 09, 2024 at 02:04:21PM +0800, Jian Zhang wrote:
> > The read operation is locked by byte, while the write operation is
> > locked by block (or based on the amount of data written). If we need to
> > ensure the integrity of a "block" of data that the other end can read,
> > then we need a latch mode, lock the buffer when a read operation is
> > requested.
>
> I don't really understand what you want to fix here. Does this patch
> really fix your issue because...

The scenario I=E2=80=99m dealing with:
* I=E2=80=99m using this driver to simulate an EEPROM device.
* One byte of the EEPROM content contains the CRC of the preceding data.
* Each time I update the EEPROM data, I use i2c_slave_eeprom_bin_write
to write the entire buffer, so the data in memory is always
consistent.
* I expect the I2C master (peer) to be able to perform a block read
and get the full, correct data including a valid CRC.

The problem I=E2=80=99ve encountered:
* In i2c_slave_eeprom_slave_cb, a block read from the master triggers
multiple callbacks, each returning one byte.
 This results in a sequence like:
 1. Master sends a write
 2. Master reads the first byte.
 3. The EEPROM buffer is updated.
 4, Master reads the second byte.

This may lead to a mismatch during a single block read,
where the master receives data that is partially from the,
 old buffer and partially from the new one=E2=80=94causing
CRC validation to fail.

>
> >       switch (event) {
> >       case I2C_SLAVE_WRITE_RECEIVED:
> > +             if (eeprom->latch) {
> > +                     spin_lock(&eeprom->buffer_lock);
> > +                     memcpy(eeprom->buffer_latch, eeprom->buffer, eepr=
om->bin.size);
> > +                     spin_unlock(&eeprom->buffer_lock);
> > +             }
>
> ... what advantage brings you this memcpy of the buffer to a latch after
> every single byte is received?

If you agree that the scenario I described earlier is a valid case
worth considering,
I make a copy of the buffer at the beginning of a write operation,
and then use this latched buffer for all subsequent reads until the
STOP condition.

Sorry, I think I placed the copy logic in the wrong spot earlier.
Perhaps it would be more appropriate to do it in the
I2C_SLAVE_WRITE_REQUESTED callback.

>
> > +     if (of_property_read_bool(client->adapter->dev.of_node, "use-latc=
h")) {
>
> If there really is a problem, we don't need a binding for it but should
> use the fix in all cases.
>
i got it, thanks.
